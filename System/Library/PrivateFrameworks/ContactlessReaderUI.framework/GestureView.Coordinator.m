@interface GestureView.Coordinator
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtCV19ContactlessReaderUI11GestureView11Coordinator)init;
- (void)handleDoubleTap2FingersWithSender:(id)a3;
- (void)handleDoubleTap3FingersWithSender:(id)a3;
- (void)handleDoubleTapWithSender:(id)a3;
- (void)handleLongPressWithSender:(id)a3;
- (void)handlePanWithSender:(id)a3;
- (void)handleSwipe2FingersWithSender:(id)a3;
- (void)handleSwipeWithSender:(id)a3;
- (void)handleTap3FingersWithSender:(id)a3;
- (void)handleTapWithSender:(id)a3;
- (void)handleVeryLongPressWithSender:(id)a3;
@end

@implementation GestureView.Coordinator

- (void)handleTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23EDDA608(0, v4);
}

- (void)handleDoubleTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23EDDA608(1, v4);
}

- (void)handleTap3FingersWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23EDDA608(9, v4);
}

- (void)handleDoubleTap2FingersWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23EDDA608(2, v4);
}

- (void)handleDoubleTap3FingersWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23EDDA608(3, v4);
}

- (void)handleSwipeWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23EDDA9A8(v4);
}

- (void)handleSwipe2FingersWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23EDDAB0C(v4);
}

- (void)handleLongPressWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23EDDAC70(v4);
}

- (void)handlePanWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23EDDAD8C(v4);
}

- (void)handleVeryLongPressWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23EDDAF10(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t ObjectType = swift_getObjectType();
  return ObjectType == type metadata accessor for ContinuousGestureRecognizer();
}

- (_TtCV19ContactlessReaderUI11GestureView11Coordinator)init
{
  result = (_TtCV19ContactlessReaderUI11GestureView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->parent[OBJC_IVAR____TtCV19ContactlessReaderUI11GestureView11Coordinator_parent + 72];
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end