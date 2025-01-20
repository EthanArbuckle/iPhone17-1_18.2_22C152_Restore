@interface BalanceYAxis
- (_TtC8HealthUI12BalanceYAxis)initWithConfiguration:(id)a3;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
@end

@implementation BalanceYAxis

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1E0EAAC6C(v5);

  if (v7)
  {
    sub_1E0E52230();
    v8 = (void *)sub_1E0ECD320();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (_TtC8HealthUI12BalanceYAxis)initWithConfiguration:(id)a3
{
  id v3 = a3;
  result = (_TtC8HealthUI12BalanceYAxis *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end