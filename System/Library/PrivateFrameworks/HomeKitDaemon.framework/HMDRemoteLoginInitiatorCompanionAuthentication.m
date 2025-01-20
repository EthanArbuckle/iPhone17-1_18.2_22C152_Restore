@interface HMDRemoteLoginInitiatorCompanionAuthentication
+ (id)logCategory;
- (ACAccount)account;
- (HMDRemoteLoginInitiatorCompanionAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 account:(id)a8;
- (id)description;
- (void)_authenticate;
- (void)authenticate;
- (void)dealloc;
@end

@implementation HMDRemoteLoginInitiatorCompanionAuthentication

- (void).cxx_destruct
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)_authenticate
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = +[HMDAppleAccountManager sharedManager];
  v4 = [v3 accountStore];

  v5 = [(HMDRemoteLoginInitiatorCompanionAuthentication *)self account];
  id v26 = 0;
  v6 = [v4 credentialForAccount:v5 error:&v26];
  id v7 = v26;

  if (v6)
  {
    v8 = [(HMDRemoteLoginInitiatorCompanionAuthentication *)self account];
    [v8 setCredential:v6];

    v9 = (void *)MEMORY[0x230FBD990]();
    v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [(HMDRemoteLoginInitiatorCompanionAuthentication *)v10 account];
      v14 = [v13 identifier];
      v15 = [(HMDRemoteLoginInitiatorCompanionAuthentication *)v10 account];
      *(_DWORD *)buf = 138543874;
      v30 = v12;
      __int16 v31 = 2112;
      v32 = v14;
      __int16 v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Loaded credentials for account %@, %@", buf, 0x20u);
    }
    v16 = [MEMORY[0x263F291C0] currentDevice];
    [v16 setLinkType:3];
    v17 = [HMDRemoteLoginCompanionAuthenticationRequest alloc];
    v18 = [(HMDRemoteLoginAuthentication *)v10 sessionID];
    v19 = [(HMRemoteLoginMessage *)v17 initWithSessionID:v18];

    v20 = [(HMDRemoteLoginInitiatorCompanionAuthentication *)v10 account];
    [(HMDRemoteLoginCompanionAuthenticationRequest *)v19 setAccount:v20];

    [(HMDRemoteLoginCompanionAuthenticationRequest *)v19 setCompanionDevice:v16];
    [(HMDRemoteLoginAuthenticationRequest *)v19 setTargetedAccountType:0];
    v27 = @"kHMDRemoteLoginCompanionAuthenticationRequest";
    v21 = encodeRootObject();
    v28 = v21;
    v22 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

    objc_initWeak((id *)buf, v10);
    v23 = [(HMDRemoteLoginAuthentication *)v10 remoteMessageSender];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __63__HMDRemoteLoginInitiatorCompanionAuthentication__authenticate__block_invoke;
    v24[3] = &unk_264A2D490;
    objc_copyWeak(&v25, (id *)buf);
    [v23 sendRemoteMessageWithName:@"kHMDRemoteLoginCompanionAuthenticationRequest" payload:v22 responseHandler:v24];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __63__HMDRemoteLoginInitiatorCompanionAuthentication__authenticate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleAuthenticationResponse:v5 error:v6];
}

- (void)authenticate
{
  v3 = [(HMDRemoteLoginAuthentication *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__HMDRemoteLoginInitiatorCompanionAuthentication_authenticate__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __62__HMDRemoteLoginInitiatorCompanionAuthentication_authenticate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authenticate];
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDRemoteLoginAuthentication *)self sessionID];
  id v5 = [(HMDRemoteLoginInitiatorCompanionAuthentication *)self account];
  id v6 = [v3 stringWithFormat:@"[Init-Companion-Auth: Session: %@, Account: %@]", v4, v5];

  return v6;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    __int16 v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Dealloc %@", buf, 0x16u);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDRemoteLoginInitiatorCompanionAuthentication;
  [(HMDRemoteLoginInitiatorCompanionAuthentication *)&v7 dealloc];
}

- (HMDRemoteLoginInitiatorCompanionAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 account:(id)a8
{
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteLoginInitiatorCompanionAuthentication;
  v16 = [(HMDRemoteLoginInitiatorAuthentication *)&v19 initWithSessionID:a3 remoteDevice:a4 workQueue:a5 remoteMessageSender:a6 delegate:a7];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_account, a8);
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_114496 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_114496, &__block_literal_global_114497);
  }
  v2 = (void *)logCategory__hmf_once_v2_114498;
  return v2;
}

void __61__HMDRemoteLoginInitiatorCompanionAuthentication_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_114498;
  logCategory__hmf_once_v2_114498 = v0;
}

@end