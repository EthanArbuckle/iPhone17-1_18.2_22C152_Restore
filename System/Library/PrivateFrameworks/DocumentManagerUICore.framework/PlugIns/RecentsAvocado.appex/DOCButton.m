@interface DOCButton
- (_TtC14RecentsAvocado9DOCButton)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado9DOCButton)initWithFrame:(CGRect)a3;
@end

@implementation DOCButton

- (_TtC14RecentsAvocado9DOCButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocado9DOCButton_hoverEffectsAllowedIfInteractionDisabled) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocado9DOCButton__userInteractionStateDeterminesLayerHitTestState_override) = 2;
  id v4 = a3;

  result = (_TtC14RecentsAvocado9DOCButton *)sub_1004CF6B0();
  __break(1u);
  return result;
}

- (_TtC14RecentsAvocado9DOCButton)initWithFrame:(CGRect)a3
{
  return (_TtC14RecentsAvocado9DOCButton *)sub_1001D52FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end