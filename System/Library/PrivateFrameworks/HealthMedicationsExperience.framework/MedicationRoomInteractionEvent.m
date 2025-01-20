@interface MedicationRoomInteractionEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation MedicationRoomInteractionEvent

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
  return sub_1C2B270E0((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_1C2B26290);
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_1C2B270E0((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_1C2B26840);
}

@end