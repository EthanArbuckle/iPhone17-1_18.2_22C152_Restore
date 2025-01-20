@interface HRAWaveformResult
- (HRAWaveformResult)initWithSamples:(const float *)a3 count:(unint64_t)a4 samplingRate:(float)a5 startDate:(double)a6 heartRate:(id)a7 classification:(unint64_t)a8;
- (NSData)sampleData;
- (NSDate)startDate;
- (NSNumber)heartRateBPM;
- (float)samplingFrequencyHz;
- (unint64_t)classification;
@end

@implementation HRAWaveformResult

- (HRAWaveformResult)initWithSamples:(const float *)a3 count:(unint64_t)a4 samplingRate:(float)a5 startDate:(double)a6 heartRate:(id)a7 classification:(unint64_t)a8
{
  v14.receiver = self;
  v14.super_class = (Class)HRAWaveformResult;
  v10 = [(HRAWaveformResult *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:a4];
    sampleData = v10->_sampleData;
    v10->_sampleData = (NSData *)v11;
  }
  return v10;
}

- (unint64_t)classification
{
  return self->_classification;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (float)samplingFrequencyHz
{
  return self->_samplingFrequencyHz;
}

- (NSData)sampleData
{
  return self->_sampleData;
}

- (NSNumber)heartRateBPM
{
  return self->_heartRateBPM;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateBPM, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_sampleData, 0);
}

@end