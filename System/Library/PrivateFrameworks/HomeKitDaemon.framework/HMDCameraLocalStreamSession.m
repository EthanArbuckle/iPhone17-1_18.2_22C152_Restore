@interface HMDCameraLocalStreamSession
+ (id)logCategory;
- (BOOL)containsState:(int64_t)a3;
- (HMDCameraLocalStreamSession)initWithSessionID:(id)a3 reachabilityPath:(unint64_t)a4 streamSender:(id)a5 remoteCapabilities:(id)a6 localNetworkConfig:(id)a7 streamPreference:(id)a8;
- (HMDCameraMediaParameterSelection)parameterSelection;
- (HMDCameraNetworkConfig)localNetworkConfig;
- (HMDCameraRemoteStreamSenderProtocol)streamSender;
- (NSString)stateDescription;
- (id)logIdentifier;
- (unint64_t)streamState;
- (void)setParameterSelection:(id)a3;
- (void)setStreamState:(unint64_t)a3;
- (void)updateState:(int64_t)a3;
@end

@implementation HMDCameraLocalStreamSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localNetworkConfig, 0);
  objc_storeStrong((id *)&self->_parameterSelection, 0);
  objc_storeStrong((id *)&self->_streamSender, 0);
}

- (HMDCameraNetworkConfig)localNetworkConfig
{
  return (HMDCameraNetworkConfig *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStreamState:(unint64_t)a3
{
  self->_streamState = a3;
}

- (unint64_t)streamState
{
  return self->_streamState;
}

- (void)setParameterSelection:(id)a3
{
}

- (HMDCameraMediaParameterSelection)parameterSelection
{
  return (HMDCameraMediaParameterSelection *)objc_getProperty(self, a2, 56, 1);
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
  v3 = [MEMORY[0x263EFF980] array];
  unint64_t v4 = 1;
  do
  {
    if ([(HMDCameraLocalStreamSession *)self containsState:v4])
    {
      v5 = HMDCameraLocalStreamSessionStateAsString(v4);
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
  return ([(HMDCameraLocalStreamSession *)self streamState] & a3) != 0;
}

- (void)updateState:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x230FBD990]([(HMDCameraLocalStreamSession *)self setStreamState:[(HMDCameraLocalStreamSession *)self streamState] | a3]);
  BOOL v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = HMDCameraLocalStreamSessionStateAsString(a3);
    v10 = [(HMDCameraLocalStreamSession *)v6 stateDescription];
    int v11 = 138543874;
    v12 = v8;
    __int16 v13 = 2112;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated with state %@ to %@", (uint8_t *)&v11, 0x20u);
  }
}

- (HMDCameraLocalStreamSession)initWithSessionID:(id)a3 reachabilityPath:(unint64_t)a4 streamSender:(id)a5 remoteCapabilities:(id)a6 localNetworkConfig:(id)a7 streamPreference:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (isWatch())
  {
    uint64_t v18 = 0;
  }
  else if (isiPadDevice() || isAppleTV())
  {
    uint64_t v18 = 2;
  }
  else
  {
    uint64_t v18 = 1;
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDCameraLocalStreamSession;
  v19 = [(HMDCameraStreamSession *)&v24 initWithSessionID:v13 streamingTierType:v18 remoteCapabilities:v15 streamPreference:v17];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_streamSender, a5);
    v20->_streamState = 0;
    v21 = [(HMDCameraParameterSelection *)[HMDCameraMediaParameterSelection alloc] initWithSessionID:v13];
    parameterSelection = v20->_parameterSelection;
    v20->_parameterSelection = v21;

    objc_storeStrong((id *)&v20->_localNetworkConfig, a7);
  }

  return v20;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_234255 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_234255, &__block_literal_global_234256);
  }
  v2 = (void *)logCategory__hmf_once_v2_234257;
  return v2;
}

void __42__HMDCameraLocalStreamSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_234257;
  logCategory__hmf_once_v2_234257 = v0;
}

@end