@interface JFXImageIOSurfaceView
- (BOOL)enableDebugDrawing;
- (BOOL)flipX;
- (BOOL)flipY;
- (JFXImageIOSurfaceView)initWithCoder:(id)a3;
- (JFXImageIOSurfaceView)initWithFrame:(CGRect)a3;
- (JTImage)jtImage;
- (int64_t)renderingType;
- (void)JFXImageIOSurfaceView_commonInit;
- (void)setEnableDebugDrawing:(BOOL)a3;
- (void)setFlipX:(BOOL)a3;
- (void)setFlipY:(BOOL)a3;
- (void)setJtImage:(id)a3;
- (void)setRenderingType:(int64_t)a3;
- (void)updateDebugDrawing;
@end

@implementation JFXImageIOSurfaceView

- (void)JFXImageIOSurfaceView_commonInit
{
  [(JFXImageIOSurfaceView *)self setUserInteractionEnabled:0];
  if (JFXImageIOSurfaceView_commonInit_onceToken != -1) {
    dispatch_once(&JFXImageIOSurfaceView_commonInit_onceToken, &__block_literal_global_51);
  }
  self->_enableDebugDrawing = JFXImageIOSurfaceView_commonInit_s_enableDebugDrawing;
  [(JFXImageIOSurfaceView *)self setRenderingType:-1];
}

void __57__JFXImageIOSurfaceView_JFXImageIOSurfaceView_commonInit__block_invoke()
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v1 = [v0 valueForKey:@"JTImageViewDebugDraw"];

  if (v1)
  {
    id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    JFXImageIOSurfaceView_commonInit_s_enableDebugDrawing = [v2 BOOLForKey:@"JTImageViewDebugDraw"];
  }
}

- (JFXImageIOSurfaceView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXImageIOSurfaceView;
  v3 = -[JFXImageIOSurfaceView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(JFXImageIOSurfaceView *)v3 JFXImageIOSurfaceView_commonInit];
  }
  return v4;
}

- (JFXImageIOSurfaceView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXImageIOSurfaceView;
  v3 = [(JFXImageIOSurfaceView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(JFXImageIOSurfaceView *)v3 JFXImageIOSurfaceView_commonInit];
  }
  return v4;
}

- (void)setJtImage:(id)a3
{
  v5 = (JTImage *)a3;
  p_jtImage = &self->_jtImage;
  if (self->_jtImage != v5)
  {
    v19 = v5;
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
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v10);
      v12 = [(JFXImageIOSurfaceView *)self layer];
      [v12 setContents:IOSurface];

      CFTypeRef v13 = CVBufferCopyAttachment(v10, (CFStringRef)*MEMORY[0x263F04020], 0);
      if (v13)
      {
        v14 = v13;
        if (v13 == (CFTypeRef)*MEMORY[0x263F04038]) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = 2;
        }
        [(JFXImageIOSurfaceView *)self setRenderingType:v15];
        CFRelease(v14);
        goto LABEL_13;
      }
      v17 = self;
      uint64_t v18 = 0;
    }
    else
    {
      v16 = [(JFXImageIOSurfaceView *)self layer];
      [v16 setContents:0];

      v17 = self;
      uint64_t v18 = -1;
    }
    [(JFXImageIOSurfaceView *)v17 setRenderingType:v18];
LABEL_13:
    v5 = v19;
  }
}

- (void)setRenderingType:(int64_t)a3
{
  if (self->_renderingType != a3)
  {
    self->_renderingType = a3;
    [(JFXImageIOSurfaceView *)self updateDebugDrawing];
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
    objc_super v6 = [(JFXImageIOSurfaceView *)self layer];
    CGAffineTransform v7 = v8;
    [v6 setAffineTransform:&v7];

    [(JFXImageIOSurfaceView *)self setNeedsDisplay];
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
    objc_super v6 = [(JFXImageIOSurfaceView *)self layer];
    CGAffineTransform v7 = v8;
    [v6 setAffineTransform:&v7];

    [(JFXImageIOSurfaceView *)self setNeedsDisplay];
  }
}

- (void)setEnableDebugDrawing:(BOOL)a3
{
  if (self->_enableDebugDrawing != a3)
  {
    self->_enableDebugDrawing = a3;
    [(JFXImageIOSurfaceView *)self updateDebugDrawing];
  }
}

- (void)updateDebugDrawing
{
  if (self->_enableDebugDrawing)
  {
    id v3 = +[JFXImageView colorFromRenderingType:self->_renderingType];
    uint64_t v4 = [v3 CGColor];
    double v5 = [(JFXImageIOSurfaceView *)self layer];
    [v5 setBorderColor:v4];

    objc_super v6 = [(JFXImageIOSurfaceView *)self layer];
    double v7 = 4.0;
  }
  else
  {
    objc_super v6 = [(JFXImageIOSurfaceView *)self layer];
    double v7 = 0.0;
  }
  id v8 = v6;
  [v6 setBorderWidth:v7];
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

- (void).cxx_destruct
{
}

@end