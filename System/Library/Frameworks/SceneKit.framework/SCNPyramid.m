@interface SCNPyramid
+ (BOOL)supportsSecureCoding;
+ (SCNPyramid)pyramidWithWidth:(CGFloat)width height:(CGFloat)height length:(CGFloat)length;
- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4;
- (CGFloat)height;
- (CGFloat)length;
- (CGFloat)width;
- (NSInteger)heightSegmentCount;
- (NSInteger)lengthSegmentCount;
- (NSInteger)widthSegmentCount;
- (SCNPyramid)init;
- (SCNPyramid)initWithCoder:(id)a3;
- (SCNPyramid)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (__C3DGeometry)__createCFObject;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (id)presentationPyramid;
- (int64_t)primitiveType;
- (void)_setupObjCModelFrom:(id)a3;
- (void)_syncObjCModel:(__C3DParametricGeometry *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHeight:(CGFloat)height;
- (void)setHeightSegmentCount:(NSInteger)heightSegmentCount;
- (void)setLength:(CGFloat)length;
- (void)setLengthSegmentCount:(NSInteger)lengthSegmentCount;
- (void)setPrimitiveType:(int64_t)a3;
- (void)setWidth:(CGFloat)width;
- (void)setWidthSegmentCount:(NSInteger)widthSegmentCount;
@end

@implementation SCNPyramid

- (SCNPyramid)init
{
  v3 = (const void *)C3DParametricGeometryCreate(0, (long long *)kC3DPyramidCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNPyramid;
  v4 = [(SCNGeometry *)&v8 initWithGeometryRef:v3];
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNPyramid;
    [(SCNGeometry *)&v7 _syncObjCModel];
    [(SCNPyramid *)v5 _syncObjCModel:[(SCNGeometry *)v5 geometryRef]];
  }
  CFRelease(v3);
  return v5;
}

- (SCNPyramid)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNPyramid;
  v3 = [(SCNGeometry *)&v7 initWithGeometryRef:a3];
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNPyramid;
    [(SCNGeometry *)&v6 _syncObjCModel];
    [(SCNPyramid *)v4 _syncObjCModel:[(SCNGeometry *)v4 geometryRef]];
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (long long *)kC3DPyramidCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNPyramid;
  return [(SCNGeometry *)&v4 initPresentationGeometryWithGeometryRef:a3];
}

- (id)presentationPyramid
{
  id v2 = [[SCNPyramid alloc] initPresentationParametricGeometryWithParametricGeometryRef:[(SCNGeometry *)self geometryRef]];

  return v2;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_pyramidwidth = C3DParametricGeometryGetFloatValue((uint64_t)a3, 0);
  self->_pyramidheight = C3DParametricGeometryGetFloatValue((uint64_t)a3, 1);
  self->_pyramidlength = C3DParametricGeometryGetFloatValue((uint64_t)a3, 2);
  self->_pyramidwidthSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 11);
  self->_pyramidheightSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 12);
  self->_pyramidlengthSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 13);
  self->_pyramidprimitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)height
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_pyramidheight;
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
      -[SCNPyramid setHeight:]();
    }
  }
  else if (self->_pyramidheight != height)
  {
    self->_pyramidheight = height;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __24__SCNPyramid_setHeight___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = height;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"height" applyBlock:v7];
  }
}

void __24__SCNPyramid_setHeight___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetHeight(v2, v3);
}

- (NSInteger)heightSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_pyramidheightSegmentCount;
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
      -[SCNPyramid setHeightSegmentCount:]();
    }
  }
  else if (self->_pyramidheightSegmentCount != heightSegmentCount)
  {
    self->_pyramidheightSegmentCount = heightSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SCNPyramid_setHeightSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = heightSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"heightSegmentCount" applyBlock:v7];
  }
}

void __36__SCNPyramid_setHeightSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetHeightSegmentCount(v2, v3);
}

- (CGFloat)length
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_pyramidlength;
  }
  int v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  double Length = C3DParametricGeometryGetLength((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return Length;
}

- (void)setLength:(CGFloat)length
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNPyramid setLength:]();
    }
  }
  else if (self->_pyramidlength != length)
  {
    self->_pyramidlength = length;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __24__SCNPyramid_setLength___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = length;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"length" applyBlock:v7];
  }
}

void __24__SCNPyramid_setLength___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetLength(v2, v3);
}

- (NSInteger)lengthSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_pyramidlengthSegmentCount;
  }
  float v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  NSInteger LengthSegmentCount = (int)C3DParametricGeometryGetLengthSegmentCount((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return LengthSegmentCount;
}

- (void)setLengthSegmentCount:(NSInteger)lengthSegmentCount
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNPyramid setLengthSegmentCount:]();
    }
  }
  else if (self->_pyramidlengthSegmentCount != lengthSegmentCount)
  {
    self->_pyramidlengthSegmentCount = lengthSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SCNPyramid_setLengthSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = lengthSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"lengthSegmentCount" applyBlock:v7];
  }
}

void __36__SCNPyramid_setLengthSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetLengthSegmentCount(v2, v3);
}

- (int64_t)primitiveType
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_pyramidprimitiveType;
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
      -[SCNPyramid setPrimitiveType:]();
    }
  }
  else if (self->_pyramidprimitiveType != a3)
  {
    self->_pyramidprimitiveType = a3;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__SCNPyramid_setPrimitiveType___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __31__SCNPyramid_setPrimitiveType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(char *)(a1 + 40);

  C3DParametricGeometrySetPrimitiveType(v2, v3);
}

- (CGFloat)width
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_pyramidwidth;
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
      -[SCNPyramid setWidth:]();
    }
  }
  else if (self->_pyramidwidth != width)
  {
    self->_pyramidwidth = width;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __23__SCNPyramid_setWidth___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = width;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"width" applyBlock:v7];
  }
}

void __23__SCNPyramid_setWidth___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetWidth(v2, v3);
}

- (NSInteger)widthSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_pyramidwidthSegmentCount;
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
      -[SCNPyramid setWidthSegmentCount:]();
    }
  }
  else if (self->_pyramidwidthSegmentCount != widthSegmentCount)
  {
    self->_pyramidwidthSegmentCount = widthSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__SCNPyramid_setWidthSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = widthSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"widthSegmentCount" applyBlock:v7];
  }
}

void __35__SCNPyramid_setWidthSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetWidthSegmentCount(v2, v3);
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  float v26 = 0.0;
  uint64_t v25 = 0;
  float v24 = 0.0;
  uint64_t v23 = 0;
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    objc_super v7 = [(SCNGeometry *)self sceneRef];
    uint64_t v8 = (uint64_t)v7;
    if (v7) {
      C3DSceneLock((uint64_t)v7);
    }
    if ([(SCNGeometry *)self geometryRef])
    {
      C3DPyramidGetBoundingBox((uint64_t)[(SCNGeometry *)self geometryRef], (uint64_t)&v25, (uint64_t)&v23);
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
      v22.receiver = self;
      v22.super_class = (Class)SCNPyramid;
      return [(SCNGeometry *)&v22 getBoundingBoxMin:a3 max:a4];
    }
    [(SCNPyramid *)self width];
    uint64_t v12 = v11;
    [(SCNPyramid *)self height];
    double v14 = v13;
    [(SCNPyramid *)self length];
    float64_t v16 = v15;
    v17.i64[0] = v12;
    C3DPyramidGetBoundingBoxForPyramidParameters((uint64_t)&v25, (uint64_t)&v23, v17, v14, v16);
    BOOL v10 = v18;
  }
LABEL_12:
  if (a3)
  {
    float v19 = v26;
    *(void *)&a3->x = v25;
    a3->z = v19;
  }
  if (a4)
  {
    float v20 = v24;
    *(void *)&a4->x = v23;
    a4->z = v20;
  }
  return v10;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  int32x4_t v19 = 0uLL;
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    objc_super v7 = [(SCNGeometry *)self sceneRef];
    uint64_t v8 = (uint64_t)v7;
    if (v7) {
      C3DSceneLock((uint64_t)v7);
    }
    if ([(SCNGeometry *)self geometryRef]
      && C3DPyramidGetBoundingSphere((uint64_t)[(SCNGeometry *)self geometryRef], &v19))
    {
      if (a3)
      {
        float v9 = *(float *)&v19.i32[2];
        *(void *)&a3->x = v19.i64[0];
        a3->z = v9;
      }
      if (a4) {
        *a4 = *(float *)&v19.i32[3];
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
  [(SCNPyramid *)self width];
  double v12 = v11;
  [(SCNPyramid *)self height];
  float64_t v14 = v13;
  [(SCNPyramid *)self length];
  v15.f64[0] = v14;
  if (!C3DPyramidGetBoundingSphereForPyramidParameters(&v19, v12, v15, v16)) {
    return 0;
  }
  if (a3)
  {
    float v17 = *(float *)&v19.i32[2];
    *(void *)&a3->x = v19.i64[0];
    a3->z = v17;
  }
  if (a4) {
    *a4 = *(float *)&v19.i32[3];
  }
  return 1;
}

+ (SCNPyramid)pyramidWithWidth:(CGFloat)width height:(CGFloat)height length:(CGFloat)length
{
  id v8 = objc_alloc_init((Class)a1);
  [v8 setWidth:width];
  [v8 setHeight:height];
  [v8 setLength:length];

  return (SCNPyramid *)v8;
}

- (id)description
{
  int v3 = NSString;
  id v4 = [(SCNGeometry *)self geometryDescription];
  [(SCNPyramid *)self width];
  uint64_t v6 = v5;
  [(SCNPyramid *)self height];
  uint64_t v8 = v7;
  [(SCNPyramid *)self length];
  return (id)[v3 stringWithFormat:@"<%@ | width=%.3f height=%.3f length=%.3f>", v4, v6, v8, v9];
}

- (void)_setupObjCModelFrom:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNPyramid;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  [a3 width];
  -[SCNPyramid setWidth:](self, "setWidth:");
  [a3 height];
  -[SCNPyramid setHeight:](self, "setHeight:");
  [a3 length];
  -[SCNPyramid setLength:](self, "setLength:");
  -[SCNPyramid setWidthSegmentCount:](self, "setWidthSegmentCount:", [a3 widthSegmentCount]);
  -[SCNPyramid setHeightSegmentCount:](self, "setHeightSegmentCount:", [a3 heightSegmentCount]);
  -[SCNPyramid setLengthSegmentCount:](self, "setLengthSegmentCount:", [a3 lengthSegmentCount]);
  -[SCNPyramid setPrimitiveType:](self, "setPrimitiveType:", [a3 primitiveType]);
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
  return [(SCNPyramid *)self copyWithZone:0];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNPyramid;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ([(SCNGeometry *)self isPresentationInstance]) {
    [(SCNPyramid *)self _syncObjCModel:[(SCNGeometry *)self geometryRef]];
  }
  [a3 encodeDouble:@"pyramidwidth" forKey:self->_pyramidwidth];
  [a3 encodeDouble:@"pyramidheight" forKey:self->_pyramidheight];
  [a3 encodeDouble:@"pyramidlength" forKey:self->_pyramidlength];
  [a3 encodeInteger:self->_pyramidwidthSegmentCount forKey:@"pyramidwidthSegmentCount"];
  [a3 encodeInteger:self->_pyramidheightSegmentCount forKey:@"pyramidheightSegmentCount"];
  [a3 encodeInteger:self->_pyramidlengthSegmentCount forKey:@"pyramidlengthSegmentCount"];
  [a3 encodeInteger:self->_pyramidprimitiveType forKey:@"pyramidprimitiveType"];
}

- (SCNPyramid)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNPyramid;
  id v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [a3 decodeDoubleForKey:@"pyramidwidth"];
    -[SCNPyramid setWidth:](v4, "setWidth:");
    [a3 decodeDoubleForKey:@"pyramidheight"];
    -[SCNPyramid setHeight:](v4, "setHeight:");
    [a3 decodeDoubleForKey:@"pyramidlength"];
    -[SCNPyramid setLength:](v4, "setLength:");
    -[SCNPyramid setWidthSegmentCount:](v4, "setWidthSegmentCount:", [a3 decodeIntegerForKey:@"pyramidwidthSegmentCount"]);
    -[SCNPyramid setHeightSegmentCount:](v4, "setHeightSegmentCount:", [a3 decodeIntegerForKey:@"pyramidheightSegmentCount"]);
    -[SCNPyramid setLengthSegmentCount:](v4, "setLengthSegmentCount:", [a3 decodeIntegerForKey:@"pyramidlengthSegmentCount"]);
    -[SCNPyramid setPrimitiveType:](v4, "setPrimitiveType:", [a3 decodeIntegerForKey:@"pyramidprimitiveType"]);
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

- (void)setLength:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setLengthSegmentCount:.cold.1()
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