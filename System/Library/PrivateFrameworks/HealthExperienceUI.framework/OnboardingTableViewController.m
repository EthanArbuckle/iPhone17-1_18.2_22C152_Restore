@interface OnboardingTableViewController
- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation OnboardingTableViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD381B6C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AD3820B4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AD3821C0(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for OnboardingTableViewController();
  v4 = (char *)v6.receiver;
  id v5 = a3;
  [(OnboardingTableViewController *)&v6 traitCollectionDidChange:v5];
  if (*(void *)&v4[OBJC_IVAR____TtC18HealthExperienceUI29OnboardingTableViewController_dataSourceAdaptor])
  {
    swift_retain();
    sub_1AD6091E8();

    swift_release();
  }
  else
  {
  }
}

- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC18HealthExperienceUI29OnboardingTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC18HealthExperienceUI29OnboardingTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC18HealthExperienceUI29OnboardingTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI29OnboardingTableViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI29OnboardingTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = (UITableView *)a3;
  v7 = self;
  OnboardingTableViewController.tableView(_:viewForFooterInSection:)(v8, v6, a4);
  v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = (UITableView *)a3;
  v7 = self;
  OnboardingTableViewController.tableView(_:viewForHeaderInSection:)(v8, v6, a4);
  v10 = v9;

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  double v8 = OnboardingTableViewController.tableView(_:heightForHeaderInSection:)(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  double v8 = OnboardingTableViewController.tableView(_:heightForFooterInSection:)(v6, a4);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD73A860();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A7E0();
  id v10 = a3;
  v11 = self;
  OnboardingTableViewController.tableView(_:didSelectRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end