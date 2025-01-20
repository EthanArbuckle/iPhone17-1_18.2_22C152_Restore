@interface BWInferenceFusionTrackerMeanPixelCalculator
- (BWInferenceFusionTrackerMeanPixelCalculator)initWithCommandQueue:(id)a3;
- (void)asyncMeanPixelForBuffer:(__CVBuffer *)a3 completionHandler:(id)a4;
- (void)dealloc;
@end

@implementation BWInferenceFusionTrackerMeanPixelCalculator

- (BWInferenceFusionTrackerMeanPixelCalculator)initWithCommandQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceFusionTrackerMeanPixelCalculator;
  v4 = [(BWInferenceFusionTrackerMeanPixelCalculator *)&v6 init];
  if (v4)
  {
    v4->_commandQueue = (MTLCommandQueue *)a3;
    v4->_meanFilter = (MPSImageStatisticsMean *)objc_msgSend(objc_alloc((Class)getMPSImageStatisticsMeanClass()), "initWithDevice:", -[MTLCommandQueue device](v4->_commandQueue, "device"));
    v4->_meanTexture = (MTLTexture *)objc_msgSend((id)-[MTLCommandQueue device](v4->_commandQueue, "device"), "newTextureWithDescriptor:", objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, 1, 1, 0));
  }
  return v4;
}

- (void)asyncMeanPixelForBuffer:(__CVBuffer *)a3 completionHandler:(id)a4
{
  v7 = (void *)MEMORY[0x1E4F35330];
  size_t Width = CVPixelBufferGetWidth(a3);
  v9 = (void *)[v7 texture2DDescriptorWithPixelFormat:80 width:Width height:CVPixelBufferGetHeight(a3) mipmapped:0];
  [v9 setUsage:1];
  v10 = objc_msgSend((id)-[MTLCommandQueue device](self->_commandQueue, "device"), "newTextureWithDescriptor:iosurface:plane:", v9, CVPixelBufferGetIOSurface(a3), 0);
  v11 = (void *)[(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [(MPSImageStatisticsMean *)self->_meanFilter encodeToCommandBuffer:v11 sourceTexture:v10 destinationTexture:self->_meanTexture];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__BWInferenceFusionTrackerMeanPixelCalculator_asyncMeanPixelForBuffer_completionHandler___block_invoke;
  v12[3] = &unk_1E5C26430;
  v12[4] = self;
  v12[5] = a4;
  [v11 addCompletedHandler:v12];
  [v11 commit];
}

uint64_t __89__BWInferenceFusionTrackerMeanPixelCalculator_asyncMeanPixelForBuffer_completionHandler___block_invoke(uint64_t a1)
{
  int v7 = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  memset(v4, 0, sizeof(v4));
  int64x2_t v5 = vdupq_n_s64(1uLL);
  uint64_t v6 = 1;
  [v2 getBytes:&v7 bytesPerRow:4 fromRegion:v4 mipmapLevel:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceFusionTrackerMeanPixelCalculator;
  [(BWInferenceFusionTrackerMeanPixelCalculator *)&v3 dealloc];
}

@end