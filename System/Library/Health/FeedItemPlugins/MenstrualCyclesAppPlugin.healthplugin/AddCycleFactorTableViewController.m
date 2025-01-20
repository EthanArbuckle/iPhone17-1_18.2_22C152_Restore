@interface AddCycleFactorTableViewController
- (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelAndDismiss;
- (void)saveNewFactorAndDismiss;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation AddCycleFactorTableViewController

- (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24156D5C4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_241564C38();
}

- (void)saveNewFactorAndDismiss
{
  v2 = self;
  sub_241564E94();
}

- (void)cancelAndDismiss
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController_sections;
  swift_beginAccess();
  return *(void *)(*(void *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_24156D744(a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_241566524(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_241567BA0(v6, a4);
  v9 = v8;

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  sub_2415681C0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController_providedHealthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController____lazy_storage___addBarButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController____lazy_storage___cancelBarButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController_startDate;
  uint64_t v4 = sub_24162B718();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController_endDate, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33AddCycleFactorTableViewController_manualEntryItemContraceptive));

  swift_release();
}

@end