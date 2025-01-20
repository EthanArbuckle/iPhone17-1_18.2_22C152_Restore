@interface DBIconDropShadowProvider
+ (void)invalidate;
- (CGImage)lightStyleShadowImage;
- (DBIconDropShadowProvider)init;
- (UIImage)iconImage;
- (void)_cleanupImages;
- (void)_shadow_drawing_queue_generateDarkStyleShadow;
- (void)_shadow_drawing_queue_generateLightStyleShadow;
- (void)dealloc;
- (void)imageForTraitCollection:(id)a3 completion:(id)a4;
- (void)setIconImage:(id)a3;
- (void)setLightStyleShadowImage:(CGImage *)a3;
@end

@implementation DBIconDropShadowProvider

+ (void)invalidate
{
  if (_darkStyleShadowImage)
  {
    CGImageRelease((CGImageRef)_darkStyleShadowImage);
    _darkStyleShadowImage = 0;
  }
}

- (DBIconDropShadowProvider)init
{
  v4.receiver = self;
  v4.super_class = (Class)DBIconDropShadowProvider;
  v2 = [(DBIconDropShadowProvider *)&v4 init];
  if (v2 && init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global_8);
  }
  return v2;
}

void __32__DBIconDropShadowProvider_init__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F00628] context];
  v1 = (void *)_ciContext;
  _ciContext = v0;

  objc_super v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.carplayapp.shadowdrawing", v4);
  v3 = (void *)_shadowDrawingQueue;
  _shadowDrawingQueue = (uint64_t)v2;
}

- (void)dealloc
{
  [(DBIconDropShadowProvider *)self _cleanupImages];
  v3.receiver = self;
  v3.super_class = (Class)DBIconDropShadowProvider;
  [(DBIconDropShadowProvider *)&v3 dealloc];
}

- (void)imageForTraitCollection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 userInterfaceStyle];
  if (v8 && (uint64_t v9 = v8, [v6 userInterfaceIdiom] == 3))
  {
    if (v9 == 1)
    {
      lightStyleShadowImage = self->_lightStyleShadowImage;
      if (!lightStyleShadowImage)
      {
        objc_initWeak(&location, self);
        v11 = _shadowDrawingQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __63__DBIconDropShadowProvider_imageForTraitCollection_completion___block_invoke;
        block[3] = &unk_2649B52D8;
        objc_copyWeak(&v19, &location);
        block[4] = self;
        id v18 = v7;
        dispatch_async(v11, block);

        v12 = &v19;
LABEL_11:
        objc_destroyWeak(v12);
        objc_destroyWeak(&location);
        goto LABEL_9;
      }
    }
    else
    {
      lightStyleShadowImage = (CGImage *)_darkStyleShadowImage;
      if (!_darkStyleShadowImage)
      {
        objc_initWeak(&location, self);
        v13 = _shadowDrawingQueue;
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __63__DBIconDropShadowProvider_imageForTraitCollection_completion___block_invoke_2;
        v14[3] = &unk_2649B5300;
        objc_copyWeak(&v16, &location);
        id v15 = v7;
        dispatch_async(v13, v14);

        v12 = &v16;
        goto LABEL_11;
      }
    }
    (*((void (**)(id, CGImage *))v7 + 2))(v7, lightStyleShadowImage);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_9:
}

uint64_t __63__DBIconDropShadowProvider_imageForTraitCollection_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_shadow_drawing_queue_generateLightStyleShadow");

  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __63__DBIconDropShadowProvider_imageForTraitCollection_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_shadow_drawing_queue_generateDarkStyleShadow");

  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (void)setIconImage:(id)a3
{
  v5 = (UIImage *)a3;
  p_iconImage = &self->_iconImage;
  if (self->_iconImage != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_iconImage, a3);
    p_iconImage = (UIImage **)[(DBIconDropShadowProvider *)self _cleanupImages];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_iconImage, v5);
}

- (void)_cleanupImages
{
  lightStyleShadowImage = self->_lightStyleShadowImage;
  if (lightStyleShadowImage)
  {
    CGImageRelease(lightStyleShadowImage);
    self->_lightStyleShadowImage = 0;
  }
}

- (void)_shadow_drawing_queue_generateLightStyleShadow
{
  dispatch_assert_queue_V2((dispatch_queue_t)_shadowDrawingQueue);
  objc_super v3 = [(DBIconDropShadowProvider *)self iconImage];
  if (v3 && !self->_lightStyleShadowImage)
  {
    id v40 = v3;
    [v3 size];
    double v5 = v4;
    [v40 size];
    double v7 = v6;
    [v40 size];
    double v9 = v8;
    [v40 scale];
    double v11 = v9 * v10;
    [v40 size];
    double v13 = v12;
    [v40 scale];
    double v15 = v13 * v14;
    [v40 size];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [v40 scale];
    CGFloat v21 = v20;
    v42.width = v17;
    v42.height = v19;
    UIGraphicsBeginImageContextWithOptions(v42, 0, v21);
    CurrentContext = UIGraphicsGetCurrentContext();
    v23 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v5, v7, 13.5);
    [v23 addClip];

    objc_msgSend(v40, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, v5, v7, 0.25);
    v24 = [MEMORY[0x263F825C8] blackColor];
    v25 = [v24 colorWithAlphaComponent:0.100000001];
    [v25 set];

    v43.origin.x = 0.0;
    v43.origin.y = 0.0;
    v43.size.width = v5;
    v43.size.height = v7;
    CGContextFillRect(CurrentContext, v43);
    Data = CGBitmapContextGetData(CurrentContext);
    size_t BytesPerRow = CGBitmapContextGetBytesPerRow(CurrentContext);
    v28 = [MEMORY[0x263EFF8F8] dataWithBytes:Data length:CGBitmapContextGetHeight(CurrentContext) * BytesPerRow];
    CGColorSpaceRef ColorSpace = CGBitmapContextGetColorSpace(CurrentContext);
    id v30 = objc_alloc(MEMORY[0x263F00650]);
    uint64_t v31 = *MEMORY[0x263F00868];
    v32 = objc_msgSend(v30, "initWithBitmapData:bytesPerRow:size:format:colorSpace:", v28, BytesPerRow, v31, ColorSpace, v11, v15);
    v33 = [MEMORY[0x263F00640] filterWithName:@"CIGaussianBlur"];
    [v33 setDefaults];
    [v33 setValue:v32 forKey:*MEMORY[0x263F00968]];
    v34 = NSNumber;
    [v40 scale];
    double v36 = v35 * 4.0;
    *(float *)&double v36 = v36;
    v37 = [v34 numberWithFloat:v36];
    [v33 setValue:v37 forKey:@"inputRadius"];

    v38 = [v33 valueForKey:*MEMORY[0x263F009D0]];

    v39 = (void *)_ciContext;
    [v38 extent];
    self->_lightStyleShadowImage = (CGImage *)objc_msgSend(v39, "createCGImage:fromRect:format:colorSpace:", v38, v31, ColorSpace);

    objc_super v3 = v40;
  }
}

- (void)_shadow_drawing_queue_generateDarkStyleShadow
{
  dispatch_assert_queue_V2((dispatch_queue_t)_shadowDrawingQueue);
  id v20 = [MEMORY[0x263F157E8] layer];
  objc_super v3 = [(DBIconDropShadowProvider *)self iconImage];
  double v4 = v3;
  if (v3 && !_darkStyleShadowImage)
  {
    [v3 scale];
    objc_msgSend(v20, "setContentsScale:");
    [v4 size];
    CGFloat v6 = v5 * 1.5;
    CGFloat v8 = v7 * 1.5;
    [v4 size];
    double v10 = v9;
    [v4 size];
    double v12 = v11;
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, v6, v8);
    double v13 = [MEMORY[0x263F157E8] layer];
    id v14 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
    objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));
    id v15 = v14;
    objc_msgSend(v13, "setShadowColor:", objc_msgSend(v15, "CGColor"));
    [v13 setShadowRadius:4.0];
    LODWORD(v16) = 1.0;
    [v13 setShadowOpacity:v16];
    [v13 setCornerRadius:13.5];
    [v13 setCornerCurve:*MEMORY[0x263F15A20]];
    [v13 setShadowPathIsBounds:1];
    objc_msgSend(v13, "setFrame:", 1015.0, 0.0, v10, v12);
    objc_msgSend(v13, "setShadowOffset:", -1000.0, 12.0);
    [v20 addSublayer:v13];
    [v4 scale];
    CGFloat v18 = v17;
    v22.width = v6;
    v22.height = v8;
    UIGraphicsBeginImageContextWithOptions(v22, 0, v18);
    CurrentContext = UIGraphicsGetCurrentContext();
    [v20 renderInContext:CurrentContext];
    _darkStyleShadowImage = (uint64_t)CGBitmapContextCreateImage(CurrentContext);
  }
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (CGImage)lightStyleShadowImage
{
  return self->_lightStyleShadowImage;
}

- (void)setLightStyleShadowImage:(CGImage *)a3
{
  self->_lightStyleShadowImage = a3;
}

- (void).cxx_destruct
{
}

@end