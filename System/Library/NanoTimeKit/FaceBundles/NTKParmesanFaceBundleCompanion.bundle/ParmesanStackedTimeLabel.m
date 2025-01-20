@interface ParmesanStackedTimeLabel
- (_TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ParmesanStackedTimeLabel

- (_TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel)initWithFrame:(CGRect)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel *)sub_246C2556C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_timeRect;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v4 + 1) = _Q0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_currentFontAttributes) = (Class)MEMORY[0x263F8EE80];
  id v10 = a3;

  result = (_TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_246C2589C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_hourLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_minuteLabel));

  swift_bridgeObjectRelease();
}

@end