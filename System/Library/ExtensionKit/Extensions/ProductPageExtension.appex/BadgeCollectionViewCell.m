@interface BadgeCollectionViewCell
- (_TtC20ProductPageExtension23BadgeCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension23BadgeCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BadgeCollectionViewCell

- (_TtC20ProductPageExtension23BadgeCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension23BadgeCollectionViewCell *)sub_10021BA54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension23BadgeCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension23BadgeCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC20ProductPageExtension23BadgeCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10021BE58();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(BadgeCollectionViewCell *)&v3 prepareForReuse];
  sub_1004FD1C8();
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension23BadgeCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23BadgeCollectionViewCell_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23BadgeCollectionViewCell_verticalSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension23BadgeCollectionViewCell_topSeparatorView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension23BadgeCollectionViewCell_bottomSeparatorView);
}

@end