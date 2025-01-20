@interface BalanceClassificationDateRangeDataSourceDelegate
- (_TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate)init;
- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4;
@end

@implementation BalanceClassificationDateRangeDataSourceDelegate

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1E0E9326C(v6, (void *)a4);

  sub_1E0DFAB14();
  v8 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate)init
{
  result = (_TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate_applicationItems));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate_baseDisplayType));
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI48BalanceClassificationDateRangeDataSourceDelegate_classification;
  uint64_t v4 = sub_1E0ECBEA0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end