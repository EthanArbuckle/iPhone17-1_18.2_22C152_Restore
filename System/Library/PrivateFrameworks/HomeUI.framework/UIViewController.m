@interface UIViewController
@end

@implementation UIViewController

id __63__UIViewController_HUPresentation__hu_performDismissalRequest___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) popToViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

BOOL __63__UIViewController_HUPresentation__hu_performDismissalRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

id __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentedViewController];
  if ([v2 conformsToProtocol:&unk_1F1A7BE18]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  if (v4) {
    objc_msgSend(v4, "hu_prepareForDismissalAnimated:", *(unsigned __int8 *)(a1 + 40));
  }
  else {
  v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:&unk_1F19B3AB8];
  }

  return v5;
}

id __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke_76(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F7A0D8];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 unsignedIntegerValue];

  if (v6 == 1)
  {
    [v5 finishWithNoResult];
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke_2;
    v10[3] = &unk_1E6386018;
    id v11 = v5;
    [v7 dismissViewControllerAnimated:v8 completion:v10];
  }

  return v5;
}

uint64_t __69__UIViewController_HUPresentation__hu_dismissViewControllerAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

id __96__UIViewController_HUPreloadingModalPresentation__hu_presentPreloadableViewController_animated___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __96__UIViewController_HUPreloadingModalPresentation__hu_presentPreloadableViewController_animated___block_invoke_2;
  v8[3] = &unk_1E6386018;
  id v6 = v2;
  id v9 = v6;
  [v3 presentViewController:v4 animated:v5 completion:v8];

  return v6;
}

void __96__UIViewController_HUPreloadingModalPresentation__hu_presentPreloadableViewController_animated___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  NAEmptyResult();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithResult:v2];
}

void __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [v2 title];
    *(_DWORD *)buf = 136315394;
    v34 = "-[UIViewController(HUCommonAlertController) hu_presentNotificationAlertForNotificationCapableObjects:notificat"
          "ionsEnabled:mainActionBlock:notNowActionBlock:]_block_invoke";
    __int16 v35 = 2114;
    v36 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%{public}@'.", buf, 0x16u);
  }
  v23 = v2;

  v24 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v5 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "hf_userNotificationSettings", v23);
        v12 = (void *)[v11 mutableCopy];

        if (v12
          && (int v13 = [v12 areNotificationsEnabled], v14 = *(unsigned __int8 *)(v5 + 48), v14 != v13))
        {
          [v12 setNotificationsEnabled:v14 != 0];
          v16 = objc_msgSend(v10, "hf_updateUserNotificationSettings:", v12);
          objc_msgSend(v24, "na_safeAddObject:", v16);

          int v15 = 1;
        }
        else
        {
          int v15 = 0;
        }
        v17 = HFLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          if (v15) {
            v18 = @"NOT updating";
          }
          else {
            v18 = @"Updating";
          }
          v19 = NSStringFromBOOL();
          [v12 areNotificationsEnabled];
          v20 = NSStringFromBOOL();
          *(_DWORD *)buf = 136316418;
          v34 = "-[UIViewController(HUCommonAlertController) hu_presentNotificationAlertForNotificationCapableObjects:not"
                "ificationsEnabled:mainActionBlock:notNowActionBlock:]_block_invoke";
          __int16 v35 = 2112;
          v36 = v18;
          __int16 v37 = 2112;
          v38 = v19;
          __int16 v39 = 2112;
          v40 = v10;
          __int16 v41 = 2112;
          v42 = v12;
          __int16 v43 = 2112;
          v44 = v20;
          _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "(%s) %@ notificationsEnabled to %@ for %@. newSettings = %@. current notificationsEnabled = %@", buf, 0x3Eu);

          uint64_t v5 = a1;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v7);
  }

  v21 = [MEMORY[0x1E4F7A0D8] combineAllFutures:v24];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_23;
  v27[3] = &unk_1E638B268;
  id v28 = *(id *)(v5 + 40);
  id v22 = (id)[v21 addCompletionBlock:v27];
}

void __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v14 = "-[UIViewController(HUCommonAlertController) hu_presentNotificationAlertForNotificationCapableObjects:notificat"
          "ionsEnabled:mainActionBlock:notNowActionBlock:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%s) Completed notification settings update. result %@. Error = %@", buf, 0x20u);
  }

  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F69110] sharedHandler];
    uint64_t v9 = *MEMORY[0x1E4F68788];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_25;
    v11[3] = &unk_1E6386040;
    id v12 = *(id *)(a1 + 32);
    [v8 handleError:v6 operationType:v9 options:0 retryBlock:0 cancelBlock:v11];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }
  }
}

uint64_t __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_25(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __157__UIViewController_HUCommonAlertController__hu_presentNotificationAlertForNotificationCapableObjects_notificationsEnabled_mainActionBlock_notNowActionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 title];
    int v7 = 136315394;
    uint64_t v8 = "-[UIViewController(HUCommonAlertController) hu_presentNotificationAlertForNotificationCapableObjects:notificati"
         "onsEnabled:mainActionBlock:notNowActionBlock:]_block_invoke_2";
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%{public}@'.", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

uint64_t __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    int v5 = 136315394;
    uint64_t v6 = "+[UIViewController(HUCommonAlertController) hu_presentingLockLimitAlertIfNeededFromViewController:home:user:acc"
         "essory:include:continueActionBlock:cancelActionBlock:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'Continue' button about the limit for wallet key and pin code. Allowing RG access to %@", (uint8_t *)&v5, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke_54(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "hf_minimumDescription");
    int v5 = 136315394;
    uint64_t v6 = "+[UIViewController(HUCommonAlertController) hu_presentingLockLimitAlertIfNeededFromViewController:home:user:acc"
         "essory:include:continueActionBlock:cancelActionBlock:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User selected 'cancel' button about the limit. NOT updating access for %@", (uint8_t *)&v5, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __165__UIViewController_HUCommonAlertController__hu_presentingLockLimitAlertIfNeededFromViewController_home_user_accessory_include_continueActionBlock_cancelActionBlock___block_invoke_58(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_msgSend(a1[5], "hf_minimumDescription");
    int v5 = objc_msgSend(a1[6], "hf_prettyDescription");
    uint64_t v6 = objc_msgSend(a1[7], "hf_prettyDescription");
    int v7 = 136316162;
    uint64_t v8 = "+[UIViewController(HUCommonAlertController) hu_presentingLockLimitAlertIfNeededFromViewController:home:user:acc"
         "essory:include:continueActionBlock:cancelActionBlock:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    __int16 v13 = 2112;
    int v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Displayed alert about wallet key and pin code limits when updating schedule from %@ | home %@ | accessory %@ | user %@", (uint8_t *)&v7, 0x34u);
  }
}

@end