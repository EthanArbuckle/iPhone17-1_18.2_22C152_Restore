@interface EspressoFaceDetectedObject
- (CGPoint)center;
- (CGRect)bounds;
- (EspressoFaceDetectedObject)initWithOptionsXloc:(float)a3 yloc:(float)a4 size:(float)a5 confidence:(float)a6;
- (float)confidence;
- (int64_t)objectType;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setConfidence:(float)a3;
- (void)setObjectType:(int64_t)a3;
@end

@implementation EspressoFaceDetectedObject

- (void)setConfidence:(float)a3
{
  self->confidence = a3;
}

- (float)confidence
{
  return self->confidence;
}

- (void)setCenter:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->center, &v3, 16, 1, 0);
}

- (CGPoint)center
{
  objc_copyStruct(v4, &self->center, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->bounds, &v3, 32, 1, 0);
}

- (CGRect)bounds
{
  objc_copyStruct(v6, &self->bounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setObjectType:(int64_t)a3
{
  self->objectType = a3;
}

- (int64_t)objectType
{
  return self->objectType;
}

- (EspressoFaceDetectedObject)initWithOptionsXloc:(float)a3 yloc:(float)a4 size:(float)a5 confidence:(float)a6
{
  v13.receiver = self;
  v13.super_class = (Class)EspressoFaceDetectedObject;
  CGRect result = [(EspressoFaceDetectedObject *)&v13 init];
  if (result)
  {
    result->bounds.origin.x = (float)(a3 - a5);
    result->bounds.origin.y = (float)(a4 - a5);
    CGFloat v11 = a5 + a5;
    result->bounds.size.width = v11;
    result->bounds.size.height = v11;
    result->center.x = a3;
    result->center.y = a4;
    float v12 = 1.0;
    if (a6 <= 1.0) {
      float v12 = a6;
    }
    result->confidence = v12;
  }
  return result;
}

@end