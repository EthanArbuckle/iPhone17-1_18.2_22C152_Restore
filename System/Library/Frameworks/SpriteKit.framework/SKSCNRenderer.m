@interface SKSCNRenderer
+ (id)rendererWithContext:(id)a3 options:(id)a4;
+ (id)rendererWithDevice:(id)a3 options:(id)a4;
+ (int)getOpenGLFramebuffer:(id)a3;
+ (void)restoreDefaultOpenGLState:(id)a3 frameBuffer:(int)a4;
+ (void)setPrefersOpenGL:(BOOL)a3;
- (BOOL)_shouldCenterStats;
- (BOOL)_showsCPUStats;
- (BOOL)_showsCoreAnimationFPS;
- (BOOL)_showsCulledNodesInNodeCount;
- (BOOL)_showsGPUStats;
- (BOOL)_showsOutlineInterior;
- (BOOL)_showsSpriteBounds;
- (BOOL)_showsTotalAreaRendered;
- (BOOL)ignoresSiblingOrder;
- (BOOL)showsDrawCount;
- (BOOL)showsFPS;
- (BOOL)showsFields;
- (BOOL)showsNodeCount;
- (BOOL)showsPhysics;
- (BOOL)showsQuadCount;
- (BOOL)showsSpriteBounds;
- (CGRect)bounds;
- (SKSCNRenderer)init;
- (SKSCNRenderer)initWithSKCRenderer:(void *)a3;
- (SKScene)scene;
- (__n128)_getMatrix;
- (double)_fps;
- (double)_getDestBounds;
- (double)_getViewport;
- (double)backingScaleFactor;
- (id)_getOptions;
- (id)_scene;
- (int)_spriteRenderCount;
- (int)_spriteSubmitCount;
- (void)_initialize;
- (void)_showAllStats;
- (void)_update:(double)a3;
- (void)dealloc;
- (void)render:(BOOL)a3;
- (void)renderToFramebuffer:(int)a3 shouldClear:(BOOL)a4;
- (void)renderToTexture:(id)a3 commandQueue:(id)a4;
- (void)renderTransition:(id)a3 toFramebuffer:(int)a4 withInputTexture:(unsigned int)a5 outputTexture:(unsigned int)a6 inputTextureSize:(CGSize)a7 outputTextureSize:(CGSize)a8 time:(float)a9;
- (void)renderTransition:(id)a3 withInputTexture:(id)a4 outputTexture:(id)a5 time:(float)a6 encoder:(id)a7 pass:(id)a8 commandQueue:(id)a9;
- (void)renderTransition:(id)a3 withInputTexture:(unsigned int)a4 outputTexture:(unsigned int)a5 inputTextureSize:(CGSize)a6 outputTextureSize:(CGSize)a7 time:(float)a8;
- (void)renderWithEncoder:(id)a3 pass:(id)a4 commandQueue:(id)a5;
- (void)setBackingScaleFactor:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setScene:(id)a3;
- (void)settingsForTransition:(id)a3 atTime:(double)a4 renderIncomingToTexture:(BOOL *)a5 renderOutgoingToTexture:(BOOL *)a6 renderIncomingToScreen:(BOOL *)a7 renderOutgoingToScreen:(BOOL *)a8;
- (void)updateAtTime:(double)a3;
@end

@implementation SKSCNRenderer

- (BOOL)ignoresSiblingOrder
{
  return 1;
}

- (void)dealloc
{
  skcRenderer = (SKCRenderer *)self->_skcRenderer;
  if (skcRenderer)
  {
    SKCRenderer::~SKCRenderer(skcRenderer);
    MEMORY[0x21052EA30]();
    self->_skcRenderer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKSCNRenderer;
  [(SKSCNRenderer *)&v4 dealloc];
}

- (SKSCNRenderer)initWithSKCRenderer:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKSCNRenderer;
  objc_super v4 = [(SKSCNRenderer *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_skcRenderer = a3;
    [(SKSCNRenderer *)v4 _initialize];
  }
  return v5;
}

- (void)_initialize
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  viewRenderOptions = self->_viewRenderOptions;
  self->_viewRenderOptions = v3;

  self->_timePreviousUpdate = -1.0;
  *(_WORD *)&self->_hasRenderedOnce = 0;
  self->_disableInput = 0;
  scene = self->_scene;
  self->_scene = 0;

  self->_frames = 0;
  [(SKSCNRenderer *)self setShowsSpriteBounds:0];
  [(SKSCNRenderer *)self setShowsFPS:0];
  [(SKSCNRenderer *)self setShowsNodeCount:0];
  self->_backingScaleFactor = 1.0;
  self->_prevBackingScaleFactor = 0.0;
}

- (void)updateAtTime:(double)a3
{
  scene = self->_scene;
  if (scene)
  {
    [(SKScene *)scene size];
    double v7 = v6;
    double v9 = v8;
    if ([(SKScene *)self->_scene scaleMode] == SKSceneScaleModeResizeFill)
    {
      [(SKScene *)self->_scene size];
      double v11 = v10;
      double v13 = v12;
      [(SKSCNRenderer *)self bounds];
      if (v11 != v15 || v13 != v14)
      {
        v17 = self->_scene;
        [(SKSCNRenderer *)self bounds];
        -[SKScene setSize:](v17, "setSize:", v18, v19);
        -[SKScene didChangeSize:](self->_scene, "didChangeSize:", v7, v9);
      }
    }
  }
  double timePreviousUpdate = self->_timePreviousUpdate;
  if (timePreviousUpdate <= 0.0)
  {
    self->_double timePreviousUpdate = a3;
    double timePreviousUpdate = a3;
  }
  CFTimeInterval v21 = CACurrentMediaTime();
  if (a3 - v21 < -0.025) {
    a3 = v21;
  }
  self->_double timePreviousUpdate = a3;
  if (a3 - timePreviousUpdate >= 0.0)
  {
    if (a3 - timePreviousUpdate > 1.0 && (v22 = self->_scene) != 0)
    {
      uint64_t v23 = [(SKNode *)v22 isPaused];
      [(SKScene *)self->_scene setPaused:1];
      skSetTime(a3);
      [(SKScene *)self->_scene setPaused:0];
      [(SKScene *)self->_scene setPaused:v23];
    }
    else
    {
      skSetTime(a3);
    }
    v24 = self->_scene;
    if (v24)
    {
      if ([(SKScene *)v24 _usesExplicitUpdate])
      {
        if (![(SKScene *)self->_scene _needsUpdate]) {
          return;
        }
        [(SKScene *)self->_scene set_needsUpdate:0];
      }
      [(SKSCNRenderer *)self _update:a3];
    }
  }
}

- (void)renderWithEncoder:(id)a3 pass:(id)a4 commandQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &v15);
  if (!v15)
  {
    double v11 = 0;
    goto LABEL_6;
  }
  double v11 = __dynamic_cast(v15, MEMORY[0x263F50770], MEMORY[0x263F50778], 0);
  if (!v11)
  {
LABEL_6:
    double v12 = 0;
    goto LABEL_7;
  }
  double v12 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (v11)
  {
    jet_context_Metal::override_Metal_render_state();
    uint64_t v13 = (*(uint64_t (**)(void *, id, id))(*(void *)v11 + 400))(v11, v8, v9);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v14, v13);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

- (void)renderTransition:(id)a3 withInputTexture:(id)a4 outputTexture:(id)a5 time:(float)a6 encoder:(id)a7 pass:(id)a8 commandQueue:(id)a9
{
  id v15 = a3;
  id v23 = a4;
  id v16 = a5;
  id v17 = a7;
  id v24 = a8;
  id v18 = a9;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &v26);
  if (!(void)v26)
  {
    double v19 = 0;
    goto LABEL_6;
  }
  double v19 = __dynamic_cast((const void *)v26, MEMORY[0x263F50770], MEMORY[0x263F50778], 0);
  if (!v19)
  {
LABEL_6:
    v20 = 0;
    goto LABEL_7;
  }
  v20 = (std::__shared_weak_count *)*((void *)&v26 + 1);
  if (*((void *)&v26 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v26 + 1) + 8), 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (*((void *)&v26 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v26 + 1));
  }
  if (v19)
  {
    jet_context_Metal::override_Metal_render_state();
    long long v26 = 0uLL;
    if (v17)
    {
      uint64_t v21 = (*(uint64_t (**)(void *, id, id))(*(void *)v19 + 400))(v19, v17, v24);
      std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v25, v21);
    }
    uint64_t v22 = (*(uint64_t (**)(void *))(*(void *)v19 + 112))(v19);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v25, v22);
  }
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
}

- (void)renderToTexture:(id)a3 commandQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &v11);
  if (!v11)
  {
    id v8 = 0;
    goto LABEL_6;
  }
  id v8 = __dynamic_cast(v11, MEMORY[0x263F50770], MEMORY[0x263F50778], 0);
  if (!v8)
  {
LABEL_6:
    id v9 = 0;
    goto LABEL_7;
  }
  id v9 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v8)
  {
    jet_context_Metal::override_Metal_render_state();
    uint64_t v10 = (*(uint64_t (**)(void *, id))(*(void *)v8 + 408))(v8, v6);
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v11, v10);
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

- (void)renderToFramebuffer:(int)a3 shouldClear:(BOOL)a4
{
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &v8);
  if (!v8)
  {
    objc_super v4 = 0;
    goto LABEL_6;
  }
  objc_super v4 = (jet_context_OpenGL *)__dynamic_cast(v8, MEMORY[0x263F50770], MEMORY[0x263F50780], 0);
  if (!v4)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (v4)
  {
    id v6 = (*(void (**)(jet_context_OpenGL *))(*(void *)v4 + 360))(v4);
    +[SKSCNRenderer getOpenGLFramebuffer:v6];

    jet_context_OpenGL::synchronize_OpenGL_state(v4);
    uint64_t v7 = (*(uint64_t (**)(jet_context_OpenGL *))(*(void *)v4 + 112))(v4);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v8, v7);
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

- (void)render:(BOOL)a3
{
  BOOL v3 = a3;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &lpsrc);
  if (!lpsrc)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v5 = __dynamic_cast(lpsrc, MEMORY[0x263F50770], MEMORY[0x263F50780], 0);
  if (!v5)
  {
LABEL_6:
    id v6 = 0;
    goto LABEL_7;
  }
  id v6 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (v5)
  {
    GLint params = -1;
    (*(void (**)(void *))(*(void *)v5 + 360))(v5);
    uint64_t v7 = (EAGLContext *)objc_claimAutoreleasedReturnValue();
    glContextUse::glContextUse((glContextUse *)&lpsrc, v7);

    glGetIntegerv(0x8CA6u, &params);
    glContextUse::~glContextUse((glContextUse *)&lpsrc);
    [(SKSCNRenderer *)self renderToFramebuffer:params shouldClear:v3];
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

- (void)settingsForTransition:(id)a3 atTime:(double)a4 renderIncomingToTexture:(BOOL *)a5 renderOutgoingToTexture:(BOOL *)a6 renderIncomingToScreen:(BOOL *)a7 renderOutgoingToScreen:(BOOL *)a8
{
  *a5 = 1;
  *a6 = 1;
  *a7 = 0;
  *a8 = 0;
}

- (void)renderTransition:(id)a3 withInputTexture:(unsigned int)a4 outputTexture:(unsigned int)a5 inputTextureSize:(CGSize)a6 outputTextureSize:(CGSize)a7 time:(float)a8
{
  double height = a7.height;
  double width = a7.width;
  double v11 = a6.height;
  double v12 = a6.width;
  uint64_t v13 = *(void *)&a5;
  uint64_t v14 = *(void *)&a4;
  id v16 = a3;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &lpsrc);
  if (!lpsrc)
  {
    id v17 = 0;
    goto LABEL_6;
  }
  id v17 = __dynamic_cast(lpsrc, MEMORY[0x263F50770], MEMORY[0x263F50780], 0);
  if (!v17)
  {
LABEL_6:
    id v18 = 0;
    goto LABEL_7;
  }
  id v18 = v23;
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  if (v17)
  {
    GLint params = -1;
    (*(void (**)(void *))(*(void *)v17 + 360))(v17);
    double v19 = (EAGLContext *)objc_claimAutoreleasedReturnValue();
    glContextUse::glContextUse((glContextUse *)&lpsrc, v19);

    glGetIntegerv(0x8CA6u, &params);
    glContextUse::~glContextUse((glContextUse *)&lpsrc);
    *(float *)&double v20 = a8;
    -[SKSCNRenderer renderTransition:toFramebuffer:withInputTexture:outputTexture:inputTextureSize:outputTextureSize:time:](self, "renderTransition:toFramebuffer:withInputTexture:outputTexture:inputTextureSize:outputTextureSize:time:", v16, params, v14, v13, v12, v11, width, height, v20);
  }
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
}

- (void)renderTransition:(id)a3 toFramebuffer:(int)a4 withInputTexture:(unsigned int)a5 outputTexture:(unsigned int)a6 inputTextureSize:(CGSize)a7 outputTextureSize:(CGSize)a8 time:(float)a9
{
  id v10 = a3;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, lpsrc);
  if (!lpsrc[0])
  {
    double v11 = 0;
    goto LABEL_6;
  }
  double v11 = (jet_context_OpenGL *)__dynamic_cast(lpsrc[0], MEMORY[0x263F50770], MEMORY[0x263F50780], 0);
  if (!v11)
  {
LABEL_6:
    double v12 = 0;
    goto LABEL_7;
  }
  double v12 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)lpsrc[1] + 1, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (lpsrc[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)lpsrc[1]);
  }
  if (v11)
  {
    uint64_t v13 = (*(void (**)(jet_context_OpenGL *))(*(void *)v11 + 360))(v11);
    +[SKSCNRenderer getOpenGLFramebuffer:v13];

    jet_context_OpenGL::synchronize_OpenGL_state(v11);
    uint64_t v14 = (*(uint64_t (**)(jet_context_OpenGL *))(*(void *)v11 + 112))(v11);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(lpsrc, v14);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

+ (int)getOpenGLFramebuffer:(id)a3
{
  GLint params = -1;
  glContextUse::glContextUse((glContextUse *)v5, (EAGLContext *)a3);
  glGetIntegerv(0x8CA6u, &params);
  GLint v3 = params;
  glContextUse::~glContextUse((glContextUse *)v5);
  return v3;
}

+ (void)restoreDefaultOpenGLState:(id)a3 frameBuffer:(int)a4
{
  glContextUse::glContextUse((glContextUse *)v5, (EAGLContext *)a3);
  glBindFramebuffer(0x8D40u, a4);
  glDisable(0xC11u);
  glEnable(0xB71u);
  glDepthMask(1u);
  glContextUse::~glContextUse((glContextUse *)v5);
}

- (BOOL)showsSpriteBounds
{
  return 1;
}

- (BOOL)showsFPS
{
  return 1;
}

- (BOOL)showsNodeCount
{
  return 1;
}

- (BOOL)showsQuadCount
{
  return 1;
}

- (BOOL)showsDrawCount
{
  return 0;
}

- (BOOL)showsPhysics
{
  return 0;
}

- (BOOL)_showsOutlineInterior
{
  return 0;
}

- (BOOL)showsFields
{
  return 0;
}

- (SKSCNRenderer)init
{
  return [(SKSCNRenderer *)self initWithSKCRenderer:0];
}

+ (id)rendererWithDevice:(id)a3 options:(id)a4
{
  id v4 = a3;
  if (SKGetShouldEnableMetal())
  {
    v5 = SKGetGlobalMetalDevice();

    if (!v5) {
      SKSetGlobalMetalDevice(v4);
    }
    operator new();
  }

  return 0;
}

+ (void)setPrefersOpenGL:(BOOL)a3
{
}

+ (id)rendererWithContext:(id)a3 options:(id)a4
{
  id v4 = a3;
  SKSetPrefersOpenGL(1);
  if ((SKGetShouldEnableMetal() & 1) == 0)
  {
    +[SKSCNRenderer getOpenGLFramebuffer:v4];
    operator new();
  }

  return 0;
}

- (BOOL)_showsSpriteBounds
{
  return 0;
}

- (BOOL)_shouldCenterStats
{
  return 0;
}

- (BOOL)_showsCoreAnimationFPS
{
  return 0;
}

- (BOOL)_showsCPUStats
{
  return 0;
}

- (BOOL)_showsGPUStats
{
  return 0;
}

- (BOOL)_showsCulledNodesInNodeCount
{
  return 0;
}

- (BOOL)_showsTotalAreaRendered
{
  return 0;
}

- (void)_showAllStats
{
  [(SKSCNRenderer *)self setShowsDrawCount:1];
  [(SKSCNRenderer *)self setShowsFPS:1];
  [(SKSCNRenderer *)self setShowsNodeCount:1];
  [(SKSCNRenderer *)self setShowsQuadCount:1];
  [(SKSCNRenderer *)self set_showsCulledNodesInNodeCount:1];
  [(SKSCNRenderer *)self set_showsGPUStats:1];
  [(SKSCNRenderer *)self set_showsCPUStats:1];
  [(SKSCNRenderer *)self set_showsCoreAnimationFPS:1];
  [(SKSCNRenderer *)self set_showsTotalAreaRendered:1];
  [(SKSCNRenderer *)self setShowsPhysics:1];

  [(SKSCNRenderer *)self setShowsFields:1];
}

- (void)_update:(double)a3
{
  scene = self->_scene;
  if (scene)
  {
    BOOL v6 = [(SKScene *)scene _usesExplicitUpdate];
    uint64_t v7 = self->_scene;
    if (v6)
    {
      if (![(SKScene *)v7 _needsUpdate]) {
        return;
      }
      [(SKScene *)self->_scene set_needsUpdate:0];
      uint64_t v7 = self->_scene;
    }
    [(SKScene *)v7 _update:a3];
    self->_hasRenderedForCurrentUpdate = 0;
  }
}

- (double)_getViewport
{
  [a1 _getDestBounds];
  float32x4_t v8 = v2;
  [a1 backingScaleFactor];
  float64_t v7 = v3;
  [a1 backingScaleFactor];
  v4.f64[0] = v7;
  v4.f64[1] = v5;
  *(void *)&double result = vmovn_hight_s64(0, (int64x2_t)vcvtq_u64_f64(vmulq_f64(v4, vcvt_hight_f64_f32(v8)))).u64[0];
  return result;
}

- (double)_getDestBounds
{
  [a1 bounds];
  float64_t v6 = v2;
  [a1 bounds];
  v3.f64[0] = v6;
  v3.f64[1] = v4;
  *(void *)&double result = vcvt_hight_f32_f64(0, v3).u64[0];
  return result;
}

- (__n128)_getMatrix
{
  return *(__n128 *)MEMORY[0x263EF89A8];
}

- (id)_getOptions
{
  double v2 = (void *)[(NSMutableDictionary *)self->_viewRenderOptions mutableCopy];
  float64x2_t v3 = sk_get_debug_options();
  [v2 addEntriesFromDictionary:v3];

  return v2;
}

- (id)_scene
{
  return self->_scene;
}

- (double)_fps
{
  return 0.0;
}

- (int)_spriteRenderCount
{
  return 0;
}

- (int)_spriteSubmitCount
{
  return 0;
}

- (SKScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)backingScaleFactor
{
  return self->_backingScaleFactor;
}

- (void)setBackingScaleFactor:(double)a3
{
  self->_backingScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_statsLabel, 0);

  objc_storeStrong((id *)&self->_viewRenderOptions, 0);
}

@end