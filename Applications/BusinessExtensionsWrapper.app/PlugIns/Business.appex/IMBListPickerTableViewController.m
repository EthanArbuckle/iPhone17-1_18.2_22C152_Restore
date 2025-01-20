@interface IMBListPickerTableViewController
- (_TtC8Business32IMBListPickerTableViewController)initWithCoder:(id)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (uint64_t)tableView:(void *)a3 didSelectRowAtIndexPath:;
- (void)viewDidLoad;
@end

@implementation IMBListPickerTableViewController

- (_TtC8Business32IMBListPickerTableViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_multipleSelectionEnabled) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_cellShouldHaveSelectionIcon) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_listRequest) = 0;
  uint64_t v4 = OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_selectedItems;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_100054144((uint64_t)&_swiftEmptyArrayStorage);

  result = (_TtC8Business32IMBListPickerTableViewController *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10001EF68();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Business32IMBListPickerTableViewController_listRequest);
  if (!v3) {
    return 1;
  }
  unint64_t v4 = *(void *)(v3 + 24);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = sub_1000BC0D8();

  swift_bridgeObjectRelease();
  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  int64_t v8 = sub_1000221C8(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1000BB3C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB388();
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_100021054(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_10002179C(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_1000BB3C8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB388();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return 140.0;
}

- (uint64_t)tableView:(void *)a3 didSelectRowAtIndexPath:
{
  uint64_t v5 = sub_1000BB3C8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB388();
  id v10 = a3;
  id v11 = a1;
  sub_10001F670((uint64_t)v9);

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1000BB3C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  id v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005D74(&qword_1000FCC80);
  __chkstk_darwin(v11 - 8, v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB388();
  id v15 = a3;
  v16 = self;
  if (sub_1000304C4() == 2)
  {
    uint64_t v17 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v14, v10, v6);
    uint64_t v17 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v14, v17, 1, v6);

  v18 = *(void (**)(char *, uint64_t))(v7 + 8);
  v18(v10, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v14, 1, v6) == 1)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_1000BB378().super.isa;
    v18(v14, v6);
  }

  return isa;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end