@interface SKView
+ (BOOL)supportsSecureCoding;
+ (Class)layerClass;
+ (id)debugHierarchyAdditionalGroupingIDs;
+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (id)debugHierarchyPropertyDescriptions;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (BOOL)_renderUpdateEnabled;
- (BOOL)_shouldRenderForTime:(double)a3;
- (BOOL)_showsCPUStats;
- (BOOL)_showsGPUStats;
- (BOOL)_usesAsyncUpdateQueue;
- (BOOL)allowsTransparency;
- (BOOL)disableDepthStencilBuffer;
- (BOOL)hasValidViewFramebuffer;
- (BOOL)ignoresSiblingOrder;
- (BOOL)isAsynchronous;
- (BOOL)isEqualToView:(id)a3;
- (BOOL)isOpaque;
- (BOOL)isPaused;
- (BOOL)shouldCullNonVisibleNodes;
- (BOOL)showsDrawCount;
- (BOOL)showsFPS;
- (BOOL)showsFields;
- (BOOL)showsNodeCount;
- (BOOL)showsPhysics;
- (BOOL)showsQuadCount;
- (CGPoint)_viewTranslation;
- (CGPoint)convertPoint:(CGPoint)point fromScene:(SKScene *)scene;
- (CGPoint)convertPoint:(CGPoint)point toScene:(SKScene *)scene;
- (CGSize)pixelSize;
- (NSInteger)frameInterval;
- (NSInteger)preferredFramesPerSecond;
- (NSMutableDictionary)_info;
- (NSMutableDictionary)options;
- (NSObject)delegate;
- (SKScene)scene;
- (SKTexture)textureFromNode:(SKNode *)node;
- (SKTexture)textureFromNode:(SKNode *)node crop:(CGRect)crop;
- (SKView)initWithCoder:(id)a3;
- (SKView)initWithFrame:(CGRect)a3;
- (double)_fps;
- (double)_viewScale;
- (double)alphaValue;
- (double)getViewTransform;
- (double)getViewport;
- (double)physicsDebugStrokeWidth;
- (float)_getViewContentsScale;
- (float)preferredFrameRate;
- (id).cxx_construct;
- (id)_getPerformanceStats;
- (id)archiveToFile:(id)a3;
- (id)captureToFile:(id)a3;
- (id)focusItemsInRect:(CGRect)a3;
- (id)getRenderOptions;
- (id)snapshot;
- (id)textureFromNode:(id)a3 withOptions:(id)a4;
- (int)_spriteRenderCount;
- (int)_spriteSubmitCount;
- (int64_t)_preferredFocusMovementStyle;
- (shared_ptr<jet_framebuffer>)nextFramebuffer;
- (unint64_t)_getEffectivePreferredFramesPerSecond;
- (void)CBApplicationDidBecomeActive;
- (void)CBApplicationWillResignActive;
- (void)_commonInit;
- (void)_dispatchRenderToIOSurfaceID:(unsigned int)a3 async:(BOOL)a4 onQueue:(id)a5 waitOnFence:(BOOL)a6 preRender:(id)a7 postRender:(id)a8;
- (void)_endFrameStats;
- (void)_ensureRenderer;
- (void)_layerBackedRenderer;
- (void)_renderSynchronouslyForTime:(double)a3 preRender:(id)a4 postRender:(id)a5;
- (void)_renderSynchronouslyForTime:(double)a3 preRender:(id)a4 postRender:(id)a5 withMTLScheduleHandler:(id)a6;
- (void)_renderToIOSurfaceID:(unsigned int)a3 scaleFactor:(float)a4 asynchronous:(BOOL)a5 preRender:(id)a6 postRender:(id)a7;
- (void)_renderToIOSurfaceID:(unsigned int)a3 scaleFactor:(float)a4 asynchronous:(BOOL)a5 waitOnFence:(BOOL)a6 preRender:(id)a7 postRender:(id)a8;
- (void)_reshape;
- (void)_update:(double)a3;
- (void)_vsyncRenderForTime:(double)a3 preRender:(id)a4 postRender:(id)a5;
- (void)chooseViewRenderer;
- (void)dealloc;
- (void)debugPrint;
- (void)didMoveToWindow;
- (void)encodeWithCoder:(id)a3;
- (void)getRootNode;
- (void)layoutSubviews;
- (void)notifyWillRenderContent;
- (void)overrideMetalCommandQueue:(id)a3;
- (void)presentScene:(SKScene *)scene;
- (void)presentScene:(SKScene *)scene transition:(SKTransition *)transition;
- (void)remakeFramebuffer;
- (void)renderForTime:(double)a3 shouldBlock:(BOOL)a4;
- (void)renderToIOSurfaceID:(unsigned int)a3 withScaleFactor:(double)a4;
- (void)setAllowsTransparency:(BOOL)allowsTransparency;
- (void)setAsynchronous:(BOOL)asynchronous;
- (void)setDelegate:(NSObject *)delegate;
- (void)setDisableDepthStencilBuffer:(BOOL)disableDepthStencilBuffer;
- (void)setDynamicRenderBlock:(id)a3;
- (void)setFrameInterval:(NSInteger)frameInterval;
- (void)setIgnoresSiblingOrder:(BOOL)ignoresSiblingOrder;
- (void)setPaused:(BOOL)paused;
- (void)setPhysicsDebugStrokeWidth:(double)a3;
- (void)setPreferredFrameRate:(float)preferredFrameRate;
- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond;
- (void)setShouldCullNonVisibleNodes:(BOOL)shouldCullNonVisibleNodes;
- (void)setShowsDrawCount:(BOOL)showsDrawCount;
- (void)setShowsFPS:(BOOL)showsFPS;
- (void)setShowsFields:(BOOL)showsFields;
- (void)setShowsNodeCount:(BOOL)showsNodeCount;
- (void)setShowsPhysics:(BOOL)showsPhysics;
- (void)setShowsQuadCount:(BOOL)showsQuadCount;
- (void)setUpRenderCallback;
- (void)set_info:(id)a3;
- (void)set_layerBackedRenderer:(void *)a3;
- (void)set_renderUpdateEnabled:(BOOL)a3;
- (void)set_showsCPUStats:(BOOL)a3;
- (void)set_showsGPUStats:(BOOL)a3;
- (void)set_usesAsyncUpdateQueue:(BOOL)a3;
- (void)set_viewScale:(double)a3;
- (void)set_viewTranslation:(CGPoint)a3;
- (void)startRenderCallbacks;
- (void)stopRenderCallbacks;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SKView

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDynamicRenderBlock:(id)a3
{
  uint64_t v4 = MEMORY[0x21052F3F0](a3, a2);
  v5 = *(void **)&self->_checkForDrawables;
  *(void *)&self->_checkForDrawables = v4;
}

- (void)setShouldCullNonVisibleNodes:(BOOL)shouldCullNonVisibleNodes
{
  id v4 = [NSNumber numberWithBool:shouldCullNonVisibleNodes];
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");
}

- (BOOL)shouldCullNonVisibleNodes
{
  v2 = [(NSMapTable *)self->_touchMap objectForKeyedSubscript:@"cullNonVisibleNodes"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIgnoresSiblingOrder:(BOOL)ignoresSiblingOrder
{
  id v4 = [NSNumber numberWithBool:ignoresSiblingOrder];
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");
}

- (void)setDisableDepthStencilBuffer:(BOOL)disableDepthStencilBuffer
{
  id v4 = [NSNumber numberWithBool:disableDepthStencilBuffer];
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");
}

- (BOOL)disableDepthStencilBuffer
{
  v2 = [(NSMapTable *)self->_touchMap valueForKey:@"disableStencilBuffers"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)ignoresSiblingOrder
{
  v2 = [(NSMapTable *)self->_touchMap objectForKeyedSubscript:@"ignoresSiblingOrder"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsFPS:(BOOL)showsFPS
{
  id v4 = [NSNumber numberWithBool:showsFPS];
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");
}

- (BOOL)showsFPS
{
  v2 = [(NSMapTable *)self->_touchMap valueForKey:@"debugDrawStats_FPS"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsPhysics:(BOOL)showsPhysics
{
  id v4 = [NSNumber numberWithBool:showsPhysics];
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");
}

- (BOOL)showsPhysics
{
  v2 = [(NSMapTable *)self->_touchMap valueForKey:@"debugDrawPhysics"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsFields:(BOOL)showsFields
{
  id v4 = [NSNumber numberWithBool:showsFields];
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");
}

- (BOOL)showsFields
{
  v2 = [(NSMapTable *)self->_touchMap objectForKeyedSubscript:@"debugDrawPhysicsFields"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsQuadCount:(BOOL)showsQuadCount
{
  id v4 = [NSNumber numberWithBool:showsQuadCount];
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");
}

- (BOOL)showsQuadCount
{
  v2 = [(NSMapTable *)self->_touchMap objectForKeyedSubscript:@"debugDrawStats_QuadCount"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsNodeCount:(BOOL)showsNodeCount
{
  id v4 = [NSNumber numberWithBool:showsNodeCount];
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");
}

- (BOOL)showsNodeCount
{
  v2 = [(NSMapTable *)self->_touchMap objectForKeyedSubscript:@"debugDrawStats_NodeCount"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsDrawCount:(BOOL)showsDrawCount
{
  id v4 = [NSNumber numberWithBool:showsDrawCount];
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");
}

- (BOOL)showsDrawCount
{
  v2 = [(NSMapTable *)self->_touchMap objectForKeyedSubscript:@"debugDrawStats_DrawCount"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)set_showsGPUStats:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");
}

- (BOOL)_showsGPUStats
{
  v2 = [(NSMapTable *)self->_touchMap objectForKeyedSubscript:@"debugDrawStats_GPU"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)set_showsCPUStats:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[NSMapTable setObject:forKeyedSubscript:](self->_touchMap, "setObject:forKeyedSubscript:");
}

- (BOOL)_showsCPUStats
{
  v2 = [(NSMapTable *)self->_touchMap objectForKeyedSubscript:@"debugDrawStats_CPU"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)archiveToFile:(id)a3
{
  id v4 = a3;
  v5 = [(SKView *)self scene];

  if (v5)
  {
    v6 = [(SKView *)self scene];
    v7 = [v6 _info];

    if (!v7)
    {
      v8 = [MEMORY[0x263EFF9A0] dictionary];
      v9 = [(SKView *)self scene];
      objc_msgSend(v9, "set_info:", v8);
    }
    v10 = [(SKView *)self scene];
    v11 = [v10 _info];
    v12 = [(SKView *)self description];
    [v11 setValue:v12 forKey:@"SKView"];

    v13 = [(SKView *)self scene];
    v14 = [v13 archiveToFile:v4];
  }
  else
  {
    v14 = [NSString stringWithFormat:@"Failed to archive nil scene"];
    NSLog(&stru_26BEEFD70.isa, v14);
  }

  return v14;
}

- (id)captureToFile:(id)a3
{
  id v4 = a3;
  v5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v6 = [v5 objectAtIndex:0];
  if (!v4)
  {
    v7 = [MEMORY[0x263EFF910] date];
    id v4 = [v7 description];
  }
  v8 = [v4 pathExtension];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    uint64_t v10 = [v4 stringByAppendingPathExtension:@"skc"];

    id v4 = (id)v10;
  }
  id v11 = v4;
  v12 = v11;
  if (([v11 isAbsolutePath] & 1) == 0)
  {
    uint64_t v13 = [v6 stringByAppendingPathComponent:v11];

    v12 = (void *)v13;
  }
  v14 = [MEMORY[0x263F08850] defaultManager];
  v15 = [v12 stringByDeletingLastPathComponent];
  [v14 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:0];

  v16 = [(SKView *)self scene];

  if (!v16) {
    goto LABEL_21;
  }
  v17 = [(SKView *)self scene];
  v18 = [v17 _info];

  if (!v18)
  {
    v19 = [MEMORY[0x263EFF9A0] dictionary];
    v20 = [(SKView *)self scene];
    objc_msgSend(v20, "set_info:", v19);
  }
  v21 = [(SKView *)self scene];
  v22 = [v21 _info];
  [v22 setValue:MEMORY[0x263EFFA88] forKey:@"SKCapture"];

  v23 = [(SKView *)self scene];
  v24 = [v23 _info];
  v25 = [(SKView *)self description];
  [v24 setValue:v25 forKey:@"SKView"];

  v26 = [(SKView *)self scene];
  v27 = [v26 _info];
  [(SKView *)self bounds];
  v28 = NSStringFromCGRect(v50);
  [v27 setValue:v28 forKey:@"SKView_Bounds"];

  v29 = [(SKView *)self scene];
  v30 = [v29 _info];
  v31 = SKGetVersionString();
  [v30 setValue:v31 forKey:@"SKVersion"];

  v32 = [(SKView *)self scene];
  v33 = [v32 _info];
  v34 = NSNumber;
  [(SKView *)self _getViewContentsScale];
  v35 = objc_msgSend(v34, "numberWithFloat:");
  [v33 setValue:v35 forKey:@"SKView_ScaleFactor"];

  renderer = self->_renderer;
  if (renderer)
  {
    SKCRenderer::getBackingContext((uint64_t)renderer, &v47);
    int v37 = (*(uint64_t (**)(uint64_t))(*(void *)v47 + 136))(v47);
    if (v48) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v48);
    }
    if (v37)
    {
      if (v37 != 1) {
        goto LABEL_19;
      }
      v38 = [(SKView *)self scene];
      v39 = [v38 _info];
      [v39 setValue:@"Metal" forKey:@"SKView_ContextType"];
    }
    else
    {
      v38 = [(SKView *)self scene];
      v39 = [v38 _info];
      [v39 setValue:@"OpenGL" forKey:@"SKView_ContextType"];
    }
  }
  else
  {
    v38 = [(SKView *)self scene];
    v39 = [v38 _info];
    [v39 setValue:@"None" forKey:@"SKView_ContextType"];
  }

LABEL_19:
  v40 = objc_opt_new();
  v41 = [MEMORY[0x263EFF990] data];
  v42 = (void *)[objc_alloc(MEMORY[0x263F08910]) initForWritingWithMutableData:v41];
  [v42 setDelegate:v40];
  [v42 setRequiresSecureCoding:0];
  uint64_t v43 = [(SKView *)self scene];
  [v42 encodeObject:v43 forKey:*MEMORY[0x263F081D0]];

  [v42 finishEncoding];
  LOBYTE(v43) = [v41 writeToFile:v12 atomically:1];

  if (v43)
  {
    uint64_t v44 = [NSString stringWithFormat:@"Archived %@ to %@", self, v12];
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v44 = [NSString stringWithFormat:@"Failed to archive %@ to %@", self, v12];
LABEL_22:
  v45 = (void *)v44;
  NSLog(&stru_26BEEFD70.isa, v44);

  return v45;
}

- (void)debugPrint
{
  NSLog(&cfstr_DebugprintP.isa, a2, self, self);
  NSLog(&stru_26BEF0670.isa);
  id v3 = [(SKView *)self scene];
  [v3 debugPrint];
}

+ (Class)layerClass
{
  if (SKGetShouldEnableMetal()) {
    jet_isMetalSupported();
  }
  v2 = objc_opt_class();

  return (Class)v2;
}

- (void)remakeFramebuffer
{
  kdebug_trace();
  *(void *)&self->_viewFramebufferPixelSize[5] = 0;
  id v3 = [(SKView *)self chooseViewRenderer];
  if (!v3)
  {
    self->_viewFramebufferIsValid = 0;
    kdebug_trace();
    return;
  }
  uint64_t v4 = (uint64_t)v3;
  if (!self->_framebuffer.__ptr_)
  {
    SKCRenderer::getBackingContext((uint64_t)self->_renderer, &v34);
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)v34 + 112))(v34);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v35, v5);
  }
  v6 = [(SKView *)self window];

  if (!v6)
  {
    v7 = [(SKView *)self getRenderOptions];
    v8 = [v7 objectForKeyedSubscript:@"ingnoreMissingWindow"];
    char v9 = [v8 BOOLValue];

    if ((v9 & 1) == 0)
    {
      self->_viewFramebufferIsValid = 0;
      kdebug_trace();

      return;
    }
  }
  [(SKView *)self _getViewContentsScale];
  float v11 = v10;
  [(SKView *)self bounds];
  double v12 = v11;
  uint64_t v14 = (v13 * v12);
  [(SKView *)self bounds];
  uint64_t v16 = (v15 * v12);
  if (v14 < 2 || v16 <= 1)
  {
    self->_viewFramebufferIsValid = 0;
    kdebug_trace();
    return;
  }
  SKCRenderer::getBackingContext(v4, &v35);
  int v18 = (*(uint64_t (**)(void))(*(void *)v35 + 136))(v35);
  if (*((void *)&v35 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v35 + 1));
  }
  if (v18 == 1) {
    -[CAMetalLayer setDrawableSize:](self->_metalLayer, "setDrawableSize:", (double)v14, (double)v16);
  }
  cntrl = self->_frameBufferDepthStencilTexture.__cntrl_;
  self->_frameBufferDepthStencilTexture.__ptr_ = 0;
  self->_frameBufferDepthStencilTexture.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  if (![(SKView *)self disableDepthStencilBuffer])
  {
    SKCRenderer::getBackingContext((uint64_t)self->_renderer, &v34);
    uint64_t texture_2d = jet_context::create_texture_2d();
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v35, texture_2d);
  }
  SKCRenderer::getBackingContext(v4, &v35);
  int v21 = (*(uint64_t (**)(void))(*(void *)v35 + 136))(v35);
  if (*((void *)&v35 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v35 + 1));
  }
  if (v21) {
    goto LABEL_26;
  }
  SKCRenderer::getBackingContext(v4, &v35);
  long long v22 = v35;
  if (*((void *)&v35 + 1))
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v35 + 1) + 8), 1uLL, memory_order_relaxed);
    if (*((void *)&v35 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v35 + 1));
    }
  }
  [(CAEAGLLayer *)self->_eaglLayer setContentsScale:v12];
  (*(void (**)(void))(*(void *)v22 + 360))(v22);
  v23 = (EAGLContext *)objc_claimAutoreleasedReturnValue();
  glContextUse::glContextUse((glContextUse *)&v35, v23);

  p_frameBufferColorTexture = &self->_frameBufferColorTexture;
  if (self->_frameBufferColorTexture.__ptr_)
  {
    glBindRenderbuffer(0x8D41u, self->_colorRenderBuffer);
    v25 = (*(void (**)(void))(*(void *)v22 + 360))(v22);
    [v25 renderbufferStorage:36161 fromDrawable:0];

    self->_GLuint colorRenderBuffer = 0;
    v26 = self->_frameBufferColorTexture.__cntrl_;
    p_frameBufferColorTexture->__ptr_ = 0;
    self->_frameBufferColorTexture.__cntrl_ = 0;
    if (v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v26);
    }
  }
  p_GLuint colorRenderBuffer = &self->_colorRenderBuffer;
  GLuint colorRenderBuffer = self->_colorRenderBuffer;
  if (!colorRenderBuffer)
  {
    glGenRenderbuffers(1, &self->_colorRenderBuffer);
    GLuint colorRenderBuffer = *p_colorRenderBuffer;
  }
  glBindRenderbuffer(0x8D41u, colorRenderBuffer);
  v29 = (*(void (**)(void))(*(void *)v22 + 360))(v22);
  char v30 = [v29 renderbufferStorage:36161 fromDrawable:self->_eaglLayer];

  if ((v30 & 1) == 0)
  {
    kdebug_trace();
    self->_viewFramebufferIsValid = 0;
    kdebug_trace();
LABEL_43:
    int v31 = 1;
    goto LABEL_44;
  }
  *(void *)params = 0;
  glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &params[1]);
  glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, params);
  if (!params[1] || !params[0])
  {
    self->_viewFramebufferIsValid = 0;
    kdebug_trace();
    goto LABEL_43;
  }
  if (!p_frameBufferColorTexture->__ptr_)
  {
    uint64_t v32 = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v22 + 384))(v22, *p_colorRenderBuffer, v14, v16, 3, 1);
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v34, v32);
  }
  int v31 = 0;
LABEL_44:
  glContextUse::~glContextUse((glContextUse *)&v35);
  if (*((void *)&v22 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v22 + 1));
  }
  if (!v31)
  {
LABEL_26:
    *(void *)&self->_viewFramebufferPixelSize[5] = __PAIR64__(v16, v14);
    self->_viewFramebufferIsValid = 1;
  }
}

- (void)_ensureRenderer
{
  if (!self->_renderer) {
    operator new();
  }
}

- (void)_commonInit
{
  id v3 = +[SKAnalytics instance];
  [v3 sendAnalyticsDataWithKey:@"com.apple.spritekit.apps"];

  sk_debug_check_optional();
  kdebug_trace();
  uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  uint64_t v5 = (OS_dispatch_semaphore *)dispatch_queue_create("SKRenderQueue", v4);
  renderSemaphore = self->_renderSemaphore;
  self->_renderSemaphore = v5;

  dispatch_semaphore_t v7 = dispatch_semaphore_create(1);
  v8 = *(void **)&self->_queuedFrameCount;
  *(void *)&self->_queuedFrameCount = v7;

  LODWORD(self->_prevVsyncRenderTime) = 0;
  self->_prevRenderTime = -1.0;
  self->_displayLink = (SKDisplayLink *)SKDisplayGetDefaultFramerate(0);
  self->_preferredFramesPerSecond = 1;
  char v9 = [MEMORY[0x263EFF9A0] dictionary];
  touchMap = self->_touchMap;
  self->_touchMap = v9;

  float v11 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
  [(NSMapTable *)self->_touchMap setObject:v11 forKeyedSubscript:@"debugDrawStats_BGColor"];

  [(NSMapTable *)self->_touchMap setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"debugDisablePresentationTime"];
  [(SKView *)self setShouldCullNonVisibleNodes:1];
  [(SKView *)self setIgnoresSiblingOrder:0];
  double v12 = [MEMORY[0x263EFF9A0] dictionary];
  [(SKView *)self set_info:v12];

  if ((SKGetLinkedOnOrAfter(589824) & 1) == 0)
  {
    [(SKView *)self setUserInteractionEnabled:1];
    [(SKView *)self setMultipleTouchEnabled:1];
    [(SKView *)self setContentScaleFactor:0.0];
  }
  LOBYTE(self->_machTimeTimebase) = SKGetLinkedOnOrAfter(1179648);
  if (mach_timebase_info(&info))
  {
    mach_timebase_info info = (mach_timebase_info)0x100000001;
    double v13 = 1.0;
  }
  else
  {
    double v13 = (double)(info.numer / info.denom);
  }
  *(double *)&self->_renderQueue = v13;
  self->_viewFramebufferIsValid = 0;
  self->_didRunOnce = 0;
  nextScene = self->_nextScene;
  self->_nextScene = 0;

  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)self->_viewScale = _Q0;
  *(void *)self->_viewTranslation = 0;
  *(void *)&self->_viewTranslation[8] = 0;
  [(SKView *)self onInit];
  [(SKView *)self _ensureRenderer];
  uint64_t v20 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  int v21 = *(void **)&self->_prevBackingScaleFactor;
  *(void *)&self->_prevBackingScaleFactor = v20;

  *(void *)&self->_prefersLowPowerGPU = 0xBFF0000000000000;
  BYTE1(self->_transition) = 0;
  double timePreviousUpdate = self->_timePreviousUpdate;
  self->_double timePreviousUpdate = 0.0;

  [(SKView *)self setUpRenderCallback];
  [(SKView *)self startRenderCallbacks];
  BYTE2(self->_frameInterval) = [(SKView *)self isPaused];
  LOBYTE(self->_frameInterval) = 0;
  v23 = [MEMORY[0x263F08A00] defaultCenter];
  [v23 addObserver:self selector:sel_CBApplicationWillResignActive name:*MEMORY[0x263F1D0D8] object:0];

  v24 = [MEMORY[0x263F08A00] defaultCenter];
  [v24 addObserver:self selector:sel_CBApplicationDidBecomeActive name:*MEMORY[0x263F1D038] object:0];
}

- (void)CBApplicationWillResignActive
{
  id v6 = [(SKView *)self getRenderOptions];
  id v3 = [v6 objectForKeyedSubscript:@"ignoreBackgroundNotifications"];
  char v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    BYTE2(self->_frameInterval) = self->_spriteArrayHint;
    [(SKView *)self setPaused:1];
    uint64_t v5 = +[SKSoundContext currentContext];
    [v5 setSuspended:1];

    LOBYTE(self->_frameInterval) = 1;
  }
}

- (void)CBApplicationDidBecomeActive
{
  id v6 = [(SKView *)self getRenderOptions];
  id v3 = [v6 objectForKeyedSubscript:@"ignoreBackgroundNotifications"];
  char v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0 && LOBYTE(self->_frameInterval))
  {
    LOBYTE(self->_frameInterval) = 0;
    [(SKView *)self setPaused:BYTE2(self->_frameInterval)];
    uint64_t v5 = +[SKSoundContext currentContext];
    [v5 setSuspended:0];
  }
}

- (void)renderForTime:(double)a3 shouldBlock:(BOOL)a4
{
}

- (BOOL)_shouldRenderForTime:(double)a3
{
  return a3 - *(double *)&self->_delegate > (float)(1.0
                                                  / (float)[(SKView *)self _getEffectivePreferredFramesPerSecond])* 0.75;
}

- (void)_vsyncRenderForTime:(double)a3 preRender:(id)a4 postRender:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  float v10 = (void *)MEMORY[0x21052F180]();
  sk_debug_check_optional();
  if (sk_debug_option_exists(&cfstr_Preferredframe_0.isa)) {
    [(OS_dispatch_queue *)self->_updateQueue setPreferredFramesPerSecond:[(SKView *)self _getEffectivePreferredFramesPerSecond]];
  }
  CFTimeInterval v11 = CACurrentMediaTime();
  if (v11 - self->_prevRenderTime < 0.0) {
    goto LABEL_6;
  }
  *(double *)&self->_delegate = a3;
  self->_prevRenderTime = v11;
  if ((int)atomic_fetch_add_explicit((atomic_uint *volatile)&self->_prevVsyncRenderTime, 1u, memory_order_relaxed) > 0)
  {
    atomic_fetch_add_explicit((atomic_uint *volatile)&self->_prevVsyncRenderTime, 0xFFFFFFFF, memory_order_relaxed);
LABEL_6:
    kdebug_trace();
    goto LABEL_7;
  }
  if ([(SKView *)self isAsynchronous]) {
    BOOL v12 = BYTE1(self->_transition) != 0;
  }
  else {
    BOOL v12 = 0;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __51__SKView__vsyncRenderForTime_preRender_postRender___block_invoke;
  v21[3] = &unk_263FE9E08;
  v21[4] = self;
  id v22 = v8;
  double v24 = a3;
  id v23 = v9;
  double v13 = (void *)MEMORY[0x21052F3F0](v21);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __51__SKView__vsyncRenderForTime_preRender_postRender___block_invoke_2;
  v17[3] = &unk_263FE9E30;
  v17[4] = self;
  double v19 = a3;
  BOOL v20 = v12;
  id v14 = v13;
  id v18 = v14;
  double v15 = (void (**)(void))MEMORY[0x21052F3F0](v17);
  double timePreviousUpdate = self->_timePreviousUpdate;
  if (timePreviousUpdate == 0.0) {
    v15[2](v15);
  }
  else {
    dispatch_sync(*(dispatch_queue_t *)&timePreviousUpdate, v15);
  }

LABEL_7:
}

void __51__SKView__vsyncRenderForTime_preRender_postRender___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(id **)(a1 + 32);
  if (!v3[144]) {
    goto LABEL_8;
  }
  int v4 = [v3[144] _usesExplicitRender];
  id v3 = *(id **)(a1 + 32);
  if (!v4) {
    goto LABEL_8;
  }
  char v5 = [v3[144] _needsRender];
  uint64_t v6 = *(void *)(a1 + 32);
  if ((v5 & 1) != 0 || *(void *)(v6 + 1136))
  {
    objc_msgSend(*(id *)(v6 + 1152), "set_needsRender:", 0);
    id v3 = *(id **)(a1 + 32);
LABEL_8:
    dispatch_semaphore_t v7 = [v3 getRenderOptions];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 valueForKey:@"requestCapture"];
      int v10 = [v9 BOOLValue];

      if (v10)
      {
        CFTimeInterval v11 = [v8 valueForKey:@"captureTag"];
        BOOL v12 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
        double v13 = [v12 firstObject];

        id v14 = [v13 stringByAppendingPathComponent:v11];
        double v15 = objc_msgSend(NSString, "stringWithFormat:", @"%p", *(void *)(a1 + 32));
        uint64_t v16 = [v14 stringByAppendingPathComponent:v15];

        v17 = [MEMORY[0x263F08850] defaultManager];
        id v18 = [v16 stringByDeletingLastPathComponent];
        [v17 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:0];

        double v19 = [v16 stringByAppendingPathExtension:@"sks"];

        if (v19 && ([v17 fileExistsAtPath:v19] & 1) == 0) {
          id v20 = (id)[*(id *)(a1 + 32) captureToFile:v19];
        }
      }
      int v21 = [v8 valueForKey:@"debugLogRenderContent"];
      int v22 = [v21 BOOLValue];

      if (v22) {
        NSLog(&cfstr_SkRenderconten.isa, *(void *)(a1 + 32));
      }
    }
    id v23 = (SKCNode *)[*(id *)(a1 + 32) getRootNode];
    double v24 = SKGetGlobalDefaults();
    v25 = [v24 objectForKeyedSubscript:@"kSKMutableTextureExists"];
    int v26 = [v25 BOOLValue];

    if (!v23 || ((sk_debug_option_get_BOOL(&cfstr_Debugdisabledi.isa) | v26) & 1) != 0) {
      goto LABEL_44;
    }
    int v27 = SKCNode::matchesAnyFlags(v23, 66, 66);
    id v28 = *(id *)(*(void *)(a1 + 32) + 1152);
    v29 = v28;
    if (v28)
    {
      char v30 = [v28 camera];
      int v31 = v30;
      if (v30)
      {
        BOOL v32 = SKCNode::matchesAnyFlags((SKCNode *)[v30 _backingNode], 2, 2);
        SKCNode::clearDirty((SKCNode *)[v31 _backingNode]);
        v27 |= v32;
      }
    }
    id v33 = *(id *)(*(void *)(a1 + 32) + 1144);
    long long v34 = v33;
    if (v33)
    {
      long long v35 = [v33 camera];
      v36 = v35;
      if (v35)
      {
        BOOL v37 = SKCNode::matchesAnyFlags((SKCNode *)[v35 _backingNode], 2, 2);
        SKCNode::clearDirty((SKCNode *)[v36 _backingNode]);
        v27 |= v37;
      }
    }
    if (v27)
    {
LABEL_44:
      if ([*(id *)(a1 + 32) hasValidViewFramebuffer])
      {
        uint64_t v38 = [*(id *)(a1 + 32) chooseViewRenderer];
        if (v38)
        {
          v39 = *(void **)(a1 + 32);
          if (v39)
          {
            [v39 nextFramebuffer];
            if (v44)
            {
              double v40 = CACurrentMediaTime();
              _perfBeginRender(v40);
              kdebug_trace();
              [*(id *)(a1 + 32) frame];
              [*(id *)(a1 + 32) frame];
              [*(id *)(a1 + 32) getViewport];
              [*(id *)(a1 + 32) getViewTransform];
              SKCRenderer::render(v38, v23, &v44, 1, v8, *(void *)(a1 + 32) + 760, *(void *)(a1 + 32) + 408, 0);
            }
          }
          else
          {
            uint64_t v44 = 0;
            v45 = 0;
          }
          if (v45) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v45);
          }
        }
      }
    }
    else
    {
      kdebug_trace();
      [*(id *)(a1 + 32) _endFrameStats];
    }
    kdebug_trace();

    uint64_t v41 = *(void *)(a1 + 48);
    if (v41) {
      (*(void (**)(void))(v41 + 16))();
    }
    atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 1240), 0xFFFFFFFF, memory_order_relaxed);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 1232));
    kdebug_trace();
    double v42 = CACurrentMediaTime();
    _perfMarkCADisplayLinkEnd(v42);
    _perfUpdateStatistics(*(void *)(a1 + 32) + 760, *(void *)(a1 + 32) + 408, *(void **)(a1 + 32));
    return;
  }
  atomic_fetch_add_explicit((atomic_uint *volatile)(v6 + 1240), 0xFFFFFFFF, memory_order_relaxed);
  uint64_t v43 = *(NSObject **)(*(void *)(a1 + 32) + 1232);

  dispatch_semaphore_signal(v43);
}

void __51__SKView__vsyncRenderForTime_preRender_postRender___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 0);
  if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 1232), v2))
  {
    atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 32) + 1240), 0xFFFFFFFF, memory_order_relaxed);
    kdebug_trace();
  }
  else
  {
    kdebug_trace();
    SKCStats::SKCStats(&v16);
    uint64_t v3 = *(void *)(a1 + 32) + 760;
    long long v4 = *(_OWORD *)&v16.frameCount;
    long long v5 = *(_OWORD *)&v16.baseTime;
    *(_OWORD *)(v3 + 8) = *(_OWORD *)&v16.frameBeginTime;
    *(_OWORD *)(v3 + 24) = v5;
    *(_OWORD *)(v3 + 40) = v4;
    long long v6 = *(_OWORD *)&v16.update.duration;
    long long v7 = *(_OWORD *)&v16.physics.duration;
    long long v8 = *(_OWORD *)&v16.constraints.beginTime;
    *(_OWORD *)(v3 + 56) = *(_OWORD *)&v16.clientUpdate.duration;
    *(_OWORD *)(v3 + 104) = v8;
    *(_OWORD *)(v3 + 88) = v7;
    *(_OWORD *)(v3 + 72) = v6;
    long long v9 = *(_OWORD *)&v16.render.duration;
    long long v10 = *(_OWORD *)&v16.render.nodeTraversalCount;
    uint64_t v11 = *(void *)&v16.render.passCount;
    *(_OWORD *)(v3 + 120) = *(_OWORD *)&v16.constraints.constraintCount;
    *(void *)(v3 + 168) = v11;
    *(_OWORD *)(v3 + 152) = v10;
    *(_OWORD *)(v3 + 136) = v9;
    SKCStats::~SKCStats(&v16);
    BOOL v12 = (SKCStats *)(*(void *)(a1 + 32) + 760);
    double v13 = CACurrentMediaTime();
    SKCStats::beginFrame(v12, v13);
    double v14 = CACurrentMediaTime();
    _perfMarkCADisplayLinkStart(v14);
    if (sk_debug_get_optional()) {
      kdebug_trace();
    }
    double v15 = *(double *)(a1 + 48);
    if (v15 <= 0.0) {
      double v15 = CACurrentMediaTime();
    }
    [*(id *)(a1 + 32) _update:v15];
    [*(id *)(a1 + 32) notifyWillRenderContent];
    kdebug_trace();
    if (*(unsigned char *)(a1 + 56)) {
      dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 1224), *(dispatch_block_t *)(a1 + 40));
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)_renderSynchronouslyForTime:(double)a3 preRender:(id)a4 postRender:(id)a5 withMTLScheduleHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = (void *)MEMORY[0x21052F180]();
  *(double *)&self->_delegate = a3;
  kdebug_trace();
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __82__SKView__renderSynchronouslyForTime_preRender_postRender_withMTLScheduleHandler___block_invoke;
  v19[3] = &unk_263FE9E58;
  v19[4] = self;
  double v23 = a3;
  id v14 = v10;
  id v20 = v14;
  id v15 = v12;
  id v21 = v15;
  id v16 = v11;
  id v22 = v16;
  v17 = (void (**)(void))MEMORY[0x21052F3F0](v19);
  double timePreviousUpdate = self->_timePreviousUpdate;
  if (timePreviousUpdate == 0.0) {
    v17[2](v17);
  }
  else {
    dispatch_sync(*(dispatch_queue_t *)&timePreviousUpdate, v17);
  }
}

intptr_t __82__SKView__renderSynchronouslyForTime_preRender_postRender_withMTLScheduleHandler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 1232), 0xFFFFFFFFFFFFFFFFLL);
  SKCStats::SKCStats(&v27);
  uint64_t v2 = *(void *)(a1 + 32) + 760;
  long long v3 = *(_OWORD *)&v27.frameCount;
  long long v4 = *(_OWORD *)&v27.baseTime;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)&v27.frameBeginTime;
  *(_OWORD *)(v2 + 24) = v4;
  *(_OWORD *)(v2 + 40) = v3;
  long long v5 = *(_OWORD *)&v27.update.duration;
  long long v6 = *(_OWORD *)&v27.physics.duration;
  long long v7 = *(_OWORD *)&v27.constraints.beginTime;
  *(_OWORD *)(v2 + 56) = *(_OWORD *)&v27.clientUpdate.duration;
  *(_OWORD *)(v2 + 104) = v7;
  *(_OWORD *)(v2 + 88) = v6;
  *(_OWORD *)(v2 + 72) = v5;
  long long v8 = *(_OWORD *)&v27.render.duration;
  long long v9 = *(_OWORD *)&v27.render.nodeTraversalCount;
  uint64_t v10 = *(void *)&v27.render.passCount;
  *(_OWORD *)(v2 + 120) = *(_OWORD *)&v27.constraints.constraintCount;
  *(void *)(v2 + 168) = v10;
  *(_OWORD *)(v2 + 152) = v9;
  *(_OWORD *)(v2 + 136) = v8;
  SKCStats::~SKCStats(&v27);
  id v11 = (SKCStats *)(*(void *)(a1 + 32) + 760);
  double v12 = CACurrentMediaTime();
  SKCStats::beginFrame(v11, v12);
  double v13 = *(double *)(a1 + 64);
  if (v13 <= 0.0) {
    double v13 = CACurrentMediaTime();
  }
  [*(id *)(a1 + 32) _update:v13];
  [*(id *)(a1 + 32) notifyWillRenderContent];
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(void))(v14 + 16))();
  }
  id v15 = [*(id *)(a1 + 32) getRenderOptions];
  id v16 = v15;
  if (v15)
  {
    v17 = [v15 valueForKey:@"debugLogRenderContent"];
    int v18 = [v17 BOOLValue];

    if (v18) {
      NSLog(&cfstr_SkRenderconten.isa, *(void *)(a1 + 32));
    }
  }
  unsigned int v19 = [*(id *)(a1 + 32) hasValidViewFramebuffer];
  if (v19)
  {
    uint64_t v20 = [*(id *)(a1 + 32) chooseViewRenderer];
    if (v20)
    {
      id v21 = *(void **)(a1 + 32);
      if (v21)
      {
        [v21 nextFramebuffer];
        if (v27._vptr$SKCStats)
        {
          [*(id *)(a1 + 32) frame];
          [*(id *)(a1 + 32) frame];
          id v22 = (_OWORD *)[*(id *)(a1 + 32) getRootNode];
          [*(id *)(a1 + 32) getViewport];
          [*(id *)(a1 + 32) getViewTransform];
          SKCRenderer::render(v20, v22, (uint64_t *)&v27, 1, v16, *(void *)(a1 + 32) + 760, *(void *)(a1 + 32) + 408, *(void **)(a1 + 48));
        }
      }
      else
      {
        v27._vptr$SKCStats = 0;
        v27.frameBeginTime = 0.0;
      }
      if (*(void *)&v27.frameBeginTime) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v27.frameBeginTime);
      }
      uint64_t v23 = 0;
      uint64_t v24 = 1;
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v23 = 1;
    }
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
  }
  if (*(void *)(a1 + 48))
  {
    NSLog(&cfstr_SkviewFailedTo.isa, v19, v23, v24);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  uint64_t v25 = *(void *)(a1 + 56);
  if (v25) {
    (*(void (**)(void))(v25 + 16))();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 1232));
}

- (void)_renderSynchronouslyForTime:(double)a3 preRender:(id)a4 postRender:(id)a5
{
}

- (void)_renderToIOSurfaceID:(unsigned int)a3 scaleFactor:(float)a4 asynchronous:(BOOL)a5 preRender:(id)a6 postRender:(id)a7
{
}

- (void)_renderToIOSurfaceID:(unsigned int)a3 scaleFactor:(float)a4 asynchronous:(BOOL)a5 waitOnFence:(BOOL)a6 preRender:(id)a7 postRender:(id)a8
{
  BOOL v9 = a5;
  uint64_t v10 = *(void *)&a3;
  double v12 = (void (**)(void))a7;
  double v13 = (void (**)(void))a8;
  uint64_t v14 = (void *)MEMORY[0x21052F180]();
  kdebug_trace();
  if (v9)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__SKView__renderToIOSurfaceID_scaleFactor_asynchronous_waitOnFence_preRender_postRender___block_invoke;
    block[3] = &unk_263FE9E80;
    block[4] = self;
    uint64_t v25 = v12;
    int v27 = v10;
    int v26 = v13;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)&self->_queuedFrameCount, 0xFFFFFFFFFFFFFFFFLL);
    if (v12) {
      v12[2](v12);
    }
    if (v10)
    {
      [(SKView *)self _ensureRenderer];
      id v15 = IOSurfaceLookup(v10);
      id v16 = v15;
      if (v15)
      {
        size_t Width = IOSurfaceGetWidth(v15);
        size_t Height = IOSurfaceGetHeight(v16);
        if (Width && Height)
        {
          if (!self->_didRunOnce)
          {
            self->_didRunOnce = 1;
            [(SKView *)self runOnce];
          }
          int v18 = [(SKView *)self chooseViewRenderer];
          if (v18)
          {
            uint64_t v19 = (uint64_t)v18;
            [(SKView *)self getRootNode];
            SKCRenderer::getBackingContext(v19, &v22);
            uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t, size_t, size_t, uint64_t, void))(*(void *)v22 + 32))(v22, v10, Width, Height, 4, 0);
            std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v23, v20);
          }
        }
        CFRelease(v16);
      }
    }
    if (v13) {
      v13[2](v13);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)&self->_queuedFrameCount);
  }
}

intptr_t __89__SKView__renderToIOSurfaceID_scaleFactor_asynchronous_waitOnFence_preRender_postRender___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 1232), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(_DWORD *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _ensureRenderer];
    long long v3 = IOSurfaceLookup(*(_DWORD *)(a1 + 56));
    if (v3)
    {
      long long v4 = v3;
      unsigned int Width = IOSurfaceGetWidth(v3);
      unsigned int Height = IOSurfaceGetHeight(v4);
      unint64_t v8 = __PAIR64__(Height, Width);
      uint64_t v9 = Width;
      unint64_t v18 = __PAIR64__(Height, Width);
      uint64_t v10 = Height;
      if (Width) {
        BOOL v11 = Height == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        double v12 = *(unsigned char **)(a1 + 32);
        if (!v12[1065])
        {
          v12[1065] = 1;
          objc_msgSend(*(id *)(a1 + 32), "runOnce", v8, v7);
          double v12 = *(unsigned char **)(a1 + 32);
        }
        uint64_t v13 = objc_msgSend(v12, "chooseViewRenderer", v18);
        if (v13)
        {
          uint64_t v14 = v13;
          [*(id *)(a1 + 32) getRootNode];
          SKCRenderer::getBackingContext(v14, &v19);
          uint64_t v15 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, void))(*(void *)v19 + 32))(v19, *(unsigned int *)(a1 + 56), v9, v10, 4, 0);
          std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v20, v15);
        }
      }
      CFRelease(v4);
    }
  }
  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(void))(v16 + 16))();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 1232));
}

- (void)_dispatchRenderToIOSurfaceID:(unsigned int)a3 async:(BOOL)a4 onQueue:(id)a5 waitOnFence:(BOOL)a6 preRender:(id)a7 postRender:(id)a8
{
  BOOL v10 = a4;
  uint64_t v13 = a5;
  id v14 = a7;
  id v15 = a8;
  uint64_t v16 = (void *)MEMORY[0x21052F180]();
  kdebug_trace();
  if (v13 && v10)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__SKView__dispatchRenderToIOSurfaceID_async_onQueue_waitOnFence_preRender_postRender___block_invoke;
    block[3] = &unk_263FE9E80;
    block[4] = self;
    v17 = &v24;
    id v24 = v14;
    unsigned int v26 = a3;
    unint64_t v18 = &v25;
    id v25 = v15;
    dispatch_async(v13, block);
LABEL_6:

    goto LABEL_7;
  }
  if (v13)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __86__SKView__dispatchRenderToIOSurfaceID_async_onQueue_waitOnFence_preRender_postRender___block_invoke_2;
    v19[3] = &unk_263FE9E80;
    v19[4] = self;
    v17 = &v20;
    id v20 = v14;
    unsigned int v22 = a3;
    unint64_t v18 = &v21;
    id v21 = v15;
    dispatch_sync(v13, v19);
    goto LABEL_6;
  }
LABEL_7:
}

intptr_t __86__SKView__dispatchRenderToIOSurfaceID_async_onQueue_waitOnFence_preRender_postRender___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 1232), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(_DWORD *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _ensureRenderer];
    long long v3 = IOSurfaceLookup(*(_DWORD *)(a1 + 56));
    if (v3)
    {
      long long v4 = v3;
      unsigned int Width = IOSurfaceGetWidth(v3);
      unsigned int Height = IOSurfaceGetHeight(v4);
      unint64_t v8 = __PAIR64__(Height, Width);
      uint64_t v9 = Width;
      unint64_t v18 = __PAIR64__(Height, Width);
      uint64_t v10 = Height;
      if (Width) {
        BOOL v11 = Height == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        double v12 = *(unsigned char **)(a1 + 32);
        if (!v12[1065])
        {
          v12[1065] = 1;
          objc_msgSend(*(id *)(a1 + 32), "runOnce", v8, v7);
          double v12 = *(unsigned char **)(a1 + 32);
        }
        uint64_t v13 = objc_msgSend(v12, "chooseViewRenderer", v18);
        if (v13)
        {
          uint64_t v14 = v13;
          [*(id *)(a1 + 32) getRootNode];
          SKCRenderer::getBackingContext(v14, &v19);
          uint64_t v15 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, void))(*(void *)v19 + 32))(v19, *(unsigned int *)(a1 + 56), v9, v10, 4, 0);
          std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v20, v15);
        }
      }
      CFRelease(v4);
    }
  }
  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(void))(v16 + 16))();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 1232));
}

intptr_t __86__SKView__dispatchRenderToIOSurfaceID_async_onQueue_waitOnFence_preRender_postRender___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 1232), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (*(_DWORD *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _ensureRenderer];
    long long v3 = IOSurfaceLookup(*(_DWORD *)(a1 + 56));
    if (v3)
    {
      long long v4 = v3;
      unsigned int Width = IOSurfaceGetWidth(v3);
      unsigned int Height = IOSurfaceGetHeight(v4);
      unint64_t v8 = __PAIR64__(Height, Width);
      uint64_t v9 = Width;
      unint64_t v18 = __PAIR64__(Height, Width);
      uint64_t v10 = Height;
      if (Width) {
        BOOL v11 = Height == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        double v12 = *(unsigned char **)(a1 + 32);
        if (!v12[1065])
        {
          v12[1065] = 1;
          objc_msgSend(*(id *)(a1 + 32), "runOnce", v8, v7);
          double v12 = *(unsigned char **)(a1 + 32);
        }
        uint64_t v13 = objc_msgSend(v12, "chooseViewRenderer", v18);
        if (v13)
        {
          uint64_t v14 = v13;
          [*(id *)(a1 + 32) getRootNode];
          SKCRenderer::getBackingContext(v14, &v19);
          uint64_t v15 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, void))(*(void *)v19 + 32))(v19, *(unsigned int *)(a1 + 56), v9, v10, 4, 0);
          std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v20, v15);
        }
      }
      CFRelease(v4);
    }
  }
  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(void))(v16 + 16))();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 1232));
}

- (void)overrideMetalCommandQueue:(id)a3
{
  id v4 = a3;
  SKCRenderer::getBackingContext((uint64_t)self->_renderer, &lpsrc);
  if (!lpsrc)
  {
    long long v5 = 0;
    goto LABEL_6;
  }
  long long v5 = __dynamic_cast(lpsrc, MEMORY[0x263F50770], MEMORY[0x263F50778], 0);
  if (!v5)
  {
LABEL_6:
    long long v6 = 0;
    goto LABEL_7;
  }
  long long v6 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (v5) {
    jet_context_Metal::override_Metal_render_state();
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (void)setAsynchronous:(BOOL)asynchronous
{
  BOOL v3 = asynchronous;
  id v4 = [(SKView *)self layer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setPresentsWithTransaction:!v3];
  }
}

- (BOOL)isAsynchronous
{
  uint64_t v2 = [(SKView *)self layer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v3 = [v2 presentsWithTransaction] ^ 1;
  }
  else {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (void)set_usesAsyncUpdateQueue:(BOOL)a3
{
  BYTE1(self->_transition) = a3;
}

- (BOOL)_usesAsyncUpdateQueue
{
  return BYTE1(self->_transition);
}

- (void)setUpRenderCallback
{
  objc_initWeak(&location, self);
  updateQueue = self->_updateQueue;
  self->_updateQueue = 0;

  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __29__SKView_setUpRenderCallback__block_invoke;
  uint64_t v10 = &unk_263FE9EA8;
  objc_copyWeak(&v11, &location);
  id v4 = objc_loadWeakRetained(&location);
  long long v5 = +[SKDisplayLink displayLinkWithDisplay:0 handler:&v7 client:v4];
  long long v6 = self->_updateQueue;
  self->_updateQueue = v5;

  [(OS_dispatch_queue *)self->_updateQueue setPreferredFramesPerSecond:[(SKView *)self _getEffectivePreferredFramesPerSecond]];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __29__SKView_setUpRenderCallback__block_invoke(uint64_t a1, double a2)
{
  int v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained;
    char v6 = [WeakRetained _shouldRenderForTime:a2];
    long long v5 = v10;
    if (v6)
    {
      uint64_t v7 = [v10 delegate];
      if (!v7
        || (objc_opt_respondsToSelector() & 1) == 0
        || (id v8 = objc_loadWeakRetained(v3),
            char v9 = [v7 view:v8 shouldRenderAtTime:a2],
            v8,
            (v9 & 1) != 0))
      {
        [v10 _vsyncRenderForTime:0 preRender:0 postRender:a2];
      }

      long long v5 = v10;
    }
  }
}

- (void)startRenderCallbacks
{
}

- (void)stopRenderCallbacks
{
}

- (BOOL)_renderUpdateEnabled
{
  updateQueue = self->_updateQueue;
  if (updateQueue) {
    LOBYTE(updateQueue) = [(OS_dispatch_queue *)updateQueue isPaused] ^ 1;
  }
  return (char)updateQueue;
}

- (void)set_renderUpdateEnabled:(BOOL)a3
{
  if (a3) {
    [(SKView *)self startRenderCallbacks];
  }
  else {
    [(SKView *)self stopRenderCallbacks];
  }
}

- (void)_endFrameStats
{
  p_frameStats = &self->_frameStats;
  double v4 = CACurrentMediaTime();
  SKCStats::endFrame(p_frameStats, v4);
  SKCStats::operator+=((uint64_t)&self->_nextStats, (uint64_t)p_frameStats);
  if (self->_nextStats.currentTime - self->_nextStats.baseTime > 1.0)
  {
    long long v5 = *(_OWORD *)&self->_nextStats.frameCount;
    long long v6 = *(_OWORD *)&self->_nextStats.baseTime;
    *(_OWORD *)&self->_currentStats.frameBeginTime = *(_OWORD *)&self->_nextStats.frameBeginTime;
    *(_OWORD *)&self->_currentStats.baseTime = v6;
    *(_OWORD *)&self->_currentStats.frameCount = v5;
    long long v7 = *(_OWORD *)&self->_nextStats.update.duration;
    long long v8 = *(_OWORD *)&self->_nextStats.physics.duration;
    long long v9 = *(_OWORD *)&self->_nextStats.constraints.beginTime;
    *(_OWORD *)&self->_currentStats.clientUpdate.duration = *(_OWORD *)&self->_nextStats.clientUpdate.duration;
    *(_OWORD *)&self->_currentStats.constraints.beginTime = v9;
    *(_OWORD *)&self->_currentStats.physics.duration = v8;
    *(_OWORD *)&self->_currentStats.update.duration = v7;
    long long v10 = *(_OWORD *)&self->_nextStats.render.duration;
    long long v11 = *(_OWORD *)&self->_nextStats.render.nodeTraversalCount;
    uint64_t v12 = *(void *)&self->_nextStats.render.passCount;
    *(_OWORD *)&self->_currentStats.constraints.constraintCount = *(_OWORD *)&self->_nextStats.constraints.constraintCount;
    *(void *)&self->_currentStats.render.passCount = v12;
    *(_OWORD *)&self->_currentStats.render.nodeTraversalCount = v11;
    *(_OWORD *)&self->_currentStats.render.duration = v10;
    SKCStats::SKCStats(&v13);
    *(_OWORD *)&self->_nextStats.constraints.constraintCount = *(_OWORD *)&v13.constraints.constraintCount;
    *(_OWORD *)&self->_nextStats.render.duration = *(_OWORD *)&v13.render.duration;
    *(_OWORD *)&self->_nextStats.render.nodeTraversalCount = *(_OWORD *)&v13.render.nodeTraversalCount;
    *(void *)&self->_nextStats.render.passCount = *(void *)&v13.render.passCount;
    *(_OWORD *)&self->_nextStats.clientUpdate.duration = *(_OWORD *)&v13.clientUpdate.duration;
    *(_OWORD *)&self->_nextStats.update.duration = *(_OWORD *)&v13.update.duration;
    *(_OWORD *)&self->_nextStats.physics.duration = *(_OWORD *)&v13.physics.duration;
    *(_OWORD *)&self->_nextStats.constraints.beginTime = *(_OWORD *)&v13.constraints.beginTime;
    *(_OWORD *)&self->_nextStats.frameBeginTime = *(_OWORD *)&v13.frameBeginTime;
    *(_OWORD *)&self->_nextStats.baseTime = *(_OWORD *)&v13.baseTime;
    *(_OWORD *)&self->_nextStats.frameCount = *(_OWORD *)&v13.frameCount;
    SKCStats::~SKCStats(&v13);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = v7;
  id v28 = v6;
  if (!BYTE4(self->_transition) && *(void *)&self->_paused)
  {
    v39[0] = 0;
    v39[1] = 0;
    id v30 = v7;
    uint64_t v38 = v39;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v9);
          }
          id v37 = *(id *)(*((void *)&v33 + 1) + 8 * i);
          SKCStats v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v37, "hash", v28));
          uint64_t v14 = *(void **)&self->_paused;
          [v37 locationInNode:v14];
          objc_msgSend(v14, "nodeAtPoint:recursive:", 1);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          id v32 = v15;
          if (v15)
          {
            while (([v15 isUserInteractionEnabled] & 1) == 0)
            {
              uint64_t v16 = [v32 parent];
              id v17 = v32;
              id v32 = v16;

              id v15 = v32;
              if (!v32) {
                goto LABEL_14;
              }
            }
            if (v32)
            {
              [*(id *)&self->_prevBackingScaleFactor setObject:v32 forKey:v13];
              double v40 = &v32;
              unint64_t v18 = std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::__emplace_unique_key_args<SKNode * {__strong},std::piecewise_construct_t const&,std::tuple<SKNode * const {__strong}&>,std::tuple<>>((uint64_t **)&v38, (unint64_t *)&v32, (uint64_t)&std::piecewise_construct, &v40);
              std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v18 + 5, &v37);
            }
          }
LABEL_14:
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v10);
    }

    uint64_t v19 = (uint64_t *)v38;
    if (v38 != v39)
    {
      do
      {
        id v20 = (id)v19[4];
        id v21 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        unsigned int v22 = (id *)v19[5];
        uint64_t v23 = (id *)v19[6];
        while (v22 != v23)
        {
          id v24 = *v22;
          [v21 addObject:v24];

          ++v22;
        }
        [v20 touchesBegan:v21 withEvent:v30];

        id v25 = (char *)v19[1];
        if (v25)
        {
          do
          {
            unsigned int v26 = (char **)v25;
            id v25 = *(char **)v25;
          }
          while (v25);
        }
        else
        {
          do
          {
            unsigned int v26 = (char **)v19[2];
            BOOL v27 = *v26 == (char *)v19;
            uint64_t v19 = (uint64_t *)v26;
          }
          while (!v27);
        }
        uint64_t v19 = (uint64_t *)v26;
      }
      while (v26 != v39);
    }
    std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::destroy((uint64_t)&v38, v39[0]);
    id v6 = v28;
    long long v8 = v30;
  }
  v31.receiver = self;
  v31.super_class = (Class)SKView;
  -[SKView touchesBegan:withEvent:](&v31, sel_touchesBegan_withEvent_, v6, v8, v28);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = v7;
  id v24 = v6;
  if (!BYTE4(self->_transition) && *(void *)&self->_paused)
  {
    v35[0] = 0;
    v35[1] = 0;
    id v26 = v7;
    long long v34 = v35;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v9);
          }
          id v33 = *(id *)(*((void *)&v29 + 1) + 8 * i);
          SKCStats v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "hash", v24));
          id v28 = [*(id *)&self->_prevBackingScaleFactor objectForKey:v13];
          if (v28)
          {
            long long v36 = &v28;
            uint64_t v14 = std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::__emplace_unique_key_args<SKNode * {__strong},std::piecewise_construct_t const&,std::tuple<SKNode * const {__strong}&>,std::tuple<>>((uint64_t **)&v34, (unint64_t *)&v28, (uint64_t)&std::piecewise_construct, &v36);
            std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v14 + 5, &v33);
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v10);
    }

    id v15 = (uint64_t *)v34;
    if (v34 != v35)
    {
      do
      {
        id v16 = (id)v15[4];
        id v17 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        unint64_t v18 = (id *)v15[5];
        uint64_t v19 = (id *)v15[6];
        while (v18 != v19)
        {
          id v20 = *v18;
          [v17 addObject:v20];

          ++v18;
        }
        [v16 touchesMoved:v17 withEvent:v26];

        id v21 = (char *)v15[1];
        if (v21)
        {
          do
          {
            unsigned int v22 = (char **)v21;
            id v21 = *(char **)v21;
          }
          while (v21);
        }
        else
        {
          do
          {
            unsigned int v22 = (char **)v15[2];
            BOOL v23 = *v22 == (char *)v15;
            id v15 = (uint64_t *)v22;
          }
          while (!v23);
        }
        id v15 = (uint64_t *)v22;
      }
      while (v22 != v35);
    }
    std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::destroy((uint64_t)&v34, v35[0]);
    id v6 = v24;
    long long v8 = v26;
  }
  v27.receiver = self;
  v27.super_class = (Class)SKView;
  -[SKView touchesMoved:withEvent:](&v27, sel_touchesMoved_withEvent_, v6, v8, v24);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = v7;
  id v29 = v6;
  if (!BYTE4(self->_transition) && *(void *)&self->_paused)
  {
    v45[0] = 0;
    v45[1] = 0;
    id v31 = v7;
    uint64_t v44 = v45;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v9);
          }
          id v43 = *(id *)(*((void *)&v39 + 1) + 8 * i);
          SKCStats v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "hash", v29));
          id v38 = [*(id *)&self->_prevBackingScaleFactor objectForKey:v13];
          if (v38)
          {
            v46 = &v38;
            uint64_t v14 = std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::__emplace_unique_key_args<SKNode * {__strong},std::piecewise_construct_t const&,std::tuple<SKNode * const {__strong}&>,std::tuple<>>((uint64_t **)&v44, (unint64_t *)&v38, (uint64_t)&std::piecewise_construct, &v46);
            std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v14 + 5, &v43);
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v10);
    }

    id v15 = (uint64_t *)v44;
    long long v8 = v31;
    if (v44 != v45)
    {
      do
      {
        id v32 = (id)v15[4];
        id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v17 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        uint64_t v19 = (id *)v15[5];
        unint64_t v18 = (id *)v15[6];
        while (v19 != v18)
        {
          id v20 = *v19;
          [v17 addObject:v20];
          id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "hash"));
          [v16 addObject:v21];

          ++v19;
        }
        [v32 touchesEnded:v17 withEvent:v31];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v22 = v16;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v47 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v35 != v24) {
                objc_enumerationMutation(v22);
              }
              objc_msgSend(*(id *)&self->_prevBackingScaleFactor, "removeObjectForKey:", *(void *)(*((void *)&v34 + 1) + 8 * j), v29);
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v47 count:16];
          }
          while (v23);
        }

        id v26 = (char *)v15[1];
        if (v26)
        {
          do
          {
            objc_super v27 = (char **)v26;
            id v26 = *(char **)v26;
          }
          while (v26);
        }
        else
        {
          do
          {
            objc_super v27 = (char **)v15[2];
            BOOL v28 = *v27 == (char *)v15;
            id v15 = (uint64_t *)v27;
          }
          while (!v28);
        }
        id v15 = (uint64_t *)v27;
        long long v8 = v31;
      }
      while (v27 != v45);
    }
    std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::destroy((uint64_t)&v44, v45[0]);
    id v6 = v29;
  }
  v33.receiver = self;
  v33.super_class = (Class)SKView;
  -[SKView touchesEnded:withEvent:](&v33, sel_touchesEnded_withEvent_, v6, v8, v29);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = v7;
  id v29 = v6;
  if (!BYTE4(self->_transition) && *(void *)&self->_paused)
  {
    v45[0] = 0;
    v45[1] = 0;
    id v31 = v7;
    uint64_t v44 = v45;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v9);
          }
          id v43 = *(id *)(*((void *)&v39 + 1) + 8 * i);
          SKCStats v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "hash", v29));
          id v38 = [*(id *)&self->_prevBackingScaleFactor objectForKey:v13];
          if (v38)
          {
            v46 = &v38;
            uint64_t v14 = std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::__emplace_unique_key_args<SKNode * {__strong},std::piecewise_construct_t const&,std::tuple<SKNode * const {__strong}&>,std::tuple<>>((uint64_t **)&v44, (unint64_t *)&v38, (uint64_t)&std::piecewise_construct, &v46);
            std::vector<UITouch * {__strong}>::push_back[abi:ne180100]((char **)v14 + 5, &v43);
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v10);
    }

    id v15 = (uint64_t *)v44;
    long long v8 = v31;
    if (v44 != v45)
    {
      do
      {
        id v32 = (id)v15[4];
        id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v17 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        uint64_t v19 = (id *)v15[5];
        unint64_t v18 = (id *)v15[6];
        while (v19 != v18)
        {
          id v20 = *v19;
          [v17 addObject:v20];
          id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "hash"));
          [v16 addObject:v21];

          ++v19;
        }
        [v32 touchesCancelled:v17 withEvent:v31];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v22 = v16;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v47 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v35 != v24) {
                objc_enumerationMutation(v22);
              }
              objc_msgSend(*(id *)&self->_prevBackingScaleFactor, "removeObjectForKey:", *(void *)(*((void *)&v34 + 1) + 8 * j), v29);
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v47 count:16];
          }
          while (v23);
        }

        id v26 = (char *)v15[1];
        if (v26)
        {
          do
          {
            objc_super v27 = (char **)v26;
            id v26 = *(char **)v26;
          }
          while (v26);
        }
        else
        {
          do
          {
            objc_super v27 = (char **)v15[2];
            BOOL v28 = *v27 == (char *)v15;
            id v15 = (uint64_t *)v27;
          }
          while (!v28);
        }
        id v15 = (uint64_t *)v27;
        long long v8 = v31;
      }
      while (v27 != v45);
    }
    std::__tree<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::__map_value_compare<SKNode * {__strong},std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>,std::less<SKNode * {__strong}>,true>,std::allocator<std::__value_type<SKNode * {__strong},std::vector<UITouch * {__strong}>>>>::destroy((uint64_t)&v44, v45[0]);
    id v6 = v29;
  }
  v33.receiver = self;
  v33.super_class = (Class)SKView;
  -[SKView touchesCancelled:withEvent:](&v33, sel_touchesCancelled_withEvent_, v6, v8, v29);
}

- (CGPoint)convertPoint:(CGPoint)point toScene:(SKScene *)scene
{
  *(void *)&double v4 = CGPointConvertFromViewToScene(self, scene, point).n128_u64[0];
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)point fromScene:(SKScene *)scene
{
  *(void *)&double v4 = CGPointConvertFromSceneToView(scene, self, point).n128_u64[0];
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)dealloc
{
  kdebug_trace();
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D0D8] object:0];

  double v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1D038] object:0];

  [(SKView *)self stopRenderCallbacks];
  updateQueue = self->_updateQueue;
  if (updateQueue)
  {
    [(OS_dispatch_queue *)updateQueue invalidate];
    id v6 = self->_updateQueue;
    self->_updateQueue = 0;
  }
  renderer = (SKCRenderer *)self->_renderer;
  if (renderer)
  {
    SKCRenderer::~SKCRenderer(renderer);
    MEMORY[0x21052EA30]();
  }
  long long v8 = *(void **)&self->_paused;
  if (v8) {
    [v8 removeAllActions];
  }
  v9.receiver = self;
  v9.super_class = (Class)SKView;
  [(SKView *)&v9 dealloc];
}

- (double)alphaValue
{
  double result = 0.0;
  if (!BYTE1(self->_frameInterval)) {
    return 1.0;
  }
  return result;
}

- (BOOL)isOpaque
{
  return BYTE1(self->_frameInterval) == 0;
}

- (BOOL)allowsTransparency
{
  return BYTE1(self->_frameInterval);
}

- (void)setAllowsTransparency:(BOOL)allowsTransparency
{
  BYTE1(self->_frameInterval) = allowsTransparency;
  [(SKView *)self setOpaque:!allowsTransparency];
  double v4 = [(SKView *)self layer];

  if (v4)
  {
    BOOL v5 = BYTE1(self->_frameInterval) == 0;
    id v8 = [(SKView *)self layer];
    [v8 setOpaque:v5];

    id v9 = [MEMORY[0x263F1C550] clearColor];
    uint64_t v6 = [v9 CGColor];
    id v7 = [(SKView *)self layer];
    [v7 setBackgroundColor:v6];
  }
}

- (void)presentScene:(SKScene *)scene
{
  uint64_t v24 = scene;
  BOOL v5 = [(SKView *)self getRenderOptions];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"ignoreBackgroundNotifications"];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0) {
    [(SKView *)self setPaused:0];
  }
  BYTE4(self->_transition) = 1;
  p_paused = (id *)&self->_paused;
  id v9 = *(void **)&self->_paused;
  if (v9)
  {
    [v9 _willMoveFromView:self];
    id v10 = *p_paused;
    id *p_paused = 0;
  }
  uint64_t v11 = *(void **)&self->_prevBackingScaleFactor;
  if (v11) {
    [v11 removeAllObjects];
  }
  if (v24)
  {
    if ([(SKScene *)v24 scaleMode] == SKSceneScaleModeResizeFill)
    {
      [(SKView *)self bounds];
      double v13 = v12;
      double v15 = v14;
      [(SKScene *)v24 size];
      double v17 = v16;
      double v19 = v18;
      [(SKScene *)v24 size];
      if (v21 != v13 || v20 != v15)
      {
        -[SKScene setSize:](v24, "setSize:", v13, v15);
        -[SKScene didChangeSize:](v24, "didChangeSize:", v17, v19);
      }
    }
  }
  objc_storeStrong((id *)&self->_paused, scene);
  id v22 = self->_scene;
  self->_scene = 0;

  nextScene = self->_nextScene;
  self->_nextScene = 0;

  [(SKScene *)v24 setPaused:LOBYTE(self->_spriteArrayHint)];
  [*p_paused _didMoveToView:self];
  self->_needsInitialUpdate = 1;
  BYTE4(self->_transition) = 0;
}

- (void)presentScene:(SKScene *)scene transition:(SKTransition *)transition
{
  double v20 = scene;
  char v7 = transition;
  if (!v20 || !v7) {
    goto LABEL_9;
  }
  if ([(SKScene *)v20 scaleMode] == SKSceneScaleModeResizeFill)
  {
    [(SKView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    [(SKScene *)v20 size];
    double v13 = v12;
    double v15 = v14;
    [(SKScene *)v20 size];
    if (v17 != v9 || v16 != v11)
    {
      -[SKScene setSize:](v20, "setSize:", v9, v11);
      -[SKScene didChangeSize:](v20, "didChangeSize:", v13, v15);
    }
  }
  if (*(void *)&self->_paused)
  {
    BYTE4(self->_transition) = 1;
    objc_storeStrong((id *)&self->_scene, scene);
    [(SKScene *)self->_scene setPaused:LOBYTE(self->_spriteArrayHint)];
    [(SKScene *)self->_scene _didMoveToView:self];
    self->_needsInitialUpdate = 1;
    double v18 = (SKScene *)[(SKTransition *)v7 copy];
    nextScene = self->_nextScene;
    self->_nextScene = v18;

    *(_DWORD *)([(SKNode *)self->_nextScene _backingNode] + 720) = 0;
    *(_DWORD *)([(SKNode *)self->_nextScene _backingNode] + 584) = 0;
  }
  else
  {
LABEL_9:
    [(SKView *)self presentScene:v20];
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SKView;
  [(SKView *)&v6 layoutSubviews];
  [(SKView *)self _reshape];
  int v3 = [(SKView *)self getRenderOptions];
  double v4 = [v3 objectForKeyedSubscript:@"ignoreRenderSyncInLayoutSubviews"];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0) {
    [(SKView *)self _renderSynchronouslyForTime:0 preRender:0 postRender:0.0];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SKView;
  [(SKView *)&v3 didMoveToWindow];
  [(SKView *)self _reshape];
}

- (void)_reshape
{
  kdebug_trace();
  [(SKView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  char v7 = *(void **)&self->_paused;
  if (v7 && [v7 scaleMode] == 3)
  {
    [*(id *)&self->_paused size];
    double v9 = v8;
    double v11 = v10;
    [*(id *)&self->_paused size];
    if (v13 != v4 || v12 != v6)
    {
      objc_msgSend(*(id *)&self->_paused, "setSize:", v4, v6);
      objc_msgSend(*(id *)&self->_paused, "didChangeSize:", v9, v11);
    }
  }
  [(SKView *)self _getViewContentsScale];
  double v16 = v15;
  if (*(void *)&self->_viewFramebufferPixelSize[5] != (v4 * v16)
    || HIDWORD(*(void *)&self->_viewFramebufferPixelSize[5]) != (v6 * v16))
  {
    self->_viewFramebufferIsValid = 0;
  }
}

- (SKScene)scene
{
  return (SKScene *)*(id *)&self->_paused;
}

- (void)_update:(double)a3
{
  if (!LOBYTE(self->_spriteArrayHint) || (p_needsInitialUpdate = &self->_needsInitialUpdate, self->_needsInitialUpdate))
  {
    float v6 = a3 - skCurrentTime();
    if (v6 < 0.0) {
      return;
    }
    if (v6 <= 1.0)
    {
      skSetTime(a3);
      goto LABEL_15;
    }
    uint64_t v7 = *(void *)&self->_paused;
    scene = self->_scene;
    if (v7)
    {
      uint64_t v9 = [*(id *)&self->_paused isPaused];
      [*(id *)&self->_paused setPaused:1];
      if (scene)
      {
LABEL_7:
        BOOL v10 = [(SKNode *)self->_scene isPaused];
        [(SKScene *)self->_scene setPaused:1];
LABEL_11:
        skSetTime(a3);
        if (v7)
        {
          [*(id *)&self->_paused setPaused:0];
          [*(id *)&self->_paused setPaused:v9];
        }
        if (scene)
        {
          [(SKScene *)self->_scene setPaused:0];
          [(SKScene *)self->_scene setPaused:v10];
        }
LABEL_15:
        nextScene = self->_nextScene;
        if (nextScene)
        {
          uint64_t v12 = [(SKNode *)nextScene _backingNode];
          *(float *)(v12 + 584) = *(float *)(v12 + 584) + v6;
          double v13 = [(SKNode *)self->_nextScene _backingNode];
          float v14 = *(float *)([(SKNode *)self->_nextScene _backingNode] + 584);
          v13[180] = v14 / *(float *)([(SKNode *)self->_nextScene _backingNode] + 580);
          float v15 = *(float *)([(SKNode *)self->_nextScene _backingNode] + 584);
          if (v15 >= *(float *)([(SKNode *)self->_nextScene _backingNode] + 580))
          {
            if (*(unsigned char *)([(SKNode *)self->_nextScene _backingNode] + 576)) {
              [*(id *)&self->_paused setPaused:0];
            }
            p_paused = &self->_paused;
            [*(id *)&self->_paused _willMoveFromView:self];
            objc_storeStrong((id *)&self->_paused, self->_scene);
            double v17 = self->_scene;
            self->_scene = 0;

            BYTE4(self->_transition) = 0;
            if (*(unsigned char *)([(SKNode *)self->_nextScene _backingNode] + 577)) {
              [*(id *)p_paused setPaused:0];
            }
            double v18 = self->_nextScene;
            self->_nextScene = 0;

            double v19 = *(void **)&self->_prevBackingScaleFactor;
            if (v19) {
              [v19 removeAllObjects];
            }
            if (*(void *)p_paused) {
              SKCNode::setDirty((SKCNode *)[*(id *)p_paused _backingNode]);
            }
          }
        }
        id v20 = *(id *)&self->_paused;
        double v21 = v20;
        if (v20 && ([v20 isPaused] & 1) == 0)
        {
          if (![v21 _usesExplicitUpdate])
          {
LABEL_30:
            [v21 _update:a3];
            BYTE3(self->_transition) = 0;
            goto LABEL_31;
          }
          if ([v21 _needsUpdate])
          {
            objc_msgSend(v21, "set_needsUpdate:", 0);
            goto LABEL_30;
          }
        }
LABEL_31:
        id v22 = self->_scene;
        uint64_t v23 = v22;
        if (v22 && ![(SKNode *)v22 isPaused])
        {
          if (![(SKScene *)v23 _usesExplicitUpdate])
          {
LABEL_36:
            [(SKScene *)v23 _update:a3];
            BYTE3(self->_transition) = 0;
            goto LABEL_37;
          }
          if ([(SKScene *)v23 _needsUpdate])
          {
            [(SKScene *)v23 set_needsUpdate:0];
            goto LABEL_36;
          }
        }
LABEL_37:

        p_needsInitialUpdate = &self->_needsInitialUpdate;
        if (self->_needsInitialUpdate)
        {
          uint64_t v24 = self->_nextScene;
          if (v24)
          {
            if (*(unsigned char *)([(SKNode *)v24 _backingNode] + 576)) {
              [*(id *)&self->_paused setPaused:1];
            }
            if (*(unsigned char *)([(SKNode *)self->_nextScene _backingNode] + 577)) {
              [(SKScene *)self->_scene setPaused:1];
            }
          }
        }
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v9 = 0;
      if (scene) {
        goto LABEL_7;
      }
    }
    BOOL v10 = 0;
    goto LABEL_11;
  }
LABEL_43:
  BOOL *p_needsInitialUpdate = 0;
}

- (SKTexture)textureFromNode:(SKNode *)node
{
  double v3 = [(SKView *)self textureFromNode:node withOptions:0];

  return (SKTexture *)v3;
}

- (id)textureFromNode:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (NSDictionary *)a4;
  [(SKView *)self _ensureRenderer];
  double v8 = (char **)[v6 _backingNode];
  [(SKView *)self _getViewContentsScale];
  BOOL v10 = SKCRenderer::textureFromNode((SKCRenderer *)self->_renderer, v8, v9, v7);

  return v10;
}

- (SKView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SKView;
  double v3 = -[SKView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(SKView *)v3 _commonInit];
  }
  return v4;
}

- (SKView)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKView;
  double v5 = [(SKView *)&v17 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    [(SKView *)v5 _commonInit];
    if ([v4 decodeIntegerForKey:@"_version"] >= 1)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
      [v7 addObjectsFromArray:v8];

      float v9 = [v4 allowedClasses];
      [v7 unionSet:v9];

      BOOL v10 = [v4 decodeObjectOfClasses:v7 forKey:@"_info"];
      [(SKView *)v6 set_info:v10];

      [v4 decodeCGRectForKey:@"_frame"];
      -[SKView setFrame:](v6, "setFrame:");
      -[SKView setPreferredFramesPerSecond:](v6, "setPreferredFramesPerSecond:", [v4 decodeIntegerForKey:@"_preferredFramesPerSecond"]);
      if ([v4 containsValueForKey:@"_paused"]) {
        -[SKView setPaused:](v6, "setPaused:", [v4 decodeBoolForKey:@"_paused"]);
      }
      if ([v4 containsValueForKey:@"_asynchronous"]) {
        -[SKView setAsynchronous:](v6, "setAsynchronous:", [v4 decodeBoolForKey:@"_asynchronous"]);
      }
      if ([v4 containsValueForKey:@"_allowsTransparency"]) {
        -[SKView setAllowsTransparency:](v6, "setAllowsTransparency:", [v4 decodeBoolForKey:@"_allowsTransparency"]);
      }
      if ([v4 containsValueForKey:@"_ignoresSiblingOrder"]) {
        -[SKView setIgnoresSiblingOrder:](v6, "setIgnoresSiblingOrder:", [v4 decodeBoolForKey:@"_ignoresSiblingOrder"]);
      }
      if ([v4 containsValueForKey:@"_shouldCullNonVisibleNodes"]) {
        -[SKView setShouldCullNonVisibleNodes:](v6, "setShouldCullNonVisibleNodes:", [v4 decodeBoolForKey:@"_shouldCullNonVisibleNodes"]);
      }
      double v11 = [(SKView *)v6 _info];
      BOOL v12 = v11 == 0;

      if (!v12)
      {
        double v13 = [(SKView *)v6 _info];
        float v14 = [v13 objectForKey:@"_ib_SceneName"];

        if (v14 && [v14 length])
        {
          float v15 = +[SKNode nodeWithFileNamed:v14];

          if (v15)
          {
LABEL_20:
            [(SKView *)v6 presentScene:v15];

            goto LABEL_21;
          }
        }
        else
        {
        }
      }
      float v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_scene"];
      goto LABEL_20;
    }
  }
LABEL_21:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKView;
  [(SKView *)&v7 encodeWithCoder:v4];
  [v4 encodeInteger:1 forKey:@"_version"];
  [(SKView *)self frame];
  objc_msgSend(v4, "encodeCGRect:forKey:", @"_frame");
  double v5 = [(SKView *)self _info];
  [v4 encodeObject:v5 forKey:@"_info"];

  objc_super v6 = [(SKView *)self scene];
  [v4 encodeObject:v6 forKey:@"_scene"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SKView preferredFramesPerSecond](self, "preferredFramesPerSecond"), @"_preferredFramesPerSecond");
  objc_msgSend(v4, "encodeBool:forKey:", -[SKView isPaused](self, "isPaused"), @"_paused");
  objc_msgSend(v4, "encodeBool:forKey:", -[SKView isAsynchronous](self, "isAsynchronous"), @"_asynchronous");
  objc_msgSend(v4, "encodeBool:forKey:", -[SKView allowsTransparency](self, "allowsTransparency"), @"_allowsTransparency");
  objc_msgSend(v4, "encodeBool:forKey:", -[SKView ignoresSiblingOrder](self, "ignoresSiblingOrder"), @"_ignoresSiblingOrder");
  objc_msgSend(v4, "encodeBool:forKey:", -[SKView shouldCullNonVisibleNodes](self, "shouldCullNonVisibleNodes"), @"_shouldCullNonVisibleNodes");
}

- (BOOL)isEqualToView:(id)a3
{
  id v4 = (SKView *)a3;
  if (self == v4) {
    goto LABEL_14;
  }
  BOOL v5 = [(SKView *)self isPaused];
  if (v5 == [(SKView *)v4 isPaused])
  {
    BOOL v6 = [(SKView *)self isAsynchronous];
    if (v6 == [(SKView *)v4 isAsynchronous])
    {
      BOOL v7 = [(SKView *)self allowsTransparency];
      if (v7 == [(SKView *)v4 allowsTransparency])
      {
        BOOL v8 = [(SKView *)self ignoresSiblingOrder];
        if (v8 == [(SKView *)v4 ignoresSiblingOrder])
        {
          BOOL v9 = [(SKView *)self shouldCullNonVisibleNodes];
          if (v9 == [(SKView *)v4 shouldCullNonVisibleNodes])
          {
            NSInteger v10 = [(SKView *)self preferredFramesPerSecond];
            if (v10 == [(SKView *)v4 preferredFramesPerSecond])
            {
              [(SKView *)self frame];
              CGFloat v12 = v11;
              CGFloat v14 = v13;
              CGFloat v16 = v15;
              CGFloat v18 = v17;
              [(SKView *)v4 frame];
              v30.origin.x = v19;
              v30.origin.y = v20;
              v30.size.width = v21;
              v30.size.height = v22;
              v29.origin.x = v12;
              v29.origin.y = v14;
              v29.size.width = v16;
              v29.size.height = v18;
              if (CGRectEqualToRect(v29, v30))
              {
                uint64_t v23 = [(SKView *)self scene];
                if (v23)
                {

LABEL_13:
                  id v26 = [(SKView *)self scene];
                  objc_super v27 = [(SKView *)v4 scene];
                  char v24 = [v26 isEqualToNode:v27];

                  goto LABEL_15;
                }
                id v25 = [(SKView *)v4 scene];

                if (v25) {
                  goto LABEL_13;
                }
LABEL_14:
                char v24 = 1;
                goto LABEL_15;
              }
            }
          }
        }
      }
    }
  }
  char v24 = 0;
LABEL_15:

  return v24;
}

- (void)setFrameInterval:(NSInteger)frameInterval
{
  self->_preferredFramesPerSecond = frameInterval;
  unint64_t v4 = [(SKView *)self _getEffectivePreferredFramesPerSecond];
  updateQueue = self->_updateQueue;

  [(OS_dispatch_queue *)updateQueue setPreferredFramesPerSecond:v4];
}

- (NSInteger)frameInterval
{
  return self->_preferredFramesPerSecond;
}

- (void)setPreferredFrameRate:(float)preferredFrameRate
{
}

- (float)preferredFrameRate
{
  return (float)[(SKView *)self preferredFramesPerSecond];
}

- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond
{
  self->_displayLink = (SKDisplayLink *)preferredFramesPerSecond;
  unint64_t v4 = [(SKView *)self _getEffectivePreferredFramesPerSecond];
  updateQueue = self->_updateQueue;

  [(OS_dispatch_queue *)updateQueue setPreferredFramesPerSecond:v4];
}

- (NSInteger)preferredFramesPerSecond
{
  return (NSInteger)self->_displayLink;
}

- (unint64_t)_getEffectivePreferredFramesPerSecond
{
  if (sk_debug_option_exists(&cfstr_Preferredframe_0.isa)) {
    float v3 = sk_debug_option_get_float(&cfstr_Preferredframe_0.isa);
  }
  else {
    float v3 = (float)(unint64_t)((unint64_t)self->_displayLink / self->_preferredFramesPerSecond);
  }
  return (unint64_t)fmaxf(v3, 1.0);
}

- (void)renderToIOSurfaceID:(unsigned int)a3 withScaleFactor:(double)a4
{
  *(float *)&a4 = a4;
  [(SKView *)self _renderToIOSurfaceID:*(void *)&a3 scaleFactor:0 asynchronous:0 preRender:0 postRender:a4];
}

- (SKTexture)textureFromNode:(SKNode *)node crop:(CGRect)crop
{
  CGFloat height = crop.size.height;
  CGFloat width = crop.size.width;
  CGFloat y = crop.origin.y;
  CGFloat x = crop.origin.x;
  v18[1] = *MEMORY[0x263EF8340];
  BOOL v9 = node;
  [(SKView *)self _ensureRenderer];
  NSInteger v10 = [(SKNode *)v9 _backingNode];
  [(SKView *)self _getViewContentsScale];
  float v12 = v11;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  if (CGRectIsEmpty(v20)
    || (v21.origin.x = x, v21.origin.y = y, v21.size.width = width, v21.size.CGFloat height = height, CGRectIsInfinite(v21)))
  {
    double v13 = 0;
  }
  else
  {
    double v17 = @"textureFromNodeCropRect";
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGFloat v14 = NSStringFromCGRect(v22);
    v18[0] = v14;
    double v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  double v15 = SKCRenderer::textureFromNode((SKCRenderer *)self->_renderer, v10, v12, v13);

  return (SKTexture *)v15;
}

- (void)chooseViewRenderer
{
  return self->_renderer;
}

- (shared_ptr<jet_framebuffer>)nextFramebuffer
{
  float v3 = v2;
  if (self->_viewFramebufferIsValid)
  {
    unint64_t v4 = self;
    ptr = self->_frameBufferDepthStencilTexture.__ptr_;
    p_framebuffer = &self->_framebuffer;
    BOOL v7 = self->_framebuffer.__ptr_;
    *((void *)v7 + 26) = ptr;
    *((void *)v7 + 29) = ptr;
    SKCRenderer::getBackingContext((uint64_t)[(SKView *)self chooseViewRenderer], &v18);
    int v8 = (*(uint64_t (**)(void))(*(void *)v18 + 136))(v18);
    self = (SKView *)*((void *)&v18 + 1);
    if (*((void *)&v18 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v18 + 1));
    }
    if (v8 == 1)
    {
      SKCRenderer::getBackingContext((uint64_t)v4->_renderer, &v18);
      long long v9 = v18;
      if (*((void *)&v18 + 1))
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v18 + 1) + 8), 1uLL, memory_order_relaxed);
        if (*((void *)&v18 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v18 + 1));
        }
      }
      if (sk_debug_get_optional()) {
        kdebug_trace();
      }
      double v10 = CACurrentMediaTime();
      _perfStartRequestDrawable(v10);
      if (LOBYTE(v4->_machTimeTimebase)
        && ([(CAMetalLayer *)v4->_metalLayer isDrawableAvailable] & 1) == 0)
      {
        uint64_t v16 = mach_approximate_time();
        if ((unint64_t)(*(double *)&v4->_renderQueue
                              * (double)(v16 - -[SKView nextFramebuffer]::lastLoggingTimeCheckForDrawables)) >= 0x12A05F201)
        {
          -[SKView nextFramebuffer]::lastLoggingTimeCheckForDrawables = v16;
          NSLog(&cfstr_SkviewNoDrawab.isa);
        }
        kdebug_trace();
        *((void *)p_framebuffer->__ptr_ + 2) = 0;
        self = (SKView *)v4->_frameBufferColorTexture.__cntrl_;
        v4->_frameBufferColorTexture.__ptr_ = 0;
        v4->_frameBufferColorTexture.__cntrl_ = 0;
        if (self) {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)self);
        }
        *float v3 = 0;
        v3[1] = 0;
        if (*((void *)&v9 + 1)) {
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v11 = [(CAMetalLayer *)v4->_metalLayer nextDrawable];
        double v12 = CACurrentMediaTime();
        _perfEndRequestDrawable(v12);
        if (sk_debug_get_optional()) {
          kdebug_trace();
        }
        if (v11)
        {
          uint64_t v13 = (*(uint64_t (**)(void, uint64_t))(*(void *)v9 + 416))(v9, v11);
          std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v18, v13);
        }
        kdebug_trace();
        *((void *)p_framebuffer->__ptr_ + 2) = 0;
        cntrl = (std::__shared_weak_count *)v4->_frameBufferColorTexture.__cntrl_;
        v4->_frameBufferColorTexture.__ptr_ = 0;
        v4->_frameBufferColorTexture.__cntrl_ = 0;
        if (cntrl) {
          std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
        }
        *float v3 = 0;
        v3[1] = 0;

        if (*((void *)&v9 + 1)) {
LABEL_28:
        }
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v9 + 1));
      }
    }
    else
    {
      CGFloat v14 = p_framebuffer->__ptr_;
      *((void *)v14 + 2) = v4->_frameBufferColorTexture.__ptr_;
      double v15 = p_framebuffer->__cntrl_;
      *float v3 = v14;
      v3[1] = (jet_framebuffer *)v15;
      if (v15) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v15 + 1, 1uLL, memory_order_relaxed);
      }
    }
  }
  else
  {
    void *v2 = 0;
    v2[1] = 0;
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (jet_framebuffer *)self;
  return result;
}

- (void)getRootNode
{
  float v3 = [(SKView *)self scene];
  unint64_t v4 = self->_scene;
  nextScene = v3;
  if (self->_nextScene)
  {
    BOOL v6 = [(SKNode *)self->_nextScene _backingNode];
    v6[74] = [(SKNode *)v3 _backingNode];
    BOOL v7 = [(SKNode *)self->_nextScene _backingNode];
    v7[75] = [(SKNode *)v4 _backingNode];
    SKCNode::recomputeFlags((SKCNode *)[(SKNode *)self->_nextScene _backingNode], 1);
    nextScene = self->_nextScene;
  }
  int v8 = [(SKNode *)nextScene _backingNode];

  return v8;
}

- (double)getViewport
{
  return 0.0;
}

- (double)getViewTransform
{
  [(id)a1 frame];
  unint64_t v2 = 0;
  v4.f64[1] = v3;
  float32x2_t v5 = vdiv_f32(*(float32x2_t *)(a1 + 960), vcvt_f32_f64(v4));
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)&long long v11 = vsub_f32(_D1, vadd_f32(v5, v5));
  float32x4_t v12 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
  float32x4_t v13 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
  int8x16_t v14 = (int8x16_t)v13;
  v14.i32[2] = 0;
  float32x4_t v15 = *(float32x4_t *)MEMORY[0x263EF89A8];
  float32x4_t v16 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
  *((void *)&v11 + 1) = vextq_s8(v14, v14, 8uLL).u64[0];
  float32x4_t v17 = *(float32x4_t *)MEMORY[0x263EF89A8];
  v17.i32[0] = *(_OWORD *)(a1 + 944);
  float32x4_t v18 = v16;
  v18.i32[1] = HIDWORD(*(void *)(a1 + 944));
  float32x4_t v19 = v12;
  v19.i32[2] = 1.0;
  long long v23 = *MEMORY[0x263EF89A8];
  float32x4_t v24 = v16;
  float32x4_t v25 = v12;
  long long v26 = v11;
  do
  {
    v27[v2 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(*(long long *)((char *)&v23 + v2))), v18, *(float32x2_t *)((char *)&v23 + v2), 1), v19, *(float32x4_t *)((char *)&v23 + v2), 2), v13, *(float32x4_t *)((char *)&v23 + v2), 3);
    v2 += 16;
  }
  while (v2 != 64);
  unint64_t v20 = 0;
  __asm { FMOV            V4.4S, #-1.0 }
  _Q4.i32[2] = 0;
  _Q4.i32[3] = v13.i32[3];
  long long v23 = v27[0];
  float32x4_t v24 = (float32x4_t)v27[1];
  float32x4_t v25 = (float32x4_t)v27[2];
  long long v26 = v27[3];
  do
  {
    v27[v20 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(*(long long *)((char *)&v23 + v20))), v16, *(float32x2_t *)((char *)&v23 + v20), 1), v12, *(float32x4_t *)((char *)&v23 + v20), 2), _Q4, *(float32x4_t *)((char *)&v23 + v20), 3);
    v20 += 16;
  }
  while (v20 != 64);
  return *(double *)v27;
}

- (id)getRenderOptions
{
  float64_t v3 = (void *)[(NSMapTable *)self->_touchMap mutableCopy];
  float64x2_t v4 = sk_get_debug_options();
  [v3 addEntriesFromDictionary:v4];

  float32x2_t v5 = [NSNumber numberWithUnsignedLong:self];
  [v3 setObject:v5 forKeyedSubscript:@"_client"];

  if (sk_debug_option_get_BOOL(&cfstr_Debugdrawstats_6.isa))
  {
    BOOL v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SKView _getEffectivePreferredFramesPerSecond](self, "_getEffectivePreferredFramesPerSecond"));
    [v3 setObject:v6 forKeyedSubscript:@"_preferredFramesPerSecond"];
  }

  return v3;
}

- (BOOL)hasValidViewFramebuffer
{
  if (self->_viewFramebufferIsValid) {
    return 1;
  }
  [(SKView *)self remakeFramebuffer];
  return self->_viewFramebufferIsValid;
}

- (void)notifyWillRenderContent
{
  if (!self->_didRunOnce)
  {
    self->_didRunOnce = 1;
    [(SKView *)self runOnce];
  }
  [(SKView *)self willRenderContent];
  float64_t v3 = *(void **)&self->_paused;
  if (!v3) {
    goto LABEL_7;
  }
  float64x2_t v4 = [v3 delegate];
  float64_t v3 = *(void **)&self->_paused;
  if (!v4) {
    goto LABEL_7;
  }
  float32x2_t v5 = [v3 delegate];
  char v6 = objc_opt_respondsToSelector();

  float64_t v3 = *(void **)&self->_paused;
  if (v6)
  {
    BOOL v7 = [v3 delegate];
    [v7 willRenderContentForScene:*(void *)&self->_paused];
  }
  else
  {
LABEL_7:
    [v3 willRenderContent];
  }
  scene = self->_scene;
  if (!scene) {
    goto LABEL_12;
  }
  long long v9 = [(SKScene *)scene delegate];
  scene = self->_scene;
  if (!v9) {
    goto LABEL_12;
  }
  double v10 = [(SKScene *)scene delegate];
  char v11 = objc_opt_respondsToSelector();

  scene = self->_scene;
  if (v11)
  {
    float32x4_t v12 = [(SKScene *)scene delegate];
    [v12 willRenderContentForScene:self->_scene];
  }
  else
  {
LABEL_12:
    [(SKScene *)scene willRenderContent];
  }

  [(SKView *)self _renderContent];
}

- (NSMutableDictionary)options
{
  return (NSMutableDictionary *)self->_touchMap;
}

- (double)_viewScale
{
  return *(float *)self->_viewScale;
}

- (void)set_viewScale:(double)a3
{
  *(float *)&a3 = a3;
  *(void *)&long long v4 = vdupq_lane_s32(*(int32x2_t *)&a3, 0).u64[0];
  *((void *)&v4 + 1) = *(void *)&self->_viewScale[8];
  *(_OWORD *)self->_viewScale = v4;
  float32x2_t v5 = [(SKView *)self scene];

  if (v5)
  {
    id v6 = [(SKView *)self scene];
    [v6 _setDirty];
  }
}

- (CGPoint)_viewTranslation
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)self->_viewTranslation);
  double v3 = v2.f64[1];
  result.CGFloat x = v2.f64[0];
  result.CGFloat y = v3;
  return result;
}

- (void)set_viewTranslation:(CGPoint)a3
{
  CGFloat y = a3.y;
  *(float32x2_t *)&long long v5 = vcvt_f32_f64((float64x2_t)a3);
  *((void *)&v5 + 1) = vextq_s8(*(int8x16_t *)self->_viewTranslation, *(int8x16_t *)self->_viewTranslation, 8uLL).u64[0];
  *(_OWORD *)self->_viewTranslation = v5;
  id v6 = [(SKView *)self scene];

  if (v6)
  {
    id v7 = [(SKView *)self scene];
    [v7 _setDirty];
  }
}

- (id)snapshot
{
  id v3 = [(SKView *)self scene];

  if (v3)
  {
    long long v4 = [(SKView *)self scene];
    [(SKView *)self frame];
    long long v5 = -[SKView textureFromNode:crop:](self, "textureFromNode:crop:", v4);

    if (v5)
    {
      id v6 = (CGImage *)[v5 CGImage];
      if (v6)
      {
        id v7 = [MEMORY[0x263F1C6B0] imageWithCGImage:v6];
      }
      else
      {
        id v7 = 0;
      }
      CGImageRelease(v6);
    }
    else
    {
      id v7 = 0;
    }
    id v3 = v7;
  }

  return v3;
}

- (float)_getViewContentsScale
{
  float64x2_t v2 = [(SKView *)self window];
  id v3 = [v2 screen];

  if (v3)
  {
    [v3 nativeScale];
    double v5 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263F1C920] mainScreen];
    [v6 nativeScale];
    double v5 = v7;
  }
  return v5;
}

- (BOOL)isPaused
{
  return (BOOL)self->_spriteArrayHint;
}

- (void)setPaused:(BOOL)paused
{
  if (LOBYTE(self->_spriteArrayHint) != paused)
  {
    LOBYTE(self->_spriteArrayHint) = paused;
    if (LOBYTE(self->_frameInterval))
    {
      BYTE2(self->_frameInterval) = paused;
      *(_DWORD *)&paused = LOBYTE(self->_spriteArrayHint);
    }
    if (paused) {
      [(SKView *)self stopRenderCallbacks];
    }
    else {
      [(SKView *)self startRenderCallbacks];
    }
    double v4 = *(void **)&self->_paused;
    if (v4) {
      [v4 setPaused:LOBYTE(self->_spriteArrayHint)];
    }
    scene = self->_scene;
    if (scene)
    {
      uint64_t spriteArrayHint_low = LOBYTE(self->_spriteArrayHint);
      [(SKScene *)scene setPaused:spriteArrayHint_low];
    }
  }
}

- (double)_fps
{
  int frameCount = self->_currentStats.frameCount;
  double result = 1.0;
  if (frameCount >= 2)
  {
    float v4 = self->_currentStats.frameBeginTime - self->_currentStats.baseTime;
    if (v4 > 0.0) {
      return (float)((float)(frameCount - 1) / v4);
    }
  }
  return result;
}

- (int)_spriteRenderCount
{
  return self->_frameStats.render.nodeRenderCount;
}

- (int)_spriteSubmitCount
{
  return self->_frameStats.render.nodeTraversalCount;
}

- (id)_getPerformanceStats
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  p_frameStats = &self->_frameStats;
  double v5 = [NSNumber numberWithInt:self->_frameStats.render.sknodeTraversalCount];
  [v3 setObject:v5 forKeyedSubscript:@"nodeCount"];

  id v6 = [NSNumber numberWithInt:p_frameStats->render.drawCallCount];
  [v3 setObject:v6 forKeyedSubscript:@"drawCallCount"];

  double v7 = [NSNumber numberWithInt:p_frameStats->render.quadCount];
  [v3 setObject:v7 forKeyedSubscript:@"quadCount"];

  return v3;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v18[1] = *MEMORY[0x263EF8340];
  int v8 = [(SKView *)self scene];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __27__SKView_focusItemsInRect___block_invoke;
  v17[3] = &unk_263FE9ED0;
  v17[4] = self;
  *(double *)&void v17[5] = x;
  *(double *)&v17[6] = y;
  *(double *)&v17[7] = width;
  *(double *)&v17[8] = height;
  long long v9 = [v8 _descendantsWithPredicate:v17];
  double v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"zPosition" ascending:1];
  v18[0] = v10;
  char v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  float32x4_t v12 = [v9 sortedArrayUsingDescriptors:v11];

  v16.receiver = self;
  v16.super_class = (Class)SKView;
  float32x4_t v13 = -[SKView focusItemsInRect:](&v16, sel_focusItemsInRect_, x, y, width, height);
  int8x16_t v14 = [v13 arrayByAddingObjectsFromArray:v12];

  return v14;
}

BOOL __27__SKView_focusItemsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 _convertFrameToView:*(void *)(a1 + 32)];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  if ([v3 _isEligibleForFocus])
  {
    v14.origin.double x = v5;
    v14.origin.double y = v7;
    v14.size.double width = v9;
    v14.size.double height = v11;
    BOOL v12 = CGRectIntersectsRect(*(CGRect *)(a1 + 40), v14);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (int64_t)_preferredFocusMovementStyle
{
  return 2;
}

+ (id)debugHierarchyAdditionalGroupingIDs
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"com.apple.SpriteKit.SKScene";
  float64x2_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.SpriteKit.SKScene"])
  {
    double v8 = [v7 scene];

    if (v8)
    {
      CGFloat v9 = [v7 scene];
      v11[0] = v9;
      double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

+ (id)debugHierarchyPropertyDescriptions
{
  v12[6] = *MEMORY[0x263EF8340];
  float64x2_t v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  id v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"propertyName", @"allowsTransparency");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"b");
  v12[0] = Mutable;
  CGFloat v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, @"propertyName", @"asynchronous");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v5, @"propertyFormat", @"b");
  v12[1] = v5;
  id v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v6, @"propertyName", @"delegate");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v6, @"propertyFormat", @"objectInfo");
  v12[2] = v6;
  id v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v7, @"propertyName", @"ignoresSiblingOrder");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v7, @"propertyFormat", @"b");
  v12[3] = v7;
  double v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v8, @"propertyName", @"paused");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v8, @"propertyFormat", @"b");
  v12[4] = v8;
  CGFloat v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v9, @"propertyName", @"preferredFramesPerSecond");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v9, @"propertyFormat", @"b");
  v12[5] = v9;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];

  return v10;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  v27[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  if (![v10 length]) {
    goto LABEL_12;
  }
  NSSelectorFromString((NSString *)v10);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((unint64_t)[v10 length] < 2)
    {
      float32x4_t v15 = [v10 uppercaseString];
    }
    else
    {
      BOOL v12 = [v10 substringToIndex:1];
      float32x4_t v13 = [v12 uppercaseString];
      CGRect v14 = [v10 substringFromIndex:1];
      float32x4_t v15 = [v13 stringByAppendingString:v14];
    }
    objc_super v16 = [@"is" stringByAppendingString:v15];
    NSSelectorFromString(v16);
    if (objc_opt_respondsToSelector()) {
      CGFloat v11 = v16;
    }
    else {
      CGFloat v11 = 0;
    }

    if (v11) {
      goto LABEL_4;
    }
LABEL_12:
    if (a6)
    {
      id v17 = v9;
      float32x4_t v18 = (__CFString *)v10;
      if (v17)
      {
        float32x4_t v19 = [NSString stringWithFormat:@"%@", v17];
      }
      else
      {
        float32x4_t v19 = &stru_26BEEFD10;
      }
      if (v18) {
        unint64_t v20 = v18;
      }
      else {
        unint64_t v20 = &stru_26BEEFD10;
      }
      CGRect v21 = v20;
      v26[0] = @"propertyName";
      v26[1] = @"objectDescription";
      v27[0] = v21;
      v27[1] = v19;
      v26[2] = @"errorDescription";
      v27[2] = &stru_26BEEFD10;
      CGRect v22 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
      long long v23 = [MEMORY[0x263F087E8] errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v22];

      id v24 = v23;
      *a6 = v24;

      CGFloat v11 = 0;
      a6 = 0;
    }
    else
    {
      CGFloat v11 = 0;
    }
    goto LABEL_21;
  }
  CGFloat v11 = (NSString *)v10;
  if (!v11) {
    goto LABEL_12;
  }
LABEL_4:
  a6 = [v9 valueForKey:v11];
LABEL_21:

  return a6;
}

- (NSObject)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->__layerBackedRenderer);

  return WeakRetained;
}

- (void)setDelegate:(NSObject *)delegate
{
}

- (CGSize)pixelSize
{
  double height = self->_pixelSize.height;
  Class isa = self[1].super.super.super.isa;
  result.double height = *(double *)&isa;
  result.double width = height;
  return result;
}

- (void)_layerBackedRenderer
{
  return self->__info;
}

- (void)set_layerBackedRenderer:(void *)a3
{
  self->__mach_timebase_info info = (NSMutableDictionary *)a3;
}

- (NSMutableDictionary)_info
{
  return *(NSMutableDictionary **)&self->_physicsDebugStrokeWidth;
}

- (void)set_info:(id)a3
{
}

- (double)physicsDebugStrokeWidth
{
  return self->_pixelSize.width;
}

- (void)setPhysicsDebugStrokeWidth:(double)a3
{
  self->_pixelSize.double width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicsDebugStrokeWidth, 0);
  objc_destroyWeak(&self->__layerBackedRenderer);
  objc_storeStrong((id *)&self->_queuedFrameCount, 0);
  objc_storeStrong((id *)&self->_renderSemaphore, 0);
  objc_storeStrong((id *)&self->_checkForDrawables, 0);
  objc_storeStrong((id *)&self->_prevBackingScaleFactor, 0);
  objc_storeStrong((id *)&self->_touchMap, 0);
  objc_storeStrong((id *)&self->_viewRenderOptions, 0);
  objc_storeStrong((id *)&self->_paused, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_nextScene, 0);
  objc_storeStrong((id *)&self->_timePreviousUpdate, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_eaglLayer, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
  cntrl = self->_renderFence.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  double v4 = self->_frameBufferDepthStencilTexture.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
  CGFloat v5 = self->_frameBufferColorTexture.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5);
  }
  id v6 = self->_framebuffer.__cntrl_;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
  SKCStats::~SKCStats(&self->_frameStats);
  SKCStats::~SKCStats(&self->_nextStats);

  SKCStats::~SKCStats(&self->_currentStats);
}

- (id).cxx_construct
{
  self->_framebuffer.__ptr_ = 0;
  self->_framebuffer.__cntrl_ = 0;
  self->_frameBufferColorTexture.__ptr_ = 0;
  self->_frameBufferColorTexture.__cntrl_ = 0;
  self->_frameBufferDepthStencilTexture.__ptr_ = 0;
  self->_frameBufferDepthStencilTexture.__cntrl_ = 0;
  self->_renderFence.__ptr_ = 0;
  self->_renderFence.__cntrl_ = 0;
  return self;
}

@end