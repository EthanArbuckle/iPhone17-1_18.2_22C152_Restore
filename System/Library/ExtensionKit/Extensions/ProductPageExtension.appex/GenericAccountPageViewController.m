@interface GenericAccountPageViewController
- (_TtC20ProductPageExtension32GenericAccountPageViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension32GenericAccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC20ProductPageExtension32GenericAccountPageViewController)initWithStyle:(int64_t)a3;
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

- (_TtC20ProductPageExtension32GenericAccountPageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension32GenericAccountPageViewController_overlayViewController) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension32GenericAccountPageViewController *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100414B9C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GenericAccountPageViewController();
  id v4 = v5.receiver;
  [(GenericAccountPageViewController *)&v5 viewDidAppear:v3];
  if (sub_10076D640())
  {
    sub_10077B7B0();

    swift_release();
  }
  else
  {
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_10077B770();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for GenericAccountPageViewController();
  v11.receiver = self;
  v11.super_class = v9;
  v10 = self;
  [(GenericAccountPageViewController *)&v11 viewWillDisappear:v3];
  if (sub_10076D640())
  {
    sub_10077B760();
    sub_10077B7C0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10041511C();
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
  sub_1004152C4(a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int64_t v6 = sub_100775620();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  int64_t v6 = self;
  int64_t v7 = sub_100775610();

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return sub_100416C10(self, (uint64_t)a2, a3, a4, (void (*)(void))type metadata accessor for HeaderView);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  objc_super v11 = self;
  v12 = (void *)sub_100415594(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return sub_100416C10(self, (uint64_t)a2, a3, a4, (void (*)(void))type metadata accessor for LinkableFooterView);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_100416CD0(v6, a4);
  double v9 = v8;

  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = self;
  sub_100416F94(v7, v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  objc_super v11 = self;
  sub_100417348(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_100417E10(v6, a4);
  double v9 = v8;

  return v9;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  sub_100417FB8(v8, v9, a5);
}

- (_TtC20ProductPageExtension32GenericAccountPageViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC20ProductPageExtension32GenericAccountPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension32GenericAccountPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20ProductPageExtension32GenericAccountPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension32GenericAccountPageViewController_overlayViewController);
}

@end