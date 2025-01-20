@interface AppEventDetailPageViewController
- (BOOL)accessibilityPerformEscape;
- (NSArray)keyCommands;
- (_TtC18ASMessagesProvider32AppEventDetailPageViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider32AppEventDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
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

- (_TtC18ASMessagesProvider32AppEventDetailPageViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18ASMessagesProvider32AppEventDetailPageViewController_isCollapsing) = 0;
  id v4 = a3;

  result = (_TtC18ASMessagesProvider32AppEventDetailPageViewController *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_76D8C0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9.receiver = self;
  v9.super_class = ObjectType;
  v8 = self;
  [(AppEventDetailPageViewController *)&v9 viewDidLoad];
  sub_FB9C((Class *)((char *)&v8->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider32AppEventDetailPageViewController_lifecycleObserver), *(void *)&v8->lifecycleObserver[OBJC_IVAR____TtC18ASMessagesProvider32AppEventDetailPageViewController_lifecycleObserver+ 16]);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for StoreViewControllerLifecycleEvent.didLoad(_:), v4);
  sub_76D8D0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_76F1E0();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_3BEDB4(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_3BF054(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_3BF37C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_3BF748(a3);
}

- (void)as_viewWillBecomeFullyVisible
{
  v2 = self;
  sub_3BFFE4((SEL *)&selRef_as_viewWillBecomeFullyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.willAppear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.resumeAutoPlayVideo());
}

- (void)as_viewDidBecomeFullyVisible
{
  v2 = self;
  sub_3BFBC8();
}

- (void)as_viewWillBecomePartiallyVisible
{
  v2 = self;
  sub_3BFDC8();
}

- (void)as_viewDidBecomePartiallyVisible
{
  v2 = self;
  sub_3BFFE4((SEL *)&selRef_as_viewDidBecomePartiallyVisible, (unsigned int *)&enum case for StoreViewControllerLifecycleEvent.didDisappear(_:), (void (*)(uint64_t))&dispatch thunk of VideoPlaybackCoordinator.pauseAutoPlayVideo());
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_3C01E4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_3C0368(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(AppEventDetailPageViewController *)v2 traitCollection];
  uint64_t v4 = (char *)[v3 userInterfaceIdiom];

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
  sub_3C0610();
}

- (void)appExitedWhileAppeared
{
  uint64_t v3 = sub_76D8C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_FB9C((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider32AppEventDetailPageViewController_lifecycleObserver), *(void *)&self->lifecycleObserver[OBJC_IVAR____TtC18ASMessagesProvider32AppEventDetailPageViewController_lifecycleObserver+ 16]);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for StoreViewControllerLifecycleEvent.appExitedWhileAppeared(_:), v3);
  v7 = self;
  sub_76D8D0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (uint64_t)closeButtonPressed:(uint64_t)a3
{
  uint64_t v5 = sub_76D8C0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v9 = a1;
    swift_unknownObjectRetain();
    sub_77E7F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    id v10 = a1;
  }
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v5);
  sub_76D690();
  sub_3C2254(&qword_964F68, 255, (void (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter);
  sub_773980();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  [a1 dismissViewControllerAnimated:1 completion:0];

  return sub_14C88((uint64_t)v12, (uint64_t *)&unk_951B40);
}

- (void)lockupTapGestureRecognized:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_77E7F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_3C0A9C();

  sub_14C88((uint64_t)v6, (uint64_t *)&unk_951B40);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3 = sub_76D8C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v4 + 104))(v7, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v3, v5);
  sub_76D690();
  sub_3C2254(&qword_964F68, 255, (void (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter);
  uint64_t v8 = self;
  sub_773980();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  [(AppEventDetailPageViewController *)v8 dismissViewControllerAnimated:1 completion:0];

  return 1;
}

- (NSArray)keyCommands
{
  v2 = self;
  unint64_t v3 = sub_C0214();

  if (v3)
  {
    sub_FE2C(0, (unint64_t *)&qword_951CB0);
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
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v6 + 104))(v9, enum case for StoreViewControllerLifecycleEvent.dismissedByBackButton(_:), v5, v7);
  sub_76D690();
  sub_3C2254(&qword_964F68, 255, (void (*)(uint64_t))&type metadata accessor for AppEventDetailPagePresenter);
  id v10 = a3;
  v11 = self;
  sub_773980();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  [(AppEventDetailPageViewController *)v11 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC18ASMessagesProvider32AppEventDetailPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider32AppEventDetailPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider32AppEventDetailPageViewController_lifecycleObserver);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32AppEventDetailPageViewController_pageView));
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider32AppEventDetailPageViewController_containerTransitioningDelegate);
}

@end