@interface HMDRemoteLoginReceiverProxyAuthentication
+ (id)logCategory;
- (HMDRemoteLoginProxyAuthenticationRequest)request;
- (HMDRemoteLoginReceiverProxyAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 request:(id)a8;
- (id)description;
- (void)_authenticate;
- (void)authenticate;
- (void)dealloc;
@end

@implementation HMDRemoteLoginReceiverProxyAuthentication

- (void).cxx_destruct
{
}

- (HMDRemoteLoginProxyAuthenticationRequest)request
{
  return self->_request;
}

- (void)_authenticate
{
  v3 = [(HMDRemoteLoginReceiverProxyAuthentication *)self request];
  int64_t v4 = +[HMDRemoteLoginUtilities serviceTypeForAccountService:](HMDRemoteLoginUtilities, "serviceTypeForAccountService:", [v3 targetedAccountType]);

  id v10 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  v5 = [(HMDRemoteLoginReceiverProxyAuthentication *)self request];
  v6 = [v5 username];
  [v10 setUsername:v6];

  v7 = [(HMDRemoteLoginReceiverProxyAuthentication *)self request];
  v8 = [v7 rawPassword];
  [v10 _setPassword:v8];

  [v10 setIsUsernameEditable:0];
  [v10 setShouldAllowAppleIDCreation:0];
  [v10 setServiceType:v4];
  [v10 setAuthenticationType:1];
  [v10 setShouldUpdatePersistentServiceTokens:1];
  [v10 _setProxyingForApp:1];
  v9 = [(HMDRemoteLoginReceiverProxyAuthentication *)self request];
  -[HMDRemoteLoginReceiverAuthentication _authenticateAccount:targetedAccountType:](self, "_authenticateAccount:targetedAccountType:", v10, [v9 targetedAccountType]);
}

- (void)authenticate
{
  v3 = [(HMDRemoteLoginAuthentication *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__HMDRemoteLoginReceiverProxyAuthentication_authenticate__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __57__HMDRemoteLoginReceiverProxyAuthentication_authenticate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authenticate];
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(HMDRemoteLoginAuthentication *)self sessionID];
  v5 = [(HMDRemoteLoginReceiverProxyAuthentication *)self request];
  v6 = [v3 stringWithFormat:@"[Recv-Proxy-Auth: Session: %@, Request: %@]", v4, v5];

  return v6;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  int64_t v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    __int16 v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Dealloc %@", buf, 0x16u);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDRemoteLoginReceiverProxyAuthentication;
  [(HMDRemoteLoginReceiverProxyAuthentication *)&v7 dealloc];
}

- (HMDRemoteLoginReceiverProxyAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 request:(id)a8
{
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteLoginReceiverProxyAuthentication;
  v16 = [(HMDRemoteLoginReceiverAuthentication *)&v19 initWithSessionID:a3 remoteDevice:a4 workQueue:a5 remoteMessageSender:a6 delegate:a7];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_request, a8);
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_61182 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_61182, &__block_literal_global_61183);
  }
  v2 = (void *)logCategory__hmf_once_v2_61184;
  return v2;
}

uint64_t __56__HMDRemoteLoginReceiverProxyAuthentication_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_61184;
  logCategory__hmf_once_v2_61184 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end