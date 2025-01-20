@interface TitledParagraphCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySecondarySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitytPrimarySubtitleLabel;
- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityExpandableTextView;
- (_TtC20ProductPageExtension33TitledParagraphCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension33TitledParagraphCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TitledParagraphCollectionViewCell

- (_TtC20ProductPageExtension33TitledParagraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension33TitledParagraphCollectionViewCell *)sub_1003AD868(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension33TitledParagraphCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003AF474();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003AE428();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1003AED84((uint64_t)a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitytPrimarySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_primarySubtitleLabel));
}

- (_TtC20ProductPageExtension18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC20ProductPageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_bodyTextView);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySecondarySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_primarySubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension33TitledParagraphCollectionViewCell_itemLayoutContext);

  swift_unknownObjectRelease();
}

@end