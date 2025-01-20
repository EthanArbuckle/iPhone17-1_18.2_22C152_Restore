@interface CIMorphologyProcessor
+ (BOOL)allowCompressedInputsAndOutputs;
+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3;
+ (BOOL)allowSRGBTranferFuntionOnOutput;
+ (BOOL)canReduceOutputChannels;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)applyBoxToImage:(id)a3 width:(int)a4 height:(int)a5 doMin:(BOOL)a6;
+ (id)logDescription:(id)a3;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIMorphologyProcessor

+ (id)logDescription:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"doMin"), "BOOLValue")) {
    v4 = "Min";
  }
  else {
    v4 = "Max";
  }
  return (id)[NSString stringWithFormat:@"CIMorphologyProcessor-%s%@x%@", v4, objc_msgSend(a3, "objectForKeyedSubscript:", @"w", objc_msgSend(a3, "objectForKeyedSubscript:", @"h"];
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v10 = (void *)[a4 objectForKeyedSubscript:@"w"];
  v11 = (void *)[a4 objectForKeyedSubscript:@"h"];
  int v12 = [v10 intValue];
  int v13 = v12 - 1;
  if (v12 < 1) {
    int v13 = v12;
  }
  int v14 = -(v13 >> 1);
  int v15 = [v11 intValue];
  int v16 = v15 - 1;
  if (v15 < 1) {
    int v16 = v15;
  }
  CGFloat v17 = x;
  CGFloat v18 = y;
  CGFloat v19 = width;
  CGFloat v20 = height;

  return CGRectInset(*(CGRect *)&v17, (double)v14, (double)-(v16 >> 1));
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v9 = (void *)[a4 objectForKeyedSubscript:@"w"];
  v10 = (void *)[a4 objectForKeyedSubscript:@"h"];
  v11 = (void *)[a4 objectForKeyedSubscript:@"doMin"];
  int v12 = (void *)[a3 objectAtIndexedSubscript:0];
  if (v12)
  {
    int v13 = v12;
    int v14 = [v12 format];
    if (v14 == [a5 format])
    {
      int v15 = [v9 intValue];
      int v16 = [v10 intValue];
      int v17 = [v11 BOOLValue];
      int v12 = (void *)[a5 metalCommandBuffer];
      if (v12)
      {
        CGFloat v18 = v12;
        [v13 region];
        CGFloat x = v40.origin.x;
        CGFloat y = v40.origin.y;
        CGFloat width = v40.size.width;
        CGFloat height = v40.size.height;
        if (CGRectIsNull(v40))
        {
          LODWORD(v23) = 0;
          int v24 = 0x7FFFFFFF;
          int v25 = 0x7FFFFFFF;
        }
        else
        {
          v41.origin.CGFloat x = x;
          v41.origin.CGFloat y = y;
          v41.size.CGFloat width = width;
          v41.size.CGFloat height = height;
          if (CGRectIsInfinite(v41))
          {
            int v24 = -2147483647;
            LODWORD(v23) = -1;
            int v25 = -2147483647;
          }
          else
          {
            v42.origin.CGFloat x = x;
            v42.origin.CGFloat y = y;
            v42.size.CGFloat width = width;
            v42.size.CGFloat height = height;
            CGRect v43 = CGRectInset(v42, 0.000001, 0.000001);
            CGRect v44 = CGRectIntegral(v43);
            int v25 = (int)v44.origin.x;
            int v24 = (int)v44.origin.y;
            unint64_t v23 = (unint64_t)v44.size.height;
          }
        }
        [a5 region];
        CGFloat v26 = v45.origin.x;
        CGFloat v27 = v45.origin.y;
        CGFloat v28 = v45.size.width;
        CGFloat v29 = v45.size.height;
        int v38 = v16;
        int v37 = v25;
        int v30 = v15;
        if (CGRectIsNull(v45))
        {
          LODWORD(v31) = 0;
          int v32 = 0x7FFFFFFF;
          int v33 = 0x7FFFFFFF;
        }
        else
        {
          v46.origin.CGFloat x = v26;
          v46.origin.CGFloat y = v27;
          v46.size.CGFloat width = v28;
          v46.size.CGFloat height = v29;
          if (CGRectIsInfinite(v46))
          {
            int v32 = -2147483647;
            LODWORD(v31) = -1;
            int v33 = -2147483647;
          }
          else
          {
            v47.origin.CGFloat x = v26;
            v47.origin.CGFloat y = v27;
            v47.size.CGFloat width = v28;
            v47.size.CGFloat height = v29;
            CGRect v48 = CGRectInset(v47, 0.000001, 0.000001);
            CGRect v49 = CGRectIntegral(v48);
            int v33 = (int)v49.origin.x;
            int v32 = (int)v49.origin.y;
            unint64_t v31 = (unint64_t)v49.size.height;
          }
        }
        v34 = (Class *)0x1E4F35540;
        if (!v17) {
          v34 = (Class *)0x1E4F35538;
        }
        int v12 = objc_msgSend(objc_alloc(*v34), "initWithDevice:kernelWidth:kernelHeight:", objc_msgSend(v18, "device"), v30, v38);
        if (v12)
        {
          v35 = v12;
          v39[0] = v33 - v37;
          v39[1] = v24 + (int)v23 - ((int)v31 + v32);
          v39[2] = 0;
          [v12 setOffset:v39];
          objc_msgSend(v35, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v18, objc_msgSend(v13, "metalTexture"), objc_msgSend(a5, "metalTexture"));

          LOBYTE(v12) = 1;
        }
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return (char)v12;
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

+ (BOOL)allowCompressedInputsAndOutputs
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

+ (id)applyBoxToImage:(id)a3 width:(int)a4 height:(int)a5 doMin:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  if (a4 != 1 || a5 != 1)
  {
    if (a6) {
      int v11 = 1;
    }
    else {
      int v11 = -1;
    }
    [a3 extent];
    CGRect v22 = CGRectInset(v21, (double)(v11 * (int)v8 / 2), (double)(v11 * (int)v7 / 2));
    double x = v22.origin.x;
    double y = v22.origin.y;
    double width = v22.size.width;
    double height = v22.size.height;
    v20[0] = v9;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    v19[0] = objc_msgSend(NSNumber, "numberWithInt:", v8, @"w");
    v18[1] = @"h";
    v19[1] = [NSNumber numberWithInt:v7];
    v18[2] = @"doMin";
    v19[2] = [NSNumber numberWithBool:v6];
    return (id)objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v16, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, v18, 3), 0, x, y, width, height);
  }
  return v9;
}

@end