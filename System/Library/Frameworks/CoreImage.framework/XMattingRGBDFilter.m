@interface XMattingRGBDFilter
- ($53C07DD1BF241965B24C8E9E4ED7E53D)config;
- (BOOL)coefficientsComputed;
- (BOOL)stateComputed;
- (XMattingBoxTensorFilter)boxTensorFilter;
- (XMattingRGBDFilter)initWithDevice:(id)a3 library:(id)a4;
- (int)_compileShadersWithLibrary:(id)a3;
- (int)allocateResources:(id *)a3;
- (int)encodeApplyCoefficientsOn:(id)a3 colorGuide:(id)a4 disparityGuide:(id)a5 constraints:(id)a6 destinationAlphaTexture:(id)a7;
- (int)encodeCoefficientsOn:(id)a3 guideStack:(id)a4 alphaStack:(id)a5 mean_I:(id)a6 var_I:(id)a7 coefficients:(id)a8;
- (int)encodeDisparityToAlphaOn:(id)a3 disparityTexture:(id)a4 destinationTexture:(id)a5;
- (int)encodeNearestNeighborDownSamplingOn:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5;
- (int)encodeStateOn:(id)a3 colorGuide:(id)a4 disparityGuide:(id)a5 initialSegmentation:(id)a6 constraints:(id)a7;
- (int)encodeStepOn:(id)a3;
- (int)encodeUpsampleOn:(id)a3 segmentation:(id)a4 colorGuide:(id)a5 disparityGuide:(id)a6 outputMatte:(id)a7;
- (void)dealloc;
- (void)encodePushOn:(id)a3 textureArray:(id)a4 texture:(id)a5;
- (void)releaseResources;
- (void)setBoxTensorFilter:(id)a3;
- (void)setConfig:(id *)a3;
@end

@implementation XMattingRGBDFilter

- (XMattingRGBDFilter)initWithDevice:(id)a3 library:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)XMattingRGBDFilter;
  v9 = [(XMattingRGBDFilter *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_library, a4);
    *(_WORD *)&v10->stateComputed = 0;
    if (v7) {
      BOOL v11 = (unint64_t)[v7 readWriteTextureSupport] > 1;
    }
    else {
      BOOL v11 = 0;
    }
    v10->_supportsReadWriteTextures = v11;
  }

  return v10;
}

- (int)allocateResources:(id *)a3
{
  v67[3] = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->config.temporalRadius = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->config.internalWidth = v4;
  if ([(XMattingRGBDFilter *)self _compileShadersWithLibrary:self->_library]
    || (v5 = [[XMattingBoxTensorFilter alloc] initWithDevice:self->_device library:self->_library], boxTensorFilter = self->boxTensorFilter, self->boxTensorFilter = v5, boxTensorFilter, (id v7 = self->boxTensorFilter) == 0)|| [(XMattingBoxTensorFilter *)v7 allocateResources:*(void *)&self->config.spatialRadius])
  {
    BOOL v11 = 0;
    v9 = 0;
LABEL_27:
    [(XMattingRGBDFilter *)self releaseResources];
    int v63 = -12786;
    goto LABEL_28;
  }
  id v8 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:115 width:self->config.internalWidth height:self->config.internalHeight mipmapped:0];
  v9 = v8;
  if (!v8)
  {
    BOOL v11 = 0;
    goto LABEL_27;
  }
  [v8 setTextureType:3];
  [v9 setArrayLength:self->config.arrayLength];
  [v9 setUsage:19];
  v10 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:25 width:self->config.internalWidth height:self->config.internalHeight mipmapped:0];
  BOOL v11 = v10;
  if (!v10) {
    goto LABEL_27;
  }
  [v10 setTextureType:3];
  [v11 setArrayLength:self->config.arrayLength];
  [v11 setUsage:19];
  v12 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  guideStack = self->_guideStack;
  self->_guideStack = v12;

  v14 = self->_guideStack;
  if (!v14) {
    goto LABEL_27;
  }
  v15 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v14, "newTextureViewWithPixelFormat:textureType:levels:slices:", [(MTLTexture *)self->_guideStack pixelFormat], 2, 0, 1, 0, 1);
  guideStackTexture2DView = self->_guideStackTexture2DView;
  self->_guideStackTexture2DView = v15;

  if (!self->_guideStackTexture2DView) {
    goto LABEL_27;
  }
  v17 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v11];
  alphaStack = self->_alphaStack;
  self->_alphaStack = v17;

  v19 = self->_alphaStack;
  if (!v19) {
    goto LABEL_27;
  }
  v20 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v19, "newTextureViewWithPixelFormat:textureType:levels:slices:", [(MTLTexture *)self->_alphaStack pixelFormat], 2, 0, 1, 0, 1);
  alphaStackTexture2DView = self->_alphaStackTexture2DView;
  self->_alphaStackTexture2DView = v20;

  if (!self->_alphaStackTexture2DView) {
    goto LABEL_27;
  }
  v22 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  mean_I = self->_mean_I;
  self->_mean_I = v22;

  if (!self->_mean_I) {
    goto LABEL_27;
  }
  v24 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v11];
  mean_alpha = self->_mean_alpha;
  self->_mean_alpha = v24;

  if (!self->_mean_alpha) {
    goto LABEL_27;
  }
  v26 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  v67[0] = v26;
  v27 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  v67[1] = v27;
  v28 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  v67[2] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];
  var_I = self->_var_I;
  self->_var_I = v29;

  uint64_t v31 = [(NSArray *)self->_var_I objectAtIndexedSubscript:0];
  if (!v31) {
    goto LABEL_27;
  }
  v32 = (void *)v31;
  uint64_t v33 = [(NSArray *)self->_var_I objectAtIndexedSubscript:1];
  if (!v33)
  {

    goto LABEL_27;
  }
  v34 = (void *)v33;
  v35 = [(NSArray *)self->_var_I objectAtIndexedSubscript:2];

  if (!v35) {
    goto LABEL_27;
  }
  v36 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  v66[0] = v36;
  v37 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  v66[1] = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  coefficients = self->_coefficients;
  self->_coefficients = v38;

  uint64_t v40 = [(NSArray *)self->_coefficients objectAtIndexedSubscript:0];
  if (!v40) {
    goto LABEL_27;
  }
  v41 = (void *)v40;
  v42 = [(NSArray *)self->_coefficients objectAtIndexedSubscript:1];

  if (!v42) {
    goto LABEL_27;
  }
  v43 = [(NSArray *)self->_coefficients objectAtIndexedSubscript:0];
  v44 = [(NSArray *)self->_coefficients objectAtIndexedSubscript:0];
  v45 = objc_msgSend(v43, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v44, "pixelFormat"), 2, 0, 1, 0, 1);
  v46 = -[NSArray objectAtIndexedSubscript:](self->_coefficients, "objectAtIndexedSubscript:", 1, v45);
  v47 = [(NSArray *)self->_coefficients objectAtIndexedSubscript:1];
  v48 = objc_msgSend(v46, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v47, "pixelFormat"), 2, 0, 1, 0, 1);
  v65[1] = v48;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
  coefficientsTexture2DView = self->_coefficientsTexture2DView;
  self->_coefficientsTexture2DView = v49;

  uint64_t v51 = [(NSArray *)self->_coefficientsTexture2DView objectAtIndexedSubscript:0];
  if (!v51) {
    goto LABEL_27;
  }
  v52 = (void *)v51;
  v53 = [(NSArray *)self->_coefficientsTexture2DView objectAtIndexedSubscript:1];

  if (!v53) {
    goto LABEL_27;
  }
  v54 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v11];
  constraints = self->_constraints;
  self->_constraints = v54;

  v56 = self->_constraints;
  if (!v56) {
    goto LABEL_27;
  }
  v57 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v56, "newTextureViewWithPixelFormat:textureType:levels:slices:", [(MTLTexture *)self->_constraints pixelFormat], 2, 0, 1, 0, 1);
  constraintsTexture2DView = self->_constraintsTexture2DView;
  self->_constraintsTexture2DView = v57;

  if (!self->_constraintsTexture2DView) {
    goto LABEL_27;
  }
  if (!self->_supportsReadWriteTextures)
  {
    v59 = (void *)[v9 copy];
    [v59 setTextureType:2];
    [v59 setArrayLength:1];
    v60 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v59];
    tmp_RGBA = self->_tmp_RGBA;
    self->_tmp_RGBA = v60;

    v62 = self->_constraintsTexture2DView;
    if (!v62) {
      goto LABEL_27;
    }
  }
  int v63 = 0;
LABEL_28:

  return v63;
}

- (void)releaseResources
{
  boxTensorFilter = self->boxTensorFilter;
  self->boxTensorFilter = 0;

  guideStack = self->_guideStack;
  self->_guideStack = 0;

  guideStackTexture2DView = self->_guideStackTexture2DView;
  self->_guideStackTexture2DView = 0;

  alphaStack = self->_alphaStack;
  self->_alphaStack = 0;

  alphaStackTexture2DView = self->_alphaStackTexture2DView;
  self->_alphaStackTexture2DView = 0;

  mean_I = self->_mean_I;
  self->_mean_I = 0;

  mean_alpha = self->_mean_alpha;
  self->_mean_alpha = 0;

  var_I = self->_var_I;
  self->_var_I = 0;

  coefficients = self->_coefficients;
  self->_coefficients = 0;

  coefficientsTexture2DView = self->_coefficientsTexture2DView;
  self->_coefficientsTexture2DView = 0;

  constraints = self->_constraints;
  self->_constraints = 0;

  constraintsTexture2DView = self->_constraintsTexture2DView;
  self->_constraintsTexture2DView = 0;

  tmp_RGBA = self->_tmp_RGBA;
  self->_tmp_RGBA = 0;

  nearestNeighborDownsamplingKernel = self->_nearestNeighborDownsamplingKernel;
  self->_nearestNeighborDownsamplingKernel = 0;

  halfToAlphaBLKernel = self->_halfToAlphaBLKernel;
  self->_halfToAlphaBLKernel = 0;

  computeInverted4DGuideCovarianceMatrixKernel = self->_computeInverted4DGuideCovarianceMatrixKernel;
  self->_computeInverted4DGuideCovarianceMatrixKernel = 0;

  compute4DCoefficientsKernel = self->_compute4DCoefficientsKernel;
  self->_compute4DCoefficientsKernel = 0;

  applyDepthAwareCoefficientsKernel = self->_applyDepthAwareCoefficientsKernel;
  self->_applyDepthAwareCoefficientsKernel = 0;

  applyDepthAwareCoefficientsNoConstraintsKernel = self->_applyDepthAwareCoefficientsNoConstraintsKernel;
  self->_applyDepthAwareCoefficientsNoConstraintsKernel = 0;

  applyDepthAwareCoefficientsSamplingKernel = self->_applyDepthAwareCoefficientsSamplingKernel;
  self->_applyDepthAwareCoefficientsSamplingKernel = 0;

  applyDepthAwareCoefficientsSamplingNoConstraintsKernel = self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel;
  self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel = 0;
}

- (void)dealloc
{
  [(XMattingRGBDFilter *)self releaseResources];
  v3.receiver = self;
  v3.super_class = (Class)XMattingRGBDFilter;
  [(XMattingRGBDFilter *)&v3 dealloc];
}

- (int)_compileShadersWithLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:@"nearestNeighborDownsampling"];
  v6 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  nearestNeighborDownsamplingKernel = self->_nearestNeighborDownsamplingKernel;
  self->_nearestNeighborDownsamplingKernel = v6;

  if (!self->_nearestNeighborDownsamplingKernel) {
    goto LABEL_15;
  }
  if (self->_supportsReadWriteTextures) {
    id v8 = @"halfToAlphaBL_RWS";
  }
  else {
    id v8 = @"halfToAlphaBL";
  }
  v9 = (void *)[v4 newFunctionWithName:v8];

  v10 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v9 error:0];
  halfToAlphaBLKernel = self->_halfToAlphaBLKernel;
  self->_halfToAlphaBLKernel = v10;

  if (!self->_halfToAlphaBLKernel) {
    goto LABEL_16;
  }
  v5 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:@"computeInverted4DGuideCovarianceMatrix"];

  v12 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  computeInverted4DGuideCovarianceMatrixKernel = self->_computeInverted4DGuideCovarianceMatrixKernel;
  self->_computeInverted4DGuideCovarianceMatrixKernel = v12;

  if (!self->_computeInverted4DGuideCovarianceMatrixKernel) {
    goto LABEL_15;
  }
  v9 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:@"compute4DCoefficients"];

  v14 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v9 error:0];
  compute4DCoefficientsKernel = self->_compute4DCoefficientsKernel;
  self->_compute4DCoefficientsKernel = v14;

  if (!self->_compute4DCoefficientsKernel)
  {
LABEL_16:
    int v24 = -12786;
    goto LABEL_13;
  }
  v5 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:@"applyDepthAwareCoefficients"];

  v16 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  applyDepthAwareCoefficientsKernel = self->_applyDepthAwareCoefficientsKernel;
  self->_applyDepthAwareCoefficientsKernel = v16;

  if (!self->_applyDepthAwareCoefficientsKernel)
  {
LABEL_15:
    int v24 = -12786;
    goto LABEL_14;
  }
  v9 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:@"applyDepthAwareCoefficientsNoConstraints"];

  v18 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v9 error:0];
  applyDepthAwareCoefficientsNoConstraintsKernel = self->_applyDepthAwareCoefficientsNoConstraintsKernel;
  self->_applyDepthAwareCoefficientsNoConstraintsKernel = v18;

  if (!self->_applyDepthAwareCoefficientsNoConstraintsKernel) {
    goto LABEL_16;
  }
  v5 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:@"applyDepthAwareCoefficientsSampling"];

  v20 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  applyDepthAwareCoefficientsSamplingKernel = self->_applyDepthAwareCoefficientsSamplingKernel;
  self->_applyDepthAwareCoefficientsSamplingKernel = v20;

  if (!self->_applyDepthAwareCoefficientsSamplingKernel) {
    goto LABEL_15;
  }
  v9 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:@"applyDepthAwareCoefficientsSamplingNoConstraints"];

  v22 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v9 error:0];
  applyDepthAwareCoefficientsSamplingNoConstraintsKernel = self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel;
  self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel = v22;

  if (!self->_applyDepthAwareCoefficientsSamplingKernel) {
    goto LABEL_16;
  }
  int v24 = 0;
LABEL_13:
  v5 = v9;
LABEL_14:

  return v24;
}

- (void)encodePushOn:(id)a3 textureArray:(id)a4 texture:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 blitCommandEncoder];
  uint64_t v10 = [v7 width];
  uint64_t v11 = [v7 height];
  uint64_t v12 = [v7 depth];
  if ((unint64_t)[v7 arrayLength] >= 2)
  {
    unint64_t v13 = 1;
    do
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v18 = v10;
      uint64_t v19 = v11;
      uint64_t v20 = v12;
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      [v9 copyFromTexture:v7 sourceSlice:v13 sourceLevel:0 sourceOrigin:&v21 sourceSize:&v18 toTexture:v7 destinationSlice:v13 - 1 destinationLevel:0 destinationOrigin:&v15];
      ++v13;
    }
    while (v13 < [v7 arrayLength]);
  }
  uint64_t v14 = [v7 arrayLength];
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v18 = v10;
  uint64_t v19 = v11;
  uint64_t v20 = v12;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  [v9 copyFromTexture:v8 sourceSlice:0 sourceLevel:0 sourceOrigin:&v21 sourceSize:&v18 toTexture:v7 destinationSlice:v14 - 1 destinationLevel:0 destinationOrigin:&v15];
  [v9 endEncoding];
}

- (int)encodeDisparityToAlphaOn:(id)a3 disparityTexture:(id)a4 destinationTexture:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_supportsReadWriteTextures)
  {
    uint64_t v11 = [v8 blitCommandEncoder];
    [v11 copyFromTexture:v10 toTexture:self->_tmp_RGBA];
    [v11 endEncoding];
  }
  uint64_t v12 = [v8 computeCommandEncoder];
  unint64_t v13 = v12;
  if (v12)
  {
    [v12 setLabel:@"encodeDisparityToAlphaOn"];
    uint64_t v14 = [v9 pixelFormat];
    if (v14 == 25 || v14 == 10)
    {
      [v13 setComputePipelineState:self->_halfToAlphaBLKernel];
      [v13 setTexture:v9 atIndex:0];
      if (self->_supportsReadWriteTextures)
      {
        uint64_t v15 = 1;
      }
      else
      {
        [v13 setTexture:self->_tmp_RGBA atIndex:1];
        uint64_t v15 = 2;
      }
      [v13 setTexture:v10 atIndex:v15];
      int v17 = [(MTLComputePipelineState *)self->_halfToAlphaBLKernel threadExecutionWidth];
      int v18 = (int)[(MTLComputePipelineState *)self->_halfToAlphaBLKernel maxTotalThreadsPerThreadgroup]/ v17;
      v21[0] = (int)(v17 + [v10 width] - 1) / v17;
      v21[1] = (int)(v18 + [v10 height] - 1) / v18;
      v21[2] = 1;
      v20[0] = v17;
      v20[1] = v18;
      v20[2] = 1;
      [v13 dispatchThreadgroups:v21 threadsPerThreadgroup:v20];
      [v13 endEncoding];
      int v16 = 0;
    }
    else
    {
      int v16 = -12780;
    }
  }
  else
  {
    int v16 = -1;
  }

  return v16;
}

- (int)encodeNearestNeighborDownSamplingOn:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 computeCommandEncoder];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 setLabel:@"nearestNeighborDownsamplingKernel"];
    [v11 setComputePipelineState:self->_nearestNeighborDownsamplingKernel];
    [v11 setTexture:v8 atIndex:0];
    [v11 setTexture:v9 atIndex:1];
    int v12 = [(MTLComputePipelineState *)self->_nearestNeighborDownsamplingKernel threadExecutionWidth];
    int v13 = (int)[(MTLComputePipelineState *)self->_nearestNeighborDownsamplingKernel maxTotalThreadsPerThreadgroup]/ v12;
    v17[0] = (int)(v12 + [v9 width] - 1) / v12;
    v17[1] = (int)(v13 + [v9 height] - 1) / v13;
    v17[2] = 1;
    v16[0] = v12;
    v16[1] = v13;
    v16[2] = 1;
    [v11 dispatchThreadgroups:v17 threadsPerThreadgroup:v16];
    [v11 endEncoding];
    int v14 = 0;
  }
  else
  {
    int v14 = -1;
  }

  return v14;
}

- (int)encodeCoefficientsOn:(id)a3 guideStack:(id)a4 alphaStack:(id)a5 mean_I:(id)a6 var_I:(id)a7 coefficients:(id)a8
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = [v15 width];
  if (v20 != [v16 width]
    || (uint64_t v21 = [v15 height], v21 != objc_msgSend(v16, "height"))
    || (uint64_t v22 = [v15 arrayLength], v22 != objc_msgSend(v16, "arrayLength"))
    || (uint64_t v23 = [v15 width], v23 != objc_msgSend(v17, "width"))
    || (uint64_t v24 = [v15 height], v24 != objc_msgSend(v17, "height"))
    || (uint64_t v25 = [v15 arrayLength], v25 != objc_msgSend(v17, "arrayLength"))
    || [v18 count] != 3)
  {
    int v58 = -12780;
    goto LABEL_44;
  }
  id v62 = v16;
  int v63 = v19;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v61 = v18;
  id v26 = v18;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v75;
    while (2)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v75 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        uint64_t v32 = [v31 width];
        if (v32 == [v15 width])
        {
          uint64_t v33 = [v31 height];
          if (v33 == [v15 height])
          {
            uint64_t v34 = [v31 arrayLength];
            if (v34 == [v15 arrayLength]) {
              continue;
            }
          }
        }
        int v58 = -12780;
        v46 = v26;
        id v16 = v62;
        goto LABEL_42;
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v74 objects:v80 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }

  id v19 = v63;
  if ([v63 count] != 2)
  {
    int v58 = -12780;
    id v18 = v61;
    id v16 = v62;
    goto LABEL_44;
  }
  id v60 = v17;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v35 = v63;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v71;
    while (2)
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v71 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void **)(*((void *)&v70 + 1) + 8 * j);
        uint64_t v41 = objc_msgSend(v40, "width", v60);
        if (v41 == [v15 width])
        {
          uint64_t v42 = [v40 height];
          if (v42 == [v15 height])
          {
            uint64_t v43 = [v40 arrayLength];
            if (v43 == [v15 arrayLength]) {
              continue;
            }
          }
        }
        int v58 = -12780;
        v46 = v35;
        goto LABEL_41;
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v70 objects:v79 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }

  int v44 = [(XMattingBoxTensorFilter *)self->boxTensorFilter encodeOnCommandBuffer:v14 sourceTexture:self->_alphaStack destinationTexture:self->_mean_alpha];
  if (v44)
  {
    int v58 = v44;
    id v16 = v62;
    id v17 = v60;
  }
  else
  {
    v45 = [v14 computeCommandEncoder];
    id v16 = v62;
    id v17 = v60;
    if (v45)
    {
      v46 = v45;
      [v45 setLabel:@"compute4DCoefficientsKernel"];
      [v46 setComputePipelineState:self->_compute4DCoefficientsKernel];
      [v46 setTexture:v15 atIndex:0];
      [v46 setTexture:v62 atIndex:1];
      [v46 setTexture:v60 atIndex:2];
      [v46 setTexture:self->_mean_alpha atIndex:3];
      v47 = [v26 objectAtIndexedSubscript:0];
      [v46 setTexture:v47 atIndex:4];

      v48 = [v26 objectAtIndexedSubscript:1];
      [v46 setTexture:v48 atIndex:5];

      v49 = [v26 objectAtIndexedSubscript:2];
      [v46 setTexture:v49 atIndex:6];

      v50 = [v35 objectAtIndexedSubscript:0];
      [v46 setTexture:v50 atIndex:7];

      uint64_t v51 = [v35 objectAtIndexedSubscript:1];
      [v46 setTexture:v51 atIndex:8];

      [v46 setBytes:&self->config.spatialRadius length:4 atIndex:0];
      LODWORD(v51) = [(MTLComputePipelineState *)self->_compute4DCoefficientsKernel threadExecutionWidth];
      int v52 = (int)[(MTLComputePipelineState *)self->_compute4DCoefficientsKernel maxTotalThreadsPerThreadgroup]/ (int)v51;
      v69[0] = (int)(v51 + [v15 width] - 1) / (int)v51;
      v69[1] = (int)(v52 + [v15 height] - 1) / v52;
      v69[2] = 1;
      v68[0] = (int)v51;
      v68[1] = v52;
      v68[2] = 1;
      [v46 dispatchThreadgroups:v69 threadsPerThreadgroup:v68];
      [v46 endEncoding];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v53 = v35;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v64 objects:v78 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v65;
        do
        {
          for (uint64_t k = 0; k != v55; ++k)
          {
            if (*(void *)v65 != v56) {
              objc_enumerationMutation(v53);
            }
            -[XMattingBoxTensorFilter encodeOnCommandBuffer:sourceTexture:destinationTexture:](self->boxTensorFilter, "encodeOnCommandBuffer:sourceTexture:destinationTexture:", v14, *(void *)(*((void *)&v64 + 1) + 8 * k), *(void *)(*((void *)&v64 + 1) + 8 * k), v60);
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v64 objects:v78 count:16];
        }
        while (v55);
      }

      int v58 = 0;
LABEL_41:
      id v16 = v62;
      id v17 = v60;
LABEL_42:
      id v18 = v61;

      goto LABEL_43;
    }
    int v58 = -1;
  }
  id v18 = v61;
LABEL_43:
  id v19 = v63;
LABEL_44:

  return v58;
}

- (int)encodeStateOn:(id)a3 colorGuide:(id)a4 disparityGuide:(id)a5 initialSegmentation:(id)a6 constraints:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v43 = v13;
  if ([v13 textureType] == 2
    && [v14 textureType] == 2
    && (!v15 || [v15 textureType] == 2)
    && (!v16 || [v16 textureType] == 2)
    && (uint64_t v17 = [(MTLTexture *)self->_guideStack width], v17 == [(MTLTexture *)self->_mean_I width])
    && (uint64_t v18 = [(MTLTexture *)self->_guideStack height], v18 == [(MTLTexture *)self->_mean_I height])
    && (uint64_t v19 = [(MTLTexture *)self->_guideStack arrayLength],
        v19 == [(MTLTexture *)self->_mean_I arrayLength])
    && [(NSArray *)self->_var_I count] == 3)
  {
    id v42 = v14;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v20 = self->_var_I;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v26 = objc_msgSend(v25, "width", v42);
          if (v26 == [(MTLTexture *)self->_guideStack width])
          {
            uint64_t v27 = [v25 height];
            if (v27 == [(MTLTexture *)self->_guideStack height])
            {
              uint64_t v28 = [v25 arrayLength];
              if (v28 == [(MTLTexture *)self->_guideStack arrayLength]) {
                continue;
              }
            }
          }
          int v39 = -12780;
          id v14 = v42;
          goto LABEL_31;
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    int v29 = [(XMattingRGBDFilter *)self encodeNearestNeighborDownSamplingOn:v12 inputTexture:v43 outputTexture:self->_guideStackTexture2DView];
    if (v29)
    {
      int v39 = v29;
      id v14 = v42;
    }
    else
    {
      id v14 = v42;
      int v30 = [(XMattingRGBDFilter *)self encodeDisparityToAlphaOn:v12 disparityTexture:v42 destinationTexture:self->_guideStackTexture2DView];
      if (v30)
      {
        int v39 = v30;
      }
      else
      {
        [(XMattingBoxTensorFilter *)self->boxTensorFilter encodeOnCommandBuffer:v12 sourceTexture:self->_guideStack destinationTexture:self->_mean_I];
        uint64_t v31 = [v12 computeCommandEncoder];
        if (v31)
        {
          uint64_t v20 = v31;
          [(NSArray *)v31 setLabel:@"computeInverted4DGuideCovarianceMatrixKernel"];
          [(NSArray *)v20 setComputePipelineState:self->_computeInverted4DGuideCovarianceMatrixKernel];
          [(NSArray *)v20 setTexture:self->_guideStack atIndex:0];
          [(NSArray *)v20 setTexture:self->_mean_I atIndex:1];
          uint64_t v32 = [(NSArray *)self->_var_I objectAtIndexedSubscript:0];
          [(NSArray *)v20 setTexture:v32 atIndex:2];

          uint64_t v33 = [(NSArray *)self->_var_I objectAtIndexedSubscript:1];
          [(NSArray *)v20 setTexture:v33 atIndex:3];

          uint64_t v34 = [(NSArray *)self->_var_I objectAtIndexedSubscript:2];
          [(NSArray *)v20 setTexture:v34 atIndex:4];

          [(NSArray *)v20 setBytes:&self->config.epsilon length:4 atIndex:0];
          [(NSArray *)v20 setBytes:&self->config.spatialRadius length:4 atIndex:1];
          LODWORD(v34) = [(MTLComputePipelineState *)self->_computeInverted4DGuideCovarianceMatrixKernel threadExecutionWidth];
          int v35 = (int)[(MTLComputePipelineState *)self->_computeInverted4DGuideCovarianceMatrixKernel maxTotalThreadsPerThreadgroup]/ (int)v34;
          int v36 = (int)(v34 + [(MTLTexture *)self->_guideStack width] - 1) / (int)v34;
          int v37 = [(MTLTexture *)self->_guideStack height];
          v45[0] = v36;
          v45[1] = (v35 + v37 - 1) / v35;
          v45[2] = 1;
          v44[0] = (int)v34;
          v44[1] = v35;
          v44[2] = 1;
          [(NSArray *)v20 dispatchThreadgroups:v45 threadsPerThreadgroup:v44];
          [(NSArray *)v20 endEncoding];
          if (v15) {
            [(XMattingRGBDFilter *)self encodeNearestNeighborDownSamplingOn:v12 inputTexture:v15 outputTexture:self->_alphaStackTexture2DView];
          }
          constraintsTexture2DView = self->_constraintsTexture2DView;
          if (v16)
          {
            [(XMattingRGBDFilter *)self encodeNearestNeighborDownSamplingOn:v12 inputTexture:v16 outputTexture:constraintsTexture2DView];
          }
          else
          {
            self->_constraintsTexture2DView = 0;

            constraints = self->_constraints;
            self->_constraints = 0;
          }
          id v14 = v42;
          int v39 = 0;
          self->stateComputed = 1;
LABEL_31:
        }
        else
        {
          int v39 = -1;
        }
      }
    }
  }
  else
  {
    int v39 = -12780;
  }

  return v39;
}

- (int)encodeStepOn:(id)a3
{
  id v4 = a3;
  int v5 = [(XMattingRGBDFilter *)self encodeCoefficientsOn:v4 guideStack:self->_guideStack alphaStack:self->_alphaStack mean_I:self->_mean_I var_I:self->_var_I coefficients:self->_coefficients];
  if (!v5) {
    int v5 = [(XMattingRGBDFilter *)self encodeApplyCoefficientsOn:v4 colorGuide:self->_guideStackTexture2DView disparityGuide:0 constraints:self->_constraintsTexture2DView destinationAlphaTexture:self->_alphaStackTexture2DView];
  }
  int v6 = v5;

  return v6;
}

- (int)encodeApplyCoefficientsOn:(id)a3 colorGuide:(id)a4 disparityGuide:(id)a5 constraints:(id)a6 destinationAlphaTexture:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = self->_coefficientsTexture2DView;
  if ([v13 textureType] != 2
    || v14 && [v14 textureType] != 2
    || v15 && [v15 textureType] != 2
    || [v16 textureType] != 2)
  {
    int v51 = -12780;
    goto LABEL_29;
  }
  uint64_t v18 = [v13 width];
  if (v18 == [v16 width])
  {
    uint64_t v19 = [v13 height];
    BOOL v20 = v19 != [v16 height];
    if (v14) {
      goto LABEL_9;
    }
LABEL_13:
    BOOL v23 = 0;
    if (!v15) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  BOOL v20 = 1;
  if (!v14) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v21 = [v14 width];
  if (v21 == [v16 width])
  {
    uint64_t v22 = [v14 height];
    BOOL v23 = v22 != [v16 height];
    if (!v15)
    {
LABEL_20:
      if (!v20 && !v23)
      {
        long long v47 = [v12 computeCommandEncoder];
        if (v47)
        {
          uint64_t v28 = v47;
          [v47 setLabel:@"applyDepthAwareCoefficientsNoConstraintsKernel"];
          [v28 setComputePipelineState:self->_applyDepthAwareCoefficientsNoConstraintsKernel];
          long long v48 = [(NSArray *)v17 objectAtIndexedSubscript:0];
          [v28 setTexture:v48 atIndex:0];

          long long v49 = [(NSArray *)v17 objectAtIndexedSubscript:1];
          [v28 setTexture:v49 atIndex:1];

          [v28 setTexture:v13 atIndex:2];
          [v28 setTexture:v14 atIndex:3];
          [v28 setTexture:v16 atIndex:4];
          LODWORD(v49) = [(MTLComputePipelineState *)self->_applyDepthAwareCoefficientsNoConstraintsKernel threadExecutionWidth];
          int v50 = (int)[(MTLComputePipelineState *)self->_applyDepthAwareCoefficientsNoConstraintsKernel maxTotalThreadsPerThreadgroup]/ (int)v49;
          v58[0] = (int)(v49 + [v16 width] - 1) / (int)v49;
          v58[1] = (int)(v50 + [v16 height] - 1) / v50;
          v58[2] = 1;
          v57[0] = (int)v49;
          v57[1] = v50;
          v57[2] = 1;
          uint64_t v32 = v58;
          uint64_t v33 = v57;
          goto LABEL_28;
        }
        goto LABEL_31;
      }
LABEL_21:
      uint64_t v34 = [v12 computeCommandEncoder];
      uint64_t v28 = v34;
      if (v15)
      {
        if (v34)
        {
          [v34 setLabel:@"applyDepthAwareCoefficientsSamplingKernel"];
          [v28 setComputePipelineState:self->_applyDepthAwareCoefficientsSamplingKernel];
          int v35 = [(NSArray *)v17 objectAtIndexedSubscript:0];
          [v28 setTexture:v35 atIndex:0];

          int v36 = [(NSArray *)v17 objectAtIndexedSubscript:1];
          [v28 setTexture:v36 atIndex:1];

          [v28 setTexture:v13 atIndex:2];
          [v28 setTexture:v14 atIndex:3];
          [v28 setTexture:v15 atIndex:4];
          [v28 setTexture:v16 atIndex:5];
          [v28 setTexture:v16 atIndex:6];
          LODWORD(v36) = [(MTLComputePipelineState *)self->_applyDepthAwareCoefficientsSamplingKernel threadExecutionWidth];
          int v37 = (int)[(MTLComputePipelineState *)self->_applyDepthAwareCoefficientsSamplingKernel maxTotalThreadsPerThreadgroup]/ (int)v36;
          id v38 = v12;
          int v39 = (int)(v36 + [v16 width] - 1) / (int)v36;
          int v40 = [v16 height];
          uint64_t v41 = v39;
          id v12 = v38;
          v56[0] = v41;
          v56[1] = (v37 + v40 - 1) / v37;
          v56[2] = 1;
          v55[0] = (int)v36;
          v55[1] = v37;
          v55[2] = 1;
          uint64_t v32 = v56;
          uint64_t v33 = v55;
          goto LABEL_28;
        }
      }
      else if (v34)
      {
        [v34 setLabel:@"applyDepthAwareCoefficientsSamplingNoConstraintsKernel"];
        [v28 setComputePipelineState:self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel];
        id v42 = [(NSArray *)v17 objectAtIndexedSubscript:0];
        [v28 setTexture:v42 atIndex:0];

        uint64_t v43 = [(NSArray *)v17 objectAtIndexedSubscript:1];
        [v28 setTexture:v43 atIndex:1];

        [v28 setTexture:v13 atIndex:2];
        [v28 setTexture:v14 atIndex:3];
        [v28 setTexture:v16 atIndex:4];
        LODWORD(v43) = [(MTLComputePipelineState *)self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel threadExecutionWidth];
        id v44 = v12;
        int v45 = (int)[(MTLComputePipelineState *)self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel maxTotalThreadsPerThreadgroup]/ (int)v43;
        v54[0] = (int)(v43 + [v16 width] - 1) / (int)v43;
        v54[1] = (int)(v45 + [v16 height] - 1) / v45;
        v54[2] = 1;
        uint64_t v46 = v45;
        id v12 = v44;
        v53[0] = (int)v43;
        v53[1] = v46;
        v53[2] = 1;
        uint64_t v32 = v54;
        uint64_t v33 = v53;
        goto LABEL_28;
      }
LABEL_31:
      int v51 = -1;
      goto LABEL_29;
    }
  }
  else
  {
    BOOL v23 = 1;
    if (!v15) {
      goto LABEL_20;
    }
  }
LABEL_14:
  uint64_t v24 = [v15 width];
  if (v24 != [v13 width]) {
    goto LABEL_21;
  }
  uint64_t v25 = [v15 height];
  uint64_t v26 = [v13 height];
  if (v20 || v23 || v25 != v26) {
    goto LABEL_21;
  }
  uint64_t v27 = [v12 computeCommandEncoder];
  if (!v27) {
    goto LABEL_31;
  }
  uint64_t v28 = v27;
  [v27 setLabel:@"applyDepthAwareCoefficientsKernel"];
  [v28 setComputePipelineState:self->_applyDepthAwareCoefficientsKernel];
  int v29 = [(NSArray *)v17 objectAtIndexedSubscript:0];
  [v28 setTexture:v29 atIndex:0];

  int v30 = [(NSArray *)v17 objectAtIndexedSubscript:1];
  [v28 setTexture:v30 atIndex:1];

  [v28 setTexture:v13 atIndex:2];
  [v28 setTexture:v14 atIndex:3];
  [v28 setTexture:v15 atIndex:4];
  [v28 setTexture:v16 atIndex:5];
  LODWORD(v30) = [(MTLComputePipelineState *)self->_applyDepthAwareCoefficientsKernel threadExecutionWidth];
  int v31 = (int)[(MTLComputePipelineState *)self->_applyDepthAwareCoefficientsKernel maxTotalThreadsPerThreadgroup]/ (int)v30;
  v60[0] = (int)(v30 + [v16 width] - 1) / (int)v30;
  v60[1] = (int)(v31 + [v16 height] - 1) / v31;
  v60[2] = 1;
  v59[0] = (int)v30;
  v59[1] = v31;
  v59[2] = 1;
  uint64_t v32 = v60;
  uint64_t v33 = v59;
LABEL_28:
  [v28 dispatchThreadgroups:v32 threadsPerThreadgroup:v33];
  [v28 endEncoding];

  int v51 = 0;
LABEL_29:

  return v51;
}

- (int)encodeUpsampleOn:(id)a3 segmentation:(id)a4 colorGuide:(id)a5 disparityGuide:(id)a6 outputMatte:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = [(XMattingRGBDFilter *)self encodeStateOn:v12 colorGuide:v13 disparityGuide:v14 initialSegmentation:a4 constraints:0];
  if (!v16)
  {
    int v16 = [(XMattingRGBDFilter *)self encodeCoefficientsOn:v12 guideStack:self->_guideStack alphaStack:self->_alphaStack mean_I:self->_mean_I var_I:self->_var_I coefficients:self->_coefficients];
    if (!v16) {
      int v16 = [(XMattingRGBDFilter *)self encodeApplyCoefficientsOn:v12 colorGuide:v13 disparityGuide:v14 constraints:0 destinationAlphaTexture:v15];
    }
  }
  int v17 = v16;

  return v17;
}

- (XMattingBoxTensorFilter)boxTensorFilter
{
  return (XMattingBoxTensorFilter *)objc_getProperty(self, a2, 200, 1);
}

- (void)setBoxTensorFilter:(id)a3
{
}

- ($53C07DD1BF241965B24C8E9E4ED7E53D)config
{
  objc_copyStruct(retstr, &self->config, 28, 1, 0);
  return result;
}

- (void)setConfig:(id *)a3
{
}

- (BOOL)stateComputed
{
  return self->stateComputed;
}

- (BOOL)coefficientsComputed
{
  return self->coefficientsComputed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->boxTensorFilter, 0);
  objc_storeStrong((id *)&self->_tmp_RGBA, 0);
  objc_storeStrong((id *)&self->_applyDepthAwareCoefficientsSamplingNoConstraintsKernel, 0);
  objc_storeStrong((id *)&self->_applyDepthAwareCoefficientsSamplingKernel, 0);
  objc_storeStrong((id *)&self->_applyDepthAwareCoefficientsNoConstraintsKernel, 0);
  objc_storeStrong((id *)&self->_applyDepthAwareCoefficientsKernel, 0);
  objc_storeStrong((id *)&self->_compute4DCoefficientsKernel, 0);
  objc_storeStrong((id *)&self->_computeInverted4DGuideCovarianceMatrixKernel, 0);
  objc_storeStrong((id *)&self->_halfToAlphaBLKernel, 0);
  objc_storeStrong((id *)&self->_nearestNeighborDownsamplingKernel, 0);
  objc_storeStrong((id *)&self->_constraintsTexture2DView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_coefficientsTexture2DView, 0);
  objc_storeStrong((id *)&self->_coefficients, 0);
  objc_storeStrong((id *)&self->_var_I, 0);
  objc_storeStrong((id *)&self->_mean_alpha, 0);
  objc_storeStrong((id *)&self->_mean_I, 0);
  objc_storeStrong((id *)&self->_alphaStackTexture2DView, 0);
  objc_storeStrong((id *)&self->_alphaStack, 0);
  objc_storeStrong((id *)&self->_guideStackTexture2DView, 0);
  objc_storeStrong((id *)&self->_guideStack, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end