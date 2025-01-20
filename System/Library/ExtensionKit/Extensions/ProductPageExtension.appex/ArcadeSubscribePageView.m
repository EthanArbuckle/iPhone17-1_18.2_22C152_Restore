@interface ArcadeSubscribePageView
- (_TtC20ProductPageExtension23ArcadeSubscribePageView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23ArcadeSubscribePageView)initWithFrame:(CGRect)a3;
- (void)didTapDismiss:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ArcadeSubscribePageView

- (_TtC20ProductPageExtension23ArcadeSubscribePageView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension23ArcadeSubscribePageView_dismissActionBlock);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension23ArcadeSubscribePageView_headerView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension23ArcadeSubscribePageView_contentView) = 0;
  id v5 = a3;

  result = (_TtC20ProductPageExtension23ArcadeSubscribePageView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100204E58();
}

- (void)didTapDismiss:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_10077CDF0();
  swift_unknownObjectRelease();
  id v5 = *(void (**)(unsigned char *))((char *)&v4->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension23ArcadeSubscribePageView_dismissActionBlock);
  if (v5)
  {
    swift_retain();
    v5(v6);
    sub_1000194B0((uint64_t)v5);
  }

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v6);
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

- (_TtC20ProductPageExtension23ArcadeSubscribePageView)initWithFrame:(CGRect)a3
{
  result = (_TtC20ProductPageExtension23ArcadeSubscribePageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension23ArcadeSubscribePageView_dismissActionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23ArcadeSubscribePageView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23ArcadeSubscribePageView_detailsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23ArcadeSubscribePageView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23ArcadeSubscribePageView_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23ArcadeSubscribePageView_headerView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension23ArcadeSubscribePageView_contentView);
}

@end