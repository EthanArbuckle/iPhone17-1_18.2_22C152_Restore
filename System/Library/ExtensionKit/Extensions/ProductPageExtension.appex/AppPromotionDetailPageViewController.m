@interface AppPromotionDetailPageViewController
- (BOOL)accessibilityPerformEscape;
- (NSArray)keyCommands;
- (_TtC20ProductPageExtension36AppPromotionDetailPageViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension36AppPromotionDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)as_viewDidBecomeFullyVisible;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)as_viewWillBecomePartiallyVisible;
- (void)handleDismissKeyCommandWithCommand:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AppPromotionDetailPageViewController

- (_TtC20ProductPageExtension36AppPromotionDetailPageViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_isCollapsing) = 0;
  v5 = (char *)self
     + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_learnMoreActionMetrics;
  uint64_t v6 = sub_10077B1B0();
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_backButtonActionMetrics, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_closeButtonActionMetrics, 1, 1, v6);
  id v8 = a3;

  result = (_TtC20ProductPageExtension36AppPromotionDetailPageViewController *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003BE568();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1003BE734(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1003BE9DC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1003BED04(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1003BF0D0(a3);
}

- (void)as_viewWillBecomeFullyVisible
{
  v2 = self;
  sub_1003BF848((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo());
}

- (void)as_viewDidBecomeFullyVisible
{
  v2 = self;
  sub_1003BF42C();
}

- (void)as_viewWillBecomePartiallyVisible
{
  v2 = self;
  sub_1003BF62C();
}

- (void)as_viewDidBecomePartiallyVisible
{
  v2 = self;
  sub_1003BF848((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo());
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1003BFA48();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1003BFBCC(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(AppPromotionDetailPageViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)appEnteredWhileAppeared
{
  v2 = self;
  sub_1003BFE74();
}

- (void)appExitedWhileAppeared
{
  uint64_t v3 = sub_10076BD40();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FA3C((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_lifecycleObserver), *(void *)&self->lifecycleObserver[OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_lifecycleObserver+ 16]);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:), v3);
  v7 = self;
  sub_10076BD50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3 = sub_10076BD40();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v4 + 104))(v7, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v3, v5);
  sub_10076BBB0();
  sub_1003C2C54(&qword_10095EEF0, (void (*)(uint64_t))&type metadata accessor for AppPromotionDetailPagePresenter);
  uint64_t v8 = self;
  sub_100771ED0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  [(AppPromotionDetailPageViewController *)v8 dismissViewControllerAnimated:1 completion:0];

  return 1;
}

- (NSArray)keyCommands
{
  v2 = self;
  uint64_t v3 = sub_1003C1360();

  if (v3)
  {
    sub_1003C2C14();
    v4.super.isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)handleDismissKeyCommandWithCommand:(id)a3
{
  uint64_t v5 = sub_10076BD40();
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v7 = __chkstk_darwin(v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v6 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v5, v7);
  sub_10076BBB0();
  sub_1003C2C54(&qword_10095EEF0, (void (*)(uint64_t))&type metadata accessor for AppPromotionDetailPagePresenter);
  id v10 = a3;
  v11 = self;
  sub_100771ED0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  [(AppPromotionDetailPageViewController *)v11 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC20ProductPageExtension36AppPromotionDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20ProductPageExtension36AppPromotionDetailPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_detailPageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_containerTransitioningDelegate));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_learnMoreActionMetrics, &qword_10095EEE8);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_backButtonActionMetrics, &qword_10095EEE8);
  sub_10000FA80((uint64_t)self+ OBJC_IVAR____TtC20ProductPageExtension36AppPromotionDetailPageViewController_closeButtonActionMetrics, &qword_10095EEE8);
}

@end