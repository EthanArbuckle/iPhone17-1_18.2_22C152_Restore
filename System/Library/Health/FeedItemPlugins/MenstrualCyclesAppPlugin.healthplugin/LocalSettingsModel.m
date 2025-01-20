@interface LocalSettingsModel
- (_TtC24MenstrualCyclesAppPlugin18LocalSettingsModel)init;
- (void)settingsManagerDidUpdateNotificationSettings:(id)a3;
@end

@implementation LocalSettingsModel

- (_TtC24MenstrualCyclesAppPlugin18LocalSettingsModel)init
{
  return (_TtC24MenstrualCyclesAppPlugin18LocalSettingsModel *)sub_2413CC924();
}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  swift_getObjectType();
  sub_2413CCB3C();
  id v5 = a3;
  v6 = self;
  sub_24162FAC8();
  sub_24162FB68();

  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18LocalSettingsModel_settingsManager));
}

@end