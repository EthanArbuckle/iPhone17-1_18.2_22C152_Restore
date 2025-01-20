@interface JFXImageAVSampleBufferView
+ (Class)layerClass;
- (BOOL)enableDebugDrawing;
- (BOOL)flipX;
- (BOOL)flipY;
- (JFXImageAVSampleBufferView)initWithCoder:(id)a3;
- (JFXImageAVSampleBufferView)initWithFrame:(CGRect)a3;
- (JTImage)jtImage;
- (UILabel)hdrBadgeDebug;
- (int64_t)renderingType;
- (opaqueCMSampleBuffer)createCMSampleBufferFromJTImage;
- (void)JFXImageAVSampleBufferView_commonInit;
- (void)drawSampleBufferToLayer:(opaqueCMSampleBuffer *)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setEnableDebugDrawing:(BOOL)a3;
- (void)setFlipX:(BOOL)a3;
- (void)setFlipY:(BOOL)a3;
- (void)setHdrBadgeDebug:(id)a3;
- (void)setJtImage:(id)a3;
- (void)setRenderingType:(int64_t)a3;
- (void)updateDebugDrawing;
@end

@implementation JFXImageAVSampleBufferView

- (void)JFXImageAVSampleBufferView_commonInit
{
  [(JFXImageAVSampleBufferView *)self setUserInteractionEnabled:0];
  if (JFXImageAVSampleBufferView_commonInit_onceToken != -1) {
    dispatch_once(&JFXImageAVSampleBufferView_commonInit_onceToken, &__block_literal_global_22);
  }
  uint64_t v3 = *MEMORY[0x263EF9C70];
  v4 = [(JFXImageAVSampleBufferView *)self sampleBufferDisplayLayer];
  [v4 setVideoGravity:v3];

  v5 = [(JFXImageAVSampleBufferView *)self layer];
  [v5 setMasksToBounds:1];

  self->_enableDebugDrawing = JFXImageAVSampleBufferView_commonInit_s_enableDebugDrawing;
  [(JFXImageAVSampleBufferView *)self setRenderingType:-1];
  if (JFX_isShowHDRBadgeInPreviewEnabled())
  {
    v6 = objc_opt_new();
    [(JFXImageAVSampleBufferView *)self setHdrBadgeDebug:v6];

    v7 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    [v7 setText:@"HDR"];

    v8 = [MEMORY[0x263F1C550] whiteColor];
    v9 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    [v9 setTextColor:v8];

    v10 = [MEMORY[0x263F1C658] systemFontOfSize:24.0];
    v11 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    [v11 setFont:v10];

    v12 = [MEMORY[0x263F1C550] clearColor];
    v13 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    [v13 setBackgroundColor:v12];

    id v14 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v15 = [v14 CGColor];
    v16 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    v17 = [v16 layer];
    [v17 setShadowColor:v15];

    v18 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    v19 = [v18 layer];
    objc_msgSend(v19, "setShadowOffset:", 1.0, 1.0);

    v20 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    v21 = [v20 layer];
    LODWORD(v22) = 1.0;
    [v21 setShadowOpacity:v22];

    v23 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    v24 = [v23 layer];
    [v24 setShadowRadius:3.0];

    v25 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    [(JFXImageAVSampleBufferView *)self addSubview:v25];

    v26 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    [v26 sizeToFit];

    v27 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    [v27 frame];
    double v29 = v28;
    double v31 = v30;

    id v32 = [(JFXImageAVSampleBufferView *)self hdrBadgeDebug];
    objc_msgSend(v32, "setFrame:", 20.0, 20.0, v29, v31);
  }
}

void __67__JFXImageAVSampleBufferView_JFXImageAVSampleBufferView_commonInit__block_invoke()
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v1 = [v0 valueForKey:@"JTImageViewDebugDraw"];

  if (v1)
  {
    id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    JFXImageAVSampleBufferView_commonInit_s_enableDebugDrawing = [v2 BOOLForKey:@"JTImageViewDebugDraw"];
  }
}

- (JFXImageAVSampleBufferView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXImageAVSampleBufferView;
  uint64_t v3 = -[JFXImageAVSampleBufferView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(JFXImageAVSampleBufferView *)v3 JFXImageAVSampleBufferView_commonInit];
  }
  return v4;
}

- (JFXImageAVSampleBufferView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXImageAVSampleBufferView;
  uint64_t v3 = [(JFXImageAVSampleBufferView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(JFXImageAVSampleBufferView *)v3 JFXImageAVSampleBufferView_commonInit];
  }
  return v4;
}

- (void)setContentMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXImageAVSampleBufferView;
  [(JFXImageAVSampleBufferView *)&v6 setContentMode:a3];
  uint64_t v4 = *MEMORY[0x263EF9C78];
  v5 = [(JFXImageAVSampleBufferView *)self sampleBufferDisplayLayer];
  [v5 setVideoGravity:v4];
}

- (void)setJtImage:(id)a3
{
  v5 = (JTImage *)a3;
  p_jtImage = &self->_jtImage;
  if (self->_jtImage != v5)
  {
    uint64_t v15 = v5;
    objc_storeStrong((id *)&self->_jtImage, a3);
    v7 = *p_jtImage;
    if (*p_jtImage)
    {
      v8 = [(JTImage *)v7 pvImageBuffer];
      [v8 canCreateCVPixelBuffer];

      v7 = *p_jtImage;
    }
    v9 = [(JTImage *)v7 pvImageBuffer];
    v10 = (__CVBuffer *)[v9 cvPixelBuffer];

    if (v10)
    {
      v11 = objc_msgSend(MEMORY[0x263F61230], "jfx_getColorSpaceFromPixelBuffer:", v10);
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v10);
      if ([v11 isHDRSpace] && PixelFormatType == 2016686640)
      {
        v13 = [(JFXImageAVSampleBufferView *)self createCMSampleBufferFromJTImage];
        [(JFXImageAVSampleBufferView *)self drawSampleBufferToLayer:v13];
        CFRelease(v13);
      }
    }
    else
    {
      id v14 = [(JFXImageAVSampleBufferView *)self sampleBufferDisplayLayer];
      [v14 setContents:0];

      [(JFXImageAVSampleBufferView *)self setRenderingType:-1];
    }
    v5 = v15;
  }
}

- (void)setRenderingType:(int64_t)a3
{
  if (self->_renderingType != a3)
  {
    self->_renderingType = a3;
    [(JFXImageAVSampleBufferView *)self updateDebugDrawing];
  }
}

- (void)setFlipX:(BOOL)a3
{
  if (self->_flipX != a3)
  {
    self->_flipX = a3;
    double v4 = 1.0;
    if (a3) {
      double v5 = -1.0;
    }
    else {
      double v5 = 1.0;
    }
    if (self->_flipY) {
      double v4 = -1.0;
    }
    CGAffineTransformMakeScale(&v8, v5, v4);
    objc_super v6 = [(JFXImageAVSampleBufferView *)self layer];
    CGAffineTransform v7 = v8;
    [v6 setAffineTransform:&v7];

    [(JFXImageAVSampleBufferView *)self setNeedsDisplay];
  }
}

- (void)setFlipY:(BOOL)a3
{
  if (self->_flipY != a3)
  {
    self->_flipY = a3;
    double v4 = -1.0;
    if (self->_flipX) {
      double v5 = -1.0;
    }
    else {
      double v5 = 1.0;
    }
    if (!a3) {
      double v4 = 1.0;
    }
    CGAffineTransformMakeScale(&v8, v5, v4);
    objc_super v6 = [(JFXImageAVSampleBufferView *)self layer];
    CGAffineTransform v7 = v8;
    [v6 setAffineTransform:&v7];

    [(JFXImageAVSampleBufferView *)self setNeedsDisplay];
  }
}

- (void)setEnableDebugDrawing:(BOOL)a3
{
  if (self->_enableDebugDrawing != a3)
  {
    self->_enableDebugDrawing = a3;
    [(JFXImageAVSampleBufferView *)self updateDebugDrawing];
  }
}

- (void)updateDebugDrawing
{
  if (self->_enableDebugDrawing)
  {
    id v3 = +[JFXImageView colorFromRenderingType:self->_renderingType];
    uint64_t v4 = [v3 CGColor];
    double v5 = [(JFXImageAVSampleBufferView *)self layer];
    [v5 setBorderColor:v4];

    objc_super v6 = [(JFXImageAVSampleBufferView *)self layer];
    double v7 = 4.0;
  }
  else
  {
    objc_super v6 = [(JFXImageAVSampleBufferView *)self layer];
    double v7 = 0.0;
  }
  id v8 = v6;
  [v6 setBorderWidth:v7];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (opaqueCMSampleBuffer)createCMSampleBufferFromJTImage
{
  result = (opaqueCMSampleBuffer *)self->_jtImage;
  if (result)
  {
    uint64_t v4 = [(opaqueCMSampleBuffer *)result pvImageBuffer];
    int v5 = [v4 canCreateCVPixelBuffer];

    if (!v5) {
      return 0;
    }
    CMSampleBufferRef sampleBufferOut = 0;
    objc_super v6 = [(JTImage *)self->_jtImage pvImageBuffer];
    double v7 = (__CVBuffer *)[v6 cvPixelBuffer];

    if (!v7) {
      return 0;
    }
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], v7, &formatDescriptionOut);
    if (formatDescriptionOut)
    {
      *(_OWORD *)&v11.duration.value = *MEMORY[0x263F010E0];
      v11.duration.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
      v11.presentationTimeStamp = v11.duration;
      v11.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
      CMSampleBufferCreateForImageBuffer(v8, v7, 1u, 0, 0, formatDescriptionOut, &v11, &sampleBufferOut);
      if (sampleBufferOut)
      {
        v9 = CMSampleBufferGetSampleAttachmentsArray(sampleBufferOut, 1u);
        v10 = [v9 objectAtIndexedSubscript:0];
        [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F00FD8]];
      }
      CFRelease(formatDescriptionOut);
      return sampleBufferOut;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)drawSampleBufferToLayer:(opaqueCMSampleBuffer *)a3
{
  if (a3)
  {
    id v5 = [(JFXImageAVSampleBufferView *)self sampleBufferDisplayLayer];
    uint64_t v4 = [v5 status];
    if (([v5 requiresFlushToResumeDecoding] & 1) != 0 || v4 == 2) {
      [v5 flush];
    }
    [v5 enqueueSampleBuffer:a3];
  }
}

- (JTImage)jtImage
{
  return self->_jtImage;
}

- (int64_t)renderingType
{
  return self->_renderingType;
}

- (BOOL)flipX
{
  return self->_flipX;
}

- (BOOL)flipY
{
  return self->_flipY;
}

- (BOOL)enableDebugDrawing
{
  return self->_enableDebugDrawing;
}

- (UILabel)hdrBadgeDebug
{
  return self->_hdrBadgeDebug;
}

- (void)setHdrBadgeDebug:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hdrBadgeDebug, 0);
  objc_storeStrong((id *)&self->_jtImage, 0);
}

@end