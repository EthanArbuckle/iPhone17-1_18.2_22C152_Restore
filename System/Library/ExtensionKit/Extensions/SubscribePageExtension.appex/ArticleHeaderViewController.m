@interface ArticleHeaderViewController
- (_TtC22SubscribePageExtension27ArticleHeaderViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension27ArticleHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ArticleHeaderViewController

- (_TtC22SubscribePageExtension27ArticleHeaderViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension27ArticleHeaderViewController_isDisappearing) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension27ArticleHeaderViewController_isAppearing) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension27ArticleHeaderViewController_isCardModeEnabled) = 1;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension27ArticleHeaderViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)loadView
{
  v13 = self;
  if ([(ArticleHeaderViewController *)v13 isViewLoaded])
  {
    v2 = v13;
  }
  else
  {
    id v3 = [self mainScreen];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    v12 = (_TtC22SubscribePageExtension27ArticleHeaderViewController *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ArticleHeaderViewController.ContentView()), "initWithFrame:", v5, v7, v9, v11);
    [(ArticleHeaderViewController *)v13 setView:v12];

    v2 = v12;
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10037B928();
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10037BB28();
}

- (void)viewSafeAreaInsetsDidChange
{
  v2 = self;
  sub_10037C360();
}

- (_TtC22SubscribePageExtension27ArticleHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension27ArticleHeaderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27ArticleHeaderViewController_cell));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension27ArticleHeaderViewController_alternateCell);
}

@end