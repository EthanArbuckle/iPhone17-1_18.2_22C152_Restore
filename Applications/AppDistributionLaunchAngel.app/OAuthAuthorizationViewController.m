@interface OAuthAuthorizationViewController
- (_TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController)initWithCoder:(id)a3;
- (_TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation OAuthAuthorizationViewController

- (_TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController)initWithCoder:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  v5 = (_TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController *)sub_10003EE90();
  swift_release();
  return v5;
}

- (int64_t)preferredStatusBarStyle
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  swift_release();
  swift_release();
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for OAuthAuthorizationViewController();
  [(OAuthAuthorizationViewController *)&v8 viewWillAppear:v3];
  id v6 = [self blackColor];
  id v7 = [v6 colorWithAlphaComponent:0.8];

  sub_10003E260(v7);
  swift_release();

  swift_release();
}

- (void)viewDidAppear:(BOOL)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = self;
  sub_10003D300(a3);
  swift_release();
}

- (_TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a4;
  result = (_TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000AF7C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_sheetContext;
  uint64_t v4 = type metadata accessor for OAuthAuthorizationContext();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  id v6 = self;
  sub_10003EF74();
  objc_super v8 = v7;
  swift_release();

  return v8;
}

@end