@interface CellularLimitsController
- (_TtC23AppInstallationSettings24CellularLimitsController)initWithCoder:(id)a3;
- (_TtC23AppInstallationSettings24CellularLimitsController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)appWillEnterForeground;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CellularLimitsController

- (_TtC23AppInstallationSettings24CellularLimitsController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    sub_1C3B0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = (_TtC23AppInstallationSettings24CellularLimitsController *)sub_17F60((uint64_t)a4, v7, a4);
  swift_release();
  return v8;
}

- (_TtC23AppInstallationSettings24CellularLimitsController)initWithCoder:(id)a3
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v4 = (_TtC23AppInstallationSettings24CellularLimitsController *)sub_18228(a3);
  swift_release();
  return v4;
}

- (void)viewDidLoad
{
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_18438();

  swift_release();
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
  v6.super_class = (Class)type metadata accessor for CellularLimitsController();
  [(CellularLimitsController *)&v6 viewWillAppear:v3];
  sub_18AE4();
  swift_release();

  swift_release();
}

- (void)appWillEnterForeground
{
  v2 = self;
  sub_18774();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C140();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C4D0();
  sub_1C4C0();
  sub_1C480();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1C130();
  id v11 = a3;
  v12 = self;
  sub_19810((uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL v3 = &self->PSListController_opaque[OBJC_IVAR____TtC23AppInstallationSettings24CellularLimitsController_cellularSettings];
  uint64_t v4 = sub_1C280();
  v5 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end