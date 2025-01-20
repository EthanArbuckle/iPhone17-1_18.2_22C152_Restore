@interface HLCinnamonWaveform
- (NSDate)startDate;
- (const)flags;
- (const)samples;
- (float)samplingRate;
- (unint64_t)numberOfSamples;
@end

@implementation HLCinnamonWaveform

- (const)samples
{
  return self->_samples;
}

- (const)flags
{
  return self->_flags;
}

- (unint64_t)numberOfSamples
{
  return self->_numberOfSamples;
}

- (float)samplingRate
{
  return self->_samplingRate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
}

@end