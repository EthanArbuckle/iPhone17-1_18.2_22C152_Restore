@interface MedicationChartDataSource
- (BOOL)supportsChartQueryDataGeneration;
- (_TtC19HealthMedicationsUI25MedicationChartDataSource)init;
- (_TtC19HealthMedicationsUI25MedicationChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4;
- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4;
- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5;
- (id)queriesForRequest:(id)a3 completionHandler:(id)a4;
- (id)queryDescription;
@end

@implementation MedicationChartDataSource

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationChartDataSource_medication));
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_1C1F1167C(v10, v11, (uint64_t)sub_1C1F18D18, v9);
  uint64_t v14 = v13;

  swift_release();
  v17[4] = sub_1C211120C;
  v17[5] = v14;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1107296256;
  v17[2] = sub_1C1F0E42C;
  v17[3] = &block_descriptor_44;
  v15 = _Block_copy(v17);
  swift_release();

  return v15;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_1C1F119C4(v7, (char *)v8, (void (**)(const void *, uint64_t, void *))v6);
  _Block_release(v6);
  _Block_release(v6);

  sub_1C1F12718(0, &qword_1EBF0B4C8);
  uint64_t v9 = (void *)sub_1C214A770();
  swift_bridgeObjectRelease();

  return v9;
}

- (id)queryDescription
{
  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI25MedicationChartDataSource_medication);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_semanticIdentifier);
  id v5 = objc_msgSend(v4, sel_stringValue);

  sub_1C214A5F0();
  v6 = (void *)sub_1C214A5B0();
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 1;
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = (void *)sub_1C2111214(v5);

  return v7;
}

- (_TtC19HealthMedicationsUI25MedicationChartDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC19HealthMedicationsUI25MedicationChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19HealthMedicationsUI25MedicationChartDataSource)init
{
  result = (_TtC19HealthMedicationsUI25MedicationChartDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end