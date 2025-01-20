@interface PlatformSelectorView
- (_TtC18ASMessagesProvider20PlatformSelectorView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider20PlatformSelectorView)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel;
- (void)didTapSelectorView;
- (void)layoutSubviews;
@end

@implementation PlatformSelectorView

- (_TtC18ASMessagesProvider20PlatformSelectorView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider20PlatformSelectorView *)sub_4CC828(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider20PlatformSelectorView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider20PlatformSelectorView_numberOfBadges) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18ASMessagesProvider20PlatformSelectorView_didSelectHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC18ASMessagesProvider20PlatformSelectorView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)didTapSelectorView
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC18ASMessagesProvider20PlatformSelectorView_didSelectHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_13318((uint64_t)v2);
    v2(v3);
    sub_13308((uint64_t)v2);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4CD04C();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDescriptionLabel
{
  uint64_t v3 = sub_771370();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_771360();
  id v8 = sub_4CD434((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20PlatformSelectorView_descriptionWithBadgesAsHeadingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20PlatformSelectorView_descriptionWithBadgesInlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20PlatformSelectorView_descriptionWithTwoColumnsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider20PlatformSelectorView_accessoryImageView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider20PlatformSelectorView_didSelectHandler);

  sub_13308(v3);
}

@end