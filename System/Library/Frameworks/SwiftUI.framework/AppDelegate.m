@interface AppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (_TtC7SwiftUI11AppDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)_performMainMenuShortcutKeyCommand:(id)a3;
- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5;
- (void)buildMenuWithBuilder:(id)a3;
- (void)validateCommand:(id)a3;
@end

@implementation AppDelegate

- (BOOL)respondsToSelector:(SEL)a3
{
  swift_getObjectType();
  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI11AppDelegate_fallbackDelegate);
  v6 = self;
  if (v5) {
    LOBYTE(v5) = objc_msgSend(v5, sel_respondsToSelector_, a3);
  }
  unsigned __int8 v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_instancesRespondToSelector_, a3);

  return v7 | v5;
}

- (_TtC7SwiftUI11AppDelegate)init
{
  return (_TtC7SwiftUI11AppDelegate *)AppDelegate.init()();
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI11AppDelegate_fallbackDelegate);
  if (v3)
  {
    v5[3] = swift_getObjectType();
    v5[0] = v3;
    swift_unknownObjectRetain();
    v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }

  return v3;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  if (a4)
  {
    type metadata accessor for UIApplicationLaunchOptionsKey(0);
    lazy protocol witness table accessor for type SceneBridge and conformance SceneBridge(&lazy protocol witness table cache variable for type UIApplicationLaunchOptionsKey and conformance UIApplicationLaunchOptionsKey, type metadata accessor for UIApplicationLaunchOptionsKey);
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v6 = 0;
  }
  unsigned __int8 v7 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI11AppDelegate_fallbackDelegate);
  if (v7
    && (objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI11AppDelegate_fallbackDelegate), sel_respondsToSelector_, sel_application_didFinishLaunchingWithOptions_) & 1) != 0)
  {
    if (v6)
    {
      type metadata accessor for UIApplicationLaunchOptionsKey(0);
      lazy protocol witness table accessor for type SceneBridge and conformance SceneBridge(&lazy protocol witness table cache variable for type UIApplicationLaunchOptionsKey and conformance UIApplicationLaunchOptionsKey, type metadata accessor for UIApplicationLaunchOptionsKey);
      id v8 = a3;
      v9 = self;
      swift_unknownObjectRetain();
      v10.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    }
    else
    {
      id v13 = a3;
      v14 = self;
      swift_unknownObjectRetain();
      v10.super.isa = 0;
    }
    unsigned __int8 v12 = objc_msgSend(v7, sel_application_didFinishLaunchingWithOptions_, a3, v10.super.isa);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    id v11 = a3;
    swift_bridgeObjectRelease();
    unsigned __int8 v12 = 1;
  }

  return v12;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = specialized AppDelegate.application(_:configurationForConnecting:options:)(v9);

  return v12;
}

- (void)buildMenuWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  AppDelegate.buildMenu(with:)(a3);
  swift_unknownObjectRelease();
}

- (void)validateCommand:(id)a3
{
  v4 = (UICommand *)a3;
  v5 = self;
  AppDelegate.validate(_:)(v4);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    uint64_t v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    unsigned __int8 v7 = self;
  }
  unsigned __int8 v8 = AppDelegate.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  outlined destroy of RootEnvironmentModifier?((uint64_t)v10, (unint64_t *)&lazy cache variable for type metadata for Any?, MEMORY[0x1E4FBC840] + 8);
  return v8 & 1;
}

- (void)_performMainMenuShortcutKeyCommand:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI11AppDelegate_mainMenuController);
  if (v3)
  {
    v5 = (UIKeyCommand *)a3;
    uint64_t v6 = self;
    id v7 = v3;
    UIKitMainMenuController._performMainMenuShortcutKeyCommand(_:)(v5);
  }
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = v8;
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = (UIApplication *)a3;
  id v12 = self;
  v13._countAndFlagsBits = v7;
  v13._object = v9;
  LOBYTE(self) = AppDelegate.application(_:runTest:options:)(v11, v13, (Swift::OpaquePointer)v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return self & 1;
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  id v12 = a3;
  Swift::String v13 = self;
  AppDelegate.application(_:handleEventsForBackgroundURLSession:completionHandler:)((uint64_t)v12, v8, v10, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v11);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI11AppDelegate_mainMenuController);
}

@end