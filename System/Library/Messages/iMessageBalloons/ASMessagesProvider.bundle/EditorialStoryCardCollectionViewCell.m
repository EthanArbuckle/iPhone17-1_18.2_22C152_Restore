@interface EditorialStoryCardCollectionViewCell
- (_TtC18ASMessagesProvider36EditorialStoryCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider36EditorialStoryCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation EditorialStoryCardCollectionViewCell

- (_TtC18ASMessagesProvider36EditorialStoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider36EditorialStoryCardCollectionViewCell *)sub_28CA08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider36EditorialStoryCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_28DB68();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_28D430();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_28D8A8();
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider36EditorialStoryCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36EditorialStoryCardCollectionViewCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36EditorialStoryCardCollectionViewCell_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36EditorialStoryCardCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36EditorialStoryCardCollectionViewCell_descriptionLabel));

  swift_unknownObjectRelease();
}

@end