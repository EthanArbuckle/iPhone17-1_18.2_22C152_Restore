@interface TitledParagraphCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySecondarySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitytPrimarySubtitleLabel;
- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityExpandableTextView;
- (_TtC22SubscribePageExtension33TitledParagraphCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension33TitledParagraphCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TitledParagraphCollectionViewCell

- (_TtC22SubscribePageExtension33TitledParagraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension33TitledParagraphCollectionViewCell *)sub_100311814(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension33TitledParagraphCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100313D10();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003123D4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100313620((uint64_t)a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitytPrimarySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_primarySubtitleLabel));
}

- (_TtC22SubscribePageExtension18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC22SubscribePageExtension18ExpandableTextView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_bodyTextView);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySecondarySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_bodyTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_primarySubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_secondarySubtitleLabel));
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension33TitledParagraphCollectionViewCell_itemLayoutContext);

  swift_unknownObjectRelease();
}

@end