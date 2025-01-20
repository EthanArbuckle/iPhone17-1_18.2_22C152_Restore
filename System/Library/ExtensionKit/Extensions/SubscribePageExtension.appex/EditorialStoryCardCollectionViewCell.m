@interface EditorialStoryCardCollectionViewCell
- (_TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation EditorialStoryCardCollectionViewCell

- (_TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell *)sub_10032AB10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10032BC70();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10032B538();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10032B9B0();
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36EditorialStoryCardCollectionViewCell_descriptionLabel));

  swift_unknownObjectRelease();
}

@end