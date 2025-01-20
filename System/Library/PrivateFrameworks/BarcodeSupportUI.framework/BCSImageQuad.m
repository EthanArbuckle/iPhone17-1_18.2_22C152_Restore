@interface BCSImageQuad
- (BCSImageQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6;
- (CGPoint)_denormalizePoint:(CGPoint)a3 inBounds:(CGRect)a4;
- (CGPoint)_normalizePoint:(CGPoint)a3 inBounds:(CGRect)a4;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)boundingBox;
- (CGRect)bounds;
- (CGSize)perspectiveCorrectedSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)adjustOrientationInImageSpace:(BOOL)a3;
- (void)denormalize;
- (void)flip;
- (void)normalize;
- (void)setBounds:(CGRect)a3;
@end

@implementation BCSImageQuad

- (BCSImageQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  v18.receiver = self;
  v18.super_class = (Class)BCSImageQuad;
  v14 = [(BCSImageQuad *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->_topLeft.CGFloat x = v13;
    v14->_topLeft.CGFloat y = v12;
    v14->_topRight.CGFloat x = v11;
    v14->_topRight.CGFloat y = v10;
    v14->_bottomRight.CGFloat x = v9;
    v14->_bottomRight.CGFloat y = v8;
    v14->_bottomLeft.CGFloat x = x;
    v14->_bottomLeft.CGFloat y = y;
    v16 = v14;
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  v4 = NSStringFromCGPoint(self->_topLeft);
  v5 = NSStringFromCGPoint(self->_topRight);
  v6 = NSStringFromCGPoint(self->_bottomRight);
  v7 = NSStringFromCGPoint(self->_bottomLeft);
  CGFloat v8 = [v3 stringWithFormat:@"%@, %@, %@, %@", v4, v5, v6, v7];

  return v8;
}

- (CGRect)boundingBox
{
  v24[5] = *MEMORY[0x263EF8340];
  [(BCSImageQuad *)self topLeft];
  double v4 = v3;
  double v6 = v5;
  [(BCSImageQuad *)self topRight];
  uint64_t v23 = v7;
  v24[0] = v8;
  [(BCSImageQuad *)self bottomLeft];
  v24[1] = v9;
  v24[2] = v10;
  [(BCSImageQuad *)self bottomRight];
  uint64_t v11 = 0;
  v24[3] = v12;
  v24[4] = v13;
  double v14 = v6;
  double v15 = v4;
  do
  {
    double v16 = *(double *)&v22[v11 * 8 + 16];
    double v17 = *(double *)&v24[v11];
    if (v4 >= v16) {
      double v4 = *(double *)&v22[v11 * 8 + 16];
    }
    if (v15 < v16) {
      double v15 = *(double *)&v22[v11 * 8 + 16];
    }
    if (v6 >= v17) {
      double v6 = *(double *)&v24[v11];
    }
    if (v14 < v17) {
      double v14 = *(double *)&v24[v11];
    }
    v11 += 2;
  }
  while (v11 != 6);
  double v18 = v15 - v4;
  double v19 = v14 - v6;
  double v20 = v4;
  double v21 = v6;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)normalize
{
  [(BCSImageQuad *)self boundingBox];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[BCSImageQuad _normalizePoint:inBounds:](self, "_normalizePoint:inBounds:", self->_topLeft.x, self->_topLeft.y, v3, v5, v7, v9);
  self->_topLeft.CGFloat x = v11;
  self->_topLeft.CGFloat y = v12;
  -[BCSImageQuad _normalizePoint:inBounds:](self, "_normalizePoint:inBounds:", self->_topRight.x, self->_topRight.y, v4, v6, v8, v10);
  self->_topRight.CGFloat x = v13;
  self->_topRight.CGFloat y = v14;
  -[BCSImageQuad _normalizePoint:inBounds:](self, "_normalizePoint:inBounds:", self->_bottomRight.x, self->_bottomRight.y, v4, v6, v8, v10);
  self->_bottomRight.CGFloat x = v15;
  self->_bottomRight.CGFloat y = v16;
  -[BCSImageQuad _normalizePoint:inBounds:](self, "_normalizePoint:inBounds:", self->_bottomLeft.x, self->_bottomLeft.y, v4, v6, v8, v10);
  self->_bottomLeft.CGFloat x = v17;
  self->_bottomLeft.CGFloat y = v18;
}

- (void)denormalize
{
  [(BCSImageQuad *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[BCSImageQuad _denormalizePoint:inBounds:](self, "_denormalizePoint:inBounds:", self->_topLeft.x, self->_topLeft.y, v3, v5, v7, v9);
  self->_topLeft.CGFloat x = v11;
  self->_topLeft.CGFloat y = v12;
  -[BCSImageQuad _denormalizePoint:inBounds:](self, "_denormalizePoint:inBounds:", self->_topRight.x, self->_topRight.y, v4, v6, v8, v10);
  self->_topRight.CGFloat x = v13;
  self->_topRight.CGFloat y = v14;
  -[BCSImageQuad _denormalizePoint:inBounds:](self, "_denormalizePoint:inBounds:", self->_bottomRight.x, self->_bottomRight.y, v4, v6, v8, v10);
  self->_bottomRight.CGFloat x = v15;
  self->_bottomRight.CGFloat y = v16;
  -[BCSImageQuad _denormalizePoint:inBounds:](self, "_denormalizePoint:inBounds:", self->_bottomLeft.x, self->_bottomLeft.y, v4, v6, v8, v10);
  self->_bottomLeft.CGFloat x = v17;
  self->_bottomLeft.CGFloat y = v18;
}

- (void)flip
{
  [(BCSImageQuad *)self boundingBox];
  self->_topLeft.CGFloat y = v3 - self->_topLeft.y;
  self->_topRight.CGFloat y = v3 - self->_topRight.y;
  self->_bottomLeft.CGFloat y = v3 - self->_bottomLeft.y;
  self->_bottomRight.CGFloat y = v3 - self->_bottomRight.y;
}

- (CGPoint)_normalizePoint:(CGPoint)a3 inBounds:(CGRect)a4
{
  double v4 = (a3.x - a4.origin.x) / a4.size.width;
  double v5 = (a3.y - a4.origin.y) / a4.size.height;
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGPoint)_denormalizePoint:(CGPoint)a3 inBounds:(CGRect)a4
{
  double v4 = a4.origin.x + a3.x * a4.size.width;
  double v5 = a4.origin.y + a3.y * a4.size.height;
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (CGSize)perspectiveCorrectedSize
{
  [(BCSImageQuad *)self topLeft];
  uint64_t v29 = v3;
  uint64_t v32 = v4;
  [(BCSImageQuad *)self topRight];
  float64_t v28 = v5;
  float64_t v30 = v6;
  [(BCSImageQuad *)self bottomRight];
  uint64_t v31 = v7;
  uint64_t v33 = v8;
  [(BCSImageQuad *)self bottomLeft];
  *(float64_t *)_Q3.i64 = v28;
  *(float64_t *)&_Q3.i64[1] = v10;
  float64x2_t v11 = vsubq_f64((float64x2_t)vdupq_lane_s64(v29, 0), (float64x2_t)_Q3);
  int8x16_t v12 = _Q3;
  *(float64_t *)_Q3.i64 = v30;
  *(float64_t *)&_Q3.i64[1] = v13;
  float64x2_t v14 = vsubq_f64((float64x2_t)vdupq_lane_s64(v32, 0), (float64x2_t)_Q3);
  float64x2_t v15 = vsqrtq_f64(vmlaq_f64(vmulq_f64(v14, v14), v11, v11));
  float64x2_t v16 = vsubq_f64((float64x2_t)vdupq_lane_s64(v31, 0), (float64x2_t)vextq_s8(v12, v12, 8uLL));
  float64x2_t v17 = vsubq_f64((float64x2_t)vdupq_lane_s64(v33, 0), (float64x2_t)vextq_s8(_Q3, _Q3, 8uLL));
  float64x2_t v18 = vsqrtq_f64(vmlaq_f64(vmulq_f64(v17, v17), v16, v16));
  int8x16_t v19 = (int8x16_t)vdivq_f64(v15, v18);
  *(float32x2_t *)v19.i8 = vcvt_f32_f64((float64x2_t)vextq_s8(v19, v19, 8uLL));
  __asm { FMOV            V3.2S, #1.0 }
  float32x2_t v24 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v19.i8, *(float32x2_t *)_Q3.i8), *(int8x8_t *)v19.i8, (int8x8_t)vdiv_f32(*(float32x2_t *)_Q3.i8, *(float32x2_t *)v19.i8));
  float v25 = v24.f32[1];
  if (v24.f32[0] >= v24.f32[1]) {
    float v25 = v24.f32[0];
  }
  if (v25 > 2.0) {
    float32x2_t v24 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v24), 2.0 / v25));
  }
  float64x2_t v26 = vmulq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, v15), (int8x16_t)v18, (int8x16_t)v15), vcvtq_f64_f32(v24));
  double v27 = v26.f64[1];
  result.width = v26.f64[0];
  result.height = v27;
  return result;
}

- (void)adjustOrientationInImageSpace:(BOOL)a3
{
  BOOL v3 = a3;
  v43[4] = *MEMORY[0x263EF8340];
  double v5 = (void *)MEMORY[0x263F08D40];
  [(BCSImageQuad *)self topLeft];
  double v6 = objc_msgSend(v5, "valueWithCGPoint:");
  v43[0] = v6;
  uint64_t v7 = (void *)MEMORY[0x263F08D40];
  [(BCSImageQuad *)self topRight];
  uint64_t v8 = objc_msgSend(v7, "valueWithCGPoint:");
  v43[1] = v8;
  double v9 = (void *)MEMORY[0x263F08D40];
  [(BCSImageQuad *)self bottomLeft];
  float64_t v10 = objc_msgSend(v9, "valueWithCGPoint:");
  v43[2] = v10;
  float64x2_t v11 = (void *)MEMORY[0x263F08D40];
  [(BCSImageQuad *)self bottomRight];
  int8x16_t v12 = objc_msgSend(v11, "valueWithCGPoint:");
  v43[3] = v12;
  float64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:4];

  float64x2_t v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_0];
  float64x2_t v15 = [v14 objectAtIndexedSubscript:0];
  [v15 CGPointValue];
  double v17 = v16;

  float64x2_t v18 = [v14 objectAtIndexedSubscript:1];
  [v18 CGPointValue];
  double v20 = v19;

  double v21 = [v14 objectAtIndexedSubscript:2];
  [v21 CGPointValue];
  double v23 = v22;

  float32x2_t v24 = [v14 objectAtIndexedSubscript:3];
  [v24 CGPointValue];
  double v26 = v25;

  BOOL v27 = v26 < v23;
  if (v3)
  {
    BOOL v27 = v26 > v23;
    BOOL v28 = v17 <= v20;
  }
  else
  {
    BOOL v28 = v17 >= v20;
  }
  if (v27) {
    uint64_t v29 = 3;
  }
  else {
    uint64_t v29 = 2;
  }
  if (v27) {
    uint64_t v30 = 2;
  }
  else {
    uint64_t v30 = 3;
  }
  uint64_t v31 = [v14 objectAtIndexedSubscript:v28];
  [v31 CGPointValue];
  self->_topLeft.CGFloat x = v32;
  self->_topLeft.CGFloat y = v33;

  v34 = [v14 objectAtIndexedSubscript:v29];
  [v34 CGPointValue];
  self->_topRight.CGFloat x = v35;
  self->_topRight.CGFloat y = v36;

  v37 = [v14 objectAtIndexedSubscript:v28 ^ 1];
  [v37 CGPointValue];
  self->_bottomLeft.CGFloat x = v38;
  self->_bottomLeft.CGFloat y = v39;

  v40 = [v14 objectAtIndexedSubscript:v30];
  [v40 CGPointValue];
  self->_bottomRight.CGFloat x = v41;
  self->_bottomRight.CGFloat y = v42;
}

uint64_t __46__BCSImageQuad_adjustOrientationInImageSpace___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  double v6 = NSNumber;
  [v4 CGPointValue];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = NSNumber;
  [v5 CGPointValue];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v10 = [v7 compare:v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [BCSImageQuad alloc];
  [(BCSImageQuad *)self topLeft];
  double v6 = v5;
  double v8 = v7;
  [(BCSImageQuad *)self topRight];
  double v10 = v9;
  double v12 = v11;
  [(BCSImageQuad *)self bottomRight];
  double v14 = v13;
  double v16 = v15;
  [(BCSImageQuad *)self bottomLeft];

  return -[BCSImageQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](v4, "initWithTopLeft:topRight:bottomRight:bottomLeft:", v6, v8, v10, v12, v14, v16, v17, v18);
}

- (CGPoint)topLeft
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)topRight
{
  double x = self->_topRight.x;
  double y = self->_topRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)bottomRight
{
  double x = self->_bottomRight.x;
  double y = self->_bottomRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)bottomLeft
{
  double x = self->_bottomLeft.x;
  double y = self->_bottomLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

@end