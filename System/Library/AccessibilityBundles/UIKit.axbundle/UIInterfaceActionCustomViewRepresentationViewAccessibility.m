@interface UIInterfaceActionCustomViewRepresentationViewAccessibility
@end

@implementation UIInterfaceActionCustomViewRepresentationViewAccessibility

uint64_t __80___UIInterfaceActionCustomViewRepresentationViewAccessibility_accessibilityPath__block_invoke(CGRect *a1, double a2, double a3, double a4, double a5)
{
  *(double *)v24 = a2;
  *(double *)&v24[8] = a3;
  *(double *)&v24[16] = a4;
  *(double *)&v24[24] = a5;
  double MinX = CGRectGetMinX(a1[1]);
  BOOL v21 = 0;
  if (MinX == CGRectGetMinX(*(CGRect *)v24))
  {
    double MinY = CGRectGetMinY(a1[1]);
    BOOL v21 = MinY == CGRectGetMinY(*(CGRect *)v24);
  }
  double MaxX = CGRectGetMaxX(a1[1]);
  BOOL v17 = 0;
  if (MaxX == CGRectGetMaxX(*(CGRect *)v24))
  {
    double v15 = CGRectGetMinY(a1[1]);
    BOOL v17 = v15 == CGRectGetMinY(*(CGRect *)v24);
  }
  uint64_t v5 = 0;
  if (v17) {
    uint64_t v5 = 2;
  }
  unint64_t v22 = v21 | (unint64_t)v5;
  double v13 = CGRectGetMinX(a1[1]);
  BOOL v14 = 0;
  if (v13 == CGRectGetMinX(*(CGRect *)v24))
  {
    double MaxY = CGRectGetMaxY(a1[1]);
    BOOL v14 = MaxY == CGRectGetMaxY(*(CGRect *)v24);
  }
  uint64_t v6 = 0;
  if (v14) {
    uint64_t v6 = 4;
  }
  uint64_t v23 = v22 | v6;
  double v10 = CGRectGetMaxX(a1[1]);
  BOOL v11 = 0;
  if (v10 == CGRectGetMaxX(*(CGRect *)v24))
  {
    double v9 = CGRectGetMaxY(a1[1]);
    BOOL v11 = v9 == CGRectGetMaxY(*(CGRect *)v24);
  }
  uint64_t v7 = 0;
  if (v11) {
    uint64_t v7 = 8;
  }
  return v23 | v7;
}

BOOL __80___UIInterfaceActionCustomViewRepresentationViewAccessibility_accessibilityPath__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[location[0] layer];
  [v4 cornerRadius];
  BOOL v5 = v2 > 0.0;

  objc_storeStrong(location, 0);
  return v5;
}

@end