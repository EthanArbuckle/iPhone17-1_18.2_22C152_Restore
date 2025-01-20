@interface CloseButton
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI11CloseButton)init;
- (_TtC12GameCenterUI11CloseButton)initWithFrame:(CGRect)a3;
@end

@implementation CloseButton

- (_TtC12GameCenterUI11CloseButton)init
{
  return (_TtC12GameCenterUI11CloseButton *)CloseButton.init()();
}

- (CGSize)intrinsicContentSize
{
  double v2 = 29.0;
  double v3 = 29.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  sub_1AF4A0A4C();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC12GameCenterUI11CloseButton)initWithFrame:(CGRect)a3
{
}

@end