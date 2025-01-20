@interface HMDCameraStreamManagerSession
+ (id)logCategory;
- (BOOL)canStartWithError:(id *)a3;
- (HMDCameraStreamControlManagerProtocol)streamControlManager;
- (HMDCameraStreamManagerSession)initWithSessionID:(id)a3 destinationID:(id)a4 streamClientConnection:(id)a5 streamControlManager:(id)a6 setupWaitPeriod:(double)a7;
- (HMDCameraStreamManagerSession)initWithSessionID:(id)a3 destinationID:(id)a4 streamClientConnection:(id)a5 streamControlManager:(id)a6 streamSetupTimer:(id)a7;
- (HMDCameraStreamSessionID)sessionID;
- (HMDXPCClientConnection)streamClientConnection;
- (HMFMessage)currentMessage;
- (HMFTimer)streamSetupTimer;
- (NSString)destinationID;
- (id)logIdentifier;
- (void)setCurrentMessage:(id)a3;
- (void)setStreamClientConnection:(id)a3;
@end

@implementation HMDCameraStreamManagerSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMessage, 0);
  objc_storeStrong((id *)&self->_streamSetupTimer, 0);
  objc_storeStrong((id *)&self->_streamControlManager, 0);
  objc_storeStrong((id *)&self->_streamClientConnection, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (void)setCurrentMessage:(id)a3
{
}

- (HMFMessage)currentMessage
{
  return (HMFMessage *)objc_getProperty(self, a2, 48, 1);
}

- (HMFTimer)streamSetupTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (HMDCameraStreamControlManagerProtocol)streamControlManager
{
  return (HMDCameraStreamControlManagerProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStreamClientConnection:(id)a3
{
}

- (HMDXPCClientConnection)streamClientConnection
{
  return (HMDXPCClientConnection *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)destinationID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCameraStreamSessionID)sessionID
{
  return (HMDCameraStreamSessionID *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDCameraStreamManagerSession *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (BOOL)canStartWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = [(HMDCameraStreamManagerSession *)self destinationID];

  if (!v5) {
    return 1;
  }
  v6 = +[HMDDeviceCapabilities deviceCapabilities];
  int v7 = [v6 isResidentCapable];

  if (!v7) {
    return 1;
  }
  v8 = +[HMDCameraRemoteStreamTracker sharedTracker];
  char v9 = [v8 startTrackingStreamSession:self];

  if (v9) {
    return 1;
  }
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    v17 = v14;
    __int16 v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Stream tracker cannot start stream session: %@", (uint8_t *)&v16, 0x16u);
  }
  if (!a3) {
    return 0;
  }
  id v15 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1018];
  BOOL result = 0;
  *a3 = v15;
  return result;
}

- (HMDCameraStreamManagerSession)initWithSessionID:(id)a3 destinationID:(id)a4 streamClientConnection:(id)a5 streamControlManager:(id)a6 streamSetupTimer:(id)a7
{
  v12 = (HMDCameraStreamSessionID *)a3;
  id v13 = a4;
  v14 = (HMDXPCClientConnection *)a5;
  id v15 = (HMDCameraStreamControlManagerProtocol *)a6;
  int v16 = (HMFTimer *)a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  if (!v15)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v17 = v16;
  if (v16)
  {
    v36.receiver = self;
    v36.super_class = (Class)HMDCameraStreamManagerSession;
    __int16 v18 = [(HMDCameraStreamManagerSession *)&v36 init];
    sessionID = v18->_sessionID;
    v18->_sessionID = v12;
    uint64_t v20 = v12;

    uint64_t v21 = [v13 copy];
    destinationID = v18->_destinationID;
    v18->_destinationID = (NSString *)v21;

    streamClientConnection = v18->_streamClientConnection;
    v18->_streamClientConnection = v14;
    v24 = v14;

    streamControlManager = v18->_streamControlManager;
    v18->_streamControlManager = v15;
    v26 = v15;

    streamSetupTimer = v18->_streamSetupTimer;
    v18->_streamSetupTimer = v17;

    return v18;
  }
LABEL_7:
  v29 = (HMDCameraStreamManagerSession *)_HMFPreconditionFailure();
  return [(HMDCameraStreamManagerSession *)v29 initWithSessionID:v31 destinationID:v32 streamClientConnection:v33 streamControlManager:v34 setupWaitPeriod:v35];
}

- (HMDCameraStreamManagerSession)initWithSessionID:(id)a3 destinationID:(id)a4 streamClientConnection:(id)a5 streamControlManager:(id)a6 setupWaitPeriod:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_6;
  }
  int v16 = v15;
  if (!v15)
  {
LABEL_6:
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (a7 > 0.0)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:a7];
    __int16 v18 = [(HMDCameraStreamManagerSession *)self initWithSessionID:v12 destinationID:v13 streamClientConnection:v14 streamControlManager:v16 streamSetupTimer:v17];

    return v18;
  }
LABEL_7:
  uint64_t v20 = (void *)_HMFPreconditionFailure();
  return (HMDCameraStreamManagerSession *)+[HMDCameraStreamManagerSession logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_8047 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_8047, &__block_literal_global_8048);
  }
  v2 = (void *)logCategory__hmf_once_v2_8049;
  return v2;
}

void __44__HMDCameraStreamManagerSession_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_8049;
  logCategory__hmf_once_v2_8049 = v0;
}

@end