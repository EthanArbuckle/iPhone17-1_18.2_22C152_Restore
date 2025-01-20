@interface VCPProtoMovieApplauseResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
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
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieApplauseResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v10, 0, sizeof(v10));
  CMTimeRangeMakeFromDictionary(&v10, v3);
  uint64_t v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"quality"];
  v5 = (void *)v4;
  if (v10.start.flags)
  {
    v6 = 0;
    if ((v10.duration.flags & 1) != 0 && !v10.duration.epoch)
    {
      v6 = 0;
      if ((v10.duration.value & 0x8000000000000000) == 0)
      {
        if (v4)
        {
          v6 = objc_alloc_init(VCPProtoMovieApplauseResult);
          CMTimeRange v9 = v10;
          v7 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v9];
          [(VCPProtoMovieApplauseResult *)v6 setTimeRange:v7];

          [v5 floatValue];
          -[VCPProtoMovieApplauseResult setConfidence:](v6, "setConfidence:");
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)exportToLegacyDictionary
{
  CFDictionaryRef v3 = [(VCPProtoMovieApplauseResult *)self timeRange];
  uint64_t v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  CMTimeRange range = v10;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  v7 = NSNumber;
  [(VCPProtoMovieApplauseResult *)self confidence];
  v8 = objc_msgSend(v7, "numberWithFloat:");
  [v6 setObject:v8 forKeyedSubscript:@"quality"];

  return v6;
}

- (id)description
{
  CFDictionaryRef v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieApplauseResult;
  uint64_t v4 = [(VCPProtoMovieApplauseResult *)&v8 description];
  CFDictionaryRef v5 = [(VCPProtoMovieApplauseResult *)self dictionaryRepresentation];
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
  v7 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v7 forKey:@"confidence"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieApplauseResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  timeRange = self->_timeRange;
  CFDictionaryRef v5 = (float *)a3;
  [v5 setTimeRange:timeRange];
  v5[2] = self->_confidence;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(float *)(v5 + 8) = self->_confidence;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((void *)v4 + 2)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_confidence == *((float *)v4 + 2);

  return v6;
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
  unint64_t v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  unint64_t v9 = v8 + (unint64_t)v7;
  float v10 = fabsf(v7);
  if (v7 <= 0.0) {
    unint64_t v9 = v8;
  }
  unint64_t v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0) {
    unint64_t v11 = v9;
  }
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 2);
  if (timeRange)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[VCPProtoMovieApplauseResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v7;
LABEL_7:
  self->_float confidence = *((float *)v4 + 2);
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

- (void).cxx_destruct
{
}

@end