@interface TestingAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (_TtC7SwiftUI18TestingAppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation TestingAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = objc_msgSend(v9, sel_role);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1B88]), sel_initWithName_sessionRole_, 0, v12);

  type metadata accessor for TestingSceneDelegate();
  objc_msgSend(v13, sel_setDelegateClass_, swift_getObjCClassFromMetadata());

  return v13;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  LOBYTE(v7) = specialized TestingAppDelegate.application(_:runTest:options:)(v10, v7, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (_TtC7SwiftUI18TestingAppDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TestingAppDelegate();
  return [(TestingAppDelegate *)&v3 init];
}

@end