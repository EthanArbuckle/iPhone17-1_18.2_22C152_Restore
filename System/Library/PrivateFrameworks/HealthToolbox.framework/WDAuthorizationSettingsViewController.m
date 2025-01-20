@interface WDAuthorizationSettingsViewController
- (BOOL)_isSiriAndDeviceCapable;
- (BOOL)_isTypeEnabledAtIndexPath;
- (WDAuthorizationSettingsViewController)initWithProfile:(id)a3 style:(int64_t)a4;
- (WDProfile)profile;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)sectionsForAuthController:(id)a3;
- (id)specialCellWithIdentifier:(id)a3 textLabelText:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setProfile:(id)a3;
- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WDAuthorizationSettingsViewController

- (WDAuthorizationSettingsViewController)initWithProfile:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  v7 = [v6 healthStore];
  v11.receiver = self;
  v11.super_class = (Class)WDAuthorizationSettingsViewController;
  v8 = [(HKAuthorizationSettingsViewController *)&v11 initWithHealthStore:v7 style:a4];

  if (v8)
  {
    [(WDAuthorizationSettingsViewController *)v8 setProfile:v6];
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v8 selector:sel__applicationWillEnterForeground name:*MEMORY[0x263F1D0D0] object:0];
  }
  return v8;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)WDAuthorizationSettingsViewController;
  [(HKAuthorizationSettingsViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WDAuthorizationSettingsViewController;
  [(HKAuthorizationSettingsViewController *)&v3 viewWillAppear:a3];
}

- (id)sectionsForAuthController:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WDAuthorizationSettingsViewController;
  v4 = [(HKAuthorizationSettingsViewController *)&v10 sectionsForAuthController:a3];
  v5 = (void *)[v4 mutableCopy];

  id v6 = [(WDAuthorizationSettingsViewController *)self profile];
  v7 = [v6 presentationContext];

  if (v7 != @"SettingsPrivacy") {
    [v5 addObject:&unk_26D2FD3F8];
  }
  if ([(WDAuthorizationSettingsViewController *)self _isSiriAndDeviceCapable]) {
    [v5 addObject:&unk_26D2FD410];
  }
  v8 = [v5 sortedArrayUsingSelector:sel_compare_];

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(HKAuthorizationSettingsViewController *)self authorizationSectionForSection:a4];
  v8 = 0;
  if (v7 && v7 != 5)
  {
    v10.receiver = self;
    v10.super_class = (Class)WDAuthorizationSettingsViewController;
    v8 = [(HKAuthorizationSettingsViewController *)&v10 tableView:v6 titleForHeaderInSection:a4];
  }

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(HKAuthorizationSettingsViewController *)self authorizationSectionForSection:a4];
  int64_t v8 = v7;
  if (v7)
  {
    if (v7 == 5)
    {
      int64_t v8 = 1;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)WDAuthorizationSettingsViewController;
      int64_t v8 = [(HKAuthorizationSettingsViewController *)&v10 tableView:v6 numberOfRowsInSection:a4];
    }
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", [v7 section]);
  if (v8 == 5)
  {
    v9 = NSString;
    objc_super v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
    objc_super v11 = [v10 localizedStringForKey:@"VIEW_ALL_DATA_FROM_%@" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
    v12 = [(HKAuthorizationSettingsViewController *)self source];
    v13 = [v12 name];
    v14 = objc_msgSend(v9, "stringWithFormat:", v11, v13);

    v15 = [(WDAuthorizationSettingsViewController *)self specialCellWithIdentifier:@"WDAuthorizationSettingsViewAllData" textLabelText:v14];
    [v15 setAccessoryType:1];
  }
  else
  {
    int64_t v16 = v8;
    BOOL v17 = [(WDAuthorizationSettingsViewController *)self _isSiriAndDeviceCapable];
    if (v16 == 2 && v17)
    {
      BOOL v18 = [(WDAuthorizationSettingsViewController *)self _isTypeEnabledAtIndexPath];
      v19 = [(WDAuthorizationSettingsViewController *)self tableView];
      v15 = [v19 dequeueReusableCellWithIdentifier:@"ToggleAllCell"];

      if (!v15)
      {
        v15 = (void *)[objc_alloc(MEMORY[0x263F469D8]) initWithStyle:0 reuseIdentifier:@"ToggleAllCell"];
        [v15 setDelegate:self];
      }
      v20 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
      v21 = [v20 localizedStringForKey:@"SIRI_ACCESS_DATA_BUTTON" value:&stru_26D2EA890 table:@"HealthUI-Localizable-Scribe"];
      v22 = [v15 textLabel];
      [v22 setText:v21];

      [v15 setOn:v18];
    }
    else
    {
      v24.receiver = self;
      v24.super_class = (Class)WDAuthorizationSettingsViewController;
      v15 = [(HKAuthorizationSettingsViewController *)&v24 tableView:v6 cellForRowAtIndexPath:v7];
    }
  }

  return v15;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if ([(WDAuthorizationSettingsViewController *)self _isSiriAndDeviceCapable]
    && [(HKAuthorizationSettingsViewController *)self authorizationSectionForSection:a4] == 2)
  {
    id v6 = [MEMORY[0x263F46760] defaultReuseIdentifier];
    id v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
    int64_t v8 = [v7 localizedStringForKey:@"SIRI_PRIVACY_DISCLOSURE_TEXT" value:&stru_26D2EA890 table:@"HealthUI-Localizable-Scribe"];

    v9 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
    objc_super v10 = [v9 localizedStringForKey:@"SIRI_PRIVACY_LEARN_MORE_TEXT" value:&stru_26D2EA890 table:@"HealthUI-Localizable-Scribe"];

    objc_super v11 = (void *)[objc_alloc(NSURL) initWithString:@"https://support.apple.com/kb/HT213967"];
    v12 = (void *)[objc_alloc(MEMORY[0x263F46760]) initWithReuseIdentifier:v6 bodyText:v8 linkText:v10 link:v11];
    [v12 setTextViewDelegate:self];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_isSiriAndDeviceCapable
{
  objc_super v2 = [(HKAuthorizationSettingsViewController *)self source];
  if ([v2 _isSiri]) {
    char v3 = AFDeviceSupportsSiriUOD();
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_isTypeEnabledAtIndexPath
{
  char v3 = dispatch_group_create();
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 3;
  dispatch_group_enter(v3);
  v4 = [(WDProfile *)self->_profile healthStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__WDAuthorizationSettingsViewController__isTypeEnabledAtIndexPath__block_invoke;
  v7[3] = &unk_26458EEB8;
  v7[4] = self;
  v9 = &v10;
  v5 = v3;
  int64_t v8 = v5;
  [v4 getAllHealthDataAccessForSiriWithCompletion:v7];

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = (unint64_t)(v11[3] - 4) < 0xFFFFFFFFFFFFFFFELL;

  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __66__WDAuthorizationSettingsViewController__isTypeEnabledAtIndexPath__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x263F098D0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D0], OS_LOG_TYPE_ERROR)) {
      __66__WDAuthorizationSettingsViewController__isTypeEnabledAtIndexPath__block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(HKAuthorizationSettingsViewController *)self authorizationSectionForSection:a4];
  if ([(WDAuthorizationSettingsViewController *)self _isSiriAndDeviceCapable] && v7 == 2)
  {
    double v8 = *MEMORY[0x263F1D600];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WDAuthorizationSettingsViewController;
    [(HKAuthorizationSettingsViewController *)&v11 tableView:v6 heightForFooterInSection:a4];
    double v8 = v9;
  }

  return v8;
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(WDAuthorizationSettingsViewController *)self _isSiriAndDeviceCapable]
    && ([v6 reuseIdentifier],
        int64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:@"ToggleAllCell"],
        v7,
        v8))
  {
    if (v4) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    uint64_t v10 = [(WDProfile *)self->_profile healthStore];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __70__WDAuthorizationSettingsViewController_switchCellValueChanged_value___block_invoke;
    v12[3] = &unk_26458DC48;
    v12[4] = self;
    [v10 setAllHealthDataAccessForSiri:v9 completion:v12];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WDAuthorizationSettingsViewController;
    [(HKAuthorizationSettingsViewController *)&v11 switchCellValueChanged:v6 value:v4];
  }
}

void __70__WDAuthorizationSettingsViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x263F098D0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098D0], OS_LOG_TYPE_ERROR)) {
      __70__WDAuthorizationSettingsViewController_switchCellValueChanged_value___block_invoke_cold_1(a1, (uint64_t)v5, v6);
    }
  }
}

- (id)specialCellWithIdentifier:(id)a3 textLabelText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(WDAuthorizationSettingsViewController *)self tableView];
  uint64_t v9 = [v8 dequeueReusableCellWithIdentifier:v6];

  if (!v9) {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:v6];
  }
  uint64_t v10 = [v9 textLabel];
  [v10 setText:v7];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", [v7 section]) == 5)
  {
    int v8 = objc_alloc_init(WDSourceStoredDataViewController);
    uint64_t v9 = [(HKAuthorizationSettingsViewController *)self source];
    [(WDSourceStoredDataViewController *)v8 setSource:v9];

    uint64_t v10 = [(WDAuthorizationSettingsViewController *)self profile];
    [(WDStoredDataByCategoryViewController *)v8 setProfile:v10];

    id v11 = objc_alloc(MEMORY[0x263F1C468]);
    uint64_t v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v13 = [v12 localizedStringForKey:@"BACK_TO_SOURCE_PERMISSIONS" value:&stru_26D2EA890 table:@"HealthUI-Localizable"];
    v14 = (void *)[v11 initWithTitle:v13 style:0 target:0 action:0];
    v15 = [(WDAuthorizationSettingsViewController *)self navigationItem];
    [v15 setBackBarButtonItem:v14];

    int64_t v16 = [(WDAuthorizationSettingsViewController *)self navigationController];
    [v16 pushViewController:v8 animated:1];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)WDAuthorizationSettingsViewController;
    [(HKAuthorizationSettingsViewController *)&v17 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

- (WDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
}

void __66__WDAuthorizationSettingsViewController__isTypeEnabledAtIndexPath__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)char v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4(&dword_2210D2000, a2, a3, "%{public}@: Unable to get the authorization status for Siri %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __70__WDAuthorizationSettingsViewController_switchCellValueChanged_value___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)char v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4(&dword_2210D2000, a2, a3, "Failed to update authorization status for Siri: %@ with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end