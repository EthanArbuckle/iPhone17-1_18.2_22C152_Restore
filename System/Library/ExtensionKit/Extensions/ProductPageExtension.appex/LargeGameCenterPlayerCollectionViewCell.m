@interface LargeGameCenterPlayerCollectionViewCell
- (_TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LargeGameCenterPlayerCollectionViewCell

- (_TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell *)sub_100212710(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002134B4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100212ED4();
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell_alias));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension39LargeGameCenterPlayerCollectionViewCell_displayName);
}

@end