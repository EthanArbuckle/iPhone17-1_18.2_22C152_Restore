@interface SharedProfileNotificationSettingsManager
- (_TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager)init;
@end

@implementation SharedProfileNotificationSettingsManager

- (_TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager)init
{
  result = (_TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager_userDefaults));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager_notificationCenter));
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager__currentValues;
  sub_1AD1EBFB4(0, &qword_1EB732E90, (uint64_t (*)(uint64_t))sub_1AD1EA6BC, MEMORY[0x1E4F1AC70]);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end