@interface InstallConfirmationViewController
- (_TtC26AppDistributionLaunchAngel33InstallConfirmationViewController)initWithCoder:(id)a3;
- (_TtC26AppDistributionLaunchAngel33InstallConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation InstallConfirmationViewController

- (_TtC26AppDistributionLaunchAngel33InstallConfirmationViewController)initWithCoder:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  v5 = (_TtC26AppDistributionLaunchAngel33InstallConfirmationViewController *)sub_10005839C();
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
  sub_100053948(a3);
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
       + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_isIPad);
  swift_release();

  swift_release();
  return ~v4 & 1;
}

- (_TtC26AppDistributionLaunchAngel33InstallConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a4;
  result = (_TtC26AppDistributionLaunchAngel33InstallConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000AF7C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_responseAction));
  sub_1000584E4((uint64_t)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_localizedContent, (uint64_t (*)(void))type metadata accessor for LocalizedInstallSheetContent);
  v3 = (char *)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics;

  sub_100058290((uint64_t)v3);
}

@end