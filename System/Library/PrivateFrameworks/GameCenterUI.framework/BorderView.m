@interface BorderView
- (BOOL)clipsToBounds;
- (UIColor)backgroundColor;
- (_TtC12GameCenterUI10BorderView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI10BorderView)initWithFrame:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setClipsToBounds:(BOOL)a3;
@end

@implementation BorderView

- (_TtC12GameCenterUI10BorderView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI10BorderView *)sub_1AF53FCBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI10BorderView)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI10BorderView *)sub_1AF53FD68(a3);
}

- (UIColor)backgroundColor
{
  v2 = self;
  id v3 = sub_1AF4D7190();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF53FE84(a3);
}

- (BOOL)clipsToBounds
{
  return 0;
}

- (void)setClipsToBounds:(BOOL)a3
{
  id v3 = self;
  sub_1AF53FF9C();
}

@end