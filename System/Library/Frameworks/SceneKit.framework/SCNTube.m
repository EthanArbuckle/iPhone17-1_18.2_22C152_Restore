@interface SCNTube
+ (BOOL)supportsSecureCoding;
+ (SCNTube)tubeWithInnerRadius:(CGFloat)innerRadius outerRadius:(CGFloat)outerRadius height:(CGFloat)height;
- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4;
- (CGFloat)height;
- (CGFloat)innerRadius;
- (CGFloat)outerRadius;
- (NSInteger)heightSegmentCount;
- (NSInteger)radialSegmentCount;
- (SCNTube)init;
- (SCNTube)initWithCoder:(id)a3;
- (SCNTube)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (__C3DGeometry)__createCFObject;
- (double)radialSpan;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (id)presentationTube;
- (int64_t)primitiveType;
- (void)_setupObjCModelFrom:(id)a3;
- (void)_syncObjCModel:(__C3DParametricGeometry *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHeight:(CGFloat)height;
- (void)setHeightSegmentCount:(NSInteger)heightSegmentCount;
- (void)setInnerRadius:(CGFloat)innerRadius;
- (void)setOuterRadius:(CGFloat)outerRadius;
- (void)setPrimitiveType:(int64_t)a3;
- (void)setRadialSegmentCount:(NSInteger)radialSegmentCount;
- (void)setRadialSpan:(double)a3;
@end

@implementation SCNTube

- (SCNTube)init
{
  v3 = (const void *)C3DParametricGeometryCreate(0, (long long *)kC3DTubeCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNTube;
  v4 = [(SCNGeometry *)&v8 initWithGeometryRef:v3];
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNTube;
    [(SCNGeometry *)&v7 _syncObjCModel];
    [(SCNTube *)v5 _syncObjCModel:[(SCNGeometry *)v5 geometryRef]];
  }
  CFRelease(v3);
  return v5;
}

- (SCNTube)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNTube;
  v3 = [(SCNGeometry *)&v7 initWithGeometryRef:a3];
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNTube;
    [(SCNGeometry *)&v6 _syncObjCModel];
    [(SCNTube *)v4 _syncObjCModel:[(SCNGeometry *)v4 geometryRef]];
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (long long *)kC3DTubeCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNTube;
  return [(SCNGeometry *)&v4 initPresentationGeometryWithGeometryRef:a3];
}

- (id)presentationTube
{
  id v2 = [[SCNTube alloc] initPresentationParametricGeometryWithParametricGeometryRef:[(SCNGeometry *)self geometryRef]];

  return v2;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_tubeinnerRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 7);
  self->_tubeouterRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 8);
  self->_tubeheight = C3DParametricGeometryGetFloatValue((uint64_t)a3, 1);
  self->_tuberadialSpan = C3DParametricGeometryGetFloatValue((uint64_t)a3, 21);
  self->_tubeheightSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 12);
  self->_tuberadialSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 15);
  self->_tubeprimitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)height
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_tubeheight;
  }
  v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double Height = C3DParametricGeometryGetHeight((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return Height;
}

- (void)setHeight:(CGFloat)height
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNTube setHeight:]();
    }
  }
  else if (self->_tubeheight != height)
  {
    self->_tubeheight = height;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __21__SCNTube_setHeight___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = height;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"height" applyBlock:v7];
  }
}

void __21__SCNTube_setHeight___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetHeight(v2, v3);
}

- (NSInteger)heightSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_tubeheightSegmentCount;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  NSInteger HeightSegmentCount = (int)C3DParametricGeometryGetHeightSegmentCount((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return HeightSegmentCount;
}

- (void)setHeightSegmentCount:(NSInteger)heightSegmentCount
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNTube setHeightSegmentCount:]();
    }
  }
  else if (self->_tubeheightSegmentCount != heightSegmentCount)
  {
    self->_tubeheightSegmentCount = heightSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__SCNTube_setHeightSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = heightSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"heightSegmentCount" applyBlock:v7];
  }
}

void __33__SCNTube_setHeightSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetHeightSegmentCount(v2, v3);
}

- (CGFloat)innerRadius
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_tubeinnerRadius;
  }
  int v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double InnerRadius = C3DParametricGeometryGetInnerRadius((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return InnerRadius;
}

- (void)setInnerRadius:(CGFloat)innerRadius
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNTube setInnerRadius:]();
    }
  }
  else if (self->_tubeinnerRadius != innerRadius)
  {
    self->_tubeinnerRadius = innerRadius;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __26__SCNTube_setInnerRadius___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = innerRadius;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"innerRadius" applyBlock:v7];
  }
}

void __26__SCNTube_setInnerRadius___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetInnerRadius(v2, v3);
}

- (CGFloat)outerRadius
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_tubeouterRadius;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double OuterRadius = C3DParametricGeometryGetOuterRadius((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return OuterRadius;
}

- (void)setOuterRadius:(CGFloat)outerRadius
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNTube setOuterRadius:]();
    }
  }
  else if (self->_tubeouterRadius != outerRadius)
  {
    self->_tubeouterRadius = outerRadius;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __26__SCNTube_setOuterRadius___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = outerRadius;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"outerRadius" applyBlock:v7];
  }
}

void __26__SCNTube_setOuterRadius___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetOuterRadius(v2, v3);
}

- (int64_t)primitiveType
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_tubeprimitiveType;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  int64_t PrimitiveType = (int)C3DParametricGeometryGetPrimitiveType((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return PrimitiveType;
}

- (void)setPrimitiveType:(int64_t)a3
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNTube setPrimitiveType:]();
    }
  }
  else if (self->_tubeprimitiveType != a3)
  {
    self->_tubeprimitiveType = a3;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__SCNTube_setPrimitiveType___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __28__SCNTube_setPrimitiveType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(char *)(a1 + 40);

  C3DParametricGeometrySetPrimitiveType(v2, v3);
}

- (NSInteger)radialSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_tuberadialSegmentCount;
  }
  int v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  NSInteger RadialSegmentCount = (int)C3DParametricGeometryGetRadialSegmentCount((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return RadialSegmentCount;
}

- (void)setRadialSegmentCount:(NSInteger)radialSegmentCount
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNTube setRadialSegmentCount:]();
    }
  }
  else if (self->_tuberadialSegmentCount != radialSegmentCount)
  {
    self->_tuberadialSegmentCount = radialSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__SCNTube_setRadialSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = radialSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"radialSegmentCount" applyBlock:v7];
  }
}

void __33__SCNTube_setRadialSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetRadialSegmentCount(v2, v3);
}

- (double)radialSpan
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_tuberadialSpan;
  }
  int v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double RadialSpan = C3DParametricGeometryGetRadialSpan((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return RadialSpan;
}

- (void)setRadialSpan:(double)a3
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNTube setRadialSpan:]();
    }
  }
  else if (self->_tuberadialSpan != a3)
  {
    self->_tuberadialSpan = a3;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __25__SCNTube_setRadialSpan___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"radialSpan" applyBlock:v7];
  }
}

void __25__SCNTube_setRadialSpan___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetRadialSpan(v2, v3);
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  float v24 = 0.0;
  uint64_t v23 = 0;
  float v22 = 0.0;
  uint64_t v21 = 0;
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    objc_super v7 = [(SCNGeometry *)self sceneRef];
    uint64_t v8 = (uint64_t)v7;
    if (v7) {
      C3DSceneLock((uint64_t)v7);
    }
    if ([(SCNGeometry *)self geometryRef])
    {
      C3DTubeGetBoundingBox((uint64_t)[(SCNGeometry *)self geometryRef], (uint64_t)&v23, (uint64_t)&v21);
      BOOL v10 = v9;
      if (!v8) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    BOOL v10 = 0;
    if (v8) {
LABEL_11:
    }
      C3DSceneUnlock(v8);
  }
  else
  {
    if ([(SCNGeometry *)self _hasFixedBoundingBoxExtrema])
    {
      v20.receiver = self;
      v20.super_class = (Class)SCNTube;
      return [(SCNGeometry *)&v20 getBoundingBoxMin:a3 max:a4];
    }
    [(SCNTube *)self outerRadius];
    float64_t v12 = v11;
    [(SCNTube *)self height];
    double v14 = v13;
    v15.f64[0] = v12;
    C3DCylinderGetBoundingBoxForCylinderParameters((uint64_t)&v23, (uint64_t)&v21, v15, v14);
    BOOL v10 = v16;
  }
LABEL_12:
  if (a3)
  {
    float v17 = v24;
    *(void *)&a3->x = v23;
    a3->z = v17;
  }
  if (a4)
  {
    float v18 = v22;
    *(void *)&a4->x = v21;
    a4->z = v18;
  }
  return v10;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  long long v16 = 0uLL;
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    objc_super v7 = [(SCNGeometry *)self sceneRef];
    uint64_t v8 = (uint64_t)v7;
    if (v7) {
      C3DSceneLock((uint64_t)v7);
    }
    if ([(SCNGeometry *)self geometryRef]
      && C3DTubeGetBoundingSphere((uint64_t)[(SCNGeometry *)self geometryRef], &v16))
    {
      if (a3)
      {
        float v9 = *((float *)&v16 + 2);
        *(void *)&a3->x = v16;
        a3->z = v9;
      }
      if (a4) {
        *a4 = *((float *)&v16 + 3);
      }
      BOOL v10 = 1;
      if (!v8) {
        return v10;
      }
    }
    else
    {
      BOOL v10 = 0;
      if (!v8) {
        return v10;
      }
    }
    C3DSceneUnlock(v8);
    return v10;
  }
  [(SCNTube *)self outerRadius];
  double v12 = v11;
  [(SCNTube *)self height];
  if (!C3DCylinderGetBoundingSphereForCylinderParameters(&v16, v12, v13)) {
    return 0;
  }
  if (a3)
  {
    float v14 = *((float *)&v16 + 2);
    *(void *)&a3->x = v16;
    a3->z = v14;
  }
  if (a4) {
    *a4 = *((float *)&v16 + 3);
  }
  return 1;
}

+ (SCNTube)tubeWithInnerRadius:(CGFloat)innerRadius outerRadius:(CGFloat)outerRadius height:(CGFloat)height
{
  id v8 = objc_alloc_init((Class)a1);
  [v8 setInnerRadius:innerRadius];
  [v8 setOuterRadius:outerRadius];
  [v8 setHeight:height];

  return (SCNTube *)v8;
}

- (id)description
{
  float v3 = NSString;
  id v4 = [(SCNGeometry *)self geometryDescription];
  [(SCNTube *)self innerRadius];
  uint64_t v6 = v5;
  [(SCNTube *)self outerRadius];
  uint64_t v8 = v7;
  [(SCNTube *)self height];
  return (id)[v3 stringWithFormat:@"<%@ | innerRadius=%.3f outerRadius=%.3f height=%.3f>", v4, v6, v8, v9];
}

- (void)_setupObjCModelFrom:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNTube;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  [a3 innerRadius];
  -[SCNTube setInnerRadius:](self, "setInnerRadius:");
  [a3 outerRadius];
  -[SCNTube setOuterRadius:](self, "setOuterRadius:");
  [a3 height];
  -[SCNTube setHeight:](self, "setHeight:");
  [a3 radialSpan];
  -[SCNTube setRadialSpan:](self, "setRadialSpan:");
  -[SCNTube setHeightSegmentCount:](self, "setHeightSegmentCount:", [a3 heightSegmentCount]);
  -[SCNTube setRadialSegmentCount:](self, "setRadialSegmentCount:", [a3 radialSegmentCount]);
  -[SCNTube setPrimitiveType:](self, "setPrimitiveType:", [a3 primitiveType]);
  +[SCNTransaction commitImmediate];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 _setupObjCModelFrom:self];
  [(SCNGeometry *)self _copyAttributesTo:v4];
  return v4;
}

- (id)copy
{
  return [(SCNTube *)self copyWithZone:0];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNTube;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ([(SCNGeometry *)self isPresentationInstance]) {
    [(SCNTube *)self _syncObjCModel:[(SCNGeometry *)self geometryRef]];
  }
  [a3 encodeDouble:@"tubeinnerRadius" forKey:self->_tubeinnerRadius];
  [a3 encodeDouble:@"tubeouterRadius" forKey:self->_tubeouterRadius];
  [a3 encodeDouble:@"tubeheight" forKey:self->_tubeheight];
  [a3 encodeDouble:@"tuberadialSpan" forKey:self->_tuberadialSpan];
  [a3 encodeInteger:self->_tubeheightSegmentCount forKey:@"tubeheightSegmentCount"];
  [a3 encodeInteger:self->_tuberadialSegmentCount forKey:@"tuberadialSegmentCount"];
  [a3 encodeInteger:self->_tubeprimitiveType forKey:@"tubeprimitiveType"];
}

- (SCNTube)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNTube;
  id v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [a3 decodeDoubleForKey:@"tubeinnerRadius"];
    -[SCNTube setInnerRadius:](v4, "setInnerRadius:");
    [a3 decodeDoubleForKey:@"tubeouterRadius"];
    -[SCNTube setOuterRadius:](v4, "setOuterRadius:");
    [a3 decodeDoubleForKey:@"tubeheight"];
    -[SCNTube setHeight:](v4, "setHeight:");
    [a3 decodeDoubleForKey:@"tuberadialSpan"];
    -[SCNTube setRadialSpan:](v4, "setRadialSpan:");
    -[SCNTube setHeightSegmentCount:](v4, "setHeightSegmentCount:", [a3 decodeIntegerForKey:@"tubeheightSegmentCount"]);
    -[SCNTube setRadialSegmentCount:](v4, "setRadialSegmentCount:", [a3 decodeIntegerForKey:@"tuberadialSegmentCount"]);
    -[SCNTube setPrimitiveType:](v4, "setPrimitiveType:", [a3 decodeIntegerForKey:@"tubeprimitiveType"]);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setHeight:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setHeightSegmentCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setInnerRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setOuterRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setPrimitiveType:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setRadialSegmentCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setRadialSpan:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

@end