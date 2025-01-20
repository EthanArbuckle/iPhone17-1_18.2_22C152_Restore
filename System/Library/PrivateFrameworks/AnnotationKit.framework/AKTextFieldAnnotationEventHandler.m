@interface AKTextFieldAnnotationEventHandler
+ (BOOL)allowsDragging;
- (BOOL)continueDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4;
@end

@implementation AKTextFieldAnnotationEventHandler

+ (BOOL)allowsDragging
{
  return 0;
}

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  id v5 = a4;
  v6 = [(AKAnnotationEventHandler *)self annotation];
  char v7 = [v6 editingDisabled];

  if ((v7 & 1) == 0)
  {
    v8 = [(AKAnnotationEventHandler *)self pageController];
    v9 = [v8 controller];
    [v9 showSelectionMenu:v5];
  }
  return v7 ^ 1;
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