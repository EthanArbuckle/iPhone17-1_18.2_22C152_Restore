@interface SystemApertureContainerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (NSString)accessibilityLabel;
- (_TtC15ConversationKit27SystemApertureContainerView)init;
- (_TtC15ConversationKit27SystemApertureContainerView)initWithCoder:(id)a3;
- (_TtC15ConversationKit27SystemApertureContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation SystemApertureContainerView

- (_TtC15ConversationKit27SystemApertureContainerView)init
{
  return (_TtC15ConversationKit27SystemApertureContainerView *)SystemApertureContainerView.init()();
}

- (_TtC15ConversationKit27SystemApertureContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  SystemApertureContainerView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  SystemApertureContainerView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = SystemApertureContainerView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = SystemApertureContainerView.intrinsicContentSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = self;
  double v8 = SystemApertureContainerView.sizeThatFits(_:for:)(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  double v3 = SystemApertureContainerView.accessibilityLabel.getter();
  uint64_t v5 = v4;

  if (v5)
  {
    double v6 = (void *)MEMORY[0x1C87730B0](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    double v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  double v7 = self;
  SystemApertureContainerView.accessibilityLabel.setter(v4, v6);
}

- (_TtC15ConversationKit27SystemApertureContainerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27SystemApertureContainerView_content));
}

@end