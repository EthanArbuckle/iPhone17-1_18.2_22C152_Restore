@interface ATXHeroAppFeedback
- (ATXHeroAppFeedback)init;
- (ATXHeroAppFeedback)initWithHistogram:(id)a3;
- (BOOL)shouldShowHeroAppPrediction:(id)a3;
- (double)_confirmsForHeroAppPrediction:(id)a3;
- (double)_engagementForHeroAppPrediction:(id)a3;
- (double)_rejectsForHeroAppPrediction:(id)a3;
- (void)addConfirmForHeroAppPredictionWithBundleId:(id)a3 weight:(float)a4;
- (void)addRejectForHeroAppPredictionWithBundleId:(id)a3 weight:(float)a4;
@end

@implementation ATXHeroAppFeedback

- (ATXHeroAppFeedback)init
{
  v3 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v4 = [v3 categoricalHistogramForLaunchType:49];
  v5 = [(ATXHeroAppFeedback *)self initWithHistogram:v4];

  return v5;
}

- (ATXHeroAppFeedback)initWithHistogram:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeroAppFeedback;
  v6 = [(ATXHeroAppFeedback *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_heroAppHistogram, a3);
  }

  return v7;
}

- (void)addConfirmForHeroAppPredictionWithBundleId:(id)a3 weight:(float)a4
{
  heroAppHistogram = self->_heroAppHistogram;
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  id v9 = [v6 now];
  *(float *)&double v8 = a4;
  [(_ATXAppLaunchCategoricalHistogram *)heroAppHistogram addLaunchWithBundleId:v7 date:v9 category:@"confirms_hero" weight:v8];
}

- (void)addRejectForHeroAppPredictionWithBundleId:(id)a3 weight:(float)a4
{
  heroAppHistogram = self->_heroAppHistogram;
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  id v9 = [v6 now];
  *(float *)&double v8 = a4;
  [(_ATXAppLaunchCategoricalHistogram *)heroAppHistogram addLaunchWithBundleId:v7 date:v9 category:@"rejects_hero" weight:v8];
}

- (BOOL)shouldShowHeroAppPrediction:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![MEMORY[0x1E4F93B08] isInternalBuild]
    || (CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F4B758],
        LOBYTE(v24) = 0,
        !CFPreferencesGetAppBooleanValue(v5, (CFStringRef)*MEMORY[0x1E4F4B688], (Boolean *)&v24)))
  {
    v6 = +[ATXHeroAndClipConstants sharedInstance];
    [(ATXHeroAppFeedback *)self _rejectsForHeroAppPrediction:v4];
    double v9 = v8;
    [(ATXHeroAppFeedback *)self _confirmsForHeroAppPrediction:v4];
    v11 = v10;
    [v6 heroAppMinimumRejects];
    if (v9 >= v12)
    {
      [(ATXHeroAppFeedback *)self _engagementForHeroAppPrediction:v4];
      double v18 = v17;
      [v6 heroAppEngagementThreshold];
      double v20 = v19;
      v13 = __atxlog_handle_hero();
      BOOL v21 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v18 < v20)
      {
        if (v21)
        {
          [v6 heroAppEngagementThreshold];
          int v24 = 138413058;
          id v25 = v4;
          __int16 v26 = 2048;
          double v27 = v9;
          __int16 v28 = 2048;
          double v29 = v18;
          __int16 v30 = 2048;
          uint64_t v31 = v22;
          _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "%@ has enough rejects: %f, and engagement is: %f which is less than the threshold: %f. Hence, not showing this suggestion.", (uint8_t *)&v24, 0x2Au);
        }
        BOOL v7 = 0;
        goto LABEL_17;
      }
      if (v21)
      {
        int v24 = 134218496;
        id v25 = v11;
        __int16 v26 = 2048;
        double v27 = v9;
        __int16 v28 = 2048;
        double v29 = v18;
        v14 = "All app clip specific thresholds passed. Confirms: %f, Rejects: %f,  engagement: %f";
        v15 = v13;
        uint32_t v16 = 32;
        goto LABEL_15;
      }
    }
    else
    {
      v13 = __atxlog_handle_hero();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 134218240;
        id v25 = v11;
        __int16 v26 = 2048;
        double v27 = v9;
        v14 = "Not enough rejects to consider engagement. Allowing hero app. Confirms: %f Rejects: %f";
        v15 = v13;
        uint32_t v16 = 22;
LABEL_15:
        _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v24, v16);
      }
    }
    BOOL v7 = 1;
LABEL_17:

    goto LABEL_18;
  }
  v6 = __atxlog_handle_hero();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Defaults for OverrideHeroAppPredictionEligibility set to True: Overriding hero app user engagement feedback", (uint8_t *)&v24, 2u);
  }
  BOOL v7 = 1;
LABEL_18:

  return v7;
}

- (double)_engagementForHeroAppPrediction:(id)a3
{
  id v4 = a3;
  [(ATXHeroAppFeedback *)self _confirmsForHeroAppPrediction:v4];
  double v6 = v5;
  [(ATXHeroAppFeedback *)self _rejectsForHeroAppPrediction:v4];
  double v8 = v7;

  if (v8 == 0.0) {
    return 1.0;
  }
  else {
    return v6 / (v6 + v8);
  }
}

- (double)_confirmsForHeroAppPrediction:(id)a3
{
  heroAppHistogram = self->_heroAppHistogram;
  id v4 = [a3 bundleId];
  [(_ATXAppLaunchCategoricalHistogram *)heroAppHistogram totalLaunchesForBundleId:v4 category:@"confirms_hero"];
  double v6 = v5;

  return v6;
}

- (double)_rejectsForHeroAppPrediction:(id)a3
{
  heroAppHistogram = self->_heroAppHistogram;
  id v4 = [a3 bundleId];
  [(_ATXAppLaunchCategoricalHistogram *)heroAppHistogram totalLaunchesForBundleId:v4 category:@"rejects_hero"];
  double v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
}

@end