@interface DBDashboardPlatterView
- (_TtC9DashBoard22DBDashboardPlatterView)init;
- (_TtC9DashBoard22DBDashboardPlatterView)initWithCoder:(id)a3;
- (_TtC9DashBoard22DBDashboardPlatterView)initWithFrame:(CGRect)a3;
- (double)platterCornerRadius;
- (void)setPlatterCornerRadius:(double)a3;
- (void)updateMaterial;
@end

@implementation DBDashboardPlatterView

- (double)platterCornerRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC9DashBoard22DBDashboardPlatterView_platterCornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setPlatterCornerRadius:(double)a3
{
  v5 = (double *)((char *)self + OBJC_IVAR____TtC9DashBoard22DBDashboardPlatterView_platterCornerRadius);
  swift_beginAccess();
  double *v5 = a3;
  v6 = self;
  sub_22D819DE8();
}

- (_TtC9DashBoard22DBDashboardPlatterView)init
{
  return (_TtC9DashBoard22DBDashboardPlatterView *)DBDashboardPlatterView.init()();
}

- (void)updateMaterial
{
  v2 = self;
  sub_22D819DE8();
}

- (_TtC9DashBoard22DBDashboardPlatterView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DashBoard22DBDashboardPlatterView_materialView) = 0;
  id v4 = a3;

  result = (_TtC9DashBoard22DBDashboardPlatterView *)sub_22D85EA28();
  __break(1u);
  return result;
}

- (_TtC9DashBoard22DBDashboardPlatterView)initWithFrame:(CGRect)a3
{
  result = (_TtC9DashBoard22DBDashboardPlatterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DashBoard22DBDashboardPlatterView_materialView);
}

@end