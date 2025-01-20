@interface DashboardContentViewController
- (BOOL)canBecomeFirstResponder;
- (UINavigationController)navigationController;
- (_TtC13GameOverlayUI30DashboardContentViewController)initWithCoder:(id)a3;
- (_TtC13GameOverlayUI30DashboardContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dashboardDidChangeToLeaderboardIdentifier:(id)a3;
- (void)dashboardDidChangeToLeaderboardPlayerScope:(int64_t)a3;
- (void)dashboardDidChangeToLeaderboardTimeScope:(int64_t)a3;
- (void)dashboardDidChangeToViewState:(int64_t)a3;
- (void)dismissNotificationCallback:(id)a3;
- (void)dismissWithGameController;
- (void)donePressed:(id)a3;
- (void)finish;
- (void)finishAndPlayChallenge:(id)a3;
- (void)finishWithTurnBasedMatch:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)quitTurnBasedMatch:(id)a3;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)scrollToTopPressed:(id)a3;
- (void)setToDarkBackground;
- (void)setToLightBackground;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DashboardContentViewController

- (_TtC13GameOverlayUI30DashboardContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000BFC3C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000BBCC4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000BC080(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1000BC474();
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                           + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController__navigationController));
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1000BC69C(a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DashboardContentViewController();
  v4 = (char *)v6.receiver;
  [(DashboardContentViewController *)&v6 viewDidDisappear:v3];
  sub_1000BE05C((unint64_t)_swiftEmptyArrayStorage, 0);
  v5 = *(void **)&v4[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_contentViewController];
  *(void *)&v4[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_contentViewController] = 0;

  [*(id *)&v4[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_daemonProxy] setDataUpdateDelegate:0 v6.receiver, v6.super_class];
}

- (void)dismissNotificationCallback:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000BFD88();
}

- (void)scrollToTopPressed:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1000BE5C0();

  sub_100017388((uint64_t)v6, &qword_100142A70);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DashboardContentViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DashboardContentViewController *)&v6 traitCollectionDidChange:v4];
  sub_1000BE864();
}

- (void)donePressed:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  objc_super v6 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler);
  if (v6)
  {
    uint64_t v7 = swift_retain();
    v6(v7);
    sub_100039104((uint64_t)v6);
  }

  sub_100017388((uint64_t)v8, &qword_100142A70);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1000BFFE0(v8);
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  objc_super v6 = self;
  sub_1000BEE00(v4);

  swift_bridgeObjectRelease();
}

- (void)finish
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler);
  if (v2)
  {
    uint64_t v4 = self;
    uint64_t v3 = sub_100026018((uint64_t)v2);
    v2(v3);
    sub_100039104((uint64_t)v2);
  }
}

- (void)finishAndPlayChallenge:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000BF150(v4);
}

- (void)finishWithTurnBasedMatch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000BF220(v4);
}

- (void)quitTurnBasedMatch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000BF2F0(v4);
}

- (void)dashboardDidChangeToViewState:(int64_t)a3
{
}

- (void)dashboardDidChangeToLeaderboardTimeScope:(int64_t)a3
{
}

- (void)dashboardDidChangeToLeaderboardPlayerScope:(int64_t)a3
{
}

- (void)dashboardDidChangeToLeaderboardIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  id v7 = self;
  sub_1000BF6D4(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)dismissWithGameController
{
  v2 = self;
  sub_1000BF7EC();
}

- (void)setToLightBackground
{
}

- (void)setToDarkBackground
{
}

- (_TtC13GameOverlayUI30DashboardContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13GameOverlayUI30DashboardContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100039104(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController__navigationController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_effectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_daemonProxy));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_request));
  sub_1000C0130((uint64_t)self + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_remoteTarget);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end