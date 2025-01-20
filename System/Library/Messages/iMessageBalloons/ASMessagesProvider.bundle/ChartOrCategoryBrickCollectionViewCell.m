@interface ChartOrCategoryBrickCollectionViewCell
- (_TtC18ASMessagesProvider38ChartOrCategoryBrickCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ChartOrCategoryBrickCollectionViewCell

- (_TtC18ASMessagesProvider38ChartOrCategoryBrickCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider38ChartOrCategoryBrickCollectionViewCell *)sub_557930(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider38ChartOrCategoryBrickCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_55B8D4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_558104();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_557600();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38ChartOrCategoryBrickCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38ChartOrCategoryBrickCollectionViewCell_badgeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38ChartOrCategoryBrickCollectionViewCell_debugPreferredArtworkSafeArea));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38ChartOrCategoryBrickCollectionViewCell_debugActualArtworkSafeArea));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38ChartOrCategoryBrickCollectionViewCell_titleLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider38ChartOrCategoryBrickCollectionViewCell_brickContext, &qword_96E360);
}

@end