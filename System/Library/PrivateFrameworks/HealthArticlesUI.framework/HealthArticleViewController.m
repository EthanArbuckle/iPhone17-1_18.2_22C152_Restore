@interface HealthArticleViewController
- (_TtC16HealthArticlesUI27HealthArticleViewController)initWithCoder:(id)a3;
- (_TtC16HealthArticlesUI27HealthArticleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismissArticleModal;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation HealthArticleViewController

- (_TtC16HealthArticlesUI27HealthArticleViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___componentViews) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___trackingViewToState) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView) = 0;
  id v4 = a3;

  result = (_TtC16HealthArticlesUI27HealthArticleViewController *)sub_1C2921060();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C2907090();
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for HealthArticleViewController();
  id v4 = v16.receiver;
  [(HealthArticleViewController *)&v16 viewIsAppearing:v3];
  id v5 = objc_msgSend(v4, sel_traitCollection, v16.receiver, v16.super_class);
  uint64_t v6 = sub_1C2920E40();

  objc_msgSend(self, sel_edgeInsetsForWidthDesignation_, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = sub_1C29065A4();
  objc_msgSend(v15, sel_setDirectionalLayoutMargins_, v8, v10, v12, v14);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HealthArticleViewController();
  id v4 = v5.receiver;
  [(HealthArticleViewController *)&v5 viewDidAppear:v3];
  sub_1C2907BB8(0);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dismissArticleModal
{
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1C2907BB8(1);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1C2907BB8(0);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    double v7 = self;
    sub_1C2907BB8(0);
  }
}

- (_TtC16HealthArticlesUI27HealthArticleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16HealthArticlesUI27HealthArticleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController____lazy_storage___contentView));
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16HealthArticlesUI27HealthArticleViewController_scrollView);
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return [(HealthArticleViewController *)self supportedInterfaceOrientations];
}

@end