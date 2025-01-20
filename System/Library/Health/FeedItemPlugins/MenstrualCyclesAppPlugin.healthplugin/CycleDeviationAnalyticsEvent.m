@interface CycleDeviationAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (void)setEventName:(id)a3;
@end

@implementation CycleDeviationAnalyticsEvent

- (NSString)eventName
{
  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  v2 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setEventName:(id)a3
{
  *(void *)self->eventName = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  *(void *)&self->eventName[8] = v4;
  swift_retain();
  swift_release();

  swift_bridgeObjectRelease();
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  sub_2414E4810(MEMORY[0x263F8EE78]);
  uint64_t v4 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  sub_2415BADF0(v4);
  swift_release();

  v5 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();

  return v5;
}

@end