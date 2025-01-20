@interface HealthSharingInternalSettingsViewController
- (_TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController)initWithCollectionViewLayout:(id)a3;
- (void)dismissView;
- (void)viewDidLoad;
@end

@implementation HealthSharingInternalSettingsViewController

- (_TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HealthSharingInternalSettingsViewController();
  id v2 = v6.receiver;
  [(CompoundDataSourceCollectionViewController *)&v6 viewDidLoad];
  id v3 = objc_allocWithZone(MEMORY[0x1E4FB14A8]);
  id v4 = objc_msgSend(v3, sel_initWithBarButtonSystemItem_target_action_, 0, v2, sel_dismissView, v6.receiver, v6.super_class);
  id v5 = objc_msgSend(v2, sel_navigationItem);
  objc_msgSend(v5, sel_setRightBarButtonItem_, v4);
}

- (void)dismissView
{
}

- (_TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI43HealthSharingInternalSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end