@interface ArcadeWelcomeViewController
- (_TtC18ASMessagesProvider27ArcadeWelcomeViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider27ArcadeWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ArcadeWelcomeViewController

- (_TtC18ASMessagesProvider27ArcadeWelcomeViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider27ArcadeWelcomeViewController_overlayViewController) = 0;
  id v4 = a3;

  result = (_TtC18ASMessagesProvider27ArcadeWelcomeViewController *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_351878();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_351A88();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_351CF8(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_351F58(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_352284(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_76D8C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v10 = self;
  [(ArcadeWelcomeViewController *)&v11 viewDidDisappear:v3];
  sub_FB9C((Class *)((char *)&v10->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider27ArcadeWelcomeViewController_lifecycleObserver), *(void *)&v10->artworkLoader[OBJC_IVAR____TtC18ASMessagesProvider27ArcadeWelcomeViewController_lifecycleObserver]);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v6);
  sub_76D8D0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)appEnteredWhileAppeared
{
}

- (void)appExitedWhileAppeared
{
}

- (_TtC18ASMessagesProvider27ArcadeWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider27ArcadeWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider27ArcadeWelcomeViewController_lifecycleObserver);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider27ArcadeWelcomeViewController_pageView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider27ArcadeWelcomeViewController_overlayViewController);
}

@end