@interface EditorialStoryCardCollectionViewCell
- (_TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation EditorialStoryCardCollectionViewCell

- (_TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell *)sub_100233890(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002349F0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002342B8();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100234730();
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36EditorialStoryCardCollectionViewCell_descriptionLabel));

  swift_unknownObjectRelease();
}

@end