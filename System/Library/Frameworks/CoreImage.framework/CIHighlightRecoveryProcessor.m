@interface CIHighlightRecoveryProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)compilePipelineForDevice:(id)a3 functionName:(id)a4 constantValues:(id)a5;
+ (id)functionConstantValuesTuningParameters:(id)a3;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIHighlightRecoveryProcessor

+ (id)compilePipelineForDevice:(id)a3 functionName:(id)a4 constantValues:(id)a5
{
  uint64_t v12 = 0;
  v8 = objc_msgSend(a3, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", a1), &v12);
  v9 = (void *)[v8 newFunctionWithName:a4 constantValues:a5 error:&v12];
  v10 = (void *)[a3 newComputePipelineStateWithFunction:v9 error:&v12];

  return v10;
}

+ (id)functionConstantValuesTuningParameters:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"maxIntensityT0"), "floatValue");
  float v5 = v4;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"maxIntensityT1"), "floatValue");
  float v7 = v6;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"minIntensityT0"), "floatValue");
  float v9 = v8;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"minIntensityT1"), "floatValue");
  float v10 = 1.0 / (float)(v7 - v5);
  float v12 = 1.0 / (float)(v11 - v9);
  id v13 = objc_alloc_init(MEMORY[0x1E4F35228]);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __71__CIHighlightRecoveryProcessor_functionConstantValuesTuningParameters___block_invoke;
  v22 = &unk_1E57728E8;
  id v23 = v13;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v16 = __71__CIHighlightRecoveryProcessor_functionConstantValuesTuningParameters___block_invoke_2;
  v17 = &unk_1E5772910;
  id v18 = v13;
  __int16 v24 = 8;
  [v13 setConstantValue:&v24 type:41 withName:@"V3HLR::kXhlrbTileSize"];
  __71__CIHighlightRecoveryProcessor_functionConstantValuesTuningParameters___block_invoke_2((uint64_t)v15, @"V3HLR::kXhlrbMaxIntensityThresholdM", v10);
  v16((uint64_t)v15, @"V3HLR::kXhlrbMaxIntensityThresholdC", -(float)(v10 * v5));
  v16((uint64_t)v15, @"V3HLR::kXhlrbMinIntensityThresholdM", v12);
  v16((uint64_t)v15, @"V3HLR::kXhlrbMinIntensityThresholdC", -(float)(v12 * v9));
  return v13;
}

uint64_t __71__CIHighlightRecoveryProcessor_functionConstantValuesTuningParameters___block_invoke(uint64_t a1, uint64_t a2, __int16 a3)
{
  __int16 v4 = a3;
  return [*(id *)(a1 + 32) setConstantValue:&v4 type:41 withName:a2];
}

uint64_t __71__CIHighlightRecoveryProcessor_functionConstantValuesTuningParameters___block_invoke_2(uint64_t a1, uint64_t a2, float _S0)
{
  __asm { FCVT            H0, S0 }
  __int16 v9 = _H0;
  return [*(id *)(a1 + 32) setConstantValue:&v9 type:16 withName:a2];
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  __int16 v9 = objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4, a5, a6);
  float v10 = (void *)[a5 metalCommandBuffer];
  float v11 = objc_msgSend((id)objc_msgSend(v10, "commandQueue"), "device");
  uint64_t v12 = [a1 functionConstantValuesTuningParameters:a4];
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"blurRadiusT0"), "floatValue");
  float v14 = v13;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"blurRadiusT1"), "floatValue");
  float v16 = v15;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"maxBlur"), "floatValue");
  float v18 = v17;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"apertureScaling"), "floatValue");
  float v20 = (float)(v14 * v19) / v18;
  v75[0] = 1.0 / (float)((float)((float)(v16 * v19) / v18) - v20);
  v75[1] = -(float)(v75[0] * v20);
  v21 = (void *)[a1 compilePipelineForDevice:v11 functionName:@"sparserendering_xhlrb_scan" constantValues:v12];
  v22 = (void *)[a1 compilePipelineForDevice:v11 functionName:@"sparserendering_xhlrb_diffuse" constantValues:v12];
  uint64_t v23 = [a1 compilePipelineForDevice:v11 functionName:@"sparserendering_xhlrb_copy_back" constantValues:v12];
  __int16 v24 = (void *)v23;
  if (v21) {
    BOOL v25 = v22 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  BOOL v26 = v25 || v23 == 0;
  BOOL result = !v26;
  if (!v26)
  {
    BOOL v56 = result;
    id v57 = a5;
    [v9 region];
    v59 = v10;
    unint64_t v29 = (unint64_t)v28;
    [v9 region];
    unint64_t v31 = v29 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v32 = (unint64_t)v30 & 0xFFFFFFFFFFFFFFFELL;
    float v33 = log2f(fminf((float)(unint64_t)[v21 maxTotalThreadsPerThreadgroup], fminf((float)(unint64_t)objc_msgSend(v22, "maxTotalThreadsPerThreadgroup"), (float)(unint64_t)objc_msgSend(v24, "maxTotalThreadsPerThreadgroup"))));
    float v34 = exp2f(floorf(v33));
    unint64_t v53 = v31;
    v54 = v21;
    if (v34 >= 0x40) {
      uint64_t v35 = 8;
    }
    else {
      uint64_t v35 = v34 >> 3;
    }
    unint64_t v60 = (v31 + 7) >> 3;
    unint64_t v52 = v32;
    unint64_t v55 = (v32 + 7) >> 3;
    v36 = (void *)[v11 newBufferWithLength:((v31 + 7) & 0xFFFFFFFFFFFFFFF8) * v55 + 16 options:32];
    v37 = (void *)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:115 width:v31 height:v32 mipmapped:0];
    [v37 setUsage:3];
    [v37 setStorageMode:2];
    v38 = v9;
    v58 = v9;
    uint64_t v39 = [v11 newTextureWithDescriptor:v37];
    uint64_t v40 = [v11 newTextureWithDescriptor:v37];
    v41 = (void *)[v59 blitCommandEncoder];
    [v59 setLabel:@"XHLRBComputeBlit"];
    v73[0] = v53;
    v73[1] = v52;
    v73[2] = 1;
    memset(v74, 0, sizeof(v74));
    memset(v72, 0, sizeof(v72));
    objc_msgSend(v41, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", objc_msgSend(v38, "metalTexture"), 0, 0, v74, v73, v39, 0, 0, v72);
    objc_msgSend(v41, "fillBuffer:range:value:", v36, 0, objc_msgSend(v36, "length"), 0);
    [v41 endEncoding];
    v42 = (void *)[v59 computeCommandEncoder];
    [v42 setLabel:@"XHLRBComputeCompute"];
    [v42 setComputePipelineState:v54];
    [v42 setBytes:v75 length:8 atIndex:0];
    [v42 setBuffer:v36 offset:0 atIndex:1];
    objc_msgSend(v42, "setTexture:atIndex:", objc_msgSend(v58, "metalTexture"), 0);
    v71[0] = v60;
    v71[1] = v55;
    v71[2] = 1;
    uint64_t v69 = v35;
    long long v70 = xmmword_1939553E0;
    [v42 dispatchThreadgroups:v71 threadsPerThreadgroup:&v69];
    int v43 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"iterations"), "unsignedIntValue");
    if (v43)
    {
      int v44 = v43;
      do
      {
        [v42 setComputePipelineState:v22];
        [v42 setBytes:v75 length:8 atIndex:0];
        [v42 setBuffer:v36 offset:0 atIndex:1];
        [v42 setTexture:v39 atIndex:0];
        [v42 setTexture:v40 atIndex:1];
        uint64_t v67 = v35;
        long long v68 = xmmword_1939553E0;
        [v42 dispatchThreadgroupsWithIndirectBuffer:v36 indirectBufferOffset:0 threadsPerThreadgroup:&v67];
        [v42 setComputePipelineState:v24];
        [v42 setBuffer:v36 offset:0 atIndex:0];
        [v42 setTexture:v40 atIndex:0];
        [v42 setTexture:v39 atIndex:1];
        uint64_t v65 = v35;
        long long v66 = xmmword_1939553E0;
        [v42 dispatchThreadgroupsWithIndirectBuffer:v36 indirectBufferOffset:0 threadsPerThreadgroup:&v65];
        --v44;
      }
      while (v44);
    }
    [v42 endEncoding];
    v45 = (void *)[v59 blitCommandEncoder];
    [v59 setLabel:@"XHLRBComputeBlit"];
    [v58 region];
    double MinX = CGRectGetMinX(v76);
    [v58 region];
    double MaxY = CGRectGetMaxY(v77);
    [v57 region];
    double v48 = CGRectGetMinX(v78);
    [v57 region];
    v64[0] = (unint64_t)(v48 - MinX);
    v64[1] = (unint64_t)-(CGRectGetMaxY(v79) - MaxY);
    v64[2] = 0;
    [v57 region];
    unint64_t v50 = (unint64_t)v49;
    [v57 region];
    v63[0] = v50;
    v63[1] = (unint64_t)v51;
    v63[2] = 1;
    memset(v62, 0, sizeof(v62));
    objc_msgSend(v45, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v39, 0, 0, v64, v63, objc_msgSend(v57, "metalTexture"), 0, 0, v62);
    [v45 endEncoding];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __73__CIHighlightRecoveryProcessor_processWithInputs_arguments_output_error___block_invoke;
    v61[3] = &unk_1E5772938;
    v61[4] = v36;
    v61[5] = v39;
    v61[6] = v40;
    [v59 addCompletedHandler:v61];
    return v56;
  }
  return result;
}

void __73__CIHighlightRecoveryProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  CGRect v17 = CGRectIntegral(a5);
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  uint64_t MinX = (uint64_t)CGRectGetMinX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  uint64_t MaxX = (uint64_t)CGRectGetMaxX(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  uint64_t MinY = (uint64_t)CGRectGetMinY(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  uint64_t v12 = (uint64_t)CGRectGetMaxY(v20) + 7;
  double v13 = (double)(uint64_t)(MinX & 0xFFFFFFFFFFFFFFF8);
  double v14 = (double)(uint64_t)(MinY & 0xFFFFFFFFFFFFFFF8);
  double v15 = (double)(uint64_t)(MaxX + 7 - (MinX & 0xFFFFFFFFFFFFFFF8 | (MaxX + 7) & 7));
  double v16 = (double)(uint64_t)(v12 - (MinY & 0xFFFFFFFFFFFFFFF8 | v12 & 7));
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 2056;
}

+ (int)outputFormat
{
  return 2056;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 1;
}

@end