@interface ARRaycastResult(ARRaycastResult_Position)
- (double)worldPosition;
@end

@implementation ARRaycastResult(ARRaycastResult_Position)

- (double)worldPosition
{
  [a1 worldTransform];
  return v1;
}

@end