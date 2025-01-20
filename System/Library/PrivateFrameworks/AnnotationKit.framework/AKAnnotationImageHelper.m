@interface AKAnnotationImageHelper
+ (CGImage)createImageOfAnnotation:(id)a3 withScale:(double)a4;
+ (id)_imageOfSize:(CGSize)a3 forAnnotation:(id)a4 strokeWidth:(double)a5 withFillColor:(BOOL)a6;
+ (id)imageForShapeTag:(int64_t)a3;
+ (id)imageOfSize:(CGSize)a3 forAnnotation:(id)a4;
+ (id)imageOfSize:(CGSize)a3 forAnnotationTag:(int64_t)a4;
+ (id)imageOfSize:(CGSize)a3 forPath:(id)a4;
+ (id)imageOfSize:(CGSize)a3 withFillColor:(id)a4 forSignature:(id)a5;
+ (void)_drawFilledShapeImageForAnnotation:(id)a3 inRect:(CGRect)a4 inContext:(CGContext *)a5;
+ (void)_drawImageForPath:(id)a3 inRect:(CGRect)a4 inContext:(CGContext *)a5;
+ (void)_drawImageForSignature:(id)a3 withFillColor:(id)a4 scale:(double)a5 pathOffset:(CGPoint)a6 inContext:(CGContext *)a7;
@end

@implementation AKAnnotationImageHelper

+ (id)imageForShapeTag:(int64_t)a3
{
  if ((unint64_t)(a3 - 764000) > 0x15) {
    v3 = 0;
  }
  else {
    v3 = off_264CDB838[a3 - 764000];
  }
  v4 = (void *)MEMORY[0x263F1C6B0];
  v5 = +[AKController akBundle];
  v6 = [v4 imageNamed:v3 inBundle:v5 compatibleWithTraitCollection:0];

  return v6;
}

+ (id)imageOfSize:(CGSize)a3 forAnnotationTag:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = [MEMORY[0x263F1C550] blackColor];
  v8 = [MEMORY[0x263F1C550] clearColor];
  v9 = 0;
  int64_t v10 = a4 - 764000;
  uint64_t v11 = 0;
  switch(v10)
  {
    case 0:
      v12 = (AKOvalAnnotation *)objc_opt_new();
      v9 = v12;
      goto LABEL_4;
    case 2:
      v9 = objc_alloc_init(AKOvalAnnotation);
      [(AKStrokedAnnotation *)v9 setHasShadow:0];
      v12 = v9;
LABEL_4:
      [(AKShapeAnnotation *)v12 setFillColor:v8];
      [(AKStrokedAnnotation *)v9 setStrokeWidth:1.5];
      [(AKStrokedAnnotation *)v9 setStrokeColor:v7];
      -[AKRectangularShapeAnnotation setRectangle:](v9, "setRectangle:", 0.0, 0.0, width, height);
      break;
    case 3:
      goto LABEL_7;
    case 4:
      uint64_t v11 = 1;
      goto LABEL_7;
    case 5:
      uint64_t v11 = 2;
LABEL_7:
      v9 = (AKOvalAnnotation *)objc_opt_new();
      [(AKOvalAnnotation *)v9 setArrowHeadStyle:v11];
      [(AKStrokedAnnotation *)v9 setStrokeWidth:1.5];
      [(AKStrokedAnnotation *)v9 setStrokeColor:v7];
      v20.origin.x = 0.0;
      v20.origin.y = 0.0;
      v20.size.double width = width;
      v20.size.double height = height;
      double MinX = CGRectGetMinX(v20);
      v21.origin.x = 0.0;
      v21.origin.y = 0.0;
      v21.size.double width = width;
      v21.size.double height = height;
      -[AKOvalAnnotation setStartPoint:](v9, "setStartPoint:", MinX, CGRectGetMinY(v21));
      v22.origin.x = 0.0;
      v22.origin.y = 0.0;
      v22.size.double width = width;
      v22.size.double height = height;
      double MidX = CGRectGetMidX(v22);
      v23.origin.x = 0.0;
      v23.origin.y = 0.0;
      v23.size.double width = width;
      v23.size.double height = height;
      -[AKOvalAnnotation setMidPoint:](v9, "setMidPoint:", MidX, CGRectGetMidY(v23));
      v24.origin.x = 0.0;
      v24.origin.y = 0.0;
      v24.size.double width = width;
      v24.size.double height = height;
      double MaxX = CGRectGetMaxX(v24);
      v25.origin.x = 0.0;
      v25.origin.y = 0.0;
      v25.size.double width = width;
      v25.size.double height = height;
      -[AKOvalAnnotation setEndPoint:](v9, "setEndPoint:", MaxX, CGRectGetMaxY(v25));
      break;
    case 7:
      v9 = (AKOvalAnnotation *)objc_opt_new();
      -[AKRectangularShapeAnnotation setRectangle:](v9, "setRectangle:", 0.0, 0.0, width, height);
      [(AKRectangularShapeAnnotation *)v9 rectangle];
      CGFloat v18 = CGRectGetMinX(v26) + -10.0;
      [(AKRectangularShapeAnnotation *)v9 rectangle];
      -[AKOvalAnnotation setPointyBitPoint:](v9, "setPointyBitPoint:", v18, CGRectGetMinY(v27) + -10.0);
      [(AKShapeAnnotation *)v9 setFillColor:v8];
      [(AKStrokedAnnotation *)v9 setStrokeColor:v7];
      [(AKStrokedAnnotation *)v9 setStrokeWidth:1.5];
      [(AKOvalAnnotation *)v9 setPointyBitBaseWidthAngle:25.0];
      break;
    case 8:
      v9 = (AKOvalAnnotation *)objc_opt_new();
      -[AKRectangularShapeAnnotation setRectangle:](v9, "setRectangle:", 0.0, 0.0, width, height);
      [(AKShapeAnnotation *)v9 setFillColor:v8];
      [(AKStrokedAnnotation *)v9 setStrokeWidth:1.5];
      [(AKStrokedAnnotation *)v9 setStrokeColor:v7];
      [(AKOvalAnnotation *)v9 setPointCount:5];
      +[AKStarAnnotationRenderer defaultInnerRadiusForStar:v9];
      -[AKOvalAnnotation setInnerRadiusFactor:](v9, "setInnerRadiusFactor:");
      break;
    default:
      break;
  }
  [(AKAnnotation *)v9 setOriginalModelBaseScaleFactor:1.0];
  [(AKAnnotation *)v9 setOriginalExifOrientation:1];
  v16 = objc_msgSend((id)objc_opt_class(), "_imageOfSize:forAnnotation:strokeWidth:withFillColor:", v9, 0, width, height, 1.5);

  return v16;
}

+ (id)imageOfSize:(CGSize)a3 forAnnotation:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "_imageOfSize:forAnnotation:strokeWidth:withFillColor:", v6, 1, width, height, 1.0);

  return v7;
}

+ (id)_imageOfSize:(CGSize)a3 forAnnotation:(id)a4 strokeWidth:(double)a5 withFillColor:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat height = a3.height;
  double width = a3.width;
  id v10 = a4;
  if (objc_opt_respondsToSelector())
  {
    if (objc_opt_respondsToSelector()) {
      [v10 setHasShadow:0];
    }
    if (objc_opt_respondsToSelector()) {
      [v10 setStrokeWidth:a5];
    }
    if (objc_opt_respondsToSelector()) {
      [v10 setDashed:0];
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [MEMORY[0x263F1C550] blackColor];
      [v10 performSelector:sel_setStrokeColor_ withObject:v11];
    }
    if (v6
      && (objc_opt_respondsToSelector() & 1) != 0
      && ([v10 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      v12 = [MEMORY[0x263F1C550] akColorWithWhite:0.2 alpha:0.2];
      [v10 performSelector:sel_setFillColor_ withObject:v12];
    }
    if (objc_opt_respondsToSelector())
    {
      v13 = (void *)[objc_alloc(MEMORY[0x263F1C380]) initWithString:&stru_26EA57918];
      [v10 performSelector:sel_setAnnotationText_ withObject:v13];
    }
  }
  v14 = [MEMORY[0x263F1C920] mainScreen];
  [v14 scale];
  CGFloat v16 = v15;
  v21.double width = width;
  v21.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v21, 0, v16);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, 0.0, height);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  objc_msgSend((id)objc_opt_class(), "_drawFilledShapeImageForAnnotation:inRect:inContext:", v10, CurrentContext, 0.0, 0.0, width, height);
  CGFloat v18 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v18;
}

+ (void)_drawFilledShapeImageForAnnotation:(id)a3 inRect:(CGRect)a4 inContext:(CGContext *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  CGContextSaveGState(a5);
  uint64_t v11 = [v10 originalExifOrientation];
  v12 = objc_getAssociatedObject(v10, @"com.apple.AnnotationKit.AnnotationImageHelperAdditionalExifHintKey");
  v13 = v12;
  if (v12) {
    uint64_t v11 = [v12 integerValue];
  }
  memset(&v41, 0, sizeof(v41));
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  +[AKGeometryHelper affineTransformForExifOrientation:aboutCenter:](AKGeometryHelper, "affineTransformForExifOrientation:aboutCenter:", v11, MidX, CGRectGetMidY(v44));
  CGAffineTransform transform = v41;
  CGContextConcatCTM(a5, &transform);
  v42.CGFloat width = 1.0;
  v42.CGFloat height = 1.0;
  CGSize v15 = CGContextConvertSizeToDeviceSpace(a5, v42);
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  CGRect v46 = CGRectInset(v45, 4.0, 4.0);
  double v16 = v46.size.width;
  double v17 = v46.size.height;
  +[AKAnnotationRenderer drawingBoundsOfAnnotation:](AKAnnotationRenderer, "drawingBoundsOfAnnotation:", v10, v46.origin.x, v46.origin.y);
  CGFloat v37 = width;
  CGFloat v38 = height;
  CGFloat v22 = v18;
  double v23 = v19;
  CGFloat v24 = v20;
  CGFloat v25 = v21;
  if (v16 / v20 >= v17 / v21) {
    double v26 = v17 / v21;
  }
  else {
    double v26 = v16 / v20;
  }
  CGFloat v27 = CGRectGetWidth(*(CGRect *)&v18) * v26;
  double v39 = v22;
  v47.origin.CGFloat x = v22;
  v47.origin.CGFloat y = v23;
  v47.size.CGFloat width = v24;
  v47.size.CGFloat height = v25;
  CGFloat v28 = CGRectGetHeight(v47) * v26;
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = v37;
  v48.size.CGFloat height = v38;
  CGFloat v29 = (CGRectGetWidth(v48) - v27) * 0.5;
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = v37;
  v49.size.CGFloat height = v38;
  CGFloat v30 = CGRectGetHeight(v49);
  CGContextTranslateCTM(a5, v29, (v30 - v28) * 0.5);
  CGContextScaleCTM(a5, v26, v26);
  *(void *)&double v31 = *(_OWORD *)&CGContextConvertSizeToUserSpace(a5, v15);
  id v32 = v10;
  v33 = v32;
  if (objc_opt_respondsToSelector())
  {
    v33 = (void *)[v32 copy];

    [v33 strokeWidth];
    if (v34 == 0.0) {
      double v34 = 1.0;
    }
    objc_msgSend(v33, "setStrokeWidth:", v31 * v34, *(void *)&v37, *(void *)&v38);
  }
  +[AKAnnotationRenderer drawingBoundsOfAnnotation:](AKAnnotationRenderer, "drawingBoundsOfAnnotation:", v33, *(void *)&v37, *(void *)&v38);
  CGContextTranslateCTM(a5, v35 - v39, v36 - v23);
  +[AKAnnotationRenderer renderAnnotation:v33 intoContext:a5 forDisplay:0 pageControllerOrNil:0];
  CGContextRestoreGState(a5);
}

+ (id)imageOfSize:(CGSize)a3 forPath:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = (void *)MEMORY[0x263F1C920];
  id v7 = a4;
  v8 = [v6 mainScreen];
  [v8 scale];
  CGFloat v10 = v9;
  v15.double width = width;
  v15.double height = height;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v10);

  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend((id)objc_opt_class(), "_drawImageForPath:inRect:inContext:", v7, CurrentContext, 0.0, 0.0, width, height);

  v12 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v12;
}

+ (void)_drawImageForPath:(id)a3 inRect:(CGRect)a4 inContext:(CGContext *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  [v10 bounds];
  CGFloat v26 = v11;
  CGFloat v13 = v12;
  double v15 = v14;
  double v17 = v16;
  CGContextSaveGState(a5);
  v28.CGFloat width = 1.0;
  v28.CGFloat height = 1.0;
  CGSize v18 = CGContextConvertSizeToDeviceSpace(a5, v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v30);
  CGContextTranslateCTM(a5, MidX, MidY);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGRect v32 = CGRectInset(v31, 3.0, 3.0);
  double v21 = v32.size.width / v15;
  if (v32.size.width / v15 >= v32.size.height / v17) {
    double v21 = v32.size.height / v17;
  }
  CGContextScaleCTM(a5, v21, v21);
  v33.origin.CGFloat x = v26;
  v33.origin.CGFloat y = v13;
  v33.size.CGFloat width = v15;
  v33.size.CGFloat height = v17;
  CGFloat v22 = -CGRectGetMidX(v33);
  v34.origin.CGFloat x = v26;
  v34.origin.CGFloat y = v13;
  v34.size.CGFloat width = v15;
  v34.size.CGFloat height = v17;
  CGFloat v23 = CGRectGetMidY(v34);
  CGContextTranslateCTM(a5, v22, -v23);
  *(void *)&double v24 = *(_OWORD *)&CGContextConvertSizeToUserSpace(a5, v18);
  CGFloat v25 = [MEMORY[0x263F1C550] blackColor];
  [v25 set];

  [v10 setLineWidth:v24];
  [v10 stroke];

  CGContextRestoreGState(a5);
}

+ (id)imageOfSize:(CGSize)a3 withFillColor:(id)a4 forSignature:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a4;
  id v9 = a5;
  if ([v9 path] && !CGPathIsEmpty((CGPathRef)objc_msgSend(v9, "path")))
  {
    [v9 pathBounds];
    double v14 = v13;
    double v16 = v15;
    if (width / v11 >= height / v12) {
      double v17 = height / v12;
    }
    else {
      double v17 = width / v11;
    }
    v23.double width = (double)(uint64_t)ceil(v11 * v17);
    CGFloat v18 = (double)(uint64_t)ceil(v12 * v17);
    v23.double height = v18;
    UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
    CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
    v21.b = 0.0;
    v21.c = 0.0;
    v21.a = 1.0;
    *(_OWORD *)&v21.d = xmmword_2376F4600;
    v21.tCGFloat y = v18;
    CGContextConcatCTM(CurrentContext, &v21);
    objc_msgSend((id)objc_opt_class(), "_drawImageForSignature:withFillColor:scale:pathOffset:inContext:", v9, v8, CurrentContext, v17, v14, v16);
    id v10 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (void)_drawImageForSignature:(id)a3 withFillColor:(id)a4 scale:(double)a5 pathOffset:(CGPoint)a6 inContext:(CGContext *)a7
{
  double y = a6.y;
  double x = a6.x;
  id v15 = a3;
  id v12 = a4;
  CGContextSaveGState(a7);
  CGContextScaleCTM(a7, a5, a5);
  CGContextTranslateCTM(a7, -x, -y);
  id v13 = v12;
  double v14 = (CGColor *)[v13 CGColor];

  CGContextSetFillColorWithColor(a7, v14);
  if ([v15 path])
  {
    CGContextAddPath(a7, (CGPathRef)[v15 path]);
    CGContextFillPath(a7);
  }
  CGContextRestoreGState(a7);
}

+ (CGImage)createImageOfAnnotation:(id)a3 withScale:(double)a4
{
  id v5 = a3;
  CGColorSpaceRef v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  if (v6)
  {
    id v7 = v6;
    [v5 drawingBounds];
    size_t v9 = vcvtpd_u64_f64(v8 * a4);
    double v11 = CGBitmapContextCreate(0, v9, vcvtpd_u64_f64(v10 * a4), 8uLL, 4 * v9, v7, 2u);
    if (v11)
    {
      id v12 = v11;
      CGContextScaleCTM(v11, a4, a4);
      +[AKAnnotationRenderer renderAnnotation:v5 intoContext:v12 forDisplay:0 pageControllerOrNil:0];
      Image = CGBitmapContextCreateImage(v12);
      CGContextRelease(v12);
    }
    else
    {
      Image = 0;
    }
    CGColorSpaceRelease(v7);
  }
  else
  {
    Image = 0;
  }

  return Image;
}

@end