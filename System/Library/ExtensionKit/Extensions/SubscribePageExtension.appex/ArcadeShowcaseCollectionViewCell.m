@interface ArcadeShowcaseCollectionViewCell
- (_TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeShowcaseCollectionViewCell

- (_TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell *)sub_10021A094(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10021C988();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10021AAE4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell_iconGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell_wordmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell_offerButton));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension32ArcadeShowcaseCollectionViewCell_offerLabelPresenter, &qword_1009360F0);
}

@end