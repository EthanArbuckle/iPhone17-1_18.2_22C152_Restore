@interface ASUIRouter
- (_TtC16AccessorySetupUI10ASUIRouter)init;
- (void)proxCardFlowDidDismiss;
@end

@implementation ASUIRouter

- (_TtC16AccessorySetupUI10ASUIRouter)init
{
  return (_TtC16AccessorySetupUI10ASUIRouter *)sub_100022E48();
}

- (void).cxx_destruct
{
  sub_10000CC2C((uint64_t)self + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView);
  sub_10000CC2C((uint64_t)self + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_delegate);

  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_rootController);
}

- (void)proxCardFlowDidDismiss
{
  v2 = self;
  sub_100022FD4();
}

@end