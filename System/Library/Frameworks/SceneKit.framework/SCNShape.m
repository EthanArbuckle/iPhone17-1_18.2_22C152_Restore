@interface SCNShape
+ (BOOL)supportsSecureCoding;
+ (SCNShape)shapeWithPath:(UIBezierPath *)path extrusionDepth:(CGFloat)extrusionDepth;
- ($DB7092C30E680F051A254E3F9658D24C)params;
- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4;
- (CGFloat)chamferRadius;
- (CGFloat)extrusionDepth;
- (SCNChamferMode)chamferMode;
- (SCNShape)init;
- (SCNShape)initWithCoder:(id)a3;
- (UIBezierPath)chamferProfile;
- (UIBezierPath)path;
- (double)discretizedStraightLineMaxLength;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPresentationShapeGeometryWithShapeGeometryRef:(__C3DShapeGeometry *)a3;
- (id)presentationGeometry;
- (int64_t)primitiveType;
- (void)_customDecodingOfSCNShape:(id)a3;
- (void)_customEncodingOfSCNShape:(id)a3;
- (void)_syncObjCModel:(__C3DShapeGeometry *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setChamferMode:(SCNChamferMode)chamferMode;
- (void)setChamferProfile:(UIBezierPath *)chamferProfile;
- (void)setChamferRadius:(CGFloat)chamferRadius;
- (void)setDiscretizedStraightLineMaxLength:(double)a3;
- (void)setExtrusionDepth:(CGFloat)extrusionDepth;
- (void)setPath:(UIBezierPath *)path;
- (void)setPrimitiveType:(int64_t)a3;
@end

@implementation SCNShape

- (void)_syncObjCModel:(__C3DShapeGeometry *)a3
{
  self->_primitiveType = (int)C3DShapeGeometryGetPrimitiveType((uint64_t)a3);
  float ChamferRadius = C3DShapeGeometryGetChamferRadius((uint64_t)a3);
  self->_chamferRadius = ChamferRadius;
  float ExtrusionDepth = C3DShapeGeometryGetExtrusionDepth((uint64_t)a3);
  self->_extrusionDepth = ExtrusionDepth;
  self->_chamferProfile = (UIBezierPath *)(id)C3DShapeGeometryGetObjCChamferProfile((uint64_t)a3);
  float DiscretizedStraightLineMaxLength = C3DShapeGeometryGetDiscretizedStraightLineMaxLength((uint64_t)a3);
  self->_discretizedStraightLineMaxLength = DiscretizedStraightLineMaxLength;
  self->_path = (UIBezierPath *)(id)C3DFloorGetReflectionCategoryBitMask((uint64_t)a3);
  self->_chamferMode = (int)C3DShapeGeometryGetChamferMode((uint64_t)a3);
}

- (SCNShape)init
{
  v3 = (const void *)C3DShapeGeometryCreate();
  v8.receiver = self;
  v8.super_class = (Class)SCNShape;
  v4 = [(SCNGeometry *)&v8 initWithGeometryRef:v3];
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNShape;
    [(SCNGeometry *)&v7 _syncObjCModel];
    [(SCNShape *)v5 _syncObjCModel:[(SCNGeometry *)v5 geometryRef]];
  }
  CFRelease(v3);
  return v5;
}

- (id)initPresentationShapeGeometryWithShapeGeometryRef:(__C3DShapeGeometry *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNShape;
  return [(SCNGeometry *)&v4 initPresentationGeometryWithGeometryRef:a3];
}

- (id)presentationGeometry
{
  id v2 = [[SCNShape alloc] initPresentationShapeGeometryWithShapeGeometryRef:[(SCNGeometry *)self geometryRef]];

  return v2;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

+ (SCNShape)shapeWithPath:(UIBezierPath *)path extrusionDepth:(CGFloat)extrusionDepth
{
  v6 = (SCNShape *)objc_alloc_init((Class)a1);
  [(SCNShape *)v6 setExtrusionDepth:extrusionDepth];
  [(SCNShape *)v6 setPath:path];
  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SCNGeometry *)self geometryDescription];
  v5 = [(SCNShape *)self path];
  [(SCNShape *)self extrusionDepth];
  return (id)[v3 stringWithFormat:@"<%@ | path=%@ extrusionDepth=%.3f> ", v4, v5, v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(SCNShape *)self path];
  [(SCNShape *)self extrusionDepth];
  uint64_t v6 = +[SCNShape shapeWithPath:extrusionDepth:](SCNShape, "shapeWithPath:extrusionDepth:", v4);
  [(SCNShape *)v6 setChamferMode:[(SCNShape *)self chamferMode]];
  [(SCNShape *)self chamferRadius];
  -[SCNShape setChamferRadius:](v6, "setChamferRadius:");
  [(SCNShape *)v6 setChamferProfile:[(SCNShape *)self chamferProfile]];
  [(SCNGeometry *)v6 _setupObjCModelFrom:self];

  return v6;
}

- (id)copy
{
  return [(SCNShape *)self copyWithZone:0];
}

- (SCNChamferMode)chamferMode
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_chamferMode;
  }
  v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  SCNChamferMode ChamferMode = (int)C3DShapeGeometryGetChamferMode((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return ChamferMode;
}

- (void)setChamferMode:(SCNChamferMode)chamferMode
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNShape setChamferMode:]();
    }
  }
  else if (self->_chamferMode != chamferMode)
  {
    self->_chamferMode = chamferMode;
    uint64_t v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__SCNShape_setChamferMode___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = chamferMode;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __27__SCNShape_setChamferMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DShapeGeometrySetChamferMode(v2, v3);
}

- (CGFloat)chamferRadius
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_chamferRadius;
  }
  int v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double ChamferRadius = C3DShapeGeometryGetChamferRadius((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return ChamferRadius;
}

- (void)setChamferRadius:(CGFloat)chamferRadius
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNShape setChamferRadius:]();
    }
  }
  else if (self->_chamferRadius != chamferRadius)
  {
    float v6 = chamferRadius;
    self->_chamferRadius = v6;
    objc_super v7 = [(SCNGeometry *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__SCNShape_setChamferRadius___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = chamferRadius;
    +[SCNTransaction postCommandWithContext:v7 object:self key:@"chamferRadius" applyBlock:v8];
  }
}

void __29__SCNShape_setChamferRadius___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  double v3 = *(double *)(a1 + 40);

  C3DShapeGeometrySetChamferRadius(v2, v3);
}

- (double)discretizedStraightLineMaxLength
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_discretizedStraightLineMaxLength;
  }
  double v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double DiscretizedStraightLineMaxLength = C3DShapeGeometryGetDiscretizedStraightLineMaxLength((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return DiscretizedStraightLineMaxLength;
}

- (void)setDiscretizedStraightLineMaxLength:(double)a3
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNShape setDiscretizedStraightLineMaxLength:]();
    }
  }
  else if (self->_discretizedStraightLineMaxLength != a3)
  {
    float v6 = a3;
    self->_discretizedStraightLineMaxLength = v6;
    objc_super v7 = [(SCNGeometry *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__SCNShape_setDiscretizedStraightLineMaxLength___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
  }
}

void __48__SCNShape_setDiscretizedStraightLineMaxLength___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  double v3 = *(double *)(a1 + 40);

  C3DShapeGeometrySetDiscretizedStraightLineMaxLength(v2, v3);
}

- (CGFloat)extrusionDepth
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_extrusionDepth;
  }
  double v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double ExtrusionDepth = C3DShapeGeometryGetExtrusionDepth((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return ExtrusionDepth;
}

- (void)setExtrusionDepth:(CGFloat)extrusionDepth
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNShape setExtrusionDepth:]();
    }
  }
  else if (self->_extrusionDepth != extrusionDepth)
  {
    float v6 = extrusionDepth;
    self->_extrusionDepth = v6;
    objc_super v7 = [(SCNGeometry *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __30__SCNShape_setExtrusionDepth___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = extrusionDepth;
    +[SCNTransaction postCommandWithContext:v7 object:self key:@"extrusionDepth" applyBlock:v8];
  }
}

void __30__SCNShape_setExtrusionDepth___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  double v3 = *(double *)(a1 + 40);

  C3DShapeGeometrySetExtrusionDepth(v2, v3);
}

- (int64_t)primitiveType
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_primitiveType;
  }
  double v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  int64_t PrimitiveType = (int)C3DShapeGeometryGetPrimitiveType((uint64_t)[(SCNGeometry *)self geometryRef]);
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
      -[SCNShape setPrimitiveType:]();
    }
  }
  else if (self->_primitiveType != a3)
  {
    self->_primitiveType = a3;
    float v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __29__SCNShape_setPrimitiveType___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __29__SCNShape_setPrimitiveType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  unsigned __int8 v3 = *(unsigned char *)(a1 + 40);

  C3DShapeGeometrySetPrimitiveType(v2, v3);
}

- (UIBezierPath)path
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    unsigned __int8 v3 = [(SCNGeometry *)self sceneRef];
    uint64_t v4 = (uint64_t)v3;
    if (v3) {
      C3DSceneLock((uint64_t)v3);
    }
    ReflectionCategoryBitMask = (void *)C3DFloorGetReflectionCategoryBitMask((uint64_t)[(SCNGeometry *)self geometryRef]);
    if (v4) {
      C3DSceneUnlock(v4);
    }
  }
  else
  {
    ReflectionCategoryBitMask = self->_path;
  }
  float v6 = (void *)[ReflectionCategoryBitMask copy];

  return (UIBezierPath *)v6;
}

- (void)setPath:(UIBezierPath *)path
{
  self->_path = (UIBezierPath *)[(UIBezierPath *)path copy];
  v5 = [(SCNGeometry *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __20__SCNShape_setPath___block_invoke;
  v6[3] = &unk_264005010;
  v6[4] = self;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __20__SCNShape_setPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  unsigned __int8 v3 = *(void **)(*(void *)(a1 + 32) + 208);

  C3DShapeGeometrySetObjCPath(v2, v3);
}

- (UIBezierPath)chamferProfile
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    unsigned __int8 v3 = [(SCNGeometry *)self sceneRef];
    uint64_t v4 = (uint64_t)v3;
    if (v3) {
      C3DSceneLock((uint64_t)v3);
    }
    ObjCChamferProfile = (void *)C3DShapeGeometryGetObjCChamferProfile((uint64_t)[(SCNGeometry *)self geometryRef]);
    if (v4) {
      C3DSceneUnlock(v4);
    }
  }
  else
  {
    ObjCChamferProfile = self->_chamferProfile;
  }
  float v6 = (void *)[ObjCChamferProfile copy];

  return (UIBezierPath *)v6;
}

- (void)setChamferProfile:(UIBezierPath *)chamferProfile
{
  self->_chamferProfile = (UIBezierPath *)[(UIBezierPath *)chamferProfile copy];
  v5 = [(SCNGeometry *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__SCNShape_setChamferProfile___block_invoke;
  v6[3] = &unk_264005010;
  v6[4] = self;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __30__SCNShape_setChamferProfile___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  unsigned __int8 v3 = *(void **)(*(void *)(a1 + 32) + 184);

  C3DShapeGeometrySetObjCChamferProfile(v2, v3);
}

- ($DB7092C30E680F051A254E3F9658D24C)params
{
  retstr->var6 = 0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  result = ($DB7092C30E680F051A254E3F9658D24C *)[(SCNGeometry *)self isPresentationInstance];
  if (result)
  {
    C3DShapeGeometryGetC3DKitParameters((uint64_t)[(SCNGeometry *)self geometryRef], (uint64_t)v12);
    long long v6 = v12[1];
    *(_OWORD *)&retstr->var0 = v12[0];
    *(_OWORD *)&retstr->var2 = v6;
    *(_OWORD *)&retstr->var4 = v12[2];
    retstr->var6 = v13;
  }
  else
  {
    float extrusionDepth = self->_extrusionDepth;
    retstr->var0 = self->_primitiveType;
    double chamferRadius = self->_chamferRadius;
    int64_t chamferMode = self->_chamferMode;
    retstr->var1 = extrusionDepth;
    retstr->var2 = chamferRadius;
    retstr->var3 = chamferMode;
    path = self->_path;
    chamferProfile = self->_chamferProfile;
    retstr->var4 = self->_discretizedStraightLineMaxLength;
    retstr->var5 = path;
    retstr->var6 = chamferProfile;
  }
  return result;
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  objc_super v7 = [(SCNGeometry *)self sceneRef];
  uint64_t v8 = (uint64_t)v7;
  if (v7) {
    C3DSceneLock((uint64_t)v7);
  }
  DWORD2(v17) = 0;
  *(void *)&long long v17 = 0;
  DWORD2(v16) = 0;
  *(void *)&long long v16 = 0;
  v9 = [(SCNGeometry *)self geometryRef];
  if (self)
  {
    [(SCNShape *)self params];
  }
  else
  {
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
  }
  int BoundingBox = C3DShapeGeometryGetBoundingBox(v9, &v17, &v16, (uint64_t)v14);
  if (BoundingBox)
  {
    if (a3)
    {
      float v11 = *((float *)&v17 + 2);
      *(void *)&a3->x = v17;
      a3->z = v11;
    }
    if (a4)
    {
      float v12 = *((float *)&v16 + 2);
      *(void *)&a4->x = v16;
      a4->z = v12;
    }
  }
  if (v8) {
    C3DSceneUnlock(v8);
  }
  return BoundingBox;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  objc_super v7 = [(SCNGeometry *)self sceneRef];
  uint64_t v8 = (uint64_t)v7;
  if (v7) {
    C3DSceneLock((uint64_t)v7);
  }
  long long v15 = 0uLL;
  v9 = [(SCNGeometry *)self geometryRef];
  if (self)
  {
    [(SCNShape *)self params];
  }
  else
  {
    uint64_t v14 = 0;
    memset(v13, 0, sizeof(v13));
  }
  int BoundingSphere = C3DShapeGeometryGetBoundingSphere(v9, &v15, (uint64_t)v13);
  if (BoundingSphere)
  {
    if (a3)
    {
      float v11 = *((float *)&v15 + 2);
      *(void *)&a3->x = v15;
      a3->z = v11;
    }
    if (a4) {
      *a4 = *((float *)&v15 + 3);
    }
  }
  if (v8) {
    C3DSceneUnlock(v8);
  }
  return BoundingSphere;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNShape;
  [(SCNGeometry *)&v3 dealloc];
}

- (void)_customDecodingOfSCNShape:(id)a3
{
  [(SCNShape *)self setChamferProfile:SCNDecodeBezierPathForKey(a3, @"chamferProfile")];
  v5 = SCNDecodeBezierPathForKey(a3, @"path");

  [(SCNShape *)self setPath:v5];
}

- (void)_customEncodingOfSCNShape:(id)a3
{
  SCNEncodeBezierPathForKey((uint64_t)a3, self->_chamferProfile, @"chamferProfile");
  path = self->_path;

  SCNEncodeBezierPathForKey((uint64_t)a3, path, @"path");
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCNShape;
  -[SCNGeometry encodeWithCoder:](&v8, sel_encodeWithCoder_);
  if ([(SCNGeometry *)self isPresentationInstance]) {
    [(SCNShape *)self _syncObjCModel:[(SCNGeometry *)self geometryRef]];
  }
  [(SCNShape *)self _customEncodingOfSCNShape:a3];
  *(float *)&double v5 = self->_chamferRadius;
  [a3 encodeFloat:@"chamferRadius" forKey:v5];
  *(float *)&double v6 = self->_extrusionDepth;
  [a3 encodeFloat:@"extrusionDepth" forKey:v6];
  *(float *)&double v7 = self->_discretizedStraightLineMaxLength;
  [a3 encodeFloat:@"discretizedStraightLineMaxLength" forKey:v7];
  [a3 encodeInteger:self->_primitiveType forKey:@"primitiveType"];
  [a3 encodeInteger:self->_chamferMode forKey:@"chamferMode"];
}

- (SCNShape)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SCNShape;
  uint64_t v4 = -[SCNGeometry initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNShape *)v4 _customDecodingOfSCNShape:a3];
    [a3 decodeFloatForKey:@"chamferRadius"];
    [(SCNShape *)v4 setChamferRadius:v6];
    [a3 decodeFloatForKey:@"extrusionDepth"];
    [(SCNShape *)v4 setExtrusionDepth:v7];
    [a3 decodeFloatForKey:@"discretizedStraightLineMaxLength"];
    [(SCNShape *)v4 setDiscretizedStraightLineMaxLength:v8];
    -[SCNShape setPrimitiveType:](v4, "setPrimitiveType:", [a3 decodeIntegerForKey:@"primitiveType"]);
    -[SCNShape setChamferMode:](v4, "setChamferMode:", [a3 decodeIntegerForKey:@"chamferMode"]);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setChamferMode:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setChamferRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setDiscretizedStraightLineMaxLength:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setExtrusionDepth:.cold.1()
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

@end