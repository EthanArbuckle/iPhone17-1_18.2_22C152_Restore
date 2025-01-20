@interface EditorialSearchResultCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityEditorialTypeLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)accessibilityAppEventStoryFormattedDateView;
- (_TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation EditorialSearchResultCollectionViewCell

- (_TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell *)sub_1004E106C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004E3C7C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004E17EC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1004E27CC();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityEditorialTypeLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_editorialTypeLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_subtitleLabel));
}

- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)accessibilityAppEventStoryFormattedDateView
{
  return (_TtC22SubscribePageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_appEventStoryFormattedDateView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_editorialTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_editorialIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_editorialArtworkView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_iconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_iconBackingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_artworkGrid));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension39EditorialSearchResultCollectionViewCell_appEventStoryFormattedDateView);
}

@end