@interface HUActivityLogSettingsModuleController
- (Class)cellClassForItem:(id)a3;
- (HUActivityLogSettingsModuleController)initWithModule:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
@end

@implementation HUActivityLogSettingsModuleController

- (HUActivityLogSettingsModuleController)initWithModule:(id)a3
{
  return (HUActivityLogSettingsModuleController *)ActivityLogSettingsModuleController.init(module:)(a3);
}

- (Class)cellClassForItem:(id)a3
{
  sub_1BE37E9E8(0, &qword_1EA115CF8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1BE4841B4(v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HUActivityLogSettingsModuleController_activityLogItemModule));
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUActivityLogSettingsModuleController_durationFormatter);
}

@end