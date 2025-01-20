@interface NoDataViewController
- (_TtC15HealthRecordsUI20NoDataViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI20NoDataViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15HealthRecordsUI20NoDataViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation NoDataViewController

- (_TtC15HealthRecordsUI20NoDataViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_accountUpgradeTile) = 0;
  id v4 = a3;

  result = (_TtC15HealthRecordsUI20NoDataViewController *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C2372068();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = sub_1C2372930();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1C254CD90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C254CD40();
  v10 = *(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_accountUpgradeTile);
  if (v10)
  {
    id v11 = a3;
    v12 = self;
    id v13 = v10;
  }
  else
  {
    id v14 = objc_allocWithZone(MEMORY[0x1E4FB1D08]);
    id v15 = a3;
    v16 = self;
    id v13 = objc_msgSend(v14, sel_init);
  }
  id v17 = v10;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (_TtC15HealthRecordsUI20NoDataViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC15HealthRecordsUI20NoDataViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI20NoDataViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15HealthRecordsUI20NoDataViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_profile));
  sub_1C2201B28(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(void **)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super._view + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super._tabBarItem+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super._tab + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(uint64_t *)((char *)&self->super.super._tabElement+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category), *(void **)((char *)&self->super.super._navigationItem+ OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_category));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI20NoDataViewController_accountUpgradeTile);
}

@end