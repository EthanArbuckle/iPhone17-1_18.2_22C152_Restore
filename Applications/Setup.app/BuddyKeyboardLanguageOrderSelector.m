@interface BuddyKeyboardLanguageOrderSelector
+ (BOOL)needsFullscreenPane;
+ (id)cloudConfigSkipKey;
+ (void)writePreferredKeyboardLanguagesToSystem:(id)a3;
- (BuddyKeyboardLanguageOrderSelector)init;
- (unint64_t)paneForAnalytics;
- (void)continuePressed;
- (void)presentAdditionViewController;
- (void)viewDidLoad;
@end

@implementation BuddyKeyboardLanguageOrderSelector

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupKeyboard;
}

+ (BOOL)needsFullscreenPane
{
  id v9 = a1;
  SEL v8 = a2;
  id v2 = +[UIKeyboardInputModeController sharedInputModeController];
  unsigned __int8 v3 = [v2 currentLocaleRequiresExtendedSetup];

  char v7 = v3 & 1;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      v4 = "does";
    }
    else {
      v4 = "does not";
    }
    sub_100095D98((uint64_t)buf, (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "The current locale %s require extended setup for keyboard/dictation.", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  return v7 & 1;
}

- (BuddyKeyboardLanguageOrderSelector)init
{
  id v11 = self;
  location[1] = (id)a2;
  id v2 = +[NSBundle mainBundle];
  location[0] = [(NSBundle *)v2 localizedStringForKey:@"MULTILINGUAL_KEYBOARD_LANGUAGE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];

  unsigned __int8 v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MULTILINGUAL_KEYBOARD_LANGUAGE_SUBTEXT"];
  id v9 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];

  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"MULTILINGUAL_KEYBOARD_LANGUAGE_ACTIONTEXT" value:&stru_1002B4E18 table:@"Localizable"];
  id v11 = [v11 initWithTitle:location[0] detailText:v9 symbolName:0 actionString:v6];
  char v7 = (BuddyKeyboardLanguageOrderSelector *)v11;

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v7;
}

- (void)viewDidLoad
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyKeyboardLanguageOrderSelector;
  [(BuddyMultilingualBaseViewController *)&v3 viewDidLoad];
  id v2 = [(BuddyKeyboardLanguageOrderSelector *)v5 buddy_animationController:@"Keyboard"];
  [(BuddyMultilingualBaseViewController *)v5 setAnimationController:v2];
}

- (void)continuePressed
{
  char v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddyKeyboardLanguageOrderSelector;
  [(BuddyMultilingualBaseViewController *)&v5 continuePressed];
  id v2 = objc_opt_class();
  id v3 = [(BuddyMultilingualBaseViewController *)v7 backingStore];
  [v2 writePreferredKeyboardLanguagesToSystem:v3];

  SEL v4 = [(BuddyMultilingualBaseViewController *)v7 delegate];
  [(BFFFlowItemDelegate *)v4 flowItemDone:v7 nextItemClass:0];
}

- (void)presentAdditionViewController
{
  v13 = self;
  location[1] = (id)a2;
  id v2 = objc_opt_class();
  id v3 = [(BuddyMultilingualBaseViewController *)v13 backingStore];
  [v2 writePreferredKeyboardLanguagesToSystem:v3];

  objc_initWeak(location, v13);
  SEL v4 = [BuddyAddKeyboardLanguageViewController alloc];
  objc_super v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  char v7 = sub_1001EC350;
  SEL v8 = &unk_1002B1408;
  objc_copyWeak(v10, location);
  id v9 = v13;
  id v11 = [(BuddyAddKeyboardLanguageViewController *)v4 initWithCompletion:&v5];
  -[BuddyKeyboardLanguageOrderSelector presentViewController:animated:completion:](v13, "presentViewController:animated:completion:", v11, 1, 0, v5, v6, v7, v8);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
}

+ (void)writePreferredKeyboardLanguagesToSystem:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = [location[0] buddy_mapArray:&stru_1002B4C18];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v16);
    _os_log_impl((void *)&_mh_execute_header, oslog, v14, "Multilingual keyboards displayed %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v13 = +[NSMutableArray array];
  memset(__b, 0, sizeof(__b));
  id v3 = v16;
  id v4 = [v3 countByEnumeratingWithState:__b objects:v19 count:16];
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
        uint64_t v12 = *(void *)(__b[1] + 8 * i);
        id v10 = +[UIKeyboardInputModeController multilingualSetForInputModeIdentifier:v12];
        if ([v10 count]) {
          [v13 addObjectsFromArray:v10];
        }
        else {
          [v13 addObject:v12];
        }
        objc_storeStrong(&v10, 0);
      }
      id v4 = [v3 countByEnumeratingWithState:__b objects:v19 count:16];
    }
    while (v4);
  }

  os_log_t v9 = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)v18, (uint64_t)v13);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Multilingual keyboards chosen %@", v18, 0xCu);
  }
  objc_storeStrong((id *)&v9, 0);
  id v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v8 = [v13 copy];
  [v7 saveInputModes:v8];

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)paneForAnalytics
{
  return 1;
}

@end