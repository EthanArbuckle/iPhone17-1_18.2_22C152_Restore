@interface AllAlertsViewController
- (_TtC18HealthExperienceUIP33_769EF482A8E949D5E185D49C9A04EEB923AllAlertsViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUIP33_769EF482A8E949D5E185D49C9A04EEB923AllAlertsViewController)initWithCollectionViewLayout:(id)a3;
- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AllAlertsViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(CompoundDataSourceCollectionViewController *)&v5 viewDidLoad];
  uint64_t v3 = sub_1AD219708();
  swift_beginAccess();
  id v4 = *(id *)(v3 + 16);
  swift_release();
  objc_msgSend(v4, sel_registerObserver_, v2);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(CompoundDataSourceCollectionViewController *)&v5 viewDidAppear:v3];
  sub_1AD3F921C();
}

- (void)snapshotDidChangeWithDataSourceID:(id)a3 snapshot:(id)a4 animated:(BOOL)a5
{
  sub_1AD20E2C8();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  v13 = (char *)&v18 - v12;
  sub_1AD73D2B0();
  v14 = self;
  uint64_t v15 = sub_1AD219708() + OBJC_IVAR____TtC18HealthExperienceUI27CompoundSectionedDataSource_snapshot;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v15, v7);
  swift_release();
  uint64_t v16 = sub_1AD73D1B0();
  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v11, v7);
  if (!v16) {
    [(AllAlertsViewController *)v14 dismissViewControllerAnimated:1 completion:0];
  }

  v17(v13, v7);
}

- (_TtC18HealthExperienceUIP33_769EF482A8E949D5E185D49C9A04EEB923AllAlertsViewController)initWithCollectionViewLayout:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_769EF482A8E949D5E185D49C9A04EEB923AllAlertsViewController_cancellable) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CompoundDataSourceCollectionViewController *)&v7 initWithCollectionViewLayout:a3];
}

- (_TtC18HealthExperienceUIP33_769EF482A8E949D5E185D49C9A04EEB923AllAlertsViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_769EF482A8E949D5E185D49C9A04EEB923AllAlertsViewController_cancellable) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CompoundDataSourceCollectionViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end