@interface StateOfMindCoordinate
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (_TtC8HealthUI21StateOfMindCoordinate)init;
- (double)startXValue;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
@end

@implementation StateOfMindCoordinate

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  v2 = (void *)swift_unknownObjectRetain();
  return (HKGraphSeriesBlockCoordinateInfo *)v2;
}

- (_TtC8HealthUI21StateOfMindCoordinate)init
{
  result = (_TtC8HealthUI21StateOfMindCoordinate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (double)startXValue
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8HealthUI21StateOfMindCoordinate_xValue);
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  long long v4 = *(_OWORD *)&a3->c;
  v9[0] = *(_OWORD *)&a3->a;
  v9[1] = v4;
  v9[2] = *(_OWORD *)&a3->tx;
  v5 = self;
  sub_1E0E21A08((CGFloat *)v9);
  v7 = v6;

  return v7;
}

@end