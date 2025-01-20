@interface RadioStationListViewController
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (void)invalidate;
- (void)nowPlayingTapped;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RadioStationListViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10001083C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100011734(a3);
}

- (void)invalidate
{
  v2 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Media30RadioStationListViewController_cancelSet);
  swift_beginAccess();
  void *v2 = &_swiftEmptySetSingleton;
  swift_bridgeObjectRelease();
}

- (void)nowPlayingTapped
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = (id)Strong;
    v4 = self;
    sub_10000A1F8();
  }
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
  sub_100011FF0(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return sub_1000129C0();
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  double v12 = sub_100012A10();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media30RadioStationListViewController_dataSource));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end