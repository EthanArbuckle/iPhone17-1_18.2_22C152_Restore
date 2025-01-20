@interface VideoCardView
- (_TtC20ProductPageExtension13VideoCardView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension13VideoCardView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VideoCardView

- (_TtC20ProductPageExtension13VideoCardView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension13VideoCardView *)sub_1000BDE90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension13VideoCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000BFFCC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000BE9E4();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension13VideoCardView_overlayStyle;
  uint64_t v4 = sub_10076FE10();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension13VideoCardView_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension13VideoCardView_lockupView));
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension13VideoCardView_metrics;

  sub_1000C0100((uint64_t)v5);
}

@end