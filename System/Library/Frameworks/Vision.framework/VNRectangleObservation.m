@interface VNRectangleObservation
+ (BOOL)boundingBoxIsCalculatedProperty;
+ (BOOL)supportsSecureCoding;
+ (VNRectangleObservation)observationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4;
+ (VNRectangleObservation)rectangleObservationWithRequestRevision:(NSUInteger)requestRevision topLeft:(CGPoint)topLeft bottomLeft:(CGPoint)bottomLeft bottomRight:(CGPoint)bottomRight topRight:(CGPoint)topRight;
+ (VNRectangleObservation)rectangleObservationWithRequestRevision:(NSUInteger)requestRevision topLeft:(CGPoint)topLeft topRight:(CGPoint)topRight bottomRight:(CGPoint)bottomRight bottomLeft:(CGPoint)bottomLeft;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (VNRectangleObservation)initWithBoundingBox:(CGRect)a3;
- (VNRectangleObservation)initWithCoder:(id)a3;
- (VNRectangleObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4;
- (VNRectangleObservation)initWithOriginatingRequestSpecifier:(id)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomRight:(CGPoint)a6 bottomLeft:(CGPoint)a7;
- (VNRectangleObservation)initWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4;
- (VNRectangleObservation)initWithRequestRevision:(unint64_t)a3 topLeft:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6 topRight:(CGPoint)a7;
- (VNRectangleObservation)initWithRequestRevision:(unint64_t)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomRight:(CGPoint)a6 bottomLeft:(CGPoint)a7;
- (VNRectangleObservation)initWithTopLeft:(CGPoint)a3 bottomLeft:(CGPoint)a4 bottomRight:(CGPoint)a5 topRight:(CGPoint)a6;
- (double)initWithOriginatingRequestSpecifier:(double)a3 topLeft:(double)a4 topRight:(double)a5 bottomRight:(double)a6 bottomLeft:(double)a7 boundingBox:(double)a8;
- (id)debugQuickLookObject;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)_setQuadrilateralPointsFromBoundingBox:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getTopLeftPoint:(CGPoint *)a3 topRightPoint:(CGPoint *)a4 bottomRightPoint:(CGPoint *)a5 bottomLeftPoint:(CGPoint *)a6 inTopLeftOrigin:(BOOL)a7 orientation:(unsigned int)a8;
@end

@implementation VNRectangleObservation

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

- (CGPoint)topLeft
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)debugQuickLookObject
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(VNRectangleObservation *)self topLeft];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  [(VNRectangleObservation *)self bottomLeft];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(VNRectangleObservation *)self bottomRight];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(VNRectangleObservation *)self topRight];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  Mutable = CGPathCreateMutable();
  v20 = (const CGAffineTransform *)MEMORY[0x1E4F1DAB8];
  CGPathMoveToPoint(Mutable, MEMORY[0x1E4F1DAB8], v4, v6);
  CGPathAddLineToPoint(Mutable, v20, v8, v10);
  CGPathAddLineToPoint(Mutable, v20, v12, v14);
  CGPathAddLineToPoint(Mutable, v20, v16, v18);
  CGPathAddLineToPoint(Mutable, v20, v4, v6);
  CGPathCloseSubpath(Mutable);
  if (Mutable)
  {
    v25.receiver = self;
    v25.super_class = (Class)VNRectangleObservation;
    v21 = [(VNDetectedObjectObservation *)&v25 debugQuickLookObject];
    if (v21)
    {
      v26[0] = xmmword_1A4125548;
      v26[1] = unk_1A4125558;
      v22 = (CGColor *)VNDebugColorFromValues((const CGFloat *)v26);
      VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)Mutable, v21, v22);
    }
    else
    {
      VNDebugPathFromNormalizedCGPath((uint64_t)Mutable, 512.0, 512.0);
    v23 = };

    CGPathRelease(Mutable);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)_setQuadrilateralPointsFromBoundingBox:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat MaxY = CGRectGetMaxY(a3);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v14);
  if (self)
  {
    self->_topLeft.CGFloat x = MinX;
    self->_topLeft.CGFloat y = MaxY;
    self->_topRight.CGFloat x = MaxX;
    self->_topRight.CGFloat y = MaxY;
    self->_bottomRight.CGFloat x = MaxX;
    self->_bottomRight.CGFloat y = MinY;
    self->_bottomLeft.CGFloat x = MinX;
    self->_bottomLeft.CGFloat y = MinY;
  }
}

- (VNRectangleObservation)initWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)VNRectangleObservation;
  CGFloat v8 = -[VNDetectedObjectObservation initWithRequestRevision:boundingBox:](&v12, sel_initWithRequestRevision_boundingBox_, a3);
  double v9 = v8;
  if (v8)
  {
    -[VNRectangleObservation _setQuadrilateralPointsFromBoundingBox:](v8, "_setQuadrilateralPointsFromBoundingBox:", x, y, width, height);
    CGFloat v10 = v9;
  }

  return v9;
}

- (VNRectangleObservation)initWithBoundingBox:(CGRect)a3
{
  return -[VNRectangleObservation initWithRequestRevision:boundingBox:](self, "initWithRequestRevision:boundingBox:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isEqual:(id)a3
{
  CGFloat v4 = (VNRectangleObservation *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)VNRectangleObservation;
    if ([(VNDetectedObjectObservation *)&v32 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      double v5 = v4;
      [(VNRectangleObservation *)self topLeft];
      double v7 = v6;
      double v9 = v8;
      [(VNRectangleObservation *)v5 topLeft];
      BOOL v11 = 0;
      if (v7 == v12 && v9 == v10)
      {
        [(VNRectangleObservation *)self topRight];
        double v14 = v13;
        double v16 = v15;
        [(VNRectangleObservation *)v5 topRight];
        BOOL v11 = 0;
        if (v14 == v18 && v16 == v17)
        {
          [(VNRectangleObservation *)self bottomLeft];
          double v20 = v19;
          double v22 = v21;
          [(VNRectangleObservation *)v5 bottomLeft];
          BOOL v11 = 0;
          if (v20 == v24 && v22 == v23)
          {
            [(VNRectangleObservation *)self bottomRight];
            double v26 = v25;
            double v28 = v27;
            [(VNRectangleObservation *)v5 bottomRight];
            BOOL v11 = v28 == v30 && v26 == v29;
          }
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v24.receiver = self;
  v24.super_class = (Class)VNRectangleObservation;
  id v3 = [(VNDetectedObjectObservation *)&v24 hash];
  [(VNRectangleObservation *)self topLeft];
  double v6 = v5;
  if (v5 == 0.0) {
    double v6 = 0.0;
  }
  double v7 = v4;
  if (v4 == 0.0) {
    double v7 = 0.0;
  }
  uint64_t v8 = *(void *)&v7 ^ __ROR8__(*(void *)&v6, 51) ^ __ROR8__(v3, 51);
  [(VNRectangleObservation *)self topRight];
  double v11 = v10;
  if (v10 == 0.0) {
    double v11 = 0.0;
  }
  double v12 = v9;
  if (v9 == 0.0) {
    double v12 = 0.0;
  }
  uint64_t v13 = *(void *)&v12 ^ __ROR8__(*(void *)&v11, 51) ^ __ROR8__(v8, 51);
  [(VNRectangleObservation *)self bottomLeft];
  double v16 = v15;
  if (v15 == 0.0) {
    double v16 = 0.0;
  }
  double v17 = v14;
  if (v14 == 0.0) {
    double v17 = 0.0;
  }
  uint64_t v18 = *(void *)&v17 ^ __ROR8__(*(void *)&v16, 51) ^ __ROR8__(v13, 51);
  [(VNRectangleObservation *)self bottomRight];
  double v21 = v20;
  if (v20 == 0.0) {
    double v21 = 0.0;
  }
  double v22 = v19;
  if (v19 == 0.0) {
    double v22 = 0.0;
  }
  return *(void *)&v22 ^ __ROR8__(*(void *)&v21, 51) ^ __ROR8__(v18, 51);
}

- (id)vn_cloneObject
{
  v5.receiver = self;
  v5.super_class = (Class)VNRectangleObservation;
  id v3 = [(VNDetectedObjectObservation *)&v5 vn_cloneObject];
  if (v3)
  {
    v3[10] = self->_topLeft;
    v3[13] = self->_topRight;
    v3[11] = self->_bottomLeft;
    v3[12] = self->_bottomRight;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNRectangleObservation;
  [(VNDetectedObjectObservation *)&v5 encodeWithCoder:v4];
  [v4 encodeDouble:@"TLX" forKey:self->_topLeft.x];
  [v4 encodeDouble:@"TLY" forKey:self->_topLeft.y];
  [v4 encodeDouble:@"TRX" forKey:self->_topRight.x];
  [v4 encodeDouble:@"TRY" forKey:self->_topRight.y];
  [v4 encodeDouble:@"BLX" forKey:self->_bottomLeft.x];
  [v4 encodeDouble:@"BLY" forKey:self->_bottomLeft.y];
  self = (VNRectangleObservation *)((char *)self + 192);
  [v4 encodeDouble:@"BRX" forKey:*(double *)&self->super.super.super.isa];
  [v4 encodeDouble:@"BRY" forKey:*(double *)&self->super.super._originatingRequestSpecifier];
}

- (VNRectangleObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)VNRectangleObservation;
  objc_super v5 = [(VNDetectedObjectObservation *)&v28 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"TLX"];
    CGFloat v7 = v6;
    [v4 decodeDoubleForKey:@"TLY"];
    CGFloat v9 = v8;
    [v4 decodeDoubleForKey:@"TRX"];
    CGFloat v11 = v10;
    [v4 decodeDoubleForKey:@"TRY"];
    CGFloat v13 = v12;
    [v4 decodeDoubleForKey:@"BLX"];
    CGFloat v15 = v14;
    [v4 decodeDoubleForKey:@"BLY"];
    CGFloat v17 = v16;
    [v4 decodeDoubleForKey:@"BRX"];
    CGFloat v19 = v18;
    [v4 decodeDoubleForKey:@"BRY"];
    CGFloat v21 = v20;
    VisionCoreBoundingBoxForQuadrilateralPoints();
    v5->super._boundingBox.origin.double x = v22;
    v5->super._boundingBox.origin.double y = v23;
    v5->super._boundingBox.size.double width = v24;
    v5->super._boundingBox.size.double height = v25;
    v5->_topLeft.double x = v7;
    v5->_topLeft.double y = v9;
    v5->_topRight.double x = v11;
    v5->_topRight.double y = v13;
    v5->_bottomRight.double x = v19;
    v5->_bottomRight.double y = v21;
    v5->_bottomLeft.double x = v15;
    v5->_bottomLeft.double y = v17;
    double v26 = v5;
  }
  else
  {
    double v26 = 0;
  }

  return v26;
}

- (double)initWithOriginatingRequestSpecifier:(double)a3 topLeft:(double)a4 topRight:(double)a5 bottomRight:(double)a6 bottomLeft:(double)a7 boundingBox:(double)a8
{
  v29.receiver = a1;
  v29.super_class = (Class)VNRectangleObservation;
  CGPoint result = (double *)objc_msgSendSuper2(&v29, sel_initWithOriginatingRequestSpecifier_boundingBox_, a10, a11, a12, a13);
  if (result)
  {
    result[20] = a2;
    result[21] = a3;
    result[22] = a8;
    result[23] = a9;
    result[24] = a6;
    result[25] = a7;
    result[26] = a4;
    result[27] = a5;
  }
  return result;
}

- (VNRectangleObservation)initWithOriginatingRequestSpecifier:(id)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomRight:(CGPoint)a6 bottomLeft:(CGPoint)a7
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  CGFloat v9 = a6.y;
  CGFloat v10 = a6.x;
  CGFloat v11 = a5.y;
  CGFloat v12 = a5.x;
  CGFloat v13 = a4.y;
  CGFloat v14 = a4.x;
  id v16 = a3;
  VisionCoreBoundingBoxForQuadrilateralPoints();
  v20.receiver = self;
  v20.super_class = (Class)VNRectangleObservation;
  CGFloat v17 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:](&v20, sel_initWithOriginatingRequestSpecifier_boundingBox_, v16);
  double v18 = v17;
  if (v17)
  {
    v17->_topLeft.CGFloat x = v14;
    v17->_topLeft.CGFloat y = v13;
    v17->_topRight.CGFloat x = v12;
    v17->_topRight.CGFloat y = v11;
    v17->_bottomRight.CGFloat x = v10;
    v17->_bottomRight.CGFloat y = v9;
    v17->_bottomLeft.CGFloat x = x;
    v17->_bottomLeft.CGFloat y = y;
  }

  return v18;
}

- (VNRectangleObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNRectangleObservation;
  CGFloat v10 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:](&v14, sel_initWithOriginatingRequestSpecifier_boundingBox_, v9, x, y, width, height);
  CGFloat v11 = v10;
  if (v10)
  {
    -[VNRectangleObservation _setQuadrilateralPointsFromBoundingBox:](v10, "_setQuadrilateralPointsFromBoundingBox:", x, y, width, height);
    CGFloat v12 = v11;
  }

  return v11;
}

- (VNRectangleObservation)initWithRequestRevision:(unint64_t)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomRight:(CGPoint)a6 bottomLeft:(CGPoint)a7
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  CGFloat v9 = a6.y;
  CGFloat v10 = a6.x;
  CGFloat v11 = a5.y;
  CGFloat v12 = a5.x;
  CGFloat v13 = a4.y;
  CGFloat v14 = a4.x;
  VisionCoreBoundingBoxForQuadrilateralPoints();
  v18.receiver = self;
  v18.super_class = (Class)VNRectangleObservation;
  CGPoint result = -[VNDetectedObjectObservation initWithRequestRevision:boundingBox:](&v18, sel_initWithRequestRevision_boundingBox_, a3);
  if (result)
  {
    result->_topLeft.CGFloat x = v14;
    result->_topLeft.CGFloat y = v13;
    result->_topRight.CGFloat x = v12;
    result->_topRight.CGFloat y = v11;
    result->_bottomRight.CGFloat x = v10;
    result->_bottomRight.CGFloat y = v9;
    result->_bottomLeft.CGFloat x = x;
    result->_bottomLeft.CGFloat y = y;
  }
  return result;
}

- (VNRectangleObservation)initWithRequestRevision:(unint64_t)a3 topLeft:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6 topRight:(CGPoint)a7
{
  return -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:](self, "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", a3, a4.x, a4.y, a7.x, a7.y, a6.x, a6.y, a5.x, a5.y);
}

- (VNRectangleObservation)initWithTopLeft:(CGPoint)a3 bottomLeft:(CGPoint)a4 bottomRight:(CGPoint)a5 topRight:(CGPoint)a6
{
  return -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:](self, "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", 1, a3.x, a3.y, a6.x, a6.y, a5.x, a5.y, a4.x, a4.y);
}

+ (BOOL)boundingBoxIsCalculatedProperty
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (VNRectangleObservation)rectangleObservationWithRequestRevision:(NSUInteger)requestRevision topLeft:(CGPoint)topLeft topRight:(CGPoint)topRight bottomRight:(CGPoint)bottomRight bottomLeft:(CGPoint)bottomLeft
{
  CGFloat v7 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", requestRevision, topLeft.x, topLeft.y, topRight.x, topRight.y, bottomRight.x, bottomRight.y, bottomLeft.x, bottomLeft.y);

  return (VNRectangleObservation *)v7;
}

+ (VNRectangleObservation)rectangleObservationWithRequestRevision:(NSUInteger)requestRevision topLeft:(CGPoint)topLeft bottomLeft:(CGPoint)bottomLeft bottomRight:(CGPoint)bottomRight topRight:(CGPoint)topRight
{
  CGFloat v7 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:topLeft:bottomLeft:bottomRight:topRight:", requestRevision, topLeft.x, topLeft.y, bottomLeft.x, bottomLeft.y, bottomRight.x, bottomRight.y, topRight.x, topRight.y);

  return (VNRectangleObservation *)v7;
}

+ (VNRectangleObservation)observationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4
{
  id v4 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);

  return (VNRectangleObservation *)v4;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNDetectRectanglesRequest";
}

- (void)getTopLeftPoint:(CGPoint *)a3 topRightPoint:(CGPoint *)a4 bottomRightPoint:(CGPoint *)a5 bottomLeftPoint:(CGPoint *)a6 inTopLeftOrigin:(BOOL)a7 orientation:(unsigned int)a8
{
  float64x2_t v23 = 0u;
  float64x2_t v24 = 0u;
  float64x2_t v22 = 0u;
  v13.CGFloat x = VNAffineTransformForVisionToTopLeftOriginOrientation(a7, a8, (uint64_t)&v22);
  if (a3)
  {
    [(VNRectangleObservation *)self topLeft];
    CGPoint v13 = (CGPoint)vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v14), v22, v15));
    *a3 = v13;
  }
  if (a4)
  {
    [(VNRectangleObservation *)self topRight];
    CGPoint v13 = (CGPoint)vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v16), v22, v17));
    *a4 = v13;
  }
  if (a5)
  {
    [(VNRectangleObservation *)self bottomRight];
    CGPoint v13 = (CGPoint)vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v18), v22, v19));
    *a5 = v13;
  }
  if (a6)
  {
    [(VNRectangleObservation *)self bottomLeft];
    *(float64x2_t *)a6 = vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v20), v22, v21));
  }
}

@end