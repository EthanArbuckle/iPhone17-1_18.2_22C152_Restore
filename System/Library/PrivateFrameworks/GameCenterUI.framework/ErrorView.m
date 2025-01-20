@interface ErrorView
- (UIEdgeInsets)layoutMargins;
- (_TtC12GameCenterUI9ErrorView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI9ErrorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation ErrorView

- (_TtC12GameCenterUI9ErrorView)initWithCoder:(id)a3
{
}

- (UIEdgeInsets)layoutMargins
{
  v2 = self;
  sub_1AF61199C();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  double v3 = self;
  sub_1AF611A2C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF611A44();
}

- (_TtC12GameCenterUI9ErrorView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end