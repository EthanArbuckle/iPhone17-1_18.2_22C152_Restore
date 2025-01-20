@interface ASFLockScreenSuggestionManager
+ (id)sharedInstance;
- (id)_serializedBundles;
- (id)disabledLockScreenBundles;
- (void)_synchronizeLockScreenPreferences;
- (void)setLockScreenEnabled:(BOOL)a3 bundleId:(id)a4;
@end

@implementation ASFLockScreenSuggestionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_singleton;

  return v2;
}

uint64_t __48__ASFLockScreenSuggestionManager_sharedInstance__block_invoke()
{
  sharedInstance_singleton = objc_alloc_init(ASFLockScreenSuggestionManager);

  return MEMORY[0x270F9A758]();
}

- (id)disabledLockScreenBundles
{
  disabledLockScreenBundleIds = self->_disabledLockScreenBundleIds;
  if (!disabledLockScreenBundleIds)
  {
    v4 = [(ASFLockScreenSuggestionManager *)self _serializedBundles];
    v5 = [MEMORY[0x263EFF980] arrayWithArray:v4];
    [v5 removeObject:@"com.apple.application"];
    [v5 removeObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
    if ([v4 containsObject:@"com.apple.DocumentsApp"]) {
      [v5 addObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
    }
    v6 = [MEMORY[0x263EFF9C0] setWithArray:v5];
    v7 = self->_disabledLockScreenBundleIds;
    self->_disabledLockScreenBundleIds = v6;

    disabledLockScreenBundleIds = self->_disabledLockScreenBundleIds;
  }

  return disabledLockScreenBundleIds;
}

- (id)_serializedBundles
{
  v2 = (void *)CFPreferencesCopyValue(@"LockscreenSuggestionsDisabledBundles", @"com.apple.duetexpertd", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  v5 = v4;

  return v5;
}

- (void)setLockScreenEnabled:(BOOL)a3 bundleId:(id)a4
{
  BOOL v4 = a3;
  disabledLockScreenBundleIds = self->_disabledLockScreenBundleIds;
  id v7 = a4;
  if (v4) {
    [(NSMutableSet *)disabledLockScreenBundleIds removeObject:v7];
  }
  else {
    [(NSMutableSet *)disabledLockScreenBundleIds addObject:v7];
  }
  [(ASFLockScreenSuggestionManager *)self _synchronizeLockScreenPreferences];
  notify_post("com.apple.duetexpertd.prefschanged");
  +[ASFAssistantMetrics didDetailToggle:@"appinlockscreen" bundleId:v7 on:v4];
}

- (void)_synchronizeLockScreenPreferences
{
  CFPreferencesSetAppValue(@"LockscreenSuggestionsDisabledBundles", (CFPropertyListRef)[(NSMutableSet *)self->_disabledLockScreenBundleIds allObjects], @"com.apple.duetexpertd");
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE50];

  CFPreferencesSynchronize(@"com.apple.duetexpertd", v2, v3);
}

- (void).cxx_destruct
{
}

@end