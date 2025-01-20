@interface BrandedIconView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15ConversationKit15BrandedIconView)initWithCoder:(id)a3;
- (_TtC15ConversationKit15BrandedIconView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrandedIconView

- (_TtC15ConversationKit15BrandedIconView)initWithCoder:(id)a3
{
  return (_TtC15ConversationKit15BrandedIconView *)BrandedIconView.init(coder:)(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  BrandedIconView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = BrandedIconView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  BrandedIconView.intrinsicContentSize.getter();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (_TtC15ConversationKit15BrandedIconView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end