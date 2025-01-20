@interface DOCButton
- (_TtC33com_apple_DocumentManager_Service9DOCButton)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_Service9DOCButton)initWithFrame:(CGRect)a3;
@end

@implementation DOCButton

- (_TtC33com_apple_DocumentManager_Service9DOCButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service9DOCButton_hoverEffectsAllowedIfInteractionDisabled) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service9DOCButton__userInteractionStateDeterminesLayerHitTestState_override) = 2;
  id v4 = a3;

  result = (_TtC33com_apple_DocumentManager_Service9DOCButton *)sub_1004CEE70();
  __break(1u);
  return result;
}

- (_TtC33com_apple_DocumentManager_Service9DOCButton)initWithFrame:(CGRect)a3
{
  return (_TtC33com_apple_DocumentManager_Service9DOCButton *)sub_1004B8174(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end