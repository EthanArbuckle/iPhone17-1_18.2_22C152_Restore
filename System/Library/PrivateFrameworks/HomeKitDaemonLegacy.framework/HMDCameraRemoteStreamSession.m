@interface HMDCameraRemoteStreamSession
+ (id)logCategory;
- (BOOL)containsState:(int64_t)a3;
- (HMDCameraRemoteStreamReceiverProtocol)streamReceiver;
- (HMDCameraRemoteStreamSenderProtocol)streamSender;
- (HMDCameraRemoteStreamSession)initWithSessionID:(id)a3 reachabilityPath:(unint64_t)a4 streamSender:(id)a5 streamReceiver:(id)a6 remoteCapabilities:(id)a7 streamPreference:(id)a8;
- (NSString)stateDescription;
- (id)logIdentifier;
- (unint64_t)streamState;
- (void)setStreamState:(unint64_t)a3;
- (void)updateState:(int64_t)a3;
@end

@implementation HMDCameraRemoteStreamSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamReceiver, 0);
  objc_storeStrong((id *)&self->_streamSender, 0);
}

- (void)setStreamState:(unint64_t)a3
{
  self->_streamState = a3;
}

- (unint64_t)streamState
{
  return self->_streamState;
}

- (HMDCameraRemoteStreamReceiverProtocol)streamReceiver
{
  return (HMDCameraRemoteStreamReceiverProtocol *)objc_getProperty(self, a2, 56, 1);
}

- (HMDCameraRemoteStreamSenderProtocol)streamSender
{
  return (HMDCameraRemoteStreamSenderProtocol *)objc_getProperty(self, a2, 48, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDCameraStreamSession *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (NSString)stateDescription
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v4 = 1;
  do
  {
    if ([(HMDCameraRemoteStreamSession *)self containsState:v4])
    {
      v5 = HMDCameraRemoteStreamSessionStateAsString(v4);
      [v3 addObject:v5];
    }
    BOOL v6 = v4 >= 5;
    v4 *= 2;
  }
  while (!v6);
  v7 = [v3 componentsJoinedByString:@", "];

  return (NSString *)v7;
}

- (BOOL)containsState:(int64_t)a3
{
  return ([(HMDCameraRemoteStreamSession *)self streamState] & a3) != 0;
}

- (void)updateState:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1D9452090]([(HMDCameraRemoteStreamSession *)self setStreamState:[(HMDCameraRemoteStreamSession *)self streamState] | a3]);
  BOOL v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = HMDCameraRemoteStreamSessionStateAsString(a3);
    v10 = [(HMDCameraRemoteStreamSession *)v6 stateDescription];
    int v11 = 138543874;
    v12 = v8;
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated with state %@ to %@", (uint8_t *)&v11, 0x20u);
  }
}

- (HMDCameraRemoteStreamSession)initWithSessionID:(id)a3 reachabilityPath:(unint64_t)a4 streamSender:(id)a5 streamReceiver:(id)a6 remoteCapabilities:(id)a7 streamPreference:(id)a8
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a7;
  id v19 = a3;
  BOOL v20 = isWatch();
  uint64_t v21 = 4;
  if (a4 != 3) {
    uint64_t v21 = 1;
  }
  if (a4 == 2) {
    uint64_t v21 = 3;
  }
  if (v20) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = v21;
  }
  v25.receiver = self;
  v25.super_class = (Class)HMDCameraRemoteStreamSession;
  v23 = [(HMDCameraStreamSession *)&v25 initWithSessionID:v19 streamingTierType:v22 remoteCapabilities:v18 streamPreference:v17];

  if (v23)
  {
    objc_storeStrong((id *)&v23->_streamSender, a5);
    objc_storeStrong((id *)&v23->_streamReceiver, a6);
    v23->_streamState = 0;
  }

  return v23;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_93754 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_93754, &__block_literal_global_93755);
  }
  v2 = (void *)logCategory__hmf_once_v2_93756;
  return v2;
}

uint64_t __43__HMDCameraRemoteStreamSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_93756;
  logCategory__hmf_once_v2_93756 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end