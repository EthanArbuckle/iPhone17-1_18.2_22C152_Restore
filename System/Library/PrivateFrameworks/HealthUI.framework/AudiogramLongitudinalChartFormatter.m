@interface AudiogramLongitudinalChartFormatter
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
@end

@implementation AudiogramLongitudinalChartFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  sub_1E0E467C4();
  unint64_t v6 = sub_1E0ECD330();
  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    v7 = self;
    sub_1E0E48428(v6);
  }
  else
  {
    v8 = self;
    sub_1E0E48A6C(v6);
  }

LABEL_6:
  swift_bridgeObjectRelease();
  sub_1E0E48ECC();
  v9 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v9;
}

@end