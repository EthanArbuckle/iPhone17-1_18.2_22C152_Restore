@interface SCATAirPodsSource
- (BOOL)handledEvent:(id)a3;
- (BOOL)isAirPodsInputSource;
- (BOOL)isStreaming;
- (NSString)switchSource;
- (_TtC15assistivetouchd17SCATAirPodsSource)init;
- (int64_t)switchKeyForSwitch:(id)a3;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)startRunning;
- (void)stopRunning;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATAirPodsSource

- (BOOL)isStreaming
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC15assistivetouchd17SCATAirPodsSource__isStreaming);
}

- (BOOL)isAirPodsInputSource
{
  return 1;
}

- (NSString)switchSource
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC15assistivetouchd17SCATAirPodsSource)init
{
  return (_TtC15assistivetouchd17SCATAirPodsSource *)sub_10010B530();
}

- (void)startRunning
{
  NSString v2 = self;
  SCATAirPodsSource.startRunning()();
}

- (void)stopRunning
{
  NSString v2 = self;
  SCATAirPodsSource.stopRunning()();
}

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
  uint64_t v5 = (uint64_t)a3;
  if (a3)
  {
    sub_1000F00F4(0, (unint64_t *)&qword_1001F02D0);
    sub_1000FA33C();
    uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a4;
  v8 = self;
  _s15assistivetouchd17SCATAirPodsSourceC6update12withSwitches6recipeyShySo8AXSwitchCGSg_So0I6RecipeCSgtF_0(v5);

  swift_bridgeObjectRelease();
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  if (a3) {
    return (int64_t)[a3 accessibilityEventUsage];
  }
  __break(1u);
  return self;
}

- (BOOL)handledEvent:(id)a3
{
  return 0;
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  id v6 = a3;
  id v7 = self;
  _s15assistivetouchd17SCATAirPodsSourceC17_didReceiveAction14withIdentifier5start15ignoreInputHoldySo14SCATActionItemC_S2btF_0(v6);
}

- (void).cxx_destruct
{
  sub_1000F0190((uint64_t)self + OBJC_IVAR____TtC15assistivetouchd17SCATAirPodsSource_hgManager);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15assistivetouchd17SCATAirPodsSource_dispatchTimer);
}

@end