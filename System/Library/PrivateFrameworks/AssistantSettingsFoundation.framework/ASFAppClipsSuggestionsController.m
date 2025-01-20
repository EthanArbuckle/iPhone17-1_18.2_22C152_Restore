@interface ASFAppClipsSuggestionsController
+ (id)sharedController;
- (ASFAppClipsSuggestionsController)init;
- (ASFAppClipsSuggestionsController)initWithDisabledSpotlightBundles:(id)a3 disabledSpotlightApps:(id)a4;
- (BOOL)learnFromAppClipsEnabled;
- (BOOL)showInSearchEnabled;
- (BOOL)suggestAppClipsEnabled;
- (void)_synchronizeDisabledSpotlightApps;
- (void)setLearnFromAppClipsEnabled:(BOOL)a3;
- (void)setShowInSearchEnabled:(BOOL)a3;
- (void)setSuggestAppClipsEnabled:(BOOL)a3;
@end

@implementation ASFAppClipsSuggestionsController

+ (id)sharedController
{
  if (sharedController_onceToken_0 != -1) {
    dispatch_once(&sharedController_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedController_singleton;

  return v2;
}

uint64_t __52__ASFAppClipsSuggestionsController_sharedController__block_invoke()
{
  sharedController_singleton = objc_alloc_init(ASFAppClipsSuggestionsController);

  return MEMORY[0x270F9A758]();
}

- (ASFAppClipsSuggestionsController)init
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v3 = (void (*)(uint64_t))getSPGetDisabledBundleSetSymbolLoc_ptr;
  v14 = getSPGetDisabledBundleSetSymbolLoc_ptr;
  if (!getSPGetDisabledBundleSetSymbolLoc_ptr)
  {
    v4 = (void *)SearchLibrary();
    v12[3] = (uint64_t)dlsym(v4, "SPGetDisabledBundleSet");
    getSPGetDisabledBundleSetSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    v3 = (void (*)(uint64_t))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v3) {
    -[ASFAvailableSuggestionAppsController _allVisibleAppBundleIds]();
  }
  v5 = v3(1);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v6 = (void (*)(uint64_t))getSPGetDisabledAppSetSymbolLoc_ptr;
  v14 = getSPGetDisabledAppSetSymbolLoc_ptr;
  if (!getSPGetDisabledAppSetSymbolLoc_ptr)
  {
    v7 = (void *)SearchLibrary();
    v12[3] = (uint64_t)dlsym(v7, "SPGetDisabledAppSet");
    getSPGetDisabledAppSetSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    v6 = (void (*)(uint64_t))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v6) {
    -[ASFAvailableSuggestionAppsController _allVisibleAppBundleIds]();
  }
  v8 = v6(1);
  v9 = [(ASFAppClipsSuggestionsController *)self initWithDisabledSpotlightBundles:v5 disabledSpotlightApps:v8];

  return v9;
}

- (ASFAppClipsSuggestionsController)initWithDisabledSpotlightBundles:(id)a3 disabledSpotlightApps:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASFAppClipsSuggestionsController;
  v9 = [(ASFAppClipsSuggestionsController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_disabledSpotlightBundles, a3);
    objc_storeStrong((id *)&v10->_disabledSpotlightApps, a4);
  }

  return v10;
}

- (void)setLearnFromAppClipsEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(@"SuggestionsLearnFromAppClips", (CFPropertyListRef)[NSNumber numberWithBool:a3], @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (BOOL)learnFromAppClipsEnabled
{
  v2 = (void *)CFPreferencesCopyAppValue(@"SuggestionsLearnFromAppClips", @"com.apple.suggestions");
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setShowInSearchEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  disabledSpotlightBundles = self->_disabledSpotlightBundles;
  if (a3)
  {
    [(NSMutableSet *)disabledSpotlightBundles removeObject:@"com.apple.app-clips"];
    [(NSMutableSet *)self->_disabledSpotlightApps removeObject:@"com.apple.app-clips"];
  }
  else
  {
    [(NSMutableSet *)disabledSpotlightBundles addObject:@"com.apple.app-clips"];
    [(NSMutableSet *)self->_disabledSpotlightApps addObject:@"com.apple.app-clips"];
  }
  [(ASFAppClipsSuggestionsController *)self _synchronizeDisabledSpotlightApps];
  notify_post("com.apple.spotlightui.prefschanged");

  +[ASFAssistantMetrics didDetailToggle:@"appsearch" bundleId:@"com.apple.app-clips" on:v3];
}

- (void)_synchronizeDisabledSpotlightApps
{
  CFPreferencesSetAppValue(@"SBSearchDisabledBundles", (CFPropertyListRef)[(NSMutableSet *)self->_disabledSpotlightBundles allObjects], @"com.apple.spotlightui");
  CFPreferencesSetAppValue(@"SBSearchDisabledApps", (CFPropertyListRef)[(NSMutableSet *)self->_disabledSpotlightApps allObjects], @"com.apple.spotlightui");
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE50];

  CFPreferencesSynchronize(@"com.apple.spotlightui", v3, v4);
}

- (BOOL)showInSearchEnabled
{
  return [(NSMutableSet *)self->_disabledSpotlightBundles containsObject:@"com.apple.app-clips"] ^ 1;
}

- (void)setSuggestAppClipsEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(@"SuggestionsSuggestAppClips", (CFPropertyListRef)[NSNumber numberWithBool:a3], @"com.apple.suggestions");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.suggestions.settingsChanged", 0, 0, 1u);
}

- (BOOL)suggestAppClipsEnabled
{
  v2 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSuggestAppClips", @"com.apple.suggestions");
  CFStringRef v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledSpotlightApps, 0);

  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
}

@end