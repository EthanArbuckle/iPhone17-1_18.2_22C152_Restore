@interface GestureRecognizerHandler
- (void)handleActionFromGestureRecognizer:(id)a3;
@end

@implementation GestureRecognizerHandler

- (void)handleActionFromGestureRecognizer:(id)a3
{
  v3 = *(void (**)(id))self->handler;
  id v4 = a3;
  swift_retain();
  v3(v4);

  swift_release();
}

@end