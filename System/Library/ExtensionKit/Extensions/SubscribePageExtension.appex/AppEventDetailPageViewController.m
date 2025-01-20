@interface AppEventDetailPageViewController
- (BOOL)accessibilityPerformEscape;
- (NSArray)keyCommands;
- (_TtC22SubscribePageExtension32AppEventDetailPageViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension32AppEventDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)closeButtonPressed:(uint64_t)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)as_viewDidBecomeFullyVisible;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)as_viewWillBecomePartiallyVisible;
- (void)handleDismissKeyCommandWithCommand:(id)a3;
- (void)lockupTapGestureRecognized:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AppEventDetailPageViewController

- (_TtC22SubscribePageExtension32AppEventDetailPageViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension32AppEventDetailPageViewController_isCollapsing) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension32AppEventDetailPageViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_100757950();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10.receiver = self;
  v10.super_class = ObjectType;
  v9 = self;
  [(AppEventDetailPageViewController *)&v10 viewDidLoad];
  sub_10000FE94((Class *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension32AppEventDetailPageViewController_lifecycleObserver), *(void *)&v9->lifecycleObserver[OBJC_IVAR____TtC22SubscribePageExtension32AppEventDetailPageViewController_lifecycleObserver+ 16]);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for StoreViewControllerLifecycleEvent.didLoad(_:), v4);
  sub_100757960();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  sub_100759240();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10024F5D8(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10024F878(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10024FBA0(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10024FF6C(a3);
}

- (void)as_viewWillBecomeFullyVisible
{
  v2 = self;
  sub_100250808((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo());
}

- (void)as_viewDidBecomeFullyVisible
{
  v2 = self;
  sub_1002503EC();
}

- (void)as_viewWillBecomePartiallyVisible
{
  v2 = self;
  sub_1002505EC();
}

- (void)as_viewDidBecomePartiallyVisible
{
  v2 = self;
  sub_100250808((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo());
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100250A08();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100250B8C(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(AppEventDetailPageViewController *)v2 traitCollection];
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
  sub_100250E34();
}

- (void)appExitedWhileAppeared
{
  uint64_t v3 = sub_100757950();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FE94((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension32AppEventDetailPageViewController_lifecycleObserver), *(void *)&self->lifecycleObserver[OBJC_IVAR____TtC22SubscribePageExtension32AppEventDetailPageViewController_lifecycleObserver+ 16]);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:), v3);
  v8 = self;
  sub_100757960();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (uint64_t)closeButtonPressed:(uint64_t)a3
{
  uint64_t v5 = sub_100757950();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v10 = a1;
    swift_unknownObjectRetain();
    sub_100768710();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    id v11 = a1;
  }
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v5);
  sub_100757720();
  sub_100252A78(&qword_100940490, 255, (void (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter);
  sub_10075D950();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  [a1 dismissViewControllerAnimated:1 completion:0];

  return sub_10000FED8((uint64_t)v13, &qword_1009360F0);
}

- (void)lockupTapGestureRecognized:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_100768710();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_1002512C0();

  sub_10000FED8((uint64_t)v6, &qword_1009360F0);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3 = sub_100757950();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v6 = __chkstk_darwin(v3, v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v4 + 104))(v8, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v3, v6);
  sub_100757720();
  sub_100252A78(&qword_100940490, 255, (void (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter);
  uint64_t v9 = self;
  sub_10075D950();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
  [(AppEventDetailPageViewController *)v9 dismissViewControllerAnimated:1 completion:0];

  return 1;
}

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = sub_1000CBFD8();

  if (v3)
  {
    sub_10001A860(0, (unint64_t *)&qword_100934370);
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
  id v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v6 + 104))(v10, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v5, v8);
  sub_100757720();
  sub_100252A78(&qword_100940490, 255, (void (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter);
  id v11 = a3;
  v12 = self;
  sub_10075D950();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  [(AppEventDetailPageViewController *)v12 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC22SubscribePageExtension32AppEventDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension32AppEventDetailPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32AppEventDetailPageViewController_lifecycleObserver);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32AppEventDetailPageViewController_pageView));
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension32AppEventDetailPageViewController_containerTransitioningDelegate);
}

@end