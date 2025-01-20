@interface IncomingCallCombinedSubtitleBadgeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView)initWithCoder:(id)a3;
- (_TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IncomingCallCombinedSubtitleBadgeView

- (_TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  IncomingCallCombinedSubtitleBadgeView.init(coder:)();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = IncomingCallCombinedSubtitleBadgeView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  IncomingCallCombinedSubtitleBadgeView.layoutSubviews()();
}

- (_TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView_brandedIcon));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit37IncomingCallCombinedSubtitleBadgeView_multiSimBadge);
}

@end