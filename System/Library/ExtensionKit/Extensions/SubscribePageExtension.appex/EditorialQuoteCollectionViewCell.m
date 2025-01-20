@interface EditorialQuoteCollectionViewCell
- (_TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EditorialQuoteCollectionViewCell

- (_TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell *)sub_10032FED8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100330488();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1003307EC((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell_quoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell_attributionLabel));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32EditorialQuoteCollectionViewCell_itemLayoutContext;

  sub_10002D20C((uint64_t)v3);
}

@end