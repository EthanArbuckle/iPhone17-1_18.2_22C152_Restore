@interface VideoCardView
- (_TtC18ASMessagesProvider13VideoCardView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider13VideoCardView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VideoCardView

- (_TtC18ASMessagesProvider13VideoCardView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider13VideoCardView *)sub_6C4AB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider13VideoCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_6C6A88();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_6C5604();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider13VideoCardView_overlayStyle;
  uint64_t v4 = sub_771910();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider13VideoCardView_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider13VideoCardView_lockupView));
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider13VideoCardView_metrics;

  sub_3A6524((uint64_t)v5);
}

@end