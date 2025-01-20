@interface CCUIOverlaySlideUpPresentationProvider
+ (id)_baseC2AnimationParametersForTransitionState:(id)a3;
+ (id)_editingC2AnimationParametersToEditing:(BOOL)a3;
+ (id)_moduleC2AnimationParametersForTransitionState:(id)a3 layoutRect:(CCUILayoutRect *)a4;
- (BOOL)_isEditing;
- (BOOL)allowHotPocketDuringTransition;
- (BOOL)backdropViewShouldUseAlphaTransformer;
- (BOOL)isPanDismissalAvailable;
- (BOOL)isZoomEnabled;
- (CCUIOverlayMetricsProvider)metricsProvider;
- (CCUIOverlayViewProvider)viewProvider;
- (CGAffineTransform)_headerViewTransformForTransitionState:(SEL)a3;
- (CGAffineTransform)_moduleViewScaleTransformForTransitionState:(SEL)a3;
- (CGAffineTransform)_moduleViewTransformForTransitionState:(SEL)a3 layoutRect:(id)a4;
- (CGAffineTransform)_transformForTransitionState:(SEL)a3 rubberBandingHeight:(id)a4;
- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 withinBounds:(CGRect)a4 contentEdgeInsets:(UIEdgeInsets)a5 orientation:(int64_t)a6;
- (double)_additionalHeaderHeight;
- (double)_additionalHeaderOffset;
- (double)_additionalHeaderOffsetForEditing:(BOOL)a3;
- (double)_effectiveHeaderViewHeight;
- (double)_pullUpTranslation;
- (double)dismissalFlickMaximumTime;
- (double)dismissalFlickMinimumVelocity;
- (id)animationBatchForTransitionState:(id)a3 previousTransitionState:(id)a4;
- (id)moduleViewAnimationBatchForTransitionState:(id)a3 moduleView:(id)a4 layoutRect:(CCUILayoutRect *)a5;
- (id)transitionBetweenEditing;
- (id)transitionStateForType:(unint64_t)a3 interactive:(BOOL)a4 translation:(CGPoint)a5;
- (uint64_t)_headerViewFrameForContentSize:(double)a3 withinBounds:(CGFloat)a4 contentInset:(CGFloat)a5 contentEdgeInsets:(CGFloat)a6 orientation:(CGFloat)a7;
- (unint64_t)dismissalFlickAllowedDirections;
- (unint64_t)finalTransitionTypeForState:(id)a3 gestureTranslation:(CGPoint)a4 gestureVelocity:(CGPoint)a5;
- (unint64_t)headerMode;
- (void)_addAccessoryAlphaAnimationsToBatch:(id)a3 transitionState:(id)a4;
- (void)_addBackgroundViewWeightingAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addHeaderChevronAlphaAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addHeaderContentTransformAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addHeaderContentTranslationAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addHeaderSensorStatusViewAlphaAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addHeaderStatusBarAlphaAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addModuleTransformAnimationsToBatch:(id)a3 transitionState:(id)a4;
- (void)_addModuleTransformAnimationsToBatch:(id)a3 transitionState:(id)a4 moduleView:(id)a5 layoutRect:(CCUILayoutRect *)a6;
- (void)layoutViews;
- (void)setMetricsProvider:(id)a3;
- (void)setViewProvider:(id)a3;
@end

@implementation CCUIOverlaySlideUpPresentationProvider

- (BOOL)backdropViewShouldUseAlphaTransformer
{
  return 1;
}

- (BOOL)isPanDismissalAvailable
{
  return 1;
}

- (BOOL)isZoomEnabled
{
  return 0;
}

- (BOOL)allowHotPocketDuringTransition
{
  return 1;
}

- (id)transitionStateForType:(unint64_t)a3 interactive:(BOOL)a4 translation:(CGPoint)a5
{
  double y = a5.y;
  BOOL v6 = a4;
  [(CCUIOverlaySlideUpPresentationProvider *)self _pullUpTranslation];
  if (a3 == 1) {
    double v8 = -v8;
  }
  double v9 = y / v8;

  return +[CCUIOverlayTransitionState stateWithType:a3 interactive:v6 progress:v9];
}

- (unint64_t)finalTransitionTypeForState:(id)a3 gestureTranslation:(CGPoint)a4 gestureVelocity:(CGPoint)a5
{
  if ((BSFloatGreaterThanOrEqualToFloat() & 1) == 0)
  {
    CCUIPortraitMainListGridGeometryInfo();
    if (!BSFloatGreaterThanOrEqualToFloat()) {
      return 0;
    }
  }
  if (BSFloatLessThanFloat()) {
    return 1;
  }
  return 2;
}

- (void)layoutViews
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  v3 = [(CCUIOverlaySlideUpPresentationProvider *)self viewProvider];
  v4 = [(CCUIOverlaySlideUpPresentationProvider *)self metricsProvider];
  v5 = [v3 overlayBackgroundView];
  [v4 overlayBackgroundFrame];
  objc_msgSend(v5, "setFrame:");

  uint64_t v6 = [v4 overlayInterfaceOrientation];
  v7 = [v3 pagingView];
  double v8 = [v7 traitCollection];
  [v8 displayScale];
  uint64_t v88 = v9;

  [v4 overlayReachabilityHeight];
  double v94 = v10;
  v11 = [v3 overlayHeaderView];
  v12 = [v11 statusBar];
  [v12 setOrientation:v6];

  v13 = [v3 overlayHeaderView];
  v14 = [v13 statusBar];
  [v14 setCompactTrailingAlpha:0.0];

  [v4 overlayContainerFrame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [v3 overlayContainerView];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  v24 = [v3 pagingView];
  objc_msgSend(v24, "setFrame:", v16, v18, v20, v22);

  v25 = [v3 pagingView];
  [v25 layoutIfNeeded];

  double v26 = CCUILayoutEdgeInsetsForInterfaceOrientation(v6);
  double v28 = v27;
  uint64_t v30 = v29;
  double v32 = v31;
  [v4 overlayContentSize];
  BSRectWithSize();
  CGFloat rect = v34;
  double v86 = v33;
  double v90 = v35;
  double v91 = v28;
  double v83 = v28;
  double v89 = v36;
  double v37 = v16;
  double v87 = v18;
  double v92 = v22;
  double v93 = v20;
  -[CCUIOverlaySlideUpPresentationProvider _edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:](self, "_edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:", v6, v35, v36, v16, v18, v20, v22, *(void *)&v26, *(void *)&v83, v30, *(void *)&v32);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  if ((unint64_t)(v6 - 3) <= 1)
  {
    v46 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v47 = [v46 userInterfaceIdiom];

    if (!v47)
    {
      [(CCUIOverlaySlideUpPresentationProvider *)self _additionalHeaderHeight];
      double v39 = v39 + v48;
    }
  }
  objc_msgSend(v4, "setOverlayContentLayoutInset:", v39, v41, v43, v45);
  [v4 setOverlayContentLayoutOffset:0.0];
  double v84 = fmax(v39, v94);
  -[CCUIOverlaySlideUpPresentationProvider _headerViewFrameForContentSize:withinBounds:contentInset:contentEdgeInsets:orientation:](self, "_headerViewFrameForContentSize:withinBounds:contentInset:contentEdgeInsets:orientation:", v6, v90, v89, v37, v87, v93, v92, *(void *)&v84, *(void *)&v41, *(void *)&v43, *(void *)&v45, *(void *)&v26, *(void *)&v91, v30, *(void *)&v32);
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  v57 = [v3 overlayHeaderView];
  objc_msgSend(v57, "setFrame:", v50, v52, v54, v56);

  v58 = [v3 overlayHeaderView];
  [v58 setInterfaceOrientation:v6];

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v59 = [v3 overlayHeaderLayers];
  uint64_t v60 = [v59 countByEnumeratingWithState:&v95 objects:v99 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v96 != v62) {
          objc_enumerationMutation(v59);
        }
        objc_msgSend(*(id *)(*((void *)&v95 + 1) + 8 * i), "setFrame:", v50, v52, v54, v56);
      }
      uint64_t v61 = [v59 countByEnumeratingWithState:&v95 objects:v99 count:16];
    }
    while (v61);
  }

  v64 = [v3 overlayHeaderView];
  v65 = [v64 statusBar];
  objc_msgSend(v65, "setExpandedEdgeInsets:", 0.0, v91 + v86, 0.0, v32);

  v66 = [v3 overlayStatusLabelViewController];
  objc_msgSend(v66, "setEdgeInsets:", 0.0, v91 + v86, 0.0, v32);

  v67 = [v3 overlayHeaderView];
  objc_msgSend(v67, "setSensorAttributionEdgeInsets:", 0.0, v91 + v86, 0.0, v32);

  v101.origin.x = v86;
  v101.origin.double y = rect;
  v101.size.width = v90;
  v101.size.height = v89;
  CGFloat v68 = v84 + CGRectGetHeight(v101);
  [(CCUIOverlaySlideUpPresentationProvider *)self _additionalHeaderOffsetForEditing:[(CCUIOverlaySlideUpPresentationProvider *)self _isEditing] ^ 1];
  v102.origin.x = v37;
  v102.origin.double y = v87;
  v102.size.height = v92;
  v102.size.width = v93;
  CGRectGetHeight(v102);
  v103.origin.x = v86;
  v103.origin.double y = v68;
  v103.size.width = v90;
  v103.size.height = v89;
  CGRectGetMinY(v103);
  UIRectInsetEdges();
  double v70 = v69;
  double v72 = v71;
  v73 = [v3 editingAccessoryView];
  objc_msgSend(v73, "sizeThatFits:", v70, v72);

  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  double v75 = v74;
  double v77 = v76;
  double v79 = v78;
  double v81 = v80;
  v82 = objc_msgSend(v3, "editingAccessoryView", v88);
  objc_msgSend(v82, "setFrame:", v75, v77, v79, v81);
}

- (id)animationBatchForTransitionState:(id)a3 previousTransitionState:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(CCUIAnimationBatch);
  [(CCUIOverlaySlideUpPresentationProvider *)self _addBackgroundViewWeightingAnimationToBatch:v6 transitionState:v5];
  v7 = [(CCUIOverlaySlideUpPresentationProvider *)self metricsProvider];
  [v7 overlayReachabilityHeight];
  double v9 = fabs(v8);

  if (v9 < 2.22044605e-16)
  {
    [(CCUIOverlaySlideUpPresentationProvider *)self _addHeaderContentTransformAnimationToBatch:v6 transitionState:v5];
    [(CCUIOverlaySlideUpPresentationProvider *)self _addHeaderChevronAlphaAnimationToBatch:v6 transitionState:v5];
    [(CCUIOverlaySlideUpPresentationProvider *)self _addHeaderStatusBarAlphaAnimationToBatch:v6 transitionState:v5];
    [(CCUIOverlaySlideUpPresentationProvider *)self _addHeaderSensorStatusViewAlphaAnimationToBatch:v6 transitionState:v5];
    [(CCUIOverlaySlideUpPresentationProvider *)self _addHeaderContentTranslationAnimationToBatch:v6 transitionState:v5];
  }
  [(CCUIOverlaySlideUpPresentationProvider *)self _addAccessoryAlphaAnimationsToBatch:v6 transitionState:v5];
  [(CCUIOverlaySlideUpPresentationProvider *)self _addModuleTransformAnimationsToBatch:v6 transitionState:v5];

  return v6;
}

- (id)moduleViewAnimationBatchForTransitionState:(id)a3 moduleView:(id)a4 layoutRect:(CCUILayoutRect *)a5
{
  id v8 = a4;
  id v9 = a3;
  double v10 = objc_alloc_init(CCUIAnimationBatch);
  CCUILayoutSize var1 = a5->var1;
  v13[0] = a5->var0;
  v13[1] = var1;
  [(CCUIOverlaySlideUpPresentationProvider *)self _addModuleTransformAnimationsToBatch:v10 transitionState:v9 moduleView:v8 layoutRect:v13];

  return v10;
}

- (unint64_t)headerMode
{
  return 3;
}

- (id)transitionBetweenEditing
{
  v3 = objc_alloc_init(CCUIAnimationBatch);
  v4 = [(CCUIOverlaySlideUpPresentationProvider *)self viewProvider];
  uint64_t v5 = [v4 isEditing];
  uint64_t v6 = [(id)objc_opt_class() _editingC2AnimationParametersToEditing:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__CCUIOverlaySlideUpPresentationProvider_transitionBetweenEditing__block_invoke;
  v10[3] = &unk_1E6A89BB0;
  char v13 = v5;
  id v11 = v4;
  v12 = self;
  id v7 = v4;
  id v8 = +[CCUIAnimation animationWithParameters:v6 animations:v10];
  [(CCUIAnimationBatch *)v3 addAnimation:v8];

  return v3;
}

uint64_t __66__CCUIOverlaySlideUpPresentationProvider_transitionBetweenEditing__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) overlayHeaderView];
  v3 = v2;
  if (*(unsigned char *)(a1 + 48)) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  [v2 setAlpha:v4];

  uint64_t v5 = [*(id *)(a1 + 32) editingAccessoryView];
  uint64_t v6 = v5;
  if (*(unsigned char *)(a1 + 48)) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  [v5 setAlpha:v7];

  id v8 = *(void **)(a1 + 40);

  return [v8 layoutViews];
}

- (double)dismissalFlickMaximumTime
{
  return 0.2;
}

- (double)dismissalFlickMinimumVelocity
{
  return 600.0;
}

- (unint64_t)dismissalFlickAllowedDirections
{
  return 4;
}

- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 withinBounds:(CGRect)a4 contentEdgeInsets:(UIEdgeInsets)a5 orientation:(int64_t)a6
{
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if ((unint64_t)(a6 - 1) > 1)
  {
    CGRectGetHeight(a4);
    UIRoundToScale();
    double v9 = v13;
  }
  else
  {
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    [(CCUIOverlaySlideUpPresentationProvider *)self _additionalHeaderOffset];
    double v11 = v10;
    [(CCUIOverlaySlideUpPresentationProvider *)self _effectiveHeaderViewHeight];
    double v13 = v11 + v12;
  }
  double v14 = v6;
  double v15 = v9;
  double v16 = v7;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (uint64_t)_headerViewFrameForContentSize:(double)a3 withinBounds:(CGFloat)a4 contentInset:(CGFloat)a5 contentEdgeInsets:(CGFloat)a6 orientation:(CGFloat)a7
{
  if ((unint64_t)(a9 - 1) > 1)
  {
    v16.origin.x = a4;
    v16.origin.double y = a5;
    v16.size.width = a6;
    v16.size.height = a7;
    CGRectGetWidth(v16);
    return [a1 _additionalHeaderHeight];
  }
  else
  {
    [a1 _additionalHeaderOffset];
    v15.origin.x = a4;
    v15.origin.double y = a5;
    v15.size.width = a6;
    v15.size.height = a7;
    CGRectGetWidth(v15);
    return [a1 _effectiveHeaderViewHeight];
  }
}

- (double)_pullUpTranslation
{
  v3 = [(CCUIOverlaySlideUpPresentationProvider *)self viewProvider];
  double v4 = [(CCUIOverlaySlideUpPresentationProvider *)self metricsProvider];
  double v5 = CCUILayoutEdgeInsetsForInterfaceOrientation([v4 overlayInterfaceOrientation]);
  double v6 = [v3 overlayContainerView];
  [v6 frame];
  double Height = CGRectGetHeight(v11);
  [v4 overlayContentLayoutInset];
  double v9 = Height - v8 - v5;

  return v9;
}

- (double)_effectiveHeaderViewHeight
{
  double v3 = CCUIPortraitHeaderHeight();
  [(CCUIOverlaySlideUpPresentationProvider *)self _additionalHeaderHeight];
  return v3 + v4;
}

- (double)_additionalHeaderHeight
{
  double v3 = [(CCUIOverlaySlideUpPresentationProvider *)self viewProvider];
  double v4 = [v3 overlayHeaderView];
  double v5 = [(CCUIOverlaySlideUpPresentationProvider *)self metricsProvider];
  objc_msgSend(v4, "additionalHeightForOrientation:", objc_msgSend(v5, "overlayInterfaceOrientation"));
  double v7 = v6;

  return v7;
}

- (double)_additionalHeaderOffset
{
  BOOL v3 = [(CCUIOverlaySlideUpPresentationProvider *)self _isEditing];

  [(CCUIOverlaySlideUpPresentationProvider *)self _additionalHeaderOffsetForEditing:v3];
  return result;
}

- (double)_additionalHeaderOffsetForEditing:(BOOL)a3
{
  double result = 0.0;
  if (a3)
  {
    double v4 = [(CCUIOverlaySlideUpPresentationProvider *)self metricsProvider];
    uint64_t v5 = [v4 overlayInterfaceOrientation];

    double v6 = CCUILayoutEdgeInsetsForInterfaceOrientation(v5);
    return -CCUIStatusBarHeight() - v6;
  }
  return result;
}

- (BOOL)_isEditing
{
  v2 = [(CCUIOverlaySlideUpPresentationProvider *)self viewProvider];
  char v3 = [v2 isEditing];

  return v3;
}

+ (id)_baseC2AnimationParametersForTransitionState:(id)a3
{
  id v3 = a3;
  if (_baseC2AnimationParametersForTransitionState__onceToken_0 != -1) {
    dispatch_once(&_baseC2AnimationParametersForTransitionState__onceToken_0, &__block_literal_global_2);
  }
  if ([v3 isInteractive])
  {
    double v4 = (void *)_baseC2AnimationParametersForTransitionState__baseInteractiveParameters_0;
  }
  else
  {
    [v3 clampedPresentationProgress];
    if (BSFloatIsZero())
    {
      double v4 = (void *)_baseC2AnimationParametersForTransitionState__baseDismissParameters_0;
    }
    else
    {
      BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      double v6 = &_baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters_0;
      if (!IsReduceMotionEnabled) {
        double v6 = &_baseC2AnimationParametersForTransitionState__basePresentParameters_0;
      }
      double v4 = (void *)*v6;
    }
  }
  id v7 = v4;

  return v7;
}

void __87__CCUIOverlaySlideUpPresentationProvider__baseC2AnimationParametersForTransitionState___block_invoke()
{
  CGRect v11 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  [(CCUIMutableC2AnimationParameters *)v11 setTension:250.0];
  [(CCUIMutableC2AnimationParameters *)v11 setFriction:22.0];
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v11, "setFrameRateRange:", *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
  [(CCUIMutableC2AnimationParameters *)v11 setHighFrameRateReason:2031617];
  uint64_t v0 = [(CCUIMutableC2AnimationParameters *)v11 copy];
  v1 = (void *)_baseC2AnimationParametersForTransitionState__basePresentParameters_0;
  _baseC2AnimationParametersForTransitionState__basePresentParameters_0 = v0;

  v2 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  [(CCUIMutableC2AnimationParameters *)v2 setTension:250.0];
  [(CCUIMutableC2AnimationParameters *)v2 setFriction:30.0];
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v2, "setFrameRateRange:", *(double *)&v14.minimum, *(double *)&v14.maximum, *(double *)&v14.preferred);
  [(CCUIMutableC2AnimationParameters *)v2 setHighFrameRateReason:2031617];
  uint64_t v3 = [(CCUIMutableC2AnimationParameters *)v2 copy];
  double v4 = (void *)_baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters_0;
  _baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters_0 = v3;

  uint64_t v5 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  [(CCUIMutableC2AnimationParameters *)v5 setTension:250.0];
  [(CCUIMutableC2AnimationParameters *)v5 setFriction:22.0];
  CAFrameRateRange v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v5, "setFrameRateRange:", *(double *)&v15.minimum, *(double *)&v15.maximum, *(double *)&v15.preferred);
  [(CCUIMutableC2AnimationParameters *)v5 setHighFrameRateReason:2031617];
  uint64_t v6 = [(CCUIMutableC2AnimationParameters *)v5 copy];
  id v7 = (void *)_baseC2AnimationParametersForTransitionState__baseDismissParameters_0;
  _baseC2AnimationParametersForTransitionState__baseDismissParameters_0 = v6;

  double v8 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  [(CCUIMutableC2AnimationParameters *)v8 setInteractive:1];
  [(CCUIMutableC2AnimationParameters *)v8 setTension:1754.61];
  [(CCUIMutableC2AnimationParameters *)v8 setFriction:72.05];
  CAFrameRateRange v16 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v8, "setFrameRateRange:", *(double *)&v16.minimum, *(double *)&v16.maximum, *(double *)&v16.preferred);
  [(CCUIMutableC2AnimationParameters *)v8 setHighFrameRateReason:2031617];
  uint64_t v9 = [(CCUIMutableC2AnimationParameters *)v8 copy];
  double v10 = (void *)_baseC2AnimationParametersForTransitionState__baseInteractiveParameters_0;
  _baseC2AnimationParametersForTransitionState__baseInteractiveParameters_0 = v9;
}

+ (id)_moduleC2AnimationParametersForTransitionState:(id)a3 layoutRect:(CCUILayoutRect *)a4
{
  double v4 = objc_msgSend(a1, "_baseC2AnimationParametersForTransitionState:", a3, a4);
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 tension];
  [v5 setTension:v6 + 0.0];
  [v5 friction];
  [v5 setFriction:v7 + 0.0];

  return v5;
}

+ (id)_editingC2AnimationParametersToEditing:(BOOL)a3
{
  uint64_t v3 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  [(CCUIMutableC2AnimationParameters *)v3 setTension:436.1];
  [(CCUIMutableC2AnimationParameters *)v3 setFriction:41.8];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v3, "setFrameRateRange:", *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
  [(CCUIMutableC2AnimationParameters *)v3 setHighFrameRateReason:2031618];

  return v3;
}

- (void)_addBackgroundViewWeightingAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(id)objc_opt_class() _baseC2AnimationParametersForTransitionState:v6];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  CAFrameRateRange v13 = __102__CCUIOverlaySlideUpPresentationProvider__addBackgroundViewWeightingAnimationToBatch_transitionState___block_invoke;
  CAFrameRateRange v14 = &unk_1E6A89968;
  CAFrameRateRange v15 = self;
  id v16 = v6;
  id v9 = v6;
  double v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __102__CCUIOverlaySlideUpPresentationProvider__addBackgroundViewWeightingAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewProvider];
  id v6 = [v2 overlayBackgroundView];

  LODWORD(v2) = [*(id *)(a1 + 40) isInteractive];
  [*(id *)(a1 + 40) clampedPresentationProgress];
  double v4 = v3;
  if (v2)
  {
    [*(id *)(a1 + 32) _pullUpTranslation];
    double v4 = (v4 * v5 + (1.0 - v4) * 0.0) / 300.0;
  }
  [v6 setWeighting:v4];
}

- (void)_addHeaderContentTransformAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(id)objc_opt_class() _baseC2AnimationParametersForTransitionState:v6];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  CAFrameRateRange v13 = __101__CCUIOverlaySlideUpPresentationProvider__addHeaderContentTransformAnimationToBatch_transitionState___block_invoke;
  CAFrameRateRange v14 = &unk_1E6A89968;
  CAFrameRateRange v15 = self;
  id v16 = v6;
  id v9 = v6;
  double v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __101__CCUIOverlaySlideUpPresentationProvider__addHeaderContentTransformAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewProvider];
  double v3 = [v2 overlayHeaderView];

  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  double v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 _headerViewTransformForTransitionState:*(void *)(a1 + 40)];
  }
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  [v3 setContentTransform:v5];
}

- (CGAffineTransform)_headerViewTransformForTransitionState:(SEL)a3
{
  [a4 clampedPresentationProgress];
  [(CCUIOverlaySlideUpPresentationProvider *)self _pullUpTranslation];
  UIRoundToScale();
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;

  return CGAffineTransformMakeTranslation(retstr, 0.0, v6);
}

- (void)_addHeaderChevronAlphaAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(id)objc_opt_class() _baseC2AnimationParametersForTransitionState:v6];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  CAFrameRateRange v13 = __97__CCUIOverlaySlideUpPresentationProvider__addHeaderChevronAlphaAnimationToBatch_transitionState___block_invoke;
  CAFrameRateRange v14 = &unk_1E6A89968;
  CAFrameRateRange v15 = self;
  id v16 = v6;
  id v9 = v6;
  double v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __97__CCUIOverlaySlideUpPresentationProvider__addHeaderChevronAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewProvider];
  id v4 = [v2 overlayHeaderView];

  [*(id *)(a1 + 40) presentationProgress];
  objc_msgSend(v4, "setChevronAlpha:", fmin(fmax((v3 + -0.88) * 0.3 / 0.07 + 0.0, 0.0), 0.3));
}

- (void)_addHeaderStatusBarAlphaAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(id)objc_opt_class() _baseC2AnimationParametersForTransitionState:v6];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  CAFrameRateRange v13 = __99__CCUIOverlaySlideUpPresentationProvider__addHeaderStatusBarAlphaAnimationToBatch_transitionState___block_invoke;
  CAFrameRateRange v14 = &unk_1E6A89968;
  CAFrameRateRange v15 = self;
  id v16 = v6;
  id v9 = v6;
  double v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __99__CCUIOverlaySlideUpPresentationProvider__addHeaderStatusBarAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewProvider];
  id v4 = [v2 overlayHeaderView];

  [*(id *)(a1 + 40) presentationProgress];
  objc_msgSend(v4, "setStatusBarAlpha:", fmin(fmax((v3 + -0.88) / 0.07 + 0.0, 0.0), 1.0));
}

- (void)_addAccessoryAlphaAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(id)objc_opt_class() _baseC2AnimationParametersForTransitionState:v6];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  CAFrameRateRange v13 = __94__CCUIOverlaySlideUpPresentationProvider__addAccessoryAlphaAnimationsToBatch_transitionState___block_invoke;
  CAFrameRateRange v14 = &unk_1E6A89968;
  CAFrameRateRange v15 = self;
  id v16 = v6;
  id v9 = v6;
  double v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __94__CCUIOverlaySlideUpPresentationProvider__addAccessoryAlphaAnimationsToBatch_transitionState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewProvider];
  id v4 = [v2 overlayPageControl];

  [*(id *)(a1 + 40) presentationProgress];
  objc_msgSend(v4, "setAlpha:", fmin(fmax((v3 + -0.88) / 0.07 + 0.0, 0.0), 1.0));
}

- (void)_addHeaderSensorStatusViewAlphaAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(id)objc_opt_class() _baseC2AnimationParametersForTransitionState:v6];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  CAFrameRateRange v13 = __106__CCUIOverlaySlideUpPresentationProvider__addHeaderSensorStatusViewAlphaAnimationToBatch_transitionState___block_invoke;
  CAFrameRateRange v14 = &unk_1E6A89968;
  CAFrameRateRange v15 = self;
  id v16 = v6;
  id v9 = v6;
  double v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __106__CCUIOverlaySlideUpPresentationProvider__addHeaderSensorStatusViewAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewProvider];
  id v4 = [v2 overlayHeaderView];

  [*(id *)(a1 + 40) presentationProgress];
  objc_msgSend(v4, "setSensorStatusViewAlpha:", fmin(fmax((v3 + -0.88) / 0.07 + 0.0, 0.0), 1.0));
}

- (void)_addHeaderContentTranslationAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(id)objc_opt_class() _baseC2AnimationParametersForTransitionState:v6];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  CAFrameRateRange v13 = __103__CCUIOverlaySlideUpPresentationProvider__addHeaderContentTranslationAnimationToBatch_transitionState___block_invoke;
  CAFrameRateRange v14 = &unk_1E6A89968;
  CAFrameRateRange v15 = self;
  id v16 = v6;
  id v9 = v6;
  double v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __103__CCUIOverlaySlideUpPresentationProvider__addHeaderContentTranslationAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  long long v14 = 0u;
  uint64_t v15 = 0;
  long long v13 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "_transformForTransitionState:rubberBandingHeight:", *(void *)(a1 + 40), 460.0, (unsigned __int128)0, (unsigned __int128)0, 0);
    v2 = *(void **)(a1 + 32);
  }
  double v3 = objc_msgSend(v2, "viewProvider", v13, v14, v15);
  id v4 = [v3 pagingView];

  [v4 bounds];
  objc_msgSend(v4, "convertRect:toView:", 0);
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) viewProvider];
  long long v8 = [v7 overlayHeaderView];

  id v9 = [v8 statusBar];
  [v9 bounds];
  objc_msgSend(v9, "convertRect:toView:", 0);
  double v12 = fmax(v6 - (v10 + v11) + 0.0, 0.0);
  [v9 setExpandedStatusBarTranslation:v12];
  [v9 layoutIfNeeded];
  [v8 setVerticalContentTranslation:v12];
  [v8 layoutIfNeeded];
}

- (void)_addModuleTransformAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(CCUIOverlaySlideUpPresentationProvider *)self viewProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__CCUIOverlaySlideUpPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke;
  v11[3] = &unk_1E6A899B8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateOverlayModuleViewsWithBlock:v11];
}

uint64_t __95__CCUIOverlaySlideUpPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke(void *a1, uint64_t a2, _OWORD *a3)
{
  double v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  long long v6 = a3[1];
  v8[0] = *a3;
  v8[1] = v6;
  return [v3 _addModuleTransformAnimationsToBatch:v4 transitionState:v5 moduleView:a2 layoutRect:v8];
}

- (void)_addModuleTransformAnimationsToBatch:(id)a3 transitionState:(id)a4 moduleView:(id)a5 layoutRect:(CCUILayoutRect *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = objc_opt_class();
  CCUILayoutSize var1 = a6->var1;
  v25[0] = a6->var0;
  v25[1] = var1;
  uint64_t v15 = [v13 _moduleC2AnimationParametersForTransitionState:v10 layoutRect:v25];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  CCUILayoutSize v16 = a6->var1;
  CCUILayoutPoint var0 = a6->var0;
  CCUILayoutSize v24 = v16;
  v20[2] = __117__CCUIOverlaySlideUpPresentationProvider__addModuleTransformAnimationsToBatch_transitionState_moduleView_layoutRect___block_invoke;
  v20[3] = &unk_1E6A899E0;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v17 = v11;
  id v18 = v10;
  double v19 = +[CCUIAnimation animationWithParameters:v15 animations:v20];
  [v12 addAnimation:v19];
}

void __117__CCUIOverlaySlideUpPresentationProvider__addModuleTransformAnimationsToBatch_transitionState_moduleView_layoutRect___block_invoke(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    long long v4 = *(_OWORD *)(a1 + 72);
    long long v6 = *(_OWORD *)(a1 + 56);
    long long v7 = v4;
    [v2 _moduleViewTransformForTransitionState:v3 layoutRect:&v6];
  }
  uint64_t v5 = [*(id *)(a1 + 48) c2AnimationContainerView];
  long long v6 = v9;
  long long v7 = v10;
  long long v8 = v11;
  [v5 setTransform:&v6];
}

- (CGAffineTransform)_moduleViewTransformForTransitionState:(SEL)a3 layoutRect:(id)a4
{
  memset(&v11[1], 0, sizeof(CGAffineTransform));
  id v7 = a4;
  [(CCUIOverlaySlideUpPresentationProvider *)self _transformForTransitionState:v7 rubberBandingHeight:460.0];
  memset(v11, 0, 48);
  [(CCUIOverlaySlideUpPresentationProvider *)self _moduleViewScaleTransformForTransitionState:v7];

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform t1 = v11[0];
  CGAffineTransform v9 = v11[1];
  return CGAffineTransformConcat(retstr, &t1, &v9);
}

- (CGAffineTransform)_moduleViewScaleTransformForTransitionState:(SEL)a3
{
  id v11 = a4;
  if (![v11 isInteractive] || objc_msgSend(v11, "type") == 1) {
    [v11 isInteractive];
  }
  [v11 clampedPresentationProgress];
  double v6 = v5 + 1.0 - v5;
  [v11 presentationProgress];
  double v8 = fmax(v7 + -1.0, 0.0);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  CGFloat v9 = v6 + v8 * 0.0 + (1.0 - v8) * 0.0;
  CGAffineTransformMakeScale(retstr, v9, v9);

  return result;
}

- (CGAffineTransform)_transformForTransitionState:(SEL)a3 rubberBandingHeight:(id)a4
{
  id v7 = a4;
  [(CCUIOverlaySlideUpPresentationProvider *)self _pullUpTranslation];
  [v7 clampedPresentationProgress];
  [v7 nonZeroPresentationProgress];
  [v7 clampedPresentationProgress];

  BSUIConstrainValueWithRubberBand();
  UIRoundToScale();
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;

  return CGAffineTransformMakeTranslation(retstr, 0.0, v8);
}

- (CCUIOverlayViewProvider)viewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);

  return (CCUIOverlayViewProvider *)WeakRetained;
}

- (void)setViewProvider:(id)a3
{
}

- (CCUIOverlayMetricsProvider)metricsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsProvider);

  return (CCUIOverlayMetricsProvider *)WeakRetained;
}

- (void)setMetricsProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_metricsProvider);

  objc_destroyWeak((id *)&self->_viewProvider);
}

@end