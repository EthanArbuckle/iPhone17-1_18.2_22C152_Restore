@interface ProductPageLinkCollectionViewCell
- (UILabel)acccessibilityTextLabel;
- (_TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProductPageLinkCollectionViewCell

- (_TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell *)sub_1004F10E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004F2A90();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(ProductPageLinkCollectionViewCell *)&v4 prepareForReuse];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_iconImage];
  *(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_iconImage] = 0;

  sub_1004F156C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004F1738();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1004F2144(a3);
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = self;
  sub_1004F22D0();
}

- (UILabel)acccessibilityTextLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_separatorView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension33ProductPageLinkCollectionViewCell_iconImage);
}

@end