@interface AKStarAnnotationRenderer
+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5;
+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4;
+ (CGPath)_newPathForAnnotation:(id)a3;
+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3;
+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4;
+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5;
+ (double)_segLengthOfStarWithPoints:(id)a3;
+ (double)defaultInnerRadiusForStar:(id)a3;
+ (double)innerRadiusFactorForPoint:(CGPoint)a3 inAnnotation:(id)a4 onPageController:(id)a5;
+ (id)_innerStarPoints:(id)a3 withInnerRadiusFactor:(double)a4;
+ (id)innerStarPoints:(id)a3;
+ (id)starPoints:(id)a3;
+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6;
@end

@implementation AKStarAnnotationRenderer

+ (CGRect)_concreteDrawingBoundsOfAnnotation:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  objc_msgSendSuper2(&v7, sel__concreteDrawingBoundsOfAnnotation_, a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)_concreteTextBoundsOfAnnotation:(id)a3 withOptionalAnnotationRect:(CGRect)a4 optionalText:(id)a5
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  objc_msgSendSuper2(&v9, sel__concreteTextBoundsOfAnnotation_withOptionalAnnotationRect_optionalText_, a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

+ (CGRect)_concreteRectangleForAnnotation:(id)a3 withTextBounds:(CGRect)a4
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  objc_msgSendSuper2(&v8, sel__concreteRectangleForAnnotation_withTextBounds_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (void)_concreteRenderAnnotation:(id)a3 intoContext:(CGContext *)a4 forDisplay:(BOOL)a5 pageControllerOrNil:(id)a6
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  objc_msgSendSuper2(&v6, sel__concreteRenderAnnotation_intoContext_forDisplay_pageControllerOrNil_, a3, a4, a5, a6);
}

+ (BOOL)_concretePointIsOnBorder:(CGPoint)a3 ofAnnotation:(id)a4 minimumBorderThickness:(double)a5
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  return objc_msgSendSuper2(&v6, sel__concretePointIsOnBorder_ofAnnotation_minimumBorderThickness_, a4, a3.x, a3.y, a5);
}

+ (BOOL)_concretePointIsOnInside:(CGPoint)a3 ofAnnotation:(id)a4
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AKStarAnnotationRenderer;
  return objc_msgSendSuper2(&v5, sel__concretePointIsOnInside_ofAnnotation_, a4, a3.x, a3.y);
}

+ (double)defaultInnerRadiusForStar:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 pointCount];
  [v3 rectangle];
  objc_super v5 = +[AKGeometryHelper verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:](AKGeometryHelper, "verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:", v4, 0);
  objc_super v6 = [v5 objectAtIndex:0];
  [v6 akPointValue];
  double v8 = v7;
  double v10 = v9;

  v11 = [v5 objectAtIndex:1];
  [v11 akPointValue];
  double v13 = v12;
  double v15 = v14;

  v16 = [v5 objectAtIndex:2];
  [v16 akPointValue];
  double v18 = v17;
  double v20 = v19;

  double v21 = v10;
  double v22 = v8;
  if ((unint64_t)[v3 pointCount] >= 4)
  {
    v23 = [v5 objectAtIndex:3];
    [v23 akPointValue];
    double v22 = v24;
    double v21 = v25;
  }
  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v8, v10, v18, v20, v13, v15, v22, v21);
  double v27 = v26;
  double v29 = v28;
  [v3 rectangle];
  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:");
  [v3 rectangle];
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:");
  double v31 = hypot(v29 * 0.0 + 0.0 * v27 + 0.0, v29 * 0.0 + 0.0 * v27 + 0.0) / v30;

  return v31;
}

+ (double)innerRadiusFactorForPoint:(CGPoint)a3 inAnnotation:(id)a4 onPageController:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [a1 _innerStarPoints:v7 withInnerRadiusFactor:0.5];
  double v9 = [v8 lastObject];
  [v9 akPointValue];
  double v11 = v10;
  double v13 = v12;

  [v7 rectangle];
  CGFloat v14 = v40.origin.x;
  CGFloat v15 = v40.origin.y;
  CGFloat width = v40.size.width;
  CGFloat height = v40.size.height;
  double MidX = CGRectGetMidX(v40);
  v41.origin.double x = v14;
  v41.origin.double y = v15;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", [v7 originalExifOrientation]), v11, v13, MidX, CGRectGetMidY(v41));
  double v37 = v20;
  double v38 = v19;
  [v7 rectangle];
  +[AKGeometryHelper radiusOfCenteredCircleFor:](AKGeometryHelper, "radiusOfCenteredCircleFor:");
  double v22 = v21;
  [v7 rectangle];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  +[AKGeometryHelper ellipseToCenteredCircleTransform:](AKGeometryHelper, "ellipseToCenteredCircleTransform:", v24, v26, v28, v30);
  +[AKGeometryHelper normalizeVectorPoint:vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, v37), (float64x2_t)0, v38))];
  double v33 = (v31 * (y * 0.0 + 0.0 * x + 0.0) + (y * 0.0 + 0.0 * x + 0.0) * v32) / v22;
  double v34 = 1.0;
  if (v33 <= 1.0) {
    double v34 = v33;
  }
  BOOL v35 = v33 < 0.0;
  double result = 0.0;
  if (!v35) {
    return v34;
  }
  return result;
}

+ (id)starPoints:(id)a3
{
  id v3 = a3;
  [v3 rectangle];
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  double MidX = CGRectGetMidX(v20);
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", [v3 originalExifOrientation]), x, y, width, height, MidX, CGRectGetMidY(v21));
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [v3 pointCount];

  return +[AKGeometryHelper verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:](AKGeometryHelper, "verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:", v17, 0, v10, v12, v14, v16, 0.0);
}

+ (id)innerStarPoints:(id)a3
{
  id v4 = a3;
  [v4 innerRadiusFactor];
  objc_super v5 = objc_msgSend(a1, "_innerStarPoints:withInnerRadiusFactor:", v4);

  return v5;
}

+ (id)_innerStarPoints:(id)a3 withInnerRadiusFactor:(double)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 pointCount];
  [v5 rectangle];
  double x = v23.origin.x;
  double y = v23.origin.y;
  double width = v23.size.width;
  double height = v23.size.height;
  double MidX = CGRectGetMidX(v23);
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  double MidY = CGRectGetMidY(v24);
  uint64_t v13 = [v5 originalExifOrientation];

  +[AKGeometryHelper adjustRect:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustRect:forExifOrientation:aboutCenter:", +[AKGeometryHelper inverseExifOrientation:v13], x, y, width, height, MidX, MidY);
  CGFloat v14 = v25.origin.x;
  CGFloat v15 = v25.origin.y;
  CGFloat v16 = v25.size.width;
  CGFloat v17 = v25.size.height;
  double v18 = 1.0 - a4;
  CGFloat v19 = (1.0 - a4) * CGRectGetHeight(v25) * 0.5;
  v26.origin.double x = v14;
  v26.origin.double y = v15;
  v26.size.double width = v16;
  v26.size.double height = v17;
  CGFloat v20 = v18 * CGRectGetWidth(v26) * 0.5;
  v27.origin.double x = v14;
  v27.origin.double y = v15;
  v27.size.double width = v16;
  v27.size.double height = v17;
  CGRect v28 = CGRectInset(v27, v20, v19);

  return +[AKGeometryHelper verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:](AKGeometryHelper, "verticesOfPolygonWithPointCount:inRect:rotation:flippedVertically:", v6, 0, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height, (double)(0x168 / v6) * 0.5);
}

+ (double)_segLengthOfStarWithPoints:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectAtIndex:0];
  [v4 akPointValue];
  double v6 = v5;
  double v8 = v7;

  double v9 = [v3 objectAtIndex:2];
  [v9 akPointValue];
  double v11 = v10;
  double v13 = v12;

  CGFloat v14 = [v3 objectAtIndex:4];
  [v14 akPointValue];
  double v16 = v15;
  double v18 = v17;

  CGFloat v19 = [v3 objectAtIndex:1];

  [v19 akPointValue];
  double v21 = v20;
  double v23 = v22;

  +[AKGeometryHelper intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:](AKGeometryHelper, "intersectLineSegmentStartingAt:ending:withAnotherSegmentStartingAt:ending:", v6, v8, v11, v13, v16, v18, v21, v23);
  double v25 = v24 - v6;
  double v27 = v26 - v8;

  return hypot(v25, v27);
}

+ (CGPath)_newPathForAnnotation:(id)a3
{
  id v3 = a3;
  Mutable = CGPathCreateMutable();
  double v5 = +[AKStarAnnotationRenderer starPoints:v3];
  double v6 = +[AKStarAnnotationRenderer innerStarPoints:v3];
  [v3 rectangle];
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  double MidX = CGRectGetMidX(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v35);
  int64_t v13 = +[AKGeometryHelper inverseExifOrientation:](AKGeometryHelper, "inverseExifOrientation:", [v3 originalExifOrientation]);
  if ([v3 pointCount])
  {
    unint64_t v14 = 0;
    do
    {
      double v15 = [v5 objectAtIndex:v14];
      [v15 akPointValue];
      double v17 = v16;
      double v19 = v18;

      double v20 = [v6 objectAtIndex:v14];
      [v20 akPointValue];
      double v22 = v21;
      double v24 = v23;

      +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v13, v17, v19, MidX, MidY);
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v13, v22, v24, MidX, MidY);
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      if (v14) {
        CGPathAddLineToPoint(Mutable, 0, v26, v28);
      }
      else {
        CGPathMoveToPoint(Mutable, 0, v26, v28);
      }
      CGPathAddLineToPoint(Mutable, 0, v30, v32);
      ++v14;
    }
    while (v14 < [v3 pointCount]);
  }
  CGPathCloseSubpath(Mutable);

  return Mutable;
}

@end