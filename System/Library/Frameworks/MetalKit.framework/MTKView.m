@interface MTKView
+ (Class)layerClass;
- (BOOL)_canDrawContent;
- (BOOL)_controlsOwnScaleFactor;
- (BOOL)autoResizeDrawable;
- (BOOL)enableSetNeedsDisplay;
- (BOOL)exportToTargaAtLocation:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 size:(unint64_t)a6 bytes:(void *)a7;
- (BOOL)framebufferOnly;
- (BOOL)isPaused;
- (BOOL)presentsWithTransaction;
- (CGColorSpaceRef)colorspace;
- (CGSize)_pixelSizeFromPointSize:(CGSize)a3;
- (CGSize)drawableSize;
- (CGSize)preferredDrawableSize;
- (MTKView)initWithCoder:(NSCoder *)coder;
- (MTKView)initWithFrame:(CGRect)a3;
- (MTKView)initWithFrame:(CGRect)frameRect device:(id)device;
- (MTLClearColor)clearColor;
- (MTLPixelFormat)colorPixelFormat;
- (MTLPixelFormat)depthStencilPixelFormat;
- (MTLRenderPassDescriptor)currentRenderPassDescriptor;
- (MTLStorageMode)depthStencilStorageMode;
- (MTLTextureUsage)depthStencilAttachmentTextureUsage;
- (MTLTextureUsage)multisampleColorAttachmentTextureUsage;
- (NSInteger)preferredFramesPerSecond;
- (NSUInteger)sampleCount;
- (const)colorTextures;
- (const)colorTexturesForceUpdate:(BOOL)a3;
- (const)multisampleColorTextures;
- (const)multisampleColorTexturesForceUpdate:(BOOL)a3;
- (double)clearDepth;
- (double)startTime;
- (id)currentDrawable;
- (id)delegate;
- (id)depthStencilTexture;
- (id)device;
- (id)multisampleColorTexture;
- (id)preferredDevice;
- (int64_t)_calculateRefeshesPerSecond;
- (int64_t)nominalFramesPerSecond;
- (uint32_t)clearStencil;
- (unint64_t)drawNumber;
- (unint64_t)drawableAttachmentIndex;
- (void)__initCommon;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_createDisplayLinkForScreen:(id)a3;
- (void)_dumpFrameImageWithFilename:(id)a3;
- (void)_dumpFramerate:(double)a3 withFilename:(id)a4;
- (void)_resizeDrawable;
- (void)_resizeMetalLayerDrawable;
- (void)_updateToNativeScale;
- (void)createDepthStencilTexture;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)displayLayer:(id)a3;
- (void)draw;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)getEnvironmentSettings;
- (void)layoutSubviews;
- (void)releaseDrawables;
- (void)setAutoResizeDrawable:(BOOL)autoResizeDrawable;
- (void)setClearColor:(MTLClearColor)clearColor;
- (void)setClearDepth:(double)clearDepth;
- (void)setClearStencil:(uint32_t)clearStencil;
- (void)setColorPixelFormat:(MTLPixelFormat)colorPixelFormat;
- (void)setColorPixelFormat:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setContentScaleFactor:(double)a3;
- (void)setDelegate:(id)delegate;
- (void)setDepthStencilAttachmentTextureUsage:(MTLTextureUsage)depthStencilAttachmentTextureUsage;
- (void)setDepthStencilPixelFormat:(MTLPixelFormat)depthStencilPixelFormat;
- (void)setDepthStencilStorageMode:(MTLStorageMode)depthStencilStorageMode;
- (void)setDevice:(id)device;
- (void)setDrawableAttachmentIndex:(unint64_t)a3;
- (void)setDrawableSize:(CGSize)drawableSize;
- (void)setEnableSetNeedsDisplay:(BOOL)enableSetNeedsDisplay;
- (void)setFrame:(CGRect)a3;
- (void)setFramebufferOnly:(BOOL)framebufferOnly;
- (void)setMultisampleColorAttachmentTextureUsage:(MTLTextureUsage)multisampleColorAttachmentTextureUsage;
- (void)setNilValueForKey:(id)a3;
- (void)setNominalFramesPerSecond:(int64_t)a3;
- (void)setPaused:(BOOL)paused;
- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond;
- (void)setPresentsWithTransaction:(BOOL)presentsWithTransaction;
- (void)setSampleCount:(NSUInteger)sampleCount;
@end

@implementation MTKView

- (MTLPixelFormat)depthStencilPixelFormat
{
  return self->_depthStencilPixelFormat;
}

- (BOOL)_canDrawContent
{
  return 1;
}

- (MTLPixelFormat)colorPixelFormat
{
  return self->_colorPixelFormats[self->_drawableAttachmentIndex];
}

- (NSUInteger)sampleCount
{
  return self->_sampleCount;
}

- (void)getEnvironmentSettings
{
  v3 = [MEMORY[0x263F08AB0] processInfo];
  v4 = [v3 environment];
  id v51 = [v4 objectForKey:@"MTK_TERMINATE_AFTER_FRAME"];

  v5 = [MEMORY[0x263F08AB0] processInfo];
  v6 = [v5 environment];
  v50 = [v6 objectForKey:@"MTK_TERMINATE_AFTER_SECONDS"];

  v7 = [MEMORY[0x263F08AB0] processInfo];
  v8 = [v7 environment];
  uint64_t v9 = [v8 objectForKey:@"MTK_MEASURE_FRAMERATE_AFTER_FRAME"];

  v10 = [MEMORY[0x263F08AB0] processInfo];
  v11 = [v10 environment];
  uint64_t v12 = [v11 objectForKey:@"MTK_MEASURE_FRAMERATE_AFTER_SECONDS"];

  v13 = [MEMORY[0x263F08AB0] processInfo];
  v14 = [v13 environment];
  v49 = [v14 objectForKey:@"MTK_DUMP_PATH"];

  v15 = [MEMORY[0x263F08AB0] processInfo];
  v16 = [v15 environment];
  uint64_t v17 = [v16 objectForKey:@"MTK_DUMP_FRAME_AFTER_FRAME"];

  v18 = [MEMORY[0x263F08AB0] processInfo];
  v19 = [v18 environment];
  uint64_t v20 = [v19 objectForKey:@"MTK_DUMP_FRAME_AFTER_SECONDS"];

  v21 = [MEMORY[0x263F08AB0] processInfo];
  v22 = [v21 environment];
  uint64_t v23 = [v22 objectForKey:@"MTK_DUMP_FIRST_FRAME"];

  v24 = [MEMORY[0x263F08AB0] processInfo];
  v25 = [v24 environment];
  v26 = [v25 objectForKey:@"MTK_DRAW_OFFSCREEN"];

  v27 = [MEMORY[0x263F08AB0] processInfo];
  v28 = [v27 environment];
  v29 = [v28 objectForKey:@"MTK_FORCE_ORIENTATION"];

  id v30 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v30 setNumberStyle:1];
  v31 = [v30 numberFromString:v51];
  [v30 numberFromString:v50];
  v47 = v46 = (void *)v9;
  v48 = [v30 numberFromString:v9];
  v45 = (void *)v12;
  v32 = [v30 numberFromString:v12];
  v44 = (void *)v17;
  v33 = [v30 numberFromString:v17];
  v43 = (void *)v20;
  v34 = [v30 numberFromString:v20];
  v42 = (void *)v23;
  v35 = [v30 numberFromString:v23];
  v36 = [v30 numberFromString:v26];
  if (v49)
  {
    v37 = (NSString *)[v49 copy];
    dumpPath = self->_dumpPath;
    self->_dumpPath = v37;
  }
  else
  {
    dumpPath = self->_dumpPath;
    self->_dumpPath = (NSString *)@"/tmp";
  }

  if (v31) {
    self->_terminateAfterFrame = [v31 unsignedIntegerValue];
  }
  if (v47) {
    self->_terminateAfterSeconds = [v47 unsignedIntegerValue];
  }
  if (v48) {
    self->_measureAfterFrame = [v48 unsignedIntegerValue];
  }
  if (v32) {
    self->_measureAfterSeconds = [v32 unsignedIntegerValue];
  }
  if (v33) {
    self->_dumpFrameAtFrame = [v33 unsignedIntegerValue];
  }
  if (v34) {
    self->_dumpFrameAtSeconds = [v34 unsignedIntegerValue];
  }
  if (v35) {
    self->_dumpFirstFrame = [v35 BOOLValue];
  }
  if (v36) {
    self->_drawOffscreen = [v36 BOOLValue];
  }
  self->_forceOrientation = 0;
  if ([v29 isEqualToString:@"Portrait"])
  {
    int64_t v39 = 1;
LABEL_28:
    self->_forceOrientation = v39;
    goto LABEL_29;
  }
  if ([v29 isEqualToString:@"PortraitUpsideDown"])
  {
    int64_t v39 = 2;
    goto LABEL_28;
  }
  if ([v29 isEqualToString:@"LandscapeLeft"])
  {
    int64_t v39 = 4;
    goto LABEL_28;
  }
  if ([v29 isEqualToString:@"LandscapeRight"])
  {
    int64_t v39 = 3;
    goto LABEL_28;
  }
  if (!self->_forceOrientation)
  {
    v40 = [v30 numberFromString:v29];
    if (v40)
    {
      id v41 = v40;
      self->_forceOrientation = [v40 unsignedIntegerValue];
      v40 = v41;
    }
  }
LABEL_29:
}

- (CGSize)drawableSize
{
  double width = self->_drawableSize.width;
  double height = self->_drawableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)displayLayer:(id)a3
{
  if (self->_enableSetNeedsDisplay) {
    [(MTKView *)self draw];
  }
}

- (BOOL)_controlsOwnScaleFactor
{
  return 1;
}

- (id)device
{
  return self->_device;
}

- (void)setPaused:(BOOL)paused
{
  self->_paused = paused;
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:");
}

- (void)setClearColor:(MTLClearColor)clearColor
{
  self->_clearColor = ($3ED934EFF50B3E737D3D4A62C605F33B)clearColor;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTKView;
  -[MTKView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_autoResizeDrawable) {
    [(MTKView *)self _resizeDrawable];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MTKView;
  [(MTKView *)&v3 layoutSubviews];
  if (self->_autoResizeDrawable) {
    [(MTKView *)self _resizeDrawable];
  }
}

- (MTKView)initWithFrame:(CGRect)frameRect device:(id)device
{
  double height = frameRect.size.height;
  double width = frameRect.size.width;
  double y = frameRect.origin.y;
  double x = frameRect.origin.x;
  id v10 = device;
  v14.receiver = self;
  v14.super_class = (Class)MTKView;
  v11 = -[MTKView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, device);
    [(MTKView *)v12 __initCommon];
  }

  return v12;
}

- (void)__initCommon
{
  [(MTKView *)self getEnvironmentSettings];
  if (self->_forceOrientation)
  {
    objc_super v3 = [MEMORY[0x263F1C5C0] currentDevice];
    objc_super v4 = [NSNumber numberWithInteger:self->_forceOrientation];
    [v3 setValue:v4 forKey:@"orientation"];
  }
  self->_pausedOnBackgrounding = 1;
  [(MTKView *)self setContentScaleFactor:0.0];
  v5 = [(MTKView *)self layer];
  objc_storeWeak((id *)&self->_metalLayer, v5);

  self->_sampleCount = 1;
  self->_paused = 0;
  self->_renderAttachmentDirtyState = -2147418111;
  *(_OWORD *)self->_colorPixelFormats = 0u;
  *(_OWORD *)&self->_colorPixelFormats[2] = 0u;
  *(_OWORD *)&self->_colorPixelFormats[4] = 0u;
  *(_OWORD *)&self->_colorPixelFormats[6] = 0u;
  *(_OWORD *)self->_colorTextures = 0u;
  *(_OWORD *)&self->_colorTextures[2] = 0u;
  *(_OWORD *)&self->_colorTextures[4] = 0u;
  *(_OWORD *)&self->_colorTextures[6] = 0u;
  *(_OWORD *)self->_multisampleColorTextures = 0u;
  *(_OWORD *)&self->_multisampleColorTextures[2] = 0u;
  *(_OWORD *)&self->_multisampleColorTextures[4] = 0u;
  *(_OWORD *)&self->_multisampleColorTextures[6] = 0u;
  self->_drawableAttachmentIndedouble x = 0;
  self->_maxValidAttachmentIndedouble x = 0;
  [(MTKView *)self setColorPixelFormat:80];
  device = self->_device;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  [WeakRetained setDevice:device];

  id v8 = objc_loadWeakRetained((id *)&self->_metalLayer);
  [v8 setDelegate:self];

  id v9 = objc_loadWeakRetained((id *)&self->_metalLayer);
  [v9 setFramebufferOnly:1];

  self->_framebufferOnldouble y = 1;
  int v10 = _mtkLinkedOnOrAfter(1);
  unint64_t v11 = 4;
  if (!v10) {
    unint64_t v11 = 0;
  }
  self->_depthStencilTextureUsage = v11;
  self->_multisampleColorTextureUsage = v11;
  if (self->_dumpFrameAtFrame || self->_dumpFrameAtSeconds || self->_dumpFirstFrame)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_metalLayer);
    [v12 setFramebufferOnly:0];
  }
  self->_clearColor.red = 0.0;
  self->_clearColor.green = 0.0;
  self->_clearColor.blue = 0.0;
  self->_clearColor.alpha = 1.0;
  self->_clearDepth = 1.0;
  self->_clearStencil = 0;
  self->_depthStencilStorageMode = 2;
  self->_enableSetNeedsDispladouble y = 0;
  if (self->_drawOffscreen)
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      objc_super v14 = -[MTKOffscreenDrawable initWithDevice:pixelFormat:size:drawableID:]([MTKOffscreenDrawable alloc], "initWithDevice:pixelFormat:size:drawableID:", self->_device, [(MTKView *)self colorPixelFormat], i, self->_drawableSize.width, self->_drawableSize.height);
      v15 = self->_offscreenSwapChain[i];
      self->_offscreenSwapChain[i] = v14;
    }
  }
  id v19 = [MEMORY[0x263F08A00] defaultCenter];
  [(MTKView *)self setOpaque:1];
  [(MTKView *)self setBackgroundColor:0];
  [(MTKView *)self setPreferredFramesPerSecond:60];
  [v19 addObserver:self selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];
  [v19 addObserver:self selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];
  if (!_drawRectSuperIMP) {
    _drawRectSuperIMP = [MEMORY[0x263F1CB60] instanceMethodForSelector:sel_drawRect_];
  }
  if (objc_opt_respondsToSelector())
  {
    drawRectSubIMP = (void *)[(MTKView *)self methodForSelector:sel_drawRect_];
    self->_drawRectSubIMP = drawRectSubIMP;
  }
  else
  {
    drawRectSubIMP = self->_drawRectSubIMP;
  }
  if (drawRectSubIMP) {
    BOOL v17 = drawRectSubIMP == (void *)_drawRectSuperIMP;
  }
  else {
    BOOL v17 = 1;
  }
  BOOL v18 = !v17;
  self->_subClassOverridesDrawRect = v18;
  self->_autoResizeDrawable = 1;
  [(MTKView *)self _resizeDrawable];
}

- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond
{
  self->_preferredFramesPerSecond = preferredFramesPerSecond;
  if (preferredFramesPerSecond <= 0)
  {
    [(MTKView *)self setPaused:1];
    preferredFramesPerSecond = self->_preferredFramesPerSecond;
  }
  [(MTKView *)self setNominalFramesPerSecond:preferredFramesPerSecond];
  int64_t v4 = self->_preferredFramesPerSecond;
  displayLink = self->_displayLink;

  [(CADisplayLink *)displayLink setPreferredFramesPerSecond:v4];
}

- (void)setNominalFramesPerSecond:(int64_t)a3
{
  self->_nominalFramesPerSecond = a3;
}

- (void)setColorPixelFormat:(unint64_t)a3 atIndex:(unint64_t)a4
{
  if (a4 <= 8)
  {
    unint64_t v4 = a4;
    colorPixelFormats = self->_colorPixelFormats;
    self->_colorPixelFormats[a4] = a3;
    self->_renderAttachmentDirtyState |= 0x10001u;
    if (self->_drawableAttachmentIndex == a4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
      [WeakRetained setPixelFormat:a3];
    }
    maxValidAttachmentIndedouble x = self->_maxValidAttachmentIndex;
    if (a3)
    {
      if (maxValidAttachmentIndex >= v4) {
        return;
      }
      goto LABEL_6;
    }
    if (maxValidAttachmentIndex == v4)
    {
      for (unsigned int i = 7; ; --i)
      {
        unint64_t v4 = i;
        if (colorPixelFormats[i]) {
          break;
        }
        if (!v4) {
          return;
        }
      }
LABEL_6:
      self->_maxValidAttachmentIndedouble x = v4;
    }
  }
}

- (void)setColorPixelFormat:(MTLPixelFormat)colorPixelFormat
{
}

- (void)setDevice:(id)device
{
  v5 = (MTLDevice *)device;
  if (self->_device != v5)
  {
    depthStencilTexture = self->_depthStencilTexture;
    self->_depthStencilTexture = 0;
    int v10 = v5;

    multisampleColorTexture = self->_multisampleColorTexture;
    self->_multisampleColorTexture = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
    [WeakRetained setDevice:v10];

    if (self->_drawOffscreen)
    {
      for (uint64_t i = 0; i != 3; ++i)
        [(MTKOffscreenDrawable *)self->_offscreenSwapChain[i] setDevice:v10];
    }
    self->_renderAttachmentDirtyState |= 0x80010001;
    objc_storeStrong((id *)&self->_device, device);
    v5 = v10;
  }
}

- (void)didMoveToWindow
{
  objc_super v3 = [(MTKView *)self window];

  if (v3)
  {
    [(MTKView *)self _updateToNativeScale];
    displayLink = [(MTKView *)self window];
    v5 = [displayLink screen];
    [(MTKView *)self _createDisplayLinkForScreen:v5];
  }
  else
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    displayLink = self->_displayLink;
    self->_displayLink = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)MTKView;
  [(MTKView *)&v6 didMoveToWindow];
}

- (void)_updateToNativeScale
{
  if (self->_autoResizeDrawable)
  {
    objc_super v3 = [(MTKView *)self window];

    if (v3)
    {
      unint64_t v4 = [(MTKView *)self window];
      v5 = [v4 screen];
      [v5 nativeScale];
      double v7 = v6;

      [(MTKView *)self setContentScaleFactor:v7];
    }
  }
}

- (void)_createDisplayLinkForScreen:(id)a3
{
  displayLink = self->_displayLink;
  id v5 = a3;
  [(CADisplayLink *)displayLink invalidate];
  int v10 = [[MTKViewDisplayLinkTarget alloc] initWithTarget:self];
  double v6 = [v5 displayLinkWithTarget:v10 selector:sel_draw];

  double v7 = self->_displayLink;
  self->_displayLink = v6;

  id v8 = self->_displayLink;
  id v9 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [(CADisplayLink *)v8 addToRunLoop:v9 forMode:*MEMORY[0x263EFF588]];

  [(CADisplayLink *)self->_displayLink setPaused:self->_paused];
  [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:self->_preferredFramesPerSecond];
}

- (void)setContentScaleFactor:(double)a3
{
  id v5 = [(MTKView *)self window];
  double v6 = [v5 screen];
  double v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263F1C920] mainScreen];
  }
  id v9 = v8;

  [v9 nativeScale];
  double v11 = v10;
  [(MTKView *)self contentScaleFactor];
  if (a3 != 0.0 && v12 == a3)
  {
    v40.receiver = self;
    v40.super_class = (Class)MTKView;
    [(MTKView *)&v40 setContentScaleFactor:a3];
    goto LABEL_18;
  }
  float v13 = v11;
  [v9 nativeBounds];
  double v15 = v14;
  double v17 = v16;
  [v9 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [v9 fixedCoordinateSpace];
  -[MTKView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v26, v19, v21, v23, v25);
  double v28 = v27;
  double v30 = v29;

  v31 = [MEMORY[0x263F08AB0] processInfo];
  if (([v31 isMacCatalystApp] & 1) == 0)
  {

LABEL_11:
    int v35 = (v15 > v17) ^ (v28 <= v30);
    if (v35) {
      double v34 = v30;
    }
    else {
      double v34 = v28;
    }
    if (!v35) {
      double v28 = v30;
    }
    goto LABEL_16;
  }
  v32 = [MEMORY[0x263F08AB0] processInfo];
  int v33 = [v32 isiOSAppOnMac];

  if (v33) {
    goto LABEL_11;
  }
  double v34 = v30;
LABEL_16:
  self->_drawableScaleFactor.double width = v15 / v28 / v13;
  self->_drawableScaleFactor.double height = v17 / v34 / v13;
  v40.receiver = self;
  v40.super_class = (Class)MTKView;
  [(MTKView *)&v40 setContentScaleFactor:a3];
  [(MTKView *)self contentScaleFactor];
  if (v36 == 0.0) {
    -[MTKView setContentScaleFactor:]();
  }
  [(MTKView *)self contentScaleFactor];
  double v38 = v37;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  [WeakRetained setContentsScale:v38];

  [(MTKView *)self _resizeDrawable];
LABEL_18:
}

- (CGSize)_pixelSizeFromPointSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(MTKView *)self window];
  double v7 = [v6 screen];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F1C920] mainScreen];
  }
  double v10 = v9;

  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [v10 fixedCoordinateSpace];
  -[MTKView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v19, v12, v14, v16, v18);
  CGRect v42 = CGRectIntegral(v41);
  double v20 = v42.size.width;

  [v10 bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v29 = [v10 coordinateSpace];
  -[MTKView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v29, v22, v24, v26, v28);
  CGRect v44 = CGRectIntegral(v43);
  double v30 = v44.size.width;

  [(MTKView *)self contentScaleFactor];
  double v32 = v31 * self->_drawableScaleFactor.width;
  [(MTKView *)self contentScaleFactor];
  double v34 = v33 * self->_drawableScaleFactor.height;
  if (v20 == v30) {
    double v35 = v32;
  }
  else {
    double v35 = v34;
  }
  if (v20 != v30) {
    double v34 = v32;
  }
  double v36 = round(width * v35);
  double v37 = round(height * v34);

  double v38 = v36;
  double v39 = v37;
  result.double height = v39;
  result.double width = v38;
  return result;
}

- (void)_resizeDrawable
{
  [(MTKView *)self bounds];
  -[MTKView _pixelSizeFromPointSize:](self, "_pixelSizeFromPointSize:", v3, v4);
  double v7 = v6;
  double v8 = v5;
  if (self->_drawableSize.width != v6 || self->_drawableSize.height != v5)
  {
    double v10 = [(MTKView *)self delegate];
    objc_msgSend(v10, "mtkView:drawableSizeWillChange:", self, v7, v8);

    self->_drawableSize.double width = v7;
    self->_drawableSize.double height = v8;
    self->_sizeDirtdouble y = 1;
  }
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  double v3 = [(MTKView *)self currentDrawable];
  if (v3)
  {
    double v4 = [MEMORY[0x263F129A0] renderPassDescriptor];
    if (self->_sampleCount < 2)
    {
      [(MTKView *)self colorTextures];
      unint64_t v8 = 0;
      do
      {
        id v9 = [v4 colorAttachments];
        double v10 = [v9 objectAtIndexedSubscript:v8];

        [v10 setTexture:self->_colorTextures[v8]];
        [v10 setLoadAction:2];
        objc_msgSend(v10, "setClearColor:", self->_clearColor.red, self->_clearColor.green, self->_clearColor.blue, self->_clearColor.alpha);

        ++v8;
      }
      while (v8 <= self->_maxValidAttachmentIndex);
    }
    else
    {
      [(MTKView *)self multisampleColorTextures];
      unint64_t v5 = 0;
      do
      {
        double v6 = [v4 colorAttachments];
        double v7 = [v6 objectAtIndexedSubscript:v5];

        [v7 setTexture:self->_multisampleColorTextures[v5]];
        [v7 setResolveTexture:self->_colorTextures[v5]];
        [v7 setStoreAction:2];
        [v7 setLoadAction:2];
        objc_msgSend(v7, "setClearColor:", self->_clearColor.red, self->_clearColor.green, self->_clearColor.blue, self->_clearColor.alpha);

        ++v5;
      }
      while (v5 <= self->_maxValidAttachmentIndex);
    }
    double v11 = [(MTKView *)self depthStencilTexture];

    if (v11)
    {
      double v12 = [v4 depthAttachment];
      double v13 = v12;
      if (self->_depthStencilPixelFormat == 253)
      {
        [v12 setTexture:0];
      }
      else
      {
        double v14 = [(MTKView *)self depthStencilTexture];
        [v13 setTexture:v14];

        [v13 setLoadAction:2];
        [v13 setStoreAction:0];
        [v13 setClearDepth:self->_clearDepth];
      }
      double v15 = [v4 stencilAttachment];
      double v16 = v15;
      unint64_t depthStencilPixelFormat = self->_depthStencilPixelFormat;
      if (depthStencilPixelFormat == 252 || depthStencilPixelFormat == 250)
      {
        [v15 setTexture:0];
      }
      else
      {
        double v18 = [(MTKView *)self depthStencilTexture];
        [v16 setTexture:v18];

        [v16 setLoadAction:2];
        [v16 setStoreAction:0];
        [v16 setClearStencil:self->_clearStencil];
      }
    }
  }
  else
  {
    double v4 = 0;
  }

  return (MTLRenderPassDescriptor *)v4;
}

- (id)depthStencilTexture
{
  if ((self->_renderAttachmentDirtyState & 0x80000000) == 0)
  {
    p_depthStencilTexture = &self->_depthStencilTexture;
LABEL_3:
    double v4 = *p_depthStencilTexture;
    goto LABEL_4;
  }
  if (self->_device)
  {
    p_depthStencilTexture = &self->_depthStencilTexture;
    depthStencilTexture = self->_depthStencilTexture;
    if (!depthStencilTexture) {
      goto LABEL_19;
    }
    double v7 = (double)(unint64_t)[(MTLTexture *)depthStencilTexture width];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
    [WeakRetained drawableSize];
    if (v9 == v7)
    {
      double v10 = (double)(unint64_t)[(MTLTexture *)*p_depthStencilTexture height];
      id v11 = objc_loadWeakRetained((id *)&self->_metalLayer);
      [v11 drawableSize];
      if (v12 == v10
        && [(MTLTexture *)*p_depthStencilTexture sampleCount] == self->_sampleCount
        && [(MTLTexture *)*p_depthStencilTexture pixelFormat] == self->_depthStencilPixelFormat
        && [(MTLTexture *)*p_depthStencilTexture usage] == self->_depthStencilTextureUsage)
      {
        uint64_t v13 = [(MTLTexture *)*p_depthStencilTexture storageMode];
        unint64_t depthStencilStorageMode = self->_depthStencilStorageMode;

        if (v13 == depthStencilStorageMode) {
          goto LABEL_3;
        }
LABEL_19:
        if (self->_depthStencilPixelFormat)
        {
          Main = CFRunLoopGetMain();
          double v16 = (const void *)*MEMORY[0x263EFFE78];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __30__MTKView_depthStencilTexture__block_invoke;
          block[3] = &unk_2642553A8;
          block[4] = self;
          CFRunLoopPerformBlock(Main, v16, block);
          double v17 = CFRunLoopGetMain();
          CFRunLoopWakeUp(v17);
          [(MTKView *)self _resizeMetalLayerDrawable];
          [(MTKView *)self createDepthStencilTexture];
        }
        goto LABEL_3;
      }
    }
    goto LABEL_19;
  }
  double v4 = 0;
LABEL_4:

  return v4;
}

- (const)colorTextures
{
  return [(MTKView *)self colorTexturesForceUpdate:0];
}

- (const)colorTexturesForceUpdate:(BOOL)a3
{
  if (!self->_device) {
    return 0;
  }
  BOOL v3 = a3;
  unint64_t v5 = [(MTKView *)self currentDrawable];
  double v6 = v5;
  unint64_t v7 = 0x26787F000uLL;
  if (v5)
  {
    unint64_t v8 = [v5 texture];
    drawableAttachmentIndedouble x = self->_drawableAttachmentIndex;
    double v10 = self->_colorTextures[drawableAttachmentIndex];
    self->_colorTextures[drawableAttachmentIndex] = v8;
  }
  if (self->_renderAttachmentDirtyState)
  {
    uint64_t v45 = 776;
    v46 = v6;
    unint64_t v11 = 0;
    v47 = v50;
    v48 = (const void *)*MEMORY[0x263EFFE78];
    unint64_t v12 = 0x26787F000uLL;
    while (1)
    {
      if (self->_drawOffscreen || *(Class *)((char *)&self->super.super.super.isa + *(int *)(v12 + 1852)) != (Class)v11)
      {
        if (v3) {
          goto LABEL_17;
        }
        uint64_t v13 = (char *)self + *(int *)(v7 + 1844);
        double v14 = *(void **)&v13[8 * v11];
        if (!v14) {
          goto LABEL_17;
        }
        double v15 = (double)(unint64_t)[v14 width];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
        [WeakRetained drawableSize];
        if (v17 != v15) {
          goto LABEL_16;
        }
        double v18 = (double)(unint64_t)[*(id *)&v13[8 * v11] height];
        id v19 = objc_loadWeakRetained((id *)&self->_metalLayer);
        [v19 drawableSize];
        if (v20 != v18 || [*(id *)&v13[8 * v11] pixelFormat] != self->_colorPixelFormats[v11])
        {

LABEL_16:
LABEL_17:
          if (self->_drawOffscreen
            && *(Class *)((char *)&self->super.super.super.isa + *(int *)(v12 + 1852)) == (Class)v11)
          {
            uint64_t v23 = 0;
            offscreenSwapChain = self->_offscreenSwapChain;
            do
            {
              -[MTKOffscreenDrawable setSize:](offscreenSwapChain[v23], "setSize:", self->_drawableSize.width, self->_drawableSize.height, v45, v46, v47);
              [(MTKOffscreenDrawable *)offscreenSwapChain[v23++] setPixelFormat:self->_colorPixelFormats[v11]];
            }
            while (v23 != 3);
            uint64_t v25 = [(CAMetalDrawable *)self->_currentDrawable texture];
            double v26 = (char *)self + *(int *)(v7 + 1844);
            double v27 = *(void **)&v26[8 * v11];
            *(void *)&v26[8 * v11] = v25;
          }
          else
          {
            if (self->_colorPixelFormats[v11])
            {
              Main = CFRunLoopGetMain();
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              v50[0] = __36__MTKView_colorTexturesForceUpdate___block_invoke;
              v50[1] = &unk_2642553A8;
              v50[2] = self;
              CFRunLoopPerformBlock(Main, v48, block);
              double v29 = CFRunLoopGetMain();
              CFRunLoopWakeUp(v29);
              [(MTKView *)self _resizeMetalLayerDrawable];
              double v30 = (void *)MEMORY[0x263F12A50];
              unint64_t v31 = self->_colorPixelFormats[v11];
              id v32 = objc_loadWeakRetained((id *)&self->_metalLayer);
              [v32 drawableSize];
              unint64_t v33 = v7;
              BOOL v34 = v3;
              unint64_t v36 = (unint64_t)v35;
              id v37 = objc_loadWeakRetained((id *)&self->_metalLayer);
              [v37 drawableSize];
              unint64_t v39 = v36;
              BOOL v3 = v34;
              unint64_t v7 = v33;
              unint64_t v12 = 0x26787F000;
              objc_super v40 = [v30 texture2DDescriptorWithPixelFormat:v31 width:v39 height:(unint64_t)v38 mipmapped:0];

              [v40 setUsage:self->_multisampleColorTextureUsage];
              [v40 setStorageMode:2];
              uint64_t v41 = [(MTLDevice *)self->_device newTextureWithDescriptor:v40];
            }
            else
            {
              uint64_t v41 = [MEMORY[0x263EFF9D0] null];
            }
            CGRect v42 = (char *)self + *(int *)(v7 + 1844);
            double v27 = *(void **)&v42[8 * v11];
            *(void *)&v42[8 * v11] = v41;
          }

          goto LABEL_27;
        }
        uint64_t v21 = [*(id *)&v13[8 * v11] usage];
        unint64_t multisampleColorTextureUsage = self->_multisampleColorTextureUsage;

        if (v21 != multisampleColorTextureUsage) {
          goto LABEL_17;
        }
      }
LABEL_27:
      if (++v11 > self->_maxValidAttachmentIndex)
      {
        double v6 = v46;
        *(_DWORD *)((char *)&self->super.super.super.isa + v45) &= ~1u;
        break;
      }
    }
  }
  CGRect v43 = (const void **)((char *)&self->super.super.super.isa + *(int *)(v7 + 1844));

  return v43;
}

- (id)currentDrawable
{
  currentDrawable = self->_currentDrawable;
  if (!currentDrawable)
  {
    double v4 = (void *)MEMORY[0x2166C14B0](0, a2);
    if (self->_drawOffscreen)
    {
      unint64_t v5 = (self->_drawableIdx + 1) % 3;
      self->_drawableIddouble x = v5;
      double v6 = self->_offscreenSwapChain[v5];
      unint64_t v7 = self->_currentDrawable;
      self->_currentDrawable = (CAMetalDrawable *)v6;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
      double v9 = [WeakRetained nextDrawable];
      double v10 = self->_currentDrawable;
      self->_currentDrawable = v9;

      if (self->_frameNum != 1
        || self->_dumpFrameAtFrame
        || self->_dumpFrameAtSeconds
        || !self->_dumpFirstFrame
        || !self->_framebufferOnly)
      {
        goto LABEL_8;
      }
      unint64_t v7 = objc_loadWeakRetained((id *)&self->_metalLayer);
      [v7 setFramebufferOnly:1];
    }

LABEL_8:
    currentDrawable = self->_currentDrawable;
  }

  return currentDrawable;
}

- (void)draw
{
  ++self->_frameNum;
  BOOL v3 = (void *)MEMORY[0x2166C14B0]();
  [(MTKView *)self _resizeMetalLayerDrawable];
  if (self->_subClassOverridesDrawRect)
  {
    drawRectSubIMP = (void (*)(MTKView *, char *))self->_drawRectSubIMP;
    [(MTKView *)self bounds];
    drawRectSubIMP(self, sel_drawRect_);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained drawInMTKView:self];
  }
  if (self->_frameNum == 1)
  {
    if (self->_dumpFirstFrame) {
      [(MTKView *)self _dumpFrameImageWithFilename:@"MTKViewFirstFrameDump"];
    }
    self->_double startTime = CACurrentMediaTime();
  }
  double v6 = CACurrentMediaTime();
  double startTime = self->_startTime;
  unint64_t dumpFrameAtFrame = self->_dumpFrameAtFrame;
  if (dumpFrameAtFrame && dumpFrameAtFrame <= self->_frameNum)
  {
    double v9 = objc_msgSend(NSString, "stringWithFormat:", @"MTKViewFrameDumpAfterFrame_%d", self->_frameNum);
    [(MTKView *)self _dumpFrameImageWithFilename:v9];
    self->_unint64_t dumpFrameAtFrame = 0;
  }
  double v10 = v6 - startTime;
  unint64_t dumpFrameAtSeconds = self->_dumpFrameAtSeconds;
  if (dumpFrameAtSeconds && v10 >= (double)dumpFrameAtSeconds)
  {
    unint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"MTKViewFrameDumpAfterSeconds_%lu", self->_dumpFrameAtSeconds);
    [(MTKView *)self _dumpFrameImageWithFilename:v12];
    self->_unint64_t dumpFrameAtSeconds = 0;
  }
  unint64_t measureAfterFrame = self->_measureAfterFrame;
  if (measureAfterFrame && measureAfterFrame <= self->_frameNum)
  {
    double v14 = objc_msgSend(NSString, "stringWithFormat:", @"MTKViewFramerateAfterFrame_%d", self->_frameNum);
    LODWORD(v15) = self->_frameNum;
    [(MTKView *)self _dumpFramerate:v14 withFilename:(double)v15 / v10];
    self->_unint64_t measureAfterFrame = 0;
  }
  unint64_t measureAfterSeconds = self->_measureAfterSeconds;
  if (measureAfterSeconds && v10 >= (double)measureAfterSeconds)
  {
    double v17 = objc_msgSend(NSString, "stringWithFormat:", @"MTKViewFramerateAfterSeconds_%lu", self->_measureAfterSeconds);
    LODWORD(v18) = self->_frameNum;
    [(MTKView *)self _dumpFramerate:v17 withFilename:(double)v18 / v10];
    self->_unint64_t measureAfterSeconds = 0;
  }
  unint64_t terminateAfterFrame = self->_terminateAfterFrame;
  if (terminateAfterFrame && terminateAfterFrame <= self->_frameNum
    || (unint64_t terminateAfterSeconds = self->_terminateAfterSeconds) != 0 && v10 >= (double)terminateAfterSeconds)
  {
    exit(0);
  }
  currentDrawable = self->_currentDrawable;
  self->_currentDrawable = 0;

  drawableAttachmentIndedouble x = self->_drawableAttachmentIndex;
  uint64_t v23 = self->_colorTextures[drawableAttachmentIndex];
  self->_colorTextures[drawableAttachmentIndex] = 0;
}

- (void)_resizeMetalLayerDrawable
{
  if (self->_sizeDirty)
  {
    double width = self->_drawableSize.width;
    double height = self->_drawableSize.height;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
    objc_msgSend(WeakRetained, "setDrawableSize:", width, height);

    self->_renderAttachmentDirtyState |= 0x80010001;
    self->_sizeDirtdouble y = 0;
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)createDepthStencilTexture
{
  BOOL v3 = (void *)MEMORY[0x263F12A50];
  unint64_t depthStencilPixelFormat = self->_depthStencilPixelFormat;
  p_metalLayer = &self->_metalLayer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  [WeakRetained drawableSize];
  unint64_t v8 = (unint64_t)v7;
  id v9 = objc_loadWeakRetained((id *)p_metalLayer);
  [v9 drawableSize];
  id v16 = [v3 texture2DDescriptorWithPixelFormat:depthStencilPixelFormat width:v8 height:(unint64_t)v10 mipmapped:0];

  if (self->_sampleCount >= 2) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 2;
  }
  [v16 setTextureType:v11];
  [v16 setSampleCount:self->_sampleCount];
  [v16 setUsage:self->_depthStencilTextureUsage];
  [v16 setStorageMode:self->_depthStencilStorageMode];
  unint64_t v12 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v16];
  depthStencilTexture = self->_depthStencilTexture;
  self->_depthStencilTexture = v12;

  unint64_t v14 = self->_depthStencilPixelFormat - 250;
  if (v14 > 3) {
    unint64_t v15 = @"MTKView Depth Stencil";
  }
  else {
    unint64_t v15 = off_2642553C8[v14];
  }
  [(MTLTexture *)self->_depthStencilTexture setLabel:v15];
  self->_renderAttachmentDirtyState &= ~0x80000000;
}

- (void)setEnableSetNeedsDisplay:(BOOL)enableSetNeedsDisplay
{
  self->_enableSetNeedsDispladouble y = enableSetNeedsDisplay;
  if (enableSetNeedsDisplay) {
    [(MTKView *)self setPaused:1];
  }
}

uint64_t __30__MTKView_depthStencilTexture__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resizeDrawable];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setDelegate:(id)delegate
{
}

- (void)setPresentsWithTransaction:(BOOL)presentsWithTransaction
{
  BOOL v3 = presentsWithTransaction;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  [WeakRetained setPresentsWithTransaction:v3];
}

- (void)setSampleCount:(NSUInteger)sampleCount
{
  if (sampleCount <= 1)
  {
    multisampleColorTexture = self->_multisampleColorTexture;
    self->_multisampleColorTexture = 0;
  }
  self->_sampleCount = sampleCount;
  self->_renderAttachmentDirtyState |= 0x80010001;
}

- (void)setDepthStencilPixelFormat:(MTLPixelFormat)depthStencilPixelFormat
{
  if (depthStencilPixelFormat)
  {
    if (depthStencilPixelFormat == MTLPixelFormatX32_Stencil8) {
      -[MTKView setDepthStencilPixelFormat:]();
    }
  }
  else
  {
    depthStencilTexture = self->_depthStencilTexture;
    self->_depthStencilTexture = 0;
  }
  self->_unint64_t depthStencilPixelFormat = depthStencilPixelFormat;
  self->_renderAttachmentDirtyState |= 0x80000000;
}

- (BOOL)exportToTargaAtLocation:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 size:(unint64_t)a6 bytes:(void *)a7
{
  __int16 v9 = a5;
  __int16 v10 = a4;
  uint64_t v11 = (objc_class *)MEMORY[0x263EFF990];
  id v12 = a3;
  id v13 = (id) [[v11 alloc] initWithLength:18];
  uint64_t v14 = [v13 mutableBytes];
  *(_WORD *)uint64_t v14 = 0;
  *(unsigned char *)(v14 + 2) = 2;
  *(void *)(v14 + 3) = 0;
  *(unsigned char *)(v14 + 11) = 0;
  *(_WORD *)(v14 + 12) = v10;
  *(_WORD *)(v14 + 14) = v9;
  *(_WORD *)(v14 + 16) = 32;
  [v13 appendBytes:a7 length:a6];
  id v20 = 0;
  char v15 = [v13 writeToURL:v12 options:0 error:&v20];

  id v16 = v20;
  double v17 = v16;
  if ((v15 & 1) == 0)
  {
    unint64_t v18 = [v16 localizedDescription];
    NSLog(&cfstr_CouldnTExportI.isa, v18);
  }
  return v15;
}

- (double)startTime
{
  return self->_startTime;
}

- (unint64_t)drawNumber
{
  return self->_frameNum;
}

- (void)_dumpFramerate:(double)a3 withFilename:(id)a4
{
  dumpPath = self->_dumpPath;
  id v6 = a4;
  double v7 = (void *)[(NSString *)dumpPath copy];
  unint64_t v8 = [v7 stringByAppendingString:@"/"];

  __int16 v9 = [v8 stringByAppendingString:v6];

  id v13 = [v9 stringByAppendingString:@".txt"];

  __int16 v10 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&a3);
  uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
  id v12 = [v10 dataUsingEncoding:4];
  [v11 createFileAtPath:v13 contents:v12 attributes:0];
}

- (void)_dumpFrameImageWithFilename:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_colorPixelFormats[self->_drawableAttachmentIndex];
  double v6 = 4.0;
  if (v5 - 70 > 0x2D) {
    goto LABEL_4;
  }
  if (((1 << (v5 - 70)) & 0xC03) != 0) {
    goto LABEL_7;
  }
  if (v5 != 115)
  {
LABEL_4:
    if (v5 - 554 < 2) {
      goto LABEL_7;
    }
    if (v5 - 552 > 1) {
      -[MTKView _dumpFrameImageWithFilename:]();
    }
  }
  double v6 = 8.0;
LABEL_7:
  p_drawableSize = &self->_drawableSize;
  unint64_t v26 = (unint64_t)(v6 * self->_drawableSize.width);
  unint64_t v8 = (unint64_t)(self->_drawableSize.height * (double)v26);
  unint64_t v28 = self->_colorPixelFormats[self->_drawableAttachmentIndex];
  double v30 = [[MTKTextureIOBufferAllocator alloc] initWithDevice:self->_device];
  id v27 = [(MTKTextureIOBufferAllocator *)v30 newBufferWithLength:v8];
  double v29 = (void *)[(MTLDevice *)self->_device newCommandQueue];
  __int16 v9 = [v29 commandBuffer];
  __int16 v10 = [v9 blitCommandEncoder];
  unint64_t width = (unint64_t)self->_drawableSize.width;
  unint64_t height = (unint64_t)self->_drawableSize.height;
  id v13 = [(CAMetalDrawable *)self->_currentDrawable texture];
  memset(v33, 0, 24);
  uint64_t v14 = [v27 buffer];
  v32[0] = width;
  v32[1] = height;
  char v15 = v4;
  v32[2] = 1;
  [v10 copyFromTexture:v13 sourceSlice:0 sourceLevel:0 sourceOrigin:v33 sourceSize:v32 toBuffer:v14 destinationOffset:0 destinationBytesPerRow:v26 destinationBytesPerImage:v8];

  [v10 endEncoding];
  [v9 commit];
  [v9 waitUntilCompleted];
  id v16 = [NSURL URLWithString:@"file:///"];
  double v17 = [v16 URLByAppendingPathComponent:self->_dumpPath];

  uint64_t v18 = [v17 URLByAppendingPathComponent:v4];

  id v19 = [(id)v18 URLByAppendingPathExtension:@"png"];

  double v20 = COERCE_DOUBLE(vmovn_s64((int64x2_t)vcvtq_u64_f64(*(float64x2_t *)p_drawableSize)));
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F7F240]) initWithDimensions:v28 pixelFormat:0 alphaInfo:v26 bytesPerRow:v8 bytesPerImage:v27 buffer:0 offset:v20];
  id v31 = 0;
  LOBYTE(v18) = [v21 exportToURL:v19 uttype:@"public.png" error:&v31];
  id v22 = v31;
  if ((v18 & 1) == 0)
  {
    id v23 = [v19 absoluteString];
    double v24 = (const char *)[v23 UTF8String];
    id v25 = [v22 localizedDescription];
    printf("Image Dump Error - %s: %s ", v24, (const char *)[v25 UTF8String]);
  }
}

- (CGColorSpaceRef)colorspace
{
  return 0;
}

- (void)setDrawableAttachmentIndex:(unint64_t)a3
{
  if (self->_drawableAttachmentIndex <= 7) {
    self->_drawableAttachmentIndedouble x = a3;
  }
}

- (unint64_t)drawableAttachmentIndex
{
  return self->_drawableAttachmentIndex;
}

- (const)multisampleColorTextures
{
  return [(MTKView *)self multisampleColorTexturesForceUpdate:0];
}

- (const)multisampleColorTexturesForceUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  [(MTKView *)self colorTextures];
  unint64_t v5 = 0x26787F000uLL;
  if ((self->_renderAttachmentDirtyState & 0x10000) == 0) {
    return (const void **)((char *)&self->super.super.super.isa + *(int *)(v5 + 1848));
  }
  if (self->_device)
  {
    Class v6 = 0;
    uint64_t v7 = 544;
    unint64_t v36 = (const void *)*MEMORY[0x263EFFE78];
    unint64_t v8 = 0x26787F000uLL;
    do
    {
      if (v3) {
        goto LABEL_16;
      }
      __int16 v9 = (char *)self + *(int *)(v5 + 1848);
      __int16 v10 = *(void **)&v9[8 * (void)v6];
      if (!v10) {
        goto LABEL_16;
      }
      double v11 = (double)(unint64_t)[v10 width];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
      [WeakRetained drawableSize];
      if (v13 == v11)
      {
        double v14 = (double)(unint64_t)[*(id *)&v9[8 * (void)v6] height];
        id v15 = objc_loadWeakRetained((id *)&self->_metalLayer);
        [v15 drawableSize];
        BOOL v17 = v16 != v14
           || (Class)[*(id *)&v9[8 * (void)v6] sampleCount] != *(Class *)((char *)&self->super.super.super.isa
                                                                                         + *(int *)(v8 + 1828))
           || [*(id *)&v9[8 * (void)v6] pixelFormat] != self->_colorPixelFormats[(void)v6]
           || [*(id *)&v9[8 * (void)v6] usage] != self->_multisampleColorTextureUsage;
      }
      else
      {
        BOOL v17 = 1;
      }

      if (v17)
      {
LABEL_16:
        uint64_t v18 = *(int *)(v8 + 1828);
        if (*(Class *)((char *)&self->super.super.super.isa + v18) >= (Class)2)
        {
          if (self->_colorPixelFormats[(void)v6])
          {
            Main = CFRunLoopGetMain();
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            void block[2] = __47__MTKView_multisampleColorTexturesForceUpdate___block_invoke;
            block[3] = &unk_2642553A8;
            block[4] = self;
            CFRunLoopPerformBlock(Main, v36, block);
            double v20 = CFRunLoopGetMain();
            CFRunLoopWakeUp(v20);
            [(MTKView *)self _resizeMetalLayerDrawable];
            id v37 = (void *)MEMORY[0x263F12A50];
            unint64_t v21 = self->_colorPixelFormats[(void)v6];
            id v22 = objc_loadWeakRetained((id *)&self->_metalLayer);
            [v22 drawableSize];
            unint64_t v23 = v8;
            BOOL v24 = v3;
            uint64_t v25 = v7;
            unint64_t v27 = (unint64_t)v26;
            id v28 = objc_loadWeakRetained((id *)&self->_metalLayer);
            [v28 drawableSize];
            unint64_t v30 = v27;
            uint64_t v7 = v25;
            BOOL v3 = v24;
            unint64_t v8 = v23;
            id v31 = [v37 texture2DDescriptorWithPixelFormat:v21 width:v30 height:(unint64_t)v29 mipmapped:0];

            unint64_t v5 = 0x26787F000;
            [v31 setTextureType:4];
            [v31 setSampleCount:*(Class *)((char *)&self->super.super.super.isa + v18)];
            [v31 setUsage:self->_multisampleColorTextureUsage];
            [v31 setStorageMode:2];
            uint64_t v32 = [(MTLDevice *)self->_device newTextureWithDescriptor:v31];
          }
          else
          {
            uint64_t v32 = 0;
          }
          unint64_t v33 = (char *)self + *(int *)(v5 + 1848);
          BOOL v34 = *(void **)&v33[8 * (void)v6];
          *(void *)&v33[8 * (void)v6] = v32;
        }
      }
      Class v6 = (Class)((char *)v6 + 1);
    }
    while (v6 <= *(Class *)((char *)&self->super.super.super.isa + v7));
    self->_renderAttachmentDirtyState &= ~0x10000u;
    return (const void **)((char *)&self->super.super.super.isa + *(int *)(v5 + 1848));
  }
  return 0;
}

uint64_t __47__MTKView_multisampleColorTexturesForceUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resizeDrawable];
}

uint64_t __36__MTKView_colorTexturesForceUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resizeDrawable];
}

- (id)multisampleColorTexture
{
  v2 = (void *)[(MTKView *)self multisampleColorTextures][8 * self->_drawableAttachmentIndex];

  return v2;
}

- (int64_t)nominalFramesPerSecond
{
  return self->_nominalFramesPerSecond;
}

- (int64_t)_calculateRefeshesPerSecond
{
  v2 = [(MTKView *)self window];
  BOOL v3 = [v2 screen];
  id v4 = v3;
  if (v3)
  {
    [v3 _refreshRate];
    double v6 = v5;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 _refreshRate];
    double v6 = v8;
  }
  if (v6 == 0.0) {
    return 0;
  }
  else {
    return llround(1.0 / v6);
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  if (!self->_pausedOnBackgrounding && self->_paused)
  {
    id v5 = v4;
    [(MTKView *)self setPaused:0];
    id v4 = v5;
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  [(MTKView *)self releaseDrawables];
  self->_pausedOnBackgrounding = self->_paused;
  if (!self->_paused)
  {
    [(MTKView *)self setPaused:1];
  }
}

- (MTKView)initWithFrame:(CGRect)a3
{
  return -[MTKView initWithFrame:device:](self, "initWithFrame:device:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MTKView)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v17.receiver = self;
  v17.super_class = (Class)MTKView;
  id v5 = [(MTKView *)&v17 initWithCoder:v4];
  double v6 = v5;
  if (v5)
  {
    device = v5->_device;
    v5->_device = 0;

    [(MTKView *)v6 __initCommon];
    uint64_t v8 = 0;
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewNumberColorPixelFormatsCoderKey"])
    {
      uint64_t v8 = [(NSCoder *)v4 decodeIntegerForKey:@"MTKViewNumberColorPixelFormatsCoderKey"];
      v6->_maxValidAttachmentIndedouble x = v8 - 1;
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewColorPixelFormatArrayCoderKey"])
    {
      uint64_t v16 = 0;
      uint64_t v9 = [(NSCoder *)v4 decodeBytesForKey:@"MTKViewColorPixelFormatArrayCoderKey" returnedLength:&v16];
      if (v16 != 8 * v8) {
        -[MTKView initWithCoder:]();
      }
      if (v8)
      {
        uint64_t v10 = v9;
        for (uint64_t i = 0; i != v8; ++i)
          [(MTKView *)v6 setColorPixelFormat:*(void *)(v10 + 8 * i) atIndex:i];
      }
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewDrawableAttachmentIndexCoderKey"]) {
      [(MTKView *)v6 setDrawableAttachmentIndex:[(NSCoder *)v4 decodeIntForKey:@"MTKViewDrawableAttachmentIndexCoderKey"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewColorPixelFormatCoderKey"]) {
      [(MTKView *)v6 setColorPixelFormat:[(NSCoder *)v4 decodeIntForKey:@"MTKViewColorPixelFormatCoderKey"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewDepthStencilPixelFormatCoderKey"]) {
      [(MTKView *)v6 setDepthStencilPixelFormat:[(NSCoder *)v4 decodeIntForKey:@"MTKViewDepthStencilPixelFormatCoderKey"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewSampleCountCoderKey"]) {
      [(MTKView *)v6 setSampleCount:[(NSCoder *)v4 decodeIntForKey:@"MTKViewSampleCountCoderKey"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewClearColorCoderKey"])
    {
      id v12 = [(NSCoder *)v4 decodeObjectForKey:@"MTKViewClearColorCoderKey"];
      double v13 = (double *)[v12 bytes];
      -[MTKView setClearColor:](v6, "setClearColor:", *v13, v13[1], v13[2], v13[3]);
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewFramebufferOnlyCoderKey"]) {
      [(MTKView *)v6 setFramebufferOnly:[(NSCoder *)v4 decodeBoolForKey:@"MTKViewFramebufferOnlyCoderKey"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewPresentsWithTransactionCoderKey"]) {
      [(MTKView *)v6 setPresentsWithTransaction:[(NSCoder *)v4 decodeBoolForKey:@"MTKViewPresentsWithTransactionCoderKey"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewClearDepthCoderKey"])
    {
      [(NSCoder *)v4 decodeFloatForKey:@"MTKViewClearDepthCoderKey"];
      [(MTKView *)v6 setClearDepth:v14];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewClearStencilCoderKey"]) {
      [(MTKView *)v6 setClearStencil:[(NSCoder *)v4 decodeIntForKey:@"MTKViewClearStencilCoderKey"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewPreferredFramesPerSecondCoderKey"]) {
      [(MTKView *)v6 setPreferredFramesPerSecond:[(NSCoder *)v4 decodeIntForKey:@"MTKViewPreferredFramesPerSecondCoderKey"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewEnableSetNeedsDisplayCoderKey"]) {
      [(MTKView *)v6 setEnableSetNeedsDisplay:[(NSCoder *)v4 decodeBoolForKey:@"MTKViewEnableSetNeedsDisplayCoderKey"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewPausedCoderKey"]) {
      [(MTKView *)v6 setPaused:[(NSCoder *)v4 decodeBoolForKey:@"MTKViewPausedCoderKey"]];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"MTKViewAutoResizeDrawableCoderKey"]) {
      [(MTKView *)v6 setAutoResizeDrawable:[(NSCoder *)v4 decodeBoolForKey:@"MTKViewAutoResizeDrawableCoderKey"]];
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MTKView;
  [(MTKView *)&v18 encodeWithCoder:v4];
  maxValidAttachmentIndedouble x = self->_maxValidAttachmentIndex;
  int64_t v6 = maxValidAttachmentIndex + 1;
  BOOL v7 = maxValidAttachmentIndex == -1;
  [v4 encodeInteger:maxValidAttachmentIndex + 1 forKey:@"MTKViewNumberColorPixelFormatsCoderKey"];
  uint64_t v8 = 8 * v6;
  uint64_t v9 = malloc_type_malloc(8 * v6, 0x8067A07uLL);
  uint64_t v10 = v9;
  if (!v7)
  {
    colorPixelFormats = self->_colorPixelFormats;
    id v12 = v9;
    do
    {
      uint64_t v13 = *colorPixelFormats++;
      *v12++ = v13;
      --v6;
    }
    while (v6);
  }
  [v4 encodeBytes:v9 length:v8 forKey:@"MTKViewColorPixelFormatArrayCoderKey"];
  free(v10);
  objc_msgSend(v4, "encodeInteger:forKey:", -[MTKView drawableAttachmentIndex](self, "drawableAttachmentIndex"), @"MTKViewDrawableAttachmentIndexCoderKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MTKView colorPixelFormat](self, "colorPixelFormat"), @"MTKViewColorPixelFormatCoderKey");
  [v4 encodeInteger:self->_depthStencilPixelFormat forKey:@"MTKViewDepthStencilPixelFormatCoderKey"];
  [v4 encodeInteger:self->_sampleCount forKey:@"MTKViewSampleCountCoderKey"];
  float v14 = [MEMORY[0x263EFF8F8] dataWithBytes:&self->_clearColor length:32];
  [v4 encodeObject:v14 forKey:@"MTKViewClearColorCoderKey"];
  double clearDepth = self->_clearDepth;
  *(float *)&double clearDepth = clearDepth;
  [v4 encodeFloat:@"MTKViewClearDepthCoderKey" forKey:clearDepth];
  [v4 encodeInteger:self->_clearStencil forKey:@"MTKViewClearStencilCoderKey"];
  [v4 encodeInteger:self->_preferredFramesPerSecond forKey:@"MTKViewPreferredFramesPerSecondCoderKey"];
  [v4 encodeBool:self->_enableSetNeedsDisplay forKey:@"MTKViewEnableSetNeedsDisplayCoderKey"];
  [v4 encodeBool:self->_paused forKey:@"MTKViewPausedCoderKey"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(WeakRetained, "framebufferOnly"), @"MTKViewFramebufferOnlyCoderKey");

  id v17 = objc_loadWeakRetained((id *)&self->_metalLayer);
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v17, "presentsWithTransaction"), @"MTKViewPresentsWithTransactionCoderKey");

  [v4 encodeBool:self->_autoResizeDrawable forKey:@"MTKViewAutoResizeDrawableCoderKey"];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
  [(CADisplayLink *)self->_displayLink invalidate];

  v4.receiver = self;
  v4.super_class = (Class)MTKView;
  [(MTKView *)&v4 dealloc];
}

- (void)releaseDrawables
{
  depthStencilTexture = self->_depthStencilTexture;
  self->_depthStencilTexture = 0;

  multisampleColorTexture = self->_multisampleColorTexture;
  self->_multisampleColorTexture = 0;

  self->_renderAttachmentDirtyState |= 0x80010000;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->_enableSetNeedsDisplay) {
    -[MTKView displayLayer:](self, "displayLayer:", a3, a4);
  }
}

- (void)setDrawableSize:(CGSize)drawableSize
{
  double height = drawableSize.height;
  double width = drawableSize.width;
  p_drawableSize = &self->_drawableSize;
  if (self->_drawableSize.width != drawableSize.width || self->_drawableSize.height != drawableSize.height)
  {
    [(MTKView *)self bounds];
    double v9 = v8;
    [(MTKView *)self setContentScaleFactor:width / v10];
    self->_drawableScaleFactor.double width = 1.0;
    [(MTKView *)self contentScaleFactor];
    self->_drawableScaleFactor.double height = height / v9 / v11;
    id v12 = [(MTKView *)self delegate];
    objc_msgSend(v12, "mtkView:drawableSizeWillChange:", self, width, height);

    p_drawableSize->double width = width;
    p_drawableSize->double height = height;
    self->_sizeDirtdouble y = 1;
  }
}

- (id)preferredDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  BOOL v3 = [WeakRetained preferredDevice];

  return v3;
}

- (void)setNilValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"clearColor"])
  {
    -[MTKView setClearColor:](self, "setClearColor:", 0.0, 0.0, 0.0, 1.0);
  }
  else if ([v4 isEqualToString:@"sampleCount"])
  {
    [(MTKView *)self setSampleCount:1];
  }
  else if ([v4 isEqualToString:@"clearDepth"])
  {
    [(MTKView *)self setClearDepth:1.0];
  }
  else if ([v4 isEqualToString:@"clearStencil"])
  {
    [(MTKView *)self setClearStencil:0];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTKView;
    [(MTKView *)&v5 setNilValueForKey:v4];
  }
}

- (void)setFramebufferOnly:(BOOL)framebufferOnly
{
  BOOL v3 = framebufferOnly;
  self->_framebufferOnldouble y = framebufferOnly;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  [WeakRetained setFramebufferOnly:v3];
}

- (void)setDepthStencilAttachmentTextureUsage:(MTLTextureUsage)depthStencilAttachmentTextureUsage
{
  if (self->_depthStencilTextureUsage != depthStencilAttachmentTextureUsage)
  {
    self->_depthStencilTextureUsage = depthStencilAttachmentTextureUsage;
    self->_renderAttachmentDirtyState |= 0x80000000;
  }
}

- (MTLTextureUsage)depthStencilAttachmentTextureUsage
{
  return self->_depthStencilTextureUsage;
}

- (MTLStorageMode)depthStencilStorageMode
{
  return self->_depthStencilStorageMode;
}

- (void)setDepthStencilStorageMode:(MTLStorageMode)depthStencilStorageMode
{
  if (self->_depthStencilStorageMode != depthStencilStorageMode)
  {
    self->_unint64_t depthStencilStorageMode = depthStencilStorageMode;
    self->_renderAttachmentDirtyState |= 0x80000000;
  }
}

- (void)setMultisampleColorAttachmentTextureUsage:(MTLTextureUsage)multisampleColorAttachmentTextureUsage
{
  if (self->_multisampleColorTextureUsage != multisampleColorAttachmentTextureUsage)
  {
    self->_unint64_t multisampleColorTextureUsage = multisampleColorAttachmentTextureUsage;
    self->_renderAttachmentDirtyState |= 0x10001u;
  }
}

- (MTLTextureUsage)multisampleColorAttachmentTextureUsage
{
  return self->_multisampleColorTextureUsage;
}

- (BOOL)framebufferOnly
{
  self->_framebufferOnldouble y = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  char v3 = [WeakRetained framebufferOnly];

  return v3;
}

- (BOOL)presentsWithTransaction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metalLayer);
  char v3 = [WeakRetained presentsWithTransaction];

  return v3;
}

- (MTLClearColor)clearColor
{
  double red = self->_clearColor.red;
  double green = self->_clearColor.green;
  double blue = self->_clearColor.blue;
  double alpha = self->_clearColor.alpha;
  result.double alpha = alpha;
  result.double blue = blue;
  result.double green = green;
  result.double red = red;
  return result;
}

- (double)clearDepth
{
  return self->_clearDepth;
}

- (void)setClearDepth:(double)clearDepth
{
  self->_double clearDepth = clearDepth;
}

- (uint32_t)clearStencil
{
  return self->_clearStencil;
}

- (void)setClearStencil:(uint32_t)clearStencil
{
  self->_clearStencil = clearStencil;
}

- (NSInteger)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (BOOL)enableSetNeedsDisplay
{
  return self->_enableSetNeedsDisplay;
}

- (BOOL)autoResizeDrawable
{
  return self->_autoResizeDrawable;
}

- (void)setAutoResizeDrawable:(BOOL)autoResizeDrawable
{
  self->_autoResizeDrawable = autoResizeDrawable;
}

- (CGSize)preferredDrawableSize
{
  double width = self->_preferredDrawableSize.width;
  double height = self->_preferredDrawableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dumpPath, 0);
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_offscreenSwapChain[i], 0);
  for (uint64_t j = 7; j != -1; --j)
    objc_storeStrong((id *)&self->_colorTextures[j], 0);
  for (uint64_t k = 7; k != -1; --k)
    objc_storeStrong((id *)&self->_multisampleColorTextures[k], 0);
  objc_storeStrong((id *)&self->_multisampleColorTexture, 0);
  objc_storeStrong((id *)&self->_depthStencilTexture, 0);
  objc_storeStrong((id *)&self->_currentDrawable, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_destroyWeak((id *)&self->_metalLayer);
}

- (void)_dumpFrameImageWithFilename:.cold.1()
{
}

- (void)initWithCoder:.cold.1()
{
  __assert_rtn("-[MTKView initWithCoder:]", "MTKView.m", 1132, "bytesReturned == bytesExpected");
}

- (void)setContentScaleFactor:.cold.1()
{
  __assert_rtn("-[MTKView setContentScaleFactor:]", "MTKView.m", 1627, "self.contentScaleFactor != 0");
}

- (void)setDepthStencilPixelFormat:.cold.1()
{
  __assert_rtn("-[MTKView setDepthStencilPixelFormat:]", "MTKView.m", 1748, "depthStencilPixelFormat != MTLPixelFormatX32_Stencil8 && \"depthStencilPixelFormat cannot be a stencil texture view pixel format\"");
}

@end