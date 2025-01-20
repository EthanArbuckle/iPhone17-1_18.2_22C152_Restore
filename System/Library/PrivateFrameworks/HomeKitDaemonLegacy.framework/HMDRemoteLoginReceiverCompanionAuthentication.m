@interface HMDRemoteLoginReceiverCompanionAuthentication
+ (id)logCategory;
- (HMDRemoteLoginCompanionAuthenticationRequest)request;
- (HMDRemoteLoginReceiverCompanionAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 request:(id)a8;
- (id)description;
- (void)_authenticate;
- (void)_authenticateAccount:(id)a3 alreadyExists:(BOOL)a4 withCompanionDevice:(id)a5;
- (void)authenticate;
- (void)dealloc;
@end

@implementation HMDRemoteLoginReceiverCompanionAuthentication

- (void).cxx_destruct
{
}

- (HMDRemoteLoginCompanionAuthenticationRequest)request
{
  return self->_request;
}

- (void)_authenticateAccount:(id)a3 alreadyExists:(BOOL)a4 withCompanionDevice:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1D9452090]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    v14 = [(HMDRemoteLoginReceiverCompanionAuthentication *)v11 request];
    v15 = HMDRemoteLoginAccountTypeAsString([v14 targetedAccountType]);
    int v24 = 138544130;
    v25 = v13;
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    v29 = v15;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Authenticating the account %@, service type %@, with companion device: %@", (uint8_t *)&v24, 0x2Au);
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  v17 = [v8 username];
  [v16 setUsername:v17];

  [v16 setIsUsernameEditable:0];
  [v16 setShouldAllowAppleIDCreation:0];
  v18 = [(HMDRemoteLoginReceiverCompanionAuthentication *)v11 request];
  objc_msgSend(v16, "setServiceType:", +[HMDRemoteLoginUtilities serviceTypeForAccountService:](HMDRemoteLoginUtilities, "serviceTypeForAccountService:", objc_msgSend(v18, "targetedAccountType")));

  [v16 setAuthenticationType:1];
  [v16 setShouldUpdatePersistentServiceTokens:1];
  if (!a4)
  {
    [v16 setCompanionDevice:v9];
    v19 = [HMDRemoteLoginAnisetteDataProvider alloc];
    v20 = [(HMDRemoteLoginAuthentication *)v11 sessionID];
    v21 = [(HMDRemoteLoginAuthentication *)v11 remoteMessageSender];
    v22 = [(HMDRemoteLoginAnisetteDataProvider *)v19 initWithSessionID:v20 remoteMessageSender:v21];
    [v16 setAnisetteDataProvider:v22];
  }
  [v16 _setProxyingForApp:1];
  v23 = [(HMDRemoteLoginReceiverCompanionAuthentication *)v11 request];
  -[HMDRemoteLoginReceiverAuthentication _authenticateAccount:targetedAccountType:](v11, "_authenticateAccount:targetedAccountType:", v16, [v23 targetedAccountType]);
}

- (void)_authenticate
{
  v3 = [(HMDRemoteLoginReceiverCompanionAuthentication *)self request];
  v4 = [v3 account];

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__HMDRemoteLoginReceiverCompanionAuthentication__authenticate__block_invoke;
  v6[3] = &unk_1E6A0BA08;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(HMDRemoteLoginReceiverAuthentication *)self _saveRemoteVerifiedAccount:v5 completion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__HMDRemoteLoginReceiverCompanionAuthentication__authenticate__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (a2)
  {
    v10 = [WeakRetained request];
    v11 = [v10 companionDevice];

    [v9 _authenticateAccount:*(void *)(a1 + 32) alreadyExists:a3 withCompanionDevice:v11];
  }
  else
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = v9;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v15;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Save-remote-verified-account failed with error %@", (uint8_t *)&v16, 0x16u);
    }
    [v13 _completedAuthenticationRequest:v7 loggedInAccount:0];
  }
}

- (void)authenticate
{
  v3 = [(HMDRemoteLoginAuthentication *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HMDRemoteLoginReceiverCompanionAuthentication_authenticate__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __61__HMDRemoteLoginReceiverCompanionAuthentication_authenticate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authenticate];
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMDRemoteLoginAuthentication *)self sessionID];
  id v5 = [(HMDRemoteLoginReceiverCompanionAuthentication *)self request];
  v6 = [v5 account];
  id v7 = [v3 stringWithFormat:@"[Recv-Companion-Auth: Session: %@, Account: %@]", v4, v6];

  return v7;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v9 = v6;
    __int16 v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Dealloc %@", buf, 0x16u);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDRemoteLoginReceiverCompanionAuthentication;
  [(HMDRemoteLoginReceiverCompanionAuthentication *)&v7 dealloc];
}

- (HMDRemoteLoginReceiverCompanionAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 request:(id)a8
{
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteLoginReceiverCompanionAuthentication;
  int v16 = [(HMDRemoteLoginReceiverAuthentication *)&v19 initWithSessionID:a3 remoteDevice:a4 workQueue:a5 remoteMessageSender:a6 delegate:a7];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_request, a8);
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_51995 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_51995, &__block_literal_global_51996);
  }
  v2 = (void *)logCategory__hmf_once_v2_51997;
  return v2;
}

uint64_t __60__HMDRemoteLoginReceiverCompanionAuthentication_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_51997;
  logCategory__hmf_once_v2_51997 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end