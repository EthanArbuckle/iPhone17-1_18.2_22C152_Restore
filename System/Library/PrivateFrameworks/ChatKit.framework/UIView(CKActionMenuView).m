@interface UIView(CKActionMenuView)
- (uint64_t)pointMostlyInside:()CKActionMenuView threshold:velocity:;
@end

@implementation UIView(CKActionMenuView)

- (uint64_t)pointMostlyInside:()CKActionMenuView threshold:velocity:
{
  [a1 bounds];
  double v13 = v12 - a4;
  double v15 = v14 - a4;
  double v16 = a4 + a4;
  double v18 = a4 + a4 + v17;
  double v20 = v16 + v19;
  v32.origin.x = v13;
  v32.origin.y = v15;
  v32.size.width = v18;
  v32.size.height = v20;
  v31.x = a2;
  v31.y = a3;
  if (CGRectContainsPoint(v32, v31) || (objc_msgSend(a1, "pointInside:withEvent:", 0, a2, a3) & 1) != 0) {
    return 1;
  }
  double v22 = a6;
  double v23 = *MEMORY[0x1E4F1DAD8];
  double v30 = v22;
  if (a5 == *MEMORY[0x1E4F1DAD8] && v22 == *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
    return 0;
  }
  double v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v33.origin.x = v13;
  v33.origin.y = v15;
  v33.size.width = v18;
  v33.size.height = v20;
  if (a2 < CGRectGetMinX(v33))
  {
    v34.origin.x = v13;
    v34.origin.y = v15;
    v34.size.width = v18;
    v34.size.height = v20;
    double v23 = a2 - CGRectGetMinX(v34);
  }
  v35.origin.x = v13;
  v35.origin.y = v15;
  v35.size.width = v18;
  v35.size.height = v20;
  if (a3 < CGRectGetMinY(v35))
  {
    v36.origin.x = v13;
    v36.origin.y = v15;
    v36.size.width = v18;
    v36.size.height = v20;
    double v29 = a3 - CGRectGetMinY(v36);
  }
  v37.origin.x = v13;
  v37.origin.y = v15;
  v37.size.width = v18;
  v37.size.height = v20;
  if (a2 > CGRectGetMaxX(v37))
  {
    v38.origin.x = v13;
    v38.origin.y = v15;
    v38.size.width = v18;
    v38.size.height = v20;
    double v23 = a2 - CGRectGetMaxX(v38);
  }
  v39.origin.x = v13;
  v39.origin.y = v15;
  v39.size.width = v18;
  v39.size.height = v20;
  CGFloat MaxY = CGRectGetMaxY(v39);
  double v26 = v29;
  if (a3 > MaxY)
  {
    v40.origin.x = v13;
    v40.origin.y = v15;
    v40.size.width = v18;
    v40.size.height = v20;
    double v26 = a3 - CGRectGetMaxY(v40);
  }
  BOOL v27 = v23 == 0.0 || a5 / v23 > 10.0;
  BOOL v28 = v26 == 0.0 || v30 / v26 > 10.0;
  return v27 & v28;
}

@end