@interface HMDCameraIDSSessionInitiator
+ (id)logCategory;
- (AVCPacketRelay)packetRelay;
- (HMDCameraIDSSessionInitiator)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 localNetworkConfig:(id)a6 delegate:(id)a7;
- (HMDCameraIDSSessionInitiatorDelegate)delegate;
- (HMDCameraNetworkConfig)localNetworkConfig;
- (HMDDevice)device;
- (HMFOSTransaction)packetRelayTransaction;
- (NSNumber)mtu;
- (id)logIdentifier;
- (void)_callSessionEndedWithError:(id)a3;
- (void)_callSessionStarted;
- (void)_sendInvitation;
- (void)_startPacketRelayWithVideoSocket:(int)a3 videoNetworkConfig:(id)a4 cameraVideoSSRC:(unsigned int)a5 audioSocket:(int)a6 audioNetworkConfig:(id)a7 cameraAudioSSRC:(unsigned int)a8;
- (void)dealloc;
- (void)openRelaySession;
- (void)packetRelay:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)packetRelay:(id)a3 didStop:(BOOL)a4 error:(id)a5;
- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4;
- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)sessionStarted:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPacketRelay:(id)a3;
- (void)setPacketRelayTransaction:(id)a3;
- (void)startPacketRelayWithVideoSocket:(int)a3 videoNetworkConfig:(id)a4 cameraVideoSSRC:(unsigned int)a5 audioSocket:(int)a6 audioNetworkConfig:(id)a7 cameraAudioSSRC:(unsigned int)a8;
@end

@implementation HMDCameraIDSSessionInitiator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetRelayTransaction, 0);
  objc_storeStrong((id *)&self->_packetRelay, 0);
  objc_storeStrong((id *)&self->_localNetworkConfig, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPacketRelayTransaction:(id)a3
{
}

- (HMFOSTransaction)packetRelayTransaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPacketRelay:(id)a3
{
}

- (AVCPacketRelay)packetRelay
{
  return (AVCPacketRelay *)objc_getProperty(self, a2, 64, 1);
}

- (HMDCameraNetworkConfig)localNetworkConfig
{
  return self->_localNetworkConfig;
}

- (HMDDevice)device
{
  return self->_device;
}

- (void)setDelegate:(id)a3
{
}

- (HMDCameraIDSSessionInitiatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCameraIDSSessionInitiatorDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraIDSSessionHandler *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)_callSessionEndedWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraIDSSessionHandler *)self workQueue];
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
  v10 = [(HMDCameraIDSSessionInitiator *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 sessionInitiator:v7 didEndSessionWithError:v4];
  }
}

- (void)_callSessionStarted
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling didSetUp delegate", (uint8_t *)&v9, 0xCu);
  }
  v8 = [(HMDCameraIDSSessionInitiator *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 sessionInitiator:v5 didSetUpWithError:0];
  }
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = HMFGetLogIdentifier();
    int v16 = 138544130;
    v17 = v14;
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 1026;
    unsigned int v21 = a4;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@IDSSession %{public}@ has ended with reason: %{public}u and error %{public}@", (uint8_t *)&v16, 0x26u);
  }
  uint64_t v15 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1030 underlyingError:v9];
  [(HMDCameraIDSSessionInitiator *)v12 _callSessionEndedWithError:v15];
}

- (void)sessionStarted:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    v12 = v9;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@IDSSession %{public}@ has started", (uint8_t *)&v11, 0x16u);
  }
  v10 = [(HMDCameraIDSSessionHandler *)v7 sessionID];
  [v10 markMilestoneFor:@"IDSSessionStartedOnInitiator"];

  [(HMDCameraIDSSessionInitiator *)v7 _callSessionStarted];
}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543874;
    id v14 = v12;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %@ was canceled by: %@", (uint8_t *)&v13, 0x20u);
  }
  [(HMDCameraIDSSessionInitiator *)v10 _callSessionEndedWithError:0];
}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543874;
    id v14 = v12;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %@ has been declined by: %@", (uint8_t *)&v13, 0x20u);
  }
  [(HMDCameraIDSSessionInitiator *)v10 _callSessionEndedWithError:0];
}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v13 = 138543874;
    id v14 = v12;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Invitation for IDSSession %{public}@ has been accepted by: %@, waiting for session to get started", (uint8_t *)&v13, 0x20u);
  }
}

- (void)packetRelay:(id)a3 didStop:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = [(HMDCameraIDSSessionHandler *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HMDCameraIDSSessionInitiator_packetRelay_didStop_error___block_invoke;
  block[3] = &unk_264A2DFC8;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

void __58__HMDCameraIDSSessionInitiator_packetRelay_didStop_error___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = HMFBooleanToString();
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Packet relay did stop: %@ error: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)packetRelay:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  int v8 = [(HMDCameraIDSSessionHandler *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HMDCameraIDSSessionInitiator_packetRelay_didStart_error___block_invoke;
  block[3] = &unk_264A2DFC8;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

void __59__HMDCameraIDSSessionInitiator_packetRelay_didStart_error___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = HMFBooleanToString();
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Packet relay did start: %{public}@ error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)_startPacketRelayWithVideoSocket:(int)a3 videoNetworkConfig:(id)a4 cameraVideoSSRC:(unsigned int)a5 audioSocket:(int)a6 audioNetworkConfig:(id)a7 cameraAudioSSRC:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  unsigned __int16 v10 = a6;
  uint64_t v11 = *(void *)&a5;
  unsigned __int16 v12 = a3;
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a7;
  id v16 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v16);

  __int16 v17 = (void *)[objc_alloc(MEMORY[0x263F425C0]) initWithName:@"com.apple.homed.packet-relay"];
  [(HMDCameraIDSSessionInitiator *)self setPacketRelayTransaction:v17];

  v67 = [(HMDCameraIDSSessionHandler *)self idsSession];
  if (v67)
  {
    id v18 = objc_alloc_init(MEMORY[0x263F20FA0]);
    uint64_t v19 = [v14 ipAddress];
    [v18 setIp:v19];

    objc_msgSend(v18, "setIsIPv6:", objc_msgSend(v14, "ipv6"));
    __int16 v20 = [v14 rtpPort];
    objc_msgSend(v18, "setPort:", objc_msgSend(v20, "unsignedShortValue"));

    uint64_t v64 = [objc_alloc(MEMORY[0x263F20FA8]) initWithIncomingSSRC:v11 acceptPacketType:0];
    v66 = objc_msgSend(MEMORY[0x263F20FB8], "connectionWithSocket:remoteAddress:packetFilter:", v12, v18);
    unsigned int v21 = (void *)MEMORY[0x230FBD990]();
    __int16 v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v71 = v24;
      __int16 v72 = 1024;
      *(_DWORD *)v73 = v11;
      *(_WORD *)&v73[4] = 2112;
      *(void *)&v73[6] = v14;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Created video relay connection with SSRC %08x and config: %@", buf, 0x1Cu);
    }
    id v25 = objc_alloc_init(MEMORY[0x263F20FA0]);
    v26 = [v15 ipAddress];
    [v25 setIp:v26];

    objc_msgSend(v25, "setIsIPv6:", objc_msgSend(v15, "ipv6"));
    v27 = [v15 rtpPort];
    objc_msgSend(v25, "setPort:", objc_msgSend(v27, "unsignedShortValue"));

    v63 = (void *)[objc_alloc(MEMORY[0x263F20FA8]) initWithIncomingSSRC:v8 acceptPacketType:0];
    uint64_t v28 = objc_msgSend(MEMORY[0x263F20FB8], "connectionWithSocket:remoteAddress:packetFilter:", v10, v25);
    v29 = (void *)MEMORY[0x230FBD990]();
    v30 = v22;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v71 = v32;
      __int16 v72 = 1024;
      *(_DWORD *)v73 = v8;
      *(_WORD *)&v73[4] = 2112;
      *(void *)&v73[6] = v15;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Created audio relay connection with SSRC %08x and config: %@", buf, 0x1Cu);
    }
    v33 = (void *)MEMORY[0x263F20FB8];
    v34 = [v67 destination];
    v35 = [v33 connectionWithIDSDestination:v34];

    v36 = (void *)MEMORY[0x230FBD990]();
    v37 = v30;
    v38 = HMFGetOSLogHandle();
    v65 = (void *)v28;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = HMFGetLogIdentifier();
      v40 = [v67 destination];
      *(_DWORD *)buf = 138543618;
      v71 = v39;
      __int16 v72 = 2112;
      *(void *)v73 = v40;
      _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Created IDS relay connection with destination: %@", buf, 0x16u);

      uint64_t v28 = (uint64_t)v65;
    }

    if (v66 && v28 && v35)
    {
      id v41 = objc_alloc(MEMORY[0x263F20FB0]);
      v69[0] = v66;
      v69[1] = v28;
      v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:2];
      id v68 = 0;
      v43 = (void *)[v41 initWithConnections:v42 multiplexedConnection:v35 error:&v68];
      id v44 = v68;
      [(HMDCameraIDSSessionInitiator *)v37 setPacketRelay:v43];

      v45 = [(HMDCameraIDSSessionInitiator *)v37 packetRelay];

      v46 = (void *)MEMORY[0x230FBD990]();
      v47 = v37;
      v48 = HMFGetOSLogHandle();
      v49 = v48;
      if (v45)
      {
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          v50 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v71 = v50;
          _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_INFO, "%{public}@Starting packet relay", buf, 0xCu);
        }
        v51 = [(HMDCameraIDSSessionInitiator *)v47 packetRelay];
        [v51 setDelegate:v47];

        v52 = [(HMDCameraIDSSessionInitiator *)v47 packetRelay];
        [v52 start];
      }
      else
      {
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v62 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v71 = v62;
          __int16 v72 = 2112;
          *(void *)v73 = v44;
          _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video packet relay: %@", buf, 0x16u);
        }
        [(HMDCameraIDSSessionInitiator *)v47 _callSessionEndedWithError:v44];
      }
      v60 = (void *)v64;
    }
    else
    {
      v57 = (void *)MEMORY[0x230FBD990]();
      v58 = v37;
      v59 = HMFGetOSLogHandle();
      v60 = (void *)v64;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v61 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v71 = v61;
        __int16 v72 = 2112;
        *(void *)v73 = v66;
        *(_WORD *)&v73[8] = 2112;
        *(void *)&v73[10] = v65;
        __int16 v74 = 2112;
        v75 = v35;
        _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_ERROR, "%{public}@Failed to start packet relay with relayConnectionCameraVideo: %@, relayConnectionCameraAudio: %@, relayConnectionIDS: %@", buf, 0x2Au);
      }
      id v44 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1017];
      [(HMDCameraIDSSessionInitiator *)v58 _callSessionEndedWithError:v44];
    }
  }
  else
  {
    v53 = (void *)MEMORY[0x230FBD990]();
    v54 = self;
    v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v56 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v71 = v56;
      _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Cannot start packet relay because no IDS session exists", buf, 0xCu);
    }
    id v18 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1017];
    [(HMDCameraIDSSessionInitiator *)v54 _callSessionEndedWithError:v18];
  }
}

- (void)startPacketRelayWithVideoSocket:(int)a3 videoNetworkConfig:(id)a4 cameraVideoSSRC:(unsigned int)a5 audioSocket:(int)a6 audioNetworkConfig:(id)a7 cameraAudioSSRC:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  uint64_t v12 = *(void *)&a3;
  id v14 = a7;
  id v16 = a4;
  id v15 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v15);

  [(HMDCameraIDSSessionInitiator *)self _startPacketRelayWithVideoSocket:v12 videoNetworkConfig:v16 cameraVideoSSRC:v10 audioSocket:v9 audioNetworkConfig:v14 cameraAudioSSRC:v8];
}

- (void)_sendInvitation
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraIDSSessionHandler *)self idsStreamService];
  v5 = [v4 accounts];

  if ([v5 count] && (objc_msgSend(v5, "anyObject"), (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    [v8 setObject:&unk_26E470BB8 forKeyedSubscript:*MEMORY[0x263F49FE8]];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49FE0]];
    uint64_t v9 = [(HMDCameraIDSSessionInitiator *)self localNetworkConfig];
    char v10 = [v9 ipv6];

    if ((v10 & 1) == 0) {
      [v8 setObject:&unk_26E470BD0 forKeyedSubscript:*MEMORY[0x263F49FD8]];
    }
    uint64_t v11 = (void *)MEMORY[0x263F4A0D8];
    uint64_t v12 = [(HMDCameraIDSSessionInitiator *)self device];
    uint64_t v13 = objc_msgSend(v11, "hmd_sessionWithAccount:device:options:", v7, v12, v8);
    [(HMDCameraIDSSessionHandler *)self setIdsSession:v13];

    id v14 = [(HMDCameraIDSSessionHandler *)self idsSession];
    id v15 = [(HMDCameraIDSSessionHandler *)self workQueue];
    [v14 setDelegate:self queue:v15];

    id v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      __int16 v20 = [(HMDCameraIDSSessionHandler *)v17 idsSession];
      unsigned int v21 = [(HMDCameraIDSSessionInitiator *)v17 device];
      __int16 v22 = [v21 shortDescription];
      *(_DWORD *)buf = 138544130;
      v32 = v19;
      __int16 v33 = 2112;
      v34 = v20;
      __int16 v35 = 2112;
      v36 = v22;
      __int16 v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Sending out invitation for IDSSession %@ to device %@ with options: %@", buf, 0x2Au);
    }
    id v23 = [(HMDCameraIDSSessionHandler *)v17 sessionID];
    uint64_t v24 = [v23 sessionID];
    v30 = v24;
    id v25 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

    v26 = encodeRootObject();
    v27 = [(HMDCameraIDSSessionHandler *)v17 idsSession];
    [v27 sendInvitationWithData:v26];

    uint64_t v28 = [(HMDCameraIDSSessionHandler *)v17 sessionID];
    [v28 markMilestoneFor:@"IDSSessionInvitationSent"];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1024];
    [(HMDCameraIDSSessionInitiator *)self _callSessionEndedWithError:v7];
  }
}

- (void)openRelaySession
{
  id v3 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(HMDCameraIDSSessionInitiator *)self _sendInvitation];
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the IDS session initiator", buf, 0xCu);
  }
  uint64_t v7 = [(HMDCameraIDSSessionInitiator *)v4 packetRelay];
  [v7 stop];

  uint64_t v8 = [(HMDCameraIDSSessionHandler *)v4 idsSession];
  [v8 endSession];

  v9.receiver = v4;
  v9.super_class = (Class)HMDCameraIDSSessionInitiator;
  [(HMDCameraIDSSessionHandler *)&v9 dealloc];
}

- (NSNumber)mtu
{
  id v3 = [(HMDCameraIDSSessionHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCameraIDSSessionInitiator *)self localNetworkConfig];
  if ([v4 ipv6]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }

  uint64_t v6 = NSNumber;
  uint64_t v7 = [(HMDCameraIDSSessionHandler *)self idsSession];
  uint64_t v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "MTUForAddressFamily:", v5));

  return (NSNumber *)v8;
}

- (HMDCameraIDSSessionInitiator)initWithSessionID:(id)a3 workQueue:(id)a4 device:(id)a5 localNetworkConfig:(id)a6 delegate:(id)a7
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
  if (!v15)
  {
LABEL_11:
    __int16 v22 = (void *)_HMFPreconditionFailure();
    return (HMDCameraIDSSessionInitiator *)+[HMDCameraIDSSessionInitiator logCategory];
  }
  __int16 v17 = v16;
  v24.receiver = self;
  v24.super_class = (Class)HMDCameraIDSSessionInitiator;
  id v18 = [(HMDCameraIDSSessionHandler *)&v24 initWithSessionID:v12 workQueue:v13];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_device, a5);
    objc_storeWeak((id *)&v19->_delegate, v17);
    objc_storeStrong((id *)&v19->_localNetworkConfig, a6);
    __int16 v20 = +[HMDCameraPowerAssertionHandler sharedHandler];
    [v20 registerRemoteRequestHandler:v19 forSessionID:v12];
  }
  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_26304 != -1) {
    dispatch_once(&logCategory__hmf_once_t18_26304, &__block_literal_global_26305);
  }
  v2 = (void *)logCategory__hmf_once_v19_26306;
  return v2;
}

void __43__HMDCameraIDSSessionInitiator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v19_26306;
  logCategory__hmf_once_v19_26306 = v0;
}

@end