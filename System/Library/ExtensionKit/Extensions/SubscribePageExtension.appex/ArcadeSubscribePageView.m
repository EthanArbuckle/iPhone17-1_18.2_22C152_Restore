@interface ArcadeSubscribePageView
- (_TtC22SubscribePageExtension23ArcadeSubscribePageView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension23ArcadeSubscribePageView)initWithFrame:(CGRect)a3;
- (void)didTapDismiss:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ArcadeSubscribePageView

- (_TtC22SubscribePageExtension23ArcadeSubscribePageView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension23ArcadeSubscribePageView_dismissActionBlock);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension23ArcadeSubscribePageView_headerView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension23ArcadeSubscribePageView_contentView) = 0;
  id v5 = a3;

  result = (_TtC22SubscribePageExtension23ArcadeSubscribePageView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10054CE74();
}

- (void)didTapDismiss:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100768710();
  swift_unknownObjectRelease();
  id v5 = *(void (**)(unsigned char *))((char *)&v4->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension23ArcadeSubscribePageView_dismissActionBlock);
  if (v5)
  {
    swift_retain();
    v5(v6);
    sub_10001A4D0((uint64_t)v5);
  }

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v6);
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ArcadeSubscribePageView *)&v6 traitCollectionDidChange:v4];
  objc_msgSend(v5, "setNeedsLayout", v6.receiver, v6.super_class);
}

- (_TtC22SubscribePageExtension23ArcadeSubscribePageView)initWithFrame:(CGRect)a3
{
  result = (_TtC22SubscribePageExtension23ArcadeSubscribePageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension23ArcadeSubscribePageView_dismissActionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23ArcadeSubscribePageView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23ArcadeSubscribePageView_detailsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23ArcadeSubscribePageView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23ArcadeSubscribePageView_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23ArcadeSubscribePageView_headerView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension23ArcadeSubscribePageView_contentView);
}

@end