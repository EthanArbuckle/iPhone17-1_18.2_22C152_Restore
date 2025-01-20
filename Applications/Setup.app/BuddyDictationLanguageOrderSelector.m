@interface BuddyDictationLanguageOrderSelector
+ (BOOL)needsFullscreenPane;
+ (id)cloudConfigSkipKey;
+ (void)writePreferredDictationLanguagesToSystem:(id)a3;
- (BuddyDictationLanguageOrderSelector)init;
- (unint64_t)paneForAnalytics;
- (void)continuePressed;
- (void)viewDidLoad;
@end

@implementation BuddyDictationLanguageOrderSelector

+ (BOOL)needsFullscreenPane
{
  return +[BuddyKeyboardLanguageOrderSelector needsFullscreenPane];
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupSpokenLanguage;
}

- (BuddyDictationLanguageOrderSelector)init
{
  id v10 = self;
  location[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  location[0] = [(NSBundle *)v2 localizedStringForKey:@"MULTILINGUAL_DICTATION_LANGUAGE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];

  v3 = +[NSBundle mainBundle];
  v8 = [(NSBundle *)v3 localizedStringForKey:@"MULTILINGUAL_DICTATION_LANGUAGE_SUBTEXT" value:&stru_1002B4E18 table:@"Localizable"];

  v4 = +[NSBundle mainBundle];
  v5 = [(NSBundle *)v4 localizedStringForKey:@"MULTILINGUAL_DICTATION_LANGUAGE_ACTIONTEXT" value:&stru_1002B4E18 table:@"Localizable"];
  id v10 = [v10 initWithTitle:location[0] detailText:v8 symbolName:0 actionString:v5];
  v6 = (BuddyDictationLanguageOrderSelector *)v10;

  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v10, 0);
  return v6;
}

- (void)viewDidLoad
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyDictationLanguageOrderSelector;
  [(BuddyMultilingualBaseViewController *)&v3 viewDidLoad];
  id v2 = [(BuddyDictationLanguageOrderSelector *)v5 buddy_animationController:@"Dictation"];
  [(BuddyMultilingualBaseViewController *)v5 setAnimationController:v2];
}

- (void)continuePressed
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyDictationLanguageOrderSelector;
  [(BuddyMultilingualBaseViewController *)&v5 continuePressed];
  id v2 = objc_opt_class();
  id v3 = [(BuddyMultilingualBaseViewController *)v7 backingStore];
  [v2 writePreferredDictationLanguagesToSystem:v3];

  SEL v4 = [(BuddyMultilingualBaseViewController *)v7 delegate];
  [(BFFFlowItemDelegate *)v4 flowItemDone:v7 nextItemClass:0];
}

+ (void)writePreferredDictationLanguagesToSystem:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = +[NSMutableDictionary dictionary];
  memset(__b, 0, sizeof(__b));
  id v3 = location[0];
  id v4 = [v3 countByEnumeratingWithState:__b objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(v3);
        }
        id v18 = *(id *)(__b[1] + 8 * i);
        id v7 = v19;
        id v8 = [v18 identifier];
        [v7 setObject:&__kCFBooleanTrue forKey:v8];
      }
      id v4 = [v3 countByEnumeratingWithState:__b objects:v22 count:16];
    }
    while (v4);
  }

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v19 allKeys];
    id v14 = [v9 componentsJoinedByString:@", "];
    sub_10004B238((uint64_t)buf, (uint64_t)v14);
    _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Multilingual dictation languages chosen: %@", buf, 0xCu);

    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v13 = [v10 preferencesActions];

  [v13 setEnabledDictationLanguages:v19];
  id v11 = +[UIKeyboardInputModeController sharedInputModeController];
  id v12 = [v11 updateEnabledDictationLanguages:1];

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)paneForAnalytics
{
  return 2;
}

@end