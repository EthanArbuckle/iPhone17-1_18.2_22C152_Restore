@interface DTTimer
- (BOOL)isEqual:(id)a3;
- (DTTimer)init;
- (DTTimer)initWithMTAlarm:(id)a3;
- (DTTimer)initWithMTAlarmID:(id)a3;
- (DTTimer)initWithMTTimer:(id)a3;
- (DTTimer)initWithMTTimerID:(id)a3;
- (MTAlarm)mtAlarm;
- (MTTimer)mtTimer;
- (NSString)description;
- (NSString)identifier;
- (NSString)mtAlarmID;
- (NSString)mtTimerID;
@end

@implementation DTTimer

- (MTAlarm)mtAlarm
{
  return (MTAlarm *)*(id *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtAlarm);
}

- (MTTimer)mtTimer
{
  return (MTTimer *)*(id *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtTimer);
}

- (DTTimer)initWithMTAlarm:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtAlarm) = (Class)a3;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtAlarmID);
  void *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtTimer) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtTimerID);
  void *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = (Class)DTTimer;
  id v5 = a3;
  return [(DTTimer *)&v7 init];
}

- (DTTimer)initWithMTAlarmID:(id)a3
{
  uint64_t v4 = sub_24CD75568();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtAlarm) = 0;
  id v5 = (uint64_t *)((char *)self + OBJC_IVAR___DTTimer__mtAlarmID);
  *id v5 = v4;
  v5[1] = v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtTimer) = 0;
  objc_super v7 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtTimerID);
  *objc_super v7 = 0;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = (Class)DTTimer;
  return [(DTTimer *)&v9 init];
}

- (DTTimer)initWithMTTimer:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtAlarm) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtAlarmID);
  void *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtTimer) = (Class)a3;
  uint64_t v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtTimerID);
  void *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = (Class)DTTimer;
  id v5 = a3;
  return [(DTTimer *)&v7 init];
}

- (DTTimer)initWithMTTimerID:(id)a3
{
  uint64_t v4 = sub_24CD75568();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtAlarm) = 0;
  id v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer__mtAlarmID);
  *id v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DTTimer_mtTimer) = 0;
  uint64_t v6 = (uint64_t *)((char *)self + OBJC_IVAR___DTTimer__mtTimerID);
  *uint64_t v6 = v4;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)DTTimer;
  return [(DTTimer *)&v9 init];
}

- (NSString)description
{
  return (NSString *)sub_24CD4EE30(self, (uint64_t)a2, (void (*)(void))DTTimer.description.getter);
}

- (NSString)identifier
{
  return (NSString *)sub_24CD4EE30(self, (uint64_t)a2, (void (*)(void))sub_24CD4EEA0);
}

- (NSString)mtAlarmID
{
  return (NSString *)sub_24CD4EFDC(self, (uint64_t)a2, (SEL *)&selRef_mtAlarm, (SEL *)&selRef_alarmIDString, &OBJC_IVAR___DTTimer__mtAlarmID);
}

- (NSString)mtTimerID
{
  return (NSString *)sub_24CD4EFDC(self, (uint64_t)a2, (SEL *)&selRef_mtTimer, (SEL *)&selRef_timerIDString, &OBJC_IVAR___DTTimer__mtTimerID);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_24CD757F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  char v6 = DTTimer.isEqual(_:)((uint64_t)v8);

  sub_24CD53DBC((uint64_t)v8, &qword_26982D2B8);
  return v6 & 1;
}

- (DTTimer)init
{
  result = (DTTimer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end