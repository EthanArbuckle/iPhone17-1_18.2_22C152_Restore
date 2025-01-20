@interface VCPProtoVideoCaptionPreferenceResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)preference;
- (BOOL)readFrom:(id)a3;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPreference:(BOOL)a3;
- (void)setScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoVideoCaptionPreferenceResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoVideoCaptionPreferenceResult;
  v4 = [(VCPProtoVideoCaptionPreferenceResult *)&v8 description];
  v5 = [(VCPProtoVideoCaptionPreferenceResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithBool:self->_preference];
  [v3 setObject:v4 forKey:@"preference"];

  *(float *)&double v5 = self->_score;
  v6 = [NSNumber numberWithFloat:v5];
  [v3 setObject:v6 forKey:@"score"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoVideoCaptionPreferenceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((unsigned char *)a3 + 12) = self->_preference;
  *((_DWORD *)a3 + 2) = LODWORD(self->_score);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 12) = self->_preference;
  *((_DWORD *)result + 2) = LODWORD(self->_score);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  if (!self->_preference)
  {
    if (!*((unsigned char *)v4 + 12)) {
      goto LABEL_4;
    }
LABEL_6:
    BOOL v5 = 0;
    goto LABEL_7;
  }
  if (!*((unsigned char *)v4 + 12)) {
    goto LABEL_6;
  }
LABEL_4:
  BOOL v5 = self->_score == *((float *)v4 + 2);
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  BOOL preference = self->_preference;
  float score = self->_score;
  float v4 = -score;
  if (score >= 0.0) {
    float v4 = self->_score;
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
  if (v6 >= 0.0) {
    unint64_t v10 = v9;
  }
  return v10 ^ (2654435761 * preference);
}

- (void)mergeFrom:(id)a3
{
  self->_BOOL preference = *((unsigned char *)a3 + 12);
  self->_float score = *((float *)a3 + 2);
}

- (BOOL)preference
{
  return self->_preference;
}

- (void)setPreference:(BOOL)a3
{
  self->_BOOL preference = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_float score = a3;
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"attributes"];
  float v4 = v3;
  if (v3)
  {
    float v5 = [v3 objectForKeyedSubscript:@"videoCaptionPreference"];
    uint64_t v6 = [v4 objectForKeyedSubscript:@"videoCaptionPreferenceScore"];
    float v7 = (void *)v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        unint64_t v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[VCPProtoVideoCaptionPreferenceResult] preference or score is missing", v12, 2u);
        }
      }
      unint64_t v10 = 0;
    }
    else
    {
      unint64_t v10 = objc_alloc_init(VCPProtoVideoCaptionPreferenceResult);
      [(VCPProtoVideoCaptionPreferenceResult *)v10 setPreference:[v5 BOOLValue]];
      [v7 floatValue];
      -[VCPProtoVideoCaptionPreferenceResult setScore:](v10, "setScore:");
    }

LABEL_17:
    goto LABEL_18;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    float v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[VCPProtoVideoCaptionPreferenceResult] attribute is missing", buf, 2u);
    }
    unint64_t v10 = 0;
    goto LABEL_17;
  }
  unint64_t v10 = 0;
LABEL_18:

  return v10;
}

- (id)exportToLegacyDictionary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  float v4 = objc_msgSend(NSNumber, "numberWithBool:", -[VCPProtoVideoCaptionPreferenceResult preference](self, "preference"));
  [v3 setObject:v4 forKeyedSubscript:@"videoCaptionPreference"];

  float v5 = NSNumber;
  [(VCPProtoVideoCaptionPreferenceResult *)self score];
  uint64_t v6 = objc_msgSend(v5, "numberWithFloat:");
  [v3 setObject:v6 forKeyedSubscript:@"videoCaptionPreferenceScore"];

  unint64_t v9 = @"attributes";
  v10[0] = v3;
  float v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

@end