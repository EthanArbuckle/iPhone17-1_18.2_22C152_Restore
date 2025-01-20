@interface HMDAudioStreamInterface
+ (BOOL)removeMutedStream:(id)a3;
+ (NSHashTable)mutedStreams;
+ (id)_createAudioStreamWithSessionHandler:(id)a3 localNetworkConfig:(id)a4 localRTPSocket:(int *)a5;
+ (id)_createLocalStreamAndRTPSocket:(int *)a3 localNetworkConfig:(id)a4;
+ (id)_createStreamWithRemoteDestinationReceiver:(id)a3;
+ (id)_createStreamWithRemoteSocketReceiver:(id)a3;
+ (id)logCategory;
+ (int)_createLocalRTPSocketWithRemoteSender:(id)a3 localNetworkConfig:(id)a4;
+ (void)addMutedStream:(id)a3;
- (BOOL)isMuted;
- (BOOL)streamStarted;
- (HMDAVCAudioStream)audioStream;
- (HMDAudioStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 sessionHandler:(id)a6 audioStream:(id)a7 localRTPSocket:(int)a8 dataSource:(id)a9;
- (HMDAudioStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 sessionHandler:(id)a6 localNetworkConfig:(id)a7;
- (HMDAudioStreamInterfaceDataSource)dataSource;
- (HMDAudioStreamInterfaceDelegate)delegate;
- (HMDPHASEExternalOutputStreamController)outputStreamController;
- (HMDPHASESharedEngine)engine;
- (NSNumber)syncSource;
- (id)logIdentifier;
- (id)stopStreamCompletionHandler;
- (unint64_t)audioStreamSetting;
- (void)_callPaused:(id)a3;
- (void)_callResumed:(id)a3;
- (void)_callStarted:(id)a3;
- (void)_callStopped:(id)a3;
- (void)_pauseStream;
- (void)_resumeStream;
- (void)_stopStreamWithCompletion:(id)a3;
- (void)dealloc;
- (void)setAudioStreamSetting:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEngine:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setOutputStreamController:(id)a3;
- (void)setStopStreamCompletionHandler:(id)a3;
- (void)setStreamStarted:(BOOL)a3;
- (void)startPHASEEngineAndController;
- (void)startStreamWithConfig:(id)a3;
- (void)startSynchronizationWithVideoStreamToken:(int64_t)a3;
- (void)stopStream;
- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 didResume:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)streamDidRTCPTimeOut:(id)a3;
- (void)streamDidRTPTimeOut:(id)a3;
- (void)streamDidServerDie:(id)a3;
- (void)streamDidStop:(id)a3;
- (void)updateAudioSetting:(unint64_t)a3;
- (void)updateAudioVolume:(id)a3 callback:(id)a4;
@end

@implementation HMDAudioStreamInterface

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopStreamCompletionHandler, 0);
  objc_storeStrong((id *)&self->_outputStreamController, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setStopStreamCompletionHandler:(id)a3
{
}

- (id)stopStreamCompletionHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setOutputStreamController:(id)a3
{
}

- (HMDPHASEExternalOutputStreamController)outputStreamController
{
  return (HMDPHASEExternalOutputStreamController *)objc_getProperty(self, a2, 104, 1);
}

- (void)setEngine:(id)a3
{
}

- (HMDPHASESharedEngine)engine
{
  return (HMDPHASESharedEngine *)objc_getProperty(self, a2, 96, 1);
}

- (HMDAudioStreamInterfaceDataSource)dataSource
{
  return (HMDAudioStreamInterfaceDataSource *)objc_getProperty(self, a2, 88, 1);
}

- (HMDAVCAudioStream)audioStream
{
  return (HMDAVCAudioStream *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAudioStreamSetting:(unint64_t)a3
{
  self->_audioStreamSetting = a3;
}

- (unint64_t)audioStreamSetting
{
  return self->_audioStreamSetting;
}

- (void)setStreamStarted:(BOOL)a3
{
  self->_streamStarted = a3;
}

- (BOOL)streamStarted
{
  return self->_streamStarted;
}

- (void)setDelegate:(id)a3
{
}

- (HMDAudioStreamInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAudioStreamInterfaceDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDStreamInterface *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)streamDidRTCPTimeOut:(id)a3
{
  v4 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HMDAudioStreamInterface_streamDidRTCPTimeOut___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __48__HMDAudioStreamInterface_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream RTCP has timed out", (uint8_t *)&v6, 0xCu);
  }
}

- (void)streamDidRTPTimeOut:(id)a3
{
  v4 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HMDAudioStreamInterface_streamDidRTPTimeOut___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __47__HMDAudioStreamInterface_streamDidRTPTimeOut___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream RTP has timed out", (uint8_t *)&v6, 0xCu);
  }
}

- (void)streamDidServerDie:(id)a3
{
  v4 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HMDAudioStreamInterface_streamDidServerDie___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __46__HMDAudioStreamInterface_streamDidServerDie___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream server died", (uint8_t *)&v8, 0xCu);
  }
  int v6 = *(void **)(a1 + 32);
  v7 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1014];
  [v6 _callStopped:v7];
}

- (void)stream:(id)a3 didResume:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  int v8 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HMDAudioStreamInterface_stream_didResume_error___block_invoke;
  block[3] = &unk_1E6A18708;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

uint64_t __50__HMDAudioStreamInterface_stream_didResume_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = HMFBooleanToString();
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    BOOL v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream resumed with didResume: %@ error: %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _callResumed:*(void *)(a1 + 40)];
}

- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  int v8 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HMDAudioStreamInterface_stream_didPause_error___block_invoke;
  block[3] = &unk_1E6A18708;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

uint64_t __49__HMDAudioStreamInterface_stream_didPause_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = HMFBooleanToString();
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    BOOL v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream paused with didPause: %@ error: %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _callPaused:*(void *)(a1 + 40)];
}

- (void)streamDidStop:(id)a3
{
  v4 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HMDAudioStreamInterface_streamDidStop___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __41__HMDAudioStreamInterface_streamDidStop___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream stopped", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _callStopped:0];
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v7 = a5;
  int v8 = [(HMDStreamInterface *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HMDAudioStreamInterface_stream_didStart_error___block_invoke;
  block[3] = &unk_1E6A18708;
  BOOL v12 = a4;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

uint64_t __49__HMDAudioStreamInterface_stream_didStart_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v6 = HMFBooleanToString();
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    BOOL v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Audio stream started with didStart: %@ error: %@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(a1 + 32) _callStarted:*(void *)(a1 + 40)];
}

- (void)startPHASEEngineAndController
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(HMDAudioStreamInterface *)self dataSource];
  int v5 = [v4 supportsPHASE];

  if (v5)
  {
    int v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      uint64_t v10 = [(HMDAudioStreamInterface *)v7 audioStream];
      *(_DWORD *)buf = 138543618;
      v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = [v10 streamToken];
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Creating PHASE engine and controller for stream token: %ld", buf, 0x16u);
    }
    __int16 v11 = [(HMDAudioStreamInterface *)v7 dataSource];
    BOOL v12 = [(HMDAudioStreamInterface *)v7 audioStream];
    uint64_t v13 = [v12 streamToken];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__HMDAudioStreamInterface_startPHASEEngineAndController__block_invoke;
    v14[3] = &unk_1E6A09C70;
    v14[4] = v7;
    [v11 createPHASEEngineAndControllerForStreamToken:v13 completion:v14];
  }
}

void __56__HMDAudioStreamInterface_startPHASEEngineAndController__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    BOOL v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to create PHASE engine and controller: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v14 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__HMDAudioStreamInterface_startPHASEEngineAndController__block_invoke_88;
    block[3] = &unk_1E6A19668;
    block[4] = *(void *)(a1 + 32);
    id v16 = v7;
    id v17 = v8;
    dispatch_async(v14, block);
  }
}

void __56__HMDAudioStreamInterface_startPHASEEngineAndController__block_invoke_88(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] == 3)
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Not starting PHASEExternalOutputStreamController as stream is already stopped", buf, 0xCu);
    }
    [*(id *)(a1 + 40) stop];
  }
  else
  {
    int v6 = *(void **)(a1 + 48);
    id v13 = 0;
    char v7 = [v6 startAndReturnError:&v13];
    id v8 = v13;
    if (v7)
    {
      [*(id *)(a1 + 32) setEngine:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) setOutputStreamController:*(void *)(a1 + 48)];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = *(id *)(a1 + 32);
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        BOOL v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to start PHASEExternalOutputStreamController: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 40) stop];
    }
  }
}

- (void)_callStopped:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(HMDStreamInterface *)self setState:3];
  int v6 = [(HMDAudioStreamInterface *)self dataSource];
  if ([v6 usesGlobalMuting])
  {
    int v7 = [(id)objc_opt_class() removeMutedStream:self];

    if (v7) {
      [(HMDAudioStreamInterface *)self setMuted:0];
    }
  }
  else
  {
  }
  id v8 = [(HMDAudioStreamInterface *)self outputStreamController];
  [v8 stopAndInvalidate];

  [(HMDAudioStreamInterface *)self setOutputStreamController:0];
  id v9 = [(HMDAudioStreamInterface *)self engine];
  [v9 stop];

  id v10 = (void *)MEMORY[0x1D9452090]([(HMDAudioStreamInterface *)self setEngine:0]);
  id v11 = self;
  BOOL v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = HMFGetLogIdentifier();
    int v16 = 138543362;
    id v17 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Calling delegate audioStream:didStop", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v14 = [(HMDAudioStreamInterface *)v11 delegate];
  if (objc_opt_respondsToSelector()) {
    [v14 audioStream:v11 didStop:v4];
  }
  uint64_t v15 = [(HMDAudioStreamInterface *)v11 stopStreamCompletionHandler];
  if (v15)
  {
    [(HMDAudioStreamInterface *)v11 setStopStreamCompletionHandler:0];
    v15[2](v15);
  }
}

- (void)_callResumed:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = (void *)MEMORY[0x1D9452090]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    BOOL v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate audioStream:didResume", (uint8_t *)&v11, 0xCu);
  }
  id v10 = [(HMDAudioStreamInterface *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 audioStream:v7 didResume:v4];
  }
}

- (void)_callPaused:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = (void *)MEMORY[0x1D9452090]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    BOOL v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate audioStream:didPause", (uint8_t *)&v11, 0xCu);
  }
  id v10 = [(HMDAudioStreamInterface *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 audioStream:v7 didPause:v4];
  }
}

- (void)_callStarted:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = (void *)MEMORY[0x1D9452090]([(HMDStreamInterface *)self setState:2]);
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    BOOL v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Calling delegate audioStream:didStart", (uint8_t *)&v11, 0xCu);
  }
  id v10 = [(HMDAudioStreamInterface *)v7 delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 audioStream:v7 didStart:v4];
  }
  [(HMDAudioStreamInterface *)v7 startPHASEEngineAndController];
}

- (BOOL)isMuted
{
  id v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAudioStreamInterface *)self dataSource];
  LOBYTE(v3) = [v4 isMuted];

  return (char)v3;
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = (void *)MEMORY[0x1D9452090]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = HMFBooleanToString();
    int v17 = 138543618;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    __int16 v20 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Setting audio muted to %@", (uint8_t *)&v17, 0x16u);
  }
  int v11 = [(HMDAudioStreamInterface *)v7 dataSource];
  int v12 = [v11 usesGlobalMuting];

  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    if (v3) {
      [v13 addMutedStream:v7];
    }
    else {
      [v13 removeMutedStream:v7];
    }
  }
  uint64_t v14 = [(HMDAudioStreamInterface *)v7 dataSource];
  [v14 setMuted:v3];

  if (v3) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 3;
  }
  int v16 = [(HMDAudioStreamInterface *)v7 audioStream];
  [v16 setDirection:v15];
}

- (void)startSynchronizationWithVideoStreamToken:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = (void *)MEMORY[0x1D9452090]();
  int v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v11 = 138543618;
    int v12 = v9;
    __int16 v13 = 2048;
    int64_t v14 = a3;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting synchronization with video stream token: %ld", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(HMDAudioStreamInterface *)v7 audioStream];
  [v10 startSynchronizeWithStream:a3];
}

- (void)_resumeStream
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAudioStreamInterface *)self dataSource];
  BOOL v5 = [(HMDAudioStreamInterface *)self isMuted];
  int v6 = [(HMDStreamInterface *)self sessionID];
  int v7 = [v6 hostProcessBundleIdentifier];
  [v4 setAudioSessionPropertiesWithShouldAllowSystemSounds:v5 hostProcessBundleIdentifier:v7];

  LODWORD(v6) = [(HMDAudioStreamInterface *)self streamStarted];
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v11)
    {
      int v12 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Resuming audio stream", (uint8_t *)&v15, 0xCu);
    }
    __int16 v13 = [(HMDAudioStreamInterface *)v9 audioStream];
    [v13 resume];
  }
  else
  {
    if (v11)
    {
      int64_t v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v14;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Starting audio stream", (uint8_t *)&v15, 0xCu);
    }
    [(HMDAudioStreamInterface *)v9 setStreamStarted:1];
    __int16 v13 = [(HMDAudioStreamInterface *)v9 audioStream];
    [v13 start];
  }
}

- (void)_pauseStream
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  BOOL v5 = self;
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Pausing audio stream", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(HMDAudioStreamInterface *)v5 audioStream];
  [v8 pause];
}

- (void)_stopStreamWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  BOOL v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDStreamInterface *)self state] == 3)
  {
    int v6 = (void *)MEMORY[0x1D9452090]();
    int v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Not stopping stream because it has already stopped", (uint8_t *)&v15, 0xCu);
    }
    v4[2](v4);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]([(HMDAudioStreamInterface *)self setStopStreamCompletionHandler:v4]);
    uint64_t v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Stopping audio stream", (uint8_t *)&v15, 0xCu);
    }
    int64_t v14 = [(HMDAudioStreamInterface *)v11 audioStream];
    [v14 stop];
  }
}

- (void)stopStream
{
  BOOL v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__HMDAudioStreamInterface_stopStream__block_invoke;
  v4[3] = &unk_1E6A19B30;
  v4[4] = self;
  [(HMDAudioStreamInterface *)self _stopStreamWithCompletion:v4];
}

- (void)updateAudioVolume:(id)a3 callback:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, BOOL))a4;
  id v8 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  int v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    __int16 v13 = [(HMDAudioStreamInterface *)v10 audioStream];
    [v13 volume];
    double v15 = v14;
    [v6 floatValue];
    int v25 = 138543874;
    v26 = v12;
    __int16 v27 = 2048;
    double v28 = v15;
    __int16 v29 = 2048;
    double v30 = v16;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Setting audio stream volume from %f to %f", (uint8_t *)&v25, 0x20u);
  }
  [v6 floatValue];
  int v18 = v17;
  __int16 v19 = [(HMDAudioStreamInterface *)v10 audioStream];
  LODWORD(v20) = v18;
  [v19 setVolume:v20];

  uint64_t v21 = [(HMDAudioStreamInterface *)v10 audioStream];
  [v21 volume];
  float v23 = v22;
  [v6 floatValue];
  v7[2](v7, v23 == v24);
}

- (void)updateAudioSetting:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (a3 - 1 >= 3)
  {
    uint64_t v14 = MEMORY[0x1D9452090]();
    double v15 = self;
    float v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      int v23 = 138543618;
      float v24 = v17;
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Invalid audio stream setting %tu", (uint8_t *)&v23, 0x16u);
    }
    __int16 v13 = (void *)v14;
    goto LABEL_9;
  }
  unint64_t v6 = [(HMDAudioStreamInterface *)self audioStreamSetting];
  int v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  int v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6 == a3)
  {
    if (v10)
    {
      uint64_t v11 = HMFGetLogIdentifier();
      [(HMDAudioStreamInterface *)v8 audioStreamSetting];
      int v12 = HMCameraAudioStreamSettingAsString();
      int v23 = 138543618;
      float v24 = v11;
      __int16 v25 = 2112;
      unint64_t v26 = (unint64_t)v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Audio stream setting is already set to %@", (uint8_t *)&v23, 0x16u);
    }
    __int16 v13 = v7;
LABEL_9:
    return;
  }
  if (v10)
  {
    int v18 = HMFGetLogIdentifier();
    [(HMDAudioStreamInterface *)v8 audioStreamSetting];
    __int16 v19 = HMCameraAudioStreamSettingAsString();
    double v20 = HMCameraAudioStreamSettingAsString();
    int v23 = 138543874;
    float v24 = v18;
    __int16 v25 = 2112;
    unint64_t v26 = (unint64_t)v19;
    __int16 v27 = 2112;
    double v28 = v20;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Changing the audio stream setting from %@ to %@", (uint8_t *)&v23, 0x20u);
  }
  [(HMDAudioStreamInterface *)v8 setAudioStreamSetting:a3];
  switch(a3)
  {
    case 3uLL:
      uint64_t v21 = v8;
      uint64_t v22 = 0;
LABEL_19:
      [(HMDAudioStreamInterface *)v21 setMuted:v22];
      [(HMDAudioStreamInterface *)v8 _resumeStream];
      return;
    case 2uLL:
      uint64_t v21 = v8;
      uint64_t v22 = 1;
      goto LABEL_19;
    case 1uLL:
      [(HMDAudioStreamInterface *)v8 _pauseStream];
      break;
  }
}

- (void)startStreamWithConfig:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(HMDStreamInterface *)self loadMiscFields:v4];
  int v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  int v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v10)
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v19;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to load misc fields to audio config", buf, 0xCu);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1016];
    goto LABEL_11;
  }
  if (v10)
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v11;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Configuring audio stream with configuration: %@", buf, 0x16u);
  }
  int v12 = [(HMDAudioStreamInterface *)v8 audioStream];
  id v20 = 0;
  char v13 = [v12 configure:v4 error:&v20];
  id v14 = v20;

  if ((v13 & 1) == 0)
  {
    double v15 = (void *)MEMORY[0x1D9452090]();
    float v16 = v8;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v18;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure audio stream: %@", buf, 0x16u);
    }
LABEL_11:
    [(HMDAudioStreamInterface *)v8 _callStarted:v14];
  }
}

- (NSNumber)syncSource
{
  BOOL v3 = [(HMDStreamInterface *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAudioStreamInterface *)self audioStream];
  BOOL v5 = [v4 capabilities];
  BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F479B0]];

  return (NSNumber *)v6;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMDAudioStreamInterface object", buf, 0xCu);
  }
  v7.receiver = v4;
  v7.super_class = (Class)HMDAudioStreamInterface;
  [(HMDStreamInterface *)&v7 dealloc];
}

- (HMDAudioStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 sessionHandler:(id)a6 audioStream:(id)a7 localRTPSocket:(int)a8 dataSource:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if (!v19 && (v9 & 0x80000000) != 0)
  {
    id v24 = (HMDAudioStreamInterface *)_HMFPreconditionFailure();
    return [(HMDAudioStreamInterface *)v24 initWithSessionID:v26 workQueue:v27 delegate:v28 sessionHandler:v29 localNetworkConfig:v30];
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)HMDAudioStreamInterface;
    uint64_t v21 = [(HMDStreamInterface *)&v31 initWithSessionID:v15 workQueue:v16 sessionHandler:v18 localRTPSocket:v9];
    uint64_t v22 = v21;
    if (v21)
    {
      objc_storeWeak((id *)&v21->_delegate, v17);
      v22->_streamStarted = 0;
      v22->_audioStreamSetting = 1;
      objc_storeStrong((id *)&v22->_audioStream, a7);
      [(HMDAVCAudioStream *)v22->_audioStream setDelegate:v22];
      objc_storeStrong((id *)&v22->_dataSource, a9);
    }

    return v22;
  }
}

- (HMDAudioStreamInterface)initWithSessionID:(id)a3 workQueue:(id)a4 delegate:(id)a5 sessionHandler:(id)a6 localNetworkConfig:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unsigned int v26 = -1;
  id v17 = [(id)objc_opt_class() _createAudioStreamWithSessionHandler:v15 localNetworkConfig:v16 localRTPSocket:&v26];
  uint64_t v18 = v26;
  if (v17 || v26 != -1)
  {
    id v24 = objc_alloc_init(HMDAudioStreamInterfaceDataSource);
    id v20 = [(HMDAudioStreamInterface *)self initWithSessionID:v12 workQueue:v13 delegate:v14 sessionHandler:v15 audioStream:v17 localRTPSocket:v18 dataSource:v24];

    __int16 v23 = v20;
  }
  else
  {
    id v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v28 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audio stream interface", buf, 0xCu);
    }
    __int16 v23 = 0;
  }

  return v23;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t45_39207 != -1) {
    dispatch_once(&logCategory__hmf_once_t45_39207, &__block_literal_global_39208);
  }
  v2 = (void *)logCategory__hmf_once_v46_39209;
  return v2;
}

uint64_t __38__HMDAudioStreamInterface_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v46_39209;
  logCategory__hmf_once_v46_39209 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)removeMutedStream:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  BOOL v5 = [a1 mutedStreams];
  [v5 removeObject:v4];

  BOOL v6 = [a1 mutedStreams];
  objc_super v7 = [v6 anyObject];
  LOBYTE(v5) = v7 == 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&mutedStreamsLock);
  return (char)v5;
}

+ (void)addMutedStream:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = [a1 mutedStreams];
  [v4 addObject:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)&mutedStreamsLock);
}

+ (NSHashTable)mutedStreams
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&mutedStreamsLock);
  v2 = (void *)mutedStreams;
  if (!mutedStreams)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v4 = (void *)mutedStreams;
    mutedStreams = v3;

    v2 = (void *)mutedStreams;
  }
  return (NSHashTable *)v2;
}

+ (id)_createLocalStreamAndRTPSocket:(int *)a3 localNetworkConfig:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [a1 openSocketWithNetworkConfig:v6];
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = a1;
  uint64_t v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7 == -1)
  {
    if (v11)
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = [v6 rtpPort];
      id v19 = [v18 stringValue];
      int v20 = *__error();
      *(_DWORD *)buf = 138543874;
      id v28 = v17;
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
      id v28 = v12;
      __int16 v29 = 1024;
      LODWORD(v30) = v7;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating local audio stream with socket %d", buf, 0x12u);
    }
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_fd(v13, (const char *)*MEMORY[0x1E4F479C0], v7);
    id v26 = 0;
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F47908]) initWithNetworkSockets:v13 isOriginator:0 error:&v26];
    id v15 = v26;
    if (v14)
    {
      *a3 = v7;
      id v16 = v14;
    }
    else
    {
      uint64_t v21 = (void *)MEMORY[0x1D9452090]();
      id v22 = v9;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v28 = v24;
        __int16 v29 = 2112;
        id v30 = v15;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create local AVCAudioStream: %@", buf, 0x16u);
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
      uint64_t v18 = v12;
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
    LODWORD(v22) = [v4 remoteAudioSocket];
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating audio stream with socket: %d", buf, 0x12u);
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_fd(v9, (const char *)*MEMORY[0x1E4F479C0], [v4 remoteAudioSocket]);
  id v18 = 0;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F47908]) initWithNetworkSockets:v9 isOriginator:0 error:&v18];
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
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remote socket receiver AVCAudioStream: %@", buf, 0x16u);
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
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating audio stream with destination: %@", buf, 0x16u);
  }
  id v10 = objc_alloc(MEMORY[0x1E4F47908]);
  id v11 = [v4 remoteDestination];
  id v20 = 0;
  id v12 = (void *)[v10 initWithIDSDestination:v11 isOriginator:0 error:&v20];
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
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to create remote destination receiver AVCAudioStream: %@", buf, 0x16u);
    }
  }

  return v12;
}

+ (id)_createAudioStreamWithSessionHandler:(id)a3 localNetworkConfig:(id)a4 localRTPSocket:(int *)a5
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
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating the audio stream", (uint8_t *)&v26, 0xCu);
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

@end