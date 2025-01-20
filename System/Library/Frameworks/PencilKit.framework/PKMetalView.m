@interface PKMetalView
+ (void)installLuminanceColorFilterOnLayer:(uint64_t)a3 lightLuma:(void *)a4 darkLuma:;
- (id)metalLayer;
- (id)metalMultiplyLayer;
- (uint64_t)flushDrawables;
- (uint64_t)isDrawableAvailable;
- (uint64_t)setPixelFormat:(uint64_t)result;
- (uint64_t)setPresentsWithTransaction:(uint64_t)result;
- (void)accessibilityInvertColorsStatusDidChange:(id)a3;
- (void)initWithFrame:(double)a3 andPixelSize:(double)a4 pixelFormat:(double)a5;
- (void)resizeDrawableIfNecessary;
- (void)setDoubleBuffered:(uint64_t)a1;
- (void)setSixChannelBlending:(uint64_t)a1;
- (void)setUseLuminanceColorFilter:(uint64_t)a1;
- (void)setupMetalLayer:(uint64_t)a1;
@end

@implementation PKMetalView

- (id)metalLayer
{
  if (a1)
  {
    a1 = (id *)a1[52];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setupMetalLayer:(uint64_t)a1
{
  id v4 = a2;
  [*(id *)(a1 + 416) setPixelFormat:*(void *)(a1 + 440)];
  v3 = +[PKMetalUtility defaultDevice];
  [v4 setDevice:v3];

  [v4 setOpaque:1];
  [v4 setFramebufferOnly:1];
  [v4 setLowLatency:1];
  if (objc_opt_respondsToSelector()) {
    [v4 setLowWorkload:1];
  }
  [v4 setAllowsDisplayCompositingWithCopy:0];
  if (!*(unsigned char *)(a1 + 432))
  {
    +[PKMetalUtility layerContentsScale];
    objc_msgSend(v4, "setContentsScale:");
  }
}

- (void)resizeDrawableIfNecessary
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 frame];
    double v3 = v2;
    double v5 = v4;
    objc_msgSend(*(id *)(a1 + 408), "setFrame:", 0.0, 0.0);
    id v6 = *(id *)(a1 + 416);
    objc_msgSend(v6, "setFrame:", 0.0, 0.0, v3, v5);

    id v7 = *(id *)(a1 + 424);
    objc_msgSend(v7, "setFrame:", 0.0, 0.0, v3, v5);

    if (*(unsigned char *)(a1 + 432))
    {
      if (v3 > 0.0 && v5 > 0.0)
      {
        if (*(double *)(a1 + 448) / v3 >= *(double *)(a1 + 456) / v5) {
          double v8 = *(double *)(a1 + 448) / v3;
        }
        else {
          double v8 = *(double *)(a1 + 456) / v5;
        }
        id v9 = *(id *)(a1 + 416);
        [v9 setContentsScale:v8];

        id v10 = *(id *)(a1 + 424);
        [v10 setContentsScale:v8];
      }
      double v11 = *(double *)(a1 + 448);
      double v12 = *(double *)(a1 + 456);
      id v13 = *(id *)(a1 + 416);
      [v13 drawableSize];
      double v15 = v14;
      double v17 = v16;

      if (v11 != v15 || v12 != v17)
      {
        v19 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          double v62 = *(double *)(a1 + 448);
          double v63 = *(double *)(a1 + 456);
          v64 = -[PKMetalView metalLayer]((id *)a1);
          [v64 contentsScale];
          int v70 = 134218496;
          double v71 = v62;
          __int16 v72 = 2048;
          double v73 = v63;
          __int16 v74 = 2048;
          uint64_t v75 = v65;
          _os_log_debug_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_DEBUG, "Resize drawable to: %g %g, contentsScale: %g", (uint8_t *)&v70, 0x20u);
        }
        double v20 = *(double *)(a1 + 448);
        double v21 = *(double *)(a1 + 456);
        id v22 = *(id *)(a1 + 416);
        objc_msgSend(v22, "setDrawableSize:", v20, v21);
      }
      id v23 = *(id *)(a1 + 424);
      if (v23)
      {
        v24 = v23;
        double v25 = *(double *)(a1 + 448);
        double v26 = *(double *)(a1 + 456);
        id v27 = *(id *)(a1 + 424);
        [v27 drawableSize];
        double v29 = v28;
        double v31 = v30;

        if (v25 != v29 || v26 != v31)
        {
          v33 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            double v66 = *(double *)(a1 + 448);
            double v67 = *(double *)(a1 + 456);
            v68 = -[PKMetalView metalMultiplyLayer]((id *)a1);
            [v68 contentsScale];
            int v70 = 134218496;
            double v71 = v66;
            __int16 v72 = 2048;
            double v73 = v67;
            __int16 v74 = 2048;
            uint64_t v75 = v69;
            _os_log_debug_impl(&dword_1C44F8000, v33, OS_LOG_TYPE_DEBUG, "Resize multiply drawable to: %g %g, contentsScale: %g", (uint8_t *)&v70, 0x20u);
          }
          double v34 = *(double *)(a1 + 448);
          double v35 = *(double *)(a1 + 456);
LABEL_39:
          id v61 = *(id *)(a1 + 424);
          objc_msgSend(v61, "setDrawableSize:", v34, v35);
        }
      }
    }
    else
    {
      id v36 = *(id *)(a1 + 416);
      [v36 contentsScale];
      double v38 = v3 * v37;

      id v39 = *(id *)(a1 + 416);
      [v39 contentsScale];
      double v41 = v5 * v40;

      +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", v38, v41);
      double v34 = v42;
      double v35 = v43;
      id v44 = *(id *)(a1 + 416);
      [v44 drawableSize];
      double v46 = v45;
      double v48 = v47;

      if (v34 != v46 || v35 != v48)
      {
        v50 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          int v70 = 134218240;
          double v71 = v34;
          __int16 v72 = 2048;
          double v73 = v35;
          _os_log_debug_impl(&dword_1C44F8000, v50, OS_LOG_TYPE_DEBUG, "Resize drawable to: %g %g", (uint8_t *)&v70, 0x16u);
        }

        id v51 = *(id *)(a1 + 416);
        objc_msgSend(v51, "setDrawableSize:", v34, v35);
      }
      id v52 = *(id *)(a1 + 424);
      if (v52)
      {
        v53 = v52;
        id v54 = *(id *)(a1 + 424);
        [v54 drawableSize];
        double v56 = v55;
        double v58 = v57;

        if (v34 != v56 || v35 != v58)
        {
          v60 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            int v70 = 134218240;
            double v71 = v34;
            __int16 v72 = 2048;
            double v73 = v35;
            _os_log_debug_impl(&dword_1C44F8000, v60, OS_LOG_TYPE_DEBUG, "Resize multiply drawable to: %g %g", (uint8_t *)&v70, 0x16u);
          }

          goto LABEL_39;
        }
      }
    }
  }
}

- (void)initWithFrame:(double)a3 andPixelSize:(double)a4 pixelFormat:(double)a5
{
  if (!a1) {
    return 0;
  }
  v19.receiver = a1;
  v19.super_class = (Class)PKMetalView;
  double v11 = objc_msgSendSuper2(&v19, sel_initWithFrame_);
  double v12 = v11;
  if (v11)
  {
    v11[55] = a2;
    BOOL v13 = a7 != *MEMORY[0x1E4F1DB30];
    if (a8 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      BOOL v13 = 1;
    }
    *((unsigned char *)v11 + 432) = v13;
    *((double *)v11 + 56) = a7;
    *((double *)v11 + 57) = a8;
    id v14 = objc_alloc_init(MEMORY[0x1E4F39C20]);
    double v15 = (void *)v12[52];
    v12[52] = v14;
    id v16 = v14;

    double v17 = [v12 layer];
    [v17 addSublayer:v16];

    -[PKMetalView setupMetalLayer:]((uint64_t)v12, v16);
    -[PKMetalView resizeDrawableIfNecessary]((uint64_t)v12);
    [v12 setUserInteractionEnabled:0];
  }
  return v12;
}

- (uint64_t)setPixelFormat:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(void *)(result + 440) != a2)
    {
      *(void *)(result + 440) = a2;
      -[PKMetalView flushDrawables](result);
      [*(id *)(v3 + 416) setPixelFormat:a2];
      double v4 = *(void **)(v3 + 424);
      return [v4 setPixelFormat:a2];
    }
  }
  return result;
}

- (uint64_t)flushDrawables
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 416) discardContents];
    [*(id *)(v1 + 416) removeBackBuffers];
    [*(id *)(v1 + 424) discardContents];
    double v2 = *(void **)(v1 + 424);
    return [v2 removeBackBuffers];
  }
  return result;
}

- (id)metalMultiplyLayer
{
  if (a1)
  {
    a1 = (id *)a1[53];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSixChannelBlending:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 434) != a2)
  {
    if (a2)
    {
      if (*(void *)(a1 + 408))
      {
        uint64_t v3 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)double v15 = 0;
          _os_log_error_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_ERROR, "6-channel blending is not allowed with a luminance filter", v15, 2u);
        }
      }
      else
      {
        *(unsigned char *)(a1 + 434) = a2;
        id v7 = [(id)a1 layer];
        [v7 setAllowsGroupBlending:0];

        double v8 = [(id)a1 layer];
        [v8 setAllowsGroupOpacity:0];

        id v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A248]];
        [*(id *)(a1 + 416) setCompositingFilter:v9];

        [*(id *)(a1 + 416) setAllowsGroupOpacity:0];
        if (!*(void *)(a1 + 424))
        {
          id v10 = objc_alloc_init(MEMORY[0x1E4F39C20]);
          double v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A298]];
          [v10 setCompositingFilter:v11];

          [v10 setAllowsGroupOpacity:0];
          double v12 = *(void **)(a1 + 424);
          *(void *)(a1 + 424) = v10;
          id v13 = v10;

          id v14 = [(id)a1 layer];
          [v14 insertSublayer:v13 below:*(void *)(a1 + 416)];

          -[PKMetalView setupMetalLayer:](a1, v13);
          -[PKMetalView resizeDrawableIfNecessary](a1);
        }
      }
    }
    else
    {
      *(unsigned char *)(a1 + 434) = 0;
      double v4 = [(id)a1 layer];
      [v4 setAllowsGroupBlending:1];

      [*(id *)(a1 + 416) setAllowsGroupOpacity:1];
      [*(id *)(a1 + 416) setCompositingFilter:0];
      double v5 = *(void **)(a1 + 424);
      if (v5)
      {
        [v5 removeFromSuperlayer];
        id v6 = *(void **)(a1 + 424);
        *(void *)(a1 + 424) = 0;
      }
    }
  }
}

- (void)setUseLuminanceColorFilter:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 435) != a2)
  {
    if (a2 && *(void *)(a1 + 424))
    {
      double v4 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_ERROR, "Luminance color filter is not allowed with 6-channel blending", buf, 2u);
      }
    }
    else
    {
      [*(id *)(a1 + 416) removeFromSuperlayer];
      [*(id *)(a1 + 408) removeFromSuperlayer];
      double v5 = *(void **)(a1 + 408);
      *(void *)(a1 + 408) = 0;

      *(unsigned char *)(a1 + 435) = a2;
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v7 = v6;
      if (a2)
      {
        [v6 addObserver:a1 selector:sel_accessibilityInvertColorsStatusDidChange_ name:*MEMORY[0x1E4FB2450] object:0];

        id v8 = objc_alloc_init(MEMORY[0x1E4F39B40]);
        id v9 = *(void **)(a1 + 408);
        *(void *)(a1 + 408) = v8;

        [*(id *)(a1 + 408) setReducesCaptureBitDepth:1];
        [*(id *)(a1 + 408) setIgnoresScreenClip:1];
        [*(id *)(a1 + 408) setScale:0.25];
        id v10 = [(id)a1 layer];
        [v10 addSublayer:*(void *)(a1 + 408)];

        [*(id *)(a1 + 408) setMask:*(void *)(a1 + 416)];
        [(id)a1 bounds];
        double v12 = v11;
        [(id)a1 bounds];
        objc_msgSend(*(id *)(a1 + 408), "setFrame:", 0.0, 0.0, v12);
        id v13 = *(void **)(a1 + 408);
        +[PKMetalView installLuminanceColorFilterOnLayer:lightLuma:darkLuma:](0.0, 1.0, (uint64_t)PKMetalView, v13);
      }
      else
      {
        [v6 removeObserver:a1 name:*MEMORY[0x1E4FB2450] object:0];

        id v14 = [(id)a1 layer];
        [v14 addSublayer:*(void *)(a1 + 416)];
      }
    }
  }
}

+ (void)installLuminanceColorFilterOnLayer:(uint64_t)a3 lightLuma:(void *)a4 darkLuma:
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  self;
  id v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v7 setName:@"gaussianBlur"];
  [v7 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
  [v7 setValue:&unk_1F200F110 forKeyPath:@"inputRadius"];
  id v8 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A268]];
  self;
  id v9 = DKUCreateRGBABitmapContext(0, 256.0, 1.0, 1.0);
  if (v9)
  {
    id v10 = v9;
    BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
    if (IsInvertColorsEnabled) {
      double v12 = a1;
    }
    else {
      double v12 = a2;
    }
    if (!IsInvertColorsEnabled) {
      a2 = a1;
    }
    CGContextSetRGBFillColor(v10, v12, v12, v12, 1.0);
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.height = 1.0;
    v16.size.width = 128.0;
    CGContextFillRect(v10, v16);
    CGContextSetRGBFillColor(v10, a2, a2, a2, 1.0);
    v17.origin.y = 0.0;
    v17.size.height = 1.0;
    v17.origin.x = 128.0;
    v17.size.width = 128.0;
    CGContextFillRect(v10, v17);
    CGImageRef Image = CGBitmapContextCreateImage(v10);
    CGContextRelease(v10);
  }
  else
  {
    CGImageRef Image = 0;
  }
  [v8 setValue:Image forKey:@"inputColorMap"];

  v15[0] = v7;
  v15[1] = v8;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v6 setFilters:v14];
}

- (uint64_t)setPresentsWithTransaction:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 416) setPresentsWithTransaction:a2];
    double v4 = *(void **)(v3 + 424);
    return [v4 setPresentsWithTransaction:a2];
  }
  return result;
}

- (void)setDoubleBuffered:(uint64_t)a1
{
  if (a1)
  {
    if (qword_1EA3C6C10 != -1) {
      dispatch_once(&qword_1EA3C6C10, &__block_literal_global_62);
    }
    if (_MergedGlobals_1_0 && *(unsigned __int8 *)(a1 + 433) != a2)
    {
      *(unsigned char *)(a1 + 433) = a2;
      if (a2) {
        uint64_t v4 = 2;
      }
      else {
        uint64_t v4 = 3;
      }
      [*(id *)(a1 + 416) setMaximumDrawableCount:v4];
      double v5 = *(void **)(a1 + 424);
      [v5 setMaximumDrawableCount:v4];
    }
  }
}

- (uint64_t)isDrawableAvailable
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = *(id *)(a1 + 416);
    if ([v2 isDrawableAvailable])
    {
      uint64_t v3 = *(void **)(v1 + 424);
      if (v3)
      {
        id v4 = v3;
        uint64_t v1 = [v4 isDrawableAvailable];
      }
      else
      {
        uint64_t v1 = 1;
      }
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void)accessibilityInvertColorsStatusDidChange:(id)a3
{
  if (self)
  {
    if (self->_useLuminanceColorFilter) {
      +[PKMetalView installLuminanceColorFilterOnLayer:lightLuma:darkLuma:](0.0, 1.0, (uint64_t)PKMetalView, self->_backdropLayer);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalMultiplyLayer, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);

  objc_storeStrong((id *)&self->_backdropLayer, 0);
}

@end