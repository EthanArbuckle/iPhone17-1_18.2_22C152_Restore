@interface TitleValueTableViewController
- (_TtC15JournalSettings29TitleValueTableViewController)initWithCoder:(id)a3;
- (_TtC15JournalSettings29TitleValueTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15JournalSettings29TitleValueTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)refreshData;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLoad;
@end

@implementation TitleValueTableViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_9CD88();
}

- (void)refreshData
{
  uint64_t v3 = sub_A314(&qword_19BFB0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_145F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_145F30();
  v7 = self;
  uint64_t v8 = sub_145F20();
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_76884((uint64_t)v5, (uint64_t)&unk_19F9D8, (uint64_t)v9);

  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15JournalSettings29TitleValueTableViewController_data))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_9DA18(a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sub_9DA50(a4);
  if (v4)
  {
    NSString v5 = sub_145B80();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return v5;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_9DAB4(v8);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1454E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1454B0();
  id v10 = a3;
  v11 = self;
  id v12 = sub_9DC64();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1454E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1454B0();
  id v10 = a3;
  v11 = self;
  sub_9DF3C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC15JournalSettings29TitleValueTableViewController)initWithStyle:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15JournalSettings29TitleValueTableViewController_data) = (Class)_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TitleValueTableViewController();
  return [(TitleValueTableViewController *)&v5 initWithStyle:a3];
}

- (_TtC15JournalSettings29TitleValueTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_145BC0();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC15JournalSettings29TitleValueTableViewController_data) = (Class)_swiftEmptyArrayStorage;
    id v6 = a4;
    NSString v7 = sub_145B80();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC15JournalSettings29TitleValueTableViewController_data) = (Class)_swiftEmptyArrayStorage;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TitleValueTableViewController();
  v9 = [(TitleValueTableViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC15JournalSettings29TitleValueTableViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15JournalSettings29TitleValueTableViewController_data) = (Class)_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TitleValueTableViewController();
  return [(TitleValueTableViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end