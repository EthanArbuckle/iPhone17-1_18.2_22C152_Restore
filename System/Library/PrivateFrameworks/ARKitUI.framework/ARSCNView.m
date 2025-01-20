@interface ARSCNView
- (ARAnchor)anchorForNode:(SCNNode *)node;
- (ARFrame)currentRenderFrame;
- (ARRaycastQuery)raycastQueryFromPoint:(CGPoint)point allowingTarget:(ARRaycastTarget)target alignment:(ARRaycastTargetAlignment)alignment;
- (ARSCNView)initWithCoder:(id)a3;
- (ARSCNView)initWithFrame:(CGRect)a3;
- (ARSCNView)initWithFrame:(CGRect)a3 options:(id)a4;
- (ARSession)session;
- (BOOL)automaticallyOccludesVirtualContent;
- (BOOL)automaticallyUpdatesLighting;
- (BOOL)drawsCameraImage;
- (BOOL)graduallyUpdateAnchors;
- (BOOL)providesOcclusionGeometry;
- (BOOL)rendersCameraGrain;
- (BOOL)rendersMotionBlur;
- (BOOL)runningWithSegmentation;
- (BOOL)segmentationUseEstimatedDepthData;
- (BOOL)shouldRestrictFrameRate;
- (NSArray)hitTest:(CGPoint)point types:(ARHitTestResultType)types;
- (NSString)description;
- (SCNNode)nodeForAnchor:(ARAnchor *)anchor;
- (__CVBuffer)_warpPixelBuffer:(__CVBuffer *)a3 withCamera:(id)a4;
- (double)lastFrameTimestamp;
- (id)_anchorForNode:(id)a3 inFrame:(id)a4;
- (id)_hitTest:(CGPoint)a3 frame:(id)a4 types:(unint64_t)a5;
- (id)compositor;
- (id)occlusionGeometryNodeForAnchor:(id)a3;
- (int64_t)actualPreferredFramesPerSecond;
- (int64_t)compositorAlgorithm;
- (int64_t)developerPreferredFramesPerSecond;
- (int64_t)frameToRemoveRotationSnapshotOn;
- (int64_t)preferredFramesPerSecond;
- (int64_t)rotationSnapshotState;
- (int64_t)targetFramesPerSecond;
- (simd_float3)unprojectPoint:(CGPoint)point ontoPlaneWithTransform:(simd_float4x4)planeTransform;
- (unint64_t)debugOptions;
- (unint64_t)occlusionExcludedBitMask;
- (void)_addAnchors:(id)a3;
- (void)_addOcclusionGeometryForAnchor:(id)a3;
- (void)_commonInit;
- (void)_forceUpdateCamera;
- (void)_loadWarpKernalForLensType:(unint64_t)a3;
- (void)_removeAnchors:(id)a3;
- (void)_renderCapturedPixelBuffer:(__CVBuffer *)a3;
- (void)_renderer:(id)a3 updateAtTime:(double)a4;
- (void)_updateAnchors:(id)a3 frame:(id)a4;
- (void)_updateBackingSize;
- (void)_updateCamera:(id)a3;
- (void)_updateDebugVisualization:(id)a3;
- (void)_updateFramesPerSecondWithTarget:(int64_t)a3 shouldRestrictFrameRate:(BOOL)a4;
- (void)_updateLighting:(id)a3;
- (void)_updateNode:(id)a3 forAnchor:(id)a4 frame:(id)a5;
- (void)_updateOcclusionCompositor;
- (void)_updatePreferredFramesPerSecond;
- (void)_updateProbesWithFrame:(id)a3;
- (void)cleanupLingeringRotationState;
- (void)didMoveToWindow;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
- (void)session:(id)a3 didAddAnchors:(id)a4;
- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)session:(id)a3 didRemoveAnchors:(id)a4;
- (void)session:(id)a3 didUpdateAnchors:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)session:(id)a3 willRunWithConfiguration:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4;
- (void)sessionWasInterrupted:(id)a3;
- (void)setActualPreferredFramesPerSecond:(int64_t)a3;
- (void)setAutomaticallyOccludesVirtualContent:(BOOL)a3;
- (void)setAutomaticallyUpdatesLighting:(BOOL)automaticallyUpdatesLighting;
- (void)setCompositorAlgorithm:(int64_t)a3;
- (void)setDebugOptions:(unint64_t)a3;
- (void)setDelegate:(id)delegate;
- (void)setDeveloperPreferredFramesPerSecond:(int64_t)a3;
- (void)setDrawsCameraImage:(BOOL)a3;
- (void)setFrameToRemoveRotationSnapshotOn:(int64_t)a3;
- (void)setGraduallyUpdateAnchors:(BOOL)a3;
- (void)setLastFrameTimestamp:(double)a3;
- (void)setOcclusionExcludedBitMask:(unint64_t)a3;
- (void)setPointOfView:(id)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setProvidesOcclusionGeometry:(BOOL)a3;
- (void)setRendersCameraGrain:(BOOL)rendersCameraGrain;
- (void)setRendersMotionBlur:(BOOL)rendersMotionBlur;
- (void)setRotationSnapshotState:(int64_t)a3;
- (void)setRunningWithSegmentation:(BOOL)a3;
- (void)setScene:(SCNScene *)scene;
- (void)setSegmentationUseEstimatedDepthData:(BOOL)a3;
- (void)setSession:(ARSession *)session;
- (void)setShouldRestrictFrameRate:(BOOL)a3;
- (void)setTargetFramesPerSecond:(int64_t)a3;
- (void)windowDidRotateNotification:(id)a3;
- (void)windowWillAnimateRotateNotification:(id)a3;
- (void)windowWillRotateNotification:(id)a3;
@end

@implementation ARSCNView

- (ARSCNView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARSCNView;
  v3 = -[ARSCNView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ARSCNView *)v3 _commonInit];
  }
  return v4;
}

- (ARSCNView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (v9)
  {
    v10 = v9;
    v11 = (void *)[v9 mutableCopy];
    [v11 removeObjectForKey:*MEMORY[0x263F16BC0]];
  }
  else
  {
    v11 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)ARSCNView;
  v12 = -[ARSCNView initWithFrame:options:](&v15, sel_initWithFrame_options_, v11, x, y, width, height);
  v13 = v12;
  if (v12) {
    [(ARSCNView *)v12 _commonInit];
  }

  return v13;
}

- (ARSCNView)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARSCNView;
  v5 = [(ARSCNView *)&v8 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    [(ARSCNView *)v5 _commonInit];
    if ([v4 containsValueForKey:@"automaticallyUpdatesLighting"]) {
      v6->_automaticallyUpdatesLighting = [v4 decodeBoolForKey:@"automaticallyUpdatesLighting"];
    }
  }

  return v6;
}

- (id)compositor
{
  return self->_compositor;
}

- (ARFrame)currentRenderFrame
{
  return [(ARSession *)self->_session currentFrame];
}

- (void)_commonInit
{
  self->_lastFrameTimestamp = 0.0;
  lightNode = self->_lightNode;
  self->_lightNode = 0;

  id v4 = (NSMutableArray *)objc_opt_new();
  environmentProbeNodes = self->_environmentProbeNodes;
  self->_environmentProbeNodes = v4;

  objc_super v6 = (NSMutableArray *)objc_opt_new();
  environmentProbeNodesToRemove = self->_environmentProbeNodesToRemove;
  self->_environmentProbeNodesToRemove = v6;

  objc_super v8 = [MEMORY[0x263F16A98] node];
  cameraNode = self->_cameraNode;
  self->_cameraNode = v8;

  v10 = [MEMORY[0x263F169F0] camera];
  [(SCNNode *)self->_cameraNode setCamera:v10];

  v11 = [(SCNNode *)self->_cameraNode camera];
  [v11 setZNear:0.00100000005];

  v12 = [(SCNNode *)self->_cameraNode camera];
  [v12 setZFar:1000.0];

  self->_drawsCameraImage = 1;
  v13 = [MEMORY[0x263EFF980] array];
  addedAnchors = self->_addedAnchors;
  self->_addedAnchors = v13;

  objc_super v15 = [MEMORY[0x263EFF980] array];
  updatedAnchors = self->_updatedAnchors;
  self->_updatedAnchors = v15;

  v17 = [MEMORY[0x263EFF980] array];
  removedAnchors = self->_removedAnchors;
  self->_removedAnchors = v17;

  v19 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  anchorsSemaphore = self->_anchorsSemaphore;
  self->_anchorsSemaphore = v19;

  v21 = [MEMORY[0x263EFF9A0] dictionary];
  nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
  self->_nodesByAnchorIdentifier = v21;

  v23 = [MEMORY[0x263EFF9A0] dictionary];
  occlusionGeometryNodesByAnchorIdentifier = self->_occlusionGeometryNodesByAnchorIdentifier;
  self->_occlusionGeometryNodesByAnchorIdentifier = v23;

  v25 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  nodesSemaphore = self->_nodesSemaphore;
  self->_nodesSemaphore = v25;

  self->_arDebugOptions = 0;
  [(ARSCNView *)self bounds];
  self->_viewportSize.double width = v27;
  self->_viewportSize.double height = v28;
  v29 = [(ARSCNView *)self layer];
  [v29 contentsScale];
  self->_contentsScale = v30;

  self->_automaticallyUpdatesLighting = 1;
  self->_providesOcclusionGeometrdouble y = 0;
  self->_automaticallyOccludesVirtualContent = 0;
  self->_segmentationUseEstimatedDepthData = 0;
  self->_compositorAlgorithm = 0;
  warpKernel = self->_warpKernel;
  self->_warpKernel = 0;

  self->_occlusionLock._os_unfair_lock_opaque = 0;
  self->_attemptRenderSynchronisationARFrame = [MEMORY[0x263F20ED0] BOOLForKey:*MEMORY[0x263F20DF0]];
  self->_renderRawSceneUnderstandingImage = [MEMORY[0x263F20ED0] BOOLForKey:*MEMORY[0x263F20DF8]];
  self->_anchorUpdatesPerRendererUpdate = 1;
  v32 = [(ARSession *)self->_session replaySensor];
  uint64_t v33 = [v32 replayMode];

  if (v33) {
    self->_attemptRenderSynchronisationARFrame = 0;
  }
  if (ARLinkedOnOrAfterYukon())
  {
    self->_rendersCameraGrain = [MEMORY[0x263F20ED0] BOOLForKey:*MEMORY[0x263F20E00]];
    char rendersMotionBlur = [MEMORY[0x263F20ED0] BOOLForKey:*MEMORY[0x263F20E08]];
    self->_char rendersMotionBlur = rendersMotionBlur;
  }
  else
  {
    char rendersMotionBlur = self->_rendersMotionBlur;
  }
  self->_lastRendersMotionBlur = rendersMotionBlur;
  v35 = (_OWORD *)MEMORY[0x263EF89A8];
  long long v36 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  *(_OWORD *)&self->_anon_360[32] = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
  *(_OWORD *)&self->_anon_360[48] = v36;
  long long v37 = v35[1];
  *(_OWORD *)self->_anon_360 = *v35;
  *(_OWORD *)&self->_anon_360[16] = v37;
  id v54 = [MEMORY[0x263F16AD8] scene];
  -[ARSCNView setScene:](self, "setScene:");
  if (ARDeviceRequiresFrameTrendControllerWorkaround()) {
    [MEMORY[0x263F1C550] clearColor];
  }
  else {
  v38 = [MEMORY[0x263F1C550] blackColor];
  }
  [(ARSCNView *)self setBackgroundColor:v38];

  self->_developerPreferredFramesPerSecond = -1;
  v39 = [MEMORY[0x263F20F58] supportedVideoFormats];
  v40 = [v39 firstObject];

  id v41 = objc_alloc(MEMORY[0x263F20E58]);
  v42 = [v40 deviceFormat];
  ARIntrinsicsFromDeviceFormat();
  double v52 = v44;
  double v53 = v43;
  double v51 = v45;
  [v40 imageResolution];
  v48 = objc_msgSend(v41, "initWithIntrinsics:imageResolution:", v53, v52, v51, v46, v47);

  [(ARSCNView *)self _updateCamera:v48];
  [MEMORY[0x263F20F38] setRenderType:1];
  v49 = [MEMORY[0x263F08A00] defaultCenter];
  v50 = [(ARSCNView *)self renderer];
  [v49 removeObserver:v50 name:*MEMORY[0x263F1D048] object:0];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARSCNView;
  id v4 = a3;
  [(ARSCNView *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_automaticallyUpdatesLighting, @"automaticallyUpdatesLighting", v5.receiver, v5.super_class);
}

- (void)layoutSubviews
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)ARSCNView;
  [(ARSCNView *)&v16 layoutSubviews];
  [(ARSCNView *)self bounds];
  self->_viewportSize.double width = v3;
  self->_viewportSize.double height = v4;
  objc_super v5 = [(ARSCNView *)self layer];
  [v5 contentsScale];
  self->_double contentsScale = v6;

  v7 = [(ARSCNView *)self window];
  objc_super v8 = [v7 windowScene];
  self->_interfaceOrientation = [v8 interfaceOrientation];

  id v9 = _ARLogGeneral_2();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [(ARSCNView *)self bounds];
    v12 = NSStringFromCGRect(v28);
    double contentsScale = self->_contentsScale;
    v14 = NSStringFromUIInterfaceOrientation(self->_interfaceOrientation);
    *(_DWORD *)buf = 138544386;
    v18 = v11;
    __int16 v19 = 2048;
    v20 = self;
    __int16 v21 = 2114;
    v22 = v12;
    __int16 v23 = 2048;
    double v24 = contentsScale;
    __int16 v25 = 2114;
    v26 = v14;
    _os_log_impl(&dword_20B202000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Layout changed to %{public}@, %.2fx, %{public}@", buf, 0x34u);
  }
  [(ARSCNView *)self _forceUpdateCamera];
  compositor = self->_compositor;
  if (compositor)
  {
    [(ARSCNCompositor *)compositor setCurrentOrientation:self->_interfaceOrientation];
    -[ARSCNCompositor setCurrentSize:](self->_compositor, "setCurrentSize:", self->_viewportSize.width, self->_viewportSize.height);
  }
}

- (NSString)description
{
  [(ARSCNView *)self frame];
  CGFloat v3 = NSStringFromCGRect(v15);
  CGFloat v4 = NSString;
  objc_super v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  v7 = [(ARSCNView *)self session];
  objc_super v8 = [(ARSCNView *)self scene];
  [(ARSCNView *)self sceneTime];
  uint64_t v10 = v9;
  v11 = [(ARSCNView *)self pointOfView];
  v12 = [v4 stringWithFormat:@"<%@: %p | session=%p scene=%@ sceneTime=%f frame=%@ pointOfView=%@>", v6, self, v7, v8, v10, v3, v11];

  return (NSString *)v12;
}

- (ARSession)session
{
  v2 = self;
  objc_sync_enter(v2);
  session = v2->_session;
  if (!session)
  {
    uint64_t v4 = objc_opt_new();
    objc_super v5 = v2->_session;
    v2->_session = (ARSession *)v4;

    [(ARSession *)v2->_session _addObserver:v2];
    session = v2->_session;
  }
  double v6 = session;
  objc_sync_exit(v2);

  return v6;
}

- (void)setSession:(ARSession *)session
{
  v17 = session;
  objc_super v5 = self;
  objc_sync_enter(v5);
  p_session = (id *)&v5->_session;
  v7 = v5->_session;
  if (v7 != v17)
  {
    [(ARSession *)v7 _removeObserver:v5];
    objc_super v8 = [(ARSCNView *)v5 currentRenderFrame];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = *p_session;
      v11 = [v8 anchors];
      [(ARSCNView *)v5 session:v10 didRemoveAnchors:v11];

      objc_storeStrong((id *)&v5->_session, session);
      v12 = [v9 anchors];
      [(ARSCNView *)v5 session:v17 didAddAnchors:v12];
    }
    else
    {
      v13 = v17;
      v12 = *p_session;
      id *p_session = v13;
    }

    [*p_session _addObserver:v5];
    -[ARSCNView session:didChangeState:](v5, "session:didChangeState:", *p_session, [*p_session state]);
    v14 = [*p_session configuration];
    uint64_t v15 = [v14 frameSemantics] & 3;
    if (v15)
    {
      uint64_t v16 = 1;
    }
    else
    {
      p_session = [*p_session configuration];
      uint64_t v16 = [p_session frameSemantics] & 1;
    }
    [(ARSCNView *)v5 setRunningWithSegmentation:v16];
    if (!v15) {
  }
    }
  objc_sync_exit(v5);
}

- (void)setAutomaticallyUpdatesLighting:(BOOL)automaticallyUpdatesLighting
{
  self->_automaticallyUpdatesLighting = automaticallyUpdatesLighting;
  if (!automaticallyUpdatesLighting)
  {
    lightNode = self->_lightNode;
    if (lightNode)
    {
      [(SCNNode *)lightNode removeFromParentNode];
      objc_super v5 = self->_lightNode;
      self->_lightNode = 0;
    }
  }
}

- (void)setRunningWithSegmentation:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__ARSCNView_setRunningWithSegmentation___block_invoke;
  v3[3] = &unk_264000CE8;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __40__ARSCNView_setRunningWithSegmentation___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 848));
  *(unsigned char *)(*(void *)(a1 + 32) + 936) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) _updateOcclusionCompositor];
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 848);

  os_unfair_lock_unlock(v2);
}

- (BOOL)runningWithSegmentation
{
  v2 = self;
  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  LOBYTE(v2) = v2->_runningWithSegmentation;
  os_unfair_lock_unlock(p_occlusionLock);
  return (char)v2;
}

- (void)setAutomaticallyOccludesVirtualContent:(BOOL)a3
{
  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  self->_automaticallyOccludesVirtualContent = a3;
  [(ARSCNView *)self _updateOcclusionCompositor];

  os_unfair_lock_unlock(p_occlusionLock);
}

- (void)setSegmentationUseEstimatedDepthData:(BOOL)a3
{
  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  self->_segmentationUseEstimatedDepthData = a3;
  [(ARSCNView *)self _updateOcclusionCompositor];

  os_unfair_lock_unlock(p_occlusionLock);
}

- (BOOL)automaticallyOccludesVirtualContent
{
  v2 = self;
  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  LOBYTE(v2) = v2->_automaticallyOccludesVirtualContent;
  os_unfair_lock_unlock(p_occlusionLock);
  return (char)v2;
}

- (void)setOcclusionExcludedBitMask:(unint64_t)a3
{
  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  self->_occlusionExcludedBitMask = a3;
  [(ARSCNView *)self _updateOcclusionCompositor];

  os_unfair_lock_unlock(p_occlusionLock);
}

- (unint64_t)occlusionExcludedBitMask
{
  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  unint64_t occlusionExcludedBitMask = self->_occlusionExcludedBitMask;
  os_unfair_lock_unlock(p_occlusionLock);
  return occlusionExcludedBitMask;
}

- (void)setProvidesOcclusionGeometry:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  p_occlusionLock = &self->_occlusionLock;
  os_unfair_lock_lock(&self->_occlusionLock);
  self->_providesOcclusionGeometrdouble y = v3;
  [(ARSCNView *)self _updateOcclusionCompositor];
  os_unfair_lock_unlock(p_occlusionLock);
  if (v3)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_anchorsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    double v6 = [(ARSCNView *)self currentRenderFrame];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_anchorsSemaphore);
    if (v6)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v7 = [v6 anchors];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v22;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v7);
            }
            [(ARSCNView *)self _addOcclusionGeometryForAnchor:*(void *)(*((void *)&v21 + 1) + 8 * v11++)];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v9);
      }
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);
  }
  else
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v12 = [(NSMutableDictionary *)self->_occlusionGeometryNodesByAnchorIdentifier allValues];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v16++) removeFromParentNode];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }

    [(NSMutableDictionary *)self->_occlusionGeometryNodesByAnchorIdentifier removeAllObjects];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);
  }
}

- (ARAnchor)anchorForNode:(SCNNode *)node
{
  nodesSemaphore = self->_nodesSemaphore;
  objc_super v5 = node;
  dispatch_semaphore_wait(nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  double v6 = [(ARSCNView *)self currentRenderFrame];
  v7 = [(ARSCNView *)self _anchorForNode:v5 inFrame:v6];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);

  return (ARAnchor *)v7;
}

- (SCNNode)nodeForAnchor:(ARAnchor *)anchor
{
  nodesSemaphore = self->_nodesSemaphore;
  objc_super v5 = anchor;
  dispatch_semaphore_wait(nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
  v7 = [(ARAnchor *)v5 identifier];

  uint64_t v8 = [(NSMutableDictionary *)nodesByAnchorIdentifier objectForKeyedSubscript:v7];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);

  return (SCNNode *)v8;
}

- (id)occlusionGeometryNodeForAnchor:(id)a3
{
  nodesSemaphore = self->_nodesSemaphore;
  id v5 = a3;
  dispatch_semaphore_wait(nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  occlusionGeometryNodesByAnchorIdentifier = self->_occlusionGeometryNodesByAnchorIdentifier;
  v7 = [v5 identifier];

  uint64_t v8 = [(NSMutableDictionary *)occlusionGeometryNodesByAnchorIdentifier objectForKeyedSubscript:v7];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);

  return v8;
}

- (NSArray)hitTest:(CGPoint)point types:(ARHitTestResultType)types
{
  double y = point.y;
  double x = point.x;
  uint64_t v8 = [(ARSCNView *)self currentRenderFrame];
  uint64_t v9 = -[ARSCNView _hitTest:frame:types:](self, "_hitTest:frame:types:", v8, types, x, y);

  return (NSArray *)v9;
}

- (simd_float3)unprojectPoint:(CGPoint)point ontoPlaneWithTransform:(simd_float4x4)planeTransform
{
  double v14 = *(double *)planeTransform.columns[2].i64;
  double v15 = *(double *)planeTransform.columns[3].i64;
  double v12 = *(double *)planeTransform.columns[0].i64;
  double v13 = *(double *)planeTransform.columns[1].i64;
  double y = point.y;
  double x = point.x;
  v7 = [(ARSCNView *)self currentRenderFrame];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 camera];
    objc_msgSend(v9, "unprojectPoint:ontoPlaneWithTransform:orientation:viewportSize:", self->_interfaceOrientation, x, y, v12, v13, v14, v15, self->_viewportSize.width, self->_viewportSize.height);
    simd_float3 v16 = v10;
  }
  else
  {
    simd_float3 v16 = 0u;
  }

  return v16;
}

- (ARRaycastQuery)raycastQueryFromPoint:(CGPoint)point allowingTarget:(ARRaycastTarget)target alignment:(ARRaycastTargetAlignment)alignment
{
  double y = point.y;
  double x = point.x;
  simd_float3 v10 = [(ARSCNView *)self currentRenderFrame];
  uint64_t v11 = v10;
  if (v10)
  {
    p_viewportSize = &self->_viewportSize;
    double height = self->_viewportSize.height;
    double v21 = x / self->_viewportSize.width;
    float64x2_t v23 = 0u;
    float64x2_t v24 = 0u;
    float64x2_t v22 = 0u;
    int64_t interfaceOrientation = self->_interfaceOrientation;
    double v20 = y / height;
    double v15 = [v10 camera];
    [v15 imageResolution];
    ARViewToCameraImageTransform(interfaceOrientation, 0, (uint64_t)&v22, p_viewportSize->width, p_viewportSize->height, v16, v17);

    long long v18 = objc_msgSend(v11, "raycastQueryFromPoint:allowingTarget:alignment:", target, alignment, vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v20), v22, v21)));
  }
  else
  {
    long long v18 = 0;
  }

  return (ARRaycastQuery *)v18;
}

- (void)setScene:(SCNScene *)scene
{
  v6.receiver = self;
  v6.super_class = (Class)ARSCNView;
  BOOL v4 = scene;
  [(ARSCNView *)&v6 setScene:v4];
  id v5 = [(SCNScene *)v4 rootNode];

  [v5 addChildNode:self->_cameraNode];
  [(ARSCNView *)self setPointOfView:self->_cameraNode];
}

- (void)setPointOfView:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)ARSCNView;
  BOOL v4 = (SCNNode *)a3;
  [(ARSCNView *)&v17 setPointOfView:v4];
  BOOL v5 = self->_cameraNode == v4;

  -[ARSCNView setDrawsCameraImage:](self, "setDrawsCameraImage:", v5, v17.receiver, v17.super_class);
  LODWORD(v4) = [(ARSCNView *)self drawsCameraImage];
  objc_super v6 = [(ARSCNView *)self scene];
  v7 = [v6 background];
  uint64_t v8 = [v7 contents];
  captureDeviceOutputConsumer = self->_captureDeviceOutputConsumer;

  if (v4)
  {
    if (v8 == captureDeviceOutputConsumer) {
      return;
    }
    simd_float3 v10 = [(ARSCNView *)self scene];
    uint64_t v11 = [v10 background];
    double v12 = [v11 contents];
    id originalBackgroundContents = self->_originalBackgroundContents;
    self->_id originalBackgroundContents = v12;

    double v14 = self->_captureDeviceOutputConsumer;
  }
  else
  {
    if (v8 != captureDeviceOutputConsumer) {
      return;
    }
    double v14 = self->_originalBackgroundContents;
  }
  double v15 = [(ARSCNView *)self scene];
  double v16 = [v15 background];
  [v16 setContents:v14];
}

- (void)setDebugOptions:(unint64_t)a3
{
  unint64_t v3 = 0xFFFFFFFF80000000;
  if (!(a3 >> 31)) {
    unint64_t v3 = 0;
  }
  unint64_t v4 = v3 | a3 & 0x60000000;
  self->_arDebugOptions = v4;
  v5.receiver = self;
  v5.super_class = (Class)ARSCNView;
  [(ARSCNView *)&v5 setDebugOptions:a3 & ~v4];
}

- (unint64_t)debugOptions
{
  v3.receiver = self;
  v3.super_class = (Class)ARSCNView;
  return self->_arDebugOptions | [(ARSCNView *)&v3 debugOptions];
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  [(ARSCNView *)self setDeveloperPreferredFramesPerSecond:a3];

  [(ARSCNView *)self _updatePreferredFramesPerSecond];
}

- (int64_t)preferredFramesPerSecond
{
  int64_t result = self->_developerPreferredFramesPerSecond;
  if (result < 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)ARSCNView;
    return [(ARSCNView *)&v4 preferredFramesPerSecond];
  }
  return result;
}

- (void)setDelegate:(id)delegate
{
  v3.receiver = self;
  v3.super_class = (Class)ARSCNView;
  [(ARSCNView *)&v3 setDelegate:delegate];
}

- (void)_renderer:(id)a3 updateAtTime:(double)a4
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  kdebug_trace();
  if (!self->_renderThreadFixed)
  {
    pthread_set_qos_class_self_np(QOS_CLASS_USER_INTERACTIVE, -4);
    pthread_set_fixedpriority_self();
    self->_renderThreadFixed = 1;
  }
  uint64_t v5 = [(ARSCNView *)self currentRenderFrame];
  objc_super v6 = (void *)v5;
  if (self->_attemptRenderSynchronisationARFrame && v5)
  {
    unsigned int v7 = 0;
    while (1)
    {
      [v6 timestamp];
      if (v8 != self->_lastFrameTimestamp) {
        break;
      }
      usleep(0x1F4u);
      unsigned int v9 = v7 + 1;
      simd_float3 v10 = [(ARSCNView *)self currentRenderFrame];

      [v10 timestamp];
      kdebug_trace();
      if (v10)
      {
        objc_super v6 = v10;
        if (v7++ < 4) {
          continue;
        }
      }
      goto LABEL_12;
    }
    simd_float3 v10 = v6;
    unsigned int v9 = v7;
    if (!v7) {
      goto LABEL_15;
    }
LABEL_12:
    double v12 = _ARLogGeneral_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      double v13 = (objc_class *)objc_opt_class();
      double v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543874;
      v79 = v14;
      __int16 v80 = 2048;
      v81 = self;
      __int16 v82 = 1024;
      unsigned int v83 = v9;
      _os_log_impl(&dword_20B202000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missed frame and retried to find a matching using %d attempts.", buf, 0x1Cu);
    }
    objc_super v6 = v10;
  }
LABEL_15:
  if (!self->_renderRawSceneUnderstandingImage
    || ([v6 rawSceneUnderstandingData],
        double v15 = objc_claimAutoreleasedReturnValue(),
        uint64_t v16 = [v15 capturedImage],
        v15,
        v16))
  {
    if (!v6 || ([v6 timestamp], v17 == self->_lastFrameTimestamp))
    {
      kdebug_trace();
LABEL_60:
      kdebug_trace();
      goto LABEL_61;
    }
    [v6 timestamp];
    long long v18 = [v6 captureDate];
    [v18 timeIntervalSinceNow];
    kdebug_trace();

    [v6 timestamp];
    self->_lastFrameInterval = v19 - self->_lastFrameTimestamp;
    [v6 timestamp];
    self->_lastFrameTimestamp = v20;
    if ([(ARSCNView *)self drawsCameraImageAndNilPresentation])
    {
      if (!self->_captureDeviceOutputConsumer)
      {
        double v21 = [MEMORY[0x263F16A88] captureDeviceOutputConsumer];
        captureDeviceOutputConsumer = self->_captureDeviceOutputConsumer;
        self->_captureDeviceOutputConsumer = v21;

        float64x2_t v23 = [(ARSCNView *)self scene];
        float64x2_t v24 = [v23 background];
        __int16 v25 = [v24 contents];

        if (!v25)
        {
          v26 = self->_captureDeviceOutputConsumer;
          uint64_t v27 = [(ARSCNView *)self scene];
          CGRect v28 = [v27 background];
          [v28 setContents:v26];
        }
      }
    }
    v29 = [(ARSCNView *)self scene];
    double v30 = [v29 background];
    v31 = [v30 contents];
    if (v31 == self->_captureDeviceOutputConsumer && [v6 capturedImage])
    {
      int64_t v34 = [(ARSCNView *)self rotationSnapshotState];

      if (v34 == 1) {
        goto LABEL_26;
      }
      v35 = [v6 camera];
      if ([v35 lensType] == 1)
      {

LABEL_63:
        uint64_t v74 = [v6 capturedImage];
        v75 = [v6 camera];
        v76 = [(ARSCNView *)self _warpPixelBuffer:v74 withCamera:v75];

        [(ARSCNView *)self _renderCapturedPixelBuffer:v76];
        CVPixelBufferRelease(v76);
        goto LABEL_26;
      }
      v72 = [v6 camera];
      uint64_t v73 = [v72 lensType];

      if (v73 == 2) {
        goto LABEL_63;
      }
      if (!self->_renderRawSceneUnderstandingImage)
      {
        -[ARSCNView _renderCapturedPixelBuffer:](self, "_renderCapturedPixelBuffer:", [v6 capturedImage]);
        goto LABEL_26;
      }
      v29 = [v6 rawSceneUnderstandingData];
      -[ARSCNView _renderCapturedPixelBuffer:](self, "_renderCapturedPixelBuffer:", [v29 capturedImage]);
    }
    else
    {
    }
LABEL_26:
    if (self->_renderRawSceneUnderstandingImage)
    {
      v32 = [v6 rawSceneUnderstandingData];
      uint64_t v33 = [v32 wideCamera];
      [(ARSCNView *)self _updateCamera:v33];
    }
    else
    {
      v32 = [v6 camera];
      [(ARSCNView *)self _updateCamera:v32];
    }

    [(ARSCNView *)self _updateProbesWithFrame:v6];
    if (self->_rendersMotionBlur)
    {
      long long v36 = [v6 camera];
      [v36 exposureDuration];
      double v38 = v37 / self->_lastFrameInterval;
      v39 = [(SCNNode *)self->_cameraNode camera];
      [v39 setMotionBlurIntensity:v38];
    }
    else if (self->_lastRendersMotionBlur)
    {
      v40 = [(SCNNode *)self->_cameraNode camera];
      [v40 setMotionBlurIntensity:0.0];
    }
    self->_lastRendersMotionBlur = self->_rendersMotionBlur;
    if ([(ARSCNView *)self automaticallyUpdatesLighting])
    {
      id v41 = [v6 lightEstimate];
      [(ARSCNView *)self _updateLighting:v41];
    }
    if ([(ARSCNView *)self rotationSnapshotState] == 2
      && ([(ARSCNView *)self frameToRemoveRotationSnapshotOn] & 0x8000000000000000) == 0)
    {
      if (![(ARSCNView *)self frameToRemoveRotationSnapshotOn])
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __36__ARSCNView__renderer_updateAtTime___block_invoke;
        block[3] = &unk_264000B80;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
      [(ARSCNView *)self setFrameToRemoveRotationSnapshotOn:[(ARSCNView *)self frameToRemoveRotationSnapshotOn] - 1];
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_anchorsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    v42 = (void *)[(NSMutableArray *)self->_addedAnchors copy];
    [(NSMutableArray *)self->_addedAnchors removeAllObjects];
    double v43 = (void *)[(NSMutableArray *)self->_removedAnchors copy];
    [(NSMutableArray *)self->_removedAnchors removeAllObjects];
    if ([(ARSCNView *)self graduallyUpdateAnchors]
      && [(NSMutableArray *)self->_updatedAnchors count])
    {
      unint64_t v44 = [(NSMutableArray *)self->_updatedAnchors count];
      if (v44 >= self->_anchorUpdatesPerRendererUpdate) {
        unint64_t anchorUpdatesPerRendererUpdate = self->_anchorUpdatesPerRendererUpdate;
      }
      else {
        unint64_t anchorUpdatesPerRendererUpdate = v44;
      }
      double v46 = -[NSMutableArray subarrayWithRange:](self->_updatedAnchors, "subarrayWithRange:", 0, anchorUpdatesPerRendererUpdate);
      -[NSMutableArray removeObjectsInRange:](self->_updatedAnchors, "removeObjectsInRange:", 0, anchorUpdatesPerRendererUpdate);
    }
    else
    {
      double v46 = (void *)[(NSMutableArray *)self->_updatedAnchors copy];
      [(NSMutableArray *)self->_updatedAnchors removeAllObjects];
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_anchorsSemaphore);
    [(ARSCNView *)self _removeAnchors:v43];
    [(ARSCNView *)self _addAnchors:v42];
    [(ARSCNView *)self _updateAnchors:v46 frame:v6];
    [(ARSCNView *)self _updateDebugVisualization:v6];
    if (self->_compositor && [(ARSCNView *)self rotationSnapshotState] != 1) {
      [(ARSCNCompositor *)self->_compositor setCurrentFrame:v6];
    }
    if (!self->_rendersCameraGrain || ([v6 cameraGrainIntensity], v47 == 0.0))
    {
      v56 = [(SCNNode *)self->_cameraNode camera];
      [v56 setGrainIntensity:0.0];
    }
    else
    {
      v48 = [(SCNNode *)self->_cameraNode camera];
      [v48 setGrainIntensity:0.82];

      v49 = [(ARSCNView *)self renderer];
      v50 = [v49 currentRenderPassDescriptor];
      [v50 colorAttachments];
      double v51 = v46;
      double v52 = v43;
      v54 = double v53 = v42;
      v55 = [v54 objectAtIndexedSubscript:0];
      v56 = [v55 texture];

      v42 = v53;
      double v43 = v52;
      double v46 = v51;

      v57 = [v6 camera];
      [v57 imageResolution];
      double v59 = v58;
      double v61 = v60;

      *(float *)&double v59 = v59;
      float v62 = fmax((double)(unint64_t)[v56 width], (double)(unint64_t)objc_msgSend(v56, "height"));
      float v63 = fmin((double)(unint64_t)[v56 width], (double)(unint64_t)objc_msgSend(v56, "height"));
      *(float *)&double v61 = v61;
      double v64 = fmaxf(v62 / *(float *)&v59, v63 / *(float *)&v61);
      v65 = [(SCNNode *)self->_cameraNode camera];
      [v65 setGrainScale:v64];

      v66 = [(SCNNode *)self->_cameraNode camera];
      [v66 setGrainIsColored:1];

      v67 = [v6 cameraGrainTexture];
      v68 = [(SCNNode *)self->_cameraNode camera];
      [v68 setGrainTexture:v67];

      [v6 cameraGrainIntensity];
      double v70 = v69;
      v71 = [(SCNNode *)self->_cameraNode camera];
      [v71 setGrainSlice:v70];
    }
    [v6 timestamp];
    kdebug_trace();

    goto LABEL_60;
  }
LABEL_61:
}

void __36__ARSCNView__renderer_updateAtTime___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setRotationSnapshotState:0];
  [*(id *)(*(void *)(a1 + 32) + 792) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 792);
  *(void *)(v2 + 792) = 0;

  objc_super v4 = _ARLogGeneral_2();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543618;
    unsigned int v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl(&dword_20B202000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Removing rotation snapshot", (uint8_t *)&v8, 0x16u);
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 renderFramesPerSecond];
  uint64_t v7 = [v5 shouldRestrictFrameRate];

  [(ARSCNView *)self _updateFramesPerSecondWithTarget:v6 shouldRestrictFrameRate:v7];
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_session == a3)
  {
    uint64_t v6 = _ARLogGeneral_2();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      int v8 = NSStringFromClass(v7);
      unsigned int v9 = "NO";
      int v12 = 138543874;
      double v13 = v8;
      if (a4 == 1) {
        unsigned int v9 = "YES";
      }
      __int16 v14 = 2048;
      double v15 = self;
      __int16 v16 = 2082;
      double v17 = v9;
      _os_log_impl(&dword_20B202000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting playing state to %{public}s", (uint8_t *)&v12, 0x20u);
    }
    BOOL v10 = a4 == 1;

    [(ARSCNView *)self set_wantsSceneRendererDelegationMessages:v10];
    [(ARSCNView *)self setPlaying:v10];
    uint64_t v11 = [(ARSCNView *)self renderer];
    objc_msgSend(v11, "set_enableARMode:", 1);
  }
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
  anchorsSemaphore = self->_anchorsSemaphore;
  id v6 = a4;
  dispatch_semaphore_wait(anchorsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableArray *)self->_removedAnchors removeObjectsInArray:v6];
  [(NSMutableArray *)self->_addedAnchors addObjectsFromArray:v6];
  [(NSMutableArray *)self->_updatedAnchors removeObjectsInArray:v6];
  [(NSMutableArray *)self->_updatedAnchors addObjectsFromArray:v6];

  uint64_t v7 = self->_anchorsSemaphore;

  dispatch_semaphore_signal(v7);
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  id v9 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_anchorsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if ([(ARSCNView *)self graduallyUpdateAnchors])
  {
    uint64_t v5 = [(NSMutableArray *)self->_updatedAnchors count];
    unint64_t anchorUpdatesPerRendererUpdate = self->_anchorUpdatesPerRendererUpdate;
    if (v5)
    {
      uint64_t v7 = [(NSMutableArray *)self->_updatedAnchors count];
      unint64_t v8 = [v9 count] + v7;
      if (anchorUpdatesPerRendererUpdate + 1 < v8) {
        unint64_t v8 = anchorUpdatesPerRendererUpdate + 1;
      }
    }
    else
    {
      if (anchorUpdatesPerRendererUpdate < 2) {
        goto LABEL_9;
      }
      unint64_t v8 = anchorUpdatesPerRendererUpdate - 1;
    }
    self->_unint64_t anchorUpdatesPerRendererUpdate = v8;
  }
LABEL_9:
  [(NSMutableArray *)self->_updatedAnchors removeObjectsInArray:v9];
  [(NSMutableArray *)self->_updatedAnchors addObjectsFromArray:v9];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_anchorsSemaphore);
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
  anchorsSemaphore = self->_anchorsSemaphore;
  id v6 = a4;
  dispatch_semaphore_wait(anchorsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableArray *)self->_addedAnchors removeObjectsInArray:v6];
  [(NSMutableArray *)self->_updatedAnchors removeObjectsInArray:v6];
  [(NSMutableArray *)self->_removedAnchors addObjectsFromArray:v6];

  uint64_t v7 = self->_anchorsSemaphore;

  dispatch_semaphore_signal(v7);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ARSCNView_session_didFailWithError___block_invoke;
  block[3] = &unk_264000BF8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __38__ARSCNView_session_didFailWithError___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v6 == v3)
  {
  }
  else
  {
    objc_super v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 session:*(void *)(a1 + 40) didFailWithError:*(void *)(a1 + 48)];
  }
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ARSCNView_session_cameraDidChangeTrackingState___block_invoke;
  block[3] = &unk_264000BF8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__ARSCNView_session_cameraDidChangeTrackingState___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v6 == v3)
  {
  }
  else
  {
    objc_super v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 session:*(void *)(a1 + 40) cameraDidChangeTrackingState:*(void *)(a1 + 48)];
  }
}

- (void)sessionWasInterrupted:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__ARSCNView_sessionWasInterrupted___block_invoke;
  v6[3] = &unk_264000BD0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __35__ARSCNView_sessionWasInterrupted___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v6 == v3)
  {
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 sessionWasInterrupted:*(void *)(a1 + 40)];
  }
}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__ARSCNView_sessionInterruptionEnded___block_invoke;
  v6[3] = &unk_264000BD0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __38__ARSCNView_sessionInterruptionEnded___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v6 == v3)
  {
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 sessionInterruptionEnded:*(void *)(a1 + 40)];
  }
}

- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__ARSCNView_sessionShouldAttemptRelocalization_completion___block_invoke;
  block[3] = &unk_264000C20;
  id v11 = v6;
  id v12 = v7;
  block[4] = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __59__ARSCNView_sessionShouldAttemptRelocalization_completion___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v7 == v3)
  {
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) delegate];
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, [v7 sessionShouldAttemptRelocalization:*(void *)(a1 + 40)]);
  }
}

- (void)session:(id)a3 didOutputAudioSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v6 = a3;
  if (a4) {
    CFRetain(a4);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ARSCNView_session_didOutputAudioSampleBuffer___block_invoke;
  block[3] = &unk_264000C48;
  block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __48__ARSCNView_session_didOutputAudioSampleBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [*(id *)(a1 + 32) session];
  uint64_t v4 = [v3 delegate];
  if (v2 == (void *)v4)
  {
  }
  else
  {
    char v5 = (void *)v4;
    id v6 = [*(id *)(a1 + 32) delegate];
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v2 = [*(id *)(a1 + 32) delegate];
    [v2 session:*(void *)(a1 + 40) didOutputAudioSampleBuffer:*(void *)(a1 + 48)];
  }

LABEL_6:
  id v8 = *(const void **)(a1 + 48);
  if (v8)
  {
    CFRelease(v8);
  }
}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ARSCNView_session_didChangeGeoTrackingStatus___block_invoke;
  block[3] = &unk_264000BF8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __48__ARSCNView_session_didChangeGeoTrackingStatus___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 delegate];
  if (v6 == v3)
  {
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 session:*(void *)(a1 + 40) didChangeGeoTrackingStatus:*(void *)(a1 + 48)];
  }
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6 = a4;
  if (([v6 frameSemantics] & 3) != 0) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [v6 frameSemantics] & 1;
  }
  [(ARSCNView *)self setRunningWithSegmentation:v5];
  if ([v6 frameSemantics])
  {
    [(ARSCNView *)self setAutomaticallyOccludesVirtualContent:1];
    [(ARSCNView *)self setSegmentationUseEstimatedDepthData:0];
  }
  if ((~[v6 frameSemantics] & 3) == 0)
  {
    [(ARSCNView *)self setAutomaticallyOccludesVirtualContent:1];
    [(ARSCNView *)self setSegmentationUseEstimatedDepthData:1];
  }
}

- (id)_anchorForNode:(id)a3 inFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 scene];
  id v9 = [v8 rootNode];

  BOOL v10 = (void *)MEMORY[0x263EFF9C0];
  id v11 = [(NSMutableDictionary *)self->_nodesByAnchorIdentifier allValues];
  id v12 = [v10 setWithArray:v11];

  double v13 = [(NSMutableDictionary *)self->_occlusionGeometryNodesByAnchorIdentifier allValues];
  [v12 addObjectsFromArray:v13];

  id v14 = v6;
  double v15 = v14;
  __int16 v16 = 0;
  id v17 = v14;
  if (v14 && v9 != v14)
  {
    uint64_t v18 = v14;
    while (([v12 containsObject:v18] & 1) == 0)
    {
      id v17 = [v18 parentNode];

      __int16 v16 = 0;
      if (v17)
      {
        uint64_t v18 = v17;
        if (v17 != v9) {
          continue;
        }
      }
      goto LABEL_14;
    }
    double v19 = [(NSMutableDictionary *)self->_nodesByAnchorIdentifier allKeysForObject:v18];
    double v20 = [v19 firstObject];

    if (!v20)
    {
      double v21 = [(NSMutableDictionary *)self->_occlusionGeometryNodesByAnchorIdentifier allKeysForObject:v18];
      double v20 = [v21 firstObject];
    }
    float64x2_t v22 = [v7 anchors];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __36__ARSCNView__anchorForNode_inFrame___block_invoke;
    v27[3] = &unk_264000BA8;
    id v23 = v20;
    id v28 = v23;
    uint64_t v24 = [v22 indexOfObjectPassingTest:v27];

    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      __int16 v16 = 0;
    }
    else
    {
      __int16 v25 = [v7 anchors];
      __int16 v16 = [v25 objectAtIndexedSubscript:v24];
    }
    id v17 = v18;
  }
LABEL_14:

  return v16;
}

uint64_t __36__ARSCNView__anchorForNode_inFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_hitTest:(CGPoint)a3 frame:(id)a4 types:(unint64_t)a5
{
  if (a4)
  {
    p_viewportSize = &self->_viewportSize;
    double height = self->_viewportSize.height;
    double v16 = a3.x / self->_viewportSize.width;
    float64x2_t v18 = 0u;
    float64x2_t v19 = 0u;
    float64x2_t v17 = 0u;
    int64_t interfaceOrientation = self->_interfaceOrientation;
    double v15 = a3.y / height;
    id v9 = a4;
    BOOL v10 = [v9 camera];
    [v10 imageResolution];
    ARViewToCameraImageTransform(interfaceOrientation, 0, (uint64_t)&v17, p_viewportSize->width, p_viewportSize->height, v11, v12);

    double v13 = objc_msgSend(v9, "hitTest:types:", a5, vaddq_f64(v19, vmlaq_n_f64(vmulq_n_f64(v18, v15), v17, v16)));
  }
  else
  {
    double v13 = (void *)MEMORY[0x263EFFA68];
  }

  return v13;
}

- (void)_renderCapturedPixelBuffer:(__CVBuffer *)a3
{
}

- (void)_forceUpdateCamera
{
  id v3 = [(ARSCNView *)self currentRenderFrame];
  if (v3)
  {
    id v5 = v3;
    uint64_t v4 = [v3 camera];
    [(ARSCNView *)self _updateCamera:v4];

    id v3 = v5;
  }
}

- (void)_updateCamera:(id)a3
{
  id v4 = a3;
  if ([(ARSCNView *)self rotationSnapshotState] != 1)
  {
    int64_t interfaceOrientation = self->_interfaceOrientation;
    id v6 = [(SCNNode *)self->_cameraNode camera];
    [v6 zNear];
    double v8 = v7;
    id v9 = [(SCNNode *)self->_cameraNode camera];
    [v9 zFar];
    objc_msgSend(v4, "projectionMatrixForOrientation:viewportSize:zNear:zFar:", interfaceOrientation, self->_viewportSize.width, self->_viewportSize.height, v8, v10);
    long long v47 = v12;
    long long v49 = v11;
    long long v44 = v14;
    long long v45 = v13;

    double v15 = [(SCNNode *)self->_cameraNode camera];
    long long v52 = v49;
    long long v53 = v47;
    long long v54 = v45;
    long long v55 = v44;
    [v15 setProjectionTransform:&v52];

    if ([v4 trackingState])
    {
      float v16 = (float)ARCameraToDisplayRotation(self->_interfaceOrientation) * 3.14159265 / 180.0;
      __float2 v17 = __sincosf_stret(v16 * 0.5);
      _Q0 = vmulq_n_f32((float32x4_t)xmmword_20B232090, v17.__sinval);
      _S2 = _Q0.i32[1];
      _S4 = _Q0.i32[2];
      __asm { FMLS            S3, S4, V0.S[2] }
      float v26 = vmlas_n_f32(vmuls_lane_f32(v17.__cosval, _Q0, 2), _Q0.f32[1], _Q0.f32[0]);
      float v27 = vmlas_n_f32(-(float)(v17.__cosval * _Q0.f32[1]), _Q0.f32[2], _Q0.f32[0]);
      HIDWORD(v28) = 0;
      *(float *)&long long v28 = _S3 + (float)(v17.__cosval * v17.__cosval);
      *((float *)&v28 + 1) = v26 + v26;
      *((float *)&v28 + 2) = v27 + v27;
      float v29 = vmlas_n_f32(-(float)(v17.__cosval * _Q0.f32[2]), _Q0.f32[1], _Q0.f32[0]);
      __asm
      {
        FMLA            S5, S2, V0.S[1]
        FMLS            S5, S0, V0.S[0]
        FMLA            S6, S4, V0.S[1]
      }
      *(float *)&long long v33 = v29 + v29;
      DWORD1(v33) = _S5;
      *((void *)&v33 + 1) = COERCE_UNSIGNED_INT(_S6 + _S6);
      long long v48 = v33;
      long long v50 = v28;
      __asm
      {
        FMLA            S7, S0, V0.S[2]
        FMLA            S5, S4, V0.S[1]
        FMLA            S1, S4, V0.S[2]
        FMLS            S1, S0, V0.S[0]
        FMLS            S1, S2, V0.S[1]
      }
      _Q0.f32[0] = _S7 + _S7;
      _Q0.f32[1] = _S5 + _S5;
      _Q0.i64[1] = _S1;
      float32x4_t v46 = _Q0;
      [v4 transform];
      uint64_t v43 = 0;
      v51[0] = v50;
      v51[1] = v48;
      v51[2] = v46;
      v51[3] = xmmword_20B231DE0;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      do
      {
        *(long long *)((char *)&v52 + v43 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, COERCE_FLOAT(v51[v43])), v40, *(float32x2_t *)&v51[v43], 1), v41, (float32x4_t)v51[v43], 2), v42, (float32x4_t)v51[v43], 3);
        ++v43;
      }
      while (v43 != 4);
      -[SCNNode setSimdTransform:](self->_cameraNode, "setSimdTransform:", *(double *)&v52, *(double *)&v53, *(double *)&v54, *(double *)&v55);
    }
  }
}

- (void)_updateLighting:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v22 = v4;
    lightNode = self->_lightNode;
    if (!lightNode)
    {
      id v6 = [MEMORY[0x263F16A98] node];
      double v7 = self->_lightNode;
      self->_lightNode = v6;

      double v8 = [MEMORY[0x263F16A70] light];
      [(SCNNode *)self->_lightNode setLight:v8];

      uint64_t v9 = *MEMORY[0x263F16B88];
      double v10 = [(SCNNode *)self->_lightNode light];
      [v10 setType:v9];

      -[SCNNode setPosition:](self->_lightNode, "setPosition:", 0.0, 0.0, 0.0);
      long long v11 = [(ARSCNView *)self scene];
      long long v12 = [v11 rootNode];
      [v12 addChildNode:self->_lightNode];

      lightNode = self->_lightNode;
    }
    long long v13 = [(SCNNode *)lightNode light];
    long long v14 = [v22 sphericalHarmonicsCoefficients];
    objc_msgSend(v13, "set_sphericalHarmonics:", v14);

    double v15 = [(ARSCNView *)self scene];
    float v16 = [v15 lightingEnvironment];
    __float2 v17 = [v16 contents];

    id v4 = v22;
    if (v17)
    {
      [v22 ambientIntensity];
      double v19 = v18 / 1000.0;
      double v20 = [(ARSCNView *)self scene];
      double v21 = [v20 lightingEnvironment];
      [v21 setIntensity:v19];

      id v4 = v22;
    }
  }
}

- (void)_updateProbesWithFrame:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 renderFramesPerSecond];
  id v6 = [v4 lightEstimate];
  double v58 = v4;
  if (v6)
  {
    double v7 = [v4 lightEstimate];
    [v7 ambientIntensity];
    float v9 = v8;

    double v10 = v9;
  }
  else
  {
    double v10 = 1000.0;
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v57 = objc_opt_new();
  long long v11 = self->_environmentProbeNodes;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    float v14 = 1.0 / (double)v5;
    uint64_t v15 = *(void *)v64;
    double v16 = v14;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v64 != v15) {
          objc_enumerationMutation(v11);
        }
        double v18 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        double v19 = [v18 light];

        if (v19)
        {
          double v20 = [(ARSCNView *)self anchorForNode:v18];

          if (v20)
          {
            double v21 = [v18 light];
            uint64_t v22 = [v21 probeEnvironment];
            if (v22)
            {
              id v23 = (void *)v22;
              [v18 light];
              v25 = uint64_t v24 = v11;
              float v26 = [v25 probeEnvironment];
              [v26 intensity];
              double v28 = v27;

              long long v11 = v24;
              if (v28 < 1.0)
              {
                float v29 = [v18 light];
                double v30 = [v29 probeEnvironment];
                [v30 intensity];
                [v30 setIntensity:v31 + v16];
              }
              goto LABEL_21;
            }
          }
          else
          {
            v32 = [v18 valueForKey:@"timestamp"];

            if (!v32)
            {
              long long v33 = NSNumber;
              [v58 timestamp];
              int64_t v34 = objc_msgSend(v33, "numberWithDouble:");
              [v18 setValue:v34 forKey:@"timestamp"];
            }
            v35 = [v18 valueForKey:@"timestamp"];
            [v35 doubleValue];
            double v37 = v36;

            double v21 = [v18 light];
            uint64_t v38 = [v21 probeEnvironment];
            if (v38)
            {
              float32x4_t v39 = (void *)v38;
              double v40 = v37 + 1.0;
              [v58 timestamp];
              double v42 = v41;

              if (v40 < v42)
              {
                uint64_t v43 = [v18 light];
                long long v44 = [v43 probeEnvironment];
                [v44 intensity];
                [v44 setIntensity:v45 - v16];

                float32x4_t v46 = [v18 light];
                long long v47 = [v46 probeEnvironment];
                [v47 intensity];
                double v49 = v48;

                if (v49 <= 0.0) {
                  [v57 addObject:v18];
                }
              }
              goto LABEL_21;
            }
          }

LABEL_21:
          if ([(ARSCNView *)self automaticallyUpdatesLighting])
          {
            long long v50 = [v18 light];
            [v50 setIntensity:v10];
          }
          continue;
        }
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v13);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v51 = v57;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v60 != v54) {
          objc_enumerationMutation(v51);
        }
        uint64_t v56 = *(void *)(*((void *)&v59 + 1) + 8 * j);
        [(NSMutableArray *)self->_environmentProbeNodes removeObject:v56];
        [(NSMutableArray *)self->_environmentProbeNodesToRemove addObject:v56];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v53);
  }
}

- (void)_addAnchors:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v35 = 672;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v36 = v4;
    obuint64_t j = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v40;
      unint64_t v9 = 0x267691000uLL;
      do
      {
        uint64_t v10 = 0;
        uint64_t v37 = v7;
        do
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
          uint64_t v12 = *(int *)(v9 + 1112);
          uint64_t v13 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
          float v14 = objc_msgSend(v11, "identifier", v35);
          uint64_t v15 = [v13 objectForKeyedSubscript:v14];

          if (!v15)
          {
            double v16 = [(ARSCNView *)self delegate];
            char v17 = objc_opt_respondsToSelector();

            if (v17)
            {
              kdebug_trace();
              double v18 = [(ARSCNView *)self delegate];
              uint64_t v15 = [v18 renderer:self nodeForAnchor:v11];

              kdebug_trace();
              if (!v15)
              {
                uint64_t v15 = [MEMORY[0x263EFF9D0] null];
                goto LABEL_15;
              }
            }
            else
            {
              uint64_t v15 = [MEMORY[0x263F16A98] node];
            }
            double v19 = [(ARSCNView *)self scene];
            [v19 rootNode];
            uint64_t v20 = v8;
            double v21 = v5;
            id v23 = v22 = v9;
            [v23 addChildNode:v15];

            uint64_t v24 = *(Class *)((char *)&self->super.super.super.super.isa + v12);
            __int16 v25 = [v11 identifier];
            float v26 = v24;
            unint64_t v9 = v22;
            uint64_t v5 = v21;
            uint64_t v8 = v20;
            uint64_t v7 = v37;
            [v26 setObject:v15 forKeyedSubscript:v25];
          }
          if ([(ARSCNView *)self providesOcclusionGeometry]) {
            [(ARSCNView *)self _addOcclusionGeometryForAnchor:v11];
          }
LABEL_15:
          [v5 addObject:v15];

          ++v10;
        }
        while (v7 != v10);
        uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v7);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)((char *)&self->super.super.super.super.isa + v35));
    double v27 = [(ARSCNView *)self delegate];
    char v28 = objc_opt_respondsToSelector();

    if ((v28 & 1) != 0 && [v5 count])
    {
      unint64_t v29 = 0;
      do
      {
        double v30 = objc_msgSend(v5, "objectAtIndexedSubscript:", v29, v35);
        double v31 = [MEMORY[0x263EFF9D0] null];
        char v32 = [v30 isEqual:v31];

        if ((v32 & 1) == 0)
        {
          kdebug_trace();
          long long v33 = [(ARSCNView *)self delegate];
          int64_t v34 = [obj objectAtIndexedSubscript:v29];
          [v33 renderer:self didAddNode:v30 forAnchor:v34];

          kdebug_trace();
        }

        ++v29;
      }
      while (v29 < [v5 count]);
    }

    id v4 = v36;
  }
}

- (void)_updateAnchors:(id)a3 frame:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  obuint64_t j = a3;
  id v24 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
        uint64_t v12 = [v10 identifier];
        uint64_t v13 = [(NSMutableDictionary *)nodesByAnchorIdentifier objectForKeyedSubscript:v12];

        if ([(ARSCNView *)self providesOcclusionGeometry])
        {
          occlusionGeometryNodesByAnchorIdentifier = self->_occlusionGeometryNodesByAnchorIdentifier;
          uint64_t v15 = [v10 identifier];
          double v16 = [(NSMutableDictionary *)occlusionGeometryNodesByAnchorIdentifier objectForKeyedSubscript:v15];

          if (!v13) {
            goto LABEL_12;
          }
        }
        else
        {
          double v16 = 0;
          if (!v13) {
            goto LABEL_12;
          }
        }
        char v17 = [(ARSCNView *)self delegate];
        char v18 = objc_opt_respondsToSelector();

        if (v18)
        {
          kdebug_trace();
          double v19 = [(ARSCNView *)self delegate];
          [v19 renderer:self willUpdateNode:v13 forAnchor:v10];

          kdebug_trace();
        }
LABEL_12:
        if (v16)
        {
          objc_msgSend(v16, "setCategoryBitMask:", objc_msgSend(v16, "categoryBitMask") | 0x40000000);
          [v10 transform];
          objc_msgSend(v16, "setSimdTransform:");
        }
        if (v13)
        {
          [(ARSCNView *)self _updateNode:v13 forAnchor:v10 frame:v24];
          uint64_t v20 = [(ARSCNView *)self delegate];
          char v21 = objc_opt_respondsToSelector();

          if (v21)
          {
            kdebug_trace();
            unint64_t v22 = [(ARSCNView *)self delegate];
            [v22 renderer:self didUpdateNode:v13 forAnchor:v10];

            kdebug_trace();
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }
}

- (void)_updateNode:(id)a3 forAnchor:(id)a4 frame:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v9 = [v8 environmentTexture];

    if (v9)
    {
      uint64_t v10 = [v7 light];
      long long v11 = [v10 probeEnvironment];
      uint64_t v12 = [v11 contents];
      uint64_t v13 = [v8 environmentTexture];

      float v14 = [v7 light];
      uint64_t v15 = [v14 probeEnvironment];
      double v16 = [v15 contents];

      if (v16 && v12 != v13)
      {
        char v17 = [v7 clone];
        char v18 = [(ARSCNView *)self scene];
        double v19 = [v18 rootNode];
        [v19 addChildNode:v17];

        [(NSMutableArray *)self->_environmentProbeNodes addObject:v17];
      }
      if (v12 != v13)
      {
        id v20 = v8;
        char v21 = objc_opt_new();
        [v21 setType:*MEMORY[0x263F16B88]];
        [v21 setProbeType:1];
        [v7 setLight:v21];
        if (([(NSMutableArray *)self->_environmentProbeNodes containsObject:v7] & 1) == 0) {
          [(NSMutableArray *)self->_environmentProbeNodes addObject:v7];
        }
        [v20 extent];
        if (fabsf(v22) == INFINITY || ([v20 extent], fabsf(v23) == INFINITY))
        {
          BOOL v25 = 0;
        }
        else
        {
          [v20 extent];
          BOOL v25 = fabsf(v24) != INFINITY;
        }
        long long v26 = [v7 light];
        [v26 setParallaxCorrectionEnabled:v25];

        [v20 extent];
        double v43 = v27;
        long long v28 = [v7 light];
        [v28 setProbeExtents:v43];

        unint64_t v29 = [v7 light];
        [v29 setParallaxCenterOffset:-0.000000381469818];

        uint64_t v30 = [v7 light];
        [v30 setParallaxExtentsFactor:*(double *)vdupq_n_s32(0x3FA66666u).i64];

        double v31 = [v20 environmentTexture];
        char v32 = [v7 light];
        long long v33 = [v32 probeEnvironment];
        [v33 setContents:v31];

        int64_t v34 = [v7 light];
        uint64_t v35 = [v34 probeEnvironment];
        [v35 setIntensity:0.0];

        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v36 = self->_environmentProbeNodesToRemove;
        uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v38; ++i)
            {
              if (*(void *)v45 != v39) {
                objc_enumerationMutation(v36);
              }
              [*(id *)(*((void *)&v44 + 1) + 8 * i) removeFromParentNode];
            }
            uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v44 objects:v48 count:16];
          }
          while (v38);
        }

        [(NSMutableArray *)self->_environmentProbeNodesToRemove removeAllObjects];
      }
    }
  }
  [v8 transform];
  objc_msgSend(v7, "setSimdTransform:");
  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v41 = v8;
      if ([v41 isDetectionOnly]) {
        uint64_t v42 = [v7 isHidden];
      }
      else {
        uint64_t v42 = [v41 isTracked] ^ 1;
      }
      [v7 setHidden:v42];
    }
    else
    {
      objc_msgSend(v7, "setHidden:", objc_msgSend(v8, "isTracked") ^ 1);
    }
  }
}

- (void)_removeAnchors:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = objc_opt_new();
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_nodesSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v30 = v4;
    obuint64_t j = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if ([(ARSCNView *)self providesOcclusionGeometry])
          {
            occlusionGeometryNodesByAnchorIdentifier = self->_occlusionGeometryNodesByAnchorIdentifier;
            uint64_t v12 = [v10 identifier];
            uint64_t v13 = [(NSMutableDictionary *)occlusionGeometryNodesByAnchorIdentifier objectForKeyedSubscript:v12];

            if (v13)
            {
              [v13 removeFromParentNode];
              float v14 = self->_occlusionGeometryNodesByAnchorIdentifier;
              uint64_t v15 = [v10 identifier];
              [(NSMutableDictionary *)v14 removeObjectForKey:v15];
            }
          }
          nodesByAnchorIdentifier = self->_nodesByAnchorIdentifier;
          char v17 = [v10 identifier];
          char v18 = [(NSMutableDictionary *)nodesByAnchorIdentifier objectForKeyedSubscript:v17];

          if (v18)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || ([(NSMutableArray *)self->_environmentProbeNodes containsObject:v18] & 1) == 0)
            {
              [v18 removeFromParentNode];
            }
            double v19 = self->_nodesByAnchorIdentifier;
            id v20 = [v10 identifier];
            [(NSMutableDictionary *)v19 removeObjectForKey:v20];

            [v5 addObject:v18];
          }
          else
          {
            char v21 = [MEMORY[0x263EFF9D0] null];
            [v5 addObject:v21];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v7);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_nodesSemaphore);
    float v22 = [(ARSCNView *)self delegate];
    char v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0 && [v5 count])
    {
      unint64_t v24 = 0;
      do
      {
        BOOL v25 = [v5 objectAtIndexedSubscript:v24];
        long long v26 = [MEMORY[0x263EFF9D0] null];
        char v27 = [v25 isEqual:v26];

        if ((v27 & 1) == 0)
        {
          kdebug_trace();
          long long v28 = [(ARSCNView *)self delegate];
          unint64_t v29 = [obj objectAtIndexedSubscript:v24];
          [v28 renderer:self didRemoveNode:v25 forAnchor:v29];

          kdebug_trace();
        }

        ++v24;
      }
      while (v24 < [v5 count]);
    }

    id v4 = v30;
  }
}

- (void)_addOcclusionGeometryForAnchor:(id)a3
{
  id v4 = a3;
  occlusionGeometryNodesByAnchorIdentifier = self->_occlusionGeometryNodesByAnchorIdentifier;
  id v15 = v4;
  uint64_t v6 = [v4 identifier];
  uint64_t v7 = [(NSMutableDictionary *)occlusionGeometryNodesByAnchorIdentifier objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v8 = [(ARSCNView *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      kdebug_trace();
      uint64_t v10 = [(ARSCNView *)self delegate];
      uint64_t v7 = [v10 renderer:self occlusionGeometryNodeForAnchor:v15];

      kdebug_trace();
      if (!v7) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v7 = [MEMORY[0x263F16A98] node];
    }
    long long v11 = [(ARSCNView *)self scene];
    uint64_t v12 = [v11 rootNode];
    [v12 addChildNode:v7];

    uint64_t v13 = self->_occlusionGeometryNodesByAnchorIdentifier;
    float v14 = [v15 identifier];
    [(NSMutableDictionary *)v13 setObject:v7 forKeyedSubscript:v14];
  }
LABEL_7:
}

- (void)_updateDebugVisualization:(id)a3
{
  id v25 = a3;
  worldOriginNode = self->_worldOriginNode;
  if (self->_arDebugOptions >> 31)
  {
    if (!worldOriginNode)
    {
      uint64_t v5 = +[ARSCNVisualizationHelper createAxesNode:0.200000003];
      uint64_t v6 = self->_worldOriginNode;
      self->_worldOriginNode = v5;

      [(SCNNode *)self->_worldOriginNode setCastsShadow:0];
    }
    uint64_t v7 = [(ARSCNView *)self scene];
    uint64_t v8 = [v7 rootNode];
    [v8 addChildNode:self->_worldOriginNode];
  }
  else
  {
    [(SCNNode *)worldOriginNode removeFromParentNode];
  }
  featurePointNode = self->_featurePointNode;
  if ((self->_arDebugOptions & 0x40000000) == 0)
  {
    [(SCNNode *)featurePointNode removeFromParentNode];
    currentlyVisibleDebugPointerCloud = self->_currentlyVisibleDebugPointerCloud;
    self->_currentlyVisibleDebugPointerCloud = 0;
LABEL_14:

    goto LABEL_15;
  }
  long long v11 = v25;
  if (!featurePointNode)
  {
    uint64_t v12 = (SCNNode *)objc_opt_new();
    uint64_t v13 = self->_featurePointNode;
    self->_featurePointNode = v12;

    [(SCNNode *)self->_featurePointNode setCastsShadow:0];
    long long v11 = v25;
  }
  float v14 = self->_currentlyVisibleDebugPointerCloud;
  id v15 = [v11 featurePoints];

  if (v14 != v15)
  {
    double v16 = [v25 featurePoints];
    char v17 = +[ARSCNVisualizationHelper createGeometryForPointCloud:v16];
    [(SCNNode *)self->_featurePointNode setGeometry:v17];

    char v18 = [v25 featurePoints];
    double v19 = self->_currentlyVisibleDebugPointerCloud;
    self->_currentlyVisibleDebugPointerCloud = v18;
  }
  id v20 = [(SCNNode *)self->_featurePointNode parentNode];

  if (!v20)
  {
    currentlyVisibleDebugPointerCloud = [(ARSCNView *)self scene];
    char v21 = [currentlyVisibleDebugPointerCloud rootNode];
    [v21 addChildNode:self->_featurePointNode];

    goto LABEL_14;
  }
LABEL_15:
  compositor = self->_compositor;
  if (compositor)
  {
    int v23 = [(ARSCNCompositor *)compositor showOcclusionGeometry];
    unint64_t v24 = self->_arDebugOptions & 0x20000000;
    if (v24 != v23) {
      [(ARSCNCompositor *)self->_compositor setShowOcclusionGeometry:v24 != 0];
    }
  }
}

- (void)_updateOcclusionCompositor
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [(ARSession *)self->_session configuration];
  int v4 = [v3 disableOcclusionForPersonSegmentation];

  if (v4)
  {
LABEL_2:
    compositor = self->_compositor;
    self->_compositor = 0;

    return;
  }
  uint64_t v6 = self->_compositorAlgorithm == 1;
  uint64_t v7 = [(ARSession *)self->_session configuration];
  uint64_t v8 = ~[v7 frameSemantics] & 3;

  if (v8)
  {
    uint64_t v10 = [(ARSession *)self->_session configuration];
    char v11 = [v10 frameSemantics];

    if ((v11 & 1) == 0) {
      goto LABEL_2;
    }
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }
  if ([(ARSCNCompositor *)self->_compositor compositorAlgorithm] != v6
    || v9 != [(ARSCNCompositor *)self->_compositor mode])
  {
    uint64_t v12 = self->_compositor;
    self->_compositor = 0;
  }
  if (!self->_compositor)
  {
    uint64_t v13 = _ARLogGeneral_2();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      float v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      int v18 = 138544130;
      double v19 = v15;
      __int16 v20 = 2048;
      char v21 = self;
      __int16 v22 = 2048;
      uint64_t v23 = v9;
      __int16 v24 = 2048;
      uint64_t v25 = v6;
      _os_log_impl(&dword_20B202000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting up ARSCNCompositor (%li, %li)", (uint8_t *)&v18, 0x2Au);
    }
    double v16 = [[ARSCNCompositor alloc] initWithView:self mode:v9 algorithm:v6];
    char v17 = self->_compositor;
    self->_compositor = v16;
  }
}

- (void)setCompositorAlgorithm:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ARSCNView_setCompositorAlgorithm___block_invoke;
  v7[3] = &unk_264000C98;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
  int v4 = _ARLogGeneral_2();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    char v11 = self;
    _os_log_impl(&dword_20B202000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Called set algorithm", buf, 0x16u);
  }
}

void __36__ARSCNView_setCompositorAlgorithm___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 848));
  *(void *)(*(void *)(a1 + 32) + 960) = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) _updateOcclusionCompositor];
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 848);

  os_unfair_lock_unlock(v2);
}

- (void)setActualPreferredFramesPerSecond:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ARSCNView;
  [(ARSCNView *)&v3 setPreferredFramesPerSecond:a3];
}

- (int64_t)actualPreferredFramesPerSecond
{
  v3.receiver = self;
  v3.super_class = (Class)ARSCNView;
  return [(ARSCNView *)&v3 preferredFramesPerSecond];
}

- (void)_updateFramesPerSecondWithTarget:(int64_t)a3 shouldRestrictFrameRate:(BOOL)a4
{
  BOOL v4 = a4;
  [(ARSCNView *)self setTargetFramesPerSecond:a3];
  [(ARSCNView *)self setShouldRestrictFrameRate:v4];

  [(ARSCNView *)self _updatePreferredFramesPerSecond];
}

- (void)_updatePreferredFramesPerSecond
{
  if ([(ARSCNView *)self developerPreferredFramesPerSecond] < 0
    || [(ARSCNView *)self shouldRestrictFrameRate])
  {
    objc_super v3 = [(ARSCNView *)self targetFramesPerSecond];
  }
  else
  {
    objc_super v3 = [(ARSCNView *)self developerPreferredFramesPerSecond];
  }
  BOOL v4 = v3;
  v6.receiver = self;
  v6.super_class = (Class)ARSCNView;
  if (v3 != (void *)[(ARSCNView *)&v6 preferredFramesPerSecond])
  {
    v5.receiver = self;
    v5.super_class = (Class)ARSCNView;
    [(ARSCNView *)&v5 setPreferredFramesPerSecond:v4];
  }
}

- (void)didMoveToWindow
{
  v11.receiver = self;
  v11.super_class = (Class)ARSCNView;
  [(ARSCNView *)&v11 didMoveToWindow];
  if (didMoveToWindow_onceToken != -1) {
    dispatch_once(&didMoveToWindow_onceToken, &__block_literal_global_11);
  }
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F1D840];
  [v3 removeObserver:self name:*MEMORY[0x263F1D840] object:0];
  uint64_t v5 = *MEMORY[0x263F1D838];
  [v3 removeObserver:self name:*MEMORY[0x263F1D838] object:0];
  uint64_t v6 = *MEMORY[0x263F1D808];
  [v3 removeObserver:self name:*MEMORY[0x263F1D808] object:0];
  uint64_t v7 = [(ARSCNView *)self window];

  if (v7)
  {
    uint64_t v8 = [(ARSCNView *)self window];
    [v3 addObserver:self selector:sel_windowWillRotateNotification_ name:v4 object:v8];

    uint64_t v9 = [(ARSCNView *)self window];
    [v3 addObserver:self selector:sel_windowWillAnimateRotateNotification_ name:v5 object:v9];

    __int16 v10 = [(ARSCNView *)self window];
    [v3 addObserver:self selector:sel_windowDidRotateNotification_ name:v6 object:v10];
  }
  else
  {
    [(ARSCNView *)self cleanupLingeringRotationState];
  }
}

void __28__ARSCNView_didMoveToWindow__block_invoke()
{
  _alwaysRotateCounterclockwise = 0;
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 1)
  {
    _alwaysRotateCounterclockwise = 1;
    uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v6 = [v2 objectForInfoDictionaryKey:@"UIRequiresFullScreen"];

    objc_super v3 = v6;
    if (v6)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      objc_super v3 = v6;
      if (isKindOfClass)
      {
        int v5 = [v6 BOOLValue];
        objc_super v3 = v6;
        if (v5) {
          _alwaysRotateCounterclockwise = 0;
        }
      }
    }
  }
}

- (void)windowWillRotateNotification:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 object];
  uint64_t v6 = [(ARSCNView *)self window];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    kdebug_trace();
    uint64_t v8 = [v4 userInfo];
    uint64_t v9 = [v8 objectForKey:*MEMORY[0x263F1D828]];

    self->_lastInterfaceOrientation = self->_interfaceOrientation;
    self->_int64_t interfaceOrientation = [v9 integerValue];
    [(ARSCNView *)self transform];
    if (CGAffineTransformIsIdentity(&v20))
    {
      __int16 v10 = _ARLogGeneral_2();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_super v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138543618;
        __int16 v22 = v12;
        __int16 v23 = 2048;
        __int16 v24 = self;
        _os_log_impl(&dword_20B202000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARSCNViewRotationSnapshotStateSettingUp", buf, 0x16u);
      }
      [(ARSCNView *)self setRotationSnapshotState:1];
      uint64_t v13 = [(ARSCNView *)self snapshotViewAfterScreenUpdates:0];
      rotationSnapshot = self->_rotationSnapshot;
      self->_rotationSnapshot = v13;

      [(UIView *)self->_rotationSnapshot setAutoresizingMask:45];
      [(UIView *)self->_rotationSnapshot setUserInteractionEnabled:0];
      [(ARSCNView *)self bounds];
      -[UIView setFrame:](self->_rotationSnapshot, "setFrame:");
      [(ARSCNView *)self addSubview:self->_rotationSnapshot];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __42__ARSCNView_windowWillRotateNotification___block_invoke;
      v19[3] = &unk_264000B80;
      v19[4] = self;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __42__ARSCNView_windowWillRotateNotification___block_invoke_2;
      v18[3] = &unk_264000D10;
      v18[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:50332162 delay:v19 options:v18 animations:0.02 completion:0.0];
    }
    else
    {
      id v15 = [(ARSCNView *)self renderer];
      [v15 _setInterfaceOrientation:self->_interfaceOrientation];

      int64_t interfaceOrientation = self->_interfaceOrientation;
      char v17 = [(ARSCNView *)self compositor];
      [v17 setCurrentOrientation:interfaceOrientation];
    }
    kdebug_trace();
  }
}

uint64_t __42__ARSCNView_windowWillRotateNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 792) setAlpha:0.99];
}

uint64_t __42__ARSCNView_windowWillRotateNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = _ARLogGeneral_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_super v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    int v11 = 138543618;
    uint64_t v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v5;
    _os_log_impl(&dword_20B202000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARSCNViewRotationSnapshotStateSetUp", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 32) setRotationSnapshotState:2];
  [*(id *)(a1 + 32) _forceUpdateCamera];
  [*(id *)(a1 + 32) _updateBackingSize];
  uint64_t v6 = [*(id *)(a1 + 32) renderer];
  [v6 _setInterfaceOrientation:*(void *)(*(void *)(a1 + 32) + 752)];

  int v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[94];
  uint64_t v9 = [v7 compositor];
  [v9 setCurrentOrientation:v8];

  return [*(id *)(a1 + 32) setFrameToRemoveRotationSnapshotOn:0];
}

- (void)windowWillAnimateRotateNotification:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = [(ARSCNView *)self window];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    kdebug_trace();
    uint64_t v7 = ARCameraToDisplayRotation(self->_lastInterfaceOrientation);
    uint64_t v8 = ARCameraToDisplayRotation(self->_interfaceOrientation);
    if (self->_rotationSnapshot)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __49__ARSCNView_windowWillAnimateRotateNotification___block_invoke;
      v12[3] = &unk_264000D38;
      v12[5] = v8;
      v12[6] = v7;
      v12[4] = self;
      [MEMORY[0x263F1CB60] performWithoutAnimation:v12];
      uint64_t v9 = (void *)MEMORY[0x263F1CB60];
      __int16 v10 = [MEMORY[0x263F1C408] sharedApplication];
      [v10 windowRotationDuration];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __49__ARSCNView_windowWillAnimateRotateNotification___block_invoke_2;
      v11[3] = &unk_264000B80;
      v11[4] = self;
      objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 2, v11, 0);
    }
    kdebug_trace();
  }
}

uint64_t __49__ARSCNView_windowWillAnimateRotateNotification___block_invoke(void *a1)
{
  double v2 = (double)(uint64_t)(a1[5] - a1[6]) * 3.14159265 / 180.0;
  if (v2 > 3.14159253 && v2 < 3.14159277 || v2 > -3.14159277 && v2 < -3.14159253)
  {
    double v3 = 1.0;
    if (_alwaysRotateCounterclockwise == 1)
    {
      uint64_t v4 = *(void *)(a1[4] + 760);
      BOOL v5 = v4 == 4 || v4 == 1;
      double v3 = -1.0;
      if (v5) {
        double v3 = 1.0;
      }
    }
    double v2 = v2 + v3 * 0.000000238418579;
  }
  CGAffineTransformMakeRotation(&v12, -v2);
  int v6 = (void *)a1[4];
  CGAffineTransform v11 = v12;
  [v6 setTransform:&v11];
  CGAffineTransformMakeRotation(&v10, v2);
  uint64_t v7 = *(void **)(a1[4] + 792);
  CGAffineTransform v9 = v10;
  return [v7 setTransform:&v9];
}

uint64_t __49__ARSCNView_windowWillAnimateRotateNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v1 setTransform:v4];
}

- (void)windowDidRotateNotification:(id)a3
{
  id v6 = [a3 object];
  uint64_t v4 = [(ARSCNView *)self window];
  if ([v6 isEqual:v4])
  {
    rotationSnapshot = self->_rotationSnapshot;

    if (rotationSnapshot)
    {
      [(ARSCNView *)self cleanupLingeringRotationState];
    }
  }
  else
  {
  }
}

- (void)cleanupLingeringRotationState
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __42__ARSCNView_cleanupLingeringRotationState__block_invoke;
  v2[3] = &unk_264000B80;
  v2[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v2];
}

uint64_t __42__ARSCNView_cleanupLingeringRotationState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRotationSnapshotState:0];
  [*(id *)(*(void *)(a1 + 32) + 792) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 792);
  *(void *)(v2 + 792) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v7[0] = *MEMORY[0x263F000D0];
  v7[1] = v5;
  v7[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v4 setTransform:v7];
}

- (void)_updateBackingSize
{
  if ([(ARSCNView *)self rotationSnapshotState] != 1)
  {
    v3.receiver = self;
    v3.super_class = (Class)ARSCNView;
    [(ARSCNView *)&v3 _updateBackingSize];
  }
}

- (void)_loadWarpKernalForLensType:(unint64_t)a3
{
  if (a3 == 1)
  {
    v5 = @"kernel vec2 rectification_warp_perspective(vec2 c, vec2 f, vec4 k, vec2 t) {\n    // params: (center, focal_length, radial_distortion, tangential_distortion)\n\n    vec2 p = destCoord();\n    float x = (p.x - c.x) / f.x;\n    float double y = (p.y - c.y) / f.y;\n\n    float k1 = k[0];\n    float k2 = k[1];\n    float k3 = k[2];\n\n    float p1 = t[0];\n    float p2 = t[1];\n\n    vec2 xu;\n    xu[0] = x;\n    xu[1] = y;\n\n    int num_iterations = 3;\n    for (int i = 0; i < num_iterations; ++i) {\n        float r_2 =  xu[0]*xu[0]+xu[1]*xu[1];\n        float k_radial = 1.0 + k1 * r_2 + k2 * r_2 * r_2 + k3 * r_2 * r_2 * r_2;\n        float delta_x_0 = 2.0 * p1 * xu[0] * xu[1] + p2 * (r_2 + 2.0 * xu[0] * xu[0]);\n        float delta_x_1 = p1 * (r_2 + 2.0 * xu[1] * xu[1]) + 2.0 * p2 * xu[0] * xu[1];\n        xu[0] = (x - delta_x_0)/k_radial;\n        xu[1] = (y - delta_x_1)/k_radial;\n    }\n\n    float newX = f.x * xu[0] + c.x;\n    float newY = f.y * xu[1] + c.y;\n\n    return vec2(newX, newY);\n}\n";
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    v5 = @"kernel vec2 rectification_warp(vec2 c, vec2 f, vec4 k) {\n    // params: (center, focal_length, radial_distortion)\n\n    vec2 p = destCoord();\n    float x = (p.x - c.x) / f.x;\n    float double y = (p.y - c.y) / f.y;\n\n    float r = sqrt(x*x + y*y);\n    float theta = atan(r);\n\n    float theta2 = theta * theta;\n    float theta3 = theta2 * theta;\n    float theta5 = theta3 * theta2;\n    float theta7 = theta5 * theta2;\n    float theta9 = theta7 * theta2;\n\n    float theta_d = theta + k[0] * theta3 + k[1] * theta5 + k[2] * theta7 + k[3] * theta9;\n\n    float scale = (r < 1e-8) ? 1.0 : theta_d / r;\n\n    float newX = f.x * x * scale + c.x;\n    float newY = f.y * y * scale + c.y;\n\n    return vec2(newX, newY);\n}\n";
  }
  id v6 = (CIWarpKernel *)[objc_alloc(MEMORY[0x263F00688]) initWithString:v5];
  warpKernel = self->_warpKernel;
  self->_warpKernel = v6;

  self->_warpKernelLensType = a3;
}

- (__CVBuffer)_warpPixelBuffer:(__CVBuffer *)a3 withCamera:(id)a4
{
  v57[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F00650] imageWithCVPixelBuffer:a3];
  uint64_t v8 = (void *)MEMORY[0x263F00680];
  [v6 focalLength];
  double v10 = v9;
  [v6 focalLength];
  CGAffineTransform v11 = objc_msgSend(v8, "vectorWithX:Y:", v10);
  CGAffineTransform v12 = (void *)MEMORY[0x263F00680];
  [v6 principalPoint];
  double v14 = v13;
  [v6 principalPoint];
  uint64_t v15 = objc_msgSend(v12, "vectorWithX:Y:", v14);
  double v16 = (void *)MEMORY[0x263F00680];
  if (v6)
  {
    [v6 radialDistortion];
    double v17 = v55;
    [v6 radialDistortion];
    double v18 = v54;
    [v6 radialDistortion];
    double v19 = v53;
    [v6 radialDistortion];
    double v20 = v52;
  }
  else
  {
    double v20 = 0.0;
    double v19 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
  }
  char v21 = [v16 vectorWithX:v17 Y:v18 Z:v19 W:v20];
  if (!self->_warpKernel
    || (unint64_t warpKernelLensType = self->_warpKernelLensType, warpKernelLensType != [v6 lensType]))
  {
    -[ARSCNView _loadWarpKernalForLensType:](self, "_loadWarpKernalForLensType:", [v6 lensType]);
    if (!self->_warpKernel) {
      goto LABEL_11;
    }
  }
  if ([v6 lensType] != 1)
  {
    if ([v6 lensType] == 2)
    {
      warpKernel = self->_warpKernel;
      [v7 extent];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      v56[0] = v15;
      v56[1] = v11;
      v56[2] = v21;
      double v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:3];
      uint64_t v49 = -[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:](warpKernel, "applyWithExtent:roiCallback:inputImage:arguments:", &__block_literal_global_110, v7, v48, v41, v43, v45, v47);

      uint64_t v38 = (__CVBuffer *)ARPixelBufferWithCIImage();
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v38 = CVPixelBufferRetain(a3);
    goto LABEL_12;
  }
  __int16 v23 = (void *)MEMORY[0x263F00680];
  [v6 tangentialDistortion];
  double v51 = v24;
  [v6 tangentialDistortion];
  uint64_t v26 = [v23 vectorWithX:v51 Y:v25];
  char v27 = self->_warpKernel;
  [v7 extent];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v57[0] = v15;
  v57[1] = v11;
  v57[2] = v21;
  v57[3] = v26;
  id v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:4];
  uint64_t v37 = -[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:](v27, "applyWithExtent:roiCallback:inputImage:arguments:", &__block_literal_global_110, v7, v36, v29, v31, v33, v35);

  uint64_t v38 = (__CVBuffer *)ARPixelBufferWithCIImage();
LABEL_12:

  return v38;
}

- (int64_t)compositorAlgorithm
{
  return self->_compositorAlgorithm;
}

- (BOOL)automaticallyUpdatesLighting
{
  return self->_automaticallyUpdatesLighting;
}

- (BOOL)rendersCameraGrain
{
  return self->_rendersCameraGrain;
}

- (void)setRendersCameraGrain:(BOOL)rendersCameraGrain
{
  self->_rendersCameraGrain = rendersCameraGrain;
}

- (BOOL)rendersMotionBlur
{
  return self->_rendersMotionBlur;
}

- (void)setRendersMotionBlur:(BOOL)rendersMotionBlur
{
  self->_char rendersMotionBlur = rendersMotionBlur;
}

- (BOOL)providesOcclusionGeometry
{
  return self->_providesOcclusionGeometry;
}

- (BOOL)segmentationUseEstimatedDepthData
{
  return self->_segmentationUseEstimatedDepthData;
}

- (double)lastFrameTimestamp
{
  return self->_lastFrameTimestamp;
}

- (void)setLastFrameTimestamp:(double)a3
{
  self->_lastFrameTimestamp = a3;
}

- (BOOL)shouldRestrictFrameRate
{
  return self->_shouldRestrictFrameRate;
}

- (void)setShouldRestrictFrameRate:(BOOL)a3
{
  self->_shouldRestrictFrameRate = a3;
}

- (int64_t)targetFramesPerSecond
{
  return self->_targetFramesPerSecond;
}

- (void)setTargetFramesPerSecond:(int64_t)a3
{
  self->_targetFramesPerSecond = a3;
}

- (int64_t)developerPreferredFramesPerSecond
{
  return self->_developerPreferredFramesPerSecond;
}

- (void)setDeveloperPreferredFramesPerSecond:(int64_t)a3
{
  self->_developerPreferredFramesPerSecond = a3;
}

- (BOOL)drawsCameraImage
{
  return self->_drawsCameraImage;
}

- (void)setDrawsCameraImage:(BOOL)a3
{
  self->_drawsCameraImage = a3;
}

- (int64_t)frameToRemoveRotationSnapshotOn
{
  return self->_frameToRemoveRotationSnapshotOn;
}

- (void)setFrameToRemoveRotationSnapshotOn:(int64_t)a3
{
  self->_frameToRemoveRotationSnapshotOn = a3;
}

- (int64_t)rotationSnapshotState
{
  return self->_rotationSnapshotState;
}

- (void)setRotationSnapshotState:(int64_t)a3
{
  self->_rotationSnapshotState = a3;
}

- (BOOL)graduallyUpdateAnchors
{
  return self->_graduallyUpdateAnchors;
}

- (void)setGraduallyUpdateAnchors:(BOOL)a3
{
  self->_graduallyUpdateAnchors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositor, 0);
  objc_storeStrong((id *)&self->_environmentProbeNodesToRemove, 0);
  objc_storeStrong((id *)&self->_environmentProbeNodes, 0);
  objc_storeStrong((id *)&self->_warpKernel, 0);
  objc_storeStrong((id *)&self->_rotationSnapshot, 0);
  objc_storeStrong(&self->_originalBackgroundContents, 0);
  objc_storeStrong((id *)&self->_currentlyVisibleDebugPointerCloud, 0);
  objc_storeStrong((id *)&self->_featurePointNode, 0);
  objc_storeStrong((id *)&self->_worldOriginNode, 0);
  objc_storeStrong((id *)&self->_anchorsSemaphore, 0);
  objc_storeStrong((id *)&self->_removedAnchors, 0);
  objc_storeStrong((id *)&self->_updatedAnchors, 0);
  objc_storeStrong((id *)&self->_addedAnchors, 0);
  objc_storeStrong((id *)&self->_nodesSemaphore, 0);
  objc_storeStrong((id *)&self->_occlusionGeometryNodesByAnchorIdentifier, 0);
  objc_storeStrong((id *)&self->_nodesByAnchorIdentifier, 0);
  objc_storeStrong((id *)&self->_cameraNode, 0);
  objc_storeStrong((id *)&self->_lightNode, 0);
  objc_storeStrong((id *)&self->_captureDeviceOutputConsumer, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end