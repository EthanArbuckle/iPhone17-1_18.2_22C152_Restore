@interface CallControlsStatusView
- (_TtC15ConversationKit22CallControlsStatusView)initWithCoder:(id)a3;
- (_TtC15ConversationKit22CallControlsStatusView)initWithFrame:(CGRect)a3;
@end

@implementation CallControlsStatusView

- (_TtC15ConversationKit22CallControlsStatusView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit22CallControlsStatusView *)CallControlsStatusView.init(frame:)();
}

- (_TtC15ConversationKit22CallControlsStatusView)initWithCoder:(id)a3
{
  id v3 = a3;
  CallControlsStatusView.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22CallControlsStatusView____lazy_storage___container));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22CallControlsStatusView____lazy_storage___leadingContainerWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22CallControlsStatusView____lazy_storage___leadingContainerHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22CallControlsStatusView____lazy_storage___leadingContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22CallControlsStatusView_customView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22CallControlsStatusView____lazy_storage___imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22CallControlsStatusView____lazy_storage___imageViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22CallControlsStatusView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22CallControlsStatusView____lazy_storage___labelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit22CallControlsStatusView____lazy_storage___titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit22CallControlsStatusView____lazy_storage___subtitleLabel);
}

@end