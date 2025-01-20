@interface ARHitTestResult(ARHitTestResult_Position)
- (double)localPosition;
- (double)worldPosition;
@end

@implementation ARHitTestResult(ARHitTestResult_Position)

- (double)worldPosition
{
  [a1 worldTransform];
  return v1;
}

- (double)localPosition
{
  [a1 localTransform];
  return v1;
}

@end