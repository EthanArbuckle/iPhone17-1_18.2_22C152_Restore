@interface LoadingPageViewController
- (_TtC20ProductPageExtension25LoadingPageViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension25LoadingPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation LoadingPageViewController

- (_TtC20ProductPageExtension25LoadingPageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_contentViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_overlayViewController) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_startedAsFlowPreview) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension25LoadingPageViewController *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006A159C();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1006A17B8();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(LoadingPageViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (_TtC20ProductPageExtension25LoadingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20ProductPageExtension25LoadingPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_contentViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension25LoadingPageViewController_overlayViewController);
}

@end