@interface GKImageEffects
+ (id)imageByApplyingBlurToImage:(id)a3 withRadius:(double)a4 tintColor:(id)a5 saturationDeltaFactor:(double)a6 maskImage:(id)a7;
+ (id)imageByApplyingDarkEffectToImage:(id)a3;
+ (id)imageByApplyingExtraLightEffectToImage:(id)a3;
+ (id)imageByApplyingLightEffectToImage:(id)a3;
+ (id)imageByApplyingTintEffectWithColor:(id)a3 toImage:(id)a4;
@end

@implementation GKImageEffects

+ (id)imageByApplyingLightEffectToImage:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  v6 = [v4 colorWithWhite:1.0 alpha:0.3];
  v7 = [a1 imageByApplyingBlurToImage:v5 withRadius:v6 tintColor:0 saturationDeltaFactor:60.0 maskImage:1.8];

  return v7;
}

+ (id)imageByApplyingExtraLightEffectToImage:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  v6 = [v4 colorWithWhite:0.97 alpha:0.82];
  v7 = [a1 imageByApplyingBlurToImage:v5 withRadius:v6 tintColor:0 saturationDeltaFactor:40.0 maskImage:1.8];

  return v7;
}

+ (id)imageByApplyingDarkEffectToImage:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  v6 = [v4 colorWithWhite:0.11 alpha:0.73];
  v7 = [a1 imageByApplyingBlurToImage:v5 withRadius:v6 tintColor:0 saturationDeltaFactor:40.0 maskImage:1.8];

  return v7;
}

+ (id)imageByApplyingTintEffectWithColor:(id)a3 toImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (CGColorGetNumberOfComponents((CGColorRef)[v8 CGColor]) == 2)
  {
    double v15 = 0.0;
    v9 = v8;
    if (![v8 getWhite:&v15 alpha:0]) {
      goto LABEL_7;
    }
    uint64_t v10 = [MEMORY[0x1E4FB1618] colorWithWhite:v15 alpha:0.6];
  }
  else
  {
    double v14 = 0.0;
    double v15 = 0.0;
    double v13 = 0.0;
    v9 = v8;
    if (![v8 getRed:&v15 green:&v14 blue:&v13 alpha:0]) {
      goto LABEL_7;
    }
    uint64_t v10 = [MEMORY[0x1E4FB1618] colorWithRed:v15 green:v14 blue:v13 alpha:0.6];
  }
  v9 = (void *)v10;

LABEL_7:
  v11 = [a1 imageByApplyingBlurToImage:v7 withRadius:v9 tintColor:0 saturationDeltaFactor:20.0 maskImage:-1.0];

  return v11;
}

+ (id)imageByApplyingBlurToImage:(id)a3 withRadius:(double)a4 tintColor:(id)a5 saturationDeltaFactor:(double)a6 maskImage:(id)a7
{
  *(_OWORD *)v54 = *(_OWORD *)&a6;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a7;
  [v10 size];
  if (v13 < 1.0 || ([v10 size], v14 < 1.0))
  {
    objc_msgSend(v10, "size", *(_OWORD *)v54);
    uint64_t v16 = v15;
    [v10 size];
    NSLog(&cfstr_ErrorInvalidSi.isa, v16, v17, v10);
LABEL_4:
    v18 = 0;
    goto LABEL_5;
  }
  id v20 = v10;
  if (![v20 CGImage])
  {
    NSLog(&cfstr_ErrorInputimag.isa, v20);
    goto LABEL_4;
  }
  if (v12)
  {
    id v21 = v12;
    if (![v21 CGImage])
    {
      NSLog(&cfstr_ErrorEffectmas.isa, v21);
      goto LABEL_4;
    }
  }
  double v22 = fabs(v54[0] + -1.0);
  id v23 = v20;
  v24 = (CGImage *)[v23 CGImage];
  [v23 scale];
  CGFloat v26 = v25;
  char BitmapInfo = CGImageGetBitmapInfo(v24);
  [v23 size];
  CGFloat v30 = v28;
  double v31 = v29;
  CGFloat v32 = *MEMORY[0x1E4F1DAD8];
  CGFloat v33 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  BOOL v34 = (BitmapInfo & 0x1Fu) - 5 < 2 || (BitmapInfo & 0x1F) == 0;
  UIGraphicsBeginImageContextWithOptions(*(CGSize *)&v28, v34, v26);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -v31);
  if (a4 > 0.00000011920929 || v22 > 0.00000011920929)
  {
    memset(&src, 0, sizeof(src));
    memset(&dest, 0, sizeof(dest));
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v55 = 0x2000000008;
    DWORD2(v56) = 8194;
    id v36 = v23;
    uint64_t v37 = MEMORY[0x1B3E84630](&src, &v55, 0, [v36 CGImage], 256);
    if (v37)
    {
      NSLog(&cfstr_ErrorVimagebuf.isa, v37, v36);
      UIGraphicsEndImageContext();
      goto LABEL_4;
    }
    p_vImage_Buffer dest = &dest;
    MEMORY[0x1B3E84620](&dest, src.height, src.width, HIDWORD(v55), 0);
    if (a4 <= 0.00000011920929)
    {
      p_vImage_Buffer src = &src;
    }
    else
    {
      double v39 = (v26 * a4 * 3.0 * 2.50662827 * 0.25 + 0.5) * 0.5;
      if (v26 * a4 + -2.0 < 0.00000011920929) {
        double v39 = 2.12997121;
      }
      uint32_t v40 = vcvtmd_u64_f64(v39) | 1;
      p_vImage_Buffer dest = &src;
      p_vImage_Buffer src = &dest;
      vImage_Error v42 = vImageBoxConvolve_ARGB8888(&src, &dest, 0, 0, 0, v40, v40, 0, 0x88u);
      v43 = malloc_type_malloc(v42, 0x842216BEuLL);
      vImageBoxConvolve_ARGB8888(&src, &dest, v43, 0, 0, v40, v40, 0, 8u);
      vImageBoxConvolve_ARGB8888(&dest, &src, v43, 0, 0, v40, v40, 0, 8u);
      vImageBoxConvolve_ARGB8888(&src, &dest, v43, 0, 0, v40, v40, 0, 8u);
      free(v43);
    }
    if (v22 <= 0.00000011920929)
    {
      p_data = &p_src->data;
      p_vImage_Buffer src = p_dest;
    }
    else
    {
      double v60 = v54[0] * 0.9278 + 0.0722;
      double v61 = v54[0] * -0.0722 + 0.0722;
      double v62 = v61;
      float64x2_t v64 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FE6E2EB1C432CA5uLL), (float64x2_t)xmmword_1AF7CB020, v54[0]);
      float64_t v65 = v64.f64[0];
      uint64_t v63 = 0;
      uint64_t v66 = 0;
      float64x2_t v44 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FCB367A0F9096BCuLL), (float64x2_t)xmmword_1AF7CB030, v54[0]);
      float64_t v67 = v44.f64[0];
      float64x2_t v68 = v44;
      long long v69 = 0u;
      long long v70 = 0u;
      uint64_t v71 = 0x3FF0000000000000;
      uint64_t v45 = 0;
      v46 = &v60;
      float64x2_t v47 = (float64x2_t)vdupq_n_s64(0x4070000000000000uLL);
      do
      {
        float64x2_t v48 = *(float64x2_t *)v46;
        float64x2_t v49 = *(float64x2_t *)(v46 + 2);
        v46 += 4;
        *(uint64_t *)((char *)v54 + v45 + 16) = (uint64_t)vmovn_s32(vcvtq_s32_f32(vrndaq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(v48, v47)), vmulq_f64(v49, v47)))));
        v45 += 8;
      }
      while (v45 != 32);
      vImageMatrixMultiply_ARGB8888(p_src, p_dest, (const int16_t *)&v53, 256, 0, 0, 0);
      p_data = &p_dest->data;
    }
    v51 = (CGImage *)MEMORY[0x1B3E84640](p_data, &v55, cleanupBuffer, 0, 512, 0);
    if (!v51)
    {
      v51 = (CGImage *)MEMORY[0x1B3E84640](p_data, &v55, 0, 0, 0, 0);
      free(*p_data);
    }
    if (v12)
    {
      v76.origin.x = v32;
      v76.origin.y = v33;
      v76.size.width = v30;
      v76.size.height = v31;
      CGContextDrawImage(CurrentContext, v76, v24);
      CGContextSaveGState(CurrentContext);
      v52 = (CGImage *)[v12 CGImage];
      v77.origin.x = v32;
      v77.origin.y = v33;
      v77.size.width = v30;
      v77.size.height = v31;
      CGContextClipToMask(CurrentContext, v77, v52);
    }
    else
    {
      CGContextSaveGState(CurrentContext);
    }
    v78.origin.x = v32;
    v78.origin.y = v33;
    v78.size.width = v30;
    v78.size.height = v31;
    CGContextDrawImage(CurrentContext, v78, v51);
    CGContextRestoreGState(CurrentContext);
    CGImageRelease(v51);
    free(p_src->data);
    if (v11) {
      goto LABEL_17;
    }
  }
  else
  {
    v74.origin.x = v32;
    v74.origin.y = v33;
    v74.size.width = v30;
    v74.size.height = v31;
    CGContextDrawImage(CurrentContext, v74, v24);
    if (v11)
    {
LABEL_17:
      CGContextSaveGState(CurrentContext);
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v11 CGColor]);
      v75.origin.x = v32;
      v75.origin.y = v33;
      v75.size.width = v30;
      v75.size.height = v31;
      CGContextFillRect(CurrentContext, v75);
      CGContextRestoreGState(CurrentContext);
    }
  }
  v18 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
LABEL_5:

  return v18;
}

@end