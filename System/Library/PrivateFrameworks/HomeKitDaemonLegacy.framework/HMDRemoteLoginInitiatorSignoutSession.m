@interface HMDRemoteLoginInitiatorSignoutSession
- (id)description;
- (void)dealloc;
@end

@implementation HMDRemoteLoginInitiatorSignoutSession

- (id)description
{
  v2 = NSString;
  v3 = [(HMDRemoteLoginInitiatorSession *)self sessionID];
  v4 = [v2 stringWithFormat:@"[Login-Initiator-Signout-Session: %@]", v3];

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
  v7.super_class = (Class)HMDRemoteLoginInitiatorSignoutSession;
  [(HMDRemoteLoginInitiatorSignoutSession *)&v7 dealloc];
}

@end