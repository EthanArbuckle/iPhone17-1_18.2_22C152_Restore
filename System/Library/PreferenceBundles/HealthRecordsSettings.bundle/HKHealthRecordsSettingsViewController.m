@interface HKHealthRecordsSettingsViewController
- (BOOL)canBeShownFromSuspendedState;
- (HKHealthRecordsSettingsViewController)init;
- (HKHealthSettingsNavigationDonating)settingsNavigationDonatingDelegate;
- (PSController)parentController;
- (PSRootController)rootController;
- (PSSpecifier)specifier;
- (id)readPreferenceValue:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setParentController:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSettingsNavigationDonatingDelegate:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation HKHealthRecordsSettingsViewController

- (HKHealthRecordsSettingsViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKHealthRecordsSettingsViewController;
  return [(HKHealthRecordsSettingsViewController *)&v3 init];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKHealthRecordsSettingsViewController;
  [(HKHealthRecordsSettingsViewController *)&v6 viewDidAppear:a3];
  v4 = [(HKHealthRecordsSettingsViewController *)self settingsNavigationDonatingDelegate];
  v5 = +[NSURL URLWithString:@"prefs://root=HEALTH&path=HEALTH_RECORDS_ITEM"];
  [v4 donateWithDeepLink:v5 andTitle:@"Health Records"];
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  p_parentController = &self->_parentController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parentController);
  [WeakRetained handleURL:v7 withCompletion:v6];
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
  return 0;
}

- (HKHealthSettingsNavigationDonating)settingsNavigationDonatingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsNavigationDonatingDelegate);

  return (HKHealthSettingsNavigationDonating *)WeakRetained;
}

- (void)setSettingsNavigationDonatingDelegate:(id)a3
{
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

  objc_destroyWeak((id *)&self->_settingsNavigationDonatingDelegate);
}

@end