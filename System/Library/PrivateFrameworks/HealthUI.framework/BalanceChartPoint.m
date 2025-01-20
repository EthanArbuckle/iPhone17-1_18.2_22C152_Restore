@interface BalanceChartPoint
- (_TtC8HealthUI17BalanceChartPoint)init;
- (id)allYValues;
- (id)maxYValue;
- (id)minYValue;
- (id)userInfo;
- (id)xValueAsGenericType;
- (id)yValue;
- (id)yValueForKey:(id)a3;
@end

@implementation BalanceChartPoint

- (_TtC8HealthUI17BalanceChartPoint)init
{
  result = (_TtC8HealthUI17BalanceChartPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC8HealthUI17BalanceChartPoint_collection);
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI17BalanceChartPoint_date;
  uint64_t v4 = sub_1E0ECB980();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)xValueAsGenericType
{
  uint64_t v3 = sub_1E0ECB980();
  MEMORY[0x1F4188790](v3, v4);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC8HealthUI17BalanceChartPoint_date, v3);
  v7 = (void *)sub_1E0ECDA10();
  return v7;
}

- (id)yValue
{
  v2 = self;
  if ([(BalanceChartPoint *)v2 minYValue])
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
    v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  sub_1E0E1601C(&v12);

  swift_bridgeObjectRelease();
  uint64_t v5 = v13;
  if (v13)
  {
    uint64_t v6 = __swift_project_boxed_opaque_existential_0(&v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6, v6);
    uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    v10 = (void *)sub_1E0ECD9D0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v12);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)allYValues
{
  v2 = self;
  sub_1E0E163A4();

  uint64_t v3 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)minYValue
{
  v2 = self;
  sub_1E0E15434();
  uint64_t v3 = MEMORY[0x1E4FBB3D0];
  void v11[3] = MEMORY[0x1E4FBB3D0];
  v11[0] = v4;

  uint64_t v5 = __swift_project_boxed_opaque_existential_0(v11, v3);
  uint64_t v6 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v5, v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v8);
  uint64_t v9 = (void *)sub_1E0ECD9D0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v9;
}

- (id)maxYValue
{
  v2 = self;
  sub_1E0E15434();
  uint64_t v3 = MEMORY[0x1E4FBB3D0];
  void v11[3] = MEMORY[0x1E4FBB3D0];
  v11[0] = v4;

  uint64_t v5 = __swift_project_boxed_opaque_existential_0(v11, v3);
  uint64_t v6 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v5, v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v8);
  uint64_t v9 = (void *)sub_1E0ECD9D0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v9;
}

- (id)userInfo
{
  return 0;
}

@end