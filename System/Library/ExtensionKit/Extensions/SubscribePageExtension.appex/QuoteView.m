@interface QuoteView
- (_TtC22SubscribePageExtension9QuoteView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension9QuoteView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation QuoteView

- (_TtC22SubscribePageExtension9QuoteView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension9QuoteView *)sub_1001832C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension9QuoteView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_trailingQuote) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_creditLabel) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_artworkAspectRatio;
  uint64_t v6 = sub_100764B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_isFullWidthArtwork) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_artworkHasRoundedCorners) = 0;
  id v7 = a3;

  result = (_TtC22SubscribePageExtension9QuoteView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100183B40();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_leadingQuote));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_trailingQuote));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_quoteLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_creditLabel));
  sub_1000B17DC((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_artworkAspectRatio);
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension9QuoteView_artworkView);
}

@end