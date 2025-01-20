@interface AudiogramAverageSensitivityChartFormatter
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
@end

@implementation AudiogramAverageSensitivityChartFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  sub_1E0E425C4(0, (unint64_t *)&qword_1EAD6EAA0);
  unint64_t v5 = sub_1E0ECD330();
  v6 = self;
  sub_1E0E79634(v5);

  swift_bridgeObjectRelease();
  sub_1E0DF2C04(0, (unint64_t *)&qword_1EAD6EA70);
  v7 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v7;
}

@end