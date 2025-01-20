@interface EditorialSearchResultContentView
- (_TtC18ASMessagesProvider29AppPromotionFormattedDateView)accessibilityAppEventStoryFormattedDateView;
- (_TtC18ASMessagesProvider32EditorialSearchResultContentView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider32EditorialSearchResultContentView)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityEditorialTypeLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EditorialSearchResultContentView

- (_TtC18ASMessagesProvider32EditorialSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider32EditorialSearchResultContentView *)sub_25FD04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider32EditorialSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_265C30();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_260354();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2613B4(a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityEditorialTypeLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_editorialTypeLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySummaryLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_subtitleLabel));
}

- (_TtC18ASMessagesProvider29AppPromotionFormattedDateView)accessibilityAppEventStoryFormattedDateView
{
  return (_TtC18ASMessagesProvider29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_appEventStoryFormattedDateView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_editorialTypeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView____lazy_storage___editorialIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_editorialArtworkView));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_iconArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_iconBackingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_artworkGrid));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider32EditorialSearchResultContentView_appEventStoryFormattedDateView);
}

@end