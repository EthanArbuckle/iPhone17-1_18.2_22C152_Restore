@interface HKHealthSettingsMedicalIDViewController
- (BOOL)_medicalIDLoaded;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)isEditEnabled;
- (HKHealthSettingsMedicalIDViewController)initWithHealthSettingsProfile:(id)a3;
- (HKHealthSettingsNavigationDonating)settingsNavigationDonatingDelegate;
- (HKHealthSettingsProfile)healthSettingsProfile;
- (HKHealthStore)healthStore;
- (PSController)parentController;
- (PSRootController)rootController;
- (PSSpecifier)specifier;
- (UIViewController)_currentChildViewController;
- (_HKMedicalIDData)_medicalIDData;
- (id)readPreferenceValue:(id)a3;
- (void)_fetchMedicalIDData;
- (void)_handleFetchedMedicalIDData:(id)a3;
- (void)_updateChildViewController;
- (void)dealloc;
- (void)editButtonTapped:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)medicalIDViewControllerDidCancel:(id)a3;
- (void)medicalIDViewControllerDidDelete:(id)a3;
- (void)medicalIDViewControllerDidSave:(id)a3;
- (void)setHealthSettingsProfile:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setParentController:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSettingsNavigationDonatingDelegate:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)set_currentChildViewController:(id)a3;
- (void)set_medicalIDData:(id)a3;
- (void)set_medicalIDLoaded:(BOOL)a3;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HKHealthSettingsMedicalIDViewController

- (HKHealthSettingsMedicalIDViewController)initWithHealthSettingsProfile:(id)a3
{
  v4 = (HKHealthSettingsProfile *)a3;
  v13.receiver = self;
  v13.super_class = (Class)HKHealthSettingsMedicalIDViewController;
  v5 = [(HKHealthSettingsMedicalIDViewController *)&v13 init];
  healthSettingsProfile = v5->_healthSettingsProfile;
  v5->_healthSettingsProfile = v4;
  v7 = v4;

  uint64_t v8 = [(HKHealthSettingsProfile *)v7 healthStore];
  healthStore = v5->_healthStore;
  v5->_healthStore = (HKHealthStore *)v8;

  v10 = (HKMedicalIDStore *)[objc_alloc((Class)HKMedicalIDStore) initWithHealthStore:v5->_healthStore];
  medicalIDStore = v5->_medicalIDStore;
  v5->_medicalIDStore = v10;

  v5->__medicalIDLoaded = 0;
  [(HKHealthSettingsMedicalIDViewController *)v5 _fetchMedicalIDData];
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  notify_cancel(self->_medicalIDChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)HKHealthSettingsMedicalIDViewController;
  [(HKHealthSettingsMedicalIDViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)HKHealthSettingsMedicalIDViewController;
  [(HKHealthSettingsMedicalIDViewController *)&v14 viewDidLoad];
  id v3 = objc_alloc((Class)MIUIMedicalIDNavigationBarView);
  objc_super v4 = [(HKHealthSettingsMedicalIDViewController *)self healthStore];
  v5 = [(HKHealthSettingsMedicalIDViewController *)self _medicalIDData];
  v6 = +[NSLocale autoupdatingCurrentLocale];
  id v7 = [v3 initWithHealthStore:v4 medicalIDData:v5 showDateUpdated:0 locale:v6];
  uint64_t v8 = [(HKHealthSettingsMedicalIDViewController *)self navigationItem];
  [v8 setTitleView:v7];

  [(HKHealthSettingsMedicalIDViewController *)self _updateChildViewController];
  objc_initWeak(&location, self);
  v9 = (const char *)kHKMedicalIDDidChangeNotification;
  id v10 = &_dispatch_main_q;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_7AE4;
  v11[3] = &unk_105B0;
  objc_copyWeak(&v12, &location);
  notify_register_dispatch(v9, &self->_medicalIDChangedToken, (dispatch_queue_t)&_dispatch_main_q, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKHealthSettingsMedicalIDViewController;
  [(HKHealthSettingsMedicalIDViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = [(HKHealthSettingsMedicalIDViewController *)self settingsNavigationDonatingDelegate];
  v5 = +[NSURL URLWithString:@"prefs://root=HEALTH&path=MEDICAL_ID_ITEM"];
  [v4 donateWithDeepLink:v5 andTitle:@"Medical ID"];
}

- (BOOL)isEditEnabled
{
  v2 = [(HKHealthSettingsMedicalIDViewController *)self healthStore];
  id v3 = [v2 profileIdentifier];
  BOOL v4 = [v3 type] != (char *)&dword_0 + 3;

  return v4;
}

- (void)editButtonTapped:(id)a3
{
  id v4 = a3;
  if ([(HKHealthSettingsMedicalIDViewController *)self isEditEnabled])
  {
    id v5 = [objc_alloc((Class)HKMedicalIDViewController) initInEditMode:1 inBuddy:0 organDonationSignupAvailable:0];
    objc_super v6 = [(HKHealthSettingsMedicalIDViewController *)self healthStore];
    [v5 setHealthStore:v6];

    [v5 setMedicalIDStore:self->_medicalIDStore];
    [v5 setDelegate:self];
    [v5 setShowsDeleteButton:1];
    id v7 = [(HKHealthSettingsMedicalIDViewController *)self _medicalIDData];
    [v5 setMedicalID:v7];

    id v8 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_7DBC;
    v10[3] = &unk_105D8;
    objc_copyWeak(&v12, &location);
    v10[4] = self;
    id v9 = v8;
    id v11 = v9;
    +[AuthenticationHelper authenticateWithCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_fetchMedicalIDData
{
  objc_initWeak(&location, self);
  medicalIDStore = self->_medicalIDStore;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_7F34;
  v4[3] = &unk_10628;
  objc_copyWeak(&v5, &location);
  [(HKMedicalIDStore *)medicalIDStore fetchMedicalIDDataWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handleFetchedMedicalIDData:(id)a3
{
  [(HKHealthSettingsMedicalIDViewController *)self set_medicalIDData:a3];
  [(HKHealthSettingsMedicalIDViewController *)self set_medicalIDLoaded:1];
  if ([(HKHealthSettingsMedicalIDViewController *)self isViewLoaded])
  {
    [(HKHealthSettingsMedicalIDViewController *)self _updateChildViewController];
  }
}

- (void)_updateChildViewController
{
  id v3 = [(HKHealthSettingsMedicalIDViewController *)self _currentChildViewController];
  [v3 willMoveToParentViewController:0];

  id v4 = [(HKHealthSettingsMedicalIDViewController *)self _currentChildViewController];
  id v5 = [v4 view];
  [v5 removeFromSuperview];

  objc_super v6 = [(HKHealthSettingsMedicalIDViewController *)self _currentChildViewController];
  [v6 removeFromParentViewController];

  uint64_t v7 = [(HKHealthSettingsMedicalIDViewController *)self _medicalIDData];
  if (v7
    && (id v8 = (void *)v7,
        [(HKHealthSettingsMedicalIDViewController *)self _medicalIDData],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 isEmpty],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    v26 = +[_HKBehavior sharedBehavior];
    v27 = [v26 features];
    unsigned int v28 = [v27 medicalIDV2];

    if (v28)
    {
      id v18 = +[MIUIDisplayConfiguration standardConfiguration];
      [v18 setIsDeletionAvailable:1];
      [v18 setAccessPoint:7];
      id v29 = objc_alloc((Class)MIUIMedicalIDViewController);
      v30 = [(HKHealthSettingsMedicalIDViewController *)self healthStore];
      v31 = [(HKHealthSettingsMedicalIDViewController *)self _medicalIDData];
      id v32 = [v29 initWithHealthStore:v30 medicalIDData:v31 displayConfiguration:v18];

      [(HKHealthSettingsMedicalIDViewController *)self set_currentChildViewController:v32];
    }
    else
    {
      id v18 = [objc_alloc((Class)HKMedicalIDViewController) initInEditMode:0 inBuddy:0 organDonationSignupAvailable:0];
      v33 = [(HKHealthSettingsMedicalIDViewController *)self healthStore];
      [v18 setHealthStore:v33];

      [v18 setMedicalIDStore:self->_medicalIDStore];
      v34 = [(HKHealthSettingsMedicalIDViewController *)self _medicalIDData];
      [v18 setMedicalID:v34];

      [v18 setDelegate:self];
      [v18 setAllowsEditing:1];
      v35 = [(HKHealthSettingsMedicalIDViewController *)self healthStore];
      v36 = [v35 profileIdentifier];
      v37 = (char *)[v36 type];

      if (v37 == (unsigned char *)&dword_0 + 3)
      {
        [v18 setIsSecondaryProfileMedicalID:1];
        id v38 = [(HKHealthSettingsMedicalIDViewController *)self navigationItem];
        [v38 setRightBarButtonItem:0];
      }
      else
      {
        id v38 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:self action:"editButtonTapped:"];
        v39 = [(HKHealthSettingsMedicalIDViewController *)self navigationItem];
        [v39 setRightBarButtonItem:v38];
      }
      [(HKHealthSettingsMedicalIDViewController *)self set_currentChildViewController:v18];
    }
  }
  else
  {
    if ([(HKHealthSettingsMedicalIDViewController *)self _medicalIDLoaded])
    {
      id v11 = [HKHealthSettingsMedicalIDCallToActionTableViewController alloc];
      id v12 = [(HKHealthSettingsMedicalIDViewController *)self healthSettingsProfile];
      objc_super v13 = [(HKHealthSettingsMedicalIDCallToActionTableViewController *)v11 initWithHealthSettingsProfile:v12];
      [(HKHealthSettingsMedicalIDViewController *)self set_currentChildViewController:v13];
    }
    else
    {
      id v14 = objc_alloc_init((Class)UIViewController);
      [(HKHealthSettingsMedicalIDViewController *)self set_currentChildViewController:v14];

      v15 = +[UIColor systemGroupedBackgroundColor];
      v16 = [(HKHealthSettingsMedicalIDViewController *)self _currentChildViewController];
      v17 = [v16 view];
      [v17 setBackgroundColor:v15];
    }
    id v18 = [(HKHealthSettingsMedicalIDViewController *)self navigationItem];
    [v18 setRightBarButtonItem:0];
  }

  v19 = [(HKHealthSettingsMedicalIDViewController *)self _currentChildViewController];
  [(HKHealthSettingsMedicalIDViewController *)self addChildViewController:v19];

  v20 = [(HKHealthSettingsMedicalIDViewController *)self view];
  v21 = [(HKHealthSettingsMedicalIDViewController *)self _currentChildViewController];
  v22 = [v21 view];
  [v20 addSubview:v22];

  v23 = [(HKHealthSettingsMedicalIDViewController *)self _currentChildViewController];
  v24 = [v23 view];
  v25 = [(HKHealthSettingsMedicalIDViewController *)self view];
  objc_msgSend(v24, "hk_alignConstraintsWithView:", v25);

  id v40 = [(HKHealthSettingsMedicalIDViewController *)self _currentChildViewController];
  [v40 didMoveToParentViewController:self];
}

- (void)medicalIDViewControllerDidDelete:(id)a3
{
  id v5 = a3;
  if ([(HKHealthSettingsMedicalIDViewController *)self isEditEnabled])
  {
    id v4 = [v5 navigationController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    [(HKMedicalIDStore *)self->_medicalIDStore deleteMedicalIDDataWithCompletion:0];
    [(HKHealthSettingsMedicalIDViewController *)self set_medicalIDData:0];
    [(HKHealthSettingsMedicalIDViewController *)self _updateChildViewController];
  }
}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
  id v3 = [a3 navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)medicalIDViewControllerDidSave:(id)a3
{
  id v3 = [a3 navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
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
  return 1;
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

- (_HKMedicalIDData)_medicalIDData
{
  return self->__medicalIDData;
}

- (void)set_medicalIDData:(id)a3
{
}

- (UIViewController)_currentChildViewController
{
  return self->__currentChildViewController;
}

- (void)set_currentChildViewController:(id)a3
{
}

- (BOOL)_medicalIDLoaded
{
  return self->__medicalIDLoaded;
}

- (void)set_medicalIDLoaded:(BOOL)a3
{
  self->__medicalIDLoaded = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKHealthSettingsProfile)healthSettingsProfile
{
  return self->_healthSettingsProfile;
}

- (void)setHealthSettingsProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthSettingsProfile, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->__currentChildViewController, 0);
  objc_storeStrong((id *)&self->__medicalIDData, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_destroyWeak((id *)&self->_rootController);
  objc_destroyWeak((id *)&self->_parentController);
  objc_destroyWeak((id *)&self->_settingsNavigationDonatingDelegate);

  objc_storeStrong((id *)&self->_medicalIDStore, 0);
}

@end