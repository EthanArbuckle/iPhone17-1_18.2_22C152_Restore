@interface FBSProcessorCPU
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
@end

@implementation FBSProcessorCPU

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"fullROI"), "CGRectValue");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  int v16 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputMaxNumVertices"), "intValue");
  uint64_t v17 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaS"), "intValue");
  uint64_t v18 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaRLuma"), "intValue");
  uint64_t v19 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaRChroma"), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputLambda"), "floatValue");
  float v21 = v20;
  uint64_t v22 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"inputMaxNumIterations"), "intValue");
  if (v16 <= 1000) {
    +[FBSProcessorCPU processWithInputs:arguments:output:error:]();
  }
  if (!v17) {
    +[FBSProcessorCPU processWithInputs:arguments:output:error:]();
  }
  if (!v18) {
    +[FBSProcessorCPU processWithInputs:arguments:output:error:]();
  }
  if (!v19) {
    +[FBSProcessorCPU processWithInputs:arguments:output:error:].cold.4();
  }
  if (v21 == 0.0) {
    +[FBSProcessorCPU processWithInputs:arguments:output:error:].cold.5();
  }
  uint64_t v23 = v22;
  if (!v22) {
    +[FBSProcessorCPU processWithInputs:arguments:output:error:].cold.6();
  }
  unint64_t v24 = (unint64_t)v13;
  size_t v85 = (unint64_t)v15;
  v25 = (void *)[a3 objectAtIndexedSubscript:0];
  v26 = (void *)[a3 objectAtIndexedSubscript:1];
  v27 = (void *)[a3 objectAtIndexedSubscript:2];
  v82 = convertToFullFloatPixelBuffer(v26, v9, v11, v13, v15);
  v81 = convertToFullFloatPixelBuffer(v27, v9, v11, v13, v15);
  if ([a5 format] == 2309) {
    size_t v28 = [a5 bytesPerRow];
  }
  else {
    size_t v28 = 4 * v24;
  }
  pixelBuffer = createPixelBuffer((unint64_t)v13, v85, v28, 0);
  uint64_t v29 = v16;
  v30 = [[CIBilateralGridHash alloc] initWithWidth:(unint64_t)v13 height:v85 maxHashTableSize:v16];
  uint64_t v31 = [v25 surface];
  [v25 region];
  if (-[CIBilateralGridHash createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](v30, "createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", v31, v17, v18, v19))
  {
    v32 = ci_logger_performance();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.data) = 136446210;
      *(void **)((char *)&buf.data + 4) = "+[FBSProcessorCPU processWithInputs:arguments:output:error:]";
      _os_log_impl(&dword_193671000, v32, OS_LOG_TYPE_INFO, "%{public}s Returning disparity image; unable to create 3D bilateral grid hash. Please file a radar.",
        (uint8_t *)&buf,
        0xCu);
    }
  }
  v33 = [[CIBilateralSolverCPU alloc] initWithWidth:(unint64_t)v13 height:v85 maxVertices:v29];
  uint64_t v34 = [v25 surface];
  v35 = pixelBuffer;
  *(float *)&double v36 = v21;
  [(CIBilateralSolverCPU *)v33 doSolveWithBilateralGridhash:v30 reference:v34 disparity:v81 confidence:v82 output:pixelBuffer lambda:v23 maxIterations:v36];

  if ([a5 format] == 2053)
  {
    if (CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL)) {
      goto LABEL_31;
    }
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    unint64_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    uint64_t v39 = [a5 baseAddress];
    [a5 region];
    double v41 = v40;
    [a5 region];
    if (v41 >= v9)
    {
      int v44 = 0;
      int v43 = (int)(v42 * 4.0 + 0.0);
    }
    else
    {
      int v43 = 0;
      int v44 = (int)((v9 - v42) * 4.0 + 0.0);
    }
    [a5 region];
    double v51 = v50;
    [a5 region];
    if (v51 >= v11) {
      int v43 = (int)((double)v43 + v52 * (double)BytesPerRow);
    }
    else {
      int v44 = (int)((double)v44 + (v11 - v52) * (double)(unint64_t)[a5 bytesPerRow]);
    }
    [a5 region];
    double v54 = v53;
    double v55 = (double)v24;
    if (v54 < (double)v24) {
      [a5 region];
    }
    vImagePixelCount v56 = (unint64_t)v55;
    [a5 region];
    vImagePixelCount v57 = (unint64_t)v15;
    if (v58 < v15)
    {
      [a5 region];
      vImagePixelCount v57 = (unint64_t)v59;
    }
    buf.data = &BaseAddress[v43];
    buf.height = v57;
    buf.width = v56;
    buf.rowBytes = BytesPerRow;
    dest.data = (void *)(v39 + v44);
    dest.height = v57;
    dest.width = v56;
    dest.rowBytes = [a5 bytesPerRow];
    vImageConvert_PlanarFtoPlanar16F(&buf, &dest, 0);
    goto LABEL_30;
  }
  if ([a5 format] == 2309 && !CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL))
  {
    v45 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    size_t v46 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    if (v46 == [a5 bytesPerRow])
    {
      v47 = (void *)[a5 baseAddress];
      size_t v48 = CVPixelBufferGetBytesPerRow(pixelBuffer);
      size_t Height = CVPixelBufferGetHeight(pixelBuffer);
      memcpy(v47, v45, Height * v48);
    }
    else
    {
      size_t v61 = CVPixelBufferGetBytesPerRow(pixelBuffer);
      [a5 region];
      if (v62 < v13)
      {
        [a5 region];
        double v13 = v63;
      }
      [a5 region];
      if (v64 < v15)
      {
        [a5 region];
        size_t v85 = (unint64_t)v65;
      }
      uint64_t v66 = [a5 baseAddress];
      [a5 region];
      double v68 = v67;
      [a5 region];
      if (v68 >= v9)
      {
        int v71 = 0;
        int v70 = (int)(v69 * 4.0 + 0.0);
      }
      else
      {
        int v70 = 0;
        int v71 = (int)((v9 - v69) * 4.0 + 0.0);
      }
      [a5 region];
      double v73 = v72;
      [a5 region];
      if (v73 >= v11) {
        int v70 = (int)((double)v70 + v74 * (double)v61);
      }
      else {
        int v71 = (int)((double)v71 + (v11 - v74) * (double)(unint64_t)[a5 bytesPerRow]);
      }
      if (v85)
      {
        uint64_t v75 = 0;
        size_t v76 = vcvtd_n_u64_f64(v13, 2uLL);
        uint64_t v77 = v66 + v71;
        unsigned int v78 = 1;
        v79 = &v45[v70];
        do
        {
          memcpy((void *)(v77 + [a5 bytesPerRow] * v75), &v79[v75 * v61], v76);
          uint64_t v75 = v78;
        }
        while (v85 > v78++);
      }
    }
LABEL_30:
    v35 = pixelBuffer;
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  }
LABEL_31:
  if (v35) {
    CVPixelBufferRelease(v35);
  }
  if (v82) {
    CVPixelBufferRelease(v82);
  }
  if (v81) {
    CVPixelBufferRelease(v81);
  }
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