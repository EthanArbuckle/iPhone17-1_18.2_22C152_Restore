@interface AVTRenderer
+ (id)_cek_renderer;
+ (id)_cek_rendererWithDevice:(id)a3 options:(id)a4;
+ (id)renderer;
- (AVTAvatar)avatar;
- (AVTFaceTracker)faceTracker;
- (AVTPresentationConfiguration)presentationConfiguration;
- (AVTRendererTechnique)avtRendererTechnique;
- (BOOL)arMode;
- (BOOL)captureImageIsTooDark;
- (BOOL)deprecated_ntk_isPaused;
- (BOOL)enableDepthMask;
- (BOOL)enableFaceTrackingLossFeedback;
- (BOOL)enableReticle;
- (BOOL)faceIsTracked;
- (BOOL)isSensorCovered;
- (BOOL)isWarmingUp;
- (BOOL)pauseSimulation;
- (NSString)framingMode;
- (float)_cek_currentPointOfViewSensorHeight;
- (id)_initWithOptions:(id)a3 isPrivateRenderer:(BOOL)a4 privateRendererOwner:(id)a5 clearsOnDraw:(BOOL)a6 context:(void *)a7 renderingAPI:(unint64_t)a8;
- (id)_renderer:(id)a3 subdivDataForHash:(id)a4;
- (id)capturedDepth;
- (id)faceTrackingDelegate;
- (id)technique;
- (unint64_t)avt_antialiasingMode;
- (void)__setAvatar:(id)a3;
- (void)_animateToNoTrackingState;
- (void)_avtSetupWithOptions:(id)a3;
- (void)_cek_applyBlendshapeWeightsInHierarchyUsingBlock:(id)a3;
- (void)_cek_beginTransaction;
- (void)_cek_commitTransaction;
- (void)_cek_fetchBlendshapeWeightsInHierarchyUsingBlock:(id)a3;
- (void)_cek_renderAtTime:(double)a3 enableAntialiasing:(BOOL)a4 viewport:(CGRect)a5 commandBuffer:(id)a6 passDescriptor:(id)a7;
- (void)_cek_setCurrentPointOfViewFocalLength:(float)a3;
- (void)_detachAvatarFromRenderer;
- (void)_renderer:(id)a3 didApplyAnimationsAtTime:(double)a4;
- (void)_renderer:(id)a3 didBuildSubdivDataForHash:(id)a4 dataProvider:(id)a5;
- (void)_renderer:(id)a3 updateAtTime:(double)a4;
- (void)_setAvatar:(id)a3;
- (void)_updatePhysicsWorldForAvatarARScaleAndARMode:(BOOL)a3;
- (void)arMode;
- (void)clearOutAnimationToNoTrackingState;
- (void)crashAppExtensionOrViewService_rdar98130076:(id)a3;
- (void)dealloc;
- (void)deprecated_ntk_setPaused:(BOOL)a3;
- (void)deprecated_ntk_setPhysicsWorldTimeStep:(float)a3;
- (void)faceTracker:(id)a3 session:(id)a4 didFailWithError:(id)a5;
- (void)faceTracker:(id)a3 sessionInterruptionEnded:(id)a4;
- (void)faceTracker:(id)a3 sessionWasInterrupted:(id)a4;
- (void)faceTrackerDidUpdate:(id)a3 withARFrame:(id)a4;
- (void)fadePuppetToWhite:(float)a3;
- (void)renderAtTime:(double)a3 viewport:(CGRect)a4 commandBuffer:(id)a5 passDescriptor:(id)a6;
- (void)renderWithViewport:(CGRect)a3 commandBuffer:(id)a4 passDescriptor:(id)a5;
- (void)renderer:(id)a3 commandBufferDidCompleteWithError:(id)a4;
- (void)renderer:(id)a3 didFallbackToDefaultTextureForSource:(id)a4 message:(id)a5;
- (void)setArMode:(BOOL)a3;
- (void)setAvtRendererTechnique:(id)a3;
- (void)setAvt_antialiasingMode:(unint64_t)a3;
- (void)setCaptureImageIsTooDark:(BOOL)a3;
- (void)setCapturedDepth:(id)a3;
- (void)setEnableDepthMask:(BOOL)a3 withFlippedDepth:(BOOL)a4;
- (void)setEnableFaceTrackingLossFeedback:(BOOL)a3;
- (void)setEnableReticle:(BOOL)a3;
- (void)setFaceIsTracked:(BOOL)a3;
- (void)setFaceTracker:(id)a3;
- (void)setFaceTrackingDelegate:(id)a3;
- (void)setFramingMode:(id)a3;
- (void)setFramingModeForcingPointOfViewUpdate:(id)a3;
- (void)setPauseSimulation:(BOOL)a3;
- (void)setPresentationConfiguration:(id)a3;
- (void)setSensorCovered:(BOOL)a3;
- (void)setTechnique:(id)a3;
- (void)setWarmingUp:(BOOL)a3;
- (void)updateProjectionMatrixForARModeIfNeeded:(CGSize)a3;
@end

@implementation AVTRenderer

- (void)_avtSetupWithOptions:(id)a3
{
  id v20 = a3;
  v4 = (NSLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
  lock = self->_lock;
  self->_lock = v4;

  id v6 = objc_alloc(MEMORY[0x263F16AD8]);
  v7 = objc_msgSend(v6, "avt_init");
  [(AVTRenderer *)self setScene:v7];

  v8 = [(AVTRenderer *)self scene];
  v9 = [v8 physicsWorld];
  [v9 setSpeed:4.0];

  v10 = [AVTAvatarEnvironment alloc];
  v11 = [(AVTRenderer *)self scene];
  v12 = [(AVTAvatarEnvironment *)v10 initAndInstallInScene:v11 renderer:self];
  environment = self->_environment;
  self->_environment = v12;

  v14 = [v20 objectForKeyedSubscript:@"AVTRendererOptionEnableFaceTrackingLossFeedback"];
  v15 = v14;
  if (v14) {
    LOBYTE(v14) = [v14 BOOLValue];
  }
  self->_enableFaceTrackingLossFeedback = (char)v14;
  self->_enableReticle = 0;
  v16 = [v20 objectForKeyedSubscript:@"AVTRendererOptionInitiallyConfigureForARMode"];
  v17 = v16;
  if (v16 && ![v16 BOOLValue])
  {
    v18 = +[AVTClassicPresentationConfiguration sharedConfiguration];
  }
  else
  {
    v18 = objc_alloc_init(AVTAugmentedRealityPresentationConfiguration);
  }
  v19 = v18;
  [(AVTRenderer *)self setPresentationConfiguration:v18];

  self->_antialiasingMode = 2;
  [(AVTRenderer *)self set_wantsSceneRendererDelegationMessages:1];
  [(AVTRenderer *)self set_resourceManagerMonitor:self];
  [(AVTRenderer *)self set_commandBufferStatusMonitor:self];
  [(AVTRenderer *)self _allowGPUBackgroundExecution];
}

- (id)_initWithOptions:(id)a3 isPrivateRenderer:(BOOL)a4 privateRendererOwner:(id)a5 clearsOnDraw:(BOOL)a6 context:(void *)a7 renderingAPI:(unint64_t)a8
{
  BOOL v10 = a6;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  AVTInitializeShaderCache();
  [MEMORY[0x263F16B08] begin];
  [MEMORY[0x263F16B08] setAnimationDuration:0.0];
  v18.receiver = self;
  v18.super_class = (Class)AVTRenderer;
  id v16 = [(AVTRenderer *)&v18 _initWithOptions:v14 isPrivateRenderer:v12 privateRendererOwner:v15 clearsOnDraw:v10 context:a7 renderingAPI:a8];

  if (v16) {
    [v16 _avtSetupWithOptions:v14];
  }
  [MEMORY[0x263F16B08] commit];

  return v16;
}

+ (id)renderer
{
  return (id)[a1 rendererWithDevice:0 options:0];
}

- (void)dealloc
{
  [(AVTRenderer *)self _detachAvatarFromRenderer];
  [(AVTFaceTracker *)self->_faceTracker removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)AVTRenderer;
  [(AVTRenderer *)&v3 dealloc];
}

- (void)_updatePhysicsWorldForAvatarARScaleAndARMode:(BOOL)a3
{
  v5 = [(AVTRenderer *)self scene];
  id v10 = [v5 physicsWorld];

  [v10 scale];
  if (v6 != 100.0)
  {
    v7 = [(AVTRenderer *)self avatar];
    if (v7 && a3)
    {
      v8 = [(AVTRenderer *)self avatar];
      [v8 arScale];
      [v10 setScale:(float)(1.0 / v9)];
    }
    else
    {
      [v10 setScale:1.0];
    }
  }
}

- (BOOL)arMode
{
  if ((arMode_done_1 & 1) == 0)
  {
    arMode_done_1 = 1;
    objc_super v3 = avt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AVTRenderer arMode](v3);
    }
  }
  return [(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR];
}

- (void)setArMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ((setArMode__done_1 & 1) == 0)
  {
    setArMode__done_1 = 1;
    v5 = avt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AVTRenderer setArMode:](v5);
    }
  }
  if (v3)
  {
    double v6 = objc_alloc_init(AVTAugmentedRealityPresentationConfiguration);
  }
  else
  {
    double v6 = +[AVTClassicPresentationConfiguration sharedConfiguration];
  }
  v7 = v6;
  [(AVTRenderer *)self setPresentationConfiguration:v6];
}

- (void)updateProjectionMatrixForARModeIfNeeded:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR])
  {
    if (![(AVTAvatarEnvironment *)self->_environment showReticle] && width != 0.0 && height != 0.0)
    {
      [(AVTFaceTracker *)self->_faceTracker cameraIntrinsics];
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32(v8, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(v6, 1))).f32[0] != 0.0)
      {
        -[AVTFaceTracker projectionMatrixForViewportSize:zNear:zFar:](self->_faceTracker, "projectionMatrixForViewportSize:zNear:zFar:", width, height, 0.100000005, 100000.0);
        double v16 = v10;
        double v17 = v9;
        double v14 = v12;
        double v15 = v11;
        [(AVTRenderer *)self setFramingMode:@"cameraARMode"];
        v13 = [(AVTRenderer *)self pointOfView];
        objc_super v18 = [v13 camera];

        objc_msgSend(v18, "avt_setSimdProjectionTransform:", v17, v16, v15, v14);
      }
    }
  }
}

- (BOOL)pauseSimulation
{
  return self->_pauseSimulation;
}

- (void)setPauseSimulation:(BOOL)a3
{
  if (self->_pauseSimulation != a3)
  {
    self->_pauseSimulation = a3;
    arMaskRenderer = self->_arMaskRenderer;
    if (a3)
    {
      if (arMaskRenderer) {
        [(AVTARMaskRenderer *)arMaskRenderer setDepthSmoothingFactor:0.0];
      }
      int32x2_t v6 = [(AVTRenderer *)self scene];
      float32x4_t v7 = [v6 physicsWorld];
      [v7 setSpeed:0.0];

      int32x4_t v8 = [(AVTRenderer *)self scene];
      id v12 = v8;
      uint64_t v9 = 1;
    }
    else
    {
      if (arMaskRenderer)
      {
        LODWORD(v3) = 0.5;
        [(AVTARMaskRenderer *)arMaskRenderer setDepthSmoothingFactor:v3];
      }
      double v10 = [(AVTRenderer *)self scene];
      double v11 = [v10 physicsWorld];
      [v11 setSpeed:4.0];

      int32x4_t v8 = [(AVTRenderer *)self scene];
      id v12 = v8;
      uint64_t v9 = 0;
    }
    [v8 setPaused:v9];
  }
}

- (void)faceTrackerDidUpdate:(id)a3 withARFrame:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  double lastFaceTrackerUpdateTimestamp = self->_lastFaceTrackerUpdateTimestamp;
  [v19 lastUpdateTimestamp];
  if (lastFaceTrackerUpdateTimestamp < v8)
  {
    [v19 lastUpdateTimestamp];
    self->_double lastFaceTrackerUpdateTimestamp = v9;
  }
  double lastFaceTrackerUpdateWithTrackedFaceTimestamp = self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp;
  [(AVTFaceTracker *)self->_faceTracker lastUpdateWithTrackedFaceTimestamp];
  if (lastFaceTrackerUpdateWithTrackedFaceTimestamp < v11)
  {
    [(AVTFaceTracker *)self->_faceTracker lastUpdateWithTrackedFaceTimestamp];
    self->_double lastFaceTrackerUpdateWithTrackedFaceTimestamp = v12;
    if (!self->_faceIsTracked)
    {
      [(AVTRenderer *)self setFaceIsTracked:1];
      [(AVTRenderer *)self clearOutAnimationToNoTrackingState];
    }
    v13 = [v19 faceTrackingInfo];
    avatar = self->_avatar;
    double v15 = [(AVTRenderer *)self pointOfView];
    [(AVTAvatar *)avatar applyHeadPoseWithTrackingInfo:v13 gazeCorrection:0 pointOfView:v15];

    [(AVTAvatar *)self->_avatar applyBlendShapesWithTrackingInfo:v13];
LABEL_7:

    goto LABEL_13;
  }
  if (self->_lastFaceTrackerUpdateTimestamp - self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp > 1.5)
  {
    double v16 = [(AVTFaceTracker *)self->_faceTracker arSession];
    v13 = v16;
    if (self->_faceIsTracked && (!v16 || [v16 state] == 1)) {
      [(AVTRenderer *)self _animateToNoTrackingState];
    }
    goto LABEL_7;
  }
LABEL_13:
  if ([(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR])
  {
    arMaskRenderer = self->_arMaskRenderer;
    objc_super v18 = [v19 fallBackDepthData];
    -[AVTARMaskRenderer updateWithARFrame:fallBackDepthData:captureOrientation:interfaceOrientation:mirroredDepthData:](arMaskRenderer, "updateWithARFrame:fallBackDepthData:captureOrientation:interfaceOrientation:mirroredDepthData:", v6, v18, [v19 captureVideoOrientation], objc_msgSend(v19, "interfaceOrientation"), objc_msgSend(v19, "mirroredDepthData"));
  }
  -[AVTRenderer setCaptureImageIsTooDark:](self, "setCaptureImageIsTooDark:", [v19 lowLight]);
  -[AVTRenderer setSensorCovered:](self, "setSensorCovered:", [v19 isSensorCovered]);
}

- (void)faceTracker:(id)a3 session:(id)a4 didFailWithError:(id)a5
{
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    [v8 avatarRenderer:self faceTrackingSessionFailedWithError:v9];
  }
}

- (void)faceTracker:(id)a3 sessionWasInterrupted:(id)a4
{
  p_faceTrackingDelegate = &self->_faceTrackingDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
    [v8 avatarRendererFaceTrackingSessionInterruptionDidBegin:self];
  }
}

- (void)faceTracker:(id)a3 sessionInterruptionEnded:(id)a4
{
  p_faceTrackingDelegate = &self->_faceTrackingDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
    [v8 avatarRendererFaceTrackingSessionInterruptionDidEnd:self];
  }
}

- (void)_animateToNoTrackingState
{
  [(AVTRenderer *)self setFaceIsTracked:0];
  if (self->_enableFaceTrackingLossFeedback)
  {
    [(AVTAvatarEnvironment *)self->_environment setShowReticle:self->_enableReticle];
    objc_initWeak(&location, self);
    double v3 = [(AVTRenderer *)self avatar];
    v4 = +[AVTAvatarPose friendlyPose];
    [v3 animatePhysicsScaleFactor:0.0 duration:1.0];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __40__AVTRenderer__animateToNoTrackingState__block_invoke;
    v5[3] = &unk_264020B80;
    objc_copyWeak(&v6, &location);
    [v3 transitionToPose:v4 duration:v5 delay:1.0 completionHandler:0.0];
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
}

void __40__AVTRenderer__animateToNoTrackingState__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((unsigned char *)WeakRetained + 504))
  {
    v2 = WeakRetained;
    [WeakRetained[56] setEnablePhysicsSimulation:0];
    id WeakRetained = v2;
  }
}

- (void)clearOutAnimationToNoTrackingState
{
  if (self->_enableFaceTrackingLossFeedback)
  {
    [(AVTAvatarEnvironment *)self->_environment setShowReticle:0];
    id v3 = [(AVTRenderer *)self avatar];
    [v3 stopTransitionAnimation];
    [v3 animatePhysicsScaleFactor:1.0 duration:0.75];
    [v3 setPose:0];
    [(AVTAvatarEnvironment *)self->_environment setEnablePhysicsSimulation:1];
  }
}

- (BOOL)enableFaceTrackingLossFeedback
{
  return self->_enableFaceTrackingLossFeedback;
}

- (void)setEnableFaceTrackingLossFeedback:(BOOL)a3
{
  self->_enableFaceTrackingLossFeedback = a3;
}

- (BOOL)enableReticle
{
  return self->_enableReticle;
}

- (void)setEnableReticle:(BOOL)a3
{
  self->_enableReticle = a3;
  if ([(AVTAvatarEnvironment *)self->_environment showReticle] && !self->_enableReticle)
  {
    environment = self->_environment;
    [(AVTAvatarEnvironment *)environment setShowReticle:0];
  }
}

- (NSString)framingMode
{
  return [(AVTAvatarEnvironment *)self->_environment framingMode];
}

- (void)setFramingMode:(id)a3
{
}

- (void)setFramingModeForcingPointOfViewUpdate:(id)a3
{
}

- (unint64_t)avt_antialiasingMode
{
  return self->_antialiasingMode;
}

- (void)setAvt_antialiasingMode:(unint64_t)a3
{
  if (self->_antialiasingMode != a3)
  {
    self->_antialiasingMode = a3;
    [(AVTARMaskRenderer *)self->_arMaskRenderer setClearWithCamera:0 antialiasingMode:a3];
  }
}

- (void)setFaceTracker:(id)a3
{
  v5 = (AVTFaceTracker *)a3;
  faceTracker = self->_faceTracker;
  if (faceTracker != v5)
  {
    char v7 = v5;
    [(AVTFaceTracker *)faceTracker removeDelegate:self];
    objc_storeStrong((id *)&self->_faceTracker, a3);
    faceTracker = (AVTFaceTracker *)[(AVTFaceTracker *)self->_faceTracker addDelegate:self];
    v5 = v7;
  }
  MEMORY[0x270F9A758](faceTracker, v5);
}

- (AVTFaceTracker)faceTracker
{
  return self->_faceTracker;
}

- (BOOL)faceIsTracked
{
  return self->_faceIsTracked;
}

- (void)setFaceIsTracked:(BOOL)a3
{
  if (self->_faceIsTracked != a3)
  {
    BOOL v3 = a3;
    self->_faceIsTracked = a3;
    p_faceTrackingDelegate = &self->_faceTrackingDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
      [v8 avatarRenderer:self didUpdateWithFaceTrackingStatus:v3];
    }
  }
}

- (id)faceTrackingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
  return WeakRetained;
}

- (void)setFaceTrackingDelegate:(id)a3
{
  id obj = a3;
  p_faceTrackingDelegate = &self->_faceTrackingDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_faceTrackingDelegate);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_faceTrackingDelegate, obj);
    id v6 = obj;
  }
}

- (BOOL)captureImageIsTooDark
{
  return self->_captureImageIsTooDark;
}

- (void)setCaptureImageIsTooDark:(BOOL)a3
{
  if (self->_captureImageIsTooDark != a3)
  {
    BOOL v3 = a3;
    self->_captureImageIsTooDark = a3;
    p_faceTrackingDelegate = &self->_faceTrackingDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
      [v8 avatarRenderer:self didUpdateWithLowLightStatus:v3];
    }
  }
}

- (BOOL)isSensorCovered
{
  return self->_isSensorCovered;
}

- (void)setSensorCovered:(BOOL)a3
{
  if (self->_isSensorCovered != a3)
  {
    BOOL v3 = a3;
    self->_isSensorCovered = a3;
    p_faceTrackingDelegate = &self->_faceTrackingDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
      [v8 avatarRenderer:self didUpdateWithSensorOcclusionStatus:v3];
    }
  }
}

- (void)renderWithViewport:(CGRect)a3 commandBuffer:(id)a4 passDescriptor:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  id v12 = a4;
  -[AVTRenderer updateProjectionMatrixForARModeIfNeeded:](self, "updateProjectionMatrixForARModeIfNeeded:", width, height);
  v13.receiver = self;
  v13.super_class = (Class)AVTRenderer;
  -[AVTRenderer renderWithViewport:commandBuffer:passDescriptor:](&v13, sel_renderWithViewport_commandBuffer_passDescriptor_, v12, v11, x, y, width, height);
}

- (void)renderAtTime:(double)a3 viewport:(CGRect)a4 commandBuffer:(id)a5 passDescriptor:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  id v14 = a5;
  -[AVTRenderer updateProjectionMatrixForARModeIfNeeded:](self, "updateProjectionMatrixForARModeIfNeeded:", width, height);
  v15.receiver = self;
  v15.super_class = (Class)AVTRenderer;
  -[AVTRenderer renderAtTime:viewport:commandBuffer:passDescriptor:](&v15, sel_renderAtTime_viewport_commandBuffer_passDescriptor_, v14, v13, a3, x, y, width, height);
}

- (AVTPresentationConfiguration)presentationConfiguration
{
  return self->_presentationConfiguration;
}

- (void)setPresentationConfiguration:(id)a3
{
  v4 = (AVTPresentationConfiguration *)a3;
  if (!v4)
  {
    v4 = +[AVTClassicPresentationConfiguration sharedConfiguration];
  }
  p_presentationConfiguration = &self->_presentationConfiguration;
  if (self->_presentationConfiguration != v4)
  {
    objc_storeStrong((id *)&self->_presentationConfiguration, v4);
    uint64_t v6 = [(AVTPresentationConfiguration *)*p_presentationConfiguration usesAR];
    if (v6)
    {
      arMaskRenderer = self->_arMaskRenderer;
      if (arMaskRenderer)
      {
        [(AVTARMaskRenderer *)arMaskRenderer setPresentationConfiguration:v4];
      }
      else
      {
        objc_initWeak(&location, self);
        id v9 = [AVTARMaskRenderer alloc];
        uint64_t v13 = MEMORY[0x263EF8330];
        uint64_t v14 = 3221225472;
        objc_super v15 = __44__AVTRenderer_setPresentationConfiguration___block_invoke;
        double v16 = &unk_264020C70;
        objc_copyWeak(&v17, &location);
        double v10 = [(AVTARMaskRenderer *)v9 initWithOwner:self presentationConfiguration:v4 techniqueDidChangeHandler:&v13];
        id v11 = self->_arMaskRenderer;
        self->_arMaskRenderer = v10;

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      -[AVTARMaskRenderer setFlipDepth:](self->_arMaskRenderer, "setFlipDepth:", self->_arMaskRendererHasFlippedDepth, v13, v14, v15, v16);
      [(AVTARMaskRenderer *)self->_arMaskRenderer setClearWithCamera:0 antialiasingMode:self->_antialiasingMode];
    }
    else
    {
      [(AVTRenderer *)self setAvtRendererTechnique:0];
      id v8 = self->_arMaskRenderer;
      self->_arMaskRenderer = 0;
    }
    id v12 = &AVTFramingModeAR;
    if (!v6) {
      id v12 = AVTFramingModeCamera;
    }
    [(AVTRenderer *)self setFramingMode:*v12];
    [(AVTAvatarEnvironment *)self->_environment avatarDidChange:self->_avatar presentationConfiguration:*p_presentationConfiguration];
    [(AVTAvatar *)self->_avatar setPresentationConfiguration:*p_presentationConfiguration];
    [(AVTRenderer *)self _updatePhysicsWorldForAvatarARScaleAndARMode:v6];
  }
}

void __44__AVTRenderer_setPresentationConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setAvtRendererTechnique:v5];
  }
}

- (AVTAvatar)avatar
{
  return self->_avatar;
}

- (void)_detachAvatarFromRenderer
{
  avatar = self->_avatar;
  v4 = [(AVTRenderer *)self scene];
  [(AVTAvatar *)avatar willRemoveFromScene:v4];

  avatarNode = self->_avatarNode;
  [(SCNNode *)avatarNode removeFromParentNode];
}

- (void)__setAvatar:(id)a3
{
  p_avatar = &self->_avatar;
  uint64_t v13 = (AVTAvatar *)a3;
  if (*p_avatar != v13)
  {
    [MEMORY[0x263F16B08] begin];
    [MEMORY[0x263F16B08] setAnimationDuration:0.0];
    uint64_t v6 = [(AVTAvatar *)*p_avatar pose];
    [(AVTRenderer *)self lock];
    [(AVTRenderer *)self _detachAvatarFromRenderer];
    objc_storeStrong((id *)&self->_avatar, a3);
    char v7 = [(AVTAvatar *)v13 avatarNode];
    avatarNode = self->_avatarNode;
    self->_avatarNode = v7;

    id v9 = [(AVTRenderer *)self scene];
    double v10 = [v9 rootNode];
    [v10 addChildNode:self->_avatarNode];

    id v11 = *p_avatar;
    id v12 = [(AVTRenderer *)self scene];
    [(AVTAvatar *)v11 didAddToScene:v12];

    [(AVTAvatarEnvironment *)self->_environment avatarDidChange:*p_avatar presentationConfiguration:self->_presentationConfiguration];
    [(AVTAvatar *)*p_avatar setPresentationConfiguration:self->_presentationConfiguration];
    [(AVTRenderer *)self _updatePhysicsWorldForAvatarARScaleAndARMode:[(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR]];
    [(AVTRenderer *)self avatarDidChange];
    [(AVTRenderer *)self unlock];
    [(AVTAvatar *)*p_avatar setPose:v6];
    [MEMORY[0x263F16B08] commit];
  }
}

- (void)_setAvatar:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  [(AVTRenderer *)self __setAvatar:v4];

  kdebug_trace();
}

- (void)fadePuppetToWhite:(float)a3
{
}

- (BOOL)isWarmingUp
{
  return self->_warmingUp;
}

- (void)setWarmingUp:(BOOL)a3
{
  self->_warmingUp = a3;
}

- (void)_renderer:(id)a3 didApplyAnimationsAtTime:(double)a4
{
  id v8 = a3;
  uint64_t v6 = [(SCNNode *)self->_avatarNode scene];
  char v7 = [v8 scene];

  if (v6 == v7) {
    [(AVTAvatar *)self->_avatar updateAfterAnimationsEvaluatedAtTime:v8 renderer:a4];
  }
}

- (id)_renderer:(id)a3 subdivDataForHash:(id)a4
{
  id v4 = a4;
  +[AVTResourceLocator sharedResourceLocator]();
  id v5 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = -[AVTResourceLocator subdivDataCacheURL](v5);

  if (v6)
  {
    char v7 = [NSString stringWithFormat:@"%@.osddata", v4];
    id v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:0];

    id v9 = [MEMORY[0x263F08850] defaultManager];
    double v10 = [v8 path];
    int v11 = [v9 fileExistsAtPath:v10];

    if (v11)
    {
      id v12 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8 options:8 error:0];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)_renderer:(id)a3 didBuildSubdivDataForHash:(id)a4 dataProvider:(id)a5
{
  id v6 = a4;
  char v7 = (void (**)(void))a5;
  +[AVTResourceLocator sharedResourceLocator]();
  id v8 = (id *)objc_claimAutoreleasedReturnValue();
  id v9 = -[AVTResourceLocator subdivDataCacheURL](v8);

  if (v9)
  {
    double v10 = [NSString stringWithFormat:@"%@.osddata", v6];
    int v11 = [v9 URLByAppendingPathComponent:v10 isDirectory:0];

    id v12 = v7[2](v7);
    if (v12)
    {
      uint64_t v13 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __64__AVTRenderer__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke;
      block[3] = &unk_26401F5A8;
      double v16 = v12;
      id v17 = v11;
      dispatch_async(v13, block);

      uint64_t v14 = v16;
    }
    else
    {
      uint64_t v14 = avt_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AVTView _renderer:didBuildSubdivDataForHash:dataProvider:](v14);
      }
    }
  }
}

void __64__AVTRenderer__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v6 = 0;
  char v3 = [v2 writeToURL:v1 options:1 error:&v6];
  id v4 = v6;
  if ((v3 & 1) == 0)
  {
    id v5 = avt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60__AVTView__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke_cold_1(v4);
    }
  }
}

- (void)_renderer:(id)a3 updateAtTime:(double)a4
{
  avatarNode = self->_avatarNode;
  id v7 = a3;
  id v8 = [(SCNNode *)avatarNode scene];
  id v9 = [v7 scene];

  if (v8 == v9)
  {
    double v10 = [(AVTRenderer *)self avatar];
    [v10 update];

    [(AVTARMaskRenderer *)self->_arMaskRenderer updateMaskParametersAtTime:a4];
    if ([(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR])
    {
      arMaskRenderer = self->_arMaskRenderer;
      id v13 = [(AVTRenderer *)self avatar];
      id v12 = [v13 rootJointNode];
      [(AVTARMaskRenderer *)arMaskRenderer updateMaskParametersWithRootJointNode:v12];
    }
  }
}

- (void)crashAppExtensionOrViewService_rdar98130076:(id)a3
{
}

- (void)renderer:(id)a3 didFallbackToDefaultTextureForSource:(id)a4 message:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (AVTIsRunningInAppExtensionOrViewService())
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __69__AVTRenderer_renderer_didFallbackToDefaultTextureForSource_message___block_invoke;
    v21[3] = &unk_264020CC0;
    id v22 = v8;
    id v23 = v9;
    id v24 = v10;
    [(AVTRenderer *)self crashAppExtensionOrViewService_rdar98130076:v21];
  }
  int v11 = [v9 description];
  char v12 = [v11 containsString:@"onTopMask"];

  id v13 = avt_default_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);
  if (v12)
  {
    if (v14)
    {
      objc_super v15 = (objc_class *)objc_opt_class();
      double v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "-[AVTRenderer renderer:didFallbackToDefaultTextureForSource:message:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v8;
      *(_WORD *)&buf[32] = 2112;
      *(void *)&buf[34] = v9;
      *(_WORD *)&buf[42] = 2112;
      *(void *)&buf[44] = v10;
      _os_log_fault_impl(&dword_20B819000, v13, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Failed to find texture for source %@ with message:\n%@", buf, 0x34u);
    }
LABEL_10:

    return;
  }
  if (v14)
  {
    id v17 = (objc_class *)objc_opt_class();
    objc_super v18 = NSStringFromClass(v17);
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "-[AVTRenderer renderer:didFallbackToDefaultTextureForSource:message:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v8;
    *(_WORD *)&buf[32] = 2112;
    *(void *)&buf[34] = v9;
    *(_WORD *)&buf[42] = 2112;
    *(void *)&buf[44] = v10;
    _os_log_fault_impl(&dword_20B819000, v13, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Failed to find texture for source %@ with message:\n%@", buf, 0x34u);
  }
  if (!AVTLogAllowsInternalCrash()) {
    goto LABEL_10;
  }
  long long v36 = 0u;
  memset(buf, 0, sizeof(buf));
  os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  id v19 = (objc_class *)objc_opt_class();
  id v20 = NSStringFromClass(v19);
  int v25 = 136316162;
  v26 = "-[AVTRenderer renderer:didFallbackToDefaultTextureForSource:message:]";
  __int16 v27 = 2112;
  v28 = v20;
  __int16 v29 = 2048;
  id v30 = v8;
  __int16 v31 = 2112;
  id v32 = v9;
  __int16 v33 = 2112;
  id v34 = v10;
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

void __69__AVTRenderer_renderer_didFallbackToDefaultTextureForSource_message___block_invoke(void *a1)
{
  v2 = avt_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    char v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    LODWORD(buf[0]) = 136316162;
    *(void *)((char *)buf + 4) = "-[AVTRenderer renderer:didFallbackToDefaultTextureForSource:message:]_block_invoke";
    WORD6(buf[0]) = 2112;
    *(void *)((char *)buf + 14) = v4;
    WORD3(buf[1]) = 2048;
    *((void *)&buf[1] + 1) = v5;
    LOWORD(buf[2]) = 2112;
    *(void *)((char *)&buf[2] + 2) = v6;
    WORD5(buf[2]) = 2112;
    *(void *)((char *)&buf[2] + 12) = v7;
    _os_log_error_impl(&dword_20B819000, v2, OS_LOG_TYPE_ERROR, "Error: %s %@ %p: Failed to find texture for source %@ with message:\n%@", (uint8_t *)buf, 0x34u);
  }
  uint64_t v11 = 0;
  memset(buf, 0, sizeof(buf));
  os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

- (void)renderer:(id)a3 commandBufferDidCompleteWithError:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 error];
  if (AVTIsRunningInAppExtensionOrViewService())
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __58__AVTRenderer_renderer_commandBufferDidCompleteWithError___block_invoke;
    v25[3] = &unk_264020CC0;
    id v26 = v6;
    id v27 = v7;
    id v28 = v8;
    [(AVTRenderer *)self crashAppExtensionOrViewService_rdar98130076:v25];
  }
  if (v8)
  {
    id v9 = [v8 domain];
    id v10 = (void *)*MEMORY[0x263F125F0];

    if (v9 == v10 && [v8 code] == 7)
    {
      uint64_t v11 = avt_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        id v17 = (objc_class *)objc_opt_class();
        objc_super v18 = NSStringFromClass(v17);
        int v19 = [v7 status];
        id v20 = [v7 logs];
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = "-[AVTRenderer renderer:commandBufferDidCompleteWithError:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v6;
        LOWORD(v42) = 1024;
        *(_DWORD *)((char *)&v42 + 2) = v19;
        WORD3(v42) = 2112;
        *((void *)&v42 + 1) = v8;
        LOWORD(v43) = 2112;
        *(void *)((char *)&v43 + 2) = v20;
        _os_log_fault_impl(&dword_20B819000, v11, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", buf, 0x3Au);
      }
LABEL_12:

      return;
    }
  }
  char v12 = avt_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    id v13 = (objc_class *)objc_opt_class();
    BOOL v14 = NSStringFromClass(v13);
    int v15 = [v7 status];
    double v16 = [v7 logs];
    *(_DWORD *)buf = 136316418;
    *(void *)&buf[4] = "-[AVTRenderer renderer:commandBufferDidCompleteWithError:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v6;
    LOWORD(v42) = 1024;
    *(_DWORD *)((char *)&v42 + 2) = v15;
    WORD3(v42) = 2112;
    *((void *)&v42 + 1) = v8;
    LOWORD(v43) = 2112;
    *(void *)((char *)&v43 + 2) = v16;
    _os_log_fault_impl(&dword_20B819000, v12, OS_LOG_TYPE_FAULT, "Fault: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", buf, 0x3Au);
  }
  if (!AVTLogAllowsInternalCrash()) {
    goto LABEL_12;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  memset(buf, 0, sizeof(buf));
  os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  v21 = (objc_class *)objc_opt_class();
  id v22 = NSStringFromClass(v21);
  int v23 = [v7 status];
  id v24 = [v7 logs];
  int v29 = 136316418;
  id v30 = "-[AVTRenderer renderer:commandBufferDidCompleteWithError:]";
  __int16 v31 = 2112;
  id v32 = v22;
  __int16 v33 = 2048;
  id v34 = v6;
  __int16 v35 = 1024;
  int v36 = v23;
  __int16 v37 = 2112;
  v38 = v8;
  __int16 v39 = 2112;
  v40 = v24;
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

void __58__AVTRenderer_renderer_commandBufferDidCompleteWithError___block_invoke(uint64_t a1)
{
  v2 = avt_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    char v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = [*(id *)(a1 + 40) status];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [*(id *)(a1 + 40) logs];
    LODWORD(buf[0]) = 136316418;
    *(void *)((char *)buf + 4) = "-[AVTRenderer renderer:commandBufferDidCompleteWithError:]_block_invoke";
    WORD2(buf[1]) = 2112;
    *(void *)((char *)&buf[1] + 6) = v4;
    HIWORD(buf[2]) = 2048;
    buf[3] = v5;
    LOWORD(v13) = 1024;
    *(_DWORD *)((char *)&v13 + 2) = v6;
    WORD3(v13) = 2112;
    *((void *)&v13 + 1) = v7;
    LOWORD(v14) = 2112;
    *(void *)((char *)&v14 + 2) = v8;
    _os_log_error_impl(&dword_20B819000, v2, OS_LOG_TYPE_ERROR, "Error: %s %@ %p: Command buffer execution failed with status %d, error: %@\n%@", (uint8_t *)buf, 0x3Au);
  }
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  memset(buf, 0, sizeof(buf));
  os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  [*(id *)(a1 + 40) status];
  uint64_t v11 = [*(id *)(a1 + 40) logs];
  _os_log_send_and_compose_impl();

  _os_crash_msg();
  __break(1u);
}

- (AVTRendererTechnique)avtRendererTechnique
{
  return self->_avtRendererTechnique;
}

- (void)setAvtRendererTechnique:(id)a3
{
  uint64_t v5 = (AVTRendererTechnique *)a3;
  int v6 = [(AVTRendererTechnique *)v5 technique];
  if (self->_avtRendererTechnique != v5
    || (v9.receiver = self,
        v9.super_class = (Class)AVTRenderer,
        [(AVTRenderer *)&v9 technique],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7 != v6))
  {
    objc_storeStrong((id *)&self->_avtRendererTechnique, a3);
    v8.receiver = self;
    v8.super_class = (Class)AVTRenderer;
    [(AVTRenderer *)&v8 setTechnique:v6];
  }
}

- (id)technique
{
  v6.receiver = self;
  v6.super_class = (Class)AVTRenderer;
  char v3 = [(AVTRenderer *)&v6 technique];

  if (v3)
  {
    id v4 = avt_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AVTView technique](a2);
    }
  }
  return 0;
}

- (void)setTechnique:(id)a3
{
  if (a3)
  {
    id v4 = avt_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AVTView technique](a2);
    }
  }
}

- (BOOL)deprecated_ntk_isPaused
{
  v2 = [(AVTRenderer *)self scene];
  char v3 = [v2 isPaused];

  return v3;
}

- (void)deprecated_ntk_setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVTRenderer *)self scene];
  [v4 setPaused:v3];
}

- (void)deprecated_ntk_setPhysicsWorldTimeStep:(float)a3
{
  double v3 = a3;
  id v5 = [(AVTRenderer *)self scene];
  id v4 = [v5 physicsWorld];
  [v4 setTimeStep:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avtRendererTechnique, 0);
  objc_storeStrong((id *)&self->_arMaskRenderer, 0);
  objc_destroyWeak((id *)&self->_faceTrackingDelegate);
  objc_storeStrong((id *)&self->_faceTracker, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_avatarNode, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

+ (id)_cek_renderer
{
  return +[AVTRenderer renderer];
}

+ (id)_cek_rendererWithDevice:(id)a3 options:(id)a4
{
  return +[SCNRenderer rendererWithDevice:a3 options:a4];
}

- (void)_cek_beginTransaction
{
  [MEMORY[0x263F16B08] begin];
  v2 = (void *)MEMORY[0x263F16B08];
  [v2 setAnimationDuration:0.0];
}

- (void)_cek_commitTransaction
{
}

- (float)_cek_currentPointOfViewSensorHeight
{
  v2 = [(AVTRenderer *)self pointOfView];
  double v3 = [v2 camera];

  [v3 sensorHeight];
  float v5 = v4;

  return v5;
}

- (void)_cek_setCurrentPointOfViewFocalLength:(float)a3
{
  double v4 = [(AVTRenderer *)self pointOfView];
  id v5 = [v4 camera];

  [v5 setFocalLength:a3];
}

- (void)_cek_renderAtTime:(double)a3 enableAntialiasing:(BOOL)a4 viewport:(CGRect)a5 commandBuffer:(id)a6 passDescriptor:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  if (a4) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = a7;
  id v16 = a6;
  [(AVTRenderer *)self setAvt_antialiasingMode:v14];
  [MEMORY[0x263F16B08] flush];
  [(AVTRenderer *)self updateAtTime:a3];
  -[AVTRenderer renderWithViewport:commandBuffer:passDescriptor:](self, "renderWithViewport:commandBuffer:passDescriptor:", v16, v15, x, y, width, height);
}

- (void)_cek_fetchBlendshapeWeightsInHierarchyUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTRenderer *)self scene];
  objc_super v6 = [v5 rootNode];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__AVTRenderer_CameraEffectsKit___cek_fetchBlendshapeWeightsInHierarchyUsingBlock___block_invoke;
  v8[3] = &unk_264020D90;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateHierarchyUsingBlock:v8];
}

void __82__AVTRenderer_CameraEffectsKit___cek_fetchBlendshapeWeightsInHierarchyUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  double v3 = [v8 name];
  id v4 = v3;
  if (v3 && AVTMorphTargetNameDefinesPose(v3))
  {
    id v5 = [v8 presentationNode];
    objc_super v6 = [v5 morpher];
    id v7 = [v6 weights];

    if (v7) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)_cek_applyBlendshapeWeightsInHierarchyUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTRenderer *)self scene];
  objc_super v6 = [v5 rootNode];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__AVTRenderer_CameraEffectsKit___cek_applyBlendshapeWeightsInHierarchyUsingBlock___block_invoke;
  v8[3] = &unk_264020D90;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateHierarchyUsingBlock:v8];
}

void __82__AVTRenderer_CameraEffectsKit___cek_applyBlendshapeWeightsInHierarchyUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_super v6 = [v5 name];
  id v7 = v6;
  if (v6 && AVTMorphTargetNameDefinesPose(v6))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__AVTRenderer_CameraEffectsKit___cek_applyBlendshapeWeightsInHierarchyUsingBlock___block_invoke_2;
    v9[3] = &unk_264020DB8;
    id v10 = v5;
    (*(void (**)(uint64_t, void *, uint64_t, void *))(v8 + 16))(v8, v7, a3, v9);
  }
}

void __82__AVTRenderer_CameraEffectsKit___cek_applyBlendshapeWeightsInHierarchyUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 presentationNode];
  id v4 = [v5 morpher];
  [v4 setWeights:v3];
}

- (BOOL)enableDepthMask
{
  return [(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR];
}

- (void)setEnableDepthMask:(BOOL)a3 withFlippedDepth:(BOOL)a4
{
  BOOL v4 = a3;
  self->_arMaskRendererHasFlippedDepth = a4;
  [(AVTARMaskRenderer *)self->_arMaskRenderer setFlipDepth:a4];
  [(AVTRenderer *)self setArMode:v4];
}

- (void)setCapturedDepth:(id)a3
{
}

- (id)capturedDepth
{
  return [(AVTARMaskRenderer *)self->_arMaskRenderer capturedDepth];
}

- (void)arMode
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[AVTRenderer arMode]";
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: %s is deprecated - use AVTPresentationConfiguration instead", (uint8_t *)&v1, 0xCu);
}

- (void)setArMode:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[AVTRenderer setArMode:]";
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: %s is deprecated - use AVTPresentationConfiguration instead", (uint8_t *)&v1, 0xCu);
}

@end