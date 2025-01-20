@interface PlatformSelectorView
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (_TtC22SubscribePageExtension20PlatformSelectorView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20PlatformSelectorView)initWithFrame:(CGRect)a3;
- (void)didTapSelectorView;
- (void)layoutSubviews;
@end

@implementation PlatformSelectorView

- (_TtC22SubscribePageExtension20PlatformSelectorView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20PlatformSelectorView *)sub_10040A9E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20PlatformSelectorView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension20PlatformSelectorView_numberOfBadges) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC22SubscribePageExtension20PlatformSelectorView_didSelectHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC22SubscribePageExtension20PlatformSelectorView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)didTapSelectorView
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension20PlatformSelectorView_didSelectHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_10001A4E0((uint64_t)v2);
    v2(v3);
    sub_10001A4D0((uint64_t)v2);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10040B208();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  uint64_t v3 = sub_10075B370();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_10075B360();
  id v9 = sub_10040B5F0((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20PlatformSelectorView_descriptionWithBadgesAsHeadingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20PlatformSelectorView_descriptionWithBadgesInlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20PlatformSelectorView_descriptionWithTwoColumnsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20PlatformSelectorView_accessoryImageView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension20PlatformSelectorView_didSelectHandler);

  sub_10001A4D0(v3);
}

@end