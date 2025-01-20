@interface _CDSleepForAutoSu
+ (id)defaultTuningConfiguration;
+ (id)readConfigurationFromDefaults;
+ (id)sanitizeTuningConfiguration:(id)a3;
+ (id)tuningDictionary;
- (BOOL)enableCaching;
- (_CDAutoSuConfig)autoSuConfig;
- (_CDSleepForAutoSu)init;
- (_CDSleepForAutoSu)initWithKnowledgeStore:(id)a3;
- (_DKKnowledgeQuerying)knowledgeStore;
- (id)defaultTimesWhenPredictionUnavailable:(id)a3;
- (id)defaultTimesWhenPredictionUnavailable:(id)a3 withConfig:(id)a4;
- (id)getUnlockAndSoftwareUpdateTimes;
- (id)getUnlockAndSoftwareUpdateTimesWithConfig:(id)a3 referenceDate:(id)a4;
- (id)makeDictionaryForEventStreamWhenPredictionTemporarilyUnavailable:(id)a3;
- (id)predicitLastUnlockForDay:(id)a3;
- (id)predictForDate:(id)a3 fromState:(id)a4;
- (id)predictForDate:(id)a3 fromState:(id)a4 withConfig:(id)a5;
- (id)predictNextDateForLastUnlockAttemptOfTheDay;
- (id)predictedSleepDictionaryForDate:(id)a3;
- (id)predictedSleepDictionaryForDate:(id)a3 usingKnowledge:(id)a4;
- (id)proposeTimesFromRelativeOffsetsForDate:(id)a3 lastUnlock:(int)a4 suStart:(int)a5 suEnd:(int)a6 unrestrictedSleepEnd:(int)a7 config:(id)a8;
- (id)retrieveSleepProbabilities:(id)a3;
- (void)setAutoSuConfig:(id)a3;
- (void)setEnableCaching:(BOOL)a3;
- (void)setKnowledgeStore:(id)a3;
@end

@implementation _CDSleepForAutoSu

- (_CDSleepForAutoSu)init
{
  v3.receiver = self;
  v3.super_class = (Class)_CDSleepForAutoSu;
  result = [(_CDSleepForAutoSu *)&v3 init];
  if (result) {
    result->_enableCaching = 1;
  }
  return result;
}

- (_CDSleepForAutoSu)initWithKnowledgeStore:(id)a3
{
  id v5 = a3;
  v6 = [(_CDSleepForAutoSu *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_knowledgeStore, a3);
  }

  return v7;
}

- (id)proposeTimesFromRelativeOffsetsForDate:(id)a3 lastUnlock:(int)a4 suStart:(int)a5 suEnd:(int)a6 unrestrictedSleepEnd:(int)a7 config:(id)a8
{
  v42[6] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  v14 = (void *)MEMORY[0x1E4F1CAF0];
  id v15 = a8;
  v16 = [v14 localTimeZone];
  LODWORD(v14) = [v16 secondsFromGMT];

  [v13 timeIntervalSinceReferenceDate];
  v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)((double)((uint64_t)v17 + 300)+ 3600.0+ (double)((int)((900 * a6 + 57600) % 86400+ 86400+ 86400 * ((int)(v14 + (uint64_t)v17 + 3900) / 86400)- (v14+ (uint64_t)v17+ 3900))% 86400))];
  int v19 = 900 * (a5 - a6);
  int v20 = 900 * (a7 - a6);
  v21 = [v18 dateByAddingTimeInterval:(double)v19];
  v22 = [v18 dateByAddingTimeInterval:(double)(900 * (a4 - a6))];
  v23 = [v18 dateByAddingTimeInterval:(double)v20];
  LOBYTE(a4) = [v15 allowUnlockBeforeNow];

  if ((a4 & 1) == 0 && [v22 compare:v13] == -1)
  {
    v24 = +[_CDLogging autoSUChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_INFO, "unlock_start overriden", v40, 2u);
    }

    id v25 = v13;
    v22 = v25;
  }
  v26 = [v13 dateByAddingTimeInterval:300.0];
  uint64_t v27 = [v21 compare:v26];

  if (v27 == -1)
  {
    v28 = +[_CDLogging autoSUChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_18ECEB000, v28, OS_LOG_TYPE_INFO, "su_start overriden", v40, 2u);
    }

    uint64_t v29 = [v13 dateByAddingTimeInterval:300.0];

    v21 = (void *)v29;
  }
  id v30 = v18;
  v41[0] = @"sleep_query_status";
  v41[1] = @"unlock_start";
  v42[0] = @"ok";
  v42[1] = v22;
  v41[2] = @"su_start";
  v41[3] = @"su_end";
  v42[2] = v21;
  v42[3] = v30;
  v41[4] = @"expiration_time";
  v41[5] = @"unrestricted_sleep_end";
  v42[4] = v30;
  v42[5] = v23;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:6];
  v32 = +[_CDLogging autoSUChannel];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    [(_CDSleepForAutoSu *)(uint64_t)v31 proposeTimesFromRelativeOffsetsForDate:v33 lastUnlock:v34 suStart:v35 suEnd:v36 unrestrictedSleepEnd:v37 config:v38];
  }

  return v31;
}

- (id)defaultTimesWhenPredictionUnavailable:(id)a3
{
  id v4 = a3;
  id v5 = [(_CDSleepForAutoSu *)self autoSuConfig];
  v6 = [(_CDSleepForAutoSu *)self defaultTimesWhenPredictionUnavailable:v4 withConfig:v5];

  return v6;
}

- (id)defaultTimesWhenPredictionUnavailable:(id)a3 withConfig:(id)a4
{
  v27[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1CAF0];
  id v7 = a4;
  v8 = [v6 localTimeZone];
  uint64_t v9 = [v8 secondsFromGMT];

  [v5 timeIntervalSinceReferenceDate];
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v9 + (uint64_t)v10;
  int v13 = [v7 suStartDefaultTime];
  v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)(v11 + 86400 + v13 - v12 + 86400 * ((v12 - v13) / 86400))];
  id v15 = v5;
  LODWORD(v12) = [v7 suEndDefaultTimeOffsetFromSuStart];

  v16 = [v14 dateByAddingTimeInterval:(double)(int)v12];
  v26[0] = @"sleep_query_status";
  v26[1] = @"unlock_start";
  v27[0] = @"next_day_prediction_not_available";
  v27[1] = v15;
  v26[2] = @"su_start";
  v26[3] = @"su_end";
  v27[2] = v14;
  v27[3] = v16;
  v26[4] = @"expiration_time";
  v27[4] = v16;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:5];
  v18 = +[_CDLogging autoSUChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[_CDSleepForAutoSu defaultTimesWhenPredictionUnavailable:withConfig:]((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
  }

  +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.sleepSPIforAutoSU.totalDefaultTimes"];
  return v17;
}

- (id)makeDictionaryForEventStreamWhenPredictionTemporarilyUnavailable:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  v6 = [v4 dictionary];
  id v7 = [(_CDSleepForAutoSu *)self defaultTimesWhenPredictionUnavailable:v5];

  [v6 setDictionary:v7];
  [v6 setValue:@"temporarily_not_available" forKey:@"sleep_query_status"];
  return v6;
}

- (id)getUnlockAndSoftwareUpdateTimes
{
  +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.sleepSPIforAutoSU.totalCount"];
  objc_super v3 = objc_alloc_init(_CDAutoSuConfig);
  autoSuConfig = self->_autoSuConfig;
  self->_autoSuConfig = v3;

  id v5 = (void *)MEMORY[0x192FB2F20]([(_CDAutoSuConfig *)self->_autoSuConfig setParam]);
  v6 = [(_CDSleepForAutoSu *)self autoSuConfig];
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = [(_CDSleepForAutoSu *)self getUnlockAndSoftwareUpdateTimesWithConfig:v6 referenceDate:v7];

  return v8;
}

+ (id)defaultTuningConfiguration
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"kSleepTuningLong";
  v4[1] = @"kSleepTuningShort";
  v5[0] = &unk_1EDE1E3C0;
  v5[1] = &unk_1EDE1E3D0;
  v4[2] = @"kSleepTuningRatio";
  v5[2] = &unk_1EDE1E3E0;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (id)sanitizeTuningConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [a1 defaultTuningConfiguration];
  }
  id v7 = v6;

  return v7;
}

+ (id)readConfigurationFromDefaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreDuet"];
  objc_super v3 = [v2 valueForKey:@"kSleepTuningParameters"];

  return v3;
}

+ (id)tuningDictionary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37___CDSleepForAutoSu_tuningDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tuningDictionary_onceToken != -1) {
    dispatch_once(&tuningDictionary_onceToken, block);
  }
  v2 = (void *)tuningDictionary_tuningDict;
  return v2;
}

- (id)predictedSleepDictionaryForDate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x192FB2F20]();
  if (self->_knowledgeStore)
  {
    id v6 = -[_CDSleepForAutoSu predictedSleepDictionaryForDate:usingKnowledge:](self, "predictedSleepDictionaryForDate:usingKnowledge:", v4);
  }
  else
  {
    id v7 = +[_DKKnowledgeStore knowledgeStore];
    id v6 = [(_CDSleepForAutoSu *)self predictedSleepDictionaryForDate:v4 usingKnowledge:v7];
  }

  return v6;
}

- (id)predictedSleepDictionaryForDate:(id)a3 usingKnowledge:(id)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(_CDSleepForAutoSu *)self enableCaching])
  {
    v8 = +[_CDAutoSuCache sharedCache];
    uint64_t v9 = [v8 cachedPredictedSleepDictionaryForDate:v6];
    if (v9)
    {
      double v10 = (void *)v9;
      uint64_t v11 = +[_CDLogging autoSUChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[_CDSleepForAutoSu predictedSleepDictionaryForDate:usingKnowledge:]((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
      }
      goto LABEL_19;
    }
  }
  v8 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v11 = objc_msgSend(v6, "cd_dateWithCeilingForAlignment:withOffset:inTimeZone:", v8, 86400.0, 16.0 * 3600.0);
  uint64_t v37 = [v11 dateByAddingTimeInterval:-(21.0 * 86400.0)];
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v37 duration:21.0 * 86400.0];
  v18 = +[_CDSleepPredictor gatherBitmapHistoryFromStore:forPeriod:](_CDSleepPredictor, "gatherBitmapHistoryFromStore:forPeriod:", v7);
  uint64_t v19 = v18;
  id v38 = v7;
  id v39 = v6;
  if (!v18 || ![v18 count])
  {
    uint64_t v22 = 0;
    id v25 = 0;
    id v24 = 0;
LABEL_11:
    v52 = @"_DKDebugMetadataKey-debug";
    v28 = (void *)MEMORY[0x1E4F1CBF0];
    if (v22) {
      v28 = v22;
    }
    v50[0] = @"probabilityVector";
    v50[1] = @"predictionPeriodStart";
    v51[0] = v28;
    v51[1] = v11;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
    v53[0] = v23;
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
    goto LABEL_14;
  }
  uint64_t v20 = objc_opt_new();
  uint64_t v21 = [(id)objc_opt_class() tuningDictionary];
  uint64_t v22 = [v20 predictFrom:v19 withTuning:v21 usingVersion:2];

  uint64_t v23 = +[_CDSleepPredictor findSleepPeriodInDayStarting:v11 FromActivityProbabilities:v22];
  id v24 = v6;
  id v25 = [v24 dateByAddingTimeInterval:86400.0];
  if (!v23)
  {

    goto LABEL_11;
  }
  uint64_t v35 = [v23 endDate];

  uint64_t v34 = +[_DKPeriodMetadataKey periodStart];
  v48[0] = v34;
  uint64_t v33 = [v23 startDate];
  v49[0] = v33;
  v32 = +[_DKPeriodMetadataKey periodEnd];
  v48[1] = v32;
  v26 = [v23 endDate];
  v49[1] = v26;
  v48[2] = @"_DKDebugMetadataKey-debug";
  v46[0] = @"probabilityVector";
  v46[1] = @"predictionPeriodStart";
  v47[0] = v22;
  v47[1] = v11;
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  v49[2] = v27;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];

  id v25 = (void *)v35;
LABEL_14:

  if ([(_CDSleepForAutoSu *)self enableCaching])
  {
    uint64_t v29 = +[_CDAutoSuCache sharedCache];
    id v30 = +[_CDLogging autoSUChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v41 = v10;
      __int16 v42 = 2112;
      id v43 = v24;
      __int16 v44 = 2112;
      v45 = v25;
      _os_log_debug_impl(&dword_18ECEB000, v30, OS_LOG_TYPE_DEBUG, "Caching prediction %@ valid between [%@, %@]", buf, 0x20u);
    }

    [v29 setCachedPredictedSleepDictionary:v10 validityStartDate:v24 validityEndDate:v25];
  }

  id v7 = v38;
  id v6 = v39;
LABEL_19:

  return v10;
}

- (id)getUnlockAndSoftwareUpdateTimesWithConfig:(id)a3 referenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_CDSleepForAutoSu *)self predictedSleepDictionaryForDate:v7];
  if (v8)
  {
    uint64_t v9 = [(_CDSleepForAutoSu *)self predictForDate:v7 fromState:v8 withConfig:v6];
  }
  else
  {
    +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.sleepSPIforAutoSU.eventStreamStateFailure"];
    double v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v9 = [(_CDSleepForAutoSu *)self makeDictionaryForEventStreamWhenPredictionTemporarilyUnavailable:v10];
  }
  return v9;
}

- (id)retrieveSleepProbabilities:(id)a3
{
  if (a3)
  {
    objc_super v3 = [a3 objectForKeyedSubscript:@"_DKDebugMetadataKey-debug"];
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 objectForKeyedSubscript:@"probabilityVector"];
      id v6 = v5;
      if (v5)
      {
        if ([v5 count])
        {
          if ([v6 count] == 96)
          {
            id v6 = v6;
            id v7 = v6;
LABEL_20:

            goto LABEL_21;
          }
          v8 = +[_CDLogging autoSUChannel];
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            -[_CDSleepForAutoSu retrieveSleepProbabilities:].cold.5();
          }
        }
        else
        {
          v8 = +[_CDLogging autoSUChannel];
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            -[_CDSleepForAutoSu retrieveSleepProbabilities:].cold.4();
          }
        }
      }
      else
      {
        v8 = +[_CDLogging autoSUChannel];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[_CDSleepForAutoSu retrieveSleepProbabilities:]();
        }
      }
    }
    else
    {
      id v6 = +[_CDLogging autoSUChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[_CDSleepForAutoSu retrieveSleepProbabilities:]();
      }
    }
    id v7 = 0;
    goto LABEL_20;
  }
  id v4 = +[_CDLogging autoSUChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[_CDSleepForAutoSu retrieveSleepProbabilities:]();
  }
  id v7 = 0;
LABEL_21:

  return v7;
}

- (id)predictForDate:(id)a3 fromState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(_CDSleepForAutoSu *)self autoSuConfig];
  uint64_t v9 = [(_CDSleepForAutoSu *)self predictForDate:v7 fromState:v6 withConfig:v8];

  return v9;
}

- (id)predictForDate:(id)a3 fromState:(id)a4 withConfig:(id)a5
{
  v34[96] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  double v10 = [(_CDSleepForAutoSu *)self retrieveSleepProbabilities:a4];
  if (v10)
  {
    uint64_t v11 = +[_CDLogging autoSUChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_CDSleepForAutoSu predictForDate:fromState:withConfig:](v11);
    }

    for (uint64_t i = 0; i != 96; ++i)
    {
      uint64_t v13 = [v10 objectAtIndex:i];
      [v13 doubleValue];
      double v15 = 1.0 - v14;
      *(double *)&v34[i] = 1.0 - v14;

      uint64_t v16 = +[_CDLogging autoSUChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        int v31 = i;
        __int16 v32 = 2048;
        double v33 = v15;
        _os_log_debug_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_DEBUG, "Prob[%d] = %f", buf, 0x12u);
      }
    }
    *(_DWORD *)buf = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    if (findAutoSuPlanByProbability((uint64_t)v34, (int *)buf, (int *)&v27 + 1, (int *)&v27, (int *)&v26 + 1, (int *)&v26, v9) != -1&& ![v9 alwaysFallBackToDefault])
    {
      +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.sleepSPIforAutoSU.totalNonDefaultTimes"];
      uint64_t v20 = [(_CDSleepForAutoSu *)self proposeTimesFromRelativeOffsetsForDate:v8 lastUnlock:*(unsigned int *)buf suStart:HIDWORD(v27) suEnd:v27 unrestrictedSleepEnd:v26 config:v9];
      if ([v9 alwaysReturnUnlockNow])
      {
        v28[0] = @"sleep_query_status";
        uint64_t v21 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v29[0] = v21;
        v29[1] = v8;
        v28[1] = @"unlock_start";
        v28[2] = @"su_start";
        uint64_t v22 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v29[2] = v22;
        v28[3] = @"su_end";
        uint64_t v23 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v29[3] = v23;
        v28[4] = @"expiration_time";
        id v24 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v29[4] = v24;
        v28[5] = @"unrestricted_sleep_end";
        id v25 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v29[5] = v25;
        id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:6];
      }
      else
      {
        id v18 = v20;
      }

      goto LABEL_14;
    }
    uint64_t v17 = +[_CDLogging autoSUChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_CDSleepForAutoSu predictForDate:fromState:withConfig:]();
    }

    +[_CDDiagnosticDataReporter addValue:1 forScalarKey:@"com.apple.coreduet.sleepSPIforAutoSU.planFailed"];
  }
  id v18 = [(_CDSleepForAutoSu *)self defaultTimesWhenPredictionUnavailable:v8];
LABEL_14:

  return v18;
}

- (id)predicitLastUnlockForDay:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_CDAutoSuConfig);
  [(_CDAutoSuConfig *)v5 setParam];
  [(_CDAutoSuConfig *)v5 setAlwaysReturnUnlockNow:0];
  [(_CDAutoSuConfig *)v5 setAllowUnlockBeforeNow:1];
  id v6 = [(_CDSleepForAutoSu *)self getUnlockAndSoftwareUpdateTimesWithConfig:v5 referenceDate:v4];
  id v7 = [v6 objectForKeyedSubscript:@"sleep_query_status"];
  int v8 = [v7 isEqualToString:@"ok"];

  if (v8)
  {
    id v9 = [v6 objectForKeyedSubscript:@"unlock_start"];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)predictNextDateForLastUnlockAttemptOfTheDay
{
  objc_super v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(_CDSleepForAutoSu *)self predicitLastUnlockForDay:v3];
  id v5 = v4;
  if (v4
    && ([v4 earlierDate:v3],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToDate:v5],
        v6,
        !v7))
  {
    id v10 = v5;
  }
  else
  {
    int v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v9 = [v8 dateByAddingUnit:16 value:1 toDate:v3 options:0];

    id v10 = [(_CDSleepForAutoSu *)self predicitLastUnlockForDay:v9];
  }
  return v10;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (_CDAutoSuConfig)autoSuConfig
{
  return (_CDAutoSuConfig *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAutoSuConfig:(id)a3
{
}

- (BOOL)enableCaching
{
  return self->_enableCaching;
}

- (void)setEnableCaching:(BOOL)a3
{
  self->_enableCaching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoSuConfig, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)proposeTimesFromRelativeOffsetsForDate:(uint64_t)a3 lastUnlock:(uint64_t)a4 suStart:(uint64_t)a5 suEnd:(uint64_t)a6 unrestrictedSleepEnd:(uint64_t)a7 config:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, a2, a3, "(non-default) proposed_times = %@\n", a5, a6, a7, a8, 2u);
}

- (void)defaultTimesWhenPredictionUnavailable:(uint64_t)a3 withConfig:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, a2, a3, "(default) proposed_times = %@\n", a5, a6, a7, a8, 2u);
}

- (void)predictedSleepDictionaryForDate:(uint64_t)a3 usingKnowledge:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)retrieveSleepProbabilities:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Sleep DKEvent missing metadata (desired metadata with sleep info does not exist.)", v2, v3, v4, v5, v6);
}

- (void)retrieveSleepProbabilities:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "_DKDebugMetadataKey-debug unavailable", v2, v3, v4, v5, v6);
}

- (void)retrieveSleepProbabilities:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "probabilityVector unavailable", v2, v3, v4, v5, v6);
}

- (void)retrieveSleepProbabilities:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "probabilityVector is empty", v2, v3, v4, v5, v6);
}

- (void)retrieveSleepProbabilities:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "probabilityVector has unexpected length", v2, v3, v4, v5, v6);
}

- (void)predictForDate:fromState:withConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Failed to find a proper plan for AutoSU", v2, v3, v4, v5, v6);
}

- (void)predictForDate:(os_log_t)log fromState:withConfig:.cold.2(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = 96;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Listing %d probabilities (0: wake; 1: sleep)",
    (uint8_t *)v1,
    8u);
}

@end