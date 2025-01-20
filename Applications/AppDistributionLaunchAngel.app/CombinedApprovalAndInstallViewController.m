@interface CombinedApprovalAndInstallViewController
- (_TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController)initWithCoder:(id)a3;
- (_TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CombinedApprovalAndInstallViewController

- (_TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController)initWithCoder:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  v5 = (_TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController *)sub_10001A2AC();
  swift_release();
  return v5;
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
  sub_100018978(a3);

  swift_release();
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
  int v4 = *((unsigned __int8 *)&v3->super.super.super.isa
       + OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_isIPad);
  swift_release();

  swift_release();
  return ~v4 & 1;
}

- (_TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a4;
  result = (_TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000AF7C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_dismissAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_childViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_responseAction));
  v3 = (char *)self
     + OBJC_IVAR____TtC26AppDistributionLaunchAngel40CombinedApprovalAndInstallViewController_localizedContent;

  sub_10001A250((uint64_t)v3);
}

@end