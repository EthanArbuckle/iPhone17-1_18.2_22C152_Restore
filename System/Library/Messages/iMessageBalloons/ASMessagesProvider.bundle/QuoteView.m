@interface QuoteView
- (_TtC18ASMessagesProvider9QuoteView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider9QuoteView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation QuoteView

- (_TtC18ASMessagesProvider9QuoteView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider9QuoteView *)sub_3BBC78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider9QuoteView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9QuoteView_trailingQuote) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9QuoteView_creditLabel) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider9QuoteView_artworkAspectRatio;
  uint64_t v6 = sub_77AC00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9QuoteView_isFullWidthArtwork) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9QuoteView_artworkHasRoundedCorners) = 0;
  id v7 = a3;

  result = (_TtC18ASMessagesProvider9QuoteView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_3BC4F8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider9QuoteView_trailingQuote));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_AC320((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider9QuoteView_artworkAspectRatio);
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider9QuoteView_artworkView);
}

@end