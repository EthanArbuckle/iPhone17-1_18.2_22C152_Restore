@interface HKTinkerSharingGizmoPermissionController
- (BOOL)controllerAllowsNavigatingBackFrom;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)wantsLightenBlendedScreen;
- (HKTinkerSharingGizmoPermissionController)initWithStyle:(int64_t)a3 delegate:(id)a4;
- (id)_localizedFullNameForFirstName:(id)a3 lastName:(id)a4;
- (id)detailString;
- (id)imageResource;
- (id)suggestedButtonTitle;
- (id)tapToRadarMetadata;
- (id)titleString;
- (void)optInDidFailWithError:(id)a3;
- (void)optInDidSucceed;
- (void)sendOptInRequest;
- (void)viewDidLoad;
@end

@implementation HKTinkerSharingGizmoPermissionController

- (HKTinkerSharingGizmoPermissionController)initWithStyle:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HKTinkerSharingGizmoPermissionController;
  v7 = [(BPSWelcomeOptinViewController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_layoutStyle = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    [(BPSWelcomeOptinViewController *)v8 setStyle:2];
  }

  return v8;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HKTinkerSharingGizmoPermissionController;
  [(BPSWelcomeOptinViewController *)&v7 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  [v3 setHidesWhenStopped:1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v3];
  v5 = [(OBBaseWelcomeController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  [v3 startAnimating];
  if (self->_layoutStyle == 2)
  {
    id v6 = [(OBBaseWelcomeController *)self navigationItem];
    [v6 setHidesBackButton:1];

    [(HKTinkerSharingGizmoPermissionController *)self setModalInPresentation:1];
    [(HKTinkerSharingGizmoPermissionController *)self sendOptInRequest];
  }
}

- (void)sendOptInRequest
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "[sharing-setup] Family member not found for this pairing, bailing. (#t0)", v1, 2u);
}

void __60__HKTinkerSharingGizmoPermissionController_sendOptInRequest__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1E0B26000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Done with Tinker Opt In request, got Error: %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HKTinkerSharingGizmoPermissionController_sendOptInRequest__block_invoke_304;
  block[3] = &unk_1E6D51580;
  char v10 = a2;
  block[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__HKTinkerSharingGizmoPermissionController_sendOptInRequest__block_invoke_304(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2) {
    return [v3 optInDidSucceed];
  }
  else {
    return [v3 optInDidFailWithError:*(void *)(a1 + 40)];
  }
}

- (void)optInDidSucceed
{
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Tinker user opt-in request accepted, will begin sharing setup", v9, 2u);
  }
  v4 = [HKTinkerSharingSyncSetupController alloc];
  int64_t layoutStyle = self->_layoutStyle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [(HKTinkerSharingSyncSetupController *)v4 initWithStyle:layoutStyle delegate:WeakRetained];

  v8 = [(HKTinkerSharingGizmoPermissionController *)self navigationController];
  [v8 pushViewController:v7 animated:1];
}

- (void)optInDidFailWithError:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained sharingSetupDidFailWithError:v4];
}

- (BOOL)controllerAllowsNavigatingBackFrom
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (BOOL)wantsLightenBlendedScreen
{
  return 1;
}

- (id)titleString
{
  v3 = NSString;
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"HEALTH_TINKER_TITLE_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [WeakRetained tinkerMember];
  v8 = [v7 firstName];
  id v9 = objc_msgSend(v3, "stringWithFormat:", v5, v8);

  return v9;
}

- (id)detailString
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained tinkerMember];
  id v4 = [v3 firstName];

  id v5 = NSString;
  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v7 = [v6 localizedStringForKey:@"HEALTH_TINKER_WAIT_FOR_RESPONSE_%@_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
  v8 = objc_msgSend(v5, "stringWithFormat:", v7, v4, v4);

  return v8;
}

- (id)imageResource
{
  return @"health-80";
}

- (id)suggestedButtonTitle
{
  return 0;
}

- (id)tapToRadarMetadata
{
  int v2 = (void *)[objc_alloc(MEMORY[0x1E4F50C18]) initWithComponent:2];
  return v2;
}

- (id)_localizedFullNameForFirstName:(id)a3 lastName:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F28F30];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setGivenName:v7];

  [v8 setFamilyName:v6];
  id v9 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v8 style:2 options:0];

  return v9;
}

- (void).cxx_destruct
{
}

@end