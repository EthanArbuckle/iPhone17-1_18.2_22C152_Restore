@interface VNMetalInterface
- (VNMetalInterface)init;
- (id)textureFromCVPixelBuffer:(__CVBuffer *)a3;
- (id)textureWithPixelData:(vImage_Buffer *)a3 format:(unint64_t)a4;
- (id)textureWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unint64_t)a5 usage:(unint64_t)a6;
- (void)performAdaptiveBinarizationImage:(vImage_Buffer *)a3 output:(vImage_Buffer *)a4 sumTable:(vImage_Buffer *)a5 sumSqTable:(vImage_Buffer *)a6;
- (void)performVotingImage:(id)a3 outputTex:(id)a4 subBuffer:(char *)a5;
@end

@implementation VNMetalInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mtlLibrary, 0);
  objc_storeStrong((id *)&self->mtlCommandQueue, 0);

  objc_storeStrong((id *)&self->mtlDevice, 0);
}

- (void)performAdaptiveBinarizationImage:(vImage_Buffer *)a3 output:(vImage_Buffer *)a4 sumTable:(vImage_Buffer *)a5 sumSqTable:(vImage_Buffer *)a6
{
  v11 = [(MTLCommandQueue *)self->mtlCommandQueue commandBuffer];
  uint64_t v12 = [(MTLLibrary *)self->mtlLibrary newFunctionWithName:@"generateAdaptiveBinarization"];
  mtlDevice = self->mtlDevice;
  id v41 = 0;
  v34 = (void *)v12;
  v14 = (void *)-[MTLDevice newComputePipelineStateWithFunction:error:](mtlDevice, "newComputePipelineStateWithFunction:error:");
  id v32 = v41;
  v15 = [v11 computeCommandEncoder];
  long long v16 = *(_OWORD *)&a3->width;
  long long v35 = *(_OWORD *)&a3->data;
  long long v36 = v16;
  v17 = [(VNMetalInterface *)self textureWithPixelData:&v35 format:13];
  v33 = a4;
  v18 = [(VNMetalInterface *)self textureWithWidth:a4->width height:a4->height format:13 usage:2];
  long long v19 = *(_OWORD *)&a5->width;
  long long v35 = *(_OWORD *)&a5->data;
  long long v36 = v19;
  v20 = [(VNMetalInterface *)self textureWithPixelData:&v35 format:53];
  long long v21 = *(_OWORD *)&a6->width;
  long long v35 = *(_OWORD *)&a6->data;
  long long v36 = v21;
  v22 = [(VNMetalInterface *)self textureWithPixelData:&v35 format:55];
  [v15 setTexture:v18 atIndex:0];
  [v15 setTexture:v17 atIndex:1];
  [v15 setTexture:v20 atIndex:2];
  [v15 setTexture:v22 atIndex:3];
  unint64_t v23 = (unint64_t)[v18 width] >> 3;
  unint64_t v24 = (unint64_t)[v18 height] >> 2;
  [v15 setComputePipelineState:v14];
  *(void *)&long long v35 = v23;
  *((void *)&v35 + 1) = v24;
  *(void *)&long long v36 = 1;
  long long v39 = xmmword_1A410C2A0;
  uint64_t v40 = 1;
  [v15 dispatchThreadgroups:&v35 threadsPerThreadgroup:&v39];
  [v15 endEncoding];
  [v11 commit];
  [v11 waitUntilCompleted];
  v25 = [v11 error];

  if (v25)
  {
    v26 = [v11 error];
    id v27 = [v26 description];
    printf("  Metal command buffer error : %s\n", (const char *)[v27 UTF8String]);
  }
  uint64_t v28 = [v18 width];
  uint64_t v29 = [v18 height];
  data = v33->data;
  size_t rowBytes = v33->rowBytes;
  long long v35 = 0uLL;
  *(void *)&long long v36 = 0;
  *((void *)&v36 + 1) = v28;
  uint64_t v37 = v29;
  uint64_t v38 = 1;
  [v18 getBytes:data bytesPerRow:rowBytes fromRegion:&v35 mipmapLevel:0];
}

- (void)performVotingImage:(id)a3 outputTex:(id)a4 subBuffer:(char *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(MTLCommandQueue *)self->mtlCommandQueue commandBuffer];
  int v41 = 0;
  v33 = (void *)[(MTLDevice *)self->mtlDevice newBufferWithBytes:&v41 length:4 options:0];
  unint64_t v10 = [v8 width];
  unint64_t v11 = [v8 height];
  uint64_t v12 = (void *)[(MTLLibrary *)self->mtlLibrary newFunctionWithName:@"updateVotingImage"];
  mtlDevice = self->mtlDevice;
  id v40 = 0;
  v14 = (void *)[(MTLDevice *)mtlDevice newComputePipelineStateWithFunction:v12 error:&v40];
  id v15 = v40;
  long long v16 = v15;
  if (v15)
  {
    id v17 = [v15 description];
    printf("  Metal computePipelineState error : %s\n", (const char *)[v17 UTF8String]);
  }
  v18 = [v9 computeCommandEncoder];
  long long v19 = v18;
  if (v7) {
    [v18 setTexture:v7 atIndex:1];
  }
  unint64_t v31 = v11 >> 2;
  unint64_t v32 = v10 >> 3;
  if (v8)
  {
    v20 = -[VNMetalInterface textureWithWidth:height:format:usage:](self, "textureWithWidth:height:format:usage:", [v8 width], objc_msgSend(v8, "height"), objc_msgSend(v8, "pixelFormat"), 3);
    [v19 setTexture:v20 atIndex:0];
  }
  else
  {
    v20 = 0;
  }
  long long v21 = (void *)[(MTLDevice *)self->mtlDevice newBufferWithBytes:a5 length:128 options:0];
  [v19 setBuffer:v21 offset:0 atIndex:0];
  [v19 setBuffer:v33 offset:0 atIndex:1];
  [v19 setComputePipelineState:v14];
  unint64_t v37 = v32;
  unint64_t v38 = v31;
  uint64_t v39 = 1;
  long long v35 = xmmword_1A410C2A0;
  uint64_t v36 = 1;
  [v19 dispatchThreadgroups:&v37 threadsPerThreadgroup:&v35];
  [v19 endEncoding];

  v22 = [v9 computeCommandEncoder];
  unint64_t v23 = (void *)[(MTLLibrary *)self->mtlLibrary newFunctionWithName:@"invertVotingImage"];
  unint64_t v24 = self->mtlDevice;
  id v34 = v16;
  v25 = (void *)[(MTLDevice *)v24 newComputePipelineStateWithFunction:v23 error:&v34];
  id v26 = v34;

  if (v20) {
    [v22 setTexture:v20 atIndex:1];
  }
  if (v8) {
    [v22 setTexture:v8 atIndex:0];
  }
  [v22 setBuffer:v33 offset:0 atIndex:0];
  [v22 setComputePipelineState:v25];
  unint64_t v37 = v32;
  unint64_t v38 = v31;
  uint64_t v39 = 1;
  long long v35 = xmmword_1A410C2A0;
  uint64_t v36 = 1;
  [v22 dispatchThreadgroups:&v37 threadsPerThreadgroup:&v35];
  [v22 endEncoding];

  [v9 commit];
  [v9 waitUntilCompleted];
  id v27 = [v9 error];

  if (v27)
  {
    uint64_t v28 = [v9 error];
    id v29 = [v28 description];
    printf("  Metal command buffer error : %s\n", (const char *)[v29 UTF8String]);
  }
}

- (id)textureWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unint64_t)a5 usage:(unint64_t)a6
{
  id v8 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a5 width:a3 height:a4 mipmapped:0];
  [v8 setUsage:a6];
  v9 = (void *)[(MTLDevice *)self->mtlDevice newTextureWithDescriptor:v8];

  return v9;
}

- (id)textureWithPixelData:(vImage_Buffer *)a3 format:(unint64_t)a4
{
  v6 = (void *)[(MTLDevice *)self->mtlDevice newBufferWithBytes:a3->data length:a3->height * a3->rowBytes options:0];
  id v7 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a4 width:a3->width height:a3->height mipmapped:0];
  id v8 = (void *)[v6 newTextureWithDescriptor:v7 offset:0 bytesPerRow:a3->rowBytes];

  return v8;
}

- (id)textureFromCVPixelBuffer:(__CVBuffer *)a3
{
  return 0;
}

- (VNMetalInterface)init
{
  v15.receiver = self;
  v15.super_class = (Class)VNMetalInterface;
  v2 = [(VNMetalInterface *)&v15 init];
  if (v2)
  {
    v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    mtlDevice = v2->mtlDevice;
    v2->mtlDevice = v3;

    uint64_t v5 = [(MTLDevice *)v2->mtlDevice newCommandQueue];
    mtlCommandQueue = v2->mtlCommandQueue;
    v2->mtlCommandQueue = (MTLCommandQueue *)v5;

    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = [v7 bundlePath];
    v9 = [v8 stringByAppendingPathComponent:@"default.metallib"];

    if (v9)
    {
      uint64_t v10 = [(MTLDevice *)v2->mtlDevice newLibraryWithFile:v9 error:0];
      mtlLibrary = v2->mtlLibrary;
      v2->mtlLibrary = (MTLLibrary *)v10;
    }
    if (!v2->mtlLibrary)
    {
      uint64_t v12 = [(MTLDevice *)v2->mtlDevice newDefaultLibrary];
      v13 = v2->mtlLibrary;
      v2->mtlLibrary = (MTLLibrary *)v12;
    }
  }
  return v2;
}

@end