@interface B389DoneViewController
- (_TtC18SharingViewService22B389DoneViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService22B389DoneViewController)initWithMainController:(id)a3;
- (_TtC18SharingViewService22B389DoneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)customizePressed;
- (void)dismissPressed;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation B389DoneViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10005EC18(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for B389DoneViewController();
  [(B389DoneViewController *)&v4 viewDidDisappear:v3];
}

- (void)dismissPressed
{
  v2 = self;
  sub_10005FDA0();
}

- (void)customizePressed
{
  v2 = self;
  sub_10005FF34();
}

- (_TtC18SharingViewService22B389DoneViewController)initWithMainController:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_tv;
  id v6 = objc_allocWithZone((Class)UITableView);
  id v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0 style:0.0];
  *(Class *)((char *)&v8->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_mapViewController) = 0;
  uint64_t v9 = OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_data;
  *(Class *)((char *)&v8->super.super.super.super.isa + v9) = (Class)sub_10005E568();

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for B389DoneViewController();
  v10 = [(SVSBaseViewController *)&v12 initWithMainController:v7];

  return v10;
}

- (_TtC18SharingViewService22B389DoneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC18SharingViewService22B389DoneViewController *)sub_100060958((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_10006083C);
}

- (_TtC18SharingViewService22B389DoneViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService22B389DoneViewController *)sub_1000609CC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_tv));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_mapViewController));

  swift_bridgeObjectRelease();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService22B389DoneViewController_data))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100060B68(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

@end