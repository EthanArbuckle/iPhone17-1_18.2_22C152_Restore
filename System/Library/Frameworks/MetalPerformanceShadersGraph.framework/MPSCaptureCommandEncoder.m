@interface MPSCaptureCommandEncoder
- (MPSCaptureCommandEncoder)initWithCommandEncoder:(id)a3 captureContext:(id)a4;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)dealloc;
- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5;
- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4;
- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5;
- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4;
- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4;
- (void)memoryBarrierWithScope:(unint64_t)a3;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setComputePipelineState:(id)a3;
- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setStageInRegion:(id *)a3;
- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4;
- (void)setTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)updateFence:(id)a3;
- (void)waitForFence:(id)a3;
@end

@implementation MPSCaptureCommandEncoder

- (MPSCaptureCommandEncoder)initWithCommandEncoder:(id)a3 captureContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MPSCaptureCommandEncoder;
  v9 = [(MPSCaptureCommandEncoder *)&v11 init];
  MEMORY[0x1852FE5D0]();
  objc_storeStrong((id *)&v9->_encoder, a3);
  objc_storeStrong((id *)&v9->_captureContext, a4);
  operator new();
}

- (void)dealloc
{
  encoderContext = (uint64_t *)self->_encoderContext;
  if (encoderContext)
  {
    v4 = (void *)encoderContext[4];
    if (v4)
    {
      encoderContext[5] = (uint64_t)v4;
      operator delete(v4);
    }

    v5 = (id *)*encoderContext;
    if (*encoderContext)
    {
      v6 = (id *)encoderContext[1];
      id v7 = (void *)*encoderContext;
      if (v6 != v5)
      {
        do
        {

          id v8 = *(v6 - 4);
          v6 -= 4;
        }
        while (v6 != v5);
        id v7 = (void *)*encoderContext;
      }
      encoderContext[1] = (uint64_t)v5;
      operator delete(v7);
    }
    MEMORY[0x1852FDE70](encoderContext, 0xB0C40D8961893);
  }
  self->_encoderContext = 0;
  v9.receiver = self;
  v9.super_class = (Class)MPSCaptureCommandEncoder;
  [(MPSCaptureCommandEncoder *)&v9 dealloc];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector())
  {
    v4 = self->_encoder;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  id v18 = a3;
  id v8 = -[MPSGraphCaptureContext constantBufferName:](self->_captureContext, "constantBufferName:");
  objc_super v9 = v8;
  encoderContext = (id **)self->_encoderContext;
  if (v8)
  {
    id v11 = v8;
    MPSEncoderContext::addBindingsIfNeeded(encoderContext, a5);
    unint64_t v12 = (unint64_t)&(*encoderContext)[4 * a5];
    *(unsigned char *)(v12 + 16) = 1;
    v13 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = v11;
    id v14 = v11;

    *(void *)(v12 + 8) = a4;
  }
  else
  {
    id v15 = v18;
    MPSEncoderContext::addBindingsIfNeeded(encoderContext, a5);
    id v16 = (*encoderContext)[4 * a5];
    (*encoderContext)[4 * a5] = v15;
    id v14 = v15;

    unint64_t v17 = (unint64_t)&(*encoderContext)[4 * a5];
    *(void *)(v17 + 8) = a4;
    *(unsigned char *)(v17 + 16) = 0;
  }

  [(MTLComputeCommandEncoder *)self->_encoder setBuffer:v18 offset:a4 atIndex:a5];
}

- (void)setBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_super v9 = -[MPSGraphCaptureContext dataWithBytes:length:](self->_captureContext, "dataWithBytes:length:");
  encoderContext = (id **)self->_encoderContext;
  id v11 = v9;
  MPSEncoderContext::addBindingsIfNeeded(encoderContext, a5);
  unint64_t v12 = (unint64_t)&(*encoderContext)[4 * a5];
  *(unsigned char *)(v12 + 16) = 1;
  v13 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v11;
  id v14 = v11;

  *(void *)(v12 + 8) = 0;
  [(MTLComputeCommandEncoder *)self->_encoder setBytes:a3 length:a4 atIndex:a5];
}

- (void)setComputePipelineState:(id)a3
{
  objc_storeStrong((id *)self->_encoderContext + 3, a3);
  id v5 = a3;
  -[MTLComputeCommandEncoder setComputePipelineState:](self->_encoder, "setComputePipelineState:");
}

- (void)setTexture:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = a3;
  abort();
}

- (void)setTextures:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setSamplerState:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = a3;
  abort();
}

- (void)setSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
  id v6 = a3;
  abort();
}

- (void)setSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
  encoderContext = self->_encoderContext;
  id v8 = (char *)*((void *)encoderContext + 4);
  objc_super v9 = (unsigned char *)*((void *)encoderContext + 5);
  uint64_t v10 = v9 - v8;
  unint64_t v11 = (v9 - v8) >> 3;
  if (v11 > a4)
  {
    unint64_t v12 = (char *)*((void *)encoderContext + 4);
    goto LABEL_22;
  }
  unint64_t v13 = a4 + 1;
  unint64_t v14 = a4 + 1 - v11;
  if (a4 + 1 > v11)
  {
    uint64_t v15 = *((void *)encoderContext + 6);
    if (v14 > (v15 - (uint64_t)v9) >> 3)
    {
      if (v13 >> 61) {
        std::vector<int>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v35 = v9 - v8;
      uint64_t v16 = v15 - (void)v8;
      if (v16 >> 2 > v13) {
        unint64_t v13 = v16 >> 2;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
      }
      if (v13 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v33 = 8 * v13;
      unint64_t v17 = (char *)operator new(8 * v13);
      unint64_t v12 = &v17[8 * v11];
      v32 = v17;
      v34 = &v17[v33];
      size_t v18 = 8 * v14;
      bzero(v12, v18);
      v19 = &v12[v18];
      if (v9 == v8)
      {
        v21 = v34;
        uint64_t v10 = v9 - v8;
        goto LABEL_31;
      }
      unint64_t v20 = v9 - v8 - 8;
      uint64_t v10 = v9 - v8;
      if (v20 >= 0x58)
      {
        v21 = v34;
        if ((unint64_t)(v8 - v32) >= 0x20)
        {
          uint64_t v24 = (v20 >> 3) + 1;
          uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
          v26 = &v9[-v25];
          v12 -= v25;
          v27 = &v32[8 * v11 - 16];
          v28 = (long long *)(v9 - 16);
          uint64_t v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v30 = *v28;
            *((_OWORD *)v27 - 1) = *(v28 - 1);
            *(_OWORD *)v27 = v30;
            v27 -= 32;
            v28 -= 2;
            v29 -= 4;
          }
          while (v29);
          objc_super v9 = v26;
          if (v24 == (v24 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_31:
            *((void *)encoderContext + 4) = v12;
            *((void *)encoderContext + 5) = v19;
            *((void *)encoderContext + 6) = v21;
            if (v8)
            {
              operator delete(v8);
              uint64_t v10 = v35;
              unint64_t v12 = (char *)*((void *)encoderContext + 4);
            }
            goto LABEL_19;
          }
        }
      }
      else
      {
        v21 = v34;
      }
      do
      {
        uint64_t v31 = *((void *)v9 - 1);
        v9 -= 8;
        *((void *)v12 - 1) = v31;
        v12 -= 8;
      }
      while (v9 != v8);
      goto LABEL_31;
    }
    bzero(*((void **)encoderContext + 5), 8 * v14);
    uint64_t v10 = v9 - v8;
    v22 = &v9[8 * v14];
    goto LABEL_17;
  }
  if (a4 + 1 < v11)
  {
    v22 = &v8[8 * v13];
LABEL_17:
    *((void *)encoderContext + 5) = v22;
  }
  unint64_t v12 = v8;
LABEL_19:
  if (v11 < a4) {
    bzero(&v12[v10], 8 * a4 - v10);
  }
  *(void *)&v12[8 * a4] = 0;
LABEL_22:
  *(void *)&v12[8 * a4] = a3;
  encoder = self->_encoder;

  [(MTLComputeCommandEncoder *)encoder setThreadgroupMemoryLength:a3 atIndex:a4];
}

- (void)setStageInRegion:(id *)a3
{
}

- (void)setStageInRegionWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4
{
  id v4 = a3;
  abort();
}

- (void)dispatchThreadgroups:(id *)a3 threadsPerThreadgroup:(id *)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"ThreadsPerThreadgroup";
  id v7 = MTLSizeToNSArray((MTLSize *)a4);
  v13[1] = @"ThreadgroupsPerGrid";
  v14[0] = v7;
  id v8 = MTLSizeToNSArray((MTLSize *)a3);
  v14[1] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  [(MPSGraphCaptureContext *)self->_captureContext createNodeWithDispatchInfo:v9 encoderContext:self->_encoderContext];
  encoder = self->_encoder;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v12 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a4;
  [(MTLComputeCommandEncoder *)encoder dispatchThreadgroups:&v12 threadsPerThreadgroup:&v11];
}

- (void)dispatchThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerThreadgroup:(id *)a5
{
  id v5 = a3;
  abort();
}

- (void)dispatchThreads:(id *)a3 threadsPerThreadgroup:(id *)a4
{
}

- (void)updateFence:(id)a3
{
  id v3 = a3;
  abort();
}

- (void)waitForFence:(id)a3
{
  id v3 = a3;
  abort();
}

- (void)executeCommandsInBuffer:(id)a3 withRange:(_NSRange)a4
{
  id v4 = a3;
  abort();
}

- (void)executeCommandsInBuffer:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  abort();
}

- (void)memoryBarrierWithScope:(unint64_t)a3
{
}

- (void)memoryBarrierWithResources:(const void *)a3 count:(unint64_t)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureContext, 0);

  objc_storeStrong((id *)&self->_encoder, 0);
}

@end