@interface CompanionAutoLaunchSettingsViewController
- (_TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController)initWithCoder:(id)a3;
- (_TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController)initWithConfiguration:(id)a3;
- (_TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation CompanionAutoLaunchSettingsViewController

- (_TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController)initWithConfiguration:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_iconFetcher;
  id v6 = objc_allocWithZone((Class)CSLPRFIconFetcher);
  id v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  v9 = v7;
  uint64_t v10 = sub_1B41C(v9);
  v11 = (uint64_t *)((char *)v8
                  + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model);
  uint64_t *v11 = v10;
  v11[1] = v12;
  v11[2] = v13;

  v16.receiver = v8;
  v16.super_class = (Class)type metadata accessor for CompanionAutoLaunchSettingsViewController();
  v14 = [(CompanionAutoLaunchSettingsViewController *)&v16 initWithNibName:0 bundle:0];

  return v14;
}

- (_TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_iconFetcher;
  id v6 = objc_allocWithZone((Class)CSLPRFIconFetcher);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController *)sub_282D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B7C0();
}

- (_TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_iconFetcher));
  v3 = (char *)self + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model;
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model);
  uint64_t v5 = *(void **)&self->iconFetcher[OBJC_IVAR____TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController_model];
  id v6 = (id)*((void *)v3 + 2);
}

@end