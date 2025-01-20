@interface HMDMTSAuthorizationServer
+ (id)logCategory;
- (HMDAppleAccountManager)accountManager;
- (HMDMTSAuthorizationServer)initWithAccountManager:(id)a3;
- (HMDMTSAuthorizationServer)initWithUIDialogPresenter:(id)a3 accountManager:(id)a4 systemPreferenceReader:(id)a5;
- (HMDUIDialogPresenter)uiDialogPresenter;
- (id)systemPreferenceReader;
- (void)checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a3;
- (void)showRestrictedCharacteristicsAccessWarningAlert;
@end

@implementation HMDMTSAuthorizationServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong(&self->_systemPreferenceReader, 0);
  objc_storeStrong((id *)&self->_uiDialogPresenter, 0);
}

- (HMDAppleAccountManager)accountManager
{
  return self->_accountManager;
}

- (id)systemPreferenceReader
{
  return self->_systemPreferenceReader;
}

- (HMDUIDialogPresenter)uiDialogPresenter
{
  return self->_uiDialogPresenter;
}

- (void)checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  v5 = [(HMDMTSAuthorizationServer *)self systemPreferenceReader];
  v6 = ((void (**)(void, __CFString *))v5)[2](v5, @"EnableBluetoothCentralMatterClientSkipDeveloperModeRestrictionProfile");

  uint64_t v7 = [v6 BOOLValue];
  uint64_t v8 = v7;
  if (v7) {
    uint64_t v7 = [(HMDMTSAuthorizationServer *)self showRestrictedCharacteristicsAccessWarningAlert];
  }
  v9 = (void *)MEMORY[0x230FBD990](v7);
  v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    v13 = HMFBooleanToString();
    int v14 = 138543618;
    v15 = v12;
    __int16 v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Restricted characteristics access allowed returning %@", (uint8_t *)&v14, 0x16u);
  }
  v4[2](v4, v8);
}

- (void)showRestrictedCharacteristicsAccessWarningAlert
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Showing restricted characteristics access warning", buf, 0xCu);
  }
  uint64_t v7 = [(HMDMTSAuthorizationServer *)v4 uiDialogPresenter];
  uint64_t v8 = [(HMDMTSAuthorizationServer *)v4 accountManager];
  v9 = [v8 device];
  v10 = [v9 name];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__HMDMTSAuthorizationServer_showRestrictedCharacteristicsAccessWarningAlert__block_invoke;
  v11[3] = &unk_264A2F7F8;
  v11[4] = v4;
  [v7 displayRestrictedBluetoothCharacteristicsWarningWithDeviceName:v10 completionHandler:v11];
}

void __76__HMDMTSAuthorizationServer_showRestrictedCharacteristicsAccessWarningAlert__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Restricted characteristics access warning dismissed", (uint8_t *)&v6, 0xCu);
  }
}

- (HMDMTSAuthorizationServer)initWithAccountManager:(id)a3
{
  id v4 = a3;
  v5 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
  int v6 = [(HMDMTSAuthorizationServer *)self initWithUIDialogPresenter:v5 accountManager:v4 systemPreferenceReader:&__block_literal_global_228078];

  return v6;
}

id __52__HMDMTSAuthorizationServer_initWithAccountManager___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F42650];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithKey:v3 options:0 domain:@"com.apple.homed" defaultValue:0];

  return v4;
}

- (HMDMTSAuthorizationServer)initWithUIDialogPresenter:(id)a3 accountManager:(id)a4 systemPreferenceReader:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDMTSAuthorizationServer;
  v12 = [(HMDMTSAuthorizationServer *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uiDialogPresenter, a3);
    uint64_t v14 = _Block_copy(v11);
    id systemPreferenceReader = v13->_systemPreferenceReader;
    v13->_id systemPreferenceReader = v14;

    objc_storeStrong((id *)&v13->_accountManager, a4);
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_228088 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_228088, &__block_literal_global_5_228089);
  }
  v2 = (void *)logCategory__hmf_once_v4_228090;
  return v2;
}

void __40__HMDMTSAuthorizationServer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_228090;
  logCategory__hmf_once_v4_228090 = v0;
}

@end