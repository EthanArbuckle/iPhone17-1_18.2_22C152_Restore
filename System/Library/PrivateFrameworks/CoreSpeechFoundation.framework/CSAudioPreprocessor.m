@interface CSAudioPreprocessor
- (BOOL)_isNarrowBand:(float)a3;
- (CSAudioPreprocessor)initWithSampleRate:(float)a3 withNumberOfChannels:(int)a4 recordType:(int64_t)a5;
- (CSAudioPreprocessorDelegate)delegate;
- (CSAudioSampleRateConverter)upsampler;
- (CSAudioZeroCounter)zeroCounter;
- (CSBeepCanceller)beepCanceller;
- (CSVoiceTriggerAwareZeroFilter)zeroFilter;
- (float)sampleRate;
- (id)_fetchCurrentMetrics;
- (int)numChannels;
- (void)_reportMetrics;
- (void)beepCancellerDidCancelSamples:(id)a3 buffer:(id)a4 timestamp:(unint64_t)a5;
- (void)flush;
- (void)processBuffer:(id)a3 atTime:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5;
- (void)reportMetricsForSiriRequestWithUUID:(id)a3;
- (void)resetWithSampleRate:(float)a3 containsVoiceTrigger:(BOOL)a4 voiceTriggerInfo:(id)a5;
- (void)setBeepCanceller:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNumChannels:(int)a3;
- (void)setSampleRate:(float)a3;
- (void)setUpsampler:(id)a3;
- (void)setZeroCounter:(id)a3;
- (void)setZeroFilter:(id)a3;
- (void)willBeepWithRecordRoute:(id)a3 playbackRoute:(id)a4;
- (void)zeroFilter:(id)a3 zeroFilteredBufferAvailable:(id)a4 atHostTime:(unint64_t)a5;
@end

@implementation CSAudioPreprocessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroCounter, 0);
  objc_storeStrong((id *)&self->_beepCanceller, 0);
  objc_storeStrong((id *)&self->_zeroFilter, 0);
  objc_storeStrong((id *)&self->_upsampler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setNumChannels:(int)a3
{
  self->_numChannels = a3;
}

- (int)numChannels
{
  return self->_numChannels;
}

- (void)setZeroCounter:(id)a3
{
}

- (CSAudioZeroCounter)zeroCounter
{
  return self->_zeroCounter;
}

- (void)setBeepCanceller:(id)a3
{
}

- (CSBeepCanceller)beepCanceller
{
  return self->_beepCanceller;
}

- (void)setZeroFilter:(id)a3
{
}

- (CSVoiceTriggerAwareZeroFilter)zeroFilter
{
  return self->_zeroFilter;
}

- (void)setUpsampler:(id)a3
{
}

- (CSAudioSampleRateConverter)upsampler
{
  return self->_upsampler;
}

- (void)setSampleRate:(float)a3
{
  self->_sampleRate = a3;
}

- (float)sampleRate
{
  return self->_sampleRate;
}

- (void)setDelegate:(id)a3
{
}

- (CSAudioPreprocessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAudioPreprocessorDelegate *)WeakRetained;
}

- (void)beepCancellerDidCancelSamples:(id)a3 buffer:(id)a4 timestamp:(unint64_t)a5
{
  id v7 = a4;
  id v8 = [(CSAudioPreprocessor *)self delegate];
  [v8 audioPreprocessor:self hasAvailableBuffer:v7 atTime:a5 arrivalTimestampToAudioRecorder:0 numberOfChannels:self->_numChannels];
}

- (void)zeroFilter:(id)a3 zeroFilteredBufferAvailable:(id)a4 atHostTime:(unint64_t)a5
{
  id v7 = a4;
  id v8 = [(CSAudioPreprocessor *)self beepCanceller];

  if (v8)
  {
    id v9 = [(CSAudioPreprocessor *)self beepCanceller];
    [v9 cancelBeepFromSamples:v7 timestamp:a5];
  }
  else
  {
    id v9 = [(CSAudioPreprocessor *)self delegate];
    [v9 audioPreprocessor:self hasAvailableBuffer:v7 atTime:a5 arrivalTimestampToAudioRecorder:0 numberOfChannels:self->_numChannels];
  }
}

- (BOOL)_isNarrowBand:(float)a3
{
  +[CSConfig inputRecordingSampleRateNarrowBand];
  return v4 == a3;
}

- (id)_fetchCurrentMetrics
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  float v4 = [(CSVoiceTriggerAwareZeroFilter *)self->_zeroFilter metrics];
  if (v4)
  {
    [v3 setObject:v4 forKey:@"ZeroFilterMetrics"];
    v5 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      v11 = "-[CSAudioPreprocessor _fetchCurrentMetrics]";
      __int16 v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Zero Filter Metrics: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  v6 = [(CSBeepCanceller *)self->_beepCanceller metrics];
  if (v6)
  {
    [v3 setObject:v6 forKey:@"BeepCancellerMetrics"];
    id v7 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      v11 = "-[CSAudioPreprocessor _fetchCurrentMetrics]";
      __int16 v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Beep Canceller Metrics : %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  id v8 = (void *)[v3 mutableCopy];

  return v8;
}

- (void)_reportMetrics
{
  id v3 = [(CSAudioPreprocessor *)self _fetchCurrentMetrics];
  if (v3)
  {
    v2 = [MEMORY[0x1E4F4E3A8] sharedAnalytics];
    [v2 logEventWithType:241 context:v3];
  }
}

- (void)reportMetricsForSiriRequestWithUUID:(id)a3
{
  float v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v8 = (id)[[v4 alloc] initWithUUIDString:v5];

  if (v8)
  {
    v6 = [(CSAudioPreprocessor *)self _fetchCurrentMetrics];
    if (v6)
    {
      id v7 = +[CSFAudioMetricsSelfLogger sharedLogger];
      [v7 logCoreSpeechPreprocessorCompletedWithMHUUID:v8 withMetricsDictionary:v6];
    }
  }
}

- (void)willBeepWithRecordRoute:(id)a3 playbackRoute:(id)a4
{
  if (!+[CSUtils isHeadphoneDeviceWithRecordRoute:a3 playbackRoute:a4])
  {
    id v5 = [(CSAudioPreprocessor *)self beepCanceller];
    [v5 willBeep];
  }
}

- (void)flush
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[CSAudioPreprocessor flush]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Flushing audio preprocessor", (uint8_t *)&v8, 0xCu);
  }
  float v4 = [(CSAudioPreprocessor *)self zeroFilter];
  [v4 flush];

  id v5 = [(CSAudioPreprocessor *)self beepCanceller];
  [v5 flush];

  zeroCounter = self->_zeroCounter;
  id v7 = +[CSVoiceTriggerStatAggregator sharedAggregator];
  [(CSAudioZeroCounter *)zeroCounter stopCountingZeroStatisticsWithReporter:v7];

  [(CSAudioPreprocessor *)self _reportMetrics];
}

- (void)processBuffer:(id)a3 atTime:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5
{
  id v8 = a3;
  id v14 = v8;
  if (self->_numChannels > 1)
  {
    __int16 v12 = [(CSAudioPreprocessor *)self delegate];
    [v12 audioPreprocessor:self hasAvailableBuffer:v14 atTime:a4 arrivalTimestampToAudioRecorder:a5 numberOfChannels:self->_numChannels];
    uint64_t v10 = v14;
  }
  else
  {
    -[CSAudioZeroCounter getZeroStatisticsFromBuffer:entireSamples:](self->_zeroCounter, "getZeroStatisticsFromBuffer:entireSamples:", v8, ((unint64_t)[v8 length] >> 1)/ +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"));
    id v9 = [(CSAudioPreprocessor *)self upsampler];

    uint64_t v10 = v14;
    if (v9)
    {
      uint64_t v10 = [(CSAudioSampleRateConverter *)self->_upsampler convertSampleRateOfBuffer:v14];
    }
    v11 = [(CSAudioPreprocessor *)self zeroFilter];

    if (v11)
    {
      __int16 v12 = [(CSAudioPreprocessor *)self zeroFilter];
      [v12 processBuffer:v10 atTime:a4];
    }
    else
    {
      v13 = [(CSAudioPreprocessor *)self beepCanceller];

      if (v13)
      {
        __int16 v12 = [(CSAudioPreprocessor *)self beepCanceller];
        [v12 cancelBeepFromSamples:v10 timestamp:a4];
      }
      else
      {
        __int16 v12 = [(CSAudioPreprocessor *)self delegate];
        [v12 audioPreprocessor:self hasAvailableBuffer:v10 atTime:a4 arrivalTimestampToAudioRecorder:a5 numberOfChannels:self->_numChannels];
      }
    }
  }
}

- (void)resetWithSampleRate:(float)a3 containsVoiceTrigger:(BOOL)a4 voiceTriggerInfo:(id)a5
{
  BOOL v5 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315650;
    v24 = "-[CSAudioPreprocessor resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:]";
    __int16 v25 = 2050;
    double v26 = a3;
    __int16 v27 = 1026;
    BOOL v28 = v5;
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Resetting audio preprocessor : %{public}f, containsVoiceTrigger:%{public}d", (uint8_t *)&v23, 0x1Cu);
  }
  if (CSIsInternalBuild_onceToken != -1) {
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_53);
  }
  if (CSIsInternalBuild_isInternal)
  {
    zeroCounter = self->_zeroCounter;
    if (zeroCounter)
    {
      *(float *)&double v10 = a3;
      [(CSAudioZeroCounter *)zeroCounter resetWithSampleRate:v10];
    }
    else
    {
      __int16 v12 = [CSAudioZeroCounter alloc];
      v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      *(float *)&double v15 = a3;
      v16 = [(CSAudioZeroCounter *)v12 initWithToken:v14 sampleRate:1 numChannels:v15];
      v17 = self->_zeroCounter;
      self->_zeroCounter = v16;
    }
  }
  *(float *)&double v10 = a3;
  [(CSAudioPreprocessor *)self setSampleRate:v10];
  *(float *)&double v18 = a3;
  if ([(CSAudioPreprocessor *)self _isNarrowBand:v18])
  {
    v19 = +[CSAudioSampleRateConverter upsampler];
    [(CSAudioPreprocessor *)self setUpsampler:v19];
  }
  else
  {
    [(CSAudioPreprocessor *)self setUpsampler:0];
  }
  v20 = [(CSAudioPreprocessor *)self zeroFilter];
  *(float *)&double v21 = a3;
  [v20 resetWithSampleRate:v5 containsVoiceTrigger:v8 voiceTriggerInfo:v21];

  v22 = [(CSAudioPreprocessor *)self beepCanceller];
  [v22 reset];
}

- (CSAudioPreprocessor)initWithSampleRate:(float)a3 withNumberOfChannels:(int)a4 recordType:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  v15.receiver = self;
  v15.super_class = (Class)CSAudioPreprocessor;
  id v8 = [(CSAudioPreprocessor *)&v15 init];
  if (v8)
  {
    if (+[CSUtils supportZeroFilter:](CSUtils, "supportZeroFilter:", +[CSConfig inputRecordingNumberOfChannels]))
    {
      id v9 = objc_alloc_init(CSVoiceTriggerAwareZeroFilter);
      zeroFilter = v8->_zeroFilter;
      v8->_zeroFilter = v9;

      [(CSVoiceTriggerAwareZeroFilter *)v8->_zeroFilter setDelegate:v8];
    }
    if (+[CSUtils supportBeepCanceller:recordType:](CSUtils, "supportBeepCanceller:recordType:", +[CSConfig inputRecordingNumberOfChannels], a5))
    {
      v11 = objc_alloc_init(CSBeepCanceller);
      beepCanceller = v8->_beepCanceller;
      v8->_beepCanceller = v11;

      [(CSBeepCanceller *)v8->_beepCanceller setDelegate:v8];
    }
    [(CSAudioPreprocessor *)v8 setNumChannels:v6];
    *(float *)&double v13 = a3;
    [(CSAudioPreprocessor *)v8 resetWithSampleRate:0 containsVoiceTrigger:0 voiceTriggerInfo:v13];
  }
  return v8;
}

@end