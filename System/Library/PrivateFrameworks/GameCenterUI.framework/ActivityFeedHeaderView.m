@interface ActivityFeedHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI22ActivityFeedHeaderView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI22ActivityFeedHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tapToRadarButton;
@end

@implementation ActivityFeedHeaderView

- (_TtC12GameCenterUI22ActivityFeedHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI22ActivityFeedHeaderView *)sub_1AF537FE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI22ActivityFeedHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF538454();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF5384FC();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF538568();
}

- (void)tapToRadarButton
{
  v2 = self;
  sub_1AF538A0C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22ActivityFeedHeaderView_headerLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI22ActivityFeedHeaderView_radarButton);
}

@end