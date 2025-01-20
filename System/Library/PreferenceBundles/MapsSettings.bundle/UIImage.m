@interface UIImage
+ (id)_maps_circleImageWithDiameter:(double)a3 color:(id)a4;
+ (id)_maps_imageWithColor:(id)a3;
- (id)_maps_colorMonochromeImageWithColor:(id)a3;
- (id)_maps_colorizedImageWithColor:(id)a3;
- (id)_maps_horizontallyFlippedImage;
- (id)_maps_imageIconWithBackgroundConfiguration:(id)a3;
- (id)_maps_imageInOrientation:(int64_t)a3;
@end

@implementation UIImage

+ (id)_maps_imageWithColor:(id)a3
{
  id v3 = a3;
  v10.width = 1.0;
  v10.height = 1.0;
  UIGraphicsBeginImageContext(v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = v3;
  v6 = (CGColor *)[v5 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  CGContextFillRect(CurrentContext, v11);
  v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v7;
}

+ (id)_maps_circleImageWithDiameter:(double)a3 color:(id)a4
{
  id v5 = a4;
  v12.width = a3;
  v12.height = a3;
  UIGraphicsBeginImageContext(v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v7 = v5;
  v8 = (CGColor *)[v7 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v8);
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = a3;
  v13.size.height = a3;
  CGContextFillEllipseInRect(CurrentContext, v13);
  v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v9;
}

- (id)_maps_imageIconWithBackgroundConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)UIView);
  [v4 iconSize];
  double v7 = v6;
  [v4 iconSize];
  id v9 = objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7, v8);
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  CGSize v10 = [v4 backgroundColor];
  [v9 setBackgroundColor:v10];

  [v4 cornerRadius];
  double v12 = v11;
  CGRect v13 = [v9 layer];
  [v13 setCornerRadius:v12];

  id v14 = [objc_alloc((Class)UIImageView) initWithImage:self];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v14 frame];
  objc_msgSend(v14, "alignmentRectForFrame:");
  CGFloat x = v39.origin.x;
  CGFloat y = v39.origin.y;
  CGFloat width = v39.size.width;
  CGFloat height = v39.size.height;
  double MidX = CGRectGetMidX(v39);
  [v14 frame];
  double v20 = MidX - CGRectGetMidX(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v41);
  [v14 frame];
  double v22 = MidY - CGRectGetMidY(v42);
  [v9 center];
  double v24 = v23 - v20;
  [v9 center];
  objc_msgSend(v14, "setCenter:", v24, v25 - v22);
  v26 = [v4 tintColor];

  [v14 setTintColor:v26];
  [v9 addSubview:v14];
  [v9 frame];
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  v31 = +[UIScreen mainScreen];
  [v31 scale];
  CGFloat v33 = v32;
  v38.CGFloat width = v28;
  v38.CGFloat height = v30;
  UIGraphicsBeginImageContextWithOptions(v38, 0, v33);

  v34 = [v9 layer];
  [v34 renderInContext:UIGraphicsGetCurrentContext()];

  v35 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v35;
}

- (id)_maps_colorizedImageWithColor:(id)a3
{
  id v4 = a3;
  [(UIImage *)self size];
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat y = CGPointZero.y;
  [(UIImage *)self scale];
  CGFloat v12 = v11;
  v19.CGFloat width = v7;
  v19.CGFloat height = v9;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -v9);
  id v14 = v4;
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v14 CGColor]);
  v20.origin.CGFloat x = CGPointZero.x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = v7;
  v20.size.CGFloat height = v9;
  CGContextFillRect(CurrentContext, v20);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationAtop);
  v15 = [(UIImage *)self CGImage];
  v21.origin.CGFloat x = CGPointZero.x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = v7;
  v21.size.CGFloat height = v9;
  CGContextDrawImage(CurrentContext, v21, v15);
  v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v16;
}

- (id)_maps_horizontallyFlippedImage
{
  [(UIImage *)self size];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  [(UIImage *)self scale];
  CGFloat v8 = v7;
  v15.CGFloat width = v4;
  v15.CGFloat height = v6;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v8);
  CurrentContext = UIGraphicsGetCurrentContext();
  [(UIImage *)self size];
  v13.a = -1.0;
  v13.b = 0.0;
  v13.c = 0.0;
  v13.d = 1.0;
  v13.tCGFloat x = v10;
  v13.tCGFloat y = 0.0;
  CGContextConcatCTM(CurrentContext, &v13);
  -[UIImage drawAtPoint:](self, "drawAtPoint:", CGPointZero.x, CGPointZero.y);
  double v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

- (id)_maps_imageInOrientation:(int64_t)a3
{
  [(UIImage *)self size];
  double v6 = v5;
  CGFloat v8 = v7;
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v22.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v22.c = v9;
  *(_OWORD *)&v22.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  switch(a3)
  {
    case 0:
      CGFloat v10 = self;
      goto LABEL_17;
    case 1:
      CGAffineTransformMakeTranslation(&v22, v5, v8);
      CGAffineTransform v20 = v22;
      CGAffineTransformRotate(&transform, &v20, 3.14159265);
      goto LABEL_9;
    case 2:
      CGAffineTransformMakeTranslation(&v22, 0.0, v5);
      *(_OWORD *)&v20.a = *(_OWORD *)&v22.a;
      *(_OWORD *)&v20.c = *(_OWORD *)&v22.c;
      long long v11 = *(_OWORD *)&v22.tx;
      goto LABEL_12;
    case 3:
      CGAffineTransformMakeTranslation(&v22, v8, 0.0);
      goto LABEL_14;
    case 4:
      CGAffineTransformMakeTranslation(&v22, v5, 0.0);
      CGAffineTransform v20 = v22;
      CGFloat v12 = -1.0;
      CGFloat v13 = 1.0;
      goto LABEL_8;
    case 5:
      CGAffineTransformMakeTranslation(&v22, 0.0, v8);
      CGAffineTransform v20 = v22;
      CGFloat v12 = 1.0;
      CGFloat v13 = -1.0;
LABEL_8:
      CGAffineTransformScale(&transform, &v20, v12, v13);
LABEL_9:
      CGAffineTransform v22 = transform;
      goto LABEL_10;
    case 6:
      CGAffineTransformMakeTranslation(&v22, v8, v5);
      CGAffineTransform v20 = v22;
      CGAffineTransformScale(&transform, &v20, -1.0, 1.0);
      long long v11 = *(_OWORD *)&transform.tx;
      CGAffineTransform v22 = transform;
      *(_OWORD *)&v20.a = *(_OWORD *)&transform.a;
      *(_OWORD *)&v20.c = *(_OWORD *)&transform.c;
LABEL_12:
      *(_OWORD *)&v20.tCGFloat x = v11;
      CGFloat v15 = 4.71238898;
      goto LABEL_15;
    case 7:
      CGAffineTransformMakeScale(&v22, -1.0, 1.0);
LABEL_14:
      CGAffineTransform v20 = v22;
      CGFloat v15 = 1.57079633;
LABEL_15:
      CGAffineTransformRotate(&transform, &v20, v15);
      CGAffineTransform v22 = transform;
      CGFloat v14 = v8;
      CGFloat v8 = v6;
      break;
    default:
LABEL_10:
      CGFloat v14 = v6;
      break;
  }
  [(UIImage *)self scale];
  CGFloat v17 = v16;
  v24.CGFloat width = v14;
  v24.CGFloat height = v8;
  UIGraphicsBeginImageContextWithOptions(v24, 0, v17);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGAffineTransform transform = v22;
  CGContextConcatCTM(CurrentContext, &transform);
  -[UIImage drawAtPoint:](self, "drawAtPoint:", CGPointZero.x, CGPointZero.y);
  UIGraphicsGetImageFromCurrentImageContext();
  CGFloat v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
LABEL_17:

  return v10;
}

- (id)_maps_colorMonochromeImageWithColor:(id)a3
{
  id v4 = a3;
  CGFloat v5 = self;
  uint64_t v6 = +[CIImage imageWithCGImage:[(UIImage *)v5 CGImage]];
  double v7 = (void *)v6;
  if (v6)
  {
    v18[0] = v6;
    v17[0] = kCIInputImageKey;
    v17[1] = kCIInputColorKey;
    id v8 = [objc_alloc((Class)CIColor) initWithColor:v4];
    v17[2] = kCIInputIntensityKey;
    v18[1] = v8;
    v18[2] = &off_7D0E0;
    long long v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    CGFloat v10 = +[CIFilter filterWithName:@"CIColorMonochrome" withInputParameters:v9];

    long long v11 = [v10 outputImage];
    if (v11)
    {
      CGFloat v12 = +[CIContext contextWithOptions:0];
      [v11 extent];
      CGFloat v13 = (CGImage *)objc_msgSend(v12, "createCGImage:fromRect:", v11);
      [(UIImage *)v5 scale];
      CGFloat v15 = +[UIImage imageWithCGImage:v13 scale:[(UIImage *)v5 imageOrientation] orientation:v14];
      CGImageRelease(v13);
    }
    else
    {
      CGFloat v15 = v5;
    }
  }
  else
  {
    CGFloat v15 = v5;
  }

  return v15;
}

@end