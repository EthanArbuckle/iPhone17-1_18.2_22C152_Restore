@interface DOCButton
- (_TtC11SaveToFiles9DOCButton)initWithCoder:(id)a3;
- (_TtC11SaveToFiles9DOCButton)initWithFrame:(CGRect)a3;
@end

@implementation DOCButton

- (_TtC11SaveToFiles9DOCButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11SaveToFiles9DOCButton_hoverEffectsAllowedIfInteractionDisabled) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC11SaveToFiles9DOCButton__userInteractionStateDeterminesLayerHitTestState_override) = 2;
  id v4 = a3;

  result = (_TtC11SaveToFiles9DOCButton *)sub_1004D2DC0();
  __break(1u);
  return result;
}

- (_TtC11SaveToFiles9DOCButton)initWithFrame:(CGRect)a3
{
  return (_TtC11SaveToFiles9DOCButton *)sub_10031F33C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end