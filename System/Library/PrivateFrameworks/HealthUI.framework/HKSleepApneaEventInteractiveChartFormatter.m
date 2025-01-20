@interface HKSleepApneaEventInteractiveChartFormatter
- (HKSleepApneaEventInteractiveChartFormatter)initWithLocalizedCategoryName:(id)a3;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
@end

@implementation HKSleepApneaEventInteractiveChartFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  sub_1E0E467C4();
  unint64_t v6 = sub_1E0ECD330();
  v7 = self;
  sub_1E0E461C0(v6, a4);

  swift_bridgeObjectRelease();
  sub_1E0DF2C04(0, (unint64_t *)&qword_1EAD6EA70);
  v8 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v8;
}

- (HKSleepApneaEventInteractiveChartFormatter)initWithLocalizedCategoryName:(id)a3
{
  sub_1E0ECD1D0();
  v4 = (void *)sub_1E0ECD190();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SleepApneaEventInteractiveChartFormatter();
  v5 = [(HKInteractiveChartCategoryValueFormatter *)&v7 initWithLocalizedCategoryName:v4];

  return v5;
}

@end