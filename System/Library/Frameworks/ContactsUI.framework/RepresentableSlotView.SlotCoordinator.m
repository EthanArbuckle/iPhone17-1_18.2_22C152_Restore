@interface RepresentableSlotView.SlotCoordinator
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtCV10ContactsUI21RepresentableSlotView15SlotCoordinator)init;
@end

@implementation RepresentableSlotView.SlotCoordinator

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  return 1;
}

- (_TtCV10ContactsUI21RepresentableSlotView15SlotCoordinator)init
{
  result = (_TtCV10ContactsUI21RepresentableSlotView15SlotCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18B663F18((uint64_t)self + OBJC_IVAR____TtCV10ContactsUI21RepresentableSlotView15SlotCoordinator_parent);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCV10ContactsUI21RepresentableSlotView15SlotCoordinator_cachedTraits));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCV10ContactsUI21RepresentableSlotView15SlotCoordinator_cachedContentSizeCategory));

  swift_release();
}

@end