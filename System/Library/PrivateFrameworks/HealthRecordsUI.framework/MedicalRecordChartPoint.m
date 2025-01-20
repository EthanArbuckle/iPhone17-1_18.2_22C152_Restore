@interface MedicalRecordChartPoint
- (NSString)description;
- (_TtC15HealthRecordsUI23MedicalRecordChartPoint)init;
- (id)allYValues;
- (id)maxXValueAsGenericType;
- (id)maxYValue;
- (id)userInfo;
- (id)xValueAsGenericType;
- (id)yValue;
- (id)yValueForKey:(id)a3;
@end

@implementation MedicalRecordChartPoint

- (id)userInfo
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_blockCoordinateInfo));
}

- (id)xValueAsGenericType
{
  uint64_t v3 = sub_1C254CAD0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  v9 = (char *)&v15 - v8;
  v10 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_chartableSet);
  v11 = self;
  id v12 = objc_msgSend(v10, sel_date);
  sub_1C254CA80();

  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  v13 = (void *)sub_1C25508F0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  return v13;
}

- (id)maxXValueAsGenericType
{
  uint64_t v2 = sub_1C254CAD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v14 - v7;
  v9 = *(void **)&a1[OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_chartableSet];
  v10 = a1;
  id v11 = objc_msgSend(v9, sel_date);
  sub_1C254CA80();

  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
  id v12 = (void *)sub_1C25508F0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  return v12;
}

- (id)yValueForKey:(id)a3
{
  sub_1C254F470();
  uint64_t v4 = self;
  sub_1C23AAD9C((uint64_t)v13);

  swift_bridgeObjectRelease();
  uint64_t v5 = v14;
  if (v14)
  {
    uint64_t v6 = __swift_project_boxed_opaque_existential_1Tm(v13, v14);
    uint64_t v7 = *(void *)(v5 - 8);
    __n128 v8 = MEMORY[0x1F4188790](v6);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v7 + 16))(v10, v8);
    id v11 = (void *)sub_1C2550860();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (id)allYValues
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_sortedYValues);
  uint64_t v3 = self;
  sub_1C228B270(v2);

  uint64_t v4 = (void *)sub_1C254F700();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)yValue
{
  if (*(void *)(*(void *)(a1 + OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_sortedYValues) + 16)) {
    v1 = (void *)sub_1C2550860();
  }
  else {
    v1 = 0;
  }
  return v1;
}

- (id)maxYValue
{
  sub_1C23AB188((uint64_t)v10);
  uint64_t v2 = v11;
  if (v11)
  {
    uint64_t v3 = __swift_project_boxed_opaque_existential_1Tm(v10, v11);
    uint64_t v4 = *(void *)(v2 - 8);
    __n128 v5 = MEMORY[0x1F4188790](v3);
    uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v4 + 16))(v7, v5);
    __n128 v8 = (void *)sub_1C2550860();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  }
  else
  {
    __n128 v8 = 0;
  }
  return v8;
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_1C23AB360();

  uint64_t v3 = (void *)sub_1C254F430();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15HealthRecordsUI23MedicalRecordChartPoint)init
{
  result = (_TtC15HealthRecordsUI23MedicalRecordChartPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI23MedicalRecordChartPoint_blockCoordinateInfo));
  swift_bridgeObjectRelease();
}

@end