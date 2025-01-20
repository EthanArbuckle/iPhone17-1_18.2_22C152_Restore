@interface FBSProcessorGPU
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
@end

@implementation FBSProcessorGPU

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"fullROI"), "CGRectValue");
  double v10 = v9;
  double v12 = v11;
  int v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputMaxNumVertices"), "intValue");
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaS"), "intValue");
  uint64_t v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaRLuma"), "intValue");
  uint64_t v16 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaRChroma"), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputLambda"), "floatValue");
  float v18 = v17;
  unsigned int v19 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputMaxNumIterations"), "intValue");
  if (v13 <= 1000) {
    +[FBSProcessorGPU processWithInputs:arguments:output:error:]();
  }
  if (!v14) {
    +[FBSProcessorGPU processWithInputs:arguments:output:error:]();
  }
  if (!v15) {
    +[FBSProcessorGPU processWithInputs:arguments:output:error:]();
  }
  if (!v16) {
    +[FBSProcessorGPU processWithInputs:arguments:output:error:].cold.4();
  }
  if (v18 == 0.0) {
    +[FBSProcessorGPU processWithInputs:arguments:output:error:].cold.5();
  }
  if (!v19) {
    +[FBSProcessorGPU processWithInputs:arguments:output:error:].cold.6();
  }
  unsigned int v56 = v19;
  v20 = (void *)[a3 objectAtIndexedSubscript:0];
  v55 = (void *)[a3 objectAtIndexedSubscript:1];
  v21 = (void *)[a3 objectAtIndexedSubscript:2];
  v22 = -[CIBilateralSolverGPU initWithWidth:height:maxVertices:commandBuffer:]([CIBilateralSolverGPU alloc], "initWithWidth:height:maxVertices:commandBuffer:", (unint64_t)v10, (unint64_t)v12, v13, [a5 metalCommandBuffer]);
  v23 = [[CIBilateralGridHash alloc] initWithWidth:(unint64_t)v10 height:(unint64_t)v12 maxHashTableSize:v13];
  uint64_t v24 = [v20 surface];
  [v20 region];
  if (-[CIBilateralGridHash createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](v23, "createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", v24, v14, v15, v16))
  {
    v25 = ci_logger_performance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      v58 = "+[FBSProcessorGPU processWithInputs:arguments:output:error:]";
      _os_log_impl(&dword_193671000, v25, OS_LOG_TYPE_INFO, "%{public}s Returning disparity image; unable to create 3D bilateral grid hash. Please file a radar.",
        buf,
        0xCu);
    }
  }
  v26 = (__IOSurface *)[v20 surface];
  v27 = objc_msgSend((id)objc_msgSend(a5, "metalCommandBuffer"), "device");
  size_t Width = IOSurfaceGetWidth(v26);
  v29 = (void *)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:70 width:Width height:IOSurfaceGetHeight(v26) mipmapped:0];
  [v29 setUsage:23];
  v30 = (void *)[v27 newTextureWithDescriptor:v29 iosurface:v26 plane:0];
  [v20 region];
  float64_t v53 = v31;
  [v20 region];
  v32.f64[0] = v53;
  v32.f64[1] = v33;
  int32x2_t v54 = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v32)));
  [v55 region];
  float64_t v51 = v34;
  [v55 region];
  v35.f64[0] = v51;
  v35.f64[1] = v36;
  int32x2_t v52 = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v35)));
  [v21 region];
  float64_t v49 = v37;
  [v21 region];
  v38.f64[0] = v49;
  v38.f64[1] = v39;
  int32x2_t v50 = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v38)));
  [a5 region];
  float64_t v48 = v40;
  [a5 region];
  v41.f64[0] = v48;
  v41.f64[1] = v42;
  *(int32x2_t *)&v41.f64[0] = vmovn_s64(vcvtq_s64_f64(vnegq_f64(v41)));
  *(_WORD *)&buf[2] = v54.i16[2];
  *(_WORD *)buf = v54.i16[0];
  WORD1(v58) = v52.i16[2];
  LOWORD(v58) = v52.i16[0];
  HIWORD(v58) = v50.i16[2];
  WORD2(v58) = v50.i16[0];
  __int16 v60 = WORD2(v41.f64[0]);
  __int16 v59 = LOWORD(v41.f64[0]);
  uint64_t v43 = [v21 metalTexture];
  uint64_t v44 = [v55 metalTexture];
  uint64_t v45 = [a5 metalTexture];
  *(float *)&double v46 = v18;
  [(CIBilateralSolverGPU *)v22 doSolveWithBilateralGridhash:v23 reference:v30 disparity:v43 confidence:v44 output:v45 lambda:v56 maxIterations:v46 offsets:buf];

  return 1;
}

+ (void)processWithInputs:arguments:output:error:.cold.1()
{
}

+ (void)processWithInputs:arguments:output:error:.cold.2()
{
}

+ (void)processWithInputs:arguments:output:error:.cold.3()
{
}

+ (void)processWithInputs:arguments:output:error:.cold.4()
{
}

+ (void)processWithInputs:arguments:output:error:.cold.5()
{
}

+ (void)processWithInputs:arguments:output:error:.cold.6()
{
}

@end