@interface CondensedSearchEditorialBackgroundView
- (_TtC22SubscribePageExtension38CondensedSearchEditorialBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension38CondensedSearchEditorialBackgroundView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CondensedSearchEditorialBackgroundView

- (_TtC22SubscribePageExtension38CondensedSearchEditorialBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38CondensedSearchEditorialBackgroundView *)sub_10040720C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension38CondensedSearchEditorialBackgroundView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension38CondensedSearchEditorialBackgroundView_isBorderHidden) = 0;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension38CondensedSearchEditorialBackgroundView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10040748C(a3);
}

@end