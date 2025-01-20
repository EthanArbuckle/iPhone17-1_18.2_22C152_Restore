@interface QuoteView
- (_TtC20ProductPageExtension9QuoteView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension9QuoteView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation QuoteView

- (_TtC20ProductPageExtension9QuoteView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension9QuoteView *)sub_1003CC0D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension9QuoteView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_trailingQuote) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_creditLabel) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_artworkAspectRatio;
  uint64_t v6 = sub_1007791F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_isFullWidthArtwork) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_artworkHasRoundedCorners) = 0;
  id v7 = a3;

  result = (_TtC20ProductPageExtension9QuoteView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003CC954();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_leadingQuote));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_trailingQuote));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_creditLabel));
  sub_10023E2C4((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_artworkAspectRatio);
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension9QuoteView_artworkView);
}

@end