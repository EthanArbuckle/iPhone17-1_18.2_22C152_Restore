@interface HMDCameraIDSDeviceConnectionSender
+ (id)logCategory;
- (AVCPacketRelay)audioPacketRelay;
- (AVCPacketRelay)videoPacketRelay;
- (HMDCameraIDSDeviceConnectionSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 delegate:(id)a6;
- (HMDCameraIDSDeviceConnectionSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 delegate:(id)a6 idsProxyStreamService:(id)a7;
- (HMDCameraIDSDeviceConnectionSenderDelegate)delegate;
- (HMDDevice)device;
- (HMFOSTransaction)packetRelayTransaction;
- (NSNumber)mtu;
- (id)logIdentifier;
- (void)_callSessionEndedWithError:(id)a3;
- (void)_socketOpenedWithError:(id)a3;
- (void)_startAudioPacketRelay:(int)a3 ipAddress:(id)a4 port:(unint64_t)a5;
- (void)_startVideoPacketRelay:(int)a3 ipAddress:(id)a4 port:(unint64_t)a5;
- (void)dealloc;
- (void)openRelaySession;
- (void)setAudioPacketRelay:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPacketRelayTransaction:(id)a3;
- (void)setVideoPacketRelay:(id)a3;
- (void)startPacketRelayWithIDSDeviceSession:(id)a3 cameraVideoSSRC:(unsigned int)a4 cameraAudioSSRC:(unsigned int)a5;
- (void)startPacketRelayWithVideoSocket:(int)a3 videoNetworkConfig:(id)a4 cameraVideoSSRC:(unsigned int)a5 audioSocket:(int)a6 audioNetworkConfig:(id)a7 cameraAudioSSRC:(unsigned int)a8;
@end

@implementation HMDCameraIDSDeviceConnectionSender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetRelayTransaction, 0);
  objc_storeStrong((id *)&self->_audioPacketRelay, 0);
  objc_storeStrong((id *)&self->_videoPacketRelay, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPacketRelayTransaction:(id)a3
{
}

- (HMFOSTransaction)packetRelayTransaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAudioPacketRelay:(id)a3
{
}

- (AVCPacketRelay)audioPacketRelay
{
  return (AVCPacketRelay *)objc_getProperty(self, a2, 128, 1);
}

- (void)setVideoPacketRelay:(id)a3
{
}

- (AVCPacketRelay)videoPacketRelay
{
  return (AVCPacketRelay *)objc_getProperty(self, a2, 120, 1);
}

- (HMDDevice)device
{
  return (HMDDevice *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraIDSDeviceConnectionSenderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraIDSDeviceConnectionSenderDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraIDSDeviceConnection *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)_callSessionEndedWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling didEndSession delegate with error %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(HMDCameraIDSDeviceConnectionSender *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 deviceConnectionSender:v7 didEndSessionWithError:v4];
  }
}

- (void)_socketOpenedWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling didSetup delegate with error %@", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(HMDCameraIDSDeviceConnectionSender *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 deviceConnectionSender:v7 didSetUpWithError:v4];
  }
}

- (void)_startAudioPacketRelay:(int)a3 ipAddress:(id)a4 port:(unint64_t)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v9);

  v10 = [(HMDCameraIDSDeviceConnection *)self watchAudioConnection];

  if (!v10)
  {
    v17 = 0;
    v20 = 0;
LABEL_11:
    v28 = (void *)MEMORY[0x1D9452090]();
    v24 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v35 = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create relay objects", buf, 0xCu);
    }
    id v22 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1017];
    goto LABEL_14;
  }
  int v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    uint64_t v15 = [(HMDCameraIDSDeviceConnection *)v12 watchAudioConnection];
    *(_DWORD *)buf = 138544386;
    v35 = v14;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2048;
    unint64_t v39 = a5;
    __int16 v40 = 1024;
    int v41 = a3;
    __int16 v42 = 1024;
    int v43 = [v15 socket];
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Creating audio relay between %@:%tu (%d,%d)", buf, 0x2Cu);
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F47948]);
  [v16 setIp:v8];
  [v16 setPort:(unsigned __int16)a5];
  v17 = [MEMORY[0x1E4F47960] connectionWithSocket:(unsigned __int16)a3 remoteAddress:v16];
  v18 = (void *)MEMORY[0x1E4F47960];
  v19 = [(HMDCameraIDSDeviceConnection *)v12 watchAudioConnection];
  v20 = objc_msgSend(v18, "connectionWithSocket:", (unsigned __int16)objc_msgSend(v19, "socket"));

  if (!v17 || !v20) {
    goto LABEL_11;
  }
  id v33 = 0;
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F47958]) initWithConnection:v17 connection:v20 error:&v33];
  id v22 = v33;
  [(HMDCameraIDSDeviceConnectionSender *)v12 setAudioPacketRelay:v21];

  v23 = (void *)MEMORY[0x1D9452090]();
  v24 = v12;
  v25 = HMFGetOSLogHandle();
  v26 = v25;
  if (v22)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v35 = v27;
      __int16 v36 = 2112;
      id v37 = v22;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audio packet relay with error %@", buf, 0x16u);
    }
LABEL_14:
    [(HMDCameraIDSDeviceConnectionSender *)v24 _callSessionEndedWithError:v22];
    goto LABEL_15;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v35 = v31;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Starting packet relay for audio", buf, 0xCu);
  }
  v32 = [(HMDCameraIDSDeviceConnectionSender *)v24 audioPacketRelay];
  [v32 start];

  id v22 = 0;
LABEL_15:
}

- (void)_startVideoPacketRelay:(int)a3 ipAddress:(id)a4 port:(unint64_t)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v9);

  v10 = [(HMDCameraIDSDeviceConnection *)self watchVideoConnection];

  if (!v10)
  {
    v17 = 0;
    v20 = 0;
LABEL_11:
    v28 = (void *)MEMORY[0x1D9452090]();
    v24 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v35 = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create relay objects", buf, 0xCu);
    }
    id v22 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1017];
    goto LABEL_14;
  }
  int v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    uint64_t v15 = [(HMDCameraIDSDeviceConnection *)v12 watchVideoConnection];
    *(_DWORD *)buf = 138544386;
    v35 = v14;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2048;
    unint64_t v39 = a5;
    __int16 v40 = 1024;
    int v41 = a3;
    __int16 v42 = 1024;
    int v43 = [v15 socket];
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Creating video relay between %@:%tu (%d,%d)", buf, 0x2Cu);
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F47948]);
  [v16 setIp:v8];
  [v16 setPort:(unsigned __int16)a5];
  v17 = [MEMORY[0x1E4F47960] connectionWithSocket:(unsigned __int16)a3 remoteAddress:v16];
  v18 = (void *)MEMORY[0x1E4F47960];
  v19 = [(HMDCameraIDSDeviceConnection *)v12 watchVideoConnection];
  v20 = objc_msgSend(v18, "connectionWithSocket:", (unsigned __int16)objc_msgSend(v19, "socket"));

  if (!v17 || !v20) {
    goto LABEL_11;
  }
  id v33 = 0;
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F47958]) initWithConnection:v17 connection:v20 error:&v33];
  id v22 = v33;
  [(HMDCameraIDSDeviceConnectionSender *)v12 setVideoPacketRelay:v21];

  v23 = (void *)MEMORY[0x1D9452090]();
  v24 = v12;
  v25 = HMFGetOSLogHandle();
  v26 = v25;
  if (v22)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v35 = v27;
      __int16 v36 = 2114;
      id v37 = v22;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video packet relay with error %{public}@", buf, 0x16u);
    }
LABEL_14:
    [(HMDCameraIDSDeviceConnectionSender *)v24 _callSessionEndedWithError:v22];
    goto LABEL_15;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v35 = v31;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Starting packet relay for video", buf, 0xCu);
  }
  v32 = [(HMDCameraIDSDeviceConnectionSender *)v24 videoPacketRelay];
  [v32 start];

  id v22 = 0;
LABEL_15:
}

- (void)startPacketRelayWithVideoSocket:(int)a3 videoNetworkConfig:(id)a4 cameraVideoSSRC:(unsigned int)a5 audioSocket:(int)a6 audioNetworkConfig:(id)a7 cameraAudioSSRC:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = a4;
  id v14 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"com.apple.homed.packet-connection-relay"];
  [(HMDCameraIDSDeviceConnectionSender *)self setPacketRelayTransaction:v15];

  id v16 = [v13 ipAddress];
  v17 = [v13 rtpPort];

  -[HMDCameraIDSDeviceConnectionSender _startVideoPacketRelay:ipAddress:port:](self, "_startVideoPacketRelay:ipAddress:port:", v10, v16, [v17 unsignedIntegerValue]);
  id v19 = [v12 ipAddress];
  v18 = [v12 rtpPort];

  -[HMDCameraIDSDeviceConnectionSender _startAudioPacketRelay:ipAddress:port:](self, "_startAudioPacketRelay:ipAddress:port:", v8, v19, [v18 unsignedIntegerValue]);
}

- (void)startPacketRelayWithIDSDeviceSession:(id)a3 cameraVideoSSRC:(unsigned int)a4 cameraAudioSSRC:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  v54[2] = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  uint64_t v8 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"com.apple.homed.packet-relay"];
  [(HMDCameraIDSDeviceConnectionSender *)self setPacketRelayTransaction:v9];

  uint64_t v10 = (void *)MEMORY[0x1D9452090]();
  int v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v51 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@IDS Session is present", buf, 0xCu);
  }
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F47950]) initWithIncomingSSRC:v6 acceptPacketType:0];
  uint64_t v15 = (void *)MEMORY[0x1E4F47960];
  id v16 = [(HMDCameraIDSDeviceConnection *)v11 watchVideoConnection];
  v17 = objc_msgSend(v15, "connectionWithSocket:remoteAddress:packetFilter:", (unsigned __int16)objc_msgSend(v16, "socket"), 0, v14);

  v18 = (void *)MEMORY[0x1D9452090]();
  id v19 = v11;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v51 = v21;
    __int16 v52 = 1024;
    LODWORD(v53) = v6;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Creating video relay connection with SSRC %08x", buf, 0x12u);
  }
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F47950]) initWithIncomingSSRC:v5 acceptPacketType:0];
  v23 = (void *)MEMORY[0x1E4F47960];
  v24 = [(HMDCameraIDSDeviceConnection *)v19 watchAudioConnection];
  v25 = objc_msgSend(v23, "connectionWithSocket:remoteAddress:packetFilter:", (unsigned __int16)objc_msgSend(v24, "socket"), 0, v22);

  v26 = (void *)MEMORY[0x1D9452090]();
  v27 = v19;
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v51 = v29;
    __int16 v52 = 1024;
    LODWORD(v53) = v5;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Creating audio relay connection with SSRC %08x", buf, 0x12u);
  }
  v30 = (void *)MEMORY[0x1E4F47960];
  v31 = v48;
  v32 = [v48 destination];
  id v33 = [v30 connectionWithIDSDestination:v32];

  if (!v17 || !v25 || !v33)
  {
    int v43 = (void *)MEMORY[0x1D9452090]();
    unint64_t v39 = v27;
    uint64_t v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v51 = v45;
      _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to create relay objects", buf, 0xCu);
    }
    id v37 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1017];
    goto LABEL_17;
  }
  id v34 = objc_alloc(MEMORY[0x1E4F47958]);
  v54[0] = v17;
  v54[1] = v25;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  id v49 = 0;
  __int16 v36 = (void *)[v34 initWithConnections:v35 multiplexedConnection:v33 error:&v49];
  id v37 = v49;
  [(HMDCameraIDSDeviceConnectionSender *)v27 setVideoPacketRelay:v36];

  __int16 v38 = (void *)MEMORY[0x1D9452090]();
  unint64_t v39 = v27;
  __int16 v40 = HMFGetOSLogHandle();
  int v41 = v40;
  if (v37)
  {
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      __int16 v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v51 = v42;
      __int16 v52 = 2114;
      id v53 = v37;
      _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video packet relay with error %{public}@", buf, 0x16u);

      v31 = v48;
    }

LABEL_17:
    [(HMDCameraIDSDeviceConnectionSender *)v39 _callSessionEndedWithError:v37];
    goto LABEL_18;
  }
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v46 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v51 = v46;
    _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Starting packet relay", buf, 0xCu);
  }
  v47 = [(HMDCameraIDSDeviceConnectionSender *)v39 videoPacketRelay];
  [v47 start];

  id v37 = 0;
  v31 = v48;
LABEL_18:
}

- (NSNumber)mtu
{
  v3 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = NSNumber;
  uint64_t v5 = [(HMDCameraIDSDeviceConnection *)self watchVideoConnection];
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "mtu"));

  return (NSNumber *)v6;
}

- (void)openRelaySession
{
  v3 = [(HMDCameraIDSDeviceConnection *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraIDSDeviceConnectionSender *)self device];
  [(HMDCameraIDSDeviceConnection *)self _createStreamSocketWithDevice:v4];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the IDS connection sender", buf, 0xCu);
  }
  v7 = [(HMDCameraIDSDeviceConnectionSender *)v4 videoPacketRelay];
  [v7 stop];

  uint64_t v8 = [(HMDCameraIDSDeviceConnectionSender *)v4 audioPacketRelay];
  [v8 stop];

  v9.receiver = v4;
  v9.super_class = (Class)HMDCameraIDSDeviceConnectionSender;
  [(HMDCameraIDSDeviceConnection *)&v9 dealloc];
}

- (HMDCameraIDSDeviceConnectionSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 delegate:(id)a6 idsProxyStreamService:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v13)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v14)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v17 = v16;
  if (!v16)
  {
LABEL_11:
    id v22 = (HMDCameraIDSDeviceConnectionSender *)_HMFPreconditionFailure();
    return [(HMDCameraIDSDeviceConnectionSender *)v22 initWithSessionID:v24 workQueue:v25 device:v26 delegate:v27];
  }
  v28.receiver = self;
  v28.super_class = (Class)HMDCameraIDSDeviceConnectionSender;
  v18 = [(HMDCameraIDSDeviceConnection *)&v28 initWithSessionID:v12 workQueue:v13 idsProxyStreamService:v16];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_device, a5);
    objc_storeWeak((id *)&v19->_delegate, v15);
    v20 = +[HMDCameraPowerAssertionHandler sharedHandler];
    [v20 registerRemoteRequestHandler:v19 forSessionID:v12];
  }
  return v19;
}

- (HMDCameraIDSDeviceConnectionSender)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 delegate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[HMDIDSServiceManager sharedManager];
  id v15 = [v14 proxyService];
  id v16 = [(HMDCameraIDSDeviceConnectionSender *)self initWithSessionID:v13 workQueue:v12 device:v11 delegate:v10 idsProxyStreamService:v15];

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17_106406 != -1) {
    dispatch_once(&logCategory__hmf_once_t17_106406, &__block_literal_global_106407);
  }
  v2 = (void *)logCategory__hmf_once_v18_106408;
  return v2;
}

uint64_t __49__HMDCameraIDSDeviceConnectionSender_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v18_106408;
  logCategory__hmf_once_v18_106408 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end