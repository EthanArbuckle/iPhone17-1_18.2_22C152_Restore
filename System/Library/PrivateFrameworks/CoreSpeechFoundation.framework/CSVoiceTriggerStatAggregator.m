@interface CSVoiceTriggerStatAggregator
+ (id)sharedAggregator;
- (CSVoiceTriggerStatAggregator)init;
- (NSMutableDictionary)falseWakePhraseDictionary;
- (unint64_t)lastAggTimeFalseWakeUp;
- (unint64_t)numFalseWakeUp;
- (void)logAOPFirstPassTriggerWakeupLatency:(float)a3;
- (void)logFalseWakeUp:(BOOL)a3 withPhrase:(id)a4;
- (void)logSecondPassResult:(int)a3 eventInfo:(id)a4 triggerAPWakeUp:(BOOL)a5;
- (void)logTimeBasedTriggerLengthSampleCountStatistics:(unint64_t)a3 withAOPVTTriggerLengthSampleCount:(unint64_t)a4;
- (void)reportDigitalZerosWithAudioZeroRun:(float)a3;
- (void)setFalseWakePhraseDictionary:(id)a3;
- (void)setLastAggTimeFalseWakeUp:(unint64_t)a3;
- (void)setNumFalseWakeUp:(unint64_t)a3;
@end

@implementation CSVoiceTriggerStatAggregator

- (void).cxx_destruct
{
}

- (void)setFalseWakePhraseDictionary:(id)a3
{
}

- (NSMutableDictionary)falseWakePhraseDictionary
{
  return self->_falseWakePhraseDictionary;
}

- (void)setLastAggTimeFalseWakeUp:(unint64_t)a3
{
  self->_lastAggTimeFalseWakeUp = a3;
}

- (unint64_t)lastAggTimeFalseWakeUp
{
  return self->_lastAggTimeFalseWakeUp;
}

- (void)setNumFalseWakeUp:(unint64_t)a3
{
  self->_numFalseWakeUp = a3;
}

- (unint64_t)numFalseWakeUp
{
  return self->_numFalseWakeUp;
}

- (void)reportDigitalZerosWithAudioZeroRun:(float)a3
{
}

id __67__CSVoiceTriggerStatAggregator_reportDigitalZerosWithAudioZeroRun___block_invoke(uint64_t a1, double a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"duration";
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  v2 = [NSNumber numberWithFloat:a2];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)logTimeBasedTriggerLengthSampleCountStatistics:(unint64_t)a3 withAOPVTTriggerLengthSampleCount:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a3 - a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v9 = "-[CSVoiceTriggerStatAggregator logTimeBasedTriggerLengthSampleCountStatistics:withAOPVTTriggerLengthSampleCount:]";
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    __int16 v14 = 2048;
    unint64_t v15 = v6;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Sending event with time based triggerLengthSampleCount %llu, AOPVT triggerLengthSampleCount %llu, and delta of %lld samples", buf, 0x2Au);
  }
  AnalyticsSendEventLazy();
}

id __113__CSVoiceTriggerStatAggregator_logTimeBasedTriggerLengthSampleCountStatistics_withAOPVTTriggerLengthSampleCount___block_invoke(void *a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"newTriggerLengthSampleCount";
  v2 = [NSNumber numberWithUnsignedLongLong:a1[4]];
  v8[0] = v2;
  v7[1] = @"oldTriggerLengthSampleCount";
  v3 = [NSNumber numberWithUnsignedLongLong:a1[5]];
  v8[1] = v3;
  v7[2] = @"sampleCountDelta";
  v4 = [NSNumber numberWithLongLong:a1[6]];
  v8[2] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)logFalseWakeUp:(BOOL)a3 withPhrase:(id)a4
{
  BOOL v4 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v4)
  {
    ++self->_numFalseWakeUp;
    v7 = [(NSMutableDictionary *)self->_falseWakePhraseDictionary objectForKey:v6];

    falseWakePhraseDictionary = self->_falseWakePhraseDictionary;
    if (v7)
    {
      v9 = [NSNumber numberWithInt:1];
      __int16 v10 = falseWakePhraseDictionary;
    }
    else
    {
      unint64_t v11 = [(NSMutableDictionary *)self->_falseWakePhraseDictionary objectForKeyedSubscript:v6];
      int v12 = [v11 intValue];

      unint64_t v13 = self->_falseWakePhraseDictionary;
      v9 = [NSNumber numberWithInt:(v12 + 1)];
      __int16 v10 = v13;
    }
    [(NSMutableDictionary *)v10 setObject:v9 forKey:v6];

    __int16 v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t numFalseWakeUp = self->_numFalseWakeUp;
      int v28 = 136315394;
      v29 = "-[CSVoiceTriggerStatAggregator logFalseWakeUp:withPhrase:]";
      __int16 v30 = 2050;
      *(void *)v31 = numFalseWakeUp;
      _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s ::: incrementing false wakeup to %{public}llu", (uint8_t *)&v28, 0x16u);
    }
  }
  +[CSUtils systemUpTime];
  double v17 = v16;
  unint64_t lastAggTimeFalseWakeUp = self->_lastAggTimeFalseWakeUp;
  if (lastAggTimeFalseWakeUp)
  {
    unint64_t v19 = self->_numFalseWakeUp;
    if (v19)
    {
      double v20 = v16 - (double)lastAggTimeFalseWakeUp;
      if (v20 <= 0.0)
      {
        v26 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v27 = self->_falseWakePhraseDictionary;
          int v28 = 136315906;
          v29 = "-[CSVoiceTriggerStatAggregator logFalseWakeUp:withPhrase:]";
          __int16 v30 = 2050;
          *(void *)v31 = v19;
          *(_WORD *)&v31[8] = 2050;
          *(double *)&v31[10] = v20;
          *(_WORD *)&v31[18] = 2114;
          *(void *)&v31[20] = v27;
          _os_log_impl(&dword_1BA1A5000, v26, OS_LOG_TYPE_DEFAULT, "%s ::: accumulated false wakeup count is %{public}llu so far, not reporting yet because it has been only %{public}.2f seconds since last report with current phrases %{public}@", (uint8_t *)&v28, 0x2Au);
        }
      }
      else
      {
        v21 = +[CSPowerLogger sharedPowerLogger];
        [v21 powerWithNumFalseWakeup:self->_numFalseWakeUp withDuration:self->_falseWakePhraseDictionary withPhraseDict:v20];

        v22 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v23 = self->_numFalseWakeUp;
          int v28 = 136315906;
          v29 = "-[CSVoiceTriggerStatAggregator logFalseWakeUp:withPhrase:]";
          __int16 v30 = 1026;
          *(_DWORD *)v31 = v23;
          *(_WORD *)&v31[4] = 2050;
          *(double *)&v31[6] = v20;
          *(_WORD *)&v31[14] = 2114;
          *(void *)&v31[16] = v6;
          _os_log_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEFAULT, "%s PowerLog : HeySiriFalseTrigger numFalseWakeUp:%{public}d, secondsSinceLastReport:%{public}lf, phrase:%{public}@", (uint8_t *)&v28, 0x26u);
        }
        self->_unint64_t numFalseWakeUp = 0;
        self->_unint64_t lastAggTimeFalseWakeUp = (unint64_t)v17;
        v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v25 = self->_falseWakePhraseDictionary;
        self->_falseWakePhraseDictionary = v24;
      }
    }
  }
  else
  {
    self->_unint64_t lastAggTimeFalseWakeUp = (unint64_t)v16;
  }
}

- (void)logSecondPassResult:(int)a3 eventInfo:(id)a4 triggerAPWakeUp:(BOOL)a5
{
  id v6 = a4;
  id v5 = v6;
  AnalyticsSendEventLazy();
}

id __78__CSVoiceTriggerStatAggregator_logSecondPassResult_eventInfo_triggerAPWakeUp___block_invoke(uint64_t a1)
{
  v24[6] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  int v3 = *(_DWORD *)"";
  if (!v2)
  {
    v7 = @"unknown";
    id v6 = @"unknown";
LABEL_10:
    __int16 v10 = @"unknown";
    goto LABEL_11;
  }
  BOOL v4 = [v2 objectForKeyedSubscript:@"languageCode"];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"languageCode"];
    id v6 = (__CFString *)[v5 copy];
  }
  else
  {
    id v6 = @"unknown";
  }
  v8 = *(void **)(a1 + 32);
  if (!v8)
  {
    v7 = @"unknown";
    goto LABEL_10;
  }
  v9 = [v8 objectForKeyedSubscript:@"configVersion"];

  if (v9)
  {
    v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"configVersion"];
  }
  else
  {
    v7 = @"unknown";
  }
  double v17 = *(void **)(a1 + 32);
  if (v17)
  {
    v18 = [v17 objectForKeyedSubscript:@"firstPassTriggerSource"];

    if (v18)
    {
      __int16 v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"firstPassTriggerSource"];
    }
    else
    {
      __int16 v10 = @"unknown";
    }
    unint64_t v19 = *(void **)(a1 + 32);
    if (v19)
    {
      double v20 = [v19 objectForKeyedSubscript:@"triggerScore"];

      if (v20)
      {
        v21 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"triggerScore"];
        [v21 floatValue];
        int v3 = v22;
      }
    }
  }
  else
  {
    __int16 v10 = @"unknown";
  }
LABEL_11:
  v23[0] = @"result";
  unint64_t v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v24[0] = v11;
  v24[1] = v6;
  v23[1] = @"languageCode";
  v23[2] = @"modelVersion";
  v24[2] = v7;
  v24[3] = v10;
  v23[3] = @"firstPassSource";
  v23[4] = @"triggerScore";
  LODWORD(v12) = v3;
  unint64_t v13 = [NSNumber numberWithFloat:v12];
  v24[4] = v13;
  v23[5] = @"triggerAPWakeup";
  __int16 v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
  v24[5] = v14;
  unint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];

  return v15;
}

- (void)logAOPFirstPassTriggerWakeupLatency:(float)a3
{
}

id __68__CSVoiceTriggerStatAggregator_logAOPFirstPassTriggerWakeupLatency___block_invoke(uint64_t a1, double a2)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"latency";
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  v2 = [NSNumber numberWithFloat:a2];
  v6[1] = @"device";
  v7[0] = v2;
  int v3 = +[CSUtils deviceProductType];
  v7[1] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (CSVoiceTriggerStatAggregator)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSVoiceTriggerStatAggregator;
  v2 = [(CSVoiceTriggerStatAggregator *)&v7 init];
  int v3 = v2;
  if (v2)
  {
    v2->_unint64_t numFalseWakeUp = 0;
    v2->_unint64_t lastAggTimeFalseWakeUp = 0;
    BOOL v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    falseWakePhraseDictionary = v3->_falseWakePhraseDictionary;
    v3->_falseWakePhraseDictionary = v4;
  }
  return v3;
}

+ (id)sharedAggregator
{
  if (sharedAggregator_onceToken != -1) {
    dispatch_once(&sharedAggregator_onceToken, &__block_literal_global_8298);
  }
  v2 = (void *)sharedAggregator_sharedAggregator;
  return v2;
}

uint64_t __48__CSVoiceTriggerStatAggregator_sharedAggregator__block_invoke()
{
  sharedAggregator_sharedAggregator = objc_alloc_init(CSVoiceTriggerStatAggregator);
  return MEMORY[0x1F41817F8]();
}

@end