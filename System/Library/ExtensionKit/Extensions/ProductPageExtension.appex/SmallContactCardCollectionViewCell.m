@interface SmallContactCardCollectionViewCell
- (_TtC20ProductPageExtension34SmallContactCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension34SmallContactCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SmallContactCardCollectionViewCell

- (_TtC20ProductPageExtension34SmallContactCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34SmallContactCardCollectionViewCell *)sub_100072050(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34SmallContactCardCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension34SmallContactCardCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension34SmallContactCardCollectionViewCell_recommendationsDataUpdateDelegate) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension34SmallContactCardCollectionViewCell_requestSentDataUpdateDelegate) = 0;
  id v7 = a3;

  result = (_TtC20ProductPageExtension34SmallContactCardCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(SmallContactCardCollectionViewCell *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension34SmallContactCardCollectionViewCell_smallPlayerCard];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(SmallContactCardCollectionViewCell *)&v3 prepareForReuse];
  sub_10076A840();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34SmallContactCardCollectionViewCell_smallPlayerCard));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension34SmallContactCardCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34SmallContactCardCollectionViewCell_recommendationsDataUpdateDelegate));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension34SmallContactCardCollectionViewCell_requestSentDataUpdateDelegate);
}

@end