@interface NTKParmesanSwatchTimeLabel
- (NTKParmesanSwatchTimeLabel)initWithCoder:(id)a3;
- (NTKParmesanSwatchTimeLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForSwatchWithLayout:(id)a3 typeface:(unint64_t)a4 complicationVisibility:(unint64_t)a5 palette:(id)a6 numerals:(unint64_t)a7 device:(id)a8;
- (void)setText:(id)a3;
@end

@implementation NTKParmesanSwatchTimeLabel

- (NTKParmesanSwatchTimeLabel)initWithFrame:(CGRect)a3
{
  return (NTKParmesanSwatchTimeLabel *)sub_246BF3F50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NTKParmesanSwatchTimeLabel)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanSwatchTimeLabel_alignment) = 0;
  v4 = (char *)self + OBJC_IVAR___NTKParmesanSwatchTimeLabel_timeRect;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v4 + 1) = _Q0;
  id v10 = a3;

  result = (NTKParmesanSwatchTimeLabel *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_246BF4188();
}

- (void)prepareForSwatchWithLayout:(id)a3 typeface:(unint64_t)a4 complicationVisibility:(unint64_t)a5 palette:(id)a6 numerals:(unint64_t)a7 device:(id)a8
{
  v15 = (objc_class *)type metadata accessor for ParmesanTimeAppearance();
  v16 = (char *)objc_allocWithZone(v15);
  *(void *)&v16[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout] = a3;
  *(void *)&v16[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device] = a8;
  *(void *)&v16[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface] = a4;
  *(void *)&v16[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_numerals] = a7;
  v24.receiver = v16;
  v24.super_class = v15;
  id v17 = a3;
  id v18 = a8;
  id v19 = v17;
  id v20 = v18;
  id v21 = a6;
  v22 = self;
  v23 = [(NTKParmesanSwatchTimeLabel *)&v24 init];
  sub_246BF42A4((uint64_t)v23, a5);
}

- (void)setText:(id)a3
{
  sub_246C2CC48();
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanSwatchTimeLabel_timeLabel);
  v5 = self;
  id v6 = (id)sub_246C2CC08();
  objc_msgSend(v4, sel_setText_, v6);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end