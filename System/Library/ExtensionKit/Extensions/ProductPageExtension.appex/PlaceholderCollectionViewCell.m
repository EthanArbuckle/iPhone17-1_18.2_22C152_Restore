@interface PlaceholderCollectionViewCell
- (_TtC20ProductPageExtension29PlaceholderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension29PlaceholderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PlaceholderCollectionViewCell

- (_TtC20ProductPageExtension29PlaceholderCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29PlaceholderCollectionViewCell *)sub_10055ADF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension29PlaceholderCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension29PlaceholderCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC20ProductPageExtension29PlaceholderCollectionViewCell_placeholderView;
  id v8 = objc_allocWithZone((Class)UIView);
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)[v8 init];

  result = (_TtC20ProductPageExtension29PlaceholderCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(PlaceholderCollectionViewCell *)&v13 layoutSubviews];
  id v3 = *(id *)&v2[OBJC_IVAR____TtC20ProductPageExtension29PlaceholderCollectionViewCell_placeholderView];
  id v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  sub_1000A7A80();
  sub_100770A80();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension29PlaceholderCollectionViewCell_itemLayoutContext);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension29PlaceholderCollectionViewCell_placeholderView);
}

@end