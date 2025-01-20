@interface RadioOptionsViewController
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)invalidate;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation RadioOptionsViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RadioOptionsViewController();
  v2 = (char *)v3.receiver;
  [(RadioPopoverViewController *)&v3 viewDidLoad];
  [v2[OBJC_IVAR____TtC5Media31TableHeaderFooterViewController_tableView] setDataSource:v2, v3.receiver, v3.super_class];
}

- (void)invalidate
{
  v2 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Media26RadioOptionsViewController_cancelSet);
  swift_beginAccess();
  void *v2 = &_swiftEmptySetSingleton;
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_10000F960();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_10000F9CC(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = sub_10000E954(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4 < 1)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [objc_allocWithZone((Class)UIView) init:v4];
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

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_10000FA24();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void).cxx_destruct
{
  sub_10000F940(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5Media26RadioOptionsViewController_completion));
  swift_weakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end