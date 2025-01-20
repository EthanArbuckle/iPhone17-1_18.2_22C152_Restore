@interface ProductCapabilityCell
- (UILabel)accessibilityCaptionLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC18ASMessagesProvider21ProductCapabilityCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider21ProductCapabilityCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProductCapabilityCell

- (_TtC18ASMessagesProvider21ProductCapabilityCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider21ProductCapabilityCell *)sub_37D434(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider21ProductCapabilityCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_37ED7C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_37DAD8();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_37CE04();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_37E15C(a3);
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18ASMessagesProvider21ProductCapabilityCell_titleLabel));
}

- (UILabel)accessibilityCaptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC18ASMessagesProvider21ProductCapabilityCell_captionLabel));
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider21ProductCapabilityCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21ProductCapabilityCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21ProductCapabilityCell_iconPositioningView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21ProductCapabilityCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider21ProductCapabilityCell_captionLabel));

  swift_release();
}

@end