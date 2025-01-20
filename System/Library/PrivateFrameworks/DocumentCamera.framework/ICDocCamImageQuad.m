@interface ICDocCamImageQuad
+ (BOOL)supportsSecureCoding;
+ (id)quadFromCGRect:(CGRect)a3;
+ (id)quadFromVNRectangle:(id)a3;
- (BOOL)containsAngleOutOfValidThreshold;
- (BOOL)containsIntersectingLines;
- (BOOL)containsPointOutsideOfExtendedImageBounds;
- (BOOL)containsPointsLessThanDistanceThreshold;
- (BOOL)isConvex;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)pointRotatedClockwiseAroundOrigin:(CGPoint)a3;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)boundingBox;
- (CGRect)bounds;
- (CGSize)perspectiveCorrectedSize;
- (ICDocCamImageQuad)initWithBottomLeft:(CGPoint)a3 bottomRight:(CGPoint)a4 topLeft:(CGPoint)a5 topRight:(CGPoint)a6;
- (ICDocCamImageQuad)initWithCoder:(id)a3;
- (NSString)description;
- (double)mininumAllowedDistanceBetweenPoints;
- (id)copyWithZone:(_NSZone *)a3;
- (id)flippedQuadFromSourceFrame:(CGRect)a3;
- (id)imageQuadByScalingBy:(CGSize)a3;
- (id)intersectionOfLineFrom:(CGPoint)a3 to:(CGPoint)a4 withLineFrom:(CGPoint)a5 to:(CGPoint)a6;
- (id)normalizedQuadByConvertingFromView:(id)a3 toView:(id)a4 toViewSize:(CGSize)a5;
- (id)quadByConvertingFromView:(id)a3 toView:(id)a4 isNormalized:(BOOL)a5;
- (void)addPointToQuadPoints:(CGPoint)a3;
- (void)applyOrientation:(int64_t)a3 boundingBox:(CGRect)a4;
- (void)clampQuadToRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)flipPointsWithSourceFrame:(CGRect)a3;
- (void)orientIfNecessary;
- (void)removeOrientation:(int64_t)a3 boundingBox:(CGRect)a4;
- (void)rotatePointsByOrientation:(int64_t)a3;
- (void)rotatePointsClockwise;
- (void)rotatePointsRemovingOrientation:(int64_t)a3;
- (void)setBottomLeft:(CGPoint)a3;
- (void)setBottomRight:(CGPoint)a3;
- (void)setBoundingBox:(CGRect)a3;
- (void)setTopLeft:(CGPoint)a3;
- (void)setTopRight:(CGPoint)a3;
@end

@implementation ICDocCamImageQuad

- (ICDocCamImageQuad)initWithBottomLeft:(CGPoint)a3 bottomRight:(CGPoint)a4 topLeft:(CGPoint)a5 topRight:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  result = [(ICDocCamImageQuad *)self init];
  if (result)
  {
    result->_bottomLeft.CGFloat x = v13;
    result->_bottomLeft.CGFloat y = v12;
    result->_bottomRight.CGFloat x = v11;
    result->_bottomRight.CGFloat y = v10;
    result->_topLeft.CGFloat x = v9;
    result->_topLeft.CGFloat y = v8;
    result->_topRight.CGFloat x = x;
    result->_topRight.CGFloat y = y;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"\ntopLeft    : %.2f %.2f \ntopRight   : %.2f %.2f \nbottomLeft : %.2f %.2f \nbottomRight: %.2f %.2f", *(void *)&self->_topLeft.x, *(void *)&self->_topLeft.y, *(void *)&self->_topRight.x, *(void *)&self->_topRight.y, *(void *)&self->_bottomLeft.x, *(void *)&self->_bottomLeft.y, *(void *)&self->_bottomRight.x, *(void *)&self->_bottomRight.y];
}

- (id)imageQuadByScalingBy:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(ICDocCamImageQuad *)self bottomLeft];
  double v7 = v6;
  double v9 = v8;
  [(ICDocCamImageQuad *)self bottomRight];
  double v11 = v10;
  double v13 = v12;
  [(ICDocCamImageQuad *)self topLeft];
  double v15 = v14;
  double v17 = v16;
  [(ICDocCamImageQuad *)self topRight];
  v20 = -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ICDocCamImageQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", width * v7, height * v9, width * v11, height * v13, width * v15, height * v17, width * v18, height * v19);

  return v20;
}

- (CGRect)bounds
{
  v24[5] = *MEMORY[0x263EF8340];
  [(ICDocCamImageQuad *)self topLeft];
  double v4 = v3;
  double v6 = v5;
  [(ICDocCamImageQuad *)self topRight];
  uint64_t v23 = v7;
  v24[0] = v8;
  [(ICDocCamImageQuad *)self bottomLeft];
  v24[1] = v9;
  v24[2] = v10;
  [(ICDocCamImageQuad *)self bottomRight];
  uint64_t v11 = 0;
  v24[3] = v12;
  v24[4] = v13;
  double v14 = v4;
  double v15 = v6;
  do
  {
    double v16 = *(double *)&v22[v11 * 8 + 16];
    double v17 = *(double *)&v24[v11];
    if (v4 >= v16) {
      double v4 = *(double *)&v22[v11 * 8 + 16];
    }
    if (v14 < v16) {
      double v14 = *(double *)&v22[v11 * 8 + 16];
    }
    if (v6 >= v17) {
      double v6 = *(double *)&v24[v11];
    }
    if (v15 < v17) {
      double v15 = *(double *)&v24[v11];
    }
    v11 += 2;
  }
  while (v11 != 6);
  double v18 = v14 - v4;
  double v19 = v15 - v6;
  double v20 = v4;
  double v21 = v6;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGSize)perspectiveCorrectedSize
{
  [(ICDocCamImageQuad *)self topLeft];
  uint64_t v31 = v3;
  uint64_t v34 = v4;
  [(ICDocCamImageQuad *)self topRight];
  float64_t v30 = v5;
  float64_t v32 = v6;
  [(ICDocCamImageQuad *)self bottomRight];
  uint64_t v33 = v7;
  uint64_t v35 = v8;
  [(ICDocCamImageQuad *)self bottomLeft];
  *(float64_t *)_Q3.i64 = v30;
  *(float64_t *)&_Q3.i64[1] = v10;
  float64x2_t v11 = vsubq_f64((float64x2_t)vdupq_lane_s64(v31, 0), (float64x2_t)_Q3);
  int8x16_t v12 = _Q3;
  *(float64_t *)_Q3.i64 = v32;
  *(float64_t *)&_Q3.i64[1] = v13;
  float64x2_t v14 = vsubq_f64((float64x2_t)vdupq_lane_s64(v34, 0), (float64x2_t)_Q3);
  float64x2_t v15 = vsqrtq_f64(vmlaq_f64(vmulq_f64(v14, v14), v11, v11));
  float64x2_t v16 = vsubq_f64((float64x2_t)vdupq_lane_s64(v33, 0), (float64x2_t)vextq_s8(v12, v12, 8uLL));
  float64x2_t v17 = vsubq_f64((float64x2_t)vdupq_lane_s64(v35, 0), (float64x2_t)vextq_s8(_Q3, _Q3, 8uLL));
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
  float64x2_t v26 = vrndpq_f64(vmulq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, v15), (int8x16_t)v18, (int8x16_t)v15), vcvtq_f64_f32(v24)));
  __asm { FMOV            V1.2D, #-2.0 }
  float64x2_t v28 = vaddq_f64(v26, _Q1);
  double v29 = v28.f64[1];
  result.double width = v28.f64[0];
  result.double height = v29;
  return result;
}

- (void)flipPointsWithSourceFrame:(CGRect)a3
{
  [(ICDocCamImageQuad *)self topLeft];
  DCTSDFlipPoint();
  -[ICDocCamImageQuad setTopLeft:](self, "setTopLeft:");
  [(ICDocCamImageQuad *)self topRight];
  DCTSDFlipPoint();
  -[ICDocCamImageQuad setTopRight:](self, "setTopRight:");
  [(ICDocCamImageQuad *)self bottomRight];
  DCTSDFlipPoint();
  -[ICDocCamImageQuad setBottomRight:](self, "setBottomRight:");
  [(ICDocCamImageQuad *)self bottomLeft];
  DCTSDFlipPoint();

  -[ICDocCamImageQuad setBottomLeft:](self, "setBottomLeft:");
}

- (void)clampQuadToRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(ICDocCamImageQuad *)self topLeft];
  [(ICDocCamImageQuad *)self setTopLeft:DCTSDClampPointInRect(v8, v9, x, y, width, height)];
  [(ICDocCamImageQuad *)self topRight];
  [(ICDocCamImageQuad *)self setTopRight:DCTSDClampPointInRect(v10, v11, x, y, width, height)];
  [(ICDocCamImageQuad *)self bottomRight];
  [(ICDocCamImageQuad *)self setBottomRight:DCTSDClampPointInRect(v12, v13, x, y, width, height)];
  [(ICDocCamImageQuad *)self bottomLeft];
  double v16 = DCTSDClampPointInRect(v14, v15, x, y, width, height);

  [(ICDocCamImageQuad *)self setBottomLeft:v16];
}

- (void)orientIfNecessary
{
  v31[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F08D40];
  [(ICDocCamImageQuad *)self topLeft];
  uint64_t v4 = objc_msgSend(v3, "valueWithCGPoint:");
  v31[0] = v4;
  double v5 = (void *)MEMORY[0x263F08D40];
  [(ICDocCamImageQuad *)self topRight];
  double v6 = objc_msgSend(v5, "valueWithCGPoint:");
  v31[1] = v6;
  uint64_t v7 = (void *)MEMORY[0x263F08D40];
  [(ICDocCamImageQuad *)self bottomLeft];
  double v8 = objc_msgSend(v7, "valueWithCGPoint:");
  v31[2] = v8;
  double v9 = (void *)MEMORY[0x263F08D40];
  [(ICDocCamImageQuad *)self bottomRight];
  double v10 = objc_msgSend(v9, "valueWithCGPoint:");
  v31[3] = v10;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];

  double v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_9];
  double v13 = [v12 objectAtIndexedSubscript:0];
  [v13 CGPointValue];
  double v15 = v14;

  double v16 = [v12 objectAtIndexedSubscript:1];
  [v16 CGPointValue];
  double v18 = v17;

  int8x16_t v19 = [v12 objectAtIndexedSubscript:2];
  [v19 CGPointValue];
  double v21 = v20;

  v22 = [v12 objectAtIndexedSubscript:3];
  [v22 CGPointValue];
  double v24 = v23;

  if (v24 <= v21) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = 3;
  }
  if (v24 <= v21) {
    uint64_t v26 = 3;
  }
  else {
    uint64_t v26 = 2;
  }
  v27 = [v12 objectAtIndexedSubscript:v15 <= v18];
  [v27 CGPointValue];
  -[ICDocCamImageQuad setTopLeft:](self, "setTopLeft:");

  float64x2_t v28 = [v12 objectAtIndexedSubscript:v25];
  [v28 CGPointValue];
  -[ICDocCamImageQuad setTopRight:](self, "setTopRight:");

  double v29 = [v12 objectAtIndexedSubscript:v15 > v18];
  [v29 CGPointValue];
  -[ICDocCamImageQuad setBottomLeft:](self, "setBottomLeft:");

  float64_t v30 = [v12 objectAtIndexedSubscript:v26];
  [v30 CGPointValue];
  -[ICDocCamImageQuad setBottomRight:](self, "setBottomRight:");
}

uint64_t __38__ICDocCamImageQuad_orientIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  [a2 CGPointValue];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 CGPointValue];
  double v9 = v8;

  double v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (BOOL)isValid
{
  return ![(ICDocCamImageQuad *)self containsIntersectingLines]
      && ![(ICDocCamImageQuad *)self containsPointsLessThanDistanceThreshold]
      && ![(ICDocCamImageQuad *)self containsPointOutsideOfExtendedImageBounds];
}

- (double)mininumAllowedDistanceBetweenPoints
{
  [(ICDocCamImageQuad *)self boundingBox];
  if (v2 >= v3) {
    double v4 = v3;
  }
  else {
    double v4 = v2;
  }
  return v4 * 0.1;
}

- (BOOL)containsPointOutsideOfExtendedImageBounds
{
  double v3 = (void *)[(ICDocCamImageQuad *)self copy];
  [(ICDocCamImageQuad *)self boundingBox];
  objc_msgSend(v3, "addPointToQuadPoints:", DCTSDMultiplyPointScalar(v4, v5, -1.0));
  [(ICDocCamImageQuad *)self boundingBox];
  double v7 = 1.0 / v6;
  [(ICDocCamImageQuad *)self boundingBox];
  double v9 = objc_msgSend(v3, "imageQuadByScalingBy:", v7, 1.0 / v8);
  [v9 topLeft];
  double v11 = v10;
  double v13 = v12;
  [v9 topRight];
  double v15 = v14;
  double v17 = v16;
  [v9 bottomRight];
  double v33 = v19;
  double v34 = v18;
  [v9 bottomLeft];
  double v31 = v21;
  double v32 = v20;
  double v22 = DCTSDRectWithPoints(0.0, 0.0, 1.0);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  BOOL v29 = !DCTSDPointInRectInclusive(v11, v13, v22, v23, v25, v27)
     || !DCTSDPointInRectInclusive(v15, v17, v22, v24, v26, v28)
     || !DCTSDPointInRectInclusive(v34, v33, v22, v24, v26, v28)
     || !DCTSDPointInRectInclusive(v32, v31, v22, v24, v26, v28);

  return v29;
}

- (BOOL)containsAngleOutOfValidThreshold
{
  [(ICDocCamImageQuad *)self topLeft];
  double v4 = v3;
  double v6 = v5;
  [(ICDocCamImageQuad *)self topRight];
  double v8 = v7;
  double v10 = v9;
  [(ICDocCamImageQuad *)self bottomRight];
  double v12 = v11;
  double v14 = v13;
  [(ICDocCamImageQuad *)self bottomLeft];
  double v16 = v15;
  double v18 = v17;
  double v26 = DCTSDAngleBetweenPoints(v4, v6, v15, v17, v8, v10);
  double v25 = DCTSDAngleBetweenPoints(v8, v10, v4, v6, v12, v14);
  double v19 = DCTSDAngleBetweenPoints(v12, v14, v8, v10, v16, v18);
  double v20 = DCTSDAngleBetweenPoints(v16, v18, v12, v14, v4, v6);
  double v21 = fabs(v19 + -1.57079633);
  double v22 = fabs(v20 + -1.57079633);
  BOOL v23 = fabs(v26 + -1.57079633) > 1.13446401;
  if (fabs(v25 + -1.57079633) > 1.13446401) {
    BOOL v23 = 1;
  }
  if (v21 > 1.13446401) {
    BOOL v23 = 1;
  }
  return v22 > 1.13446401 || v23;
}

- (BOOL)containsPointsLessThanDistanceThreshold
{
  [(ICDocCamImageQuad *)self mininumAllowedDistanceBetweenPoints];
  double v4 = v3;
  [(ICDocCamImageQuad *)self topLeft];
  double v6 = v5;
  double v8 = v7;
  [(ICDocCamImageQuad *)self topRight];
  double v10 = v9;
  double v12 = v11;
  [(ICDocCamImageQuad *)self bottomRight];
  double v14 = v13;
  double v16 = v15;
  [(ICDocCamImageQuad *)self bottomLeft];
  double v21 = v17;
  double v19 = v18;
  return DCTSDDistance(v6, v8, v10, v12) < v4
      || DCTSDDistance(v6, v8, v14, v16) < v4
      || DCTSDDistance(v6, v8, v21, v19) < v4
      || DCTSDDistance(v10, v12, v21, v19) < v4
      || DCTSDDistance(v10, v12, v14, v16) < v4
      || DCTSDDistance(v14, v16, v21, v19) < v4;
}

- (BOOL)containsIntersectingLines
{
  [(ICDocCamImageQuad *)self topLeft];
  double v4 = v3;
  double v6 = v5;
  [(ICDocCamImageQuad *)self topRight];
  double v8 = v7;
  double v10 = v9;
  [(ICDocCamImageQuad *)self bottomLeft];
  double v12 = v11;
  double v14 = v13;
  [(ICDocCamImageQuad *)self bottomRight];
  double v17 = -[ICDocCamImageQuad intersectionOfLineFrom:to:withLineFrom:to:](self, "intersectionOfLineFrom:to:withLineFrom:to:", v4, v6, v8, v10, v12, v14, v15, v16);
  if (v17)
  {
    BOOL v18 = 1;
  }
  else
  {
    [(ICDocCamImageQuad *)self topRight];
    double v20 = v19;
    double v22 = v21;
    [(ICDocCamImageQuad *)self bottomRight];
    double v24 = v23;
    double v26 = v25;
    [(ICDocCamImageQuad *)self topLeft];
    double v28 = v27;
    double v30 = v29;
    [(ICDocCamImageQuad *)self bottomLeft];
    double v33 = -[ICDocCamImageQuad intersectionOfLineFrom:to:withLineFrom:to:](self, "intersectionOfLineFrom:to:withLineFrom:to:", v20, v22, v24, v26, v28, v30, v31, v32);
    BOOL v18 = v33 != 0;
  }
  return v18;
}

- (id)intersectionOfLineFrom:(CGPoint)a3 to:(CGPoint)a4 withLineFrom:(CGPoint)a5 to:(CGPoint)a6
{
  double v8 = a4.x - a3.x;
  double v9 = a6.y - a5.y;
  double v10 = a4.y - a3.y;
  double v11 = a6.x - a5.x;
  double v12 = v8 * (a6.y - a5.y) - v10 * (a6.x - a5.x);
  double v13 = 0;
  if (v12 != 0.0
    && ((double v15 = a5.x - a3.x, v16 = a5.y - a3.y, v17 = ((a5.x - a3.x) * v9 - v16 * v11) / v12, v17 >= 0.0)
      ? (BOOL v18 = v17 <= 1.0)
      : (BOOL v18 = 0),
        v18 && ((double v19 = (v15 * v10 - v16 * v8) / v12, v19 >= 0.0) ? (v20 = v19 <= 1.0) : (v20 = 0), v20)))
  {
    double v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a3.x + v17 * v8, a3.y + v17 * v10, v6);
  }
  else if (((v7 ^ (2 * v7)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  return v13;
}

+ (id)quadFromVNRectangle:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    double v4 = objc_alloc_init(ICDocCamImageQuad);
    [v3 topRight];
    -[ICDocCamImageQuad setTopRight:](v4, "setTopRight:");
    [v3 topLeft];
    -[ICDocCamImageQuad setTopLeft:](v4, "setTopLeft:");
    [v3 bottomRight];
    -[ICDocCamImageQuad setBottomRight:](v4, "setBottomRight:");
    [v3 bottomLeft];
    -[ICDocCamImageQuad setBottomLeft:](v4, "setBottomLeft:");
    [v3 boundingBox];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    -[ICDocCamImageQuad setBoundingBox:](v4, "setBoundingBox:", v6, v8, v10, v12);
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

+ (id)quadFromCGRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = objc_alloc_init(ICDocCamImageQuad);
  -[ICDocCamImageQuad setTopLeft:](v7, "setTopLeft:", x, y);
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  -[ICDocCamImageQuad setTopRight:](v7, "setTopRight:", CGRectGetMaxX(v10), y);
  [(ICDocCamImageQuad *)v7 setBottomRight:DCTSDRectGetMaxPoint(x, y, width, height)];
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  -[ICDocCamImageQuad setBottomLeft:](v7, "setBottomLeft:", x, CGRectGetMaxY(v11));
  -[ICDocCamImageQuad setBoundingBox:](v7, "setBoundingBox:", x, y, width, height);

  return v7;
}

- (id)flippedQuadFromSourceFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = (void *)[(ICDocCamImageQuad *)self copy];
  objc_msgSend(v7, "flipPointsWithSourceFrame:", x, y, width, height);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (ICDocCamImageQuad *)a3;
  double v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else if (v4 {
         && (([(ICDocCamImageQuad *)self topLeft],
  }
              double v7 = v6,
              double v9 = v8,
              [(ICDocCamImageQuad *)v5 topLeft],
              v7 == v11)
           ? (BOOL v12 = v9 == v10)
           : (BOOL v12 = 0),
             v12))
  {
    [(ICDocCamImageQuad *)self topRight];
    double v16 = v15;
    double v18 = v17;
    [(ICDocCamImageQuad *)v5 topRight];
    BOOL v13 = 0;
    if (v16 == v20 && v18 == v19)
    {
      [(ICDocCamImageQuad *)self bottomRight];
      double v22 = v21;
      double v24 = v23;
      [(ICDocCamImageQuad *)v5 bottomRight];
      BOOL v13 = 0;
      if (v22 == v26 && v24 == v25)
      {
        [(ICDocCamImageQuad *)self bottomLeft];
        double v28 = v27;
        double v30 = v29;
        [(ICDocCamImageQuad *)v5 bottomLeft];
        BOOL v13 = v30 == v32 && v28 == v31;
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_alloc_init(ICDocCamImageQuad);
  [(ICDocCamImageQuad *)self topLeft];
  -[ICDocCamImageQuad setTopLeft:](v4, "setTopLeft:");
  [(ICDocCamImageQuad *)self topRight];
  -[ICDocCamImageQuad setTopRight:](v4, "setTopRight:");
  [(ICDocCamImageQuad *)self bottomRight];
  -[ICDocCamImageQuad setBottomRight:](v4, "setBottomRight:");
  [(ICDocCamImageQuad *)self bottomLeft];
  -[ICDocCamImageQuad setBottomLeft:](v4, "setBottomLeft:");
  [(ICDocCamImageQuad *)self boundingBox];
  -[ICDocCamImageQuad setBoundingBox:](v4, "setBoundingBox:");
  return v4;
}

- (BOOL)isConvex
{
  [(ICDocCamImageQuad *)self bottomLeft];
  double v4 = v3;
  double v6 = v5;
  [(ICDocCamImageQuad *)self bottomRight];
  double v8 = v7;
  double v10 = v9;
  [(ICDocCamImageQuad *)self topRight];
  double v13 = triangleNormalDirection(v4, v6, v8, v10, v11, v12);
  [(ICDocCamImageQuad *)self bottomRight];
  double v15 = v14;
  double v17 = v16;
  [(ICDocCamImageQuad *)self topRight];
  double v19 = v18;
  double v21 = v20;
  [(ICDocCamImageQuad *)self topLeft];
  if (v13 * triangleNormalDirection(v15, v17, v19, v21, v22, v23) <= 0.0) {
    return 0;
  }
  [(ICDocCamImageQuad *)self topRight];
  double v25 = v24;
  double v27 = v26;
  [(ICDocCamImageQuad *)self topLeft];
  double v29 = v28;
  double v31 = v30;
  [(ICDocCamImageQuad *)self bottomLeft];
  if (v13 * triangleNormalDirection(v25, v27, v29, v31, v32, v33) <= 0.0) {
    return 0;
  }
  [(ICDocCamImageQuad *)self topLeft];
  double v35 = v34;
  double v37 = v36;
  [(ICDocCamImageQuad *)self bottomLeft];
  double v39 = v38;
  double v41 = v40;
  [(ICDocCamImageQuad *)self bottomRight];
  return v13 * triangleNormalDirection(v35, v37, v39, v41, v42, v43) > 0.0;
}

- (void)applyOrientation:(int64_t)a3 boundingBox:(CGRect)a4
{
  double v6 = DCTSDCenterOfRect(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v8 = v7;
  [(ICDocCamImageQuad *)self addPointToQuadPoints:DCTSDMultiplyPointScalar(v6, v7, -1.0)];
  [(ICDocCamImageQuad *)self rotatePointsByOrientation:a3];

  -[ICDocCamImageQuad addPointToQuadPoints:](self, "addPointToQuadPoints:", v6, v8);
}

- (void)removeOrientation:(int64_t)a3 boundingBox:(CGRect)a4
{
  double v6 = DCTSDCenterOfRect(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v8 = v7;
  [(ICDocCamImageQuad *)self addPointToQuadPoints:DCTSDMultiplyPointScalar(v6, v7, -1.0)];
  [(ICDocCamImageQuad *)self rotatePointsRemovingOrientation:a3];

  -[ICDocCamImageQuad addPointToQuadPoints:](self, "addPointToQuadPoints:", v6, v8);
}

- (void)rotatePointsRemovingOrientation:(int64_t)a3
{
  for (uint64_t i = -dc_clockwiseRotationsFromUpToMatchOrientation(a3) & 3; i; --i)
    [(ICDocCamImageQuad *)self rotatePointsClockwise];
}

- (void)rotatePointsByOrientation:(int64_t)a3
{
  uint64_t matched = dc_clockwiseRotationsFromUpToMatchOrientation(a3);
  if (matched)
  {
    uint64_t v5 = matched;
    do
    {
      [(ICDocCamImageQuad *)self rotatePointsClockwise];
      --v5;
    }
    while (v5);
  }
}

- (void)rotatePointsClockwise
{
  [(ICDocCamImageQuad *)self topRight];
  -[ICDocCamImageQuad pointRotatedClockwiseAroundOrigin:](self, "pointRotatedClockwiseAroundOrigin:");
  -[ICDocCamImageQuad setTopRight:](self, "setTopRight:");
  [(ICDocCamImageQuad *)self topLeft];
  -[ICDocCamImageQuad pointRotatedClockwiseAroundOrigin:](self, "pointRotatedClockwiseAroundOrigin:");
  -[ICDocCamImageQuad setTopLeft:](self, "setTopLeft:");
  [(ICDocCamImageQuad *)self bottomRight];
  -[ICDocCamImageQuad pointRotatedClockwiseAroundOrigin:](self, "pointRotatedClockwiseAroundOrigin:");
  -[ICDocCamImageQuad setBottomRight:](self, "setBottomRight:");
  [(ICDocCamImageQuad *)self bottomLeft];
  -[ICDocCamImageQuad pointRotatedClockwiseAroundOrigin:](self, "pointRotatedClockwiseAroundOrigin:");

  -[ICDocCamImageQuad setBottomLeft:](self, "setBottomLeft:");
}

- (CGPoint)pointRotatedClockwiseAroundOrigin:(CGPoint)a3
{
  CGFloat y = a3.y;
  double v4 = -a3.x;
  double v5 = y;
  result.CGFloat y = v4;
  result.double x = v5;
  return result;
}

- (void)addPointToQuadPoints:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(ICDocCamImageQuad *)self topLeft];
  [(ICDocCamImageQuad *)self setTopLeft:DCTSDAddPoints(x, y, v6)];
  [(ICDocCamImageQuad *)self topRight];
  [(ICDocCamImageQuad *)self setTopRight:DCTSDAddPoints(x, y, v7)];
  [(ICDocCamImageQuad *)self bottomRight];
  [(ICDocCamImageQuad *)self setBottomRight:DCTSDAddPoints(x, y, v8)];
  [(ICDocCamImageQuad *)self bottomLeft];
  double v10 = DCTSDAddPoints(x, y, v9);

  [(ICDocCamImageQuad *)self setBottomLeft:v10];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICDocCamImageQuad)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICDocCamImageQuad;
  double v5 = [(ICDocCamImageQuad *)&v19 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"kBottomLeftXFieldCodingKey"];
    double v7 = v6;
    [v4 decodeFloatForKey:@"kBottomLeftYFieldCodingKey"];
    -[ICDocCamImageQuad setBottomLeft:](v5, "setBottomLeft:", v7, v8);
    [v4 decodeFloatForKey:@"kBottomRightXFieldCodingKey"];
    double v10 = v9;
    [v4 decodeFloatForKey:@"kBottomRightYFieldCodingKey"];
    -[ICDocCamImageQuad setBottomRight:](v5, "setBottomRight:", v10, v11);
    [v4 decodeFloatForKey:@"kTopLeftXFieldCodingKey"];
    double v13 = v12;
    [v4 decodeFloatForKey:@"kTopLeftYFieldCodingKey"];
    -[ICDocCamImageQuad setTopLeft:](v5, "setTopLeft:", v13, v14);
    [v4 decodeFloatForKey:@"kTopRightXFieldCodingKey"];
    double v16 = v15;
    [v4 decodeFloatForKey:@"kTopRightYFieldCodingKey"];
    -[ICDocCamImageQuad setTopRight:](v5, "setTopRight:", v16, v17);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  [(ICDocCamImageQuad *)self bottomLeft];
  *(float *)&double v4 = v4;
  [v16 encodeFloat:@"kBottomLeftXFieldCodingKey" forKey:v4];
  [(ICDocCamImageQuad *)self bottomLeft];
  *(float *)&double v6 = v5;
  [v16 encodeFloat:@"kBottomLeftYFieldCodingKey" forKey:v6];
  [(ICDocCamImageQuad *)self bottomRight];
  *(float *)&double v7 = v7;
  [v16 encodeFloat:@"kBottomRightXFieldCodingKey" forKey:v7];
  [(ICDocCamImageQuad *)self bottomRight];
  *(float *)&double v9 = v8;
  [v16 encodeFloat:@"kBottomRightYFieldCodingKey" forKey:v9];
  [(ICDocCamImageQuad *)self topLeft];
  *(float *)&double v10 = v10;
  [v16 encodeFloat:@"kTopLeftXFieldCodingKey" forKey:v10];
  [(ICDocCamImageQuad *)self topLeft];
  *(float *)&double v12 = v11;
  [v16 encodeFloat:@"kTopLeftYFieldCodingKey" forKey:v12];
  [(ICDocCamImageQuad *)self topRight];
  *(float *)&double v13 = v13;
  [v16 encodeFloat:@"kTopRightXFieldCodingKey" forKey:v13];
  [(ICDocCamImageQuad *)self topRight];
  *(float *)&double v15 = v14;
  [v16 encodeFloat:@"kTopRightYFieldCodingKey" forKey:v15];
}

- (CGPoint)topLeft
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTopLeft:(CGPoint)a3
{
  self->_topLeft = a3;
}

- (CGPoint)topRight
{
  double x = self->_topRight.x;
  double y = self->_topRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTopRight:(CGPoint)a3
{
  self->_topRight = a3;
}

- (CGPoint)bottomLeft
{
  double x = self->_bottomLeft.x;
  double y = self->_bottomLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBottomLeft:(CGPoint)a3
{
  self->_bottomLeft = a3;
}

- (CGPoint)bottomRight
{
  double x = self->_bottomRight.x;
  double y = self->_bottomRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBottomRight:(CGPoint)a3
{
  self->_bottomRight = a3;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBodouble x = a3;
}

- (id)quadByConvertingFromView:(id)a3 toView:(id)a4 isNormalized:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  double v10 = objc_alloc_init(ICDocCamImageQuad);
  [v8 bounds];
  if (v5)
  {
    double v14 = v11;
    double v15 = v12;
    double v16 = v13;
    [(ICDocCamImageQuad *)self topLeft];
    objc_msgSend(v8, "convertPoint:toView:", v9, DCTSDPointFromNormalizedRect(v17, v18, v14, v15, v16));
    -[ICDocCamImageQuad setTopLeft:](v10, "setTopLeft:");
    [(ICDocCamImageQuad *)self topRight];
    objc_msgSend(v8, "convertPoint:toView:", v9, DCTSDPointFromNormalizedRect(v19, v20, v14, v15, v16));
    -[ICDocCamImageQuad setTopRight:](v10, "setTopRight:");
    [(ICDocCamImageQuad *)self bottomRight];
    objc_msgSend(v8, "convertPoint:toView:", v9, DCTSDPointFromNormalizedRect(v21, v22, v14, v15, v16));
    -[ICDocCamImageQuad setBottomRight:](v10, "setBottomRight:");
    [(ICDocCamImageQuad *)self bottomLeft];
    double v25 = DCTSDPointFromNormalizedRect(v23, v24, v14, v15, v16);
  }
  else
  {
    [(ICDocCamImageQuad *)self topLeft];
    objc_msgSend(v8, "convertPoint:toView:", v9);
    -[ICDocCamImageQuad setTopLeft:](v10, "setTopLeft:");
    [(ICDocCamImageQuad *)self topRight];
    objc_msgSend(v8, "convertPoint:toView:", v9);
    -[ICDocCamImageQuad setTopRight:](v10, "setTopRight:");
    [(ICDocCamImageQuad *)self bottomRight];
    objc_msgSend(v8, "convertPoint:toView:", v9);
    -[ICDocCamImageQuad setBottomRight:](v10, "setBottomRight:");
    [(ICDocCamImageQuad *)self bottomLeft];
  }
  [v8 convertPoint:v9 toView:v25];
  double v27 = v26;
  double v29 = v28;

  -[ICDocCamImageQuad setBottomLeft:](v10, "setBottomLeft:", v27, v29);

  return v10;
}

- (id)normalizedQuadByConvertingFromView:(id)a3 toView:(id)a4 toViewSize:(CGSize)a5
{
  double width = a5.width;
  id v8 = a4;
  id v9 = a3;
  double v10 = objc_alloc_init(ICDocCamImageQuad);
  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(ICDocCamImageQuad *)self topLeft];
  objc_msgSend(v9, "convertPoint:toView:", v8);
  -[ICDocCamImageQuad setTopLeft:](v10, "setTopLeft:");
  [(ICDocCamImageQuad *)self topRight];
  objc_msgSend(v9, "convertPoint:toView:", v8);
  -[ICDocCamImageQuad setTopRight:](v10, "setTopRight:");
  [(ICDocCamImageQuad *)self bottomRight];
  objc_msgSend(v9, "convertPoint:toView:", v8);
  -[ICDocCamImageQuad setBottomRight:](v10, "setBottomRight:");
  [(ICDocCamImageQuad *)self bottomLeft];
  objc_msgSend(v9, "convertPoint:toView:", v8);
  double v14 = v13;
  double v16 = v15;

  -[ICDocCamImageQuad setBottomLeft:](v10, "setBottomLeft:", v14, v16);
  [(ICDocCamImageQuad *)v10 topLeft];
  [(ICDocCamImageQuad *)v10 setTopLeft:DCTSDNormalizedPointInRect(v17, v18, v11, v12, width)];
  [(ICDocCamImageQuad *)v10 topRight];
  [(ICDocCamImageQuad *)v10 setTopRight:DCTSDNormalizedPointInRect(v19, v20, v11, v12, width)];
  [(ICDocCamImageQuad *)v10 bottomRight];
  [(ICDocCamImageQuad *)v10 setBottomRight:DCTSDNormalizedPointInRect(v21, v22, v11, v12, width)];
  [(ICDocCamImageQuad *)v10 bottomLeft];
  [(ICDocCamImageQuad *)v10 setBottomLeft:DCTSDNormalizedPointInRect(v23, v24, v11, v12, width)];

  return v10;
}

@end