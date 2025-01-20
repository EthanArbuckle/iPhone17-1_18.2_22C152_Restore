@interface ProductPageLinkCollectionViewCell
- (UILabel)acccessibilityTextLabel;
- (_TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProductPageLinkCollectionViewCell

- (_TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell *)sub_5B23A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5B3D58();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(ProductPageLinkCollectionViewCell *)&v4 prepareForReuse];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell_iconImage];
  *(void *)&v2[OBJC_IVAR____TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell_iconImage] = 0;

  sub_5B2834();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5B2A00();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_5B340C(a3);
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = self;
  sub_5B3598();
}

- (UILabel)acccessibilityTextLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell_separatorView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider33ProductPageLinkCollectionViewCell_iconImage);
}

@end