@interface ActivityFeedBaseView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI20ActivityFeedBaseView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI20ActivityFeedBaseView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ActivityFeedBaseView

- (_TtC12GameCenterUI20ActivityFeedBaseView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI20ActivityFeedBaseView *)sub_1AF473BA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI20ActivityFeedBaseView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF473D24();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1AF473DF4();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF473F4C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI20ActivityFeedBaseView_contentBackgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI20ActivityFeedBaseView_sharedView);
}

@end