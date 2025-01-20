@interface CellularDataListItemProvider
- (_TtC11SettingsApp28CellularDataListItemProvider)init;
- (void)dealloc;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
@end

@implementation CellularDataListItemProvider

- (void)dealloc
{
  v2 = self;
  sub_1000A85C0();
}

- (void).cxx_destruct
{
}

- (_TtC11SettingsApp28CellularDataListItemProvider)init
{
  result = (_TtC11SettingsApp28CellularDataListItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v6 = self;
  id v7 = a3;
  v8 = self;
  id v9 = [v6 defaultCenter];
  id v10 = v9;
  if (qword_10015F0A0 != -1)
  {
    swift_once();
    id v9 = v10;
  }
  [v9 postNotificationName:qword_10016AE80 object:0];

  swift_bridgeObjectRelease();
}

@end