@interface CIPortraitEffectSpillCorrectionProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)hasValidPipelines;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
+ (void)compilePipelines:(id)a3;
+ (void)compilePipelinesIfNeeded:(id)a3;
+ (void)releasePipelines;
@end

@implementation CIPortraitEffectSpillCorrectionProcessor

+ (BOOL)hasValidPipelines
{
  if (qword_8CED0) {
    BOOL v2 = qword_8CED8 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  return !v2;
}

+ (void)compilePipelines:(id)a3
{
  id v9 = 0;
  id v4 = objc_msgSend(a3, "newDefaultLibraryWithBundle:error:", +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), 0);
  id v5 = [v4 newFunctionWithName:@"spillCorrectionPreProcess"];
  qword_8CED0 = (uint64_t)[a3 newComputePipelineStateWithFunction:v5 error:&v9];
  if (v9)
  {
    id v6 = [v9 localizedDescription];
    NSLog(@"Failed to initialize shaderSplit: %@; %@", v6, [v9 localizedFailureReason]);
  }
  id v7 = [v4 newFunctionWithName:@"spillCorrectionPostProcess"];
  qword_8CED8 = (uint64_t)[a3 newComputePipelineStateWithFunction:v7 error:&v9];
  if (v9)
  {
    id v8 = [v9 localizedDescription];
    NSLog(@"Failed to initialize shaderApplyConstraintAndComposite: %@; %@",
      v8,
      [v9 localizedFailureReason]);
  }
}

+ (void)releasePipelines
{
  BOOL v2 = (void *)qword_8CED8;
}

+ (void)compilePipelinesIfNeeded:(id)a3
{
  id v5 = (id)qword_8CEE0;
  if ((id)qword_8CEE0 == a3)
  {
    if ([a1 hasValidPipelines]) {
      return;
    }
    id v5 = (id)qword_8CEE0;
  }
  if (v5 != a3)
  {
    [a1 releasePipelines];
    qword_8CEE0 = (uint64_t)a3;
  }
  if (([a1 hasValidPipelines] & 1) == 0)
  {
    [a1 compilePipelines:a3];
  }
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v9 = [a5 metalCommandBuffer];
  if (!v9) {
    sub_4C494();
  }
  v10 = v9;
  id v11 = [v9 device];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B2E4;
  block[3] = &unk_75610;
  block[4] = a1;
  block[5] = v11;
  id v73 = a4;
  if (qword_8CEF0 != -1) {
    dispatch_once(&qword_8CEF0, block);
  }
  [a1 compilePipelinesIfNeeded:v11];
  unsigned __int8 v78 = [a1 hasValidPipelines];
  if (v78)
  {
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    double v13 = v12;
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    double v15 = v14;
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "region");
    unint64_t v76 = (unint64_t)v13;
    double v16 = (double)(unint64_t)v13;
    if (v17 != v16
      || (objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "region"),
          unint64_t v75 = (unint64_t)v15,
          double v18 = (double)(unint64_t)v15,
          v19 != v18))
    {
      sub_4C4EC();
    }
    [a5 region];
    if (v20 != v16 || ([a5 region], v21 != v18)) {
      sub_4C4C0();
    }
    unsigned int v22 = [(id)qword_8CED0 maxTotalThreadsPerThreadgroup];
    unsigned int v23 = [(id)qword_8CED0 threadExecutionWidth];
    unsigned int v25 = v75;
    unsigned int v24 = v76;
    int v26 = 1;
    if (((v22 | v23 | v76) & 1) == 0)
    {
      unsigned int v27 = v22;
      do
      {
        char v28 = v24;
        v24 >>= 1;
        unsigned int v22 = v27 >> 1;
        char v29 = v23;
        v23 >>= 1;
        v26 *= 2;
        if ((v28 & 2) != 0) {
          break;
        }
        if ((v27 & 2) != 0) {
          break;
        }
        v27 >>= 1;
      }
      while ((v29 & 2) == 0);
    }
    int v30 = 1;
    if (((v75 | v22) & 1) == 0)
    {
      unsigned int v31 = v75;
      unsigned int v32 = v22;
      do
      {
        unsigned int v25 = v31 >> 1;
        unsigned int v22 = v32 >> 1;
        v30 *= 2;
        char v33 = v31 | v32;
        v31 >>= 1;
        v32 >>= 1;
      }
      while ((v33 & 2) == 0);
    }
    if (v23 >= v22) {
      unsigned int v34 = v22;
    }
    else {
      unsigned int v34 = v23;
    }
    if (v34)
    {
      if (v34 + 1 > 2) {
        int v35 = v34 + 1;
      }
      else {
        int v35 = 2;
      }
      unsigned int v36 = 1;
      int v37 = 1;
      int v38 = 1;
      do
      {
        if (!(v24 % v36))
        {
          int v39 = 1;
          for (unsigned int i = v25; ; i /= 7u)
          {
            while (1)
            {
              while (1)
              {
                while ((i & 1) == 0 && 2 * v36 * v39 <= v22)
                {
                  i >>= 1;
                  v39 *= 2;
                }
                if (i != 3 * (i / 3) || 3 * v36 * v39 > v22) {
                  break;
                }
                v39 *= 3;
                i /= 3u;
              }
              if (i != 5 * (i / 5) || 5 * v36 * v39 > v22) {
                break;
              }
              v39 *= 5;
              i /= 5u;
            }
            if (i % 7 || 7 * v36 * v39 > v22) {
              break;
            }
            v39 *= 7;
          }
          unsigned int v44 = v38 * v37;
          if (v39 * v36 >= v38 * v37) {
            int v38 = v36;
          }
          if (v39 * v36 >= v44) {
            int v37 = v39;
          }
        }
        ++v36;
      }
      while (v36 != v35);
    }
    else
    {
      int v38 = 1;
      int v37 = 1;
    }
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    double v46 = v45;
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    double v48 = v47;
    id v49 = (id)objc_opt_new();
    id v50 = (id)objc_opt_new();
    v51 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:10 width:(unint64_t)v46 height:(unint64_t)v48 mipmapped:0];
    [(MTLTextureDescriptor *)v51 setUsage:3];
    unint64_t v52 = (v38 * v26);
    int v53 = 3;
    unint64_t v71 = v76 / v52;
    unint64_t v72 = v52;
    do
    {
      objc_msgSend(v50, "addObject:", objc_msgSend(v11, "newTextureWithDescriptor:", v51));
      objc_msgSend(v49, "addObject:", objc_msgSend(v11, "newTextureWithDescriptor:", v51));
      --v53;
    }
    while (v53);
    id v54 = [v11 newTextureWithDescriptor:v51];
    id v55 = [v73 objectForKeyedSubscript:@"bgColor"];
    [v55 red];
    float64_t v74 = v56;
    [v55 green];
    float64_t v70 = v57;
    [v55 blue];
    v58.f64[0] = v74;
    v58.f64[1] = v70;
    *(float32x2_t *)&v58.f64[0] = vcvt_f32_f64(v58);
    *(float *)&double v59 = v59;
    LODWORD(v58.f64[1]) = LODWORD(v59);
    float64x2_t v91 = v58;
    id v60 = [v10 computeCommandEncoder];
    [v60 setComputePipelineState:qword_8CED0];
    objc_msgSend(v60, "setTexture:atIndex:", objc_msgSend(v50, "objectAtIndexedSubscript:", 0), 0);
    objc_msgSend(v60, "setTexture:atIndex:", objc_msgSend(v50, "objectAtIndexedSubscript:", 1), 1);
    objc_msgSend(v60, "setTexture:atIndex:", objc_msgSend(v50, "objectAtIndexedSubscript:", 2), 2);
    [v60 setTexture:v54 atIndex:3];
    objc_msgSend(v60, "setTexture:atIndex:", objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "metalTexture"), 4);
    objc_msgSend(v60, "setTexture:atIndex:", objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "metalTexture"), 5);
    [v60 setBytes:&v91 length:16 atIndex:0];
    unint64_t v61 = (v37 * v30);
    unint64_t v82 = v71;
    unint64_t v83 = v75 / v61;
    uint64_t v84 = 1;
    unint64_t v88 = v72;
    unint64_t v89 = v61;
    uint64_t v90 = 1;
    [v60 dispatchThreadgroups:&v82 threadsPerThreadgroup:&v88];
    [v60 endEncoding];
    if (v76 < 0xA) {
      unint64_t v63 = 1;
    }
    else {
      unint64_t v63 = v76 / 0xA;
    }
    if (v75 < 0xA) {
      unint64_t v64 = 1;
    }
    else {
      unint64_t v64 = v75 / 0xA;
    }
    LOBYTE(v69) = 1;
    LODWORD(v62) = 953267991;
    id v65 = objc_msgSend(objc_alloc((Class)MPSImageSpatioTemporalGuidedFilter), "initWithDevice:filterDescriptor:", v11, +[MPSImageSpatioTemporalGuidedFilterDescriptor filterDescriptorWithWidth:height:arrayLength:kernelSpatialDiameter:kernelTemporalDiameter:epsilon:sourceChannels:guideChannels:preallocateIntermediates:](MPSImageSpatioTemporalGuidedFilterDescriptor, "filterDescriptorWithWidth:height:arrayLength:kernelSpatialDiameter:kernelTemporalDiameter:epsilon:sourceChannels:guideChannels:preallocateIntermediates:", v63, v64, 1, 5, 1, 3, v62, 3, v69));
    id v66 = objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "metalTexture");
    v93[0] = v54;
    v93[1] = v54;
    v93[2] = v54;
    objc_msgSend(v65, "encodeToCommandBuffer:sourceTextureArray:guidanceTexture:constraintsTextureArray:numberOfIterations:destinationTextureArray:", v10, v50, v66, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v93, 3), 30, v49);
    unint64_t v82 = 0;
    unint64_t v83 = (unint64_t)&v82;
    uint64_t v84 = 0x3052000000;
    v85 = sub_2B338;
    v86 = sub_2B348;
    uint64_t v87 = 0;
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_2B354;
    v81[3] = &unk_75638;
    v81[4] = &v82;
    [v10 addScheduledHandler:v81];
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_2B38C;
    v80[3] = &unk_75660;
    v80[4] = v65;
    [v10 addCompletedHandler:v80];
    id v67 = [v10 computeCommandEncoder];
    [v67 setComputePipelineState:qword_8CED8];
    objc_msgSend(v67, "setTexture:atIndex:", objc_msgSend(a5, "metalTexture"), 0);
    objc_msgSend(v67, "setTexture:atIndex:", objc_msgSend(v49, "objectAtIndexedSubscript:", 0), 1);
    objc_msgSend(v67, "setTexture:atIndex:", objc_msgSend(v49, "objectAtIndexedSubscript:", 1), 2);
    objc_msgSend(v67, "setTexture:atIndex:", objc_msgSend(v49, "objectAtIndexedSubscript:", 2), 3);
    objc_msgSend(v67, "setTexture:atIndex:", objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "metalTexture"), 4);
    objc_msgSend(v67, "setTexture:atIndex:", objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "metalTexture"), 5);
    unint64_t v88 = v71;
    unint64_t v89 = v75 / v61;
    uint64_t v90 = 1;
    v79[0] = v72;
    v79[1] = v61;
    v79[2] = 1;
    [v67 dispatchThreadgroups:&v88 threadsPerThreadgroup:v79];
    [v67 endEncoding];
    _Block_object_dispose(&v82, 8);
  }
  else
  {
    NSLog(@"SLOG: One or more shaders not available, cannot process image");
  }
  return v78;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3)
  {
    if (a3 != 1) {
      sub_4C518();
    }
    v3 = &kCIFormatR8;
  }
  else
  {
    v3 = &kCIFormatBGRA8;
  }
  return *v3;
}

+ (int)outputFormat
{
  return kCIFormatBGRA8;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

@end