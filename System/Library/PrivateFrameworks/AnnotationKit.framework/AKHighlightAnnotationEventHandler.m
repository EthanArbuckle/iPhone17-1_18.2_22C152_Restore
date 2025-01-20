@interface AKHighlightAnnotationEventHandler
+ (BOOL)allowsDragging;
- (BOOL)continueDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4;
@end

@implementation AKHighlightAnnotationEventHandler

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  v5 = [(AKAnnotationEventHandler *)self pageController];
  v6 = [v5 pageModelController];
  v7 = [v6 mutableSetValueForKey:@"selectedAnnotations"];

  v8 = (void *)MEMORY[0x263EFFA08];
  v9 = [(AKAnnotationEventHandler *)self annotation];
  v10 = [v8 setWithObject:v9];
  [v7 setSet:v10];

  v11 = [(AKAnnotationEventHandler *)self annotation];
  [v5 openPopoverForHighlightAnnotation:v11];

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