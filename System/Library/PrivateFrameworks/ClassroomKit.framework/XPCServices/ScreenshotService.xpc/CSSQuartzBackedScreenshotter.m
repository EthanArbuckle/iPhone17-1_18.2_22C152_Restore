@interface CSSQuartzBackedScreenshotter
- (CADisplay)display;
- (CATransform3D)transformForFinalScreenshotSize:(SEL)a3;
- (CGImage)makeRawQuartzCGImageScreenshotWithIsSecure:(BOOL)a3 size:(id)a4 error:(id *)a5;
- (CSSQuartzBackedScreenshotter)init;
- (CSSQuartzBackedScreenshotter)initWithDisplay:(id)a3;
- (double)displayScale;
- (id)displaySize;
- (id)makeRawQuartzScreenshotWithSize:(id)a3 error:(id *)a4;
- (id)screenshotWithMaximumSizeInPixels:(CGSize)a3 error:(id *)a4;
@end

@implementation CSSQuartzBackedScreenshotter

- (CSSQuartzBackedScreenshotter)init
{
  v3 = +[CADisplay mainDisplay];
  v4 = [(CSSQuartzBackedScreenshotter *)self initWithDisplay:v3];

  return v4;
}

- (CSSQuartzBackedScreenshotter)initWithDisplay:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSSQuartzBackedScreenshotter;
  v6 = [(CSSQuartzBackedScreenshotter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_display, a3);
  }

  return v7;
}

- (id)screenshotWithMaximumSizeInPixels:(CGSize)a3 error:(id *)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = objc_opt_new();
  objc_super v9 = [(CSSQuartzBackedScreenshotter *)self displaySize];
  v10 = objc_msgSend(v8, "screenshotSizeWithMaximumSize:displaySize:", v9, width, height);

  v11 = [(CSSQuartzBackedScreenshotter *)self makeRawQuartzScreenshotWithSize:v10 error:a4];

  return v11;
}

- (id)displaySize
{
  v2 = [(CSSQuartzBackedScreenshotter *)self display];
  objc_msgSend(v2, "css_sizeInCurrentOrientation");
  double v4 = v3;
  double v6 = v5;

  v7 = -[CSSIntegralSize initWithFloatingPointSize:]([CSSIntegralSize alloc], "initWithFloatingPointSize:", v4, v6);

  return v7;
}

- (double)displayScale
{
  v2 = [(CSSQuartzBackedScreenshotter *)self display];
  double v3 = [v2 currentMode];
  double v4 = (double)(unint64_t)[v3 preferredScale];

  return v4;
}

- (id)makeRawQuartzScreenshotWithSize:(id)a3 error:(id *)a4
{
  double v4 = [(CSSQuartzBackedScreenshotter *)self makeRawQuartzCGImageScreenshotWithIsSecure:1 size:a3 error:a4];
  if (v4)
  {
    double v5 = v4;
    double v6 = +[UIImage imageWithCGImage:v4 scale:0 orientation:1.0];
    CFRelease(v5);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (CGImage)makeRawQuartzCGImageScreenshotWithIsSecure:(BOOL)a3 size:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v9 = [(CSSQuartzBackedScreenshotter *)self display];
  v10 = (void *)v9;
  if (!v9)
  {
    v31 = sub_100004B64();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1000073D0(v31, v32, v33, v34, v35, v36, v37, v38);
    }

    if (a5) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  BOOL v59 = v6;
  v58 = a5;
  v61 = (void *)v9;
  size_t v11 = (size_t)[v8 height];
  size_t v12 = (size_t)[v8 width];
  unint64_t v13 = (4 * v12 + 63) & 0xFFFFFFFFFFFFFFC0;
  vm_size_t v14 = (vm_page_mask + v13 * v11) & ~vm_page_mask;
  v73[0] = kIOSurfaceWidth;
  size_t v55 = v12;
  v15 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:");
  v74[0] = v15;
  v73[1] = kIOSurfaceHeight;
  size_t height = v11;
  v16 = +[NSNumber numberWithUnsignedLong:v11];
  v74[1] = v16;
  v73[2] = kIOSurfacePixelFormat;
  v17 = +[NSNumber numberWithInt:1111970369];
  v74[2] = v17;
  v74[3] = &off_10000CBB8;
  v73[3] = kIOSurfaceBytesPerElement;
  v73[4] = kIOSurfaceBytesPerRow;
  size_t v56 = v13;
  v18 = +[NSNumber numberWithUnsignedLong:v13];
  v74[4] = v18;
  v73[5] = kIOSurfaceAllocSize;
  size_t size = v14;
  v19 = +[NSNumber numberWithUnsignedLong:v14];
  v73[6] = kIOSurfaceCacheMode;
  v74[5] = v19;
  v74[6] = &off_10000CBD0;
  CFDictionaryRef v20 = +[NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:7];
  v21 = IOSurfaceCreate(v20);

  if (!v21)
  {
    v39 = sub_100004B64();
    v10 = v61;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100007408(v39, v40, v41, v42, v43, v44, v45, v46);
    }
LABEL_13:

    a5 = v58;
    if (v58)
    {
LABEL_14:
      CRKErrorWithCodeAndUserInfo();
      v30 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_8:
    v30 = 0;
    goto LABEL_15;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  [(CSSQuartzBackedScreenshotter *)self transformForFinalScreenshotSize:v8];
  v71[0] = kCASnapshotMode;
  v71[1] = kCASnapshotDestination;
  v72[0] = kCASnapshotModeDisplay;
  v72[1] = v21;
  v71[2] = kCASnapshotDisplayName;
  v10 = v61;
  v22 = [v61 name];
  v72[2] = v22;
  v72[3] = &off_10000CBE8;
  v71[3] = kCASnapshotOriginX;
  v71[4] = kCASnapshotOriginY;
  v72[4] = &off_10000CBE8;
  v71[5] = kCASnapshotEnforceSecureMode;
  v23 = +[NSNumber numberWithBool:v59];
  v72[5] = v23;
  v71[6] = kCASnapshotTransform;
  v62[4] = v67;
  v62[5] = v68;
  v62[6] = v69;
  v62[7] = v70;
  v62[0] = v63;
  v62[1] = v64;
  v62[2] = v65;
  v62[3] = v66;
  v24 = +[NSValue valueWithCATransform3D:v62];
  v72[6] = v24;
  v25 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:7];
  CARenderServerSnapshot();

  IOSurfaceLock(v21, 1u, 0);
  BaseAddress = IOSurfaceGetBaseAddress(v21);
  CGDataProviderRef v27 = CGDataProviderCreateWithData(v21, BaseAddress, size, (CGDataProviderReleaseDataCallback)sub_100004BB8);
  if (!v27)
  {
    IOSurfaceUnlock(v21, 1u, 0);
    CFRelease(v21);
    v39 = sub_100004B64();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100007440(v39, v47, v48, v49, v50, v51, v52, v53);
    }
    goto LABEL_13;
  }
  v28 = v27;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v30 = CGImageCreate(v55, height, 8uLL, 0x20uLL, v56, DeviceRGB, 0x2002u, v28, 0, 1, kCGRenderingIntentDefault);
  CGColorSpaceRelease(DeviceRGB);
  CGDataProviderRelease(v28);
LABEL_15:

  return v30;
}

- (CATransform3D)transformForFinalScreenshotSize:(SEL)a3
{
  id v6 = a4;
  v7 = objc_opt_new();
  [(CSSQuartzBackedScreenshotter *)self displayScale];
  double v9 = v8;
  v10 = [(CSSQuartzBackedScreenshotter *)self displaySize];
  CGAffineTransformMakeScale(&v21, v9/ fmin((double)(unint64_t)[v10 height], (double)(unint64_t)objc_msgSend(v10, "width")), v9/ fmax((double)(unint64_t)objc_msgSend(v10, "height"), (double)(unint64_t)objc_msgSend(v10, "width")));
  [v7 appendTransform:&v21];
  CGAffineTransformMakeTranslation(&v20, -0.5, -0.5);
  [v7 appendTransform:&v20];
  size_t v11 = [(CSSQuartzBackedScreenshotter *)self display];
  size_t v12 = (char *)objc_msgSend(v11, "css_interfaceOrientation");

  if ((unint64_t)(v12 - 2) <= 2)
  {
    CGAffineTransformMakeRotation(&v19, dbl_100009980[(void)(v12 - 2)]);
    [v7 appendTransform:&v19];
  }
  CGAffineTransformMakeTranslation(&v18, 0.5, 0.5);
  [v7 appendTransform:&v18];
  CGFloat v13 = (double)(unint64_t)[v6 width];
  id v14 = [v6 height];

  CGAffineTransformMakeScale(&v17, v13, (double)(unint64_t)v14);
  [v7 appendTransform:&v17];
  if (v7) {
    [v7 composedTransform];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }
  CATransform3DMakeAffineTransform(retstr, &v16);

  return result;
}

- (CADisplay)display
{
  return self->_display;
}

- (void).cxx_destruct
{
}

@end