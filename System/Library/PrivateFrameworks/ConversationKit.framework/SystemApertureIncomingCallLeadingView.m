@interface SystemApertureIncomingCallLeadingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (_TtC15ConversationKit37SystemApertureIncomingCallLeadingView)initWithCoder:(id)a3;
- (_TtC15ConversationKit37SystemApertureIncomingCallLeadingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SystemApertureIncomingCallLeadingView

- (_TtC15ConversationKit37SystemApertureIncomingCallLeadingView)initWithFrame:(CGRect)a3
{
}

- (_TtC15ConversationKit37SystemApertureIncomingCallLeadingView)initWithCoder:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  SystemApertureIncomingCallLeadingView.layoutSubviews()();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  CGSize v6 = SystemApertureIncomingCallLeadingView.sizeThatFits(_:)((CGSize)__PAIR128__(v5, v4));

  double width = v6.width;
  double height = v6.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  unint64_t v4 = self;
  SystemApertureIncomingCallLeadingView.sizeThatFits(_:for:)();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit37SystemApertureIncomingCallLeadingView_leadingView));
}

@end