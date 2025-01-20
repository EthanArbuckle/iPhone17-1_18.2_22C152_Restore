@interface AppleAccountSignInSheet.Coordinator
- (_TtCV11SettingsApp23AppleAccountSignInSheet11Coordinator)init;
- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4;
- (void)signInControllerDidCancel:(id)a3;
@end

@implementation AppleAccountSignInSheet.Coordinator

- (_TtCV11SettingsApp23AppleAccountSignInSheet11Coordinator)init
{
  result = (_TtCV11SettingsApp23AppleAccountSignInSheet11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtCV11SettingsApp23AppleAccountSignInSheet11Coordinator_dismissAction;
  uint64_t v3 = type metadata accessor for DismissAction();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  sub_1000B8438();
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_1000B8478(v6);

  swift_bridgeObjectRelease();
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  DismissAction.callAsFunction()();
}

@end