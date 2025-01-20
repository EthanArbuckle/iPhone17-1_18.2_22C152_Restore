@interface HMDRemoteLoginInitiatorAuthenticationSession
- (HMDRemoteLoginInitiatorAuthentication)remoteAuthentication;
- (HMDRemoteLoginInitiatorAuthenticationSession)initWithSessionID:(id)a3 remoteAuthentication:(id)a4 completion:(id)a5;
- (id)completion;
- (id)description;
- (void)dealloc;
@end

@implementation HMDRemoteLoginInitiatorAuthenticationSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_remoteAuthentication, 0);
}

- (id)completion
{
  return self->_completion;
}

- (HMDRemoteLoginInitiatorAuthentication)remoteAuthentication
{
  return self->_remoteAuthentication;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMDRemoteLoginInitiatorSession *)self sessionID];
  v4 = [v2 stringWithFormat:@"[Login-Initiator-Auth-Session: %@]", v3];

  return v4;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
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
  v7.super_class = (Class)HMDRemoteLoginInitiatorAuthenticationSession;
  [(HMDRemoteLoginInitiatorAuthenticationSession *)&v7 dealloc];
}

- (HMDRemoteLoginInitiatorAuthenticationSession)initWithSessionID:(id)a3 remoteAuthentication:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDRemoteLoginInitiatorAuthenticationSession;
  v11 = [(HMDRemoteLoginInitiatorSession *)&v16 initWithSessionID:a3];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_remoteAuthentication, a4);
    v13 = _Block_copy(v10);
    id completion = v12->_completion;
    v12->_id completion = v13;
  }
  return v12;
}

@end