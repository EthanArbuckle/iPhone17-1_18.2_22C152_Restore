@interface LoadingView
- (_TtC12GameCenterUI11LoadingView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI11LoadingView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
@end

@implementation LoadingView

- (_TtC12GameCenterUI11LoadingView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI11LoadingView *)sub_1AF4731AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI11LoadingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF473310();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF4733D0();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_1AF47358C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI11LoadingView_loadingIndicator));
}

@end