@interface DaemonLifecycleManager
- (NSString)description;
- (_TtC10healthappd22DaemonLifecycleManager)init;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)debuggingInfoRequestedWithNote:(id)a3;
- (void)storeDidUpdateWithNote:(id)a3;
@end

@implementation DaemonLifecycleManager

- (void)dealloc
{
  v2 = self;
  sub_10001506C();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthExperienceStoreOracle));
  swift_release();
  swift_release();

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10healthappd22DaemonLifecycleManager_healthPluginHostListener));

  swift_release();
  swift_unknownObjectRelease();

  swift_release();
}

- (NSString)description
{
  v2 = self;
  sub_1000152E0();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)storeDidUpdateWithNote:(id)a3
{
}

- (_TtC10healthappd22DaemonLifecycleManager)init
{
  result = (_TtC10healthappd22DaemonLifecycleManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)applicationsDidUninstall:(id)a3
{
  if (a3) {
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_1000163A4(v4);

  swift_bridgeObjectRelease();
}

- (void)debuggingInfoRequestedWithNote:(id)a3
{
}

@end