@interface GenericAccountPageViewController
- (_TtC22SubscribePageExtension32GenericAccountPageViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension32GenericAccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC22SubscribePageExtension32GenericAccountPageViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation GenericAccountPageViewController

- (_TtC22SubscribePageExtension32GenericAccountPageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension32GenericAccountPageViewController_overlayViewController) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension32GenericAccountPageViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1004D8CC4();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GenericAccountPageViewController();
  id v4 = v5.receiver;
  [(GenericAccountPageViewController *)&v5 viewDidAppear:v3];
  if (sub_100759200())
  {
    sub_100767110();

    swift_release();
  }
  else
  {
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_1007670D0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (objc_class *)type metadata accessor for GenericAccountPageViewController();
  v12.receiver = self;
  v12.super_class = v10;
  v11 = self;
  [(GenericAccountPageViewController *)&v12 viewWillDisappear:v3];
  if (sub_100759200())
  {
    sub_1007670C0();
    sub_100767120();
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1004D9244();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(GenericAccountPageViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1004D93EC(a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int64_t v6 = sub_100761020();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  int64_t v6 = self;
  int64_t v7 = sub_100761010();

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return sub_1004DAD38(self, (uint64_t)a2, a3, a4, (void (*)(void))_s22SubscribePageExtension10HeaderViewCMa_0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  objc_super v12 = self;
  v13 = (void *)sub_1004D96BC(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return sub_1004DAD38(self, (uint64_t)a2, a3, a4, (void (*)(void))type metadata accessor for LinkableFooterView);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1004DADF8(v6, a4);
  double v9 = v8;

  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = self;
  sub_1004DB0BC(v7, v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  objc_super v12 = self;
  sub_1004DB470(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1004DBF38(v6, a4);
  double v9 = v8;

  return v9;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_1004DC0E0(v8, v9, a5);
}

- (_TtC22SubscribePageExtension32GenericAccountPageViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC22SubscribePageExtension32GenericAccountPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension32GenericAccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension32GenericAccountPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension32GenericAccountPageViewController_overlayViewController);
}

@end