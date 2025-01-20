@interface HKHealthManageStorageViewController
- (HKHealthManageStorageViewController)init;
- (HKHealthStore)healthStore;
- (id)specifiers;
- (void)_disableAndDelete:(id)a3;
- (void)_loadCloudSyncStorageStatus;
- (void)confirmDisable:(id)a3;
- (void)hideSpinner;
- (void)showSpinnerMessage:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HKHealthManageStorageViewController

- (HKHealthManageStorageViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKHealthManageStorageViewController;
  v2 = [(HKHealthManageStorageViewController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_status = 0;
    id v4 = objc_alloc_init(MEMORY[0x1E4F2B0B8]);
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F2AD28]) initWithHealthStore:v4];
    cloudSyncControl = v3->_cloudSyncControl;
    v3->_cloudSyncControl = (HKCloudSyncControl *)v5;

    [(HKHealthManageStorageViewController *)v3 _loadCloudSyncStorageStatus];
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKHealthManageStorageViewController;
  [(HKHealthManageStorageViewController *)&v7 viewWillAppear:a3];
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v5 = [v4 localizedStringForKey:@"HEALTH" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v6 = [(HKHealthManageStorageViewController *)self navigationItem];
  [v6 setTitle:v5];
}

- (id)specifiers
{
  uint64_t v2 = (int)*MEMORY[0x1E4F92F08];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
    id v4 = v3;
    goto LABEL_16;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  objc_super v7 = (void *)getSTStorageAppHeaderCellClass_softClass;
  uint64_t v33 = getSTStorageAppHeaderCellClass_softClass;
  if (!getSTStorageAppHeaderCellClass_softClass)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __getSTStorageAppHeaderCellClass_block_invoke;
    v29[3] = &unk_1E6D514F8;
    v29[4] = &v30;
    __getSTStorageAppHeaderCellClass_block_invoke((uint64_t)v29);
    objc_super v7 = (void *)v31[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v30, 8);
  v9 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v10 = [v9 healthAppNotInstalled];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v12 = [v11 localizedStringForKey:@"HEALTH_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    v13 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F3B9CF20 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
    [v13 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
    [v13 setProperty:@"com.apple.graphic-icon.health-data" forKey:*MEMORY[0x1E4F931A0]];
    [v13 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F931D0]];
    [v13 setName:v12];
    [v6 addObject:v13];
  }
  else
  {
    v12 = [v8 specifierForAppIdentifier:@"com.apple.Health"];
    [v6 addObject:v12];
  }

  v14 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"TURN_OFF_AND_DELETE"];
  int64_t status = self->_status;
  if (status == 3)
  {
    v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v23 = v22;
    v24 = @"HEALTH_SYNC_IS_DISABLED";
  }
  else
  {
    if (status != 2)
    {
      if (status == 1)
      {
        v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v17 = [v16 localizedStringForKey:@"TURN_OFF_AND_DELETE_DESCRIPTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        [v14 setProperty:v17 forKey:*MEMORY[0x1E4F93170]];

        [v6 addObject:v14];
        v18 = (void *)MEMORY[0x1E4F92E70];
        v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v20 = [v19 localizedStringForKey:@"TURN_OFF_AND_DELETE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v21 = [v18 deleteButtonSpecifierWithName:v20 target:self action:sel_confirmDisable_];

        [v21 setProperty:&unk_1F3C21AC0 forKey:*MEMORY[0x1E4F93060]];
        [v6 addObject:v21];
      }
      goto LABEL_15;
    }
    v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v23 = v22;
    v24 = @"TURN_OFF_PROGRESS_MESSAGE";
  }
  v25 = [v22 localizedStringForKey:v24 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  [v14 setProperty:v25 forKey:*MEMORY[0x1E4F93170]];

  [v6 addObject:v14];
LABEL_15:
  v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v6;
  id v27 = v6;

  id v4 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
LABEL_16:
  return v4;
}

- (void)_loadCloudSyncStorageStatus
{
  cloudSyncControl = self->_cloudSyncControl;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__HKHealthManageStorageViewController__loadCloudSyncStorageStatus__block_invoke;
  v3[3] = &unk_1E6D53AB0;
  v3[4] = self;
  [(HKCloudSyncControl *)cloudSyncControl fetchCloudSyncStatusWithCompletion:v3];
}

void __66__HKHealthManageStorageViewController__loadCloudSyncStorageStatus__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__HKHealthManageStorageViewController__loadCloudSyncStorageStatus__block_invoke_2;
  v2[3] = &unk_1E6D53A88;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __66__HKHealthManageStorageViewController__loadCloudSyncStorageStatus__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 1384))
  {
    uint64_t v2 = 3;
    if (*(unsigned char *)(result + 40)) {
      uint64_t v2 = 1;
    }
    *(void *)(v1 + 1384) = v2;
    return [*(id *)(result + 32) reloadSpecifiers];
  }
  return result;
}

- (void)showSpinnerMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKHealthManageStorageViewController *)self view];
  id v6 = [v5 window];
  [v6 setUserInteractionEnabled:0];

  objc_super v7 = (UIProgressHUD *)objc_alloc_init(MEMORY[0x1E4FB1B40]);
  spinnerView = self->_spinnerView;
  self->_spinnerView = v7;

  [(UIProgressHUD *)self->_spinnerView setAutoresizingMask:45];
  [(UIProgressHUD *)self->_spinnerView setFontSize:16];
  [(UIProgressHUD *)self->_spinnerView setText:v4];

  v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];
  v11 = [(HKHealthManageStorageViewController *)self rootController];
  v12 = v11;
  if (v10 == 1)
  {
    v13 = [v11 parentViewController];
    id v14 = [v13 view];
  }
  else
  {
    id v14 = [v11 view];
  }

  [(UIProgressHUD *)self->_spinnerView showInView:v14];
}

- (void)hideSpinner
{
  [(UIProgressHUD *)self->_spinnerView hide];
  spinnerView = self->_spinnerView;
  self->_spinnerView = 0;

  id v5 = [(HKHealthManageStorageViewController *)self view];
  id v4 = [v5 window];
  [v4 setUserInteractionEnabled:1];
}

- (void)confirmDisable:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F92E20]);
  v12[0] = *MEMORY[0x1E4F930D8];
  id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = [v5 localizedStringForKey:@"TURN_OFF_AND_DELETE_PROMPT_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v13[0] = v6;
  v12[1] = *MEMORY[0x1E4F930D0];
  objc_super v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v8 = [v7 localizedStringForKey:@"TURN_OFF_AND_DELETE_PROMPT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v13[1] = v8;
  v12[2] = *MEMORY[0x1E4F930B0];
  v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v10 = [v9 localizedStringForKey:@"TURN_OFF_AND_DELETE_PROMPT_CANCEL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v13[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  [v4 setupWithDictionary:v11];

  [v4 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F930B8]];
  [v4 setTarget:self];
  [v4 setConfirmationAction:sel__disableAndDelete_];
  [(HKHealthManageStorageViewController *)self showConfirmationViewForSpecifier:v4];
}

- (void)_disableAndDelete:(id)a3
{
  if (self->_status == 1)
  {
    self->_int64_t status = 2;
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v5 = [v4 localizedStringForKey:@"TURN_OFF_PROGRESS_MESSAGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    [(HKHealthManageStorageViewController *)self showSpinnerMessage:v5];

    cloudSyncControl = self->_cloudSyncControl;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__HKHealthManageStorageViewController__disableAndDelete___block_invoke;
    v7[3] = &unk_1E6D512C8;
    v7[4] = self;
    [(HKCloudSyncControl *)cloudSyncControl disableCloudSyncAndDeleteAllCloudDataWithCompletion:v7];
    [(HKHealthManageStorageViewController *)self reloadSpecifiers];
  }
}

void __57__HKHealthManageStorageViewController__disableAndDelete___block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__HKHealthManageStorageViewController__disableAndDelete___block_invoke_2;
  v2[3] = &unk_1E6D53A88;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __57__HKHealthManageStorageViewController__disableAndDelete___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) hideSpinner];
  uint64_t v2 = 3;
  if (!*(unsigned char *)(a1 + 40)) {
    uint64_t v2 = 1;
  }
  *(void *)(*(void *)(a1 + 32) + 1384) = v2;
  char v3 = *(void **)(a1 + 32);
  return [v3 reloadSpecifiers];
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_cloudSyncControl, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
}

@end