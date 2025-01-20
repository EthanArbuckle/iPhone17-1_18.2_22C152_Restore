@interface ATXHomeScreenWidgetFeedback
- (ATXHomeScreenWidgetFeedback)init;
- (ATXHomeScreenWidgetFeedback)initWithWidgetFeedbackHistogram:(id)a3;
- (double)eventCountForWidgetBundleId:(id)a3 type:(unint64_t)a4;
- (double)pseudoTapEngagementRateForWidgetBundleId:(id)a3;
- (double)tapEngagementRateForWidgetBundleId:(id)a3;
- (id)categoryStringForFeedbackType:(unint64_t)a3;
- (void)addEventForWidgetBundleId:(id)a3 type:(unint64_t)a4;
- (void)addEventForWidgetBundleId:(id)a3 type:(unint64_t)a4 weight:(float)a5;
@end

@implementation ATXHomeScreenWidgetFeedback

- (ATXHomeScreenWidgetFeedback)init
{
  v3 = +[_ATXAppLaunchHistogramManager sharedInstance];
  v4 = [v3 categoricalHistogramForLaunchType:62];
  v5 = [(ATXHomeScreenWidgetFeedback *)self initWithWidgetFeedbackHistogram:v4];

  return v5;
}

- (ATXHomeScreenWidgetFeedback)initWithWidgetFeedbackHistogram:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHomeScreenWidgetFeedback;
  v6 = [(ATXHomeScreenWidgetFeedback *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_histogram, a3);
  }

  return v7;
}

- (id)categoryStringForFeedbackType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id result = @"TimesPseudoTapped";
      break;
    case 2uLL:
      id result = @"TimesDisplayed";
      break;
    case 3uLL:
      id result = @"UserInitiatedRotations";
      break;
    case 4uLL:
      id result = @"TimesSuggestedBySystem";
      break;
    case 5uLL:
      id result = @"TimesSystemFallBack";
      break;
    case 6uLL:
      id result = @"TimesSystemUpdate";
      break;
    case 7uLL:
      id result = @"TimesDismissed";
      break;
    case 8uLL:
      v4 = __atxlog_handle_default();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        -[ATXHomeScreenWidgetFeedback categoryStringForFeedbackType:](v4);
      }

      id result = 0;
      break;
    default:
      id result = @"TimesTapped";
      break;
  }
  return result;
}

- (void)addEventForWidgetBundleId:(id)a3 type:(unint64_t)a4
{
  LODWORD(v4) = 1.0;
  [(ATXHomeScreenWidgetFeedback *)self addEventForWidgetBundleId:a3 type:a4 weight:v4];
}

- (void)addEventForWidgetBundleId:(id)a3 type:(unint64_t)a4 weight:(float)a5
{
  histogram = self->_histogram;
  objc_super v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = a3;
  id v13 = [v9 now];
  v11 = [(ATXHomeScreenWidgetFeedback *)self categoryStringForFeedbackType:a4];
  *(float *)&double v12 = a5;
  [(_ATXAppLaunchCategoricalHistogram *)histogram addLaunchWithBundleId:v10 date:v13 category:v11 weight:v12];
}

- (double)eventCountForWidgetBundleId:(id)a3 type:(unint64_t)a4
{
  histogram = self->_histogram;
  id v7 = a3;
  v8 = [(ATXHomeScreenWidgetFeedback *)self categoryStringForFeedbackType:a4];
  [(_ATXAppLaunchCategoricalHistogram *)histogram totalLaunchesForBundleId:v7 category:v8];
  double v10 = v9;

  return v10;
}

- (double)tapEngagementRateForWidgetBundleId:(id)a3
{
  id v4 = a3;
  [(ATXHomeScreenWidgetFeedback *)self eventCountForWidgetBundleId:v4 type:2];
  double v6 = 0.0;
  if (v5 != 0.0)
  {
    double v7 = v5;
    [(ATXHomeScreenWidgetFeedback *)self eventCountForWidgetBundleId:v4 type:0];
    double v6 = v8 / v7;
  }

  return v6;
}

- (double)pseudoTapEngagementRateForWidgetBundleId:(id)a3
{
  id v4 = a3;
  [(ATXHomeScreenWidgetFeedback *)self eventCountForWidgetBundleId:v4 type:2];
  double v6 = 0.0;
  if (v5 != 0.0)
  {
    double v7 = v5;
    [(ATXHomeScreenWidgetFeedback *)self eventCountForWidgetBundleId:v4 type:1];
    double v6 = v8 / v7;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (void)categoryStringForFeedbackType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXHomeScreenWidgetFeedback: Unexpected ATXHomeScreenWidgetFeedbackType value received.", v1, 2u);
}

@end