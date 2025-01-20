@interface ATXHeuristicActionProducer
+ (double)generateScoreForHeuristic:(id)a3;
+ (id)sharedInstance;
+ (unint64_t)actionExperienceForScoredHeuristicAction:(id)a3;
- (ATXHeuristicActionProducer)init;
- (BOOL)isActionBlacklisted:(id)a3;
- (BOOL)userAlreadyEngagedWithAction:(id)a3;
- (id)_criteriaForJobOnDate:(id)a3;
- (id)actionPredictionBlacklist;
- (id)bundleIdForAction:(id)a3;
- (id)digitalHealthBlacklist;
- (id)firstUpdateDateForActions:(id)a3;
- (id)produceActions;
- (void)coalescedProduceActions;
- (void)dealloc;
- (void)invalidateOnGlobalQueueWithDelay:(double)a3;
- (void)scheduleNextHeuristicRefreshGivenActions:(id)a3;
- (void)setUpdateJobForCriteria:(id)a3;
@end

@implementation ATXHeuristicActionProducer

- (void)coalescedProduceActions
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ATXHeuristicActionProducer_coalescedProduceActions__block_invoke;
  block[3] = &unk_1E68AF850;
  block[4] = self;
  if (-[ATXHeuristicActionProducer coalescedProduceActions]::_pasOnceToken5 != -1) {
    dispatch_once(&-[ATXHeuristicActionProducer coalescedProduceActions]::_pasOnceToken5, block);
  }
  id v2 = (id)-[ATXHeuristicActionProducer coalescedProduceActions]::_pasExprOnceResult;
  [v2 runAfterDelaySeconds:0 coalescingBehavior:1.0];
  v3 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v6 = 0x3FF0000000000000;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXHeuristicActionProducer triggering coalesced produceActions in %f seconds", buf, 0xCu);
  }
}

void __34__ATXHeuristicActionProducer_init__block_invoke(uint64_t a1)
{
  id v2 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_INFO, "ATXHeuristicResultCacheExpiredSomethingNotification", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

id __53__ATXHeuristicActionProducer_coalescedProduceActions__block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) produceActions];
}

- (id)produceActions
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  sel_getName(a2);
  v37 = (void *)os_transaction_create();
  uint64_t v3 = objc_opt_new();
  v4 = (void *)MEMORY[0x1E4F494A8];
  v39 = (void *)v3;
  v5 = [MEMORY[0x1E4F935D0] sharedInstance];
  v38 = [v4 actionsWithLocationManager:v5];

  uint64_t v6 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = objc_msgSend(v38, "count", v37);
    __int16 v47 = 2112;
    double v48 = *(double *)&v38;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Got %tu heuristic predictions: %@", buf, 0x16u);
  }

  if (!v38)
  {
    v32 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_37;
  }
  v40 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v38;
  uint64_t v7 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (!v7) {
    goto LABEL_28;
  }
  uint64_t v8 = *(void *)v43;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v43 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      if (-[ATXHeuristicActionProducer isActionBlacklisted:](self, "isActionBlacklisted:", v10, v37))
      {
        v11 = __atxlog_handle_heuristic();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v10;
          _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Heuristic action %@ is blacklisted.", buf, 0xCu);
        }
LABEL_25:

        continue;
      }
      if (![(ATXHeuristicActionProducer *)self userAlreadyEngagedWithAction:v10])
      {
        id v13 = objc_alloc(MEMORY[0x1E4F4B2B0]);
        v14 = objc_opt_class();
        v15 = [v10 heuristic];
        [v14 generateScoreForHeuristic:v15];
        *(float *)&double v16 = v16;
        v11 = [v13 initWithPredictedItem:v10 score:v16];

        unint64_t v17 = +[ATXHeuristicActionProducer actionExperienceForScoredHeuristicAction:v11];
        if (v17 - 1 > 1)
        {
          v23 = __atxlog_handle_heuristic();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            [v11 score];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v10;
            __int16 v47 = 2048;
            double v48 = v24;
            _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "Action is not medium or high confidence: %@ score: %f", buf, 0x16u);
          }
        }
        else
        {
          [v11 score];
          *(void *)buf = @"heuristic";
          int v49 = v18;
          uint64_t v19 = 16;
          __int16 v50 = 0;
          do
          {
            *(float *)&buf[v19] = -31337.0;
            v19 += 4;
          }
          while (v19 != 3284);
          v20 = [v10 heuristic];
          char v21 = [v20 isEqualToString:@"bestAppHandoff:unknown"];

          if ((v21 & 1) == 0)
          {
            LOBYTE(v50) = v17 == 2;
            HIBYTE(v50) = v17 == 1;
          }
          v22 = [[ATXActionResult alloc] initWithScoredAction:v11 predictionItem:buf actionKey:@"heuristic"];
          [v39 addObject:v22];
          [v40 addObject:v10];
        }
        goto LABEL_25;
      }
      v12 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "User already engaged with action. Not going to surface action: %@", buf, 0xCu);
      }

      [v40 addObject:v10];
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  }
  while (v7);
LABEL_28:

  v25 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = [v39 count];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v26;
    __int16 v47 = 2112;
    double v48 = *(double *)&v39;
    _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "Got %tu action results: %@", buf, 0x16u);
  }

  v27 = ATXSortedActionResults(v39);
  v28 = +[_ATXGlobals sharedInstance];
  int v29 = [v28 maxHeuristicAppActionCount];

  unint64_t v30 = [v39 count];
  if (v30 >= v29) {
    unint64_t v31 = v29;
  }
  else {
    unint64_t v31 = v30;
  }
  v32 = objc_msgSend(v27, "subarrayWithRange:", 0, v31, v37);

  v33 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = [v32 count];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v34;
    __int16 v47 = 2112;
    double v48 = *(double *)&v32;
    _os_log_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_DEFAULT, "Got %tu action results after sorting and filtering: %@", buf, 0x16u);
  }

  v35 = [MEMORY[0x1E4F4B2A0] sharedInstance];
  [v35 clearRecentHeuristicEngagementsExceptForActions:v40];

  +[ATXActionBlendingUpdater updateBlendingLayerWithHeuristicPredictions:v32];
  [(ATXHeuristicActionProducer *)self scheduleNextHeuristicRefreshGivenActions:v32];

LABEL_37:
  return v32;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ATXHeuristicActionProducer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[ATXHeuristicActionProducer sharedInstance]::_pasOnceToken2 != -1) {
    dispatch_once(&+[ATXHeuristicActionProducer sharedInstance]::_pasOnceToken2, block);
  }
  id v2 = (void *)+[ATXHeuristicActionProducer sharedInstance]::_pasExprOnceResult;
  return v2;
}

void __44__ATXHeuristicActionProducer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)+[ATXHeuristicActionProducer sharedInstance]::_pasExprOnceResult;
  +[ATXHeuristicActionProducer sharedInstance]::_pasExprOnceResult = v1;
}

- (ATXHeuristicActionProducer)init
{
  v14.receiver = self;
  v14.super_class = (Class)ATXHeuristicActionProducer;
  id v2 = [(ATXHeuristicActionProducer *)&v14 init];
  if (v2)
  {
    if (([MEMORY[0x1E4F4AFB8] shouldComputeActions] & 1) == 0)
    {
      uint64_t v6 = 0;
      goto LABEL_6;
    }
    objc_initWeak(&location, v2);
    uint64_t v3 = (void *)MEMORY[0x1E4F494A8];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __34__ATXHeuristicActionProducer_init__block_invoke;
    v11 = &unk_1E68AF828;
    objc_copyWeak(&v12, &location);
    uint64_t v4 = [v3 addCacheExpirerNotification:&v8];
    id expireNotificationHandle = v2->_expireNotificationHandle;
    v2->_id expireNotificationHandle = (id)v4;

    -[ATXHeuristicActionProducer setUpdateJobForCriteria:](v2, "setUpdateJobForCriteria:", *MEMORY[0x1E4F14158], v8, v9, v10, v11);
    [(ATXHeuristicActionProducer *)v2 invalidateOnGlobalQueueWithDelay:5.0];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  uint64_t v6 = v2;
LABEL_6:

  return v6;
}

- (void)invalidateOnGlobalQueueWithDelay:(double)a3
{
  v5 = (void *)MEMORY[0x1E4F93B18];
  uint64_t v6 = dispatch_get_global_queue(9, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__ATXHeuristicActionProducer_invalidateOnGlobalQueueWithDelay___block_invoke;
  v7[3] = &unk_1E68AF850;
  v7[4] = self;
  [v5 runAsyncOnQueue:v6 afterDelaySeconds:v7 block:a3];
}

uint64_t __63__ATXHeuristicActionProducer_invalidateOnGlobalQueueWithDelay___block_invoke(uint64_t a1)
{
  id v2 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXHeuristicActionProducer delayed invalidation upon init", v4, 2u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_expireNotificationHandle];

  v4.receiver = self;
  v4.super_class = (Class)ATXHeuristicActionProducer;
  [(ATXHeuristicActionProducer *)&v4 dealloc];
}

- (id)digitalHealthBlacklist
{
  return +[ATXDigitalHealthBlacklist sharedInstance];
}

- (id)actionPredictionBlacklist
{
  return +[ATXActionPredictionBlacklist sharedInstanceWithAppPredictionBlacklist];
}

- (id)bundleIdForAction:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 _bundleIdForDisplay];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 bundleId];
  }
  uint64_t v7 = v6;

  uint64_t v8 = ATXBundleIdReplacementForBundleId();

  return v8;
}

- (BOOL)isActionBlacklisted:(id)a3
{
  objc_super v4 = [(ATXHeuristicActionProducer *)self bundleIdForAction:a3];
  v5 = [(ATXHeuristicActionProducer *)self digitalHealthBlacklist];
  id v6 = [v5 blacklistedBundleIds];
  if ([v6 containsObject:v4])
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = [(ATXHeuristicActionProducer *)self actionPredictionBlacklist];
    char v7 = [v8 isBundleIdBlacklisted:v4];
  }
  return v7;
}

- (BOOL)userAlreadyEngagedWithAction:(id)a3
{
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F4B2A0] sharedInstance];
  v5 = [v4 recentActions];
  char v6 = [v5 containsObject:v3];

  return v6;
}

void __53__ATXHeuristicActionProducer_coalescedProduceActions__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1D25F6CC0]();
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  objc_super v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v5 = dispatch_queue_create("ATXUpdateActionPredictionCache", v4);
  id v6 = objc_alloc(MEMORY[0x1E4F93B98]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ATXHeuristicActionProducer_coalescedProduceActions__block_invoke_2;
  v9[3] = &unk_1E68AF850;
  v9[4] = *(void *)(a1 + 32);
  uint64_t v7 = [v6 initWithQueue:v5 operation:v9];

  uint64_t v8 = (void *)-[ATXHeuristicActionProducer coalescedProduceActions]::_pasExprOnceResult;
  -[ATXHeuristicActionProducer coalescedProduceActions]::_pasExprOnceResult = v7;
}

+ (unint64_t)actionExperienceForScoredHeuristicAction:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v7[0] = v3;
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  unint64_t v5 = +[ATXDisplayCacheLockscreenFilter _getPredictionConfidenceForActions:v4];

  return v5;
}

+ (double)generateScoreForHeuristic:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = +[_ATXGlobals sharedInstance];
  unint64_t v5 = +[_ATXAppLaunchHistogramManager sharedInstance];
  id v6 = [v5 histogramForLaunchType:35];
  uint64_t v7 = [v5 histogramForLaunchType:36];
  if (v3)
  {
    v33[0] = v3;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [v6 totalLaunchesForBundleIds:v8];
  double v10 = v9;
  [v7 totalLaunchesForBundleIds:v8];
  double v12 = v11;
  [v6 totalLaunches];
  double v14 = v13;
  [v7 totalLaunches];
  double v16 = v15;
  unint64_t v17 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138544386;
    id v24 = v3;
    __int16 v25 = 2048;
    double v26 = v10;
    __int16 v27 = 2048;
    double v28 = v12;
    __int16 v29 = 2048;
    double v30 = v14;
    __int16 v31 = 2048;
    double v32 = v16;
    _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "Heuristic: %{public}@ confirms: %f rejects: %f total confirms: %f rejects: %f", (uint8_t *)&v23, 0x34u);
  }

  [v4 heuristicsBaseScore];
  double v19 = v18;
  +[_ATXActionUtils computeNormalizedBetaDistEngagementScoreWithPriorAlpha:priorBeta:confirms:rejects:totalConfirms:totalRejects:](_ATXActionUtils, "computeNormalizedBetaDistEngagementScoreWithPriorAlpha:priorBeta:confirms:rejects:totalConfirms:totalRejects:", [v4 heuristicsEngagementPriorAlpha], objc_msgSend(v4, "heuristicsEngagementPriorBeta"), v10, v12, v14, v16);
  double v21 = v20;

  return v19 * v21;
}

- (void)scheduleNextHeuristicRefreshGivenActions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(ATXHeuristicActionProducer *)self firstUpdateDateForActions:a3];
  if (v4)
  {
    unint64_t v5 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling next ATXHeuristicActionProducer refresh for date: %@", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [(ATXHeuristicActionProducer *)self _criteriaForJobOnDate:v4];
    [(ATXHeuristicActionProducer *)self setUpdateJobForCriteria:v6];
  }
}

- (void)setUpdateJobForCriteria:(id)a3
{
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __54__ATXHeuristicActionProducer_setUpdateJobForCriteria___block_invoke;
  handler[3] = &unk_1E68AF878;
  handler[4] = self;
  xpc_activity_register("com.apple.duetexpertd.heuristicactionproducer-refresh", a3, handler);
}

void __54__ATXHeuristicActionProducer_setUpdateJobForCriteria___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state(v3) == 2 && ([MEMORY[0x1E4F93B10] isClassCLocked] & 1) == 0)
  {
    objc_super v4 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXHeuristicActionProducer producing actions due to prescheduled CTS update job.", v6, 2u);
    }

    unint64_t v5 = (void *)MEMORY[0x1D25F6CC0]();
    [*(id *)(a1 + 32) coalescedProduceActions];
  }
}

- (id)firstUpdateDateForActions:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  __int16 v29 = __Block_byref_object_copy__39;
  double v30 = __Block_byref_object_dispose__39;
  id v31 = 0;
  id v3 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ATXHeuristicActionProducer_firstUpdateDateForActions___block_invoke;
  aBlock[3] = &unk_1E68AF8A0;
  id v4 = v3;
  id v24 = v4;
  __int16 v25 = &v26;
  unint64_t v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v6 = [MEMORY[0x1E4F494A8] nextCacheExpirationDate];
  v5[2](v5, v6);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v18;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        double v11 = [*(id *)(*((void *)&v19 + 1) + 8 * i) scoredAction];
        double v12 = [v11 predictedItem];
        double v13 = [v12 criteria];

        double v14 = [v13 startDate];
        v5[2](v5, v14);

        double v15 = [v13 endDate];
        v5[2](v5, v15);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v32 count:16];
    }
    while (v8);
  }

  id v16 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v16;
}

uint64_t __56__ATXHeuristicActionProducer_firstUpdateDateForActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v10 = v3;
    unint64_t v5 = [v3 earlierDate:*(void *)(a1 + 32)];
    id v6 = *(void **)(a1 + 32);

    id v4 = v10;
    if (v5 == v6)
    {
      id v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) earlierDate:v10];
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = v10;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);

      id v4 = v10;
    }
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (id)_criteriaForJobOnDate:(id)a3
{
  [a3 timeIntervalSinceNow];
  double v4 = v3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F14170], (uint64_t)v4);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F141A8], 300);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F142F8], 0);
  return v5;
}

- (void).cxx_destruct
{
}

@end