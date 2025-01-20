@interface KeyPitch
- (KeyPitch)initWithFrequency:(double)a3 volume:(double)a4 timeOffset:(double)a5;
- (double)frequency;
- (double)timeOffsetMS;
- (double)volume;
- (id)description;
- (void)setFrequency:(double)a3;
- (void)setTimeOffsetMS:(double)a3;
- (void)setVolume:(double)a3;
@end

@implementation KeyPitch

- (KeyPitch)initWithFrequency:(double)a3 volume:(double)a4 timeOffset:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)KeyPitch;
  result = [(KeyPitch *)&v9 init];
  if (result)
  {
    result->_timeOffsetMS = a5;
    result->_volume = a4;
    result->_frequency = a3;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(KeyPitch *)self frequency];
  return (id)[v3 stringWithFormat:@"<%@ %p frequency=%.2f timeOffsetMS=%.2f", v4, self, v5, *(void *)&self->_timeOffsetMS];
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (double)timeOffsetMS
{
  return self->_timeOffsetMS;
}

- (void)setTimeOffsetMS:(double)a3
{
  self->_timeOffsetMS = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

@end