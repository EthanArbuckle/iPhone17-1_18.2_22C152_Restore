@interface ProductRatingsLegacyCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityProgressBarViews;
- (NSArray)accessibilityStarViews;
- (UILabel)accessibilityCurrentRatingLabel;
- (UILabel)accessibilityOutOfRatingLabel;
- (UILabel)accessibilityRatingCountLabel;
- (_TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation ProductRatingsLegacyCollectionViewCell

- (_TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell *)sub_1002B259C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_itemLayoutContext;
  uint64_t v6 = sub_10075B720();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_pageTraits) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_pageGrid;
  uint64_t v8 = sub_100764370();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_hasRatings) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_noRatingsView) = 0;
  id v9 = a3;

  result = (_TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1002B3C38();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1002B4088();
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
  sub_1002B4590();
}

- (UILabel)accessibilityCurrentRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_currentRatingLabel));
}

- (UILabel)accessibilityOutOfRatingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_outOfRatingLabel));
}

- (UILabel)accessibilityRatingCountLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_ratingCountLabel));
}

- (NSArray)accessibilityStarViews
{
  type metadata accessor for RatingView();
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1007677F0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSArray)accessibilityProgressBarViews
{
  sub_10001A860(0, &qword_100941BF0);
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1007677F0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_currentRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_outOfRatingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_ratingCountLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_pageGrid, &qword_100934590);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension38ProductRatingsLegacyCollectionViewCell_noRatingsView);
}

@end