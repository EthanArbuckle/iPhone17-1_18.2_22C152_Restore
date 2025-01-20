@interface CycleHistoryTableViewController
- (BOOL)axFilterSelected;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
- (void)pushFilterView;
- (void)respondToContentSizeChanges;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CycleHistoryTableViewController

- (BOOL)axFilterSelected
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_selectedFilter) != 51;
}

- (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24145FE8C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_24145B0BC();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CycleHistoryTableViewController();
  v4 = (char *)v5.receiver;
  [(CycleHistoryTableViewController *)&v5 viewWillAppear:v3];
  *(void *)&v4[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_presentedPDFProvider] = 0;

  swift_release();
}

- (void)respondToContentSizeChanges
{
  v2 = self;
  sub_24145D4B0();
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleHistoryTableViewController();
  id v2 = v3.receiver;
  [(CycleHistoryTableViewController *)&v3 viewLayoutMarginsDidChange];
  sub_24145D4B0();
}

- (void)pushFilterView
{
  id v2 = self;
  sub_24145DC68();
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
  v12 = (void *)sub_24145ED7C((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_24145DE88(v6, a4);
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
  sub_24145E3D0(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_years;
  swift_beginAccess();
  return *(void *)(*(void *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_24145FF70(a4);

  return v8;
}

- (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController____lazy_storage___yearDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_analysis));
  sub_2411E0300(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController____lazy_storage___healthStore));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_calendarCache));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_gregorianCalendar;
  uint64_t v4 = sub_24162BA08();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_today;
  uint64_t v6 = sub_241631AC8();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_analysisProvider));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_providedHealthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_eventSubmissionManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleHistoryTableViewController_headerView));

  swift_release();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = self;
  sub_241460160(v7);
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

@end