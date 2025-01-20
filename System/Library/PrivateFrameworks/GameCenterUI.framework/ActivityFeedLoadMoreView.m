@interface ActivityFeedLoadMoreView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI24ActivityFeedLoadMoreView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI24ActivityFeedLoadMoreView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ActivityFeedLoadMoreView

- (_TtC12GameCenterUI24ActivityFeedLoadMoreView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI24ActivityFeedLoadMoreView *)sub_1AF49D00C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI24ActivityFeedLoadMoreView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF49D158();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF49D200();
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
  sub_1AF49D298();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24ActivityFeedLoadMoreView_loadingIndicator));
}

@end