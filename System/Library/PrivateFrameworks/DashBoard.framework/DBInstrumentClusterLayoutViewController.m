@interface DBInstrumentClusterLayoutViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9DashBoard39DBInstrumentClusterLayoutViewController)initWithCoder:(id)a3;
- (_TtC9DashBoard39DBInstrumentClusterLayoutViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9DashBoard39DBInstrumentClusterLayoutViewController)initWithThemeController:(id)a3 environment:(id)a4 displayID:(id)a5 error:(id *)a6;
- (void)dealloc;
- (void)didReceiveData:(id)a3;
- (void)didReset;
- (void)invalidate;
- (void)setActiveNavigatingApp:(id)a3;
- (void)setThemeData:(id)a3 error:(id *)a4;
- (void)thermalMonitorLevelDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DBInstrumentClusterLayoutViewController

- (_TtC9DashBoard39DBInstrumentClusterLayoutViewController)initWithThemeController:(id)a3 environment:(id)a4 displayID:(id)a5 error:(id *)a6
{
  uint64_t v9 = sub_22D85E4C8();
  unint64_t v11 = v10;
  v12 = (char *)a3;
  swift_unknownObjectRetain();
  return (_TtC9DashBoard39DBInstrumentClusterLayoutViewController *)DBInstrumentClusterLayoutViewController.init(themeController:environment:displayID:error:)(v12, a4, v9, v11, a6);
}

- (_TtC9DashBoard39DBInstrumentClusterLayoutViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v2 = self;
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v3, v2);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for DBInstrumentClusterLayoutViewController(0);
  [(DBInstrumentClusterLayoutViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_themeController));
  sub_22D7E1A44((uint64_t)self + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_environment);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_layoutCoordinator));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_uisyncSession));
  v3 = (char *)self + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_display;
  uint64_t v4 = sub_22D85DA28();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_thermalMonitor));
  swift_release();
  swift_release();
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_requestContentDebounceTime;
  uint64_t v6 = sub_22D85E858();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_layoutControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_layoutViewController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_theme);
}

- (void)viewDidLoad
{
  v2 = self;
  DBInstrumentClusterLayoutViewController.viewDidLoad()();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  DBInstrumentClusterLayoutViewController.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_268589C68);
  v3 = (void *)sub_22D85E5A8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DBInstrumentClusterLayoutViewController(0);
  uint64_t v4 = (char *)v6.receiver;
  [(DBInstrumentClusterLayoutViewController *)&v6 viewDidAppear:v3];
  sub_22D7C7EA8();
  sub_22D85D118();
  swift_release();
  v5 = *(void **)&v4[OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_layoutControl];
  if (v5) {
    objc_msgSend(v5, sel_becomeFirstResponder, v6.receiver, v6.super_class);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DBInstrumentClusterLayoutViewController(0);
  id v4 = v5.receiver;
  [(DBInstrumentClusterLayoutViewController *)&v5 viewDidDisappear:v3];
  sub_22D7C7EA8();
  sub_22D85D108();

  swift_release();
}

- (void)setActiveNavigatingApp:(id)a3
{
  sub_22D85E4C8();
  swift_beginAccess();
  id v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268589890);
  sub_22D7C4DCC(&qword_268589898, &qword_268589890);
  sub_22D7C4DCC(&qword_2685898A0, &qword_2685898A8);
  uint64_t v5 = sub_22D85E568();
  sub_22D7E6EA8(v5, (void (*)(uint64_t, uint64_t, id))sub_22D7E9660);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC9DashBoard39DBInstrumentClusterLayoutViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9DashBoard39DBInstrumentClusterLayoutViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)invalidate
{
  v2 = self;
  DBInstrumentClusterLayoutViewController.invalidate()();
}

- (void)thermalMonitorLevelDidChange:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_thermalMonitor);
  id v5 = a3;
  unint64_t v11 = self;
  id v6 = objc_msgSend(v4, sel_suggestedFrameRateLimit);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, sel_doubleValue);
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  unint64_t v10 = (char *)v11 + OBJC_IVAR____TtC9DashBoard39DBInstrumentClusterLayoutViewController_frameRateLimit;
  *(void *)unint64_t v10 = v9;
  v10[8] = v7 == 0;
}

- (void)didReset
{
  v2 = self;
  DBInstrumentClusterLayoutViewController.didReset()();
}

- (void)didReceiveData:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  uint64_t v5 = sub_22D85CCF8();
  unint64_t v7 = v6;

  DBInstrumentClusterLayoutViewController.didReceiveData(_:)(v5, v7);
  sub_22D7E8078(v5, v7);
}

- (void)setThemeData:(id)a3 error:(id *)a4
{
  sub_22D7E9754(0, &qword_26858A300);
  uint64_t v6 = sub_22D85E458();
  unint64_t v7 = self;
  DBInstrumentClusterLayoutViewController.setThemeData(_:)((Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();

  if (v8)
  {
    if (a4)
    {
      uint64_t v9 = (void *)sub_22D85CC18();

      id v10 = v9;
      *a4 = v9;
    }
    else
    {
    }
  }
  else if (a4)
  {
    id v11 = 0;
    *a4 = 0;
  }
}

@end