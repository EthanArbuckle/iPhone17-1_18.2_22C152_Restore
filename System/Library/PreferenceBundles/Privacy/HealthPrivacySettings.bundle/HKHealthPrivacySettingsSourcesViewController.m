@interface HKHealthPrivacySettingsSourcesViewController
+ (id)tableViewSectionClasses;
- (BOOL)canBeShownFromSuspendedState;
- (HKHealthPrivacySettingsSourcesViewController)init;
- (PSController)parentController;
- (PSRootController)rootController;
- (PSSpecifier)specifier;
- (id)_healthPrivacySubSettingViewControllerForResourceDictionary:(id)a3;
- (id)readPreferenceValue:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setParentController:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation HKHealthPrivacySettingsSourcesViewController

- (HKHealthPrivacySettingsSourcesViewController)init
{
  v3 = [HKHealthPrivacySettingsProfile alloc];
  id v4 = objc_alloc_init((Class)HKHealthStore);
  v5 = [(HKHealthPrivacySettingsProfile *)v3 initWithHealthStore:v4];

  v18.receiver = self;
  v18.super_class = (Class)HKHealthPrivacySettingsSourcesViewController;
  v6 = [(HKHealthPrivacySettingsSourcesViewController *)&v18 initWithProfile:v5 usingInsetStyling:1];
  v7 = +[_HKBehavior sharedBehavior];
  unsigned int v8 = [v7 healthAppHiddenOrNotInstalled];
  v9 = @"SOURCES_VIEW_CONTROLLER_TITLE_HEALTH";
  if (v8) {
    v9 = @"SOURCES_VIEW_CONTROLLER_TITLE_HEALTH_DATA";
  }
  v10 = v9;

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:v10 value:&stru_8350 table:0];

  [(HKHealthPrivacySettingsSourcesViewController *)v6 setTitle:v12];
  id v13 = objc_alloc((Class)UIView);
  v14 = [(HKHealthPrivacySettingsSourcesViewController *)v6 tableView];
  [v14 frame];
  id v15 = objc_msgSend(v13, "initWithFrame:", 0.0, 0.0);
  v16 = [(HKHealthPrivacySettingsSourcesViewController *)v6 tableView];
  [v16 setTableHeaderView:v15];

  return v6;
}

+ (id)tableViewSectionClasses
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKHealthPrivacySettingsSourcesViewController;
  v2 = objc_msgSendSuper2(&v5, "tableViewSectionClasses");
  id v3 = [v2 mutableCopy];

  [v3 removeObject:objc_opt_class()];
  [v3 insertObject:objc_opt_class() atIndex:0];
  [v3 insertObject:objc_opt_class() atIndex:1];

  return v3;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)HKHealthPrivacySettingsSourcesViewController;
  [(HKHealthPrivacySettingsSourcesViewController *)&v13 viewDidLoad];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(HKHealthPrivacySettingsSourcesViewController *)self tableSections];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 setParentViewController:self];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 setParentViewController:self];
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  p_parentController = &self->_parentController;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentController);
  [WeakRetained handleURL:v8 withCompletion:v7];

  id v11 = [(HKHealthPrivacySettingsSourcesViewController *)self _healthPrivacySubSettingViewControllerForResourceDictionary:v8];

  long long v10 = v11;
  if (v11)
  {
    [(HKHealthPrivacySettingsSourcesViewController *)self showController:v11];
    long long v10 = v11;
  }
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  p_parentController = &self->_parentController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentController);
  [WeakRetained setPreferenceValue:v7 specifier:v6];
}

- (id)readPreferenceValue:(id)a3
{
  p_parentController = &self->_parentController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentController);
  id v6 = [WeakRetained readPreferenceValue:v4];

  return v6;
}

- (void)showController:(id)a3
{
  p_parentController = &self->_parentController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentController);
  [WeakRetained showController:v4];
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  p_parentController = &self->_parentController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentController);
  [WeakRetained showController:v6 animate:v4];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (id)_healthPrivacySubSettingViewControllerForResourceDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"path"];
  if ([v3 isEqualToString:@"HEADPHONE_AUDIO_LEVELS"]) {
    BOOL v4 = objc_alloc_init(HKHealthPrivacyHeadphoneLevelsViewController);
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (PSController)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  return (PSController *)WeakRetained;
}

- (void)setParentController:(id)a3
{
}

- (PSRootController)rootController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootController);

  return (PSRootController *)WeakRetained;
}

- (void)setRootController:(id)a3
{
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_destroyWeak((id *)&self->_rootController);

  objc_destroyWeak((id *)&self->_parentController);
}

@end