@interface VCPProtoMovieSubjectMotionResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoTimeRange)timeRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieSubjectMotionResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieSubjectMotionResult;
  v4 = [(VCPProtoMovieSubjectMotionResult *)&v8 description];
  v5 = [(VCPProtoMovieSubjectMotionResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    v5 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeRange"];
  }
  v6 = [NSNumber numberWithBool:self->_hasAction];
  [v3 setObject:v6 forKey:@"hasAction"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieSubjectMotionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  timeRange = self->_timeRange;
  v5 = a3;
  [v5 setTimeRange:timeRange];
  v5[16] = self->_hasAction;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(unsigned char *)(v5 + 16) = self->_hasAction;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((void *)v4 + 1)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:")))
  {
    if (self->_hasAction) {
      BOOL v6 = v4[16] != 0;
    }
    else {
      BOOL v6 = v4[16] == 0;
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
  return (2654435761 * self->_hasAction) ^ [(VCPProtoTimeRange *)self->_timeRange hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 1);
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
    -[VCPProtoMovieSubjectMotionResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v7;
LABEL_7:
  self->_hasAction = *((unsigned char *)v4 + 16);
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (BOOL)hasAction
{
  return self->_hasAction;
}

- (void)setHasAction:(BOOL)a3
{
  self->_hasAction = a3;
}

- (void).cxx_destruct
{
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v10, 0, sizeof(v10));
  CMTimeRangeMakeFromDictionary(&v10, v3);
  uint64_t v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"flags"];
  uint64_t v5 = (void *)v4;
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
          uint64_t v6 = objc_alloc_init(VCPProtoMovieSubjectMotionResult);
          CMTimeRange v9 = v10;
          id v7 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v9];
          [(VCPProtoMovieSubjectMotionResult *)v6 setTimeRange:v7];

          -[VCPProtoMovieSubjectMotionResult setHasAction:](v6, "setHasAction:", ((unint64_t)[v5 unsignedIntegerValue] >> 17) & 1);
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
  CFDictionaryRef v3 = [(VCPProtoMovieSubjectMotionResult *)self timeRange];
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

  if ([(VCPProtoMovieSubjectMotionResult *)self hasAction]) {
    uint64_t v7 = 0x20000;
  }
  else {
    uint64_t v7 = 0;
  }
  objc_super v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v7, *(_OWORD *)&v10.start.value, *(_OWORD *)&v10.start.epoch, *(_OWORD *)&v10.duration.timescale);
  [v6 setObject:v8 forKeyedSubscript:@"flags"];

  return v6;
}

@end