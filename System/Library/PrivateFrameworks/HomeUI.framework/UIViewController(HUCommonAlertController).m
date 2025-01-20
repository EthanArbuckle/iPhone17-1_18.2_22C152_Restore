@interface UIViewController(HUCommonAlertController)
+ (void)hu_presentingLockLimitAlertIfNeededFromViewController:()HUCommonAlertController home:user:accessory:include:continueActionBlock:cancelActionBlock:;
- (void)hu_presentNotificationAlertForNotificationCapableObjects:()HUCommonAlertController notificationsEnabled:mainActionBlock:notNowActionBlock:;
@end

@implementation UIViewController(HUCommonAlertController)

- (void)hu_presentNotificationAlertForNotificationCapableObjects:()HUCommonAlertController notificationsEnabled:mainActionBlock:notNowActionBlock:
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (a4) {
    v12 = @"On";
  }
  else {
    v12 = @"Off";
  }
  v13 = [NSString stringWithFormat:@"HUNotificationAlert_Title_%@", v12];
  v14 = _HULocalizedStringWithDefaultValue(v13, v13, 1);

  v15 = [NSString stringWithFormat:@"HUNotificationAlert_Message_%@", v12];
  v16 = _HULocalizedStringWithDefaultValue(v15, v15, 1);

  v17 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v14 message:v16 preferredStyle:1];
  v18 = [NSString stringWithFormat:@"HUNotificationAlert_Option_Turn%@", v12];
  v19 = _HULocalizedStringWithDefaultValue(v18, v18, 1);

  v20 = (void *)MEMORY[0x1E4F42720];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke;
  v31[3] = &unk_1E638B290;
  char v34 = a4;
  id v32 = v9;
  id v33 = v10;
  id v21 = v10;
  id v22 = v9;
  v23 = [v20 actionWithTitle:v19 style:0 handler:v31];
  [v23 setAccessibilityIdentifier:@"Home.Guest.Categories.Notifications.Alert.TurnOnOffNotificationButton"];
  [v17 addAction:v23];
  v24 = (void *)MEMORY[0x1E4F42720];
  v25 = _HULocalizedStringWithDefaultValue(@"HUNotNowTitle", @"HUNotNowTitle", 1);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_2;
  v29[3] = &unk_1E638B2B8;
  id v30 = v11;
  id v26 = v11;
  v27 = [v24 actionWithTitle:v25 style:0 handler:v29];

  [v27 setAccessibilityIdentifier:@"Home.Guest.Categories.Notifications.Alert.NotNowButton"];
  [v17 addAction:v27];
  [a1 presentViewController:v17 animated:1 completion:0];
}

+ (void)hu_presentingLockLimitAlertIfNeededFromViewController:()HUCommonAlertController home:user:accessory:include:continueActionBlock:cancelActionBlock:
{
  v72[2] = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v52 = a8;
  id v55 = a9;
  v56 = v15;
  v17 = [v14 homeAccessControlForUser:v15];
  v18 = [v17 restrictedGuestAccessSettings];
  v19 = (void *)[v18 mutableCopy];

  v20 = [v19 accessAllowedToAccessories];
  id v21 = (void *)[v20 mutableCopy];

  v53 = v14;
  if (a7)
  {
    objc_msgSend(v21, "na_safeAddObject:", v16);
  }
  else if (objc_msgSend(v21, "na_safeContainsObject:", v16))
  {
    [v21 removeObject:v16];
  }
  id v22 = (void *)[v21 copy];
  [v19 setAccessAllowedToAccessories:v22];

  v23 = [v19 locksWithReducedFunctionalityDueToSchedule];
  int v24 = objc_msgSend(v23, "na_safeContainsObject:", v16) & a7;

  v25 = HFLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = objc_msgSend(v56, "hf_prettyDescription");
    *(_DWORD *)buf = 136315906;
    v69 = "+[UIViewController(HUCommonAlertController) hu_presentingLockLimitAlertIfNeededFromViewController:home:user:ac"
          "cessory:include:continueActionBlock:cancelActionBlock:]";
    __int16 v70 = 1024;
    *(_DWORD *)v71 = v24;
    *(_WORD *)&v71[4] = 1024;
    *(_DWORD *)&v71[6] = a7;
    LOWORD(v72[0]) = 2112;
    *(void *)((char *)v72 + 2) = v26;
    _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "(%s) displayLimitAlert = %{BOOL}d | isOn = %{BOOL}d | user %@", buf, 0x22u);
  }
  v27 = HFLogForCategory();
  v51 = v21;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = (void *)MEMORY[0x1E4F2E4F8];
    [v19 locksWithReducedFunctionalityDueToSchedule];
    v29 = id v49 = v16;
    id v30 = [v29 allObjects];
    v31 = objc_msgSend(v28, "hf_minimumDescriptionsOfAccessories:", v30);
    id v32 = (void *)MEMORY[0x1E4F2E4F8];
    id v33 = [v19 accessAllowedToAccessories];
    char v34 = [v33 allObjects];
    v35 = objc_msgSend(v32, "hf_minimumDescriptionsOfAccessories:", v34);
    *(_DWORD *)buf = 136315650;
    v69 = "+[UIViewController(HUCommonAlertController) hu_presentingLockLimitAlertIfNeededFromViewController:home:user:ac"
          "cessory:include:continueActionBlock:cancelActionBlock:]";
    __int16 v70 = 2112;
    *(void *)v71 = v31;
    *(_WORD *)&v71[8] = 2112;
    v72[0] = v35;
    _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "(%s) ... locksWithReducedFunct = %@ | allowedAccessories = %@", buf, 0x20u);

    id v21 = v51;
    id v16 = v49;
  }
  if (v24)
  {
    v50 = _HULocalizedStringWithDefaultValue(@"HURestrictedGuest_LocksWithReducedFunctionalityDueToSchedule_Alert_SingleGuest_SingleLock", @"HURestrictedGuest_LocksWithReducedFunctionalityDueToSchedule_Alert_SingleGuest_SingleLock", 1);
    v36 = [MEMORY[0x1E4F42728] alertControllerWithTitle:&stru_1F18F92B8 message:v50 preferredStyle:1];
    v37 = (void *)MEMORY[0x1E4F42720];
    v38 = _HULocalizedStringWithDefaultValue(@"HUContinueTitle", @"HUContinueTitle", 1);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    id v39 = v16;
    v65[2] = __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke;
    v65[3] = &unk_1E6389410;
    id v40 = v16;
    id v66 = v40;
    v41 = v52;
    v67 = v52;
    v42 = [v37 actionWithTitle:v38 style:0 handler:v65];

    [v42 setAccessibilityIdentifier:@"Home.Guest.Categories.Alert.ReducedFunctionality.ContinueButton"];
    [v36 addAction:v42];
    v43 = (void *)MEMORY[0x1E4F42720];
    v44 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke_54;
    v62[3] = &unk_1E6389410;
    id v45 = v40;
    id v63 = v45;
    id v64 = v55;
    v46 = [v43 actionWithTitle:v44 style:0 handler:v62];

    [v46 setAccessibilityIdentifier:@"Home.Guest.Categories.Alert.ReducedFunctionality.CancelButton"];
    [v36 addAction:v46];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke_58;
    v57[3] = &unk_1E6386568;
    v47 = v54;
    id v58 = v54;
    v48 = v53;
    id v59 = v53;
    id v60 = v45;
    id v61 = v56;
    id v21 = v51;
    [v58 presentViewController:v36 animated:1 completion:v57];

    id v16 = v39;
  }
  else
  {
    v48 = v53;
    v47 = v54;
    v41 = v52;
    if (v52) {
      v52[2](v52);
    }
  }
}

@end