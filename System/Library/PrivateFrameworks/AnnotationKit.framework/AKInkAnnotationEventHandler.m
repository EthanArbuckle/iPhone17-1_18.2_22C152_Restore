@interface AKInkAnnotationEventHandler
+ (BOOL)allowsDraggingOfAnnotation:(id)a3;
- (BOOL)alwaysLockAspectRatio;
- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4;
- (CGSize)naturalSizeForAnnotation;
@end

@implementation AKInkAnnotationEventHandler

+ (BOOL)allowsDraggingOfAnnotation:(id)a3
{
  return 0;
}

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  return 0;
}

- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  return 0;
}

- (BOOL)alwaysLockAspectRatio
{
  return 1;
}

- (CGSize)naturalSizeForAnnotation
{
  v2 = [(AKAnnotationEventHandler *)self annotation];
  v3 = [v2 drawing];

  if (v3)
  {
    v4 = [v2 drawing];
    v5 = v4;
    if (v4)
    {
      [v4 bounds];
      double v7 = v6;
      double v9 = v8;
      if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
      {
        double v9 = 1.0;
        double v7 = 1.0;
      }
    }
    else
    {
      double v9 = 1.0;
      double v7 = 1.0;
    }
  }
  else
  {
    double v9 = 1.0;
    double v7 = 1.0;
  }

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

@end