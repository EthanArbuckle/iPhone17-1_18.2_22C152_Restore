@interface DOCButton
- (_TtC18DocumentAppIntents9DOCButton)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents9DOCButton)initWithFrame:(CGRect)a3;
@end

@implementation DOCButton

- (_TtC18DocumentAppIntents9DOCButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18DocumentAppIntents9DOCButton_hoverEffectsAllowedIfInteractionDisabled) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18DocumentAppIntents9DOCButton__userInteractionStateDeterminesLayerHitTestState_override) = 2;
  id v4 = a3;

  result = (_TtC18DocumentAppIntents9DOCButton *)sub_1004F6110();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntents9DOCButton)initWithFrame:(CGRect)a3
{
  return (_TtC18DocumentAppIntents9DOCButton *)sub_1001DB464(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end