@interface UIBezierPath(ITKUtilities)
+ (CGPath)_cgPathFromClipperPath:()ITKUtilities;
+ (CGPath)itk_newRoundedPathWithRadius:()ITKUtilities points:;
+ (double)itk_clampedRadius:()ITKUtilities p1:p2:p3:;
+ (double)itk_projectPoint:()ITKUtilities lineStart:lineEnd:;
+ (double)radiusForQuads:()ITKUtilities radiusRatio:;
+ (id)itk_allPointsFromCGPath:()ITKUtilities;
+ (id)itk_groupAndRoundPaths:()ITKUtilities radius:offset:;
+ (id)itk_shiftLinePerpendicularlyFromPoint:()ITKUtilities to:radius:;
+ (id)itk_subpathArrayFromCGPath:()ITKUtilities;
+ (id)mapPaths:()ITKUtilities toQuads:;
+ (uint64_t)itk_cgPathcontainsAnyCurveToPoints:()ITKUtilities;
+ (uint64_t)itk_signForRadiusWithVectorStart:()ITKUtilities end:otherPoint:;
+ (void)_processPointsForNarrowAngles:()ITKUtilities;
+ (void)_processPointsForRounding:()ITKUtilities withRadius:;
+ (void)itk_calculateCenterForPoints:()ITKUtilities p2:p3:radius:;
+ (void)itk_roundAndGroupNormalizedQuadsForHighlight:()ITKUtilities aspectRatio:expansionScale:radiusToAvgHeightRatio:;
- (double)itk_centroid;
- (double)itk_lengthIgnoringCurves;
- (id)_itk_flattenWithPath:()ITKUtilities clipType:;
- (id)debugQuickLookObject;
- (id)itk_expandWithOffset:()ITKUtilities;
- (id)itk_intersectAndFlattenWithPath:()ITKUtilities;
- (id)itk_pathByFittingToRect:()ITKUtilities;
- (id)itk_pathFromFlippingInRect:()ITKUtilities;
- (id)itk_unionAndFlattenWithPath:()ITKUtilities;
- (uint64_t)itk_CGPath;
- (uint64_t)itk_allPoints;
- (uint64_t)itk_applyTransform:()ITKUtilities;
- (uint64_t)itk_subpathArray;
- (void)itk_appendBezierPath:()ITKUtilities;
- (void)itk_appendRect:()ITKUtilities;
@end

@implementation UIBezierPath(ITKUtilities)

- (uint64_t)itk_CGPath
{
  id v1 = a1;
  return [v1 CGPath];
}

- (void)itk_appendRect:()ITKUtilities
{
  +[ITKQuad quadFromCGRect:](ITKQuad, "quadFromCGRect:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v3 path];
  objc_msgSend(a1, "itk_appendBezierPath:", v2);
}

- (void)itk_appendBezierPath:()ITKUtilities
{
  id v4 = a3;
  if (v4 && ([v4 isEmpty] & 1) == 0) {
    [a1 appendPath:v4];
  }
}

- (double)itk_centroid
{
  id v1 = objc_msgSend(a1, "itk_allPoints");
  unint64_t v2 = [v1 count];
  unint64_t v3 = v2;
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  if (v2 >= 3)
  {
    uint64_t v6 = 0;
    unint64_t v7 = v2 - 1;
    double v8 = 0.0;
    do
    {
      v9 = [v1 objectAtIndexedSubscript:v6];
      objc_msgSend(v9, "itk_pointValue");
      double v11 = v10;
      double v13 = v12;

      if (v7 == v6) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = v6 + 1;
      }
      v15 = [v1 objectAtIndexedSubscript:v14];
      objc_msgSend(v15, "itk_pointValue");
      double v17 = v16;
      double v19 = v18;
      ++v6;

      ITKCrossPoints();
      double v4 = v4 + (v11 + v17) * v20;
      double v5 = v5 + (v13 + v19) * v20;
      double v8 = v8 + v20 * 0.5;
    }
    while (v3 != v6);
    ITKMultiplyPointScalar();
    if (v21 >= 0.0) {
      double v4 = v21;
    }
    else {
      double v4 = -v21;
    }
  }

  return v4;
}

- (double)itk_lengthIgnoringCurves
{
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x4012000000;
  v7[3] = __Block_byref_object_copy_;
  v7[4] = __Block_byref_object_dispose_;
  v7[5] = &unk_252AA2929;
  long long v8 = *MEMORY[0x263F4BE40];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x4012000000;
  v5[3] = __Block_byref_object_copy_;
  v5[4] = __Block_byref_object_dispose_;
  v5[5] = &unk_252AA2929;
  long long v6 = *MEMORY[0x263F4BE40];
  id v1 = (const CGPath *)objc_msgSend(a1, "itk_CGPath");
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__UIBezierPath_ITKUtilities__itk_lengthIgnoringCurves__block_invoke;
  block[3] = &unk_26538DF18;
  block[4] = v5;
  block[5] = v7;
  block[6] = &v9;
  CGPathApplyWithBlock(v1, block);
  double v2 = v10[3];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v9, 8);
  return v2;
}

- (uint64_t)itk_allPoints
{
  double v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(a1, "itk_CGPath");
  return objc_msgSend(v2, "itk_allPointsFromCGPath:", v3);
}

+ (id)itk_allPointsFromCGPath:()ITKUtilities
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__UIBezierPath_ITKUtilities__itk_allPointsFromCGPath___block_invoke;
  block[3] = &unk_26538DF40;
  id v5 = v4;
  id v8 = v5;
  CGPathApplyWithBlock(a3, block);

  return v5;
}

- (uint64_t)itk_applyTransform:()ITKUtilities
{
  long long v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return [a1 applyTransform:v5];
}

- (id)itk_pathFromFlippingInRect:()ITKUtilities
{
  id v10 = objc_alloc_init(MEMORY[0x263F824C0]);
  uint64_t v11 = (const CGPath *)objc_msgSend(a1, "itk_CGPath");
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__UIBezierPath_ITKUtilities__itk_pathFromFlippingInRect___block_invoke;
  block[3] = &unk_26538DF68;
  id v12 = v10;
  id v15 = v12;
  double v16 = a2;
  double v17 = a3;
  double v18 = a4;
  double v19 = a5;
  CGPathApplyWithBlock(v11, block);

  return v12;
}

- (id)debugQuickLookObject
{
  id v1 = a1;
  [v1 bounds];
  if (v2 >= 2.0)
  {
    [v1 bounds];
    CGFloat v3 = 20.0;
    if (v7 >= 20.0) {
      goto LABEL_6;
    }
    id v4 = v9;
    id v5 = (CGAffineTransform *)v9;
    CGFloat v6 = 20.0;
  }
  else
  {
    CGFloat v3 = 150.0;
    id v4 = v10;
    id v5 = (CGAffineTransform *)v10;
    CGFloat v6 = 150.0;
  }
  CGAffineTransformMakeScale(v5, v3, v6);
  objc_msgSend(v1, "itk_applyTransform:", v4);
LABEL_6:
  return v1;
}

- (uint64_t)itk_subpathArray
{
  double v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(a1, "itk_CGPath");
  return objc_msgSend(v2, "itk_subpathArrayFromCGPath:", v3);
}

+ (id)itk_subpathArrayFromCGPath:()ITKUtilities
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__8;
  v12[4] = __Block_byref_object_dispose__9;
  id v13 = objc_alloc_init(MEMORY[0x263F824C0]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__UIBezierPath_ITKUtilities__itk_subpathArrayFromCGPath___block_invoke;
  v9[3] = &unk_26538DF90;
  uint64_t v11 = v12;
  id v5 = v4;
  id v10 = v5;
  CGPathApplyWithBlock(a3, v9);
  CGFloat v6 = v10;
  id v7 = v5;

  _Block_object_dispose(v12, 8);
  return v7;
}

- (id)itk_pathByFittingToRect:()ITKUtilities
{
  [a1 bounds];
  ITKCenterOfRect();
  double v3 = v2;
  double v5 = v4;
  ITKCenterOfRect();
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  ITKSizeRatioFromSizes();
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformMakeTranslation(&v22, -v3, -v5);
  CGAffineTransform t1 = v22;
  CGAffineTransformMakeScale(&t2, v11, v13);
  CGAffineTransformConcat(&v21, &t1, &t2);
  CGAffineTransform v22 = v21;
  CGAffineTransform v18 = v21;
  CGAffineTransformMakeTranslation(&v17, v7, v9);
  CGAffineTransformConcat(&v21, &v18, &v17);
  CGAffineTransform v22 = v21;
  uint64_t v14 = (void *)[a1 copy];
  CGAffineTransform v16 = v22;
  objc_msgSend(v14, "itk_applyTransform:", &v16);
  [v14 bounds];
  if ((ITKNearlyEqualRects() & 1) == 0) {
    objc_msgSend(MEMORY[0x263F4BE58], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "ITKNearlyEqualRects(endBounds, result.bounds)", "-[UIBezierPath(ITKUtilities) itk_pathByFittingToRect:]", 0, 0, @"path itk_transformToFitRect did not give a correct result");
  }
  return v14;
}

- (id)itk_unionAndFlattenWithPath:()ITKUtilities
{
  id v4 = a3;
  double v5 = v4;
  if (v4 && ([v4 isEmpty] & 1) == 0)
  {
    double v6 = objc_msgSend(a1, "_itk_flattenWithPath:clipType:", v5, 1);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)itk_intersectAndFlattenWithPath:()ITKUtilities
{
  id v4 = a3;
  double v5 = v4;
  if (v4 && ([v4 isEmpty] & 1) == 0)
  {
    double v6 = objc_msgSend(a1, "_itk_flattenWithPath:clipType:", v5, 0);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_itk_flattenWithPath:()ITKUtilities clipType:
{
  id v4 = a3;
  memset(v19, 0, sizeof(v19));
  ClipperLib::Clipper::Clipper((ClipperLib::Clipper *)&v10, 0);
  id v5 = a1;
  if (v4 && ([v4 isEmpty] & 1) == 0)
  {
    memset(&v9, 0, sizeof(v9));
    CGAffineTransformMakeScale(&v9, 10000.0, 10000.0);
    if (([v5 isEmpty] & 1) == 0)
    {
      double v6 = (const CGPath *)MEMORY[0x2533C74B0](objc_msgSend(v5, "itk_CGPath"), &v9);
      ITKClipperPathsFromCGPath(v6, 1.0);
    }
    CGFloat v7 = (const CGPath *)MEMORY[0x2533C74B0](objc_msgSend(v4, "itk_CGPath"), &v9);
    ITKClipperPathsFromCGPath(v7, 1.0);
  }
  std::__list_imp<long long>::clear(v17);
  if (__p)
  {
    CGAffineTransform v16 = __p;
    operator delete(__p);
  }
  if (v13)
  {
    uint64_t v14 = v13;
    operator delete(v13);
  }
  if (v11)
  {
    double v12 = v11;
    operator delete(v11);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v18);
  double v10 = (void **)v19;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v10);

  return v5;
}

- (id)itk_expandWithOffset:()ITKUtilities
{
  id v1 = (const CGPath *)objc_msgSend(a1, "itk_CGPath");
  if ((objc_msgSend((id)objc_opt_class(), "itk_cgPathcontainsAnyCurveToPoints:", v1) & 1) == 0) {
    ITKClipperPathsFromCGPath(v1, 1.0);
  }
  return 0;
}

+ (id)itk_groupAndRoundPaths:()ITKUtilities radius:offset:
{
  id v4 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__UIBezierPath_ITKUtilities__itk_groupAndRoundPaths_radius_offset___block_invoke;
  v16[3] = &__block_descriptor_40_e29_B32__0__UIBezierPath_8Q16_B24l;
  v16[4] = a1;
  if ((objc_msgSend(v4, "itk_containsObjectPassingTest:", v16) & 1) == 0)
  {
    memset(v15, 0, sizeof(v15));
    uint64_t v8 = 0;
    CGAffineTransform v9 = &v8;
    uint64_t v10 = 0x15012000000;
    CGFloat v11 = __Block_byref_object_copy__16;
    double v12 = __Block_byref_object_dispose__17;
    CGFloat v13 = &unk_252AA2929;
    double v5 = ClipperLib::Clipper::Clipper((ClipperLib::Clipper *)&v14, 0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__UIBezierPath_ITKUtilities__itk_groupAndRoundPaths_radius_offset___block_invoke_19;
    v7[3] = &unk_26538DFD8;
    v7[4] = &v8;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7, v5);
    ClipperLib::Clipper::Execute((uint64_t)(v9 + 6), 1, v15, 0);
    operator new();
  }

  return 0;
}

+ (uint64_t)itk_cgPathcontainsAnyCurveToPoints:()ITKUtilities
{
  uint64_t v6 = 0;
  CGFloat v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__UIBezierPath_ITKUtilities__itk_cgPathcontainsAnyCurveToPoints___block_invoke;
  block[3] = &unk_26538E028;
  void block[4] = &v6;
  CGPathApplyWithBlock(path, block);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (CGPath)_cgPathFromClipperPath:()ITKUtilities
{
  Mutable = CGPathCreateMutable();
  uint64_t v6 = *a3;
  double v5 = a3[1];
  while (v6 != v5)
  {
    CGFloat v7 = *v6;
    uint64_t v8 = v6[1];
    if (*v6 != v8)
    {
      char v9 = 1;
      do
      {
        if (v9) {
          CGPathMoveToPoint(Mutable, 0, (double)**v6, (double)(*v6)[1]);
        }
        else {
          CGPathAddLineToPoint(Mutable, 0, (double)*v7, (double)v7[1]);
        }
        char v9 = 0;
        v7 += 3;
      }
      while (v7 != v8);
    }
    CGPathCloseSubpath(Mutable);
    v6 += 3;
  }
  return Mutable;
}

+ (CGPath)itk_newRoundedPathWithRadius:()ITKUtilities points:
{
  id v6 = a4;
  CGFloat v7 = (void *)[v6 mutableCopy];
  [a1 _processPointsForRounding:v7 withRadius:a2];
  [a1 _processPointsForNarrowAngles:v7];
  id v8 = v7;

  Mutable = CGPathCreateMutable();
  unint64_t v10 = 0;
  double v52 = a2;
  while (objc_msgSend(v8, "count", *(void *)&v52) > v10)
  {
    CGFloat v11 = [v8 objectAtIndex:v10];
    objc_msgSend(v11, "itk_pointValue");
    double v13 = v12;
    double v15 = v14;

    CGAffineTransform v16 = objc_msgSend(v8, "objectAtIndex:", (v10 + 1) % objc_msgSend(v8, "count"));
    objc_msgSend(v16, "itk_pointValue");
    double v18 = v17;
    double v20 = v19;

    CGAffineTransform v21 = objc_msgSend(v8, "objectAtIndex:", (v10 + 2) % objc_msgSend(v8, "count"));
    objc_msgSend(v21, "itk_pointValue");
    double v57 = v22;
    double v24 = v23;

    v25 = objc_msgSend(v8, "objectAtIndex:", (v10 + 3) % objc_msgSend(v8, "count"));
    objc_msgSend(v25, "itk_pointValue");
    double v55 = v27;
    double v56 = v26;

    double v28 = v13;
    objc_msgSend(MEMORY[0x263F824C0], "itk_clampedRadius:p1:p2:p3:", a2, v13, v15, v18, v20, v57, v24);
    double v30 = v29;
    objc_msgSend(MEMORY[0x263F824C0], "itk_clampedRadius:p1:p2:p3:", a2, v18, v20, v57, v24, v56, v55);
    double v32 = v31;
    CGFloat radius = fmin(v30, v31);
    objc_msgSend(MEMORY[0x263F824C0], "itk_calculateCenterForPoints:p2:p3:radius:", v28, v15, v18, v20, v57, v24);
    double v34 = v33;
    double v36 = v35;
    objc_msgSend(MEMORY[0x263F824C0], "itk_projectPoint:lineStart:lineEnd:");
    CGFloat x = v37;
    CGFloat v39 = v38;
    objc_msgSend(MEMORY[0x263F824C0], "itk_projectPoint:lineStart:lineEnd:", v34, v36, v18, v20, v57, v24);
    if (!v10) {
      CGPathMoveToPoint(Mutable, 0, x, v39);
    }
    objc_msgSend(MEMORY[0x263F824C0], "itk_calculateCenterForPoints:p2:p3:radius:", v18, v20, v57, v24, v56, v55, v32);
    objc_msgSend(MEMORY[0x263F824C0], "itk_projectPoint:lineStart:lineEnd:");
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    ITKAngleBetweenPoints();
    CGFloat v45 = v44;
    ITKAngleBetweenPoints();
    CGFloat v47 = v46;
    ITKNormalizeAngleInRadians();
    double v49 = v48;
    ITKNormalizeAngleInRadians();
    CGPathAddArc(Mutable, 0, v34, v36, radius, v45, v47, v49 >= v50);
    a2 = v52;
    ++v10;
    CGPathAddLineToPoint(Mutable, 0, v41, v43);
  }
  CGPathCloseSubpath(Mutable);

  return Mutable;
}

+ (void)_processPointsForNarrowAngles:()ITKUtilities
{
  id v25 = a3;
  for (unint64_t i = 0; [v25 count] > i; ++i)
  {
    unint64_t v4 = [v25 count];
    unint64_t v5 = [v25 count];
    id v6 = [v25 objectAtIndex:i];
    objc_msgSend(v6, "itk_pointValue");
    double v8 = v7;
    double v10 = v9;
    unint64_t v11 = (i + 1) % v4;

    double v12 = [v25 objectAtIndex:v11];
    objc_msgSend(v12, "itk_pointValue");
    double v14 = v13;
    double v16 = v15;

    double v17 = [v25 objectAtIndex:(i + 2) % v5];
    objc_msgSend(v17, "itk_pointValue");
    double v19 = v18;
    double v21 = v20;

    ITKAngleBetweenPoints();
    double v23 = fabs(v22);
    if (v23 < 0.785398163 || v23 > 5.49778714)
    {
      objc_msgSend(MEMORY[0x263F824C0], "itk_projectPoint:lineStart:lineEnd:", v8, v10, v14, v16, v19, v21);
      double v24 = objc_msgSend(MEMORY[0x263F08D40], "itk_valueWithPoint:");
      [v25 setObject:v24 atIndexedSubscript:v11];
    }
  }
}

+ (void)_processPointsForRounding:()ITKUtilities withRadius:
{
  id v5 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__8;
  v17[4] = __Block_byref_object_dispose__9;
  id v18 = 0;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = __Block_byref_object_copy__8;
  double v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  id v6 = (void *)[v5 copy];
  v10[1] = 3221225472;
  v10[0] = MEMORY[0x263EF8330];
  v10[2] = __67__UIBezierPath_ITKUtilities___processPointsForRounding_withRadius___block_invoke;
  v10[3] = &unk_26538E050;
  *(double *)&v10[6] = a1 / 3.0;
  v10[4] = v17;
  v10[5] = &v11;
  [v6 enumerateObjectsUsingBlock:v10];

  if (v12[5]) {
    objc_msgSend(v5, "removeObjectsAtIndexes:");
  }
  double v7 = [v5 firstObject];
  objc_msgSend(v7, "itk_pointValue");
  double v8 = [v5 lastObject];
  objc_msgSend(v8, "itk_pointValue");
  int v9 = ITKNearlyEqualPointsWithThreshold();

  if (v9) {
    [v5 removeLastObject];
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
}

+ (id)itk_shiftLinePerpendicularlyFromPoint:()ITKUtilities to:radius:
{
  id v8 = objc_alloc_init(MEMORY[0x263F4BE70]);
  if (a1 != a3 && a2 != a4)
  {
    ITKSlopeOfLine();
    long double v10 = atan(fabs(v9));
    cos(v10);
  }
  ITKAddPoints();
  objc_msgSend(v8, "setStartPoint:");
  ITKAddPoints();
  objc_msgSend(v8, "setEndPoint:");
  return v8;
}

+ (double)itk_clampedRadius:()ITKUtilities p1:p2:p3:
{
  return fmin(fmin(fmin(a1, fmax(vabdd_f64(a2, a4), vabdd_f64(a3, a5)) * 0.5), fmax(vabdd_f64(a2, a6), vabdd_f64(a3, a7)) * 0.5), fmax(vabdd_f64(a4, a6), vabdd_f64(a5, a7)) * 0.5);
}

+ (uint64_t)itk_signForRadiusWithVectorStart:()ITKUtilities end:otherPoint:
{
  if (a1 != a3) {
    return ITKSlopeOfLine();
  }
  return result;
}

+ (void)itk_calculateCenterForPoints:()ITKUtilities p2:p3:radius:
{
  objc_msgSend(a1, "itk_signForRadiusWithVectorStart:end:otherPoint:");
  id v16 = objc_msgSend(MEMORY[0x263F824C0], "itk_shiftLinePerpendicularlyFromPoint:to:radius:", a2, a3, a4, a5, v15 * a8);
  objc_msgSend(MEMORY[0x263F824C0], "itk_signForRadiusWithVectorStart:end:otherPoint:", a6, a7, a4, a5, a2, a3);
  id v18 = objc_msgSend(MEMORY[0x263F824C0], "itk_shiftLinePerpendicularlyFromPoint:to:radius:", a6, a7, a4, a5, v17 * a8);
  [v16 startPoint];
  [v16 endPoint];
  [v18 startPoint];
  [v18 endPoint];
  ITKIntersectionOfLines();
}

+ (double)itk_projectPoint:()ITKUtilities lineStart:lineEnd:
{
  double v6 = a3;
  long long v15 = *MEMORY[0x263F00148];
  if (a3 != a5)
  {
    if (a4 == a6)
    {
      return a1;
    }
    else
    {
      ITKSlopeOfLine();
      double v11 = v10;
      id v12 = objc_alloc_init(MEMORY[0x263F4BE68]);
      [v12 setA:v11];
      [v12 setB:a4 - v11 * v6];
      id v13 = objc_alloc_init(MEMORY[0x263F4BE68]);
      [v13 setA:-1.0 / v11];
      [v13 setB:a2 + 1.0 / v11 * a1];
      ITKIntersectsLine();

      return *(double *)&v15;
    }
  }
  return v6;
}

+ (void)itk_roundAndGroupNormalizedQuadsForHighlight:()ITKUtilities aspectRatio:expansionScale:radiusToAvgHeightRatio:
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F824C0]);
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x13812000000;
  v6[3] = __Block_byref_object_copy__25;
  v6[4] = __Block_byref_object_dispose__26;
  v6[5] = &unk_252AA2929;
  ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)&v7, 2.0, 0.25);
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  _OWORD v5[3] = 0;
  operator new();
}

+ (double)radiusForQuads:()ITKUtilities radiusRatio:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  unint64_t v6 = [v5 count];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "sideLength", (void)v14);
        double v10 = v10 + v12;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10 / (double)v6 * a1;
}

+ (id)mapPaths:()ITKUtilities toQuads:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v6];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__UIBezierPath_ITKUtilities__mapPaths_toQuads___block_invoke;
  v14[3] = &unk_26538E0F0;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = v8;
  [v5 enumerateObjectsUsingBlock:v14];
  double v11 = v16;
  id v12 = v9;

  return v12;
}

@end