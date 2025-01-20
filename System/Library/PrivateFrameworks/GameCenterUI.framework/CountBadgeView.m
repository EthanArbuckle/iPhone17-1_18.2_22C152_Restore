@interface CountBadgeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSLayoutYAxisAnchor)firstBaselineAnchor;
- (_TtC12GameCenterUI14CountBadgeView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI14CountBadgeView)initWithFrame:(CGRect)a3;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityCountLabel;
- (void)layoutSubviews;
@end

@implementation CountBadgeView

- (_TtC12GameCenterUI14CountBadgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF792534();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1AF7925C0();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF79275C();
}

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  v2 = self;
  id v3 = sub_1AF792954();

  return (NSLayoutYAxisAnchor *)v3;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityCountLabel
{
  id v2 = sub_1AF7929C8();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (_TtC12GameCenterUI14CountBadgeView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end