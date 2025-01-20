@interface ChartOrCategoryBrickCollectionViewCell
- (_TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ChartOrCategoryBrickCollectionViewCell

- (_TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell *)sub_100162870(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100166820();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100163044();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100162540();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_debugPreferredArtworkSafeArea));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_debugActualArtworkSafeArea));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_titleLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38ChartOrCategoryBrickCollectionViewCell_brickContext, &qword_100953890);
}

@end