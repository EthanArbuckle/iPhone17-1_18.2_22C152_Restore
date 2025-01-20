@interface CNSiriIntelligenceSettings
- (BOOL)shouldShowSiriSuggestions;
- (CNSiriIntelligenceSettings)init;
- (void)dealloc;
- (void)setShouldShowSiriSuggestions:(BOOL)a3;
- (void)shouldShowSiriSuggestions;
@end

@implementation CNSiriIntelligenceSettings

- (CNSiriIntelligenceSettings)init
{
  v12.receiver = self;
  v12.super_class = (Class)CNSiriIntelligenceSettings;
  v2 = [(CNSiriIntelligenceSettings *)&v12 init];
  if (v2)
  {
    v3 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
    unsigned __int8 v4 = [v3 containsObject:@"com.apple.MobileAddressBook"] ^ 1;

    atomic_store(v4, (unsigned __int8 *)&v2->_shouldShowSiriSuggestions);
    objc_initWeak(&location, v2);
    v5 = dispatch_get_global_queue(17, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __34__CNSiriIntelligenceSettings_init__block_invoke;
    handler[3] = &unk_1E56B9388;
    objc_copyWeak(&v10, &location);
    v9 = @"com.apple.MobileAddressBook";
    notify_register_dispatch("com.apple.suggestions.settingsChanged", &v2->_notificationToken, v5, handler);

    v6 = v2;
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __34__CNSiriIntelligenceSettings_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = *(id *)(a1 + 32);
    v3 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
    int v4 = [v3 containsObject:v2];

    [WeakRetained setShouldShowSiriSuggestions:v4 ^ 1u];
  }
}

- (void)setShouldShowSiriSuggestions:(BOOL)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[CNSiriIntelligenceSettings setShouldShowSiriSuggestions:](a3);
  }
}

- (BOOL)shouldShowSiriSuggestions
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldShowSiriSuggestions);
  char v3 = v2 & 1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[CNSiriIntelligenceSettings shouldShowSiriSuggestions](v3);
  }
  return v3;
}

- (void)dealloc
{
  int notificationToken = self->_notificationToken;
  if (notificationToken) {
    notify_cancel(notificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNSiriIntelligenceSettings;
  [(CNSiriIntelligenceSettings *)&v4 dealloc];
}

- (void)shouldShowSiriSuggestions
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl(&dword_1909E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "canShowSiriSuggestions = %d", (uint8_t *)v1, 8u);
}

- (void)setShouldShowSiriSuggestions:(char)a1 .cold.1(char a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1 & 1;
  _os_log_debug_impl(&dword_1909E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "setCanShowSiriSuggestions = %d", (uint8_t *)v1, 8u);
}

@end