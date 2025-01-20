@interface CIAreaAverageProcessor
+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3;
+ (BOOL)allowSRGBTranferFuntionOnOutput;
+ (BOOL)canReduceOutputChannels;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIAreaAverageProcessor

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"region", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  [v5 CGRectValue];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  double v8 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4, a5, a6);
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"region"), "CGRectValue");
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v17 = (void *)[a5 metalCommandBuffer];
  if (v17)
  {
    v18 = v17;
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F355E0]), "initWithDevice:", objc_msgSend(v17, "device"));
    if (v19)
    {
      v20 = (void *)v19;
      [v8 region];
      CGFloat x = v44.origin.x;
      CGFloat y = v44.origin.y;
      CGFloat width = v44.size.width;
      CGFloat height = v44.size.height;
      if (CGRectIsNull(v44))
      {
        LODWORD(v25) = 0;
        int v26 = 0x7FFFFFFF;
        int v27 = 0x7FFFFFFF;
      }
      else
      {
        v45.origin.CGFloat x = x;
        v45.origin.CGFloat y = y;
        v45.size.CGFloat width = width;
        v45.size.CGFloat height = height;
        if (CGRectIsInfinite(v45))
        {
          int v26 = -2147483647;
          LODWORD(v25) = -1;
          int v27 = -2147483647;
        }
        else
        {
          v46.origin.CGFloat x = x;
          v46.origin.CGFloat y = y;
          v46.size.CGFloat width = width;
          v46.size.CGFloat height = height;
          CGRect v47 = CGRectInset(v46, 0.000001, 0.000001);
          CGRect v48 = CGRectIntegral(v47);
          int v27 = (int)v48.origin.x;
          int v26 = (int)v48.origin.y;
          unint64_t v25 = (unint64_t)v48.size.height;
        }
      }
      v49.origin.CGFloat x = v10;
      v49.origin.CGFloat y = v12;
      v49.size.CGFloat width = v14;
      v49.size.CGFloat height = v16;
      if (CGRectIsNull(v49))
      {
        unint64_t v28 = 0;
        unint64_t v29 = 0;
        int v30 = 0x7FFFFFFF;
        int v31 = 0x7FFFFFFF;
      }
      else
      {
        v50.origin.CGFloat x = v10;
        v50.origin.CGFloat y = v12;
        v50.size.CGFloat width = v14;
        v50.size.CGFloat height = v16;
        if (CGRectIsInfinite(v50))
        {
          int v30 = -2147483647;
          unint64_t v28 = 0xFFFFFFFFLL;
          unint64_t v29 = 0xFFFFFFFFLL;
          int v31 = -2147483647;
        }
        else
        {
          v51.origin.CGFloat x = v10;
          v51.origin.CGFloat y = v12;
          v51.size.CGFloat width = v14;
          v51.size.CGFloat height = v16;
          CGRect v52 = CGRectInset(v51, 0.000001, 0.000001);
          CGRect v53 = CGRectIntegral(v52);
          int v31 = (int)v53.origin.x;
          int v30 = (int)v53.origin.y;
          unint64_t v29 = (unint64_t)v53.size.width;
          unint64_t v28 = (unint64_t)v53.size.height;
        }
      }
      v43[0] = v27 - v31;
      v43[1] = (int)v28 - v26 - (int)v25 + v30;
      v43[2] = 0;
      v43[3] = v29;
      v43[4] = v28;
      v43[5] = 1;
      [v20 setClipRectSource:v43];
      [v20 setOptions:2];
      [v20 setEdgeMode:1];
      [a5 region];
      CGFloat v32 = v54.origin.x;
      CGFloat v33 = v54.origin.y;
      CGFloat v34 = v54.size.width;
      CGFloat v35 = v54.size.height;
      if (CGRectIsNull(v54))
      {
        LODWORD(v36) = 0;
        int v37 = 2147483646;
        int v38 = 0x7FFFFFFF;
      }
      else
      {
        v55.origin.CGFloat x = v32;
        v55.origin.CGFloat y = v33;
        v55.size.CGFloat width = v34;
        v55.size.CGFloat height = v35;
        if (CGRectIsInfinite(v55))
        {
          LODWORD(v36) = -1;
          int v37 = 0x80000000;
          int v38 = -2147483647;
        }
        else
        {
          v56.origin.CGFloat x = v32;
          v56.origin.CGFloat y = v33;
          v56.size.CGFloat width = v34;
          v56.size.CGFloat height = v35;
          CGRect v57 = CGRectInset(v56, 0.000001, 0.000001);
          CGRect v58 = CGRectIntegral(v57);
          int v38 = (int)v58.origin.x;
          unint64_t v36 = (unint64_t)v58.size.height;
          int v37 = (int)v58.origin.y - 1;
        }
      }
      v40[0] = -v38;
      v40[1] = (int)v36 + v37;
      long long v41 = xmmword_193955DA0;
      int64x2_t v42 = vdupq_n_s64(1uLL);
      [v20 setClipRect:v40];
      objc_msgSend(v20, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v18, objc_msgSend(v8, "metalTexture"), objc_msgSend(a5, "metalTexture"));
    }
  }
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (int)outputFormat
{
  return 0;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnOutput
{
  return 1;
}

@end