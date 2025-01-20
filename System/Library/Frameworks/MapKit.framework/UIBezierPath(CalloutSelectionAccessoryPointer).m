@interface UIBezierPath(CalloutSelectionAccessoryPointer)
+ (double)pointerMargin;
+ (id)bezierPathWithCalloutRect:()CalloutSelectionAccessoryPointer unitLocation:edge:;
- (uint64_t)addPointerAtUnitLocation:()CalloutSelectionAccessoryPointer rect:edge:;
@end

@implementation UIBezierPath(CalloutSelectionAccessoryPointer)

+ (id)bezierPathWithCalloutRect:()CalloutSelectionAccessoryPointer unitLocation:edge:
{
  v13 = [MEMORY[0x1E4F427D0] bezierPath];
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  double MinX = CGRectGetMinX(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  objc_msgSend(v13, "moveToPoint:", MinX, CGRectGetMinY(v26) + 14.0);
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  CGFloat v15 = CGRectGetMinX(v27) + 14.0;
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  objc_msgSend(v13, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v15, CGRectGetMinY(v28) + 14.0, 14.0, 3.14159265, 4.71238898);
  if (a8 == 1) {
    objc_msgSend(v13, "addPointerAtUnitLocation:rect:edge:", 1, a5, a1, a2, a3, a4);
  }
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  CGFloat v16 = CGRectGetMaxX(v29) + -14.0;
  v30.origin.x = a1;
  v30.origin.y = a2;
  v30.size.width = a3;
  v30.size.height = a4;
  objc_msgSend(v13, "addLineToPoint:", v16, CGRectGetMinY(v30));
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  CGFloat v17 = CGRectGetMaxX(v31) + -14.0;
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  objc_msgSend(v13, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v17, CGRectGetMinY(v32) + 14.0, 14.0, 4.71238898, 6.28318531);
  if (a8 == 4) {
    objc_msgSend(v13, "addPointerAtUnitLocation:rect:edge:", 4, a5, a1, a2, a3, a4);
  }
  v33.origin.x = a1;
  v33.origin.y = a2;
  v33.size.width = a3;
  v33.size.height = a4;
  double MaxX = CGRectGetMaxX(v33);
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  objc_msgSend(v13, "addLineToPoint:", MaxX, CGRectGetMaxY(v34) + -14.0);
  v35.origin.x = a1;
  v35.origin.y = a2;
  v35.size.width = a3;
  v35.size.height = a4;
  CGFloat v19 = CGRectGetMaxX(v35) + -14.0;
  v36.origin.x = a1;
  v36.origin.y = a2;
  v36.size.width = a3;
  v36.size.height = a4;
  objc_msgSend(v13, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v19, CGRectGetMaxY(v36) + -14.0, 14.0, 0.0, 1.57079633);
  if (a8 == 2) {
    objc_msgSend(v13, "addPointerAtUnitLocation:rect:edge:", 2, a5, a1, a2, a3, a4);
  }
  v37.origin.x = a1;
  v37.origin.y = a2;
  v37.size.width = a3;
  v37.size.height = a4;
  CGFloat v20 = CGRectGetMinX(v37) + 14.0;
  v38.origin.x = a1;
  v38.origin.y = a2;
  v38.size.width = a3;
  v38.size.height = a4;
  objc_msgSend(v13, "addLineToPoint:", v20, CGRectGetMaxY(v38));
  v39.origin.x = a1;
  v39.origin.y = a2;
  v39.size.width = a3;
  v39.size.height = a4;
  CGFloat v21 = CGRectGetMinX(v39) + 14.0;
  v40.origin.x = a1;
  v40.origin.y = a2;
  v40.size.width = a3;
  v40.size.height = a4;
  objc_msgSend(v13, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v21, CGRectGetMaxY(v40) + -14.0, 14.0, 1.57079633, 3.14159265);
  if (a8 == 3) {
    objc_msgSend(v13, "addPointerAtUnitLocation:rect:edge:", 3, a5, a1, a2, a3, a4);
  }
  [v13 closePath];

  return v13;
}

+ (double)pointerMargin
{
  return 38.0;
}

- (uint64_t)addPointerAtUnitLocation:()CalloutSelectionAccessoryPointer rect:edge:
{
  unint64_t v15 = a8 - 1;
  CGFloat v16 = a3;
  if ((unint64_t)(a8 - 1) > 1) {
    double Height = CGRectGetHeight(*(CGRect *)&v16);
  }
  else {
    double Height = CGRectGetWidth(*(CGRect *)&v16);
  }
  double v21 = Height;
  uint64_t result = [MEMORY[0x1E4F427D0] pointerMargin];
  double v24 = v21 + v23 * -2.0;
  unint64_t v25 = a8 & 0xFFFFFFFFFFFFFFFELL;
  double v26 = 1.0 - a2;
  if ((a8 & 0xFFFFFFFFFFFFFFFELL) != 2) {
    double v26 = a2;
  }
  double v27 = v26 * v24 + 14.0 + 10.0;
  switch(a8)
  {
    case 4:
      v60.origin.x = a3;
      v60.origin.y = a4;
      v60.size.width = a5;
      v60.size.height = a6;
      double MinY = CGRectGetMinY(v60);
      v61.origin.x = a3;
      v61.origin.y = a4;
      v61.size.width = a5;
      v61.size.height = a6;
      double MaxX = CGRectGetMaxX(v61);
      break;
    case 1:
      v58.origin.x = a3;
      v58.origin.y = a4;
      v58.size.width = a5;
      v58.size.height = a6;
      double MinY = CGRectGetMinX(v58);
      v59.origin.x = a3;
      v59.origin.y = a4;
      v59.size.width = a5;
      v59.size.height = a6;
      double MaxX = CGRectGetMinY(v59);
      break;
    case 2:
      double v27 = -v27;
      v62.origin.x = a3;
      v62.origin.y = a4;
      v62.size.width = a5;
      v62.size.height = a6;
      double MinY = CGRectGetMaxX(v62);
      v63.origin.x = a3;
      v63.origin.y = a4;
      v63.size.width = a5;
      v63.size.height = a6;
      double MaxX = CGRectGetMaxY(v63);
      break;
    case 3:
      double v27 = -v27;
      v64.origin.x = a3;
      v64.origin.y = a4;
      v64.size.width = a5;
      v64.size.height = a6;
      double MinY = CGRectGetMaxY(v64);
      v65.origin.x = a3;
      v65.origin.y = a4;
      v65.size.width = a5;
      v65.size.height = a6;
      double MaxX = CGRectGetMinX(v65);
      break;
    default:
      return result;
  }
  double v30 = MinY + v27;
  if (v25 == 2) {
    double v31 = -14.0;
  }
  else {
    double v31 = 14.0;
  }
  double v32 = 5.0;
  if (v25 == 2) {
    double v32 = -5.0;
  }
  double v33 = 3.0;
  if (v25 == 2) {
    double v33 = -3.0;
  }
  double v34 = v30 + v31 * 2.0;
  double v35 = v34 - v32;
  if (v15 >= 2) {
    double v36 = MaxX;
  }
  else {
    double v36 = v34 - v32;
  }
  if (v15 < 2) {
    double v35 = MaxX;
  }
  double v55 = v35;
  double v56 = v36;
  if (a8 == 4 || a8 == 2) {
    double v38 = -14.0;
  }
  else {
    double v38 = 14.0;
  }
  if (v15 >= 2) {
    double v39 = MaxX;
  }
  else {
    double v39 = MinY + v27;
  }
  if (v15 >= 2) {
    double v40 = MinY + v27;
  }
  else {
    double v40 = MaxX;
  }
  double v41 = v31 + v30;
  double v42 = MaxX - v38;
  if (v15 >= 2) {
    double v43 = v42;
  }
  else {
    double v43 = v41;
  }
  if (v15 >= 2) {
    double v44 = v41;
  }
  else {
    double v44 = v42;
  }
  double v45 = v32 + v30;
  if (v15 >= 2) {
    double v46 = MaxX;
  }
  else {
    double v46 = v45;
  }
  if (v15 >= 2) {
    double v47 = v45;
  }
  else {
    double v47 = MaxX;
  }
  if (v15 >= 2) {
    double v48 = v42;
  }
  else {
    double v48 = v41 - v33;
  }
  if (v15 >= 2) {
    double v49 = v41 - v33;
  }
  else {
    double v49 = v42;
  }
  if (v15 >= 2) {
    double v50 = MaxX;
  }
  else {
    double v50 = v34;
  }
  if (v15 < 2)
  {
    double v51 = v33 + v41;
  }
  else
  {
    double MaxX = v34;
    double v51 = v42;
  }
  if (v15 >= 2) {
    double v52 = v33 + v41;
  }
  else {
    double v52 = v42;
  }
  objc_msgSend(a1, "addLineToPoint:", v39, v40, *(void *)&MaxX, *(void *)&v50);
  objc_msgSend(a1, "addCurveToPoint:controlPoint1:controlPoint2:", v43, v44, v46, v47, v48, v49);

  return objc_msgSend(a1, "addCurveToPoint:controlPoint1:controlPoint2:", v54, v53, v51, v52, v56, v55);
}

@end