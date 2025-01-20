@interface _ATXFeedback
+ (BOOL)isWidgetOrSpotlight:(unint64_t)a3;
+ (_ATXFeedback)sharedInstance;
- (_ATXFeedback)init;
- (_ATXFeedback)initWithDataStore:(id)a3 histogramManager:(id)a4;
- (double)currentAlpha;
- (double)currentBeta;
- (void)decayCounts;
- (void)doDecayAtTime:(double)a3;
- (void)feedbackLaunchedWithConsumerType:(unint64_t)a3 forBundleId:(id)a4 rejected:(id)a5 context:(id)a6;
- (void)feedbackLaunchedWithConsumerType:(unint64_t)a3 forBundleId:(id)a4 rejected:(id)a5 explicitlyRejected:(id)a6 context:(id)a7;
- (void)loadHistogramsInMemoryIfNecessary;
- (void)populateFeedbackForConsumerType:(unint64_t)a3 forBundleId:(id)a4 withContext:(id)a5 forFeedbackCategory:(int64_t)a6;
- (void)putFeedbackScoresForApps:(id)a3 intoScores:(double *)a4 confirms:(double *)a5 rejects:(double *)a6;
- (void)putNopScoresForApps:(id)a3 into:(double *)a4 atTime:(double)a5;
- (void)removeFeedbackForBundle:(id)a3;
- (void)removeFeedbackForBundles:(id)a3;
- (void)resetData;
- (void)unloadCachedHistograms;
@end

@implementation _ATXFeedback

- (double)currentAlpha
{
  return self->_priorAlpha;
}

- (double)currentBeta
{
  return self->_priorBeta;
}

- (_ATXFeedback)initWithDataStore:(id)a3 histogramManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_ATXFeedback;
  v8 = [(_ATXFeedback *)&v25 init];
  if (v8)
  {
    if (v6)
    {
      v9 = (_ATXDataStore *)v6;
    }
    else
    {
      v9 = +[_ATXDataStore sharedInstance];
    }
    store = v8->_store;
    v8->_store = v9;

    objc_initWeak(&location, v8);
    uint64_t v11 = objc_opt_new();
    uninstallNotificationListener = v8->_uninstallNotificationListener;
    v8->_uninstallNotificationListener = (_ATXInternalUninstallNotification *)v11;

    v13 = v8->_uninstallNotificationListener;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __51___ATXFeedback_initWithDataStore_histogramManager___block_invoke;
    v22 = &unk_1E68AB9D8;
    objc_copyWeak(&v23, &location);
    [(_ATXInternalUninstallNotification *)v13 registerForNotificationsWithUninstallBlock:&v19];
    objc_storeStrong((id *)&v8->_histogramManager, a4);
    id v14 = objc_alloc(MEMORY[0x1E4F93B70]);
    v15 = objc_opt_new();
    uint64_t v16 = objc_msgSend(v14, "initWithGuardedData:", v15, v19, v20, v21, v22);
    histogramState = v8->_histogramState;
    v8->_histogramState = (_PASLock *)v16;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (_ATXFeedback)init
{
  v3 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v4 = [(_ATXFeedback *)self initWithDataStore:0 histogramManager:v3];

  return v4;
}

+ (_ATXFeedback)sharedInstance
{
  if (sharedInstance__pasOnceToken6_20 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_20, &__block_literal_global_123);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_26;
  return (_ATXFeedback *)v2;
}

- (void)loadHistogramsInMemoryIfNecessary
{
  histogramState = self->_histogramState;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49___ATXFeedback_loadHistogramsInMemoryIfNecessary__block_invoke;
  v3[3] = &unk_1E68B2350;
  v3[4] = self;
  [(_PASLock *)histogramState runWithLockAcquired:v3];
}

- (void)unloadCachedHistograms
{
  histogramState = self->_histogramState;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38___ATXFeedback_unloadCachedHistograms__block_invoke;
  v3[3] = &unk_1E68B2350;
  v3[4] = self;
  [(_PASLock *)histogramState runWithLockAcquired:v3];
}

- (void)decayCounts
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(_ATXFeedback *)self doDecayAtTime:Current];
}

- (void)doDecayAtTime:(double)a3
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0x7FF8000000000000;
  store = self->_store;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30___ATXFeedback_doDecayAtTime___block_invoke;
  v5[3] = &unk_1E68B2378;
  *(double *)&v5[5] = a3;
  v5[4] = v6;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30___ATXFeedback_doDecayAtTime___block_invoke_2;
  v4[3] = &unk_1E68B23A0;
  v4[4] = v6;
  [(_ATXDataStore *)store enumerateStateForApps:0 withGlobalBlock:v5 thenWithPerAppBlock:v4];
  _Block_object_dispose(v6, 8);
}

- (void)feedbackLaunchedWithConsumerType:(unint64_t)a3 forBundleId:(id)a4 rejected:(id)a5 context:(id)a6
{
}

- (void)feedbackLaunchedWithConsumerType:(unint64_t)a3 forBundleId:(id)a4 rejected:(id)a5 explicitlyRejected:(id)a6 context:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v23 = v13;
  if (v12)
  {
    id v16 = [v13 arrayByAddingObject:v12];
  }
  else
  {
    id v16 = v13;
  }
  v17 = v16;
  [(_ATXFeedback *)self loadHistogramsInMemoryIfNecessary];
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  int v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  int v35 = 0;
  objc_initWeak(&location, self);
  store = self->_store;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __97___ATXFeedback_feedbackLaunchedWithConsumerType_forBundleId_rejected_explicitlyRejected_context___block_invoke;
  v25[3] = &unk_1E68B23C8;
  id v22 = v12;
  id v26 = v22;
  v27 = self;
  v32[1] = (id)a3;
  v30 = v36;
  objc_copyWeak(v32, &location);
  id v19 = v15;
  id v28 = v19;
  id v20 = v14;
  id v29 = v20;
  v31 = v34;
  [(_ATXDataStore *)store enumerateStateForApps:v17 withGlobalBlock:0 thenWithPerAppBlock:v25];
  if ([(id)objc_opt_class() isWidgetOrSpotlight:a3])
  {
    v21 = self->_store;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __97___ATXFeedback_feedbackLaunchedWithConsumerType_forBundleId_rejected_explicitlyRejected_context___block_invoke_2;
    v24[3] = &unk_1E68B23F0;
    v24[4] = v36;
    v24[5] = v34;
    -[_ATXDataStore enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:](v21, "enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:", MEMORY[0x1E4F1CBF0], v24, 0, v22, v13);
  }
  if (v12) {
    ATXUpdatePredictionsDefaultInterval(2);
  }

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
}

+ (BOOL)isWidgetOrSpotlight:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (void)populateFeedbackForConsumerType:(unint64_t)a3 forBundleId:(id)a4 withContext:(id)a5 forFeedbackCategory:(int64_t)a6
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v8 timeContext];
  v10 = [v9 date];
  uint64_t v11 = [v8 locationMotionContext];
  id v12 = +[_ATXActionUtils stringForCoarseTimePOWLocation:timeZone:coarseGeohash:](_ATXActionUtils, "stringForCoarseTimePOWLocation:timeZone:coarseGeohash:", v10, 0, [v11 coarseGeohash]);

  id v13 = [v8 timeContext];
  id v14 = [v13 date];
  id v15 = [v8 locationMotionContext];
  id v16 = +[_ATXActionUtils stringForSpecificTimeDOWLocation:timeZone:geohash:](_ATXActionUtils, "stringForSpecificTimeDOWLocation:timeZone:geohash:", v14, 0, [v15 geohash]);

  v17 = [v8 timeContext];
  v18 = [v17 date];
  id v19 = +[_ATXActionUtils stringForTwoHourTimeWindow:v18 timeZone:0];

  id v20 = [v8 timeContext];
  v21 = [v20 date];
  id v22 = +[_ATXActionUtils stringForDayOfWeek:v21 timeZone:0];

  id v23 = [v8 locationMotionContext];
  v24 = +[_ATXActionUtils stringForSpecificGeohash:](_ATXActionUtils, "stringForSpecificGeohash:", [v23 geohash]);

  objc_super v25 = [v8 locationMotionContext];
  id v26 = +[_ATXActionUtils stringForCoarseGeohash:](_ATXActionUtils, "stringForCoarseGeohash:", [v25 coarseGeohash]);

  histogramState = self->_histogramState;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __92___ATXFeedback_populateFeedbackForConsumerType_forBundleId_withContext_forFeedbackCategory___block_invoke;
  v39[3] = &unk_1E68B2418;
  unint64_t v48 = a3;
  int64_t v49 = a6;
  id v40 = v7;
  id v41 = v8;
  id v42 = v12;
  id v43 = v16;
  id v44 = v19;
  id v45 = v22;
  id v46 = v26;
  id v47 = v24;
  id v28 = v24;
  id v29 = v26;
  id v30 = v22;
  id v31 = v19;
  id v32 = v16;
  id v33 = v12;
  id v34 = v8;
  id v35 = v7;
  [(_PASLock *)histogramState runWithLockAcquired:v39];
}

- (void)resetData
{
}

- (void)putNopScoresForApps:(id)a3 into:(double *)a4 atTime:(double)a5
{
  id v7 = a3;
  if ([v7 count])
  {
    unint64_t v6 = 0;
    do
      a4[v6++] = 1.0;
    while (v6 < [v7 count]);
  }
}

- (void)putFeedbackScoresForApps:(id)a3 intoScores:(double *)a4 confirms:(double *)a5 rejects:(double *)a6
{
  id v10 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = a5;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = a6;
  +[_ATXFeedbackConstants baseAlpha];
  double v12 = v11;
  +[_ATXFeedbackConstants baseBeta];
  store = self->_store;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69___ATXFeedback_putFeedbackScoresForApps_intoScores_confirms_rejects___block_invoke;
  v16[3] = &unk_1E68B2440;
  v16[4] = self;
  *(double *)&v16[5] = v12 + v14;
  *(double *)&v16[6] = v12;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69___ATXFeedback_putFeedbackScoresForApps_intoScores_confirms_rejects___block_invoke_2;
  v15[3] = &unk_1E68B2468;
  v15[4] = self;
  v15[5] = v19;
  v15[8] = a4;
  v15[9] = a5;
  v15[10] = a6;
  v15[6] = v18;
  v15[7] = v17;
  [(_ATXDataStore *)store enumerateStateForAppsReadOnly:v10 withGlobalBlock:v16 thenWithPerAppBlock:v15];
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v19, 8);
}

- (void)removeFeedbackForBundles:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(_ATXFeedback *)self removeFeedbackForBundle:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeFeedbackForBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramState, 0);
  objc_storeStrong((id *)&self->_histogramManager, 0);
  objc_storeStrong((id *)&self->_abGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationListener, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end