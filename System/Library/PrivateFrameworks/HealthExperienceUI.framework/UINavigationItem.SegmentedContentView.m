@interface UINavigationItem.SegmentedContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView)initWithCoder:(id)a3;
- (_TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView)initWithFrame:(CGRect)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
@end

@implementation UINavigationItem.SegmentedContentView

- (_TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView)initWithCoder:(id)a3
{
  result = (_TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD484B84();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  [(UINavigationItem.SegmentedContentView *)v4 directionalLayoutMargins];
  objc_msgSend(*(id *)((char *)&v4->super.super.super.isa+ OBJC_IVAR____TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView_control), sel_sizeThatFits_, width - v5 - v6, 1.79769313e308);
  double v8 = v7;
  if (qword_1E9A29478 != -1) {
    swift_once();
  }
  double v9 = *(double *)&qword_1E9A2F2D8;

  double v10 = v8 + v9;
  double v11 = width;
  result.height = v10;
  result.double width = v11;
  return result;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(UINavigationItem.SegmentedContentView *)&v3 layoutMarginsDidChange];
  objc_msgSend(v2, sel_setNeedsLayout, v3.receiver, v3.super_class);
}

- (_TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView_control));
}

@end