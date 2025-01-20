@interface CSVoiceTriggerAwareZeroFilter
- (CSAudioZeroFilter)zeroFilter;
- (CSVoiceTriggerAwareZeroFilter)init;
- (CSVoiceTriggerAwareZeroFilterDelegate)delegate;
- (float)sampleRate;
- (id)metrics;
- (unint64_t)numSamplesProcessed;
- (unint64_t)vtEndInSampleCount;
- (void)flush;
- (void)processBuffer:(id)a3 atTime:(unint64_t)a4;
- (void)resetWithSampleRate:(float)a3 containsVoiceTrigger:(BOOL)a4 voiceTriggerInfo:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setNumSamplesProcessed:(unint64_t)a3;
- (void)setSampleRate:(float)a3;
- (void)setVtEndInSampleCount:(unint64_t)a3;
- (void)setZeroFilter:(id)a3;
@end

@implementation CSVoiceTriggerAwareZeroFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroFilter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setZeroFilter:(id)a3
{
}

- (CSAudioZeroFilter)zeroFilter
{
  return self->_zeroFilter;
}

- (void)setNumSamplesProcessed:(unint64_t)a3
{
  self->_numSamplesProcessed = a3;
}

- (unint64_t)numSamplesProcessed
{
  return self->_numSamplesProcessed;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
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

- (CSVoiceTriggerAwareZeroFilterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVoiceTriggerAwareZeroFilterDelegate *)WeakRetained;
}

- (id)metrics
{
  return [(CSAudioZeroFilter *)self->_zeroFilter metrics];
}

- (void)flush
{
  zeroFilter = self->_zeroFilter;
  id v7 = 0;
  uint64_t v4 = [(CSAudioZeroFilter *)zeroFilter endAudioAndFetchAnyTrailingZerosPacket:&v7];
  id v5 = v7;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained zeroFilter:self zeroFilteredBufferAvailable:v5 atHostTime:v4];
  }
}

- (void)processBuffer:(id)a3 atTime:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 length];
  unint64_t v8 = v7 >> 1;
  unint64_t vtEndInSampleCount = self->_vtEndInSampleCount;
  unint64_t numSamplesProcessed = self->_numSamplesProcessed;
  unint64_t v11 = vtEndInSampleCount - numSamplesProcessed;
  if (vtEndInSampleCount < numSamplesProcessed)
  {
    id v12 = v6;
    self->_numSamplesProcessed += v8;
    if (!v12) {
      goto LABEL_22;
    }
    goto LABEL_16;
  }
  if (v8 >= v11) {
    unint64_t v13 = vtEndInSampleCount - numSamplesProcessed;
  }
  else {
    unint64_t v13 = v7 >> 1;
  }
  if (v13)
  {
    v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v6, "bytes"), 2 * v13);
  }
  else
  {
    v14 = 0;
  }
  if (v8 <= v11)
  {
    unint64_t v16 = 0;
    id v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v6, "bytes") + 2 * v13, 2 * (v8 - v13));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    +[CSFTimeUtils getHostClockFrequency];
    unint64_t v16 = (unint64_t)((double)a4 + (double)v13 * (v15 / self->_sampleRate));
  }
  self->_numSamplesProcessed += v8;
  if (v14)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained zeroFilter:self zeroFilteredBufferAvailable:v14 atHostTime:a4];
  }
  a4 = v16;
  if (v12)
  {
LABEL_16:
    zeroFilter = self->_zeroFilter;
    if (zeroFilter)
    {
      id v24 = 0;
      uint64_t v19 = [(CSAudioZeroFilter *)zeroFilter filterZerosInAudioPacket:v12 atBufferHostTime:a4 filteredPacket:&v24];
      id v20 = v24;
      v21 = v20;
      if (v20 && [v20 length])
      {
        id v22 = objc_loadWeakRetained((id *)&self->_delegate);
        [v22 zeroFilter:self zeroFilteredBufferAvailable:v21 atHostTime:v19];
      }
    }
    else
    {
      id v23 = objc_loadWeakRetained((id *)&self->_delegate);
      [v23 zeroFilter:self zeroFilteredBufferAvailable:v12 atHostTime:a4];
    }
  }
LABEL_22:
}

- (void)resetWithSampleRate:(float)a3 containsVoiceTrigger:(BOOL)a4 voiceTriggerInfo:(id)a5
{
  BOOL v5 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  self->_unint64_t vtEndInSampleCount = 0;
  self->_sampleRate = a3;
  self->_unint64_t numSamplesProcessed = 0;
  unint64_t v9 = (unint64_t)(float)((float)((float)+[CSConfig zeroFilterWindowSizeInMs]/ 1000.0)* a3);
  +[CSFTimeUtils getHostClockFrequency];
  double v10 = a3;
  unint64_t v11 = CSLogContextFacilityCoreSpeech;
  double v13 = v12 / a3;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315650;
    id v22 = "-[CSVoiceTriggerAwareZeroFilter resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:]";
    __int16 v23 = 2050;
    unint64_t v24 = v9;
    __int16 v25 = 2050;
    double v26 = v13;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_INFO, "%s zeroFilterWinSz: %{public}tu, numHostTicksPerAudioSample: %{public}f", (uint8_t *)&v21, 0x20u);
  }
  v14 = [[CSAudioZeroFilter alloc] initWithZeroWindowSize:v9 approxAbsSpeechThreshold:+[CSConfig zeroFilterApproxAbsSpeechThreshold] numHostTicksPerAudioSample:v13];
  zeroFilter = self->_zeroFilter;
  self->_zeroFilter = v14;

  if (v8)
  {
    if (v5)
    {
      unint64_t v16 = [v8 objectForKeyedSubscript:@"triggerEndSeconds"];
      [v16 floatValue];
      double v18 = v17;

      self->_unint64_t vtEndInSampleCount = (unint64_t)(v10 * v18);
      uint64_t v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
      {
        unint64_t numSamplesProcessed = self->_numSamplesProcessed;
        int v21 = 136315906;
        id v22 = "-[CSVoiceTriggerAwareZeroFilter resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:]";
        __int16 v23 = 2050;
        unint64_t v24 = (unint64_t)(v10 * v18);
        __int16 v25 = 2050;
        double v26 = *(double *)&numSamplesProcessed;
        __int16 v27 = 2114;
        id v28 = v8;
        _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_INFO, "%s _vtEndInSampleCount:%{public}ld, _numSamplesProcessed: %{public}ld, voiceTriggerInfo: %{public}@", (uint8_t *)&v21, 0x2Au);
      }
    }
  }
}

- (CSVoiceTriggerAwareZeroFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSVoiceTriggerAwareZeroFilter;
  return [(CSVoiceTriggerAwareZeroFilter *)&v3 init];
}

@end