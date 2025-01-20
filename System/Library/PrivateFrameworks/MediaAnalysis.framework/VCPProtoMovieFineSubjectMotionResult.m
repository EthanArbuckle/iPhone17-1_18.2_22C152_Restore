@interface VCPProtoMovieFineSubjectMotionResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoTimeRange)timeRange;
- (float)actionScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionScore:(float)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieFineSubjectMotionResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieFineSubjectMotionResult;
  v4 = [(VCPProtoMovieFineSubjectMotionResult *)&v8 description];
  v5 = [(VCPProtoMovieFineSubjectMotionResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    v6 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"timeRange"];
  }
  *(float *)&double v4 = self->_actionScore;
  v7 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v7 forKey:@"actionScore"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieFineSubjectMotionResultReadFrom((uint64_t)self, (uint64_t)a3);
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
  v5 = (float *)a3;
  [v5 setTimeRange:timeRange];
  v5[2] = self->_actionScore;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(float *)(v5 + 8) = self->_actionScore;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((void *)v4 + 2)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_actionScore == *((float *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  float actionScore = self->_actionScore;
  float v5 = -actionScore;
  if (actionScore >= 0.0) {
    float v5 = self->_actionScore;
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
    -[VCPProtoMovieFineSubjectMotionResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v7;
LABEL_7:
  self->_float actionScore = *((float *)v4 + 2);
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (float)actionScore
{
  return self->_actionScore;
}

- (void)setActionScore:(float)a3
{
  self->_float actionScore = a3;
}

- (void).cxx_destruct
{
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v10, 0, sizeof(v10));
  CMTimeRangeMakeFromDictionary(&v10, v3);
  uint64_t v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"quality"];
  float v5 = (void *)v4;
  if (v10.start.flags)
  {
    uint64_t v6 = 0;
    if ((v10.duration.flags & 1) != 0 && !v10.duration.epoch)
    {
      uint64_t v6 = 0;
      if ((v10.duration.value & 0x8000000000000000) == 0)
      {
        if (v4)
        {
          uint64_t v6 = objc_alloc_init(VCPProtoMovieFineSubjectMotionResult);
          CMTimeRange v9 = v10;
          id v7 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v9];
          [(VCPProtoMovieFineSubjectMotionResult *)v6 setTimeRange:v7];

          [v5 floatValue];
          -[VCPProtoMovieFineSubjectMotionResult setActionScore:](v6, "setActionScore:");
        }
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)exportToLegacyDictionary
{
  CFDictionaryRef v3 = [(VCPProtoMovieFineSubjectMotionResult *)self timeRange];
  uint64_t v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  CMTimeRange range = v10;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  uint64_t v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  id v7 = NSNumber;
  [(VCPProtoMovieFineSubjectMotionResult *)self actionScore];
  unint64_t v8 = objc_msgSend(v7, "numberWithFloat:");
  [v6 setObject:v8 forKeyedSubscript:@"quality"];

  return v6;
}

@end