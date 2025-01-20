@interface RoomCaptureCoachingOverlayView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC8RoomPlan30RoomCaptureCoachingOverlayView)initWithCoder:(id)a3;
- (_TtC8RoomPlan30RoomCaptureCoachingOverlayView)initWithFrame:(CGRect)a3;
- (void)didPanWithPanGesture:(id)a3;
- (void)didPinchWithPinchGesture:(id)a3;
- (void)didTouchDownWithLongPressGesture:(id)a3;
@end

@implementation RoomCaptureCoachingOverlayView

- (_TtC8RoomPlan30RoomCaptureCoachingOverlayView)initWithFrame:(CGRect)a3
{
}

- (_TtC8RoomPlan30RoomCaptureCoachingOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_234798CDC();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)didPanWithPanGesture:(id)a3
{
}

- (void)didPinchWithPinchGesture:(id)a3
{
}

- (void)didTouchDownWithLongPressGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2347987A0(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_dollHouseARView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_arGlyphView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_coachingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_coachingLabelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_pinchGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_immediateLongPressRecognizer));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2346A7C30((uint64_t)self + OBJC_IVAR____TtC8RoomPlan30RoomCaptureCoachingOverlayView_sceneObserver, &qword_2687ADFB8);
  swift_release();
  swift_release();

  swift_release();
}

@end