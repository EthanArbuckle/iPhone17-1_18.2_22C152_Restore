@interface UIBezierPath(UIBezierPathFromFingerShape)
+ (id)bezierPathForFingerShape:()UIBezierPathFromFingerShape inRect:curveOnly:;
@end

@implementation UIBezierPath(UIBezierPathFromFingerShape)

+ (id)bezierPathForFingerShape:()UIBezierPathFromFingerShape inRect:curveOnly:
{
  v14 = [MEMORY[0x263F824C0] bezierPath];
  if (a3 >= a4) {
    double v15 = a4;
  }
  else {
    double v15 = a3;
  }
  double v28 = v15;
  v30.origin.x = a1;
  v30.origin.y = a2;
  v30.size.width = a3;
  v30.size.height = a4;
  double MaxX = CGRectGetMaxX(v30);
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  double MaxY = CGRectGetMaxY(v31);
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  CGFloat MinX = CGRectGetMinX(v32);
  v33.origin.x = a1;
  v33.origin.y = a2;
  v33.size.width = a3;
  v33.size.height = a4;
  double MinY = CGRectGetMinY(v33);
  double v20 = 0.0;
  switch(a7)
  {
    case 0:
      v34.origin.x = a1;
      v34.origin.y = a2;
      v34.size.width = a3;
      v34.size.height = a4;
      double MidX = CGRectGetMidX(v34);
      v35.origin.x = a1;
      v35.origin.y = a2;
      v35.size.width = a3;
      v35.size.height = a4;
      objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMidY(v35), v28 * 0.5, 1.57079633, 7.85398163);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 1:
      double v20 = 4.71238898;
      double v25 = 3.14159265;
      double v23 = MinX;
      double v24 = MaxY;
      break;
    case 2:
      double v25 = 4.71238898;
      double v23 = MinX;
      double v24 = MinY;
      goto LABEL_11;
    case 3:
      double v20 = 3.14159265;
      double v25 = 1.57079633;
      double v23 = MaxX;
      double v24 = MaxY;
      double MaxY = MinY;
      break;
    case 4:
      double v20 = 1.57079633;
      double v23 = MaxX;
      double v24 = MinY;
      double v25 = 0.0;
      double MaxY = MinY;
LABEL_11:
      double MaxX = MinX;
      break;
    default:
      double v23 = 0.0;
      double v24 = 0.0;
      double v25 = 0.0;
      double MaxY = 0.0;
      double MaxX = 0.0;
      break;
  }
  if (a8)
  {
    objc_msgSend(v14, "moveToPoint:", v23, v24);
    objc_msgSend(v14, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX, MaxY, v28, v25, v20);
  }
  else
  {
    objc_msgSend(v14, "moveToPoint:", MaxX, MaxY);
    objc_msgSend(v14, "addLineToPoint:", v23, v24);
    objc_msgSend(v14, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX, MaxY, v28, v25, v20);
    objc_msgSend(v14, "addLineToPoint:", MaxX, MaxY);
    [v14 closePath];
  }
  id v22 = v14;
LABEL_16:
  v26 = v22;

  return v26;
}

@end