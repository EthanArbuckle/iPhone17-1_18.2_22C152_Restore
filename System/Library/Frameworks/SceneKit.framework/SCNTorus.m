@interface SCNTorus
+ (BOOL)supportsSecureCoding;
+ (SCNTorus)torusWithRingRadius:(CGFloat)ringRadius pipeRadius:(CGFloat)pipeRadius;
- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4;
- (CGFloat)pipeRadius;
- (CGFloat)ringRadius;
- (NSInteger)pipeSegmentCount;
- (NSInteger)ringSegmentCount;
- (SCNTorus)init;
- (SCNTorus)initWithCoder:(id)a3;
- (SCNTorus)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (__C3DGeometry)__createCFObject;
- (double)radialSpan;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (id)presentationTorus;
- (int64_t)primitiveType;
- (void)_setupObjCModelFrom:(id)a3;
- (void)_syncObjCModel:(__C3DParametricGeometry *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPipeRadius:(CGFloat)pipeRadius;
- (void)setPipeSegmentCount:(NSInteger)pipeSegmentCount;
- (void)setPrimitiveType:(int64_t)a3;
- (void)setRadialSpan:(double)a3;
- (void)setRingRadius:(CGFloat)ringRadius;
- (void)setRingSegmentCount:(NSInteger)ringSegmentCount;
@end

@implementation SCNTorus

- (SCNTorus)init
{
  v3 = (const void *)C3DParametricGeometryCreate(0, (long long *)kC3DTorusCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNTorus;
  v4 = [(SCNGeometry *)&v8 initWithGeometryRef:v3];
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNTorus;
    [(SCNGeometry *)&v7 _syncObjCModel];
    [(SCNTorus *)v5 _syncObjCModel:[(SCNGeometry *)v5 geometryRef]];
  }
  CFRelease(v3);
  return v5;
}

- (SCNTorus)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNTorus;
  v3 = [(SCNGeometry *)&v7 initWithGeometryRef:a3];
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNTorus;
    [(SCNGeometry *)&v6 _syncObjCModel];
    [(SCNTorus *)v4 _syncObjCModel:[(SCNGeometry *)v4 geometryRef]];
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (long long *)kC3DTorusCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNTorus;
  return [(SCNGeometry *)&v4 initPresentationGeometryWithGeometryRef:a3];
}

- (id)presentationTorus
{
  id v2 = [[SCNTorus alloc] initPresentationParametricGeometryWithParametricGeometryRef:[(SCNGeometry *)self geometryRef]];

  return v2;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_torusringRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 9);
  self->_toruspipeRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 10);
  self->_torusradialSpan = C3DParametricGeometryGetFloatValue((uint64_t)a3, 21);
  self->_torusringSegmentCount = (int)C3DParametricGeometryGetRingSegmentCount((uint64_t)a3);
  self->_toruspipeSegmentCount = (int)C3DParametricGeometryGetPipeSegmentCount((uint64_t)a3);
  self->_torusprimitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)pipeRadius
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_toruspipeRadius;
  }
  v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double PipeRadius = C3DParametricGeometryGetPipeRadius((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return PipeRadius;
}

- (void)setPipeRadius:(CGFloat)pipeRadius
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNTorus setPipeRadius:]();
    }
  }
  else if (self->_toruspipeRadius != pipeRadius)
  {
    self->_toruspipeRadius = pipeRadius;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __26__SCNTorus_setPipeRadius___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = pipeRadius;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"pipeRadius" applyBlock:v7];
  }
}

void __26__SCNTorus_setPipeRadius___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetPipeRadius(v2, v3);
}

- (NSInteger)pipeSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_toruspipeSegmentCount;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  NSInteger PipeSegmentCount = (int)C3DParametricGeometryGetPipeSegmentCount((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return PipeSegmentCount;
}

- (void)setPipeSegmentCount:(NSInteger)pipeSegmentCount
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNTorus setPipeSegmentCount:]();
    }
  }
  else if (self->_toruspipeSegmentCount != pipeSegmentCount)
  {
    self->_toruspipeSegmentCount = pipeSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__SCNTorus_setPipeSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = pipeSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"pipeSegmentCount" applyBlock:v7];
  }
}

void __32__SCNTorus_setPipeSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetPipeSegmentCount(v2, v3);
}

- (int64_t)primitiveType
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_torusprimitiveType;
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
      -[SCNTorus setPrimitiveType:]();
    }
  }
  else if (self->_torusprimitiveType != a3)
  {
    self->_torusprimitiveType = a3;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __29__SCNTorus_setPrimitiveType___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __29__SCNTorus_setPrimitiveType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(char *)(a1 + 40);

  C3DParametricGeometrySetPrimitiveType(v2, v3);
}

- (double)radialSpan
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_torusradialSpan;
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
      -[SCNTorus setRadialSpan:]();
    }
  }
  else if (self->_torusradialSpan != a3)
  {
    self->_torusradialSpan = a3;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __26__SCNTorus_setRadialSpan___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"radialSpan" applyBlock:v7];
  }
}

void __26__SCNTorus_setRadialSpan___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetRadialSpan(v2, v3);
}

- (CGFloat)ringRadius
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_torusringRadius;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double RingRadius = C3DParametricGeometryGetRingRadius((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return RingRadius;
}

- (void)setRingRadius:(CGFloat)ringRadius
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNTorus setRingRadius:]();
    }
  }
  else if (self->_torusringRadius != ringRadius)
  {
    self->_torusringRadius = ringRadius;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __26__SCNTorus_setRingRadius___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = ringRadius;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"ringRadius" applyBlock:v7];
  }
}

void __26__SCNTorus_setRingRadius___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetRingRadius(v2, v3);
}

- (NSInteger)ringSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_torusringSegmentCount;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  NSInteger RingSegmentCount = (int)C3DParametricGeometryGetRingSegmentCount((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return RingSegmentCount;
}

- (void)setRingSegmentCount:(NSInteger)ringSegmentCount
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNTorus setRingSegmentCount:]();
    }
  }
  else if (self->_torusringSegmentCount != ringSegmentCount)
  {
    self->_torusringSegmentCount = ringSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__SCNTorus_setRingSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = ringSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"ringSegmentCount" applyBlock:v7];
  }
}

void __32__SCNTorus_setRingSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetRingSegmentCount(v2, v3);
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
      C3DTorusGetBoundingBox((uint64_t)[(SCNGeometry *)self geometryRef], (uint64_t)&v23, (uint64_t)&v21);
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
      v20.super_class = (Class)SCNTorus;
      return [(SCNGeometry *)&v20 getBoundingBoxMin:a3 max:a4];
    }
    [(SCNTorus *)self ringRadius];
    uint64_t v12 = v11;
    [(SCNTorus *)self pipeRadius];
    float64_t v14 = v13;
    v15.i64[0] = v12;
    C3DTorusGetBoundingBoxForTorusParameters((uint64_t)&v23, (uint64_t)&v21, v15, v14);
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
      && C3DTorusGetBoundingSphere((uint64_t)[(SCNGeometry *)self geometryRef], &v16))
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
  [(SCNTorus *)self ringRadius];
  double v12 = v11;
  [(SCNTorus *)self pipeRadius];
  if (!C3DTorusGetBoundingSphereForTorusParameters(&v16, v12, v13)) {
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

+ (SCNTorus)torusWithRingRadius:(CGFloat)ringRadius pipeRadius:(CGFloat)pipeRadius
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setRingRadius:ringRadius];
  [v6 setPipeRadius:pipeRadius];

  return (SCNTorus *)v6;
}

- (id)description
{
  int v3 = NSString;
  id v4 = [(SCNGeometry *)self geometryDescription];
  [(SCNTorus *)self ringRadius];
  uint64_t v6 = v5;
  [(SCNTorus *)self pipeRadius];
  return (id)[v3 stringWithFormat:@"<%@ | ringRadius=%.3f pipeRadius=%.3f>", v4, v6, v7];
}

- (void)_setupObjCModelFrom:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNTorus;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  [a3 ringRadius];
  -[SCNTorus setRingRadius:](self, "setRingRadius:");
  [a3 pipeRadius];
  -[SCNTorus setPipeRadius:](self, "setPipeRadius:");
  [a3 radialSpan];
  -[SCNTorus setRadialSpan:](self, "setRadialSpan:");
  -[SCNTorus setRingSegmentCount:](self, "setRingSegmentCount:", [a3 ringSegmentCount]);
  -[SCNTorus setPipeSegmentCount:](self, "setPipeSegmentCount:", [a3 pipeSegmentCount]);
  -[SCNTorus setPrimitiveType:](self, "setPrimitiveType:", [a3 primitiveType]);
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
  return [(SCNTorus *)self copyWithZone:0];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNTorus;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ([(SCNGeometry *)self isPresentationInstance]) {
    [(SCNTorus *)self _syncObjCModel:[(SCNGeometry *)self geometryRef]];
  }
  [a3 encodeDouble:@"torusringRadius" forKey:self->_torusringRadius];
  [a3 encodeDouble:@"toruspipeRadius" forKey:self->_toruspipeRadius];
  [a3 encodeDouble:@"torusradialSpan" forKey:self->_torusradialSpan];
  [a3 encodeInteger:self->_torusringSegmentCount forKey:@"torusringSegmentCount"];
  [a3 encodeInteger:self->_toruspipeSegmentCount forKey:@"toruspipeSegmentCount"];
  [a3 encodeInteger:self->_torusprimitiveType forKey:@"torusprimitiveType"];
}

- (SCNTorus)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNTorus;
  id v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [a3 decodeDoubleForKey:@"torusringRadius"];
    -[SCNTorus setRingRadius:](v4, "setRingRadius:");
    [a3 decodeDoubleForKey:@"toruspipeRadius"];
    -[SCNTorus setPipeRadius:](v4, "setPipeRadius:");
    [a3 decodeDoubleForKey:@"torusradialSpan"];
    -[SCNTorus setRadialSpan:](v4, "setRadialSpan:");
    -[SCNTorus setRingSegmentCount:](v4, "setRingSegmentCount:", [a3 decodeIntegerForKey:@"torusringSegmentCount"]);
    -[SCNTorus setPipeSegmentCount:](v4, "setPipeSegmentCount:", [a3 decodeIntegerForKey:@"toruspipeSegmentCount"]);
    -[SCNTorus setPrimitiveType:](v4, "setPrimitiveType:", [a3 decodeIntegerForKey:@"torusprimitiveType"]);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPipeRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setPipeSegmentCount:.cold.1()
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

- (void)setRadialSpan:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setRingRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setRingSegmentCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

@end