@interface ATXModeAutomationSuggestionTester
+ (id)sharedInstance;
- (ATXModeAutomationSuggestionTester)init;
- (id)_stringForActivityType:(unint64_t)a3;
- (void)_sendNotificationWithContent:(id)a3;
- (void)activitySuggestionClient:(id)a3 didSuggestActivity:(id)a4;
- (void)activitySuggestionClient:(id)a3 didSuggestConfiguredActivity:(id)a4;
- (void)activitySuggestionClient:(id)a3 didSuggestSettingUpActivity:(id)a4;
- (void)dealloc;
@end

@implementation ATXModeAutomationSuggestionTester

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_53);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __51__ATXModeAutomationSuggestionTester_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (ATXModeAutomationSuggestionTester)init
{
  v13.receiver = self;
  v13.super_class = (Class)ATXModeAutomationSuggestionTester;
  v2 = [(ATXModeAutomationSuggestionTester *)&v13 init];
  if (v2)
  {
    CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F93688];
    Boolean keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(v3, (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat))
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.ATXDebugNotifications"];
      notificationCenter = v2->_notificationCenter;
      v2->_notificationCenter = (UNUserNotificationCenter *)v4;

      [(UNUserNotificationCenter *)v2->_notificationCenter setDelegate:v2];
      [(UNUserNotificationCenter *)v2->_notificationCenter setWantsNotificationResponsesDelivered];
      [(UNUserNotificationCenter *)v2->_notificationCenter requestAuthorizationWithOptions:6 completionHandler:&__block_literal_global_17_0];
      v6 = v2->_notificationCenter;
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      v8 = [MEMORY[0x1E4F44600] categoryWithIdentifier:@"modes.automation" actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];
      v9 = [v7 setWithObject:v8];
      [(UNUserNotificationCenter *)v6 setNotificationCategories:v9];
    }
    uint64_t v10 = objc_opt_new();
    suggestionClient = v2->_suggestionClient;
    v2->_suggestionClient = (ATXActivitySuggestionClient *)v10;

    [(ATXActivitySuggestionClient *)v2->_suggestionClient registerObserver:v2];
  }
  return v2;
}

void __41__ATXModeAutomationSuggestionTester_init__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeAutomationSuggestionTester: notification authorized = %d", (uint8_t *)v7, 8u);
  }

  if (v4)
  {
    v6 = __atxlog_handle_modes();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __41__ATXModeAutomationSuggestionTester_init__block_invoke_cold_1((uint64_t)v4, v6);
    }
  }
}

- (void)dealloc
{
  [(ATXActivitySuggestionClient *)self->_suggestionClient removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)ATXModeAutomationSuggestionTester;
  [(ATXModeAutomationSuggestionTester *)&v3 dealloc];
}

- (id)_stringForActivityType:(unint64_t)a3
{
  if (a3 > 0xF) {
    return 0;
  }
  else {
    return off_1E68AE2A8[a3];
  }
}

- (void)activitySuggestionClient:(id)a3 didSuggestConfiguredActivity:(id)a4
{
  id v9 = a4;
  v5 = objc_opt_new();
  if (v9)
  {
    [v5 setTitle:@"Activity Inferred: Enter Configured Activity"];
    id v6 = [NSString alloc];
    v7 = [v9 uuidString];
    uint64_t v8 = (void *)[v6 initWithFormat:@"The configured activity (%@) was inferred", v7];
    [v5 setBody:v8];
  }
  else
  {
    [v5 setTitle:@"Activity Inferred: Configured Activity Expired"];
    [v5 setBody:@"The last activity suggestion expired"];
  }
  [(ATXModeAutomationSuggestionTester *)self _sendNotificationWithContent:v5];
}

- (void)activitySuggestionClient:(id)a3 didSuggestSettingUpActivity:(id)a4
{
  id v7 = a4;
  v5 = objc_opt_new();
  if (v7)
  {
    [v5 setTitle:@"Activity Inferred: Activity Set-Up Suggestion"];
    id v6 = -[ATXModeAutomationSuggestionTester _stringForActivityType:](self, "_stringForActivityType:", [v7 activityType]);
    [v5 setBody:v6];
  }
  else
  {
    [v5 setTitle:@"Activity Inferred: Activity Set-Up Suggestion Expired"];
    [v5 setBody:@"Set-up suggestion expired"];
  }
  [(ATXModeAutomationSuggestionTester *)self _sendNotificationWithContent:v5];
}

- (void)activitySuggestionClient:(id)a3 didSuggestActivity:(id)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!a4)
  {
    id v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ATXModeAutomationSuggestionTester activitySuggestionClient:didSuggestActivity:](v7);
    }

    uint64_t v8 = objc_opt_new();
    [v8 setTitle:@"Activity Ended"];
    id v9 = [v6 previousSuggestion];
    uint64_t v10 = v9;
    if (v9)
    {
      v11 = [v9 modeUUID];
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        [v10 activityType];
        ATXActivityTypeToString();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v13;

      v15 = [NSString stringWithFormat:@"The previous activity (%@) has ended", v14];
      [v8 setBody:v15];

      [(ATXModeAutomationSuggestionTester *)self _sendNotificationWithContent:v8];
    }
  }
}

- (void)_sendNotificationWithContent:(id)a3
{
  id v10 = a3;
  id v4 = [v10 body];

  if (v4)
  {
    [v10 setCategoryIdentifier:@"modes.automation"];
    if (self->_notificationCenter)
    {
      v5 = [MEMORY[0x1E4F44670] triggerWithTimeInterval:0 repeats:1.0];
      id v6 = (void *)MEMORY[0x1E4F44628];
      id v7 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v8 = [v7 UUIDString];
      id v9 = [v6 requestWithIdentifier:v8 content:v10 trigger:v5];

      [(UNUserNotificationCenter *)self->_notificationCenter addNotificationRequest:v9 withCompletionHandler:&__block_literal_global_96_0];
    }
  }
}

void __66__ATXModeAutomationSuggestionTester__sendNotificationWithContent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_super v3 = __atxlog_handle_modes();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __66__ATXModeAutomationSuggestionTester__sendNotificationWithContent___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionClient, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

void __41__ATXModeAutomationSuggestionTester_init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeAutomationSuggestionTester: error while requesting notification auth - %@", (uint8_t *)&v2, 0xCu);
}

- (void)activitySuggestionClient:(os_log_t)log didSuggestActivity:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Displaying activity ended notification", v1, 2u);
}

void __66__ATXModeAutomationSuggestionTester__sendNotificationWithContent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeAutomationSuggestionTester: error while adding notification request - %@", (uint8_t *)&v2, 0xCu);
}

@end