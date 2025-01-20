@interface _CNUINavigationListViewPermissiveGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
@end

@implementation _CNUINavigationListViewPermissiveGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

@end