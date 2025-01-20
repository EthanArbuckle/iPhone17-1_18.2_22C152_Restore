@interface SmallSearchLockupView
- (BOOL)accessibilityIsAd;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIButton)accessibilityAdButton;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityRatingCountLabel;
- (_TtC20ProductPageExtension10RatingView)accessibilitytUserRatingView;
- (_TtC20ProductPageExtension18MetadataRibbonView)accessibilityMetadataRibbonView;
- (_TtC20ProductPageExtension20SearchTagsRibbonView)accessibilitySearchTagsRibbonView;
- (_TtC20ProductPageExtension21SmallSearchLockupView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SmallSearchLockupView

- (_TtC20ProductPageExtension21SmallSearchLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)sub_10052A83C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1005292A8();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10052B684();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_10052BD38((uint64_t)a4, x, y);

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_10052BE8C(a3);
}

- (_TtC20ProductPageExtension10RatingView)accessibilitytUserRatingView
{
  return (_TtC20ProductPageExtension10RatingView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_userRatingView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityRatingCountLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_ratingCountLabel));
}

- (BOOL)accessibilityIsAd
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_isDisplayingSearchAd);
}

- (UIButton)accessibilityAdButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_searchAdTransparencyButton));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_descriptionLabel));
}

- (_TtC20ProductPageExtension18MetadataRibbonView)accessibilityMetadataRibbonView
{
  return (_TtC20ProductPageExtension18MetadataRibbonView *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_metadataRibbonView);
}

- (_TtC20ProductPageExtension20SearchTagsRibbonView)accessibilitySearchTagsRibbonView
{
  return (_TtC20ProductPageExtension20SearchTagsRibbonView *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_searchTagsRibbonView);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_metadataTextSpace;
  uint64_t v4 = sub_1007797E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_userRatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_ratingCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_editorsChoiceView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_metadataRibbonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_searchTagsRibbonView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_searchAdTransparencyButton));
  swift_release();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension21SmallSearchLockupView_impressionsUpdateBlock);

  sub_1000194B0(v5);
}

@end