@interface ASUIPickingSession
- (_TtC16AccessorySetupUI18ASUIPickingSession)init;
- (void)dealloc;
@end

@implementation ASUIPickingSession

- (_TtC16AccessorySetupUI18ASUIPickingSession)init
{
  return (_TtC16AccessorySetupUI18ASUIPickingSession *)sub_10000D050();
}

- (void)dealloc
{
  v2 = self;
  sub_10000E548();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_migrationDiscovery));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000CC2C((uint64_t)self + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI18ASUIPickingSession_currentPairingRequest));

  swift_release();
}

@end