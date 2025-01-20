@interface DetectedPersonData
+ (DetectedPersonData)InvalidPersonData;
- (BOOL)isEnabled;
- (BOOL)isValid;
- (CGRect)screenRect;
- (DetectedPersonData)initWithMinPosition:(DetectedPersonData *)self maxPosition:(SEL)a2 screenRect:(CGRect)a3;
- (DetectedPersonData)initWithNormalizedMinX:(double)a3 maxX:(double)a4 minY:(double)a5 maxY:(double)a6 depth:(float)a7 camera:(id)a8 orientation:(int64_t)a9;
- (NSString)faceName;
- (NSUUID)uuid;
- (NSValue)face;
- (__n128)maxPosition;
- (__n128)minPosition;
- (__n128)position;
- (unint64_t)computeArea;
- (void)setFace:(id)a3;
- (void)setFaceName:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setUuid:(id)a3;
@end

@implementation DetectedPersonData

- (DetectedPersonData)initWithMinPosition:(DetectedPersonData *)self maxPosition:(SEL)a2 screenRect:(CGRect)a3
{
  CGFloat v5 = v4;
  CGFloat v6 = v3;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  int32x4_t v14 = *(int32x4_t *)&a3.origin.y;
  CGPoint origin = a3.origin;
  v16.receiver = self;
  v16.super_class = (Class)DetectedPersonData;
  v9 = [(DetectedPersonData *)&v16 init];
  v10 = v9;
  if (v9)
  {
    *(CGPoint *)v9->_minPosition = origin;
    *(int32x4_t *)v9->_maxPosition = v14;
    uint32x4_t v11 = (uint32x4_t)vaddq_s32(v14, (int32x4_t)origin);
    *(int32x4_t *)v9->_position = vshrq_n_s32((int32x4_t)vsraq_n_u32(v11, v11, 0x1FuLL), 1uLL);
    v9->_screenRect.origin.x = width;
    v9->_screenRect.origin.y = height;
    v9->_screenRect.size.CGFloat width = v6;
    v9->_screenRect.size.CGFloat height = v5;
    v9->_isEnabled = 1;
    face = v9->_face;
    v9->_face = 0;
  }
  return v10;
}

- (DetectedPersonData)initWithNormalizedMinX:(double)a3 maxX:(double)a4 minY:(double)a5 maxY:(double)a6 depth:(float)a7 camera:(id)a8 orientation:(int64_t)a9
{
  id v16 = a8;
  v27.receiver = self;
  v27.super_class = (Class)DetectedPersonData;
  v17 = [(DetectedPersonData *)&v27 init];
  if (v17)
  {
    objc_msgSend(v16, "unprojectPoint:ontoPlaneWithTransform:orientation:viewportSize:", a9, a3, a5);
    long long v26 = v18;
    objc_msgSend(v16, "unprojectPoint:ontoPlaneWithTransform:orientation:viewportSize:", a9, a4, a6, *(double *)&_PromotedConst, 0.0, -0.0078125, 0.0, 1.0, 1.0);
    float32x2_t v19 = (float32x2_t)vdup_n_s32(0x447A0000u);
    v20.i32[3] = HIDWORD(v26);
    *(int32x2_t *)v20.i8 = vcvt_s32_f32(vmul_f32(*(float32x2_t *)&v26, v19));
    v20.i32[2] = (int)(float)(a7 * 1000.0);
    *(int32x2_t *)v22.i8 = vcvt_s32_f32(vmul_f32(v21, v19));
    v22.i32[2] = v20.i32[2];
    *(int32x4_t *)v17->_minPosition = v20;
    *(int32x4_t *)v17->_maxPosition = v22;
    uint32x4_t v23 = (uint32x4_t)vaddq_s32(v22, v20);
    *(int32x4_t *)v17->_position = vshrq_n_s32((int32x4_t)vsraq_n_u32(v23, v23, 0x1FuLL), 1uLL);
    v17->_screenRect.origin.x = a3;
    v17->_screenRect.origin.y = a5;
    v17->_screenRect.size.CGFloat width = a4 - a3;
    v17->_screenRect.size.CGFloat height = a6 - a5;
    v17->_isEnabled = 1;
    v24 = v17;
  }

  return v17;
}

+ (DetectedPersonData)InvalidPersonData
{
  if (+[DetectedPersonData InvalidPersonData]::onceToken != -1) {
    dispatch_once(&+[DetectedPersonData InvalidPersonData]::onceToken, &__block_literal_global_0);
  }
  v2 = (void *)+[DetectedPersonData InvalidPersonData]::invalidPersonData;
  return (DetectedPersonData *)v2;
}

uint64_t __39__DetectedPersonData_InvalidPersonData__block_invoke()
{
  v0 = [DetectedPersonData alloc];
  uint64_t v1 = -[DetectedPersonData initWithMinPosition:maxPosition:screenRect:](v0, "initWithMinPosition:maxPosition:screenRect:", 0.0, 0.0, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  v2 = (void *)+[DetectedPersonData InvalidPersonData]::invalidPersonData;
  +[DetectedPersonData InvalidPersonData]::invalidPersonData = v1;

  double v3 = (void *)+[DetectedPersonData InvalidPersonData]::invalidPersonData;
  return [v3 setIsEnabled:0];
}

- (BOOL)isValid
{
  double v3 = +[DetectedPersonData InvalidPersonData];
  LOBYTE(self) = v3 != self;

  return (char)self;
}

- (unint64_t)computeArea
{
  int32x2_t v2 = vsub_s32(*(int32x2_t *)self->_maxPosition, *(int32x2_t *)self->_minPosition);
  return vmul_lane_s32(v2, v2, 1).i32[0];
}

- (__n128)position
{
  return a1[3];
}

- (__n128)minPosition
{
  return a1[4];
}

- (__n128)maxPosition
{
  return a1[5];
}

- (CGRect)screenRect
{
  double x = self->_screenRect.origin.x;
  double y = self->_screenRect.origin.y;
  double width = self->_screenRect.size.width;
  double height = self->_screenRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (NSValue)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
}

- (NSString)faceName
{
  return self->_faceName;
}

- (void)setFaceName:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_faceName, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end