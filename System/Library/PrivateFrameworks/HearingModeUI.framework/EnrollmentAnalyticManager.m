@interface EnrollmentAnalyticManager
+ (_TtC13HearingModeUI25EnrollmentAnalyticManager)shared;
- (_TtC13HearingModeUI25EnrollmentAnalyticManager)init;
- (void)submitEvent;
- (void)updateKeyWithKey:(int64_t)a3 value:(int64_t)a4;
@end

@implementation EnrollmentAnalyticManager

+ (_TtC13HearingModeUI25EnrollmentAnalyticManager)shared
{
  if (qword_269B2E2B8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_269B2E2C0;
  return (_TtC13HearingModeUI25EnrollmentAnalyticManager *)v2;
}

- (_TtC13HearingModeUI25EnrollmentAnalyticManager)init
{
  return (_TtC13HearingModeUI25EnrollmentAnalyticManager *)sub_251294724();
}

- (void)updateKeyWithKey:(int64_t)a3 value:(int64_t)a4
{
  v6 = self;
  sub_251294C24(a3, a4);
}

- (void)submitEvent
{
  v2 = self;
  sub_2512950F8();
}

@end