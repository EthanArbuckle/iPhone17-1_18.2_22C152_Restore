@interface EditorialSearchResultContentView
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityEditorialTypeLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)accessibilityAppEventStoryFormattedDateView;
- (_TtC20ProductPageExtension32EditorialSearchResultContentView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension32EditorialSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EditorialSearchResultContentView

- (_TtC20ProductPageExtension32EditorialSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension32EditorialSearchResultContentView *)sub_100237928(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension32EditorialSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10023D7FC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100237F78();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100238FD8(a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityEditorialTypeLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_editorialTypeLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_subtitleLabel));
}

- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)accessibilityAppEventStoryFormattedDateView
{
  return (_TtC20ProductPageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_appEventStoryFormattedDateView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_editorialTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView____lazy_storage___editorialIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_editorialArtworkView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_iconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_iconBackingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_artworkGrid));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension32EditorialSearchResultContentView_appEventStoryFormattedDateView);
}

@end