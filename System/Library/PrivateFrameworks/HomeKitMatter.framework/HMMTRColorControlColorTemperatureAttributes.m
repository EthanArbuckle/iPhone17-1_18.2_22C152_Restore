@interface HMMTRColorControlColorTemperatureAttributes
- (NSNumber)colorMode;
- (NSNumber)colorTemperatureMireds;
- (NSNumber)remainingTime;
- (id)shortDescription;
- (void)setColorMode:(id)a3;
- (void)setColorTemperatureMireds:(id)a3;
- (void)setRemainingTime:(id)a3;
@end

@implementation HMMTRColorControlColorTemperatureAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorMode, 0);
  objc_storeStrong((id *)&self->_remainingTime, 0);
  objc_storeStrong((id *)&self->_colorTemperatureMireds, 0);
}

- (void)setColorMode:(id)a3
{
}

- (NSNumber)colorMode
{
  return self->_colorMode;
}

- (void)setRemainingTime:(id)a3
{
}

- (NSNumber)remainingTime
{
  return self->_remainingTime;
}

- (void)setColorTemperatureMireds:(id)a3
{
}

- (NSNumber)colorTemperatureMireds
{
  return self->_colorTemperatureMireds;
}

- (id)shortDescription
{
  v3 = NSString;
  v4 = [(HMMTRColorControlColorTemperatureAttributes *)self colorMode];
  v5 = [(HMMTRColorControlColorTemperatureAttributes *)self remainingTime];
  v6 = [(HMMTRColorControlColorTemperatureAttributes *)self colorTemperatureMireds];
  v7 = [v3 stringWithFormat:@"colorMode: %@ remainingTime: %@ colorTemperatureMireds: %@", v4, v5, v6];

  return v7;
}

@end