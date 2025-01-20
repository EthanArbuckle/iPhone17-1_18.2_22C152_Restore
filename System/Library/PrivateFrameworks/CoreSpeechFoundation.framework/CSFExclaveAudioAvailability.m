@interface CSFExclaveAudioAvailability
- (CSFExclaveAudioAvailability)initWithNumChannels:(unint64_t)a3 numSamples:(unint64_t)a4 sampleByteDepth:(unint64_t)a5 startSampleCount:(unint64_t)a6 hostTime:(unint64_t)a7 arrivalHostTimeToAudioRecorder:(unint64_t)a8;
- (unint64_t)arrivalHostTimeToAudioRecorder;
- (unint64_t)hostTime;
- (unint64_t)numChannels;
- (unint64_t)numSamples;
- (unint64_t)sampleByteDepth;
- (unint64_t)startSampleCount;
@end

@implementation CSFExclaveAudioAvailability

- (unint64_t)arrivalHostTimeToAudioRecorder
{
  return self->_arrivalHostTimeToAudioRecorder;
}

- (unint64_t)hostTime
{
  return self->_hostTime;
}

- (unint64_t)startSampleCount
{
  return self->_startSampleCount;
}

- (unint64_t)sampleByteDepth
{
  return self->_sampleByteDepth;
}

- (unint64_t)numSamples
{
  return self->_numSamples;
}

- (unint64_t)numChannels
{
  return self->_numChannels;
}

- (CSFExclaveAudioAvailability)initWithNumChannels:(unint64_t)a3 numSamples:(unint64_t)a4 sampleByteDepth:(unint64_t)a5 startSampleCount:(unint64_t)a6 hostTime:(unint64_t)a7 arrivalHostTimeToAudioRecorder:(unint64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CSFExclaveAudioAvailability;
  result = [(CSFExclaveAudioAvailability *)&v15 init];
  if (result)
  {
    result->_numChannels = a3;
    result->_numSamples = a4;
    result->_sampleByteDepth = a5;
    result->_startSampleCount = a6;
    result->_hostTime = a7;
    result->_arrivalHostTimeToAudioRecorder = a8;
  }
  return result;
}

@end