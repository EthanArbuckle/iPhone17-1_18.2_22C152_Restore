@interface HKTinkerSharingSyncSetupController
+ (BOOL)controllerNeedsToRun;
- (BOOL)controllerAllowsNavigatingBackFrom;
- (BOOL)controllerAllowsNavigatingBackTo;
- (HKTinkerSharingSyncSetupController)initWithStyle:(int64_t)a3 delegate:(id)a4;
- (id)_tinkerUserDateOfBirthComponents;
- (id)detailString;
- (id)imageResource;
- (id)suggestedButtonTitle;
- (id)tapToRadarMetadata;
- (id)titleString;
- (void)setupDidFailWithError:(id)a3;
- (void)setupDidSucceed;
- (void)setupSharing;
- (void)viewDidLoad;
@end

@implementation HKTinkerSharingSyncSetupController

- (HKTinkerSharingSyncSetupController)initWithStyle:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HKTinkerSharingSyncSetupController;
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
  v7.super_class = (Class)HKTinkerSharingSyncSetupController;
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

    [(HKTinkerSharingSyncSetupController *)self setupSharing];
    [(HKTinkerSharingSyncSetupController *)self setModalInPresentation:1];
  }
}

- (void)setupSharing
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = a1;
  v5 = objc_opt_class();
  id v6 = v5;
  id WeakRetained = objc_loadWeakRetained(a3);
  v8 = [WeakRetained tinkerMember];
  id v9 = objc_loadWeakRetained(a3);
  objc_super v10 = [v9 guardianMember];
  int v11 = 138543874;
  v12 = v5;
  __int16 v13 = 2112;
  v14 = v8;
  __int16 v15 = 2112;
  v16 = v10;
  _os_log_error_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Family member not found for this pairing, bailing. tinkerMember: %@, guardianMember: %@ (#t0)", (uint8_t *)&v11, 0x20u);
}

void __50__HKTinkerSharingSyncSetupController_setupSharing__block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = v6;
    *(_DWORD *)buf = 138543618;
    id v20 = (id)objc_opt_class();
    __int16 v21 = 2112;
    id v22 = v5;
    id v8 = v20;
    _os_log_impl(&dword_1E0B26000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Done with Tinker Health Sync Setup, got Error: %@", buf, 0x16u);
  }
  if (a1[6] == 2 && a2 != 0)
  {
    objc_super v10 = (void *)a1[5];
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1280));
    v12 = [WeakRetained tinkerDevice];
    __int16 v13 = [v12 pairingID];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__HKTinkerSharingSyncSetupController_setupSharing__block_invoke_305;
    v18[3] = &unk_1E6D512C8;
    v18[4] = a1[4];
    [v10 performEndToEndCloudSyncWithNRDeviceUUID:v13 syncParticipantFirst:0 completion:v18];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__HKTinkerSharingSyncSetupController_setupSharing__block_invoke_313;
  v15[3] = &unk_1E6D51580;
  char v17 = a2;
  v15[4] = a1[4];
  id v16 = v5;
  id v14 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

void __50__HKTinkerSharingSyncSetupController_setupSharing__block_invoke_305(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    objc_super v7 = objc_opt_class();
    id v8 = @"NO";
    int v10 = 138543874;
    int v11 = v7;
    __int16 v12 = 2114;
    if (a2) {
      id v8 = @"YES";
    }
    __int16 v13 = v8;
    __int16 v14 = 2114;
    id v15 = v4;
    id v9 = v7;
    _os_log_impl(&dword_1E0B26000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Done with Tinker end to end Cloud Sync, success: %{public}@, error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

uint64_t __50__HKTinkerSharingSyncSetupController_setupSharing__block_invoke_313(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (v2) {
    return [v3 setupDidSucceed];
  }
  else {
    return [v3 setupDidFailWithError:*(void *)(a1 + 40)];
  }
}

- (void)setupDidSucceed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sharingSetupDidSucceed];
}

- (void)setupDidFailWithError:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained sharingSetupDidFailWithError:v4];
}

+ (BOOL)controllerNeedsToRun
{
  return 1;
}

- (BOOL)controllerAllowsNavigatingBackFrom
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (id)titleString
{
  v3 = NSString;
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"HEALTH_TINKER_TITLE_%@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v7 = [WeakRetained tinkerMember];
  id v8 = [v7 firstName];
  id v9 = objc_msgSend(v3, "stringWithFormat:", v5, v8);

  return v9;
}

- (id)detailString
{
  int v2 = NSString;
  v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v4 = [v3 localizedStringForKey:@"TINKER_HEALTH_SYNC_SETUP_HOLD_DESCRIPTION" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-tinker"];
  id v5 = [v2 stringWithFormat:v4];

  return v5;
}

- (id)suggestedButtonTitle
{
  return 0;
}

- (id)imageResource
{
  return @"health-80";
}

- (id)_tinkerUserDateOfBirthComponents
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained tinkerMember];
  id v4 = [v3 dictionary];
  id v5 = [v4 objectForKey:@"member-date-of-birth"];

  if (v5)
  {
    [v5 doubleValue];
    objc_super v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v6 / 1000.0];
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithUTCTimeZone");
    id v9 = objc_msgSend(v8, "hk_dateOfBirthDateComponentsWithDate:", v7);
    int v10 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [v9 setCalendar:v10];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)tapToRadarMetadata
{
  int v2 = (void *)[objc_alloc(MEMORY[0x1E4F50C18]) initWithComponent:2];
  return v2;
}

- (void).cxx_destruct
{
}

@end