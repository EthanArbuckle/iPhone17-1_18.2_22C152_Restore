@interface ACHAWDSubmissionManager
- (ACHAWDSubmissionManager)initWithProfile:(id)a3 earnedInstanceStore:(id)a4;
- (ACHEarnedInstanceStore)earnedInstanceStore;
- (BOOL)_computeAndSubmitAchievementCountMetric;
- (BOOL)_submitMetric:(id)a3 container:(id)a4 connection:(id)a5;
- (HDPeriodicActivity)scheduler;
- (HDProfile)profile;
- (NSMutableDictionary)serverConnectionsByComponentId;
- (OS_dispatch_queue)queue;
- (id)_formatMetricTypeToString:(unsigned int)a3;
- (id)_serverConnectionForComponentId:(unsigned int)a3;
- (void)performPeriodicActivity:(id)a3 completion:(id)a4;
- (void)setEarnedInstanceStore:(id)a3;
- (void)setProfile:(id)a3;
- (void)setQueue:(id)a3;
- (void)setScheduler:(id)a3;
- (void)setServerConnectionsByComponentId:(id)a3;
@end

@implementation ACHAWDSubmissionManager

- (ACHAWDSubmissionManager)initWithProfile:(id)a3 earnedInstanceStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ACHAWDSubmissionManager;
  v8 = [(ACHAWDSubmissionManager *)&v18 init];
  if (v8)
  {
    uint64_t v9 = HKCreateSerialDispatchQueue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v8->_earnedInstanceStore, a4);
    id v11 = objc_alloc(MEMORY[0x263F432C8]);
    id WeakRetained = objc_loadWeakRetained((id *)&v8->_profile);
    double v13 = (double)(uint64_t)*MEMORY[0x263EF8218];
    v14 = ACHLogMetrics();
    uint64_t v15 = [v11 initWithProfile:WeakRetained name:@"com.apple.healthd.awd-submission-manager.weekly" interval:v8 delegate:v14 loggingCategory:v13];
    scheduler = v8->_scheduler;
    v8->_scheduler = (HDPeriodicActivity *)v15;
  }
  return v8;
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  double v13 = a4;
  v5 = [(ACHAWDSubmissionManager *)self profile];
  id v6 = [v5 database];
  char v7 = [v6 isProtectedDataAvailable];

  if (v7)
  {
    BOOL v9 = [(ACHAWDSubmissionManager *)self _computeAndSubmitAchievementCountMetric];
    v10 = (void (*)(void *, uint64_t, void, __n128))v13[2];
    if (v9)
    {
      v8.n128_u64[0] = 0;
      id v11 = v13;
      uint64_t v12 = 0;
      goto LABEL_7;
    }
    v8.n128_u64[0] = 0x408C200000000000;
    id v11 = v13;
  }
  else
  {
    id v11 = v13;
    v10 = (void (*)(void *, uint64_t, void, __n128))v13[2];
    v8.n128_u64[0] = 0x408C200000000000;
  }
  uint64_t v12 = 2;
LABEL_7:
  v10(v11, v12, 0, v8);
}

- (BOOL)_computeAndSubmitAchievementCountMetric
{
  v3 = [(ACHAWDSubmissionManager *)self _serverConnectionForComponentId:67];
  v4 = (void *)[v3 newMetricContainerWithIdentifier:4390912];
  if (v4)
  {
    v5 = objc_alloc_init(HDActivityAWDActivityAchievementCountEvent);
    [(ACHEarnedInstanceStore *)self->_earnedInstanceStore loadAllEarnedInstancesFromDatabaseIfNecessary];
    id v6 = [(ACHEarnedInstanceStore *)self->_earnedInstanceStore earnedInstances];
    uint64_t v7 = [v6 count];

    if (v7 <= 5) {
      unsigned int v8 = v7 > 1;
    }
    else {
      unsigned int v8 = 2;
    }
    if (v7 <= 10) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 3;
    }
    [(HDActivityAWDActivityAchievementCountEvent *)v5 setTotalAchievementCount:v9];
    [(HDActivityAWDActivityAchievementCountEvent *)v5 setTotalOTAAchievementViewedCount:0];
    [(HDActivityAWDActivityAchievementCountEvent *)v5 setTotalOTAAchievementCount:0];
    v10 = -[ACHAWDSubmissionManager _formatMetricTypeToString:](self, "_formatMetricTypeToString:", [v4 metricId]);
    id v11 = [@"com.apple.healthd.analytics-submission-manager.weekly" stringByAppendingString:v10];
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDActivityAWDActivityAchievementCountEvent totalAchievementCount](v5, "totalAchievementCount"));
    FIActivityAnalyticsSubmission();

    double v13 = [@"com.apple.healthd.analytics-submission-manager.weekly" stringByAppendingString:v10];
    v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDActivityAWDActivityAchievementCountEvent totalOTAAchievementCount](v5, "totalOTAAchievementCount"));
    FIActivityAnalyticsSubmission();

    uint64_t v15 = [@"com.apple.healthd.analytics-submission-manager.weekly" stringByAppendingString:v10];
    v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDActivityAWDActivityAchievementCountEvent totalOTAAchievementViewedCount](v5, "totalOTAAchievementViewedCount"));
    FIActivityAnalyticsSubmission();

    BOOL v17 = [(ACHAWDSubmissionManager *)self _submitMetric:v5 container:v4 connection:v3];
  }
  else
  {
    objc_super v18 = ACHLogMetrics();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21F5DA000, v18, OS_LOG_TYPE_DEFAULT, "No metric container for achievement count", v20, 2u);
    }

    BOOL v17 = 1;
  }

  return v17;
}

- (id)_formatMetricTypeToString:(unsigned int)a3
{
  if (a3 - 4390912 < 8 && ((0xBFu >> a3) & 1) != 0)
  {
    v3 = off_264517320[a3 - 4390912];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %u)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_submitMetric:(id)a3 container:(id)a4 connection:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v8 setMetric:v7];
  int v10 = [v9 submitMetric:v8];

  id v11 = ACHLogMetrics();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (!v12) {
      goto LABEL_7;
    }
    int v17 = 67109120;
    LODWORD(v18) = [v8 metricId];
    double v13 = "Metric %08x submitted";
  }
  else
  {
    if (!v12) {
      goto LABEL_7;
    }
    int v17 = 67109120;
    LODWORD(v18) = [v8 metricId];
    double v13 = "Metric %08x submission failed";
  }
  _os_log_impl(&dword_21F5DA000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 8u);
LABEL_7:

  if ([MEMORY[0x263F0A980] isAppleInternalInstall])
  {
    v14 = ACHLogMetrics();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v7 formattedText];
      int v17 = 138412290;
      objc_super v18 = v15;
      _os_log_impl(&dword_21F5DA000, v14, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v17, 0xCu);
    }
  }

  return v10;
}

- (id)_serverConnectionForComponentId:(unsigned int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__17;
  BOOL v12 = __Block_byref_object_dispose__17;
  id v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__ACHAWDSubmissionManager__serverConnectionForComponentId___block_invoke;
  block[3] = &unk_264517300;
  block[4] = self;
  block[5] = &v8;
  unsigned int v7 = a3;
  dispatch_sync(queue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __59__ACHAWDSubmissionManager__serverConnectionForComponentId___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F864B0]) initWithComponentId:*(unsigned int *)(a1 + 48)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v10)
    {
      id v11 = *(void **)(*(void *)(a1 + 32) + 32);
      id v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
      [v11 setObject:v10 forKeyedSubscript:v12];
    }
  }
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
}

- (HDPeriodicActivity)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (NSMutableDictionary)serverConnectionsByComponentId
{
  return self->_serverConnectionsByComponentId;
}

- (void)setServerConnectionsByComponentId:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverConnectionsByComponentId, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end