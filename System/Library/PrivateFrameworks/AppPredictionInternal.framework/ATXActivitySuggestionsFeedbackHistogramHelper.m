@interface ATXActivitySuggestionsFeedbackHistogramHelper
+ (id)histogramBundleIdForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6;
- (ATXActivitySuggestionsFeedbackHistogramHelper)init;
- (ATXActivitySuggestionsFeedbackHistogramHelper)initWithFeedbackCategoricalHistogram:(id)a3;
- (double)acceptancesForLockScreenSuggestionWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6;
- (double)rejectionsForLockScreenSuggestionWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6;
- (double)suggestionsGivenForLockScreenSuggestionWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6;
- (void)updateFeedbackHistogramWithEvent:(id)a3;
@end

@implementation ATXActivitySuggestionsFeedbackHistogramHelper

- (ATXActivitySuggestionsFeedbackHistogramHelper)init
{
  v3 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v4 = [v3 categoricalHistogramForLaunchType:96];

  v5 = [(ATXActivitySuggestionsFeedbackHistogramHelper *)self initWithFeedbackCategoricalHistogram:v4];
  return v5;
}

- (ATXActivitySuggestionsFeedbackHistogramHelper)initWithFeedbackCategoricalHistogram:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActivitySuggestionsFeedbackHistogramHelper;
  v6 = [(ATXActivitySuggestionsFeedbackHistogramHelper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_feedbackCategoricalHistogram, a3);
  }

  return v7;
}

- (void)updateFeedbackHistogramWithEvent:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if ([v4 location] == 1)
  {
    v24 = self;
    id v5 = objc_opt_class();
    v6 = [v4 activity];
    v7 = [v6 modeUUID];
    v8 = [v4 activity];
    [v8 activityType];
    uint64_t v9 = ATXActivityTypeToBMUserFocusInferredModeType();
    v10 = [v4 activity];
    [v10 origin];
    uint64_t v11 = BMUserFocusInferredModeOriginFromLegacy();
    v12 = [v4 activity];
    v13 = [v12 originAnchorType];
    v14 = [v5 histogramBundleIdForModeWithUUID:v7 modeType:v9 origin:v11 originAnchorType:v13];

    uint64_t v15 = [v4 eventType];
    switch(v15)
    {
      case 3:
        feedbackCategoricalHistogram = v24->_feedbackCategoricalHistogram;
        v21 = [v4 eventDate];
        [(_ATXAppLaunchCategoricalHistogram *)feedbackCategoricalHistogram addLaunchWithBundleId:v14 date:v21 category:@"rejected"];

        v18 = __atxlog_handle_modes();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[ATXActivitySuggestionsFeedbackHistogramHelper updateFeedbackHistogramWithEvent:]";
          __int16 v27 = 2112;
          v28 = v14;
          v19 = "%s: adding rejected count to feedback event of id: %@";
          goto LABEL_13;
        }
LABEL_14:

        break;
      case 2:
        v22 = v24->_feedbackCategoricalHistogram;
        v23 = [v4 eventDate];
        [(_ATXAppLaunchCategoricalHistogram *)v22 addLaunchWithBundleId:v14 date:v23 category:@"accepted"];

        v18 = __atxlog_handle_modes();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[ATXActivitySuggestionsFeedbackHistogramHelper updateFeedbackHistogramWithEvent:]";
          __int16 v27 = 2112;
          v28 = v14;
          v19 = "%s: adding accepted count to feedback event of id: %@";
          goto LABEL_13;
        }
        goto LABEL_14;
      case 0:
        v16 = v24->_feedbackCategoricalHistogram;
        v17 = [v4 eventDate];
        [(_ATXAppLaunchCategoricalHistogram *)v16 addLaunchWithBundleId:v14 date:v17 category:@"suggested"];

        v18 = __atxlog_handle_modes();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[ATXActivitySuggestionsFeedbackHistogramHelper updateFeedbackHistogramWithEvent:]";
          __int16 v27 = 2112;
          v28 = v14;
          v19 = "%s: adding suggested count to feedback event of id: %@";
LABEL_13:
          _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
          goto LABEL_14;
        }
        goto LABEL_14;
    }
  }
  else
  {
    v14 = __atxlog_handle_modes();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[ATXActivitySuggestionsFeedbackHistogramHelper updateFeedbackHistogramWithEvent:]";
      __int16 v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "%s: skipping feedback event since it does not pertain to lock screen: %@", buf, 0x16u);
    }
  }
}

+ (id)histogramBundleIdForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6
{
  v7 = (objc_class *)NSString;
  id v8 = a6;
  id v9 = a3;
  id v10 = [v7 alloc];
  uint64_t v11 = BMUserFocusInferredModeTypeToLegacy();
  v12 = (void *)[v10 initWithFormat:@"%@:%lu:%lu:%@", v9, v11, BMUserFocusInferredModeOriginToLegacy(), v8];

  return v12;
}

- (double)suggestionsGivenForLockScreenSuggestionWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a3;
  v12 = [(id)objc_opt_class() histogramBundleIdForModeWithUUID:v11 modeType:v7 origin:v6 originAnchorType:v10];

  [(_ATXAppLaunchCategoricalHistogram *)self->_feedbackCategoricalHistogram totalLaunchesForBundleId:v12 category:@"suggested"];
  double v14 = v13;

  return v14;
}

- (double)acceptancesForLockScreenSuggestionWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a3;
  v12 = [(id)objc_opt_class() histogramBundleIdForModeWithUUID:v11 modeType:v7 origin:v6 originAnchorType:v10];

  [(_ATXAppLaunchCategoricalHistogram *)self->_feedbackCategoricalHistogram totalLaunchesForBundleId:v12 category:@"accepted"];
  double v14 = v13;

  return v14;
}

- (double)rejectionsForLockScreenSuggestionWithModeUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originAnchorType:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a3;
  v12 = [(id)objc_opt_class() histogramBundleIdForModeWithUUID:v11 modeType:v7 origin:v6 originAnchorType:v10];

  [(_ATXAppLaunchCategoricalHistogram *)self->_feedbackCategoricalHistogram totalLaunchesForBundleId:v12 category:@"rejected"];
  double v14 = v13;

  return v14;
}

- (void).cxx_destruct
{
}

@end