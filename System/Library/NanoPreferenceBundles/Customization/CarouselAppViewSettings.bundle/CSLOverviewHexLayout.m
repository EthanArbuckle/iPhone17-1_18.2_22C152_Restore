@interface CSLOverviewHexLayout
- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributesForItemAtHex:(Hex)a3;
- (BOOL)fitsToQuadrantSize;
- (CSLOverviewHexLayout)initWithConfiguration:(HexLayoutConfiguration *)a3;
- (Hex)hexAtPoint:(CGPoint)a3;
- (double)diameterScale;
- (double)falloffPercentage;
- (double)maxScale;
- (void)setDiameterScale:(double)a3;
- (void)setFalloffPercentage:(double)a3;
- (void)setFitsToQuadrantSize:(BOOL)a3;
- (void)setMaxScale:(double)a3;
- (void)updateConstants;
- (void)updateWithBounds:(CGRect)a3;
- (void)updateWithNormalizedGraphQuadrantSize:(CGSize)a3;
@end

@implementation CSLOverviewHexLayout

- (CSLOverviewHexLayout)initWithConfiguration:(HexLayoutConfiguration *)a3
{
  long long v4 = *(_OWORD *)&a3[2].var2;
  v16[2] = *(_OWORD *)&a3[1].var3;
  v16[3] = v4;
  uint64_t v17 = *(void *)&a3[3].var1;
  long long v5 = *(_OWORD *)&a3->var4;
  v16[0] = *(_OWORD *)&a3->var0;
  v16[1] = v5;
  v15.receiver = self;
  v15.super_class = (Class)CSLOverviewHexLayout;
  v6 = [(CSLHexLayout *)&v15 initWithConfiguration:v16];
  if (v6)
  {
    v7 = [CSLUniformHexLayout alloc];
    long long v8 = *(_OWORD *)&a3[2].var2;
    v13[2] = *(_OWORD *)&a3[1].var3;
    v13[3] = v8;
    uint64_t v14 = *(void *)&a3[3].var1;
    long long v9 = *(_OWORD *)&a3->var4;
    v13[0] = *(_OWORD *)&a3->var0;
    v13[1] = v9;
    v10 = [(CSLUniformHexLayout *)v7 initWithConfiguration:v13];
    uniformLayout = v6->_uniformLayout;
    v6->_uniformLayout = v10;

    v6->_constantsDirty = 1;
    v6->_normalizedGraphRadius = 7.0;
    v6->_fitsToQuadrantSize = 1;
    v6->_maxScale = 1.0;
    v6->_diameterScale = 1.0;
  }
  return v6;
}

- (void)setMaxScale:(double)a3
{
  self->_maxScale = a3;
  self->_constantsDirty = 1;
}

- (void)setFalloffPercentage:(double)a3
{
  self->_falloffPercentage = a3;
  self->_constantsDirty = 1;
}

- (void)setDiameterScale:(double)a3
{
  self->_diameterScale = a3;
  self->_constantsDirty = 1;
}

- (void)setFitsToQuadrantSize:(BOOL)a3
{
  self->_fitsToQuadrantSize = a3;
  self->_constantsDirty = 1;
}

- (void)updateWithBounds:(CGRect)a3
{
  double v3 = a3.size.height * 0.5;
  if (a3.size.width * 0.5 != self->_quadrantSize.width || v3 != self->_quadrantSize.height)
  {
    self->_quadrantSize.width = a3.size.width * 0.5;
    self->_quadrantSize.height = v3;
    self->_constantsDirty = 1;
  }
}

- (void)updateWithNormalizedGraphQuadrantSize:(CGSize)a3
{
  if (a3.width != self->_normalizedGraphQuadrantSize.width || a3.height != self->_normalizedGraphQuadrantSize.height)
  {
    self->_normalizedGraphQuadrantSize = a3;
    self->_constantsDirty = 1;
  }
}

- (void)updateConstants
{
  if (!self->_constantsDirty) {
    return;
  }
  float maxScale = self->_maxScale;
  self->_scale = maxScale;
  if (self->_fitsToQuadrantSize)
  {
    [(CSLUniformHexLayout *)self->_uniformLayout hexSideSize];
    *(float *)&double v4 = v4;
    double v5 = *(float *)&v4;
    float v6 = (self->_normalizedGraphQuadrantSize.width + 1.0) * v5;
    float v7 = (self->_normalizedGraphQuadrantSize.height + 1.0) * v5;
    double width = self->_quadrantSize.width;
    if (width < v6)
    {
      double height = self->_quadrantSize.height;
      double v10 = v7;
LABEL_6:
      float maxScale = width / v6;
      float v11 = height / v10;
      if (maxScale >= v11) {
        float maxScale = height / v10;
      }
      self->_scale = maxScale;
      goto LABEL_10;
    }
    double v10 = v7;
    double height = self->_quadrantSize.height;
    if (height < v10) {
      goto LABEL_6;
    }
    float maxScale = self->_scale;
  }
LABEL_10:
  double v12 = maxScale;
  double v13 = self->_maxScale;
  if (v13 < v12)
  {
    float v14 = v13;
    self->_scale = v14;
  }
  self->_constantsDirty = 0;
}

- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributesForItemAtHex:(Hex)a3
{
  uint64_t v6 = v3;
  [(CSLOverviewHexLayout *)self updateConstants];
  float32x4_t v7 = 0uLL;
  *(_OWORD *)uint64_t v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  uniformLayout = self->_uniformLayout;
  if (uniformLayout)
  {
    [(CSLUniformHexLayout *)uniformLayout layoutAttributesForItemAtHex:a3];
    float32x4_t v7 = *(float32x4_t *)v6;
  }
  else
  {
    *(void *)(v6 + 16) = 0;
    *(void *)(v6 + 24) = 0;
  }
  float32x4_t v9 = vmulq_n_f32(v7, self->_scale);
  *(float32x4_t *)uint64_t v6 = v9;
  float v10 = self->_diameterScale * v9.f32[2];
  *(float *)(v6 + 8) = v10;
  [(CSLHexLayout *)self scrolledPointFromContentPoint:vcvtq_f64_f32(*(float32x2_t *)v9.f32)];
  double v12 = v11;
  double v14 = v13;
  *(float *)&double v11 = v11;
  *(_DWORD *)(v6 + 8) = *(void *)(v6 + 8);
  LODWORD(v13) = LODWORD(v11);
  *(float *)&double v11 = v14;
  HIDWORD(v13) = LODWORD(v11);
  *(double *)uint64_t v6 = v13;
  v15.var0 = self->_falloffPercentage;
  if (v15.var0 > 0.0 && v15.var0 < 1.0)
  {
    float v17 = 0.0;
    float v18 = 0.0;
    if (CSLPRFGreater()) {
      float v18 = fabs(v12) / self->_quadrantSize.width;
    }
    if (CSLPRFGreater()) {
      float v17 = fabs(v14) / self->_quadrantSize.height;
    }
    v15.var0 = self->_falloffPercentage
             + (1.0 - self->_falloffPercentage) * (1.0 - sqrtf((float)(v17 * v17) + (float)(v18 * v18)));
    *(float *)&v15.var0 = v15.var0;
    *(float *)&v15.var0 = *(float *)(v6 + 8) * *(float *)&v15.var0;
    *(_DWORD *)(v6 + 8) = LODWORD(v15.var0);
  }
  return v15;
}

- (Hex)hexAtPoint:(CGPoint)a3
{
  uniformLayout = self->_uniformLayout;
  -[CSLHexLayout contentPointFromScrolledPoint:](self, "contentPointFromScrolledPoint:", a3.x / self->_scale, a3.y / self->_scale);

  return (Hex)-[CSLUniformHexLayout hexAtPoint:](uniformLayout, "hexAtPoint:");
}

- (double)maxScale
{
  return self->_maxScale;
}

- (double)falloffPercentage
{
  return self->_falloffPercentage;
}

- (double)diameterScale
{
  return self->_diameterScale;
}

- (BOOL)fitsToQuadrantSize
{
  return self->_fitsToQuadrantSize;
}

- (void).cxx_destruct
{
}

@end