@interface Pyramid
- (Pyramid)initWithDevice:(id)a3 commmandQueue:(id)a4;
- (void)blendWarpedResidueForward:(__CVBuffer *)a3 backward:(__CVBuffer *)a4 withGridNetOutput:(__CVBuffer *)a5 timeScale:(float)a6 destination:(__CVBuffer *)a7 callback:(id)a8;
- (void)createResiduePyramidFromBuffer:(__CVBuffer *)a3 toBuffer:(__CVBuffer *)a4 levels:(unint64_t)a5;
- (void)encode3x3GaussianFilterToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5;
- (void)encodeAddBottomPaddingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5;
- (void)encodeBicubicSubsampleTextureToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5;
- (void)encodeFeatureBackwarpToCommandBuffer:(id)a3 feature:(id)a4 forwardFlow:(id)a5 backwardFlow:(id)a6 timeScale:(float)a7 destination:(id)a8;
- (void)encodeLayerBlendToCommandBuffer:(id)a3 baseLayer:(id)a4 toDestination:(id)a5;
- (void)encodeLayerBlendToCommandBuffer:(id)a3 forwardResidue:(id)a4 backwardResidue:(id)a5 withBaseLayer:(id)a6 timeScale:(float)a7 destination:(id)a8;
- (void)encodeResidueInplaceToCommandBuffer:(id)a3 base:(id)a4 low:(id)a5;
- (void)encodeResiduePyramidToCommandBuffer:(id)a3 fromTexture:(id)a4 toTexture:(const void *)a5 levels:(unint64_t)a6;
- (void)encodeResidueToCommandBuffer:(id)a3 base:(id)a4 low:(id)a5 destination:(id)a6;
- (void)encodeShuffleToCommandBuffer:(id)a3 full:(id)a4 quarter:(id)a5 destination:(id)a6;
- (void)encodeSubsampleTextureWith3x3GaussianToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5;
- (void)encodeSubsampleTextureWith5x5GaussianToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 clampToEdge:(BOOL)a6;
@end

@implementation Pyramid

- (Pyramid)initWithDevice:(id)a3 commmandQueue:(id)a4
{
  v38.receiver = self;
  v38.super_class = (Class)Pyramid;
  v4 = [(FRCMetalBase *)&v38 initWithDevice:a3 commmandQueue:a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(FRCMetalBase *)v4 createKernel:@"subsample_frame"];
    subsampleKernel = v5->_subsampleKernel;
    v5->_subsampleKernel = (MTLComputePipelineState *)v6;

    uint64_t v8 = [(FRCMetalBase *)v5 createKernel:@"create_residue"];
    residueKernel = v5->_residueKernel;
    v5->_residueKernel = (MTLComputePipelineState *)v8;

    uint64_t v10 = [(FRCMetalBase *)v5 createKernel:@"create_residue_inplace"];
    residueInplaceKernel = v5->_residueInplaceKernel;
    v5->_residueInplaceKernel = (MTLComputePipelineState *)v10;

    uint64_t v12 = [(FRCMetalBase *)v5 createKernel:@"shuffle_and_concat"];
    shuffleConcatenateKernel = v5->_shuffleConcatenateKernel;
    v5->_shuffleConcatenateKernel = (MTLComputePipelineState *)v12;

    uint64_t v14 = [(FRCMetalBase *)v5 createKernel:@"gaussian_subsample"];
    gaussianSubsampleKernel = v5->_gaussianSubsampleKernel;
    v5->_gaussianSubsampleKernel = (MTLComputePipelineState *)v14;

    uint64_t v16 = [(FRCMetalBase *)v5 createKernel:@"blend_resisue_with_grid_output"];
    blendKernel = v5->_blendKernel;
    v5->_blendKernel = (MTLComputePipelineState *)v16;

    uint64_t v18 = [(FRCMetalBase *)v5 createKernel:@"warp_with_consistency_map"];
    featureBackwarpKernel = v5->_featureBackwarpKernel;
    v5->_featureBackwarpKernel = (MTLComputePipelineState *)v18;

    uint64_t v20 = [(FRCMetalBase *)v5 createKernel:@"padding_copy"];
    paddingKernel = v5->_paddingKernel;
    v5->_paddingKernel = (MTLComputePipelineState *)v20;

    uint64_t v22 = [(FRCMetalBase *)v5 createKernel:@"gaussian3x3_subsample"];
    gaussian3x3SubsampleKernel = v5->_gaussian3x3SubsampleKernel;
    v5->_gaussian3x3SubsampleKernel = (MTLComputePipelineState *)v22;

    uint64_t v24 = [(FRCMetalBase *)v5 createKernel:@"blend_two_layer_pyramid"];
    twoLayerBlendKernel = v5->_twoLayerBlendKernel;
    v5->_twoLayerBlendKernel = (MTLComputePipelineState *)v24;

    uint64_t v26 = [(FRCMetalBase *)v5 createKernel:@"bicubic_subsample"];
    bicubicSubsampleKernel = v5->_bicubicSubsampleKernel;
    v5->_bicubicSubsampleKernel = (MTLComputePipelineState *)v26;

    if ([(MTLDevice *)v5->super._device supportsFamily:1008])
    {
      v5->_supportsSIMDShuffle = 1;
    }
    else if (!v5->_supportsSIMDShuffle)
    {
      v28 = @"gaussian3x3_filter";
      goto LABEL_7;
    }
    v28 = @"gaussian3x3_filter_SIMD";
LABEL_7:
    uint64_t v29 = [(FRCMetalBase *)v5 createKernel:v28];
    gaussian3x3FilterKernel = v5->_gaussian3x3FilterKernel;
    v5->_gaussian3x3FilterKernel = (MTLComputePipelineState *)v29;

    uint64_t v31 = [(MTLDevice *)v5->super._device newBufferWithLength:50 options:0];
    gaussianCoefficientBuffer = v5->_gaussianCoefficientBuffer;
    v5->_gaussianCoefficientBuffer = (MTLBuffer *)v31;

    uint64_t v33 = [(MTLBuffer *)v5->_gaussianCoefficientBuffer contents];
    *(_WORD *)(v33 + 48) = 10386;
    *(_OWORD *)uint64_t v33 = GaussianFilterCoeffients;
    *(_OWORD *)(v33 + 16) = unk_1DC85A398;
    *(_OWORD *)(v33 + 32) = xmmword_1DC85A3A8;
    uint64_t v34 = [(MTLDevice *)v5->super._device newBufferWithLength:24 options:0];
    gaussian3x3CoefficientBuffer = v5->_gaussian3x3CoefficientBuffer;
    v5->_gaussian3x3CoefficientBuffer = (MTLBuffer *)v34;

    uint64_t v36 = [(MTLBuffer *)v5->_gaussian3x3CoefficientBuffer contents];
    *(_WORD *)(v36 + 16) = 12027;
    *(_OWORD *)uint64_t v36 = Gaussian3x3FilterCoeffients;
  }
  return v5;
}

- (void)createResiduePyramidFromBuffer:(__CVBuffer *)a3 toBuffer:(__CVBuffer *)a4 levels:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 3uLL);
  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v9 = a5 + 1;
  if (a5 != -1)
  {
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      uint64_t v12 = createTexturesFromCVPixelBuffer(a4[v10], self->super._device, 1, 3uLL);
      v13 = (void *)*((void *)&v21 + v10);
      *((void *)&v21 + v10) = v12;

      uint64_t v10 = v11;
      BOOL v14 = v9 > v11++;
    }
    while (v14);
    if (a5 == 2)
    {
      uint64_t v15 = createTexturesFromCVPixelBuffer(a4[3], self->super._device, 1, 3uLL);
      uint64_t v16 = (void *)*((void *)&v22 + 1);
      *((void *)&v22 + 1) = v15;
    }
  }
  v17 = [(MTLCommandQueue *)self->super._commandQueue commandBuffer];
  [v17 enqueue];
  [(Pyramid *)self encodeResiduePyramidToCommandBuffer:v17 fromTexture:v8 toTexture:&v21 levels:a5];
  [v17 commit];
  [v17 waitUntilCompleted];
  if (a5 != -1)
  {
    uint64_t v18 = 0;
    unsigned int v19 = 1;
    do
    {
      if (isBufferCopyNecessaryForCVtoTextureConversion([*((id *)&v21 + v18) width], objc_msgSend(*((id *)&v21 + v18), "height"), objc_msgSend(*((id *)&v21 + v18), "arrayLength")))
      {
        copyTextureToBuffer(*((void **)&v21 + v18), a4[v18]);
      }
      uint64_t v18 = v19;
      BOOL v14 = v9 > v19++;
    }
    while (v14);
  }

  for (uint64_t i = 32; i != -8; i -= 8)
}

- (void)encodeResiduePyramidToCommandBuffer:(id)a3 fromTexture:(id)a4 toTexture:(const void *)a5 levels:(unint64_t)a6
{
  id v15 = a3;
  id v10 = a4;
  unsigned int v11 = v10;
  switch(a6)
  {
    case 4uLL:
      [(Pyramid *)self encodeSubsampleTextureWith5x5GaussianToCommandBuffer:v15 source:v10 destination:a5[4] clampToEdge:1];
      [(Pyramid *)self encodeSubsampleTextureWith5x5GaussianToCommandBuffer:v15 source:a5[4] destination:a5[2] clampToEdge:0];
      [(Pyramid *)self encodeSubsampleTextureWith5x5GaussianToCommandBuffer:v15 source:a5[2] destination:a5[3] clampToEdge:0];
      [(Pyramid *)self encodeResidueToCommandBuffer:v15 base:v11 low:a5[4] destination:*a5];
      [(Pyramid *)self encodeResidueToCommandBuffer:v15 base:a5[4] low:a5[2] destination:a5[1]];
      [(Pyramid *)self encodeResidueInplaceToCommandBuffer:v15 base:a5[2] low:a5[3]];
      break;
    case 3uLL:
      id v12 = v10;
      uint64_t v13 = [v12 height];
      if (v13 != [(id)*a5 height])
      {
        uint64_t v14 = createTextures(self->super._device, [(id)*a5 width], objc_msgSend((id)*a5, "height"), 1, 3uLL);

        [(Pyramid *)self encodeAddBottomPaddingToCommandBuffer:v15 source:v12 destination:v14];
        id v12 = (id)v14;
      }
      [(Pyramid *)self encodeSubsampleTextureWith5x5GaussianToCommandBuffer:v15 source:v12 destination:a5[3] clampToEdge:0];
      [(Pyramid *)self encodeSubsampleTextureWith5x5GaussianToCommandBuffer:v15 source:a5[3] destination:a5[2] clampToEdge:0];
      [(Pyramid *)self encodeResidueToCommandBuffer:v15 base:v12 low:a5[3] destination:*a5];
      [(Pyramid *)self encodeResidueToCommandBuffer:v15 base:a5[3] low:a5[2] destination:a5[1]];

      break;
    case 2uLL:
      [(Pyramid *)self encode3x3GaussianFilterToCommandBuffer:v15 source:v10 destination:a5[1]];
      [(Pyramid *)self encodeBicubicSubsampleTextureToCommandBuffer:v15 source:a5[1] destination:a5[2]];
      [(Pyramid *)self encode3x3GaussianFilterToCommandBuffer:v15 source:a5[2] destination:a5[3]];
      [(Pyramid *)self encodeResidueToCommandBuffer:v15 base:v11 low:a5[3] destination:a5[1]];
      break;
    default:
      -[Pyramid encodeResiduePyramidToCommandBuffer:fromTexture:toTexture:levels:]();
  }
}

- (void)encodeBicubicSubsampleTextureToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  float v11 = (float)(unint64_t)[v9 width];
  float v18 = v11 / (float)(unint64_t)[v8 width];
  id v12 = [v10 computeCommandEncoder];

  [v12 setComputePipelineState:self->_bicubicSubsampleKernel];
  [v12 setTexture:v9 atIndex:0];

  [v12 setTexture:v8 atIndex:1];
  [v12 setBytes:&v18 length:4 atIndex:0];
  unint64_t v13 = (unint64_t)([v8 width] + 15) >> 4;
  uint64_t v14 = [v8 height];

  v17[0] = v13;
  v17[1] = (unint64_t)(v14 + 15) >> 4;
  v17[2] = 1;
  int64x2_t v15 = vdupq_n_s64(0x10uLL);
  uint64_t v16 = 1;
  [v12 dispatchThreadgroups:v17 threadsPerThreadgroup:&v15];
  [v12 endEncoding];
}

- (void)encodeSubsampleTextureWith5x5GaussianToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 clampToEdge:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = (objc_class *)MEMORY[0x1E4F35300];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  int64x2_t v15 = v14;
  if (v6) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = 4;
  }
  [v14 setTAddressMode:v16];
  [v15 setSAddressMode:v16];
  [v15 setNormalizedCoordinates:0];
  v17 = (void *)[(MTLDevice *)self->super._device newSamplerStateWithDescriptor:v15];
  float v18 = [v13 computeCommandEncoder];

  [v18 setComputePipelineState:self->_gaussianSubsampleKernel];
  [v18 setTexture:v12 atIndex:0];

  [v18 setTexture:v11 atIndex:1];
  [v18 setBuffer:self->_gaussianCoefficientBuffer offset:0 atIndex:0];
  [v18 setSamplerState:v17 atIndex:0];
  unint64_t v19 = (unint64_t)([v11 width] + 15) >> 4;
  uint64_t v20 = [v11 height];

  v23[0] = v19;
  v23[1] = (unint64_t)(v20 + 15) >> 4;
  v23[2] = 1;
  int64x2_t v21 = vdupq_n_s64(0x10uLL);
  uint64_t v22 = 1;
  [v18 dispatchThreadgroups:v23 threadsPerThreadgroup:&v21];
  [v18 endEncoding];
}

- (void)encodeSubsampleTextureWith3x3GaussianToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_gaussian3x3SubsampleKernel];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];
  uint64_t v11 = [(MTLBuffer *)self->_gaussian3x3CoefficientBuffer contents];
  unint64_t v12 = [v9 width];

  *(float *)(v11 + 20) = (float)v12 / (float)(unint64_t)[v8 width];
  [v10 setBuffer:self->_gaussian3x3CoefficientBuffer offset:0 atIndex:0];
  unint64_t v13 = (unint64_t)([v8 width] + 15) >> 4;
  uint64_t v14 = [v8 height];

  v17[0] = v13;
  v17[1] = (unint64_t)(v14 + 15) >> 4;
  v17[2] = 1;
  int64x2_t v15 = vdupq_n_s64(0x10uLL);
  uint64_t v16 = 1;
  [v10 dispatchThreadgroups:v17 threadsPerThreadgroup:&v15];
  [v10 endEncoding];
}

- (void)encode3x3GaussianFilterToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_gaussian3x3FilterKernel];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  [v10 setBuffer:self->_gaussian3x3CoefficientBuffer offset:0 atIndex:0];
  unint64_t v11 = (unint64_t)([v8 width] + 3) >> 2;
  uint64_t v12 = [v8 height];

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 31) >> 5;
  v15[2] = 1;
  long long v13 = xmmword_1DC85A370;
  uint64_t v14 = 1;
  [v10 dispatchThreadgroups:v15 threadsPerThreadgroup:&v13];
  [v10 endEncoding];
}

- (void)encodeResidueToCommandBuffer:(id)a3 base:(id)a4 low:(id)a5 destination:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  long long v13 = [a3 computeCommandEncoder];
  [v13 setComputePipelineState:self->_residueKernel];
  [v13 setTexture:v12 atIndex:0];
  [v13 setTexture:v11 atIndex:1];
  [v13 setTexture:v10 atIndex:2];
  unint64_t v14 = [v11 width];

  float v15 = (float)v14;
  unint64_t v16 = [v12 width];

  float v22 = v15 / (float)v16;
  [v13 setBytes:&v22 length:4 atIndex:0];
  unint64_t v17 = (unint64_t)([v10 width] + 15) >> 4;
  uint64_t v18 = [v10 height];

  v21[0] = v17;
  v21[1] = (unint64_t)(v18 + 15) >> 4;
  v21[2] = 1;
  int64x2_t v19 = vdupq_n_s64(0x10uLL);
  uint64_t v20 = 1;
  [v13 dispatchThreadgroups:v21 threadsPerThreadgroup:&v19];
  [v13 endEncoding];
}

- (void)encodeResidueInplaceToCommandBuffer:(id)a3 base:(id)a4 low:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_residueInplaceKernel];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];

  unint64_t v11 = (unint64_t)([v9 width] + 15) >> 4;
  uint64_t v12 = [v9 height];

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  int64x2_t v13 = vdupq_n_s64(0x10uLL);
  uint64_t v14 = 1;
  [v10 dispatchThreadgroups:v15 threadsPerThreadgroup:&v13];
  [v10 endEncoding];
}

- (void)encodeShuffleToCommandBuffer:(id)a3 full:(id)a4 quarter:(id)a5 destination:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  int64x2_t v13 = [a3 computeCommandEncoder];
  [v13 setComputePipelineState:self->_shuffleConcatenateKernel];
  [v13 setTexture:v12 atIndex:0];

  [v13 setTexture:v11 atIndex:1];
  [v13 setTexture:v10 atIndex:2];
  unint64_t v14 = (unint64_t)([v10 width] + 15) >> 4;
  uint64_t v15 = [v10 height];

  v18[0] = v14;
  v18[1] = (unint64_t)(v15 + 15) >> 4;
  v18[2] = 1;
  int64x2_t v16 = vdupq_n_s64(0x10uLL);
  uint64_t v17 = 1;
  [v13 dispatchThreadgroups:v18 threadsPerThreadgroup:&v16];
  [v13 endEncoding];
}

- (void)blendWarpedResidueForward:(__CVBuffer *)a3 backward:(__CVBuffer *)a4 withGridNetOutput:(__CVBuffer *)a5 timeScale:(float)a6 destination:(__CVBuffer *)a7 callback:(id)a8
{
  id v14 = a8;
  uint64_t v15 = createTexturesFromCVPixelBuffer(a3, self->super._device, 1, 3uLL);
  int64x2_t v16 = createTexturesFromCVPixelBuffer(a4, self->super._device, 1, 3uLL);
  uint64_t v17 = createTexturesFromCVPixelBuffer(a5, self->super._device, 1, 3uLL);
  uint64_t v18 = createTexturesFromCVPixelBuffer(a7, self->super._device, 1, 3uLL);
  int64x2_t v19 = [(MTLCommandQueue *)self->super._commandQueue commandBuffer];
  *(float *)&double v20 = a6;
  [(Pyramid *)self encodeLayerBlendToCommandBuffer:v19 forwardResidue:v15 backwardResidue:v16 withBaseLayer:v17 timeScale:v18 destination:v20];
  if (v14)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __95__Pyramid_blendWarpedResidueForward_backward_withGridNetOutput_timeScale_destination_callback___block_invoke;
    void v21[3] = &unk_1E6CA4198;
    id v22 = v14;
    [v19 addCompletedHandler:v21];
  }
  [v19 commit];
  [v19 waitUntilScheduled];
}

uint64_t __95__Pyramid_blendWarpedResidueForward_backward_withGridNetOutput_timeScale_destination_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)encodeLayerBlendToCommandBuffer:(id)a3 forwardResidue:(id)a4 backwardResidue:(id)a5 withBaseLayer:(id)a6 timeScale:(float)a7 destination:(id)a8
{
  float v23 = a7;
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  uint64_t v17 = [a3 computeCommandEncoder];
  [v17 setComputePipelineState:self->_blendKernel];
  [v17 setTexture:v16 atIndex:0];

  [v17 setTexture:v15 atIndex:1];
  [v17 setTexture:v14 atIndex:2];

  [v17 setTexture:v13 atIndex:3];
  [v17 setBytes:&v23 length:4 atIndex:0];
  unint64_t v18 = (unint64_t)([v13 width] + 15) >> 4;
  uint64_t v19 = [v13 height];

  v22[0] = v18;
  v22[1] = (unint64_t)(v19 + 15) >> 4;
  v22[2] = 1;
  int64x2_t v20 = vdupq_n_s64(0x10uLL);
  uint64_t v21 = 1;
  [v17 dispatchThreadgroups:v22 threadsPerThreadgroup:&v20];
  [v17 endEncoding];
}

- (void)encodeFeatureBackwarpToCommandBuffer:(id)a3 feature:(id)a4 forwardFlow:(id)a5 backwardFlow:(id)a6 timeScale:(float)a7 destination:(id)a8
{
  float v23 = a7;
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  uint64_t v17 = [a3 computeCommandEncoder];
  [v17 setComputePipelineState:self->_featureBackwarpKernel];
  [v17 setTexture:v16 atIndex:0];

  [v17 setTexture:v15 atIndex:1];
  [v17 setTexture:v14 atIndex:2];

  [v17 setTexture:v13 atIndex:3];
  [v17 setBytes:&v23 length:4 atIndex:0];
  unint64_t v18 = (unint64_t)([v13 width] + 15) >> 4;
  uint64_t v19 = [v13 height];

  v22[0] = v18;
  v22[1] = (unint64_t)(v19 + 15) >> 4;
  v22[2] = 1;
  int64x2_t v20 = vdupq_n_s64(0x10uLL);
  uint64_t v21 = 1;
  [v17 dispatchThreadgroups:v22 threadsPerThreadgroup:&v20];
  [v17 endEncoding];
}

- (void)encodeAddBottomPaddingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_paddingKernel];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  unint64_t v11 = (unint64_t)([v8 width] + 15) >> 4;
  uint64_t v12 = [v8 height];

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 15) >> 4;
  v15[2] = 1;
  int64x2_t v13 = vdupq_n_s64(0x10uLL);
  uint64_t v14 = 1;
  [v10 dispatchThreadgroups:v15 threadsPerThreadgroup:&v13];
  [v10 endEncoding];
}

- (void)encodeLayerBlendToCommandBuffer:(id)a3 baseLayer:(id)a4 toDestination:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 computeCommandEncoder];
  [v10 setComputePipelineState:self->_twoLayerBlendKernel];
  [v10 setTexture:v9 atIndex:0];
  [v10 setTexture:v8 atIndex:1];
  unint64_t v11 = [v9 width];

  float v17 = (float)v11 / (float)(unint64_t)[v8 width];
  [v10 setBytes:&v17 length:4 atIndex:0];
  unint64_t v12 = (unint64_t)([v8 width] + 15) >> 4;
  uint64_t v13 = [v8 height];

  v16[0] = v12;
  v16[1] = (unint64_t)(v13 + 15) >> 4;
  v16[2] = 1;
  int64x2_t v14 = vdupq_n_s64(0x10uLL);
  uint64_t v15 = 1;
  [v10 dispatchThreadgroups:v16 threadsPerThreadgroup:&v14];
  [v10 endEncoding];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bicubicSubsampleKernel, 0);
  objc_storeStrong((id *)&self->_twoLayerBlendKernel, 0);
  objc_storeStrong((id *)&self->_gaussian3x3CoefficientBuffer, 0);
  objc_storeStrong((id *)&self->_gaussian3x3FilterKernel, 0);
  objc_storeStrong((id *)&self->_gaussian3x3SubsampleKernel, 0);
  objc_storeStrong((id *)&self->_gaussianCoefficientBuffer, 0);
  objc_storeStrong((id *)&self->_paddingKernel, 0);
  objc_storeStrong((id *)&self->_featureBackwarpKernel, 0);
  objc_storeStrong((id *)&self->_blendKernel, 0);
  objc_storeStrong((id *)&self->_gaussianSubsampleKernel, 0);
  objc_storeStrong((id *)&self->_shuffleConcatenateKernel, 0);
  objc_storeStrong((id *)&self->_residueInplaceKernel, 0);
  objc_storeStrong((id *)&self->_residueKernel, 0);
  objc_storeStrong((id *)&self->_subsampleKernel, 0);
}

- (void)encodeResiduePyramidToCommandBuffer:fromTexture:toTexture:levels:.cold.1()
{
}

@end