@interface TimeContainerView
- (_TtC30NTKParmesanFaceBundleCompanion17TimeContainerView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion17TimeContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TimeContainerView

- (_TtC30NTKParmesanFaceBundleCompanion17TimeContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion17TimeContainerView *)sub_246C274A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC30NTKParmesanFaceBundleCompanion17TimeContainerView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_deviceSize);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC30NTKParmesanFaceBundleCompanion17TimeContainerView *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_246C277A4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_timeView));
}

@end