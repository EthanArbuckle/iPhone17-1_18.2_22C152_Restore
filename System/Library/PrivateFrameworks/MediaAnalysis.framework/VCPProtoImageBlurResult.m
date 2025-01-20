@interface VCPProtoImageBlurResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasFaceSharpness;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)faceSharpness;
- (float)sharpness;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFaceSharpness:(float)a3;
- (void)setHasFaceSharpness:(BOOL)a3;
- (void)setSharpness:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoImageBlurResult

- (void)setFaceSharpness:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_faceSharpness = a3;
}

- (void)setHasFaceSharpness:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFaceSharpness
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoImageBlurResult;
  v4 = [(VCPProtoImageBlurResult *)&v8 description];
  v5 = [(VCPProtoImageBlurResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_sharpness;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"sharpness"];

  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v6 = self->_faceSharpness;
    v7 = [NSNumber numberWithFloat:v6];
    [v3 setObject:v7 forKey:@"faceSharpness"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageBlurResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteFloatField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = LODWORD(self->_sharpness);
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = LODWORD(self->_faceSharpness);
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = LODWORD(self->_sharpness);
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_faceSharpness);
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_sharpness != *((float *)v4 + 3)) {
    goto LABEL_7;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_faceSharpness == *((float *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  float sharpness = self->_sharpness;
  float v4 = -sharpness;
  if (sharpness >= 0.0) {
    float v4 = self->_sharpness;
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
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    float faceSharpness = self->_faceSharpness;
    float v14 = -faceSharpness;
    if (faceSharpness >= 0.0) {
      float v14 = self->_faceSharpness;
    }
    float v15 = floorf(v14 + 0.5);
    float v16 = (float)(v14 - v15) * 1.8447e19;
    float v17 = fmodf(v15, 1.8447e19);
    unint64_t v18 = 2654435761u * (unint64_t)v17;
    unint64_t v19 = v18 + (unint64_t)v16;
    if (v16 <= 0.0) {
      unint64_t v19 = 2654435761u * (unint64_t)v17;
    }
    unint64_t v12 = v18 - (unint64_t)fabsf(v16);
    if (v16 >= 0.0) {
      unint64_t v12 = v19;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_float sharpness = *((float *)a3 + 3);
  if (*((unsigned char *)a3 + 16))
  {
    self->_float faceSharpness = *((float *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (float)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(float)a3
{
  self->_float sharpness = a3;
}

- (float)faceSharpness
{
  return self->_faceSharpness;
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"attributes"];
  float v4 = [v3 objectForKeyedSubscript:@"sharpness"];
  float v5 = [v3 objectForKeyedSubscript:@"sharpnessFaces"];
  if (v4)
  {
    float v6 = objc_alloc_init(VCPProtoImageBlurResult);
    [v4 floatValue];
    -[VCPProtoImageBlurResult setSharpness:](v6, "setSharpness:");
    if (v5)
    {
      [(VCPProtoImageBlurResult *)v6 setHasFaceSharpness:1];
      [v5 floatValue];
      -[VCPProtoImageBlurResult setFaceSharpness:](v6, "setFaceSharpness:");
    }
  }
  else
  {
    float v6 = 0;
  }

  return v6;
}

- (id)exportToLegacyDictionary
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  float v4 = NSNumber;
  [(VCPProtoImageBlurResult *)self sharpness];
  float v5 = objc_msgSend(v4, "numberWithFloat:");
  [v3 setObject:v5 forKeyedSubscript:@"sharpness"];

  if ([(VCPProtoImageBlurResult *)self hasFaceSharpness])
  {
    float v6 = NSNumber;
    [(VCPProtoImageBlurResult *)self faceSharpness];
    float v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"sharpnessFaces"];
  }
  unint64_t v10 = @"attributes";
  v11[0] = v3;
  unint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

@end