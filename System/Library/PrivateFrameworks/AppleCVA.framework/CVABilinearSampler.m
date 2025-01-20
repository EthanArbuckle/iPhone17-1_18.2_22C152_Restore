@interface CVABilinearSampler
- (CVABilinearSampler)initWithDevice:(id)a3 mode:(int)a4;
- (id)_initWithDevice:(id)a3 pipelineLabel:(id)a4 fragmentFunction:(id)a5;
- (void)encodeToCommandBuffer:(float32x4_t)a3 sourceTexture:(float32x4_t)a4 transform:(uint64_t)a5 destinationTexture:(void *)a6 destinationBoundingBox:(void *)a7;
@end

@implementation CVABilinearSampler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_renderPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)encodeToCommandBuffer:(float32x4_t)a3 sourceTexture:(float32x4_t)a4 transform:(uint64_t)a5 destinationTexture:(void *)a6 destinationBoundingBox:(void *)a7
{
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  if ((unint64_t)[v15 mipmapLevelCount] >= 2)
  {
    v16 = [NSString stringWithUTF8String:"-[CVABilinearSampler encodeToCommandBuffer:sourceTexture:transform:destinationTexture:destinationBoundingBox:]"];
    NSLog(&cfstr_DestinationTex.isa, v16);
  }
  v17 = [*(id *)(a1 + 16) colorAttachments];
  v18 = [v17 objectAtIndexedSubscript:0];
  [v18 setTexture:v15];

  v19 = [*(id *)(a1 + 16) colorAttachments];
  v20 = [v19 objectAtIndexedSubscript:0];
  [v20 setLoadAction:0];

  v21 = [*(id *)(a1 + 16) colorAttachments];
  v22 = [v21 objectAtIndexedSubscript:0];
  [v22 setStoreAction:1];

  v23 = [*(id *)(a1 + 24) colorAttachments];
  v24 = [v23 objectAtIndexedSubscript:0];

  if (*(void *)(a1 + 32) && (uint64_t v25 = [v24 pixelFormat], v25 == objc_msgSend(v15, "pixelFormat")))
  {
    id v26 = 0;
  }
  else
  {
    objc_msgSend(v24, "setPixelFormat:", objc_msgSend(v15, "pixelFormat"));
    v27 = *(void **)(a1 + 8);
    uint64_t v28 = *(void *)(a1 + 24);
    id v54 = 0;
    uint64_t v29 = [v27 newRenderPipelineStateWithDescriptor:v28 error:&v54];
    id v26 = v54;
    v30 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v29;
  }
  v31 = [v13 renderCommandEncoderWithDescriptor:*(void *)(a1 + 16)];
  [v31 setLabel:@"BilinearSampler"];
  if (v31 && *(void *)(a1 + 32))
  {
    if (*(_DWORD *)(a1 + 160))
    {
      *(float32x4_t *)(a1 + 112) = a2;
      *(float32x4_t *)(a1 + 128) = a3;
      *(float32x4_t *)(a1 + 144) = a4;
      objc_msgSend(v31, "setFragmentBytes:length:atIndex:");
      float32x4_t v32 = *a9;
      float32x2_t v33 = 0;
      float32x2_t v34 = 0;
      float32x2_t v35 = 0;
      float32x2_t v36 = 0;
    }
    else
    {
      *(float32x2_t *)v39.f32 = vcvt_f32_s32((int32x2_t)([v15 width] | ((unint64_t)objc_msgSend(v15, "height") << 32)));
      v39.i64[1] = v39.i64[0];
      float32x4_t v32 = *a9;
      float32x4_t v40 = vmulq_f32(*a9, v39);
      float32x2_t v41 = (float32x2_t)vaddq_f32(v40, (float32x4_t)vdupq_laneq_s32((int32x4_t)v40, 3)).u64[0];
      float32x4_t v42 = vmulq_n_f32(a2, v40.f32[0]);
      int32x4_t v43 = (int32x4_t)vaddq_f32(a4, vmlaq_lane_f32(v42, a3, *(float32x2_t *)v40.f32, 1));
      float32x2_t v34 = vdiv_f32(*(float32x2_t *)v43.i8, (float32x2_t)vdup_laneq_s32(v43, 2));
      int32x4_t v44 = (int32x4_t)vaddq_f32(a4, vmlaq_lane_f32(v42, a3, v41, 1));
      float32x2_t v33 = vdiv_f32(*(float32x2_t *)v44.i8, (float32x2_t)vdup_laneq_s32(v44, 2));
      float32x4_t v45 = vmulq_n_f32(a2, vaddq_f32(v40, (float32x4_t)vdupq_laneq_s32((int32x4_t)v40, 2)).f32[0]);
      int32x4_t v46 = (int32x4_t)vaddq_f32(a4, vmlaq_lane_f32(v45, a3, v41, 1));
      float32x2_t v35 = vdiv_f32(*(float32x2_t *)v46.i8, (float32x2_t)vdup_laneq_s32(v46, 2));
      int32x4_t v47 = (int32x4_t)vaddq_f32(a4, vmlaq_lane_f32(v45, a3, *(float32x2_t *)v40.f32, 1));
      float32x2_t v36 = vdiv_f32(*(float32x2_t *)v47.i8, (float32x2_t)vdup_laneq_s32(v47, 2));
    }
    LODWORD(v48) = v32.i32[0];
    HIDWORD(v48) = vaddq_f32(v32, (float32x4_t)vdupq_laneq_s32(*(int32x4_t *)&v32, 3)).i32[1];
    LODWORD(v49) = vadd_f32(*(float32x2_t *)v32.f32, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v32, 2)).u32[0];
    HIDWORD(v49) = v32.i32[1];
    *(void *)(a1 + 40) = v32.i64[0];
    *(float32x2_t *)(a1 + 48) = v34;
    v50 = (void *)(a1 + 40);
    v50[2] = v48;
    v50[3] = v33;
    v50[4] = v49;
    v50[5] = v36;
    v50[6] = __PAIR64__(HIDWORD(v48), v49);
    v50[7] = v35;
    [v31 setRenderPipelineState:*(v50 - 1)];
    [v31 setCullMode:0];
    [v31 setFragmentTexture:v14 atIndex:0];
    [v31 setVertexBytes:v50 length:64 atIndex:0];
    [v31 drawPrimitives:4 vertexStart:0 vertexCount:4];
    [v31 endEncoding];
  }
  else
  {
    v37 = [NSString stringWithUTF8String:"-[CVABilinearSampler encodeToCommandBuffer:sourceTexture:transform:destinationTexture:destinationBoundingBox:]"];
    v38 = [v26 localizedDescription];
    NSLog(&cfstr_Error_1.isa, v37, v38);
  }
}

- (id)_initWithDevice:(id)a3 pipelineLabel:(id)a4 fragmentFunction:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)&self->_device, a3);
  device = self->_device;
  id v43 = 0;
  id v13 = +[VPCMetalLib metalLibraryWithDevice:device error:&v43];
  id v14 = v43;
  if (v13)
  {
    id v15 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
    renderPassDescriptor = self->_renderPassDescriptor;
    self->_renderPassDescriptor = v15;

    v17 = (MTLRenderPipelineDescriptor *)objc_opt_new();
    renderPipelineDescriptor = self->_renderPipelineDescriptor;
    self->_renderPipelineDescriptor = v17;

    [(MTLRenderPipelineDescriptor *)self->_renderPipelineDescriptor setLabel:v10];
    [(MTLRenderPipelineDescriptor *)self->_renderPipelineDescriptor setRasterSampleCount:1];
    [(MTLRenderPipelineDescriptor *)self->_renderPipelineDescriptor setDepthAttachmentPixelFormat:0];
    [(MTLRenderPipelineDescriptor *)self->_renderPipelineDescriptor setStencilAttachmentPixelFormat:0];
    v19 = (void *)[v13 newFunctionWithName:@"bilinearSamplerVertexShader"];
    [(MTLRenderPipelineDescriptor *)self->_renderPipelineDescriptor setVertexFunction:v19];

    v20 = (void *)[v13 newFunctionWithName:v11];
    [(MTLRenderPipelineDescriptor *)self->_renderPipelineDescriptor setFragmentFunction:v20];

    v21 = [MEMORY[0x1E4F35358] vertexDescriptor];
    v22 = [v21 attributes];
    v23 = [v22 objectAtIndexedSubscript:0];
    [v23 setFormat:29];

    v24 = [v21 attributes];
    uint64_t v25 = [v24 objectAtIndexedSubscript:0];
    [v25 setOffset:0];

    id v26 = [v21 attributes];
    v27 = [v26 objectAtIndexedSubscript:0];
    [v27 setBufferIndex:0];

    uint64_t v28 = [v21 attributes];
    uint64_t v29 = [v28 objectAtIndexedSubscript:1];
    [v29 setFormat:29];

    v30 = [v21 attributes];
    v31 = [v30 objectAtIndexedSubscript:1];
    [v31 setOffset:8];

    float32x4_t v32 = [v21 attributes];
    float32x2_t v33 = [v32 objectAtIndexedSubscript:1];
    [v33 setBufferIndex:0];

    float32x2_t v34 = [v21 layouts];
    float32x2_t v35 = [v34 objectAtIndexedSubscript:0];
    [v35 setStride:16];

    float32x2_t v36 = [v21 layouts];
    v37 = [v36 objectAtIndexedSubscript:0];
    [v37 setStepRate:1];

    v38 = [v21 layouts];
    float32x4_t v39 = [v38 objectAtIndexedSubscript:0];
    [v39 setStepFunction:1];

    [(MTLRenderPipelineDescriptor *)self->_renderPipelineDescriptor setVertexDescriptor:v21];
    float32x4_t v40 = self;
  }
  else
  {
    v21 = [NSString stringWithUTF8String:"-[CVABilinearSampler _initWithDevice:pipelineLabel:fragmentFunction:]"];
    float32x2_t v41 = [v14 localizedDescription];
    NSLog(&cfstr_Error_0.isa, v21, v41);

    float32x4_t v40 = 0;
  }

  return v40;
}

- (CVABilinearSampler)initWithDevice:(id)a3 mode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CVABilinearSampler;
  v7 = [(CVABilinearSampler *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_mode = v4;
    if (v4)
    {
      if (v4 != 1)
      {
        id v11 = [NSString stringWithUTF8String:"-[CVABilinearSampler initWithDevice:mode:]"];
        NSLog(&cfstr_UnsupportedSam.isa, v11, v4);

        v8 = 0;
        goto LABEL_8;
      }
      id v9 = @"bilinearSamplerFragmentShaderPerspectiveWarp";
      id v10 = @"BilinearSamplerPipelinePerspectiveWarp";
    }
    else
    {
      id v9 = @"bilinearSamplerFragmentShader";
      id v10 = @"BilinearSamplerPipeline";
    }
    v8 = [(CVABilinearSampler *)v7 _initWithDevice:v6 pipelineLabel:v10 fragmentFunction:v9];
  }
LABEL_8:

  return v8;
}

@end