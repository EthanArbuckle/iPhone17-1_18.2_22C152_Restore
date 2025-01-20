@interface LAUIPearlGlyphView
+ (id)sharedStaticResources;
+ (void)collectPipelineDescriptors;
+ (void)invokeSuccessFeedback;
- (BOOL)feedbackEnabled;
- (BOOL)hideFace;
- (BOOL)inApplicationContext;
- (BOOL)isPaused;
- (BOOL)isWireframeEnabled;
- (BOOL)shakeEnabled;
- (CALayer)contentLayer;
- (LAUIPearlGlyphView)init;
- (LAUIPearlGlyphView)initWithConfiguration:(id)a3;
- (LAUIPearlGlyphView)initWithStyle:(int64_t)a3;
- (LAUIPearlGlyphViewDelegate)delegate;
- (NSNumber)remainingMinDisplayTimeInterval;
- (UIColor)finishedColor;
- (UIColor)idleColor;
- (double)modelTransform;
- (id).cxx_construct;
- (id)initSecureGlyphViewWithConfiguration:(id *)a1;
- (int64_t)state;
- (int64_t)style;
- (uint64_t)_updateRendererPaused:(uint64_t)result;
- (uint64_t)beginExternalAnimation;
- (uint64_t)endExternalAnimation;
- (uint64_t)setModelTransform:(uint64_t)result;
- (uint64_t)setWireframeEnabled:(uint64_t)result;
- (unint64_t)faceVisibility;
- (void)_applyCheckmarkColor;
- (void)_applyConfiguration;
- (void)_applyConfigurationWithTraitCollection:(uint64_t)a1;
- (void)_applyStateAnimated:(uint64_t)a1;
- (void)_executeCompletionHandlers:(uint64_t)a1;
- (void)_setSecureFaceIDViewState:(uint64_t)a3 animated:(void *)a4 withCompletion:;
- (void)_updateReduceBlurState;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)invalidate;
- (void)layoutSubviews;
- (void)purgeBuffers;
- (void)renderLoop:(id)a3 drawAtTime:(double)a4;
- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4;
- (void)setDelegate:(id)a3;
- (void)setFaceVisibility:(unint64_t)a3 animated:(BOOL)a4;
- (void)setFeedbackEnabled:(BOOL)a3;
- (void)setFinishedColor:(id)a3 animated:(BOOL)a4;
- (void)setHideFace:(BOOL)a3 animated:(BOOL)a4;
- (void)setIdleColor:(id)a3 animated:(BOOL)a4;
- (void)setInApplicationContext:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setShakeEnabled:(BOOL)a3;
- (void)setState:(int64_t)a3 animated:(BOOL)a4;
- (void)setState:(int64_t)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)setStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation LAUIPearlGlyphView

+ (id)sharedStaticResources
{
  return static_resources;
}

+ (void)collectPipelineDescriptors
{
}

+ (void)invokeSuccessFeedback
{
  if (_AXSPearlAuthenticationHapticsEnabled())
  {
    AudioServicesPlaySystemSoundWithCompletion(0x489u, 0);
  }
}

- (LAUIPearlGlyphView)init
{
  id v3 = +[LAUIPearlGlyphStaticConfiguration createDefaultConfiguration];
  v4 = [(LAUIPearlGlyphView *)self initWithConfiguration:v3];

  return v4;
}

- (LAUIPearlGlyphView)initWithStyle:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    id v5 = +[LAUIPearlGlyphStaticConfiguration createSystemApertureConfiguration];
  }
  else {
    id v5 = +[LAUIPearlGlyphStaticConfiguration createDefaultConfiguration];
  }
  v6 = v5;
  [v5 setInitialStyle:a3];
  v7 = [(LAUIPearlGlyphView *)self initWithConfiguration:v6];

  return v7;
}

- (LAUIPearlGlyphView)initWithConfiguration:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v42 = [MEMORY[0x263F52498] sharedInstance];
    id v5 = (_anonymous_namespace_ *)[v4 secureVariantEnabled];
    if (!v5
      || (id v5 = (_anonymous_namespace_ *)[v42 isSupported], !v5)
      || (id v5 = (_anonymous_namespace_ *)[v42 isEnabled], !v5)
      || (id v5 = -[LAUIPearlGlyphView initSecureGlyphViewWithConfiguration:]((id *)self, v4),
          self = (LAUIPearlGlyphView *)v5,
          (v6 = (LAUIPearlGlyphView *)v5) == 0))
    {
      v8 = static_resources;
      if (static_resources)
      {
        obj = static_resources;
        v9 = [[LAUIMetalRenderLoop alloc] initWithPixelFormat:80 forDevice:obj[1]];
        if (v9)
        {
          v41 = v9;
          double v10 = *MEMORY[0x263F001A8];
          double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
          double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
          double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
          v43.receiver = self;
          v43.super_class = (Class)LAUIPearlGlyphView;
          id v14 = -[LAUIPearlGlyphView initWithFrame:](&v43, sel_initWithFrame_, v10, v11, v12, v13);
          id v15 = v14;
          id v16 = v14;
          if (v14)
          {
            objc_storeStrong((id *)v14 + 51, obj);
            v17 = [MEMORY[0x263F1C920] mainScreen];
            [v17 scale];
            *((void *)v16 + 54) = v18;

            *((unsigned char *)v16 + 768) = 0;
            *((unsigned char *)v16 + 769) = 1;
            *((unsigned char *)v16 + 770) = 1;
            *((unsigned char *)v16 + 481) = 1;
            *((void *)v15 + 52) = [v4 initialStyle];
            BOOL v19 = UIAccessibilityIsReduceTransparencyEnabled() || UIAccessibilityIsReduceMotionEnabled();
            *((unsigned char *)v15 + 424) = v19;
            *((void *)v16 + 97) = 3;
            id v20 = objc_alloc_init(MEMORY[0x263F1CB60]);
            v21 = (void *)*((void *)v15 + 57);
            *((void *)v15 + 57) = v20;

            [v16 addSubview:*((void *)v15 + 57)];
            v22 = [MEMORY[0x263EFF9D0] null];
            v44[0] = @"position";
            v44[1] = @"bounds";
            __p[0] = v22;
            __p[1] = v22;
            v44[2] = @"transform";
            v44[3] = @"backgroundColor";
            v46 = v22;
            v47 = v22;
            v44[4] = @"cornerRadius";
            v44[5] = @"contents";
            v48 = v22;
            v49 = v22;
            v44[6] = @"anchorPoint";
            v44[7] = @"opacity";
            v50 = v22;
            v51 = v22;
            v44[8] = @"strokeStart";
            v44[9] = @"strokeEnd";
            v52 = v22;
            v53 = v22;
            v44[10] = @"strokeColor";
            v44[11] = @"fillColor";
            v54 = v22;
            v55 = v22;
            uint64_t v40 = [NSDictionary dictionaryWithObjects:__p forKeys:v44 count:12];

            id v23 = objc_alloc_init(MEMORY[0x263F157E8]);
            v24 = (void *)*((void *)v15 + 99);
            *((void *)v15 + 99) = v23;

            [*((id *)v15 + 99) setActions:v40];
            [*((id *)v16 + 99) setOpacity:0.0];
            [*((id *)v16 + 99) setContentsScale:*((double *)v16 + 54)];
            v25 = objc_alloc_init(LAUICheckmarkLayer);
            v26 = (void *)*((void *)v15 + 55);
            *((void *)v15 + 55) = v25;

            [*((id *)v15 + 55) setContentsScale:*((double *)v16 + 54)];
            [*((id *)v16 + 99) addSublayer:*((void *)v16 + 55)];
            id v27 = objc_alloc_init(MEMORY[0x263F15880]);
            v28 = (void *)*((void *)v15 + 68);
            *((void *)v15 + 68) = v27;

            [*((id *)v15 + 68) setActions:v40];
            [*((id *)v16 + 68) setContentsScale:*((double *)v16 + 54)];
            v29 = (void *)*((void *)v16 + 68);
            id v30 = [MEMORY[0x263F1C550] blackColor];
            objc_msgSend(v29, "setStrokeColor:", objc_msgSend(v30, "CGColor"));

            v31 = (void *)*((void *)v16 + 68);
            id v32 = [MEMORY[0x263F1C550] blackColor];
            objc_msgSend(v31, "setFillColor:", objc_msgSend(v32, "CGColor"));

            [*((id *)v16 + 68) setLineWidth:1.0];
            [*((id *)v16 + 99) setMask:*((void *)v16 + 68)];
            *((unsigned char *)v16 + 536) = 1;
            objc_storeStrong((id *)v15 + 58, v41);
            LODWORD(v33) = 1117782016;
            LODWORD(v34) = 1123024896;
            LODWORD(v35) = 1123024896;
            objc_msgSend(*((id *)v15 + 58), "setPreferredFrameRateRange:", v33, v34, v35);
            [*((id *)v15 + 58) setHighFrameRateReason:2424833];
            [*((id *)v15 + 58) setDelegate:v16];
            *((void *)v16 + 94) = CGColorSpaceRetain((CGColorSpaceRef)[*((id *)v15 + 58) colorSpace]);
            uint64_t v36 = [*((id *)v15 + 58) layer];
            v37 = (void *)*((void *)v15 + 59);
            *((void *)v15 + 59) = v36;

            [*((id *)v15 + 59) setOpaque:0];
            operator new();
          }
          self = (LAUIPearlGlyphView *)0;
          v6 = self;
          v9 = v41;
        }
        else
        {
          v6 = 0;
        }
      }
      else
      {
        v6 = 0;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)initSecureGlyphViewWithConfiguration:(id *)a1
{
  v28[3] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (!a1)
  {
    BOOL v19 = 0;
    goto LABEL_14;
  }
  if ([v3 secureVariantEnabled])
  {
    id v5 = -[LAUISecureFaceIDView initWithType:]([LAUISecureFaceIDView alloc], "initWithType:", [v4 secureVariantType]);
    if (v5)
    {
      double v6 = *MEMORY[0x263F001A8];
      double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
      v26.receiver = a1;
      v26.super_class = (Class)LAUIPearlGlyphView;
      double v10 = (id *)objc_msgSendSuper2(&v26, sel_initWithFrame_, v6, v7, v8, v9);
      double v11 = v10;
      if (v10)
      {
        objc_storeStrong(v10 + 95, v5);
        [v11[95] setTranslatesAutoresizingMaskIntoConstraints:0];
        [v11 addSubview:v11[95]];
        [v11[95] setState:1];
        double v12 = (void *)MEMORY[0x263F08938];
        v25 = [v11[95] topAnchor];
        id v23 = [v11 topAnchor];
        v22 = objc_msgSend(v25, "constraintEqualToAnchor:");
        v28[0] = v22;
        v24 = [v11[95] bottomAnchor];
        double v13 = [v11 bottomAnchor];
        id v14 = [v24 constraintEqualToAnchor:v13];
        v28[1] = v14;
        id v15 = [v11[95] centerXAnchor];
        id v16 = [v11 centerXAnchor];
        v17 = [v15 constraintEqualToAnchor:v16];
        v28[2] = v17;
        uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
        [v12 activateConstraints:v18];

        *((unsigned char *)v11 + 480) = 1;
      }
      a1 = v11;
      BOOL v19 = a1;
      goto LABEL_13;
    }
    id v20 = LACLogFaceIDUI();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[LAUIPearlGlyphView initSecureGlyphViewWithConfiguration:](v20);
    }
  }
  else
  {
    LACLogFaceIDUI();
    id v5 = (LAUISecureFaceIDView *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super.super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214463000, &v5->super.super.super, OS_LOG_TYPE_DEFAULT, "Could not create secure glyph, secure variant disabled.", buf, 2u);
    }
  }
  BOOL v19 = 0;
LABEL_13:

LABEL_14:
  return v19;
}

- (void)_applyConfiguration
{
  if (a1)
  {
    id v2 = [a1 traitCollection];
    -[LAUIPearlGlyphView _applyConfigurationWithTraitCollection:]((uint64_t)a1, v2);
  }
}

- (void)_applyStateAnimated:(uint64_t)a1
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  if (!a1 || *(unsigned char *)(a1 + 480)) {
    return;
  }
  *(unsigned char *)(a1 + 712) = 1;
  *(unsigned char *)(a1 + 713) = a2;
  id v4 = (void *)(*(void *)(a1 + 720) + 1);
  *(void *)(a1 + 720) = v4;
  dispatch_group_t v5 = dispatch_group_create();
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  char v85 = 1;
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke;
  v81[3] = &unk_26420CB28;
  v83 = v84;
  double v6 = v5;
  v82 = v6;
  double v7 = (void *)MEMORY[0x2166A1D50](v81);
  unint64_t v8 = *(void *)(a1 + 784);
  unint64_t v9 = *(void *)(a1 + 704);
  if (v9 > 8 || ((1 << v9) & 0x1EC) == 0)
  {
    if (((v8 < 9) & (0x1ECu >> v8)) == 0) {
      goto LABEL_6;
    }
LABEL_8:
    unsigned int v10 = 1;
    goto LABEL_9;
  }
  if (((v8 < 9) & (0x1ECu >> v8)) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unsigned int v10 = (v8 < 9) & (0x7Fu >> v8) ^ (v9 < 9) & (0x7Fu >> v9);
LABEL_9:
  if (v8 - 1 < 2) {
    int v11 = 1;
  }
  else {
    int v11 = a2;
  }
  double v12 = 0.0;
  if (v11) {
    *(float *)&double v12 = 0.979;
  }
  switch(v8)
  {
    case 0uLL:
      float v26 = 0.98747;
      if (!v11) {
        float v26 = 0.0;
      }
      long long v27 = *(_OWORD *)(a1 + 416);
      LOBYTE(location[2]) = 0;
      *(_OWORD *)((char *)__p + 7) = v27;
      LOBYTE(location[4]) = 0;
      *(_OWORD *)v88 = *(_OWORD *)__p;
      *(void *)&v88[15] = *((void *)&v27 + 1);
      char v89 = 0;
      char v91 = 0;
      char v92 = 0;
      BOOL v96 = 0;
      *(_OWORD *)location = *(_OWORD *)(a1 + 608);
      char v87 = *(unsigned char *)(a1 + 776) & 1;
      if (!v10) {
        *(float *)&double v12 = v26;
      }
      float v90 = *(float *)&v12;
      float v93 = v26;
      char v94 = 1;
      goto LABEL_62;
    case 1uLL:
      *(_OWORD *)((char *)__p + 7) = *(_OWORD *)(a1 + 416);
      *(_OWORD *)&v79[7] = *(_OWORD *)((char *)__p + 7);
      if (v11) {
        float v28 = 0.98747;
      }
      else {
        float v28 = 0.0;
      }
      float v29 = fminf(*(float *)&v12, v28);
      if (!v10) {
        float v29 = v28;
      }
      if (v11) {
        float v30 = v29;
      }
      else {
        float v30 = 0.0;
      }
      *(_OWORD *)((char *)location + 7) = 0uLL;
      HIBYTE(location[2]) = 0;
      v31 = (char *)operator new(0xE0uLL);
      id v32 = v31;
      uint64_t v33 = 0;
      v31[16] = 0;
      v31[32] = 0;
      v31[48] = 1;
      *(_OWORD *)(v31 + 49) = *(_OWORD *)__p;
      *((id *)v31 + 8) = *(id *)((char *)&__p[1] + 7);
      v31[72] = 1;
      *((_DWORD *)v31 + 20) = 0;
      v31[84] = 0;
      v31[88] = 0;
      v31[92] = 0;
      v31[96] = 0;
      *((_DWORD *)v31 + 25) = 0;
      v31[104] = 0;
      long long v34 = *(_OWORD *)location;
      long long v35 = *(_OWORD *)&location[2];
      *((id *)v31 + 17) = *(id *)((char *)&location[3] + 7);
      *(_OWORD *)(v31 + 121) = v35;
      *(_OWORD *)(v31 + 105) = v34;
      v31[144] = 0;
      v31[160] = 1;
      *(_OWORD *)(v31 + 161) = *(_OWORD *)v79;
      *((void *)v31 + 22) = *(void *)&v79[15];
      v31[184] = 2;
      *((_DWORD *)v31 + 48) = 0;
      v31[196] = 0;
      v31[200] = 0;
      v31[204] = 0;
      v31[208] = 0;
      *((_DWORD *)v31 + 53) = 0;
      v31[216] = 0;
      *(_OWORD *)v31 = *(_OWORD *)(a1 + 640);
      int v36 = (*(unsigned __int8 *)(a1 + 776) >> 1) & 1;
      *((_OWORD *)v31 + 7) = *(_OWORD *)(a1 + 624);
      do
      {
        v37 = (float *)&v31[v33];
        *((unsigned char *)v37 + 48) = v36;
        v37[20] = v28;
        v37[21] = v30;
        *((unsigned char *)v37 + 88) = 1;
        v33 += 112;
        v37[25] = 0.01;
      }
      while (v33 != 224);
      v38 = v31 + 224;
      dispatch_group_enter(v6);
      uint64_t v39 = *(void *)(a1 + 560);
      location[0] = v32;
      location[1] = v38;
      location[2] = v38;
      LOBYTE(location[3]) = 0;
      location[4] = 0;
      id v40 = location[0];
      if (!location[0]) {
        goto LABEL_90;
      }
      goto LABEL_74;
    case 2uLL:
      float v41 = 0.98421;
      float v42 = 0.0;
      if (!v11) {
        float v41 = 0.0;
      }
      float v43 = fminf(*(float *)&v12, v41);
      if (v11) {
        float v42 = 0.963;
      }
      if (!v10) {
        float v43 = v41;
      }
      LOBYTE(location[2]) = 0;
      uint64_t v44 = *(void *)(a1 + 416);
      int v45 = *(unsigned __int8 *)(a1 + 424);
      *(_DWORD *)&v88[16] = *(_DWORD *)(a1 + 425);
      *(_DWORD *)&v88[19] = *(_DWORD *)(a1 + 428);
      if (v45) {
        char v46 = 4;
      }
      else {
        char v46 = 3;
      }
      LOBYTE(location[4]) = 0;
      char v87 = 1;
      *(void *)&v88[7] = v44;
      v88[15] = v45;
      char v89 = v46;
      char v91 = 0;
      char v92 = 0;
      BOOL v96 = 0;
      *(_OWORD *)location = *(_OWORD *)(a1 + 624);
      float v90 = v43;
      float v93 = v42;
      char v94 = 1;
LABEL_62:
      int v47 = 1008981770;
      goto LABEL_72;
    case 3uLL:
    case 4uLL:
      uint64_t v15 = *(void *)(a1 + 776);
      uint64_t v16 = 4;
      if (v8 == 4) {
        uint64_t v16 = 1;
      }
      uint64_t v17 = v15 & v16;
      BOOL v18 = (v15 & v16) != 0;
      if (v8 == 4)
      {
        dispatch_group_t v19 = 0;
        char v20 = 0;
        float v21 = 0.98148;
        float v22 = 0.96767;
        if (!v10) {
          float v22 = 0.98148;
        }
        if (a2)
        {
          float v23 = v22;
        }
        else
        {
          float v21 = 0.0;
          float v23 = 0.0;
        }
        v24 = (long long *)(a1 + 608);
      }
      else
      {
        if (v11) {
          float v23 = 0.979;
        }
        else {
          float v23 = 0.0;
        }
        if (v17) {
          dispatch_group_t v19 = 0;
        }
        else {
          dispatch_group_t v19 = dispatch_group_create();
        }
        v24 = (long long *)(a1 + 656);
        char v20 = 5;
        float v21 = v23;
      }
      long long v49 = *v24;
      long long v50 = *(_OWORD *)(a1 + 416);
      LOBYTE(location[2]) = 0;
      *(_OWORD *)((char *)__p + 7) = v50;
      LOBYTE(location[4]) = 0;
      *(_OWORD *)v88 = *(_OWORD *)__p;
      *(void *)&v88[15] = *((void *)&v50 + 1);
      char v89 = v20;
      char v91 = 0;
      char v92 = 0;
      *(_OWORD *)location = v49;
      char v87 = v18;
      float v90 = v23;
      float v93 = v21;
      char v94 = 1;
      int v95 = 1034147594;
      if (v17) {
        BOOL v51 = *(void *)(a1 + 704) == 2;
      }
      else {
        BOOL v51 = 0;
      }
      BOOL v96 = v51;
      if (v19) {
        v52 = v19;
      }
      else {
        v52 = v6;
      }
      dispatch_group_enter(v52);
      uint64_t v53 = *(void *)(a1 + 560);
      v75[0] = MEMORY[0x263EF8330];
      v75[1] = 3221225472;
      v75[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_2;
      v75[3] = &unk_26420CB50;
      v54 = v19;
      v76 = v54;
      v78 = v84;
      id v77 = v7;
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v19)
      {
        objc_initWeak(__p, (id)a1);
        dispatch_group_enter(v6);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_3;
        block[3] = &unk_26420CBA0;
        objc_copyWeak(v73, __p);
        v73[1] = v4;
        char v74 = a2;
        v72 = v6;
        dispatch_group_notify(v54, MEMORY[0x263EF83A0], block);

        objc_destroyWeak(v73);
        objc_destroyWeak(__p);
      }
      else if (*(void *)(a1 + 440))
      {
        dispatch_group_enter(v6);
        v55 = *(void **)(a1 + 440);
        v69[0] = MEMORY[0x263EF8330];
        v69[1] = 3221225472;
        v69[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_5;
        v69[3] = &unk_26420CB78;
        v70 = v6;
        [v55 setRevealed:0 animated:a2 withCompletion:v69];
      }
      goto LABEL_90;
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      if (v8 - 7 >= 0xFFFFFFFFFFFFFFFELL) {
        char v13 = 5;
      }
      else {
        char v13 = 6;
      }
      if (v8 == 5) {
        char v13 = 4;
      }
      memset(location, 0, 17);
      *(_OWORD *)((char *)__p + 7) = *(_OWORD *)(a1 + 416);
      char v87 = 1;
      *(_OWORD *)v88 = *(_OWORD *)__p;
      *(id *)&v88[15] = *(id *)((char *)&__p[1] + 7);
      char v89 = v13;
      float v90 = 0.0;
      char v91 = 0;
      char v92 = 0;
      BOOL v96 = 0;
      if (v8 == 6)
      {
        id v14 = (_OWORD *)(a1 + 688);
        goto LABEL_33;
      }
      if (v8 == 5)
      {
        id v14 = (_OWORD *)(a1 + 624);
LABEL_33:
        *(_OWORD *)location = *v14;
        if (v9 == 4)
        {
          long long v25 = *(_OWORD *)(a1 + 608);
          goto LABEL_71;
        }
        goto LABEL_70;
      }
      long long v25 = *(_OWORD *)(a1 + 608);
      *(_OWORD *)location = v25;
      if (v8 - 7 >= 0xFFFFFFFFFFFFFFFELL && v9 != 4) {
LABEL_70:
      }
        long long v25 = *(_OWORD *)(a1 + 624);
LABEL_71:
      LOBYTE(location[4]) = 1;
      *(_OWORD *)&location[2] = v25;
      char v87 = 0;
      float v90 = *(float *)&v12;
      float v93 = *(float *)&v12;
      char v94 = 1;
      int v47 = 1034147594;
LABEL_72:
      int v95 = v47;
      dispatch_group_enter(v6);
      uint64_t v48 = *(void *)(a1 + 560);
      id v40 = __p[0];
      if (__p[0])
      {
        __p[1] = __p[0];
LABEL_74:
        operator delete(v40);
      }
LABEL_90:
      if (*(void *)(a1 + 784) == 3)
      {
        unsigned int v56 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 440), "setRevealed:animated:", 0, a2, v12);
        unint64_t v57 = *(void *)(a1 + 784);
        BOOL v58 = v57 > 8;
        unsigned int v59 = (0x148u >> v57) & 1;
        if (v58) {
          unsigned int v56 = 0;
        }
        else {
          unsigned int v56 = v59;
        }
      }
      objc_msgSend(*(id *)(a1 + 792), "opacity", v12);
      double v61 = v60;
      if ((double)v56 != v60)
      {
        v62 = [MEMORY[0x263F15890] animationWithKeyPath:@"opacity"];
        [v62 setMass:3.0];
        [v62 setStiffness:1000.0];
        [v62 setDamping:500.0];
        [v62 setVelocity:0.0];
        [v62 setFillMode:*MEMORY[0x263F15AA8]];
        [v62 setBeginTimeMode:*MEMORY[0x263F15980]];
        [v62 durationForEpsilon:0.001];
        objc_msgSend(v62, "setDuration:");
        [v62 setAdditive:1];
        id v63 = [*(id *)(a1 + 792) presentationLayer];
        if (v63 || (id v63 = *(id *)(a1 + 792)) != 0)
        {
          [v63 opacity];
          double v61 = v64;
        }
        v65 = [NSNumber numberWithDouble:v61 - (double)v56];
        [v62 setFromValue:v65];

        [v62 setToValue:&unk_26C534490];
        [*(id *)(a1 + 792) addAnimation:v62 forKey:@"opacity"];
        *(float *)&double v66 = (float)v56;
        [*(id *)(a1 + 792) setOpacity:v66];
      }
      objc_initWeak(location, (id)a1);
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_114;
      v67[3] = &unk_26420CBC8;
      objc_copyWeak(v68, location);
      v68[1] = v4;
      v67[4] = v84;
      dispatch_group_notify(v6, MEMORY[0x263EF83A0], v67);
      -[LAUIPearlGlyphView _updateRendererPaused:](a1, 1);
      objc_destroyWeak(v68);
      objc_destroyWeak(location);

      _Block_object_dispose(v84, 8);
      break;
    default:
      goto LABEL_90;
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  id v4 = (const void *)*((void *)self + 94);
  if (v4)
  {
    CFRelease(v4);
    *((void *)self + 94) = 0;
  }
  [(LAUIPearlGlyphView *)self invalidate];
  v5.receiver = self;
  v5.super_class = (Class)LAUIPearlGlyphView;
  [(LAUIPearlGlyphView *)&v5 dealloc];
}

- (void)_applyConfigurationWithTraitCollection:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && v3 && !*(unsigned char *)(a1 + 480))
  {
    id v61 = v3;
    id v4 = v3;
    objc_super v5 = [MEMORY[0x263F1CB00] currentTraitCollection];
    [MEMORY[0x263F1CB00] setCurrentTraitCollection:v4];
    double v6 = *(CGColor **)(a1 + 752);
    if (*(unsigned char *)(a1 + 600))
    {
      id v7 = *(id *)(a1 + 592);
      unint64_t v8 = (CGColor *)[v7 CGColor];
      converted_color = LAUI_CA_utilities::create_converted_color(v8, v6, v9);
      if (converted_color)
      {
        int v11 = converted_color;
        ColorSpace = CGColorGetColorSpace(converted_color);
        if (CGColorSpaceGetNumberOfComponents(ColorSpace) != 3) {
          __assert_rtn("color_to_float4", "LAUICAUtilities_Internal.h", 581, "CGColorSpaceGetNumberOfComponents(CGColorGetColorSpace(color)) == 3");
        }
        Components = CGColorGetComponents(v11);
        float64x2_t v49 = *(float64x2_t *)Components;
        float64x2_t v53 = *(float64x2_t *)(Components + 2);
        CFRelease(v11);
        float32x4_t v14 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v49), v53);
      }
      else
      {
        float32x4_t v14 = 0uLL;
      }
      float32x4_t v54 = v14;

      *(float32x4_t *)(a1 + 608) = v54;
    }
    if (*(unsigned char *)(a1 + 680))
    {
      id v15 = *(id *)(a1 + 672);
      uint64_t v16 = (CGColor *)[v15 CGColor];
      BOOL v18 = LAUI_CA_utilities::create_converted_color(v16, v6, v17);
      if (v18)
      {
        dispatch_group_t v19 = v18;
        char v20 = CGColorGetColorSpace(v18);
        if (CGColorSpaceGetNumberOfComponents(v20) != 3) {
          __assert_rtn("color_to_float4", "LAUICAUtilities_Internal.h", 581, "CGColorSpaceGetNumberOfComponents(CGColorGetColorSpace(color)) == 3");
        }
        float v21 = CGColorGetComponents(v19);
        float64x2_t v50 = *(float64x2_t *)v21;
        float64x2_t v55 = *(float64x2_t *)(v21 + 2);
        CFRelease(v19);
        float32x4_t v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v50), v55);
      }
      else
      {
        float32x4_t v22 = 0uLL;
      }
      float32x4_t v56 = v22;

      *(float32x4_t *)(a1 + 688) = v56;
    }
    switch(*(void *)(a1 + 416))
    {
      case 0:
      case 2:
        id v24 = [MEMORY[0x263F1C550] systemBlueColor];
        long long v25 = (CGColor *)[v24 CGColor];
        long long v27 = LAUI_CA_utilities::create_converted_color(v25, v6, v26);
        if (v27)
        {
          float v28 = v27;
          float v29 = CGColorGetColorSpace(v27);
          if (CGColorSpaceGetNumberOfComponents(v29) != 3) {
            __assert_rtn("color_to_float4", "LAUICAUtilities_Internal.h", 581, "CGColorSpaceGetNumberOfComponents(CGColorGetColorSpace(color)) == 3");
          }
          float v30 = CGColorGetComponents(v28);
          float64x2_t v51 = *(float64x2_t *)v30;
          float64x2_t v57 = *(float64x2_t *)(v30 + 2);
          CFRelease(v28);
          float32x4_t v31 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v51), v57);
        }
        else
        {
          float32x4_t v31 = 0uLL;
        }
        float32x4_t v58 = v31;

        *(float32x4_t *)(a1 + 624) = v58;
        if (*(void *)(a1 + 416) == 2)
        {
          id v39 = [MEMORY[0x263F1C550] systemGreenColor];
          id v40 = (CGColor *)[v39 CGColor];
          float v42 = LAUI_CA_utilities::create_converted_color(v40, v6, v41);
          if (v42)
          {
            float v43 = v42;
            uint64_t v44 = CGColorGetColorSpace(v42);
            if (CGColorSpaceGetNumberOfComponents(v44) != 3) {
              __assert_rtn("color_to_float4", "LAUICAUtilities_Internal.h", 581, "CGColorSpaceGetNumberOfComponents(CGColorGetColorSpace(color)) == 3");
            }
            int v45 = CGColorGetComponents(v43);
            float64x2_t v52 = *(float64x2_t *)v45;
            float64x2_t v59 = *(float64x2_t *)(v45 + 2);
            CFRelease(v43);
            float32x4_t v46 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v52), v59);
          }
          else
          {
            float32x4_t v46 = 0uLL;
          }
          float32x4_t v60 = v46;

          *(float32x4_t *)(a1 + 656) = v60;
        }
        else
        {
          *(_OWORD *)(a1 + 656) = *(_OWORD *)(a1 + 624);
        }
        if (!*(unsigned char *)(a1 + 600)) {
          *(_OWORD *)(a1 + 608) = xmmword_214498E70;
        }
        uint64_t v37 = a1 + 672;
        if (!*(unsigned char *)(a1 + 680))
        {
          _Q0 = *(_OWORD *)(a1 + 624);
          goto LABEL_48;
        }
        break;
      case 1:
        __asm { FMOV            V0.4S, #1.0 }
        *(_OWORD *)(a1 + 656) = _Q0;
        *(_OWORD *)(a1 + 624) = _Q0;
        if (!*(unsigned char *)(a1 + 600)) {
          *(_OWORD *)(a1 + 608) = _Q0;
        }
        if (!*(unsigned char *)(a1 + 680)) {
          *(_OWORD *)(a1 + 688) = *(_OWORD *)(a1 + 624);
        }
        break;
      case 3:
      case 6:
      case 7:
      case 8:
      case 9:
        if (*(unsigned char *)(a1 + 680))
        {
          _Q0 = *(_OWORD *)(a1 + 688);
        }
        else
        {
          __asm { FMOV            V0.4S, #1.0 }
          *(_OWORD *)(a1 + 688) = _Q0;
        }
        *(_OWORD *)(a1 + 656) = _Q0;
        *(_OWORD *)(a1 + 624) = _Q0;
        uint64_t v37 = a1 + 592;
        if (!*(unsigned char *)(a1 + 600)) {
LABEL_48:
        }
          *(_OWORD *)(v37 + 16) = _Q0;
        break;
      case 4:
      case 5:
        if (!*(unsigned char *)(a1 + 600)) {
          *(_OWORD *)(a1 + 608) = xmmword_214498E50;
        }
        if (*(unsigned char *)(a1 + 680))
        {
          long long v32 = *(_OWORD *)(a1 + 688);
        }
        else
        {
          long long v32 = xmmword_214498E60;
          *(_OWORD *)(a1 + 688) = xmmword_214498E60;
        }
        *(_OWORD *)(a1 + 656) = v32;
        *(_OWORD *)(a1 + 624) = v32;
        break;
      default:
        break;
    }
    float32x4_t v47 = *(float32x4_t *)(a1 + 624);
    *(float32x4_t *)(a1 + 640) = v47;
    unint64_t v48 = *(void *)(a1 + 416);
    if (v48 > 9)
    {
      __break(1u);
      return;
    }
    if (((1 << v48) & 0x33A) != 0) {
      *(float *)(a1 + 652) = vmuls_lane_f32(0.5, v47, 3);
    }
    -[LAUIPearlGlyphView _applyCheckmarkColor](a1);
    [MEMORY[0x263F1CB00] setCurrentTraitCollection:v5];

    id v3 = v61;
  }
}

- (void)_applyCheckmarkColor
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = *(CGColorSpace **)(a1 + 752);
    if (v2)
    {
      if (*(void *)(a1 + 440))
      {
        float32x4_t v3 = *(float32x4_t *)(a1 + 656);
        v6[0] = vcvtq_f64_f32(*(float32x2_t *)v3.f32);
        v6[1] = vcvt_hight_f64_f32(v3);
        CGColorRef v4 = CGColorCreate(v2, (const CGFloat *)v6);
        if (v4)
        {
          CGColorRef v5 = v4;
          [*(id *)(a1 + 440) setColor:v4 animated:0];
          CFRelease(v5);
        }
      }
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LAUIPearlGlyphView;
  [(LAUIPearlGlyphView *)&v7 traitCollectionDidChange:v4];
  CGColorRef v5 = [(LAUIPearlGlyphView *)self traitCollection];
  if (v5)
  {
    if (!v4 || (uint64_t v6 = [v4 userInterfaceStyle], v6 != objc_msgSend(v5, "userInterfaceStyle"))) {
      -[LAUIPearlGlyphView _applyConfigurationWithTraitCollection:]((uint64_t)self, v5);
    }
  }
}

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)LAUIPearlGlyphView;
  [(LAUIPearlGlyphView *)&v8 didMoveToWindow];
  float32x4_t v3 = [(LAUIPearlGlyphView *)self window];
  *((unsigned char *)self + 482) = v3 != 0;
  if (v3)
  {
    CGColorRef v5 = (LAUI_uniform_cubic_b_spline_renderer::renderer_t *)*((void *)self + 69);
    if (v5) {
      double updated = LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_last_render_time(v5);
    }
  }
  uint64_t v6 = (void *)*((void *)self + 58);
  objc_super v7 = objc_msgSend(v3, "screen", updated);
  [v6 attachToScreen:v7];

  -[LAUIPearlGlyphView _updateRendererPaused:]((uint64_t)self, *((unsigned char *)self + 482));
}

- (uint64_t)_updateRendererPaused:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    int v3 = (a2 & 1) == 0 && !*(unsigned char *)(result + 584) && !*(void *)(result + 488)
      || *(unsigned char *)(result + 480)
      || *(unsigned char *)(result + 768) != 0;
    if (*(unsigned __int8 *)(result + 481) != v3)
    {
      *(unsigned char *)(result + 481) = v3;
      if (*(unsigned char *)(result + 481))
      {
        BOOL v4 = 1;
      }
      else
      {
        CGColorRef v5 = *(LAUI_uniform_cubic_b_spline_renderer::renderer_t **)(result + 552);
        if (v5)
        {
          LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_last_render_time(v5);
          BOOL v4 = *(unsigned char *)(v2 + 481) != 0;
        }
        else
        {
          BOOL v4 = 0;
        }
      }
      uint64_t v6 = *(void **)(v2 + 464);
      return [v6 setPaused:v4];
    }
  }
  return result;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)LAUIPearlGlyphView;
  [(LAUIPearlGlyphView *)&v41 layoutSubviews];
  int v3 = (void *)*((void *)self + 57);
  [(LAUIPearlGlyphView *)self bounds];
  objc_msgSend(v3, "setFrame:");
  [*((id *)self + 57) bounds];
  double v8 = v6;
  double v9 = v7;
  if (v7 >= v6) {
    double v10 = v6;
  }
  else {
    double v10 = v7;
  }
  double v11 = *((double *)self + 54);
  double v12 = fmax(v10 * 1.41421354, 75.0 / v11 + v10);
  if (v11 == 0.0) {
    double v13 = round(v12);
  }
  else {
    double v13 = round(v11 * v12) / v11;
  }
  *((double *)self + 62) = v13 / v10;
  double v14 = *((double *)self + 54);
  double v15 = v4 + (v8 - v13) * 0.5;
  if (v14 == 0.0)
  {
    double v16 = round(v15);
    double v17 = round(v5 + (v9 - v13) * 0.5);
  }
  else
  {
    double v16 = round(v15 * v14) / v14;
    double v17 = round((v5 + (v9 - v13) * 0.5) * v14) / v14;
  }
  objc_msgSend(*((id *)self + 59), "setFrame:", v16, v17, v13, v13);
  objc_msgSend(*((id *)self + 58), "setDrawableSize:", v13 * *((double *)self + 54), v13 * *((double *)self + 54));
  double v18 = *((double *)self + 54);
  double v19 = v13 - v10;
  double v20 = v16 + (v13 - v10) * 0.5;
  if (v18 == 0.0)
  {
    double v21 = round(v20);
    double v22 = round(v17 + v19 * 0.5);
  }
  else
  {
    double v21 = round(v20 * v18) / v18;
    double v22 = round((v17 + v19 * 0.5) * v18) / v18;
  }
  objc_msgSend(*((id *)self + 99), "setFrame:", v21, v22, v10, v10);
  [*((id *)self + 99) bounds];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  objc_msgSend(*((id *)self + 68), "setFrame:");
  [*((id *)self + 55) defaultSizeForCircleWithDiameter:v28 scale:*((double *)self + 54)];
  double v32 = v31;
  double v34 = v33;
  double v35 = *((double *)self + 54);
  double v36 = v24 + (v28 - v31) * 0.5;
  if (v35 == 0.0)
  {
    double v37 = round(v36);
    double v38 = round(v26 + (v30 - v34) * 0.5);
  }
  else
  {
    double v37 = round(v35 * v36) / v35;
    double v38 = round(v35 * (v26 + (v30 - v34) * 0.5)) / v35;
  }
  objc_msgSend(*((id *)self + 55), "setFrame:", v37, v38, v32);
  id WeakRetained = objc_loadWeakRetained((id *)self + 100);
  [WeakRetained pearlGlyphView:self didLayoutContentLayer:*((void *)self + 99)];

  if (*((double *)self + 63) != v8 || *((double *)self + 64) != v9)
  {
    *((double *)self + 63) = v8;
    *((double *)self + 64) = v9;
    if (*((unsigned char *)self + 712)) {
      BOOL v40 = *((unsigned char *)self + 713) != 0;
    }
    else {
      BOOL v40 = 0;
    }
    -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v40);
  }
}

- (void)invalidate
{
  if (!*((unsigned char *)self + 480))
  {
    *((unsigned char *)self + 480) = 1;
    int v3 = (void *)*((void *)self + 58);
    if (v3)
    {
      [v3 invalidate];
      double v4 = (void *)*((void *)self + 58);
      *((void *)self + 58) = 0;
    }
    [(LAUIPearlGlyphView *)self purgeBuffers];
    double v5 = (void *)*((void *)self + 59);
    if (v5)
    {
      [v5 removeFromSuperlayer];
      double v6 = (void *)*((void *)self + 59);
      *((void *)self + 59) = 0;
    }
    -[LAUIPearlGlyphView _executeCompletionHandlers:]((uint64_t)self, 0);
    -[LAUIPearlGlyphView _updateRendererPaused:]((uint64_t)self, 0);
    double v7 = (LAUI_uniform_cubic_b_spline_renderer::renderer_t *)*((void *)self + 69);
    if (v7)
    {
      if (!*((unsigned char *)v7 + 8))
      {
        *((unsigned char *)v7 + 8) = 1;
        LAUI_uniform_cubic_b_spline_renderer::renderer_t::purge(v7);
      }
      std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::renderer_t>::reset[abi:ne180100]((LAUI_uniform_cubic_b_spline_renderer::renderer_t **)self + 69, 0);
    }
    double v8 = (uint64_t *)((char *)self + 560);
    uint64_t v9 = *v8;
    if (*v8)
    {
      if (!*(unsigned char *)(v9 + 48))
      {
        *(_WORD *)(v9 + 48) = 1;
        LAUI_CA_utilities::animation_completion_handler_container::set_completion((void **)(v9 + 56), 0);
        if (*(unsigned char *)(v9 + 40))
        {
          double v10 = *(void **)v9;
          if (*(void *)v9)
          {
            *(void *)(v9 + 8) = v10;
            operator delete(v10);
          }
          *(unsigned char *)(v9 + 40) = 0;
        }
      }
    }
  }
}

- (void)_executeCompletionHandlers:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = a1 + 728;
    uint64_t v3 = *(void *)(v2 + 8);
    if (v3 != *(void *)v2)
    {
      v5[0] = *(void *)v2;
      v5[1] = v3;
      *(void *)uint64_t v2 = 0;
      *(void *)(v2 + 8) = 0;
      v5[2] = *(void *)(v2 + 16);
      *(void *)(v2 + 16) = 0;
      std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>::shrink_to_fit((char **)v2);
      LAUI_CA_utilities::animation_completion_handler_container::execute<std::vector<void({block_pointer} {__strong})(BOOL),std::allocator<void({block_pointer} {__strong})(BOOL)>>>((uint64_t)v5, a2);
      double v6 = (void **)v5;
      std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v6);
    }
  }
}

- (void)purgeBuffers
{
  if (!*((unsigned char *)self + 480)) {
    LAUI_uniform_cubic_b_spline_renderer::renderer_t::purge(*((LAUI_uniform_cubic_b_spline_renderer::renderer_t **)self
  }
                                                            + 69));
}

- (BOOL)inApplicationContext
{
  return [*((id *)self + 58) isInApplicationContext];
}

- (void)setInApplicationContext:(BOOL)a3
{
}

- (int64_t)style
{
  return *((void *)self + 52);
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (*((void *)self + 52) != a3)
  {
    *((void *)self + 52) = a3;
    -[LAUIPearlGlyphView _applyConfiguration](self);
    if (a4)
    {
      BOOL v6 = 1;
    }
    else if (*((unsigned char *)self + 712))
    {
      BOOL v6 = *((unsigned char *)self + 713) != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
    -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v6);
  }
}

- (UIColor)idleColor
{
  return (UIColor *)v2;
}

- (void)setIdleColor:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  double v7 = v6;
  if (v6)
  {
    id v10 = v6;
    char v11 = 1;
    double v8 = (id *)((char *)self + 592);
    if (*((unsigned char *)self + 600) && v10 == *v8)
    {
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
    char v11 = 0;
    double v8 = (id *)((char *)self + 592);
    if (!*((unsigned char *)self + 600)) {
      goto LABEL_13;
    }
  }
  std::__optional_storage_base<UIColor * {__strong},false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<UIColor * {__strong},false> const&>(v8, (uint64_t)&v10);
  -[LAUIPearlGlyphView _applyConfiguration](self);
  if (a4)
  {
    BOOL v9 = 1;
  }
  else if (*((unsigned char *)self + 712))
  {
    BOOL v9 = *((unsigned char *)self + 713) != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v9);
  if (v11) {
    goto LABEL_12;
  }
LABEL_13:
}

- (UIColor)finishedColor
{
  return (UIColor *)v2;
}

- (void)setFinishedColor:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  double v7 = v6;
  if (v6)
  {
    id v10 = v6;
    char v11 = 1;
    double v8 = (id *)((char *)self + 672);
    if (*((unsigned char *)self + 680) && v10 == *v8)
    {
LABEL_12:

      goto LABEL_13;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
    char v11 = 0;
    double v8 = (id *)((char *)self + 672);
    if (!*((unsigned char *)self + 680)) {
      goto LABEL_13;
    }
  }
  std::__optional_storage_base<UIColor * {__strong},false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<UIColor * {__strong},false> const&>(v8, (uint64_t)&v10);
  -[LAUIPearlGlyphView _applyConfiguration](self);
  if (a4)
  {
    BOOL v9 = 1;
  }
  else if (*((unsigned char *)self + 712))
  {
    BOOL v9 = *((unsigned char *)self + 713) != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v9);
  if (v11) {
    goto LABEL_12;
  }
LABEL_13:
}

- (void)setFaceVisibility:(unint64_t)a3 animated:(BOOL)a4
{
  if (*((void *)self + 97) != a3)
  {
    *((void *)self + 97) = a3;
    if (a4)
    {
      BOOL v4 = 1;
    }
    else if (*((unsigned char *)self + 712))
    {
      BOOL v4 = *((unsigned char *)self + 713) != 0;
    }
    else
    {
      BOOL v4 = 0;
    }
    -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v4);
  }
}

- (BOOL)hideFace
{
  return *((void *)self + 97) == 0;
}

- (void)setHideFace:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 3;
  }
  [(LAUIPearlGlyphView *)self setFaceVisibility:v4 animated:a4];
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  v84[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  if (*((void *)self + 95))
  {
    -[LAUIPearlGlyphView _setSecureFaceIDViewState:animated:withCompletion:]((uint64_t)self, a3, 0, v8);
  }
  else
  {
    if (v5)
    {
      BOOL v5 = *((unsigned char *)self + 768) == 0;
      if (a3 == 4 && !*((unsigned char *)self + 768))
      {
        if (*((unsigned char *)self + 769))
        {
          [(LAUIPearlGlyphView *)self bounds];
          double v10 = v9;
          char v11 = [MEMORY[0x263F15760] animationWithKeyPath:@"position"];
          [v11 setAdditive:1];
          uint64_t v12 = *MEMORY[0x263F15980];
          [v11 setBeginTimeMode:*MEMORY[0x263F15980]];
          LODWORD(v13) = 1036831949;
          LODWORD(v14) = 0.25;
          LODWORD(v15) = 0.25;
          LODWORD(v16) = 1.0;
          double v17 = [MEMORY[0x263F15808] functionWithControlPoints:v14 :v13 :v15 :v16];
          [v11 setTimingFunction:v17];

          [v11 setDuration:0.2];
          uint64_t v18 = *MEMORY[0x263F15AB0];
          [v11 setFillMode:*MEMORY[0x263F15AB0]];
          double v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.0, 0.0);
          [v11 setFromValue:v19];
          double v20 = v10 * 0.579710145;

          double v21 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v20, 0.0);
          [v11 setToValue:v21];

          double v22 = [MEMORY[0x263F15890] animationWithKeyPath:@"position"];
          [v22 setAdditive:1];
          [v22 setBeginTimeMode:v12];
          [v22 setFillMode:v18];
          [v22 setBeginTime:0.075];
          [v22 setMass:3.0];
          [v22 setStiffness:2200.0];
          [v22 setDamping:40.0];
          [v22 setInitialVelocity:0.0];
          double v23 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
          [v22 setTimingFunction:v23];

          LODWORD(v24) = 1068708659;
          [v22 setSpeed:v24];
          [v22 durationForEpsilon:0.001];
          objc_msgSend(v22, "setDuration:");
          double v25 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", 0.0, 0.0);
          [v22 setFromValue:v25];

          double v26 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", -v20, 0.0);
          [v22 setToValue:v26];

          double v27 = [MEMORY[0x263F15750] animation];
          [(CAAnimation *)v27 setBeginTimeMode:v12];
          v84[0] = v11;
          v84[1] = v22;
          double v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];
          [(CAAnimation *)v27 setAnimations:v28];

          id v29 = v11;
          [v29 beginTime];
          double v31 = v30;
          [v29 duration];
          double v33 = v32;

          id v34 = v22;
          [v34 beginTime];
          double v36 = v35;
          [v34 duration];
          double v38 = v37;

          double v39 = v31 + v33;
          if (v31 + v33 < v36 + v38) {
            double v39 = v36 + v38;
          }
          [(CAAnimation *)v27 setDuration:v39];
          BOOL v40 = [(LAUIPearlGlyphView *)self layer];
          id v41 = LAUILayerAddAdditiveAnimation(v40, &cfstr_Position.isa, v27);
        }
        if (*((unsigned char *)self + 770)) {
          AudioServicesPlaySystemSoundWithCompletion(0x48Au, 0);
        }
        BOOL v5 = 1;
      }
    }
    if (*((void *)self + 98) == a3)
    {
      if (v8)
      {
        if (*((unsigned char *)self + 712))
        {
          if (*((unsigned char *)self + 480))
          {
            uint64_t block = MEMORY[0x263EF8330];
            v80.i64[0] = 3321888768;
            v80.i64[1] = (uint64_t)___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEb_block_invoke;
            v81 = (char *)&__block_descriptor_48_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE__e5_v8__0l;
            float v42 = (void *)MEMORY[0x2166A1D50](v8);
            id v82 = (id)MEMORY[0x2166A1D50]();
            char v83 = 0;
            dispatch_async(MEMORY[0x263EF83A0], &block);
          }
          else
          {
            uint64_t v50 = [v8 copy];
            float64x2_t v51 = (uint64_t **)((char *)self + 728);
            float64x2_t v52 = v51[1];
            unint64_t v53 = (unint64_t)v51[2];
            if ((unint64_t)v52 >= v53)
            {
              uint64_t v60 = v52 - *v51;
              if ((unint64_t)(v60 + 1) >> 61) {
                std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v61 = v53 - (void)*v51;
              uint64_t v62 = v61 >> 2;
              if (v61 >> 2 <= (unint64_t)(v60 + 1)) {
                uint64_t v62 = v60 + 1;
              }
              if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v63 = v62;
              }
              id v82 = v51 + 2;
              if (v63) {
                float v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>((uint64_t)(v51 + 2), v63);
              }
              else {
                float v64 = 0;
              }
              v72 = (uint64_t *)&v64[8 * v60];
              v73 = &v64[8 * v63];
              v81 = v73;
              uint64_t *v72 = v50;
              float32x4_t v54 = v72 + 1;
              v80.i64[1] = (uint64_t)(v72 + 1);
              v75 = *v51;
              char v74 = v51[1];
              if (v74 == *v51)
              {
                int64x2_t v77 = vdupq_n_s64((unint64_t)v74);
              }
              else
              {
                do
                {
                  uint64_t v76 = *--v74;
                  *char v74 = 0;
                  *--v72 = v76;
                }
                while (v74 != v75);
                int64x2_t v77 = *(int64x2_t *)v51;
                float32x4_t v54 = (uint64_t *)v80.i64[1];
                v73 = v81;
              }
              void *v51 = v72;
              v51[1] = v54;
              int64x2_t v80 = v77;
              v78 = v51[2];
              v51[2] = (uint64_t *)v73;
              v81 = (char *)v78;
              uint64_t block = v77.i64[0];
              std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)&block);
            }
            else
            {
              uint64_t *v52 = v50;
              float32x4_t v54 = v52 + 1;
            }
            v51[1] = v54;
          }
        }
        else
        {
          uint64_t block = MEMORY[0x263EF8330];
          v80.i64[0] = 3321888768;
          v80.i64[1] = (uint64_t)___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEb_block_invoke;
          v81 = (char *)&__block_descriptor_48_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE__e5_v8__0l;
          uint64_t v44 = (void *)MEMORY[0x2166A1D50](v8);
          id v82 = (id)MEMORY[0x2166A1D50]();
          char v83 = 1;
          dispatch_async(MEMORY[0x263EF83A0], &block);
        }
      }
    }
    else
    {
      -[LAUIPearlGlyphView _executeCompletionHandlers:]((uint64_t)self, 0);
      if (v8)
      {
        if (*((unsigned char *)self + 480))
        {
          uint64_t block = MEMORY[0x263EF8330];
          v80.i64[0] = 3321888768;
          v80.i64[1] = (uint64_t)___ZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEb_block_invoke;
          v81 = (char *)&__block_descriptor_48_ea8_32c102_ZTSKZN17LAUI_CA_utilities38animation_completion_handler_container7executeEU13block_pointerFvbEbEUlvE__e5_v8__0l;
          float v43 = (void *)MEMORY[0x2166A1D50](v8);
          id v82 = (id)MEMORY[0x2166A1D50]();
          char v83 = 0;
          dispatch_async(MEMORY[0x263EF83A0], &block);
        }
        else
        {
          uint64_t v45 = [v8 copy];
          float32x4_t v46 = (uint64_t **)((char *)self + 728);
          float32x4_t v47 = (uint64_t *)*((void *)self + 92);
          unint64_t v48 = *((void *)self + 93);
          if ((unint64_t)v47 >= v48)
          {
            uint64_t v55 = v47 - *v46;
            if ((unint64_t)(v55 + 1) >> 61) {
              std::vector<UIView * {__strong}>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v56 = v48 - (void)*v46;
            uint64_t v57 = v56 >> 2;
            if (v56 >> 2 <= (unint64_t)(v55 + 1)) {
              uint64_t v57 = v55 + 1;
            }
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v58 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v58 = v57;
            }
            id v82 = (char *)self + 744;
            if (v58) {
              float64x2_t v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UIView * {__strong}>>((uint64_t)self + 744, v58);
            }
            else {
              float64x2_t v59 = 0;
            }
            v65 = (uint64_t *)&v59[8 * v55];
            double v66 = &v59[8 * v58];
            v81 = v66;
            uint64_t *v65 = v45;
            float64x2_t v49 = v65 + 1;
            v80.i64[1] = (uint64_t)(v65 + 1);
            v68 = *v46;
            v67 = (uint64_t *)*((void *)self + 92);
            if (v67 == *v46)
            {
              int64x2_t v70 = vdupq_n_s64((unint64_t)v67);
            }
            else
            {
              do
              {
                uint64_t v69 = *--v67;
                uint64_t *v67 = 0;
                *--v65 = v69;
              }
              while (v67 != v68);
              int64x2_t v70 = *(int64x2_t *)v46;
              float64x2_t v49 = (void *)v80.i64[1];
              double v66 = v81;
            }
            void *v46 = v65;
            *((void *)self + 92) = v49;
            int64x2_t v80 = v70;
            v71 = (char *)*((void *)self + 93);
            *((void *)self + 93) = v66;
            v81 = v71;
            uint64_t block = v70.i64[0];
            std::__split_buffer<UIView * {__strong}>::~__split_buffer((uint64_t)&block);
          }
          else
          {
            uint64_t *v47 = v45;
            float64x2_t v49 = v47 + 1;
          }
          *((void *)self + 92) = v49;
        }
      }
      *((void *)self + 88) = *((void *)self + 98);
      *((void *)self + 98) = a3;
      -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)self, v5);
      *((void *)self + 88) = *((void *)self + 98);
    }
  }
}

- (void)_setSecureFaceIDViewState:(uint64_t)a3 animated:(void *)a4 withCompletion:
{
  id v6 = a4;
  if (a1)
  {
    uint64_t v7 = *(void *)(a1 + 784);
    if (v7 != a2)
    {
      *(void *)(a1 + 704) = v7;
      *(void *)(a1 + 784) = a2;
      if (a2 > 8) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = qword_2144991D8[a2];
      }
      [*(id *)(a1 + 760) setState:v8];
    }
    if (v6) {
      v6[2](v6, 1);
    }
  }
}

uint64_t __72__LAUIPearlGlyphView__setSecureFaceIDViewState_animated_withCompletion___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 > 8) {
    return 0;
  }
  else {
    return qword_2144991D8[v1];
  }
}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_2(void *a1, char a2)
{
  id v2 = a1[4];
  if (v2)
  {
    if ((a2 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
      id v2 = a1[4];
    }
    dispatch_group_leave(v2);
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && WeakRetained[90] == *(void *)(a1 + 48) && (uint64_t v4 = (void *)WeakRetained[55]) != 0)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      if (*((unsigned char *)WeakRetained + 770))
      {
        +[LAUIPearlGlyphView invokeSuccessFeedback];
        uint64_t v4 = (void *)v3[55];
        BOOL v5 = *(unsigned char *)(a1 + 56) != 0;
      }
      else
      {
        BOOL v5 = 1;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    _OWORD v6[2] = __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_4;
    v6[3] = &unk_26420CB78;
    id v7 = *(id *)(a1 + 32);
    [v4 setRevealed:1 animated:v5 withCompletion:v6];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_4(uint64_t a1)
{
}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_5(uint64_t a1)
{
}

void __42__LAUIPearlGlyphView__applyStateAnimated___block_invoke_114(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *((void *)WeakRetained + 90) == *(void *)(a1 + 48))
  {
    WeakRetained[712] = 0;
    uint64_t v3 = WeakRetained;
    -[LAUIPearlGlyphView _executeCompletionHandlers:]((uint64_t)WeakRetained, *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
    id WeakRetained = v3;
  }
}

- (void)setPaused:(BOOL)a3
{
  if (*((unsigned char *)self + 768) != a3)
  {
    *((unsigned char *)self + 768) = a3;
    -[LAUIPearlGlyphView _updateRendererPaused:]((uint64_t)self, !a3);
    if (*((unsigned char *)self + 768))
    {
      -[LAUIPearlGlyphView _executeCompletionHandlers:]((uint64_t)self, 0);
    }
  }
}

- (NSNumber)remainingMinDisplayTimeInterval
{
  return (NSNumber *)[*((id *)self + 95) remainingMinDisplayTimeInterval];
}

- (void)setDelegate:(id)a3
{
  uint64_t v4 = (id *)((char *)self + 800);
  id v5 = a3;
  objc_storeWeak(v4, v5);
  LOBYTE(v4) = objc_opt_respondsToSelector();

  *((unsigned char *)self + 448) = v4 & 1;
}

- (BOOL)isWireframeEnabled
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 552);
    return v1 && *(unsigned __int8 *)(v1 + 128) != 0;
  }
  return result;
}

- (uint64_t)setWireframeEnabled:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void *)(result + 552);
    if (v2) {
      *(unsigned char *)(v2 + 128) = a2;
    }
    return -[LAUIPearlGlyphView _updateRendererPaused:](result, 1);
  }
  return result;
}

- (double)modelTransform
{
  if (a1)
  {
    uint64_t v2 = *(_OWORD **)(a1 + 552);
    if (v2)
    {
      long long v3 = v2[14];
      a2[4] = v2[13];
      a2[5] = v3;
      long long v4 = v2[16];
      a2[6] = v2[15];
      a2[7] = v4;
      long long v5 = v2[10];
      *a2 = v2[9];
      a2[1] = v5;
      long long v6 = v2[11];
      long long v7 = v2[12];
    }
    else
    {
      uint64_t v8 = (_OWORD *)MEMORY[0x263EF8990];
      long long v9 = *(_OWORD *)(MEMORY[0x263EF8990] + 80);
      a2[4] = *(_OWORD *)(MEMORY[0x263EF8990] + 64);
      a2[5] = v9;
      long long v10 = v8[7];
      a2[6] = v8[6];
      a2[7] = v10;
      long long v11 = v8[1];
      *a2 = *v8;
      a2[1] = v11;
      long long v6 = v8[2];
      long long v7 = v8[3];
    }
    a2[2] = v6;
    a2[3] = v7;
  }
  else
  {
    *(void *)&long long v6 = 0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return *(double *)&v6;
}

- (uint64_t)setModelTransform:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 552);
    if (v3) {
      memmove((void *)(v3 + 144), a2, 0x80uLL);
    }
    return -[LAUIPearlGlyphView _updateRendererPaused:](v2, 1);
  }
  return result;
}

- (uint64_t)beginExternalAnimation
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 488);
    *(void *)(result + 488) = v1 + 1;
    if (!v1) {
      return -[LAUIPearlGlyphView _updateRendererPaused:](result, 0);
    }
  }
  return result;
}

- (uint64_t)endExternalAnimation
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 488) - 1;
    *(void *)(result + 488) = v1;
    if (!v1) {
      return -[LAUIPearlGlyphView _updateRendererPaused:](result, 0);
    }
  }
  return result;
}

- (void)renderLoop:(id)a3 drawableSizeDidChange:(CGSize)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)self + 480))
  {
    uint64_t v4 = 0;
    *((void *)self + 65) = *(void *)&a4.width;
    *((void *)self + 66) = *(void *)&a4.height;
    *((unsigned char *)self + 536) = 1;
    long long v5 = (_OWORD *)*((void *)self + 69);
    v6.f64[1] = 0.0;
    v6.f64[0] = 1.41421354 / *((double *)self + 62);
    v7.f64[0] = 0.0;
    v7.f64[1] = v6.f64[0];
    long long v18 = COERCE_UNSIGNED_INT64(2.00000444 / (a4.width / a4.height));
    long long vars0 = 0u;
    do
    {
      float64x2_t v9 = *(float64x2_t *)((char *)&v18 + v4);
      float64x2_t v8 = *(float64x2_t *)((char *)&v18 + v4 + 16);
      long long v10 = (float64x2_t *)((char *)&v20 + v4);
      *long long v10 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v6, v9.f64[0]), v7, v9, 1), (float64x2_t)0, v8.f64[0]), (float64x2_t)0, v8, 1);
      v10[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v9.f64[0]), (float64x2_t)0, v9, 1), (float64x2_t)xmmword_214498E10, v8.f64[0]), (float64x2_t)xmmword_214498E20, v8, 1);
      v4 += 32;
    }
    while (v4 != 128);
    long long v11 = v25;
    long long v32 = v24;
    long long v33 = v25;
    long long v12 = v26;
    long long v13 = v27;
    long long v34 = v26;
    long long v35 = v27;
    long long v14 = v20;
    long long v15 = v21;
    long long v28 = v20;
    long long v29 = v21;
    long long v16 = v22;
    long long v17 = v23;
    long long v30 = v22;
    long long v31 = v23;
    v5[29] = v24;
    v5[30] = v11;
    v5[31] = v12;
    v5[32] = v13;
    v5[25] = v14;
    v5[26] = v15;
    v5[27] = v16;
    v5[28] = v17;
    -[LAUIPearlGlyphView _updateRendererPaused:]((uint64_t)self, 1);
  }
}

- (void)renderLoop:(id)a3 drawAtTime:(double)a4
{
  uint64_t v151 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (*((unsigned char *)self + 480))
  {
LABEL_139:

    return;
  }
  if (*((unsigned char *)self + 536))
  {
    uint64_t v6 = 0;
    *((unsigned char *)self + 536) = 0;
    uint64_t v7 = *((void *)self + 70);
    double v133 = *(float *)(v7 + 160);
    double v131 = *(float *)(v7 + 240) * 0.5;
    uint64_t v8 = *((void *)self + 69);
    float64x2_t v10 = *(float64x2_t *)(v8 + 400);
    float64x2_t v9 = *(float64x2_t *)(v8 + 416);
    float64x2_t v12 = *(float64x2_t *)(v8 + 432);
    float64x2_t v11 = *(float64x2_t *)(v8 + 448);
    float64x2_t v14 = *(float64x2_t *)(v8 + 464);
    float64x2_t v13 = *(float64x2_t *)(v8 + 480);
    float64x2_t v16 = *(float64x2_t *)(v8 + 496);
    float64x2_t v15 = *(float64x2_t *)(v8 + 512);
    long long v17 = *(_OWORD *)(v8 + 352);
    long long v138 = *(_OWORD *)(v8 + 336);
    long long v139 = v17;
    long long v18 = *(_OWORD *)(v8 + 384);
    long long v140 = *(_OWORD *)(v8 + 368);
    long long v141 = v18;
    long long v19 = *(_OWORD *)(v8 + 288);
    float32x4_t v134 = *(float32x4_t *)(v8 + 272);
    long long v135 = v19;
    long long v20 = *(_OWORD *)(v8 + 320);
    long long v136 = *(_OWORD *)(v8 + 304);
    long long v137 = v20;
    do
    {
      float64x2_t v22 = *(float64x2_t *)((char *)&v134 + v6);
      float64x2_t v21 = *(float64x2_t *)((char *)&v134 + v6 + 16);
      long long v23 = (float64x2_t *)((char *)&v143 + v6);
      *long long v23 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v10, v22.f64[0]), v12, v22, 1), v14, v21.f64[0]), v16, v21, 1);
      v23[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, v22.f64[0]), v11, v22, 1), v13, v21.f64[0]), v15, v21, 1);
      v6 += 32;
    }
    while (v6 != 128);
    float64x2_t v120 = (float64x2_t)v144;
    float64x2_t v121 = v145;
    float64x2_t v122 = v143;
    float64x2_t v123 = (float64x2_t)v148;
    float64x2_t v124 = (float64x2_t)v146;
    float64x2_t v127 = v147;
    float64x2_t vars0 = *(float64x2_t *)&v149[16];
    float64x2_t v125 = *(float64x2_t *)v149;
    double v24 = *((double *)self + 66);
    double v25 = *((double *)self + 54);
    [*((id *)self + 99) bounds];
    double v27 = v26;
    double v29 = v28;
    [*((id *)self + 68) lineWidth];
    v30.f64[0] = 0.0;
    v30.f64[1] = v133;
    v31.f64[0] = 0.0;
    v31.f64[1] = v131;
    float64x2_t v32 = vaddq_f64(v30, v31);
    float64x2_t v33 = vmlaq_f64(vmlaq_laneq_f64(vmulq_n_f64(v120, v32.f64[0]), v124, v32, 1), (float64x2_t)0, v123);
    float64x2_t v34 = vmlaq_f64(vmlaq_laneq_f64(vmulq_n_f64(v122, v32.f64[0]), v121, v32, 1), (float64x2_t)0, v127);
    __asm { FMOV            V4.2D, #1.0 }
    float64x2_t v39 = vmlaq_f64(v34, _Q4, v125);
    float64x2_t v40 = vmlaq_f64(v33, _Q4, vars0);
    float64x2_t v41 = vsubq_f64(v30, v31);
    float64x2_t v42 = vmlaq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_n_f64(v122, v41.f64[0]), v121, v41, 1), (float64x2_t)0, v127), _Q4, v125);
    float64x2_t v43 = vmlaq_f64(vmlaq_f64(vmlaq_laneq_f64(vmulq_n_f64(v120, v41.f64[0]), v124, v41, 1), (float64x2_t)0, v123), _Q4, vars0);
    double v45 = floor(v24* 0.5* vabdd_f64(vmuld_lane_f64(1.0 / sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(v39, v39), vmulq_f64(v40, v40)))), v39, 1), vmuld_lane_f64(1.0 / sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(v42, v42), vmulq_f64(v43, v43)))), v42, 1)))/ v25+ v44 * 0.5;
    v41.f64[0] = v27 + v45 * -2.0;
    v43.f64[0] = v29 + v45 * -2.0;
    double v46 = v45;
    CGPathRef v47 = CGPathCreateWithEllipseInRect(*(CGRect *)(&v41 - 1), 0);
    if (v47)
    {
      [*((id *)self + 68) setPath:v47];
      CFRelease(v47);
    }
  }
  if (*((unsigned char *)self + 448))
  {
    id WeakRetained = objc_loadWeakRetained((id *)self + 100);
    [WeakRetained pearlGlyphViewWillRender:self];
  }
  double updated = LAUI_uniform_cubic_b_spline_renderer::renderer_t::update_last_render_time(*((LAUI_uniform_cubic_b_spline_renderer::renderer_t **)self
                                                                                      + 69));
  uint64_t v50 = *((void *)self + 70);
  unint64_t v51 = 0x26780B000;
  if (!*(unsigned char *)(v50 + 49)) {
    goto LABEL_136;
  }
  if (*(unsigned char *)(v50 + 48))
  {
LABEL_135:
    *((unsigned char *)self + *(int *)(v51 + 1088)) = 1;
    goto LABEL_136;
  }
  id v126 = v5;
  float v52 = updated * 1000.0;
  unsigned __int16 v53 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v50 + 272, v52);
  char v54 = v53;
  unsigned int v55 = v53;
  unsigned __int16 v56 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v50 + 328, v52);
  unsigned __int16 v57 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v50 + 384, v52);
  unsigned __int16 v58 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update(v50 + 440, v52);
  unsigned __int16 v59 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_dLNS_27animator_interpolation_typeE0EE6updateEf(v50 + 496, v52);
  uint64_t v128 = v50;
  unsigned __int16 v60 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v50 + 640, v52);
  unsigned __int16 v61 = LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v128 + 696, v52);
  unsigned __int16 v62 = LAUI_uniform_cubic_b_spline_renderer::animator_t<decltype(nullptr),(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v128 + 752, v52);
  BOOL v63 = v62 != 0;
  if (!(_BYTE)v61) {
    BOOL v63 = 0;
  }
  if (!(_BYTE)v60) {
    BOOL v63 = 0;
  }
  if (!(_BYTE)v59) {
    BOOL v63 = 0;
  }
  if (!(_BYTE)v58) {
    BOOL v63 = 0;
  }
  if (!(_BYTE)v57) {
    BOOL v63 = 0;
  }
  if (!(_BYTE)v56) {
    BOOL v63 = 0;
  }
  if (v54) {
    int v64 = v63;
  }
  else {
    int v64 = 0;
  }
  int v73 = *(float *)(v128 + 364) <= 0.0
     && v62 > 0xFFu
     && v61 > 0xFFu
     && v60 > 0xFFu
     && v59 > 0xFFu
     && v58 > 0xFFu
     && v57 > 0xFFu
     && v56 > 0xFFu
     && v55 > 0xFF;
  uint64_t v74 = *(void *)(v128 + 848);
  uint64_t v75 = *(void *)(v128 + 856);
  while (v74 != v75)
  {
    unsigned __int16 v76 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(v74 + 112, v52);
    int v64 = (v76 != 0) & v64;
    int v73 = (v76 > 0xFFu) & v73;
    uint64_t v77 = *(void *)(v74 + 208);
    uint64_t v78 = *(void *)(v74 + 216);
    while (v77 != v78)
    {
      unsigned __int16 v79 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv3_fLNS_27animator_interpolation_typeE0EE6updateEf(v77, v52);
      int v64 = (v79 != 0) & v64;
      int v73 = (v79 > 0xFFu) & v73;
      v77 += 96;
    }
    v74 += 240;
  }
  int64x2_t v80 = *(float32x4_t **)(v128 + 872);
  v81 = *(float32x4_t **)(v128 + 880);
  if (v80 == v81)
  {
LABEL_104:
    unsigned __int16 v103 = LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update(v128 + 912, v52);
    char v104 = v103;
    unsigned int v105 = v103;
    unsigned __int16 v106 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf(v128 + 1008, v52);
    BOOL v108 = v106 > 0xFFu && v105 > 0xFF;
    BOOL v109 = v106 != 0;
    if (!v104) {
      BOOL v109 = 0;
    }
    int v110 = v109 & v64;
    if ((v108 & v73) != 0) {
      int v111 = 256;
    }
    else {
      int v111 = 0;
    }
    char v112 = v108 & v73 ^ 1;
    int v113 = v111 | v110;
    id v5 = v126;
    if (!v113)
    {
      uint64_t v118 = *(void *)(v128 + 872);
      uint64_t v119 = *(void *)(v128 + 880);
      if (v118 == v119) {
        goto LABEL_134;
      }
      while (!*(void *)(v118 + 16))
      {
        v118 += 288;
        if (v118 == v119) {
          goto LABEL_117;
        }
      }
    }
    LAUI_CA_utilities::animation_completion_handler_container::operator()((void **)(v128 + 56), 1);
LABEL_117:
    if (v113 && *(unsigned char *)(v128 + 40))
    {
      v114 = *(void **)v128;
      unint64_t v115 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)(v128 + 8) - *(void *)v128) >> 4);
      if (v115 < 2)
      {
        if (v114)
        {
          *(void *)(v128 + 8) = v114;
          operator delete(v114);
        }
        *(unsigned char *)(v128 + 40) = 0;
      }
      else
      {
        uint64_t v116 = *(void *)(v128 + 32);
        if (*(unsigned char *)(v128 + 24))
        {
          if (v116)
          {
            unint64_t v117 = v116 - 1;
          }
          else
          {
            *(unsigned char *)(v128 + 24) = 0;
            unint64_t v117 = 1;
          }
        }
        else
        {
          unint64_t v117 = v116 + 1;
          if (v117 >= v115)
          {
            *(unsigned char *)(v128 + 24) = 1;
            unint64_t v117 = v115 - 2;
          }
        }
        *(void *)(v128 + 32) = v117;
      }
    }
LABEL_134:
    *(unsigned char *)(v128 + 49) = (*(unsigned char *)(v128 + 40) != 0) | v112 & 1;
    unint64_t v51 = 0x26780B000uLL;
    if (*(unsigned char *)(*((void *)self + 70) + 49)) {
      goto LABEL_135;
    }
LABEL_136:
    if ((LAUI_uniform_cubic_b_spline_renderer::renderer_t::render(*((LAUI_uniform_cubic_b_spline_renderer::renderer_t **)self
                                                                   + 69)) & 1) == 0)
      *((unsigned char *)self + *(int *)(v51 + 1088)) = 1;
    -[LAUIPearlGlyphView _updateRendererPaused:]((uint64_t)self, 0);
    goto LABEL_139;
  }
  __asm { FMOV            V0.4S, #1.0 }
  float64x2_t v132 = _Q0;
  long long vars0a = xmmword_214498E20;
  while (1)
  {
    int v83 = v73 & 1;
    int v84 = v64 & 1;
    if (v80[1].i64[0]) {
      break;
    }
LABEL_89:
    unsigned __int16 v96 = LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::update((uint64_t)&v80[6], v52);
    char v97 = v96;
    unsigned int v98 = v96;
    unsigned __int16 v99 = _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE6updateEf((uint64_t)&v80[12], v52);
    BOOL v100 = v99 != 0;
    if (!v97) {
      BOOL v100 = 0;
    }
    if (v84) {
      int v64 = v100;
    }
    else {
      int v64 = 0;
    }
    int v73 = v99 > 0xFFu && v98 > 0xFF && v83 != 0;
    v80 += 18;
    if (v80 == v81) {
      goto LABEL_104;
    }
  }
  v80[1].f32[2] = v80[1].f32[2] + v52;
  LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::update((uint64_t)&v80[2], v52);
  float64x2_t v143 = 0u;
  float64x2_t v145 = 0u;
  long long v146 = xmmword_214498B80;
  float64x2_t v147 = v132;
  *(_DWORD *)v149 = 1065353216;
  *(_OWORD *)&v149[8] = xmmword_214498E20;
  *(_DWORD *)&v149[24] = 0;
  uint64_t v150 = 0;
  float32x4_t v144 = v80[6];
  float32x4_t v148 = v80[12];
  char v85 = ((uint64_t (*)(float64x2_t *, uint64_t *, float))v80[1].i64[0])(&v143, &v80[1].i64[1], v52);
  if (v80[1].i64[0])
  {
    float v86 = v80[1].f32[3];
    float v87 = v80[4].f32[1];
    __int16 v88 = v80->i16[4];
    if ((v88 & 2) != 0)
    {
      if ((v80->i16[5] & 2) != 0) {
        float v89 = v80[4].f32[1];
      }
      else {
        float v89 = v80[1].f32[3];
      }
      float v90 = nexttowardf(1.0, 0.0);
      float32x4_t v134 = v144;
      LODWORD(v135) = fmaxf(fminf(v89, v90), 0.0);
      if (*(float *)&v135 <= 0.0) {
        float v91 = 0.0;
      }
      else {
        float v91 = INFINITY;
      }
      BYTE4(v135) = 0;
      BYTE12(v135) = 0;
      *(float *)&long long v136 = v91;
      *(void *)((char *)&v136 + 4) = LODWORD(v91);
      LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<simd::quatf>>((uint64_t)&v80[6], &v134, 6);
      if (!v80[1].i64[0]) {
        goto LABEL_79;
      }
      __int16 v88 = v80->i16[4];
    }
    if ((v88 & 0x20) != 0)
    {
      if ((v80->i16[5] & 0x20) != 0) {
        float v86 = v87;
      }
      float v92 = nexttowardf(1.0, 0.0);
      float32x4_t v134 = v148;
      LODWORD(v135) = fmaxf(fminf(v86, v92), 0.0);
      if (*(float *)&v135 <= 0.0) {
        float v93 = 0.0;
      }
      else {
        float v93 = INFINITY;
      }
      BYTE4(v135) = 0;
      BYTE12(v135) = 0;
      *(float *)&long long v136 = v93;
      *(void *)((char *)&v136 + 4) = LODWORD(v93);
      _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE10set_targetINS_18animation_target_tIS1_EEEEbOT_NS_25animation_target_option_tE((uint64_t)&v80[12], &v134, 6);
    }
  }
LABEL_79:
  if ((v85 & 1) == 0)
  {
    int v84 = 0;
    int v83 = 0;
    goto LABEL_89;
  }
  v80->i32[2] = 0;
  v80[1].i64[0] = 0;
  __int32 v94 = v80[5].i32[2];
  v142.i32[0] = 953267991;
  if (*(float *)&v94 <= 0.0)
  {
    v142.i32[1] = 981668463;
LABEL_86:
    LAUI_uniform_cubic_b_spline_renderer::animator_t<simd::quatf,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)0>::resolve_infinite_duration((uint64_t)&v80[6], &v142);
    _ZN36LAUI_uniform_cubic_b_spline_renderer10animator_tIDv4_fLNS_27animator_interpolation_typeE0EE25resolve_infinite_durationERKNS_18animation_timing_t23epsilon_configuration_tE((uint64_t)&v80[12], &v142);
    v80[1].i64[1] = 0;
    v80[5].i32[2] = 0;
    v134.i32[0] = 0;
    v134.i32[1] = fmaxf(fminf(nexttowardf(1.0, 0.0), 0.0), 0.0);
    v134.i8[8] = 0;
    LOBYTE(v135) = 0;
    HIDWORD(v135) = 0;
    float v95 = INFINITY;
    if (v134.f32[1] <= 0.0) {
      float v95 = 0.0;
    }
    *((float *)&v135 + 1) = v95;
    *((float *)&v135 + 2) = v95;
    LAUI_uniform_cubic_b_spline_renderer::animator_t<float,(LAUI_uniform_cubic_b_spline_renderer::animator_interpolation_type)1>::set_target<LAUI_uniform_cubic_b_spline_renderer::animation_target_t<float>>((uint64_t)&v80[2], (uint64_t)&v134, 6);
    goto LABEL_89;
  }
  v142.i32[1] = v94;
  if (*(float *)&v94 < 1.0)
  {
    if (*(float *)&v94 < 0.0001) {
      v142.i32[0] = v94;
    }
    goto LABEL_86;
  }
  __break(1u);
}

- (void)_updateReduceBlurState
{
  if (a1)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      uint64_t v2 = a1 + 424;
      if (a1[424]) {
        return;
      }
      LOBYTE(IsReduceMotionEnabled) = 1;
    }
    else
    {
      BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      uint64_t v2 = a1 + 424;
      if (IsReduceMotionEnabled == (a1[424] != 0)) {
        return;
      }
    }
    *uint64_t v2 = IsReduceMotionEnabled;
    -[LAUIPearlGlyphView _applyConfiguration](a1);
    if (a1[712]) {
      BOOL v4 = a1[713] != 0;
    }
    else {
      BOOL v4 = 0;
    }
    -[LAUIPearlGlyphView _applyStateAnimated:]((uint64_t)a1, v4);
  }
}

- (unint64_t)faceVisibility
{
  return *((void *)self + 97);
}

- (int64_t)state
{
  return *((void *)self + 98);
}

- (BOOL)isPaused
{
  return *((unsigned char *)self + 768);
}

- (BOOL)shakeEnabled
{
  return *((unsigned char *)self + 769);
}

- (void)setShakeEnabled:(BOOL)a3
{
  *((unsigned char *)self + 769) = a3;
}

- (BOOL)feedbackEnabled
{
  return *((unsigned char *)self + 770);
}

- (void)setFeedbackEnabled:(BOOL)a3
{
  *((unsigned char *)self + 770) = a3;
}

- (CALayer)contentLayer
{
  return (CALayer *)*((void *)self + 99);
}

- (LAUIPearlGlyphViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 100);
  return (LAUIPearlGlyphViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 100);
  objc_storeStrong((id *)self + 99, 0);
  objc_storeStrong((id *)self + 95, 0);
  uint64_t v3 = (void **)((char *)self + 728);
  std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v3);
  if (*((unsigned char *)self + 680)) {

  }
  if (*((unsigned char *)self + 600)) {
  std::unique_ptr<LAUI_uniform_cubic_b_spline_renderer::renderer_t>::reset[abi:ne180100]((LAUI_uniform_cubic_b_spline_renderer::renderer_t **)self + 69, 0);
  }
  objc_storeStrong((id *)self + 68, 0);
  objc_storeStrong((id *)self + 59, 0);
  objc_storeStrong((id *)self + 58, 0);
  objc_storeStrong((id *)self + 57, 0);
  objc_storeStrong((id *)self + 55, 0);
  objc_storeStrong((id *)self + 51, 0);
}

- (id).cxx_construct
{
  *((void *)self + 52) = 0;
  *((void *)self + 69) = 0;
  *((void *)self + 70) = 0;
  *((unsigned char *)self + 592) = 0;
  *((unsigned char *)self + 600) = 0;
  *((unsigned char *)self + 672) = 0;
  *((unsigned char *)self + 680) = 0;
  *((void *)self + 92) = 0;
  *((void *)self + 93) = 0;
  *((void *)self + 91) = 0;
  return self;
}

- (void)initSecureGlyphViewWithConfiguration:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_214463000, log, OS_LOG_TYPE_ERROR, "Could not create secure glyph.", v1, 2u);
}

@end