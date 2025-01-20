@interface CallControlsFullScreenStatusView
- (_TtC15ConversationKit32CallControlsFullScreenStatusView)initWithCoder:(id)a3;
- (_TtC15ConversationKit32CallControlsFullScreenStatusView)initWithFrame:(CGRect)a3;
@end

@implementation CallControlsFullScreenStatusView

- (_TtC15ConversationKit32CallControlsFullScreenStatusView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit32CallControlsFullScreenStatusView *)CallControlsFullScreenStatusView.init(frame:)();
}

- (_TtC15ConversationKit32CallControlsFullScreenStatusView)initWithCoder:(id)a3
{
  id v3 = a3;
  CallControlsFullScreenStatusView.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32CallControlsFullScreenStatusView____lazy_storage___effectsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32CallControlsFullScreenStatusView____lazy_storage___textLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32CallControlsFullScreenStatusView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32CallControlsFullScreenStatusView____lazy_storage___subtitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit32CallControlsFullScreenStatusView____lazy_storage___textContainer);
}

@end