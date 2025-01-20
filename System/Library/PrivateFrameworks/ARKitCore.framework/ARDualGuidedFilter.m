@interface ARDualGuidedFilter
- (ARDualGuidedFilter)initWithDevice:(id)a3 useSmoothing:(BOOL)a4;
- (double)epsilon;
- (id)encodeBoxBlurToCommandBuffer:(id)a3 input:(id)a4 intermediate:(id)a5 output:(id)a6;
- (unint64_t)erosionRadius;
- (unint64_t)uncertaintyRadius;
- (void)encodeDualCoefficients:(id)a3 guide:(id)a4 stencil:(id)a5 coefficientsTextureFG:(id)a6 coefficientsTextureBG:(id)a7;
- (void)setEpsilon:(double)a3;
- (void)setErosionRadius:(unint64_t)a3;
- (void)setUncertaintyRadius:(unint64_t)a3;
- (void)setupBuffersWithWidth:(unsigned int)a3 andHeight:(unsigned int)a4;
@end

@implementation ARDualGuidedFilter

- (ARDualGuidedFilter)initWithDevice:(id)a3 useSmoothing:(BOOL)a4
{
  id v7 = a3;
  v49.receiver = self;
  v49.super_class = (Class)ARDualGuidedFilter;
  v8 = [(ARDualGuidedFilter *)&v49 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v10 = ARKitCoreBundle();
    v11 = [v10 URLForResource:@"default" withExtension:@"metallib"];

    uint64_t v12 = [(MTLDevice *)v9->_device newLibraryWithURL:v11 error:0];
    mattingLibrary = v9->_mattingLibrary;
    v9->_mattingLibrary = (MTLLibrary *)v12;

    BOOL v14 = a4
       || +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.matting.useTemporalSmoothing"];
    v9->_usingSmoothing = v14;
    v9->_useSoftGuidedFilter = !+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.matting.disableSoftEdges"];
    BOOL v15 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.matting.doubleMLResolutionForIPad"];
    v9->_enableDoubleMLResolutionMatting = v15;
    if (v15) {
      char v16 = ARDeviceIsiPad();
    }
    else {
      char v16 = 0;
    }
    v9->_enableDoubleMLResolutionMatting = v16;
    v9->_uncertaintyRadius = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.matting.uncertaintyRadius"] << v16;
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F35598]) initWithDevice:v9->_device kernelDiameter:(2 * v9->_uncertaintyRadius) | 1];
    guidedFilter = v9->_guidedFilter;
    v9->_guidedFilter = (MPSImageGuidedFilter *)v17;

    +[ARKitUserDefaults floatForKey:@"com.apple.arkit.matting.epsilon"];
    -[MPSImageGuidedFilter setEpsilon:](v9->_guidedFilter, "setEpsilon:");
    LODWORD(v19) = 1.0;
    [(MPSImageGuidedFilter *)v9->_guidedFilter setReconstructScale:v19];
    [(MPSImageGuidedFilter *)v9->_guidedFilter setReconstructOffset:0.0];
    [(MPSImageGuidedFilter *)v9->_guidedFilter setLabel:@"com.apple.arkit.guidedfilter"];
    v9->_erodeRadius = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.matting.erosionRadius"] << v16;
    v20 = (void *)[(MTLLibrary *)v9->_mattingLibrary newFunctionWithName:@"invert_k"];
    uint64_t v21 = [(MTLDevice *)v9->_device newComputePipelineStateWithFunction:v20 error:0];
    invertPSO = v9->_invertPSO;
    v9->_invertPSO = (MTLComputePipelineState *)v21;

    v23 = (void *)[(MTLLibrary *)v9->_mattingLibrary newFunctionWithName:@"boxblur_vertical_k"];
    uint64_t v24 = [(MTLDevice *)v9->_device newComputePipelineStateWithFunction:v23 error:0];
    boxblurVPSO = v9->_boxblurVPSO;
    v9->_boxblurVPSO = (MTLComputePipelineState *)v24;

    v26 = (void *)[(MTLLibrary *)v9->_mattingLibrary newFunctionWithName:@"boxblur_horizontal_k"];
    uint64_t v27 = [(MTLDevice *)v9->_device newComputePipelineStateWithFunction:v26 error:0];
    boxblurHPSO = v9->_boxblurHPSO;
    v9->_boxblurHPSO = (MTLComputePipelineState *)v27;

    v29 = (void *)[(MTLLibrary *)v9->_mattingLibrary newFunctionWithName:@"erode_binary_vertical_k"];
    uint64_t v30 = [(MTLDevice *)v9->_device newComputePipelineStateWithFunction:v29 error:0];
    erodeVPSO = v9->_erodeVPSO;
    v9->_erodeVPSO = (MTLComputePipelineState *)v30;

    v32 = (void *)[(MTLLibrary *)v9->_mattingLibrary newFunctionWithName:@"erode_binary_horizontal_k"];
    uint64_t v33 = [(MTLDevice *)v9->_device newComputePipelineStateWithFunction:v32 error:0];
    erodeHPSO = v9->_erodeHPSO;
    v9->_erodeHPSO = (MTLComputePipelineState *)v33;

    v35 = (void *)[(MTLLibrary *)v9->_mattingLibrary newFunctionWithName:@"coeficients_smooth_k"];
    uint64_t v36 = [(MTLDevice *)v9->_device newComputePipelineStateWithFunction:v35 error:0];
    smoothCoeficients = v9->_smoothCoeficients;
    v9->_smoothCoeficients = (MTLComputePipelineState *)v36;

    if (v9->_useSoftGuidedFilter)
    {
      v48 = v23;
      v38 = v11;
      id v39 = v7;
      v40 = (void *)[(MTLLibrary *)v9->_mattingLibrary newFunctionWithName:@"confidence_k"];
      uint64_t v41 = [(MTLDevice *)v9->_device newComputePipelineStateWithFunction:v40 error:0];
      getConfidence = v9->_getConfidence;
      v9->_getConfidence = (MTLComputePipelineState *)v41;

      v43 = v20;
      v44 = (void *)[(MTLLibrary *)v9->_mattingLibrary newFunctionWithName:@"combineFGBG_k"];
      uint64_t v45 = [(MTLDevice *)v9->_device newComputePipelineStateWithFunction:v44 error:0];
      combineFGBGStencil = v9->_combineFGBGStencil;
      v9->_combineFGBGStencil = (MTLComputePipelineState *)v45;

      v20 = v43;
      id v7 = v39;
      v11 = v38;
      v23 = v48;
    }
  }
  return v9;
}

- (void)setUncertaintyRadius:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = a3;
  }
  self->_uncertaintyRadius = v4;
  v5 = (MPSImageGuidedFilter *)[objc_alloc(MEMORY[0x1E4F35598]) initWithDevice:self->_device kernelDiameter:(2 * self->_uncertaintyRadius) | 1];
  guidedFilter = self->_guidedFilter;
  self->_guidedFilter = v5;

  +[ARKitUserDefaults floatForKey:@"com.apple.arkit.matting.epsilon"];
  -[MPSImageGuidedFilter setEpsilon:](self->_guidedFilter, "setEpsilon:");
  LODWORD(v7) = 1.0;
  [(MPSImageGuidedFilter *)self->_guidedFilter setReconstructScale:v7];
  [(MPSImageGuidedFilter *)self->_guidedFilter setReconstructOffset:0.0];
  v8 = self->_guidedFilter;
  [(MPSImageGuidedFilter *)v8 setLabel:@"com.apple.arkit.guidedfilter"];
}

- (void)setErosionRadius:(unint64_t)a3
{
  self->_erodeRadius = a3;
}

- (void)setEpsilon:(double)a3
{
  *(float *)&a3 = a3;
  [(MPSImageGuidedFilter *)self->_guidedFilter setEpsilon:a3];
}

- (id)encodeBoxBlurToCommandBuffer:(id)a3 input:(id)a4 intermediate:(id)a5 output:(id)a6
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v30 = v10;
  BOOL v14 = [v10 computeCommandEncoder];
  [v14 setLabel:@"Compute box blur"];
  unsigned int v15 = [v11 width];
  unsigned int v16 = [v11 height];
  id v17 = v11;
  v40[0] = v17;
  id v18 = v12;
  unint64_t uncertaintyRadius = self->_uncertaintyRadius;
  v40[1] = v18;
  v37[0] = uncertaintyRadius;
  *(float *)&v37[1] = 1.0 / (float)((2 * uncertaintyRadius) | 1);
  __asm { FMOV            V1.2S, #1.0 }
  float32x2_t v38 = vdiv_f32(_D1, vcvt_f32_u32((uint32x2_t)__PAIR64__(v16, v15)));
  [v14 setComputePipelineState:self->_boxblurVPSO];
  objc_msgSend(v14, "setTextures:withRange:", v40, 0, 2);
  [v14 setBytes:v37 length:16 atIndex:0];
  unint64_t v34 = ((unint64_t)v15 + 15) >> 4;
  unint64_t v35 = ((unint64_t)v16 + 15) >> 4;
  uint64_t v36 = 1;
  int64x2_t v31 = vdupq_n_s64(0x10uLL);
  int64x2_t v32 = v31;
  uint64_t v33 = 1;
  [v14 dispatchThreadgroups:&v34 threadsPerThreadgroup:&v32];
  id v25 = v18;
  v39[0] = v25;
  id v26 = v13;
  v39[1] = v26;
  [v14 setComputePipelineState:self->_boxblurHPSO];
  objc_msgSend(v14, "setTextures:withRange:", v39, 0, 2);
  [v14 setBytes:v37 length:16 atIndex:0];
  unint64_t v34 = ((unint64_t)v15 + 15) >> 4;
  unint64_t v35 = ((unint64_t)v16 + 15) >> 4;
  uint64_t v36 = 1;
  int64x2_t v32 = v31;
  uint64_t v33 = 1;
  [v14 dispatchThreadgroups:&v34 threadsPerThreadgroup:&v32];
  [v14 endEncoding];
  for (uint64_t i = 1; i != -1; --i)

  for (uint64_t j = 1; j != -1; --j)
  return v30;
}

- (void)setupBuffersWithWidth:(unsigned int)a3 andHeight:(unsigned int)a4
{
  if (self->_width != a3 || self->_height != a4)
  {
    self->_width = a3;
    self->_height = a4;
    id v26 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:a3 height:a4 mipmapped:0];
    [v26 setUsage:3];
    [v26 setStorageMode:0];
    v5 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v26];
    erodeIntermediate = self->_erodeIntermediate;
    self->_erodeIntermediate = v5;

    [v26 setUsage:7];
    double v7 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v26];
    overlayStencilDownsampled = self->_overlayStencilDownsampled;
    self->_overlayStencilDownsampled = v7;

    v9 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v26];
    overlayStencilDownsampledBG = self->_overlayStencilDownsampledBG;
    self->_overlayStencilDownsampledBG = v9;

    if (self->_useSoftGuidedFilter)
    {
      id v11 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v26];
      confidenceMap = self->_confidenceMap;
      self->_confidenceMap = v11;

      uint64_t v13 = [v26 pixelFormat];
      [v26 setPixelFormat:12];
      BOOL v14 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v26];
      combinedFGBG = self->_combinedFGBG;
      self->_combinedFGBG = v14;

      [v26 setPixelFormat:v13];
    }
    [v26 setUsage:3];
    [v26 setPixelFormat:115];
    unsigned int v16 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v26];
    blurIntermediate = self->_blurIntermediate;
    self->_blurIntermediate = v16;

    id v18 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v26];
    overlayCoefficentsNonBlurred = self->_overlayCoefficentsNonBlurred;
    self->_overlayCoefficentsNonBlurred = v18;

    v20 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v26];
    overlayCoefficentsNonBlurredBG = self->_overlayCoefficentsNonBlurredBG;
    self->_overlayCoefficentsNonBlurredBG = v20;

    if (self->_usingSmoothing)
    {
      v22 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v26];
      smoothedCoefficientsTextureFG = self->_smoothedCoefficientsTextureFG;
      self->_smoothedCoefficientsTextureFG = v22;

      uint64_t v24 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v26];
      smoothedCoefficientsTextureBG = self->_smoothedCoefficientsTextureBG;
      self->_smoothedCoefficientsTextureBG = v24;
    }
  }
}

- (void)encodeDualCoefficients:(id)a3 guide:(id)a4 stencil:(id)a5 coefficientsTextureFG:(id)a6 coefficientsTextureBG:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v45 = a6;
  id v44 = a7;
  id v14 = a5;
  -[ARDualGuidedFilter setupBuffersWithWidth:andHeight:](self, "setupBuffersWithWidth:andHeight:", [v13 width], objc_msgSend(v13, "height"));
  unsigned int v15 = v12;
  unsigned int v16 = [v12 computeCommandEncoder];
  v60[0] = self->_erodeRadius;
  unsigned int v17 = [v13 width];
  unsigned int v18 = [v13 height];
  [v16 setComputePipelineState:self->_erodeVPSO];
  [v16 setTexture:v14 atIndex:0];
  [v16 setTexture:self->_erodeIntermediate atIndex:1];
  [v16 setBytes:v60 length:4 atIndex:0];
  unint64_t v19 = [(MTLComputePipelineState *)self->_erodeVPSO threadExecutionWidth];
  unint64_t v20 = [(MTLComputePipelineState *)self->_erodeVPSO maxTotalThreadsPerThreadgroup];
  unint64_t v21 = v20 / [(MTLComputePipelineState *)self->_erodeVPSO threadExecutionWidth];
  uint64_t v42 = v17;
  uint64_t v41 = v17 - 1;
  uint64_t v43 = v18;
  uint64_t v40 = v18 - 1;
  unint64_t v57 = (v41 + v19) / v19;
  unint64_t v58 = (v40 + v21) / v21;
  uint64_t v59 = 1;
  unint64_t v54 = v19;
  unint64_t v55 = v21;
  uint64_t v56 = 1;
  [v16 dispatchThreadgroups:&v57 threadsPerThreadgroup:&v54];
  [v16 setComputePipelineState:self->_erodeHPSO];
  [v16 setTexture:self->_erodeIntermediate atIndex:0];
  [v16 setTexture:self->_overlayStencilDownsampled atIndex:1];
  [v16 setBytes:v60 length:4 atIndex:0];
  unint64_t v57 = (v41 + v19) / v19;
  unint64_t v58 = (v40 + v21) / v21;
  uint64_t v59 = 1;
  unint64_t v54 = v19;
  unint64_t v55 = v21;
  uint64_t v56 = 1;
  [v16 dispatchThreadgroups:&v57 threadsPerThreadgroup:&v54];
  [v16 endEncoding];
  v22 = [v15 computeCommandEncoder];

  [v22 setComputePipelineState:self->_invertPSO];
  [v22 setTexture:v14 atIndex:0];

  p_overlayStencilDownsampledBG = &self->_overlayStencilDownsampledBG;
  [v22 setTexture:self->_overlayStencilDownsampledBG atIndex:1];
  unint64_t v57 = (v41 + v19) / v19;
  unint64_t v58 = (v40 + v21) / v21;
  uint64_t v59 = 1;
  unint64_t v54 = v19;
  unint64_t v55 = v21;
  uint64_t v56 = 1;
  [v22 dispatchThreadgroups:&v57 threadsPerThreadgroup:&v54];
  [v22 endEncoding];
  v46 = v15;
  uint64_t v24 = [v15 computeCommandEncoder];

  [v24 setComputePipelineState:self->_erodeVPSO];
  [v24 setTexture:self->_overlayStencilDownsampledBG atIndex:0];
  [v24 setTexture:self->_erodeIntermediate atIndex:1];
  [v24 setBytes:v60 length:4 atIndex:0];
  unint64_t v57 = (v41 + v19) / v19;
  unint64_t v58 = (v40 + v21) / v21;
  uint64_t v59 = 1;
  unint64_t v54 = v19;
  unint64_t v55 = v21;
  uint64_t v56 = 1;
  [v24 dispatchThreadgroups:&v57 threadsPerThreadgroup:&v54];
  [v24 setComputePipelineState:self->_erodeHPSO];
  [v24 setTexture:self->_erodeIntermediate atIndex:0];
  [v24 setTexture:self->_overlayStencilDownsampledBG atIndex:1];
  [v24 setBytes:v60 length:4 atIndex:0];
  unint64_t v57 = (v41 + v19) / v19;
  unint64_t v58 = (v40 + v21) / v21;
  uint64_t v59 = 1;
  unint64_t v54 = v19;
  unint64_t v55 = v21;
  uint64_t v56 = 1;
  [v24 dispatchThreadgroups:&v57 threadsPerThreadgroup:&v54];
  [v24 endEncoding];
  if (self->_useSoftGuidedFilter)
  {
    id v25 = [v46 computeCommandEncoder];

    [v25 setComputePipelineState:self->_getConfidence];
    [v25 setTexture:self->_overlayStencilDownsampled atIndex:0];
    [v25 setTexture:self->_overlayStencilDownsampledBG atIndex:1];
    p_overlayStencilDownsampledBG = &self->_confidenceMap;
    [v25 setTexture:self->_confidenceMap atIndex:2];
    unint64_t v57 = (v41 + v19) / v19;
    unint64_t v58 = (v40 + v21) / v21;
    uint64_t v59 = 1;
    unint64_t v54 = v19;
    unint64_t v55 = v21;
    uint64_t v56 = 1;
    [v25 dispatchThreadgroups:&v57 threadsPerThreadgroup:&v54];
    [v25 setComputePipelineState:self->_combineFGBGStencil];
    [v25 setTexture:self->_overlayStencilDownsampled atIndex:0];
    [v25 setTexture:self->_overlayStencilDownsampledBG atIndex:1];
    [v25 setTexture:self->_combinedFGBG atIndex:2];
    unint64_t v57 = (v41 + v19) / v19;
    unint64_t v58 = (v40 + v21) / v21;
    id v26 = v46;
    uint64_t v59 = 1;
    unint64_t v54 = v19;
    unint64_t v55 = v21;
    uint64_t v56 = 1;
    [v25 dispatchThreadgroups:&v57 threadsPerThreadgroup:&v54];
    [v25 endEncoding];
    [(MPSImageGuidedFilter *)self->_guidedFilter encodeRegressionToCommandBuffer:v46 sourceTexture:self->_combinedFGBG guidanceTexture:v13 weightsTexture:0 destinationCoefficientsTexture:self->_overlayCoefficentsNonBlurred];
    uint64_t v24 = v25;
  }
  else
  {
    id v26 = v46;
    [(MPSImageGuidedFilter *)self->_guidedFilter encodeRegressionToCommandBuffer:v46 sourceTexture:self->_overlayStencilDownsampled guidanceTexture:v13 weightsTexture:0 destinationCoefficientsTexture:self->_overlayCoefficentsNonBlurred];
  }
  uint64_t v27 = v45;
  id v28 = [(ARDualGuidedFilter *)self encodeBoxBlurToCommandBuffer:v26 input:self->_overlayCoefficentsNonBlurred intermediate:self->_blurIntermediate output:v45];
  [(MPSImageGuidedFilter *)self->_guidedFilter encodeRegressionToCommandBuffer:v26 sourceTexture:*p_overlayStencilDownsampledBG guidanceTexture:v13 weightsTexture:0 destinationCoefficientsTexture:self->_overlayCoefficentsNonBlurred];
  v29 = v44;
  id v30 = [(ARDualGuidedFilter *)self encodeBoxBlurToCommandBuffer:v26 input:self->_overlayCoefficentsNonBlurred intermediate:self->_blurIntermediate output:v44];
  if (self->_usingSmoothing)
  {
    int v53 = 1045220557;
    int64x2_t v31 = [v26 computeCommandEncoder];
    [v31 setComputePipelineState:self->_smoothCoeficients];
    [v31 setTexture:v45 atIndex:0];
    [v31 setTexture:self->_smoothedCoefficientsTextureFG atIndex:1];
    [v31 setBytes:&v53 length:4 atIndex:0];
    unint64_t v32 = [(MTLComputePipelineState *)self->_erodeVPSO threadExecutionWidth];
    unint64_t v33 = [(MTLComputePipelineState *)self->_erodeVPSO maxTotalThreadsPerThreadgroup];
    unint64_t v34 = v33 / [(MTLComputePipelineState *)self->_erodeVPSO threadExecutionWidth];
    unint64_t v57 = (v41 + v32) / v32;
    unint64_t v58 = (v40 + v34) / v34;
    uint64_t v59 = 1;
    unint64_t v54 = v32;
    unint64_t v55 = v34;
    uint64_t v56 = 1;
    [v31 dispatchThreadgroups:&v57 threadsPerThreadgroup:&v54];
    [v31 endEncoding];
    unint64_t v35 = [v46 blitCommandEncoder];
    smoothedCoefficientsTextureFG = self->_smoothedCoefficientsTextureFG;
    memset(v52, 0, sizeof(v52));
    v51[0] = v42;
    v51[1] = v43;
    v51[2] = 1;
    memset(v50, 0, sizeof(v50));
    [v35 copyFromTexture:smoothedCoefficientsTextureFG sourceSlice:0 sourceLevel:0 sourceOrigin:v52 sourceSize:v51 toTexture:v45 destinationSlice:0 destinationLevel:0 destinationOrigin:v50];
    [v35 endEncoding];
    v37 = [v46 computeCommandEncoder];

    v29 = v44;
    [v37 setComputePipelineState:self->_smoothCoeficients];
    [v37 setTexture:v44 atIndex:0];
    [v37 setTexture:self->_smoothedCoefficientsTextureBG atIndex:1];
    [v37 setBytes:&v53 length:4 atIndex:0];
    unint64_t v57 = (v41 + v32) / v32;
    unint64_t v58 = (v40 + v34) / v34;
    id v26 = v46;
    uint64_t v59 = 1;
    unint64_t v54 = v32;
    unint64_t v55 = v34;
    uint64_t v56 = 1;
    [v37 dispatchThreadgroups:&v57 threadsPerThreadgroup:&v54];
    [v37 endEncoding];
    float32x2_t v38 = [v46 blitCommandEncoder];

    smoothedCoefficientsTextureBG = self->_smoothedCoefficientsTextureBG;
    v48[2] = 1;
    memset(v49, 0, sizeof(v49));
    v48[0] = v42;
    v48[1] = v43;
    memset(v47, 0, sizeof(v47));
    [v38 copyFromTexture:smoothedCoefficientsTextureBG sourceSlice:0 sourceLevel:0 sourceOrigin:v49 sourceSize:v48 toTexture:v44 destinationSlice:0 destinationLevel:0 destinationOrigin:v47];
    [v38 endEncoding];

    uint64_t v27 = v45;
  }
}

- (unint64_t)uncertaintyRadius
{
  return self->_uncertaintyRadius;
}

- (unint64_t)erosionRadius
{
  return self->_erodeRadius;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedFGBG, 0);
  objc_storeStrong((id *)&self->_confidenceMap, 0);
  objc_storeStrong((id *)&self->_blurIntermediate, 0);
  objc_storeStrong((id *)&self->_erodeIntermediate, 0);
  objc_storeStrong((id *)&self->_smoothedCoefficientsTextureBG, 0);
  objc_storeStrong((id *)&self->_smoothedCoefficientsTextureFG, 0);
  objc_storeStrong((id *)&self->_overlayStencilDownsampledBG, 0);
  objc_storeStrong((id *)&self->_overlayStencilDownsampled, 0);
  objc_storeStrong((id *)&self->_overlayCoefficentsNonBlurred, 0);
  objc_storeStrong((id *)&self->_overlayCoefficentsNonBlurredBG, 0);
  objc_storeStrong((id *)&self->_combineFGBGStencil, 0);
  objc_storeStrong((id *)&self->_getConfidence, 0);
  objc_storeStrong((id *)&self->_smoothCoeficients, 0);
  objc_storeStrong((id *)&self->_invertPSO, 0);
  objc_storeStrong((id *)&self->_erodeHPSO, 0);
  objc_storeStrong((id *)&self->_erodeVPSO, 0);
  objc_storeStrong((id *)&self->_boxblurHPSO, 0);
  objc_storeStrong((id *)&self->_boxblurVPSO, 0);
  objc_storeStrong((id *)&self->_mattingLibrary, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end