@interface HMDRemoteLoginInitiatorAuthentication
+ (id)logCategory;
- (HMDRemoteLoginInitiatorAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7;
- (HMDRemoteLoginInitiatorAuthenticationDelegate)delegate;
- (void)_handleAuthenticationResponse:(id)a3 error:(id)a4;
- (void)authenticate;
@end

@implementation HMDRemoteLoginInitiatorAuthentication

- (void).cxx_destruct
{
}

- (HMDRemoteLoginInitiatorAuthenticationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDRemoteLoginInitiatorAuthenticationDelegate *)WeakRetained;
}

- (void)_handleAuthenticationResponse:(id)a3 error:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = v6;
    v8 = 0;
  }
  else
  {
    v9 = +[HMDRemoteLoginAuthenticationResponse objWithDict:v16];
    v8 = v9;
    if (v9
      && ([v9 loggedInAccount], v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
    {
      uint64_t v11 = [v8 error];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    }
    v7 = (void *)v11;
  }
  v12 = [(HMDRemoteLoginInitiatorAuthentication *)self delegate];
  if ([v12 conformsToProtocol:&unk_1F2E15CE8]) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if (objc_opt_respondsToSelector())
  {
    v15 = [v8 loggedInAccount];
    [v14 didCompleteAuthentication:self error:v7 loggedInAccount:v15];
  }
}

- (void)authenticate
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMDRemoteLoginInitiatorAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7
{
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)HMDRemoteLoginInitiatorAuthentication;
  v13 = [(HMDRemoteLoginAuthentication *)&v16 initWithSessionID:a3 remoteDevice:a4 workQueue:a5 remoteMessageSender:a6];
  id v14 = v13;
  if (v13) {
    objc_storeWeak((id *)&v13->_delegate, v12);
  }

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_178556 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_178556, &__block_literal_global_178557);
  }
  v2 = (void *)logCategory__hmf_once_v1_178558;
  return v2;
}

uint64_t __52__HMDRemoteLoginInitiatorAuthentication_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_178558;
  logCategory__hmf_once_v1_178558 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end