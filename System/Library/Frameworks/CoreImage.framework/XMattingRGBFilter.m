@interface XMattingRGBFilter
- ($53C07DD1BF241965B24C8E9E4ED7E53D)config;
- (BOOL)coefficientsComputed;
- (BOOL)stateComputed;
- (XMattingBoxTensorFilter)boxTensorFilter;
- (XMattingRGBFilter)initWithDevice:(id)a3 library:(id)a4;
- (int)_compileShadersWithLibrary:(id)a3;
- (int)allocateResources:(id *)a3;
- (int)encodeApplyCoefficientsOn:(id)a3 colorGuide:(id)a4 disparityGuide:(id)a5 constraints:(id)a6 destinationAlphaTexture:(id)a7;
- (int)encodeCoefficientsOn:(id)a3 guideStack:(id)a4 alphaStack:(id)a5 mean_I:(id)a6 var_I:(id)a7 coefficients:(id)a8;
- (int)encodeStateOn:(id)a3 colorGuide:(id)a4 disparityGuide:(id)a5 initialSegmentation:(id)a6 constraints:(id)a7;
- (int)encodeStepOn:(id)a3;
- (int)encodeUpsampleOn:(id)a3 segmentation:(id)a4 colorGuide:(id)a5 disparityGuide:(id)a6 outputMatte:(id)a7;
- (void)dealloc;
- (void)encodeNearestNeighborDownSamplingOn:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5;
- (void)releaseResources;
- (void)setBoxTensorFilter:(id)a3;
- (void)setConfig:(id *)a3;
@end

@implementation XMattingRGBFilter

- (XMattingRGBFilter)initWithDevice:(id)a3 library:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XMattingRGBFilter;
  v9 = [(XMattingRGBFilter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_library, a4);
    *(_WORD *)&v10->stateComputed = 0;
  }

  return v10;
}

- (int)allocateResources:(id *)a3
{
  v45[2] = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->config.temporalRadius = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->config.internalWidth = v4;
  if ([(XMattingRGBFilter *)self _compileShadersWithLibrary:self->_library]
    || (v5 = [[XMattingBoxTensorFilter alloc] initWithDevice:self->_device library:self->_library], boxTensorFilter = self->boxTensorFilter, self->boxTensorFilter = v5, boxTensorFilter, (id v7 = self->boxTensorFilter) == 0)|| [(XMattingBoxTensorFilter *)v7 allocateResources:*(void *)&self->config.spatialRadius])
  {
    v11 = 0;
    v9 = 0;
LABEL_21:
    [(XMattingRGBFilter *)self releaseResources];
    int v43 = -12786;
    goto LABEL_22;
  }
  id v8 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:115 width:self->config.internalWidth height:self->config.internalHeight mipmapped:0];
  v9 = v8;
  if (!v8)
  {
    v11 = 0;
    goto LABEL_21;
  }
  [v8 setTextureType:3];
  [v9 setArrayLength:self->config.arrayLength];
  [v9 setUsage:19];
  v10 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:25 width:self->config.internalWidth height:self->config.internalHeight mipmapped:0];
  v11 = v10;
  if (!v10) {
    goto LABEL_21;
  }
  [v10 setTextureType:3];
  [v11 setArrayLength:self->config.arrayLength];
  [v11 setUsage:19];
  objc_super v12 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  guideStack = self->_guideStack;
  self->_guideStack = v12;

  v14 = self->_guideStack;
  if (!v14) {
    goto LABEL_21;
  }
  v15 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v14, "newTextureViewWithPixelFormat:textureType:levels:slices:", [(MTLTexture *)self->_guideStack pixelFormat], 2, 0, 1, 0, 1);
  guideStackTexture2DView = self->_guideStackTexture2DView;
  self->_guideStackTexture2DView = v15;

  if (!self->_guideStackTexture2DView) {
    goto LABEL_21;
  }
  v17 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v11];
  alphaStack = self->_alphaStack;
  self->_alphaStack = v17;

  v19 = self->_alphaStack;
  if (!v19) {
    goto LABEL_21;
  }
  v20 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v19, "newTextureViewWithPixelFormat:textureType:levels:slices:", [(MTLTexture *)self->_alphaStack pixelFormat], 2, 0, 1, 0, 1);
  alphaStackTexture2DView = self->_alphaStackTexture2DView;
  self->_alphaStackTexture2DView = v20;

  if (!self->_alphaStackTexture2DView) {
    goto LABEL_21;
  }
  v22 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  mean_I = self->_mean_I;
  self->_mean_I = v22;

  if (!self->_mean_I) {
    goto LABEL_21;
  }
  v24 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v11];
  mean_alpha = self->_mean_alpha;
  self->_mean_alpha = v24;

  if (!self->_mean_alpha) {
    goto LABEL_21;
  }
  v26 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  v45[0] = v26;
  v27 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  v45[1] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  var_I = self->_var_I;
  self->_var_I = v28;

  uint64_t v30 = [(NSArray *)self->_var_I objectAtIndexedSubscript:0];
  if (!v30) {
    goto LABEL_21;
  }
  v31 = (void *)v30;
  v32 = [(NSArray *)self->_var_I objectAtIndexedSubscript:1];

  if (!v32) {
    goto LABEL_21;
  }
  v33 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  coefficients = self->_coefficients;
  self->_coefficients = v33;

  v35 = self->_coefficients;
  if (!v35) {
    goto LABEL_21;
  }
  v36 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v35, "newTextureViewWithPixelFormat:textureType:levels:slices:", [(MTLTexture *)self->_coefficients pixelFormat], 2, 0, 1, 0, 1);
  coefficientsTexture2DView = self->_coefficientsTexture2DView;
  self->_coefficientsTexture2DView = v36;

  if (!self->_coefficientsTexture2DView) {
    goto LABEL_21;
  }
  v38 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v11];
  constraints = self->_constraints;
  self->_constraints = v38;

  v40 = self->_constraints;
  if (!v40) {
    goto LABEL_21;
  }
  v41 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:](v40, "newTextureViewWithPixelFormat:textureType:levels:slices:", [(MTLTexture *)self->_constraints pixelFormat], 2, 0, 1, 0, 1);
  constraintsTexture2DView = self->_constraintsTexture2DView;
  self->_constraintsTexture2DView = v41;

  if (!self->_constraintsTexture2DView) {
    goto LABEL_21;
  }
  int v43 = 0;
LABEL_22:

  return v43;
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

  nearestNeighborDownsamplingKernel = self->_nearestNeighborDownsamplingKernel;
  self->_nearestNeighborDownsamplingKernel = 0;

  computeInverted3DGuideCovarianceMatrixKernel = self->_computeInverted3DGuideCovarianceMatrixKernel;
  self->_computeInverted3DGuideCovarianceMatrixKernel = 0;

  compute3DCoefficientsKernel = self->_compute3DCoefficientsKernel;
  self->_compute3DCoefficientsKernel = 0;

  applyCoefficientsKernel = self->_applyCoefficientsKernel;
  self->_applyCoefficientsKernel = 0;

  applyCoefficientsSamplingKernel = self->_applyCoefficientsSamplingKernel;
  self->_applyCoefficientsSamplingKernel = 0;
}

- (void)dealloc
{
  [(XMattingRGBFilter *)self releaseResources];
  v3.receiver = self;
  v3.super_class = (Class)XMattingRGBFilter;
  [(XMattingRGBFilter *)&v3 dealloc];
}

- (int)_compileShadersWithLibrary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 newFunctionWithName:@"nearestNeighborDownsampling"];
  v6 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  nearestNeighborDownsamplingKernel = self->_nearestNeighborDownsamplingKernel;
  self->_nearestNeighborDownsamplingKernel = v6;

  if (!self->_nearestNeighborDownsamplingKernel) {
    goto LABEL_8;
  }
  id v8 = (void *)[v4 newFunctionWithName:@"computeInverted3DGuideCovarianceMatrix"];

  v9 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v8 error:0];
  computeInverted3DGuideCovarianceMatrixKernel = self->_computeInverted3DGuideCovarianceMatrixKernel;
  self->_computeInverted3DGuideCovarianceMatrixKernel = v9;

  if (!self->_computeInverted3DGuideCovarianceMatrixKernel) {
    goto LABEL_9;
  }
  v5 = (void *)[v4 newFunctionWithName:@"compute3DCoefficients"];

  v11 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  compute3DCoefficientsKernel = self->_compute3DCoefficientsKernel;
  self->_compute3DCoefficientsKernel = v11;

  if (!self->_compute3DCoefficientsKernel)
  {
LABEL_8:
    int v17 = -12786;
    goto LABEL_7;
  }
  id v8 = (void *)[v4 newFunctionWithName:@"applyCoefficients"];

  v13 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v8 error:0];
  applyCoefficientsKernel = self->_applyCoefficientsKernel;
  self->_applyCoefficientsKernel = v13;

  if (!self->_applyCoefficientsKernel)
  {
LABEL_9:
    int v17 = -12786;
    v5 = v8;
    goto LABEL_7;
  }
  v5 = (void *)[v4 newFunctionWithName:@"applyCoefficientsSampling"];

  v15 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  applyCoefficientsSamplingKernel = self->_applyCoefficientsSamplingKernel;
  self->_applyCoefficientsSamplingKernel = v15;

  if (!self->_applyCoefficientsSamplingKernel) {
    goto LABEL_8;
  }
  int v17 = 0;
LABEL_7:

  return v17;
}

- (void)encodeNearestNeighborDownSamplingOn:(id)a3 inputTexture:(id)a4 outputTexture:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_nearestNeighborDownsamplingKernel];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  LODWORD(a3) = [(MTLComputePipelineState *)self->_nearestNeighborDownsamplingKernel threadExecutionWidth];
  int v11 = (int)[(MTLComputePipelineState *)self->_nearestNeighborDownsamplingKernel maxTotalThreadsPerThreadgroup]/ (int)a3;
  int v12 = (int)(a3 + [v8 width] - 1) / (int)a3;
  LODWORD(self) = [v8 height];

  v14[0] = v12;
  v14[1] = (v11 + (int)self - 1) / v11;
  v14[2] = 1;
  v13[0] = (int)a3;
  v13[1] = v11;
  v13[2] = 1;
  [v10 dispatchThreadgroups:v14 threadsPerThreadgroup:v13];
  [v10 endEncoding];
}

- (int)encodeCoefficientsOn:(id)a3 guideStack:(id)a4 alphaStack:(id)a5 mean_I:(id)a6 var_I:(id)a7 coefficients:(id)a8
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v47 = v18;
  if (!self->stateComputed)
  {
    int v45 = -12782;
    goto LABEL_33;
  }
  if ([v15 textureType] != 3) {
    goto LABEL_34;
  }
  if ([v16 textureType] != 3) {
    goto LABEL_34;
  }
  if ([v17 textureType] != 3) {
    goto LABEL_34;
  }
  uint64_t v20 = [v15 width];
  if (v20 != [v16 width]) {
    goto LABEL_34;
  }
  uint64_t v21 = [v15 height];
  if (v21 != [v16 height]) {
    goto LABEL_34;
  }
  uint64_t v22 = [v15 arrayLength];
  if (v22 != [v16 arrayLength]) {
    goto LABEL_34;
  }
  uint64_t v23 = [v15 width];
  if (v23 != [v17 width]) {
    goto LABEL_34;
  }
  uint64_t v24 = [v15 height];
  if (v24 != [v17 height]) {
    goto LABEL_34;
  }
  uint64_t v25 = [v15 arrayLength];
  if (v25 != [v17 arrayLength] || objc_msgSend(v18, "count") != 2) {
    goto LABEL_34;
  }
  v48 = v19;
  v49 = v14;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v26 = v18;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v53;
    while (2)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v53 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v32 = [v31 width];
        if (v32 == [v15 width])
        {
          uint64_t v33 = [v31 height];
          if (v33 == [v15 height])
          {
            uint64_t v34 = [v31 arrayLength];
            if (v34 == [v15 arrayLength] && objc_msgSend(v31, "textureType") == 3) {
              continue;
            }
          }
        }
        int v45 = -12780;
        id v19 = v48;
        goto LABEL_31;
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }

  id v19 = v48;
  if ([v48 textureType] == 3)
  {
    uint64_t v35 = [v48 width];
    id v14 = v49;
    if (v35 == [v15 width])
    {
      uint64_t v36 = [v48 height];
      if (v36 == [v15 height])
      {
        uint64_t v37 = [v48 arrayLength];
        if (v37 == [v15 arrayLength])
        {
          int v38 = [(XMattingBoxTensorFilter *)self->boxTensorFilter encodeOnCommandBuffer:v49 sourceTexture:self->_alphaStack destinationTexture:self->_mean_alpha];
          if (v38)
          {
            int v45 = v38;
            goto LABEL_33;
          }
          v39 = [v49 computeCommandEncoder];
          if (!v39)
          {
            int v45 = -1;
            goto LABEL_33;
          }
          v40 = v39;
          [v39 setLabel:@"compute3DCoefficientsKernel"];
          [v40 setComputePipelineState:self->_compute3DCoefficientsKernel];
          [v40 setTexture:v15 atIndex:0];
          [v40 setTexture:v16 atIndex:1];
          [v40 setTexture:v17 atIndex:2];
          [v40 setTexture:self->_mean_alpha atIndex:3];
          v41 = [v26 objectAtIndexedSubscript:0];
          [v40 setTexture:v41 atIndex:4];

          v42 = [v26 objectAtIndexedSubscript:1];
          [v40 setTexture:v42 atIndex:5];

          [v40 setTexture:v48 atIndex:6];
          [v40 setBytes:&self->config.spatialRadius length:4 atIndex:0];
          LODWORD(v42) = [(MTLComputePipelineState *)self->_compute3DCoefficientsKernel threadExecutionWidth];
          int v43 = (int)[(MTLComputePipelineState *)self->_compute3DCoefficientsKernel maxTotalThreadsPerThreadgroup]/ (int)v42;
          v51[0] = (int)(v42 + [v15 width] - 1) / (int)v42;
          v51[1] = (int)(v43 + [v15 height] - 1) / v43;
          v51[2] = 1;
          uint64_t v44 = v43;
          id v19 = v48;
          v50[0] = (int)v42;
          v50[1] = v44;
          v50[2] = 1;
          [v40 dispatchThreadgroups:v51 threadsPerThreadgroup:v50];
          [v40 endEncoding];
          [(XMattingBoxTensorFilter *)self->boxTensorFilter encodeOnCommandBuffer:v49 sourceTexture:v19 destinationTexture:v19];
          int v45 = 0;
          self->coefficientsComputed = 1;
          id v26 = v40;
LABEL_31:

          goto LABEL_32;
        }
      }
    }
LABEL_34:
    int v45 = -12780;
    goto LABEL_33;
  }
  int v45 = -12780;
LABEL_32:
  id v14 = v49;
LABEL_33:

  return v45;
}

- (int)encodeStateOn:(id)a3 colorGuide:(id)a4 disparityGuide:(id)a5 initialSegmentation:(id)a6 constraints:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v35 = a4;
  id v12 = a6;
  id v13 = a7;
  if ([(MTLTexture *)self->_guideStack textureType] == 3
    && [(MTLTexture *)self->_mean_I textureType] == 3
    && (uint64_t v14 = [(MTLTexture *)self->_guideStack width], v14 == [(MTLTexture *)self->_mean_I width])
    && (uint64_t v15 = [(MTLTexture *)self->_guideStack height], v15 == [(MTLTexture *)self->_mean_I height])
    && (uint64_t v16 = [(MTLTexture *)self->_guideStack arrayLength],
        v16 == [(MTLTexture *)self->_mean_I arrayLength])
    && [(NSArray *)self->_var_I count] == 2)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v17 = self->_var_I;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v23 = [v22 width];
          if (v23 == [(MTLTexture *)self->_guideStack width])
          {
            uint64_t v24 = [v22 height];
            if (v24 == [(MTLTexture *)self->_guideStack height])
            {
              uint64_t v25 = [v22 arrayLength];
              if (v25 == [(MTLTexture *)self->_guideStack arrayLength]
                && [v22 textureType] == 3)
              {
                continue;
              }
            }
          }
          int v26 = -12780;
          goto LABEL_25;
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    [(XMattingRGBFilter *)self encodeNearestNeighborDownSamplingOn:v11 inputTexture:v35 outputTexture:self->_guideStackTexture2DView];
    int v26 = [(XMattingBoxTensorFilter *)self->boxTensorFilter encodeOnCommandBuffer:v11 sourceTexture:self->_guideStack destinationTexture:self->_mean_I];
    id v17 = [v11 computeCommandEncoder];
    [(NSArray *)v17 setComputePipelineState:self->_computeInverted3DGuideCovarianceMatrixKernel];
    [(NSArray *)v17 setTexture:self->_guideStack atIndex:0];
    [(NSArray *)v17 setTexture:self->_mean_I atIndex:1];
    uint64_t v27 = [(NSArray *)self->_var_I objectAtIndexedSubscript:0];
    [(NSArray *)v17 setTexture:v27 atIndex:2];

    uint64_t v28 = [(NSArray *)self->_var_I objectAtIndexedSubscript:1];
    [(NSArray *)v17 setTexture:v28 atIndex:3];

    [(NSArray *)v17 setBytes:&self->config.epsilon length:4 atIndex:0];
    [(NSArray *)v17 setBytes:&self->config.spatialRadius length:4 atIndex:1];
    LODWORD(v28) = [(MTLComputePipelineState *)self->_computeInverted3DGuideCovarianceMatrixKernel threadExecutionWidth];
    int v29 = (int)[(MTLComputePipelineState *)self->_computeInverted3DGuideCovarianceMatrixKernel maxTotalThreadsPerThreadgroup]/ (int)v28;
    int v30 = (int)(v28 + [(MTLTexture *)self->_guideStack width] - 1) / (int)v28;
    int v31 = [(MTLTexture *)self->_guideStack height];
    v37[0] = v30;
    v37[1] = (v29 + v31 - 1) / v29;
    v37[2] = 1;
    v36[0] = (int)v28;
    v36[1] = v29;
    v36[2] = 1;
    [(NSArray *)v17 dispatchThreadgroups:v37 threadsPerThreadgroup:v36];
    [(NSArray *)v17 endEncoding];
    if (v12) {
      [(XMattingRGBFilter *)self encodeNearestNeighborDownSamplingOn:v11 inputTexture:v12 outputTexture:self->_alphaStackTexture2DView];
    }
    constraintsTexture2DView = self->_constraintsTexture2DView;
    if (v13)
    {
      [(XMattingRGBFilter *)self encodeNearestNeighborDownSamplingOn:v11 inputTexture:v13 outputTexture:constraintsTexture2DView];
    }
    else
    {
      self->_constraintsTexture2DView = 0;

      constraints = self->_constraints;
      self->_constraints = 0;
    }
    self->stateComputed = 1;
LABEL_25:
  }
  else
  {
    int v26 = -12780;
  }

  return v26;
}

- (int)encodeStepOn:(id)a3
{
  id v4 = a3;
  int v5 = [(XMattingRGBFilter *)self encodeCoefficientsOn:v4 guideStack:self->_guideStack alphaStack:self->_alphaStack mean_I:self->_mean_I var_I:self->_var_I coefficients:self->_coefficients];
  if (!v5) {
    int v5 = [(XMattingRGBFilter *)self encodeApplyCoefficientsOn:v4 colorGuide:self->_guideStackTexture2DView disparityGuide:0 constraints:self->_constraintsTexture2DView destinationAlphaTexture:self->_alphaStackTexture2DView];
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
  id v17 = self->_coefficientsTexture2DView;
  uint64_t v18 = v17;
  if (!self->coefficientsComputed)
  {
    int v33 = -12782;
    goto LABEL_18;
  }
  if ([(MTLTexture *)v17 textureType] != 2
    || [v13 textureType] != 2
    || v15 && [v15 textureType] != 2
    || [v16 textureType] != 2)
  {
    int v33 = -12780;
    goto LABEL_18;
  }
  uint64_t v19 = [v13 width];
  if (v19 == [v16 width])
  {
    uint64_t v20 = [v13 height];
    BOOL v21 = v20 != [v16 height];
  }
  else
  {
    BOOL v21 = 1;
  }
  id v35 = v14;
  if (v15)
  {
    uint64_t v22 = [v15 width];
    if (v22 != [v13 width]) {
      goto LABEL_15;
    }
    uint64_t v23 = [v15 height];
    BOOL v24 = v23 != [v13 height];
  }
  else
  {
    BOOL v24 = 0;
  }
  if (!v21 && !v24)
  {
    id v25 = v12;
    int v26 = [v12 computeCommandEncoder];
    [v26 setComputePipelineState:self->_applyCoefficientsKernel];
    [v26 setTexture:v18 atIndex:0];
    [v26 setTexture:v13 atIndex:1];
    [v26 setTexture:v15 atIndex:2];
    [v26 setTexture:v16 atIndex:3];
    int v31 = [(MTLComputePipelineState *)self->_applyCoefficientsKernel threadExecutionWidth];
    int v32 = (int)[(MTLComputePipelineState *)self->_applyCoefficientsKernel maxTotalThreadsPerThreadgroup]/ v31;
    v39[0] = (int)(v31 + [v16 width] - 1) / v31;
    v39[1] = (int)(v32 + [v16 height] - 1) / v32;
    v39[2] = 1;
    v38[0] = v31;
    v38[1] = v32;
    v38[2] = 1;
    int v29 = v39;
    int v30 = v38;
    goto LABEL_17;
  }
LABEL_15:
  id v25 = v12;
  int v26 = [v12 computeCommandEncoder];
  [v26 setComputePipelineState:self->_applyCoefficientsSamplingKernel];
  [v26 setTexture:v18 atIndex:0];
  [v26 setTexture:v13 atIndex:1];
  [v26 setTexture:v15 atIndex:2];
  [v26 setTexture:v16 atIndex:3];
  int v27 = [(MTLComputePipelineState *)self->_applyCoefficientsSamplingKernel threadExecutionWidth];
  int v28 = (int)[(MTLComputePipelineState *)self->_applyCoefficientsSamplingKernel maxTotalThreadsPerThreadgroup]/ v27;
  v37[0] = (int)(v27 + [v16 width] - 1) / v27;
  v37[1] = (int)(v28 + [v16 height] - 1) / v28;
  v37[2] = 1;
  v36[0] = v27;
  v36[1] = v28;
  v36[2] = 1;
  int v29 = v37;
  int v30 = v36;
LABEL_17:
  [v26 dispatchThreadgroups:v29 threadsPerThreadgroup:v30];
  [v26 endEncoding];

  int v33 = 0;
  id v14 = v35;
  id v12 = v25;
LABEL_18:

  return v33;
}

- (int)encodeUpsampleOn:(id)a3 segmentation:(id)a4 colorGuide:(id)a5 disparityGuide:(id)a6 outputMatte:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = [(XMattingRGBFilter *)self encodeStateOn:v12 colorGuide:v13 disparityGuide:v14 initialSegmentation:a4 constraints:0];
  if (!v16)
  {
    int v16 = [(XMattingRGBFilter *)self encodeCoefficientsOn:v12 guideStack:self->_guideStack alphaStack:self->_alphaStack mean_I:self->_mean_I var_I:self->_var_I coefficients:self->_coefficients];
    if (!v16) {
      int v16 = [(XMattingRGBFilter *)self encodeApplyCoefficientsOn:v12 colorGuide:v13 disparityGuide:v14 constraints:0 destinationAlphaTexture:v15];
    }
  }
  int v17 = v16;

  return v17;
}

- (XMattingBoxTensorFilter)boxTensorFilter
{
  return (XMattingBoxTensorFilter *)objc_getProperty(self, a2, 160, 1);
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
  objc_storeStrong((id *)&self->_applyCoefficientsSamplingKernel, 0);
  objc_storeStrong((id *)&self->_applyCoefficientsKernel, 0);
  objc_storeStrong((id *)&self->_compute3DCoefficientsKernel, 0);
  objc_storeStrong((id *)&self->_computeInverted3DGuideCovarianceMatrixKernel, 0);
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