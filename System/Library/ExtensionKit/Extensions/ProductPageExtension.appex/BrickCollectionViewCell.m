@interface BrickCollectionViewCell
- (_TtC20ProductPageExtension23BrickCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23BrickCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BrickCollectionViewCell

- (_TtC20ProductPageExtension23BrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23BrickCollectionViewCell *)sub_1003E62A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23BrickCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension23BrickCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension23BrickCollectionViewCell_shortDescriptionLabel) = 0;
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension23BrickCollectionViewCell_shortDescriptionLabelText);
  void *v7 = 0;
  v7[1] = 0;
  id v8 = a3;

  result = (_TtC20ProductPageExtension23BrickCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003E688C();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(BrickCollectionViewCell *)&v4 prepareForReuse];
  v3 = &v2[OBJC_IVAR____TtC20ProductPageExtension23BrickCollectionViewCell_shortDescriptionLabelText];
  *(void *)v3 = 0;
  *((void *)v3 + 1) = 0;
  swift_bridgeObjectRelease();
  sub_1003E6540();
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension23BrickCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23BrickCollectionViewCell_shortDescriptionLabel));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension23BrickCollectionViewCell_artworkView);
}

@end