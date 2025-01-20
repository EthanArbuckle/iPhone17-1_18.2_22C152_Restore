@interface CAMZoomDial
+ (CGPoint)_pointForOffsetAngle:(double)a3 dialCenter:(CGPoint)a4 radius:(double)a5;
+ (double)_normalizedValueForZoomFactor:(double)a3 min:(double)a4 max:(double)a5;
+ (double)_offsetAngleForZoomFactor:(double)a3 relativeToCurrentZoomFactor:(BOOL)a4 currentZoomFactor:(double)a5 min:(double)a6 max:(double)a7 signedAngleDeltaForZoomRange:(double)a8;
+ (id)_createBackgroundImageForBounds:(CGRect)a3 dialCenter:(CGPoint)a4 radius:(double)a5 backgroundAlpha:(double)a6 borderStrokeWidth:(double)a7;
+ (id)_createMaskImageWithSize:(CGSize)a3 tickLabelCenterRadialInset:(double)a4 notchMaskImage:(id)a5;
+ (id)_createTicksImageForBounds:(CGRect)a3 dialCenter:(CGPoint)a4 radius:(double)a5 pixelWidth:(double)a6 zoomFactors:(id)a7 minAvailableZoomFactor:(double)a8 maxAvailableZoomFactor:(double)a9 signedAngleDeltaForZoomRange:(double)a10;
- (BOOL)_isBackgroundViewUpdateNeeded;
- (BOOL)_isDotsUpdateNeeded;
- (BOOL)_isLabelsUpdateNeeded;
- (BOOL)_isMaskUpdateNeeded;
- (BOOL)_isTicksUpdateNeeded;
- (BOOL)_useDots;
- (BOOL)_useTicks;
- (BOOL)hideFocalLengthLabels;
- (BOOL)hideLabels;
- (BOOL)isExpanded;
- (CAMZoomDial)initWithStyle:(int64_t)a3;
- (CAMZoomDialDotsView)_activeDots;
- (CAMZoomDialDotsView)_inactiveDots;
- (CGPoint)_dotCenterForOffsetAngle:(double)a3 assumeExpanded:(BOOL)a4;
- (CGPoint)_dotCenterForZoomFactor:(double)a3 assumeExpanded:(BOOL)a4 relativeToCurrentZoomFactor:(BOOL)a5;
- (CGPoint)_pointForOffsetAngle:(double)a3 radialInset:(double)a4 assumeExpanded:(BOOL)a5;
- (CGPoint)_textCenterForOffsetAngle:(double)a3 assumeExpanded:(BOOL)a4;
- (CGPoint)_tickEndpointForOffsetAngle:(double)a3 isTop:(BOOL)a4;
- (CGPoint)dialCenter;
- (CGPoint)textCenterForZoomFactor:(double)a3 assumeExpanded:(BOOL)a4;
- (NSArray)_focalLengthLabelsLandscape;
- (NSArray)_focalLengthLabelsPortrait;
- (NSArray)_labels;
- (NSArray)activeZoomFactorLabels;
- (NSArray)zoomFactors;
- (NSArray)zoomPoints;
- (OS_dispatch_queue)_imageGenerationQueue;
- (UIImageView)_backgroundView;
- (UIImageView)_contentMaskView;
- (UIImageView)_ticksView;
- (UIView)_contentContainerView;
- (UIView)_focalLengthLabelContainerView;
- (UIView)_labelContainerView;
- (UIView)_needleView;
- (double)_backgroundAlpha;
- (double)_borderStrokeWidth;
- (double)_focalLengthInsetLandscape;
- (double)_focalLengthInsetPortrait;
- (double)_fullRadius;
- (double)_labelPaddingForContentSizeCategory;
- (double)_labelRotationAngleForOrientation;
- (double)_offsetAngleForZoomFactor:(double)a3 relativeToCurrentZoomFactor:(BOOL)a4;
- (double)_offsetAngleForZoomPoint:(id)a3;
- (double)_radiusDelta;
- (double)_signedAngleDeltaForZoomRange;
- (double)_tickLabelCenterRadialInset;
- (double)angleDeltaForZoomRange;
- (double)contentMaskingHeight;
- (double)contractionDistance;
- (double)dialBorderWidth;
- (double)dotCenterInset;
- (double)maxAvailableZoomFactor;
- (double)maximumZoomFactor;
- (double)minAvailableZoomFactor;
- (double)minimumZoomFactor;
- (double)normalizedValueForZoomFactor:(double)a3;
- (double)offsetAngleForPoint:(CGPoint)a3;
- (double)offsetAngleForZoomFactor:(double)a3;
- (double)zoomFactor;
- (double)zoomFactorForNormalizedValue:(double)a3;
- (double)zoomFactorForOffsetAngle:(double)a3;
- (id)_createDotImage;
- (id)_zoomPointIndexesForPrioritizedFocalLengthLabels;
- (int64_t)_backgroundImageJobIdentifier;
- (int64_t)_maskImageJobIdentifier;
- (int64_t)_ticksImageJobIdentifier;
- (int64_t)orientation;
- (int64_t)style;
- (void)_commonCAMZoomDialInitialization;
- (void)_invalidateImagesForViewSize;
- (void)_layoutBackgroundAndContainerWithContentInset:(double)a3;
- (void)_layoutSubviewsWithDots;
- (void)_layoutSubviewsWithTicks;
- (void)_setBackgroundImageJobIdentifier:(int64_t)a3;
- (void)_setBackgroundViewUpdateNeeded:(BOOL)a3;
- (void)_setDotsUpdateNeeded:(BOOL)a3;
- (void)_setFocalLengthLabelsLandscape:(id)a3;
- (void)_setFocalLengthLabelsPortrait:(id)a3;
- (void)_setLabels:(id)a3;
- (void)_setLabelsUpdateNeeded:(BOOL)a3;
- (void)_setMaskImageJobIdentifier:(int64_t)a3;
- (void)_setMaskUpdateNeeded:(BOOL)a3;
- (void)_setTicksImageJobIdentifier:(int64_t)a3;
- (void)_setTicksUpdateNeeded:(BOOL)a3;
- (void)_updateBackroundImageViewIfNeeded;
- (void)_updateContentIfNeeded;
- (void)_updateDots;
- (void)_updateFocalLengthLabelAlphas;
- (void)_updateFocalLengthLabels;
- (void)_updateLabels;
- (void)_updateLabelsIfNeeded;
- (void)_updateMaskImageIfNeeded;
- (void)_updateMinimizedLabels;
- (void)_updatePortraitFocalLengthLabelAlphas;
- (void)_updateTicksImageIfNeeded;
- (void)layoutSubviews;
- (void)setAngleDeltaForZoomRange:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentMaskingHeight:(double)a3;
- (void)setContractionDistance:(double)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHideFocalLengthLabels:(BOOL)a3;
- (void)setHideLabels:(BOOL)a3;
- (void)setMaxAvailableZoomFactor:(double)a3;
- (void)setMinAvailableZoomFactor:(double)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setZoomFactor:(double)a3;
- (void)setZoomPoints:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMZoomDial

- (CAMZoomDial)initWithStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMZoomDial;
  v4 = -[CAMZoomDial initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    [(CAMZoomDial *)v4 _commonCAMZoomDialInitialization];
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMZoomDialInitialization
{
  [(CAMZoomDial *)self setSemanticContentAttribute:3];
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.camera.zoom-dial-image-generation", v3);
  imageGenerationQueue = self->__imageGenerationQueue;
  self->__imageGenerationQueue = v4;

  zoomFactors = self->_zoomFactors;
  self->_zoomFactors = (NSArray *)&unk_26BDE0388;

  v7 = [(NSArray *)self->_zoomFactors firstObject];
  [v7 doubleValue];
  self->_minAvailableZoomFactor = v8;

  v9 = [(NSArray *)self->_zoomFactors lastObject];
  [v9 doubleValue];
  self->_maxAvailableZoomFactor = v10;

  self->_zoomFactor = self->_minAvailableZoomFactor;
  self->_angleDeltaForZoomRange = 1.57079633;
  self->_expanded = 1;
  self->__backgroundViewUpdateNeeded = 1;
  self->__labelsUpdateNeeded = 1;
  self->__dotsUpdateNeeded = [(CAMZoomDial *)self _useDots];
  self->__ticksUpdateNeeded = [(CAMZoomDial *)self _useTicks];
  self->__maskUpdateNeeded = [(CAMZoomDial *)self _useTicks];
  id v11 = objc_alloc(MEMORY[0x263F82828]);
  double v12 = *MEMORY[0x263F001A8];
  double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
  v16 = (UIImageView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x263F001A8], v13, v14, v15);
  backgroundView = self->__backgroundView;
  self->__backgroundView = v16;

  [(CAMZoomDial *)self addSubview:self->__backgroundView];
  v18 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v12, v13, v14, v15);
  contentContainerView = self->__contentContainerView;
  self->__contentContainerView = v18;

  [(CAMZoomDial *)self addSubview:self->__contentContainerView];
  if ([(CAMZoomDial *)self _useTicks])
  {
    v20 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v12, v13, v14, v15);
    labelContainerView = self->__labelContainerView;
    self->__labelContainerView = v20;

    [(UIView *)self->__contentContainerView addSubview:self->__labelContainerView];
    v22 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v12, v13, v14, v15);
    focalLengthLabelContainerView = self->__focalLengthLabelContainerView;
    self->__focalLengthLabelContainerView = v22;

    [(UIView *)self->__labelContainerView addSubview:self->__focalLengthLabelContainerView];
  }
  if ([(CAMZoomDial *)self _useDots])
  {
    v24 = [(CAMZoomDial *)self _createDotImage];
    v25 = [[CAMZoomDialDotsView alloc] initWithDotImage:v24];
    activeDots = self->__activeDots;
    self->__activeDots = v25;

    [(UIView *)self->__contentContainerView addSubview:self->__activeDots];
    v27 = [[CAMZoomDialDotsView alloc] initWithDotImage:v24];
    inactiveDots = self->__inactiveDots;
    self->__inactiveDots = v27;

    [(CAMZoomDialDotsView *)self->__inactiveDots setAlpha:0.35];
    [(UIView *)self->__contentContainerView addSubview:self->__inactiveDots];
  }
  if ([(CAMZoomDial *)self _useTicks])
  {
    v29 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v12, v13, v14, v15);
    ticksView = self->__ticksView;
    self->__ticksView = v29;

    [(UIView *)self->__contentContainerView addSubview:self->__ticksView];
    v31 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:0];
    contentMaskView = self->__contentMaskView;
    self->__contentMaskView = v31;

    [(UIView *)self->__contentContainerView setMaskView:self->__contentMaskView];
    v33 = [MEMORY[0x263F824C0] bezierPath];
    double v34 = *MEMORY[0x263F00148];
    double v35 = *(double *)(MEMORY[0x263F00148] + 8);
    objc_msgSend(v33, "moveToPoint:", *MEMORY[0x263F00148], v35);
    objc_msgSend(v33, "addLineToPoint:", 4.0, 0.0);
    objc_msgSend(v33, "addLineToPoint:", 2.0, 10.0);
    objc_msgSend(v33, "addLineToPoint:", v34, v35);
    id v36 = objc_alloc_init(MEMORY[0x263F15880]);
    id v41 = v33;
    objc_msgSend(v36, "setPath:", objc_msgSend(v41, "CGPath"));
    id v37 = [MEMORY[0x263F825C8] systemYellowColor];
    objc_msgSend(v36, "setFillColor:", objc_msgSend(v37, "CGColor"));

    v38 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v12, v13, v14, v15);
    needleView = self->__needleView;
    self->__needleView = v38;

    v40 = [(UIView *)self->__needleView layer];
    [v40 addSublayer:v36];

    [(CAMZoomDial *)self addSubview:self->__needleView];
  }
}

- (BOOL)_useDots
{
  return [(CAMZoomDial *)self style] == 0;
}

- (BOOL)_useTicks
{
  return [(CAMZoomDial *)self style] != 0;
}

- (double)minimumZoomFactor
{
  v2 = [(CAMZoomDial *)self zoomFactors];
  v3 = [v2 firstObject];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)maximumZoomFactor
{
  v2 = [(CAMZoomDial *)self zoomFactors];
  v3 = [v2 lastObject];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setZoomPoints:(id)a3
{
  id v8 = a3;
  if (!-[NSArray isEqualToArray:](self->_zoomPoints, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_zoomPoints, a3);
    double v5 = +[CAMZoomPoint displayZoomFactorsFromZoomPoints:v8];
    zoomFactors = self->_zoomFactors;
    self->_zoomFactors = v5;

    [(CAMZoomDial *)self minimumZoomFactor];
    [(CAMZoomDial *)self maximumZoomFactor];
    CEKClamp();
    self->_zoomFactor = v7;
    [(CAMZoomDial *)self _setLabelsUpdateNeeded:1];
    [(CAMZoomDial *)self _setDotsUpdateNeeded:[(CAMZoomDial *)self _useDots]];
    [(CAMZoomDial *)self _setTicksUpdateNeeded:[(CAMZoomDial *)self _useTicks]];
    [(CAMZoomDial *)self setNeedsLayout];
  }
}

- (void)setMinAvailableZoomFactor:(double)a3
{
  if (self->_minAvailableZoomFactor != a3)
  {
    self->_minAvailableZoomFactor = a3;
    [(CAMZoomDial *)self _setLabelsUpdateNeeded:1];
    [(CAMZoomDial *)self _setDotsUpdateNeeded:[(CAMZoomDial *)self _useDots]];
    [(CAMZoomDial *)self _setTicksUpdateNeeded:[(CAMZoomDial *)self _useTicks]];
    [(CAMZoomDial *)self setNeedsLayout];
  }
}

- (void)setMaxAvailableZoomFactor:(double)a3
{
  if (self->_maxAvailableZoomFactor != a3)
  {
    self->_maxAvailableZoomFactor = a3;
    [(CAMZoomDial *)self _setLabelsUpdateNeeded:1];
    [(CAMZoomDial *)self _setTicksUpdateNeeded:[(CAMZoomDial *)self _useTicks]];
    [(CAMZoomDial *)self setNeedsLayout];
  }
}

- (void)setZoomFactor:(double)a3
{
  [(CAMZoomDial *)self minimumZoomFactor];
  [(CAMZoomDial *)self minAvailableZoomFactor];
  [(CAMZoomDial *)self maximumZoomFactor];
  [(CAMZoomDial *)self maxAvailableZoomFactor];
  CEKClamp();
  if (self->_zoomFactor != v4)
  {
    self->_zoomFactor = v4;
    if ((unint64_t)([(CAMZoomDial *)self orientation] - 3) >= 2) {
      [(CAMZoomDial *)self _updatePortraitFocalLengthLabelAlphas];
    }
    [(CAMZoomDial *)self setNeedsLayout];
  }
}

- (double)normalizedValueForZoomFactor:(double)a3
{
  double v5 = objc_opt_class();
  [(CAMZoomDial *)self minimumZoomFactor];
  double v7 = v6;
  [(CAMZoomDial *)self maximumZoomFactor];
  [v5 _normalizedValueForZoomFactor:a3 min:v7 max:v8];
  return result;
}

+ (double)_normalizedValueForZoomFactor:(double)a3 min:(double)a4 max:(double)a5
{
  CEKClamp();
  double v8 = v7;
  double result = 0.0;
  if (a5 != a4)
  {
    double v10 = log(v8 / a4);
    return v10 / log(a5 / a4);
  }
  return result;
}

- (double)zoomFactorForNormalizedValue:(double)a3
{
  [(CAMZoomDial *)self minimumZoomFactor];
  double v5 = v4;
  [(CAMZoomDial *)self maximumZoomFactor];
  double v7 = v6;
  CEKClamp();
  return v5 * pow(v7 / v5, v8);
}

- (void)setContentMaskingHeight:(double)a3
{
  if (self->_contentMaskingHeight != a3)
  {
    self->_contentMaskingHeight = a3;
    if ([(CAMZoomDial *)self _useTicks]) {
      [(CAMZoomDial *)self _setMaskUpdateNeeded:1];
    }
    [(CAMZoomDial *)self setNeedsLayout];
  }
}

- (void)setContractionDistance:(double)a3
{
  if (self->_contractionDistance != a3)
  {
    self->_contractionDistance = a3;
    [(CAMZoomDial *)self setNeedsLayout];
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    [(CAMZoomDial *)self setNeedsLayout];
  }
}

- (double)_radiusDelta
{
  BOOL v3 = [(CAMZoomDial *)self isExpanded];
  double result = 0.0;
  if (!v3)
  {
    [(CAMZoomDial *)self contractionDistance];
    return -v5;
  }
  return result;
}

- (void)_updateLabelsIfNeeded
{
  if ([(CAMZoomDial *)self _isLabelsUpdateNeeded])
  {
    [(CAMZoomDial *)self _setLabelsUpdateNeeded:0];
    [(CAMZoomDial *)self _updateLabels];
    [(CAMZoomDial *)self _updateFocalLengthLabels];
  }
}

- (void)_updateContentIfNeeded
{
  [(CAMZoomDial *)self _updateLabelsIfNeeded];
  if ([(CAMZoomDial *)self _isDotsUpdateNeeded])
  {
    [(CAMZoomDial *)self _updateDots];
    [(CAMZoomDial *)self _setDotsUpdateNeeded:0];
  }
  [(CAMZoomDial *)self _updateTicksImageIfNeeded];
  [(CAMZoomDial *)self _updateMaskImageIfNeeded];
}

- (void)_updateLabels
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  [(CAMZoomDial *)self minimumZoomFactor];
  double v35 = v3;
  [(CAMZoomDial *)self maximumZoomFactor];
  double v5 = v4;
  [(CAMZoomDial *)self minAvailableZoomFactor];
  double v36 = v6;
  [(CAMZoomDial *)self maxAvailableZoomFactor];
  double v8 = v7;
  BOOL v9 = [(CAMZoomDial *)self _useDots];
  double v10 = [(CAMZoomDial *)self zoomFactors];
  if (v8 != v5)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v11 = [(CAMZoomDial *)self zoomFactors];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v42;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * v15) doubleValue];
        if (vabdd_f64(v16, v8) < 0.01) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
          if (v13) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      id v11 = [(CAMZoomDial *)self zoomFactors];
      v17 = [NSNumber numberWithDouble:v8];
      uint64_t v18 = [v11 arrayByAddingObject:v17];

      double v10 = (void *)v18;
    }
  }
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v20 = v10;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    double v24 = *MEMORY[0x263F001A8];
    double v25 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v26 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v27 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v34 = 0.01;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "doubleValue", *(void *)&v34);
        double v30 = v29;
        if (v9)
        {
          BOOL v31 = v29 == v5 || v29 == v35;
          if (v31 || v36 == v35)
          {
            if (!v31) {
              continue;
            }
          }
          else if (vabdd_f64(v29, v36) >= v34)
          {
            continue;
          }
        }
        if (v9 && v29 < v36 + -0.01) {
          double v32 = 0.35;
        }
        else {
          double v32 = 1.0;
        }
        v33 = -[CAMZoomFactorLabel initWithFrame:]([CAMZoomFactorLabel alloc], "initWithFrame:", v24, v25, v26, v27);
        [(CAMZoomFactorLabel *)v33 setPreferDefaultSizing:[(CAMZoomDial *)self _useDots]];
        [(CAMZoomFactorLabel *)v33 setShowZoomFactorSymbol:v9];
        [(CAMZoomFactorLabel *)v33 setZoomFactor:v30];
        [(CAMZoomFactorLabel *)v33 setAlpha:v32];
        [v19 addObject:v33];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v22);
  }

  [(CAMZoomDial *)self _setLabels:v19];
  [(CAMZoomDial *)self _updateMinimizedLabels];
}

- (void)_updateMinimizedLabels
{
  double v3 = [(CAMZoomDial *)self zoomPoints];
  double v4 = [(CAMZoomDial *)self _labels];
  if (![(CAMZoomDial *)self _useDots])
  {
    unint64_t v5 = [v4 count];
    if (v5 >= [v3 count])
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __37__CAMZoomDial__updateMinimizedLabels__block_invoke;
      v6[3] = &unk_263FA49C0;
      id v7 = v4;
      [v3 enumerateObjectsUsingBlock:v6];
    }
  }
}

void __37__CAMZoomDial__updateMinimizedLabels__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 isCustomLens];
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v6 setMinimized:v5];
}

- (void)_updateFocalLengthLabels
{
  if ([(CAMZoomDial *)self _useTicks])
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v5 = [(CAMZoomDial *)self zoomPoints];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    double v10 = __39__CAMZoomDial__updateFocalLengthLabels__block_invoke;
    id v11 = &unk_263FA49E8;
    id v12 = v3;
    id v13 = v4;
    id v6 = v4;
    id v7 = v3;
    [v5 enumerateObjectsUsingBlock:&v8];
    -[CAMZoomDial _setFocalLengthLabelsPortrait:](self, "_setFocalLengthLabelsPortrait:", v7, v8, v9, v10, v11);
    [(CAMZoomDial *)self _setFocalLengthLabelsLandscape:v6];
    [(CAMZoomDial *)self _updateFocalLengthLabelAlphas];
  }
}

void __39__CAMZoomDial__updateFocalLengthLabels__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 displayFocalLength];
  if ((uint64_t)v6
    && (objc_msgSend(NSString, "stringWithFormat:", @"%ldmm", (uint64_t)v6),
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v19 = (id)v7;
    uint64_t v8 = [NSString stringWithFormat:@"%@-landscape", v7];
    uint64_t v9 = (void *)MEMORY[0x263F827E8];
    double v10 = CAMCameraUIFrameworkBundle();
    id v11 = [v9 imageNamed:v19 inBundle:v10];

    id v12 = (void *)MEMORY[0x263F827E8];
    id v13 = CAMCameraUIFrameworkBundle();
    uint64_t v14 = [v12 imageNamed:v8 inBundle:v13];

    uint64_t v15 = [v11 imageWithRenderingMode:2];

    double v16 = [v14 imageWithRenderingMode:2];

    v17 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v15];
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v16];
    [*(id *)(a1 + 32) addObject:v17];
    [*(id *)(a1 + 40) addObject:v18];
  }
  else
  {
    *a4 = 1;
  }
}

- (void)_updateDots
{
  if ([(CAMZoomDial *)self _useDots])
  {
    id v25 = [(CAMZoomDial *)self _activeDots];
    id v3 = [(CAMZoomDial *)self _inactiveDots];
    int v4 = [(CAMZoomDial *)self _shouldReverseLayoutDirection];
    [(CAMZoomDial *)self minimumZoomFactor];
    double v6 = v5;
    [(CAMZoomDial *)self maximumZoomFactor];
    double v8 = v7;
    [(CAMZoomDial *)self minAvailableZoomFactor];
    double v10 = v9;
    BOOL v11 = v9 == v6;
    [(CAMZoomDial *)self _offsetAngleForZoomFactor:0 relativeToCurrentZoomFactor:v6];
    double v13 = v12;
    [(CAMZoomDial *)self _offsetAngleForZoomFactor:0 relativeToCurrentZoomFactor:v8];
    double v15 = v14;
    [(CAMZoomDial *)self _offsetAngleForZoomFactor:0 relativeToCurrentZoomFactor:v10];
    double v17 = v16;
    double v18 = 0.0436332313;
    if (v4) {
      double v18 = -0.0436332313;
    }
    double v19 = (v15 - v13) / v18;
    double v20 = (v15 - v13) / (double)(uint64_t)round(v19);
    [v25 setDotSpacingAngle:v20];
    [v3 setDotSpacingAngle:v20];
    [v3 setHidden:v11];
    unint64_t v21 = llround(v19);
    if (v10 == v6)
    {
      uint64_t v22 = v21 - 3;
      uint64_t v23 = v25;
    }
    else
    {
      unint64_t v24 = llround((v15 - v17) / v20);
      [v25 setDotCount:v24 - 3];
      uint64_t v22 = v21 - v24 - 3;
      uint64_t v23 = v3;
    }
    [v23 setDotCount:v22];
  }
}

- (void)_setLabels:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  double v5 = (NSArray *)a3;
  labels = self->__labels;
  if (labels != v5)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v7 = labels;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->__labels, a3);
    double v12 = [(CAMZoomDial *)self _labelContainerView];
    double v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(CAMZoomDial *)self _contentContainerView];
    }
    double v15 = v14;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v16 = v5;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(v15, "addSubview:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v18);
    }
  }
}

- (void)_setFocalLengthLabelsPortrait:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  double v5 = (NSArray *)a3;
  focalLengthLabelsPortrait = self->__focalLengthLabelsPortrait;
  if (focalLengthLabelsPortrait != v5)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v7 = focalLengthLabelsPortrait;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->__focalLengthLabelsPortrait, a3);
    double v12 = [(CAMZoomDial *)self _focalLengthLabelContainerView];
    double v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(CAMZoomDial *)self _contentContainerView];
    }
    double v15 = v14;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v16 = v5;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(v15, "addSubview:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v18);
    }
  }
}

- (void)_setFocalLengthLabelsLandscape:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  double v5 = (NSArray *)a3;
  focalLengthLabelsLandscape = self->__focalLengthLabelsLandscape;
  if (focalLengthLabelsLandscape != v5)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v7 = focalLengthLabelsLandscape;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->__focalLengthLabelsLandscape, a3);
    double v12 = [(CAMZoomDial *)self _focalLengthLabelContainerView];
    double v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(CAMZoomDial *)self _contentContainerView];
    }
    double v15 = v14;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v16 = v5;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(v15, "addSubview:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v18);
    }
  }
}

- (void)_updateFocalLengthLabelAlphas
{
  BOOL v3 = (unint64_t)([(CAMZoomDial *)self orientation] - 3) < 2;
  int v4 = [(CAMZoomDial *)self _focalLengthLabelsLandscape];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__CAMZoomDial__updateFocalLengthLabelAlphas__block_invoke;
  v5[3] = &__block_descriptor_33_e28_v32__0__UIImageView_8Q16_B24l;
  BOOL v6 = v3;
  [v4 enumerateObjectsUsingBlock:v5];

  [(CAMZoomDial *)self _updatePortraitFocalLengthLabelAlphas];
}

uint64_t __44__CAMZoomDial__updateFocalLengthLabelAlphas__block_invoke(uint64_t a1, void *a2)
{
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 32)) {
    double v2 = 0.0;
  }
  return [a2 setAlpha:v2];
}

- (void)_updatePortraitFocalLengthLabelAlphas
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  [(CAMZoomDial *)self _updateLabelsIfNeeded];
  BOOL v3 = [(CAMZoomDial *)self _focalLengthLabelsPortrait];
  if ((unint64_t)([(CAMZoomDial *)self orientation] - 3) > 1)
  {
    uint64_t v9 = [(CAMZoomDial *)self zoomPoints];
    uint64_t v10 = [(CAMZoomDial *)self _zoomPointIndexesForPrioritizedFocalLengthLabels];
    if ([v9 count])
    {
      unint64_t v11 = 0;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      double v13 = 1.79769313e308;
      double v14 = 1.79769313e308;
      do
      {
        double v15 = [v9 objectAtIndexedSubscript:v11];
        [(CAMZoomDial *)self _offsetAngleForZoomPoint:v15];
        double v17 = v16;
        if (v11)
        {
          uint64_t v18 = [v9 objectAtIndexedSubscript:v11 - 1];
          [(CAMZoomDial *)self _offsetAngleForZoomPoint:v18];
          double v20 = vabdd_f64(v17, v19);
          if (v20 < v13) {
            double v13 = v20;
          }
        }
        char v21 = [v10 containsIndex:v11];
        double v22 = fabs(v17);
        double v23 = fabs(v14);
        BOOL v24 = v22 < v23;
        if (v22 < v23) {
          double v25 = v17;
        }
        else {
          double v25 = v14;
        }
        if (v24) {
          uint64_t v26 = v11;
        }
        else {
          uint64_t v26 = v12;
        }
        if ((v21 & 1) == 0)
        {
          double v14 = v25;
          uint64_t v12 = v26;
        }

        ++v11;
      }
      while (v11 < [v9 count]);
    }
    else
    {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      double v14 = 1.79769313e308;
      double v13 = 1.79769313e308;
    }
    aBlock[1] = 3221225472;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[2] = __52__CAMZoomDial__updatePortraitFocalLengthLabelAlphas__block_invoke;
    aBlock[3] = &unk_263FA4A30;
    id v4 = v9;
    id v35 = v4;
    double v36 = self;
    double v37 = v13 / 1.5;
    long long v27 = (double (**)(void *, uint64_t, double))_Block_copy(aBlock);
    if ([v3 count])
    {
      unint64_t v28 = 0;
      do
      {
        double v29 = [v3 objectAtIndexedSubscript:v28];
        if ([v10 containsIndex:v28])
        {
          double v30 = [v4 objectAtIndexedSubscript:v28];
          [(CAMZoomDial *)self _offsetAngleForZoomPoint:v30];
          double v32 = vabdd_f64(v31, v14);
          double v33 = 1.0;
          if (v32 < 0.2) {
            double v33 = 1.0 - v27[2](v27, v12, 1.0);
          }
          [v29 setAlpha:v33];
        }
        else
        {
          ((void (*)(double (**)(void *, uint64_t, double), unint64_t))v27[2])(v27, v28);
          objc_msgSend(v29, "setAlpha:");
        }

        ++v28;
      }
      while (v28 < [v3 count]);
    }
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v39 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * i) setAlpha:0.0];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v6);
    }
  }
}

double __52__CAMZoomDial__updatePortraitFocalLengthLabelAlphas__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [*(id *)(a1 + 40) _offsetAngleForZoomPoint:v3];
  CEKProgressClamped();
  double v5 = v4;

  return v5;
}

- (id)_zoomPointIndexesForPrioritizedFocalLengthLabels
{
  BOOL v3 = +[CAMCaptureCapabilities capabilities];
  double v4 = [(CAMZoomDial *)self zoomPoints];
  double v5 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v4, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__CAMZoomDial__zoomPointIndexesForPrioritizedFocalLengthLabels__block_invoke;
  v11[3] = &unk_263FA49E8;
  id v6 = v5;
  id v12 = v6;
  double v13 = v3;
  id v7 = v3;
  [v4 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

void __63__CAMZoomDial__zoomPointIndexesForPrioritizedFocalLengthLabels__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (([v8 isCustomLens] & 1) != 0
    || [*(id *)(a1 + 40) isQuadraWideSupported]
    && ([v8 displayZoomFactor],
        double v6 = v5,
        [*(id *)(a1 + 40) quadraWideDisplayZoomFactor],
        v6 == v7))
  {
    [*(id *)(a1 + 32) removeIndex:a3];
  }
}

- (void)setHideLabels:(BOOL)a3
{
  if (self->_hideLabels != a3)
  {
    self->_hideLabels = a3;
    if (a3) {
      double v3 = 0.0;
    }
    else {
      double v3 = 1.0;
    }
    id v4 = [(CAMZoomDial *)self _labelContainerView];
    [v4 setAlpha:v3];
  }
}

- (void)setHideFocalLengthLabels:(BOOL)a3
{
  if (self->_hideFocalLengthLabels != a3)
  {
    self->_hideFocalLengthLabels = a3;
    if (a3) {
      double v3 = 0.0;
    }
    else {
      double v3 = 1.0;
    }
    id v4 = [(CAMZoomDial *)self _focalLengthLabelContainerView];
    [v4 setAlpha:v3];
  }
}

- (NSArray)activeZoomFactorLabels
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(CAMZoomDial *)self hideLabels])
  {
    double v3 = 0;
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFF980];
    double v5 = [(CAMZoomDial *)self _labels];
    double v3 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v6 = [(CAMZoomDial *)self _labels];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          unint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v11 alpha];
          if (v12 == 1.0) {
            [v3 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  return (NSArray *)v3;
}

- (double)_fullRadius
{
  [(CAMZoomDial *)self bounds];
  double v4 = v3 * 0.5;
  [(CAMZoomDial *)self _fullRadiusInset];
  return v4 - v5;
}

- (CGPoint)dialCenter
{
  [(CAMZoomDial *)self bounds];
  UIRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)dotCenterInset
{
  [(CAMZoomDial *)self _fullRadiusInset];
  return v2 + 32.0;
}

- (double)dialBorderWidth
{
  [(CAMZoomDial *)self _borderStrokeWidth];
  UICeilToViewScale();
  return result;
}

- (double)_borderStrokeWidth
{
  BOOL v2 = [(CAMZoomDial *)self _useDots];
  double result = 0.0;
  if (v2) {
    return 0.5;
  }
  return result;
}

- (double)_backgroundAlpha
{
  BOOL v2 = [(CAMZoomDial *)self _useDots];
  double result = 0.1;
  if (!v2) {
    return 0.5;
  }
  return result;
}

- (double)_labelPaddingForContentSizeCategory
{
  BOOL v3 = [(CAMZoomDial *)self _useDots];
  double result = 0.0;
  if (!v3)
  {
    double v5 = [(CAMZoomDial *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    +[CAMZoomButton fontSizeForContentSize:v6];
    double v8 = v7;
    +[CAMZoomButton fontSizeForContentSize:*MEMORY[0x263F83468]];
    double v10 = v8 - v9;

    return v10 * 3.0;
  }
  return result;
}

- (double)_tickLabelCenterRadialInset
{
  [(CAMZoomDial *)self _labelPaddingForContentSizeCategory];
  UICeilToViewScale();
  return result;
}

- (double)_focalLengthInsetPortrait
{
  [(CAMZoomDial *)self _tickLabelCenterRadialInset];
  [(CAMZoomDial *)self _labelPaddingForContentSizeCategory];
  UICeilToViewScale();
  return result;
}

- (double)_focalLengthInsetLandscape
{
  [(CAMZoomDial *)self _focalLengthInsetPortrait];
  UICeilToViewScale();
  return result;
}

- (double)_signedAngleDeltaForZoomRange
{
  int v3 = [(CAMZoomDial *)self _shouldReverseLayoutDirection];
  [(CAMZoomDial *)self angleDeltaForZoomRange];
  if (v3) {
    return -result;
  }
  return result;
}

- (double)_offsetAngleForZoomPoint:(id)a3
{
  [a3 displayZoomFactor];
  -[CAMZoomDial offsetAngleForZoomFactor:](self, "offsetAngleForZoomFactor:");
  return result;
}

- (double)offsetAngleForZoomFactor:(double)a3
{
  [(CAMZoomDial *)self _offsetAngleForZoomFactor:1 relativeToCurrentZoomFactor:a3];
  return result;
}

- (double)_offsetAngleForZoomFactor:(double)a3 relativeToCurrentZoomFactor:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = objc_opt_class();
  [(CAMZoomDial *)self zoomFactor];
  double v9 = v8;
  [(CAMZoomDial *)self minimumZoomFactor];
  double v11 = v10;
  [(CAMZoomDial *)self maximumZoomFactor];
  double v13 = v12;
  [(CAMZoomDial *)self _signedAngleDeltaForZoomRange];
  [v7 _offsetAngleForZoomFactor:v4 relativeToCurrentZoomFactor:a3 currentZoomFactor:v9 min:v11 max:v13 signedAngleDeltaForZoomRange:v14];
  return result;
}

+ (double)_offsetAngleForZoomFactor:(double)a3 relativeToCurrentZoomFactor:(BOOL)a4 currentZoomFactor:(double)a5 min:(double)a6 max:(double)a7 signedAngleDeltaForZoomRange:(double)a8
{
  BOOL v12 = a4;
  [a1 _normalizedValueForZoomFactor:a3 min:a6 max:a7];
  double v15 = v14;
  if (v12)
  {
    [a1 _normalizedValueForZoomFactor:a5 min:a6 max:a7];
    double v15 = v15 - v16;
  }
  double result = v15 * a8;
  if (v15 * a8 >= -3.14159265)
  {
    if (result <= 3.14159265) {
      return result;
    }
    double v18 = -6.28318531;
  }
  else
  {
    double v18 = 6.28318531;
  }
  return result + v18;
}

- (double)zoomFactorForOffsetAngle:(double)a3
{
  if (a3 == 0.0)
  {
    [(CAMZoomDial *)self zoomFactor];
  }
  else
  {
    [(CAMZoomDial *)self zoomFactor];
    double v6 = v5;
    [(CAMZoomDial *)self _signedAngleDeltaForZoomRange];
    [(CAMZoomDial *)self normalizedValueForZoomFactor:v6];
    CEKClamp();
    -[CAMZoomDial zoomFactorForNormalizedValue:](self, "zoomFactorForNormalizedValue:");
  }
  return result;
}

- (double)offsetAngleForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CAMZoomDial *)self dialCenter];
  double result = atan2(y - v6, x - v5) + 1.57079633;
  if (result > 3.14159265) {
    return result + -6.28318531;
  }
  return result;
}

- (CGPoint)_pointForOffsetAngle:(double)a3 radialInset:(double)a4 assumeExpanded:(BOOL)a5
{
  double v8 = 0.0;
  if (!a5)
  {
    [(CAMZoomDial *)self _radiusDelta];
    double v8 = v9;
  }
  [(CAMZoomDial *)self _fullRadius];
  double v11 = v8 + v10 - a4;
  BOOL v12 = objc_opt_class();
  [(CAMZoomDial *)self dialCenter];
  objc_msgSend(v12, "_pointForOffsetAngle:dialCenter:radius:", a3, v13, v14, v11);
  result.double y = v16;
  result.double x = v15;
  return result;
}

+ (CGPoint)_pointForOffsetAngle:(double)a3 dialCenter:(CGPoint)a4 radius:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  __double2 v8 = __sincos_stret(a3 + -1.57079633);
  double v9 = y + a5 * v8.__sinval;
  double v10 = x + a5 * v8.__cosval;
  result.double y = v9;
  result.double x = v10;
  return result;
}

- (CGPoint)_dotCenterForZoomFactor:(double)a3 assumeExpanded:(BOOL)a4 relativeToCurrentZoomFactor:(BOOL)a5
{
  BOOL v5 = a4;
  [(CAMZoomDial *)self _offsetAngleForZoomFactor:a5 relativeToCurrentZoomFactor:a3];
  -[CAMZoomDial _dotCenterForOffsetAngle:assumeExpanded:](self, "_dotCenterForOffsetAngle:assumeExpanded:", v5);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)_dotCenterForOffsetAngle:(double)a3 assumeExpanded:(BOOL)a4
{
  [(CAMZoomDial *)self _pointForOffsetAngle:a4 radialInset:a3 assumeExpanded:32.0];
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGPoint)_tickEndpointForOffsetAngle:(double)a3 isTop:(BOOL)a4
{
  double v4 = 20.6666667;
  if (a4) {
    double v4 = 4.0;
  }
  [(CAMZoomDial *)self _pointForOffsetAngle:1 radialInset:a3 assumeExpanded:v4];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)textCenterForZoomFactor:(double)a3 assumeExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  [(CAMZoomDial *)self _offsetAngleForZoomFactor:1 relativeToCurrentZoomFactor:a3];
  -[CAMZoomDial _textCenterForOffsetAngle:assumeExpanded:](self, "_textCenterForOffsetAngle:assumeExpanded:", v4);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)_textCenterForOffsetAngle:(double)a3 assumeExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v7 = [(CAMZoomDial *)self style];
  if (v7 == 1)
  {
    [(CAMZoomDial *)self _tickLabelCenterRadialInset];
    [(CAMZoomDial *)self _pointForOffsetAngle:v4 radialInset:a3 assumeExpanded:v10];
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
    if (!v7) {
      -[CAMZoomDial _dotCenterForOffsetAngle:assumeExpanded:](self, "_dotCenterForOffsetAngle:assumeExpanded:", v4, a3, 0.0);
    }
  }
  result.double y = v8;
  result.double x = v9;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CAMZoomDial *)self bounds];
  if (v9 != width || v8 != height) {
    [(CAMZoomDial *)self _invalidateImagesForViewSize];
  }
  v11.receiver = self;
  v11.super_class = (Class)CAMZoomDial;
  -[CAMZoomDial setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CAMZoomDial *)self frame];
  if (v9 != width || v8 != height) {
    [(CAMZoomDial *)self _invalidateImagesForViewSize];
  }
  v11.receiver = self;
  v11.super_class = (Class)CAMZoomDial;
  -[CAMZoomDial setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)_invalidateImagesForViewSize
{
  [(CAMZoomDial *)self _setBackgroundViewUpdateNeeded:1];
  [(CAMZoomDial *)self _setTicksUpdateNeeded:[(CAMZoomDial *)self _useTicks]];
  BOOL v3 = [(CAMZoomDial *)self _useTicks];
  [(CAMZoomDial *)self _setMaskUpdateNeeded:v3];
}

- (void)_setBackgroundViewUpdateNeeded:(BOOL)a3
{
  self->__backgroundViewUpdateNeeded = a3;
  if (a3) {
    [(CAMZoomDial *)self setNeedsLayout];
  }
}

- (void)_setTicksUpdateNeeded:(BOOL)a3
{
  self->__ticksUpdateNeeded = a3;
  if (a3) {
    [(CAMZoomDial *)self setNeedsLayout];
  }
}

- (void)_setMaskUpdateNeeded:(BOOL)a3
{
  self->__maskUpdateNeeded = a3;
  if (a3) {
    [(CAMZoomDial *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CAMZoomDial;
  [(CAMZoomDial *)&v3 layoutSubviews];
  [(CAMZoomDial *)self _updateBackroundImageViewIfNeeded];
  [(CAMZoomDial *)self _updateContentIfNeeded];
  if ([(CAMZoomDial *)self _useDots]) {
    [(CAMZoomDial *)self _layoutSubviewsWithDots];
  }
  else {
    [(CAMZoomDial *)self _layoutSubviewsWithTicks];
  }
}

- (void)_layoutBackgroundAndContainerWithContentInset:(double)a3
{
  BOOL v4 = [(CAMZoomDial *)self _backgroundView];
  double v5 = [(CAMZoomDial *)self _contentContainerView];
  double v6 = [(CAMZoomDial *)self _labelContainerView];
  int64_t v7 = [(CAMZoomDial *)self _focalLengthLabelContainerView];
  [(CAMZoomDial *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  UIRectGetCenter();
  double v17 = v16;
  double v19 = v18;
  [(CAMZoomDial *)self _fullRadius];
  double v21 = v20;
  [(CAMZoomDial *)self _radiusDelta];
  double v23 = v22;
  [(CAMZoomDial *)self minimumZoomFactor];
  double v28 = v24;
  long long v25 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v34.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v34.c = v25;
  *(_OWORD *)&v34.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v33.a = *(_OWORD *)&v34.a;
  *(_OWORD *)&v33.c = v25;
  *(_OWORD *)&v33.tdouble x = *(_OWORD *)&v34.tx;
  if (v21 > 0.0)
  {
    CGAffineTransformMakeScale(&v34, (v21 + v23) / v21, (v21 + v23) / v21);
    CGAffineTransformMakeScale(&v33, (v21 - a3 + v23) / (v21 - a3), (v21 - a3 + v23) / (v21 - a3));
  }
  objc_msgSend(v4, "setCenter:", v17, v19);
  objc_msgSend(v4, "setBounds:", v9, v11, v13, v15);
  CGAffineTransform v32 = v34;
  [v4 setTransform:&v32];
  [(CAMZoomDial *)self _offsetAngleForZoomFactor:1 relativeToCurrentZoomFactor:v28];
  memset(&v32, 0, sizeof(v32));
  CGAffineTransformMakeRotation(&v32, v26);
  CGAffineTransform t1 = v32;
  memset(&v31, 0, sizeof(v31));
  CGAffineTransform t2 = v33;
  CGAffineTransformConcat(&v31, &t1, &t2);
  objc_msgSend(v5, "setCenter:", v17, v19);
  objc_msgSend(v5, "setBounds:", v9, v11, v13, v15);
  CGAffineTransform t1 = v31;
  [v5 setTransform:&t1];
  objc_msgSend(v6, "setCenter:", v17, v19);
  objc_msgSend(v6, "setBounds:", v9, v11, v13, v15);
  objc_msgSend(v7, "setCenter:", v17, v19);
  objc_msgSend(v7, "setBounds:", v9, v11, v13, v15);
}

- (void)_layoutSubviewsWithDots
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  objc_super v3 = [(CAMZoomDial *)self _activeDots];
  BOOL v4 = [(CAMZoomDial *)self _inactiveDots];
  [(CAMZoomDial *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v49 = v10;
  double v50 = v9;
  UIRectGetCenter();
  double v47 = v12;
  double v48 = v11;
  [(CAMZoomDial *)self minimumZoomFactor];
  double v14 = v13;
  [(CAMZoomDial *)self minAvailableZoomFactor];
  double v16 = v15;
  [v3 dotSpacingAngle];
  double v18 = v17;
  [(CAMZoomDial *)self _layoutBackgroundAndContainerWithContentInset:32.0];
  [(CAMZoomDial *)self _dotCenterForZoomFactor:1 assumeExpanded:0 relativeToCurrentZoomFactor:v14];
  double v20 = v19;
  double v22 = v21;
  [(CAMZoomDial *)self _offsetAngleForZoomFactor:0 relativeToCurrentZoomFactor:v14];
  double v24 = v23;
  [(CAMZoomDial *)self _offsetAngleForZoomFactor:0 relativeToCurrentZoomFactor:v16];
  double v26 = v25;
  if (v25 != v24) {
    double v26 = v24 + (double)(uint64_t)round((v25 - v24) / v18) * v18;
  }
  memset(&v60, 0, sizeof(v60));
  CGAffineTransformMakeRotation(&v60, v26 + v18 * 2.0);
  memset(&v59, 0, sizeof(v59));
  CGAffineTransformMakeRotation(&v59, v24 + v18 * 2.0);
  objc_msgSend(v3, "setDotCenter:", v20, v22);
  objc_msgSend(v3, "setBounds:", v50, v49, v6, v8);
  objc_msgSend(v3, "setCenter:", v48, v47);
  CGAffineTransform v58 = v60;
  [v3 setTransform:&v58];
  objc_msgSend(v4, "setDotCenter:", v20, v22);
  objc_msgSend(v4, "setBounds:", v50, v49, v6, v8);
  objc_msgSend(v4, "setCenter:", v48, v47);
  CGAffineTransform v57 = v59;
  [v4 setTransform:&v57];
  long long v27 = [(CAMZoomDial *)self _labels];
  [(CAMZoomDial *)self _labelRotationAngleForOrientation];
  double v29 = v28;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v30 = v27;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v54;
    double v34 = *MEMORY[0x263F00148];
    double v35 = *(double *)(MEMORY[0x263F00148] + 8);
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v54 != v33) {
          objc_enumerationMutation(v30);
        }
        double v37 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        [v37 zoomFactor];
        double v39 = v38;
        [v37 intrinsicContentSize];
        double v41 = v40;
        double v43 = v42;
        [(CAMZoomDial *)self minAvailableZoomFactor];
        double v44 = v26;
        if (v39 != v45)
        {
          [(CAMZoomDial *)self _offsetAngleForZoomFactor:0 relativeToCurrentZoomFactor:v39];
          double v44 = v46;
        }
        memset(&v52, 0, sizeof(v52));
        CGAffineTransformMakeRotation(&v52, v29 + v44);
        [(CAMZoomDial *)self _textCenterForOffsetAngle:1 assumeExpanded:v44];
        objc_msgSend(v37, "setCenter:");
        objc_msgSend(v37, "setBounds:", v34, v35, v41, v43);
        CGAffineTransform v51 = v52;
        [v37 setTransform:&v51];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v32);
  }
}

- (void)_layoutSubviewsWithTicks
{
  objc_super v3 = [(CAMZoomDial *)self _ticksView];
  BOOL v4 = [(CAMZoomDial *)self _contentMaskView];
  [(CAMZoomDial *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  UIRectGetCenter();
  double v14 = v13;
  double v46 = v13;
  double v16 = v15;
  [(CAMZoomDial *)self minimumZoomFactor];
  double v18 = v17;
  [(CAMZoomDial *)self _layoutBackgroundAndContainerWithContentInset:4.0];
  objc_msgSend(v3, "setCenter:", v14, v16);
  objc_msgSend(v3, "setBounds:", v6, v8, v10, v12);
  double v19 = *MEMORY[0x263F001A8];
  double v20 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v21 = [v4 image];
  [v21 size];
  double v23 = v22;
  double v25 = v24;

  [(CAMZoomDial *)self _offsetAngleForZoomFactor:1 relativeToCurrentZoomFactor:v18];
  CGFloat v27 = -v26;
  [(CAMZoomDial *)self _pointForOffsetAngle:1 radialInset:-v26 assumeExpanded:v25 * 0.5];
  double v29 = v28;
  double v31 = v30;
  memset(&v55, 0, sizeof(v55));
  CGAffineTransformMakeRotation(&v55, v27);
  objc_msgSend(v4, "setBounds:", v19, v20, v23, v25);
  objc_msgSend(v4, "setCenter:", v29, v31);
  CGAffineTransform v54 = v55;
  [v4 setTransform:&v54];
  [(CAMZoomDial *)self _pointForOffsetAngle:0 radialInset:0.0 assumeExpanded:4.0];
  double v33 = v32;
  double v35 = v34 + -2.0;
  double v36 = [(CAMZoomDial *)self _needleView];
  objc_msgSend(v36, "setFrame:", v35, v33, 4.0, 10.0);

  [(CAMZoomDial *)self _labelRotationAngleForOrientation];
  uint64_t v38 = v37;
  double v39 = [(CAMZoomDial *)self _labels];
  double v40 = [(CAMZoomDial *)self _focalLengthLabelsPortrait];
  double v41 = [(CAMZoomDial *)self _focalLengthLabelsLandscape];
  [(CAMZoomDial *)self zoomFactor];
  double v42 = +[CAMZoomButton textForZoomFactor:showZoomFactorSymbol:](CAMZoomButton, "textForZoomFactor:showZoomFactorSymbol:", 0);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __39__CAMZoomDial__layoutSubviewsWithTicks__block_invoke;
  v47[3] = &unk_263FA4A58;
  double v51 = v46;
  double v52 = v16;
  uint64_t v53 = v38;
  v47[4] = self;
  id v48 = v40;
  id v49 = v41;
  id v50 = v42;
  id v43 = v42;
  id v44 = v41;
  id v45 = v40;
  [v39 enumerateObjectsUsingBlock:v47];
}

void __39__CAMZoomDial__layoutSubviewsWithTicks__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  [v5 zoomFactor];
  double v7 = v6;
  double v57 = *(double *)(MEMORY[0x263F00148] + 8);
  double v59 = *MEMORY[0x263F00148];
  [v5 intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;
  [*(id *)(a1 + 32) _offsetAngleForZoomFactor:0 relativeToCurrentZoomFactor:v7];
  double v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "_textCenterForOffsetAngle:assumeExpanded:", 1);
  double v15 = v14;
  double v17 = v16;
  [*(id *)(a1 + 32) _offsetAngleForZoomFactor:1 relativeToCurrentZoomFactor:v7];
  objc_msgSend(*(id *)(a1 + 32), "_textCenterForOffsetAngle:assumeExpanded:", 1);
  CEKProgressClamped();
  CGFloat v19 = v18;
  double v20 = v18 * (v18 * v18);
  [*(id *)(a1 + 32) minAvailableZoomFactor];
  if (v7 < v21 + -0.01 || ([*(id *)(a1 + 32) maxAvailableZoomFactor], v7 > v22 + 0.01)) {
    double v20 = v20 * 0.2;
  }
  CGFloat v23 = v13 + *(double *)(a1 + 80);
  memset(&v70, 0, sizeof(v70));
  CGAffineTransformMakeRotation(&v70, v23);
  memset(&v69, 0, sizeof(v69));
  CGAffineTransformMakeScale(&v69, v19, v19);
  CGAffineTransform t1 = v70;
  memset(&v68, 0, sizeof(v68));
  CGAffineTransform t2 = v69;
  CGAffineTransformConcat(&v68, &t1, &t2);
  objc_msgSend(v5, "setCenter:", v15, v17);
  objc_msgSend(v5, "setBounds:", v59, v57, v9, v11);
  CGAffineTransform v65 = v68;
  [v5 setTransform:&v65];
  [v5 setAlpha:v20];
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeRotation(&t1, v13);
  CGAffineTransform t2 = v70;
  if ([*(id *)(a1 + 40) count] > a3)
  {
    double v24 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
    double v25 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3];
    double v26 = *MEMORY[0x263F001A8];
    double v27 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v28 = [v24 image];
    [v28 size];
    double v55 = v30;
    double v56 = v29;

    double v31 = [v25 image];
    [v31 size];
    double v58 = v33;
    double v60 = v32;

    [*(id *)(a1 + 32) _focalLengthInsetPortrait];
    double v35 = v34;
    double v36 = [v24 image];
    [v36 size];
    double v38 = v35 + v37 * 0.5;

    [*(id *)(a1 + 32) _focalLengthInsetLandscape];
    double v40 = v39;
    double v41 = [v25 image];
    [v41 size];
    double v43 = v40 + v42 * 0.5;

    [*(id *)(a1 + 32) _pointForOffsetAngle:1 radialInset:v13 assumeExpanded:v38];
    double v45 = v44;
    double v47 = v46;
    [*(id *)(a1 + 32) _pointForOffsetAngle:1 radialInset:v13 assumeExpanded:v43];
    double v49 = v48;
    double v51 = v50;
    double v52 = +[CAMZoomButton textForZoomFactor:0 showZoomFactorSymbol:v7];
    if ([v52 isEqualToString:*(void *)(a1 + 56)]) {
      [MEMORY[0x263F825C8] systemYellowColor];
    }
    else {
    uint64_t v53 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.3];
    }
    [v24 setTintColor:v53];
    objc_msgSend(v24, "setCenter:", v45, v47);
    objc_msgSend(v24, "setBounds:", v26, v27, v56, v55);
    CGAffineTransform v64 = t1;
    [v24 setTransform:&v64];
    [v25 setTintColor:v53];
    objc_msgSend(v25, "setCenter:", v49, v51);
    objc_msgSend(v25, "setBounds:", v26, v27, v60, v58);
    if ((unint64_t)([*(id *)(a1 + 32) orientation] - 3) <= 1)
    {
      CGAffineTransform v54 = (void *)MEMORY[0x263F82E00];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __39__CAMZoomDial__layoutSubviewsWithTicks__block_invoke_2;
      v61[3] = &unk_263FA2270;
      id v62 = v25;
      CGAffineTransform v63 = t2;
      [v54 performWithoutAnimation:v61];
    }
  }
}

uint64_t __39__CAMZoomDial__layoutSubviewsWithTicks__block_invoke_2(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setTransform:v3];
}

- (void)_updateBackroundImageViewIfNeeded
{
  if ([(CAMZoomDial *)self _isBackgroundViewUpdateNeeded])
  {
    [(CAMZoomDial *)self _setBackgroundViewUpdateNeeded:0];
    [(CAMZoomDial *)self _setBackgroundImageJobIdentifier:[(CAMZoomDial *)self _backgroundImageJobIdentifier] + 1];
    [(CAMZoomDial *)self bounds];
    [(CAMZoomDial *)self dialCenter];
    [(CAMZoomDial *)self _fullRadius];
    [(CAMZoomDial *)self _backgroundAlpha];
    [(CAMZoomDial *)self _borderStrokeWidth];
    objc_super v3 = [(CAMZoomDial *)self _imageGenerationQueue];
    pl_dispatch_async();
  }
}

void __48__CAMZoomDial__updateBackroundImageViewIfNeeded__block_invoke(uint64_t a1)
{
  BOOL v2 = objc_msgSend((id)objc_opt_class(), "_createBackgroundImageForBounds:dialCenter:radius:backgroundAlpha:borderStrokeWidth:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(void *)(a1 + 104));
  id v1 = v2;
  pl_dispatch_async();
}

void __48__CAMZoomDial__updateBackroundImageViewIfNeeded__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _backgroundImageJobIdentifier] == *(void *)(a1 + 48))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    objc_super v3 = [*(id *)(a1 + 32) _backgroundView];
    [v3 setImage:v2];

    BOOL v4 = *(void **)(a1 + 32);
    [v4 setNeedsLayout];
  }
  else
  {
    id v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring background image since parameters no longer match", v6, 2u);
    }
  }
}

- (void)_updateTicksImageIfNeeded
{
  if ([(CAMZoomDial *)self _isTicksUpdateNeeded])
  {
    [(CAMZoomDial *)self _setTicksUpdateNeeded:0];
    [(CAMZoomDial *)self _setTicksImageJobIdentifier:[(CAMZoomDial *)self _ticksImageJobIdentifier] + 1];
    [(CAMZoomDial *)self bounds];
    [(CAMZoomDial *)self dialCenter];
    [(CAMZoomDial *)self _fullRadius];
    CAMPixelWidthForView(self);
    objc_super v3 = [(CAMZoomDial *)self zoomFactors];
    [(CAMZoomDial *)self minAvailableZoomFactor];
    [(CAMZoomDial *)self maxAvailableZoomFactor];
    [(CAMZoomDial *)self _signedAngleDeltaForZoomRange];
    BOOL v4 = [(CAMZoomDial *)self _imageGenerationQueue];
    id v5 = v3;
    pl_dispatch_async();
  }
}

void __40__CAMZoomDial__updateTicksImageIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "_createTicksImageForBounds:dialCenter:radius:pixelWidth:zoomFactors:minAvailableZoomFactor:maxAvailableZoomFactor:signedAngleDeltaForZoomRange:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128));
  id v1 = v2;
  pl_dispatch_async();
}

void __40__CAMZoomDial__updateTicksImageIfNeeded__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _ticksImageJobIdentifier] == *(void *)(a1 + 48))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    objc_super v3 = [*(id *)(a1 + 32) _ticksView];
    [v3 setImage:v2];

    BOOL v4 = *(void **)(a1 + 32);
    [v4 setNeedsLayout];
  }
  else
  {
    id v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring ticks image since counter does not match", v6, 2u);
    }
  }
}

- (void)_updateMaskImageIfNeeded
{
  if ([(CAMZoomDial *)self _isMaskUpdateNeeded])
  {
    [(CAMZoomDial *)self _setMaskUpdateNeeded:0];
    [(CAMZoomDial *)self _setMaskImageJobIdentifier:[(CAMZoomDial *)self _maskImageJobIdentifier] + 1];
    [(CAMZoomDial *)self bounds];
    [(CAMZoomDial *)self _tickLabelCenterRadialInset];
    [(CAMZoomDial *)self contentMaskingHeight];
    if (v3 == 0.0) {
      [(CAMZoomDial *)self _fullRadius];
    }
    BOOL v4 = (void *)MEMORY[0x263F827E8];
    id v5 = CAMCameraUIFrameworkBundle();
    double v6 = [v4 imageNamed:@"CAMZoomDialNotchMask" inBundle:v5];

    double v7 = [(CAMZoomDial *)self _imageGenerationQueue];
    id v8 = v6;
    pl_dispatch_async();
  }
}

void __39__CAMZoomDial__updateMaskImageIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "_createMaskImageWithSize:tickLabelCenterRadialInset:notchMaskImage:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v1 = v2;
  pl_dispatch_async();
}

void __39__CAMZoomDial__updateMaskImageIfNeeded__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _maskImageJobIdentifier] == *(void *)(a1 + 48))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    double v3 = [*(id *)(a1 + 32) _contentMaskView];
    [v3 setImage:v2];

    BOOL v4 = *(void **)(a1 + 32);
    [v4 setNeedsLayout];
  }
  else
  {
    id v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring mask image since counter does not match", v6, 2u);
    }
  }
}

+ (id)_createBackgroundImageForBounds:(CGRect)a3 dialCenter:(CGPoint)a4 radius:(double)a5 backgroundAlpha:(double)a6 borderStrokeWidth:(double)a7
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  double v13 = objc_msgSend(MEMORY[0x263F827B0], "preferredFormat", a3.origin.x, a3.origin.y);
  [v13 setPreferredRange:32766];
  double v14 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:format:", v13, width, height);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __99__CAMZoomDial__createBackgroundImageForBounds_dialCenter_radius_backgroundAlpha_borderStrokeWidth___block_invoke;
  v17[3] = &__block_descriptor_72_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(CGFloat *)&v17[4] = x;
  *(CGFloat *)&v17[5] = y;
  *(double *)&v17[6] = a5;
  *(double *)&v17[7] = a6;
  *(double *)&v17[8] = a7;
  double v15 = [v14 imageWithActions:v17];

  return v15;
}

void __99__CAMZoomDial__createBackgroundImageForBounds_dialCenter_radius_backgroundAlpha_borderStrokeWidth___block_invoke(double *a1)
{
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", a1[4] - a1[6], a1[5] - a1[6], a1[6] + a1[6], a1[6] + a1[6]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:a1[7]];
  [v2 set];
  [v4 fill];
  if (a1[8] > 0.0)
  {
    double v3 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.1];
    [v3 set];
    [v4 setLineWidth:a1[8]];
    [v4 stroke];
  }
}

+ (id)_createTicksImageForBounds:(CGRect)a3 dialCenter:(CGPoint)a4 radius:(double)a5 pixelWidth:(double)a6 zoomFactors:(id)a7 minAvailableZoomFactor:(double)a8 maxAvailableZoomFactor:(double)a9 signedAngleDeltaForZoomRange:(double)a10
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double height = a3.size.height;
  double width = a3.size.width;
  id v14 = a7;
  double v15 = [v14 firstObject];
  [v15 doubleValue];
  double v17 = v16;

  double v18 = [v14 lastObject];
  [v18 doubleValue];
  double v20 = v19;

  if (v17 == v20)
  {
    double v21 = 0;
  }
  else
  {
    double v22 = [MEMORY[0x263F827B0] preferredFormat];
    [v22 setPreferredRange:32766];
    CGFloat v23 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:format:", v22, width, height);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __158__CAMZoomDial__createTicksImageForBounds_dialCenter_radius_pixelWidth_zoomFactors_minAvailableZoomFactor_maxAvailableZoomFactor_signedAngleDeltaForZoomRange___block_invoke;
    v28[3] = &unk_263FA4AF0;
    id v29 = v14;
    id v30 = a1;
    double v31 = v17;
    double v32 = v20;
    double v33 = a8;
    double v34 = a9;
    double v35 = a6;
    double v36 = a10;
    double v37 = a5;
    CGFloat v38 = x;
    CGFloat v39 = y;
    double v21 = [v23 imageWithActions:v28];
  }
  return v21;
}

void __158__CAMZoomDial__createTicksImageForBounds_dialCenter_radius_pixelWidth_zoomFactors_minAvailableZoomFactor_maxAvailableZoomFactor_signedAngleDeltaForZoomRange___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  double v3 = *(void **)(a1 + 32);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __158__CAMZoomDial__createTicksImageForBounds_dialCenter_radius_pixelWidth_zoomFactors_minAvailableZoomFactor_maxAvailableZoomFactor_signedAngleDeltaForZoomRange___block_invoke_2;
  v31[3] = &unk_263FA33C8;
  id v4 = v2;
  id v32 = v4;
  [v3 enumerateObjectsUsingBlock:v31];
  id v5 = [v4 firstObject];
  uint64_t v6 = [v5 integerValue];

  double v7 = [v4 lastObject];
  uint64_t v8 = [v7 integerValue];

  if (v6 <= v8)
  {
    uint64_t v9 = v8 + 1;
    do
    {
      double v10 = (double)v6 * 0.1;
      double v11 = [NSNumber numberWithInteger:v6];
      int v12 = [v4 containsObject:v11];

      double v13 = 1.0;
      if (__ROR8__(0x1999999999999998 - 0x3333333333333333 * v6, 1) >= 0x1999999999999999uLL && (v12 & 1) == 0)
      {
        [(id)objc_opt_class() _normalizedValueForZoomFactor:(double)v6 * 0.1 min:*(double *)(a1 + 48) max:*(double *)(a1 + 56)];
        CEKInterpolateClamped();
        double v13 = v14;
      }
      if (v10 < *(double *)(a1 + 64) || v10 > *(double *)(a1 + 72)) {
        double v13 = v13 * 0.2;
      }
      double v15 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:v13];
      [v15 setStroke];

      double v16 = 2.0;
      if (v12) {
        double v16 = 3.0;
      }
      double v17 = *(double *)(a1 + 80) * v16;
      [(id)objc_opt_class() _offsetAngleForZoomFactor:0 relativeToCurrentZoomFactor:(double)v6 * 0.1 currentZoomFactor:*(double *)(a1 + 48) min:*(double *)(a1 + 48) max:*(double *)(a1 + 56) signedAngleDeltaForZoomRange:*(double *)(a1 + 88)];
      double v19 = v18;
      double v20 = *(double *)(a1 + 96);
      double v21 = v20 + -20.6666667;
      objc_msgSend(*(id *)(a1 + 40), "_pointForOffsetAngle:dialCenter:radius:", v19, *(double *)(a1 + 104), *(double *)(a1 + 112), v20 + -4.0);
      double v23 = v22;
      double v25 = v24;
      objc_msgSend(*(id *)(a1 + 40), "_pointForOffsetAngle:dialCenter:radius:", v19, *(double *)(a1 + 104), *(double *)(a1 + 112), v21);
      double v27 = v26;
      double v29 = v28;
      id v30 = [MEMORY[0x263F824C0] bezierPath];
      [v30 setLineWidth:v17];
      objc_msgSend(v30, "moveToPoint:", v23, v25);
      objc_msgSend(v30, "addLineToPoint:", v27, v29);
      [v30 stroke];

      ++v6;
    }
    while (v9 != v6);
  }
}

void __158__CAMZoomDial__createTicksImageForBounds_dialCenter_radius_pixelWidth_zoomFactors_minAvailableZoomFactor_maxAvailableZoomFactor_signedAngleDeltaForZoomRange___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithInteger:llround(v3 / 0.1)];
  [v4 addObject:v5];
}

+ (id)_createMaskImageWithSize:(CGSize)a3 tickLabelCenterRadialInset:(double)a4 notchMaskImage:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a5;
  long long v15 = *MEMORY[0x263F001A8];
  uint64_t v8 = [MEMORY[0x263F827B0] preferredFormat];
  [v8 setPreferredRange:32766];
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:format:", v8, width, height);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__CAMZoomDial__createMaskImageWithSize_tickLabelCenterRadialInset_notchMaskImage___block_invoke;
  v13[3] = &unk_263FA4B18;
  double v16 = width;
  double v17 = height;
  double v18 = width;
  double v19 = height;
  id v14 = v7;
  id v10 = v7;
  double v11 = [v9 imageWithActions:v13];

  return v11;
}

void __82__CAMZoomDial__createMaskImageWithSize_tickLabelCenterRadialInset_notchMaskImage___block_invoke(uint64_t a1, void *a2)
{
  v15[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (CGContext *)[v3 CGContext];
  id v5 = [MEMORY[0x263F825C8] clearColor];
  uint64_t v6 = [MEMORY[0x263F825C8] blackColor];
  [v6 setFill];
  objc_msgSend(v3, "fillRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  CGContextSetBlendMode(v4, kCGBlendModeCopy);
  id v7 = v5;
  v15[0] = [v7 CGColor];
  id v8 = v6;
  v15[1] = [v8 CGColor];
  CFArrayRef v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  *(_OWORD *)locations = xmmword_209C7B500;
  id v10 = v8;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v10 CGColor]);
  int v12 = CGGradientCreateWithColors(ColorSpace, v9, locations);
  CGContextSaveGState(v4);
  v20.size.double height = *(CGFloat *)(a1 + 80);
  v20.size.double width = *(double *)(a1 + 72) * 0.5;
  v20.origin.CGFloat x = 0.0;
  v20.origin.CGFloat y = 0.0;
  CGContextClipToRect(v4, v20);
  double v13 = *(double *)(a1 + 80);
  v16.CGFloat x = 0.0;
  v18.CGFloat y = 0.0;
  v16.CGFloat y = v13;
  v18.CGFloat x = v13 * 0.5;
  CGContextDrawLinearGradient(v4, v12, v16, v18, 0);
  CGContextRestoreGState(v4);
  CGContextSaveGState(v4);
  v21.size.double height = *(CGFloat *)(a1 + 80);
  v21.origin.CGFloat x = *(double *)(a1 + 72) * 0.5;
  v21.origin.CGFloat y = 0.0;
  v21.size.double width = v21.origin.x;
  CGContextClipToRect(v4, v21);
  v17.CGFloat x = *(CGFloat *)(a1 + 72);
  v19.CGFloat x = v17.x - v13 * 0.5;
  v19.CGFloat y = 0.0;
  v17.CGFloat y = v13;
  CGContextDrawLinearGradient(v4, v12, v17, v19, 0);
  CGContextRestoreGState(v4);
  CGGradientRelease(v12);
  [*(id *)(a1 + 32) size];
  UIRectCenteredXInRectScale();
  UIRectIntegralWithScale();
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 17, 0);
}

- (id)_createDotImage
{
  UICeilToViewScale();
  CGFloat v2 = v9.width * 0.5;
  v9.double height = v9.width;
  UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  id v3 = [MEMORY[0x263F824C0] bezierPath];
  objc_msgSend(v3, "moveToPoint:", v2, v2);
  objc_msgSend(v3, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v2, v2, 1.5, 0.0, 6.28318531);
  [v3 closePath];
  id v4 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
  [v4 set];
  [v3 setLineWidth:0.5];
  [v3 stroke];
  id v5 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
  [v5 set];
  [v3 fill];
  uint64_t v6 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v6;
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    [(CAMZoomDial *)self setNeedsLayout];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__CAMZoomDial_setOrientation_animated___block_invoke;
    aBlock[3] = &unk_263FA0208;
    void aBlock[4] = self;
    uint64_t v6 = (void (**)(void))_Block_copy(aBlock);
    id v7 = v6;
    if (v4)
    {
      id v8 = (void *)MEMORY[0x263F82E00];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __39__CAMZoomDial_setOrientation_animated___block_invoke_2;
      v9[3] = &unk_263FA08E8;
      v9[4] = self;
      id v10 = v6;
      [v8 animateWithDuration:2 delay:v9 options:0 animations:0.3 completion:0.0];
    }
    else
    {
      v6[2](v6);
    }
  }
}

uint64_t __39__CAMZoomDial_setOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFocalLengthLabelAlphas];
}

uint64_t __39__CAMZoomDial_setOrientation_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  CGFloat v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (double)_labelRotationAngleForOrientation
{
  int64_t v2 = [(CAMZoomDial *)self orientation];
  double result = 0.0;
  if ((unint64_t)(v2 - 2) <= 2) {
    return dbl_209C7B510[v2 - 2];
  }
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  BOOL v4 = [(CAMZoomDial *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0)
  {
    [(CAMZoomDial *)self _setLabelsUpdateNeeded:1];
    [(CAMZoomDial *)self _setDotsUpdateNeeded:[(CAMZoomDial *)self _useDots]];
    if ([(CAMZoomDial *)self _useTicks]) {
      [(CAMZoomDial *)self _setMaskUpdateNeeded:1];
    }
    [(CAMZoomDial *)self setNeedsLayout];
  }
}

- (int64_t)style
{
  return self->_style;
}

- (NSArray)zoomFactors
{
  return self->_zoomFactors;
}

- (NSArray)zoomPoints
{
  return self->_zoomPoints;
}

- (double)minAvailableZoomFactor
{
  return self->_minAvailableZoomFactor;
}

- (double)maxAvailableZoomFactor
{
  return self->_maxAvailableZoomFactor;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (double)contentMaskingHeight
{
  return self->_contentMaskingHeight;
}

- (double)contractionDistance
{
  return self->_contractionDistance;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)hideLabels
{
  return self->_hideLabels;
}

- (BOOL)hideFocalLengthLabels
{
  return self->_hideFocalLengthLabels;
}

- (double)angleDeltaForZoomRange
{
  return self->_angleDeltaForZoomRange;
}

- (void)setAngleDeltaForZoomRange:(double)a3
{
  self->_angleDeltaForZoomRange = a3;
}

- (UIImageView)_backgroundView
{
  return self->__backgroundView;
}

- (UIView)_contentContainerView
{
  return self->__contentContainerView;
}

- (UIView)_labelContainerView
{
  return self->__labelContainerView;
}

- (UIView)_focalLengthLabelContainerView
{
  return self->__focalLengthLabelContainerView;
}

- (UIImageView)_ticksView
{
  return self->__ticksView;
}

- (UIImageView)_contentMaskView
{
  return self->__contentMaskView;
}

- (UIView)_needleView
{
  return self->__needleView;
}

- (NSArray)_focalLengthLabelsPortrait
{
  return self->__focalLengthLabelsPortrait;
}

- (NSArray)_focalLengthLabelsLandscape
{
  return self->__focalLengthLabelsLandscape;
}

- (NSArray)_labels
{
  return self->__labels;
}

- (CAMZoomDialDotsView)_activeDots
{
  return self->__activeDots;
}

- (CAMZoomDialDotsView)_inactiveDots
{
  return self->__inactiveDots;
}

- (BOOL)_isBackgroundViewUpdateNeeded
{
  return self->__backgroundViewUpdateNeeded;
}

- (BOOL)_isLabelsUpdateNeeded
{
  return self->__labelsUpdateNeeded;
}

- (void)_setLabelsUpdateNeeded:(BOOL)a3
{
  self->__labelsUpdateNeeded = a3;
}

- (BOOL)_isDotsUpdateNeeded
{
  return self->__dotsUpdateNeeded;
}

- (void)_setDotsUpdateNeeded:(BOOL)a3
{
  self->__dotsUpdateNeeded = a3;
}

- (BOOL)_isTicksUpdateNeeded
{
  return self->__ticksUpdateNeeded;
}

- (BOOL)_isMaskUpdateNeeded
{
  return self->__maskUpdateNeeded;
}

- (OS_dispatch_queue)_imageGenerationQueue
{
  return self->__imageGenerationQueue;
}

- (int64_t)_backgroundImageJobIdentifier
{
  return self->__backgroundImageJobIdentifier;
}

- (void)_setBackgroundImageJobIdentifier:(int64_t)a3
{
  self->__backgroundImageJobIdentifier = a3;
}

- (int64_t)_ticksImageJobIdentifier
{
  return self->__ticksImageJobIdentifier;
}

- (void)_setTicksImageJobIdentifier:(int64_t)a3
{
  self->__ticksImageJobIdentifier = a3;
}

- (int64_t)_maskImageJobIdentifier
{
  return self->__maskImageJobIdentifier;
}

- (void)_setMaskImageJobIdentifier:(int64_t)a3
{
  self->__maskImageJobIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageGenerationQueue, 0);
  objc_storeStrong((id *)&self->__inactiveDots, 0);
  objc_storeStrong((id *)&self->__activeDots, 0);
  objc_storeStrong((id *)&self->__labels, 0);
  objc_storeStrong((id *)&self->__focalLengthLabelsLandscape, 0);
  objc_storeStrong((id *)&self->__focalLengthLabelsPortrait, 0);
  objc_storeStrong((id *)&self->__needleView, 0);
  objc_storeStrong((id *)&self->__contentMaskView, 0);
  objc_storeStrong((id *)&self->__ticksView, 0);
  objc_storeStrong((id *)&self->__focalLengthLabelContainerView, 0);
  objc_storeStrong((id *)&self->__labelContainerView, 0);
  objc_storeStrong((id *)&self->__contentContainerView, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->_zoomPoints, 0);
  objc_storeStrong((id *)&self->_zoomFactors, 0);
}

@end