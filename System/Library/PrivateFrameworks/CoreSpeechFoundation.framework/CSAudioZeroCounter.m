@interface CSAudioZeroCounter
- (CSAudioZeroCounter)initWithToken:(id)a3 sampleRate:(float)a4 numChannels:(unsigned int)a5;
- (void)getZeroStatisticsFromBuffer:(id)a3 entireSamples:(unsigned int)a4;
- (void)resetWithSampleRate:(float)a3;
- (void)stopCountingZeroStatisticsWithReporter:(id)a3;
@end

@implementation CSAudioZeroCounter

- (void).cxx_destruct
{
}

- (void)stopCountingZeroStatisticsWithReporter:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int continuousZeroCounter = self->_continuousZeroCounter;
  if (continuousZeroCounter > self->_zeroCounterWinSzForCSLogging)
  {
    v7 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      methodToken = self->_methodToken;
      int v10 = 136315650;
      v11 = "-[CSAudioZeroCounter stopCountingZeroStatisticsWithReporter:]";
      __int16 v12 = 2112;
      v13 = methodToken;
      __int16 v14 = 1026;
      unsigned int v15 = continuousZeroCounter;
      _os_log_error_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_ERROR, "%s In %@: Continuous digital zero detected, lasting %{public}u samples per channel", (uint8_t *)&v10, 0x1Cu);
    }
  }
  unsigned int maxContinuousZeroCount = self->_maxContinuousZeroCount;
  if (maxContinuousZeroCount > self->_zeroCounterWinSzForReport)
  {
    *(float *)&double v5 = (float)maxContinuousZeroCount;
    [v4 reportDigitalZerosWithAudioZeroRun:v5];
  }
  self->_unsigned int continuousZeroCounter = 0;
  self->_unsigned int maxContinuousZeroCount = 0;
}

- (void)getZeroStatisticsFromBuffer:(id)a3 entireSamples:(unsigned int)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  if (!self->_shouldDeinterleaveAudio) {
    a4 /= self->_numChannels;
  }
  if (a4)
  {
    unsigned int v8 = 0;
    while (!*(_WORD *)(v7 + 2 * v8))
    {
      unsigned int zeroCounterWinSzForCSLogging = self->_zeroCounterWinSzForCSLogging;
      unsigned int v16 = self->_continuousZeroCounter + 1;
      self->_unsigned int continuousZeroCounter = v16;
      if (v16 > zeroCounterWinSzForCSLogging)
      {
        unsigned int loggingSampleHeartBeat = self->_loggingSampleHeartBeat;
        if (!(loggingSampleHeartBeat % self->_zeroCounterHeartBeatThreshold))
        {
          v18 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
          {
            methodToken = self->_methodToken;
            *(_DWORD *)buf = 136315650;
            v24 = "-[CSAudioZeroCounter getZeroStatisticsFromBuffer:entireSamples:]";
            __int16 v25 = 2112;
            v26 = methodToken;
            __int16 v27 = 1026;
            unsigned int v28 = v16;
            _os_log_error_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_ERROR, "%s In %@: Continuous digital zero in this audio chunk detected, lasting %{public}u samples per channel", buf, 0x1Cu);
            unsigned int loggingSampleHeartBeat = self->_loggingSampleHeartBeat;
          }
        }
        unsigned int v14 = loggingSampleHeartBeat + 1;
        goto LABEL_18;
      }
LABEL_19:
      v8 += self->_analyzeStep;
      if (v8 >= a4) {
        goto LABEL_20;
      }
    }
    unsigned int maxContinuousZeroCount = self->_maxContinuousZeroCount;
    unsigned int continuousZeroCounter = self->_continuousZeroCounter;
    unsigned int v11 = self->_zeroCounterWinSzForCSLogging;
    if (maxContinuousZeroCount <= continuousZeroCounter) {
      unsigned int maxContinuousZeroCount = self->_continuousZeroCounter;
    }
    self->_unsigned int maxContinuousZeroCount = maxContinuousZeroCount;
    if (continuousZeroCounter > v11)
    {
      __int16 v12 = (void *)MEMORY[0x1BA9E7330]();
      v13 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v19 = self->_methodToken;
        unsigned int v20 = self->_continuousZeroCounter;
        *(_DWORD *)buf = 136315650;
        v24 = "-[CSAudioZeroCounter getZeroStatisticsFromBuffer:entireSamples:]";
        __int16 v25 = 2112;
        v26 = v19;
        __int16 v27 = 1026;
        unsigned int v28 = v20;
        _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s In %@: Continuous digital zero ended, lasting %{public}u samples per channel", buf, 0x1Cu);
      }
    }
    unsigned int v14 = 0;
    self->_unsigned int continuousZeroCounter = 0;
LABEL_18:
    self->_unsigned int loggingSampleHeartBeat = v14;
    goto LABEL_19;
  }
LABEL_20:
  unsigned int v22 = self->_continuousZeroCounter;
  if (v22)
  {
    if (self->_maxContinuousZeroCount > v22) {
      unsigned int v22 = self->_maxContinuousZeroCount;
    }
    self->_unsigned int maxContinuousZeroCount = v22;
  }
}

- (void)resetWithSampleRate:(float)a3
{
  self->_sampleRate = a3;
  self->_unsigned int zeroCounterWinSzForCSLogging = (float)((float)((float)+[CSConfig zeroFilterWindowSizeInMsForCSLogging]/ 1000.0)* a3);
  self->_zeroCounterWinSzForReport = (float)((float)((float)+[CSConfig zeroFilterWindowSizeInMsForReport]/ 1000.0)* a3);
  unint64_t v5 = +[CSConfig zeroFilterCSLoggingHeartBeatThresholdInMS];
  self->_unsigned int maxContinuousZeroCount = 0;
  *(void *)&self->_zeroCounterHeartBeatThreshold = (float)((float)((float)v5 / 1000.0) * a3);
}

- (CSAudioZeroCounter)initWithToken:(id)a3 sampleRate:(float)a4 numChannels:(unsigned int)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSAudioZeroCounter;
  int v10 = [(CSAudioZeroCounter *)&v15 init];
  unsigned int v11 = v10;
  if (v10)
  {
    v10->_unsigned int continuousZeroCounter = 0;
    objc_storeStrong((id *)&v10->_methodToken, a3);
    v11->_sampleRate = a4;
    v11->_int numChannels = a5;
    v11->_unsigned int zeroCounterWinSzForCSLogging = (float)((float)((float)+[CSConfig zeroFilterWindowSizeInMsForCSLogging]/ 1000.0)* a4);
    v11->_zeroCounterHeartBeatThreshold = (float)((float)((float)+[CSConfig zeroFilterCSLoggingHeartBeatThresholdInMS]/ 1000.0)* a4);
    v11->_zeroCounterWinSzForReport = (float)((float)((float)+[CSConfig zeroFilterWindowSizeInMsForReport]/ 1000.0)* a4);
    BOOL v12 = +[CSUtils shouldDeinterleaveAudioOnCS];
    v11->_shouldDeinterleaveAudio = v12;
    if (v12) {
      int numChannels = v11->_numChannels;
    }
    else {
      int numChannels = 1;
    }
    v11->_analyzeStep = numChannels;
    v11->_unsigned int maxContinuousZeroCount = 0;
    v11->_unsigned int loggingSampleHeartBeat = 0;
  }

  return v11;
}

@end