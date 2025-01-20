@interface CNUICoreImageDerivedColorGenerator
+ (id)ciContextWithHighPriority:(BOOL)a3;
+ (id)colorsForImageRef:(CGImage *)a3;
+ (id)colorsForUIImage:(id)a3;
+ (id)defaultDarkGrayColors;
+ (id)defaultGrayColors;
+ (id)scheduler;
+ (id)tintedUIColorsFromUIColors:(id)a3 isLight:(BOOL)a4;
+ (unint64_t)colorArraySize;
+ (void)fetchColorsForImage:(id)a3 ciContext:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CNUICoreImageDerivedColorGenerator

+ (unint64_t)colorArraySize
{
  return 5;
}

+ (id)colorsForUIImage:(id)a3
{
  id v4 = a3;
  if ([v4 ioSurface])
  {
    v5 = (CGImage *)UICreateCGImageFromIOSurface();
    v6 = [a1 colorsForImageRef:v5];
    CGImageRelease(v5);
  }
  else
  {
    v6 = objc_msgSend(a1, "colorsForImageRef:", objc_msgSend(v4, "CGImage"));
  }

  return v6;
}

+ (id)colorsForImageRef:(CGImage *)a3
{
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  if (Width && Height)
  {
    if ((double)Height <= 160.0) {
      double v7 = (double)Height;
    }
    else {
      double v7 = 160.0;
    }
    uint64_t v8 = (unint64_t)v7;
    v9 = (char *)malloc_type_malloc(vcvtd_n_u64_f64(v7, 2uLL), 0x930010B0uLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v11 = CGBitmapContextCreate(v9, 1uLL, (unint64_t)v7, 8uLL, 4uLL, DeviceRGB, 0x4001u);
    v30.origin.x = 0.0;
    v30.origin.y = 0.0;
    v30.size.width = 1.0;
    v30.size.height = v7;
    CGContextDrawImage(v11, v30, a3);
    CGContextRelease(v11);
    CGColorSpaceRelease(DeviceRGB);
    unint64_t v12 = 0;
    if ((unint64_t)v7)
    {
      v13 = v9 + 3;
      while (!*(v13 - 3) && !*(v13 - 2) && !*(v13 - 1) || !*v13)
      {
        ++v12;
        v13 += 4;
        if (v8 == v12)
        {
          unint64_t v12 = (unint64_t)v7;
          break;
        }
      }
      unint64_t v14 = v8 - 1;
      if (v8 - 1 >= 1)
      {
        v15 = &v9[4 * v8 - 2];
        while (!*(v15 - 2) && !*(v15 - 1) && !*v15 || !v15[1])
        {
          --v8;
          v15 -= 4;
          if (v8 <= 1)
          {
            unint64_t v14 = 0;
            goto LABEL_27;
          }
        }
        unint64_t v14 = v8 - 1;
      }
    }
    else
    {
      unint64_t v14 = -1;
    }
LABEL_27:
    v18 = objc_opt_new();
    if (v14 > v12)
    {
      unint64_t v20 = 0.25;
      double v19 = (double)(v14 - v12) * 0.25;
      unint64_t v24 = vcvtpd_u64_f64(v19);
      v25 = &v9[4 * v12 + 3];
      do
      {
        LOBYTE(v19) = *(v25 - 3);
        LOBYTE(v20) = *(v25 - 2);
        LOBYTE(v21) = *(v25 - 1);
        LOBYTE(v22) = *v25;
        objc_msgSend(v18, "addObject:", +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", (double)*(unint64_t *)&v19 / 255.0, (double)v20 / 255.0, (double)v21 / 255.0, (double)v22 / 255.0));
        v12 += v24;
        v25 += 4 * v24;
      }
      while (v12 < v14);
    }
    v26 = &v9[4 * v14];
    LOBYTE(v19) = *v26;
    LOBYTE(v20) = v26[1];
    LOBYTE(v21) = v26[2];
    LOBYTE(v23) = v26[3];
    objc_msgSend(v18, "addObject:", +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", (double)*(unint64_t *)&v19 / 255.0, (double)v20 / 255.0, (double)v21 / 255.0, (double)v23 / 255.0));
    free(v9);
    if ((unint64_t)[v18 count] >= 5)
    {
      id v27 = v18;
    }
    else
    {
      id v27 = [a1 defaultGrayColors];
    }
    v17 = v27;
  }
  else
  {
    v16 = sub_100003B74();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_100005A4C(v16);
    }

    v17 = [a1 defaultGrayColors];
  }
  return v17;
}

+ (id)scheduler
{
  if (qword_10000CF10 != -1) {
    dispatch_once(&qword_10000CF10, &stru_1000083F8);
  }
  v2 = (void *)qword_10000CF18;
  return v2;
}

+ (void)fetchColorsForImage:(id)a3 ciContext:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11 = [a1 scheduler];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100003D64;
    v12[3] = &unk_100008448;
    id v13 = v8;
    id v14 = v9;
    id v16 = a1;
    id v15 = v10;
    [v11 performBlock:v12];
  }
}

+ (id)ciContextWithHighPriority:(BOOL)a3
{
  v7[0] = kCIContextName;
  v7[1] = kCIContextIntermediateMemoryTarget;
  v8[0] = @"CNUICoreImageDerivedColorGenerator";
  v8[1] = &off_1000087B8;
  v7[2] = kCIContextPriorityRequestHigh;
  v3 = +[NSNumber numberWithBool:a3];
  v8[2] = v3;
  v8[3] = &__kCFBooleanTrue;
  v7[3] = kCIContextLossyCompressedIntermediates;
  v7[4] = kCIContextCacheIntermediates;
  v8[4] = &__kCFBooleanFalse;
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
  v5 = +[CIContext contextWithOptions:v4];

  return v5;
}

+ (id)defaultGrayColors
{
  v2 = +[UIColor colorWithRed:0.631372549 green:0.643137255 blue:0.690196078 alpha:1.0];
  v3 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.654901961, 0.666666667, 0.709803922, 1.0, v2);
  v9[1] = v3;
  id v4 = +[UIColor colorWithRed:0.682352941 green:0.694117647 blue:0.725490196 alpha:1.0];
  v9[2] = v4;
  v5 = +[UIColor colorWithRed:0.729411765 green:0.733333333 blue:0.752941176 alpha:1.0];
  v9[3] = v5;
  v6 = +[UIColor colorWithRed:0.752941176 green:0.756862745 blue:0.77254902 alpha:1.0];
  v9[4] = v6;
  double v7 = +[NSArray arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)defaultDarkGrayColors
{
  v2 = +[UIColor colorWithRed:0.156862745 green:0.164705882 blue:0.2 alpha:1.0];
  v3 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.184313725, 0.196078431, 0.231372549, 1.0, v2);
  v9[1] = v3;
  id v4 = +[UIColor colorWithRed:0.219607843 green:0.231372549 blue:0.258823529 alpha:1.0];
  v9[2] = v4;
  v5 = +[UIColor colorWithRed:0.258823529 green:0.270588235 blue:0.298039216 alpha:1.0];
  v9[3] = v5;
  v6 = +[UIColor colorWithRed:0.301960784 green:0.309803922 blue:0.329411765 alpha:1.0];
  v9[4] = v6;
  double v7 = +[NSArray arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)tintedUIColorsFromUIColors:(id)a3 isLight:(BOOL)a4
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004834;
  v8[3] = &unk_100008470;
  BOOL v10 = a4;
  id v6 = (id)objc_opt_new();
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

@end