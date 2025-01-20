@interface AKPopupAnnotationEventHandler
+ (BOOL)allowsDragging;
- (BOOL)continueDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4;
@end

@implementation AKPopupAnnotationEventHandler

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  v5 = [(AKAnnotationEventHandler *)self pageController];
  v6 = [(AKAnnotationEventHandler *)self annotation];
  [v5 openPopupAnnotation:v6];

  return 1;
}

+ (BOOL)allowsDragging
{
  return 0;
}

- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  return 0;
}

- (BOOL)continueDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4
{
  return 0;
}

@end