@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (UIWindow)window;
- (_TtC13FTMInternal_411AppDelegate)init;
- (uint64_t)applicationDidEnterBackground:;
- (void)applicationDidBecomeActive:;
- (void)applicationWillTerminate:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation AppDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC13FTMInternal_411AppDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13FTMInternal_411AppDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13FTMInternal_411AppDelegate_window) = (Class)a3;
  id v3 = a3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    sub_1001A9BA4(&qword_1002D7C50, type metadata accessor for LaunchOptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  char v8 = sub_1001A94C0();

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v4 = qword_1002D7A98;
  id v5 = a3;
  v9 = self;
  if (v4 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  id v6 = [self sharedInstance];
  if (v6)
  {
    v7 = v6;
    char v8 = (_TtC13FTMInternal_411AppDelegate *)String._bridgeToObjectiveC()();
    [v7 removeAWDConfigForAppid:v8];

    id v5 = v7;
    v9 = v8;
  }
}

- (_TtC13FTMInternal_411AppDelegate)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13FTMInternal_411AppDelegate_window) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13FTMInternal_411AppDelegate_abmManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDelegate();
  return [(AppDelegate *)&v3 init];
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13FTMInternal_411AppDelegate_abmManager);
}

- (uint64_t)applicationDidEnterBackground:
{
  if (qword_1002D7A98 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  id v0 = [self sharedInstance];
  if (v0)
  {
    v1 = v0;
    NSString v2 = String._bridgeToObjectiveC()();
    [v1 removeAWDConfigForAppid:v2];

    if (qword_1002D7B20 != -1) {
      swift_once();
    }
    objc_super v3 = (char *)(id)qword_1002E31D0;
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();
    unint64_t v4 = sub_1001E006C((uint64_t)_swiftEmptyArrayStorage);
    id v5 = (unint64_t *)&v3[OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricDetailsClassObject];
    swift_beginAccess();
    *id v5 = v4;

    swift_bridgeObjectRelease();
    id v6 = (void *)(qword_1002E31D0 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsArray);
    swift_beginAccess();
    *id v6 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
    *(void *)(qword_1002E31D0 + OBJC_IVAR____TtC13FTMInternal_425FTMCellMonitorSharedClass_metricModelsGraphArray) = _swiftEmptyArrayStorage;

    return swift_bridgeObjectRelease();
  }
  else
  {
    static os_log_type_t.default.getter();
    return os_log(_:dso:log:type:_:)();
  }
}

- (void)applicationDidBecomeActive:
{
  if (qword_1002D7A98 != -1) {
    swift_once();
  }
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  id v0 = [self sharedInstance];
  if (v0)
  {
    id v8 = v0;
    id v1 = [self mainBundle];
    if (qword_1002D7B18 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    NSString v3 = String._bridgeToObjectiveC()();
    id v4 = [v1 pathForResource:v2 ofType:v3];

    if (v4)
    {
      NSString v5 = String._bridgeToObjectiveC()();
      unsigned int v6 = [v8 addAWDConfigForAppId:v5 andProtofFilePath:v4];

      if (!v6)
      {
LABEL_18:

        return;
      }
      [v8 listen];
      NSString v7 = String._bridgeToObjectiveC()();
      [v8 querySpecificMetric:v7 triggerRef:9999 triggerType:0 triggerID:*(unsigned int *)(qword_1002E31C8 + 184) profileID:0 metricID:0];

      if (qword_1002D7A88 != -1) {
        swift_once();
      }
      static os_log_type_t.default.getter();
    }
    else
    {
      if (qword_1002D7A88 != -1) {
        swift_once();
      }
      static os_log_type_t.error.getter();
    }
    os_log(_:dso:log:type:_:)();
    goto LABEL_18;
  }
  static os_log_type_t.default.getter();

  os_log(_:dso:log:type:_:)();
}

@end