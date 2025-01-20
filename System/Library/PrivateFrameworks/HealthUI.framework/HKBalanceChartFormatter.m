@interface HKBalanceChartFormatter
- (HKBalanceChartFormatter)init;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
@end

@implementation HKBalanceChartFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  sub_1E0E467C4();
  unint64_t v6 = sub_1E0ECD330();
  v7 = self;
  sub_1E0E7C198(v6, a4);

  swift_bridgeObjectRelease();
  sub_1E0DF2C04(0, (unint64_t *)&qword_1EAD6EA70);
  v8 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v8;
}

- (HKBalanceChartFormatter)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKBalanceChartFormatter____lazy_storage___relativeStatFormatter) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKBalanceChartFormatter____lazy_storage___valueAttributes) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKBalanceChartFormatter____lazy_storage___unitAttributes) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BalanceChartFormatter();
  return [(HKBalanceChartFormatter *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceChartFormatter____lazy_storage___relativeStatFormatter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end