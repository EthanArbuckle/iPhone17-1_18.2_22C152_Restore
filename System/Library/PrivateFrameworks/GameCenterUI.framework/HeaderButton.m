@interface HeaderButton
- (_TtC12GameCenterUI12HeaderButton)init;
- (_TtC12GameCenterUI12HeaderButton)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HeaderButton

- (_TtC12GameCenterUI12HeaderButton)init
{
  return (_TtC12GameCenterUI12HeaderButton *)sub_1AF78BBF0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF78BD64(a3);
}

- (_TtC12GameCenterUI12HeaderButton)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI12HeaderButton *)sub_1AF78BEBC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end