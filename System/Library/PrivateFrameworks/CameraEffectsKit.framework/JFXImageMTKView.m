@interface JFXImageMTKView
+ (id)buildRenderPipelineWithLabel:(id)a3 vertexFunction:(id)a4 fragmentFunction:(id)a5 device:(id)a6 view:(id)a7 error:(id *)a8;
+ (id)buildSamplerStateWithDevice:(id)a3 addressMode:(unint64_t)a4 filter:(unint64_t)a5;
- (BOOL)enableDebugDrawing;
- (BOOL)flipX;
- (BOOL)flipY;
- (JFXImageMTKView)initWithCoder:(id)a3;
- (JFXImageMTKView)initWithFrame:(CGRect)a3 device:(id)a4;
- (JTImage)jtImage;
- (int64_t)renderingType;
- (void)JFXImageMTKView_commonInit;
- (void)cleanupTextureCache;
- (void)cleanupTextures;
- (void)configureRenderPipelineForColorAttachments:(void *)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setContentMode:(int64_t)a3;
- (void)setEnableDebugDrawing:(BOOL)a3;
- (void)setFlipX:(BOOL)a3;
- (void)setFlipY:(BOOL)a3;
- (void)setJtImage:(id)a3;
- (void)setRenderingType:(int64_t)a3;
- (void)setupTextureCache;
- (void)updateDebugDrawing;
- (void)updateTexture;
- (void)updateVertices;
@end

@implementation JFXImageMTKView

- (void)dealloc
{
  [(JFXImageMTKView *)self cleanupTextures];
  [(JFXImageMTKView *)self cleanupTextureCache];
  v3.receiver = self;
  v3.super_class = (Class)JFXImageMTKView;
  [(MTKView *)&v3 dealloc];
}

- (void)JFXImageMTKView_commonInit
{
  [(MTKView *)self setEnableSetNeedsDisplay:1];
  [(JFXImageMTKView *)self setUserInteractionEnabled:0];
  objc_super v3 = [MEMORY[0x263F1C550] clearColor];
  [(JFXImageMTKView *)self setBackgroundColor:v3];

  [(MTKView *)self setColorPixelFormat:80];
  -[MTKView setClearColor:](self, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  [(JFXImageMTKView *)self bounds];
  self->_viewSize.width = v4;
  self->_viewSize.height = v5;
  self->_textureSize = (CGSize)*MEMORY[0x263F001B0];
  self->_needsUpdateVertices = 1;
  self->_needsUpdateTexture = 1;
  v6 = [MEMORY[0x263F086E0] jfxBundle];
  v7 = [(MTKView *)self device];
  id v21 = 0;
  v8 = (MTLLibrary *)[v7 newDefaultLibraryWithBundle:v6 error:&v21];
  id v9 = v21;
  library = self->_library;
  self->_library = v8;

  v11 = [(MTKView *)self device];
  v12 = (MTLCommandQueue *)[v11 newCommandQueue];
  commandQueue = self->_commandQueue;
  self->_commandQueue = v12;

  id v14 = objc_alloc(MEMORY[0x263F12D88]);
  v15 = [(MTKView *)self device];
  v16 = (MTKTextureLoader *)[v14 initWithDevice:v15];
  textureLoader = self->_textureLoader;
  self->_textureLoader = v16;

  [(JFXImageMTKView *)self setupTextureCache];
  v18 = [(MTKView *)self device];
  v19 = +[JFXImageMTKView buildSamplerStateWithDevice:v18 addressMode:0 filter:1];
  sampler = self->_sampler;
  self->_sampler = v19;

  self->_pixelBufferColorAttachments = 0;
  if (JFXImageMTKView_commonInit_onceToken != -1) {
    dispatch_once(&JFXImageMTKView_commonInit_onceToken, &__block_literal_global_14);
  }
  BYTE2(self->_jtImage) = JFXImageMTKView_commonInit_s_enableDebugDrawing;
  [(JFXImageMTKView *)self setRenderingType:-1];
}

void __45__JFXImageMTKView_JFXImageMTKView_commonInit__block_invoke()
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v1 = [v0 valueForKey:@"JTImageViewDebugDraw"];

  if (v1)
  {
    id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    JFXImageMTKView_commonInit_s_enableDebugDrawing = [v2 BOOLForKey:@"JTImageViewDebugDraw"];
  }
}

- (JFXImageMTKView)initWithFrame:(CGRect)a3 device:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)JFXImageMTKView;
  CGFloat v4 = -[MTKView initWithFrame:device:](&v7, sel_initWithFrame_device_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v5 = v4;
  if (v4) {
    [(JFXImageMTKView *)v4 JFXImageMTKView_commonInit];
  }
  return v5;
}

- (JFXImageMTKView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXImageMTKView;
  objc_super v3 = [(MTKView *)&v6 initWithCoder:a3];
  CGFloat v4 = v3;
  if (v3) {
    [(JFXImageMTKView *)v3 JFXImageMTKView_commonInit];
  }
  return v4;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)JFXImageMTKView;
  [(MTKView *)&v6 layoutSubviews];
  [(JFXImageMTKView *)self bounds];
  if (self->_viewSize.width != v3 || self->_viewSize.height != v4)
  {
    self->_viewSize.width = v3;
    self->_viewSize.height = v4;
    self->_needsUpdateVertices = 1;
  }
}

- (void)cleanupTextures
{
  self->_textureSize = (CGSize)*MEMORY[0x263F001B0];
  texture_RGBA = self->_texture_RGBA;
  if (texture_RGBA)
  {
    CFRelease(texture_RGBA);
    self->_texture_RGBA = 0;
  }
  texture_YUV_Luma = self->_texture_YUV_Luma;
  if (texture_YUV_Luma)
  {
    CFRelease(texture_YUV_Luma);
    self->_texture_YUV_Luma = 0;
  }
  texture_YUV_Chroma = self->_texture_YUV_Chroma;
  if (texture_YUV_Chroma)
  {
    CFRelease(texture_YUV_Chroma);
    self->_texture_YUV_Chroma = 0;
  }
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CVMetalTextureCacheFlush(textureCache, 0);
  }
}

- (void)cleanupTextureCache
{
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CVMetalTextureCacheFlush(textureCache, 0);
    CFRelease(self->_textureCache);
    self->_textureCache = 0;
  }
}

- (void)setupTextureCache
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v4 = [(MTKView *)self device];
  CVMetalTextureCacheCreate(v3, 0, v4, 0, &self->_textureCache);
}

- (void)updateTexture
{
  self->_needsUpdateTexture = 0;
  [(JFXImageMTKView *)self cleanupTextures];
  CFAllocatorRef v3 = [self->_renderingType pvImageBuffer];
  id v4 = (__CVBuffer *)[v3 cvPixelBuffer];

  if (v4)
  {
    unint64_t Width = CVPixelBufferGetWidth(v4);
    unint64_t Height = CVPixelBufferGetHeight(v4);
    self->_textureSize.width = (double)Width;
    self->_textureSize.height = (double)Height;
    CFTypeRef v7 = CVBufferCopyAttachment(v4, (CFStringRef)*MEMORY[0x263F04020], 0);
    [(JFXImageMTKView *)self configureRenderPipelineForColorAttachments:v7];
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    textureCache = self->_textureCache;
    if (v7)
    {
      CVMetalTextureCacheCreateTextureFromImage(v8, textureCache, v4, 0, MTLPixelFormatR8Unorm, Width, Height, 0, &self->_texture_YUV_Luma);
      CVMetalTextureGetTexture(self->_texture_YUV_Luma);
      v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      mtlTexture_YUV_Luma = self->_mtlTexture_YUV_Luma;
      self->_mtlTexture_YUV_Luma = v10;

      CVMetalTextureCacheCreateTextureFromImage(v8, self->_textureCache, v4, 0, MTLPixelFormatRG8Unorm, Width >> 1, Height >> 1, 1uLL, &self->_texture_YUV_Chroma);
      CVMetalTextureGetTexture(self->_texture_YUV_Chroma);
      v12 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      mtlTexture_YUV_Chroma = self->_mtlTexture_YUV_Chroma;
      self->_mtlTexture_YUV_Chroma = v12;

      CFRelease(v7);
    }
    else
    {
      CVMetalTextureCacheCreateTextureFromImage(v8, textureCache, v4, 0, MTLPixelFormatBGRA8Unorm, Width, Height, 0, &self->_texture_RGBA);
      CVMetalTextureGetTexture(self->_texture_RGBA);
      self->_mtlTexture_RGBA = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x270F9A758]();
    }
  }
  else
  {
    [(JFXImageMTKView *)self setRenderingType:-1];
    self->_pixelBufferColorAttachments = 0;
    renderPipelineState = self->_renderPipelineState;
    self->_renderPipelineState = 0;
  }
}

- (void)updateVertices
{
  if (+[JFXImageView normalizedQuadVertices:viewSize:textureSize:contentMode:](JFXImageView, "normalizedQuadVertices:viewSize:textureSize:contentMode:", &self->_anon_470[6], [(JFXImageMTKView *)self contentMode], self->_viewSize.width, self->_viewSize.height, self->_textureSize.width, self->_textureSize.height))
  {
    self->_needsUpdateVertices = 0;
  }
}

- (void)configureRenderPipelineForColorAttachments:(void *)a3
{
  if (self->_pixelBufferColorAttachments != a3)
  {
    self->_pixelBufferColorAttachments = a3;
    renderPipelineState = self->_renderPipelineState;
    self->_renderPipelineState = 0;
  }
  if (!self->_renderPipelineState)
  {
    objc_super v6 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:@"JFX_vertex_Pos2Tex2_transform"];
    uint64_t v7 = 1;
    if ((void *)*MEMORY[0x263F04038] != a3) {
      uint64_t v7 = 2;
    }
    CFAllocatorRef v8 = @"JFX_fragment_YUV709_Pos4Tex2_texture2D";
    if ((void *)*MEMORY[0x263F04038] == a3) {
      CFAllocatorRef v8 = @"JFX_fragment_YUV601_Pos4Tex2_texture2D";
    }
    if (a3) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 0;
    }
    if (a3) {
      v10 = v8;
    }
    else {
      v10 = @"JFX_fragment_Pos4Tex2_texture2D";
    }
    [(JFXImageMTKView *)self setRenderingType:v9];
    v11 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:v10];
    v12 = [(MTKView *)self device];
    id v16 = 0;
    v13 = +[JFXImageMTKView buildRenderPipelineWithLabel:@"JFXImageMTKView Pipeline" vertexFunction:v6 fragmentFunction:v11 device:v12 view:self error:&v16];
    id v14 = v16;
    v15 = self->_renderPipelineState;
    self->_renderPipelineState = v13;

    if (v14)
    {
      [NSString stringWithFormat:@"JFXImageMTKView failed to build render pipeline: %@", v14];
    }
  }
}

- (void)drawRect:(CGRect)a3
{
  id v4 = (void *)MEMORY[0x237DD1350](self, a2, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  CGFloat v5 = +[CFXApplicationState sharedInstance];
  uint64_t v6 = [v5 applicationState];

  if (v6 != 2)
  {
    if (!self->_needsUpdateTexture
      || ([(JFXImageMTKView *)self updateTexture], !self->_needsUpdateTexture))
    {
      if (!self->_needsUpdateVertices
        || ([(JFXImageMTKView *)self updateVertices], !self->_needsUpdateVertices))
      {
        if (self->_renderPipelineState
          && self[1].super.super.super.super.isa != (Class)-1
          && (self->_texture_RGBA || self->_texture_YUV_Luma && self->_texture_YUV_Chroma)
          && (self->_textureSize.width != *MEMORY[0x263F001B0]
           || self->_textureSize.height != *(double *)(MEMORY[0x263F001B0] + 8)))
        {
          CFAllocatorRef v8 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
          uint64_t v9 = [(MTKView *)self currentRenderPassDescriptor];
          if (v9)
          {
            v10 = [v8 renderCommandEncoderWithDescriptor:v9];
            [v10 setLabel:@"JFXImageMTKView Encoder"];
            [v10 pushDebugGroup:@"JFXImageMTKView"];
            [v10 setRenderPipelineState:self->_renderPipelineState];
            [v10 setVertexBytes:&self->_anon_470[6] length:64 atIndex:0];
            pv_simd_matrix_make_orthographic();
            if (LOBYTE(self->_jtImage)) {
              float v12 = -1.0;
            }
            else {
              float v12 = 1.0;
            }
            if (BYTE1(self->_jtImage)) {
              float v13 = -1.0;
            }
            else {
              float v13 = 1.0;
            }
            pv_simd_matrix_scale(v11, v12, v13, 1.0);
            v21[0] = v14;
            v21[1] = v15;
            v21[2] = v16;
            v21[3] = v17;
            [v10 setVertexBytes:v21 length:64 atIndex:1];
            if (self[1].super.super.super.super.isa)
            {
              [v10 setFragmentTexture:self->_mtlTexture_YUV_Luma atIndex:0];
              v18 = &OBJC_IVAR___JFXImageMTKView__mtlTexture_YUV_Chroma;
              uint64_t v19 = 1;
            }
            else
            {
              uint64_t v19 = 0;
              v18 = &OBJC_IVAR___JFXImageMTKView__mtlTexture_RGBA;
            }
            [v10 setFragmentTexture:*(Class *)((char *)&self->super.super.super.super.isa + *v18) atIndex:v19];
            [v10 setFragmentSamplerState:self->_sampler atIndex:0];
            [v10 drawPrimitives:4 vertexStart:0 vertexCount:4];
            [v10 popDebugGroup];
            [v10 endEncoding];
            v20 = [(MTKView *)self currentDrawable];
            if (v20) {
              [v8 presentDrawable:v20];
            }
          }
          [v8 commit];
        }
      }
    }
  }
}

- (void)setJtImage:(id)a3
{
  id v5 = a3;
  p_renderingType = &self->_renderingType;
  if (self->_renderingType != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_renderingType, a3);
    if (*p_renderingType)
    {
      uint64_t v7 = [(id)*p_renderingType pvImageBuffer];
      [v7 canCreateCVPixelBuffer];
    }
    self->_needsUpdateTexture = 1;
    self->_needsUpdateVertices = 1;
    [(JFXImageMTKView *)self updateDebugDrawing];
    [(JFXImageMTKView *)self setNeedsDisplay];
    id v5 = v8;
  }
}

- (void)setRenderingType:(int64_t)a3
{
  if (self[1].super.super.super.super.isa != (Class)a3)
  {
    self[1].super.super.super.super.isa = (Class)a3;
    [(JFXImageMTKView *)self updateDebugDrawing];
  }
}

- (void)setFlipX:(BOOL)a3
{
  if (LOBYTE(self->_jtImage) != a3)
  {
    LOBYTE(self->_jtImage) = a3;
    [(JFXImageMTKView *)self setNeedsDisplay];
  }
}

- (void)setFlipY:(BOOL)a3
{
  if (BYTE1(self->_jtImage) != a3)
  {
    BYTE1(self->_jtImage) = a3;
    [(JFXImageMTKView *)self setNeedsDisplay];
  }
}

- (void)setContentMode:(int64_t)a3
{
  uint64_t v5 = [(JFXImageMTKView *)self contentMode];
  if (a3 != 3 && v5 != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)JFXImageMTKView;
    [(JFXImageMTKView *)&v6 setContentMode:a3];
    self->_needsUpdateVertices = 1;
    [(JFXImageMTKView *)self setNeedsDisplay];
  }
}

- (void)setEnableDebugDrawing:(BOOL)a3
{
  if (BYTE2(self->_jtImage) != a3)
  {
    BYTE2(self->_jtImage) = a3;
    [(JFXImageMTKView *)self updateDebugDrawing];
  }
}

- (void)updateDebugDrawing
{
  if (BYTE2(self->_jtImage))
  {
    id v3 = +[JFXImageView colorFromRenderingType:self[1].super.super.super.super.isa];
    uint64_t v4 = [v3 CGColor];
    uint64_t v5 = [(JFXImageMTKView *)self layer];
    [v5 setBorderColor:v4];

    objc_super v6 = [(JFXImageMTKView *)self layer];
    double v7 = 4.0;
  }
  else
  {
    objc_super v6 = [(JFXImageMTKView *)self layer];
    double v7 = 0.0;
  }
  id v8 = v6;
  [v6 setBorderWidth:v7];
}

+ (id)buildRenderPipelineWithLabel:(id)a3 vertexFunction:(id)a4 fragmentFunction:(id)a5 device:(id)a6 view:(id)a7 error:(id *)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = objc_opt_new();
  [v18 setLabel:v17];

  objc_msgSend(v18, "setRasterSampleCount:", objc_msgSend(v13, "sampleCount"));
  [v18 setVertexFunction:v16];

  [v18 setFragmentFunction:v15];
  uint64_t v19 = [v13 colorPixelFormat];
  v20 = [v18 colorAttachments];
  id v21 = [v20 objectAtIndexedSubscript:0];
  [v21 setPixelFormat:v19];

  uint64_t v22 = [v13 depthStencilPixelFormat];
  [v18 setDepthAttachmentPixelFormat:v22];
  v23 = (void *)[v14 newRenderPipelineStateWithDescriptor:v18 error:a8];

  return v23;
}

+ (id)buildSamplerStateWithDevice:(id)a3 addressMode:(unint64_t)a4 filter:(unint64_t)a5
{
  id v7 = a3;
  id v8 = objc_opt_new();
  [v8 setSAddressMode:a4];
  [v8 setTAddressMode:a4];
  [v8 setMinFilter:a5];
  [v8 setMagFilter:a5];
  uint64_t v9 = (void *)[v7 newSamplerStateWithDescriptor:v8];

  return v9;
}

- (JTImage)jtImage
{
  return (JTImage *)self->_renderingType;
}

- (int64_t)renderingType
{
  return (int64_t)self[1].super.super.super.super.isa;
}

- (BOOL)flipX
{
  return (BOOL)self->_jtImage;
}

- (BOOL)flipY
{
  return BYTE1(self->_jtImage);
}

- (BOOL)enableDebugDrawing
{
  return BYTE2(self->_jtImage);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingType, 0);
  objc_storeStrong((id *)&self->_sampler, 0);
  objc_storeStrong((id *)&self->_mtlTexture_YUV_Chroma, 0);
  objc_storeStrong((id *)&self->_mtlTexture_YUV_Luma, 0);
  objc_storeStrong((id *)&self->_mtlTexture_RGBA, 0);
  objc_storeStrong((id *)&self->_textureLoader, 0);
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

@end