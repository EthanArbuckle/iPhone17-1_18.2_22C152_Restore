@interface VCPProtoVideoCaptionResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
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
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoVideoCaptionResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoVideoCaptionResult;
  v4 = [(VCPProtoVideoCaptionResult *)&v8 description];
  v5 = [(VCPProtoVideoCaptionResult *)self dictionaryRepresentation];
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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoVideoCaptionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_confidence);
  [a3 setText:self->_text];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v5 + 8) = self->_confidence;
  uint64_t v6 = [(NSString *)self->_text copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_confidence == *((float *)v4 + 2))
  {
    text = self->_text;
    if ((unint64_t)text | v4[2]) {
      char v6 = -[NSString isEqual:](text, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
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
  return [(NSString *)self->_text hash] ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_float confidence = *((float *)a3 + 2);
  if (*((void *)a3 + 2)) {
    -[VCPProtoVideoCaptionResult setText:](self, "setText:");
  }
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

- (void).cxx_destruct
{
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"attributes"];
  float v4 = v3;
  if (v3)
  {
    float v5 = [v3 objectForKeyedSubscript:@"videoCaptionConfidence"];
    uint64_t v6 = [v4 objectForKeyedSubscript:@"videoCaptionText"];
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
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[VCPProtoVideoCaptionResult] confidence or text is missing", v12, 2u);
        }
      }
      unint64_t v10 = 0;
    }
    else
    {
      unint64_t v10 = objc_alloc_init(VCPProtoVideoCaptionResult);
      [v5 floatValue];
      -[VCPProtoVideoCaptionResult setConfidence:](v10, "setConfidence:");
      [(VCPProtoVideoCaptionResult *)v10 setText:v7];
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
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "[VCPProtoVideoCaptionResult] attribute is missing", buf, 2u);
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
  float v4 = NSNumber;
  [(VCPProtoVideoCaptionResult *)self confidence];
  float v5 = objc_msgSend(v4, "numberWithFloat:");
  [v3 setObject:v5 forKeyedSubscript:@"videoCaptionConfidence"];

  uint64_t v6 = [(VCPProtoVideoCaptionResult *)self text];
  [v3 setObject:v6 forKeyedSubscript:@"videoCaptionText"];

  unint64_t v9 = @"attributes";
  v10[0] = v3;
  float v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

@end