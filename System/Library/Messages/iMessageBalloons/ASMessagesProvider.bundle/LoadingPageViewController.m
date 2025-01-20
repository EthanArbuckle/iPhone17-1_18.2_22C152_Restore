@interface LoadingPageViewController
- (_TtC18ASMessagesProvider25LoadingPageViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider25LoadingPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation LoadingPageViewController

- (_TtC18ASMessagesProvider25LoadingPageViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider25LoadingPageViewController_contentViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider25LoadingPageViewController_overlayViewController) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider25LoadingPageViewController_startedAsFlowPreview) = 0;
  id v4 = a3;

  result = (_TtC18ASMessagesProvider25LoadingPageViewController *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_689644();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_689860();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(LoadingPageViewController *)v2 traitCollection];
  id v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&def_270DE0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (_TtC18ASMessagesProvider25LoadingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider25LoadingPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider25LoadingPageViewController_contentViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider25LoadingPageViewController_overlayViewController);
}

@end