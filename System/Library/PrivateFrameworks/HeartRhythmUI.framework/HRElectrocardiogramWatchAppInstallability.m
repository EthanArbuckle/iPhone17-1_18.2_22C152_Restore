@interface HRElectrocardiogramWatchAppInstallability
+ (BOOL)isElectrocardiogramAppDeletableForActiveWatch;
+ (void)installElectrocardiogramAppOnActiveWatch:(id)a3;
- (HKWatchAppAvailability)ecgAppAvailability;
- (HRElectrocardiogramWatchAppInstallability)init;
- (id)installElectrocardiogramAppAlertController:(id)a3 cancel:(id)a4;
- (void)checkElectrocardiogramAppInstallStateWithContext:(id)a3 completion:(id)a4;
- (void)electrocardiogramAppInstallStateOnActiveWatch:(id)a3;
- (void)setAllowInstallingElectrocardiogramWatchApp:(BOOL)a3;
- (void)setEcgAppAvailability:(id)a3;
@end

@implementation HRElectrocardiogramWatchAppInstallability

- (HRElectrocardiogramWatchAppInstallability)init
{
  v7.receiver = self;
  v7.super_class = (Class)HRElectrocardiogramWatchAppInstallability;
  v2 = [(HRElectrocardiogramWatchAppInstallability *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F0A8F0]);
    uint64_t v4 = [v3 initWithBundleID:*MEMORY[0x263F09530]];
    ecgAppAvailability = v2->_ecgAppAvailability;
    v2->_ecgAppAvailability = (HKWatchAppAvailability *)v4;
  }
  return v2;
}

- (void)setAllowInstallingElectrocardiogramWatchApp:(BOOL)a3
{
  BOOL v3 = a3;
  v22[1] = *MEMORY[0x263EF8340];
  v6 = objc_msgSend(MEMORY[0x263EFFA40], "hk_heartRhythmDefaults");
  objc_msgSend(v6, "hk_setElectrocardiogramWatchAppInstallIsAllowed:", v3);

  id v7 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v8 = *MEMORY[0x263F09540];
  v22[0] = *MEMORY[0x263F09540];
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  v10 = (void *)[v7 initWithArray:v9];

  HKSynchronizeNanoPreferencesUserDefaults();
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = NSStringFromSelector(a2);
    int v14 = 138544130;
    v15 = self;
    __int16 v16 = 2114;
    v17 = v13;
    __int16 v18 = 2114;
    uint64_t v19 = v8;
    __int16 v20 = 1026;
    BOOL v21 = v3;
    _os_log_impl(&dword_220CA3000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Triggered NanoPreferencesSync (key: %{public}@; value: %{public}d)",
      (uint8_t *)&v14,
      0x26u);
  }
}

+ (BOOL)isElectrocardiogramAppDeletableForActiveWatch
{
  v2 = [MEMORY[0x263F0A550] activeNonFamilySetupDevice];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CFACCB8-FFEB-4682-A50E-16F853583912"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

- (void)electrocardiogramAppInstallStateOnActiveWatch:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F0A550];
  v6 = (void (**)(id, void, void *))a3;
  id v7 = [v5 activeNonFamilySetupDevice];
  if (v7)
  {
    uint64_t v8 = [(HRElectrocardiogramWatchAppInstallability *)self ecgAppAvailability];
    [v8 appInstallStateOnWatch:v7 completion:v6];
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = NSStringFromSelector(a2);
      int v12 = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_220CA3000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> No active device", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 100, @"No active device");
    v6[2](v6, 0, v8);
  }
}

- (void)checkElectrocardiogramAppInstallStateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([(id)objc_opt_class() isElectrocardiogramAppDeletableForActiveWatch])
  {
    objc_initWeak((id *)location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke;
    v12[3] = &unk_264580EE0;
    objc_copyWeak(v15, (id *)location);
    v15[1] = (id)a2;
    id v14 = v8;
    id v13 = v7;
    [(HRElectrocardiogramWatchAppInstallability *)self electrocardiogramAppInstallStateOnActiveWatch:v12];

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)location);
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = NSStringFromSelector(a2);
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = self;
      __int16 v17 = 2114;
      __int16 v18 = v11;
      _os_log_impl(&dword_220CA3000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Skipping check for if ECG app is installed, active watch does not support standalone apps", location, 0x16u);
    }
    (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
  }
}

void __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_2;
    block[3] = &unk_264580EB8;
    id v8 = v5;
    id v9 = WeakRetained;
    v12[1] = a1[7];
    id v11 = a1[5];
    id v10 = a1[4];
    v12[2] = a2;
    objc_copyWeak(v12, a1 + 6);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(v12);
  }
}

void __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    BOOL v3 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_2_cold_1(a1, v3, v2);
    }
    char v4 = (void *)MEMORY[0x263F1C3F8];
    id v5 = [*(id *)(a1 + 32) localizedDescription];
    v6 = [v4 alertControllerWithTitle:@"error" message:v5 preferredStyle:1];

    id v7 = (void *)MEMORY[0x263F1C3F0];
    id v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v9 = [v8 localizedStringForKey:@"ECG_APP_INSTALL_PROMPT_CANCEL_BUTTON_TITLE" value:&stru_26D2B53D0 table:@"HealthUI-Localizable-Cinnamon"];
    id v10 = HKConditionallyRedactedHeartRhythmString();
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_307;
    v37[3] = &unk_264580E40;
    id v39 = *(id *)(a1 + 56);
    id v38 = *(id *)(a1 + 32);
    id v11 = [v7 actionWithTitle:v10 style:1 handler:v37];

    [v6 addAction:v11];
    [*(id *)(a1 + 48) presentViewController:v6 animated:1 completion:0];
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + 80) - 1;
    _HKInitializeLogging();
    id v13 = (void *)*MEMORY[0x263F09920];
    BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT);
    if (v12 > 1)
    {
      if (v14)
      {
        uint64_t v22 = *(void *)(a1 + 40);
        v23 = *(const char **)(a1 + 72);
        v24 = v13;
        v25 = NSStringFromSelector(v23);
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v22;
        __int16 v42 = 2114;
        uint64_t v43 = (uint64_t)v25;
        _os_log_impl(&dword_220CA3000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> ECG App is not installed on watch, presenting install prompt", buf, 0x16u);
      }
      v26 = *(void **)(a1 + 40);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_315;
      v34[3] = &unk_264580E68;
      objc_copyWeak(v36, (id *)(a1 + 64));
      v36[1] = *(id *)(a1 + 72);
      id v35 = *(id *)(a1 + 56);
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_317;
      v31 = &unk_264580E90;
      objc_copyWeak(v33, (id *)(a1 + 64));
      v33[1] = *(id *)(a1 + 72);
      id v32 = *(id *)(a1 + 56);
      v27 = [v26 installElectrocardiogramAppAlertController:v34 cancel:&v28];
      objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v27, 1, 0, v28, v29, v30, v31);

      objc_destroyWeak(v33);
      objc_destroyWeak(v36);
    }
    else
    {
      if (v14)
      {
        uint64_t v15 = *(void *)(a1 + 40);
        uint64_t v16 = *(const char **)(a1 + 72);
        __int16 v17 = v13;
        uint64_t v18 = NSStringFromSelector(v16);
        uint64_t v19 = (void *)v18;
        uint64_t v20 = *(void *)(a1 + 80);
        *(_DWORD *)buf = 138543874;
        if (v20 == 2) {
          BOOL v21 = @"installed";
        }
        else {
          BOOL v21 = @"installing";
        }
        uint64_t v41 = v15;
        __int16 v42 = 2114;
        uint64_t v43 = v18;
        __int16 v44 = 2114;
        v45 = v21;
        _os_log_impl(&dword_220CA3000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> ECG App is %{public}@ on watch", buf, 0x20u);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

uint64_t __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_307(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_315(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v9 = 138543618;
    id v10 = WeakRetained;
    __int16 v11 = 2114;
    unint64_t v12 = v8;
    _os_log_impl(&dword_220CA3000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> User elected to install ECG App", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_317(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x263F09920];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v7 = 138543618;
    id v8 = WeakRetained;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_220CA3000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> User cancelled install prompt for ECG App", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)installElectrocardiogramAppAlertController:(id)a3 cancel:(id)a4
{
  id v27 = a3;
  id v5 = a4;
  v6 = (void *)MEMORY[0x263F1C3F8];
  int v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v8 = [v7 localizedStringForKey:@"ECG_APP_INSTALL_PROMPT_TITLE" value:&stru_26D2B53D0 table:@"HealthUI-Localizable-Cinnamon"];
  __int16 v9 = HKConditionallyRedactedHeartRhythmString();
  id v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v11 = [v10 localizedStringForKey:@"ECG_APP_INSTALL_PROMPT_BODY" value:&stru_26D2B53D0 table:@"HealthUI-Localizable-Cinnamon"];
  unint64_t v12 = HKConditionallyRedactedHeartRhythmString();
  uint64_t v13 = [v6 alertControllerWithTitle:v9 message:v12 preferredStyle:1];

  BOOL v14 = (void *)MEMORY[0x263F1C3F0];
  uint64_t v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v16 = [v15 localizedStringForKey:@"ECG_APP_INSTALL_PROMPT_CANCEL_BUTTON_TITLE" value:&stru_26D2B53D0 table:@"HealthUI-Localizable-Cinnamon"];
  __int16 v17 = HKConditionallyRedactedHeartRhythmString();
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke;
  v31[3] = &unk_264580F08;
  id v32 = v5;
  id v18 = v5;
  uint64_t v19 = [v14 actionWithTitle:v17 style:1 handler:v31];

  uint64_t v20 = (void *)MEMORY[0x263F1C3F0];
  BOOL v21 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v22 = [v21 localizedStringForKey:@"ECG_APP_INSTALL_PROMPT_INSTALL_BUTTON_TITLE" value:&stru_26D2B53D0 table:@"HealthUI-Localizable-Cinnamon"];
  v23 = HKConditionallyRedactedHeartRhythmString();
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_2;
  v29[3] = &unk_264580F80;
  v29[4] = self;
  id v30 = v27;
  id v24 = v27;
  v25 = [v20 actionWithTitle:v23 style:0 handler:v29];

  [v13 addAction:v19];
  [v13 addAction:v25];

  return v13;
}

uint64_t __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_2(uint64_t a1)
{
  v2 = objc_opt_class();
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_3;
  v3[3] = &unk_264580F58;
  id v4 = *(id *)(a1 + 40);
  [v2 installElectrocardiogramAppOnActiveWatch:v3];
}

void __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_4;
  block[3] = &unk_264580F30;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

+ (void)installElectrocardiogramAppOnActiveWatch:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x263F0A550] activeNonFamilySetupDevice];
  if (v6)
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2050000000;
    id v7 = (void *)getASDSystemAppMetadataClass_softClass;
    uint64_t v26 = getASDSystemAppMetadataClass_softClass;
    if (!getASDSystemAppMetadataClass_softClass)
    {
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __getASDSystemAppMetadataClass_block_invoke;
      BOOL v21 = &unk_264580FD0;
      uint64_t v22 = &v23;
      __getASDSystemAppMetadataClass_block_invoke((uint64_t)&v18);
      id v7 = (void *)v24[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v23, 8);
    id v9 = [v8 alloc];
    id v10 = (void *)[v9 initWithBundleID:*MEMORY[0x263F09530]];
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2050000000;
    char v11 = (void *)getASDInstallAppsClass_softClass;
    uint64_t v26 = getASDInstallAppsClass_softClass;
    if (!getASDInstallAppsClass_softClass)
    {
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __getASDInstallAppsClass_block_invoke;
      BOOL v21 = &unk_264580FD0;
      uint64_t v22 = &v23;
      __getASDInstallAppsClass_block_invoke((uint64_t)&v18);
      char v11 = (void *)v24[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v23, 8);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __86__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppOnActiveWatch___block_invoke;
    v14[3] = &unk_264580FA8;
    id v16 = a1;
    SEL v17 = a2;
    id v15 = v5;
    [v12 installApp:v10 onPairedDevice:v6 withCompletionHandler:v14];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v13 = (void *)*MEMORY[0x263F09920];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09920], OS_LOG_TYPE_ERROR)) {
      +[HRElectrocardiogramWatchAppInstallability installElectrocardiogramAppOnActiveWatch:a2];
    }
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 100, @"No active device");
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v10);
  }
}

void __86__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppOnActiveWatch___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x263F09920];
  id v6 = *MEMORY[0x263F09920];
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __86__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppOnActiveWatch___block_invoke_cold_1((uint64_t)a1, v5, (uint64_t)v4);
    }
    id v7 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[5];
      id v8 = (const char *)a1[6];
      id v10 = v5;
      char v11 = NSStringFromSelector(v8);
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      id v15 = v11;
      _os_log_impl(&dword_220CA3000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Scheduled installation of ECG app on watch", (uint8_t *)&v12, 0x16u);
    }
    id v7 = *(void (**)(void))(a1[4] + 16);
  }
  v7();
}

- (HKWatchAppAvailability)ecgAppAvailability
{
  return self->_ecgAppAvailability;
}

- (void)setEcgAppAvailability:(id)a3
{
}

- (void).cxx_destruct
{
}

void __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(const char **)(a1 + 72);
  id v6 = a2;
  id v7 = NSStringFromSelector(v5);
  uint64_t v8 = *a3;
  int v9 = 138543874;
  uint64_t v10 = v4;
  __int16 v11 = 2114;
  int v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_220CA3000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to check if ECG app is installed on watch with error: %{public}@", (uint8_t *)&v9, 0x20u);
}

+ (void)installElectrocardiogramAppOnActiveWatch:(const char *)a3 .cold.1(uint64_t a1, void *a2, const char *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = NSStringFromSelector(a3);
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_220CA3000, v5, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to schedule installation of ECG app on watch due to no active device", (uint8_t *)&v7, 0x16u);
}

void __86__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppOnActiveWatch___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(const char **)(a1 + 48);
  id v6 = a2;
  int v7 = NSStringFromSelector(v4);
  int v8 = 138543874;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_220CA3000, v6, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to schedule installation of ECG app on watch with error: %{public}@", (uint8_t *)&v8, 0x20u);
}

@end