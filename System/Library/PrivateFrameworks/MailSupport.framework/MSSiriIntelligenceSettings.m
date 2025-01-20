@interface MSSiriIntelligenceSettings
+ (BOOL)canShowSiriSuggestions;
+ (OS_os_log)log;
+ (void)_initializeSettings;
+ (void)canShowSiriSuggestions;
+ (void)setCanShowSiriSuggestions:(BOOL)a3;
@end

@implementation MSSiriIntelligenceSettings

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MSSiriIntelligenceSettings_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, block);
  }
  v2 = (void *)log_log_2;
  return (OS_os_log *)v2;
}

void __33__MSSiriIntelligenceSettings_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;
}

+ (BOOL)canShowSiriSuggestions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MSSiriIntelligenceSettings_canShowSiriSuggestions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (canShowSiriSuggestions_onceToken != -1) {
    dispatch_once(&canShowSiriSuggestions_onceToken, block);
  }
  unsigned __int8 v2 = atomic_load(sMSCanShowSiriSuggestions);
  char v3 = v2 & 1;
  v4 = +[MSSiriIntelligenceSettings log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[MSSiriIntelligenceSettings canShowSiriSuggestions];
  }

  return v3;
}

uint64_t __52__MSSiriIntelligenceSettings_canShowSiriSuggestions__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeSettings];
}

+ (void)setCanShowSiriSuggestions:(BOOL)a3
{
  atomic_store(a3, sMSCanShowSiriSuggestions);
  v4 = +[MSSiriIntelligenceSettings log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[MSSiriIntelligenceSettings setCanShowSiriSuggestions:](a3, v4);
  }
}

+ (void)_initializeSettings
{
  atomic_store(SGAppCanShowSiriSuggestions((void *)*MEMORY[0x1E4F5FD38]), sMSCanShowSiriSuggestions);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__MSSiriIntelligenceSettings__initializeSettings__block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_v12__0i8l;
  aBlock[4] = a1;
  char v3 = _Block_copy(aBlock);
  int out_token = 0;
  v4 = dispatch_get_global_queue(17, 0);
  notify_register_dispatch("com.apple.suggestions.settingsChanged", &out_token, v4, v3);
}

uint64_t __49__MSSiriIntelligenceSettings__initializeSettings__block_invoke(uint64_t a1)
{
  uint64_t CanShowSiriSuggestions = SGAppCanShowSiriSuggestions((void *)*MEMORY[0x1E4F5FD38]);
  char v3 = *(void **)(a1 + 32);
  return [v3 setCanShowSiriSuggestions:CanShowSiriSuggestions];
}

+ (void)canShowSiriSuggestions
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1BF36E000, a2, OS_LOG_TYPE_DEBUG, "canShowSiriSuggestions = %d", (uint8_t *)v2, 8u);
}

+ (void)setCanShowSiriSuggestions:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1BF36E000, a2, OS_LOG_TYPE_DEBUG, "setuint64_t CanShowSiriSuggestions = %d", (uint8_t *)v2, 8u);
}

@end