@interface HUSafetyAndSecuritySettingsItemModuleController
- (Class)cellClassForItem:(id)a3;
- (HUBannerView)softwareUpdateBannerView;
- (HUGridLayoutOptions)layoutOptions;
- (HUSafetyAndSecuritySettingsItemModuleController)initWithModule:(id)a3 delegate:(id)a4;
- (HUSafetyAndSecuritySettingsModuleControllerDelegate)delegate;
- (unint64_t)didSelectItem:(id)a3;
- (void)bannerView:(id)a3 footerViewTapped:(id)a4;
- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setSoftwareUpdateBannerView:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
- (void)userSwitchCell:(id)a3 didTurnOn:(BOOL)a4;
@end

@implementation HUSafetyAndSecuritySettingsItemModuleController

- (HUSafetyAndSecuritySettingsItemModuleController)initWithModule:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUSafetyAndSecuritySettingsItemModuleController;
  v7 = [(HUItemModuleController *)&v11 initWithModule:a3];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v9 addHomeManagerObserver:v8];
  }
  return v8;
}

- (Class)cellClassForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [v7 homeUpgradeBannerItem];
    [v4 isEqual:v8];
  }
  v9 = objc_opt_class();

  return (Class)v9;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)HUSafetyAndSecuritySettingsItemModuleController;
  [(HUItemModuleController *)&v35 setupCell:v6 forItem:v7];
  objc_opt_class();
  v8 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  [v6 bounds];
  v13 = +[HUGridLayoutOptions defaultOptionsForViewSize:](HUGridLayoutOptions, "defaultOptionsForViewSize:", v11, v12);
  [(HUSafetyAndSecuritySettingsItemModuleController *)self setLayoutOptions:v13];
  v14 = [v10 listenForSoundsItem];
  if ([v7 isEqual:v14])
  {

LABEL_7:
    id v17 = v6;
    [v17 setAccessoryView:0];
    [v17 setAccessoryType:1];
    [v17 setHideIcon:1];
LABEL_8:

    goto LABEL_9;
  }
  v15 = [v10 notificationsItem];
  int v16 = [v7 isEqual:v15];

  if (v16) {
    goto LABEL_7;
  }
  v21 = [v10 homeUpgradeBannerItem];
  int v22 = [v7 isEqual:v21];

  if (v22)
  {
    uint64_t v23 = objc_opt_class();
    id v24 = v6;
    if (v24)
    {
      if (objc_opt_isKindOfClass()) {
        v25 = v24;
      }
      else {
        v25 = 0;
      }
      id v17 = v24;
      if (v25) {
        goto LABEL_23;
      }
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v26 handleFailureInFunction:v27, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v23, objc_opt_class() file lineNumber description];
    }
    id v17 = 0;
LABEL_23:

    v28 = [(HUSafetyAndSecuritySettingsItemModuleController *)self layoutOptions];
    v29 = [v28 bannerCellOptions];
    v30 = [v24 layer];
    [v30 cornerRadius];
    objc_msgSend(v29, "setCellCornerRadius:");

    v31 = [(HUSafetyAndSecuritySettingsItemModuleController *)self layoutOptions];
    v32 = [v31 bannerCellOptions];
    [v17 setLayoutOptions:v32];

    [v17 setDelegate:self];
    v33 = [v17 bannerView];
    softwareUpdateBannerView = self->_softwareUpdateBannerView;
    self->_softwareUpdateBannerView = v33;

    goto LABEL_8;
  }
LABEL_9:
  objc_opt_class();
  id v18 = v6;
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  if (v20) {
    [v20 setDelegate:self];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HUSafetyAndSecuritySettingsItemModuleController;
  [(HUItemModuleController *)&v26 updateCell:v8 forItem:v9 animated:v5];
  objc_opt_class();
  id v10 = v8;
  if (objc_opt_isKindOfClass()) {
    double v11 = v10;
  }
  else {
    double v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    objc_opt_class();
    id v13 = v9;
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      int v16 = [v15 home];
      id v17 = [v15 user];
      id v18 = objc_msgSend(v16, "hf_handleForUser:", v17);
      [v12 setUserHandle:v18];

      v19 = [v16 homeAccessControlForUser:v17];
      objc_msgSend(v12, "setOn:", objc_msgSend(v19, "audioAnalysisUserDropInAccessLevel") == 2);
      if (objc_msgSend(v16, "hf_currentUserIsOwner"))
      {
        uint64_t v20 = 0;
      }
      else if (objc_msgSend(v16, "hf_currentUserIsAdministrator"))
      {
        v21 = [v17 uniqueIdentifier];
        int v22 = [v16 currentUser];
        uint64_t v23 = [v22 uniqueIdentifier];
        int v25 = objc_msgSend(v21, "hmf_isEqualToUUID:", v23);

        id v24 = [v16 homeAccessControlForUser:v17];
        LODWORD(v22) = [v24 isAdministrator];

        uint64_t v20 = v22 & ~v25;
      }
      else
      {
        uint64_t v20 = 1;
      }
      [v12 setDisabled:v20];
    }
  }
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

  id v8 = [v7 listenForSoundsItem];
  int v9 = [v4 isEqual:v8];

  if (v9)
  {
    id v10 = HUAudioAnalysisSettingsViewController;
  }
  else
  {
    double v11 = [v7 notificationsItem];
    int v12 = [v4 isEqual:v11];

    if (!v12)
    {
      unint64_t v19 = 0;
      goto LABEL_10;
    }
    id v10 = HUSafetyAndSecuritySettingsNotificationsViewController;
  }
  id v13 = [v10 alloc];
  v14 = [v7 home];
  id v15 = (void *)[v13 initWithHome:v14];

  int v16 = +[HUViewControllerPresentationRequest requestWithViewController:v15];
  [v16 setAnimated:1];
  [v16 setPreferredPresentationType:1];
  id v17 = [(HUItemModuleController *)self host];
  id v18 = (id)[v17 moduleController:self presentViewControllerForRequest:v16];

  unint64_t v19 = 1;
LABEL_10:

  return v19;
}

- (void)bannerView:(id)a3 footerViewTapped:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v13 = v7;

  id v8 = [(HUSafetyAndSecuritySettingsItemModuleController *)self softwareUpdateBannerView];
  int v9 = [v5 isEqual:v8];

  if (v9)
  {
    id v10 = [(HUSafetyAndSecuritySettingsItemModuleController *)self delegate];

    if (!v10) {
      goto LABEL_8;
    }
    id v8 = [(HUSafetyAndSecuritySettingsItemModuleController *)self delegate];
    double v11 = [v13 home];
    int v12 = [v13 devices];
    [v8 presentHH2OnboardingForHome:v11 withDevices:v12];
  }
LABEL_8:
}

- (void)userSwitchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = @"OFF";
    if (v4) {
      int v9 = @"ON";
    }
    *(_DWORD *)buf = 138412290;
    objc_super v35 = v9;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "User Tapped switch to turn %@.", buf, 0xCu);
  }

  objc_opt_class();
  id v10 = [(HUItemModuleController *)self module];
  if (objc_opt_isKindOfClass()) {
    double v11 = v10;
  }
  else {
    double v11 = 0;
  }
  id v12 = v11;

  id v13 = [v7 item];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v15 = [v7 item];
    int v16 = [v12 enableUserPermissionSetting:v4 forItem:v15];

    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __76__HUSafetyAndSecuritySettingsItemModuleController_userSwitchCell_didTurnOn___block_invoke;
    v31 = &unk_1E6385A48;
    id v32 = v7;
    BOOL v33 = v4;
    id v17 = (id)[v16 addCompletionBlock:&v28];
  }
  id v18 = objc_msgSend(v12, "itemUpdater", v28, v29, v30, v31);
  unint64_t v19 = (void *)MEMORY[0x1E4F69230];
  uint64_t v20 = [v12 itemProviders];
  v21 = [v19 requestToReloadItemProviders:v20 senderSelector:a2];
  id v22 = (id)[v18 performItemUpdateRequest:v21];

  objc_opt_class();
  uint64_t v23 = [(HUItemModuleController *)self host];
  if (objc_opt_isKindOfClass()) {
    id v24 = v23;
  }
  else {
    id v24 = 0;
  }
  id v25 = v24;

  if (v25)
  {
    objc_super v26 = (void *)MEMORY[0x1E4F68EE0];
    v27 = [v7 item];
    [v26 sendSwitchCellToggleEventForItem:v27 isOn:v4 title:@"userDisplayString" fromSourceViewController:v25];
  }
}

uint64_t __76__HUSafetyAndSecuritySettingsItemModuleController_userSwitchCell_didTurnOn___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(result + 32) setOn:*(unsigned char *)(result + 40) == 0 animated:1];
  }
  return result;
}

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v10 = 138412802;
    double v11 = self;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@: didUpdateHH2State = %{BOOL}d", (uint8_t *)&v10, 0x1Cu);
  }
  if (v4)
  {
    int v9 = [(HUSafetyAndSecuritySettingsItemModuleController *)self delegate];
    [v9 dismissToHomeSettings];
  }
}

- (HUGridLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(id)a3
{
}

- (HUBannerView)softwareUpdateBannerView
{
  return self->_softwareUpdateBannerView;
}

- (void)setSoftwareUpdateBannerView:(id)a3
{
}

- (HUSafetyAndSecuritySettingsModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUSafetyAndSecuritySettingsModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_softwareUpdateBannerView, 0);

  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end