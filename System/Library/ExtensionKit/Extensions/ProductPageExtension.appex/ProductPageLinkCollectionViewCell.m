@interface ProductPageLinkCollectionViewCell
- (UILabel)acccessibilityTextLabel;
- (_TtC20ProductPageExtension33ProductPageLinkCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension33ProductPageLinkCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProductPageLinkCollectionViewCell

- (_TtC20ProductPageExtension33ProductPageLinkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension33ProductPageLinkCollectionViewCell *)sub_100332134(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension33ProductPageLinkCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100333AE4();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(ProductPageLinkCollectionViewCell *)&v4 prepareForReuse];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_iconImage];
  *(void *)&v2[OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_iconImage] = 0;

  sub_1003325C0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10033278C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100333198(a3);
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = self;
  sub_100333324();
}

- (UILabel)acccessibilityTextLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_separatorView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension33ProductPageLinkCollectionViewCell_iconImage);
}

@end