@interface HKInteractiveChartInteractionAnalyticsManager
- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)init;
- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)initWithHealthStore:(id)a3;
- (void)submitWithEvent:(id)a3;
@end

@implementation HKInteractiveChartInteractionAnalyticsManager

- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)initWithHealthStore:(id)a3
{
  id v3 = a3;
  v4 = (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *)sub_1E0DFC7DC(v3);

  return v4;
}

- (void)submitWithEvent:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager_submissionManager);
  if (v3)
  {
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = ObjectType;
    v11[4] = sub_1E0DFCB38;
    v11[5] = v7;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 1107296256;
    v11[2] = sub_1E0DFC578;
    v11[3] = &block_descriptor_9;
    v8 = _Block_copy(v11);
    id v9 = a3;
    v10 = self;
    swift_release();
    objc_msgSend(v3, sel_submitEvent_completion_, v9, v8);
    _Block_release(v8);
  }
}

- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)init
{
  result = (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager_submissionManager));
}

@end