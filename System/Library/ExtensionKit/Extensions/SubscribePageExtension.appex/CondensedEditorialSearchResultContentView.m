@interface CondensedEditorialSearchResultContentView
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeaderLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CondensedEditorialSearchResultContentView

- (_TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView *)CondensedEditorialSearchResultContentView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  CondensedEditorialSearchResultContentView.layoutSubviews()();
}

- (_TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100017E00();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  CondensedEditorialSearchResultContentView.traitCollectionDidChange(_:)(v9);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeaderLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_headerLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_titleLabel));
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_itemLayoutContext, (uint64_t *)&unk_100934630);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_viewButton));
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_configuration;
  uint64_t v4 = sub_100761ED0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_iconGrid));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_action));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension41CondensedEditorialSearchResultContentView_buttonHandler);

  sub_10001A4D0(v5);
}

@end