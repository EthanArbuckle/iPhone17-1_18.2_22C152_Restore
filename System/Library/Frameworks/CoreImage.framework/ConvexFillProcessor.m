@interface ConvexFillProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)canReduceOutputChannels;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)result;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation ConvexFillProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v9 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4, a5, a6);
  v10 = (void *)[a3 objectAtIndexedSubscript:1];
  [v9 format];
  [v10 format];
  [a5 format];
  [a5 region];
  double v12 = v11;
  [a5 region];
  double v14 = v13;
  clearOutput(a5);
  *(_OWORD *)&src.height = xmmword_19394CBA0;
  src.rowBytes = 8;
  dest.data = v61;
  *(_OWORD *)&dest.height = xmmword_19394CBA0;
  dest.rowBytes = 16;
  src.data = (void *)[v10 baseAddress];
  vImageConvert_Planar16FtoPlanarF(&src, &dest, 0x10u);
  double v15 = roundf(v61[0]);
  double v16 = roundf(v61[1]);
  [v9 region];
  int v18 = (int)(v15 - v17);
  [v9 region];
  int v20 = (int)(v16 - v19);
  [v9 region];
  int v22 = (int)(v21 - (double)v20 + -1.0);
  if (v18 <= v22) {
    int v23 = (int)(v21 - (double)v20 + -1.0);
  }
  else {
    int v23 = v18;
  }
  int v24 = CI_LOG_DUALRED();
  if (v23 <= 0)
  {
    if (v24)
    {
      v42 = ci_logger_api();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        +[ConvexFillProcessor processWithInputs:arguments:output:error:]();
      }
    }
  }
  else
  {
    unint64_t v25 = (unint64_t)v14;
    if (v24)
    {
      v26 = ci_logger_api();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        +[ConvexFillProcessor processWithInputs:arguments:output:error:].cold.5();
      }
    }
    int v27 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kThreshold", (unint64_t)v12), "intValue");
    if ((v27 & ~(v27 >> 31)) >= 0xFF) {
      int v28 = 255;
    }
    else {
      int v28 = v27 & ~(v27 >> 31);
    }
    v29 = (unsigned __int8 *)[v9 baseAddress];
    uint64_t v30 = [a5 baseAddress];
    uint64_t v31 = [v9 bytesPerRow];
    uint64_t v32 = [a5 bytesPerRow];
    double v33 = (double)v18;
    double v34 = (double)v22;
    v35 = (unsigned __int8 *)v30;
    int v36 = v25;
    v63.x = (double)v18;
    v63.y = (double)v22;
    uint64_t v37 = convexFill(v29, v35, v25, v58, v31, v32, v28, v63);
    if (v37)
    {
      unint64_t v38 = v37;
      int v39 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kAreaThresholdHi"), "intValue");
      int v40 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kAreaThresholdLo"), "intValue");
      if (v38 <= v39)
      {
        if (v38 >= v40)
        {
          unint64_t v53 = (int)objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kSplatArea"), "intValue");
          v54 = (unsigned __int8 *)[v9 baseAddress];
          v55 = (unsigned __int8 *)[a5 baseAddress];
          unint64_t v56 = [v9 bytesPerRow];
          uint64_t v57 = [a5 bytesPerRow];
          v64.x = v33;
          v64.y = v34;
          radialSplatR8(v54, v55, v36, v58, v56, v57, v53, v64);
          return 1;
        }
        if (CI_LOG_DUALRED())
        {
          v51 = ci_logger_api();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            +[ConvexFillProcessor processWithInputs:arguments:output:error:].cold.4();
          }
        }
      }
      else if (CI_LOG_DUALRED())
      {
        v41 = ci_logger_api();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          +[ConvexFillProcessor processWithInputs:arguments:output:error:]();
        }
      }
    }
    else if (CI_LOG_DUALRED())
    {
      v43 = ci_logger_api();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        +[ConvexFillProcessor processWithInputs:arguments:output:error:](v43, v44, v45, v46, v47, v48, v49, v50);
      }
    }
    clearOutput(a5);
  }
  return 1;
}

+ (int)outputFormat
{
  return 261;
}

+ (BOOL)canReduceOutputChannels
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3 == 1)
  {
    v3 = &kCIFormatRGBAh;
    return *v3;
  }
  if (!a3)
  {
    v3 = &kCIFormatR8;
    return *v3;
  }
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)result
{
  if (a3 == 1)
  {
    result.origin.x = 0.0;
    result.origin.y = 0.0;
    result.size.width = 1.0;
    result.size.height = 1.0;
  }
  return result;
}

+ (void)processWithInputs:arguments:output:error:.cold.1()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12(&dword_193671000, v0, v1, "%{public}s [abort] Convex fill failed due to invalid centroid: %d, %d", v2);
}

+ (void)processWithInputs:(uint64_t)a3 arguments:(uint64_t)a4 output:(uint64_t)a5 error:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)processWithInputs:arguments:output:error:.cold.3()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_13(&dword_193671000, v0, v1, "%{public}s [abort] Convex fill reached upper bound: %zu > %d", v2);
}

+ (void)processWithInputs:arguments:output:error:.cold.4()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_13(&dword_193671000, v0, v1, "%{public}s [abort] Convex fill reached lower bound: %zu < %d", v2);
}

+ (void)processWithInputs:arguments:output:error:.cold.5()
{
  int v2 = 136446722;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12(&dword_193671000, v0, v1, "%{public}s Convex fill seeding from (%d,%d)", v2);
}

@end