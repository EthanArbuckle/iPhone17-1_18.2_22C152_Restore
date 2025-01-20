@interface ApplicationDelegate
+ (BOOL)isFeatureEnabled;
+ (NSString)debugFeatureName;
+ (NSString)featureEnabledStatusDidChangeNotification;
+ (OS_os_log)loggingFacility;
- (_TtC15assistivetouchd19ApplicationDelegate)init;
- (void)didFinishLaunching;
- (void)stop;
- (void)willTerminate;
@end

@implementation ApplicationDelegate

- (_TtC15assistivetouchd19ApplicationDelegate)init
{
  uint64_t v3 = OBJC_IVAR____TtC15assistivetouchd19ApplicationDelegate_runtimeManager;
  id v4 = objc_allocWithZone((Class)HNDRuntimeManager);
  v5 = self;
  *(void *)&self->AXUIDaemonApplicationDelegate_opaque[v3] = [v4 init];
  *(void *)&v5->AXUIDaemonApplicationDelegate_opaque[OBJC_IVAR____TtC15assistivetouchd19ApplicationDelegate_sceneAttemptCount] = 0;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for ApplicationDelegate();
  v6 = [(ApplicationDelegate *)&v8 init];
  [*(id *)&v6->AXUIDaemonApplicationDelegate_opaque[OBJC_IVAR____TtC15assistivetouchd19ApplicationDelegate_runtimeManager] setDelegate:v6];
  return v6;
}

+ (OS_os_log)loggingFacility
{
  result = (OS_os_log *)(id)ASTLogCommon();
  if (result)
  {
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (NSString)debugFeatureName
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (BOOL)isFeatureEnabled
{
  return 1;
}

+ (NSString)featureEnabledStatusDidChangeNotification
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (void)didFinishLaunching
{
  NSString v2 = *(void **)&self->AXUIDaemonApplicationDelegate_opaque[OBJC_IVAR____TtC15assistivetouchd19ApplicationDelegate_runtimeManager];
  uint64_t v3 = self;
  [v2 setupRuntime];
  [v2 initializeSystemSettings];
  [v2 startRuntime];
  sub_100110730();
  [(id)swift_getObjCClassFromMetadata() usesScenes];
}

- (void)willTerminate
{
}

- (void).cxx_destruct
{
}

- (void)stop
{
  NSString v2 = self;
  sub_1001109EC();
}

@end