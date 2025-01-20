@interface BaseCollectionReusableView
- (_TtC12GameCenterUI26BaseCollectionReusableView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI26BaseCollectionReusableView)initWithFrame:(CGRect)a3;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
@end

@implementation BaseCollectionReusableView

- (_TtC12GameCenterUI26BaseCollectionReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI26BaseCollectionReusableView *)sub_1AF404C7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI26BaseCollectionReusableView)initWithCoder:(id)a3
{
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 0;
}

@end