@interface VCPProtoMovieStabilizationResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)gyroStabilization;
- (BOOL)hasRecipeBlob;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)recipeBlob;
- (float)analysisConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnalysisConfidence:(float)a3;
- (void)setGyroStabilization:(BOOL)a3;
- (void)setRecipeBlob:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieStabilizationResult

- (BOOL)hasRecipeBlob
{
  return self->_recipeBlob != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieStabilizationResult;
  v4 = [(VCPProtoMovieStabilizationResult *)&v8 description];
  v5 = [(VCPProtoMovieStabilizationResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_analysisConfidence;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"analysisConfidence"];

  v6 = [NSNumber numberWithBool:self->_gyroStabilization];
  [v3 setObject:v6 forKey:@"gyroStabilization"];

  recipeBlob = self->_recipeBlob;
  if (recipeBlob) {
    [v3 setObject:recipeBlob forKey:@"recipeBlob"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieStabilizationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteBOOLField();
  if (self->_recipeBlob) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_analysisConfidence);
  *((unsigned char *)a3 + 24) = self->_gyroStabilization;
  recipeBlob = self->_recipeBlob;
  if (recipeBlob) {
    [a3 setRecipeBlob:recipeBlob];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v5 + 8) = self->_analysisConfidence;
  *(unsigned char *)(v5 + 24) = self->_gyroStabilization;
  uint64_t v6 = [(NSData *)self->_recipeBlob copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_analysisConfidence != *((float *)v4 + 2))
  {
    goto LABEL_8;
  }
  if (self->_gyroStabilization)
  {
    if (*((unsigned char *)v4 + 24)) {
      goto LABEL_5;
    }
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 24)) {
    goto LABEL_8;
  }
LABEL_5:
  recipeBlob = self->_recipeBlob;
  if ((unint64_t)recipeBlob | *((void *)v4 + 2)) {
    char v6 = -[NSData isEqual:](recipeBlob, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  float analysisConfidence = self->_analysisConfidence;
  float v4 = -analysisConfidence;
  if (analysisConfidence >= 0.0) {
    float v4 = self->_analysisConfidence;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  float v7 = fmodf(v5, 1.8447e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0) {
    unint64_t v12 = v10;
  }
  else {
    unint64_t v12 = v9;
  }
  BOOL gyroStabilization = self->_gyroStabilization;
  return (2654435761 * gyroStabilization) ^ v12 ^ [(NSData *)self->_recipeBlob hash];
}

- (void)mergeFrom:(id)a3
{
  self->_float analysisConfidence = *((float *)a3 + 2);
  self->_BOOL gyroStabilization = *((unsigned char *)a3 + 24);
  if (*((void *)a3 + 2)) {
    -[VCPProtoMovieStabilizationResult setRecipeBlob:](self, "setRecipeBlob:");
  }
}

- (float)analysisConfidence
{
  return self->_analysisConfidence;
}

- (void)setAnalysisConfidence:(float)a3
{
  self->_float analysisConfidence = a3;
}

- (BOOL)gyroStabilization
{
  return self->_gyroStabilization;
}

- (void)setGyroStabilization:(BOOL)a3
{
  self->_BOOL gyroStabilization = a3;
}

- (NSData)recipeBlob
{
  return self->_recipeBlob;
}

- (void)setRecipeBlob:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"attributes"];
  float v4 = [v3 objectForKeyedSubscript:@"analysisConfidence"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"gyroStabilization"];
  float v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v8 = objc_alloc_init(VCPProtoMovieStabilizationResult);
    [v4 floatValue];
    -[VCPProtoMovieStabilizationResult setAnalysisConfidence:](v8, "setAnalysisConfidence:");
    -[VCPProtoMovieStabilizationResult setGyroStabilization:](v8, "setGyroStabilization:", [v6 BOOLValue]);
    uint64_t v9 = [v3 objectForKeyedSubscript:@"stabilizationRecipe"];
    unint64_t v10 = (void *)v9;
    if (v9) {
      [(VCPProtoMovieStabilizationResult *)v8 setRecipeBlob:v9];
    }
  }
  return v8;
}

- (id)exportToLegacyDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  float v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = NSNumber;
  [(VCPProtoMovieStabilizationResult *)self analysisConfidence];
  float v6 = objc_msgSend(v5, "numberWithFloat:");
  [v4 setObject:v6 forKeyedSubscript:@"analysisConfidence"];

  BOOL v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VCPProtoMovieStabilizationResult gyroStabilization](self, "gyroStabilization"));
  [v4 setObject:v7 forKeyedSubscript:@"gyroStabilization"];

  if ([(VCPProtoMovieStabilizationResult *)self hasRecipeBlob])
  {
    unint64_t v8 = [(VCPProtoMovieStabilizationResult *)self recipeBlob];
    [v4 setObject:v8 forKeyedSubscript:@"stabilizationRecipe"];
  }
  [v3 setObject:v4 forKeyedSubscript:@"attributes"];

  return v3;
}

@end