@interface CategoryListViewController
- (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController)initWithStyle:(int64_t)a3;
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

- (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_selectionHandler);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_placeholderImage) = 0;
  id v5 = a3;

  result = (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006F85F8();
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
  sub_10076D5D0();
  id v5 = 0;
  if (!sub_10076A590()) {
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
  sub_10076D5D0();
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
               + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_selectionHandler);
  uint64_t v3 = *(uint64_t *)((char *)&v4->super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_selectionHandler);
  void *v2 = 0;
  v2[1] = 0;
  sub_1000194B0(v3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  sub_10000FA3C(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_dataSource)+ 2, (*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_dataSource))[5]);
  id v6 = a3;
  objc_super v7 = self;
  int64_t v8 = sub_100775E30();

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1006F8B5C(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_10076A5F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_10076A530();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  id v15 = [v13 imageView];
  if (v15)
  {
    id v16 = v15;
    sub_1000874B4();
    sub_1006FA740((unint64_t *)&qword_10094E640, (void (*)(uint64_t))sub_1000874B4);
    sub_10077CFB0();
    sub_10076D5E0();
    sub_100019524((uint64_t)v17);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    __break(1u);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  v11 = self;
  sub_1006FA4AC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v3 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_parentIndexPath;
  uint64_t v4 = sub_10076A5F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_selectionHandler));
  objc_super v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_0DAF38422160BEFD42D8AB01B6955FB726CategoryListViewController_placeholderImage);
}

@end