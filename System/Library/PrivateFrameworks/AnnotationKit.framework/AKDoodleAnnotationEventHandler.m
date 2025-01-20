@interface AKDoodleAnnotationEventHandler
- (BOOL)alwaysLockAspectRatio;
- (CGSize)naturalSizeForAnnotation;
@end

@implementation AKDoodleAnnotationEventHandler

- (BOOL)alwaysLockAspectRatio
{
  return 1;
}

- (CGSize)naturalSizeForAnnotation
{
  v2 = [(AKAnnotationEventHandler *)self annotation];
  v3 = [v2 path];

  if (v3)
  {
    v4 = [v2 path];
    v5 = (const CGPath *)[v4 newCGPathForPlatformBezierPath];

    CGFloat height = 1.0;
    if (v5)
    {
      CGFloat width = 1.0;
      if (!CGPathIsEmpty(v5))
      {
        CGRect BoundingBox = CGPathGetBoundingBox(v5);
        CGFloat width = BoundingBox.size.width;
        CGFloat height = BoundingBox.size.height;
      }
    }
    else
    {
      CGFloat width = 1.0;
    }
    CGPathRelease(v5);
  }
  else
  {
    CGFloat height = 1.0;
    CGFloat width = 1.0;
  }

  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

@end