@interface VSNotificationHistoryViewController
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4;
- (void)historicalNotificationService:(id)a3 didUpdateHistoricalNotificationUserActions:(id)a4;
- (void)historicalNotificationService:(id)a3 didUpdateName:(id)a4;
- (void)historicalNotificationService:(id)a3 didUpdateNotificationSeverity:(unsigned __int8)a4;
- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4;
- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleFullDescription:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation VSNotificationHistoryViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100007B58();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1000084E0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4 < 1)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [objc_allocWithZone((Class)UIView) init];
  }
  return v6;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 0.0;
  if (a4 > 0) {
    return 12.0;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = &self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity];
  swift_beginAccess();
  return *(void *)(*(void *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  unint64_t v8 = sub_1000083E8(a4);
  if (v8)
  {
    if (v8 >> 62) {
      int64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    }
    else {
      int64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }

    swift_bridgeObjectRelease();
  }
  else
  {

    return 0;
  }
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = (void *)sub_100008924(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)historicalNotificationService:(id)a3 didUpdateName:(id)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100007E64();
}

- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleFullDescription:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  uint64_t v7 = self;
  sub_100007E64();

  swift_bridgeObjectRelease();
}

- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4
{
  uint64_t v6 = sub_10000761C((uint64_t *)&unk_10002BF80);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076B0(0, &qword_10002CB10);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100007E64();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)historicalNotificationService:(id)a3 didUpdateNotificationSeverity:(unsigned __int8)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100007E64();
}

- (void)historicalNotificationService:(id)a3 didUpdateHistoricalNotificationUserActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100007E64();
}

- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_100007E64();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end