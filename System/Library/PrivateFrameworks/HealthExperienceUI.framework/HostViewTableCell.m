@interface HostViewTableCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC18HealthExperienceUI17HostViewTableCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI17HostViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation HostViewTableCell

- (_TtC18HealthExperienceUI17HostViewTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)_sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC18HealthExperienceUI17HostViewTableCell *)HostViewTableCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC18HealthExperienceUI17HostViewTableCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI17HostViewTableCell *)HostViewTableCell.init(coder:)(a3);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  sub_1AD1D7E5C(&OBJC_IVAR____TtC18HealthExperienceUI17HostViewTableCell_hostView, type metadata accessor for HostViewTableCell, width, height, a4, a5);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void).cxx_destruct
{
}

@end