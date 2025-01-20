@interface CIRectangleFeature
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)bounds;
- (CIRectangleFeature)initWithBounds:(CGRect)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 bottomRight:(CGPoint)a7;
- (id)type;
@end

@implementation CIRectangleFeature

- (id)type
{
  return @"Rectangle";
}

- (CIRectangleFeature)initWithBounds:(CGRect)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 bottomRight:(CGPoint)a7
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v9 = a4.y;
  CGFloat v10 = a4.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v13 = a3.origin.y;
  CGFloat v14 = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)CIRectangleFeature;
  result = [(CIFeature *)&v16 init];
  if (result)
  {
    result->bounds.origin.CGFloat x = v14;
    result->bounds.origin.CGFloat y = v13;
    result->bounds.size.CGFloat width = width;
    result->bounds.size.CGFloat height = height;
    result->topLeft.CGFloat x = v10;
    result->topLeft.CGFloat y = v9;
    result->topRight.CGFloat x = x;
    result->topRight.CGFloat y = y;
    result->bottomLeft.CGFloat x = v17;
    result->bottomLeft.CGFloat y = v18;
    result->bottomRight.CGFloat x = v19;
    result->bottomRight.CGFloat y = v20;
  }
  return result;
}

- (CGRect)bounds
{
  objc_copyStruct(v6, &self->bounds, 32, 1, 0);
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

- (CGPoint)topLeft
{
  objc_copyStruct(v4, &self->topLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)topRight
{
  objc_copyStruct(v4, &self->topRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  objc_copyStruct(v4, &self->bottomLeft, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  objc_copyStruct(v4, &self->bottomRight, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

@end