@interface VCPCNNPoolingBlockGPU
- (int)forward;
@end

@implementation VCPCNNPoolingBlockGPU

- (int)forward
{
  if (!*(void *)&self->super._chunk)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
    v4 = [WeakRetained objectAtIndexedSubscript:1];
    int v5 = [v4 intValue];

    id v6 = objc_loadWeakRetained((id *)&self->super.super._inputSize);
    v7 = [v6 objectAtIndexedSubscript:2];
    LODWORD(WeakRetained) = [v7 intValue];

    id v8 = objc_alloc(MEMORY[0x1E4F354F0]);
    v9 = [(VCPCNNMetalContext *)self->super.super._context device];
    uint64_t v10 = [v8 initWithDevice:v9 kernelWidth:*(int *)(&self->super.super._executedOnGPU + 3) kernelHeight:self->super._px strideInPixelsX:*(int *)(&self->super.super._executedOnGPU + 3) strideInPixelsY:self->super._px];
    v11 = *(void **)&self->super._chunk;
    *(void *)&self->super._chunk = v10;

    uint64_t v12 = (int)WeakRetained / *(_DWORD *)(&self->super.super._executedOnGPU + 3);
    v13 = *(void **)&self->super._chunk;
    uint64_t v14 = v5 / self->super._px;
    int64x2_t v28 = vdupq_n_s64(1uLL);
    uint64_t v29 = 0;
    [v13 setOffset:&v28];
    v15 = *(void **)&self->super._chunk;
    memset(v27, 0, 24);
    v27[3] = v12;
    v27[4] = v14;
    v27[5] = 1;
    [v15 setClipRect:v27];
    [*(id *)&self->super._chunk setEdgeMode:0];
  }
  if (!self->super.super._executedOnGPU
    || (int result = [(VCPCNNData *)self->super.super._output reallocGPUTemporalBuffers]) == 0)
  {
    uint64_t v17 = [(VCPCNNMetalContext *)self->super.super._context commandBuffer];
    if (v17)
    {
      v18 = (void *)v17;
      id v19 = objc_loadWeakRetained((id *)&self->super.super._input);
      v20 = [v19 mpsImg];
      if (v20)
      {
        v21 = [(VCPCNNData *)self->super.super._output mpsImg];

        if (v21)
        {
          v22 = *(void **)&self->super._chunk;
          v23 = [(VCPCNNMetalContext *)self->super.super._context commandBuffer];
          id v24 = objc_loadWeakRetained((id *)&self->super.super._input);
          v25 = [v24 mpsImg];
          v26 = [(VCPCNNData *)self->super.super._output mpsImg];
          [v22 encodeToCommandBuffer:v23 sourceImage:v25 destinationImage:v26];

          int result = 0;
          self->super.super._executedOnGPU = 1;
          return result;
        }
      }
      else
      {
      }
    }
    return -108;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end