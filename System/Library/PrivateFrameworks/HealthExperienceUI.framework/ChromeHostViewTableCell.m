@interface ChromeHostViewTableCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC18HealthExperienceUI23ChromeHostViewTableCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI23ChromeHostViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ChromeHostViewTableCell

- (_TtC18HealthExperienceUI23ChromeHostViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ChromeHostViewTableCell(0);
  v7 = [(HostViewTableCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC18HealthExperienceUI23ChromeHostViewTableCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI23ChromeHostViewTableCell *)sub_1AD34FE68(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ChromeHostViewTableCell);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  objc_super v9 = self;
  sub_1AD34FF3C(width, height, a4, a5);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

@end