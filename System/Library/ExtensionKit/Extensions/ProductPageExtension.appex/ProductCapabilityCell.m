@interface ProductCapabilityCell
- (UILabel)accessibilityCaptionLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension21ProductCapabilityCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension21ProductCapabilityCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProductCapabilityCell

- (_TtC20ProductPageExtension21ProductCapabilityCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension21ProductCapabilityCell *)sub_1003FD1BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension21ProductCapabilityCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003FEB04();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003FD860();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1003FCB8C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1003FDEE4(a3);
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_titleLabel));
}

- (UILabel)accessibilityCaptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_captionLabel));
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_iconPositioningView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ProductCapabilityCell_captionLabel));

  swift_release();
}

@end