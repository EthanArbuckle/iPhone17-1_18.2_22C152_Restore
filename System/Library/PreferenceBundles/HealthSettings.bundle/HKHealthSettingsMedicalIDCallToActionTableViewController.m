@interface HKHealthSettingsMedicalIDCallToActionTableViewController
- (HKHealthSettingsMedicalIDCallToActionTableViewController)initWithHealthSettingsProfile:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_createMedicalIDTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKHealthSettingsMedicalIDCallToActionTableViewController

- (HKHealthSettingsMedicalIDCallToActionTableViewController)initWithHealthSettingsProfile:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHealthSettingsMedicalIDCallToActionTableViewController;
  v6 = [(HKHealthSettingsMedicalIDCallToActionTableViewController *)&v11 initWithStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthSettingsProfile, a3);
    uint64_t v8 = [v5 healthStore];
    healthStore = v7->_healthStore;
    v7->_healthStore = (HKHealthStore *)v8;
  }
  return v7;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)HKHealthSettingsMedicalIDCallToActionTableViewController;
  [(HKHealthSettingsMedicalIDCallToActionTableViewController *)&v9 viewDidLoad];
  v3 = [(HKHealthSettingsMedicalIDCallToActionTableViewController *)self tableView];
  [v3 _setSectionContentInsetFollowsLayoutMargins:1];

  v4 = [(HKHealthSettingsMedicalIDCallToActionTableViewController *)self tableView];
  [v4 _setSectionCornerRadius:10.0];

  id v5 = [(HKHealthSettingsMedicalIDCallToActionTableViewController *)self tableView];
  [v5 setPreservesSuperviewLayoutMargins:1];

  v6 = [(HKHealthSettingsMedicalIDCallToActionTableViewController *)self tableView];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = +[HKMedicalIDCallToActionTableViewCell defaultReuseIdentifier];
  [v6 registerClass:v7 forCellReuseIdentifier:v8];
}

- (void)_createMedicalIDTapped:(id)a3
{
  v4 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  id v5 = (char *)[v4 type];

  if (v5 == (unsigned char *)&dword_0 + 3)
  {
    id v15 = [objc_alloc((Class)NSURL) initWithString:@"bridge:root=ActiveWatch"];
    id v6 = +[LSApplicationWorkspace defaultWorkspace];
    [v6 openSensitiveURL:v15 withOptions:0];
  }
  else
  {
    uint64_t v7 = +[_HKBehavior sharedBehavior];
    uint64_t v8 = [v7 features];
    unsigned int v9 = [v8 medicalIDV2];

    if (v9)
    {
      v10 = +[MIUIDisplayConfiguration standardConfiguration];
      [v10 setAccessPoint:7];
      [v10 setShouldShowDoneButton:1];
      id v15 = [objc_alloc((Class)MIUIMedicalIDViewController) initWithHealthStore:self->_healthStore displayConfiguration:v10];
    }
    else
    {
      id v15 = [objc_alloc((Class)HKMedicalIDViewController) initInEditMode:1 inBuddy:1 organDonationSignupAvailable:0];
      [v15 setHealthStore:self->_healthStore];
      objc_super v11 = [(HKHealthSettingsMedicalIDCallToActionTableViewController *)self parentViewController];
      [v15 setDelegate:v11];

      v12 = [(HKHealthStore *)self->_healthStore profileIdentifier];
      v13 = (char *)[v12 type];

      if (v13 == (unsigned char *)&dword_0 + 3) {
        [v15 setIsSecondaryProfileMedicalID:1];
      }
    }
    id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v15];
    v14 = [(HKHealthSettingsMedicalIDCallToActionTableViewController *)self parentViewController];
    [v14 presentViewController:v6 animated:1 completion:0];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = +[HKMedicalIDCallToActionTableViewCell defaultReuseIdentifier];
  uint64_t v7 = [v5 dequeueReusableCellWithIdentifier:v6];

  uint64_t v8 = [v7 actionButton];
  [v8 addTarget:self action:"_createMedicalIDTapped:" forControlEvents:64];

  unsigned int v9 = [(HKHealthStore *)self->_healthStore profileIdentifier];
  v10 = (char *)[v9 type];

  if (v10 == (unsigned char *)&dword_0 + 3)
  {
    objc_super v11 = [v7 actionButton];
    v12 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
    v13 = [v12 localizedStringForKey:@"MEDICAL_ID_SETUP_OPEN_BRIDGE" value:&stru_10A60 table:@"HealthUI-Localizable-tinker"];
    [v11 setTitle:v13 forState:0];

    v14 = [(HKHealthSettingsProfile *)self->_healthSettingsProfile nameComponents];
    id v15 = [v14 givenName];

    v16 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
    if (v15)
    {
      v17 = [v16 localizedStringForKey:@"%@_MEDICAL_ID_SETUP_BRIDGE_BODY" value:&stru_10A60 table:@"HealthUI-Localizable-tinker"];
      v18 = [(HKHealthSettingsProfile *)self->_healthSettingsProfile nameComponents];
      v19 = [v18 givenName];
      v20 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v19);
      v21 = [v7 callToActionLabel];
      [v21 setText:v20];
    }
    else
    {
      v17 = [v16 localizedStringForKey:@"MEDICAL_ID_SETUP_BRIDGE_BODY" value:&stru_10A60 table:@"HealthUI-Localizable-tinker"];
      v18 = [v7 callToActionLabel];
      [v18 setText:v17];
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_healthSettingsProfile, 0);
}

@end