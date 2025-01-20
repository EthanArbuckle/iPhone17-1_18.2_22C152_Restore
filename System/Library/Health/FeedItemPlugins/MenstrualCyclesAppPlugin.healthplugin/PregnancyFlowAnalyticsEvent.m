@interface PregnancyFlowAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation PregnancyFlowAnalyticsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  v2 = (void *)sub_241631CC8();

  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  sub_2414E4810(MEMORY[0x263F8EE78]);
  v4 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  sub_2412B5130(v4);
  swift_release();

  v5 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();

  return v5;
}

@end