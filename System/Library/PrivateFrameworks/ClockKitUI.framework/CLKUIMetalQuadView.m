@interface CLKUIMetalQuadView
+ (id)allocateDepthTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 sampleCount:(unint64_t)a5;
+ (id)allocateMsaaTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6;
- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor;
- (BOOL)_displayAndCheckForDrawable:(BOOL)a3 renderDiscontinuity:(BOOL)a4 withCompletion:(id)a5;
- (BOOL)_shouldApplyAPLFilter;
- (BOOL)isSnapshotting;
- (BOOL)prewarmWithCompletion:(id)a3;
- (CGSize)drawableSize;
- (CLKUIMetalQuadView)initWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 colorSpace:(int64_t)a6;
- (CLKUIMetalQuadView)initWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 colorSpace:(int64_t)a6 asyncRenderQueue:(id)a7;
- (float)aplFilterAmount;
- (float)computeAPL;
- (float)computeAPLAndSnapshot:(id *)a3;
- (float)maxAPL;
- (id)_getDimmingPipelineState;
- (id)_newRenderPassDescriptor;
- (id)_snapshotTextureInRect:(CGRect)a3 scale:(double)a4 time:(double)a5 withAdditionalPasses:(id)a6;
- (id)_textureToImage:(id)a3 scale:(double)a4;
- (id)metalLayer;
- (id)snapshotInRect:(CGRect)a3 scale:(double)a4 time:(double)a5;
- (id)snapshotTextureInRect:(CGRect)a3 scale:(double)a4 time:(double)a5;
- (unint64_t)_msaaCount;
- (unint64_t)colorPixelFormat;
- (void)_handleQuadArrayChange:(id)a3;
- (void)_renderQuads:(id)a3 toScreenWithCommandBuffer:(id)a4 passDescriptor:(id)a5;
- (void)_updateDrawableSizeIfNecessary;
- (void)_updateFramebufferOnly;
- (void)dealloc;
- (void)discardContents;
- (void)layoutSubviews;
- (void)setAplFilterAmount:(float)a3;
- (void)setClearColor:(id)a3;
- (void)setMaxAPL:(float)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setSingleBufferMode:(BOOL)a3;
- (void)snapshotAndFreeze;
@end

@implementation CLKUIMetalQuadView

- (CLKUIMetalQuadView)initWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 colorSpace:(int64_t)a6
{
  return -[CLKUIMetalQuadView initWithFrame:identifier:options:colorSpace:asyncRenderQueue:](self, "initWithFrame:identifier:options:colorSpace:asyncRenderQueue:", a4, a5, a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CLKUIMetalQuadView)initWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 colorSpace:(int64_t)a6 asyncRenderQueue:(id)a7
{
  unsigned int v8 = a5;
  v39.receiver = self;
  v39.super_class = (Class)CLKUIMetalQuadView;
  v9 = -[CLKUIQuadView initWithFrame:identifier:options:asyncRenderQueue:](&v39, sel_initWithFrame_identifier_options_asyncRenderQueue_, a4, a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    if ((unint64_t)(a6 - 1) > 3) {
      uint64_t v11 = 81;
    }
    else {
      uint64_t v11 = qword_1D31B6980[a6 - 1];
    }
    v9->_colorPixelFormat = v11;
    v9->_maxAPL = 1.0;
    v9->_aplFilterAmount = 0.0;
    if ((v8 & 8) != 0) {
      uint64_t v12 = [(CLKUIMetalQuadView *)v9 _msaaCount];
    }
    else {
      uint64_t v12 = 1;
    }
    v10->_msaaCount = v12;
    *((unsigned char *)v10 + 552) = *((unsigned char *)v10 + 552) & 0xFE | v8 & 1;
    *((unsigned char *)v10 + 552) = *((unsigned char *)v10 + 552) & 0xF7 | (v8 >> 2) & 8;
    *((unsigned char *)v10 + 552) = *((unsigned char *)v10 + 552) & 0xDF | (v8 >> 1) & 0x20;
    *((unsigned char *)v10 + 552) = *((unsigned char *)v10 + 552) & 0xBF | (v8 >> 2) & 0x40;
    *((unsigned char *)v10 + 552) = v8 & 0x80 | *((unsigned char *)v10 + 552) & 0x7F;
    *((unsigned char *)v10 + 552) = *((unsigned char *)v10 + 552) & 0xFD | v8 & 2;
    *((unsigned char *)v10 + 552) = *((unsigned char *)v10 + 552) & 0xFB | (v8 >> 2) & 4;
    if (*((unsigned char *)v10 + 552))
    {
      v13 = objc_opt_new();
      [v13 setDepthCompareFunction:3];
      [v13 setDepthWriteEnabled:1];
      v14 = +[CLKUIMetalResourceManager sharedDevice];
      uint64_t v15 = [v14 newDepthStencilStateWithDescriptor:v13];
      depthStencilState = v10->_depthStencilState;
      v10->_depthStencilState = (MTLDepthStencilState *)v15;
    }
    v17 = (CAMetalLayer *)objc_alloc_init(MEMORY[0x1E4F39C20]);
    if ((*((unsigned char *)v10 + 552) & 4) != 0)
    {
      v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v18 scale];
      double v21 = v22;
    }
    else
    {
      v18 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      v19 = [v18 device];
      [v19 screenScale];
      double v21 = v20;
    }
    [(CAMetalLayer *)v17 setContentsScale:v21];
    v23 = +[CLKUIMetalResourceManager sharedDevice];
    [(CAMetalLayer *)v17 setDevice:v23];

    [(CAMetalLayer *)v17 setPixelFormat:v10->_colorPixelFormat];
    uint64_t v24 = 4;
    if ((*((unsigned char *)v10 + 552) & 0x20) != 0) {
      uint64_t v24 = 5;
    }
    if ((*((unsigned char *)v10 + 552) & 0x40) != 0) {
      uint64_t v25 = v24 | 2;
    }
    else {
      uint64_t v25 = v24;
    }
    [(CAMetalLayer *)v17 setFramebufferOnly:(*((unsigned char *)v10 + 552) & 0x40 | *((unsigned char *)v10 + 552) & 0x20) == 0];
    [(CAMetalLayer *)v17 setTextureUsage:v25];
    [(CAMetalLayer *)v17 setFenceEnabled:1];
    [(CAMetalLayer *)v17 setPresentsWithTransaction:(*((unsigned __int8 *)v10 + 552) >> 1) & 1];
    if (*((char *)v10 + 552) < 0) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = 3;
    }
    [(CAMetalLayer *)v17 setMaximumDrawableCount:v26];
    [(CAMetalLayer *)v17 setDrawsAsynchronously:1];
    [(CAMetalLayer *)v17 setAllowsDisplayCompositing:0];
    [(CAMetalLayer *)v17 setOpaque:1];
    metalLayer = v10->_metalLayer;
    v10->_metalLayer = v17;
    v28 = v17;

    v29 = v10->_metalLayer;
    [(CLKUIMetalQuadView *)v10 bounds];
    -[CAMetalLayer setFrame:](v29, "setFrame:");
    v30 = [(CLKUIMetalQuadView *)v10 layer];
    [v30 addSublayer:v28];

    uint64_t v31 = +[CLKUIMetalResourceManager sharedCommandQueue];
    commandQueue = v10->_commandQueue;
    v10->_commandQueue = (MTLCommandQueue *)v31;

    uint64_t v33 = [(CLKUIMetalQuadView *)v10 _newRenderPassDescriptor];
    renderPassDescriptor = v10->_renderPassDescriptor;
    v10->_renderPassDescriptor = (MTLRenderPassDescriptor *)v33;

    *((unsigned char *)v10 + 552) |= 0x10u;
    id v35 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(CLKUIMetalQuadView *)v10 bounds];
    uint64_t v36 = objc_msgSend(v35, "initWithFrame:");
    snapshotView = v10->_snapshotView;
    v10->_snapshotView = (UIImageView *)v36;

    [(CLKUIMetalQuadView *)v10 addSubview:v10->_snapshotView];
    [(UIImageView *)v10->_snapshotView setHidden:1];
  }
  return v10;
}

+ (id)allocateDepthTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 sampleCount:(unint64_t)a5
{
  v5 = 0;
  if (a3 && a4)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F35330]);
    v10 = v9;
    if (a5 >= 2) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = 2;
    }
    [v9 setTextureType:v11];
    [v10 setPixelFormat:252];
    [v10 setWidth:a3];
    [v10 setHeight:a4];
    [v10 setSampleCount:a5];
    [v10 setUsage:4];
    [v10 setStorageMode:3];
    uint64_t v12 = +[CLKUIMetalResourceManager sharedDevice];
    v5 = (void *)[v12 newTextureWithDescriptor:v10];
  }
  return v5;
}

+ (id)allocateMsaaTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6
{
  v6 = 0;
  if (a4 && a3 && a6 >= 2)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F35330]);
    [v11 setTextureType:4];
    [v11 setPixelFormat:a5];
    [v11 setWidth:a3];
    [v11 setHeight:a4];
    [v11 setStorageMode:3];
    [v11 setUsage:4];
    [v11 setSampleCount:a6];
    [v11 setMipmapLevelCount:1];
    uint64_t v12 = +[CLKUIMetalResourceManager sharedDevice];
    v6 = (void *)[v12 newTextureWithDescriptor:v11];
  }
  return v6;
}

- (void)layoutSubviews
{
  [(CLKUIMetalQuadView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CAMetalLayer *)self->_metalLayer frame];
  self->_quadSize.width = (int)v8;
  self->_quadSize.height = (int)v10;
  if (v8 != v12 || v10 != v11)
  {
    *((unsigned char *)self + 552) |= 0x10u;
    -[CAMetalLayer setFrame:](self->_metalLayer, "setFrame:", v4, v6, v8, v10);
  }
  [(CLKUIMetalQuadView *)self bounds];
  snapshotView = self->_snapshotView;
  -[UIImageView setFrame:](snapshotView, "setFrame:");
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CLKUIMetalQuadView;
  if ([(CLKUIMetalQuadView *)&v6 isOpaque] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CLKUIMetalQuadView;
    [(CLKUIMetalQuadView *)&v5 setOpaque:v3];
    [(CAMetalLayer *)self->_metalLayer setOpaque:v3];
  }
}

- (void)setClearColor:(id)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v8 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
  double v7 = [v8 objectAtIndexedSubscript:0];
  objc_msgSend(v7, "setClearColor:", var0, var1, var2, var3);
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor
{
  v2 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
  BOOL v3 = [v2 objectAtIndexedSubscript:0];
  [v3 clearColor];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.double var3 = v15;
  result.double var2 = v14;
  result.double var1 = v13;
  result.double var0 = v12;
  return result;
}

- (void)_handleQuadArrayChange:(id)a3
{
  double v4 = (NSArray *)a3;
  v6.receiver = self;
  v6.super_class = (Class)CLKUIMetalQuadView;
  [(CLKUIQuadView *)&v6 _handleQuadArrayChange:v4];
  quads = self->_quads;
  self->_quads = v4;
}

- (void)snapshotAndFreeze
{
  [(CLKUIMetalQuadView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [MEMORY[0x1E4F19A30] currentDevice];
  [v11 screenScale];
  -[CLKUIMetalQuadView snapshotInRect:scale:time:](self, "snapshotInRect:scale:time:", v4, v6, v8, v10, v12, CACurrentMediaTime());
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  [(UIImageView *)self->_snapshotView setImage:v13];
  [(UIImageView *)self->_snapshotView setHidden:0];
}

- (void)setSingleBufferMode:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CLKUIMetalQuadView;
  -[CLKUIQuadView setSingleBufferMode:](&v5, sel_setSingleBufferMode_);
  if (v3) {
    [(CAMetalLayer *)self->_metalLayer removeBackBuffers];
  }
}

- (id)snapshotInRect:(CGRect)a3 scale:(double)a4 time:(double)a5
{
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = __Block_byref_object_copy__0;
  double v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CLKUIMetalQuadView_snapshotInRect_scale_time___block_invoke;
  v7[3] = &unk_1E697BF98;
  CGRect v8 = a3;
  double v9 = a4;
  double v10 = a5;
  v7[4] = self;
  v7[5] = &v11;
  [(CLKUIQuadView *)self _runOnRenderQueueIfNeeded:v7];
  id v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __48__CLKUIMetalQuadView_snapshotInRect_scale_time___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D9431A90]();
  BOOL v3 = (void *)MEMORY[0x1D9431A90]();
  uint64_t v4 = *(void *)(a1 + 32);
  if ((*(void *)(v4 + 632) | 2) == 0x22B)
  {
    id v5 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:71 width:(unint64_t)(*(double *)(a1 + 64) * *(double *)(a1 + 80)) height:(unint64_t)(*(double *)(a1 + 80) * *(double *)(a1 + 72)) mipmapped:0];
    [v5 setUsage:3];
    double v6 = +[CLKUIMetalResourceManager sharedDevice];
    double v7 = (void *)[v6 newTextureWithDescriptor:v5];

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __48__CLKUIMetalQuadView_snapshotInRect_scale_time___block_invoke_2;
    v18 = &unk_1E697BF70;
    uint64_t v19 = *(void *)(a1 + 32);
    id v8 = v7;
    id v20 = v8;
    double v9 = _Block_copy(&v15);

    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    double v9 = 0;
    id v8 = 0;
  }
  *(unsigned char *)(v4 + 616) = 1;
  double v10 = objc_msgSend(*(id *)(a1 + 32), "_snapshotTextureInRect:scale:time:withAdditionalPasses:", v9, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), v15, v16, v17, v18, v19);
  *(unsigned char *)(*(void *)(a1 + 32) + 616) = 0;
  if (v8)
  {
    id v11 = v8;

    double v10 = v11;
  }

  uint64_t v12 = [*(id *)(a1 + 32) _textureToImage:v10 scale:*(double *)(a1 + 80)];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  double v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void __48__CLKUIMetalQuadView_snapshotInRect_scale_time___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  double v6 = *(void **)(a1 + 40);
  id v11 = *(id *)(*(void *)(a1 + 32) + 568);
  id v7 = v11;
  CLKUIConvertTextureFromXRSRGBtoP3(a3, v6, a2, &v11);
  id v8 = v11;

  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = *(void **)(v9 + 568);
  *(void *)(v9 + 568) = v8;
}

- (id)snapshotTextureInRect:(CGRect)a3 scale:(double)a4 time:(double)a5
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CLKUIMetalQuadView_snapshotTextureInRect_scale_time___block_invoke;
  v7[3] = &unk_1E697BFC0;
  v7[4] = self;
  v7[5] = &v11;
  CGRect v8 = a3;
  double v9 = a4;
  double v10 = a5;
  [(CLKUIQuadView *)self _runOnRenderQueueIfNeeded:v7];
  id v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

uint64_t __55__CLKUIMetalQuadView_snapshotTextureInRect_scale_time___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_snapshotTextureInRect:scale:time:withAdditionalPasses:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)_snapshotTextureInRect:(CGRect)a3 scale:(double)a4 time:(double)a5 withAdditionalPasses:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v43 = (void (**)(void))a6;
  uint64_t v11 = (void *)MEMORY[0x1D9431A90]([(CLKUIQuadView *)self _prerenderForTime:a5]);
  unint64_t v41 = (unint64_t)(height * a4);
  unint64_t v42 = (unint64_t)(width * a4);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", self->_colorPixelFormat);
  [v12 setUsage:5];
  uint64_t v13 = +[CLKUIMetalResourceManager sharedDevice];
  id v44 = (id)[v13 newTextureWithDescriptor:v12];

  double v14 = CACurrentMediaTime();
  uint64_t v15 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v16 = self->_quads;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v50 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if ([v21 prepareForTime:v14]) {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v18);
  }

  if ([v15 count])
  {
    v40 = v11;
    double v22 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    v23 = NSString;
    uint64_t v24 = [(CLKUIQuadView *)self debugIdentifier];
    uint64_t v25 = [v23 stringWithFormat:@"FaceSnapshot-%@", v24];

    objc_super v39 = (void *)v25;
    +[CLKUIMetalResourceManager addCompletedErrorCheckToCommandBuffer:v22 forCase:v25];
    +[CLKUIMetalResourceManager setSynchronousTextureStreamingEnabled:1];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v26 = v15;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * j) performOffscreenPassesWithCommandBuffer:v22];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v28);
    }

    unint64_t msaaCount = self->_msaaCount;
    v32 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
    uint64_t v33 = [v32 objectAtIndexedSubscript:0];
    v34 = v33;
    if (msaaCount < 2)
    {
      [v33 setTexture:v44];
    }
    else
    {
      id v35 = +[CLKUIMetalQuadView allocateMsaaTextureWithWidth:v42 height:v41 pixelFormat:[(CLKUIMetalQuadView *)self colorPixelFormat] sampleCount:self->_msaaCount];
      [v34 setTexture:v35];

      v32 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
      v34 = [v32 objectAtIndexedSubscript:0];
      [v34 setResolveTexture:v44];
    }

    if (*((unsigned char *)self + 552))
    {
      uint64_t v36 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor depthAttachment];
      v37 = +[CLKUIMetalQuadView allocateDepthTextureWithWidth:v42 height:v41 sampleCount:self->_msaaCount];
      [v36 setTexture:v37];
    }
    [(CLKUIMetalQuadView *)self _renderQuads:v26 toScreenWithCommandBuffer:v22 passDescriptor:self->_renderPassDescriptor];
    if (v43) {
      v43[2]();
    }
    [v22 commit];
    [v22 waitUntilCompleted];

    uint64_t v11 = v40;
  }

  return v44;
}

- (BOOL)prewarmWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CLKUIMetalQuadView_prewarmWithCompletion___block_invoke;
  v7[3] = &unk_1E697C010;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  double v9 = &v10;
  [(CLKUIQuadView *)self _runOnRenderQueueIfNeeded:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __44__CLKUIMetalQuadView_prewarmWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9431A90]();
  double v3 = CACurrentMediaTime();
  id v4 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 528);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v10 prepareForTime:v3]) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    context = v2;
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 496) commandBuffer];
    uint64_t v12 = NSString;
    char v13 = [*(id *)(a1 + 32) debugIdentifier];
    double v14 = [v12 stringWithFormat:@"FacePrewarm-%@", v13];

    +[CLKUIMetalResourceManager addCompletedErrorCheckToCommandBuffer:v11 forCase:v14];
    uint64_t v15 = *(void **)(a1 + 40);
    if (v15)
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __44__CLKUIMetalQuadView_prewarmWithCompletion___block_invoke_2;
      v38[3] = &unk_1E697BFE8;
      id v39 = v15;
      [v11 addCompletedHandler:v38];
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v16 = v4;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * j) performOffscreenPassesWithCommandBuffer:v11];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v18);
    }

    uint64_t v21 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v21 + 552))
    {
      double v22 = [*(id *)(v21 + 504) depthAttachment];
      v23 = [v22 texture];
      uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 536);

      uint64_t v21 = *(void *)(a1 + 32);
      if (v23 != v24)
      {
        uint64_t v25 = [*(id *)(v21 + 504) depthAttachment];
        [v25 setTexture:*(void *)(*(void *)(a1 + 32) + 536)];

        uint64_t v21 = *(void *)(a1 + 32);
      }
    }
    if (!*(void *)(v21 + 600))
    {
      id v26 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:*(void *)(v21 + 632) width:32 height:32 mipmapped:0];
      [v26 setUsage:5];
      uint64_t v27 = +[CLKUIMetalResourceManager sharedDevice];
      uint64_t v28 = [v27 newTextureWithDescriptor:v26];
      uint64_t v29 = *(void *)(a1 + 32);
      v30 = *(void **)(v29 + 600);
      *(void *)(v29 + 600) = v28;

      uint64_t v21 = *(void *)(a1 + 32);
    }
    uint64_t v31 = [*(id *)(v21 + 504) colorAttachments];
    v32 = [v31 objectAtIndexedSubscript:0];
    [v32 setTexture:*(void *)(*(void *)(a1 + 32) + 600)];

    [*(id *)(a1 + 32) _renderQuads:v16 toScreenWithCommandBuffer:v11 passDescriptor:*(void *)(*(void *)(a1 + 32) + 504)];
    [v11 commit];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

uint64_t __44__CLKUIMetalQuadView_prewarmWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_textureToImage:(id)a3 scale:(double)a4
{
  return CLKUIConvertMTLTextureToUIImage(a3, self->_colorPixelFormat, a4);
}

- (void)_renderQuads:(id)a3 toScreenWithCommandBuffer:(id)a4 passDescriptor:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((*((unsigned char *)self + 552) & 8) != 0)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v18 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v21++) renderWithCommandBuffer:v9 passDescriptor:v10];
        }
        while (v19 != v21);
        uint64_t v19 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v19);
    }
  }
  else
  {
    uint64_t v11 = [v9 renderCommandEncoderWithDescriptor:v10];
    uint64_t v12 = v11;
    if (*((unsigned char *)self + 552)) {
      [v11 setDepthStencilState:self->_depthStencilState];
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v17++), "renderForDisplayWithEncoder:", v12, (void)v22);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v15);
    }

    [v12 endEncoding];
  }
}

- (BOOL)_displayAndCheckForDrawable:(BOOL)a3 renderDiscontinuity:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  v70 = (void (**)(void))a5;
  context = (void *)MEMORY[0x1D9431A90]();
  [(CLKUIMetalQuadView *)self _updateDrawableSizeIfNecessary];
  double v8 = CACurrentMediaTime();
  id v9 = objc_opt_new();
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v10 = self->_quads;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v98 objects:v105 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v99 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        if ([v14 prepareForTime:v8]) {
          [v9 addObject:v14];
        }
      }
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v98 objects:v105 count:16];
    }
    while (v11);
  }

  if ([v9 count])
  {
    uint64_t v15 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    uint64_t v16 = NSString;
    uint64_t v17 = [(CLKUIQuadView *)self debugIdentifier];
    v67 = [v16 stringWithFormat:@"FaceDisplay-%@", v17];

    +[CLKUIMetalResourceManager addCompletedErrorCheckToCommandBuffer:v15 forCase:v67];
    [(UIImageView *)self->_snapshotView setHidden:1];
    [(UIImageView *)self->_snapshotView setImage:0];
    if (v70)
    {
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __85__CLKUIMetalQuadView__displayAndCheckForDrawable_renderDiscontinuity_withCompletion___block_invoke;
      v96[3] = &unk_1E697BFE8;
      v97 = v70;
      [v15 addScheduledHandler:v96];
    }
    if ([(CLKUIQuadView *)self singleBufferMode])
    {
      objc_initWeak(location, self);
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __85__CLKUIMetalQuadView__displayAndCheckForDrawable_renderDiscontinuity_withCompletion___block_invoke_2;
      v94[3] = &unk_1E697C038;
      objc_copyWeak(&v95, location);
      [v15 addCompletedHandler:v94];
      objc_destroyWeak(&v95);
      objc_destroyWeak(location);
    }
    +[CLKUIMetalResourceManager setSynchronousTextureStreamingEnabled:v5];
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v18 = v9;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v90 objects:v104 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v91 != v20) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v90 + 1) + 8 * j) performOffscreenPassesWithCommandBuffer:v15];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v90 objects:v104 count:16];
      }
      while (v19);
    }

    if (v6
      && (*((unsigned char *)self + 552) & 2) == 0
      && ([(CAMetalLayer *)self->_metalLayer isDrawableAvailable] & 1) == 0)
    {
      v57 = _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
        -[CLKUIMetalQuadView _displayAndCheckForDrawable:renderDiscontinuity:withCompletion:].cold.4(self, v57);
      }

      [v15 commit];
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v22 = v18;
      uint64_t v58 = [v22 countByEnumeratingWithState:&v86 objects:v103 count:16];
      if (v58)
      {
        uint64_t v59 = *(void *)v87;
        do
        {
          for (uint64_t k = 0; k != v58; ++k)
          {
            if (*(void *)v87 != v59) {
              objc_enumerationMutation(v22);
            }
            [*(id *)(*((void *)&v86 + 1) + 8 * k) renderFailedForReason:0];
          }
          uint64_t v58 = [v22 countByEnumeratingWithState:&v86 objects:v103 count:16];
        }
        while (v58);
      }
      int v25 = 1;
      goto LABEL_75;
    }
    id v22 = [MEMORY[0x1E4F1C9C8] date];
    v69 = [(CAMetalLayer *)self->_metalLayer nextDrawable];
    v66 = [MEMORY[0x1E4F1C9C8] date];
    [v66 timeIntervalSinceDate:v22];
    if (v23 <= 1.0)
    {
      if (v23 <= 0.0333333333) {
        goto LABEL_33;
      }
      long long v24 = _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[CLKUIMetalQuadView _displayAndCheckForDrawable:renderDiscontinuity:withCompletion:]();
      }
    }
    else
    {
      long long v24 = _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[CLKUIMetalQuadView _displayAndCheckForDrawable:renderDiscontinuity:withCompletion:]();
      }
    }

LABEL_33:
    if (!v69)
    {
      long long v29 = _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[CLKUIMetalQuadView _displayAndCheckForDrawable:renderDiscontinuity:withCompletion:](self, v29);
      }

      [v15 commit];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v27 = v18;
      uint64_t v30 = [v27 countByEnumeratingWithState:&v82 objects:v102 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v83;
        do
        {
          for (uint64_t m = 0; m != v30; ++m)
          {
            if (*(void *)v83 != v31) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v82 + 1) + 8 * m) renderFailedForReason:1];
          }
          uint64_t v30 = [v27 countByEnumeratingWithState:&v82 objects:v102 count:16];
        }
        while (v30);
      }
      int v25 = 1;
      goto LABEL_74;
    }
    long long v26 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
    id v27 = [v26 objectAtIndexedSubscript:0];

    if (self->_msaaCount < 2)
    {
      long long v28 = [v69 texture];
      [v27 setTexture:v28];
    }
    else
    {
      [v27 setTexture:self->_msaaTexture];
      long long v28 = [v69 texture];
      [v27 setResolveTexture:v28];
    }

    if (*((unsigned char *)self + 552))
    {
      uint64_t v33 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor depthAttachment];
      long long v34 = [v33 texture];
      BOOL v35 = v34 == self->_depthTexture;

      if (!v35) {
        [v33 setTexture:self->_depthTexture];
      }
    }
    [(CLKUIMetalQuadView *)self _renderQuads:v18 toScreenWithCommandBuffer:v15 passDescriptor:self->_renderPassDescriptor];
    if ([(CLKUIMetalQuadView *)self _shouldApplyAPLFilter])
    {
      long long v36 = self->_aplPipelineState;
      long long v37 = [v69 texture];
      v81 = v36;
      v64 = _CLKUIComputeTextureAPL(v37, v15, (id *)&v81);
      v38 = v81;

      aplPipelineState = self->_aplPipelineState;
      self->_aplPipelineState = v38;
      long long v40 = v38;

      v65 = [(CLKUIMetalQuadView *)self _getDimmingPipelineState];
      long long v41 = [v15 computeCommandEncoder];
      [v41 setComputePipelineState:v65];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      *(_OWORD *)location = 0u;
      float aplFilterAmount = self->_aplFilterAmount;
      *(float *)&long long v80 = self->_maxAPL;
      *((float *)&v80 + 1) = aplFilterAmount;
      *(double *)&long long v43 = CLKUINativeToAPLCoeff();
      long long v79 = v43;
      double v44 = sRGBtoNative();
      LODWORD(location[1]) = v45;
      DWORD2(v77) = v46;
      location[0] = *(id *)&v44;
      *(void *)&long long v77 = v47;
      DWORD2(v78) = v48;
      *(void *)&long long v78 = v49;
      [v41 setBytes:location length:80 atIndex:2];
      [v41 setBuffer:v64 offset:0 atIndex:1];
      long long v50 = [v69 texture];
      [v41 setTexture:v50 atIndex:0];

      unint64_t v51 = [v65 threadExecutionWidth];
      unint64_t v63 = [v65 maxTotalThreadsPerThreadgroup];
      long long v52 = [v69 texture];
      unsigned int v62 = [v52 width];
      v53 = [v69 texture];

      LODWORD(v40) = [v53 height];
      v75[0] = (v51 + v62 - 1) / v51;
      v75[1] = (v63 / v51 + v40 - 1) / (v63 / v51);
      v75[2] = 1;
      v74[0] = v51;
      v74[1] = v63 / v51;
      v74[2] = 1;
      [v41 dispatchThreadgroups:v75 threadsPerThreadgroup:v74];
      [v41 endEncoding];
    }
    if ((*((unsigned char *)self + 552) & 2) == 0)
    {
      [v15 presentDrawable:v69];
      [v15 commit];
LABEL_73:
      int v25 = 0;
LABEL_74:

LABEL_75:
      goto LABEL_76;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__CLKUIMetalQuadView__displayAndCheckForDrawable_renderDiscontinuity_withCompletion___block_invoke_36;
    aBlock[3] = &unk_1E697BD68;
    id v54 = v15;
    id v72 = v54;
    id v73 = v69;
    uint64_t v55 = (void (**)(void))_Block_copy(aBlock);
    [v54 commit];
    int v56 = [MEMORY[0x1E4F39CF8] currentPhase];
    if (v56)
    {
      if (v56 == 1)
      {
        v55[2](v55);
LABEL_72:

        goto LABEL_73;
      }
      if (![MEMORY[0x1E4F39CF8] currentState]) {
        [MEMORY[0x1E4F39CF8] activate];
      }
    }
    [MEMORY[0x1E4F39CF8] addCommitHandler:v55 forPhase:1];
    goto LABEL_72;
  }
  v70[2]();
  int v25 = 1;
LABEL_76:

  return v25 == 0;
}

uint64_t __85__CLKUIMetalQuadView__displayAndCheckForDrawable_renderDiscontinuity_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__CLKUIMetalQuadView__displayAndCheckForDrawable_renderDiscontinuity_withCompletion___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    WeakRetained = (id *)[WeakRetained singleBufferMode];
    uint64_t v2 = v4;
    if (WeakRetained)
    {
      WeakRetained = (id *)[v4[65] removeBackBuffers];
      uint64_t v2 = v4;
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

uint64_t __85__CLKUIMetalQuadView__displayAndCheckForDrawable_renderDiscontinuity_withCompletion___block_invoke_36(uint64_t a1)
{
  [*(id *)(a1 + 32) waitUntilScheduled];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 present];
}

- (void)_updateFramebufferOnly
{
  if ((*((unsigned char *)self + 552) & 0x20) != 0
    || [(CLKUIMetalQuadView *)self _shouldApplyAPLFilter])
  {
    unsigned int v3 = 0;
    uint64_t v4 = 5;
  }
  else
  {
    unsigned int v3 = 1;
    uint64_t v4 = 4;
  }
  if ((*((unsigned char *)self + 552) & 0x40) != 0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v3;
  }
  if ((*((unsigned char *)self + 552) & 0x40) != 0) {
    uint64_t v6 = v4 | 2;
  }
  else {
    uint64_t v6 = v4;
  }
  [(CAMetalLayer *)self->_metalLayer setFramebufferOnly:v5];
  metalLayer = self->_metalLayer;
  [(CAMetalLayer *)metalLayer setTextureUsage:v6];
}

- (BOOL)_shouldApplyAPLFilter
{
  return self->_maxAPL < 1.0 && self->_aplFilterAmount > 0.0;
}

- (void)setMaxAPL:(float)a3
{
  self->_maxAPL = a3;
  [(CLKUIMetalQuadView *)self _updateFramebufferOnly];
}

- (void)setAplFilterAmount:(float)a3
{
  self->_float aplFilterAmount = a3;
  [(CLKUIMetalQuadView *)self _updateFramebufferOnly];
}

- (float)computeAPL
{
  [(CLKUIMetalQuadView *)self computeAPLAndSnapshot:0];
  return result;
}

- (float)computeAPLAndSnapshot:(id *)a3
{
  uint64_t v12 = 0;
  id v13 = (float *)&v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__38;
  v10[4] = __Block_byref_object_dispose__39;
  id v11 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__0;
  v8[4] = __Block_byref_object_dispose__0;
  id v9 = self->_aplPipelineState;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CLKUIMetalQuadView_computeAPLAndSnapshot___block_invoke;
  v7[3] = &unk_1E697C088;
  v7[4] = self;
  void v7[5] = v10;
  v7[7] = &v12;
  v7[8] = a3;
  void v7[6] = v8;
  [(CLKUIQuadView *)self _runOnRenderQueueIfNeeded:v7];
  float v5 = v13[6];
  _Block_object_dispose(v8, 8);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

void __44__CLKUIMetalQuadView_computeAPLAndSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [MEMORY[0x1E4F19A30] currentDevice];
  [v11 screenScale];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__CLKUIMetalQuadView_computeAPLAndSnapshot___block_invoke_2;
  v16[3] = &unk_1E697C060;
  long long v17 = *(_OWORD *)(a1 + 40);
  id v13 = objc_msgSend(v2, "_snapshotTextureInRect:scale:time:withAdditionalPasses:", v16, v4, v6, v8, v10, v12, 0.0);

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 560), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  if (*(void *)(a1 + 64))
  {
    uint64_t v14 = *(void **)(a1 + 32);
    int v15 = [MEMORY[0x1E4F19A30] currentDevice];
    [v15 screenScale];
    objc_msgSend(v14, "_textureToImage:scale:", v13);
    **(void **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();
  }
  *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (*(float (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                              + 40)
                                                                                  + 16))();
}

void __44__CLKUIMetalQuadView_computeAPLAndSnapshot___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  obuint64_t j = *(id *)(v4 + 40);
  uint64_t v5 = CLKUIComputeTextureAPL(a3, a2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_getDimmingPipelineState
{
  dimmingPipelineState = self->_dimmingPipelineState;
  if (!dimmingPipelineState)
  {
    uint64_t v4 = +[CLKUIMetalResourceManager sharedDevice];
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v14 = 0;
    uint64_t v6 = (void *)[v4 newDefaultLibraryWithBundle:v5 error:&v14];
    id v7 = v14;

    double v8 = (void *)[v6 newFunctionWithName:@"compute_apply_dimming"];
    id v13 = v7;
    double v9 = (MTLComputePipelineState *)[v4 newComputePipelineStateWithFunction:v8 error:&v13];
    id v10 = v13;

    id v11 = self->_dimmingPipelineState;
    self->_dimmingPipelineState = v9;

    dimmingPipelineState = self->_dimmingPipelineState;
  }
  return dimmingPipelineState;
}

- (unint64_t)_msaaCount
{
  return 4;
}

- (void)discardContents
{
}

- (id)metalLayer
{
  return self->_metalLayer;
}

- (id)_newRenderPassDescriptor
{
  double v3 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  uint64_t v4 = [v3 colorAttachments];
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];

  [v5 setLoadAction:2];
  objc_msgSend(v5, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  if (self->_msaaCount <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [v5 setStoreAction:v6];
  if (*((unsigned char *)self + 552))
  {
    id v7 = [v3 depthAttachment];
    [v7 setLoadAction:2];
    [v7 setClearDepth:1.0];
    [v7 setStoreAction:0];
  }
  return v3;
}

- (CGSize)drawableSize
{
  [(CAMetalLayer *)self->_metalLayer drawableSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_updateDrawableSizeIfNecessary
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 552) & 0x10) != 0)
  {
    double v3 = self->_metalLayer;
    if ((*((unsigned char *)self + 552) & 4) != 0)
    {
      uint64_t v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v4 scale];
      double v7 = v8;
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      uint64_t v5 = [v4 device];
      [v5 screenScale];
      double v7 = v6;
    }
    [(CAMetalLayer *)v3 bounds];
    double v10 = v7 * v9;
    double v12 = v7 * v11;
    self->_quadSize.double width = (int)v10;
    self->_quadSize.double height = (int)v12;
    -[CAMetalLayer setDrawableSize:](v3, "setDrawableSize:", v10, v12);
    id v13 = _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(double *)uint64_t v21 = v10;
      *(double *)&v21[1] = v12;
      uint64_t v20 = [MEMORY[0x1E4F29238] valueWithBytes:v21 objCType:"{CGSize=dd}"];
      *(_DWORD *)buf = 138412290;
      double v23 = v20;
      _os_log_debug_impl(&dword_1D3174000, v13, OS_LOG_TYPE_DEBUG, "drawableSize (%@)", buf, 0xCu);
    }
    if (self->_msaaCount >= 2)
    {
      msaaTexture = self->_msaaTexture;
      if (!msaaTexture
        || v10 != (double)(unint64_t)[(MTLTexture *)msaaTexture width]
        || v12 != (double)(unint64_t)[(MTLTexture *)self->_msaaTexture height])
      {
        int v15 = +[CLKUIMetalQuadView allocateMsaaTextureWithWidth:(unint64_t)v10 height:(unint64_t)v12 pixelFormat:[(CLKUIMetalQuadView *)self colorPixelFormat] sampleCount:self->_msaaCount];
        uint64_t v16 = self->_msaaTexture;
        self->_msaaTexture = v15;
      }
    }
    if (*((unsigned char *)self + 552))
    {
      depthTexture = self->_depthTexture;
      if (!depthTexture
        || v10 != (double)(unint64_t)[(MTLTexture *)depthTexture width]
        || v12 != (double)(unint64_t)[(MTLTexture *)self->_depthTexture height])
      {
        id v18 = +[CLKUIMetalQuadView allocateDepthTextureWithWidth:(unint64_t)v10 height:(unint64_t)v12 sampleCount:self->_msaaCount];
        uint64_t v19 = self->_depthTexture;
        self->_depthTexture = v18;
      }
    }
    *((unsigned char *)self + 552) &= ~0x10u;
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v3 = _CLKUILoggingObjectForDomain(0, (uint64_t)"CLKUILoggingDomainMetalQuadView");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    double v8 = v5;
    _os_log_impl(&dword_1D3174000, v3, OS_LOG_TYPE_DEFAULT, "dealloc CLKUIMetalQuadView subclass %@", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)CLKUIMetalQuadView;
  [(CLKUIQuadView *)&v6 dealloc];
}

- (unint64_t)colorPixelFormat
{
  return self->_colorPixelFormat;
}

- (BOOL)isSnapshotting
{
  return self->_isSnapshotting;
}

- (float)maxAPL
{
  return self->_maxAPL;
}

- (float)aplFilterAmount
{
  return self->_aplFilterAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_textureForPrewarming, 0);
  objc_storeStrong((id *)&self->_msaaTexture, 0);
  objc_storeStrong((id *)&self->_dimmingPipelineState, 0);
  objc_storeStrong((id *)&self->_colorConversionPipelineState, 0);
  objc_storeStrong((id *)&self->_aplPipelineState, 0);
  objc_storeStrong((id *)&self->_depthStencilState, 0);
  objc_storeStrong((id *)&self->_depthTexture, 0);
  objc_storeStrong((id *)&self->_quads, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
}

- (void)_displayAndCheckForDrawable:(void *)a1 renderDiscontinuity:(NSObject *)a2 withCompletion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = [a1 debugIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D3174000, a2, OS_LOG_TYPE_ERROR, "(%@) nextDrawable returned nil", (uint8_t *)&v4, 0xCu);
}

- (void)_displayAndCheckForDrawable:renderDiscontinuity:withCompletion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_1D3174000, v0, OS_LOG_TYPE_FAULT, "nextDrawable took much longer than expected (%lf sec), checkedForDrawable: %@", v1, 0x16u);
}

- (void)_displayAndCheckForDrawable:renderDiscontinuity:withCompletion:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1D3174000, v0, OS_LOG_TYPE_ERROR, "nextDrawable took longer than expected (%lf sec), checkedForDrawable: %@", v1, 0x16u);
}

- (void)_displayAndCheckForDrawable:(void *)a1 renderDiscontinuity:(NSObject *)a2 withCompletion:.cold.4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = [a1 debugIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1D3174000, a2, OS_LOG_TYPE_DEBUG, "(%@) isDrawableAvailable returned NO, skipping render", (uint8_t *)&v4, 0xCu);
}

@end