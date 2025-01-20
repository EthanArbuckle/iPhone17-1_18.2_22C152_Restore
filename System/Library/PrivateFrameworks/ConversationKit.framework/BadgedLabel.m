@interface BadgedLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15ConversationKit11BadgedLabel)initWithCoder:(id)a3;
- (_TtC15ConversationKit11BadgedLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BadgedLabel

- (_TtC15ConversationKit11BadgedLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  BadgedLabel.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  BadgedLabel.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = BadgedLabel.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (_TtC15ConversationKit11BadgedLabel)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit11BadgedLabel_badge);
}

@end