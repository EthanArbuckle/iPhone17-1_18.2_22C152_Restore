@interface AppInstallationEvent
+ (id)additionalMetricsWithRestoreInstalls:(id)a3;
+ (id)downloadLoadURLEventMetricsOverlayWithInstall:(id)a3;
+ (id)metricsOverlayWithPurchaseInfo:(id)a3;
- (_TtC9appstored20AppInstallationEvent)init;
- (_TtC9appstored20AppInstallationEvent)initWithEntity:(id)a3 package:(id)a4 finalPhase:(int64_t)a5;
@end

@implementation AppInstallationEvent

+ (id)downloadLoadURLEventMetricsOverlayWithInstall:(id)a3
{
  id v3 = a3;
  unint64_t v4 = sub_1000B5A44(v3);

  if (v4)
  {
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

+ (id)metricsOverlayWithPurchaseInfo:(id)a3
{
  id v3 = a3;
  sub_1000B5E90(v3);

  v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v4.super.isa;
}

+ (id)additionalMetricsWithRestoreInstalls:(id)a3
{
  sub_100018D68(0, &qword_1005A5B38);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000B62E0(v3);
  swift_bridgeObjectRelease();
  v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v4.super.isa;
}

- (_TtC9appstored20AppInstallationEvent)initWithEntity:(id)a3 package:(id)a4 finalPhase:(int64_t)a5
{
  return (_TtC9appstored20AppInstallationEvent *)sub_1000B6CEC(a3, a4);
}

- (_TtC9appstored20AppInstallationEvent)init
{
  result = (_TtC9appstored20AppInstallationEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9appstored20AppInstallationEvent_identifierResetIntervalBagKey));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end