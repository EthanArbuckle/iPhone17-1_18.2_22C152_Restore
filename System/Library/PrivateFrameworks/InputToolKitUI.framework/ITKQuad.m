@interface ITKQuad
+ (BOOL)supportsSecureCoding;
+ (CATransform3D)transformToConvertLayer:(SEL)a3 intoQuad:(id)a4 frame:(id)a5;
+ (CGPoint)vertexCentroidFromQuads:(id)a3;
+ (id)quadFromCGRect:(CGRect)a3;
+ (id)quadFromUnionOfQuads:(id)a3 baselineAngle:(double)a4;
- (BOOL)containsIntersectingLines;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)intersectsQuad:(id)a3;
- (BOOL)isCompletelyInsideRect:(CGRect)a3;
- (BOOL)isEqual:(id)a3;
- (CGAffineTransform)rotationTransformAndBoundingBox:(SEL)a3;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGPoint)vertexCentroid;
- (CGRect)boundingBox;
- (CGRect)minimumBoundingRectWithoutRotation;
- (ITKQuad)initWithBottomLeft:(CGPoint)a3 bottomRight:(CGPoint)a4 topLeft:(CGPoint)a5 topRight:(CGPoint)a6;
- (ITKQuad)initWithCoder:(id)a3;
- (ITKQuad)initWithDictionary:(id)a3;
- (ITKQuad)initWithPoints:(id)a3;
- (ITKQuad)initWithRect:(CGRect)a3;
- (ITKQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6;
- (ITKQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6;
- (ITKQuad)quadByAdjustingOrientation;
- (ITKQuadSideLength)sideLength;
- (NSArray)allPoints;
- (NSString)summaryDescription;
- (UIBezierPath)path;
- (double)area;
- (double)averagedAngleFromBottomAndTopEdges;
- (double)boundingBoxArea;
- (double)distanceFromLine:(CGPoint *)a3 toPoint:(CGPoint)a4;
- (double)maxHeight;
- (double)minimumDistanceToPoint:(CGPoint)a3;
- (double)pointInsideValueForStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 testPoint:(CGPoint)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)intersectionOfLineFrom:(CGPoint)a3 to:(CGPoint)a4 withLineFrom:(CGPoint)a5 to:(CGPoint)a6;
- (id)normalizedQuadByConvertingFromView:(id)a3 toView:(id)a4 toViewSize:(CGSize)a5;
- (id)normalizedQuadFromView:(id)a3;
- (id)quadByConvertingFromNormalizedRectToView:(id)a3 contentsRect:(CGRect)a4;
- (id)quadByConvertingFromView:(id)a3 toView:(id)a4 isNormalized:(BOOL)a5;
- (id)quadByFlippingPointsWithSourceFrame:(CGRect)a3;
- (id)quadFromAddingPoint:(CGPoint)a3;
- (id)quadFromRotatingAroundCentroidWithAngle:(double)a3;
- (id)quadFromRotatingAroundOriginWithAngle:(double)a3;
- (id)quadFromSubtractingPoint:(CGPoint)a3;
- (id)quadFromUnionWithQuad:(id)a3;
- (id)quadMultipliedBySize:(CGSize)a3;
- (id)subquadFromRect:(CGRect)a3;
- (unint64_t)layoutDirection;
- (void)calcluateBoundingBox;
- (void)encodeWithCoder:(id)a3;
- (void)setLayoutDirection:(unint64_t)a3;
@end

@implementation ITKQuad

- (ITKQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  result = [(ITKQuad *)self init];
  if (result)
  {
    result->_bottomLeft.CGFloat x = v9;
    result->_bottomLeft.CGFloat y = v8;
    result->_bottomRight.CGFloat x = x;
    result->_bottomRight.CGFloat y = y;
    result->_topLeft.CGFloat x = v13;
    result->_topLeft.CGFloat y = v12;
    result->_topRight.CGFloat x = v11;
    result->_topRight.CGFloat y = v10;
  }
  return result;
}

- (ITKQuad)initWithBottomLeft:(CGPoint)a3 bottomRight:(CGPoint)a4 topLeft:(CGPoint)a5 topRight:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  result = [(ITKQuad *)self init];
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

- (ITKQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  result = [(ITKQuad *)self init];
  if (result)
  {
    result->_bottomLeft.CGFloat x = x;
    result->_bottomLeft.CGFloat y = y;
    result->_bottomRight.CGFloat x = v9;
    result->_bottomRight.CGFloat y = v8;
    result->_topLeft.CGFloat x = v13;
    result->_topLeft.CGFloat y = v12;
    result->_topRight.CGFloat x = v11;
    result->_topRight.CGFloat y = v10;
  }
  return result;
}

- (ITKQuad)initWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v8 = CGRectGetMaxY(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v9 = CGRectGetMinX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v11 = CGRectGetMaxX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v12 = CGRectGetMinY(v24);
  return -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", MinX, MaxY, MaxX, v8, v9, MinY, v11, v12);
}

- (ITKQuad)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"BL_X"];
  [v5 doubleValue];
  double v7 = v6;
  double v8 = [v4 objectForKeyedSubscript:@"BL_Y"];
  [v8 doubleValue];
  double v10 = v9;

  double v11 = [v4 objectForKeyedSubscript:@"BR_X"];
  [v11 doubleValue];
  double v13 = v12;
  v14 = [v4 objectForKeyedSubscript:@"BR_Y"];
  [v14 doubleValue];
  double v16 = v15;

  v17 = [v4 objectForKeyedSubscript:@"TL_X"];
  [v17 doubleValue];
  double v19 = v18;
  CGRect v20 = [v4 objectForKeyedSubscript:@"TL_Y"];
  [v20 doubleValue];
  double v22 = v21;

  CGRect v23 = [v4 objectForKeyedSubscript:@"TR_X"];
  [v23 doubleValue];
  double v25 = v24;
  v26 = [v4 objectForKeyedSubscript:@"TR_Y"];

  [v26 doubleValue];
  double v28 = v27;

  return -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", v7, v10, v13, v16, v19, v22, v25, v28);
}

- (ITKQuad)initWithPoints:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 4)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    objc_msgSend(v5, "itk_pointValue");
    double v7 = v6;
    double v9 = v8;

    double v10 = [v4 objectAtIndexedSubscript:1];
    objc_msgSend(v10, "itk_pointValue");
    double v12 = v11;
    double v14 = v13;

    double v15 = [v4 objectAtIndexedSubscript:2];
    objc_msgSend(v15, "itk_pointValue");
    double v17 = v16;
    double v19 = v18;

    CGRect v20 = [v4 objectAtIndexedSubscript:3];
    objc_msgSend(v20, "itk_pointValue");
    double v22 = v21;
    double v24 = v23;

    self = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", v17, v19, v22, v24, v7, v9, v12, v14);
    double v25 = self;
  }
  else
  {
    double v25 = 0;
  }

  return v25;
}

+ (id)quadFromCGRect:(CGRect)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ITKQuad)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"BL_X"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"BL_Y"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"BR_X"];
  double v10 = v9;
  [v4 decodeDoubleForKey:@"BR_Y"];
  double v12 = v11;
  [v4 decodeDoubleForKey:@"TL_X"];
  double v14 = v13;
  [v4 decodeDoubleForKey:@"TL_Y"];
  double v16 = v15;
  [v4 decodeDoubleForKey:@"TR_X"];
  double v18 = v17;
  [v4 decodeDoubleForKey:@"TR_Y"];
  CGRect v20 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](self, "initWithBottomLeft:bottomRight:topLeft:topRight:", v6, v8, v10, v12, v14, v16, v18, v19);
  uint64_t v21 = [v4 decodeIntegerForKey:@"LD"];

  [(ITKQuad *)v20 setLayoutDirection:v21];
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [(ITKQuad *)self bottomLeft];
  objc_msgSend(v8, "encodeDouble:forKey:", @"BL_X");
  [(ITKQuad *)self bottomLeft];
  [v8 encodeDouble:@"BL_Y" forKey:v4];
  [(ITKQuad *)self bottomRight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"BR_X");
  [(ITKQuad *)self bottomRight];
  [v8 encodeDouble:@"BR_Y" forKey:v5];
  [(ITKQuad *)self topLeft];
  objc_msgSend(v8, "encodeDouble:forKey:", @"TL_X");
  [(ITKQuad *)self topLeft];
  [v8 encodeDouble:@"TL_Y" forKey:v6];
  [(ITKQuad *)self topRight];
  objc_msgSend(v8, "encodeDouble:forKey:", @"TR_X");
  [(ITKQuad *)self topRight];
  [v8 encodeDouble:@"TR_Y" forKey:v7];
  objc_msgSend(v8, "encodeInteger:forKey:", -[ITKQuad layoutDirection](self, "layoutDirection"), @"LD");
}

- (id)dictionaryRepresentation
{
  v15[9] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(NSNumber, "numberWithDouble:", self->_bottomLeft.x, @"BL_X");
  v15[0] = v3;
  v14[1] = @"BL_Y";
  double v4 = [NSNumber numberWithDouble:self->_bottomLeft.y];
  v15[1] = v4;
  v14[2] = @"BR_X";
  double v5 = [NSNumber numberWithDouble:self->_bottomRight.x];
  v15[2] = v5;
  v14[3] = @"BR_Y";
  double v6 = [NSNumber numberWithDouble:self->_bottomRight.y];
  v15[3] = v6;
  v14[4] = @"TL_X";
  double v7 = [NSNumber numberWithDouble:self->_topLeft.x];
  v15[4] = v7;
  v14[5] = @"TL_Y";
  id v8 = [NSNumber numberWithDouble:self->_topLeft.y];
  v15[5] = v8;
  v14[6] = @"TR_X";
  double v9 = [NSNumber numberWithDouble:self->_topRight.x];
  v15[6] = v9;
  v14[7] = @"TR_Y";
  double v10 = [NSNumber numberWithDouble:self->_topRight.y];
  v15[7] = v10;
  v14[8] = @"LD";
  double v11 = [NSNumber numberWithUnsignedInteger:self->_layoutDirection];
  v15[8] = v11;
  double v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:9];

  return v12;
}

- (CGRect)boundingBox
{
  if (CGRectEqualToRect(*MEMORY[0x263F001A8], self->_boundingBox)) {
    [(ITKQuad *)self calcluateBoundingBox];
  }
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

- (void)calcluateBoundingBox
{
  ITKRectWithPoints();
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  ITKRectWithPoints();
  v16.origin.double x = v11;
  v16.origin.double y = v12;
  v16.size.double width = v13;
  v16.size.double height = v14;
  v15.origin.double x = v4;
  v15.origin.double y = v6;
  v15.size.double width = v8;
  v15.size.double height = v10;
  self->_boundingBodouble x = CGRectUnion(v15, v16);
}

- (double)area
{
  [(ITKQuad *)self sideLength];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  ITKAngleBetweenPoints();
  double v11 = v10;
  ITKAngleBetweenPoints();
  double v13 = v11 + v12;
  double v14 = (v5 + v7 + v9 + v3) * 0.5;
  double v15 = (v14 - v7) * ((v14 - v9) * (v14 - v3));
  double v16 = v14 - v5;
  long double v17 = cos(v13 * 0.5);
  return sqrt(v5 * (v7 * -(v9 * v3)) * (v17 * v17) + v15 * v16);
}

- (double)boundingBoxArea
{
  [(ITKQuad *)self boundingBox];
  return v2 * v3;
}

- (NSString)summaryDescription
{
  double v3 = NSString;
  [(ITKQuad *)self topLeft];
  uint64_t v5 = v4;
  [(ITKQuad *)self topLeft];
  uint64_t v7 = v6;
  [(ITKQuad *)self topRight];
  uint64_t v9 = v8;
  [(ITKQuad *)self topRight];
  uint64_t v11 = v10;
  [(ITKQuad *)self bottomLeft];
  uint64_t v13 = v12;
  [(ITKQuad *)self bottomLeft];
  uint64_t v15 = v14;
  [(ITKQuad *)self bottomRight];
  uint64_t v17 = v16;
  [(ITKQuad *)self bottomRight];
  return (NSString *)[v3 stringWithFormat:@"TL:%.2f %.2f TR:%.2f %.2f BL:%.2f %.2f BR:%.2f %.2f", v5, v7, v9, v11, v13, v15, v17, v18];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"topLeft    : %.2f %.2f \ntopRight   : %.2f %.2f \nbottomLeft : %.2f %.2f \nbottomRight: %.2f %.2f", *(void *)&self->_topLeft.x, *(void *)&self->_topLeft.y, *(void *)&self->_topRight.x, *(void *)&self->_topRight.y, *(void *)&self->_bottomLeft.x, *(void *)&self->_bottomLeft.y, *(void *)&self->_bottomRight.x, *(void *)&self->_bottomRight.y];
}

- (NSArray)allPoints
{
  v13[4] = *MEMORY[0x263EF8340];
  double v3 = (void *)MEMORY[0x263F08D40];
  [(ITKQuad *)self topLeft];
  uint64_t v4 = objc_msgSend(v3, "itk_valueWithPoint:");
  v13[0] = v4;
  uint64_t v5 = (void *)MEMORY[0x263F08D40];
  [(ITKQuad *)self topRight];
  uint64_t v6 = objc_msgSend(v5, "itk_valueWithPoint:");
  v13[1] = v6;
  uint64_t v7 = (void *)MEMORY[0x263F08D40];
  [(ITKQuad *)self bottomLeft];
  uint64_t v8 = objc_msgSend(v7, "itk_valueWithPoint:");
  v13[2] = v8;
  uint64_t v9 = (void *)MEMORY[0x263F08D40];
  [(ITKQuad *)self bottomRight];
  uint64_t v10 = objc_msgSend(v9, "itk_valueWithPoint:");
  v13[3] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];

  return (NSArray *)v11;
}

- (BOOL)containsIntersectingLines
{
  [(ITKQuad *)self topLeft];
  double v4 = v3;
  double v6 = v5;
  [(ITKQuad *)self topRight];
  double v8 = v7;
  double v10 = v9;
  [(ITKQuad *)self bottomLeft];
  double v12 = v11;
  double v14 = v13;
  [(ITKQuad *)self bottomRight];
  uint64_t v17 = -[ITKQuad intersectionOfLineFrom:to:withLineFrom:to:](self, "intersectionOfLineFrom:to:withLineFrom:to:", v4, v6, v8, v10, v12, v14, v15, v16);
  if (v17)
  {
    BOOL v18 = 1;
  }
  else
  {
    [(ITKQuad *)self topRight];
    double v20 = v19;
    double v22 = v21;
    [(ITKQuad *)self bottomRight];
    double v24 = v23;
    double v26 = v25;
    [(ITKQuad *)self topLeft];
    double v28 = v27;
    double v30 = v29;
    [(ITKQuad *)self bottomLeft];
    v33 = -[ITKQuad intersectionOfLineFrom:to:withLineFrom:to:](self, "intersectionOfLineFrom:to:withLineFrom:to:", v20, v22, v24, v26, v28, v30, v31, v32);
    BOOL v18 = v33 != 0;
  }
  return v18;
}

- (ITKQuadSideLength)sideLength
{
  [(ITKQuad *)self bottomLeft];
  [(ITKQuad *)self topLeft];
  ITKDistance();
  double v4 = v3;
  [(ITKQuad *)self bottomRight];
  [(ITKQuad *)self topRight];
  ITKDistance();
  double v6 = v5;
  [(ITKQuad *)self topLeft];
  [(ITKQuad *)self topRight];
  ITKDistance();
  double v8 = v7;
  [(ITKQuad *)self bottomLeft];
  [(ITKQuad *)self bottomRight];
  ITKDistance();
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.var3 = v10;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (double)maxHeight
{
  [(ITKQuad *)self sideLength];
  if (result < v3) {
    return v3;
  }
  return result;
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
    double v13 = objc_msgSend(MEMORY[0x263F08D40], "itk_valueWithPoint:", a3.x + v17 * v8, a3.y + v17 * v10, v6);
  }
  else if (((v7 ^ (2 * v7)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  return v13;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v6 = 0;
  if (ITKPointIsFinite())
  {
    uint64_t v7 = 0;
    CGPoint topLeft = self->_topLeft;
    CGPoint bottomRight = self->_bottomRight;
    CGPoint bottomLeft = self->_bottomLeft;
    CGPoint v22 = topLeft;
    CGPoint topRight = self->_topRight;
    CGPoint v20 = bottomRight;
    CGPoint v18 = topLeft;
    CGFloat v11 = topLeft.y;
    double v10 = topLeft.x;
    p_double y = &topRight.y;
    for (unint64_t i = 1; i != 5; ++i)
    {
      double v14 = v10;
      double v15 = v11;
      double v10 = *(p_y - 1);
      CGFloat v11 = *p_y;
      -[ITKQuad pointInsideValueForStartPoint:endPoint:testPoint:](self, "pointInsideValueForStartPoint:endPoint:testPoint:", v14, v15, v10, *p_y, x, y, v18, topRight, v20, bottomLeft, v22);
      if (v16 != 0.0)
      {
        if (v16 > 0.0)
        {
          if (v7 < 0) {
            return v6;
          }
          ++v7;
        }
        if (v16 < 0.0)
        {
          if (v7 > 0) {
            return v6;
          }
          --v7;
        }
      }
      BOOL v6 = i > 3;
      p_y += 2;
    }
  }
  return v6;
}

- (BOOL)intersectsQuad:(id)a3
{
  v44[8] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = self;
  id v6 = v4;
  [(ITKQuad *)v5 boundingBox];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 boundingBox];
  v46.origin.double x = v15;
  v46.origin.double y = v16;
  v46.size.double width = v17;
  v46.size.double height = v18;
  v45.origin.double x = v8;
  v45.origin.double y = v10;
  v45.size.double width = v12;
  v45.size.double height = v14;
  if (CGRectIntersectsRect(v45, v46))
  {
    [(ITKQuad *)v5 topLeft];
    v44[0] = v19;
    v44[1] = v20;
    [(ITKQuad *)v5 topRight];
    v44[2] = v21;
    v44[3] = v22;
    [(ITKQuad *)v5 bottomRight];
    v44[4] = v23;
    v44[5] = v24;
    [(ITKQuad *)v5 bottomLeft];
    v44[6] = v25;
    v44[7] = v26;
    [v6 topLeft];
    v43[0] = v27;
    v43[1] = v28;
    [v6 topRight];
    v43[2] = v29;
    v43[3] = v30;
    [v6 bottomRight];
    v43[4] = v31;
    v43[5] = v32;
    [v6 bottomLeft];
    uint64_t v33 = 0;
    v43[6] = v34;
    v43[7] = v35;
    v41 = v5;
    do
    {
      if (-[ITKQuad containsPoint:](v5, "containsPoint:", *(double *)&v43[v33], *(double *)&v43[v33 + 1], v41)
        || (objc_msgSend(v6, "containsPoint:", *(double *)&v44[v33], *(double *)&v44[v33 + 1]) & 1) != 0)
      {
        char v42 = 1;
        goto LABEL_15;
      }
      v33 += 2;
    }
    while (v33 != 8);
    uint64_t v36 = 0;
    char v42 = 0;
    do
    {
      ++v36;
      v37 = v43;
      uint64_t v38 = 1;
      while (v38 != 5)
      {
        v37 += 2;
        ++v38;
        if (ITKIntersectionOfLines())
        {
          char v42 = 1;
          break;
        }
      }
    }
    while (v36 != 4);
LABEL_15:
    BOOL v39 = v42 & 1;
    double v5 = v41;
  }
  else
  {
    BOOL v39 = 0;
  }

  return v39;
}

- (BOOL)isCompletelyInsideRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(ITKQuad *)self topLeft];
  v24.CGFloat x = v8;
  v24.CGFloat y = v9;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  if (!CGRectContainsPoint(v27, v24)) {
    return 0;
  }
  [(ITKQuad *)self topRight];
  v25.CGFloat x = v10;
  v25.CGFloat y = v11;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  if (!CGRectContainsPoint(v28, v25)) {
    return 0;
  }
  [(ITKQuad *)self bottomLeft];
  v26.CGFloat x = v12;
  v26.CGFloat y = v13;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  if (!CGRectContainsPoint(v29, v26)) {
    return 0;
  }
  [(ITKQuad *)self bottomRight];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  CGFloat v18 = x;
  CGFloat v19 = y;
  CGFloat v20 = width;
  CGFloat v21 = height;
  return CGRectContainsPoint(*(CGRect *)&v18, *(CGPoint *)&v15);
}

- (double)pointInsideValueForStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 testPoint:(CGPoint)a5
{
  return (a5.y - a3.y) * (a4.x - a3.x) - (a5.x - a3.x) * (a4.y - a3.y);
}

- (ITKQuad)quadByAdjustingOrientation
{
  v73[4] = *MEMORY[0x263EF8340];
  double v3 = (void *)MEMORY[0x263F08D40];
  [(ITKQuad *)self topLeft];
  id v4 = objc_msgSend(v3, "itk_valueWithPoint:");
  v73[0] = v4;
  double v5 = (void *)MEMORY[0x263F08D40];
  [(ITKQuad *)self topRight];
  id v6 = objc_msgSend(v5, "itk_valueWithPoint:");
  v73[1] = v6;
  double v7 = (void *)MEMORY[0x263F08D40];
  [(ITKQuad *)self bottomLeft];
  CGFloat v8 = objc_msgSend(v7, "itk_valueWithPoint:");
  v73[2] = v8;
  CGFloat v9 = (void *)MEMORY[0x263F08D40];
  [(ITKQuad *)self bottomRight];
  CGFloat v10 = objc_msgSend(v9, "itk_valueWithPoint:");
  v73[3] = v10;
  CGFloat v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:4];

  CGFloat v12 = [v11 sortedArrayUsingComparator:&__block_literal_global];
  CGFloat v13 = [v12 objectAtIndexedSubscript:0];
  [v13 pointValue];
  double v15 = v14;
  double v72 = v14;

  uint64_t v16 = [v12 objectAtIndexedSubscript:1];
  [v16 pointValue];
  double v18 = v17;

  uint64_t v19 = 2;
  CGFloat v20 = [v12 objectAtIndexedSubscript:2];
  [v20 pointValue];
  double v22 = v21;

  uint64_t v23 = [v12 objectAtIndexedSubscript:3];
  [v23 pointValue];
  double v25 = v24;

  if (v25 >= v22) {
    uint64_t v26 = 2;
  }
  else {
    uint64_t v26 = 3;
  }
  if (v25 >= v22) {
    uint64_t v19 = 3;
  }
  CGRect v27 = objc_msgSend(v12, "objectAtIndexedSubscript:", v15 >= v18, *(void *)&v18);
  [v27 pointValue];
  double v71 = v28;
  double v30 = v29;

  uint64_t v31 = [v12 objectAtIndexedSubscript:v26];
  [v31 pointValue];
  double v33 = v32;
  double v35 = v34;

  uint64_t v36 = [v12 objectAtIndexedSubscript:v15 < v18];
  [v36 pointValue];
  double v38 = v37;
  double v40 = v39;

  v41 = [v12 objectAtIndexedSubscript:v19];
  [v41 pointValue];
  double v43 = v42;
  double v45 = v44;

  CGRect v46 = -[ITKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:]([ITKQuad alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v71, v30, v33, v35, v38, v40, v43, v45);
  v47 = v46;
  if (v22 < v72 && v22 < v70 && [(ITKQuad *)v46 containsIntersectingLines])
  {
    v48 = [v12 objectAtIndexedSubscript:2];
    [v48 pointValue];
    double v50 = v49;
    double v52 = v51;

    v53 = [v12 objectAtIndexedSubscript:3];
    [v53 pointValue];
    double v55 = v54;
    double v57 = v56;

    v58 = [v12 objectAtIndexedSubscript:0];
    [v58 pointValue];
    double v60 = v59;
    double v62 = v61;

    v63 = [v12 objectAtIndexedSubscript:1];
    [v63 pointValue];
    double v65 = v64;
    double v67 = v66;

    v68 = -[ITKQuad initWithTopLeft:topRight:bottomLeft:bottomRight:]([ITKQuad alloc], "initWithTopLeft:topRight:bottomLeft:bottomRight:", v50, v52, v55, v57, v60, v62, v65, v67);
    v47 = v68;
  }

  return v47;
}

uint64_t __37__ITKQuad_quadByAdjustingOrientation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 pointValue];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  double v7 = NSNumber;
  [v5 pointValue];
  double v9 = v8;

  CGFloat v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)quadByFlippingPointsWithSourceFrame:(CGRect)a3
{
  [(ITKQuad *)self topLeft];
  ITKFlipPoint();
  double v18 = v5;
  double v19 = v4;
  [(ITKQuad *)self topRight];
  ITKFlipPoint();
  double v7 = v6;
  double v9 = v8;
  [(ITKQuad *)self bottomRight];
  ITKFlipPoint();
  double v11 = v10;
  double v13 = v12;
  [(ITKQuad *)self bottomLeft];
  ITKFlipPoint();
  uint64_t v16 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v14, v15, v11, v13, v19, v18, v7, v9);
  return v16;
}

- (double)averagedAngleFromBottomAndTopEdges
{
  [(ITKQuad *)self topLeft];
  [(ITKQuad *)self topRight];
  ITKSlopeOfLine();
  double v4 = atan(v3);
  [(ITKQuad *)self bottomLeft];
  [(ITKQuad *)self bottomRight];
  ITKSlopeOfLine();
  return (v4 + atan(v5)) * 0.5;
}

- (CGRect)minimumBoundingRectWithoutRotation
{
  [(ITKQuad *)self sideLength];
  uint64_t v3 = [(ITKQuad *)self vertexCentroid];
  MEMORY[0x270F3D5B0](v3);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (ITKQuad *)a3;
  double v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else if (v4 {
         && (([(ITKQuad *)self topLeft], v7 = v6, double v9 = v8, [(ITKQuad *)v5 topLeft], v7 == v11)
  }
           ? (BOOL v12 = v9 == v10)
           : (BOOL v12 = 0),
             v12))
  {
    [(ITKQuad *)self topRight];
    double v16 = v15;
    double v18 = v17;
    [(ITKQuad *)v5 topRight];
    BOOL v13 = 0;
    if (v16 == v20 && v18 == v19)
    {
      [(ITKQuad *)self bottomRight];
      double v22 = v21;
      double v24 = v23;
      [(ITKQuad *)v5 bottomRight];
      BOOL v13 = 0;
      if (v22 == v26 && v24 == v25)
      {
        [(ITKQuad *)self bottomLeft];
        double v28 = v27;
        double v30 = v29;
        [(ITKQuad *)v5 bottomLeft];
        BOOL v13 = 0;
        if (v28 == v32 && v30 == v31)
        {
          unint64_t v33 = [(ITKQuad *)self layoutDirection];
          BOOL v13 = v33 == [(ITKQuad *)v5 layoutDirection];
        }
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
  [(ITKQuad *)self topLeft];
  double v5 = v4;
  double v7 = v6;
  [(ITKQuad *)self topRight];
  double v9 = v8;
  double v11 = v10;
  [(ITKQuad *)self bottomRight];
  double v13 = v12;
  double v15 = v14;
  [(ITKQuad *)self bottomLeft];
  double v18 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v16, v17, v13, v15, v5, v7, v9, v11);
  [(ITKQuad *)v18 setLayoutDirection:[(ITKQuad *)self layoutDirection]];
  return v18;
}

- (UIBezierPath)path
{
  path = self->_path;
  if (!path)
  {
    double v4 = (UIBezierPath *)objc_alloc_init(MEMORY[0x263F824C0]);
    double v5 = self->_path;
    self->_path = v4;

    double v6 = self->_path;
    [(ITKQuad *)self topLeft];
    -[UIBezierPath moveToPoint:](v6, "moveToPoint:");
    double v7 = self->_path;
    [(ITKQuad *)self topRight];
    -[UIBezierPath itk_addLineToPoint:](v7, "itk_addLineToPoint:");
    double v8 = self->_path;
    [(ITKQuad *)self bottomRight];
    -[UIBezierPath itk_addLineToPoint:](v8, "itk_addLineToPoint:");
    double v9 = self->_path;
    [(ITKQuad *)self bottomLeft];
    -[UIBezierPath itk_addLineToPoint:](v9, "itk_addLineToPoint:");
    double v10 = self->_path;
    [(ITKQuad *)self topLeft];
    -[UIBezierPath itk_addLineToPoint:](v10, "itk_addLineToPoint:");
    [(UIBezierPath *)self->_path closePath];
    path = self->_path;
  }
  return path;
}

- (id)quadByConvertingFromView:(id)a3 toView:(id)a4 isNormalized:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [v8 bounds];
  double v10 = self;
  int v11 = objc_msgSend(v8, "itk_isFlipped");
  if (v11 != objc_msgSend(v9, "itk_isFlipped"))
  {
    double v12 = (void *)[(ITKQuad *)v10 copy];

    if (v5)
    {
      double v13 = *MEMORY[0x263F4BE48];
      double v14 = *(double *)(MEMORY[0x263F4BE48] + 8);
      double v15 = *(double *)(MEMORY[0x263F4BE48] + 16);
      double v16 = *(double *)(MEMORY[0x263F4BE48] + 24);
    }
    else
    {
      [v8 bounds];
    }
    objc_msgSend(v12, "quadByFlippingPointsWithSourceFrame:", v13, v14, v15, v16);
    double v10 = (ITKQuad *)objc_claimAutoreleasedReturnValue();
  }
  [(ITKQuad *)v10 topLeft];
  if (v5)
  {
    ITKPointFromNormalizedRect();
    objc_msgSend(v8, "convertPoint:toView:", 0);
    double v55 = v18;
    double v56 = v17;
    [(ITKQuad *)v10 topRight];
    ITKPointFromNormalizedRect();
    objc_msgSend(v8, "convertPoint:toView:", 0);
    double v20 = v19;
    double v22 = v21;
    [(ITKQuad *)v10 bottomRight];
    ITKPointFromNormalizedRect();
    objc_msgSend(v8, "convertPoint:toView:", 0);
    double v24 = v23;
    double v26 = v25;
    [(ITKQuad *)v10 bottomLeft];
    double v28 = v55;
    double v27 = v56;
    ITKPointFromNormalizedRect();
  }
  else
  {
    objc_msgSend(v8, "convertPoint:toView:", 0);
    double v27 = v29;
    double v28 = v30;
    [(ITKQuad *)v10 topRight];
    objc_msgSend(v8, "convertPoint:toView:", 0);
    double v20 = v31;
    double v22 = v32;
    [(ITKQuad *)v10 bottomRight];
    objc_msgSend(v8, "convertPoint:toView:", 0);
    double v24 = v33;
    double v26 = v34;
    [(ITKQuad *)v10 bottomLeft];
  }
  objc_msgSend(v8, "convertPoint:toView:", 0);
  double v36 = v35;
  double v38 = v37;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v27, v28);
  double v40 = v39;
  double v42 = v41;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v20, v22);
  double v44 = v43;
  double v46 = v45;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v24, v26);
  double v48 = v47;
  double v50 = v49;
  objc_msgSend(v9, "convertPoint:fromView:", 0, v36, v38);
  v53 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v51, v52, v48, v50, v40, v42, v44, v46);

  return v53;
}

- (id)quadByConvertingFromNormalizedRectToView:(id)a3 contentsRect:(CGRect)a4
{
  [a3 bounds];
  ITKRectFromNormalizedSubrect();
  [(ITKQuad *)self topLeft];
  ITKPointFromNormalizedRect();
  double v19 = v6;
  double v20 = v5;
  [(ITKQuad *)self topRight];
  ITKPointFromNormalizedRect();
  double v8 = v7;
  double v10 = v9;
  [(ITKQuad *)self bottomRight];
  ITKPointFromNormalizedRect();
  double v12 = v11;
  double v14 = v13;
  [(ITKQuad *)self bottomLeft];
  ITKPointFromNormalizedRect();
  double v17 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v15, v16, v12, v14, v20, v19, v8, v10);
  return v17;
}

- (id)normalizedQuadByConvertingFromView:(id)a3 toView:(id)a4 toViewSize:(CGSize)a5
{
  id v7 = a4;
  id v8 = a3;
  [(ITKQuad *)self topLeft];
  objc_msgSend(v8, "convertPoint:toView:", v7);
  [(ITKQuad *)self topRight];
  objc_msgSend(v8, "convertPoint:toView:", v7);
  [(ITKQuad *)self bottomRight];
  objc_msgSend(v8, "convertPoint:toView:", v7);
  [(ITKQuad *)self bottomLeft];
  objc_msgSend(v8, "convertPoint:toView:", v7);

  ITKNormalizedPointInRect();
  double v23 = v10;
  double v24 = v9;
  ITKNormalizedPointInRect();
  double v12 = v11;
  double v14 = v13;
  ITKNormalizedPointInRect();
  double v16 = v15;
  double v18 = v17;
  ITKNormalizedPointInRect();
  double v21 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v19, v20, v16, v18, v24, v23, v12, v14);
  return v21;
}

- (id)normalizedQuadFromView:(id)a3
{
  [a3 bounds];
  [(ITKQuad *)self topLeft];
  ITKNormalizedPointInRect();
  double v18 = v5;
  double v19 = v4;
  [(ITKQuad *)self topRight];
  ITKNormalizedPointInRect();
  double v7 = v6;
  double v9 = v8;
  [(ITKQuad *)self bottomRight];
  ITKNormalizedPointInRect();
  double v11 = v10;
  double v13 = v12;
  [(ITKQuad *)self bottomLeft];
  ITKNormalizedPointInRect();
  double v16 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v14, v15, v11, v13, v19, v18, v7, v9);
  return v16;
}

- (id)subquadFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (ITKSizeIsEmptyOrHasNanOrInf())
  {
    double v8 = objc_alloc_init(ITKQuad);
  }
  else
  {
    double v9 = (void *)[(ITKQuad *)self copy];
    double v10 = objc_msgSend(v9, "quadFromSubtractingPoint:", x, y);

    objc_msgSend(v10, "quadMultipliedBySize:", 1.0 / width, 1.0 / height);
    double v8 = (ITKQuad *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)quadFromAddingPoint:(CGPoint)a3
{
  [(ITKQuad *)self topLeft];
  ITKAddPoints();
  double v5 = v4;
  double v7 = v6;
  [(ITKQuad *)self topRight];
  ITKAddPoints();
  double v9 = v8;
  double v11 = v10;
  [(ITKQuad *)self bottomRight];
  ITKAddPoints();
  double v13 = v12;
  double v15 = v14;
  [(ITKQuad *)self bottomLeft];
  ITKAddPoints();
  double v18 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v16, v17, v13, v15, v5, v7, v9, v11);
  return v18;
}

- (id)quadFromSubtractingPoint:(CGPoint)a3
{
  [(ITKQuad *)self topLeft];
  ITKSubtractPoints();
  double v5 = v4;
  double v7 = v6;
  [(ITKQuad *)self topRight];
  ITKSubtractPoints();
  double v9 = v8;
  double v11 = v10;
  [(ITKQuad *)self bottomRight];
  ITKSubtractPoints();
  double v13 = v12;
  double v15 = v14;
  [(ITKQuad *)self bottomLeft];
  ITKSubtractPoints();
  double v18 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v16, v17, v13, v15, v5, v7, v9, v11);
  return v18;
}

- (id)quadMultipliedBySize:(CGSize)a3
{
  [(ITKQuad *)self topLeft];
  ITKMultiplyPointBySize();
  double v5 = v4;
  double v7 = v6;
  [(ITKQuad *)self topRight];
  ITKMultiplyPointBySize();
  double v9 = v8;
  double v11 = v10;
  [(ITKQuad *)self bottomRight];
  ITKMultiplyPointBySize();
  double v13 = v12;
  double v15 = v14;
  [(ITKQuad *)self bottomLeft];
  ITKMultiplyPointBySize();
  double v18 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v16, v17, v13, v15, v5, v7, v9, v11);
  return v18;
}

- (CGPoint)vertexCentroid
{
  [(ITKQuad *)self topLeft];
  unint64_t v4 = v3;
  unint64_t v6 = v5;
  [(ITKQuad *)self topRight];
  unint64_t v8 = v7;
  unint64_t v10 = v9;
  [(ITKQuad *)self bottomLeft];
  unint64_t v12 = v11;
  unint64_t v14 = v13;
  uint64_t v15 = [(ITKQuad *)self bottomRight];
  v16.n128_u64[0] = v18.n128_u64[0];
  v17.n128_u64[0] = v19.n128_u64[0];
  v18.n128_u64[0] = v4;
  v19.n128_u64[0] = v6;
  v20.n128_u64[0] = v8;
  v21.n128_u64[0] = v10;
  v22.n128_u64[0] = v12;
  v23.n128_u64[0] = v14;
  MEMORY[0x270F3D600](v15, v18, v19, v20, v21, v22, v23, v16, v17);
  result.double y = v25;
  result.double x = v24;
  return result;
}

- (id)quadFromUnionWithQuad:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ITKQuad *)self quadByAdjustingOrientation];
  unint64_t v6 = [v4 quadByAdjustingOrientation];

  [v6 topLeft];
  double v8 = v7;
  [v5 topLeft];
  if (v8 >= v9) {
    double v8 = v9;
  }
  [v6 topLeft];
  double v11 = v10;
  [v5 topLeft];
  if (v11 >= v12) {
    double v11 = v12;
  }
  [v6 topRight];
  double v14 = v13;
  [v5 topRight];
  if (v14 < v15) {
    double v14 = v15;
  }
  [v6 topRight];
  double v17 = v16;
  [v5 topRight];
  if (v17 >= v18) {
    double v17 = v18;
  }
  [v6 bottomRight];
  double v20 = v19;
  [v5 bottomRight];
  if (v20 < v21) {
    double v20 = v21;
  }
  [v6 bottomRight];
  double v23 = v22;
  [v5 bottomRight];
  if (v23 < v24) {
    double v23 = v24;
  }
  [v6 bottomLeft];
  double v26 = v25;
  [v5 bottomLeft];
  if (v26 >= v27) {
    double v26 = v27;
  }
  [v6 bottomLeft];
  double v29 = v28;
  [v5 bottomLeft];
  if (v29 < v30) {
    double v29 = v30;
  }
  double v31 = -[ITKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ITKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v26, v29, v20, v23, v8, v11, v14, v17);

  return v31;
}

+ (id)quadFromUnionOfQuads:(id)a3 baselineAngle:(double)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) quadFromRotatingAroundOriginWithAngle:-a4];
        double v12 = v11;
        if (v8)
        {
          uint64_t v13 = [v8 quadFromUnionWithQuad:v11];

          id v8 = (id)v13;
        }
        else
        {
          id v8 = v11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }
  double v14 = [v8 quadFromRotatingAroundOriginWithAngle:a4];

  return v14;
}

+ (CGPoint)vertexCentroidFromQuads:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    [v4 vertexCentroid];
    double v6 = v5;
    double v8 = v7;

    if ((unint64_t)[v3 count] >= 2)
    {
      if ((unint64_t)[v3 count] >= 2)
      {
        unint64_t v9 = 1;
        do
        {
          double v10 = [v3 objectAtIndexedSubscript:v9];
          [v10 vertexCentroid];
          ITKAddPoints();

          ++v9;
        }
        while ([v3 count] > v9);
      }
      [v3 count];
      ITKMultiplyPointScalar();
      double v6 = v11;
      double v8 = v12;
    }
  }
  else
  {
    double v6 = *MEMORY[0x263F00148];
    double v8 = *(double *)(MEMORY[0x263F00148] + 8);
  }

  double v13 = v6;
  double v14 = v8;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (id)quadFromRotatingAroundCentroidWithAngle:(double)a3
{
  [(ITKQuad *)self vertexCentroid];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeTranslation(&v19, -v5, -v7);
  CGAffineTransformMakeRotation(&t2, a3);
  CGAffineTransform t1 = v19;
  CGAffineTransformConcat(&v18, &t1, &t2);
  CGAffineTransform v19 = v18;
  CGAffineTransformMakeTranslation(&v15, v6, v8);
  CGAffineTransform t1 = v19;
  CGAffineTransformConcat(&v18, &t1, &v15);
  CGAffineTransform v19 = v18;
  unint64_t v9 = [(ITKQuad *)self allPoints];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__ITKQuad_quadFromRotatingAroundCentroidWithAngle___block_invoke;
  v13[3] = &__block_descriptor_80_e23__32__0__NSValue_8q16q24l;
  CGAffineTransform v14 = v19;
  double v10 = objc_msgSend(v9, "itk_map:", v13);

  double v11 = [[ITKQuad alloc] initWithPoints:v10];
  return v11;
}

uint64_t __51__ITKQuad_quadFromRotatingAroundCentroidWithAngle___block_invoke(float64x2_t *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08D40];
  [a2 pointValue];
  float64x2_t v6 = vaddq_f64(a1[4], vmlaq_n_f64(vmulq_n_f64(a1[3], v4), a1[2], v5));
  return objc_msgSend(v3, "itk_valueWithPoint:", *(_OWORD *)&v6);
}

- (id)quadFromRotatingAroundOriginWithAngle:(double)a3
{
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeRotation(&v10, a3);
  double v4 = [(ITKQuad *)self allPoints];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__ITKQuad_quadFromRotatingAroundOriginWithAngle___block_invoke;
  v8[3] = &__block_descriptor_80_e23__32__0__NSValue_8q16q24l;
  CGAffineTransform v9 = v10;
  double v5 = objc_msgSend(v4, "itk_map:", v8);

  float64x2_t v6 = [[ITKQuad alloc] initWithPoints:v5];
  return v6;
}

uint64_t __49__ITKQuad_quadFromRotatingAroundOriginWithAngle___block_invoke(float64x2_t *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F08D40];
  [a2 pointValue];
  float64x2_t v6 = vaddq_f64(a1[4], vmlaq_n_f64(vmulq_n_f64(a1[3], v4), a1[2], v5));
  return objc_msgSend(v3, "itk_valueWithPoint:", *(_OWORD *)&v6);
}

- (CGAffineTransform)rotationTransformAndBoundingBox:(SEL)a3
{
  [(ITKQuad *)self topLeft];
  [(ITKQuad *)self bottomLeft];
  ITKAveragePoints();
  double v8 = v7;
  [(ITKQuad *)self topRight];
  [(ITKQuad *)self bottomRight];
  ITKAveragePoints();
  if (v8 == v9)
  {
    ITKSubtractPoints();
    double v11 = dbl_252AA02F0[v12 > 0.0];
  }
  else
  {
    ITKAngleOfLine();
    double v11 = v10;
  }
  double v13 = [(ITKQuad *)self quadFromRotatingAroundCentroidWithAngle:-v11];
  [v13 boundingBox];
  a4->origin.double x = v14;
  a4->origin.double y = v15;
  a4->size.double width = v16;
  a4->size.double height = v17;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return CGAffineTransformMakeRotation(retstr, v11);
}

- (double)minimumDistanceToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v32 = *MEMORY[0x263EF8340];
  BOOL v6 = -[ITKQuad containsPoint:](self, "containsPoint:");
  double result = 0.0;
  if (!v6)
  {
    [(ITKQuad *)self topLeft];
    uint64_t v28 = v8;
    uint64_t v29 = v9;
    [(ITKQuad *)self topRight];
    uint64_t v30 = v10;
    uint64_t v31 = v11;
    -[ITKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    double v13 = fmin(v12, INFINITY);
    [(ITKQuad *)self topRight];
    uint64_t v28 = v14;
    uint64_t v29 = v15;
    [(ITKQuad *)self bottomRight];
    uint64_t v30 = v16;
    uint64_t v31 = v17;
    -[ITKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    if (v18 < v13) {
      double v13 = v18;
    }
    [(ITKQuad *)self bottomRight];
    uint64_t v28 = v19;
    uint64_t v29 = v20;
    [(ITKQuad *)self bottomLeft];
    uint64_t v30 = v21;
    uint64_t v31 = v22;
    -[ITKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    if (v23 < v13) {
      double v13 = v23;
    }
    [(ITKQuad *)self bottomLeft];
    uint64_t v28 = v24;
    uint64_t v29 = v25;
    [(ITKQuad *)self topLeft];
    uint64_t v30 = v26;
    uint64_t v31 = v27;
    -[ITKQuad distanceFromLine:toPoint:](self, "distanceFromLine:toPoint:", &v28, x, y);
    if (result >= v13) {
      return v13;
    }
  }
  return result;
}

- (double)distanceFromLine:(CGPoint *)a3 toPoint:(CGPoint)a4
{
  ITKNearestPointOnLineSegmentToPoint();
  ITKDistance();
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

- (CGPoint)topRight
{
  double x = self->_topRight.x;
  double y = self->_topRight.y;
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

- (CGPoint)bottomRight
{
  double x = self->_bottomRight.x;
  double y = self->_bottomRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (void).cxx_destruct
{
}

+ (CATransform3D)transformToConvertLayer:(SEL)a3 intoQuad:(id)a4 frame:(id)a5
{
  v34[8] = *(double *)MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a4;
  [v9 topLeft];
  v34[0] = v11;
  v34[1] = v12;
  [v9 topRight];
  v34[2] = v13;
  v34[3] = v14;
  [v9 bottomRight];
  v34[4] = v15;
  v34[5] = v16;
  [v9 bottomLeft];
  double v18 = v17;
  double v20 = v19;

  v34[6] = v18;
  v34[7] = v20;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  [v10 bounds];
  double v22 = v21;
  double v24 = v23;
  [v10 anchorPoint];
  objc_msgSend(v10, "frame", computeCornerMatrix(v34, (uint64_t)retstr, v22, v24, v25, v26));
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [v10 anchorPoint];
  [v10 bounds];

  ITKPointFromNormalizedRect();
  CGPoint result = (CATransform3D *)ITKMultiplyPointScalar();
  a6->origin.double x = v32;
  a6->origin.double y = v33;
  a6->size.double width = v28;
  a6->size.double height = v30;
  return result;
}

@end