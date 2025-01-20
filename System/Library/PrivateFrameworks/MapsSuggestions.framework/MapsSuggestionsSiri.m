@interface MapsSuggestionsSiri
+ (BOOL)canLearnFromBundleID:(id)a3;
+ (BOOL)isAllowedOnHomeScreen;
+ (BOOL)isAllowedOnLockScreen;
+ (BOOL)isEnabled;
+ (id)isAllowedOnHomeScreenCondition;
+ (id)isAllowedOnLockScreenCondition;
+ (id)isEnabledCondition;
@end

@implementation MapsSuggestionsSiri

+ (BOOL)isEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F64320];
  v3 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  int v4 = [v3 containsObject:v2];

  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = "YES";
    if (v4) {
      v6 = "NO";
    }
    int v8 = 136315138;
    v9 = v6;
    _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_DEBUG, "SiriEnabled : %s", (uint8_t *)&v8, 0xCu);
  }

  return v4 ^ 1;
}

+ (BOOL)canLearnFromBundleID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = (void *)CFPreferencesCopyAppValue(@"SiriCanLearnFromAppBlacklist", @"com.apple.suggestions");
  int v5 = [v4 containsObject:v3];

  if (v5)
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "Can't learn from: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5 ^ 1;
}

BOOL __41__MapsSuggestionsSiri_isEnabledCondition__block_invoke_2()
{
  return +[MapsSuggestionsSiri isEnabled];
}

+ (id)isEnabledCondition
{
  if (_MergedGlobals_42 != -1) {
    dispatch_once(&_MergedGlobals_42, &__block_literal_global_23);
  }
  uint64_t v2 = (void *)qword_1EB6F02A8;
  return v2;
}

void __41__MapsSuggestionsSiri_isEnabledCondition__block_invoke()
{
  v0 = [[MapsSuggestionsBlockCondition alloc] initWithName:@"siriEnabledCondition" block:&__block_literal_global_10];
  v1 = (void *)qword_1EB6F02A8;
  qword_1EB6F02A8 = (uint64_t)v0;
}

+ (id)isAllowedOnHomeScreenCondition
{
  if (qword_1EB6F02B0 != -1) {
    dispatch_once(&qword_1EB6F02B0, &__block_literal_global_13);
  }
  uint64_t v2 = (void *)qword_1EB6F02B8;
  return v2;
}

void __53__MapsSuggestionsSiri_isAllowedOnHomeScreenCondition__block_invoke()
{
  v0 = [[MapsSuggestionsBlockCondition alloc] initWithName:@"siriAllowedOnHomeScreenCondition" block:&__block_literal_global_18_0];
  v1 = (void *)qword_1EB6F02B8;
  qword_1EB6F02B8 = (uint64_t)v0;
}

BOOL __53__MapsSuggestionsSiri_isAllowedOnHomeScreenCondition__block_invoke_2()
{
  return +[MapsSuggestionsSiri isAllowedOnHomeScreen];
}

+ (id)isAllowedOnLockScreenCondition
{
  if (qword_1EB6F02C0 != -1) {
    dispatch_once(&qword_1EB6F02C0, &__block_literal_global_20_0);
  }
  uint64_t v2 = (void *)qword_1EB6F02C8;
  return v2;
}

void __53__MapsSuggestionsSiri_isAllowedOnLockScreenCondition__block_invoke()
{
  v0 = [[MapsSuggestionsBlockCondition alloc] initWithName:@"siriAllowedOnLockScreenCondition" block:&__block_literal_global_25];
  v1 = (void *)qword_1EB6F02C8;
  qword_1EB6F02C8 = (uint64_t)v0;
}

BOOL __53__MapsSuggestionsSiri_isAllowedOnLockScreenCondition__block_invoke_2()
{
  return +[MapsSuggestionsSiri isAllowedOnLockScreen];
}

+ (BOOL)isAllowedOnHomeScreen
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"SuggestionsAppLibraryEnabled", @"com.apple.suggestions");
  id v3 = v2;
  if (v2) {
    int v4 = [v2 BOOLValue];
  }
  else {
    int v4 = 1;
  }

  uint64_t v5 = *MEMORY[0x1E4F64320];
  v6 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui");
  int v7 = [v6 containsObject:v5];

  int v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = "NO";
    if (v4) {
      uint64_t v10 = "YES";
    }
    else {
      uint64_t v10 = "NO";
    }
    if (!v7) {
      id v9 = "YES";
    }
    int v12 = 136315394;
    v13 = v10;
    __int16 v14 = 2080;
    v15 = v9;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "allowedOnHomeScreen Global: %s Maps:%s", (uint8_t *)&v12, 0x16u);
  }

  return v4 & ~(_BYTE)v7;
}

+ (BOOL)isAllowedOnLockScreen
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"LockScreenSuggestionsDisabled", @"com.apple.lockscreen.shared");
  id v3 = v2;
  if (v2) {
    int v4 = [v2 BOOLValue] ^ 1;
  }
  else {
    int v4 = 1;
  }

  uint64_t v5 = *MEMORY[0x1E4F64320];
  v6 = (void *)CFPreferencesCopyAppValue(@"LockscreenSuggestionsDisabledBundles", @"com.apple.duetexpertd");
  int v7 = [v6 containsObject:v5];

  int v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = "NO";
    if (v4) {
      uint64_t v10 = "YES";
    }
    else {
      uint64_t v10 = "NO";
    }
    if (!v7) {
      id v9 = "YES";
    }
    int v12 = 136315394;
    v13 = v10;
    __int16 v14 = 2080;
    v15 = v9;
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "allowedOnLockScreen Global: %s Maps:%s", (uint8_t *)&v12, 0x16u);
  }

  return v4 & ~(_BYTE)v7;
}

@end