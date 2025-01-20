@interface ApprovedDevelopersController
- (_TtC23AppInstallationSettings28ApprovedDevelopersController)initWithCoder:(id)a3;
- (_TtC23AppInstallationSettings28ApprovedDevelopersController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)appWillEnterForeground;
- (void)distributorsOrDevelopersChanged:(id)a3;
- (void)getSupport;
- (void)removeDeveloper;
- (void)viewApprovedAppPageWithSpecifier:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ApprovedDevelopersController

- (_TtC23AppInstallationSettings28ApprovedDevelopersController)initWithCoder:(id)a3
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = (char *)self + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper;
  uint64_t v6 = sub_1C210();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(_TtC23AppInstallationSettings28ApprovedDevelopersController *)((char *)self
                                                                 + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_installedApps) = (_TtC23AppInstallationSettings28ApprovedDevelopersController)&_swiftEmptyArrayStorage;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ApprovedDevelopersController();
  v7 = [(ApprovedDevelopersController *)&v9 initWithCoder:a3];
  swift_release();
  return v7;
}

- (void)viewDidLoad
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = self;
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for ApprovedDevelopersController();
  [(ApprovedDevelopersController *)&v6 viewWillAppear:v3];
  sub_39C0();
  swift_release();

  swift_release();
}

- (void)getSupport
{
}

- (void)removeDeveloper
{
}

- (void)viewApprovedAppPageWithSpecifier:(id)a3
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  objc_super v6 = self;
  sub_88C8(a3);
  swift_release();
}

- (void)appWillEnterForeground
{
  v2 = self;
  sub_8D60();
}

- (void)distributorsOrDevelopersChanged:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_9DE8((uint64_t)&unk_20BA8, (uint64_t)sub_A064, (uint64_t)&unk_20BC0);
}

- (_TtC23AppInstallationSettings28ApprovedDevelopersController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a4;
  result = (_TtC23AppInstallationSettings28ApprovedDevelopersController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_A098((uint64_t)self + OBJC_IVAR____TtC23AppInstallationSettings28ApprovedDevelopersController_approvedDeveloper, &qword_24D78);

  swift_bridgeObjectRelease();
}

@end