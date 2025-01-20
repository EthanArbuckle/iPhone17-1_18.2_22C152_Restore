@interface StateOfMindChartPoint
- (_TtC8HealthUI21StateOfMindChartPoint)init;
- (id)allYValues;
- (id)maxYValue;
- (id)minXValueAsGenericType;
- (id)minYValue;
- (id)userInfo;
- (id)xValueAsGenericType;
- (id)yValue;
- (id)yValueForKey:(id)a3;
@end

@implementation StateOfMindChartPoint

- (_TtC8HealthUI21StateOfMindChartPoint)init
{
  result = (_TtC8HealthUI21StateOfMindChartPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI21StateOfMindChartPoint_dateInterval;
  uint64_t v4 = sub_1E0ECB3C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8HealthUI21StateOfMindChartPoint____lazy_storage___dateIntervalMidpoint;
  sub_1E0DF0AA0((uint64_t)v5);
}

- (id)xValueAsGenericType
{
  uint64_t v3 = sub_1E0ECB980();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v3, v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6, v9);
  v11 = (char *)&v15 - v10;
  v12 = self;
  sub_1E0DEBA88((uint64_t)v11);

  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v8, v11, v3);
  v13 = (void *)sub_1E0ECDA10();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v11, v3);
  return v13;
}

- (id)minXValueAsGenericType
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_xValueAsGenericType);
  sub_1E0ECD760();

  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_0(v5, v5[3]);
  uint64_t v3 = (void *)sub_1E0ECD9D0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

- (id)yValue
{
  id v2 = self;
  if ([(StateOfMindChartPoint *)v2 minYValue])
  {
    sub_1E0ECD760();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  sub_1E0DF0A14((uint64_t)v10, (uint64_t)v11);

  uint64_t v3 = v12;
  if (v12)
  {
    uint64_t v4 = __swift_project_boxed_opaque_existential_0(v11, v12);
    uint64_t v5 = *(void *)(v3 - 8);
    MEMORY[0x1F4188790](v4, v4);
    uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    v8 = (void *)sub_1E0ECD9D0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)yValueForKey:(id)a3
{
  sub_1E0ECD1D0();
  uint64_t v4 = self;
  StateOfMindChartPoint.yValue(forKey:)(&v12);

  swift_bridgeObjectRelease();
  uint64_t v5 = v13;
  if (v13)
  {
    uint64_t v6 = __swift_project_boxed_opaque_existential_0(&v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6, v6);
    uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    uint64_t v10 = (void *)sub_1E0ECD9D0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v12);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)allYValues
{
  id v2 = self;
  StateOfMindChartPoint.allYValues()();

  uint64_t v3 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)minYValue
{
  return sub_1E0DECAFC((uint64_t)self, (uint64_t)a2, (void (*)(void *__return_ptr))StateOfMindChartPoint.minYValue());
}

- (id)maxYValue
{
  return sub_1E0DECAFC((uint64_t)self, (uint64_t)a2, (void (*)(void *__return_ptr))StateOfMindChartPoint.maxYValue());
}

- (id)userInfo
{
  id v2 = self;
  id v3 = StateOfMindChartPoint.userInfo()();

  return v3;
}

@end