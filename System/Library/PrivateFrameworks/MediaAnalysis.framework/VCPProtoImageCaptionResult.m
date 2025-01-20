@interface VCPProtoImageCaptionResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)unsafeContent;
- (NSString)text;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setText:(id)a3;
- (void)setUnsafeContent:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoImageCaptionResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"attributes"];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"imageCaptionConfidence"];
    v6 = [v4 objectForKeyedSubscript:@"imageCaptionText"];
    uint64_t v7 = [v4 objectForKeyedSubscript:@"imageCaptionUnsafeContent"];
    v8 = (void *)v7;
    if (v5) {
      BOOL v9 = v6 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9 || v7 == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[VCPProtoImageCaptionResult] confidence, text or unsafeContent is missing", v14, 2u);
        }
      }
      v12 = 0;
    }
    else
    {
      v12 = objc_alloc_init(VCPProtoImageCaptionResult);
      [v5 floatValue];
      -[VCPProtoImageCaptionResult setConfidence:](v12, "setConfidence:");
      [(VCPProtoImageCaptionResult *)v12 setText:v6];
      -[VCPProtoImageCaptionResult setUnsafeContent:](v12, "setUnsafeContent:", [v8 BOOLValue]);
    }

LABEL_20:
    goto LABEL_21;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[VCPProtoImageCaptionResult] attribute is missing", buf, 2u);
    }
    v12 = 0;
    goto LABEL_20;
  }
  v12 = 0;
LABEL_21:

  return v12;
}

- (id)exportToLegacyDictionary
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = NSNumber;
  [(VCPProtoImageCaptionResult *)self confidence];
  v5 = objc_msgSend(v4, "numberWithFloat:");
  [v3 setObject:v5 forKeyedSubscript:@"imageCaptionConfidence"];

  v6 = [(VCPProtoImageCaptionResult *)self text];
  [v3 setObject:v6 forKeyedSubscript:@"imageCaptionText"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VCPProtoImageCaptionResult unsafeContent](self, "unsafeContent"));
  [v3 setObject:v7 forKeyedSubscript:@"imageCaptionUnsafeContent"];

  v10 = @"attributes";
  v11[0] = v3;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoImageCaptionResult;
  v4 = [(VCPProtoImageCaptionResult *)&v8 description];
  v5 = [(VCPProtoImageCaptionResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_confidence;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"confidence"];

  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  uint64_t v7 = [NSNumber numberWithBool:self->_unsafeContent];
  [v3 setObject:v7 forKey:@"unsafeContent"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageCaptionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_confidence);
  text = self->_text;
  v5 = a3;
  [v5 setText:text];
  v5[24] = self->_unsafeContent;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v5 + 8) = self->_confidence;
  uint64_t v6 = [(NSString *)self->_text copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(unsigned char *)(v5 + 24) = self->_unsafeContent;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_confidence == *((float *)v4 + 2)
    && ((text = self->_text, !((unint64_t)text | *((void *)v4 + 2)))
     || -[NSString isEqual:](text, "isEqual:")))
  {
    if (self->_unsafeContent) {
      BOOL v6 = v4[24] != 0;
    }
    else {
      BOOL v6 = v4[24] == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  float confidence = self->_confidence;
  float v4 = -confidence;
  if (confidence >= 0.0) {
    float v4 = self->_confidence;
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
  return [(NSString *)self->_text hash] ^ v11 ^ (2654435761 * self->_unsafeContent);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_float confidence = *((float *)v4 + 2);
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[VCPProtoImageCaptionResult setText:](self, "setText:");
    id v4 = v5;
  }
  self->_unsafeContent = *((unsigned char *)v4 + 24);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_float confidence = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (BOOL)unsafeContent
{
  return self->_unsafeContent;
}

- (void)setUnsafeContent:(BOOL)a3
{
  self->_unsafeContent = a3;
}

- (void).cxx_destruct
{
}

@end