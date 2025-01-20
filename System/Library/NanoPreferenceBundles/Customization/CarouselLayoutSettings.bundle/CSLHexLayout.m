@interface CSLHexLayout
- (CGPoint)contentOffset;
- (CGPoint)contentPointFromScrolledPoint:(CGPoint)a3;
- (CGPoint)scrolledPointFromContentPoint:(CGPoint)a3;
- (CSLHexLayout)initWithConfiguration:(HexLayoutConfiguration *)a3;
- (Hex)centeredHex;
- (Hex)hexAtPoint:(CGPoint)a3;
- (Hex)targetHex;
- (HexLayoutConfiguration)configuration;
- (double)defaultPixelDiameter;
- (double)percentComplete;
- (double)rubberbandVector;
- (id).cxx_construct;
- (id)description;
- (void)applyRubberbandVectorToCenter:(float32x2_t *)a1 forHex:(float32x2_t)a2;
- (void)setContentOffset:(CGPoint)a3;
- (void)setPercentComplete:(double)a3;
- (void)setRubberbandVector:(CSLHexLayout *)self;
- (void)setTargetHex:(Hex)a3;
@end

@implementation CSLHexLayout

- (CSLHexLayout)initWithConfiguration:(HexLayoutConfiguration *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CSLHexLayout;
  result = [(CSLHexLayout *)&v9 init];
  if (result)
  {
    *(_OWORD *)&result->_configuration.var0 = *(_OWORD *)&a3->var0;
    long long v5 = *(_OWORD *)&a3->var4;
    long long v6 = *(_OWORD *)&a3[1].var3;
    long long v7 = *(_OWORD *)&a3[2].var2;
    result[1]._contentOffset.x = *(CGFloat *)&a3[3].var1;
    *(_OWORD *)&result[1]._targetHex.q = v7;
    *(_OWORD *)result[1]._boundsRadius = v6;
    *(_OWORD *)&result->_configuration.var4 = v5;
    p_var3 = &a3[1].var3;
    result->_targetHex = 0;
    *(float32x2_t *)&long long v6 = vld1_dup_f32(p_var3);
    *(float32x2_t *)result->_boundsRadius = vmul_f32(vsub_f32(*(float32x2_t *)&a3[2].var0, *(float32x2_t *)&v6), (float32x2_t)0x3F0000003F000000);
  }
  return result;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CSLHexLayout;
  v3 = [(CSLHexLayout *)&v6 description];
  v4 = +[NSString stringWithFormat:@"<%@ %.2f%% offset:{%.2f,%.2f}>", v3, *(void *)&self->_percentComplete, *(void *)&self->_contentOffset.x, *(void *)&self->_contentOffset.y];

  return v4;
}

- (double)defaultPixelDiameter
{
  return *(float *)self[1]._boundsRadius;
}

- (void)setRubberbandVector:(CSLHexLayout *)self
{
  __asm { FMOV            V1.2S, #-1.0 }
  float32x2_t v8 = vmaxnm_f32(v2, _D1);
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)self->_rubberbandVector = vminnm_f32(v8, _D1);
}

- (void)applyRubberbandVectorToCenter:(float32x2_t *)a1 forHex:(float32x2_t)a2
{
  [(float32x2_t *)a1 rubberbandVector];
  if (fmaxf(COERCE_FLOAT(v3 & 0x7FFFFFFF), COERCE_FLOAT(v4 & 0x7FFFFFFF)) > 0.0)
  {
    [(float32x2_t *)a1 configuration];
    __asm
    {
      FMOV            V10.2S, #-1.0
      FMOV            V11.2S, #1.0
    }
    *(float32x2_t *)v11.f32 = vmul_f32(vminnm_f32(vmaxnm_f32(vdiv_f32(a2, a1[1]), _D10), _D11), (float32x2_t)vdup_n_s32(0x40490FDBu));
    vmul_f32(vadd_f32((float32x2_t)*(_OWORD *)&_simd_cos_f4(v11), _D11), (float32x2_t)0x3F0000003F000000);
  }
}

- (Hex)hexAtPoint:(CGPoint)a3
{
  return (Hex)0;
}

- (Hex)centeredHex
{
  return (Hex)-[CSLHexLayout hexAtPoint:](self, "hexAtPoint:", CGPointZero.x, CGPointZero.y);
}

- (CGPoint)scrolledPointFromContentPoint:(CGPoint)a3
{
  double v3 = a3.x - self->_contentOffset.x;
  double v4 = a3.y - self->_contentOffset.y;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)contentPointFromScrolledPoint:(CGPoint)a3
{
  double v3 = a3.x + self->_contentOffset.x;
  double v4 = a3.y + self->_contentOffset.y;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (Hex)targetHex
{
  return self->_targetHex;
}

- (void)setTargetHex:(Hex)a3
{
  self->_targetHedouble x = a3;
}

- (HexLayoutConfiguration)configuration
{
  long long v3 = *(_OWORD *)&self[3].var3;
  long long v4 = *(_OWORD *)&self[5].var1;
  *(_OWORD *)&retstr[1].var3 = *(_OWORD *)&self[4].var2;
  *(_OWORD *)&retstr[2].var2 = v4;
  *(void *)&retstr[3].var1 = *(void *)&self[6].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var4;
  *(_OWORD *)&retstr->var4 = v3;
  return self;
}

- (double)rubberbandVector
{
  return *(double *)(a1 + 32);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  __asm { FMOV            V1.2S, #1.0 }
  *((void *)self + 7) = 0;
  *((void *)self + 8) = _D1;
  *((void *)self + 9) = 0;
  *((_OWORD *)self + 5) = xmmword_2E990;
  *((int32x2_t *)self + 12) = vdup_n_s32(0x43960000u);
  *((_DWORD *)self + 26) = 1104936960;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  return self;
}

@end