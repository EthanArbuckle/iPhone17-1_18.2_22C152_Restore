@interface LicenseResolutionViewController
- (_TtC26AppDistributionLaunchAngel31LicenseResolutionViewController)initWithCoder:(id)a3;
- (_TtC26AppDistributionLaunchAngel31LicenseResolutionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)safariViewControllerDidFinish:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation LicenseResolutionViewController

- (_TtC26AppDistributionLaunchAngel31LicenseResolutionViewController)initWithCoder:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  v5 = (_TtC26AppDistributionLaunchAngel31LicenseResolutionViewController *)sub_10000A854();
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
  int v4 = *((unsigned __int8 *)&v3->super.super.super.isa
       + OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_isIPad);
  swift_release();

  swift_release();
  return ~v4 & 1;
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
  v8.super_class = (Class)type metadata accessor for LicenseResolutionViewController();
  [(LicenseResolutionViewController *)&v8 viewWillAppear:v3];
  id v6 = [self blackColor];
  id v7 = [v6 colorWithAlphaComponent:0.8];

  sub_100009AF8(v7);
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
  sub_1000093FC(a3);
  swift_release();
}

- (_TtC26AppDistributionLaunchAngel31LicenseResolutionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a4;
  result = (_TtC26AppDistributionLaunchAngel31LicenseResolutionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000AF7C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_sheetContext;
  uint64_t v4 = type metadata accessor for LicenseResolutionContext();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10000A978();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  id v6 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100009D40();
  swift_release();

  swift_release();
}

@end