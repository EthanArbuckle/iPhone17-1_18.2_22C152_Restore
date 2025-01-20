@interface UIImage
- (id)applyBlurWithRadius:(double)a3 tintColor:(id)a4 saturationDeltaFactor:(double)a5 maskImage:(id)a6;
- (id)applyDarkEffect;
- (id)applyExtraLightEffect;
- (id)applyLightEffect;
- (id)applyTintEffectWithColor:(id)a3;
@end

@implementation UIImage

- (id)applyLightEffect
{
  v3 = +[UIColor colorWithWhite:1.0 alpha:0.300000012];
  v4 = [(UIImage *)self applyBlurWithRadius:v3 tintColor:0 saturationDeltaFactor:30.0 maskImage:1.79999995];

  return v4;
}

- (id)applyExtraLightEffect
{
  v3 = +[UIColor colorWithWhite:0.970000029 alpha:0.819999993];
  v4 = [(UIImage *)self applyBlurWithRadius:v3 tintColor:0 saturationDeltaFactor:20.0 maskImage:1.79999995];

  return v4;
}

- (id)applyDarkEffect
{
  v3 = +[UIColor colorWithWhite:0.109999999 alpha:0.730000019];
  v4 = [(UIImage *)self applyBlurWithRadius:v3 tintColor:0 saturationDeltaFactor:20.0 maskImage:1.79999995];

  return v4;
}

- (id)applyTintEffectWithColor:(id)a3
{
  id v4 = a3;
  if (CGColorGetNumberOfComponents((CGColorRef)[v4 CGColor]) == 2)
  {
    double v11 = 0.0;
    v5 = v4;
    if (![v4 getWhite:&v11 alpha:0]) {
      goto LABEL_7;
    }
    uint64_t v6 = +[UIColor colorWithWhite:v11 alpha:0.600000024];
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
    v5 = v4;
    if (![v4 getRed:&v11 green:&v10 blue:&v9 alpha:0]) {
      goto LABEL_7;
    }
    uint64_t v6 = +[UIColor colorWithRed:v11 green:v10 blue:v9 alpha:0.600000024];
  }
  v5 = (void *)v6;

LABEL_7:
  v7 = [(UIImage *)self applyBlurWithRadius:v5 tintColor:0 saturationDeltaFactor:10.0 maskImage:-1.0];

  return v7;
}

- (id)applyBlurWithRadius:(double)a3 tintColor:(id)a4 saturationDeltaFactor:(double)a5 maskImage:(id)a6
{
  long long v70 = *(_OWORD *)&a5;
  id v9 = a4;
  id v10 = a6;
  [(UIImage *)self size];
  if (v11 < 1.0 || ([(UIImage *)self size], v12 < 1.0))
  {
    [(UIImage *)self size];
    uint64_t v14 = v13;
    [(UIImage *)self size];
    NSLog(@"*** error: invalid size: (%.2f x %.2f). Both dimensions must be >= 1: %@", v14, v15, self);
LABEL_4:
    v16 = 0;
    goto LABEL_5;
  }
  v18 = self;
  if (![(UIImage *)v18 CGImage])
  {
    NSLog(@"*** error: image must be backed by a CGImage: %@", v18);
    goto LABEL_4;
  }
  if (v10)
  {
    id v19 = v10;
    if (![v19 CGImage])
    {
      NSLog(@"*** error: maskImage must be backed by a CGImage: %@", v19);
      goto LABEL_4;
    }
  }
  CGFloat y = CGPointZero.y;
  [(UIImage *)v18 size];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  v25 = v18;
  v26 = v25;
  double v27 = fabs(*(double *)&v70 + -1.0);
  if (a3 > 0.00000011920929 || v27 > 0.00000011920929)
  {
    [(UIImage *)v25 size];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    v33 = +[UIScreen mainScreen];
    [v33 scale];
    CGFloat v35 = v34;
    v86.width = v30;
    v86.height = v32;
    UIGraphicsBeginImageContextWithOptions(v86, 0, v35);

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    [(UIImage *)v26 size];
    CGContextTranslateCTM(CurrentContext, 0.0, -v37);
    v38 = v26;
    v39 = [(UIImage *)v38 CGImage];
    v89.origin.x = CGPointZero.x;
    v89.origin.CGFloat y = y;
    v89.size.width = v22;
    v89.size.height = v24;
    CGContextDrawImage(CurrentContext, v89, v39);
    src.data = CGBitmapContextGetData(CurrentContext);
    src.width = CGBitmapContextGetWidth(CurrentContext);
    src.height = CGBitmapContextGetHeight(CurrentContext);
    src.rowBytes = CGBitmapContextGetBytesPerRow(CurrentContext);
    [(UIImage *)v38 size];
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    v44 = +[UIScreen mainScreen];
    [v44 scale];
    CGFloat v46 = v45;
    v87.width = v41;
    v87.height = v43;
    UIGraphicsBeginImageContextWithOptions(v87, 0, v46);

    v47 = UIGraphicsGetCurrentContext();
    dest.data = CGBitmapContextGetData(v47);
    dest.width = CGBitmapContextGetWidth(v47);
    dest.height = CGBitmapContextGetHeight(v47);
    dest.rowBytes = CGBitmapContextGetBytesPerRow(v47);
    if (a3 > 0.00000011920929)
    {
      v48 = +[UIScreen mainScreen];
      [v48 scale];
      double v50 = v49 * a3;

      LODWORD(v48) = vcvtmd_u64_f64(v50 * 3.0 * 2.50662827 * 0.25 + 0.5) | 1;
      vImageBoxConvolve_ARGB8888(&src, &dest, 0, 0, 0, (uint32_t)v48, (uint32_t)v48, 0, 8u);
      vImageBoxConvolve_ARGB8888(&dest, &src, 0, 0, 0, (uint32_t)v48, (uint32_t)v48, 0, 8u);
      vImageBoxConvolve_ARGB8888(&src, &dest, 0, 0, 0, (uint32_t)v48, (uint32_t)v48, 0, 8u);
    }
    if (v27 > 0.00000011920929)
    {
      double v73 = *(double *)&v70 * 0.9278 + 0.0722000003;
      double v74 = *(double *)&v70 * -0.0722000003 + 0.0722000003;
      double v75 = v74;
      float64x2_t v77 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FE6E2EB20000000uLL), (float64x2_t)xmmword_100006700, *(double *)&v70);
      float64_t v78 = v77.f64[0];
      uint64_t v76 = 0;
      uint64_t v79 = 0;
      float64x2_t v51 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FCB367A00000000uLL), (float64x2_t)xmmword_100006710, *(double *)&v70);
      float64_t v80 = v51.f64[0];
      float64x2_t v81 = v51;
      long long v82 = 0u;
      long long v83 = 0u;
      uint64_t v84 = 0x3FF0000000000000;
      uint64_t v52 = 0;
      v53 = &v73;
      float32x4_t v54 = (float32x4_t)vdupq_n_s32(0x43800000u);
      do
      {
        float64x2_t v56 = *(float64x2_t *)v53;
        float64x2_t v55 = *(float64x2_t *)(v53 + 2);
        v53 += 4;
        *(uint64_t *)((char *)&v69 + v52) = (uint64_t)vmovn_s32(vcvtq_s32_f32(vrndaq_f32(vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v56), v55), v54))));
        v52 += 8;
      }
      while (v52 != 32);
      if (a3 > 0.00000011920929)
      {
        vImageMatrixMultiply_ARGB8888(&dest, &src, (const int16_t *)&v69, 256, 0, 0, 0);
        UIGraphicsEndImageContext();
        v28 = UIGraphicsGetImageFromCurrentImageContext();

LABEL_26:
        UIGraphicsEndImageContext();
        goto LABEL_27;
      }
      vImageMatrixMultiply_ARGB8888(&src, &dest, (const int16_t *)&v69, 256, 0, 0, 0);
    }
    v28 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    goto LABEL_26;
  }
  v28 = v25;
LABEL_27:
  [(UIImage *)v26 size];
  CGFloat v58 = v57;
  CGFloat v60 = v59;
  v61 = +[UIScreen mainScreen];
  [v61 scale];
  CGFloat v63 = v62;
  v88.width = v58;
  v88.height = v60;
  UIGraphicsBeginImageContextWithOptions(v88, 0, v63);

  v64 = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(v64, 1.0, -1.0);
  [(UIImage *)v26 size];
  CGContextTranslateCTM(v64, 0.0, -v65);
  v66 = [(UIImage *)v26 CGImage];
  v90.origin.x = CGPointZero.x;
  v90.origin.CGFloat y = y;
  v90.size.width = v22;
  v90.size.height = v24;
  CGContextDrawImage(v64, v90, v66);
  if (a3 > 0.00000011920929)
  {
    CGContextSaveGState(v64);
    if (v10)
    {
      v67 = (CGImage *)[v10 CGImage];
      v91.origin.x = CGPointZero.x;
      v91.origin.CGFloat y = y;
      v91.size.width = v22;
      v91.size.height = v24;
      CGContextClipToMask(v64, v91, v67);
    }
    v68 = (CGImage *)[v28 CGImage];
    v92.origin.x = CGPointZero.x;
    v92.origin.CGFloat y = y;
    v92.size.width = v22;
    v92.size.height = v24;
    CGContextDrawImage(v64, v92, v68);
    CGContextRestoreGState(v64);
  }
  if (v9)
  {
    CGContextSaveGState(v64);
    CGContextSetFillColorWithColor(v64, (CGColorRef)[v9 CGColor]);
    v93.origin.x = CGPointZero.x;
    v93.origin.CGFloat y = y;
    v93.size.width = v22;
    v93.size.height = v24;
    CGContextFillRect(v64, v93);
    CGContextRestoreGState(v64);
  }
  v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

LABEL_5:

  return v16;
}

@end