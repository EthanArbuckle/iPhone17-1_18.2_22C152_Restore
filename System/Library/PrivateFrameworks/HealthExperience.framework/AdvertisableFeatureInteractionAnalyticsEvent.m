@interface AdvertisableFeatureInteractionAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation AdvertisableFeatureInteractionAnalyticsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  v2 = (void *)sub_1C28CD6F0();

  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  sub_1C28430AC(v4);
  swift_release();

  v5 = (void *)sub_1C28CD5F0();
  swift_bridgeObjectRelease();

  return v5;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  sub_1C284570C(v4);
  swift_release();

  v5 = (void *)sub_1C28CD5F0();
  swift_bridgeObjectRelease();

  return v5;
}

@end