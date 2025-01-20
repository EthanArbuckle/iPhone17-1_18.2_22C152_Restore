@interface ArcadeWelcomeViewController
- (_TtC22SubscribePageExtension27ArcadeWelcomeViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension27ArcadeWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC22SubscribePageExtension27ArcadeWelcomeViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension27ArcadeWelcomeViewController_overlayViewController) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension27ArcadeWelcomeViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100687E44();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100688054();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1006882C4(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_100688524(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100688850(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_100757950();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v11 = self;
  [(ArcadeWelcomeViewController *)&v12 viewDidDisappear:v3];
  sub_10000FE94((Class *)((char *)&v11->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension27ArcadeWelcomeViewController_lifecycleObserver), *(void *)&v11->artworkLoader[OBJC_IVAR____TtC22SubscribePageExtension27ArcadeWelcomeViewController_lifecycleObserver]);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v6);
  sub_100757960();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)appEnteredWhileAppeared
{
}

- (void)appExitedWhileAppeared
{
}

- (_TtC22SubscribePageExtension27ArcadeWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension27ArcadeWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension27ArcadeWelcomeViewController_lifecycleObserver);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27ArcadeWelcomeViewController_pageView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension27ArcadeWelcomeViewController_overlayViewController);
}

@end