@interface VideoCardView
- (_TtC22SubscribePageExtension13VideoCardView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension13VideoCardView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VideoCardView

- (_TtC22SubscribePageExtension13VideoCardView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension13VideoCardView *)sub_100615954(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension13VideoCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100617784();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100616294();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension13VideoCardView_overlayStyle;
  uint64_t v4 = sub_10075B910();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension13VideoCardView_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension13VideoCardView_lockupView));
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension13VideoCardView_metrics;

  sub_1000AA3C4((uint64_t)v5);
}

@end