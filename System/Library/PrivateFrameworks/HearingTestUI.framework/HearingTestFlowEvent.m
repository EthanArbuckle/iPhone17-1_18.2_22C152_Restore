@interface HearingTestFlowEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HearingTestFlowEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  v2 = (void *)sub_251444BE0();

  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  HearingTestFlowEvent.makeUnrestrictedEventPayload(with:)(v4);
  swift_release();

  v5 = (void *)sub_251444B40();
  swift_bridgeObjectRelease();

  return v5;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  HearingTestFlowEvent.makeIHAGatedEventPayload(with:)(v4);
  swift_release();

  v5 = (void *)sub_251444B40();
  swift_bridgeObjectRelease();

  return v5;
}

@end