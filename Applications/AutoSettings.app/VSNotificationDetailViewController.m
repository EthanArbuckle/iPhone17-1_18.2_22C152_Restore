@interface VSNotificationDetailViewController
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dismissPT;
- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4;
- (void)historicalNotificationService:(id)a3 didUpdateHistoricalNotificationUserActions:(id)a4;
- (void)historicalNotificationService:(id)a3 didUpdateNotificationSeverity:(unsigned __int8)a4;
- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4;
- (void)historicalNotificationService:(id)a3 didUpdateUserDismissible:(BOOL)a4;
- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleFullDescription:(id)a4;
- (void)historicalNotificationService:(void *)a3 didUpdateName:;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VSNotificationDetailViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100004FC8();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return *(void *)(*(void *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions]
                   + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_100005318(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 44.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = (void *)sub_1000076EC(v5);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100005758(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)dismissPT
{
  v2 = self;
  sub_1000061CC();
}

- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleFullDescription:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  uint64_t v7 = self;
  *(void *)&v7->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = sub_100004B4C();
  swift_bridgeObjectRelease();
  [*(id *)&v7->superclass_opaque[direct field offset for CAFUITableViewController.tableView] reloadData];

  swift_bridgeObjectRelease();
}

- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4
{
  uint64_t v6 = sub_10000761C((uint64_t *)&unk_10002BF80);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076B0(0, &qword_10002CB10);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  *(void *)&v11->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = sub_100004B4C();
  swift_bridgeObjectRelease();
  [*(id *)&v11->superclass_opaque[direct field offset for CAFUITableViewController.tableView] reloadData];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)historicalNotificationService:(void *)a3 didUpdateName:
{
  id v4 = a3;
  id v5 = a1;
  *(void *)&v5[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = sub_100004B4C();
  swift_bridgeObjectRelease();
  [*(id *)&v5[direct field offset for CAFUITableViewController.tableView] reloadData];
}

- (void)historicalNotificationService:(id)a3 didUpdateNotificationSeverity:(unsigned __int8)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  *(void *)&v6->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = sub_100004B4C();
  swift_bridgeObjectRelease();
  [*(id *)&v6->superclass_opaque[direct field offset for CAFUITableViewController.tableView] reloadData];
}

- (void)historicalNotificationService:(id)a3 didUpdateHistoricalNotificationUserActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  *(void *)&v8->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = sub_100004B4C();
  swift_bridgeObjectRelease();
  [*(id *)&v8->superclass_opaque[direct field offset for CAFUITableViewController.tableView] reloadData];
}

- (void)historicalNotificationService:(id)a3 didUpdateUserDismissible:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  *(void *)&v6->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = sub_100004B4C();
  swift_bridgeObjectRelease();
  [*(id *)&v6->superclass_opaque[direct field offset for CAFUITableViewController.tableView] reloadData];
}

- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4
{
  if (a4
    && (self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_didHide] & 1) == 0)
  {
    self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_didHide] = 1;
    id v5 = a3;
    id v6 = self;
    id v8 = [(VSNotificationDetailViewController *)v6 navigationController];
    id v7 = [v8 popViewControllerAnimated:1];
  }
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end