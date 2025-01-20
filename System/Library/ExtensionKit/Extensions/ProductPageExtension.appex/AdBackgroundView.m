@interface AdBackgroundView
- (_TtC20ProductPageExtension16AdBackgroundView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension16AdBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation AdBackgroundView

- (_TtC20ProductPageExtension16AdBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension16AdBackgroundView *)sub_10038B1D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension16AdBackgroundView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension16AdBackgroundView_isBorderHidden) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension16AdBackgroundView *)sub_10077D120();
  __break(1u);
  return result;
}

@end