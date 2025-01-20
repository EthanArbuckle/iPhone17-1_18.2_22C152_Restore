@interface CondensedSearchEditorialBackgroundView
- (_TtC20ProductPageExtension38CondensedSearchEditorialBackgroundView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension38CondensedSearchEditorialBackgroundView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CondensedSearchEditorialBackgroundView

- (_TtC20ProductPageExtension38CondensedSearchEditorialBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension38CondensedSearchEditorialBackgroundView *)sub_1004042B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension38CondensedSearchEditorialBackgroundView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension38CondensedSearchEditorialBackgroundView_isBorderHidden) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension38CondensedSearchEditorialBackgroundView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100404530(a3);
}

@end