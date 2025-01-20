@interface EditorialQuoteCollectionViewCell
- (_TtC18ASMessagesProvider32EditorialQuoteCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider32EditorialQuoteCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EditorialQuoteCollectionViewCell

- (_TtC18ASMessagesProvider32EditorialQuoteCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider32EditorialQuoteCollectionViewCell *)sub_3958C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider32EditorialQuoteCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider32EditorialQuoteCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_771720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC18ASMessagesProvider32EditorialQuoteCollectionViewCell *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_395E74();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_3961D8((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32EditorialQuoteCollectionViewCell_quoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32EditorialQuoteCollectionViewCell_attributionLabel));
  v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider32EditorialQuoteCollectionViewCell_itemLayoutContext;

  sub_411F8((uint64_t)v3);
}

@end