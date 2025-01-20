@interface DBDashboardDimmingView
- (CGRect)contentFrame;
- (_TtC9DashBoard22DBDashboardDimmingView)initWithCoder:(id)a3;
- (_TtC9DashBoard22DBDashboardDimmingView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (void)setContentFrame:(CGRect)a3;
- (void)setCornerRadius:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBDashboardDimmingView

- (_TtC9DashBoard22DBDashboardDimmingView)initWithFrame:(CGRect)a3
{
  return (_TtC9DashBoard22DBDashboardDimmingView *)DBDashboardDimmingView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9DashBoard22DBDashboardDimmingView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DashBoard22DBDashboardDimmingView_cornerRadius) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9DashBoard22DBDashboardDimmingView_contentFrame);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  id v5 = a3;

  result = (_TtC9DashBoard22DBDashboardDimmingView *)sub_22D85EA28();
  __break(1u);
  return result;
}

- (double)cornerRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC9DashBoard22DBDashboardDimmingView_cornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCornerRadius:(double)a3
{
  id v5 = (double *)((char *)self + OBJC_IVAR____TtC9DashBoard22DBDashboardDimmingView_cornerRadius);
  swift_beginAccess();
  *id v5 = a3;
  v6 = self;
  sub_22D8373DC();
  sub_22D837600();
}

- (CGRect)contentFrame
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC9DashBoard22DBDashboardDimmingView_contentFrame);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8 = (CGFloat *)((char *)self + OBJC_IVAR____TtC9DashBoard22DBDashboardDimmingView_contentFrame);
  swift_beginAccess();
  CGFloat *v8 = x;
  v8[1] = y;
  v8[2] = width;
  v8[3] = height;
  v9 = self;
  sub_22D837600();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DBDashboardDimmingView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DBDashboardDimmingView *)&v6 traitCollectionDidChange:v4];
  sub_22D8373DC();
  sub_22D837600();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DashBoard22DBDashboardDimmingView_overlayColor);
}

@end