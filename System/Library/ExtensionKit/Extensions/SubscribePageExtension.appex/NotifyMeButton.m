@interface NotifyMeButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension14NotifyMeButton)init;
- (_TtC22SubscribePageExtension14NotifyMeButton)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension14NotifyMeButton)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation NotifyMeButton

- (_TtC22SubscribePageExtension14NotifyMeButton)init
{
  return (_TtC22SubscribePageExtension14NotifyMeButton *)sub_1006FBC34();
}

- (_TtC22SubscribePageExtension14NotifyMeButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_style) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_isActive) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_bellMicaPlayer) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension14NotifyMeButton *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006FC6E8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  sub_1006FCCD4(width);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(NotifyMeButton *)&v3 _dynamicUserInterfaceTraitDidChange];
  sub_1006FB180();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_titleLabel));
}

- (_TtC22SubscribePageExtension14NotifyMeButton)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC22SubscribePageExtension14NotifyMeButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_bellView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_backgroundTintView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_backgroundBlurView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension14NotifyMeButton_bellMicaPlayer);
}

@end