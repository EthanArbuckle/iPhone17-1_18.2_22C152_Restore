@interface HAPPGTemperatureSample
- (HAPPGTemperatureSample)initWithDegreesCelsius:(float)a3;
- (float)degreesCelsius;
@end

@implementation HAPPGTemperatureSample

- (HAPPGTemperatureSample)initWithDegreesCelsius:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HAPPGTemperatureSample;
  result = [(HAPPGTemperatureSample *)&v5 init];
  result->_degreesCelsius = a3;
  return result;
}

- (float)degreesCelsius
{
  return self->_degreesCelsius;
}

@end