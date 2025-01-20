@interface PushToTalkTalkButtonController
- (void)pressGestureChangedWithGestureRecognizer:(id)a3;
@end

@implementation PushToTalkTalkButtonController

- (void)pressGestureChangedWithGestureRecognizer:(id)a3
{
  id v3 = a3;
  swift_retain();
  PushToTalkTalkButtonController.pressGestureChanged(gestureRecognizer:)(v3);

  swift_release();
}

@end