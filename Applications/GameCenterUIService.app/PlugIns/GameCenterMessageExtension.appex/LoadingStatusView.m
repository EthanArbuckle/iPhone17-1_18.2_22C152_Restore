@interface LoadingStatusView
- (UIActivityIndicatorView)activityIndicator;
- (_TtC26GameCenterMessageExtension17LoadingStatusView)initWithCoder:(id)a3;
- (_TtC26GameCenterMessageExtension17LoadingStatusView)initWithFrame:(CGRect)a3;
- (void)setActivityIndicator:(id)a3;
@end

@implementation LoadingStatusView

- (UIActivityIndicatorView)activityIndicator
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIActivityIndicatorView *)Strong;
}

- (void)setActivityIndicator:(id)a3
{
}

- (_TtC26GameCenterMessageExtension17LoadingStatusView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for LoadingStatusView();
  return -[LoadingStatusView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC26GameCenterMessageExtension17LoadingStatusView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for LoadingStatusView();
  return [(LoadingStatusView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end