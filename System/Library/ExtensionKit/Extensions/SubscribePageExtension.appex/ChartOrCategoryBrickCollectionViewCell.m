@interface ChartOrCategoryBrickCollectionViewCell
- (_TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ChartOrCategoryBrickCollectionViewCell

- (_TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell *)sub_1000ACA54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000B0610();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000AD228();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1000AF214();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_debugPreferredArtworkSafeArea));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_debugActualArtworkSafeArea));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_titleLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38ChartOrCategoryBrickCollectionViewCell_brickContext, &qword_100936EC8);
}

@end