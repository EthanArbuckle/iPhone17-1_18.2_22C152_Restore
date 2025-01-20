@interface AX
@end

@implementation AX

uint64_t __AX_CGPathEnumerateElementsUsingBlock_block_invoke(uint64_t result, int *a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
  int v4 = *(unsigned __int8 *)(v2 + 24);
  uint64_t v3 = v2 + 24;
  if (!v4)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)(result + 32);
    uint64_t v8 = *a2;
    if (v8 > 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_18D430458[v8];
    }
    result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, void, uint64_t))(v7 + 16))(v7, v8, *((void *)a2 + 1), v9, *(void *)(*(void *)(*(void *)(v6 + 48) + 8) + 24), v3);
    ++*(void *)(*(void *)(*(void *)(v6 + 48) + 8) + 24);
  }
  return result;
}

__n128 __AX_CGPathGetIntersectionPointWithRect_block_invoke(uint64_t a1, uint64_t a2, __n128 *a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (!a5)
  {
    __n128 result = *a3;
    *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = *a3;
    *a6 = 1;
  }
  return result;
}

uint64_t __AX_CGPathGetNumberOfElements_block_invoke(uint64_t result)
{
  return result;
}

__n128 __AX_CGPathGetStartingAndEndingPoints_block_invoke(uint64_t a1, uint64_t a2, __n128 *a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    if (a5) {
      uint64_t v5 = *(void *)(a1 + 40);
    }
    else {
      uint64_t v5 = *(void *)(a1 + 32);
    }
    __n128 result = *a3;
    *(__n128 *)(*(void *)(v5 + 8) + 32) = *a3;
  }
  return result;
}

uint64_t __AX_CGPathGetPointForElementAtIndex_block_invoke(uint64_t result, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (*(void *)(result + 40) == a5)
  {
    if (a4) {
      *(_OWORD *)(*(void *)(*(void *)(result + 32) + 8) + 32) = *a3;
    }
    *a6 = 1;
  }
  return result;
}

void __AX_CGCreatePathPathWithUniformInset_block_invoke(double *a1, unsigned int a2, double *a3)
{
  if (a2 >= 4)
  {
    if (a2 == 4)
    {
      v14 = (CGPath *)*((void *)a1 + 7);
      CGPathCloseSubpath(v14);
    }
  }
  else
  {
    double v7 = a1[5];
    double v6 = a1[6];
    double v8 = a1[4];
    double v9 = AX_CGPointInset(*a3, a3[1], v8, v7, v6);
    CGFloat v11 = v9;
    CGFloat v12 = v10;
    switch(a2)
    {
      case 0u:
        v13 = (CGPath *)*((void *)a1 + 7);
        CGPathMoveToPoint(v13, 0, v9, v10);
        break;
      case 1u:
        v15 = (CGPath *)*((void *)a1 + 7);
        CGPathAddLineToPoint(v15, 0, v9, v10);
        break;
      case 2u:
        double v17 = AX_CGPointInset(a3[2], a3[3], v8, v7, v6);
        v18 = (CGPath *)*((void *)a1 + 7);
        CGPathAddQuadCurveToPoint(v18, 0, v11, v12, v17, v16);
        break;
      case 3u:
        double v19 = AX_CGPointInset(a3[2], a3[3], v8, v7, v6);
        CGFloat v21 = v20;
        double v23 = AX_CGPointInset(a3[4], a3[5], v8, v7, v6);
        v24 = (CGPath *)*((void *)a1 + 7);
        CGPathAddCurveToPoint(v24, 0, v11, v12, v19, v21, v23, v22);
        break;
      default:
        return;
    }
  }
}

uint64_t __AX_CGPathGetDescription_block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (a2 > 4) {
    double v7 = @"Unhandled path element type";
  }
  else {
    double v7 = off_1E5587760[a2];
  }
  uint64_t result = [*(id *)(a1 + 32) appendFormat:@"%@\n", v7];
  if (a4)
  {
    double v9 = (void *)(a3 + 8);
    do
    {
      uint64_t result = [*(id *)(a1 + 32) appendFormat:@"\t%f, %f\n", *(v9 - 1), *v9];
      v9 += 2;
      --a4;
    }
    while (a4);
  }
  return result;
}

__n128 ___AX_CGPathGetIntersectionPointWithOtherPathNonExhaustive_block_invoke(uint64_t a1, uint64_t a2, __n128 *a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 32);
  }
  __n128 result = *a3;
  *(__n128 *)(*(void *)(v5 + 8) + 32) = *a3;
  return result;
}

__n128 ___AX_CGPathGetIntersectionPointWithOtherPathNonExhaustive_block_invoke_2(uint64_t a1, uint64_t a2, __n128 *a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 32);
  }
  __n128 result = *a3;
  *(__n128 *)(*(void *)(v5 + 8) + 32) = *a3;
  return result;
}

__n128 ___AX_CGPathGetIntersectionPointWithOtherPathExhaustive_block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (a5)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3010000000;
    v17[3] = &unk_18D441ED1;
    long long v18 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(const CGPath **)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ___AX_CGPathGetIntersectionPointWithOtherPathExhaustive_block_invoke_2;
    v13[3] = &unk_1E5587718;
    v13[4] = v17;
    long long v14 = *(_OWORD *)(a1 + 32);
    v15 = a3;
    CGFloat v16 = a6;
    AX_CGPathEnumerateElementsUsingBlock(v9, v13);
    *(_OWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = *a3;
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(double *)(v10 + 32) != 1.79769313e308 || *(double *)(v10 + 40) != 1.79769313e308) {
      *a6 = 1;
    }
    _Block_object_dispose(v17, 8);
  }
  else
  {
    __n128 result = *(__n128 *)a3;
    *(_OWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = *a3;
  }
  return result;
}

__n128 ___AX_CGPathGetIntersectionPointWithOtherPathExhaustive_block_invoke_2(uint64_t a1, uint64_t a2, double *a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    uint64_t v7 = a1 + 32;
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    double v9 = *(double **)(a1 + 56);
    double v10 = *(double *)(v8 + 32);
    double v11 = *(double *)(v8 + 40);
    double v12 = v9[1];
    if (v10 >= *v9) {
      double v13 = *v9;
    }
    else {
      double v13 = *(double *)(v8 + 32);
    }
    if (v11 >= v12) {
      uint64_t v14 = *((void *)v9 + 1);
    }
    else {
      uint64_t v14 = *(void *)(v8 + 40);
    }
    double v15 = fmax(vabdd_f64(v10, *v9), 1.0);
    double v16 = fmax(vabdd_f64(v11, v12), 1.0);
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
    double v18 = *(double *)(v17 + 32);
    double v19 = *(double *)(v17 + 40);
    double v20 = a3[1];
    if (v18 >= *a3) {
      double Center = *a3;
    }
    else {
      double Center = *(double *)(v17 + 32);
    }
    if (v19 >= v20) {
      double v22 = a3[1];
    }
    else {
      double v22 = *(double *)(v17 + 40);
    }
    double v23 = fmax(vabdd_f64(v18, *a3), 1.0);
    double v24 = fmax(vabdd_f64(v19, v20), 1.0);
    v48.origin.CGFloat x = Center;
    v48.origin.CGFloat y = v22;
    v48.size.CGFloat width = v23;
    v48.size.CGFloat height = v24;
    CGRect v41 = CGRectIntersection(*(CGRect *)&v13, v48);
    if (v41.size.width > 0.0)
    {
      CGFloat height = v41.size.height;
      if (v41.size.height != 0.0)
      {
        CGFloat x = v41.origin.x;
        CGFloat width = v41.size.width;
        uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8);
        v29 = *(double **)(a1 + 56);
        double v30 = *(double *)(v28 + 32);
        double v31 = v29[1];
        double v32 = fmax(vabdd_f64(v30, *v29), 0.001);
        double v33 = v30 - *v29;
        if (v32 + -0.001 <= 0.000001) {
          double v33 = v32;
        }
        if (vabdd_f64(v41.origin.x, Center) >= 0.001)
        {
          CGFloat y = v41.origin.y;
          double v40 = (*(double *)(v28 + 40) - v31) / v33;
          v42.origin.CGFloat x = Center;
          v42.origin.CGFloat y = v22;
          v42.size.CGFloat width = v23;
          v42.size.CGFloat height = v24;
          if (vabdd_f64(x, CGRectGetMaxX(v42)) >= 0.001)
          {
            if (vabdd_f64(y, v22) >= 0.001)
            {
              v45.origin.CGFloat x = Center;
              v45.origin.CGFloat y = v22;
              v45.size.CGFloat width = v23;
              v45.size.CGFloat height = v24;
              if (vabdd_f64(y, CGRectGetMaxY(v45)) >= 0.001)
              {
                double Center = AX_CGRectGetCenter(x, y, width, height);
                double MaxY = v36;
              }
              else
              {
                v46.origin.CGFloat x = Center;
                v46.origin.CGFloat y = v22;
                v46.size.CGFloat width = v23;
                v46.size.CGFloat height = v24;
                double v35 = **(double **)(a1 + 56) + (CGRectGetMaxY(v46) - *(double *)(*(void *)(a1 + 56) + 8)) / v40;
                v47.origin.CGFloat x = Center;
                v47.origin.CGFloat y = v22;
                v47.size.CGFloat width = v23;
                v47.size.CGFloat height = v24;
                double MaxY = CGRectGetMaxY(v47);
                double Center = v35;
              }
            }
            else
            {
              double Center = **(double **)(a1 + 56) + (v22 - *(double *)(*(void *)(a1 + 56) + 8)) / v40;
              double MaxY = v22;
            }
          }
          else
          {
            v43.origin.CGFloat x = Center;
            v43.origin.CGFloat y = v22;
            v43.size.CGFloat width = v23;
            v43.size.CGFloat height = v24;
            double MaxY = *(double *)(*(void *)(a1 + 56) + 8) + v40 * (CGRectGetMaxX(v43) - **(double **)(a1 + 56));
            v44.origin.CGFloat x = Center;
            v44.origin.CGFloat y = v22;
            v44.size.CGFloat width = v23;
            v44.size.CGFloat height = v24;
            double Center = CGRectGetMaxX(v44);
          }
        }
        else
        {
          double MaxY = v31 + (*(double *)(v28 + 40) - v31) / v33 * (Center - *v29);
        }
        uint64_t v37 = *(void *)(*(void *)(a1 + 48) + 8);
        *(double *)(v37 + 32) = Center;
        *(double *)(v37 + 40) = MaxY;
        **(unsigned char **)(a1 + 64) = 1;
      }
    }
  }
  else
  {
    uint64_t v7 = a1 + 32;
  }
  __n128 result = *(__n128 *)a3;
  *(_OWORD *)(*(void *)(*(void *)v7 + 8) + 32) = *(_OWORD *)a3;
  return result;
}

@end