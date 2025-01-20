@interface CLKUIAnalogHandFactory
+ (CGPath)newPathForHourMinuteWithConfiguration:(id)a3 inset:(double)a4 includePeg:(BOOL)a5;
+ (CGPath)newPathForInlayWithConfiguration:(id)a3 inset:(double)a4;
+ (CGPath)newPathForPeg:(id)a3 inset:(double)a4;
+ (CGPath)newPathForSecondWithConfiguration:(id)a3 inset:(double)a4;
+ (CGPath)newPathWithConfiguration:(id)a3;
+ (id)_createHandImageWithSize:(CGSize)a3 paths:(id)a4 colors:(id)a5;
+ (id)_createMaskedShadowImageFromShadow:(id)a3 size:(CGSize)a4 maskPath:(CGPath *)a5 radius:(double)a6 opacity:(double)a7;
+ (id)_createShadowImageSize:(CGSize)a3 path:(CGPath *)a4 radius:(double)a5 opacity:(double)a6;
+ (id)_getDropShadowImageWithConfiguration:(id)a3;
+ (id)_getHandImageWithConfiguration:(id)a3;
+ (id)_getInlayImageWithConfiguration:(id)a3;
+ (id)_getMaskedDropShadowImageWithConfiguration:(id)a3 shadowImage:(id)a4;
+ (id)_getRadialShadowImageWithConfiguration:(id)a3;
+ (id)_getShadowImageWithConfiguration:(id)a3 radius:(double)a4 opacity:(double)a5 key:(id)a6;
+ (id)getAssets:(unint64_t)a3 forConfiguration:(id)a4;
@end

@implementation CLKUIAnalogHandFactory

+ (id)getAssets:(unint64_t)a3 forConfiguration:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v7 = +[CLKUIAnalogHandFactoryCache sharedInstance];
  if (!a3)
  {
    v20 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_48;
  }
  v8 = NSString;
  v9 = [v6 handCacheIdentifier];
  v10 = [v8 stringWithFormat:@"hand-%@", v9];

  v11 = NSString;
  v12 = [v6 dropShadowCacheIdentifier];
  v42 = [v11 stringWithFormat:@"hand-%@", v12];

  v13 = NSString;
  v14 = [v6 radialShadowCacheIdentifier];
  v41 = [v13 stringWithFormat:@"hand-%@", v14];

  v15 = NSString;
  v16 = [v6 dropShadowCacheIdentifier];
  v39 = [v15 stringWithFormat:@"maskedShadow-%@", v16];

  v17 = NSString;
  v18 = [v6 handCacheIdentifier];
  v40 = [v17 stringWithFormat:@"inlay-%@", v18];

  if (a3) {
    uint64_t v19 = [a1 newPathWithConfiguration:v6];
  }
  else {
    uint64_t v19 = 0;
  }
  CFTypeRef arg = (CFTypeRef)v19;
  if ((a3 & 2) != 0)
  {
    v22 = +[CLKUIAnalogHandFactoryCache sharedInstance];
    v21 = [v22 imageForKey:v10];

    if (v21)
    {
      if ((a3 & 4) != 0) {
        goto LABEL_13;
      }
    }
    else
    {
      v21 = [a1 _getHandImageWithConfiguration:v6];
      if ((a3 & 4) != 0) {
        goto LABEL_13;
      }
    }
LABEL_11:
    v23 = 0;
    goto LABEL_15;
  }
  v21 = 0;
  if ((a3 & 4) == 0) {
    goto LABEL_11;
  }
LABEL_13:
  v24 = +[CLKUIAnalogHandFactoryCache sharedInstance];
  v23 = [v24 imageForKey:v41];

  if (!v23)
  {
    v23 = [a1 _getRadialShadowImageWithConfiguration:v6];
  }
LABEL_15:
  v25 = (void *)(a3 & 0x18);
  if ((a3 & 0x18) != 0)
  {
    v26 = +[CLKUIAnalogHandFactoryCache sharedInstance];
    v27 = [v26 imageForKey:v42];

    if ((a3 & 0x10) != 0)
    {
      v28 = +[CLKUIAnalogHandFactoryCache sharedInstance];
      v25 = [v28 imageForKey:v39];

      if (v27)
      {
LABEL_18:
        if ((a3 & 0x10) == 0) {
          goto LABEL_25;
        }
LABEL_23:
        if (!v25)
        {
          v25 = [a1 _getMaskedDropShadowImageWithConfiguration:v6 shadowImage:v27];
        }
        goto LABEL_25;
      }
    }
    else
    {
      v25 = 0;
      if (v27) {
        goto LABEL_18;
      }
    }
    v27 = [a1 _getDropShadowImageWithConfiguration:v6];
    if ((a3 & 0x10) != 0) {
      goto LABEL_23;
    }
  }
  else
  {
    v27 = 0;
  }
LABEL_25:
  if ((a3 & 0x20) != 0)
  {
    +[CLKUIAnalogHandFactoryCache sharedInstance];
    v31 = v30 = v10;
    v29 = [v31 imageForKey:v40];

    v10 = v30;
    if (!v29)
    {
      v29 = [a1 _getInlayImageWithConfiguration:v6];
    }
  }
  else
  {
    v29 = 0;
  }
  v20 = objc_opt_new();
  if ((a3 & 1) != 0 && arg) {
    [v20 setObject:CFAutorelease(arg) forKey:&unk_1F2A6A6E0];
  }
  if ((a3 & 2) != 0 && v21)
  {
    [v20 setObject:v21 forKey:&unk_1F2A6A6F8];
    v32 = +[CLKUIAnalogHandFactoryCache sharedInstance];
    [v32 setImage:v21 forKey:v10];
  }
  if ((a3 & 4) != 0 && v23)
  {
    [v20 setObject:v23 forKey:&unk_1F2A6A710];
    v33 = +[CLKUIAnalogHandFactoryCache sharedInstance];
    [v33 setImage:v23 forKey:v41];
  }
  if ((a3 & 0x18) != 0 && v27)
  {
    [v20 setObject:v27 forKey:&unk_1F2A6A728];
    v34 = +[CLKUIAnalogHandFactoryCache sharedInstance];
    [v34 setImage:v27 forKey:v42];
  }
  if ((a3 & 0x10) != 0 && v25)
  {
    [v20 setObject:v25 forKey:&unk_1F2A6A740];
    v35 = +[CLKUIAnalogHandFactoryCache sharedInstance];
    [v35 setImage:v25 forKey:v39];
  }
  if ((a3 & 0x20) != 0 && v29)
  {
    [v20 setObject:v29 forKey:&unk_1F2A6A758];
    v36 = +[CLKUIAnalogHandFactoryCache sharedInstance];
    [v36 setImage:v29 forKey:v40];
  }
LABEL_48:

  return v20;
}

+ (CGPath)newPathWithConfiguration:(id)a3
{
  id v4 = a3;
  [v4 hash];
  kdebug_trace();
  if ([v4 type] == 1)
  {
    uint64_t v5 = [a1 newPathForSecondWithConfiguration:v4 inset:0.0];
LABEL_6:
    id v6 = (CGPath *)v5;
    [v4 hash];
    kdebug_trace();
    goto LABEL_7;
  }
  if (![v4 type])
  {
    uint64_t v5 = objc_msgSend(a1, "newPathForHourMinuteWithConfiguration:inset:includePeg:", v4, objc_msgSend(v4, "excludePeg") ^ 1, 0.0);
    goto LABEL_6;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

+ (id)_getHandImageWithConfiguration:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 hash];
  kdebug_trace();
  if ([v4 type] == 1)
  {
    uint64_t v5 = (const CGPath *)[a1 newPathForSecondWithConfiguration:v4 inset:0.0];
    id v6 = (const CGPath *)[a1 newPathForSecondWithConfiguration:v4 inset:1.0];
    uint64_t v7 = [a1 newPathForSecondWithConfiguration:v4 inset:2.0];
  }
  else
  {
    if ([v4 type])
    {
      id v8 = 0;
      goto LABEL_7;
    }
    uint64_t v5 = (const CGPath *)objc_msgSend(a1, "newPathForHourMinuteWithConfiguration:inset:includePeg:", v4, objc_msgSend(v4, "excludePeg") ^ 1, 0.0);
    id v6 = (const CGPath *)objc_msgSend(a1, "newPathForHourMinuteWithConfiguration:inset:includePeg:", v4, objc_msgSend(v4, "excludePeg") ^ 1, 1.0);
    uint64_t v7 = objc_msgSend(a1, "newPathForHourMinuteWithConfiguration:inset:includePeg:", v4, objc_msgSend(v4, "excludePeg") ^ 1, 2.0);
  }
  v9 = (const CGPath *)v7;
  v20[0] = v5;
  v20[1] = v6;
  v20[2] = v7;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.321568627];
  v19[0] = v11;
  v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.752941176];
  v19[1] = v12;
  v13 = [MEMORY[0x1E4FB1618] blackColor];
  v19[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];

  [v4 bounds];
  v17 = objc_msgSend(a1, "_createHandImageWithSize:paths:colors:", v10, v14, v15, v16);
  CGPathRelease(v6);
  CGPathRelease(v9);
  CGPathRelease(v5);
  [v4 hash];
  kdebug_trace();
  id v8 = v17;

LABEL_7:
  return v8;
}

+ (id)_getInlayImageWithConfiguration:(id)a3
{
  void v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 hash];
  kdebug_trace();
  id v5 = 0;
  if ([v4 type] != 1)
  {
    if ([v4 type])
    {
      id v5 = 0;
    }
    else
    {
      id v6 = (const CGPath *)[a1 newPathForInlayWithConfiguration:v4 inset:0.0];
      uint64_t v7 = (const CGPath *)[a1 newPathForInlayWithConfiguration:v4 inset:1.0];
      id v8 = (const CGPath *)[a1 newPathForInlayWithConfiguration:v4 inset:2.0];
      v19[0] = v6;
      v19[1] = v7;
      v19[2] = v8;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
      v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.321568627];
      v18[0] = v10;
      v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.752941176];
      v18[1] = v11;
      v12 = [MEMORY[0x1E4FB1618] blackColor];
      v18[2] = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];

      [v4 bounds];
      double v16 = objc_msgSend(a1, "_createHandImageWithSize:paths:colors:", v9, v13, v14, v15);
      CGPathRelease(v7);
      CGPathRelease(v8);
      CGPathRelease(v6);
      [v4 hash];
      kdebug_trace();
      id v5 = v16;
    }
  }

  return v5;
}

+ (id)_getDropShadowImageWithConfiguration:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [v5 dropShadowCacheIdentifier];
  uint64_t v7 = [v4 stringWithFormat:@"shadow-%@", v6];

  [v5 dropShadowRadius];
  double v9 = v8;
  [v5 dropShadowOpacity];
  v11 = [a1 _getShadowImageWithConfiguration:v5 radius:v7 opacity:v9 key:v10];

  return v11;
}

+ (id)_getRadialShadowImageWithConfiguration:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [v5 radialShadowCacheIdentifier];
  uint64_t v7 = [v4 stringWithFormat:@"shadow-%@", v6];

  [v5 radialShadowRadius];
  double v9 = v8;
  [v5 radialShadowOpacity];
  v11 = [a1 _getShadowImageWithConfiguration:v5 radius:v7 opacity:v9 key:v10];

  return v11;
}

+ (id)_getShadowImageWithConfiguration:(id)a3 radius:(double)a4 opacity:(double)a5 key:(id)a6
{
  id v9 = a3;
  [v9 hash];
  kdebug_trace();
  if ([v9 type] == 1)
  {
    uint64_t v10 = [a1 newPathForSecondWithConfiguration:v9 inset:0.0];
  }
  else
  {
    if ([v9 type])
    {
      v11 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = [a1 newPathForHourMinuteWithConfiguration:v9 inset:1 includePeg:0.0];
  }
  v12 = (const CGPath *)v10;
  [v9 bounds];
  v11 = objc_msgSend(a1, "_createShadowImageSize:path:radius:opacity:", v12, v13, v14, a4 * 0.5, a5);
  CGPathRelease(v12);
  [v9 hash];
  kdebug_trace();
LABEL_7:

  return v11;
}

+ (id)_getMaskedDropShadowImageWithConfiguration:(id)a3 shadowImage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 hash];
  kdebug_trace();
  [v7 dropShadowRadius];
  double v9 = v8 * 0.5;
  [v7 dropShadowOpacity];
  double v11 = v10;
  v12 = (const CGPath *)[a1 newPathForPeg:v7 inset:0.0];
  [v7 bounds];
  double v15 = objc_msgSend(a1, "_createMaskedShadowImageFromShadow:size:maskPath:radius:opacity:", v6, v12, v13, v14, v9, v11);

  CGPathRelease(v12);
  [v7 hash];

  kdebug_trace();
  return v15;
}

+ (id)_createHandImageWithSize:(CGSize)a3 paths:(id)a4 colors:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a4;
  id v9 = a5;
  if (width == 0.0 || height == 0.0)
  {
    v21 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      +[CLKUIAnalogHandFactory _createHandImageWithSize:paths:colors:](v21, width, height);
    }

    v20 = 0;
  }
  else
  {
    v24.double width = width;
    v24.double height = height;
    UIGraphicsBeginImageContextWithOptions(v24, 0, 4.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
    double v11 = [MEMORY[0x1E4F39C88] layer];
    [v11 setFillRule:*MEMORY[0x1E4F39FC0]];
    objc_msgSend(v11, "setBounds:", 0.0, 0.0, width, height);
    [v11 setContentsScale:4.0];
    unint64_t v12 = [v8 count];
    unint64_t v13 = [v9 count];
    if (v12 >= v13) {
      unint64_t v14 = v13;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14)
    {
      unint64_t v15 = 0;
      do
      {
        objc_msgSend(v11, "setPath:", objc_msgSend(v8, "objectAtIndex:", v15));
        id v16 = [v9 objectAtIndex:v15];
        objc_msgSend(v11, "setFillColor:", objc_msgSend(v16, "CGColor"));

        [v11 renderInContext:UIGraphicsGetCurrentContext()];
        ++v15;
        unint64_t v17 = [v8 count];
        unint64_t v18 = [v9 count];
        if (v17 >= v18) {
          unint64_t v19 = v18;
        }
        else {
          unint64_t v19 = v17;
        }
      }
      while (v15 < v19);
    }
    v20 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  return v20;
}

+ (id)_createShadowImageSize:(CGSize)a3 path:(CGPath *)a4 radius:(double)a5 opacity:(double)a6
{
  double height = a3.height;
  double width = a3.width;
  v20.double width = a3.width + a5 * 2.0;
  v20.double height = a3.height + a5 * 2.0;
  UIGraphicsBeginImageContextWithOptions(v20, 0, 2.0);
  double v11 = [MEMORY[0x1E4F39C88] layer];
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, width, height);
  [v11 setContentsScale:2.0];
  [v11 setPath:a4];
  [v11 setFillRule:*MEMORY[0x1E4F39FC0]];
  id v12 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v11, "setFillColor:", objc_msgSend(v12, "CGColor"));

  [v11 setShadowPath:a4];
  [v11 frame];
  objc_msgSend(v11, "setShadowOffset:", CGRectGetWidth(v21) + a5, 0.0);
  *(float *)&double v13 = a6;
  [v11 setShadowOpacity:v13];
  [v11 setShadowRadius:a5 * 0.5];
  id v14 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v11, "setShadowColor:", objc_msgSend(v14, "CGColor"));

  CurrentContext = UIGraphicsGetCurrentContext();
  [v11 frame];
  CGFloat v16 = CGRectGetWidth(v22);
  CGContextTranslateCTM(CurrentContext, -v16, a5);
  [v11 renderInContext:UIGraphicsGetCurrentContext()];
  unint64_t v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

+ (id)_createMaskedShadowImageFromShadow:(id)a3 size:(CGSize)a4 maskPath:(CGPath *)a5 radius:(double)a6 opacity:(double)a7
{
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  CGPathRetain(a5);
  double v13 = [MEMORY[0x1E4F39C88] layer];
  objc_msgSend(v13, "setBounds:", 0.0, 0.0, width, height);
  [v13 setContentsScale:2.0];
  path = a5;
  [v13 setPath:a5];
  [v13 setFillRule:*MEMORY[0x1E4F39FC0]];
  id v14 = [MEMORY[0x1E4FB1618] blackColor];
  objc_msgSend(v13, "setShadowColor:", objc_msgSend(v14, "CGColor"));

  [v13 frame];
  CGFloat v15 = CGRectGetWidth(v36);
  objc_msgSend(v13, "setShadowOffset:", v15 + a6 + v15 + a6, 0.0);
  *(float *)&double v16 = a7;
  [v13 setShadowOpacity:v16];
  [v13 setShadowRadius:a6];
  id v32 = v12;
  unint64_t v17 = (CGImage *)[v32 CGImage];
  size_t v18 = CGImageGetWidth(v17);
  unint64_t v19 = CGImageGetHeight(v17);
  size_t v20 = 4 * v18 * v19;
  CGRect v21 = (unsigned __int8 *)malloc_type_calloc(v20, 1uLL, 0x100004077774924uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v23 = CGBitmapContextCreate(v21, v18, v19, 8uLL, 4 * v18, DeviceRGB, 0x4001u);
  transform.b = 0.0;
  transform.c = 0.0;
  transform.a = 1.0;
  *(_OWORD *)&transform.d = xmmword_1D31B6960;
  transform.ty = (double)v19;
  CGContextConcatCTM(v23, &transform);
  CGContextScaleCTM(v23, 2.0, 2.0);
  [v13 frame];
  CGFloat v24 = CGRectGetWidth(v37);
  CGContextTranslateCTM(v23, -v24, a6);
  [v13 renderInContext:v23];
  Image = CGBitmapContextCreateImage(v23);
  CGContextRelease(v23);
  v26 = (unsigned __int8 *)malloc_type_calloc(v20, 1uLL, 0x100004077774924uLL);
  v27 = CGBitmapContextCreate(v26, v18, v19, 8uLL, 4 * v18, DeviceRGB, 0x4001u);
  CGContextScaleCTM(v27, 2.0, 2.0);
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.double width = width + a6 * 2.0;
  v38.size.double height = height + a6 * 2.0;
  CGContextDrawImage(v27, v38, v17);
  if (v20)
  {
    for (size_t i = 0; i < v20; i += 4)
      v26[i + 3] = (unsigned __int16)(255
                                    * ((v26[i + 3] - v21[i + 3]) & ~(unsigned __int16)((v26[i + 3] - v21[i + 3]) >> 31)))
                 / (v21[i + 3] + 255);
  }
  v29 = CGBitmapContextCreateImage(v27);
  v30 = [MEMORY[0x1E4FB1818] imageWithCGImage:v29 scale:0 orientation:2.0];
  CGImageRelease(Image);
  CGImageRelease(v29);
  CGContextRelease(v27);
  CGColorSpaceRelease(DeviceRGB);
  CGPathRelease(path);
  free(v21);
  free(v26);

  return v30;
}

+ (CGPath)newPathForHourMinuteWithConfiguration:(id)a3 inset:(double)a4 includePeg:(BOOL)a5
{
  BOOL v5 = a5;
  double v6 = a4 * 0.25;
  id v7 = [a3 configurationByApplyingInset:a4 * 0.25];
  Mutable = CGPathCreateMutable();
  [v7 pegRadius];
  double v10 = v9;
  [v7 pegStrokeWidth];
  double v12 = v10 + v11;
  [v7 armWidth];
  double v14 = v13;
  [v7 handWidth];
  double v16 = v15 * 0.5;
  if (v16 < v12) {
    double v16 = v12;
  }
  double v17 = v6 + v16;
  [v7 armLength];
  double v19 = v18;
  [v7 handLength];
  double v21 = v6 + v12 + v19 + v20;
  [v7 smoothingRadius];
  double v66 = v6;
  if (v22 == 0.0)
  {
    float v23 = v14 / (v12 + v12);
    double v24 = asinf(v23);
    double v25 = v24 + -1.57079633;
    double v26 = -1.57079633 - v24;
    v27 = Mutable;
    double v28 = v17;
    CGFloat v29 = v21;
    CGFloat v30 = v12;
    if (v5)
    {
      BOOL v31 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    [v7 armWidth];
    double v33 = v32;
    [v7 smoothingRadius];
    double v35 = v34 + v33 * 0.5;
    [v7 smoothingRadius];
    double v37 = v12 + v36;
    double v38 = sqrt(v37 * v37 - v35 * v35);
    double v39 = acos(v35 / v37);
    CGFloat v40 = v21 - v38;
    double v6 = v66;
    [v7 smoothingRadius];
    CGPathAddArc(Mutable, 0, v17 + v35, v40, v41, 3.14159265, 3.14159265 - v39, 1);
    CGPathAddArc(Mutable, 0, v17, v21, v12, -v39, v39 + 3.14159265, !v5);
    [v7 smoothingRadius];
    CGFloat v30 = v42;
    double v26 = 0.0;
    v27 = Mutable;
    double v28 = v17 - v35;
    CGFloat v29 = v40;
    double v25 = v39;
  }
  BOOL v31 = 1;
LABEL_8:
  CGPathAddArc(v27, 0, v28, v29, v30, v25, v26, v31);
  [v7 handWidth];
  double v44 = v43 * 0.5;
  [v7 handLength];
  double v46 = v6 + v45 - v44;
  [v7 smoothingRadius];
  double v48 = v47;
  [v7 armWidth];
  double v50 = v49;
  if (v48 == 0.0)
  {
    float v51 = v49 / (v44 + v44);
    double v52 = asinf(v51);
    CGPathAddArc(Mutable, 0, v17, v46, v44, v52 + -4.71238898, -3.14159265, 0);
    CGPathAddArc(Mutable, 0, v17, v66 + v44, v44, 3.14159265, 0.0, 0);
    CGPathAddArc(Mutable, 0, v17, v46, v44, 6.28318531, -4.71238898 - v52, 0);
    CGPathCloseSubpath(Mutable);
  }
  else
  {
    [v7 smoothingRadius];
    double v54 = v53 + v50 * 0.5;
    [v7 smoothingRadius];
    double v56 = v44 + v55;
    double v57 = sqrt(v56 * v56 - v54 * v54);
    double v58 = acos(v54 / v56);
    [v7 smoothingRadius];
    CGPathAddArc(Mutable, 0, v17 - v54, v46 + v57, v59, 0.0, -v58, 1);
    CGPathAddArc(Mutable, 0, v17, v46, v44, 3.14159265 - v58, 3.14159265, 0);
    CGPathAddArc(Mutable, 0, v17, v66 + v44, v44, -3.14159265, 0.0, 0);
    CGPathAddArc(Mutable, 0, v17, v46, v44, 0.0, v58, 0);
    [v7 smoothingRadius];
    CGPathAddArc(Mutable, 0, v17 + v54, v46 + v57, v60, v58 + 3.14159265, 3.14159265, 1);
    if ([v7 removeInlay])
    {
      v61 = CGPathCreateMutable();
      CGPathAddArc(v61, 0, v17, v66 + v44, v66 + v44 + -2.0, 0.0, 3.14159265, 1);
      CGPathAddArc(v61, 0, v17, v46, v66 + v44 + -2.0, 3.14159265, 0.0, 1);
      CGPathCloseSubpath(v61);
      CGPathAddPath(Mutable, 0, v61);
      CGPathRelease(v61);
    }
  }
  [v7 pegRadius];
  if (v62 > 0.0 && v5)
  {
    [v7 pegRadius];
    CGPathMoveToPoint(Mutable, 0, v17 + v63, v21);
    [v7 pegRadius];
    CGPathAddArc(Mutable, 0, v17, v21, v64, 0.0, -6.28318531, 1);
    CGPathCloseSubpath(Mutable);
  }

  return Mutable;
}

+ (CGPath)newPathForInlayWithConfiguration:(id)a3 inset:(double)a4
{
  double v4 = a4 * 0.25;
  BOOL v5 = [a3 configurationByApplyingInset:a4 * 0.25];
  Mutable = CGPathCreateMutable();
  [v5 pegRadius];
  double v8 = v7;
  [v5 pegStrokeWidth];
  double v10 = v8 + v9;
  [v5 handWidth];
  double v12 = v11 * 0.5;
  if (v12 < v10) {
    double v12 = v10;
  }
  CGFloat v13 = v4 + v12;
  [v5 handWidth];
  double v15 = v14 * 0.5;
  [v5 handLength];
  CGFloat v17 = v4 + v16 - v15;
  CGFloat v18 = v4 + v15;
  double v19 = CGPathCreateMutable();
  CGFloat v20 = v4 + v15 + -2.0;
  CGPathAddArc(v19, 0, v13, v18, v20, 0.0, 3.14159265, 1);
  CGPathAddArc(v19, 0, v13, v17, v20, 3.14159265, 0.0, 1);
  CGPathCloseSubpath(v19);
  CGPathAddPath(Mutable, 0, v19);
  CGPathRelease(v19);

  return Mutable;
}

+ (CGPath)newPathForSecondWithConfiguration:(id)a3 inset:(double)a4
{
  id v5 = a3;
  double v6 = a4 * 0.25;
  double v7 = [v5 configurationByApplyingInset:a4 * 0.25];
  Mutable = CGPathCreateMutable();
  [v7 pegRadius];
  double v10 = v9;
  [v7 pegStrokeWidth];
  double v12 = v10 + v11;
  double v13 = v6 + v10 + v11;
  [v7 handWidth];
  double v15 = v14 * 0.5;
  if (v13 < v15) {
    double v13 = v15;
  }
  [v7 handLength];
  CGFloat v17 = v6 + v16;
  [v7 handWidth];
  double v19 = v18;
  [v7 smoothingRadius];
  double v21 = v20 + v19 * 0.5;
  [v7 smoothingRadius];
  double v23 = v12 + v22;
  double v24 = sqrt(v23 * v23 - v21 * v21);
  double v25 = acos(v21 / v23);
  CGFloat v74 = v12;
  double startAngle = v25 + 3.14159265;
  CGPathAddArc(Mutable, 0, v13, v17, v12, 3.14159265, v25 + 3.14159265, 0);
  double v71 = v21;
  double v73 = v17;
  double v26 = v17 - v24;
  [v7 smoothingRadius];
  CGFloat v28 = v27;
  double v70 = v13 - v21;
  CGFloat v29 = v13 - v21;
  double v30 = v25;
  CGPathAddArc(Mutable, 0, v29, v17 - v24, v28, v25, 0.0, 1);
  int v31 = [v5 roundedSecondHand];
  [v7 handWidth];
  double v33 = v32 * 0.5;
  if (v31)
  {
    CGFloat v34 = v6 + v33;
    [v7 handWidth];
    CGPathAddLineToPoint(Mutable, 0, v13 - v35 * 0.5, v34);
    [v7 handWidth];
    CGPathAddArc(Mutable, 0, v13, v34, v36 * 0.5, 3.14159265, 0.0, 0);
  }
  else
  {
    CGPathAddLineToPoint(Mutable, 0, v13 - v33, v6);
    [v7 handWidth];
    CGPathAddLineToPoint(Mutable, 0, v13 + v37 * 0.5, v6);
  }
  double v38 = v13 + v71;
  objc_msgSend(v7, "smoothingRadius", *(void *)&v6);
  double v72 = 3.14159265 - v25;
  CGPathAddArc(Mutable, 0, v38, v26, v39, 3.14159265, 3.14159265 - v25, 1);
  CGFloat v40 = 0.0;
  CGFloat v42 = v73;
  CGFloat v41 = v74;
  double v69 = -v30;
  CGPathAddArc(Mutable, 0, v13, v73, v74, -v30, 0.0, 0);
  if (([v7 excludeSecondTail] & 1) == 0)
  {
    CGPathAddArc(Mutable, 0, v13, v73, v74, 0.0, v30, 0);
    [v7 smoothingRadius];
    CGPathAddArc(Mutable, 0, v38, v73 + v24, v43, startAngle, 3.14159265, 1);
    if ([v5 roundedSecondHand])
    {
      [v7 handLength];
      double v45 = v44;
      [v7 tailLength];
      double v47 = v67 + v45 + v46;
      [v7 handWidth];
      CGFloat v49 = v47 - v48 * 0.5;
      [v7 handWidth];
      CGPathAddLineToPoint(Mutable, 0, v13 + v50 * 0.5, v49);
      [v7 handWidth];
      CGFloat v42 = v73;
      CGPathAddArc(Mutable, 0, v13, v49, v51 * 0.5, 0.0, -3.14159265, 0);
    }
    else
    {
      [v7 handWidth];
      CGFloat v53 = v13 + v52 * 0.5;
      [v7 handLength];
      double v55 = v54;
      [v7 tailLength];
      CGPathAddLineToPoint(Mutable, 0, v53, v67 + v55 + v56);
      [v7 handWidth];
      CGFloat v58 = v13 - v57 * 0.5;
      [v7 handLength];
      double v60 = v59;
      [v7 tailLength];
      CGPathAddLineToPoint(Mutable, 0, v58, v67 + v60 + v61);
    }
    [v7 smoothingRadius];
    CGPathAddArc(Mutable, 0, v70, v73 + v24, v62, 0.0, v69, 1);
    CGFloat v40 = v72;
    CGFloat v41 = v74;
  }
  CGPathAddArc(Mutable, 0, v13, v42, v41, v40, 3.14159265, 0);
  CGPathCloseSubpath(Mutable);
  [v7 pegRadius];
  if (v63 > 0.0)
  {
    [v7 pegRadius];
    CGPathMoveToPoint(Mutable, 0, v13 + v64, v42);
    [v7 pegRadius];
    CGPathAddArc(Mutable, 0, v13, v42, v65, 0.0, -6.28318531, 1);
    CGPathCloseSubpath(Mutable);
  }

  return Mutable;
}

+ (CGPath)newPathForPeg:(id)a3 inset:(double)a4
{
  double v4 = a4 * 0.25;
  id v5 = [a3 configurationByApplyingInset:a4 * 0.25];
  Mutable = CGPathCreateMutable();
  [v5 pegRadius];
  double v8 = v7;
  [v5 pegStrokeWidth];
  double v10 = v8 + v9;
  if ([v5 type] == 1)
  {
    double v11 = v4 + v10;
    [v5 handWidth];
    double v13 = v12 * 0.5;
    if (v4 + v10 < v13) {
      double v11 = v13;
    }
    [v5 handLength];
  }
  else
  {
    [v5 handWidth];
    double v16 = v15 * 0.5;
    if (v16 < v10) {
      double v16 = v10;
    }
    double v11 = v4 + v16;
    [v5 armLength];
    double v18 = v17;
    [v5 handLength];
    double v14 = v10 + v18 + v19;
  }
  double v20 = v4 + v14;
  CGPathAddArc(Mutable, 0, v11, v20, v10, 0.0, 6.28318531, 0);
  [v5 pegRadius];
  if (v21 > 0.0)
  {
    [v5 pegRadius];
    CGPathMoveToPoint(Mutable, 0, v11 + v22, v20);
    [v5 pegRadius];
    CGPathAddArc(Mutable, 0, v11, v20, v23, 0.0, -6.28318531, 1);
    CGPathCloseSubpath(Mutable);
  }

  return Mutable;
}

+ (void)_createHandImageWithSize:(NSObject *)a1 paths:(double)a2 colors:(double)a3 .cold.1(NSObject *a1, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v4 = NSStringFromCGSize(*(CGSize *)&a2);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_fault_impl(&dword_1D3174000, a1, OS_LOG_TYPE_FAULT, "cannot create hand image with size: %@", (uint8_t *)&v5, 0xCu);
}

@end