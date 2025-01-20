@interface AudiogramLongitudinalChartDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (_TtC8HealthUI36AudiogramLongitudinalChartDataSource)init;
- (_TtC8HealthUI36AudiogramLongitudinalChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4;
- (id)mappingFunctionForContext:(id)a3;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
@end

@implementation AudiogramLongitudinalChartDataSource

- (_TtC8HealthUI36AudiogramLongitudinalChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  objc_allocWithZone((Class)type metadata accessor for AudiogramAnalyticsManager());
  id v7 = a4;
  id v8 = a3;
  v9 = self;
  *(Class *)((char *)&v9->super.super.isa
           + OBJC_IVAR____TtC8HealthUI36AudiogramLongitudinalChartDataSource_analyticsManager) = (Class)sub_1E0E9DF40(v7);

  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for AudiogramLongitudinalChartDataSource();
  v10 = [(HKHealthQueryChartCacheDataSource *)&v12 initWithDisplayType:v8 healthStore:v7];

  return v10;
}

- (id)queryDescription
{
  swift_getObjectType();
  swift_getMetatypeMetadata();
  sub_1E0ECD200();
  v2 = (void *)sub_1E0ECD190();
  swift_bridgeObjectRelease();
  return v2;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 0;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1E0DF9694(v8, (uint64_t)sub_1E0DFAAB4, v7);

  swift_release();
  sub_1E0DF2C04(0, &qword_1EAD69928);
  v10 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)mappingFunctionForContext:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1E0ECD760();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  v7[4] = sub_1E0DFA41C;
  v7[5] = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  v7[2] = sub_1E0E99B60;
  v7[3] = &block_descriptor_3;
  v5 = _Block_copy(v7);
  swift_release();
  return v5;
}

- (_TtC8HealthUI36AudiogramLongitudinalChartDataSource)init
{
  result = (_TtC8HealthUI36AudiogramLongitudinalChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8HealthUI36AudiogramLongitudinalChartDataSource_analyticsManager));
}

@end