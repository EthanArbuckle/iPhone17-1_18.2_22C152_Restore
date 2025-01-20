@interface CIMedianProcessor
+ (BOOL)allowCompressedInputsAndOutputs;
+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3;
+ (BOOL)allowSRGBTranferFuntionOnOutput;
+ (BOOL)canReduceOutputChannels;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)applyMedianToImage:(id)a3 width:(int)a4;
+ (id)logDescription:(id)a3;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIMedianProcessor

+ (id)logDescription:(id)a3
{
  return (id)[NSString stringWithFormat:@"CIMedianProcessor-%@", objc_msgSend(a3, "objectForKeyedSubscript:", @"w"];
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  int v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"w"), "intValue");
  if (v9 >= 0) {
    int v10 = v9;
  }
  else {
    int v10 = v9 + 1;
  }
  CGFloat v11 = x;
  CGFloat v12 = y;
  CGFloat v13 = width;
  CGFloat v14 = height;

  return CGRectInset(*(CGRect *)&v11, (double)-(v10 >> 1), (double)-(v10 >> 1));
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v8 = (void *)[a4 objectForKeyedSubscript:@"w"];
  int v9 = (void *)[a3 objectAtIndexedSubscript:0];
  int v10 = [v8 intValue];
  CGFloat v11 = (void *)[a5 metalCommandBuffer];
  if (v11)
  {
    CGFloat v12 = v11;
    CGFloat v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F355C8]), "initWithDevice:kernelDiameter:", objc_msgSend(v11, "device"), v10);
    if (v11)
    {
      CGFloat v13 = v11;
      [v11 setOptions:2];
      [v13 setEdgeMode:1];
      [v9 region];
      CGFloat x = v30.origin.x;
      CGFloat y = v30.origin.y;
      CGFloat width = v30.size.width;
      CGFloat height = v30.size.height;
      if (CGRectIsNull(v30))
      {
        LODWORD(v18) = 0;
        int v19 = 0x7FFFFFFF;
        int v20 = 0x7FFFFFFF;
      }
      else
      {
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        if (CGRectIsInfinite(v31))
        {
          LODWORD(v18) = -1;
          int v19 = -2147483647;
          int v20 = -2147483647;
        }
        else
        {
          v32.origin.CGFloat x = x;
          v32.origin.CGFloat y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          CGRect v33 = CGRectInset(v32, 0.000001, 0.000001);
          CGRect v34 = CGRectIntegral(v33);
          int v19 = (int)v34.origin.x;
          int v20 = (int)v34.origin.y;
          unint64_t v18 = (unint64_t)v34.size.height;
        }
      }
      [a5 region];
      CGFloat v21 = v35.origin.x;
      CGFloat v22 = v35.origin.y;
      CGFloat v23 = v35.size.width;
      CGFloat v24 = v35.size.height;
      if (CGRectIsNull(v35))
      {
        LODWORD(v25) = 0;
        int v26 = 0x7FFFFFFF;
        int v27 = 0x7FFFFFFF;
      }
      else
      {
        v36.origin.CGFloat x = v21;
        v36.origin.CGFloat y = v22;
        v36.size.CGFloat width = v23;
        v36.size.CGFloat height = v24;
        if (CGRectIsInfinite(v36))
        {
          LODWORD(v25) = -1;
          int v26 = -2147483647;
          int v27 = -2147483647;
        }
        else
        {
          v37.origin.CGFloat x = v21;
          v37.origin.CGFloat y = v22;
          v37.size.CGFloat width = v23;
          v37.size.CGFloat height = v24;
          CGRect v38 = CGRectInset(v37, 0.000001, 0.000001);
          CGRect v39 = CGRectIntegral(v38);
          int v26 = (int)v39.origin.x;
          int v27 = (int)v39.origin.y;
          unint64_t v25 = (unint64_t)v39.size.height;
        }
      }
      v29[0] = v26 - v19;
      v29[1] = (int)v18 + v20 - (v27 + (int)v25);
      v29[2] = 0;
      [v13 setOffset:v29];
      objc_msgSend(v13, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v12, objc_msgSend(v9, "metalTexture"), objc_msgSend(a5, "metalTexture"));

      LOBYTE(v11) = 1;
    }
  }
  return (char)v11;
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

+ (id)applyMedianToImage:(id)a3 width:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v22[1] = *MEMORY[0x1E4F143B8];
  if ((a4 & 1) == 0)
  {
    v5 = ci_logger_api();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CIMedianProcessor applyMedianToImage:width:](v4, v5);
    }
    return 0;
  }
  [MEMORY[0x1E4F355C8] minKernelDiameter];
  if ((int)v4 <= 2)
  {
    v8 = ci_logger_api();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CIMedianProcessor applyMedianToImage:width:]();
    }
    return 0;
  }
  if ([MEMORY[0x1E4F355C8] maxKernelDiameter] < (unint64_t)v4)
  {
    int v9 = ci_logger_api();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CIMedianProcessor applyMedianToImage:width:]();
    }
    return 0;
  }
  [a3 extent];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v22[0] = a3;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithInt:", v4, @"w");
  return (id)objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v19, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1), 0, v12, v14, v16, v18);
}

+ (void)applyMedianToImage:(int)a1 width:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "Input filter kernel size %d is not an odd integer.\n", (uint8_t *)v2, 8u);
}

+ (void)applyMedianToImage:width:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_193671000, v0, v1, "Input filter kernel size %d is less than the minimum supported size %lu.\n", v2, v3);
}

+ (void)applyMedianToImage:width:.cold.3()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_193671000, v0, v1, "Input filter kernel size %d is greater than the maximum supported size %lu.\n", v2, v3);
}

@end