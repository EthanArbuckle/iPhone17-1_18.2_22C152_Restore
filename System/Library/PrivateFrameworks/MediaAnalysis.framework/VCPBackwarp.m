@interface VCPBackwarp
- (VCPBackwarp)initWithDevice:(id)a3;
- (int)configureGPU;
- (int)encodeToCommandBuffer:(id)a3 input:(id)a4 output:(id)a5 flow:(id)a6 upscaledFlow:(id)a7;
@end

@implementation VCPBackwarp

- (VCPBackwarp)initWithDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPBackwarp;
  v6 = [(VCPBackwarp *)&v11 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_device, a3), [(VCPBackwarp *)v7 configureGPU])) {
    v8 = 0;
  }
  else {
    v8 = v7;
  }
  v9 = v8;

  return v9;
}

- (int)configureGPU
{
  v3 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  device = self->_device;
  id v16 = 0;
  id v5 = (MTLLibrary *)[(MTLDevice *)device newDefaultLibraryWithBundle:v3 error:&v16];
  id v6 = v16;
  mtlLibrary = self->_mtlLibrary;
  self->_mtlLibrary = v5;

  v8 = (void *)[(MTLLibrary *)self->_mtlLibrary newFunctionWithName:@"backwarpNonInterleaved"];
  if (v8)
  {
    v9 = self->_device;
    id v15 = v6;
    v10 = (MTLComputePipelineState *)[(MTLDevice *)v9 newComputePipelineStateWithFunction:v8 error:&v15];
    id v11 = v15;

    backwarpKernel = self->_backwarpKernel;
    self->_backwarpKernel = v10;

    if (self->_backwarpKernel) {
      int v13 = 0;
    }
    else {
      int v13 = -108;
    }
    id v6 = v11;
  }
  else
  {
    int v13 = -4;
  }

  return v13;
}

- (int)encodeToCommandBuffer:(id)a3 input:(id)a4 output:(id)a5 flow:(id)a6 upscaledFlow:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  int v18 = -50;
  if (v13 && v14 && v15 && v16)
  {
    v19 = [v12 computeCommandEncoder];
    if (v19)
    {
      unint64_t v20 = [v17 width];
      unint64_t v21 = [v15 width];
      id v22 = (id) [(MTLDevice *)self->_device newBufferWithLength:4 options:0];
      *(float *)[v22 contents] = (float)v20 / (float)v21;
      uint64_t v23 = [v13 width];
      uint64_t v24 = [v13 height];
      [v19 setComputePipelineState:self->_backwarpKernel];
      [v19 setTexture:v13 atIndex:0];
      [v19 setTexture:v14 atIndex:1];
      [v19 setTexture:v15 atIndex:2];
      [v19 setTexture:v17 atIndex:3];
      [v19 setBuffer:v22 offset:0 atIndex:0];
      v28[0] = (unint64_t)(v23 + 15) >> 4;
      v28[1] = (unint64_t)(v24 + 15) >> 4;
      v28[2] = 1;
      int64x2_t v26 = vdupq_n_s64(0x10uLL);
      uint64_t v27 = 1;
      [v19 dispatchThreadgroups:v28 threadsPerThreadgroup:&v26];
      [v19 endEncoding];

      int v18 = 0;
    }
    else
    {
      int v18 = -108;
    }
  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlLibrary, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_backwarpKernel, 0);
}

@end