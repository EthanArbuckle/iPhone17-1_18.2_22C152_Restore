@interface AVAudioDeviceTestService
- (AVAudioDeviceTestService)init;
- (AVAudioEngine)engine;
- (AVAudioFile)inputTapFile;
- (AVAudioNode)nodeToCaptureData;
- (AVAudioPlayerNode)player;
- (AVAudioSession)currentSession;
- (AVAudioSession)hearingTestSession;
- (AVAudioSourceNode)sourceNode;
- (AVAudioUnit)multichannelMixer;
- (AVAudioUnitEQ)inputFilter;
- (AVAudioUnitEQ)outputFilter;
- (BOOL)createAudioEngineAndPulseToneHandlerFor:(id)a3;
- (BOOL)isMixerOutputEnabled;
- (BOOL)isOutputRouteBluetooth:(id)a3 session:(id)a4;
- (BOOL)isPlaybackForTestEnabled;
- (BOOL)setVolume:(id)a3;
- (BOOL)setVolume:(id)a3 session:(id)a4;
- (BOOL)testServiceSupportedOnHardware;
- (NSNumber)userVolumeBeforeHearingTest;
- (OS_dispatch_queue)toneQueue;
- (OS_os_transaction)transaction;
- (double)calculateCrossCorrelationPeakRelativeToSource:(id)a3 capture:(id)a4;
- (id).cxx_construct;
- (id)convertBufferFor:(id)a3 sourceBuffer:(id)a4;
- (id)interruptionObserver;
- (id)mediaservicesLostObserver;
- (id)mediaservicesResetObserver;
- (id)routeChangeObserver;
- (id)stringForInterruptionReason:(unint64_t)a3;
- (id)stringForRouteChangeReason:(unint64_t)a3;
- (id)systemVolumeObserver;
- (int64_t)extensionHandle;
- (void)cancel;
- (void)checkSequenceValidity:(id)a3 completion:(id)a4;
- (void)cleanUp;
- (void)cleanUpObservers;
- (void)configureDataSources:(id)a3 session:(id)a4;
- (void)configureMultiChannelMixerForOutputChannel:(int64_t)a3 totalChannels:(int64_t)a4;
- (void)createAudioEngineAndProcessingChain:(id)a3 session:(id)a4 sourceNodeBlock:(id)a5;
- (void)dealloc;
- (void)passExtensionToken:(id)a3;
- (void)playback:(id)a3 filePath:(id)a4 completion:(id)a5;
- (void)playbackTone:(id)a3 completion:(id)a4;
- (void)removeSystemVolumeObserver;
- (void)resetVolume:(float)a3;
- (void)setCurrentSession:(id)a3;
- (void)setEngine:(id)a3;
- (void)setExtensionHandle:(int64_t)a3;
- (void)setHearingTestSession:(id)a3;
- (void)setInputFilter:(id)a3;
- (void)setInputTapFile:(id)a3;
- (void)setInterruptionObserver:(id)a3;
- (void)setMediaservicesLostObserver:(id)a3;
- (void)setMediaservicesResetObserver:(id)a3;
- (void)setMultichannelMixer:(id)a3;
- (void)setNodeToCaptureData:(id)a3;
- (void)setOutputFilter:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setRouteChangeObserver:(id)a3;
- (void)setSourceNode:(id)a3;
- (void)setSystemVolumeObserver:(id)a3;
- (void)setTestServiceSupportedOnHardware:(BOOL)a3;
- (void)setToneQueue:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUserVolumeBeforeHearingTest:(id)a3;
- (void)setupAudioEngineFor:(id)a3 sourceNodeBlock:(id)a4;
- (void)setupAudioSessionFor:(id)a3 playbackOnly:(BOOL)a4 completion:(id)a5;
- (void)setupAudioSessionForHearingTest:(id)a3;
- (void)setupAudioSessionForHearingTestWithStatus:(id)a3 success:(id)a4;
- (void)setupMultiChannelMixerForOutputChannel:(id)a3 completion:(id)a4;
- (void)setupObservers:(id)a3;
- (void)setupVolumeObserverForVolume:(float)a3 completion:(id)a4;
- (void)startRecording:(id)a3 filePath:(id)a4 completion:(id)a5;
- (void)startWithSequence:(id)a3 completion:(id)a4;
- (void)stopAudioSession:(id)a3;
- (void)stopPlayback;
- (void)stopRecording:(id)a3;
@end

@implementation AVAudioDeviceTestService

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_hearingTestSession, 0);
  objc_storeStrong((id *)&self->_userVolumeBeforeHearingTest, 0);
  objc_storeStrong((id *)&self->_toneQueue, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong(&self->_systemVolumeObserver, 0);
  objc_storeStrong(&self->_mediaservicesResetObserver, 0);
  objc_storeStrong(&self->_mediaservicesLostObserver, 0);
  objc_storeStrong(&self->_interruptionObserver, 0);
  objc_storeStrong(&self->_routeChangeObserver, 0);
  objc_storeStrong((id *)&self->_inputTapFile, 0);
  objc_storeStrong((id *)&self->_nodeToCaptureData, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_multichannelMixer, 0);
  objc_storeStrong((id *)&self->_outputFilter, 0);
  objc_storeStrong((id *)&self->_inputFilter, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_engine, 0);

  std::unique_ptr<PulseTone>::reset[abi:ne180100]((uint64_t *)&self->mPulseToneHandler, 0);
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setHearingTestSession:(id)a3
{
}

- (AVAudioSession)hearingTestSession
{
  return self->_hearingTestSession;
}

- (void)setUserVolumeBeforeHearingTest:(id)a3
{
}

- (NSNumber)userVolumeBeforeHearingTest
{
  return self->_userVolumeBeforeHearingTest;
}

- (void)setToneQueue:(id)a3
{
}

- (OS_dispatch_queue)toneQueue
{
  return self->_toneQueue;
}

- (void)setSourceNode:(id)a3
{
}

- (AVAudioSourceNode)sourceNode
{
  return self->_sourceNode;
}

- (void)setExtensionHandle:(int64_t)a3
{
  self->_extensionHandle = a3;
}

- (int64_t)extensionHandle
{
  return self->_extensionHandle;
}

- (void)setTestServiceSupportedOnHardware:(BOOL)a3
{
  self->_testServiceSupportedOnHardware = a3;
}

- (BOOL)testServiceSupportedOnHardware
{
  return self->_testServiceSupportedOnHardware;
}

- (void)setSystemVolumeObserver:(id)a3
{
}

- (id)systemVolumeObserver
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setMediaservicesResetObserver:(id)a3
{
}

- (id)mediaservicesResetObserver
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setMediaservicesLostObserver:(id)a3
{
}

- (id)mediaservicesLostObserver
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setInterruptionObserver:(id)a3
{
}

- (id)interruptionObserver
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setRouteChangeObserver:(id)a3
{
}

- (id)routeChangeObserver
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setInputTapFile:(id)a3
{
}

- (AVAudioFile)inputTapFile
{
  return (AVAudioFile *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNodeToCaptureData:(id)a3
{
}

- (AVAudioNode)nodeToCaptureData
{
  return (AVAudioNode *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurrentSession:(id)a3
{
}

- (AVAudioSession)currentSession
{
  return (AVAudioSession *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMultichannelMixer:(id)a3
{
}

- (AVAudioUnit)multichannelMixer
{
  return (AVAudioUnit *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOutputFilter:(id)a3
{
}

- (AVAudioUnitEQ)outputFilter
{
  return (AVAudioUnitEQ *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInputFilter:(id)a3
{
}

- (AVAudioUnitEQ)inputFilter
{
  return (AVAudioUnitEQ *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPlayer:(id)a3
{
}

- (AVAudioPlayerNode)player
{
  return (AVAudioPlayerNode *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEngine:(id)a3
{
}

- (AVAudioEngine)engine
{
  return (AVAudioEngine *)objc_getProperty(self, a2, 24, 1);
}

- (void)cancel
{
  v2 = [(AVAudioDeviceTestService *)self engine];
  [v2 stop];

  exit(0);
}

- (void)cleanUp
{
  v3 = [(AVAudioDeviceTestService *)self sourceNode];

  if (v3)
  {
    v4 = [(AVAudioDeviceTestService *)self sourceNode];
    [v4 reset];

    [(AVAudioDeviceTestService *)self setSourceNode:0];
  }
  v5 = [(AVAudioDeviceTestService *)self player];

  if (v5)
  {
    v6 = [(AVAudioDeviceTestService *)self player];
    [v6 stop];

    [(AVAudioDeviceTestService *)self setPlayer:0];
  }
  uint64_t v7 = [(AVAudioDeviceTestService *)self engine];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(AVAudioDeviceTestService *)self engine];
    int v10 = [v9 isRunning];

    if (v10)
    {
      v11 = [(AVAudioDeviceTestService *)self engine];
      [v11 stop];

      v12 = [(AVAudioDeviceTestService *)self engine];
      [v12 reset];

      [(AVAudioDeviceTestService *)self setEngine:0];
    }
  }
  value = self->mPulseToneHandler.__ptr_.__value_;
  p_mPulseToneHandler = (uint64_t *)&self->mPulseToneHandler;
  if (value)
  {
    std::unique_ptr<PulseTone>::reset[abi:ne180100](p_mPulseToneHandler, 0);
  }
}

- (void)removeSystemVolumeObserver
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(AVAudioDeviceTestService *)self systemVolumeObserver];

  if (v3)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    v4 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      v8 = "AVAudioDeviceTestService.mm";
      __int16 v9 = 1024;
      int v10 = 1893;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Removing systemVolumeObserver", (uint8_t *)&v7, 0x12u);
    }
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = [(AVAudioDeviceTestService *)self systemVolumeObserver];
    [v5 removeObserver:v6];
  }
}

- (void)cleanUpObservers
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  v3 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "AVAudioDeviceTestService.mm";
    __int16 v29 = 1024;
    int v30 = 1861;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d cleaning up observers", buf, 0x12u);
  }
  v4 = [(AVAudioDeviceTestService *)self routeChangeObserver];
  BOOL v5 = v4 == 0;

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v7 = [(AVAudioDeviceTestService *)self routeChangeObserver];
    [v6 removeObserver:v7];
  }
  v8 = [(AVAudioDeviceTestService *)self interruptionObserver];
  BOOL v9 = v8 == 0;

  if (!v9)
  {
    int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = [(AVAudioDeviceTestService *)self interruptionObserver];
    [v10 removeObserver:v11];
  }
  v12 = [(AVAudioDeviceTestService *)self mediaservicesLostObserver];
  BOOL v13 = v12 == 0;

  if (!v13)
  {
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v15 = [(AVAudioDeviceTestService *)self mediaservicesLostObserver];
    [v14 removeObserver:v15];
  }
  v16 = [(AVAudioDeviceTestService *)self mediaservicesResetObserver];
  BOOL v17 = v16 == 0;

  if (!v17)
  {
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v19 = [(AVAudioDeviceTestService *)self mediaservicesResetObserver];
    [v18 removeObserver:v19];
  }
  [(AVAudioDeviceTestService *)self removeSystemVolumeObserver];
  v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 removeObserver:self];

  v21 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  uint64_t v22 = *MEMORY[0x1E4F74EB0];
  id v26 = 0;
  [v21 setAttribute:0 forKey:v22 error:&v26];
  id v23 = v26;

  if (v23)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    v24 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = [v23 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v28 = "AVAudioDeviceTestService.mm";
      __int16 v29 = 1024;
      int v30 = 1886;
      __int16 v31 = 2114;
      v32 = v25;
      _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to unsubscribe from AVSystemController volume notification. { error=%{public}@ }", buf, 0x1Cu);
    }
  }
}

- (id)stringForRouteChangeReason:(unint64_t)a3
{
  if (a3 > 8) {
    return &stru_1EEFA9548;
  }
  else {
    return off_1E5964E08[a3];
  }
}

- (id)stringForInterruptionReason:(unint64_t)a3
{
  if (a3 > 2) {
    return &stru_1EEFA9548;
  }
  else {
    return off_1E5964DF0[a3];
  }
}

- (void)setupObservers:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  BOOL v5 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v47 = "AVAudioDeviceTestService.mm";
    __int16 v48 = 1024;
    int v49 = 1721;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Setting up observers", buf, 0x12u);
  }
  v6 = [(AVAudioDeviceTestService *)self routeChangeObserver];
  BOOL v7 = v6 == 0;

  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v9 = [(AVAudioDeviceTestService *)self routeChangeObserver];
    [v8 removeObserver:v9];
  }
  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v11 = *MEMORY[0x1E4F4E9B0];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __43__AVAudioDeviceTestService_setupObservers___block_invoke;
  v44[3] = &unk_1E5964DB8;
  v44[4] = self;
  id v12 = v4;
  id v45 = v12;
  BOOL v13 = [(id)v10 addObserverForName:v11 object:0 queue:0 usingBlock:v44];
  [(AVAudioDeviceTestService *)self setRouteChangeObserver:v13];

  v14 = [(AVAudioDeviceTestService *)self interruptionObserver];
  LOBYTE(v10) = v14 == 0;

  if ((v10 & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v16 = [(AVAudioDeviceTestService *)self interruptionObserver];
    [v15 removeObserver:v16];
  }
  uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v18 = *MEMORY[0x1E4F4E838];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __43__AVAudioDeviceTestService_setupObservers___block_invoke_178;
  v42[3] = &unk_1E5964DB8;
  id v19 = v12;
  v42[4] = self;
  id v43 = v19;
  v20 = [(id)v17 addObserverForName:v18 object:0 queue:0 usingBlock:v42];
  [(AVAudioDeviceTestService *)self setInterruptionObserver:v20];

  v21 = [(AVAudioDeviceTestService *)self mediaservicesLostObserver];
  LOBYTE(v17) = v21 == 0;

  if ((v17 & 1) == 0)
  {
    uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v23 = [(AVAudioDeviceTestService *)self mediaservicesLostObserver];
    [v22 removeObserver:v23];
  }
  uint64_t v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v25 = *MEMORY[0x1E4F4E888];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __43__AVAudioDeviceTestService_setupObservers___block_invoke_179;
  v40[3] = &unk_1E5964C08;
  id v26 = v19;
  id v41 = v26;
  v27 = [(id)v24 addObserverForName:v25 object:0 queue:0 usingBlock:v40];
  [(AVAudioDeviceTestService *)self setMediaservicesLostObserver:v27];

  v28 = [(AVAudioDeviceTestService *)self mediaservicesResetObserver];
  LOBYTE(v24) = v28 == 0;

  if ((v24 & 1) == 0)
  {
    __int16 v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v30 = [(AVAudioDeviceTestService *)self mediaservicesResetObserver];
    [v29 removeObserver:v30];
  }
  __int16 v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v32 = *MEMORY[0x1E4F4E898];
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  v37 = __43__AVAudioDeviceTestService_setupObservers___block_invoke_180;
  v38 = &unk_1E5964C08;
  id v33 = v26;
  id v39 = v33;
  v34 = [v31 addObserverForName:v32 object:0 queue:0 usingBlock:&v35];
  -[AVAudioDeviceTestService setMediaservicesResetObserver:](self, "setMediaservicesResetObserver:", v34, v35, v36, v37, v38);
}

void __43__AVAudioDeviceTestService_setupObservers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4E9C8]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  BOOL v7 = [*(id *)(a1 + 32) stringForRouteChangeReason:v6];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  v8 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v3 userInfo];
    int v11 = 136315906;
    id v12 = "AVAudioDeviceTestService.mm";
    __int16 v13 = 1024;
    int v14 = 1731;
    __int16 v15 = 2112;
    v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d route change (%@) - %@", (uint8_t *)&v11, 0x26u);
  }
  uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __43__AVAudioDeviceTestService_setupObservers___block_invoke_178(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 userInfo];
  BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4E860]];

  if (v5)
  {
    uint64_t v6 = [v5 unsignedIntegerValue];
    BOOL v7 = [v3 userInfo];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F4E850]];
    uint64_t v9 = [v8 unsignedIntegerValue];

    uint64_t v10 = [*(id *)(a1 + 32) stringForInterruptionReason:v9];
    if (v6)
    {
      if (v6 == 1)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        int v11 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v3 userInfo];
          int v18 = 136315906;
          uint64_t v19 = "AVAudioDeviceTestService.mm";
          __int16 v20 = 1024;
          int v21 = 1765;
          __int16 v22 = 2114;
          id v23 = v10;
          __int16 v24 = 2114;
          uint64_t v25 = v12;
          _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Interruption began (%{public}@) - %{public}@", (uint8_t *)&v18, 0x26u);
        }
        __int16 v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-16 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        __int16 v17 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315394;
          uint64_t v19 = "AVAudioDeviceTestService.mm";
          __int16 v20 = 1024;
          int v21 = 1784;
          _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Unhandled interruption type", (uint8_t *)&v18, 0x12u);
        }
        __int16 v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-3 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      __int16 v15 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v3 userInfo];
        int v18 = 136315906;
        uint64_t v19 = "AVAudioDeviceTestService.mm";
        __int16 v20 = 1024;
        int v21 = 1775;
        __int16 v22 = 2114;
        id v23 = v10;
        __int16 v24 = 2114;
        uint64_t v25 = v16;
        _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Interruption ended (%{public}@) - %{public}@", (uint8_t *)&v18, 0x26u);
      }
      __int16 v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-17 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    int v14 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      uint64_t v19 = "AVAudioDeviceTestService.mm";
      __int16 v20 = 1024;
      int v21 = 1749;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d No AVAudioSessionInterruptionTypeKey. note: %@", (uint8_t *)&v18, 0x1Cu);
    }
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-3 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __43__AVAudioDeviceTestService_setupObservers___block_invoke_179(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  id v4 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [v3 userInfo];
    uint64_t v6 = generateAudioSelfTestError(-4);
    int v8 = 136315906;
    uint64_t v9 = "AVAudioDeviceTestService.mm";
    __int16 v10 = 1024;
    int v11 = 1799;
    __int16 v12 = 2112;
    __int16 v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = [v6 code];
    _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mediaserverd/audiomxd died (%@) with test error (%li)", (uint8_t *)&v8, 0x26u);
  }
  BOOL v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-4 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43__AVAudioDeviceTestService_setupObservers___block_invoke_180(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  id v4 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [v3 userInfo];
    uint64_t v6 = generateAudioSelfTestError(-5);
    int v8 = 136315906;
    uint64_t v9 = "AVAudioDeviceTestService.mm";
    __int16 v10 = 1024;
    int v11 = 1810;
    __int16 v12 = 2112;
    __int16 v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = [v6 code];
    _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mediaserverd/audiomxd was reset (%@) with test error (%li)", (uint8_t *)&v8, 0x26u);
  }
  BOOL v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-5 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configureMultiChannelMixerForOutputChannel:(int64_t)a3 totalChannels:(int64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v8 = [(AVAudioDeviceTestService *)self multichannelMixer];
  uint64_t v9 = [v8 outputFormatForBus:0];
  int64_t v10 = [v9 channelCount];

  if (v10 <= a3)
  {
    __int16 v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"AVAudioDeviceTestService.mm" lineNumber:1695 description:@"the desired channel must not be greater than the number of channels"];
  }
  int v11 = [(AVAudioDeviceTestService *)self multichannelMixer];
  __int16 v12 = [v11 inputFormatForBus:0];
  int v13 = [v12 channelCount];

  if (v13 != 1)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"AVAudioDeviceTestService.mm" lineNumber:1696 description:@"input format doesn't contain 1 channel"];
  }
  __int16 v14 = [(AVAudioDeviceTestService *)self multichannelMixer];
  uint64_t v15 = [v14 inputFormatForBus:0];
  int v16 = [v15 channelCount];
  __int16 v17 = [(AVAudioDeviceTestService *)self multichannelMixer];
  int v18 = [v17 outputFormatForBus:0];
  uint64_t v19 = [v18 channelCount] * v16;

  *(_DWORD *)buf = 0;
  std::vector<float>::vector(__b, v19, (int *)buf);
  if (a4 == 1)
  {
    *((_DWORD *)__b[0] + a3) = 1065353216;
  }
  else if (a4 >= 1)
  {
    memset_pattern16(__b[0], &unk_19D8B1E60, 4 * a4);
  }
  __int16 v20 = [(AVAudioDeviceTestService *)self multichannelMixer];
  int v21 = (OpaqueAudioComponentInstance *)[v20 audioUnit];
  OSStatus v22 = AudioUnitSetProperty(v21, 0xBBEu, 1u, 0, __b[0], 4 * v19);

  if (v22)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    id v23 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v28 = "AVAudioDeviceTestService.mm";
      __int16 v29 = 1024;
      int v30 = 1715;
      __int16 v31 = 1024;
      OSStatus v32 = v22;
      _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioUnitSetProperty kAudioUnitProperty_MatrixLevels %i", buf, 0x18u);
    }
  }
  if (__b[0])
  {
    __b[1] = __b[0];
    operator delete(__b[0]);
  }
}

- (void)setupMultiChannelMixerForOutputChannel:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  int v8 = [(AVAudioDeviceTestService *)self multichannelMixer];
  uint64_t v9 = [v8 outputFormatForBus:0];
  int v10 = [v9 channelCount];

  int v11 = [(AVAudioDeviceTestService *)self multichannelMixer];
  __int16 v12 = [v11 inputFormatForBus:0];
  int v13 = [v12 channelCount];

  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  __int16 v14 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(AVAudioDeviceTestService *)self multichannelMixer];
    int v16 = [v15 inputFormatForBus:0];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1669;
    __int16 v34 = 1024;
    int v35 = [v16 channelCount];
    __int16 v36 = 1024;
    int v37 = v10;
    _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mixer dimension %d x %d", buf, 0x1Eu);
  }
  uint64_t v17 = (v13 * v10);
  int v27 = 0;
  std::vector<float>::vector(buf, v17, &v27);
  if (v6)
  {
    for (unint64_t i = 0; [v6 count] > i; ++i)
    {
      uint64_t v19 = [v6 objectAtIndexedSubscript:i];
      unsigned int v20 = [v19 intValue];

      if (v20 < v17)
      {
        uint64_t v21 = *(void *)buf;
        do
        {
          *(_DWORD *)(v21 + 4 * (int)v20) = 1065353216;
          v20 += v10;
        }
        while (v20 < v17);
      }
    }
  }
  else if (v17)
  {
    memset_pattern16(*(void **)buf, &unk_19D8B1E60, 4 * v17);
  }
  OSStatus v22 = [(AVAudioDeviceTestService *)self multichannelMixer];
  id v23 = (OpaqueAudioComponentInstance *)[v22 audioUnit];
  OSStatus v24 = AudioUnitSetProperty(v23, 0xBBEu, 1u, 0, *(const void **)buf, 4 * v17);

  if (v24)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v25 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136315650;
      v28 = "AVAudioDeviceTestService.mm";
      __int16 v29 = 1024;
      int v30 = 1688;
      __int16 v31 = 1024;
      OSStatus v32 = v24;
      _os_log_impl(&dword_19D794000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioUnitSetProperty kAudioUnitProperty_MatrixLevels %i", (uint8_t *)&v27, 0x18u);
    }
    uint64_t v26 = generateAudioSelfTestError(-10);
    v7[2](v7, v26);
  }
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  id v3 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v13 = "AVAudioDeviceTestService.mm";
    __int16 v14 = 1024;
    int v15 = 1646;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d cleaning up observers and invalidating process assertion", buf, 0x12u);
  }
  [(AVAudioDeviceTestService *)self extensionHandle];
  if (sandbox_extension_release())
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    id v4 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = *__error();
      *(_DWORD *)buf = 136315650;
      int v13 = "AVAudioDeviceTestService.mm";
      __int16 v14 = 1024;
      int v15 = 1650;
      __int16 v16 = 1024;
      int v17 = v5;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d couldn't release extension %i", buf, 0x18u);
    }
  }
  id v6 = [(AVAudioDeviceTestService *)self userVolumeBeforeHearingTest];
  BOOL v7 = v6 == 0;

  if (!v7)
  {
    int v8 = [(AVAudioDeviceTestService *)self userVolumeBeforeHearingTest];
    [v8 floatValue];
    -[AVAudioDeviceTestService resetVolume:](self, "resetVolume:");
  }
  [(AVAudioDeviceTestService *)self cleanUpObservers];
  uint64_t v9 = [(AVAudioDeviceTestService *)self transaction];
  BOOL v10 = v9 == 0;

  if (!v10) {
    [(AVAudioDeviceTestService *)self setTransaction:0];
  }
  v11.receiver = self;
  v11.super_class = (Class)AVAudioDeviceTestService;
  [(AVAudioDeviceTestService *)&v11 dealloc];
}

- (id)convertBufferFor:(id)a3 sourceBuffer:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v29 = a4;
  id v6 = [AVAudioFormat alloc];
  BOOL v7 = [v31 processingFormat];
  int v8 = [v7 settings];
  uint64_t v9 = [(AVAudioFormat *)v6 initWithSettings:v8];

  int v30 = v9;
  BOOL v10 = [(AVAudioFormat *)v9 settings];
  objc_super v11 = (void *)[v10 mutableCopy];

  __int16 v12 = NSNumber;
  int v13 = [(AVAudioDeviceTestService *)self engine];
  __int16 v14 = [v13 inputNode];
  int v15 = [v14 inputFormatForBus:0];
  [v15 sampleRate];
  __int16 v16 = objc_msgSend(v12, "numberWithDouble:");
  [v11 setObject:v16 forKeyedSubscript:@"AVSampleRateKey"];

  [v11 setObject:&unk_1EEFB5678 forKeyedSubscript:@"AVNumberOfChannelsKey"];
  int v17 = [[AVAudioFormat alloc] initWithSettings:v11];
  uint64_t v18 = -[AVAudioPCMBuffer initWithPCMFormat:frameCapacity:]([AVAudioPCMBuffer alloc], "initWithPCMFormat:frameCapacity:", v17, [v31 length]);
  uint64_t v19 = [[AVAudioConverter alloc] initFromFormat:v30 toFormat:v17];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__AVAudioDeviceTestService_convertBufferFor_sourceBuffer___block_invoke;
  aBlock[3] = &unk_1E5964C30;
  id v20 = v29;
  id v34 = v20;
  uint64_t v21 = _Block_copy(aBlock);
  id v32 = 0;
  uint64_t v22 = [(AVAudioConverter *)v19 convertToBuffer:v18 error:&v32 withInputFromBlock:v21];
  id v23 = v32;
  if (v22 == 3)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    OSStatus v24 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [v23 localizedDescription];
      uint64_t v26 = generateAudioSelfTestError(-6);
      uint64_t v27 = [v26 code];
      *(_DWORD *)buf = 136315906;
      __int16 v36 = "AVAudioDeviceTestService.mm";
      __int16 v37 = 1024;
      int v38 = 1638;
      __int16 v39 = 2112;
      v40 = v25;
      __int16 v41 = 2048;
      uint64_t v42 = v27;
      _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d error converting stimulus buffer format %@ - %li", buf, 0x26u);
    }
  }

  return v18;
}

id __58__AVAudioDeviceTestService_convertBufferFor_sourceBuffer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 0;
  return *(id *)(a1 + 32);
}

- (void)setupAudioEngineFor:(id)a3 sourceNodeBlock:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F4E9F8] sharedInstance];
  [(AVAudioDeviceTestService *)self createAudioEngineAndProcessingChain:v8 session:v7 sourceNodeBlock:v6];
}

- (BOOL)createAudioEngineAndPulseToneHandlerFor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  int v5 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    __int16 v14 = "AVAudioDeviceTestService.mm";
    __int16 v15 = 1024;
    int v16 = 1582;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Creating engine and tone handler", (uint8_t *)&v13, 0x12u);
  }
  if (!v4)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    BOOL v10 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    int v13 = 136315394;
    __int16 v14 = "AVAudioDeviceTestService.mm";
    __int16 v15 = 1024;
    int v16 = 1584;
    objc_super v11 = "%25s:%-5d Unable to create pulse tone from nil sequence";
LABEL_21:
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x12u);
    goto LABEL_22;
  }
  id v6 = objc_opt_new();
  [(AVAudioDeviceTestService *)self setEngine:v6];

  if (!v6)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    BOOL v10 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    int v13 = 136315394;
    __int16 v14 = "AVAudioDeviceTestService.mm";
    __int16 v15 = 1024;
    int v16 = 1602;
    objc_super v11 = "%25s:%-5d Unable to create instance of AVAudioEngine";
    goto LABEL_21;
  }
  BOOL v7 = [(AVAudioDeviceTestService *)self engine];
  id v8 = [v7 outputNode];
  uint64_t v9 = [v8 outputFormatForBus:0];

  if (v9)
  {
    [v9 sampleRate];
    [v4 frequency];
    [v4 soundLevel];
    [v4 numberOfPulses];
    [v4 pulseDuration];
    [v4 pauseDuration];
    [v4 rampDuration];
    [v4 startDelay];
    operator new();
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  BOOL v10 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315394;
    __int16 v14 = "AVAudioDeviceTestService.mm";
    __int16 v15 = 1024;
    int v16 = 1599;
    objc_super v11 = "%25s:%-5d Unable to get output format for bus 0";
    goto LABEL_21;
  }
LABEL_22:

  return 0;
}

- (void)setupAudioSessionFor:(id)a3 playbackOnly:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a5;
  BOOL v10 = [MEMORY[0x1E4F4E9F8] sharedInstance];
  objc_super v11 = v10;
  if (v6)
  {
    __int16 v12 = [v10 category];
    int v13 = (void *)*MEMORY[0x1E4F4E7F8];

    if (v12 == v13)
    {
      id v22 = 0;
    }
    else
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      __int16 v14 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v68 = "AVAudioDeviceTestService.mm";
        __int16 v69 = 1024;
        int v70 = 1493;
        _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Updating current audio session category to playback only.", buf, 0x12u);
      }
      id v66 = 0;
      char v15 = [v11 setCategory:v13 error:&v66];
      id v16 = v66;
      if ((v15 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        uint64_t v17 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = [v16 localizedDescription];
          *(_DWORD *)buf = 136315650;
          v68 = "AVAudioDeviceTestService.mm";
          __int16 v69 = 1024;
          int v70 = 1496;
          __int16 v71 = 2112;
          uint64_t v72 = (uint64_t)v18;
          _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set audio session category. { error=%@ }", buf, 0x1Cu);
        }
        uint64_t v19 = generateAudioSelfTestError(-1);
        v9[2](v9, v19);
      }
      uint64_t v20 = *MEMORY[0x1E4F4E8D8];
      id v65 = v16;
      char v21 = [v11 setMode:v20 error:&v65];
      id v22 = v65;

      if ((v21 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        id v23 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          OSStatus v24 = [v22 localizedDescription];
          *(_DWORD *)buf = 136315650;
          v68 = "AVAudioDeviceTestService.mm";
          __int16 v69 = 1024;
          int v70 = 1501;
          __int16 v71 = 2112;
          uint64_t v72 = (uint64_t)v24;
          _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set audio session mode. { error=%@ }", buf, 0x1Cu);
        }
        uint64_t v25 = generateAudioSelfTestError(-1);
        v9[2](v9, v25);
LABEL_75:
      }
    }
  }
  else
  {
    char v26 = [v10 allowAllBuiltInDataSources];
    if ((v26 & 1) == 0) {
      [v11 setAllowAllBuiltInDataSources:1];
    }
    if (![v8 requiresBluetoothOutput]
      || ([v11 categoryOptions] & 0x20) != 0)
    {
      char v27 = v26 ^ 1;
      if ([v8 outputMode] == 1)
      {
        uint64_t v29 = [v11 categoryOptions] & 8;
        if (!v29) {
          char v27 = 1;
        }
        uint64_t v28 = v29 ^ 8;
      }
      else
      {
        uint64_t v28 = 0;
      }
    }
    else
    {
      char v27 = 1;
      uint64_t v28 = 32;
    }
    int v30 = [v11 category];
    id v31 = (void *)*MEMORY[0x1E4F4E7F0];

    if (v30 == v31)
    {
      id v22 = 0;
    }
    else
    {
      id v64 = 0;
      char v32 = [v11 setCategory:v31 withOptions:v28 error:&v64];
      id v22 = v64;
      if ((v32 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        uint64_t v33 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          uint64_t v34 = [v22 code];
          *(_DWORD *)buf = 136315650;
          v68 = "AVAudioDeviceTestService.mm";
          __int16 v69 = 1024;
          int v70 = 1527;
          __int16 v71 = 2048;
          uint64_t v72 = v34;
          _os_log_impl(&dword_19D794000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d setCategory %li", buf, 0x1Cu);
        }

        int v35 = generateAudioSelfTestError(-1);
        v9[2](v9, v35);
      }
      char v27 = 1;
    }
    if ([v11 preferredIOBufferFrameSize] != 4096)
    {
      id v63 = v22;
      char v36 = [v11 setPreferredIOBufferFrameSize:4096 error:&v63];
      id v37 = v63;

      if ((v36 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        int v38 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = [v37 code];
          v40 = generateAudioSelfTestError(-1);
          uint64_t v41 = [v40 code];
          *(_DWORD *)buf = 136315906;
          v68 = "AVAudioDeviceTestService.mm";
          __int16 v69 = 1024;
          int v70 = 1544;
          __int16 v71 = 2048;
          uint64_t v72 = v39;
          __int16 v73 = 2048;
          uint64_t v74 = v41;
          _os_log_impl(&dword_19D794000, v38, OS_LOG_TYPE_ERROR, "%25s:%-5d setPreferredIOBufferFrameSize (%li) with test error (%li)", buf, 0x26u);
        }
      }
      char v27 = 1;
      id v22 = v37;
    }
    uint64_t v42 = [v8 mode];
    if (!v42) {
      goto LABEL_57;
    }
    uint64_t v43 = [v11 mode];
    v44 = [v8 mode];
    BOOL v45 = v43 == v44;

    if (v45)
    {
LABEL_57:
      if (v27 & 1) == 0 && ([v11 isActive]) {
        goto LABEL_76;
      }
    }
    else
    {
      v46 = [v8 mode];
      id v62 = v22;
      char v47 = [v11 setMode:v46 error:&v62];
      id v48 = v62;

      if ((v47 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        int v49 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          uint64_t v50 = [v48 code];
          v51 = generateAudioSelfTestError(-1);
          uint64_t v52 = [v51 code];
          *(_DWORD *)buf = 136315906;
          v68 = "AVAudioDeviceTestService.mm";
          __int16 v69 = 1024;
          int v70 = 1552;
          __int16 v71 = 2048;
          uint64_t v72 = v50;
          __int16 v73 = 2048;
          uint64_t v74 = v52;
          _os_log_impl(&dword_19D794000, v49, OS_LOG_TYPE_ERROR, "%25s:%-5d setMode (%li) with test error (%li)", buf, 0x26u);
        }
      }
      id v22 = v48;
    }
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    v53 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v68 = "AVAudioDeviceTestService.mm";
      __int16 v69 = 1024;
      int v70 = 1559;
      _os_log_impl(&dword_19D794000, v53, OS_LOG_TYPE_INFO, "%25s:%-5d Audio session has changed, setting active.", buf, 0x12u);
    }
    id v61 = v22;
    char v54 = [v11 setActive:1 error:&v61];
    id v55 = v61;

    id v22 = v55;
    if ((v54 & 1) == 0)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      v56 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        uint64_t v57 = [v55 code];
        v58 = generateAudioSelfTestError(-11);
        uint64_t v59 = [v58 code];
        *(_DWORD *)buf = 136315906;
        v68 = "AVAudioDeviceTestService.mm";
        __int16 v69 = 1024;
        int v70 = 1562;
        __int16 v71 = 2048;
        uint64_t v72 = v57;
        __int16 v73 = 2048;
        uint64_t v74 = v59;
        _os_log_impl(&dword_19D794000, v56, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive (%li) with test error (%li)", buf, 0x26u);
      }
      if ([v22 code] == 561145203)
      {
        [(AVAudioDeviceTestService *)self setTestServiceSupportedOnHardware:0];
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        v60 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v68 = "AVAudioDeviceTestService.mm";
          __int16 v69 = 1024;
          int v70 = 1566;
          _os_log_impl(&dword_19D794000, v60, OS_LOG_TYPE_ERROR, "%25s:%-5d running test on platform with inadequate hardware", buf, 0x12u);
        }
        uint64_t v25 = generateAudioSelfTestError(-8);
        v9[2](v9, v25);
      }
      else
      {
        uint64_t v25 = generateAudioSelfTestError(-11);
        v9[2](v9, v25);
      }
      goto LABEL_75;
    }
    [(AVAudioDeviceTestService *)self configureDataSources:v8 session:v11];
  }
LABEL_76:
}

- (void)checkSequenceValidity:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    [v7 frequency];
    if (v8 != 0.0 || ([v7 soundLevel], v9 != 0.0) || (objc_msgSend(v7, "duration"), v10 != 0.0))
    {
      objc_super v11 = [v7 stimulusURL];

      if (v11)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        __int16 v12 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v21 = 136315394;
          id v22 = "AVAudioDeviceTestService.mm";
          __int16 v23 = 1024;
          int v24 = 1468;
          _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot set playback URL and tone on the same sequence", (uint8_t *)&v21, 0x12u);
        }
        int v13 = generateAudioSelfTestError(-7);
        v6[2](v6, v13);
      }
    }
    [v7 frequency];
    if (v14 == 0.0 || ([v7 soundLevel], v15 == 0.0) || (objc_msgSend(v7, "duration"), v16 == 0.0))
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      uint64_t v17 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315394;
        id v22 = "AVAudioDeviceTestService.mm";
        __int16 v23 = 1024;
        int v24 = 1473;
        _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot perform tone playback without setting all required parameters (frequency, soundLevel, and duration)", (uint8_t *)&v21, 0x12u);
      }
      uint64_t v18 = generateAudioSelfTestError(-7);
      v6[2](v6, v18);
    }
  }
  if ([v5 requiresBluetoothOutput] && objc_msgSend(v5, "outputMode") == 1)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v19 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315394;
      id v22 = "AVAudioDeviceTestService.mm";
      __int16 v23 = 1024;
      int v24 = 1479;
      _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot request speaker output on Bluetooth route", (uint8_t *)&v21, 0x12u);
    }
    uint64_t v20 = generateAudioSelfTestError(-7);
    v6[2](v6, v20);
  }
}

- (void)resetVolume:(float)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  float v14 = 0.0;
  id v4 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  id v13 = 0;
  [v4 getActiveCategoryVolume:&v14 andName:&v13];
  id v5 = v13;

  float v6 = vabds_f32(v14, a3);
  float v7 = fabsf(v14 + a3);
  float v8 = (float)(v7 * 0.00000011921) + (float)(v7 * 0.00000011921);
  if (v6 >= 1.1755e-38 && v6 > v8)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    double v10 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      double v16 = "AVAudioDeviceTestService.mm";
      __int16 v17 = 1024;
      int v18 = 1456;
      __int16 v19 = 2048;
      double v20 = v14;
      __int16 v21 = 2048;
      double v22 = a3;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Current volume is not as expected, updating volume. { current=%f, expected=%f, name=%@ }", buf, 0x30u);
    }
    objc_super v11 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
    *(float *)&double v12 = a3;
    [v11 setActiveCategoryVolumeTo:v12];
  }
}

- (void)setupVolumeObserverForVolume:(float)a3 completion:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  float v6 = (void (**)(id, id))a4;
  float v7 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  float v8 = (uint64_t *)MEMORY[0x1E4F74EE0];
  v27[0] = *MEMORY[0x1E4F74EE0];
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  uint64_t v10 = *MEMORY[0x1E4F74EB0];
  id v20 = 0;
  [v7 setAttribute:v9 forKey:v10 error:&v20];
  id v11 = v20;

  if (v11)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    double v12 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v11 localizedDescription];
      *(_DWORD *)buf = 136315650;
      double v22 = "AVAudioDeviceTestService.mm";
      __int16 v23 = 1024;
      int v24 = 1433;
      __int16 v25 = 2112;
      char v26 = v13;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to subscribe to system volume notification. { error=%@ }", buf, 0x1Cu);
    }
    v6[2](v6, v11);
  }
  else
  {
    [(AVAudioDeviceTestService *)self removeSystemVolumeObserver];
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    float v14 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      double v22 = "AVAudioDeviceTestService.mm";
      __int16 v23 = 1024;
      int v24 = 1440;
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] setting up systemVolumeObserver", buf, 0x12u);
    }
    double v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v16 = *v8;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__AVAudioDeviceTestService_setupVolumeObserverForVolume_completion___block_invoke;
    v18[3] = &__block_descriptor_36_e24_v16__0__NSNotification_8l;
    float v19 = a3;
    __int16 v17 = [v15 addObserverForName:v16 object:0 queue:0 usingBlock:v18];
    [(AVAudioDeviceTestService *)self setSystemVolumeObserver:v17];
  }
}

void __68__AVAudioDeviceTestService_setupVolumeObserverForVolume_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F74AE8]];

  [v5 floatValue];
  float v6 = *(float *)(a1 + 32);
  float v8 = vabds_f32(v7, v6);
  float v9 = fabsf(v7 + v6);
  float v10 = (float)(v9 * 0.00000011921) + (float)(v9 * 0.00000011921);
  if (v8 >= 1.1755e-38 && v8 > v10)
  {
    double v12 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
    LODWORD(v13) = *(_DWORD *)(a1 + 32);
    [v12 setActiveCategoryVolumeTo:v13];

    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    float v14 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      [v5 floatValue];
      double v15 = *(float *)(a1 + 32);
      int v17 = 136315906;
      int v18 = "AVAudioDeviceTestService.mm";
      __int16 v19 = 1024;
      int v20 = 1445;
      __int16 v21 = 2048;
      double v22 = v16;
      __int16 v23 = 2048;
      double v24 = v15;
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Volume not as expected, updating volume. { current=%f, expected=%f }", (uint8_t *)&v17, 0x26u);
    }
  }
}

- (BOOL)isPlaybackForTestEnabled
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"playback_for_test", @"com.apple.coreaudio.avaudiodevicetest");
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2 == (CFPropertyListRef)*MEMORY[0x1E4F1CFD0];
  CFRelease(v2);
  return v3;
}

- (BOOL)isMixerOutputEnabled
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"mixer_output_enable", @"com.apple.coreaudio.avaudiodevicetest");
  if (!v2) {
    return 0;
  }
  BOOL v3 = v2 == (CFPropertyListRef)*MEMORY[0x1E4F1CFD0];
  CFRelease(v2);
  return v3;
}

- (void)stopAudioSession:(id)a3
{
  id v4 = a3;
  id v5 = [(AVAudioDeviceTestService *)self toneQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__AVAudioDeviceTestService_stopAudioSession___block_invoke;
  v7[3] = &unk_1E5965BC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__AVAudioDeviceTestService_stopAudioSession___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  CFPropertyListRef v2 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "AVAudioDeviceTestService.mm";
    __int16 v20 = 1024;
    int v21 = 1378;
    _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attempting to stop audio session for HearingTest.", buf, 0x12u);
  }
  BOOL v3 = [*(id *)(a1 + 32) hearingTestSession];
  if (!v3) {
    goto LABEL_8;
  }
  id v4 = [*(id *)(a1 + 32) hearingTestSession];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) hearingTestSession];
    char v6 = [v5 isActive];

    if ((v6 & 1) == 0)
    {
LABEL_8:
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      float v7 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v19 = "AVAudioDeviceTestService.mm";
        __int16 v20 = 1024;
        int v21 = 1383;
        _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Hearing test audio session is not active, cannot de-activate it.", buf, 0x12u);
      }
      id v8 = 0;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_26;
    }
  }
  else
  {
  }
  float v9 = [*(id *)(a1 + 32) hearingTestSession];
  id v17 = 0;
  [v9 setActive:0 error:&v17];
  id v10 = v17;

  if (v10)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    id v11 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      double v12 = [v10 localizedDescription];
      *(_DWORD *)buf = 136315650;
      __int16 v19 = "AVAudioDeviceTestService.mm";
      __int16 v20 = 1024;
      int v21 = 1390;
      __int16 v22 = 2114;
      __int16 v23 = v12;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed de-activate audio session. { error=%{public}@ }", buf, 0x1Cu);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-14 userInfo:0];

    id v8 = (void *)v13;
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    float v14 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "AVAudioDeviceTestService.mm";
      __int16 v20 = 1024;
      int v21 = 1393;
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d De-activated audio session.", buf, 0x12u);
    }
    id v8 = 0;
  }
  double v15 = *(void **)(a1 + 32);
  float v16 = [v15 userVolumeBeforeHearingTest];
  [v16 floatValue];
  objc_msgSend(v15, "resetVolume:");

  [*(id *)(a1 + 32) cleanUpObservers];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_26:
}

- (void)setupAudioSessionForHearingTestWithStatus:(id)a3 success:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AVAudioDeviceTestService *)self toneQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AVAudioDeviceTestService_setupAudioSessionForHearingTestWithStatus_success___block_invoke;
  block[3] = &unk_1E5964D70;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __78__AVAudioDeviceTestService_setupAudioSessionForHearingTestWithStatus_success___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  CFPropertyListRef v2 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v37 = "AVAudioDeviceTestService.mm";
    __int16 v38 = 1024;
    int v39 = 1327;
    _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting up audio session with Playback category for HearingTest.", buf, 0x12u);
  }
  BOOL v3 = [MEMORY[0x1E4F4E9F8] sharedInstance];
  [*(id *)(a1 + 32) setHearingTestSession:v3];

  id v4 = [*(id *)(a1 + 32) hearingTestSession];
  uint64_t v5 = *MEMORY[0x1E4F4E7F8];
  id v35 = 0;
  char v6 = [v4 setCategory:v5 error:&v35];
  id v7 = v35;

  if (v7) {
    char v8 = 0;
  }
  else {
    char v8 = v6;
  }
  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) hearingTestSession];
    uint64_t v10 = *MEMORY[0x1E4F4E8D8];
    id v34 = 0;
    char v11 = [v9 setMode:v10 error:&v34];
    id v12 = v34;

    if (v12) {
      char v13 = 0;
    }
    else {
      char v13 = v11;
    }
    if (v13)
    {
      float v14 = [*(id *)(a1 + 32) hearingTestSession];
      id v33 = 0;
      char v15 = [v14 setEligibleForBTSmartRoutingConsideration:0 error:&v33];
      id v16 = v33;

      if (v16) {
        char v17 = 0;
      }
      else {
        char v17 = v15;
      }
      if (v17)
      {
        int v18 = [*(id *)(a1 + 32) hearingTestSession];
        id v32 = 0;
        char v19 = [v18 setActive:1 error:&v32];
        id v20 = v32;

        if (v20) {
          char v21 = 0;
        }
        else {
          char v21 = v19;
        }
        if (v21)
        {
          if (AVAudioDeviceTestServiceLog(void)::once != -1) {
            dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
          }
          __int16 v22 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            id v37 = "AVAudioDeviceTestService.mm";
            __int16 v38 = 1024;
            int v39 = 1367;
            _os_log_impl(&dword_19D794000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setup and activated audio session for HearingTest.", buf, 0x12u);
          }
          [*(id *)(a1 + 32) setupObservers:*(void *)(a1 + 40)];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          __int16 v23 = 0;
        }
        else
        {
          if (AVAudioDeviceTestServiceLog(void)::once != -1) {
            dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
          }
          int v30 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            id v31 = [v20 localizedDescription];
            *(_DWORD *)buf = 136315650;
            id v37 = "AVAudioDeviceTestService.mm";
            __int16 v38 = 1024;
            int v39 = 1361;
            __int16 v40 = 2114;
            uint64_t v41 = v31;
            _os_log_impl(&dword_19D794000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set active. { error=%{public}@ }", buf, 0x1Cu);
          }
          __int16 v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
      else
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        uint64_t v28 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = [v16 localizedDescription];
          *(_DWORD *)buf = 136315650;
          id v37 = "AVAudioDeviceTestService.mm";
          __int16 v38 = 1024;
          int v39 = 1352;
          __int16 v40 = 2114;
          uint64_t v41 = v29;
          _os_log_impl(&dword_19D794000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to disable smart routing. { error=%{public}@ }", buf, 0x1Cu);
        }
        __int16 v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      char v26 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        char v27 = [v12 localizedDescription];
        *(_DWORD *)buf = 136315650;
        id v37 = "AVAudioDeviceTestService.mm";
        __int16 v38 = 1024;
        int v39 = 1343;
        __int16 v40 = 2114;
        uint64_t v41 = v27;
        _os_log_impl(&dword_19D794000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set mode. { error=%{public}@ }", buf, 0x1Cu);
      }
      __int16 v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v24 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [v7 localizedDescription];
      *(_DWORD *)buf = 136315650;
      id v37 = "AVAudioDeviceTestService.mm";
      __int16 v38 = 1024;
      int v39 = 1335;
      __int16 v40 = 2114;
      uint64_t v41 = v25;
      _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set category. { error=%{public}@ }", buf, 0x1Cu);
    }
    __int16 v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setupAudioSessionForHearingTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVAudioDeviceTestService *)self toneQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__AVAudioDeviceTestService_setupAudioSessionForHearingTest___block_invoke;
  v7[3] = &unk_1E5965BC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__AVAudioDeviceTestService_setupAudioSessionForHearingTest___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  CFPropertyListRef v2 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v37 = "AVAudioDeviceTestService.mm";
    __int16 v38 = 1024;
    int v39 = 1277;
    _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting up audio session with Playback category for HearingTest.", buf, 0x12u);
  }
  BOOL v3 = [MEMORY[0x1E4F4E9F8] sharedInstance];
  [*(id *)(a1 + 32) setHearingTestSession:v3];

  id v4 = [*(id *)(a1 + 32) hearingTestSession];
  uint64_t v5 = *MEMORY[0x1E4F4E7F8];
  id v35 = 0;
  char v6 = [v4 setCategory:v5 error:&v35];
  id v7 = v35;

  if (v7) {
    char v8 = 0;
  }
  else {
    char v8 = v6;
  }
  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) hearingTestSession];
    uint64_t v10 = *MEMORY[0x1E4F4E8D8];
    id v34 = 0;
    char v11 = [v9 setMode:v10 error:&v34];
    id v12 = v34;

    if (v12) {
      char v13 = 0;
    }
    else {
      char v13 = v11;
    }
    if (v13)
    {
      float v14 = [*(id *)(a1 + 32) hearingTestSession];
      id v33 = 0;
      char v15 = [v14 setEligibleForBTSmartRoutingConsideration:0 error:&v33];
      id v16 = v33;

      if (v16) {
        char v17 = 0;
      }
      else {
        char v17 = v15;
      }
      if (v17)
      {
        int v18 = [*(id *)(a1 + 32) hearingTestSession];
        id v32 = 0;
        char v19 = [v18 setActive:1 error:&v32];
        id v20 = v32;

        if (v20) {
          char v21 = 0;
        }
        else {
          char v21 = v19;
        }
        if (v21)
        {
          if (AVAudioDeviceTestServiceLog(void)::once != -1) {
            dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
          }
          __int16 v22 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            id v37 = "AVAudioDeviceTestService.mm";
            __int16 v38 = 1024;
            int v39 = 1317;
            _os_log_impl(&dword_19D794000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setup and activated audio session for HearingTest.", buf, 0x12u);
          }
          [*(id *)(a1 + 32) setupObservers:*(void *)(a1 + 40)];
          __int16 v23 = 0;
        }
        else
        {
          if (AVAudioDeviceTestServiceLog(void)::once != -1) {
            dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
          }
          int v30 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            id v31 = [v20 localizedDescription];
            *(_DWORD *)buf = 136315650;
            id v37 = "AVAudioDeviceTestService.mm";
            __int16 v38 = 1024;
            int v39 = 1311;
            __int16 v40 = 2114;
            uint64_t v41 = v31;
            _os_log_impl(&dword_19D794000, v30, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set active. { error=%{public}@ }", buf, 0x1Cu);
          }
          __int16 v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
      else
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        uint64_t v28 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = [v16 localizedDescription];
          *(_DWORD *)buf = 136315650;
          id v37 = "AVAudioDeviceTestService.mm";
          __int16 v38 = 1024;
          int v39 = 1302;
          __int16 v40 = 2114;
          uint64_t v41 = v29;
          _os_log_impl(&dword_19D794000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to disable smart routing. { error=%{public}@ }", buf, 0x1Cu);
        }
        __int16 v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      char v26 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        char v27 = [v12 localizedDescription];
        *(_DWORD *)buf = 136315650;
        id v37 = "AVAudioDeviceTestService.mm";
        __int16 v38 = 1024;
        int v39 = 1293;
        __int16 v40 = 2114;
        uint64_t v41 = v27;
        _os_log_impl(&dword_19D794000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set mode. { error=%{public}@ }", buf, 0x1Cu);
      }
      __int16 v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v24 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [v7 localizedDescription];
      *(_DWORD *)buf = 136315650;
      id v37 = "AVAudioDeviceTestService.mm";
      __int16 v38 = 1024;
      int v39 = 1285;
      __int16 v40 = 2114;
      uint64_t v41 = v25;
      _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set category. { error=%{public}@ }", buf, 0x1Cu);
    }
    __int16 v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)stopRecording:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(AVAudioDeviceTestService *)self nodeToCaptureData];
  [v5 removeTapOnBus:0];

  char v6 = [(AVAudioDeviceTestService *)self engine];
  int v7 = [v6 isRunning];

  if (v7)
  {
    char v8 = [(AVAudioDeviceTestService *)self engine];
    [v8 stop];
  }
  id v9 = [MEMORY[0x1E4F4E9F8] sharedInstance];
  id v36 = 0;
  char v10 = [v9 setActive:0 error:&v36];
  id v11 = v36;

  if ((v10 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    id v12 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v11 code];
      float v14 = generateAudioSelfTestError(-11);
      uint64_t v15 = [v14 code];
      *(_DWORD *)buf = 136315906;
      __int16 v38 = "AVAudioDeviceTestService.mm";
      __int16 v39 = 1024;
      int v40 = 1249;
      __int16 v41 = 2048;
      uint64_t v42 = v13;
      __int16 v43 = 2048;
      double v44 = *(double *)&v15;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive (%li) with test error (%li)", buf, 0x26u);
    }
  }
  id v16 = [MEMORY[0x1E4F4E9F8] sharedInstance];
  id v35 = v11;
  [v16 setActive:0 error:&v35];
  id v17 = v35;

  int v18 = v17;
  if (v17)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    char v19 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v17 localizedDescription];
      *(_DWORD *)buf = 136315650;
      __int16 v38 = "AVAudioDeviceTestService.mm";
      __int16 v39 = 1024;
      int v40 = 1254;
      __int16 v41 = 2112;
      uint64_t v42 = (uint64_t)v20;
      _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to reset audio session %@", buf, 0x1Cu);
    }
  }
  char v21 = [(AVAudioDeviceTestService *)self toneQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__AVAudioDeviceTestService_stopRecording___block_invoke;
  block[3] = &unk_1E5965AD8;
  block[4] = self;
  dispatch_sync(v21, block);

  __int16 v22 = [(AVAudioDeviceTestService *)self inputTapFile];
  BOOL v23 = [v22 length] == 0;

  if (v23)
  {
    id v32 = generateAudioSelfTestError(-13);
    v4[2](v4, v32);
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v24 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = [(AVAudioDeviceTestService *)self inputTapFile];
      uint64_t v25 = [v33 url];
      char v26 = [v25 path];
      char v27 = [(AVAudioDeviceTestService *)self inputTapFile];
      uint64_t v28 = [v27 length];
      uint64_t v29 = [(AVAudioDeviceTestService *)self inputTapFile];
      int v30 = [v29 fileFormat];
      [v30 sampleRate];
      *(_DWORD *)buf = 136315906;
      __int16 v38 = "AVAudioDeviceTestService.mm";
      __int16 v39 = 1024;
      int v40 = 1266;
      __int16 v41 = 2114;
      uint64_t v42 = (uint64_t)v26;
      __int16 v43 = 2048;
      double v44 = (double)v28 / v31;
      _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Stopped recording on server side %{public}@ (%f s)", buf, 0x26u);
    }
    [(AVAudioDeviceTestService *)self setInputTapFile:0];
    v4[2](v4, 0);
  }
}

uint64_t __42__AVAudioDeviceTestService_stopRecording___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUp];
}

- (void)startRecording:(id)a3 filePath:(id)a4 completion:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a4;
  id v9 = (void (**)(id, void *))a5;
  [(AVAudioDeviceTestService *)self checkSequenceValidity:v8 completion:v9];
  [(AVAudioDeviceTestService *)self setupAudioSessionFor:v8 playbackOnly:0 completion:v9];
  [(AVAudioDeviceTestService *)self setupAudioEngineFor:v8 sourceNodeBlock:0];
  char v10 = [(AVAudioDeviceTestService *)self engine];
  id v11 = [v10 inputNode];
  id v12 = [v11 inputFormatForBus:0];

  uint64_t v33 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v35];
  uint64_t v13 = [AVAudioFile alloc];
  float v14 = [v12 settings];
  id v39 = 0;
  uint64_t v15 = [(AVAudioFile *)v13 initForWriting:v33 settings:v14 error:&v39];
  id v16 = v39;
  [(AVAudioDeviceTestService *)self setInputTapFile:v15];

  if (v16)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    id v17 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = [v16 localizedDescription];
      *(_DWORD *)buf = 136315650;
      __int16 v41 = "AVAudioDeviceTestService.mm";
      __int16 v42 = 1024;
      int v43 = 1216;
      __int16 v44 = 2112;
      id v45 = v18;
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create input tap file %@", buf, 0x1Cu);
    }
  }
  char v19 = [(AVAudioDeviceTestService *)self inputFilter];
  if (v19)
  {
    id v20 = [(AVAudioDeviceTestService *)self inputFilter];
    char v21 = v20;
  }
  else
  {
    char v21 = [(AVAudioDeviceTestService *)self engine];
    id v20 = [v21 inputNode];
  }
  [(AVAudioDeviceTestService *)self setNodeToCaptureData:v20];
  if (!v19) {

  }
  __int16 v22 = [(AVAudioDeviceTestService *)self nodeToCaptureData];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __63__AVAudioDeviceTestService_startRecording_filePath_completion___block_invoke;
  v37[3] = &unk_1E5964D48;
  v37[4] = self;
  id v23 = v16;
  id v38 = v23;
  [v22 installTapOnBus:0 bufferSize:4096 format:v12 block:v37];

  uint64_t v24 = [(AVAudioDeviceTestService *)self engine];
  id v36 = v23;
  char v25 = [v24 startAndReturnError:&v36];
  id v26 = v36;

  if ((v25 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v28 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = [v26 localizedDescription];
      int v30 = generateAudioSelfTestError(-10);
      uint64_t v31 = [v30 code];
      *(_DWORD *)buf = 136315906;
      __int16 v41 = "AVAudioDeviceTestService.mm";
      __int16 v42 = 1024;
      int v43 = 1229;
      __int16 v44 = 2112;
      id v45 = v29;
      __int16 v46 = 2048;
      uint64_t v47 = v31;
      _os_log_impl(&dword_19D794000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d startAndReturnError (%@) with test error (%li)", buf, 0x26u);
    }
    id v32 = generateAudioSelfTestError(-10);
    v9[2](v9, v32);

    exit(-1);
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  char v27 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v41 = "AVAudioDeviceTestService.mm";
    __int16 v42 = 1024;
    int v43 = 1234;
    __int16 v44 = 2112;
    id v45 = v35;
    _os_log_impl(&dword_19D794000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Started recording on server side %@", buf, 0x1Cu);
  }
  v9[2](v9, 0);
}

void __63__AVAudioDeviceTestService_startRecording_filePath_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) inputTapFile];
  id v9 = 0;
  char v5 = [v4 writeFromBuffer:v3 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    int v7 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 40) localizedDescription];
      *(_DWORD *)buf = 136315650;
      id v11 = "AVAudioDeviceTestService.mm";
      __int16 v12 = 1024;
      int v13 = 1224;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d error writing debug file %@", buf, 0x1Cu);
    }
  }
}

- (void)stopPlayback
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  id v3 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "AVAudioDeviceTestService.mm";
    __int16 v10 = 1024;
    int v11 = 1157;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Requesting to stop tone playback.", buf, 0x12u);
  }
  if (self->mPulseToneHandler.__ptr_.__value_)
  {
    id v4 = [(AVAudioDeviceTestService *)self toneQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__AVAudioDeviceTestService_stopPlayback__block_invoke;
    block[3] = &unk_1E5965AD8;
    block[4] = self;
    dispatch_async(v4, block);
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    char v5 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v9 = "AVAudioDeviceTestService.mm";
      __int16 v10 = 1024;
      int v11 = 1179;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Stop tone playback requested, tone has already been stopped.", buf, 0x12u);
    }
    id v4 = [(AVAudioDeviceTestService *)self toneQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__AVAudioDeviceTestService_stopPlayback__block_invoke_152;
    v6[3] = &unk_1E5965AD8;
    v6[4] = self;
    dispatch_sync(v4, v6);
  }
}

uint64_t __40__AVAudioDeviceTestService_stopPlayback__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  CFPropertyListRef v2 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    __int16 v14 = "AVAudioDeviceTestService.mm";
    __int16 v15 = 1024;
    int v16 = 1161;
    _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Stop tone playback requested.", (uint8_t *)&v13, 0x12u);
  }
  id v3 = *(unsigned char **)(*(void *)(a1 + 32) + 8);
  if (v3)
  {
    unsigned char *v3 = 1;
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    id v4 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v13 = 136315650;
      __int16 v14 = "AVAudioDeviceTestService.mm";
      __int16 v15 = 1024;
      int v16 = 1165;
      __int16 v17 = 2048;
      uint64_t v18 = v5;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Tone has been stopped. { frequency=%f }", (uint8_t *)&v13, 0x1Cu);
    }
    [MEMORY[0x1E4F29060] sleepForTimeInterval:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 8)];
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    id v6 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      __int16 v14 = "AVAudioDeviceTestService.mm";
      __int16 v15 = 1024;
      int v16 = 1168;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Tone stop requested but, pulse tone handler is nil", (uint8_t *)&v13, 0x12u);
    }
  }
  int v7 = *(void **)(a1 + 32);
  id v8 = [v7 userVolumeBeforeHearingTest];
  [v8 floatValue];
  objc_msgSend(v7, "resetVolume:");

  [*(id *)(a1 + 32) removeSystemVolumeObserver];
  id v9 = AVAudioDeviceTestServiceSignPost();
  uint64_t v10 = TonePlaybackSignpostID();
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_19D794000, v9, OS_SIGNPOST_INTERVAL_END, v11, "AVF tone playback", "user tap", (uint8_t *)&v13, 2u);
    }
  }

  return [*(id *)(a1 + 32) cleanUp];
}

uint64_t __40__AVAudioDeviceTestService_stopPlayback__block_invoke_152(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUp];
}

- (void)playback:(id)a3 filePath:(id)a4 completion:(id)a5
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v94 = a4;
  v96 = v8;
  v93 = (void (**)(id, void *))a5;
  -[AVAudioDeviceTestService checkSequenceValidity:completion:](self, "checkSequenceValidity:completion:", v8);
  id v9 = [(AVAudioDeviceTestService *)self hearingTestSession];

  if (!v9) {
    [(AVAudioDeviceTestService *)self setupAudioSessionFor:v8 playbackOnly:0 completion:v93];
  }
  [(AVAudioDeviceTestService *)self setupAudioEngineFor:v8 sourceNodeBlock:0];
  if (![(AVAudioDeviceTestService *)self setVolume:v8])
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v10 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [v8 volume];
      float v12 = v11;
      int v13 = generateAudioSelfTestError(-7);
      *(_DWORD *)buf = 136315906;
      v106 = "AVAudioDeviceTestService.mm";
      __int16 v107 = 1024;
      int v108 = 1045;
      __int16 v109 = 2048;
      double v110 = v12;
      __int16 v111 = 2048;
      uint64_t v112 = [v13 code];
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d unable to set volume %.2f (%li)", buf, 0x26u);
    }
    __int16 v14 = generateAudioSelfTestError(-7);
    v93[2](v93, v14);
  }
  __int16 v15 = [AVAudioFile alloc];
  int v16 = [v96 stimulusURL];
  id v104 = 0;
  v95 = [(AVAudioFile *)v15 initForReading:v16 error:&v104];
  id v17 = v104;

  if (!v95 && v17)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    v81 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    {
      double v82 = [v17 localizedDescription];
      v83 = generateAudioSelfTestError(-9);
      uint64_t v84 = [v83 code];
      *(_DWORD *)buf = 136315906;
      v106 = "AVAudioDeviceTestService.mm";
      __int16 v107 = 1024;
      int v108 = 1054;
      __int16 v109 = 2112;
      double v110 = v82;
      __int16 v111 = 2048;
      uint64_t v112 = v84;
      _os_log_impl(&dword_19D794000, v81, OS_LOG_TYPE_ERROR, "%25s:%-5d unable to read stimulus file (%@) with test error (%li)", buf, 0x26u);
    }
    v85 = generateAudioSelfTestError(-9);
    v93[2](v93, v85);

    exit(-9);
  }
  uint64_t v18 = [AVAudioPCMBuffer alloc];
  uint64_t v19 = [(AVAudioFile *)v95 processingFormat];
  id v20 = [(AVAudioPCMBuffer *)v18 initWithPCMFormat:v19 frameCapacity:[(AVAudioFile *)v95 length]];

  id v103 = v17;
  LOBYTE(v18) = [(AVAudioFile *)v95 readIntoBuffer:v20 error:&v103];
  id v21 = v103;

  if ((v18 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    __int16 v22 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      double v23 = [v21 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v106 = "AVAudioDeviceTestService.mm";
      __int16 v107 = 1024;
      int v108 = 1061;
      __int16 v109 = 2112;
      double v110 = v23;
      _os_log_impl(&dword_19D794000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d error reading stimulus file into buffer %@", buf, 0x1Cu);
    }
    id v20 = 0;
  }
  uint64_t v24 = [(AVAudioBuffer *)v20 format];
  BOOL v25 = [v24 channelCount] > 1;

  if (!v25)
  {
    int v30 = v20;
    goto LABEL_38;
  }
  id v26 = [v96 microphone];
  BOOL v27 = v26 == 0;

  if (!v27)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v28 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      double v29 = [v96 microphone];
      *(_DWORD *)buf = 136315650;
      v106 = "AVAudioDeviceTestService.mm";
      __int16 v107 = 1024;
      int v108 = 1068;
      __int16 v109 = 2114;
      double v110 = v29;
      _os_log_impl(&dword_19D794000, v28, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Multichannel file provided, will split into single channel buffers. { requestedMic=%{public}@ }", buf, 0x1Cu);
    }
    int v30 = [(AVAudioPCMBuffer *)v20 splitIntoSingleChannelBuffers];
    uint64_t v31 = [v96 microphone];
    char v32 = [v31 isEqualToString:@"LeftBottom"];

    if (v32)
    {
      uint64_t v33 = 0;
    }
    else
    {
      id v37 = [v96 microphone];
      char v38 = [v37 isEqualToString:@"Front"];

      if (v38)
      {
        uint64_t v33 = 1;
      }
      else
      {
        id v39 = [v96 microphone];
        char v40 = [v39 isEqualToString:@"Back"];

        if (v40)
        {
          uint64_t v33 = 2;
        }
        else
        {
          __int16 v41 = [v96 microphone];
          int v42 = [v41 isEqualToString:@"RightBottom"];

          if (!v42)
          {
            if (AVAudioDeviceTestServiceLog(void)::once != -1) {
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
            }
            v79 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              double v80 = [v96 microphone];
              *(_DWORD *)buf = 136315650;
              v106 = "AVAudioDeviceTestService.mm";
              __int16 v107 = 1024;
              int v108 = 1081;
              __int16 v109 = 2114;
              double v110 = v80;
              _os_log_impl(&dword_19D794000, v79, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid mic channel name. { providedName=%{public}@ }", buf, 0x1Cu);
            }
            v58 = generateAudioSelfTestError(-7);
            v93[2](v93, v58);
            id v36 = v21;
            goto LABEL_66;
          }
          uint64_t v33 = 3;
        }
      }
    }
    uint64_t v43 = [(AVAudioPCMBuffer *)v30 objectAtIndexedSubscript:v33];

    int v30 = (AVAudioPCMBuffer *)v43;
LABEL_38:
    if (v94)
    {
      __int16 v44 = [(AVAudioBuffer *)v20 format];
      BOOL v45 = [v44 channelCount] == 1;

      if (v45)
      {
        __int16 v46 = [(AVAudioFile *)v95 processingFormat];
        [v46 sampleRate];
        double v48 = v47;
        int v49 = [(AVAudioDeviceTestService *)self engine];
        uint64_t v50 = [v49 inputNode];
        v51 = [v50 inputFormatForBus:0];
        [v51 sampleRate];
        BOOL v53 = v48 != v52;

        if (v53)
        {
          char v54 = [(AVAudioDeviceTestService *)self convertBufferFor:v95 sourceBuffer:v20];
        }
        else
        {
          char v54 = 0;
        }
        if (v54) {
          id v55 = v54;
        }
        else {
          id v55 = v20;
        }
        v56 = v55;

        int v30 = v56;
      }
    }
    dispatch_semaphore_t v92 = dispatch_semaphore_create(0);
    uint64_t v57 = [(AVAudioDeviceTestService *)self player];
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __57__AVAudioDeviceTestService_playback_filePath_completion___block_invoke;
    v100[3] = &unk_1E5965BC0;
    v91 = v93;
    v102 = v91;
    v58 = v92;
    v101 = v58;
    [v57 scheduleBuffer:v30 atTime:0 options:2 completionHandler:v100];

    if (v94)
    {
      uint64_t v59 = [(AVAudioDeviceTestService *)self inputFilter];
      if (v59)
      {
        v60 = [(AVAudioDeviceTestService *)self inputFilter];
        id v61 = v60;
      }
      else
      {
        id v61 = [(AVAudioDeviceTestService *)self engine];
        v60 = [v61 inputNode];
      }
      [(AVAudioDeviceTestService *)self setNodeToCaptureData:v60];
      if (!v59) {

      }
      id v62 = [(AVAudioDeviceTestService *)self engine];
      id v63 = [v62 inputNode];
      id v64 = [v63 inputFormatForBus:0];

      id v65 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v94];
      id v66 = [AVAudioFile alloc];
      v67 = [v64 settings];
      id v99 = v21;
      v68 = [(AVAudioFile *)v66 initForWriting:v65 settings:v67 error:&v99];
      id v69 = v99;

      id v21 = v69;
      [(AVAudioDeviceTestService *)self setInputTapFile:v68];

      if (v69)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        int v70 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          double v71 = [v69 localizedDescription];
          *(_DWORD *)buf = 136315650;
          v106 = "AVAudioDeviceTestService.mm";
          __int16 v107 = 1024;
          int v108 = 1127;
          __int16 v109 = 2112;
          double v110 = v71;
          _os_log_impl(&dword_19D794000, v70, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create input tap file %@", buf, 0x1Cu);
        }
      }
      uint64_t v72 = [(AVAudioDeviceTestService *)self nodeToCaptureData];
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __57__AVAudioDeviceTestService_playback_filePath_completion___block_invoke_151;
      v98[3] = &unk_1E5964CF8;
      v98[4] = self;
      [v72 installTapOnBus:0 bufferSize:4096 format:v64 block:v98];
    }
    __int16 v73 = [(AVAudioDeviceTestService *)self engine];
    [v73 prepare];

    uint64_t v74 = [(AVAudioDeviceTestService *)self engine];
    id v97 = v21;
    char v75 = [v74 startAndReturnError:&v97];
    id v36 = v97;

    if ((v75 & 1) == 0)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      v86 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        double v87 = [v36 localizedDescription];
        v88 = generateAudioSelfTestError(-10);
        uint64_t v89 = [v88 code];
        *(_DWORD *)buf = 136315906;
        v106 = "AVAudioDeviceTestService.mm";
        __int16 v107 = 1024;
        int v108 = 1141;
        __int16 v109 = 2112;
        double v110 = v87;
        __int16 v111 = 2048;
        uint64_t v112 = v89;
        _os_log_impl(&dword_19D794000, v86, OS_LOG_TYPE_ERROR, "%25s:%-5d startAndReturnError (%@) with test error (%li)", buf, 0x26u);
      }
      v90 = generateAudioSelfTestError(-10);
      v91[2](v91, v90);

      exit(-1);
    }
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    v76 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      double v77 = [(AVAudioDeviceTestService *)self engine];
      *(_DWORD *)buf = 136315650;
      v106 = "AVAudioDeviceTestService.mm";
      __int16 v107 = 1024;
      int v108 = 1146;
      __int16 v109 = 2112;
      double v110 = v77;
      _os_log_impl(&dword_19D794000, v76, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@", buf, 0x1Cu);
    }
    v78 = [(AVAudioDeviceTestService *)self player];
    [v78 play];

    dispatch_semaphore_wait(v58, 0xFFFFFFFFFFFFFFFFLL);
    [(AVAudioDeviceTestService *)self stopPlayback];

LABEL_66:
    goto LABEL_67;
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  id v34 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v106 = "AVAudioDeviceTestService.mm";
    __int16 v107 = 1024;
    int v108 = 1086;
    _os_log_impl(&dword_19D794000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid setup, cannot provide multichannel playback file without specifying mic channel.", buf, 0x12u);
  }
  uint64_t v35 = generateAudioSelfTestError(-7);
  v93[2](v93, (void *)v35);
  int v30 = (AVAudioPCMBuffer *)v35;
  id v36 = v21;
LABEL_67:
}

intptr_t __57__AVAudioDeviceTestService_playback_filePath_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  CFPropertyListRef v2 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "AVAudioDeviceTestService.mm";
    __int16 v6 = 1024;
    int v7 = 1112;
    _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d player finished", (uint8_t *)&v4, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__AVAudioDeviceTestService_playback_filePath_completion___block_invoke_151(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) inputTapFile];
  id v9 = 0;
  char v5 = [v4 writeFromBuffer:v3 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    int v7 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315650;
      float v11 = "AVAudioDeviceTestService.mm";
      __int16 v12 = 1024;
      int v13 = 1133;
      __int16 v14 = 2112;
      __int16 v15 = v8;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d error writing debug file %@", buf, 0x1Cu);
    }
  }
}

- (void)playbackTone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AVAudioDeviceTestService *)self toneQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke;
  block[3] = &unk_1E5965D28;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke(id *a1)
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  CFPropertyListRef v2 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    [a1[4] frequency];
    uint64_t v4 = v3;
    [a1[4] volume];
    float v6 = v5;
    [a1[4] duration];
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 892;
    *(_WORD *)&unsigned char buf[18] = 2048;
    *(void *)&buf[20] = v4;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v6;
    *(_WORD *)&buf[38] = 2048;
    id v116 = v7;
    _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Playback tone request. { frequency=%f, volume=%f, duration=%f }", buf, 0x30u);
  }

  id v9 = a1[4];
  id v8 = a1[5];
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_131;
  v105[3] = &unk_1E5965B70;
  id v106 = a1[6];
  [v8 checkSequenceValidity:v9 completion:v105];
  id v10 = [a1[5] hearingTestSession];
  LODWORD(v8) = v10 == 0;

  if (v8)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    float v11 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 901;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d HearingTest session not set, falling back to default playback session.", buf, 0x12u);
    }
    id v13 = a1[4];
    id v12 = a1[5];
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_133;
    v103[3] = &unk_1E5965B70;
    id v104 = a1[6];
    [v12 setupAudioSessionFor:v13 playbackOnly:1 completion:v103];
  }
  id v14 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  float v102 = 0.0;
  if (([v14 getActiveCategoryVolume:&v102 andName:0] & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    __int16 v15 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 913;
      _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Error getting current volume", buf, 0x12u);
    }
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  uint64_t v16 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 916;
    *(_WORD *)&unsigned char buf[18] = 2048;
    *(double *)&buf[20] = v102;
    _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] CurrentVolume=%f", buf, 0x1Cu);
  }
  id v17 = [a1[5] userVolumeBeforeHearingTest];
  BOOL v18 = v17 == 0;

  if (v18)
  {
    id v19 = objc_alloc(NSNumber);
    *(float *)&double v20 = v102;
    id v21 = (void *)[v19 initWithFloat:v20];
    [a1[5] setUserVolumeBeforeHearingTest:v21];
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  __int16 v22 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    double v23 = [a1[5] userVolumeBeforeHearingTest];
    [v23 doubleValue];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 922;
    *(_WORD *)&unsigned char buf[18] = 2048;
    *(void *)&buf[20] = v24;
    _os_log_impl(&dword_19D794000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] userVolumeBeforeHearingTest=%f", buf, 0x1Cu);
  }
  [a1[4] volume];
  float v26 = vabds_f32(v102, v25);
  if (v26 >= 1.1755e-38)
  {
    float v27 = fabsf(v25 + v102);
    if (v26 > (float)((float)(v27 * 0.00000011921) + (float)(v27 * 0.00000011921)))
    {
      [a1[4] volume];
      if ((objc_msgSend(v14, "setActiveCategoryVolumeTo:") & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        uint64_t v28 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          [a1[4] volume];
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 925;
          *(_WORD *)&unsigned char buf[18] = 2048;
          *(double *)&buf[20] = v29;
          _os_log_impl(&dword_19D794000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d Unable to set category volume to %f", buf, 0x1Cu);
        }

        int v30 = (void (**)(id, void, void *))a1[6];
        uint64_t v31 = generateAudioSelfTestError(-15);
        v30[2](v30, 0, v31);
      }
    }
  }
  id v32 = a1[5];
  [a1[4] volume];
  int v34 = v33;
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_134;
  v100[3] = &unk_1E5965B70;
  id v101 = a1[6];
  LODWORD(v35) = v34;
  [v32 setupVolumeObserverForVolume:v100 completion:v35];
  if (([a1[5] createAudioEngineAndPulseToneHandlerFor:a1[4]] & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    id v36 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 937;
      _os_log_impl(&dword_19D794000, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Failed to create pulse tone handler", buf, 0x12u);
    }
    id v37 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-10 userInfo:0];
    (*((void (**)(void))a1[6] + 2))();
  }
  char v38 = [a1[5] hearingTestSession];
  BOOL v39 = v38 == 0;

  if (v39)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    char v40 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 943;
      _os_log_impl(&dword_19D794000, v40, OS_LOG_TYPE_DEFAULT, "%25s:%-5d No session already created.", buf, 0x12u);
    }
    id v41 = a1[5];
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_139;
    v98[3] = &unk_1E5965D00;
    v98[4] = v41;
    id v99 = a1[6];
    [v41 setupObservers:v98];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__3466;
  *(void *)&buf[32] = __Block_byref_object_dispose__3467;
  id v116 = (id)[*(id *)(*((void *)a1[5] + 1) + 16) copy];
  id v43 = a1[4];
  id v42 = a1[5];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_140;
  v97[3] = &unk_1E5964CD0;
  v97[4] = v42;
  [v42 setupAudioEngineFor:v43 sourceNodeBlock:v97];
  id v44 = a1[5];
  BOOL v45 = [a1[4] micBufferNumbers];
  uint64_t v46 = [v45 count];
  if (v46)
  {
    double v47 = [a1[4] micBufferNumbers];
  }
  else
  {
    double v47 = 0;
  }
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_2;
  v95[3] = &unk_1E5965B70;
  id v96 = a1[6];
  [v44 setupMultiChannelMixerForOutputChannel:v47 completion:v95];
  if (v46) {

  }
  double v48 = AVAudioDeviceTestServiceSignPost();
  uint64_t v49 = TonePlaybackSignpostID();
  if ((unint64_t)(v49 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v50 = v49;
    if (os_signpost_enabled(v48))
    {
      [a1[4] frequency];
      double v52 = v51;
      [a1[4] soundLevel];
      *(_DWORD *)__int16 v107 = 134218240;
      int v108 = v52;
      __int16 v109 = 2048;
      *(void *)double v110 = v53;
      _os_signpost_emit_with_name_impl(&dword_19D794000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v50, "AVF tone playback", "freq=%f, lvl=%f", v107, 0x16u);
    }
  }

  char v54 = [a1[5] engine];
  [v54 prepare];

  if ([a1[5] isMixerOutputEnabled])
  {
    id v55 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/tmp/multichannel_mixer_out.caf"];
    v56 = [AVAudioFile alloc];
    uint64_t v57 = [a1[5] engine];
    v58 = [v57 outputNode];
    uint64_t v59 = [v58 outputFormatForBus:0];
    v60 = [v59 settings];
    id v94 = 0;
    id v61 = [(AVAudioFile *)v56 initForWriting:v55 settings:v60 error:&v94];
    id v62 = v94;

    if (v62) {
      (*((void (**)(void))a1[6] + 2))();
    }
    id v63 = [a1[5] multichannelMixer];
    id v64 = [a1[5] multichannelMixer];
    id v65 = [v64 outputFormatForBus:0];
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_146;
    v92[3] = &unk_1E5964CF8;
    id v66 = v61;
    v93 = v66;
    [v63 installTapOnBus:0 bufferSize:1024 format:v65 block:v92];
  }
  else
  {
    id v62 = 0;
  }
  v67 = [a1[5] engine];
  id v91 = v62;
  char v68 = [v67 startAndReturnError:&v91];
  id v69 = v91;

  if ((v68 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    double v80 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      v81 = [v69 localizedDescription];
      double v82 = generateAudioSelfTestError(-10);
      double v83 = COERCE_DOUBLE([v82 code]);
      *(_DWORD *)__int16 v107 = 136315906;
      int v108 = "AVAudioDeviceTestService.mm";
      __int16 v109 = 1024;
      *(_DWORD *)double v110 = 990;
      *(_WORD *)&v110[4] = 2112;
      *(void *)&v110[6] = v81;
      __int16 v111 = 2048;
      double v112 = v83;
      _os_log_impl(&dword_19D794000, v80, OS_LOG_TYPE_ERROR, "%25s:%-5d startAndReturnError (%@) with test error (%li)", v107, 0x26u);
    }
    uint64_t v84 = (void (**)(id, void, void *))a1[6];
    v85 = generateAudioSelfTestError(-10);
    v84[2](v84, 0, v85);

    exit(-1);
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  int v70 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    [a1[4] frequency];
    uint64_t v72 = v71;
    [a1[4] volume];
    float v74 = v73;
    [a1[4] duration];
    *(_DWORD *)__int16 v107 = 136316162;
    int v108 = "AVAudioDeviceTestService.mm";
    __int16 v109 = 1024;
    *(_DWORD *)double v110 = 995;
    *(_WORD *)&v110[4] = 2048;
    *(void *)&v110[6] = v72;
    __int16 v111 = 2048;
    double v112 = v74;
    __int16 v113 = 2048;
    uint64_t v114 = v75;
    _os_log_impl(&dword_19D794000, v70, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Started playing back tone. { frequency=%f, volume=%f, duration=%f }", v107, 0x30u);
  }

  [a1[4] duration];
  dispatch_time_t v77 = dispatch_time(0, (uint64_t)(v76 * 1000000000.0));
  v78 = [a1[5] toneQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_149;
  block[3] = &unk_1E5964D20;
  int8x16_t v86 = *((int8x16_t *)a1 + 2);
  id v79 = (id)v86.i64[0];
  int8x16_t v88 = vextq_s8(v86, v86, 8uLL);
  v90 = buf;
  id v89 = a1[6];
  dispatch_after(v77, v78, block);

  _Block_object_dispose(buf, 8);
}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_131(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_133(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_134(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v4 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      float v6 = "AVAudioDeviceTestService.mm";
      __int16 v7 = 1024;
      int v8 = 946;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Interruption detected, resetting observers.", (uint8_t *)&v5, 0x12u);
    }
    [*(id *)(a1 + 32) cleanUpObservers];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_140(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int *a5)
{
  int v5 = *(unsigned __int8 **)(*(void *)(a1 + 32) + 8);
  if (v5 && a4)
  {
    uint64_t v6 = 0;
    __int16 v7 = a5 + 4;
    uint64_t v8 = *a5;
    uint64_t v9 = *((void *)v5 + 5);
    int v10 = *((_DWORD *)v5 + 12);
    int v11 = v5[80];
    uint64_t v12 = a4;
    double v13 = *((double *)v5 + 3) / *((double *)v5 + 9);
    while (1)
    {
      ++v9;
      int v14 = v10 + 1;
      double v15 = 0.0;
      if (!v11)
      {
        int v20 = *((_DWORD *)v5 + 13);
        if (v20)
        {
          if (v10 < 0)
          {
            int v11 = *v5;
            v5[80] = v11;
          }
          else
          {
            double v21 = sin((v13 * (double)v9 + v13 * (double)v9) * 3.14159265) * *((double *)v5 + 4);
            int v22 = *((_DWORD *)v5 + 14);
            if (v10 >= v22)
            {
              int v25 = *((_DWORD *)v5 + 15);
              if (!v25 && !*v5)
              {
                int v11 = 0;
                int v10 = *((_DWORD *)v5 + 14);
                goto LABEL_26;
              }
              double v26 = *((double *)v5 + 8);
              double v27 = v26 + (double)v22;
              if (v27 <= (double)v14)
              {
                int v10 = (int)-((double)v25 - v26);
                *((_DWORD *)v5 + 13) = (v20 & ~(v20 >> 31)) - 1;
                int v11 = *v5;
                v5[80] = v11;
                goto LABEL_6;
              }
              int v11 = 0;
              double v24 = (v27 - (double)v14) / v26;
            }
            else
            {
              double v23 = *((double *)v5 + 8);
              int v11 = 0;
              if (v23 <= (double)v14)
              {
                ++v10;
LABEL_26:
                double v15 = v21;
                goto LABEL_6;
              }
              double v24 = (double)v14 / v23;
            }
            double v15 = v21 * v24;
          }
        }
        else
        {
          int v11 = 0;
        }
      }
      ++v10;
LABEL_6:
      if (v8)
      {
        id v17 = v7;
        uint64_t v18 = v8;
        do
        {
          uint64_t v19 = *(void *)v17;
          v17 += 4;
          float v16 = v15;
          *(float *)(v19 + 4 * v6) = v16;
          --v18;
        }
        while (v18);
      }
      if (++v6 == v12)
      {
        *((void *)v5 + 5) = v9;
        *((_DWORD *)v5 + 12) = v10;
        return 0;
      }
    }
  }
  return 0;
}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_146(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = *(void **)(a1 + 32);
  id v9 = 0;
  char v8 = [v7 writeFromBuffer:v5 error:&v9];
  if (v9) {
    __assert_rtn("-[AVAudioDeviceTestService playbackTone:completion:]_block_invoke", "AVAudioDeviceTestService.mm", 984, "err == nil");
  }
  if ((v8 & 1) == 0) {
    __assert_rtn("-[AVAudioDeviceTestService playbackTone:completion:]_block_invoke", "AVAudioDeviceTestService.mm", 985, "didWrite");
  }
}

uint64_t __52__AVAudioDeviceTestService_playbackTone_completion___block_invoke_149(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    int v10 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    [*(id *)(a1 + 40) frequency];
    uint64_t v14 = v13;
    [*(id *)(a1 + 40) volume];
    float v16 = v15;
    [*(id *)(a1 + 40) duration];
    *(_DWORD *)uint64_t v31 = 136316162;
    *(void *)&v31[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&v31[12] = 1024;
    *(_DWORD *)&v31[14] = 999;
    *(_WORD *)&v31[18] = 2048;
    *(void *)&v31[20] = v14;
    *(_WORD *)&v31[28] = 2048;
    *(double *)&v31[30] = v16;
    *(_WORD *)&v31[38] = 2048;
    uint64_t v32 = v17;
    uint64_t v18 = "%25s:%-5d [AVAT Server] Duration timer called, tone has already been stopped, pulse tone handler is nil { freq"
          "uency=%f, volume=%f, duration=%f }";
    uint64_t v19 = v10;
    uint32_t v20 = 48;
LABEL_20:
    _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_DEFAULT, v18, v31, v20);
LABEL_21:

    goto LABEL_22;
  }
  if (([*(id *)(v2 + 16) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)] & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    int v10 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    [*(id *)(a1 + 40) frequency];
    uint64_t v22 = v21;
    [*(id *)(a1 + 40) volume];
    float v24 = v23;
    [*(id *)(a1 + 40) duration];
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
    *(_DWORD *)uint64_t v31 = 136316674;
    *(void *)&v31[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&v31[12] = 1024;
    *(_DWORD *)&v31[14] = 1001;
    *(_WORD *)&v31[18] = 2048;
    *(void *)&v31[20] = v22;
    *(_WORD *)&v31[28] = 2048;
    *(double *)&v31[30] = v24;
    *(_WORD *)&v31[38] = 2048;
    uint64_t v32 = v27;
    *(_WORD *)int v33 = 2112;
    *(void *)&v33[2] = v25;
    *(_WORD *)&v33[10] = 2112;
    *(void *)&v33[12] = v26;
    uint64_t v18 = "%25s:%-5d [AVAT Server] Duration timer called, tone has already been stopped, pulse tone IDs do not match. { f"
          "requency=%f, volume=%f, duration=%f, pulseToneID=%@, currID=%@ }";
    uint64_t v19 = v10;
    uint32_t v20 = 68;
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3
    && [*(id *)(v3 + 16) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v4 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 40) frequency];
      uint64_t v6 = v5;
      [*(id *)(a1 + 40) volume];
      float v8 = v7;
      [*(id *)(a1 + 40) duration];
      *(_DWORD *)uint64_t v31 = 136316162;
      *(void *)&v31[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 1003;
      *(_WORD *)&v31[18] = 2048;
      *(void *)&v31[20] = v6;
      *(_WORD *)&v31[28] = 2048;
      *(double *)&v31[30] = v8;
      *(_WORD *)&v31[38] = 2048;
      uint64_t v32 = v9;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Duration timer called, stopping tone. { frequency=%f, volume=%f, duration=%f }", v31, 0x30u);
    }

    **(unsigned char **)(*(void *)(a1 + 32) + 8) = 1;
    [MEMORY[0x1E4F29060] sleepForTimeInterval:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 8)];
    [*(id *)(a1 + 32) cleanUp];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    int v10 = AVAudioDeviceTestServiceSignPost();
    uint64_t v11 = TonePlaybackSignpostID();
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)uint64_t v31 = 0;
        _os_signpost_emit_with_name_impl(&dword_19D794000, v10, OS_SIGNPOST_INTERVAL_END, v12, "AVF tone playback", "duration timer", v31, 2u);
      }
    }
    goto LABEL_21;
  }
LABEL_22:
  uint64_t v28 = *(void **)(a1 + 32);
  float v29 = objc_msgSend(v28, "userVolumeBeforeHearingTest", *(_OWORD *)v31, *(_OWORD *)&v31[16], *(void *)&v31[32], v32, *(_OWORD *)v33, *(void *)&v33[16], v34);
  [v29 floatValue];
  objc_msgSend(v28, "resetVolume:");

  return [*(id *)(a1 + 32) removeSystemVolumeObserver];
}

- (double)calculateCrossCorrelationPeakRelativeToSource:(id)a3 capture:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  float v7 = [v5 format];
  if ([v7 channelCount] == 1)
  {
    float v8 = [v6 format];
    int v9 = [v8 channelCount];

    if (v9 == 1)
    {
      vDSP_Length v10 = [v5 frameLength];
      uint64_t v11 = *(const float **)[v5 floatChannelData];
      os_signpost_id_t v12 = malloc_type_malloc(8 * v10, 0x100004052888210uLL);
      bzero(v12, 8 * v10);
      unint64_t v13 = 3 * v10 - 1;
      uint64_t v14 = malloc_type_malloc(4 * v13, 0x100004052888210uLL);
      bzero(v14, 4 * v13);
      if (v13 <= [v6 frameLength])
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        uint64_t v18 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = generateAudioSelfTestError(-12);
          float v21 = 4.8152e-34;
          uint64_t v22 = "AVAudioDeviceTestService.mm";
          __int16 v23 = 1024;
          int v24 = 868;
          __int16 v25 = 2048;
          uint64_t v26 = [v19 code];
          _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d the length of the captured buffer needs to be greater (%li)", (uint8_t *)&v21, 0x1Cu);
        }
      }
      else
      {
        memcpy(v14, *(const void **)[v6 floatChannelData], 4 * objc_msgSend(v6, "frameLength"));
      }
      vDSP_conv((const float *)v14, 1, v11, 1, (float *)v12, 1, 2 * v10, v10);
      float v21 = 0.0;
      vDSP_maxv((const float *)v12, 1, &v21, 2 * v10);
      free(v14);
      free(v12);
      double v17 = (float)(log10f(v21) * 10.0);
      goto LABEL_17;
    }
  }
  else
  {
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  float v15 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    float v16 = generateAudioSelfTestError(-12);
    float v21 = 4.8152e-34;
    uint64_t v22 = "AVAudioDeviceTestService.mm";
    __int16 v23 = 1024;
    int v24 = 881;
    __int16 v25 = 2048;
    uint64_t v26 = [v16 code];
    _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d the source file or captured buffers aren't signal channel files (%li)", (uint8_t *)&v21, 0x1Cu);
  }
  double v17 = 0.0;
LABEL_17:

  return v17;
}

- (void)startWithSequence:(id)a3 completion:(id)a4
{
  uint64_t v246 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v210 = (void (**)(id, void, void *))a4;
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  float v7 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 449;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d entering sequence", buf, 0x12u);
  }

  float v8 = self;
  objc_sync_enter(v8);
  *(void *)v243 = 0;
  *(void *)&v243[8] = v243;
  *(void *)&v243[16] = 0x2020000000;
  p_opt_class_meths = &OBJC_PROTOCOL___AVAudioMixing.opt_class_meths;
  vDSP_Length v10 = (void (*)(void))getMSNMonitorBeginExceptionSymbolLoc(void)::ptr;
  *(void *)&v243[24] = getMSNMonitorBeginExceptionSymbolLoc(void)::ptr;
  if (!getMSNMonitorBeginExceptionSymbolLoc(void)::ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ___ZL36getMSNMonitorBeginExceptionSymbolLocv_block_invoke;
    *(void *)&buf[24] = &unk_1E5965E38;
    *(void *)&buf[32] = v243;
    uint64_t v11 = MediaSafetyNetLibrary();
    os_signpost_id_t v12 = dlsym(v11, "MSNMonitorBeginException");
    *(void *)(*(void *)(*(void *)&buf[32] + 8) + 24) = v12;
    getMSNMonitorBeginExceptionSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)&buf[32] + 8) + 24);
    vDSP_Length v10 = *(void (**)(void))(*(void *)&v243[8] + 24);
  }
  _Block_object_dispose(v243, 8);
  if (!v10)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v187 = [NSString stringWithUTF8String:"void MSNMonitorBeginException_soft(const char *)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v187, @"AVAudioDeviceTestService.mm", 47, @"%s", dlerror());

    goto LABEL_173;
  }
  v10("audiotesting");
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  unint64_t v13 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 457;
    _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d starting sequence", buf, 0x12u);
  }

  uint64_t v14 = [MEMORY[0x1E4F4E9F8] sharedInstance];
  [v14 setAllowAllBuiltInDataSources:1];
  if ([v6 priority]) {
    uint64_t v15 = [v6 priority];
  }
  else {
    uint64_t v15 = 10;
  }
  id v242 = 0;
  char v16 = [v14 setInterruptionPriority:v15 error:&v242];
  p_opt_class_meths = (__objc2_meth_list **)v242;
  if (v16) {
    goto LABEL_20;
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    goto LABEL_174;
  }
  while (1)
  {
    double v17 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [p_opt_class_meths code];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 467;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v18;
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d error setInterruptionPriority %li", buf, 0x1Cu);
    }

    uint64_t v19 = generateAudioSelfTestError(-3);
    v210[2](v210, 0, v19);

LABEL_20:
    if ([v6 requiresBluetoothOutput]) {
      uint64_t v20 = 33;
    }
    else {
      uint64_t v20 = 1;
    }
    uint64_t v21 = *MEMORY[0x1E4F4E7F0];
    uint64_t v22 = *MEMORY[0x1E4F4E8D8];
    v241 = p_opt_class_meths;
    char v23 = [v14 setCategory:v21 mode:v22 options:v20 error:&v241];
    int v24 = v241;

    __int16 v25 = v24;
    if ((v23 & 1) == 0)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      uint64_t v26 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = [v24 code];
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 477;
        *(_WORD *)&unsigned char buf[18] = 2048;
        *(void *)&buf[20] = v27;
        _os_log_impl(&dword_19D794000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d setCategory %li", buf, 0x1Cu);
      }

      uint64_t v28 = generateAudioSelfTestError(-1);
      v210[2](v210, 0, v28);
    }
    v240 = v24;
    char v29 = [v14 setActive:1 error:&v240];
    int v30 = v240;

    uint64_t v31 = v30;
    if (v29)
    {
      v239 = v30;
      char v32 = [v14 setPreferredIOBufferFrameSize:4096 error:&v239];
      int v33 = v239;

      if ((v32 & 1) == 0)
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        uint64_t v34 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = [v33 code];
          id v36 = generateAudioSelfTestError(-1);
          uint64_t v37 = [v36 code];
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 504;
          *(_WORD *)&unsigned char buf[18] = 2048;
          *(void *)&buf[20] = v35;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = v37;
          _os_log_impl(&dword_19D794000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d setPreferredIOBufferFrameSize (%li) with test error (%li)", buf, 0x26u);
        }
      }
      dispatch_semaphore_t v208 = dispatch_semaphore_create(0);
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      char v38 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 509;
        _os_log_impl(&dword_19D794000, v38, OS_LOG_TYPE_DEFAULT, "%25s:%-5d configuring sequence", buf, 0x12u);
      }

      BOOL v39 = [v6 mode];
      BOOL v40 = v39 == 0;

      if (!v40)
      {
        id v41 = [v6 mode];
        v238 = v33;
        char v42 = [v14 setMode:v41 error:&v238];
        id v43 = v238;

        if ((v42 & 1) == 0)
        {
          if (AVAudioDeviceTestServiceLog(void)::once != -1) {
            dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
          }
          id v44 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            uint64_t v45 = [v43 code];
            uint64_t v46 = generateAudioSelfTestError(-1);
            uint64_t v47 = [v46 code];
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 513;
            *(_WORD *)&unsigned char buf[18] = 2048;
            *(void *)&buf[20] = v45;
            *(_WORD *)&buf[28] = 2048;
            *(void *)&buf[30] = v47;
            _os_log_impl(&dword_19D794000, v44, OS_LOG_TYPE_ERROR, "%25s:%-5d setMode (%li) with test error (%li)", buf, 0x26u);
          }
        }
        int v33 = v43;
      }
      [(AVAudioDeviceTestService *)v8 configureDataSources:v6 session:v14];
      [(AVAudioDeviceTestService *)v8 createAudioEngineAndProcessingChain:v6 session:v14 sourceNodeBlock:0];
      if ([v6 numberOfChannels])
      {
        uint64_t v48 = [v6 outputID];
        uint64_t v49 = [v6 numberOfChannels];
      }
      else
      {
        uint64_t v48 = [v6 outputID];
        uint64_t v49 = 1;
      }
      [(AVAudioDeviceTestService *)v8 configureMultiChannelMixerForOutputChannel:v48 totalChannels:v49];
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      uint64_t v57 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        int v58 = [v6 requiresBluetoothOutput];
        BOOL v59 = [(AVAudioDeviceTestService *)v8 isOutputRouteBluetooth:v6 session:v14];
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 529;
        *(_WORD *)&unsigned char buf[18] = 1024;
        *(_DWORD *)&buf[20] = v58;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = v59;
        _os_log_impl(&dword_19D794000, v57, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Bluetooth setting: %d, Output route: %d", buf, 0x1Eu);
      }

      if ([v6 requiresBluetoothOutput]
        && ![(AVAudioDeviceTestService *)v8 isOutputRouteBluetooth:v6 session:v14])
      {
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        id v97 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 532;
          _os_log_impl(&dword_19D794000, v97, OS_LOG_TYPE_ERROR, "%25s:%-5d Output route is not a bluetooth speaker", buf, 0x12u);
        }

        v98 = generateAudioSelfTestError(-7);
        v210[2](v210, 0, v98);
      }
      else
      {
        if ([(AVAudioDeviceTestService *)v8 setVolume:v6 session:v14])
        {
          if (AVAudioDeviceTestServiceLog(void)::once != -1) {
            dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
          }
          v60 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 543;
            _os_log_impl(&dword_19D794000, v60, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting up observers", buf, 0x12u);
          }

          id v61 = [(AVAudioDeviceTestService *)v8 routeChangeObserver];
          BOOL v62 = v61 == 0;

          if (!v62)
          {
            id v63 = [MEMORY[0x1E4F28EB8] defaultCenter];
            id v64 = [(AVAudioDeviceTestService *)v8 routeChangeObserver];
            [v63 removeObserver:v64];
          }
          id v65 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v66 = *MEMORY[0x1E4F4E9B0];
          v237[0] = MEMORY[0x1E4F143A8];
          v237[1] = 3221225472;
          v237[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke;
          v237[3] = &unk_1E5964BE0;
          v237[4] = v8;
          v67 = [v65 addObserverForName:v66 object:v14 queue:0 usingBlock:v237];
          [(AVAudioDeviceTestService *)v8 setRouteChangeObserver:v67];

          char v68 = [(AVAudioDeviceTestService *)v8 interruptionObserver];
          BOOL v69 = v68 == 0;

          if (!v69)
          {
            int v70 = [MEMORY[0x1E4F28EB8] defaultCenter];
            uint64_t v71 = [(AVAudioDeviceTestService *)v8 interruptionObserver];
            [v70 removeObserver:v71];
          }
          uint64_t v72 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v73 = *MEMORY[0x1E4F4E838];
          v235[0] = MEMORY[0x1E4F143A8];
          v235[1] = 3221225472;
          v235[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_110;
          v235[3] = &unk_1E5964C08;
          float v74 = v210;
          id v236 = v74;
          uint64_t v75 = [v72 addObserverForName:v73 object:v14 queue:0 usingBlock:v235];
          [(AVAudioDeviceTestService *)v8 setInterruptionObserver:v75];

          double v76 = [(AVAudioDeviceTestService *)v8 mediaservicesLostObserver];
          LOBYTE(v73) = v76 == 0;

          if ((v73 & 1) == 0)
          {
            dispatch_time_t v77 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v78 = [(AVAudioDeviceTestService *)v8 mediaservicesLostObserver];
            [v77 removeObserver:v78];
          }
          id v79 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v80 = *MEMORY[0x1E4F4E888];
          v233[0] = MEMORY[0x1E4F143A8];
          v233[1] = 3221225472;
          v233[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_111;
          v233[3] = &unk_1E5964C08;
          v203 = v74;
          id v234 = v203;
          v81 = [v79 addObserverForName:v80 object:v14 queue:0 usingBlock:v233];
          [(AVAudioDeviceTestService *)v8 setMediaservicesLostObserver:v81];

          if (AVAudioDeviceTestServiceLog(void)::once != -1) {
            dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
          }
          double v82 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 576;
            _os_log_impl(&dword_19D794000, v82, OS_LOG_TYPE_DEFAULT, "%25s:%-5d preparing for test", buf, 0x12u);
          }

          double v83 = [AVAudioFile alloc];
          uint64_t v84 = [v6 stimulusURL];
          v232 = v33;
          v209 = [(AVAudioFile *)v83 initForReading:v84 error:&v232];
          v85 = v232;

          if (!v209 && v85)
          {
            if (AVAudioDeviceTestServiceLog(void)::once != -1) {
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
            }
            v189 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
            if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
            {
              v190 = [v85 localizedDescription];
              v191 = generateAudioSelfTestError(-9);
              uint64_t v192 = [v191 code];
              *(_DWORD *)buf = 136315906;
              *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 581;
              *(_WORD *)&unsigned char buf[18] = 2112;
              *(void *)&buf[20] = v190;
              *(_WORD *)&buf[28] = 2048;
              *(void *)&buf[30] = v192;
              _os_log_impl(&dword_19D794000, v189, OS_LOG_TYPE_ERROR, "%25s:%-5d unable to read stimulus file (%@) with test error (%li)", buf, 0x26u);
            }
            v193 = generateAudioSelfTestError(-9);
            v203[2](v203, 0, v193);

            exit(-9);
          }
          int8x16_t v86 = [AVAudioPCMBuffer alloc];
          uint64_t v87 = [(AVAudioFile *)v209 processingFormat];
          v206 = [(AVAudioPCMBuffer *)v86 initWithPCMFormat:v87 frameCapacity:[(AVAudioFile *)v209 length]];

          v231 = v85;
          LOBYTE(v87) = [(AVAudioFile *)v209 readIntoBuffer:v206 error:&v231];
          int8x16_t v88 = (__objc2_meth_list **)v231;

          uint64_t v31 = v88;
          if (v87)
          {
            id v89 = v206;
          }
          else
          {
            if (AVAudioDeviceTestServiceLog(void)::once != -1) {
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
            }
            id v99 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              v100 = [v88 localizedDescription];
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 588;
              *(_WORD *)&unsigned char buf[18] = 2112;
              *(void *)&buf[20] = v100;
              _os_log_impl(&dword_19D794000, v99, OS_LOG_TYPE_ERROR, "%25s:%-5d error reading stimulus file into buffer %@", buf, 0x1Cu);
            }
            id v89 = 0;
          }
          v207 = v89;
          id v101 = [(AVAudioBuffer *)v89 format];
          BOOL v102 = [v101 channelCount] > 1;

          if (v102)
          {
            if (AVAudioDeviceTestServiceLog(void)::once != -1) {
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
            }
            id v103 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
            if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            {
              id v104 = generateAudioSelfTestError(-6);
              uint64_t v105 = [v104 code];
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 593;
              *(_WORD *)&unsigned char buf[18] = 2048;
              *(void *)&buf[20] = v105;
              _os_log_impl(&dword_19D794000, v103, OS_LOG_TYPE_ERROR, "%25s:%-5d invalid stimulus buffer format %li", buf, 0x1Cu);
            }
            generateAudioSelfTestError(-6);
            id v106 = (AVAudioPCMBuffer *)objc_claimAutoreleasedReturnValue();
            v203[2](v203, 0, v106);
            int v56 = 1;
          }
          else
          {
            v200 = v207;
            __int16 v107 = [(AVAudioFile *)v209 processingFormat];
            [v107 sampleRate];
            double v109 = v108;
            double v110 = [(AVAudioDeviceTestService *)v8 engine];
            __int16 v111 = [v110 inputNode];
            double v112 = [v111 inputFormatForBus:0];
            [v112 sampleRate];
            BOOL v114 = v109 != v113;

            if (v114)
            {
              v115 = [AVAudioFormat alloc];
              id v116 = [(AVAudioFile *)v209 processingFormat];
              uint64_t v117 = [v116 settings];
              v201 = [(AVAudioFormat *)v115 initWithSettings:v117];

              v118 = [(AVAudioFormat *)v201 settings];
              v204 = (void *)[v118 mutableCopy];

              v119 = NSNumber;
              v120 = [(AVAudioDeviceTestService *)v8 engine];
              v121 = [v120 inputNode];
              v122 = [v121 inputFormatForBus:0];
              [v122 sampleRate];
              v123 = objc_msgSend(v119, "numberWithDouble:");
              [v204 setObject:v123 forKeyedSubscript:@"AVSampleRateKey"];

              [v204 setObject:&unk_1EEFB5678 forKeyedSubscript:@"AVNumberOfChannelsKey"];
              v124 = [[AVAudioFormat alloc] initWithSettings:v204];
              v125 = [[AVAudioPCMBuffer alloc] initWithPCMFormat:v124 frameCapacity:[(AVAudioFile *)v209 length]];
              v126 = [[AVAudioConverter alloc] initFromFormat:v201 toFormat:v124];
              aBlock[0] = MEMORY[0x1E4F143A8];
              aBlock[1] = 3221225472;
              aBlock[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_117;
              aBlock[3] = &unk_1E5964C30;
              v230 = v200;
              v127 = _Block_copy(aBlock);
              v228 = v31;
              uint64_t v128 = [(AVAudioConverter *)v126 convertToBuffer:v125 error:&v228 withInputFromBlock:v127];
              v199 = v228;

              if (!v128)
              {
                if (AVAudioDeviceTestServiceLog(void)::once != -1) {
                  dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
                }
                v129 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
                if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
                {
                  v130 = [v199 localizedDescription];
                  v131 = generateAudioSelfTestError(-6);
                  uint64_t v132 = [v131 code];
                  *(_DWORD *)buf = 136315906;
                  *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 621;
                  *(_WORD *)&unsigned char buf[18] = 2112;
                  *(void *)&buf[20] = v130;
                  *(_WORD *)&buf[28] = 2048;
                  *(void *)&buf[30] = v132;
                  _os_log_impl(&dword_19D794000, v129, OS_LOG_TYPE_ERROR, "%25s:%-5d error converting stimulus buffer format %@ - %li", buf, 0x26u);
                }
              }

              uint64_t v31 = v199;
              v133 = v125;
            }
            else
            {
              v133 = 0;
            }
            v134 = v133;
            if (!v133) {
              v133 = v200;
            }
            v205 = v133;

            uint64_t v224 = 0;
            v225 = &v224;
            uint64_t v226 = 0x2020000000;
            unsigned int v227 = 0;
            unsigned int v135 = [(AVAudioPCMBuffer *)v205 frameLength];
            [v14 outputSampleRate];
            double v137 = v136;
            v138 = [(AVAudioBuffer *)v205 format];
            [v138 sampleRate];
            double v140 = v139;
            [v14 outputLatency];
            double v142 = v141;
            [v14 outputSampleRate];
            double v144 = v143;
            [v14 outputSampleRate];
            double v146 = v145;

            unsigned int v227 = ((double)(v137 / v140 * (double)v135) + v142 * v144 + v146 * 0.5);
            v147 = [(AVAudioDeviceTestService *)v8 engine];
            v148 = [v147 inputNode];
            v202 = [v148 inputFormatForBus:0];

            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            *(void *)&buf[24] = __Block_byref_object_copy__3466;
            *(void *)&buf[32] = __Block_byref_object_dispose__3467;
            v149 = [AVAudioPCMBuffer alloc];
            v245 = [(AVAudioPCMBuffer *)v149 initWithPCMFormat:v202 frameCapacity:*((unsigned int *)v225 + 6)];
            [*(id *)(*(void *)&buf[8] + 40) setFrameLength:0];
            v150 = [(AVAudioDeviceTestService *)v8 inputFilter];
            if (v150)
            {
              v151 = [(AVAudioDeviceTestService *)v8 inputFilter];
              v152 = v151;
            }
            else
            {
              v152 = [(AVAudioDeviceTestService *)v8 engine];
              v151 = [v152 inputNode];
            }
            [(AVAudioDeviceTestService *)v8 setNodeToCaptureData:v151];
            if (!v150) {

            }
            if (AVAudioDeviceTestServiceLog(void)::once != -1) {
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
            }
            v153 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
            if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
            {
              int v154 = *((_DWORD *)v225 + 6);
              *(_DWORD *)v243 = 136315650;
              *(void *)&v243[4] = "AVAudioDeviceTestService.mm";
              *(_WORD *)&v243[12] = 1024;
              *(_DWORD *)&v243[14] = 639;
              *(_WORD *)&v243[18] = 1024;
              *(_DWORD *)&v243[20] = v154;
              _os_log_impl(&dword_19D794000, v153, OS_LOG_TYPE_DEFAULT, "%25s:%-5d test length %i frames", v243, 0x18u);
            }

            v155 = [(AVAudioDeviceTestService *)v8 nodeToCaptureData];
            v219[0] = MEMORY[0x1E4F143A8];
            v219[1] = 3221225472;
            v219[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_119;
            v219[3] = &unk_1E5964C58;
            v222 = buf;
            v156 = v203;
            id v221 = v156;
            v223 = &v224;
            v157 = v208;
            v220 = v157;
            [v155 installTapOnBus:0 bufferSize:4096 format:v202 block:v219];

            if (AVAudioDeviceTestServiceLog(void)::once != -1) {
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
            }
            v158 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
            if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v243 = 136315394;
              *(void *)&v243[4] = "AVAudioDeviceTestService.mm";
              *(_WORD *)&v243[12] = 1024;
              *(_DWORD *)&v243[14] = 711;
              _os_log_impl(&dword_19D794000, v158, OS_LOG_TYPE_DEFAULT, "%25s:%-5d scheduling stimulus file", v243, 0x12u);
            }

            v159 = [(AVAudioDeviceTestService *)v8 player];
            [v159 scheduleBuffer:v205 atTime:0 options:2 completionHandler:&__block_literal_global_123];

            uint64_t v160 = [(AVAudioDeviceTestService *)v8 engine];
            [(id)v160 prepare];

            v161 = [(AVAudioDeviceTestService *)v8 engine];
            v218 = v31;
            LOBYTE(v160) = [v161 startAndReturnError:&v218];
            v162 = v218;

            v163 = v162;
            if ((v160 & 1) == 0)
            {
              if (AVAudioDeviceTestServiceLog(void)::once != -1) {
                dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
              }
              v194 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
              if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
              {
                v195 = [v162 localizedDescription];
                v196 = generateAudioSelfTestError(-10);
                uint64_t v197 = [v196 code];
                *(_DWORD *)v243 = 136315906;
                *(void *)&v243[4] = "AVAudioDeviceTestService.mm";
                *(_WORD *)&v243[12] = 1024;
                *(_DWORD *)&v243[14] = 724;
                *(_WORD *)&v243[18] = 2112;
                *(void *)&v243[20] = v195;
                *(_WORD *)&v243[28] = 2048;
                *(void *)&v243[30] = v197;
                _os_log_impl(&dword_19D794000, v194, OS_LOG_TYPE_ERROR, "%25s:%-5d startAndReturnError (%@) with test error (%li)", v243, 0x26u);
              }
              v198 = generateAudioSelfTestError(-10);
              v156[2](v156, 0, v198);

              exit(-1);
            }
            if (AVAudioDeviceTestServiceLog(void)::once != -1) {
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
            }
            v164 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
            if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
            {
              v165 = [(AVAudioDeviceTestService *)v8 engine];
              *(_DWORD *)v243 = 136315650;
              *(void *)&v243[4] = "AVAudioDeviceTestService.mm";
              *(_WORD *)&v243[12] = 1024;
              *(_DWORD *)&v243[14] = 729;
              *(_WORD *)&v243[18] = 2112;
              *(void *)&v243[20] = v165;
              _os_log_impl(&dword_19D794000, v164, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@", v243, 0x1Cu);
            }
            v166 = [(AVAudioDeviceTestService *)v8 player];
            [v166 play];

            if (AVAudioDeviceTestServiceLog(void)::once != -1) {
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
            }
            v167 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
            if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v243 = 136315394;
              *(void *)&v243[4] = "AVAudioDeviceTestService.mm";
              *(_WORD *)&v243[12] = 1024;
              *(_DWORD *)&v243[14] = 733;
              _os_log_impl(&dword_19D794000, v167, OS_LOG_TYPE_DEFAULT, "%25s:%-5d waiting for sequence to finish", v243, 0x12u);
            }

            dispatch_semaphore_wait(v157, 0xFFFFFFFFFFFFFFFFLL);
            if (AVAudioDeviceTestServiceLog(void)::once != -1) {
              dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
            }
            v168 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
            if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v243 = 136315394;
              *(void *)&v243[4] = "AVAudioDeviceTestService.mm";
              *(_WORD *)&v243[12] = 1024;
              *(_DWORD *)&v243[14] = 737;
              _os_log_impl(&dword_19D794000, v168, OS_LOG_TYPE_DEFAULT, "%25s:%-5d sequence finished", v243, 0x12u);
            }

            v169 = [(AVAudioDeviceTestService *)v8 nodeToCaptureData];
            [v169 removeTapOnBus:0];

            v170 = [(AVAudioDeviceTestService *)v8 engine];
            int v171 = [v170 isRunning];

            if (v171)
            {
              v172 = [(AVAudioDeviceTestService *)v8 player];
              [v172 stop];

              v173 = [(AVAudioDeviceTestService *)v8 engine];
              [v173 stop];
            }
            v217 = v163;
            char v174 = [v14 setActive:0 error:&v217];
            v175 = (__objc2_meth_list **)v217;

            uint64_t v31 = v175;
            if ((v174 & 1) == 0)
            {
              if (AVAudioDeviceTestServiceLog(void)::once != -1) {
                dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
              }
              v176 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
              if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
              {
                uint64_t v177 = [v175 code];
                v178 = generateAudioSelfTestError(-11);
                uint64_t v179 = [v178 code];
                *(_DWORD *)v243 = 136315906;
                *(void *)&v243[4] = "AVAudioDeviceTestService.mm";
                *(_WORD *)&v243[12] = 1024;
                *(_DWORD *)&v243[14] = 751;
                *(_WORD *)&v243[18] = 2048;
                *(void *)&v243[20] = v177;
                *(_WORD *)&v243[28] = 2048;
                *(void *)&v243[30] = v179;
                _os_log_impl(&dword_19D794000, v176, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive (%li) with test error (%li)", v243, 0x26u);
              }
            }
            [(AVAudioDeviceTestService *)v8 cleanUpObservers];
            v211[0] = MEMORY[0x1E4F143A8];
            v211[1] = 3221225472;
            v211[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_124;
            v211[3] = &unk_1E5964CA8;
            v216 = buf;
            id v180 = v6;
            id v212 = v180;
            v213 = v8;
            id v106 = v205;
            v214 = v106;
            v215 = v156;
            v181 = (void (**)(void))_Block_copy(v211);
            if ([v180 processSequenceAsynchronously])
            {
              v182 = dispatch_get_global_queue(2, 0);
              dispatch_async(v182, v181);
            }
            else
            {
              v181[2](v181);
            }

            _Block_object_dispose(buf, 8);
            _Block_object_dispose(&v224, 8);

            int v56 = 0;
          }

          goto LABEL_160;
        }
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        v90 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          [v6 volume];
          float v92 = v91;
          id v93 = [v14 category];
          id v94 = generateAudioSelfTestError(-7);
          v95 = (AVAudioPCMBuffer *)[v94 code];
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 538;
          *(_WORD *)&unsigned char buf[18] = 2048;
          *(double *)&buf[20] = v92;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v93;
          *(_WORD *)&buf[38] = 2048;
          v245 = v95;
          _os_log_impl(&dword_19D794000, v90, OS_LOG_TYPE_ERROR, "%25s:%-5d unable to set volume %.2f for category %@ - (%li)", buf, 0x30u);
        }
        id v96 = generateAudioSelfTestError(-7);
        v210[2](v210, 0, v96);
      }
      int v56 = 1;
      uint64_t v31 = v33;
LABEL_160:
      id v55 = v208;
      goto LABEL_161;
    }
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    os_signpost_id_t v50 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      uint64_t v51 = [v30 code];
      double v52 = generateAudioSelfTestError(-11);
      uint64_t v53 = [v52 code];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 488;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v51;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v53;
      _os_log_impl(&dword_19D794000, v50, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive (%li) with test error (%li)", buf, 0x26u);
    }
    if ([v30 code] == 561145203)
    {
      [(AVAudioDeviceTestService *)v8 setTestServiceSupportedOnHardware:0];
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      char v54 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 492;
        _os_log_impl(&dword_19D794000, v54, OS_LOG_TYPE_ERROR, "%25s:%-5d running test on platform with inadequate hardware", buf, 0x12u);
      }
      id v55 = generateAudioSelfTestError(-8);
      v210[2](v210, 0, v55);
    }
    else
    {
      id v55 = generateAudioSelfTestError(-11);
      v210[2](v210, 0, v55);
    }
    int v56 = 1;
LABEL_161:

    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    v183 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 844;
      _os_log_impl(&dword_19D794000, v183, OS_LOG_TYPE_DEFAULT, "%25s:%-5d sequence completed", buf, 0x12u);
    }

    if ((v56 | 2) != 2) {
      goto LABEL_170;
    }
    *(void *)v243 = 0;
    *(void *)&v243[8] = v243;
    *(void *)&v243[16] = 0x2020000000;
    p_opt_class_meths = &OBJC_PROTOCOL___AVAudioMixing.opt_class_meths;
    v184 = (void (*)(void))getMSNMonitorEndExceptionSymbolLoc(void)::ptr;
    *(void *)&v243[24] = getMSNMonitorEndExceptionSymbolLoc(void)::ptr;
    if (!getMSNMonitorEndExceptionSymbolLoc(void)::ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___ZL34getMSNMonitorEndExceptionSymbolLocv_block_invoke;
      *(void *)&buf[24] = &unk_1E5965E38;
      *(void *)&buf[32] = v243;
      v185 = MediaSafetyNetLibrary();
      v186 = dlsym(v185, "MSNMonitorEndException");
      *(void *)(*(void *)(*(void *)&buf[32] + 8) + 24) = v186;
      getMSNMonitorEndExceptionSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)&buf[32] + 8) + 24);
      v184 = *(void (**)(void))(*(void *)&v243[8] + 24);
    }
    _Block_object_dispose(v243, 8);
    if (v184) {
      break;
    }
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v188 = [NSString stringWithUTF8String:"void MSNMonitorEndException_soft(const char *)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v188, @"AVAudioDeviceTestService.mm", 48, @"%s", dlerror());

LABEL_173:
    __break(1u);
LABEL_174:
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  v184("audiotesting");
LABEL_170:
  objc_sync_exit(v8);
}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4E9C8]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  float v7 = [*(id *)(a1 + 32) stringForRouteChangeReason:v6];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  float v8 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    vDSP_Length v10 = "AVAudioDeviceTestService.mm";
    __int16 v11 = 1024;
    int v12 = 553;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d route change (%@)", (uint8_t *)&v9, 0x1Cu);
  }
}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_110(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  uint64_t v4 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 object];
    uint64_t v6 = generateAudioSelfTestError(-3);
    int v9 = 136315906;
    vDSP_Length v10 = "AVAudioDeviceTestService.mm";
    __int16 v11 = 1024;
    int v12 = 561;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = [v6 code];
    _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d interruption (%@) with test error (%li)", (uint8_t *)&v9, 0x26u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  float v8 = generateAudioSelfTestError(-3);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);

  exit(-3);
}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_111(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  uint64_t v4 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 object];
    uint64_t v6 = generateAudioSelfTestError(-4);
    int v9 = 136315906;
    vDSP_Length v10 = "AVAudioDeviceTestService.mm";
    __int16 v11 = 1024;
    int v12 = 571;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = [v6 code];
    _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mediaserverd died (%@) with test error (%li)", (uint8_t *)&v9, 0x26u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  float v8 = generateAudioSelfTestError(-4);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);

  exit(-4);
}

id __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_117(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 0;
  return *(id *)(a1 + 32);
}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  uint64_t v7 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    float v8 = [v5 averagePowerPerChannel];
    int v14 = 136315650;
    __int16 v15 = "AVAudioDeviceTestService.mm";
    __int16 v16 = 1024;
    int v17 = 655;
    __int16 v18 = 2112;
    uint64_t v19 = (uint64_t)v8;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d collecting input tap data %@", (uint8_t *)&v14, 0x1Cu);
  }
  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendDataFromBuffer:v5] & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    int v9 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      vDSP_Length v10 = generateAudioSelfTestError(-10);
      uint64_t v11 = [v10 code];
      int v14 = 136315650;
      __int16 v15 = "AVAudioDeviceTestService.mm";
      __int16 v16 = 1024;
      int v17 = 658;
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to read in from buffer - test error %li", (uint8_t *)&v14, 0x1Cu);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    __int16 v13 = generateAudioSelfTestError(-10);
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) frameLength] >= *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_124(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  uint64_t v2 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 771;
    _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d processing xcorr", buf, 0x12u);
  }
  group = dispatch_group_create();
  id v3 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INTERACTIVE, -1);
  uint64_t v22 = dispatch_queue_create("com.apple.avfaudio.xcorr_queue", v3);

  uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) splitIntoSingleChannelBuffers];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  BOOL v39 = __Block_byref_object_copy__3466;
  BOOL v40 = __Block_byref_object_dispose__3467;
  id v41 = (id)objc_opt_new();
  obunint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [*(id *)(a1 + 32) micBufferNumbers];
  if (!v4
    || (objc_msgSend(*(id *)(a1 + 32), "micBufferNumbers", v22, group),
        id v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = [v5 count] == 0,
        v5,
        v4,
        v6))
  {
    for (unint64_t i = 0; objc_msgSend(v26, "count", v22) > i; ++i)
    {
      uint64_t v21 = [NSNumber numberWithInt:i];
      [obj addObject:v21];
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) micBufferNumbers];
    uint64_t v8 = [v7 copy];

    obunint64_t j = (id)v8;
  }
  for (unint64_t j = 0; [obj count] > j; ++j)
  {
    vDSP_Length v10 = *(void **)(*(void *)&buf[8] + 40);
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
    [v10 addObject:v11];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obja = obj;
  uint64_t v12 = [obja countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v12; ++k)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obja);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * k);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_128;
        aBlock[3] = &unk_1E5964C80;
        void aBlock[4] = v15;
        id v28 = v26;
        id v16 = *(id *)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        __int16 v18 = *(void **)(a1 + 48);
        id v29 = v16;
        uint64_t v30 = v17;
        id v31 = v18;
        char v32 = buf;
        uint64_t v19 = (void (**)(void))_Block_copy(aBlock);
        if ([*(id *)(a1 + 32) parallelCrossCorrelationCalculation]) {
          dispatch_group_async(group, v22, v19);
        }
        else {
          v19[2](v19);
        }
      }
      uint64_t v12 = [obja countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v12);
  }

  if ([*(id *)(a1 + 32) parallelCrossCorrelationCalculation]) {
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  _Block_object_dispose(buf, 8);
}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_128(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (int)[*(id *)(a1 + 32) intValue];
  id v3 = [*(id *)(a1 + 40) objectAtIndex:v2];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", *(void *)(objc_msgSend(v3, "audioBufferList") + 16), *(unsigned int *)(objc_msgSend(v3, "audioBufferList") + 12));
  if ([*(id *)(a1 + 48) calculateCrossCorrelationPeak])
  {
    [*(id *)(a1 + 56) calculateCrossCorrelationPeakRelativeToSource:*(void *)(a1 + 64) capture:v3];
    uint64_t v6 = v5;
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v7 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      int v14 = "AVAudioDeviceTestService.mm";
      __int16 v15 = 1024;
      int v16 = 802;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d db %f", (uint8_t *)&v13, 0x1Cu);
    }
  }
  uint64_t v8 = [AVAudioDeviceTestResult alloc];
  uint64_t v9 = [*(id *)(a1 + 48) outputID];
  vDSP_Length v10 = [v3 format];
  [v10 sampleRate];
  uint64_t v11 = -[AVAudioDeviceTestResult initWithData:inputID:outputID:sampleRate:correlationValue:](v8, "initWithData:inputID:outputID:sampleRate:correlationValue:", v4, v2, v9);

  id v12 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  objc_sync_enter(v12);
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v11 atIndexedSubscript:v2];
  objc_sync_exit(v12);
}

void __57__AVAudioDeviceTestService_startWithSequence_completion___block_invoke_121()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  v0 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315394;
    uint64_t v2 = "AVAudioDeviceTestService.mm";
    __int16 v3 = 1024;
    int v4 = 715;
    _os_log_impl(&dword_19D794000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d player finished", (uint8_t *)&v1, 0x12u);
  }
}

- (BOOL)isOutputRouteBluetooth:(id)a3 session:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  uint64_t v6 = [v4 category];
  uint64_t v7 = [v5 routeForCategory:v6];
  char v8 = [v7 isEqualToString:@"HeadphonesBT"];

  return v8;
}

- (void)passExtensionToken:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (!v4)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v6 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "AVAudioDeviceTestService.mm";
      __int16 v12 = 1024;
      int v13 = 436;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d extension token is null", buf, 0x12u);
    }
LABEL_15:
    exit(-9);
  }
  id v9 = v4;
  [v9 UTF8String];
  [(AVAudioDeviceTestService *)v5 setExtensionHandle:sandbox_extension_consume()];
  if ([(AVAudioDeviceTestService *)v5 extensionHandle] < 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v7 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = *__error();
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "AVAudioDeviceTestService.mm";
      __int16 v12 = 1024;
      int v13 = 430;
      __int16 v14 = 1024;
      int v15 = v8;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to consume extension: %i", buf, 0x18u);
    }

    goto LABEL_15;
  }
  objc_sync_exit(v5);
}

- (void)configureDataSources:(id)a3 session:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v46 = a4;
  [v46 availableInputs];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v51;
    uint64_t v9 = *MEMORY[0x1E4F4E950];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        __int16 v12 = [v11 portType];
        int v13 = [v12 isEqualToString:v9];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v60 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  unint64_t v15 = 0;
  for (unint64_t j = 0; ; unint64_t j = v21)
  {
    __int16 v17 = [v14 dataSources];
    BOOL v18 = [v17 count] > v15;

    if (!v18) {
      break;
    }
    uint64_t v19 = [v14 dataSources];
    uint64_t v20 = [v19 objectAtIndexedSubscript:v15];

    id v21 = v20;
    uint64_t v22 = [v5 microphone];
    if (v22)
    {
    }
    else
    {
      char v23 = [v21 dataSourceID];
      BOOL v24 = [v23 intValue] == 1634495520;

      if (v24) {
        goto LABEL_26;
      }
    }
    __int16 v25 = [v5 microphone];
    BOOL v26 = v25 == 0;

    if (!v26)
    {
      switch((int)v15)
      {
        case 0:
          uint64_t v27 = [v5 microphone];
          char v28 = [v27 isEqualToString:@"LeftBottom"];
          break;
        case 1:
          uint64_t v27 = [v5 microphone];
          char v28 = [v27 isEqualToString:@"Front"];
          break;
        case 2:
          uint64_t v27 = [v5 microphone];
          char v28 = [v27 isEqualToString:@"Back"];
          break;
        case 3:
          id v29 = [v5 microphone];
          char v30 = [v29 isEqualToString:@"RightBottom"];

          if ((v30 & 1) == 0) {
            goto LABEL_24;
          }
          goto LABEL_26;
        default:
          goto LABEL_24;
      }
      if (v28)
      {

LABEL_26:
        unint64_t j = v21;
        break;
      }
    }
LABEL_24:

    ++v15;
  }
  id v49 = 0;
  char v31 = [v14 setPreferredDataSource:j error:&v49];
  id v32 = v49;
  if (v31)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    long long v33 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v55 = "AVAudioDeviceTestService.mm";
      __int16 v56 = 1024;
      int v57 = 404;
      __int16 v58 = 2112;
      uint64_t v59 = (uint64_t)j;
      _os_log_impl(&dword_19D794000, v33, OS_LOG_TYPE_DEFAULT, "%25s:%-5d using data source %@", buf, 0x1Cu);
    }
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    long long v34 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = [v32 code];
      *(_DWORD *)buf = 136315650;
      id v55 = "AVAudioDeviceTestService.mm";
      __int16 v56 = 1024;
      int v57 = 402;
      __int16 v58 = 2048;
      uint64_t v59 = v35;
      _os_log_impl(&dword_19D794000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d setPreferredDataSource %li", buf, 0x1Cu);
    }
  }
  id v48 = v32;
  char v36 = [v46 setPreferredInput:v14 error:&v48];
  id v37 = v48;

  if (v36)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    char v38 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v55 = "AVAudioDeviceTestService.mm";
      __int16 v56 = 1024;
      int v57 = 411;
      __int16 v58 = 2112;
      uint64_t v59 = (uint64_t)v14;
      _os_log_impl(&dword_19D794000, v38, OS_LOG_TYPE_DEFAULT, "%25s:%-5d using port %@", buf, 0x1Cu);
    }
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    BOOL v39 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = [v37 code];
      *(_DWORD *)buf = 136315650;
      id v55 = "AVAudioDeviceTestService.mm";
      __int16 v56 = 1024;
      int v57 = 409;
      __int16 v58 = 2048;
      uint64_t v59 = v40;
      _os_log_impl(&dword_19D794000, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d setPreferredInput %li", buf, 0x1Cu);
    }
  }
  if ([v5 outputMode] == 1) {
    uint64_t v41 = 1936747378;
  }
  else {
    uint64_t v41 = 0;
  }
  id v47 = v37;
  char v42 = [v46 overrideOutputAudioPort:v41 error:&v47];
  id v43 = v47;

  if ((v42 & 1) == 0)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    id v44 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      uint64_t v45 = [v43 code];
      *(_DWORD *)buf = 136315650;
      id v55 = "AVAudioDeviceTestService.mm";
      __int16 v56 = 1024;
      int v57 = 417;
      __int16 v58 = 2048;
      uint64_t v59 = v45;
      _os_log_impl(&dword_19D794000, v44, OS_LOG_TYPE_ERROR, "%25s:%-5d overrideOutputAudioPort %li", buf, 0x1Cu);
    }
  }
}

- (BOOL)setVolume:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  id v4 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [v3 volume];
    int v9 = 136315650;
    vDSP_Length v10 = "AVAudioDeviceTestService.mm";
    __int16 v11 = 1024;
    int v12 = 353;
    __int16 v13 = 2048;
    double v14 = v5;
    _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting volume to %.2f", (uint8_t *)&v9, 0x1Cu);
  }

  id v6 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  [v3 volume];
  char v7 = objc_msgSend(v6, "setActiveCategoryVolumeTo:");

  return v7;
}

- (BOOL)setVolume:(id)a3 session:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 outputMode])
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    char v7 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      [v5 volume];
      float v9 = v8;
      vDSP_Length v10 = [v6 category];
      int v19 = 136316162;
      uint64_t v20 = "AVAudioDeviceTestService.mm";
      __int16 v21 = 1024;
      int v22 = 346;
      __int16 v23 = 2048;
      double v24 = v9;
      __int16 v25 = 2112;
      BOOL v26 = v10;
      __int16 v27 = 2112;
      char v28 = @"Audio/Video";
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting volume %.2f for AS category %@, AVS category %@", (uint8_t *)&v19, 0x30u);
    }
    __int16 v11 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
    [v5 volume];
    char v12 = objc_msgSend(v11, "setVolumeTo:forCategory:", @"Audio/Video");
  }
  else
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    __int16 v13 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      [v5 volume];
      float v15 = v14;
      uint64_t v16 = [v6 category];
      int v19 = 136316162;
      uint64_t v20 = "AVAudioDeviceTestService.mm";
      __int16 v21 = 1024;
      int v22 = 342;
      __int16 v23 = 2048;
      double v24 = v15;
      __int16 v25 = 2112;
      BOOL v26 = v16;
      __int16 v27 = 2112;
      char v28 = @"PlayAndRecord";
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting volume %.2f for AS category %@, AVS category %@", (uint8_t *)&v19, 0x30u);
    }
    __int16 v11 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
    [v5 volume];
    char v12 = objc_msgSend(v11, "setVolumeTo:forCategory:", @"PlayAndRecord");
  }
  BOOL v17 = v12;

  return v17;
}

- (void)createAudioEngineAndProcessingChain:(id)a3 session:(id)a4 sourceNodeBlock:(id)a5
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v127 = a3;
  id v128 = a4;
  id v126 = a5;
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  float v8 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v137 = "AVAudioDeviceTestService.mm";
    __int16 v138 = 1024;
    int v139 = 184;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Creating audio engine and processing chain", buf, 0x12u);
  }

  float v9 = objc_opt_new();
  [(AVAudioDeviceTestService *)self setEngine:v9];

  if (v126)
  {
    vDSP_Length v10 = [[AVAudioSourceNode alloc] initWithRenderBlock:v126];
    [(AVAudioDeviceTestService *)self setSourceNode:v10];
  }
  __int16 v11 = [(AVAudioDeviceTestService *)self sourceNode];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    __int16 v13 = objc_opt_new();
    [(AVAudioDeviceTestService *)self setPlayer:v13];
  }
  if (!v128
    || ([MEMORY[0x1E4F4E9F8] sharedInstance],
        id v14 = (id)objc_claimAutoreleasedReturnValue(),
        BOOL v15 = v14 == v128,
        v14,
        v15))
  {
    id v22 = 0;
  }
  else
  {
    int inData = [v128 opaqueSessionID];
    uint64_t v16 = [(AVAudioDeviceTestService *)self engine];
    BOOL v17 = [v16 outputNode];
    BOOL v18 = AudioUnitSetProperty((AudioUnit)[v17 audioUnit], 0x7E7u, 0, 0, &inData, 4u) == 0;

    if (!v18)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      int v19 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 210;
        _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Unable to set session on engine", buf, 0x12u);
      }
    }
    uint64_t v20 = [MEMORY[0x1E4F4E9F8] sharedInstance];
    id v134 = 0;
    char v21 = [v20 setActive:0 error:&v134];
    id v22 = v134;

    if ((v21 & 1) == 0)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      __int16 v23 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v22 code];
        *(_DWORD *)buf = 136315650;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 215;
        __int16 v140 = 2048;
        uint64_t v141 = v24;
        _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d sharedInstance setActive %li", buf, 0x1Cu);
      }
    }
  }
  __int16 v25 = [v127 inputProcessingChain];
  BOOL v26 = v25 == 0;

  if (!v26)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    __int16 v27 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      double v137 = "AVAudioDeviceTestService.mm";
      __int16 v138 = 1024;
      int v139 = 220;
      _os_log_impl(&dword_19D794000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting input processing chain", buf, 0x12u);
    }

    char v28 = [[AVAudioUnitEQ alloc] initWithNumberOfBands:1];
    [(AVAudioDeviceTestService *)self setInputFilter:v28];

    uint64_t v29 = [(AVAudioDeviceTestService *)self inputFilter];
    char v30 = [v29 bands];
    char v31 = [v30 objectAtIndexedSubscript:0];
    [v31 setFilterType:5];

    id v32 = [(AVAudioDeviceTestService *)self inputFilter];
    long long v33 = [v32 bands];
    long long v34 = [v33 objectAtIndexedSubscript:0];
    [v34 setBypass:0];

    uint64_t v35 = [(AVAudioDeviceTestService *)self inputFilter];
    char v36 = [v35 bands];
    id v37 = [v36 objectAtIndexedSubscript:0];
    LODWORD(v38) = 1157234688;
    [v37 setFrequency:v38];

    BOOL v39 = [(AVAudioDeviceTestService *)self inputFilter];
    uint64_t v40 = [v39 bands];
    uint64_t v41 = [v40 objectAtIndexedSubscript:0];
    LODWORD(v42) = 4.0;
    [v41 setBandwidth:v42];
  }
  id v43 = [v127 outputProcessingChain];
  BOOL v44 = v43 == 0;

  if (!v44)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    uint64_t v45 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      double v137 = "AVAudioDeviceTestService.mm";
      __int16 v138 = 1024;
      int v139 = 238;
      _os_log_impl(&dword_19D794000, v45, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting output processing chain", buf, 0x12u);
    }

    id v46 = [[AVAudioUnitEQ alloc] initWithNumberOfBands:1];
    [(AVAudioDeviceTestService *)self setOutputFilter:v46];

    id v47 = [(AVAudioDeviceTestService *)self outputFilter];
    id v48 = [v47 bands];
    id v49 = [v48 objectAtIndexedSubscript:0];
    [v49 setFilterType:5];

    long long v50 = [(AVAudioDeviceTestService *)self outputFilter];
    long long v51 = [v50 bands];
    long long v52 = [v51 objectAtIndexedSubscript:0];
    [v52 setBypass:0];

    long long v53 = [(AVAudioDeviceTestService *)self outputFilter];
    char v54 = [v53 bands];
    id v55 = [v54 objectAtIndexedSubscript:0];
    LODWORD(v56) = 1157234688;
    [v55 setFrequency:v56];

    int v57 = [(AVAudioDeviceTestService *)self outputFilter];
    __int16 v58 = [v57 bands];
    uint64_t v59 = [v58 objectAtIndexedSubscript:0];
    LODWORD(v60) = 4.0;
    [v59 setBandwidth:v60];
  }
  dispatch_semaphore_t v61 = dispatch_semaphore_create(0);
  int v133 = 0;
  long long v132 = *(_OWORD *)"xmuaxmcmlppa";
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __88__AVAudioDeviceTestService_createAudioEngineAndProcessingChain_session_sourceNodeBlock___block_invoke;
  v129[3] = &unk_1E5964BB8;
  BOOL v62 = v61;
  v130 = v62;
  v131 = self;
  +[AVAudioUnit instantiateWithComponentDescription:&v132 options:0 completionHandler:v129];
  if (dispatch_semaphore_wait(v62, 0x3B9ACA00uLL))
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    id v63 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v137 = "AVAudioDeviceTestService.mm";
      __int16 v138 = 1024;
      int v139 = 270;
      id v64 = "%25s:%-5d Creating multichannel mixer took too long";
LABEL_41:
      _os_log_impl(&dword_19D794000, v63, OS_LOG_TYPE_ERROR, v64, buf, 0x12u);
      goto LABEL_117;
    }
    goto LABEL_117;
  }
  id v65 = [(AVAudioDeviceTestService *)self multichannelMixer];
  BOOL v66 = v65 == 0;

  if (!v66)
  {
    v67 = [(AVAudioDeviceTestService *)self sourceNode];
    BOOL v68 = v67 == 0;

    if (v68)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      uint64_t v72 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 284;
        _os_log_impl(&dword_19D794000, v72, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attaching player to engine", buf, 0x12u);
      }

      int v70 = [(AVAudioDeviceTestService *)self engine];
      uint64_t v71 = [(AVAudioDeviceTestService *)self player];
      [v70 attachNode:v71];
    }
    else
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      BOOL v69 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 281;
        _os_log_impl(&dword_19D794000, v69, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attaching sourceNode to engine", buf, 0x12u);
      }

      int v70 = [(AVAudioDeviceTestService *)self engine];
      uint64_t v71 = [(AVAudioDeviceTestService *)self sourceNode];
      [v70 attachNode:v71];
    }

    uint64_t v73 = [(AVAudioDeviceTestService *)self inputFilter];
    BOOL v74 = v73 == 0;

    if (!v74)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      uint64_t v75 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 289;
        _os_log_impl(&dword_19D794000, v75, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attaching inputFilter to engine", buf, 0x12u);
      }

      double v76 = [(AVAudioDeviceTestService *)self engine];
      dispatch_time_t v77 = [(AVAudioDeviceTestService *)self inputFilter];
      [v76 attachNode:v77];
    }
    v78 = [(AVAudioDeviceTestService *)self outputFilter];
    BOOL v79 = v78 == 0;

    if (!v79)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      uint64_t v80 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 294;
        _os_log_impl(&dword_19D794000, v80, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attaching outputFilter to engine", buf, 0x12u);
      }

      v81 = [(AVAudioDeviceTestService *)self engine];
      double v82 = [(AVAudioDeviceTestService *)self outputFilter];
      [v81 attachNode:v82];
    }
    double v83 = [(AVAudioDeviceTestService *)self engine];
    uint64_t v84 = [v83 outputNode];
    v85 = [v84 outputFormatForBus:0];
    [v85 sampleRate];
    double v87 = v86;

    if (v87 <= 0.0)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      int8x16_t v88 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 300;
        _os_log_impl(&dword_19D794000, v88, OS_LOG_TYPE_ERROR, "%25s:%-5d sampleRate for engine outputNode was <= 0. Setting to 44100", buf, 0x12u);
      }

      double v87 = 44100.0;
    }
    v124 = [[AVAudioFormat alloc] initStandardFormatWithSampleRate:1 channels:v87];
    if (!v124)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      id v89 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 306;
        _os_log_impl(&dword_19D794000, v89, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create internal format from engine output node", buf, 0x12u);
      }
    }
    v90 = [(AVAudioDeviceTestService *)self inputFilter];
    BOOL v91 = v90 == 0;

    if (!v91)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      float v92 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 311;
        _os_log_impl(&dword_19D794000, v92, OS_LOG_TYPE_DEFAULT, "%25s:%-5d connecting inputFilter to inputNode", buf, 0x12u);
      }

      id v93 = [(AVAudioDeviceTestService *)self engine];
      id v94 = [(AVAudioDeviceTestService *)self engine];
      v95 = [v94 inputNode];
      id v96 = [(AVAudioDeviceTestService *)self inputFilter];
      [v93 connect:v95 to:v96 format:0];
    }
    id v97 = [(AVAudioDeviceTestService *)self sourceNode];
    BOOL v98 = v97 == 0;

    if (!v98)
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      id v99 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 316;
        _os_log_impl(&dword_19D794000, v99, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Connecting sourceNode to channel mixer", buf, 0x12u);
      }

      v100 = [(AVAudioDeviceTestService *)self engine];
      id v101 = [(AVAudioDeviceTestService *)self sourceNode];
      BOOL v102 = [(AVAudioDeviceTestService *)self multichannelMixer];
      [v100 connect:v101 to:v102 format:v125];
    }
    id v103 = [(AVAudioDeviceTestService *)self engine];
    id v104 = [(AVAudioDeviceTestService *)self multichannelMixer];
    uint64_t v105 = [(AVAudioDeviceTestService *)self engine];
    id v106 = [v105 outputNode];
    __int16 v107 = [(AVAudioDeviceTestService *)self engine];
    uint64_t v108 = [v107 outputNode];
    double v109 = [(id)v108 outputFormatForBus:0];
    [v103 connect:v104 to:v106 format:v109];

    double v110 = [(AVAudioDeviceTestService *)self outputFilter];
    LOBYTE(v108) = v110 == 0;

    if (v108)
    {
      v120 = [(AVAudioDeviceTestService *)self sourceNode];
      BOOL v121 = v120 == 0;

      if (!v121)
      {
LABEL_112:
        if (AVAudioDeviceTestServiceLog(void)::once != -1) {
          dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
        }
        v123 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
        if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          double v137 = "AVAudioDeviceTestService.mm";
          __int16 v138 = 1024;
          int v139 = 336;
          _os_log_impl(&dword_19D794000, v123, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Finished creating audio engine and processing chain", buf, 0x12u);
        }

        goto LABEL_117;
      }
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      v122 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 333;
        _os_log_impl(&dword_19D794000, v122, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Connecting player to channel mixer", buf, 0x12u);
      }

      uint64_t v117 = [(AVAudioDeviceTestService *)self engine];
      v118 = [(AVAudioDeviceTestService *)self player];
      v119 = [(AVAudioDeviceTestService *)self multichannelMixer];
      [v117 connect:v118 to:v119 format:v125];
    }
    else
    {
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      __int16 v111 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 325;
        _os_log_impl(&dword_19D794000, v111, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Connecting outputFilter to channel mixer", buf, 0x12u);
      }

      double v112 = [(AVAudioDeviceTestService *)self engine];
      uint64_t v113 = [(AVAudioDeviceTestService *)self outputFilter];
      BOOL v114 = [(AVAudioDeviceTestService *)self multichannelMixer];
      [v112 connect:v113 to:v114 format:v125];

      v115 = [(AVAudioDeviceTestService *)self player];
      LOBYTE(v113) = v115 == 0;

      if (v113) {
        goto LABEL_112;
      }
      if (AVAudioDeviceTestServiceLog(void)::once != -1) {
        dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
      }
      id v116 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        double v137 = "AVAudioDeviceTestService.mm";
        __int16 v138 = 1024;
        int v139 = 329;
        _os_log_impl(&dword_19D794000, v116, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Connecting player to output filter", buf, 0x12u);
      }

      uint64_t v117 = [(AVAudioDeviceTestService *)self engine];
      v118 = [(AVAudioDeviceTestService *)self player];
      v119 = [(AVAudioDeviceTestService *)self outputFilter];
      [v117 connect:v118 to:v119 format:v125];
    }

    goto LABEL_112;
  }
  if (AVAudioDeviceTestServiceLog(void)::once != -1) {
    dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
  }
  id v63 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    double v137 = "AVAudioDeviceTestService.mm";
    __int16 v138 = 1024;
    int v139 = 274;
    id v64 = "%25s:%-5d Failed to create multichannel mixer";
    goto LABEL_41;
  }
LABEL_117:
}

void __88__AVAudioDeviceTestService_createAudioEngineAndProcessingChain_session_sourceNodeBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (AVAudioDeviceTestServiceLog(void)::once != -1) {
      dispatch_once(&AVAudioDeviceTestServiceLog(void)::once, &__block_literal_global_3382);
    }
    char v7 = *(id *)AVAudioDeviceTestServiceLog(void)::category;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      float v8 = [v6 localizedDescription];
      int v11 = 136315650;
      BOOL v12 = "AVAudioDeviceTestService.mm";
      __int16 v13 = 1024;
      int v14 = 262;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Error instantiating AVAudioUnit: %@", (uint8_t *)&v11, 0x1Cu);
    }
  }
  else
  {
    [*(id *)(a1 + 40) setMultichannelMixer:v5];
    float v9 = [*(id *)(a1 + 40) engine];
    vDSP_Length v10 = [*(id *)(a1 + 40) multichannelMixer];
    [v9 attachNode:v10];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (AVAudioDeviceTestService)init
{
  v8.receiver = self;
  v8.super_class = (Class)AVAudioDeviceTestService;
  uint64_t v2 = [(AVAudioDeviceTestService *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    [(AVAudioDeviceTestService *)v2 setTestServiceSupportedOnHardware:1];
    [(AVAudioDeviceTestService *)v3 setExtensionHandle:0];
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.avaudiodevietestservice.tones", v4);
    [(AVAudioDeviceTestService *)v3 setToneQueue:v5];

    id v6 = (void *)os_transaction_create();
    [(AVAudioDeviceTestService *)v3 setTransaction:v6];
  }
  return v3;
}

@end