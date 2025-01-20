@interface RTSettingsViewController
- (_TtC19CoreRoutineSettings24RTSettingsViewController)initWithCoder:(id)a3;
- (_TtC19CoreRoutineSettings24RTSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)setupSettingsMainView:(id)a3;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWasBackgrounded;
@end

@implementation RTSettingsViewController

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for RTSettingsViewController();
  [(RTSettingsViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_26DC((uint64_t)self + OBJC_IVAR____TtC19CoreRoutineSettings24RTSettingsViewController_sessionStartDate);

  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2780();
}

- (id)setupSettingsMainView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_8204((uint64_t)&v9);
  id v6 = objc_allocWithZone((Class)sub_273C(&qword_217E8));
  v7 = (void *)sub_15400();

  return v7;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3 = *(void (**)(void))((char *)&stru_68.reloff + (swift_isaMask & (uint64_t)self->super.super.super.isa));
  id v4 = self;
  v3();
}

- (void)viewDidAppear:(BOOL)a3
{
  v3 = *(void (**)(void))((char *)&stru_68.offset + (swift_isaMask & (uint64_t)self->super.super.super.isa));
  id v4 = self;
  v3();
}

- (void)viewWasBackgrounded
{
  id v6 = self;
  id v2 = [(RTSettingsViewController *)v6 navigationController];
  if (v2)
  {
    v3 = v2;
    id v4 = (_TtC19CoreRoutineSettings24RTSettingsViewController *)[v2 popViewControllerAnimated:0];

    id v5 = v4;
  }
  else
  {
    id v5 = v6;
  }
}

- (_TtC19CoreRoutineSettings24RTSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_15760();
    id v6 = (char *)self + OBJC_IVAR____TtC19CoreRoutineSettings24RTSettingsViewController_sessionStartDate;
    uint64_t v7 = sub_15230();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
    v8 = (id (**)())((char *)self
                   + OBJC_IVAR____TtC19CoreRoutineSettings24RTSettingsViewController_canBeShownFromSuspendedState);
    *v8 = sub_23C4;
    v8[1] = 0;
    id v9 = a4;
    NSString v10 = sub_15740();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = (char *)self + OBJC_IVAR____TtC19CoreRoutineSettings24RTSettingsViewController_sessionStartDate;
    uint64_t v12 = sub_15230();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
    v13 = (id (**)())((char *)self
                    + OBJC_IVAR____TtC19CoreRoutineSettings24RTSettingsViewController_canBeShownFromSuspendedState);
    *v13 = sub_23C4;
    v13[1] = 0;
    id v14 = a4;
    NSString v10 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for RTSettingsViewController();
  v15 = [(RTSettingsViewController *)&v17 initWithNibName:v10 bundle:a4];

  return v15;
}

- (_TtC19CoreRoutineSettings24RTSettingsViewController)initWithCoder:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC19CoreRoutineSettings24RTSettingsViewController_sessionStartDate;
  uint64_t v6 = sub_15230();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = (id (**)())((char *)self
                 + OBJC_IVAR____TtC19CoreRoutineSettings24RTSettingsViewController_canBeShownFromSuspendedState);
  void *v7 = sub_23C4;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RTSettingsViewController();
  return [(RTSettingsViewController *)&v9 initWithCoder:a3];
}

@end