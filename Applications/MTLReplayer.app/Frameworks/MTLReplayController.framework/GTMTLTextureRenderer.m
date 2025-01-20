@interface GTMTLTextureRenderer
- (GTMTLTextureRenderer)initWithDevice:(id)a3;
- (id)getPipelineStateFromCache:(id)a3 withDescriptor:(id)a4 withFormat:(unint64_t)a5;
- (id)wrapLinear:(id)a3;
- (void)render:(id)a3 withEncoder:(id)a4 withFormat:(unint64_t)a5 renderTargetSize:(CGSize)a6 viewContentsScale:(double)a7;
- (void)renderOverlay:(id)a3 color:(unsigned int)a4 shrinkToFit:(BOOL)a5 withEncoder:(id)a6 withFormat:(unint64_t)a7 transform:(CATransform3D *)a8 anchor:(CGPoint)a9 bounds:(CGRect)a10 renderTargetSize:(CGSize)a11 viewContentsScale:(double)a12;
- (void)renderTexture:(id)a3 isDepthStencil:(BOOL)a4 shrinkToFit:(BOOL)a5 withEncoder:(id)a6 withFormat:(unint64_t)a7 transform:(CATransform3D *)a8 anchor:(CGPoint)a9 bounds:(CGRect)a10 renderTargetSize:(CGSize)a11 viewContentsScale:(double)a12;
@end

@implementation GTMTLTextureRenderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthStencilPipelines, 0);
  objc_storeStrong((id *)&self->_texturePipelines, 0);
  objc_storeStrong((id *)&self->_overlayPipelines, 0);
  objc_storeStrong((id *)&self->_depthStencilPipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_texturePipelineDescriptor, 0);
  objc_storeStrong((id *)&self->_overlayPipelineDescriptor, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)render:(id)a3 withEncoder:(id)a4 withFormat:(unint64_t)a5 renderTargetSize:(CGSize)a6 viewContentsScale:(double)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  id v14 = a4;
  unsigned int v15 = [v13 overlay];
  v16 = [v13 texture];
  if (v15)
  {
    id v17 = [v13 rgb];
    id v18 = [v13 shrinkToFit];
    if (v13) {
      [v13 transform];
    }
    else {
      memset(v38, 0, sizeof(v38));
    }
    [v13 anchor];
    double v22 = v21;
    double v24 = v23;
    [v13 bounds];
    -[GTMTLTextureRenderer renderOverlay:color:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:](self, "renderOverlay:color:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:", v16, v17, v18, v14, a5, v38, v22, v24, v25, v26, v27, v28, width, height, *(void *)&a7);
  }
  else
  {
    id v19 = [v13 depthStencil];
    id v20 = [v13 shrinkToFit];
    if (v13) {
      [v13 transform];
    }
    else {
      memset(v37, 0, sizeof(v37));
    }
    [v13 anchor];
    double v30 = v29;
    double v32 = v31;
    [v13 bounds];
    -[GTMTLTextureRenderer renderTexture:isDepthStencil:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:](self, "renderTexture:isDepthStencil:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:", v16, v19, v20, v14, a5, v37, v30, v32, v33, v34, v35, v36, width, height, *(void *)&a7);
  }
}

- (void)renderTexture:(id)a3 isDepthStencil:(BOOL)a4 shrinkToFit:(BOOL)a5 withEncoder:(id)a6 withFormat:(unint64_t)a7 transform:(CATransform3D *)a8 anchor:(CGPoint)a9 bounds:(CGRect)a10 renderTargetSize:(CGSize)a11 viewContentsScale:(double)a12
{
  BOOL v15 = a5;
  BOOL v16 = a4;
  double height = a11.height;
  double width = a11.width;
  CGFloat v19 = a10.size.height;
  CGFloat v20 = a10.size.width;
  CGFloat y = a10.origin.y;
  CGFloat x = a10.origin.x;
  CGFloat v23 = a9.y;
  CGFloat v24 = a9.x;
  id v26 = a3;
  id v27 = a6;
  if (v26)
  {
    uint64_t v28 = 48;
    if (v16) {
      uint64_t v28 = 56;
    }
    uint64_t v29 = 24;
    if (v16) {
      uint64_t v29 = 32;
    }
    double v30 = [(GTMTLTextureRenderer *)self getPipelineStateFromCache:*(Class *)((char *)&self->super.isa + v28) withDescriptor:*(Class *)((char *)&self->super.isa + v29) withFormat:a7];
    memset(v49, 0, sizeof(v49));
    id v31 = [v26 width];
    id v32 = [v26 height];
    long long v33 = *(_OWORD *)&a8->m33;
    long long v45 = *(_OWORD *)&a8->m31;
    long long v46 = v33;
    long long v34 = *(_OWORD *)&a8->m43;
    long long v47 = *(_OWORD *)&a8->m41;
    long long v48 = v34;
    long long v35 = *(_OWORD *)&a8->m13;
    v42[0] = *(_OWORD *)&a8->m11;
    v42[1] = v35;
    long long v37 = *(_OWORD *)&a8->m23;
    long long v43 = *(_OWORD *)&a8->m21;
    v36.f64[1] = *((float64_t *)&v43 + 1);
    long long v44 = v37;
    v36.f64[0] = v24;
    v38.f64[0] = x;
    v39.f64[0] = v20;
    v41 = -[GTMTLTextureRenderer wrapLinear:](self, "wrapLinear:", v26, GetTextureRendererUniform((uint64_t)v49, (float64_t *)v42, v15, (uint64_t)v31, (uint64_t)v32, v36, v23, v38, y, v39, v19, a12, v40, width, height));
    [v27 setVertexBytes:v49 length:112 atIndex:0];
    [v27 setRenderPipelineState:v30];
    [v27 setFragmentTexture:v41 atIndex:0];
    [v27 drawPrimitives:4 vertexStart:0 vertexCount:4];
  }
}

- (void)renderOverlay:(id)a3 color:(unsigned int)a4 shrinkToFit:(BOOL)a5 withEncoder:(id)a6 withFormat:(unint64_t)a7 transform:(CATransform3D *)a8 anchor:(CGPoint)a9 bounds:(CGRect)a10 renderTargetSize:(CGSize)a11 viewContentsScale:(double)a12
{
  if (a3)
  {
    BOOL v14 = a5;
    double height = a11.height;
    double width = a11.width;
    CGFloat v17 = a10.size.height;
    CGFloat v18 = a10.size.width;
    CGFloat y = a10.origin.y;
    CGFloat x = a10.origin.x;
    CGFloat v21 = a9.y;
    CGFloat v22 = a9.x;
    float32x4_t v49 = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(a4), (int8x16_t)xmmword_4C7F80)), (float32x4_t)xmmword_4C7F90);
    overlayPipelines = self->_overlayPipelines;
    overlayPipelineDescriptor = self->_overlayPipelineDescriptor;
    id v27 = a6;
    id v28 = a3;
    uint64_t v29 = [(GTMTLTextureRenderer *)self getPipelineStateFromCache:overlayPipelines withDescriptor:overlayPipelineDescriptor withFormat:a7];
    memset(v48, 0, sizeof(v48));
    id v30 = [v28 width];
    id v31 = [v28 height];
    long long v32 = *(_OWORD *)&a8->m33;
    long long v44 = *(_OWORD *)&a8->m31;
    long long v45 = v32;
    long long v33 = *(_OWORD *)&a8->m43;
    long long v46 = *(_OWORD *)&a8->m41;
    long long v47 = v33;
    long long v34 = *(_OWORD *)&a8->m13;
    v41[0] = *(_OWORD *)&a8->m11;
    v41[1] = v34;
    long long v36 = *(_OWORD *)&a8->m23;
    long long v42 = *(_OWORD *)&a8->m21;
    v35.f64[1] = *((float64_t *)&v42 + 1);
    long long v43 = v36;
    v35.f64[0] = v22;
    v37.f64[0] = x;
    v38.f64[0] = v18;
    double v40 = -[GTMTLTextureRenderer wrapLinear:](self, "wrapLinear:", v28, GetTextureRendererUniform((uint64_t)v48, (float64_t *)v41, v14, (uint64_t)v30, (uint64_t)v31, v35, v21, v37, y, v38, v17, a12, v39, width, height));

    [v27 setVertexBytes:v48 length:112 atIndex:0];
    [v27 setRenderPipelineState:v29];
    [v27 setFragmentTexture:v40 atIndex:0];
    [v27 setFragmentBytes:&v49 length:16 atIndex:0];
    [v27 drawPrimitives:4 vertexStart:0 vertexCount:4];
  }
}

- (id)wrapLinear:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 pixelFormat];
  if ((uint64_t)v4 > 551)
  {
    if (v4 == (char *)&stru_1F8.offset)
    {
      uint64_t v6 = 553;
    }
    else
    {
      id v5 = v3;
      if (v4 != (unsigned char *)&stru_1F8.offset + 2) {
        goto LABEL_11;
      }
      uint64_t v6 = 555;
    }
  }
  else if (v4 == (unsigned char *)&stru_20.vmsize + 6)
  {
    uint64_t v6 = 71;
  }
  else
  {
    id v5 = v3;
    if (v4 != (char *)&stru_20.filesize) {
      goto LABEL_11;
    }
    uint64_t v6 = 81;
  }
  id v5 = [v3 newTextureViewWithPixelFormat:v6];

LABEL_11:

  return v5;
}

- (id)getPipelineStateFromCache:(id)a3 withDescriptor:(id)a4 withFormat:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[NSNumber numberWithUnsignedInteger:a5];
  id v11 = [v8 objectForKeyedSubscript:v10];

  if (!v11)
  {
    v12 = [v9 colorAttachments];
    id v13 = [v12 objectAtIndexedSubscript:0];
    [v13 setPixelFormat:a5];

    device = self->_device;
    uint64_t v17 = 0;
    id v11 = [(MTLDevice *)device newRenderPipelineStateWithDescriptor:v9 error:&v17];
    BOOL v15 = +[NSNumber numberWithUnsignedInteger:a5];
    [v8 setObject:v11 forKeyedSubscript:v15];
  }

  return v11;
}

- (GTMTLTextureRenderer)initWithDevice:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GTMTLTextureRenderer;
  uint64_t v6 = [(GTMTLTextureRenderer *)&v28 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    overlayPipelines = v6->_overlayPipelines;
    v6->_overlayPipelines = v7;

    id v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    texturePipelines = v6->_texturePipelines;
    v6->_texturePipelines = v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    depthStencilPipelines = v6->_depthStencilPipelines;
    v6->_depthStencilPipelines = v11;

    objc_storeStrong((id *)&v6->_device, a3);
    id v13 = GTMTLReplayController_defaultLibrary(v5);
    id v14 = [v13 newFunctionWithName:@"FullscreenVertex"];
    id v15 = [v13 newFunctionWithName:@"FullscreenFragmentOverlay"];
    id v16 = [v13 newFunctionWithName:@"FullscreenFragmentTexture"];
    id v17 = [v13 newFunctionWithName:@"FullscreenFragmentDepthStencil"];
    CGFloat v18 = (MTLRenderPipelineDescriptor *)objc_alloc_init((Class)MTLRenderPipelineDescriptor);
    overlayPipelineDescriptor = v6->_overlayPipelineDescriptor;
    v6->_overlayPipelineDescriptor = v18;

    [(MTLRenderPipelineDescriptor *)v6->_overlayPipelineDescriptor setVertexFunction:v14];
    [(MTLRenderPipelineDescriptor *)v6->_overlayPipelineDescriptor setFragmentFunction:v15];
    CGFloat v20 = [(MTLRenderPipelineDescriptor *)v6->_overlayPipelineDescriptor colorAttachments];
    CGFloat v21 = [v20 objectAtIndexedSubscript:0];

    [v21 setBlendingEnabled:1];
    [v21 setSourceRGBBlendFactor:1];
    [v21 setRgbBlendOperation:0];
    [v21 setDestinationRGBBlendFactor:5];

    CGFloat v22 = (MTLRenderPipelineDescriptor *)objc_alloc_init((Class)MTLRenderPipelineDescriptor);
    texturePipelineDescriptor = v6->_texturePipelineDescriptor;
    v6->_texturePipelineDescriptor = v22;

    [(MTLRenderPipelineDescriptor *)v6->_texturePipelineDescriptor setVertexFunction:v14];
    [(MTLRenderPipelineDescriptor *)v6->_texturePipelineDescriptor setFragmentFunction:v16];
    CGFloat v24 = (MTLRenderPipelineDescriptor *)objc_alloc_init((Class)MTLRenderPipelineDescriptor);
    depthStencilPipelineDescriptor = v6->_depthStencilPipelineDescriptor;
    v6->_depthStencilPipelineDescriptor = v24;

    [(MTLRenderPipelineDescriptor *)v6->_depthStencilPipelineDescriptor setVertexFunction:v14];
    [(MTLRenderPipelineDescriptor *)v6->_depthStencilPipelineDescriptor setFragmentFunction:v17];
    id v26 = v6;
  }
  return v6;
}

@end