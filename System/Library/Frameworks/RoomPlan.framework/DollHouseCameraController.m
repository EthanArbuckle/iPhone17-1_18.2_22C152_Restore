@interface DollHouseCameraController
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC8RoomPlan25DollHouseCameraController)init;
- (void)didPanWithPanGesture:(id)a3;
- (void)didPinchWithPinchGesture:(id)a3;
- (void)didTouchDownWithLongPressGesture:(id)a3;
@end

@implementation DollHouseCameraController

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)didPanWithPanGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2347BAC00(v4);
}

- (void)didPinchWithPinchGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2347BB8B8(v4);
}

- (void)didTouchDownWithLongPressGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2347BB9E4(v4);
}

- (_TtC8RoomPlan25DollHouseCameraController)init
{
  result = (_TtC8RoomPlan25DollHouseCameraController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2347BC5E4((uint64_t)self + OBJC_IVAR____TtC8RoomPlan25DollHouseCameraController_delegate);
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8RoomPlan25DollHouseCameraController_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8RoomPlan25DollHouseCameraController_pinchGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8RoomPlan25DollHouseCameraController_immediateLongPressRecognizer));
  v3 = (char *)self + OBJC_IVAR____TtC8RoomPlan25DollHouseCameraController_startTapTime;
  uint64_t v4 = sub_2347ED540();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end