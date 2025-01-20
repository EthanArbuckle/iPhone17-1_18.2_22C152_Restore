@interface BaseCollectionViewCell
- (_TtC12GameCenterUI22BaseCollectionViewCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI22BaseCollectionViewCell)initWithFrame:(CGRect)a3;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
@end

@implementation BaseCollectionViewCell

- (_TtC12GameCenterUI22BaseCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI22BaseCollectionViewCell *)sub_1AF6DBE70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI22BaseCollectionViewCell)initWithCoder:(id)a3
{
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 0;
}

@end