@interface AVTView
- (AVTAvatar)avatar;
- (AVTAvatarEnvironment)environment;
- (AVTRendererTechnique)avtRendererTechnique;
- (AVTView)initWithCoder:(id)a3;
- (AVTView)initWithFrame:(CGRect)a3;
- (AVTView)initWithFrame:(CGRect)a3 options:(id)a4;
- (BOOL)allowTrackSmoothing;
- (BOOL)arMode;
- (BOOL)captureImageIsTooDark;
- (BOOL)directRetargetingMode;
- (BOOL)enableFaceTracking;
- (BOOL)enableReticle;
- (BOOL)faceIsFullyActive;
- (BOOL)faceIsTracked;
- (BOOL)faceTrackingIsPaused;
- (BOOL)isDoubleBuffered;
- (BOOL)isSensorCovered;
- (BOOL)rendersContinuously;
- (BOOL)showPerfHUD;
- (double)currentAudioTime;
- (double)currentlyRenderedTrackingDate;
- (id)_renderer:(id)a3 subdivDataForHash:(id)a4;
- (id)arSession;
- (id)faceTracker;
- (id)faceTrackingDelegate;
- (id)framingMode;
- (id)presentationConfiguration;
- (id)snapshotWithSize:(CGSize)a3;
- (id)snapshotWithSize:(CGSize)a3 scaleFactor:(float)a4;
- (id)snapshotWithSize:(CGSize)a3 scaleFactor:(float)a4 options:(id)a5;
- (id)technique;
- (void)_animateToNoTrackingStateShowingReticle:(BOOL)a3;
- (void)_avtCommonInit;
- (void)_avtUpdateRendersContinuously;
- (void)_cancelDelayedtrackingLoss;
- (void)_delayedTrackingLoss;
- (void)_disconnectRendererFromAllAvatars;
- (void)_disconnectRendererFromAvatar:(id)a3 avatarNode:(id)a4;
- (void)_drawAtTime:(double)a3;
- (void)_fireTrackingLoss;
- (void)_refreshPerfTimesInfo;
- (void)_renderer:(id)a3 didApplyAnimationsAtTime:(double)a4;
- (void)_renderer:(id)a3 didBuildSubdivDataForHash:(id)a4 dataProvider:(id)a5;
- (void)_renderer:(id)a3 updateAtTime:(double)a4;
- (void)_renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5;
- (void)_resetFaceToRandomPosition;
- (void)_transitionCoordinatorOutOfStickerConfigurationWithDuration:(double)a3 style:(unint64_t)a4 options:(unint64_t)a5;
- (void)_transitionCoordinatorToStickerConfiguration:(id)a3 duration:(double)a4 style:(unint64_t)a5 options:(unint64_t)a6;
- (void)_transitionToCustomFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 faceTrackingDidStartHandlerReceiverBlock:(id)a6 completionHandler:(id)a7;
- (void)_transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 completionHandler:(id)a6;
- (void)_updatePhysicsWorldForAvatarARScaleAndARMode:(BOOL)a3;
- (void)addAvatarPresentedOnScreenCallbackWithQueue:(id)a3 block:(id)a4;
- (void)arMode;
- (void)clearOutAnimationToNoTrackingState;
- (void)crashAppExtensionOrViewService_rdar98130076:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)faceTracker:(id)a3 session:(id)a4 didFailWithError:(id)a5;
- (void)faceTracker:(id)a3 sessionInterruptionEnded:(id)a4;
- (void)faceTracker:(id)a3 sessionWasInterrupted:(id)a4;
- (void)faceTrackerDidUpdate:(id)a3 withARFrame:(id)a4;
- (void)layoutSubviews;
- (void)lockAvatar;
- (void)renderer:(id)a3 commandBufferDidCompleteWithError:(id)a4;
- (void)renderer:(id)a3 didFallbackToDefaultTextureForSource:(id)a4 message:(id)a5;
- (void)setArMode:(BOOL)a3;
- (void)setAvatar:(id)a3;
- (void)setAvtRendererTechnique:(id)a3;
- (void)setCaptureImageIsTooDark:(BOOL)a3;
- (void)setDirectRetargetingMode:(BOOL)a3;
- (void)setEnableFaceTracking:(BOOL)a3;
- (void)setEnableFaceTracking:(BOOL)a3 bySkippingARFramesInsteadOfStopping:(BOOL)a4;
- (void)setEnableReticle:(BOOL)a3;
- (void)setFaceIsTracked:(BOOL)a3;
- (void)setFaceTracker:(id)a3;
- (void)setFaceTrackingDelegate:(id)a3;
- (void)setFaceTrackingPaused:(BOOL)a3;
- (void)setFramingMode:(id)a3;
- (void)setFramingMode:(id)a3 animationDuration:(double)a4;
- (void)setPresentationConfiguration:(id)a3;
- (void)setRendersContinuously:(BOOL)a3;
- (void)setSensorCovered:(BOOL)a3;
- (void)setShowPerfHUD:(BOOL)a3;
- (void)setTechnique:(id)a3;
- (void)setupOrientation;
- (void)technique;
- (void)transitionHelper;
- (void)transitionToCustomFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 faceTrackingDidStartHandlerReceiverBlock:(id)a6 completionHandler:(id)a7;
- (void)transitionToFaceTrackingWithDuration:(double)a3 completionHandler:(id)a4;
- (void)transitionToFaceTrackingWithDuration:(double)a3 enableBakedAnimations:(BOOL)a4 completionHandler:(id)a5;
- (void)transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 completionHandler:(id)a5;
- (void)transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 completionHandler:(id)a6;
- (void)transitionToPose:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)transitionToPose:(id)a3 duration:(double)a4 style:(unint64_t)a5 completionHandler:(id)a6;
- (void)transitionToStickerConfiguration:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)transitionToStickerConfiguration:(id)a3 duration:(double)a4 style:(unint64_t)a5 completionHandler:(id)a6;
- (void)unlockAvatar;
- (void)updateAtTime:(double)a3;
- (void)updateForChangedFaceTrackingPaused;
- (void)updateInterfaceOrientation;
- (void)updateProjectionMatrixForARModeIfNeeded:(CGSize)a3;
@end

@implementation AVTView

- (void)_avtCommonInit
{
  v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
  lock = self->_lock;
  self->_lock = v3;

  PerfTimesCreate(0x3Cu, (uint64_t)v19);
  long long v5 = v19[1];
  *(_OWORD *)&self->_perfTimes.lock._os_unfair_lock_opaque = v19[0];
  *(_OWORD *)&self->_perfTimes.current = v5;
  [(AVTView *)self setEnableReticle:1];
  v6 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [(AVTView *)self setBackgroundColor:v6];

  [(AVTView *)self setAntialiasingMode:2];
  [(AVTView *)self setFaceIsTracked:1];
  id v7 = objc_alloc(MEMORY[0x263F16AD8]);
  v8 = objc_msgSend(v7, "avt_init");
  [(AVTView *)self setScene:v8];

  v9 = [(AVTView *)self scene];
  v10 = [v9 physicsWorld];
  [v10 setSpeed:4.0];

  v11 = [AVTAvatarEnvironment alloc];
  v12 = [(AVTView *)self scene];
  v13 = [(AVTAvatarEnvironment *)v11 initAndInstallInScene:v12 renderer:self];
  environment = self->_environment;
  self->_environment = v13;

  v15 = objc_alloc_init(AVTFaceTracker);
  faceTracker = self->_faceTracker;
  self->_faceTracker = v15;

  v17 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v18 = [v17 userInterfaceIdiom];

  if (v18 != 1) {
    [(AVTFaceTracker *)self->_faceTracker setLimitRoll:1];
  }
  [(AVTFaceTracker *)self->_faceTracker setShouldConstrainHeadPose:1];
  [(AVTFaceTracker *)self->_faceTracker addDelegate:self];
  [(AVTView *)self setupOrientation];
  [(AVTView *)self setup];
  [(AVTView *)self set_wantsSceneRendererDelegationMessages:1];
  [(AVTView *)self set_resourceManagerMonitor:self];
  [(AVTView *)self set_commandBufferStatusMonitor:self];
  [(AVTView *)self _allowGPUBackgroundExecution];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(AVTView *)self _disconnectRendererFromAllAvatars];
  PerfTimesFree((uint64_t)&self->_perfTimes);
  [(AVTFaceTracker *)self->_faceTracker removeDelegate:self];
  v4.receiver = self;
  v4.super_class = (Class)AVTView;
  [(AVTView *)&v4 dealloc];
}

- (AVTView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  AVTInitializeShaderCache();
  v12.receiver = self;
  v12.super_class = (Class)AVTView;
  v10 = -[AVTView initWithFrame:options:](&v12, sel_initWithFrame_options_, v9, x, y, width, height);

  if (v10) {
    [(AVTView *)v10 _avtCommonInit];
  }
  return v10;
}

- (AVTView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  AVTInitializeShaderCache();
  v11.receiver = self;
  v11.super_class = (Class)AVTView;
  v8 = -[AVTView initWithFrame:options:](&v11, sel_initWithFrame_options_, 0, x, y, width, height);
  id v9 = v8;
  if (v8) {
    [(AVTView *)v8 _avtCommonInit];
  }
  return v9;
}

- (AVTView)initWithCoder:(id)a3
{
  id v4 = a3;
  AVTInitializeShaderCache();
  v7.receiver = self;
  v7.super_class = (Class)AVTView;
  long long v5 = [(AVTView *)&v7 initWithCoder:v4];

  if (v5) {
    [(AVTView *)v5 _avtCommonInit];
  }
  return v5;
}

- (void)lockAvatar
{
}

- (void)unlockAvatar
{
}

- (void)_updatePhysicsWorldForAvatarARScaleAndARMode:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [(AVTView *)self scene];
  id v11 = [v5 physicsWorld];

  [v11 scale];
  if (v6 != 100.0)
  {
    objc_super v7 = [(AVTView *)self avatar];
    double v8 = 1.0;
    if (v7)
    {
      id v9 = v11;
      if (v3)
      {
        objc_msgSend(v7, "arScale", 1.0);
        id v9 = v11;
        double v8 = (float)(1.0 / v10);
      }
    }
    else
    {
      id v9 = v11;
    }
    [v9 setScale:v8];
  }
}

- (BOOL)arMode
{
  if ((arMode_done_0 & 1) == 0)
  {
    arMode_done_0 = 1;
    BOOL v3 = avt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(AVTView *)v3 arMode];
    }
  }
  return [(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR];
}

- (void)setArMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ((setArMode__done_0 & 1) == 0)
  {
    setArMode__done_0 = 1;
    uint64_t v5 = avt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AVTView setArMode:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (v3)
  {
    v13 = objc_alloc_init(AVTAugmentedRealityPresentationConfiguration);
  }
  else
  {
    v13 = +[AVTClassicPresentationConfiguration sharedConfiguration];
  }
  v14 = v13;
  [(AVTView *)self setPresentationConfiguration:v13];
}

- (void)updateProjectionMatrixForARModeIfNeeded:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR]
    && ![(AVTAvatarEnvironment *)self->_environment showReticle]
    && width != 0.0
    && height != 0.0)
  {
    -[AVTFaceTracker projectionMatrixForViewportSize:zNear:zFar:](self->_faceTracker, "projectionMatrixForViewportSize:zNear:zFar:", width, height, 0.100000005, 100000.0);
    double v13 = v7;
    double v14 = v6;
    double v11 = v9;
    double v12 = v8;
    uint64_t v10 = [(AVTView *)self pointOfView];
    v15 = [v10 camera];

    objc_msgSend(v15, "avt_setSimdProjectionTransform:", v14, v13, v12, v11);
  }
}

- (void)_animateToNoTrackingStateShowingReticle:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVTView *)self setFaceIsTracked:0];
  BOOL v5 = self->_enableReticle && v3;
  [(AVTAvatarEnvironment *)self->_environment setShowReticle:v5];
  objc_initWeak(&location, self);
  double v6 = +[AVTAvatarPose friendlyPose];
  double v7 = [(AVTView *)self avatar];
  double v8 = v7;
  if (v7)
  {
    [v7 animatePhysicsScaleFactor:0.0 duration:1.0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__AVTView__animateToNoTrackingStateShowingReticle___block_invoke;
    v9[3] = &unk_264020B80;
    objc_copyWeak(&v10, &location);
    [v8 transitionToPose:v6 duration:v9 delay:1.0 completionHandler:0.0];
    objc_destroyWeak(&v10);
  }

  objc_destroyWeak(&location);
}

void __51__AVTView__animateToNoTrackingStateShowingReticle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained faceIsTracked] & 1) == 0)
  {
    v1 = [WeakRetained environment];
    [v1 setEnablePhysicsSimulation:0];
  }
}

- (void)clearOutAnimationToNoTrackingState
{
  [(AVTAvatarEnvironment *)self->_environment setShowReticle:0];
  id v3 = [(AVTView *)self avatar];
  if (v3)
  {
    [v3 stopTransitionAnimation];
    [v3 animatePhysicsScaleFactor:1.0 duration:0.75];
    [v3 setPose:0];
  }
  [(AVTAvatarEnvironment *)self->_environment setEnablePhysicsSimulation:1];
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

- (BOOL)allowTrackSmoothing
{
  return ![(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR];
}

- (void)updateAtTime:(double)a3
{
  BOOL v5 = [(AVTView *)self avatar];
  if (v5)
  {
    id v27 = v5;
    [(AVTARMaskRenderer *)self->_arMaskRenderer updateMaskParametersAtTime:a3];
    BOOL v6 = [(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR];
    if (v6)
    {
      arMaskRenderer = self->_arMaskRenderer;
      double v8 = [(AVTView *)self avatar];
      double v9 = [v8 rootJointNode];
      [(AVTARMaskRenderer *)arMaskRenderer updateMaskParametersWithRootJointNode:v9];

      id v10 = [(AVTView *)self renderer];
      [v10 _backingSize];
      -[AVTView updateProjectionMatrixForARModeIfNeeded:](self, "updateProjectionMatrixForARModeIfNeeded:");
    }
    [v27 update];
    if ([(AVTView *)self enableFaceTracking])
    {
      [(AVTFaceTracker *)self->_faceTracker beginQuery];
      double lastFaceTrackerUpdateTimestamp = self->_lastFaceTrackerUpdateTimestamp;
      [(AVTFaceTracker *)self->_faceTracker lastUpdateTimestamp];
      if (lastFaceTrackerUpdateTimestamp < v12)
      {
        [(AVTFaceTracker *)self->_faceTracker lastUpdateTimestamp];
        self->_double lastFaceTrackerUpdateTimestamp = v13;
      }
      double lastFaceTrackerUpdateWithTrackedFaceTimestamp = self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp;
      [(AVTFaceTracker *)self->_faceTracker lastUpdateWithTrackedFaceTimestamp];
      if (lastFaceTrackerUpdateWithTrackedFaceTimestamp >= v15)
      {
        if (self->_lastFaceTrackerUpdateTimestamp - self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp > 1.5
          && self->_faceIsTracked)
        {
          v22 = [(AVTFaceTracker *)self->_faceTracker arSession];
          uint64_t v23 = [v22 state];

          if (v23 == 1)
          {
            [(AVTView *)self _animateToNoTrackingStateShowingReticle:1];
            [(AVTView *)self _didLostTrackingForAWhile];
          }
        }
      }
      else
      {
        [(AVTFaceTracker *)self->_faceTracker lastUpdateWithTrackedFaceTimestamp];
        self->_double lastFaceTrackerUpdateWithTrackedFaceTimestamp = v16;
        v17 = [(AVTView *)self pointOfView];
        if (![(AVTView *)self faceIsTracked])
        {
          [(AVTView *)self setFaceIsTracked:1];
          [(AVTView *)self clearOutAnimationToNoTrackingState];
        }
        uint64_t v18 = [(AVTFaceTracker *)self->_faceTracker faceTrackingInfo];
        v19 = v18;
        if (v18)
        {
          [v18 timestamp];
          if (v20 >= self->_lastFaceTrackerUpdateWithTrackedFaceTimestamp)
          {
            BOOL v21 = !v6;
            if ([(AVTView *)self directRetargetingMode]
              || ![(AVTView *)self allowTrackSmoothing]
              || ([v27 isTransitioning] & 1) != 0)
            {
              [v27 applyHeadPoseWithTrackingInfo:v19 gazeCorrection:v21 pointOfView:v17];
            }
            else
            {
              [MEMORY[0x263F16B08] begin];
              [MEMORY[0x263F16B08] setAnimationDuration:0.05];
              v25 = (void *)MEMORY[0x263F16B08];
              v26 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
              [v25 setAnimationTimingFunction:v26];

              [v27 applyHeadPoseWithTrackingInfo:v19 gazeCorrection:v21 pointOfView:v17];
              [MEMORY[0x263F16B08] commit];
            }
            [v27 applyBlendShapesWithTrackingInfo:v19];
          }
        }
      }
      [(AVTFaceTracker *)self->_faceTracker faceTrackingFrameID];
      [(AVTFaceTracker *)self->_faceTracker endQuery];
      kdebug_trace();
      kdebug_trace();
      kdebug_trace();
    }
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_perfPacketUpdateTimestamp = v24;
    BOOL v5 = v27;
  }
}

- (void)_drawAtTime:(double)a3
{
  [(AVTView *)self lockAvatar];
  v9.receiver = self;
  v9.super_class = (Class)AVTView;
  [(AVTView *)&v9 _drawAtTime:a3];
  BOOL v5 = self->_avatar;
  [(AVTView *)self unlockAvatar];
  uint64_t v6 = [(AVTView *)self delegate];
  double v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 avatarView:self didRenderAvatar:v5];
  }
}

- (void)addAvatarPresentedOnScreenCallbackWithQueue:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(AVTView *)self renderer];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__AVTView_addAvatarPresentedOnScreenCallbackWithQueue_block___block_invoke;
  v11[3] = &unk_264020BA8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 _addGPUFramePresentedHandler:v11];
}

void __61__AVTView_addAvatarPresentedOnScreenCallbackWithQueue_block___block_invoke(uint64_t a1)
{
}

- (AVTAvatarEnvironment)environment
{
  return self->_environment;
}

- (void)_disconnectRendererFromAvatar:(id)a3 avatarNode:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(AVTView *)self scene];
  [v6 willRemoveFromScene:v7];

  [v8 removeFromParentNode];
}

- (void)_disconnectRendererFromAllAvatars
{
  avatar = self->_avatar;
  uint64_t v4 = [(AVTView *)self scene];
  [(AVTAvatar *)avatar willRemoveFromScene:v4];

  avatarNode = self->_avatarNode;
  [(SCNNode *)avatarNode removeFromParentNode];
}

- (void)setAvatar:(id)a3
{
  double v14 = (AVTAvatar *)a3;
  BOOL v5 = self->_avatar;
  id v6 = self->_avatarNode;
  if (v5 != v14)
  {
    [MEMORY[0x263F16B08] begin];
    [MEMORY[0x263F16B08] setAnimationDuration:0.0];
    id v7 = [(AVTAvatar *)v5 pose];
    [(AVTView *)self lockAvatar];
    [(AVTView *)self _disconnectRendererFromAvatar:v5 avatarNode:v6];
    id v8 = v14;
    id v9 = [(AVTAvatar *)v8 avatarNode];
    objc_storeStrong((id *)&self->_avatar, a3);
    objc_storeStrong((id *)&self->_avatarNode, v9);
    id v10 = [(AVTView *)self scene];
    double v11 = [v10 rootNode];
    [v11 addChildNode:v9];

    id v12 = [(AVTView *)self scene];
    [(AVTAvatar *)v8 didAddToScene:v12];

    [(AVTAvatarEnvironment *)self->_environment avatarDidChange:v8 presentationConfiguration:self->_presentationConfiguration];
    [(AVTView *)self _updatePhysicsWorldForAvatarARScaleAndARMode:[(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR]];
    [(AVTView *)self avatarDidChange];
    [(AVTView *)self unlockAvatar];
    [(AVTAvatar *)v8 setPose:v7];
    if (self->_enableReticle && ![(AVTView *)self faceIsTracked])
    {
      id v13 = +[AVTAvatarPose friendlyPose];
      [(AVTAvatar *)v8 setPose:v13];
    }
    [MEMORY[0x263F16B08] commit];
  }
}

- (AVTAvatar)avatar
{
  return self->_avatar;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AVTView;
  [(AVTView *)&v3 didMoveToWindow];
  [(AVTView *)self updateInterfaceOrientation];
}

- (void)setupOrientation
{
  [(AVTView *)self updateInterfaceOrientation];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__UIOrientationDidChangeNotification_ name:*MEMORY[0x263F1D048] object:0];
}

- (void)updateInterfaceOrientation
{
  id v3 = [(AVTView *)self window];

  if (v3)
  {
    id v5 = [(AVTView *)self window];
    uint64_t v4 = [v5 windowScene];
    -[AVTFaceTracker setInterfaceOrientation:](self->_faceTracker, "setInterfaceOrientation:", [v4 interfaceOrientation]);
  }
}

- (void)_fireTrackingLoss
{
  [(AVTView *)self _animateToNoTrackingStateShowingReticle:0];
  [(AVTView *)self _didLostTrackingForAWhile];
}

- (void)_delayedTrackingLoss
{
}

- (void)_cancelDelayedtrackingLoss
{
}

- (void)transitionHelper
{
  if (a1)
  {
    v2 = a1;
    id v3 = (void *)a1[90];
    if (!v3)
    {
      uint64_t v4 = -[AVTViewTransitionHelper initWithView:]((id *)[AVTViewTransitionHelper alloc], a1);
      id v5 = (void *)v2[90];
      v2[90] = v4;

      id v3 = (void *)v2[90];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)transitionToPose:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
}

- (void)transitionToPose:(id)a3 duration:(double)a4 style:(unint64_t)a5 completionHandler:(id)a6
{
  id v15 = a3;
  id v10 = a6;
  double v11 = self->_avatar;
  if (!v15)
  {
    id v15 = +[AVTAvatarPose neutralPose];
  }
  if (self->_enableFaceTracking)
  {
    [(AVTView *)self setEnableFaceTracking:0 bySkippingARFramesInsteadOfStopping:1];
    if (a4 <= 1.0) {
      double v12 = a4;
    }
    else {
      double v12 = 1.0;
    }
    [(AVTAvatar *)v11 animatePhysicsScaleFactor:1.0 duration:v12];
  }
  if (a5 - 1 > 4) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = qword_20B8902D8[a5 - 1];
  }
  -[AVTView transitionHelper](self);
  double v14 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v14, 0, v15, v13, v11, v10, 0, a4);
}

- (void)transitionToStickerConfiguration:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
}

- (void)transitionToStickerConfiguration:(id)a3 duration:(double)a4 style:(unint64_t)a5 completionHandler:(id)a6
{
  id v15 = a3;
  id v10 = a6;
  double v11 = self->_avatar;
  if (self->_enableFaceTracking)
  {
    [(AVTView *)self setEnableFaceTracking:0 bySkippingARFramesInsteadOfStopping:1];
    if (a4 <= 1.0) {
      double v12 = a4;
    }
    else {
      double v12 = 1.0;
    }
    [(AVTAvatar *)v11 animatePhysicsScaleFactor:0.0 duration:v12];
  }
  if (a5 - 1 > 4) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = qword_20B8902D8[a5 - 1];
  }
  -[AVTView transitionHelper](self);
  double v14 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v14, v15, 0, v13, v11, v10, 0, a4);
}

- (void)_transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = v9;
  if (self->_enableFaceTracking && !self->_faceTrackingPaused)
  {
    if (!v9) {
      goto LABEL_8;
    }
    if (self->_faceTrackerDidUpdateBlock)
    {
      v17 = avt_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[AVTView _transitionToFaceTrackingWithDuration:style:enableBakedAnimations:completionHandler:](v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    v25 = (void *)MEMORY[0x210539A20](v10);
    faceTrackerDidUpdateBlock = (AVTAvatar *)self->_faceTrackerDidUpdateBlock;
    self->_faceTrackerDidUpdateBlock = v25;
  }
  else
  {
    double v11 = self->_avatar;
    double v12 = [(AVTAvatar *)v11 pose];
    [(AVTAvatar *)v11 setPhysicsScaleFactor:0.0];
    [(AVTAvatar *)v11 transitionToPose:v12 duration:0 delay:3.40282347e38 completionHandler:0.0];
    [(AVTAvatar *)v11 setPose:0];
    objc_initWeak(&location, self);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __95__AVTView__transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke;
    v26[3] = &unk_264020BF8;
    objc_copyWeak(v30, &location);
    v30[1] = *(id *)&a3;
    faceTrackerDidUpdateBlock = v11;
    id v27 = faceTrackerDidUpdateBlock;
    BOOL v31 = a5;
    id v14 = v12;
    id v28 = v14;
    id v29 = v10;
    id v15 = (void *)MEMORY[0x210539A20](v26);
    id v16 = self->_faceTrackerDidUpdateBlock;
    self->_faceTrackerDidUpdateBlock = v15;

    if (self->_enableFaceTracking) {
      [(AVTView *)self setFaceTrackingPaused:0];
    }
    else {
      [(AVTView *)self setEnableFaceTracking:1];
    }

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);
  }
LABEL_8:
}

void __95__AVTView__transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    double v3 = 1.0;
    objc_msgSend(*(id *)(a1 + 32), "animatePhysicsScaleFactor:duration:", 1.0, fmax(*(double *)(a1 + 64), 0.75));
    if (!*(unsigned char *)(a1 + 72)) {
      double v3 = 0.0;
    }
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    double v6 = *(double *)(a1 + 64);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __95__AVTView__transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke_2;
    v8[3] = &unk_264020BD0;
    id v9 = *(id *)(a1 + 48);
    [v4 _transitionFromPose:v5 toPose:0 bakedAnimationBlendFactor:0 duration:0 delay:v8 timingFunction:v3 timingAnimation:v6 completionHandler:0.0];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

uint64_t __95__AVTView__transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transitionToFaceTrackingWithDuration:(double)a3 completionHandler:(id)a4
{
}

- (void)transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void)transitionToFaceTrackingWithDuration:(double)a3 enableBakedAnimations:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)transitionToFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a6;
  double v11 = self->_avatar;
  objc_initWeak(&location, self);
  if (a4 - 1 > 4) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = qword_20B8902D8[a4 - 1];
  }
  -[AVTView transitionHelper](self);
  unint64_t v13 = (id *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __94__AVTView_transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke;
  v15[3] = &unk_264020C20;
  objc_copyWeak(v17, &location);
  v17[1] = *(id *)&a3;
  v17[2] = (id)a4;
  BOOL v18 = a5;
  id v14 = v10;
  id v16 = v14;
  -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v13, 0, 0, v12, v11, 0, v15, a3);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __94__AVTView_transitionToFaceTrackingWithDuration_style_enableBakedAnimations_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _transitionToFaceTrackingWithDuration:*(void *)(a1 + 56) style:*(unsigned __int8 *)(a1 + 64) enableBakedAnimations:*(void *)(a1 + 32) completionHandler:*(double *)(a1 + 48)];
}

- (void)_transitionToCustomFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 faceTrackingDidStartHandlerReceiverBlock:(id)a6 completionHandler:(id)a7
{
  double v11 = (void (**)(id, void *))a6;
  id v12 = a7;
  unint64_t v13 = self->_avatar;
  id v14 = [(AVTAvatar *)v13 pose];
  [(AVTAvatar *)v13 setPhysicsScaleFactor:0.0];
  [(AVTAvatar *)v13 transitionToPose:v14 duration:0 delay:3.40282347e38 completionHandler:0.0];
  [(AVTAvatar *)v13 setPose:0];
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __142__AVTView__transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke;
  v18[3] = &unk_264020BF8;
  objc_copyWeak(v22, &location);
  BOOL v23 = a5;
  id v15 = v13;
  uint64_t v19 = v15;
  id v16 = v14;
  id v20 = v16;
  v22[1] = *(id *)&a3;
  id v17 = v12;
  id v21 = v17;
  v11[2](v11, v18);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
}

void __142__AVTView__transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 72)) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    double v6 = *(double *)(a1 + 64);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __142__AVTView__transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke_2;
    v8[3] = &unk_264020BD0;
    id v9 = *(id *)(a1 + 48);
    [v4 _transitionFromPose:v5 toPose:0 bakedAnimationBlendFactor:0 duration:0 delay:v8 timingFunction:v3 timingAnimation:v6 completionHandler:0.0];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

uint64_t __142__AVTView__transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transitionToCustomFaceTrackingWithDuration:(double)a3 style:(unint64_t)a4 enableBakedAnimations:(BOOL)a5 faceTrackingDidStartHandlerReceiverBlock:(id)a6 completionHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = self->_avatar;
  objc_initWeak(&location, self);
  if (a4 - 1 > 4) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = qword_20B8902D8[a4 - 1];
  }
  -[AVTView transitionHelper](self);
  id v16 = (id *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  _OWORD v19[2] = __141__AVTView_transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke;
  v19[3] = &unk_264020C48;
  objc_copyWeak(v22, &location);
  v22[1] = *(id *)&a3;
  id v22[2] = (id)a4;
  BOOL v23 = a5;
  id v17 = v12;
  id v20 = v17;
  id v18 = v13;
  id v21 = v18;
  -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v16, 0, 0, v15, v14, 0, v19, a3);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
}

void __141__AVTView_transitionToCustomFaceTrackingWithDuration_style_enableBakedAnimations_faceTrackingDidStartHandlerReceiverBlock_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _transitionToCustomFaceTrackingWithDuration:*(void *)(a1 + 64) style:*(unsigned __int8 *)(a1 + 72) enableBakedAnimations:*(void *)(a1 + 32) faceTrackingDidStartHandlerReceiverBlock:*(void *)(a1 + 40) completionHandler:*(double *)(a1 + 56)];
}

- (void)_transitionCoordinatorToStickerConfiguration:(id)a3 duration:(double)a4 style:(unint64_t)a5 options:(unint64_t)a6
{
  double v11 = self->_avatar;
  id v12 = a3;
  -[AVTView transitionHelper](self);
  id v13 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTViewTransitionHelper transitionCoordinatorToStickerConfiguration:duration:style:options:avatar:](v13, v12, a5, a6, v11, a4);
}

- (void)_transitionCoordinatorOutOfStickerConfigurationWithDuration:(double)a3 style:(unint64_t)a4 options:(unint64_t)a5
{
  id v9 = self->_avatar;
  -[AVTView transitionHelper](self);
  id v10 = (id *)objc_claimAutoreleasedReturnValue();
  -[AVTViewTransitionHelper transitionCoordinatorOutOfStickerConfigurationWithDuration:style:options:avatar:](v10, a4, a3, a5, v9);
}

- (void)faceTrackerDidUpdate:(id)a3 withARFrame:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v13 faceIsTracked])
  {
    self->_packetNeedRecording = 1;
    self->_droppedFrameCount = 0;
  }
  if ([(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR])
  {
    uint64_t v7 = [v6 capturedImage];
    if (v7) {
      [(SCNCaptureDeviceOutputConsumer *)self->_arCaptureDeviceOutputConsumer setPixelBuffer:v7];
    }
    arMaskRenderer = self->_arMaskRenderer;
    id v9 = [v13 fallBackDepthData];
    -[AVTARMaskRenderer updateWithARFrame:fallBackDepthData:captureOrientation:interfaceOrientation:mirroredDepthData:](arMaskRenderer, "updateWithARFrame:fallBackDepthData:captureOrientation:interfaceOrientation:mirroredDepthData:", v6, v9, 4, [v13 interfaceOrientation], 0);

    id v10 = [(AVTView *)self renderer];
    AVTApplyARGrainIfNeeded(v10, v6);
  }
  -[AVTView setCaptureImageIsTooDark:](self, "setCaptureImageIsTooDark:", [v13 lowLight]);
  -[AVTView setSensorCovered:](self, "setSensorCovered:", [v13 isSensorCovered]);
  faceTrackerDidUpdateBlock = (void (**)(void))self->_faceTrackerDidUpdateBlock;
  if (faceTrackerDidUpdateBlock)
  {
    faceTrackerDidUpdateBlock[2]();
    id v12 = self->_faceTrackerDidUpdateBlock;
    self->_faceTrackerDidUpdateBlock = 0;
  }
}

- (void)faceTracker:(id)a3 session:(id)a4 didFailWithError:(id)a5
{
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    [v8 avatarView:self faceTrackingSessionFailedWithError:v9];
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
    [v8 avatarViewFaceTrackingSessionInterruptionDidBegin:self];
  }
  [(AVTView *)self _delayedTrackingLoss];
}

- (void)faceTracker:(id)a3 sessionInterruptionEnded:(id)a4
{
  p_faceTrackingDelegate = &self->_faceTrackingDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_faceTrackingDelegate);
    [v8 avatarViewFaceTrackingSessionInterruptionDidEnd:self];
  }
  [(AVTView *)self _cancelDelayedtrackingLoss];
}

- (id)arSession
{
  return [(AVTFaceTracker *)self->_faceTracker arSession];
}

- (id)faceTracker
{
  return self->_faceTracker;
}

- (void)setFaceTracker:(id)a3
{
  uint64_t v4 = (AVTFaceTracker *)a3;
  [(AVTFaceTracker *)self->_faceTracker removeDelegate:self];
  faceTracker = self->_faceTracker;
  self->_faceTracker = v4;
  id v6 = v4;

  [(AVTFaceTracker *)self->_faceTracker addDelegate:self];
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
    if ([(AVTPresentationConfiguration *)self->_presentationConfiguration usesAR])
    {
      if (v3)
      {
        arMaskRenderer = self->_arMaskRenderer;
        double v6 = 1.0;
      }
      else
      {
        arMaskRenderer = 0;
        double v6 = 0.0;
      }
      [(AVTView *)self setAvtRendererTechnique:arMaskRenderer];
      [(SCNNode *)self->_avatarNode setOpacity:v6];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
      [v9 avatarView:self didUpdateWithFaceTrackingStatus:v3];
    }
  }
}

- (BOOL)faceTrackingIsPaused
{
  return self->_faceTrackingPaused;
}

- (void)setFaceTrackingPaused:(BOOL)a3
{
  if (self->_faceTrackingPaused != a3)
  {
    self->_faceTrackingPaused = a3;
    if (a3) {
      [(AVTView *)self setRendersContinuously:0];
    }
    else {
      [(AVTAvatarEnvironment *)self->_environment setEnablePhysicsSimulation:1];
    }
    [(AVTView *)self updateForChangedFaceTrackingPaused];
  }
}

- (void)updateForChangedFaceTrackingPaused
{
  BOOL v3 = [(AVTView *)self faceTrackingIsPaused];
  faceTracker = self->_faceTracker;
  if (v3)
  {
    [(AVTFaceTracker *)faceTracker pauseByPausingARSession];
  }
  else
  {
    [(AVTFaceTracker *)faceTracker run];
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

  double v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_faceTrackingDelegate, obj);
    double v6 = obj;
  }
}

- (BOOL)captureImageIsTooDark
{
  return self->_captureImageIsTooDark;
}

- (void)setCaptureImageIsTooDark:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_captureImageIsTooDark != a3)
  {
    BOOL v3 = a3;
    self->_captureImageIsTooDark = a3;
    uint64_t v5 = avt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_20B819000, v5, OS_LOG_TYPE_DEFAULT, "lowLight status changed: %d", (uint8_t *)v9, 8u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
      [v8 avatarView:self didUpdateWithLowLightStatus:v3];
    }
  }
}

- (BOOL)isSensorCovered
{
  return self->_isSensorCovered;
}

- (void)setSensorCovered:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->_isSensorCovered != a3)
  {
    BOOL v3 = a3;
    self->_isSensorCovered = a3;
    uint64_t v5 = avt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_20B819000, v5, OS_LOG_TYPE_DEFAULT, "sensorCovered status changed: %d", (uint8_t *)v9, 8u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_faceTrackingDelegate);
      [v8 avatarView:self didUpdateWithSensorOcclusionStatus:v3];
    }
  }
}

- (BOOL)enableFaceTracking
{
  return self->_enableFaceTracking;
}

- (void)setEnableFaceTracking:(BOOL)a3
{
}

- (void)setEnableFaceTracking:(BOOL)a3 bySkippingARFramesInsteadOfStopping:(BOOL)a4
{
  if (self->_enableFaceTracking == a3) {
    return;
  }
  BOOL v4 = a3;
  faceTracker = self->_faceTracker;
  if (!a3)
  {
    if (a4) {
      [(AVTFaceTracker *)faceTracker pauseBySkippingARFrames];
    }
    else {
      [(AVTFaceTracker *)faceTracker stop];
    }
    goto LABEL_8;
  }
  [(AVTFaceTracker *)faceTracker run];
  if (![(AVTView *)self enableReticle])
  {
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = [(AVTView *)self faceIsTracked] ^ 1;
LABEL_9:
  [(AVTAvatarEnvironment *)self->_environment setShowReticle:v7];
  self->_enableFaceTracking = v4;
  [(AVTView *)self setRendersContinuously:v4];
}

- (BOOL)directRetargetingMode
{
  return self->_directRetargetingMode;
}

- (void)setDirectRetargetingMode:(BOOL)a3
{
  self->_directRetargetingMode = a3;
}

- (BOOL)faceIsFullyActive
{
  v2 = [(AVTView *)self environment];
  char v3 = [v2 faceIsFullyVisible];

  return v3;
}

- (void)_resetFaceToRandomPosition
{
  id v2 = [(AVTView *)self avatar];
  [v2 _resetFaceToRandomPosition];
}

- (id)presentationConfiguration
{
  return self->_presentationConfiguration;
}

- (void)setPresentationConfiguration:(id)a3
{
  uint64_t v5 = (AVTPresentationConfiguration *)a3;
  p_presentationConfiguration = &self->_presentationConfiguration;
  if (self->_presentationConfiguration != v5)
  {
    objc_storeStrong((id *)&self->_presentationConfiguration, a3);
    uint64_t v7 = [(AVTPresentationConfiguration *)*p_presentationConfiguration usesAR];
    id v8 = &AVTFramingModeAR;
    if (!v7) {
      id v8 = AVTFramingModeCamera;
    }
    [(AVTView *)self setFramingMode:*v8];
    id v9 = [(AVTView *)self renderer];
    AVTSetARCompositingEnabled(v9, v7);

    if (v7)
    {
      uint64_t v10 = [MEMORY[0x263F16A88] captureDeviceOutputConsumer];
    }
    else
    {
      uint64_t v10 = 0;
    }
    objc_storeStrong((id *)&self->_arCaptureDeviceOutputConsumer, v10);
    if (v7) {

    }
    arCaptureDeviceOutputConsumer = self->_arCaptureDeviceOutputConsumer;
    id v12 = [(AVTView *)self scene];
    id v13 = [v12 background];
    [v13 setContents:arCaptureDeviceOutputConsumer];

    [(AVTFaceTracker *)self->_faceTracker setShouldConstrainHeadPose:v7 ^ 1];
    [(AVTFaceTracker *)self->_faceTracker setWantsPersonSegmentation:v7];
    [(AVTAvatarEnvironment *)self->_environment avatarDidChange:self->_avatar presentationConfiguration:*p_presentationConfiguration];
    [(AVTAvatar *)self->_avatar setPresentationConfiguration:*p_presentationConfiguration];
    arMaskRenderer = self->_arMaskRenderer;
    if ((v7 ^ 1))
    {
      self->_arMaskRenderer = 0;
    }
    else
    {
      if (arMaskRenderer)
      {
        [(AVTARMaskRenderer *)arMaskRenderer setPresentationConfiguration:v5];
      }
      else
      {
        objc_initWeak(&location, self);
        unint64_t v15 = [AVTARMaskRenderer alloc];
        uint64_t v18 = MEMORY[0x263EF8330];
        uint64_t v19 = 3221225472;
        id v20 = __40__AVTView_setPresentationConfiguration___block_invoke;
        id v21 = &unk_264020C70;
        objc_copyWeak(&v22, &location);
        id v16 = [(AVTARMaskRenderer *)v15 initWithOwner:self presentationConfiguration:v5 techniqueDidChangeHandler:&v18];
        id v17 = self->_arMaskRenderer;
        self->_arMaskRenderer = v16;

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
      [(AVTARMaskRenderer *)self->_arMaskRenderer setClearWithCamera:1 antialiasingMode:[(AVTView *)self antialiasingMode]];
    }
    [(AVTView *)self _updatePhysicsWorldForAvatarARScaleAndARMode:v7];
    [(AVTView *)self updateForMultiAvatarPositioningStyle];
  }
}

void __40__AVTView_setPresentationConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained faceIsTracked]) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
    [v4 setAvtRendererTechnique:v5];
  }
}

- (id)framingMode
{
  return [(AVTAvatarEnvironment *)self->_environment framingMode];
}

- (void)setFramingMode:(id)a3
{
}

- (void)setFramingMode:(id)a3 animationDuration:(double)a4
{
}

- (id)snapshotWithSize:(CGSize)a3
{
  LODWORD(v3) = 2.0;
  return -[AVTView snapshotWithSize:scaleFactor:](self, "snapshotWithSize:scaleFactor:", a3.width, a3.height, v3);
}

- (id)snapshotWithSize:(CGSize)a3 scaleFactor:(float)a4
{
  return [(AVTView *)self snapshotWithSize:MEMORY[0x263EFFA78] scaleFactor:a3.width options:a3.height];
}

- (id)snapshotWithSize:(CGSize)a3 scaleFactor:(float)a4 options:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  uint64_t v10 = [(AVTView *)self scene];

  if (v10)
  {
    kdebug_trace();
    [(AVTAvatarEnvironment *)self->_environment willSnapshot];
    [(AVTView *)self lockAvatar];
    double v11 = [MEMORY[0x263F16AC8] rendererWithDevice:0 options:0];
    id v12 = [(AVTView *)self scene];
    [v11 setScene:v12];

    id v13 = [MEMORY[0x263F1C550] clearColor];
    [v11 setBackgroundColor:v13];

    [(AVTView *)self sceneTime];
    objc_msgSend(v11, "setSceneTime:");
    id v14 = [v9 valueForKey:@"AVTViewSnapshotDisableSuperSamplingFactorKey"];
    char v15 = [v14 BOOLValue];

    if ((v15 & 1) == 0) {
      objc_msgSend(v11, "set_superSamplingFactor:", 1.5);
    }
    id v16 = [(AVTView *)self _resourceManagerMonitor];
    objc_msgSend(v11, "set_resourceManagerMonitor:", v16);

    id v17 = [(AVTView *)self _commandBufferStatusMonitor];
    objc_msgSend(v11, "set_commandBufferStatusMonitor:", v17);

    [v11 _allowGPUBackgroundExecution];
    [MEMORY[0x263F16B08] flush];
    [MEMORY[0x263F16B08] lock];
    uint64_t v18 = objc_msgSend(v11, "snapshotAtTime:withSize:antialiasingMode:", 2, CACurrentMediaTime(), width * a4, height * a4);
    uint64_t v19 = v18;
    if (a4 != 1.0)
    {
      id v20 = (void *)MEMORY[0x263F1C6B0];
      id v21 = v18;
      uint64_t v19 = objc_msgSend(v20, "imageWithCGImage:scale:orientation:", objc_msgSend(v21, "CGImage"), 0, a4);
    }
    [(AVTAvatarEnvironment *)self->_environment didSnapshot];
    [MEMORY[0x263F16B08] unlock];
    [(AVTView *)self unlockAvatar];
    kdebug_trace();
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (void)_renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SCNNode *)self->_avatarNode scene];
  uint64_t v10 = [v7 scene];

  if (v9 == v10)
  {
    if (self->_packetNeedRecording)
    {
      double v11 = [v7 currentRenderCommandEncoder];
      id v12 = [v11 commandBuffer];

      [(AVTFaceTracker *)self->_faceTracker arFrameTimestamp];
      id v14 = v13;
      [(AVTFaceTracker *)self->_faceTracker arDelegateTimestamp];
      id v16 = v15;
      self->_packetNeedRecording = 0;
      double lastFaceTrackerUpdateTimestamp = self->_lastFaceTrackerUpdateTimestamp;
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __44__AVTView__renderer_willRenderScene_atTime___block_invoke;
      v18[3] = &unk_264020C98;
      v19[1] = *(id *)&lastFaceTrackerUpdateTimestamp;
      objc_copyWeak(v19, &location);
      _OWORD v19[2] = v14;
      v19[3] = v16;
      void v18[4] = self;
      [v12 addCompletedHandler:v18];
      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }
    else
    {
      ++self->_droppedFrameCount;
    }
  }
}

void __44__AVTView__renderer_willRenderScene_atTime___block_invoke(uint64_t a1)
{
  kdebug_trace();
  kdebug_trace();
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v3 = *(double *)(a1 + 64);
    double v4 = v3 - *(double *)(a1 + 56);
    double v5 = *(double *)(*(void *)(a1 + 32) + 760) - v3;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v7 = v6 - *(double *)(*(void *)(a1 + 32) + 760);
    *(double *)&long long v8 = v4;
    *((double *)&v8 + 1) = v5;
    double v9 = v7;
    PerfTimesPush(WeakRetained + 182, &v8);
  }
}

- (double)currentlyRenderedTrackingDate
{
  return self->_lastFaceTrackerUpdateTimestamp;
}

- (BOOL)showPerfHUD
{
  return self->_showPerfHUD;
}

- (void)setShowPerfHUD:(BOOL)a3
{
  self->_showPerfHUD = a3;
  p_perfTimeRefreshTimer = &self->_perfTimeRefreshTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_perfTimeRefreshTimer);
  [WeakRetained invalidate];

  if (self->_showPerfHUD)
  {
    SCNSetShaderCollectionEnabled();
    SCNSetPerformanceStatisticsEnabled();
    double v6 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__refreshPerfTimesInfo selector:0 userInfo:1 repeats:1.0];
    objc_storeWeak((id *)p_perfTimeRefreshTimer, v6);

    if (!self->_debugView)
    {
      double v7 = -[AVTHUDView initWithFrame:]([AVTHUDView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
      debugView = self->_debugView;
      self->_debugView = v7;

      [(AVTView *)self addSubview:self->_debugView];
    }
  }
  [(AVTHUDView *)self->_debugView setHidden:!self->_showPerfHUD];
  SCNSetPerformanceStatisticsEnabled();
}

- (void)_refreshPerfTimesInfo
{
  p_perfTimes = &self->_perfTimes;
  double v4 = PerfTimesAverageLatency((uint64_t)&self->_perfTimes);
  double v5 = PerfTimesAverageLatencyForKind((uint64_t)p_perfTimes, 0);
  double v6 = PerfTimesAverageLatencyForKind((uint64_t)p_perfTimes, 1);
  double v7 = PerfTimesAverageLatencyForKind((uint64_t)p_perfTimes, 2);
  long long v34 = 0u;
  memset(v35, 0, sizeof(v35));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  SCNGetPerformanceStatistics();
  [(AVTView *)self currentAudioTime];
  uint64_t v9 = v8;
  [(AVTFaceTracker *)self->_faceTracker arFrameDeltaTime];
  uint64_t v11 = v10;
  int droppedFrameCount = self->_droppedFrameCount;
  BOOL v13 = [(AVTView *)self isDoubleBuffered];
  id v14 = SCNGetShaderCollectionOutputURL();
  char v15 = [v14 path];

  id v16 = [MEMORY[0x263F08850] defaultManager];
  id v17 = [v16 contentsOfDirectoryAtPath:v15 error:0];
  int v18 = [v17 count];

  debugView = self->_debugView;
  *(double *)id v20 = v4;
  *(double *)&v20[1] = v5;
  *(double *)&v20[2] = v6;
  *(double *)&v20[3] = v7;
  v20[4] = v11;
  int v21 = 0;
  int v22 = 0;
  uint64_t v23 = v9;
  int v24 = droppedFrameCount;
  BOOL v25 = v13;
  __int16 v26 = 0;
  char v27 = 0;
  int v28 = v18;
  int v29 = 0;
  [(AVTHUDView *)debugView updateWithData:v20];
}

- (BOOL)isDoubleBuffered
{
  return 0;
}

- (double)currentAudioTime
{
  return 0.0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVTView;
  [(AVTView *)&v3 layoutSubviews];
  if ([(AVTView *)self showPerfHUD])
  {
    [(AVTView *)self bounds];
    -[AVTHUDView setFrame:](self->_debugView, "setFrame:", 0.0, 0.0);
  }
}

- (void)_renderer:(id)a3 didApplyAnimationsAtTime:(double)a4
{
  id v8 = a3;
  double v6 = [(SCNNode *)self->_avatarNode scene];
  double v7 = [v8 scene];

  if (v6 == v7) {
    [(AVTAvatar *)self->_avatar updateAfterAnimationsEvaluatedAtTime:v8 renderer:a4];
  }
}

- (void)_renderer:(id)a3 updateAtTime:(double)a4
{
  avatarNode = self->_avatarNode;
  id v7 = a3;
  id v8 = [(SCNNode *)avatarNode scene];
  uint64_t v9 = [v7 scene];

  if (v8 == v9)
  {
    [(AVTView *)self updateAtTime:a4];
  }
}

- (id)_renderer:(id)a3 subdivDataForHash:(id)a4
{
  id v4 = a4;
  +[AVTResourceLocator sharedResourceLocator]();
  double v5 = (id *)objc_claimAutoreleasedReturnValue();
  double v6 = -[AVTResourceLocator subdivDataCacheURL](v5);

  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"%@.osddata", v4];
    id v8 = [v6 URLByAppendingPathComponent:v7 isDirectory:0];

    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v10 = [v8 path];
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
  id v7 = (void (**)(void))a5;
  +[AVTResourceLocator sharedResourceLocator]();
  id v8 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = -[AVTResourceLocator subdivDataCacheURL](v8);

  if (v9)
  {
    uint64_t v10 = [NSString stringWithFormat:@"%@.osddata", v6];
    int v11 = [v9 URLByAppendingPathComponent:v10 isDirectory:0];

    id v12 = v7[2](v7);
    if (v12)
    {
      BOOL v13 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__AVTView__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke;
      block[3] = &unk_26401F5A8;
      id v16 = v12;
      id v17 = v11;
      dispatch_async(v13, block);

      id v14 = v16;
    }
    else
    {
      id v14 = avt_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AVTView _renderer:didBuildSubdivDataForHash:dataProvider:](v14);
      }
    }
  }
}

void __60__AVTView__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v6 = 0;
  char v3 = [v2 writeToURL:v1 options:1 error:&v6];
  id v4 = v6;
  if ((v3 & 1) == 0)
  {
    double v5 = avt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60__AVTView__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke_cold_1(v4);
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
    v21[2] = __65__AVTView_renderer_didFallbackToDefaultTextureForSource_message___block_invoke;
    v21[3] = &unk_264020CC0;
    id v22 = v8;
    id v23 = v9;
    id v24 = v10;
    [(AVTView *)self crashAppExtensionOrViewService_rdar98130076:v21];
  }
  int v11 = [v9 description];
  char v12 = [v11 containsString:@"onTopMask"];

  BOOL v13 = avt_default_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_FAULT);
  if (v12)
  {
    if (v14)
    {
      char v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "-[AVTView renderer:didFallbackToDefaultTextureForSource:message:]";
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
    int v18 = NSStringFromClass(v17);
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "-[AVTView renderer:didFallbackToDefaultTextureForSource:message:]";
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
  uint64_t v19 = (objc_class *)objc_opt_class();
  id v20 = NSStringFromClass(v19);
  int v25 = 136316162;
  __int16 v26 = "-[AVTView renderer:didFallbackToDefaultTextureForSource:message:]";
  __int16 v27 = 2112;
  int v28 = v20;
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

void __65__AVTView_renderer_didFallbackToDefaultTextureForSource_message___block_invoke(void *a1)
{
  id v2 = avt_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    char v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    LODWORD(buf[0]) = 136316162;
    *(void *)((char *)buf + 4) = "-[AVTView renderer:didFallbackToDefaultTextureForSource:message:]_block_invoke";
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
    v25[2] = __54__AVTView_renderer_commandBufferDidCompleteWithError___block_invoke;
    v25[3] = &unk_264020CC0;
    id v26 = v6;
    id v27 = v7;
    id v28 = v8;
    [(AVTView *)self crashAppExtensionOrViewService_rdar98130076:v25];
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
        int v18 = NSStringFromClass(v17);
        int v19 = [v7 status];
        id v20 = [v7 logs];
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = "-[AVTView renderer:commandBufferDidCompleteWithError:]";
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
    BOOL v13 = (objc_class *)objc_opt_class();
    BOOL v14 = NSStringFromClass(v13);
    int v15 = [v7 status];
    id v16 = [v7 logs];
    *(_DWORD *)buf = 136316418;
    *(void *)&buf[4] = "-[AVTView renderer:commandBufferDidCompleteWithError:]";
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
  int v21 = (objc_class *)objc_opt_class();
  id v22 = NSStringFromClass(v21);
  int v23 = [v7 status];
  id v24 = [v7 logs];
  int v29 = 136316418;
  id v30 = "-[AVTView renderer:commandBufferDidCompleteWithError:]";
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

void __54__AVTView_renderer_commandBufferDidCompleteWithError___block_invoke(uint64_t a1)
{
  id v2 = avt_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    char v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = [*(id *)(a1 + 40) status];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [*(id *)(a1 + 40) logs];
    LODWORD(buf[0]) = 136316418;
    *(void *)((char *)buf + 4) = "-[AVTView renderer:commandBufferDidCompleteWithError:]_block_invoke";
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

- (BOOL)rendersContinuously
{
  return self->_avtRendersContinuously;
}

- (void)setRendersContinuously:(BOOL)a3
{
  self->_avtRendersContinuousldouble y = a3;
  [(AVTView *)self _avtUpdateRendersContinuously];
}

- (void)_avtUpdateRendersContinuously
{
  BOOL v2 = self->_avtRendersContinuously || self->_avtRendererTechnique != 0;
  v3.receiver = self;
  v3.super_class = (Class)AVTView;
  [(AVTView *)&v3 setRendersContinuously:v2];
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
        v9.super_class = (Class)AVTView,
        [(AVTView *)&v9 technique],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7 != v6))
  {
    objc_storeStrong((id *)&self->_avtRendererTechnique, a3);
    v8.receiver = self;
    v8.super_class = (Class)AVTView;
    [(AVTView *)&v8 setTechnique:v6];
  }
}

- (id)technique
{
  v6.receiver = self;
  v6.super_class = (Class)AVTView;
  objc_super v3 = [(AVTView *)&v6 technique];

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_destroyWeak((id *)&self->_perfTimeRefreshTimer);
  objc_storeStrong((id *)&self->_transitionHelper, 0);
  objc_storeStrong((id *)&self->_avtRendererTechnique, 0);
  objc_storeStrong((id *)&self->_arMaskRenderer, 0);
  objc_storeStrong((id *)&self->_avatarNode, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_arCaptureDeviceOutputConsumer, 0);
  objc_storeStrong(&self->_faceTrackerDidUpdateBlock, 0);
  objc_destroyWeak((id *)&self->_faceTrackingDelegate);
  objc_storeStrong((id *)&self->_faceTracker, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (void)arMode
{
}

- (void)setArMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_transitionToFaceTrackingWithDuration:(uint64_t)a3 style:(uint64_t)a4 enableBakedAnimations:(uint64_t)a5 completionHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_renderer:(os_log_t)log didBuildSubdivDataForHash:dataProvider:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: Error while writing subdiv data (data provider returned nil)", v1, 2u);
}

void __60__AVTView__renderer_didBuildSubdivDataForHash_dataProvider___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3(&dword_20B819000, v2, v3, "Error: Error while writing subdiv data: %@", v4, v5, v6, v7, 2u);
}

- (void)technique
{
  uint64_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_3(&dword_20B819000, v2, v3, "Error: Unreachable code: %@ is not supported on AVTView", v4, v5, v6, v7, 2u);
}

@end