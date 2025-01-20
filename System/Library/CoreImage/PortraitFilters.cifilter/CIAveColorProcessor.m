@interface CIAveColorProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIAveColorProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v7 = objc_msgSend(a3, "objectAtIndex:", 0, a4, a5, a6);
  v8 = v7;
  if (v7)
  {
    v9 = (float *)[v7 baseAddress];
    [v8 bytesPerRow];
    uint64_t v10 = 0;
    int32x2_t v11 = 0;
    v12 = v9;
    float v13 = 0.0;
    do
    {
      float v14 = *v12;
      v12 += 4;
      float v15 = v14;
      if (v14 > *(float *)v11.i32)
      {
        float v13 = (float)(int)v10;
        *(float *)v11.i32 = v15;
      }
      ++v10;
    }
    while (v10 != 256);
    *(float *)v11.i32 = v9[4 * (int)v13];
    float32x2_t v16 = 0;
    if (*(float *)v11.i32 > 0.0) {
      float32x2_t v16 = vdiv_f32(*(float32x2_t *)&v9[4 * (int)v13 + 1], (float32x2_t)vdup_lane_s32(v11, 0));
    }
    float v17 = v13 / 255.0;
    v18 = [a5 baseAddress];
    [a5 bytesPerRow];
    float v22 = v17;
    float32x2_t v23 = v16;
    int v24 = 1065353216;
    uint64_t v25 = 0;
    src.data = &v22;
    *(_OWORD *)&src.height = xmmword_56000;
    src.rowBytes = 16;
    v20.data = &v25;
    *(_OWORD *)&v20.height = xmmword_56000;
    v20.rowBytes = 8;
    vImageConvert_PlanarFtoPlanar16F(&src, &v20, 0);
    void *v18 = v25;
  }
  return v8 != 0;
}

+ (int)outputFormat
{
  return kCIFormatRGBAh;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3) {
    sub_4BE38();
  }
  return kCIFormatRGBAf;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  if (!objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtent", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height))sub_4BE64(); {
  id v6 = [a4 objectForKeyedSubscript:@"imageExtent"];
  }

  [v6 CGRectValue];
  result.size.height = v10;
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