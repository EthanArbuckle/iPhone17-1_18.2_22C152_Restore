@interface HUCameraSmartNotificationSettingsModuleController
+ (BOOL)shouldDisplayAlertForItem:(id)a3 withSmartDetectionModule:(id)a4 forProfile:(id)a5;
- (BOOL)canEnableNotificationForItem:(id)a3;
- (BOOL)isItemHeader:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUCameraSmartNotificationSettingsModuleController)initWithModule:(id)a3;
- (HUCameraSmartNotificationSettingsModuleControllerDelegate)delegate;
- (id)alertMessageForEventType:(unint64_t)a3;
- (id)alertTitleForEventType:(unint64_t)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)displayAlertForItemCell:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
- (void)updateNotificationSettingForItem:(id)a3;
@end

@implementation HUCameraSmartNotificationSettingsModuleController

- (HUCameraSmartNotificationSettingsModuleController)initWithModule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (!v6) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  v8 = v6;
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];

LABEL_7:
    v8 = 0;
  }

  v11 = &unk_1F19F7700;
  id v12 = v6;
  v13 = v12;
  if (v6)
  {
    if ([v12 conformsToProtocol:v11]) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v6 = v13;
    if (!v14)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v18 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
      v19 = NSStringFromProtocol((Protocol *)v11);
      [v17 handleFailureInFunction:v18, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v19 file lineNumber description];

      id v6 = 0;
    }
  }

  v20.receiver = self;
  v20.super_class = (Class)HUCameraSmartNotificationSettingsModuleController;
  v15 = [(HUItemModuleController *)&v20 initWithModule:v13];

  return v15;
}

- (BOOL)isItemHeader:(id)a3
{
  return 0;
}

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUItemModuleController *)self module];
  char v6 = [v5 isItemHeader:v4];

  if ((v6 & 1) == 0)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  v7 = objc_opt_class();

  return (Class)v7;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUCameraSmartNotificationSettingsModuleController;
  [(HUItemModuleController *)&v22 setupCell:v6 forItem:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setValueColorFollowsTintColor:1];
  }
  v8 = [v7 latestResults];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];

  if (v9)
  {
    objc_opt_class();
    id v10 = v6;
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    v13 = [v12 imageView];
    [v13 setContentMode:5];

    objc_msgSend(v12, "setImageViewRecommendedSize:", 50.0, 50.0);
  }
  v14 = [(HUItemModuleController *)self module];
  char v15 = [v14 isItemHeader:v7];

  if ((v15 & 1) == 0)
  {
    objc_opt_class();
    id v16 = v6;
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    [v18 setHideIcon:1];
  }
  objc_opt_class();
  id v19 = v6;
  if (objc_opt_isKindOfClass()) {
    objc_super v20 = v19;
  }
  else {
    objc_super v20 = 0;
  }
  id v21 = v20;

  if (v21) {
    [v21 setDelegate:self];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)HUCameraSmartNotificationSettingsModuleController;
  id v7 = a4;
  id v8 = a3;
  [(HUItemModuleController *)&v12 updateCell:v8 forItem:v7 animated:v5];
  v9 = objc_msgSend(v7, "latestResults", v12.receiver, v12.super_class);

  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68B40]];
  if ([v10 BOOLValue]) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }
  [v8 setAccessoryType:v11];
}

+ (BOOL)shouldDisplayAlertForItem:(id)a3 withSmartDetectionModule:(id)a4 forProfile:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = objc_msgSend(a5, "hf_cameraIsNotSetToRecord");
  id v10 = [v8 specificMotionDetectedItem];
  if (([v7 isEqual:v10] & 1) == 0)
  {
    uint64_t v11 = [v8 aClipIsRecordedItem];
    v9 &= [v7 isEqual:v11];
  }
  return v9;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [(HUItemModuleController *)self module];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      id v10 = [(HUItemModuleController *)self module];
      id v11 = (id)[v10 didSelectItem:v4];

      objc_super v12 = [(HUCameraSmartNotificationSettingsModuleController *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        v14 = [(HUCameraSmartNotificationSettingsModuleController *)self delegate];
        char v15 = [v7 conditionCollection];
        [v14 smartNotificationSettingsModuleController:self didUpdateConditionCollection:v15];
      }
    }
    else
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__HUCameraSmartNotificationSettingsModuleController_didSelectItem___block_invoke;
      aBlock[3] = &unk_1E6389908;
      objc_copyWeak(&v41, &location);
      id v16 = _Block_copy(aBlock);
      v17 = [v7 cameraProfiles];
      id v18 = [v17 anyObject];
      BOOL v19 = +[HUCameraSmartNotificationSettingsModuleController shouldDisplayAlertForItem:v4 withSmartDetectionModule:v7 forProfile:v18];

      if (v19)
      {
        objc_super v20 = [MEMORY[0x1E4F691A0] sharedDispatcher];
        id v21 = [v20 home];
        if (objc_msgSend(v21, "hf_currentUserIsOwner")) {
          objc_super v22 = @"HUCameraStatusAndNotificationsSmartAlertDescription_Owner";
        }
        else {
          objc_super v22 = @"HUCameraStatusAndNotificationsSmartAlertDescription";
        }
        v23 = _HULocalizedStringWithDefaultValue(v22, v22, 1);

        v24 = (void *)MEMORY[0x1E4F42728];
        v25 = _HULocalizedStringWithDefaultValue(@"HUCameraStatusAndNotificationsSmartAlertTitle", @"HUCameraStatusAndNotificationsSmartAlertTitle", 1);
        v26 = [v24 alertControllerWithTitle:v25 message:v23 preferredStyle:1];

        v27 = (void *)MEMORY[0x1E4F42720];
        v28 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
        uint64_t v34 = MEMORY[0x1E4F143A8];
        uint64_t v35 = 3221225472;
        v36 = __67__HUCameraSmartNotificationSettingsModuleController_didSelectItem___block_invoke_2;
        v37 = &unk_1E6389930;
        id v39 = v16;
        id v38 = v4;
        v29 = [v27 actionWithTitle:v28 style:0 handler:&v34];
        objc_msgSend(v26, "addAction:", v29, v34, v35, v36, v37);

        v30 = +[HUViewControllerPresentationRequest requestWithViewController:v26];
        [v30 setPreferredPresentationType:0];
        v31 = [(HUItemModuleController *)self host];
        id v32 = (id)[v31 moduleController:self presentViewControllerForRequest:v30];
      }
      else
      {
        (*((void (**)(void *, id))v16 + 2))(v16, v4);
      }

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }
  }

  return 0;
}

void __67__HUCameraSmartNotificationSettingsModuleController_didSelectItem___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  id v4 = [WeakRetained module];
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    id v7 = (id)[v6 didSelectItem:v12];
  }
  id v8 = [WeakRetained delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [WeakRetained delegate];
    id v11 = [v6 conditionCollection];
    [v10 smartNotificationSettingsModuleController:WeakRetained didUpdateConditionCollection:v11];
  }
}

uint64_t __67__HUCameraSmartNotificationSettingsModuleController_didSelectItem___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v10 = v6;
  if (v4
    && ([v6 item],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v8 = [(HUCameraSmartNotificationSettingsModuleController *)self canEnableNotificationForItem:v7], v7, id v6 = v10, !v8))
  {
    [v10 setOn:0 animated:1];
    [(HUCameraSmartNotificationSettingsModuleController *)self displayAlertForItemCell:v10];
  }
  else
  {
    char v9 = [v6 item];
    [(HUCameraSmartNotificationSettingsModuleController *)self updateNotificationSettingForItem:v9];
  }
}

- (void)updateNotificationSettingForItem:(id)a3
{
  id v18 = a3;
  objc_opt_class();
  BOOL v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = (id)[v7 updateMotionDetectionSettingForItem:v18];
  char v9 = [(HUCameraSmartNotificationSettingsModuleController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(HUCameraSmartNotificationSettingsModuleController *)self delegate];
    id v12 = [v7 conditionCollection];
    [v11 smartNotificationSettingsModuleController:self didUpdateConditionCollection:v12];
  }
  char v13 = [v7 itemUpdater];
  v14 = (void *)MEMORY[0x1E4F69230];
  char v15 = [v7 itemProviders];
  id v16 = [v14 requestToReloadItemProviders:v15 senderSelector:a2];
  id v17 = (id)[v13 performItemUpdateRequest:v16];
}

- (BOOL)canEnableNotificationForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  id v8 = [v4 latestResults];

  char v9 = [v8 objectForKeyedSubscript:@"HUCameraSettingResultKey"];
  if (objc_opt_isKindOfClass()) {
    char v10 = v9;
  }
  else {
    char v10 = 0;
  }
  id v11 = v10;

  id v12 = [v7 cameraProfiles];
  char v13 = [v12 anyObject];
  v14 = [v13 userSettings];
  uint64_t v15 = [v14 recordingEventTriggers];
  LOBYTE(v15) = ([v11 eventTypes] & v15) != 0;

  return v15;
}

- (void)displayAlertForItemCell:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 item];
  objc_opt_class();
  id v6 = [v5 latestResults];
  id v7 = [v6 objectForKeyedSubscript:@"HUCameraSettingResultKey"];
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  char v10 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v11 = [v10 home];
  if (objc_msgSend(v11, "hf_currentUserIsOwner")) {
    -[HUCameraSmartNotificationSettingsModuleController alertMessageForEventType:](self, "alertMessageForEventType:", [v9 eventTypes]);
  }
  else {
  id v12 = _HULocalizedStringWithDefaultValue(@"HUCameraStatusAndNotificationsSmartAlertDescription", @"HUCameraStatusAndNotificationsSmartAlertDescription", 1);
  }

  char v13 = (void *)MEMORY[0x1E4F42728];
  v14 = -[HUCameraSmartNotificationSettingsModuleController alertTitleForEventType:](self, "alertTitleForEventType:", [v9 eventTypes]);
  uint64_t v15 = [v13 alertControllerWithTitle:v14 message:v12 preferredStyle:1];

  objc_initWeak(&location, self);
  id v16 = (void *)MEMORY[0x1E4F42720];
  id v17 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __77__HUCameraSmartNotificationSettingsModuleController_displayAlertForItemCell___block_invoke;
  v28[3] = &unk_1E6389980;
  objc_copyWeak(&v32, &location);
  id v18 = v9;
  id v29 = v18;
  id v19 = v4;
  id v30 = v19;
  id v20 = v5;
  id v31 = v20;
  id v21 = [v16 actionWithTitle:v17 style:0 handler:v28];
  [v15 addAction:v21];

  objc_super v22 = (void *)MEMORY[0x1E4F42720];
  v23 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  v24 = [v22 actionWithTitle:v23 style:0 handler:&__block_literal_global_80];
  [v15 addAction:v24];

  v25 = +[HUViewControllerPresentationRequest requestWithViewController:v15];
  [v25 setPreferredPresentationType:0];
  v26 = [(HUItemModuleController *)self host];
  id v27 = (id)[v26 moduleController:self presentViewControllerForRequest:v25];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __77__HUCameraSmartNotificationSettingsModuleController_displayAlertForItemCell___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_opt_class();
  v3 = [WeakRetained module];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = (void *)MEMORY[0x1E4F68FD8];
  id v7 = [v5 cameraProfiles];
  id v8 = [v6 configurationForCameraProfilesRecordingSettings:v7];

  [v8 addConfiguration:*(void *)(a1 + 32)];
  if ([v8 eventTypes]) {
    objc_msgSend(v8, "setEventTypes:", objc_msgSend(v8, "eventTypes") ^ 1);
  }
  id v9 = [v5 cameraProfiles];
  char v10 = [v9 anyObject];

  id v11 = [v10 userSettings];
  uint64_t v12 = [v8 eventTypes];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__HUCameraSmartNotificationSettingsModuleController_displayAlertForItemCell___block_invoke_2;
  v15[3] = &unk_1E6389958;
  id v16 = v8;
  id v17 = v10;
  id v18 = *(id *)(a1 + 40);
  id v19 = WeakRetained;
  id v20 = *(id *)(a1 + 48);
  id v13 = v8;
  id v14 = v10;
  [v11 updateRecordingEventTriggers:v12 completionHandler:v15];
}

void __77__HUCameraSmartNotificationSettingsModuleController_displayAlertForItemCell___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 32) eventTypes];
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 134218498;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Error updating smart motion recording eventTypes: %lu for camera: %@ (error: %@)", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 48) setOn:1 animated:1];
    [*(id *)(a1 + 56) updateNotificationSettingForItem:*(void *)(a1 + 64)];
  }
}

- (id)alertTitleForEventType:(unint64_t)a3
{
  *((void *)&v3 + 1) = a3;
  *(void *)&long long v3 = a3 - 2;
  id v4 = &stru_1F18F92B8;
  switch((unint64_t)(v3 >> 1))
  {
    case 0uLL:
      uint64_t v5 = @"HUCameraStatusAndNotificationsSmartAlertPeopleTitle";
      goto LABEL_6;
    case 1uLL:
      uint64_t v5 = @"HUCameraStatusAndNotificationsSmartAlertAnimalsTitle";
      goto LABEL_6;
    case 3uLL:
      uint64_t v5 = @"HUCameraStatusAndNotificationsSmartAlertVehiclesTitle";
      goto LABEL_6;
    case 7uLL:
      uint64_t v5 = @"HUCameraStatusAndNotificationsSmartAlertPackagesTitle";
LABEL_6:
      _HULocalizedStringWithDefaultValue(v5, v5, 1);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v4;
}

- (id)alertMessageForEventType:(unint64_t)a3
{
  *((void *)&v3 + 1) = a3;
  *(void *)&long long v3 = a3 - 2;
  id v4 = &stru_1F18F92B8;
  switch((unint64_t)(v3 >> 1))
  {
    case 0uLL:
      uint64_t v5 = @"HUCameraStatusAndNotificationsSmartAlertPeopleDescription";
      goto LABEL_6;
    case 1uLL:
      uint64_t v5 = @"HUCameraStatusAndNotificationsSmartAlertAnimalsDescription";
      goto LABEL_6;
    case 3uLL:
      uint64_t v5 = @"HUCameraStatusAndNotificationsSmartAlertVehiclesDescription";
      goto LABEL_6;
    case 7uLL:
      uint64_t v5 = @"HUCameraStatusAndNotificationsSmartAlertPackagesDescription";
LABEL_6:
      _HULocalizedStringWithDefaultValue(v5, v5, 1);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v4;
}

- (HUCameraSmartNotificationSettingsModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCameraSmartNotificationSettingsModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end