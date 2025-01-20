@interface SCNMetalLayer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)_kvoKeysForwardedToRenderer;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (AVAudioEngine)audioEngine;
- (AVAudioEnvironmentNode)audioEnvironmentNode;
- (BOOL)_canJitter;
- (BOOL)_checkAndUpdateDisplayLinkStateIfNeeded;
- (BOOL)_isGLLayerBacked;
- (BOOL)_showsAuthoringEnvironment;
- (BOOL)_supportsJitteringSyncRedraw;
- (BOOL)autoenablesDefaultLighting;
- (BOOL)canDrawConcurrently;
- (BOOL)isJitteringEnabled;
- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4;
- (BOOL)isPlaying;
- (BOOL)isTemporalAntialiasingEnabled;
- (BOOL)loops;
- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4;
- (BOOL)rendersIntoMaterial;
- (BOOL)scn_inLiveResize;
- (BOOL)showsStatistics;
- (BOOL)syncTimeWithCoreAnimation;
- (BOOL)usesReverseZ;
- (CGColorSpace)workingColorSpace;
- (CGRect)currentViewport;
- (MTLCommandQueue)commandQueue;
- (MTLRenderCommandEncoder)currentRenderCommandEncoder;
- (MTLRenderPassDescriptor)currentRenderPassDescriptor;
- (NSString)description;
- (SCNMetalLayer)init;
- (SCNMetalLayer)initWithLayer:(id)a3;
- (SCNNode)audioListener;
- (SCNNode)pointOfView;
- (SCNScene)scene;
- (SCNSceneRendererDelegate)delegate;
- (SCNTechnique)technique;
- (SCNVector3)projectPoint:(SCNVector3)a3;
- (SCNVector3)unprojectPoint:(SCNVector3)a3;
- (SCNVector4)_viewport;
- (SKScene)overlaySKScene;
- (double)sceneTime;
- (id)_authoringEnvironment;
- (id)contentLayer;
- (id)displayLink;
- (id)hitTest:(CGPoint)a3 options:(id)a4;
- (id)hitTestWithSegmentFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 options:(id)a5;
- (id)nodesInsideFrustumWithPointOfView:(id)a3;
- (id)pointOfCulling;
- (id)renderer;
- (id)rendererOptions;
- (int64_t)preferredFramesPerSecond;
- (unint64_t)antialiasingMode;
- (unint64_t)debugOptions;
- (unint64_t)renderingAPI;
- (void)SCN_displayLinkCallback:(double)a3;
- (void)_drawAtTime:(double)a3;
- (void)_jitterRedisplay;
- (void)_sceneDidUpdate:(id)a3;
- (void)_systemTimeAnimationStarted:(id)a3;
- (void)commonInit;
- (void)context;
- (void)dealloc;
- (void)display;
- (void)pause;
- (void)pause:(id)a3;
- (void)pauseDisplayLink;
- (void)play;
- (void)play:(id)a3;
- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4;
- (void)presentScene:(id)a3 withTransition:(id)a4 incomingPointOfView:(id)a5 completionHandler:(id)a6;
- (void)projectPoints:(SCNVector3 *)a3 count:(unint64_t)a4;
- (void)resumeDisplayLink;
- (void)setAntialiasingMode:(unint64_t)a3;
- (void)setAudioListener:(id)a3;
- (void)setAutoenablesDefaultLighting:(BOOL)a3;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setDebugOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setJitteringEnabled:(BOOL)a3;
- (void)setLoops:(BOOL)a3;
- (void)setNeedsDisplay;
- (void)setOverlaySKScene:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setPointOfCulling:(id)a3;
- (void)setPointOfView:(id)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setRenderer:(id)a3;
- (void)setRendersIntoMaterial:(BOOL)a3;
- (void)setScene:(id)a3;
- (void)setSceneTime:(double)a3;
- (void)setShowsStatistics:(BOOL)a3;
- (void)setSyncTimeWithCoreAnimation:(BOOL)a3;
- (void)setTechnique:(id)a3;
- (void)setTemporalAntialiasingEnabled:(BOOL)a3;
- (void)setUsesReverseZ:(BOOL)a3;
- (void)set_showsAuthoringEnvironment:(BOOL)a3;
- (void)stop;
- (void)stop:(id)a3;
@end

@implementation SCNMetalLayer

- (void)commonInit
{
  self->_preferredFramePerSeconds = 60;
  id v3 = [(SCNMetalLayer *)self rendererOptions];
  uint64_t v4 = [(id)objc_opt_class() deviceForOptions:v3];
  id v5 = [[SCNRenderer alloc] _initWithOptions:v3 isPrivateRenderer:1 privateRendererOwner:self clearsOnDraw:1 context:v4 renderingAPI:0];
  [(SCNMetalLayer *)self setRenderer:v5];
  self->_lastRenderedTime = -1.0;

  [(CAMetalLayer *)self setDevice:v4];
  [(CAMetalLayer *)self setPixelFormat:C3DMetalFramebufferPixelFormat(0)];
  [(CAMetalLayer *)self setFramebufferOnly:1];
  [(SCNMetalLayer *)self setLoops:1];
  [(SCNMetalLayer *)self setScene:+[SCNScene scene]];
  -[SCNMetalLayer setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "whiteColor"), "CGColor"));

  [(SCNMetalLayer *)self setNeedsDisplayOnBoundsChange:1];
}

- (SCNMetalLayer)initWithLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNMetalLayer;
  return [(SCNMetalLayer *)&v4 initWithLayer:a3];
}

- (SCNMetalLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNMetalLayer;
  v2 = [(CAMetalLayer *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(SCNMetalLayer *)v2 commonInit];
  }
  return v3;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(SCNDisplayLink *)self->_displayLink invalidate];
  int v3 = [MEMORY[0x263F08B88] isMainThread];
  displayLink = self->_displayLink;
  if (v3)
  {

    self->_displayLink = 0;
  }
  else
  {
    self->_displayLink = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __24__SCNMetalLayer_dealloc__block_invoke;
    block[3] = &unk_264004DF8;
    block[4] = displayLink;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }

  v5.receiver = self;
  v5.super_class = (Class)SCNMetalLayer;
  [(CAMetalLayer *)&v5 dealloc];
}

void __24__SCNMetalLayer_dealloc__block_invoke(uint64_t a1)
{
}

- (BOOL)canDrawConcurrently
{
  return 1;
}

- (id)rendererOptions
{
  return 0;
}

- (void)setShowsStatistics:(BOOL)a3
{
}

- (BOOL)showsStatistics
{
  return [(SCNRenderer *)self->_renderer showsStatistics];
}

- (CGRect)currentViewport
{
  [(SCNRenderer *)self->_renderer currentViewport];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isTemporalAntialiasingEnabled
{
  return [(SCNRenderer *)self->_renderer isTemporalAntialiasingEnabled];
}

- (void)setTemporalAntialiasingEnabled:(BOOL)a3
{
}

- (BOOL)usesReverseZ
{
  return [(SCNRenderer *)self->_renderer usesReverseZ];
}

- (void)setUsesReverseZ:(BOOL)a3
{
}

- (id)displayLink
{
  id result = self->_displayLink;
  if (!result)
  {
    double v4 = (SCNDisplayLink *)[self SCN_setupDisplayLinkWithQueue:[(SCNRenderer *)self->_renderer _renderingQueue] screen:0 policy:0];
    self->_displayLink = v4;
    [(SCNDisplayLink *)v4 setPaused:0];
    *(float *)&double v5 = (float)self->_preferredFramePerSeconds;
    [(SCNDisplayLink *)self->_displayLink setPreferredFrameRate:v5];
    return self->_displayLink;
  }
  return result;
}

- (BOOL)_checkAndUpdateDisplayLinkStateIfNeeded
{
  BOOL v3 = [(SCNMetalLayer *)self isPlaying];
  id v4 = [(SCNMetalLayer *)self displayLink];
  [(SCNRenderer *)self->_renderer _nextFrameTime];

  return objc_msgSend(v4, "setPaused:nextFrameTimeHint:lastUpdate:", !v3);
}

- (int64_t)preferredFramesPerSecond
{
  id v3 = [(SCNMetalLayer *)self displayLink];
  if (v3) {
    [v3 preferredFrameRate];
  }
  else {
    return (uint64_t)(float)self->_preferredFramePerSeconds;
  }
  return (uint64_t)v4;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  id v5 = [(SCNMetalLayer *)self displayLink];
  if (v5)
  {
    *(float *)&double v6 = (float)a3;
    [v5 setPreferredFrameRate:v6];
  }
  self->_preferredFramePerSeconds = a3;
}

- (void)pauseDisplayLink
{
  [(SCNJitterer *)self->_jitterer stopIfNeeded];
  id v3 = [(SCNMetalLayer *)self displayLink];

  [v3 setPaused:1];
}

- (void)resumeDisplayLink
{
  id v3 = [(SCNMetalLayer *)self displayLink];
  uint64_t v4 = [(SCNMetalLayer *)self isPlaying] ^ 1;
  [(SCNRenderer *)self->_renderer _nextFrameTime];

  objc_msgSend(v3, "setPaused:nextFrameTimeHint:lastUpdate:", v4);
}

- (void)setPointOfView:(id)a3
{
  objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setPointOfView:", a3);

  [(SCNMetalLayer *)self setNeedsDisplay];
}

- (SCNNode)pointOfView
{
  id v2 = [(SCNMetalLayer *)self renderer];

  return (SCNNode *)[v2 pointOfView];
}

- (void)setPointOfCulling:(id)a3
{
  if ([(SCNMetalLayer *)self pointOfCulling] != a3)
  {
    if (![a3 scene])
    {
      id v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[SCNMetalLayer setPointOfCulling:](v5);
      }
    }
    objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setPointOfCulling:", a3);
    [(SCNMetalLayer *)self setNeedsDisplay];
  }
}

- (id)pointOfCulling
{
  id v2 = [(SCNMetalLayer *)self renderer];

  return (id)[v2 pointOfCulling];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  double v6 = [(SCNMetalLayer *)self scene];
  [(SCNMetalLayer *)self sceneTime];
  return (NSString *)[v3 stringWithFormat:@"<%@: %p | scene=%@ sceneTime=%f pointOfView=%@>", v5, self, v6, v7, -[SCNMetalLayer pointOfView](self, "pointOfView")];
}

- (BOOL)autoenablesDefaultLighting
{
  id v2 = [(SCNMetalLayer *)self renderer];

  return [v2 autoenablesDefaultLighting];
}

- (void)setAutoenablesDefaultLighting:(BOOL)a3
{
  objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setAutoenablesDefaultLighting:", a3);

  [(SCNMetalLayer *)self setNeedsDisplay];
}

- (BOOL)rendersIntoMaterial
{
  return self->_rendersIntoMaterial;
}

- (void)setRendersIntoMaterial:(BOOL)a3
{
  self->_rendersIntoMaterial = a3;
}

- (SCNVector4)_viewport
{
  [(SCNMetalLayer *)self bounds];
  float v3 = v2;
  float v5 = v4;
  float v6 = 0.0;
  float v7 = 0.0;
  result.w = v5;
  result.z = v3;
  result.y = v7;
  result.x = v6;
  return result;
}

- (id)hitTest:(CGPoint)a3 options:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(SCNMetalLayer *)self renderer];
  [(SCNMetalLayer *)self bounds];

  return (id)[v8 _hitTest:a4 viewport:x options:y];
}

- (id)hitTestWithSegmentFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 options:(id)a5
{
  float z = a4.z;
  float y = a4.y;
  float x = a4.x;
  float v9 = a3.z;
  float v10 = a3.y;
  float v11 = a3.x;
  id v12 = [(SCNMetalLayer *)self renderer];
  *(float *)&double v13 = v11;
  *(float *)&double v14 = v10;
  *(float *)&double v15 = v9;
  *(float *)&double v16 = x;
  *(float *)&double v17 = y;
  *(float *)&double v18 = z;

  return (id)objc_msgSend(v12, "hitTestWithSegmentFromPoint:toPoint:options:", a5, v13, v14, v15, v16, v17, v18);
}

- (BOOL)isNodeInsideFrustum:(id)a3 withPointOfView:(id)a4
{
  id v7 = [(SCNMetalLayer *)self renderer];
  [(SCNMetalLayer *)self _viewport];

  return objc_msgSend(v7, "_isNodeInsideFrustum:withPointOfView:viewport:", a3, a4);
}

- (id)nodesInsideFrustumWithPointOfView:(id)a3
{
  id v5 = [(SCNMetalLayer *)self renderer];
  [(SCNMetalLayer *)self _viewport];

  return (id)objc_msgSend(v5, "_nodesInsideFrustumWithPointOfView:viewport:", a3);
}

- (BOOL)prepareObject:(id)a3 shouldAbortBlock:(id)a4
{
  id v6 = [(SCNMetalLayer *)self renderer];

  return [v6 prepareObject:a3 shouldAbortBlock:a4];
}

- (void)prepareObjects:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = [(SCNMetalLayer *)self renderer];

  [v6 prepareObjects:a3 withCompletionHandler:a4];
}

- (void)projectPoints:(SCNVector3 *)a3 count:(unint64_t)a4
{
  id v7 = [(SCNMetalLayer *)self renderer];
  [(SCNMetalLayer *)self _viewport];

  objc_msgSend(v7, "_projectPoints:count:viewport:", a3, a4);
}

- (SCNVector3)projectPoint:(SCNVector3)a3
{
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  id v7 = [(SCNMetalLayer *)self renderer];
  [(SCNMetalLayer *)self _viewport];
  LODWORD(v13) = LODWORD(v9);
  LODWORD(v14) = LODWORD(v10);
  LODWORD(v15) = LODWORD(v11);
  int v8 = LODWORD(v12);
  *(float *)&double v9 = x;
  *(float *)&double v10 = y;
  *(float *)&double v11 = z;
  LODWORD(v12) = LODWORD(v13);
  LODWORD(v13) = LODWORD(v14);
  LODWORD(v14) = LODWORD(v15);
  LODWORD(v15) = v8;

  objc_msgSend(v7, "_projectPoint:viewport:", v9, v10, v11, v12, v13, v14, v15);
  result.float z = v18;
  result.float y = v17;
  result.float x = v16;
  return result;
}

- (SCNVector3)unprojectPoint:(SCNVector3)a3
{
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  id v7 = [(SCNMetalLayer *)self renderer];
  [(SCNMetalLayer *)self _viewport];
  LODWORD(v13) = LODWORD(v9);
  LODWORD(v14) = LODWORD(v10);
  LODWORD(v15) = LODWORD(v11);
  int v8 = LODWORD(v12);
  *(float *)&double v9 = x;
  *(float *)&double v10 = y;
  *(float *)&double v11 = z;
  LODWORD(v12) = LODWORD(v13);
  LODWORD(v13) = LODWORD(v14);
  LODWORD(v14) = LODWORD(v15);
  LODWORD(v15) = v8;

  objc_msgSend(v7, "_unprojectPoint:viewport:", v9, v10, v11, v12, v13, v14, v15);
  result.float z = v18;
  result.float y = v17;
  result.float x = v16;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (SCNSceneRendererDelegate)delegate
{
  return [(SCNRenderer *)self->_renderer delegate];
}

- (void)setRenderer:(id)a3
{
  renderer = self->_renderer;
  if (renderer != a3)
  {

    self->_renderer = (SCNRenderer *)a3;
  }
}

- (id)renderer
{
  return self->_renderer;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SCNMetalLayer;
  -[SCNMetalLayer setBackgroundColor:](&v10, sel_setBackgroundColor_);
  id v5 = (void *)[MEMORY[0x263F1C550] colorWithCGColor:a3];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  double v6 = 0.0;
  uint64_t v7 = 0;
  [v5 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];
  -[SCNMetalLayer setOpaque:](self, "setOpaque:", v6 >= 1.0, v6);
  [(SCNRenderer *)self->_renderer setBackgroundColor:v5];
  [(SCNMetalLayer *)self setNeedsDisplay];
}

- (unint64_t)renderingAPI
{
  return 0;
}

- (CGColorSpace)workingColorSpace
{
  return [(SCNRenderer *)self->_renderer workingColorSpace];
}

- (void)presentScene:(id)a3 withTransition:(id)a4 incomingPointOfView:(id)a5 completionHandler:(id)a6
{
  scene = self->_scene;
  double v12 = [(SCNMetalLayer *)self pointOfView];
  +[SCNTransaction begin];
  +[SCNTransaction setAnimationDuration:0.0];
  +[SCNTransaction setImmediateMode:1];
  [(SCNMetalLayer *)self setScene:a3];
  [(SCNMetalLayer *)self setPointOfView:a5];
  if (a4) {
    [(SCNRenderer *)self->_renderer _prepareForTransition:a4 outgoingScene:scene outgoingPointOfView:v12 completionHandler:a6];
  }

  +[SCNTransaction commit];
}

- (void)setScene:(id)a3
{
  if ([(SCNMetalLayer *)self scene] != a3)
  {

    self->_scene = (SCNScene *)a3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"kC3DSceneDidUpdateNotification", 0);
    renderer = self->_renderer;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __26__SCNMetalLayer_setScene___block_invoke;
    v6[3] = &unk_264004DF8;
    v6[4] = self;
    [(SCNRenderer *)renderer setScene:a3 completionHandler:v6];
    if (a3) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel__sceneDidUpdate_, @"kC3DSceneDidUpdateNotification", objc_msgSend(a3, "sceneRef"));
    }
    [(SCNMetalLayer *)self setNeedsDisplay];
  }
}

uint64_t __26__SCNMetalLayer_setScene___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsDisplay];
}

- (SCNScene)scene
{
  return self->_scene;
}

- (double)sceneTime
{
  [(SCNRenderer *)self->_renderer sceneTime];
  return result;
}

- (void)setSceneTime:(double)a3
{
  [(SCNRenderer *)self->_renderer setSceneTime:a3];

  [(SCNMetalLayer *)self setNeedsDisplay];
}

- (void)play:(id)a3
{
}

- (void)pause:(id)a3
{
}

- (void)stop:(id)a3
{
  [(SCNMetalLayer *)self setPlaying:0];
  id v4 = [(SCNMetalLayer *)self renderer];

  [v4 _stop];
}

- (BOOL)isPlaying
{
  return [(SCNRenderer *)self->_renderer isPlaying];
}

- (void)setPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SCNMetalLayer *)self isPlaying] != a3)
  {
    [(SCNRenderer *)self->_renderer setPlaying:v3];
    if (v3)
    {
      id v5 = [(SCNMetalLayer *)self displayLink];
      [v5 setPaused:0];
    }
    else
    {
      [(SCNRenderer *)self->_renderer _nextFrameTime];
      if (v6 - CACurrentMediaTime() > 2.0)
      {
        jitterer = self->_jitterer;
        [(SCNJitterer *)jitterer restart];
      }
    }
  }
}

- (BOOL)loops
{
  return [(SCNRenderer *)self->_renderer loops];
}

- (void)setLoops:(BOOL)a3
{
}

- (SKScene)overlaySKScene
{
  return [(SCNRenderer *)self->_renderer overlaySKScene];
}

- (void)setOverlaySKScene:(id)a3
{
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  return [(SCNRenderer *)self->_renderer currentRenderPassDescriptor];
}

- (MTLRenderCommandEncoder)currentRenderCommandEncoder
{
  return [(SCNRenderer *)self->_renderer currentRenderCommandEncoder];
}

- (MTLCommandQueue)commandQueue
{
  return [(SCNRenderer *)self->_renderer commandQueue];
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

- (BOOL)_isGLLayerBacked
{
  return 0;
}

- (void)context
{
  return 0;
}

- (void)setNeedsDisplay
{
  self->_lastRenderedTime = -1.0;
  v2.receiver = self;
  v2.super_class = (Class)SCNMetalLayer;
  [(SCNMetalLayer *)&v2 setNeedsDisplay];
}

- (void)display
{
}

- (void)SCN_displayLinkCallback:(double)a3
{
  id v5 = self;
  [(SCNMetalLayer *)self _drawAtTime:a3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SCNMetalLayer_SCN_displayLinkCallback___block_invoke;
  block[3] = &unk_264004DF8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __41__SCNMetalLayer_SCN_displayLinkCallback___block_invoke(uint64_t a1)
{
}

- (void)_drawAtTime:(double)a3
{
  -[SCNMetalLayer convertTime:fromLayer:](self, "convertTime:fromLayer:", 0);
  *(float *)&double v5 = v5;
  double v6 = *(float *)&v5;
  if (!C3DIsRunningInEditor() || self->_lastRenderedTime != v6)
  {
    self->_lastRenderedTime = v6;
    if (self->_syncTimeWithCoreAnimation)
    {
      objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setPlaying:", 0);
      +[SCNTransaction setImmediateMode:1];
      objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setSceneTime:", v6);
      +[SCNTransaction setImmediateMode:0];
      a3 = v6;
    }
    [(SCNJitterer *)self->_jitterer stopIfNeeded];
    [(SCNRenderer *)self->_renderer _displayLinkStatsTick];
    [(SCNMetalLayer *)self bounds];
    double v8 = v7;
    double v10 = v9;
    [(SCNMetalLayer *)self contentsScale];
    if (v11 == 1.0 || v11 == 0.0) {
      double v11 = 1.0;
    }
    double v13 = v10 * v11;
    double v14 = v8 * v11;
    -[SCNRenderer _setBackingSize:](self->_renderer, "_setBackingSize:", v14, v13);
    *(float *)&double v15 = v14;
    *(float *)&double v16 = v13;
    -[SCNRenderer set_viewport:](self->_renderer, "set_viewport:", 0.0, 0.0, v15, v16);
    if (v14 != 0.0 && v13 != 0.0)
    {
      [(SCNRenderer *)self->_renderer lock];
      [(SCNRenderer *)self->_renderer _getFrameIndex];
      uint64_t v17 = kdebug_trace();
      float v18 = (void *)MEMORY[0x210535ED0](v17);
      [(SCNRenderer *)self->_renderer _beginFrame];
      +[SCNTransaction lock];
      [(SCNRenderer *)self->_renderer _drawAtTime:a3];
      [(SCNRenderer *)self->_renderer _presentFramebuffer];
      +[SCNTransaction unlock];
      kdebug_trace();
      [(SCNRenderer *)self->_renderer _nextFrameTime];
      double v20 = v19;
      double v21 = CACurrentMediaTime();
      [(SCNRenderer *)self->_renderer unlock];
      if (C3DIsRunningInEditor())
      {
        objc_msgSend(-[SCNMetalLayer renderer](self, "renderer"), "setPlaying:", 1);
        objc_msgSend(-[SCNMetalLayer displayLink](self, "displayLink"), "setPaused:", 0);
      }
      else if ([(SCNMetalLayer *)self _checkAndUpdateDisplayLinkStateIfNeeded])
      {
        if (![(SCNMetalLayer *)self isPlaying] && !self->_drawForJittering)
        {
          double v22 = v20 - v21;
          if (v20 - v21 > 2.0) {
            [(SCNJitterer *)self->_jitterer restart];
          }
        }
      }
      renderer = self->_renderer;
      [(SCNRenderer *)renderer _displayLinkStatsTack];
    }
  }
}

- (void)_systemTimeAnimationStarted:(id)a3
{
  id v3 = [(SCNMetalLayer *)self displayLink];

  [v3 setPaused:0];
}

- (void)_sceneDidUpdate:(id)a3
{
  self->_lastUpdate = CACurrentMediaTime();

  [(SCNMetalLayer *)self setNeedsDisplay];
}

+ (id)_kvoKeysForwardedToRenderer
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"pointOfView", @"sceneTime", @"playing", @"loops", @"autoenablesDefaultLighting", @"jitteringEnabled", @"technique", 0);
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SCNMetalLayer;
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
  v6.super_class = (Class)&OBJC_METACLASS___SCNMetalLayer;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (id)contentLayer
{
  return 0;
}

- (BOOL)scn_inLiveResize
{
  return 0;
}

- (void)_jitterRedisplay
{
  self->_drawForJittering = 1;
  [(SCNMetalLayer *)self display];
  self->_drawForJittering = 0;
}

- (BOOL)_canJitter
{
  return 0;
}

- (BOOL)_supportsJitteringSyncRedraw
{
  return 0;
}

- (BOOL)isJitteringEnabled
{
  return [(SCNJitterer *)self->_jitterer isEnabled];
}

- (void)setJitteringEnabled:(BOOL)a3
{
}

- (unint64_t)antialiasingMode
{
  return [(SCNRenderer *)self->_renderer _antialiasingMode];
}

- (void)setAntialiasingMode:(unint64_t)a3
{
  [(SCNRenderer *)self->_renderer set_antialiasingMode:a3];

  [(SCNMetalLayer *)self setNeedsDisplay];
}

- (void)play
{
}

- (void)stop
{
}

- (void)pause
{
}

- (void)setDebugOptions:(unint64_t)a3
{
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

- (BOOL)syncTimeWithCoreAnimation
{
  return self->_syncTimeWithCoreAnimation;
}

- (void)setSyncTimeWithCoreAnimation:(BOOL)a3
{
  self->_syncTimeWithCoreAnimation = a3;
}

- (void)setPointOfCulling:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  objc_super v2 = "pointOfCulling.scene";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

@end