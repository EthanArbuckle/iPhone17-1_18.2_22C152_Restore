@interface AKTriangleAnnotationEventHandler
- (double)naturalAspectRatioForAnnotation;
@end

@implementation AKTriangleAnnotationEventHandler

- (double)naturalAspectRatioForAnnotation
{
  [(AKAnnotationEventHandler *)self initialDraggedPoint];
  double v4 = v3;
  double v6 = v5;
  [(AKAnnotationEventHandler *)self initialOtherPoint];
  return fabs((v4 - v7) / (v6 - v8));
}

@end