@interface HKAudioExposureValue
- (HKAudioExposureValue)initWithValue:(double)a3 duration:(double)a4;
- (double)duration;
- (double)value;
@end

@implementation HKAudioExposureValue

- (HKAudioExposureValue)initWithValue:(double)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKAudioExposureValue;
  result = [(HKAudioExposureValue *)&v7 init];
  if (result)
  {
    result->_value = a3;
    result->_duration = a4;
  }
  return result;
}

- (double)value
{
  return self->_value;
}

- (double)duration
{
  return self->_duration;
}

@end