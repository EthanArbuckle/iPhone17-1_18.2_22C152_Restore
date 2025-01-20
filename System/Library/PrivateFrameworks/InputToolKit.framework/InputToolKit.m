double ITKOffsetForEdgeOfFrame(int a1, double a2, double a3, double a4, double a5)
{
  double result;

  switch(a1)
  {
    case 0:
      result = CGRectGetMinX(*(CGRect *)&a2);
      break;
    case 1:
      result = CGRectGetMidX(*(CGRect *)&a2);
      break;
    case 2:
      result = CGRectGetMaxX(*(CGRect *)&a2);
      break;
    case 3:
      result = CGRectGetMinY(*(CGRect *)&a2);
      break;
    case 4:
      result = CGRectGetMidY(*(CGRect *)&a2);
      break;
    case 5:
      result = CGRectGetMaxY(*(CGRect *)&a2);
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

double ITKRectWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

double ITKRectWithPoints(double a1, double a2, double a3)
{
  if (a1 >= a3) {
    return a3;
  }
  else {
    return a1;
  }
}

double ITKRectWithSize()
{
  return 0.0;
}

double ITKRectWithSizeAlignedToRect(int a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
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

BOOL ITKNearlyEqualPoints(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.01;
  return vabdd_f64(a2, a4) < 0.01 && v4;
}

BOOL ITKNearlyEqualPointsWithThreshold(double a1, double a2, double a3, double a4, double a5)
{
  BOOL v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

BOOL ITKNearlyEqualSizes(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.01;
  return vabdd_f64(a2, a4) < 0.01 && v4;
}

BOOL ITKNearlyEqualSizesWithThreshold(double a1, double a2, double a3, double a4, double a5)
{
  BOOL v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

BOOL ITKNearlyEqualTransforms(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) < 0.000000001
      && vabdd_f64(a1[1], a2[1]) < 0.000000001
      && vabdd_f64(a1[2], a2[2]) < 0.000000001
      && vabdd_f64(a1[3], a2[3]) < 0.000000001
      && vabdd_f64(a1[4], a2[4]) < 0.000000001
      && vabdd_f64(a1[5], a2[5]) < 0.000000001;
}

BOOL ITKNearlyEqualRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL result = 0;
  if (vabdd_f64(a1, a5) < 0.01 && vabdd_f64(a2, a6) < 0.01)
  {
    BOOL v9 = vabdd_f64(a3, a7) < 0.01;
    return vabdd_f64(a4, a8) < 0.01 && v9;
  }
  return result;
}

BOOL ITKNearlyEqualRectsWithThreshold(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v17 = vabdd_f64(a2, a6);
  if (vabdd_f64(a1, a5) >= a9 || v17 >= a9) {
    return 0;
  }
  BOOL v20 = vabdd_f64(a3, a7) < a9;
  return vabdd_f64(a4, a8) < a9 && v20;
}

BOOL ITKNearlyContainsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v18 = CGRectInset(*(CGRect *)&a1, -0.01, -0.01);
  double v12 = a5;
  double v13 = a6;
  double v14 = a7;
  double v15 = a8;

  return CGRectContainsRect(v18, *(CGRect *)&v12);
}

BOOL ITKCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return fabs((a3 - a1) * (a6 - a2) - (a4 - a2) * (a5 - a1)) < 8.90029543e-308;
}

BOOL ITKNearlyCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 - a1;
  return (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) * (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) < ((a4 - a2) * (a4 - a2)
                                                                                              + v6 * v6)
                                                                                             * 0.0001
                                                                                             * ((a6 - a2) * (a6 - a2)
                                                                                              + (a5 - a1) * (a5 - a1));
}

double ITKDistanceSquared(double a1, double a2, double a3, double a4)
{
  return (a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3);
}

BOOL ITKRectsOverlapVertically(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
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

BOOL ITKRectsOverlapHorizontally(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
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

uint64_t ITKLineIntersectsRect(CGFloat a1, CGFloat a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
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
    int v21 = ITKLineIntersectsRect(1, a1, a2, v19, v20, a5, a6, a7, a8);
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

double ITKAveragePoints(double a1, double a2, double a3)
{
  return (a1 + a3) * 0.5;
}

double ITKNearestPointOnInfiniteLineToPoint(double *a1, double a2, double a3)
{
  double v3 = a1[1];
  double v4 = a1[2] - *a1;
  double v5 = a1[3] - v3;
  double v6 = 1.0 / sqrt(v5 * v5 + v4 * v4);
  return *a1 + v4 * v6 * ((a3 - v3) * (v5 * v6) + (a2 - *a1) * (v4 * v6));
}

double ITKNormalizePoint(double a1, double a2)
{
  return a1 * (1.0 / sqrt(a2 * a2 + a1 * a1));
}

double ITKSubtractPoints(double a1, double a2, double a3)
{
  return a1 - a3;
}

double ITKDotPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double ITKAddPoints(double a1, double a2, double a3)
{
  return a1 + a3;
}

double ITKMultiplyPointScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

double ITKNearestPointOnLineSegmentToPoint(double *a1, double a2, double a3)
{
  double v4 = *a1;
  double v5 = a1[1];
  double result = a1[2];
  double v7 = result - *a1;
  double v8 = a1[3] - v5;
  double v9 = sqrt(v8 * v8 + v7 * v7);
  if (v9 <= 0.0) {
    return *a1;
  }
  double v10 = v7 * (1.0 / v9);
  double v11 = (a3 - v5) * (v8 * (1.0 / v9)) + (a2 - v4) * v10;
  if (v11 <= 0.0) {
    return *a1;
  }
  if (v11 < v9) {
    return v4 + v10 * v11;
  }
  return result;
}

double ITKPointLength(double a1, double a2)
{
  return sqrt(a2 * a2 + a1 * a1);
}

uint64_t ITKDistanceFromLineToLineAtPoint(double *a1, double *a2)
{
  uint64_t v5 = 0;
  v3[0] = 0.0;
  v3[1] = 0.0;
  return ITKIntersectionOfLines(a1, a2, (double *)&v5, &v4, v3, 1, 1);
}

uint64_t ITKIntersectionOfLines(double *a1, double *a2, double *a3, double *a4, double *a5, char a6, char a7)
{
  double v7 = a1[1];
  double v8 = a1[2] - *a1;
  double v9 = a1[3] - v7;
  double v10 = a2[1];
  double v11 = a2[2] - *a2;
  double v12 = a2[3] - v10;
  double v13 = (v9 * (*a2 - *a1) + (v7 - v10) * v8) / (v12 * v8 - v11 * v9);
  *a4 = v13;
  if ((a6 & 1) == 0 && (v13 < 0.0 || v13 > 1.0)) {
    return 0;
  }
  double v15 = (v12 * (*a1 - *a2) + (a2[1] - a1[1]) * v11) / (v9 * v11 - v8 * v12);
  *a3 = v15;
  if ((a7 & 1) == 0 && (v15 < 0.0 || v15 > 1.0)) {
    return 0;
  }
  double v18 = a1[1];
  *a5 = *a1 + v15 * v8;
  a5[1] = v18 + *a3 * v9;
  return 1;
}

double ITKDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double ITKMidpointOnLineSegment(double a1, double a2, double a3)
{
  return (a1 + a3) * 0.5;
}

BOOL ITKSizeIsEmpty(double a1, double a2)
{
  return a2 == 0.0 || a1 == 0.0;
}

uint64_t ITKSizeIsEmptyOrHasNanOrInf(double a1, double a2)
{
  uint64_t result = 1;
  if (a1 != 0.0)
  {
    BOOL v3 = fabs(a2) == INFINITY;
    if (fabs(a1) == INFINITY) {
      BOOL v3 = 1;
    }
    return a2 == 0.0 || v3;
  }
  return result;
}

uint64_t ITKSizeHasNaNComponents()
{
  return 0;
}

uint64_t ITKSizeHasInfComponents(double a1, double a2)
{
  BOOL v2 = fabs(a2) == INFINITY;
  return fabs(a1) == INFINITY || v2;
}

double ITKSizeWithMaxArea(double result, double a2, double a3, double a4)
{
  if (result * a2 <= a3 * a4) {
    return a3;
  }
  return result;
}

double ITKSizeRatioFromSizes(double a1, double a2, double a3)
{
  return a1 / a3;
}

double ITKUnionRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
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

double ITKHorizontalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
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

double ITKVerticalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
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

BOOL ITKIntersectsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
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

BOOL ITKPointInRectInclusive(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 + a5;
  return a1 >= a3 && a1 <= v6 && a2 >= a4 && a2 <= a4 + a6;
}

double ITKAddSizes(double a1, double a2, double a3)
{
  return a1 + a3;
}

double ITKSubtractSizes(double a1, double a2, double a3)
{
  return a1 - a3;
}

double ITKMultiplyPointBySize(double a1, double a2, double a3)
{
  return a1 * a3;
}

double ITKMultiplySizeScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

double ITKMultiplyRectScalar(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
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

double ITKFlooredPoint(double a1)
{
  return floor(a1);
}

double ITKPointMin(double result, double a2, double a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

double ITKPointMax(double result, double a2, double a3)
{
  if (result < a3) {
    return a3;
  }
  return result;
}

double ITKSizeGetArea(double a1, double a2)
{
  return a1 * a2;
}

double ITKPointSquaredLength(double a1, double a2)
{
  return a2 * a2 + a1 * a1;
}

double ITKOrthogonalDistance(double a1, double a2, double a3, double a4)
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

void ITKDistanceToRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
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

double ITKDistanceToRectFromRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v23.origin.double x = a1;
  v23.origin.y = a2;
  v23.size.double width = a3;
  v23.size.height = a4;
  double MidY = CGRectGetMidY(v23);
  double v16 = ITKClamp(MidX, a5, a5 + a7);
  double v17 = ITKClamp(MidY, a6, a6 + a8);
  double v18 = ITKClamp(v16, a1, a1 + a3);
  double v19 = ITKClamp(v17, a2, a2 + a4);
  return sqrt((v17 - v19) * (v17 - v19) + (v16 - v18) * (v16 - v18));
}

double ITKClampPointInRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v9 = ITKClamp(a1, a3, a3 + a5);
  ITKClamp(a2, a4, a4 + a6);
  return v9;
}

double ITKCenterOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.y = a2;
  v10.size.double width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

BOOL ITKPercentRectInsideRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v9 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  return CGRectEqualToRect(v9, *MEMORY[0x263F001A0]);
}

double ITKRectGetMaxPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.y = a2;
  v10.size.double width = a3;
  v10.size.height = a4;
  CGRectGetMaxY(v10);
  return MaxX;
}

double ITKComplexMultiplyPoint(double a1, double a2, double a3, double a4)
{
  return a1 * a3 - a2 * a4;
}

double ITKCrossPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a3 - a1 * a4;
}

double ITKGrowRectToPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
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

double ITKFlipRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRectGetMidY(*(CGRect *)&a1);
  v14.origin.double x = a5;
  v14.origin.y = a6;
  v14.size.double width = a7;
  v14.size.height = a8;
  CGRectGetMidY(v14);
  return a1;
}

double ITKCenterRectOverRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
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

BOOL ITKRectIsFinite(double a1, double a2, double a3, double a4)
{
  BOOL result = 0;
  if (fabs(a1) != INFINITY && fabs(a2) != INFINITY && fabs(a3) != INFINITY)
  {
    double v5 = fabs(a4);
    return v5 > INFINITY || v5 < INFINITY;
  }
  return result;
}

BOOL ITKRectHasArea(double a1, double a2, double a3, double a4)
{
  BOOL result = 0;
  if (fabs(a1) != INFINITY && fabs(a2) != INFINITY && fabs(a3) != INFINITY && fabs(a4) != INFINITY) {
    return a4 != 0.0 && a3 != 0.0;
  }
  return result;
}

void ITKRectDivide(CGRect *a1, CGRect *a2, CGRectEdge a3, double a4, double a5, double a6, double a7, CGFloat a8)
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

uint64_t ITKGetCanvasSpaceCorners(uint64_t a1, _OWORD *a2, _OWORD *a3, _OWORD *a4, _OWORD *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  v53[2] = *(double *)MEMORY[0x263EF8340];
  long long v18 = *(_OWORD *)(a1 + 16);
  float64x2_t v46 = *(float64x2_t *)a1;
  long long v47 = v18;
  long long v48 = *(_OWORD *)(a1 + 32);
  ITKTransformedCornersOfRect(&v46, &v49, &v51, &v52, v53, a6, a7, a8, a9);
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
  BOOL v33 = ITKIsTransformFlipped(v46.f64);
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

double ITKAngleFromDelta(long double a1, long double a2)
{
  return atan2(a2, a1);
}

void ITKNormalizeAngleInDegrees(long double a1)
{
}

double ITKInterpolatePoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double ITKMixPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

uint64_t ITKMixBOOLs(uint64_t result, unsigned int a2, double a3)
{
  if (a3 > 0.5) {
    return a2;
  }
  else {
    return result;
  }
}

double ITKMixFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

void ITKMixAnglesInDegrees(long double a1, long double a2, double a3)
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

double ITKMixAnglesInRadians(double a1, double a2, double a3)
{
  ITKMixAnglesInDegrees(a1 * 57.2957795, a2 * 57.2957795, a3);
  return v3 * 0.0174532925;
}

double ITKMixSizes(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double ITKMixRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 * a9 + a1 * (1.0 - a9);
}

double ITKSizeWithMaxSize(double result, double a2, double a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

double ITKClipRectToMaxY(double a1, double a2, double a3, double a4)
{
  return a1;
}

double ITKClipRectToMinY(double a1, double a2, double a3, double a4)
{
  return a1;
}

double ITKTranslatedRectMaximizingOverlapWithRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
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

double ITKOriginRotate(double *a1, double a2, double a3)
{
  __double2 v5 = __sincos_stret(a3);
  double result = v5.__sinval * a2;
  *a1 = v5.__cosval * a2;
  a1[1] = v5.__sinval * a2;
  return result;
}

double ITKNiceAngleFromDelta(long double a1, long double a2)
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

double ITKDeltaFromAngle(double a1)
{
  if (a1 == 0.0) {
    return 1.0;
  }
  return __sincos_stret(a1).__cosval;
}

double ITKShiftConstrainDelta(long double a1, long double a2)
{
  long double v4 = atan2(a2, a1);
  return sqrt(a2 * a2 + a1 * a1)
       * __sincos_stret((double)(int)((v4 + 6.28318531) / 0.785398163 + 0.5) * 0.785398163).__cosval;
}

double ITKShiftConstrainDeltaToAngle(double a1, double a2, double a3)
{
  return __sincos_stret(a3).__cosval * sqrt(a2 * a2 + a1 * a1);
}

double ITKRotatePoint90Degrees(int a1, double a2, double a3)
{
  if (a1) {
    return -a3;
  }
  else {
    return a3;
  }
}

void ITKNormalizeSignedDifferenceAngleInDegrees(double a1, double a2)
{
}

double ITKNormalizeDifferenceAngleInDegrees(double a1, double a2)
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

void ITKNormalizeAngleInRadians(long double a1)
{
}

void ITKNormalizeAngleAboutZeroInRadians(double a1)
{
}

double ITKDeltaApplyAffineTransform(float64x2_t *a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vsubq_f64(vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a3), *a1, a2)), vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], *(double *)(MEMORY[0x263F00148] + 8)), *a1, *MEMORY[0x263F00148])));
  return result;
}

void ITKDistanceBetweenAnglesInRadians(long double a1, long double a2)
{
}

double ITKNormalizedAngleBetweenPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a3 - a1;
  double v7 = a4 - a2;
  double v8 = 1.0 / sqrt(v7 * v7 + v6 * v6);
  double v9 = a5 - a1;
  double v10 = a6 - a2;
  double v11 = 1.0 / sqrt(v10 * v10 + v9 * v9);
  return acos(v7 * v8 * (v10 * v11) + v6 * v8 * (v9 * v11));
}

long double ITKAngleBetweenPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v10 = atan2(a6 - a4, a5 - a3);
  return v10 - atan2(a2 - a4, a1 - a3);
}

double ITKRotationFromTransform(uint64_t a1)
{
  return atan2(*(long double *)(a1 + 8), *(long double *)(a1 + 24));
}

double ITKNormalizedPointInRect(double a1, double a2, double a3, double a4, double a5)
{
  return (a1 - a3) / a5;
}

double ITKPointFromNormalizedRect(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

double ITKPointByExtendingLineFromPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a1
       + (sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3)) + a5)
       * ((a3 - a1)
        * (1.0
         / sqrt((a4 - a2) * (a4 - a2) + (a3 - a1) * (a3 - a1))));
}

double ITKSlopeOfLine(double a1, double a2, double a3, double a4)
{
  return (a4 - a2) / (a3 - a1);
}

double ITKAngleOfLine(double a1, double a2, double a3, double a4)
{
  return atan((a4 - a2) / (a3 - a1));
}

void ITKRectFromNormalizedSubrect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v16.origin.double x = a5;
  v16.origin.y = a6;
  v16.size.double width = a7;
  v16.size.height = a8;
  if (!CGRectIsInfinite(v16))
  {
    v17.origin.double x = a1;
    v17.origin.y = a2;
    v17.size.double width = a3;
    v17.size.height = a4;
    if (!CGRectIsInfinite(v17))
    {
      v18.origin.double x = a5;
      v18.origin.y = a6;
      v18.size.double width = a7;
      v18.size.height = a8;
      if (!CGRectIsNull(v18))
      {
        v19.origin.double x = a1;
        v19.origin.y = a2;
        v19.size.double width = a3;
        v19.size.height = a4;
        if (!CGRectIsNull(v19))
        {
          v20.origin.double x = a5;
          v20.origin.y = a6;
          v20.size.double width = a7;
          v20.size.height = a8;
          CGRectGetMaxX(v20);
          v21.origin.double x = a5;
          v21.origin.y = a6;
          v21.size.double width = a7;
          v21.size.height = a8;
          CGRectGetMaxY(v21);
        }
      }
    }
  }
}

void ITKNormalizedSubrectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (!CGRectIsInfinite(*(CGRect *)&a1))
  {
    v16.origin.double x = a5;
    v16.origin.y = a6;
    v16.size.double width = a7;
    v16.size.height = a8;
    if (!CGRectIsInfinite(v16))
    {
      v17.origin.double x = a1;
      v17.origin.y = a2;
      v17.size.double width = a3;
      v17.size.height = a4;
      if (!CGRectIsNull(v17))
      {
        v18.origin.double x = a5;
        v18.origin.y = a6;
        v18.size.double width = a7;
        v18.size.height = a8;
        if (!CGRectIsNull(v18))
        {
          v19.origin.double x = a1;
          v19.origin.y = a2;
          v19.size.double width = a3;
          v19.size.height = a4;
          CGRectGetMaxX(v19);
          v20.origin.double x = a1;
          v20.origin.y = a2;
          v20.size.double width = a3;
          v20.size.height = a4;
          CGRectGetMaxY(v20);
        }
      }
    }
  }
}

double ITKRectSubtractingRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
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

double ITKRectFromAddingSize(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v12.origin.CGFloat x = a1;
  v12.origin.CGFloat y = a2;
  v12.size.CGFloat width = a3;
  v12.size.CGFloat height = a4;
  CGRectGetMidY(v12);
  return MidX - (a3 + a5 + a5) * 0.5;
}

double ITKRectWithTopRightPoint(double a1, double a2, double a3)
{
  return a3 - a1;
}

double ITKRectWithBottomRightPoint(double a1, double a2, double a3)
{
  return a3 - a1;
}

double ITKRectWithTopLeftPoint(double a1, double a2, double a3)
{
  return a3;
}

double ITKRectWithBottomLeftPoint(double a1, double a2, double a3)
{
  return a3;
}

double ITKAspectRatio(double a1, double a2)
{
  double result = a1 / a2;
  if (a2 == 0.0) {
    return 0.0;
  }
  return result;
}

double ITKSizeWithAspectRatio(int a1, double result, double a3, double a4, double a5)
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

double ITKSizeExpandedToMatchAspectRatio(double result, double a2, double a3, double a4)
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

double ITKScaleSizeWithinSize(double a1, double a2, double a3, double a4)
{
  if (a1 / a2 < a3 / a4) {
    return a1 * (a4 / a2);
  }
  return a3;
}

double ITKShrinkSizeToFitInSize(double result, double a2, double a3, double a4)
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

double ITKFitOrFillSizeInSize(int a1, double a2, double a3, double a4, double a5)
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

double ITKFitOrFillSizeInRect(int a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
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
  return ITKCenterRectOverRect(0.0, 0.0, a2 * v13, a3 * v13, a4, a5, a6, a7);
}

void ITKScaleRectAroundPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7)
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

void ITKScaledRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  double MidY = CGRectGetMidY(v13);

  ITKScaleRectAroundPoint(a1, a2, a3, a4, MidX, MidY, a5);
}

void ITKVisibleUnscaledRectForNewScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, double a8)
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
  ITKScaleRectAroundPoint(v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, v14.f64[0], v14.f64[1], a7 / a8);
}

double ITKRectWithInverseNormalizedRect(double a1, double a2, double a3)
{
  return -a1 / a3;
}

double ITKRectByExpandingBoundingRectToContentRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12)
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

double ITKClampRectToRect(double a1, double a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v23 = a5 + a7;
  double v15 = ITKClamp(a1, a5, a5 + a7);
  double v21 = a6;
  double v22 = a6 + a8;
  ITKClamp(a2, a6, a6 + a8);
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
  double v18 = ITKClamp(MaxX, a5, v23);
  ITKClamp(MaxY, v21, v22);
  if (v15 >= v18) {
    return v18;
  }
  else {
    return v15;
  }
}

double ITKAliasRound(double a1)
{
  double v1 = floor(a1);
  double v2 = a1 - v1;
  double result = ceil(a1);
  if (v2 < 0.49) {
    return v1;
  }
  return result;
}

double ITKAliasRoundedPoint(double a1)
{
  double v1 = floor(a1);
  double v2 = a1 - v1;
  double result = ceil(a1);
  if (v2 < 0.49) {
    return v1;
  }
  return result;
}

double ITKRoundForScale(double a1, double a2)
{
  return ITKRound(a1 * a2) / a2;
}

double ITKRoundedPoint(double a1, double a2)
{
  double v3 = ITKRound(a1);
  ITKRound(a2);
  return v3;
}

double ITKRoundedPointForScale(double a1, double a2, double a3)
{
  double v4 = a2 * a3;
  double v5 = ITKRound(a1 * a3);
  ITKRound(v4);
  return 1.0 / a3 * v5;
}

double ITKRoundedSize(double a1, double a2)
{
  double v3 = ITKRound(a1);
  ITKRound(a2);
  return v3;
}

double ITKCeilSize(double a1)
{
  return ceil(a1);
}

double ITKFloorSize(double a1)
{
  return floor(a1);
}

double ITKRoundedRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return ITKRoundedRectForScale(a1, a2, a3, a4, 1.0);
}

double ITKRoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v8 = a1;
  if (a5 != 0.0 && !CGRectIsNull(*(CGRect *)&a1))
  {
    v23.origin.CGFloat x = ITKMultiplyRectScalar(v8, a2, a3, a4, a5);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
    double MinX = CGRectGetMinX(v23);
    double v15 = ITKRound(MinX);
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v24);
    double v17 = ITKRound(MinY);
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v25);
    CGFloat v19 = ITKRound(MaxX) - v15;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v26);
    double v21 = ITKRound(MaxY);
    return ITKMultiplyRectScalar(v15, v17, v19, v21 - v17, 1.0 / a5);
  }
  return v8;
}

double ITKAliasRoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v8 = a1;
  if (a5 == 0.0)
  {
    +[ITKAssert handleFailedAssertWithCondition:"__objc_no" functionName:"CGRect ITKAliasRoundedRectForScale(CGRect, CGFloat)" simulateCrash:0 showAlert:0 format:@"cannot give scale = 0 for ITKRoundedRectForScale!"];
  }
  else if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v34.origin.CGFloat x = ITKMultiplyRectScalar(v8, a2, a3, a4, a5);
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
    return ITKMultiplyRectScalar(v18, v23, v33, v31 - v23, 1.0 / a5);
  }
  return v8;
}

double ITKRoundedMinX(double a1, double a2, double a3, double a4)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);

  return ITKRound(MinX);
}

double ITKRoundedMidX(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v8 = ITKRound(a1);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  double MaxX = CGRectGetMaxX(v13);
  double v10 = (v8 + ITKRound(MaxX)) * 0.5;

  return ITKRound(v10);
}

double ITKRoundedMaxX(double a1, double a2, double a3, double a4)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);

  return ITKRound(MaxX);
}

double ITKRoundedMinY(double a1, double a2, double a3, double a4)
{
  double MinY = CGRectGetMinY(*(CGRect *)&a1);

  return ITKRound(MinY);
}

double ITKRoundedMidY(CGFloat a1, double a2, CGFloat a3, CGFloat a4)
{
  double v8 = ITKRound(a2);
  v13.origin.CGFloat x = a1;
  v13.origin.CGFloat y = a2;
  v13.size.CGFloat width = a3;
  v13.size.CGFloat height = a4;
  double MaxY = CGRectGetMaxY(v13);
  double v10 = (v8 + ITKRound(MaxY)) * 0.5;

  return ITKRound(v10);
}

double ITKRoundedMaxY(double a1, double a2, double a3, double a4)
{
  double MaxY = CGRectGetMaxY(*(CGRect *)&a1);

  return ITKRound(MaxY);
}

double ITKFloorForScale(double a1, double a2)
{
  return ITKRound(a1 * a2) / a2;
}

BOOL ITKPointIsFinite(double a1, double a2)
{
  BOOL v2 = fabs(a1) != INFINITY;
  return fabs(a2) != INFINITY && v2;
}

uint64_t ITKPointHasNaNComponents()
{
  return 0;
}

uint64_t ITKPointHasInfComponents(double a1, double a2)
{
  BOOL v2 = fabs(a1) == INFINITY;
  return fabs(a2) == INFINITY || v2;
}

BOOL ITKSizeIsFinite(double a1, double a2)
{
  BOOL v2 = fabs(a2) != INFINITY;
  return fabs(a1) != INFINITY && v2;
}

uint64_t ITKRectHasNaNComponents()
{
  return 0;
}

uint64_t ITKTransformHasNaNComponents()
{
  return 0;
}

double ITKSizeGetMaxDimension(double result, double a2)
{
  if (result < a2) {
    return a2;
  }
  return result;
}

double ITKClampSizeToMaxLength(double result, double a2, double a3)
{
  if (result >= a2) {
    double v3 = result;
  }
  else {
    double v3 = a2;
  }
  if (v3 > 0.0 && v3 > a3) {
    return result * (a3 / v3);
  }
  return result;
}

uint64_t ITKRectHasInfComponents(double a1, double a2, double a3, double a4)
{
  double v4 = fabs(a3);
  if (fabs(a4) == INFINITY || v4 == INFINITY) {
    return 1;
  }
  BOOL v7 = fabs(a1) == INFINITY;
  return fabs(a2) == INFINITY || v7;
}

double ITKSanitizeRect(double result)
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

double ITKSanitizePoint(double result)
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

double ITKSanitizeSize(double result)
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

double ITKVertexCentroidOfQuad(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return (a1 + a3 + a5 + a7) * 0.25;
}

BOOL ITKIntersectsLine(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  [v5 a];
  double v8 = v7;
  [v6 a];
  double v10 = v8 - v9;
  if (v8 - v9 == 0.0)
  {
    *(_OWORD *)a3 = *MEMORY[0x263F00148];
  }
  else
  {
    [v6 b];
    double v12 = v11;
    [v5 b];
    double v14 = (v12 - v13) / v10;
    [v5 a];
    double v16 = v15;
    [v5 b];
    *(double *)a3 = v14;
    *(double *)(a3 + 8) = v17 + v16 * v14;
  }

  return v10 != 0.0;
}

void itk_performBlockOnMainThread(void *a1)
{
  double v1 = (void *)MEMORY[0x263F08B88];
  block = a1;
  if ([v1 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void itk_performBlockOnMainThreadAndWait(void *a1)
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

void itk_dispatchMainAfterDelay(void *a1, double a2)
{
  if (a2 == 0.0)
  {
    id v2 = a1;
    dispatch_async(MEMORY[0x263EF83A0], v2);
  }
  else
  {
    int64_t v3 = (uint64_t)(a2 * 1000000000.0);
    id v4 = a1;
    dispatch_time_t v5 = dispatch_time(0, v3);
    dispatch_after(v5, MEMORY[0x263EF83A0], v4);
  }
}

void itk_performBlockOnMainThreadWithStrongSelf(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_initWeak(&location, v3);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __itk_performBlockOnMainThreadWithStrongSelf_block_invoke;
  v6[3] = &unk_26538CDB0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  itk_performBlockOnMainThread(v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void sub_252A6B02C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t __itk_performBlockOnMainThreadWithStrongSelf_block_invoke(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 40))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return MEMORY[0x270F9A758]();
}

void itk_performBlockOnQueueWithStrongSelf(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  objc_initWeak(&location, a2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __itk_performBlockOnQueueWithStrongSelf_block_invoke;
  block[3] = &unk_26538CDB0;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

uint64_t __itk_performBlockOnQueueWithStrongSelf_block_invoke(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 40))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return MEMORY[0x270F9A758]();
}

void itk_performWhileLocked(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v4 lock];
  v3[2](v3);

  [v4 unlock];
}

uint64_t itk_requestDeviceUnlockIfNecessaryWithCompletion(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t itk_isDeviceLocked()
{
  return 0;
}

uint64_t itk_processHasUnlockEntitlement()
{
  if (itk_processHasUnlockEntitlement_onceToken != -1) {
    dispatch_once(&itk_processHasUnlockEntitlement_onceToken, &__block_literal_global);
  }
  return itk_processHasUnlockEntitlement_sHasEntitlement;
}

void __itk_processHasUnlockEntitlement_block_invoke()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    double v1 = v0;
    *(void *)cf = 0;
    CFTypeRef v2 = SecTaskCopyValueForEntitlement(v0, @"com.apple.springboard.requestDeviceUnlock", (CFErrorRef *)cf);
    if (v2)
    {
      id v3 = (void *)v2;
      CFTypeID v4 = CFGetTypeID(v2);
      if (v4 == CFBooleanGetTypeID()) {
        char v5 = [v3 BOOLValue];
      }
      else {
        char v5 = 0;
      }
      itk_processHasUnlockEntitlement_sHasEntitlement = v5;
      CFRelease(v3);
    }
    CFRelease(v1);
    if (*(void *)cf)
    {
      id v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __itk_processHasUnlockEntitlement_block_invoke_cold_1((uint64_t *)cf, v6);
      }

      CFRelease(*(CFTypeRef *)cf);
    }
  }
  id v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [NSNumber numberWithBool:itk_processHasUnlockEntitlement_sHasEntitlement];
    *(_DWORD *)cf = 138412290;
    *(void *)&cf[4] = v8;
    _os_log_impl(&dword_252A65000, v7, OS_LOG_TYPE_DEFAULT, "Process has device unlock entitlement: %@", cf, 0xCu);
  }
}

BOOL itk_isInternalBuild()
{
  return IsAppleInternalBuild() != 0;
}

uint64_t itk_isSeedBuild()
{
  return 0;
}

uint64_t itk_isMacOS()
{
  return 0;
}

uint64_t itk_isiOS()
{
  return 1;
}

uint64_t itk_isCatalyst()
{
  return 0;
}

uint64_t itk_deviceHasNeuralEngine()
{
  return MEMORY[0x270F7D348]();
}

uint64_t itk_deviceSupportsASTC()
{
  if (itk_deviceSupportsASTC_onceToken != -1) {
    dispatch_once(&itk_deviceSupportsASTC_onceToken, &__block_literal_global_10);
  }
  return itk_deviceSupportsASTC_isSupported;
}

uint64_t __itk_deviceSupportsASTC_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  itk_deviceSupportsASTC_isSupported = result;
  return result;
}

void sub_252A6BE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252A6C080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
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

void sub_252A6CB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_252A6CCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252A6E0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_252A6E280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_252A6E378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _tokenByNormalizingString(NSString *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  double v1 = a1;
  CFTypeRef v2 = [(NSString *)v1 precomposedStringWithCanonicalMapping];

  id v3 = v2;
  CFTypeID v4 = v3;
  if (v3)
  {
    char v5 = (__CFString *)[v3 copy];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v6 = [&unk_2702F8658 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v35;
      do
      {
        uint64_t v8 = 0;
        id v9 = v5;
        do
        {
          if (*(void *)v35 != v7) {
            objc_enumerationMutation(&unk_2702F8658);
          }
          uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8 * v8);
          double v11 = [&unk_2702F8680 objectForKeyedSubscript:v10];
          char v5 = [(__CFString *)v9 stringByReplacingOccurrencesOfString:v10 withString:v11];

          ++v8;
          id v9 = v5;
        }
        while (v6 != v8);
        uint64_t v6 = [&unk_2702F8658 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v6);
    }
  }
  else
  {
    char v5 = &stru_2702F71A0;
  }

  double v12 = v5;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v13 = [&unk_2702F85F0 countByEnumeratingWithState:&v34 objects:v38 count:16];
  double v14 = v12;
  if (v13)
  {
    uint64_t v15 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(&unk_2702F85F0);
        }
        uint64_t v18 = [(__CFString *)v12 rangeOfString:*(void *)(*((void *)&v34 + 1) + 8 * i) options:12];
        if (v18) {
          BOOL v19 = v17 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (!v19 && v18 + v17 == [(__CFString *)v12 length])
        {
          double v14 = [(__CFString *)v12 substringToIndex:v18];

          goto LABEL_25;
        }
      }
      uint64_t v13 = [&unk_2702F85F0 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    double v14 = v12;
  }
LABEL_25:

  id v20 = v14;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v21 = [MEMORY[0x263EFFA68] countByEnumeratingWithState:&v34 objects:v38 count:16];
  double v22 = v20;
  if (v21)
  {
    uint64_t v23 = *(void *)v35;
    CGRect v24 = (void *)MEMORY[0x263EFFA68];
    while (2)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v24);
        }
        uint64_t v26 = [v20 rangeOfString:*(void *)(*((void *)&v34 + 1) + 8 * j) options:8];
        unint64_t v28 = v27;
        if (v26) {
          BOOL v29 = 1;
        }
        else {
          BOOL v29 = v27 == 0;
        }
        if (!v29 && v27 < [v20 length])
        {
          double v22 = [v20 substringFromIndex:v28];

          goto LABEL_39;
        }
      }
      uint64_t v21 = [v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v21) {
        continue;
      }
      break;
    }
    double v22 = v20;
  }
LABEL_39:

  id v30 = v22;
  double v31 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  double v32 = [v30 stringByTrimmingCharactersInSet:v31];

  return v32;
}

void sub_252A6E76C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL22_lexiconCheckForLocaleP8NSLocaleP8NSString_block_invoke()
{
  v6[1] = *MEMORY[0x263EF8340];
  v0 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.InputToolKit", 0);
  double v1 = [v0 URLForResource:@"al-lexicon" withExtension:@"dat"];
  CFTypeRef v2 = v1;
  if (v1)
  {
    uint64_t v5 = *MEMORY[0x263F512F8];
    id v3 = [v1 path];
    v6[0] = v3;
    CFTypeID v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

    _lexiconCheckForLocale(NSLocale *,NSString *)::allowListLexicon = LXLexiconCreate();
  }
  else
  {
    CFTypeID v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___ZL22_lexiconCheckForLocaleP8NSLocaleP8NSString_block_invoke_cold_1(v4);
    }
  }
}

void sub_252A6E944(_Unwind_Exception *a1)
{
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

uint64_t ___ZL22_lexiconCheckForLocaleP8NSLocaleP8NSString_block_invoke_30(void *a1, uint64_t a2, unsigned char *a3)
{
  if (!objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "compare:options:range:locale:", LXEntryCopyString(), 3, 0, objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "length"), a1[4]))
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }

  return MEMORY[0x270F9A758]();
}

void sub_252A6EA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL43_getOrCreateCachedLexiconSingletonForLocaleP8NSLocale_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  double v1 = (void *)_getOrCreateCachedLexiconSingletonForLocale(NSLocale *)::lexiconSingletonCache;
  _getOrCreateCachedLexiconSingletonForLocale(NSLocale *)::lexiconSingletonCache = (uint64_t)v0;

  _getOrCreateCachedLexiconSingletonForLocale(NSLocale *)::cacheAccessLock = (uint64_t)objc_alloc_init(MEMORY[0x263F08958]);

  return MEMORY[0x270F9A758]();
}

void ___ZL47_isStringEntirelyPunctuationWhitespaceOrNumericP8NSString_block_invoke()
{
  id v3 = [MEMORY[0x263F089C0] newlineCharacterSet];
  id v0 = [MEMORY[0x263F08708] punctuationCharacterSet];
  [v3 formUnionWithCharacterSet:v0];

  [v3 addCharactersInString:@"0123456789"];
  uint64_t v1 = [v3 copy];
  CFTypeRef v2 = (void *)_isStringEntirelyPunctuationWhitespaceOrNumeric(NSString *)::__characterSet;
  _isStringEntirelyPunctuationWhitespaceOrNumeric(NSString *)::__characterSet = v1;
}

void sub_252A6EB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

std::vector<unsigned int> *__cdecl std::vector<unsigned int>::vector(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](this, __n);
    std::vector<unsigned int>::pointer end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_252A6EBB8(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned int>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<unsigned int>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26538CD68, MEMORY[0x263F8C060]);
}

void sub_252A6ECB0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

BOOL ITKTransformsDifferOnlyByTranslation(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

CGPath *ITKCreatePathFromTransformedRect(const CGAffineTransform *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  Mutable = CGPathCreateMutable();
  v12.origin.CGFloat x = a2;
  v12.origin.CGFloat y = a3;
  v12.size.CGFloat width = a4;
  v12.size.CGFloat height = a5;
  CGPathAddRect(Mutable, a1, v12);
  return Mutable;
}

float64x2_t ITKTransformedCornersOfRect(float64x2_t *a1, double *a2, double *a3, double *a4, double *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
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

CGAffineTransform *ITKAffineTransformShear@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
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

long double ITKTransformAngle(double *a1)
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

BOOL ITKIsTransformFlipped(double *a1)
{
  return a1[2] * a1[1] - *a1 * a1[3] > 0.0;
}

double ITKTransformScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

double ITKTransformIsValid(double *a1)
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

double ITKTransformXYScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

CGAffineTransform *ITKTransformNormalizeScale@<X0>(uint64_t a1@<X0>, CGAffineTransform *a2@<X8>)
{
  CGFloat v2 = 1.0 / sqrt(*(double *)(a1 + 8) * *(double *)(a1 + 8) + *(double *)a1 * *(double *)a1);
  CGFloat v3 = 1.0 / sqrt(*(double *)(a1 + 24) * *(double *)(a1 + 24) + *(double *)(a1 + 16) * *(double *)(a1 + 16));
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v6.a = *(_OWORD *)a1;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tCGFloat x = *(_OWORD *)(a1 + 32);
  return CGAffineTransformScale(a2, &v6, v2, v3);
}

BOOL ITKIsTransformAxisAlignedWithObjectSize(double *a1, double a2, double a3)
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

BOOL ITKIsTransformAxisAlignedWithThreshold(double *a1, double a2)
{
  if (fabs(*a1) < a2 && fabs(a1[3]) < a2) {
    return 1;
  }
  if (fabs(a1[1]) >= a2) {
    return 0;
  }
  return fabs(a1[2]) < a2;
}

double ITKPointFromApplyingTransformToPointInRect(_OWORD *a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v8 = ITKCenterOfRect(a4, a5, a6, a7);
  CGFloat v10 = v9;
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeTranslation(&v19, -v8, -v9);
  CGAffineTransform t1 = v19;
  long long v11 = a1[1];
  *(_OWORD *)&t2.a = *a1;
  *(_OWORD *)&t2.c = v11;
  *(_OWORD *)&t2.tCGFloat x = a1[2];
  CGAffineTransformConcat(&v18, &t1, &t2);
  CGAffineTransform v19 = v18;
  CGAffineTransformMakeTranslation(&v15, v8, v10);
  CGAffineTransform t1 = v19;
  CGAffineTransformConcat(&v18, &t1, &v15);
  *(void *)&double result = *(_OWORD *)&vaddq_f64(*(float64x2_t *)&v18.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v18.c, a3), *(float64x2_t *)&v18.a, a2));
  return result;
}

BOOL ITKIsTransformAxisAligned(double *a1)
{
  if (fabs(*a1) < 1.0e-12 && fabs(a1[3]) < 1.0e-12) {
    return 1;
  }
  if (fabs(a1[1]) >= 1.0e-12) {
    return 0;
  }
  return fabs(a1[2]) < 1.0e-12;
}

BOOL ITKIsTransformAxisAlignedUnflipped(double *a1)
{
  return fabs(a1[1]) < 1.0e-12 && fabs(a1[2]) < 1.0e-12 && *a1 >= 0.0 && a1[3] >= 0.0;
}

CGAffineTransform *ITKAffineTransformForFlips@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
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

CGAffineTransform *ITKAffineTransformVerticalFlip@<X0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  return ITKAffineTransformForFlips(0, 1, a1, a2, a3, a4, a5);
}

CGAffineTransform *ITKAffineTransformScaleByConstant@<X0>(CGAffineTransform *a1@<X8>, CGFloat a2@<D0>)
{
  return CGAffineTransformMakeScale(a1, a2, a2);
}

CGAffineTransform *ITKAffineTransformNormalize@<X0>(CGAffineTransform *a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  return CGAffineTransformMakeScale(a1, 1.0 / a2, 1.0 / a3);
}

CGAffineTransform *ITKAffineTransformAspectFill@<X0>(CGAffineTransform *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  CGFloat v6 = fmax(a4 / a2, a5 / a3);
  CGFloat v7 = (a4 - a2 * v6) * 0.5;
  CGFloat v8 = (a5 - a3 * v6) * 0.5;
  CGAffineTransformMakeScale(&t1, v6, v6);
  CGAffineTransformMakeTranslation(&v10, v7, v8);
  return CGAffineTransformConcat(a1, &t1, &v10);
}

CGAffineTransform *ITKTransformFromTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
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

CGAffineTransform *ITKTransformInTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
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

CGAffineTransform *ITKTransformConvertForNewOrigin@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
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

CGAffineTransform *ITKTransformMakeFree@<X0>(int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, CGFloat a7@<D4>, double a8@<D5>, double a9@<D6>, double a10@<D7>)
{
  double v18 = ITKDistance(a3, a4, a5, a6);
  CGFloat v38 = a7;
  double v19 = ITKDistance(a7, a8, a9, a10);
  if (v18 < 0.0001 || v19 < 0.0001)
  {
    return CGAffineTransformMakeTranslation((CGAffineTransform *)a2, a7 - a3, a8 - a4);
  }
  else
  {
    sCGFloat x = v19 / v18;
    double v20 = ITKSubtractPoints(a3, a4, a5);
    double v22 = ITKAngleFromDelta(v20, v21);
    double v23 = ITKSubtractPoints(a7, a8, a9);
    double v25 = ITKAngleFromDelta(v23, v24);
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

CGFloat ITKTransformMakeAxisAligned@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>, double a10, double a11, double a12)
{
  double v19 = ITKDistance(a2, a3, a4, a5);
  double v20 = ITKDistance(a6, a7, a8, a9);
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

CGFloat ITKTransformConvertingRectToRect@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D2>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>, double a8@<D7>)
{
  return ITKTransformConvertingRectToRectAtPercent(a1, a2, a3, a4, a5, a6, a7, a8, 1.0);
}

CGFloat ITKTransformConvertingRectToRectAtPercent@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D2>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>, double a8@<D7>, double a9)
{
  double v14 = ITKSubtractPoints(a5, a6, a2);
  double v15 = a7 / a3;
  double v16 = a8 / a4;
  double v18 = ITKMultiplyPointScalar(v14, v17, a9);
  CGFloat v20 = v19;
  double v21 = ITKMixSizes(1.0, 1.0, v15, v16, a9);
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

double ITK_CGAffineTransformDecompose(uint64_t a1, uint64_t a2)
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

CGFloat ITK_CGAffineTransformCompose@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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

double ITKTransformDecompose(_OWORD *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v16[9] = *MEMORY[0x263EF8340];
  long long v11 = a1[1];
  v15[0] = *a1;
  v15[1] = v11;
  v15[2] = a1[2];
  ITK_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)v16);
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

uint64_t ITKTransform3DDecompose(_OWORD *a1, CGFloat *a2, CGFloat *a3, CGFloat *a4, CGFloat *a5, CGFloat *a6)
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
  uint64_t v16 = MEMORY[0x2533C6980](&v26);
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
    ITK_CGAffineTransformDecompose((uint64_t)&v25, (uint64_t)&v26);
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

void ITKTransformMixAffineTransforms(long long *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v7 = a1[1];
  long long v16 = *a1;
  v17[0] = v7;
  v17[1] = a1[2];
  ITK_CGAffineTransformDecompose((uint64_t)&v16, (uint64_t)&v18);
  long long v8 = a2[1];
  v15[0] = *a2;
  v15[1] = v8;
  v15[2] = a2[2];
  ITK_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)&v16);
  if ((v18 >= 0.0 || *((double *)&v16 + 1) >= 0.0) && (v19 >= 0.0 || *(double *)&v16 >= 0.0))
  {
    double v9 = __x;
  }
  else
  {
    double v18 = -v18;
    double v19 = -v19;
    double v9 = __x + dbl_252A754B0[__x < 0.0];
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
  ITK_CGAffineTransformCompose((uint64_t)&v18, a3);
}

BOOL ITKTransform3DNearlyEqualToTransform(_OWORD *a1, _OWORD *a2)
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
  return ITKTransform3DNearlyEqualToTransformWithTolerance((double *)v12, (double *)v11, 0.01);
}

BOOL ITKTransform3DNearlyEqualToTransformWithTolerance(double *a1, double *a2, double a3)
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

void sub_252A70534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ITKDynamicCast(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (objc_opt_isKindOfClass()) {
    return a2;
  }
  return 0;
}

void *ITKSpecificCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 isMemberOfClass:a1]) {
    return a2;
  }
  return 0;
}

void *ITKProtocolCast(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  if ([a2 conformsToProtocol:a1]) {
    return a2;
  }
  return 0;
}

void *ITKClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  long long v9 = a1;
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

CFTypeRef ITKCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (CFGetTypeID(cf) == a1) {
    return cf;
  }
  return 0;
}

uint64_t ITKCheckedDynamicCast(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    +[ITKAssert handleFailedAssertWithCondition:"src == ((void *)0) || result != ((void *)0)", "id ITKCheckedDynamicCast(Class, id<NSObject>)", 0, 0, @"Unexpected object type in checked dynamic cast %@ expects %@", objc_opt_class(), a1 functionName simulateCrash showAlert format];
    return 0;
  }
  return v2;
}

void *ITKCheckedProtocolCast(Protocol *a1, void *a2)
{
  if (!a1) {
    +[ITKAssert handleFailedAssertWithCondition:"protocol" functionName:"id ITKCheckedProtocolCast(Protocol *, id<NSObject>)" simulateCrash:0 showAlert:0 format:@"Protocol is nil"];
  }
  if (a2 && ([a2 conformsToProtocol:a1] & 1) == 0)
  {
    uint64_t v4 = objc_opt_class();
    if (a1) {
      Name = protocol_getName(a1);
    }
    else {
      Name = "<No protocol supplied>";
    }
    +[ITKAssert handleFailedAssertWithCondition:"src == ((void *)0) || result != ((void *)0)", "id ITKCheckedProtocolCast(Protocol *, id<NSObject>)", 0, 0, @"Unexpected object type in checked protocol cast %@ expects %s", v4, Name functionName simulateCrash showAlert format];
    return 0;
  }
  return a2;
}

double ITKRound(double a1)
{
  return round(a1);
}

double ITKFractionalPart(double a1)
{
  BOOL v1 = a1 <= 0.0;
  double v2 = -(-a1 - floor(-a1));
  double result = a1 - floor(a1);
  if (v1) {
    return v2;
  }
  return result;
}

double ITKClamp(double a1, double a2, double a3)
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

uint64_t ITKClampInt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >= a3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = a1;
  }
  if (a1 >= a2) {
    return v3;
  }
  else {
    return a2;
  }
}

uint64_t ITKClampRange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1 + a2;
  if (a1 >= a3 + a4) {
    unint64_t v5 = a3 + a4;
  }
  else {
    unint64_t v5 = a1;
  }
  if (a1 < a3) {
    unint64_t v5 = a3;
  }
  if (v4 >= a3 + a4) {
    unint64_t v6 = a3 + a4;
  }
  else {
    unint64_t v6 = a1 + a2;
  }
  if (v4 >= a3) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = a3;
  }
  if (v5 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v5;
  }
  if (a1 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = a3 + a4;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v8;
  }
}

BOOL ITKRangeContainsIndex(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3 = a1 + a2 >= a3;
  if (!a2) {
    BOOL v3 = 0;
  }
  BOOL v4 = a1 != 0x7FFFFFFFFFFFFFFFLL && v3;
  return a1 <= a3 && v4;
}

BOOL ITKRangeEnclosesRange(NSRange range2, NSRange range1)
{
  if (range2.location == 0x7FFFFFFFFFFFFFFFLL || range1.location == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  NSUInteger length = range1.length;
  range1.NSUInteger length = range2.length;
  NSUInteger location = range2.location;
  if (length)
  {
    v7.NSUInteger location = range1.location;
    v7.NSUInteger length = length;
    range1.NSUInteger location = location;
    return NSIntersectionRange(v7, range1).length == length;
  }
  else
  {
    BOOL v6 = range1.location <= range2.location + range2.length;
    if (range1.location < range2.location) {
      BOOL v6 = 0;
    }
    if (range2.length) {
      return v6;
    }
    else {
      return range2.location == range1.location;
    }
  }
}

double ITKMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double ITKRandom()
{
  return (double)random() / 2147483650.0;
}

double ITKRandomBetween(double a1, double a2)
{
  return a1 + (a2 - a1) * ((double)random() / 2147483650.0);
}

double ITKReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double ITKSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
}

id ITKStringFromCGColor(CGColor *a1)
{
  double v2 = [MEMORY[0x263EFF980] array];
  ColorSpace = CGColorGetColorSpace(a1);
  BOOL v4 = (__CFString *)CGColorSpaceCopyName(ColorSpace);
  if (v4)
  {
    [v2 addObject:v4];
    size_t NumberOfComponents = CGColorGetNumberOfComponents(a1);
    Components = CGColorGetComponents(a1);
    if (NumberOfComponents)
    {
      NSRange v7 = Components;
      do
      {
        uint64_t v8 = *(void *)v7++;
        long long v9 = objc_msgSend(NSString, "stringWithFormat:", @"%.10f", v8);
        [v2 addObject:v9];

        --NumberOfComponents;
      }
      while (NumberOfComponents);
    }
  }
  else
  {
    double v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ITKStringFromCGColor_cold_1();
    }
  }
  if ([v2 count])
  {
    double v11 = [v2 componentsJoinedByString:@";"];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

CGColorRef ITKCGColorCreateWithString(void *a1)
{
  id v1 = a1;
  double v2 = [v1 componentsSeparatedByString:@";"];
  BOOL v3 = (void *)[v2 mutableCopy];

  if ([v3 count])
  {
    BOOL v4 = [v3 firstObject];
    [v3 removeObjectAtIndex:0];
    CGColorSpaceRef v5 = CGColorSpaceCreateWithName(v4);
    if (v5)
    {
      BOOL v6 = v5;
      if ([v3 count])
      {
        uint64_t v7 = CGColorSpaceGetNumberOfComponents(v6) + 1;
        if ([v3 count] == v7)
        {
          uint64_t v8 = (CGFloat *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
          if (v7)
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              double v10 = [v3 objectAtIndexedSubscript:i];
              [v10 doubleValue];
              v8[i] = v11;
            }
          }
          CGColorRef v12 = CGColorCreate(v6, v8);
          free(v8);
          goto LABEL_22;
        }
        long long v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          ITKCGColorCreateWithString_cold_4(v3, v7, v15);
        }
      }
      else
      {
        long long v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          ITKCGColorCreateWithString_cold_3();
        }
      }
      CGColorRef v12 = 0;
LABEL_22:
      CGColorSpaceRelease(v6);
      goto LABEL_23;
    }
    long long v13 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      ITKCGColorCreateWithString_cold_2();
    }
  }
  else
  {
    BOOL v4 = (__CFString *)os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      ITKCGColorCreateWithString_cold_1();
    }
  }
  CGColorRef v12 = 0;
LABEL_23:

  return v12;
}

CGColorRef ITKCGColorCopyInverse(CGColor *a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  Components = CGColorGetComponents(a1);
  CGColorGetNumberOfComponents(a1);
  MEMORY[0x270FA5388]();
  CGColorSpaceRef v5 = (const CGFloat *)((char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v7 = (double *)Components;
    uint64_t v8 = (double *)v5;
    do
    {
      double v9 = *v7++;
      *v8++ = 1.0 - v9;
      --v6;
    }
    while (v6);
  }
  v5[v3] = Components[v3];
  ColorSpace = CGColorGetColorSpace(a1);
  return CGColorCreate(ColorSpace, v5);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void __itk_processHasUnlockEntitlement_block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_252A65000, a2, OS_LOG_TYPE_ERROR, "Failed to check if process has unlock request entitlement: %@", (uint8_t *)&v3, 0xCu);
}

void ___ZL22_lexiconCheckForLocaleP8NSLocaleP8NSString_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_252A65000, log, OS_LOG_TYPE_ERROR, "The allow list lexicon could not be discovered in the supplied bundle", v1, 2u);
}

void ITKStringFromCGColor_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_252A65000, v0, v1, "Could not get color space name from color %@", v2, v3, v4, v5, v6);
}

void ITKCGColorCreateWithString_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_252A65000, v0, v1, "No strings from color string: %@", v2, v3, v4, v5, v6);
}

void ITKCGColorCreateWithString_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_252A65000, v0, v1, "No color space from color string: %@", v2, v3, v4, v5, v6);
}

void ITKCGColorCreateWithString_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_252A65000, v0, v1, "No component count in color string: %@", v2, v3, v4, v5, v6);
}

void ITKCGColorCreateWithString_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_1();
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_252A65000, a3, OS_LOG_TYPE_ERROR, "Color string component count (%zu) is different from the expected count for the color space (%zu) plus the alpha component", v5, 0x16u);
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x270EFB908](retstr, t);
}

BOOL CATransform3DIsAffine(CATransform3D *t)
{
  return MEMORY[0x270EFB920](t);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
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

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
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

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5C38](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
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

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x270F243B8]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x270F46EF0]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x270F46F50]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x270F46F70]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}