@interface StatisticsViewAllTableViewController
- (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation StatisticsViewAllTableViewController

- (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2414112F8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_24140CC7C();
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
  id v12 = sub_24140D8F4(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_24140F264(v6, a4);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  sub_241411404(a4);
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = (char *)a3;
  uint64_t v7 = self;
  sub_241410210(v6, a4);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_sections;
  swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)(*(void *)v5 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  double result = *MEMORY[0x263F839B8];
  if (!*(unsigned char *)(*(void *)v5 + a4 + 32)) {
    return 0.0;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_sections;
  swift_beginAccess();
  return *(void *)(*(void *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_2414114C0(a4);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_24162BB18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  objc_msgSend(v13, sel__setShouldHaveFullLengthBottomSeparator_, 0);
  objc_msgSend(v13, sel__setShouldHaveFullLengthTopSeparator_, 0);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController)initWithStyle:(int64_t)a3
{
  double result = (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_statistics));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_analysis));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_calendarCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController_analysisProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36StatisticsViewAllTableViewController____lazy_storage___yearsMonthsDaysFormatter));

  swift_release();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_241411570(v7);
}

@end