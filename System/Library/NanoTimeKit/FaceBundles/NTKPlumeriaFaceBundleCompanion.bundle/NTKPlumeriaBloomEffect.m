@interface NTKPlumeriaBloomEffect
- (NTKPlumeriaBloomEffect)init;
- (double)maxIterations;
- (id)bloom:(id)a3 commandBuffer:(id)a4;
- (void)initShader:(id)a3 metalLibrary:(id)a4 width:(int)a5 height:(int)a6;
- (void)setMaxIterations:(double)a3;
@end

@implementation NTKPlumeriaBloomEffect

- (NTKPlumeriaBloomEffect)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKPlumeriaBloomEffect;
  v2 = [(NTKPlumeriaBloomEffect *)&v7 init];
  v3 = v2;
  if (v2)
  {
    device = v2->_device;
    v2->_device = 0;

    library = v3->_library;
    v3->_library = 0;

    *(void *)&v3->_width = 0;
    v3->_maxIterations = 8.0;
  }
  return v3;
}

- (void)initShader:(id)a3 metalLibrary:(id)a4 width:(int)a5 height:(int)a6
{
  v10 = (MTLDevice *)a3;
  v11 = (MTLLibrary *)a4;
  device = self->_device;
  self->_device = v10;
  v13 = v10;

  library = self->_library;
  self->_library = v11;
  v15 = v11;

  self->_width = a5;
  self->_height = a6;
  id v33 = [(MTLLibrary *)self->_library newFunctionWithName:@"screenTriangleVertex"];
  id v16 = [(MTLLibrary *)self->_library newFunctionWithName:@"bloom::initialDownsampleFragment"];
  id v17 = [(MTLLibrary *)self->_library newFunctionWithName:@"bloom::downsampleFragment"];
  id v18 = [(MTLLibrary *)self->_library newFunctionWithName:@"bloom::upsampleFragment"];
  v19 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:92 width:self->_width height:self->_height mipmapped:1];
  [v19 setUsage:5];
  [v19 setStorageMode:2];
  v20 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v19];
  scratchTexture = self->_scratchTexture;
  self->_scratchTexture = v20;

  v22 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v19];
  outTexture = self->_outTexture;
  self->_outTexture = v22;

  id v24 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  v25 = [v24 colorAttachments];
  v26 = [v25 objectAtIndexedSubscript:0];

  objc_msgSend(v26, "setPixelFormat:", objc_msgSend(v19, "pixelFormat"));
  [v26 setBlendingEnabled:0];
  [v24 setVertexFunction:v33];
  [v24 setFragmentFunction:v16];
  v27 = (MTLRenderPipelineState *)[(MTLDevice *)self->_device newRenderPipelineStateWithDescriptor:v24 error:0];
  initialDownsamplePipeline = self->_initialDownsamplePipeline;
  self->_initialDownsamplePipeline = v27;

  [v24 setFragmentFunction:v17];
  v29 = (MTLRenderPipelineState *)[(MTLDevice *)self->_device newRenderPipelineStateWithDescriptor:v24 error:0];
  downsamplepipeline = self->_downsamplepipeline;
  self->_downsamplepipeline = v29;

  [v24 setFragmentFunction:v18];
  v31 = (MTLRenderPipelineState *)[(MTLDevice *)self->_device newRenderPipelineStateWithDescriptor:v24 error:0];
  upsamplePipeline = self->_upsamplePipeline;
  self->_upsamplePipeline = v31;
}

- (id)bloom:(id)a3 commandBuffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 pushDebugGroup:@"bloom"];
  int maxIterations = (int)self->_maxIterations;
  v9 = self->_outTexture;
  signed int v10 = [(MTLTexture *)v9 width];
  signed int v11 = [(MTLTexture *)v9 height];

  if (v10 <= v11) {
    int v12 = v11;
  }
  else {
    int v12 = v10;
  }
  float v13 = fmax((float)v12, 1.0);
  int v14 = (int)(float)(floorf(log2f(v13)) + 1.0) - 3;
  if (v14 >= maxIterations) {
    int v14 = maxIterations;
  }
  if (v14 <= 2) {
    int v15 = 2;
  }
  else {
    int v15 = v14;
  }
  v31 = sub_6EC8(self->_scratchTexture, 0);
  id v16 = objc_msgSend(v7, "renderCommandEncoderWithDescriptor:");
  [v16 setRenderPipelineState:self->_initialDownsamplePipeline];
  [v16 setLabel:@"initial downsample"];
  v32 = v6;
  [v16 setFragmentTexture:v6 atIndex:0];
  [v16 drawPrimitives:3 vertexStart:0 vertexCount:3];
  v30 = v16;
  [v16 endEncoding];
  uint64_t v17 = 1;
  do
  {
    id v18 = sub_6EC8(self->_scratchTexture, v17);
    v19 = [v7 renderCommandEncoderWithDescriptor:v18];

    [v19 setRenderPipelineState:self->_downsamplepipeline];
    v20 = +[NSString stringWithFormat:@"down %d", v17];
    [v19 setLabel:v20];

    [v19 setFragmentTexture:self->_scratchTexture atIndex:0];
    __int16 v34 = v17 - 1;
    [v19 setFragmentBytes:&v34 length:2 atIndex:0];
    [v19 drawPrimitives:3 vertexStart:0 vertexCount:3];
    [v19 endEncoding];

    uint64_t v17 = (v17 + 1);
  }
  while (v15 != v17);
  int v21 = 0;
  int v22 = v15 - 1;
  do
  {
    int v23 = v22 - 1;
    id v24 = sub_6EC8(self->_outTexture, v22 - 1);
    v25 = [v7 renderCommandEncoderWithDescriptor:v24];

    [v25 setRenderPipelineState:self->_upsamplePipeline];
    v26 = +[NSString stringWithFormat:@"up %d", (v22 - 1)];
    [v25 setLabel:v26];

    uint64_t v27 = 64;
    if (!v21) {
      uint64_t v27 = 56;
    }
    [v25 setFragmentTexture:*(Class *)((char *)&self->super.isa + v27) atIndex:0];
    [v25 setFragmentTexture:self->_scratchTexture atIndex:1];
    __int16 v33 = v22;
    [v25 setFragmentBytes:&v33 length:2 atIndex:0];
    [v25 drawPrimitives:3 vertexStart:0 vertexCount:3];
    [v25 endEncoding];

    ++v21;
    --v22;
  }
  while (v23 > 0);
  [v7 popDebugGroup];
  v28 = self->_outTexture;

  return v28;
}

- (double)maxIterations
{
  return self->_maxIterations;
}

- (void)setMaxIterations:(double)a3
{
  self->_int maxIterations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outTexture, 0);
  objc_storeStrong((id *)&self->_scratchTexture, 0);
  objc_storeStrong((id *)&self->_upsamplePipeline, 0);
  objc_storeStrong((id *)&self->_downsamplepipeline, 0);
  objc_storeStrong((id *)&self->_initialDownsamplePipeline, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end