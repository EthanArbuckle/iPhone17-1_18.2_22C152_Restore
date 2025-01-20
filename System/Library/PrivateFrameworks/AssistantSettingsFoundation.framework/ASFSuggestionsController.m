@interface ASFSuggestionsController
+ (id)sharedController;
- (ASFSuggestionsController)init;
- (ASFSuggestionsController)initWithLockScreenSuggestionManager:(id)a3;
- (BOOL)suggestionsNotificationEnabledForBundleId:(id)a3;
- (BOOL)suggestionsShowOnHomeScreenEnabledForBundleId:(id)a3;
- (BOOL)suggestionsSuggestAppEnabledForBundleId:(id)a3;
- (id)__loadDisabledShortcuts;
- (id)__loadDisabledSuggestApps;
- (id)_loadDisabledShortcutsSet;
- (id)_loadDisabledSuggestAppsSet;
- (void)_loadApps;
- (void)setSuggestionsNotificationsEnabled:(BOOL)a3 bundleId:(id)a4;
- (void)setSuggestionsShowOnHomeScreenEnabled:(BOOL)a3 bundleId:(id)a4;
- (void)setSuggestionsSuggestAppEnabled:(BOOL)a3 bundleId:(id)a4;
@end

@implementation ASFSuggestionsController

+ (id)sharedController
{
  if (sharedController_onceToken_1 != -1) {
    dispatch_once(&sharedController_onceToken_1, &__block_literal_global_2);
  }
  v2 = (void *)sharedController_singleton_0;

  return v2;
}

uint64_t __44__ASFSuggestionsController_sharedController__block_invoke()
{
  sharedController_singleton_0 = objc_alloc_init(ASFSuggestionsController);

  return MEMORY[0x270F9A758]();
}

- (ASFSuggestionsController)init
{
  v3 = +[ASFLockScreenSuggestionManager sharedInstance];
  v4 = [(ASFSuggestionsController *)self initWithLockScreenSuggestionManager:v3];

  return v4;
}

- (ASFSuggestionsController)initWithLockScreenSuggestionManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASFSuggestionsController;
  v6 = [(ASFSuggestionsController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lockScreenSuggestionManager, a3);
    [(ASFSuggestionsController *)v7 _loadApps];
  }

  return v7;
}

- (void)_loadApps
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v3 = (void (*)(uint64_t))getSPGetDisabledBundleSetSymbolLoc_ptr_0;
  v20 = getSPGetDisabledBundleSetSymbolLoc_ptr_0;
  if (!getSPGetDisabledBundleSetSymbolLoc_ptr_0)
  {
    v4 = (void *)SearchLibrary_0();
    v18[3] = (uint64_t)dlsym(v4, "SPGetDisabledBundleSet");
    getSPGetDisabledBundleSetSymbolLoc_ptr_0 = (_UNKNOWN *)v18[3];
    v3 = (void (*)(uint64_t))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v3) {
    -[ASFAvailableSuggestionAppsController _allVisibleAppBundleIds]();
  }
  v3(1);
  id v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  disabledSpotlightBundles = self->_disabledSpotlightBundles;
  self->_disabledSpotlightBundles = v5;

  v7 = [(ASFLockScreenSuggestionManaging *)self->_lockScreenSuggestionManager disabledLockScreenBundles];
  disabledLockScreenBundles = self->_disabledLockScreenBundles;
  self->_disabledLockScreenBundles = v7;

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  objc_super v9 = (void (*)(uint64_t))getSPGetDisabledAppSetSymbolLoc_ptr_0;
  v20 = getSPGetDisabledAppSetSymbolLoc_ptr_0;
  if (!getSPGetDisabledAppSetSymbolLoc_ptr_0)
  {
    v10 = (void *)SearchLibrary_0();
    v18[3] = (uint64_t)dlsym(v10, "SPGetDisabledAppSet");
    getSPGetDisabledAppSetSymbolLoc_ptr_0 = (_UNKNOWN *)v18[3];
    objc_super v9 = (void (*)(uint64_t))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v9) {
    -[ASFAvailableSuggestionAppsController _allVisibleAppBundleIds]();
  }
  v9(1);
  v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  disabledSpotlightApps = self->_disabledSpotlightApps;
  self->_disabledSpotlightApps = v11;

  v13 = [(ASFSuggestionsController *)self _loadDisabledShortcutsSet];
  disabledSpotlightShortcuts = self->_disabledSpotlightShortcuts;
  self->_disabledSpotlightShortcuts = v13;

  v15 = [(ASFSuggestionsController *)self _loadDisabledSuggestAppsSet];
  disabledSuggestApps = self->_disabledSuggestApps;
  self->_disabledSuggestApps = v15;
}

- (id)_loadDisabledShortcutsSet
{
  v2 = [(ASFSuggestionsController *)self __loadDisabledShortcuts];
  if (v2) {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v2];
  }
  else {
    uint64_t v3 = objc_opt_new();
  }
  v4 = (void *)v3;

  return v4;
}

- (id)__loadDisabledShortcuts
{
  v2 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui");

  return v2;
}

- (id)_loadDisabledSuggestAppsSet
{
  v2 = [(ASFSuggestionsController *)self __loadDisabledSuggestApps];
  if (v2) {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v2];
  }
  else {
    uint64_t v3 = objc_opt_new();
  }
  v4 = (void *)v3;

  return v4;
}

- (id)__loadDisabledSuggestApps
{
  v2 = (void *)CFPreferencesCopyAppValue(@"SBSearchSuggestAppDisabled", @"com.apple.spotlightui");

  return v2;
}

- (BOOL)suggestionsShowOnHomeScreenEnabledForBundleId:(id)a3
{
  return [(NSMutableSet *)self->_disabledSpotlightShortcuts containsObject:a3] ^ 1;
}

- (void)setSuggestionsShowOnHomeScreenEnabled:(BOOL)a3 bundleId:(id)a4
{
  BOOL v4 = a3;
  disabledSpotlightShortcuts = self->_disabledSpotlightShortcuts;
  id v7 = a4;
  if (v4) {
    [(NSMutableSet *)disabledSpotlightShortcuts removeObject:v7];
  }
  else {
    [(NSMutableSet *)disabledSpotlightShortcuts addObject:v7];
  }
  CFPreferencesSetAppValue(@"SBSearchDisabledShortcuts", (CFPropertyListRef)[(NSMutableSet *)self->_disabledSpotlightShortcuts allObjects], @"com.apple.spotlightui");
  CFPreferencesSynchronize(@"com.apple.spotlightui", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  notify_post("com.apple.spotlightui.prefschanged");
  +[ASFAssistantMetrics didDetailToggle:@"shortcutssearch" bundleId:v7 on:v4];
}

- (BOOL)suggestionsSuggestAppEnabledForBundleId:(id)a3
{
  return [(NSMutableSet *)self->_disabledSuggestApps containsObject:a3] ^ 1;
}

- (void)setSuggestionsSuggestAppEnabled:(BOOL)a3 bundleId:(id)a4
{
  BOOL v4 = a3;
  disabledSuggestApps = self->_disabledSuggestApps;
  id v7 = a4;
  if (v4) {
    [(NSMutableSet *)disabledSuggestApps removeObject:v7];
  }
  else {
    [(NSMutableSet *)disabledSuggestApps addObject:v7];
  }
  CFPreferencesSetAppValue(@"SBSearchSuggestAppDisabled", (CFPropertyListRef)[(NSMutableSet *)self->_disabledSuggestApps allObjects], @"com.apple.spotlightui");
  CFPreferencesSynchronize(@"com.apple.spotlightui", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  notify_post("com.apple.spotlightui.prefschanged");
  +[ASFAssistantMetrics didDetailToggle:@"suggestapp" bundleId:v7 on:v4];
}

- (BOOL)suggestionsNotificationEnabledForBundleId:(id)a3
{
  return [(NSMutableSet *)self->_disabledLockScreenBundles containsObject:a3] ^ 1;
}

- (void)setSuggestionsNotificationsEnabled:(BOOL)a3 bundleId:(id)a4
{
  BOOL v4 = a3;
  lockScreenSuggestionManager = self->_lockScreenSuggestionManager;
  id v9 = a4;
  [(ASFLockScreenSuggestionManaging *)lockScreenSuggestionManager setLockScreenEnabled:v4 bundleId:v9];
  id v7 = [(ASFLockScreenSuggestionManaging *)self->_lockScreenSuggestionManager disabledLockScreenBundles];
  disabledLockScreenBundles = self->_disabledLockScreenBundles;
  self->_disabledLockScreenBundles = v7;

  +[ASFAssistantMetrics didDetailToggle:@"appinlockscreen" bundleId:v9 on:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledSuggestApps, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightShortcuts, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightApps, 0);
  objc_storeStrong((id *)&self->_disabledLockScreenBundles, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);

  objc_storeStrong((id *)&self->_lockScreenSuggestionManager, 0);
}

@end