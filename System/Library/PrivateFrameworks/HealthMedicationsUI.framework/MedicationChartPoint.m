@interface MedicationChartPoint
- (_TtC19HealthMedicationsUI20MedicationChartPoint)init;
- (id)allYValues;
- (id)minXValueAsGenericType;
- (id)minYValue;
- (id)userInfo;
- (id)xValueAsGenericType;
- (id)yValue;
- (id)yValueForKey:(id)a3;
@end

@implementation MedicationChartPoint

- (id)xValueAsGenericType
{
  v2 = self;
  sub_1C1FE83F8(v5);

  __swift_project_boxed_opaque_existential_0(v5, v5[3]);
  v3 = (void *)sub_1C214BA70();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);

  return v3;
}

- (id)minXValueAsGenericType
{
  id v1 = a1;
  sub_1C1FE83F8(v4);

  __swift_project_boxed_opaque_existential_0(v4, v4[3]);
  v2 = (void *)sub_1C214BA70();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);

  return v2;
}

- (id)yValueForKey:(id)a3
{
  v3 = self;
  if (sub_1C1FE7DB4()) {
    double v4 = sub_1C1FE81A0();
  }
  else {
    double v4 = *(double *)((char *)&v3->super.isa + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_takenCount)
  }
       + *(double *)((char *)&v3->super.isa + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_skippedCount);
  uint64_t v5 = MEMORY[0x1E4FBB3D0];
  v12[3] = MEMORY[0x1E4FBB3D0];
  *(double *)v12 = v4;

  v6 = __swift_project_boxed_opaque_existential_0(v12, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_1C214BA70();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);

  return v10;
}

- (id)allYValues
{
  v2 = self;
  sub_1C1FE882C();

  v3 = (void *)sub_1C214A770();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)minYValue
{
  v2 = self;
  sub_1C1FE8964((uint64_t)v10);

  uint64_t v3 = v11;
  if (v11)
  {
    double v4 = __swift_project_boxed_opaque_existential_0(v10, v11);
    uint64_t v5 = *(void *)(v3 - 8);
    MEMORY[0x1F4188790](v4);
    uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    uint64_t v8 = (void *)sub_1C214BA70();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)yValue
{
  id v1 = a1;
  if (sub_1C1FE7DB4()) {
    double v2 = sub_1C1FE81A0();
  }
  else {
    double v2 = *(double *)&v1[OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_takenCount]
  }
       + *(double *)&v1[OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_skippedCount];
  uint64_t v3 = MEMORY[0x1E4FBB3D0];
  void v10[3] = MEMORY[0x1E4FBB3D0];
  *(double *)v10 = v2;

  double v4 = __swift_project_boxed_opaque_existential_0(v10, v3);
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  uint64_t v8 = (void *)sub_1C214BA70();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);

  return v8;
}

- (id)userInfo
{
  double v2 = self;
  id v3 = sub_1C1FE8C78();

  return v3;
}

- (_TtC19HealthMedicationsUI20MedicationChartPoint)init
{
  result = (_TtC19HealthMedicationsUI20MedicationChartPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_startDate;
  uint64_t v4 = sub_1C2147AC0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_endDate, v4);
  uint64_t v6 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_statisticsInterval;
  uint64_t v7 = sub_1C21476D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationChartPoint_medication);
}

@end