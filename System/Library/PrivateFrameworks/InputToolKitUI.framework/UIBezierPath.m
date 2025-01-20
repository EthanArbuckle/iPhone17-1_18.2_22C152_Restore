@interface UIBezierPath
@end

@implementation UIBezierPath

__n128 __54__UIBezierPath_ITKUtilities__itk_lengthIgnoringCurves__block_invoke(void *a1, int *a2)
{
  int v3 = *a2;
  v4 = (double *)MEMORY[0x263F4BE40];
  *(_OWORD *)(*(void *)(a1[4] + 8) + 48) = *MEMORY[0x263F4BE40];
  if ((v3 - 2) >= 2)
  {
    if (v3 != 1)
    {
      if (v3) {
        goto LABEL_7;
      }
      *(_OWORD *)(*(void *)(a1[5] + 8) + 48) = *(_OWORD *)v4;
    }
    *(_OWORD *)(*(void *)(a1[4] + 8) + 48) = *(_OWORD *)*((void *)a2 + 1);
  }
  *(_OWORD *)(*(void *)(a1[4] + 8) + 48) = *(_OWORD *)*((void *)a2 + 1);
LABEL_7:
  uint64_t v5 = *(void *)(a1[5] + 8);
  double v6 = *v4;
  double v7 = v4[1];
  uint64_t v8 = *(void *)(a1[4] + 8);
  double v9 = *(double *)(v8 + 56);
  BOOL v10 = *(double *)(v8 + 48) == v6;
  BOOL v11 = v9 == v7 && v10;
  BOOL v12 = *(double *)(v5 + 56) == v7 && *(double *)(v5 + 48) == v6;
  if (!v12 && !v11)
  {
    ITKDistance();
    *(double *)(*(void *)(a1[6] + 8) + 24) = v13 + *(double *)(*(void *)(a1[6] + 8) + 24);
  }
  if (v11) {
    v14 = (__n128 *)MEMORY[0x263F4BE40];
  }
  else {
    v14 = (__n128 *)(*(void *)(a1[4] + 8) + 48);
  }
  __n128 result = *v14;
  *(__n128 *)(*(void *)(a1[5] + 8) + 48) = *v14;
  return result;
}

void __54__UIBezierPath_ITKUtilities__itk_allPointsFromCGPath___block_invoke(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0:
    case 1:
      int v3 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x263F08D40], "itk_valueWithPoint:", **(double **)(a2 + 8), *(double *)(*(void *)(a2 + 8) + 8));
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:");
      goto LABEL_4;
    case 2:
    case 3:
      v2 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x263F08D40], "itk_valueWithPoint:", *(double *)(*(void *)(a2 + 8) + 32), *(double *)(*(void *)(a2 + 8) + 40));
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:");
LABEL_4:

      break;
    default:
      return;
  }
}

uint64_t __57__UIBezierPath_ITKUtilities__itk_pathFromFlippingInRect___block_invoke(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = result;
  switch(*a2)
  {
    case 0:
      int v3 = *(void **)(result + 32);
      ITKFlipPoint();
      __n128 result = objc_msgSend(v3, "moveToPoint:");
      break;
    case 1:
      goto LABEL_6;
    case 2:
      [MEMORY[0x263F4BE58] handleFailedAssertWithCondition:"__objc_no" functionName:"-[UIBezierPath(ITKUtilities) itk_pathFromFlippingInRect:]_block_invoke" simulateCrash:0 showAlert:0 format:@"kCGPathElementAddQuadCurveToPoint not supported."];
LABEL_6:
      id v4 = *(void **)(v2 + 32);
      ITKFlipPoint();
      __n128 result = objc_msgSend(v4, "itk_addLineToPoint:");
      break;
    case 3:
      uint64_t v5 = *(void **)(result + 32);
      ITKFlipPoint();
      double v7 = v6;
      double v9 = v8;
      ITKFlipPoint();
      __n128 result = objc_msgSend(v5, "itk_addCurveToPoint:controlPoint1:controlPoint2:", v7, v9);
      break;
    case 4:
      BOOL v10 = *(void **)(result + 32);
      __n128 result = [v10 closePath];
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __57__UIBezierPath_ITKUtilities__itk_subpathArrayFromCGPath___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  switch(*(_DWORD *)a2)
  {
    case 0:
      id v4 = *(void **)(*(void *)(*(void *)(result + 40) + 8) + 40);
      uint64_t v5 = *(double **)(a2 + 8);
      double v6 = *v5;
      double v7 = v5[1];
      __n128 result = objc_msgSend(v4, "moveToPoint:", v6, v7);
      break;
    case 1:
      goto LABEL_6;
    case 2:
      [MEMORY[0x263F4BE58] handleFailedAssertWithCondition:"__objc_no" functionName:"+[UIBezierPath(ITKUtilities) itk_subpathArrayFromCGPath:]_block_invoke" simulateCrash:0 showAlert:0 format:@"kCGPathElementAddQuadCurveToPoint not supported."];
LABEL_6:
      double v8 = *(void **)(*(void *)(*(void *)(v3 + 40) + 8) + 40);
      double v9 = *(double **)(a2 + 8);
      double v10 = *v9;
      double v11 = v9[1];
      __n128 result = objc_msgSend(v8, "itk_addLineToPoint:", v10, v11);
      break;
    case 3:
      BOOL v12 = *(void **)(*(void *)(*(void *)(result + 40) + 8) + 40);
      double v13 = *(double **)(a2 + 8);
      double v14 = v13[4];
      double v15 = v13[5];
      double v16 = *v13;
      double v17 = v13[1];
      double v18 = v13[2];
      double v19 = v13[3];
      __n128 result = objc_msgSend(v12, "itk_addCurveToPoint:controlPoint1:controlPoint2:", v14, v15, v16, v17, v18, v19);
      break;
    case 4:
      [*(id *)(*(void *)(*(void *)(result + 40) + 8) + 40) closePath];
      [*(id *)(v3 + 32) addObject:*(void *)(*(void *)(*(void *)(v3 + 40) + 8) + 40)];
      *(void *)(*(void *)(*(void *)(v3 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x263F824C0]);
      __n128 result = MEMORY[0x270F9A758]();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __67__UIBezierPath_ITKUtilities__itk_groupAndRoundPaths_radius_offset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "itk_cgPathcontainsAnyCurveToPoints:", objc_msgSend(v3, "itk_CGPath"));

  return v4;
}

void __67__UIBezierPath_ITKUtilities__itk_groupAndRoundPaths_radius_offset___block_invoke_19(uint64_t a1, void *a2)
{
}

void __67__UIBezierPath_ITKUtilities__itk_groupAndRoundPaths_radius_offset___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 40), "itk_allPointsFromCGPath:", objc_msgSend(v10, "itk_CGPath"));
  uint64_t v4 = [v3 lastObject];
  uint64_t v5 = [v3 firstObject];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    [v3 removeLastObject];
  }
  double v7 = (const CGPath *)objc_msgSend(*(id *)(a1 + 40), "itk_newRoundedPathWithRadius:points:", v3, *(double *)(a1 + 48));
  double v8 = *(void **)(a1 + 32);
  double v9 = objc_msgSend(MEMORY[0x263F824C0], "itk_pathFromCGPath:", v7);
  objc_msgSend(v8, "itk_appendBezierPath:", v9);

  CGPathRelease(v7);
}

uint64_t __65__UIBezierPath_ITKUtilities__itk_cgPathcontainsAnyCurveToPoints___block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 & 0xFFFFFFFE) == 2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void __67__UIBezierPath_ITKUtilities___processPointsForRounding_withRadius___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v12 = v6;
  if (!a3)
  {
    uint64_t v7 = a1 + 32;
    goto LABEL_7;
  }
  objc_msgSend(v6, "itk_pointValue");
  uint64_t v7 = a1 + 32;
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "itk_pointValue");
  if (!ITKNearlyEqualPointsWithThreshold())
  {
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)v7 + 8) + 40), a2);
    goto LABEL_8;
  }
  double v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v8)
  {
    uint64_t v9 = [MEMORY[0x263F089C8] indexSet];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    double v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  [v8 addIndex:a3];
LABEL_8:
}

void __125__UIBezierPath_ITKUtilities__itk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "quadMultipliedBySize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");
}

void __125__UIBezierPath_ITKUtilities__itk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 sideLength];
  id v3 = [v2 path];
  ITKClipperPathsFromCGPath(v3, 1.0);
}

void __125__UIBezierPath_ITKUtilities__itk_roundAndGroupNormalizedQuadsForHighlight_aspectRatio_expansionScale_radiusToAvgHeightRatio___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 48), "itk_allPointsFromCGPath:", objc_msgSend(v11, "itk_CGPath"));
  uint64_t v4 = [v3 lastObject];
  uint64_t v5 = [v3 firstObject];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    [v3 removeLastObject];
  }
  uint64_t v7 = [*(id *)(a1 + 32) objectForKey:v11];
  [*(id *)(a1 + 48) radiusForQuads:v7 radiusRatio:*(double *)(a1 + 56)];
  double v8 = (const CGPath *)objc_msgSend(*(id *)(a1 + 48), "itk_newRoundedPathWithRadius:points:", v3);
  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = objc_msgSend(MEMORY[0x263F824C0], "itk_pathFromCGPath:", v8);
  objc_msgSend(v9, "itk_appendBezierPath:", v10);

  CGPathRelease(v8);
}

void __47__UIBezierPath_ITKUtilities__mapPaths_toQuads___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "copy", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v8 vertexCentroid];
        if (objc_msgSend(v3, "containsPoint:"))
        {
          id v9 = [*(id *)(a1 + 40) objectForKey:v3];
          if (!v9)
          {
            id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:");
          }
          [v9 addObject:v8];
          [*(id *)(a1 + 32) removeObject:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

@end