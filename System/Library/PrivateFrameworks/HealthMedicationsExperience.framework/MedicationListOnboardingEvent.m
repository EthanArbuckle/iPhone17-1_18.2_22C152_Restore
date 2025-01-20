@interface MedicationListOnboardingEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation MedicationListOnboardingEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  v2 = (void *)sub_1C2B73F60();
  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  sub_1C2B25CE8(MEMORY[0x1E4FBC860]);
  v4 = (void *)sub_1C2B73EE0();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  sub_1C2B35FBC(v4);
  swift_release();

  v5 = (void *)sub_1C2B73EE0();
  swift_bridgeObjectRelease();
  return v5;
}

@end