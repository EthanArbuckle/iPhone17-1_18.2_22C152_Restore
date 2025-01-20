@interface VCPProtoVideoSegmentCaptionResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)text;
- (VCPProtoTimeRange)timeRange;
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
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoVideoSegmentCaptionResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v15, 0, sizeof(v15));
  CMTimeRangeMakeFromDictionary(&v15, v3);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  v5 = v4;
  if ((v15.start.flags & 1) != 0
    && (v15.duration.flags & 1) != 0
    && !v15.duration.epoch
    && (v15.duration.value & 0x8000000000000000) == 0
    && v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"videoCaptionConfidence"];
    uint64_t v7 = [v5 objectForKeyedSubscript:@"videoCaptionText"];
    v8 = (void *)v7;
    if (v6 && v7)
    {
      v9 = objc_alloc_init(VCPProtoVideoSegmentCaptionResult);
      CMTimeRange v13 = v15;
      v10 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v13];
      [(VCPProtoVideoSegmentCaptionResult *)v9 setTimeRange:v10];

      [v6 floatValue];
      -[VCPProtoVideoSegmentCaptionResult setConfidence:](v9, "setConfidence:");
      [(VCPProtoVideoSegmentCaptionResult *)v9 setText:v8];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[VCPProtoVideoSegmentCaptionResult] confidence or text is missing", buf, 2u);
        }
      }
      v9 = 0;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      v9 = 0;
      goto LABEL_21;
    }
    v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "[VCPProtoVideoSegmentCaptionResult] timerange is invalid or attribute is missing", buf, 2u);
    }
    v9 = 0;
  }

LABEL_21:
  return v9;
}

- (id)exportToLegacyDictionary
{
  CFDictionaryRef v3 = [(VCPProtoVideoSegmentCaptionResult *)self timeRange];
  v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  CMTimeRange range = v12;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = NSNumber;
  [(VCPProtoVideoSegmentCaptionResult *)self confidence];
  v9 = objc_msgSend(v8, "numberWithFloat:");
  [v7 setObject:v9 forKeyedSubscript:@"videoCaptionConfidence"];

  v10 = [(VCPProtoVideoSegmentCaptionResult *)self text];
  [v7 setObject:v10 forKeyedSubscript:@"videoCaptionText"];

  [v6 setObject:v7 forKeyedSubscript:@"attributes"];
  return v6;
}

- (id)description
{
  CFDictionaryRef v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoVideoSegmentCaptionResult;
  v4 = [(VCPProtoVideoSegmentCaptionResult *)&v8 description];
  CFDictionaryRef v5 = [(VCPProtoVideoSegmentCaptionResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    v6 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"timeRange"];
  }
  *(float *)&double v4 = self->_confidence;
  uint64_t v7 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v7 forKey:@"confidence"];

  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoVideoSegmentCaptionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  timeRange = self->_timeRange;
  CFDictionaryRef v5 = (float *)a3;
  [v5 setTimeRange:timeRange];
  v5[2] = self->_confidence;
  [v5 setText:self->_text];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(float *)(v5 + 8) = self->_confidence;
  uint64_t v8 = [(NSString *)self->_text copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[3]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_confidence == *((float *)v4 + 2))
  {
    text = self->_text;
    if ((unint64_t)text | v4[2]) {
      char v7 = -[NSString isEqual:](text, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  float confidence = self->_confidence;
  float v5 = -confidence;
  if (confidence >= 0.0) {
    float v5 = self->_confidence;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  float v8 = fmodf(v6, 1.8447e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabsf(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  return v12 ^ v3 ^ [(NSString *)self->_text hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 3);
  id v7 = v4;
  if (timeRange)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoVideoSegmentCaptionResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v7;
LABEL_7:
  self->_float confidence = *((float *)v4 + 2);
  if (*((void *)v4 + 2))
  {
    -[VCPProtoVideoSegmentCaptionResult setText:](self, "setText:");
    id v4 = v7;
  }
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
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
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end