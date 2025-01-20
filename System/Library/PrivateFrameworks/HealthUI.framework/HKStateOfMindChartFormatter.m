@interface HKStateOfMindChartFormatter
- (HKStateOfMindChartFormatter)init;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (id)unitStringFromUnit:(id)a3 number:(id)a4;
@end

@implementation HKStateOfMindChartFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  sub_1E0E467C4();
  unint64_t v6 = sub_1E0ECD330();
  v7 = self;
  sub_1E0E9623C(v6, a4);

  swift_bridgeObjectRelease();
  sub_1E0DF2C04(0, (unint64_t *)&qword_1EAD6EA70);
  v8 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1E0E97ADC(v7);

  v9 = (void *)sub_1E0ECD190();
  swift_bridgeObjectRelease();
  return v9;
}

- (HKStateOfMindChartFormatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StateOfMindChartFormatter();
  return [(HKStateOfMindChartFormatter *)&v3 init];
}

@end