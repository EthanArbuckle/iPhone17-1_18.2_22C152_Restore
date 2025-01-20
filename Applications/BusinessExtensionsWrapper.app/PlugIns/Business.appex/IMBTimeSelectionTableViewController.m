@interface IMBTimeSelectionTableViewController
- (_TtC8Business35IMBTimeSelectionTableViewController)initWithCoder:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation IMBTimeSelectionTableViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10009AC5C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10009AD70(a3);
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v5 = (unint64_t *)((char *)self + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_dates);
  swift_beginAccess();
  unint64_t v6 = *v5;
  if (v6 >> 62)
  {
    id v9 = a3;
    v10 = self;
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000BC0D8();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v7 != 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v6 = (unint64_t *)((char *)self + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_dates);
  swift_beginAccess();
  unint64_t v7 = *v6;
  if (!(v7 >> 62)) {
    return *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v10 = a3;
  v11 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = sub_1000BC0D8();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1000BB3C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB388();
  id v11 = a3;
  v12 = self;
  sub_10009B524(v11);
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v14;
}

- (_TtC8Business35IMBTimeSelectionTableViewController)initWithCoder:(id)a3
{
  return (_TtC8Business35IMBTimeSelectionTableViewController *)sub_10009D5EC(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessage));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Business35IMBTimeSelectionTableViewController_selectedMessageInfo);
}

@end