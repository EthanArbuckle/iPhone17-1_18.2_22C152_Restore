@interface CAMSemanticStyleStatusIndicator
- (BOOL)shouldUseOutline;
- (BOOL)supportsOrientations;
- (CALayer)_coolPlatterLayer;
- (CALayer)_maskBackgroundLayer;
- (CALayer)_maskLargeTickLayer;
- (CALayer)_maskSmallTickLayer;
- (CALayer)_neutralPlatterLayer;
- (CALayer)_platterMaskLayer;
- (CALayer)_warmPlatterLayer;
- (CAMSemanticStyle)semanticStyle;
- (CAMSemanticStyleStatusIndicator)init;
- (CAReplicatorLayer)_maskTickReplicatorLayer;
- (CAShapeLayer)_maskStrokeLayer;
- (CGRect)_platterFrame;
- (CGSize)intrinsicContentSize;
- (UIImageView)_stackSymbolView;
- (UIView)_platterView;
- (id)_generatePlatterImageWithRenderer:(id)a3 colors:(id)a4 size:(CGSize)a5;
- (id)accessibilityIdentifier;
- (id)imageNameForCurrentState;
- (int64_t)_visibleTickCount;
- (void)_updateGradientAlphasAnimated:(BOOL)a3;
- (void)_updateGradientImages;
- (void)_updateImageOrientationAnimated:(BOOL)a3;
- (void)_updatePlatterStrokeProgressAnimated:(BOOL)a3;
- (void)_updateStrokePath;
- (void)_updateTicksAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setSemanticStyle:(id)a3;
- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4;
@end

@implementation CAMSemanticStyleStatusIndicator

- (CAMSemanticStyleStatusIndicator)init
{
  v106[4] = *MEMORY[0x263EF8340];
  v88.receiver = self;
  v88.super_class = (Class)CAMSemanticStyleStatusIndicator;
  v2 = -[CAMControlStatusIndicator initWithFrame:](&v88, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v2)
  {
    v3 = [[CAMSemanticStyle alloc] initWithPresetType:0];
    semanticStyle = v2->_semanticStyle;
    v2->_semanticStyle = v3;

    v5 = (void *)MEMORY[0x263F827E8];
    v6 = CAMCameraUIFrameworkBundle();
    v87 = [v5 imageNamed:@"CAMSemanticStyleIndicator" inBundle:v6];

    uint64_t v7 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v87];
    stackSymbolView = v2->__stackSymbolView;
    v2->__stackSymbolView = (UIImageView *)v7;

    v9 = [MEMORY[0x263F825C8] whiteColor];
    [(UIImageView *)v2->__stackSymbolView setTintColor:v9];

    [(CAMSemanticStyleStatusIndicator *)v2 addSubview:v2->__stackSymbolView];
    v10 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    platterView = v2->__platterView;
    v2->__platterView = v10;

    [(UIView *)v2->__platterView setUserInteractionEnabled:0];
    [(CAMSemanticStyleStatusIndicator *)v2 insertSubview:v2->__platterView below:v2->__stackSymbolView];
    v12 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    neutralPlatterLayer = v2->__neutralPlatterLayer;
    v2->__neutralPlatterLayer = v12;

    uint64_t v14 = *MEMORY[0x263F15E00];
    [(CALayer *)v2->__neutralPlatterLayer setContentsGravity:*MEMORY[0x263F15E00]];
    v15 = [(CAMSemanticStyleStatusIndicator *)v2 traitCollection];
    [v15 displayScale];
    -[CALayer setContentsScale:](v2->__neutralPlatterLayer, "setContentsScale:");

    v105[0] = @"bounds";
    v16 = [MEMORY[0x263EFF9D0] null];
    v106[0] = v16;
    v105[1] = @"position";
    v17 = [MEMORY[0x263EFF9D0] null];
    v106[1] = v17;
    v105[2] = @"opacity";
    v18 = [MEMORY[0x263EFF9D0] null];
    v106[2] = v18;
    v105[3] = @"contents";
    v19 = [MEMORY[0x263EFF9D0] null];
    v106[3] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:4];
    [(CALayer *)v2->__neutralPlatterLayer setActions:v20];

    v21 = [(UIView *)v2->__platterView layer];
    [v21 addSublayer:v2->__neutralPlatterLayer];

    v22 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    coolPlatterLayer = v2->__coolPlatterLayer;
    v2->__coolPlatterLayer = v22;

    [(CALayer *)v2->__coolPlatterLayer setContentsGravity:v14];
    v24 = [(CAMSemanticStyleStatusIndicator *)v2 traitCollection];
    [v24 displayScale];
    -[CALayer setContentsScale:](v2->__coolPlatterLayer, "setContentsScale:");

    v103[0] = @"bounds";
    v25 = [MEMORY[0x263EFF9D0] null];
    v104[0] = v25;
    v103[1] = @"position";
    v26 = [MEMORY[0x263EFF9D0] null];
    v104[1] = v26;
    v103[2] = @"opacity";
    v27 = [MEMORY[0x263EFF9D0] null];
    v104[2] = v27;
    v103[3] = @"contents";
    v28 = [MEMORY[0x263EFF9D0] null];
    v104[3] = v28;
    v29 = [NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:4];
    [(CALayer *)v2->__coolPlatterLayer setActions:v29];

    v30 = [(UIView *)v2->__platterView layer];
    [v30 addSublayer:v2->__coolPlatterLayer];

    v31 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    warmPlatterLayer = v2->__warmPlatterLayer;
    v2->__warmPlatterLayer = v31;

    [(CALayer *)v2->__warmPlatterLayer setContentsGravity:v14];
    v33 = [(CAMSemanticStyleStatusIndicator *)v2 traitCollection];
    [v33 displayScale];
    -[CALayer setContentsScale:](v2->__warmPlatterLayer, "setContentsScale:");

    v101[0] = @"bounds";
    v34 = [MEMORY[0x263EFF9D0] null];
    v102[0] = v34;
    v101[1] = @"position";
    v35 = [MEMORY[0x263EFF9D0] null];
    v102[1] = v35;
    v101[2] = @"opacity";
    v36 = [MEMORY[0x263EFF9D0] null];
    v102[2] = v36;
    v101[3] = @"contents";
    v37 = [MEMORY[0x263EFF9D0] null];
    v102[3] = v37;
    v38 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:4];
    [(CALayer *)v2->__warmPlatterLayer setActions:v38];

    v39 = [(UIView *)v2->__platterView layer];
    [v39 addSublayer:v2->__warmPlatterLayer];

    v40 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    platterMaskLayer = v2->__platterMaskLayer;
    v2->__platterMaskLayer = v40;

    v99[0] = @"bounds";
    v42 = [MEMORY[0x263EFF9D0] null];
    v99[1] = @"position";
    v100[0] = v42;
    v43 = [MEMORY[0x263EFF9D0] null];
    v100[1] = v43;
    v44 = [NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:2];
    [(CALayer *)v2->__platterMaskLayer setActions:v44];

    v45 = v2->__platterMaskLayer;
    v46 = [(UIView *)v2->__platterView layer];
    [v46 setMask:v45];

    v47 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    maskBackgroundLayer = v2->__maskBackgroundLayer;
    v2->__maskBackgroundLayer = v47;

    id v49 = [MEMORY[0x263F825C8] whiteColor];
    -[CALayer setBackgroundColor:](v2->__maskBackgroundLayer, "setBackgroundColor:", [v49 CGColor]);

    v97[0] = @"bounds";
    v50 = [MEMORY[0x263EFF9D0] null];
    v98[0] = v50;
    v97[1] = @"position";
    v51 = [MEMORY[0x263EFF9D0] null];
    v98[1] = v51;
    v97[2] = @"opacity";
    v52 = [MEMORY[0x263EFF9D0] null];
    v98[2] = v52;
    v53 = [NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:3];
    [(CALayer *)v2->__maskBackgroundLayer setActions:v53];

    [(CALayer *)v2->__platterMaskLayer addSublayer:v2->__maskBackgroundLayer];
    v54 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    maskStrokeLayer = v2->__maskStrokeLayer;
    v2->__maskStrokeLayer = v54;

    id v56 = [MEMORY[0x263F825C8] whiteColor];
    -[CAShapeLayer setStrokeColor:](v2->__maskStrokeLayer, "setStrokeColor:", [v56 CGColor]);

    [(CAShapeLayer *)v2->__maskStrokeLayer setFillColor:0];
    [(CAShapeLayer *)v2->__maskStrokeLayer setLineWidth:1.0];
    v95[0] = @"bounds";
    v57 = [MEMORY[0x263EFF9D0] null];
    v96[0] = v57;
    v95[1] = @"position";
    v58 = [MEMORY[0x263EFF9D0] null];
    v96[1] = v58;
    v95[2] = @"path";
    v59 = [MEMORY[0x263EFF9D0] null];
    v96[2] = v59;
    v95[3] = @"strokeStart";
    v60 = [MEMORY[0x263EFF9D0] null];
    v96[3] = v60;
    v95[4] = @"strokeEnd";
    v61 = [MEMORY[0x263EFF9D0] null];
    v96[4] = v61;
    v62 = [NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:5];
    [(CAShapeLayer *)v2->__maskStrokeLayer setActions:v62];

    [(CALayer *)v2->__platterMaskLayer addSublayer:v2->__maskStrokeLayer];
    v63 = (CAReplicatorLayer *)objc_alloc_init(MEMORY[0x263F15868]);
    maskTickReplicatorLayer = v2->__maskTickReplicatorLayer;
    v2->__maskTickReplicatorLayer = v63;

    v93[0] = @"bounds";
    v65 = [MEMORY[0x263EFF9D0] null];
    v94[0] = v65;
    v93[1] = @"position";
    v66 = [MEMORY[0x263EFF9D0] null];
    v94[1] = v66;
    v93[2] = @"instanceCount";
    v67 = [MEMORY[0x263EFF9D0] null];
    v94[2] = v67;
    v93[3] = @"instanceTransform";
    v68 = [MEMORY[0x263EFF9D0] null];
    v94[3] = v68;
    v93[4] = @"hidden";
    v69 = [MEMORY[0x263EFF9D0] null];
    v94[4] = v69;
    v70 = [NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:5];
    [(CAReplicatorLayer *)v2->__maskTickReplicatorLayer setActions:v70];

    [(CALayer *)v2->__platterMaskLayer addSublayer:v2->__maskTickReplicatorLayer];
    v71 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    maskSmallTickLayer = v2->__maskSmallTickLayer;
    v2->__maskSmallTickLayer = v71;

    id v73 = [MEMORY[0x263F825C8] whiteColor];
    -[CALayer setBackgroundColor:](v2->__maskSmallTickLayer, "setBackgroundColor:", [v73 CGColor]);

    v74 = [(CAMSemanticStyleStatusIndicator *)v2 traitCollection];
    [v74 displayScale];
    -[CALayer setRasterizationScale:](v2->__maskSmallTickLayer, "setRasterizationScale:");

    [(CALayer *)v2->__maskSmallTickLayer setAllowsEdgeAntialiasing:1];
    v91[0] = @"bounds";
    v75 = [MEMORY[0x263EFF9D0] null];
    v91[1] = @"position";
    v92[0] = v75;
    v76 = [MEMORY[0x263EFF9D0] null];
    v92[1] = v76;
    v77 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2];
    [(CALayer *)v2->__maskSmallTickLayer setActions:v77];

    [(CAReplicatorLayer *)v2->__maskTickReplicatorLayer addSublayer:v2->__maskSmallTickLayer];
    v78 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    maskLargeTickLayer = v2->__maskLargeTickLayer;
    v2->__maskLargeTickLayer = v78;

    id v80 = [MEMORY[0x263F825C8] whiteColor];
    -[CALayer setBackgroundColor:](v2->__maskLargeTickLayer, "setBackgroundColor:", [v80 CGColor]);

    v81 = [(CAMSemanticStyleStatusIndicator *)v2 traitCollection];
    [v81 displayScale];
    -[CALayer setRasterizationScale:](v2->__maskLargeTickLayer, "setRasterizationScale:");

    [(CALayer *)v2->__maskLargeTickLayer setAllowsEdgeAntialiasing:1];
    v89[0] = @"bounds";
    v82 = [MEMORY[0x263EFF9D0] null];
    v90[0] = v82;
    v89[1] = @"position";
    v83 = [MEMORY[0x263EFF9D0] null];
    v90[1] = v83;
    v89[2] = @"hidden";
    v84 = [MEMORY[0x263EFF9D0] null];
    v90[2] = v84;
    v85 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:3];
    [(CALayer *)v2->__maskLargeTickLayer setActions:v85];

    [(CALayer *)v2->__platterMaskLayer addSublayer:v2->__maskLargeTickLayer];
    [(CAMSemanticStyleStatusIndicator *)v2 _updateStrokePath];
    [(CAMSemanticStyleStatusIndicator *)v2 _updateGradientImages];
    [(CAMSemanticStyleStatusIndicator *)v2 _updateTicksAnimated:0];
    [(CAMSemanticStyleStatusIndicator *)v2 _updateGradientAlphasAnimated:0];
    [(CAMSemanticStyleStatusIndicator *)v2 _updatePlatterStrokeProgressAnimated:0];
  }
  return v2;
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (id)imageNameForCurrentState
{
  return 0;
}

- (BOOL)supportsOrientations
{
  return 1;
}

- (void)_updateImageOrientationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CAMSemanticStyleStatusIndicator *)self _stackSymbolView];
  +[CAMView rotateView:v5 toInterfaceOrientation:[(CAMControlStatusIndicator *)self orientation] animated:v3];

  id v6 = [(CAMSemanticStyleStatusIndicator *)self _platterView];
  +[CAMView rotateView:v6 toInterfaceOrientation:[(CAMControlStatusIndicator *)self orientation] animated:v3];
}

- (void)setSemanticStyle:(id)a3
{
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (!-[CAMSemanticStyle isEqualToSemanticStyle:](self->_semanticStyle, "isEqualToSemanticStyle:"))
  {
    objc_storeStrong((id *)&self->_semanticStyle, a3);
    [(CAMSemanticStyleStatusIndicator *)self _updateTicksAnimated:v4];
    [(CAMSemanticStyleStatusIndicator *)self _updatePlatterStrokeProgressAnimated:v4];
    [(CAMSemanticStyleStatusIndicator *)self _updateGradientAlphasAnimated:v4];
  }
}

- (int64_t)_visibleTickCount
{
  BOOL v3 = [(CAMSemanticStyleStatusIndicator *)self semanticStyle];
  [v3 sceneBias];
  double v5 = fabs(v4);

  if (v5 < 0.005) {
    return 36;
  }
  id v7 = [(CAMSemanticStyleStatusIndicator *)self semanticStyle];
  [v7 sceneBias];
  int64_t v9 = vcvtpd_s64_f64((1.0 - fabs(v8)) * 36.0);

  if (v9 <= 1) {
    return 1;
  }
  else {
    return v9;
  }
}

- (id)_generatePlatterImageWithRenderer:(id)a3 colors:(id)a4 size:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__CAMSemanticStyleStatusIndicator__generatePlatterImageWithRenderer_colors_size___block_invoke;
  v12[3] = &unk_263FA2B98;
  id v13 = v8;
  CGFloat v14 = width;
  CGFloat v15 = height;
  id v9 = v8;
  v10 = [a3 imageWithActions:v12];

  return v10;
}

void __81__CAMSemanticStyleStatusIndicator__generatePlatterImageWithRenderer_colors_size___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        v11 = objc_msgSend(MEMORY[0x263F82DA0], "traitCollectionWithUserInterfaceStyle:", 2, (void)v19);
        v12 = [v10 resolvedColorWithTraitCollection:v11];

        id v13 = v12;
        objc_msgSend(v4, "addObject:", objc_msgSend(v13, "CGColor"));

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  id v14 = [MEMORY[0x263F825C8] redColor];
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v14 CGColor]);

  v16 = CGGradientCreateWithColors(ColorSpace, (CFArrayRef)v4, 0);
  v17 = (CGContext *)[v3 CGContext];
  CGContextSaveGState(v17);
  v27.size.CGFloat width = *(CGFloat *)(a1 + 40);
  v27.size.CGFloat height = *(CGFloat *)(a1 + 48);
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v18 = CGPathCreateWithEllipseInRect(v27, 0);
  CGContextAddPath(v17, v18);
  CGContextClip(v17);
  v26.y = *(CGFloat *)(a1 + 48);
  v25.x = 0.0;
  v25.y = 0.0;
  v26.x = 0.0;
  CGContextDrawLinearGradient(v17, v16, v25, v26, 0);
  CGPathRelease(v18);
  CGGradientRelease(v16);
  CGContextRestoreGState(v17);
}

- (void)_updateGradientImages
{
  v32[2] = *MEMORY[0x263EF8340];
  [(CAMSemanticStyleStatusIndicator *)self _platterFrame];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [MEMORY[0x263F827B0] preferredFormat];
  [v7 setPreferredRange:2];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:format:", v7, v4, v6);
  uint64_t v9 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.6];
  v32[0] = v9;
  v10 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.6];
  v32[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  v12 = -[CAMSemanticStyleStatusIndicator _generatePlatterImageWithRenderer:colors:size:](self, "_generatePlatterImageWithRenderer:colors:size:", v8, v11, v4, v6);

  id v13 = [MEMORY[0x263F825C8] systemBlueColor];
  v31[0] = v13;
  id v14 = [MEMORY[0x263F825C8] systemCyanColor];
  v31[1] = v14;
  CGFloat v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  v16 = -[CAMSemanticStyleStatusIndicator _generatePlatterImageWithRenderer:colors:size:](self, "_generatePlatterImageWithRenderer:colors:size:", v8, v15, v4, v6);

  v17 = [MEMORY[0x263F825C8] systemRedColor];
  v30[0] = v17;
  v18 = [MEMORY[0x263F825C8] systemYellowColor];
  v30[1] = v18;
  long long v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  long long v20 = -[CAMSemanticStyleStatusIndicator _generatePlatterImageWithRenderer:colors:size:](self, "_generatePlatterImageWithRenderer:colors:size:", v8, v19, v4, v6);

  id v21 = v12;
  uint64_t v22 = [v21 CGImage];
  v23 = [(CAMSemanticStyleStatusIndicator *)self _neutralPlatterLayer];
  [v23 setContents:v22];

  id v24 = v16;
  uint64_t v25 = [v24 CGImage];
  CGPoint v26 = [(CAMSemanticStyleStatusIndicator *)self _coolPlatterLayer];
  [v26 setContents:v25];

  id v27 = v20;
  uint64_t v28 = [v27 CGImage];
  v29 = [(CAMSemanticStyleStatusIndicator *)self _warmPlatterLayer];
  [v29 setContents:v28];
}

- (void)_updateGradientAlphasAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CAMSemanticStyleStatusIndicator *)self semanticStyle];
  [v5 warmthBias];

  CEKProgressClamped();
  double v7 = v6;
  CEKProgressClamped();
  double v8 = -(v7 * (v7 + -2.0));
  double v10 = -(v9 * (v9 + -2.0));
  CEKInterpolateClamped();
  double v12 = v11;
  if (v3)
  {
    id v13 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    id v14 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    CGFloat v15 = [(CAMSemanticStyleStatusIndicator *)self _coolPlatterLayer];
    v16 = [v15 presentationLayer];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [(CAMSemanticStyleStatusIndicator *)self _coolPlatterLayer];
    }
    long long v19 = v18;

    long long v20 = NSNumber;
    id v52 = v19;
    [v19 opacity];
    id v21 = objc_msgSend(v20, "numberWithFloat:");
    [v14 setFromValue:v21];

    uint64_t v22 = [NSNumber numberWithDouble:v8];
    [v14 setToValue:v22];

    [v14 setDuration:0.5];
    [v14 setTimingFunction:v13];
    v23 = [(CAMSemanticStyleStatusIndicator *)self _coolPlatterLayer];
    [v23 addAnimation:v14 forKey:@"opacityAnimation"];

    id v24 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    uint64_t v25 = [(CAMSemanticStyleStatusIndicator *)self _warmPlatterLayer];
    CGPoint v26 = [v25 presentationLayer];
    id v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = [(CAMSemanticStyleStatusIndicator *)self _warmPlatterLayer];
    }
    v29 = v28;

    v30 = NSNumber;
    [v29 opacity];
    v31 = objc_msgSend(v30, "numberWithFloat:");
    [v24 setFromValue:v31];

    v32 = [NSNumber numberWithDouble:v10];
    [v24 setToValue:v32];

    [v24 setDuration:0.5];
    [v24 setTimingFunction:v13];
    v33 = [(CAMSemanticStyleStatusIndicator *)self _warmPlatterLayer];
    [v33 addAnimation:v24 forKey:@"opacityAnimation"];

    v34 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    v35 = [(CAMSemanticStyleStatusIndicator *)self _maskBackgroundLayer];
    v36 = [v35 presentationLayer];
    v37 = v36;
    if (v36)
    {
      id v38 = v36;
    }
    else
    {
      id v38 = [(CAMSemanticStyleStatusIndicator *)self _maskBackgroundLayer];
    }
    v39 = v38;

    v40 = NSNumber;
    [v39 opacity];
    v41 = objc_msgSend(v40, "numberWithFloat:");
    [v34 setFromValue:v41];

    v42 = [NSNumber numberWithDouble:v12];
    [v34 setToValue:v42];

    [v34 setDuration:0.5];
    [v34 setTimingFunction:v13];
    v43 = [(CAMSemanticStyleStatusIndicator *)self _maskBackgroundLayer];
    [v43 addAnimation:v34 forKey:@"opacityAnimation"];
  }
  v45 = [(CAMSemanticStyleStatusIndicator *)self _coolPlatterLayer];
  float v44 = v8;
  *(float *)&double v46 = v44;
  [v45 setOpacity:v46];

  v48 = [(CAMSemanticStyleStatusIndicator *)self _warmPlatterLayer];
  float v47 = v10;
  *(float *)&double v49 = v47;
  [v48 setOpacity:v49];

  id v53 = [(CAMSemanticStyleStatusIndicator *)self _maskBackgroundLayer];
  float v50 = v12;
  *(float *)&double v51 = v50;
  [v53 setOpacity:v51];
}

- (void)_updateTicksAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v47[2] = *MEMORY[0x263EF8340];
  int64_t v5 = [(CAMSemanticStyleStatusIndicator *)self _visibleTickCount];
  double v6 = [(CAMSemanticStyleStatusIndicator *)self semanticStyle];
  [v6 sceneBias];
  CGFloat v8 = dbl_209C796F0[v7 > 0.0];

  memset(&v44, 0, sizeof(v44));
  CATransform3DMakeRotation(&v44, v8, 0.0, 0.0, 1.0);
  if (v3)
  {
    double v9 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    double v10 = [(CAMSemanticStyleStatusIndicator *)self _maskTickReplicatorLayer];
    double v11 = [v10 presentationLayer];
    double v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [(CAMSemanticStyleStatusIndicator *)self _maskTickReplicatorLayer];
    }
    id v14 = v13;

    memset(&v43, 0, sizeof(v43));
    if (v14) {
      [v14 instanceTransform];
    }
    uint64_t v15 = [v14 instanceCount];
    CATransform3D a = v43;
    CATransform3D b = v44;
    BOOL v16 = CATransform3DEqualToTransform(&a, &b);
    v17 = [(CAMSemanticStyleStatusIndicator *)self semanticStyle];
    [v17 sceneBias];
    double v19 = v18;

    if (!v16 || v19 == 0.0)
    {
      double v24 = (double)(36 - v15) / (double)(36 - v15 - v5 + 36);
      long long v20 = [MEMORY[0x263F15760] animationWithKeyPath:@"instanceCount"];
      uint64_t v25 = [NSNumber numberWithInteger:v15 + 1];
      [v20 setFromValue:v25];

      [v20 setToValue:&unk_26BDDE130];
      [v20 setDuration:v24 * 0.5];
      v23 = [MEMORY[0x263F15760] animationWithKeyPath:@"instanceCount"];
      [v23 setFromValue:&unk_26BDDE130];
      CGPoint v26 = [NSNumber numberWithInteger:v5 + 1];
      [v23 setToValue:v26];

      [v23 setDuration:(1.0 - v24) * 0.5];
      [v23 setBeginTime:v24 * 0.5];
      id v27 = [MEMORY[0x263F157D8] animationWithKeyPath:@"instanceTransform"];
      CATransform3D a = v43;
      id v28 = [MEMORY[0x263F08D40] valueWithCATransform3D:&a];
      v47[0] = v28;
      CATransform3D a = v44;
      v29 = [MEMORY[0x263F08D40] valueWithCATransform3D:&a];
      v47[1] = v29;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
      v31 = v30 = v9;
      [v27 setValues:v31];

      double v9 = v30;
      v46[0] = &unk_26BDDE148;
      v32 = [NSNumber numberWithDouble:v24];
      v46[1] = v32;
      v46[2] = &unk_26BDDE160;
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:3];
      [v27 setKeyTimes:v33];

      [v27 setDuration:0.5];
      [v27 setCalculationMode:*MEMORY[0x263F15968]];
      v34 = [MEMORY[0x263F15750] animation];
      [v34 setDuration:0.5];
      v45[0] = v20;
      v45[1] = v23;
      v45[2] = v27;
      v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
      [v34 setAnimations:v35];

      [v34 setTimingFunction:v30];
      v36 = [(CAMSemanticStyleStatusIndicator *)self _maskTickReplicatorLayer];
      [v36 addAnimation:v34 forKey:@"instanceCountAnimation"];
    }
    else
    {
      long long v20 = [MEMORY[0x263F15760] animationWithKeyPath:@"instanceCount"];
      id v21 = [NSNumber numberWithInteger:v15 + 1];
      [v20 setFromValue:v21];

      uint64_t v22 = [NSNumber numberWithInteger:v5 + 1];
      [v20 setToValue:v22];

      [v20 setDuration:0.5];
      [v20 setTimingFunction:v9];
      v23 = [(CAMSemanticStyleStatusIndicator *)self _maskTickReplicatorLayer];
      [v23 addAnimation:v20 forKey:@"instanceCountAnimation"];
    }
  }
  v37 = [(CAMSemanticStyleStatusIndicator *)self _maskTickReplicatorLayer];
  [v37 setInstanceCount:v5];

  CATransform3D v40 = v44;
  id v38 = [(CAMSemanticStyleStatusIndicator *)self _maskTickReplicatorLayer];
  CATransform3D v39 = v40;
  [v38 setInstanceTransform:&v39];
}

- (void)_updatePlatterStrokeProgressAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v66[4] = *MEMORY[0x263EF8340];
  int64_t v5 = [(CAMSemanticStyleStatusIndicator *)self semanticStyle];
  [v5 sceneBias];
  double v7 = v6;

  double v8 = 0.0;
  double v9 = 0.0;
  if (v7 != 0.0)
  {
    uint64_t v10 = [(CAMSemanticStyleStatusIndicator *)self _visibleTickCount];
    [(CAMSemanticStyleStatusIndicator *)self _platterFrame];
    double v9 = 1.0
       - ((v11 * 3.14159265 + -36.0) / 36.0
        + fmax((double)v10 + -0.5, 0.0)
        + fmax((double)v10 + -1.0, 0.0) * ((v11 * 3.14159265 + -36.0) / 36.0))
       / (v11
        * 3.14159265);
  }
  BOOL v12 = v7 < 0.0;
  if (v7 >= 0.0) {
    double v13 = v9;
  }
  else {
    double v13 = -v9;
  }
  if (v7 >= 0.0) {
    double v14 = v9;
  }
  else {
    double v14 = 1.0;
  }
  if (v12) {
    double v8 = 1.0 - v9;
  }
  if (v3)
  {
    uint64_t v15 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    BOOL v16 = [(CAMSemanticStyleStatusIndicator *)self _maskStrokeLayer];
    v17 = [v16 presentationLayer];
    double v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [(CAMSemanticStyleStatusIndicator *)self _maskStrokeLayer];
    }
    long long v20 = v19;

    [v20 strokeEnd];
    double v22 = v21;
    [v20 strokeStart];
    double v24 = v22 - v23;
    [v20 strokeEnd];
    if (v25 == 1.0) {
      double v26 = -v24;
    }
    else {
      double v26 = v24;
    }
    if (v13 >= 0.0 == v26 >= 0.0)
    {
      [v20 strokeStart];
      double v48 = v47;
      [v20 strokeEnd];
      if (v13 < 0.0) {
        double v50 = 1.0;
      }
      else {
        double v50 = 0.0;
      }
      BOOL v51 = v26 < 0.0;
      if (v26 == 0.0) {
        double v52 = v50;
      }
      else {
        double v52 = v48;
      }
      if (v26 == 0.0) {
        double v53 = v50;
      }
      else {
        double v53 = v49;
      }
      if (v51) {
        double v54 = 1.0;
      }
      else {
        double v54 = 0.0;
      }
      if (v13 == 0.0) {
        double v55 = v54;
      }
      else {
        double v55 = v8;
      }
      if (v13 == 0.0) {
        double v56 = v54;
      }
      else {
        double v56 = v14;
      }
      v30 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeStart"];
      v57 = [NSNumber numberWithDouble:v52];
      [v30 setFromValue:v57];

      v58 = [NSNumber numberWithDouble:v55];
      [v30 setToValue:v58];

      [v30 setDuration:0.5];
      v34 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
      v59 = [NSNumber numberWithDouble:v53];
      [v34 setFromValue:v59];

      v60 = [NSNumber numberWithDouble:v56];
      [v34 setToValue:v60];

      [v34 setDuration:0.5];
      id v38 = [MEMORY[0x263F15750] animation];
      [v38 setDuration:0.5];
      v65[0] = v30;
      v65[1] = v34;
      v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:2];
      [v38 setAnimations:v61];

      [v38 setTimingFunction:v15];
      v41 = [(CAMSemanticStyleStatusIndicator *)self _maskStrokeLayer];
      [v41 addAnimation:v38 forKey:@"strokeProgressAnimation"];
    }
    else
    {
      double v27 = fabs(v24 / (v13 - v26));
      if (v26 < 0.0) {
        double v28 = 1.0;
      }
      else {
        double v28 = 0.0;
      }
      if (v13 < 0.0) {
        double v29 = 1.0;
      }
      else {
        double v29 = 0.0;
      }
      v30 = objc_msgSend(MEMORY[0x263F15760], "animationWithKeyPath:", @"strokeStart", 1.0 - v27);
      v31 = NSNumber;
      [v20 strokeStart];
      v32 = objc_msgSend(v31, "numberWithDouble:");
      [v30 setFromValue:v32];

      v33 = [NSNumber numberWithDouble:v28];
      [v30 setToValue:v33];

      [v30 setDuration:v27 * 0.5];
      v34 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
      v35 = NSNumber;
      [v20 strokeEnd];
      v36 = objc_msgSend(v35, "numberWithDouble:");
      [v34 setFromValue:v36];

      v37 = [NSNumber numberWithDouble:v28];
      [v34 setToValue:v37];

      [v34 setDuration:v27 * 0.5];
      id v38 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeStart"];
      CATransform3D v39 = [NSNumber numberWithDouble:v29];
      [v38 setFromValue:v39];

      CATransform3D v40 = [NSNumber numberWithDouble:v8];
      [v38 setToValue:v40];

      [v38 setDuration:v64 * 0.5];
      [v38 setBeginTime:v27 * 0.5];
      v41 = [MEMORY[0x263F15760] animationWithKeyPath:@"strokeEnd"];
      v42 = [NSNumber numberWithDouble:v29];
      [v41 setFromValue:v42];

      CATransform3D v43 = [NSNumber numberWithDouble:v14];
      [v41 setToValue:v43];

      [v41 setDuration:v64 * 0.5];
      [v41 setBeginTime:v27 * 0.5];
      CATransform3D v44 = [MEMORY[0x263F15750] animation];
      [v44 setDuration:0.5];
      v66[0] = v30;
      v66[1] = v34;
      v66[2] = v38;
      v66[3] = v41;
      v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:4];
      [v44 setAnimations:v45];

      [v44 setTimingFunction:v15];
      double v46 = [(CAMSemanticStyleStatusIndicator *)self _maskStrokeLayer];
      [v46 addAnimation:v44 forKey:@"strokeProgressAnimation"];
    }
  }
  v62 = [(CAMSemanticStyleStatusIndicator *)self _maskStrokeLayer];
  [v62 setStrokeStart:v8];

  v63 = [(CAMSemanticStyleStatusIndicator *)self _maskStrokeLayer];
  [v63 setStrokeEnd:v14];
}

- (void)_updateStrokePath
{
  CGFloat v3 = *MEMORY[0x263F00148];
  CGFloat v4 = *(double *)(MEMORY[0x263F00148] + 8);
  [(CAMSemanticStyleStatusIndicator *)self _platterFrame];
  v12.origin.x = v3;
  v12.origin.y = v4;
  CGRect v13 = CGRectInset(v12, 0.5, 0.5);
  double width = v13.size.width;
  UIRectGetCenter();
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v7, CAMPixelWidthForView(self) + width * 0.5 + -0.5, -1.57079633, 4.71238898);
  id v8 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 CGPath];

  id v10 = [(CAMSemanticStyleStatusIndicator *)self _maskStrokeLayer];
  [v10 setPath:v9];
}

- (CGRect)_platterFrame
{
  [(CAMSemanticStyleStatusIndicator *)self bounds];
  -[CAMSemanticStyleStatusIndicator alignmentRectForFrame:](self, "alignmentRectForFrame:");
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  result.size.CGFloat height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)CAMSemanticStyleStatusIndicator;
  [(CAMControlStatusIndicator *)&v54 layoutSubviews];
  [(CAMSemanticStyleStatusIndicator *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CAMSemanticStyleStatusIndicator *)self _stackSymbolView];
  -[CAMSemanticStyleStatusIndicator alignmentRectForFrame:](self, "alignmentRectForFrame:", v4, v6, v8, v10);
  UIRectGetCenter();
  double v13 = *MEMORY[0x263F00148];
  double v12 = *(double *)(MEMORY[0x263F00148] + 8);
  [v11 intrinsicContentSize];
  objc_msgSend(v11, "frameForAlignmentRect:", v13, v12, v14, v15);
  double v17 = v16;
  double v19 = v18;
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");
  objc_msgSend(v11, "setBounds:", v13, v12, v17, v19);
  [(CAMSemanticStyleStatusIndicator *)self _platterFrame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v28 = [(CAMSemanticStyleStatusIndicator *)self _platterView];
  CAMViewSetBoundsAndCenterForFrame(v28, v21, v23, v25, v27);

  UIRectGetCenter();
  double v30 = v29;
  double v32 = v31;
  v33 = [(CAMSemanticStyleStatusIndicator *)self _neutralPlatterLayer];
  objc_msgSend(v33, "setPosition:", v30, v32);

  v34 = [(CAMSemanticStyleStatusIndicator *)self _neutralPlatterLayer];
  objc_msgSend(v34, "setBounds:", v13, v12, v25, v27);

  v35 = [(CAMSemanticStyleStatusIndicator *)self _coolPlatterLayer];
  objc_msgSend(v35, "setPosition:", v30, v32);

  v36 = [(CAMSemanticStyleStatusIndicator *)self _coolPlatterLayer];
  objc_msgSend(v36, "setFrame:", v13, v12, v25, v27);

  v37 = [(CAMSemanticStyleStatusIndicator *)self _warmPlatterLayer];
  objc_msgSend(v37, "setPosition:", v30, v32);

  id v38 = [(CAMSemanticStyleStatusIndicator *)self _warmPlatterLayer];
  objc_msgSend(v38, "setBounds:", v13, v12, v25, v27);

  CATransform3D v39 = [(CAMSemanticStyleStatusIndicator *)self _platterMaskLayer];
  objc_msgSend(v39, "setPosition:", v30, v32);

  CATransform3D v40 = [(CAMSemanticStyleStatusIndicator *)self _platterMaskLayer];
  objc_msgSend(v40, "setBounds:", v13, v12, v25, v27);

  v41 = [(CAMSemanticStyleStatusIndicator *)self _maskBackgroundLayer];
  objc_msgSend(v41, "setPosition:", v30, v32);

  v42 = [(CAMSemanticStyleStatusIndicator *)self _maskBackgroundLayer];
  objc_msgSend(v42, "setBounds:", v13, v12, v25, v27);

  CATransform3D v43 = [(CAMSemanticStyleStatusIndicator *)self _maskStrokeLayer];
  objc_msgSend(v43, "setPosition:", v30, v32);

  CATransform3D v44 = [(CAMSemanticStyleStatusIndicator *)self _maskStrokeLayer];
  objc_msgSend(v44, "setBounds:", v13, v12, v25, v27);

  v45 = [(CAMSemanticStyleStatusIndicator *)self _maskTickReplicatorLayer];
  objc_msgSend(v45, "setPosition:", v30, v32);

  double v46 = [(CAMSemanticStyleStatusIndicator *)self _maskTickReplicatorLayer];
  objc_msgSend(v46, "setBounds:", v13, v12, v25, v27);

  double v47 = CAMPixelWidthForView(self) + 1.0;
  UIPointRoundToViewScale();
  double v49 = v48;
  double v51 = v50;
  double v52 = [(CAMSemanticStyleStatusIndicator *)self _maskSmallTickLayer];
  objc_msgSend(v52, "setFrame:", v49, v51, 1.0, v47);

  double v53 = [(CAMSemanticStyleStatusIndicator *)self _maskLargeTickLayer];
  objc_msgSend(v53, "setFrame:", v49, v51, 1.0, 2.0);

  [(CAMSemanticStyleStatusIndicator *)self _updateStrokePath];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CAMSemanticStyleStatusIndicator *)self _stackSymbolView];
  double v3 = [v2 image];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat height = v9;
  result.double width = v8;
  return result;
}

- (id)accessibilityIdentifier
{
  return @"StatusBarPhotographicStylesButton";
}

- (CAMSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (UIImageView)_stackSymbolView
{
  return self->__stackSymbolView;
}

- (UIView)_platterView
{
  return self->__platterView;
}

- (CALayer)_warmPlatterLayer
{
  return self->__warmPlatterLayer;
}

- (CALayer)_neutralPlatterLayer
{
  return self->__neutralPlatterLayer;
}

- (CALayer)_coolPlatterLayer
{
  return self->__coolPlatterLayer;
}

- (CALayer)_platterMaskLayer
{
  return self->__platterMaskLayer;
}

- (CAShapeLayer)_maskStrokeLayer
{
  return self->__maskStrokeLayer;
}

- (CALayer)_maskBackgroundLayer
{
  return self->__maskBackgroundLayer;
}

- (CALayer)_maskSmallTickLayer
{
  return self->__maskSmallTickLayer;
}

- (CALayer)_maskLargeTickLayer
{
  return self->__maskLargeTickLayer;
}

- (CAReplicatorLayer)_maskTickReplicatorLayer
{
  return self->__maskTickReplicatorLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__maskTickReplicatorLayer, 0);
  objc_storeStrong((id *)&self->__maskLargeTickLayer, 0);
  objc_storeStrong((id *)&self->__maskSmallTickLayer, 0);
  objc_storeStrong((id *)&self->__maskBackgroundLayer, 0);
  objc_storeStrong((id *)&self->__maskStrokeLayer, 0);
  objc_storeStrong((id *)&self->__platterMaskLayer, 0);
  objc_storeStrong((id *)&self->__coolPlatterLayer, 0);
  objc_storeStrong((id *)&self->__neutralPlatterLayer, 0);
  objc_storeStrong((id *)&self->__warmPlatterLayer, 0);
  objc_storeStrong((id *)&self->__platterView, 0);
  objc_storeStrong((id *)&self->__stackSymbolView, 0);
  objc_storeStrong((id *)&self->_semanticStyle, 0);
}

@end