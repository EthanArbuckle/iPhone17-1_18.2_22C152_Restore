@interface SiriSetupViewController.Delegate
- (BOOL)siriSetupViewController:(id)a3 openURL:(id)a4;
- (_TtCV6Tamale23SiriSetupViewControllerP33_801190BADA2CE0837A9561ED0AAB3DD18Delegate)init;
- (void)openSiriRequestedBySiriSetupViewController:(id)a3;
@end

@implementation SiriSetupViewController.Delegate

- (BOOL)siriSetupViewController:(id)a3 openURL:(id)a4
{
  uint64_t v5 = sub_10000F214(&qword_10051E070);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  sub_1000EE650((uint64_t)v7);
  return 1;
}

- (void)openSiriRequestedBySiriSetupViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000EE264();
}

- (_TtCV6Tamale23SiriSetupViewControllerP33_801190BADA2CE0837A9561ED0AAB3DD18Delegate)init
{
  result = (_TtCV6Tamale23SiriSetupViewControllerP33_801190BADA2CE0837A9561ED0AAB3DD18Delegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end