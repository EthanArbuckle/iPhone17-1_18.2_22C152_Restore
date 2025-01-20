@interface CVAFilterHybridResampling
+ (void)prewarmScaler:(id)a3 device:(id)a4 commandBuffer:(id)a5;
- (CVAFilterHybridResampling)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 commandQueue:(id)a6 error:(id *)a7;
- (MPSImageLanczosScale)scaler;
- (NSString)label;
- (void)encodeBilinearScalingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 mode:(int64_t)a6;
- (void)encodeHybridDownsamplingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5;
@end

@implementation CVAFilterHybridResampling

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_linearResamplerOneComponent, 0);
  objc_storeStrong((id *)&self->_halfDownSamplerOneComponent, 0);
  objc_storeStrong((id *)&self->_doubleUpsamplerOneComponent, 0);
  objc_storeStrong((id *)&self->_linearResampler, 0);
  objc_storeStrong((id *)&self->_halfDownSampler, 0);
  objc_storeStrong((id *)&self->_doubleUpsampler, 0);
  objc_storeStrong((id *)&self->_hybridDownsamplingIntermediateR8Texture, 0);
  objc_storeStrong((id *)&self->_hybridDownsamplingIntermediateR16Texture, 0);
  objc_storeStrong((id *)&self->_hybridDownsamplingIntermediateR32Texture, 0);
  objc_storeStrong((id *)&self->_hybridDownsamplingIntermediateTexture, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (MPSImageLanczosScale)scaler
{
  return (MPSImageLanczosScale *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)encodeBilinearScalingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 mode:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 width];
  uint64_t v14 = [v12 height];
  v15 = [v10 computeCommandEncoder];
  switch(a6)
  {
    case 2:
      if ([v11 pixelFormat] == 125 || objc_msgSend(v11, "pixelFormat") == 115)
      {
        [v15 setLabel:@"_linearResampler"];
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__linearResampler;
      }
      else
      {
        [v15 setLabel:@"_linearResamplerOneComponent"];
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__linearResamplerOneComponent;
      }
      goto LABEL_16;
    case 1:
      if ([v11 pixelFormat] == 125 || objc_msgSend(v11, "pixelFormat") == 115)
      {
        [v15 setLabel:@"_halfDownSampler"];
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__halfDownSampler;
      }
      else
      {
        [v15 setLabel:@"_halfDownSamplerOneComponent"];
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__halfDownSamplerOneComponent;
      }
      goto LABEL_16;
    case 0:
      if ([v11 pixelFormat] == 125 || objc_msgSend(v11, "pixelFormat") == 115)
      {
        [v15 setLabel:@"_doubleUpsampler"];
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__doubleUpsampler;
      }
      else
      {
        [v15 setLabel:@"_doubleUpsamplerOneComponent"];
        v16 = &OBJC_IVAR___CVAFilterHybridResampling__doubleUpsamplerOneComponent;
      }
LABEL_16:
      [v15 setComputePipelineState:*(Class *)((char *)&self->super.super.isa + *v16)];
      break;
  }
  [v15 setTexture:v11 atIndex:0];
  [v15 setTexture:v12 atIndex:1];
  v19[0] = (unint64_t)(v13 + 15) >> 4;
  v19[1] = (unint64_t)(v14 + 15) >> 4;
  v19[2] = 1;
  uint64_t v18 = 1;
  long long v17 = xmmword_1BA86C930;
  [v15 dispatchThreadgroups:v19 threadsPerThreadgroup:&v17];
  [v15 endEncoding];
}

- (void)encodeHybridDownsamplingToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5
{
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  p_hybridDownsamplingIntermediateR32Texture = (id *)&self->_hybridDownsamplingIntermediateR32Texture;
  if (!self->_hybridDownsamplingIntermediateR32Texture)
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, (unint64_t)objc_msgSend(v8, "width") >> 1, (unint64_t)objc_msgSend(v8, "height") >> 1, 0);
    [v11 setUsage:3];
    uint64_t v12 = [(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v11];

    id v13 = *p_hybridDownsamplingIntermediateR32Texture;
    id *p_hybridDownsamplingIntermediateR32Texture = (id)v12;

    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, (unint64_t)objc_msgSend(v8, "width") >> 1, (unint64_t)objc_msgSend(v8, "height") >> 1, 0);
    [v14 setUsage:3];
    v15 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v14];

    hybridDownsamplingIntermediateR16Texture = self->_hybridDownsamplingIntermediateR16Texture;
    self->_hybridDownsamplingIntermediateR16Texture = v15;

    long long v17 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, (unint64_t)objc_msgSend(v8, "width") >> 1, (unint64_t)objc_msgSend(v8, "height") >> 1, 0);
    [v17 setUsage:3];
    uint64_t v18 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v17];

    hybridDownsamplingIntermediateR8Texture = self->_hybridDownsamplingIntermediateR8Texture;
    self->_hybridDownsamplingIntermediateR8Texture = v18;

    v20 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, (unint64_t)objc_msgSend(v8, "width") >> 1, (unint64_t)objc_msgSend(v8, "height") >> 1, 0);
    [v20 setUsage:3];
    v21 = (MTLTexture *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v20];

    hybridDownsamplingIntermediateTexture = self->_hybridDownsamplingIntermediateTexture;
    self->_hybridDownsamplingIntermediateTexture = v21;
  }
  if ([v8 pixelFormat] != 55)
  {
    if ([v8 pixelFormat] == 25)
    {
      v23 = &OBJC_IVAR___CVAFilterHybridResampling__hybridDownsamplingIntermediateR16Texture;
    }
    else
    {
      uint64_t v24 = [v8 pixelFormat];
      v23 = &OBJC_IVAR___CVAFilterHybridResampling__hybridDownsamplingIntermediateTexture;
      if (v24 == 10) {
        v23 = &OBJC_IVAR___CVAFilterHybridResampling__hybridDownsamplingIntermediateR8Texture;
      }
    }
    p_hybridDownsamplingIntermediateR32Texture = (id *)((char *)&self->super.super.isa + *v23);
  }
  id v25 = *p_hybridDownsamplingIntermediateR32Texture;
  [(CVAFilterHybridResampling *)self encodeBilinearScalingToCommandBuffer:v26 source:v8 destination:v25 mode:1];
  [(MPSImageLanczosScale *)self->_scaler encodeToCommandBuffer:v26 sourceTexture:v25 destinationTexture:v9];
}

- (CVAFilterHybridResampling)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 commandQueue:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v27.receiver = self;
  v27.super_class = (Class)CVAFilterHybridResampling;
  long long v17 = [(ImageSaverRegistrator *)&v27 init];
  if (v17)
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    label = v17->_label;
    v17->_label = (NSString *)v19;

    p_device = &v17->_device;
    objc_storeStrong((id *)&v17->_device, a3);
    sub_1BA8328CC((void **)&v17->_doubleUpsampler, v14, v15, v17->_device, @"doubleUpsample", a7, 0);
    sub_1BA8328CC((void **)&v17->_halfDownSampler, v14, v15, v17->_device, @"halfDownsample", a7, 0);
    sub_1BA8328CC((void **)&v17->_linearResampler, v14, v15, v17->_device, @"linearResample", a7, 0);
    sub_1BA8328CC((void **)&v17->_doubleUpsamplerOneComponent, v14, v15, v17->_device, @"doubleUpsampleOneComponent", a7, 0);
    sub_1BA8328CC((void **)&v17->_halfDownSamplerOneComponent, v14, v15, v17->_device, @"halfDownsampleOneComponent", a7, 0);
    sub_1BA8328CC((void **)&v17->_linearResamplerOneComponent, v14, v15, v17->_device, @"linearResampleOneComponent", a7, 0);
    if (!sub_1BA84F794(@"harvesting.enabled", @"com.apple.coremedia", 0))
    {
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F355C0]) initWithDevice:*p_device];
      scaler = v17->_scaler;
      v17->_scaler = (MPSImageLanczosScale *)v22;

      [(MPSImageLanczosScale *)v17->_scaler setEdgeMode:1];
      uint64_t v24 = [v16 commandBuffer];
      [v24 setLabel:@"MPSImageLanczosScale"];
      +[CVAFilterHybridResampling prewarmScaler:v17->_scaler device:*p_device commandBuffer:v24];
      [v24 commit];
    }
    id v25 = v17;
  }

  return v17;
}

+ (void)prewarmScaler:(id)a3 device:(id)a4 commandBuffer:(id)a5
{
  id v25 = a3;
  id v7 = a4;
  id v24 = a5;
  v23 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:72 height:54 mipmapped:0];
  id v8 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:30 width:36 height:27 mipmapped:0];
  id v9 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:16 height:12 mipmapped:0];
  id v10 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:30 width:8 height:6 mipmapped:0];
  id v11 = (void *)[v7 newTextureWithDescriptor:v23];
  uint64_t v12 = (void *)[v7 newTextureWithDescriptor:v8];
  [v9 setUsage:3];
  id v13 = (void *)[v7 newTextureWithDescriptor:v9];
  [v10 setUsage:3];
  id v14 = (void *)[v7 newTextureWithDescriptor:v10];
  [v25 encodeToCommandBuffer:v24 sourceTexture:v11 destinationTexture:v13];
  [v25 encodeToCommandBuffer:v24 sourceTexture:v12 destinationTexture:v14];

  id v15 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:115 width:16 height:12 mipmapped:0];
  id v16 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:115 width:36 height:27 mipmapped:0];
  [v16 setUsage:3];
  long long v17 = (void *)[v7 newTextureWithDescriptor:v15];
  uint64_t v18 = (void *)[v7 newTextureWithDescriptor:v16];
  [v25 encodeToCommandBuffer:v24 sourceTexture:v17 destinationTexture:v18];

  uint64_t v19 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:16 height:12 mipmapped:0];
  v20 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:36 height:27 mipmapped:0];
  [v20 setUsage:3];
  v21 = (void *)[v7 newTextureWithDescriptor:v19];
  uint64_t v22 = (void *)[v7 newTextureWithDescriptor:v20];
  [v25 encodeToCommandBuffer:v24 sourceTexture:v21 destinationTexture:v22];
}

@end