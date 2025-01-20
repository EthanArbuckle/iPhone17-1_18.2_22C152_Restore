@interface DOCButton
- (_TtC17RecentsAppPopover9DOCButton)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover9DOCButton)initWithFrame:(CGRect)a3;
@end

@implementation DOCButton

- (_TtC17RecentsAppPopover9DOCButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC17RecentsAppPopover9DOCButton_hoverEffectsAllowedIfInteractionDisabled) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC17RecentsAppPopover9DOCButton__userInteractionStateDeterminesLayerHitTestState_override) = 2;
  id v4 = a3;

  result = (_TtC17RecentsAppPopover9DOCButton *)sub_1004C0670();
  __break(1u);
  return result;
}

- (_TtC17RecentsAppPopover9DOCButton)initWithFrame:(CGRect)a3
{
  return (_TtC17RecentsAppPopover9DOCButton *)sub_100037DC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end