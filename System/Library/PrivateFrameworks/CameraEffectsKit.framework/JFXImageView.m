@interface JFXImageView
+ (BOOL)normalizedQuadVertices:(id *)a3 viewSize:(CGSize)a4 textureSize:(CGSize)a5 contentMode:(int64_t)a6;
+ (id)colorFromImageViewType:(int64_t)a3;
+ (id)colorFromRenderingType:(int64_t)a3;
- (BOOL)disableIOSurface;
- (BOOL)disableMetalKit;
- (BOOL)enableDebugDrawing;
- (BOOL)preferIOSurfaceForYUV;
- (BOOL)preferMetalKit;
- (JFXImageView)initWithCoder:(id)a3;
- (JFXImageView)initWithFrame:(CGRect)a3;
- (JTImage)jtImage;
- (UIView)imageView;
- (id)stringFromImageViewType:(int64_t)a3;
- (int64_t)currentImageViewType;
- (int64_t)imageViewType;
- (int64_t)preferredImageViewTypeForImage:(id)a3;
- (void)JFXImageView_commonInit;
- (void)flipX;
- (void)reconfigureImageView;
- (void)setContentMode:(int64_t)a3;
- (void)setCurrentImageViewType:(int64_t)a3;
- (void)setDisableIOSurface:(BOOL)a3;
- (void)setDisableMetalKit:(BOOL)a3;
- (void)setEnableDebugDrawing:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setImageViewType:(int64_t)a3;
- (void)setJtImage:(id)a3;
- (void)setPreferIOSurfaceForYUV:(BOOL)a3;
- (void)setPreferMetalKit:(BOOL)a3;
- (void)updateDebugDrawing;
- (void)updateImageViewImage;
@end

@implementation JFXImageView

- (JFXImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXImageView;
  v3 = -[JFXImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(JFXImageView *)v3 JFXImageView_commonInit];
  }
  return v4;
}

- (JFXImageView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXImageView;
  v3 = [(JFXImageView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(JFXImageView *)v3 JFXImageView_commonInit];
  }
  return v4;
}

- (void)JFXImageView_commonInit
{
  if (JFXImageView_commonInit_onceToken != -1) {
    dispatch_once(&JFXImageView_commonInit_onceToken, &__block_literal_global_53);
  }
  self->_enableDebugDrawing = JFXImageView_commonInit_s_enableDebugDrawing;
  self->_disableIOSurface = JFXImageView_commonInit_s_disableIOSurface;
  self->_disableMetalKit = JFXImageView_commonInit_s_disableMetalKit;
  self->_preferIOSurfaceForYUV = 0;
  self->_preferMetalKit = 0;
  jtImage = self->_jtImage;
  self->_jtImage = 0;

  imageView = self->_imageView;
  self->_imageView = 0;

  self->_imageViewType = 0;
  [(JFXImageView *)self setCurrentImageViewType:-1];
}

void __39__JFXImageView_JFXImageView_commonInit__block_invoke()
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v1 = [v0 valueForKey:@"JTImageViewDebugDraw"];

  if (v1)
  {
    v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    JFXImageView_commonInit_s_enableDebugDrawing = [v2 BOOLForKey:@"JTImageViewDebugDraw"];
  }
  v3 = JFXLog_core();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_3(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v12 = [v11 valueForKey:@"JTImageIOSurfaceViewDisabled"];

  if (v12)
  {
    v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
    JFXImageView_commonInit_s_disableIOSurface = [v13 BOOLForKey:@"JTImageIOSurfaceViewDisabled"];
  }
  v14 = JFXLog_core();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
  }

  v22 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v23 = [v22 valueForKey:@"JTImageMTKViewDisabled"];

  if (v23)
  {
    v24 = [MEMORY[0x263EFFA40] standardUserDefaults];
    JFXImageView_commonInit_s_disableMetalKit = [v24 BOOLForKey:@"JTImageMTKViewDisabled"];
  }
  v25 = JFXLog_core();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_1(v25, v26, v27, v28, v29, v30, v31, v32);
  }
}

- (void)reconfigureImageView
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSNumber numberWithInteger:a2];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_234C41000, a3, OS_LOG_TYPE_DEBUG, "configuring %@ for mode %@ (1:uiimage 2:iosurface 3:metal)", (uint8_t *)&v6, 0x16u);
}

- (void)updateImageViewImage
{
  v3 = [(JFXImageView *)self imageView];

  if (v3)
  {
    switch(self->_currentImageViewType)
    {
      case 1:
        id v12 = [(JFXImageView *)self imageView];
        uint64_t v4 = [(JTImage *)self->_jtImage image];
        [v12 setImage:v4];

        uint64_t v5 = [(JFXImageView *)self layer];
        [v5 borderWidth];
        double v7 = v6 + v6;
        __int16 v8 = [v12 layer];
        [v8 setBorderWidth:v7];

        if (self->_enableDebugDrawing)
        {
          id v9 = [MEMORY[0x263F1C550] blueColor];
          uint64_t v10 = [v9 CGColor];
          v11 = [v12 layer];
          [v11 setBorderColor:v10];
        }
        goto LABEL_4;
      case 2:
      case 3:
      case 4:
        id v12 = [(JFXImageView *)self imageView];
        [v12 setJtImage:self->_jtImage];
LABEL_4:

        break;
      default:
        return;
    }
  }
}

- (id)stringFromImageViewType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"None";
  }
  else {
    return (id)*((void *)&off_264C0C6C8 + a3);
  }
}

- (int64_t)preferredImageViewTypeForImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 hasPVImageBufferAndCanCreateCVPixelBufferWithoutCopy])
    {
      double v6 = [MEMORY[0x263F1C5C0] currentDevice];
      double v7 = objc_msgSend(v6, "jfx_displayColorSpace");

      if ([v7 isHDRSpace]
        && ([v5 pvImageBuffer],
            __int16 v8 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(MEMORY[0x263F61230], "jfx_getColorSpaceFromImageBuffer:", v8),
            id v9 = objc_claimAutoreleasedReturnValue(),
            char v10 = [v9 isHDRSpace],
            v9,
            v8,
            (v10 & 1) != 0))
      {
        int64_t v11 = 3;
      }
      else if (self->_disableIOSurface || !self->_preferIOSurfaceForYUV)
      {
        if (self->_disableMetalKit || !self->_preferMetalKit) {
          int64_t v11 = 1;
        }
        else {
          int64_t v11 = 4;
        }
      }
      else
      {
        int64_t v11 = 2;
      }
    }
    else
    {
      int64_t v11 = 1;
    }
  }
  else
  {
    int64_t v11 = -1;
  }

  return v11;
}

- (void)flipX
{
  if (self->_currentImageViewType == 1)
  {
    id v4 = [(JFXImageView *)self imageView];
    v2 = [v4 image];
    v3 = [v2 imageWithHorizontallyFlippedOrientation];
    [v4 setImage:v3];
  }
}

- (void)updateDebugDrawing
{
  if (self->_enableDebugDrawing)
  {
    id v3 = +[JFXImageView colorFromImageViewType:self->_currentImageViewType];
    uint64_t v4 = [v3 CGColor];
    uint64_t v5 = [(JFXImageView *)self layer];
    [v5 setBorderColor:v4];

    double v6 = [(JFXImageView *)self layer];
    double v7 = 2.0;
  }
  else
  {
    double v6 = [(JFXImageView *)self layer];
    double v7 = 0.0;
  }
  id v8 = v6;
  [v6 setBorderWidth:v7];
}

+ (id)colorFromImageViewType:(int64_t)a3
{
  switch(a3)
  {
    case -1:
      objc_msgSend(MEMORY[0x263F1C550], "redColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 0:
      objc_msgSend(MEMORY[0x263F1C550], "yellowColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      objc_msgSend(MEMORY[0x263F1C550], "purpleColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
      objc_msgSend(MEMORY[0x263F1C550], "orangeColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      objc_msgSend(MEMORY[0x263F1C550], "greenColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4:
      objc_msgSend(MEMORY[0x263F1C550], "cyanColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
      break;
    default:
      break;
  }
  return a1;
}

+ (id)colorFromRenderingType:(int64_t)a3
{
  switch(a3)
  {
    case -1:
      objc_msgSend(MEMORY[0x263F1C550], "blackColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 0:
      objc_msgSend(MEMORY[0x263F1C550], "blueColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      objc_msgSend(MEMORY[0x263F1C550], "magentaColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      objc_msgSend(MEMORY[0x263F1C550], "whiteColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      objc_msgSend(MEMORY[0x263F1C550], "brownColor", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
      break;
    default:
      break;
  }
  return a1;
}

+ (BOOL)normalizedQuadVertices:(id *)a3 viewSize:(CGSize)a4 textureSize:(CGSize)a5 contentMode:(int64_t)a6
{
  if (!a3) {
    return 0;
  }
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (a4.width == *MEMORY[0x263F001B0] && a4.height == v6) {
    return 0;
  }
  if (a5.width == *MEMORY[0x263F001B0] && a5.height == v6) {
    return 0;
  }
  if ((unint64_t)(a6 - 4) < 9)
  {
    float v10 = a4.width + a4.width;
    float v11 = a4.height + a4.height;
    v14.f32[0] = a5.width / v10;
    CGFloat v12 = a5.height / v11;
    *(float *)&CGFloat v12 = v12;
    float32x4_t v13 = vmulq_n_f32((float32x4_t)xmmword_234D61770, v14.f32[0]);
    v14.i32[1] = -1082130432;
    float32x4_t v15 = vmulq_n_f32((float32x4_t)xmmword_234D61780, *(float *)&v12);
    switch(a6)
    {
      case 5:
        goto LABEL_23;
      case 6:
        goto LABEL_27;
      case 7:
        v14.f32[0] = 1.0 - v13.f32[0];
        goto LABEL_21;
      case 8:
        v14.f32[0] = -1.0 - v13.f32[1];
LABEL_21:
        float32x4_t v13 = vsubq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0));
        goto LABEL_29;
      case 9:
        v14.f32[0] = 1.0 - v13.f32[0];
        float32x4_t v14 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0);
        float32x4_t v13 = vsubq_f32(v13, v14);
LABEL_23:
        v14.f32[0] = -1.0 - v15.f32[0];
        goto LABEL_28;
      case 10:
        v14.f32[0] = -1.0 - v13.f32[1];
        float32x4_t v14 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0);
        float32x4_t v13 = vsubq_f32(v13, v14);
        v14.f32[0] = -1.0 - v15.f32[0];
        goto LABEL_28;
      case 11:
        *(float *)&CGFloat v12 = 1.0 - v13.f32[0];
        float32x4_t v13 = vsubq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v12, 0));
        v14.f32[0] = 1.0 - v15.f32[2];
        goto LABEL_28;
      case 12:
        v14.f32[0] = -1.0 - v13.f32[1];
        float32x4_t v14 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0);
        float32x4_t v13 = vsubq_f32(v13, v14);
LABEL_27:
        v14.f32[0] = 1.0 - v15.f32[2];
LABEL_28:
        float32x4_t v15 = vsubq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 0));
        break;
      default:
        goto LABEL_29;
    }
    goto LABEL_29;
  }
  float32x4_t v13 = (float32x4_t)xmmword_234D61770;
  float32x4_t v15 = (float32x4_t)xmmword_234D61780;
  if (a6)
  {
    float v17 = a4.width / a4.height;
    float v18 = a5.width / a5.height;
    if (a6 == 2)
    {
      if (v18 <= v17)
      {
LABEL_19:
        float32x4_t v15 = vmulq_n_f32((float32x4_t)xmmword_234D61780, v17 / v18);
        goto LABEL_29;
      }
    }
    else
    {
      if (a6 != 1)
      {
        v25 = JFXLog_core();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_234C41000, v25, OS_LOG_TYPE_DEFAULT, "Unsupported content mode. Falling back to UIViewContentModeScaleToFill", buf, 2u);
        }

        float32x4_t v15 = (float32x4_t)xmmword_234D61780;
        float32x4_t v13 = (float32x4_t)xmmword_234D61770;
        goto LABEL_29;
      }
      if (v18 > v17) {
        goto LABEL_19;
      }
    }
    float32x4_t v13 = vmulq_n_f32((float32x4_t)xmmword_234D61770, v18 / v17);
  }
LABEL_29:
  __asm { FMOV            V1.2S, #1.0 }
  *(int32x2_t *)a3 = vzip1_s32(*(int32x2_t *)v13.f32, *(int32x2_t *)v15.f32);
  *((void *)a3 + 1) = _D1;
  *((int32x2_t *)a3 + 2) = vzip2_s32(*(int32x2_t *)v13.f32, *(int32x2_t *)v15.f32);
  *((void *)a3 + 3) = 0x3F80000000000000;
  int32x2_t v23 = (int32x2_t)vextq_s8((int8x16_t)v15, (int8x16_t)v15, 8uLL).u64[0];
  int32x2_t v24 = (int32x2_t)vextq_s8((int8x16_t)v13, (int8x16_t)v13, 8uLL).u64[0];
  *((int32x2_t *)a3 + 4) = vzip1_s32(v24, v23);
  *((void *)a3 + 5) = 1065353216;
  *((int32x2_t *)a3 + 6) = vzip2_s32(v24, v23);
  *((void *)a3 + 7) = 0;
  return 1;
}

- (void)setJtImage:(id)a3
{
  uint64_t v5 = (JTImage *)a3;
  p_jtImage = &self->_jtImage;
  if (self->_jtImage != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_jtImage, a3);
    p_jtImage = (JTImage **)[(JFXImageView *)self reconfigureImageView];
    uint64_t v5 = v7;
  }
  MEMORY[0x270F9A758](p_jtImage, v5);
}

- (void)setImageViewType:(int64_t)a3
{
  if (self->_imageViewType != a3)
  {
    self->_imageViewType = a3;
    [(JFXImageView *)self reconfigureImageView];
  }
}

- (void)setPreferIOSurfaceForYUV:(BOOL)a3
{
  if (self->_preferIOSurfaceForYUV != a3)
  {
    self->_preferIOSurfaceForYUV = a3;
    [(JFXImageView *)self reconfigureImageView];
  }
}

- (void)setDisableIOSurface:(BOOL)a3
{
  if (self->_disableIOSurface != a3)
  {
    self->_disableIOSurface = a3;
    [(JFXImageView *)self reconfigureImageView];
  }
}

- (void)setPreferMetalKit:(BOOL)a3
{
  if (self->_preferMetalKit != a3)
  {
    self->_preferMetalKit = a3;
    [(JFXImageView *)self reconfigureImageView];
  }
}

- (void)setDisableMetalKit:(BOOL)a3
{
  if (self->_disableMetalKit != a3)
  {
    self->_disableMetalKit = a3;
    [(JFXImageView *)self reconfigureImageView];
  }
}

- (void)setCurrentImageViewType:(int64_t)a3
{
  if (self->_currentImageViewType != a3)
  {
    self->_currentImageViewType = a3;
    [(JFXImageView *)self updateDebugDrawing];
  }
}

- (void)setEnableDebugDrawing:(BOOL)a3
{
  if (self->_enableDebugDrawing != a3)
  {
    self->_enableDebugDrawing = a3;
    [(JFXImageView *)self updateDebugDrawing];
  }
}

- (void)setContentMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXImageView;
  -[JFXImageView setContentMode:](&v6, sel_setContentMode_);
  uint64_t v5 = [(JFXImageView *)self imageView];
  [v5 setContentMode:a3];
}

- (JTImage)jtImage
{
  return self->_jtImage;
}

- (int64_t)imageViewType
{
  return self->_imageViewType;
}

- (int64_t)currentImageViewType
{
  return self->_currentImageViewType;
}

- (BOOL)preferIOSurfaceForYUV
{
  return self->_preferIOSurfaceForYUV;
}

- (BOOL)preferMetalKit
{
  return self->_preferMetalKit;
}

- (BOOL)enableDebugDrawing
{
  return self->_enableDebugDrawing;
}

- (BOOL)disableIOSurface
{
  return self->_disableIOSurface;
}

- (BOOL)disableMetalKit
{
  return self->_disableMetalKit;
}

- (UIView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_jtImage, 0);
}

void __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__JFXImageView_JFXImageView_commonInit__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end