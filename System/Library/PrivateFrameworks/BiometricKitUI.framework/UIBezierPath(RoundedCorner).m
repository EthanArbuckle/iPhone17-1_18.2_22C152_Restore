@interface UIBezierPath(RoundedCorner)
- (void)bkui_bezierPathAddRoundedCorner:()RoundedCorner withRadius:followingAngle:;
@end

@implementation UIBezierPath(RoundedCorner)

- (void)bkui_bezierPathAddRoundedCorner:()RoundedCorner withRadius:followingAngle:
{
  [a1 currentPoint];
  double v10 = v9;
  [a1 currentPoint];
  double v12 = v11;
  __double2 v13 = __sincos_stret(a3);
  double v14 = fabs(v13.__cosval * a2);
  double v15 = fabs(v13.__sinval * a2);
  switch(a5)
  {
    case 1:
      double v16 = v15 + v10;
      double v17 = v14 + v12;
      double v18 = 1.57079633;
      goto LABEL_7;
    case 2:
      double v16 = v14 + v10;
      double v17 = v15 + v12;
      double v18 = 3.14159265;
      goto LABEL_7;
    case 4:
      double v16 = v14 + v10;
      double v17 = v12 - v15;
      goto LABEL_8;
    case 8:
      double v16 = v10 - v15;
      double v17 = v14 + v12;
      double v18 = 4.71238898;
LABEL_7:
      a3 = a3 + v18;
LABEL_8:
      objc_msgSend(a1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v16, v17, a2, a3, a3 + 1.57079633);
      break;
    default:
      NSLog(&cfstr_UnsupportedRec.isa, a5);
      break;
  }
}

@end