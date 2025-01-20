@interface ParmesanButtonTray
- (_TtC30NTKParmesanFaceBundleCompanion18ParmesanButtonTray)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion18ParmesanButtonTray)initWithFrame:(CGRect)a3;
@end

@implementation ParmesanButtonTray

- (_TtC30NTKParmesanFaceBundleCompanion18ParmesanButtonTray)initWithFrame:(CGRect)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion18ParmesanButtonTray *)sub_246BD040C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC30NTKParmesanFaceBundleCompanion18ParmesanButtonTray)initWithCoder:(id)a3
{
  result = (_TtC30NTKParmesanFaceBundleCompanion18ParmesanButtonTray *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion18ParmesanButtonTray_container));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion18ParmesanButtonTray_buttonLayoutGuide);
}

@end