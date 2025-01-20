@interface HKStateOfMindChartDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (HKStateOfMindChartDataSource)init;
- (HKStateOfMindChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4;
- (HKStateOfMindChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4 overlayPredicate:(id)a5;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)mappingFunctionForContext:(id)a3;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
@end

@implementation HKStateOfMindChartDataSource

- (HKStateOfMindChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4 overlayPredicate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (HKStateOfMindChartDataSource *)sub_1E0E585B8((uint64_t)v7, (uint64_t)v8, a5);

  return v10;
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

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  sub_1E0E5550C(v8, (uint64_t)sub_1E0DFAAB4, v7);

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
  if ([(HKStateOfMindChartDataSource *)v4 supportsChartQueryDataGeneration])
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
    v5 = 0;
  }
  else
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
    v8[4] = sub_1E0E592BC;
    v8[5] = v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 1107296256;
    v8[2] = sub_1E0E99B60;
    v8[3] = &block_descriptor_26;
    v5 = _Block_copy(v8);
    swift_release();
  }
  return v5;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 1;
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  v13 = sub_1E0E55F60(v10, v11, sub_1E0E592B4, v9);
  uint64_t v15 = v14;

  swift_release();
  if (v13)
  {
    v17[4] = v13;
    v17[5] = v15;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 1107296256;
    v17[2] = sub_1E0E67E2C;
    v17[3] = &block_descriptor_19;
    v13 = _Block_copy(v17);
    swift_release();
  }
  return v13;
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = sub_1E0E571C8(v6, a4);

  return v8;
}

- (HKStateOfMindChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (HKStateOfMindChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HKStateOfMindChartDataSource)init
{
  result = (HKStateOfMindChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___HKStateOfMindChartDataSource_gregorianCalendar;
  uint64_t v4 = sub_1E0ECBB60();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKStateOfMindChartDataSource_overlayPredicate);
}

@end