@interface AVTSnapshotBuilder
+ (CGImage)copyRescaledCGImage:(CGImage *)a3 by:(float)a4;
+ (id)sharedInstance;
- (AVTAvatar)avatar;
- (AVTSnapshotBuilder)init;
- (SCNRenderer)renderer;
- (double)deprecated_avtui_fieldOfViewForFramingMode:(id)a3;
- (id)_imageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5;
- (id)_imageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5 useACopy:(BOOL)a6;
- (id)animatedImageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5;
- (id)imageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5;
- (void)_applyOptions:(id)a3;
- (void)dealloc;
- (void)deprecated_avtui_applyModificationsForFramingMode:(id)a3 projectionDirectionModification:(unint64_t)a4 fieldOfViewModification:(double)a5 lensShiftModification:;
- (void)setAvatar:(id)a3;
- (void)setupAvatarWithOptions:(id)a3 useACopy:(BOOL)a4;
@end

@implementation AVTSnapshotBuilder

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)sharedInstance_snapshotter;
  return v2;
}

uint64_t __36__AVTSnapshotBuilder_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AVTSnapshotBuilder);
  uint64_t v1 = sharedInstance_snapshotter;
  sharedInstance_snapshotter = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SCNRenderer)renderer
{
  return (SCNRenderer *)self->_renderer;
}

- (void)setAvatar:(id)a3
{
  v5 = (AVTAvatar *)a3;
  p_avatar = &self->_avatar;
  if (self->_avatar != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_avatar, a3);
    snapshotedAvatar = self->_snapshotedAvatar;
    self->_snapshotedAvatar = 0;

    v5 = v8;
  }
  MEMORY[0x270F9A758](p_avatar, v5);
}

- (AVTAvatar)avatar
{
  return self->_avatar;
}

- (AVTSnapshotBuilder)init
{
  v11[1] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)AVTSnapshotBuilder;
  v2 = [(AVTSnapshotBuilder *)&v9 init];
  if (v2)
  {
    v10 = @"AVTRendererOptionInitiallyConfigureForARMode";
    v11[0] = MEMORY[0x263EFFA80];
    v3 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v4 = +[SCNRenderer rendererWithDevice:0 options:v3];
    renderer = v2->_renderer;
    v2->_renderer = (AVTRenderer *)v4;

    [(AVTRenderer *)v2->_renderer setFramingMode:@"cameraDefault"];
    v6 = objc_alloc_init(AVTSnapshotHelper);
    snapshotHelper = v2->_snapshotHelper;
    v2->_snapshotHelper = v6;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AVTSnapshotBuilder;
  [(AVTSnapshotBuilder *)&v2 dealloc];
}

- (void)_applyOptions:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"AVTSnapshotFramingMode"];
  v5 = (void *)v4;
  v6 = @"cameraHead";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v7 = v6;

  [(AVTRenderer *)self->_renderer setFramingMode:v7];
}

- (void)setupAvatarWithOptions:(id)a3 useACopy:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!self->_snapshotedAvatar)
  {
    if (v4) {
      v7 = (AVTAvatar *)[(AVTAvatar *)self->_avatar copy];
    }
    else {
      v7 = self->_avatar;
    }
    snapshotedAvatar = self->_snapshotedAvatar;
    self->_snapshotedAvatar = v7;

    [(AVTAvatar *)self->_snapshotedAvatar setOptimizeForSnapshot:1];
    [(AVTRenderer *)self->_renderer setAvatar:self->_snapshotedAvatar];
    if (!v4) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AVTAvatar *)self->_snapshotedAvatar morphTo:self->_avatar];
  }
  if (v4)
  {
LABEL_10:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(AVTAvatar *)self->_snapshotedAvatar setShowsBody:[(AVTAvatar *)self->_avatar showsBody]];
      objc_super v9 = [(AVTAvatar *)self->_avatar bodyPose];
      [(AVTAvatar *)self->_snapshotedAvatar setBodyPose:v9];
    }
  }
LABEL_12:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = self->_snapshotedAvatar;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v11 = [v6 objectForKeyedSubscript:@"AVTSnapshotMemojiPresetSubstitutions"];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v51 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(v11);
          }
          -[AVTAvatar setPreset:forCategory:animated:](v10, "setPreset:forCategory:animated:", *(void *)(*((void *)&v44 + 1) + 8 * i), [*(id *)(*((void *)&v44 + 1) + 8 * i) category], 0);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v51 count:16];
      }
      while (v13);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v16 = [v6 objectForKeyedSubscript:@"AVTSnapshotMemojiColorPresetSubstitutions"];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v16);
          }
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v10, "setColorPreset:forCategory:colorIndex:", *(void *)(*((void *)&v40 + 1) + 8 * j), [*(id *)(*((void *)&v40 + 1) + 8 * j) category], 0);
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v18);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v21 = [v6 objectForKeyedSubscript:@"AVTSnapshotMemojiSecondaryColorPresetSubstitutions"];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v49 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v21);
          }
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v10, "setColorPreset:forCategory:colorIndex:", *(void *)(*((void *)&v36 + 1) + 8 * k), [*(id *)(*((void *)&v36 + 1) + 8 * k) category], 1);
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v49 count:16];
      }
      while (v23);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v26 = objc_msgSend(v6, "objectForKeyedSubscript:", @"AVTSnapshotMemojiThirdColorPresetSubstitutions", 0);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v48 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v33;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(v26);
          }
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v10, "setColorPreset:forCategory:colorIndex:", *(void *)(*((void *)&v32 + 1) + 8 * m), [*(id *)(*((void *)&v32 + 1) + 8 * m) category], 2);
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v48 count:16];
      }
      while (v28);
    }
  }
  [(AVTAvatar *)self->_snapshotedAvatar update];
  v31 = [v6 objectForKeyedSubscript:@"AVTSnapshotPose"];
  if (v31) {
    [(AVTAvatar *)self->_snapshotedAvatar setPose:v31];
  }
}

+ (CGImage)copyRescaledCGImage:(CGImage *)a3 by:(float)a4
{
  size_t v6 = (unint64_t)(float)((float)CGImageGetWidth(a3) * a4);
  size_t v7 = (unint64_t)(float)((float)CGImageGetHeight(a3) * a4);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
  size_t v9 = (CGImageGetBitsPerPixel(a3) >> 3) * v6;
  ColorSpace = CGImageGetColorSpace(a3);
  uint32_t BitmapInfo = CGImageGetBitmapInfo(a3);
  result = CGBitmapContextCreate(0, v6, v7, BitsPerComponent, v9, ColorSpace, BitmapInfo);
  if (result)
  {
    uint64_t v13 = result;
    v15.size.width = (double)v6;
    v15.size.height = (double)v7;
    v15.origin.x = 0.0;
    v15.origin.y = 0.0;
    CGContextDrawImage(result, v15, a3);
    Image = CGBitmapContextCreateImage(v13);
    CGContextRelease(v13);
    return Image;
  }
  return result;
}

- (id)imageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  v10 = [v9 valueForKey:@"AVTSnapshotNoCopy"];
  uint64_t v11 = [v10 BOOLValue] ^ 1;

  uint64_t v12 = -[AVTSnapshotBuilder _imageWithSize:scale:options:useACopy:](self, "_imageWithSize:scale:options:useACopy:", v9, v11, width, height, a4);

  return v12;
}

- (id)_imageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  v10 = [v9 valueForKey:@"AVTSnapshotNoCopy"];
  uint64_t v11 = [v10 BOOLValue] ^ 1;

  uint64_t v12 = -[AVTSnapshotBuilder _imageWithSize:scale:options:useACopy:](self, "_imageWithSize:scale:options:useACopy:", v9, v11, width, height, a4);

  return v12;
}

- (id)_imageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5 useACopy:(BOOL)a6
{
  uint64_t v6 = a6;
  double height = a3.height;
  double width = a3.width;
  id v11 = a5;
  uint64_t v12 = (void *)MEMORY[0x2105397E0]();
  uint64_t v13 = [v11 objectForKeyedSubscript:@"AVTSnapshotShaderCollectorNeverCopyKey"];
  uint64_t v14 = v13;
  if (v13) {
    uint64_t v6 = v6 & ~[v13 BOOLValue];
  }
  [(AVTSnapshotBuilder *)self setupAvatarWithOptions:v11 useACopy:v6];
  CGRect v15 = [v11 objectForKeyedSubscript:@"AVTSnapshotAntialiasedKey"];
  if (v15)
  {
    v16 = [v11 objectForKeyedSubscript:@"AVTSnapshotAntialiasedKey"];
    if ([v16 BOOLValue]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 2;
  }

  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v19 = [v11 objectForKeyedSubscript:@"AVTSnapshotUpscaleKey"];
  [v19 floatValue];
  float v21 = v20;

  if (v21 == 0.0) {
    float v22 = 1.0;
  }
  else {
    float v22 = v21;
  }
  uint64_t v23 = [v11 objectForKeyedSubscript:@"AVTSnapshotHeroFrameKey"];
  [v23 floatValue];
  double v25 = v24;

  v26 = [v11 objectForKeyedSubscript:@"AVTSnapshotPoseAnimation"];
  uint64_t v27 = v26;
  if (v26) {
    id v28 = (id)[v26 addToAvatar:self->_snapshotedAvatar useStaticPhysicsState:0];
  }
  [(AVTSnapshotBuilder *)self _applyOptions:v11];
  [(AVTRenderer *)self->_renderer setSceneTime:v25];
  double v29 = v22;
  [(AVTRenderer *)self->_renderer set_superSamplingFactor:v29];
  v30 = [v11 objectForKeyedSubscript:@"AVTSnapshotBackgroundColorKey"];
  v31 = [(AVTRenderer *)self->_renderer backgroundColor];

  if (v31 != v30) {
    [(AVTRenderer *)self->_renderer setBackgroundColor:v30];
  }
  [MEMORY[0x263F16B08] flush];
  [(AVTRenderer *)self->_renderer updateAtTime:Current + v25];
  renderer = self->_renderer;
  snapshotHelper = self->_snapshotHelper;
  float v34 = a4;
  id v39 = 0;
  long long v35 = (void *)[(AVTSnapshotHelper *)(CGImage *)snapshotHelper newImageWithRenderer:v17 antialiasingMode:(unint64_t)(width * (v29 * a4)) pixelWidth:(unint64_t)(height * (v29 * a4)) pixelHeight:&v39 imagePointSize:width contentScaleFactor:height error:v34];
  id v36 = v39;
  if (!v35)
  {
    long long v37 = avt_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[AVTVariantBatchSnapshotter imageWithOptions:modifications:](v36);
    }
  }

  return v35;
}

- (id)animatedImageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  context = (void *)MEMORY[0x2105397E0]();
  [(AVTSnapshotBuilder *)self setupAvatarWithOptions:v9 useACopy:1];
  v10 = [v9 objectForKeyedSubscript:@"AVTSnapshotPoseAnimation"];
  id v11 = v10;
  if (v10)
  {
    id v12 = (id)[v10 addToAvatar:self->_snapshotedAvatar useStaticPhysicsState:0];
    [v11 duration];
    double v14 = v13;
  }
  else
  {
    double v14 = 2.0;
  }
  CGRect v15 = [v9 objectForKeyedSubscript:@"AVTSnapshotAntialiasedKey"];
  v50 = v11;
  if (v15)
  {
    v16 = [v9 objectForKeyedSubscript:@"AVTSnapshotAntialiasedKey"];
    if ([v16 BOOLValue]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 2;
  }

  [(AVTRenderer *)self->_renderer setJitteringEnabled:0];
  uint64_t v18 = [v9 objectForKeyedSubscript:@"AVTSnapshotUpscaleKey"];
  [v18 floatValue];
  float v20 = v19;

  if (v20 == 0.0) {
    float v21 = 1.5;
  }
  else {
    float v21 = v20;
  }
  float v22 = [v9 objectForKeyedSubscript:@"AVTSnapshotRateKey"];
  [v22 floatValue];
  float v24 = v23;

  if (v24 == 0.0) {
    float v25 = 60.0;
  }
  else {
    float v25 = v24;
  }
  double v49 = v14;
  float v26 = v14 * v25;
  int v27 = vcvtps_s32_f32(v26);
  uint64_t v52 = v9;
  [(AVTSnapshotBuilder *)self _applyOptions:v9];
  [MEMORY[0x263F16B08] flush];
  v53 = [MEMORY[0x263EFF980] array];
  v28.n128_f64[0] = CFAbsoluteTimeGetCurrent();
  if (v27 >= 1)
  {
    double v29 = v28.n128_f64[0];
    int v30 = 0;
    double v31 = v21 * a4;
    uint64_t v32 = (unint64_t)(width * v31);
    v28.n128_f64[0] = height * v31;
    uint64_t v33 = (unint64_t)v28.n128_f64[0];
    v28.n128_u32[0] = 1.0;
    do
    {
      long long v35 = (void *)MEMORY[0x2105397E0](v28);
      [(AVTRenderer *)self->_renderer setSceneTime:(float)((float)v30 / v25)];
      renderer = self->_renderer;
      [(AVTRenderer *)renderer sceneTime];
      [(AVTRenderer *)renderer updateAtTime:v29 + v37];
      float v34 = a4;
      long long v38 = (void *)[(AVTSnapshotHelper *)(CGImage *)self->_snapshotHelper newImageWithRenderer:v17 antialiasingMode:v32 pixelWidth:v33 pixelHeight:0 imagePointSize:width contentScaleFactor:height error:v34];
      id v39 = v38;
      if (v21 != 1.0)
      {
        id v40 = v38;
        uint64_t v41 = [v40 CGImage];
        long long v42 = objc_opt_class();
        *(float *)&double v43 = 1.0 / v21;
        long long v44 = (CGImage *)[v42 copyRescaledCGImage:v41 by:v43];
        id v39 = [MEMORY[0x263F1C6B0] imageWithCGImage:v44];

        CGImageRelease(v44);
      }
      if (a4 != 1.0)
      {
        long long v45 = (void *)MEMORY[0x263F1C6B0];
        id v46 = v39;
        id v39 = objc_msgSend(v45, "imageWithCGImage:scale:orientation:", objc_msgSend(v46, "CGImage"), 0, a4);
      }
      if (v39) {
        [v53 addObject:v39];
      }

      ++v30;
    }
    while (v27 != v30);
  }
  long long v47 = [MEMORY[0x263F1C6B0] animatedImageWithImages:v53 duration:v49];

  return v47;
}

- (double)deprecated_avtui_fieldOfViewForFramingMode:(id)a3
{
  id v4 = a3;
  v5 = [(AVTSnapshotBuilder *)self renderer];
  uint64_t v6 = [v5 scene];
  size_t v7 = [v6 rootNode];
  v8 = [v7 childNodeWithName:v4 recursively:1];

  id v9 = [v8 camera];
  [v9 fieldOfView];
  double v11 = v10;

  return v11;
}

- (void)deprecated_avtui_applyModificationsForFramingMode:(id)a3 projectionDirectionModification:(unint64_t)a4 fieldOfViewModification:(double)a5 lensShiftModification:
{
  double v6 = v5;
  id v10 = a3;
  id v17 = [(AVTSnapshotBuilder *)self renderer];
  double v11 = [v17 scene];
  id v12 = [v11 rootNode];
  double v13 = [v12 childNodeWithName:v10 recursively:1];

  double v14 = [v13 camera];
  [v14 setFieldOfView:a5];

  CGRect v15 = [v13 camera];
  [v15 setProjectionDirection:a4];

  v16 = [v13 camera];
  [v16 setLensShift:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotHelper, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_snapshotedAvatar, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
}

@end