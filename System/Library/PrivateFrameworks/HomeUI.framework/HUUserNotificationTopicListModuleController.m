@interface HUUserNotificationTopicListModuleController
- (BOOL)canSelectItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HFPinCodeManager)pinCodeManager;
- (id)presentNotificationSettingsForTopic:(id)a3 animated:(BOOL)a4;
- (id)showNotificationSettingsForHomeKitObject:(id)a3 animated:(BOOL)a4;
- (unint64_t)didSelectItem:(id)a3;
- (void)setPinCodeManager:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
@end

@implementation HUUserNotificationTopicListModuleController

- (Class)cellClassForItem:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  [v9 setIconDisplayStyle:1];
  v10 = +[HUIconCellContentMetrics compactMetrics];
  [v9 setContentMetrics:v10];

  [v9 setDisableContinuousIconAnimation:1];
  [v9 setAccessoryType:1];
  [v9 setIconForegroundColorFollowsTintColor:1];
  objc_opt_class();
  v11 = [v8 latestResults];
  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  int v15 = [v14 isSystemImage];
  if (v15)
  {
    v36 = self;
    objc_opt_class();
    id v16 = v8;
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    v19 = [v18 topic];
    v20 = [v19 accessoryType];

    v21 = objc_msgSend(v20, "hu_tintColor");
    v22 = [v18 topic];
    v23 = [v22 topicName];
    v24 = HFLocalizedString();
    int v25 = [v23 isEqualToString:v24];

    if (v25)
    {
      v26 = [MEMORY[0x1E4F428B8] systemGreenColor];

      v27 = HFLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = NSStringFromSelector(a2);
        v29 = [v18 topic];
        v30 = [v29 topicName];
        *(_DWORD *)buf = 138413058;
        v38 = v36;
        __int16 v39 = 2112;
        v40 = v28;
        __int16 v41 = 2112;
        v42 = v30;
        __int16 v43 = 2112;
        v44 = v26;
        _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@ Setting new color for %@ to %@", buf, 0x2Au);
      }
    }
    else
    {
      v26 = v21;
    }
    objc_opt_class();
    id v31 = v20;
    if (objc_opt_isKindOfClass()) {
      v32 = v31;
    }
    else {
      v32 = 0;
    }
    id v33 = v32;

    if (v26)
    {
      v34 = [v33 categoryType];
      char v35 = [v34 isEqual:*MEMORY[0x1E4F2C1D0]];

      if ((v35 & 1) == 0)
      {
        [v9 setIconForegroundColor:v26];
        [v9 setIconForegroundColorFollowsTintColor:0];
      }
    }
  }
}

- (BOOL)canSelectItem:(id)a3
{
  return 1;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUItemModuleController *)self module];
  v6 = [v5 bridgesItem];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    id v8 = [(HUItemModuleController *)self module];
    id v9 = [v8 home];
    uint64_t v10 = +[HomeHubsAndBridgesHelper createHomeHubsAndBridgesListViewHostingControllerWithHome:v9];
  }
  else
  {
    v11 = [(HUItemModuleController *)self module];
    v12 = [v11 networkRoutersListItem];
    int v13 = [v4 isEqual:v12];

    if (v13)
    {
      id v14 = HUNetworkRouterSettingsViewController;
    }
    else
    {
      int v15 = [(HUItemModuleController *)self module];
      id v16 = [v15 speakerSettingsItem];
      int v17 = [v4 isEqual:v16];

      if (!v17)
      {
        v24 = [(HUItemModuleController *)self module];
        v19 = [v24 topicForItem:v4];

        id v25 = [(HUUserNotificationTopicListModuleController *)self presentNotificationSettingsForTopic:v19 animated:1];
        goto LABEL_9;
      }
      id v14 = HUMediaAccessControlEditorTableViewController;
    }
    id v18 = [v14 alloc];
    id v8 = [(HUItemModuleController *)self module];
    id v9 = [v8 home];
    uint64_t v10 = [v18 initWithHome:v9];
  }
  v19 = (void *)v10;

  v20 = +[HUViewControllerPresentationRequest requestWithViewController:v19];
  [v20 setPreferredPresentationType:1];
  v21 = [(HUItemModuleController *)self host];
  id v22 = (id)[v21 moduleController:self presentViewControllerForRequest:v20];

LABEL_9:
  return 0;
}

- (id)presentNotificationSettingsForTopic:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [v6 serviceTypes];
  int v8 = [v7 containsObject:*MEMORY[0x1E4F2DE88]];

  if (v8)
  {
    id v9 = [(HUUserNotificationTopicListModuleController *)self pinCodeManager];

    uint64_t v10 = [HULockCategorySettingsViewController alloc];
    if (v9)
    {
      v11 = [(HUUserNotificationTopicListModuleController *)self pinCodeManager];
      v12 = [(HUItemModuleController *)self module];
      int v13 = [v12 home];
      id v14 = [(HULockCategorySettingsViewController *)v10 initWithLockTopic:v6 pinCodeManager:v11 home:v13];

      goto LABEL_7;
    }
    v11 = [(HUItemModuleController *)self module];
    v12 = [v11 home];
    uint64_t v16 = [(HULockCategorySettingsViewController *)v10 initWithLockTopic:v6 home:v12];
  }
  else
  {
    int v15 = [HUUserNotificationTopicServiceListViewController alloc];
    v11 = [(HUItemModuleController *)self module];
    v12 = [v11 home];
    uint64_t v16 = [(HUUserNotificationTopicServiceListViewController *)v15 initWithHome:v12 topic:v6];
  }
  id v14 = (HULockCategorySettingsViewController *)v16;
LABEL_7:

  int v17 = +[HUViewControllerPresentationRequest requestWithViewController:v14];
  [v17 setPreferredPresentationType:1];
  [v17 setAnimated:v4];
  id v18 = [(HUItemModuleController *)self host];
  v19 = [v18 moduleController:self presentViewControllerForRequest:v17];

  return v19;
}

- (id)showNotificationSettingsForHomeKitObject:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(HUItemModuleController *)self module];
  int v8 = [v7 home];
  id v9 = objc_msgSend(v8, "hf_userNotificationTopicForObject:", v6);

  uint64_t v10 = [(HUUserNotificationTopicListModuleController *)self presentNotificationSettingsForTopic:v9 animated:v4];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__HUUserNotificationTopicListModuleController_showNotificationSettingsForHomeKitObject_animated___block_invoke;
  v14[3] = &unk_1E638D9D0;
  id v15 = v6;
  BOOL v16 = v4;
  id v11 = v6;
  v12 = [v10 flatMap:v14];

  return v12;
}

uint64_t __97__HUUserNotificationTopicListModuleController_showNotificationSettingsForHomeKitObject_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 showNotificationSettingsForHomeKitObject:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 40)];
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end