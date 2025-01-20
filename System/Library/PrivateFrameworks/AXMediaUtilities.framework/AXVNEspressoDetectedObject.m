@interface AXVNEspressoDetectedObject
- (AXVNEspressoDetectedObject)initWithObjectType:(int64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5;
- (CGPoint)center;
- (CGRect)bounds;
- (float)confidence;
- (int64_t)objectType;
- (void)setBounds:(CGRect)a3;
- (void)setConfidence:(float)a3;
- (void)setObjectType:(int64_t)a3;
@end

@implementation AXVNEspressoDetectedObject

- (AXVNEspressoDetectedObject)initWithObjectType:(int64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)AXVNEspressoDetectedObject;
  v11 = [(AXVNEspressoDetectedObject *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_objectType = a3;
    v11->_bounds.origin.CGFloat x = x;
    v11->_bounds.origin.CGFloat y = y;
    v11->_bounds.size.CGFloat width = width;
    v11->_bounds.size.CGFloat height = height;
    v11->_confidence = a5;
    v13 = v11;
  }

  return v12;
}

- (CGPoint)center
{
  [(AXVNEspressoDetectedObject *)self bounds];
  double v4 = v3 + v2 * 0.5;
  double v7 = v6 + v5 * 0.5;
  result.CGFloat y = v7;
  result.CGFloat x = v4;
  return result;
}

- (int64_t)objectType
{
  return self->_objectType;
}

- (void)setObjectType:(int64_t)a3
{
  self->_objectType = a3;
}

- (CGRect)bounds
{
  objc_copyStruct(v6, &self->_bounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_bounds, &v3, 32, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end