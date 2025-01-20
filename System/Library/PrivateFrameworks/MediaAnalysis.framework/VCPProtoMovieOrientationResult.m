@interface VCPProtoMovieOrientationResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoTimeRange)timeRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (int)orientation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setOrientation:(int)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieOrientationResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v11, 0, sizeof(v11));
  CMTimeRangeMakeFromDictionary(&v11, v3);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"orientation"];
  v6 = (void *)v5;
  if (v11.start.flags)
  {
    v7 = 0;
    if ((v11.duration.flags & 1) != 0 && !v11.duration.epoch)
    {
      v7 = 0;
      if ((v11.duration.value & 0x8000000000000000) == 0)
      {
        if (v5)
        {
          v7 = objc_alloc_init(VCPProtoMovieOrientationResult);
          CMTimeRange v10 = v11;
          v8 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v10];
          [(VCPProtoMovieOrientationResult *)v7 setTimeRange:v8];

          -[VCPProtoMovieOrientationResult setOrientation:](v7, "setOrientation:", [v6 intValue]);
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)exportToLegacyDictionary
{
  v13[1] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = [(VCPProtoMovieOrientationResult *)self timeRange];
  v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  CMTimeRange range = v10;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  v12 = @"orientation";
  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[VCPProtoMovieOrientationResult orientation](self, "orientation"));
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v6 setObject:v8 forKeyedSubscript:@"attributes"];

  return v6;
}

- (id)description
{
  CFDictionaryRef v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieOrientationResult;
  v4 = [(VCPProtoMovieOrientationResult *)&v8 description];
  CFDictionaryRef v5 = [(VCPProtoMovieOrientationResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  CFDictionaryRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  timeRange = self->_timeRange;
  if (timeRange)
  {
    CFDictionaryRef v5 = [(VCPProtoTimeRange *)timeRange dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"timeRange"];
  }
  v6 = [NSNumber numberWithInt:self->_orientation];
  [v3 setObject:v6 forKey:@"orientation"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieOrientationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  timeRange = self->_timeRange;
  CFDictionaryRef v5 = a3;
  [v5 setTimeRange:timeRange];
  v5[2] = self->_orientation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 8) = self->_orientation;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((void *)v4 + 2)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_orientation == *((_DWORD *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_orientation) ^ [(VCPProtoTimeRange *)self->_timeRange hash];
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
    -[VCPProtoMovieOrientationResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v7;
LABEL_7:
  self->_orientation = *((_DWORD *)v4 + 2);
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (int)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int)a3
{
  self->_orientation = a3;
}

- (void).cxx_destruct
{
}

@end