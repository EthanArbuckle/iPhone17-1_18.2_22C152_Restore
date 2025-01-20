@interface CIIntegralImageProcessorGPU
+ (BOOL)canReduceOutputChannels;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (int)outputFormat;
@end

@implementation CIIntegralImageProcessorGPU

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v8 = objc_msgSend(a5, "metalCommandBuffer", a3, a4);
  if (!v8)
  {
    v19 = ci_logger_api();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v20) {
      return v20;
    }
    +[CIIntegralImageProcessorGPU processWithInputs:arguments:output:error:](v19);
LABEL_9:
    LOBYTE(v20) = 0;
    return v20;
  }
  v9 = v8;
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F355B8]), "initWithDevice:", objc_msgSend(v8, "device"));
  if (!v10)
  {
    v21 = ci_logger_api();
    BOOL v20 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!v20) {
      return v20;
    }
    +[CIIntegralImageProcessorGPU processWithInputs:arguments:output:error:](v21);
    goto LABEL_9;
  }
  v11 = (void *)v10;
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  if (CGRectIsNull(v31))
  {
    LODWORD(v16) = 0;
    int v17 = 0x7FFFFFFF;
    int v18 = 0x7FFFFFFF;
  }
  else
  {
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    if (CGRectIsInfinite(v32))
    {
      int v17 = -2147483647;
      LODWORD(v16) = -1;
      int v18 = -2147483647;
    }
    else
    {
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      CGRect v34 = CGRectInset(v33, 0.000001, 0.000001);
      CGRect v35 = CGRectIntegral(v34);
      int v18 = (int)v35.origin.x;
      int v17 = (int)v35.origin.y;
      unint64_t v16 = (unint64_t)v35.size.height;
    }
  }
  [a5 region];
  CGFloat v22 = v36.origin.x;
  CGFloat v23 = v36.origin.y;
  CGFloat v24 = v36.size.width;
  CGFloat v25 = v36.size.height;
  if (CGRectIsNull(v36))
  {
    LODWORD(v26) = 0;
    int v27 = 0x7FFFFFFF;
    int v28 = 0x7FFFFFFF;
  }
  else
  {
    v37.origin.CGFloat x = v22;
    v37.origin.CGFloat y = v23;
    v37.size.CGFloat width = v24;
    v37.size.CGFloat height = v25;
    if (CGRectIsInfinite(v37))
    {
      int v27 = -2147483647;
      LODWORD(v26) = -1;
      int v28 = -2147483647;
    }
    else
    {
      v38.origin.CGFloat x = v22;
      v38.origin.CGFloat y = v23;
      v38.size.CGFloat width = v24;
      v38.size.CGFloat height = v25;
      CGRect v39 = CGRectInset(v38, 0.000001, 0.000001);
      CGRect v40 = CGRectIntegral(v39);
      int v28 = (int)v40.origin.x;
      int v27 = (int)v40.origin.y;
      unint64_t v26 = (unint64_t)v40.size.height;
    }
  }
  v30[0] = v28 - v18;
  v30[1] = v17 + (int)v16 - ((int)v26 + v27);
  v30[2] = 0;
  [v11 setOffset:v30];
  objc_msgSend(v11, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v9, objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "metalTexture"), objc_msgSend(a5, "metalTexture"));

  LOBYTE(v20) = 1;
  return v20;
}

+ (int)outputFormat
{
  return 2312;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (void)processWithInputs:(os_log_t)log arguments:output:error:.cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446467;
  v2 = "+[CIIntegralImageProcessorGPU processWithInputs:arguments:output:error:]";
  __int16 v3 = 2113;
  v4 = @"Metal";
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s %{private}@ command buffer is not available", (uint8_t *)&v1, 0x16u);
}

+ (void)processWithInputs:(os_log_t)log arguments:output:error:.cold.2(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136446467;
  v2 = "+[CIIntegralImageProcessorGPU processWithInputs:arguments:output:error:]";
  __int16 v3 = 2113;
  v4 = @"MPSImageIntegral";
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s %{private}@ kernel could not be instantiated", (uint8_t *)&v1, 0x16u);
}

@end