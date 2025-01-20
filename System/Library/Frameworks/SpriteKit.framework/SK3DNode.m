@interface SK3DNode
+ (BOOL)supportsSecureCoding;
+ (SK3DNode)nodeWithViewportSize:(CGSize)viewportSize;
- (BOOL)autoenablesDefaultLighting;
- (BOOL)isPlaying;
- (BOOL)loops;
- (CGSize)viewportSize;
- (NSArray)hitTest:(CGPoint)point options:(NSDictionary *)options;
- (NSTimeInterval)sceneTime;
- (SCNNode)pointOfView;
- (SCNScene)scnScene;
- (SK3DNode)init;
- (SK3DNode)initWithCoder:(NSCoder *)aDecoder;
- (SK3DNode)initWithViewportSize:(CGSize)viewportSize;
- (id)copyWithZone:(_NSZone *)a3;
- (vector_float3)projectPoint:(vector_float3)point;
- (vector_float3)unprojectPoint:(vector_float3)point;
- (void)_didMakeBackingNode;
- (void)_makeBackingNode;
- (void)_scnSceneDidUpdate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoenablesDefaultLighting:(BOOL)autoenablesDefaultLighting;
- (void)setLoops:(BOOL)loops;
- (void)setPlaying:(BOOL)playing;
- (void)setPointOfView:(SCNNode *)pointOfView;
- (void)setSceneTime:(NSTimeInterval)sceneTime;
- (void)setScnScene:(SCNScene *)scnScene;
- (void)setViewportSize:(CGSize)viewportSize;
@end

@implementation SK3DNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSceneTime:(NSTimeInterval)sceneTime
{
  *((NSTimeInterval *)self->_skc3DNode + 74) = sceneTime;
}

- (NSTimeInterval)sceneTime
{
  return *((double *)self->_skc3DNode + 74);
}

- (void)setPlaying:(BOOL)playing
{
  *((unsigned char *)self->_skc3DNode + 616) = playing;
}

- (BOOL)isPlaying
{
  return *((unsigned char *)self->_skc3DNode + 616);
}

- (void)setLoops:(BOOL)loops
{
  *((unsigned char *)self->_skc3DNode + 617) = loops;
}

- (BOOL)loops
{
  return *((unsigned char *)self->_skc3DNode + 617);
}

- (void)setPointOfView:(SCNNode *)pointOfView
{
}

- (SCNNode)pointOfView
{
  return (SCNNode *)*((id *)self->_skc3DNode + 76);
}

- (BOOL)autoenablesDefaultLighting
{
  return *((unsigned char *)self->_skc3DNode + 618);
}

- (void)setAutoenablesDefaultLighting:(BOOL)autoenablesDefaultLighting
{
  *((unsigned char *)self->_skc3DNode + 618) = autoenablesDefaultLighting;
}

- (void)_makeBackingNode
{
}

- (void)_didMakeBackingNode
{
  v3.receiver = self;
  v3.super_class = (Class)SK3DNode;
  [(SKNode *)&v3 _didMakeBackingNode];
  self->_skc3DNode = [(SKNode *)self _backingNode];
}

- (SK3DNode)init
{
  v2 = -[SK3DNode initWithViewportSize:](self, "initWithViewportSize:", 1.0, 1.0);
  [(SK3DNode *)v2 commonInit];
  return v2;
}

- (SK3DNode)initWithViewportSize:(CGSize)viewportSize
{
  double height = viewportSize.height;
  double width = viewportSize.width;
  v8.receiver = self;
  v8.super_class = (Class)SK3DNode;
  v5 = [(SKNode *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SK3DNode *)v5 commonInit];
    -[SKNode set_anchorPoint:](v6, "set_anchorPoint:", 0.5, 0.5);
    -[SK3DNode setViewportSize:](v6, "setViewportSize:", width, height);
  }
  return v6;
}

- (SK3DNode)initWithCoder:(NSCoder *)aDecoder
{
  v4 = aDecoder;
  v9.receiver = self;
  v9.super_class = (Class)SK3DNode;
  v5 = [(SKNode *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    [(SK3DNode *)v5 commonInit];
    [(NSCoder *)v4 decodeCGSizeForKey:@"viewportSize"];
    -[SK3DNode setViewportSize:](v6, "setViewportSize:");
    v7 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_scene"];
    [(SK3DNode *)v6 setScnScene:v7];
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SK3DNode;
  [(SKNode *)&v6 encodeWithCoder:v4];
  [(SK3DNode *)self viewportSize];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"viewportSize");
  v5 = [(SK3DNode *)self scnScene];
  [v4 encodeObject:v5 forKey:@"_scene"];
}

- (void)setViewportSize:(CGSize)viewportSize
{
  double height = viewportSize.height;
  double width = viewportSize.width;
  __n128 Scale = SKCNode::getScale((__n128 *)self->_skc3DNode);
  v7.i32[0] = 0;
  *(float *)&unsigned int v8 = width;
  *(float *)&unsigned int v9 = height;
  unint64_t v10 = __PAIR64__(v9, v8);
  int32x4_t v11 = (int32x4_t)vandq_s8((int8x16_t)vclezq_f32((float32x4_t)Scale), (int8x16_t)xmmword_20AE9B2A0);
  v11.i32[0] = vaddvq_s32(v11);
  v12.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v12.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  v7.i64[0] = vceqq_s8(vandq_s8((int8x16_t)v11, v12), vandq_s8(v7, v12)).u64[0];
  int8x16_t v13 = vdupq_lane_s8(*(int8x8_t *)v7.i8, 0);
  int8x16_t v14 = (int8x16_t)vdupq_n_s64(v7.i8[0] & 0xF | (unint64_t)(16 * (v13.i8[1] & 0xF)) | ((v13.i8[2] & 0xF) << 8) & 0xFFF | ((v13.i8[3] & 0xFu) << 12) | ((unint64_t)(v13.i8[4] & 0xF) << 16) & 0xFFFFFFFFFF0FFFFFLL | ((unint64_t)(v13.i8[5] & 0xF) << 20) | ((unint64_t)(v13.i8[6] & 0xF) << 24) | ((unint64_t)(v13.i8[7] & 0xF) << 28) | ((unint64_t)(v13.i8[8] & 0xF) << 32) | ((unint64_t)(v13.i8[9] & 0xF) << 36) | ((unint64_t)(v13.i8[10] & 0xF) << 40) | ((unint64_t)(v13.i8[11] & 0xF) << 44) | ((unint64_t)(v13.i8[12] & 0xF) << 48) | ((unint64_t)(v13.i8[13] & 0xF) << 52) | ((unint64_t)(v13.i8[14] & 0xF) << 56) | ((unint64_t)v13.u8[15] << 60));
  __asm { FMOV            V3.4S, #1.0 }
  float32x4_t v20 = vdivq_f32((float32x4_t)v10, (float32x4_t)vbslq_s8(v14, (int8x16_t)Scale, _Q3));
  SKCNode::setSize((SKCNode *)self->_skc3DNode, &v20);
}

- (CGSize)viewportSize
{
  float64x2_t v2 = vcvtq_f64_f32(vmul_f32((float32x2_t)SKCNode::getScale((__n128 *)self->_skc3DNode).n128_u64[0], *(float32x2_t *)((char *)self->_skc3DNode + 336)));
  double v3 = v2.f64[1];
  result.double width = v2.f64[0];
  result.double height = v3;
  return result;
}

+ (SK3DNode)nodeWithViewportSize:(CGSize)viewportSize
{
  double v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithViewportSize:", viewportSize.width, viewportSize.height);

  return (SK3DNode *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SK3DNode;
  id v4 = [(SKNode *)&v8 copyWithZone:a3];
  [(SK3DNode *)self viewportSize];
  objc_msgSend(v4, "setViewportSize:");
  v5 = [(SK3DNode *)self scnScene];
  objc_super v6 = (void *)[v5 copy];
  [v4 setScnScene:v6];

  return v4;
}

- (SCNScene)scnScene
{
  return (SCNScene *)*((id *)self->_skc3DNode + 73);
}

- (void)_scnSceneDidUpdate:(id)a3
{
}

- (void)setScnScene:(SCNScene *)scnScene
{
  int8x16_t v13 = scnScene;
  skc3DNode = self->_skc3DNode;
  if (*((void *)skc3DNode + 73))
  {
    objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self name:@"kC3DSceneDidUpdateNotification" object:*((void *)self->_skc3DNode + 73)];

    skc3DNode = self->_skc3DNode;
  }
  objc_storeStrong((id *)skc3DNode + 73, scnScene);
  [*((id *)self->_skc3DNode + 70) setScene:*((void *)self->_skc3DNode + 73)];
  int8x16_t v7 = [*((id *)self->_skc3DNode + 70) pointOfView];
  [v7 position];
  objc_super v8 = self->_skc3DNode;
  v8[142] = v9;
  v8[143] = v10;
  v8[144] = v11;

  if (v13)
  {
    int8x16_t v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:self selector:sel__scnSceneDidUpdate_ name:@"kC3DSceneDidUpdateNotification" object:v13];
  }
}

- (NSArray)hitTest:(CGPoint)point options:(NSDictionary *)options
{
  id v4 = objc_msgSend(*((id *)self->_skc3DNode + 70), "hitTest:options:", options, point.x, point.y);

  return (NSArray *)v4;
}

- (vector_float3)projectPoint:(vector_float3)point
{
  LODWORD(v4) = DWORD1(v3);
  LODWORD(v5) = DWORD2(v3);
  uint64_t v6 = objc_msgSend(*((id *)self->_skc3DNode + 70), "projectPoint:", point.i64[0], point.i64[1], *(double *)&v3, v4, v5);
  result.i64[1] = v7;
  result.i64[0] = v6;
  return result;
}

- (vector_float3)unprojectPoint:(vector_float3)point
{
  LODWORD(v4) = DWORD1(v3);
  LODWORD(v5) = DWORD2(v3);
  uint64_t v6 = objc_msgSend(*((id *)self->_skc3DNode + 70), "unprojectPoint:", point.i64[0], point.i64[1], *(double *)&v3, v4, v5);
  result.i64[1] = v7;
  result.i64[0] = v6;
  return result;
}

@end