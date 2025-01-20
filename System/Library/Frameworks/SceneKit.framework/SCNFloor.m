@interface SCNFloor
+ (BOOL)supportsSecureCoding;
+ (SCNFloor)floor;
- (CGFloat)length;
- (CGFloat)reflectionFalloffEnd;
- (CGFloat)reflectionFalloffStart;
- (CGFloat)reflectionResolutionScaleFactor;
- (CGFloat)reflectivity;
- (CGFloat)width;
- (NSUInteger)reflectionCategoryBitMask;
- (SCNFloor)init;
- (SCNFloor)initWithCoder:(id)a3;
- (SCNFloor)initWithFloorGeometryRef:(__C3DFloor *)a3;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)reflectionSampleCount;
- (void)_customDecodingOfSCNFloor:(id)a3;
- (void)_syncObjCModel;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLength:(CGFloat)length;
- (void)setReflectionCategoryBitMask:(NSUInteger)reflectionCategoryBitMask;
- (void)setReflectionFalloffEnd:(CGFloat)reflectionFalloffEnd;
- (void)setReflectionFalloffStart:(CGFloat)reflectionFalloffStart;
- (void)setReflectionResolutionScaleFactor:(CGFloat)reflectionResolutionScaleFactor;
- (void)setReflectionSampleCount:(unint64_t)a3;
- (void)setReflectivity:(CGFloat)reflectivity;
- (void)setWidth:(CGFloat)width;
@end

@implementation SCNFloor

- (void)_syncObjCModel
{
  self->_reflectivity = C3DFloorGetReflectivity((uint64_t)[(SCNGeometry *)self geometryRef]);
  self->_reflectionFalloffStart = C3DFloorGetReflectionFalloffStart((uint64_t)[(SCNGeometry *)self geometryRef]);
  self->_reflectionFalloffEnd = C3DFloorGetReflectionFalloffEnd((uint64_t)[(SCNGeometry *)self geometryRef]);
  self->_reflectionResolutionScaleFactor = C3DFloorGetReflectionResolutionScaleFactor((uint64_t)[(SCNGeometry *)self geometryRef]);
  self->_reflectionCategoryBitMask = C3DFloorGetReflectionCategoryBitMask((uint64_t)[(SCNGeometry *)self geometryRef]);
  v3.receiver = self;
  v3.super_class = (Class)SCNFloor;
  [(SCNGeometry *)&v3 _syncObjCModel];
}

- (SCNFloor)init
{
  objc_super v3 = (const void *)C3DFloorCreate();
  v6.receiver = self;
  v6.super_class = (Class)SCNFloor;
  v4 = [(SCNGeometry *)&v6 initWithGeometryRef:v3];
  CFRelease(v3);
  return v4;
}

- (SCNFloor)initWithFloorGeometryRef:(__C3DFloor *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNFloor;
  objc_super v3 = [(SCNGeometry *)&v6 initWithGeometryRef:a3];
  v4 = v3;
  if (v3) {
    [(SCNFloor *)v3 _syncObjCModel];
  }
  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SCNFloor;
  [(SCNGeometry *)&v2 dealloc];
}

+ (SCNFloor)floor
{
  id v2 = objc_alloc_init((Class)a1);

  return (SCNFloor *)v2;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)setReflectionResolutionScaleFactor:(CGFloat)reflectionResolutionScaleFactor
{
  if (*((unsigned char *)self + 168))
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNFloor setReflectionResolutionScaleFactor:]();
    }
  }
  else if (self->_reflectionResolutionScaleFactor != reflectionResolutionScaleFactor)
  {
    float v4 = reflectionResolutionScaleFactor;
    self->_reflectionResolutionScaleFactor = v4;
    if (reflectionResolutionScaleFactor == 0.0) {
      double v5 = 0.5;
    }
    else {
      double v5 = reflectionResolutionScaleFactor;
    }
    *((unsigned char *)self + 168) = *((unsigned char *)self + 168) & 0xFD | (2 * (reflectionResolutionScaleFactor != 0.0));
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __47__SCNFloor_setReflectionResolutionScaleFactor___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(double *)&v8[5] = v5;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v8];
  }
}

void __47__SCNFloor_setReflectionResolutionScaleFactor___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DFloorSetReflectionResolutionScaleFactor(v2, v3);
}

- (void)setReflectionCategoryBitMask:(NSUInteger)reflectionCategoryBitMask
{
  if (*((unsigned char *)self + 168))
  {
    objc_super v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNFloor setReflectionCategoryBitMask:]();
    }
  }
  else if (self->_reflectionCategoryBitMask != reflectionCategoryBitMask)
  {
    self->_reflectionCategoryBitMask = reflectionCategoryBitMask;
    double v5 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__SCNFloor_setReflectionCategoryBitMask___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = reflectionCategoryBitMask;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

uint64_t __41__SCNFloor_setReflectionCategoryBitMask___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  uint64_t v3 = (unint64_t)(float)*(unint64_t *)(a1 + 40);

  return C3DFloorSetReflectionCategoryBitMask(v2, v3);
}

- (NSUInteger)reflectionCategoryBitMask
{
  if ((*((unsigned char *)self + 168) & 1) == 0) {
    return self->_reflectionCategoryBitMask;
  }
  float v4 = [(SCNGeometry *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  NSUInteger ReflectionCategoryBitMask = C3DFloorGetReflectionCategoryBitMask((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return ReflectionCategoryBitMask;
}

- (void)setWidth:(CGFloat)width
{
  if (*((unsigned char *)self + 168))
  {
    objc_super v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNFloor setWidth:]();
    }
  }
  else if (self->_width != width)
  {
    self->_width = width;
    uint64_t v5 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __21__SCNFloor_setWidth___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = width;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"width" applyBlock:v7];
  }
}

uint64_t __21__SCNFloor_setWidth___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  return C3DFloorSetWidth(v2, v3);
}

- (CGFloat)width
{
  if ((*((unsigned char *)self + 168) & 1) == 0) {
    return self->_width;
  }
  float v4 = [(SCNGeometry *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  double Width = C3DFloorGetWidth((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return Width;
}

- (void)setLength:(CGFloat)length
{
  if (*((unsigned char *)self + 168))
  {
    objc_super v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNFloor setLength:]();
    }
  }
  else if (self->_length != length)
  {
    self->_length = length;
    uint64_t v5 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __22__SCNFloor_setLength___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = length;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"length" applyBlock:v7];
  }
}

uint64_t __22__SCNFloor_setLength___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  return C3DFloorSetLength(v2, v3);
}

- (CGFloat)length
{
  if ((*((unsigned char *)self + 168) & 1) == 0) {
    return self->_length;
  }
  float v4 = [(SCNGeometry *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  double Length = C3DFloorGetLength((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return Length;
}

- (CGFloat)reflectionFalloffEnd
{
  if (*((unsigned char *)self + 168))
  {
    float v4 = [(SCNGeometry *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    float ReflectionFalloffEnd = C3DFloorGetReflectionFalloffEnd((uint64_t)[(SCNGeometry *)self geometryRef]);
    if (v5) {
      C3DSceneUnlock(v5);
    }
  }
  else
  {
    return self->_reflectionFalloffEnd;
  }
  return ReflectionFalloffEnd;
}

- (void)setReflectionFalloffEnd:(CGFloat)reflectionFalloffEnd
{
  if (*((unsigned char *)self + 168))
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNFloor setReflectionFalloffEnd:]();
    }
  }
  else if (self->_reflectionFalloffEnd != reflectionFalloffEnd)
  {
    float v5 = reflectionFalloffEnd;
    self->_reflectionFalloffEnd = v5;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__SCNFloor_setReflectionFalloffEnd___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = reflectionFalloffEnd;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"reflectionFalloffEnd" applyBlock:v8];
  }
}

void __36__SCNFloor_setReflectionFalloffEnd___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DFloorSetReflectionFalloffEnd(v2, v3);
}

- (CGFloat)reflectionFalloffStart
{
  if (*((unsigned char *)self + 168))
  {
    float v4 = [(SCNGeometry *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    float ReflectionFalloffStart = C3DFloorGetReflectionFalloffStart((uint64_t)[(SCNGeometry *)self geometryRef]);
    if (v5) {
      C3DSceneUnlock(v5);
    }
  }
  else
  {
    return self->_reflectionFalloffStart;
  }
  return ReflectionFalloffStart;
}

- (void)setReflectionFalloffStart:(CGFloat)reflectionFalloffStart
{
  if (*((unsigned char *)self + 168))
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNFloor setReflectionFalloffStart:]();
    }
  }
  else if (self->_reflectionFalloffStart != reflectionFalloffStart)
  {
    float v5 = reflectionFalloffStart;
    self->_reflectionFalloffStart = v5;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__SCNFloor_setReflectionFalloffStart___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = reflectionFalloffStart;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"reflectionFalloffStart" applyBlock:v8];
  }
}

void __38__SCNFloor_setReflectionFalloffStart___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DFloorSetReflectionFalloffStart(v2, v3);
}

- (CGFloat)reflectionResolutionScaleFactor
{
  if (*((unsigned char *)self + 168))
  {
    float v4 = [(SCNGeometry *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    float ReflectionResolutionScaleFactor = C3DFloorGetReflectionResolutionScaleFactor((uint64_t)[(SCNGeometry *)self geometryRef]);
    if (v5) {
      C3DSceneUnlock(v5);
    }
  }
  else
  {
    return self->_reflectionResolutionScaleFactor;
  }
  return ReflectionResolutionScaleFactor;
}

- (unint64_t)reflectionSampleCount
{
  if ((*((unsigned char *)self + 168) & 1) == 0) {
    return self->_reflectionSampleCount;
  }
  float v4 = [(SCNGeometry *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  unint64_t ReflectionSampleCount = (int)C3DFloorGetReflectionSampleCount((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return ReflectionSampleCount;
}

- (void)setReflectionSampleCount:(unint64_t)a3
{
  if (*((unsigned char *)self + 168))
  {
    objc_super v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNFloor setReflectionSampleCount:]();
    }
  }
  else if (self->_reflectionSampleCount != a3)
  {
    self->_reflectionSampleCount = a3;
    uint64_t v5 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SCNFloor_setReflectionSampleCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __37__SCNFloor_setReflectionSampleCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  uint64_t v3 = *(void *)(a1 + 40);

  C3DFloorSetReflectionSampleCount(v2, v3);
}

- (CGFloat)reflectivity
{
  if (*((unsigned char *)self + 168))
  {
    float v4 = [(SCNGeometry *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    float Reflectivity = C3DFloorGetReflectivity((uint64_t)[(SCNGeometry *)self geometryRef]);
    if (v5) {
      C3DSceneUnlock(v5);
    }
  }
  else
  {
    return self->_reflectivity;
  }
  return Reflectivity;
}

- (void)setReflectivity:(CGFloat)reflectivity
{
  if (*((unsigned char *)self + 168))
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNFloor setReflectivity:]();
    }
  }
  else if (self->_reflectivity != reflectivity)
  {
    float v5 = reflectivity;
    self->_reflectivity = v5;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__SCNFloor_setReflectivity___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = reflectivity;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"reflectivity" applyBlock:v8];
  }
}

void __28__SCNFloor_setReflectivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DFloorSetReflectivity(v2, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  [v4 _setupObjCModelFrom:self];
  [(SCNFloor *)self reflectivity];
  objc_msgSend(v4, "setReflectivity:");
  [(SCNFloor *)self reflectionFalloffEnd];
  objc_msgSend(v4, "setReflectionFalloffEnd:");
  [(SCNFloor *)self reflectionFalloffStart];
  objc_msgSend(v4, "setReflectionFalloffStart:");
  [(SCNFloor *)self reflectionResolutionScaleFactor];
  objc_msgSend(v4, "setReflectionResolutionScaleFactor:");
  objc_msgSend(v4, "setReflectionSampleCount:", -[SCNFloor reflectionSampleCount](self, "reflectionSampleCount"));
  objc_msgSend(v4, "setReflectionCategoryBitMask:", -[SCNFloor reflectionCategoryBitMask](self, "reflectionCategoryBitMask"));
  [(SCNFloor *)self width];
  objc_msgSend(v4, "setWidth:");
  [(SCNFloor *)self length];
  objc_msgSend(v4, "setLength:");
  [v4 _copyAnimationsFrom:self];
  +[SCNTransaction commitImmediate];
  return v4;
}

- (void)_customDecodingOfSCNFloor:(id)a3
{
  self->_reflectivity = C3DFloorGetReflectivity((uint64_t)[(SCNGeometry *)self geometryRef]);
  self->_reflectionCategoryBitMask = C3DFloorGetReflectionCategoryBitMask((uint64_t)[(SCNGeometry *)self geometryRef]);
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SCNFloor;
  -[SCNGeometry encodeWithCoder:](&v11, sel_encodeWithCoder_);
  *(float *)&double v5 = self->_reflectivity;
  [a3 encodeFloat:@"reflectivity" forKey:v5];
  *(float *)&double v6 = self->_reflectionFalloffStart;
  [a3 encodeFloat:@"reflectionFalloffStart" forKey:v6];
  *(float *)&double v7 = self->_reflectionFalloffEnd;
  [a3 encodeFloat:@"reflectionFalloffEnd" forKey:v7];
  double width = self->_width;
  *(float *)&double width = width;
  [a3 encodeFloat:@"width" forKey:width];
  double length = self->_length;
  *(float *)&double length = length;
  [a3 encodeFloat:@"length" forKey:length];
  [a3 encodeInteger:self->_reflectionCategoryBitMask forKey:@"reflectionCategoryBitMask"];
  if ((*((unsigned char *)self + 168) & 2) != 0)
  {
    *(float *)&double v10 = self->_reflectionResolutionScaleFactor;
    [a3 encodeFloat:@"reflectionResolutionScaleFactor" forKey:v10];
  }
}

- (SCNFloor)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SCNFloor;
  id v4 = -[SCNGeometry initWithCoder:](&v13, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNFloor *)v4 _customDecodingOfSCNFloor:a3];
    [a3 decodeFloatForKey:@"reflectivity"];
    [(SCNFloor *)v4 setReflectivity:v6];
    [a3 decodeFloatForKey:@"reflectionFalloffStart"];
    [(SCNFloor *)v4 setReflectionFalloffStart:v7];
    [a3 decodeFloatForKey:@"reflectionFalloffEnd"];
    [(SCNFloor *)v4 setReflectionFalloffEnd:v8];
    [a3 decodeFloatForKey:@"width"];
    [(SCNFloor *)v4 setWidth:v9];
    [a3 decodeFloatForKey:@"length"];
    [(SCNFloor *)v4 setLength:v10];
    if ([a3 containsValueForKey:@"reflectionCategoryBitMask"]) {
      -[SCNFloor setReflectionCategoryBitMask:](v4, "setReflectionCategoryBitMask:", [a3 decodeIntegerForKey:@"reflectionCategoryBitMask"]);
    }
    if ([a3 containsValueForKey:@"reflectionResolutionScaleFactor"])
    {
      [a3 decodeFloatForKey:@"reflectionResolutionScaleFactor"];
      if (v11 != 0.0)
      {
        [(SCNFloor *)v4 setReflectionResolutionScaleFactor:v11];
        *((unsigned char *)v4 + 168) |= 2u;
      }
    }
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setReflectionResolutionScaleFactor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setReflectionCategoryBitMask:.cold.1()
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

- (void)setLength:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setReflectionFalloffEnd:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setReflectionFalloffStart:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setReflectionSampleCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setReflectivity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

@end