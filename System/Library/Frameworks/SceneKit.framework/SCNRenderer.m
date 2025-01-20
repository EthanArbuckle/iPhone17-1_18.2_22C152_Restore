@interface SCNRenderer
+ (SCNRenderer)rendererWithContext:(EAGLContext *)context options:(NSDictionary *)options;
+ (SCNRenderer)rendererWithDevice:(id)device options:(NSDictionary *)options;
- (AVAudioEngine)audioEngine;
- (AVAudioEnvironmentNode)audioEnvironmentNode;
- (BOOL)_collectCompilationErrors;
- (BOOL)_disableLinearRendering;
- (BOOL)_drawSceneWithLegacyRenderer:(__C3DScene *)a3;
- (BOOL)_drawSceneWithNewRenderer:(__C3DScene *)a3;
- (BOOL)_enableARMode;
- (BOOL)_installContext;
- (BOOL)_isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4 viewport:(SCNVector4)a5;
- (BOOL)_needsRedrawAsap;
- (BOOL)_needsRepetitiveRedraw;
- (BOOL)_preloadResource:(id)a3 abortHandler:(id)a4;
- (BOOL)_prepareObject:(id)a3 shouldAbortBlock:(id)a4;
- (BOOL)_preparePreloadRenderer:(id)a3;
- (BOOL)_recordWithoutExecute;
- (BOOL)_shouldDelegateARCompositing;
- (BOOL)_shouldForwardSceneRendererDelegationMessagesToPrivateRendererOwner;
- (BOOL)_showsAuthoringEnvironment;
- (BOOL)_wantsSceneRendererDelegationMessages;
- (BOOL)autoAdjustCamera;
- (BOOL)autoenablesDefaultLighting;
- (BOOL)disableOverlays;
- (BOOL)forceAsyncShaderCompilation;
- (BOOL)frozen;
- (BOOL)isJitteringEnabled;
- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4;
- (BOOL)isPlaying;
- (BOOL)isTemporalAntialiasingEnabled;
- (BOOL)isVertexAmplificationEnabled;
- (BOOL)jitteringEnabled;
- (BOOL)loops;
- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4;
- (BOOL)renderMovieToURL:(id)a3 size:(CGSize)a4 antialiasingMode:(unint64_t)a5 attributes:(id)a6 error:(id *)a7;
- (BOOL)showsStatistics;
- (BOOL)temporalAntialiasingEnabled;
- (BOOL)usesReverseZ;
- (CFTimeInterval)nextFrameTime;
- (CGImage)_createBackgroundColorImageWithSize:(CGSize)a3;
- (CGImage)_createSnapshotAtTime:(double)a3 withSize:(CGSize)a4 antialiasingMode:(unint64_t)a5;
- (CGImage)_createSnapshotAtTime:(double)a3 withSize:(CGSize)a4 antialiasingMode:(unint64_t)a5 error:(id *)a6;
- (CGImage)createSnapshot:(double)a3 error:(id *)a4;
- (CGRect)currentViewport;
- (CGSize)_backingSize;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLRenderCommandEncoder)currentRenderCommandEncoder;
- (MTLRenderPassDescriptor)currentRenderPassDescriptor;
- (NSString)description;
- (SCNMatrix4)_screenTransform;
- (SCNNode)audioListener;
- (SCNNode)pointOfView;
- (SCNRenderer)init;
- (SCNScene)scene;
- (SCNSceneRendererDelegate)delegate;
- (SCNTechnique)technique;
- (SCNVector3)_projectPoint:(SCNVector3)a3 viewport:(SCNVector4)a4;
- (SCNVector3)_unprojectPoint:(SCNVector3)a3 viewport:(SCNVector4)a4;
- (SCNVector3)projectPoint:(SCNVector3)result;
- (SCNVector3)unprojectPoint:(SCNVector3)result;
- (SCNVector4)_viewport;
- (SKScene)overlaySKScene;
- (UIImage)snapshotAtTime:(CFTimeInterval)time withSize:(CGSize)size antialiasingMode:(SCNAntialiasingMode)antialiasingMode;
- (__C3DEngineContext)_engineContext;
- (__C3DRendererContext)_rendererContextGL;
- (__n128)_drawableSafeAreaInsets;
- (double)_aspectRatio;
- (double)_computeNextFrameTime;
- (double)_contentsScaleFactor;
- (double)_nextFrameTime;
- (double)_superSamplingFactor;
- (double)_systemTime;
- (double)sceneTime;
- (id)MTLTexture;
- (id)_authoringEnvironment;
- (id)_commandBufferStatusMonitor;
- (id)_compilationErrors;
- (id)_computedLightingEnvironmentMapsPath;
- (id)_copyPassDescription;
- (id)_copyPerformanceStatistics;
- (id)_copyRenderGraphDescription;
- (id)_defaultPOVForScene:(id)a3;
- (id)_hitTest:(CGPoint)a3 viewport:(CGSize)a4 options:(id)a5;
- (id)_initWithOptions:(id)a3 isPrivateRenderer:(BOOL)a4 privateRendererOwner:(id)a5 clearsOnDraw:(BOOL)a6 context:(void *)a7 renderingAPI:(unint64_t)a8;
- (id)_nodesInsideFrustumWithPointOfView:(id)a3 viewport:(SCNVector4)a4;
- (id)_prepareSKRenderer;
- (id)_readSubdivCacheForHash:(id)a3;
- (id)_renderContextMetal;
- (id)_renderingQueue;
- (id)_resourceManagerMonitor;
- (id)_setupSKRendererIfNeeded;
- (id)backgroundColor;
- (id)currentCommandBuffer;
- (id)hitTest:(CGPoint)a3 options:(id)a4;
- (id)hitTestWithSegmentFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 options:(id)a5;
- (id)metalDevice;
- (id)metalLayer;
- (id)nodesInsideFrustumWithPointOfView:(id)a3;
- (id)pointOfCulling;
- (id)privateRendererOwner;
- (id)programWithNode:(id)a3 withMaterial:(id)a4;
- (id)snapshotAtTime:(double)a3;
- (id)snapshotAtTime:(double)a3 withSize:(CGSize)a4 antialiasingMode:(unint64_t)a5 error:(id *)a6;
- (id)snapshotRendererWithSize:(CGSize)a3;
- (int64_t)_getFrameIndex;
- (unint64_t)_antialiasingMode;
- (unint64_t)_preparePixelFormat;
- (unint64_t)colorPixelFormat;
- (unint64_t)debugOptions;
- (unint64_t)depthPixelFormat;
- (unint64_t)renderingAPI;
- (unint64_t)stencilPixelFormat;
- (void)__CFObject;
- (void)__setTransitionContext:(id)a3;
- (void)_addGPUFrameCompletedHandler:(id)a3;
- (void)_addGPUFramePresentedHandler:(id)a3;
- (void)_addGPUFrameScheduledHandler:(id)a3;
- (void)_allowGPUBackgroundExecution;
- (void)_beginFrame;
- (void)_c3dBackgroundColorDidChange;
- (void)_clearBackBuffer;
- (void)_createOffscreenFramebufferIfNeeded;
- (void)_createPrepareFramebufferIfNeeded;
- (void)_deleteGLFramebuffer;
- (void)_didRenderScene:(id)a3;
- (void)_discardPendingGPUFrameCompletedHandlers;
- (void)_discardPendingGPUFramePresentedHandlers;
- (void)_discardPendingGPUFrameScheduledHandlers;
- (void)_displayLinkStatsTack;
- (void)_displayLinkStatsTick;
- (void)_draw;
- (void)_drawAtTime:(double)a3;
- (void)_drawOverlaySceneAtTime:(double)a3;
- (void)_drawScene:(__C3DScene *)a3;
- (void)_drawWithJitteringPresentationMode;
- (void)_endFrame;
- (void)_installGLContextAndSetViewport;
- (void)_installViewport;
- (void)_interfaceOrientationDidChange;
- (void)_invalidateFramebuffer;
- (void)_jitterAtStep:(unint64_t)a3 updateMainFramebuffer:(BOOL)a4 redisplay:(BOOL)a5 jitterer:(id)a6;
- (void)_overlaysDidUpdate:(id)a3;
- (void)_pause;
- (void)_play;
- (void)_prepareForTransition:(id)a3 outgoingScene:(id)a4 outgoingPointOfView:(id)a5 completionHandler:(id)a6;
- (void)_prepareGLRenderTarget;
- (void)_prepareRenderTarget;
- (void)_presentFramebuffer;
- (void)_projectPoints:(SCNVector3 *)a3 count:(unint64_t)a4 viewport:(SCNVector4)a5;
- (void)_releasePreloadRenderer;
- (void)_reloadDebugOptions;
- (void)_renderAtTime:(double)a3;
- (void)_renderAtTime:(double)a3 viewport:(CGRect)a4 encoder:(id)a5 passDescriptor:(id)a6 commandQueue:(id)a7 commandBuffer:(id)a8;
- (void)_renderGraphFrameRecordingAtPath:(id)a3 withCompletion:(id)a4;
- (void)_renderSceneWithEngineContext:(__C3DEngineContext *)a3 sceneTime:(double)a4;
- (void)_resolveAndDiscardGL;
- (void)_runningInExtension;
- (void)_setBackingSize:(CGSize)a3;
- (void)_setContentsScaleFactor:(double)a3;
- (void)_setInterfaceOrientation:(int64_t)a3;
- (void)_setSceneTime:(double)a3;
- (void)_setupOffscreenRendererWithSize:(CGSize)a3;
- (void)_stop;
- (void)_update:(__C3DScene *)a3;
- (void)_updateEngineCallbacks;
- (void)_updatePointOfView;
- (void)_updateProbes:(id)a3 withProgress:(id)a4;
- (void)_updateSystemTimeAndDeltaTimeWithCurrentTime:(double)a3;
- (void)_updateWithSystemTime:(double)a3;
- (void)_willRenderScene:(id)a3;
- (void)_writeSubdivCacheForHash:(id)a3 dataProvider:(id)a4;
- (void)autoenablesDefaultLighting;
- (void)context;
- (void)dealloc;
- (void)lock;
- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4;
- (void)presentScene:(id)a3 withTransition:(id)a4 incomingPointOfView:(id)a5 completionHandler:(id)a6;
- (void)render;
- (void)renderAtTime:(CFTimeInterval)time;
- (void)renderAtTime:(CFTimeInterval)time viewport:(CGRect)viewport commandBuffer:(id)commandBuffer passDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor;
- (void)renderAtTime:(double)a3 encoder:(id)a4 commandQueue:(id)a5 passDescriptor:(id)a6 viewPoints:(id)a7;
- (void)renderAtTime:(double)a3 encoder:(id)a4 commandQueue:(id)a5 passDescriptor:(id)a6 viewPoints:(id)a7 coordinateSpace:(unint64_t)a8;
- (void)renderAtTime:(double)a3 viewport:(CGRect)a4 encoder:(id)a5 passDescriptor:(id)a6 commandQueue:(id)a7;
- (void)renderContext:(id)a3 commandBufferDidCompleteWithError:(id)a4;
- (void)renderContext:(id)a3 didFallbackToDefaultTextureForSource:(id)a4 message:(id)a5;
- (void)renderWithCommandBuffer:(id)a3 viewPoints:(id)a4;
- (void)renderWithCommandBuffer:(id)a3 viewpoints:(id)a4 coordinateSpace:(unint64_t)a5;
- (void)renderWithViewport:(CGRect)viewport commandBuffer:(id)commandBuffer passDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor;
- (void)resolvedBackgroundColorDidChange;
- (void)setAudioListener:(id)a3;
- (void)setAutoAdjustCamera:(BOOL)a3;
- (void)setAutoenablesDefaultLighting:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContext:(id)a3;
- (void)setDebugOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableOverlays:(BOOL)a3;
- (void)setForceAsyncShaderCompilation:(BOOL)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setJitteringEnabled:(BOOL)a3;
- (void)setLoops:(BOOL)a3;
- (void)setOverlaySKScene:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setPointOfCulling:(id)a3;
- (void)setPointOfView:(id)a3;
- (void)setRendersContinuously:(BOOL)a3;
- (void)setScene:(SCNScene *)scene;
- (void)setScene:(id)a3 completionHandler:(id)a4;
- (void)setSceneTime:(double)a3;
- (void)setShowsStatistics:(BOOL)a3;
- (void)setTechnique:(id)a3;
- (void)setTemporalAntialiasingEnabled:(BOOL)a3;
- (void)setUsesReverseZ:(BOOL)a3;
- (void)setVertexAmplificationEnabled:(BOOL)a3;
- (void)set_antialiasingMode:(unint64_t)a3;
- (void)set_aspectRatio:(double)a3;
- (void)set_collectCompilationErrors:(BOOL)a3;
- (void)set_commandBufferStatusMonitor:(id)a3;
- (void)set_computedLightingEnvironmentMapsPath:(id)a3;
- (void)set_deltaTime:(double)a3;
- (void)set_disableLinearRendering:(BOOL)a3;
- (void)set_drawableSafeAreaInsets:(SCNRenderer *)self;
- (void)set_enableARMode:(BOOL)a3;
- (void)set_nextFrameTime:(double)a3;
- (void)set_preparePixelFormat:(unint64_t)a3;
- (void)set_recordWithoutExecute:(BOOL)a3;
- (void)set_resourceManagerMonitor:(id)a3;
- (void)set_screenTransform:(SCNMatrix4 *)a3;
- (void)set_shouldDelegateARCompositing:(BOOL)a3;
- (void)set_shouldForwardSceneRendererDelegationMessagesToPrivateRendererOwner:(BOOL)a3;
- (void)set_showsAuthoringEnvironment:(BOOL)a3;
- (void)set_superSamplingFactor:(double)a3;
- (void)set_systemTime:(double)a3;
- (void)set_viewport:(SCNVector4)a3;
- (void)set_wantsSceneRendererDelegationMessages:(BOOL)a3;
- (void)setupAuthoringEnvironment;
- (void)unlock;
- (void)updateAndDrawStatisticsIfNeeded;
- (void)updateCurrentTimeIfPlayingWithSystemTime:(double)a3;
- (void)updateProbes:(NSArray *)lightProbes atTime:(CFTimeInterval)time;
@end

@implementation SCNRenderer

- (void)__CFObject
{
  return self->_engineContext;
}

uint64_t __42__SCNRenderer_setScene_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__SCNRenderer_setScene_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(const void **)(v1 + 216);
  if (v2)
  {
    v3 = (const void *)[*(id *)(v1 + 8) sceneRef];
    C3DEngineContextSetupWithScene(v2, v3);
  }
}

- (id)_renderContextMetal
{
  return self->_renderContext;
}

- (void)unlock
{
}

- (void)lock
{
}

- (void)_setupOffscreenRendererWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  -[SCNRenderer setBackgroundColor:](self, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
  *((unsigned char *)self + 129) |= 0x10u;
  self->_framebufferInfo.drawableSize.CGFloat width = width;
  self->_framebufferInfo.drawableSize.CGFloat height = height;
  privateRendererOwner = self->_privateRendererOwner;
  if (privateRendererOwner) {
    uint64_t v7 = [(SCNSceneRenderer *)privateRendererOwner antialiasingMode];
  }
  else {
    uint64_t v7 = 2 * (self->_renderingAPI == 0);
  }

  [(SCNRenderer *)self set_antialiasingMode:v7];
}

- (void)setBackgroundColor:(id)a3
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor != a3)
  {

    v6 = (UIColor *)a3;
    self->_backgroundColor = v6;
    v7.i64[0] = [(UIColor *)v6 scn_C3DColorIgnoringColorSpace:0 success:0];
    v7.i64[1] = v8;
    C3DColor4 v9 = (C3DColor4)vmulq_f32(v7, (float32x4_t)vdupq_n_s32(HIDWORD(v8)));
    v9.var0.var0[3] = *((float *)&v8 + 1);
    self->_c3dBackgroundColor = v9;
    [(SCNRenderer *)self _c3dBackgroundColorDidChange];
  }
}

void __30__SCNRenderer_setPointOfView___block_invoke(uint64_t a1)
{
  v2 = (float32x4_t *)[*(id *)(a1 + 32) nodeRef];
  uint64_t PointOfViewIfAny = C3DEngineContextGetPointOfViewIfAny(*(void *)(*(void *)(a1 + 40) + 216));
  if (PointOfViewIfAny && (CFDictionaryRef Camera = C3DNodeGetCamera(PointOfViewIfAny)) != 0)
  {
    uint64_t v5 = (uint64_t)Camera;
    int HasDepthOfField = C3DCameraHasDepthOfField((uint64_t)Camera);
    BOOL v7 = C3DCameraGetTechnique(v5) != 0;
  }
  else
  {
    int HasDepthOfField = 0;
    BOOL v7 = 0;
  }
  C3DEngineContextSetPointOfView(*(void *)(*(void *)(a1 + 40) + 216), v2);
  if (v2)
  {
    CFDictionaryRef v8 = C3DNodeGetCamera((uint64_t)v2);
    if (v8)
    {
      uint64_t v9 = (uint64_t)v8;
      int v10 = C3DCameraHasDepthOfField((uint64_t)v8);
      BOOL v11 = C3DCameraGetTechnique(v9) != 0;
    }
    else
    {
      int v10 = 0;
      BOOL v11 = 0;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"kC3DSceneDidUpdateNotification", C3DGetScene(v2));
    BOOL v12 = v10 != HasDepthOfField || v11;
    if (v12 || v7)
    {
      uint64_t SharedInstance = C3DNotificationCenterGetSharedInstance();
      v14 = (const void *)C3DGetScene(v2);
      C3DNotificationCenterPostNotification(SharedInstance, @"kC3DNotificationEngineContextInvalidatePasses", v14, 0, 1u);
    }
  }
}

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  objc_sync_enter(self);
  if (!self->_renderingAPI && (*((unsigned char *)self + 129) & 8) != 0) {
    uint64_t v7 = [(SCNSceneRenderer *)self->_privateRendererOwner layer];
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(SCNRenderer *)self _preparePreloadRenderer:v7];
  if (v8)
  {
    +[SCNTransaction flush];
    [(SCNRenderer *)self _prepareObject:a3 shouldAbortBlock:a4];
    [(SCNRenderer *)self _releasePreloadRenderer];
  }
  objc_sync_exit(self);
  return v8;
}

- (void)_releasePreloadRenderer
{
  v3 = [(SCNRenderer *)self->_preloadRenderer _engineContext];
  if (v3 && (uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)v3)) != 0)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __38__SCNRenderer__releasePreloadRenderer__block_invoke;
    v5[3] = &__block_descriptor_40_e5_v8__0l;
    v5[4] = RendererContextGL;
    C3DRendererContextExecuteOnContext(RendererContextGL, (uint64_t)v5);
  }
  else
  {

    self->_preloadRenderer = 0;
  }
}

- (BOOL)_preparePreloadRenderer:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  if (self->_preloadRenderer)
  {
LABEL_15:
    LOBYTE(v14) = 1;
    return v14;
  }
  if (!self->_renderingAPI)
  {
    uint64_t v7 = +[SCNOffscreenRenderer offscreenRendererWithDevice:sceneRendererDelegate:size:](SCNOffscreenRenderer, "offscreenRendererWithDevice:sceneRendererDelegate:size:", [(SCNRenderer *)self metalDevice], self, 32.0, 32.0);
    self->_preloadRenderer = &v7->super;
    [(SCNRenderer *)v7 set_antialiasingMode:self->__antialiasingMode];
    [(SCNRenderer *)self->_preloadRenderer set_resourceManagerMonitor:objc_loadWeak((id *)&self->_resourceManagerMonitor)];
    if ((*((unsigned char *)self + 129) & 8) != 0) {
      -[SCNRenderer set_preparePixelFormat:](self->_preloadRenderer, "set_preparePixelFormat:", [a3 pixelFormat]);
    }
    RenderGraph = (void *)C3DEngineContextGetRenderGraph((uint64_t)[(SCNRenderer *)self->_preloadRenderer _engineContext]);
    unint64_t v9 = [(SCNRenderer *)self colorPixelFormat];
    if (v9) {
      unsigned __int16 v10 = v9;
    }
    else {
      unsigned __int16 v10 = 80;
    }
    C3DRenderGraphSetWarmupPixelFormat(RenderGraph, v10);
    goto LABEL_11;
  }
  if ([(SCNRenderer *)self context])
  {
    v4 = [(SCNRenderer *)self context];
    uint64_t v17 = *MEMORY[0x263F146F8];
    v18[0] = [v4 sharegroup];
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    self->_preloadRenderer = (SCNRenderer *)+[SCNOffscreenRenderer offscreenRendererWithContext:size:](SCNOffscreenRenderer, "offscreenRendererWithContext:size:", (id)[objc_alloc(MEMORY[0x263F146E8]) initWithAPI:2 properties:v5], 32.0, 32.0);
LABEL_11:
    if ([(SCNRenderer *)self _collectCompilationErrors])
    {
      C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
      id v11 = [(SCNRenderer *)self->_preloadRenderer _renderContextMetal];
      if (v11) {
        -[SCNMTLRenderContext setCollectsCompilationErrors:]((uint64_t)v11, 1);
      }
    }
    BOOL v12 = [(SCNRenderer *)self->_preloadRenderer _engineContext];
    CFDictionaryRef RenderingOptionForKey = C3DEngineContextGetRenderingOptionForKey((uint64_t)[(SCNRenderer *)self _engineContext], @"defaultLight");
    C3DEngineContextSetRenderingOptionForKey((uint64_t)v12, @"defaultLight", RenderingOptionForKey);
    goto LABEL_15;
  }
  v15 = scn_default_log();
  BOOL v14 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
  if (v14)
  {
    -[SCNRenderer _preparePreloadRenderer:]();
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (void)_c3dBackgroundColorDidChange
{
  v3 = [(SCNRenderer *)self _engineContext];
  if (!v3)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      C3DEngineContextGetStats_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  C3DEngineContextSetMainClearColor((uint64_t)v3, *(void *)self->_c3dBackgroundColor.var0.var0, *(void *)&self->_c3dBackgroundColor.var0.var1.var2);
}

- (__C3DEngineContext)_engineContext
{
  return self->_engineContext;
}

- (id)metalDevice
{
  return (id)-[SCNMTLRenderContext device]((uint64_t)self->_renderContext);
}

- (void)set_resourceManagerMonitor:(id)a3
{
  p_resourceManagerMonitor = &self->_resourceManagerMonitor;
  if (objc_loadWeak((id *)&self->_resourceManagerMonitor) != a3)
  {
    if (a3) {
      id v6 = a3;
    }
    else {
      id v6 = 0;
    }
    if (a3) {
      uint64_t v7 = self;
    }
    else {
      uint64_t v7 = 0;
    }
    objc_storeWeak((id *)p_resourceManagerMonitor, v6);
    -[SCNMTLRenderContext setResourceManagerMonitor:]((id *)&self->_renderContext->super.isa, v7);
    uint64_t v8 = [(SCNRenderer *)self->_preloadRenderer _renderContextMetal];
    -[SCNMTLRenderContext setResourceManagerMonitor:](v8, v7);
  }
}

- (void)set_preparePixelFormat:(unint64_t)a3
{
  self->__preparePixelFormat = a3;
}

- (unint64_t)colorPixelFormat
{
  if (self->_renderingAPI) {
    return 0;
  }
  if ((*((unsigned char *)self + 129) & 0x10) != 0) {
    mtlTexture = self->_mtlTexture;
  }
  else {
    mtlTexture = [(SCNRenderer *)self metalLayer];
  }

  return [(MTLTexture *)mtlTexture pixelFormat];
}

- (id)metalLayer
{
  if ((*((unsigned char *)self + 129) & 8) != 0) {
    return (id)[(SCNSceneRenderer *)self->_privateRendererOwner scn_backingLayer];
  }
  else {
    return 0;
  }
}

- (BOOL)_prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  [(SCNRenderer *)self _getFrameIndex];
  kdebug_trace();
  uint64_t v7 = [(SCNRenderer *)self->_preloadRenderer _engineContext];
  uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)v7);
  if (RendererContextGL)
  {
    uint64_t Stats = C3DEngineContextGetStats((uint64_t)v7);
    double v9 = C3DEngineStatsResetResourceStats(Stats);
  }
  if (objc_msgSend(MEMORY[0x263F08AB8], "currentProgress", v9))
  {
    uint64_t v11 = (void *)MEMORY[0x210535ED0]();
    BOOL v12 = -[SCNRenderer _preloadResource:abortHandler:](self->_preloadRenderer, "_preloadResource:abortHandler:", a3);
  }
  else
  {
    BOOL v12 = [(SCNRenderer *)self->_preloadRenderer _preloadResource:a3 abortHandler:a4];
  }
  if (RendererContextGL)
  {
    uint64_t v13 = C3DEngineContextGetStats((uint64_t)v7);
    uint64_t v14 = C3DEngineContextGetStats((uint64_t)[(SCNRenderer *)self _engineContext]);
    C3DEngineStatsMergeResourceStats(v13, v14);
  }
  else
  {
    uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)v7);
    uint64_t v16 = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
    if (RenderContext && v16)
    {
      uint64_t v17 = (void *)-[SCNMTLRenderContext compilationErrors](v16);
      [v17 addEntriesFromDictionary:-[SCNMTLRenderContext compilationErrors](RenderContext)];
    }
  }
  kdebug_trace();
  return v12;
}

- (void)_willRenderScene:(id)a3
{
  if ((*(_WORD *)&self->_delegationConformance & 0x10) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0)
  {
    +[SCNTransaction setImmediateMode:1];
    +[SCNTransaction setImmediateModeRestrictedContext:](SCNTransaction, "setImmediateModeRestrictedContext:", [a3 sceneRef]);
    uint64_t Stats = C3DEngineContextGetStats((uint64_t)self->_engineContext);
    double v6 = CACurrentMediaTime();
    [(SCNRenderer *)self _getFrameIndex];
    kdebug_trace();
    double forceSystemTime = self->_forceSystemTime;
    if (forceSystemTime == 0.0) {
      double forceSystemTime = self->_currentSystemTime;
    }
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0) {
      [(SCNSceneRenderer *)self->_privateRendererOwner _renderer:self->_privateRendererOwner willRenderScene:a3 atTime:forceSystemTime];
    }
    if ((*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0) {
      [(SCNRenderer *)self _renderer:self willRenderScene:a3 atTime:forceSystemTime];
    }
    if ((*(_WORD *)&self->_delegationConformance & 0x10) != 0)
    {
      privateRendererOwner = self;
      if ((*((unsigned char *)self + 129) & 4) != 0) {
        privateRendererOwner = self->_privateRendererOwner;
      }
      [self->_delegate renderer:privateRendererOwner willRenderScene:a3 atTime:forceSystemTime];
    }
    kdebug_trace();
    *(double *)(Stats + 168) = *(double *)(Stats + 168) + CACurrentMediaTime() - v6;
    +[SCNTransaction setImmediateModeRestrictedContext:0];
    +[SCNTransaction setImmediateMode:0];
  }
}

- (int64_t)_getFrameIndex
{
  return (int)C3DEngineContextGetFrameIndex((uint64_t)self->_engineContext);
}

- (BOOL)_preloadResource:(id)a3 abortHandler:(id)a4
{
  if (self->_renderingAPI)
  {
    uint64_t v7 = [MEMORY[0x263F146E8] currentContext];
    objc_msgSend(MEMORY[0x263F146E8], "setCurrentContext:", -[SCNRenderer context](self, "context"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [a3 sceneRef];
  uint64_t v9 = v8;
  if (v8) {
    C3DSceneLock(v8);
  }
  [(SCNRenderer *)self lock];
  *((unsigned char *)self + 129) |= 0x20u;
  if (!self->_renderingAPI)
  {
    CGSize drawableSize = self->_framebufferInfo.drawableSize;
    float32x4_t v16 = vcvt_hight_f32_f64(0, (float64x2_t)drawableSize);
    C3DEngineContextSetDrawableSize((uint64_t)self->_engineContext, COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)drawableSize)));
    [(SCNRenderer *)self adjustViewportForRendering:*(double *)v16.i64];
    C3DEngineContextSetViewport(v11, (__n128 *)self->_engineContext);
LABEL_10:
    [(SCNRenderer *)self _beginFrame];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v12 = C3DWarmupSceneVRAMResourcesForEngineContext((const void *)[a3 sceneRef], (__n128 *)self->_engineContext, (uint64_t)a4);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v12 = C3DWarmupNodeTreeVRAMResourcesForEngineContext([a3 nodeRef], (uint64_t)self->_engineContext, (uint64_t)a4);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v12 = C3DWarmupGeometryVRAMResourcesForEngineContext([a3 geometryRef], (uint64_t)self->_engineContext, (uint64_t)a4);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v13 = 0;
            goto LABEL_22;
          }
          char v12 = C3DWarmupMaterialVRAMResourcesForEngineContext([a3 materialRef], (uint64_t)self->_engineContext, (uint64_t)a4);
        }
      }
    }
    BOOL v13 = v12;
LABEL_22:
    if (self->_renderingAPI)
    {
      uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
      C3DRendererContextUnbindFramebuffer(RendererContextGL);
      glFlush();
    }
    else
    {
      [(SCNRenderer *)self _endFrame];
    }
    *((unsigned char *)self + 129) &= ~0x20u;
    [(SCNRenderer *)self unlock];
    if (v9) {
      C3DSceneUnlock(v9);
    }
    if (self->_renderingAPI) {
      [MEMORY[0x263F146E8] setCurrentContext:v7];
    }
    return v13;
  }
  if ([(SCNRenderer *)self _installContext])
  {
    glViewport(0, 0, 32, 32);
    goto LABEL_10;
  }
  if (v9) {
    C3DSceneUnlock(v9);
  }
  [(SCNRenderer *)self unlock];
  return 0;
}

- (void)_endFrame
{
  if (self->_renderContext)
  {
    if ((*(_WORD *)&self->_selfDelegationConformance & 0x40) != 0)
    {
      double SystemTime = C3DEngineContextGetSystemTime((uint64_t)self->_engineContext);
      double v6 = self;
      uint64_t v8 = self;
    }
    else
    {
      if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x40) != 0)
      {
        privateRendererOwner = (SCNRenderer *)self->_privateRendererOwner;
        double SystemTime = C3DEngineContextGetSystemTime((uint64_t)self->_engineContext);
        double v6 = privateRendererOwner;
      }
      else
      {
        if ((*(_WORD *)&self->_delegationConformance & 0x40) == 0)
        {
LABEL_16:
          renderContext = self->_renderContext;
          int v11 = (*((unsigned __int8 *)self + 129) >> 4) & 1;
          -[SCNMTLRenderContext endFrameWaitingUntilCompleted:status:error:]((uint64_t)renderContext, v11, 0, 0);
          return;
        }
        privateRendererOwner = self;
        if ((*((unsigned char *)self + 129) & 4) != 0) {
          privateRendererOwner = (SCNRenderer *)self->_privateRendererOwner;
        }
        delegate = (SCNRenderer *)self->_delegate;
        double SystemTime = C3DEngineContextGetSystemTime((uint64_t)self->_engineContext);
        double v6 = delegate;
      }
      uint64_t v8 = privateRendererOwner;
    }
    [(SCNRenderer *)v6 _renderer:v8 inputTimeForCurrentFrameWithTime:SystemTime];
    objc_msgSend(-[SCNRenderer metalLayer](self, "metalLayer"), "setInputTime:", v9);
    goto LABEL_16;
  }
  uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
  if (self->_framebufferInfo.frameBuffer)
  {
    C3DRendererContextUnbindFramebuffer(RendererContextGL);
  }
}

- (BOOL)_collectCompilationErrors
{
  uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
  if (RendererContextGL)
  {
    return C3DRendererContextGetCompilationErrorsCollection(RendererContextGL);
  }
  else
  {
    uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
    if (self->_renderContext)
    {
      return -[SCNMTLRenderContext collectsCompilationErrors](RenderContext);
    }
    else
    {
      return 0;
    }
  }
}

- (void)_beginFrame
{
}

- (void)_prepareRenderTarget
{
  char v3 = *((unsigned char *)self + 129);
  if (v3)
  {
    if (self->_renderingAPI)
    {
      [(SCNRenderer *)self _deleteGLFramebuffer];
    }
    else
    {

      self->_mtlTexture = 0;
    }
    char v3 = *((unsigned char *)self + 129) & 0xFE;
    *((unsigned char *)self + 129) = v3;
  }
  if ((v3 & 0x20) != 0 && !self->_renderingAPI)
  {
    [(SCNRenderer *)self _createPrepareFramebufferIfNeeded];
  }
  else if ((v3 & 0x10) != 0)
  {
    [(SCNRenderer *)self _createOffscreenFramebufferIfNeeded];
  }
  else if (self->_renderingAPI)
  {
    [(SCNRenderer *)self _prepareGLRenderTarget];
  }
}

- (void)_createPrepareFramebufferIfNeeded
{
  if (!self->_renderingAPI)
  {
    mtlTexture = self->_mtlTexture;
    if (*((unsigned char *)self + 129))
    {

      self->_mtlTexture = 0;
      *((unsigned char *)self + 129) &= ~1u;
    }
    else if (mtlTexture)
    {
      return;
    }
    uint64_t v4 = [(SCNRenderer *)self _preparePixelFormat];
    if (!v4)
    {
      char v5 = -[SCNMTLRenderContext wantsWideGamut]((uint64_t)self->_renderContext);
      if (self->__antialiasingMode) {
        char v6 = v5 | 8;
      }
      else {
        char v6 = v5;
      }
      uint64_t v4 = C3DMetalFramebufferPixelFormat(v6 | 0x10u);
    }
    uint64_t v7 = (void *)[MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v4 width:32 height:32 mipmapped:0];
    [v7 setUsage:5];
    [v7 setStorageMode:0];
    if (C3DEngineContextGetPreferredRenderMode((uint64_t)self->_engineContext) == 1)
    {
      [v7 setArrayLength:C3DEngineContextGetEyeCount((uint64_t)self->_engineContext)];
      [v7 setTextureType:3];
    }
    self->_mtlTexture = (MTLTexture *)objc_msgSend(-[SCNRenderer metalDevice](self, "metalDevice"), "newTextureWithDescriptor:", v7);
  }
}

- (unint64_t)_preparePixelFormat
{
  return self->__preparePixelFormat;
}

- (id)_renderingQueue
{
  return self->__renderingQueue;
}

- (SCNNode)pointOfView
{
  return self->_pointOfView;
}

- (void)setScene:(id)a3 completionHandler:(id)a4
{
  self->_scene = (SCNScene *)a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__SCNRenderer_setScene_completionHandler___block_invoke;
  v12[3] = &unk_264005010;
  v12[4] = self;
  +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v12];
  if (a3 && (!self->_pointOfViewWasSet || [(SCNNode *)self->_pointOfView scene] != self->_scene))
  {
    id v7 = [(SCNRenderer *)self _defaultPOVForScene:a3];
    if ((*((unsigned char *)self + 129) & 4) != 0) {
      privateRendererOwner = self->_privateRendererOwner;
    }
    else {
      privateRendererOwner = self;
    }
    [privateRendererOwner setPointOfView:v7];
    self->_pointOfViewWasSet = 0;
  }
  if (a4)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__SCNRenderer_setScene_completionHandler___block_invoke_2;
    v11[3] = &unk_264008930;
    v11[4] = a4;
    +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v11];
  }
  engineContext = self->_engineContext;
  if (engineContext)
  {
    uint64_t AuthoringEnvironment = C3DEngineContextGetAuthoringEnvironment((uint64_t)engineContext, 0);
    if (AuthoringEnvironment) {
      C3DAuthoringEnvironmentSceneDidChange(AuthoringEnvironment, (uint64_t)a3);
    }
  }
}

- (void)setPointOfView:(id)a3
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  if (self->_pointOfView != a3)
  {
    id v3 = a3;
    self->_pointOfViewWasSet = 1;
    if ([a3 isPresentationInstance])
    {
      char v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[SCNRenderer setPointOfView:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    BOOL v13 = [(SCNNode *)[(SCNRenderer *)self pointOfView] presentationNode];
    uint64_t v14 = self->_pointOfView;
    self->_pointOfView = (SCNNode *)v3;
    +[SCNTransaction animationDuration];
    double v16 = v15;
    int v17 = (v15 > 0.0) & ~+[SCNTransaction disableActions];
    uint64_t Scene = C3DEngineContextGetScene((uint64_t)self->_engineContext);
    uint64_t v19 = Scene;
    if (v17 == 1 && Scene != 0) {
      int v17 = C3DSceneIsPausedForEditing(Scene) ^ 1;
    }
    if (+[SCNTransaction immediateMode])
    {
      int v17 = 0;
    }
    else
    {
      if (!v13) {
        int v17 = 0;
      }
      +[SCNTransaction begin];
    }
    v114[0] = MEMORY[0x263EF8330];
    v114[1] = 3221225472;
    v114[2] = __30__SCNRenderer_setPointOfView___block_invoke;
    v114[3] = &unk_264006160;
    v114[4] = v3;
    v114[5] = self;
    +[SCNTransaction postCommandWithContext:v19 object:self applyBlock:v114];
    if (!v17) {
      goto LABEL_107;
    }
    ImplicitAnimationTimingFunction = +[SCNTransaction animationTimingFunction];
    if (!ImplicitAnimationTimingFunction) {
      ImplicitAnimationTimingFunction = SCNKitGetImplicitAnimationTimingFunction();
    }
    memset(&v113, 0, sizeof(v113));
    memset(&v112, 0, sizeof(v112));
    if ([v3 parentNode])
    {
      v21 = objc_msgSend((id)objc_msgSend(v3, "parentNode"), "presentationNode");
      if (v21)
      {
        SCNMatrix4 v111 = SCNMatrix4Identity;
        [v21 convertTransform:&v111 fromNode:v13];
        goto LABEL_24;
      }
    }
    else if (v13)
    {
      [(SCNNode *)v13 worldTransform];
      goto LABEL_24;
    }
    memset(&v112, 0, sizeof(v112));
LABEL_24:
    memset(&v111, 0, sizeof(v111));
    v22 = (void *)[v3 presentationNode];
    if (v22) {
      [v22 transform];
    }
    else {
      memset(&v111, 0, sizeof(v111));
    }
    SCNMatrix4 m = v111;
    SCNMatrix4Invert(&a, &m);
    SCNMatrix4 v111 = a;
    SCNMatrix4 a = v112;
    SCNMatrix4 m = v111;
    SCNMatrix4Mult(&v113, &a, &m);
    v23 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
    [v23 setDuration:v16];
    [v23 setTimingFunction:ImplicitAnimationTimingFunction];
    [v23 setAdditive:1];
    SCNMatrix4 a = v113;
    objc_msgSend(v23, "setFromValue:", objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNMatrix4:", &a));
    SCNMatrix4 a = SCNMatrix4Identity;
    objc_msgSend(v23, "setToValue:", objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNMatrix4:", &a));
    [v3 addAnimation:v23 forKey:0];
    v24 = [(SCNNode *)v13 camera];
    v25 = objc_msgSend((id)objc_msgSend(v3, "presentationNode"), "camera");
    if ([(SCNCamera *)v24 hasCustomProjectionTransform]
      || ([v25 hasCustomProjectionTransform] & 1) != 0)
    {
LABEL_98:
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      uint64_t v86 = [&unk_26BFC17C8 countByEnumeratingWithState:&v103 objects:v115 count:16];
      if (v86)
      {
        uint64_t v87 = v86;
        uint64_t v88 = *(void *)v104;
        do
        {
          for (uint64_t i = 0; i != v87; ++i)
          {
            if (*(void *)v104 != v88) {
              objc_enumerationMutation(&unk_26BFC17C8);
            }
            uint64_t v90 = *(void *)(*((void *)&v103 + 1) + 8 * i);
            objc_msgSend((id)objc_msgSend(v25, "valueForKey:", v90), "doubleValue");
            double v92 = v91;
            objc_msgSend((id)-[SCNCamera valueForKey:](v24, "valueForKey:", v90), "doubleValue");
            if (v92 != v93)
            {
              double v94 = v93;
              v95 = v25;
              v96 = v24;
              id v97 = v3;
              v98 = (void *)MEMORY[0x263F15760];
              uint64_t v99 = [@"camera." stringByAppendingString:v90];
              v100 = v98;
              id v3 = v97;
              v24 = v96;
              v25 = v95;
              v101 = (void *)[v100 animationWithKeyPath:v99];
              [v101 setDuration:v16];
              [v101 setTimingFunction:ImplicitAnimationTimingFunction];
              objc_msgSend(v101, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v94 - v92));
              objc_msgSend(v101, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
              [v101 setAdditive:1];
              [v3 addAnimation:v101 forKey:0];
            }
          }
          uint64_t v87 = [&unk_26BFC17C8 countByEnumeratingWithState:&v103 objects:v115 count:16];
        }
        while (v87);
      }
LABEL_107:
      if (!+[SCNTransaction immediateMode]) {
        +[SCNTransaction commit];
      }
      return;
    }
    double height = self->_framebufferInfo.drawableSize.height;
    if (height == 0.0) {
      CGFloat v27 = 1.0;
    }
    else {
      CGFloat v27 = self->_framebufferInfo.drawableSize.width / height;
    }
    if ([v25 useLegacyFov])
    {
      [v25 xFov];
      double v29 = v28;
      [v25 yFov];
      if (v30 == 0.0 && v29 == 0.0) {
        double v32 = 60.0;
      }
      else {
        double v32 = v30;
      }
      if (v29 != 0.0 && v32 != 0.0)
      {
        double v33 = tan(v29 / 180.0 * 3.14159265);
        if (v33 / tan(v32 / 180.0 * 3.14159265) <= v27) {
          double v29 = 0.0;
        }
        else {
          double v32 = 0.0;
        }
      }
      *(void *)&a.m11 = 0;
      *(void *)&m.m11 = 0;
      if ([(SCNCamera *)v24 useLegacyFov])
      {
        [(SCNCamera *)v24 xFov];
        double v35 = v34;
        [(SCNCamera *)v24 yFov];
        _SCNGetEffectiveLegacyFieldOfView((double *)&a.m11, (double *)&m.m11, v35, v36, v27);
        if (v29 == 0.0)
        {
          *(void *)&a.m11 = 0;
          double v38 = *(double *)&m.m11;
          if (*(double *)&m.m11 == 0.0) {
            double v38 = _SCNConvertFieldOfViewFromHorizontalToVertical(0.0, v27);
          }
          *(double *)&m.m11 = v38;
          double v37 = 0.0;
        }
        else
        {
          double v37 = *(double *)&a.m11;
          if (*(double *)&a.m11 == 0.0) {
            double v37 = _SCNConvertFieldOfViewFromVerticalToHorizontal(*(double *)&m.m11, v27);
          }
          *(double *)&a.m11 = v37;
          *(void *)&m.m11 = 0;
          double v38 = 0.0;
        }
      }
      else
      {
        [(SCNCamera *)v24 fieldOfView];
        float v48 = v47;
        if (v29 == 0.0)
        {
          *(void *)&a.m11 = 0;
          double v38 = v48;
          double v37 = 0.0;
          if ([(SCNCamera *)v24 projectionDirection]) {
            double v38 = _SCNConvertFieldOfViewFromHorizontalToVertical(v38, v27);
          }
        }
        else
        {
          double v37 = v48;
          if ([(SCNCamera *)v24 projectionDirection] != SCNCameraProjectionDirectionHorizontal) {
            double v37 = _SCNConvertFieldOfViewFromVerticalToHorizontal(v37, v27);
          }
          *(double *)&a.m11 = v37;
          double v38 = 0.0;
        }
        *(double *)&m.m11 = v38;
      }
      if (v29 == 0.0)
      {
        if (v32 == 0.0) {
          goto LABEL_83;
        }
        if (v38 == v32)
        {
          v55 = @"camera.xFov";
          goto LABEL_81;
        }
        v54 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"camera.yFov"];
        [v54 setDuration:v16];
        [v54 setTimingFunction:ImplicitAnimationTimingFunction];
        objc_msgSend(v54, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v38 - v32));
        v55 = @"camera.xFov";
      }
      else
      {
        if (v37 == v29)
        {
          v55 = @"camera.yFov";
          goto LABEL_81;
        }
        v54 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"camera.xFov"];
        [v54 setDuration:v16];
        [v54 setTimingFunction:ImplicitAnimationTimingFunction];
        objc_msgSend(v54, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v37 - v29));
        v55 = @"camera.yFov";
      }
      objc_msgSend(v54, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
      [v54 setAdditive:1];
      [v3 addAnimation:v54 forKey:0];
LABEL_81:
      v53 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:v55];
      [v53 setDuration:v16];
      [v53 setTimingFunction:ImplicitAnimationTimingFunction];
      objc_msgSend(v53, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
      objc_msgSend(v53, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
LABEL_82:
      [v3 addAnimation:v53 forKey:0];
LABEL_83:
      if ([(SCNCamera *)v24 usesOrthographicProjection])
      {
        if ([v25 usesOrthographicProjection])
        {
          [(SCNCamera *)v24 orthographicScale];
          double v57 = v56;
          [v25 orthographicScale];
          if (v57 != v58)
          {
            v59 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"camera.orthographicScale"];
            [v59 setDuration:v16];
            [v59 setTimingFunction:ImplicitAnimationTimingFunction];
            v60 = NSNumber;
            [(SCNCamera *)v24 orthographicScale];
            double v62 = v61;
            [v25 orthographicScale];
            objc_msgSend(v59, "setFromValue:", objc_msgSend(v60, "numberWithDouble:", v62 - v63));
            objc_msgSend(v59, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
            [v59 setAdditive:1];
            [v3 addAnimation:v59 forKey:0];
          }
        }
      }
      [(SCNCamera *)v24 lensShift];
      float32x2_t v65 = v64;
      [v25 lensShift];
      uint32x2_t v67 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v65, v66));
      if ((vpmax_u32(v67, v67).u32[0] & 0x80000000) != 0)
      {
        [(SCNCamera *)v24 lensShift];
        float32x2_t v69 = v68;
        [v25 lensShift];
        float32x2_t v71 = vsub_f32(v69, v70);
        v72 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"camera.lensShift"];
        [v72 setDuration:v16];
        [v72 setTimingFunction:ImplicitAnimationTimingFunction];
        objc_msgSend(v72, "setFromValue:", objc_msgSend(MEMORY[0x263F08D40], "SCN_valueWithCGPoint:", vcvtq_f64_f32(v71)));
        objc_msgSend(v72, "setToValue:", objc_msgSend(NSNumber, "SCN_valueWithCGPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8)));
        [v72 setAdditive:1];
        [v3 addAnimation:v72 forKey:0];
      }
      long long v73 = 0uLL;
      memset(&a, 0, 48);
      if (v24)
      {
        [(SCNCamera *)v24 postProjectionTransform];
        long long v73 = 0uLL;
      }
      *(_OWORD *)&m.m21 = v73;
      *(_OWORD *)&m.m31 = v73;
      *(_OWORD *)&m.m11 = v73;
      if (v25) {
        [v25 postProjectionTransform];
      }
      *(_OWORD *)&t1.SCNMatrix4 a = *(_OWORD *)&a.m11;
      *(_OWORD *)&t1.c = *(_OWORD *)&a.m21;
      *(_OWORD *)&t1.tx = *(_OWORD *)&a.m31;
      *(_OWORD *)&t2.SCNMatrix4 a = *(_OWORD *)&m.m11;
      *(_OWORD *)&t2.c = *(_OWORD *)&m.m21;
      *(_OWORD *)&t2.tx = *(_OWORD *)&m.m31;
      if (!CGAffineTransformEqualToTransform(&t1, &t2))
      {
        float32x2_t v74 = vcvt_f32_f64(*(float64x2_t *)&a.m31);
        float32x2_t v75 = vcvt_f32_f64(*(float64x2_t *)&m.m31);
        uint32x2_t v76 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v74, v75));
        if ((vpmax_u32(v76, v76).u32[0] & 0x80000000) != 0)
        {
          float32x2_t v77 = vsub_f32(v74, v75);
          v78 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"camera.postProjectionTransformTranslation"];
          [v78 setDuration:v16];
          [v78 setTimingFunction:ImplicitAnimationTimingFunction];
          objc_msgSend(v78, "setFromValue:", objc_msgSend(MEMORY[0x263F08D40], "SCN_valueWithCGPoint:", vcvtq_f64_f32(v77)));
          objc_msgSend(v78, "setToValue:", objc_msgSend(NSNumber, "SCN_valueWithCGPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8)));
          [v78 setAdditive:1];
          [v3 addAnimation:v78 forKey:0];
        }
        v79.f64[0] = *(float64_t *)&a.m11;
        v79.f64[1] = *(float64_t *)&a.m23;
        v80.f64[0] = *(float64_t *)&m.m11;
        v80.f64[1] = *(float64_t *)&m.m23;
        float32x2_t v81 = vcvt_f32_f64(v79);
        float32x2_t v82 = vcvt_f32_f64(v80);
        uint32x2_t v83 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(v81, v82));
        if ((vpmax_u32(v83, v83).u32[0] & 0x80000000) != 0)
        {
          float32x2_t v84 = vsub_f32(v81, v82);
          v85 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"camera.postProjectionTransformScale"];
          [v85 setDuration:v16];
          [v85 setTimingFunction:ImplicitAnimationTimingFunction];
          objc_msgSend(v85, "setFromValue:", objc_msgSend(MEMORY[0x263F08D40], "SCN_valueWithCGPoint:", vcvtq_f64_f32(v84)));
          objc_msgSend(v85, "setToValue:", objc_msgSend(NSNumber, "SCN_valueWithCGPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8)));
          [v85 setAdditive:1];
          [v3 addAnimation:v85 forKey:0];
        }
      }
      goto LABEL_98;
    }
    [v25 fieldOfView];
    double v40 = v39;
    if ([(SCNCamera *)v24 useLegacyFov])
    {
      *(void *)&a.m11 = 0;
      *(void *)&m.m11 = 0;
      [(SCNCamera *)v24 xFov];
      double v42 = v41;
      [(SCNCamera *)v24 yFov];
      _SCNGetEffectiveLegacyFieldOfView((double *)&a.m11, (double *)&m.m11, v42, v43, v27);
      if ([v25 projectionDirection] == 1)
      {
        double v44 = *(double *)&a.m11;
        if (*(double *)&a.m11 == 0.0)
        {
          double v45 = *(double *)&m.m11;
          double v46 = v27;
LABEL_59:
          double v52 = _SCNConvertFieldOfViewFromVerticalToHorizontal(v45, v46);
LABEL_63:
          double v44 = v52;
        }
LABEL_64:
        if (v44 == v40) {
          goto LABEL_83;
        }
        v53 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"camera.fieldOfView"];
        [v53 setDuration:v16];
        [v53 setTimingFunction:ImplicitAnimationTimingFunction];
        objc_msgSend(v53, "setFromValue:", objc_msgSend(NSNumber, "numberWithDouble:", v44 - v40));
        objc_msgSend(v53, "setToValue:", objc_msgSend(NSNumber, "numberWithDouble:", 0.0));
        [v53 setAdditive:1];
        goto LABEL_82;
      }
      double v44 = *(double *)&m.m11;
      if (*(double *)&m.m11 != 0.0) {
        goto LABEL_64;
      }
      double v45 = *(double *)&a.m11;
      double v46 = v27;
    }
    else
    {
      [(SCNCamera *)v24 fieldOfView];
      double v44 = v49;
      uint64_t v50 = [v25 projectionDirection];
      if (v50 == [(SCNCamera *)v24 projectionDirection]) {
        goto LABEL_64;
      }
      uint64_t v51 = [v25 projectionDirection];
      double v45 = v44;
      double v46 = v27;
      if (v51 == 1) {
        goto LABEL_59;
      }
    }
    double v52 = _SCNConvertFieldOfViewFromHorizontalToVertical(v45, v46);
    goto LABEL_63;
  }
}

- (id)_defaultPOVForScene:(id)a3
{
  char v5 = objc_msgSend((id)objc_msgSend(a3, "rootNode"), "childNodesPassingTest:", &__block_literal_global_73);
  if ([v5 count])
  {
    return (id)[v5 objectAtIndex:0];
  }
  else
  {
    uint64_t v7 = (__n128 *)[a3 sceneRef];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v8 = [(SCNSceneRenderer *)self->_privateRendererOwner _isEditor];
    }
    else {
      int v8 = 0;
    }
    id result = C3DCreateDefaultCameraNode(v7, v8);
    if (result)
    {
      id v9 = result;
      uint64_t v10 = +[SCNNode nodeWithNodeRef:result];
      CFRelease(v9);
      return v10;
    }
  }
  return result;
}

BOOL __35__SCNRenderer__defaultPOVForScene___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v4 = [a2 camera];
  if (v4) {
    *a3 = 1;
  }
  return v4 != 0;
}

- (id)_initWithOptions:(id)a3 isPrivateRenderer:(BOOL)a4 privateRendererOwner:(id)a5 clearsOnDraw:(BOOL)a6 context:(void *)a7 renderingAPI:(unint64_t)a8
{
  BOOL v12 = a4;
  v47.receiver = self;
  v47.super_class = (Class)SCNRenderer;
  BOOL v13 = [(SCNRenderer *)&v47 init];
  uint64_t v14 = (uint64_t)v13;
  if (v13)
  {
    v13->_scene = 0;
    v13->_viewpoints = 0;
    v13->_contentScaleFactor = 1.0;
    v13->_engineContext = (__C3DEngineContext *)C3DEngineContextCreateWithOptions();
    *(void *)(v14 + 224) = a8;
    *(unsigned char *)(v14 + 129) |= 0x40u;
    if (!a8) {
      C3DNotifyMetalIsUsed();
    }
    *(void *)(v14 + 32) = objc_alloc_init(SCNRecursiveLock);
    [(id)v14 _updateEngineCallbacks];
    C3DEngineContextSetRenderingOptionForKey(*(void *)(v14 + 216), @"frustumCulling", (void *)*MEMORY[0x263EFFB40]);
    C3DEngineContextSetClearsOnDraw(*(void *)(v14 + 216), a6);
    uint64_t v15 = *(void *)(v14 + 216);
    if (v15)
    {
      C3DEngineContextSetUserInfo(v15, v14);
    }
    else
    {
      double v16 = scn_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SCNRenderer _initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:]();
      }
    }
    *(unsigned char *)(v14 + 193) = 1;
    if (v12) {
      char v17 = 4;
    }
    else {
      char v17 = 0;
    }
    *(unsigned char *)(v14 + 129) = *(unsigned char *)(v14 + 129) & 0xFB | v17;
    *(void *)(v14 + 344) = a5;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v19 = *(unsigned char *)(v14 + 129);
    if (isKindOfClass) {
      char v20 = 8;
    }
    else {
      char v20 = 0;
    }
    *(unsigned char *)(v14 + 129) = v19 & 0xF7 | v20;
    if ((v19 & 4) != 0)
    {
      v21 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v21 addObserver:v14 selector:sel__UIOrientationDidChangeNotification_ name:*MEMORY[0x263F1D048] object:0];
      if ((*(unsigned char *)(v14 + 129) & 8) != 0) {
        int v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v14 + 344), "window"), "windowScene"), "interfaceOrientation");
      }
      else {
        int v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "statusBarOrientation");
      }
      C3DEngineContextSetInterfaceOrientation(*(void *)(v14 + 216), v22);
    }
    *(void *)(v14 + 56) = 0;
    if (v12)
    {
      if ((_initWithOptions_isPrivateRenderer_privateRendererOwner_clearsOnDraw_context_renderingAPI__first & 1) == 0)
      {
        _initWithOptions_isPrivateRenderer_privateRendererOwner_clearsOnDraw_context_renderingAPI__first = 1;
        getpid();
        proc_disable_wakemon();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = scn_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          [(SCNRenderer *)v23 _initWithOptions:v25 isPrivateRenderer:v26 privateRendererOwner:v27 clearsOnDraw:v28 context:v29 renderingAPI:v30];
        }
      }
      v31 = NSString;
      double v32 = (objc_class *)objc_opt_class();
      double v33 = (const char *)[(id)objc_msgSend(v31 stringWithFormat:@"com.apple.scenekit.renderingQueue.%@%p", NSStringFromClass(v32), *(void *)(v14 + 344)), "cStringUsingEncoding:", 1];
      double v34 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      *(void *)(v14 + 40) = dispatch_queue_create(v33, v34);
    }
    if (*(void *)(v14 + 224))
    {
      if (a7)
      {
        [(id)v14 setContext:a7];
        Class v35 = NSClassFromString(&cfstr_Skglobalshared.isa);
        [NSClassFromString(&cfstr_Skscnrenderer.isa) setPrefersOpenGL:1];
        if (![(objc_class *)v35 globalGLSharedContext]) {
          [(objc_class *)v35 setGlobalGLSharedContext:a7];
        }
      }
    }
    else
    {
      if (([a7 conformsToProtocol:&unk_26C009298] & 1) == 0)
      {
        double v36 = scn_default_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
          [(SCNRenderer *)v36 _initWithOptions:v38 isPrivateRenderer:v39 privateRendererOwner:v40 clearsOnDraw:v41 context:v42 renderingAPI:v43];
        }
      }
      *(void *)(v14 + 280) = -[SCNMTLRenderContext initWithDevice:engineContext:]([SCNMTLRenderContext alloc], a7, *(void *)(v14 + 216));
      uint64_t v44 = SCNSampleCountForAntialiasingMode([(id)v14 _antialiasingMode]);
      -[SCNMTLRenderContext setSampleCount:](*(void *)(v14 + 280), v44);
      C3DEngineContextSetRenderContext(*(void *)(v14 + 216), *(CFTypeRef *)(v14 + 280));

      Class v45 = NSClassFromString(&cfstr_Skglobalshared.isa);
      if (objc_opt_respondsToSelector()) {
        [(objc_class *)v45 setGlobalMetalDevice:a7];
      }
    }
  }
  return (id)v14;
}

- (void)_updateEngineCallbacks
{
  engineContext = self->_engineContext;
  if (engineContext)
  {
    RenderCallbacks = (void *)C3DEngineContextGetRenderCallbacks((uint64_t)engineContext);
    __int16 delegationConformance = (__int16)self->_delegationConformance;
    if ((delegationConformance & 0x10) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x10) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x10) != 0)
    {
      void *RenderCallbacks = _willRenderSceneEngineContextCallback;
      __int16 delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x20) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0)
    {
      RenderCallbacks[1] = _didRenderSceneEngineContextCallback;
      __int16 delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x80) != 0
      || (*(_WORD *)&self->_selfDelegationConformance & 0x80) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x80) != 0)
    {
      RenderCallbacks[3] = _readSubdivCacheEngineContextCallback;
      __int16 delegationConformance = (__int16)self->_delegationConformance;
    }
    if ((delegationConformance & 0x100) != 0
      || (selfDelegationConformance = (__int16)self->_selfDelegationConformance, (selfDelegationConformance & 0x100) != 0)
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x100) != 0)
    {
      RenderCallbacks[4] = _writeSubdivCacheEngineContextCallback;
      selfDelegationConformance = (__int16)self->_selfDelegationConformance;
    }
    if ((selfDelegationConformance & 0x200) != 0
      || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x200) != 0)
    {
      RenderCallbacks[5] = _wantsMainPassCustomPostProcessEncodingEngineContextCallback;
      RenderCallbacks[6] = _mainPassCustomPostProcessUsesExtraRenderTargetEngineContextCallback;
      RenderCallbacks[7] = _useSpecificMainPassClearColorEngineContextCallback;
      RenderCallbacks[8] = _encodeMainPassCustomPostProcessEngineContextCallback;
    }
    RenderCallbacks[2] = _renderOverlayEngineContextCallback;
  }
}

- (void)set_antialiasingMode:(unint64_t)a3
{
  if (self->__antialiasingMode != a3)
  {
    self->__antialiasingMode = a3;
    [(SCNRenderer *)self _invalidateFramebuffer];
    uint64_t v4 = SCNSampleCountForAntialiasingMode([(SCNRenderer *)self _antialiasingMode]);
    uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)[(SCNRenderer *)self _engineContext]);
    if (RendererContextGL)
    {
      C3DRendererContextSetSampleCount(RendererContextGL, v4);
    }
    else
    {
      renderContext = self->_renderContext;
      if (renderContext)
      {
        -[SCNMTLRenderContext setSampleCount:]((uint64_t)renderContext, v4);
      }
    }
  }
}

- (void)_invalidateFramebuffer
{
  *((unsigned char *)self + 129) |= 1u;
}

- (void)set_wantsSceneRendererDelegationMessages:(BOOL)a3
{
  if (a3) {
    char v4 = 8;
  }
  else {
    char v4 = 0;
  }
  *((unsigned char *)self + 288) = *((unsigned char *)self + 288) & 0xF7 | v4;
  if (!a3 || (*((unsigned char *)self + 129) & 4) != 0)
  {
    __int16 v13 = 0;
    selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFE00;
  }
  else
  {
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 2;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFD | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 4;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFFB | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 8;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFF7 | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 16;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFEF | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 32;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFDF | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 128;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFF7F | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 256;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFEFF | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 64;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->_selfDelegationConformance = *(_WORD *)&self->_selfDelegationConformance & 0xFFBF | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 512;
    }
    else {
      __int16 v13 = 0;
    }
    selfDelegationConformance = (__int16)self->_selfDelegationConformance;
  }
  *(_WORD *)&self->_selfDelegationConformance = selfDelegationConformance & 0xFDFF | v13;

  [(SCNRenderer *)self _updateEngineCallbacks];
}

- (void)setJitteringEnabled:(BOOL)a3
{
  *((unsigned char *)self + 288) = *((unsigned char *)self + 288) & 0xFE | a3;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  objc_storeWeak(&self->_delegate, 0);

  self->_preloadRenderer = 0;
  self->_technique = 0;

  self->_mtlTexture = 0;
  if (self->_glContext)
  {
    id v3 = (EAGLContext *)(id)[MEMORY[0x263F146E8] currentContext];
    char v4 = v3;
    glContext = self->_glContext;
    if (glContext && v3 != glContext) {
      objc_msgSend(MEMORY[0x263F146E8], "setCurrentContext:");
    }
  }
  else
  {
    char v4 = 0;
  }
  if (self->_framebufferInfo.frameBuffer)
  {
    uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    deleteGLFramebufferInfo((uint64_t *)&self->_framebufferInfo, RendererContextGL);
  }

  if (self->_engineContext)
  {
    objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "removeSourceRenderersForEngineContext:", self->_engineContext);
    C3DEngineContextCleanup((uint64_t)self->_engineContext);
    CFRelease(self->_engineContext);
  }
  __int16 v7 = self->_glContext;
  if (v7)
  {
    __int16 v8 = v4;
    if (v4 == v7)
    {
      if ([(EAGLContext *)v4 retainCount] != 2) {
        goto LABEL_15;
      }
      __int16 v8 = 0;
    }
    [MEMORY[0x263F146E8] setCurrentContext:v8];
  }
LABEL_15:
  renderingQueue = self->__renderingQueue;
  if (renderingQueue) {
    dispatch_release(renderingQueue);
  }
  prepareQueue = self->__prepareQueue;
  if (prepareQueue) {
    dispatch_release(prepareQueue);
  }

  self->_glContext = 0;
  v11.receiver = self;
  v11.super_class = (Class)SCNRenderer;
  [(SCNRenderer *)&v11 dealloc];
}

- (unint64_t)_antialiasingMode
{
  if (C3DPreferencesGetBool(5)) {
    return 0;
  }
  else {
    return self->__antialiasingMode;
  }
}

- (void)_didRenderScene:(id)a3
{
  if ((*(_WORD *)&self->_delegationConformance & 0x20) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0)
  {
    +[SCNTransaction setImmediateMode:1];
    +[SCNTransaction setImmediateModeRestrictedContext:](SCNTransaction, "setImmediateModeRestrictedContext:", [a3 sceneRef]);
    uint64_t Stats = C3DEngineContextGetStats((uint64_t)self->_engineContext);
    double v6 = CACurrentMediaTime();
    [(SCNRenderer *)self _getFrameIndex];
    kdebug_trace();
    if (!self->_renderingAPI && !-[SCNMTLRenderContext clientCommandBuffer]((uint64_t)self->_renderContext)) {
      [(id)-[SCNMTLRenderContext currentCommandBuffer]((uint64_t)self->_renderContext) enqueue];
    }
    double forceSystemTime = self->_forceSystemTime;
    if (forceSystemTime == 0.0) {
      double forceSystemTime = self->_currentSystemTime;
    }
    if ((*(_WORD *)&self->_delegationConformance & 0x20) != 0)
    {
      privateRendererOwner = self;
      if ((*((unsigned char *)self + 129) & 4) != 0) {
        privateRendererOwner = self->_privateRendererOwner;
      }
      [self->_delegate renderer:privateRendererOwner didRenderScene:a3 atTime:forceSystemTime];
    }
    if ((*(_WORD *)&self->_selfDelegationConformance & 0x20) != 0) {
      [(SCNRenderer *)self _renderer:self didRenderScene:a3 atTime:forceSystemTime];
    }
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x20) != 0) {
      [(SCNSceneRenderer *)self->_privateRendererOwner _renderer:self->_privateRendererOwner didRenderScene:a3 atTime:forceSystemTime];
    }
    kdebug_trace();
    *(double *)(Stats + 168) = *(double *)(Stats + 168) + CACurrentMediaTime() - v6;
    +[SCNTransaction setImmediateModeRestrictedContext:0];
    +[SCNTransaction setImmediateMode:0];
  }
}

- (BOOL)showsStatistics
{
  return self->_showStatistics;
}

- (SKScene)overlaySKScene
{
  return (SKScene *)self->_overlayScene;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandBufferStatusMonitor);

  objc_destroyWeak((id *)&self->_resourceManagerMonitor);
}

- (void)setContext:(id)a3
{
  if (self->_engineContext && self->_glContext != a3)
  {
    uint64_t v5 = [MEMORY[0x263F146E8] currentContext];
    if (self->_glContext)
    {
      objc_msgSend(MEMORY[0x263F146E8], "setCurrentContext:");
      [(SCNRenderer *)self _deleteGLFramebuffer];
    }
    self->_glContext = (EAGLContext *)a3;
    [MEMORY[0x263F146E8] setCurrentContext:v5];
    if (self->_glContext)
    {
      objc_msgSend(MEMORY[0x263F146E8], "setCurrentContext:");
      C3DEngineContextSetGLContext((uint64_t)self->_engineContext, self->_glContext);
      if (self->_authoringEnvironment)
      {
        if (self->_privateRendererOwner) {
          privateRendererOwner = self->_privateRendererOwner;
        }
        else {
          privateRendererOwner = self;
        }
        __int16 v7 = (SCNAuthoringEnvironment *)+[SCNAuthoringEnvironment authoringEnvironmentForSceneRenderer:privateRendererOwner createIfNeeded:1];

        self->_authoringEnvironment = v7;
      }
      C3DFXInvalidatePasses((uint64_t)self->_engineContext);
      uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
      if (RendererContextGL)
      {
        uint64_t v9 = RendererContextGL;
        int v10 = SCNSampleCountForAntialiasingMode([(SCNRenderer *)self _antialiasingMode]);
        C3DRendererContextSetSampleCount(v9, v10);
      }
    }
  }
}

- (SCNRenderer)init
{
  return self;
}

+ (SCNRenderer)rendererWithDevice:(id)device options:(NSDictionary *)options
{
  uint64_t v5 = device;
  if (device
    || (result = +[SCNView deviceForOptions:options], (uint64_t v5 = result) != 0))
  {
    __int16 v8 = (void *)[objc_alloc((Class)a1) _initWithOptions:options isPrivateRenderer:0 privateRendererOwner:0 clearsOnDraw:0 context:v5 renderingAPI:0];
    return (SCNRenderer *)v8;
  }
  return result;
}

+ (SCNRenderer)rendererWithContext:(EAGLContext *)context options:(NSDictionary *)options
{
  char v4 = context;
  if (!context)
  {
    id v6 = objc_alloc(MEMORY[0x263F146E8]);
    char v4 = (EAGLContext *)(id)[v6 initWithAPI:2 properties:MEMORY[0x263EFFA78]];
  }
  __int16 v7 = (void *)[objc_alloc((Class)a1) _initWithOptions:0 isPrivateRenderer:0 privateRendererOwner:0 clearsOnDraw:0 context:v4 renderingAPI:__inferRenderingAPIFromGLContext(v4)];

  return (SCNRenderer *)v7;
}

- (NSString)description
{
  id v3 = NSString;
  char v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(SCNRenderer *)self scene];
  __int16 v7 = [(SCNRenderer *)self pointOfView];
  [(SCNRenderer *)self sceneTime];
  return (NSString *)[v3 stringWithFormat:@"<%@ %p: scene = %@, pointOfView = %@, sceneTime = %f, context = %p>", v5, self, v6, v7, v8, -[SCNRenderer context](self, "context")];
}

- (unint64_t)renderingAPI
{
  return self->_renderingAPI;
}

- (id)currentCommandBuffer
{
  if (self->_renderingAPI) {
    return 0;
  }
  else {
    return (id)-[SCNMTLRenderContext currentCommandBuffer]((uint64_t)self->_renderContext);
  }
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  if (self->_renderingAPI) {
    return 0;
  }
  else {
    return (MTLRenderPassDescriptor *)-[SCNMTLRenderContext currentRenderPassDescriptor]((uint64_t)self->_renderContext);
  }
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  if (self->_renderingAPI) {
    return 0;
  }
  else {
    return (MTLRenderCommandEncoder *)-[SCNMTLRenderContext currentRenderCommandEncoder]((uint64_t)self->_renderContext);
  }
}

- (MTLDevice)device
{
  if (self->_renderingAPI) {
    return 0;
  }
  else {
    return (MTLDevice *)-[SCNMTLRenderContext device]((uint64_t)self->_renderContext);
  }
}

- (MTLCommandQueue)commandQueue
{
  if (self->_renderingAPI) {
    return 0;
  }
  else {
    return (MTLCommandQueue *)-[SCNMTLRenderContext commandQueue]((uint64_t)self->_renderContext);
  }
}

- (unint64_t)depthPixelFormat
{
  if (self->_renderingAPI) {
    return 0;
  }
  else {
    return 252;
  }
}

- (unint64_t)stencilPixelFormat
{
  return 0;
}

- (BOOL)_installContext
{
  if (self->_renderContext) {
    goto LABEL_4;
  }
  v2 = [(SCNRenderer *)self context];
  if (v2)
  {
    [MEMORY[0x263F146E8] setCurrentContext:v2];
LABEL_4:
    LOBYTE(v2) = 1;
  }
  return (char)v2;
}

- (void)_installViewport
{
}

- (void)_clearBackBuffer
{
  renderContext = self->_renderContext;
  engineContext = self->_engineContext;
  if (renderContext)
  {
    uint64_t RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)engineContext);
    C3DRenderGraphClearDrawable(RenderGraph);
  }
  else
  {
    uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)engineContext);
    if (self->_backgroundColor)
    {
      p_c3dBackgroundColor = &self->_c3dBackgroundColor;
      GLbitfield v8 = 17664;
    }
    else
    {
      GLbitfield v8 = 1280;
      p_c3dBackgroundColor = 0;
    }
    C3DRendererContextClear(RendererContextGL, v8, (float32x4_t *)p_c3dBackgroundColor);
  }
}

- (void)_setContentsScaleFactor:(double)a3
{
  float v3 = a3;
  self->_contentScaleFactor = v3;
  if (self->_renderContext)
  {
    renderContext = self->_renderContext;
    -[SCNMTLRenderContext setContentScaleFactor:]((uint64_t)renderContext, a3);
  }
  else
  {
    uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    if (RendererContextGL)
    {
      C3DRendererContextSetContentScaleFactor(RendererContextGL, v3);
    }
  }
}

- (double)_contentsScaleFactor
{
  return self->_contentScaleFactor;
}

- (CGSize)_backingSize
{
  double width = self->_framebufferInfo.drawableSize.width;
  double height = self->_framebufferInfo.drawableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setBackingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width != self->_framebufferInfo.drawableSize.width || a3.height != self->_framebufferInfo.drawableSize.height)
  {
    self->_framebufferInfo.CGSize drawableSize = a3;
    [(SCNRenderer *)self _invalidateFramebuffer];
    if (self->_renderContext && !self->_renderingAPI && (*((unsigned char *)self + 129) & 8) != 0) {
      objc_msgSend(-[SCNRenderer metalLayer](self, "metalLayer"), "setDrawableSize:", width, height);
    }
    if (self->_overlayScene)
    {
      [(SCNRenderer *)self _prepareSKRenderer];
    }
  }
}

- (void)_deleteGLFramebuffer
{
}

- (void)_resolveAndDiscardGL
{
  uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
  if (self->_framebufferInfo.multisamplingFrameBuffer)
  {
    uint64_t v4 = RendererContextGL;
    double Size = C3DFramebufferGetSize((uint64_t)self->_framebufferInfo.frameBuffer);
    *(void *)&long long v6 = 0;
    *((double *)&v6 + 1) = Size;
    long long v7 = v6;
    C3DRendererContextResolveFramebuffer(v4, (uint64_t)self->_framebufferInfo.frameBuffer, (uint64_t)self->_framebufferInfo.multisamplingFrameBuffer, 1, 1, &v7);
  }
}

- (void)_prepareGLRenderTarget
{
}

void __37__SCNRenderer__prepareGLRenderTarget__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 344), "scn_backingLayer");
  if (([*(id *)(*(void *)(a1 + 32) + 272) renderbufferStorage:36161 fromDrawable:v2] & 1) == 0)
  {
    float v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __37__SCNRenderer__prepareGLRenderTarget__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)_createOffscreenFramebufferIfNeeded
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: framebuffer width must be > 0", v2, v3, v4, v5, v6);
}

- (void)set_superSamplingFactor:(double)a3
{
  float v3 = a3;
  C3DEngineContextSetSuperSamplingFactor((uint64_t)self->_engineContext, v3);
}

- (double)_superSamplingFactor
{
  return C3DEngineContextGetSuperSamplingFactor((uint64_t)self->_engineContext);
}

- (void)set_aspectRatio:(double)a3
{
  self->__aspectRatio = a3;
}

- (double)_aspectRatio
{
  return self->__aspectRatio;
}

- (void)set_screenTransform:(SCNMatrix4 *)a3
{
  long long v3 = *(_OWORD *)&a3->m21;
  v5[0] = *(_OWORD *)&a3->m11;
  v5[1] = v3;
  long long v4 = *(_OWORD *)&a3->m41;
  v5[2] = *(_OWORD *)&a3->m31;
  v5[3] = v4;
  -[SCNMTLRenderContext setScreenTransform:]((uint64_t)self->_renderContext, (uint64_t)v5);
}

- (SCNMatrix4)_screenTransform
{
  [(SCNMTLRenderContext *)self->_renderContext screenTransform];
  return result;
}

- (__C3DRendererContext)_rendererContextGL
{
  CGSize result = (__C3DRendererContext *)self->_engineContext;
  if (result) {
    return (__C3DRendererContext *)C3DEngineContextGetRendererContextGL((uint64_t)result);
  }
  return result;
}

- (BOOL)autoenablesDefaultLighting
{
  [(SCNRenderer *)self lock];
  long long v3 = [(SCNRenderer *)self _engineContext];
  if (v3)
  {
    BOOL v4 = C3DEngineContextGetRenderingOptionForKey((uint64_t)v3, @"defaultLight") == (const __CFDictionary *)*MEMORY[0x263EFFB40];
  }
  else
  {
    uint64_t v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNRenderer autoenablesDefaultLighting]();
    }
    BOOL v4 = 0;
  }
  [(SCNRenderer *)self unlock];
  return v4;
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  BOOL v3 = a3;
  [(SCNRenderer *)self lock];
  uint64_t v5 = [(SCNRenderer *)self _engineContext];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    uint64_t Scene = C3DEngineContextGetScene((uint64_t)v5);
    if (Scene)
    {
      uint64_t v8 = Scene;
      C3DSceneLock(Scene);
      uint64_t v9 = (void **)MEMORY[0x263EFFB38];
      if (v3) {
        uint64_t v9 = (void **)MEMORY[0x263EFFB40];
      }
      C3DEngineContextSetRenderingOptionForKey(v6, @"defaultLight", *v9);
      C3DSceneUnlock(v8);
    }
    else
    {
      objc_super v11 = (void **)MEMORY[0x263EFFB38];
      if (v3) {
        objc_super v11 = (void **)MEMORY[0x263EFFB40];
      }
      C3DEngineContextSetRenderingOptionForKey(v6, @"defaultLight", *v11);
    }
  }
  else
  {
    int v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SCNRenderer setAutoenablesDefaultLighting:]();
    }
  }
  [(SCNRenderer *)self unlock];
}

- (void)setPointOfCulling:(id)a3
{
  pointOfCulling = self->_pointOfCulling;
  if (pointOfCulling != a3)
  {
    uint64_t v6 = pointOfCulling;
    self->_pointOfCulling = (SCNNode *)a3;
    uint64_t Scene = C3DEngineContextGetScene((uint64_t)self->_engineContext);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __33__SCNRenderer_setPointOfCulling___block_invoke;
    v8[3] = &unk_264006160;
    v8[4] = a3;
    v8[5] = self;
    +[SCNTransaction postCommandWithContext:Scene object:self applyBlock:v8];
  }
}

CFTypeRef __33__SCNRenderer_setPointOfCulling___block_invoke(uint64_t a1)
{
  uint64_t v2 = (const void *)[*(id *)(a1 + 32) nodeRef];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 216);

  return C3DEngineContextSetPointOfCulling(v3, v2);
}

- (id)pointOfCulling
{
  return self->_pointOfCulling;
}

- (void)_projectPoints:(SCNVector3 *)a3 count:(unint64_t)a4 viewport:(SCNVector4)a5
{
  float y = a5.y;
  float x = a5.x;
  uint64_t v8 = [(SCNRenderer *)self _engineContext];
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    PointOfView = C3DEngineContextGetPointOfView((uint64_t)v8);
    if (PointOfView)
    {
      objc_super v11 = PointOfView;
      [(SCNRenderer *)self adjustViewportForRendering:COERCE_DOUBLE(__PAIR64__(LODWORD(y), LODWORD(x)))];
      __n128 v19 = v12;
      if (C3DWasLinkedBeforeMajorOSYear2020())
      {
        char CoordinatesSystemOptions = 0;
        if (!a4) {
          return;
        }
      }
      else
      {
        char CoordinatesSystemOptions = C3DEngineContextGetCoordinatesSystemOptions(v9);
        if (!a4) {
          return;
        }
      }
      p_z = &a3->z;
      do
      {
        v13.i64[0] = *((void *)p_z - 1);
        v13.f32[2] = *p_z;
        float32x4_t v20 = v13;
        if (_C3DProjectPoints(&v20, 1, v11, (uint64_t)[(SCNScene *)[(SCNRenderer *)self scene] sceneRef], CoordinatesSystemOptions, &v20, v19))
        {
          __int32 v16 = v20.i32[2];
          *((void *)p_z - 1) = v20.i64[0];
          *(_DWORD *)p_z = v16;
        }
        p_z += 3;
        --a4;
      }
      while (a4);
    }
  }
}

- (SCNVector3)_projectPoint:(SCNVector3)a3 viewport:(SCNVector4)a4
{
  float y = a4.y;
  float x = a4.x;
  float z = a3.z;
  float v21 = a3.y;
  v20.i64[0] = *(void *)&a3.x;
  uint64_t v5 = [(SCNRenderer *)self _engineContext];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    PointOfView = C3DEngineContextGetPointOfView((uint64_t)v5);
    if (PointOfView)
    {
      uint64_t v8 = PointOfView;
      [(SCNRenderer *)self adjustViewportForRendering:COERCE_DOUBLE(__PAIR64__(LODWORD(y), LODWORD(x)))];
      __n128 v19 = v9;
      float32x4_t v10 = v20;
      v10.f32[1] = v21;
      v10.f32[2] = z;
      float32x4_t v23 = v10;
      if (C3DWasLinkedBeforeMajorOSYear2020()) {
        char CoordinatesSystemOptions = 0;
      }
      else {
        char CoordinatesSystemOptions = C3DEngineContextGetCoordinatesSystemOptions(v6);
      }
      __n128 v12 = [(SCNScene *)[(SCNRenderer *)self scene] sceneRef];
      C3DSceneLock((uint64_t)v12);
      char v13 = _C3DProjectPoints(&v23, 1, v8, (uint64_t)v12, CoordinatesSystemOptions, &v23, v19);
      C3DSceneUnlock((uint64_t)v12);
      if (v13)
      {
        float v21 = v23.f32[1];
        v20.i32[0] = v23.i32[0];
        float z = v23.f32[2];
      }
    }
  }
  float v14 = v20.f32[0];
  float v15 = v21;
  float v16 = z;
  result.float z = v16;
  result.float y = v15;
  result.float x = v14;
  return result;
}

- (SCNVector3)_unprojectPoint:(SCNVector3)a3 viewport:(SCNVector4)a4
{
  float y = a4.y;
  float x = a4.x;
  float z = a3.z;
  float v21 = a3.y;
  v20.i64[0] = *(void *)&a3.x;
  uint64_t v5 = [(SCNRenderer *)self _engineContext];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    PointOfView = C3DEngineContextGetPointOfView((uint64_t)v5);
    if (PointOfView)
    {
      uint64_t v8 = PointOfView;
      [(SCNRenderer *)self adjustViewportForRendering:COERCE_DOUBLE(__PAIR64__(LODWORD(y), LODWORD(x)))];
      __n128 v19 = v9;
      float32x4_t v10 = v20;
      v10.f32[1] = v21;
      v10.f32[2] = z;
      float32x4_t v23 = v10;
      if (C3DWasLinkedBeforeMajorOSYear2020()) {
        char CoordinatesSystemOptions = 0;
      }
      else {
        char CoordinatesSystemOptions = C3DEngineContextGetCoordinatesSystemOptions(v6);
      }
      __n128 v12 = [(SCNScene *)[(SCNRenderer *)self scene] sceneRef];
      C3DSceneLock((uint64_t)v12);
      char v13 = _C3DUnProjectPoints((uint64_t)&v23, 1, v8, (uint64_t)v12, CoordinatesSystemOptions, &v23, v19);
      C3DSceneUnlock((uint64_t)v12);
      if (v13)
      {
        float v21 = v23.f32[1];
        v20.i32[0] = v23.i32[0];
        float z = v23.f32[2];
      }
    }
  }
  float v14 = v20.f32[0];
  float v15 = v21;
  float v16 = z;
  result.float z = v16;
  result.float y = v15;
  result.float x = v14;
  return result;
}

- (SCNVector3)projectPoint:(SCNVector3)result
{
  double width = self->_framebufferInfo.drawableSize.width;
  if (width != 0.0)
  {
    *(float *)&double v3 = width;
    *(float *)&double v4 = self->_framebufferInfo.drawableSize.height;
    -[SCNRenderer _projectPoint:viewport:](self, "_projectPoint:viewport:", *(double *)&result.x, *(double *)&result.y, *(double *)&result.z, 0.0, 0.0, v3, v4);
  }
  return result;
}

- (SCNVector3)unprojectPoint:(SCNVector3)result
{
  double width = self->_framebufferInfo.drawableSize.width;
  if (width != 0.0)
  {
    *(float *)&double v3 = width;
    *(float *)&double v4 = self->_framebufferInfo.drawableSize.height;
    -[SCNRenderer _unprojectPoint:viewport:](self, "_unprojectPoint:viewport:", *(double *)&result.x, *(double *)&result.y, *(double *)&result.z, 0.0, 0.0, v3, v4);
  }
  return result;
}

- (id)_readSubdivCacheForHash:(id)a3
{
  if (((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x80) == 0
     || (id result = (id)[(SCNSceneRenderer *)self->_privateRendererOwner _renderer:self->_privateRendererOwner subdivDataForHash:a3]) == 0)&& ((*(_WORD *)&self->_selfDelegationConformance & 0x80) == 0|| (id result = (id)[(SCNRenderer *)self _renderer:self subdivDataForHash:a3]) == 0))
  {
    if ((*(_WORD *)&self->_delegationConformance & 0x80) == 0) {
      return 0;
    }
    privateRendererOwner = self;
    if ((*((unsigned char *)self + 129) & 4) != 0) {
      privateRendererOwner = self->_privateRendererOwner;
    }
    id result = (id)[self->_delegate _renderer:privateRendererOwner subdivDataForHash:a3];
    if (!result) {
      return 0;
    }
  }
  return result;
}

- (void)_writeSubdivCacheForHash:(id)a3 dataProvider:(id)a4
{
  if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0x100) != 0) {
    [(SCNSceneRenderer *)self->_privateRendererOwner _renderer:self->_privateRendererOwner didBuildSubdivDataForHash:a3 dataProvider:a4];
  }
  if ((*(_WORD *)&self->_selfDelegationConformance & 0x100) != 0) {
    [(SCNRenderer *)self _renderer:self didBuildSubdivDataForHash:a3 dataProvider:a4];
  }
  if ((*(_WORD *)&self->_delegationConformance & 0x100) != 0)
  {
    privateRendererOwner = self;
    if ((*((unsigned char *)self + 129) & 4) != 0) {
      privateRendererOwner = self->_privateRendererOwner;
    }
    id delegate = self->_delegate;
    [delegate _renderer:privateRendererOwner didBuildSubdivDataForHash:a3 dataProvider:a4];
  }
}

- (void)setAutoAdjustCamera:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [(SCNRenderer *)self _engineContext];
  if (v4)
  {
    C3DEngineContextSetAutoAdjustZRange((uint64_t)v4, v3);
  }
}

- (BOOL)autoAdjustCamera
{
  uint64_t v2 = [(SCNRenderer *)self _engineContext];
  if (v2) {
    LOBYTE(v2) = C3DEngineContextGetAutoAdjustZRange((uint64_t)v2) != 0;
  }
  return (char)v2;
}

- (void)_updatePointOfView
{
  engineContext = self->_engineContext;
  if (engineContext)
  {
    PointOfView = C3DEngineContextGetPointOfView((uint64_t)engineContext);
    if (self->_pointOfView) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = PointOfView == 0;
    }
    if (!v5)
    {
      [(SCNRenderer *)self setPointOfView:+[SCNNode nodeWithNodeRef:PointOfView]];
      self->_pointOfViewWasSet = 0;
    }
  }
}

- (SCNScene)scene
{
  return self->_scene;
}

- (void)__setTransitionContext:(id)a3
{
  self->_transitionContext = (SCNRendererTransitionContext *)[a3 copy];
}

- (void)_prepareForTransition:(id)a3 outgoingScene:(id)a4 outgoingPointOfView:(id)a5 completionHandler:(id)a6
{
  transitionContext = self->_transitionContext;
  if (transitionContext)
  {

    self->_transitionContext = 0;
  }
  __n128 v12 = objc_alloc_init(SCNRendererTransitionContext);
  self->_transitionContext = v12;
  if (a6)
  {
    char v13 = _Block_copy(a6);
    __n128 v12 = self->_transitionContext;
  }
  else
  {
    char v13 = 0;
  }
  v12->completionHandler = v13;
  [(SCNRendererTransitionContext *)self->_transitionContext setOutgoingScene:a4];
  [(SCNRendererTransitionContext *)self->_transitionContext setOutgoingPointOfView:a5];
  [(SCNRendererTransitionContext *)self->_transitionContext setTransition:a3];
  [(SCNRendererTransitionContext *)self->_transitionContext setTransitionStartTime:CACurrentMediaTime()];
  if ([a3 pausesIncomingScene]) {
    [(SCNScene *)self->_scene setPaused:1];
  }
  if ([a3 pausesOutgoingScene])
  {
    [a4 setPaused:1];
  }
}

- (void)presentScene:(id)a3 withTransition:(id)a4 incomingPointOfView:(id)a5 completionHandler:(id)a6
{
  scene = self->_scene;
  __n128 v12 = [(SCNRenderer *)self pointOfView];
  [(SCNRenderer *)self lock];
  +[SCNTransaction begin];
  +[SCNTransaction setAnimationDuration:0.0];
  +[SCNTransaction setImmediateMode:1];
  [(SCNRenderer *)self setScene:a3];
  [(SCNRenderer *)self setPointOfView:a5];
  if (a4) {
    [(SCNRenderer *)self _prepareForTransition:a4 outgoingScene:scene outgoingPointOfView:v12 completionHandler:a6];
  }
  +[SCNTransaction commit];

  [(SCNRenderer *)self unlock];
}

- (void)setScene:(SCNScene *)scene
{
  if (self->_scene != scene)
  {
    [(SCNRenderer *)self lock];

    BOOL v5 = scene;
    self->_scene = v5;
    engineContext = self->_engineContext;
    if (engineContext) {
      C3DEngineContextSetupWithScene(engineContext, [(SCNScene *)v5 sceneRef]);
    }
    [(SCNRenderer *)self unlock];
  }
}

- (id)backgroundColor
{
  uint64_t v2 = self->_backgroundColor;

  return v2;
}

- (void)resolvedBackgroundColorDidChange
{
  v3.i64[0] = [(UIColor *)self->_backgroundColor scn_C3DColorIgnoringColorSpace:0 success:0];
  v3.i64[1] = v4;
  C3DColor4 v5 = (C3DColor4)vmulq_f32(v3, (float32x4_t)vdupq_n_s32(HIDWORD(v4)));
  v5.var0.var0[3] = *((float *)&v4 + 1);
  self->_c3dBackgroundColor = v5;

  [(SCNRenderer *)self _c3dBackgroundColorDidChange];
}

- (BOOL)disableOverlays
{
  return self->_disableOverlays;
}

- (void)setDisableOverlays:(BOOL)a3
{
  self->_disableOverlays = a3;
}

- (id)_setupSKRendererIfNeeded
{
  id result = self->_overlayRenderer;
  if (!result)
  {
    Class v4 = NSClassFromString(&cfstr_Skscnrenderer.isa);
    if (self->_renderingAPI)
    {
      [(SCNRenderer *)self context];
      glContext = self->_glContext;
      [(SCNRenderer *)self lock];
      if (glContext)
      {
        uint64_t v6 = (__SKSCNRenderer *)(id)[(objc_class *)v4 rendererWithContext:glContext options:0];
        self->_overlayRenderer = v6;
        [(__SKSCNRenderer *)v6 setScene:self->_overlayScene];
      }
      [(SCNRenderer *)self unlock];
    }
    else
    {
      self->_overlayRenderer = (__SKSCNRenderer *)(id)[(objc_class *)v4 rendererWithDevice:[(SCNRenderer *)self metalDevice] options:0];
    }
    [(SCNRenderer *)self _contentsScaleFactor];
    -[__SKSCNRenderer setBackingScaleFactor:](self->_overlayRenderer, "setBackingScaleFactor:");
    return self->_overlayRenderer;
  }
  return result;
}

- (id)_prepareSKRenderer
{
  id v3 = [(SCNRenderer *)self _setupSKRendererIfNeeded];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double width = self->_framebufferInfo.drawableSize.width;
  double height = self->_framebufferInfo.drawableSize.height;
  [(SCNRenderer *)self _contentsScaleFactor];
  double v15 = width / v14;
  double v16 = height / v14;
  objc_msgSend(v3, "setBackingScaleFactor:");
  v20.origin.float x = 0.0;
  v20.origin.float y = 0.0;
  v19.origin.float x = v5;
  v19.origin.float y = v7;
  v19.size.double width = v9;
  v19.size.double height = v11;
  v20.size.double width = v15;
  v20.size.double height = v16;
  if (!CGRectEqualToRect(v19, v20))
  {
    char v17 = (void *)[v3 scene];
    if ([v17 scaleMode] == 3) {
      objc_msgSend(v17, "setSize:", v15, v16);
    }
    objc_msgSend(v3, "setBounds:", 0.0, 0.0, v15, v16);
  }
  return v3;
}

- (void)_overlaysDidUpdate:(id)a3
{
}

- (void)setOverlaySKScene:(id)a3
{
  [(SCNRenderer *)self lock];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"kC3DSceneDidUpdateNotification", 0);
  self->_overlayuint64_t Scene = a3;
  if (a3)
  {
    if ((*((unsigned char *)self + 129) & 4) != 0) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel__overlaysDidUpdate_, @"kC3DSceneDidUpdateNotification", a3);
    }
    [(SCNRenderer *)self _setupSKRendererIfNeeded];
  }
  CGFloat v5 = [(SCNScene *)self->_scene sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__SCNRenderer_setOverlaySKScene___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = a3;
  v6[5] = self;
  +[SCNTransaction postCommandWithContext:v5 object:0 applyBlock:v6];
  [(SCNRenderer *)self unlock];
}

void __33__SCNRenderer_setOverlaySKScene___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(*(void *)(a1 + 40) + 368);
  if (v2)
  {
    objc_msgSend(v3, "setScene:");
  }
  else
  {

    *(void *)(*(void *)(a1 + 40) + 368) = 0;
  }
}

- (void)setTechnique:(id)a3
{
  technique = self->_technique;
  if (technique != a3)
  {

    self->_technique = (SCNTechnique *)a3;
    double v6 = [(SCNScene *)self->_scene sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__SCNRenderer_setTechnique___block_invoke;
    v7[3] = &unk_264005010;
    v7[4] = self;
    +[SCNTransaction postCommandWithContext:v6 object:0 applyBlock:v7];
  }
}

void __28__SCNRenderer_setTechnique___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _engineContext];
  if (v2)
  {
    uint64_t v3 = v2;
    double v4 = (unsigned char *)[*(id *)(*(void *)(a1 + 32) + 352) techniqueRef];
    uint64_t FXContext = C3DEngineContextGetFXContext(v3);
    if (FXContext) {
      C3DFXContextSetPostProcessTechnique(FXContext, v4, v3);
    }
    if (C3DEngineContextGetRenderGraph(v3))
    {
      C3DRenderGraphSetCustomTechnique();
    }
  }
  else
  {
    double v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __28__SCNRenderer_setTechnique___block_invoke_cold_1();
    }
  }
}

- (SCNTechnique)technique
{
  return self->_technique;
}

- (id)_copyPassDescription
{
  [(SCNRenderer *)self lock];
  uint64_t FXContext = C3DEngineContextGetFXContext((uint64_t)self->_engineContext);
  id v4 = C3DFXContextCopyPassDescription(FXContext, (uint64_t)self->_engineContext);
  [(SCNRenderer *)self unlock];
  return v4;
}

- (id)_copyRenderGraphDescription
{
  [(SCNRenderer *)self lock];
  uint64_t RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
  id v4 = (void *)[(id)C3DRenderGraphGetDescription(RenderGraph) copy];
  [(SCNRenderer *)self unlock];
  return v4;
}

- (void)_renderGraphFrameRecordingAtPath:(id)a3 withCompletion:(id)a4
{
  [(SCNRenderer *)self lock];
  uint64_t RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
  C3DRenderGraphRecordFrame(RenderGraph, a3, a4);

  [(SCNRenderer *)self unlock];
}

- (BOOL)_recordWithoutExecute
{
  [(SCNRenderer *)self lock];
  uint64_t RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
  char IsRecordingWithoutExecute = C3DRenderGraphIsRecordingWithoutExecute(RenderGraph);
  [(SCNRenderer *)self unlock];
  return IsRecordingWithoutExecute;
}

- (void)set_recordWithoutExecute:(BOOL)a3
{
  [(SCNRenderer *)self lock];
  [(SCNRenderer *)self willChangeValueForKey:@"_recordWithoutExecute"];
  uint64_t RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
  C3DRenderGraphSetRecordWithoutExecute(RenderGraph, a3);
  [(SCNRenderer *)self didChangeValueForKey:@"_recordWithoutExecute"];

  [(SCNRenderer *)self unlock];
}

- (id)_computedLightingEnvironmentMapsPath
{
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);

  return (id)-[SCNMTLRenderContext generatedTexturePath](RenderContext);
}

- (void)set_computedLightingEnvironmentMapsPath:(id)a3
{
  uint64_t RenderContext = (void *)C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);

  -[SCNMTLRenderContext setGeneratedTexturePath:](RenderContext, (char *)a3);
}

void __38__SCNRenderer__releasePreloadRenderer__block_invoke(uint64_t a1)
{
}

uint64_t __47__SCNRenderer__prepareObject_shouldAbortBlock___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled]) {
    return 1;
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __47__SCNRenderer__prepareObject_shouldAbortBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCancelled];
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
  if (!self->_renderingAPI && (*((unsigned char *)self + 129) & 8) != 0) {
    uint64_t v7 = [(SCNSceneRenderer *)self->_privateRendererOwner layer];
  }
  else {
    uint64_t v7 = 0;
  }
  if (!self->__prepareQueue)
  {
    [(SCNRenderer *)self lock];
    if (!self->__prepareQueue)
    {
      double v8 = NSString;
      CGFloat v9 = (objc_class *)objc_opt_class();
      double v10 = (const char *)[(id)objc_msgSend(v8 stringWithFormat:@"com.apple.scenekit.prepareQueue.%@%p", NSStringFromClass(v9), self->_privateRendererOwner), "cStringUsingEncoding:", 1];
      CGFloat v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      self->__prepareQueue = (OS_dispatch_queue *)dispatch_queue_create(v10, v11);
    }
    [(SCNRenderer *)self unlock];
  }
  uint64_t v12 = [MEMORY[0x263F08AB8] currentProgress];
  if (v12) {
    uint64_t v12 = objc_msgSend(MEMORY[0x263F08AB8], "progressWithTotalUnitCount:", objc_msgSend(a3, "count"));
  }
  prepareQueue = self->__prepareQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke;
  block[3] = &unk_2640089D0;
  block[4] = v12;
  block[5] = self;
  block[6] = v7;
  block[7] = a3;
  block[8] = a4;
  dispatch_async(prepareQueue, block);
}

void __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = v18;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke_2;
    v18[3] = &unk_264008980;
    v18[4] = v2;
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = *(void **)(a1 + 40);
  objc_sync_enter(v4);
  if ([*(id *)(a1 + 40) _preparePreloadRenderer:*(void *)(a1 + 48)])
  {
    +[SCNTransaction flush];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CGFloat v5 = *(void **)(a1 + 56);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      char v8 = 1;
LABEL_7:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        [*(id *)(a1 + 32) becomeCurrentWithPendingUnitCount:1];
        LOBYTE(v10) = [*(id *)(a1 + 40) _prepareObject:v10 shouldAbortBlock:v3];
        [*(id *)(a1 + 32) resignCurrent];
        v8 &= v10;
        if ([*(id *)(a1 + 32) isCancelled]) {
          break;
        }
        if (v6 == ++v9)
        {
          uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v6) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
    else
    {
      char v8 = 1;
    }
    [*(id *)(a1 + 40) _releasePreloadRenderer];
  }
  else
  {
    char v8 = 0;
  }
  objc_sync_exit(v4);
  uint64_t v11 = *(void *)(a1 + 64);
  if (v11)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke_3;
    v12[3] = &unk_2640089A8;
    v12[4] = v11;
    char v13 = v8;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

uint64_t __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCancelled];
}

uint64_t __52__SCNRenderer_prepareObjects_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)programWithNode:(id)a3 withMaterial:(id)a4
{
  char v8 = [(SCNRenderer *)self _engineContext];
  uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)v8);
  if (!RendererContextGL || !C3DRendererContextGetGLContext(RendererContextGL)) {
    return 0;
  }
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SCNRenderer.m", 3340, @"We should have an engine context at this stage");
  }
  uint64_t v10 = [a3 nodeRef];
  if (!v10) {
    return 0;
  }
  uint64_t v11 = (void *)v10;
  uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "geometry"), "geometryRef");
  if (!v12) {
    return 0;
  }
  char v13 = (__C3DGeometry *)v12;
  uint64_t Mesh = C3DGeometryGetMesh(v12);
  if (!Mesh) {
    return 0;
  }
  uint64_t v15 = Mesh;
  uint64_t v16 = [a4 materialRef];
  if (![(SCNScene *)[(SCNRenderer *)self scene] sceneRef]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SCNRenderer.m", 3358, @"No C Scene associated with %@", -[SCNRenderer scene](self, "scene"));
  }
  uint64_t v17 = C3DEngineContextEvaluateProgram((uint64_t)v8, v11, v13, v15, v16);
  if (!v17) {
    return 0;
  }
  v18 = (void *)v17;
  CGRect v19 = +[SCNProgram program];
  CFTypeID v20 = CFGetTypeID(v18);
  if (v20 == C3DFXGLSLProgramGetTypeID())
  {
    uint64_t ShaderSources = C3DFXGLSLProgramGetShaderSources(v18);
    uint64_t v23 = v22;
    [(SCNProgram *)v19 setVertexShader:ShaderSources];
    [(SCNProgram *)v19 setFragmentShader:v23];
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SCNRenderer.m", 3377, @"Metal implementation not done");
  }
  return v19;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    __int16 v4 = 2;
  }
  else {
    __int16 v4 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFD | v4;
  if (objc_opt_respondsToSelector()) {
    __int16 v5 = 4;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFFB | v5;
  if (objc_opt_respondsToSelector()) {
    __int16 v6 = 8;
  }
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFF7 | v6;
  if (objc_opt_respondsToSelector()) {
    __int16 v7 = 16;
  }
  else {
    __int16 v7 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFEF | v7;
  if (objc_opt_respondsToSelector()) {
    __int16 v8 = 32;
  }
  else {
    __int16 v8 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFDF | v8;
  if (objc_opt_respondsToSelector()) {
    __int16 v9 = 64;
  }
  else {
    __int16 v9 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFFBF | v9;
  if (objc_opt_respondsToSelector()) {
    __int16 v10 = 128;
  }
  else {
    __int16 v10 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFF7F | v10;
  if (objc_opt_respondsToSelector()) {
    __int16 v11 = 256;
  }
  else {
    __int16 v11 = 0;
  }
  *(_WORD *)&self->___int16 delegationConformance = *(_WORD *)&self->_delegationConformance & 0xFCFF | v11;

  [(SCNRenderer *)self _updateEngineCallbacks];
}

- (SCNSceneRendererDelegate)delegate
{
  return (SCNSceneRendererDelegate *)objc_loadWeak(&self->_delegate);
}

- (BOOL)_wantsSceneRendererDelegationMessages
{
  return (*((unsigned __int8 *)self + 288) >> 3) & 1;
}

- (BOOL)_shouldForwardSceneRendererDelegationMessagesToPrivateRendererOwner
{
  return (*((unsigned __int8 *)self + 288) >> 4) & 1;
}

- (void)set_shouldForwardSceneRendererDelegationMessagesToPrivateRendererOwner:(BOOL)a3
{
  if (a3) {
    char v4 = 16;
  }
  else {
    char v4 = 0;
  }
  *((unsigned char *)self + 288) = *((unsigned char *)self + 288) & 0xEF | v4;
  if (a3 && (*((unsigned char *)self + 129) & 4) != 0)
  {
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 2;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFD | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 4;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFFB | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 8;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFF7 | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 16;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFEF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 32;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFDF | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 128;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFF7F | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 256;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFEFF | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 64;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFFBF | v14;
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 512;
    }
    else {
      __int16 v5 = 0;
    }
    __int16 privateRendererOwnerDelegationConformance = (__int16)self->_privateRendererOwnerDelegationConformance;
  }
  else
  {
    __int16 v5 = 0;
    __int16 privateRendererOwnerDelegationConformance = *(_WORD *)&self->_privateRendererOwnerDelegationConformance & 0xFE00;
  }
  *(_WORD *)&self->___int16 privateRendererOwnerDelegationConformance = privateRendererOwnerDelegationConformance & 0xFDFF | v5;

  [(SCNRenderer *)self _updateEngineCallbacks];
}

- (id)_resourceManagerMonitor
{
  return objc_loadWeak((id *)&self->_resourceManagerMonitor);
}

- (void)renderContext:(id)a3 didFallbackToDefaultTextureForSource:(id)a4 message:(id)a5
{
  privateRendererOwner = self;
  if ((*((unsigned char *)self + 129) & 4) != 0) {
    privateRendererOwner = self->_privateRendererOwner;
  }
  id Weak = objc_loadWeak((id *)&self->_resourceManagerMonitor);

  [Weak renderer:privateRendererOwner didFallbackToDefaultTextureForSource:a4 message:a5];
}

- (id)_commandBufferStatusMonitor
{
  return objc_loadWeak((id *)&self->_commandBufferStatusMonitor);
}

- (void)set_commandBufferStatusMonitor:(id)a3
{
  p_commandBufferStatusMonitor = &self->_commandBufferStatusMonitor;
  if (objc_loadWeak((id *)&self->_commandBufferStatusMonitor) != a3)
  {
    if (a3) {
      id v6 = a3;
    }
    else {
      id v6 = 0;
    }
    if (a3) {
      __int16 v7 = self;
    }
    else {
      __int16 v7 = 0;
    }
    objc_storeWeak((id *)p_commandBufferStatusMonitor, v6);
    -[SCNMTLRenderContext setCommandBufferStatusMonitor:]((id *)&self->_renderContext->super.isa, v7);
    __int16 v8 = [(SCNRenderer *)self->_preloadRenderer _renderContextMetal];
    -[SCNMTLRenderContext setCommandBufferStatusMonitor:](v8, v7);
  }
}

- (void)renderContext:(id)a3 commandBufferDidCompleteWithError:(id)a4
{
  privateRendererOwner = self;
  if ((*((unsigned char *)self + 129) & 4) != 0) {
    privateRendererOwner = self->_privateRendererOwner;
  }
  id Weak = objc_loadWeak((id *)&self->_commandBufferStatusMonitor);

  [Weak renderer:privateRendererOwner commandBufferDidCompleteWithError:a4];
}

- (void)updateCurrentTimeIfPlayingWithSystemTime:(double)a3
{
  __int16 v5 = [(SCNScene *)self->_scene sceneRef];
  uint64_t v6 = (uint64_t)v5;
  double currentSceneTime = self->_currentSceneTime;
  BOOL playing = self->_playing;
  if (!self->_playing || v5 == 0)
  {
    self->_lastdouble SystemTime = a3;
    double v10 = currentSceneTime;
    if (!v5) {
      goto LABEL_21;
    }
    if (!playing) {
      goto LABEL_20;
    }
  }
  else
  {
    float PlaybackSpeed = C3DSceneGetPlaybackSpeed((uint64_t)v5);
    double StartTime = C3DSceneGetStartTime(v6);
    if (currentSceneTime < StartTime) {
      double currentSceneTime = StartTime;
    }
    lastdouble SystemTime = self->_lastSystemTime;
    if (lastSystemTime != 0.0)
    {
      double v14 = a3 - lastSystemTime;
      if (v14 > 1.0) {
        double v14 = 0.0166666667;
      }
      double currentSceneTime = currentSceneTime + v14 * PlaybackSpeed;
    }
    self->_lastdouble SystemTime = a3;
    if (!self->_playing) {
      goto LABEL_20;
    }
  }
  double EndTime = C3DSceneGetEndTime(v6);
  if (currentSceneTime <= EndTime)
  {
LABEL_20:
    double v10 = currentSceneTime;
    goto LABEL_21;
  }
  long double v16 = EndTime;
  if (self->_loops)
  {
    double v10 = 0.0;
    if (v16 != 0.0)
    {
      double v17 = C3DSceneGetStartTime(v6);
      double v10 = fmod(currentSceneTime - v16, v16) + v17;
    }
  }
  else
  {
    [(SCNRenderer *)self setPlaying:0];
    double v10 = v16;
  }
LABEL_21:

  [(SCNRenderer *)self _setSceneTime:v10];
}

- (void)set_nextFrameTime:(double)a3
{
  self->__nextFrameTime = a3;
}

- (double)_nextFrameTime
{
  return self->__nextFrameTime;
}

- (CFTimeInterval)nextFrameTime
{
  return self->__nextFrameTime;
}

- (BOOL)_needsRepetitiveRedraw
{
  if (self->_isAnimating || self->_playing) {
    LOBYTE(v2) = 1;
  }
  else {
    return (*((unsigned __int8 *)self + 129) >> 1) & 1;
  }
  return v2;
}

- (double)sceneTime
{
  return self->_currentSceneTime;
}

- (void)_setSceneTime:(double)a3
{
  if ((*((unsigned char *)self + 288) & 4) == 0)
  {
    [(SCNRenderer *)self willChangeValueForKey:@"sceneTime"];
    self->_double currentSceneTime = a3;
    [(SCNRenderer *)self didChangeValueForKey:@"sceneTime"];
  }
}

- (void)setSceneTime:(double)a3
{
  if ((*((unsigned char *)self + 288) & 4) == 0)
  {
    if ((*((unsigned char *)self + 129) & 4) != 0)
    {
      __int16 v5 = [(SCNScene *)self->_scene sceneRef];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __28__SCNRenderer_setSceneTime___block_invoke;
      v6[3] = &unk_264004FC0;
      v6[4] = self;
      *(double *)&v6[5] = a3;
      +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
    }
    else
    {
      self->_double currentSceneTime = a3;
    }
  }
}

uint64_t __28__SCNRenderer_setSceneTime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSceneTime:*(double *)(a1 + 40)];
}

- (double)_systemTime
{
  double result = self->_forceSystemTime;
  if (result == 0.0) {
    return self->_currentSystemTime;
  }
  return result;
}

- (void)set_systemTime:(double)a3
{
  if ((*((unsigned char *)self + 288) & 4) == 0)
  {
    self->_currentdouble SystemTime = a3;
    -[SCNRenderer updateCurrentTimeIfPlayingWithSystemTime:](self, "updateCurrentTimeIfPlayingWithSystemTime:");
  }
}

- (void)set_deltaTime:(double)a3
{
  if ((*((unsigned char *)self + 288) & 4) != 0) {
    a3 = 0.0;
  }
  self->_deltaTime = a3;
}

- (void)context
{
  unint64_t renderingAPI = self->_renderingAPI;
  if (renderingAPI)
  {
    if (!self->_glContext)
    {
      if (self->_isRunningInExtension)
      {
LABEL_6:
        if (renderingAPI == 2) {
          uint64_t v4 = 3;
        }
        else {
          uint64_t v4 = 2;
        }
        [(SCNRenderer *)self setContext:(id)SCNCreateGLESContext(v4)];
        return self->_glContext;
      }
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "applicationState") != 2)
      {
        LODWORD(renderingAPI) = self->_renderingAPI;
        goto LABEL_6;
      }
    }
    return self->_glContext;
  }
  return 0;
}

- (void)_update:(__C3DScene *)a3
{
  [(SCNRenderer *)self _systemTime];
  double v6 = v5;
  [(SCNRenderer *)self _getFrameIndex];
  C3DEngineContextSetSystemTime((uint64_t)self->_engineContext, v6);
  C3DEngineContextSetDeltaTime((uint64_t)self->_engineContext, self->_deltaTime);
  double deltaTime = self->_deltaTime;
  int IsPaused = C3DSceneIsPaused((uint64_t)a3);
  int IsPausedForEditing = C3DSceneIsPausedForEditing((uint64_t)a3);
  double v10 = 0.0;
  if (IsPaused) {
    double v11 = 0.0;
  }
  else {
    double v11 = deltaTime;
  }
  if (v11 >= 0.0) {
    double v10 = v11;
  }
  if (v10 <= 1.0) {
    double v12 = v10;
  }
  else {
    double v12 = 0.0166666667;
  }
  self->_isAnimating = 0;
  +[SCNTransaction setImmediateMode:1];
  __int16 v13 = (void *)MEMORY[0x210535ED0](+[SCNTransaction setImmediateModeRestrictedContext:a3]);
  uint64_t Stats = (double *)C3DEngineContextGetStats((uint64_t)self->_engineContext);
  if ((*(_WORD *)&self->_delegationConformance & 1) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 1) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 1) != 0)
  {
    double v15 = CACurrentMediaTime();
    kdebug_trace();
    if (*(_WORD *)&self->_privateRendererOwnerDelegationConformance) {
      [(SCNSceneRenderer *)self->_privateRendererOwner _renderer:self->_privateRendererOwner updateAtTime:v6];
    }
    if (*(_WORD *)&self->_selfDelegationConformance) {
      [(SCNRenderer *)self _renderer:self updateAtTime:v6];
    }
    if (*(_WORD *)&self->_delegationConformance)
    {
      privateRendererOwner = self;
      if ((*((unsigned char *)self + 129) & 4) != 0) {
        privateRendererOwner = self->_privateRendererOwner;
      }
      [self->_delegate renderer:privateRendererOwner updateAtTime:v6];
    }
    kdebug_trace();
    Stats[21] = Stats[21] + CACurrentMediaTime() - v15;
  }
  uint64_t ModelValueStorage = C3DSceneGetModelValueStorage((uint64_t)a3);
  C3DModelValueStoragePrepareNextFrame(ModelValueStorage);
  double v18 = CACurrentMediaTime();
  uint64_t AnimationManager = C3DSceneGetAnimationManager((uint64_t)a3);
  if (AnimationManager)
  {
    uint64_t v20 = AnimationManager;
    C3DAnimationManagerSetPausedForEditing(AnimationManager, IsPausedForEditing);
    kdebug_trace();
    C3DAnimationManagerApplyAnimations(v20, v6, self->_currentSceneTime);
    kdebug_trace();
    kdebug_trace();
    double currentSceneTime = v6;
    if (IsPausedForEditing) {
      double currentSceneTime = self->_currentSceneTime;
    }
    C3DAnimationManagerApplyActions(v20, currentSceneTime);
    kdebug_trace();
    C3DAnimationManagerApplyBindings(v20);
    if ((IsPaused ^ 1 | IsPausedForEditing) == 1) {
      self->_isAnimating = C3DAnimationManagerNeedsRedraw(v20, IsPausedForEditing);
    }
  }
  Stats[16] = Stats[16] + CACurrentMediaTime() - v18;
  if ((*(unsigned char *)&self->_delegationConformance & 2) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 2) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 2) != 0)
  {
    double v22 = CACurrentMediaTime();
    kdebug_trace();
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 2) != 0) {
      [(SCNSceneRenderer *)self->_privateRendererOwner _renderer:self->_privateRendererOwner didApplyAnimationsAtTime:v6];
    }
    if ((*(_WORD *)&self->_selfDelegationConformance & 2) != 0) {
      [(SCNRenderer *)self _renderer:self didApplyAnimationsAtTime:v6];
    }
    if ((*(_WORD *)&self->_delegationConformance & 2) != 0)
    {
      uint64_t v23 = self;
      if ((*((unsigned char *)self + 129) & 4) != 0) {
        uint64_t v23 = self->_privateRendererOwner;
      }
      [self->_delegate renderer:v23 didApplyAnimationsAtTime:v6];
    }
    kdebug_trace();
    Stats[21] = Stats[21] + CACurrentMediaTime() - v22;
  }
  double v24 = CACurrentMediaTime();
  uint64_t v25 = [C3DEntityGetObjCWrapper((id *)a3) _physicsWorldCreateIfNeeded:0];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    kdebug_trace();
    [v26 _updatePhysicsFieldsTransforms];
    if (IsPausedForEditing)
    {
      kdebug_trace();
    }
    else
    {
      [v26 _step:v12];
      kdebug_trace();
      if ((IsPaused & 1) == 0 && !self->_isAnimating) {
        self->_isAnimating = [v26 _needsRedraw];
      }
    }
  }
  Stats[14] = Stats[14] + CACurrentMediaTime() - v24;
  if ((*(unsigned char *)&self->_delegationConformance & 4) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 4) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 4) != 0)
  {
    double v27 = CACurrentMediaTime();
    kdebug_trace();
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 4) != 0) {
      [(SCNSceneRenderer *)self->_privateRendererOwner _renderer:self->_privateRendererOwner didSimulatePhysicsAtTime:v6];
    }
    if ((*(_WORD *)&self->_selfDelegationConformance & 4) != 0) {
      [(SCNRenderer *)self _renderer:self didSimulatePhysicsAtTime:v6];
    }
    if ((*(_WORD *)&self->_delegationConformance & 4) != 0)
    {
      uint64_t v28 = self;
      if ((*((unsigned char *)self + 129) & 4) != 0) {
        uint64_t v28 = self->_privateRendererOwner;
      }
      [self->_delegate renderer:v28 didSimulatePhysicsAtTime:v6];
    }
    kdebug_trace();
    Stats[21] = Stats[21] + CACurrentMediaTime() - v27;
  }
  double v29 = CACurrentMediaTime();
  uint64_t ControllerManager = C3DSceneGetControllerManager((uint64_t)a3);
  if (ControllerManager)
  {
    uint64_t v31 = ControllerManager;
    *(void *)(ControllerManager + 32) = [(SCNRenderer *)self _engineContext];
    kdebug_trace();
    C3DConstraintManagerApply(v31);
    kdebug_trace();
  }
  Stats[13] = Stats[13] + CACurrentMediaTime() - v29;
  if ((*(unsigned char *)&self->_delegationConformance & 8) != 0
    || (*(_WORD *)&self->_selfDelegationConformance & 8) != 0
    || (*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 8) != 0)
  {
    double v32 = CACurrentMediaTime();
    kdebug_trace();
    if ((*(_WORD *)&self->_privateRendererOwnerDelegationConformance & 8) != 0) {
      [(SCNSceneRenderer *)self->_privateRendererOwner _renderer:self->_privateRendererOwner didApplyConstraintsAtTime:v6];
    }
    if ((*(_WORD *)&self->_selfDelegationConformance & 8) != 0) {
      [(SCNRenderer *)self _renderer:self didApplyConstraintsAtTime:v6];
    }
    if ((*(_WORD *)&self->_delegationConformance & 8) != 0)
    {
      double v33 = self;
      if ((*((unsigned char *)self + 129) & 4) != 0) {
        double v33 = self->_privateRendererOwner;
      }
      [self->_delegate renderer:v33 didApplyConstraintsAtTime:v6];
    }
    kdebug_trace();
    Stats[21] = Stats[21] + CACurrentMediaTime() - v32;
  }
  double v34 = CACurrentMediaTime();
  ParticleManager = C3DSceneGetParticleManager((uint64_t)a3, 0);
  uint64_t v36 = (uint64_t)ParticleManager;
  if (!IsPausedForEditing)
  {
    BOOL v39 = 1;
    if (!ParticleManager) {
      goto LABEL_84;
    }
    goto LABEL_76;
  }
  uint64_t v45 = 0;
  double v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  id v37 = [(SCNRenderer *)self _authoringEnvironment];
  if (v37)
  {
    SelectedNodes = (void *)C3DAuthoringEnvironmentGetSelectedNodes(v37);
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __23__SCNRenderer__update___block_invoke;
    v44[3] = &unk_2640089F8;
    v44[4] = &v45;
    [SelectedNodes enumerateObjectsUsingBlock:v44];
  }
  BOOL v39 = *((unsigned char *)v46 + 24) != 0;
  _Block_object_dispose(&v45, 8);
  if (v36)
  {
LABEL_76:
    kdebug_trace();
    if (!v39) {
      double v12 = 0.0;
    }
    char v40 = !v39;
    uint64_t EnginePipeline = C3DSceneGetEnginePipeline((uint64_t)a3);
    C3DParticleManagerUpdate(v36, EnginePipeline, v12);
    if (self->_isAnimating) {
      char v42 = 1;
    }
    else {
      char v42 = v40;
    }
    if ((v42 & 1) == 0) {
      self->_isAnimating = C3DParticleManagerNeedRedraw(v36);
    }
    kdebug_trace();
  }
LABEL_84:
  Stats[15] = Stats[15] + CACurrentMediaTime() - v34;
  kdebug_trace();
  C3DAudioManagerUpdateNodes(self->_engineContext);
  kdebug_trace();
  AuthoringEnvironmenCGAffineTransform t2 = (void *)C3DSceneGetAuthoringEnvironment2((uint64_t)a3, 0);
  if (AuthoringEnvironment2) {
    C3DAuthoringEnvironment2Update(AuthoringEnvironment2, (const char *)self);
  }
  +[SCNTransaction setImmediateModeRestrictedContext:0];
  +[SCNTransaction setImmediateMode:0];
}

CFDictionaryRef __23__SCNRenderer__update___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  CFDictionaryRef result = C3DNodeGetParticleSystems(a2);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_updateWithSystemTime:(double)a3
{
  [(SCNRenderer *)self lock];
  [(SCNRenderer *)self _updateSystemTimeAndDeltaTimeWithCurrentTime:a3];
  +[SCNTransaction lock];
  engineContext = self->_engineContext;
  if (engineContext)
  {
    uint64_t Scene = C3DEngineContextGetScene((uint64_t)engineContext);
    if (Scene)
    {
      uint64_t v7 = Scene;
      C3DSceneLock(Scene);
      [(SCNRenderer *)self _update:v7];
      C3DSceneUnlock(v7);
    }
  }
  +[SCNTransaction unlock];

  [(SCNRenderer *)self unlock];
}

- (void)updateAndDrawStatisticsIfNeeded
{
  int v3 = SCNGetPerformanceStatisticsEnabled();
  if (self->_showStatistics || v3 != 0)
  {
    int v5 = v3;
    if (self->_renderingAPI)
    {
      uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
      uint64_t Stats = (int *)C3DRendererContextGetStats(RendererContextGL);
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t Stats = (int *)-[SCNMTLResourceManager commandQueue]((uint64_t)self->_renderContext);
      uint64_t v9 = -[SCNMTLRenderContext resourceManager]((uint64_t)self->_renderContext);
      uint64_t v8 = -[SCNMTLResourceManager stats](v9);
    }
    C3DEngineStatsFinish((uint64_t)Stats);
    double Current = CFAbsoluteTimeGetCurrent();
    double statisticsTimeStamp = self->_statisticsTimeStamp;
    id v12 = [(SCNRenderer *)self _authoringEnvironment];
    if (statisticsTimeStamp <= Current)
    {
      uint64_t v13 = (uint64_t)v12;
      memset(v14, 0, 512);
      C3DEngineStatsEndFrameAndCopy(Stats, v8, (uint64_t)v14);
      C3DEngineStatsReset((uint64_t)Stats);
      if (self->_showStatistics) {
        C3DAuthoringEnvironmentUpdateStats(v13, (double *)v14, v8);
      }
      if (v5) {
        SCNPushPerformanceStatistics((uint64_t)v14);
      }
      self->_double statisticsTimeStamp = Current + 1.0;
    }
  }
}

- (void)_drawOverlaySceneAtTime:(double)a3
{
  if (self->_overlayScene && !self->_disableOverlays)
  {
    uint64_t Stats = C3DEngineContextGetStats((uint64_t)self->_engineContext);
    double v6 = CACurrentMediaTime();
    id v7 = [(SCNRenderer *)self _prepareSKRenderer];
    if ((objc_opt_respondsToSelector() & 1) != 0 && ([self->_overlayScene _isDirty] & 1) == 0)
    {
      if (![(SCNRenderer *)self _needsRepetitiveRedraw]) {
        [self->_overlayScene _notifyNextDirtyState];
      }
    }
    else
    {
      C3DEngineContextSetNextFrameTimeToAsap((uint64_t)self->_engineContext);
    }
    if (self->_renderingAPI)
    {
      [v7 updateAtTime:a3];
      uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
      C3DRendererContextPushGroupMarker(RendererContextGL, "SpriteKit - Draw Overlay");
      [v7 render:0];
      C3DRendererContextPopGroupMarker();
    }
    else
    {
      -[SCNMTLRenderContext renderSKSceneWithRenderer:overlay:atTime:]((uint64_t)self->_renderContext, v7, 1u);
    }
    *(double *)(Stats + 160) = *(double *)(Stats + 160) + CACurrentMediaTime() - v6;
  }
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  double width = self->_framebufferInfo.drawableSize.width;
  if (width == 0.0) {
    return (id)MEMORY[0x263EFFA68];
  }
  else {
    return -[SCNRenderer _hitTest:viewport:options:](self, "_hitTest:viewport:options:", a4, a3.x, a3.y, width, self->_framebufferInfo.drawableSize.height);
  }
}

- (id)hitTestWithSegmentFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 options:(id)a5
{
  float z = a4.z;
  float y = a4.y;
  float x = a4.x;
  float v9 = a3.z;
  float v10 = a3.y;
  float v11 = a3.x;
  id v12 = [(SCNScene *)[(SCNRenderer *)self scene] rootNode];
  *(float *)&double v13 = v11;
  *(float *)&double v14 = v10;
  *(float *)&double v15 = v9;
  *(float *)&double v16 = x;
  *(float *)&double v17 = y;
  *(float *)&double v18 = z;

  return -[SCNNode hitTestWithSegmentFromPoint:toPoint:options:](v12, "hitTestWithSegmentFromPoint:toPoint:options:", a5, v13, v14, v15, v16, v17, v18);
}

- (id)_hitTest:(CGPoint)a3 viewport:(CGSize)a4 options:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat x = a3.x;
  CGFloat y = a3.y;
  id v7 = [(SCNRenderer *)self scene];
  +[SCNTransaction lock];
  uint64_t v8 = [(SCNScene *)v7 sceneRef];
  if (v8 && (float v9 = (__n128 *)CFRetain(v8)) != 0)
  {
    float v10 = v9;
    C3DSceneLock((uint64_t)v9);
    float v11 = [(SCNRenderer *)self _engineContext];
    if (!v11) {
      goto LABEL_13;
    }
    uint64_t v12 = (uint64_t)v11;
    PointOfView = C3DEngineContextGetPointOfView((uint64_t)v11);
    if (!PointOfView) {
      goto LABEL_13;
    }
    double v14 = PointOfView;
    if (a5)
    {
      if (![a5 objectForKey:@"kHitTestRootNode"]
        || (uint64_t v15 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"kHitTestRootNode"), "nodeRef"),
            a5 = (id)[a5 mutableCopy],
            [a5 setObject:v15 forKey:@"kHitTestRootNode"],
            a5))
      {
        if ([a5 objectForKey:@"kHitTestShowDebugInfo"])
        {
          a5 = (id)[a5 mutableCopy];
          objc_msgSend(a5, "setObject:forKey:", C3DEngineContextGetAuthoringEnvironment(v12, 0), @"auth");
        }
      }
    }
    v16.f64[0] = width;
    v17.f64[0] = x;
    v17.f64[1] = y;
    double v18 = COERCE_DOUBLE(vcvt_f32_f64(v17));
    v16.f64[1] = height;
    [(SCNRenderer *)self adjustViewportForRendering:*(double *)vcvt_hight_f32_f64(0, v16).i64];
    uint64_t HitTestResultsAtPoint = C3DSceneCreateHitTestResultsAtPoint(v10, v14, (const __CFDictionary *)a5, v18, v19);
    if (HitTestResultsAtPoint)
    {
      float v21 = (const void *)HitTestResultsAtPoint;
      id v22 = +[SCNHitTestResult hitTestResultsFromHitTestResultRef:HitTestResultsAtPoint];
      CFRelease(v21);
    }
    else
    {
LABEL_13:
      id v22 = 0;
    }
    C3DSceneUnlock((uint64_t)v10);
    +[SCNTransaction unlock];
    CFRelease(v10);
  }
  else
  {
    +[SCNTransaction unlock];
    id v22 = 0;
  }
  if (v22) {
    return v22;
  }
  else {
    return (id)MEMORY[0x263EFFA68];
  }
}

- (BOOL)_isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4 viewport:(SCNVector4)a5
{
  if (!a4)
  {
    float x = a5.x;
    float y = a5.y;
    double v6 = [(SCNRenderer *)self pointOfView];
    a5.float y = y;
    a5.float x = x;
    a4 = v6;
    if (!v6) {
      return 0;
    }
  }
  float v7 = a5.y;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  if ([a4 getFrustum:&v37 withViewport:*(double *)&a5.x])
  {
    memset(v36, 0, sizeof(v36));
    float32x4_t v34 = 0u;
    float32x4_t v35 = 0u;
    if ([a3 isPresentationInstance])
    {
      WorldMatrifloat x = C3DNodeGetWorldMatrix((float32x4_t *)[a3 nodeRef]);
      C3DNodeComputeHierarchicalBoundingBox((float32x4_t *)[a3 nodeRef], 1, &v34);
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      if (a3) {
        [a3 worldTransform];
      }
      WorldMatrifloat x = (float32x4_t *)v36;
      *(void *)&double v10 = C3DMatrix4x4FromSCNMatrix4(v36, (uint64_t)&v26).n128_u64[0];
      v33.i32[2] = 0;
      v33.i64[0] = 0;
      v32.i32[2] = 0;
      v32.i64[0] = 0;
      objc_msgSend(a3, "getBoundingBoxMin:max:", &v33, &v32, v10);
      v11.i64[0] = 0x3F0000003F000000;
      v11.i64[1] = 0x3F0000003F000000;
      float32x4_t v12 = vmulq_f32(vaddq_f32(v33, v32), v11);
      float32x4_t v13 = vmulq_f32(vsubq_f32(v32, v33), v11);
      v12.i32[3] = 1.0;
      v13.i32[3] = 0;
      float32x4_t v34 = v12;
      float32x4_t v35 = v13;
    }
    for (uint64_t i = 0; i != 96; i += 16)
      *(long long *)((char *)&v37 + i) = (__int128)vnegq_f32(*(float32x4_t *)((char *)&v37 + i));
    unint64_t v15 = 0;
    BOOL v9 = 0;
    float32x4_t v16 = WorldMatrix[1];
    float32x4_t v17 = WorldMatrix[2];
    float32x4_t v18 = vaddq_f32(WorldMatrix[3], vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v16, *(float32x2_t *)v34.f32, 1), *WorldMatrix, v34.f32[0]), v17, v34, 2));
    v18.i32[3] = 1.0;
    float32x4_t v19 = vaddq_f32(vaddq_f32(vabsq_f32(vmulq_n_f32(*WorldMatrix, v35.f32[0])), vabsq_f32(vmulq_lane_f32(v16, *(float32x2_t *)v35.f32, 1))), vabsq_f32(vmulq_laneq_f32(v17, v35, 2)));
    long long v28 = v39;
    long long v29 = v40;
    long long v30 = v41;
    long long v31 = v42;
    long long v26 = v37;
    long long v27 = v38;
    do
    {
      float32x4_t v20 = (float32x4_t)*(&v26 + v15);
      int8x16_t v21 = (int8x16_t)vmulq_f32(v18, v20);
      float32x4_t v22 = vmulq_f32(v19, vabsq_f32(v20));
      if (vaddv_f32(vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL))) > vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]) {
        break;
      }
      BOOL v9 = v15++ > 4;
    }
    while (v15 != 6);
  }
  else
  {
    return 0;
  }
  return v9;
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  double width = self->_framebufferInfo.drawableSize.width;
  if (width == 0.0) {
    return 0;
  }
  *(float *)&double v4 = width;
  *(float *)&double v5 = self->_framebufferInfo.drawableSize.height;
  return -[SCNRenderer _isNodeInsideFrustum:withPointOfView:viewport:](self, "_isNodeInsideFrustum:withPointOfView:viewport:", a3, a4, 0.0, 0.0, v4, v5);
}

- (id)_nodesInsideFrustumWithPointOfView:(id)a3 viewport:(SCNVector4)a4
{
  double v6 = objc_msgSend(MEMORY[0x263EFF980], "array", *(double *)&a4.x, *(double *)&a4.y);
  if (a3 || (a3 = [(SCNRenderer *)self pointOfView]) != 0)
  {
    if ([(SCNRenderer *)self scene])
    {
      memset(v14, 0, sizeof(v14));
      if ([a3 getFrustum:v14 withViewport:0.0])
      {
        float v7 = [(SCNScene *)self->_scene sceneRef];
        C3DSceneLock((uint64_t)v7);
        CullingSysteSCNMatrix4 m = C3DSceneGetCullingSystem((uint64_t)v7);
        uint64_t v13 = 0;
        long long v11 = 0u;
        long long v12 = 0u;
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __59__SCNRenderer__nodesInsideFrustumWithPointOfView_viewport___block_invoke;
        v10[3] = &unk_264008A20;
        v10[4] = v6;
        long long v11 = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "camera", C3DCullingSystemQueryMake((uint64_t)v10, (uint64_t)&v11)), "categoryBitMask");
        DWORD1(v12) = 1;
        C3DCullingSystemCull(CullingSystem);
        C3DSceneUnlock((uint64_t)v7);
      }
    }
  }
  return v6;
}

uint64_t __59__SCNRenderer__nodesInsideFrustumWithPointOfView_viewport___block_invoke(uint64_t result, uint64_t *a2, uint64_t a3)
{
  if (a3 >= 1)
  {
    uint64_t v15 = v8;
    uint64_t v16 = v7;
    uint64_t v17 = v6;
    uint64_t v18 = v5;
    uint64_t v19 = v4;
    uint64_t v20 = v3;
    uint64_t v21 = v9;
    uint64_t v22 = v10;
    uint64_t v11 = a3;
    uint64_t v13 = result;
    do
    {
      uint64_t v14 = *a2++;
      CFDictionaryRef result = objc_msgSend(*(id *)(v13 + 32), "addObject:", +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:", v14, v15, v16, v17, v18, v19, v20, v21, v22));
      --v11;
    }
    while (v11);
  }
  return result;
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  double width = self->_framebufferInfo.drawableSize.width;
  if (width == 0.0) {
    return (id)MEMORY[0x263EFFA68];
  }
  *(float *)&double v3 = width;
  *(float *)&double v4 = self->_framebufferInfo.drawableSize.height;
  return -[SCNRenderer _nodesInsideFrustumWithPointOfView:viewport:](self, "_nodesInsideFrustumWithPointOfView:viewport:", a3, 0.0, 0.0, v3, v4);
}

- (void)_play
{
  if (!self->_playing)
  {
    self->_lastdouble SystemTime = 0.0;
    self->_BOOL playing = 1;
  }
}

- (void)_pause
{
  self->_BOOL playing = 0;
}

- (void)_stop
{
  self->_BOOL playing = 0;
  scene = self->_scene;
  if (scene) {
    double StartTime = C3DSceneGetStartTime((uint64_t)[(SCNScene *)scene sceneRef]);
  }
  else {
    double StartTime = 0.0;
  }

  [(SCNRenderer *)self _setSceneTime:StartTime];
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  if (a3) {
    [(SCNRenderer *)self _play];
  }
  else {
    [(SCNRenderer *)self _pause];
  }
}

- (void)setRendersContinuously:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 129) = *((unsigned char *)self + 129) & 0xFD | v3;
}

- (BOOL)loops
{
  return self->_loops;
}

- (void)setLoops:(BOOL)a3
{
  self->_loops = a3;
}

- (BOOL)isJitteringEnabled
{
  return *((unsigned char *)self + 288) & 1;
}

- (BOOL)jitteringEnabled
{
  return *((unsigned char *)self + 288) & 1;
}

- (BOOL)isVertexAmplificationEnabled
{
  return C3DEngineContextGetVertexAmplificationEnabled((uint64_t)self->_engineContext);
}

- (BOOL)forceAsyncShaderCompilation
{
  return -[SCNMTLRenderContext forceAsyncShaderCompilation]((BOOL)self->_renderContext);
}

- (void)setForceAsyncShaderCompilation:(BOOL)a3
{
}

- (void)setVertexAmplificationEnabled:(BOOL)a3
{
}

- (BOOL)isTemporalAntialiasingEnabled
{
  return (*((unsigned __int8 *)self + 288) >> 1) & 1;
}

- (void)setTemporalAntialiasingEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 288) = *((unsigned char *)self + 288) & 0xFD | v3;
}

- (BOOL)temporalAntialiasingEnabled
{
  return (*((unsigned __int8 *)self + 288) >> 1) & 1;
}

- (BOOL)frozen
{
  return (*((unsigned __int8 *)self + 288) >> 2) & 1;
}

- (void)setFrozen:(BOOL)a3
{
  BOOL v3 = a3;
  [(SCNRenderer *)self lock];
  if (v3) {
    char v5 = 4;
  }
  else {
    char v5 = 0;
  }
  *((unsigned char *)self + 288) = *((unsigned char *)self + 288) & 0xFB | v5;

  [(SCNRenderer *)self unlock];
}

- (id)_copyPerformanceStatistics
{
  *(_OWORD *)uint64_t v8 = 0u;
  [(SCNRenderer *)self lock];
  BOOL v3 = [(SCNRenderer *)self _engineContext];
  if (v3 && (uint64_t Stats = C3DEngineContextGetStats((uint64_t)v3)) != 0)
  {
    SCNConvertEngineStatsToPerformanceData(Stats, &v7, 0);
    char v5 = _SCNGetPerformanceStatisticsFromPerformanceData((unsigned __int8 *)&v7, 0);
  }
  else
  {
    char v5 = 0;
  }
  [(SCNRenderer *)self unlock];
  return v5;
}

- (void)_displayLinkStatsTick
{
  BOOL v2 = [(SCNRenderer *)self _engineContext];
  if (v2)
  {
    uint64_t Stats = C3DEngineContextGetStats((uint64_t)v2);
    if (Stats) {
      *(double *)(Stats + 184) = *(double *)(Stats + 184) + CACurrentMediaTime() - *(double *)(Stats + 208);
    }
  }
}

- (void)_displayLinkStatsTack
{
  BOOL v2 = [(SCNRenderer *)self _engineContext];
  if (v2)
  {
    uint64_t Stats = C3DEngineContextGetStats((uint64_t)v2);
    if (Stats) {
      *(CFTimeInterval *)(Stats + 208) = CACurrentMediaTime();
    }
  }
}

- (void)setShowsStatistics:(BOOL)a3
{
  if (a3) {
    [(SCNRenderer *)self setupAuthoringEnvironment];
  }
  self->_showStatistics = a3;
}

- (void)_runningInExtension
{
  self->_isRunningInExtension = 1;
}

- (void)_presentFramebuffer
{
  if (self->_renderContext)
  {
    [(SCNRenderer *)self _endFrame];
  }
  else
  {
    if (self->_renderingAPI)
    {
      if ((EAGLContext *)[MEMORY[0x263F146E8] currentContext] != self->_glContext)
      {
        BOOL v3 = scn_default_log();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
          [(SCNRenderer *)v3 _deleteGLFramebuffer];
        }
      }
    }
    uint64_t Stats = C3DEngineContextGetStats((uint64_t)self->_engineContext);
    double v12 = CACurrentMediaTime();
    glPushGroupMarkerEXT(0, "SceneKit - Flush");
    [(SCNRenderer *)self _resolveAndDiscardGL];
    RenderTarget = C3DFramebufferGetRenderTarget((uint64_t)self->_framebufferInfo.frameBuffer, 0);
    GLuint RenderBuffer = C3DRenderTargetGetRenderBuffer((uint64_t)RenderTarget);
    glBindRenderbuffer(0x8D41u, RenderBuffer);
    [(EAGLContext *)self->_glContext presentRenderbuffer:36161];
    glPopGroupMarkerEXT();
    *(double *)(Stats + 176) = *(double *)(Stats + 176) + CACurrentMediaTime() - v12;
  }
}

- (void)setDebugOptions:(unint64_t)a3
{
  if (self->_debugOptions != a3)
  {
    [(SCNRenderer *)self setupAuthoringEnvironment];
    self->_debugOptions = a3;
    [(SCNRenderer *)self lock];
    unint64_t renderingAPI = self->_renderingAPI;
    if ([(SCNRenderer *)self _showsAuthoringEnvironment]) {
      unint64_t v6 = objc_msgSend(-[SCNRenderer _authoringEnvironment](self, "_authoringEnvironment"), "authoringDisplayMask") & 0xFFFFFFFFFFFFFF82;
    }
    else {
      unint64_t v6 = 0;
    }
    unint64_t v7 = (a3 << 6) & 0x40 | (a3 >> 1) & 1 | ((uint64_t)(a3 << 60) >> 63) & 0x28 | ((uint64_t)(a3 << 53) >> 63) & 0x14 | v6;
    if ((a3 & 4) != 0)
    {
      int v9 = C3DIsRunningInXcode();
      uint64_t v10 = v7 | 0x1000;
      if (v9) {
        uint64_t v10 = v7;
      }
      unint64_t v8 = v10 | 0x200;
    }
    else
    {
      unint64_t v8 = (a3 << 6) & 0x40 | (a3 >> 1) & 1 | ((uint64_t)(a3 << 60) >> 63) & 0x28 | ((uint64_t)(a3 << 53) >> 63) & 0x14 | v6 & 0xFFFFFFFFFFFFEDFFLL;
    }
    unint64_t v11 = v8 & 0xFFFFFFFFFFFFFF7FLL | (((a3 >> 4) & 1) << 7);
    unint64_t v12 = v11 & 0xFFFFFFFFFFFFFBFFLL;
    if ((a3 & 0x20) != 0) {
      unint64_t v12 = v11 | 0x400;
    }
    if (renderingAPI) {
      unint64_t v11 = v12;
    }
    unint64_t v13 = ((_WORD)a3 << 6) & 0x4000 | (16 * (int)a3) & 0xA800 | (((a3 >> 12) & 1) << 17) | v11 & 0xFFFFFFFFFFFD17FFLL;
    [(SCNRenderer *)self set_showsAuthoringEnvironment:v13 != 0];
    objc_msgSend(-[SCNRenderer _authoringEnvironment](self, "_authoringEnvironment"), "setAuthoringDisplayMask:", v13);
    if (!renderingAPI)
    {
      uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
      -[SCNMTLRenderContext setDebugOptions:](RenderContext, (a3 >> 3) & 4 | (a3 >> 5) & 2);
    }
    [(SCNRenderer *)self unlock];
  }
}

- (unint64_t)debugOptions
{
  return self->_debugOptions;
}

- (BOOL)usesReverseZ
{
  renderContext = self->_renderContext;
  if (renderContext) {
    LOBYTE(renderContext) = -[SCNMTLRenderContext reverseZ]((uint64_t)renderContext);
  }
  return (char)renderContext;
}

- (void)setUsesReverseZ:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SCNRenderer *)self usesReverseZ] != a3)
  {
    renderContext = self->_renderContext;
    -[SCNMTLRenderContext setReverseZ:]((uint64_t)renderContext, v3);
  }
}

- (void)_reloadDebugOptions
{
  if ([(SCNRenderer *)self _showsAuthoringEnvironment])
  {
    unint64_t v3 = objc_msgSend(-[SCNRenderer _authoringEnvironment](self, "_authoringEnvironment"), "authoringDisplayMask");
    uint64_t v4 = v3 & 8 | (v3 >> 6) & 1 | (2 * (v3 & 1)) | (((v3 >> 4) & 1) << 10) | (v3 >> 7) & 4 | (v3 >> 3) & 0x10 | (v3 >> 5) & 0x20 | (v3 >> 4) & 0x80 | (v3 >> 6) & 0x100 | (v3 >> 4) & 0xA00 | (v3 >> 5) & 0x1000;
  }
  else
  {
    uint64_t v4 = 0;
  }
  self->_debugOptions = self->_debugOptions & 0x60 | v4;
}

- (BOOL)_disableLinearRendering
{
  return *((unsigned __int8 *)self + 129) >> 7;
}

- (void)set_disableLinearRendering:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 129) = v3 & 0x80 | *((unsigned char *)self + 129) & 0x7F;
}

- (BOOL)_enableARMode
{
  renderContext = self->_renderContext;
  if (renderContext) {
    LOBYTE(renderContext) = -[SCNMTLRenderContext enableARMode]((uint64_t)renderContext);
  }
  return (char)renderContext;
}

- (void)set_enableARMode:(BOOL)a3
{
  renderContext = self->_renderContext;
  if (renderContext) {
    -[SCNMTLRenderContext setEnableARMode:]((uint64_t)renderContext, a3);
  }
}

- (BOOL)_shouldDelegateARCompositing
{
  renderContext = self->_renderContext;
  if (renderContext) {
    LOBYTE(renderContext) = -[SCNMTLRenderContext shouldDelegateARCompositing]((uint64_t)renderContext);
  }
  return (char)renderContext;
}

- (void)set_shouldDelegateARCompositing:(BOOL)a3
{
  renderContext = self->_renderContext;
  if (renderContext) {
    -[SCNMTLRenderContext setShouldDelegateARCompositing:]((uint64_t)renderContext, a3);
  }
}

- (void)set_collectCompilationErrors:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
  if (RendererContextGL) {
    C3DRendererContextSetCompilationErrorsCollection(RendererContextGL, v3);
  }
  uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
  if (self->_renderContext)
  {
    -[SCNMTLRenderContext setCollectsCompilationErrors:](RenderContext, v3);
  }
}

- (id)_compilationErrors
{
  snapshotRenderer = self->_snapshotRenderer;
  if (snapshotRenderer)
  {
    return [(SCNRenderer *)snapshotRenderer _compilationErrors];
  }
  else
  {
    uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    if (RendererContextGL)
    {
      return C3DRendererContextGetCompilationErrors(RendererContextGL);
    }
    else
    {
      uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
      if (self->_renderContext)
      {
        return (id)-[SCNMTLRenderContext compilationErrors](RenderContext);
      }
      else
      {
        return 0;
      }
    }
  }
}

- (BOOL)_showsAuthoringEnvironment
{
  return self->_showAuthoringEnvironment;
}

- (void)set_showsAuthoringEnvironment:(BOOL)a3
{
  if (self->_showAuthoringEnvironment != a3)
  {
    self->_showuint64_t AuthoringEnvironment = a3;
    if (a3) {
      [(SCNRenderer *)self setupAuthoringEnvironment];
    }
    uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    if (RendererContextGL) {
      C3DAnimationManagerSetPausedForEditing(RendererContextGL, a3);
    }
    uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
    if (self->_renderContext) {
      -[SCNMTLRenderContext setShowsAuthoringEnvironment:](RenderContext, a3);
    }
    [(SCNRenderer *)self _reloadDebugOptions];
  }
}

- (void)setupAuthoringEnvironment
{
  if (!self->_authoringEnvironment)
  {
    [(SCNRenderer *)self lock];
    if (self->_privateRendererOwner) {
      privateRendererOwner = self->_privateRendererOwner;
    }
    else {
      privateRendererOwner = self;
    }
    self->_authoringEnvironment = (SCNAuthoringEnvironment *)+[SCNAuthoringEnvironment authoringEnvironmentForSceneRenderer:privateRendererOwner createIfNeeded:1];
    [(SCNRenderer *)self _reloadDebugOptions];
    [(SCNRenderer *)self unlock];
  }
}

- (id)_authoringEnvironment
{
  return self->_authoringEnvironment;
}

- (SCNVector4)_viewport
{
  float x = self->__viewport.x;
  float y = self->__viewport.y;
  float z = self->__viewport.z;
  float w = self->__viewport.w;
  result.float w = w;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (CGRect)currentViewport
{
  BOOL v2 = [(SCNRenderer *)self _engineContext];
  if (v2)
  {
    __n128 Viewport = C3DEngineContextGetViewport((__n128 *)v2);
    float64x2_t v4 = vcvt_hight_f64_f32((float32x4_t)Viewport);
    float64x2_t v5 = vcvtq_f64_f32((float32x2_t)Viewport.n128_u64[0]);
  }
  else
  {
    float64x2_t v5 = *(float64x2_t *)MEMORY[0x263F001A8];
    float64x2_t v4 = *(float64x2_t *)(MEMORY[0x263F001A8] + 16);
  }
  double v6 = v5.f64[1];
  double v7 = v4.f64[1];
  result.size.double width = v4.f64[0];
  result.origin.float x = v5.f64[0];
  result.size.CGFloat height = v7;
  result.origin.float y = v6;
  return result;
}

- (void)set_viewport:(SCNVector4)a3
{
  float x = a3.x;
  self->__viewport = a3;
  float y = a3.y;
  float w = a3.w;
  float z = a3.z;
  float64x2_t v4 = [(SCNRenderer *)self _engineContext];
  if (v4)
  {
    float64x2_t v5 = (__n128 *)v4;
    C3DEngineContextSetDrawableSize((uint64_t)v4, COERCE_DOUBLE(__PAIR64__(LODWORD(w), LODWORD(z))));
    [(SCNRenderer *)self adjustViewportForRendering:COERCE_DOUBLE(__PAIR64__(LODWORD(y), LODWORD(x)))];
    C3DEngineContextSetViewport(v6, v5);
  }
}

- (__n128)_drawableSafeAreaInsets
{
  return a1[16];
}

- (void)set_drawableSafeAreaInsets:(SCNRenderer *)self
{
  __n128 v4 = v2;
  *(__n128 *)self->__drawableSafeAreaInsets = v2;
  BOOL v3 = [(SCNRenderer *)self _engineContext];
  if (v3)
  {
    C3DEngineContextSetDrawableSafeAreaInsets((__n128 *)v3, v4);
  }
}

- (AVAudioEngine)audioEngine
{
  return (AVAudioEngine *)C3DAudioManagerGetAudioEngine(1);
}

- (AVAudioEnvironmentNode)audioEnvironmentNode
{
  return (AVAudioEnvironmentNode *)C3DAudioManagerGetAudioEnvironmentNode(self->_engineContext);
}

- (SCNNode)audioListener
{
  uint64_t Scene = C3DEngineContextGetScene((uint64_t)self->_engineContext);
  if (Scene)
  {
    uint64_t v4 = Scene;
    C3DSceneLock(Scene);
    Listener = (id *)C3DAudioManagerGetListener(self->_engineContext);
    ObjCWrapper = (SCNNode *)C3DEntityGetObjCWrapper(Listener);
    C3DSceneUnlock(v4);
    return ObjCWrapper;
  }
  else
  {
    unint64_t v8 = (id *)C3DAudioManagerGetListener(self->_engineContext);
    return (SCNNode *)C3DEntityGetObjCWrapper(v8);
  }
}

- (void)setAudioListener:(id)a3
{
  uint64_t Scene = C3DEngineContextGetScene((uint64_t)self->_engineContext);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SCNRenderer_setAudioListener___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:Scene object:self applyBlock:v6];
}

unint64_t __32__SCNRenderer_setAudioListener___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(__C3DEngineContext **)(*(void *)(a1 + 32) + 216);
  uint64_t v2 = [*(id *)(a1 + 40) nodeRef];

  return C3DAudioManagerSetListener(v1, v2);
}

- (id)MTLTexture
{
  return self->_mtlTexture;
}

- (void)_drawWithJitteringPresentationMode
{
  double v3 = CACurrentMediaTime();

  [(SCNRenderer *)self _drawAtTime:v3];
}

- (void)_renderSceneWithEngineContext:(__C3DEngineContext *)a3 sceneTime:(double)a4
{
  if (!a3)
  {
    double v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      C3DEngineContextGetStats_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  C3DEngineContextResetNextFrameTime((uint64_t)a3);
  C3DEngineContextSetSceneTime((uint64_t)a3, a4);
  uint64_t Scene = C3DEngineContextGetScene((uint64_t)a3);
  if (Scene)
  {
    uint64_t v16 = Scene;
    uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)a3);
    uint64_t ResourceManager = C3DEngineContextGetResourceManager((uint64_t)a3);
    if (!self->_renderContext)
    {
      if (!RendererContextGL)
      {
        uint64_t v19 = scn_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          C3DEngineContextRenderScene_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
        }
      }
      C3DResourceManagerLockVRAMResourceAccess(ResourceManager);
      C3DRendererContextInvalidateCache(RendererContextGL);
    }
    uint64_t AuthoringEnvironment = (id *)C3DEngineContextGetAuthoringEnvironment((uint64_t)a3, 0);
    if (AuthoringEnvironment) {
      C3DAuthoringEnvironmentBeginFrame(AuthoringEnvironment);
    }
    uint64_t Stats = C3DEngineContextGetStats((uint64_t)a3);
    double v29 = CACurrentMediaTime();
    uint64_t EnginePipeline = C3DSceneGetEnginePipeline(v16);
    if (!EnginePipeline)
    {
      long long v31 = scn_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        C3DEngineContextRenderScene_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
      }
    }
    v95[0] = EnginePipeline;
    v95[1] = (uint64_t)a3;
    long long v96 = 0u;
    long long v97 = 0u;
    C3DEnginePipelineApplyNotificationQueue(v95);
    *(double *)(Stats + 152) = *(double *)(Stats + 152) + CACurrentMediaTime() - v29;
    C3DEngineContextReloadShadersIfNeeded((uint64_t)a3);
    renderContext = self->_renderContext;
    if (renderContext)
    {
      uint64_t v40 = -[SCNMTLRenderContext resourceManager]((uint64_t)renderContext);
      C3DSceneSourcePerformConsistencyCheck(v40);
    }
    else
    {
      C3DRendererContextPushGroupMarker(RendererContextGL, "Resource Manager Flush");
      C3DResourceManagerFlush(ResourceManager);
      C3DRendererContextPopGroupMarker();
    }
    C3DEngineContextApplyModifiers((uint64_t)a3, EnginePipeline);
    if (self->_viewpoints) {
      char viewpointCoordinateSpace = self->_viewpointCoordinateSpace;
    }
    else {
      char viewpointCoordinateSpace = 2;
    }
    C3DEngineContextSetViewpointCoordinateSpace((uint64_t)a3, viewpointCoordinateSpace);
    viewpoints = self->_viewpoints;
    if (viewpoints)
    {
      uint64_t v80 = ResourceManager;
      id v43 = [(NSArray *)viewpoints objectAtIndexedSubscript:0];
      uint64_t v44 = v43;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v92 = 0u;
      if (v43)
      {
        [v43 viewport];
        if (*((double *)&v94 + 1) != *(double *)&v94) {
          -[SCNRenderer setUsesReverseZ:](self, "setUsesReverseZ:", *((double *)&v94 + 1) < *(double *)&v94, *((double *)&v94 + 1));
        }
      }
      simd_float4x4 v103 = __invert_f4(*(simd_float4x4 *)_PromotedConst);
      float32x4_t v83 = (float32x4_t)v103.columns[1];
      float32x4_t v84 = (float32x4_t)v103.columns[0];
      float32x4_t v81 = (float32x4_t)v103.columns[3];
      float32x4_t v82 = (float32x4_t)v103.columns[2];
      uint64_t v45 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "passDescriptor"), "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture");
      uint64_t v46 = [v45 textureType];
      uint64_t v47 = v46;
      BOOL v50 = v46 == 5 || v46 == 3 || v46 == 8;
      unsigned int v51 = -[SCNMTLRenderContext features]((uint64_t)self->_renderContext);
      unsigned int v52 = -[SCNMTLRenderContext features]((uint64_t)self->_renderContext);
      BOOL v53 = v47 == 2;
      unint64_t v54 = [(NSArray *)self->_viewpoints count];
      if (v54)
      {
        uint64_t v79 = RendererContextGL;
        BOOL v55 = v50;
        uint64_t v56 = 0;
        unsigned int v57 = 0;
        LOBYTE(RendererContextGL) = 1;
        int v58 = v55 & (v51 >> 5);
        int v59 = v53 & (v52 >> 7);
        uint64_t ResourceManager = v80;
        do
        {
          C3DEngineContextSetRenderPassDescriptorForEye((uint64_t)a3, (CFTypeRef)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_viewpoints, "objectAtIndexedSubscript:", v56, v79), "passDescriptor"), v57);
          LODWORD(RendererContextGL) = (RendererContextGL & 1) != 0
                                    && v45 == objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_viewpoints, "objectAtIndexedSubscript:", v56), "passDescriptor"), "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture");
          uint64_t v56 = ++v57;
        }
        while (v54 > v57);
        if (v54 > 1) {
          int v60 = RendererContextGL;
        }
        else {
          int v60 = 0;
        }
        if (v59) {
          char v61 = 2;
        }
        else {
          char v61 = v58;
        }
        if ((v60 & (v59 | v58)) != 0) {
          char v62 = v61;
        }
        else {
          char v62 = 0;
        }
        C3DEngineContextSetPreferredRenderMode((uint64_t)a3, v62);
        C3DEngineContextSetEyeCount((uint64_t)a3, v54);
        uint64_t RendererContextGL = v79;
        uint64_t v63 = 0;
        for (i = 0; i < v54; uint64_t v63 = i)
        {
          id v65 = [(NSArray *)self->_viewpoints objectAtIndexedSubscript:v63];
          float32x2_t v66 = v65;
          if (v65)
          {
            [v65 viewport];
            float64x2_t v67 = v89;
            float64x2_t v68 = v90;
          }
          else
          {
            float64x2_t v90 = 0u;
            long long v91 = 0u;
            float64x2_t v67 = 0uLL;
            float64x2_t v68 = 0uLL;
            float64x2_t v89 = 0u;
          }
          C3DEngineContextSetViewportAtIndex((uint64_t)a3, i, (__n128)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v67), v68));
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          [v66 simdViewMatrix];
          long long v85 = v69;
          long long v86 = v70;
          long long v87 = v71;
          long long v88 = v72;
          objc_msgSend(v66, "simdProjectionMatrix", C3DEngineContextSetEyeMatrix4x4((uint64_t)a3, 1, (uint64_t)&v85, i).n128_f64[0]);
          long long v85 = v73;
          long long v86 = v74;
          long long v87 = v75;
          long long v88 = v76;
          if (*((float *)&v75 + 2) > 0.0)
          {
            uint64_t v77 = 0;
            v98[0] = v73;
            v98[1] = v74;
            v98[2] = v75;
            v98[3] = v76;
            long long v99 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            do
            {
              *(long long *)((char *)&v99 + v77 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v84, COERCE_FLOAT(v98[v77])), v83, *(float32x2_t *)&v98[v77], 1), v82, (float32x4_t)v98[v77], 2), v81, (float32x4_t)v98[v77], 3);
              ++v77;
            }
            while (v77 != 4);
            long long v85 = v99;
            long long v86 = v100;
            long long v87 = v101;
            long long v88 = v102;
          }
          C3DEngineContextSetEyeMatrix4x4((uint64_t)a3, 0, (uint64_t)&v85, i++);
        }
      }
      else
      {
        C3DEngineContextSetPreferredRenderMode((uint64_t)a3, 0);
        C3DEngineContextSetEyeCount((uint64_t)a3, 0);
        uint64_t ResourceManager = v80;
      }
    }
    else
    {
      [(SCNRenderer *)self adjustViewportForRendering:*(double *)&self->__viewport.x];
      C3DEngineContextSetViewport(v78, (__n128 *)a3);
    }
    if (self->_renderContext) {
      C3DEngineContextRenderWithRenderGraph((uint64_t)a3);
    }
    else {
      C3DEngineContextRenderMainTechnique((__n128 *)a3);
    }
    if (!self->_renderContext)
    {
      C3DRendererContextUnbindTextureUnits(RendererContextGL);
      C3DRendererContextResetToDefaultStates(RendererContextGL);
      C3DRendererContextResetVolatileObjects(RendererContextGL);
      C3DResourceManagerUnlockVRAMResourceAccess(ResourceManager);
    }
  }
}

- (BOOL)_drawSceneWithNewRenderer:(__C3DScene *)a3
{
  if (a3)
  {
    char v5 = *((unsigned char *)self + 129);
    if ((v5 & 0x18) == 8)
    {
      BOOL v6 = 0;
    }
    else
    {
      BOOL v6 = [(SCNRenderer *)self isJitteringEnabled];
      char v5 = *((unsigned char *)self + 129);
    }
    if ((v5 & 4) == 0) {
      +[SCNTransaction lock];
    }
    C3DSceneLock((uint64_t)a3);
    uint64_t v7 = -[SCNMTLResourceManager commandQueue]((uint64_t)self->_renderContext);
    if ((*((unsigned char *)self + 288) & 4) != 0) {
      C3DEngineStatsReset(v7);
    }
    else {
      *(_DWORD *)(v7 + 12) = 0;
    }
    C3DSceneBumpFrameStamp((uint64_t)a3);
    if ((*((unsigned char *)self + 129) & 0x40) != 0) {
      [(SCNRenderer *)self _update:a3];
    }
    if (v6) {
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 1);
    }
    C3DEngineContextSetTemporalAntialiasingEnabled((uint64_t)self->_engineContext, [(SCNRenderer *)self isTemporalAntialiasingEnabled]);
    [(SCNRenderer *)self _renderSceneWithEngineContext:self->_engineContext sceneTime:self->_currentSceneTime];
    if (v6)
    {
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 1);
      [(SCNRenderer *)self _endFrame];
      for (int i = 0; ; ++i)
      {
        [(SCNRenderer *)self _beginFrame];
        C3DEngineContextSetUpdateMainFramebuffer((uint64_t)self->_engineContext, i == 80);
        C3DEngineContextSetJitteringStep((uint64_t)self->_engineContext, i);
        [(SCNRenderer *)self _renderSceneWithEngineContext:self->_engineContext sceneTime:self->_currentSceneTime];
        if (i == 80) {
          break;
        }
        [(SCNRenderer *)self _endFrame];
      }
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 0);
    }
    [(SCNRenderer *)self _computeNextFrameTime];
    -[SCNRenderer set_nextFrameTime:](self, "set_nextFrameTime:");
    -[SCNMTLRenderContext endFrameSceneSpecifics](self->_renderContext);
    C3DSceneUnlock((uint64_t)a3);
    if ((*((unsigned char *)self + 129) & 4) == 0) {
      +[SCNTransaction unlock];
    }
    [(SCNRenderer *)self updateAndDrawStatisticsIfNeeded];
  }
  return a3 != 0;
}

- (BOOL)_drawSceneWithLegacyRenderer:(__C3DScene *)a3
{
  if (a3)
  {
    BOOL v5 = (*((unsigned char *)self + 129) & 0x18) != 8 && [(SCNRenderer *)self isJitteringEnabled];
    uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    if ((*((unsigned char *)self + 129) & 4) == 0) {
      self->_framebufferInfo.CGSize drawableSize = (CGSize)vcvt_hight_f64_f32((float32x4_t)C3DEngineContextGetViewport((__n128 *)self->_engineContext));
    }
    uint64_t Stats = C3DRendererContextGetStats(RendererContextGL);
    if ((*((unsigned char *)self + 288) & 4) != 0) {
      C3DEngineStatsReset(Stats);
    }
    else {
      *(_DWORD *)(Stats + 12) = 0;
    }
    if ((*((unsigned char *)self + 129) & 4) == 0) {
      +[SCNTransaction lock];
    }
    C3DSceneLock((uint64_t)a3);
    uint64_t v8 = [MEMORY[0x263F146E8] currentContext];
    [MEMORY[0x263F146E8] setCurrentContext:self->_glContext];
    C3DSceneBumpFrameStamp((uint64_t)a3);
    [(SCNRenderer *)self _update:a3];
    if (v5) {
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 1);
    }
    engineContext = self->_engineContext;
    double currentSceneTime = self->_currentSceneTime;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__SCNRenderer__drawSceneWithLegacyRenderer___block_invoke;
    v13[3] = &unk_264004DF8;
    v13[4] = self;
    C3DEngineContextRenderScene((__n128 *)engineContext, currentSceneTime, 0, (uint64_t)v13);
    if (v5)
    {
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 1);
      C3DEngineContextSetJitteringStep((uint64_t)self->_engineContext, 0);
      for (int i = 0; i != 81; ++i)
      {
        C3DEngineContextSetUpdateMainFramebuffer((uint64_t)self->_engineContext, i == 80);
        C3DEngineContextSetJitteringStep((uint64_t)self->_engineContext, i);
        C3DEngineContextRenderScene((__n128 *)self->_engineContext, self->_currentSceneTime, 0, 0);
      }
      C3DEngineContextSetJitteringEnabled((uint64_t)self->_engineContext, 0);
    }
    [MEMORY[0x263F146E8] setCurrentContext:v8];
    [(SCNRenderer *)self _computeNextFrameTime];
    -[SCNRenderer set_nextFrameTime:](self, "set_nextFrameTime:");
    C3DSceneUnlock((uint64_t)a3);
    if ((*((unsigned char *)self + 129) & 4) == 0) {
      +[SCNTransaction unlock];
    }
    C3DEngineContextSetForceShaderReload((uint64_t)self->_engineContext, 0);
  }
  return a3 != 0;
}

uint64_t __44__SCNRenderer__drawSceneWithLegacyRenderer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAndDrawStatisticsIfNeeded];
}

- (BOOL)_needsRedrawAsap
{
  if (![(SCNRenderer *)self _needsRepetitiveRedraw])
  {
    if (C3DEngineContextGetNextFrameTime((uint64_t)self->_engineContext) == INFINITY)
    {
      uint64_t Scene = C3DEngineContextGetScene((uint64_t)self->_engineContext);
      if (!Scene) {
        return Scene;
      }
      uint64_t v4 = Scene;
      PointOfViefloat w = C3DEngineContextGetPointOfView((uint64_t)self->_engineContext);
      if (PointOfView)
      {
        CFDictionaryRef Camera = C3DNodeGetCamera((uint64_t)PointOfView);
        if (Camera)
        {
          uint64_t v7 = (uint64_t)Camera;
          if C3DCameraGetWantsHDR((uint64_t)Camera) && (C3DCameraGetWantsExposureAdaptation(v7))
          {
            float ExposureAdaptationDarkeningSpeedFactor = C3DCameraGetExposureAdaptationDarkeningSpeedFactor(v7);
            float ExposureAdaptationBrighteningSpeedFactor = C3DCameraGetExposureAdaptationBrighteningSpeedFactor(v7);
            if (ExposureAdaptationDarkeningSpeedFactor < ExposureAdaptationBrighteningSpeedFactor) {
              float ExposureAdaptationBrighteningSpeedFactor = ExposureAdaptationDarkeningSpeedFactor;
            }
            double v10 = ExposureAdaptationBrighteningSpeedFactor;
            float v11 = ExposureAdaptationBrighteningSpeedFactor + 1.0;
            if (v10 <= 0.01) {
              float v11 = 1.01;
            }
            int v12 = (int)(5.0 / logf(v11) * 60.0);
            if (!v12) {
              goto LABEL_24;
            }
          }
          else
          {
            if (C3DCameraGetMotionBlurIntensity(v7) == 0.0) {
              goto LABEL_24;
            }
            int v12 = 2;
          }
          uint64_t FXContext = C3DEngineContextGetFXContext((uint64_t)self->_engineContext);
          if (FXContext) {
            unsigned int v14 = *(_DWORD *)(FXContext + 116);
          }
          else {
            unsigned int v14 = 0;
          }
          if (self->_adaptativeTechniqueTimeStamp != v14
            || (unsigned int adaptativeState0 = self->_adaptativeState0, adaptativeState0 != C3DSceneGetStateStamp(v4)))
          {
            self->_unsigned int adaptativeState0 = C3DSceneGetStateStamp(v4);
            self->_adaptativeEndFrame = C3DSceneGetFrameStamp(v4) + v12;
            self->_adaptativeTechniqueTimeStamp = v14;
          }
          if (C3DSceneGetFrameStamp(v4) < self->_adaptativeEndFrame) {
            goto LABEL_2;
          }
        }
      }
    }
LABEL_24:
    LOBYTE(Scene) = 0;
    return Scene;
  }
LABEL_2:
  LOBYTE(Scene) = 1;
  return Scene;
}

- (double)_computeNextFrameTime
{
  double NextFrameTime = C3DEngineContextGetNextFrameTime((uint64_t)self->_engineContext);
  if ([(SCNRenderer *)self _needsRedrawAsap])
  {
    double v4 = CACurrentMediaTime();
    if (NextFrameTime >= v4) {
      return v4;
    }
  }
  return NextFrameTime;
}

- (void)_drawScene:(__C3DScene *)a3
{
  if (!self->_engineContext) {
    goto LABEL_8;
  }
  if (self->_renderContext)
  {
    if ([(SCNRenderer *)self _drawSceneWithNewRenderer:a3]) {
      return;
    }
    goto LABEL_8;
  }
  BOOL v4 = [(SCNRenderer *)self _drawSceneWithLegacyRenderer:a3];
  uint64_t AuthoringEnvironment = C3DEngineContextGetAuthoringEnvironment((uint64_t)self->_engineContext, 0);
  if (AuthoringEnvironment) {
    C3DAuthoringEnvironmentEndFrame(AuthoringEnvironment);
  }
  if (!v4)
  {
LABEL_8:
    -[SCNRenderer set_nextFrameTime:](self, "set_nextFrameTime:", a3, INFINITY);
    [(SCNRenderer *)self _clearBackBuffer];
  }
}

- (void)_updateSystemTimeAndDeltaTimeWithCurrentTime:(double)a3
{
  double forceSystemTime = self->_forceSystemTime;
  if (forceSystemTime == 0.0)
  {
    [(SCNRenderer *)self _systemTime];
    lastdouble SystemTime = v7;
    double forceSystemTime = a3;
  }
  else if (self->_lastSystemTime == 0.0)
  {
    lastdouble SystemTime = self->_forceSystemTime;
  }
  else
  {
    lastdouble SystemTime = self->_lastSystemTime;
  }
  [(SCNRenderer *)self set_systemTime:forceSystemTime];
  double v8 = forceSystemTime - lastSystemTime;
  if (lastSystemTime == 0.0) {
    double v8 = 0.0;
  }

  [(SCNRenderer *)self set_deltaTime:v8];
}

- (void)_draw
{
  double v3 = CACurrentMediaTime();

  [(SCNRenderer *)self _drawAtTime:v3];
}

- (void)_drawAtTime:(double)a3
{
  char v4 = *((unsigned char *)self + 129);
  if ((v4 & 0x40) != 0)
  {
    [(SCNRenderer *)self _updateSystemTimeAndDeltaTimeWithCurrentTime:a3];
    char v4 = *((unsigned char *)self + 129);
  }
  if ((v4 & 4) != 0)
  {
    [(SCNRenderer *)self _installViewport];
  }
  else if (self->_renderingAPI)
  {
    if ((EAGLContext *)objc_msgSend(MEMORY[0x263F146E8], "currentContext", a3) != self->_glContext)
    {
      BOOL v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        [(SCNRenderer *)v5 _deleteGLFramebuffer];
      }
    }
    GLenum Error = glGetError();
    if (Error)
    {
      int v14 = Error;
      uint64_t v15 = scn_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SCNRenderer _drawAtTime:](v14, v15);
      }
    }
    C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    *(double *)v16.i64 = C3DRendererContextGetViewport();
    int8x16_t v50 = v16;
    C3DEngineContextSetDrawableSize((uint64_t)self->_engineContext, *(double *)vextq_s8(v16, v16, 8uLL).i64);
    [(SCNRenderer *)self adjustViewportForRendering:*(double *)v50.i64];
    C3DEngineContextSetViewport(v17, (__n128 *)self->_engineContext);
  }
  [(SCNRenderer *)self lock];
  engineContext = self->_engineContext;
  if (engineContext) {
    uint64_t Scene = (__C3DScene *)C3DEngineContextGetScene((uint64_t)engineContext);
  }
  else {
    uint64_t Scene = 0;
  }
  transitionContext = self->_transitionContext;
  if (transitionContext)
  {
    uint64_t v21 = transitionContext->_renderers[0];
    [(SCNRenderer *)self _systemTime];
    double v23 = v22;
    id v24 = [(SCNRenderer *)self _prepareSKRenderer];
    [(SKTransition *)[(SCNRendererTransitionContext *)self->_transitionContext transition] _duration];
    double v26 = 1.0;
    if (v25 == 0.0) {
      double v27 = 1.0;
    }
    else {
      double v27 = v25;
    }
    [(SCNRendererTransitionContext *)self->_transitionContext transitionStartTime];
    double v29 = (v23 - v28) / v27;
    if (v29 <= 1.0) {
      double v26 = v29;
    }
    __int16 v52 = 0;
    __int16 v51 = 0;
    objc_msgSend(v24, "settingsForTransition:atTime:renderIncomingToTexture:renderOutgoingToTexture:renderIncomingToScreen:renderOutgoingToScreen:", -[SCNRendererTransitionContext transition](self->_transitionContext, "transition"), (char *)&v52 + 1, &v52, (char *)&v51 + 1, &v51, v26);
    if ((_BYTE)v52)
    {
      id v30 = -[SCNRendererTransitionContext prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:](self->_transitionContext, "prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:", 0, [(SCNRendererTransitionContext *)self->_transitionContext outgoingScene], [(SCNRendererTransitionContext *)self->_transitionContext outgoingPointOfView], self, self->_framebufferInfo.drawableSize.width, self->_framebufferInfo.drawableSize.height);
      [(SCNRenderer *)self _viewport];
      objc_msgSend(v30, "set_viewport:");
      if (!v21 || (objc_msgSend((id)objc_msgSend(v30, "scene"), "isPaused") & 1) == 0) {
        [v30 renderAtTime:v23];
      }
    }
    else
    {
      id v30 = 0;
    }
    if (HIBYTE(v52))
    {
      if ((_BYTE)v52) {
        long long v31 = v30;
      }
      else {
        long long v31 = 0;
      }
      id v30 = -[SCNRendererTransitionContext prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:](self->_transitionContext, "prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:", 1, self->_scene, self->_pointOfView, self, self->_framebufferInfo.drawableSize.width, self->_framebufferInfo.drawableSize.height);
      [(SCNRenderer *)self _viewport];
      objc_msgSend(v30, "set_viewport:");
      if (!v21 || (objc_msgSend((id)objc_msgSend(v30, "scene"), "isPaused") & 1) == 0) {
        [v30 renderAtTime:v23];
      }
    }
    else
    {
      long long v31 = 0;
    }
    if (HIBYTE(v51)) {
      [(SCNRenderer *)self _drawScene:Scene];
    }
    if ((_BYTE)v51) {
      objc_msgSend(-[SCNRendererTransitionContext prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:](self->_transitionContext, "prepareRendererAtIndex:withScene:renderSize:pointOfView:parentRenderer:", 0, -[SCNRendererTransitionContext outgoingScene](self->_transitionContext, "outgoingScene"), -[SCNRendererTransitionContext outgoingPointOfView](self->_transitionContext, "outgoingPointOfView"), self, self->_framebufferInfo.drawableSize.width, self->_framebufferInfo.drawableSize.height), "_drawAtTime:", v23);
    }
    if (self->_renderingAPI)
    {
      uint64_t v32 = [(SCNRendererTransitionContext *)self->_transitionContext transition];
      uint64_t v33 = [v30 textureID];
      uint64_t v34 = [v31 textureID];
      *(float *)&double v35 = v26;
      objc_msgSend(v24, "renderTransition:withInputTexture:outputTexture:inputTextureSize:outputTextureSize:time:", v32, v33, v34, self->_framebufferInfo.drawableSize.width, self->_framebufferInfo.drawableSize.height, self->_framebufferInfo.drawableSize.width, self->_framebufferInfo.drawableSize.height, v35);
    }
    else
    {
      uint64_t v36 = [v30 MTLTexture];
      uint64_t v37 = [v31 MTLTexture];
      renderContext = self->_renderContext;
      BOOL v39 = (HIBYTE(v51) | v51) == 0;
      uint64_t RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
      C3DRenderGraphSpriteKitTransitionBegin(RenderGraph, v39);
      long long v41 = [(SCNRendererTransitionContext *)self->_transitionContext transition];
      uint64_t v43 = -[SCNMTLRenderContext currentRenderCommandEncoder]((uint64_t)renderContext);
      uint64_t v44 = -[SCNMTLRenderContext currentRenderPassDescriptor]((uint64_t)renderContext);
      uint64_t v45 = -[SCNMTLRenderContext commandQueue]((uint64_t)renderContext);
      float v42 = v26;
      *(float *)&double v46 = v42;
      [v24 renderTransition:v41 withInputTexture:v36 outputTexture:v37 time:v43 encoder:v44 pass:v45 commandQueue:v46];
      uint64_t v47 = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
      C3DRenderGraphSpriteKitTransitionEnd(v47);
    }
    [(SCNRenderer *)self set_nextFrameTime:CACurrentMediaTime()];
    if (v26 == 1.0)
    {
      if ([(SKTransition *)[(SCNRendererTransitionContext *)self->_transitionContext transition] pausesIncomingScene])
      {
        [(SCNScene *)self->_scene setPaused:0];
      }
      char v48 = self->_transitionContext;
      completionHandler = (void (**)(void))v48->completionHandler;
      if (completionHandler)
      {
        completionHandler[2]();
        char v48 = self->_transitionContext;
      }

      self->_transitionContext = 0;
    }
  }
  else
  {
    [(SCNRenderer *)self _drawScene:Scene];
  }
  if (!self->_pointOfView && Scene == [(SCNScene *)self->_scene sceneRef]) {
    [(SCNRenderer *)self _updatePointOfView];
  }
  [(SCNRenderer *)self unlock];
}

- (void)_renderAtTime:(double)a3
{
  [(SCNRenderer *)self _getFrameIndex];
  kdebug_trace();
  self->_double forceSystemTime = a3;
  [(SCNRenderer *)self _drawAtTime:a3];
  self->_double forceSystemTime = 0.0;

  kdebug_trace();
}

- (void)renderAtTime:(CFTimeInterval)time
{
  [(SCNRenderer *)self _beginFrame];
  [(SCNRenderer *)self _renderAtTime:time];
  if (self->_renderingAPI) {
    [(SCNRenderer *)self _resolveAndDiscardGL];
  }

  [(SCNRenderer *)self _endFrame];
}

- (void)renderWithViewport:(CGRect)viewport commandBuffer:(id)commandBuffer passDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor
{
  *((unsigned char *)self + 129) &= ~0x40u;
  -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:](self, "_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:", 0, renderPassDescriptor, [commandBuffer commandQueue], commandBuffer, 0.0, viewport.origin.x, viewport.origin.y, viewport.size.width, viewport.size.height);
  *((unsigned char *)self + 129) |= 0x40u;
}

- (void)renderAtTime:(CFTimeInterval)time viewport:(CGRect)viewport commandBuffer:(id)commandBuffer passDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor
{
  double height = viewport.size.height;
  double width = viewport.size.width;
  double y = viewport.origin.y;
  double x = viewport.origin.x;
  uint64_t v14 = [commandBuffer commandQueue];

  -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:](self, "_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:", 0, renderPassDescriptor, v14, commandBuffer, time, x, y, width, height);
}

- (void)_renderAtTime:(double)a3 viewport:(CGRect)a4 encoder:(id)a5 passDescriptor:(id)a6 commandQueue:(id)a7 commandBuffer:(id)a8
{
  long long v36 = *(_OWORD *)&a4.size.height;
  CGFloat x = a4.origin.x;
  CGFloat y = a4.origin.y;
  float64_t width = a4.size.width;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = scn_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      [(SCNRenderer *)v14 _renderAtTime:v16 viewport:v17 encoder:v18 passDescriptor:v19 commandQueue:v20 commandBuffer:v21];
    }
  }
  uint64_t v22 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "colorAttachments", v36), "objectAtIndexedSubscript:", 0), "texture"), "sampleCount");
  if (v22 == 2) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = 2 * (v22 == 4);
  }
  [(SCNRenderer *)self set_antialiasingMode:v23];
  -[SCNMTLRenderContext setClientRenderPassDescriptor:](self->_renderContext, (char *)a6);
  uint64_t v24 = objc_msgSend((id)objc_msgSend(a6, "depthAttachment"), "texture");
  if (a5)
  {
    if (v24)
    {
      if (-[SCNMTLRenderContext reverseZ]((uint64_t)self->_renderContext))
      {
        objc_msgSend((id)objc_msgSend(a6, "depthAttachment"), "clearDepth");
        if (v25 == 1.0 && (_renderAtTime_viewport_encoder_passDescriptor_commandQueue_commandBuffer__done & 1) == 0)
        {
          _renderAtTime_viewport_encoder_passDescriptor_commandQueue_commandBuffer__done = 1;
          double v26 = scn_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:]();
          }
        }
      }
    }
  }
  -[SCNMTLRenderContext setClientCommandQueue:](self->_renderContext, (char *)a7);
  -[SCNMTLRenderContext setClientRenderCommandEncoder:](self->_renderContext, (char *)a5);
  -[SCNMTLRenderContext setClientCommandBuffer:](self->_renderContext, (char *)a8);
  v27.f64[0] = width;
  self->_framebufferInfo.drawableSize.float64_t width = width;
  v28.f64[0] = x;
  v27.f64[1] = v37;
  self->_framebufferInfo.drawableSize.double height = v37;
  v28.f64[1] = y;
  self->__viewport = (SCNVector4)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v28), v27);
  -[SCNRenderer adjustViewportForRendering:](self, "adjustViewportForRendering:");
  int8x16_t v41 = (int8x16_t)v29;
  C3DEngineContextSetViewport(v29, (__n128 *)self->_engineContext);
  id v30 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "resolveTexture");
  if (!v30) {
    id v30 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture");
  }
  engineContext = self->_engineContext;
  if (a6)
  {
    float v42 = (float)(unint64_t)[v30 width];
    unint64_t v32 = [v30 height];
    *(float *)&double v33 = v42;
    *((float *)&v33 + 1) = (float)v32;
    double v34 = v33;
  }
  else
  {
    *(void *)&double v34 = vextq_s8(v41, v41, 8uLL).u64[0];
  }
  C3DEngineContextSetDrawableSize((uint64_t)engineContext, v34);
  if (v30)
  {
    -[SCNMTLRenderContext beginFrame:]((uint64_t)self->_renderContext, v30);
    [(SCNRenderer *)self _renderAtTime:a3];
    -[SCNMTLRenderContext endFrameWaitingUntilCompleted:status:error:]((uint64_t)self->_renderContext, 0, 0, 0);
  }
  else
  {
    double v35 = scn_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:]();
    }
  }
}

- (void)renderAtTime:(double)a3 viewport:(CGRect)a4 encoder:(id)a5 passDescriptor:(id)a6 commandQueue:(id)a7
{
}

- (void)renderWithCommandBuffer:(id)a3 viewPoints:(id)a4
{
  self->_viewpoints = (NSArray *)a4;
  self->_char viewpointCoordinateSpace = 0;
  if (a4)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
    uint64_t v6 = (void *)[a4 objectAtIndexedSubscript:0];
    if (v6)
    {
      [v6 viewport];
    }
    else
    {
      long long v8 = 0u;
      long long v9 = 0u;
      long long v7 = 0u;
    }
    -[SCNRenderer renderWithViewport:commandBuffer:passDescriptor:](self, "renderWithViewport:commandBuffer:passDescriptor:", a3, objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_viewpoints, "objectAtIndexedSubscript:", 0, v7, v8, v9), "passDescriptor"), 0.0, 0.0, 0.0, 0.0);
    self->_viewpoints = 0;
  }
}

- (void)renderWithCommandBuffer:(id)a3 viewpoints:(id)a4 coordinateSpace:(unint64_t)a5
{
  self->_viewpoints = (NSArray *)a4;
  self->_char viewpointCoordinateSpace = a5;
  if (a4)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
    long long v7 = (void *)[a4 objectAtIndexedSubscript:0];
    if (v7)
    {
      [v7 viewport];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    -[SCNRenderer renderWithViewport:commandBuffer:passDescriptor:](self, "renderWithViewport:commandBuffer:passDescriptor:", a3, objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_viewpoints, "objectAtIndexedSubscript:", 0, v8, v9, v10), "passDescriptor"), 0.0, 0.0, 0.0, 0.0);
    self->_viewpoints = 0;
  }
}

- (void)renderAtTime:(double)a3 encoder:(id)a4 commandQueue:(id)a5 passDescriptor:(id)a6 viewPoints:(id)a7
{
  self->_viewpoints = (NSArray *)a7;
  self->_char viewpointCoordinateSpace = 0;
  if (a7)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    uint64_t v12 = (void *)[a7 objectAtIndexedSubscript:0];
    if (v12)
    {
      [v12 viewport];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v13 = 0u;
    }
    -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:](self, "_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:", a4, a6, a5, 0, a3, 0.0, 0.0, 0.0, 0.0, v13, v14, v15);
    self->_viewpoints = 0;
  }
}

- (void)renderAtTime:(double)a3 encoder:(id)a4 commandQueue:(id)a5 passDescriptor:(id)a6 viewPoints:(id)a7 coordinateSpace:(unint64_t)a8
{
  self->_viewpoints = (NSArray *)a7;
  self->_char viewpointCoordinateSpace = a8;
  if (a7)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
    long long v13 = (void *)[a7 objectAtIndexedSubscript:0];
    if (v13)
    {
      [v13 viewport];
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v14 = 0u;
    }
    -[SCNRenderer _renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:](self, "_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:", a4, a6, a5, 0, a3, 0.0, 0.0, 0.0, 0.0, v14, v15, v16);
    self->_viewpoints = 0;
  }
}

- (void)render
{
  double v3 = CACurrentMediaTime();

  [(SCNRenderer *)self renderAtTime:v3];
}

- (void)_installGLContextAndSetViewport
{
  if (self->_renderingAPI)
  {
    [(SCNRenderer *)self _installContext];
    if (self->_glContext)
    {
      if (self->_renderingAPI && (EAGLContext *)[MEMORY[0x263F146E8] currentContext] != self->_glContext)
      {
        double v3 = scn_default_log();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
          [(SCNRenderer *)v3 _deleteGLFramebuffer];
        }
      }
      glViewport(0, 0, (int)self->_framebufferInfo.drawableSize.width, (int)self->_framebufferInfo.drawableSize.height);
    }
  }
}

- (CGImage)createSnapshot:(double)a3 error:(id *)a4
{
  [(SCNRenderer *)self _beginFrame];
  [(SCNRenderer *)self _installGLContextAndSetViewport];
  [(SCNRenderer *)self _renderAtTime:a3];
  if (self->_renderingAPI)
  {
    [(SCNRenderer *)self _resolveAndDiscardGL];
    [(SCNRenderer *)self _endFrame];
    uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
    if (RendererContextGL)
    {
      uint64_t v8 = RendererContextGL;
      double width = self->_framebufferInfo.drawableSize.width;
      double height = self->_framebufferInfo.drawableSize.height;
      uint64_t v11 = malloc_type_malloc(vcvtd_n_u64_f64(width * height, 2uLL), 0xA99C2FB7uLL);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      size_t v13 = vcvtd_n_u64_f64(width, 2uLL);
      long long v14 = CGBitmapContextCreate(v11, (unint64_t)width, (unint64_t)height, 8uLL, v13, DeviceRGB, 0x4001u);
      CGColorSpaceRelease(DeviceRGB);
      if (self->_renderingAPI)
      {
        if ((EAGLContext *)[MEMORY[0x263F146E8] currentContext] != self->_glContext)
        {
          long long v15 = scn_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            [(SCNRenderer *)v15 _deleteGLFramebuffer];
          }
        }
      }
      C3DRendererContextBindFramebuffer(v8, (uint64_t)self->_framebufferInfo.frameBuffer);
      glReadPixels(0, 0, (int)width, (int)height, 0x1908u, 0x1401u, v11);
      C3DRendererContextUnbindFramebuffer(v8);
      Image = CGBitmapContextCreateImage(v14);
      CGContextRelease(v14);
      free(v11);
      uint64_t v24 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, v13, DeviceRGB, 0x4001u);
      CGContextScaleCTM(v24, 1.0, -1.0);
      CGContextTranslateCTM(v24, 0.0, -height);
      v31.origin.CGFloat x = 0.0;
      v31.origin.CGFloat y = 0.0;
      v31.size.double width = width;
      v31.size.double height = height;
      CGContextDrawImage(v24, v31, Image);
      CGImageRelease(Image);
      double v25 = CGBitmapContextCreateImage(v24);
      CGContextRelease(v24);
    }
    else
    {
      double v26 = scn_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B249000, v26, OS_LOG_TYPE_DEFAULT, "Warning: createSnapshot: no GL context", buf, 2u);
      }
      return 0;
    }
  }
  else
  {
    uint64_t v29 = 0;
    *(void *)buf = 0;
    -[SCNMTLRenderContext endFrameWaitingUntilCompleted:status:error:]((uint64_t)self->_renderContext, 1, &v29, buf);
    if (v29 == 4)
    {
      return C3DCreateImageWithTexture([(SCNRenderer *)self MTLTexture]);
    }
    else
    {
      float64x2_t v27 = scn_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[SCNRenderer createSnapshot:error:]((id *)buf, v27);
      }
      double v25 = 0;
      if (a4) {
        *a4 = *(id *)buf;
      }
    }
  }
  return v25;
}

- (id)snapshotAtTime:(double)a3
{
  double v3 = [(SCNRenderer *)self createSnapshot:0 error:a3];
  uint64_t v4 = (void *)[MEMORY[0x263F1C6B0] imageWithCGImage:v3];
  CGImageRelease(v3);
  return v4;
}

- (CGImage)_createBackgroundColorImageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  size_t v6 = (unint64_t)a3.width;
  size_t v7 = (unint64_t)a3.height;
  size_t v8 = 4 * (unint64_t)a3.width;
  uint64_t v9 = malloc_type_malloc(v8 * (unint64_t)a3.height, 0x709C7A4uLL);
  uint64_t v10 = (CGColorSpace *)C3DColorSpaceSRGB();
  uint64_t v11 = CGBitmapContextCreate(v9, v6, v7, 8uLL, v8, v10, 0x4001u);
  CGContextSetFillColorWithColor(v11, (CGColorRef)objc_msgSend(-[SCNRenderer backgroundColor](self, "backgroundColor"), "CGColor"));
  v14.size.double width = (double)(unint64_t)width;
  v14.size.double height = (double)(unint64_t)height;
  v14.origin.CGFloat x = 0.0;
  v14.origin.CGFloat y = 0.0;
  CGContextFillRect(v11, v14);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  free(v9);
  return Image;
}

- (UIImage)snapshotAtTime:(CFTimeInterval)time withSize:(CGSize)size antialiasingMode:(SCNAntialiasingMode)antialiasingMode
{
  double height = size.height;
  double width = size.width;
  size_t v8 = -[SCNRenderer _createSnapshotAtTime:withSize:antialiasingMode:error:](self, "_createSnapshotAtTime:withSize:antialiasingMode:error:", antialiasingMode, 0, time);
  if (!v8) {
    size_t v8 = -[SCNRenderer _createBackgroundColorImageWithSize:](self, "_createBackgroundColorImageWithSize:", width, height);
  }
  uint64_t v9 = (UIImage *)[MEMORY[0x263F1C6B0] imageWithCGImage:v8];
  CGImageRelease(v8);
  return v9;
}

- (id)snapshotAtTime:(double)a3 withSize:(CGSize)a4 antialiasingMode:(unint64_t)a5 error:(id *)a6
{
  id result = -[SCNRenderer _createSnapshotAtTime:withSize:antialiasingMode:error:](self, "_createSnapshotAtTime:withSize:antialiasingMode:error:", a5, a6, a3, a4.width, a4.height);
  if (result)
  {
    size_t v7 = (CGImage *)result;
    size_t v8 = (void *)[MEMORY[0x263F1C6B0] imageWithCGImage:result];
    CGImageRelease(v7);
    return v8;
  }
  return result;
}

- (CGImage)_createSnapshotAtTime:(double)a3 withSize:(CGSize)a4 antialiasingMode:(unint64_t)a5
{
  return -[SCNRenderer _createSnapshotAtTime:withSize:antialiasingMode:error:](self, "_createSnapshotAtTime:withSize:antialiasingMode:error:", a5, 0, a3, a4.width, a4.height);
}

- (CGImage)_createSnapshotAtTime:(double)a3 withSize:(CGSize)a4 antialiasingMode:(unint64_t)a5 error:(id *)a6
{
  float width = a4.width;
  float v11 = rintf(width);
  float height = a4.height;
  float v13 = rintf(height);
  if ((*((unsigned char *)self + 129) & 4) == 0) {
    -[SCNRenderer _setBackingSize:](self, "_setBackingSize:", v11, v13);
  }
  id v14 = -[SCNRenderer snapshotRendererWithSize:](self, "snapshotRendererWithSize:", v11, v13);
  objc_msgSend(v14, "set_computedLightingEnvironmentMapsPath:", -[SCNRenderer _computedLightingEnvironmentMapsPath](self, "_computedLightingEnvironmentMapsPath"));
  objc_msgSend(v14, "set_antialiasingMode:", a5);
  *(float *)&double v15 = v11;
  *(float *)&double v16 = v13;
  objc_msgSend(v14, "set_viewport:", 0.0, 0.0, v15, v16);
  if (self->_renderingAPI) {
    [(SCNRenderer *)self lock];
  }
  uint64_t v17 = (CGImage *)[v14 createSnapshot:a6 error:a3];
  if (self->_renderingAPI) {
    [(SCNRenderer *)self unlock];
  }
  if (!self->_pointOfView)
  {
    -[SCNRenderer setPointOfView:](self, "setPointOfView:", [v14 pointOfView]);
    self->_pointOfViewWasSet = 0;
  }
  if ((*((unsigned char *)self + 129) & 4) != 0)
  {

    self->_snapshotRenderer = 0;
  }
  return v17;
}

- (id)snapshotRendererWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  snapshotRenderer = self->_snapshotRenderer;
  if (snapshotRenderer)
  {
    -[SCNRenderer _setBackingSize:](snapshotRenderer, "_setBackingSize:", a3.width, a3.height);
  }
  else
  {
    unint64_t renderingAPI = self->_renderingAPI;
    size_t v8 = objc_opt_class();
    if (renderingAPI) {
      uint64_t v9 = objc_msgSend(v8, "rendererWithContext:options:", -[SCNRenderer context](self, "context"), 0);
    }
    else {
      uint64_t v9 = objc_msgSend(v8, "rendererWithDevice:options:", -[SCNRenderer device](self, "device"), 0);
    }
    uint64_t v10 = v9;
    self->_snapshotRenderer = v10;
    -[SCNRenderer _setupOffscreenRendererWithSize:](v10, "_setupOffscreenRendererWithSize:", width, height);
  }
  [(SCNRenderer *)self lock];
  +[SCNTransaction begin];
  +[SCNTransaction setDisableActions:1];
  +[SCNTransaction setImmediateMode:1];
  [(SCNScene *)[(SCNRenderer *)self scene] lock];
  [(SCNRenderer *)self _contentsScaleFactor];
  *(float *)&double v11 = v11;
  self->_snapshotRenderer->_contentScaleFactor = *(float *)&v11;
  [(SCNRenderer *)self->_snapshotRenderer setScene:[(SCNRenderer *)self scene]];
  [(SCNRenderer *)self->_snapshotRenderer setOverlaySKScene:[(SCNRenderer *)self overlaySKScene]];
  [(SCNRenderer *)self->_snapshotRenderer setJitteringEnabled:[(SCNRenderer *)self isJitteringEnabled]];
  [(SCNRenderer *)self->_snapshotRenderer setJitteringEnabled:[(SCNRenderer *)self isJitteringEnabled]];
  [(SCNRenderer *)self->_snapshotRenderer setVertexAmplificationEnabled:[(SCNRenderer *)self vertexAmplificationEnabled]];
  [(SCNRenderer *)self->_snapshotRenderer setPointOfView:[(SCNRenderer *)self pointOfView]];
  [(SCNRenderer *)self->_snapshotRenderer setAutoenablesDefaultLighting:[(SCNRenderer *)self autoenablesDefaultLighting]];
  [(SCNRenderer *)self->_snapshotRenderer setAutoAdjustCamera:[(SCNRenderer *)self autoAdjustCamera]];
  [(SCNRenderer *)self->_snapshotRenderer setLoops:[(SCNRenderer *)self loops]];
  [(SCNRenderer *)self->_snapshotRenderer setPlaying:[(SCNRenderer *)self isPlaying]];
  [(SCNRenderer *)self sceneTime];
  -[SCNRenderer setSceneTime:](self->_snapshotRenderer, "setSceneTime:");
  [(SCNRenderer *)self->_snapshotRenderer setDelegate:[(SCNRenderer *)self delegate]];
  [(SCNRenderer *)self->_snapshotRenderer set_wantsSceneRendererDelegationMessages:[(SCNRenderer *)self _wantsSceneRendererDelegationMessages]];
  [(SCNRenderer *)self->_snapshotRenderer setBackgroundColor:[(SCNRenderer *)self backgroundColor]];
  [(SCNRenderer *)self->_snapshotRenderer setTechnique:[(SCNRenderer *)self technique]];
  [(SCNRenderer *)self->_snapshotRenderer setDebugOptions:[(SCNRenderer *)self debugOptions]];
  [(SCNRenderer *)self _superSamplingFactor];
  -[SCNRenderer set_superSamplingFactor:](self->_snapshotRenderer, "set_superSamplingFactor:");
  [(SCNRenderer *)self _screenTransform];
  uint64_t v12 = self->_snapshotRenderer;
  v16[0] = v16[4];
  v16[1] = v16[5];
  v16[2] = v16[6];
  v16[3] = v16[7];
  [(SCNRenderer *)v12 set_screenTransform:v16];
  [(SCNRenderer *)self->_snapshotRenderer set_collectCompilationErrors:[(SCNRenderer *)self _collectCompilationErrors]];
  [(SCNRenderer *)self->_snapshotRenderer set_resourceManagerMonitor:[(SCNRenderer *)self _resourceManagerMonitor]];
  [(SCNRenderer *)self->_snapshotRenderer set_commandBufferStatusMonitor:[(SCNRenderer *)self _commandBufferStatusMonitor]];
  [(SCNRenderer *)self->_snapshotRenderer __setTransitionContext:self->_transitionContext];
  C3DEngineContextSetClearsOnDraw((uint64_t)[(SCNRenderer *)self->_snapshotRenderer _engineContext], 1);
  float v13 = [(SCNRenderer *)self->_snapshotRenderer _engineContext];
  int InterfaceOrientation = C3DEngineContextGetInterfaceOrientation((uint64_t)self->_engineContext);
  C3DEngineContextSetInterfaceOrientation((uint64_t)v13, InterfaceOrientation);
  [(SCNScene *)[(SCNRenderer *)self scene] unlock];
  +[SCNTransaction commit];
  [(SCNRenderer *)self unlock];
  return self->_snapshotRenderer;
}

- (void)_updateProbes:(id)a3 withProgress:(id)a4
{
  [a4 becomeCurrentWithPendingUnitCount:1];
  [(SCNRenderer *)self updateProbes:a3 atTime:CACurrentMediaTime()];

  [a4 resignCurrent];
}

- (void)updateProbes:(NSArray *)lightProbes atTime:(CFTimeInterval)time
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  if (![(SCNRenderer *)self scene])
  {
    size_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCNRenderer updateProbes:atTime:].cold.5(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  double v15 = [(SCNRenderer *)self device];
  uint64_t v80 = [(SCNRenderer *)self commandQueue];
  double v16 = (void *)[MEMORY[0x263F12A50] textureCubeDescriptorWithPixelFormat:115 size:1024 mipmapped:0];
  [v16 setResourceOptions:32];
  [v16 setUsage:5];
  long long v87 = (void *)[(MTLDevice *)v15 newTextureWithDescriptor:v16];
  long long v93 = +[SCNRenderer rendererWithDevice:v15 options:0];
  [(SCNRenderer *)v93 setScene:[(SCNRenderer *)self scene]];
  uint64_t v19 = objc_msgSend(-[SCNRenderer backgroundColor](self, "backgroundColor"), "scn_C3DColorIgnoringColorSpace:success:", 0, 0);
  float v18 = *((float *)&v19 + 1);
  float v17 = *(float *)&v19;
  float v21 = v20;
  float v23 = v22;
  long long v85 = [(SCNScene *)[(SCNRenderer *)self scene] sceneRef];
  uint64_t BackgroundEffectSlot = C3DSceneGetBackgroundEffectSlot((uint64_t)v85, 0);
  if (BackgroundEffectSlot)
  {
    ColorIfApplicable = (float *)C3DEffectSlotGetColorIfApplicable(BackgroundEffectSlot);
    if (ColorIfApplicable)
    {
      float v17 = *ColorIfApplicable;
      float v18 = ColorIfApplicable[1];
      float v21 = ColorIfApplicable[2];
      float v23 = ColorIfApplicable[3];
    }
  }
  obuint64_t j = [(SCNNode *)[(SCNScene *)[(SCNRenderer *)self scene] rootNode] childNodesPassingTest:&__block_literal_global_634];
  long long v70 = self;
  if ([MEMORY[0x263F08AB8] currentProgress]) {
    double v26 = objc_msgSend(MEMORY[0x263F08AB8], "progressWithTotalUnitCount:", -[NSArray count](lightProbes, "count"));
  }
  else {
    double v26 = 0;
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  uint64_t v27 = [(NSArray *)lightProbes countByEnumeratingWithState:&v103 objects:v116 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v104;
    double v30 = v17;
    double v31 = v18;
    double v32 = v21;
    double v33 = v23;
    float32x4_t v76 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
    long long v77 = *MEMORY[0x263EF89A8];
    float32x4_t v73 = vnegq_f32(*MEMORY[0x263EF89A8]);
    long long v74 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
    float32x4_t v75 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
    float32x4_t v71 = vnegq_f32(v76);
    float32x4_t v72 = vnegq_f32(v75);
    float64x2_t v68 = &v113;
    long long v69 = lightProbes;
    uint64_t v78 = *(void *)v104;
    uint64_t v79 = v26;
    do
    {
      uint64_t v34 = 0;
      uint64_t v81 = v28;
      do
      {
        if (*(void *)v104 != v29) {
          objc_enumerationMutation(lightProbes);
        }
        double v35 = *(void **)(*((void *)&v103 + 1) + 8 * v34);
        if (objc_msgSend(v35, "light", v68)
          && SCNLightTypeToC3DLightType(objc_msgSend((id)objc_msgSend(v35, "light"), "type")) == 4)
        {
          unint64_t v36 = objc_msgSend((id)objc_msgSend(v35, "light"), "probeType");
          if (v36 < 2)
          {
            unint64_t v39 = v36;
            if ([v26 isCancelled]) {
              goto LABEL_44;
            }
            uint64_t v84 = v34;
            float32x4_t v82 = (void *)[(MTLCommandQueue *)v80 commandBuffer];
            [v26 becomeCurrentWithPendingUnitCount:1];
            uint64_t v40 = (void *)[MEMORY[0x263F129A0] renderPassDescriptor];
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v40, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setClearColor:", v30, v31, v32, v33);
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(v40, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setLoadAction:", 2);
            int8x16_t v41 = +[SCNNode node];
            [(SCNNode *)v41 setCamera:+[SCNCamera camera]];
            [(SCNCamera *)[(SCNNode *)v41 camera] setFieldOfView:90.0];
            objc_msgSend((id)objc_msgSend(v35, "light"), "zNear");
            [(SCNCamera *)[(SCNNode *)v41 camera] setZNear:v42];
            objc_msgSend((id)objc_msgSend(v35, "light"), "zFar");
            [(SCNCamera *)[(SCNNode *)v41 camera] setZFar:v43];
            [(SCNNode *)v41 setLight:+[SCNLight light]];
            [(SCNLight *)[(SCNNode *)v41 light] setType:@"probe"];
            [(SCNRenderer *)v93 setPointOfView:v41];
            [v35 simdWorldTransform];
            float32x4_t v90 = v45;
            float32x4_t v91 = v44;
            float32x4_t v88 = v47;
            float32x4_t v89 = v46;
            unsigned int v83 = [v35 isHidden];
            long long v86 = v35;
            [v35 setHidden:1];
            v115[0] = v75;
            v115[1] = v76;
            v115[2] = v73;
            v115[3] = v74;
            v115[4] = v72;
            v115[5] = v76;
            v115[6] = v77;
            v115[7] = v74;
            v115[8] = v77;
            v115[9] = v75;
            v115[10] = v71;
            v115[11] = v74;
            v115[12] = v77;
            v115[13] = v72;
            v115[14] = v76;
            v115[15] = v74;
            v115[16] = v77;
            v115[17] = v76;
            v115[18] = v75;
            v115[19] = v74;
            v115[20] = v73;
            v115[21] = v76;
            v115[22] = v72;
            v115[23] = v74;
            char WantsSSR = C3DSceneGetWantsSSR((uint64_t)v85);
            C3DSceneSetWantsSSR((uint64_t)v85, 0);
            for (uint64_t i = 0; i != 6; ++i)
            {
              int8x16_t v50 = objc_msgSend(v87, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v87, "pixelFormat"), 2, 0, objc_msgSend(v87, "mipmapLevelCount"), i, 1);
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v40, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", v50);
              uint64_t v51 = 0;
              __int16 v52 = &v115[4 * i];
              long long v53 = v52[1];
              long long v54 = v52[2];
              long long v55 = v52[3];
              v107[0] = *v52;
              v107[1] = v53;
              v107[2] = v54;
              v107[3] = v55;
              long long v108 = 0u;
              long long v109 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              do
              {
                *(long long *)((char *)&v108 + v51 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v91, COERCE_FLOAT(v107[v51])), v90, *(float32x2_t *)&v107[v51], 1), v89, (float32x4_t)v107[v51], 2), v88, (float32x4_t)v107[v51], 3);
                ++v51;
              }
              while (v51 != 4);
              -[SCNNode setSimdTransform:](v41, "setSimdTransform:", *(double *)&v108, *(double *)&v109, *(double *)&v110, *(double *)&v111);
              +[SCNTransaction flush];
              -[SCNRenderer renderAtTime:viewport:commandBuffer:passDescriptor:](v93, "renderAtTime:viewport:commandBuffer:passDescriptor:", 0, v40, time, 0.0, 0.0, (double)(unint64_t)[v50 width], (double)(unint64_t)objc_msgSend(v50, "height"));
            }
            [v86 setHidden:v83];
            C3DSceneSetWantsSSR((uint64_t)v85, WantsSSR);
            uint64_t v56 = (void *)-[SCNMTLRenderContext resourceManager]((uint64_t)[(SCNRenderer *)v93 _renderContextMetal]);
            if (v39)
            {
              unsigned int v57 = (void *)[v56 newRadianceTextureForEnvironmentTexture:v87 engineContext:v70->_engineContext cpuAccessible:1 commandBuffer:v82];
              [v82 commit];
              [v82 waitUntilCompleted];
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v86, "light"), "probeEnvironment"), "setContents:", v57);
            }
            else
            {
              int v58 = (void *)[v56 sphericalHarmonicsForEnvironmentTexture:v87 order:3 commandBuffer:v82];
              [v82 commit];
              [v82 waitUntilCompleted];
              int v59 = (float32x4_t *)[v86 nodeRef];
              uint64_t v60 = objc_msgSend((id)objc_msgSend(v86, "light"), "lightRef");
              long long v92 = v58;
              uint64_t v61 = [v58 contents];
              long long v95 = 0u;
              long long v96 = 0u;
              long long v97 = 0u;
              long long v98 = 0u;
              uint64_t v62 = [(NSArray *)obj countByEnumeratingWithState:&v95 objects:v114 count:16];
              if (v62)
              {
                uint64_t v63 = v62;
                uint64_t v64 = *(void *)v96;
                do
                {
                  for (uint64_t j = 0; j != v63; ++j)
                  {
                    if (*(void *)v96 != v64) {
                      objc_enumerationMutation(obj);
                    }
                    C3DLightAddLightSHContribution(v60, v59, objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v95 + 1) + 8 * j), "light"), "lightRef"), (float32x4_t *)objc_msgSend(*(id *)(*((void *)&v95 + 1) + 8 * j), "nodeRef"), 3u, v61);
                  }
                  uint64_t v63 = [(NSArray *)obj countByEnumeratingWithState:&v95 objects:v114 count:16];
                }
                while (v63);
              }
              if ([v92 length] != 108)
              {
                float32x2_t v66 = scn_default_log();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT)) {
                  -[SCNRenderer updateProbes:atTime:].cold.4(buf, v68, v66);
                }
              }
              objc_msgSend((id)objc_msgSend(v86, "light"), "set_sphericalHarmonics:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", objc_msgSend(v92, "contents"), objc_msgSend(v92, "length")));
              lightProbes = v69;
            }
            uint64_t v29 = v78;
            double v26 = v79;
            uint64_t v28 = v81;
            uint64_t v34 = v84;
            [v79 resignCurrent];
          }
          else
          {
            CGFloat v37 = scn_default_log();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              -[SCNRenderer updateProbes:atTime:](&v99, v100);
            }
          }
        }
        else
        {
          uint64_t v38 = scn_default_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[SCNRenderer updateProbes:atTime:](&v101, v102);
          }
        }
        ++v34;
      }
      while (v34 != v28);
      uint64_t v67 = [(NSArray *)lightProbes countByEnumeratingWithState:&v103 objects:v116 count:16];
      uint64_t v28 = v67;
    }
    while (v67);
  }
LABEL_44:
}

uint64_t __35__SCNRenderer_updateProbes_atTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 light];
  if (result)
  {
    if (C3DNodeIsHiddenOrIsHiddenByAncestor([a2 nodeRef]))
    {
      return 0;
    }
    else
    {
      uint64_t result = objc_msgSend((id)objc_msgSend(a2, "light"), "isBaked");
      if (result)
      {
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "light"), "type"), "isEqualToString:", @"directional") & 1) != 0|| (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "light"), "type"), "isEqualToString:", @"omni"))
        {
          return 1;
        }
        else
        {
          uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "light"), "type");
          return [v4 isEqualToString:@"spot"];
        }
      }
    }
  }
  return result;
}

- (void)_jitterAtStep:(unint64_t)a3 updateMainFramebuffer:(BOOL)a4 redisplay:(BOOL)a5 jitterer:(id)a6
{
  unint64_t v11 = [(SCNRenderer *)self renderingAPI];
  renderingQueue = self->__renderingQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__SCNRenderer__jitterAtStep_updateMainFramebuffer_redisplay_jitterer___block_invoke;
  v13[3] = &unk_264008A48;
  v13[4] = self;
  void v13[5] = a6;
  v13[6] = a3;
  BOOL v14 = a4;
  BOOL v15 = v11 != 0;
  BOOL v16 = a5;
  dispatch_sync(renderingQueue, v13);
}

uint64_t __70__SCNRenderer__jitterAtStep_updateMainFramebuffer_redisplay_jitterer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _engineContext];
  uint64_t result = [*(id *)(a1 + 40) isAborting];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) _installContext];
    if (result)
    {
      [*(id *)(a1 + 32) lock];
      +[SCNTransaction lock];
      C3DEngineContextSetJitteringEnabled(v2, 1);
      C3DEngineContextSetJitteringStep(v2, *(_DWORD *)(a1 + 48));
      C3DEngineContextSetUpdateMainFramebuffer(v2, *(unsigned __int8 *)(a1 + 56));
      id v4 = objc_alloc_init(MEMORY[0x263F086B0]);
      if (*(unsigned char *)(a1 + 57)) {
        glPushGroupMarkerEXT(0, "SceneKit - Jitter");
      }
      [*(id *)(a1 + 32) _beginFrame];
      [*(id *)(a1 + 32) _drawAtTime:CACurrentMediaTime()];
      C3DEngineContextSetUpdateMainFramebuffer(v2, 1);
      C3DEngineContextSetJitteringEnabled(v2, 0);
      [*(id *)(a1 + 32) _endFrame];
      if (*(unsigned char *)(a1 + 58)) {
        [*(id *)(*(void *)(a1 + 32) + 344) _jitterRedisplay];
      }
      if (*(unsigned char *)(a1 + 57)) {
        glPopGroupMarkerEXT();
      }
      [v4 drain];
      +[SCNTransaction unlock];
      uint64_t v5 = *(void **)(a1 + 32);
      return [v5 unlock];
    }
  }
  return result;
}

- (id)privateRendererOwner
{
  return self->_privateRendererOwner;
}

- (void)_addGPUFrameScheduledHandler:(id)a3
{
  if (self->_renderingAPI)
  {
    id v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCNRenderer _addGPUFrameScheduledHandler:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, MEMORY[0x263EF8330], 3221225472, __44__SCNRenderer__addGPUFrameScheduledHandler___block_invoke, &unk_264008A70, self, a3);
  }
}

void __44__SCNRenderer__addGPUFrameScheduledHandler___block_invoke(uint64_t a1)
{
}

- (void)_addGPUFrameCompletedHandler:(id)a3
{
  if (self->_renderingAPI)
  {
    id v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCNRenderer _addGPUFrameCompletedHandler:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", 0, MEMORY[0x263EF8330], 3221225472, __44__SCNRenderer__addGPUFrameCompletedHandler___block_invoke, &unk_264008A70, self, a3);
  }
}

void __44__SCNRenderer__addGPUFrameCompletedHandler___block_invoke(uint64_t a1)
{
}

- (void)_addGPUFramePresentedHandler:(id)a3
{
  if (self->_renderingAPI)
  {
    id v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCNRenderer _addGPUFramePresentedHandler:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
    (*((void (**)(id))a3 + 2))(a3);
  }
  else if ((*((unsigned char *)self + 129) & 4) != 0)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __44__SCNRenderer__addGPUFramePresentedHandler___block_invoke;
    v21[3] = &unk_264008A70;
    v21[4] = self;
    v21[5] = a3;
    +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v21];
  }
  else
  {
    uint64_t v13 = scn_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SCNRenderer _addGPUFramePresentedHandler:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    [(SCNRenderer *)self _addGPUFrameCompletedHandler:a3];
  }
}

void __44__SCNRenderer__addGPUFramePresentedHandler___block_invoke(uint64_t a1)
{
}

- (void)_discardPendingGPUFrameScheduledHandlers
{
}

void __55__SCNRenderer__discardPendingGPUFrameScheduledHandlers__block_invoke(uint64_t a1)
{
}

- (void)_discardPendingGPUFrameCompletedHandlers
{
}

void __55__SCNRenderer__discardPendingGPUFrameCompletedHandlers__block_invoke(uint64_t a1)
{
}

- (void)_discardPendingGPUFramePresentedHandlers
{
}

void __55__SCNRenderer__discardPendingGPUFramePresentedHandlers__block_invoke(uint64_t a1)
{
}

- (void)_allowGPUBackgroundExecution
{
}

uint64_t *__43__SCNRenderer__allowGPUBackgroundExecution__block_invoke(uint64_t a1)
{
  return -[SCNMTLRenderContext _allowGPUBackgroundExecution](*(uint64_t **)(*(void *)(a1 + 32) + 280));
}

- (void)_interfaceOrientationDidChange
{
  if ((*((unsigned char *)self + 129) & 8) != 0) {
    uint64_t v3 = objc_msgSend((id)objc_msgSend((id)-[SCNSceneRenderer window](self->_privateRendererOwner, "window"), "windowScene"), "interfaceOrientation");
  }
  else {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "statusBarOrientation");
  }

  [(SCNRenderer *)self _setInterfaceOrientation:v3];
}

- (void)_setInterfaceOrientation:(int64_t)a3
{
  int v3 = a3;
  [(SCNRenderer *)self lock];
  C3DEngineContextSetInterfaceOrientation((uint64_t)self->_engineContext, v3);

  [(SCNRenderer *)self unlock];
}

- (BOOL)renderMovieToURL:(id)a3 size:(CGSize)a4 antialiasingMode:(unint64_t)a5 attributes:(id)a6 error:(id *)a7
{
  uint64_t v9 = -[SCNMovieExportOperation initWithRenderer:size:attributes:outputURL:]([SCNMovieExportOperation alloc], "initWithRenderer:size:attributes:outputURL:", self, a6, a3, a4.width, a4.height);
  [(_SCNExportOperation *)v9 setAntialiasingMode:a5];
  [(SCNMovieExportOperation *)v9 main];
  uint64_t v10 = [(_SCNExportOperation *)v9 error];
  uint64_t v11 = v10;
  if (a7 && v10) {
    *a7 = [(_SCNExportOperation *)v9 error];
  }
  return v11 == 0;
}

- (void)_initWithOptions:(uint64_t)a3 isPrivateRenderer:(uint64_t)a4 privateRendererOwner:(uint64_t)a5 clearsOnDraw:(uint64_t)a6 context:(uint64_t)a7 renderingAPI:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initWithOptions:(uint64_t)a3 isPrivateRenderer:(uint64_t)a4 privateRendererOwner:(uint64_t)a5 clearsOnDraw:(uint64_t)a6 context:(uint64_t)a7 renderingAPI:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initWithOptions:isPrivateRenderer:privateRendererOwner:clearsOnDraw:context:renderingAPI:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: SCNRenderer::init - no engine context", v2, v3, v4, v5, v6);
}

void __37__SCNRenderer__prepareGLRenderTarget__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)autoenablesDefaultLighting
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: autoenablesDefaultLighting: renderer has no context", v2, v3, v4, v5, v6);
}

- (void)setAutoenablesDefaultLighting:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: setAutoenablesDefaultLighting: renderer has no context", v2, v3, v4, v5, v6);
}

- (void)setPointOfView:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __28__SCNRenderer_setTechnique___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: SCNRenderer::setTechnique - no engine available yet - ignoring", v2, v3, v4, v5, v6);
}

- (void)_preparePreloadRenderer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: prepareObject:shouldAbortBlock renderer has no GL context", v2, v3, v4, v5, v6);
}

- (void)_drawAtTime:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: glError before rendering SceneKit contents: %x", (uint8_t *)v2, 8u);
}

- (void)_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Render pass descriptor misconfigured - missing drawable texture", v2, v3, v4, v5, v6);
}

- (void)_renderAtTime:viewport:encoder:passDescriptor:commandQueue:commandBuffer:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Starting iOS 13.0 and macOS 10.15, SceneKit uses reverseZ depth buffer to achieve better precision. You must clear your depth to 0.0 or everything will be discarded. To opt out of this new behavior you can set the SCNDisableReverseZ key to a BOOLean value of YES in your app's Info.plist file.", v2, v3, v4, v5, v6);
}

- (void)_renderAtTime:(uint64_t)a3 viewport:(uint64_t)a4 encoder:(uint64_t)a5 passDescriptor:(uint64_t)a6 commandQueue:(uint64_t)a7 commandBuffer:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createSnapshot:(id *)a1 error:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to create snapshot with error %@", (uint8_t *)&v4, 0xCu);
}

- (void)updateProbes:(unsigned char *)a1 atTime:(unsigned char *)a2 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Error: Can only update lightProbe", v4);
}

- (void)updateProbes:(unsigned char *)a1 atTime:(unsigned char *)a2 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Error: Can only update 'baked' lightProbes", v4);
}

- (void)updateProbes:(unsigned char *)a1 atTime:(unsigned char *)a2 .cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Unreachable code: Unsupported probe type", v4);
}

- (void)updateProbes:(os_log_t)log atTime:.cold.4(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "shBuffer.length == ((shOrder * shOrder) * 3 * sizeof(float))";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. MTLBuffer containing the SH coefficients has not the expected size", buf, 0xCu);
}

- (void)updateProbes:(uint64_t)a3 atTime:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addGPUFrameScheduledHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addGPUFrameCompletedHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addGPUFramePresentedHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addGPUFramePresentedHandler:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end