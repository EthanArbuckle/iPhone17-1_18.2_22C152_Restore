@interface ChromeHostViewCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC18HealthExperienceUI18ChromeHostViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI18ChromeHostViewCell)initWithFrame:(CGRect)a3;
@end

@implementation ChromeHostViewCell

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  sub_1AD1D7AEC(width, height, a4, a5);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (_TtC18HealthExperienceUI18ChromeHostViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ChromeHostViewCell(0);
  return -[HostViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI18ChromeHostViewCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI18ChromeHostViewCell *)sub_1AD34FE68(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ChromeHostViewCell);
}

@end