@interface ATXModeScoringSession
+ (id)coalesceSessions:(id)a3 modeEntityStore:(id)a4;
- (ATXModeEntityAffinityVector)sessionAffinityVector;
- (ATXModeEntityStore)modeEntityStore;
- (BOOL)hasModeWithinRank:(unint64_t)a3 rank:(unint64_t)a4;
- (BOOL)isLabeled;
- (BOOL)isStronglyCorrelatedWithTopMode;
- (NSArray)appLaunches;
- (double)affinityForMode:(unint64_t)a3;
- (double)duration;
- (double)endTimestamp;
- (double)numScoredAppLaunches;
- (double)secondsUntilOtherSession:(id)a3;
- (double)startTimestamp;
- (id)_initFromStartTime:(double)a3 endTime:(double)a4 modeEntityStore:(id)a5 appLaunches:(id)a6 sessionAffinityVector:(id)a7;
- (id)_weightForLaunch:(id)a3;
- (id)initFromStartTime:(double)a3 endTime:(double)a4 modeEntityStore:(id)a5;
- (unint64_t)topMode;
- (void)_populateAffinity;
- (void)debug_prettyPrintSession:(BOOL)a3;
- (void)populateAppLaunches:(id)a3;
- (void)setSessionAffinityVector:(id)a3;
@end

@implementation ATXModeScoringSession

- (id)initFromStartTime:(double)a3 endTime:(double)a4 modeEntityStore:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXModeScoringSession;
  v10 = [(ATXModeScoringSession *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_startTimestamp = a3;
    v10->_endTimestamp = a4;
    uint64_t v12 = objc_opt_new();
    appLaunches = v11->_appLaunches;
    v11->_appLaunches = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_modeEntityStore, a5);
  }

  return v11;
}

- (id)_initFromStartTime:(double)a3 endTime:(double)a4 modeEntityStore:(id)a5 appLaunches:(id)a6 sessionAffinityVector:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)ATXModeScoringSession;
  v16 = [(ATXModeScoringSession *)&v19 init];
  p_isa = (id *)&v16->super.isa;
  if (v16)
  {
    v16->_startTimestamp = a3;
    v16->_endTimestamp = a4;
    objc_storeStrong((id *)&v16->_appLaunches, a6);
    objc_storeStrong(p_isa + 5, a5);
    objc_storeStrong(p_isa + 4, a7);
  }

  return p_isa;
}

- (BOOL)isStronglyCorrelatedWithTopMode
{
  v2 = [(ATXModeEntityAffinityVector *)self->_sessionAffinityVector sortedAffinities];
  v3 = v2;
  if (v2 && [v2 count])
  {
    if ([v3 count] == 1)
    {
      BOOL v4 = 1;
    }
    else
    {
      v5 = [v3 objectAtIndexedSubscript:0];
      v6 = [v5 first];
      [v6 doubleValue];
      double v8 = v7;
      id v9 = [v3 objectAtIndexedSubscript:1];
      v10 = [v9 first];
      [v10 doubleValue];
      BOOL v4 = v8 > v11 + v11;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)hasModeWithinRank:(unint64_t)a3 rank:(unint64_t)a4
{
  v5 = [(ATXModeEntityAffinityVector *)self->_sessionAffinityVector sortedAffinities];
  v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_10);

  unint64_t v7 = [v6 count];
  if (v7 >= a4) {
    unint64_t v8 = a4;
  }
  else {
    unint64_t v8 = v7;
  }
  id v9 = objc_msgSend(v6, "subarrayWithRange:", 0, v8);
  v10 = ATXModeToString();
  char v11 = [v9 containsObject:v10];

  return v11;
}

uint64_t __48__ATXModeScoringSession_hasModeWithinRank_rank___block_invoke(uint64_t a1, void *a2)
{
  return [a2 second];
}

- (double)numScoredAppLaunches
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = self->_appLaunches;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        modeEntityStore = self->_modeEntityStore;
        v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "bundleID", (void)v14);
        char v11 = [(ATXModeEntityStore *)modeEntityStore appEntityForBundleId:v10];
        uint64_t v12 = [v11 affinityVector];

        if (v12) {
          double v7 = v7 + 1.0;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (double)secondsUntilOtherSession:(id)a3
{
  id v4 = a3;
  [v4 startTimestamp];
  p_endTimestamp = &self->_endTimestamp;
  if (v6 > self->_endTimestamp)
  {
    [v4 startTimestamp];
LABEL_5:
    double v10 = v7 - *p_endTimestamp;
    goto LABEL_6;
  }
  [v4 endTimestamp];
  double startTimestamp = self->_startTimestamp;
  p_double startTimestamp = &self->_startTimestamp;
  double v10 = 0.0;
  if (v11 < startTimestamp)
  {
    [v4 endTimestamp];
    p_endTimestamp = p_startTimestamp;
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

- (double)duration
{
  return self->_endTimestamp - self->_startTimestamp;
}

- (BOOL)isLabeled
{
  sessionAffinityVector = self->_sessionAffinityVector;
  if (sessionAffinityVector) {
    LOBYTE(sessionAffinityVector) = ![(ATXModeEntityAffinityVector *)sessionAffinityVector isZeroVector];
  }
  return (char)sessionAffinityVector;
}

- (unint64_t)topMode
{
  v2 = [(ATXModeEntityAffinityVector *)self->_sessionAffinityVector sortedAffinities];
  if ([v2 count])
  {
    v3 = [v2 objectAtIndexedSubscript:0];
    id v4 = [v3 second];
    unint64_t v5 = ATXStringToMode();
  }
  else
  {
    unint64_t v5 = 16;
  }

  return v5;
}

- (double)affinityForMode:(unint64_t)a3
{
  [(ATXModeEntityAffinityVector *)self->_sessionAffinityVector scoreForMode:a3];
  return result;
}

+ (id)coalesceSessions:(id)a3 modeEntityStore:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;

  double v10 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        [v18 startTimestamp];
        if (v19 < v9) {
          double v9 = v19;
        }
        [v18 endTimestamp];
        if (v20 >= v12) {
          double v12 = v20;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v15);
  }

  v21 = objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_17);
  v22 = +[ATXModeEntityAffinityVector weightedCentroid:v21];
  v23 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v24 = v13;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "appLaunches", (void)v32);
        [v23 addObjectsFromArray:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v26);
  }

  id v30 = [[ATXModeScoringSession alloc] _initFromStartTime:v6 endTime:v23 modeEntityStore:v22 appLaunches:v9 sessionAffinityVector:v12];
  return v30;
}

id __58__ATXModeScoringSession_coalesceSessions_modeEntityStore___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F93BB8];
  id v3 = a2;
  id v4 = [v3 sessionAffinityVector];
  id v5 = NSNumber;
  [v3 numScoredAppLaunches];
  double v7 = v6;

  double v8 = [v5 numberWithDouble:v7];
  double v9 = [v2 tupleWithFirst:v4 second:v8];

  return v9;
}

- (void)populateAppLaunches:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  appLaunches = self->_appLaunches;
  self->_appLaunches = v4;

  [(ATXModeScoringSession *)self _populateAffinity];
}

- (void)_populateAffinity
{
  appLaunches = self->_appLaunches;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ATXModeScoringSession__populateAffinity__block_invoke;
  v7[3] = &unk_1E68ABFE0;
  v7[4] = self;
  id v4 = [(NSArray *)appLaunches _pas_mappedArrayWithTransform:v7];
  id v5 = +[ATXModeEntityAffinityVector weightedCentroid:v4];
  sessionAffinityVector = self->_sessionAffinityVector;
  self->_sessionAffinityVector = v5;
}

id __42__ATXModeScoringSession__populateAffinity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  id v5 = [v4 bundleID];
  double v6 = [v3 appEntityForBundleId:v5];
  double v7 = [v6 affinityVector];

  double v8 = [*(id *)(a1 + 32) _weightForLaunch:v4];

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    double v10 = 0;
  }
  else
  {
    double v10 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v7 second:v8];
  }

  return v10;
}

- (id)_weightForLaunch:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[_ATXAppLaunchHistogramManager sharedInstance];
  id v5 = [v4 histogramForLaunchType:0];

  double v6 = [v3 bundleID];

  v12[0] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v5 totalLaunchesForBundleIds:v7];
  double v9 = v8;

  double v10 = [NSNumber numberWithDouble:1.0 / sqrt(v9 + 1.0)];

  return v10;
}

- (void)debug_prettyPrintSession:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  double v6 = (void *)MEMORY[0x1E4F28C10];
  double v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v8 = [v6 dateFormatFromTemplate:@"EMMMd HH:mm ss ZZZZ" options:0 locale:v7];

  [v5 setDateFormat:v8];
  double v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_startTimestamp];
  double v10 = [v5 stringFromDate:v9];

  double v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_endTimestamp];
  double v12 = [v5 stringFromDate:v11];

  id v13 = __atxlog_handle_modes();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(ATXModeEntityAffinityVector *)self->_sessionAffinityVector prettyDescription];
    *(_DWORD *)buf = 138412802;
    uint64_t v42 = v10;
    __int16 v43 = 2112;
    v44 = v12;
    __int16 v45 = 2112;
    v46 = v14;
    _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Session: %@, %@: %@", buf, 0x20u);
  }
  if (v3)
  {
    long long v32 = v12;
    long long v33 = v10;
    long long v34 = v8;
    id v35 = v5;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v15 = self->_appLaunches;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          modeEntityStore = self->_modeEntityStore;
          v22 = objc_msgSend(v20, "bundleID", v32, v33, v34, v35);
          v23 = [(ATXModeEntityStore *)modeEntityStore appEntityForBundleId:v22];

          uint64_t v24 = [v23 affinityVector];
          if (v24)
          {
            uint64_t v25 = (void *)v24;
            uint64_t v26 = [v23 affinityVector];
            char v27 = [v26 isZeroVector];

            if ((v27 & 1) == 0)
            {
              v28 = __atxlog_handle_modes();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = [v20 bundleID];
                id v30 = [v23 affinityVector];
                v31 = [v30 prettyDescription];
                *(_DWORD *)buf = 138412546;
                uint64_t v42 = v29;
                __int16 v43 = 2112;
                v44 = v31;
                _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "    App Launch: %@, %@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v17);
    }

    double v8 = v34;
    id v5 = v35;
    double v12 = v32;
    double v10 = v33;
  }
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (NSArray)appLaunches
{
  return self->_appLaunches;
}

- (ATXModeEntityAffinityVector)sessionAffinityVector
{
  return self->_sessionAffinityVector;
}

- (void)setSessionAffinityVector:(id)a3
{
}

- (ATXModeEntityStore)modeEntityStore
{
  return self->_modeEntityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEntityStore, 0);
  objc_storeStrong((id *)&self->_sessionAffinityVector, 0);
  objc_storeStrong((id *)&self->_appLaunches, 0);
}

@end