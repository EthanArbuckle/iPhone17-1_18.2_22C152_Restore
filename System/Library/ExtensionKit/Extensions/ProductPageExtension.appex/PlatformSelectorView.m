@interface PlatformSelectorView
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC20ProductPageExtension20PlatformSelectorView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension20PlatformSelectorView)initWithFrame:(CGRect)a3;
- (void)didTapSelectorView;
- (void)layoutSubviews;
@end

@implementation PlatformSelectorView

- (_TtC20ProductPageExtension20PlatformSelectorView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20PlatformSelectorView *)sub_10050E40C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20PlatformSelectorView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_numberOfBadges) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_didSelectHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC20ProductPageExtension20PlatformSelectorView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)didTapSelectorView
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_didSelectHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_1000194C0((uint64_t)v2);
    v2(v3);
    sub_1000194B0((uint64_t)v2);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10050EC30();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  uint64_t v3 = sub_10076F870();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_10076F860();
  id v8 = sub_10050F018((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_descriptionWithBadgesAsHeadingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_descriptionWithBadgesInlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_descriptionWithTwoColumnsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_accessoryImageView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension20PlatformSelectorView_didSelectHandler);

  sub_1000194B0(v3);
}

@end