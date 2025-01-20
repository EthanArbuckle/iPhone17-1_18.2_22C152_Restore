@interface HMDCameraIDSDeviceConnectionReceiver
+ (id)logCategory;
- (HMDCameraIDSDeviceConnectionReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5;
- (HMDCameraIDSDeviceConnectionReceiverDelegate)delegate;
- (IDSSession)session;
- (id)logIdentifier;
- (int)remoteAudioSocket;
- (int)remoteVideoSocket;
- (void)_callSessionEndedWithError:(id)a3;
- (void)_socketOpenedWithError:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUpRemoteConnectionWithDevice:(id)a3;
@end

@implementation HMDCameraIDSDeviceConnectionReceiver

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraIDSDeviceConnectionReceiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraIDSDeviceConnectionReceiverDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraIDSDeviceConnection *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)_callSessionEndedWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling didEndSession delegate with error %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(HMDCameraIDSDeviceConnectionReceiver *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 deviceConnectionReceiver:v7 didEndSessionWithError:v4];
  }
}

- (void)_socketOpenedWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling didSetup delegate with error %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(HMDCameraIDSDeviceConnectionReceiver *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 deviceConnectionReceiver:v7 didSetUpWithError:v4];
  }
}

- (int)remoteAudioSocket
{
  v3 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraIDSDeviceConnection *)self watchAudioConnection];
  LODWORD(v3) = [v4 socket];

  return (int)v3;
}

- (int)remoteVideoSocket
{
  v3 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraIDSDeviceConnection *)self watchVideoConnection];
  LODWORD(v3) = [v4 socket];

  return (int)v3;
}

- (void)setUpRemoteConnectionWithDevice:(id)a3
{
  id v5 = a3;
  id v4 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDCameraIDSDeviceConnection *)self _createStreamSocketWithDevice:v5];
}

- (IDSSession)session
{
  return 0;
}

- (HMDCameraIDSDeviceConnectionReceiver)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v9)
  {
LABEL_7:
    v16 = (void *)_HMFPreconditionFailure();
    return (HMDCameraIDSDeviceConnectionReceiver *)+[HMDCameraIDSDeviceConnectionReceiver logCategory];
  }
  int v11 = v10;
  v12 = +[HMDIDSServiceManager sharedManager];
  __int16 v13 = [v12 proxyService];
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraIDSDeviceConnectionReceiver;
  id v14 = [(HMDCameraIDSDeviceConnection *)&v18 initWithSessionID:v8 workQueue:v9 idsProxyStreamService:v13];

  if (v14) {
    objc_storeWeak((id *)&v14->_delegate, v11);
  }

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_31897 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_31897, &__block_literal_global_31898);
  }
  v2 = (void *)logCategory__hmf_once_v3_31899;
  return v2;
}

void __51__HMDCameraIDSDeviceConnectionReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_31899;
  logCategory__hmf_once_v3_31899 = v0;
}

@end