@interface FMAnnotationView
+ (BOOL)_followsTerrain;
+ (void)preloadAssets;
+ (void)setImagePadding:(double)a3;
+ (void)setLargeAnnotationBorderVisible:(BOOL)a3;
+ (void)setShouldMaskLayer:(BOOL)a3;
+ (void)setThickAnnotationBorder:(BOOL)a3;
- (BOOL)hasPhotoImage;
- (BOOL)isDelayed;
- (BOOL)isShowingLargeSelectedAnnotation;
- (BOOL)shouldPreventLargeAnnotationState;
- (CALayer)largeCircleLayer;
- (CALayer)largePersonImageLayer;
- (CALayer)locationInnerLayer;
- (CALayer)locationOuterLayer;
- (CALayer)smallCircleLayer;
- (CALayer)smallPersonImageLayer;
- (CAShapeLayer)largeRingLayer;
- (CAShapeLayer)smallRingLayer;
- (FMAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (FMAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4 tintColor:(id)a5;
- (FMAnnotationView)initWithCoder:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_selectionWasUpdated:(BOOL)a3;
- (void)_setupSpringActions;
- (void)_transitionToNewSize:(BOOL)a3;
- (void)_updateAnnotationStyle;
- (void)addColorInvertFilterToLayer:(id)a3;
- (void)animateDelayedAnimation;
- (void)dealloc;
- (void)invertColorStatusDidChange:(id)a3;
- (void)prepareForReuse;
- (void)removeColorInvertFilterToLayer:(id)a3;
- (void)setAnnotation:(id)a3;
- (void)setHasPhotoImage:(BOOL)a3;
- (void)setIsDelayed:(BOOL)a3;
- (void)setIsShowingLargeSelectedAnnotation:(BOOL)a3;
- (void)setLargeCircleLayer:(id)a3;
- (void)setLargePersonImageLayer:(id)a3;
- (void)setLargeRingLayer:(id)a3;
- (void)setLocationInnerLayer:(id)a3;
- (void)setLocationOuterLayer:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 delay:(double)a5;
- (void)setShouldPreventLargeAnnotationState:(BOOL)a3;
- (void)setSmallCircleLayer:(id)a3;
- (void)setSmallPersonImageLayer:(id)a3;
- (void)setSmallRingLayer:(id)a3;
- (void)setTintColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateStyleForAnnotation:(id)a3;
@end

@implementation FMAnnotationView

+ (void)preloadAssets
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [MEMORY[0x263F1C6B0] imageNamed:@"annotation_circle_small" inBundle:v2 compatibleWithTraitCollection:0];
  v4 = [MEMORY[0x263F1C6B0] imageNamed:@"annotation_circle_large" inBundle:v2 compatibleWithTraitCollection:0];

  id v5 = [MEMORY[0x263F1C6B0] imageNamed:@"annotation_location_outer" inBundle:v2 compatibleWithTraitCollection:0];
}

+ (void)setImagePadding:(double)a3
{
  FMAnnotationViewImagePadding = *(void *)&a3;
}

+ (void)setLargeAnnotationBorderVisible:(BOOL)a3
{
  FMAnnotationViewLargeRingVisible = a3;
}

+ (void)setThickAnnotationBorder:(BOOL)a3
{
  FMThickAnnotationBorder = a3;
  FMAnnotationViewLargeRingPadding = 0x4014000000000000;
}

+ (void)setShouldMaskLayer:(BOOL)a3
{
  FMAnnotationViewShouldMaskLayer = a3;
}

- (FMAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v7 = (void *)MEMORY[0x263F08690];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 currentHandler];
  [v10 handleFailureInMethod:a2 object:self file:@"FMAnnotationView.m" lineNumber:213 description:@"Don't call this!"];

  v11 = [MEMORY[0x263F1C550] clearColor];
  v12 = [(FMAnnotationView *)self initWithAnnotation:v9 reuseIdentifier:v8 tintColor:v11];

  return v12;
}

- (FMAnnotationView)initWithCoder:(id)a3
{
  id v5 = (void *)MEMORY[0x263F08690];
  id v6 = a3;
  v7 = [v5 currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"FMAnnotationView.m" lineNumber:222 description:@"Don't call this!"];

  id v8 = [(FMAnnotationView *)self initWithCoder:v6];
  return v8;
}

- (FMAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4 tintColor:(id)a5
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v90.receiver = self;
  v90.super_class = (Class)FMAnnotationView;
  v10 = [(MKAnnotationView *)&v90 initWithAnnotation:v8 reuseIdentifier:a4];
  if (v10)
  {
    id v84 = v9;
    id v85 = v8;
    v11 = [MEMORY[0x263F1C920] mainScreen];
    [v11 scale];
    double v13 = v12;

    v14 = [MEMORY[0x263F157E8] layer];
    [(FMAnnotationView *)v10 setSmallCircleLayer:v14];

    v15 = [MEMORY[0x263F157E8] layer];
    [(FMAnnotationView *)v10 setLargeCircleLayer:v15];

    v16 = [MEMORY[0x263F157E8] layer];
    [(FMAnnotationView *)v10 setSmallPersonImageLayer:v16];

    v17 = [MEMORY[0x263F157E8] layer];
    [(FMAnnotationView *)v10 setLargePersonImageLayer:v17];

    v18 = [MEMORY[0x263F157E8] layer];
    [(FMAnnotationView *)v10 setLocationOuterLayer:v18];

    v19 = [MEMORY[0x263F157E8] layer];
    [(FMAnnotationView *)v10 setLocationInnerLayer:v19];

    v20 = [MEMORY[0x263F15880] layer];
    [(FMAnnotationView *)v10 setSmallRingLayer:v20];

    v21 = [MEMORY[0x263F15880] layer];
    [(FMAnnotationView *)v10 setLargeRingLayer:v21];

    v22 = [(FMAnnotationView *)v10 smallRingLayer];
    [v22 setShouldRasterize:1];

    v23 = [(FMAnnotationView *)v10 largeRingLayer];
    [v23 setShouldRasterize:1];

    v24 = [(FMAnnotationView *)v10 smallRingLayer];
    [v24 setRasterizationScale:v13];

    v25 = [(FMAnnotationView *)v10 largeRingLayer];
    [v25 setRasterizationScale:v13];

    v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 addObserver:v10 selector:sel_invertColorStatusDidChange_ name:*MEMORY[0x263F1CE10] object:0];

    [(FMAnnotationView *)v10 invertColorStatusDidChange:0];
    uint64_t v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v28 = [MEMORY[0x263F1C6B0] imageNamed:@"annotation_circle_small" inBundle:v27 compatibleWithTraitCollection:0];
    v29 = [MEMORY[0x263F1C6B0] imageNamed:@"annotation_circle_large" inBundle:v27 compatibleWithTraitCollection:0];
    v83 = (void *)v27;
    v30 = [MEMORY[0x263F1C6B0] imageNamed:@"annotation_location_outer" inBundle:v27 compatibleWithTraitCollection:0];
    id v31 = v28;
    -[CALayer setContents:](v10->_smallCircleLayer, "setContents:", [v31 CGImage]);
    id v32 = v29;
    -[CALayer setContents:](v10->_largeCircleLayer, "setContents:", [v32 CGImage]);
    id v33 = v30;
    -[CALayer setContents:](v10->_locationOuterLayer, "setContents:", [v33 CGImage]);
    id v34 = [MEMORY[0x263F1C550] clearColor];
    -[CAShapeLayer setFillColor:](v10->_smallRingLayer, "setFillColor:", [v34 CGColor]);

    id v35 = [MEMORY[0x263F1C550] clearColor];
    -[CAShapeLayer setFillColor:](v10->_largeRingLayer, "setFillColor:", [v35 CGColor]);

    double v36 = *MEMORY[0x263F00148];
    double v37 = *(double *)(MEMORY[0x263F00148] + 8);
    v82 = v31;
    [v31 size];
    -[CALayer setBounds:](v10->_smallCircleLayer, "setBounds:", v36, v37, v38, v39);
    [v32 size];
    -[CALayer setBounds:](v10->_largeCircleLayer, "setBounds:", v36, v37, v40, v41);
    -[CALayer setBounds:](v10->_smallPersonImageLayer, "setBounds:", *(double *)&FMAnnotationViewImagePadding * 0.5, *(double *)&FMAnnotationViewImagePadding * 0.5, 28.0 - *(double *)&FMAnnotationViewImagePadding * 0.5, 28.0 - *(double *)&FMAnnotationViewImagePadding * 0.5);
    -[CALayer setBounds:](v10->_largePersonImageLayer, "setBounds:", *(double *)&FMAnnotationViewImagePadding, *(double *)&FMAnnotationViewImagePadding, 72.0 - *(double *)&FMAnnotationViewImagePadding, 72.0 - *(double *)&FMAnnotationViewImagePadding);
    [(CALayer *)v10->_smallPersonImageLayer bounds];
    [(CALayer *)v10->_smallPersonImageLayer setCornerRadius:v42 * 0.5];
    [(CALayer *)v10->_largePersonImageLayer bounds];
    [(CALayer *)v10->_largePersonImageLayer setCornerRadius:v43 * 0.5];
    uint64_t v44 = FMAnnotationViewShouldMaskLayer;
    [(CALayer *)v10->_largePersonImageLayer setMasksToBounds:FMAnnotationViewShouldMaskLayer];
    [(CALayer *)v10->_smallPersonImageLayer setMasksToBounds:v44];
    v81 = v33;
    [v33 size];
    -[CALayer setBounds:](v10->_locationOuterLayer, "setBounds:", v36, v37, v45, v46);
    [(CALayer *)v10->_smallCircleLayer bounds];
    -[CAShapeLayer setBounds:](v10->_smallRingLayer, "setBounds:");
    [(CALayer *)v10->_largeCircleLayer bounds];
    -[CAShapeLayer setBounds:](v10->_largeRingLayer, "setBounds:");
    [(CALayer *)v10->_smallCircleLayer bounds];
    v94.size.width = v47 + -1.5;
    v94.size.height = v48 + -1.5;
    v94.origin.x = v49 + 0.75;
    v94.origin.y = v50 + 0.75;
    v51 = (void *)MEMORY[0x263F1C478];
    CGRect v95 = CGRectInset(v94, 14.0, 14.0);
    objc_msgSend(v51, "bezierPathWithOvalInRect:", v95.origin.x, v95.origin.y, v95.size.width, v95.size.height);
    id v52 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](v10->_smallRingLayer, "setPath:", [v52 CGPath]);

    [(CALayer *)v10->_largeCircleLayer bounds];
    v96.size.width = v53 - *(double *)&FMAnnotationViewLargeRingPadding;
    v96.size.height = v54 - *(double *)&FMAnnotationViewLargeRingPadding;
    v96.origin.x = v55 + *(double *)&FMAnnotationViewLargeRingPadding * 0.5;
    v96.origin.y = v56 + *(double *)&FMAnnotationViewLargeRingPadding * 0.5;
    v57 = (void *)MEMORY[0x263F1C478];
    CGRect v97 = CGRectInset(v96, 25.0, 25.0);
    objc_msgSend(v57, "bezierPathWithOvalInRect:", v97.origin.x, v97.origin.y, v97.size.width, v97.size.height);
    id v58 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](v10->_largeRingLayer, "setPath:", [v58 CGPath]);

    -[MKAnnotationView setBounds:](v10, "setBounds:", 0.0, 0.0, 30.0, 30.0);
    double v59 = 1.0;
    if (FMThickAnnotationBorder) {
      double v59 = 1.5;
    }
    [(CAShapeLayer *)v10->_smallRingLayer setLineWidth:v59];
    double v60 = 3.0;
    if (!FMThickAnnotationBorder) {
      double v60 = 1.5;
    }
    [(CAShapeLayer *)v10->_largeRingLayer setLineWidth:v60];
    -[CALayer setAnchorPoint:](v10->_largeCircleLayer, "setAnchorPoint:", 0.5, 0.915);
    v61 = [(FMAnnotationView *)v10 layer];
    [v61 addSublayer:v10->_locationOuterLayer];

    [(CALayer *)v10->_locationOuterLayer addSublayer:v10->_locationInnerLayer];
    v62 = [(FMAnnotationView *)v10 layer];
    [v62 addSublayer:v10->_smallCircleLayer];

    [(CALayer *)v10->_smallCircleLayer addSublayer:v10->_smallPersonImageLayer];
    [(CALayer *)v10->_smallCircleLayer addSublayer:v10->_smallRingLayer];
    v63 = [(FMAnnotationView *)v10 layer];
    [v63 addSublayer:v10->_largeCircleLayer];

    [(CALayer *)v10->_largeCircleLayer addSublayer:v10->_largePersonImageLayer];
    [(CALayer *)v10->_largeCircleLayer addSublayer:v10->_largeRingLayer];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v91[0] = v10->_smallCircleLayer;
    v91[1] = v10->_largeCircleLayer;
    v91[2] = v10->_locationOuterLayer;
    v91[3] = v10->_locationInnerLayer;
    v91[4] = v10->_smallPersonImageLayer;
    v91[5] = v10->_largePersonImageLayer;
    v91[6] = v10->_smallRingLayer;
    v91[7] = v10->_largeRingLayer;
    v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:8];
    uint64_t v65 = [v64 countByEnumeratingWithState:&v86 objects:v92 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v87;
      do
      {
        for (uint64_t i = 0; i != v66; ++i)
        {
          if (*(void *)v87 != v67) {
            objc_enumerationMutation(v64);
          }
          v69 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          v70 = [v69 superlayer];
          [v70 bounds];
          CGFloat v72 = v71;
          CGFloat v74 = v73;
          CGFloat v76 = v75;
          CGFloat v78 = v77;

          v98.origin.x = v72;
          v98.origin.y = v74;
          v98.size.width = v76;
          v98.size.height = v78;
          double MidX = CGRectGetMidX(v98);
          v99.origin.x = v72;
          v99.origin.y = v74;
          v99.size.width = v76;
          v99.size.height = v78;
          objc_msgSend(v69, "setPosition:", MidX, CGRectGetMidY(v99));
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v86 objects:v92 count:16];
      }
      while (v66);
    }

    id v9 = v84;
    [(FMAnnotationView *)v10 setTintColor:v84];
    id v8 = v85;
    [(FMAnnotationView *)v10 updateStyleForAnnotation:v85];
    [(FMAnnotationView *)v10 _setupSpringActions];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FMAnnotationView;
  [(MKAnnotationView *)&v4 dealloc];
}

- (void)traitCollectionDidChange:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)FMAnnotationView;
  [(FMAnnotationView *)&v25 traitCollectionDidChange:a3];
  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [MEMORY[0x263F1C6B0] imageNamed:@"annotation_location_inner" inBundle:v4 compatibleWithTraitCollection:0];
  id v6 = [(FMAnnotationView *)self tintColor];
  v7 = [v5 tintedImageWithColor:v6];

  id v8 = [MEMORY[0x263F1C6B0] imageNamed:@"annotation_location_outer" inBundle:v4 compatibleWithTraitCollection:0];
  id v9 = [MEMORY[0x263F1C6B0] imageNamed:@"annotation_circle_small" inBundle:v4 compatibleWithTraitCollection:0];
  v10 = [MEMORY[0x263F1C6B0] imageNamed:@"annotation_circle_large" inBundle:v4 compatibleWithTraitCollection:0];
  id v11 = v7;
  -[CALayer setContents:](self->_locationInnerLayer, "setContents:", [v11 CGImage]);
  double v12 = *MEMORY[0x263F00148];
  double v13 = *(double *)(MEMORY[0x263F00148] + 8);
  [v11 size];
  -[CALayer setBounds:](self->_locationInnerLayer, "setBounds:", v12, v13, v14, v15);
  id v16 = v9;
  -[CALayer setContents:](self->_smallCircleLayer, "setContents:", [v16 CGImage]);
  id v17 = v10;
  -[CALayer setContents:](self->_largeCircleLayer, "setContents:", [v17 CGImage]);
  id v18 = v8;
  -[CALayer setContents:](self->_locationOuterLayer, "setContents:", [v18 CGImage]);
  v19 = [(MKAnnotationView *)self annotation];
  v20 = [v19 smallAnnotationIcon];

  v21 = [(MKAnnotationView *)self annotation];
  v22 = [v21 largeAnnotationIcon];

  id v23 = v20;
  -[CALayer setContents:](self->_smallPersonImageLayer, "setContents:", [v23 CGImage]);
  id v24 = v22;
  -[CALayer setContents:](self->_largePersonImageLayer, "setContents:", [v24 CGImage]);
}

- (void)prepareForReuse
{
  [(FMAnnotationView *)self setIsDelayed:0];
  [(FMAnnotationView *)self setHasPhotoImage:0];
  v3 = [(FMAnnotationView *)self smallPersonImageLayer];
  [v3 setContents:0];

  objc_super v4 = [(FMAnnotationView *)self largePersonImageLayer];
  [v4 setContents:0];

  [(FMAnnotationView *)self setSelected:0 animated:0];
}

- (void)updateStyleForAnnotation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(FMAnnotationView *)self tintColor];
    id v6 = [v4 tintColor];
    if (!v6 || ([v5 isEqual:v6] & 1) == 0) {
      [(FMAnnotationView *)self setTintColor:v6];
    }
    v7 = (void *)MEMORY[0x263F1CB60];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __45__FMAnnotationView_updateStyleForAnnotation___block_invoke;
    id v11 = &unk_2643350A0;
    double v12 = self;
    id v13 = v4;
    [v7 performWithoutAnimation:&v8];
    [(FMAnnotationView *)self _updateAnnotationStyle];
  }
}

void __45__FMAnnotationView_updateStyleForAnnotation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) smallAnnotationIcon];
  uint64_t v3 = [v2 CGImage];
  id v4 = [*(id *)(a1 + 32) smallPersonImageLayer];
  [v4 setContents:v3];

  id v5 = [*(id *)(a1 + 40) largeAnnotationIcon];
  uint64_t v6 = [v5 CGImage];
  v7 = [*(id *)(a1 + 32) largePersonImageLayer];
  [v7 setContents:v6];

  id v8 = [*(id *)(a1 + 40) smallAnnotationIcon];
  objc_msgSend(*(id *)(a1 + 32), "setHasPhotoImage:", objc_msgSend(v8, "CGImage") != 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 delay:(double)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v9 = LogCategory_Unspecified();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    BOOL v12 = v7;
    __int16 v13 = 1024;
    BOOL v14 = v6;
    __int16 v15 = 2048;
    double v16 = a5;
    _os_log_impl(&dword_218714000, v9, OS_LOG_TYPE_DEFAULT, "FMAnnotationView: setSelected: %d, animated: %d delay: %f", buf, 0x18u);
  }

  v10.receiver = self;
  v10.super_class = (Class)FMAnnotationView;
  [(MKAnnotationView *)&v10 setSelected:v7 animated:v6];
  [(FMAnnotationView *)self setIsDelayed:1];
  [(FMAnnotationView *)self performSelector:sel_animateDelayedAnimation withObject:0 afterDelay:a5];
}

- (void)animateDelayedAnimation
{
  if ([(FMAnnotationView *)self isDelayed])
  {
    [(FMAnnotationView *)self setIsDelayed:0];
    [(FMAnnotationView *)self _selectionWasUpdated:1];
  }
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FMAnnotationView;
  [(FMAnnotationView *)&v21 setTintColor:v4];
  id v5 = (void *)MEMORY[0x263F1C6B0];
  BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v7 = [v5 imageNamed:@"annotation_location_inner" inBundle:v6 compatibleWithTraitCollection:0];

  id v8 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__FMAnnotationView_setTintColor___block_invoke;
  block[3] = &unk_2643351A8;
  id v18 = v7;
  id v19 = v4;
  v20 = self;
  id v9 = v4;
  id v10 = v7;
  dispatch_async(v8, block);

  id v11 = v9;
  uint64_t v12 = [v11 CGColor];
  __int16 v13 = [(FMAnnotationView *)self smallRingLayer];
  [v13 setStrokeColor:v12];

  id v14 = v11;
  uint64_t v15 = [v14 CGColor];
  double v16 = [(FMAnnotationView *)self largeRingLayer];
  [v16 setStrokeColor:v15];
}

void __33__FMAnnotationView_setTintColor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tintedImageWithColor:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__FMAnnotationView_setTintColor___block_invoke_2;
  v4[3] = &unk_2643350A0;
  v4[4] = *(void *)(a1 + 48);
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __33__FMAnnotationView_setTintColor___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) CGImage];
  id v3 = [*(id *)(a1 + 32) locationInnerLayer];
  [v3 setContents:v2];

  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  [*(id *)(a1 + 40) size];
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 32) locationInnerLayer];
  objc_msgSend(v10, "setBounds:", v4, v5, v7, v9);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v7 = LogCategory_Unspecified();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    BOOL v10 = v5;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_218714000, v7, OS_LOG_TYPE_DEFAULT, "FMAnnotationView: setSelected: %d, animated: %d", buf, 0xEu);
  }

  v8.receiver = self;
  v8.super_class = (Class)FMAnnotationView;
  [(MKAnnotationView *)&v8 setSelected:v5 animated:v4];
  [(FMAnnotationView *)self _selectionWasUpdated:v4];
}

- (void)_selectionWasUpdated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = [(FMAnnotationView *)self isShowingLargeSelectedAnnotation];
    __int16 v7 = 1024;
    BOOL v8 = [(MKAnnotationView *)self isSelected];
    _os_log_impl(&dword_218714000, v5, OS_LOG_TYPE_DEFAULT, "FMAnnotationView: _selectionWasUpdated isShowingLargeAnotation: %d, isSelected: %d", (uint8_t *)v6, 0xEu);
  }

  if ([(FMAnnotationView *)self isShowingLargeSelectedAnnotation]
    && ![(MKAnnotationView *)self isSelected]
    || ![(FMAnnotationView *)self isShowingLargeSelectedAnnotation]
    && [(MKAnnotationView *)self isSelected])
  {
    [(FMAnnotationView *)self _transitionToNewSize:v3];
  }
}

- (void)_transitionToNewSize:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_218714000, v5, OS_LOG_TYPE_DEFAULT, "FMAnnotationView: _transitionToNewSize delayed?: %d", (uint8_t *)v9, 8u);
  }

  if (![(FMAnnotationView *)self isDelayed])
  {
    [(FMAnnotationView *)self _setupSpringActions];
    [MEMORY[0x263F158F8] begin];
    if (!v3)
    {
      double v6 = [(FMAnnotationView *)self smallCircleLayer];
      [v6 removeAllAnimations];

      __int16 v7 = [(FMAnnotationView *)self locationOuterLayer];
      [v7 removeAllAnimations];

      BOOL v8 = [(FMAnnotationView *)self largeCircleLayer];
      [v8 removeAllAnimations];

      [MEMORY[0x263F158F8] setDisableActions:1];
    }
    [(FMAnnotationView *)self _updateAnnotationStyle];
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)_updateAnnotationStyle
{
  if ([(MKAnnotationView *)self isSelected])
  {
    BOOL v3 = [(FMAnnotationView *)self shouldPreventLargeAnnotationState];
    int v4 = !v3;
    if (v3) {
      float v5 = 1.0;
    }
    else {
      float v5 = 0.0;
    }
  }
  else
  {
    int v4 = 0;
    float v5 = 1.0;
  }
  double v6 = [(FMAnnotationView *)self smallCircleLayer];
  *(float *)&double v7 = v5;
  [v6 setOpacity:v7];

  BOOL v8 = [(FMAnnotationView *)self largeCircleLayer];
  uint64_t v9 = v8;
  double v10 = 0.0;
  if (v4)
  {
    *(float *)&double v10 = 1.0;
    double v11 = 0.100000001;
  }
  else
  {
    double v11 = 1.0;
  }
  if (v4) {
    double v12 = 1.0;
  }
  else {
    double v12 = 0.100000001;
  }
  [v8 setOpacity:v10];

  CATransform3DMakeScale(&v42, v11, v11, 1.0);
  uint64_t v13 = [(FMAnnotationView *)self smallCircleLayer];
  CATransform3D v41 = v42;
  [v13 setTransform:&v41];

  CATransform3DMakeScale(&v40, v12, v12, 1.0);
  id v14 = [(FMAnnotationView *)self locationOuterLayer];
  CATransform3D v39 = v40;
  [v14 setTransform:&v39];

  uint64_t v15 = [(MKAnnotationView *)self annotation];
  if ([v15 isThisDevice])
  {
    BOOL v16 = +[FMMapView hasUserLocation];

    if (v16)
    {
      uint64_t v17 = [(FMAnnotationView *)self smallRingLayer];
      [v17 setOpacity:0.0];
      id v18 = [(FMAnnotationView *)self locationOuterLayer];
      [v18 setOpacity:0.0];
      id v19 = [(FMAnnotationView *)self smallCircleLayer];
      [v19 setOpacity:0.0];

LABEL_19:
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v17 = [(FMAnnotationView *)self locationOuterLayer];
  float v20 = 1.0;
  LODWORD(v21) = 1.0;
  [v17 setOpacity:v21];

  int v22 = FMAnnotationViewLargeRingVisible;
  if (!FMAnnotationViewLargeRingVisible)
  {
    uint64_t v17 = [(MKAnnotationView *)self annotation];
    float v20 = (float)[v17 isBorderEnabled];
  }
  id v23 = [(FMAnnotationView *)self smallRingLayer];
  *(float *)&double v24 = v20;
  [v23 setOpacity:v24];

  if (!v22) {
    goto LABEL_19;
  }
LABEL_20:
  int v25 = FMAnnotationViewLargeRingVisible;
  if (FMAnnotationViewLargeRingVisible)
  {
    float v26 = 1.0;
  }
  else
  {
    uint64_t v17 = [(MKAnnotationView *)self annotation];
    float v26 = (float)[v17 isBorderEnabled];
  }
  uint64_t v27 = [(FMAnnotationView *)self largeRingLayer];
  *(float *)&double v28 = v26;
  [v27 setOpacity:v28];

  if (!v25) {
  int v29 = FMAnnotationViewLargeRingVisible;
  }
  if (FMAnnotationViewLargeRingVisible)
  {
    float v30 = 1.0;
  }
  else
  {
    uint64_t v17 = [(MKAnnotationView *)self annotation];
    float v30 = (float)[v17 isBorderEnabled];
  }
  id v31 = [(FMAnnotationView *)self smallRingLayer];
  *(float *)&double v32 = v30;
  [v31 setOpacity:v32];

  if (!v29) {
  double v33 = -5.0;
  }
  if (!v4) {
    double v33 = 15.0;
  }
  CATransform3DMakeTranslation(&v37, 0.0, v33, 0.0);
  CATransform3DScale(&v38, &v37, v12, v12, 1.0);
  id v34 = [(FMAnnotationView *)self largeCircleLayer];
  CATransform3D v36 = v38;
  [v34 setTransform:&v36];

  if ([(MKAnnotationView *)self isSelected]) {
    uint64_t v35 = [(FMAnnotationView *)self shouldPreventLargeAnnotationState] ^ 1;
  }
  else {
    uint64_t v35 = 0;
  }
  [(FMAnnotationView *)self setIsShowingLargeSelectedAnnotation:v35];
  [(FMAnnotationView *)self invertColorStatusDidChange:0];
}

- (void)_setupSpringActions
{
  v35[1] = *MEMORY[0x263EF8340];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __parametersOfSpringAnimation_block_invoke;
  v33[3] = &__block_descriptor_40_e8_d16__0d8l;
  v33[4] = 0x3FEC4780E0000000;
  id v34 = @"transform";
  BOOL v3 = (void *)MEMORY[0x21D470BC0](v33, a2);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __parametersOfSpringAnimation_block_invoke_2;
  v30[3] = &unk_264335340;
  long long v32 = xmmword_21872F450;
  id v31 = v3;
  id v4 = v3;
  float v5 = (void *)MEMORY[0x21D470BC0](v30);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __parametersOfSpringAnimation_block_invoke_3;
  v27[3] = &unk_264335340;
  long long v29 = xmmword_21872F460;
  id v6 = v5;
  id v28 = v6;
  double v7 = (double (**)(void, double))MEMORY[0x21D470BC0](v27);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  double v21 = __parametersOfSpringAnimation_block_invoke_4;
  int v22 = &unk_264335368;
  id v23 = v6;
  long long v24 = xmmword_21872F470;
  long long v25 = xmmword_21872F480;
  uint64_t v26 = 0x3FEC4780E0000000;
  id v8 = v6;
  uint64_t v9 = (double (**)(void, double))MEMORY[0x21D470BC0](&v19);

  int v10 = 12;
  double v11 = 7.8369906;
  do
  {
    double v12 = v7[2](v7, v11);
    double v11 = v11 - v12 / v9[2](v9, v11);
    --v10;
  }
  while (v10);
  double v13 = v11 * v11;
  double v14 = sqrt(v13);
  double v15 = (v14 + v14) * 0.468;

  BOOL v16 = objc_msgSend(MEMORY[0x263F15890], "animation", v19, v20, v21, v22);
  [v16 setMass:1.0];
  [v16 setVelocity:1.0];
  [v16 setStiffness:v13];
  [v16 setDamping:v15];
  uint64_t v17 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
  [v16 setTimingFunction:v17];

  [v16 setDuration:0.638];
  v35[0] = v16;
  id v18 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
  [(CALayer *)self->_largeCircleLayer setActions:v18];
}

- (void)setAnnotation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FMAnnotationView;
  id v4 = a3;
  [(MKAnnotationView *)&v5 setAnnotation:v4];
  -[FMAnnotationView updateStyleForAnnotation:](self, "updateStyleForAnnotation:", v4, v5.receiver, v5.super_class);
}

+ (BOOL)_followsTerrain
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (![(FMAnnotationView *)self isShowingLargeSelectedAnnotation])
  {
    v20.receiver = self;
    v20.super_class = (Class)FMAnnotationView;
    -[MKAnnotationView hitTest:withEvent:](&v20, sel_hitTest_withEvent_, v7, x, y);
    uint64_t v17 = (FMAnnotationView *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v8 = [(FMAnnotationView *)self largeCircleLayer];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  if (sqrt((y - (v12 + v16 * 0.5)) * (y - (v12 + v16 * 0.5)) + (x - (v10 + v14 * 0.5)) * (x - (v10 + v14 * 0.5))) < 36.0)
  {
    uint64_t v17 = self;
LABEL_5:
    id v18 = v17;
    goto LABEL_7;
  }
  id v18 = 0;
LABEL_7:

  return v18;
}

- (void)addColorInvertFilterToLayer:(id)a3
{
  id v10 = a3;
  BOOL v3 = [v10 filters];

  if (!v3
    || ([v10 filters],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 indexOfObjectPassingTest:&__block_literal_global_3],
        v4,
        v5 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v6 = [v10 filters];
    if (v6)
    {
      id v7 = [v10 filters];
      id v8 = (void *)[v7 mutableCopy];
    }
    else
    {
      id v8 = [MEMORY[0x263EFF980] array];
    }

    double v9 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B30]];
    [v9 setName:@"FMColorInvertFilter"];
    [v8 addObject:v9];
    [v10 setFilters:v8];
  }
}

uint64_t __48__FMAnnotationView_addColorInvertFilterToLayer___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 name];
  uint64_t v6 = [v5 isEqualToString:@"FMColorInvertFilter"];

  if (v6) {
    *a4 = 1;
  }
  return v6;
}

- (void)removeColorInvertFilterToLayer:(id)a3
{
  id v8 = a3;
  BOOL v3 = [v8 filters];

  if (v3)
  {
    id v4 = [v8 filters];
    uint64_t v5 = [v4 indexOfObjectPassingTest:&__block_literal_global_55];

    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [v8 filters];
      id v7 = (void *)[v6 mutableCopy];

      [v7 removeObjectAtIndex:v5];
      [v8 setFilters:v7];
    }
  }
}

uint64_t __51__FMAnnotationView_removeColorInvertFilterToLayer___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 name];
  uint64_t v6 = [v5 isEqualToString:@"FMColorInvertFilter"];

  if (v6) {
    *a4 = 1;
  }
  return v6;
}

- (void)invertColorStatusDidChange:(id)a3
{
  if (UIAccessibilityIsInvertColorsEnabled()
    && ([(MKAnnotationView *)self annotation],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isBorderEnabled],
        v4,
        (v5 & 1) == 0))
  {
    id v8 = [(FMAnnotationView *)self smallPersonImageLayer];
    [(FMAnnotationView *)self addColorInvertFilterToLayer:v8];

    id v7 = [(FMAnnotationView *)self largePersonImageLayer];
    [(FMAnnotationView *)self addColorInvertFilterToLayer:v7];
  }
  else
  {
    uint64_t v6 = [(FMAnnotationView *)self smallPersonImageLayer];
    [(FMAnnotationView *)self removeColorInvertFilterToLayer:v6];

    id v7 = [(FMAnnotationView *)self largePersonImageLayer];
    [(FMAnnotationView *)self removeColorInvertFilterToLayer:v7];
  }

  [(FMAnnotationView *)self setNeedsDisplay];
}

- (BOOL)shouldPreventLargeAnnotationState
{
  return self->_shouldPreventLargeAnnotationState;
}

- (void)setShouldPreventLargeAnnotationState:(BOOL)a3
{
  self->_shouldPreventLargeAnnotationState = a3;
}

- (BOOL)isDelayed
{
  return self->_isDelayed;
}

- (void)setIsDelayed:(BOOL)a3
{
  self->_isDelayed = a3;
}

- (CAShapeLayer)smallRingLayer
{
  return self->_smallRingLayer;
}

- (void)setSmallRingLayer:(id)a3
{
}

- (CAShapeLayer)largeRingLayer
{
  return self->_largeRingLayer;
}

- (void)setLargeRingLayer:(id)a3
{
}

- (CALayer)smallCircleLayer
{
  return self->_smallCircleLayer;
}

- (void)setSmallCircleLayer:(id)a3
{
}

- (CALayer)largeCircleLayer
{
  return self->_largeCircleLayer;
}

- (void)setLargeCircleLayer:(id)a3
{
}

- (CALayer)locationOuterLayer
{
  return self->_locationOuterLayer;
}

- (void)setLocationOuterLayer:(id)a3
{
}

- (CALayer)locationInnerLayer
{
  return self->_locationInnerLayer;
}

- (void)setLocationInnerLayer:(id)a3
{
}

- (CALayer)smallPersonImageLayer
{
  return self->_smallPersonImageLayer;
}

- (void)setSmallPersonImageLayer:(id)a3
{
}

- (CALayer)largePersonImageLayer
{
  return self->_largePersonImageLayer;
}

- (void)setLargePersonImageLayer:(id)a3
{
}

- (BOOL)isShowingLargeSelectedAnnotation
{
  return self->_isShowingLargeSelectedAnnotation;
}

- (void)setIsShowingLargeSelectedAnnotation:(BOOL)a3
{
  self->_isShowingLargeSelectedAnnotation = a3;
}

- (BOOL)hasPhotoImage
{
  return self->_hasPhotoImage;
}

- (void)setHasPhotoImage:(BOOL)a3
{
  self->_hasPhotoImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largePersonImageLayer, 0);
  objc_storeStrong((id *)&self->_smallPersonImageLayer, 0);
  objc_storeStrong((id *)&self->_locationInnerLayer, 0);
  objc_storeStrong((id *)&self->_locationOuterLayer, 0);
  objc_storeStrong((id *)&self->_largeCircleLayer, 0);
  objc_storeStrong((id *)&self->_smallCircleLayer, 0);
  objc_storeStrong((id *)&self->_largeRingLayer, 0);
  objc_storeStrong((id *)&self->_smallRingLayer, 0);
}

@end