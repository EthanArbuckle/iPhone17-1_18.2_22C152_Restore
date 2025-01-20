@interface ReplyBubbleView
- (_TtC17ActivitySharingUI15ReplyBubbleView)initWithCoder:(id)a3;
- (_TtC17ActivitySharingUI15ReplyBubbleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ReplyBubbleView

- (_TtC17ActivitySharingUI15ReplyBubbleView)initWithFrame:(CGRect)a3
{
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate) = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC17ActivitySharingUI15ReplyBubbleView *)sub_234E0C000();
  __break(1u);
  return result;
}

- (_TtC17ActivitySharingUI15ReplyBubbleView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC17ActivitySharingUI15ReplyBubbleView *)sub_234E0C000();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  ReplyBubbleView.layoutSubviews()();
}

- (void).cxx_destruct
{
  sub_234E0659C((uint64_t)self + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_userMessageLabel));
  v3 = (char *)self + OBJC_IVAR____TtC17ActivitySharingUI15ReplyBubbleView_reply;
  sub_234DFA014((uint64_t)v3);
}

@end