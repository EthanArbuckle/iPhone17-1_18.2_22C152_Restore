@interface HMDCameraStreamControlMessageHandlerDataSource
- (BOOL)isResidentCapable;
- (BOOL)supportsBidirectionalAudioForCameraStreaming;
- (BOOL)supportsReceivingRemoteCameraStream;
- (HMDCameraNetworkConfig)localNetworkConfig;
- (id)createDynamicActivityAttributionPublisher;
- (id)createLocalStreamControlManagerWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 accessory:(id)a9 streamManagementService:(id)a10 localNetworkConfig:(id)a11 remoteCapabilities:(id)a12 supportedConfigCache:(id)a13 streamPreference:(id)a14;
- (id)createRemoteStreamControlManagerWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 accessory:(id)a9 streamManagementService:(id)a10 remoteCapabilities:(id)a11 profileUniqueIdentifier:(id)a12 residentMessageHandler:(id)a13 remoteAccessDevice:(id)a14 streamPreference:(id)a15;
- (id)createStreamManagerSessionWithSessionID:(id)a3 destinationID:(id)a4 streamClientConnection:(id)a5 streamControlManager:(id)a6 setupWaitPeriod:(double)a7;
@end

@implementation HMDCameraStreamControlMessageHandlerDataSource

- (id)createDynamicActivityAttributionPublisher
{
  v2 = objc_alloc_init(HMDDynamicActivityAttributionPublisher);
  return v2;
}

- (id)createStreamManagerSessionWithSessionID:(id)a3 destinationID:(id)a4 streamClientConnection:(id)a5 streamControlManager:(id)a6 setupWaitPeriod:(double)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [[HMDCameraStreamManagerSession alloc] initWithSessionID:v14 destinationID:v13 streamClientConnection:v12 streamControlManager:v11 setupWaitPeriod:a7];

  return v15;
}

- (id)createRemoteStreamControlManagerWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 accessory:(id)a9 streamManagementService:(id)a10 remoteCapabilities:(id)a11 profileUniqueIdentifier:(id)a12 residentMessageHandler:(id)a13 remoteAccessDevice:(id)a14 streamPreference:(id)a15
{
  id v30 = a15;
  id v27 = a14;
  id v26 = a13;
  id v35 = a12;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v25 = a8;
  id v20 = a7;
  id v29 = a5;
  id v21 = a4;
  id v33 = a3;
  v22 = v20;
  v23 = [[HMDCameraRemoteStreamControlManager alloc] initWithSessionID:v33 workQueue:v21 streamSnapshotHandler:v29 reachabilityPath:a6 device:v20 delegate:v25 accessory:v19 streamManagementService:v18 remoteCapabilities:v17 profileUniqueIdentifier:v35 residentMessageHandler:v26 remoteAccessDevice:v27 streamPreference:v30];

  return v23;
}

- (id)createLocalStreamControlManagerWithSessionID:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 reachabilityPath:(unint64_t)a6 device:(id)a7 delegate:(id)a8 accessory:(id)a9 streamManagementService:(id)a10 localNetworkConfig:(id)a11 remoteCapabilities:(id)a12 supportedConfigCache:(id)a13 streamPreference:(id)a14
{
  id v29 = a14;
  id v27 = a13;
  id v26 = a12;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v24 = a8;
  id v20 = a7;
  id v25 = a5;
  id v21 = a4;
  id v22 = a3;
  v32 = [[HMDCameraLocalStreamControlManager alloc] initWithSessionID:v22 workQueue:v21 streamSnapshotHandler:v25 reachabilityPath:a6 device:v20 delegate:v24 accessory:v19 streamManagementService:v18 localNetworkConfig:v17 remoteCapabilities:v26 supportedConfigCache:v27 streamPreference:v29];

  return v32;
}

- (HMDCameraNetworkConfig)localNetworkConfig
{
  return (HMDCameraNetworkConfig *)+[HMDCameraNetworkConfig localIPAddress];
}

- (BOOL)isResidentCapable
{
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  char v3 = [v2 isResidentCapable];

  return v3;
}

- (BOOL)supportsBidirectionalAudioForCameraStreaming
{
  return +[HMDDeviceCapabilities supportsBidirectionalAudioForCameraStreaming];
}

- (BOOL)supportsReceivingRemoteCameraStream
{
  return +[HMDDeviceCapabilities supportsReceivingRemoteCameraStream];
}

@end