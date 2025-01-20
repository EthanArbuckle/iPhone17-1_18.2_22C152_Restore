@interface StatisticsCollectionCalculatorDateIntervalFilterDataSource
- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7;
- (_TtC19HealthBalanceDaemon58StatisticsCollectionCalculatorDateIntervalFilterDataSource)init;
@end

@implementation StatisticsCollectionCalculatorDateIntervalFilterDataSource

- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7
{
  sub_250E98BC4(0);
  MEMORY[0x270FA5388](v12 - 8);
  v14 = &v24[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = _Block_copy(a6);
  v16 = _Block_copy(a7);
  if (a4)
  {
    sub_250F0BED0();
    uint64_t v17 = sub_250F0BF30();
    uint64_t v18 = (*(uint64_t (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 0, 1, v17);
  }
  else
  {
    uint64_t v19 = sub_250F0BF30();
    uint64_t v18 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v14, 1, 1, v19);
  }
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  *(void *)&v24[-16] = v15;
  MEMORY[0x270FA5388](v20);
  *(void *)&v24[-16] = v16;
  id v21 = a3;
  v22 = self;
  sub_250EBCD28((uint64_t)v21, (uint64_t)v14, (uint64_t)sub_250EBD524, (uint64_t)&v24[-32], (uint64_t)sub_250EBD558, (uint64_t)&v24[-32]);
  sub_250EA8994((uint64_t)v14);

  _Block_release(v16);
  _Block_release(v15);
  return 1;
}

- (_TtC19HealthBalanceDaemon58StatisticsCollectionCalculatorDateIntervalFilterDataSource)init
{
  result = (_TtC19HealthBalanceDaemon58StatisticsCollectionCalculatorDateIntervalFilterDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon58StatisticsCollectionCalculatorDateIntervalFilterDataSource_includedDateIntervals));
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC19HealthBalanceDaemon58StatisticsCollectionCalculatorDateIntervalFilterDataSource_unitTest_excludedSampleHandler);
  sub_250EAB9CC(v3);
}

@end