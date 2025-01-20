@interface ActivityReplyBubbleView
- (_TtC17ActivitySharingUI23ActivityReplyBubbleView)initWithCoder:(id)a3;
- (_TtC17ActivitySharingUI23ActivityReplyBubbleView)initWithFrame:(CGRect)a3;
- (void)handleTapGesture:(id)a3;
- (void)layoutSubviews;
@end

@implementation ActivityReplyBubbleView

- (_TtC17ActivitySharingUI23ActivityReplyBubbleView)initWithFrame:(CGRect)a3
{
  result = (_TtC17ActivitySharingUI23ActivityReplyBubbleView *)sub_234E0C000();
  __break(1u);
  return result;
}

- (_TtC17ActivitySharingUI23ActivityReplyBubbleView)initWithCoder:(id)a3
{
  result = (_TtC17ActivitySharingUI23ActivityReplyBubbleView *)sub_234E0C000();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_234DFC66C();
}

- (void)handleTapGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234DFE48C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_separatorView));
  v3 = (char *)self + OBJC_IVAR____TtC17ActivitySharingUI23ActivityReplyBubbleView_activityRenderer;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end