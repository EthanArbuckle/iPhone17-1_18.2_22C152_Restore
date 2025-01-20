@interface DynamicButtonView
- (BOOL)hasContent;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (NSString)accessibilityLabel;
- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)init;
- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DynamicButtonView

- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)init
{
  return (_TtC20StoreDynamicUIPlugin17DynamicButtonView *)sub_78234();
}

- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin17DynamicButtonView *)sub_78498(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin17DynamicButtonView)initWithCoder:(id)a3
{
  return (_TtC20StoreDynamicUIPlugin17DynamicButtonView *)sub_7872C(a3);
}

- (BOOL)hasContent
{
  v2 = self;
  unsigned __int8 v3 = sub_78A70();

  return v3 & 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_78AC4();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_78C7C(width);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_78E4C();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_10AD80();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3) {
    sub_10ADB0();
  }
  uint64_t v4 = self;
  sub_77EA0();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  double v9 = self;
  double v10 = sub_791F8(width, height, a4, a5);
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_79268();
}

- (void).cxx_destruct
{
  uint64_t v3 = &self->AMSUICommonView_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin17DynamicButtonView_metrics];

  sub_79EA4((uint64_t)v3);
}

@end