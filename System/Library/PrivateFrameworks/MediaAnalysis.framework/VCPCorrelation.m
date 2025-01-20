@interface VCPCorrelation
- (VCPCorrelation)initWithDevice:(id)a3;
- (int)configureGPU;
- (int)encodeToCommandBuffer:(id)a3 firstInput:(id)a4 secondInput:(id)a5 correlation:(id)a6;
@end

@implementation VCPCorrelation

- (VCPCorrelation)initWithDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPCorrelation;
  v6 = [(VCPCorrelation *)&v11 init];
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_device, a3), [(VCPCorrelation *)v7 configureGPU])) {
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

  v8 = (void *)[(MTLLibrary *)self->_mtlLibrary newFunctionWithName:@"correlationNonInterleaved"];
  if (v8)
  {
    v9 = self->_device;
    id v15 = v6;
    v10 = (MTLComputePipelineState *)[(MTLDevice *)v9 newComputePipelineStateWithFunction:v8 error:&v15];
    id v11 = v15;

    correlationKernel = self->_correlationKernel;
    self->_correlationKernel = v10;

    if (self->_correlationKernel) {
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

- (int)encodeToCommandBuffer:(id)a3 firstInput:(id)a4 secondInput:(id)a5 correlation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  int v15 = -50;
  if (v11 && v12 && v13)
  {
    id v16 = [v10 computeCommandEncoder];
    if (v16)
    {
      uint64_t v17 = [v11 width];
      uint64_t v18 = [v11 height];
      [v16 setComputePipelineState:self->_correlationKernel];
      [v16 setTexture:v11 atIndex:0];
      [v16 setTexture:v12 atIndex:1];
      [v16 setTexture:v14 atIndex:2];
      v22[0] = (unint64_t)(v17 + 15) >> 4;
      v22[1] = (unint64_t)(v18 + 15) >> 4;
      v22[2] = 1;
      int64x2_t v20 = vdupq_n_s64(0x10uLL);
      uint64_t v21 = 1;
      [v16 dispatchThreadgroups:v22 threadsPerThreadgroup:&v20];
      [v16 endEncoding];
      int v15 = 0;
    }
    else
    {
      int v15 = -108;
    }
  }
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationKernel, 0);
  objc_storeStrong((id *)&self->_mtlLibrary, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end