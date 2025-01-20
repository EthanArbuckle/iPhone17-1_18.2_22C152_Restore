@interface ProductRatingsLegacyCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityProgressBarViews;
- (NSArray)accessibilityStarViews;
- (UILabel)accessibilityCurrentRatingLabel;
- (UILabel)accessibilityOutOfRatingLabel;
- (UILabel)accessibilityRatingCountLabel;
- (_TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation ProductRatingsLegacyCollectionViewCell

- (_TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell *)sub_100350BD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10076FC20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_pageTraits) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_pageGrid;
  uint64_t v8 = sub_1007789C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_hasRatings) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_noRatingsView) = 0;
  id v9 = a3;

  result = (_TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100352270();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1003526C0();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = self;
  sub_100352BC8();
}

- (UILabel)accessibilityCurrentRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_currentRatingLabel));
}

- (UILabel)accessibilityOutOfRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_outOfRatingLabel));
}

- (UILabel)accessibilityRatingCountLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_ratingCountLabel));
}

- (NSArray)accessibilityStarViews
{
  type metadata accessor for RatingView();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSArray)accessibilityProgressBarViews
{
  sub_100019840(0, &qword_10095CB30);
  swift_bridgeObjectRetain();
  v2.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_currentRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_outOfRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_ratingCountLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_pageGrid, &qword_100955830);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension38ProductRatingsLegacyCollectionViewCell_noRatingsView);
}

@end