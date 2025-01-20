@interface CIColorGradientProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIColorGradientProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v7 = objc_msgSend(a3, "objectAtIndex:", 0, a4, a5, a6);
  v8 = v7;
  if (v7)
  {
    v9 = (float *)[v7 baseAddress];
    [v8 bytesPerRow];
    v10 = [a5 baseAddress];
    id v11 = [a5 bytesPerRow];
    [a5 region];
    CGRect v33 = CGRectIntegral(v32);
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    unint64_t height = (unint64_t)v33.size.height;
    unint64_t v15 = (unint64_t)v9[3];
    float v16 = (float)(unint64_t)v33.size.height / (float)v15;
    if (!v15) {
      float v16 = 0.0;
    }
    unint64_t v17 = vcvtas_u32_f32(v16 * (float)v15);
    float64x2_t v18 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
    do
    {
      float v19 = v9[4 * v12];
      unint64_t v20 = vcvtas_u32_f32(v16 * v19);
      if (v20) {
        BOOL v21 = v13 >= height;
      }
      else {
        BOOL v21 = 1;
      }
      if (!v21)
      {
        uint64_t v22 = 0;
        float64x2_t v23 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v19), 0);
        v24 = (char *)v10 + (void)v11 * v13 + 3;
        do
        {
          *(v24 - 1) = v12;
          if (v19 <= 0.0)
          {
            int32x2_t v26 = 0;
          }
          else
          {
            float64x2_t v25 = vdivq_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&v9[4 * v12 + 1]), v18), v23);
            int32x2_t v26 = vmovn_s64(vcvtq_s64_f64(vrndaq_f64(vminnmq_f64((float64x2_t)vbicq_s8((int8x16_t)v25, (int8x16_t)vcltzq_f64(v25)), v18))));
          }
          *(v24 - 2) = v26.i8[0];
          *(v24 - 3) = v26.i8[4];
          unsigned char *v24 = -1;
          if (++v22 >= v20) {
            break;
          }
          v24 = (char *)v11 + (void)v24;
        }
        while (v22 + v13 < height);
        v13 += v22;
      }
      if (v12 > 0xFE) {
        break;
      }
      ++v12;
    }
    while (v13 <= v17);
    if (!v13)
    {
      _DWORD *v10 = -16777216;
      unint64_t v13 = 1;
    }
    BOOL v27 = height > v13;
    unint64_t v28 = height - v13;
    if (v27)
    {
      unint64_t v29 = (void)v11 * v13;
      uint64_t v30 = (void)v11 * (v13 - 1);
      do
      {
        *(_DWORD *)((char *)v10 + v29) = *(_DWORD *)((char *)v10 + v30);
        v10 = (char *)v11 + (void)v10;
        --v28;
      }
      while (v28);
    }
  }
  return v8 != 0;
}

+ (int)outputFormat
{
  return kCIFormatBGRA8;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3) {
    sub_4BE90();
  }
  return kCIFormatRGBAf;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  if (!objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtent", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height))sub_4BEBC(); {
  id v6 = [a4 objectForKeyedSubscript:@"imageExtent"];
  }

  [v6 CGRectValue];
  result.size.unint64_t height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

@end