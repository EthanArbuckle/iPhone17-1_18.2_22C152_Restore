@interface AKGeometryHelper
+ (BOOL)annotationHasRotation:(id)a3 outAngle:(double *)a4;
+ (BOOL)exifOrientationHasFlip:(int64_t)a3;
+ (BOOL)exifOrientationHasReversedAxes:(int64_t)a3;
+ (BOOL)isPoint:(CGPoint)a3 onEllipse:(CGRect)a4;
+ (BOOL)isPointOnLeft:(CGPoint)a3 ofRayWithFirstPoint:(CGPoint)a4 andSecondPoint:(CGPoint)a5;
+ (BOOL)isUnpresentablePoint:(CGPoint)a3;
+ (BOOL)isUnpresentableRect:(CGRect)a3;
+ (BOOL)isUnpresentableSize:(CGSize)a3;
+ (BOOL)rectHasZeroSize:(CGRect)a3;
+ (CGAffineTransform)_rawAffineTransformForExifOrientation:(SEL)a3;
+ (CGAffineTransform)affineTransformFlatteningOriginalModelExif:(SEL)a3 withOriginalModelSize:(int64_t)a4;
+ (CGAffineTransform)affineTransformForExifOrientation:(SEL)a3 aboutCenter:(int64_t)a4;
+ (CGAffineTransform)affineTransformRecenteringAboutOriginForExifOrientation:(SEL)a3 withOriginalSize:(int64_t)a4;
+ (CGAffineTransform)centeredCircleToEllipseTransform:(SEL)a3;
+ (CGAffineTransform)ellipseToCenteredCircleTransform:(SEL)a3;
+ (CGAffineTransform)horizontalFlipTransformForRect:(SEL)a3;
+ (CGAffineTransform)rotationTransformAroundPoint:(SEL)a3 withAngle:(CGPoint)a4;
+ (CGAffineTransform)rotationTransformForRect:(SEL)a3 withAngle:(CGRect)a4;
+ (CGAffineTransform)rotationTransformForRectangularAnnotation:(SEL)a3 hasRotation:(id)a4;
+ (CGAffineTransform)verticalFlipTransformForRect:(SEL)a3;
+ (CGPath)newPathWithPath:(CGPath *)a3 applyingExifOrientation:(int64_t)a4 aboutCenter:(CGPoint)a5;
+ (CGPoint)_alignedPointForPoint:(CGPoint)a3 alignToContent:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToBitmapContext:(CGContext *)a6 usingAnnotation:(id)a7;
+ (CGPoint)_farthestPointFrom:(CGPoint)a3 inArray:(id)a4;
+ (CGPoint)adjustPoint:(CGPoint)a3 forExifOrientation:(int64_t)a4 aboutCenter:(CGPoint)a5;
+ (CGPoint)centerOfRect:(CGRect)a3;
+ (CGPoint)compareVectorDirectionsFirstVector:(CGPoint)a3 secondVector:(CGPoint)a4;
+ (CGPoint)convertModelToScreenOrientationForPoint:(CGPoint)a3 relativeToRect:(CGRect)a4 withPageController:(id)a5;
+ (CGPoint)convertScreenToModelOrientationForPoint:(CGPoint)a3 relativeToRect:(CGRect)a4 withPageController:(id)a5;
+ (CGPoint)flipPointVertically:(CGPoint)a3 inRect:(CGRect)a4;
+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withAnotherSegmentStartingAt:(CGPoint)a5 ending:(CGPoint)a6;
+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withCircleWithCenter:(CGPoint)a5 andRadius:(double)a6 farthestResult:(BOOL)a7;
+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withEllipseOfRect:(CGRect)a5 farthestResult:(BOOL)a6;
+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withRect:(CGRect)a5 andRoundedCornerRadius:(double)a6;
+ (CGPoint)intersectRayStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withCircleWithCenter:(CGPoint)a5 andRadius:(double)a6 farthestResult:(BOOL)a7;
+ (CGPoint)intersectRayStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withEllipseOfRect:(CGRect)a5 farthestResult:(BOOL)a6;
+ (CGPoint)pointAtAngle:(double)a3 inCircleWithCenter:(CGPoint)a4 andRadius:(double)a5;
+ (CGPoint)projectPoint:(CGPoint)a3 ontoRayWithFirstPoint:(CGPoint)a4 andSecondPoint:(CGPoint)a5;
+ (CGPoint)projectVector:(CGPoint)a3 ontoAspectVector:(CGPoint)a4;
+ (CGPoint)snapVector:(CGPoint)a3 toDiagonalForAspectRatio:(double)a4 ignoreWidth:(BOOL)a5 ignoreHeight:(BOOL)a6;
+ (CGPoint)snapVectorTo45Degrees:(CGPoint)a3;
+ (CGPoint)tangentOfEllipse:(CGRect)a3 throughRayWithFirstPoint:(CGPoint)a4 goingThrough:(CGPoint)a5;
+ (CGRect)_alignedStableRectForRect:(CGRect)a3 alignToContent:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToBitmapContext:(CGContext *)a6 usingAnnotation:(id)a7;
+ (CGRect)_rectForRect:(CGRect)a3 alignToContent:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToBitmapContext:(CGContext *)a6 usingAnnotation:(id)a7 withAlignmentBlock:(id)a8;
+ (CGRect)_strokeAlignedRectForRect:(CGRect)a3 withStrokeWidth:(double)a4 shouldAlignStrictlyToScreen:(BOOL)a5 alignToScreenUsingPageController:(id)a6 orAlignToBitmapContext:(CGContext *)a7 usingAnnotation:(id)a8;
+ (CGRect)adjustRect:(CGRect)a3 forExifOrientation:(int64_t)a4 aboutCenter:(CGPoint)a5;
+ (CGRect)boundsOfRotatedRectangle:(CGRect)a3 angle:(double)a4;
+ (CGRect)constrainRect:(CGRect)a3 withinRect:(CGRect)a4;
+ (CGRect)convertModelToScreenOrientationForRect:(CGRect)a3 withPageController:(id)a4;
+ (CGRect)convertRect:(CGRect)a3 fromScreenPointsToView:(id)a4;
+ (CGRect)convertRect:(CGRect)a3 fromViewToScreenPixels:(id)a4 useNativeScale:(BOOL)a5;
+ (CGRect)convertScreenToModelOrientationForRect:(CGRect)a3 withPageController:(id)a4;
+ (CGRect)effectiveDrawingBoundsForAnnotation:(id)a3 forDisplay:(BOOL)a4 pageControllerOrNil:(id)a5 outScaleFactor:(double *)a6;
+ (CGRect)expandCGRect:(CGRect)a3 toContainPoint:(CGPoint)a4;
+ (CGRect)integralRect:(CGRect)a3 withOptions:(unint64_t)a4;
+ (CGRect)rectForSize:(CGSize)a3 inRect:(CGRect)a4;
+ (CGRect)rectWithSize:(CGSize)a3 centeredAtPoint:(CGPoint)a4;
+ (CGRect)renderingAlignedTextRectForRect:(CGRect)a3 alignToScreenUsingPageController:(id)a4 orAlignToContext:(CGContext *)a5 usingAnnotation:(id)a6;
+ (CGRect)renderingStrokeAlignedRectForRect:(CGRect)a3 withStrokeWidth:(double)a4 alignToScreenUsingPageController:(id)a5 orAlignToContext:(CGContext *)a6 usingAnnotation:(id)a7;
+ (CGRect)stableIntegralRectForRect:(CGRect)a3;
+ (CGVector)normalizeVector:(CGVector)a3;
+ (double)angleBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4;
+ (double)angleOfVector:(CGVector)a3;
+ (double)distanceBetweenPoints:(CGPoint)a3 andPoint:(CGPoint)a4;
+ (double)radiusOfCenteredCircleFor:(CGRect)a3;
+ (double)scaleOfTransform:(CGAffineTransform *)a3;
+ (id)_cornersOfRotatedRectangle:(CGRect)a3 angle:(double)a4;
+ (id)verticesOfPolygonWithPointCount:(unint64_t)a3 inRect:(CGRect)a4 rotation:(double)a5 flippedVertically:(BOOL)a6;
+ (int64_t)concatExifOrientation:(int64_t)a3 withExifOrientation:(int64_t)a4;
+ (int64_t)exifOrientationWithConversionBlock:(id)a3;
+ (int64_t)inverseExifOrientation:(int64_t)a3;
+ (unint64_t)draggableArea:(unint64_t)a3 convertedForExif:(int64_t)a4;
+ (void)_checkIntersectionOfLineSegmentStartingAt:(CGPoint)a3 endingAt:(CGPoint)a4 withCircleAt:(CGPoint)a5 andRadius:(double)a6 results:(id)a7;
+ (void)_collectIntersectionsOfLineSegmentStartingAt:(CGPoint)a3 endingAt:(CGPoint)a4 withCornerCirclesOfRoundedRect:(CGRect)a5 withRadius:(double)a6 results:(id)a7;
+ (void)adjustOriginalExifOrientationOnAnnotation:(id)a3 flatteningOriginalModelExif:(int64_t)a4;
+ (void)intersectCircleAtPoint:(CGPoint)a3 withRadius:(double)a4 withCircleAtPoint:(CGPoint)a5 withRadius:(double)a6 firstOutPoint:(CGPoint *)a7 secondOutPoint:(CGPoint *)a8;
+ (void)tangentPointsToEllipse:(CGRect)a3 fromPoint:(CGPoint)a4 firstOutPoint:(CGPoint *)a5 secondOutPoint:(CGPoint *)a6;
- (AKGeometryHelper)initWithPageController:(id)a3;
- (AKPageController)pageController;
- (BOOL)_shouldAlignToContent;
- (BOOL)_shouldAlignToScreen;
- (CGPoint)contentAlignedPointForPoint:(CGPoint)a3;
- (CGPoint)convertPoint:(CGPoint)a3 fromModelToLayer:(id)a4;
- (CGPoint)screenPixelAlignedPointForPoint:(CGPoint)a3;
- (CGRect)_clippingFrameForView:(id)a3;
- (CGRect)_smartAlignedRectForRect:(CGRect)a3;
- (CGRect)adornmentLayerFrameForAnnotation:(id)a3;
- (CGRect)annotationLayerFrameForAnnotation:(id)a3 layerIsClipped:(BOOL *)a4;
- (CGRect)contentAlignedRectForRect:(CGRect)a3;
- (CGRect)convertRect:(CGRect)a3 fromModelToLayer:(id)a4;
- (CGRect)screenPixelAlignedRectForRect:(CGRect)a3;
- (CGRect)screenStrokeAlignedRectForRect:(CGRect)a3 withStrokeWidth:(double)a4;
- (id)_rootLayer;
- (void)setPageController:(id)a3;
@end

@implementation AKGeometryHelper

+ (BOOL)isUnpresentableRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsNull(a3) || (objc_msgSend(a1, "rectHasZeroSize:", x, y, width, height) & 1) != 0)
  {
    char v8 = 1;
  }
  else
  {
    v12.origin.double x = x;
    v12.origin.double y = y;
    v12.size.double width = width;
    v12.size.double height = height;
    BOOL IsInfinite = CGRectIsInfinite(v12);
    double v10 = fabs(y);
    char v8 = fabs(x) == INFINITY || IsInfinite;
    if (v10 == INFINITY) {
      char v8 = 1;
    }
    if (fabs(width) == INFINITY) {
      char v8 = 1;
    }
    if (fabs(height) == INFINITY) {
      char v8 = 1;
    }
  }
  return v8 & 1;
}

+ (BOOL)rectHasZeroSize:(CGRect)a3
{
  return a3.size.height == *(double *)(MEMORY[0x263F001B0] + 8) && a3.size.width == *MEMORY[0x263F001B0];
}

+ (BOOL)isUnpresentableSize:(CGSize)a3
{
  BOOL v3 = a3.width <= 0.0;
  if (a3.height <= 0.0) {
    BOOL v3 = 1;
  }
  if (fabs(a3.width) == INFINITY) {
    BOOL v3 = 1;
  }
  if (fabs(a3.height) == INFINITY) {
    return 1;
  }
  return v3;
}

+ (BOOL)isUnpresentablePoint:(CGPoint)a3
{
  BOOL v3 = fabs(a3.x) == INFINITY;
  if (fabs(a3.y) == INFINITY) {
    return 1;
  }
  return v3;
}

+ (CGRect)integralRect:(CGRect)a3 withOptions:(unint64_t)a4
{
  return NSIntegralRectWithOptions(a3, a4);
}

+ (CGRect)stableIntegralRectForRect:(CGRect)a3
{
  objc_msgSend(a1, "integralRect:withOptions:", 3840, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

+ (CGRect)rectWithSize:(CGSize)a3 centeredAtPoint:(CGPoint)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v6 = a4.x - a3.width * 0.5;
  double v7 = a4.y - a3.height * 0.5;
  double v8 = width;
  double v9 = height;
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

+ (CGRect)rectForSize:(CGSize)a3 inRect:(CGRect)a4
{
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v6 = a4.size.height / a3.height;
  if (a4.size.width / a3.width < a4.size.height / a3.height) {
    double v6 = a4.size.width / a3.width;
  }
  double v7 = a3.width * v6;
  double v8 = a3.height * v6;
  double v9 = x;
  double v10 = y;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

+ (CGPoint)centerOfRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat MidX = CGRectGetMidX(a3);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v11);
  double v9 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v9;
  return result;
}

+ (CGRect)constrainRect:(CGRect)a3 withinRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v8 = a3.size.width;
  double v9 = a3.origin.y;
  double v10 = a3.origin.x;
  CGFloat rect = a3.size.height;
  double v11 = CGRectGetWidth(a3);
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  if (v11 <= CGRectGetWidth(v27))
  {
    if (v10 >= x) {
      double v14 = v10;
    }
    else {
      double v14 = x;
    }
    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v30);
    v31.origin.double x = v14;
    v31.origin.double y = v9;
    v31.size.CGFloat width = v8;
    v31.size.CGFloat height = rect;
    double v16 = MaxX - CGRectGetWidth(v31);
    if (v14 >= v16) {
      double v13 = v16;
    }
    else {
      double v13 = v14;
    }
  }
  else
  {
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double v12 = CGRectGetWidth(v28);
    v29.origin.double x = v10;
    v29.origin.double y = v9;
    v29.size.CGFloat width = v8;
    v29.size.CGFloat height = rect;
    double v13 = x + (v12 - CGRectGetWidth(v29)) * 0.5;
  }
  v32.origin.double x = v13;
  v32.origin.double y = v9;
  v32.size.CGFloat width = v8;
  v32.size.CGFloat height = rect;
  double v17 = CGRectGetHeight(v32);
  v33.origin.double x = x;
  v33.origin.double y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  if (v17 <= CGRectGetHeight(v33))
  {
    if (v9 >= y) {
      double v20 = v9;
    }
    else {
      double v20 = y;
    }
    v36.origin.double x = x;
    v36.origin.double y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v36);
    v37.origin.double x = v13;
    v37.origin.double y = v20;
    v37.size.CGFloat width = v8;
    v37.size.CGFloat height = rect;
    double v22 = MaxY - CGRectGetHeight(v37);
    if (v20 >= v22) {
      double v19 = v22;
    }
    else {
      double v19 = v20;
    }
  }
  else
  {
    v34.origin.double x = x;
    v34.origin.double y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    double v18 = CGRectGetHeight(v34);
    v35.origin.double x = v13;
    v35.origin.double y = v9;
    v35.size.CGFloat width = v8;
    v35.size.CGFloat height = rect;
    double v19 = y + (v18 - CGRectGetHeight(v35)) * 0.5;
  }
  double v23 = v13;
  double v24 = v8;
  double v25 = rect;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.double y = v19;
  result.origin.double x = v23;
  return result;
}

+ (CGPoint)snapVectorTo45Degrees:(CGPoint)a3
{
  long double y = a3.y;
  long double x = a3.x;
  double v5 = hypot(a3.x, a3.y);
  long double v6 = atan2(y, x);
  __double2 v7 = __sincos_stret(round(v6 / 0.785398163) * 0.785398163);
  double v8 = v5 * v7.__sinval;
  double v9 = v5 * v7.__cosval;
  result.long double y = v8;
  result.long double x = v9;
  return result;
}

+ (CGPoint)snapVector:(CGPoint)a3 toDiagonalForAspectRatio:(double)a4 ignoreWidth:(BOOL)a5 ignoreHeight:(BOOL)a6
{
  double y = a3.y;
  double x = a3.x;
  if (a6)
  {
    a3.double y = a3.x / a4;
  }
  else
  {
    a3.double x = a3.y * a4;
    if (!a5) {
      a3.double x = x;
    }
  }
  double v9 = hypot(a3.x, a3.y);
  +[AKGeometryHelper compareVectorDirectionsFirstVector:secondVector:](AKGeometryHelper, "compareVectorDirectionsFirstVector:secondVector:", x, y, a4, 1.0);
  +[AKGeometryHelper normalizeVectorPoint:v10 * a4];
  double v12 = v9 * v11;
  double v14 = v9 * v13;
  result.double y = v14;
  result.double x = v12;
  return result;
}

+ (CGPoint)projectVector:(CGPoint)a3 ontoAspectVector:(CGPoint)a4
{
  CGFloat v4 = (a3.y * a4.y + a3.x * a4.x) / (a4.y * a4.y + a4.x * a4.x);
  double v5 = a4.x * v4;
  double v6 = a4.y * v4;
  result.double y = v6;
  result.double x = v5;
  return result;
}

+ (double)scaleOfTransform:(CGAffineTransform *)a3
{
  return sqrt(a3->c * a3->c + a3->a * a3->a);
}

+ (CGPoint)intersectRayStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withCircleWithCenter:(CGPoint)a5 andRadius:(double)a6 farthestResult:(BOOL)a7
{
  double v7 = a4.x - a3.x;
  double v8 = a4.y - a3.y;
  double v9 = a5.x - a3.x;
  double v10 = a5.y - a3.y;
  double v11 = v7 * (a5.y - a3.y) - v8 * v9;
  double v12 = v8 * v8 + v7 * v7;
  double v13 = a6 * a6 * v12 - v11 * v11;
  if (v13 >= 0.0)
  {
    double v16 = v8 * v10 + v7 * v9;
    double v17 = sqrt(v13);
    double v18 = (v16 + v17) / v12;
    double v19 = (v16 - v17) / v12;
    if (v18 >= v19) {
      double v20 = v18;
    }
    else {
      double v20 = v19;
    }
    if (v18 < v19) {
      double v19 = v18;
    }
    if (a7) {
      double v19 = v20;
    }
    if (v19 < 0.0) {
      double v19 = v20;
    }
    double v14 = a3.x + v19 * v7;
    double v15 = a3.y + v19 * v8;
  }
  else
  {
    double v14 = 9.22337204e18;
    double v15 = 9.22337204e18;
  }
  result.double y = v15;
  result.double x = v14;
  return result;
}

+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withCircleWithCenter:(CGPoint)a5 andRadius:(double)a6 farthestResult:(BOOL)a7
{
  double y = a4.y;
  double x = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  +[AKGeometryHelper intersectRayStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectRayStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", a7, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6);
  if (v10 >= x) {
    double v13 = x;
  }
  else {
    double v13 = v10;
  }
  if (v11 + 0.0005 < v13
    || (v10 >= x ? (double v14 = v10) : (double v14 = x),
        v11 + -0.0005 > v14
     || (v9 >= y ? (v15 = y) : (v15 = v9), v12 + 0.0005 < v15 || (v9 >= y ? (double v16 = v9) : (double v16 = y), v12 + -0.0005 > v16))))
  {
    double v11 = 9.22337204e18;
    double v12 = 9.22337204e18;
  }
  result.double y = v12;
  result.double x = v11;
  return result;
}

+ (CGPoint)intersectRayStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withEllipseOfRect:(CGRect)a5 farthestResult:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.y;
  double v12 = a4.x;
  double v13 = a3.y;
  double v14 = a3.x;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  double v21 = v15;
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", x, y, width, height);
  +[AKGeometryHelper intersectRayStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectRayStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", v6, v13 * 0.0 + 0.0 * v14 + 0.0, v13 * 0.0 + 0.0 * v14 + 0.0, v11 * 0.0 + 0.0 * v12 + 0.0, v11 * 0.0 + 0.0 * v12 + 0.0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v21);
  double v20 = v17;
  double v22 = v16;
  +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:", x, y, width, height);
  float64x2_t v18 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v20), (float64x2_t)0, v22));
  double v19 = v18.f64[1];
  result.double x = v18.f64[0];
  result.double y = v19;
  return result;
}

+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withEllipseOfRect:(CGRect)a5 farthestResult:(BOOL)a6
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  +[AKGeometryHelper intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:](AKGeometryHelper, "intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:", a6, a3.x, a3.y, a4.x, a4.y, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if (v9 >= x) {
    double v12 = x;
  }
  else {
    double v12 = v9;
  }
  if (v10 + 0.0005 < v12
    || (v9 >= x ? (double v13 = v9) : (double v13 = x),
        v10 + -0.0005 > v13
     || (v8 >= y ? (double v14 = y) : (double v14 = v8), v11 + 0.0005 < v14 || (v8 >= y ? (v15 = v8) : (v15 = y), v11 + -0.0005 > v15))))
  {
    double v10 = 9.22337204e18;
    double v11 = 9.22337204e18;
  }
  result.double y = v11;
  result.double x = v10;
  return result;
}

+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withAnotherSegmentStartingAt:(CGPoint)a5 ending:(CGPoint)a6
{
  double y = a3.y;
  double x = a3.x;
  double v8 = a4.y - y;
  double v9 = a3.x - a4.x;
  double v10 = a6.y - a5.y;
  double v11 = a5.x - a6.x;
  double v12 = (a4.y - y) * (a5.x - a6.x) - (a6.y - a5.y) * v9;
  if (v12 == 0.0) {
    goto LABEL_36;
  }
  double v13 = a5.y * v11 + v10 * a5.x;
  double v14 = y * v9 + v8 * x;
  double v15 = (v11 * v14 - v9 * v13) / v12;
  double v16 = v15 + 0.0005;
  double v17 = x >= a4.x ? a4.x : x;
  if (v16 < v17) {
    goto LABEL_36;
  }
  double v18 = v15 + -0.0005;
  if (x < a4.x) {
    double x = a4.x;
  }
  if (v18 > x) {
    goto LABEL_36;
  }
  double v19 = (v14 * -v10 + v8 * v13) / v12;
  double v20 = v19 + 0.0005;
  double v21 = y >= a4.y ? a4.y : y;
  if (v20 < v21) {
    goto LABEL_36;
  }
  double v22 = v19 + -0.0005;
  if (y >= a4.y) {
    a4.double y = y;
  }
  if (v22 > a4.y) {
    goto LABEL_36;
  }
  if (a5.x >= a6.x) {
    double v23 = a6.x;
  }
  else {
    double v23 = a5.x;
  }
  if (a5.x < a6.x) {
    a5.double x = a6.x;
  }
  BOOL v24 = v16 < v23 || v18 > a5.x;
  if (v24
    || (a5.y >= a6.y ? (double v25 = a6.y) : (double v25 = a5.y),
        a5.y >= a6.y ? (double v26 = a5.y) : (double v26 = a6.y),
        v20 >= v25 ? (BOOL v27 = v22 > v26) : (BOOL v27 = 1),
        v27))
  {
LABEL_36:
    double v15 = 9.22337204e18;
    double v19 = 9.22337204e18;
  }
  result.double y = v19;
  result.double x = v15;
  return result;
}

+ (void)_checkIntersectionOfLineSegmentStartingAt:(CGPoint)a3 endingAt:(CGPoint)a4 withCircleAt:(CGPoint)a5 andRadius:(double)a6 results:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  double v10 = a4.y;
  double v11 = a4.x;
  double v12 = a3.y;
  double v13 = a3.x;
  id v18 = a7;
  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withCircleWithCenter:andRadius:farthestResult:", 1, v13, v12, v11, v10, x, y, a6);
  if (v15 != 9.22337204e18 && v14 != 9.22337204e18)
  {
    double v17 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:");
    [v18 addObject:v17];
  }
}

+ (void)_collectIntersectionsOfLineSegmentStartingAt:(CGPoint)a3 endingAt:(CGPoint)a4 withCornerCirclesOfRoundedRect:(CGRect)a5 withRadius:(double)a6 results:(id)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v24 = a4.y;
  double v11 = a4.x;
  double v12 = a3.y;
  double v13 = a3.x;
  id v25 = a7;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double v18 = CGRectGetMinY(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v21 = CGRectGetMaxX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v32);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double v20 = CGRectGetMinX(v33);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v16 = CGRectGetMaxY(v34);
  objc_msgSend(a1, "_checkIntersectionOfLineSegmentStartingAt:endingAt:withCircleAt:andRadius:results:", v25, v13, v12, v11, v24, MinX + a6, MinY + a6, a6);
  objc_msgSend(a1, "_checkIntersectionOfLineSegmentStartingAt:endingAt:withCircleAt:andRadius:results:", v25, v13, v12, v11, v24, MaxX - a6, v18 + a6, a6);
  objc_msgSend(a1, "_checkIntersectionOfLineSegmentStartingAt:endingAt:withCircleAt:andRadius:results:", v25, v13, v12, v11, v24, v21 - a6, MaxY - a6, a6);
  objc_msgSend(a1, "_checkIntersectionOfLineSegmentStartingAt:endingAt:withCircleAt:andRadius:results:", v25, v13, v12, v11, v24, v20 + a6, v16 - a6, a6);
}

+ (CGPoint)_farthestPointFrom:(CGPoint)a3 inArray:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    double v10 = 0.0;
    double v11 = y;
    double v12 = x;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) akPointValue];
        double v15 = v14;
        double v17 = v16;
        double v18 = hypot(v14 - x, v16 - y);
        if (v18 > v10)
        {
          double v10 = v18;
          double v11 = v17;
          double v12 = v15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
  else
  {
    double v11 = y;
    double v12 = x;
  }

  double v19 = v12;
  double v20 = v11;
  result.double y = v20;
  result.double x = v19;
  return result;
}

+ (CGPoint)intersectLineSegmentStartingAt:(CGPoint)a3 ending:(CGPoint)a4 withRect:(CGRect)a5 andRoundedCornerRadius:(double)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v40 = a4.y;
  double v10 = a4.x;
  double v11 = a3.y;
  double v12 = a3.x;
  double MinX = CGRectGetMinX(a5);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v42);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  double v37 = CGRectGetMinY(v44);
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  double v34 = CGRectGetMaxX(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v46);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double v33 = CGRectGetMinX(v47);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double v32 = CGRectGetMaxY(v48);
  double v13 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  +[AKGeometryHelper _collectIntersectionsOfLineSegmentStartingAt:v13 endingAt:v12 withCornerCirclesOfRoundedRect:v11 withRadius:v10 results:*(void *)&a6];
  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v12, v11, v10, v40, MinX + a6, MinY, MaxX - a6);
  BOOL v16 = v15 == 9.22337204e18 || v14 == 9.22337204e18;
  if (v16
    && ((+[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v12, v11, v10, v40, MaxX, v37 + a6, v34, MaxY - a6), v18 != 9.22337204e18)? (BOOL v19 = v17 == 9.22337204e18): (BOOL v19 = 1), v19&& ((+[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v12, v11,
            v10,
            v40,
            v34 - a6,
            MaxY,
            v33 + a6,
            v32),
          v21 != 9.22337204e18)
       ? (BOOL v22 = v20 == 9.22337204e18)
       : (BOOL v22 = 1),
         v22
      && ((+[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v12, v11, v10, v40, v33, v32 - a6, MinX, MinY + a6), v24 == 9.22337204e18)|| v23 == 9.22337204e18))))
  {
    if (![v13 count])
    {
      *(double *)&uint64_t v27 = 9.22337204e18;
      *(double *)&uint64_t v29 = 9.22337204e18;
      goto LABEL_20;
    }
  }
  else
  {
    id v25 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:");
    [v13 addObject:v25];
  }
  +[AKGeometryHelper _farthestPointFrom:inArray:](AKGeometryHelper, "_farthestPointFrom:inArray:", v13, v12, v11);
  uint64_t v27 = v26;
  uint64_t v29 = v28;
LABEL_20:

  double v30 = *(double *)&v27;
  double v31 = *(double *)&v29;
  result.CGFloat y = v31;
  result.CGFloat x = v30;
  return result;
}

+ (CGPoint)projectPoint:(CGPoint)a3 ontoRayWithFirstPoint:(CGPoint)a4 andSecondPoint:(CGPoint)a5
{
  CGFloat v5 = a5.x - a4.x;
  CGFloat v6 = a5.y - a4.y;
  CGFloat v7 = ((a3.y - a4.y) * v6 + (a3.x - a4.x) * v5) / (v6 * v6 + v5 * v5);
  CGFloat v8 = v5 * v7;
  CGFloat v9 = v6 * v7;
  double v10 = a4.x + v8;
  double v11 = a4.y + v9;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

+ (BOOL)isPointOnLeft:(CGPoint)a3 ofRayWithFirstPoint:(CGPoint)a4 andSecondPoint:(CGPoint)a5
{
  return (a5.x - a4.x) * (a3.y - a4.y) - (a5.y - a4.y) * (a3.x - a4.x) > 0.0;
}

+ (CGAffineTransform)ellipseToCenteredCircleTransform:(SEL)a3
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double MidX = CGRectGetMidX(a4);
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  double MidY = CGRectGetMidY(v20);
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", x, y, width, height);
  double v12 = v11;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  CGPoint result = CGAffineTransformMakeTranslation(retstr, -MidX, -MidY);
  if (v12 > 0.0)
  {
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    CGFloat v14 = CGRectGetWidth(v21);
    CGAffineTransformMakeScale(&t2, (v12 + v12) / v14, 1.0);
    long long v15 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v17.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v17.c = v15;
    *(_OWORD *)&v17.tdouble x = *(_OWORD *)&retstr->tx;
    CGPoint result = CGAffineTransformConcat(&v19, &v17, &t2);
    long long v16 = *(_OWORD *)&v19.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v19.a;
    *(_OWORD *)&retstr->c = v16;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v19.tx;
  }
  return result;
}

+ (double)radiusOfCenteredCircleFor:(CGRect)a3
{
  return CGRectGetHeight(a3) * 0.5;
}

+ (CGAffineTransform)centeredCircleToEllipseTransform:(SEL)a3
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat MidX = CGRectGetMidX(a4);
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  CGFloat MidY = CGRectGetMidY(v28);
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", x, y, width, height);
  double v12 = v11;
  uint64_t v13 = MEMORY[0x263F000D0];
  long long v14 = *MEMORY[0x263F000D0];
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v15;
  long long v16 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)&retstr->tdouble x = v16;
  if (v12 > 0.0)
  {
    long long v22 = v15;
    long long v23 = v14;
    v29.origin.double x = x;
    v29.origin.double y = y;
    long long v21 = v16;
    v29.size.double width = width;
    v29.size.double height = height;
    CGFloat v17 = CGRectGetWidth(v29);
    CGAffineTransformMakeScale(&t2, v17 / (v12 + v12), 1.0);
    *(_OWORD *)&t1.a = v23;
    *(_OWORD *)&t1.c = v22;
    *(_OWORD *)&t1.tdouble x = v21;
    CGAffineTransformConcat(retstr, &t1, &t2);
  }
  CGAffineTransformMakeTranslation(&v25, MidX, MidY);
  long long v18 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v24.c = v18;
  *(_OWORD *)&v24.tdouble x = *(_OWORD *)&retstr->tx;
  CGPoint result = CGAffineTransformConcat(&t1, &v24, &v25);
  long long v20 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t1.tx;
  return result;
}

+ (BOOL)isPoint:(CGPoint)a3 onEllipse:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.y;
  double v9 = a3.x;
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", x, y, width, height);
  return vabdd_f64(hypot(v8 * 0.0 + 0.0 * v9 + 0.0, v8 * 0.0 + 0.0 * v9 + 0.0), v10) < 0.0005;
}

+ (void)intersectCircleAtPoint:(CGPoint)a3 withRadius:(double)a4 withCircleAtPoint:(CGPoint)a5 withRadius:(double)a6 firstOutPoint:(CGPoint *)a7 secondOutPoint:(CGPoint *)a8
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v14 = a5.x - a3.x;
  CGFloat v15 = a5.y - a3.y;
  long double v16 = hypot(a5.x - a3.x, a5.y - a3.y);
  long double v17 = (a4 * a4 - a6 * a6 + v16 * v16) / (v16 + v16);
  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v14, v15);
  long double v19 = x + v17 * v18;
  long double v21 = y + v17 * v20;
  double v22 = sqrt(a4 * a4 - v17 * v17);
  a7->double x = v19 - v22 * v20;
  a7->double y = v21 + v22 * v18;
  a8->double x = v19 + v22 * v20;
  a8->double y = v21 - v22 * v18;
}

+ (void)tangentPointsToEllipse:(CGRect)a3 fromPoint:(CGPoint)a4 firstOutPoint:(CGPoint *)a5 secondOutPoint:(CGPoint *)a6
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v12 = a3.origin.y;
  double v13 = a3.origin.x;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  +[AKGeometryHelper ellipseToCenteredCircleTransform:a3.origin.x];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:", v13, v12, width, height);
  long double v14 = *(double *)&v34 + y * *(double *)&v33 + *(double *)&v32 * x;
  long double v15 = *((double *)&v34 + 1) + y * *((double *)&v33 + 1) + *((double *)&v32 + 1) * x;
  long double v16 = hypot(v14, v15) * 0.5;
  +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", (double)(0.0 - v14), (double)(0.0 - v15));
  long double v18 = v14 + v16 * v17;
  long double v20 = v15 + v16 * v19;
  double v27 = 0.0;
  double v28 = 0.0;
  double v25 = 0.0;
  double v26 = 0.0;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", v13, v12, width, height);
  +[AKGeometryHelper intersectCircleAtPoint:withRadius:withCircleAtPoint:withRadius:firstOutPoint:secondOutPoint:](AKGeometryHelper, "intersectCircleAtPoint:withRadius:withCircleAtPoint:withRadius:firstOutPoint:secondOutPoint:", &v27, &v25, (double)v18, (double)v20, (double)v16, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v21);
  CGFloat v22 = *((double *)&v31 + 1) + v28 * *((double *)&v30 + 1) + *((double *)&v29 + 1) * v27;
  CGFloat v23 = *(double *)&v31 + *(double *)&v30 * v26 + *(double *)&v29 * v25;
  CGFloat v24 = *((double *)&v31 + 1) + *((double *)&v30 + 1) * v26 + *((double *)&v29 + 1) * v25;
  a5->double x = *(double *)&v31 + v28 * *(double *)&v30 + *(double *)&v29 * v27;
  a5->double y = v22;
  a6->double x = v23;
  a6->double y = v24;
}

+ (CGPoint)tangentOfEllipse:(CGRect)a3 throughRayWithFirstPoint:(CGPoint)a4 goingThrough:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v11 = a3.origin.y;
  double v12 = a3.origin.x;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:");
  double v21 = v13;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", v12, v11, width, height);
  +[AKGeometryHelper intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:](AKGeometryHelper, "intersectRayStartingAt:ending:withEllipseOfRect:farthestResult:", 0, v8, v7, x, y, v12, v11, width, height);
  double v19 = *((double *)&v25 + 1) + v14 * *((double *)&v24 + 1) + *((double *)&v23 + 1) * v15;
  double v20 = *(double *)&v25 + v14 * *(double *)&v24 + *(double *)&v23 * v15;
  v27.origin.double x = v12;
  v27.origin.double y = v11;
  v27.size.double width = width;
  v27.size.double height = height;
  CGFloat v16 = CGRectGetWidth(v27);
  CGAffineTransformMakeScale(&v22, v16 / (v21 + v21), 1.0);
  +[AKGeometryHelper normalizeVectorPoint:vaddq_f64(*(float64x2_t *)&v22.tx, vmlsq_lane_f64(vmulq_n_f64(*(float64x2_t *)&v22.c, v20), *(float64x2_t *)&v22.a, v19, 0))];
  result.double y = v18;
  result.double x = v17;
  return result;
}

+ (id)verticesOfPolygonWithPointCount:(unint64_t)a3 inRect:(CGRect)a4 rotation:(double)a5 flippedVertically:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v40 = *MEMORY[0x263EF8340];
  double v13 = [MEMORY[0x263EFF980] array];
  double v14 = [MEMORY[0x263EFF980] array];
  double v31 = height;
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:", x, y, width, height);
  if (a3)
  {
    double v16 = v15;
    double v17 = 360.0 / (double)a3;
    do
    {
      __double2 v18 = __sincos_stret(a5 * 3.14159265 / 180.0 + 1.57079633);
      double v19 = v16 * v18.__cosval;
      double v20 = v16 * v18.__sinval;
      if (v6) {
        +[AKGeometryHelper flipPointVertically:inRect:](AKGeometryHelper, "flipPointVertically:inRect:", v19, v20, -v16, -v16, v16 + v16, v16 + v16);
      }
      double v21 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", v19, v20);
      [v13 addObject:v21];

      a5 = v17 + a5;
      --a3;
    }
    while (a3);
  }
  float64x2_t v37 = 0u;
  float64x2_t v38 = 0u;
  float64x2_t v36 = 0u;
  +[AKGeometryHelper centeredCircleToEllipseTransform:](AKGeometryHelper, "centeredCircleToEllipseTransform:", x, y, width, v31);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v22 = v13;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * i) akPointValue];
        long long v29 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", vaddq_f64(v38, vmlaq_n_f64(vmulq_n_f64(v37, v27), v36, v28)));
        [v14 addObject:v29];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v24);
  }

  return v14;
}

+ (CGPoint)flipPointVertically:(CGPoint)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v12 = a3.y;
  double v13 = a3.x;
  double MidX = CGRectGetMidX(a4);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v20);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -MidX, -MidY);
  CGAffineTransformMakeScale(&t2, 1.0, -1.0);
  CGAffineTransform t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &t2);
  CGAffineTransform v18 = v17;
  CGAffineTransformMakeTranslation(&v14, MidX, MidY);
  CGAffineTransform t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &v14);
  float64x2_t v10 = vaddq_f64(*(float64x2_t *)&v17.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v17.c, v12), *(float64x2_t *)&v17.a, v13));
  double v11 = v10.f64[1];
  result.CGFloat x = v10.f64[0];
  result.CGFloat y = v11;
  return result;
}

+ (int64_t)exifOrientationWithConversionBlock:(id)a3
{
  double v3 = (double (**)(id, double, double))((char *)a3 + 16);
  CGFloat v4 = (double (*)(double, double))*((void *)a3 + 2);
  id v5 = a3;
  double v6 = v4(0.0, 0.0);
  double v8 = v7;
  double v9 = (*v3)(v5, 1.0, 0.0);
  double v11 = v10;
  double v12 = (*v3)(v5, 0.0, 1.0);
  double v14 = v13;

  double v15 = v9 - v6 + -0.0005;
  double v16 = v11 - v8 + 0.0005;
  uint64_t v17 = v16 < 0.0;
  BOOL v18 = v15 > 0.0;
  double v19 = v9 - v6 + 0.0005;
  double v20 = v11 - v8 + -0.0005;
  uint64_t v21 = 2;
  if (v15 <= 0.0) {
    uint64_t v21 = 1;
  }
  if (v19 < 0.0) {
    BOOL v18 = v21;
  }
  if (v20 > 0.0) {
    ++v17;
  }
  uint64_t v22 = v17 + v18;
  if (v22 != 1)
  {
    if (v22) {
      NSLog(&cfstr_SRightVectorWa_0.isa, "+[AKGeometryHelper exifOrientationWithConversionBlock:]", v15 > 0.0, v19 < 0.0, v20 > 0.0, v16 < 0.0);
    }
    else {
      NSLog(&cfstr_SRightVectorWa.isa, "+[AKGeometryHelper exifOrientationWithConversionBlock:]");
    }
    return 1;
  }
  double v23 = v12 - v6 + -0.0005;
  double v24 = v12 - v6 + 0.0005;
  double v25 = v14 - v8 + -0.0005;
  double v26 = v14 - v8 + 0.0005;
  uint64_t v27 = v26 < 0.0;
  BOOL v28 = v23 > 0.0;
  uint64_t v29 = 2;
  if (v23 <= 0.0) {
    uint64_t v29 = 1;
  }
  if (v24 < 0.0) {
    BOOL v28 = v29;
  }
  if (v25 > 0.0) {
    ++v27;
  }
  uint64_t v30 = v27 + v28;
  if (v30 != 1)
  {
    if (v30) {
      NSLog(&cfstr_SUpVectorWasTr.isa, "+[AKGeometryHelper exifOrientationWithConversionBlock:]", v23 > 0.0, v24 < 0.0, v25 > 0.0, v26 < 0.0);
    }
    else {
      NSLog(&cfstr_SUpVectorWasCo.isa, "+[AKGeometryHelper exifOrientationWithConversionBlock:]");
    }
    return 1;
  }
  BOOL v31 = v25 <= 0.0;
  BOOL v32 = v15 <= 0.0;
  BOOL v33 = v15 > 0.0 && v25 > 0.0;
  if (v33) {
    return 1;
  }
  if (v19 >= 0.0) {
    BOOL v31 = 1;
  }
  if (!v31) {
    return 2;
  }
  if (v26 >= 0.0) {
    BOOL v32 = 1;
  }
  if (!v32) {
    return 4;
  }
  if (v19 < 0.0 && v26 < 0.0) {
    return 3;
  }
  if (v16 < 0.0 && v23 > 0.0) {
    return 6;
  }
  if (v20 > 0.0 && v23 > 0.0) {
    return 7;
  }
  BOOL v35 = v20 <= 0.0;
  BOOL v36 = v24 < 0.0;
  if (v24 >= 0.0) {
    BOOL v35 = 1;
  }
  BOOL v37 = v16 < 0.0;
  int v38 = v16 < 0.0 || v35;
  BOOL v39 = v37 && v36;
  BOOL v33 = !v37 || !v36;
  int64_t v40 = 5;
  if (v33) {
    int64_t v40 = 0;
  }
  if (v38) {
    int64_t result = v40;
  }
  else {
    int64_t result = 8;
  }
  if (v38 && !v39)
  {
    BOOL v41 = v24 < 0.0 || v23 > 0.0;
    if (v19 >= 0.0 && v15 <= 0.0 || !v41)
    {
      BOOL v44 = v26 < 0.0 || v25 > 0.0;
      BOOL v45 = v16 >= 0.0 && v20 <= 0.0;
      if (v45 || !v44) {
        NSLog(&cfstr_UpvectorAndRig_1.isa);
      }
      else {
        NSLog(&cfstr_UpvectorAndRig_0.isa);
      }
    }
    else
    {
      NSLog(&cfstr_UpvectorAndRig.isa);
    }
    return 1;
  }
  return result;
}

+ (int64_t)inverseExifOrientation:(int64_t)a3
{
  int64_t v3 = 6;
  if (a3 != 8) {
    int64_t v3 = a3;
  }
  if (a3 == 6) {
    return 8;
  }
  else {
    return v3;
  }
}

+ (int64_t)concatExifOrientation:(int64_t)a3 withExifOrientation:(int64_t)a4
{
  return qword_2376F4120[9 * a3 + a4];
}

+ (CGAffineTransform)_rawAffineTransformForExifOrientation:(SEL)a3
{
  uint64_t v5 = MEMORY[0x263F000D0];
  long long v6 = *MEMORY[0x263F000D0];
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v7;
  long long v8 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&retstr->tCGFloat x = v8;
  switch(a4)
  {
    case 2:
      CGFloat v9 = -1.0;
      CGFloat v10 = 1.0;
      goto LABEL_5;
    case 3:
      CGFloat v11 = -3.14159265;
      goto LABEL_13;
    case 4:
      CGFloat v9 = 1.0;
      CGFloat v10 = -1.0;
LABEL_5:
      return CGAffineTransformMakeScale(retstr, v9, v10);
    case 5:
      long long v18 = v7;
      long long v20 = v6;
      long long v16 = v8;
      CGAffineTransformMakeScale(&t2, 1.0, -1.0);
      *(_OWORD *)&t1.a = v20;
      *(_OWORD *)&t1.c = v18;
      *(_OWORD *)&t1.tCGFloat x = v16;
      CGAffineTransformConcat(retstr, &t1, &t2);
      CGAffineTransformMakeRotation(&v25, -1.57079633);
      long long v12 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v24.c = v12;
      *(_OWORD *)&v24.tCGFloat x = *(_OWORD *)&retstr->tx;
      double v13 = &v25;
      goto LABEL_11;
    case 6:
      CGFloat v11 = -1.57079633;
      goto LABEL_13;
    case 7:
      long long v19 = v7;
      long long v21 = v6;
      long long v17 = v8;
      CGAffineTransformMakeScale(&v23, 1.0, -1.0);
      *(_OWORD *)&t1.a = v21;
      *(_OWORD *)&t1.c = v19;
      *(_OWORD *)&t1.tCGFloat x = v17;
      CGAffineTransformConcat(retstr, &t1, &v23);
      CGAffineTransformMakeRotation(&v22, -4.71238898);
      long long v14 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v24.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v24.c = v14;
      *(_OWORD *)&v24.tCGFloat x = *(_OWORD *)&retstr->tx;
      double v13 = &v22;
LABEL_11:
      int64_t result = CGAffineTransformConcat(&t1, &v24, v13);
      long long v15 = *(_OWORD *)&t1.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
      *(_OWORD *)&retstr->c = v15;
      *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&t1.tx;
      break;
    case 8:
      CGFloat v11 = -4.71238898;
LABEL_13:
      int64_t result = CGAffineTransformMakeRotation(retstr, v11);
      break;
    default:
      return result;
  }
  return result;
}

+ (CGAffineTransform)affineTransformRecenteringAboutOriginForExifOrientation:(SEL)a3 withOriginalSize:(int64_t)a4
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  memset(&v16, 0, sizeof(v16));
  objc_msgSend(a2, "_rawAffineTransformForExifOrientation:");
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v15.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v15.c = v9;
  *(_OWORD *)&v15.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  switch(a4)
  {
    case 2:
    case 8:
      CGFloat v11 = 0.0;
      CGFloat v10 = width;
      goto LABEL_6;
    case 3:
    case 5:
      CGFloat v10 = width;
      goto LABEL_4;
    case 4:
    case 6:
      CGFloat v10 = 0.0;
LABEL_4:
      CGFloat v11 = height;
LABEL_6:
      CGAffineTransformMakeTranslation(&v15, v10, v11);
      break;
    default:
      break;
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform t1 = v16;
  CGAffineTransform v13 = v15;
  return CGAffineTransformConcat(retstr, &t1, &v13);
}

+ (CGAffineTransform)affineTransformFlatteningOriginalModelExif:(SEL)a3 withOriginalModelSize:(int64_t)a4
{
  double height = a5.height;
  double width = a5.width;
  BOOL v9 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:");
  if (v9) {
    double v10 = height;
  }
  else {
    double v10 = width;
  }
  if (v9) {
    double v11 = width;
  }
  else {
    double v11 = height;
  }
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;

  return +[AKGeometryHelper affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:](AKGeometryHelper, "affineTransformRecenteringAboutOriginForExifOrientation:withOriginalSize:", a4, v10, v11);
}

+ (CGAffineTransform)affineTransformForExifOrientation:(SEL)a3 aboutCenter:(int64_t)a4
{
  double y = a5.y;
  double x = a5.x;
  memset(&v22, 0, sizeof(v22));
  [a2 _rawAffineTransformForExifOrientation:a4];
  uint64_t v8 = MEMORY[0x263F000D0];
  long long v15 = *MEMORY[0x263F000D0];
  long long v16 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v16;
  long long v14 = *(_OWORD *)(v8 + 32);
  *(_OWORD *)&retstr->tdouble x = v14;
  CGAffineTransformMakeTranslation(&t2, -x, -y);
  *(_OWORD *)&t1.a = v15;
  *(_OWORD *)&t1.c = v16;
  *(_OWORD *)&t1.tdouble x = v14;
  CGAffineTransformConcat(retstr, &t1, &t2);
  long long v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v19.c = v9;
  *(_OWORD *)&v19.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransform v18 = v22;
  CGAffineTransformConcat(&t1, &v19, &v18);
  long long v10 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v17, x, y);
  long long v11 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v19.c = v11;
  *(_OWORD *)&v19.tdouble x = *(_OWORD *)&retstr->tx;
  int64_t result = CGAffineTransformConcat(&t1, &v19, &v17);
  long long v13 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&t1.tx;
  return result;
}

+ (void)adjustOriginalExifOrientationOnAnnotation:(id)a3 flatteningOriginalModelExif:(int64_t)a4
{
  id v6 = a3;
  int64_t v5 = +[AKGeometryHelper concatExifOrientation:withExifOrientation:](AKGeometryHelper, "concatExifOrientation:withExifOrientation:", [v6 originalExifOrientation], +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", a4));
  [v6 setOriginalExifOrientation:0];
  [v6 setOriginalExifOrientation:v5];
}

+ (CGPoint)adjustPoint:(CGPoint)a3 forExifOrientation:(int64_t)a4 aboutCenter:(CGPoint)a5
{
  double y = a3.y;
  double x = a3.x;
  objc_msgSend(a1, "affineTransformForExifOrientation:aboutCenter:", a4, a5.x, a5.y);
  float64x2_t v5 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, y), (float64x2_t)0, x));
  double v6 = v5.f64[1];
  result.double x = v5.f64[0];
  result.double y = v6;
  return result;
}

+ (CGRect)adjustRect:(CGRect)a3 forExifOrientation:(int64_t)a4 aboutCenter:(CGPoint)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_msgSend(a1, "affineTransformForExifOrientation:aboutCenter:", a4, a5.x, a5.y);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v16);
  v17.origin.CGFloat y = MinY * 0.0 + 0.0 * MinX + 0.0;
  v17.size.CGFloat width = MaxY * 0.0 + 0.0 * MaxX + 0.0 - v17.origin.y;
  v17.size.CGFloat height = v17.size.width;
  v17.origin.CGFloat x = v17.origin.y;
  return CGRectStandardize(v17);
}

+ (CGPath)newPathWithPath:(CGPath *)a3 applyingExifOrientation:(int64_t)a4 aboutCenter:(CGPoint)a5
{
  objc_msgSend(a1, "affineTransformForExifOrientation:aboutCenter:", a4, a5.x, a5.y, 0, 0, 0, 0, 0, 0);
  return (CGPath *)MEMORY[0x237E1D700](a3, &v7);
}

+ (CGPoint)convertModelToScreenOrientationForPoint:(CGPoint)a3 relativeToRect:(CGRect)a4 withPageController:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.y;
  double v10 = a3.x;
  id v11 = a5;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v20);
  uint64_t v14 = [v11 currentModelToScreenExifOrientation];

  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v14, v10, v9, MidX, MidY);
  result.CGFloat y = v16;
  result.CGFloat x = v15;
  return result;
}

+ (CGRect)convertModelToScreenOrientationForRect:(CGRect)a3 withPageController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  double MidX = CGRectGetMidX(v17);
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  double MidY = CGRectGetMidY(v18);
  uint64_t v11 = [v8 currentModelToScreenExifOrientation];

  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v11, x, y, width, height, MidX, MidY);
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

+ (CGPoint)convertScreenToModelOrientationForPoint:(CGPoint)a3 relativeToRect:(CGRect)a4 withPageController:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = a3.y;
  double v10 = a3.x;
  id v11 = a5;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v21);
  uint64_t v14 = [v11 currentModelToScreenExifOrientation];

  int64_t v15 = +[AKGeometryHelper inverseExifOrientation:v14];

  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v15, v10, v9, MidX, MidY);
  result.CGFloat y = v17;
  result.CGFloat x = v16;
  return result;
}

+ (CGRect)convertScreenToModelOrientationForRect:(CGRect)a3 withPageController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  double MidX = CGRectGetMidX(v18);
  v19.origin.double x = x;
  v19.origin.double y = y;
  v19.size.double width = width;
  v19.size.double height = height;
  double MidY = CGRectGetMidY(v19);
  uint64_t v11 = [v8 currentModelToScreenExifOrientation];

  int64_t v12 = +[AKGeometryHelper inverseExifOrientation:v11];

  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", v12, x, y, width, height, MidX, MidY);
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

+ (BOOL)exifOrientationHasFlip:(int64_t)a3
{
  return ((unint64_t)a3 < 8) & (0xB4u >> a3);
}

+ (BOOL)exifOrientationHasReversedAxes:(int64_t)a3
{
  return a3 > 4;
}

+ (unint64_t)draggableArea:(unint64_t)a3 convertedForExif:(int64_t)a4
{
  unint64_t result = a3;
  switch(a3)
  {
    case 1uLL:
      int64_t v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) < 7)
      {
        double v6 = &unk_2376F43A8;
        goto LABEL_18;
      }
      unint64_t result = 1;
      break;
    case 2uLL:
      int64_t v5 = a4 - 3;
      if ((unint64_t)(a4 - 3) < 6)
      {
        double v6 = &unk_2376F43E0;
        goto LABEL_18;
      }
      unint64_t result = 2;
      break;
    case 3uLL:
      int64_t v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) < 7)
      {
        double v6 = &unk_2376F4410;
        goto LABEL_18;
      }
      unint64_t result = 3;
      break;
    case 4uLL:
      int64_t v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) < 7)
      {
        double v6 = &unk_2376F4480;
        goto LABEL_18;
      }
      unint64_t result = 4;
      break;
    case 5uLL:
      int64_t v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) < 7)
      {
        double v6 = &unk_2376F4520;
        goto LABEL_18;
      }
      unint64_t result = 5;
      break;
    case 6uLL:
      int64_t v5 = a4 - 3;
      if ((unint64_t)(a4 - 3) < 6)
      {
        double v6 = &unk_2376F44F0;
        goto LABEL_18;
      }
      unint64_t result = 6;
      break;
    case 7uLL:
      int64_t v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) < 7)
      {
        double v6 = &unk_2376F44B8;
        goto LABEL_18;
      }
      unint64_t result = 7;
      break;
    case 8uLL:
      int64_t v5 = a4 - 2;
      if ((unint64_t)(a4 - 2) >= 7)
      {
        unint64_t result = 8;
      }
      else
      {
        double v6 = &unk_2376F4448;
LABEL_18:
        unint64_t result = v6[v5];
      }
      break;
    default:
      return result;
  }
  return result;
}

+ (CGVector)normalizeVector:(CGVector)a3
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  objc_msgSend(a1, "lengthOfVector:");
  double v6 = dy / v5;
  double v7 = dx / v5;
  result.ddouble y = v6;
  result.ddouble x = v7;
  return result;
}

+ (double)angleOfVector:(CGVector)a3
{
  double result = atan2(a3.dy, a3.dx);
  if (result < 0.0) {
    return result + 6.28318531;
  }
  return result;
}

+ (double)angleBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  objc_msgSend(a1, "angleOfVector:", a3.x, a3.y);
  memset(&v9, 0, sizeof(v9));
  CGAffineTransformMakeRotation(&v9, -v5);
  objc_msgSend(a1, "angleOfVector:", vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x)));
  return result;
}

+ (double)distanceBetweenPoints:(CGPoint)a3 andPoint:(CGPoint)a4
{
  return hypot(a3.x - a4.x, a3.y - a4.y);
}

+ (CGPoint)pointAtAngle:(double)a3 inCircleWithCenter:(CGPoint)a4 andRadius:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  __double2 v8 = __sincos_stret(a3);
  double v9 = x + v8.__cosval * a5;
  double v10 = y + v8.__sinval * a5;
  result.double y = v10;
  result.double x = v9;
  return result;
}

+ (CGPoint)compareVectorDirectionsFirstVector:(CGPoint)a3 secondVector:(CGPoint)a4
{
  double y = a3.y;
  double v5 = -1.0;
  if ((y <= 0.0 || a4.y >= 0.0) && (y >= 0.0 || a4.y <= 0.0))
  {
    double v5 = *(double *)(MEMORY[0x263F00148] + 8);
    BOOL v6 = y < 0.0;
    BOOL v7 = y > 0.0;
    if (a4.y <= 0.0) {
      BOOL v7 = 0;
    }
    if (a4.y >= 0.0) {
      BOOL v6 = 0;
    }
    if (v7 || v6) {
      double v5 = 1.0;
    }
  }
  double v8 = -1.0;
  if ((a3.x <= 0.0 || a4.x >= 0.0) && (a3.x >= 0.0 || a4.x <= 0.0))
  {
    double v8 = *MEMORY[0x263F00148];
    BOOL v9 = a3.x < 0.0;
    BOOL v10 = a3.x > 0.0;
    if (a4.x <= 0.0) {
      BOOL v10 = 0;
    }
    if (a4.x >= 0.0) {
      BOOL v9 = 0;
    }
    if (v10 || v9) {
      double v8 = 1.0;
    }
  }
  double v11 = v8;
  result.double y = v5;
  result.double x = v11;
  return result;
}

+ (CGRect)expandCGRect:(CGRect)a3 toContainPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  if (MinX >= x) {
    double v11 = x;
  }
  else {
    double v11 = MinX;
  }
  v21.origin.double x = v9;
  v21.origin.double y = v8;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v21);
  if (MaxX >= x) {
    double v13 = MaxX;
  }
  else {
    double v13 = x;
  }
  v22.origin.double x = v9;
  v22.origin.double y = v8;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v22);
  if (MinY >= y) {
    double v15 = y;
  }
  else {
    double v15 = MinY;
  }
  v23.origin.double x = v9;
  v23.origin.double y = v8;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v23);
  if (MaxY < y) {
    double MaxY = y;
  }
  double v17 = v13 - v11;
  double v18 = MaxY - v15;
  double v19 = v11;
  double v20 = v15;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

+ (CGRect)effectiveDrawingBoundsForAnnotation:(id)a3 forDisplay:(BOOL)a4 pageControllerOrNil:(id)a5 outScaleFactor:(double *)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  double v11 = v10;
  if (!v8)
  {
    [v9 integralDrawingBounds];
    CGFloat v30 = v37;
    CGFloat v24 = v38;
    CGFloat v26 = v39;
    CGFloat v28 = v40;
    double v32 = 1.0;
    if (!a6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int64_t v12 = [v10 geometryHelper];
  [v12 annotationLayerFrameForAnnotation:v9 layerIsClipped:0];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  objc_msgSend(v11, "convertRectFromOverlayToModel:", v14, v16, v18, v20);
  CGFloat v22 = v21;
  CGFloat v41 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  v43.origin.double x = v14;
  v43.origin.double y = v16;
  v43.size.CGFloat width = v18;
  v43.size.CGFloat height = v20;
  double Width = CGRectGetWidth(v43);
  v44.origin.double x = v22;
  v44.origin.double y = v24;
  v44.size.CGFloat width = v26;
  v44.size.CGFloat height = v28;
  double v29 = Width / CGRectGetWidth(v44);
  v45.origin.double x = v14;
  CGFloat v30 = v41;
  v45.origin.double y = v16;
  v45.size.CGFloat width = v18;
  v45.size.CGFloat height = v20;
  double Height = CGRectGetHeight(v45);
  v46.origin.double x = v41;
  v46.origin.double y = v24;
  v46.size.CGFloat width = v26;
  v46.size.CGFloat height = v28;
  double v32 = Height / CGRectGetHeight(v46);
  if (v29 >= v32) {
    double v32 = v29;
  }
  if (a6) {
LABEL_5:
  }
    *a6 = v32;
LABEL_6:

  double v33 = v30;
  double v34 = v24;
  double v35 = v26;
  double v36 = v28;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

+ (CGAffineTransform)verticalFlipTransformForRect:(SEL)a3
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MidX = CGRectGetMidX(a4);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v25);
  uint64_t v11 = MEMORY[0x263F000D0];
  long long v18 = *MEMORY[0x263F000D0];
  long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v19;
  long long v17 = *(_OWORD *)(v11 + 32);
  *(_OWORD *)&retstr->tCGFloat x = v17;
  CGAffineTransformMakeTranslation(&t2, -MidX, -MidY);
  *(_OWORD *)&t1.a = v18;
  *(_OWORD *)&t1.c = v19;
  *(_OWORD *)&t1.tCGFloat x = v17;
  CGAffineTransformConcat(retstr, &t1, &t2);
  CGAffineTransformMakeScale(&v22, 1.0, -1.0);
  long long v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v21.c = v12;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v21, &v22);
  long long v13 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v20, MidX, MidY);
  long long v14 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v21.c = v14;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGRect result = CGAffineTransformConcat(&t1, &v21, &v20);
  long long v16 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v16;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&t1.tx;
  return result;
}

+ (CGAffineTransform)horizontalFlipTransformForRect:(SEL)a3
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MidX = CGRectGetMidX(a4);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v25);
  uint64_t v11 = MEMORY[0x263F000D0];
  long long v18 = *MEMORY[0x263F000D0];
  long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v19;
  long long v17 = *(_OWORD *)(v11 + 32);
  *(_OWORD *)&retstr->tCGFloat x = v17;
  CGAffineTransformMakeTranslation(&t2, -MidX, -MidY);
  *(_OWORD *)&t1.a = v18;
  *(_OWORD *)&t1.c = v19;
  *(_OWORD *)&t1.tCGFloat x = v17;
  CGAffineTransformConcat(retstr, &t1, &t2);
  CGAffineTransformMakeScale(&v22, -1.0, 1.0);
  long long v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v21.c = v12;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v21, &v22);
  long long v13 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v20, MidX, MidY);
  long long v14 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v21.c = v14;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGRect result = CGAffineTransformConcat(&t1, &v21, &v20);
  long long v16 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v16;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&t1.tx;
  return result;
}

+ (BOOL)annotationHasRotation:(id)a3 outAngle:(double *)a4
{
  id v5 = a3;
  if ([v5 conformsToAKRotatableAnnotationProtocol])
  {
    [v5 rotationAngle];
    BOOL v7 = fabs(v6) >= 0.0005;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v7 = 0;
  double v6 = 0.0;
  if (a4) {
LABEL_5:
  }
    *a4 = v6;
LABEL_6:

  return v7;
}

+ (CGAffineTransform)rotationTransformForRectangularAnnotation:(SEL)a3 hasRotation:(id)a4
{
  id v7 = a4;
  uint64_t v8 = MEMORY[0x263F000D0];
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v8 + 32);
  uint64_t v16 = 0;
  BOOL v10 = +[AKGeometryHelper annotationHasRotation:v7 outAngle:&v16];
  BOOL v11 = v10;
  if (v10)
  {
    [v7 rectangle];
    +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:");
    *(_OWORD *)&retstr->a = v13;
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tCGFloat x = v15;
  }
  if (a5) {
    *a5 = v11;
  }

  return result;
}

+ (CGAffineTransform)rotationTransformForRect:(SEL)a3 withAngle:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MidX = CGRectGetMidX(a4);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v15);

  return (CGAffineTransform *)objc_msgSend(a2, "rotationTransformAroundPoint:withAngle:", MidX, MidY, a5);
}

+ (CGAffineTransform)rotationTransformAroundPoint:(SEL)a3 withAngle:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeTranslation(retstr, -a4.x, -a4.y);
  CGAffineTransformMakeRotation(&t2, a5);
  long long v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v9;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&v17, &t1, &t2);
  long long v10 = *(_OWORD *)&v17.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v17.tx;
  CGAffineTransformMakeTranslation(&v14, x, y);
  long long v11 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v11;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGRect result = CGAffineTransformConcat(&v17, &t1, &v14);
  long long v13 = *(_OWORD *)&v17.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v17.tx;
  return result;
}

+ (id)_cornersOfRotatedRectangle:(CGRect)a3 angle:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v10 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  objc_msgSend(a1, "rotationTransformForRect:withAngle:", x, y, width, height, a4);
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  double MinX = CGRectGetMinX(v21);
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  long long v11 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGRectGetMinY(v22)), (float64x2_t)0, MinX)));
  [v10 addObject:v11];

  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.double width = width;
  v23.size.double height = height;
  double MaxX = CGRectGetMaxX(v23);
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  long long v12 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGRectGetMinY(v24)), (float64x2_t)0, MaxX)));
  [v10 addObject:v12];

  v25.origin.double x = x;
  v25.origin.double y = y;
  v25.size.double width = width;
  v25.size.double height = height;
  double v18 = CGRectGetMaxX(v25);
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  long long v13 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGRectGetMaxY(v26)), (float64x2_t)0, v18)));
  [v10 addObject:v13];

  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  double v19 = CGRectGetMinX(v27);
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  CGAffineTransform v14 = objc_msgSend(MEMORY[0x263F08D40], "akValueWithPoint:", vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, CGRectGetMaxY(v28)), (float64x2_t)0, v19)));
  [v10 addObject:v14];

  return v10;
}

+ (CGRect)boundsOfRotatedRectangle:(CGRect)a3 angle:(double)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CGFloat v4 = objc_msgSend(a1, "_cornersOfRotatedRectangle:angle:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    double v8 = 1.79769313e308;
    double v9 = 2.22507386e-308;
    double v10 = 2.22507386e-308;
    double v11 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) akPointValue];
        if (v13 > v9) {
          double v9 = v13;
        }
        if (v13 < v8) {
          double v8 = v13;
        }
        if (v14 > v10) {
          double v10 = v14;
        }
        if (v14 < v11) {
          double v11 = v14;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 1.79769313e308;
    double v9 = 2.22507386e-308;
    double v10 = 2.22507386e-308;
    double v11 = 1.79769313e308;
  }

  double v15 = v9 - v8;
  double v16 = v10 - v11;
  double v17 = v8;
  double v18 = v11;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

+ (CGRect)convertRect:(CGRect)a3 fromViewToScreenPixels:(id)a4 useNativeScale:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  double v11 = [v10 window];
  objc_msgSend(v10, "convertRect:toView:", v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  long long v20 = [v11 screen];
  long long v21 = [v20 coordinateSpace];

  objc_msgSend(v11, "convertRect:toCoordinateSpace:", v21, v13, v15, v17, v19);
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v30 = [v11 screen];
  BOOL v31 = v30;
  if (a5) {
    [v30 nativeScale];
  }
  else {
    [v30 scale];
  }
  CGFloat v33 = v32;

  CGAffineTransformMakeScale(&v42, v33, v33);
  v43.origin.double x = v23;
  v43.origin.double y = v25;
  v43.size.double width = v27;
  v43.size.double height = v29;
  CGRect v44 = CGRectApplyAffineTransform(v43, &v42);
  CGRect v45 = CGRectStandardize(v44);
  CGFloat v34 = v45.origin.x;
  CGFloat v35 = v45.origin.y;
  CGFloat v36 = v45.size.width;
  CGFloat v37 = v45.size.height;

  double v38 = v34;
  double v39 = v35;
  double v40 = v36;
  double v41 = v37;
  result.size.double height = v41;
  result.size.double width = v40;
  result.origin.double y = v39;
  result.origin.double x = v38;
  return result;
}

+ (CGRect)convertRect:(CGRect)a3 fromScreenPointsToView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  double v9 = [v8 window];
  id v10 = [v9 screen];
  double v11 = [v10 coordinateSpace];

  objc_msgSend(v9, "convertRect:fromCoordinateSpace:", v11, x, y, width, height);
  objc_msgSend(v8, "convertRect:fromView:", v9);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (AKGeometryHelper)initWithPageController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKGeometryHelper;
  uint64_t v5 = [(AKGeometryHelper *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(AKGeometryHelper *)v5 setPageController:v4];
  }

  return v6;
}

- (CGRect)annotationLayerFrameForAnnotation:(id)a3 layerIsClipped:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = [(AKGeometryHelper *)self pageController];
  [v6 drawingBounds];
  double x = v40.origin.x;
  double y = v40.origin.y;
  double width = v40.size.width;
  double height = v40.size.height;
  if (CGRectIsInfinite(v40))
  {
    double v12 = [v7 overlayView];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    objc_msgSend(v7, "convertRectFromOverlayToModel:", v14, v16, v18, v20);
    double x = v21;
    double y = v22;
    double width = v23;
    double height = v24;
  }
  else if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", x, y, width, height))
  {
    CGFloat v25 = (objc_class *)objc_opt_class();
    double v26 = NSStringFromClass(v25);
    v41.origin.double x = x;
    v41.origin.double y = y;
    v41.size.double width = width;
    v41.size.double height = height;
    CGFloat v27 = j__NSStringFromCGRect(v41);
    NSLog(&cfstr_SReportedBogus.isa, "-[AKGeometryHelper annotationLayerFrameForAnnotation:layerIsClipped:]", v26, v27);

    if (+[AKGeometryHelper isUnpresentablePoint:](AKGeometryHelper, "isUnpresentablePoint:", x, y))
    {
      double y = 0.0;
      double x = 0.0;
    }
    double height = 1.0;
    double width = 1.0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[AKGeometryHelper screenPixelAlignedRectForRect:](self, "screenPixelAlignedRectForRect:", x, y, width, height);
  }
  else {
    -[AKGeometryHelper _smartAlignedRectForRect:](self, "_smartAlignedRectForRect:", x, y, width, height);
  }
  objc_msgSend(v7, "convertRectFromModelToOverlay:");
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  if (a4) {
    *a4 = 0;
  }

  double v36 = v29;
  double v37 = v31;
  double v38 = v33;
  double v39 = v35;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (CGRect)_clippingFrameForView:(id)a3
{
  id v3 = a3;
  id v4 = [v3 window];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", v6, v8, v10, v12))
  {
    [v3 frame];
  }
  else
  {
    objc_msgSend(v3, "convertRect:fromView:", 0, v6, v8, v10, v12);
  }
  uint64_t v17 = v13;
  uint64_t v18 = v14;
  double v19 = v15;
  double v20 = v16;

  uint64_t v21 = v17;
  uint64_t v22 = v18;
  double v23 = v19;
  double v24 = v20;

  return CGRectInset(*(CGRect *)&v21, -v19, -v20);
}

- (CGRect)adornmentLayerFrameForAnnotation:(id)a3
{
  id v4 = a3;
  double v5 = [(AKGeometryHelper *)self pageController];
  [v4 drawingBounds];
  double x = v30.origin.x;
  double y = v30.origin.y;
  double width = v30.size.width;
  double height = v30.size.height;
  if (CGRectIsInfinite(v30))
  {
    double v10 = [v5 overlayView];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    if (+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:", x, y, width, height))
    {
      double v19 = (objc_class *)objc_opt_class();
      double v20 = NSStringFromClass(v19);
      v31.origin.double x = x;
      v31.origin.double y = y;
      v31.size.double width = width;
      v31.size.double height = height;
      uint64_t v21 = j__NSStringFromCGRect(v31);
      NSLog(&cfstr_SReportedBogus.isa, "-[AKGeometryHelper adornmentLayerFrameForAnnotation:]", v20, v21);

      if (+[AKGeometryHelper isUnpresentablePoint:](AKGeometryHelper, "isUnpresentablePoint:", x, y))
      {
        double y = 0.0;
        double x = 0.0;
      }
      double height = 1.0;
      double width = 1.0;
    }
    objc_msgSend(v5, "convertRectFromModelToOverlay:", x, y, width, height);
    double v12 = v22;
    double v14 = v23;
    double v16 = v24;
    double v18 = v25;
  }

  double v26 = v12;
  double v27 = v14;
  double v28 = v16;
  double v29 = v18;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromModelToLayer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(AKGeometryHelper *)self pageController];
  double v9 = [v8 overlayView];
  double v10 = [v9 layer];
  objc_msgSend(v8, "convertPointFromModelToOverlay:", x, y);
  objc_msgSend(v10, "convertPoint:toLayer:", v7);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromModelToLayer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double v10 = [(AKGeometryHelper *)self pageController];
  double v11 = [v10 overlayView];
  double v12 = [v11 layer];
  objc_msgSend(v10, "convertRectFromModelToOverlay:", x, y, width, height);
  objc_msgSend(v12, "convertRect:toLayer:", v9);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CGPoint)contentAlignedPointForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(AKGeometryHelper *)self _shouldAlignToContent])
  {
    objc_msgSend((id)objc_opt_class(), "_alignedPointForPoint:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 1, 0, 0, 0, x, y);
    double x = v5;
    double y = v6;
  }
  double v7 = x;
  double v8 = y;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGRect)contentAlignedRectForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(AKGeometryHelper *)self _shouldAlignToContent])
  {
    objc_msgSend((id)objc_opt_class(), "_alignedStableRectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 1, 0, 0, 0, x, y, width, height);
    double x = v7;
    double y = v8;
    double width = v9;
    double height = v10;
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGPoint)screenPixelAlignedPointForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = objc_opt_class();
  double v7 = [(AKGeometryHelper *)self pageController];
  objc_msgSend(v6, "_alignedPointForPoint:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 0, v7, 0, 0, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGRect)screenPixelAlignedRectForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = objc_opt_class();
  double v9 = [(AKGeometryHelper *)self pageController];
  objc_msgSend(v8, "_alignedStableRectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 0, v9, 0, 0, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)_smartAlignedRectForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = objc_opt_class();
  BOOL v9 = [(AKGeometryHelper *)self _shouldAlignToContent];
  if ([(AKGeometryHelper *)self _shouldAlignToScreen])
  {
    double v10 = [(AKGeometryHelper *)self pageController];
    objc_msgSend(v8, "_alignedStableRectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", v9, v10, 0, 0, x, y, width, height);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    objc_msgSend(v8, "_alignedStableRectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", v9, 0, 0, 0, x, y, width, height);
    double v12 = v19;
    double v14 = v20;
    double v16 = v21;
    double v18 = v22;
  }
  double v23 = v12;
  double v24 = v14;
  double v25 = v16;
  double v26 = v18;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (CGRect)screenStrokeAlignedRectForRect:(CGRect)a3 withStrokeWidth:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = objc_opt_class();
  double v11 = [(AKGeometryHelper *)self pageController];
  objc_msgSend(v10, "_strokeAlignedRectForRect:withStrokeWidth:shouldAlignStrictlyToScreen:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 1, v11, 0, 0, x, y, width, height, a4);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

+ (CGRect)renderingStrokeAlignedRectForRect:(CGRect)a3 withStrokeWidth:(double)a4 alignToScreenUsingPageController:(id)a5 orAlignToContext:(CGContext *)a6 usingAnnotation:(id)a7
{
  objc_msgSend(a1, "_strokeAlignedRectForRect:withStrokeWidth:shouldAlignStrictlyToScreen:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 0, a5, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

+ (CGRect)renderingAlignedTextRectForRect:(CGRect)a3 alignToScreenUsingPageController:(id)a4 orAlignToContext:(CGContext *)a5 usingAnnotation:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a6;
  if (!v14
    || !+[AKGeometryHelper annotationHasRotation:v14 outAngle:0])
  {
    objc_msgSend(a1, "_alignedStableRectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:", 0, v13, a5, v14, x, y, width, height);
    double x = v15;
    double y = v16;
    double width = v17;
    double height = v18;
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (id)_rootLayer
{
  v2 = [(AKGeometryHelper *)self pageController];
  id v3 = [v2 layerPresentationManager];
  id v4 = [v3 rootLayer];

  return v4;
}

- (BOOL)_shouldAlignToContent
{
  v2 = [(AKGeometryHelper *)self pageController];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 shouldPixelate];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldAlignToScreen
{
  id v3 = [(AKGeometryHelper *)self pageController];
  if (v3)
  {
    if ([(AKGeometryHelper *)self _shouldAlignToContent])
    {
      [v3 currentModelToScreenScaleFactor];
      BOOL v5 = v4 <= 1.0;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (CGRect)_alignedStableRectForRect:(CGRect)a3 alignToContent:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToBitmapContext:(CGContext *)a6 usingAnnotation:(id)a7
{
  BOOL v9 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a7;
  id v16 = a5;
  double v17 = objc_opt_class();
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = sub_2376960C4;
  v30[3] = &unk_264CDB8E8;
  v30[4] = a1;
  objc_msgSend(v17, "_rectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:withAlignmentBlock:", v9, v16, a6, v15, v30, x, y, width, height);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

+ (CGRect)_strokeAlignedRectForRect:(CGRect)a3 withStrokeWidth:(double)a4 shouldAlignStrictlyToScreen:(BOOL)a5 alignToScreenUsingPageController:(id)a6 orAlignToBitmapContext:(CGContext *)a7 usingAnnotation:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = 0;
  if (v17 && !a5)
  {
    double v20 = [v17 geometryHelper];
    if ([v20 _shouldAlignToScreen]) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = [v20 _shouldAlignToContent];
    }
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_237696278;
  v33[3] = &unk_264CDB8E8;
  *(double *)&v33[4] = a4;
  objc_msgSend(a1, "_rectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:withAlignmentBlock:", v19, v17, a7, v18, v33, x, y, width, height);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = v22;
  double v30 = v24;
  double v31 = v26;
  double v32 = v28;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

+ (CGPoint)_alignedPointForPoint:(CGPoint)a3 alignToContent:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToBitmapContext:(CGContext *)a6 usingAnnotation:(id)a7
{
  BOOL v9 = a4;
  double y = a3.y;
  double x = a3.x;
  id v13 = a7;
  id v14 = a5;
  id v15 = objc_opt_class();
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_237696400;
  v22[3] = &unk_264CDB8E8;
  v22[4] = a1;
  objc_msgSend(v15, "_rectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:withAlignmentBlock:", v9, v14, a6, v13, v22, x, y, 0.0, 0.0);
  double v17 = v16;
  double v19 = v18;

  double v20 = v17;
  double v21 = v19;
  result.double y = v21;
  result.double x = v20;
  return result;
}

+ (CGRect)_rectForRect:(CGRect)a3 alignToContent:(BOOL)a4 alignToScreenUsingPageController:(id)a5 orAlignToBitmapContext:(CGContext *)a6 usingAnnotation:(id)a7 withAlignmentBlock:(id)a8
{
  BOOL v11 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a5;
  id v18 = a7;
  double v19 = (void (**)(void, double, double, double, double, __n128))a8;
  double v20 = v19;
  if (v11)
  {
    v98.origin.double x = ((double (*)(void (**)(void, double, double, double, double, __n128), double, double, double, double, double))v19[2])(v19, x, y, width, height, 1.0);
    CGRect v99 = CGRectStandardize(v98);
    double x = v99.origin.x;
    double y = v99.origin.y;
    double width = v99.size.width;
    double height = v99.size.height;
  }
  if (v17)
  {
    uint64_t v21 = [v17 overlayView];
    if (!v21)
    {
      NSLog(&cfstr_SAttemptingToA.isa, "+[AKGeometryHelper _rectForRect:alignToContent:alignToScreenUsingPageController:orAlignToBitmapContext:usingAnnotation:withAlignmentBlock:]");
      goto LABEL_18;
    }
    double v22 = (void *)v21;
    double v23 = *MEMORY[0x263F00148];
    double v24 = *(double *)(MEMORY[0x263F00148] + 8);
    objc_msgSend(v17, "convertRectFromModelToOverlay:", x, y, width, height);
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    objc_msgSend(v17, "convertPointFromModelToOverlay:", v23, v24);
    double v34 = v33;
    double v36 = v35;
    objc_msgSend(v17, "convertPointFromModelToOverlay:", 1.0, 1.0);
    double v38 = v37;
    double v40 = v39;
    CGRect v41 = [v22 superview];
    objc_msgSend(v22, "convertRect:toView:", v41, v26, v28, v30, v32);
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    objc_msgSend(v22, "convertPoint:toView:", v41, v34, v36);
    double v51 = v50;
    double v53 = v52;
    objc_msgSend(v22, "convertPoint:toView:", v41, v38, v40);
    double v55 = v54;
    double v57 = v56;
    v58 = [v41 window];
    v59 = [v58 screen];
    v60 = [v59 coordinateSpace];

    objc_msgSend(v41, "convertRect:toCoordinateSpace:", v60, v43, v45, v47, v49);
    double v62 = v61;
    double v64 = v63;
    double v66 = v65;
    double v68 = v67;
    objc_msgSend(v41, "convertPoint:toCoordinateSpace:", v60, v51, v53);
    double v70 = v69;
    double v72 = v71;
    objc_msgSend(v41, "convertPoint:toCoordinateSpace:", v60, v55, v57);
    double v75 = vabdd_f64(v74, v70);
    double v77 = vabdd_f64(v76, v72);
    if (v75 >= v77) {
      v73.n128_f64[0] = v75;
    }
    else {
      v73.n128_f64[0] = v77;
    }
    v20[2](v20, v62, v64, v66, v68, v73);
    objc_msgSend(v22, "convertRect:fromCoordinateSpace:", v60);
    objc_msgSend(v17, "convertRectFromOverlayToModel:");
    double x = v78;
    double y = v79;
    double width = v80;
    double height = v81;

    goto LABEL_16;
  }
  if (!a6)
  {
LABEL_16:
    v104.origin.double x = x;
    v104.origin.double y = y;
    v104.size.double width = width;
    v104.size.double height = height;
    CGRect v105 = CGRectStandardize(v104);
    double x = v105.origin.x;
    double y = v105.origin.y;
    double width = v105.size.width;
    double height = v105.size.height;
    goto LABEL_18;
  }
  if (CGContextGetType() == 4 && CGBitmapContextGetBitsPerPixel(a6))
  {
    [a1 effectiveDrawingBoundsForAnnotation:v18 forDisplay:0 pageControllerOrNil:0 outScaleFactor:0];
    double v83 = v82;
    double v85 = v84;
    v100.origin.double x = x - v82;
    v100.origin.double y = y - v84;
    v100.size.double width = width;
    v100.size.double height = height;
    CGRect v101 = CGContextConvertRectToDeviceSpace(a6, v100);
    double v86 = v101.origin.x;
    double v87 = v101.origin.y;
    double v88 = v101.size.width;
    double v89 = v101.size.height;
    v101.origin.double x = 1.0;
    v101.origin.double y = 1.0;
    CGSize v91 = CGContextConvertSizeToDeviceSpace(a6, (CGSize)v101.origin);
    double v92 = fabs(v91.width);
    double v93 = fabs(v91.height);
    if (v92 >= v93) {
      v90.n128_f64[0] = v92;
    }
    else {
      v90.n128_f64[0] = v93;
    }
    v102.origin.double x = ((double (*)(void, double, double, double, double, __n128))v20[2])(v20, v86, v87, v88, v89, v90);
    CGRect v103 = CGContextConvertRectToUserSpace(a6, v102);
    double width = v103.size.width;
    double height = v103.size.height;
    double x = v83 + v103.origin.x;
    double y = v85 + v103.origin.y;
    goto LABEL_16;
  }
LABEL_18:

  double v94 = x;
  double v95 = y;
  double v96 = width;
  double v97 = height;
  result.size.double height = v97;
  result.size.double width = v96;
  result.origin.double y = v95;
  result.origin.double x = v94;
  return result;
}

- (AKPageController)pageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);

  return (AKPageController *)WeakRetained;
}

- (void)setPageController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end