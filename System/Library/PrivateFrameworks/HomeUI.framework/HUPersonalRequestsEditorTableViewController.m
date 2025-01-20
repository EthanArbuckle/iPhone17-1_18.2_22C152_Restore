@interface HUPersonalRequestsEditorTableViewController
- (BOOL)automaticallyUpdatesViewControllerTitle;
- (BOOL)onlyShowDeviceSwitches;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUPersonalRequestsDevicesModuleController)prDevicesModuleController;
- (HUPersonalRequestsEditorItemManager)prEditorItemManager;
- (HUPersonalRequestsEditorTableViewController)initWithAccessoryGroupItem:(id)a3;
- (HUPersonalRequestsEditorTableViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4;
- (HUPersonalRequestsEditorTableViewController)initWithUserItem:(id)a3 onlyShowDeviceSwitches:(BOOL)a4;
- (HUPersonalRequestsEditorTableViewController)initWithUserItem:(id)a3 sourceMediaProfileContainer:(id)a4 onlyShowDeviceSwitches:(BOOL)a5;
- (id)itemModuleControllers;
- (void)setOnlyShowDeviceSwitches:(BOOL)a3;
- (void)setPrEditorItemManager:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
@end

@implementation HUPersonalRequestsEditorTableViewController

- (HUPersonalRequestsEditorTableViewController)initWithUserItem:(id)a3 onlyShowDeviceSwitches:(BOOL)a4
{
  return [(HUPersonalRequestsEditorTableViewController *)self initWithUserItem:a3 sourceMediaProfileContainer:0 onlyShowDeviceSwitches:a4];
}

- (HUPersonalRequestsEditorTableViewController)initWithUserItem:(id)a3 sourceMediaProfileContainer:(id)a4 onlyShowDeviceSwitches:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[HUPersonalRequestsEditorItemManager alloc] initWithDelegate:self userItem:v10 onlyShowDeviceSwitches:v5];

  v12 = [(HUPersonalRequestsEditorItemManager *)v11 prDevicesModule];
  [v12 setSourceMediaProfileContainer:v9];

  v24.receiver = self;
  v24.super_class = (Class)HUPersonalRequestsEditorTableViewController;
  v13 = [(HUItemTableViewController *)&v24 initWithItemManager:v11 tableViewStyle:1];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_prEditorItemManager, v11);
    v15 = [HUPersonalRequestsDevicesModuleController alloc];
    v16 = [(HUPersonalRequestsEditorItemManager *)v11 prDevicesModule];
    uint64_t v17 = [(HUPersonalRequestsDevicesModuleController *)v15 initWithModule:v16 host:v14];
    prDevicesModuleController = v14->_prDevicesModuleController;
    v14->_prDevicesModuleController = (HUPersonalRequestsDevicesModuleController *)v17;

    v19 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequests", @"HUUsersPersonalRequests", 1);
    [(HUPersonalRequestsEditorTableViewController *)v14 setTitle:v19];

    v14->_onlyShowDeviceSwitches = v5;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __115__HUPersonalRequestsEditorTableViewController_initWithUserItem_sourceMediaProfileContainer_onlyShowDeviceSwitches___block_invoke;
    v21[3] = &unk_1E6389E78;
    SEL v23 = a2;
    v22 = v14;
    +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguagesWithCompletion:v21];
  }
  return v14;
}

void __115__HUPersonalRequestsEditorTableViewController_initWithUserItem_sourceMediaProfileContainer_onlyShowDeviceSwitches___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v14 = 138412802;
    v15 = v13;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_debug_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEBUG, "%@ fetchSupportedVoiceRecognitionLanguagesWithCompletion returned (%@) %@", (uint8_t *)&v14, 0x20u);
  }
  if (!v6)
  {
    v8 = [*(id *)(a1 + 32) prEditorItemManager];
    id v9 = [v8 prDevicesModule];
    [v9 setSupportedMULanguageCodes:v5];

    id v10 = [*(id *)(a1 + 32) prEditorItemManager];
    id v11 = (id)[v10 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 40)];

    v12 = [*(id *)(a1 + 32) tableView];
    [v12 reloadData];
  }
}

- (HUPersonalRequestsEditorTableViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v7 = a4;
  v8 = (objc_class *)MEMORY[0x1E4F69710];
  id v9 = a3;
  id v10 = [v8 alloc];
  id v11 = [v7 home];
  v12 = [v7 home];
  v13 = [v12 currentUser];
  int v14 = (void *)[v10 initWithHome:v11 user:v13 nameStyle:1];

  v15 = [v7 sourceItem];
  __int16 v16 = [v15 accessories];
  id v17 = [v16 anyObject];

  __int16 v18 = [v17 mediaProfile];
  id v19 = &unk_1F1AD86A8;
  id v20 = v18;
  v21 = v20;
  if (v20)
  {
    if ([v20 conformsToProtocol:v19]) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
    SEL v23 = v21;
    if (v22) {
      goto LABEL_8;
    }
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v24 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v25 = NSStringFromProtocol((Protocol *)v19);
    [v36 handleFailureInFunction:v24, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v25 file lineNumber description];
  }
  SEL v23 = 0;
LABEL_8:

  v26 = [[HUPersonalRequestsEditorItemManager alloc] initWithDelegate:self userItem:v14 accessorySettingItem:v9 module:v7 onlyShowDeviceSwitches:0];
  v27 = [(HUPersonalRequestsEditorItemManager *)v26 prDevicesModule];
  [v27 setSourceMediaProfileContainer:v23];

  v40.receiver = self;
  v40.super_class = (Class)HUPersonalRequestsEditorTableViewController;
  v28 = [(HUItemTableViewController *)&v40 initWithItemManager:v26 tableViewStyle:1];
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_prEditorItemManager, v26);
    v30 = [HUPersonalRequestsDevicesModuleController alloc];
    v31 = [(HUPersonalRequestsEditorItemManager *)v26 prDevicesModule];
    uint64_t v32 = [(HUPersonalRequestsDevicesModuleController *)v30 initWithModule:v31 host:v29];
    prDevicesModuleController = v29->_prDevicesModuleController;
    v29->_prDevicesModuleController = (HUPersonalRequestsDevicesModuleController *)v32;

    v34 = _HULocalizedStringWithDefaultValue(@"HUUsersPersonalRequests", @"HUUsersPersonalRequests", 1);
    [(HUPersonalRequestsEditorTableViewController *)v29 setTitle:v34];

    v29->_onlyShowDeviceSwitches = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __83__HUPersonalRequestsEditorTableViewController_initWithAccessorySettingItem_module___block_invoke;
    v37[3] = &unk_1E6389E78;
    SEL v39 = a2;
    v38 = v29;
    +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguagesWithCompletion:v37];
  }
  return v29;
}

void __83__HUPersonalRequestsEditorTableViewController_initWithAccessorySettingItem_module___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v14 = 138412802;
    v15 = v13;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_debug_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEBUG, "%@ fetchSupportedVoiceRecognitionLanguagesWithCompletion returned (%@) %@", (uint8_t *)&v14, 0x20u);
  }
  if (!v6)
  {
    v8 = [*(id *)(a1 + 32) prEditorItemManager];
    id v9 = [v8 prDevicesModule];
    [v9 setSupportedMULanguageCodes:v5];

    id v10 = [*(id *)(a1 + 32) prEditorItemManager];
    id v11 = (id)[v10 reloadAndUpdateAllItemsFromSenderSelector:*(void *)(a1 + 40)];

    v12 = [*(id *)(a1 + 32) tableView];
    [v12 reloadData];
  }
}

- (BOOL)automaticallyUpdatesViewControllerTitle
{
  return 0;
}

- (id)itemModuleControllers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(HUPersonalRequestsEditorTableViewController *)self prDevicesModuleController];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(HUPersonalRequestsEditorTableViewController *)self prEditorItemManager];
  id v7 = [v6 activityNotificationsItem];
  int v8 = [v5 isEqual:v7];

  if (v8)
  {
    id v9 = objc_opt_class();
  }
  else
  {
    id v9 = 0;
  }

  return (Class)v9;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HUPersonalRequestsEditorTableViewController;
  id v9 = a4;
  [(HUItemTableViewController *)&v16 setupCell:v8 forItem:v9 indexPath:a5];
  id v10 = [(HUPersonalRequestsEditorTableViewController *)self prEditorItemManager];
  id v11 = [v10 activityNotificationsItem];
  int v12 = [v9 isEqual:v11];

  if (v12)
  {
    objc_opt_class();
    id v13 = v8;
    if (objc_opt_isKindOfClass()) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    id v15 = v14;

    [v15 setDelegate:self];
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [MEMORY[0x1E4F69378] sharedInstance];
  id v10 = (id)[v9 openURL:v7];

  return 0;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    id v10 = "-[HUPersonalRequestsEditorTableViewController switchCell:didTurnOn:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "(%s) User tapped switch cell: %@ to turn %{BOOL}d", (uint8_t *)&v9, 0x1Cu);
  }

  id v8 = [(HUPersonalRequestsEditorTableViewController *)self prEditorItemManager];
  [v8 setActivityNotificationsEnabled:v4];
}

- (HUPersonalRequestsEditorItemManager)prEditorItemManager
{
  return self->_prEditorItemManager;
}

- (void)setPrEditorItemManager:(id)a3
{
}

- (HUPersonalRequestsDevicesModuleController)prDevicesModuleController
{
  return self->_prDevicesModuleController;
}

- (BOOL)onlyShowDeviceSwitches
{
  return self->_onlyShowDeviceSwitches;
}

- (void)setOnlyShowDeviceSwitches:(BOOL)a3
{
  self->_onlyShowDeviceSwitches = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prDevicesModuleController, 0);

  objc_storeStrong((id *)&self->_prEditorItemManager, 0);
}

- (HUPersonalRequestsEditorTableViewController)initWithAccessoryGroupItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 homeKitSettingsVendor];
  id v6 = objc_msgSend(v5, "hf_home");

  id v7 = objc_alloc(MEMORY[0x1E4F69710]);
  id v8 = [v6 currentUser];
  int v9 = (void *)[v7 initWithHome:v6 user:v8 nameStyle:1];

  id v10 = [v4 homeKitSettingsVendor];

  __int16 v11 = [v10 homeKitObject];
  id v12 = &unk_1F1AD86A8;
  id v13 = v11;
  BOOL v14 = v13;
  if (!v13) {
    goto LABEL_7;
  }
  if ([v13 conformsToProtocol:v12]) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = v14;
  if (!v15)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v18 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    id v19 = NSStringFromProtocol((Protocol *)v12);
    [v17 handleFailureInFunction:v18, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v19 file lineNumber description];

LABEL_7:
    uint64_t v16 = 0;
  }

  if (!v16)
  {
    uint64_t v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE345000, v20, OS_LOG_TYPE_ERROR, "-[HUPersonalRequestsEditorTableViewController initWithAccessoryGroupItem:] called without a HFMediaProfileContainer", buf, 2u);
    }
  }
  v21 = [(HUPersonalRequestsEditorTableViewController *)self initWithUserItem:v9 sourceMediaProfileContainer:v16 onlyShowDeviceSwitches:0];

  return v21;
}

@end