@interface SCNBox
+ (BOOL)supportsSecureCoding;
+ (SCNBox)boxWithWidth:(CGFloat)width height:(CGFloat)height length:(CGFloat)length chamferRadius:(CGFloat)chamferRadius;
+ (id)box;
- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4;
- (CGFloat)chamferRadius;
- (CGFloat)height;
- (CGFloat)length;
- (CGFloat)width;
- (NSInteger)chamferSegmentCount;
- (NSInteger)heightSegmentCount;
- (NSInteger)lengthSegmentCount;
- (NSInteger)widthSegmentCount;
- (SCNBox)init;
- (SCNBox)initWithCoder:(id)a3;
- (SCNBox)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (__C3DGeometry)__createCFObject;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3;
- (id)presentationBox;
- (int64_t)primitiveType;
- (void)_setupObjCModelFrom:(id)a3;
- (void)_syncObjCModel:(__C3DParametricGeometry *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setChamferRadius:(CGFloat)chamferRadius;
- (void)setChamferSegmentCount:(NSInteger)chamferSegmentCount;
- (void)setHeight:(CGFloat)height;
- (void)setHeightSegmentCount:(NSInteger)heightSegmentCount;
- (void)setLength:(CGFloat)length;
- (void)setLengthSegmentCount:(NSInteger)lengthSegmentCount;
- (void)setPrimitiveType:(int64_t)a3;
- (void)setWidth:(CGFloat)width;
- (void)setWidthSegmentCount:(NSInteger)widthSegmentCount;
@end

@implementation SCNBox

- (SCNBox)init
{
  v3 = (const void *)C3DParametricGeometryCreate(0, (long long *)&kC3DBoxCallBacks);
  v8.receiver = self;
  v8.super_class = (Class)SCNBox;
  v4 = [(SCNGeometry *)&v8 initWithGeometryRef:v3];
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)SCNBox;
    [(SCNGeometry *)&v7 _syncObjCModel];
    [(SCNBox *)v5 _syncObjCModel:[(SCNGeometry *)v5 geometryRef]];
  }
  CFRelease(v3);
  return v5;
}

- (SCNBox)initWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNBox;
  v3 = [(SCNGeometry *)&v7 initWithGeometryRef:a3];
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)SCNBox;
    [(SCNGeometry *)&v6 _syncObjCModel];
    [(SCNBox *)v4 _syncObjCModel:[(SCNGeometry *)v4 geometryRef]];
  }
  return v4;
}

- (__C3DGeometry)__createCFObject
{
  return (__C3DGeometry *)C3DParametricGeometryCreate(0, (long long *)&kC3DBoxCallBacks);
}

- (id)initPresentationParametricGeometryWithParametricGeometryRef:(__C3DParametricGeometry *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNBox;
  return [(SCNGeometry *)&v4 initPresentationGeometryWithGeometryRef:a3];
}

- (id)presentationBox
{
  id v2 = [[SCNBox alloc] initPresentationParametricGeometryWithParametricGeometryRef:[(SCNGeometry *)self geometryRef]];

  return v2;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (void)_syncObjCModel:(__C3DParametricGeometry *)a3
{
  self->_boxwidth = C3DParametricGeometryGetFloatValue((uint64_t)a3, 0);
  self->_boxheight = C3DParametricGeometryGetFloatValue((uint64_t)a3, 1);
  self->_boxlength = C3DParametricGeometryGetFloatValue((uint64_t)a3, 2);
  self->_boxchamferRadius = C3DParametricGeometryGetFloatValue((uint64_t)a3, 3);
  self->_boxwidthSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 11);
  self->_boxheightSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 12);
  self->_boxlengthSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 13);
  self->_boxchamferSegmentCount = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 14);
  self->_boxprimitiveType = (int64_t)C3DParametricGeometryGetIntValue((uint64_t)a3, 20);
}

- (CGFloat)chamferRadius
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_boxchamferRadius;
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

- (void)setChamferRadius:(CGFloat)chamferRadius
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNBox setChamferRadius:]();
    }
  }
  else if (self->_boxchamferRadius != chamferRadius)
  {
    self->_boxchamferRadius = chamferRadius;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__SCNBox_setChamferRadius___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = chamferRadius;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"chamferRadius" applyBlock:v7];
  }
}

void __27__SCNBox_setChamferRadius___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetChamferRadius(v2, v3);
}

- (NSInteger)chamferSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_boxchamferSegmentCount;
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

- (void)setChamferSegmentCount:(NSInteger)chamferSegmentCount
{
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNBox setChamferSegmentCount:]();
    }
  }
  else if (self->_boxchamferSegmentCount != chamferSegmentCount)
  {
    self->_boxchamferSegmentCount = chamferSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__SCNBox_setChamferSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = chamferSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"chamferSegmentCount" applyBlock:v7];
  }
}

void __33__SCNBox_setChamferSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetChamferSegmentCount(v2, v3);
}

- (CGFloat)height
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_boxheight;
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
      -[SCNBox setHeight:]();
    }
  }
  else if (self->_boxheight != height)
  {
    self->_boxheight = height;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __20__SCNBox_setHeight___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = height;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"height" applyBlock:v7];
  }
}

void __20__SCNBox_setHeight___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetHeight(v2, v3);
}

- (NSInteger)heightSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_boxheightSegmentCount;
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
      -[SCNBox setHeightSegmentCount:]();
    }
  }
  else if (self->_boxheightSegmentCount != heightSegmentCount)
  {
    self->_boxheightSegmentCount = heightSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__SCNBox_setHeightSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = heightSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"heightSegmentCount" applyBlock:v7];
  }
}

void __32__SCNBox_setHeightSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetHeightSegmentCount(v2, v3);
}

- (CGFloat)length
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_boxlength;
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
      -[SCNBox setLength:]();
    }
  }
  else if (self->_boxlength != length)
  {
    self->_boxlength = length;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __20__SCNBox_setLength___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = length;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"length" applyBlock:v7];
  }
}

void __20__SCNBox_setLength___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetLength(v2, v3);
}

- (NSInteger)lengthSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_boxlengthSegmentCount;
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
      -[SCNBox setLengthSegmentCount:]();
    }
  }
  else if (self->_boxlengthSegmentCount != lengthSegmentCount)
  {
    self->_boxlengthSegmentCount = lengthSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__SCNBox_setLengthSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = lengthSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"lengthSegmentCount" applyBlock:v7];
  }
}

void __32__SCNBox_setLengthSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetLengthSegmentCount(v2, v3);
}

- (int64_t)primitiveType
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_boxprimitiveType;
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
      -[SCNBox setPrimitiveType:]();
    }
  }
  else if (self->_boxprimitiveType != a3)
  {
    self->_boxprimitiveType = a3;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__SCNBox_setPrimitiveType___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __27__SCNBox_setPrimitiveType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(char *)(a1 + 40);

  C3DParametricGeometrySetPrimitiveType(v2, v3);
}

- (CGFloat)width
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_boxwidth;
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
      -[SCNBox setWidth:]();
    }
  }
  else if (self->_boxwidth != width)
  {
    self->_boxwidth = width;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __19__SCNBox_setWidth___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = width;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"width" applyBlock:v7];
  }
}

void __19__SCNBox_setWidth___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  float v3 = *(double *)(a1 + 40);

  C3DParametricGeometrySetWidth(v2, v3);
}

- (NSInteger)widthSegmentCount
{
  if (![(SCNGeometry *)self isPresentationInstance]) {
    return self->_boxwidthSegmentCount;
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
      -[SCNBox setWidthSegmentCount:]();
    }
  }
  else if (self->_boxwidthSegmentCount != widthSegmentCount)
  {
    self->_boxwidthSegmentCount = widthSegmentCount;
    objc_super v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__SCNBox_setWidthSegmentCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = widthSegmentCount;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"widthSegmentCount" applyBlock:v7];
  }
}

void __31__SCNBox_setWidthSegmentCount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DParametricGeometrySetWidthSegmentCount(v2, v3);
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  float v26 = 0.0;
  float32x2_t v25 = 0;
  float v24 = 0.0;
  float32x2_t v23 = 0;
  if ([(SCNGeometry *)self isPresentationInstance])
  {
    objc_super v7 = [(SCNGeometry *)self sceneRef];
    uint64_t v8 = (uint64_t)v7;
    if (v7) {
      C3DSceneLock((uint64_t)v7);
    }
    if ([(SCNGeometry *)self geometryRef])
    {
      C3DBoxGetBoundingBox((float32x2_t *)[(SCNGeometry *)self geometryRef], &v25, &v23);
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
      v22.super_class = (Class)SCNBox;
      return [(SCNGeometry *)&v22 getBoundingBoxMin:a3 max:a4];
    }
    [(SCNBox *)self width];
    float64_t v12 = v11;
    [(SCNBox *)self height];
    float64_t v14 = v13;
    [(SCNBox *)self length];
    double v16 = v15;
    v17.f64[0] = v12;
    C3DBoxGetBoundingBoxForBoxParameters(&v25, (uint64_t)&v23, v17, v14, v16);
    BOOL v10 = v18;
  }
LABEL_12:
  if (a3)
  {
    float v19 = v26;
    *(float32x2_t *)&a3->x = v25;
    a3->z = v19;
  }
  if (a4)
  {
    float v20 = v24;
    *(float32x2_t *)&a4->x = v23;
    a4->z = v20;
  }
  return v10;
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
      && C3DBoxGetBoundingSphere((float *)[(SCNGeometry *)self geometryRef], &v18))
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
  [(SCNBox *)self width];
  double v12 = v11;
  [(SCNBox *)self height];
  double v14 = v13;
  [(SCNBox *)self length];
  if (!C3DBoxGetBoundingSphereForBoxParameters(&v18, v12, v14, v15)) {
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

+ (SCNBox)boxWithWidth:(CGFloat)width height:(CGFloat)height length:(CGFloat)length chamferRadius:(CGFloat)chamferRadius
{
  id v10 = objc_alloc_init((Class)a1);
  [v10 setWidth:width];
  [v10 setHeight:height];
  [v10 setLength:length];
  [v10 setChamferRadius:chamferRadius];

  return (SCNBox *)v10;
}

+ (id)box
{
  return (id)[a1 boxWithWidth:1.0 height:1.0 length:1.0 chamferRadius:0.0];
}

- (id)description
{
  int v3 = NSString;
  id v4 = [(SCNGeometry *)self geometryDescription];
  [(SCNBox *)self width];
  uint64_t v6 = v5;
  [(SCNBox *)self height];
  uint64_t v8 = v7;
  [(SCNBox *)self length];
  uint64_t v10 = v9;
  [(SCNBox *)self chamferRadius];
  return (id)[v3 stringWithFormat:@"<%@ | width=%.3f height=%.3f length=%.3f chamferRadius=%.3f>", v4, v6, v8, v10, v11];
}

- (void)_setupObjCModelFrom:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNBox;
  -[SCNGeometry _setupObjCModelFrom:](&v5, sel__setupObjCModelFrom_);
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  [a3 width];
  -[SCNBox setWidth:](self, "setWidth:");
  [a3 height];
  -[SCNBox setHeight:](self, "setHeight:");
  [a3 length];
  -[SCNBox setLength:](self, "setLength:");
  [a3 chamferRadius];
  -[SCNBox setChamferRadius:](self, "setChamferRadius:");
  -[SCNBox setWidthSegmentCount:](self, "setWidthSegmentCount:", [a3 widthSegmentCount]);
  -[SCNBox setHeightSegmentCount:](self, "setHeightSegmentCount:", [a3 heightSegmentCount]);
  -[SCNBox setLengthSegmentCount:](self, "setLengthSegmentCount:", [a3 lengthSegmentCount]);
  -[SCNBox setChamferSegmentCount:](self, "setChamferSegmentCount:", [a3 chamferSegmentCount]);
  -[SCNBox setPrimitiveType:](self, "setPrimitiveType:", [a3 primitiveType]);
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
  return [(SCNBox *)self copyWithZone:0];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNBox;
  -[SCNGeometry encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ([(SCNGeometry *)self isPresentationInstance]) {
    [(SCNBox *)self _syncObjCModel:[(SCNGeometry *)self geometryRef]];
  }
  [a3 encodeDouble:@"boxwidth" forKey:self->_boxwidth];
  [a3 encodeDouble:@"boxheight" forKey:self->_boxheight];
  [a3 encodeDouble:@"boxlength" forKey:self->_boxlength];
  [a3 encodeDouble:@"boxchamferRadius" forKey:self->_boxchamferRadius];
  [a3 encodeInteger:self->_boxwidthSegmentCount forKey:@"boxwidthSegmentCount"];
  [a3 encodeInteger:self->_boxheightSegmentCount forKey:@"boxheightSegmentCount"];
  [a3 encodeInteger:self->_boxlengthSegmentCount forKey:@"boxlengthSegmentCount"];
  [a3 encodeInteger:self->_boxchamferSegmentCount forKey:@"boxchamferSegmentCount"];
  [a3 encodeInteger:self->_boxprimitiveType forKey:@"boxprimitiveType"];
}

- (SCNBox)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNBox;
  id v4 = -[SCNGeometry initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [a3 decodeDoubleForKey:@"boxwidth"];
    -[SCNBox setWidth:](v4, "setWidth:");
    [a3 decodeDoubleForKey:@"boxheight"];
    -[SCNBox setHeight:](v4, "setHeight:");
    [a3 decodeDoubleForKey:@"boxlength"];
    -[SCNBox setLength:](v4, "setLength:");
    [a3 decodeDoubleForKey:@"boxchamferRadius"];
    -[SCNBox setChamferRadius:](v4, "setChamferRadius:");
    -[SCNBox setWidthSegmentCount:](v4, "setWidthSegmentCount:", [a3 decodeIntegerForKey:@"boxwidthSegmentCount"]);
    -[SCNBox setHeightSegmentCount:](v4, "setHeightSegmentCount:", [a3 decodeIntegerForKey:@"boxheightSegmentCount"]);
    -[SCNBox setLengthSegmentCount:](v4, "setLengthSegmentCount:", [a3 decodeIntegerForKey:@"boxlengthSegmentCount"]);
    -[SCNBox setChamferSegmentCount:](v4, "setChamferSegmentCount:", [a3 decodeIntegerForKey:@"boxchamferSegmentCount"]);
    -[SCNBox setPrimitiveType:](v4, "setPrimitiveType:", [a3 decodeIntegerForKey:@"boxprimitiveType"]);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setChamferRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setChamferSegmentCount:.cold.1()
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