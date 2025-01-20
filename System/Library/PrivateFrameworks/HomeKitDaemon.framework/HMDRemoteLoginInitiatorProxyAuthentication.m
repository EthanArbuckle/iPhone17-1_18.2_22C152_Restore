@interface HMDRemoteLoginInitiatorProxyAuthentication
+ (id)logCategory;
- (HMDRemoteLoginInitiatorProxyAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 authResults:(id)a8;
- (NSDictionary)authResults;
- (id)description;
- (void)_authenticate;
- (void)authenticate;
- (void)dealloc;
@end

@implementation HMDRemoteLoginInitiatorProxyAuthentication

- (void).cxx_destruct
{
}

- (NSDictionary)authResults
{
  return self->_authResults;
}

- (void)_authenticate
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v3 = [HMDRemoteLoginProxyAuthenticationRequest alloc];
  v4 = [(HMDRemoteLoginAuthentication *)self sessionID];
  v5 = [(HMRemoteLoginMessage *)v3 initWithSessionID:v4];

  v6 = [(HMDRemoteLoginInitiatorProxyAuthentication *)self authResults];
  v7 = objc_msgSend(v6, "hmf_stringForKey:", *MEMORY[0x263F29010]);
  [(HMDRemoteLoginProxyAuthenticationRequest *)v5 setUsername:v7];

  v8 = [(HMDRemoteLoginInitiatorProxyAuthentication *)self authResults];
  v9 = objc_msgSend(v8, "hmf_stringForKey:", *MEMORY[0x263F28FF8]);
  [(HMDRemoteLoginProxyAuthenticationRequest *)v5 setRawPassword:v9];

  v10 = [(HMDRemoteLoginInitiatorProxyAuthentication *)self authResults];
  v11 = objc_msgSend(v10, "hmf_stringForKey:", *MEMORY[0x263F28FF0]);
  [(HMDRemoteLoginProxyAuthenticationRequest *)v5 setPasswordToken:v11];

  v12 = [(HMDRemoteLoginInitiatorProxyAuthentication *)self authResults];
  v13 = objc_msgSend(v12, "hmf_stringForKey:", *MEMORY[0x263F28F58]);
  [(HMDRemoteLoginProxyAuthenticationRequest *)v5 setAltDSID:v13];

  v14 = (void *)MEMORY[0x230FBD990]([(HMDRemoteLoginAuthenticationRequest *)v5 setTargetedAccountType:0]);
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    v18 = [(HMDRemoteLoginProxyAuthenticationRequest *)v5 username];
    v19 = [(HMDRemoteLoginProxyAuthenticationRequest *)v5 passwordToken];
    v20 = [(HMDRemoteLoginProxyAuthenticationRequest *)v5 altDSID];
    *(_DWORD *)buf = 138544130;
    v33 = v17;
    __int16 v34 = 2112;
    v35 = v18;
    __int16 v36 = 2112;
    v37 = v19;
    __int16 v38 = 2112;
    v39 = v20;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Received username %@, pet %@, alt-dsid %@", buf, 0x2Au);
  }
  v21 = (void *)MEMORY[0x230FBD990]();
  v22 = v15;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = HMFGetLogIdentifier();
    v25 = [(HMDRemoteLoginProxyAuthenticationRequest *)v5 rawPassword];
    [v25 length];
    v26 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    v33 = v24;
    __int16 v34 = 2112;
    v35 = v26;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Received password: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v22);
  v27 = [(HMDRemoteLoginAuthentication *)v22 remoteMessageSender];
  v28 = [(HMDRemoteLoginProxyAuthenticationRequest *)v5 messageName];
  v29 = [(HMDRemoteLoginProxyAuthenticationRequest *)v5 messagePayload];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __59__HMDRemoteLoginInitiatorProxyAuthentication__authenticate__block_invoke;
  v30[3] = &unk_264A2D490;
  objc_copyWeak(&v31, (id *)buf);
  [v27 sendRemoteMessageWithName:v28 payload:v29 responseHandler:v30];

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

void __59__HMDRemoteLoginInitiatorProxyAuthentication__authenticate__block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __58__HMDRemoteLoginInitiatorProxyAuthentication_authenticate__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __58__HMDRemoteLoginInitiatorProxyAuthentication_authenticate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _authenticate];
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMDRemoteLoginAuthentication *)self sessionID];
  v4 = [v2 stringWithFormat:@"[Init-Proxy-Auth: Session: %@]", v3];

  return v4;
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
  v7.super_class = (Class)HMDRemoteLoginInitiatorProxyAuthentication;
  [(HMDRemoteLoginInitiatorProxyAuthentication *)&v7 dealloc];
}

- (HMDRemoteLoginInitiatorProxyAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7 authResults:(id)a8
{
  id v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteLoginInitiatorProxyAuthentication;
  v16 = [(HMDRemoteLoginInitiatorAuthentication *)&v19 initWithSessionID:a3 remoteDevice:a4 workQueue:a5 remoteMessageSender:a6 delegate:a7];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_authResults, a8);
  }

  return v17;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1 != -1) {
    dispatch_once(&logCategory__hmf_once_t1, &__block_literal_global_359);
  }
  v2 = (void *)logCategory__hmf_once_v2;
  return v2;
}

void __57__HMDRemoteLoginInitiatorProxyAuthentication_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2;
  logCategory__hmf_once_v2 = v0;
}

@end