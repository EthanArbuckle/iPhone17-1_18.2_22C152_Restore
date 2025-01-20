@interface UIGestureRecognizer(HUGeometryAdditions)
- (double)hu_locationInGlobalCoordinateSpace;
@end

@implementation UIGestureRecognizer(HUGeometryAdditions)

- (double)hu_locationInGlobalCoordinateSpace
{
  v2 = [a1 view];
  [a1 locationInView:v2];
  double v4 = v3;
  double v6 = v5;
  v7 = [a1 view];
  double v8 = HUConvertPointToGlobalCoordinateSpace(v7, v4, v6);

  return v8;
}

@end