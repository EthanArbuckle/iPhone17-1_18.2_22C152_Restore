@interface HealthBalanceDailyAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HealthBalanceDailyAnalyticsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  v2 = (void *)sub_250F0CF50();
  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_250E9CE2C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_250E99CA8);
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_250E9CE2C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_250E9C86C);
}

@end