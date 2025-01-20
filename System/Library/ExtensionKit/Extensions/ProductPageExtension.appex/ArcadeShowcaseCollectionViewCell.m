@interface ArcadeShowcaseCollectionViewCell
- (_TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArcadeShowcaseCollectionViewCell

- (_TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell *)sub_10026F95C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100272250();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002703AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell_iconGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell_wordmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell_offerButton));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension32ArcadeShowcaseCollectionViewCell_offerLabelPresenter, &qword_10094BAD0);
}

@end