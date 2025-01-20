@interface TopChartsDiffablePageViewController
- (_TtC18ASMessagesProvider35TopChartsDiffablePageViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider35TopChartsDiffablePageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)showCategoriesFor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TopChartsDiffablePageViewController

- (_TtC18ASMessagesProvider35TopChartsDiffablePageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_6DEFA8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_6DB250();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  v4 = v6.receiver;
  [(TopChartsDiffablePageViewController *)&v6 viewWillAppear:v3];
  uint64_t v5 = OBJC_IVAR____TtC18ASMessagesProvider35TopChartsDiffablePageViewController_isPresenterLoaded;
  if ((v4[OBJC_IVAR____TtC18ASMessagesProvider35TopChartsDiffablePageViewController_isPresenterLoaded] & 1) == 0)
  {
    sub_776610();
    v4[v5] = 1;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  id v4 = v5.receiver;
  [(TopChartsDiffablePageViewController *)&v5 viewDidAppear:v3];
  sub_777E60();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_77D140();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for TopChartsDiffablePageViewController();
  v11.receiver = self;
  v11.super_class = v9;
  v10 = self;
  [(TopChartsDiffablePageViewController *)&v11 viewWillDisappear:v3];
  sub_77D130();
  sub_777E80();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_6DBCA8();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(TopChartsDiffablePageViewController *)v2 traitCollection];
  id v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&def_270DE0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  id v4 = v8.receiver;
  id v5 = [(TopChartsDiffablePageViewController *)&v8 contentScrollViewForEdge:a3];
  if (!v5)
  {
    id v6 = objc_allocWithZone((Class)UIScrollView);
    id v5 = objc_msgSend(v6, "init", v8.receiver, v8.super_class);
  }

  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TopChartsDiffablePageViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(TopChartsDiffablePageViewController *)&v6 traitCollectionDidChange:v4];
  if (objc_msgSend(v5, "isViewLoaded", v6.receiver, v6.super_class)) {
    sub_6DA75C(0, 0, 1);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  objc_super v8 = self;
  sub_6DBF84(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)showCategoriesFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_6E0250();
}

- (_TtC18ASMessagesProvider35TopChartsDiffablePageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider35TopChartsDiffablePageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider35TopChartsDiffablePageViewController_paletteContents));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider35TopChartsDiffablePageViewController_categoriesBarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider35TopChartsDiffablePageViewController_overlayViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider35TopChartsDiffablePageViewController_selectCategoryViewController);
}

@end