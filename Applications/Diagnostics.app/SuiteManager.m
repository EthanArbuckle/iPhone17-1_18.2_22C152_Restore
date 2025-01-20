@interface SuiteManager
- (DADeviceState)deviceState;
- (_TtC11Diagnostics12SuiteManager)init;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setDeviceState:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SuiteManager

- (DADeviceState)deviceState
{
  return (DADeviceState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC11Diagnostics12SuiteManager_deviceState));
}

- (void)setDeviceState:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_10007E128(a3);
}

- (_TtC11Diagnostics12SuiteManager)init
{
  return (_TtC11Diagnostics12SuiteManager *)sub_100078EEC();
}

- (void).cxx_destruct
{
  sub_100056FB4((uint64_t)self + OBJC_IVAR____TtC11Diagnostics12SuiteManager_delegate);
  swift_release();

  swift_bridgeObjectRelease();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10007B464(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_10007E214();

  return v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = [v6 init];
  id v10 = [self clearColor];
  [v9 setBackgroundColor:v10];

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 12.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10007E378();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end