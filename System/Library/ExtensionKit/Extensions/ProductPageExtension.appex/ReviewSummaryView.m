@interface ReviewSummaryView
- (_TtC20ProductPageExtension17ReviewSummaryView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension17ReviewSummaryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ReviewSummaryView

- (_TtC20ProductPageExtension17ReviewSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension17ReviewSummaryView *)sub_1003EFDE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension17ReviewSummaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003F12F0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003F070C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_subtitleLabel));
  swift_bridgeObjectRelease();
  swift_release();
  sub_1003F0DD4((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_subtitleArtworkAlignment);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension17ReviewSummaryView_previewContainer);
}

@end