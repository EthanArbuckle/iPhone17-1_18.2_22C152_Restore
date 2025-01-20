@interface HFCameraLiveStreamController
- (BOOL)isMicrophoneEnabled;
- (BOOL)isStreamAudioEnabled;
- (BOOL)isStreamingEnabled;
- (BOOL)startStreamingAfterStop;
- (HFCameraAudioManager)audioManager;
- (HFCameraLiveStreamController)init;
- (HFCameraLiveStreamController)initWithHome:(id)a3 cameraProfile:(id)a4;
- (HFCameraLiveStreamControllerDelegate)delegate;
- (HMCameraProfile)cameraProfile;
- (HMCameraSource)liveCameraSource;
- (HMHome)home;
- (NSError)streamError;
- (NSString)debugDescription;
- (float)streamAudioVolume;
- (id)activeStream;
- (id)mostRecentSnapshot;
- (unint64_t)_derivedAudioStreamSetting;
- (unint64_t)inferredStreamState;
- (unint64_t)streamState;
- (void)_updateAudioManagerState;
- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3;
- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4;
- (void)cameraStreamControlDidStartStream:(id)a3;
- (void)cameraStreamControlDidUpdateManagerState:(id)a3;
- (void)cameraStreamControlDidUpdateStreamState:(id)a3;
- (void)cameraUserSettingsDidUpdate:(id)a3;
- (void)dealloc;
- (void)setAudioManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInferredStreamState:(unint64_t)a3;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setStartStreamingAfterStop:(BOOL)a3;
- (void)setStreamAudioEnabled:(BOOL)a3;
- (void)setStreamAudioVolume:(float)a3;
- (void)startStreaming;
- (void)stopStreaming;
@end

@implementation HFCameraLiveStreamController

- (HFCameraLiveStreamController)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_cameraProfile_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCameraLiveStreamController.m", 37, @"%s is unavailable; use %@ instead",
    "-[HFCameraLiveStreamController init]",
    v5);

  return 0;
}

- (HFCameraLiveStreamController)initWithHome:(id)a3 cameraProfile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HFCameraLiveStreamController;
  v9 = [(HFCameraLiveStreamController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_cameraProfile, a4);
    v11 = +[HFHomeKitDispatcher sharedDispatcher];
    [v11 addCameraObserver:v10];

    v10->_startStreamingAfterStop = 0;
    v10->_inferredStreamState = 4;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!+[HFUtilities isInternalTest])
  {
    v3 = HFLogForCategory(0x1CuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(HFCameraLiveStreamController *)self cameraProfile];
      v5 = [v4 accessory];
      v6 = [v5 name];
      *(_DWORD *)buf = 138412546;
      v9 = self;
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "%@ dealloc for name:%@. Stop streaming requested.", buf, 0x16u);
    }
    [(HFCameraLiveStreamController *)self stopStreaming];
  }
  v7.receiver = self;
  v7.super_class = (Class)HFCameraLiveStreamController;
  [(HFCameraLiveStreamController *)&v7 dealloc];
}

- (unint64_t)streamState
{
  v2 = [(HFCameraLiveStreamController *)self cameraProfile];
  v3 = [v2 streamControl];
  unint64_t v4 = [v3 streamState];

  return v4;
}

- (HMCameraSource)liveCameraSource
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(HFCameraLiveStreamController *)self streamState];
  unint64_t v4 = HFLogForCategory(0x18uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 2)
  {
    if (v5)
    {
      v6 = [(HFCameraLiveStreamController *)self cameraProfile];
      objc_super v7 = [v6 uniqueIdentifier];
      id v8 = [(HFCameraLiveStreamController *)self cameraProfile];
      v9 = [v8 accessory];
      __int16 v10 = [v9 name];
      int v18 = 138412802;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v7;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@ Displaying stream control for profile:%@/%@", (uint8_t *)&v18, 0x20u);
    }
    v11 = [(HFCameraLiveStreamController *)self activeStream];
  }
  else
  {
    if (v5)
    {
      uint64_t v12 = [(HFCameraLiveStreamController *)self cameraProfile];
      objc_super v13 = [v12 uniqueIdentifier];
      v14 = [(HFCameraLiveStreamController *)self cameraProfile];
      v15 = [v14 accessory];
      v16 = [v15 name];
      int v18 = 138412802;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v13;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@ Displaying liveCameraSource snapshot for profile:%@/%@", (uint8_t *)&v18, 0x20u);
    }
    v11 = [(HFCameraLiveStreamController *)self mostRecentSnapshot];
  }
  return (HMCameraSource *)v11;
}

- (NSError)streamError
{
  v2 = [(HFCameraLiveStreamController *)self cameraProfile];
  unint64_t v3 = objc_msgSend(v2, "hf_cameraManager");
  unint64_t v4 = [v3 cachedStreamError];

  return (NSError *)v4;
}

- (void)startStreaming
{
  if ([(HFCameraLiveStreamController *)self inferredStreamState] == 3)
  {
    [(HFCameraLiveStreamController *)self setStartStreamingAfterStop:1];
  }
  else
  {
    self->_inferredStreamState = 1;
    id v4 = [(HFCameraLiveStreamController *)self cameraProfile];
    unint64_t v3 = objc_msgSend(v4, "hf_cameraManager");
    [v3 beginContinuousStreamingWithRequester:self];
  }
}

- (void)stopStreaming
{
  if ([(HFCameraLiveStreamController *)self inferredStreamState] != 4) {
    [(HFCameraLiveStreamController *)self setInferredStreamState:3];
  }
  [(HFCameraLiveStreamController *)self setStartStreamingAfterStop:0];
  id v4 = [(HFCameraLiveStreamController *)self cameraProfile];
  unint64_t v3 = objc_msgSend(v4, "hf_cameraManager");
  [v3 endContinuousStreamingWithRequester:self];
}

- (BOOL)isStreamingEnabled
{
  v2 = [(HFCameraLiveStreamController *)self cameraProfile];
  unint64_t v3 = objc_msgSend(v2, "hf_cameraManager");
  char v4 = [v3 isContinuousStreamingEnabled];

  return v4;
}

- (void)setStreamAudioEnabled:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_streamAudioEnabled != a3)
  {
    BOOL v3 = a3;
    self->_streamAudioEnabled = a3;
    BOOL v5 = HFLogForCategory(0x1CuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      objc_super v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@ Updating stream audio state to %d", (uint8_t *)&v6, 0x12u);
    }

    [(HFCameraLiveStreamController *)self _updateAudioManagerState];
  }
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_microphoneEnabled != a3)
  {
    BOOL v3 = a3;
    self->_microphoneEnabled = a3;
    BOOL v5 = HFLogForCategory(0x1CuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      objc_super v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@ Updating microphone state to %d", (uint8_t *)&v6, 0x12u);
    }

    [(HFCameraLiveStreamController *)self _updateAudioManagerState];
  }
}

- (void)setStreamAudioVolume:(float)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_streamAudioVolume != a3)
  {
    self->_streamAudioVolume = a3;
    BOOL v5 = HFLogForCategory(0x1CuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      objc_super v7 = self;
      __int16 v8 = 2048;
      double v9 = a3;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@ Updating stream audio volume to %f", (uint8_t *)&v6, 0x16u);
    }

    [(HFCameraLiveStreamController *)self _updateAudioManagerState];
  }
}

- (id)activeStream
{
  v2 = [(HFCameraLiveStreamController *)self cameraProfile];
  BOOL v3 = [v2 streamControl];
  char v4 = [v3 cameraStream];

  return v4;
}

- (id)mostRecentSnapshot
{
  v2 = [(HFCameraLiveStreamController *)self cameraProfile];
  BOOL v3 = [v2 snapshotControl];
  char v4 = [v3 mostRecentSnapshot];

  return v4;
}

- (void)_updateAudioManagerState
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HFCameraLiveStreamController *)self activeStream];

  if (v3)
  {
    char v4 = [(HFCameraLiveStreamController *)self audioManager];

    if (!v4)
    {
      BOOL v5 = [HFCameraAudioManager alloc];
      int v6 = [(HFCameraLiveStreamController *)self cameraProfile];
      objc_super v7 = [(HFCameraLiveStreamController *)self activeStream];
      __int16 v8 = [(HFCameraLiveStreamController *)self home];
      double v9 = objc_msgSend(v8, "hf_characteristicValueManager");
      uint64_t v10 = [(HFCameraAudioManager *)v5 initWithCameraProfile:v6 cameraStream:v7 valueManager:v9];
      [(HFCameraLiveStreamController *)self setAudioManager:v10];
    }
  }
  else
  {
    [(HFCameraLiveStreamController *)self setAudioManager:0];
  }
  v11 = HFLogForCategory(0x1CuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = [(HFCameraLiveStreamController *)self audioManager];
    BOOL v13 = [(HFCameraLiveStreamController *)self isStreamAudioEnabled];
    BOOL v14 = [(HFCameraLiveStreamController *)self isMicrophoneEnabled];
    [(HFCameraLiveStreamController *)self streamAudioVolume];
    int v32 = 138413314;
    v33 = self;
    __int16 v34 = 2112;
    double v35 = v12;
    __int16 v36 = 1024;
    BOOL v37 = v13;
    __int16 v38 = 1024;
    BOOL v39 = v14;
    __int16 v40 = 2048;
    double v41 = v15;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "%@ Updating audio manager state with manager: %@, stream audio enabled: %d, microphone enabled: %d, stream audio volume: %f", (uint8_t *)&v32, 0x2Cu);
  }
  v16 = [(HFCameraLiveStreamController *)self audioManager];

  if (v16)
  {
    unint64_t v17 = [(HFCameraLiveStreamController *)self _derivedAudioStreamSetting];
    int v18 = [(HFCameraLiveStreamController *)self audioManager];
    uint64_t v19 = [v18 audioStreamSetting];

    if (v17 != v19)
    {
      __int16 v20 = [(HFCameraLiveStreamController *)self audioManager];
      id v21 = (id)objc_msgSend(v20, "updateAudioStreamSetting:", -[HFCameraLiveStreamController _derivedAudioStreamSetting](self, "_derivedAudioStreamSetting"));
    }
    [(HFCameraLiveStreamController *)self streamAudioVolume];
    float v23 = v22;
    uint64_t v24 = [(HFCameraLiveStreamController *)self audioManager];
    [v24 incomingAudioVolume];
    float v26 = v25;

    if (v23 != v26)
    {
      if (+[HFUtilities isAMac])
      {
        v27 = HFLogForCategory(0x1CuLL);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          [(HFCameraLiveStreamController *)self streamAudioVolume];
          int v32 = 138412546;
          v33 = self;
          __int16 v34 = 2048;
          double v35 = v28;
          _os_log_impl(&dword_20B986000, v27, OS_LOG_TYPE_DEFAULT, "%@ Performing volume update to %.02f on Mac", (uint8_t *)&v32, 0x16u);
        }

        v29 = [(HFCameraLiveStreamController *)self audioManager];
        [(HFCameraLiveStreamController *)self streamAudioVolume];
        id v30 = (id)objc_msgSend(v29, "setIncomingAudioVolume:");
      }
      else
      {
        v29 = [(HFCameraLiveStreamController *)self audioManager];
        [v29 incomingAudioVolume];
        self->_streamAudioVolume = v31;
      }
    }
  }
}

- (unint64_t)_derivedAudioStreamSetting
{
  if ([(HFCameraLiveStreamController *)self isMicrophoneEnabled]) {
    return 3;
  }
  if ([(HFCameraLiveStreamController *)self isStreamAudioEnabled]) {
    return 2;
  }
  return 1;
}

- (void)cameraStreamControlDidUpdateStreamState:(id)a3
{
  [(HFCameraLiveStreamController *)self _updateAudioManagerState];
  id v4 = [(HFCameraLiveStreamController *)self delegate];
  [v4 streamControllerStateDidUpdate:self];
}

- (void)cameraStreamControlDidUpdateManagerState:(id)a3
{
  id v4 = [(HFCameraLiveStreamController *)self delegate];
  [v4 streamControllerStateDidUpdate:self];
}

- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HFCameraLiveStreamController *)self liveCameraSource];
  int v6 = [v4 mostRecentSnapshot];

  if (v5 == v6)
  {
    id v7 = [(HFCameraLiveStreamController *)self delegate];
    [v7 streamControllerStateDidUpdate:self];
  }
}

- (void)cameraStreamControlDidStartStream:(id)a3
{
}

- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4
{
  -[HFCameraLiveStreamController setInferredStreamState:](self, "setInferredStreamState:", 4, a4);
  if ([(HFCameraLiveStreamController *)self startStreamingAfterStop])
  {
    [(HFCameraLiveStreamController *)self setStartStreamingAfterStop:0];
    [(HFCameraLiveStreamController *)self startStreaming];
  }
}

- (NSString)debugDescription
{
  int v18 = NSString;
  id v21 = [(HFCameraLiveStreamController *)self cameraProfile];
  unint64_t v17 = [v21 uniqueIdentifier];
  __int16 v20 = [(HFCameraLiveStreamController *)self cameraProfile];
  uint64_t v19 = [v20 accessory];
  v16 = [v19 name];
  BOOL v15 = [(HFCameraLiveStreamController *)self isStreamingEnabled];
  BOOL v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFCameraLiveStreamController streamState](self, "streamState"));
  id v4 = [(HFCameraLiveStreamController *)self streamError];
  BOOL v5 = [(HFCameraLiveStreamController *)self isMicrophoneEnabled];
  BOOL v6 = [(HFCameraLiveStreamController *)self isStreamAudioEnabled];
  BOOL v14 = [(HFCameraLiveStreamController *)self cameraProfile];
  id v7 = [v14 streamControl];
  __int16 v8 = [v7 cameraStream];
  double v9 = [(HFCameraLiveStreamController *)self cameraProfile];
  uint64_t v10 = [v9 snapshotControl];
  v11 = [v10 mostRecentSnapshot];
  double v12 = [v18 stringWithFormat:@"\n%@ - profile:%@/%@ StreamingEnabled:%d Stream State:%@ Stream Error:%@ Microphone Enabled:%d Stream Audio Enabled:%d CameraStream:%@ Snapshot:%@", self, v17, v16, v15, v3, v4, v5, v6, v8, v11];

  return (NSString *)v12;
}

- (void)cameraUserSettingsDidUpdate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = HFLogForCategory(0x1AuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_INFO, "%@ settings updated:%@", (uint8_t *)&v6, 0x16u);
  }
}

- (HFCameraLiveStreamControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFCameraLiveStreamControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (BOOL)isStreamAudioEnabled
{
  return self->_streamAudioEnabled;
}

- (float)streamAudioVolume
{
  return self->_streamAudioVolume;
}

- (HMHome)home
{
  return self->_home;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (HFCameraAudioManager)audioManager
{
  return self->_audioManager;
}

- (void)setAudioManager:(id)a3
{
}

- (unint64_t)inferredStreamState
{
  return self->_inferredStreamState;
}

- (void)setInferredStreamState:(unint64_t)a3
{
  self->_inferredStreamState = a3;
}

- (BOOL)startStreamingAfterStop
{
  return self->_startStreamingAfterStop;
}

- (void)setStartStreamingAfterStop:(BOOL)a3
{
  self->_startStreamingAfterStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioManager, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_streamError, 0);
  objc_storeStrong((id *)&self->_liveCameraSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end