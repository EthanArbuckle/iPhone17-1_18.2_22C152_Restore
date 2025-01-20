@interface BuddyAddKeyboardLanguageViewController
- (BuddyAddKeyboardLanguageViewController)initWithCompletion:(id)a3;
- (KSAddKeyboardLanguageListController)controller;
- (id)completion;
- (void)dismiss;
- (void)setCompletion:(id)a3;
- (void)setController:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyAddKeyboardLanguageViewController

- (BuddyAddKeyboardLanguageViewController)initWithCompletion:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v8;
  id v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)BuddyAddKeyboardLanguageViewController;
  id v8 = [(BuddyAddKeyboardLanguageViewController *)&v6 init];
  objc_storeStrong(&v8, v8);
  if (v8) {
    [v8 setCompletion:location[0]];
  }
  v4 = (BuddyAddKeyboardLanguageViewController *)v8;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v8, 0);
  return v4;
}

- (void)viewDidLoad
{
  objc_super v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddyAddKeyboardLanguageViewController;
  [(BuddyAddKeyboardLanguageViewController *)&v4 viewDidLoad];
  id location = objc_alloc_init((Class)KSAddKeyboardLanguageListController);
  [location setReturnSuggestedInputModes:1];
  [location setRootController:v6];
  id v2 = objc_alloc_init((Class)PSSpecifier);
  [location setSpecifier:v2];

  [location setParentController:v6];
  [(BuddyAddKeyboardLanguageViewController *)v6 showController:location];
  [(BuddyAddKeyboardLanguageViewController *)v6 setController:location];
  objc_storeStrong(&location, 0);
}

- (void)dismiss
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility();
  char v13 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    id v2 = location[0];
    os_log_type_t v3 = v13;
    sub_10004B24C(buf);
    _os_log_debug_impl((void *)&_mh_execute_header, v2, v3, "Add keyboard language view controller will dismiss", buf, 2u);
  }
  objc_storeStrong(location, 0);
  objc_super v4 = v15;
  objc_super v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_1000C220C;
  v10 = &unk_1002B0D20;
  v11 = v15;
  v5.receiver = v4;
  v5.super_class = (Class)BuddyAddKeyboardLanguageViewController;
  [(BuddyAddKeyboardLanguageViewController *)&v5 dismissWithCompletion:&v6];
  objc_storeStrong((id *)&v11, 0);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (KSAddKeyboardLanguageListController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end