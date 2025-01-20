@interface _DASSubmissionRateLimiter
+ (id)sharedLimiter;
- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4;
- (BOOL)limitsApplyToActivity:(id)a3;
- (BOOL)testing;
- (BOOL)trackActivity:(id)a3;
- (NSCountedSet)penaltyTracker;
- (NSCountedSet)submittedActivityTracker;
- (NSMutableArray)majorPenaltyActivities;
- (NSMutableArray)minorPenaltyActivities;
- (NSString)limitationName;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)submissionTimer;
- (OS_os_log)log;
- (_DASSubmissionRateLimiter)init;
- (id)shouldLimitActivityAtSubmission:(id)a3;
- (int)token;
- (os_unfair_lock_s)penaltyLock;
- (unint64_t)majorPenaltyTimerCount;
- (unint64_t)minorPenaltyTimerCount;
- (void)addToPenaltyBox:(id)a3;
- (void)addToTracker:(id)a3;
- (void)init;
- (void)removeAll;
- (void)removeAllFromActivityTracker;
- (void)setLimitationName:(id)a3;
- (void)setLog:(id)a3;
- (void)setMajorPenaltyActivities:(id)a3;
- (void)setMajorPenaltyTimerCount:(unint64_t)a3;
- (void)setMinorPenaltyActivities:(id)a3;
- (void)setMinorPenaltyTimerCount:(unint64_t)a3;
- (void)setPenaltyLock:(os_unfair_lock_s)a3;
- (void)setPenaltyTracker:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSubmissionTimer:(id)a3;
- (void)setSubmittedActivityTracker:(id)a3;
- (void)setTesting:(BOOL)a3;
- (void)setToken:(int)a3;
- (void)timerHandler;
@end

@implementation _DASSubmissionRateLimiter

- (BOOL)limitsApplyToActivity:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 schedulingPriority];
  if (v4 > _DASSchedulingPriorityDefault) {
    goto LABEL_16;
  }
  uint64_t v5 = [v3 groupName];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v3 groupName];
    if ([v7 isEqualToString:_DASDefaultNetworkGroupName])
    {
LABEL_6:

      goto LABEL_7;
    }
    v8 = [v3 groupName];
    if ([v8 isEqualToString:_DASDefaultGroupName])
    {

      goto LABEL_6;
    }
    v23 = [v3 groupName];
    char v24 = [v23 isEqualToString:_DASDefaultRemoteGroupName];

    if ((v24 & 1) == 0) {
      goto LABEL_16;
    }
  }
LABEL_7:
  v9 = [v3 rateLimitConfigurationName];
  char v10 = [v9 isEqualToString:@"CloudKitConfiguration"];

  if (v10) {
    goto LABEL_16;
  }
  v11 = [v3 rateLimitConfigurationName];
  char v12 = [v11 isEqualToString:@"PECConfiguration"];

  if (v12) {
    goto LABEL_16;
  }
  v13 = +[_DASPlistParser sharedInstance];
  char v14 = [v13 containsOverrideForActivity:v3 withLimitation:@"ActivityRate"];

  if (v14) {
    goto LABEL_16;
  }
  v15 = [v3 name];

  if (!v15) {
    goto LABEL_17;
  }
  v16 = [v3 userInfo];
  v17 = [v16 objectForKeyedSubscript:@"com.apple.das.overrideRateLimiting"];
  char v18 = [v17 BOOLValue];

  if ((v18 & 1) != 0
    || ([v3 userInfo],
        v19 = objc_claimAutoreleasedReturnValue(),
        [v19 objectForKeyedSubscript:@"com.apple.das.overrideRateLimiting"],
        v20 = objc_claimAutoreleasedReturnValue(),
        char v21 = [v20 BOOLValue],
        v20,
        v19,
        (v21 & 1) != 0))
  {
LABEL_16:
    LOBYTE(v15) = 0;
    goto LABEL_17;
  }
  if ([v3 requestsApplicationLaunch])
  {
    v15 = [v3 launchReason];
    char v22 = [v15 isEqualToString:@"com.apple.das.launchreason.push"];

    LOBYTE(v15) = v22 ^ 1;
  }
  else
  {
    LOBYTE(v15) = 1;
  }
LABEL_17:

  return (char)v15;
}

+ (id)sharedLimiter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___DASSubmissionRateLimiter_sharedLimiter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLimiter_onceToken != -1) {
    dispatch_once(&sharedLimiter_onceToken, block);
  }
  v2 = (void *)sharedLimiter_limitation;

  return v2;
}

- (_DASSubmissionRateLimiter)init
{
  v33.receiver = self;
  v33.super_class = (Class)_DASSubmissionRateLimiter;
  v2 = [(_DASSubmissionRateLimiter *)&v33 init];
  id v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_limitationName, @"ActivityRate");
    uint64_t v4 = [MEMORY[0x1E4F28BD0] set];
    submittedActivityTracker = v3->_submittedActivityTracker;
    v3->_submittedActivityTracker = (NSCountedSet *)v4;

    uint64_t v6 = [MEMORY[0x1E4F28BD0] set];
    penaltyTracker = v3->_penaltyTracker;
    v3->_penaltyTracker = (NSCountedSet *)v6;

    v3->_minorPenaltyTimerCount = 0;
    v3->_majorPenaltyTimerCount = 0;
    minorPenaltyActivities = v3->_minorPenaltyActivities;
    v3->_minorPenaltyActivities = 0;

    majorPenaltyActivities = v3->_majorPenaltyActivities;
    v3->_majorPenaltyActivities = 0;

    os_log_t v10 = os_log_create("com.apple.duetactivityscheduler", "activityRateLimiter");
    log = v3->_log;
    v3->_log = (OS_os_log *)v10;

    char v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.dasd.overrideQueue", v12);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v13;

    v3->_token = -1;
    v15 = v3->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __33___DASSubmissionRateLimiter_init__block_invoke;
    handler[3] = &unk_1E6112A98;
    v16 = v3;
    v32 = v16;
    notify_register_dispatch("com.apple.dasd.overrideSubmissionLimits", &v3->_token, v15, handler);
    uint64_t state64 = 0;
    uint64_t state = notify_get_state([(_DASSubmissionRateLimiter *)v16 token], &state64);
    char v18 = [(_DASSubmissionRateLimiter *)v16 log];
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if (state)
    {
      if (v19) {
        -[_DASSubmissionRateLimiter init](state);
      }

      BOOL v20 = 0;
    }
    else
    {
      if (v19) {
        -[_DASSubmissionRateLimiter init](&state64);
      }

      BOOL v20 = state64 != 0;
    }
    [(_DASSubmissionRateLimiter *)v16 setTesting:v20];
    v16->_penaltyLock._os_unfair_lock_opaque = 0;
    char v21 = dispatch_get_global_queue(-32768, 0);
    dispatch_source_t v22 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v21);
    submissionTimer = v16->_submissionTimer;
    v16->_submissionTimer = (OS_dispatch_source *)v22;

    char v24 = v16->_submissionTimer;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __33___DASSubmissionRateLimiter_init__block_invoke_6;
    v28[3] = &unk_1E6112A70;
    v29 = v16;
    dispatch_source_set_event_handler(v24, v28);
    v25 = v16->_submissionTimer;
    dispatch_time_t v26 = dispatch_walltime(0, 1800000000000);
    dispatch_source_set_timer(v25, v26, 0x1A3185C5000uLL, 0xDF8475800uLL);
    dispatch_activate((dispatch_object_t)v16->_submissionTimer);
  }
  return v3;
}

- (int)token
{
  return self->_token;
}

- (void)setTesting:(BOOL)a3
{
  self->_testing = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (BOOL)trackActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_DASSubmissionRateLimiter *)self limitsApplyToActivity:v4];
  if (v5) {
    [(_DASSubmissionRateLimiter *)self addToTracker:v4];
  }

  return v5;
}

- (void)addToTracker:(id)a3
{
  id v7 = a3;
  if (-[_DASSubmissionRateLimiter limitsApplyToActivity:](self, "limitsApplyToActivity:"))
  {
    id v4 = self->_submittedActivityTracker;
    objc_sync_enter(v4);
    submittedActivityTracker = self->_submittedActivityTracker;
    uint64_t v6 = [v7 name];
    [(NSCountedSet *)submittedActivityTracker addObject:v6];

    objc_sync_exit(v4);
    [(_DASSubmissionRateLimiter *)self addToPenaltyBox:v7];
  }
}

- (void)addToPenaltyBox:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(_DASSubmissionRateLimiter *)self limitsApplyToActivity:v4]) {
    goto LABEL_38;
  }
  os_unfair_lock_lock(&self->_penaltyLock);
  minorPenaltyActivities = self->_minorPenaltyActivities;
  if (minorPenaltyActivities)
  {
    uint64_t v6 = [v4 name];
    int v7 = [(NSMutableArray *)minorPenaltyActivities containsObject:v6];
  }
  else
  {
    int v7 = 0;
  }
  os_unfair_lock_unlock(&self->_penaltyLock);
  v8 = self->_submittedActivityTracker;
  objc_sync_enter(v8);
  if (v7)
  {
    penaltyTracker = self->_penaltyTracker;
    os_log_t v10 = [v4 name];
    unint64_t v11 = [(NSCountedSet *)penaltyTracker countForObject:v10];

    if (v11 >= 0x13)
    {
      os_unfair_lock_lock(&self->_penaltyLock);
      majorPenaltyActivities = self->_majorPenaltyActivities;
      if (!majorPenaltyActivities)
      {
        dispatch_queue_t v13 = [MEMORY[0x1E4F1CA48] array];
        char v14 = self->_majorPenaltyActivities;
        self->_majorPenaltyActivities = v13;

        majorPenaltyActivities = self->_majorPenaltyActivities;
      }
      v15 = [v4 name];
      [(NSMutableArray *)majorPenaltyActivities addObject:v15];

      v16 = self->_minorPenaltyActivities;
      v17 = [v4 name];
      [(NSMutableArray *)v16 removeObject:v17];

      os_unfair_lock_unlock(&self->_penaltyLock);
      char v18 = self->_log;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v19 = [v4 name];
        int v49 = 138412290;
        id v50 = v19;
        _os_log_impl(&dword_1B578B000, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "%@ added to major penalty", (uint8_t *)&v49, 0xCu);
      }
    }
  }
  objc_sync_exit(v8);

  os_unfair_lock_lock(&self->_penaltyLock);
  BOOL v20 = self->_minorPenaltyActivities;
  if (v20)
  {
    v8 = [v4 name];
    if ([(NSMutableArray *)v20 containsObject:v8])
    {
      char v21 = 1;
LABEL_22:

      goto LABEL_23;
    }
    dispatch_source_t v22 = self->_majorPenaltyActivities;
    if (!v22)
    {
      char v21 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    dispatch_source_t v22 = self->_majorPenaltyActivities;
    if (!v22)
    {
      char v21 = 0;
      goto LABEL_23;
    }
  }
  BOOL v23 = v20 == 0;
  char v24 = [v4 name];
  char v21 = [(NSMutableArray *)v22 containsObject:v24];

  if (!v23) {
    goto LABEL_22;
  }
LABEL_23:
  os_unfair_lock_unlock(&self->_penaltyLock);
  v25 = self->_submittedActivityTracker;
  objc_sync_enter(v25);
  if ((v21 & 1) == 0)
  {
    submittedActivityTracker = self->_submittedActivityTracker;
    v27 = [v4 name];
    LODWORD(submittedActivityTracker) = [(NSCountedSet *)submittedActivityTracker countForObject:v27] > 6;

    if (submittedActivityTracker)
    {
      os_unfair_lock_lock(&self->_penaltyLock);
      v28 = self->_minorPenaltyActivities;
      if (!v28)
      {
        v29 = [MEMORY[0x1E4F1CA48] array];
        v30 = self->_minorPenaltyActivities;
        self->_minorPenaltyActivities = v29;

        v28 = self->_minorPenaltyActivities;
      }
      v31 = [v4 name];
      [(NSMutableArray *)v28 addObject:v31];

      os_unfair_lock_unlock(&self->_penaltyLock);
      v32 = self->_log;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v33 = [v4 name];
        int v49 = 138412290;
        id v50 = v33;
        _os_log_impl(&dword_1B578B000, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "%@ added to minor penalty", (uint8_t *)&v49, 0xCu);
      }
    }
  }
  objc_sync_exit(v25);

  v34 = [(_DASSubmissionRateLimiter *)self shouldLimitActivityAtSubmission:v4];
  if (+[_DASLimiterResponse queryActivityDecision:2 fromResponses:v34])
  {
    v35 = [v34 objectAtIndexedSubscript:0];
    [v35 validityDuration];
    double v37 = v36;
    v38 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");
    v39 = [v4 startAfter];
    v40 = v39;
    if (!v39
      || ([v39 earlierDate:v38],
          v41 = objc_claimAutoreleasedReturnValue(),
          BOOL v42 = v41 == v40,
          v41,
          v42))
    {
      [v4 setStartAfter:v38];
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v44 = NSNumber;
      v45 = log;
      v46 = [v44 numberWithDouble:v37 / 60.0];
      int v49 = 138412546;
      id v50 = v4;
      __int16 v51 = 2112;
      v52 = v46;
      _os_log_impl(&dword_1B578B000, v45, OS_LOG_TYPE_DEFAULT, "%@ is rate limited by submission rate limiter by %@ min from now", (uint8_t *)&v49, 0x16u);
    }
    os_unfair_lock_lock(&self->_penaltyLock);
    v47 = self->_penaltyTracker;
    v48 = [v4 name];
    [(NSCountedSet *)v47 addObject:v48];

    os_unfair_lock_unlock(&self->_penaltyLock);
    [(_DASSubmissionRateLimiter *)self limitedActivity:v4 withLimitsResponses:v34];
  }
LABEL_38:
}

- (id)shouldLimitActivityAtSubmission:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(_DASSubmissionRateLimiter *)self limitsApplyToActivity:v4])
  {
    unint64_t v11 = 0;
    goto LABEL_27;
  }
  os_unfair_lock_lock(&self->_penaltyLock);
  minorPenaltyActivities = self->_minorPenaltyActivities;
  if (minorPenaltyActivities)
  {
    uint64_t v6 = [v4 name];
    int v7 = [(NSMutableArray *)minorPenaltyActivities containsObject:v6];

    majorPenaltyActivities = self->_majorPenaltyActivities;
    if (v7)
    {
      if (!majorPenaltyActivities)
      {
        os_unfair_lock_unlock(&self->_penaltyLock);
        char v14 = @"Submitted > 6x in 30 min";
        double v15 = 1800.0;
LABEL_21:
        if (self->_testing)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v23 = v4;
            _os_log_impl(&dword_1B578B000, log, OS_LOG_TYPE_DEFAULT, "Overriding submission rate limits for activity %@", buf, 0xCu);
          }
          v16 = +[_DASLimiterResponse limitResponseWithDecision:0 withLimiter:@"ActivityRate" validityDuration:0 rationale:0.0];
          char v21 = v16;
          v17 = &v21;
        }
        else
        {
          v16 = +[_DASLimiterResponse limitResponseWithDecision:2 withLimiter:@"ActivityRate" validityDuration:v14 rationale:v15];
          BOOL v20 = v16;
          v17 = &v20;
        }
        goto LABEL_26;
      }
      char v9 = 1;
      os_log_t v10 = @"Submitted > 6x in 30 min";
      goto LABEL_9;
    }
    if (!majorPenaltyActivities)
    {
LABEL_18:
      os_unfair_lock_unlock(&self->_penaltyLock);
      goto LABEL_19;
    }
  }
  else
  {
    majorPenaltyActivities = self->_majorPenaltyActivities;
    if (!majorPenaltyActivities) {
      goto LABEL_18;
    }
  }
  char v9 = 0;
  os_log_t v10 = &stru_1F0E63E70;
LABEL_9:
  char v12 = [v4 name];
  int v13 = [(NSMutableArray *)majorPenaltyActivities containsObject:v12];

  os_unfair_lock_unlock(&self->_penaltyLock);
  if (v13) {
    char v14 = @"Submitted > 18x in 2 hrs";
  }
  else {
    char v14 = v10;
  }
  double v15 = 1800.0;
  if (v13) {
    double v15 = 7200.0;
  }
  if (v13 & 1) != 0 || (v9) {
    goto LABEL_21;
  }
LABEL_19:
  v16 = +[_DASLimiterResponse limitResponseWithDecision:0 withLimiter:@"ActivityRate" validityDuration:0 rationale:0.0];
  v24[0] = v16;
  v17 = (void **)v24;
LABEL_26:
  unint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 1, v20, v21);

LABEL_27:

  return v11;
}

- (BOOL)limitedActivity:(id)a3 withLimitsResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_DASSubmissionRateLimiter *)self limitsApplyToActivity:v6]
    && +[_DASLimiterResponse queryActivityDecision:2 fromResponses:v7])
  {
    +[_DASLimiterResponse updateActivity:v6 withLimitResponse:v7];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)removeAll
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B578B000, v0, v1, "Removing all from penalty trackers", v2, v3, v4, v5, v6);
}

- (void)removeAllFromActivityTracker
{
  obj = self->_submittedActivityTracker;
  objc_sync_enter(obj);
  [(NSCountedSet *)self->_submittedActivityTracker removeAllObjects];
  objc_sync_exit(obj);
}

- (void)timerHandler
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B578B000, v0, v1, "2 hour timer fired for submission penalty checks", v2, v3, v4, v5, v6);
}

- (NSCountedSet)submittedActivityTracker
{
  return self->_submittedActivityTracker;
}

- (void)setSubmittedActivityTracker:(id)a3
{
}

- (NSCountedSet)penaltyTracker
{
  return self->_penaltyTracker;
}

- (void)setPenaltyTracker:(id)a3
{
}

- (NSMutableArray)minorPenaltyActivities
{
  return self->_minorPenaltyActivities;
}

- (void)setMinorPenaltyActivities:(id)a3
{
}

- (NSMutableArray)majorPenaltyActivities
{
  return self->_majorPenaltyActivities;
}

- (void)setMajorPenaltyActivities:(id)a3
{
}

- (unint64_t)minorPenaltyTimerCount
{
  return self->_minorPenaltyTimerCount;
}

- (void)setMinorPenaltyTimerCount:(unint64_t)a3
{
  self->_minorPenaltyTimerCount = a3;
}

- (unint64_t)majorPenaltyTimerCount
{
  return self->_majorPenaltyTimerCount;
}

- (void)setMajorPenaltyTimerCount:(unint64_t)a3
{
  self->_majorPenaltyTimerCount = a3;
}

- (void)setLog:(id)a3
{
}

- (NSString)limitationName
{
  return self->_limitationName;
}

- (void)setLimitationName:(id)a3
{
}

- (OS_dispatch_source)submissionTimer
{
  return self->_submissionTimer;
}

- (void)setSubmissionTimer:(id)a3
{
}

- (os_unfair_lock_s)penaltyLock
{
  return self->_penaltyLock;
}

- (void)setPenaltyLock:(os_unfair_lock_s)a3
{
  self->_penaltyLock = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)testing
{
  return self->_testing;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_submissionTimer, 0);
  objc_storeStrong((id *)&self->_limitationName, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_majorPenaltyActivities, 0);
  objc_storeStrong((id *)&self->_minorPenaltyActivities, 0);
  objc_storeStrong((id *)&self->_penaltyTracker, 0);

  objc_storeStrong((id *)&self->_submittedActivityTracker, 0);
}

- (void)init
{
  uint64_t v1 = [NSNumber numberWithUnsignedInt:a1];
  OUTLINED_FUNCTION_2(&dword_1B578B000, v2, v3, "Initialized testing state to 0 because %@", v4, v5, v6, v7, 2u);
}

@end