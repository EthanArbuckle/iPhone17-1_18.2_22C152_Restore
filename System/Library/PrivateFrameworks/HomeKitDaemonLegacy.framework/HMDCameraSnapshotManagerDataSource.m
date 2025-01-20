@interface HMDCameraSnapshotManagerDataSource
- (BOOL)supportsCameraSnapshotRequestViaRelay;
- (id)createLocalSnapshotSessionWithID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 reachabilityPath:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9 snapshotForNotification:(BOOL)a10;
- (id)createSnapshotLocalWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 snapshotRequestHandler:(id)a8;
- (id)createSnapshotRemoteRelayReceiverWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8 snapshotRequestHandler:(id)a9 residentMessageHandler:(id)a10 remoteDevice:(id)a11;
@end

@implementation HMDCameraSnapshotManagerDataSource

- (id)createSnapshotLocalWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 snapshotRequestHandler:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [[HMDCameraSnapshotLocal alloc] initWithSessionID:v18 workQueue:v17 accessory:v16 delegate:v15 delegateQueue:v14 snapshotRequestHandler:v13];

  return v19;
}

- (id)createLocalSnapshotSessionWithID:(id)a3 accessory:(id)a4 snapshotGetter:(id)a5 message:(id)a6 waitPeriod:(double)a7 reachabilityPath:(unint64_t)a8 cameraLocallyReachable:(BOOL)a9 snapshotForNotification:(BOOL)a10
{
  BOOL v10 = a9;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  LOBYTE(v22) = a10;
  v20 = [[HMDSnapshotLocalSession alloc] initWithSessionID:v19 accessory:v18 snapshotGetter:v17 message:v16 waitPeriod:a8 reachabilityPath:v10 cameraLocallyReachable:a7 snapshotForNotification:v22];

  return v20;
}

- (id)createSnapshotRemoteRelayReceiverWithSessionID:(id)a3 workQueue:(id)a4 accessory:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 uniqueIdentifier:(id)a8 snapshotRequestHandler:(id)a9 residentMessageHandler:(id)a10 remoteDevice:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  v26 = [[HMDCameraSnapshotRemoteRelayReceiver alloc] initWithSessionID:v25 workQueue:v24 accessory:v23 delegate:v22 delegateQueue:v21 uniqueIdentifier:v20 snapshotRequestHandler:v19 residentMessageHandler:v18 remoteDevice:v17];

  return v26;
}

- (BOOL)supportsCameraSnapshotRequestViaRelay
{
  return +[HMDDeviceCapabilities supportsCameraSnapshotRequestViaRelay];
}

@end