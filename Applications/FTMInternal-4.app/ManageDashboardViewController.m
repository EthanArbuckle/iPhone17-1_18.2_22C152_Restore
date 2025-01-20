@interface ManageDashboardViewController
- (_TtC13FTMInternal_429ManageDashboardViewController)initWithCoder:(id)a3;
- (_TtC13FTMInternal_429ManageDashboardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didTapDismissWithSender:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation ManageDashboardViewController

- (_TtC13FTMInternal_429ManageDashboardViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController____lazy_storage___tableView) = 0;
  uint64_t v4 = OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController_dismissButton;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_1001AE7C0();

  result = (_TtC13FTMInternal_429ManageDashboardViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001AE8F8();
}

- (_TtC13FTMInternal_429ManageDashboardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13FTMInternal_429ManageDashboardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController_persistanceStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController____lazy_storage___tableView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController_dismissButton);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = qword_1002D7A60;
  id v11 = a3;
  v12 = self;
  if (v10 != -1) {
    swift_once();
  }
  double v13 = *(double *)&qword_1002E3118;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = (char *)self + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController_dashboardList;
  swift_beginAccess();
  return *(void *)(*(void *)v4 + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  id v12 = sub_1001AF134(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  double v13 = self;
  sub_1001AF434(v12, a4, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)didTapDismissWithSender:(id)a3
{
  id v5 = objc_allocWithZone((Class)UIImpactFeedbackGenerator);
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = [v5 initWithStyle:1];
  [v8 impactOccurred];
  [(ManageDashboardViewController *)v7 dismissViewControllerAnimated:1 completion:0];
}

@end