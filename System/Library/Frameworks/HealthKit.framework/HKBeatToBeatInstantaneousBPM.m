@interface HKBeatToBeatInstantaneousBPM
- (HKBeatToBeatInstantaneousBPM)initWithBPM:(double)a3 time:(double)a4;
- (double)bpm;
- (double)time;
@end

@implementation HKBeatToBeatInstantaneousBPM

- (HKBeatToBeatInstantaneousBPM)initWithBPM:(double)a3 time:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKBeatToBeatInstantaneousBPM;
  result = [(HKBeatToBeatInstantaneousBPM *)&v7 init];
  if (result)
  {
    result->_bpm = a3;
    result->_time = a4;
  }
  return result;
}

- (double)bpm
{
  return self->_bpm;
}

- (double)time
{
  return self->_time;
}

@end