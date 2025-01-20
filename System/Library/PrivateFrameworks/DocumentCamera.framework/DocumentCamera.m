uint64_t DCDebugInterfaceEnabled()
{
  return 0;
}

void sub_2178879F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21788E9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21789087C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217890A58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_2178924BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2178942B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_217894654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __UIAccessibilityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIAccessibilityLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

double DCTSDOffsetForEdgeOfFrame(int a1, double a2, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0:
      double result = CGRectGetMinX(*(CGRect *)&a2);
      break;
    case 1:
      double result = CGRectGetMidX(*(CGRect *)&a2);
      break;
    case 2:
      double result = CGRectGetMaxX(*(CGRect *)&a2);
      break;
    case 3:
      double result = CGRectGetMinY(*(CGRect *)&a2);
      break;
    case 4:
      double result = CGRectGetMidY(*(CGRect *)&a2);
      break;
    case 5:
      double result = CGRectGetMaxY(*(CGRect *)&a2);
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

double DCTSDRectWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

double DCTSDRectWithPoints(double a1, double a2, double a3)
{
  if (a1 >= a3) {
    return a3;
  }
  else {
    return a1;
  }
}

double DCTSDRectWithSize()
{
  return 0.0;
}

double DCTSDRectWithSizeAlignedToRect(int a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v17.size.height = a4;
  v17.size.double width = a3;
  v17.origin.double x = 0.0;
  v17.origin.y = 0.0;
  CGRect v18 = CGRectStandardize(v17);
  double x = v18.origin.x;
  double width = v18.size.width;
  v18.origin.double x = a5;
  v18.origin.y = a6;
  v18.size.double width = a7;
  v18.size.height = a8;
  if (!CGRectIsNull(v18))
  {
    switch(a1)
    {
      case 3:
        v20.origin.double x = a5;
        v20.origin.y = a6;
        v20.size.double width = a7;
        v20.size.height = a8;
        double x = CGRectGetMaxX(v20) - width;
        break;
      case 2:
        v21.origin.double x = a5;
        v21.origin.y = a6;
        v21.size.double width = a7;
        v21.size.height = a8;
        double x = CGRectGetMidX(v21) + width * -0.5;
        break;
      case 1:
        v19.origin.double x = a5;
        v19.origin.y = a6;
        v19.size.double width = a7;
        v19.size.height = a8;
        double x = CGRectGetMinX(v19);
        break;
    }
    switch(a2)
    {
      case 3:
        v23.origin.double x = a5;
        v23.origin.y = a6;
        v23.size.double width = a7;
        v23.size.height = a8;
        CGRectGetMaxY(v23);
        break;
      case 2:
        v24.origin.double x = a5;
        v24.origin.y = a6;
        v24.size.double width = a7;
        v24.size.height = a8;
        CGRectGetMidY(v24);
        break;
      case 1:
        v22.origin.double x = a5;
        v22.origin.y = a6;
        v22.size.double width = a7;
        v22.size.height = a8;
        CGRectGetMinY(v22);
        break;
    }
  }
  return x;
}

BOOL DCTSDNearlyEqualPoints(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.01;
  return vabdd_f64(a2, a4) < 0.01 && v4;
}

BOOL DCTSDNearlyEqualTransforms(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) < 0.000000001
      && vabdd_f64(a1[1], a2[1]) < 0.000000001
      && vabdd_f64(a1[2], a2[2]) < 0.000000001
      && vabdd_f64(a1[3], a2[3]) < 0.000000001
      && vabdd_f64(a1[4], a2[4]) < 0.000000001
      && vabdd_f64(a1[5], a2[5]) < 0.000000001;
}

BOOL DCTSDNearlyEqualRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL result = 0;
  if (vabdd_f64(a1, a5) < 0.01 && vabdd_f64(a2, a6) < 0.01)
  {
    BOOL v9 = vabdd_f64(a3, a7) < 0.01;
    return vabdd_f64(a4, a8) < 0.01 && v9;
  }
  return result;
}

BOOL DCTSDNearlyContainsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v18 = CGRectInset(*(CGRect *)&a1, -0.01, -0.01);
  double v12 = a5;
  double v13 = a6;
  double v14 = a7;
  double v15 = a8;

  return CGRectContainsRect(v18, *(CGRect *)&v12);
}

BOOL DCTSDCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return fabs((a3 - a1) * (a6 - a2) - (a4 - a2) * (a5 - a1)) < 8.90029543e-308;
}

BOOL DCTSDNearlyCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 - a1;
  return (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) * (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) < ((a4 - a2) * (a4 - a2)
                                                                                              + v6 * v6)
                                                                                             * 0.0001
                                                                                             * ((a6 - a2) * (a6 - a2)
                                                                                              + (a5 - a1) * (a5 - a1));
}

double DCTSDDistanceSquared(double a1, double a2, double a3, double a4)
{
  return (a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3);
}

BOOL DCTSDRectsOverlapVertically(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v22.origin.double x = a5;
  v22.origin.y = a6;
  v22.size.double width = a7;
  v22.size.height = a8;
  double v16 = CGRectGetMinX(v22);
  v23.origin.double x = a1;
  v23.origin.y = a2;
  v23.size.double width = a3;
  v23.size.height = a4;
  double MaxX = CGRectGetMaxX(v23);
  v24.origin.double x = a5;
  v24.origin.y = a6;
  v24.size.double width = a7;
  v24.size.height = a8;
  double v18 = CGRectGetMaxX(v24);
  if (MinX <= v16) {
    return MaxX >= v16;
  }
  else {
    return v18 >= MinX;
  }
}

BOOL DCTSDRectsOverlapHorizontally(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinY = CGRectGetMinY(*(CGRect *)&a1);
  v22.origin.double x = a5;
  v22.origin.y = a6;
  v22.size.double width = a7;
  v22.size.height = a8;
  double v16 = CGRectGetMinY(v22);
  v23.origin.double x = a1;
  v23.origin.y = a2;
  v23.size.double width = a3;
  v23.size.height = a4;
  double MaxY = CGRectGetMaxY(v23);
  v24.origin.double x = a5;
  v24.origin.y = a6;
  v24.size.double width = a7;
  v24.size.height = a8;
  double v18 = CGRectGetMaxY(v24);
  if (MinY <= v16) {
    return MaxY >= v16;
  }
  else {
    return v18 >= MinY;
  }
}

uint64_t DCTSDLineIntersectsRect(CGFloat a1, CGFloat a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v12 = a4;
  double v13 = a3;
  while (1)
  {
    uint64_t v16 = p_ComputeOutcode(a1, a2, a5, a6, a7, a8);
    uint64_t v17 = p_ComputeOutcode(v13, v12, a5, a6, a7, a8);
    uint64_t result = 1;
    if (!v16 || !v17) {
      break;
    }
    if ((v17 & v16) != 0) {
      return 0;
    }
    double v19 = (v13 + a1) * 0.5;
    double v20 = (v12 + a2) * 0.5;
    int v21 = DCTSDLineIntersectsRect(1, a1, a2, v19, v20, a5, a6, a7, a8);
    a1 = v19;
    a2 = v20;
    double v13 = a3;
    double v12 = a4;
    if (v21) {
      return 1;
    }
  }
  return result;
}

uint64_t p_ComputeOutcode(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v14.origin.double x = a3;
  v14.origin.y = a4;
  v14.size.double width = a5;
  v14.size.height = a6;
  if (a2 <= CGRectGetMaxY(v14))
  {
    v15.origin.double x = a3;
    v15.origin.y = a4;
    v15.size.double width = a5;
    v15.size.height = a6;
    if (a2 < CGRectGetMinY(v15)) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }
  v16.origin.double x = a3;
  v16.origin.y = a4;
  v16.size.double width = a5;
  v16.size.height = a6;
  if (a1 > CGRectGetMaxX(v16)) {
    return v12 | 4;
  }
  v17.origin.double x = a3;
  v17.origin.y = a4;
  v17.size.double width = a5;
  v17.size.height = a6;
  if (a1 < CGRectGetMinX(v17)) {
    return v12 | 8;
  }
  else {
    return v12;
  }
}

double DCTSDAveragePoints(double a1, double a2, double a3)
{
  return (a1 + a3) * 0.5;
}

double DCTSDNearestPointOnInfiniteLineToPoint(double *a1, double a2, double a3)
{
  double v3 = a1[1];
  double v4 = a1[2] - *a1;
  double v5 = a1[3] - v3;
  double v6 = 1.0 / sqrt(v5 * v5 + v4 * v4);
  return *a1 + v4 * v6 * ((a3 - v3) * (v5 * v6) + (a2 - *a1) * (v4 * v6));
}

double DCTSDNormalizePoint(double a1, double a2)
{
  return a1 * (1.0 / sqrt(a2 * a2 + a1 * a1));
}

double DCTSDSubtractPoints(double a1, double a2, double a3)
{
  return a1 - a3;
}

double DCTSDDotPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double DCTSDAddPoints(double a1, double a2, double a3)
{
  return a1 + a3;
}

double DCTSDMultiplyPointScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

BOOL DCTSDSizeIsEmpty(double a1, double a2)
{
  return a2 == 0.0 || a1 == 0.0;
}

double DCTSDSizeWithMaxArea(double result, double a2, double a3, double a4)
{
  if (result * a2 <= a3 * a4) {
    return a3;
  }
  return result;
}

double DCTSDUnionRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v8 = a7 <= 0.0;
  if (a8 > 0.0) {
    BOOL v8 = 0;
  }
  if (a3 > 0.0 || a4 > 0.0)
  {
    if (v8)
    {
      return a1;
    }
    else if (a1 < a5)
    {
      return a1;
    }
  }
  else if (v8)
  {
    return *MEMORY[0x263F001A8];
  }
  return a5;
}

double DCTSDHorizontalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v31.origin.double x = a5;
  v31.origin.y = a6;
  v31.size.double width = a7;
  CGFloat v24 = a7;
  v31.size.height = a8;
  double v29 = fmax(MinX, CGRectGetMinX(v31));
  v32.origin.double x = a1;
  v32.origin.y = a2;
  v32.size.double width = a3;
  v32.size.height = a4;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.double x = a5;
  v33.origin.y = a6;
  v33.size.double width = a7;
  v33.size.height = a8;
  double v27 = fmin(MaxX, CGRectGetMaxX(v33));
  v34.origin.double x = a1;
  v34.origin.y = a2;
  v34.size.double width = a3;
  v34.size.height = a4;
  double MaxY = CGRectGetMaxY(v34);
  v35.origin.double x = a5;
  v35.origin.y = a6;
  v35.size.double width = v24;
  v35.size.height = a8;
  double v16 = fmin(MaxY, CGRectGetMaxY(v35));
  v36.origin.double x = a1;
  v36.origin.y = a2;
  v36.size.double width = a3;
  v36.size.height = a4;
  double MinY = CGRectGetMinY(v36);
  v37.origin.double x = a5;
  v37.origin.y = a6;
  v37.size.double width = v24;
  v37.size.height = a8;
  double v18 = fmax(MinY, CGRectGetMinY(v37));
  double v19 = v29;
  double v21 = v18 - v16;
  double v22 = v16;

  double v20 = v27 - v29;
  *(void *)&double result = (unint64_t)CGRectStandardize(*(CGRect *)&v19);
  return result;
}

double DCTSDVerticalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v31.origin.double x = a5;
  v31.origin.y = a6;
  v31.size.double width = a7;
  CGFloat v24 = a7;
  v31.size.height = a8;
  double v29 = fmin(MaxX, CGRectGetMaxX(v31));
  v32.origin.double x = a1;
  v32.origin.y = a2;
  v32.size.double width = a3;
  v32.size.height = a4;
  double MinX = CGRectGetMinX(v32);
  v33.origin.double x = a5;
  v33.origin.y = a6;
  v33.size.double width = a7;
  v33.size.height = a8;
  double v27 = fmax(MinX, CGRectGetMinX(v33));
  v34.origin.double x = a1;
  v34.origin.y = a2;
  v34.size.double width = a3;
  v34.size.height = a4;
  double MinY = CGRectGetMinY(v34);
  v35.origin.double x = a5;
  v35.origin.y = a6;
  v35.size.double width = v24;
  v35.size.height = a8;
  double v16 = fmax(MinY, CGRectGetMinY(v35));
  v36.origin.double x = a1;
  v36.origin.y = a2;
  v36.size.double width = a3;
  v36.size.height = a4;
  double MaxY = CGRectGetMaxY(v36);
  v37.origin.double x = a5;
  v37.origin.y = a6;
  v37.size.double width = v24;
  v37.size.height = a8;
  double v18 = fmin(MaxY, CGRectGetMaxY(v37));
  double v19 = v29;
  double v21 = v18 - v16;
  double v22 = v16;

  double v20 = v27 - v29;
  *(void *)&double result = (unint64_t)CGRectStandardize(*(CGRect *)&v19);
  return result;
}

BOOL DCTSDIntersectsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (a1 < a5) {
    BOOL result = a1 + a3 > a5;
  }
  else {
    BOOL result = a5 + a7 > a1;
  }
  if (a2 >= a6)
  {
    if (a6 + a8 > a2) {
      return result;
    }
    return 0;
  }
  if (a2 + a4 <= a6) {
    return 0;
  }
  return result;
}

BOOL DCTSDPointInRectInclusive(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 + a5;
  return a1 >= a3 && a1 <= v6 && a2 >= a4 && a2 <= a4 + a6;
}

double DCTSDMultiplyPointBySize(double a1, double a2, double a3)
{
  return a1 * a3;
}

double DCTSDMultiplyRectScalar(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v9 = a1;
  if (!CGRectIsInfinite(*(CGRect *)&a1))
  {
    v11.origin.double x = v9;
    v11.origin.y = a2;
    v11.size.double width = a3;
    v11.size.height = a4;
    if (!CGRectIsNull(v11)) {
      return v9 * a5;
    }
  }
  return v9;
}

double DCTSDFlooredPoint(double a1)
{
  return floor(a1);
}

double DCTSDPointLength(double a1, double a2)
{
  return sqrt(a2 * a2 + a1 * a1);
}

double DCTSDPointSquaredLength(double a1, double a2)
{
  return a2 * a2 + a1 * a1;
}

double DCTSDDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double DCTSDOrthogonalDistance(double a1, double a2, double a3, double a4)
{
  double v4 = a1 - a3;
  if (v4 < 0.0) {
    double v4 = -v4;
  }
  double v5 = a2 - a4;
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  return v4 + v5;
}

void DCTSDDistanceToRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v16.origin.double x = a3;
  v16.origin.y = a4;
  v16.size.double width = a5;
  v16.size.height = a6;
  if (a1 < CGRectGetMinX(v16))
  {
    v17.origin.double x = a3;
    v17.origin.y = a4;
    v17.size.double width = a5;
    v17.size.height = a6;
    if (a2 < CGRectGetMinY(v17))
    {
      v18.origin.double x = a3;
      v18.origin.y = a4;
      v18.size.double width = a5;
      v18.size.height = a6;
      CGRectGetMinX(v18);
LABEL_7:
      v22.origin.double x = a3;
      v22.origin.y = a4;
      v22.size.double width = a5;
      v22.size.height = a6;
      CGRectGetMinY(v22);
      return;
    }
    v23.origin.double x = a3;
    v23.origin.y = a4;
    v23.size.double width = a5;
    v23.size.height = a6;
    double MaxY = CGRectGetMaxY(v23);
    v24.origin.double x = a3;
    v24.origin.y = a4;
    v24.size.double width = a5;
    v24.size.height = a6;
    CGRectGetMinX(v24);
    if (a2 <= MaxY) {
      return;
    }
LABEL_13:
    v28.origin.double x = a3;
    v28.origin.y = a4;
    v28.size.double width = a5;
    v28.size.height = a6;
    CGRectGetMaxY(v28);
    return;
  }
  v19.origin.double x = a3;
  v19.origin.y = a4;
  v19.size.double width = a5;
  v19.size.height = a6;
  double MaxX = CGRectGetMaxX(v19);
  v20.origin.double x = a3;
  v20.origin.y = a4;
  v20.size.double width = a5;
  v20.size.height = a6;
  double MinY = CGRectGetMinY(v20);
  if (a1 <= MaxX)
  {
    if (a2 >= MinY)
    {
      v29.origin.double x = a3;
      v29.origin.y = a4;
      v29.size.double width = a5;
      v29.size.height = a6;
      if (a2 > CGRectGetMaxY(v29))
      {
        v30.origin.double x = a3;
        v30.origin.y = a4;
        v30.size.double width = a5;
        v30.size.height = a6;
        CGRectGetMaxY(v30);
      }
    }
    else
    {
      v25.origin.double x = a3;
      v25.origin.y = a4;
      v25.size.double width = a5;
      v25.size.height = a6;
      CGRectGetMinY(v25);
    }
    return;
  }
  if (a2 < MinY)
  {
    v21.origin.double x = a3;
    v21.origin.y = a4;
    v21.size.double width = a5;
    v21.size.height = a6;
    CGRectGetMaxX(v21);
    goto LABEL_7;
  }
  v26.origin.double x = a3;
  v26.origin.y = a4;
  v26.size.double width = a5;
  v26.size.height = a6;
  double v15 = CGRectGetMaxY(v26);
  v27.origin.double x = a3;
  v27.origin.y = a4;
  v27.size.double width = a5;
  v27.size.height = a6;
  CGRectGetMaxX(v27);
  if (a2 > v15) {
    goto LABEL_13;
  }
}

double DCTSDDistanceToRectFromRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v23.origin.double x = a1;
  v23.origin.y = a2;
  v23.size.double width = a3;
  v23.size.height = a4;
  double MidY = CGRectGetMidY(v23);
  double v16 = DCTSUClamp(MidX, a5, a5 + a7);
  double v17 = DCTSUClamp(MidY, a6, a6 + a8);
  double v18 = DCTSUClamp(v16, a1, a1 + a3);
  double v19 = DCTSUClamp(v17, a2, a2 + a4);
  return sqrt((v17 - v19) * (v17 - v19) + (v16 - v18) * (v16 - v18));
}

double DCTSDClampPointInRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v9 = DCTSUClamp(a1, a3, a3 + a5);
  DCTSUClamp(a2, a4, a4 + a6);
  return v9;
}

double DCTSDCenterOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.y = a2;
  v10.size.double width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

BOOL DCTSDPercentRectInsideRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v9 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  return CGRectEqualToRect(v9, *MEMORY[0x263F001A0]);
}

double DCTSDRectGetMaxPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.y = a2;
  v10.size.double width = a3;
  v10.size.height = a4;
  CGRectGetMaxY(v10);
  return MaxX;
}

double DCTSDComplexMultiplyPoint(double a1, double a2, double a3, double a4)
{
  return a1 * a3 - a2 * a4;
}

double DCTSDCrossPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a3 - a1 * a4;
}

double DCTSDGrowRectToPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v13.origin.double x = a1;
    v13.origin.y = a2;
    v13.size.double width = a3;
    v13.size.height = a4;
    double MinX = CGRectGetMinX(v13);
    if (MinX >= a5) {
      double v11 = a5;
    }
    else {
      double v11 = MinX;
    }
    v14.origin.double x = a1;
    v14.origin.y = a2;
    v14.size.double width = a3;
    v14.size.height = a4;
    CGRectGetMaxX(v14);
    v15.origin.double x = a1;
    v15.origin.y = a2;
    v15.size.double width = a3;
    v15.size.height = a4;
    CGRectGetMinY(v15);
    v16.origin.double x = a1;
    v16.origin.y = a2;
    v16.size.double width = a3;
    v16.size.height = a4;
    CGRectGetMaxY(v16);
    return v11;
  }
  return a5;
}

double DCTSDFlipRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRectGetMidY(*(CGRect *)&a1);
  v14.origin.double x = a5;
  v14.origin.y = a6;
  v14.size.double width = a7;
  v14.size.height = a8;
  CGRectGetMidY(v14);
  return a1;
}

double DCTSDCenterRectOverRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v26.origin.double x = a5;
  v26.origin.y = a6;
  v26.size.double width = a7;
  v26.size.height = a8;
  double MidX = CGRectGetMidX(v26);
  v27.origin.double x = a5;
  v27.origin.y = a6;
  v27.size.double width = a7;
  v27.size.height = a8;
  double MidY = CGRectGetMidY(v27);
  v28.origin.double x = a1;
  v28.origin.y = a2;
  v28.size.double width = a3;
  v28.size.height = a4;
  double v17 = CGRectGetMidX(v28);
  v29.origin.double x = a1;
  v29.origin.y = a2;
  v29.size.double width = a3;
  v29.size.height = a4;
  double v18 = MidY - CGRectGetMidY(v29);
  CGFloat v19 = a1;
  CGFloat v20 = a2;
  CGFloat v21 = a3;
  CGFloat v22 = a4;

  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v19, MidX - v17, v18);
  return result;
}

BOOL DCTSDRectIsFinite(double a1, double a2, double a3, double a4)
{
  BOOL result = 0;
  if (fabs(a1) != INFINITY && fabs(a2) != INFINITY && fabs(a3) != INFINITY)
  {
    double v5 = fabs(a4);
    return v5 > INFINITY || v5 < INFINITY;
  }
  return result;
}

void DCTSDRectDivide(CGRect *a1, CGRect *a2, CGRectEdge a3, double a4, double a5, double a6, double a7, CGFloat a8)
{
  memset(v8, 0, sizeof(v8));
  if (!a1) {
    a1 = (CGRect *)v8;
  }
  if (!a2) {
    a2 = (CGRect *)v8;
  }
  CGRectDivide(*(CGRect *)&a4, a1, a2, a8, a3);
}

uint64_t DCTSDGetCanvasSpaceCorners(uint64_t a1, _OWORD *a2, _OWORD *a3, _OWORD *a4, _OWORD *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  v53[2] = *(double *)MEMORY[0x263EF8340];
  long long v18 = *(_OWORD *)(a1 + 16);
  float64x2_t v46 = *(float64x2_t *)a1;
  long long v47 = v18;
  long long v48 = *(_OWORD *)(a1 + 32);
  DCTSDTransformedCornersOfRect(&v46, &v49, &v51, &v52, v53, a6, a7, a8, a9);
  v54.origin.double x = a6;
  v54.origin.y = a7;
  v54.size.double width = a8;
  v54.size.height = a9;
  double MidX = CGRectGetMidX(v54);
  v55.origin.double x = a6;
  v55.origin.y = a7;
  v55.size.double width = a8;
  v55.size.height = a9;
  CGFloat MidY = CGRectGetMidY(v55);
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  double v23 = *(double *)(a1 + 32) + MidY * *(double *)(a1 + 16) + *(double *)a1 * MidX;
  double v24 = 1000000.0;
  double v25 = *(double *)(a1 + 40) + MidY * *(double *)(a1 + 24) + *(double *)(a1 + 8) * MidX;
  CGRect v26 = (double *)&v50;
  do
  {
    long double v27 = atan2(*v26 - v25, *(v26 - 1) - v23);
    double v28 = fmod(v27 * 57.2957795, 360.0);
    if (v28 < 0.0) {
      double v28 = v28 + 360.0;
    }
    if (v28 == 0.0) {
      double v29 = 225.0;
    }
    else {
      double v29 = 360.0 - v28 + -135.0;
    }
    double v30 = fabs(v29);
    if (v30 < v24)
    {
      uint64_t v21 = v22;
      double v24 = v30;
    }
    ++v22;
    v26 += 2;
  }
  while (v22 != 4);
  *a2 = *((_OWORD *)&v49 + v21);
  uint64_t v31 = (v21 + 2) & 3;
  if (v21 + 2 <= 0) {
    uint64_t v31 = -(-(v21 + 2) & 3);
  }
  *a4 = *((_OWORD *)&v49 + v31);
  long long v32 = *(_OWORD *)(a1 + 16);
  float64x2_t v46 = *(float64x2_t *)a1;
  long long v47 = v32;
  long long v48 = *(_OWORD *)(a1 + 32);
  BOOL v33 = DCTSDIsTransformFlipped(v46.f64);
  uint64_t v34 = v21 + 3;
  if (v33) {
    uint64_t v35 = v21 + 1;
  }
  else {
    uint64_t v35 = v21 + 3;
  }
  uint64_t v36 = v35 & 3;
  if (!v33) {
    uint64_t v34 = v21 + 1;
  }
  uint64_t v38 = -v35;
  BOOL v37 = v38 < 0;
  uint64_t v39 = v38 & 3;
  if (v37) {
    uint64_t v40 = v36;
  }
  else {
    uint64_t v40 = -v39;
  }
  *a5 = *((_OWORD *)&v49 + v40);
  uint64_t v41 = v34 & 3;
  uint64_t v42 = -v34;
  BOOL v37 = v42 < 0;
  uint64_t v43 = v42 & 3;
  if (v37) {
    uint64_t v44 = v41;
  }
  else {
    uint64_t v44 = -v43;
  }
  *a3 = *((_OWORD *)&v49 + v44);
  return v21;
}

double DCTSDAngleFromDelta(long double a1, long double a2)
{
  return atan2(a2, a1);
}

void DCTSDNormalizeAngleInDegrees(long double a1)
{
}

double DCTSDInterpolatePoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

uint64_t DCTSDMixBOOLs(uint64_t result, unsigned int a2, double a3)
{
  if (a3 > 0.5) {
    return a2;
  }
  else {
    return result;
  }
}

double DCTSDMixFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

void DCTSDMixAnglesInDegrees(long double a1, long double a2, double a3)
{
  double v5 = fmod(a1, 360.0);
  if (v5 < 0.0) {
    double v5 = v5 + 360.0;
  }
  if (v5 == 0.0) {
    double v6 = 0.0;
  }
  else {
    double v6 = v5;
  }
  double v7 = fmod(a2, 360.0);
  if (v7 < 0.0) {
    double v7 = v7 + 360.0;
  }
  if (v7 == 0.0) {
    double v7 = 0.0;
  }
  if (vabdd_f64(v7, v6) > 180.0)
  {
    if (v6 <= v7) {
      double v7 = v7 + -360.0;
    }
    else {
      double v7 = v7 + 360.0;
    }
  }
  fmod(v7 * a3 + v6 * (1.0 - a3), 360.0);
}

double DCTSDMixAnglesInRadians(double a1, double a2, double a3)
{
  DCTSDMixAnglesInDegrees(a1 * 57.2957795, a2 * 57.2957795, a3);
  return v3 * 0.0174532925;
}

double DCTSDMixRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 * a9 + a1 * (1.0 - a9);
}

double DCTSDSizeWithMaxSize(double result, double a2, double a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

double DCTSDClipRectToMaxY(double a1, double a2, double a3, double a4)
{
  return a1;
}

double DCTSDClipRectToMinY(double a1, double a2, double a3, double a4)
{
  return a1;
}

double DCTSDTranslatedRectMaximizingOverlapWithRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v36.origin.double x = a5;
  v36.origin.y = a6;
  v36.size.double width = a7;
  v36.size.height = a8;
  double MaxX = CGRectGetMaxX(v36);
  double v34 = a1;
  v37.origin.double x = a1;
  v37.origin.y = a2;
  v37.size.double width = a3;
  v37.size.height = a4;
  if (MaxX > CGRectGetMaxX(v37))
  {
    v38.origin.double x = a5;
    v38.origin.y = a6;
    v38.size.double width = a7;
    v38.size.height = a8;
    double MinX = CGRectGetMinX(v38);
    v39.origin.double x = a1;
    v39.origin.y = a2;
    v39.size.double width = a3;
    v39.size.height = a4;
    if (MinX > CGRectGetMinX(v39))
    {
      v40.origin.double x = a5;
      v40.origin.y = a6;
      v40.size.double width = a7;
      v40.size.height = a8;
      double v29 = CGRectGetMaxX(v40);
      v41.origin.double x = a1;
      v41.origin.y = a2;
      v41.size.double width = a3;
      v41.size.height = a4;
      double v30 = v29 - CGRectGetMaxX(v41);
      v42.origin.double x = a5;
      v42.origin.y = a6;
      v42.size.double width = a7;
      v42.size.height = a8;
      double v28 = CGRectGetMinX(v42);
      v43.origin.double x = a1;
      v43.origin.y = a2;
      v43.size.double width = a3;
      v43.size.height = a4;
      double v17 = v28 - CGRectGetMinX(v43);
      if (v30 < v17) {
        double v17 = v30;
      }
      double v18 = a1 + v17;
LABEL_11:
      double v34 = v18;
      goto LABEL_12;
    }
  }
  v44.origin.double x = a5;
  v44.origin.y = a6;
  v44.size.double width = a7;
  v44.size.height = a8;
  double v19 = CGRectGetMinX(v44);
  v45.origin.double x = a1;
  v45.origin.y = a2;
  v45.size.double width = a3;
  v45.size.height = a4;
  if (v19 < CGRectGetMinX(v45))
  {
    v46.origin.double x = a5;
    v46.origin.y = a6;
    v46.size.double width = a7;
    v46.size.height = a8;
    double v20 = CGRectGetMaxX(v46);
    v47.origin.double x = a1;
    v47.origin.y = a2;
    v47.size.double width = a3;
    v47.size.height = a4;
    if (v20 < CGRectGetMaxX(v47))
    {
      v48.origin.double x = a1;
      v48.origin.y = a2;
      v48.size.double width = a3;
      v48.size.height = a4;
      double v31 = CGRectGetMinX(v48);
      v49.origin.double x = a5;
      v49.origin.y = a6;
      v49.size.double width = a7;
      v49.size.height = a8;
      double v32 = v31 - CGRectGetMinX(v49);
      v50.origin.double x = a1;
      v50.origin.y = a2;
      v50.size.double width = a3;
      v50.size.height = a4;
      double v21 = CGRectGetMaxX(v50);
      v51.origin.double x = a5;
      v51.origin.y = a6;
      v51.size.double width = a7;
      v51.size.height = a8;
      double v22 = v21 - CGRectGetMaxX(v51);
      if (v32 < v22) {
        double v22 = v32;
      }
      double v18 = a1 - v22;
      goto LABEL_11;
    }
  }
LABEL_12:
  v52.origin.double x = a5;
  v52.origin.y = a6;
  v52.size.double width = a7;
  v52.size.height = a8;
  double MaxY = CGRectGetMaxY(v52);
  v53.origin.double x = a1;
  v53.origin.y = a2;
  v53.size.double width = a3;
  v53.size.height = a4;
  if (MaxY <= CGRectGetMaxY(v53)) {
    goto LABEL_15;
  }
  v54.origin.double x = a5;
  v54.origin.y = a6;
  v54.size.double width = a7;
  v54.size.height = a8;
  double MinY = CGRectGetMinY(v54);
  v55.origin.double x = a1;
  v55.origin.y = a2;
  v55.size.double width = a3;
  v55.size.height = a4;
  if (MinY <= CGRectGetMinY(v55))
  {
LABEL_15:
    v60.origin.double x = a5;
    v60.origin.y = a6;
    v60.size.double width = a7;
    v60.size.height = a8;
    double v25 = CGRectGetMinY(v60);
    v61.origin.double x = a1;
    v61.origin.y = a2;
    v61.size.double width = a3;
    v61.size.height = a4;
    if (v25 < CGRectGetMinY(v61))
    {
      v62.origin.double x = a5;
      v62.origin.y = a6;
      v62.size.double width = a7;
      v62.size.height = a8;
      double v26 = CGRectGetMaxY(v62);
      v63.origin.double x = a1;
      v63.origin.y = a2;
      v63.size.double width = a3;
      v63.size.height = a4;
      if (v26 < CGRectGetMaxY(v63))
      {
        v64.origin.double x = a1;
        v64.origin.y = a2;
        v64.size.double width = a3;
        v64.size.height = a4;
        CGRectGetMinY(v64);
        v65.origin.double x = a5;
        v65.origin.y = a6;
        v65.size.double width = a7;
        v65.size.height = a8;
        CGRectGetMinY(v65);
        v66.origin.double x = a1;
        v66.origin.y = a2;
        v66.size.double width = a3;
        v66.size.height = a4;
        CGRectGetMaxY(v66);
        v67.origin.double x = a5;
        v67.origin.y = a6;
        v67.size.double width = a7;
        v67.size.height = a8;
        CGRectGetMaxY(v67);
      }
    }
  }
  else
  {
    v56.origin.double x = a5;
    v56.origin.y = a6;
    v56.size.double width = a7;
    v56.size.height = a8;
    CGRectGetMaxY(v56);
    v57.origin.double x = a1;
    v57.origin.y = a2;
    v57.size.double width = a3;
    v57.size.height = a4;
    CGRectGetMaxY(v57);
    v58.origin.double x = a5;
    v58.origin.y = a6;
    v58.size.double width = a7;
    v58.size.height = a8;
    CGRectGetMinY(v58);
    v59.origin.double x = a1;
    v59.origin.y = a2;
    v59.size.double width = a3;
    v59.size.height = a4;
    CGRectGetMinY(v59);
  }
  return v34;
}

double DCTSDOriginRotate(double *a1, double a2, double a3)
{
  __double2 v5 = __sincos_stret(a3);
  double result = v5.__sinval * a2;
  *a1 = v5.__cosval * a2;
  a1[1] = v5.__sinval * a2;
  return result;
}

double DCTSDNiceAngleFromDelta(long double a1, long double a2)
{
  if (a2 != 0.0) {
    return atan2(a2, a1);
  }
  double result = 3.14159265;
  if (a1 >= 0.0) {
    return 0.0;
  }
  return result;
}

double DCTSDDeltaFromAngle(double a1)
{
  if (a1 == 0.0) {
    return 1.0;
  }
  return __sincos_stret(a1).__cosval;
}

double DCTSDShiftConstrainDelta(long double a1, long double a2)
{
  long double v4 = atan2(a2, a1);
  return sqrt(a2 * a2 + a1 * a1)
       * __sincos_stret((double)(int)((v4 + 6.28318531) / 0.785398163 + 0.5) * 0.785398163).__cosval;
}

double DCTSDShiftConstrainDeltaToAngle(double a1, double a2, double a3)
{
  return __sincos_stret(a3).__cosval * sqrt(a2 * a2 + a1 * a1);
}

double DCTSDRotatePoint90Degrees(int a1, double a2, double a3)
{
  if (a1) {
    return -a3;
  }
  else {
    return a3;
  }
}

void DCTSDNormalizeSignedDifferenceAngleInDegrees(double a1, double a2)
{
}

double DCTSDNormalizeDifferenceAngleInDegrees(double a1, double a2)
{
  double v2 = fmod(a1 - a2, 360.0);
  if (v2 > 180.0) {
    double v2 = v2 + -360.0;
  }
  if (v2 < -180.0) {
    double v2 = v2 + 360.0;
  }
  return fabs(v2);
}

void DCTSDNormalizeAngleInRadians(long double a1)
{
}

void DCTSDNormalizeAngleAboutZeroInRadians(double a1)
{
}

double DCTSDDeltaApplyAffineTransform(float64x2_t *a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a3), *a1, a2)), vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], *(double *)(MEMORY[0x263F00148] + 8)), *a1, *MEMORY[0x263F00148])));
  return result;
}

void DCTSDDistanceBetweenAnglesInRadians(long double a1, long double a2)
{
}

double DCTSDAngleBetweenPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 - a1;
  double v7 = a4 - a2;
  double v8 = 1.0 / sqrt(v7 * v7 + v6 * v6);
  double v9 = a5 - a1;
  double v10 = a6 - a2;
  double v11 = 1.0 / sqrt(v10 * v10 + v9 * v9);
  return acos(v7 * v8 * (v10 * v11) + v6 * v8 * (v9 * v11));
}

double DCTSDRotationFromTransform(uint64_t a1)
{
  return atan2(*(long double *)(a1 + 8), *(long double *)(a1 + 24));
}

double DCTSDNormalizedPointInRect(double a1, double a2, double a3, double a4, double a5)
{
  return (a1 - a3) / a5;
}

double DCTSDPointFromNormalizedRect(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

void DCTSDRectFromNormalizedSubrect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v12.origin.double x = a5;
  v12.origin.y = a6;
  v12.size.double width = a7;
  v12.size.height = a8;
  CGRectGetMaxX(v12);
  v13.origin.double x = a5;
  v13.origin.y = a6;
  v13.size.double width = a7;
  v13.size.height = a8;
  CGRectGetMaxY(v13);
}

void DCTSDNormalizedSubrectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRectGetMaxX(*(CGRect *)&a1);
  v8.origin.double x = a1;
  v8.origin.y = a2;
  v8.size.double width = a3;
  v8.size.height = a4;
  CGRectGetMaxY(v8);
}

double DCTSDRectSubtractingRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v11 = a1;
  CGRect v42 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  CGFloat x = v42.origin.x;
  CGFloat y = v42.origin.y;
  CGFloat width = v42.size.width;
  CGFloat height = v42.size.height;
  if (!CGRectIsNull(v42))
  {
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v43);
    v44.origin.CGFloat x = v11;
    v44.origin.CGFloat y = a2;
    v44.size.CGFloat width = a3;
    v44.size.CGFloat height = a4;
    double MinY = CGRectGetMinY(v44);
    v45.origin.CGFloat x = v11;
    v45.origin.CGFloat y = a2;
    v45.size.CGFloat width = a3;
    v45.size.CGFloat height = a4;
    double v37 = CGRectGetMaxY(v45);
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    double v38 = v37 - CGRectGetMaxY(v46);
    v47.origin.CGFloat x = v11;
    v47.origin.CGFloat y = a2;
    v47.size.CGFloat width = a3;
    v47.size.CGFloat height = a4;
    double v33 = v38 * CGRectGetWidth(v47);
    CGFloat v36 = height;
    CGFloat v39 = x;
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double v16 = CGRectGetMinY(v48);
    v49.origin.CGFloat x = v11;
    v49.origin.CGFloat y = a2;
    v49.size.CGFloat width = a3;
    v49.size.CGFloat height = a4;
    double v17 = v16 - CGRectGetMinY(v49);
    v50.origin.CGFloat x = v11;
    v50.origin.CGFloat y = a2;
    v50.size.CGFloat width = a3;
    v50.size.CGFloat height = a4;
    double v18 = v17 * CGRectGetWidth(v50);
    double v19 = v33;
    if (v18 <= v33)
    {
      double v35 = MaxY - MinY;
      CGRectEdge v21 = CGRectMinYEdge;
    }
    else
    {
      v51.origin.CGFloat x = v11;
      v51.origin.CGFloat y = a2;
      v51.size.CGFloat width = a3;
      v51.size.CGFloat height = a4;
      double v20 = CGRectGetMaxY(v51);
      v52.size.CGFloat height = v36;
      v52.origin.CGFloat x = v39;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = width;
      double v35 = v20 - CGRectGetMinY(v52);
      CGRectEdge v21 = CGRectMaxYEdge;
      double v19 = v18;
    }
    v53.origin.CGFloat x = v11;
    v53.origin.CGFloat y = a2;
    v53.size.CGFloat width = a3;
    v53.size.CGFloat height = a4;
    double MaxX = CGRectGetMaxX(v53);
    v54.size.CGFloat height = v36;
    v54.origin.CGFloat x = v39;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    double v23 = MaxX - CGRectGetMaxX(v54);
    v55.origin.CGFloat x = v11;
    v55.origin.CGFloat y = a2;
    v55.size.CGFloat width = a3;
    v55.size.CGFloat height = a4;
    double v24 = v23 * CGRectGetHeight(v55);
    if (v24 > v19)
    {
      v56.size.CGFloat height = v36;
      v56.origin.CGFloat x = v39;
      v56.origin.CGFloat y = y;
      v56.size.CGFloat width = width;
      double v25 = CGRectGetMaxX(v56);
      v57.origin.CGFloat x = v11;
      v57.origin.CGFloat y = a2;
      v57.size.CGFloat width = a3;
      v57.size.CGFloat height = a4;
      CGRectEdge v21 = CGRectMinXEdge;
      double v35 = v25 - CGRectGetMinX(v57);
      double v19 = v24;
    }
    v58.size.CGFloat height = v36;
    v58.origin.CGFloat x = v39;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    double MinX = CGRectGetMinX(v58);
    v59.origin.CGFloat x = v11;
    v59.origin.CGFloat y = a2;
    v59.size.CGFloat width = a3;
    v59.size.CGFloat height = a4;
    double v27 = MinX - CGRectGetMinX(v59);
    v60.origin.CGFloat x = v11;
    v60.origin.CGFloat y = a2;
    v60.size.CGFloat width = a3;
    v60.size.CGFloat height = a4;
    CGFloat v28 = CGRectGetHeight(v60);
    double v29 = v35;
    if (v27 * v28 > v19)
    {
      v61.origin.CGFloat x = v11;
      v61.origin.CGFloat y = a2;
      v61.size.CGFloat width = a3;
      v61.size.CGFloat height = a4;
      double v30 = CGRectGetMaxX(v61);
      v62.size.CGFloat height = v36;
      v62.origin.CGFloat x = v39;
      v62.origin.CGFloat y = y;
      v62.size.CGFloat width = width;
      double v29 = v30 - CGRectGetMinX(v62);
      CGRectEdge v21 = CGRectMaxXEdge;
    }
    memset(&remainder, 0, sizeof(remainder));
    memset(&slice, 0, sizeof(slice));
    v63.origin.CGFloat x = v11;
    v63.origin.CGFloat y = a2;
    v63.size.CGFloat width = a3;
    v63.size.CGFloat height = a4;
    CGRectDivide(v63, &slice, &remainder, v29, v21);
    return remainder.origin.x;
  }
  return v11;
}

double DCTSDRectWithTopRightPoint(double a1, double a2, double a3)
{
  return a3 - a1;
}

double DCTSDRectWithBottomRightPoint(double a1, double a2, double a3)
{
  return a3 - a1;
}

double DCTSDRectWithTopLeftPoint(double a1, double a2, double a3)
{
  return a3;
}

double DCTSDRectWithBottomLeftPoint(double a1, double a2, double a3)
{
  return a3;
}

double DCTSDSizeWithAspectRatio(int a1, double result, double a3, double a4, double a5)
{
  BOOL v5 = result == a4 && a3 == a5;
  if (!v5 && a4 != 0.0 && a5 != 0.0 && a4 != 3.40282347e38 && a5 != 3.40282347e38)
  {
    if (a1)
    {
      double v6 = sqrt(a5 * a5 + a4 * a4);
      return a4 / v6 * (a3 * (a5 / v6) + result * (a4 / v6));
    }
    else if (vabdd_f64(result, a4) < 0.01)
    {
      return a3 * a4 / a5;
    }
  }
  return result;
}

double DCTSDSizeExpandedToMatchAspectRatio(double result, double a2, double a3, double a4)
{
  BOOL v4 = result != a3;
  if (a2 != a4) {
    BOOL v4 = 1;
  }
  BOOL v5 = a3 <= 0.0 || !v4;
  if (!v5 && a4 > 0.0)
  {
    double v6 = a3 / a4;
    if (v6 > result / a2) {
      return a2 * v6;
    }
  }
  return result;
}

double DCTSDScaleSizeWithinSize(double a1, double a2, double a3, double a4)
{
  if (a1 / a2 < a3 / a4) {
    return a1 * (a4 / a2);
  }
  return a3;
}

double DCTSDShrinkSizeToFitInSize(double result, double a2, double a3, double a4)
{
  if (result <= a3)
  {
    BOOL v4 = a2 == a4;
    BOOL v5 = a2 < a4;
  }
  else
  {
    BOOL v4 = 0;
    BOOL v5 = 0;
  }
  if (!v5 && !v4)
  {
    if (result / a2 <= a3 / a4)
    {
      if (result / a2 < a3 / a4) {
        return result * (a4 / a2);
      }
      else {
        return a3;
      }
    }
    else
    {
      return a3;
    }
  }
  return result;
}

double DCTSDFitOrFillSizeInSize(int a1, double a2, double a3, double a4, double a5)
{
  double v5 = a4 / a2;
  double v6 = a5 / a3;
  if (v5 >= v6) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  if (v5 >= v6) {
    double v5 = v6;
  }
  if (a1) {
    double v5 = v7;
  }
  return a2 * v5;
}

double DCTSDFitOrFillSizeInRect(int a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v11 = a6 / a2;
  if (a6 / a2 >= a7 / a3) {
    double v12 = a6 / a2;
  }
  else {
    double v12 = a7 / a3;
  }
  if (a6 / a2 >= a7 / a3) {
    double v11 = a7 / a3;
  }
  if (a1) {
    double v13 = v12;
  }
  else {
    double v13 = v11;
  }
  return DCTSDCenterRectOverRect(0.0, 0.0, a2 * v13, a3 * v13, a4, a5, a6, a7);
}

void DCTSDScaleRectAroundPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7)
{
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -a5, -a6);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, a7, a7);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransform t1 = v18;
  CGAffineTransform t2 = v17;
  CGAffineTransformConcat(&v15, &t1, &t2);
  CGAffineTransform t1 = v18;
  CGAffineTransformInvert(&v12, &t1);
  CGAffineTransformConcat(&v16, &v15, &v12);
  CGAffineTransform t1 = v16;
  v19.origin.CGFloat x = a1;
  v19.origin.CGFloat y = a2;
  v19.size.CGFloat width = a3;
  v19.size.CGFloat height = a4;
  CGRectApplyAffineTransform(v19, &t1);
}

void DCTSDVisibleUnscaledRectForNewScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, double a8)
{
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, a7, a7);
  memset(&v18, 0, sizeof(v18));
  CGAffineTransform v17 = v19;
  CGAffineTransformInvert(&v18, &v17);
  CGAffineTransform v17 = v18;
  v20.origin.CGFloat x = a1;
  v20.origin.CGFloat y = a2;
  v20.size.CGFloat width = a3;
  v20.size.CGFloat height = a4;
  CGRect v21 = CGRectApplyAffineTransform(v20, &v17);
  float64x2_t v14 = vaddq_f64(*(float64x2_t *)&v18.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v18.c, a6), *(float64x2_t *)&v18.a, a5));
  DCTSDScaleRectAroundPoint(v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, v14.f64[0], v14.f64[1], a7 / a8);
}

double DCTSDRectWithInverseNormalizedRect(double a1, double a2, double a3)
{
  return -a1 / a3;
}

double DCTSDRectByExpandingBoundingRectToContentRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12)
{
  double v25 = a1 + a5 * a3;
  v36.origin.CGFloat x = a5;
  v36.origin.CGFloat y = a6;
  v36.size.CGFloat width = a7;
  v36.size.CGFloat height = a8;
  double MaxX = CGRectGetMaxX(v36);
  v37.origin.CGFloat x = a5;
  v37.origin.CGFloat y = a6;
  v37.size.CGFloat width = a7;
  v37.size.CGFloat height = a8;
  CGRectGetMaxY(v37);
  double v26 = a1 + MaxX * a3;
  if (v25 >= v26) {
    double v27 = a1 + MaxX * a3;
  }
  else {
    double v27 = v25;
  }
  if (v25 >= v26) {
    double v26 = v25;
  }
  double v35 = v27;
  double v28 = v26 - v27;
  double v29 = -a9 / a11 * (v26 - v27);
  v38.origin.CGFloat x = -a9 / a11;
  v38.origin.CGFloat y = -a10 / a12;
  v38.size.CGFloat width = 1.0 / a11;
  v38.size.CGFloat height = 1.0 / a12;
  double v30 = CGRectGetMaxX(v38);
  v39.origin.CGFloat x = -a9 / a11;
  v39.origin.CGFloat y = -a10 / a12;
  v39.size.CGFloat width = 1.0 / a11;
  v39.size.CGFloat height = 1.0 / a12;
  CGRectGetMaxY(v39);
  if (v29 >= v30 * v28) {
    double v31 = v30 * v28;
  }
  else {
    double v31 = v29;
  }
  return v35 + v31;
}

double DCTSDClampRectToRect(double a1, double a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v23 = a5 + a7;
  double v15 = DCTSUClamp(a1, a5, a5 + a7);
  double v21 = a6;
  double v22 = a6 + a8;
  DCTSUClamp(a2, a6, a6 + a8);
  v24.origin.CGFloat x = a1;
  v24.origin.CGFloat y = a2;
  v24.size.CGFloat width = a3;
  v24.size.CGFloat height = a4;
  double MaxX = CGRectGetMaxX(v24);
  v25.origin.CGFloat x = a1;
  v25.origin.CGFloat y = a2;
  v25.size.CGFloat width = a3;
  v25.size.CGFloat height = a4;
  double MaxY = CGRectGetMaxY(v25);
  double v18 = DCTSUClamp(MaxX, a5, v23);
  DCTSUClamp(MaxY, v21, v22);
  if (v15 >= v18) {
    return v18;
  }
  else {
    return v15;
  }
}

double DCTSDAliasRound(double a1)
{
  double v1 = floor(a1);
  double v2 = a1 - v1;
  double result = ceil(a1);
  if (v2 < 0.49) {
    return v1;
  }
  return result;
}

double DCTSDAliasRoundedPoint(double a1)
{
  double v1 = floor(a1);
  double v2 = a1 - v1;
  double result = ceil(a1);
  if (v2 < 0.49) {
    return v1;
  }
  return result;
}

double DCTSDRoundForScale(double a1, double a2)
{
  return DCTSURound(a1 * a2) / a2;
}

double DCTSDRoundedPoint(double a1, double a2)
{
  double v3 = DCTSURound(a1);
  DCTSURound(a2);
  return v3;
}

double DCTSDRoundedPointForScale(double a1, double a2, double a3)
{
  double v4 = a2 * a3;
  double v5 = DCTSURound(a1 * a3);
  DCTSURound(v4);
  return 1.0 / a3 * v5;
}

double DCTSDCeilSize(double a1)
{
  return ceil(a1);
}

double DCTSDRoundedRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return DCTSDRoundedRectForScale(a1, a2, a3, a4, 1.0);
}

double DCTSDRoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v8 = a1;
  if (a5 != 0.0 && !CGRectIsNull(*(CGRect *)&a1))
  {
    v23.origin.CGFloat x = DCTSDMultiplyRectScalar(v8, a2, a3, a4, a5);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
    double MinX = CGRectGetMinX(v23);
    double v15 = DCTSURound(MinX);
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v24);
    double v17 = DCTSURound(MinY);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v25);
    CGFloat v19 = DCTSURound(MaxX) - v15;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v26);
    double v21 = DCTSURound(MaxY);
    return DCTSDMultiplyRectScalar(v15, v17, v19, v21 - v17, 1.0 / a5);
  }
  return v8;
}

double DCTSDAliasRoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v8 = a1;
  if (a5 != 0.0 && !CGRectIsNull(*(CGRect *)&a1))
  {
    v34.origin.CGFloat x = DCTSDMultiplyRectScalar(v8, a2, a3, a4, a5);
    CGFloat x = v34.origin.x;
    CGFloat y = v34.origin.y;
    CGFloat width = v34.size.width;
    CGFloat height = v34.size.height;
    double MinX = CGRectGetMinX(v34);
    double v15 = floor(MinX);
    double v16 = MinX - v15;
    double v17 = ceil(MinX);
    if (v16 >= 0.49) {
      double v18 = v17;
    }
    else {
      double v18 = v15;
    }
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v35);
    double v20 = floor(MinY);
    double v21 = MinY - v20;
    double v22 = ceil(MinY);
    if (v21 >= 0.49) {
      CGFloat v23 = v22;
    }
    else {
      CGFloat v23 = v20;
    }
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v36);
    double v25 = floor(MaxX);
    double v26 = MaxX - v25;
    double v27 = ceil(MaxX);
    if (v26 < 0.49) {
      double v27 = v25;
    }
    double v33 = v27 - v18;
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v37);
    double v29 = floor(MaxY);
    double v30 = MaxY - v29;
    double v31 = ceil(MaxY);
    if (v30 < 0.49) {
      double v31 = v29;
    }
    return DCTSDMultiplyRectScalar(v18, v23, v33, v31 - v23, 1.0 / a5);
  }
  return v8;
}

double DCTSDRoundedMinX(double a1, double a2, double a3, double a4)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);

  return DCTSURound(MinX);
}

double DCTSDRoundedMidX(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v8 = DCTSURound(a1);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  double MaxX = CGRectGetMaxX(v13);
  double v10 = (v8 + DCTSURound(MaxX)) * 0.5;

  return DCTSURound(v10);
}

double DCTSDRoundedMaxX(double a1, double a2, double a3, double a4)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);

  return DCTSURound(MaxX);
}

double DCTSDRoundedMinY(double a1, double a2, double a3, double a4)
{
  double MinY = CGRectGetMinY(*(CGRect *)&a1);

  return DCTSURound(MinY);
}

double DCTSDRoundedMidY(CGFloat a1, double a2, CGFloat a3, CGFloat a4)
{
  double v8 = DCTSURound(a2);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  double MaxY = CGRectGetMaxY(v13);
  double v10 = (v8 + DCTSURound(MaxY)) * 0.5;

  return DCTSURound(v10);
}

double DCTSDRoundedMaxY(double a1, double a2, double a3, double a4)
{
  double MaxY = CGRectGetMaxY(*(CGRect *)&a1);

  return DCTSURound(MaxY);
}

uint64_t DCTSDSizeHasNaNComponents()
{
  return 0;
}

uint64_t DCTSDRectHasNaNComponents()
{
  return 0;
}

uint64_t DCTSDPointHasNaNComponents()
{
  return 0;
}

uint64_t DCTSDTransformHasNaNComponents()
{
  return 0;
}

uint64_t DCTSDSizeHasInfComponents(double a1, double a2)
{
  BOOL v2 = fabs(a2) == INFINITY;
  return fabs(a1) == INFINITY || v2;
}

uint64_t DCTSDRectHasInfComponents(double a1, double a2, double a3, double a4)
{
  double v4 = fabs(a3);
  if (fabs(a4) == INFINITY || v4 == INFINITY) {
    return 1;
  }
  BOOL v7 = fabs(a1) == INFINITY;
  return fabs(a2) == INFINITY || v7;
}

uint64_t DCTSDPointHasInfComponents(double a1, double a2)
{
  BOOL v2 = fabs(a1) == INFINITY;
  return fabs(a2) == INFINITY || v2;
}

double DCTSDSanitizeRect(double result)
{
  double v1 = fabs(result);
  if (v1 >= INFINITY) {
    double v2 = 0.0;
  }
  else {
    double v2 = result;
  }
  if (v1 <= INFINITY) {
    return v2;
  }
  return result;
}

double DCTSDSanitizePoint(double result)
{
  double v1 = fabs(result);
  if (v1 >= INFINITY) {
    double v2 = 0.0;
  }
  else {
    double v2 = result;
  }
  if (v1 <= INFINITY) {
    return v2;
  }
  return result;
}

void sub_21789D510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21789D898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DCTSUDeviceRGBColorSpace()
{
  if (DCTSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&DCTSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_0);
  }
  return DCTSUDeviceRGBColorSpace_sDeviceRGBColorSpace;
}

CGColorSpaceRef __DCTSUDeviceRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  DCTSUDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)result;
  return result;
}

uint64_t DCTSUDeviceCMYKColorSpace()
{
  if (DCTSUDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce != -1) {
    dispatch_once(&DCTSUDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce, &__block_literal_global_2);
  }
  return DCTSUDeviceCMYKColorSpace_sDeviceCMYKColorSpace;
}

CGColorSpaceRef __DCTSUDeviceCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceCMYK();
  DCTSUDeviceCMYKColorSpace_sDeviceCMYKColorSpace = (uint64_t)result;
  return result;
}

uint64_t DCTSUDeviceGrayColorSpace()
{
  if (DCTSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1) {
    dispatch_once(&DCTSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_4);
  }
  return DCTSUDeviceGrayColorSpace_sDeviceGrayColorSpace;
}

CGColorSpaceRef __DCTSUDeviceGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceGray();
  DCTSUDeviceGrayColorSpace_sDeviceGrayColorSpace = (uint64_t)result;
  return result;
}

CGColorRef DCTSUCGColorCreateDeviceRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  if (DCTSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&DCTSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_0);
  }
  return CGColorCreate((CGColorSpaceRef)DCTSUDeviceRGBColorSpace_sDeviceRGBColorSpace, components);
}

CGColorRef DCTSUCGColorCreateDeviceGray(CGFloat a1, CGFloat a2)
{
  components[2] = *(CGFloat *)MEMORY[0x263EF8340];
  components[0] = a1;
  components[1] = a2;
  if (DCTSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1) {
    dispatch_once(&DCTSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_4);
  }
  return CGColorCreate((CGColorSpaceRef)DCTSUDeviceGrayColorSpace_sDeviceGrayColorSpace, components);
}

CGPatternRef DCTSUCGPatternCreateWithImageAndTransform(CGImage *a1, long long *a2)
{
  CGImageRetain(a1);
  CGFloat v4 = *MEMORY[0x263F00148];
  CGFloat v5 = *(double *)(MEMORY[0x263F00148] + 8);
  size_t Width = CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  if (a2)
  {
    long long v8 = a2[1];
    long long v13 = *a2;
    long long v14 = v8;
    long long v9 = a2[2];
  }
  else
  {
    long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v13 = *MEMORY[0x263F000D0];
    long long v14 = v10;
    long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  long long v15 = v9;
  v16.size.CGFloat height = (double)Height;
  v16.size.CGFloat width = (double)Width;
  *(_OWORD *)&v12.a = v13;
  *(_OWORD *)&v12.c = v14;
  *(_OWORD *)&v12.tCGFloat x = v9;
  v16.origin.CGFloat x = v4;
  v16.origin.CGFloat y = v5;
  return CGPatternCreate(a1, v16, &v12, (double)Width, v16.size.height, kCGPatternTilingConstantSpacing, 1, &DCTSUCGPatternCreateWithImageAndTransform_sCallbacks);
}

void DCTSUDrawImageAtOriginInContext(CGImage *a1, CGContext *a2)
{
  uint64_t v4 = *MEMORY[0x263F00148];
  uint64_t v5 = *(void *)(MEMORY[0x263F00148] + 8);
  double Width = (double)CGImageGetWidth(a1);
  double Height = (double)CGImageGetHeight(a1);
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  double v10 = Width;

  CGContextDrawImage(a2, *(CGRect *)&v8, a1);
}

CGPatternRef DCTSUCGPatternCreateWithImage(CGImage *a1)
{
  return DCTSUCGPatternCreateWithImageAndTransform(a1, 0);
}

CGColorRef DCTSUCGColorCreatePatternWithImageAndTransform(CGImage *a1, long long *a2)
{
  v6[1] = *(CGFloat *)MEMORY[0x263EF8340];
  double v2 = DCTSUCGPatternCreateWithImageAndTransform(a1, a2);
  Pattern = CGColorSpaceCreatePattern(0);
  v6[0] = 1.0;
  CGColorRef v4 = CGColorCreateWithPattern(Pattern, v2, v6);
  CGColorSpaceRelease(Pattern);
  CGPatternRelease(v2);
  return v4;
}

CGColorRef DCTSUCGColorCreatePatternWithImage(CGImage *a1)
{
  return DCTSUCGColorCreatePatternWithImageAndTransform(a1, 0);
}

uint64_t DCTSUHSBFromCGColorRef(CGColor *a1, double *a2, double *a3, double *a4, CGFloat *a5)
{
  *a5 = 0.0;
  *a4 = 0.0;
  *a3 = 0.0;
  *a2 = 0.0;
  ColorSpace = CGColorGetColorSpace(a1);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB || CGColorGetNumberOfComponents(a1) != 4) {
    return 0;
  }
  *a5 = CGColorGetAlpha(a1);
  Components = CGColorGetComponents(a1);
  DCTSURGBToHSB(a2, a3, a4, *Components, Components[1], Components[2]);
  return 1;
}

double DCTSURGBToHSB(double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 < a5 || a4 < a6)
  {
    if (a5 >= a4) {
      double v7 = a4;
    }
    else {
      double v7 = a5;
    }
    if (a4 >= a6) {
      double v8 = a6;
    }
    else {
      double v8 = a4;
    }
    BOOL v9 = a5 < a4 || a5 < a6;
    if (v9) {
      double v10 = a6;
    }
    else {
      double v10 = a5;
    }
    if (v9) {
      double v11 = v7;
    }
    else {
      double v11 = v8;
    }
  }
  else
  {
    if (a5 >= a6) {
      double v11 = a6;
    }
    else {
      double v11 = a5;
    }
    double v10 = a4;
  }
  double v12 = 0.0;
  if (v10 <= 0.0)
  {
    double v14 = 0.0;
  }
  else
  {
    double v13 = v10 - v11;
    double v14 = (v10 - v11) / v10;
    if (v14 != 0.0)
    {
      double v15 = (v10 - a5) / v13;
      double v16 = (v10 - a6) / v13;
      if (v10 == a4)
      {
        if (v11 == a5) {
          double v12 = v16 + 5.0;
        }
        else {
          double v12 = 1.0 - v15;
        }
      }
      else
      {
        BOOL v18 = v10 == a5;
        double v19 = (v10 - a4) / v13;
        if (v18)
        {
          if (v11 == a6) {
            double v12 = v19 + 1.0;
          }
          else {
            double v12 = 3.0 - v16;
          }
        }
        else if (v11 == a4)
        {
          double v12 = v15 + 3.0;
        }
        else
        {
          double v12 = 5.0 - v19;
        }
      }
    }
  }
  *a3 = v10;
  double result = v12 / 6.0;
  *a1 = v12 / 6.0;
  *a2 = v14;
  return result;
}

double *DCTSUHSBToRGB(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6 = a4 * 6.0;
  BOOL v7 = a4 == 1.0;
  double v8 = 0.0;
  if (!v7) {
    double v8 = v6;
  }
  uint64_t v9 = (uint64_t)v8;
  double v10 = v8 - (double)(uint64_t)v8;
  double v11 = (1.0 - a5) * a6;
  double v12 = (1.0 - a5 * v10) * a6;
  double v13 = (1.0 - a5 * (1.0 - v10)) * a6;
  double v14 = a6;
  double v15 = v13;
  switch(v9)
  {
    case 0:
      goto LABEL_10;
    case 1:
      double v14 = v12;
      double v15 = a6;
      goto LABEL_10;
    case 2:
      double v14 = v11;
      double v15 = a6;
      double v11 = v13;
      goto LABEL_10;
    case 3:
      double v14 = v11;
      double v15 = v12;
      goto LABEL_8;
    case 4:
      double v14 = v13;
      double v15 = v11;
LABEL_8:
      double v11 = a6;
      goto LABEL_10;
    case 5:
      double v14 = a6;
      double v15 = v11;
      double v11 = v12;
LABEL_10:
      *double result = v14;
      *a2 = v15;
      *a3 = v11;
      break;
    default:
      return result;
  }
  return result;
}

double DCTSUCMYKToRGB(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7)
{
  *a1 = 1.0 - fmin(a7 + a4 * (1.0 - a7), 1.0);
  *a2 = 1.0 - fmin(a7 + a5 * (1.0 - a7), 1.0);
  double result = 1.0 - fmin(a7 + a6 * (1.0 - a7), 1.0);
  *a3 = result;
  return result;
}

uint64_t DCTSUColorIsBlack(CGColor *a1)
{
  ColorSpace = CGColorGetColorSpace(a1);
  uint64_t Model = CGColorSpaceGetModel(ColorSpace);
  Components = CGColorGetComponents(a1);
  switch((int)Model)
  {
    case 0:
      double v6 = *Components;
      goto LABEL_8;
    case 1:
      if (*Components != 0.0 || Components[1] != 0.0) {
        goto LABEL_3;
      }
      double v6 = Components[2];
LABEL_8:
      BOOL v7 = v6 == 0.0;
LABEL_10:
      uint64_t result = v7;
      break;
    case 2:
      BOOL v7 = Components[3] == 1.0;
      goto LABEL_10;
    case 3:
    case 4:
    case 5:
      NSLog(&cfstr_Dctsucolorisbl.isa, Model, a1);
      goto LABEL_3;
    default:
LABEL_3:
      uint64_t result = 0;
      break;
  }
  return result;
}

CGFloat DCTSUColorLightness(CGColor *a1)
{
  ColorSpace = CGColorGetColorSpace(a1);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  switch(Model)
  {
    case kCGColorSpaceModelMonochrome:
      return *CGColorGetComponents(a1);
    case kCGColorSpaceModelCMYK:
      Components = CGColorGetComponents(a1);
      double v8 = Components[3];
      double v9 = 1.0 - fmin(v8 + *Components * (1.0 - v8), 1.0);
      double v10 = 1.0 - fmin(v8 + Components[1] * (1.0 - v8), 1.0);
      double v11 = 1.0 - fmin(v8 + Components[2] * (1.0 - v8), 1.0);
      double v5 = fmax(fmax(v9, v10), v11) + fmin(fmin(v9, v10), v11);
      return v5 * 0.5;
    case kCGColorSpaceModelRGB:
      CGColorRef v4 = CGColorGetComponents(a1);
      double v5 = fmax(fmax(*v4, v4[1]), v4[2]) + fmin(fmin(*v4, v4[1]), v4[2]);
      return v5 * 0.5;
  }
  NSLog(&cfstr_WarningTesting.isa);
  return 0.0;
}

CGContext *DCTSUCreateRGBABitmapContext(int a1, double a2, CGFloat a3, CGFloat a4)
{
  if (DCTSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1) {
    dispatch_once(&DCTSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_0);
  }
  double v8 = CGBitmapContextCreate(0, (unint64_t)(a2 * a4), (unint64_t)(a3 * a4), 8uLL, (4 * (unint64_t)(a2 * a4) + 31) & 0xFFFFFFFFFFFFFFE0, (CGColorSpaceRef)DCTSUDeviceRGBColorSpace_sDeviceRGBColorSpace, 0x2002u);
  CGAffineTransformMakeScale(&transform, a4, a4);
  CGContextConcatCTM(v8, &transform);
  if (a1)
  {
    CGContextTranslateCTM(v8, 0.0, a3);
    CGAffineTransformMakeScale(&v10, 1.0, -1.0);
    CGContextConcatCTM(v8, &v10);
  }
  return v8;
}

unint64_t DCTSUBitmapGetAlignedBytesPerRow(uint64_t a1)
{
  return (a1 + 31) & 0xFFFFFFFFFFFFFFE0;
}

CGColorRef DCTSUCreateCheckerBoardColor(CGColor *a1, CGColor *a2, CGFloat a3, CGFloat a4)
{
  double v8 = a3 + a3;
  double v9 = a4 + a4;
  CGAffineTransform v10 = DCTSUCreateRGBABitmapContext(0, a3 + a3, a4 + a4, 1.0);
  if (!v10) {
    return 0;
  }
  double v11 = v10;
  CGContextSetFillColorWithColor(v10, a1);
  v15.origin.CGFloat x = 0.0;
  v15.origin.CGFloat y = 0.0;
  v15.size.CGFloat width = v8;
  v15.size.CGFloat height = v9;
  CGContextFillRect(v11, v15);
  CGContextSetFillColorWithColor(v11, a2);
  v16.origin.CGFloat x = 0.0;
  v16.origin.CGFloat y = 0.0;
  v16.size.CGFloat width = a3;
  v16.size.CGFloat height = a4;
  CGContextFillRect(v11, v16);
  v17.origin.CGFloat x = a3;
  v17.origin.CGFloat y = a4;
  v17.size.CGFloat width = a3;
  v17.size.CGFloat height = a4;
  CGContextFillRect(v11, v17);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  if (!Image) {
    return 0;
  }
  CGColorRef PatternWithImageAndTransform = DCTSUCGColorCreatePatternWithImageAndTransform(Image, 0);
  CGImageRelease(Image);
  return PatternWithImageAndTransform;
}

void sub_21789ECC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21789F364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVKCImageAnalyzerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VKCImageAnalyzer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVKCImageAnalyzerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVKCImageAnalyzerClass_block_invoke_cold_1();
    VisionKitCoreLibrary();
  }
}

void VisionKitCoreLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!VisionKitCoreLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __VisionKitCoreLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2642A9758;
    uint64_t v3 = 0;
    VisionKitCoreLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!VisionKitCoreLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __VisionKitCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionKitCoreLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getVKCImageAnalyzerRequestClass_block_invoke(uint64_t a1)
{
  VisionKitCoreLibrary();
  Class result = objc_getClass("VKCImageAnalyzerRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVKCImageAnalyzerRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVKCImageAnalyzerRequestClass_block_invoke_cold_1();
    return (Class)-[NSObject(DCAccessibility) dcaxRespondsToSelector:fromExtrasProtocol:](v3);
  }
  return result;
}

double simd_float3_project_to_plane(int32x4_t a1)
{
  double v1 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)a1.i8, (float32x2_t)vdup_laneq_s32(a1, 2)));
  __asm { FMOV            V0.4S, #1.0 }
  return v1;
}

void sub_2178A36D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2178A3A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2178A3DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2178A4264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2178AA7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_2178AAC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2178AB0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVKCImageAnalysisInteractionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!VisionKitCoreLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __VisionKitCoreLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2642A9B40;
    uint64_t v6 = 0;
    VisionKitCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!VisionKitCoreLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VKCImageAnalysisInteraction");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getVKCImageAnalysisInteractionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVKCImageAnalysisInteractionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionKitCoreLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  VisionKitCoreLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void DumpCVPixelBufferInfo(__CVBuffer *a1)
{
  CVPixelBufferRetain(a1);
  CVPixelBufferLockBaseAddress(a1, 0);
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  size_t DataSize = CVPixelBufferGetDataSize(a1);
  BaseAddress = CVPixelBufferGetBaseAddress(a1);
  double v8 = (FILE **)MEMORY[0x263EF8348];
  fprintf((FILE *)*MEMORY[0x263EF8348], ">> CVPixelBuffer(%p) Information\n", a1);
  fprintf(*v8, " Pixel Format Type: %c%c%c%c {w:%lu h:%lu}\n", (PixelFormatType >> 24), (PixelFormatType << 8 >> 24), ((__int16)PixelFormatType >> 8), (char)PixelFormatType, Width, Height);
  fprintf(*v8, " Base address:%p size:%lu bytes/row:%lu\n", BaseAddress, DataSize, BytesPerRow);
  if (CVPixelBufferIsPlanar(a1))
  {
    size_t PlaneCount = CVPixelBufferGetPlaneCount(a1);
    CGAffineTransform v10 = "";
    if (PlaneCount > 1) {
      CGAffineTransform v10 = "s";
    }
    fprintf(*v8, " pixel buffer has %lu planer%s.\n", PlaneCount, v10);
    if (PlaneCount)
    {
      for (size_t i = 0; i != PlaneCount; ++i)
      {
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a1, i);
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, i);
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, i);
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, i);
        fprintf(*v8, "  [plane:%d] {w:%lu h:%lu} base address:%p bytes/row:%lu\n", i, WidthOfPlane, HeightOfPlane, BaseAddressOfPlane, BytesPerRowOfPlane);
      }
    }
  }
  else
  {
    fwrite(" pixel buffer is not planer.\n", 0x1DuLL, 1uLL, *v8);
  }
  CVPixelBufferUnlockBaseAddress(a1, 0);

  CVPixelBufferRelease(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2178B14D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void dc_performBlockOnMainThread(void *a1)
{
  double v1 = (void *)MEMORY[0x263F08B88];
  block = a1;
  if ([v1 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

void dc_dispatchMainAfterDelay(void *a1, double a2)
{
  int64_t v2 = (uint64_t)(a2 * 1000000000.0);
  dispatch_block_t block = a1;
  dispatch_time_t v3 = dispatch_time(0, v2);
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t DCLocalizedCapitalizationStyleForView(void *a1)
{
  double v1 = DCKeyboardLanguageForBaseView(a1);
  int64_t v2 = [&unk_26C7EDA30 objectForKey:v1];
  dispatch_time_t v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 integerValue];
  }
  else {
    uint64_t v4 = 1;
  }
  long long v5 = +[DCLocalization localizedStringForKey:@"default" value:@"default" table:@"Localizable"];
  if ([v5 caseInsensitiveCompare:@"default"])
  {
    if ([v5 caseInsensitiveCompare:@"all"])
    {
      if ([v5 caseInsensitiveCompare:@"word"])
      {
        if ([v5 caseInsensitiveCompare:@"none"])
        {
          if (![v5 caseInsensitiveCompare:@"sentence"]) {
            uint64_t v4 = 2;
          }
        }
        else
        {
          uint64_t v4 = 0;
        }
      }
      else
      {
        uint64_t v4 = 1;
      }
    }
    else
    {
      uint64_t v4 = 3;
    }
  }

  return v4;
}

id DCKeyboardLanguageForBaseView(void *a1)
{
  id v1 = a1;
  int64_t v2 = [v1 textInputMode];
  if (v2)
  {
    dispatch_time_t v3 = [v1 textInputMode];
    uint64_t v4 = [v3 primaryLanguage];
    char v5 = [v4 isEqualToString:@"dictation"];

    if (v5)
    {
      int64_t v2 = 0;
    }
    else
    {
      uint64_t v6 = [v1 textInputMode];
      int64_t v2 = [v6 primaryLanguage];
    }
  }

  return v2;
}

id DCAppName()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  id v1 = [v0 localizedInfoDictionary];
  int64_t v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263EFFB68]];

  if (!v2)
  {
    dispatch_time_t v3 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v4 = [v3 localizedInfoDictionary];
    int64_t v2 = [v4 objectForKey:@"CFBundleDisplayName"];

    if (!v2)
    {
      char v5 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v6 = [v5 infoDictionary];
      int64_t v2 = [v6 objectForKey:@"CFBundleDisplayName"];

      if (!v2)
      {
        uint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
        double v8 = [v7 infoDictionary];
        int64_t v2 = [v8 objectForKey:@"CFBundleName"];

        if (!v2)
        {
          int64_t v2 = +[DCLocalization localizedStringForKey:@"Document Camera" value:@"Document Camera" table:@"Localizable"];
        }
      }
    }
  }

  return v2;
}

Class __getSidecarServiceClass_block_invoke(uint64_t a1)
{
  SidecarCoreLibrary();
  Class result = objc_getClass("SidecarService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSidecarServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSidecarServiceClass_block_invoke_cold_1();
    return (Class)SidecarCoreLibrary();
  }
  return result;
}

uint64_t SidecarCoreLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SidecarCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __SidecarCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2642A9CA0;
    uint64_t v5 = 0;
    SidecarCoreLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v0 = SidecarCoreLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!SidecarCoreLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __SidecarCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SidecarCoreLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getSidecarServiceNameScanDocumentSymbolLoc_block_invoke(uint64_t a1)
{
  int64_t v2 = (void *)SidecarCoreLibrary();
  uint64_t result = dlsym(v2, "SidecarServiceNameScanDocument");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSidecarServiceNameScanDocumentSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id DCAccessibilitySystemDarkenedColor(void *a1)
{
  double v6 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v3 = 0.0;
  [a1 getHue:&v6 saturation:&v5 brightness:&v4 alpha:&v3];
  id v1 = [MEMORY[0x263F1C550] colorWithHue:v6 saturation:v5 brightness:v4 * 0.8 alpha:v3];

  return v1;
}

BOOL DCAccessibilityAccessibilityLargerTextSizesEnabled()
{
  uint64_t v0 = [MEMORY[0x263F1C568] system];
  id v1 = [v0 preferredContentSizeCategory];

  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v1);
  return IsAccessibilityCategory;
}

id DCAccessibilityContentSizeCategories()
{
  v4[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1D148];
  v4[0] = *MEMORY[0x263F1D150];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F1D138];
  v4[2] = *MEMORY[0x263F1D140];
  v4[3] = v1;
  v4[4] = *MEMORY[0x263F1D130];
  int64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];

  return v2;
}

double DCAccessibilityLinearInterpolatedValueForAccessibilityContentSizeCategory(void *a1, double a2, double a3)
{
  id v5 = a1;
  double v6 = DCAccessibilityContentSizeCategories();
  uint64_t v7 = [v6 indexOfObject:v5];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    a2 = (a3 - a2) * (double)v7 / (double)(unint64_t)([v6 count] - 1) + a2;
  }

  return a2;
}

void sub_2178B4CCC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_2178B59B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2178B5CF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2178B6B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2178B6CDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2178BC050(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double triangleNormalDirection(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v9 = DCTSDSubtractPoints(a3, a4, a1);
  double v11 = v10;
  double v13 = DCTSDSubtractPoints(a5, a6, a1);

  return DCTSDCrossPoints(v9, v11, v13, v12);
}

double diffMachTime(uint64_t a1, uint64_t a2, double a3, double a4, double a5)
{
  LODWORD(a4) = timebase;
  LODWORD(a5) = *(_DWORD *)algn_267BA4284;
  return (double)(unint64_t)(a2 - a1)
       * (double)*(unint64_t *)&a4
       / (double)*(unint64_t *)&a5
       / 1000000000.0;
}

uint64_t perfInit()
{
  mach_timebase_info((mach_timebase_info_t)&timebase);
  uint64_t result = mach_absolute_time();
  g_initTime = result;
  return result;
}

double timeElapsedSinceInit()
{
  uint64_t v0 = g_initTime;
  if (!g_initTime)
  {
    mach_timebase_info((mach_timebase_info_t)&timebase);
    uint64_t v0 = mach_absolute_time();
    g_initTime = v0;
  }
  uint64_t v1 = mach_absolute_time();
  LODWORD(v2) = timebase;
  LODWORD(v3) = *(_DWORD *)algn_267BA4284;
  return (double)(v1 - v0) * (double)v2 / (double)v3 / 1000000000.0;
}

double timestampToSeconds(unint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a3) = timebase;
  LODWORD(a4) = *(_DWORD *)algn_267BA4284;
  return (double)a1 * (double)*(unint64_t *)&a3 / (double)*(unint64_t *)&a4 / 1000000000.0;
}

void sReleasePixelMemory(void *a1, const void *a2)
{
  if (a1) {
    free(a1);
  }
}

void sReleaseCVPixelBuffer(__CVBuffer *a1, const void *a2)
{
  if (a1)
  {
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    CVPixelBufferRelease(a1);
  }
}

void sub_2178C34A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178C42B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2178C4380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMURemoteViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!MarkupUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __MarkupUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2642A9EF0;
    uint64_t v6 = 0;
    MarkupUILibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
    unint64_t v2 = (void *)v4[0];
    if (!MarkupUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MURemoteViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    unint64_t v2 = (void *)__getMURemoteViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMURemoteViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MarkupUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MarkupUILibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void sub_2178C54C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2178C5548(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2178C55EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2178C5688(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void DCAccessibilityPerformBlockOnMainThreadAfterDelay(void *a1, double a2)
{
  id v3 = a1;
  id v4 = +[DCDispatchAfterHandler appLifeCycleHandler];
  [v4 dispatchAfter:0 stringIdentifier:v3 withBlock:a2];
}

void DCAccessibilityPostAnnouncementNotification(void *a1, void *a2)
{
}

void DCAccessibilityPostAnnouncementNotificationWithPriority(void *a1, void *a2, uint64_t a3)
{
  id v7 = a1;
  id v5 = a2;
  uint64_t v6 = +[DCAccessibility sharedInstance];
  if ([v6 dcaxRespondsToSelector:sel_postAnnouncement_withSender_priority_ fromExtrasProtocol:&unk_26C818858])objc_msgSend(v6, "postAnnouncement:withSender:priority:", v5, v7, a3); {
}
  }

void DCAccessibilityPostHighPriorityAnnouncementNotification(void *a1, void *a2)
{
}

uint64_t DCAccessibilityNeedsAccessibilityElements()
{
  uint64_t v0 = +[DCAccessibility sharedInstance];
  if ([v0 dcaxRespondsToSelector:sel_needsAccessibilityElements fromExtrasProtocol:&unk_26C818858])uint64_t v1 = objc_msgSend(v0, "needsAccessibilityElements"); {
  else
  }
    uint64_t v1 = 0;

  return v1;
}

uint64_t DCAccessibilityLocalizedUnsignedInteger(uint64_t a1)
{
  return [MEMORY[0x263F08A30] dcaxLocalizedUnsignedInteger:a1];
}

uint64_t DCAccessibilityLocalizedNumber(uint64_t a1)
{
  return [MEMORY[0x263F08A30] dcaxLocalizedNumber:a1];
}

uint64_t DCAccessibilityLocalizedPercent()
{
  return objc_msgSend(MEMORY[0x263F08A30], "dcaxLocalizedPercentage:");
}

id __DCAccessibilityStringForVariables(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  objc_opt_class();
  objc_opt_class();
  double v11 = [MEMORY[0x263F089D8] stringWithString:&stru_26C7D5180];
  if (objc_opt_isKindOfClass())
  {
    id v12 = v10;
  }
  else
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v13 = 0;
      goto LABEL_7;
    }
    id v12 = [v10 string];
  }
  double v13 = v12;
LABEL_7:
  if ([v13 length]) {
    [v11 appendString:v13];
  }
  double v20 = (id *)&a9;
  if (a1) {
    double v14 = @", ";
  }
  else {
    double v14 = @" ";
  }
  while (1)
  {
    CGRect v15 = v20++;
    id v16 = *v15;
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
LABEL_16:
      BOOL v18 = v17;
      goto LABEL_18;
    }
    if (objc_opt_isKindOfClass())
    {
      id v17 = [v16 string];
      goto LABEL_16;
    }
    BOOL v18 = 0;
LABEL_18:
    if (![v18 length]) {
      goto LABEL_23;
    }
    if ([v18 isEqualToString:@"__DCAccessibilityStringForVariablesSentinel"]) {
      break;
    }
    if ([v11 length]) {
      [v11 appendString:v14];
    }
    [v11 appendString:v18];
LABEL_23:
  }

  return v11;
}

BOOL DCTSDTransformsDifferOnlyByTranslation(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

CGPath *DCTSDCreatePathFromTransformedRect(const CGAffineTransform *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  Mutable = CGPathCreateMutable();
  v12.origin.CGFloat x = a2;
  v12.origin.CGFloat y = a3;
  v12.size.CGFloat width = a4;
  v12.size.CGFloat height = a5;
  CGPathAddRect(Mutable, a1, v12);
  return Mutable;
}

float64x2_t DCTSDTransformedCornersOfRect(float64x2_t *a1, double *a2, double *a3, double *a4, double *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&a6);
  v23.origin.CGFloat x = a6;
  v23.origin.CGFloat y = a7;
  v23.size.CGFloat width = a8;
  v23.size.CGFloat height = a9;
  CGFloat MinY = CGRectGetMinY(v23);
  v24.origin.CGFloat x = a6;
  v24.origin.CGFloat y = a7;
  v24.size.CGFloat width = a8;
  v24.size.CGFloat height = a9;
  CGFloat MaxX = CGRectGetMaxX(v24);
  v25.origin.CGFloat x = a6;
  v25.origin.CGFloat y = a7;
  v25.size.CGFloat width = a8;
  v25.size.CGFloat height = a9;
  CGFloat MaxY = CGRectGetMaxY(v25);
  *a2 = MinX;
  a2[1] = MinY;
  *a3 = MinX;
  a3[1] = MaxY;
  *a4 = MaxX;
  a4[1] = MaxY;
  *a5 = MaxX;
  a5[1] = MinY;
  *(float64x2_t *)a2 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a2[1]), *a1, *a2));
  *(float64x2_t *)a3 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a3[1]), *a1, *a3));
  *(float64x2_t *)a4 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a4[1]), *a1, *a4));
  float64x2_t result = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a5[1]), *a1, *a5));
  *(float64x2_t *)a5 = result;
  return result;
}

CGAffineTransform *DCTSDAffineTransformShear@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  t1.a = 1.0;
  t1.b = a3;
  t1.c = a4;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&t1.d = _Q0;
  t1.tCGFloat y = 1.0;
  long long v9 = a1[1];
  *(_OWORD *)&v11.a = *a1;
  *(_OWORD *)&v11.c = v9;
  *(_OWORD *)&v11.tCGFloat x = a1[2];
  return CGAffineTransformConcat(a2, &t1, &v11);
}

long double DCTSDTransformAngle(double *a1)
{
  double v2 = *a1;
  double v1 = a1[1];
  if (v1 * a1[2] - *a1 * a1[3] > 0.0)
  {
    double v2 = -v2;
    double v1 = -v1;
  }
  return atan2(v1, v2) * 57.2957795;
}

BOOL DCTSDIsTransformFlipped(double *a1)
{
  return a1[2] * a1[1] - *a1 * a1[3] > 0.0;
}

double DCTSDTransformScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

double DCTSDTransformIsValid(double *a1)
{
  double v1 = fabs(*a1 * a1[3] - a1[1] * a1[2]);
  double result = 0.0;
  if (v1 >= 0.001 && v1 != INFINITY && fabs(a1[4]) != INFINITY)
  {
    double v3 = fabs(a1[5]);
    BOOL v4 = v3 < INFINITY;
    BOOL v5 = v3 <= INFINITY;
    double result = 0.0;
    if (v4) {
      double result = 1.0;
    }
    if (!v5) {
      return 1.0;
    }
  }
  return result;
}

double DCTSDTransformXYScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

CGAffineTransform *DCTSDTransformNormalizeScale@<X0>(uint64_t a1@<X0>, CGAffineTransform *a2@<X8>)
{
  CGFloat v2 = 1.0 / sqrt(*(double *)(a1 + 8) * *(double *)(a1 + 8) + *(double *)a1 * *(double *)a1);
  CGFloat v3 = 1.0 / sqrt(*(double *)(a1 + 24) * *(double *)(a1 + 24) + *(double *)(a1 + 16) * *(double *)(a1 + 16));
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v6.a = *(_OWORD *)a1;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tCGFloat x = *(_OWORD *)(a1 + 32);
  return CGAffineTransformScale(a2, &v6, v2, v3);
}

BOOL DCTSDIsTransformAxisAlignedWithObjectSize(double *a1, double a2, double a3)
{
  double v3 = 1.0 / (a2 * 0.5);
  double v4 = 1.0 / (a3 * 0.5);
  if (v3 >= v4) {
    double v3 = v4;
  }
  double v5 = fabs(a1[3]);
  if (fabs(*a1) < v3 && v5 < v3) {
    return 1;
  }
  if (fabs(a1[1]) >= v3) {
    return 0;
  }
  return fabs(a1[2]) < v3;
}

BOOL DCTSDIsTransformAxisAlignedWithThreshold(double *a1, double a2)
{
  if (fabs(*a1) < a2 && fabs(a1[3]) < a2) {
    return 1;
  }
  if (fabs(a1[1]) >= a2) {
    return 0;
  }
  return fabs(a1[2]) < a2;
}

BOOL DCTSDIsTransformAxisAligned(double *a1)
{
  if (fabs(*a1) < 1.0e-12 && fabs(a1[3]) < 1.0e-12) {
    return 1;
  }
  if (fabs(a1[1]) >= 1.0e-12) {
    return 0;
  }
  return fabs(a1[2]) < 1.0e-12;
}

BOOL DCTSDIsTransformAxisAlignedUnflipped(double *a1)
{
  return fabs(a1[1]) < 1.0e-12 && fabs(a1[2]) < 1.0e-12 && *a1 >= 0.0 && a1[3] >= 0.0;
}

CGAffineTransform *DCTSDAffineTransformForFlips@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  uint64_t v13 = MEMORY[0x263F000D0];
  long long v14 = *MEMORY[0x263F000D0];
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a3 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a3 + 16) = v15;
  long long v16 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a3 + 32) = v16;
  if (result)
  {
    long long v31 = v15;
    long long v32 = v14;
    CGFloat v17 = a4;
    CGFloat v18 = a5;
    long long v30 = v16;
    CGFloat v19 = a6;
    double MinX = CGRectGetMinX(*(CGRect *)(&a7 - 3));
    v35.origin.CGFloat x = a4;
    v35.origin.CGFloat y = a5;
    v35.size.CGFloat width = a6;
    v35.size.CGFloat height = a7;
    CGFloat MaxX = CGRectGetMaxX(v35);
    *(_OWORD *)&v34.a = v32;
    *(_OWORD *)&v34.c = v31;
    *(_OWORD *)&v34.tCGFloat x = v30;
    CGAffineTransformTranslate((CGAffineTransform *)a3, &v34, MinX + MaxX, 0.0);
    long long v22 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v22;
    *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)(a3 + 32);
    double result = CGAffineTransformScale(&v34, &v33, -1.0, 1.0);
    long long v23 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v23;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
  }
  if (a2)
  {
    v36.origin.CGFloat x = a4;
    v36.origin.CGFloat y = a5;
    v36.size.CGFloat width = a6;
    v36.size.CGFloat height = a7;
    double MinY = CGRectGetMinY(v36);
    v37.origin.CGFloat x = a4;
    v37.origin.CGFloat y = a5;
    v37.size.CGFloat width = a6;
    v37.size.CGFloat height = a7;
    CGFloat MaxY = CGRectGetMaxY(v37);
    long long v26 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v26;
    *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)(a3 + 32);
    CGAffineTransformTranslate(&v34, &v33, 0.0, MinY + MaxY);
    long long v27 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v27;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
    long long v28 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v28;
    *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)(a3 + 32);
    double result = CGAffineTransformScale(&v34, &v33, 1.0, -1.0);
    long long v29 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v29;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
  }
  return result;
}

CGAffineTransform *DCTSDTransformFromTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v6 = a2[1];
  *(_OWORD *)&v10.a = *a2;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tCGFloat x = a2[2];
  CGAffineTransformInvert(&t1, &v10);
  long long v7 = a1[1];
  *(_OWORD *)&v10.a = *a1;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tCGFloat x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &v10);
  long long v8 = a2[1];
  *(_OWORD *)&v10.a = *a2;
  *(_OWORD *)&v10.c = v8;
  *(_OWORD *)&v10.tCGFloat x = a2[2];
  return CGAffineTransformConcat(a3, &v12, &v10);
}

CGAffineTransform *DCTSDTransformInTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  long long v5 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tCGFloat x = a2[2];
  long long v6 = a1[1];
  *(_OWORD *)&t2.a = *a1;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tCGFloat x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &t2);
  long long v7 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v7;
  *(_OWORD *)&t1.tCGFloat x = a2[2];
  CGAffineTransformInvert(&v9, &t1);
  return CGAffineTransformConcat(a3, &v12, &v9);
}

CGAffineTransform *DCTSDTransformConvertForNewOrigin@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, -a3, -a4);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeTranslation(&v13, a3, a4);
  CGAffineTransform t1 = v13;
  long long v8 = a1[1];
  *(_OWORD *)&v10.a = *a1;
  *(_OWORD *)&v10.c = v8;
  *(_OWORD *)&v10.tCGFloat x = a1[2];
  CGAffineTransformConcat(&v12, &t1, &v10);
  CGAffineTransform t1 = v14;
  return CGAffineTransformConcat(a2, &v12, &t1);
}

CGAffineTransform *DCTSDTransformMakeFree@<X0>(int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, CGFloat a7@<D4>, double a8@<D5>, double a9@<D6>, double a10@<D7>)
{
  double v18 = DCTSDDistance(a3, a4, a5, a6);
  CGFloat v38 = a7;
  double v19 = DCTSDDistance(a7, a8, a9, a10);
  if (v18 < 0.0001 || v19 < 0.0001)
  {
    return CGAffineTransformMakeTranslation((CGAffineTransform *)a2, a7 - a3, a8 - a4);
  }
  else
  {
    sCGFloat x = v19 / v18;
    double v20 = DCTSDSubtractPoints(a3, a4, a5);
    double v22 = DCTSDAngleFromDelta(v20, v21);
    double v23 = DCTSDSubtractPoints(a7, a8, a9);
    double v25 = DCTSDAngleFromDelta(v23, v24);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a2, -a3, -a4);
    CGAffineTransformMakeRotation(&t2, -v22);
    long long v26 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v26;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v44, &t1, &t2);
    long long v27 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v27;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
    double v28 = 1.0;
    if (!a1) {
      double v28 = sx;
    }
    CGAffineTransformMakeScale(&v41, sx, v28);
    long long v29 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v29;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v44, &t1, &v41);
    long long v30 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v30;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
    CGAffineTransformMakeRotation(&v40, v25);
    long long v31 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v31;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    CGAffineTransformConcat(&v44, &t1, &v40);
    long long v32 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v32;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
    CGAffineTransformMakeTranslation(&v39, v38, a8);
    long long v33 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v33;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a2 + 32);
    double result = CGAffineTransformConcat(&v44, &t1, &v39);
    long long v35 = *(_OWORD *)&v44.c;
    *(_OWORD *)a2 = *(_OWORD *)&v44.a;
    *(_OWORD *)(a2 + 16) = v35;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
  }
  return result;
}

CGFloat DCTSDTransformMakeAxisAligned@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>, double a10, double a11, double a12)
{
  double v19 = DCTSDDistance(a2, a3, a4, a5);
  double v20 = DCTSDDistance(a6, a7, a8, a9);
  if (v19 < 0.0001 || v20 < 0.0001)
  {
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, a6 - a2, a7 - a3);
  }
  else
  {
    double v21 = v20 / v19;
    if (v21 >= a10)
    {
      if (v21 > a11) {
        double v21 = a11 + (v21 - a11) * a12;
      }
    }
    else
    {
      double v21 = (v21 - a10) * a12 * 0.5 + a10;
    }
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, (a2 + a4) * -0.5, (a3 + a5) * -0.5);
    CGAffineTransformMakeScale(&t2, v21, v21);
    long long v23 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a1;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a1 + 32);
    CGAffineTransformConcat(&v32, &t1, &t2);
    long long v24 = *(_OWORD *)&v32.c;
    *(_OWORD *)a1 = *(_OWORD *)&v32.a;
    *(_OWORD *)(a1 + 16) = v24;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
    CGAffineTransformMakeTranslation(&v29, (a6 + a8) * 0.5, (a7 + a9) * 0.5);
    long long v25 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a1;
    *(_OWORD *)&t1.c = v25;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)(a1 + 32);
    CGAffineTransformConcat(&v32, &t1, &v29);
    long long v26 = *(_OWORD *)&v32.c;
    *(_OWORD *)a1 = *(_OWORD *)&v32.a;
    *(_OWORD *)(a1 + 16) = v26;
    CGFloat result = v32.tx;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
  }
  return result;
}

CGFloat DCTSDTransformConvertingRectToRect@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D2>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>, double a8@<D7>)
{
  return DCTSDTransformConvertingRectToRectAtPercent(a1, a2, a3, a4, a5, a6, a7, a8, 1.0);
}

CGFloat DCTSDTransformConvertingRectToRectAtPercent@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D2>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>, double a8@<D7>, double a9)
{
  double v14 = DCTSDSubtractPoints(a5, a6, a2);
  double v15 = a7 / a3;
  double v16 = a8 / a4;
  double v18 = DCTSDMultiplyPointScalar(v14, v17, a9);
  CGFloat v20 = v19;
  double v21 = DCTSDInterpolatePoints(1.0, 1.0, v15, v16, a9);
  CGFloat v23 = v22;
  uint64_t v24 = MEMORY[0x263F000D0];
  long long v25 = *MEMORY[0x263F000D0];
  long long v26 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a1 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a1 + 16) = v26;
  long long v27 = *(_OWORD *)(v24 + 32);
  *(_OWORD *)(a1 + 32) = v27;
  *(_OWORD *)&v32.a = v25;
  *(_OWORD *)&v32.c = v26;
  *(_OWORD *)&v32.tCGFloat x = v27;
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v32, v18, v20);
  long long v28 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v31.a = *(_OWORD *)a1;
  *(_OWORD *)&v31.c = v28;
  *(_OWORD *)&v31.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v32, &v31, v21, v23);
  long long v29 = *(_OWORD *)&v32.c;
  *(_OWORD *)a1 = *(_OWORD *)&v32.a;
  *(_OWORD *)(a1 + 16) = v29;
  CGFloat result = v32.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
  return result;
}

double DCTSD_CGAffineTransformDecompose(uint64_t a1, uint64_t a2)
{
  double v4 = *(double *)(a1 + 8);
  double v5 = *(double *)(a1 + 16);
  double v6 = *(double *)(a1 + 24);
  double v7 = sqrt(v4 * v4 + *(double *)a1 * *(double *)a1);
  double v8 = sqrt(v6 * v6 + v5 * v5);
  double v9 = *(double *)a1 * v6 - v5 * v4;
  double v10 = -v8;
  double v11 = -v7;
  if (*(double *)a1 < v6) {
    double v10 = v8;
  }
  else {
    double v11 = v7;
  }
  if (v9 < 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = v7;
  }
  if (v9 < 0.0) {
    double v13 = v10;
  }
  else {
    double v13 = v8;
  }
  long long v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v14;
  *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v21, &v20, 1.0 / v12, 1.0 / v13);
  long long v15 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v15;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  double v16 = atan2(*(long double *)(a1 + 8), *(long double *)a1);
  long long v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v17;
  *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformRotate(&v21, &v20, -v16);
  long long v18 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v18;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  *(double *)a2 = v12;
  *(double *)(a2 + 8) = v13;
  *(double *)(a2 + 16) = v16;
  *(void *)(a2 + 24) = *(void *)a1;
  *(void *)(a2 + 32) = *(void *)(a1 + 8);
  *(void *)(a2 + 40) = *(void *)(a1 + 16);
  *(void *)(a2 + 48) = *(void *)(a1 + 24);
  *(void *)(a2 + 56) = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 64) = result;
  return result;
}

CGFloat DCTSD_CGAffineTransformCompose@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v4 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 16) = v4;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 56);
  CGFloat v5 = *(double *)(a1 + 16);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v13.a = *(_OWORD *)a2;
  *(_OWORD *)&v13.c = v6;
  *(_OWORD *)&v13.tCGFloat x = *(_OWORD *)(a2 + 32);
  CGAffineTransformRotate((CGAffineTransform *)a2, &v13, v5);
  CGFloat v7 = *(double *)a1;
  CGFloat v8 = *(double *)(a1 + 8);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v12.a = *(_OWORD *)a2;
  *(_OWORD *)&v12.c = v9;
  *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)(a2 + 32);
  CGAffineTransformScale(&v13, &v12, v7, v8);
  long long v10 = *(_OWORD *)&v13.c;
  *(_OWORD *)a2 = *(_OWORD *)&v13.a;
  *(_OWORD *)(a2 + 16) = v10;
  CGFloat result = v13.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v13.tx;
  return result;
}

double DCTSDTransformDecompose(_OWORD *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v16[9] = *MEMORY[0x263EF8340];
  long long v11 = a1[1];
  v15[0] = *a1;
  v15[1] = v11;
  v15[2] = a1[2];
  DCTSD_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)v16);
  uint64_t v12 = v16[2];
  *a2 = v16[7];
  *a3 = v16[8];
  *a4 = v12;
  double result = *(double *)v16;
  uint64_t v14 = v16[1];
  *a5 = v16[0];
  *a6 = v14;
  return result;
}

uint64_t DCTSDTransform3DDecompose(_OWORD *a1, CGFloat *a2, CGFloat *a3, CGFloat *a4, CGFloat *a5, CGFloat *a6)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v12 = a1[5];
  *(_OWORD *)&v26.m31 = a1[4];
  *(_OWORD *)&v26.m33 = v12;
  long long v13 = a1[7];
  *(_OWORD *)&v26.m41 = a1[6];
  *(_OWORD *)&v26.m43 = v13;
  long long v14 = a1[1];
  *(_OWORD *)&v26.m11 = *a1;
  *(_OWORD *)&v26.CGFloat m13 = v14;
  long long v15 = a1[3];
  *(_OWORD *)&v26.m21 = a1[2];
  *(_OWORD *)&v26.m23 = v15;
  uint64_t v16 = MEMORY[0x21D44E890](&v26);
  if (v16)
  {
    memset(&v24, 0, sizeof(v24));
    long long v17 = a1[5];
    *(_OWORD *)&v26.m31 = a1[4];
    *(_OWORD *)&v26.m33 = v17;
    long long v18 = a1[7];
    *(_OWORD *)&v26.m41 = a1[6];
    *(_OWORD *)&v26.m43 = v18;
    long long v19 = a1[1];
    *(_OWORD *)&v26.m11 = *a1;
    *(_OWORD *)&v26.CGFloat m13 = v19;
    long long v20 = a1[3];
    *(_OWORD *)&v26.m21 = a1[2];
    *(_OWORD *)&v26.m23 = v20;
    CATransform3DGetAffineTransform(&v24, &v26);
    CGAffineTransform v25 = v24;
    DCTSD_CGAffineTransformDecompose((uint64_t)&v25, (uint64_t)&v26);
    CGFloat m13 = v26.m13;
    *a2 = v26.m24;
    *a3 = v26.m31;
    *a4 = m13;
    CGFloat m12 = v26.m12;
    *a5 = v26.m11;
    *a6 = m12;
  }
  return v16;
}

void DCTSDTransformMixAffineTransforms(long long *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v7 = a1[1];
  long long v16 = *a1;
  v17[0] = v7;
  v17[1] = a1[2];
  DCTSD_CGAffineTransformDecompose((uint64_t)&v16, (uint64_t)&v18);
  long long v8 = a2[1];
  v15[0] = *a2;
  v15[1] = v8;
  v15[2] = a2[2];
  DCTSD_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)&v16);
  if ((v18 >= 0.0 || *((double *)&v16 + 1) >= 0.0) && (v19 >= 0.0 || *(double *)&v16 >= 0.0))
  {
    double v9 = __x;
  }
  else
  {
    double v18 = -v18;
    double v19 = -v19;
    double v9 = __x + dbl_21791AC20[__x < 0.0];
  }
  double v10 = fmod(v9, 6.28318531);
  __CGFloat x = v10;
  double v11 = fmod(*(long double *)v17, 6.28318531);
  *(double *)long long v17 = v11;
  if (vabdd_f64(v10, v11) > 3.14159265)
  {
    BOOL v12 = v10 <= v11;
    if (v10 > v11) {
      double v11 = v10;
    }
    long long v13 = (double *)&v16;
    if (!v12) {
      long long v13 = &v18;
    }
    v13[2] = v11 + -6.28318531;
  }
  for (uint64_t i = 0; i != 72; i += 8)
    *(double *)((char *)&v18 + i) = *(double *)((char *)&v18 + i)
                                  + (*(double *)((char *)&v17[-1] + i) - *(double *)((char *)&v18 + i)) * a4;
  DCTSD_CGAffineTransformCompose((uint64_t)&v18, a3);
}

BOOL DCTSDTransform3DNearlyEqualToTransform(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[5];
  v12[4] = a1[4];
  v12[5] = v2;
  long long v3 = a1[7];
  v12[6] = a1[6];
  v12[7] = v3;
  long long v4 = a1[1];
  v12[0] = *a1;
  v12[1] = v4;
  long long v5 = a1[3];
  v12[2] = a1[2];
  v12[3] = v5;
  long long v6 = a2[5];
  v11[4] = a2[4];
  v11[5] = v6;
  long long v7 = a2[7];
  v11[6] = a2[6];
  v11[7] = v7;
  long long v8 = a2[1];
  v11[0] = *a2;
  v11[1] = v8;
  long long v9 = a2[3];
  v11[2] = a2[2];
  v11[3] = v9;
  return DCTSDTransform3DNearlyEqualToTransformWithTolerance((double *)v12, (double *)v11, 0.01);
}

BOOL DCTSDTransform3DNearlyEqualToTransformWithTolerance(double *a1, double *a2, double a3)
{
  return vabdd_f64(*a1, *a2) < a3
      && vabdd_f64(a1[1], a2[1]) < a3
      && vabdd_f64(a1[2], a2[2]) < a3
      && vabdd_f64(a1[3], a2[3]) < a3
      && vabdd_f64(a1[4], a2[4]) < a3
      && vabdd_f64(a1[5], a2[5]) < a3
      && vabdd_f64(a1[6], a2[6]) < a3
      && vabdd_f64(a1[7], a2[7]) < a3
      && vabdd_f64(a1[8], a2[8]) < a3
      && vabdd_f64(a1[9], a2[9]) < a3
      && vabdd_f64(a1[10], a2[10]) < a3
      && vabdd_f64(a1[11], a2[11]) < a3
      && vabdd_f64(a1[12], a2[12]) < a3
      && vabdd_f64(a1[13], a2[13]) < a3
      && vabdd_f64(a1[14], a2[14]) < a3
      && vabdd_f64(a1[15], a2[15]) < a3;
}

void sub_2178D2818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2178D2C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_2178D2F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2178D3298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2178D3540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2178D3F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D4000(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2178D40E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_2178D4198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  BOOL v12 = v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_2178D4330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D43F4(_Unwind_Exception *a1)
{
  long long v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2178D44F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D4608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D47D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D4A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178D4C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178D4E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178D4EDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_2178D51C4(_Unwind_Exception *a1)
{
  long long v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2178D5310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D5764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t UIAccessibilityLibrary(void)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!UIAccessibilityLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = ___ZL26UIAccessibilityLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2642AA500;
    uint64_t v5 = 0;
    UIAccessibilityLibraryCore(char **)::frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v0 = UIAccessibilityLibraryCore(char **)::frameworkLibrary;
  double v1 = (void *)v3[0];
  if (!UIAccessibilityLibraryCore(char **)::frameworkLibrary)
  {
    double v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_2178D59EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D5AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D5B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D5D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D5DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D5F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D5F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  double v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ICDocCamViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_2178D603C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D60B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D775C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178D7F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178D83C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D8798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D893C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D8A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178D9CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_2178DDFAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178DF244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178DF34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178DF59C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178DF664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178DF754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178DFA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178DFC00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178DFD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E0150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E02F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E0418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E04CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E084C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_2178E0978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E15E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_2178E19E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E1B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E1D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E1E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E2020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E2168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  BOOL v12 = v11;

  _Unwind_Resume(a1);
}

void sub_2178E230C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E23D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E24F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E264C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E26D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E2AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E2D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E2DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E3044(_Unwind_Exception *exception_object)
{
}

void sub_2178E30E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E3170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E31FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E3940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E3C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E3EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E419C(_Unwind_Exception *a1)
{
  long long v7 = v4;

  _Unwind_Resume(a1);
}

void sub_2178E42DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E4528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  BOOL v12 = v10;

  _Unwind_Resume(a1);
}

void sub_2178E4740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E4840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v11 = v10;

  _Unwind_Resume(a1);
}

void sub_2178E4954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E49BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E4A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E4B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E4CD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E4DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E4EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E4F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E5038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E5210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E52EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E551C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E5750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E5C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E5E08(_Unwind_Exception *exception_object)
{
}

void sub_2178E5E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E5F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E60AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E61D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_2178E6240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E64A4(_Unwind_Exception *exception_object)
{
}

void sub_2178E64DC()
{
  JUMPOUT(0x2178E64D4);
}

void sub_2178E6608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E6754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E6A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E6B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E6B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E6D88(_Unwind_Exception *exception_object)
{
}

void sub_2178E6DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E6E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E6EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E6F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E70E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E7238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E72D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E7688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_2178E7C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E7DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E7EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E7FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E836C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E8454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E851C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E85A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E864C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E8B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  _Unwind_Resume(a1);
}

void sub_2178E8C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E8D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E8D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E8E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E90A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E91BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E94DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E9654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E96C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E9720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E97EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E9A14(_Unwind_Exception *exception_object)
{
}

void sub_2178E9AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E9B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178E9BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178E9D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178EA364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178EA484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178EAA5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178EABA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178EAC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178EAD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178EAE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178EAEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178EB1B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178EB4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178EBFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,void *a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x220], 8);

  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&STACK[0x330], 8);

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__4(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t __Block_byref_object_copy__774(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__775(uint64_t a1)
{
}

void sub_2178EC480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178EC7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_2178ED458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_2178ED6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178ED768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178ED7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178ED8E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178EDDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178EE038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_2178EE108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178EE43C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2178EE514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178EE580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178EE91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178EEA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178EEAEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178EEBEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178EF884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,void *a23,void *a24,void *a25,uint64_t a26,uint64_t a27,void *a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_2178EFBF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F0044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2178F01EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F02F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F05D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F0CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  _Unwind_Resume(a1);
}

void sub_2178F0F54(_Unwind_Exception *exception_object)
{
}

void sub_2178F0FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F116C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F154C(_Unwind_Exception *exception_object)
{
}

void sub_2178F15DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F16FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F17DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F18E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F1D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F1E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F1EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F2740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F2948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F2A54(_Unwind_Exception *exception_object)
{
}

void sub_2178F2ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F2B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F2DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F3084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F3554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);

  _Unwind_Resume(a1);
}

void sub_2178F37E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F38C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F3AC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F3C4C(_Unwind_Exception *exception_object)
{
}

void sub_2178F3CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F3E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F401C(_Unwind_Exception *a1)
{
  long long v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2178F4378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F4494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F477C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_2178F4880()
{
}

void sub_2178F488C()
{
}

void sub_2178F4918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F4A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v15 = v12;

  _Unwind_Resume(a1);
}

void sub_2178F4D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2178F4EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F51C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_2178F555C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F5AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_2178F5C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F5CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F6564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F6AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F71EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F7570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F76E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F77A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F7C50(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

uint64_t __UIAccessibilitySpeakAndDoNotBeInterrupted(NSString *a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  double v1 = (uint64_t (*)(void))getUIAccessibilitySpeakAndDoNotBeInterruptedSymbolLoc(void)::ptr;
  long long v8 = getUIAccessibilitySpeakAndDoNotBeInterruptedSymbolLoc(void)::ptr;
  if (!getUIAccessibilitySpeakAndDoNotBeInterruptedSymbolLoc(void)::ptr)
  {
    long long v2 = (void *)UIAccessibilityLibrary();
    v6[3] = (uint64_t)dlsym(v2, "UIAccessibilitySpeakAndDoNotBeInterrupted");
    getUIAccessibilitySpeakAndDoNotBeInterruptedSymbolLoc(void)::ptr = (_UNKNOWN *)v6[3];
    double v1 = (uint64_t (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v1)
  {
    long long v4 = (_Unwind_Exception *)-[ICRemoteDocCamViewController viewDidLoad]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return v1(0);
}

void sub_2178F7EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F80B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F82A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F85A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F883C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F8AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2178F8B48()
{
}

void sub_2178F8B50()
{
}

void sub_2178F8EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F8F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F9054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F90C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F9120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F92A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F93A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_2178F94F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F95B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F9650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F96B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F9730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F9868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  long long v17 = v15;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2178F98A8()
{
}

void sub_2178F990C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F99DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F9A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F9B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F9BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2178F9C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL26UIAccessibilityLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIAccessibilityLibraryCore(char **)::frameworkLibrarCGFloat y = result;
  return result;
}

Class ___ZL28getMarkupViewControllerClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!MarkupUILibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = ___ZL19MarkupUILibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2642AA540;
    uint64_t v6 = 0;
    MarkupUILibraryCore(char **)::frameworkLibrarCGFloat y = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!MarkupUILibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MarkupViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)___ZL28getMarkupViewControllerClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMarkupViewControllerClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL19MarkupUILibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MarkupUILibraryCore(char **)::frameworkLibrarCGFloat y = result;
  return result;
}

void *___ZL53getUIAccessibilitySpeakAndDoNotBeInterruptedSymbolLocv_block_invoke(uint64_t a1)
{
  long long v2 = (void *)UIAccessibilityLibrary();
  uint64_t result = dlsym(v2, "UIAccessibilitySpeakAndDoNotBeInterrupted");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIAccessibilitySpeakAndDoNotBeInterruptedSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

void *___ZL49getkAXAnnouncementEnteredValidStateSoundSymbolLocv_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AXRuntimeLibrary();
  uint64_t result = dlsym(v2, "kAXAnnouncementEnteredValidStateSound");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXAnnouncementEnteredValidStateSoundSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

uint64_t AXRuntimeLibrary(void)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AXRuntimeLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = ___ZL20AXRuntimeLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2642AA558;
    uint64_t v5 = 0;
    AXRuntimeLibraryCore(char **)::frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v0 = AXRuntimeLibraryCore(char **)::frameworkLibrary;
  double v1 = (void *)v3[0];
  if (!AXRuntimeLibraryCore(char **)::frameworkLibrary)
  {
    double v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t ___ZL20AXRuntimeLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXRuntimeLibraryCore(char **)::frameworkLibrarCGFloat y = result;
  return result;
}

void *___ZL48getkAXAnnouncementExitedValidStateSoundSymbolLocv_block_invoke(uint64_t a1)
{
  long long v2 = (void *)AXRuntimeLibrary();
  uint64_t result = dlsym(v2, "kAXAnnouncementExitedValidStateSound");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXAnnouncementExitedValidStateSoundSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void sub_2178FD318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_2178FD524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DCDynamicCast(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (objc_opt_isKindOfClass()) {
    return a2;
  }
  return 0;
}

void *DCSpecificCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 isMemberOfClass:a1]) {
    return a2;
  }
  return 0;
}

void *DCProtocolCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 conformsToProtocol:a1]) {
    return a2;
  }
  return 0;
}

void *DCClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = a1;
  if (a1)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    long long v13 = &a9;
    if (a3)
    {
      while (1)
      {
        double v11 = v13++;
        if (([v9 conformsToProtocol:*v11] & 1) == 0) {
          break;
        }
        if (!--a3) {
          return v9;
        }
      }
      return 0;
    }
  }
  return v9;
}

CFTypeRef DCCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (CFGetTypeID(cf) == a1) {
    return cf;
  }
  return 0;
}

uint64_t DCCheckedDynamicCast(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v4 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      DCCheckedDynamicCast_cold_1(v2, a1, v4);
    }

    return 0;
  }
  return v2;
}

void *DCCheckedProtocolCast(Protocol *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    long long v4 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      DCCheckedProtocolCast_cold_1(v4);
    }
  }
  if (a2 && ([a2 conformsToProtocol:a1] & 1) == 0)
  {
    uint64_t v5 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      if (a1) {
        Name = protocol_getName(a1);
      }
      else {
        Name = "<No protocol supplied>";
      }
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      BOOL v12 = Name;
      _os_log_error_impl(&dword_217885000, v5, OS_LOG_TYPE_ERROR, "Unexpected object type in checked protocol cast %@ expects %s", (uint8_t *)&v9, 0x16u);
    }

    return 0;
  }
  return a2;
}

id getMarkupViewControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMarkupViewControllerClass_softClass;
  uint64_t v7 = getMarkupViewControllerClass_softClass;
  if (!getMarkupViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getMarkupViewControllerClass_block_invoke;
    v3[3] = &unk_2642A9738;
    v3[4] = &v4;
    __getMarkupViewControllerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2178FD9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMarkupViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!MarkupUILibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __MarkupUILibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2642AA5F8;
    uint64_t v6 = 0;
    MarkupUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!MarkupUILibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MarkupViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)___ZL28getMarkupViewControllerClassv_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMarkupViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MarkupUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MarkupUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t dc_orientationByRotatingLeft(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return qword_21791AD20[a1];
  }
}

uint64_t dc_orientationByRotatingRight(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return qword_21791AD60[a1];
  }
}

uint64_t dc_clockwiseRotationsFromUpToMatchOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return qword_21791ADA0[a1 - 1];
  }
}

uint64_t dc_counterClockwiseRotationsFromUpToMatchOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return qword_21791ADD8[a1 - 1];
  }
}

uint64_t DCTransformFromImageOrientation@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v4 = MEMORY[0x263F000D0];
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a2 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a2 + 16) = v5;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v4 + 32);
  switch(result)
  {
    case 1:
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0xBFF0000000000000;
      goto LABEL_4;
    case 2:
      *(_OWORD *)a2 = xmmword_21791AA30;
      *(_OWORD *)(a2 + 16) = xmmword_21791AD10;
      goto LABEL_8;
    case 3:
      *(_OWORD *)a2 = xmmword_21791AD00;
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 16) = 0x3FF0000000000000;
      goto LABEL_10;
    case 4:
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0x3FF0000000000000;
LABEL_8:
      *(double *)(a2 + 32) = a3;
      *(void *)(a2 + 40) = 0;
      return result;
    case 5:
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)a2 = 0x3FF0000000000000;
      *(_OWORD *)(a2 + 24) = xmmword_21791AD10;
      goto LABEL_10;
    case 6:
    case 7:
      *(_OWORD *)a2 = xmmword_21791AD00;
      *(_OWORD *)(a2 + 16) = xmmword_21791AD10;
LABEL_4:
      *(double *)(a2 + 32) = a3;
LABEL_10:
      *(double *)(a2 + 40) = a4;
      break;
    default:
      return result;
  }
  return result;
}

__CFString *dc_nonLocalizedOrientationNameForType(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return off_2642AA640[a1];
  }
}

uint64_t dc_orientationFromNonLocalizedName(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"DCImageClassOrientationUp"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"DCImageClassOrientationDown"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"DCImageClassOrientationLeft"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"DCImageClassOrientationRight"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"DCImageClassOrientationUpMirrored"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"DCImageClassOrientationDownMirrored"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"DCImageClassOrientationLeftMirrored"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"DCImageClassOrientationRightMirrored"])
  {
    uint64_t v2 = 7;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_2179037F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_21790784C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_217908B68(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_217908FEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217909548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_21790B1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_21790C000(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21790C0B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21790C130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21790C1F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21790C37C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21790C434(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21790C580(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21790C5FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21790CA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

double DCTSURound(double a1)
{
  return round(a1);
}

double DCTSUFractionalPart(double a1)
{
  BOOL v1 = a1 <= 0.0;
  double v2 = -(-a1 - floor(-a1));
  double result = a1 - floor(a1);
  if (v1) {
    return v2;
  }
  return result;
}

double DCTSUClamp(double a1, double a2, double a3)
{
  if (a1 >= a2)
  {
    a2 = a1;
    if (a1 > a3) {
      return a3;
    }
  }
  return a2;
}

double DCTSUMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double DCTSURandom()
{
  return (double)random() / 2147483650.0;
}

double DCTSURandomBetween(double a1, double a2)
{
  return a1 + (a2 - a1) * ((double)random() / 2147483650.0);
}

double DCTSUReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double DCTSUSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
}

uint64_t __getVKCImageAnalyzerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVKCImageAnalyzerRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVKCImageAnalyzerRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[DCDocCamPDFGenerator deleteAllDocCamPDFs](v0);
}

uint64_t __getVKCImageAnalysisInteractionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[DCSandboxExtension relinquish](v0);
}

uint64_t __getSidecarServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[ICDocCamImageQuadEditViewController initWithImage:quad:scanDataDelegate:orientation:completionHandler:](v0);
}

uint64_t __getMURemoteViewControllerClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return [(DCCachesDirectory *)v0 init];
}

uint64_t ___ZL28getMarkupViewControllerClassv_block_invoke_cold_1()
{
  int v0 = (uint8_t *)abort_report_np();
  return [(NSString(DC) *)v0 dc_stringByReplacingCharactersInStringMap:v2];
}

void DCCheckedDynamicCast_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 138412546;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_217885000, a3, OS_LOG_TYPE_ERROR, "Unexpected object type in checked dynamic cast %@ expects %@", (uint8_t *)&v5, 0x16u);
}

void DCCheckedProtocolCast_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Protocol is nil", v1, 2u);
}

uint64_t AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout()
{
  return MEMORY[0x270EDDF98]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x270EFB908](retstr, t);
}

BOOL CATransform3DIsAffine(CATransform3D *t)
{
  return MEMORY[0x270EFB920](t);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB970](retstr, t, sx, sy, sz);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B90](space, pattern, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x270EE5BC0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C50]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C90](baseSpace);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D08](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x270EE6298](data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithJPEGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6760](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x270EE6A80](consumer, mediaBox, auxiliaryInfo);
}

CGContextRef CGPDFContextCreateWithURL(CFURLRef url, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x270EE6A88](url, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE7108](path);
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x270EE7110](info, matrix, *(void *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
{
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x270EE7150]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x270EE7160](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x270EE7288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x270EE7AC8](allocator, target, *(void *)&attachmentMode);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B10](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7B60](allocator, *(void *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x270EE7C30](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C68](retstr, sbuf);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x270EE7DE0](time, allocator);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

CGSize CMVideoFormatDescriptionGetPresentationDimensions(CMVideoFormatDescriptionRef videoDesc, Boolean usePixelAspectRatio, Boolean useCleanAperture)
{
  MEMORY[0x270EE7FF0](videoDesc, usePixelAspectRatio, useCleanAperture);
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

uint64_t CTFontDescriptorCreateWithTextStyle()
{
  return MEMORY[0x270EE9B78]();
}

CFTypeRef CVBufferGetAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x270EE9FD0](buffer, key, attachmentMode);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1D0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA258](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x270F96018]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F05EE8]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F05FC8](category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F06070](image, compressionQuality);
}

void UISaveVideoAtPathToSavedPhotosAlbum(NSString *videoPath, id completionTarget, SEL completionSelector, void *contextInfo)
{
}

BOOL UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(NSString *videoPath)
{
  return MEMORY[0x270F062B8](videoPath);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x270EE8570](inUTI, inTagClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x270F97D18]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x270F97D48]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x270F97D78]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x270F97D88]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x270F97DF0]();
}

uint64_t archive_entry_set_symlink()
{
  return MEMORY[0x270F97E10]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x270F97E58]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x270F97E78]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x270F97E88]();
}

uint64_t archive_read_finish()
{
  return MEMORY[0x270F97ED8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x270F97EF0]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x270F97EF8]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x270F97F20]();
}

uint64_t archive_read_support_compression_all()
{
  return MEMORY[0x270F97F48]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x270F97F68]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x270F97FA8]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x270F97FB0]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x270F97FB8]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x270F97FC0]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x270F97FD0]();
}

uint64_t archive_write_finish()
{
  return MEMORY[0x270F97FD8]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x270F97FE0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x270F97FF0]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x270F97FF8]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x270F98018]();
}

uint64_t archive_write_set_compression_bzip2()
{
  return MEMORY[0x270F98028]();
}

uint64_t archive_write_set_compression_none()
{
  return MEMORY[0x270F98038]();
}

uint64_t archive_write_set_format_pax()
{
  return MEMORY[0x270F98070]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x270F98088]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x270F9AAD0](p);
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDB138](a1, a2, a3);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void vDSP_f5x5(const float *__A, vDSP_Length __NR, vDSP_Length __NC, const float *__F, float *__C)
{
}

void vDSP_normalize(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, float *__Mean, float *__StandardDeviation, vDSP_Length __N)
{
}

void vDSP_vfltu8(const unsigned __int8 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDF090](src, dest, *(void *)&flags, maxFloat, minFloat);
}