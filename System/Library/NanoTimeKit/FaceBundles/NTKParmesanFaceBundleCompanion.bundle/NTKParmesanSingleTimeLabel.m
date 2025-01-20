@interface NTKParmesanSingleTimeLabel
- (NTKParmesanSingleTimeLabel)initWithCoder:(id)a3;
- (NTKParmesanSingleTimeLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NTKParmesanSingleTimeLabel

- (NTKParmesanSingleTimeLabel)initWithFrame:(CGRect)a3
{
  return (NTKParmesanSingleTimeLabel *)sub_246C269C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NTKParmesanSingleTimeLabel)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanSingleTimeLabel_alignment) = 0;
  v4 = (char *)self + OBJC_IVAR___NTKParmesanSingleTimeLabel_timeRect;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v4 + 1) = _Q0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanSingleTimeLabel_currentFontAttributes) = (Class)MEMORY[0x263F8EE80];
  id v10 = a3;

  result = (NTKParmesanSingleTimeLabel *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_246C26C24();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end