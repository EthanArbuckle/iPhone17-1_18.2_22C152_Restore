@interface AVTFaceTracker
+ (BOOL)usesInternalTrackingPipeline;
+ (void)setUsesInternalTrackingPipeline:(BOOL)a3;
- (ARSession)arSession;
- (AVDepthData)fallBackDepthData;
- (AVTFaceTracker)init;
- (AVTFaceTrackingInfo)faceTrackingInfo;
- (BOOL)directRetargetingMode;
- (BOOL)faceIsTracked;
- (BOOL)isSensorCovered;
- (BOOL)limitRoll;
- (BOOL)lowLight;
- (BOOL)mirroredDepthData;
- (BOOL)shouldConstrainHeadPose;
- (BOOL)shouldUseAudioData;
- (BOOL)wantsPersonSegmentation;
- (CGSize)cameraImageResolution;
- (NSURL)faceTrackingRecordingURL;
- (__n128)cameraIntrinsics;
- (__n128)rawTransform;
- (double)arDelegateTimestamp;
- (double)arFrameDeltaTime;
- (double)arFrameTimestamp;
- (double)lastUpdateTimestamp;
- (double)lastUpdateWithTrackedFaceTimestamp;
- (int64_t)captureVideoOrientation;
- (int64_t)faceTrackingFrameID;
- (int64_t)interfaceOrientation;
- (uint64_t)projectionMatrixForViewportSize:zNear:zFar:;
- (unint64_t)state;
- (void)_setupARKitForDebugging:(BOOL)a3;
- (void)addDelegate:(id)a3;
- (void)beginQuery;
- (void)configurationVideoFormatDidChange:(id)a3;
- (void)copyTrackingData:(id *)a3;
- (void)decreaseFrameRate;
- (void)discardARFrameData;
- (void)endQuery;
- (void)enumerateDelegates:(id)a3;
- (void)increaseFrameRateToMaximum;
- (void)pauseByPausingARSession;
- (void)pauseBySkippingARFrames;
- (void)removeDelegate:(id)a3;
- (void)run;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
- (void)setDirectRetargetingMode:(BOOL)a3;
- (void)setFaceTrackingRecordingURL:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setLimitRoll:(BOOL)a3;
- (void)setLowLight:(BOOL)a3;
- (void)setSensorCovered:(BOOL)a3;
- (void)setShouldConstrainHeadPose:(BOOL)a3;
- (void)setShouldUseAudioData:(BOOL)a3;
- (void)setWantsPersonSegmentation:(BOOL)a3;
- (void)setupARKit;
- (void)setupARKitForDebugging;
- (void)startRecording;
- (void)stop;
- (void)stopRecording;
- (void)updateWithARFrame:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5 constrainHeadPose:(BOOL)a6 mirroredDepthData:(BOOL)a7;
- (void)updateWithARFrame:(id)a3 worldAlignment:(int64_t)a4 fallBackDepthData:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 constrainHeadPose:(BOOL)a8 mirroredDepthData:(BOOL)a9;
@end

@implementation AVTFaceTracker

+ (BOOL)usesInternalTrackingPipeline
{
  return gUsesInternalTrackingPipeline;
}

+ (void)setUsesInternalTrackingPipeline:(BOOL)a3
{
  gUsesInternalTrackingPipeline = a3;
}

- (AVTFaceTracker)init
{
  v9.receiver = self;
  v9.super_class = (Class)AVTFaceTracker;
  v2 = [(AVTFaceTracker *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *(int64x2_t *)&v2->_requestedState = vdupq_n_s64(3uLL);
    v2->_faceIsTracked = 0;
    v4 = objc_alloc_init(AVTFaceTrackingInfo);
    trackingInfo = v3->_trackingInfo;
    v3->_trackingInfo = v4;

    v3->_arSessionLock._os_unfair_lock_opaque = 0;
    v3->_trackingDataLock._os_unfair_lock_opaque = 0;
    v3->_shouldConstrainHeadPose = 0;
    uint64_t v6 = [objc_alloc(MEMORY[0x263F08A88]) initWithOptions:5];
    delegates = v3->_delegates;
    v3->_delegates = (NSPointerArray *)v6;
  }
  return v3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void)addDelegate:(id)a3
{
}

- (void)removeDelegate:(id)a3
{
  id v6 = a3;
  if ([(NSPointerArray *)self->_delegates count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      id v5 = [(NSPointerArray *)self->_delegates pointerAtIndex:v4];
      if (v5 == v6) {
        break;
      }

      if (++v4 >= [(NSPointerArray *)self->_delegates count]) {
        goto LABEL_7;
      }
    }
    [(NSPointerArray *)self->_delegates removePointerAtIndex:v4];
  }
LABEL_7:
}

- (void)enumerateDelegates:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_delegates;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)run
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  self->_requestedState = 0;
  unint64_t currentState = self->_currentState;
  if (currentState)
  {
    if (currentState == 2)
    {
      uint64_t v4 = avt_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        arSession = self->_arSession;
        int v10 = 134217984;
        long long v11 = arSession;
        _os_log_impl(&dword_20B819000, v4, OS_LOG_TYPE_DEFAULT, "[Face tracker] Resuming face tracking ; will no longer skip frames from session %p",
          (uint8_t *)&v10,
          0xCu);
      }

      self->_unint64_t currentState = 0;
    }
    else
    {
      os_unfair_lock_lock(&self->_arSessionLock);
      uint64_t v6 = self->_arSession;
      uint64_t v7 = avt_default_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          uint64_t v9 = self->_arSession;
          int v10 = 134217984;
          long long v11 = v9;
          _os_log_impl(&dword_20B819000, v7, OS_LOG_TYPE_DEFAULT, "[Face tracker] Resuming face tracking ; calling -[ARSession runWithConfiguration:] on session %p",
            (uint8_t *)&v10,
            0xCu);
        }

        self->_unint64_t currentState = 0;
        [(ARSession *)self->_arSession runWithConfiguration:self->_arConfiguration];
      }
      else
      {
        if (v8)
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_20B819000, v7, OS_LOG_TYPE_DEFAULT, "[Face tracker] Running face tracking", (uint8_t *)&v10, 2u);
        }

        [(AVTFaceTracker *)self _setupARKitForDebugging:0];
      }
      os_unfair_lock_unlock(&self->_arSessionLock);
    }
  }
}

- (void)pauseByPausingARSession
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  self->_requestedState = 1;
  if ((self->_currentState | 2) != 3)
  {
    p_arSessionLock = &self->_arSessionLock;
    os_unfair_lock_lock(&self->_arSessionLock);
    uint64_t v4 = avt_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      arSession = self->_arSession;
      int v6 = 134217984;
      uint64_t v7 = arSession;
      _os_log_impl(&dword_20B819000, v4, OS_LOG_TYPE_DEFAULT, "[Face tracker] Pausing face tracking ; calling -[ARSession pause] on session %p",
        (uint8_t *)&v6,
        0xCu);
    }

    self->_unint64_t currentState = 1;
    [(ARSession *)self->_arSession pause];
    os_unfair_lock_unlock(p_arSessionLock);
  }
}

- (void)pauseBySkippingARFrames
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  self->_requestedState = 2;
  if (self->_currentState - 1 >= 3)
  {
    p_arSessionLock = &self->_arSessionLock;
    os_unfair_lock_lock(&self->_arSessionLock);
    uint64_t v4 = avt_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      arSession = self->_arSession;
      int v6 = 134217984;
      uint64_t v7 = arSession;
      _os_log_impl(&dword_20B819000, v4, OS_LOG_TYPE_DEFAULT, "[Face tracker] Pausing face tracking ; will skip new frames from session %p",
        (uint8_t *)&v6,
        0xCu);
    }

    self->_unint64_t currentState = 2;
    os_unfair_lock_unlock(p_arSessionLock);
  }
}

- (void)stop
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  self->_requestedState = 3;
  if (self->_currentState != 3)
  {
    p_arSessionLock = &self->_arSessionLock;
    os_unfair_lock_lock(&self->_arSessionLock);
    uint64_t v4 = avt_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      arSession = self->_arSession;
      int v7 = 134217984;
      uint64_t v8 = arSession;
      _os_log_impl(&dword_20B819000, v4, OS_LOG_TYPE_DEFAULT, "[Face tracker] Stopping face tracking ; calling -[ARSession pause] on session %p before release",
        (uint8_t *)&v7,
        0xCu);
    }

    self->_unint64_t currentState = 3;
    [(ARSession *)self->_arSession pause];
    int v6 = self->_arSession;
    self->_arSession = 0;

    os_unfair_lock_unlock(p_arSessionLock);
  }
}

- (unint64_t)state
{
  return self->_currentState;
}

- (uint64_t)projectionMatrixForViewportSize:zNear:zFar:
{
  ARCameraToDisplayRotation();
  ARAdjustIntrincisForOrientation();
  uint64_t v0 = ARAdjustIntrinsicsForViewportSize();
  return MEMORY[0x270EDDF58](v0);
}

- (void)updateWithARFrame:(id)a3 captureOrientation:(int64_t)a4 interfaceOrientation:(int64_t)a5 constrainHeadPose:(BOOL)a6 mirroredDepthData:(BOOL)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  [v12 timestamp];
  double v14 = v13;
  self->_lastUpdateTimestamp = v13;
  uint64_t v15 = +[AVTFaceTrackingInfo trackingInfoWithARFrame:worldAlignment:captureOrientation:interfaceOrientation:constrainHeadPose:](AVTFaceTrackingInfo, "trackingInfoWithARFrame:worldAlignment:captureOrientation:interfaceOrientation:constrainHeadPose:", v12, [v12 worldAlignment], a4, a5, v8);
  if (v15)
  {
    objc_storeStrong((id *)&self->_trackingInfo, v15);
    fallBackDepthData = self->_fallBackDepthData;
    self->_fallBackDepthData = 0;

    self->_faceIsTracked = 1;
    v17 = [v12 camera];
    [v17 intrinsics];
    *(_DWORD *)&self->_anon_40[8] = v18;
    *(_DWORD *)&self->_anon_40[24] = v19;
    *(void *)self->_anon_40 = v20;
    *(void *)&self->_anon_40[16] = v21;
    *(_DWORD *)&self->_anon_40[40] = v22;
    *(void *)&self->_anon_40[32] = v23;

    v24 = [v12 camera];
    [v24 imageResolution];
    self->_cameraImageResolution.width = v25;
    self->_cameraImageResolution.height = v26;

    self->_captureVideoOrientation = a4;
    self->_interfaceOrientation = a5;
    p_double lastUpdateWithTrackedFaceTimestamp = &self->_lastUpdateWithTrackedFaceTimestamp;
    self->_mirroredDepthData = a7;
LABEL_4:
    double *p_lastUpdateWithTrackedFaceTimestamp = v14;
    goto LABEL_5;
  }
  p_double lastUpdateWithTrackedFaceTimestamp = &self->_lastUpdateWithTrackedFaceTimestamp;
  double lastUpdateWithTrackedFaceTimestamp = self->_lastUpdateWithTrackedFaceTimestamp;
  self->_faceIsTracked = 0;
  if (lastUpdateWithTrackedFaceTimestamp == 0.0) {
    goto LABEL_4;
  }
LABEL_5:
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __112__AVTFaceTracker_updateWithARFrame_captureOrientation_interfaceOrientation_constrainHeadPose_mirroredDepthData___block_invoke;
  v30[3] = &unk_26401F640;
  v30[4] = self;
  id v31 = v12;
  id v29 = v12;
  [(AVTFaceTracker *)self enumerateDelegates:v30];
}

uint64_t __112__AVTFaceTracker_updateWithARFrame_captureOrientation_interfaceOrientation_constrainHeadPose_mirroredDepthData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceTrackerDidUpdate:*(void *)(a1 + 32) withARFrame:*(void *)(a1 + 40)];
}

- (void)updateWithARFrame:(id)a3 worldAlignment:(int64_t)a4 fallBackDepthData:(id)a5 captureOrientation:(int64_t)a6 interfaceOrientation:(int64_t)a7 constrainHeadPose:(BOOL)a8 mirroredDepthData:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a5;
  [v15 timestamp];
  double v18 = v17;
  self->_lastUpdateTimestamp = v17;
  int v19 = +[AVTFaceTrackingInfo trackingInfoWithARFrame:v15 worldAlignment:a4 captureOrientation:a6 interfaceOrientation:a7 constrainHeadPose:v9];
  if (v19)
  {
    objc_storeStrong((id *)&self->_trackingInfo, v19);
    objc_storeStrong((id *)&self->_fallBackDepthData, a5);
    self->_faceIsTracked = 1;
    uint64_t v20 = [v15 camera];
    [v20 intrinsics];
    *(_DWORD *)&self->_anon_40[8] = v21;
    *(_DWORD *)&self->_anon_40[24] = v22;
    *(void *)self->_anon_40 = v23;
    *(void *)&self->_anon_40[16] = v24;
    *(_DWORD *)&self->_anon_40[40] = v25;
    *(void *)&self->_anon_40[32] = v26;

    v27 = [v15 camera];
    [v27 imageResolution];
    self->_cameraImageResolution.width = v28;
    self->_cameraImageResolution.height = v29;

    self->_captureVideoOrientation = a6;
    self->_interfaceOrientation = a7;
    p_double lastUpdateWithTrackedFaceTimestamp = &self->_lastUpdateWithTrackedFaceTimestamp;
    self->_mirroredDepthData = a9;
LABEL_4:
    double *p_lastUpdateWithTrackedFaceTimestamp = v18;
    goto LABEL_5;
  }
  p_double lastUpdateWithTrackedFaceTimestamp = &self->_lastUpdateWithTrackedFaceTimestamp;
  double lastUpdateWithTrackedFaceTimestamp = self->_lastUpdateWithTrackedFaceTimestamp;
  self->_faceIsTracked = 0;
  if (lastUpdateWithTrackedFaceTimestamp == 0.0) {
    goto LABEL_4;
  }
LABEL_5:
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __145__AVTFaceTracker_updateWithARFrame_worldAlignment_fallBackDepthData_captureOrientation_interfaceOrientation_constrainHeadPose_mirroredDepthData___block_invoke;
  v33[3] = &unk_26401F640;
  v33[4] = self;
  id v34 = v15;
  id v32 = v15;
  [(AVTFaceTracker *)self enumerateDelegates:v33];
}

uint64_t __145__AVTFaceTracker_updateWithARFrame_worldAlignment_fallBackDepthData_captureOrientation_interfaceOrientation_constrainHeadPose_mirroredDepthData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceTrackerDidUpdate:*(void *)(a1 + 32) withARFrame:*(void *)(a1 + 40)];
}

- (void)discardARFrameData
{
  trackingInfo = self->_trackingInfo;
  self->_trackingInfo = 0;

  fallBackDepthData = self->_fallBackDepthData;
  self->_fallBackDepthData = 0;
}

- (ARSession)arSession
{
  return self->_arSession;
}

- (void)configurationVideoFormatDidChange:(id)a3
{
  self->_captureVideoOrientation = 4;
}

- (NSURL)faceTrackingRecordingURL
{
  return self->_debugRecordingURL;
}

- (void)setFaceTrackingRecordingURL:(id)a3
{
  if (self->_debugRecordingURL != a3)
  {
    uint64_t v4 = (NSURL *)[a3 copy];
    debugRecordingURL = self->_debugRecordingURL;
    self->_debugRecordingURL = v4;

    [(AVTFaceTracker *)self setupARKit];
  }
}

- (void)setLowLight:(BOOL)a3
{
  self->_lowLight = a3;
}

- (void)setSensorCovered:(BOOL)a3
{
  self->_isSensorCovered = a3;
}

- (BOOL)shouldUseAudioData
{
  return self->_shouldUseAudioData;
}

- (void)setShouldUseAudioData:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_shouldUseAudioData != a3)
  {
    BOOL v3 = a3;
    self->_shouldUseAudioData = a3;
    p_arSessionLock = &self->_arSessionLock;
    os_unfair_lock_lock(&self->_arSessionLock);
    [(ARConfiguration *)self->_arConfiguration setProvidesAudioData:v3];
    if (!self->_requestedState)
    {
      int v6 = avt_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        arSession = self->_arSession;
        int v8 = 134217984;
        BOOL v9 = arSession;
        _os_log_impl(&dword_20B819000, v6, OS_LOG_TYPE_DEFAULT, "[Face tracker] Audio data status did change ; calling -[ARSession runWithConfiguration:] on session %p",
          (uint8_t *)&v8,
          0xCu);
      }

      self->_unint64_t currentState = 0;
      [(ARSession *)self->_arSession runWithConfiguration:self->_arConfiguration];
    }
    os_unfair_lock_unlock(p_arSessionLock);
  }
}

- (BOOL)wantsPersonSegmentation
{
  return self->_wantsPersonSegmentation;
}

- (void)setWantsPersonSegmentation:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_wantsPersonSegmentation != a3)
  {
    self->_wantsPersonSegmentation = a3;
    p_arSessionLock = &self->_arSessionLock;
    os_unfair_lock_lock(&self->_arSessionLock);
    if (self->_wantsPersonSegmentation
      && [(id)objc_opt_class() supportsFrameSemantics:1])
    {
      arConfiguration = self->_arConfiguration;
      unint64_t v6 = [(ARConfiguration *)arConfiguration frameSemantics] | 1;
    }
    else
    {
      arConfiguration = self->_arConfiguration;
      unint64_t v6 = [(ARConfiguration *)arConfiguration frameSemantics] & 0xFFFFFFFFFFFFFFFELL;
    }
    [(ARConfiguration *)arConfiguration setFrameSemantics:v6];
    if (!self->_requestedState)
    {
      int v7 = avt_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        arSession = self->_arSession;
        int v9 = 134217984;
        uint64_t v10 = arSession;
        _os_log_impl(&dword_20B819000, v7, OS_LOG_TYPE_DEFAULT, "[Face tracker] Person segmentation status did change ; calling -[ARSession runWithConfiguration:] on session %p",
          (uint8_t *)&v9,
          0xCu);
      }

      self->_unint64_t currentState = 0;
      [(ARSession *)self->_arSession runWithConfiguration:self->_arConfiguration];
    }
    os_unfair_lock_unlock(p_arSessionLock);
  }
}

- (int64_t)faceTrackingFrameID
{
  return self->_frame_id;
}

- (double)arFrameTimestamp
{
  return self->_perfPacket.refTimestamp;
}

- (double)arDelegateTimestamp
{
  return self->_perfPacket.arDelegateTimestamp;
}

- (double)arFrameDeltaTime
{
  return self->_timeBetweenARFrame;
}

- (void)decreaseFrameRate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_arSessionLock = &self->_arSessionLock;
  os_unfair_lock_lock(&self->_arSessionLock);
  uint64_t v4 = [(id)objc_opt_class() supportedVideoFormats];
  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_0];

  unint64_t v6 = [(ARConfiguration *)self->_arConfiguration videoFormat];
  unint64_t v7 = [v5 indexOfObject:v6];

  if (v7 && v7 < [v5 count])
  {
    int v8 = [v5 objectAtIndexedSubscript:v7 - 1];
    [(ARConfiguration *)self->_arConfiguration setVideoFormat:v8];
    [(AVTFaceTracker *)self configurationVideoFormatDidChange:self->_arConfiguration];
    if (!self->_requestedState)
    {
      int v9 = avt_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        arSession = self->_arSession;
        int v11 = 134217984;
        id v12 = arSession;
        _os_log_impl(&dword_20B819000, v9, OS_LOG_TYPE_DEFAULT, "[Face tracker] Video format did change ; calling -[ARSession runWithConfiguration:] on session %p",
          (uint8_t *)&v11,
          0xCu);
      }

      self->_unint64_t currentState = 0;
      [(ARSession *)self->_arSession runWithConfiguration:self->_arConfiguration];
    }
  }
  os_unfair_lock_unlock(p_arSessionLock);
}

- (void)increaseFrameRateToMaximum
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  p_arSessionLock = &self->_arSessionLock;
  os_unfair_lock_lock(&self->_arSessionLock);
  uint64_t v4 = self->_arConfiguration;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = objc_msgSend((id)objc_opt_class(), "supportedVideoFormats", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:buf count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v12 framesPerSecond] > v9)
        {
          uint64_t v9 = [v12 framesPerSecond];
          id v13 = v12;

          int v8 = v13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:buf count:16];
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
  }

  double v14 = [(ARConfiguration *)self->_arConfiguration videoFormat];
  char v15 = [v8 isEqual:v14];

  if ((v15 & 1) == 0)
  {
    [(ARConfiguration *)self->_arConfiguration setVideoFormat:v8];
    [(AVTFaceTracker *)self configurationVideoFormatDidChange:self->_arConfiguration];
    if (!self->_requestedState)
    {
      id v16 = avt_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        arSession = self->_arSession;
        *(_DWORD *)buf = 134217984;
        uint64_t v23 = arSession;
        _os_log_impl(&dword_20B819000, v16, OS_LOG_TYPE_DEFAULT, "[Face tracker] Video format did change ; calling -[ARSession runWithConfiguration:] on session %p",
          buf,
          0xCu);
      }

      self->_unint64_t currentState = 0;
      [(ARSession *)self->_arSession runWithConfiguration:self->_arConfiguration];
    }
  }
  os_unfair_lock_unlock(p_arSessionLock);
}

- (void)setupARKit
{
  p_arSessionLock = &self->_arSessionLock;
  os_unfair_lock_lock(&self->_arSessionLock);
  [(AVTFaceTracker *)self _setupARKitForDebugging:0];
  os_unfair_lock_unlock(p_arSessionLock);
}

- (void)setupARKitForDebugging
{
  p_arSessionLock = &self->_arSessionLock;
  os_unfair_lock_lock(&self->_arSessionLock);
  [(AVTFaceTracker *)self _setupARKitForDebugging:1];
  os_unfair_lock_unlock(p_arSessionLock);
}

- (void)_setupARKitForDebugging:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263EF8F50] isSupported])
  {
    if (!self->_arSession)
    {
      id v5 = (ARSession *)objc_opt_new();
      arSession = self->_arSession;
      self->_arSession = v5;

      [(ARSession *)self->_arSession setDelegate:self];
    }
    arConfiguration = self->_arConfiguration;
    self->_arConfiguration = 0;

    if (+[AVTRecordView usesInternalTrackingPipeline])
    {
      int v8 = (ARConfiguration *)objc_opt_new();
    }
    else
    {
      int v8 = (ARConfiguration *)objc_opt_new();
      [(ARConfiguration *)v8 setMaximumNumberOfTrackedFaces:1];
    }
    uint64_t v10 = self->_arConfiguration;
    self->_arConfiguration = v8;

    [(ARConfiguration *)self->_arConfiguration setProvidesAudioData:self->_shouldUseAudioData];
    [(ARConfiguration *)self->_arConfiguration setLightEstimationEnabled:0];
    [(ARConfiguration *)self->_arConfiguration setWorldAlignment:2];
    if (self->_wantsPersonSegmentation
      && [(id)objc_opt_class() supportsFrameSemantics:1])
    {
      [(ARConfiguration *)self->_arConfiguration setFrameSemantics:[(ARConfiguration *)self->_arConfiguration frameSemantics] | 1];
    }
    [(ARConfiguration *)self->_arConfiguration setAllowCameraInMultipleForegroundAppLayout:1];
    if (v3 && self->_debugRecordingURL)
    {
      int v11 = (ARConfiguration *)[objc_alloc(MEMORY[0x263EF8FD0]) initWithBaseConfiguration:self->_arConfiguration fileURL:self->_debugRecordingURL];
      id v12 = self->_arConfiguration;
      self->_arConfiguration = v11;
    }
    [(AVTFaceTracker *)self configurationVideoFormatDidChange:self->_arConfiguration];
    id v13 = avt_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = self->_arSession;
      int v15 = 134217984;
      id v16 = v14;
      _os_log_impl(&dword_20B819000, v13, OS_LOG_TYPE_DEFAULT, "[Face tracker] ARKit setup ; calling -[ARSession runWithConfiguration:] on session %p",
        (uint8_t *)&v15,
        0xCu);
    }

    self->_unint64_t currentState = 0;
    [(ARSession *)self->_arSession runWithConfiguration:self->_arConfiguration];
  }
  else
  {
    uint64_t v9 = avt_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_20B819000, v9, OS_LOG_TYPE_DEFAULT, "[Face tracker] Face tracking is not supported by this device", (uint8_t *)&v15, 2u);
    }
  }
}

- (void)stopRecording
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    uint64_t v4 = self->_arConfiguration;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __31__AVTFaceTracker_stopRecording__block_invoke;
    int v11 = &unk_26401F668;
    id v12 = v4;
    dispatch_semaphore_t v13 = v3;
    id v5 = v3;
    uint64_t v6 = v4;
    [(ARConfiguration *)v6 finishRecordingWithHandler:&v8];
    dispatch_time_t v7 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v5, v7);
    [(AVTFaceTracker *)self setupARKit];
  }
}

void __31__AVTFaceTracker_stopRecording__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = avt_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) fileURL];
    int v6 = 138412546;
    dispatch_time_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_20B819000, v4, OS_LOG_TYPE_DEFAULT, "[Face tracker] Finished recording to %@, error: %@", (uint8_t *)&v6, 0x16u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)startRecording
{
  if (self->_debugRecordingURL)
  {
    [(AVTFaceTracker *)self setupARKitForDebugging];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      arConfiguration = self->_arConfiguration;
      [(ARConfiguration *)arConfiguration startRecording];
    }
  }
}

- (void)sessionWasInterrupted:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = avt_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_20B819000, v5, OS_LOG_TYPE_DEFAULT, "[Face tracker] Session was interrupted: %@", buf, 0xCu);
  }

  self->_faceIsTracked = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__AVTFaceTracker_sessionWasInterrupted___block_invoke;
  v7[3] = &unk_26401F640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AVTFaceTracker *)self enumerateDelegates:v7];
}

void __40__AVTFaceTracker_sessionWasInterrupted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 faceTracker:*(void *)(a1 + 32) sessionWasInterrupted:*(void *)(a1 + 40)];
  }
}

- (void)sessionInterruptionEnded:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = avt_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_20B819000, v5, OS_LOG_TYPE_DEFAULT, "[Face tracker] Session interruption ended: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__AVTFaceTracker_sessionInterruptionEnded___block_invoke;
  v7[3] = &unk_26401F640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AVTFaceTracker *)self enumerateDelegates:v7];
}

void __43__AVTFaceTracker_sessionInterruptionEnded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 faceTracker:*(void *)(a1 + 32) sessionInterruptionEnded:*(void *)(a1 + 40)];
  }
}

- (void)session:(id)a3 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__AVTFaceTracker_session_didOutputAudioSampleBuffer___block_invoke;
  v8[3] = &unk_26401F690;
  v8[4] = self;
  id v9 = v6;
  id v10 = a4;
  id v7 = v6;
  [(AVTFaceTracker *)self enumerateDelegates:v8];
}

void __53__AVTFaceTracker_session_didOutputAudioSampleBuffer___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 faceTracker:a1[4] session:a1[5] didOutputAudioSampleBuffer:a1[6]];
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_currentState == 2) {
    goto LABEL_26;
  }
  id v8 = (void *)MEMORY[0x2105397E0]();
  [v7 timestamp];
  double v10 = v9;
  os_unfair_lock_lock(&self->_trackingDataLock);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v11 = [v7 anchors];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v53 = v8;
    id v54 = v6;
    uint64_t v56 = 0;
    uint64_t v14 = *(void *)v66;
    v55 = v11;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
          if ([v17 isTracked])
          {
            int v61 = [(AVTFaceTracker *)self directRetargetingMode];
            *(double *)&self->_frame_id = v10;
            kdebug_trace();
            kdebug_trace();
            long long v18 = v7;
            long long v19 = [v7 captureDate];
            [v19 timeIntervalSinceReferenceDate];
            self->_perfPacket.double refTimestamp = v20;

            double lastARFrameTime = self->_lastARFrameTime;
            double refTimestamp = self->_perfPacket.refTimestamp;
            if (lastARFrameTime > 0.0) {
              self->_timeBetweenARFrame = refTimestamp - lastARFrameTime;
            }
            self->_double lastARFrameTime = refTimestamp;
            [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
            self->_perfPacket.arDelegateTimestamp = v23;
            uint64_t v24 = self->_trackingInfo;
            objc_msgSend(v17, "_avt_rawTransform");
            __n128 v59 = v26;
            __n128 v60 = v25;
            __n128 v57 = v28;
            __n128 v58 = v27;
            int64_t captureVideoOrientation = self->_captureVideoOrientation;
            int64_t interfaceOrientation = self->_interfaceOrientation;
            BOOL shouldConstrainHeadPose = self->_shouldConstrainHeadPose;
            unint64_t v32 = [v18 worldAlignment];
            int v33 = shouldConstrainHeadPose;
            id v7 = v18;
            *(__n128 *)&v24[1].super.isa = _convertARFaceAnchorTransformToSceneKitTransform(captureVideoOrientation, interfaceOrientation, v33, v18, v32, v60, v59, v58, v57);
            *(_OWORD *)&v24[1]._trackingData.timestamp = v34;
            *(_OWORD *)&v24[1]._anon_18[8] = v35;
            *(_OWORD *)&v24[1]._anon_18[24] = v36;
            float v64 = 0.0;
            AVTTrackingDataFromARFrame((uint64_t)&v24->_trackingData, v18, [v18 worldAlignment], v17, self->_captureVideoOrientation, self->_interfaceOrientation, self->_shouldConstrainHeadPose, v61, &v64);
            LODWORD(captureVideoOrientation) = [(AVTFaceTracker *)self limitRoll];

            if (!captureVideoOrientation || v64 < 1.25663706) {
              ++v56;
            }
            uint64_t v11 = v55;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v13);

    self->_lastUpdateTimestamp = v10;
    id v8 = v53;
    id v6 = v54;
    if (v56)
    {
      char v37 = 1;
LABEL_22:
      self->_double lastUpdateWithTrackedFaceTimestamp = v10;
      BOOL v38 = v37;
      goto LABEL_23;
    }
  }
  else
  {

    self->_lastUpdateTimestamp = v10;
  }
  char v37 = 0;
  BOOL v38 = 0;
  if (self->_lastUpdateWithTrackedFaceTimestamp == 0.0) {
    goto LABEL_22;
  }
LABEL_23:
  os_unfair_lock_unlock(&self->_trackingDataLock);
  self->_faceIsTracked = v38;
  v39 = [v7 faceData];
  v40 = [v39 faceMeshPayload];
  v41 = [v40 objectForKeyedSubscript:*MEMORY[0x263F26980]];

  if (v41)
  {
    v42 = [v41 objectForKeyedSubscript:*MEMORY[0x263F26988]];
    -[AVTFaceTracker setLowLight:](self, "setLowLight:", [v42 BOOLValue]);
    v43 = [v41 objectForKeyedSubscript:*MEMORY[0x263F26990]];
    -[AVTFaceTracker setSensorCovered:](self, "setSensorCovered:", [v43 BOOLValue]);
  }
  v44 = [v7 camera];
  [v44 intrinsics];
  *(_DWORD *)&self->_anon_40[8] = v45;
  *(_DWORD *)&self->_anon_40[24] = v46;
  *(void *)self->_anon_40 = v47;
  *(void *)&self->_anon_40[16] = v48;
  *(_DWORD *)&self->_anon_40[40] = v49;
  *(void *)&self->_anon_40[32] = v50;
  [v44 imageResolution];
  self->_cameraImageResolution.width = v51;
  self->_cameraImageResolution.height = v52;
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __41__AVTFaceTracker_session_didUpdateFrame___block_invoke;
  v62[3] = &unk_26401F640;
  v62[4] = self;
  id v63 = v7;
  [(AVTFaceTracker *)self enumerateDelegates:v62];

LABEL_26:
}

uint64_t __41__AVTFaceTracker_session_didUpdateFrame___block_invoke(uint64_t a1, void *a2)
{
  return [a2 faceTrackerDidUpdate:*(void *)(a1 + 32) withARFrame:*(void *)(a1 + 40)];
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = avt_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_20B819000, v8, OS_LOG_TYPE_DEFAULT, "[Face tracker] Session %p failed with error: %@", buf, 0x16u);
  }

  self->_faceIsTracked = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__AVTFaceTracker_session_didFailWithError___block_invoke;
  v14[3] = &unk_26401F6B8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  [(AVTFaceTracker *)self enumerateDelegates:v14];
  os_unfair_lock_lock(&self->_arSessionLock);
  self->_unint64_t currentState = 3;
  [(ARSession *)self->_arSession pause];
  arSession = self->_arSession;
  self->_arSession = 0;

  os_unfair_lock_unlock(&self->_arSessionLock);
  dispatch_time_t v12 = dispatch_time(0, 1000000000);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__AVTFaceTracker_session_didFailWithError___block_invoke_2;
  v13[3] = &unk_26401F6E0;
  v13[4] = self;
  dispatch_after(v12, MEMORY[0x263EF83A0], v13);
}

void __43__AVTFaceTracker_session_didFailWithError___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 faceTracker:a1[4] session:a1[5] didFailWithError:a1[6]];
  }
}

void *__43__AVTFaceTracker_session_didFailWithError___block_invoke_2(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[4]) {
    return (void *)[result run];
  }
  return result;
}

- (void)beginQuery
{
}

- (void)endQuery
{
}

- (AVTFaceTrackingInfo)faceTrackingInfo
{
  return self->_trackingInfo;
}

- (void)copyTrackingData:(id *)a3
{
  id v4 = [(AVTFaceTrackingInfo *)self->_trackingInfo trackingData];
  memcpy(a3, v4, 0x1E0uLL);
}

- (__n128)rawTransform
{
  return *(__n128 *)(*(void *)(a1 + 136) + 496);
}

- (BOOL)lowLight
{
  return self->_lowLight;
}

- (BOOL)isSensorCovered
{
  return self->_isSensorCovered;
}

- (double)lastUpdateTimestamp
{
  return self->_lastUpdateTimestamp;
}

- (double)lastUpdateWithTrackedFaceTimestamp
{
  return self->_lastUpdateWithTrackedFaceTimestamp;
}

- (BOOL)shouldConstrainHeadPose
{
  return self->_shouldConstrainHeadPose;
}

- (void)setShouldConstrainHeadPose:(BOOL)a3
{
  self->_BOOL shouldConstrainHeadPose = a3;
}

- (BOOL)limitRoll
{
  return self->limitRoll;
}

- (void)setLimitRoll:(BOOL)a3
{
  self->limitRoll = a3;
}

- (AVDepthData)fallBackDepthData
{
  return self->_fallBackDepthData;
}

- (int64_t)captureVideoOrientation
{
  return self->_captureVideoOrientation;
}

- (BOOL)mirroredDepthData
{
  return self->_mirroredDepthData;
}

- (BOOL)faceIsTracked
{
  return self->_faceIsTracked;
}

- (BOOL)directRetargetingMode
{
  return self->_directRetargetingMode;
}

- (void)setDirectRetargetingMode:(BOOL)a3
{
  self->_directRetargetingMode = a3;
}

- (__n128)cameraIntrinsics
{
  return a1[4];
}

- (CGSize)cameraImageResolution
{
  double width = self->_cameraImageResolution.width;
  double height = self->_cameraImageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugRecordingURL, 0);
  objc_storeStrong((id *)&self->_trackingInfo, 0);
  objc_storeStrong((id *)&self->_fallBackDepthData, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_arConfiguration, 0);
  objc_storeStrong((id *)&self->_arSession, 0);
}

@end