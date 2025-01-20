@interface HoverTextEventHandler
- (BOOL)handlePointerEvent:(id)a3;
- (_TtC11HoverTextUI21HoverTextEventHandler)init;
@end

@implementation HoverTextEventHandler

- (BOOL)handlePointerEvent:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2269B34E8(a3);

  return 0;
}

- (_TtC11HoverTextUI21HoverTextEventHandler)init
{
  return (_TtC11HoverTextUI21HoverTextEventHandler *)sub_2269B4D7C();
}

- (void).cxx_destruct
{
  sub_226999548(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange));
  sub_226999548(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange));
  sub_226999548(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved));
  sub_226999548(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred));
  sub_226999548(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed));
  sub_226999548(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased));
  sub_226999548(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement));
  swift_bridgeObjectRelease();

  sub_2269B7DE4(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___eventProcessor));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___activationKeyHoldTimer);
}

@end