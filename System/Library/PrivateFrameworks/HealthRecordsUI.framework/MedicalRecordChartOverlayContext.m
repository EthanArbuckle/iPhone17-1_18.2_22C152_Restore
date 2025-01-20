@interface MedicalRecordChartOverlayContext
- (_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext)init;
- (_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext)initWithTitle:(id)a3 dataSource:(id)a4 defaultColors:(id)a5 selectedColors:(id)a6 verticalAxis:(id)a7;
- (id)contextItemForLastUpdate;
- (id)overlayDisplayTypeForTimeScope:(int64_t)a3;
- (id)sampleTypeForDateRangeUpdates;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation MedicalRecordChartOverlayContext

- (_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext)initWithTitle:(id)a3 dataSource:(id)a4 defaultColors:(id)a5 selectedColors:(id)a6 verticalAxis:(id)a7
{
  uint64_t v11 = sub_1C254F470();
  uint64_t v13 = v12;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  return (_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext *)MedicalRecordChartOverlayContext.init(title:dataSource:defaultColors:selectedColors:verticalAxis:)(v11, v13, (uint64_t)v14, v15, a6, (uint64_t)a7);
}

- (id)contextItemForLastUpdate
{
  uint64_t v3 = OBJC_IVAR____TtC15HealthRecordsUI32MedicalRecordChartOverlayContext_cachedItem;
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI32MedicalRecordChartOverlayContext_cachedItem);
  v5 = self;
  if (v4)
  {
    v6 = v4;
    v7 = (objc_class *)v4;
  }
  else
  {
    v7 = (objc_class *)sub_1C23E46EC(0, 0);
    v6 = 0;
    v4 = *(Class *)((char *)&self->super.isa + v3);
  }
  *(Class *)((char *)&self->super.isa + v3) = v7;
  id v8 = v6;
  v9 = v7;

  return v9;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  uint64_t v10 = sub_1C254C520();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = _Block_copy(a7);
  sub_1C254C4D0();
  _Block_copy(v14);
  id v15 = a4;
  id v16 = self;
  sub_1C23E4898((unint64_t)v13, (uint64_t)v16, (uint64_t)v14);
  _Block_release(v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (id)sampleTypeForDateRangeUpdates
{
  sub_1C23E4858();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v4 = *MEMORY[0x1E4F29A70];
  v5 = self;
  id v6 = objc_msgSend(ObjCClassFromMetadata, sel_diagnosticTestResultTypeForIdentifier_, v4);

  return v6;
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  uint64_t v3 = self;
  uint64_t v4 = sub_1C23E4C14();

  return v4;
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext)init
{
  result = (_TtC15HealthRecordsUI32MedicalRecordChartOverlayContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI32MedicalRecordChartOverlayContext_dataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI32MedicalRecordChartOverlayContext_defaultColors));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI32MedicalRecordChartOverlayContext_selectedColors));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI32MedicalRecordChartOverlayContext_verticalAxis));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI32MedicalRecordChartOverlayContext_cachedItem));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI32MedicalRecordChartOverlayContext_cachedOverlayDisplayType));
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI32MedicalRecordChartOverlayContext_cachedDataSource);
}

@end