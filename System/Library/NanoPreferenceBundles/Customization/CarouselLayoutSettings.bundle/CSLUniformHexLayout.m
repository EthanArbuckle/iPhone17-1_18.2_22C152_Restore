@interface CSLUniformHexLayout
- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributesForItemAtHex:(Hex)a3;
- (CSLUniformHexLayout)initWithConfiguration:(HexLayoutConfiguration *)a3;
- (Hex)hexAtPoint:(CGPoint)a3;
- (double)hexSideSize;
- (void)setHexSideSize:(double)a3;
@end

@implementation CSLUniformHexLayout

- (CSLUniformHexLayout)initWithConfiguration:(HexLayoutConfiguration *)a3
{
  long long v4 = *(_OWORD *)&a3[2].var2;
  v8[2] = *(_OWORD *)&a3[1].var3;
  v8[3] = v4;
  uint64_t v9 = *(void *)&a3[3].var1;
  long long v5 = *(_OWORD *)&a3->var4;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v5;
  v7.receiver = self;
  v7.super_class = (Class)CSLUniformHexLayout;
  result = [(CSLHexLayout *)&v7 initWithConfiguration:v8];
  if (result)
  {
    result->_diameter = a3[1].var3;
    result->_hexSideSize = a3[2].var2;
  }
  return result;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributesForItemAtHex:(Hex)a3
{
  uint64_t v5 = v3;
  v6.f32[0] = (float)((float)a3.r * 0.5) + (float)a3.q;
  v6.f32[1] = (float)a3.r;
  float hexSideSize = self->_hexSideSize;
  -[CSLHexLayout applyRubberbandVectorToCenter:forHex:](self, "applyRubberbandVectorToCenter:forHex:", COERCE_DOUBLE(vmul_n_f32(vmul_f32(v6, (float32x2_t)0x3FC000003FDDB3D7), hexSideSize)));
  float v8 = self->_diameter * *((float *)&v9 + 2);
  *((float *)&v9 + 2) = v8;
  *(_OWORD *)uint64_t v5 = v9;
  *(void *)(v5 + 16) = 0;
  return ($153C3A5BC4E016D58A1B9CA554FFC462)v9;
}

- (Hex)hexAtPoint:(CGPoint)a3
{
  uint64_t v7 = 0;
  double hexSideSize = self->_hexSideSize;
  float v4 = a3.x / hexSideSize;
  float v5 = a3.y / hexSideSize;
  return *(Hex *)sub_18D68(&v7, (float)-(float)(v5 - (float)(v4 * 1.7321)) / 3.0, (float)-(float)((float)-(float)(v5 - (float)(v4 * 1.7321)) / 3.0) - (float)(v5 * 0.66667), v5 * 0.66667);
}

- (double)hexSideSize
{
  return self->_hexSideSize;
}

- (void)setHexSideSize:(double)a3
{
  self->_double hexSideSize = a3;
}

@end