@interface SCNView
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)displayLinkCallbackShouldReturnImmediately;
+ (BOOL)lowLatency;
+ (BOOL)shouldObserveApplicationStateToPreventBackgroundGPUAccess;
+ (BOOL)usesSeparateWorkGroup;
+ (Class)layerClass;
+ (id)_currentSCNViewFocusEnvironment;
+ (id)_kvoKeysForwardedToRenderer;
+ (id)deviceForOptions:(id)a3;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (unint64_t)renderingAPIForOptions:(id)a3;
- (AVAudioEngine)audioEngine;
- (AVAudioEnvironmentNode)audioEnvironmentNode;
- (BOOL)_canJitter;
- (BOOL)_checkAndUpdateDisplayLinkStateIfNeeded;
- (BOOL)_controlsOwnScaleFactor;
- (BOOL)_disableLinearRendering;
- (BOOL)_enableARMode;
- (BOOL)_ibWantsMultisampling;
- (BOOL)_isEditor;
- (BOOL)_shouldDelegateARCompositing;
- (BOOL)_showsAuthoringEnvironment;
- (BOOL)_supportsJitteringSyncRedraw;
- (BOOL)_wantsSceneRendererDelegationMessages;
- (BOOL)allowsCameraControl;
- (BOOL)autoenablesDefaultLighting;
- (BOOL)drawableResizesAsynchronously;
- (BOOL)isJitteringEnabled;
- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4;
- (BOOL)isOpaque;
- (BOOL)isPlaying;
- (BOOL)isTemporalAntialiasingEnabled;
- (BOOL)loops;
- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4;
- (BOOL)rendersContinuously;
- (BOOL)scn_inLiveResize;
- (BOOL)showsStatistics;
- (BOOL)skipFramesIfNoDrawableAvailable;
- (BOOL)usesReverseZ;
- (CGColorSpace)workingColorSpace;
- (CGRect)currentViewport;
- (CGSize)_updateBackingSize;
- (CGSize)backingSizeForBoundSize:(CGSize)a3;
- (EAGLContext)eaglContext;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLRenderCommandEncoder)currentRenderCommandEncoder;
- (MTLRenderPassDescriptor)currentRenderPassDescriptor;
- (NSColor)backgroundColor;
- (NSInteger)preferredFramesPerSecond;
- (NSString)description;
- (SCNAntialiasingMode)antialiasingMode;
- (SCNCameraController)defaultCameraController;
- (SCNMatrix4)_screenTransform;
- (SCNNode)audioListener;
- (SCNNode)pointOfView;
- (SCNScene)scene;
- (SCNSceneRendererDelegate)delegate;
- (SCNTechnique)technique;
- (SCNVector3)projectPoint:(SCNVector3)a3;
- (SCNVector3)unprojectPoint:(SCNVector3)a3;
- (SCNVector4)_viewport;
- (SCNView)init;
- (SCNView)initWithCoder:(id)a3;
- (SCNView)initWithFrame:(CGRect)a3;
- (SCNView)initWithFrame:(CGRect)frame options:(NSDictionary *)options;
- (SKScene)overlaySKScene;
- (UIImage)snapshot;
- (double)_flipY:(double)a3;
- (double)_renderThreadPriority;
- (double)_runFPSTestWithDuration:(double)a3;
- (double)_superSamplingFactor;
- (double)sceneTime;
- (id)_authoringEnvironment;
- (id)_commandBufferStatusMonitor;
- (id)_defaultBackgroundColor;
- (id)_ibSceneName;
- (id)_renderingQueue;
- (id)_resourceManagerMonitor;
- (id)displayLink;
- (id)eventHandler;
- (id)focusItemsInRect:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 options:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)hitTestWithSegmentFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 options:(id)a5;
- (id)navigationCameraController;
- (id)nodesInsideFrustumWithPointOfView:(id)a3;
- (id)pointOfCulling;
- (id)renderer;
- (id)scn_backingLayer;
- (int)_ibPreferredRenderingAPI;
- (int64_t)_preferredFocusMovementStyle;
- (unint64_t)_renderOptions;
- (unint64_t)colorPixelFormat;
- (unint64_t)debugOptions;
- (unint64_t)depthPixelFormat;
- (unint64_t)renderingAPI;
- (unint64_t)stencilPixelFormat;
- (void)__CFObject;
- (void)_addGPUFrameCompletedHandler:(id)a3;
- (void)_addGPUFramePresentedHandler:(id)a3;
- (void)_addGPUFrameScheduledHandler:(id)a3;
- (void)_adjustBackingLayerPixelFormat;
- (void)_allowGPUBackgroundExecution;
- (void)_backgroundDidChange;
- (void)_commonInit:(id)a3;
- (void)_createDisplayLinkIfNeeded;
- (void)_discardPendingGPUFrameCompletedHandlers;
- (void)_discardPendingGPUFramePresentedHandlers;
- (void)_discardPendingGPUFrameScheduledHandlers;
- (void)_drawAtTime:(double)a3;
- (void)_enterBackground:(id)a3;
- (void)_enterForeground:(id)a3;
- (void)_flushDisplayLink;
- (void)_initializeDisplayLinkWithScreen:(id)a3 policy:(unint64_t)a4 completionHandler:(id)a5;
- (void)_jitterRedisplay;
- (void)_sceneDidUpdate:(id)a3;
- (void)_selectRenderingAPIWithOptions:(id)a3;
- (void)_setNeedsDisplay;
- (void)_systemTimeAnimationStarted:(id)a3;
- (void)_updateContentsScaleFactor;
- (void)_updateOpacity;
- (void)_updateProbes:(id)a3 withProgress:(id)a4;
- (void)context;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)displayLayer:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)eventHandlerWantsRedraw;
- (void)layoutSubviews;
- (void)lock;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause:(id)sender;
- (void)pauseDisplayLink;
- (void)play:(id)sender;
- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4;
- (void)presentScene:(id)a3 withTransition:(id)a4 incomingPointOfView:(id)a5 completionHandler:(id)a6;
- (void)resumeDisplayLink;
- (void)safeAreaInsetsDidChange;
- (void)scn_setBackingLayer:(id)a3;
- (void)scn_setGestureRecognizers:(id)a3;
- (void)scn_updateGestureRecognizers;
- (void)setAllowsCameraControl:(BOOL)allowsCameraControl;
- (void)setAntialiasingMode:(SCNAntialiasingMode)antialiasingMode;
- (void)setAudioListener:(id)a3;
- (void)setAutoenablesDefaultLighting:(BOOL)a3;
- (void)setBackgroundColor:(NSColor *)backgroundColor;
- (void)setContentScaleFactor:(double)a3;
- (void)setDebugOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setEaglContext:(EAGLContext *)eaglContext;
- (void)setEventHandler:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setJitteringEnabled:(BOOL)a3;
- (void)setLoops:(BOOL)a3;
- (void)setNavigationCameraController:(id)a3;
- (void)setNeedsDisplay;
- (void)setOverlaySKScene:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setPointOfCulling:(id)a3;
- (void)setPointOfView:(id)a3;
- (void)setPointOfView:(id)a3 animate:(BOOL)a4;
- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond;
- (void)setRendersContinuously:(BOOL)rendersContinuously;
- (void)setScene:(SCNScene *)scene;
- (void)setSceneTime:(double)a3;
- (void)setShowsStatistics:(BOOL)a3;
- (void)setSkipFramesIfNoDrawableAvailable:(BOOL)a3;
- (void)setTechnique:(id)a3;
- (void)setTemporalAntialiasingEnabled:(BOOL)a3;
- (void)setUsesReverseZ:(BOOL)a3;
- (void)set_commandBufferStatusMonitor:(id)a3;
- (void)set_disableLinearRendering:(BOOL)a3;
- (void)set_enableARMode:(BOOL)a3;
- (void)set_ibPreferredRenderingAPI:(int)a3;
- (void)set_ibSceneName:(id)a3;
- (void)set_ibWantsMultisampling:(BOOL)a3;
- (void)set_renderOptions:(unint64_t)a3;
- (void)set_resourceManagerMonitor:(id)a3;
- (void)set_screenTransform:(SCNMatrix4 *)a3;
- (void)set_shouldDelegateARCompositing:(BOOL)a3;
- (void)set_showsAuthoringEnvironment:(BOOL)a3;
- (void)set_superSamplingFactor:(double)a3;
- (void)set_wantsSceneRendererDelegationMessages:(BOOL)a3;
- (void)stop:(id)sender;
- (void)switchToCameraNamed:(id)a3;
- (void)switchToNextCamera;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)unlock;
- (void)updateAtTime:(double)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SCNView

- (void)__CFObject
{
  return 0;
}

uint64_t __20__SCNView_setScene___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setNeedsDisplay];
}

- (void)setScene:(SCNScene *)scene
{
  if (self->_scene != scene)
  {
    [(SCNView *)self lock];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"kC3DSceneDidUpdateNotification", 0);
    [(SCNScene *)self->_scene removeObserver:self forKeyPath:@"background.contents"];
    [(SCNEventHandler *)self->_navigationCameraController sceneWillChange];

    v5 = scene;
    self->_scene = v5;
    if (v5)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel__sceneDidUpdate_, @"kC3DSceneDidUpdateNotification", -[SCNScene sceneRef](self->_scene, "sceneRef"));
      [(SCNScene *)self->_scene addObserver:self forKeyPath:@"background.contents" options:0 context:@"kSCNViewObservingContext"];
    }
    renderer = self->_renderer;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __20__SCNView_setScene___block_invoke;
    v7[3] = &unk_264004DF8;
    v7[4] = self;
    [(SCNRenderer *)renderer setScene:scene completionHandler:v7];
    [(SCNEventHandler *)self->_navigationCameraController sceneDidChange];
    [(SCNView *)self unlock];
    [(SCNView *)self _updateOpacity];
  }
}

- (void)_adjustBackingLayerPixelFormat
{
  if (!self->_renderingAPI)
  {
    [(SCNView *)self lock];
    [(SCNRenderer *)self->_renderer lock];
    int v3 = [(SCNView *)self isOpaque];
    -[SCNMTLRenderContext setIsOpaque:]((uint64_t)[(SCNRenderer *)self->_renderer _renderContextMetal], v3);
    if (C3DWideGamutIsUsed()) {
      BOOL v4 = objc_msgSend((id)objc_msgSend((id)-[SCNView window](self, "window"), "screen"), "gamut") == 1;
    }
    else {
      BOOL v4 = 0;
    }
    unint64_t v5 = [(SCNRenderer *)self->_renderer _antialiasingMode];
    char v6 = v4 | 8;
    if (!v5) {
      char v6 = v4;
    }
    if (v3) {
      char v7 = v6;
    }
    else {
      char v7 = v6 | 0x10;
    }
    char v8 = v7 & 0xDF | (32 * ((*((unsigned char *)self + 457) & 2) != 0));
    -[SCNMTLRenderContext setWantsWideGamut:]((uint64_t)[(SCNRenderer *)self->_renderer _renderContextMetal], v4);
    -[SCNMTLRenderContext setDisableLinearRendering:]((uint64_t)[(SCNRenderer *)self->_renderer _renderContextMetal], (*((unsigned __int8 *)self + 457) >> 1) & 1);
    objc_msgSend((id)-[SCNView layer](self, "layer"), "setPixelFormat:", C3DMetalFramebufferPixelFormat(v8));
    [(SCNRenderer *)self->_renderer unlock];
    [(SCNView *)self unlock];
  }
}

- (void)lock
{
}

- (BOOL)isOpaque
{
  return *((unsigned char *)self + 456) & 1;
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
  int v3 = backgroundColor;
  unint64_t v5 = (NSColor *)self->_backgroundColor;
  if (v5 != backgroundColor)
  {

    self->_backgroundColor = (UIColor *)v3;
  }
  if (!v3) {
    int v3 = [(SCNView *)self _defaultBackgroundColor];
  }
  v8.receiver = self;
  v8.super_class = (Class)SCNView;
  [(SCNView *)&v8 setBackgroundColor:v3];
  uint64_t v6 = [(SCNView *)self traitCollection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__SCNView_setBackgroundColor___block_invoke;
  v7[3] = &unk_264006138;
  v7[4] = v6;
  void v7[5] = self;
  v7[6] = v3;
  +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v7];
  [(SCNView *)self _backgroundDidChange];
}

- (void)unlock
{
}

- (void)_backgroundDidChange
{
  [(SCNView *)self _updateOpacity];

  [(SCNView *)self _adjustBackingLayerPixelFormat];
}

- (void)_updateOpacity
{
  int v3 = (NSColor *)scn_NSColorFromCGColorIfApplicable([(SCNMaterialProperty *)[(SCNScene *)self->_scene background] contents]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !v3)
  {
    int v3 = [(SCNView *)self backgroundColor];
    if (!v3) {
      int v3 = [(SCNView *)self _defaultBackgroundColor];
    }
  }
  char v9 = 0;
  [(NSColor *)v3 scn_C3DColorIgnoringColorSpace:0 success:&v9];
  *(float *)&double v5 = v4;
  char v6 = *((unsigned char *)self + 456);
  BOOL v8 = v4 == 1.0 || v9 == 0;
  *((unsigned char *)self + 456) = v6 & 0xFE | v8;
  if (((v6 & 1) == 0) == v8)
  {
    objc_msgSend((id)-[SCNView layer](self, "layer", v5), "setOpaque:", v8);
    [(SCNView *)self setOpaque:*((unsigned char *)self + 456) & 1];
  }
}

- (NSColor)backgroundColor
{
  return (NSColor *)self->_backgroundColor;
}

uint64_t __27__SCNView__setNeedsDisplay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createDisplayLinkIfNeeded];
}

uint64_t __30__SCNView_setBackgroundColor___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) setBackgroundColor:*(void *)(a1 + 40)];
}

- (id)scn_backingLayer
{
  return self->_backingLayer;
}

- (SCNView)initWithFrame:(CGRect)a3
{
  return -[SCNView initWithFrame:options:](self, "initWithFrame:options:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_sceneDidUpdate:(id)a3
{
  self->_lastUpdate = CACurrentMediaTime();

  [(SCNView *)self _setNeedsDisplay];
}

void __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  memset(&token_out, 0, sizeof(token_out));
  if (WeakRetained)
  {
    int v4 = [(id)objc_opt_class() usesSeparateWorkGroup];
    if (v4)
    {
      double v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_20B249000, v5, OS_LOG_TYPE_INFO, "Info: [SCNView] Using separate work group", v17, 2u);
      }

      if (os_workgroup_attr_set_flags()) {
        __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_3();
      }
      char v6 = (OS_os_workgroup *)os_workgroup_create();
      if (!v6) {
        __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_1();
      }
      char v7 = v6;
      if (os_workgroup_join(v6, &token_out)) {
        __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_2();
      }
    }
    else
    {
      char v7 = 0;
    }
    BOOL v8 = [WeakRetained renderer];
    char v9 = [v8 _renderingQueue];
    v10 = objc_msgSend(WeakRetained, "SCN_setupDisplayLinkWithQueue:screen:policy:", v9, *(void *)(a1 + 32), *(void *)(a1 + 56));

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    char v7 = 0;
    int v4 = 0;
  }

  v11 = [MEMORY[0x263EFF9F0] currentRunLoop];
  pthread_setname_np("com.apple.scenekit.scnview-renderer");
  pthread_set_fixedpriority_self();
  id v12 = objc_loadWeakRetained(v2);

  if (v12)
  {
    uint64_t v13 = *MEMORY[0x263EFF478];
    do
    {
      v14 = (void *)MEMORY[0x210535ED0]();
      v15 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:1.0];
      [v11 runMode:v13 beforeDate:v15];

      id v16 = objc_loadWeakRetained(v2);
    }
    while (v16);
  }
  if (v4) {
    os_workgroup_leave(v7, &token_out);
  }
}

void __37__SCNView__createDisplayLinkIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__SCNView__createDisplayLinkIfNeeded__block_invoke_2;
  v3[3] = &unk_264009870;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v3[4] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
}

- (id)renderer
{
  return self->_renderer;
}

- (SCNScene)scene
{
  return self->_scene;
}

- (void)setPointOfView:(id)a3
{
  if ([(SCNView *)self pointOfView] != a3)
  {
    [(SCNEventHandler *)self->_navigationCameraController cameraWillChange];
    [(SCNRenderer *)self->_renderer setPointOfView:a3];
    navigationCameraController = self->_navigationCameraController;
    [(SCNEventHandler *)navigationCameraController cameraDidChange];
  }
}

- (SCNNode)pointOfView
{
  return [(SCNRenderer *)self->_renderer pointOfView];
}

+ (BOOL)usesSeparateWorkGroup
{
  v2 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  return [v2 BOOLForKey:@"com.apple.sceneKit.forceSeparateWorkGroup"];
}

- (void)setAntialiasingMode:(SCNAntialiasingMode)antialiasingMode
{
  [(SCNRenderer *)self->_renderer set_antialiasingMode:antialiasingMode];

  [(SCNView *)self _setNeedsDisplay];
}

- (void)setJitteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[SCNJitterer setEnabled:](self->_jitterer, "setEnabled:");
  [(SCNRenderer *)self->_renderer setJitteringEnabled:v3];

  [(SCNView *)self _setNeedsDisplay];
}

- (SCNView)initWithFrame:(CGRect)frame options:(NSDictionary *)options
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  -[SCNView _selectRenderingAPIWithOptions:](self, "_selectRenderingAPIWithOptions:");
  v13.receiver = self;
  v13.super_class = (Class)SCNView;
  v10 = -[SCNView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_boundsSize.double width = width;
    v10->_boundsSize.double height = height;
    [(SCNView *)v10 _commonInit:options];
  }
  return v11;
}

- (void)_selectRenderingAPIWithOptions:(id)a3
{
  self->_unint64_t renderingAPI = [(id)objc_opt_class() renderingAPIForOptions:a3];
  id v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, sel_renderingAPI);
  Implementation = method_getImplementation(InstanceMethod);
  char v7 = (objc_class *)objc_opt_class();
  BOOL v8 = class_getInstanceMethod(v7, sel_renderingAPI);
  if (Implementation == method_getImplementation(v8))
  {
    unint64_t renderingAPI = self->_renderingAPI;
    if (renderingAPI) {
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t renderingAPI = [(SCNView *)self renderingAPI];
    self->_unint64_t renderingAPI = renderingAPI;
    if (renderingAPI) {
      goto LABEL_9;
    }
  }
  if (+[SCNView _isMetalSupported])
  {
    unint64_t renderingAPI = self->_renderingAPI;
    if (!renderingAPI)
    {
      C3DNotifyMetalIsUsed();
      unint64_t renderingAPI = self->_renderingAPI;
    }
  }
  else
  {
    unint64_t renderingAPI = 1;
    self->_unint64_t renderingAPI = 1;
  }
LABEL_9:
  gTmpRenderingAPI = renderingAPI;
}

- (void)_commonInit:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  SCNGetPerformanceStatisticsEnabled();
  *((unsigned char *)self + 456) |= 1u;
  *((unsigned char *)self + 456) |= 0x10u;
  self->_currentSystemTime = CACurrentMediaTime();
  self->_lock = objc_alloc_init(SCNRecursiveLock);
  unint64_t renderingAPI = self->_renderingAPI;
  char v6 = (void *)[(SCNView *)self layer];
  char v7 = v6;
  if (renderingAPI)
  {
    [v6 setOpaque:1];
    uint64_t v8 = *MEMORY[0x263F14708];
    v19[0] = *MEMORY[0x263F14710];
    v19[1] = v8;
    uint64_t v9 = *MEMORY[0x263F146F0];
    v20[0] = MEMORY[0x263EFFA80];
    v20[1] = v9;
    objc_msgSend(v7, "setDrawableProperties:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
    [(SCNView *)self scn_setBackingLayer:v7];
    v10 = [(SCNView *)self eaglContext];
    if (!v10)
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "applicationState") == 2)
      {
        v10 = 0;
      }
      else
      {
        if (LODWORD(self->_renderingAPI) == 2) {
          uint64_t v11 = 3;
        }
        else {
          uint64_t v11 = 2;
        }
        v10 = (EAGLContext *)(id)SCNCreateGLESContext(v11);
      }
    }
  }
  else
  {
    _setupMetalBackingLayer(v6, (*((unsigned __int8 *)self + 457) >> 1) & 1);
    [(SCNView *)self scn_setBackingLayer:v7];
    v10 = (EAGLContext *)[v7 device];
    self->_device = (MTLDevice *)v10;
  }
  if ([(id)objc_opt_class() shouldObserveApplicationStateToPreventBackgroundGPUAccess])
  {
    if (_UIApplicationIsExtension())
    {
      id v12 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v12 addObserver:self selector:sel__enterForeground_ name:*MEMORY[0x263F07FC0] object:0];
      objc_super v13 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      v14 = (__CFString **)MEMORY[0x263F07FD8];
    }
    else
    {
      int v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CBC8], "_applicationKeyWindow"), "_isHostedInAnotherProcess");
      id v16 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      if (v15)
      {
        [v16 addObserver:self selector:sel__enterForeground_ name:@"_UIViewServiceHostDidBecomeActiveNotification" object:0];
        objc_super v13 = (void *)[MEMORY[0x263F08A00] defaultCenter];
        v17 = @"_UIViewServiceHostWillResignActiveNotification";
LABEL_17:
        [v13 addObserver:self selector:sel__enterBackground_ name:v17 object:0];
        goto LABEL_18;
      }
      [v16 addObserver:self selector:sel__enterForeground_ name:*MEMORY[0x263F1D038] object:0];
      objc_super v13 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      v14 = (__CFString **)MEMORY[0x263F1D0D8];
    }
    v17 = *v14;
    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "nativeScale");
  -[SCNView setContentScaleFactor:](self, "setContentScaleFactor:");
  [(SCNView *)self setContentMode:4];
  [(SCNView *)self setMultipleTouchEnabled:1];
  self->_renderer = (SCNRenderer *)[[SCNRenderer alloc] _initWithOptions:a3 isPrivateRenderer:1 privateRendererOwner:self clearsOnDraw:1 context:v10 renderingAPI:self->_renderingAPI];
  self->_jitterer = [[SCNJitterer alloc] initWithDelegate:self];
  [(SCNView *)self setBackgroundColor:[(SCNView *)self _defaultBackgroundColor]];
  if (C3DPreferencesGetBool(3)) {
    [(SCNView *)self setAllowsCameraControl:1];
  }
  if (C3DPreferencesGetBool(2)) {
    [(SCNView *)self setShowsStatistics:1];
  }
  SCNUIKitSourceSetCurrentViewEvent(self);
  if ((MGGetBoolAnswer() & 1) != 0 || !NSClassFromString(&cfstr_Arscnview.isa)) {
    char v18 = 1;
  }
  else {
    char v18 = objc_opt_isKindOfClass() ^ 1;
  }
  -[SCNMTLRenderContext setShouldPresentAfterMinimumDuration:]((uint64_t)[(SCNRenderer *)self->_renderer _renderContextMetal], v18 & 1);
  -[SCNMTLRenderContext setPreferredFramesPerSecond:]((uint64_t)[(SCNRenderer *)self->_renderer _renderContextMetal], 0);
  if (_UIApplicationIsExtension()) {
    [(SCNRenderer *)self->_renderer _runningInExtension];
  }
  [(SCNView *)self setNavigationCameraController:[[SCNCameraNavigationController alloc] initWithView:self]];
}

- (void)setContentScaleFactor:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNView;
  [(SCNView *)&v4 setContentScaleFactor:a3];
  if (self->_renderer)
  {
    [(SCNView *)self _updateBackingSize];
    [(SCNView *)self setNeedsDisplay];
  }
}

uint64_t __30__SCNView_setBackgroundColor___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__SCNView_setBackgroundColor___block_invoke_2;
  v4[3] = &unk_264005FA0;
  long long v5 = *(_OWORD *)(a1 + 40);
  [v2 performAsCurrentTraitCollection:v4];
  return [*(id *)(a1 + 40) _setNeedsDisplay];
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)SCNView;
  [(SCNView *)&v3 setNeedsDisplay];
  if (!self->_renderingAPI) {
    [(SCNView *)self _setNeedsDisplay];
  }
}

- (void)_setNeedsDisplay
{
  if ((*((unsigned char *)self + 456) & 0x10) == 0)
  {
    [(SCNJitterer *)self->_jitterer stopIfNeeded];
    self->_didTriggerRedrawWhileRendering = 1;
    if (self->_displayLink)
    {
      objc_super v3 = v5;
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      objc_super v4 = __27__SCNView__setNeedsDisplay__block_invoke_2;
    }
    else
    {
      objc_super v3 = block;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      objc_super v4 = __27__SCNView__setNeedsDisplay__block_invoke;
    }
    v3[2] = v4;
    v3[3] = &unk_264004DF8;
    v3[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v3);
  }
}

- (void)setNavigationCameraController:(id)a3
{
  navigationCameraController = self->_navigationCameraController;
  if (navigationCameraController != a3)
  {
    [(SCNEventHandler *)navigationCameraController setDelegate:0];

    self->_navigationCameraController = (SCNEventHandler *)a3;
    objc_msgSend(-[SCNView navigationCameraController](self, "navigationCameraController"), "setDelegate:", self);
    [(SCNView *)self scn_updateGestureRecognizers];
  }
}

- (void)scn_updateGestureRecognizers
{
  objc_super v3 = (void *)[MEMORY[0x263EFF980] array];
  navigationCameraController = self->_navigationCameraController;
  if (navigationCameraController) {
    objc_msgSend(v3, "addObjectsFromArray:", -[SCNEventHandler gestureRecognizers](navigationCameraController, "gestureRecognizers"));
  }

  [(SCNView *)self scn_setGestureRecognizers:v3];
}

- (void)scn_setGestureRecognizers:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  controllerGestureRecognizers = self->_controllerGestureRecognizers;
  uint64_t v6 = [(NSArray *)controllerGestureRecognizers countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(controllerGestureRecognizers);
        }
        [(SCNView *)self removeGestureRecognizer:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [(NSArray *)controllerGestureRecognizers countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  v10 = (NSArray *)a3;
  self->_controllerGestureRecognizers = v10;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(SCNView *)self addGestureRecognizer:*(void *)(*((void *)&v15 + 1) + 8 * j)];
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)scn_setBackingLayer:(id)a3
{
  backingLayer = self->_backingLayer;
  if (backingLayer != a3)
  {

    self->_backingLayer = (CALayer *)a3;
  }
}

- (id)navigationCameraController
{
  return self->_navigationCameraController;
}

- (id)_defaultBackgroundColor
{
  return (id)[MEMORY[0x263F1C550] whiteColor];
}

+ (BOOL)shouldObserveApplicationStateToPreventBackgroundGPUAccess
{
  return 1;
}

+ (unint64_t)renderingAPIForOptions:(id)a3
{
  if (C3DPreferencesGetBool(0) || !C3DMetalIsSupported()) {
    return 1;
  }
  if (C3DPreferencesGetBool(1)) {
    return 0;
  }
  unsigned int v5 = C3DWasLinkedBeforeMajorOSYear2015();
  uint64_t v6 = (void *)[a3 objectForKey:@"SCNPreferredRenderingAPIKey"];
  if (C3DGetInfoPlistFlagIsSet(@"PrefersOpenGL", 0))
  {
    if (v6 && ![v6 integerValue])
    {
      uint64_t v8 = scn_default_log();
      unint64_t v4 = 1;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        unint64_t v4 = 1;
        _os_log_impl(&dword_20B249000, v8, OS_LOG_TYPE_INFO, "Info: PrefersOpenGL key is set in the plist but Metal is requested programmatically. GL will be used", v9, 2u);
      }
      return v4;
    }
    return 1;
  }
  if (!v6) {
    return v5;
  }

  return [v6 integerValue];
}

+ (Class)layerClass
{
  if (!gTmpRenderingAPI) {
    [a1 lowLatency];
  }

  return (Class)objc_opt_class();
}

+ (BOOL)lowLatency
{
  return 0;
}

id __37__SCNView__createDisplayLinkIfNeeded__block_invoke_2(uint64_t a1)
{
  id result = objc_loadWeak((id *)(a1 + 40));
  if (result)
  {
    unint64_t v4 = result;
    *(float *)&double v3 = (float)*((uint64_t *)result + 63);
    [*(id *)(a1 + 32) setPreferredFrameRate:v3];
    [v4 setDisplayLink:*(void *)(a1 + 32)];
    return (id)[v4 _setNeedsDisplay];
  }
  return result;
}

- (void)setDisplayLink:(id)a3
{
  displayLink = self->_displayLink;
  if (displayLink != a3)
  {

    self->_displayLink = (SCNDisplayLink *)a3;
  }
}

- (void)_createDisplayLinkIfNeeded
{
  if (!self->_displayLink && !self->_displayLinkCreationRequested)
  {
    if (self->_renderer)
    {
      self->_displayLinkCreationRequested = 1;
      objc_initWeak(&location, self);
      uint64_t v3 = objc_msgSend((id)-[SCNView window](self, "window"), "screen");
      uint64_t v4 = [(id)objc_opt_class() displayLinkPolicy];
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __37__SCNView__createDisplayLinkIfNeeded__block_invoke;
      v5[3] = &unk_264009898;
      objc_copyWeak(&v6, &location);
      [(SCNView *)self _initializeDisplayLinkWithScreen:v3 policy:v4 completionHandler:v5];
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_initializeDisplayLinkWithScreen:(id)a3 policy:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke;
  aBlock[3] = &unk_2640071B8;
  objc_copyWeak(v22, &location);
  id v10 = v8;
  id v20 = v10;
  v22[1] = (id)a4;
  id v11 = v9;
  id v21 = v11;
  uint64_t v12 = _Block_copy(aBlock);
  [(SCNView *)self _renderThreadPriority];
  double v14 = v13;
  memset(&v27, 0, sizeof(v27));
  pthread_attr_init(&v27);
  pthread_attr_setschedpolicy(&v27, 2);
  int v15 = (int)v14;
  if (v14 == 0.0) {
    int v15 = 45;
  }
  v18.sched_prioritdouble y = v15;
  *(_DWORD *)v18.__opaque = 0;
  pthread_attr_setschedparam(&v27, &v18);
  long long v16 = _Block_copy(v12);
  dispatch_time_t v17 = dispatch_time(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_2;
  block[3] = &__block_descriptor_104_e5_v8__0l;
  pthread_attr_t v25 = v27;
  v26 = v16;
  dispatch_after(v17, MEMORY[0x263EF83A0], block);
  pthread_attr_destroy(&v27);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
}

- (double)_renderThreadPriority
{
  return 0.0;
}

+ (BOOL)displayLinkCallbackShouldReturnImmediately
{
  return C3DWasLinkedBeforeMajorOSYear2022() ^ 1;
}

uint64_t __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_2(uint64_t a1)
{
  pthread_t v2 = 0;
  return pthread_create(&v2, (const pthread_attr_t *)(a1 + 32), (void *(__cdecl *)(void *))__SCNRenderThread_start__, *(void **)(a1 + 96));
}

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  [(SCNRenderer *)self->_renderer setContext:[(SCNView *)self context]];
  renderer = self->_renderer;

  return [(SCNRenderer *)renderer prepareObject:a3 shouldAbortBlock:a4];
}

- (void)context
{
  if (self->_renderingAPI) {
    return [(SCNRenderer *)self->_renderer context];
  }
  else {
    return 0;
  }
}

- (void)_enterForeground:(id)a3
{
  *((unsigned char *)self + 456) &= ~0x40u;
  int v4 = *((char *)self + 456);
  if (v4 < 0)
  {
    *((unsigned char *)self + 456) = v4 & 0x7F;
    [(SCNScene *)[(SCNView *)self scene] setPaused:0];
  }
  id AudioEngine = C3DAudioManagerGetAudioEngine(0);
  if (AudioEngine) {
    [AudioEngine startAndReturnError:0];
  }
  if ((*((unsigned char *)self + 456) & 0x10) == 0)
  {
    [(SCNView *)self resumeDisplayLink];
  }
}

- (BOOL)_canJitter
{
  RendererContextGL = [(SCNRenderer *)self->_renderer _engineContext];
  if (RendererContextGL)
  {
    uint64_t v3 = (uint64_t)RendererContextGL;
    __n128 Viewport = C3DEngineContextGetViewport((__n128 *)RendererContextGL);
    Viewport.n128_u64[0] = (unint64_t)vclez_f32((float32x2_t)vrev64_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)Viewport, (int8x16_t)Viewport, 8uLL)));
    if ((Viewport.n128_u32[1] | Viewport.n128_u32[0]))
    {
      LOBYTE(RendererContextGL) = 0;
    }
    else if (C3DEngineContextGetRenderContext(v3))
    {
      LOBYTE(RendererContextGL) = 1;
    }
    else
    {
      RendererContextGL = (__C3DEngineContext *)C3DEngineContextGetRendererContextGL(v3);
      if (RendererContextGL) {
        LOBYTE(RendererContextGL) = C3DRendererContextGetGLContext((uint64_t)RendererContextGL) != 0;
      }
    }
  }
  return (char)RendererContextGL;
}

+ (id)deviceForOptions:(id)a3
{
  id v3 = MTLCreateSystemDefaultDevice();
  if (!v3 && (deviceForOptions__done & 1) == 0)
  {
    deviceForOptions__done = 1;
    int v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[SCNView deviceForOptions:](v4);
    }
  }
  return v3;
}

- (SCNView)init
{
  return -[SCNView initWithFrame:options:](self, "initWithFrame:options:", 0, 0.0, 0.0, 1.0, 1.0);
}

- (SCNView)initWithCoder:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  if ([a3 containsValueForKey:@"ibPreferredRenderingAPI"])
  {
    uint64_t v5 = [a3 decodeIntegerForKey:@"ibPreferredRenderingAPI"];
    uint64_t v6 = v5;
    if (v5 == 2)
    {
      uint64_t v7 = 1;
LABEL_10:
      if (C3DWasLinkedBeforeMajorOSYear2015()) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = v7;
      }
      goto LABEL_13;
    }
    if (v5 == 1)
    {
      uint64_t v7 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (!C3DWasLinkedBeforeMajorOSYear2015())
  {
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = 1;
LABEL_13:
  v26 = @"SCNPreferredRenderingAPIKey";
  v27[0] = [NSNumber numberWithUnsignedInteger:v8];
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
LABEL_14:
  [(SCNView *)self _selectRenderingAPIWithOptions:v9];
  v23.receiver = self;
  v23.super_class = (Class)SCNView;
  id v10 = [(SCNView *)&v23 initWithCoder:a3];
  id v11 = v10;
  if (v10)
  {
    p_boundsSize = &v10->_boundsSize;
    [(SCNView *)v10 bounds];
    *(void *)&p_boundsSize->double width = v13;
    v11->_boundsSize.double height = v14;
    [(SCNView *)v11 set_ibPreferredRenderingAPI:v6];
    if ([a3 containsValueForKey:@"ibWantsMultisampling"]) {
      uint64_t v15 = [a3 decodeBoolForKey:@"ibWantsMultisampling"];
    }
    else {
      uint64_t v15 = 0;
    }
    [(SCNView *)v11 set_ibWantsMultisampling:v15];
    [(SCNView *)v11 _commonInit:v9];
    if ([(SCNView *)v11 _ibWantsMultisampling]) {
      [(SCNView *)v11 setAntialiasingMode:2];
    }
    if ([a3 containsValueForKey:@"loops"]) {
      -[SCNView setLoops:](v11, "setLoops:", [a3 decodeBoolForKey:@"loops"]);
    }
    if ([a3 containsValueForKey:@"playing"]) {
      -[SCNView setPlaying:](v11, "setPlaying:", [a3 decodeBoolForKey:@"playing"]);
    }
    if ([a3 containsValueForKey:@"autoenablesDefaultLighting"]) {
      -[SCNView setAutoenablesDefaultLighting:](v11, "setAutoenablesDefaultLighting:", [a3 decodeBoolForKey:@"autoenablesDefaultLighting"]);
    }
    if ([a3 containsValueForKey:@"jitteringEnabled"]) {
      -[SCNView setJitteringEnabled:](v11, "setJitteringEnabled:", [a3 decodeBoolForKey:@"jitteringEnabled"]);
    }
    if ([a3 containsValueForKey:@"temporalAntialiasingEnabled"]) {
      -[SCNView setTemporalAntialiasingEnabled:](v11, "setTemporalAntialiasingEnabled:", [a3 decodeBoolForKey:@"temporalAntialiasingEnabled"]);
    }
    if ([a3 containsValueForKey:@"allowsCameraControl"]) {
      -[SCNView setAllowsCameraControl:](v11, "setAllowsCameraControl:", [a3 decodeBoolForKey:@"allowsCameraControl"]);
    }
    if ([a3 containsValueForKey:@"backgroundColor"]) {
      -[SCNView setBackgroundColor:](v11, "setBackgroundColor:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"]);
    }
    -[SCNView set_ibSceneName:](v11, "set_ibSceneName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"ibSceneName"]);
    if ([(NSString *)v11->__ibSceneName length])
    {
      long long v16 = [(NSString *)v11->__ibSceneName pathExtension];
      dispatch_time_t v17 = (void *)SCNGetResourceBundle();
      uint64_t v18 = [(NSString *)v11->__ibSceneName stringByDeletingPathExtension];
      if ([(__CFString *)v16 isEqualToString:&stru_26BF72F58]) {
        long long v19 = @"dae";
      }
      else {
        long long v19 = v16;
      }
      uint64_t v20 = [v17 URLForResource:v18 withExtension:v19];
      if (v20)
      {
        v24[0] = @"kSceneSourceCreateCameraIfAbsent";
        v24[1] = @"kSceneSourceCreateNormalsIfAbsent";
        v25[0] = MEMORY[0x263EFFA88];
        v25[1] = MEMORY[0x263EFFA88];
        id v21 = +[SCNScene sceneWithURL:options:error:](SCNScene, "sceneWithURL:options:error:", v20, [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2], 0);
        if (v21) {
          [(SCNView *)v11 setScene:v21];
        }
      }
    }
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNView;
  -[SCNView encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView loops](self, "loops"), @"loops");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView isPlaying](self, "isPlaying"), @"playing");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView autoenablesDefaultLighting](self, "autoenablesDefaultLighting"), @"autoenablesDefaultLighting");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView isJitteringEnabled](self, "isJitteringEnabled"), @"jitteringEnabled");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView isTemporalAntialiasingEnabled](self, "isTemporalAntialiasingEnabled"), @"temporalAntialiasingEnabled");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView allowsCameraControl](self, "allowsCameraControl"), @"allowsCameraControl");
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNView backgroundColor](self, "backgroundColor"), @"backgroundColor");
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNView _ibSceneName](self, "_ibSceneName"), @"ibSceneName");
  objc_msgSend(a3, "encodeBool:forKey:", -[SCNView _ibWantsMultisampling](self, "_ibWantsMultisampling"), @"ibWantsMultisampling");
  objc_msgSend(a3, "encodeInteger:forKey:", -[SCNView _ibPreferredRenderingAPI](self, "_ibPreferredRenderingAPI"), @"ibPreferredRenderingAPI");
}

- (void)dealloc
{
  *((unsigned char *)self + 456) |= 0x10u;
  *((unsigned char *)self + 456) |= 0x40u;
  [(SCNView *)self _flushDisplayLink];
  [(SCNView *)self scn_setGestureRecognizers:0];
  if ((SCNView *)gCurrentSCNViewFocusEnvironment == self) {
    gCurrentSCNViewFocusEnvironment = 0;
  }
  [(SCNDisplayLink *)self->_displayLink invalidate];

  self->_displayLink = 0;
  [(SCNJitterer *)self->_jitterer delegateWillDie];

  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(SCNEventHandler *)self->_navigationCameraController sceneWillChange];
  [(SCNEventHandler *)self->_navigationCameraController setDelegate:0];

  [(SCNScene *)self->_scene removeObserver:self forKeyPath:@"background.contents"];
  v3.receiver = self;
  v3.super_class = (Class)SCNView;
  [(SCNView *)&v3 dealloc];
}

- (void)setHidden:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNView;
  -[SCNView setHidden:](&v5, sel_setHidden_);
  self->_isHidden = a3;
}

- (void)presentScene:(id)a3 withTransition:(id)a4 incomingPointOfView:(id)a5 completionHandler:(id)a6
{
  id v11 = self->_scene;
  uint64_t v12 = [(SCNView *)self pointOfView];
  [(SCNView *)self lock];
  +[SCNTransaction begin];
  +[SCNTransaction setAnimationDuration:0.0];
  +[SCNTransaction setImmediateMode:1];
  [(SCNView *)self setScene:a3];
  [(SCNView *)self setPointOfView:a5];
  if (a4) {
    [(SCNRenderer *)self->_renderer _prepareForTransition:a4 outgoingScene:v11 outgoingPointOfView:v12 completionHandler:a6];
  }
  +[SCNTransaction commit];
  [(SCNView *)self unlock];
}

- (BOOL)skipFramesIfNoDrawableAvailable
{
  return self->_skipFramesIfNoDrawableAvailable;
}

- (void)setSkipFramesIfNoDrawableAvailable:(BOOL)a3
{
  self->_skipFramesIfNoDrawableAvailable = a3;
}

- (void)set_superSamplingFactor:(double)a3
{
}

- (double)_superSamplingFactor
{
  [(SCNRenderer *)self->_renderer _superSamplingFactor];
  return result;
}

- (void)set_screenTransform:(SCNMatrix4 *)a3
{
  long long v3 = *(_OWORD *)&a3->m21;
  v5[0] = *(_OWORD *)&a3->m11;
  v5[1] = v3;
  long long v4 = *(_OWORD *)&a3->m41;
  v5[2] = *(_OWORD *)&a3->m31;
  v5[3] = v4;
  [(SCNRenderer *)self->_renderer set_screenTransform:v5];
}

- (SCNMatrix4)_screenTransform
{
  double result = (SCNMatrix4 *)self->_renderer;
  if (result) {
    return (SCNMatrix4 *)[(SCNMatrix4 *)result _screenTransform];
  }
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  return result;
}

- (void)set_renderOptions:(unint64_t)a3
{
  int v3 = a3;
  int valuePtr = a3;
  objc_super v5 = [(SCNRenderer *)self->_renderer _engineContext];
  uint64_t v6 = (uint64_t)v5;
  if (v3)
  {
    CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    C3DEngineContextSetRenderingOptionForKey(v6, @"debugRendering", v7);
    CFRelease(v7);
  }
  else
  {
    C3DEngineContextSetRenderingOptionForKey((uint64_t)v5, @"debugRendering", 0);
  }
  [(SCNView *)self _setNeedsDisplay];
}

- (unint64_t)_renderOptions
{
  unint64_t result = (unint64_t)C3DEngineContextGetRenderingOptionForKey((uint64_t)[(SCNRenderer *)self->_renderer _engineContext], @"debugRendering");
  if (result)
  {
    int valuePtr = 0;
    CFNumberGetValue((CFNumberRef)result, kCFNumberSInt32Type, &valuePtr);
    return valuePtr;
  }
  return result;
}

- (BOOL)isJitteringEnabled
{
  return [(SCNJitterer *)self->_jitterer isEnabled];
}

- (BOOL)isTemporalAntialiasingEnabled
{
  return [(SCNRenderer *)self->_renderer isTemporalAntialiasingEnabled];
}

- (void)setTemporalAntialiasingEnabled:(BOOL)a3
{
}

- (void)_jitterRedisplay
{
}

- (BOOL)_supportsJitteringSyncRedraw
{
  return [(SCNView *)self layer] == 0;
}

- (BOOL)drawableResizesAsynchronously
{
  return 0;
}

- (BOOL)scn_inLiveResize
{
  return 0;
}

- (id)_renderingQueue
{
  return [(SCNRenderer *)self->_renderer _renderingQueue];
}

- (void)updateAtTime:(double)a3
{
}

- (void)_updateContentsScaleFactor
{
  [(SCNView *)self contentScaleFactor];
  renderer = self->_renderer;

  -[SCNRenderer _setContentsScaleFactor:](renderer, "_setContentsScaleFactor:");
}

- (CGSize)backingSizeForBoundSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SCNView *)self contentScaleFactor];
  double v7 = width * v6;
  [(SCNView *)self contentScaleFactor];
  double v9 = height * v8;
  double v10 = v7;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (CGSize)_updateBackingSize
{
  [(SCNView *)self lock];
  [(SCNView *)self _updateContentsScaleFactor];
  [(SCNView *)self bounds];
  self->_boundsSize.double width = v3;
  self->_boundsSize.double height = v4;
  -[SCNView backingSizeForBoundSize:](self, "backingSizeForBoundSize:", v3, v4);
  double v6 = v5;
  double v8 = v7;
  -[SCNRenderer _setBackingSize:](self->_renderer, "_setBackingSize:");
  *(float *)&double v9 = v6;
  *(float *)&double v10 = v8;
  -[SCNRenderer set_viewport:](self->_renderer, "set_viewport:", 0.0, 0.0, v9, v10);
  [(SCNView *)self unlock];
  double v11 = v6;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)_drawAtTime:(double)a3
{
  if ((*((unsigned char *)self + 456) & 0x40) != 0 || (*((unsigned char *)self + 456) & 0x10) != 0)
  {
    if ((*((unsigned char *)self + 456) & 0x20) == 0) {
      return;
    }
    *((unsigned char *)self + 456) &= ~0x20u;
  }
  if ([(SCNRenderer *)self->_renderer _installContext]
    && (self->_renderingAPI
     || !self->_skipFramesIfNoDrawableAvailable && ![(id)objc_opt_class() lowLatency]
     || [(CALayer *)self->_backingLayer isDrawableAvailable]))
  {
    self->_didTriggerRedrawWhileRendering = 0;
    [(SCNJitterer *)self->_jitterer stopIfNeeded];
    [(SCNRenderer *)self->_renderer _displayLinkStatsTick];
    [(SCNView *)self lock];
    [(SCNRenderer *)self->_renderer _backingSize];
    if (v6 == 0.0 || v5 == 0.0)
    {
      [(SCNView *)self unlock];
    }
    else
    {
      [(SCNEventHandler *)self->_navigationCameraController viewWillDrawAtTime:CACurrentMediaTime()];
      double v7 = (void *)MEMORY[0x210535ED0]([(SCNRenderer *)self->_renderer lock]);
      [(SCNRenderer *)self->_renderer _beginFrame];
      [(SCNRenderer *)self->_renderer _getFrameIndex];
      kdebug_trace();
      +[SCNTransaction lock];
      CFTimeInterval currentSystemTime = CACurrentMediaTime();
      if (a3 != 0.0) {
        CFTimeInterval currentSystemTime = a3;
      }
      self->_CFTimeInterval currentSystemTime = currentSystemTime;
      if (self->_renderingAPI)
      {
        glPushGroupMarkerEXT(0, "SceneKit - SCNView Draw");
        CFTimeInterval currentSystemTime = self->_currentSystemTime;
      }
      [(SCNRenderer *)self->_renderer _drawAtTime:currentSystemTime];
      if (self->_renderingAPI) {
        glPopGroupMarkerEXT();
      }
      [(SCNRenderer *)self->_renderer _presentFramebuffer];
      +[SCNTransaction unlock];
      [(SCNRenderer *)self->_renderer _nextFrameTime];
      double v10 = v9;
      double v11 = CACurrentMediaTime();
      [(SCNRenderer *)self->_renderer unlock];
      kdebug_trace();
      [(SCNEventHandler *)self->_navigationCameraController viewDidDrawAtTime:self->_currentSystemTime];
      if ([(SCNView *)self _checkAndUpdateDisplayLinkStateIfNeeded])
      {
        if (![(SCNView *)self isPlaying])
        {
          double v12 = v10 - v11;
          if (v10 - v11 > 2.0) {
            [(SCNJitterer *)self->_jitterer restart];
          }
        }
      }
      [(SCNView *)self unlock];
      renderer = self->_renderer;
      [(SCNRenderer *)renderer _displayLinkStatsTack];
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SCNView;
  [(SCNView *)&v3 layoutSubviews];
  [(SCNView *)self _updateBackingSize];
  [(SCNView *)self _setNeedsDisplay];
}

- (void)setPointOfView:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  +[SCNTransaction begin];
  double v7 = 0.0;
  if (v4) {
    double v7 = 0.75;
  }
  +[SCNTransaction setAnimationDuration:v7];
  [(SCNView *)self setPointOfView:a3];

  +[SCNTransaction commit];
}

- (CGRect)currentViewport
{
  [(SCNRenderer *)self->_renderer currentViewport];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setPointOfCulling:(id)a3
{
  if ([(SCNView *)self pointOfCulling] != a3)
  {
    renderer = self->_renderer;
    [(SCNRenderer *)renderer setPointOfCulling:a3];
  }
}

- (id)pointOfCulling
{
  return [(SCNRenderer *)self->_renderer pointOfCulling];
}

- (AVAudioEngine)audioEngine
{
  return [(SCNRenderer *)self->_renderer audioEngine];
}

- (AVAudioEnvironmentNode)audioEnvironmentNode
{
  return [(SCNRenderer *)self->_renderer audioEnvironmentNode];
}

- (SCNNode)audioListener
{
  return [(SCNRenderer *)self->_renderer audioListener];
}

- (void)setAudioListener:(id)a3
{
}

- (void)setTechnique:(id)a3
{
}

- (SCNTechnique)technique
{
  return [(SCNRenderer *)self->_renderer technique];
}

- (void)setAllowsCameraControl:(BOOL)allowsCameraControl
{
  uint64_t v4 = C3DPreferencesGetBool(3) | allowsCameraControl;
  if (v4 != [(SCNEventHandler *)self->_navigationCameraController enabled])
  {
    navigationCameraController = self->_navigationCameraController;
    [(SCNEventHandler *)navigationCameraController setEnabled:v4];
  }
}

- (BOOL)allowsCameraControl
{
  return [(SCNEventHandler *)self->_navigationCameraController enabled];
}

- (SCNCameraController)defaultCameraController
{
  id v2 = [(SCNView *)self navigationCameraController];

  return (SCNCameraController *)[v2 cameraController];
}

- (BOOL)loops
{
  return [(SCNRenderer *)self->_renderer loops];
}

- (void)setLoops:(BOOL)a3
{
}

- (BOOL)isPlaying
{
  return [(SCNRenderer *)self->_renderer isPlaying];
}

- (void)setPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SCNView *)self isPlaying] != a3)
  {
    [(SCNRenderer *)self->_renderer setPlaying:v3];
    if (v3)
    {
      id v5 = [(SCNView *)self displayLink];
      [v5 setPaused:0];
    }
    else
    {
      [(SCNRenderer *)self->_renderer _nextFrameTime];
      if (v6 - CACurrentMediaTime() > 2.0 && (*((unsigned char *)self + 456) & 2) == 0)
      {
        jitterer = self->_jitterer;
        [(SCNJitterer *)jitterer restart];
      }
    }
  }
}

- (BOOL)rendersContinuously
{
  return (*((unsigned __int8 *)self + 456) >> 1) & 1;
}

- (void)setRendersContinuously:(BOOL)rendersContinuously
{
  char v3 = *((unsigned char *)self + 456);
  if (((((v3 & 2) == 0) ^ rendersContinuously) & 1) == 0)
  {
    if (rendersContinuously) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 456) = v3 & 0xFD | v5;
    -[SCNRenderer setRendersContinuously:](self->_renderer, "setRendersContinuously:");
    if ((*((unsigned char *)self + 456) & 2) != 0)
    {
      id v8 = [(SCNView *)self displayLink];
      [v8 setPaused:0];
    }
    else
    {
      [(SCNRenderer *)self->_renderer _nextFrameTime];
      if (v6 - CACurrentMediaTime() > 2.0 && ![(SCNView *)self isPlaying])
      {
        jitterer = self->_jitterer;
        [(SCNJitterer *)jitterer restart];
      }
    }
  }
}

- (void)play:(id)sender
{
}

- (void)pause:(id)sender
{
}

- (void)stop:(id)sender
{
  [(SCNView *)self setPlaying:0];
  [(SCNRenderer *)self->_renderer _stop];

  [(SCNView *)self _setNeedsDisplay];
}

- (double)_flipY:(double)a3
{
  return self->_boundsSize.height - a3;
}

- (SCNVector4)_viewport
{
  float width = self->_boundsSize.width;
  float height = self->_boundsSize.height;
  float v4 = 0.0;
  float v5 = 0.0;
  result.w = height;
  result.z = width;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  double x = a3.x;
  [(SCNView *)self _flipY:a3.y];
  renderer = self->_renderer;
  double width = self->_boundsSize.width;
  double height = self->_boundsSize.height;

  return -[SCNRenderer _hitTest:viewport:options:](renderer, "_hitTest:viewport:options:", a4, x, v7, width, height);
}

- (id)hitTestWithSegmentFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 options:(id)a5
{
  return -[SCNRenderer hitTestWithSegmentFromPoint:toPoint:options:](self->_renderer, "hitTestWithSegmentFromPoint:toPoint:options:", a5, *(double *)&a3.x, *(double *)&a3.y, *(double *)&a3.z, *(double *)&a4.x, *(double *)&a4.y, *(double *)&a4.z);
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  renderer = self->_renderer;
  [(SCNView *)self _viewport];

  return -[SCNRenderer _isNodeInsideFrustum:withPointOfView:viewport:](renderer, "_isNodeInsideFrustum:withPointOfView:viewport:", a3, a4);
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  renderer = self->_renderer;
  [(SCNView *)self _viewport];

  return -[SCNRenderer _nodesInsideFrustumWithPointOfView:viewport:](renderer, "_nodesInsideFrustumWithPointOfView:viewport:", a3);
}

- (SCNVector3)projectPoint:(SCNVector3)a3
{
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  renderer = self->_renderer;
  [(SCNView *)self _viewport];
  int v9 = v8;
  int v11 = v10;
  int v13 = v12;
  int v15 = v14;
  *(float *)&double v16 = x;
  *(float *)&double v17 = y;
  *(float *)&double v18 = z;
  LODWORD(v19) = v9;
  LODWORD(v20) = v11;
  LODWORD(v21) = v13;
  LODWORD(v22) = v15;
  -[SCNRenderer _projectPoint:viewport:](renderer, "_projectPoint:viewport:", v16, v17, v18, v19, v20, v21, v22);
  float v24 = v23;
  float v26 = v25;
  [(SCNView *)self _flipY:v27];
  float v29 = v28;
  float v30 = v24;
  float v31 = v26;
  result.float z = v31;
  result.float y = v29;
  result.float x = v30;
  return result;
}

- (SCNVector3)unprojectPoint:(SCNVector3)a3
{
  float z = a3.z;
  float x = a3.x;
  [(SCNView *)self _flipY:a3.y];
  float v7 = v6;
  renderer = self->_renderer;
  [(SCNView *)self _viewport];
  LODWORD(v14) = LODWORD(v10);
  LODWORD(v15) = LODWORD(v11);
  LODWORD(v16) = LODWORD(v12);
  int v9 = LODWORD(v13);
  *(float *)&double v10 = x;
  *(float *)&double v11 = v7;
  *(float *)&double v12 = z;
  LODWORD(v13) = LODWORD(v14);
  LODWORD(v14) = LODWORD(v15);
  LODWORD(v15) = LODWORD(v16);
  LODWORD(v16) = v9;

  -[SCNRenderer _unprojectPoint:viewport:](renderer, "_unprojectPoint:viewport:", v10, v11, v12, v13, v14, v15, v16);
  result.float z = v19;
  result.float y = v18;
  result.float x = v17;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"kSCNViewObservingContext")
  {
    if (objc_msgSend(a3, "isEqualToString:", @"background.contents", a4, a5))
    {
      [(SCNView *)self _updateOpacity];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNView;
    -[SCNView observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

+ (id)_kvoKeysForwardedToRenderer
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"pointOfView", @"sceneTime", @"playing", @"loops", @"autoenablesDefaultLighting", @"jitteringEnabled", @"temporalAntialiasingEnabled", @"technique", 0);
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SCNView;
  id v5 = objc_msgSendSuper2(&v7, sel_keyPathsForValuesAffectingValueForKey_);
  if (objc_msgSend((id)objc_msgSend(a1, "_kvoKeysForwardedToRenderer"), "containsObject:", a3)) {
    return (id)[(id)objc_msgSend(MEMORY[0x263EFFA08] setWithObject:objc_msgSend(NSString, "stringWithFormat:", @"renderer.%@", a3)), "setByAddingObjectsFromSet:", v5];
  }
  return v5;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a1, "_kvoKeysForwardedToRenderer"), "containsObject:", a3)) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SCNView;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (void)setDelegate:(id)a3
{
}

- (SCNSceneRendererDelegate)delegate
{
  return [(SCNRenderer *)self->_renderer delegate];
}

- (void)setEventHandler:(id)a3
{
  -[SCNView setNavigationCameraController:](self, "setNavigationCameraController:");
  [a3 setView:self];

  [(SCNView *)self setAllowsCameraControl:1];
}

- (id)eventHandler
{
  return self->_navigationCameraController;
}

- (void)eventHandlerWantsRedraw
{
  id v2 = [(SCNView *)self displayLink];

  [v2 setPaused:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNView;
  -[SCNView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_);
  id v5 = (void *)[(SCNView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:a3])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__SCNView_traitCollectionDidChange___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = v5;
    v6[5] = self;
    +[SCNTransaction postCommandWithContext:0 object:self applyBlock:v6];
  }
}

uint64_t __36__SCNView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__SCNView_traitCollectionDidChange___block_invoke_2;
  v4[3] = &unk_264004DF8;
  void v4[4] = *(void *)(a1 + 40);
  [v2 performAsCurrentTraitCollection:v4];
  *(unsigned char *)(*(void *)(a1 + 40) + 456) |= 0x20u;
  return [*(id *)(a1 + 40) _setNeedsDisplay];
}

uint64_t __36__SCNView_traitCollectionDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) resolvedBackgroundColorDidChange];
}

- (double)sceneTime
{
  [(SCNRenderer *)self->_renderer sceneTime];
  return result;
}

- (void)setSceneTime:(double)a3
{
  [(SCNRenderer *)self->_renderer setSceneTime:a3];

  [(SCNView *)self _setNeedsDisplay];
}

- (BOOL)autoenablesDefaultLighting
{
  return [(SCNRenderer *)self->_renderer autoenablesDefaultLighting];
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  [(SCNRenderer *)self->_renderer setAutoenablesDefaultLighting:a3];

  [(SCNView *)self _setNeedsDisplay];
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  return [(SCNRenderer *)self->_renderer currentRenderPassDescriptor];
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  return [(SCNRenderer *)self->_renderer currentRenderCommandEncoder];
}

- (MTLDevice)device
{
  return [(SCNRenderer *)self->_renderer device];
}

- (MTLCommandQueue)commandQueue
{
  return [(SCNRenderer *)self->_renderer commandQueue];
}

- (unint64_t)colorPixelFormat
{
  return [(SCNRenderer *)self->_renderer colorPixelFormat];
}

- (unint64_t)depthPixelFormat
{
  return [(SCNRenderer *)self->_renderer depthPixelFormat];
}

- (unint64_t)stencilPixelFormat
{
  return [(SCNRenderer *)self->_renderer stencilPixelFormat];
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
  [(SCNRenderer *)self->_renderer setContext:[(SCNView *)self context]];
  renderer = self->_renderer;

  [(SCNRenderer *)renderer prepareObjects:a3 withCompletionHandler:a4];
}

- (SKScene)overlaySKScene
{
  return [(SCNRenderer *)self->_renderer overlaySKScene];
}

- (void)setOverlaySKScene:(id)a3
{
  [[(SCNView *)self overlaySKScene] willMoveFromView:self];
  [(SCNRenderer *)self->_renderer setOverlaySKScene:a3];
  if (a3)
  {
    [a3 _didMoveToView:self];
    spriteKitEventHandler = self->_spriteKitEventHandler;
    if (!spriteKitEventHandler)
    {
      spriteKitEventHandler = objc_alloc_init(SCNSpriteKitEventHandler);
      self->_spriteKitEventHandler = spriteKitEventHandler;
    }
    [(SCNSpriteKitEventHandler *)spriteKitEventHandler setScene:a3];
  }
  else
  {
    objc_super v6 = self->_spriteKitEventHandler;
    if (v6)
    {

      self->_spriteKitEventHandler = 0;
    }
  }

  [(SCNView *)self _setNeedsDisplay];
}

- (BOOL)_wantsSceneRendererDelegationMessages
{
  return [(SCNRenderer *)self->_renderer _shouldForwardSceneRendererDelegationMessagesToPrivateRendererOwner];
}

- (void)set_wantsSceneRendererDelegationMessages:(BOOL)a3
{
}

- (id)_resourceManagerMonitor
{
  return [(SCNRenderer *)self->_renderer _resourceManagerMonitor];
}

- (void)set_resourceManagerMonitor:(id)a3
{
}

- (id)_commandBufferStatusMonitor
{
  return [(SCNRenderer *)self->_renderer _commandBufferStatusMonitor];
}

- (void)set_commandBufferStatusMonitor:(id)a3
{
}

- (id)displayLink
{
  return self->_displayLink;
}

- (BOOL)_checkAndUpdateDisplayLinkStateIfNeeded
{
  if (!self->_displayLink) {
    return 0;
  }
  if ((*((unsigned char *)self + 456) & 2) != 0
    || [(SCNView *)self isPlaying]
    || self->_didTriggerRedrawWhileRendering)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = objc_msgSend(-[SCNView eventHandler](self, "eventHandler"), "wantsRedraw") ^ 1;
  }
  displayLink = self->_displayLink;
  [(SCNRenderer *)self->_renderer _nextFrameTime];

  return -[SCNDisplayLink setPaused:nextFrameTimeHint:lastUpdate:](displayLink, "setPaused:nextFrameTimeHint:lastUpdate:", v3);
}

- (NSInteger)preferredFramesPerSecond
{
  id v3 = [(SCNView *)self displayLink];
  if (v3) {
    [v3 preferredFrameRate];
  }
  else {
    return (uint64_t)(float)self->_preferredFramePerSeconds;
  }
  return (uint64_t)v4;
}

- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond
{
  id v5 = [(SCNView *)self displayLink];
  if (v5)
  {
    *(float *)&double v6 = (float)preferredFramesPerSecond;
    [v5 setPreferredFrameRate:v6];
  }
  self->_preferredFramePerSeconds = preferredFramesPerSecond;
  uint64_t v7 = objc_msgSend(-[SCNView renderer](self, "renderer"), "_renderContextMetal");

  -[SCNMTLRenderContext setPreferredFramesPerSecond:](v7, preferredFramesPerSecond);
}

uint64_t __27__SCNView__setNeedsDisplay__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 496) isPaused];
  if (result)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 496);
    return [v3 setNeedsDisplay];
  }
  return result;
}

- (BOOL)usesReverseZ
{
  return [(SCNRenderer *)self->_renderer usesReverseZ];
}

- (void)setUsesReverseZ:(BOOL)a3
{
}

- (void)_systemTimeAnimationStarted:(id)a3
{
  id v3 = [(SCNView *)self displayLink];

  [v3 setPaused:0];
}

- (void)setShowsStatistics:(BOOL)a3
{
  [(SCNRenderer *)self->_renderer setShowsStatistics:C3DPreferencesGetBool(2) | a3];

  [(SCNView *)self _setNeedsDisplay];
}

- (BOOL)showsStatistics
{
  return [(SCNRenderer *)self->_renderer showsStatistics];
}

- (UIImage)snapshot
{
  double width = self->_boundsSize.width;
  double height = self->_boundsSize.height;
  [(SCNView *)self contentScaleFactor];
  double v6 = width * v5;
  [(SCNView *)self contentScaleFactor];
  double v8 = height * v7;
  renderer = self->_renderer;
  [(SCNRenderer *)renderer _systemTime];
  double v11 = v10;
  SCNAntialiasingMode v12 = [(SCNView *)self antialiasingMode];

  return -[SCNRenderer snapshotAtTime:withSize:antialiasingMode:](renderer, "snapshotAtTime:withSize:antialiasingMode:", v12, v11, v6, v8);
}

- (NSString)description
{
  [(SCNView *)self frame];
  id v3 = NSStringFromCGRect(v10);
  float v4 = NSString;
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  double v7 = [(SCNView *)self scene];
  [(SCNView *)self sceneTime];
  return (NSString *)[v4 stringWithFormat:@"<%@: %p | scene=%@ sceneTime=%f frame=%@ pointOfView=%@>", v6, self, v7, v8, v3, -[SCNView pointOfView](self, "pointOfView")];
}

- (BOOL)_isEditor
{
  return 0;
}

- (void)switchToCameraNamed:(id)a3
{
  double v5 = [(SCNNode *)[(SCNScene *)[(SCNView *)self scene] rootNode] childNodeWithName:a3 recursively:1];
  if (v5)
  {
    [(SCNView *)self setPointOfView:v5 animate:1];
  }
  else
  {
    double v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNView switchToCameraNamed:]((uint64_t)a3, v6);
    }
  }
}

- (void)switchToNextCamera
{
  id v3 = [(SCNNode *)[(SCNScene *)[(SCNView *)self scene] rootNode] childNodesPassingTest:&__block_literal_global_99];
  if ([(NSArray *)v3 count])
  {
    uint64_t v4 = [(NSArray *)v3 indexOfObject:[(SCNRenderer *)self->_renderer pointOfView]];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v5 = [(NSArray *)v3 firstObject];
    }
    else {
      uint64_t v5 = [(NSArray *)v3 objectAtIndex:(v4 + 1) % [(NSArray *)v3 count]];
    }
    [(SCNView *)self setPointOfView:v5 animate:1];
  }
}

BOOL __29__SCNView_switchToNextCamera__block_invoke(uint64_t a1, void *a2)
{
  return [a2 camera] != 0;
}

- (BOOL)_disableLinearRendering
{
  return (*((unsigned __int8 *)self + 457) >> 1) & 1;
}

- (void)set_disableLinearRendering:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 457) = *((unsigned char *)self + 457) & 0xFD | v3;
  [(SCNView *)self _adjustBackingLayerPixelFormat];
}

- (BOOL)_enableARMode
{
  return [(SCNRenderer *)self->_renderer _enableARMode];
}

- (void)set_enableARMode:(BOOL)a3
{
}

- (BOOL)_shouldDelegateARCompositing
{
  return [(SCNRenderer *)self->_renderer _enableARMode];
}

- (void)set_shouldDelegateARCompositing:(BOOL)a3
{
}

- (void)_updateProbes:(id)a3 withProgress:(id)a4
{
}

- (void)setDebugOptions:(unint64_t)a3
{
  [(SCNRenderer *)self->_renderer setDebugOptions:a3];

  [(SCNView *)self _setNeedsDisplay];
}

- (unint64_t)debugOptions
{
  return [(SCNRenderer *)self->_renderer debugOptions];
}

- (BOOL)_showsAuthoringEnvironment
{
  return [(SCNRenderer *)self->_renderer _showsAuthoringEnvironment];
}

- (void)set_showsAuthoringEnvironment:(BOOL)a3
{
}

- (id)_authoringEnvironment
{
  return [(SCNRenderer *)self->_renderer _authoringEnvironment];
}

- (SCNAntialiasingMode)antialiasingMode
{
  return [(SCNRenderer *)self->_renderer _antialiasingMode];
}

- (id)_ibSceneName
{
  return self->__ibSceneName;
}

- (void)set_ibSceneName:(id)a3
{
  uint64_t v5 = self->__ibSceneName;
  self->__ibSceneName = (NSString *)[a3 copy];
}

- (BOOL)_ibWantsMultisampling
{
  return !C3DPreferencesGetBool(5) && (*((unsigned char *)self + 440) & 1) == 0;
}

- (void)set_ibWantsMultisampling:(BOOL)a3
{
  *((unsigned char *)self + 440) = *((unsigned char *)self + 440) & 0xFE | !a3;
}

- (int)_ibPreferredRenderingAPI
{
  return self->__ibPreferredRenderingAPI;
}

- (void)set_ibPreferredRenderingAPI:(int)a3
{
  self->__ibPreferredRenderingAPI = a3;
}

- (unint64_t)renderingAPI
{
  return self->_renderingAPI;
}

- (CGColorSpace)workingColorSpace
{
  return [(SCNRenderer *)self->_renderer workingColorSpace];
}

- (double)_runFPSTestWithDuration:(double)a3
{
  uint64_t v9 = 0;
  CGRect v10 = (float *)&v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  if (self->_renderingAPI) {
    [(SCNView *)self context];
  }
  uint64_t v5 = [(SCNRenderer *)self->_renderer _renderingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SCNView__runFPSTestWithDuration___block_invoke;
  block[3] = &unk_2640098C0;
  *(double *)&block[6] = a3;
  void block[4] = self;
  void block[5] = &v9;
  dispatch_sync(v5, block);
  double v6 = v10[6];
  _Block_object_dispose(&v9, 8);
  return v6;
}

float __35__SCNView__runFPSTestWithDuration___block_invoke(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = Current - Current;
  double v4 = 0.0;
  if (Current - Current < *(double *)(a1 + 48))
  {
    int v5 = 0;
    do
    {
      double v6 = (void *)MEMORY[0x210535ED0]();
      [*(id *)(a1 + 32) _drawAtTime:0.0];
      ++v5;
      double v3 = CFAbsoluteTimeGetCurrent() - Current;
    }
    while (v3 < *(double *)(a1 + 48));
    double v4 = (double)v5;
  }
  float result = v4 / v3;
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_addGPUFrameScheduledHandler:(id)a3
{
}

- (void)_addGPUFrameCompletedHandler:(id)a3
{
}

- (void)_addGPUFramePresentedHandler:(id)a3
{
}

- (void)_discardPendingGPUFrameScheduledHandlers
{
}

- (void)_discardPendingGPUFrameCompletedHandlers
{
}

- (void)_discardPendingGPUFramePresentedHandlers
{
}

- (void)_allowGPUBackgroundExecution
{
}

- (EAGLContext)eaglContext
{
  return (EAGLContext *)[(SCNRenderer *)self->_renderer context];
}

- (void)setEaglContext:(EAGLContext *)eaglContext
{
}

- (void)displayLayer:(id)a3
{
  if (self->_renderingAPI)
  {
    double v4 = [(SCNRenderer *)self->_renderer _renderingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __24__SCNView_displayLayer___block_invoke;
    block[3] = &unk_264004DF8;
    void block[4] = self;
    dispatch_sync(v4, block);
  }
}

uint64_t __24__SCNView_displayLayer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _drawAtTime:0.0];
}

- (void)drawRect:(CGRect)a3
{
  if (self->_renderingAPI || (*((unsigned char *)self + 456) & 4) == 0)
  {
    double v4 = [(SCNRenderer *)self->_renderer _renderingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __20__SCNView_drawRect___block_invoke;
    block[3] = &unk_264004DF8;
    void block[4] = self;
    dispatch_sync(v4, block);
  }
}

uint64_t __20__SCNView_drawRect___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 456) |= 4u;
  return [*(id *)(a1 + 32) _drawAtTime:0.0];
}

- (BOOL)_controlsOwnScaleFactor
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (SCNContainsUIKitViews())
  {
    id v8 = -[SCNView hitTest:options:](self, "hitTest:options:", 0, x, y);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          double v14 = objc_msgSend((id)objc_msgSend(v13, "node"), "geometry");
          double v15 = objc_msgSend((id)objc_msgSend(v14, "materials"), "count");
          if (v15) {
            double v15 = objc_msgSend((id)objc_msgSend(v14, "materials"), "objectAtIndexedSubscript:", objc_msgSend(v13, "geometryIndex")% (unint64_t)objc_msgSend((id)objc_msgSend(v14, "materials"), "count"));
          }
          objc_msgSend((id)objc_msgSend(v15, "diffuse"), "contents");
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            SCNUIKitSourceSetCurrentViewEvent(self);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SCNView;
  return -[SCNView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, a4, x, y);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (![(SCNView *)self showsStatistics]
    || (objc_msgSend((id)objc_msgSend(a3, "anyObject"), "locationInView:", self),
        double v8 = v7,
        double v10 = v9,
        [(SCNView *)self bounds],
        (objc_msgSend(-[SCNView _authoringEnvironment](self, "_authoringEnvironment"), "didTapAtPoint:", v8, v11 - v10) & 1) == 0))
  {
    if (![(SCNSpriteKitEventHandler *)self->_spriteKitEventHandler touchesBegan:a3 withEvent:a4])
    {
      v12.receiver = self;
      v12.super_class = (Class)SCNView;
      [(SCNView *)&v12 touchesBegan:a3 withEvent:a4];
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (!-[SCNSpriteKitEventHandler touchesMoved:withEvent:](self->_spriteKitEventHandler, "touchesMoved:withEvent:"))
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNView;
    [(SCNView *)&v7 touchesMoved:a3 withEvent:a4];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (!-[SCNSpriteKitEventHandler touchesEnded:withEvent:](self->_spriteKitEventHandler, "touchesEnded:withEvent:"))
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNView;
    [(SCNView *)&v7 touchesEnded:a3 withEvent:a4];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (!-[SCNSpriteKitEventHandler touchesCancelled:withEvent:](self->_spriteKitEventHandler, "touchesCancelled:withEvent:"))
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNView;
    [(SCNView *)&v7 touchesCancelled:a3 withEvent:a4];
  }
}

- (void)pauseDisplayLink
{
  [(SCNJitterer *)self->_jitterer stopIfNeeded];
  id v3 = [(SCNView *)self displayLink];

  [v3 setPaused:1];
}

- (void)resumeDisplayLink
{
  [(SCNView *)self _createDisplayLinkIfNeeded];
  id v3 = [(SCNView *)self displayLink];
  if ((*((unsigned char *)self + 456) & 2) != 0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [(SCNView *)self isPlaying] ^ 1;
  }
  [(SCNRenderer *)self->_renderer _nextFrameTime];

  objc_msgSend(v3, "setPaused:nextFrameTimeHint:lastUpdate:", v4);
}

- (void)didMoveToWindow
{
  if ([(SCNView *)self window])
  {
    gCurrentSCNViewFocusEnvironment = (uint64_t)self;
    *((unsigned char *)self + 456) &= ~0x10u;
    [(SCNView *)self resumeDisplayLink];
    [(SCNView *)self _setNeedsDisplay];
  }
  v3.receiver = self;
  v3.super_class = (Class)SCNView;
  [(SCNView *)&v3 didMoveToWindow];
  [(SCNView *)self _adjustBackingLayerPixelFormat];
  [(SCNView *)self _updateBackingSize];
  [(SCNRenderer *)self->_renderer _interfaceOrientationDidChange];
}

- (void)willMoveToWindow:(id)a3
{
  if (!a3)
  {
    SCNUIKitSourceNotifyViewWasRemoved(self);
    [(SCNView *)self pauseDisplayLink];
    *((unsigned char *)self + 456) |= 0x10u;
  }
  v5.receiver = self;
  v5.super_class = (Class)SCNView;
  [(SCNView *)&v5 willMoveToWindow:a3];
}

- (void)_flushDisplayLink
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: display link thread seems stuck", v1, 2u);
}

- (void)_enterBackground:(id)a3
{
  *((unsigned char *)self + 456) |= 0x40u;
  if (![(SCNScene *)[(SCNView *)self scene] isPaused])
  {
    *((unsigned char *)self + 456) |= 0x80u;
    [(SCNScene *)[(SCNView *)self scene] setPaused:1];
  }
  [(SCNView *)self pauseDisplayLink];
  id AudioEngine = C3DAudioManagerGetAudioEngine(0);
  if (AudioEngine) {
    [AudioEngine pause];
  }

  [(SCNView *)self _flushDisplayLink];
}

- (void)safeAreaInsetsDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)SCNView;
  [(SCNView *)&v7 safeAreaInsetsDidChange];
  [(SCNView *)self safeAreaInsets];
  v4.f64[1] = v3;
  v6.f64[1] = v5;
  [(SCNRenderer *)self->_renderer set_drawableSafeAreaInsets:*(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v6), v4).i64];
  [(SCNRenderer *)self->_renderer _interfaceOrientationDidChange];
}

+ (id)_currentSCNViewFocusEnvironment
{
  return (id)gCurrentSCNViewFocusEnvironment;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)SCNView;
  id v8 = -[SCNView focusItemsInRect:](&v12, sel_focusItemsInRect_);
  if ([v8 count]) {
    id v9 = (id)[v8 mutableCopy];
  }
  else {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  }
  double v10 = v9;
  -[SCNNode _appendFocusableNodesInRect:ofView:toFocusItems:]([(SCNScene *)[(SCNView *)self scene] rootNode], "_appendFocusableNodesInRect:ofView:toFocusItems:", self, v9, x, y, width, height);
  return v10;
}

- (int64_t)_preferredFocusMovementStyle
{
  return 2;
}

void __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_1()
{
  __assert_rtn("-[SCNView(SCNDisplayLink) _initializeDisplayLinkWithScreen:policy:completionHandler:]_block_invoke", "SCNDisplayLink_ARC.m", 96, "wg != NULL");
}

void __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_2()
{
  __assert_rtn("-[SCNView(SCNDisplayLink) _initializeDisplayLinkWithScreen:policy:completionHandler:]_block_invoke", "SCNDisplayLink_ARC.m", 99, "ret == 0");
}

void __85__SCNView_SCNDisplayLink___initializeDisplayLinkWithScreen_policy_completionHandler___block_invoke_cold_3()
{
  __assert_rtn("-[SCNView(SCNDisplayLink) _initializeDisplayLinkWithScreen:policy:completionHandler:]_block_invoke", "SCNDisplayLink_ARC.m", 93, "ret == 0");
}

+ (void)deviceForOptions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Failed to create default Metal device.", v1, 2u);
}

- (void)switchToCameraNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: switchToCameraNamed: no camera named %@", (uint8_t *)&v2, 0xCu);
}

@end