@interface HMDCameraStreamSnapshotCapture
+ (id)logCategory;
- (HMDCameraStreamSnapshotCapture)initWithWorkQueue:(id)a3 videoStreamInterface:(id)a4 delegate:(id)a5 delegateQueue:(id)a6;
- (HMDVideoStreamInterface)videoStreamInterface;
- (NSString)description;
- (id)logIdentifier;
- (void)_callSnapshotDelegate:(uint64_t)a1;
- (void)_captureFrame;
- (void)captureCurrentFrame;
- (void)captureLastFrame;
- (void)setLastDecodedFrameTimer:(uint64_t)a1;
- (void)timerDidFire:(id)a3;
- (void)videoStream:(id)a3 didGetLastDecodedFrame:(id)a4;
@end

@implementation HMDCameraStreamSnapshotCapture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDecodedFrameTimer, 0);
  objc_storeStrong((id *)&self->_streamSessionID, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_videoStreamInterface, 0);
}

- (HMDVideoStreamInterface)videoStreamInterface
{
  return self->_videoStreamInterface;
}

- (void)videoStream:(id)a3 didGetLastDecodedFrame:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  -[HMDCameraStreamSnapshotCapture setLastDecodedFrameTimer:]((uint64_t)self);
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received last decoded frame", (uint8_t *)&v12, 0xCu);
  }
  -[HMDCameraStreamSnapshotCapture _callSnapshotDelegate:]((uint64_t)v9, v7);
}

- (void)setLastDecodedFrameTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), 0);
  }
}

- (void)_callSnapshotDelegate:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 8))
    {
      v4 = (void *)MEMORY[0x230FBD990]();
      id v5 = (id)a1;
      id v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = HMFGetLogIdentifier();
        LODWORD(v23) = 138543362;
        *(void *)((char *)&v23 + 4) = v7;
        _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Captured the last frame, sending stop stream", (uint8_t *)&v23, 0xCu);
      }
      v8 = [v5 videoStreamInterface];
      [v8 stopStream];
    }
    if (*(unsigned char *)(a1 + 9))
    {
      *(unsigned char *)(a1 + 9) = 0;
      id v9 = v3;
      id v10 = *(id *)(a1 + 32);
      v11 = (void *)MEMORY[0x230FBD990]();
      int v12 = (id)a1;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        LODWORD(v23) = 138543362;
        *(void *)((char *)&v23 + 4) = v14;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamSnapshotCapture:didGetNewSnapshot", (uint8_t *)&v23, 0xCu);
      }
      if (objc_opt_respondsToSelector())
      {
        v15 = v12[5];
        *(void *)&long long v23 = MEMORY[0x263EF8330];
        *((void *)&v23 + 1) = 3221225472;
        v24 = __57__HMDCameraStreamSnapshotCapture__callDidGetNewSnapshot___block_invoke;
        v25 = &unk_264A2F2F8;
        id v26 = v10;
        v27 = v12;
        id v28 = v9;
        dispatch_async(v15, &v23);
      }
    }
    if (*(unsigned char *)(a1 + 8))
    {
      *(unsigned char *)(a1 + 8) = 0;
      id v16 = v3;
      id v17 = *(id *)(a1 + 32);
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = (id)a1;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = HMFGetLogIdentifier();
        LODWORD(v23) = 138543362;
        *(void *)((char *)&v23 + 4) = v21;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Calling delegate streamSnapshotCapture:didGetLastSnapshot", (uint8_t *)&v23, 0xCu);
      }
      if (objc_opt_respondsToSelector())
      {
        v22 = v19[5];
        *(void *)&long long v23 = MEMORY[0x263EF8330];
        *((void *)&v23 + 1) = 3221225472;
        v24 = __58__HMDCameraStreamSnapshotCapture__callDidGetLastSnapshot___block_invoke;
        v25 = &unk_264A2F2F8;
        id v26 = v17;
        v27 = v19;
        id v28 = v16;
        dispatch_async(v22, &v23);
      }
    }
  }
}

uint64_t __58__HMDCameraStreamSnapshotCapture__callDidGetLastSnapshot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamSnapshotCapture:*(void *)(a1 + 40) didGetLastSnapshot:*(void *)(a1 + 48)];
}

uint64_t __57__HMDCameraStreamSnapshotCapture__callDidGetNewSnapshot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) streamSnapshotCapture:*(void *)(a1 + 40) didGetNewSnapshot:*(void *)(a1 + 48)];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    lastDecodedFrameTimer = self->_lastDecodedFrameTimer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    lastDecodedFrameTimer = 0;
  }
  if (lastDecodedFrameTimer == v4)
  {
    -[HMDCameraStreamSnapshotCapture setLastDecodedFrameTimer:]((uint64_t)self);
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Capturing frame has timed out", (uint8_t *)&v10, 0xCu);
    }
    -[HMDCameraStreamSnapshotCapture _callSnapshotDelegate:]((uint64_t)v7, 0);
  }
}

- (void)captureLastFrame
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__HMDCameraStreamSnapshotCapture_captureLastFrame__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __50__HMDCameraStreamSnapshotCapture_captureLastFrame__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    *(unsigned char *)(v2 + 8) = 1;
  }
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Capturing last frame", (uint8_t *)&v7, 0xCu);
  }
  -[HMDCameraStreamSnapshotCapture _captureFrame](*(id **)(a1 + 32));
}

- (void)_captureFrame
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a1[7])
    {
      uint64_t v2 = (void *)MEMORY[0x230FBD990]();
      id v3 = a1;
      id v4 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v5 = HMFGetLogIdentifier();
        int v12 = 138543362;
        v13 = v5;
        _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@A capture frame is already in progress, not sending another one", (uint8_t *)&v12, 0xCu);
      }
    }
    else
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:2.0];
      id v7 = a1[7];
      a1[7] = (id)v6;

      [a1[7] setDelegate:a1];
      id v8 = a1[7];
      id v9 = a1[3];
      [v8 setDelegateQueue:v9];

      int v10 = [a1 videoStreamInterface];
      [v10 captureSnapshot];

      id v11 = a1[7];
      [v11 resume];
    }
  }
}

- (void)captureCurrentFrame
{
  if (self) {
    workQueue = self->_workQueue;
  }
  else {
    workQueue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMDCameraStreamSnapshotCapture_captureCurrentFrame__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __53__HMDCameraStreamSnapshotCapture_captureCurrentFrame__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    *(unsigned char *)(v2 + 9) = 1;
  }
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Capturing current frame", (uint8_t *)&v7, 0xCu);
  }
  -[HMDCameraStreamSnapshotCapture _captureFrame](*(id **)(a1 + 32));
}

- (NSString)description
{
  streamSessionID = self;
  if (self) {
    streamSessionID = self->_streamSessionID;
  }
  return (NSString *)[NSString stringWithFormat:@"Stream-Snapshot-Capture: %@", streamSessionID];
}

- (id)logIdentifier
{
  if (self) {
    self = (HMDCameraStreamSnapshotCapture *)self->_streamSessionID;
  }
  return [(HMDCameraStreamSnapshotCapture *)self description];
}

- (HMDCameraStreamSnapshotCapture)initWithWorkQueue:(id)a3 videoStreamInterface:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDCameraStreamSnapshotCapture;
  v15 = [(HMDCameraStreamSnapshotCapture *)&v20 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a3);
    objc_storeStrong((id *)&v16->_videoStreamInterface, a4);
    objc_storeStrong((id *)&v16->_delegate, a5);
    objc_storeStrong((id *)&v16->_delegateQueue, a6);
    uint64_t v17 = [v12 sessionID];
    streamSessionID = v16->_streamSessionID;
    v16->_streamSessionID = (HMDCameraStreamSessionID *)v17;

    v16->_capturingLastFrame = 0;
    v16->_capturingCurrentFrame = 0;
    [v12 setSnapshotDelegate:v16];
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_212130 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_212130, &__block_literal_global_212131);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_212132;
  return v2;
}

void __45__HMDCameraStreamSnapshotCapture_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_212132;
  logCategory__hmf_once_v1_212132 = v0;
}

@end