@interface SmallGameCenterPlayerCollectionViewCell
- (_TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SmallGameCenterPlayerCollectionViewCell

- (_TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell *)sub_10015B3F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10015C560();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10015BDC0();
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell_alias));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell_displayName));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension39SmallGameCenterPlayerCollectionViewCell_separatorView);
}

@end