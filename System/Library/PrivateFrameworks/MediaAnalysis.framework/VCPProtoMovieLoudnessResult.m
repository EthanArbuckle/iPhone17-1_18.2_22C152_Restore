@interface VCPProtoMovieLoudnessResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoTimeRange)timeRange;
- (double)energy;
- (double)peak;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEnergy:(double)a3;
- (void)setPeak:(double)a3;
- (void)setTimeRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoMovieLoudnessResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  CFDictionaryRef v3 = (const __CFDictionary *)a3;
  memset(&v13, 0, sizeof(v13));
  CMTimeRangeMakeFromDictionary(&v13, v3);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"attributes"];
  v5 = [v4 objectForKeyedSubscript:@"energyValues"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"peakValues"];
  v7 = (void *)v6;
  if (v13.start.flags)
  {
    v8 = 0;
    if ((v13.duration.flags & 1) != 0 && !v13.duration.epoch)
    {
      v8 = 0;
      if ((v13.duration.value & 0x8000000000000000) == 0 && v5 && v6 != 0)
      {
        v8 = objc_alloc_init(VCPProtoMovieLoudnessResult);
        CMTimeRange v12 = v13;
        v10 = +[VCPProtoTimeRange timeRangeWithCMTimeRange:&v12];
        [(VCPProtoMovieLoudnessResult *)v8 setTimeRange:v10];

        [v5 doubleValue];
        -[VCPProtoMovieLoudnessResult setEnergy:](v8, "setEnergy:");
        [v7 doubleValue];
        -[VCPProtoMovieLoudnessResult setPeak:](v8, "setPeak:");
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)exportToLegacyDictionary
{
  v16[2] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v3 = [(VCPProtoMovieLoudnessResult *)self timeRange];
  v4 = v3;
  if (v3) {
    [v3 timeRangeValue];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CMTimeRange range = v13;
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  uint64_t v6 = (void *)[(__CFDictionary *)v5 mutableCopy];

  v15[0] = @"energyValues";
  v7 = NSNumber;
  [(VCPProtoMovieLoudnessResult *)self energy];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v16[0] = v8;
  v15[1] = @"peakValues";
  v9 = NSNumber;
  [(VCPProtoMovieLoudnessResult *)self peak];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v16[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v6 setObject:v11 forKeyedSubscript:@"attributes"];

  return v6;
}

- (id)description
{
  CFDictionaryRef v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieLoudnessResult;
  v4 = [(VCPProtoMovieLoudnessResult *)&v8 description];
  CFDictionaryRef v5 = [(VCPProtoMovieLoudnessResult *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

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
  uint64_t v6 = [NSNumber numberWithDouble:self->_energy];
  [v3 setObject:v6 forKey:@"energy"];

  v7 = [NSNumber numberWithDouble:self->_peak];
  [v3 setObject:v7 forKey:@"peak"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieLoudnessResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  timeRange = self->_timeRange;
  CFDictionaryRef v5 = (double *)a3;
  [v5 setTimeRange:timeRange];
  v5[1] = self->_energy;
  v5[2] = self->_peak;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoTimeRange *)self->_timeRange copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(double *)(v5 + 8) = self->_energy;
  *(double *)(v5 + 16) = self->_peak;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((void *)v4 + 3)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_energy == *((double *)v4 + 1)
    && self->_peak == *((double *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoTimeRange *)self->_timeRange hash];
  double energy = self->_energy;
  double v5 = -energy;
  if (energy >= 0.0) {
    double v5 = self->_energy;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  double peak = self->_peak;
  double v14 = -peak;
  if (peak >= 0.0) {
    double v14 = self->_peak;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  double v17 = fmod(v15, 1.84467441e19);
  unint64_t v18 = 2654435761u * (unint64_t)v17;
  unint64_t v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0) {
    unint64_t v19 = 2654435761u * (unint64_t)v17;
  }
  unint64_t v20 = v18 - (unint64_t)fabs(v16);
  if (v16 >= 0.0) {
    unint64_t v20 = v19;
  }
  return v12 ^ v3 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  timeRange = self->_timeRange;
  uint64_t v6 = *((void *)v4 + 3);
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
    -[VCPProtoMovieLoudnessResult setTimeRange:](self, "setTimeRange:");
  }
  id v4 = v7;
LABEL_7:
  self->_double energy = *((double *)v4 + 1);
  self->_double peak = *((double *)v4 + 2);
}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (double)energy
{
  return self->_energy;
}

- (void)setEnergy:(double)a3
{
  self->_double energy = a3;
}

- (double)peak
{
  return self->_peak;
}

- (void)setPeak:(double)a3
{
  self->_double peak = a3;
}

- (void).cxx_destruct
{
}

@end