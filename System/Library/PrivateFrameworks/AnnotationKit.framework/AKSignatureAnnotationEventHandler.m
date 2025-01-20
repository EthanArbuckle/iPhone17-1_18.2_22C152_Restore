@interface AKSignatureAnnotationEventHandler
- (BOOL)alwaysLockAspectRatio;
- (CGSize)naturalSizeForAnnotation;
@end

@implementation AKSignatureAnnotationEventHandler

- (BOOL)alwaysLockAspectRatio
{
  return 1;
}

- (CGSize)naturalSizeForAnnotation
{
  v3 = [(AKAnnotationEventHandler *)self annotation];
  v15.receiver = self;
  v15.super_class = (Class)AKSignatureAnnotationEventHandler;
  [(AKAnnotationEventHandler *)&v15 naturalSizeForAnnotation];
  double v5 = v4;
  double v7 = v6;
  v8 = [v3 signature];
  uint64_t v9 = [v8 path];

  if (v9)
  {
    v10 = [v3 signature];
    [v10 pathBounds];
    double v5 = v11;
    double v7 = v12;
  }
  double v13 = v5;
  double v14 = v7;
  result.height = v14;
  result.width = v13;
  return result;
}

@end