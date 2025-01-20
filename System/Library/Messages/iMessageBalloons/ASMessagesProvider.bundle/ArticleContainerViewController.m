@interface ArticleContainerViewController
- (UIViewController)childViewControllerForStatusBarHidden;
- (_TtC18ASMessagesProvider30ArticleContainerViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider30ArticleContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation ArticleContainerViewController

- (_TtC18ASMessagesProvider30ArticleContainerViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider30ArticleContainerViewController_allowTraitCollectionOverrides) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider30ArticleContainerViewController_previousShouldOverrideTraitCollections) = 0;
  id v4 = a3;

  result = (_TtC18ASMessagesProvider30ArticleContainerViewController *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_152BD0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_152F3C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ArticleContainerViewController *)&v6 traitCollectionDidChange:v4];
  sub_152CE0();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(ArticleContainerViewController *)v2 traitCollection];
  id v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&def_270DE0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider30ArticleContainerViewController_wrapperViewController) topViewController];

  return (UIViewController *)v2;
}

- (_TtC18ASMessagesProvider30ArticleContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider30ArticleContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider30ArticleContainerViewController_wrapperViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider30ArticleContainerViewController_articleViewController);
}

@end