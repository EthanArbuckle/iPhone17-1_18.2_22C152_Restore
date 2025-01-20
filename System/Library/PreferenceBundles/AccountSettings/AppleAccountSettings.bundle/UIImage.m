@interface UIImage
+ (id)_circularImageFromIcon:(id)a3 size:(double)a4 scale:(double)a5;
+ (id)aaui_imageFromColor:(id)a3;
+ (id)addBackgroundForImage:(id)a3 withBackgroundColor:(id)a4;
+ (id)addBackgroundForImage:(id)a3 withBackgroundColor:(id)a4 yShift:(double)a5;
+ (id)circularImageForBundleID:(id)a3 size:(double)a4 scale:(double)a5;
+ (id)circularImageFromCGImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5;
- (CGRect)_cropRectForRawImageOrientation:(CGRect)a3;
- (id)_imageByCroppingCGImageToRect:(CGRect)a3;
- (id)_imageByCroppingCIImageToRect:(CGRect)a3;
- (id)imageByCroppingToRect:(CGRect)a3;
@end

@implementation UIImage

+ (id)aaui_imageFromColor:(id)a3
{
  id v3 = a3;
  v7.width = 1.0;
  v7.height = 1.0;
  UIGraphicsBeginImageContext(v7);
  [v3 set];

  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 1.0;
  v8.size.height = 1.0;
  UIRectFill(v8);
  v4 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v4;
}

- (id)imageByCroppingToRect:(CGRect)a3
{
  -[UIImage _cropRectForRawImageOrientation:](self, "_cropRectForRawImageOrientation:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = self;
  if ([(UIImage *)v12 CGImage])
  {
    v13 = -[UIImage _imageByCroppingCGImageToRect:](v12, "_imageByCroppingCGImageToRect:", v5, v7, v9, v11);
  }
  else
  {
    v14 = [(UIImage *)v12 CIImage];

    if (v14)
    {
      v13 = -[UIImage _imageByCroppingCIImageToRect:](v12, "_imageByCroppingCIImageToRect:", v5, v7, v9, v11);
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)_imageByCroppingCGImageToRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  double v8 = [(UIImage *)v7 CGImage];
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v9 = CGImageCreateWithImageInRect(v8, v14);
  [(UIImage *)v7 scale];
  double v11 = +[UIImage imageWithCGImage:v9 scale:[(UIImage *)v7 imageOrientation] orientation:v10];
  CGImageRelease(v9);

  return v11;
}

- (id)_imageByCroppingCIImageToRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(UIImage *)self CIImage];
  double v9 = objc_msgSend(v8, "imageByCroppingToRect:", x, y, width, height);

  [(UIImage *)self scale];
  double v11 = +[UIImage imageWithCIImage:v9 scale:[(UIImage *)self imageOrientation] orientation:v10];

  return v11;
}

- (CGRect)_cropRectForRawImageOrientation:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  *(_OWORD *)&v24.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v24.c = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v27.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v27.c = *(_OWORD *)&v24.c;
  *(_OWORD *)&v24.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v27.tCGFloat x = *(_OWORD *)&v24.tx;
  UIImageOrientation v8 = [(UIImage *)self imageOrientation];
  if ((unint64_t)v8 <= 7)
  {
    if (((1 << v8) & 0x22) != 0)
    {
      CGAffineTransform v26 = v24;
      CGAffineTransformRotate(&v27, &v26, 3.14159265);
      [(UIImage *)self size];
      double v15 = v14;
      [(UIImage *)self scale];
      double v17 = -(v15 * v16);
      [(UIImage *)self size];
      double v19 = v18;
      [(UIImage *)self scale];
      double v13 = -(v19 * v20);
      CGAffineTransform v25 = v27;
      double v12 = v17;
      goto LABEL_8;
    }
    if (((1 << v8) & 0x44) != 0)
    {
      CGAffineTransform v26 = v24;
      CGAffineTransformRotate(&v27, &v26, 1.57079633);
      [(UIImage *)self size];
      double v22 = v21;
      [(UIImage *)self scale];
      double v13 = -(v22 * v23);
      CGAffineTransform v25 = v27;
      double v12 = 0.0;
      goto LABEL_8;
    }
    if (((1 << v8) & 0x88) != 0)
    {
      CGAffineTransform v26 = v24;
      CGAffineTransformRotate(&v27, &v26, -1.57079633);
      [(UIImage *)self size];
      double v10 = v9;
      [(UIImage *)self scale];
      double v12 = -(v10 * v11);
      CGAffineTransform v25 = v27;
      double v13 = 0.0;
LABEL_8:
      CGAffineTransformTranslate(&v26, &v25, v12, v13);
      CGAffineTransform v27 = v26;
    }
  }
  CGAffineTransform v26 = v27;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v28, &v26);
}

+ (id)circularImageForBundleID:(id)a3 size:(double)a4 scale:(double)a5
{
  id v8 = a3;
  id v9 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v8];

  double v10 = [a1 _circularImageFromIcon:v9 size:a4 scale:a5];

  return v10;
}

+ (id)_circularImageFromIcon:(id)a3 size:(double)a4 scale:(double)a5
{
  id v8 = a3;
  id v9 = objc_msgSend(objc_alloc((Class)ISImageDescriptor), "initWithSize:scale:", a4, a4, a5);
  double v10 = [v8 prepareImageForDescriptor:v9];

  double v11 = objc_msgSend(a1, "circularImageFromCGImage:size:scale:", objc_msgSend(v10, "CGImage"), a4, a4, a5);

  return v11;
}

+ (id)circularImageFromCGImage:(CGImage *)a3 size:(CGSize)a4 scale:(double)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", a4.width, a4.height);
  +[UIImage imageWithCGImage:a3 scale:0 orientation:a5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_4D9C;
  v14[3] = &unk_75158;
  CGFloat v16 = width;
  CGFloat v17 = height;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v15;
  double v11 = [v9 imageWithActions:v14];
  if (!v11)
  {
    double v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_48514(v12);
    }
  }

  return v11;
}

+ (id)addBackgroundForImage:(id)a3 withBackgroundColor:(id)a4
{
  return _[a1 addBackgroundForImage:a3 withBackgroundColor:a4 yShift:0.0];
}

+ (id)addBackgroundForImage:(id)a3 withBackgroundColor:(id)a4 yShift:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  [v7 size];
  double v10 = (29.0 - v9) * 0.5;
  [v7 size];
  double v12 = (29.0 - v11) * 0.5;
  [v7 size];
  uint64_t v14 = v13;
  [v7 size];
  uint64_t v16 = v15;
  id v17 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", 29.0, 29.0);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_5040;
  v33[3] = &unk_75180;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  __asm { FMOV            V0.2D, #29.0 }
  long long v27 = _Q0;
  long long v38 = _Q0;
  id v34 = v8;
  id v35 = v7;
  double v39 = a5;
  double v40 = v10;
  double v41 = v12;
  uint64_t v42 = v14;
  uint64_t v43 = v16;
  id v23 = v7;
  id v24 = v8;
  [v17 imageWithActions:v33];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_50D8;
  v28[3] = &unk_751A8;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  long long v32 = v27;
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  CGAffineTransform v25 = [v17 imageWithActions:v28];

  return v25;
}

@end