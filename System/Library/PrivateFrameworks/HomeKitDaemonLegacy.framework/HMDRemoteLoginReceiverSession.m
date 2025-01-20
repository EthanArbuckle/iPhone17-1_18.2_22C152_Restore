@interface HMDRemoteLoginReceiverSession
- (HMDRemoteLoginAuthentication)remoteAuthentication;
- (HMDRemoteLoginReceiverSession)initWithSessionID:(id)a3 remoteAuthentication:(id)a4 completion:(id)a5;
- (NSString)sessionID;
- (id)completion;
- (id)description;
- (void)dealloc;
@end

@implementation HMDRemoteLoginReceiverSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_remoteAuthentication, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (id)completion
{
  return self->_completion;
}

- (HMDRemoteLoginAuthentication)remoteAuthentication
{
  return self->_remoteAuthentication;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMDRemoteLoginReceiverSession *)self sessionID];
  v4 = [v2 stringWithFormat:@"[Login-Receiver-Session: %@]", v3];

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
  v7.super_class = (Class)HMDRemoteLoginReceiverSession;
  [(HMDRemoteLoginReceiverSession *)&v7 dealloc];
}

- (HMDRemoteLoginReceiverSession)initWithSessionID:(id)a3 remoteAuthentication:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDRemoteLoginReceiverSession;
  uint64_t v12 = [(HMDRemoteLoginReceiverSession *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionID, a3);
    objc_storeStrong((id *)&v13->_remoteAuthentication, a4);
    v14 = _Block_copy(v11);
    id completion = v13->_completion;
    v13->_id completion = v14;
  }
  return v13;
}

@end