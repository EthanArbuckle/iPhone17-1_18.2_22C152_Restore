@interface DashboardViewController
- (_TtC11Diagnostics23DashboardViewController)initWithCoder:(id)a3;
- (_TtC11Diagnostics23DashboardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11Diagnostics23DashboardViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)barButtonItemTappedWithSender:(id)a3;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DashboardViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DashboardViewController();
  id v2 = v3.receiver;
  [(BaseTableViewController *)&v3 viewDidLoad];
  sub_100066A38();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DashboardViewController();
  v4 = v6.receiver;
  [(DashboardViewController *)&v6 viewDidAppear:v3];
  if (qword_100182828 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for ModalPresentationCoordinator(0);
  sub_10003C3B0(v5, (uint64_t)qword_10018A440);
  swift_beginAccess();
  sub_1000D8460();
  swift_endAccess();
  v4[OBJC_IVAR____TtC11Diagnostics23DashboardViewController_viewWasEverPresented] = 1;
  sub_1000F714C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100067D10(a3);
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1000695E8(a4);
  double v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  double v8 = sub_100068180(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_100067F94(a4);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = sub_100068180(a4);
    [v10 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
    double v12 = v11;
  }
  else
  {

    return 2.22507386e-308;
  }
  return v12;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_1000696C0(v8);
}

- (void)barButtonItemTappedWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  if ([v4 style] == (id)2) {
    sub_1000A795C(4);
  }
  else {
    sub_100070524(0);
  }
}

- (_TtC11Diagnostics23DashboardViewController)initWithStyle:(int64_t)a3
{
  return (_TtC11Diagnostics23DashboardViewController *)sub_100068E20(a3);
}

- (_TtC11Diagnostics23DashboardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11Diagnostics23DashboardViewController *)sub_100068F48(v5, v7, a4);
}

- (_TtC11Diagnostics23DashboardViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics23DashboardViewController *)sub_1000690F0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics23DashboardViewController_cardManager));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics23DashboardViewController_leftBarButtonItem);
}

@end