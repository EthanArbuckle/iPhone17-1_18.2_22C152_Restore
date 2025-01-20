@interface AKNoteAnnotationEventHandler
+ (BOOL)allowsDragging;
- (BOOL)continueDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)enterDraggableAreaEventTrackingLoopWithEvent:(id)a3 orRecognizer:(id)a4;
- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4;
@end

@implementation AKNoteAnnotationEventHandler

- (BOOL)handleDownEvent:(id)a3 orRecognizer:(id)a4
{
  v5 = [(AKAnnotationEventHandler *)self pageController];
  v6 = [(AKAnnotationEventHandler *)self annotation];
  v7 = [v6 childAnnotation];

  if (v7)
  {
    [v5 openPopupAnnotation:v7];
  }
  else
  {
    v8 = [(AKAnnotationEventHandler *)self annotation];
    [v5 addPopupToAnnotation:v8 openPopup:1];
  }
  return 1;
}

+ (BOOL)allowsDragging
{
  return 1;
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