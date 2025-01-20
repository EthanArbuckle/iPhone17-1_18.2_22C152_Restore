@interface NotifyMeButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider14NotifyMeButton)init;
- (_TtC18ASMessagesProvider14NotifyMeButton)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider14NotifyMeButton)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)layoutSubviews;
@end

@implementation NotifyMeButton

- (_TtC18ASMessagesProvider14NotifyMeButton)init
{
  return (_TtC18ASMessagesProvider14NotifyMeButton *)sub_6AE660();
}

- (_TtC18ASMessagesProvider14NotifyMeButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider14NotifyMeButton_style) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider14NotifyMeButton_isActive) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider14NotifyMeButton_bellMicaPlayer) = 0;
  id v4 = a3;

  result = (_TtC18ASMessagesProvider14NotifyMeButton *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_6AF2E0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  sub_6AF8CC(width);
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
  sub_6AEE58();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider14NotifyMeButton_titleLabel));
}

- (_TtC18ASMessagesProvider14NotifyMeButton)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC18ASMessagesProvider14NotifyMeButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider14NotifyMeButton_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider14NotifyMeButton_bellView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider14NotifyMeButton_backgroundTintView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider14NotifyMeButton_backgroundBlurView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider14NotifyMeButton_bellMicaPlayer);
}

@end