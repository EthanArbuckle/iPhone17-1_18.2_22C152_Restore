@interface HRAWaveformProcessor
- (HRAWaveformProcessor)initWithMinimumUsableDuration:(double)a3 minimumContinuousUsableDuration:(double)a4 minimumSaveableDuration:(double)a5;
- (HRAWaveformProcessorLoggingDelegate)logDelegate;
- (NSUUID)sessionUUID;
- (id)processSamples:(const float *)a3 flags:(const char *)a4 count:(unint64_t)a5 samplingRate:(float)a6 startDate:(id)a7;
- (id)processWaveform:(id)a3;
- (void)setLogDelegate:(id)a3;
- (void)setSessionUUID:(id)a3;
@end

@implementation HRAWaveformProcessor

- (HRAWaveformProcessor)initWithMinimumUsableDuration:(double)a3 minimumContinuousUsableDuration:(double)a4 minimumSaveableDuration:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HRAWaveformProcessor;
  return [(HRAWaveformProcessor *)&v6 init];
}

- (id)processWaveform:(id)a3
{
  return 0;
}

- (id)processSamples:(const float *)a3 flags:(const char *)a4 count:(unint64_t)a5 samplingRate:(float)a6 startDate:(id)a7
{
  id v10 = a7;
  v11 = [HRAWaveformResult alloc];
  [v10 timeIntervalSinceReferenceDate];
  double v13 = v12;

  *(float *)&double v14 = a6;
  v15 = [(HRAWaveformResult *)v11 initWithSamples:a3 count:a5 samplingRate:&unk_1F3B8B720 startDate:2 heartRate:v14 classification:v13];

  return v15;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (HRAWaveformProcessorLoggingDelegate)logDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logDelegate);

  return (HRAWaveformProcessorLoggingDelegate *)WeakRetained;
}

- (void)setLogDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_logDelegate);

  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end