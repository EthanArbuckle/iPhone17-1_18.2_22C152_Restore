@interface CILensModelKernelMetalProcessor
+ (BOOL)hasValidPipelines;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
+ (void)compilePipelines:(id)a3;
+ (void)compilePipelinesIfNeeded:(id)a3;
+ (void)releasePipelines;
@end

@implementation CILensModelKernelMetalProcessor

+ (BOOL)hasValidPipelines
{
  if (shaderLensModelCalc) {
    BOOL v2 = shaderLensModelApply == 0;
  }
  else {
    BOOL v2 = 1;
  }
  return !v2 && shaderLensModelMinMax0 != 0 && shaderLensModelMinMax1 != 0;
}

+ (void)compilePipelines:(id)a3
{
  id v15 = 0;
  v4 = objc_msgSend(a3, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), 0);
  v5 = (void *)[v4 newFunctionWithName:@"slm_calc"];
  shaderLensModelCalc = [a3 newComputePipelineStateWithFunction:v5 error:&v15];
  if (v15)
  {
    uint64_t v6 = [v15 localizedDescription];
    NSLog(&cfstr_FailedToInitia_0.isa, @"slm_calc", v6, [v15 localizedFailureReason]);
  }

  v7 = (void *)[v4 newFunctionWithName:@"slm_apply"];
  shaderLensModelApply = [a3 newComputePipelineStateWithFunction:v7 error:&v15];
  if (v15)
  {
    uint64_t v8 = [v15 localizedDescription];
    NSLog(&cfstr_FailedToInitia_0.isa, @"slm_apply", v8, [v15 localizedFailureReason]);
  }

  v9 = (void *)[v4 newFunctionWithName:@"slm_shiftmap_calcminmax0"];
  shaderLensModelMinMax0 = [a3 newComputePipelineStateWithFunction:v9 error:&v15];
  if (v15)
  {
    uint64_t v10 = [v15 localizedDescription];
    NSLog(&cfstr_FailedToInitia_0.isa, @"slm_shiftmap_calcminmax0", v10, [v15 localizedFailureReason]);
  }

  v11 = (void *)[v4 newFunctionWithName:@"slm_shiftmap_calcminmax1"];
  shaderLensModelMinMax1 = [a3 newComputePipelineStateWithFunction:v11 error:&v15];
  if (v15)
  {
    uint64_t v12 = [v15 localizedDescription];
    NSLog(&cfstr_FailedToInitia_0.isa, @"slm_shiftmap_calcminmax1", v12, [v15 localizedFailureReason]);
  }

  v13 = (void *)[v4 newFunctionWithName:@"slm_shiftmap_calcminmax2"];
  shaderLensModelMinMax2 = [a3 newComputePipelineStateWithFunction:v13 error:&v15];
  if (v15)
  {
    uint64_t v14 = [v15 localizedDescription];
    NSLog(&cfstr_FailedToInitia_0.isa, @"slm_shiftmap_calcminmax2", v14, [v15 localizedFailureReason]);
  }
}

+ (void)releasePipelines
{
  if (shaderLensModelCalc) {

  }
  if (shaderLensModelApply) {
  if (shaderLensModelMinMax0)
  }

  if (shaderLensModelMinMax1) {
  if (shaderLensModelMinMax2)
  }

  shaderLensModelCalc = 0;
  shaderLensModelApply = 0;
  shaderLensModelMinMax0 = 0;
  shaderLensModelMinMax1 = 0;
  shaderLensModelMinMax2 = 0;
}

+ (void)compilePipelinesIfNeeded:(id)a3
{
  id v5 = (id)+[CILensModelKernelMetalProcessor compilePipelinesIfNeeded:]::targetedDevice;
  if ((id)+[CILensModelKernelMetalProcessor compilePipelinesIfNeeded:]::targetedDevice == a3)
  {
    if ([a1 hasValidPipelines]) {
      return;
    }
    id v5 = (id)+[CILensModelKernelMetalProcessor compilePipelinesIfNeeded:]::targetedDevice;
  }
  if (v5 != a3)
  {
    [a1 releasePipelines];
    +[CILensModelKernelMetalProcessor compilePipelinesIfNeeded:]::targetedDevice = (uint64_t)a3;
  }
  if (([a1 hasValidPipelines] & 1) == 0)
  {
    [a1 compilePipelines:a3];
  }
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v9 = (void *)[a5 metalCommandBuffer];
  uint64_t v10 = (void *)[v9 device];
  v11 = (void *)[a4 objectForKeyedSubscript:@"inputTuningParameters"];
  [a1 compilePipelinesIfNeeded:v10];
  LODWORD(a1) = [a1 hasValidPipelines];
  if (!a1) {
    return (char)a1;
  }
  v13 = (void *)[v10 newBufferWithLength:8 options:32];
  uint64_t v14 = [v10 newBufferWithLength:16 options:32];
  uint64_t v15 = [v10 newBufferWithLength:16 options:0];
  memset(v84, 0, 44);
  SDOFSimpleLensModelValue(@"fallbackFocusROI_left", v11);
  int v17 = v16;
  if (a4)
  {
    v18 = (void *)[a4 objectForKey:@"roi_left"];
    if (v18)
    {
      [v18 floatValue];
      int v17 = v19;
    }
    LODWORD(v84[0]) = v17;
    SDOFSimpleLensModelValue(@"fallbackFocusROI_top", v11);
    int v21 = v20;
    v22 = (void *)[a4 objectForKey:@"roi_top"];
    if (v22)
    {
      [v22 floatValue];
      int v21 = v23;
    }
    DWORD1(v84[0]) = v21;
    SDOFSimpleLensModelValue(@"fallbackFocusROI_width", v11);
    int v25 = v24;
    v26 = (void *)[a4 objectForKey:@"roi_width"];
    if (v26)
    {
      [v26 floatValue];
      int v25 = v27;
    }
    DWORD2(v84[0]) = v25;
    SDOFSimpleLensModelValue(@"fallbackFocusROI_height", v11);
    int v29 = v28;
    v30 = (void *)[a4 objectForKey:@"roi_height"];
    if (!v30) {
      goto LABEL_13;
    }
    [v30 floatValue];
  }
  else
  {
    LODWORD(v84[0]) = v16;
    SDOFSimpleLensModelValue(@"fallbackFocusROI_top", v11);
    DWORD1(v84[0]) = v32;
    SDOFSimpleLensModelValue(@"fallbackFocusROI_width", v11);
    DWORD2(v84[0]) = v33;
    SDOFSimpleLensModelValue(@"fallbackFocusROI_height", v11);
  }
  int v29 = v31;
LABEL_13:
  HIDWORD(v84[0]) = v29;
  SDOFSimpleLensModelValue(@"zeroShiftPercentile", v11);
  LODWORD(v84[1]) = v34;
  SDOFSimpleLensModelValue(@"simulatedFocalLength", v11);
  DWORD1(v84[1]) = v35;
  SDOFSimpleLensModelValue(@"aperture", v11);
  unsigned int v37 = v36;
  if (a4)
  {
    v38 = (void *)[a4 objectForKey:@"aperture"];
    if (v38)
    {
      [v38 floatValue];
      unsigned int v37 = v39;
    }
  }
  *((void *)&v84[1] + 1) = v37 | 0x45CE400000000000;
  SDOFSimpleLensModelValue(@"maxFGBlur", v11);
  LODWORD(v84[2]) = v40;
  SDOFRenderingValue(&cfstr_Maxblur.isa, v11);
  *(void *)((char *)&v84[2] + 4) = v41 | 0x3F563E8E00000000;
  char v64 = (char)a1;
  v62 = (void *)v15;
  v63 = (void *)v14;
  v65 = v9;
  if (a4)
  {
    v42 = (void *)[a4 objectForKey:@"width"];
    if (v42)
    {
      [v42 floatValue];
      unsigned int v44 = v43;
    }
    else
    {
      unsigned int v44 = 2016;
    }
    id v45 = a3;
    v47 = (void *)[a4 objectForKey:@"height"];
    if (v47)
    {
      [v47 floatValue];
      unsigned int v46 = v48;
    }
    else
    {
      unsigned int v46 = 1512;
    }
  }
  else
  {
    id v45 = a3;
    unsigned int v46 = 1512;
    unsigned int v44 = 2016;
  }
  uint64_t v83 = 0;
  unsigned int v49 = ((double)v46 * 0.25);
  uint64_t v50 = [(id)shaderLensModelMinMax1 maxTotalThreadsPerThreadgroup];
  mtlutl_ComputeThreadGroupParameters(v50, [(id)shaderLensModelMinMax1 threadExecutionWidth], (_DWORD *)&v83 + 1, &v83, ((double)v44 * 0.25), v49);
  uint64_t v51 = v83;
  a1 = (id)HIDWORD(v83);
  uint64_t v52 = v49 / v83;
  uint64_t v53 = [(id)shaderLensModelApply maxTotalThreadsPerThreadgroup];
  mtlutl_ComputeThreadGroupParameters(v53, [(id)shaderLensModelApply threadExecutionWidth], (_DWORD *)&v83 + 1, &v83, v44, v46);
  uint64_t v54 = v83;
  uint64_t v60 = HIDWORD(v83);
  uint64_t v59 = v44 / HIDWORD(v83);
  uint64_t v58 = v46 / v83;
  uint64_t v55 = objc_msgSend((id)objc_msgSend(v45, "objectAtIndexedSubscript:", 0), "metalTexture");
  uint64_t v61 = [a5 metalTexture];
  v56 = (void *)[v65 computeCommandEncoder];
  [v56 setComputePipelineState:shaderLensModelMinMax0];
  [v56 setBuffer:v13 offset:0 atIndex:0];
  int64x2_t v66 = vdupq_n_s64(1uLL);
  int64x2_t v81 = v66;
  uint64_t v82 = 1;
  int64x2_t v79 = v66;
  uint64_t v80 = 1;
  [v56 dispatchThreadgroups:&v81 threadsPerThreadgroup:&v79];
  [v56 setComputePipelineState:shaderLensModelMinMax1];
  [v56 setTexture:v55 atIndex:0];
  [v56 setBuffer:v13 offset:0 atIndex:0];
  v78[0] = ((double)v44 * 0.25) / a1;
  v78[1] = v52;
  v78[2] = 1;
  v77[0] = a1;
  v77[1] = v51;
  v77[2] = 1;
  [v56 dispatchThreadgroups:v78 threadsPerThreadgroup:v77];
  [v56 setComputePipelineState:shaderLensModelMinMax2];
  [v56 setBuffer:v13 offset:0 atIndex:0];
  [v56 setBuffer:v63 offset:0 atIndex:1];
  int64x2_t v75 = v66;
  uint64_t v76 = 1;
  int64x2_t v73 = v66;
  uint64_t v74 = 1;
  [v56 dispatchThreadgroups:&v75 threadsPerThreadgroup:&v73];
  [v56 setComputePipelineState:shaderLensModelCalc];
  [v56 setBytes:v84 length:44 atIndex:0];
  [v56 setBuffer:v63 offset:0 atIndex:1];
  [v56 setBuffer:v62 offset:0 atIndex:2];
  [v56 setTexture:v55 atIndex:0];
  [v56 setThreadgroupMemoryLength:2048 atIndex:0];
  int64x2_t v71 = v66;
  uint64_t v72 = 1;
  long long v69 = xmmword_1939545C0;
  uint64_t v70 = 1;
  [v56 dispatchThreadgroups:&v71 threadsPerThreadgroup:&v69];
  [v56 setComputePipelineState:shaderLensModelApply];
  [v56 setBuffer:v62 offset:0 atIndex:0];
  [v56 setTexture:v55 atIndex:0];
  [v56 setTexture:v61 atIndex:1];
  v68[0] = v59;
  v68[1] = v58;
  v68[2] = 1;
  v67[0] = v60;
  v67[1] = v54;
  v67[2] = 1;
  [v56 dispatchThreadgroups:v68 threadsPerThreadgroup:v67];
  [v56 endEncoding];

  LOBYTE(a1) = v64;
  return (char)a1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (int)outputFormat
{
  return 261;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  id v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"focusRect", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  [v5 CGRectValue];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

@end