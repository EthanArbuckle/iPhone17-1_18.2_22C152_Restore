@interface SKRenderer
+ (SKRenderer)rendererWithDevice:(id)device;
- (BOOL)ignoresSiblingOrder;
- (BOOL)shouldCullNonVisibleNodes;
- (BOOL)showsDrawCount;
- (BOOL)showsFields;
- (BOOL)showsNodeCount;
- (BOOL)showsPhysics;
- (BOOL)showsQuadCount;
- (SKRenderer)initWithSKCRenderer:(void *)a3;
- (SKScene)scene;
- (id)_getOptions;
- (void)_initialize;
- (void)_notifyWillRenderContent;
- (void)_update:(double)a3;
- (void)dealloc;
- (void)renderWithViewport:(CGRect)viewport commandBuffer:(id)commandBuffer renderPassDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor;
- (void)renderWithViewport:(CGRect)viewport renderCommandEncoder:(id)renderCommandEncoder renderPassDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor commandQueue:(id)commandQueue;
- (void)setIgnoresSiblingOrder:(BOOL)ignoresSiblingOrder;
- (void)setScene:(SKScene *)scene;
- (void)setShouldCullNonVisibleNodes:(BOOL)shouldCullNonVisibleNodes;
- (void)setShowsDrawCount:(BOOL)showsDrawCount;
- (void)setShowsFields:(BOOL)showsFields;
- (void)setShowsNodeCount:(BOOL)showsNodeCount;
- (void)setShowsPhysics:(BOOL)showsPhysics;
- (void)setShowsQuadCount:(BOOL)showsQuadCount;
- (void)updateAtTime:(NSTimeInterval)currentTime;
@end

@implementation SKRenderer

+ (SKRenderer)rendererWithDevice:(id)device
{
  id v3 = device;
  v4 = SKGetGlobalMetalDevice();

  if (!v4) {
    SKSetGlobalMetalDevice(v3);
  }
  operator new();
}

- (SKRenderer)initWithSKCRenderer:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKRenderer;
  v4 = [(SKRenderer *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_skcRenderer = a3;
    [(SKRenderer *)v4 _initialize];
  }
  return v5;
}

- (void)_initialize
{
  [(SKRenderer *)self setScene:0];
  self->_hasRenderedForCurrentUpdate = 0;
  *(_WORD *)&self->_needsInitialUpdate = 1;
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  renderOptions = self->_renderOptions;
  self->_renderOptions = v3;

  v5 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
  [(NSMutableDictionary *)self->_renderOptions setObject:v5 forKeyedSubscript:@"debugDrawStats_BGColor"];

  uint64_t v6 = MEMORY[0x263EFFA88];
  [(NSMutableDictionary *)self->_renderOptions setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"debugDisablePresentationTime"];
  [(NSMutableDictionary *)self->_renderOptions setObject:v6 forKeyedSubscript:@"cullNonVisibleNodes"];
  uint64_t v7 = MEMORY[0x263EFFA80];
  v8 = self->_renderOptions;

  [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:@"ignoresSiblingOrder"];
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
  v4.super_class = (Class)SKRenderer;
  [(SKRenderer *)&v4 dealloc];
}

- (void)renderWithViewport:(CGRect)viewport renderCommandEncoder:(id)renderCommandEncoder renderPassDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor commandQueue:(id)commandQueue
{
  id v9 = renderCommandEncoder;
  v10 = renderPassDescriptor;
  id v11 = commandQueue;
  SKCRenderer::getBackingContext((uint64_t)self->_skcRenderer, &lpsrc);
  if (!lpsrc)
  {
    v12 = 0;
    goto LABEL_6;
  }
  v12 = __dynamic_cast(lpsrc, MEMORY[0x263F50770], MEMORY[0x263F50778], 0);
  if (!v12)
  {
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  v13 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v12)
  {
    jet_context_Metal::override_Metal_render_state();
    uint64_t v14 = (*(uint64_t (**)(void *, id, MTLRenderPassDescriptor *))(*(void *)v12 + 400))(v12, v9, v10);
    std::shared_ptr<jet_framebuffer>::shared_ptr[abi:ne180100]<jet_framebuffer,void>(&v15, v14);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
}

- (void)renderWithViewport:(CGRect)viewport commandBuffer:(id)commandBuffer renderPassDescriptor:(MTLRenderPassDescriptor *)renderPassDescriptor
{
  double height = viewport.size.height;
  double width = viewport.size.width;
  double y = viewport.origin.y;
  double x = viewport.origin.x;
  id v14 = commandBuffer;
  id v11 = renderPassDescriptor;
  v12 = [v14 commandQueue];
  v13 = [v14 renderCommandEncoderWithDescriptor:v11];
  [v13 setLabel:@"SKRenderer Pass"];
  -[SKRenderer renderWithViewport:renderCommandEncoder:renderPassDescriptor:commandQueue:](self, "renderWithViewport:renderCommandEncoder:renderPassDescriptor:commandQueue:", v13, v11, v12, x, y, width, height);
  [v13 endEncoding];
}

- (void)_notifyWillRenderContent
{
  scene = self->_scene;
  if (scene)
  {
    uint64_t v4 = [(SKScene *)scene delegate];
    if (v4)
    {
      id v11 = (id)v4;
      v5 = [(SKScene *)self->_scene delegate];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id v12 = [(SKScene *)self->_scene delegate];
        [v12 willRenderContentForScene:self->_scene];
      }
    }
  }
  nextScene = self->_nextScene;
  if (nextScene)
  {
    uint64_t v8 = [(SKScene *)nextScene delegate];
    if (v8)
    {
      id v13 = (id)v8;
      id v9 = [(SKScene *)self->_nextScene delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v14 = [(SKScene *)self->_nextScene delegate];
        [v14 willRenderContentForScene:self->_nextScene];
      }
    }
  }
}

- (void)updateAtTime:(NSTimeInterval)currentTime
{
  if (sk_debug_get_optional()) {
    kdebug_trace();
  }
  if (currentTime <= 0.0) {
    currentTime = CACurrentMediaTime();
  }
  [(SKRenderer *)self _update:currentTime];

  kdebug_trace();
}

- (void)_update:(double)a3
{
  p_scene = &self->_scene;
  if ([(SKScene *)self->_scene scaleMode] == SKSceneScaleModeResizeFill)
  {
    [(SKScene *)self->_scene size];
    if (v7 != self->_renderBounds.size.width || v6 != self->_renderBounds.size.height) {
      -[SKScene setSize:](*p_scene, "setSize:");
    }
  }
  if ([(SKNode *)*p_scene isPaused] && !self->_needsInitialUpdate) {
    goto LABEL_50;
  }
  float v9 = a3 - self->_previousTime;
  if (v9 < 0.0) {
    return;
  }
  if (v9 <= 1.0)
  {
    double currentTime = self->_currentTime;
    self->_double currentTime = a3;
    self->_previousTime = currentTime;
    goto LABEL_21;
  }
  scene = self->_scene;
  nextScene = self->_nextScene;
  if (!scene)
  {
    BOOL v12 = 0;
    if (nextScene) {
      goto LABEL_13;
    }
LABEL_16:
    BOOL v13 = 0;
    goto LABEL_17;
  }
  BOOL v12 = [(SKNode *)self->_scene isPaused];
  [(SKScene *)*p_scene setPaused:1];
  if (!nextScene) {
    goto LABEL_16;
  }
LABEL_13:
  BOOL v13 = [(SKNode *)self->_nextScene isPaused];
  [(SKScene *)self->_nextScene setPaused:1];
LABEL_17:
  double v15 = self->_currentTime;
  self->_double currentTime = a3;
  self->_previousTime = v15;
  if (scene)
  {
    [(SKScene *)*p_scene setPaused:0];
    [(SKScene *)*p_scene setPaused:v12];
  }
  if (nextScene)
  {
    [(SKScene *)self->_nextScene setPaused:0];
    [(SKScene *)self->_nextScene setPaused:v13];
  }
LABEL_21:
  transition = self->_transition;
  if (transition)
  {
    uint64_t v17 = [(SKTransition *)transition _backingNode];
    *(float *)(v17 + 584) = *(float *)(v17 + 584) + v9;
    v18 = [(SKTransition *)self->_transition _backingNode];
    float v19 = *(float *)([(SKTransition *)self->_transition _backingNode] + 584);
    v18[180] = v19 / *(float *)([(SKTransition *)self->_transition _backingNode] + 580);
    float v20 = *(float *)([(SKTransition *)self->_transition _backingNode] + 584);
    if (v20 >= *(float *)([(SKTransition *)self->_transition _backingNode] + 580))
    {
      if (*(unsigned char *)([(SKTransition *)self->_transition _backingNode] + 576)) {
        [(SKScene *)*p_scene setPaused:0];
      }
      [(SKScene *)self->_scene _willMoveFromView:self];
      objc_storeStrong((id *)p_scene, self->_nextScene);
      v21 = self->_nextScene;
      self->_nextScene = 0;

      self->_disableInput = 0;
      if (*(unsigned char *)([(SKTransition *)self->_transition _backingNode] + 577)) {
        [(SKScene *)*p_scene setPaused:0];
      }
      v22 = self->_transition;
      self->_transition = 0;

      touchMap = self->_touchMap;
      if (touchMap) {
        [(NSMapTable *)touchMap removeAllObjects];
      }
      if (!*p_scene)
      {
        v25 = 0;
        goto LABEL_38;
      }
      SKCNode::setDirty((SKCNode *)[(SKNode *)*p_scene _backingNode]);
    }
  }
  v24 = *p_scene;
  v25 = v24;
  if (v24 && ![(SKNode *)v24 isPaused])
  {
    if (![(SKScene *)v25 _usesExplicitUpdate])
    {
LABEL_36:
      [(SKScene *)v25 _update:a3];
      self->_hasRenderedForCurrentUpdate = 0;
      goto LABEL_38;
    }
    if ([(SKScene *)v25 _needsUpdate])
    {
      [(SKScene *)v25 set_needsUpdate:0];
      goto LABEL_36;
    }
  }
LABEL_38:
  v26 = self->_nextScene;
  v27 = v26;
  if (v26 && ![(SKNode *)v26 isPaused])
  {
    if (![(SKScene *)v27 _usesExplicitUpdate])
    {
LABEL_43:
      [(SKScene *)v27 _update:a3];
      self->_hasRenderedForCurrentUpdate = 0;
      goto LABEL_44;
    }
    if ([(SKScene *)v27 _needsUpdate])
    {
      [(SKScene *)v27 set_needsUpdate:0];
      goto LABEL_43;
    }
  }
LABEL_44:

  if (self->_needsInitialUpdate)
  {
    v28 = self->_transition;
    if (v28)
    {
      if (*(unsigned char *)([(SKTransition *)v28 _backingNode] + 576)) {
        [(SKScene *)*p_scene setPaused:1];
      }
      if (*(unsigned char *)([(SKTransition *)self->_transition _backingNode] + 577)) {
        [(SKScene *)self->_nextScene setPaused:1];
      }
    }
  }
LABEL_50:
  self->_needsInitialUpdate = 0;
}

- (id)_getOptions
{
  v2 = (void *)[(NSMutableDictionary *)self->_renderOptions mutableCopy];
  id v3 = sk_get_debug_options();
  [v2 addEntriesFromDictionary:v3];

  return v2;
}

- (void)setShouldCullNonVisibleNodes:(BOOL)shouldCullNonVisibleNodes
{
  id v4 = [NSNumber numberWithBool:shouldCullNonVisibleNodes];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");
}

- (BOOL)shouldCullNonVisibleNodes
{
  v2 = [(NSMutableDictionary *)self->_renderOptions objectForKeyedSubscript:@"cullNonVisibleNodes"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIgnoresSiblingOrder:(BOOL)ignoresSiblingOrder
{
  id v4 = [NSNumber numberWithBool:ignoresSiblingOrder];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");
}

- (BOOL)ignoresSiblingOrder
{
  v2 = [(NSMutableDictionary *)self->_renderOptions objectForKeyedSubscript:@"ignoresSiblingOrder"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsPhysics:(BOOL)showsPhysics
{
  id v4 = [NSNumber numberWithBool:showsPhysics];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");
}

- (BOOL)showsPhysics
{
  v2 = [(NSMutableDictionary *)self->_renderOptions valueForKey:@"debugDrawPhysics"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsFields:(BOOL)showsFields
{
  id v4 = [NSNumber numberWithBool:showsFields];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");
}

- (BOOL)showsFields
{
  v2 = [(NSMutableDictionary *)self->_renderOptions objectForKeyedSubscript:@"debugDrawPhysicsFields"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsQuadCount:(BOOL)showsQuadCount
{
  id v4 = [NSNumber numberWithBool:showsQuadCount];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");
}

- (BOOL)showsQuadCount
{
  v2 = [(NSMutableDictionary *)self->_renderOptions objectForKeyedSubscript:@"debugDrawStats_QuadCount"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsNodeCount:(BOOL)showsNodeCount
{
  id v4 = [NSNumber numberWithBool:showsNodeCount];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");
}

- (BOOL)showsNodeCount
{
  v2 = [(NSMutableDictionary *)self->_renderOptions objectForKeyedSubscript:@"debugDrawStats_NodeCount"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShowsDrawCount:(BOOL)showsDrawCount
{
  id v4 = [NSNumber numberWithBool:showsDrawCount];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_renderOptions, "setObject:forKeyedSubscript:");
}

- (BOOL)showsDrawCount
{
  v2 = [(NSMutableDictionary *)self->_renderOptions objectForKeyedSubscript:@"debugDrawStats_DrawCount"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (SKScene)scene
{
  return self->_scene;
}

- (void)setScene:(SKScene *)scene
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderOptions, 0);
  objc_storeStrong((id *)&self->_touchMap, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_nextScene, 0);

  objc_storeStrong((id *)&self->_scene, 0);
}

@end