@interface HUHomeControlServiceManager
+ (id)sharedInstance;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (UIViewController)presentingViewController;
- (unint64_t)suspendedServiceClientCount;
- (void)_launchServiceWithContext:(id)a3;
- (void)_launchViewServiceSuspended;
- (void)_presentAlertForError:(id)a3;
- (void)dismissService;
- (void)launchServiceSuspendedWithUserInfo:(id)a3;
- (void)launchServiceWithContext:(id)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
- (void)setSuspendedServiceClientCount:(unint64_t)a3;
@end

@implementation HUHomeControlServiceManager

+ (id)sharedInstance
{
  if (qword_1EBA478A0 != -1) {
    dispatch_once(&qword_1EBA478A0, &__block_literal_global_137);
  }
  v2 = (void *)_MergedGlobals_626;

  return v2;
}

void __45__HUHomeControlServiceManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HUHomeControlServiceManager);
  v1 = (void *)_MergedGlobals_626;
  _MergedGlobals_626 = (uint64_t)v0;
}

- (void)launchServiceWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 serviceType];
  uint64_t v6 = [v4 serviceType];
  if (![v4 serviceType] || v5 == 1 || v6 == 2)
  {
    v8 = [v4 presentingViewController];
    presentingViewController = self->_presentingViewController;
    self->_presentingViewController = v8;

    objc_initWeak(location, self);
    v10 = (void *)MEMORY[0x1E4F627D0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__HUHomeControlServiceManager_launchServiceWithContext___block_invoke;
    v16[3] = &unk_1E638C470;
    objc_copyWeak(&v17, location);
    v11 = [v10 responderWithHandler:v16];
    uint64_t v12 = MEMORY[0x1E4F14428];
    id v13 = MEMORY[0x1E4F14428];
    [v11 setQueue:v12];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F627C8]) initWithInfo:0 responder:v11];
    v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
    [v4 setActions:v15];

    [(HUHomeControlServiceManager *)self _launchServiceWithContext:v4];
    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
  }
  else
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "Launching Home Control Service NOT permitted", (uint8_t *)location, 2u);
    }
  }
}

void __56__HUHomeControlServiceManager_launchServiceWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [v3 error];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    v7 = [v3 error];
    v8 = [v7 domain];
    if (([v8 isEqualToString:*MEMORY[0x1E4F68410]] & 1) == 0)
    {

LABEL_8:
      goto LABEL_9;
    }
    v9 = [WeakRetained presentingViewController];

    if (v9)
    {
      v10 = HFLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [WeakRetained presentingViewController];
        int v12 = 138412546;
        id v13 = v3;
        __int16 v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Presenting error %@ from presentingViewController = %@", (uint8_t *)&v12, 0x16u);
      }
      uint64_t v6 = [v3 error];
      [WeakRetained _presentAlertForError:v6];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)launchServiceSuspendedWithUserInfo:(id)a3
{
  [(HUHomeControlServiceManager *)self _launchViewServiceSuspended];
  unint64_t v4 = [(HUHomeControlServiceManager *)self suspendedServiceClientCount] + 1;

  [(HUHomeControlServiceManager *)self setSuspendedServiceClientCount:v4];
}

- (void)_launchServiceWithContext:(id)a3
{
  id v4 = a3;
  id v10 = [v4 userInfo];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.Home.HomeControlService" viewControllerClassName:@"HCSRemoteAlertServiceViewController"];
  id v6 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
  [v6 setUserInfo:v10];
  v7 = [v4 actions];

  [v6 setActions:v7];
  v8 = (void *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v5 configurationContext:v6];
  [v8 addObserver:self];
  id v9 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
  [v8 activateWithContext:v9];
  [(HUHomeControlServiceManager *)self setRemoteAlertHandle:v8];
}

- (void)dismissService
{
  id v3 = [(HUHomeControlServiceManager *)self remoteAlertHandle];

  if (v3)
  {
    id v4 = [(HUHomeControlServiceManager *)self remoteAlertHandle];
    [v4 removeObserver:self];

    uint64_t v5 = [(HUHomeControlServiceManager *)self remoteAlertHandle];
    [v5 invalidate];

    [(HUHomeControlServiceManager *)self setRemoteAlertHandle:0];
    [(HUHomeControlServiceManager *)self setPresentingViewController:0];
  }
  else
  {
    [(HUHomeControlServiceManager *)self setSuspendedServiceClientCount:[(HUHomeControlServiceManager *)self suspendedServiceClientCount] - 1];
    if (![(HUHomeControlServiceManager *)self suspendedServiceClientCount])
    {
      id v6 = [MEMORY[0x1E4F62AF8] sharedService];
      [v6 terminateApplication:@"com.apple.Home.HomeControlService" forReason:5 andReport:0 withDescription:&stru_1F18F92B8];
    }
  }
}

- (void)_launchViewServiceSuspended
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F62AF8] sharedService];
  uint64_t v4 = *MEMORY[0x1E4F625F8];
  v5[0] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 openApplication:@"com.apple.Home.HomeControlService" options:v3 withResult:&__block_literal_global_20_1];
}

void __58__HUHomeControlServiceManager__launchViewServiceSuspended__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_1BE345000, v3, OS_LOG_TYPE_ERROR, "Error opening Home Control Service Alert using Frontboard System Service [%@]", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_presentAlertForError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localizedDescription];
  uint64_t v6 = [v4 code];

  switch(v6)
  {
    case 'V':
      _HULocalizedStringWithDefaultValue(@"HUDropIn_ErrorAlert_UnableToConnect_Title", @"HUDropIn_ErrorAlert_UnableToConnect_Title", 1);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(@"HUDropIn_ErrorAlert_FailedToStart_Description", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
      goto LABEL_16;
    case 'W':
      _HULocalizedStringWithDefaultValue(@"HUDropIn_ErrorAlert_UnableToConnect_Title", @"HUDropIn_ErrorAlert_UnableToConnect_Title", 1);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(@"HUDropIn_ErrorAlert_FailedToStart_TryAgain_Description", @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v5);
      goto LABEL_16;
    case 'X':
      _HULocalizedStringWithDefaultValue(@"HUDropIn_ErrorAlert_Ended_Title", @"HUDropIn_ErrorAlert_Ended_Title", 1);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(@"HUDropIn_ErrorAlert_FailedDuringCall_Description", @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v5);
      goto LABEL_16;
    case 'Y':
      _HULocalizedStringWithDefaultValue(@"HUDropIn_ErrorAlert_Ended_Title", @"HUDropIn_ErrorAlert_Ended_Title", 1);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(@"HUDropIn_ErrorAlert_FailedDuringCall_TryAgain_Description", @"%@", v31, v32, v33, v34, v35, v36, (uint64_t)v5);
      goto LABEL_16;
    case 'Z':
      _HULocalizedStringWithDefaultValue(@"HUDropIn_ErrorAlert_Ended_Title", @"HUDropIn_ErrorAlert_Ended_Title", 1);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(@"HUDropIn_ErrorAlert_Ended_Description", @"%@", v37, v38, v39, v40, v41, v42, (uint64_t)v5);
      goto LABEL_16;
    case '[':
      _HULocalizedStringWithDefaultValue(@"HUDropIn_ErrorAlert_NoLongerAvailable_Title", @"HUDropIn_ErrorAlert_NoLongerAvailable_Title", 1);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      v43 = @"HUDropIn_ErrorAlert_WindowExpired_Description";
      goto LABEL_11;
    case '\\':
      _HULocalizedStringWithDefaultValue(@"HUDropIn_ErrorAlert_AlreadyInProgress_Title", @"HUDropIn_ErrorAlert_AlreadyInProgress_Title", 1);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(@"HUDropIn_ErrorAlert_AlreadyInProgress_Description", @"%@", v44, v45, v46, v47, v48, v49, (uint64_t)v5);
      goto LABEL_16;
    case ']':
      _HULocalizedStringWithDefaultValue(@"HUDropIn_ErrorAlert_UnableToConnect_Title", @"HUDropIn_ErrorAlert_UnableToConnect_Title", 1);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      v43 = @"HUDropIn_ErrorAlert_UserAccessNotAllowed_Description";
LABEL_11:
      uint64_t v50 = _HULocalizedStringWithDefaultValue(v43, v43, 1);
      goto LABEL_17;
    case '^':
      _HULocalizedStringWithDefaultValue(@"HUDropIn_ErrorAlert_OnActiveCall_Title", @"HUDropIn_ErrorAlert_OnActiveCall_Title", 1);
      id v71 = (id)objc_claimAutoreleasedReturnValue();
      v57 = HULocalizedStringWithFormat(@"HUDropIn_ErrorAlert_ThisDevice_OnActiveCall_Description", @"%@", v51, v52, v53, v54, v55, v56, (uint64_t)v5);
      if (!v57) {
        NSLog(&cfstr_CouldnTLocaliz_0.isa, 0);
      }
      id v58 = v71;
      goto LABEL_18;
    case '_':
      _HULocalizedStringWithDefaultValue(@"HUDropIn_ErrorAlert_UnableToConnect_Title", @"HUDropIn_ErrorAlert_UnableToConnect_Title", 1);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(@"HUDropIn_ErrorAlert_HostDevice_OnActiveCall_Description", @"%@", v59, v60, v61, v62, v63, v64, (uint64_t)v5);
      goto LABEL_16;
    default:
      _HULocalizedStringWithDefaultValue(@"HUDropIn_ErrorAlert_Ended_Title", @"HUDropIn_ErrorAlert_Ended_Title", 1);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(@"HUDropIn_ErrorAlert_ThisDevice_OnActiveCall_Description", @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v5);
      uint64_t v50 = LABEL_16:;
LABEL_17:
      id v58 = v70;
      v57 = (void *)v50;
LABEL_18:
      id v72 = v58;
      v65 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v58 message:v57 preferredStyle:1];
      v66 = (void *)MEMORY[0x1E4F42720];
      v67 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
      v68 = [v66 actionWithTitle:v67 style:0 handler:0];
      [v65 addAction:v68];

      v69 = [(HUHomeControlServiceManager *)self presentingViewController];
      [v69 presentViewController:v65 animated:1 completion:0];

      return;
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  id v5 = [(HUHomeControlServiceManager *)self remoteAlertHandle];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    uint64_t v7 = [(HUHomeControlServiceManager *)self remoteAlertHandle];
    [v7 removeObserver:self];

    [(HUHomeControlServiceManager *)self setRemoteAlertHandle:0];
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (unint64_t)suspendedServiceClientCount
{
  return self->_suspendedServiceClientCount;
}

- (void)setSuspendedServiceClientCount:(unint64_t)a3
{
  self->_suspendedServiceClientCount = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);

  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
}

@end