@interface XMattingSolver
- ($6563333CECB3C2C1F2AD6751BAE18088)config;
- (XMattingSolver)initWithDevice:(id)a3 library:(id)a4;
- (int)_compileShadersWithLibrary:(id)a3;
- (int)allocateResources:(id *)a3;
- (int)encodeApplySolverConstraintsOn:(id)a3 constraints:(id)a4 filteredSegmentation:(id)a5 segmentation:(id)a6;
- (int)encodeConstraintsOn:(id)a3 segmentation:(id)a4 constraints:(id)a5;
- (int)enqueueSolveOn:(id)a3 constraints:(id)a4 colorGuide:(id)a5 extraGuide:(id)a6 inputTexture:(id)a7 outputTexture:(id)a8;
- (void)releaseResources;
- (void)setConfig:(id *)a3;
@end

@implementation XMattingSolver

- (XMattingSolver)initWithDevice:(id)a3 library:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XMattingSolver;
  v9 = [(XMattingSolver *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v10->_library, a4);
  }

  return v10;
}

- (int)allocateResources:(id *)a3
{
  long long v5 = *(_OWORD *)&a3->var0;
  long long v6 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_config.fgThresholdValue = *(_OWORD *)&a3->var7;
  *(_OWORD *)&self->_config.internalWidth = v5;
  *(_OWORD *)&self->_config.epsilon = v6;
  int v7 = [(XMattingSolver *)self _compileShadersWithLibrary:self->_library];
  if (v7)
  {
    int v8 = v7;
    v9 = 0;
  }
  else
  {
    v9 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:a3->var0 height:a3->var1 mipmapped:0];
    [v9 setUsage:3];
    v10 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
    tmpSegmentation = self->_tmpSegmentation;
    self->_tmpSegmentation = v10;

    if (!self->_tmpSegmentation) {
      goto LABEL_15;
    }
    float var4 = a3->var4;
    unsigned int var2 = a3->var2;
    unsigned int var3 = a3->var3;
    unsigned int var0 = a3->var0;
    unsigned int var1 = a3->var1;
    v17 = &off_1E576FE88;
    if (a3->var6) {
      v17 = off_1E576FE80;
    }
    v18 = (MattingFilter *)[objc_alloc(*v17) initWithDevice:self->_device library:self->_library];
    mattingFilter = self->_mattingFilter;
    self->_mattingFilter = v18;

    v20 = self->_mattingFilter;
    if (v20)
    {
      int v21 = var1 / var3;
      if (var1 / var3 <= 1) {
        int v21 = 1;
      }
      int v22 = var0 / var3;
      if (var0 / var3 <= 1) {
        int v22 = 1;
      }
      v41[0] = v22;
      v41[1] = v21;
      v41[2] = var2;
      uint64_t v42 = 0x100000000;
      float v43 = var4;
      int v44 = 0;
      int v8 = [(MattingFilter *)v20 allocateResources:v41];
      id v23 = objc_alloc(MEMORY[0x1E4F355F8]);
      *(float *)&double v24 = a3->var7;
      LODWORD(v25) = 1.0;
      v26 = (MPSImageThresholdBinary *)[v23 initWithDevice:self->_device thresholdValue:0 maximumValue:v24 linearGrayColorTransform:v25];
      fgThresholdFilter = self->_fgThresholdFilter;
      self->_fgThresholdFilter = v26;

      id v28 = objc_alloc(MEMORY[0x1E4F35600]);
      *(float *)&double v29 = a3->var8;
      LODWORD(v30) = 1.0;
      v31 = (MPSImageThresholdBinaryInverse *)[v28 initWithDevice:self->_device thresholdValue:0 maximumValue:v29 linearGrayColorTransform:v30];
      bgThresholdFilter = self->_bgThresholdFilter;
      self->_bgThresholdFilter = v31;

      v33 = (MPSImageAreaMin *)[objc_alloc(MEMORY[0x1E4F35540]) initWithDevice:self->_device kernelWidth:a3->var9 kernelHeight:a3->var9];
      erosionFilter = self->_erosionFilter;
      self->_erosionFilter = v33;

      [(MPSImageAreaMin *)self->_erosionFilter setEdgeMode:0];
      v35 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:25 width:a3->var0 height:a3->var1 mipmapped:0];

      [v35 setUsage:3];
      v36 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v35];
      fgErodedSegmentation = self->_fgErodedSegmentation;
      self->_fgErodedSegmentation = v36;

      v38 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v35];
      bgErodedSegmentation = self->_bgErodedSegmentation;
      self->_bgErodedSegmentation = v38;

      if (!self->_fgErodedSegmentation || !self->_bgErodedSegmentation) {
        int v8 = -12786;
      }
      v9 = v35;
    }
    else
    {
LABEL_15:
      int v8 = -12786;
    }
  }

  return v8;
}

- (int)_compileShadersWithLibrary:(id)a3
{
  id v4 = a3;
  long long v5 = (void *)[v4 newFunctionWithName:@"solverConstraints"];
  long long v6 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v5 error:0];
  solverConstraintsKernel = self->_solverConstraintsKernel;
  self->_solverConstraintsKernel = v6;

  if (self->_solverConstraintsKernel)
  {
    uint64_t v8 = [v4 newFunctionWithName:@"applySolverConstraints"];

    v9 = (MTLComputePipelineState *)[(MTLDevice *)self->_device newComputePipelineStateWithFunction:v8 error:0];
    applySolverConstraintsKernel = self->_applySolverConstraintsKernel;
    self->_applySolverConstraintsKernel = v9;

    if (self->_applySolverConstraintsKernel) {
      int v11 = 0;
    }
    else {
      int v11 = -12786;
    }
    long long v5 = (void *)v8;
  }
  else
  {
    int v11 = -12786;
  }

  return v11;
}

- (void)releaseResources
{
  solverConstraintsKernel = self->_solverConstraintsKernel;
  self->_solverConstraintsKernel = 0;

  applySolverConstraintsKernel = self->_applySolverConstraintsKernel;
  self->_applySolverConstraintsKernel = 0;

  tmpSegmentation = self->_tmpSegmentation;
  self->_tmpSegmentation = 0;

  fgErodedSegmentation = self->_fgErodedSegmentation;
  self->_fgErodedSegmentation = 0;

  bgErodedSegmentation = self->_bgErodedSegmentation;
  self->_bgErodedSegmentation = 0;
}

- (int)encodeConstraintsOn:(id)a3 segmentation:(id)a4 constraints:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 width];
  if (v11 == [v9 width] && (uint64_t v12 = objc_msgSend(v10, "height"), v12 == objc_msgSend(v9, "height")))
  {
    [(MPSImageThresholdBinary *)self->_fgThresholdFilter encodeToCommandBuffer:v8 sourceTexture:v9 destinationTexture:self->_tmpSegmentation];
    [(MPSImageAreaMin *)self->_erosionFilter encodeToCommandBuffer:v8 sourceTexture:self->_tmpSegmentation destinationTexture:self->_fgErodedSegmentation];
    [(MPSImageThresholdBinaryInverse *)self->_bgThresholdFilter encodeToCommandBuffer:v8 sourceTexture:v9 destinationTexture:self->_tmpSegmentation];
    [(MPSImageAreaMin *)self->_erosionFilter encodeToCommandBuffer:v8 sourceTexture:self->_tmpSegmentation destinationTexture:self->_bgErodedSegmentation];
    v13 = [v8 computeCommandEncoder];
    [v13 setComputePipelineState:self->_solverConstraintsKernel];
    [v13 setTexture:self->_fgErodedSegmentation atIndex:0];
    [v13 setTexture:self->_bgErodedSegmentation atIndex:1];
    [v13 setTexture:v10 atIndex:2];
    int v14 = [(MTLComputePipelineState *)self->_solverConstraintsKernel threadExecutionWidth];
    int v15 = (int)[(MTLComputePipelineState *)self->_solverConstraintsKernel maxTotalThreadsPerThreadgroup]/ v14;
    v19[0] = (int)(v14 + [v10 width] - 1) / v14;
    v19[1] = (int)(v15 + [v10 height] - 1) / v15;
    v19[2] = 1;
    v18[0] = v14;
    v18[1] = v15;
    v18[2] = 1;
    [v13 dispatchThreadgroups:v19 threadsPerThreadgroup:v18];
    [v13 endEncoding];

    int v16 = 0;
  }
  else
  {
    int v16 = -12780;
  }

  return v16;
}

- (int)encodeApplySolverConstraintsOn:(id)a3 constraints:(id)a4 filteredSegmentation:(id)a5 segmentation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 width];
  if (v14 == [v13 width]
    && (uint64_t v15 = [v11 height], v15 == objc_msgSend(v13, "height"))
    && (uint64_t v16 = [v12 width], v16 == objc_msgSend(v13, "width"))
    && (uint64_t v17 = [v12 height], v17 == objc_msgSend(v13, "height")))
  {
    v18 = [v10 computeCommandEncoder];
    [v18 setComputePipelineState:self->_applySolverConstraintsKernel];
    [v18 setTexture:v11 atIndex:0];
    [v18 setTexture:v12 atIndex:1];
    [v18 setTexture:v13 atIndex:2];
    int v19 = [(MTLComputePipelineState *)self->_applySolverConstraintsKernel threadExecutionWidth];
    int v20 = (int)[(MTLComputePipelineState *)self->_applySolverConstraintsKernel maxTotalThreadsPerThreadgroup]/ v19;
    v24[0] = (int)(v19 + [v13 width] - 1) / v19;
    v24[1] = (int)(v20 + [v13 height] - 1) / v20;
    v24[2] = 1;
    v23[0] = v19;
    v23[1] = v20;
    v23[2] = 1;
    [v18 dispatchThreadgroups:v24 threadsPerThreadgroup:v23];
    [v18 endEncoding];

    int v21 = 0;
  }
  else
  {
    int v21 = -12780;
  }

  return v21;
}

- (int)enqueueSolveOn:(id)a3 constraints:(id)a4 colorGuide:(id)a5 extraGuide:(id)a6 inputTexture:(id)a7 outputTexture:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (self->_config.useDepthFilter) {
    int v20 = @"RGBD";
  }
  else {
    int v20 = @"RGB";
  }
  int v21 = v20;
  tmpSegmentation = self->_tmpSegmentation;
  v37 = v16;
  if (!tmpSegmentation)
  {
    double v25 = 0;
    v26 = 0;
    int v33 = -12786;
    goto LABEL_17;
  }
  uint64_t v23 = [(MTLTexture *)tmpSegmentation width];
  if (v23 != [v18 width]
    || (uint64_t v24 = -[MTLTexture height](self->_tmpSegmentation, "height"), v24 != [v18 height]))
  {
    double v25 = 0;
    v26 = 0;
    int v33 = -12780;
    goto LABEL_17;
  }
  double v25 = [v14 commandBuffer];
  v26 = [NSString stringWithFormat:@"%@-solver:encodeStateOn", v21];
  if (!v25)
  {
    int v33 = -1;
    goto LABEL_17;
  }
  [v25 setLabel:v26];
  int v27 = [(MattingFilter *)self->_mattingFilter encodeStateOn:v25 colorGuide:v16 disparityGuide:v17 initialSegmentation:v18 constraints:v15];
  if (v27)
  {
    int v33 = v27;
    goto LABEL_17;
  }
  id v35 = v17;
  id v36 = v15;
  [v25 commit];
  id v28 = [v14 commandBuffer];

  if (self->_config.iterations)
  {
    uint64_t v29 = 0;
    while (1)
    {
      double v30 = v26;
      v26 = [NSString stringWithFormat:@"%@-solver:encodeStepOn %i", v21, v29];

      if (!v28)
      {
        double v25 = 0;
        goto LABEL_19;
      }
      [v28 setLabel:v26];
      int v31 = [(MattingFilter *)self->_mattingFilter encodeStepOn:v28];
      if (v31) {
        break;
      }
      uint64_t v29 = (v29 + 1);
      if (v29 >= self->_config.iterations) {
        goto LABEL_14;
      }
    }
    int v33 = v31;
    double v25 = v28;
    goto LABEL_21;
  }
LABEL_14:
  v32 = v26;
  [v28 commit];
  double v25 = [v14 commandBuffer];

  v26 = [NSString stringWithFormat:@"%@-solver:encodeApplyCoefficientsOn", v21];

  if (!v25)
  {
LABEL_19:
    int v33 = -1;
LABEL_21:
    id v17 = v35;
    id v15 = v36;
    goto LABEL_17;
  }
  [v25 setLabel:v26];
  id v17 = v35;
  id v15 = v36;
  int v33 = [(MattingFilter *)self->_mattingFilter encodeApplyCoefficientsOn:v25 colorGuide:v37 disparityGuide:v35 constraints:v36 destinationAlphaTexture:v19];
  if (!v33) {
    [v25 commit];
  }
LABEL_17:

  return v33;
}

- ($6563333CECB3C2C1F2AD6751BAE18088)config
{
  objc_copyStruct(retstr, &self->_config, 44, 1, 0);
  return result;
}

- (void)setConfig:(id *)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_erosionFilter, 0);
  objc_storeStrong((id *)&self->_bgThresholdFilter, 0);
  objc_storeStrong((id *)&self->_fgThresholdFilter, 0);
  objc_storeStrong((id *)&self->_mattingFilter, 0);
  objc_storeStrong((id *)&self->_bgErodedSegmentation, 0);
  objc_storeStrong((id *)&self->_fgErodedSegmentation, 0);
  objc_storeStrong((id *)&self->_tmpSegmentation, 0);
  objc_storeStrong((id *)&self->_solverConstraintsKernel, 0);
  objc_storeStrong((id *)&self->_applySolverConstraintsKernel, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end