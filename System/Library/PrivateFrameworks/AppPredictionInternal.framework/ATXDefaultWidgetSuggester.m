@interface ATXDefaultWidgetSuggester
- (ATXDefaultWidgetSuggester)initWithHistogramManager:(id)a3;
- (BOOL)shouldSuggestTV;
- (double)_appLaunchCountForAppBudleId:(id)a3;
- (double)_intentDonationCountForActionKey:(id)a3;
- (double)_upcomingMediaCountForAppBundleId:(id)a3 isInternalApplication:(BOOL)a4;
- (double)appLaunchCountForTVApp;
- (double)intentDonationCountForTVApp;
- (double)upcomingMediaCountForTVApp;
@end

@implementation ATXDefaultWidgetSuggester

- (ATXDefaultWidgetSuggester)initWithHistogramManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXDefaultWidgetSuggester;
  v6 = [(ATXDefaultWidgetSuggester *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_histogramManager, a3);
  }

  return v7;
}

- (BOOL)shouldSuggestTV
{
  v3 = (void *)MEMORY[0x1E4F4AFB0];
  [(ATXDefaultWidgetSuggester *)self appLaunchCountForTVApp];
  double v5 = v4;
  [(ATXDefaultWidgetSuggester *)self intentDonationCountForTVApp];
  double v7 = v6;
  [(ATXDefaultWidgetSuggester *)self upcomingMediaCountForTVApp];
  return [v3 shouldSuggestTVWithAppLaunchCount:v5 intentDonationCount:v7 upcomingMediaCount:v8];
}

- (double)appLaunchCountForTVApp
{
  [(ATXDefaultWidgetSuggester *)self _appLaunchCountForAppBudleId:@"com.apple.tv"];
  return result;
}

- (double)intentDonationCountForTVApp
{
  v3 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:@"com.apple.tv" actionType:@"INPlayMediaIntent"];
  [(ATXDefaultWidgetSuggester *)self _intentDonationCountForActionKey:v3];
  double v5 = v4;

  return v5;
}

- (double)upcomingMediaCountForTVApp
{
  [(ATXDefaultWidgetSuggester *)self _upcomingMediaCountForAppBundleId:@"com.apple.tv" isInternalApplication:1];
  return result;
}

- (double)_appLaunchCountForAppBudleId:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1D25F6CC0]();
  double v6 = [(_ATXAppLaunchHistogramManager *)self->_histogramManager categoricalHistogramForLaunchType:43];
  [v6 totalLaunchesForBundleId:v4];
  double v8 = v7;
  objc_super v9 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ATXDefaultWidgetSuggester _appLaunchCountForAppBudleId:](v8);
  }

  return v8;
}

- (double)_intentDonationCountForActionKey:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1D25F6CC0]();
  double v6 = [(_ATXAppLaunchHistogramManager *)self->_histogramManager histogramForLaunchType:17];
  v12[0] = v4;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v6 totalLaunchesForBundleIds:v7];
  double v9 = v8;

  v10 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXDefaultWidgetSuggester _intentDonationCountForActionKey:](v9);
  }

  return v9;
}

- (double)_upcomingMediaCountForAppBundleId:(id)a3 isInternalApplication:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = (void *)MEMORY[0x1D25F6CC0]();
  double v7 = [MEMORY[0x1E4F4B390] getUpcomingMediaForBundle:v5 isInternalApplication:v4];
  double v8 = [v7 sortedUpcomingMedia];
  uint64_t v9 = [v8 count];

  v10 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXDefaultWidgetSuggester _upcomingMediaCountForAppBundleId:isInternalApplication:]((uint64_t)v5, v9);
  }

  v11 = [v7 sortedUpcomingMedia];
  double v12 = (double)(unint64_t)[v11 count];

  return v12;
}

- (void).cxx_destruct
{
}

- (void)_appLaunchCountForAppBudleId:(double)a1 .cold.1(double a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134218242;
  double v3 = a1;
  OUTLINED_FUNCTION_2_4();
  _os_log_debug_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_DEBUG, "ATXDefaultWidgetSuggester: fetched app launches: %f for bundle: %@", (uint8_t *)&v2, 0x16u);
}

- (void)_intentDonationCountForActionKey:(double)a1 .cold.1(double a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134218242;
  double v3 = a1;
  OUTLINED_FUNCTION_2_4();
  _os_log_debug_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_DEBUG, "ATXDefaultWidgetSuggester: fetched intent donations: %f for bundle: %@", (uint8_t *)&v2, 0x16u);
}

- (void)_upcomingMediaCountForAppBundleId:(uint64_t)a1 isInternalApplication:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  OUTLINED_FUNCTION_2_4();
  _os_log_debug_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEBUG, "ATXDefaultWidgetSuggester: fetched upcoming media: %ld for bundle: %@", (uint8_t *)&v3, 0x16u);
}

@end