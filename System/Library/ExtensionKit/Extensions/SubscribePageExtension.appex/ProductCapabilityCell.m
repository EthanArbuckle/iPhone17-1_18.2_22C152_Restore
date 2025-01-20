@interface ProductCapabilityCell
- (UILabel)accessibilityCaptionLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension21ProductCapabilityCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension21ProductCapabilityCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProductCapabilityCell

- (_TtC22SubscribePageExtension21ProductCapabilityCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension21ProductCapabilityCell *)sub_1001CA724(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension21ProductCapabilityCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001CC110();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001CADC8();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001CB404();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001CB4F0(a3);
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_titleLabel));
}

- (UILabel)accessibilityCaptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_captionLabel));
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_iconPositioningView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ProductCapabilityCell_captionLabel));

  swift_release();
}

@end