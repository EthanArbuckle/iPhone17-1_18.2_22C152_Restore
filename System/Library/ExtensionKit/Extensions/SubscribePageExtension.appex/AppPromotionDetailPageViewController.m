@interface AppPromotionDetailPageViewController
- (BOOL)accessibilityPerformEscape;
- (NSArray)keyCommands;
- (_TtC22SubscribePageExtension36AppPromotionDetailPageViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension36AppPromotionDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC22SubscribePageExtension36AppPromotionDetailPageViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageViewController_isCollapsing) = 0;
  v5 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageViewController_learnMoreActionMetrics;
  uint64_t v6 = sub_100766B10();
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self+ OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageViewController_backButtonActionMetrics, 1, 1, v6);
  v7((char *)self+ OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageViewController_closeButtonActionMetrics, 1, 1, v6);
  id v8 = a3;

  result = (_TtC22SubscribePageExtension36AppPromotionDetailPageViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1004E44D0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1004E469C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1004E4944(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1004E4C6C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1004E5038(a3);
}

- (void)as_viewWillBecomeFullyVisible
{
  v2 = self;
  sub_1004E57B0((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo());
}

- (void)as_viewDidBecomeFullyVisible
{
  v2 = self;
  sub_1004E5394();
}

- (void)as_viewWillBecomePartiallyVisible
{
  v2 = self;
  sub_1004E5594();
}

- (void)as_viewDidBecomePartiallyVisible
{
  v2 = self;
  sub_1004E57B0((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo());
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1004E59B0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1004E5B34(a3);
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
  sub_1004E5DDC();
}

- (void)appExitedWhileAppeared
{
  uint64_t v3 = sub_100757950();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FE94((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageViewController_lifecycleObserver), *(void *)&self->lifecycleObserver[OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageViewController_lifecycleObserver+ 16]);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:), v3);
  id v8 = self;
  sub_100757960();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3 = sub_100757950();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v6 = __chkstk_darwin(v3, v5);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v4 + 104))(v8, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v3, v6);
  sub_1007577C0();
  sub_1004E8B54(&qword_10094CE18, (void (*)(uint64_t))&type metadata accessor for AppPromotionDetailPagePresenter);
  uint64_t v9 = self;
  sub_10075D950();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
  [(AppPromotionDetailPageViewController *)v9 dismissViewControllerAnimated:1 completion:0];

  return 1;
}

- (NSArray)keyCommands
{
  v2 = self;
  uint64_t v3 = sub_1004E72C8();

  if (v3)
  {
    sub_1004E8B14();
    v4.super.isa = sub_1007677F0().super.isa;
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
  uint64_t v5 = sub_100757950();
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v8 = __chkstk_darwin(v5, v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v6 + 104))(v10, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v5, v8);
  sub_1007577C0();
  sub_1004E8B54(&qword_10094CE18, (void (*)(uint64_t))&type metadata accessor for AppPromotionDetailPagePresenter);
  id v11 = a3;
  v12 = self;
  sub_10075D950();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  [(AppPromotionDetailPageViewController *)v12 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC22SubscribePageExtension36AppPromotionDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension36AppPromotionDetailPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageViewController_detailPageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageViewController_containerTransitioningDelegate));
  sub_10000FED8((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageViewController_learnMoreActionMetrics, &qword_1009443F8);
  sub_10000FED8((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageViewController_backButtonActionMetrics, &qword_1009443F8);
  sub_10000FED8((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension36AppPromotionDetailPageViewController_closeButtonActionMetrics, &qword_1009443F8);
}

@end