@interface ATXAppClipsFeedback
- (ATXAppClipsFeedback)init;
- (ATXAppClipsFeedback)initWithAppClipsHistogram:(id)a3 appClipsHistogramNoDecay:(id)a4;
- (BOOL)_shouldHideAppClipForLowEngagementNoDecay:(id)a3;
- (BOOL)shouldShowAppClipWithHeroAppPrediction:(id)a3;
- (BOOL)shouldShowAppClips;
- (double)_confirmsForAppClipWithHeroAppPrediction:(id)a3;
- (double)_confirmsForAppClipWithHeroAppPredictionNoDecay:(id)a3;
- (double)_engagementForAppClipWithHeroAppPrediction:(id)a3;
- (double)_engagementForAppClipWithHeroAppPredictionNoDecay:(id)a3;
- (double)_overallAppClipsengagement;
- (double)_overallConfirms;
- (double)_overallConfirmsNoDecay;
- (double)_overallRejects;
- (double)_overallRejectsNoDecay;
- (double)_rejectsForAppClipWithHeroAppPrediction:(id)a3;
- (double)_rejectsForAppClipWithHeroAppPredictionNoDecay:(id)a3;
- (double)feedbackScoreForAppClipWithHeroAppPrediction:(id)a3;
- (void)addConfirmForAppClipWithHeroAppPrediction:(id)a3 weight:(float)a4;
- (void)addRejectForAppClipWithHeroAppPrediction:(id)a3 weight:(float)a4;
@end

@implementation ATXAppClipsFeedback

- (ATXAppClipsFeedback)init
{
  v3 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v4 = [v3 categoricalHistogramForLaunchType:49];
  v5 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v6 = [v5 categoricalHistogramForLaunchType:94];
  v7 = [(ATXAppClipsFeedback *)self initWithAppClipsHistogram:v4 appClipsHistogramNoDecay:v6];

  return v7;
}

- (ATXAppClipsFeedback)initWithAppClipsHistogram:(id)a3 appClipsHistogramNoDecay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXAppClipsFeedback;
  v9 = [(ATXAppClipsFeedback *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appClipsAndHeroAppHistogram, a3);
    objc_storeStrong((id *)&v10->_appClipsAndHeroAppHistogramNoDecay, a4);
  }

  return v10;
}

- (void)addConfirmForAppClipWithHeroAppPrediction:(id)a3 weight:(float)a4
{
  appClipsAndHeroAppHistogram = self->_appClipsAndHeroAppHistogram;
  id v7 = a3;
  id v8 = [v7 urlHash];
  v9 = [MEMORY[0x1E4F1C9C8] now];
  *(float *)&double v10 = a4;
  [(_ATXAppLaunchCategoricalHistogram *)appClipsAndHeroAppHistogram addLaunchWithBundleId:v8 date:v9 category:@"confirms_clips" weight:v10];

  appClipsAndHeroAppHistogramNoDecay = self->_appClipsAndHeroAppHistogramNoDecay;
  id v14 = [v7 urlHash];

  objc_super v12 = [MEMORY[0x1E4F1C9C8] now];
  *(float *)&double v13 = a4;
  [(_ATXAppLaunchCategoricalHistogram *)appClipsAndHeroAppHistogramNoDecay addLaunchWithBundleId:v14 date:v12 category:@"confirms_clips" weight:v13];
}

- (void)addRejectForAppClipWithHeroAppPrediction:(id)a3 weight:(float)a4
{
  appClipsAndHeroAppHistogram = self->_appClipsAndHeroAppHistogram;
  id v7 = a3;
  id v8 = [v7 urlHash];
  v9 = [MEMORY[0x1E4F1C9C8] now];
  *(float *)&double v10 = a4;
  [(_ATXAppLaunchCategoricalHistogram *)appClipsAndHeroAppHistogram addLaunchWithBundleId:v8 date:v9 category:@"rejects_clips" weight:v10];

  appClipsAndHeroAppHistogramNoDecay = self->_appClipsAndHeroAppHistogramNoDecay;
  id v14 = [v7 urlHash];

  objc_super v12 = [MEMORY[0x1E4F1C9C8] now];
  *(float *)&double v13 = a4;
  [(_ATXAppLaunchCategoricalHistogram *)appClipsAndHeroAppHistogramNoDecay addLaunchWithBundleId:v14 date:v12 category:@"rejects_clips" weight:v13];
}

- (BOOL)shouldShowAppClipWithHeroAppPrediction:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![MEMORY[0x1E4F93B08] isInternalBuild]
    || (CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F4B758],
        LOBYTE(v32) = 0,
        !CFPreferencesGetAppBooleanValue(v5, (CFStringRef)*MEMORY[0x1E4F4B688], (Boolean *)&v32)))
  {
    v6 = +[ATXHeroAndClipConstants sharedInstance];
    if ([(ATXAppClipsFeedback *)self _shouldHideAppClipForLowEngagementNoDecay:v4])
    {
      [(ATXAppClipsFeedback *)self _rejectsForAppClipWithHeroAppPredictionNoDecay:v4];
      double v9 = v8;
      [(ATXAppClipsFeedback *)self _engagementForAppClipWithHeroAppPredictionNoDecay:v4];
      double v11 = v10;
      [(ATXAppClipsFeedback *)self _confirmsForAppClipWithHeroAppPredictionNoDecay:v4];
      double v13 = v12;
      id v14 = __atxlog_handle_hero();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        [v6 appClipsPerAppClipEngagementThresholdNoDecay];
        int v32 = 138413314;
        id v33 = v4;
        __int16 v34 = 2048;
        double v35 = v9;
        __int16 v36 = 2048;
        double v37 = v11;
        __int16 v38 = 2048;
        uint64_t v39 = v15;
        __int16 v40 = 2048;
        v41 = v13;
        v16 = "%@ has enough non-decaying rejects: %f, and engagement is: %f which is less than the threshold: %f. Hence,"
              " not showing this suggestion. Confirms: %f.";
LABEL_15:
        _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v32, 0x34u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    [(ATXAppClipsFeedback *)self _rejectsForAppClipWithHeroAppPrediction:v4];
    double v18 = v17;
    [(ATXAppClipsFeedback *)self _confirmsForAppClipWithHeroAppPrediction:v4];
    v20 = v19;
    [v6 appClipsPerAppClipMinRejects];
    if (v18 >= v21)
    {
      [(ATXAppClipsFeedback *)self _engagementForAppClipWithHeroAppPrediction:v4];
      double v26 = v25;
      [v6 appClipsPerAppClipEngagementThreshold];
      double v28 = v27;
      id v14 = __atxlog_handle_hero();
      BOOL v29 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v26 < v28)
      {
        if (v29)
        {
          [v6 appClipsPerAppClipEngagementThreshold];
          int v32 = 138413314;
          id v33 = v4;
          __int16 v34 = 2048;
          double v35 = v18;
          __int16 v36 = 2048;
          double v37 = v26;
          __int16 v38 = 2048;
          uint64_t v39 = v30;
          __int16 v40 = 2048;
          v41 = v20;
          v16 = "%@ has enough rejects: %f, and engagement is: %f which is less than the threshold: %f. Hence, not showin"
                "g this suggestion. Confirms: %f.";
          goto LABEL_15;
        }
LABEL_16:
        BOOL v7 = 0;
LABEL_21:

        goto LABEL_22;
      }
      if (v29)
      {
        int v32 = 134218496;
        id v33 = v20;
        __int16 v34 = 2048;
        double v35 = v18;
        __int16 v36 = 2048;
        double v37 = v26;
        v22 = "All app clip specific thresholds passed. Confirms: %f, Rejects: %f, Engagement: %f";
        v23 = v14;
        uint32_t v24 = 32;
        goto LABEL_19;
      }
    }
    else
    {
      id v14 = __atxlog_handle_hero();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 134218240;
        id v33 = v20;
        __int16 v34 = 2048;
        double v35 = v18;
        v22 = "Not enough app clip specific rejects to consider engagement.  Confirms: %f, Rejects: %f ";
        v23 = v14;
        uint32_t v24 = 22;
LABEL_19:
        _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v32, v24);
      }
    }
    BOOL v7 = 1;
    goto LABEL_21;
  }
  v6 = __atxlog_handle_hero();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v32) = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Defaults for OverrideHeroAppPredictionEligibility set to True: Overriding app clip user engagement feedback", (uint8_t *)&v32, 2u);
  }
  BOOL v7 = 1;
LABEL_22:

  return v7;
}

- (double)feedbackScoreForAppClipWithHeroAppPrediction:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[ATXHeroAndClipConstants sharedInstance];
  [(ATXAppClipsFeedback *)self _rejectsForAppClipWithHeroAppPrediction:v4];
  double v7 = v6;
  [v5 appClipsPerAppClipMinRejects];
  double v8 = 1.0;
  if (v7 >= v9)
  {
    [(ATXAppClipsFeedback *)self _engagementForAppClipWithHeroAppPrediction:v4];
    double v8 = v10;
  }

  return v8;
}

- (BOOL)shouldShowAppClips
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![MEMORY[0x1E4F93B08] isInternalBuild]
    || (CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F4B758],
        LOBYTE(v22) = 0,
        !CFPreferencesGetAppBooleanValue(v3, (CFStringRef)*MEMORY[0x1E4F4B688], (Boolean *)&v22)))
  {
    id v4 = +[ATXHeroAndClipConstants sharedInstance];
    [(ATXAppClipsFeedback *)self _overallConfirms];
    double v7 = v6;
    [(ATXAppClipsFeedback *)self _overallRejects];
    double v9 = v8;
    [v4 appClipsOverallMinRejects];
    if (v9 >= v10)
    {
      [(ATXAppClipsFeedback *)self _overallAppClipsengagement];
      double v16 = v15;
      [v4 appClipsOverallEngagementThreshold];
      double v18 = v17;
      double v11 = __atxlog_handle_hero();
      BOOL v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v16 < v18)
      {
        if (v19)
        {
          [v4 appClipsOverallEngagementThreshold];
          int v22 = 134218752;
          double v23 = v9;
          __int16 v24 = 2048;
          double v25 = v16;
          __int16 v26 = 2048;
          double v27 = v20;
          __int16 v28 = 2048;
          double v29 = v7;
          _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "There are enough overall rejects: %f, and overall App Clips Engagement is: %f which is less than the threshold: %f. Hence, not showing app clip suggestions. Confirms: %f", (uint8_t *)&v22, 0x2Au);
        }
        BOOL v5 = 0;
        goto LABEL_17;
      }
      if (v19)
      {
        int v22 = 134218496;
        double v23 = v7;
        __int16 v24 = 2048;
        double v25 = v9;
        __int16 v26 = 2048;
        double v27 = v16;
        objc_super v12 = "All overall app clip thresholds passed. Confirms: %f, Rejects: %f, Engagement: %f";
        double v13 = v11;
        uint32_t v14 = 32;
        goto LABEL_15;
      }
    }
    else
    {
      double v11 = __atxlog_handle_hero();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 134218240;
        double v23 = v7;
        __int16 v24 = 2048;
        double v25 = v9;
        objc_super v12 = "Not enough overall rejects to consider engagement. Confirms: %f, Rejects: %f";
        double v13 = v11;
        uint32_t v14 = 22;
LABEL_15:
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v22, v14);
      }
    }
    BOOL v5 = 1;
LABEL_17:

    goto LABEL_18;
  }
  id v4 = __atxlog_handle_hero();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Defaults for OverrideHeroAppPredictionEligibility set to True: Overriding app clip user engagement feedback", (uint8_t *)&v22, 2u);
  }
  BOOL v5 = 1;
LABEL_18:

  return v5;
}

- (double)_overallAppClipsengagement
{
  [(ATXAppClipsFeedback *)self _overallConfirms];
  double v4 = v3;
  [(ATXAppClipsFeedback *)self _overallRejects];
  if (v5 == 0.0) {
    return 1.0;
  }
  else {
    return v4 / (v4 + v5);
  }
}

- (double)_engagementForAppClipWithHeroAppPrediction:(id)a3
{
  id v4 = a3;
  [(ATXAppClipsFeedback *)self _confirmsForAppClipWithHeroAppPrediction:v4];
  double v6 = v5;
  [(ATXAppClipsFeedback *)self _rejectsForAppClipWithHeroAppPrediction:v4];
  double v8 = v7;

  if (v8 == 0.0) {
    return 1.0;
  }
  else {
    return v6 / (v6 + v8);
  }
}

- (double)_confirmsForAppClipWithHeroAppPrediction:(id)a3
{
  appClipsAndHeroAppHistogram = self->_appClipsAndHeroAppHistogram;
  id v4 = [a3 urlHash];
  [(_ATXAppLaunchCategoricalHistogram *)appClipsAndHeroAppHistogram totalLaunchesForBundleId:v4 category:@"confirms_clips"];
  double v6 = v5;

  return v6;
}

- (double)_rejectsForAppClipWithHeroAppPrediction:(id)a3
{
  appClipsAndHeroAppHistogram = self->_appClipsAndHeroAppHistogram;
  id v4 = [a3 urlHash];
  [(_ATXAppLaunchCategoricalHistogram *)appClipsAndHeroAppHistogram totalLaunchesForBundleId:v4 category:@"rejects_clips"];
  double v6 = v5;

  return v6;
}

- (double)_overallConfirms
{
  [(_ATXAppLaunchCategoricalHistogram *)self->_appClipsAndHeroAppHistogram totalLaunchesForCategory:@"confirms_clips"];
  return result;
}

- (double)_overallRejects
{
  [(_ATXAppLaunchCategoricalHistogram *)self->_appClipsAndHeroAppHistogram totalLaunchesForCategory:@"rejects_clips"];
  return result;
}

- (BOOL)_shouldHideAppClipForLowEngagementNoDecay:(id)a3
{
  id v4 = a3;
  double v5 = +[ATXHeroAndClipConstants sharedInstance];
  [(ATXAppClipsFeedback *)self _rejectsForAppClipWithHeroAppPredictionNoDecay:v4];
  double v7 = v6;
  [v5 appClipsPerAppClipMinRejectsNoDecay];
  if (v7 >= v8)
  {
    [(ATXAppClipsFeedback *)self _engagementForAppClipWithHeroAppPredictionNoDecay:v4];
    double v11 = v10;
    [v5 appClipsPerAppClipEngagementThresholdNoDecay];
    BOOL v9 = v11 < v12;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (double)_engagementForAppClipWithHeroAppPredictionNoDecay:(id)a3
{
  id v4 = a3;
  [(ATXAppClipsFeedback *)self _confirmsForAppClipWithHeroAppPredictionNoDecay:v4];
  double v6 = v5;
  [(ATXAppClipsFeedback *)self _rejectsForAppClipWithHeroAppPredictionNoDecay:v4];
  double v8 = v7;

  if (v8 == 0.0) {
    return 1.0;
  }
  else {
    return v6 / (v6 + v8);
  }
}

- (double)_confirmsForAppClipWithHeroAppPredictionNoDecay:(id)a3
{
  appClipsAndHeroAppHistogramNoDecay = self->_appClipsAndHeroAppHistogramNoDecay;
  id v4 = [a3 urlHash];
  [(_ATXAppLaunchCategoricalHistogram *)appClipsAndHeroAppHistogramNoDecay totalLaunchesForBundleId:v4 category:@"confirms_clips"];
  double v6 = v5;

  return v6;
}

- (double)_rejectsForAppClipWithHeroAppPredictionNoDecay:(id)a3
{
  appClipsAndHeroAppHistogramNoDecay = self->_appClipsAndHeroAppHistogramNoDecay;
  id v4 = [a3 urlHash];
  [(_ATXAppLaunchCategoricalHistogram *)appClipsAndHeroAppHistogramNoDecay totalLaunchesForBundleId:v4 category:@"rejects_clips"];
  double v6 = v5;

  return v6;
}

- (double)_overallConfirmsNoDecay
{
  [(_ATXAppLaunchCategoricalHistogram *)self->_appClipsAndHeroAppHistogramNoDecay totalLaunchesForCategory:@"confirms_clips"];
  return result;
}

- (double)_overallRejectsNoDecay
{
  [(_ATXAppLaunchCategoricalHistogram *)self->_appClipsAndHeroAppHistogramNoDecay totalLaunchesForCategory:@"rejects_clips"];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClipsAndHeroAppHistogramNoDecay, 0);
  objc_storeStrong((id *)&self->_appClipsAndHeroAppHistogram, 0);
}

@end