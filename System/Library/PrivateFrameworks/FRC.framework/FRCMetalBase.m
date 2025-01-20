@interface FRCMetalBase
- (FRCMetalBase)init;
- (FRCMetalBase)initWithDevice:(id)a3 commmandQueue:(id)a4;
- (id)createKernel:(id)a3;
- (id)createKernel:(id)a3 constantValues:(id)a4;
- (id)createRenderKernel:(id)a3 renderTargetFormat:(unint64_t)a4;
- (id)newTextureCoordinateBufferWithWidth:(double)a3 height:(double)a4;
- (id)newVertexBuffer;
@end

@implementation FRCMetalBase

- (FRCMetalBase)initWithDevice:(id)a3 commmandQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FRCMetalBase;
  v9 = [(FRCMetalBase *)&v20 init];
  v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      objc_storeStrong((id *)&v9->_device, a3);
      v11 = (MTLCommandQueue *)v8;
    }
    else
    {
      v12 = (MTLDevice *)MTLCreateSystemDefaultDevice();
      device = v10->_device;
      v10->_device = v12;

      v11 = (MTLCommandQueue *)[(MTLDevice *)v10->_device newCommandQueue];
    }
    commandQueue = v10->_commandQueue;
    v10->_commandQueue = v11;

    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = [v15 URLForResource:@"default" withExtension:@"metallib"];
    uint64_t v17 = [(MTLDevice *)v10->_device newLibraryWithURL:v16 error:0];
    mtlLibrary = v10->_mtlLibrary;
    v10->_mtlLibrary = (MTLLibrary *)v17;
  }
  return v10;
}

- (FRCMetalBase)init
{
  return [(FRCMetalBase *)self initWithDevice:0 commmandQueue:0];
}

- (id)createKernel:(id)a3
{
  return [(FRCMetalBase *)self createKernel:a3 constantValues:0];
}

- (id)createKernel:(id)a3 constantValues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mtlLibrary = self->_mtlLibrary;
  if (v7) {
    uint64_t v9 = [(MTLLibrary *)mtlLibrary newFunctionWithName:v6 constantValues:v7 error:0];
  }
  else {
    uint64_t v9 = [(MTLLibrary *)mtlLibrary newFunctionWithName:v6];
  }
  v10 = (void *)v9;
  if (!v9) {
    NSLog(&cfstr_ErrorFailedCre.isa, v6);
  }
  uint64_t v16 = 0;
  id v11 = objc_alloc_init(MEMORY[0x1E4F35208]);
  [v11 setThreadGroupSizeIsMultipleOfThreadExecutionWidth:1];
  [v11 setComputeFunction:v10];
  device = self->_device;
  uint64_t v15 = 0;
  v13 = (void *)[(MTLDevice *)device newComputePipelineStateWithDescriptor:v11 options:0 reflection:&v16 error:&v15];
  if (!v13) {
    NSLog(&cfstr_ErrorFailedToC.isa, v6);
  }

  return v13;
}

- (id)createRenderKernel:(id)a3 renderTargetFormat:(unint64_t)a4
{
  mtlLibrary = self->_mtlLibrary;
  id v7 = a3;
  id v8 = (void *)[(MTLLibrary *)mtlLibrary newFunctionWithName:@"texturedQuadVertex"];
  uint64_t v9 = (void *)[(MTLLibrary *)self->_mtlLibrary newFunctionWithName:v7];

  id v10 = objc_alloc_init(MEMORY[0x1E4F352F0]);
  [v10 setVertexFunction:v8];
  [v10 setFragmentFunction:v9];
  id v11 = [v10 colorAttachments];
  v12 = [v11 objectAtIndexedSubscript:0];
  [v12 setPixelFormat:a4];

  device = self->_device;
  id v18 = 0;
  v14 = (void *)[(MTLDevice *)device newRenderPipelineStateWithDescriptor:v10 error:&v18];
  id v15 = v18;
  uint64_t v16 = v15;
  if (!v14) {
    NSLog(&cfstr_FailedToCreate.isa, v15);
  }

  return v14;
}

- (id)newVertexBuffer
{
  return (id)[(MTLDevice *)self->_device newBufferWithBytes:&vertices length:32 options:0];
}

- (id)newTextureCoordinateBufferWithWidth:(double)a3 height:(double)a4
{
  *(float32x2_t *)&long long v5 = vcvt_f32_f64(*(float64x2_t *)&a3);
  long long v6 = xmmword_1DC85A2A0;
  DWORD1(v6) = DWORD1(v5);
  long long v7 = xmmword_1DC85A2A0;
  LODWORD(v7) = v5;
  *((void *)&v5 + 1) = 1065353216;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9[0] = v6;
  v9[1] = v5;
  v9[2] = xmmword_1DC85A2A0;
  v9[3] = v7;
  return (id)[(MTLDevice *)self->_device newBufferWithBytes:v9 length:64 options:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_mtlLibrary, 0);
}

@end