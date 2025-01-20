@interface HUUserNotificationTopicServiceListViewController
- (BOOL)_shouldShowFaceRecognition;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HFUserNotificationServiceTopic)topic;
- (HMHome)home;
- (HUAnnounceSettingsItemModuleController)announceSettingsModuleController;
- (HUEnergySettingsItemModuleController)energySettingsModuleController;
- (HUFaceRecognitionItemModuleController)faceRecognitionModuleController;
- (HUSafetyAndSecuritySettingsItemModuleController)safetyAndSecuritySettingsItemModuleController;
- (HUUserNotificationTopicServiceListModuleController)moduleController;
- (HUUserNotificationTopicServiceListViewController)initWithHome:(id)a3 topic:(id)a4;
- (HUUserNotificationTopicServiceListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (id)buildItemModuleControllerForModule:(id)a3;
- (id)buildSwiftItemModuleControllerForModule:(id)a3;
- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4;
- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5;
- (id)showNotificationSettingsForHomeKitObject:(id)a3 animated:(BOOL)a4;
- (void)dismissToHomeSettings;
- (void)presentHH2OnboardingForHome:(id)a3 withDevices:(id)a4;
- (void)setAnnounceSettingsModuleController:(id)a3;
- (void)setEnergySettingsModuleController:(id)a3;
- (void)setFaceRecognitionModuleController:(id)a3;
- (void)setModuleController:(id)a3;
- (void)setSafetyAndSecuritySettingsItemModuleController:(id)a3;
@end

@implementation HUUserNotificationTopicServiceListViewController

- (id)buildSwiftItemModuleControllerForModule:(id)a3
{
  type metadata accessor for ActivityLogItemModule();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = a3;
  v7 = self;
  unsigned int v8 = objc_msgSend(v6, sel_isKindOfClass_, ObjCClassFromMetadata);
  id v9 = 0;
  if (v8) {
    id v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ActivityLogSettingsModuleController()), sel_initWithModule_, v6);
  }

  return v9;
}

- (HUUserNotificationTopicServiceListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_topic_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUUserNotificationTopicServiceListViewController.m", 45, @"%s is unavailable; use %@ instead",
    "-[HUUserNotificationTopicServiceListViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUUserNotificationTopicServiceListViewController)initWithHome:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_topic, a4);
  objc_initWeak(&location, self);
  unsigned int v8 = (void *)[objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:self];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__HUUserNotificationTopicServiceListViewController_initWithHome_topic___block_invoke;
  v19[3] = &unk_1E6385000;
  id v9 = v6;
  id v20 = v9;
  [v8 setHomeCreator:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__HUUserNotificationTopicServiceListViewController_initWithHome_topic___block_invoke_2;
  v16[3] = &unk_1E6386C28;
  objc_copyWeak(&v18, &location);
  id v10 = v7;
  id v17 = v10;
  [v8 setItemModuleCreator:v16];
  v11 = [MEMORY[0x1E4F695D8] policyWithDecision:0];
  [v8 setReadPolicy:v11];

  v15.receiver = self;
  v15.super_class = (Class)HUUserNotificationTopicServiceListViewController;
  v12 = [(HUItemTableViewController *)&v15 initWithItemManager:v8 tableViewStyle:1];
  if (v12)
  {
    v13 = [v10 topicName];
    [(HUUserNotificationTopicServiceListViewController *)v12 setTitle:v13];
  }
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v12;
}

uint64_t __71__HUUserNotificationTopicServiceListViewController_initWithHome_topic___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

id __71__HUUserNotificationTopicServiceListViewController_initWithHome_topic___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
  id v9 = [[HUUserNotificationTopicServiceListModule alloc] initWithItemUpdater:v6 home:v5 topic:*(void *)(a1 + 32)];
  [v8 addObject:v9];
  if ([WeakRetained _shouldShowFaceRecognition])
  {
    id v10 = [[HUFaceRecognitionItemModule alloc] initWithItemUpdater:v6 home:v5];
    [v8 addObject:v10];
  }
  if (objc_msgSend(v5, "hf_shouldShowActivityLogSetting"))
  {
    v11 = [WeakRetained topic];
    v12 = [v11 topicName];
    v13 = HFLocalizedString();
    int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      objc_super v15 = [[HUActivityLogItemModule alloc] initWithHome:v5 itemUpdater:v6];
      [v8 addObject:v15];
    }
  }
  if (objc_msgSend(v5, "hf_shouldShowAnnounceFeatureForThisHome"))
  {
    v16 = [*(id *)(a1 + 32) accessoryCategoryTypes];
    if (![(HUAnnounceSettingsItemModule *)v16 containsObject:*MEMORY[0x1E4F2C1D0]])
    {
LABEL_10:

      goto LABEL_11;
    }
    id v17 = [WeakRetained topic];
    id v18 = [v17 topicName];
    v19 = HFLocalizedString();
    int v20 = [v18 isEqualToString:v19];

    if (v20)
    {
      v16 = [[HUAnnounceSettingsItemModule alloc] initWithItemUpdater:v6 home:v5 settingsContext:1];
      [v8 addObject:v16];
      goto LABEL_10;
    }
  }
LABEL_11:
  if (objc_msgSend(v5, "hf_canUpdateToHH2") && (objc_msgSend(v5, "hf_hasHomePods") & 1) != 0
    || objc_msgSend(v5, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory"))
  {
    v21 = [WeakRetained topic];
    v22 = [v21 topicName];
    v23 = HFLocalizedString();
    int v24 = [v22 isEqualToString:v23];

    if (v24)
    {
      v25 = [[HUSafetyAndSecuritySettingsItemModule alloc] initWithItemUpdater:v6 home:v5];
      [v8 addObject:v25];
    }
  }
  v26 = [WeakRetained topic];
  v27 = [v26 topicName];
  v28 = HFLocalizedString();
  int v29 = [v27 isEqualToString:v28];

  if (v29)
  {
    v30 = [[HUEnergySettingsItemModule alloc] initWithItemUpdater:v6 home:v5];
    [v8 addObject:v30];
  }

  return v8;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(HUItemModuleController *)[HUFaceRecognitionItemModuleController alloc] initWithModule:v4];
    [(HUUserNotificationTopicServiceListViewController *)self setFaceRecognitionModuleController:v5];

    uint64_t v6 = [(HUUserNotificationTopicServiceListViewController *)self faceRecognitionModuleController];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(HUItemModuleController *)[HUAnnounceSettingsItemModuleController alloc] initWithModule:v4];
      [(HUUserNotificationTopicServiceListViewController *)self setAnnounceSettingsModuleController:v7];

      uint64_t v6 = [(HUUserNotificationTopicServiceListViewController *)self announceSettingsModuleController];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v8 = [[HUSafetyAndSecuritySettingsItemModuleController alloc] initWithModule:v4 delegate:self];
        [(HUUserNotificationTopicServiceListViewController *)self setSafetyAndSecuritySettingsItemModuleController:v8];

        uint64_t v6 = [(HUUserNotificationTopicServiceListViewController *)self safetyAndSecuritySettingsItemModuleController];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = [(HUItemModuleController *)[HUEnergySettingsItemModuleController alloc] initWithModule:v4];
          [(HUUserNotificationTopicServiceListViewController *)self setEnergySettingsModuleController:v9];

          uint64_t v6 = [(HUUserNotificationTopicServiceListViewController *)self energySettingsModuleController];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v6 = [(HUUserNotificationTopicServiceListViewController *)self buildSwiftItemModuleControllerForModule:v4];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              NSLog(&cfstr_UnexpectedModu.isa, v4);
            }
            id v10 = [(HUItemModuleController *)[HUUserNotificationTopicServiceListModuleController alloc] initWithModule:v4];
            [(HUUserNotificationTopicServiceListViewController *)self setModuleController:v10];

            uint64_t v6 = [(HUUserNotificationTopicServiceListViewController *)self moduleController];
          }
        }
      }
    }
  }
  v11 = (void *)v6;

  return v11;
}

- (id)showNotificationSettingsForHomeKitObject:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__HUUserNotificationTopicServiceListViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke;
  v17[3] = &unk_1E6386C50;
  v17[4] = self;
  id v18 = v6;
  id v7 = v6;
  unsigned int v8 = __102__HUUserNotificationTopicServiceListViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke((uint64_t)v17);
  id v9 = [(HUItemTableViewController *)self hu_preloadContent];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __102__HUUserNotificationTopicServiceListViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke_2;
  v13[3] = &unk_1E63853B8;
  id v14 = v8;
  objc_super v15 = self;
  BOOL v16 = a4;
  id v10 = v8;
  v11 = [v9 flatMap:v13];

  return v11;
}

id __102__HUUserNotificationTopicServiceListViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) itemManager];
  v3 = [v2 home];
  id v4 = objc_msgSend(v3, "hf_characteristicValueManager");

  objc_opt_class();
  id v5 = *(id *)(a1 + 40);
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    unsigned int v8 = [MEMORY[0x1E4F69550] serviceItemForService:v7 valueSource:v4];
  }
  else
  {
    objc_opt_class();
    id v9 = *(id *)(a1 + 40);
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      unsigned int v8 = (void *)[objc_alloc(MEMORY[0x1E4F68F98]) initWithProfile:v11 valueSource:v4];
    }
    else
    {
      NSLog(&cfstr_UnexpectedObje.isa, *(void *)(a1 + 40));
      unsigned int v8 = 0;
    }
  }

  return v8;
}

id __102__HUUserNotificationTopicServiceListViewController_showNotificationSettingsForHomeKitObject_animated___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) moduleController];
    v3 = [v2 showNotificationSettingsForServiceLikeItem:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
  }
  else
  {
    v3 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v3;
}

- (void)presentHH2OnboardingForHome:(id)a3 withDevices:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    v12 = "-[HUUserNotificationTopicServiceListViewController presentHH2OnboardingForHome:withDevices:]";
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%s Now starting HH2 onboarding...", (uint8_t *)&v11, 0xCu);
  }

  id v9 = +[HUHomeFeatureOnboardingUtilities home:v7 onboardHomeHub2FromPresentingViewController:self devices:v6 usageOptions:0];

  id v10 = (id)[v9 flatMap:&__block_literal_global_29];
}

uint64_t __92__HUUserNotificationTopicServiceListViewController_presentHH2OnboardingForHome_withDevices___block_invoke()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)dismissToHomeSettings
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HUUserNotificationTopicServiceListViewController *)self parentViewController];
    int v9 = 136315394;
    id v10 = "-[HUUserNotificationTopicServiceListViewController dismissToHomeSettings]";
    __int16 v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%s Dismissing to Home Settings ... using navController = %@", (uint8_t *)&v9, 0x16u);
  }
  objc_opt_class();
  id v5 = [(HUUserNotificationTopicServiceListViewController *)self parentViewController];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = (id)[v7 popViewControllerAnimated:1];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v12, 0x16u);
  }

  int v9 = [MEMORY[0x1E4F69378] sharedInstance];
  id v10 = (id)[v9 openURL:v7];

  return 0;
}

- (id)presentFaceRecognitionPersonSettingsForPerson:(id)a3 personManager:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(HUUserNotificationTopicServiceListViewController *)self _shouldShowFaceRecognition])
  {
    id v10 = [(HUItemTableViewController *)self hu_preloadContent];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __121__HUUserNotificationTopicServiceListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke;
    v15[3] = &unk_1E6386C98;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    BOOL v18 = a5;
    __int16 v11 = [v10 flatMap:v15];
  }
  else
  {
    int v12 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    __int16 v11 = [v12 futureWithError:v13];
  }

  return v11;
}

id __121__HUUserNotificationTopicServiceListViewController_presentFaceRecognitionPersonSettingsForPerson_personManager_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) faceRecognitionModuleController];
  v3 = [v2 presentFaceRecognitionPersonSettingsForPerson:*(void *)(a1 + 40) personManager:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 56)];

  return v3;
}

- (id)presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  if ([(HUUserNotificationTopicServiceListViewController *)self _shouldShowFaceRecognition])
  {
    id v7 = [(HUItemTableViewController *)self hu_preloadContent];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __122__HUUserNotificationTopicServiceListViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke;
    v12[3] = &unk_1E63853B8;
    v12[4] = self;
    id v13 = v6;
    BOOL v14 = a4;
    id v8 = [v7 flatMap:v12];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F7A0D8];
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    id v8 = [v9 futureWithError:v10];
  }

  return v8;
}

id __122__HUUserNotificationTopicServiceListViewController_presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) faceRecognitionModuleController];
  v3 = [v2 presentFaceRecognitionAddPersonSettingsForUnknownPersonEvent:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];

  return v3;
}

- (BOOL)_shouldShowFaceRecognition
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(HUItemTableViewController *)self itemManager];
  id v4 = [v3 home];

  id v5 = [(HUUserNotificationTopicServiceListViewController *)self topic];
  id v6 = [MEMORY[0x1E4F69730] _cameraTopic];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    int v8 = objc_msgSend(v4, "hf_isFaceRecognitionAvailable");
    if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
      char v9 = 1;
    }
    else {
      char v9 = [MEMORY[0x1E4F69758] isRunningInStoreDemoMode];
    }
    __int16 v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v8) {
        int v12 = @"Showing";
      }
      else {
        int v12 = @"Not showing";
      }
      id v13 = [(HUUserNotificationTopicServiceListViewController *)self topic];
      int v15 = 138412546;
      id v16 = v12;
      __int16 v17 = 2112;
      BOOL v18 = v13;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@ face recognition settings for topic %@", (uint8_t *)&v15, 0x16u);
    }
    char v10 = v8 | v9;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserNotificationServiceTopic)topic
{
  return self->_topic;
}

- (HUUserNotificationTopicServiceListModuleController)moduleController
{
  return self->_moduleController;
}

- (void)setModuleController:(id)a3
{
}

- (HUAnnounceSettingsItemModuleController)announceSettingsModuleController
{
  return self->_announceSettingsModuleController;
}

- (void)setAnnounceSettingsModuleController:(id)a3
{
}

- (HUSafetyAndSecuritySettingsItemModuleController)safetyAndSecuritySettingsItemModuleController
{
  return self->_safetyAndSecuritySettingsItemModuleController;
}

- (void)setSafetyAndSecuritySettingsItemModuleController:(id)a3
{
}

- (HUFaceRecognitionItemModuleController)faceRecognitionModuleController
{
  return self->_faceRecognitionModuleController;
}

- (void)setFaceRecognitionModuleController:(id)a3
{
}

- (HUEnergySettingsItemModuleController)energySettingsModuleController
{
  return self->_energySettingsModuleController;
}

- (void)setEnergySettingsModuleController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energySettingsModuleController, 0);
  objc_storeStrong((id *)&self->_faceRecognitionModuleController, 0);
  objc_storeStrong((id *)&self->_safetyAndSecuritySettingsItemModuleController, 0);
  objc_storeStrong((id *)&self->_announceSettingsModuleController, 0);
  objc_storeStrong((id *)&self->_moduleController, 0);
  objc_storeStrong((id *)&self->_topic, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end