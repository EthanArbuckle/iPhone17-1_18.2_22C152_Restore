@interface CategoryListViewController
- (_TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)dismissSelf;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CategoryListViewController

- (_TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController_selectionHandler);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController_placeholderImage) = 0;
  id v5 = a3;

  result = (_TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003E90A0();
}

- (void)as_viewWillBecomeFullyVisible
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(CategoryListViewController *)&v7 viewWillAppear:v3];
  sub_100759190();
  id v5 = 0;
  if (!sub_1007563E0()) {
    id v5 = objc_msgSend(v4, "_isInPopoverPresentation", v7.receiver, v7.super_class);
  }
  id v6 = objc_msgSend(v4, "navigationController", v7.receiver, v7.super_class);
  [v6 setNavigationBarHidden:v5 animated:0];
}

- (void)as_viewDidBecomePartiallyVisible
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(CategoryListViewController *)&v5 viewDidDisappear:v3];
  sub_100759190();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(CategoryListViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)dismissSelf
{
  id v4 = self;
  [(CategoryListViewController *)v4 dismissViewControllerAnimated:1 completion:0];
  v2 = (Class *)((char *)&v4->super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController_selectionHandler);
  uint64_t v3 = *(uint64_t *)((char *)&v4->super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController_selectionHandler);
  void *v2 = 0;
  v2[1] = 0;
  sub_10001A4D0(v3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  sub_10000FE94(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController_dataSource)+ 2, (*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController_dataSource))[5]);
  id v6 = a3;
  objc_super v7 = self;
  int64_t v8 = sub_1007617D0();

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  v12 = self;
  id v13 = sub_1003E9604(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  id v16 = [v14 imageView];
  if (v16)
  {
    id v17 = v16;
    sub_1001AF4DC();
    sub_1003EB1E8((unint64_t *)&qword_1009465F0, (void (*)(uint64_t))sub_1001AF4DC);
    sub_1007688D0();
    sub_1007591A0();
    sub_10001A544((uint64_t)v18);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  else
  {
    __break(1u);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  v12 = self;
  sub_1003EAF54();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v3 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController_parentIndexPath;
  uint64_t v4 = sub_100756440();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController_selectionHandler));
  objc_super v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtensionP33_E8A3C8C9EB70237120159EB97F20AEB326CategoryListViewController_placeholderImage);
}

@end