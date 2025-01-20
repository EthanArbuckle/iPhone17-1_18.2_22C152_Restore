@interface SCNCone
+ (BOOL)supportsSecureCoding;
+ (SCNCone)coneWithTopRadius:(CGFloat)topRadius bottomRadius:(CGFloat)bottomRadius height:(CGFloat)height;
- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4;
- (CGFloat)bottomRadius;
- (CGFloat)height;
- (CGFloat)topRadius;
- (NSInteger)heightSegmentCount;
- (NSInteger)radialSegmentCount;
- (SCNCone)init;
- (SCNCone)initWithCoder:(id)a3;
- (SCNCone)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (__C3DGeometry)__createCFObject;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (id)presentationCone;
- (int64_t)primitiveType;
- (void)_setupObjCModelFrom:(id)a3;
- (void)_syncObjCModel:(__C3DParametricGeometry *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBottomRadius:(CGFloat)bottomRadius;
- (void)setHeight:(CGFloat)height;
- (void)setHeightSegmentCount:(NSInteger)heightSegmentCount;
- (void)setPrimitiveType:(int64_t)a3;
- (void)setRadialSegmentCount:(NSInteger)radialSegmentCount;
- (void)setTopRadius:(CGFloat)topRadius;
@end

@implementation SCNCone

- (SCNCone)init
{
  v3 = (const void *)C3DParametricGeometryCreate(0, (long long *)kC3DConeCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNCone;
  v4 = [(SCNGeometry *)&v8 initWithGeometryRef:v3];
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNCone;
    [(SCNGeometry *)&v7 _syncObjCModel];
    [(SCNCone *)v5 _syncObjCModel:[(SCNGeometry *)v5 geometryRef]];
  }
  CFRelease(v3);
  return v5;
}

- (SCNCone)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNCone;
  v3 = [(SCNGeometry *)&v7 initWithGeometryRef:a3];
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNCone;
    [(SCNGeometry *)&v6 _syncObjCModel];
    [(SCNCone *)v4 _syncObjCModel:[(SCNGeometry *)v4 geometryRef]];
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (long long *)kC3DConeCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNCone;
  return [(SCNGeometry *)&v4 initPresentationGeometryWithGeometryRef:a3];
}

- (id)presentationCone
{
  id v2 = [[SCNCone alloc] initPresentationParametricGeometryWithParametricGeometryRef:[(SCNGeometry *)self geometryRef]];

  return v2;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_conetopRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 5);
  self->_conebottomRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 6);
  self->_coneheight = C3DParametricGeometryGetFloatValue((uint64_t)a3, 1);
  self->_coneheightSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 12);
  self->_coneradialSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 15);
  self->_coneprimitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)bottomRadius
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_conebottomRadius;
  }
  v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double BottomRadius = C3DParametricGeometryGetBottomRadius((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return BottomRadius;
}

- (void)setBottomRadius:(CGFloat)bottomRadius
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNCone setBottomRadius:]();
    }
  }
  else if (self->_conebottomRadius != bottomRadius)
  {
    self->_conebottomRadius = bottomRadius;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__SCNCone_setBottomRadius___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = bottomRadius;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"bottomRadius" applyBlock:v7];
  }
}

void __27__SCNCone_setBottomRadius___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetBottomRadius(v2, v3);
}

- (CGFloat)height
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_coneheight;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
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
      -[SCNCone setHeight:]();
    }
  }
  else if (self->_coneheight != height)
  {
    self->_coneheight = height;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __21__SCNCone_setHeight___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = height;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"height" applyBlock:v7];
  }
}

void __21__SCNCone_setHeight___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetHeight(v2, v3);
}

- (NSInteger)heightSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_coneheightSegmentCount;
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
      -[SCNCone setHeightSegmentCount:]();
    }
  }
  else if (self->_coneheightSegmentCount != heightSegmentCount)
  {
    self->_coneheightSegmentCount = heightSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__SCNCone_setHeightSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = heightSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"heightSegmentCount" applyBlock:v7];
  }
}

void __33__SCNCone_setHeightSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetHeightSegmentCount(v2, v3);
}

- (int64_t)primitiveType
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_coneprimitiveType;
  }
  int v3 = [(SCNGeometry *)self sceneRef];
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
      -[SCNCone setPrimitiveType:]();
    }
  }
  else if (self->_coneprimitiveType != a3)
  {
    self->_coneprimitiveType = a3;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__SCNCone_setPrimitiveType___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __28__SCNCone_setPrimitiveType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(char *)(a1 + 40);

  C3DParametricGeometrySetPrimitiveType(v2, v3);
}

- (NSInteger)radialSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_coneradialSegmentCount;
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
      -[SCNCone setRadialSegmentCount:]();
    }
  }
  else if (self->_coneradialSegmentCount != radialSegmentCount)
  {
    self->_coneradialSegmentCount = radialSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__SCNCone_setRadialSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = radialSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"radialSegmentCount" applyBlock:v7];
  }
}

void __33__SCNCone_setRadialSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetRadialSegmentCount(v2, v3);
}

- (CGFloat)topRadius
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_conetopRadius;
  }
  int v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double TopRadius = C3DParametricGeometryGetTopRadius((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return TopRadius;
}

- (void)setTopRadius:(CGFloat)topRadius
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNCone setTopRadius:]();
    }
  }
  else if (self->_conetopRadius != topRadius)
  {
    self->_conetopRadius = topRadius;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __24__SCNCone_setTopRadius___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = topRadius;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"topRadius" applyBlock:v7];
  }
}

void __24__SCNCone_setTopRadius___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetTopRadius(v2, v3);
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  float v25 = 0.0;
  uint64_t v24 = 0;
  float v23 = 0.0;
  uint64_t v22 = 0;
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    objc_super v7 = [(SCNGeometry *)self sceneRef];
    uint64_t v8 = (uint64_t)v7;
    if (v7) {
      C3DSceneLock((uint64_t)v7);
    }
    if ([(SCNGeometry *)self geometryRef])
    {
      char BoundingBox = C3DConeGetBoundingBox((uint64_t)[(SCNGeometry *)self geometryRef], (uint64_t)&v24, (uint64_t)&v22);
      if (!v8) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    char BoundingBox = 0;
    if (v8) {
LABEL_11:
    }
      C3DSceneUnlock(v8);
  }
  else
  {
    if ([(SCNGeometry *)self _hasFixedBoundingBoxExtrema])
    {
      v21.receiver = self;
      v21.super_class = (Class)SCNCone;
      return [(SCNGeometry *)&v21 getBoundingBoxMin:a3 max:a4];
    }
    [(SCNCone *)self topRadius];
    float64_t v11 = v10;
    [(SCNCone *)self bottomRadius];
    float64_t v13 = v12;
    [(SCNCone *)self height];
    double v15 = v14;
    v16.f64[0] = v11;
    C3DConeGetBoundingBoxForConeParameters((uint64_t)&v24, (uint64_t)&v22, v16, v13, v15);
    char BoundingBox = v17;
  }
LABEL_12:
  if (a3)
  {
    float v18 = v25;
    *(void *)&a3->x = v24;
    a3->z = v18;
  }
  if (a4)
  {
    float v19 = v23;
    *(void *)&a4->x = v22;
    a4->z = v19;
  }
  return BoundingBox;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  long long v18 = 0uLL;
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    objc_super v7 = [(SCNGeometry *)self sceneRef];
    uint64_t v8 = (uint64_t)v7;
    if (v7) {
      C3DSceneLock((uint64_t)v7);
    }
    if ([(SCNGeometry *)self geometryRef]
      && C3DConeGetBoundingSphere((uint64_t)[(SCNGeometry *)self geometryRef], &v18))
    {
      if (a3)
      {
        float v9 = *((float *)&v18 + 2);
        *(void *)&a3->x = v18;
        a3->z = v9;
      }
      if (a4) {
        *a4 = *((float *)&v18 + 3);
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
  [(SCNCone *)self topRadius];
  double v12 = v11;
  [(SCNCone *)self bottomRadius];
  double v14 = v13;
  [(SCNCone *)self height];
  if (!C3DConeGetBoundingSphereForConeParameters(&v18, v12, v14, v15)) {
    return 0;
  }
  if (a3)
  {
    float v16 = *((float *)&v18 + 2);
    *(void *)&a3->x = v18;
    a3->z = v16;
  }
  if (a4) {
    *a4 = *((float *)&v18 + 3);
  }
  return 1;
}

+ (SCNCone)coneWithTopRadius:(CGFloat)topRadius bottomRadius:(CGFloat)bottomRadius height:(CGFloat)height
{
  id v8 = objc_alloc_init((Class)a1);
  [v8 setTopRadius:topRadius];
  [v8 setBottomRadius:bottomRadius];
  [v8 setHeight:height];

  return (SCNCone *)v8;
}

- (id)description
{
  float v3 = NSString;
  id v4 = [(SCNGeometry *)self geometryDescription];
  [(SCNCone *)self topRadius];
  uint64_t v6 = v5;
  [(SCNCone *)self bottomRadius];
  uint64_t v8 = v7;
  [(SCNCone *)self height];
  return (id)[v3 stringWithFormat:@"<%@ | topRadius=%.3f bottomRadius=%.3f height=%.3f>", v4, v6, v8, v9];
}

- (void)_setupObjCModelFrom:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNCone;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  [a3 topRadius];
  -[SCNCone setTopRadius:](self, "setTopRadius:");
  [a3 bottomRadius];
  -[SCNCone setBottomRadius:](self, "setBottomRadius:");
  [a3 height];
  -[SCNCone setHeight:](self, "setHeight:");
  -[SCNCone setHeightSegmentCount:](self, "setHeightSegmentCount:", [a3 heightSegmentCount]);
  -[SCNCone setRadialSegmentCount:](self, "setRadialSegmentCount:", [a3 radialSegmentCount]);
  -[SCNCone setPrimitiveType:](self, "setPrimitiveType:", [a3 primitiveType]);
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
  return [(SCNCone *)self copyWithZone:0];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNCone;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ([(SCNGeometry *)self isPresentationInstance]) {
    [(SCNCone *)self _syncObjCModel:[(SCNGeometry *)self geometryRef]];
  }
  [a3 encodeDouble:@"conetopRadius" forKey:self->_conetopRadius];
  [a3 encodeDouble:@"conebottomRadius" forKey:self->_conebottomRadius];
  [a3 encodeDouble:@"coneheight" forKey:self->_coneheight];
  [a3 encodeInteger:self->_coneheightSegmentCount forKey:@"coneheightSegmentCount"];
  [a3 encodeInteger:self->_coneradialSegmentCount forKey:@"coneradialSegmentCount"];
  [a3 encodeInteger:self->_coneprimitiveType forKey:@"coneprimitiveType"];
}

- (SCNCone)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNCone;
  id v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [a3 decodeDoubleForKey:@"conetopRadius"];
    -[SCNCone setTopRadius:](v4, "setTopRadius:");
    [a3 decodeDoubleForKey:@"conebottomRadius"];
    -[SCNCone setBottomRadius:](v4, "setBottomRadius:");
    [a3 decodeDoubleForKey:@"coneheight"];
    -[SCNCone setHeight:](v4, "setHeight:");
    -[SCNCone setHeightSegmentCount:](v4, "setHeightSegmentCount:", [a3 decodeIntegerForKey:@"coneheightSegmentCount"]);
    -[SCNCone setRadialSegmentCount:](v4, "setRadialSegmentCount:", [a3 decodeIntegerForKey:@"coneradialSegmentCount"]);
    -[SCNCone setPrimitiveType:](v4, "setPrimitiveType:", [a3 decodeIntegerForKey:@"coneprimitiveType"]);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setBottomRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
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

- (void)setTopRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

@end