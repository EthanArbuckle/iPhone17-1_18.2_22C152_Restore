@interface HMDCameraIDSSessionInviterDeviceVerifier
+ (id)logCategory;
- (BOOL)canAcceptInvitationForSessionWithIdentifier:(id)a3;
- (BOOL)canAcceptInvitationFromDeviceWithHandle:(id)a3;
- (HMDCameraIDSSessionInviterDeviceVerifier)initWithSessionID:(id)a3 expectedInviter:(id)a4;
- (HMDDevice)expectedInviter;
- (NSString)sessionID;
- (id)logIdentifier;
@end

@implementation HMDCameraIDSSessionInviterDeviceVerifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedInviter, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (HMDDevice)expectedInviter
{
  return (HMDDevice *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDCameraIDSSessionInviterDeviceVerifier *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (BOOL)canAcceptInvitationForSessionWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraIDSSessionInviterDeviceVerifier *)self sessionID];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)canAcceptInvitationFromDeviceWithHandle:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraIDSSessionInviterDeviceVerifier *)self expectedInviter];
  char v6 = [v5 handles];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "isEqual:", v4, (void)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (HMDCameraIDSSessionInviterDeviceVerifier)initWithSessionID:(id)a3 expectedInviter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
LABEL_7:
    long long v13 = (void *)_HMFPreconditionFailure();
    return (HMDCameraIDSSessionInviterDeviceVerifier *)+[HMDCameraIDSSessionInviterDeviceVerifier logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraIDSSessionInviterDeviceVerifier;
  v10 = [(HMDCameraIDSSessionInviterDeviceVerifier *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sessionID, a3);
    objc_storeStrong((id *)&v11->_expectedInviter, a4);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_62285 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_62285, &__block_literal_global_62286);
  }
  v2 = (void *)logCategory__hmf_once_v1_62287;
  return v2;
}

uint64_t __55__HMDCameraIDSSessionInviterDeviceVerifier_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_62287;
  logCategory__hmf_once_v1_62287 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end