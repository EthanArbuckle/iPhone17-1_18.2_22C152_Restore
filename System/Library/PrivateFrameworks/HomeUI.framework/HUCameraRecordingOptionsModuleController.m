@interface HUCameraRecordingOptionsModuleController
- (BOOL)hasNotificationSettingForItem:(id)a3;
- (BOOL)isItemHeader:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUCameraRecordingOptionsModuleController)initWithModule:(id)a3;
- (id)alertMessageForEventType:(unint64_t)a3;
- (id)alertTitleForEventType:(unint64_t)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)displayAlertForItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUCameraRecordingOptionsModuleController

- (HUCameraRecordingOptionsModuleController)initWithModule:(id)a3
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
  v20.super_class = (Class)HUCameraRecordingOptionsModuleController;
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
  objc_opt_class();
  uint64_t v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (([v7 isItemHeader:v4] & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [v7 smartDetectionModule];
      v9 = [v8 anyMotionDetectedItem];
      if ([v4 isEqual:v9])
      {
LABEL_9:

        goto LABEL_11;
      }
      v10 = [v7 smartDetectionModule];
      v11 = [v10 specificMotionDetectedItem];
      if ([v4 isEqual:v11])
      {

        goto LABEL_9;
      }
      id v12 = [v7 smartDetectionModule];
      v13 = [v12 aClipIsRecordedItem];
      [v4 isEqual:v13];
    }
  }
LABEL_11:
  v14 = objc_opt_class();

  return (Class)v14;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)HUCameraRecordingOptionsModuleController;
  [(HUItemModuleController *)&v29 setupCell:v6 forItem:v7];
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
  objc_opt_class();
  id v22 = v19;
  if (objc_opt_isKindOfClass()) {
    v23 = v22;
  }
  else {
    v23 = 0;
  }
  id v24 = v23;

  if (v24)
  {
    objc_opt_class();
    id v25 = v7;
    if (objc_opt_isKindOfClass()) {
      v26 = v25;
    }
    else {
      v26 = 0;
    }
    id v27 = v26;

    if (v27)
    {
      v28 = [MEMORY[0x1E4F428B8] redColor];
      [v24 setTintColor:v28];

      [v24 setTextAlignment:4];
    }
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)HUCameraRecordingOptionsModuleController;
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

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    BOOL v5 = [(HUItemModuleController *)self module];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    id v8 = (void *)MEMORY[0x1E4F42728];
    v9 = _HULocalizedStringWithDefaultValue(@"HUCameraEraseAllRecordingsAlertMessage", @"HUCameraEraseAllRecordingsAlertMessage", 1);
    id v10 = [v8 alertControllerWithTitle:0 message:v9 preferredStyle:0];

    uint64_t v11 = (void *)MEMORY[0x1E4F42720];
    objc_super v12 = _HULocalizedStringWithDefaultValue(@"HUCameraEraseAllRecordings", @"HUCameraEraseAllRecordings", 1);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __58__HUCameraRecordingOptionsModuleController_didSelectItem___block_invoke;
    v26[3] = &unk_1E6385188;
    id v27 = v7;
    id v13 = v7;
    v14 = [v11 actionWithTitle:v12 style:2 handler:v26];
    [v10 addAction:v14];

    char v15 = (void *)MEMORY[0x1E4F42720];
    id v16 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveDeviceAlertCancelButton", @"HUServiceDetailsRemoveDeviceAlertCancelButton", 1);
    v17 = [v15 actionWithTitle:v16 style:1 handler:0];
    [v10 addAction:v17];

    id v18 = +[HUViewControllerPresentationRequest requestWithViewController:v10];
    [v18 setPreferredPresentationType:0];
    id v19 = [(HUItemModuleController *)self host];
    id v20 = (id)[v19 moduleController:self presentViewControllerForRequest:v18];
  }
  id v21 = [(HUItemModuleController *)self module];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    v23 = [(HUItemModuleController *)self module];
    id v24 = (id)[v23 didSelectItem:v4];
  }
  return 0;
}

void __58__HUCameraRecordingOptionsModuleController_didSelectItem___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cloudStorageModule];
  id v1 = (id)[v2 removeAllCameraRecordings];
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  id v27 = a3;
  objc_opt_class();
  id v6 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  v9 = [v27 item];
  id v10 = [v8 recordAudioItem];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    [v8 updateRecordAudioValue:v4];
  }
  else
  {
    if (v4
      || ([v27 item],
          objc_super v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = [(HUCameraRecordingOptionsModuleController *)self hasNotificationSettingForItem:v12], v12, !v13))
    {
      v14 = [v8 smartDetectionModule];
      char v15 = [v27 item];
      id v16 = (id)[v14 updateMotionDetectionSettingForItem:v15];
    }
    else
    {
      [v27 setOn:1 animated:1];
      v14 = [v27 item];
      [(HUCameraRecordingOptionsModuleController *)self displayAlertForItem:v14];
    }
  }
  objc_opt_class();
  v17 = [(HUItemModuleController *)self host];
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  if (v19)
  {
    objc_opt_class();
    id v20 = [v27 item];
    id v21 = [v20 latestResults];
    char v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F68AC0]];
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    id v24 = v23;

    id v25 = (void *)MEMORY[0x1E4F68EE0];
    v26 = [v27 item];
    [v25 sendSwitchCellToggleEventForItem:v26 isOn:v4 title:v24 fromSourceViewController:v19];
  }
}

- (BOOL)hasNotificationSettingForItem:(id)a3
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

  v9 = [v8 objectForKeyedSubscript:@"HUCameraSettingResultKey"];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  objc_super v12 = (void *)MEMORY[0x1E4F68FD8];
  BOOL v13 = [v7 cameraProfiles];
  v14 = [v12 configurationForCameraProfilesNotificationSettings:v13];

  uint64_t v15 = [v14 eventTypes];
  LOBYTE(v15) = ([v11 eventTypes] & v15) != 0;

  return v15;
}

- (void)displayAlertForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = [v4 latestResults];
  id v6 = [v5 objectForKeyedSubscript:@"HUCameraSettingResultKey"];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  v9 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v10 = [v9 home];
  if (objc_msgSend(v10, "hf_currentUserIsOwner")) {
    -[HUCameraRecordingOptionsModuleController alertMessageForEventType:](self, "alertMessageForEventType:", [v8 eventTypes]);
  }
  else {
  id v11 = _HULocalizedStringWithDefaultValue(@"HUCameraStatusAndNotificationsSmartAlertDescription", @"HUCameraStatusAndNotificationsSmartAlertDescription", 1);
  }

  objc_super v12 = (void *)MEMORY[0x1E4F42728];
  BOOL v13 = -[HUCameraRecordingOptionsModuleController alertTitleForEventType:](self, "alertTitleForEventType:", [v8 eventTypes]);
  v14 = [v12 alertControllerWithTitle:v13 message:v11 preferredStyle:1];

  uint64_t v15 = (void *)MEMORY[0x1E4F42720];
  id v16 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  id v27 = __64__HUCameraRecordingOptionsModuleController_displayAlertForItem___block_invoke;
  v28 = &unk_1E6389708;
  objc_super v29 = self;
  id v30 = v4;
  id v17 = v4;
  id v18 = [v15 actionWithTitle:v16 style:0 handler:&v25];
  objc_msgSend(v14, "addAction:", v18, v25, v26, v27, v28, v29);

  id v19 = (void *)MEMORY[0x1E4F42720];
  id v20 = _HULocalizedStringWithDefaultValue(@"HUCancelTitle", @"HUCancelTitle", 1);
  id v21 = [v19 actionWithTitle:v20 style:0 handler:&__block_literal_global_140];
  [v14 addAction:v21];

  char v22 = +[HUViewControllerPresentationRequest requestWithViewController:v14];
  [v22 setPreferredPresentationType:0];
  v23 = [(HUItemModuleController *)self host];
  id v24 = (id)[v23 moduleController:self presentViewControllerForRequest:v22];
}

void __64__HUCameraRecordingOptionsModuleController_displayAlertForItem___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id v2 = [*(id *)(a1 + 32) module];
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  id v6 = [v4 smartDetectionModule];

  id v5 = (id)[v6 updateMotionDetectionSettingForItem:*(void *)(a1 + 40)];
}

- (id)alertTitleForEventType:(unint64_t)a3
{
  *((void *)&v3 + 1) = a3;
  *(void *)&long long v3 = a3 - 2;
  id v4 = &stru_1F18F92B8;
  switch((unint64_t)(v3 >> 1))
  {
    case 0uLL:
      id v5 = @"HUCameraRecordingOptionsWarningPeopleTitle";
      goto LABEL_6;
    case 1uLL:
      id v5 = @"HUCameraRecordingOptionsWarningAnimalsTitle";
      goto LABEL_6;
    case 3uLL:
      id v5 = @"HUCameraRecordingOptionsWarningVehiclesTitle";
      goto LABEL_6;
    case 7uLL:
      id v5 = @"HUCameraRecordingOptionsWarningPackagesTitle";
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
      id v5 = @"HUCameraRecordingOptionsWarningPeopleDescription";
      goto LABEL_6;
    case 1uLL:
      id v5 = @"HUCameraRecordingOptionsWarningAnimalsDescription";
      goto LABEL_6;
    case 3uLL:
      id v5 = @"HUCameraRecordingOptionsWarningVehiclesDescription";
      goto LABEL_6;
    case 7uLL:
      id v5 = @"HUCameraRecordingOptionsWarningPackagesDescription";
LABEL_6:
      _HULocalizedStringWithDefaultValue(v5, v5, 1);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v4;
}

@end