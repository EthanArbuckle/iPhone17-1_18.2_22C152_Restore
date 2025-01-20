@interface AppPromotionDetailPageViewController
- (BOOL)accessibilityPerformEscape;
- (NSArray)keyCommands;
- (_TtC18ASMessagesProvider36AppPromotionDetailPageViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider36AppPromotionDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC18ASMessagesProvider36AppPromotionDetailPageViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider36AppPromotionDetailPageViewController_isCollapsing) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider36AppPromotionDetailPageViewController_learnMoreActionMetrics;
  uint64_t v6 = sub_77CB80();
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v5, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC18ASMessagesProvider36AppPromotionDetailPageViewController_backButtonActionMetrics, 1, 1, v6);
  v7((char *)self + OBJC_IVAR____TtC18ASMessagesProvider36AppPromotionDetailPageViewController_closeButtonActionMetrics, 1, 1, v6);
  id v8 = a3;

  result = (_TtC18ASMessagesProvider36AppPromotionDetailPageViewController *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_A33BC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_A3588(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_A3830(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_A3B58(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_A3F24(a3);
}

- (void)as_viewWillBecomeFullyVisible
{
  v2 = self;
  sub_A469C((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo());
}

- (void)as_viewDidBecomeFullyVisible
{
  v2 = self;
  sub_A4280();
}

- (void)as_viewWillBecomePartiallyVisible
{
  v2 = self;
  sub_A4480();
}

- (void)as_viewDidBecomePartiallyVisible
{
  v2 = self;
  sub_A469C((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo());
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_A489C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_A4A20(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(AppPromotionDetailPageViewController *)v2 traitCollection];
  v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&def_270DE0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)appEnteredWhileAppeared
{
  v2 = self;
  sub_A4CC8();
}

- (void)appExitedWhileAppeared
{
  uint64_t v3 = sub_76D8C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_FB9C((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider36AppPromotionDetailPageViewController_lifecycleObserver), *(void *)&self->lifecycleObserver[OBJC_IVAR____TtC18ASMessagesProvider36AppPromotionDetailPageViewController_lifecycleObserver+ 16]);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:), v3);
  v7 = self;
  sub_76D8D0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3 = sub_76D8C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v4 + 104))(v7, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v3, v5);
  sub_76D730();
  sub_A7AA8(&qword_954788, (void (*)(uint64_t))&type metadata accessor for AppPromotionDetailPagePresenter);
  uint64_t v8 = self;
  sub_773980();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  [(AppPromotionDetailPageViewController *)v8 dismissViewControllerAnimated:1 completion:0];

  return 1;
}

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = sub_A61B4();

  if (v3)
  {
    sub_A7A68();
    v4.super.isa = sub_77D880().super.isa;
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
  uint64_t v5 = sub_76D8C0();
  uint64_t v6 = *(void *)(v5 - 8);
  __n128 v7 = __chkstk_darwin(v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v6 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), v5, v7);
  sub_76D730();
  sub_A7AA8(&qword_954788, (void (*)(uint64_t))&type metadata accessor for AppPromotionDetailPagePresenter);
  id v10 = a3;
  v11 = self;
  sub_773980();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  [(AppPromotionDetailPageViewController *)v11 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC18ASMessagesProvider36AppPromotionDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider36AppPromotionDetailPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36AppPromotionDetailPageViewController_detailPageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36AppPromotionDetailPageViewController_containerTransitioningDelegate));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider36AppPromotionDetailPageViewController_learnMoreActionMetrics, &qword_954778);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider36AppPromotionDetailPageViewController_backButtonActionMetrics, &qword_954778);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider36AppPromotionDetailPageViewController_closeButtonActionMetrics, &qword_954778);
}

@end