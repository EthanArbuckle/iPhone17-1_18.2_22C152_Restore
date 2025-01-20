@interface LoadingIndicatorAccessoryView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI29LoadingIndicatorAccessoryView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI29LoadingIndicatorAccessoryView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
@end

@implementation LoadingIndicatorAccessoryView

- (_TtC12GameCenterUI29LoadingIndicatorAccessoryView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI29LoadingIndicatorAccessoryView *)sub_1AF4F3C68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI29LoadingIndicatorAccessoryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF4F3D84();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1AF4F3E2C(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF4F3F18();
}

- (void)didMoveToSuperview
{
  v2 = self;
  sub_1AF4F40D4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29LoadingIndicatorAccessoryView_loadingIndicator));
}

@end