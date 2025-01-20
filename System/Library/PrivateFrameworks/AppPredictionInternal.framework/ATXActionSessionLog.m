@interface ATXActionSessionLog
+ (BOOL)isLockscreenSession:(unsigned __int8)a3;
+ (BOOL)isLowConfidenceSession:(id)a3;
+ (BOOL)isSessionNotUsefulForTraining:(int)a3 actionResponse:(id)a4;
+ (BOOL)isSessionWithoutEngagement:(int)a3;
+ (double)_bucketize:(double)result bucketSize:(double)a4;
+ (double)roundedElapsedTimeWithStartDate:(id)a3 endDate:(id)a4 accuracy:(double)a5;
+ (void)logActionData:(id)a3;
+ (void)logIntentPredictionSession:(id)a3;
+ (void)performSessionLoggingWithActionResponse:(id)a3 engagementType:(unint64_t)a4 context:(id)a5 isShadowLog:(BOOL)a6 forTestingMode:(BOOL)a7;
- (ATXActionSessionLog)initWithActionEngagementType:(unint64_t)a3 actionResponse:(id)a4 context:(id)a5 isShadowLog:(BOOL)a6;
- (id)constructActionDataDictionaryWithEngagedIndicesOut:(id *)a3 andAWDActionOut:(id *)a4 andEngagementTypeFound:(unint64_t *)a5 forTestingMode:(BOOL)a6;
- (id)constructSessionLogDictionaryWithAWDSessionOut:(id *)a3 forTestingMode:(BOOL)a4;
- (void)performSessionLogging:(BOOL)a3;
@end

@implementation ATXActionSessionLog

- (ATXActionSessionLog)initWithActionEngagementType:(unint64_t)a3 actionResponse:(id)a4 context:(id)a5 isShadowLog:(BOOL)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXActionSessionLog;
  v13 = [(ATXActionSessionLog *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_engagementType = a3;
    objc_storeStrong((id *)&v13->_actionResponse, a4);
    objc_storeStrong((id *)&v14->_context, a5);
    v14->_isShadowLog = a6;
  }

  return v14;
}

+ (void)performSessionLoggingWithActionResponse:(id)a3 engagementType:(unint64_t)a4 context:(id)a5 isShadowLog:(BOOL)a6 forTestingMode:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v13 = a3;
  id v11 = a5;
  id v12 = [[ATXActionSessionLog alloc] initWithActionEngagementType:a4 actionResponse:v13 context:v11 isShadowLog:v8];
  [(ATXActionSessionLog *)v12 performSessionLogging:v7];
}

- (void)performSessionLogging:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if (![(ATXPredictionContext *)self->_context isOverridden])
  {
    double v5 = 1.0;
    if (!self->_isShadowLog)
    {
      int v6 = [MEMORY[0x1E4F93B08] isInternalBuild];
      BOOL v7 = +[_ATXGlobals sharedInstance];
      BOOL v8 = v7;
      if (v6) {
        [v7 actionPredictionInternalBuildSessionLogSamplingRate];
      }
      else {
        [v7 actionPredictionSessionLogSamplingRate];
      }
      double v5 = v9;
    }
    if (+[_ATXAggregateLogger yesWithProbability:v5])
    {
      sel_getName(a2);
      v58 = (void *)os_transaction_create();
      id v79 = (id)objc_opt_new();
      id v10 = [(ATXActionSessionLog *)self constructSessionLogDictionaryWithAWDSessionOut:&v79 forTestingMode:v3];
      if (objc_msgSend((id)objc_opt_class(), "isSessionNotUsefulForTraining:actionResponse:", objc_msgSend(v79, "engagementType"), self->_actionResponse))
      {
        id v11 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = (objc_class *)objc_opt_class();
          id v13 = NSStringFromClass(v12);
          *(_DWORD *)buf = 138412290;
          id v81 = v13;
          _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "%@ - the session does not have engagement, is low confidence, and is not a lockscreen session. Skipping session logging.", buf, 0xCu);
        }
      }
      else
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F29128]);
        v57 = [v14 UUIDString];

        [v79 setSessionId:v57];
        v15 = objc_opt_new();
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __45__ATXActionSessionLog_performSessionLogging___block_invoke;
        aBlock[3] = &unk_1E68ABD80;
        v61 = v57;
        v76 = v61;
        id v65 = v15;
        id v77 = v65;
        v78 = self;
        v66 = (void (**)(void *, void *))_Block_copy(aBlock);
        int v16 = [v79 engagementType];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        v17 = [v79 actionDatas];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v71 objects:v95 count:16];
        if (v18)
        {
          char v63 = 0;
          uint64_t v19 = *(void *)v72;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v72 != v19) {
                objc_enumerationMutation(v17);
              }
              v21 = *(void **)(*((void *)&v71 + 1) + 8 * v20);
              if (([v21 shown] & 1) != 0
                || ([v21 engaged],
                    v22 = objc_claimAutoreleasedReturnValue(),
                    int v23 = [v22 isEqualToString:@"Complete"],
                    v22,
                    v23))
              {
                v66[2](v66, v21);
              }
              else if (v16 == 8 || v16 == 3)
              {
                v24 = [v21 engaged];
                char v25 = [v24 isEqualToString:@"Partial"];

                if (!(v63 & 1 | ((v25 & 1) == 0)))
                {
                  v66[2](v66, v21);
                  char v63 = 1;
                }
              }
              ++v20;
            }
            while (v18 != v20);
            uint64_t v26 = [v17 countByEnumeratingWithState:&v71 objects:v95 count:16];
            uint64_t v18 = v26;
          }
          while (v26);
        }

        v27 = +[_ATXGlobals sharedInstance];
        int v28 = [v27 maxNumberOfActionDataMetricsToLogViaAWD];

        v59 = objc_opt_new();
        for (unint64_t i = 0; ; ++i)
        {
          v30 = [v79 actionDatas];
          BOOL v31 = [v30 count] > i;

          if (!v31) {
            break;
          }
          v32 = [NSNumber numberWithInt:i];
          [v59 addObject:v32];
        }
        +[ATXUtils shuffle:v59];
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v34 = [v33 countByEnumeratingWithState:&v67 objects:v94 count:16];
        id v60 = v33;
        if (v34)
        {
          unint64_t v35 = v28;
          uint64_t v64 = *(void *)v68;
          do
          {
            for (uint64_t j = 0; j != v34; ++j)
            {
              if (*(void *)v68 != v64) {
                objc_enumerationMutation(v33);
              }
              v37 = *(void **)(*((void *)&v67 + 1) + 8 * j);
              v38 = [v79 actionDatas];
              v39 = objc_msgSend(v38, "objectAtIndexedSubscript:", (int)objc_msgSend(v37, "intValue"));

              if ([v65 count] >= v35)
              {
                v40 = __atxlog_handle_feedback();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  v41 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v41);
                  id v42 = (id)objc_claimAutoreleasedReturnValue();
                  v43 = [v39 actionKey];
                  v44 = [v39 engaged];
                  int v45 = [v39 shown];
                  int v46 = [v39 cacheRank];
                  [v39 score];
                  *(_DWORD *)buf = 138413826;
                  id v81 = v42;
                  __int16 v82 = 2112;
                  v83 = v61;
                  __int16 v84 = 2112;
                  v85 = v43;
                  __int16 v86 = 2112;
                  v87 = v44;
                  __int16 v88 = 1024;
                  int v89 = v45;
                  __int16 v90 = 1024;
                  int v91 = v46;
                  __int16 v92 = 2048;
                  uint64_t v93 = v47;
                  _os_log_impl(&dword_1D0FA3000, v40, OS_LOG_TYPE_DEFAULT, "%@ - NOT logging AWDProactiveActionData with sessionId: %@ actionKey: %@ engaged: %@ shown: %{BOOL}u cacheRank: %d score: %f", buf, 0x40u);

                  id v33 = v60;
                }
              }
              else
              {
                v66[2](v66, v39);
              }
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v67 objects:v94 count:16];
          }
          while (v34);
        }

        [v79 clearActionDatas];
        [(id)objc_opt_class() logIntentPredictionSession:v79];
        v48 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = (objc_class *)objc_opt_class();
          NSStringFromClass(v49);
          id v50 = (id)objc_claimAutoreleasedReturnValue();
          v51 = [v79 sessionId];
          uint64_t v52 = [v79 consumerSubType];
          if (v52 >= 0x28)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v52);
            v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v53 = off_1E68ABDC8[(int)v52];
          }
          v54 = v53;
          uint64_t v55 = [v79 engagementType];
          if (v55 >= 0xB)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v55);
            v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v56 = off_1E68ABF08[(int)v55];
          }
          *(_DWORD *)buf = 138413058;
          id v81 = v50;
          __int16 v82 = 2112;
          v83 = v51;
          __int16 v84 = 2112;
          v85 = v54;
          __int16 v86 = 2112;
          v87 = v56;
          _os_log_impl(&dword_1D0FA3000, v48, OS_LOG_TYPE_DEFAULT, "%@ - logged AWDProactiveAppPredictionIntentPredictionSession with sessionId: %@ consumerSubType: %@ engagementType: %@", buf, 0x2Au);
        }
        id v11 = v61;
      }
    }
  }
}

void __45__ATXActionSessionLog_performSessionLogging___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setSessionId:*(void *)(a1 + 32)];
  v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "cacheRank"));
  if (([*(id *)(a1 + 40) containsObject:v4] & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v4];
    [(id)objc_opt_class() logActionData:v3];
    double v5 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v8 = [v3 sessionId];
      double v9 = [v3 actionKey];
      id v10 = [v3 engaged];
      int v11 = [v3 shown];
      int v12 = [v3 cacheRank];
      [v3 score];
      int v14 = 138413826;
      id v15 = v7;
      __int16 v16 = 2112;
      v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      v21 = v10;
      __int16 v22 = 1024;
      int v23 = v11;
      __int16 v24 = 1024;
      int v25 = v12;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - logged AWDProactiveActionData with sessionId: %@ actionKey: %@ engaged: %@ shown: %{BOOL}u cacheRank: %d score: %f", (uint8_t *)&v14, 0x40u);
    }
  }
}

+ (BOOL)isSessionNotUsefulForTraining:(int)a3 actionResponse:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([a1 isSessionWithoutEngagement:v4]
    && [a1 isLowConfidenceSession:v6])
  {
    int v7 = objc_msgSend(a1, "isLockscreenSession:", objc_msgSend(v6, "consumerSubType")) ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (BOOL)isSessionWithoutEngagement:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F27F0000, &unk_1F27F0018, &unk_1F27F0030, 0);
  double v5 = [NSNumber numberWithInt:v3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

+ (BOOL)isLockscreenSession:(unsigned __int8)a3
{
  return a3 == 22;
}

+ (BOOL)isLowConfidenceSession:(id)a3
{
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = v4;
  v21 = v5;
  char v6 = [v5 cacheFileData];
  if (v6)
  {
    int v7 = [ATXActionCacheReader alloc];
    uint64_t v3 = [v5 cacheFileData];
    BOOL v8 = [(ATXActionCacheReader *)v7 initWithData:v3];
  }
  else
  {
    BOOL v8 = 0;
  }

  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  double v9 = [v5 actions];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    uint64_t v3 = (uint64_t)v31;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        if (v8)
        {
          [(ATXActionCacheReader *)v8 predictionItemForAction:*(void *)(*((void *)&v26 + 1) + 8 * v12)];
          v30[0] = 0;
          float v32 = -31337.0;
          for (uint64_t i = 16; i != 3284; i += 4)
            *(float *)((char *)v30 + i) = -31337.0;
          int v14 = memcmp(v23, v31, 0xCC4uLL);
          id v15 = (void *)v30[0];
          if (!v14
            && (!(v22 | v30[0]) || v22 && v30[0] && ([(id)v22 isEqualToString:v30[0]] & 1) != 0))
          {
            BOOL v16 = v23[817] == v32;

            if (v16)
            {

              char v19 = 0;
              LOBYTE(v3) = 1;
              goto LABEL_26;
            }
          }
          else
          {
          }
          BOOL v17 = (v24 | v25) == 0;

          if (!v17)
          {
            LOBYTE(v3) = 0;
            char v19 = 0;
            goto LABEL_26;
          }
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v18 = [v9 countByEnumeratingWithState:&v26 objects:v33 count:16];
      uint64_t v10 = v18;
    }
    while (v18);
  }
  char v19 = 1;
LABEL_26:

  return (v3 | v19) & 1;
}

+ (void)logActionData:(id)a3
{
}

+ (void)logIntentPredictionSession:(id)a3
{
}

+ (double)_bucketize:(double)result bucketSize:(double)a4
{
  if (result >= 0.0) {
    return (double)(int)(result / a4) * a4;
  }
  return result;
}

+ (double)roundedElapsedTimeWithStartDate:(id)a3 endDate:(id)a4 accuracy:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  double v10 = NAN;
  if (v7 && v8)
  {
    [v8 timeIntervalSinceDate:v7];
    double v10 = floor(v11 / a5) * a5;
  }

  return v10;
}

- (id)constructSessionLogDictionaryWithAWDSessionOut:(id *)a3 forTestingMode:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = [(ATXPredictionContext *)self->_context timeContext];
  uint64_t v9 = [v8 date];

  id v170 = 0;
  v164 = (void *)v9;
  if ([(ATXActionResponse *)self->_actionResponse consumerSubType] <= 0x2F
    && [(ATXActionResponse *)self->_actionResponse consumerSubType])
  {
    double v10 = +[_ATXAppPredictor sharedInstance];
    double v11 = [v10 abGroupIdentifiers];
    uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", -[ATXActionResponse consumerSubType](self->_actionResponse, "consumerSubType"));

    [v7 setObject:v12 forKeyedSubscript:@"ABGroup"];
    [*a3 setAbGroup:v12];
  }
  else
  {
    [v7 setObject:@"ERROR!" forKeyedSubscript:@"ABGroup"];
    [*a3 setAbGroup:@"ERROR!"];
    double v10 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXActionSessionLog constructSessionLogDictionaryWithAWDSessionOut:forTestingMode:]([(ATXActionResponse *)self->_actionResponse consumerSubType], buf, v10);
    }
  }
  uint64_t v169 = 9;
  uint64_t v13 = [(ATXActionSessionLog *)self constructActionDataDictionaryWithEngagedIndicesOut:&v170 andAWDActionOut:a3 andEngagementTypeFound:&v169 forTestingMode:v4];
  [v7 setObject:v13 forKeyedSubscript:@"ActionData"];

  p_engagementType = (unint64_t *)&v169;
  if (!self->_isShadowLog) {
    p_engagementType = &self->_engagementType;
  }
  unint64_t v15 = *p_engagementType;
  if (*p_engagementType - 2 >= 8)
  {
    if (v15 <= 0xA && ((1 << v15) & 0x403) != 0)
    {
      id v16 = [NSString alloc];
      BOOL v17 = [MEMORY[0x1E4F4AE58] engagementTypeToString:v15];
      double v10 = [v16 initWithFormat:@"ERROR:%@", v17];
    }
  }
  else
  {
    double v10 = [MEMORY[0x1E4F4AE58] engagementTypeToString:v15];
  }
  [v7 setObject:v10 forKeyedSubscript:@"EngagementType"];

  objc_msgSend(*a3, "setEngagementType:", +[ATXAWDUtils awdActionEngagementWithEngagement:](ATXAWDUtils, "awdActionEngagementWithEngagement:", v15));
  [v7 setObject:v170 forKeyedSubscript:@"EngagedActionCacheIndices"];
  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  id v18 = v170;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v165 objects:v171 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v166;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v166 != v20) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*a3, "addEngagedActionCacheIndices:", objc_msgSend(*(id *)(*((void *)&v165 + 1) + 8 * i), "intValue"));
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v165 objects:v171 count:16];
    }
    while (v19);
  }

  unint64_t v22 = [NSNumber numberWithLongLong:5];
  [v7 setObject:v22 forKeyedSubscript:@"session_log_version"];

  [*a3 setSessionLogVersion:5];
  if (self->_isShadowLog) {
    int v23 = @"Shadow";
  }
  else {
    int v23 = @"Feedback";
  }
  [v7 setObject:v23 forKeyedSubscript:@"LogType"];
  [*a3 setLogType:!self->_isShadowLog];
  unsigned __int8 v24 = +[_ATXGlobals sharedInstance];
  [v24 actionPredictionSessionLoggingDurationResolutionSec];
  double v26 = v25;

  long long v27 = [(ATXActionResponse *)self->_actionResponse predictionDate];
  +[ATXActionSessionLog roundedElapsedTimeWithStartDate:v27 endDate:v164 accuracy:v26];
  double v29 = v28;
  if (fabs(v28) == INFINITY) {
    double v29 = -31337.0;
  }

  v30 = [NSNumber numberWithInt:(int)v29];
  [v7 setObject:v30 forKeyedSubscript:@"PredictionAge"];

  [*a3 setPredictionAge:(int)v29];
  BOOL v31 = [(ATXActionResponse *)self->_actionResponse predictionDate];
  float v32 = [(ATXActionResponse *)self->_actionResponse uiFeedbackDate];
  +[ATXActionSessionLog roundedElapsedTimeWithStartDate:v31 endDate:v32 accuracy:v26];
  double v34 = v33;
  if (fabs(v33) == INFINITY) {
    double v34 = -31337.0;
  }

  unint64_t v35 = [NSNumber numberWithInt:(int)v34];
  [v7 setObject:v35 forKeyedSubscript:@"UIFeedbackDelay"];

  [*a3 setUiFeedbackDelay:(int)v34];
  v36 = [(ATXActionResponse *)self->_actionResponse predictionDate];
  v37 = [(ATXActionResponse *)self->_actionResponse donatedIntentDate];
  +[ATXActionSessionLog roundedElapsedTimeWithStartDate:v36 endDate:v37 accuracy:v26];
  double v39 = v38;
  if (fabs(v38) == INFINITY) {
    double v39 = -31337.0;
  }

  v40 = [NSNumber numberWithInt:(int)v39];
  [v7 setObject:v40 forKeyedSubscript:@"IntentDonationDelay"];

  [*a3 setIntentDonationDelay:(int)v39];
  v163 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v41 = (void *)MEMORY[0x1D25F6CC0]();
  id v42 = [v163 histogramForLaunchType:14];
  [v42 totalTimeOfDayLaunchesForDate:v164];
  if (fabs(v43) == INFINITY) {
    double v43 = -31337.0;
  }
  v44 = [NSNumber numberWithDouble:v43];
  [v7 setObject:v44 forKeyedSubscript:@"TotalAppActionTimeOfDayLaunches"];

  [v42 totalTimeOfDayLaunchesForDate:v164];
  if (fabs(v45) == INFINITY) {
    double v45 = -31337.0;
  }
  [*a3 setTotalAppActionTimeOfDayLaunches:(int)v45];
  LODWORD(v46) = 1036831949;
  [v42 totalTimeOfDayLaunchesForDate:v164 distanceScale:v46];
  if (fabs(v47) == INFINITY) {
    double v47 = -31337.0;
  }
  v48 = [NSNumber numberWithDouble:v47];
  [v7 setObject:v48 forKeyedSubscript:@"TotalAppActionCoarseTimeOfDayLaunches"];

  LODWORD(v49) = 1036831949;
  [v42 totalTimeOfDayLaunchesForDate:v164 distanceScale:v49];
  if (fabs(v50) == INFINITY) {
    double v50 = -31337.0;
  }
  [*a3 setTotalAppActionCoarseTimeOfDayLaunches:(int)v50];

  v51 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v52 = [v163 histogramForLaunchType:16];
  [v52 totalTimeOfDayLaunchesForDate:v164];
  if (fabs(v53) == INFINITY) {
    double v53 = -31337.0;
  }
  v54 = [NSNumber numberWithDouble:v53];
  [v7 setObject:v54 forKeyedSubscript:@"TotalAppForAllActionTimeOfDayLaunches"];

  [v52 totalTimeOfDayLaunchesForDate:v164];
  if (fabs(v55) == INFINITY) {
    double v55 = -31337.0;
  }
  [*a3 setTotalAppForAllActionTimeOfDayLaunches:(int)v55];
  LODWORD(v56) = 1036831949;
  [v52 totalTimeOfDayLaunchesForDate:v164 distanceScale:v56];
  if (fabs(v57) == INFINITY) {
    double v57 = -31337.0;
  }
  v58 = [NSNumber numberWithDouble:v57];
  [v7 setObject:v58 forKeyedSubscript:@"TotalAppForAllActionsCoarseTimeOfDayLaunches"];

  LODWORD(v59) = 1036831949;
  [v52 totalTimeOfDayLaunchesForDate:v164 distanceScale:v59];
  if (fabs(v60) == INFINITY) {
    double v60 = -31337.0;
  }
  [*a3 setTotalAppForAllActionsCoarseTimeOfDayLaunches:(int)v60];

  v61 = (void *)MEMORY[0x1D25F6CC0]();
  v62 = [v163 histogramForLaunchType:17];
  [v62 totalTimeOfDayLaunchesForDate:v164];
  double v64 = v63;
  if (fabs(v63) == INFINITY) {
    double v64 = -31337.0;
  }
  id v65 = [NSNumber numberWithDouble:v64];
  [v7 setObject:v65 forKeyedSubscript:@"TotalAppActionCurrentDayOfWeekLaunches"];

  [*a3 setTotalAppActionCurrentDayOfWeekLaunches:(int)v64];
  v66 = (void *)MEMORY[0x1D25F6CC0]();
  long long v67 = [v163 histogramForLaunchType:19];
  [v67 totalTimeOfDayLaunchesForDate:v164];
  double v69 = v68;
  if (fabs(v68) == INFINITY) {
    double v69 = -31337.0;
  }
  long long v70 = [NSNumber numberWithDouble:v69];
  [v7 setObject:v70 forKeyedSubscript:@"TotalAppForAllActionsCurrentDayOfWeekLaunches"];

  [*a3 setTotalAppForAllActionsCurrentDayOfWeekLaunches:(int)v69];
  long long v71 = (void *)MEMORY[0x1D25F6CC0]();
  long long v72 = [v163 histogramForLaunchType:26];
  [v72 totalLaunches];
  if (fabs(v73) == INFINITY) {
    double v73 = -31337.0;
  }
  uint64_t v74 = (int)v73;
  v75 = [NSNumber numberWithInt:v74];
  [v7 setObject:v75 forKeyedSubscript:@"TotalAppActionAirplaneModeLaunches"];

  [*a3 setTotalAppActionAirplaneModeLaunches:v74];
  v76 = (void *)MEMORY[0x1D25F6CC0]();
  id v77 = [v163 histogramForLaunchType:28];
  [v77 totalLaunches];
  double v79 = v78;
  if (fabs(v78) == INFINITY) {
    double v79 = -31337.0;
  }
  v80 = [NSNumber numberWithDouble:v79];
  [v7 setObject:v80 forKeyedSubscript:@"TotalAppForAllActionsAirplaneModeLaunches"];

  [*a3 setTotalAppForAllActionsAirplaneModeLaunches:(int)v79];
  id v81 = [(ATXPredictionContext *)self->_context deviceStateContext];
  uint64_t v82 = [v81 inAirplaneMode];

  v83 = [NSNumber numberWithInt:v82];
  [v7 setObject:v83 forKeyedSubscript:@"InAirplaneMode"];

  __int16 v84 = (void *)MEMORY[0x1D25F6CC0]([*a3 setInAirplaneMode:v82]);
  v85 = [v163 categoricalHistogramForLaunchType:38];
  __int16 v86 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v87 = [v86 categoricalHistogramForLaunchType:39];

  __int16 v88 = (void *)MEMORY[0x1E4F93608];
  int v89 = [(ATXPredictionContext *)self->_context locationMotionContext];
  __int16 v90 = objc_msgSend(v88, "getMotionStringFromMotionType:", objc_msgSend(v89, "motionType"));

  uint64_t v91 = [v90 length];
  if (v91)
  {
    [v85 totalLaunchesForCategory:v90];
    if (fabs(v92) == INFINITY) {
      double v92 = -31337.0;
    }
    uint64_t v93 = [NSNumber numberWithDouble:v92];
  }
  else
  {
    uint64_t v93 = &unk_1F27F0048;
  }
  [v7 setObject:v93 forKeyedSubscript:@"AppActionCoreMotionCurrentMotionLaunches"];
  if (v91) {

  }
  if ([v90 length])
  {
    [v85 totalLaunchesForCategory:v90];
    if (fabs(v94) == INFINITY) {
      double v94 = -31337.0;
    }
    uint64_t v95 = (int)v94;
  }
  else
  {
    uint64_t v95 = 0;
  }
  [*a3 setAppActionCoreMotionCurrentMotionLaunches:v95];
  uint64_t v96 = [v90 length];
  if (v96)
  {
    [v87 totalLaunchesForCategory:v90];
    if (fabs(v97) == INFINITY) {
      double v97 = -31337.0;
    }
    v98 = [NSNumber numberWithDouble:v97];
  }
  else
  {
    v98 = &unk_1F27F0048;
  }
  [v7 setObject:v98 forKeyedSubscript:@"AppForAllActionsCoreMotionCurrentMotionLaunches"];
  if (v96) {

  }
  if ([v90 length])
  {
    [v87 totalLaunchesForCategory:v90];
    if (fabs(v99) == INFINITY) {
      double v99 = -31337.0;
    }
    uint64_t v100 = (int)v99;
  }
  else
  {
    uint64_t v100 = 0;
  }
  [*a3 setAppForAllActionsCoreMotionCurrentMotionLaunches:v100];

  v101 = (void *)MEMORY[0x1D25F6CC0]();
  v102 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v103 = [v102 component:32 fromDate:v164];
  uint64_t v104 = [v102 component:512 fromDate:v164];

  v105 = [NSNumber numberWithLongLong:(uint64_t)(double)(v103 / 4)];
  [v7 setObject:v105 forKeyedSubscript:@"TimeOfDayInterval"];

  [*a3 setTimeOfDayInterval:((int)v103 / 4)];
  v106 = [NSNumber numberWithLongLong:(uint64_t)(double)(v104 - 1)];
  [v7 setObject:v106 forKeyedSubscript:@"DayOfWeek"];

  [*a3 setDayOfWeek:v104 - 1];
  v107 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", -[ATXActionResponse consumerSubType](self->_actionResponse, "consumerSubType"));
  [v7 setObject:v107 forKeyedSubscript:@"ConsumerSubType"];

  objc_msgSend(*a3, "setConsumerSubType:", +[ATXAWDUtils awdConsumerSubTypeWithConsumerSubType:](ATXAWDUtils, "awdConsumerSubTypeWithConsumerSubType:", -[ATXActionResponse consumerSubType](self->_actionResponse, "consumerSubType")));
  uint64_t v108 = [MEMORY[0x1E4F93B08] isInternalBuild];
  if (v108)
  {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsInternalBuild"];
    uint64_t v108 = [*a3 setIsInternalBuild:1];
  }
  v109 = (void *)MEMORY[0x1D25F6CC0](v108);
  v110 = +[_ATXGlobals sharedInstance];
  v111 = [(ATXPredictionContext *)self->_context locationMotionContext];
  v112 = [v111 currentLOI];

  if (v112) {
    uint64_t v113 = [v112 type];
  }
  else {
    uint64_t v113 = -1;
  }
  if ([v110 sessionLoggingCurrentLOITypeEnable])
  {
    v114 = [MEMORY[0x1E4F935D0] stringForLOIType:v113];
    [v7 setObject:v114 forKeyedSubscript:@"CurrentLOIType"];
  }
  objc_msgSend(*a3, "setCurrentLOIType:", +[ATXAWDUtils awdLOITypeWithRTLOI:](ATXAWDUtils, "awdLOITypeWithRTLOI:", v113));
  if ([v110 sessionLoggingHomeDistanceEnable])
  {
    v115 = objc_opt_class();
    v116 = [(ATXPredictionContext *)self->_context locationMotionContext];
    [v116 distanceFromHomeOfCurrentLocationInMeters];
    double v118 = v117;
    [v110 sessionLoggingDistanceAccuracy];
    [v115 _bucketize:v118 bucketSize:v119];
    double v121 = v120;

    if (v121 >= 0.0)
    {
      v122 = [NSNumber numberWithDouble:v121];
      [v7 setObject:v122 forKeyedSubscript:@"LocationDistanceFromHome"];

      [*a3 setLocationDistanceFromHome:(int)v121];
    }
  }
  if ([v110 sessionLoggingWorkDistanceEnable])
  {
    v123 = objc_opt_class();
    v124 = [(ATXPredictionContext *)self->_context locationMotionContext];
    [v124 distanceFromWorkOfCurrentLocationInMeters];
    double v126 = v125;
    [v110 sessionLoggingDistanceAccuracy];
    [v123 _bucketize:v126 bucketSize:v127];
    double v129 = v128;

    if (v129 >= 0.0)
    {
      v130 = [NSNumber numberWithDouble:v129];
      [v7 setObject:v130 forKeyedSubscript:@"LocationDistanceFromWork"];

      [*a3 setLocationDistanceFromWork:(int)v129];
    }
  }
  if ([v110 sessionLoggingSchoolDistanceEnable])
  {
    v131 = objc_opt_class();
    v132 = [(ATXPredictionContext *)self->_context locationMotionContext];
    [v132 distanceFromSchoolOfCurrentLocationInMeters];
    double v134 = v133;
    [v110 sessionLoggingDistanceAccuracy];
    [v131 _bucketize:v134 bucketSize:v135];
    double v137 = v136;

    if (v137 >= 0.0)
    {
      v138 = [NSNumber numberWithDouble:v137];
      [v7 setObject:v138 forKeyedSubscript:@"LocationDistanceFromSchool"];
    }
  }
  if ([v110 sessionLoggingGymDistanceEnable])
  {
    v139 = objc_opt_class();
    v140 = [(ATXPredictionContext *)self->_context locationMotionContext];
    [v140 distanceFromGymOfCurrentLocationInMeters];
    double v142 = v141;
    [v110 sessionLoggingDistanceAccuracy];
    [v139 _bucketize:v142 bucketSize:v143];
    double v145 = v144;

    if (v145 >= 0.0)
    {
      v146 = [NSNumber numberWithDouble:v145];
      [v7 setObject:v146 forKeyedSubscript:@"LocationDistanceFromGym"];
    }
  }

  v147 = [(ATXActionResponse *)self->_actionResponse engagedAction];
  v148 = [v147 bundleId];
  v149 = +[_ATXGlobals sharedInstance];
  v150 = +[ATXAppPredictorFeedback _getLastAppsWithEngagedApp:limit:](ATXAppPredictorFeedback, "_getLastAppsWithEngagedApp:limit:", v148, [v149 sessionLoggingAppSequenceLength]);

  if ([v150 count])
  {
    [v7 setObject:v150 forKeyedSubscript:@"AppSequence"];
    v151 = objc_opt_new();
    for (unint64_t j = 0; [v150 count] > j; ++j)
    {
      v153 = [v150 objectAtIndexedSubscript:j];
      [v151 addBundleid:v153];
    }
    [*a3 setAppSequence:v151];
  }
  v154 = [(ATXActionResponse *)self->_actionResponse engagedAction];
  v155 = objc_opt_new();
  v156 = +[_ATXGlobals sharedInstance];
  v157 = +[ATXAppPredictorFeedback _getLastAppIntentsWithEngagedAction:combinedIntentStream:limit:](ATXAppPredictorFeedback, "_getLastAppIntentsWithEngagedAction:combinedIntentStream:limit:", v154, v155, [v156 sessionLoggingUniqueAppActionSequenceLength]);

  if ([v157 count])
  {
    v158 = objc_opt_new();
    for (unint64_t k = 0; [v157 count] > k; ++k)
    {
      v160 = [v157 objectAtIndexedSubscript:k];
      [v158 addActionString:v160];
    }
    [*a3 setAppActionSequence:v158];
  }
  v161 = (void *)[v7 copy];

  return v161;
}

- (id)constructActionDataDictionaryWithEngagedIndicesOut:(id *)a3 andAWDActionOut:(id *)a4 andEngagementTypeFound:(unint64_t *)a5 forTestingMode:(BOOL)a6
{
  uint64_t v6 = MEMORY[0x1F4188790](self, a2);
  char v86 = v7;
  v83 = v8;
  v85 = v9;
  v80 = v10;
  uint64_t v11 = v6;
  *(void *)((char *)&v108[1] + 4) = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [*(id *)(v6 + 16) cacheFileData];
  if (v12)
  {
    uint64_t v13 = [ATXActionCacheReader alloc];
    int v14 = [*(id *)(v11 + 16) cacheFileData];
    __int16 v84 = [(ATXActionCacheReader *)v13 initWithData:v14];
  }
  else
  {
    __int16 v84 = 0;
  }

  int v89 = objc_opt_new();
  uint64_t v82 = objc_opt_new();
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x2020000000;
  int v103 = 0;
  unint64_t v15 = +[_ATXGlobals sharedInstance];
  int v16 = [v15 actionPredictionSessionLoggingBottomBlockMaxItemsToLog];

  BOOL v17 = [*(id *)(v11 + 16) matchingIntentDonatedAction];
  id v18 = v17;
  if (v17)
  {
    id v88 = v17;
  }
  else
  {
    id v88 = [*(id *)(v11 + 16) engagedAction];
  }

  int v19 = 0;
  unint64_t v87 = v16;
  uint64_t v20 = (uint64_t *)MEMORY[0x1E4F1C3B8];
  *((_DWORD *)v101 + 6) = 0;
  uint64_t v81 = *v20;
  while (1)
  {
    v21 = [*(id *)(v11 + 16) scoredActions];
    unint64_t v22 = [v21 count];

    unint64_t v23 = v87;
    if (v22 < v87) {
      unint64_t v23 = v22;
    }
    if (v23 <= v19) {
      break;
    }
    unsigned __int8 v24 = (void *)MEMORY[0x1D25F6CC0]();
    double v25 = [*(id *)(v11 + 16) scoredActions];
    double v26 = [v25 objectAtIndexedSubscript:*((int *)v101 + 6)];
    long long v27 = [v26 predictedItem];

    double v28 = [*(id *)(v11 + 16) scoredActions];
    double v29 = [v28 objectAtIndexedSubscript:*((int *)v101 + 6)];
    [v29 score];
    float v31 = v30;

    float v32 = objc_opt_new();
    double v33 = (NSMutableDictionary *)objc_opt_new();
    [(NSMutableDictionary *)v33 setObject:@"Top" forKeyedSubscript:@"CacheSection"];
    double v34 = [NSNumber numberWithLongLong:*((int *)v101 + 6)];
    [(NSMutableDictionary *)v33 setObject:v34 forKeyedSubscript:@"CacheRank"];

    [v32 setCacheRank:*((unsigned int *)v101 + 6)];
    int v35 = [*(id *)(v11 + 16) indexWasShown:*((int *)v101 + 6)];
    v36 = (void *)MEMORY[0x1E4F1CC28];
    if (v35) {
      v36 = (void *)MEMORY[0x1E4F1CC38];
    }
    id v37 = v36;
    [(NSMutableDictionary *)v33 setObject:v37 forKeyedSubscript:@"Shown"];

    objc_msgSend(v32, "setShown:", objc_msgSend(*(id *)(v11 + 16), "indexWasShown:", *((int *)v101 + 6)));
    if (*(unsigned char *)(v11 + 32))
    {
      id v38 = v27;
      id v39 = v88;
      if (v88
        && ([v38 actionKey],
            v40 = objc_claimAutoreleasedReturnValue(),
            [v39 actionKey],
            v41 = objc_claimAutoreleasedReturnValue(),
            char v42 = [v40 isEqualToString:v41],
            v41,
            v40,
            (v42 & 1) != 0))
      {
        if (+[_ATXActionUtils isContainmentBetweenAction:v38 other:v39])
        {
          uint64_t v43 = 7;
        }
        else
        {
          uint64_t v43 = 8;
        }
      }
      else
      {
        uint64_t v43 = 9;
      }

      if (v43 != 9 && *v83 != 7) {
        uint64_t *v83 = v43;
      }
      int v44 = (unint64_t)(v43 - 7) < 2;
      uint64_t v45 = engagementTypeForPrediction(v43, v44);
    }
    else
    {
      uint64_t v46 = *(void *)(v11 + 8);
      id v47 = v27;
      id v48 = v88;
      int v44 = 0;
      switch(v46)
      {
        case 2:
        case 4:
          int v44 = +[_ATXActionUtils isContainmentBetweenAction:v47 other:v48];
          break;
        case 3:
          uint64_t v52 = [v47 actionKey];
          double v53 = [v48 actionKey];
          int v44 = [v52 isEqualToString:v53];

          goto LABEL_30;
        case 5:
        case 6:
          break;
        default:
          double v49 = __atxlog_handle_default();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            double v50 = [MEMORY[0x1E4F4AE58] engagementTypeToString:v46];
            -[ATXActionSessionLog constructActionDataDictionaryWithEngagedIndicesOut:andAWDActionOut:andEngagementTypeFound:forTestingMode:](v50, buf, v108, v49);
          }

          v51 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v52 = [MEMORY[0x1E4F4AE58] engagementTypeToString:v46];
          [v51 raise:v81, @"%@ is not a valid engagment type to call matchesEngagedAction with", v52 format];
          int v44 = 0;
LABEL_30:

          break;
      }

      uint64_t v45 = engagementTypeForPrediction(*(void *)(v11 + 8), v44);
    }
    v54 = (void *)v45;
    [(NSMutableDictionary *)v33 setObject:v45 forKeyedSubscript:@"Engaged"];
    [v32 setEngaged:v54];
    if (v44)
    {
      double v55 = [NSNumber numberWithInt:*((unsigned int *)v101 + 6)];
      [v82 addObject:v55];
    }
    double v56 = v31;
    if (fabs(v31) == INFINITY) {
      double v56 = -31337.0;
    }
    double v57 = [NSNumber numberWithDouble:v56];
    [(NSMutableDictionary *)v33 setObject:v57 forKeyedSubscript:@"Score"];

    [v32 setScore:v31];
    v58 = [v27 actionKey];
    [(NSMutableDictionary *)v33 setObject:v58 forKeyedSubscript:@"ActionKey"];

    double v59 = [v27 actionKey];
    [v32 setActionKey:v59];

    if (ATXDetailedActionLoggingEnabled())
    {
      double v60 = objc_msgSend(MEMORY[0x1E4F4AE58], "actionTypeToString:", objc_msgSend(v27, "actionType"));
      [(NSMutableDictionary *)v33 setObject:v60 forKeyedSubscript:@"ActionType"];

      v61 = [v27 actionTitle];
      [(NSMutableDictionary *)v33 setObject:v61 forKeyedSubscript:@"ActionTitle"];

      v62 = [v27 slotSet];
      double v63 = [v62 parameters];
      double v64 = [v63 allObjects];
      [(NSMutableDictionary *)v33 setObject:v64 forKeyedSubscript:@"SlotSet"];
    }
    if ([v27 isHeuristic])
    {
      id v65 = [v27 heuristic];
      [(NSMutableDictionary *)v33 setObject:v65 forKeyedSubscript:@"Heuristic"];

      v66 = [v27 heuristic];
      [v32 setHeuristicName:v66];
    }
    int v67 = [v27 isFutureMedia];
    double v68 = (void *)MEMORY[0x1E4F1CC28];
    if (v67) {
      double v68 = (void *)MEMORY[0x1E4F1CC38];
    }
    id v69 = v68;
    [(NSMutableDictionary *)v33 setObject:v69 forKeyedSubscript:@"IsFutureMedia"];

    objc_msgSend(v32, "setFutureMedia:", objc_msgSend(v27, "isFutureMedia"));
    if ((v86 & 1) == 0)
    {
      if (v84)
      {
        [(ATXActionCacheReader *)v84 predictionItemForAction:v27];
        v104[0] = 0;
        float v106 = -31337.0;
        for (uint64_t i = 16; i != 3284; i += 4)
          *(float *)((char *)v104 + i) = -31337.0;
        int v71 = memcmp(&v99[2], &v105, 0xCC4uLL);
        long long v72 = (void *)v104[0];
        if (v71 || v98 | v104[0] && (!v98 || !v104[0] || ([(id)v98 isEqualToString:v104[0]] & 1) == 0))
        {

          goto LABEL_48;
        }
        BOOL v75 = v99[819] == v106;

        if (!v75)
        {
LABEL_48:
          v97.key = (NSString *)(id)v98;
          memcpy(&v97.actionHash, v99, 0xCD2uLL);
          addScoreInputsForPredictionItemToDictionary(&v97, v33);
        }
      }
      double v73 = +[ATXAWDUtils subscoresWithDictionary:v33];
      [v32 setSubscores:v73];
    }
    uint64_t v74 = (void *)[(NSMutableDictionary *)v33 copy];
    [v89 addObject:v74];

    [*v85 addActionData:v32];
    int v19 = *((_DWORD *)v101 + 6) + 1;
    *((_DWORD *)v101 + 6) = v19;
  }
  if (v84 && (v86 & 1) == 0)
  {
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __128__ATXActionSessionLog_constructActionDataDictionaryWithEngagedIndicesOut_andAWDActionOut_andEngagementTypeFound_forTestingMode___block_invoke;
    v90[3] = &unk_1E68ABDA8;
    double v94 = &v100;
    v90[4] = v11;
    id v91 = v88;
    uint64_t v95 = v83;
    id v92 = v82;
    id v93 = v89;
    uint64_t v96 = v85;
    [(ATXActionCacheReader *)v84 enumerateExtraPredictionItemsWithBlock:v90];
  }
  uint64_t v76 = [v82 copy];
  id v77 = *v80;
  void *v80 = (void *)v76;

  double v78 = (void *)[v89 copy];
  _Block_object_dispose(&v100, 8);

  return v78;
}

void __128__ATXActionSessionLog_constructActionDataDictionaryWithEngagedIndicesOut_andAWDActionOut_andEngagementTypeFound_forTestingMode___block_invoke(uint64_t a1, float *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSMutableDictionary *)objc_opt_new();
  v40 = v4;
  id v5 = objc_opt_new();
  v41 = v5;
  [(NSMutableDictionary *)v4 setObject:@"Other" forKeyedSubscript:@"CacheSection"];
  uint64_t v6 = [NSNumber numberWithLongLong:*(int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [(NSMutableDictionary *)v4 setObject:v6 forKeyedSubscript:@"CacheRank"];

  [v5 setCacheRank:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  [(NSMutableDictionary *)v4 setObject:*(void *)a2 forKeyedSubscript:@"ActionKey"];
  [v5 setActionKey:*(void *)a2];
  double v7 = a2[821];
  if (fabs(v7) == INFINITY) {
    double v7 = -31337.0;
  }
  id v8 = [NSNumber numberWithDouble:v7];
  [(NSMutableDictionary *)v4 setObject:v8 forKeyedSubscript:@"Score"];

  [v5 setScore:a2[821]];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    uint64_t v9 = +[_ATXActionUtils slotSetsForAction:*(void *)(a1 + 40)];
  }
  else
  {
    double v10 = [*(id *)(a1 + 40) slotSet];
    uint64_t v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = (id)[objc_alloc(MEMORY[0x1E4F4B308]) initWithOpaqueParameters];
    }
    uint64_t v13 = v12;

    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
  }
  id v14 = *(id *)a2;
  uint64_t v15 = *((void *)a2 + 1);
  __src = a2 + 2;
  id v16 = *(id *)(a1 + 40);
  id v17 = v9;
  id v38 = (id *)a2;
  uint64_t v39 = a1;
  if (v16
    && ([v16 actionKey],
        id v18 = objc_claimAutoreleasedReturnValue(),
        char v19 = [v18 isEqualToString:v14],
        v18,
        (v19 & 1) != 0))
  {
    long long v46 = 0u;
    long long v45 = 0u;
    long long v44 = 0u;
    long long v43 = 0u;
    id v20 = v17;
    id v36 = v17;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v44;
      uint64_t v23 = 7;
LABEL_13:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v20);
        }
        double v25 = [[ATXMinimalSlotResolutionParameters alloc] initWithAction:v16 slots:*(void *)(*((void *)&v43 + 1) + 8 * v24)];
        BOOL v26 = [(ATXMinimalSlotResolutionParameters *)v25 hash] == v15;

        if (v26) {
          break;
        }
        if (v21 == ++v24)
        {
          uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v21) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }
    }
    else
    {
LABEL_19:
      uint64_t v23 = 8;
    }

    id v17 = v36;
  }
  else
  {
    uint64_t v23 = 9;
  }

  if (v23 != 9)
  {
    long long v27 = *(uint64_t **)(v39 + 72);
    if (*v27 != 7) {
      uint64_t *v27 = v23;
    }
  }
  double v28 = v40;
  double v29 = engagementTypeForPrediction(v23, (unint64_t)(v23 - 7) < 2);
  [(NSMutableDictionary *)v40 setObject:v29 forKeyedSubscript:@"Engaged"];
  float v30 = v38;
  [v41 setEngaged:v29];
  if ((unint64_t)(v23 - 7) <= 1)
  {
    float v31 = *(void **)(v39 + 48);
    float v32 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(v39 + 64) + 8) + 24)];
    [v31 addObject:v32];

    double v28 = v40;
    float v30 = v38;
  }
  v42.key = (NSString *)*v30;
  memcpy(&v42.actionHash, __src, 0xCD2uLL);
  addScoreInputsForPredictionItemToDictionary(&v42, v28);
  double v33 = +[ATXAWDUtils subscoresWithDictionary:v28];
  [v41 setSubscores:v33];

  double v34 = *(void **)(v39 + 56);
  int v35 = (void *)[(NSMutableDictionary *)v40 copy];
  [v34 addObject:v35];

  [**(id **)(v39 + 80) addActionData:v41];
  ++*(_DWORD *)(*(void *)(*(void *)(v39 + 64) + 8) + 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_actionResponse, 0);
}

- (void)constructSessionLogDictionaryWithAWDSessionOut:(os_log_t)log forTestingMode:.cold.1(unsigned __int8 a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Action Session Log: detected invalid consumerSubType of %hhu for AB group", buf, 8u);
}

- (void)constructActionDataDictionaryWithEngagedIndicesOut:(void *)a1 andAWDActionOut:(uint8_t *)buf andEngagementTypeFound:(void *)a3 forTestingMode:(os_log_t)log .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%@ is not a valid engagment type to call matchesEngagedAction with", buf, 0xCu);
}

@end