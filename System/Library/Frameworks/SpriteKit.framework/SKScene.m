@interface SKScene
+ (BOOL)supportsSecureCoding;
+ (SKScene)sceneWithContentsOfFile:(id)a3;
+ (SKScene)sceneWithContentsOfFile:(id)a3 size:(CGSize)a4;
+ (SKScene)sceneWithSize:(CGSize)size;
+ (id)debugHierarchyPropertyDescriptions;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
- (AVAudioEngine)audioEngine;
- (AVAudioEnvironmentNode)avAudioEnvironmentNode;
- (BOOL)_hasConstraints;
- (BOOL)_isDirty;
- (BOOL)_needsRender;
- (BOOL)_needsUpdate;
- (BOOL)_usesExplicitRender;
- (BOOL)_usesExplicitUpdate;
- (BOOL)isEqualToNode:(id)a3;
- (CGPoint)anchorPoint;
- (CGPoint)convertPointFromParent:(CGPoint)a3;
- (CGPoint)convertPointFromView:(CGPoint)point;
- (CGPoint)convertPointToParent:(CGPoint)a3;
- (CGPoint)convertPointToView:(CGPoint)point;
- (CGPoint)position;
- (CGPoint)visibleRectCenter;
- (CGRect)frame;
- (CGRect)visibleRect;
- (CGSize)size;
- (CGSize)visibleRectSize;
- (PKPhysicsWorld)_pkPhysicsWorld;
- (SKCameraNode)camera;
- (SKNode)listener;
- (SKPhysicsWorld)physicsWorld;
- (SKScene)init;
- (SKScene)initWithCoder:(id)a3;
- (SKScene)initWithSize:(CGSize)size;
- (SKSceneScaleMode)scaleMode;
- (SKView)view;
- (UIColor)backgroundColor;
- (double)xScale;
- (double)yScale;
- (double)zPosition;
- (double)zRotation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegate;
- (id)description;
- (uint64_t)_update:;
- (void)_didMakeBackingNode;
- (void)_didMoveToView:(id)a3;
- (void)_makeBackingNode;
- (void)_notifyNextDirtyState;
- (void)_registerConstraintsForNode:(id)a3;
- (void)_removeConstraintsForNode:(id)a3;
- (void)_setBackgroundContentsWithBuffer:(__CVBuffer *)a3;
- (void)_setDirty;
- (void)_setNeedsRender;
- (void)_setNeedsUpdate;
- (void)_update:;
- (void)_update:(double)a3;
- (void)_willMoveFromView:(id)a3;
- (void)checkAudioEngine;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleAVAudioEngineInterruption:(id)a3;
- (void)setAnchorPoint:(CGPoint)anchorPoint;
- (void)setAvAudioEnvironmentNode:(id)a3;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setCamera:(SKCameraNode *)camera;
- (void)setDelegate:(id)delegate;
- (void)setListener:(SKNode *)listener;
- (void)setPaused:(BOOL)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setScale:(double)a3;
- (void)setScaleMode:(SKSceneScaleMode)scaleMode;
- (void)setSize:(CGSize)size;
- (void)setVisibleRect:(CGRect)a3;
- (void)setVisibleRectCenter:(CGPoint)a3;
- (void)setVisibleRectSize:(CGSize)a3;
- (void)setXScale:(double)a3;
- (void)setYScale:(double)a3;
- (void)setZPosition:(double)a3;
- (void)setZRotation:(double)a3;
- (void)set_needsRender:(BOOL)a3;
- (void)set_needsUpdate:(BOOL)a3;
- (void)set_pkPhysicsWorld:(id)a3;
- (void)set_usesExplicitRender:(BOOL)a3;
- (void)set_usesExplicitUpdate:(BOOL)a3;
@end

@implementation SKScene

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v15 = 0;
  v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:0 error:&v15];
  id v4 = v15;
  id v14 = v4;
  v5 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v3 error:&v14];
  id v6 = v14;

  [v5 setRequiresSecureCoding:0];
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  [v7 addObjectsFromArray:v8];

  uint64_t v9 = *MEMORY[0x263F081D0];
  id v13 = v6;
  v10 = [v5 decodeTopLevelObjectOfClasses:v7 forKey:v9 error:&v13];
  id v11 = v13;

  return v10;
}

- (SKScene)init
{
  return -[SKScene initWithSize:](self, "initWithSize:", 1.0, 1.0);
}

- (SKScene)initWithSize:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  v25.receiver = self;
  v25.super_class = (Class)SKScene;
  v5 = [(SKEffectNode *)&v25 init];
  id v6 = v5;
  if (v5)
  {
    [(SKEffectNode *)v5 setShouldEnableEffects:0];
    v6->_lastUpdate = -1.0;
    v6->_pausedTime = 0.0;
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    allChildenWithConstraints = v6->_allChildenWithConstraints;
    v6->_allChildenWithConstraints = (NSMutableArray *)v7;

    id v9 = objc_alloc_init(MEMORY[0x263F5E590]);
    [v9 setVelocityThreshold:0.1];
    [(SKScene *)v6 set_pkPhysicsWorld:v9];
    objc_storeStrong((id *)&v6->_physicsWorld, v9);
    LODWORD(v10) = 1041865114;
    LODWORD(v11) = 1.0;
    LODWORD(v12) = 1041865114;
    LODWORD(v13) = 1041865114;
    id v14 = objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v10, v12, v13, v11);
    [(SKScene *)v6 setBackgroundColor:v14];

    objc_storeWeak(&v6->_view, 0);
    v6->_bounds.origin.x = 0.0;
    v6->_bounds.origin.y = 0.0;
    v6->_bounds.size.double width = width;
    v6->_bounds.size.double height = height;
    CGSize v15 = v6->_bounds.size;
    v6->_visibleRect.origin = v6->_bounds.origin;
    v6->_visibleRect.size = v15;
    uint64_t v16 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    touchMap = v6->_touchMap;
    v6->_touchMap = (NSMapTable *)v16;

    -[SKScene setSize:](v6, "setSize:", width, height);
    -[SKScene setAnchorPoint:](v6, "setAnchorPoint:", 0.0, 0.0);
    [(SKNode *)v6 setUserInteractionEnabled:1];
    [(SKScene *)v6 set_usesExplicitRender:0];
    [(SKScene *)v6 set_usesExplicitUpdate:0];
    uint64_t v18 = +[SKPhysicsBody bodyWithCircleOfRadius:1.0];
    scenePinBody = v6->_scenePinBody;
    v6->_scenePinBody = (SKPhysicsBody *)v18;

    [(SKPhysicsBody *)v6->_scenePinBody setDynamic:0];
    [(SKPhysicsBody *)v6->_scenePinBody setCategoryBitMask:0];
    [v9 addBody:v6->_scenePinBody];
    skcSceneNode = (SKCNode *)v6->_skcSceneNode;
    *(float *)&unsigned int v21 = width;
    *(float *)&unsigned int v22 = height;
    long long v24 = __PAIR64__(v22, v21);
    SKCNode::setSize(skcSceneNode, &v24);
    [(SKScene *)v6 sceneDidLoad];
  }
  return v6;
}

- (SKScene)initWithCoder:(id)a3
{
  v73[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  v70.receiver = v5;
  v70.super_class = (Class)SKScene;
  v63 = v4;
  id v6 = [(SKEffectNode *)&v70 initWithCoder:v4];
  v62 = v6;
  if (v6) {
    BOOL v7 = v6 == v5;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    v8 = (void *)MEMORY[0x263EFFA08];
    v73[0] = objc_opt_class();
    v73[1] = objc_opt_class();
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:2];
    double v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_scenePinBody"];
    scenePinBody = v5->_scenePinBody;
    v5->_scenePinBody = (SKPhysicsBody *)v11;

    double v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Scene_bounds"];
    [v13 CGRectValue];
    v5->_bounds.origin.x = v14;
    v5->_bounds.origin.y = v15;
    v5->_bounds.size.double width = v16;
    v5->_bounds.size.double height = v17;

    uint64_t v18 = (void *)MEMORY[0x263F1C550];
    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backgroundColorR"];
    [v19 doubleValue];
    double v21 = v20;
    unsigned int v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backgroundColorG"];
    [v22 doubleValue];
    double v24 = v23;
    objc_super v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backgroundColorB"];
    [v25 doubleValue];
    double v27 = v26;
    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backgroundColorA"];
    [v28 doubleValue];
    float v29 = v21;
    *(float *)&double v30 = v24;
    *(float *)&double v31 = v27;
    *(float *)&double v33 = v32;
    *(float *)&double v32 = v29;
    v34 = objc_msgSend(v18, "colorWithComponentRGBA:", v32, v30, v31, v33);
    [(SKScene *)v5 setBackgroundColor:v34];

    -[SKScene setSize:](v5, "setSize:", v5->_bounds.size.width, v5->_bounds.size.height);
    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_anchorPoint"];
    [v35 CGPointValue];
    -[SKScene setAnchorPoint:](v5, "setAnchorPoint:");

    uint64_t v36 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    touchMap = v5->_touchMap;
    v5->_touchMap = (NSMapTable *)v36;

    uint64_t v38 = [MEMORY[0x263EFF980] array];
    allChildenWithConstraints = v5->_allChildenWithConstraints;
    v5->_allChildenWithConstraints = (NSMutableArray *)v38;

    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_visibleRect"];
    [v40 CGRectValue];
    v5->_visibleRect.origin.x = v41;
    v5->_visibleRect.origin.y = v42;
    v5->_visibleRect.size.double width = v43;
    v5->_visibleRect.size.double height = v44;

    v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_scaleMode"];
    -[SKScene setScaleMode:](v5, "setScaleMode:", (int)[v45 intValue]);

    v46 = (void *)MEMORY[0x263EFFA08];
    v72[0] = objc_opt_class();
    v72[1] = objc_opt_class();
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:2];
    v48 = [v46 setWithArray:v47];
    uint64_t v49 = [v4 decodeObjectOfClasses:v48 forKey:@"_physicsWorld"];
    physicsWorld = v5->_physicsWorld;
    v5->_physicsWorld = (SKPhysicsWorld *)v49;

    [(SKScene *)v5 set_pkPhysicsWorld:v5->_physicsWorld];
    [(SKNode *)v5 setUserInteractionEnabled:1];
    [(SKScene *)v5 set_usesExplicitRender:0];
    [(SKScene *)v5 set_usesExplicitUpdate:0];
    v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_camera"];
    [(SKScene *)v5 setCamera:v51];

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v52 = [(SKPhysicsWorld *)v5->_physicsWorld bodies];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v67 != v54) {
            objc_enumerationMutation(v52);
          }
          v56 = *(SKPhysicsBody **)(*((void *)&v66 + 1) + 8 * i);
          v57 = [(SKPhysicsBody *)v56 node];
          v58 = [v57 scene];
          if (v58 == v5)
          {
          }
          else
          {
            BOOL v59 = v56 == v5->_scenePinBody;

            if (!v59) {
              [(SKPhysicsWorld *)v5->_physicsWorld removeBody:v56];
            }
          }
        }
        uint64_t v53 = [v52 countByEnumeratingWithState:&v66 objects:v71 count:16];
      }
      while (v53);
    }

    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __25__SKScene_initWithCoder___block_invoke;
    v64[3] = &unk_263FEA020;
    v60 = v5;
    v65 = v60;
    [(SKNode *)v60 enumerateChildNodesWithName:@".//SKFieldNode" usingBlock:v64];
    [(SKNode *)v60 enumerateChildNodesWithName:@".//SKReferenceNode" usingBlock:&__block_literal_global_4];
    [(SKScene *)v60 sceneDidLoad];
  }
  return v62;
}

void __25__SKScene_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 304);
    id v4 = [v5 field];
    [v3 addField:v4];
  }
}

void __25__SKScene_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 resolveReferenceNode];
  }
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(AVAudioEngine *)self->_audioEngine reset];
  [(AVAudioEngine *)self->_audioEngine stop];
  audioEngine = self->_audioEngine;
  self->_audioEngine = 0;

  [(SKNode *)self _descendants];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeAllActions];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SKScene;
  [(SKNode *)&v8 dealloc];
}

- (BOOL)_hasConstraints
{
  return [(NSMutableArray *)self->_allChildenWithConstraints count] != 0;
}

- (void)_registerConstraintsForNode:(id)a3
{
}

- (void)_removeConstraintsForNode:(id)a3
{
}

- (UIColor)backgroundColor
{
  skcNode = self->super.super._skcNode;
  LODWORD(v2) = skcNode[76];
  LODWORD(v3) = skcNode[77];
  LODWORD(v4) = skcNode[78];
  LODWORD(v5) = skcNode[79];
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "colorWithComponentRGBA:", v2, v3, v4, v5);
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  double v4 = backgroundColor;
  [(UIColor *)v4 componentRGBA];
  skcNode = self->super.super._skcNode;
  DWORD1(v7) = v6;
  *((void *)&v7 + 1) = __PAIR64__(v9, v8);
  long long v10 = v7;
  (*(void (**)(void *, long long *))(*(void *)skcNode + 184))(skcNode, &v10);
}

- (CGPoint)convertPointFromParent:(CGPoint)a3
{
  v3.f32[0] = a3.x;
  float32_t y = a3.y;
  v3.f32[1] = y;
  v3.i32[2] = 0;
  v3.i32[3] = 1.0;
  float64x2_t v5 = vcvtq_f64_f32((float32x2_t)*(_OWORD *)&vmlsq_f32(v3, *((float32x4_t *)self->super.super._skcNode + 21), *((float32x4_t *)self->super.super._skcNode + 22)));
  double v6 = v5.f64[1];
  result.x = v5.f64[0];
  result.float32_t y = v6;
  return result;
}

- (CGPoint)convertPointToParent:(CGPoint)a3
{
  v3.f32[0] = a3.x;
  float32_t y = a3.y;
  v3.f32[1] = y;
  v3.i32[2] = 0;
  v3.i32[3] = 1.0;
  float64x2_t v5 = vcvtq_f64_f32((float32x2_t)*(_OWORD *)&vmlaq_f32(v3, *((float32x4_t *)self->super.super._skcNode + 21), *((float32x4_t *)self->super.super._skcNode + 22)));
  double v6 = v5.f64[1];
  result.x = v5.f64[0];
  result.float32_t y = v6;
  return result;
}

- (SKSceneScaleMode)scaleMode
{
  return *((void *)self->_skcSceneNode + 91);
}

- (void)setScaleMode:(SKSceneScaleMode)scaleMode
{
  *((void *)self->_skcSceneNode + 91) = scaleMode;
}

- (SKNode)listener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);

  return (SKNode *)WeakRetained;
}

- (void)setListener:(SKNode *)listener
{
}

- (void)handleAVAudioEngineInterruption:(id)a3
{
  id v6 = [(AVAudioEngine *)self->_audioEngine mainMixerNode];
  audioEngine = self->_audioEngine;
  float64x2_t v5 = [(SKScene *)self avAudioEnvironmentNode];
  [(AVAudioEngine *)audioEngine connect:v5 to:v6 format:0];

  [(SKScene *)self checkAudioEngine];
}

- (AVAudioEngine)audioEngine
{
  audioEngine = self->_audioEngine;
  if (!audioEngine)
  {
    double v4 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x263EF9360]);
    float64x2_t v5 = self->_audioEngine;
    self->_audioEngine = v4;

    id v6 = [(AVAudioEngine *)self->_audioEngine mainMixerNode];
    long long v7 = objc_opt_new();
    [(SKScene *)self frame];
    double v9 = v8;
    long long v10 = [v7 distanceAttenuationParameters];
    double v11 = v9 * 0.150000006;
    *(float *)&double v11 = v9 * 0.150000006;
    [v10 setReferenceDistance:v11];

    [(SKScene *)self frame];
    double v13 = v12;
    uint64_t v14 = [v7 distanceAttenuationParameters];
    *(float *)&double v15 = v13;
    [v14 setMaximumDistance:v15];

    objc_msgSend(v7, "setListenerPosition:", 0.0, 0.0, 0.0);
    [(AVAudioEngine *)self->_audioEngine attachNode:v7];
    [(AVAudioEngine *)self->_audioEngine connect:v7 to:v6 format:0];
    [(SKScene *)self setAvAudioEnvironmentNode:v7];
    CGFloat v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:self selector:sel_handleAVAudioEngineInterruption_ name:*MEMORY[0x263EF9020] object:self->_audioEngine];

    [(SKScene *)self checkAudioEngine];
    audioEngine = self->_audioEngine;
  }

  return audioEngine;
}

- (CGPoint)anchorPoint
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->super.super._skcNode + 352));
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.float32_t y = v3;
  return result;
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  double y = anchorPoint.y;
  double x = anchorPoint.x;
  skcNode = (SKCNode *)self->super.super._skcNode;
  *(float *)&unsigned int v7 = anchorPoint.x;
  *(float *)&unsigned int v8 = anchorPoint.y;
  long long v11 = __PAIR64__(v8, v7);
  SKCNode::setAnchor(skcNode, &v11);
  v9.n128_f64[0] = -(x * self->_bounds.size.width);
  CGFloat v10 = -(y * self->_bounds.size.height);
  *(void *)&self->_bounds.origin.double x = v9.n128_u64[0];
  self->_bounds.origin.double y = v10;
  v9.n128_f32[0] = v9.n128_f64[0];
  *(float *)&CGFloat v10 = v10;
  SKCNode::setTranslation((SKCNode *)self->super.super._skcNode, v9, *(float *)&v10);
  -[SKScene setVisibleRect:](self, "setVisibleRect:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  v3.receiver = self;
  v3.super_class = (Class)SKScene;
  [(SKEffectNode *)&v3 _didMakeBackingNode];
  self->_skcSceneNode = [(SKNode *)self _backingNode];
}

- (CGPoint)position
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
}

- (void)setScale:(double)a3
{
}

- (double)xScale
{
  return 1.0;
}

- (void)setXScale:(double)a3
{
}

- (double)yScale
{
  return 1.0;
}

- (void)setYScale:(double)a3
{
}

- (double)zRotation
{
  return 0.0;
}

- (void)setZRotation:(double)a3
{
}

- (double)zPosition
{
  return 0.0;
}

- (void)setZPosition:(double)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SKScene;
  [(SKEffectNode *)&v16 encodeWithCoder:v4];
  [v4 encodeObject:self->_scenePinBody forKey:@"_scenePinBody"];
  long long v15 = *((_OWORD *)self->_skcSceneNode + 19);
  float64x2_t v5 = objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&v15, (void)v15);
  [v4 encodeObject:v5 forKey:@"_backgroundColorR"];

  id v6 = [NSNumber numberWithDouble:*((float *)&v15 + 1)];
  [v4 encodeObject:v6 forKey:@"_backgroundColorG"];

  unsigned int v7 = [NSNumber numberWithDouble:*((float *)&v15 + 2)];
  [v4 encodeObject:v7 forKey:@"_backgroundColorB"];

  unsigned int v8 = [NSNumber numberWithDouble:*((float *)&v15 + 3)];
  [v4 encodeObject:v8 forKey:@"_backgroundColorA"];

  __n128 v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", 0.0, 0.0, self->_bounds.size.width, self->_bounds.size.height);
  [v4 encodeObject:v9 forKey:@"Scene_bounds"];

  CGFloat v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", self->_visibleRect.origin.x, self->_visibleRect.origin.y, self->_visibleRect.size.width, self->_visibleRect.size.height);
  [v4 encodeObject:v10 forKey:@"_visibleRect"];

  long long v11 = [(SKScene *)self camera];
  [v4 encodeObject:v11 forKey:@"_camera"];

  double v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[SKScene scaleMode](self, "scaleMode"));
  [v4 encodeObject:v12 forKey:@"_scaleMode"];

  [v4 encodeObject:self->_physicsWorld forKey:@"_physicsWorld"];
  double v13 = (void *)MEMORY[0x263F08D40];
  [(SKScene *)self anchorPoint];
  uint64_t v14 = objc_msgSend(v13, "valueWithCGPoint:");
  [v4 encodeObject:v14 forKey:@"_anchorPoint"];
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = (SKScene *)a3;
  if (self == v4)
  {
    BOOL v41 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float64x2_t v5 = v4;
      v43.receiver = self;
      v43.super_class = (Class)SKScene;
      if (![(SKEffectNode *)&v43 isEqualToNode:v5]) {
        goto LABEL_16;
      }
      id v6 = [(SKScene *)self backgroundColor];
      [v6 green];
      double v8 = v7;
      __n128 v9 = [(SKScene *)v5 backgroundColor];
      [v9 green];
      float v10 = v8;
      *(float *)&double v11 = v11;
      unsigned int v12 = COERCE_UNSIGNED_INT(v10 - *(float *)&v11) & 0x60000000;

      if (v12) {
        goto LABEL_16;
      }
      double v13 = [(SKScene *)self backgroundColor];
      [v13 red];
      double v15 = v14;
      objc_super v16 = [(SKScene *)v5 backgroundColor];
      [v16 red];
      float v17 = v15;
      *(float *)&double v18 = v18;
      unsigned int v19 = COERCE_UNSIGNED_INT(v17 - *(float *)&v18) & 0x60000000;

      if (v19) {
        goto LABEL_16;
      }
      double v20 = [(SKScene *)self backgroundColor];
      [v20 blue];
      double v22 = v21;
      double v23 = [(SKScene *)v5 backgroundColor];
      [v23 blue];
      float v24 = v22;
      *(float *)&double v25 = v25;
      unsigned int v26 = COERCE_UNSIGNED_INT(v24 - *(float *)&v25) & 0x60000000;

      if (v26) {
        goto LABEL_16;
      }
      double v27 = [(SKScene *)self backgroundColor];
      [v27 alpha];
      double v29 = v28;
      double v30 = [(SKScene *)v5 backgroundColor];
      [v30 alpha];
      float v31 = v29;
      *(float *)&double v32 = v32;
      unsigned int v33 = COERCE_UNSIGNED_INT(v31 - *(float *)&v32) & 0x60000000;

      if (v33
        || !CGRectEqualToRect(self->_bounds, v5->_bounds)
        || !CGRectEqualToRect(self->_visibleRect, v5->_visibleRect)
        || (SKSceneScaleMode v34 = [(SKScene *)self scaleMode], v34 != [(SKScene *)v5 scaleMode]))
      {
LABEL_16:
        BOOL v41 = 0;
      }
      else
      {
        [(SKScene *)self anchorPoint];
        double v36 = v35;
        double v38 = v37;
        [(SKScene *)v5 anchorPoint];
        BOOL v41 = v38 == v40 && v36 == v39;
      }
    }
    else
    {
      BOOL v41 = 0;
    }
  }

  return v41;
}

- (id)description
{
  double v3 = NSString;
  id v4 = [(SKNode *)self name];
  [(SKScene *)self frame];
  float64x2_t v5 = NSStringFromCGRect(v11);
  [(SKScene *)self anchorPoint];
  id v6 = NSStringFromCGPoint(v10);
  double v7 = [v3 stringWithFormat:@"<SKScene> name:'%@' frame:%@ anchor:%@", v4, v5, v6];

  return v7;
}

- (CGPoint)convertPointFromView:(CGPoint)point
{
  CGFloat y = point.y;
  CGFloat x = point.x;
  id WeakRetained = (SKView *)objc_loadWeakRetained(&self->_view);
  v12.CGFloat x = x;
  v12.CGFloat y = y;
  unint64_t v7 = CGPointConvertFromViewToScene(WeakRetained, self, v12).n128_u64[0];
  double v9 = v8;

  double v10 = *(double *)&v7;
  double v11 = v9;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (CGPoint)convertPointToView:(CGPoint)point
{
  CGFloat y = point.y;
  CGFloat x = point.x;
  id WeakRetained = (SKView *)objc_loadWeakRetained(&self->_view);
  v12.CGFloat x = x;
  v12.CGFloat y = y;
  unint64_t v7 = CGPointConvertFromSceneToView(self, WeakRetained, v12).n128_u64[0];
  double v9 = v8;

  double v10 = *(double *)&v7;
  double v11 = v9;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (void)setVisibleRectSize:(CGSize)a3
{
}

- (CGSize)visibleRectSize
{
  CGFloat x = self->_visibleRect.origin.x;
  CGFloat y = self->_visibleRect.origin.y;
  CGFloat width = self->_visibleRect.size.width;
  CGFloat height = self->_visibleRect.size.height;
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGFloat v6 = CGRectGetWidth(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double v7 = CGRectGetHeight(v11);
  double v8 = v6;
  result.CGFloat height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)setVisibleRectCenter:(CGPoint)a3
{
}

- (CGPoint)visibleRectCenter
{
  CGFloat x = self->_visibleRect.origin.x;
  CGFloat y = self->_visibleRect.origin.y;
  CGFloat width = self->_visibleRect.size.width;
  CGFloat height = self->_visibleRect.size.height;
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v11);
  double v8 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v8;
  return result;
}

- (CGSize)size
{
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  [(SKScene *)self size];
  double v7 = v6;
  double v9 = v8;
  self->_bounds.size.double width = width;
  self->_bounds.size.double height = height;
  [(SKScene *)self anchorPoint];
  self->_bounds.origin.CGFloat x = -(v10 * width);
  double v11 = self->_bounds.size.height;
  [(SKScene *)self anchorPoint];
  self->_bounds.origin.CGFloat y = -(v12 * v11);
  skcNode = (SKCNode *)self->super.super._skcNode;
  *(float *)&unsigned int v14 = width;
  *(float *)&double v12 = height;
  long long v19 = __PAIR64__(LODWORD(v12), v14);
  SKCNode::setSize(skcNode, &v19);
  double v15 = (SKCNode *)self->super.super._skcNode;
  [(SKScene *)self anchorPoint];
  *(float *)&double height = -(v16 * self->_bounds.size.width);
  [(SKScene *)self anchorPoint];
  v18.n128_f64[0] = -(v17 * self->_bounds.size.height);
  *(float *)&double v17 = v18.n128_f64[0];
  v18.n128_u32[0] = LODWORD(height);
  SKCNode::setTranslation(v15, v18, *(float *)&v17);
  -[SKScene setVisibleRect:](self, "setVisibleRect:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  -[SKScene didChangeSize:](self, "didChangeSize:", v7, v9);
}

- (CGRect)frame
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

+ (SKScene)sceneWithSize:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  float64x2_t v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSize:", size.width, size.height);
  if (width < 0.0 || height < 0.0)
  {
    double v6 = (void *)MEMORY[0x263EFF940];
    v10.double width = width;
    v10.double height = height;
    double v7 = NSStringFromCGSize(v10);
    [v6 raise:@"Invalid size specified", @"Invalid size specified: %@", v7 format];
  }

  return (SKScene *)v5;
}

+ (SKScene)sceneWithContentsOfFile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathExtension];
  if (![v4 length])
  {
    uint64_t v5 = [v3 stringByAppendingPathExtension:@"sks"];

    id v3 = (id)v5;
  }
  if ([v3 isAbsolutePath])
  {
    id v6 = v3;
  }
  else
  {
    double v7 = SKGetResourceBundle();
    id v6 = [v7 pathForResource:v3 ofType:0];
  }
  double v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
  if (v8)
  {
    id v13 = 0;
    double v9 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v8 error:&v13];
    id v10 = v13;
    [v9 setRequiresSecureCoding:0];
    double v11 = [v9 decodeObjectOfClass:objc_opt_class() forKey:@"scene"];
    if (!v11)
    {
      double v11 = [v9 decodeObjectOfClass:objc_opt_class() forKey:@"root"];
    }
  }
  else
  {
    double v11 = 0;
  }

  return (SKScene *)v11;
}

+ (SKScene)sceneWithContentsOfFile:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v6 = +[SKScene sceneWithContentsOfFile:a3];
  if (width <= 0.0 || height <= 0.0)
  {
    double v7 = (void *)MEMORY[0x263EFF940];
    v12.double width = width;
    v12.double height = height;
    double v8 = NSStringFromCGSize(v12);
    [v7 raise:@"Invalid size specified", @"Invalid size specified: %@", v8 format];
  }
  *(void *)(v6 + 216) = 0;
  *(void *)(v6 + 224) = 0;
  *(double *)(v6 + 232) = width;
  *(double *)(v6 + 240) = height;
  long long v9 = *(_OWORD *)(v6 + 232);
  *(_OWORD *)(v6 + 168) = *(_OWORD *)(v6 + 216);
  *(_OWORD *)(v6 + 184) = v9;
  objc_msgSend((id)v6, "setSize:", width, height);

  return (SKScene *)(id)v6;
}

- (SKPhysicsWorld)physicsWorld
{
  return self->_physicsWorld;
}

- (void)checkAudioEngine
{
  audioEngine = self->_audioEngine;
  if (audioEngine) {
    int v4 = [(AVAudioEngine *)audioEngine isRunning];
  }
  else {
    int v4 = 0;
  }
  id WeakRetained = objc_loadWeakRetained(&self->_view);

  if (!WeakRetained) {
    goto LABEL_7;
  }
  id v6 = objc_loadWeakRetained(&self->_view);
  char v7 = objc_opt_respondsToSelector();

  BOOL v8 = [(SKNode *)self isPaused];
  if (v7)
  {
    if (v8)
    {
LABEL_7:
      int v9 = 0;
      goto LABEL_10;
    }
    id v10 = objc_loadWeakRetained(&self->_view);
    int v9 = [v10 isPaused] ^ 1;
  }
  else
  {
    int v9 = !v8;
  }
LABEL_10:
  if (v4 != v9)
  {
    double v11 = self->_audioEngine;
    char v12 = v9 ^ 1;
    if (!v11) {
      char v12 = 1;
    }
    if (v12)
    {
      [(AVAudioEngine *)v11 pause];
    }
    else
    {
      uint64_t v13 = 0;
      [(AVAudioEngine *)v11 startAndReturnError:&v13];
    }
  }
}

- (void)_didMoveToView:(id)a3
{
  id v4 = a3;
  self->_lastUpdate = skCurrentTime();
  objc_storeWeak(&self->_view, v4);
  [(SKScene *)self checkAudioEngine];
  if (v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __26__SKScene__didMoveToView___block_invoke;
    v5[3] = &unk_263FEA020;
    v5[4] = self;
    [(SKNode *)self enumerateChildNodesWithName:@".//SKAudioNode" usingBlock:v5];
  }
  [(SKScene *)self didMoveToView:v4];
}

void __26__SKScene__didMoveToView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 _connectToScene:*(void *)(a1 + 32)];
  }
}

- (void)_update:(double)a3
{
  uint64_t v406 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)self->_skcSceneNode + 172))
  {
    double v4 = CACurrentMediaTime();
    _perfBeginClientUpdate(v4);
    v371 = self;
    uint64_t v5 = [(SKScene *)self view];
    if (sk_debug_get_optional()) {
      kdebug_trace();
    }

    id v6 = [(SKScene *)v371 delegate];
    if (v6
      && ([(SKScene *)v371 delegate],
          char v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = objc_opt_respondsToSelector(),
          v7,
          v6,
          (v8 & 1) != 0))
    {
      int v9 = [(SKScene *)v371 delegate];
      [v9 update:v371 forScene:a3];

      id v10 = v371;
    }
    else
    {
      id v10 = v371;
      [(SKScene *)v371 update:a3];
    }
    double v11 = [(SKScene *)v10 view];
    if (sk_debug_get_optional()) {
      kdebug_trace();
    }

    if (v371->_lastUpdate < 0.0) {
      v371->_lastUpdate = a3;
    }
    double v12 = CACurrentMediaTime();
    _perfBeginActions(v12);
    uint64_t v13 = [(SKScene *)v371 view];
    if (sk_debug_get_optional()) {
      kdebug_trace();
    }

    if (SKCNode::matchesAnyFlags((SKCNode *)v371->_skcSceneNode, 32, 32))
    {
      v399.receiver = v371;
      v399.super_class = (Class)SKScene;
      [(SKNode *)&v399 _update:a3];
    }
    else
    {
      unsigned int v14 = [(SKScene *)v371 view];
      kdebug_trace();
    }
    double v15 = [(SKScene *)v371 view];
    if (sk_debug_get_optional()) {
      kdebug_trace();
    }

    double v16 = CACurrentMediaTime();
    _perfEndActions(v16);
    SKCRendererRemoveCompletedSoundSources();
    if (a3 - *(double *)((char *)&v371->super.super.super.super.isa + v366) <= 0.00000011920929) {
      double v17 = 0.0166666675;
    }
    else {
      double v17 = a3 - *(double *)((char *)&v371->super.super.super.super.isa + v366);
    }
    location = (id *)&v371->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&v371->_delegate);
    if (WeakRetained
      && (id v19 = objc_loadWeakRetained(location),
          char v20 = objc_opt_respondsToSelector(),
          v19,
          WeakRetained,
          (v20 & 1) != 0))
    {
      id v21 = objc_loadWeakRetained(location);
      [v21 didEvaluateActionsForScene:v371];
    }
    else
    {
      [(SKScene *)v371 didEvaluateActions];
    }
    if (![(SKNode *)v371 isPaused])
    {
      if (SKCNode::matchesAnyFlags((SKCNode *)v371->_skcSceneNode, 8, 8))
      {
        double v22 = CACurrentMediaTime();
        _perfBeginPhysics(v22);
        double v23 = [(SKScene *)v371 view];
        if (sk_debug_get_optional()) {
          kdebug_trace();
        }

        long long v397 = 0u;
        long long v398 = 0u;
        long long v395 = 0u;
        long long v396 = 0u;
        id obj = [(SKPhysicsWorld *)v371->_physicsWorld bodies];
        uint64_t v374 = [obj countByEnumeratingWithState:&v395 objects:v405 count:16];
        if (v374)
        {
          uint64_t v372 = *(void *)v396;
          do
          {
            for (id i = 0; i != (id)v374; id i = (char *)i + 1)
            {
              if (*(void *)v396 != v372) {
                objc_enumerationMutation(obj);
              }
              float v24 = *(void **)(*((void *)&v395 + 1) + 8 * i);
              double v25 = [v24 representedObject];
              if (v25)
              {
                id v376 = v25;
                unsigned int v26 = (_OWORD *)[v25 _backingNode];
                long long v388 = 0uLL;
                SKCNode::resolveWorldPositionRotationAndScale(v26, &v388, 0, 0);
                (*(void (**)(_OWORD *))(*(void *)v26 + 200))(v26);
                double v27 = [v376 parent];
                double v28 = [v27 physicsBody];
                if (!v28) {
                  double v28 = v371->_scenePinBody;
                }
                long long v393 = 0u;
                long long v394 = 0u;
                long long v391 = 0u;
                long long v392 = 0u;
                double v29 = [v24 _joints];
                id v30 = (id)[v29 countByEnumeratingWithState:&v391 objects:v404 count:16];
                if (v30)
                {
                  uint64_t v31 = *(void *)v392;
                  while (2)
                  {
                    for (j = 0; j != v30; j = (char *)j + 1)
                    {
                      if (*(void *)v392 != v31) {
                        objc_enumerationMutation(v29);
                      }
                      unsigned int v33 = *(void **)(*((void *)&v391 + 1) + 8 * (void)j);
                      int v34 = [v33 _implicit];
                      if (v27) {
                        int v35 = v34;
                      }
                      else {
                        int v35 = 0;
                      }
                      if (v35 == 1)
                      {
                        double v36 = [v33 bodyA];
                        if (v36 == v28)
                        {

LABEL_53:
                          id v30 = v33;
                          goto LABEL_54;
                        }
                        double v37 = [v33 bodyB];
                        BOOL v38 = v37 == v28;

                        if (v38) {
                          goto LABEL_53;
                        }
                      }
                    }
                    id v30 = (id)[v29 countByEnumeratingWithState:&v391 objects:v404 count:16];
                    if (v30) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_54:

                if (![v24 pinned])
                {
                  if (v30) {
                    [(SKPhysicsWorld *)v371->_physicsWorld removeJoint:v30];
                  }
                  goto LABEL_70;
                }
                if ([v24 allowsRotation])
                {
                  if (!v30) {
                    goto LABEL_59;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    [(SKPhysicsWorld *)v371->_physicsWorld removeJoint:v30];

LABEL_59:
                    if (v28)
                    {
                      double v39 = +[SKPhysicsJointPin jointWithBodyA:bodyB:anchor:](SKPhysicsJointPin, "jointWithBodyA:bodyB:anchor:", v28, v24, *(float *)&v388, *((float *)&v388 + 1));
                      [v39 setFrictionTorque:0.0];
                      objc_msgSend(v39, "set_implicit:", 1);
                      [(SKPhysicsWorld *)v371->_physicsWorld addJoint:v39];
                      goto LABEL_68;
                    }
                    goto LABEL_69;
                  }
                }
                else
                {
                  if (v30)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      goto LABEL_70;
                    }
                    [(SKPhysicsWorld *)v371->_physicsWorld removeJoint:v30];
                  }
                  if (v28)
                  {
                    double v39 = +[SKPhysicsJointFixed jointWithBodyA:bodyB:anchor:](SKPhysicsJointFixed, "jointWithBodyA:bodyB:anchor:", v28, v24, *(float *)&v388, *((float *)&v388 + 1));
                    objc_msgSend(v39, "set_implicit:", 1);
                    [(SKPhysicsWorld *)v371->_physicsWorld addJoint:v39];
LABEL_68:
                  }
LABEL_69:
                  id v30 = 0;
                }
LABEL_70:

                double v25 = v376;
              }
            }
            uint64_t v374 = [obj countByEnumeratingWithState:&v395 objects:v405 count:16];
          }
          while (v374);
        }

        MEMORY[0x21052E950](&v388, [(PKPhysicsWorld *)v371->__pkPhysicsWorld aether]);
        v403[0] = &unk_26BEEDA30;
        v403[3] = v403;
        double v40 = (uint64_t *)__p;
        BOOL v41 = v390;
        while (v40 != v41)
          std::function<void ()(PKCField *)>::operator()((uint64_t)v403, *v40++);
        std::__function::__value_func<void ()(PKCField *)>::~__value_func[abi:ne180100](v403);
        float v43 = v17;
        [(SKPhysicsWorld *)v371->_physicsWorld stepWithTime:8 velocityIterations:3 positionIterations:fminf(v43, 1.0)];
        CGFloat v44 = [(SKScene *)v371 view];
        if (sk_debug_get_optional()) {
          kdebug_trace();
        }

        double v45 = CACurrentMediaTime();
        _perfEndPhysics(v45);
        if (__p)
        {
          v390 = (uint64_t *)__p;
          operator delete(__p);
        }
        v400 = (void **)&v388;
        std::vector<std::shared_ptr<PKCField>>::__destroy_vector::operator()[abi:ne180100](&v400);
      }
      else
      {
        CGFloat v42 = [(SKScene *)v371 view];
        kdebug_trace();
      }
    }
    id v46 = objc_loadWeakRetained(location);
    if (v46
      && (id v47 = objc_loadWeakRetained(location),
          char v48 = objc_opt_respondsToSelector(),
          v47,
          v46,
          (v48 & 1) != 0))
    {
      id v49 = objc_loadWeakRetained(location);
      [v49 didSimulatePhysicsForScene:v371];
    }
    else
    {
      [(SKScene *)v371 didSimulatePhysics];
    }
    double v50 = CACurrentMediaTime();
    _perfBeginConstraints(v50);
    v51 = [(SKScene *)v371 view];
    if (sk_debug_get_optional()) {
      kdebug_trace();
    }

    long long v386 = 0u;
    long long v387 = 0u;
    long long v384 = 0u;
    long long v385 = 0u;
    obja = v371->_allChildenWithConstraints;
    uint64_t v52 = [(NSMutableArray *)obja countByEnumeratingWithState:&v384 objects:v402 count:16];
    if (v52)
    {
      uint64_t v373 = *(void *)v385;
      do
      {
        uint64_t v53 = 0;
        v375 = (char *)v52;
        do
        {
          if (*(void *)v385 != v373) {
            objc_enumerationMutation(obja);
          }
          uint64_t v54 = *(void **)(*((void *)&v384 + 1) + 8 * (void)v53);
          v55 = [v54 constraints];
          v377 = v53;
          BOOL v56 = v55 == 0;

          if (!v56)
          {
            long long v382 = 0u;
            long long v383 = 0u;
            long long v380 = 0u;
            long long v381 = 0u;
            v57 = [v54 constraints];
            uint64_t v58 = [v57 countByEnumeratingWithState:&v380 objects:v401 count:16];
            if (!v58) {
              goto LABEL_198;
            }
            uint64_t v59 = *(void *)v381;
            id v379 = v57;
            while (1)
            {
              uint64_t v60 = 0;
              do
              {
                if (*(void *)v381 != v59) {
                  objc_enumerationMutation(v379);
                }
                v61 = *(void **)(*((void *)&v380 + 1) + 8 * v60);
                if ([v61 enabled])
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v62 = v61;
                    v63 = [v62 referenceNode];
                    BOOL v64 = v63 == 0;

                    if (!v64)
                    {
                      [v54 position];
                      double v66 = v65;
                      double v68 = v67;
                      long long v69 = [v62 referenceNode];
                      objc_super v70 = [v54 parent];
                      objc_msgSend(v69, "convertPoint:fromNode:", v70, v66, v68);
                      double v72 = v71;
                      double v74 = v73;

                      v75 = [v62 referenceNode];
                      v76 = [v54 parent];
                      objc_msgSend(v75, "convertPoint:fromNode:", v76, v66 + 1.0, v68 + 0.0);
                      double v78 = v77;
                      double v80 = v79;

                      [v54 zRotation];
                      double v82 = v81;
                      double v83 = atan2(-(v78 - v72), v80 - v74);
                      v84 = [v62 zRotationRange];
                      [v84 lowerLimit];
                      double v86 = v85;
                      v87 = [v62 zRotationRange];
                      [v87 upperLimit];
                      float v88 = v82 + v83;
                      float v91 = v90;
                      if (v88 <= v91) {
                        float v91 = v82 + v83;
                      }
                      float v89 = v86;
                      if (v91 >= v89) {
                        float v92 = v91;
                      }
                      else {
                        float v92 = v86;
                      }
LABEL_107:

                      __double2 v93 = __sincos_stret(v92);
                      v94 = [v62 referenceNode];
                      v95 = [v54 parent];
                      objc_msgSend(v94, "convertPoint:toNode:", v95, v72 + v93.__cosval, v74 + v93.__sinval);
                      double v97 = v96;
                      double v99 = v98;

                      [v54 position];
                      double v101 = v100;
                      [v54 position];
                      objc_msgSend(v54, "setZRotation:", (double)(atan2(-(v97 - v101), v99 - v102) + 1.57079633));
                      goto LABEL_175;
                    }
                    [v54 zRotation];
                    double v176 = v175;
                    v177 = [v62 zRotationRange];
                    [v177 lowerLimit];
                    double v179 = v178;
                    v180 = [v62 zRotationRange];
                    [v180 upperLimit];
                    float v181 = v176;
                    float v184 = v183;
                    if (v181 <= v184) {
                      float v184 = v176;
                    }
                    float v182 = v179;
                    if (v184 < v182) {
                      float v184 = v179;
                    }
                    goto LABEL_173;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v103 = v61;
                    v104 = [v103 referenceNode];
                    BOOL v105 = v104 == 0;

                    if (v105)
                    {
                      [v54 position];
                      double v230 = v229;
                      v177 = [v103 xRange];
                      [v177 lowerLimit];
                      double v232 = v231;
                      v180 = [v103 xRange];
                      [v180 upperLimit];
                      float v233 = v230;
                      float v236 = v235;
                      if (v233 <= v236) {
                        float v236 = v230;
                      }
                      float v234 = v232;
                      if (v236 >= v234) {
                        float v237 = v236;
                      }
                      else {
                        float v237 = v232;
                      }
                      [v54 position];
                      double v239 = v238;
                      v240 = [v103 yRange];
                      [v240 lowerLimit];
                      double v242 = v241;
                      v243 = [v103 yRange];
                      [v243 upperLimit];
                      float v244 = v239;
                      float v247 = v246;
                      if (v244 <= v247) {
                        float v247 = v239;
                      }
                      float v245 = v242;
                      if (v247 < v245) {
                        float v247 = v242;
                      }
                      objc_msgSend(v54, "setPosition:", v237, v247);

                      goto LABEL_174;
                    }
                    [v54 position];
                    double v107 = v106;
                    double v109 = v108;
                    v110 = [v103 referenceNode];
                    v111 = [v54 parent];
                    objc_msgSend(v110, "convertPoint:fromNode:", v111, v107, v109);
                    double v113 = v112;
                    double v115 = v114;

                    v116 = [v103 xRange];
                    [v116 lowerLimit];
                    double v118 = v117;
                    v119 = [v103 xRange];
                    [v119 upperLimit];
                    float v120 = v113;
                    float v123 = v122;
                    if (v120 <= v123) {
                      float v123 = v113;
                    }
                    float v121 = v118;
                    if (v123 >= v121) {
                      float v124 = v123;
                    }
                    else {
                      float v124 = v118;
                    }
                    v125 = [v103 yRange];
                    [v125 lowerLimit];
                    double v127 = v126;
                    v128 = [v103 yRange];
                    [v128 upperLimit];
                    float v129 = v115;
                    float v132 = v131;
                    if (v129 <= v132) {
                      float v132 = v115;
                    }
                    float v130 = v127;
                    if (v132 >= v130) {
                      float v133 = v132;
                    }
                    else {
                      float v133 = v127;
                    }

                    v134 = [v103 referenceNode];
                    v135 = [v54 parent];
                    objc_msgSend(v134, "convertPoint:toNode:", v135, v124, v133);
                    double v137 = v136;
                    double v139 = v138;

                    objc_msgSend(v54, "setPosition:", v137, v139);
LABEL_175:

                    goto LABEL_176;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v62 = v61;
                    v140 = [v62 referenceNode];
                    BOOL v141 = v140 == 0;

                    if (!v141)
                    {
                      [v62 point];
                      double v143 = v142;
                      double v145 = v144;
                      v146 = [v62 node];
                      BOOL v147 = v146 == 0;

                      if (!v147)
                      {
                        v148 = [v54 parent];
                        v149 = [v62 node];
                        objc_msgSend(v148, "convertPoint:fromNode:", v149, v143, v145);
                        double v143 = v150;
                        double v145 = v151;
                      }
                      [v54 position];
                      double v153 = v152;
                      double v155 = v154;
                      v156 = [v62 referenceNode];
                      v157 = [v54 parent];
                      objc_msgSend(v156, "convertPoint:fromNode:", v157, v143, v145);
                      double v159 = v158;
                      double v161 = v160;

                      v162 = [v62 referenceNode];
                      v163 = [v54 parent];
                      objc_msgSend(v162, "convertPoint:fromNode:", v163, v153, v155);
                      double v72 = v164;
                      double v74 = v165;

                      double v166 = atan2(-(v159 - v72), v161 - v74);
                      [v54 zRotation];
                      double v168 = v167;
                      v84 = [v62 offset];
                      [v84 lowerLimit];
                      double v170 = v169;
                      v87 = [v62 offset];
                      [v87 upperLimit];
                      float v171 = v168;
                      float v174 = v166 + 1.57079633 + v173;
                      if (v171 <= v174) {
                        float v174 = v168;
                      }
                      float v172 = v166 + 1.57079633 + v170;
                      if (v174 >= v172) {
                        float v92 = v174;
                      }
                      else {
                        float v92 = v166 + 1.57079633 + v170;
                      }
                      goto LABEL_107;
                    }
                    [v62 point];
                    double v272 = v271;
                    double v274 = v273;
                    v275 = [v62 node];
                    BOOL v276 = v275 == 0;

                    if (!v276)
                    {
                      v277 = [v54 parent];
                      v278 = [v62 node];
                      objc_msgSend(v277, "convertPoint:fromNode:", v278, v272, v274);
                      double v272 = v279;
                      double v274 = v280;
                    }
                    [v54 position];
                    double v283 = atan2(-(v272 - v281), v274 - v282);
                    [v54 zRotation];
                    double v285 = v284;
                    v177 = [v62 offset];
                    [v177 lowerLimit];
                    double v287 = v286;
                    v180 = [v62 offset];
                    [v180 upperLimit];
                    float v288 = v285;
                    float v184 = v283 + 1.57079633 + v290;
                    if (v288 <= v184) {
                      float v184 = v285;
                    }
                    float v289 = v283 + 1.57079633 + v287;
                    if (v184 < v289) {
                      float v184 = v283 + 1.57079633 + v287;
                    }
LABEL_173:
                    [v54 setZRotation:v184];
                    goto LABEL_174;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v185 = v61;
                    v186 = [v185 referenceNode];
                    BOOL v187 = v186 == 0;

                    if (v187)
                    {
                      [v185 point];
                      double v315 = v314;
                      double v317 = v316;
                      v318 = [v185 node];
                      BOOL v319 = v318 == 0;

                      if (!v319)
                      {
                        v320 = [v54 parent];
                        v321 = [v185 node];
                        objc_msgSend(v320, "convertPoint:fromNode:", v321, v315, v317);
                        double v315 = v322;
                        double v317 = v323;
                      }
                      [v54 position];
                      double v325 = v324;
                      double v327 = v326;
                      v328 = [v185 distanceRange];
                      [v328 lowerLimit];
                      double v330 = v329;
                      v331 = [v185 distanceRange];
                      [v331 upperLimit];
                      double v333 = v332;

                      float v334 = v317;
                      float v335 = v315;
                      float v336 = v325;
                      float v337 = v327;
                      float v338 = v335 - v336;
                      float v339 = v334 - v337;
                      float v340 = sqrtf((float)(v339 * v339) + (float)(v338 * v338));
                      if (v340 > 0.0)
                      {
                        float v341 = fmax(v330, 0.0);
                        float v342 = v333;
                        if (v340 <= v342) {
                          float v342 = v340;
                        }
                        if (v342 >= v341) {
                          float v341 = v342;
                        }
                        objc_msgSend(v54, "setPosition:", (float)((float)((float)(v338 * (float)(1.0 / v340)) * (float)(v340 - v341)) + v336), (float)((float)((float)(v339 * (float)(1.0 / v340)) * (float)(v340 - v341)) + v337));
                      }
                    }
                    else
                    {
                      [v185 point];
                      double v189 = v188;
                      double v191 = v190;
                      v192 = [v185 node];
                      BOOL v193 = v192 == 0;

                      if (!v193)
                      {
                        v194 = [v54 parent];
                        v195 = [v185 node];
                        objc_msgSend(v194, "convertPoint:fromNode:", v195, v189, v191);
                        double v189 = v196;
                        double v191 = v197;
                      }
                      [v54 position];
                      double v199 = v198;
                      double v201 = v200;
                      v202 = [v185 referenceNode];
                      v203 = [v54 parent];
                      objc_msgSend(v202, "convertPoint:fromNode:", v203, v189, v191);
                      double v205 = v204;
                      double v207 = v206;

                      v208 = [v185 referenceNode];
                      v209 = [v54 parent];
                      objc_msgSend(v208, "convertPoint:fromNode:", v209, v199, v201);
                      double v211 = v210;
                      double v213 = v212;

                      v214 = [v185 distanceRange];
                      [v214 lowerLimit];
                      double v216 = v215;
                      v217 = [v185 distanceRange];
                      [v217 upperLimit];
                      float v218 = v205;
                      float v219 = v207;
                      float v220 = v211;
                      float v221 = v213;
                      float v222 = v218 - v220;
                      float v223 = v219 - v221;
                      float v224 = sqrtf((float)(v223 * v223) + (float)(v222 * v222));
                      float v225 = fmax(v216, 0.0);
                      float v227 = v226;
                      if (v224 <= v227) {
                        float v227 = v224;
                      }
                      if (v227 >= v225) {
                        float v228 = v227;
                      }
                      else {
                        float v228 = v225;
                      }

                      v177 = [v185 referenceNode];
                      v180 = [v54 parent];
                      objc_msgSend(v177, "convertPoint:toNode:", v180, (float)((float)((float)(v222 * (float)(1.0 / v224)) * (float)(v224 - v228)) + v220), (float)((float)((float)(v223 * (float)(1.0 / v224)) * (float)(v224 - v228)) + v221));
                      objc_msgSend(v54, "setPosition:");
LABEL_174:
                    }
                    goto LABEL_175;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v248 = v61;
                    [v54 size];
                    double v250 = v249;
                    double v252 = v251;
                    v253 = [v248 widthRange];
                    [v253 lowerLimit];
                    double v255 = v254;
                    v256 = [v248 widthRange];
                    [v256 upperLimit];
                    float v257 = v250;
                    float v260 = v259;
                    if (v257 <= v260) {
                      float v260 = v250;
                    }
                    float v258 = v255;
                    if (v260 >= v258) {
                      float v261 = v260;
                    }
                    else {
                      float v261 = v255;
                    }

                    v262 = [v248 heightRange];
                    [v262 lowerLimit];
                    double v264 = v263;
                    v265 = [v248 heightRange];
                    [v265 upperLimit];
                    float v266 = v252;
                    float v269 = v268;
                    if (v266 <= v269) {
                      float v269 = v252;
                    }
                    float v267 = v264;
                    if (v269 >= v267) {
                      float v270 = v269;
                    }
                    else {
                      float v270 = v264;
                    }

                    objc_msgSend(v54, "setSize:", v261, v270);
                    goto LABEL_175;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v291 = v61;
                    [v54 xScale];
                    double v293 = v292;
                    [v54 yScale];
                    double v295 = v294;
                    v296 = [v291 xRange];
                    [v296 lowerLimit];
                    double v298 = v297;
                    v299 = [v291 xRange];
                    [v299 upperLimit];
                    float v300 = v293;
                    float v303 = v302;
                    if (v300 <= v303) {
                      float v303 = v293;
                    }
                    float v301 = v298;
                    if (v303 >= v301) {
                      float v304 = v303;
                    }
                    else {
                      float v304 = v298;
                    }

                    v305 = [v291 yRange];
                    [v305 lowerLimit];
                    double v307 = v306;
                    v308 = [v291 yRange];
                    [v308 upperLimit];
                    double v310 = v309;

                    [v54 setXScale:v304];
                    float v311 = v295;
                    float v313 = v310;
                    if (v311 > v313) {
                      float v311 = v310;
                    }
                    float v312 = v307;
                    if (v311 < v312) {
                      float v311 = v307;
                    }
                    [v54 setYScale:v311];
                    goto LABEL_175;
                  }
                }
LABEL_176:
                ++v60;
              }
              while (v58 != v60);
              v57 = v379;
              uint64_t v343 = [v379 countByEnumeratingWithState:&v380 objects:v401 count:16];
              uint64_t v58 = v343;
              if (!v343)
              {
LABEL_198:

                break;
              }
            }
          }
          uint64_t v53 = v377 + 1;
        }
        while (v377 + 1 != v375);
        uint64_t v52 = [(NSMutableArray *)obja countByEnumeratingWithState:&v384 objects:v402 count:16];
      }
      while (v52);
    }

    v344 = [(SKScene *)v371 view];
    if (sk_debug_get_optional()) {
      kdebug_trace();
    }

    double v345 = CACurrentMediaTime();
    _perfEndConstraints(v345);
    id v346 = objc_loadWeakRetained(location);
    if (v346
      && (id v347 = objc_loadWeakRetained(location),
          char v348 = objc_opt_respondsToSelector(),
          v347,
          v346,
          (v348 & 1) != 0))
    {
      id v349 = objc_loadWeakRetained(location);
      [v349 didApplyConstraintsForScene:v371];
    }
    else
    {
      [(SKScene *)v371 didApplyConstraints];
    }
    id v350 = objc_loadWeakRetained(location);
    if (v350
      && (id v351 = objc_loadWeakRetained(location),
          char v352 = objc_opt_respondsToSelector(),
          v351,
          v350,
          (v352 & 1) != 0))
    {
      id v353 = objc_loadWeakRetained(location);
      [v353 didFinishUpdateForScene:v371];
    }
    else
    {
      [(SKScene *)v371 didFinishUpdate];
    }
    double v354 = CACurrentMediaTime();
    _perfEndClientUpdate(v354);
    v355 = v371;
    if (v371->_audioEngine)
    {
      id v356 = objc_loadWeakRetained((id *)&v371->_listener);
      v357 = v356;
      if (v356)
      {
        objc_msgSend(v356, "convertPoint:toNode:", v371, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      }
      else
      {
        [(SKScene *)v371 frame];
        double MidX = CGRectGetMidX(v407);
        [(SKScene *)v371 frame];
        objc_msgSend(0, "convertPoint:toNode:", v371, MidX, CGRectGetMidY(v408));
      }
      double v361 = v358;
      double v362 = v359;
      v363 = [(SKScene *)v371 avAudioEnvironmentNode];
      *(float *)&double v364 = v362;
      *(float *)&double v365 = v361;
      objc_msgSend(v363, "setListenerPosition:", v365, v364, 0.0);

      v355 = v371;
    }
    *(double *)((char *)&v355->super.super.super.super.isa + v366) = a3;
  }
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SKNode *)self isPaused] != a3)
  {
    double v5 = skCurrentTime();
    uint64_t v6 = 160;
    if (!v3)
    {
      uint64_t v6 = 152;
      double v5 = v5 - self->_pausedTime + self->_lastUpdate;
    }
    *(double *)((char *)&self->super.super.super.super.isa + v6) = v5;
  }
  v7.receiver = self;
  v7.super_class = (Class)SKScene;
  [(SKNode *)&v7 setPaused:v3];
  [(SKScene *)self checkAudioEngine];
}

- (SKView)view
{
  id WeakRetained = objc_loadWeakRetained(&self->_view);

  return (SKView *)WeakRetained;
}

+ (id)debugHierarchyPropertyDescriptions
{
  v18[9] = *MEMORY[0x263EF8340];
  double v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  BOOL v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"propertyName", @"audioEngine");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"objectInfo");
  v18[0] = Mutable;
  double v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, @"propertyName", @"backgroundColor");
  CFDictionaryAddValue(v5, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v5, @"propertyFormat", @"color");
  v18[1] = v5;
  uint64_t v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v6, @"propertyName", @"camera");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v6, @"propertyFormat", @"objectInfo");
  v18[2] = v6;
  objc_super v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v7, @"propertyName", @"delegate");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v7, @"propertyFormat", @"objectInfo");
  v18[3] = v7;
  char v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v8, @"propertyName", @"listener");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v8, @"propertyFormat", @"objectInfo");
  v18[4] = v8;
  int v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v9, @"propertyName", @"physicsWorld");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v9, @"propertyFormat", @"objectInfo");
  v18[5] = v9;
  id v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v10, @"propertyName", @"size");
  CFDictionaryAddValue(v10, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v10, @"propertyFormat", @"CGf, CGf");
  v18[6] = v10;
  double v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v11, @"propertyName", @"scaleMode");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"SKSceneScaleMode");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeEnum");
  CFDictionaryAddValue(v11, @"propertyFormat", @"integer");
  v18[7] = v11;
  double v12 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v12, @"propertyName", @"visualRepresentation");
  CFDictionaryAddValue(v12, @"propertyRuntimeType", @"CGColor");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeColor");
  CFDictionaryAddValue(v12, @"propertyFormat", @"color");
  uint64_t valuePtr = 8;
  CFNumberRef v13 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v12, @"visibility", v13);
  CFRelease(v13);
  uint64_t valuePtr = 1;
  CFNumberRef v14 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v12, @"propertyOptions", v14);
  CFRelease(v14);
  v18[8] = v12;
  double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:9];

  return v15;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  v68[3] = *MEMORY[0x263EF8340];
  id v65 = a3;
  id v66 = a4;
  if ([v65 isEqualToString:@"backgroundColor"])
  {
    CGColorSpaceRef v8 = [v66 backgroundColor];
    int v9 = (CGColor *)[(CGColorSpace *)v8 CGColor];
    if (v9)
    {
      Mutable = CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      space = CGColorGetColorSpace(v9);
      CFStringRef v11 = CGColorSpaceCopyName(space);
      size_t NumberOfComponents = CGColorGetNumberOfComponents(v9);
      uint64_t v13 = NumberOfComponents << 32;
      CFIndex v14 = (int)NumberOfComponents;
      if (NumberOfComponents << 32)
      {
        double v15 = CFStringCreateMutable(0, 0);
        CGColorSpaceRef v61 = v8;
        CFIndex v16 = v14 - 1;
        if ((unint64_t)v14 <= 1) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = v14;
        }
        do
        {
          CFStringAppend(v15, @"CGf");
          if (v16) {
            CFStringAppend(v15, @", ");
          }
          --v16;
          --v17;
        }
        while (v17);
        CGColorSpaceRef v8 = v61;
      }
      else
      {
        double v15 = &stru_26BEEFD10;
      }
      Components = CGColorGetComponents(v9);
      double v32 = (const void **)malloc_type_malloc(v13 >> 29, 0x6004044C4A2DFuLL);
      unsigned int v33 = v32;
      if (v13 >= 1)
      {
        if (v14 <= 1) {
          uint64_t v34 = 1;
        }
        else {
          uint64_t v34 = v14;
        }
        int v35 = (CFNumberRef *)v32;
        do
        {
          *v35++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
          --v34;
        }
        while (v34);
      }
      CFArrayRef v36 = CFArrayCreate(0, v33, v14, MEMORY[0x263EFFF70]);
      if (v13 >= 1)
      {
        if (v14 <= 1) {
          uint64_t v37 = 1;
        }
        else {
          uint64_t v37 = v14;
        }
        BOOL v38 = v33;
        do
        {
          CFRelease(*v38++);
          --v37;
        }
        while (v37);
      }
      free(v33);
      CGColorSpaceGetModel(space);
      if (v36) {
        CFDictionaryAddValue(Mutable, @"componentValues", v36);
      }
      if (v15) {
        CFDictionaryAddValue(Mutable, @"componentValuesFormat", v15);
      }
      if (v11) {
        CFDictionaryAddValue(Mutable, @"colorSpaceName", v11);
      }
      if (v36) {
        CFRelease(v36);
      }
      if (v11) {
        CFRelease(v11);
      }
      if (v15) {
        CFRelease(v15);
      }
    }
    else
    {
      Mutable = 0;
    }

    id v21 = Mutable;
    goto LABEL_99;
  }
  if (![v65 isEqualToString:@"visualRepresentation"])
  {
    id v28 = v66;
    double v29 = (NSString *)v65;
    if ([(NSString *)v29 length])
    {
      NSSelectorFromString(v29);
      if (objc_opt_respondsToSelector())
      {
        id v30 = v29;
        if (v30)
        {
LABEL_25:
          id v21 = [v28 valueForKey:v30];
LABEL_71:

          goto LABEL_99;
        }
      }
      else
      {
        if ([(NSString *)v29 length] < 2)
        {
          CGFloat v42 = [(NSString *)v29 uppercaseString];
        }
        else
        {
          double v39 = [(NSString *)v29 substringToIndex:1];
          double v40 = [v39 uppercaseString];
          BOOL v41 = [(NSString *)v29 substringFromIndex:1];
          CGFloat v42 = [v40 stringByAppendingString:v41];
        }
        float v43 = [@"is" stringByAppendingString:v42];
        NSSelectorFromString(v43);
        if (objc_opt_respondsToSelector()) {
          id v30 = v43;
        }
        else {
          id v30 = 0;
        }

        if (v30) {
          goto LABEL_25;
        }
      }
    }
    if (a6)
    {
      id v44 = v28;
      double v45 = v29;
      if (v44)
      {
        id v46 = [NSString stringWithFormat:@"%@", v44];
      }
      else
      {
        id v46 = &stru_26BEEFD10;
      }
      if (v45) {
        id v47 = v45;
      }
      else {
        id v47 = &stru_26BEEFD10;
      }
      char v48 = v47;
      v67[0] = @"propertyName";
      v67[1] = @"objectDescription";
      v68[0] = v48;
      v68[1] = v46;
      v67[2] = @"errorDescription";
      v68[2] = &stru_26BEEFD10;
      id v49 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:3];
      double v50 = [MEMORY[0x263F087E8] errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v49];

      id v51 = v50;
      *a6 = v51;
    }
    id v30 = 0;
    id v21 = 0;
    goto LABEL_71;
  }
  __n128 v18 = [v66 createDebugHierarchyVisualRepresentation];
  if (objc_opt_respondsToSelector())
  {
    id v19 = [v66 createDebugHierarchyVisualRepresentation];
    char v20 = (CGColor *)[v19 CGColor];
    if (v20)
    {
      id v21 = CFDictionaryCreateMutable(0, 20, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      ColorSpace = CGColorGetColorSpace(v20);
      CFStringRef spacea = CGColorSpaceCopyName(ColorSpace);
      size_t v22 = CGColorGetNumberOfComponents(v20);
      uint64_t v23 = v22 << 32;
      CFIndex v24 = (int)v22;
      if (v22 << 32)
      {
        double v25 = CFStringCreateMutable(0, 0);
        CFIndex v26 = v24 - 1;
        if ((unint64_t)v24 <= 1) {
          uint64_t v27 = 1;
        }
        else {
          uint64_t v27 = v24;
        }
        do
        {
          CFStringAppend(v25, @"CGf");
          if (v26) {
            CFStringAppend(v25, @", ");
          }
          --v26;
          --v27;
        }
        while (v27);
      }
      else
      {
        double v25 = &stru_26BEEFD10;
      }
      uint64_t v52 = CGColorGetComponents(v20);
      uint64_t v53 = (const void **)malloc_type_malloc(v23 >> 29, 0x6004044C4A2DFuLL);
      uint64_t v54 = v53;
      if (v23 >= 1)
      {
        if (v24 <= 1) {
          uint64_t v55 = 1;
        }
        else {
          uint64_t v55 = v24;
        }
        BOOL v56 = (CFNumberRef *)v53;
        do
        {
          *v56++ = CFNumberCreate(0, kCFNumberCGFloatType, v52++);
          --v55;
        }
        while (v55);
      }
      CFArrayRef v57 = CFArrayCreate(0, v54, v24, MEMORY[0x263EFFF70]);
      if (v23 >= 1)
      {
        if (v24 <= 1) {
          uint64_t v58 = 1;
        }
        else {
          uint64_t v58 = v24;
        }
        uint64_t v59 = v54;
        do
        {
          CFRelease(*v59++);
          --v58;
        }
        while (v58);
      }
      free(v54);
      CGColorSpaceGetModel(ColorSpace);
      if (v57) {
        CFDictionaryAddValue(v21, @"componentValues", v57);
      }
      if (v25) {
        CFDictionaryAddValue(v21, @"componentValuesFormat", v25);
      }
      if (spacea) {
        CFDictionaryAddValue(v21, @"colorSpaceName", spacea);
      }
      if (v57) {
        CFRelease(v57);
      }
      if (spacea) {
        CFRelease(spacea);
      }
      if (v25) {
        CFRelease(v25);
      }
    }
    else
    {
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

LABEL_99:

  return v21;
}

- (SKCameraNode)camera
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_camera);

  return (SKCameraNode *)WeakRetained;
}

- (void)setCamera:(SKCameraNode *)camera
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (BOOL)_needsUpdate
{
  return self->__needsUpdate;
}

- (void)set_needsUpdate:(BOOL)a3
{
  self->__needsUpdate = a3;
}

- (BOOL)_needsRender
{
  return self->__needsRender;
}

- (void)set_needsRender:(BOOL)a3
{
  self->__needsRender = a3;
}

- (AVAudioEnvironmentNode)avAudioEnvironmentNode
{
  return self->_avAudioEnvironmentNode;
}

- (void)setAvAudioEnvironmentNode:(id)a3
{
}

- (PKPhysicsWorld)_pkPhysicsWorld
{
  return self->__pkPhysicsWorld;
}

- (void)set_pkPhysicsWorld:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pkPhysicsWorld, 0);
  objc_storeStrong((id *)&self->_avAudioEnvironmentNode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_camera);
  objc_storeStrong((id *)&self->_physicsWorld, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
  objc_destroyWeak((id *)&self->_listener);
  objc_destroyWeak(&self->_view);
  objc_storeStrong((id *)&self->_scenePinBody, 0);
  objc_storeStrong((id *)&self->_allChildenWithConstraints, 0);

  objc_storeStrong((id *)&self->_touchMap, 0);
}

- (void)_willMoveFromView:(id)a3
{
  id v4 = a3;
  -[SKScene willMoveFromView:](self, "willMoveFromView:");
  objc_storeWeak(&self->_view, 0);
  [(SKScene *)self checkAudioEngine];
}

- (void)set_usesExplicitUpdate:(BOOL)a3
{
  self->_usesExplicitUpdate = a3;
}

- (BOOL)_usesExplicitUpdate
{
  return self->_usesExplicitUpdate;
}

- (void)set_usesExplicitRender:(BOOL)a3
{
  self->_usesExplicitRender = a3;
}

- (BOOL)_usesExplicitRender
{
  return self->_usesExplicitRender;
}

- (void)_setNeedsUpdate
{
}

- (void)_setNeedsRender
{
}

- (BOOL)_isDirty
{
  return SKCNode::matchesAnyFlags((SKCNode *)self->super.super._skcNode, -1, -1);
}

- (void)_setDirty
{
}

- (void)_notifyNextDirtyState
{
  *((unsigned char *)self->_skcSceneNode + 736) = 1;
}

- (void)_setBackgroundContentsWithBuffer:(__CVBuffer *)a3
{
}

- (void)_update:
{
}

- (uint64_t)_update:
{
    return a1 + 8;
  else {
    return 0;
  }
}

@end