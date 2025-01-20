@interface ParmesanColorAdjustView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion23ParmesanColorAdjustView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion23ParmesanColorAdjustView)initWithFrame:(CGRect)a3;
@end

@implementation ParmesanColorAdjustView

- (_TtC30NTKParmesanFaceBundleCompanion23ParmesanColorAdjustView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion23ParmesanColorAdjustView_colorBrightnessAmount) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion23ParmesanColorAdjustView_colorContrastAmount) = (Class)0x3FF0000000000000;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ParmesanColorAdjustView();
  v7 = -[ParmesanColorAdjustView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_246C23418();

  return v7;
}

- (_TtC30NTKParmesanFaceBundleCompanion23ParmesanColorAdjustView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion23ParmesanColorAdjustView_colorBrightnessAmount) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion23ParmesanColorAdjustView_colorContrastAmount) = (Class)0x3FF0000000000000;
  id v4 = a3;

  result = (_TtC30NTKParmesanFaceBundleCompanion23ParmesanColorAdjustView *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_246C2CC48();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  v7 = self;
  char v8 = sub_246C237C4(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

@end