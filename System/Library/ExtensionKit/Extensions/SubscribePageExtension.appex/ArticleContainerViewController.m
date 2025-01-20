@interface ArticleContainerViewController
- (UIViewController)childViewControllerForStatusBarHidden;
- (_TtC22SubscribePageExtension30ArticleContainerViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30ArticleContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation ArticleContainerViewController

- (_TtC22SubscribePageExtension30ArticleContainerViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension30ArticleContainerViewController_allowTraitCollectionOverrides) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension30ArticleContainerViewController_previousShouldOverrideTraitCollections) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension30ArticleContainerViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_1005A4140();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1005A44AC();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ArticleContainerViewController *)&v6 traitCollectionDidChange:v4];
  sub_1005A4250();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(ArticleContainerViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension30ArticleContainerViewController_wrapperViewController) topViewController];

  return (UIViewController *)v2;
}

- (_TtC22SubscribePageExtension30ArticleContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension30ArticleContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30ArticleContainerViewController_wrapperViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension30ArticleContainerViewController_articleViewController);
}

@end