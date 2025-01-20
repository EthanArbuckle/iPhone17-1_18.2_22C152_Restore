@interface ArcadeWelcomeViewController
- (_TtC20ProductPageExtension27ArcadeWelcomeViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension27ArcadeWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC20ProductPageExtension27ArcadeWelcomeViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension27ArcadeWelcomeViewController_overlayViewController) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension27ArcadeWelcomeViewController *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1000AAD44();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000AAF54();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1000AB1C4(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1000AB424(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1000AB750(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_10076BD40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v10 = self;
  [(ArcadeWelcomeViewController *)&v11 viewDidDisappear:v3];
  sub_10000FA3C((Class *)((char *)&v10->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension27ArcadeWelcomeViewController_lifecycleObserver), *(void *)&v10->artworkLoader[OBJC_IVAR____TtC20ProductPageExtension27ArcadeWelcomeViewController_lifecycleObserver]);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v6);
  sub_10076BD50();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)appEnteredWhileAppeared
{
}

- (void)appExitedWhileAppeared
{
}

- (_TtC20ProductPageExtension27ArcadeWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20ProductPageExtension27ArcadeWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension27ArcadeWelcomeViewController_lifecycleObserver);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27ArcadeWelcomeViewController_pageView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension27ArcadeWelcomeViewController_overlayViewController);
}

@end