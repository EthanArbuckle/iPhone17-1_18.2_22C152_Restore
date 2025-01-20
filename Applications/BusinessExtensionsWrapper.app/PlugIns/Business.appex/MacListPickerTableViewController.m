@interface MacListPickerTableViewController
- (_TtC8Business32MacListPickerTableViewController)initWithCoder:(id)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation MacListPickerTableViewController

- (_TtC8Business32MacListPickerTableViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_selectedIndexPaths) = (Class)&_swiftEmptySetSingleton;
  id v4 = a3;

  result = (_TtC8Business32MacListPickerTableViewController *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000ABBE8();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
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
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Business32MacListPickerTableViewController_listRequest);
  if (!v4) {
    return 0;
  }
  uint64_t v7 = *(void *)(v4 + 24);
  if ((v7 & 0xC000000000000001) == 0)
  {
    if (a4 < 0)
    {
      __break(1u);
    }
    else if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
    {
      uint64_t v8 = *(void *)(*(void *)(v7 + 8 * a4 + 32) + 40);
      if ((v8 & 0x8000000000000000) == 0 && (v8 & 0x4000000000000000) == 0) {
        return *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      goto LABEL_15;
    }
    __break(1u);
LABEL_15:
    id v15 = a3;
    v16 = self;
    swift_bridgeObjectRetain();
    goto LABEL_16;
  }
  id v11 = a3;
  v12 = self;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1000BC018();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v13 + 40);
  swift_bridgeObjectRetain();
  swift_unknownObjectRelease();
  if ((v14 & 0x8000000000000000) == 0 && (v14 & 0x4000000000000000) == 0)
  {
    int64_t v9 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);

    swift_bridgeObjectRelease();
    return v9;
  }
LABEL_16:
  swift_bridgeObjectRetain();
  int64_t v17 = sub_1000BC0D8();

  swift_bridgeObjectRelease_n();
  return v17;
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
  uint64_t v13 = (void *)sub_1000ACFAC(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  if ((uint64_t)[v5 numberOfSections] <= 1) {
    double v7 = 0.0;
  }
  else {
    double v7 = UITableViewAutomaticDimension;
  }

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = self;
  uint64_t v8 = (void *)sub_1000AD578(v6, a4);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1000BB3C8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB388();
  id v11 = a3;
  v12 = self;
  sub_1000AD864(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  uint64_t v4 = sub_1000BB3C8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005D74(&qword_1000FCC80);
  __chkstk_darwin(v9 - 8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BB388();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v12, 1, 1, v4);
  uint64_t v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v8, v4);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4) != 1)
  {
    Class isa = sub_1000BB378().super.isa;
    v13(v12, v4);
  }

  return isa;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end