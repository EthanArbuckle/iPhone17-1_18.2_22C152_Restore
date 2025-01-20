@interface HDMCExperienceModelManager
- (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager)init;
- (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager)initWithNotificationProvider:(id)a3;
- (void)dealloc;
- (void)didReceiveExperienceModelUpdateNotification;
- (void)registerWithObserver:(id)a3;
- (void)removeWithObserver:(id)a3;
@end

@implementation HDMCExperienceModelManager

- (void)registerWithObserver:(id)a3
{
}

- (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager)initWithNotificationProvider:(id)a3
{
  return (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *)HDMCExperienceModelManager.init(notificationProvider:)(a3);
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_notificationProvider);
  v3 = self;
  objc_msgSend(v2, sel_removeObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for HDMCExperienceModelManager();
  [(HDMCExperienceModelManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_observers));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_notificationProvider));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager_queue);
}

- (void)didReceiveExperienceModelUpdateNotification
{
  v2 = self;
  sub_225799720();
}

- (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager)init
{
  result = (_TtC27HealthMenstrualCyclesDaemon26HDMCExperienceModelManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)removeWithObserver:(id)a3
{
}

@end