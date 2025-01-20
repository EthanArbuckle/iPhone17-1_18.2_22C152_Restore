@interface CDKeylineImageFactory
+ (CGPath)_cornerPathWithDevice:(id)a3 size:(CGSize)a4 innerCircleRadius:(double)a5 strokeWidth:(double)a6;
+ (CGPath)cornerPathWithDevice:(id)a3 corner:(unint64_t)a4 size:(CGSize)a5 innerCircleRadius:(double)a6;
+ (id)_cornerKeylineWithDevice:(id)a3 size:(CGSize)a4 innerCircleRadius:(double)a5 strokeWidth:(double)a6 filled:(BOOL)a7;
+ (id)_heartKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 sideCircleRadius:(double)a6 topCircleRadius:(double)a7 strokeWidth:(double)a8 filled:(BOOL)a9;
+ (id)_smileKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 angle:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8;
+ (id)cornerKeylineWithDevice:(id)a3 corner:(unint64_t)a4 size:(CGSize)a5 innerCircleRadius:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8;
+ (id)heartKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 sideCircleRadius:(double)a6 topCircleRadius:(double)a7 strokeWidth:(double)a8 filled:(BOOL)a9;
+ (id)heartKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 sideComplicationDistance:(double)a6 topComplicationDistance:(double)a7 strokeWidth:(double)a8 filled:(BOOL)a9;
+ (id)smileKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 angle:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8;
+ (id)smileShapeWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 angle:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8;
+ (id)topLeftCornerShapeWithDevice:(id)a3 size:(CGSize)a4 innerCircleRadius:(double)a5 strokeWidth:(double)a6 filled:(BOOL)a7;
@end

@implementation CDKeylineImageFactory

+ (id)cornerKeylineWithDevice:(id)a3 corner:(unint64_t)a4 size:(CGSize)a5 innerCircleRadius:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a5.height;
  double width = a5.width;
  id v15 = a3;
  if (cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__onceToken != -1) {
    dispatch_once(&cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__onceToken, &__block_literal_global_0);
  }
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%lu-%lu-(%f-%f)-%f-%f-%i", objc_msgSend(v15, "sizeClass"), a4, *(void *)&width, *(void *)&height, *(void *)&a6, *(void *)&a7, v8);
  v17 = [(id)cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__imageCache objectForKeyedSubscript:v16];

  if (v17)
  {
    v18 = [(id)cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__imageCache objectForKeyedSubscript:v16];
  }
  else
  {
    v19 = objc_msgSend(a1, "_cornerKeylineWithDevice:size:innerCircleRadius:strokeWidth:filled:", v15, v8, width, height, a6, a7);
    v20 = v19;
    switch(a4)
    {
      case 1uLL:
        id v21 = v19;
        goto LABEL_12;
      case 2uLL:
        id v22 = v19;
        uint64_t v23 = [v22 CGImage];
        [v22 scale];
        v24 = v22;
        uint64_t v25 = v23;
        uint64_t v26 = 4;
        goto LABEL_11;
      case 4uLL:
        id v27 = v19;
        uint64_t v28 = [v27 CGImage];
        [v27 scale];
        v24 = v27;
        uint64_t v25 = v28;
        uint64_t v26 = 5;
        goto LABEL_11;
      case 8uLL:
        id v29 = v19;
        uint64_t v30 = [v29 CGImage];
        [v29 scale];
        v24 = v29;
        uint64_t v25 = v30;
        uint64_t v26 = 1;
LABEL_11:
        id v21 = (id)objc_msgSend(v24, "initWithCGImage:scale:orientation:", v25, v26);
LABEL_12:
        v18 = v21;
        break;
      default:
        objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF4A0], @"%s corner argument expects that exactly one corner is specified", "+[CDKeylineImageFactory cornerKeylineWithDevice:corner:size:innerCircleRadius:strokeWidth:filled:]");
        v18 = 0;
        break;
    }
    [(id)cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__imageCache setObject:v18 forKeyedSubscript:v16];
  }
  return v18;
}

uint64_t __98__CDKeylineImageFactory_cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled___block_invoke()
{
  cornerKeylineWithDevice_corner_size_innerCircleRadius_strokeWidth_filled__imageCache = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)_cornerKeylineWithDevice:(id)a3 size:(CGSize)a4 innerCircleRadius:(double)a5 strokeWidth:(double)a6 filled:(BOOL)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v9 = +[CDKeylineImageFactory topLeftCornerShapeWithDevice:size:innerCircleRadius:strokeWidth:filled:](CDKeylineImageFactory, "topLeftCornerShapeWithDevice:size:innerCircleRadius:strokeWidth:filled:", a3, a7, a4.width, a4.height, a5, a6);
  v13.CGFloat width = width;
  v13.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
  [v9 renderInContext:UIGraphicsGetCurrentContext()];
  v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

+ (id)topLeftCornerShapeWithDevice:(id)a3 size:(CGSize)a4 innerCircleRadius:(double)a5 strokeWidth:(double)a6 filled:(BOOL)a7
{
  v9 = (const CGPath *)[a1 _cornerPathWithDevice:a3 size:a4.width innerCircleRadius:a4.height strokeWidth:a5];
  v10 = [MEMORY[0x263F15880] layer];
  [v10 setPath:v9];
  if (a7) {
    [MEMORY[0x263F825C8] whiteColor];
  }
  else {
  id v11 = [MEMORY[0x263F825C8] clearColor];
  }
  objc_msgSend(v10, "setFillColor:", objc_msgSend(v11, "CGColor"));

  id v12 = [MEMORY[0x263F825C8] whiteColor];
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

  [v10 setLineWidth:a6];
  CGPathRelease(v9);
  return v10;
}

+ (CGPath)cornerPathWithDevice:(id)a3 corner:(unint64_t)a4 size:(CGSize)a5 innerCircleRadius:(double)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  v9 = (CGPath *)objc_msgSend(a1, "_cornerPathWithDevice:size:innerCircleRadius:strokeWidth:", a3, a5.width, a5.height, a6, 0.0);
  memset(&v18, 0, sizeof(v18));
  switch(a4)
  {
    case 1uLL:
      return v9;
    case 2uLL:
      CGAffineTransformMakeScale(&v18, -1.0, 1.0);
      CGAffineTransform v16 = v18;
      CGFloat v10 = 0.0;
      CGFloat v11 = width;
      goto LABEL_7;
    case 4uLL:
      CGAffineTransformMakeScale(&v18, 1.0, -1.0);
      CGAffineTransform v16 = v18;
      CGFloat v11 = 0.0;
      goto LABEL_6;
    case 8uLL:
      CGAffineTransformMakeScale(&v18, -1.0, -1.0);
      CGAffineTransform v16 = v18;
      CGFloat v11 = width;
LABEL_6:
      CGFloat v10 = height;
LABEL_7:
      CGAffineTransformTranslate(&v17, &v16, v11, v10);
      *(_OWORD *)&v18.a = *(_OWORD *)&v17.a;
      *(_OWORD *)&v18.c = *(_OWORD *)&v17.c;
      long long v13 = *(_OWORD *)&v17.tx;
      break;
    default:
      long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v18.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v18.c = v12;
      long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      break;
  }
  *(_OWORD *)&v18.tx = v13;
  v14 = (CGPath *)MEMORY[0x223C26570](v9, &v18);
  CGPathRelease(v9);
  return v14;
}

+ (CGPath)_cornerPathWithDevice:(id)a3 size:(CGSize)a4 innerCircleRadius:(double)a5 strokeWidth:(double)a6
{
  double height = a4.height;
  CGFloat v41 = a4.height;
  CGFloat width = a4.width;
  double v9 = a4.width;
  id v10 = a3;
  [v10 screenBounds];
  double v12 = v11 * 0.5;
  [v10 screenBounds];
  double v14 = a6 * 0.5;
  double v15 = a6 * 0.5 + v12;
  double v16 = a6 * 0.5 + v13 * 0.5;
  double v40 = v16 - (v15 - v9 - sqrt(-((v15 - v9) * a5) - (v15 - v9) * v16 + v16 * a5 + a5 * a5) * -1.41421356) + a5;
  long double v38 = atan2(v16 - v40, v15 - v9 + v40);
  double v39 = v15
      - (v16
       - height
       - sqrt(-((v16 - height) * a5) - (v16 - height) * v15 + v15 * a5 + a5 * a5) * -1.41421356)
      + a5;
  long double v35 = atan2(v15 - v39, v16 - height + v39);
  [v10 screenCornerRadius];
  double v18 = (v17 - a6 * 0.5) * 1.6;
  double v36 = v18;
  [v10 screenCornerRadius];
  double v20 = (v19 - a6 * 0.5) * 1.6;
  double v37 = v20;
  Mutable = CGPathCreateMutable();
  id v22 = (void *)MEMORY[0x263F824C0];
  double v34 = a6;
  double v23 = v18 - a6;
  double v24 = v20 - a6;
  [v10 screenCornerRadius];
  double v26 = v25 - v14;
  [v10 screenCornerRadius];
  double v28 = v27;

  objc_msgSend(v22, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 1, v14, v14, v23, v24, v26, v28 - v14);
  id v29 = objc_claimAutoreleasedReturnValue();
  uint64_t v30 = (const CGPath *)[v29 CGPath];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__CDKeylineImageFactory__cornerPathWithDevice_size_innerCircleRadius_strokeWidth___block_invoke;
  aBlock[3] = &__block_descriptor_112_e17_v16__0__CGPath__8l;
  *(CGFloat *)&aBlock[4] = width;
  *(double *)&aBlock[5] = v40;
  *(double *)&aBlock[6] = v34;
  *(long double *)&aBlock[7] = v38;
  *(double *)&aBlock[8] = v15;
  *(double *)&aBlock[9] = v16;
  *(double *)&aBlock[10] = a5;
  *(long double *)&aBlock[11] = v35;
  *(double *)&aBlock[12] = v39;
  *(CGFloat *)&aBlock[13] = v41;
  v31 = _Block_copy(aBlock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__CDKeylineImageFactory__cornerPathWithDevice_size_innerCircleRadius_strokeWidth___block_invoke_2;
  block[3] = &unk_2644A51E0;
  double v46 = v34;
  CGFloat v47 = width;
  double v48 = v40;
  CGFloat v49 = v41;
  double v50 = v39;
  double v51 = v36;
  double v52 = v37;
  id v44 = v31;
  v45 = Mutable;
  id v32 = v31;
  CGPathApplyWithBlock(v30, block);
  CGPathCloseSubpath(Mutable);

  return Mutable;
}

void __82__CDKeylineImageFactory__cornerPathWithDevice_size_innerCircleRadius_strokeWidth___block_invoke(double *a1, CGMutablePathRef path)
{
  CGPathAddArc(path, 0, a1[4] - a1[5], a1[5], a1[5] - a1[6] * 0.5, -1.57079633, a1[7], 0);
  CGPathAddArc(path, 0, a1[8], a1[9], a1[10] + a1[6] * 0.5, a1[7] + -3.14159265, -1.57079633 - a1[11], 1);
  double v4 = a1[12];
  CGFloat v5 = a1[11];
  double v6 = a1[13] - v4;
  double v7 = v4 - a1[6] * 0.5;
  CGPathAddArc(path, 0, v4, v6, v7, v5, -3.14159265, 0);
}

void __82__CDKeylineImageFactory__cornerPathWithDevice_size_innerCircleRadius_strokeWidth___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(double **)(a2 + 8);
  switch(*(_DWORD *)a2)
  {
    case 0:
      double v4 = *(CGPath **)(a1 + 40);
      CGFloat v5 = *v3;
      CGFloat v6 = v3[1];
      CGPathMoveToPoint(v4, 0, v5, v6);
      break;
    case 1:
      double v7 = *(double *)(a1 + 48) * 0.5;
      double v8 = *v3;
      double v9 = v3[1];
      BOOL v10 = v9 == v7 && v8 <= *(double *)(a1 + 56) - *(double *)(a1 + 64);
      BOOL v23 = v8 == v7 && v9 <= *(double *)(a1 + 72) - *(double *)(a1 + 80);
      if (v10 || v23)
      {
        CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 40), 0, v8, v9);
        double v8 = *v3;
        double v9 = v3[1];
        double v7 = *(double *)(a1 + 48) * 0.5;
      }
      double v24 = *(double *)(a1 + 88) - v7;
      double v25 = *(double *)(a1 + 96) - v7;
      if (v8 == v24 && v9 == v25)
      {
        double v27 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
        v27();
      }
      break;
    case 2:
      double v11 = *(CGPath **)(a1 + 40);
      CGFloat v12 = *v3;
      CGFloat v13 = v3[1];
      CGFloat v14 = v3[2];
      CGFloat v15 = v3[3];
      CGPathAddQuadCurveToPoint(v11, 0, v12, v13, v14, v15);
      break;
    case 3:
      double v16 = *(CGPath **)(a1 + 40);
      CGFloat v17 = *v3;
      CGFloat v18 = v3[1];
      CGFloat v19 = v3[2];
      CGFloat v20 = v3[3];
      CGFloat v21 = v3[4];
      CGFloat v22 = v3[5];
      CGPathAddCurveToPoint(v16, 0, v17, v18, v19, v20, v21, v22);
      break;
    default:
      return;
  }
}

+ (id)heartKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 sideCircleRadius:(double)a6 topCircleRadius:(double)a7 strokeWidth:(double)a8 filled:(BOOL)a9
{
  BOOL v9 = a9;
  id v16 = a3;
  if (heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__onceToken != -1) {
    dispatch_once(&heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__onceToken, &__block_literal_global_14);
  }
  CGFloat v17 = objc_msgSend(NSString, "stringWithFormat:", @"%lu-%f-%f-%f-%f-%f-%i", objc_msgSend(v16, "sizeClass"), *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a8, v9);
  CGFloat v18 = [(id)heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__imageCache objectForKeyedSubscript:v17];

  if (!v18)
  {
    CGFloat v19 = [a1 _heartKeylineWithDevice:v16 outerRadius:v9 innerRadius:a4 sideCircleRadius:a5 topCircleRadius:a6 strokeWidth:a7 filled:a8];
    [(id)heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__imageCache setObject:v19 forKeyedSubscript:v17];
  }
  CGFloat v20 = [(id)heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__imageCache objectForKeyedSubscript:v17];

  return v20;
}

uint64_t __124__CDKeylineImageFactory_heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled___block_invoke()
{
  heartKeylineWithDevice_outerRadius_innerRadius_sideCircleRadius_topCircleRadius_strokeWidth_filled__imageCache = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)_heartKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 sideCircleRadius:(double)a6 topCircleRadius:(double)a7 strokeWidth:(double)a8 filled:(BOOL)a9
{
  double v12 = a4 + a4;
  double radius = a5 - a8 * 0.5;
  CGFloat v13 = a4 - a8 * 0.5;
  CGFloat v14 = a6 - a8 * 0.5;
  double v28 = a8 * 0.5 + a7;
  long double v15 = a5 - a6;
  long double v16 = sqrt((a6 + a7) * (a6 + a7) - v15 * v15);
  double v17 = atan2(v16, v15);
  Mutable = CGPathCreateMutable();
  CGFloat v19 = CGPathCreateMutable();
  CGFloat v20 = CGPathCreateMutable();
  CGFloat v21 = v12 * 0.5;
  CGPathAddArc(v20, 0, v12 * 0.5, v12 * 0.5, v13, 0.0, 6.28318531, 1);
  CGPathCloseSubpath(v20);
  CGPathAddArc(v19, 0, v21, v21, radius, 0.0, 3.14159265, 0);
  CGPathAddArc(v19, 0, v21 - a5 + a6, v21, v14, 3.14159265, -v17, 0);
  CGPathAddArc(v19, 0, v21, v21 - v16, v28, 3.14159265 - v17, v17, 1);
  CGPathAddArc(v19, 0, v21 + a5 - a6, v21, v14, v17 + 3.14159265, 0.0, 0);
  CGPathCloseSubpath(v19);
  CGPathAddPath(Mutable, 0, v19);
  CGPathAddPath(Mutable, 0, v20);
  CGFloat v22 = [MEMORY[0x263F15880] layer];
  [v22 setPath:Mutable];
  if (a9) {
    [MEMORY[0x263F825C8] whiteColor];
  }
  else {
  id v23 = [MEMORY[0x263F825C8] clearColor];
  }
  objc_msgSend(v22, "setFillColor:", objc_msgSend(v23, "CGColor"));

  id v24 = [MEMORY[0x263F825C8] whiteColor];
  objc_msgSend(v22, "setStrokeColor:", objc_msgSend(v24, "CGColor"));

  [v22 setLineWidth:a8];
  v31.CGFloat width = v12;
  v31.double height = v12;
  UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
  [v22 renderInContext:UIGraphicsGetCurrentContext()];
  double v25 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  CGPathRelease(Mutable);
  CGPathRelease(v19);
  CGPathRelease(v20);

  return v25;
}

+ (id)heartKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 sideComplicationDistance:(double)a6 topComplicationDistance:(double)a7 strokeWidth:(double)a8 filled:(BOOL)a9
{
  return (id)objc_msgSend(a1, "heartKeylineWithDevice:outerRadius:innerRadius:sideCircleRadius:topCircleRadius:strokeWidth:filled:", a3, a9, a4);
}

+ (id)smileKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 angle:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  if (smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__onceToken != -1) {
    dispatch_once(&smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__onceToken, &__block_literal_global_19);
  }
  long double v15 = objc_msgSend(NSString, "stringWithFormat:", @"%lu-%f-%f-%f-%f-%i", objc_msgSend(v14, "sizeClass"), *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, v8);
  long double v16 = [(id)smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__imageCache objectForKeyedSubscript:v15];

  if (!v16)
  {
    double v17 = [a1 _smileKeylineWithDevice:v14 outerRadius:v8 innerRadius:a4 angle:a5 strokeWidth:a6 filled:a7];
    [(id)smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__imageCache setObject:v17 forKeyedSubscript:v15];
  }
  CGFloat v18 = [(id)smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__imageCache objectForKeyedSubscript:v15];

  return v18;
}

uint64_t __97__CDKeylineImageFactory_smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled___block_invoke()
{
  smileKeylineWithDevice_outerRadius_innerRadius_angle_strokeWidth_filled__imageCache = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)_smileKeylineWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 angle:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8
{
  BOOL v8 = +[CDKeylineImageFactory smileShapeWithDevice:a3 outerRadius:a8 innerRadius:a4 angle:a5 strokeWidth:a6 filled:a7];
  [v8 bounds];
  v14.CGFloat width = v9;
  v14.double height = v10;
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  [v8 renderInContext:UIGraphicsGetCurrentContext()];
  double v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

+ (id)smileShapeWithDevice:(id)a3 outerRadius:(double)a4 innerRadius:(double)a5 angle:(double)a6 strokeWidth:(double)a7 filled:(BOOL)a8
{
  double v10 = a4 - a5;
  double v11 = (a4 - a5) * 0.5;
  double v12 = (a4 + a5) * 0.5;
  CGFloat v22 = a6 + 1.57079633;
  double v13 = 1.57079633 - a6;
  Mutable = CGPathCreateMutable();
  __double2 v15 = __sincos_stret(v13);
  double v25 = v11 + v12 * v15.__cosval + v11 + v12 * v15.__cosval;
  double y = -(v12 * v15.__sinval - v10 * 0.5);
  CGPathAddArc(Mutable, 0, v25 * 0.5, y, a7 * 0.5 + a5, v22, v13, 1);
  double v16 = -(v11 - v12 * v15.__sinval);
  CGPathAddArc(Mutable, 0, v25 * 0.5 + v12 * v15.__cosval, -(v16 - v12 * v15.__sinval), v11 - a7 * 0.5, v13 + 3.14159265, v13, 0);
  CGPathAddArc(Mutable, 0, v25 * 0.5, y, a4 - a7 * 0.5, v13, v22, 0);
  __double2 v17 = __sincos_stret(v22);
  CGPathAddArc(Mutable, 0, v25 * 0.5 + v12 * v17.__cosval, -(v16 - v12 * v17.__sinval), v11 - a7 * 0.5, v22, v22 + 3.14159265, 0);
  CGFloat v18 = [MEMORY[0x263F15880] layer];
  objc_msgSend(v18, "setBounds:", 0.0, 0.0, v25, a4 - v16);
  [v18 setPath:Mutable];
  if (a8) {
    [MEMORY[0x263F825C8] whiteColor];
  }
  else {
  id v19 = [MEMORY[0x263F825C8] clearColor];
  }
  objc_msgSend(v18, "setFillColor:", objc_msgSend(v19, "CGColor"));

  id v20 = [MEMORY[0x263F825C8] whiteColor];
  objc_msgSend(v18, "setStrokeColor:", objc_msgSend(v20, "CGColor"));

  [v18 setLineWidth:a7];
  CGPathRelease(Mutable);
  return v18;
}

@end