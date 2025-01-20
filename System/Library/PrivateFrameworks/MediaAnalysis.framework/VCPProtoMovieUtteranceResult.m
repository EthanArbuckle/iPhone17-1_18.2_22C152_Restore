@interface VCPProtoMovieUtteranceResult
+ (id)resultFromLegacyDictionary:(id)a3;
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
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieUtteranceResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieUtteranceResult;
  v4 = [(VCPProtoMovieUtteranceResult *)&v8 description];
  v5 = [(VCPProtoMovieUtteranceResult *)self dictionaryRepresentation];
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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieUtteranceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    timeRange = self->_timeRange;
    if ((unint64_t)timeRange | v4[1]) {
      char v6 = -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:");
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
  return [(VCPProtoTimeRange *)self->_timeRange hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = v4[1];
  if (timeRange)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[VCPProtoMovieUtteranceResult setTimeRange:](self, "setTimeRange:");
  }
  v4 = v7;
LABEL_7:
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  memset(&v7, 0, sizeof(v7));
  CMTimeRangeMakeFromDictionary(&v7, (CFDictionaryRef)a3);
  if (v7.start.flags)
  {
    v3 = 0;
    if ((v7.duration.flags & 1) != 0 && !v7.duration.epoch && (v7.duration.value & 0x8000000000000000) == 0)
    {
      v3 = objc_alloc_init(VCPProtoMovieUtteranceResult);
      CMTimeRange v6 = v7;
      v4 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v6];
      [(VCPProtoMovieUtteranceResult *)v3 setTimeRange:v4];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)exportToLegacyDictionary
{
  v2 = [(VCPProtoMovieUtteranceResult *)self timeRange];
  v3 = v2;
  if (v2) {
    [v2 timeRangeValue];
  }
  else {
    memset(&v6, 0, sizeof(v6));
  }
  CMTimeRange range = v6;
  CFDictionaryRef v4 = CMTimeRangeCopyAsDictionary(&range, 0);

  return v4;
}

@end