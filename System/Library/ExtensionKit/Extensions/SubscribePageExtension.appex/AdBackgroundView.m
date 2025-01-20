@interface AdBackgroundView
- (_TtC22SubscribePageExtension16AdBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension16AdBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation AdBackgroundView

- (_TtC22SubscribePageExtension16AdBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension16AdBackgroundView *)sub_1002D1BBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension16AdBackgroundView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension16AdBackgroundView_isBorderHidden) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension16AdBackgroundView *)sub_100768A40();
  __break(1u);
  return result;
}

@end