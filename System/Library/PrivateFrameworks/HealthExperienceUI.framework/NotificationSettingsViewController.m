@interface NotificationSettingsViewController
- (_TtC18HealthExperienceUI34NotificationSettingsViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI34NotificationSettingsViewController)initWithCollectionViewLayout:(id)a3;
- (void)dismissProfile:(id)a3;
- (void)viewDidLoad;
@end

@implementation NotificationSettingsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD2F020C();
}

- (_TtC18HealthExperienceUI34NotificationSettingsViewController)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC18HealthExperienceUI34NotificationSettingsViewController_viewControllerTitle;
  uint64_t v5 = qword_1EB732818;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v7 = (uint64_t *)((char *)self + v4);
  uint64_t *v7 = sub_1AD73A1D0();
  v7[1] = v8;

  result = (_TtC18HealthExperienceUI34NotificationSettingsViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)dismissProfile:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  uint64_t v5 = (_TtC18HealthExperienceUI34NotificationSettingsViewController *)[(NotificationSettingsViewController *)v4 navigationController];
  if (v5)
  {
    id v6 = v5;
    [(NotificationSettingsViewController *)v5 dismissViewControllerAnimated:1 completion:0];

    uint64_t v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

- (_TtC18HealthExperienceUI34NotificationSettingsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI34NotificationSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end