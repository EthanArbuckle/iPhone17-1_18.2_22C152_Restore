@interface HKBalanceChartDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (HKBalanceChartDataSource)init;
- (HKBalanceChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4;
- (id)mappingFunctionForContext:(id)a3;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryCalendar;
- (id)queryDescription;
- (unint64_t)calendarUnitForTimeScope:(int64_t)a3 displayType:(id)a4;
@end

@implementation HKBalanceChartDataSource

- (HKBalanceChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  uint64_t v6 = sub_1E0ECBB60();
  MEMORY[0x1F4188790](v6 - 8, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = self;
  id v11 = a3;
  id v12 = a4;
  id v13 = objc_msgSend(v10, sel_hk_gregorianCalendarWithFirstWeekdayFromRegion);
  sub_1E0ECBB20();

  id v14 = objc_allocWithZone((Class)type metadata accessor for BalanceChartDataSource());
  v15 = sub_1E0E99F48(v11, v12, (uint64_t)v9);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (HKBalanceChartDataSource *)v15;
}

- (id)queryDescription
{
  swift_getObjectType();
  v3 = self;
  sub_1E0ECDBC0();
  sub_1E0ECD250();
  swift_bridgeObjectRetain();
  sub_1E0ECD250();

  swift_bridgeObjectRelease();
  v4 = (void *)sub_1E0ECD190();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)queryCalendar
{
  v2 = (void *)sub_1E0ECBB00();
  return v2;
}

- (unint64_t)calendarUnitForTimeScope:(int64_t)a3 displayType:(id)a4
{
  if (a3 == 6) {
    return 16;
  }
  uint64_t v10 = v4;
  uint64_t v11 = v5;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BalanceChartDataSource();
  return [(HKHealthQueryChartCacheDataSource *)&v9 calendarUnitForTimeScope:a3 displayType:a4];
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 0;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  objc_super v9 = self;
  sub_1E0E9A514(v8, (uint64_t)sub_1E0DFAAB4, v7);

  swift_release();
  sub_1E0DF2C04(0, &qword_1EAD69928);
  uint64_t v10 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)mappingFunctionForContext:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1E0ECD760();
  swift_unknownObjectRelease();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  v8[4] = sub_1E0E9D310;
  v8[5] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  v8[2] = sub_1E0E99B60;
  v8[3] = &block_descriptor_17;
  uint64_t v6 = _Block_copy(v8);
  swift_release();
  return v6;
}

- (HKBalanceChartDataSource)init
{
  result = (HKBalanceChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___HKBalanceChartDataSource_gregorianCalendar;
  uint64_t v4 = sub_1E0ECBB60();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end