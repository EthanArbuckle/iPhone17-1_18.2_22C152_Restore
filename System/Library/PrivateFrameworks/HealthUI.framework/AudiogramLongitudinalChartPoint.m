@interface AudiogramLongitudinalChartPoint
- (_TtC8HealthUI31AudiogramLongitudinalChartPoint)init;
- (id)allYValues;
- (id)maxYValue;
- (id)minYValue;
- (id)userInfo;
- (id)xValueAsGenericType;
- (id)yValue;
- (id)yValueForKey:(id)a3;
@end

@implementation AudiogramLongitudinalChartPoint

- (_TtC8HealthUI31AudiogramLongitudinalChartPoint)init
{
  result = (_TtC8HealthUI31AudiogramLongitudinalChartPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI31AudiogramLongitudinalChartPoint_audiogramChartData));
}

- (id)xValueAsGenericType
{
  uint64_t v3 = sub_1E0ECB980();
  MEMORY[0x1F4188790](v3, v4);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8HealthUI31AudiogramLongitudinalChartPoint_audiogramChartData)+ OBJC_IVAR____TtC8HealthUI30AudiogramLongitudinalChartData_aggregationIntervalMidpoint, v3);
  v7 = (void *)sub_1E0ECDA10();
  return v7;
}

- (id)yValue
{
  v2 = self;
  sub_1E0E59630((uint64_t)v10);

  uint64_t v3 = v11;
  if (v11)
  {
    uint64_t v4 = __swift_project_boxed_opaque_existential_0(v10, v11);
    uint64_t v5 = *(void *)(v3 - 8);
    MEMORY[0x1F4188790](v4, v4);
    v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    v8 = (void *)sub_1E0ECD9D0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)yValueForKey:(id)a3
{
  uint64_t v3 = self;
  if ([(AudiogramLongitudinalChartPoint *)v3 yValue])
  {
    sub_1E0ECD760();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_1E0DF0A14((uint64_t)v11, (uint64_t)v12);

  uint64_t v4 = v13;
  if (v13)
  {
    uint64_t v5 = __swift_project_boxed_opaque_existential_0(v12, v13);
    uint64_t v6 = *(void *)(v4 - 8);
    MEMORY[0x1F4188790](v5, v5);
    v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v6 + 16))(v8);
    uint64_t v9 = (void *)sub_1E0ECD9D0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)allYValues
{
  v2 = self;
  sub_1E0E599D0();

  uint64_t v3 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)minYValue
{
  return sub_1E0E59E48(self, (uint64_t)a2, (uint64_t (*)(void *))sub_1E0E59C78);
}

- (id)maxYValue
{
  return sub_1E0E59E48(self, (uint64_t)a2, (uint64_t (*)(void *))sub_1E0E5A028);
}

- (id)userInfo
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8HealthUI31AudiogramLongitudinalChartPoint_audiogramChartData));
}

@end