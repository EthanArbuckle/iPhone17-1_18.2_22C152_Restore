@interface TouchController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC17ContinuityDisplay15TouchController)init;
@end

@implementation TouchController

- (_TtC17ContinuityDisplay15TouchController)init
{
}

- (void).cxx_destruct
{
  sub_10001A3E0((uint64_t)self + OBJC_IVAR____TtC17ContinuityDisplay15TouchController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay15TouchController_pencilInteraction));

  swift_release();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100040B7C((uint64_t)v8, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

@end