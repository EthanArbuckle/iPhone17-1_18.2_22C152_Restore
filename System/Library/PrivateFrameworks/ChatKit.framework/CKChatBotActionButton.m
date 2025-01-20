@interface CKChatBotActionButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKChatBotActionButton)initWithActions:(id)a3 delegate:(id)a4 backgroundStyle:(int64_t)a5 showTitle:(BOOL)a6;
- (CKChatBotActionButton)initWithCoder:(id)a3;
- (CKChatBotActionButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)touchedButton;
@end

@implementation CKChatBotActionButton

- (CKChatBotActionButton)initWithActions:(id)a3 delegate:(id)a4 backgroundStyle:(int64_t)a5 showTitle:(BOOL)a6
{
  BOOL v6 = a6;
  sub_18F7B9CE0();
  uint64_t v10 = sub_18F7B99C0();
  swift_getObjectType();
  swift_unknownObjectRetain();
  v11 = (CKChatBotActionButton *)sub_18F69F5D4(v10, (uint64_t)a4, (id)a5, v6, (char *)self);
  swift_unknownObjectRelease();
  return v11;
}

- (CKChatBotActionButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKChatBotActionButton_iconView) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (CKChatBotActionButton *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)touchedButton
{
  v2 = self;
  sub_18F69EB88();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F69EF1C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_18F69F12C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CKChatBotActionButton)initWithFrame:(CGRect)a3
{
  CGSize result = (CKChatBotActionButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR___CKChatBotActionButton_delegate;

  sub_18F4C25DC((uint64_t)v3);
}

@end