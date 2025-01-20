@interface SCNPlane
+ (BOOL)supportsSecureCoding;
+ (SCNPlane)planeWithWidth:(CGFloat)width height:(CGFloat)height;
- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4;
- (CGFloat)cornerRadius;
- (CGFloat)height;
- (CGFloat)width;
- (NSInteger)cornerSegmentCount;
- (NSInteger)heightSegmentCount;
- (NSInteger)widthSegmentCount;
- (SCNPlane)init;
- (SCNPlane)initWithCoder:(id)a3;
- (SCNPlane)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (__C3DGeometry)__createCFObject;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (id)presentationPlane;
- (int64_t)primitiveType;
- (void)_setupObjCModelFrom:(id)a3;
- (void)_syncObjCModel:(__C3DParametricGeometry *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setCornerSegmentCount:(NSInteger)cornerSegmentCount;
- (void)setHeight:(CGFloat)height;
- (void)setHeightSegmentCount:(NSInteger)heightSegmentCount;
- (void)setPrimitiveType:(int64_t)a3;
- (void)setWidth:(CGFloat)width;
- (void)setWidthSegmentCount:(NSInteger)widthSegmentCount;
@end

@implementation SCNPlane

- (SCNPlane)init
{
  v3 = (const void *)C3DParametricGeometryCreate(0, (long long *)kC3DPlaneCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNPlane;
  v4 = [(SCNGeometry *)&v8 initWithGeometryRef:v3];
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNPlane;
    [(SCNGeometry *)&v7 _syncObjCModel];
    [(SCNPlane *)v5 _syncObjCModel:[(SCNGeometry *)v5 geometryRef]];
  }
  CFRelease(v3);
  return v5;
}

- (SCNPlane)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNPlane;
  v3 = [(SCNGeometry *)&v7 initWithGeometryRef:a3];
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNPlane;
    [(SCNGeometry *)&v6 _syncObjCModel];
    [(SCNPlane *)v4 _syncObjCModel:[(SCNGeometry *)v4 geometryRef]];
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (long long *)kC3DPlaneCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNPlane;
  return [(SCNGeometry *)&v4 initPresentationGeometryWithGeometryRef:a3];
}

- (id)presentationPlane
{
  id v2 = [[SCNPlane alloc] initPresentationParametricGeometryWithParametricGeometryRef:[(SCNGeometry *)self geometryRef]];

  return v2;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_width = C3DParametricGeometryGetFloatValue((uint64_t)a3, 0);
  self->_height = C3DParametricGeometryGetFloatValue((uint64_t)a3, 1);
  self->_cornerRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 3);
  self->_widthSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 11);
  self->_heightSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 12);
  self->_cornerSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 14);
  self->_primitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)cornerRadius
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_cornerRadius;
  }
  v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double ChamferRadius = C3DParametricGeometryGetChamferRadius((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return ChamferRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNPlane setCornerRadius:]();
    }
  }
  else if (self->_cornerRadius != cornerRadius)
  {
    self->_cornerRadius = cornerRadius;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__SCNPlane_setCornerRadius___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = cornerRadius;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"cornerRadius" applyBlock:v7];
  }
}

void __28__SCNPlane_setCornerRadius___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetChamferRadius(v2, v3);
}

- (NSInteger)cornerSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_cornerSegmentCount;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  NSInteger ChamferSegmentCount = (int)C3DParametricGeometryGetChamferSegmentCount((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return ChamferSegmentCount;
}

- (void)setCornerSegmentCount:(NSInteger)cornerSegmentCount
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNPlane setCornerSegmentCount:]();
    }
  }
  else if (self->_cornerSegmentCount != cornerSegmentCount)
  {
    self->_cornerSegmentCount = cornerSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__SCNPlane_setCornerSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = cornerSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"cornerSegmentCount" applyBlock:v7];
  }
}

void __34__SCNPlane_setCornerSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetChamferSegmentCount(v2, v3);
}

- (CGFloat)height
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_height;
  }
  int v3 = [(SCNGeometry *)self sceneRef];
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
      -[SCNPlane setHeight:]();
    }
  }
  else if (self->_height != height)
  {
    self->_height = height;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __22__SCNPlane_setHeight___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = height;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"height" applyBlock:v7];
  }
}

void __22__SCNPlane_setHeight___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetHeight(v2, v3);
}

- (NSInteger)heightSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_heightSegmentCount;
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
      -[SCNPlane setHeightSegmentCount:]();
    }
  }
  else if (self->_heightSegmentCount != heightSegmentCount)
  {
    self->_heightSegmentCount = heightSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__SCNPlane_setHeightSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = heightSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"heightSegmentCount" applyBlock:v7];
  }
}

void __34__SCNPlane_setHeightSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetHeightSegmentCount(v2, v3);
}

- (int64_t)primitiveType
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_primitiveType;
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
      -[SCNPlane setPrimitiveType:]();
    }
  }
  else if (self->_primitiveType != a3)
  {
    self->_primitiveType = a3;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __29__SCNPlane_setPrimitiveType___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __29__SCNPlane_setPrimitiveType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(char *)(a1 + 40);

  C3DParametricGeometrySetPrimitiveType(v2, v3);
}

- (CGFloat)width
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_width;
  }
  int v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double Width = C3DParametricGeometryGetWidth((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return Width;
}

- (void)setWidth:(CGFloat)width
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNPlane setWidth:]();
    }
  }
  else if (self->_width != width)
  {
    self->_width = width;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __21__SCNPlane_setWidth___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = width;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"width" applyBlock:v7];
  }
}

void __21__SCNPlane_setWidth___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetWidth(v2, v3);
}

- (NSInteger)widthSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_widthSegmentCount;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  NSInteger WidthSegmentCount = (int)C3DParametricGeometryGetWidthSegmentCount((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return WidthSegmentCount;
}

- (void)setWidthSegmentCount:(NSInteger)widthSegmentCount
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNPlane setWidthSegmentCount:]();
    }
  }
  else if (self->_widthSegmentCount != widthSegmentCount)
  {
    self->_widthSegmentCount = widthSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__SCNPlane_setWidthSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = widthSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"widthSegmentCount" applyBlock:v7];
  }
}

void __33__SCNPlane_setWidthSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetWidthSegmentCount(v2, v3);
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  float v24 = 0.0;
  float32x2_t v23 = 0;
  float v22 = 0.0;
  float32x2_t v21 = 0;
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    objc_super v7 = [(SCNGeometry *)self sceneRef];
    uint64_t v8 = (uint64_t)v7;
    if (v7) {
      C3DSceneLock((uint64_t)v7);
    }
    if ([(SCNGeometry *)self geometryRef])
    {
      C3DPlaneGetBoundingBox((float32x2_t *)[(SCNGeometry *)self geometryRef], &v23, &v21);
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
      v20.super_class = (Class)SCNPlane;
      return [(SCNGeometry *)&v20 getBoundingBoxMin:a3 max:a4];
    }
    [(SCNPlane *)self width];
    float64_t v12 = v11;
    [(SCNPlane *)self height];
    float64_t v14 = v13;
    v15.f64[0] = v12;
    C3DPlaneGetBoundingBoxForPlaneParameters(&v23, (uint64_t)&v21, v15, v14);
    BOOL v10 = v16;
  }
LABEL_12:
  if (a3)
  {
    float v17 = v24;
    *(float32x2_t *)&a3->x = v23;
    a3->z = v17;
  }
  if (a4)
  {
    float v18 = v22;
    *(float32x2_t *)&a4->x = v21;
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
      && C3DPlaneGetBoundingSphere((uint64_t)[(SCNGeometry *)self geometryRef], &v16))
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
  [(SCNPlane *)self width];
  double v12 = v11;
  [(SCNPlane *)self height];
  if (!C3DPlaneGetBoundingSphereForPlaneParameters(&v16, v12, v13)) {
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

+ (SCNPlane)planeWithWidth:(CGFloat)width height:(CGFloat)height
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setWidth:width];
  [v6 setHeight:height];

  return (SCNPlane *)v6;
}

- (id)description
{
  int v3 = NSString;
  id v4 = [(SCNGeometry *)self geometryDescription];
  [(SCNPlane *)self width];
  uint64_t v6 = v5;
  [(SCNPlane *)self height];
  return (id)[v3 stringWithFormat:@"<%@ | width=%.3f height=%.3f>", v4, v6, v7];
}

- (void)_setupObjCModelFrom:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNPlane;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  [a3 width];
  -[SCNPlane setWidth:](self, "setWidth:");
  [a3 height];
  -[SCNPlane setHeight:](self, "setHeight:");
  [a3 cornerRadius];
  -[SCNPlane setCornerRadius:](self, "setCornerRadius:");
  -[SCNPlane setWidthSegmentCount:](self, "setWidthSegmentCount:", [a3 widthSegmentCount]);
  -[SCNPlane setHeightSegmentCount:](self, "setHeightSegmentCount:", [a3 heightSegmentCount]);
  -[SCNPlane setCornerSegmentCount:](self, "setCornerSegmentCount:", [a3 cornerSegmentCount]);
  -[SCNPlane setPrimitiveType:](self, "setPrimitiveType:", [a3 primitiveType]);
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
  return [(SCNPlane *)self copyWithZone:0];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNPlane;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ([(SCNGeometry *)self isPresentationInstance]) {
    [(SCNPlane *)self _syncObjCModel:[(SCNGeometry *)self geometryRef]];
  }
  [a3 encodeDouble:@"width" forKey:self->_width];
  [a3 encodeDouble:@"height" forKey:self->_height];
  [a3 encodeDouble:@"cornerRadius" forKey:self->_cornerRadius];
  [a3 encodeInteger:self->_widthSegmentCount forKey:@"widthSegmentCount"];
  [a3 encodeInteger:self->_heightSegmentCount forKey:@"heightSegmentCount"];
  [a3 encodeInteger:self->_cornerSegmentCount forKey:@"cornerSegmentCount"];
  [a3 encodeInteger:self->_primitiveType forKey:@"primitiveType"];
}

- (SCNPlane)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNPlane;
  id v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [a3 decodeDoubleForKey:@"width"];
    -[SCNPlane setWidth:](v4, "setWidth:");
    [a3 decodeDoubleForKey:@"height"];
    -[SCNPlane setHeight:](v4, "setHeight:");
    [a3 decodeDoubleForKey:@"cornerRadius"];
    -[SCNPlane setCornerRadius:](v4, "setCornerRadius:");
    -[SCNPlane setWidthSegmentCount:](v4, "setWidthSegmentCount:", [a3 decodeIntegerForKey:@"widthSegmentCount"]);
    -[SCNPlane setHeightSegmentCount:](v4, "setHeightSegmentCount:", [a3 decodeIntegerForKey:@"heightSegmentCount"]);
    -[SCNPlane setCornerSegmentCount:](v4, "setCornerSegmentCount:", [a3 decodeIntegerForKey:@"cornerSegmentCount"]);
    -[SCNPlane setPrimitiveType:](v4, "setPrimitiveType:", [a3 decodeIntegerForKey:@"primitiveType"]);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setCornerRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setCornerSegmentCount:.cold.1()
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

- (void)setWidth:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setWidthSegmentCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

@end