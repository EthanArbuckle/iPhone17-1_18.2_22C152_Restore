@interface BalanceCoordinate
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (_TtC8HealthUI17BalanceCoordinate)init;
- (double)startXValue;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
@end

@implementation BalanceCoordinate

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  v2 = (void *)swift_unknownObjectRetain();
  return (HKGraphSeriesBlockCoordinateInfo *)v2;
}

- (_TtC8HealthUI17BalanceCoordinate)init
{
  result = (_TtC8HealthUI17BalanceCoordinate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (double)startXValue
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8HealthUI17BalanceCoordinate_xValue);
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  long long v4 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&a3->tx;
  v5 = self;
  id v6 = sub_1E0E90B4C((CGFloat *)v8);

  return v6;
}

@end