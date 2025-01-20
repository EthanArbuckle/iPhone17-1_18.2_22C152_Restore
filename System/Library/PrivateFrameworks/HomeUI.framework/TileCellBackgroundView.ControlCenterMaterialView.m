@interface TileCellBackgroundView.ControlCenterMaterialView
- (_TtCC6HomeUI22TileCellBackgroundView25ControlCenterMaterialView)initWithCoder:(id)a3;
- (_TtCC6HomeUI22TileCellBackgroundView25ControlCenterMaterialView)initWithFrame:(CGRect)a3;
@end

@implementation TileCellBackgroundView.ControlCenterMaterialView

- (_TtCC6HomeUI22TileCellBackgroundView25ControlCenterMaterialView)initWithFrame:(CGRect)a3
{
  return (_TtCC6HomeUI22TileCellBackgroundView25ControlCenterMaterialView *)sub_1BE55CC44(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC6HomeUI22TileCellBackgroundView25ControlCenterMaterialView)initWithCoder:(id)a3
{
  return (_TtCC6HomeUI22TileCellBackgroundView25ControlCenterMaterialView *)sub_1BE55CDC8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC6HomeUI22TileCellBackgroundView25ControlCenterMaterialView____lazy_storage___controlCenterTileMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC6HomeUI22TileCellBackgroundView25ControlCenterMaterialView____lazy_storage___controlCenterTileEditingMaterialView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC6HomeUI22TileCellBackgroundView25ControlCenterMaterialView____lazy_storage___controlCenterTileOnMaterialView);
}

@end