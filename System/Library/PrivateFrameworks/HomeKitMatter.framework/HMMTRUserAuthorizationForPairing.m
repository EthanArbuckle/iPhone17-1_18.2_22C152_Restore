@interface HMMTRUserAuthorizationForPairing
+ (id)logCategory;
- (HMMTRUIDialogPresenter)uiDialogPresenter;
- (HMMTRUserAuthorizationForPairing)initWithUiDialogPresenter:(id)a3;
- (void)requestUserPermissionForBridgeAccessory:(id)a3 completionHandler:(id)a4;
- (void)setUiDialogPresenter:(id)a3;
@end

@implementation HMMTRUserAuthorizationForPairing

- (void).cxx_destruct
{
}

- (void)setUiDialogPresenter:(id)a3
{
}

- (HMMTRUIDialogPresenter)uiDialogPresenter
{
  return self->_uiDialogPresenter;
}

- (void)requestUserPermissionForBridgeAccessory:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 category];
  char v9 = [v8 isEqual:&unk_2702B5610];

  if (v9)
  {
    v10 = [(HMMTRUserAuthorizationForPairing *)self uiDialogPresenter];
    v11 = [v6 name];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __94__HMMTRUserAuthorizationForPairing_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke;
    v12[3] = &unk_2653782F8;
    v12[4] = self;
    id v13 = v7;
    [v10 requestUserPermissionForBridgeAccessory:v11 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __94__HMMTRUserAuthorizationForPairing_requestUserPermissionForBridgeAccessory_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = *(id *)(a1 + 32);
  v8 = HMFGetOSLogHandle();
  char v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = (uint64_t)v10;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, got an error response for user permission for bridge accessory. Fail pairing.", (uint8_t *)&v16, 0xCu);
    }
    v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:12 userInfo:&unk_2702B62B8];
    v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      v14 = (void *)v13;
      v15 = "NO";
      if (a2) {
        v15 = "YES";
      }
      int v16 = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      v19 = v15;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_DEBUG, "%{public}@User selection for bridge accessory. Should cancel : %s", (uint8_t *)&v16, 0x16u);
    }
    if (a2)
    {
      v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:12 userInfo:&unk_2702B6290];
    }
    else
    {
      v11 = 0;
    }
    v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v12();
}

- (HMMTRUserAuthorizationForPairing)initWithUiDialogPresenter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRUserAuthorizationForPairing;
  id v6 = [(HMMTRUserAuthorizationForPairing *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uiDialogPresenter, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_5877 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_5877, &__block_literal_global_5878);
  }
  v2 = (void *)logCategory__hmf_once_v3_5879;
  return v2;
}

uint64_t __47__HMMTRUserAuthorizationForPairing_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_5879;
  logCategory__hmf_once_v3_5879 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end