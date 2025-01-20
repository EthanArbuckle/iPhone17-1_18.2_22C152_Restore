@interface HKTinkerSharingOptInController
- (BOOL)wantsLightenBlendedScreen;
- (HKTinkerSharingOptInController)initWithStyle:(int64_t)a3 delegate:(id)a4;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)privacyBundles;
- (id)suggestedButtonTitle;
- (id)tapToRadarMetadata;
- (id)termsOfAddress;
- (id)titleString;
- (void)_configureLayoutStyle;
- (void)_presentNetworkAccessConfirmationWithHelper:(id)a3;
- (void)alternateButtonPressed:(id)a3;
- (void)applyConfirmedOptin:(BOOL)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)userDidRequestCancel;
- (void)viewDidLoad;
@end

@implementation HKTinkerSharingOptInController

- (HKTinkerSharingOptInController)initWithStyle:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HKTinkerSharingOptInController;
  v7 = [(BPSWelcomeOptinViewController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_layoutStyle = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    [(HKTinkerSharingOptInController *)v8 _configureLayoutStyle];
  }

  return v8;
}

- (void)_configureLayoutStyle
{
  int64_t layoutStyle = self->_layoutStyle;
  if (layoutStyle == 1) {
    uint64_t v3 = 10;
  }
  else {
    uint64_t v3 = 2 * (layoutStyle == 2);
  }
  [(BPSWelcomeOptinViewController *)self setStyle:v3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HKTinkerSharingOptInController;
  [(BPSWelcomeOptinViewController *)&v5 viewDidLoad];
  if (self->_layoutStyle == 2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_userDidRequestCancel];
    v4 = [(OBBaseWelcomeController *)self navigationItem];
    [v4 setLeftBarButtonItem:v3];
  }
}

- (void)userDidRequestCancel
{
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)titleString
{
  uint64_t v3 = NSString;
  v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  objc_super v5 = [v4 localizedStringForKey:@"HEALTH_TINKER_TITLE_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = [WeakRetained tinkerMember];
  v8 = [v7 firstName];
  v9 = objc_msgSend(v3, "stringWithFormat:", v5, v8);

  return v9;
}

- (id)detailString
{
  uint64_t v3 = NSString;
  v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  objc_super v5 = [v4 localizedStringForKey:@"HEALTH_TINKER_DETAIL_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = [WeakRetained tinkerMember];
  v8 = [v7 firstName];
  v9 = objc_msgSend(v3, "stringWithFormat:", v5, v8);

  return v9;
}

- (id)imageResource
{
  return @"health-80";
}

- (id)imageResourceBundleIdentifier
{
  return @"com.apple.Bridge";
}

- (id)termsOfAddress
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v10[0] = *MEMORY[0x1E4F1AD88];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v5 = [WeakRetained tinkerMember];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v7 = [v5 contactWithKeys:v3 contactStore:v6];

  if (v7)
  {
    v8 = [v7 termsOfAddress];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)suggestedButtonPressed:(id)a3
{
  v4 = objc_alloc_init(HKTinkerSharingHelper);
  if ([(HKTinkerSharingHelper *)v4 isChinaSKUDevice]
    && ![(HKTinkerSharingHelper *)v4 networkAccessEnabledForHealth])
  {
    [(HKTinkerSharingOptInController *)self _presentNetworkAccessConfirmationWithHelper:v4];
  }
  else
  {
    [(HKTinkerSharingOptInController *)self applyConfirmedOptin:1];
  }
}

- (void)alternateButtonPressed:(id)a3
{
}

- (void)applyConfirmedOptin:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = v4;
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v6 = v13;
    _os_log_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ User opted-in", (uint8_t *)&v12, 0xCu);
  }
  if (self->_layoutStyle == 2)
  {
    v7 = [HKTinkerSharingGizmoPermissionController alloc];
    int64_t layoutStyle = self->_layoutStyle;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_super v10 = [(HKTinkerSharingGizmoPermissionController *)v7 initWithStyle:layoutStyle delegate:WeakRetained];

    v11 = [(HKTinkerSharingOptInController *)self navigationController];
    [v11 pushViewController:v10 animated:1];
  }
}

- (id)suggestedButtonTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v3 = [v2 localizedStringForKey:@"HEALTH_TINKER_REQUEST_SHARING" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v3 = [v2 localizedStringForKey:@"HEALTH_TINKER_SKIP_SHARING" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];

  return v3;
}

- (id)privacyBundles
{
  return &unk_1F3C1F150;
}

- (id)tapToRadarMetadata
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50C18]) initWithComponent:2];
  return v2;
}

- (void)_presentNetworkAccessConfirmationWithHelper:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v26 = [v4 localizedStringForKey:@"ENABLE_NETWORK_ACCESS_FOR_HEALTH_APP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];

  objc_super v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v27 = [v5 localizedAttributedStringForKey:@"ENABLE_NETWORK_ACCESS_FOR_USER_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];

  id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v34 = *MEMORY[0x1E4F28468];
  v7 = [(HKTinkerSharingOptInController *)self termsOfAddress];
  v33 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v35[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = [WeakRetained tinkerMember];
  int v12 = [v11 firstName];
  v25 = objc_msgSend(v6, "initWithFormat:options:locale:context:", v27, 0, 0, v9, v12);

  v24 = [v25 string];
  id v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v26 message:v24 preferredStyle:1];
  uint64_t v14 = (void *)MEMORY[0x1E4FB1410];
  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v16 = [v15 localizedStringForKey:@"DONT_ENABLE_NETWORK_ACCESS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __78__HKTinkerSharingOptInController__presentNetworkAccessConfirmationWithHelper___block_invoke;
  v32[3] = &unk_1E6D51928;
  v32[4] = self;
  v17 = [v14 actionWithTitle:v16 style:1 handler:v32];
  [v13 addAction:v17];

  v18 = (void *)MEMORY[0x1E4FB1410];
  v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v20 = [v19 localizedStringForKey:@"ENABLE_NETWORK_ACCESS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __78__HKTinkerSharingOptInController__presentNetworkAccessConfirmationWithHelper___block_invoke_2;
  v29[3] = &unk_1E6D52790;
  id v30 = v28;
  v31 = self;
  id v21 = v28;
  v22 = [v18 actionWithTitle:v20 style:0 handler:v29];
  [v13 addAction:v22];

  v23 = [(HKTinkerSharingOptInController *)self navigationController];
  [v23 presentViewController:v13 animated:1 completion:0];
}

uint64_t __78__HKTinkerSharingOptInController__presentNetworkAccessConfirmationWithHelper___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) userDidRequestCancel];
}

uint64_t __78__HKTinkerSharingOptInController__presentNetworkAccessConfirmationWithHelper___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNetworkAccessEnabledForHealth:1];
  v2 = *(void **)(a1 + 40);
  return [v2 applyConfirmedOptin:1];
}

- (void).cxx_destruct
{
}

@end