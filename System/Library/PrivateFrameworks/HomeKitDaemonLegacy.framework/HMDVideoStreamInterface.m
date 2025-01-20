@interface HMDVideoStreamInterface
+ (id)_createLocalStreamAndRTPSocket:(int *)a3 localNetworkConfig:(id)a4;
+ (id)_createStreamWithRemoteDestinationReceiver:(id)a3;
+ (id)_createStreamWithRemoteSocketReceiver:(id)a3;
+ (id)_createVideoStreamWithSessionHandler:(id)a3 localNetworkConfig:(id)a4 localRTPSocket:(int *)a5;
+ (id)logCategory;
+ (int)_createLocalRTPSocketWithRemoteSender:(id)a3 localNetworkConfig:(id)a4;
- (HMDAVCVideoStream)videoStream;
- (HMDVideoStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 sessionHandler:(id)a6 localNetworkConfig:(id)a7;
- (HMDVideoStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 sessionHandler:(id)a6 videoStream:(id)a7 localRTPSocket:(int)a8 videoStreamReconfigure:(id)a9 dataSource:(id)a10;
- (HMDVideoStreamInterfaceDataSource)dataSource;
- (HMDVideoStreamInterfaceDelegate)delegate;
- (HMDVideoStreamLastDecodedFrameDelegate)snapshotDelegate;
- (HMDVideoStreamReconfigure)videoStreamReconfigure;
- (HMFOSTransaction)snapshotDataTransaction;
- (NSNumber)streamToken;
- (NSNumber)syncSource;
- (id)logIdentifier;
- (void)_callDidGetLastDecodedFrame:(id)a3;
- (void)_callDidUpdateConfiguration;
- (void)_callNetworkDeteriorated;
- (void)_callNetworkImproved;
- (void)_callStarted:(id)a3;
- (void)_callStopped:(id)a3;
- (void)captureSnapshot;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setSnapshotDataTransaction:(id)a3;
- (void)setSnapshotDelegate:(id)a3;
- (void)startStreamWithConfig:(id)a3;
- (void)stopStream;
- (void)stream:(id)a3 didGetLastDecodedFrame:(id)a4;
- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 didUpdateVideoConfiguration:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 downlinkQualityDidChange:(id)a4;
- (void)streamDidRTCPTimeOut:(id)a3;
- (void)streamDidRTPTimeOut:(id)a3;
- (void)streamDidServerDie:(id)a3;
- (void)streamDidStop:(id)a3;
- (void)updateReconfigurationMode:(BOOL)a3;
- (void)updateStreamConfiguration:(id)a3;
- (void)videoStreamReconfigureDidNetworkDeteriorate:(id)a3;
- (void)videoStreamReconfigureDidNetworkImprove:(id)a3;
@end

@implementation HMDVideoStreamInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotDataTransaction, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_videoStreamReconfigure, 0);
  objc_storeStrong((id *)&self->_videoStream, 0);
  objc_destroyWeak((id *)&self->_snapshotDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSnapshotDataTransaction:(id)a3
{
}

- (HMFOSTransaction)snapshotDataTransaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 96, 1);
}

- (HMDVideoStreamInterfaceDataSource)dataSource
{
  return (HMDVideoStreamInterfaceDataSource *)objc_getProperty(self, a2, 88, 1);
}

- (HMDVideoStreamReconfigure)videoStreamReconfigure
{
  return (HMDVideoStreamReconfigure *)objc_getProperty(self, a2, 80, 1);
}

- (HMDAVCVideoStream)videoStream
{
  return (HMDAVCVideoStream *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSnapshotDelegate:(id)a3
{
}

- (HMDVideoStreamLastDecodedFrameDelegate)snapshotDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotDelegate);
  return (HMDVideoStreamLastDecodedFrameDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMDVideoStreamInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDVideoStreamInterfaceDelegate *)WeakRetained;
}

- (void)videoStreamReconfigureDidNetworkImprove:(id)a3
{
  v4 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDVideoStreamInterface *)self _callNetworkImproved];
}

- (void)videoStreamReconfigureDidNetworkDeteriorate:(id)a3
{
  v4 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDVideoStreamInterface *)self _callNetworkDeteriorated];
}

- (void)streamDidRTCPTimeOut:(id)a3
{
  v4 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMDVideoStreamInterface_streamDidRTCPTimeOut___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __48__HMDVideoStreamInterface_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Video stream RTCP has timed out", (uint8_t *)&v6, 0xCu);
  }
}

- (void)streamDidRTPTimeOut:(id)a3
{
  v4 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HMDVideoStreamInterface_streamDidRTPTimeOut___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __47__HMDVideoStreamInterface_streamDidRTPTimeOut___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_ERROR, "%{public}@Video stream RTP has timed out", (uint8_t *)&v8, 0xCu);
  }
  int v6 = *(void **)(a1 + 32);
  v7 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1012];
  [v6 _callStopped:v7];
}

- (void)streamDidServerDie:(id)a3
{
  v4 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HMDVideoStreamInterface_streamDidServerDie___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __46__HMDVideoStreamInterface_streamDidServerDie___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_ERROR, "%{public}@Video stream server died", (uint8_t *)&v8, 0xCu);
  }
  int v6 = *(void **)(a1 + 32);
  v7 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1014];
  [v6 _callStopped:v7];
}

- (void)streamDidStop:(id)a3
{
  v4 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HMDVideoStreamInterface_streamDidStop___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __41__HMDVideoStreamInterface_streamDidStop___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    int v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@streamDidStop", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _callStopped:0];
}

- (void)stream:(id)a3 didGetLastDecodedFrame:(id)a4
{
  id v5 = a4;
  int v6 = [(HMDStreamInterface *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HMDVideoStreamInterface_stream_didGetLastDecodedFrame___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __57__HMDVideoStreamInterface_stream_didGetLastDecodedFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callDidGetLastDecodedFrame:*(void *)(a1 + 40)];
}

- (void)stream:(id)a3 downlinkQualityDidChange:(id)a4
{
  id v5 = a4;
  int v6 = [(HMDStreamInterface *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__HMDVideoStreamInterface_stream_downlinkQualityDidChange___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __59__HMDVideoStreamInterface_stream_downlinkQualityDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) videoStreamReconfigure];
  [v2 downlinkQualityChanged:*(void *)(a1 + 40)];
}

- (void)stream:(id)a3 didUpdateVideoConfiguration:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  int v8 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__HMDVideoStreamInterface_stream_didUpdateVideoConfiguration_error___block_invoke;
  block[3] = &unk_1E6A18708;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

uint64_t __68__HMDVideoStreamInterface_stream_didUpdateVideoConfiguration_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v6 = HMFBooleanToString();
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    BOOL v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Video stream did update video configuration: %@ error: %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _callDidUpdateConfiguration];
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  int v8 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HMDVideoStreamInterface_stream_didStart_error___block_invoke;
  block[3] = &unk_1E6A18708;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

uint64_t __49__HMDVideoStreamInterface_stream_didStart_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v6 = HMFBooleanToString();
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    BOOL v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Video stream did start: %@ error: %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _callStarted:*(void *)(a1 + 40)];
}

- (void)_callDidGetLastDecodedFrame:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(HMDVideoStreamInterface *)self snapshotDelegate];
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  int v8 = self;
  int v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v21 = 138543362;
    v22 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStream:didGetLastDecodedFrame:", (uint8_t *)&v21, 0xCu);
  }
  __int16 v11 = [(HMDVideoStreamInterface *)v8 videoStream];
  BOOL v12 = [v11 configuration];
  __int16 v13 = [v12 video];
  unint64_t v14 = [v13 videoResolution];

  uint64_t v15 = [HMDVideoResolution alloc];
  if (v14 < 0xA) {
    uint64_t v16 = v14 + 1;
  }
  else {
    uint64_t v16 = -1;
  }
  v17 = [(HMDVideoResolution *)v15 initWithResolution:v16];
  v18 = [HMDCameraSnapshotData alloc];
  v19 = [(HMDVideoStreamInterface *)v8 snapshotDataTransaction];
  v20 = [(HMDCameraSnapshotData *)v18 initWithSnapshotData:v4 videoResolution:v17 snapshotDataTrasaction:v19];

  [(HMDVideoStreamInterface *)v8 setSnapshotDataTransaction:0];
  if (objc_opt_respondsToSelector()) {
    [v6 videoStream:v8 didGetLastDecodedFrame:v20];
  }
}

- (void)_callDidUpdateConfiguration
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStreamDidUpdateConfiguration", (uint8_t *)&v9, 0xCu);
  }
  int v8 = [(HMDVideoStreamInterface *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 videoStreamDidUpdateConfiguration:v5];
  }
}

- (void)_callNetworkDeteriorated
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStreamDidNetworkDeteriorate", (uint8_t *)&v9, 0xCu);
  }
  int v8 = [(HMDVideoStreamInterface *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 videoStreamDidNetworkDeteriorate:v5];
  }
}

- (void)_callNetworkImproved
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStreamDidNetworkImprove", (uint8_t *)&v9, 0xCu);
  }
  int v8 = [(HMDVideoStreamInterface *)v5 delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 videoStreamDidNetworkImprove:v5];
  }
}

- (void)_callStopped:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = (void *)MEMORY[0x1D9452090]([(HMDStreamInterface *)self setState:3]);
  uint64_t v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    BOOL v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStream:didStop", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v10 = [(HMDVideoStreamInterface *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 videoStream:v7 didStop:v4];
  }
}

- (void)_callStarted:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    BOOL v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate videoStream:didStart", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v10 = [(HMDVideoStreamInterface *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 videoStream:v7 didStart:v4];
  }
  [(HMDStreamInterface *)v7 setState:2];
}

- (void)captureSnapshot
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"com.apple.homed.snapshot-last-decoded-frame"];
  [(HMDVideoStreamInterface *)self setSnapshotDataTransaction:v4];

  id v5 = (void *)MEMORY[0x1D9452090]();
  int v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Requesting last decoded frame", (uint8_t *)&v10, 0xCu);
  }
  int v9 = [(HMDVideoStreamInterface *)v6 videoStream];
  [v9 requestLastDecodedFrame];
}

- (void)stopStream
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping video stream", (uint8_t *)&v9, 0xCu);
  }
  int v8 = [(HMDVideoStreamInterface *)v5 videoStream];
  [v8 stop];
}

- (void)updateStreamConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    int v10 = [v4 video];
    int v13 = 138543618;
    unint64_t v14 = v9;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating video stream with video configuration: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v11 = [(HMDVideoStreamInterface *)v7 videoStream];
  uint64_t v12 = [v4 video];
  [v11 updateVideoConfiguration:v12];
}

- (void)updateReconfigurationMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDVideoStreamInterface *)self videoStreamReconfigure];
  [v6 updateReconfigurationMode:v3];
}

- (void)startStreamWithConfig:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(HMDStreamInterface *)self loadMiscFields:v4];
  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  int v8 = self;
  int v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v10)
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v24 = v20;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to load misc fields to video config", buf, 0xCu);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1016];
    goto LABEL_14;
  }
  if (v10)
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring video stream with configuration: %@", buf, 0x16u);
  }
  uint64_t v12 = [(HMDVideoStreamInterface *)v8 videoStream];
  id v22 = 0;
  char v13 = [v12 configure:v4 error:&v22];
  id v14 = v22;

  __int16 v15 = (void *)MEMORY[0x1D9452090]();
  int v8 = v8;
  uint64_t v16 = HMFGetOSLogHandle();
  uint64_t v17 = v16;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v21;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure video stream: %@", buf, 0x16u);
    }
LABEL_14:
    [(HMDVideoStreamInterface *)v8 _callStarted:v14];
    goto LABEL_15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v24 = v18;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Starting video stream", buf, 0xCu);
  }
  v19 = [(HMDVideoStreamInterface *)v8 videoStream];
  [v19 start];

LABEL_15:
}

- (NSNumber)streamToken
{
  BOOL v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = NSNumber;
  id v5 = [(HMDVideoStreamInterface *)self videoStream];
  BOOL v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "streamToken"));

  return (NSNumber *)v6;
}

- (NSNumber)syncSource
{
  BOOL v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDVideoStreamInterface *)self videoStream];
  id v5 = [v4 capabilities];
  BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F479B0]];

  return (NSNumber *)v6;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMDVideoStreamInterface object", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDVideoStreamInterface;
  [(HMDStreamInterface *)&v7 dealloc];
}

- (id)logIdentifier
{
  id v2 = [(HMDStreamInterface *)self sessionID];
  BOOL v3 = [v2 description];

  return v3;
}

- (HMDVideoStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 sessionHandler:(id)a6 videoStream:(id)a7 localRTPSocket:(int)a8 videoStreamReconfigure:(id)a9 dataSource:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  id v16 = a5;
  id v22 = a7;
  id v21 = a9;
  id v17 = a10;
  v23.receiver = self;
  v23.super_class = (Class)HMDVideoStreamInterface;
  v18 = [(HMDStreamInterface *)&v23 initWithSessionID:a3 workQueue:a4 sessionHandler:a6 localRTPSocket:v10];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_delegate, v16);
    objc_storeStrong((id *)&v19->_videoStream, a7);
    -[HMDAVCVideoStream setDelegate:](v19->_videoStream, "setDelegate:", v19, v21, v22);
    objc_storeStrong((id *)&v19->_videoStreamReconfigure, a9);
    objc_storeStrong((id *)&v19->_dataSource, a10);
  }

  return v19;
}

- (HMDVideoStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 sessionHandler:(id)a6 localNetworkConfig:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unsigned int v29 = -1;
  id v17 = [(id)objc_opt_class() _createVideoStreamWithSessionHandler:v15 localNetworkConfig:v16 localRTPSocket:&v29];
  v18 = 0;
  if (!isWatch() && cameraStreamNetworkAdaptation) {
    v18 = [[HMDVideoStreamReconfigure alloc] initWithSessionID:v12 workQueue:v13 delegate:self];
  }
  uint64_t v19 = v29;
  v20 = objc_alloc_init(HMDVideoStreamInterfaceDataSource);
  id v21 = [(HMDVideoStreamInterface *)self initWithSessionID:v12 workQueue:v13 delegate:v14 sessionHandler:v15 videoStream:v17 localRTPSocket:v19 videoStreamReconfigure:v18 dataSource:v20];

  if (v17 || v29 != -1)
  {
    __int16 v25 = v21;
  }
  else
  {
    context = (void *)MEMORY[0x1D9452090]();
    id v22 = v21;
    objc_super v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = id v27 = v14;
      *(_DWORD *)buf = 138543362;
      v31 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video stream interface", buf, 0xCu);

      id v14 = v27;
    }

    __int16 v25 = 0;
  }

  return v25;
}

+ (id)_createLocalStreamAndRTPSocket:(int *)a3 localNetworkConfig:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [a1 openSocketWithNetworkConfig:v6];
  int v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = a1;
  uint64_t v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7 == -1)
  {
    if (v11)
    {
      id v17 = HMFGetLogIdentifier();
      v18 = [v6 rtpPort];
      uint64_t v19 = [v18 stringValue];
      int v20 = *__error();
      *(_DWORD *)buf = 138543874;
      v28 = v17;
      __int16 v29 = 2112;
      id v30 = v19;
      __int16 v31 = 1024;
      int v32 = v20;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Could not create rtp socket with port %@ %d", buf, 0x1Cu);
    }
    id v14 = 0;
  }
  else
  {
    if (v11)
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      __int16 v29 = 1024;
      LODWORD(v30) = v7;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating local video stream with socket %d", buf, 0x12u);
    }
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_fd(v13, (const char *)*MEMORY[0x1E4F479C0], v7);
    id v26 = 0;
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F47998]) initWithNetworkSockets:v13 callID:0 error:&v26];
    id v15 = v26;
    if (v14)
    {
      *a3 = v7;
      id v16 = v14;
    }
    else
    {
      id v21 = (void *)MEMORY[0x1D9452090]();
      id v22 = v9;
      objc_super v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v28 = v24;
        __int16 v29 = 2112;
        id v30 = v15;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create local AVCVideoStream: %@", buf, 0x16u);
      }
      close(v7);
    }
  }
  return v14;
}

+ (int)_createLocalRTPSocketWithRemoteSender:(id)a3 localNetworkConfig:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [a1 openSocketWithNetworkConfig:v7];
  if (v8 == -1)
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = a1;
    BOOL v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      xpc_object_t v13 = [v7 rtpPort];
      id v14 = [v13 stringValue];
      int v15 = *__error();
      int v17 = 138543874;
      v18 = v12;
      __int16 v19 = 2112;
      int v20 = v14;
      __int16 v21 = 1024;
      int v22 = v15;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Could not create rtp socket with port %@ %d", (uint8_t *)&v17, 0x1Cu);
    }
  }

  return v8;
}

+ (id)_createStreamWithRemoteSocketReceiver:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = a1;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v20 = v8;
    __int16 v21 = 1024;
    LODWORD(v22) = [v4 remoteVideoSocket];
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating video stream with socket %d", buf, 0x12u);
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_fd(v9, (const char *)*MEMORY[0x1E4F479C0], [v4 remoteVideoSocket]);
  id v18 = 0;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F47998]) initWithNetworkSockets:v9 callID:0 error:&v18];
  id v11 = v18;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    xpc_object_t v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = v6;
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v20 = v16;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remote socket receiver AVCVideoStream: %@", buf, 0x16u);
    }
  }

  return v10;
}

+ (id)_createStreamWithRemoteDestinationReceiver:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = a1;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    xpc_object_t v9 = [v4 remoteDestination];
    *(_DWORD *)buf = 138543618;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating video stream with destination: %@", buf, 0x16u);
  }
  id v10 = objc_alloc(MEMORY[0x1E4F47998]);
  id v11 = [v4 remoteDestination];
  id v20 = 0;
  id v12 = (void *)[v10 initWithIDSDestination:v11 callID:0 error:&v20];
  id v13 = v20;

  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    int v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = v6;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v22 = v18;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remote destination receiver AVCVideoStream: %@", buf, 0x16u);
    }
  }

  return v12;
}

+ (id)_createVideoStreamWithSessionHandler:(id)a3 localNetworkConfig:(id)a4 localRTPSocket:(int *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = a1;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    int v26 = 138543362;
    id v27 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating the video stream", (uint8_t *)&v26, 0xCu);
  }
  id v14 = v8;
  if ([v14 conformsToProtocol:&unk_1F2E06298]) {
    int v15 = v14;
  }
  else {
    int v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    int v17 = [v11 _createLocalRTPSocketWithRemoteSender:v16 localNetworkConfig:v9];
    id v18 = 0;
    *a5 = v17;
  }
  else
  {
    id v19 = v14;
    if ([v19 conformsToProtocol:&unk_1F2E8A390]) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;

    if (v21)
    {
      id v18 = [v11 _createStreamWithRemoteDestinationReceiver:v21];
    }
    else
    {
      id v22 = v19;
      if ([v22 conformsToProtocol:&unk_1F2E0BDD0]) {
        __int16 v23 = v22;
      }
      else {
        __int16 v23 = 0;
      }
      id v24 = v23;

      if (v24) {
        [v11 _createStreamWithRemoteSocketReceiver:v24];
      }
      else {
      id v18 = [v11 _createLocalStreamAndRTPSocket:a5 localNetworkConfig:v9];
      }
    }
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_15553 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_15553, &__block_literal_global_15554);
  }
  id v2 = (void *)logCategory__hmf_once_v2_15555;
  return v2;
}

uint64_t __38__HMDVideoStreamInterface_logCategory__block_invoke()
{
  logCategory__hmf_once_v2_15555 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end