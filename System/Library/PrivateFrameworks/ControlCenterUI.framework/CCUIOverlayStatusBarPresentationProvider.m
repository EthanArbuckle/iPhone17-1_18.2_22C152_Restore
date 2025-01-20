@interface CCUIOverlayStatusBarPresentationProvider
+ (id)_baseC2AnimationParametersForTransitionState:(id)a3;
+ (id)_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState:(id)a3;
+ (id)_editingC2AnimationParametersToEditing:(BOOL)a3;
+ (id)_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState:(id)a3;
+ (id)_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState:(id)a3;
+ (id)_hiddenStatusBarFadeAnimationParameters;
+ (id)_leadingStatusBarCAAnimationParametersForTransitionState:(id)a3;
+ (id)_moduleAlphaCAAnimationParametersForTransitionState:(id)a3;
+ (id)_moduleC2AnimationParametersForTransitionState:(id)a3 layoutRect:(CCUILayoutRect *)a4;
+ (id)_moduleScaleCAAnimationParametersForTransitionState:(id)a3;
+ (id)_reducedMotionStatusBarStateCAAnimationParameters;
+ (id)_trailingStatusBarCAAnimationParametersForTransitionState:(id)a3;
- (BOOL)_isEditing;
- (BOOL)allowHotPocketDuringTransition;
- (BOOL)backdropViewShouldUseAlphaTransformer;
- (BOOL)isPanDismissalAvailable;
- (BOOL)isZoomEnabled;
- (CCUIOverlayMetricsProvider)metricsProvider;
- (CCUIOverlayViewProvider)viewProvider;
- (CGAffineTransform)_compactStatusBar:(SEL)a3 transformForTransitionState:(id)a4;
- (CGAffineTransform)_headerViewTransformForTransitionState:(SEL)a3;
- (CGAffineTransform)_moduleViewScaleTransformForTransitionState:(SEL)a3 layoutRect:(id)a4;
- (CGAffineTransform)_moduleViewTransformForTransitionState:(SEL)a3 layoutRect:(id)a4;
- (CGAffineTransform)_transformForTransitionState:(SEL)a3 rubberBandingHeight:(id)a4;
- (CGRect)_presentedViewFrame;
- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 withinBounds:(CGRect)a4 contentEdgeInsets:(UIEdgeInsets)a5 orientation:(int64_t)a6;
- (double)_additionalHeaderHeight;
- (double)_additionalHeaderOffset;
- (double)_additionalHeaderOffsetForEditing:(BOOL)a3;
- (double)_delayForTransitionState:(id)a3 layoutRect:(CCUILayoutRect *)a4;
- (double)_effectiveHeaderViewHeight;
- (double)_effectiveTransitionHeight;
- (double)_leadingStatusBarAlphaForTransitionState:(id)a3;
- (double)dismissalFlickMaximumTime;
- (double)dismissalFlickMinimumVelocity;
- (id)animationBatchForTransitionState:(id)a3 previousTransitionState:(id)a4;
- (id)cleanupForDismissal;
- (id)moduleViewAnimationBatchForTransitionState:(id)a3 moduleView:(id)a4 layoutRect:(CCUILayoutRect *)a5;
- (id)prepareForPresentation;
- (id)secondaryAnimationBatchForTransitionState:(id)a3 previousTransitionState:(id)a4;
- (id)transitionBetweenEditing;
- (id)transitionStateForType:(unint64_t)a3 interactive:(BOOL)a4 translation:(CGPoint)a5;
- (uint64_t)_headerViewFrameForContentSize:(double)a3 withinBounds:(CGFloat)a4 contentInset:(CGFloat)a5 contentEdgeInsets:(CGFloat)a6 orientation:(CGFloat)a7;
- (unint64_t)dismissalFlickAllowedDirections;
- (unint64_t)finalTransitionTypeForState:(id)a3 gestureTranslation:(CGPoint)a4 gestureVelocity:(CGPoint)a5;
- (unint64_t)headerMode;
- (void)_addAccessoryAlphaAnimationsToBatch:(id)a3 transitionState:(id)a4;
- (void)_addAccessoryScaleAnimationsToBatch:(id)a3 transitionState:(id)a4;
- (void)_addBackgroundViewWeightingAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addHeaderContentTransformAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addHeaderSensorStatusViewAlphaAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addLeadingStatusBarAlphaAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addModuleAlphaAnimationsToBatch:(id)a3 transitionState:(id)a4;
- (void)_addModuleAlphaAnimationsToBatch:(id)a3 transitionState:(id)a4 moduleView:(id)a5 layoutRect:(CCUILayoutRect *)a6;
- (void)_addModuleScaleAnimationsToBatch:(id)a3 transitionState:(id)a4;
- (void)_addModuleScaleAnimationsToBatch:(id)a3 transitionState:(id)a4 moduleView:(id)a5 layoutRect:(CCUILayoutRect *)a6;
- (void)_addModuleTransformAnimationsToBatch:(id)a3 transitionState:(id)a4;
- (void)_addModuleTransformAnimationsToBatch:(id)a3 transitionState:(id)a4 moduleView:(id)a5 layoutRect:(CCUILayoutRect *)a6;
- (void)_addPageContentTransformAnimationsToBatch:(id)a3 transitionState:(id)a4;
- (void)_addReducedMotionStatusBarStateAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addStatusBarAlphaAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)_addStatusBarStateAnimationToBatch:(id)a3 transitionState:(id)a4;
- (void)layoutViews;
- (void)setMetricsProvider:(id)a3;
- (void)setViewProvider:(id)a3;
@end

@implementation CCUIOverlayStatusBarPresentationProvider

- (UIEdgeInsets)_edgeInsetsForContentSize:(CGSize)a3 withinBounds:(CGRect)a4 contentEdgeInsets:(UIEdgeInsets)a5 orientation:(int64_t)a6
{
  if ((unint64_t)(a6 - 1) < 2) {
    goto LABEL_3;
  }
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v11 = a3.height;
  double v12 = a3.width;
  v13 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
LABEL_3:
    double v16 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v15 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v17 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    [(CCUIOverlayStatusBarPresentationProvider *)self _additionalHeaderOffset];
    double v19 = v18;
    [(CCUIOverlayStatusBarPresentationProvider *)self _effectiveHeaderViewHeight];
    double v21 = v19 + v20;
  }
  else
  {
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double v22 = fmax(CGRectGetWidth(v28) - v12, 0.0);
    UIRoundToScale();
    double v16 = v23;
    double v17 = v22 - v23;
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double v24 = fmax(CGRectGetHeight(v29) - v11, 0.0);
    UIRoundToScale();
    double v15 = v24 - v21;
  }
  double v25 = v16;
  double v26 = v15;
  double v27 = v17;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v21;
  return result;
}

- (double)_additionalHeaderOffsetForEditing:(BOOL)a3
{
  double result = 0.0;
  if (a3)
  {
    double v5 = -CCUIStatusBarHeight();
    [(CCUIOverlayStatusBarPresentationProvider *)self _additionalHeaderHeight];
    return v5 - v6;
  }
  return result;
}

- (double)_effectiveHeaderViewHeight
{
  double v3 = CCUIPortraitHeaderHeight();
  [(CCUIOverlayStatusBarPresentationProvider *)self _additionalHeaderHeight];
  return v3 + v4;
}

- (double)_additionalHeaderOffset
{
  BOOL v3 = [(CCUIOverlayStatusBarPresentationProvider *)self _isEditing];

  [(CCUIOverlayStatusBarPresentationProvider *)self _additionalHeaderOffsetForEditing:v3];
  return result;
}

- (void)layoutViews
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
  double v4 = [(CCUIOverlayStatusBarPresentationProvider *)self metricsProvider];
  uint64_t v5 = [v4 overlayInterfaceOrientation];
  double v6 = [v3 pagingView];
  v7 = [v6 traitCollection];
  [v7 displayScale];
  uint64_t v132 = v8;

  [v4 overlayReachabilityHeight];
  double v138 = v9;
  v10 = [v3 overlayHeaderView];
  double v11 = [v10 statusBar];
  [v11 setOrientation:v5];

  [v4 overlayBackgroundFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if ((unint64_t)(v5 - 1) <= 1)
  {
    UIRectInset();
    double v13 = v20;
    double v15 = v21;
    double v17 = v22;
    double v19 = v23;
  }
  double v24 = [v3 overlayBackgroundView];
  objc_msgSend(v24, "setFrame:", v13, v15, v17, v19);

  [v4 overlayContainerFrame];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v33 = [v3 overlayContainerView];
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

  v34 = [v3 pagingView];
  double v139 = v26;
  double v140 = v32;
  double v141 = v30;
  double v142 = v28;
  objc_msgSend(v34, "setFrame:", v26, v28, v30, v32);

  v35 = [v3 pagingView];
  [v35 layoutIfNeeded];

  CCUILayoutEdgeInsetsForInterfaceOrientation(v5);
  CCUIEdgeInsetsRTLSwap();
  uint64_t v37 = v36;
  double v39 = v38;
  uint64_t v41 = v40;
  double v135 = v42;
  [v4 overlayContentSize];
  BSRectWithSize();
  CGFloat v44 = v43;
  CGFloat rect = v45;
  double v136 = v47;
  double v137 = v46;
  v48 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v49 = [v48 userInterfaceIdiom];

  double v133 = 0.0;
  if ((v49 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v50 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v51 = [v50 userInterfaceLayoutDirection];

    if (v51 != 1)
    {
      v149.origin.double x = v26;
      v149.size.CGFloat height = v32;
      v149.size.CGFloat width = v141;
      v149.origin.CGFloat y = v142;
      double MaxX = CGRectGetMaxX(v149);
      v150.origin.double x = v44;
      v150.origin.CGFloat y = rect;
      v150.size.CGFloat height = v136;
      v150.size.CGFloat width = v137;
      double v133 = MaxX - CGRectGetWidth(v150);
    }
  }
  -[CCUIOverlayStatusBarPresentationProvider _edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:](self, "_edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:", v5, v137, v136, v139, v142, v141, v32, v37, *(void *)&v39, v41, *(void *)&v135);
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  if ((unint64_t)(v5 - 3) <= 1)
  {
    v61 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v62 = [v61 userInterfaceIdiom];

    double v53 = v54;
    if (!v62)
    {
      [(CCUIOverlayStatusBarPresentationProvider *)self _additionalHeaderHeight];
      double v53 = v54 + v63;
    }
  }
  objc_msgSend(v4, "setOverlayContentLayoutInset:", v53, v56, v58, v60);
  if ((unint64_t)(v5 - 1) >= 2) {
    double v64 = -0.0;
  }
  else {
    double v64 = v138;
  }
  objc_msgSend(v4, "setOverlayContentLayoutOffset:", *MEMORY[0x1E4F1DAD8], v64 + *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v131 = v64 + v54;
  -[CCUIOverlayStatusBarPresentationProvider _headerViewFrameForContentSize:withinBounds:contentInset:contentEdgeInsets:orientation:](self, "_headerViewFrameForContentSize:withinBounds:contentInset:contentEdgeInsets:orientation:", v5, v137, v136, v139, v142, v141, v140, v64 + v54, *(void *)&v56, *(void *)&v58, *(void *)&v60, v37, *(void *)&v39, v41, *(void *)&v135);
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  double v72 = v64 + v71;
  v73 = [v3 overlayHeaderView];
  objc_msgSend(v73, "setFrame:", v66, v72, v68, v70);

  v74 = [v3 overlayHeaderView];
  [v74 setInterfaceOrientation:v5];

  [(CCUIOverlayStatusBarPresentationProvider *)self _effectiveTransitionHeight];
  double v76 = v75;
  v151.origin.double x = v66;
  v151.origin.CGFloat y = v72;
  v151.size.CGFloat width = v68;
  v151.size.CGFloat height = v70;
  double Height = CGRectGetHeight(v151);
  double v78 = fmin(v76, Height - CCUIStatusBarHeight());
  v79 = [v3 overlayHeaderView];
  double v80 = 0.0;
  objc_msgSend(v79, "setEdgeInsets:", v78, 0.0, 0.0, 0.0);

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  v81 = [v3 overlayHeaderLayers];
  uint64_t v82 = [v81 countByEnumeratingWithState:&v143 objects:v147 count:16];
  if (v82)
  {
    uint64_t v83 = v82;
    uint64_t v84 = *(void *)v144;
    do
    {
      for (uint64_t i = 0; i != v83; ++i)
      {
        if (*(void *)v144 != v84) {
          objc_enumerationMutation(v81);
        }
        objc_msgSend(*(id *)(*((void *)&v143 + 1) + 8 * i), "setFrame:", v66, v72, v68, v70);
      }
      uint64_t v83 = [v81 countByEnumeratingWithState:&v143 objects:v147 count:16];
    }
    while (v83);
  }

  v86 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v87 = [v86 userInterfaceIdiom];

  if ((v87 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v88 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v80 = 0.0;
    if ([v88 userInterfaceLayoutDirection] == 1)
    {
      v152.origin.double x = v139;
      v152.size.CGFloat height = v140;
      v152.size.CGFloat width = v141;
      v152.origin.CGFloat y = v142;
      double Width = CGRectGetWidth(v152);
      v153.origin.double x = v133;
      v153.origin.CGFloat y = rect;
      v153.size.CGFloat height = v136;
      v153.size.CGFloat width = v137;
      double v80 = Width - CGRectGetMaxX(v153);
    }
  }
  v90 = [v4 overlayStatusBarStyle];
  [v90 statusBarInsets];
  double v92 = v91;
  double v94 = v93;
  double v129 = v95;
  double v97 = v96;

  double v130 = v39;
  v98 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v99 = [v98 userInterfaceIdiom];

  double v100 = -0.0;
  if ((v99 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v100 = v133;
  }
  double v101 = v80 + v39 + v94 + 4.0 + 35.0 + v100;
  v102 = [v3 overlayHeaderView];
  v103 = [v102 statusBar];
  objc_msgSend(v103, "setCompactEdgeInsets:", v92, v101, 0.0, v97);

  v154.origin.double x = v139;
  v154.size.CGFloat height = v140;
  v154.size.CGFloat width = v141;
  v154.origin.CGFloat y = v142;
  double v104 = CGRectGetWidth(v154);
  double v105 = v138 + v92;
  double v106 = CCUIStatusBarHeight() - (v92 + v129);
  v107 = [v3 overlayLeadingStatusBar];
  objc_msgSend(v107, "setFrame:", v94 + 0.0, v105, v104 - (v94 + v97), v106);

  double v108 = v130 + v133 + v80;
  v109 = [v3 overlayHeaderView];
  v110 = [v109 statusBar];
  objc_msgSend(v110, "setExpandedEdgeInsets:", 0.0, v108, 0.0, v135);

  v111 = [v3 overlayHeaderView];
  objc_msgSend(v111, "setSensorAttributionEdgeInsets:", 0.0, v108, 0.0, v135);

  v112 = [v3 overlayStatusLabelViewController];
  objc_msgSend(v112, "setEdgeInsets:", 0.0, v108, 0.0, v135);

  v155.origin.double x = v133;
  v155.origin.CGFloat y = rect;
  v155.size.CGFloat width = v137;
  v155.size.CGFloat height = v136;
  CGFloat v113 = v131 + CGRectGetHeight(v155);
  [(CCUIOverlayStatusBarPresentationProvider *)self _additionalHeaderOffsetForEditing:[(CCUIOverlayStatusBarPresentationProvider *)self _isEditing] ^ 1];
  v156.origin.double x = v139;
  v156.size.CGFloat height = v140;
  v156.size.CGFloat width = v141;
  v156.origin.CGFloat y = v142;
  CGRectGetHeight(v156);
  v157.origin.double x = v133;
  v157.origin.CGFloat y = v113;
  v157.size.CGFloat width = v137;
  v157.size.CGFloat height = v136;
  CGRectGetMinY(v157);
  UIRectInsetEdges();
  CGFloat v115 = v114;
  CGFloat v117 = v116;
  double v119 = v118;
  double v121 = v120;
  v122 = [v3 editingAccessoryView];
  objc_msgSend(v122, "sizeThatFits:", v119, v121);

  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  double x = v158.origin.x;
  double v124 = v158.size.width;
  double v125 = v158.size.height;
  double MinY = CGRectGetMinY(v158);
  v159.origin.double x = v115;
  v159.origin.CGFloat y = v117;
  v159.size.CGFloat width = v119;
  v159.size.CGFloat height = v121;
  double v127 = fmin(MinY, CGRectGetMinY(v159) + 30.0);
  v128 = objc_msgSend(v3, "editingAccessoryView", v132);
  objc_msgSend(v128, "setFrame:", x, v127, v124, v125);
}

- (BOOL)_isEditing
{
  v2 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
  char v3 = [v2 isEditing];

  return v3;
}

- (double)_additionalHeaderHeight
{
  char v3 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
  double v4 = [v3 overlayHeaderView];
  uint64_t v5 = [(CCUIOverlayStatusBarPresentationProvider *)self metricsProvider];
  objc_msgSend(v4, "additionalHeightForOrientation:", objc_msgSend(v5, "overlayInterfaceOrientation"));
  double v7 = v6;

  return v7;
}

- (CCUIOverlayViewProvider)viewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);

  return (CCUIOverlayViewProvider *)WeakRetained;
}

- (CCUIOverlayMetricsProvider)metricsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsProvider);

  return (CCUIOverlayMetricsProvider *)WeakRetained;
}

- (uint64_t)_headerViewFrameForContentSize:(double)a3 withinBounds:(CGFloat)a4 contentInset:(CGFloat)a5 contentEdgeInsets:(CGFloat)a6 orientation:(CGFloat)a7
{
  if ((unint64_t)(a9 - 1) < 2
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        double v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 userInterfaceIdiom],
        v14,
        (v15 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    [a1 _additionalHeaderOffset];
    v17.origin.double x = a4;
    v17.origin.CGFloat y = a5;
    v17.size.CGFloat width = a6;
    v17.size.CGFloat height = a7;
    CGRectGetWidth(v17);
    return [a1 _effectiveHeaderViewHeight];
  }
  else
  {
    v18.origin.double x = a4;
    v18.origin.CGFloat y = a5;
    v18.size.CGFloat width = a6;
    v18.size.CGFloat height = a7;
    CGRectGetWidth(v18);
    return [a1 _additionalHeaderHeight];
  }
}

- (double)_effectiveTransitionHeight
{
  double v3 = CCUIPortraitHeaderHeight();
  double v4 = v3 - CCUIStatusBarHeight();
  [(CCUIOverlayStatusBarPresentationProvider *)self _additionalHeaderHeight];
  return v4 + v5;
}

- (BOOL)isPanDismissalAvailable
{
  return 1;
}

- (BOOL)isZoomEnabled
{
  return 1;
}

- (BOOL)allowHotPocketDuringTransition
{
  return 0;
}

- (BOOL)backdropViewShouldUseAlphaTransformer
{
  return [MEMORY[0x1E4F5AE08] _controlCenterBackgroundRecipe] == 21;
}

- (id)transitionStateForType:(unint64_t)a3 interactive:(BOOL)a4 translation:(CGPoint)a5
{
  double y = a5.y;
  CGFloat x = a5.x;
  BOOL v7 = a4;
  v10 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
  double v11 = [(CCUIOverlayStatusBarPresentationProvider *)self metricsProvider];
  if ((unint64_t)([v11 overlayInterfaceOrientation] - 3) > 1
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        double v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 userInterfaceIdiom],
        v12,
        v13))
  {
    [(CCUIOverlayStatusBarPresentationProvider *)self _effectiveTransitionHeight];
  }
  else
  {
    [(CCUIOverlayStatusBarPresentationProvider *)self _presentedViewFrame];
    double MinY = CGRectGetMinY(v32);
  }
  if (a3 != 1) {
    double MinY = -MinY;
  }
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  double v23 = __91__CCUIOverlayStatusBarPresentationProvider_transitionStateForType_interactive_translation___block_invoke;
  double v24 = &unk_1E6A898D0;
  id v25 = v11;
  id v26 = v10;
  CGFloat v27 = x;
  double v28 = y;
  double v29 = MinY;
  unint64_t v30 = a3;
  double v15 = y / MinY;
  id v16 = v10;
  id v17 = v11;
  double v18 = __91__CCUIOverlayStatusBarPresentationProvider_transitionStateForType_interactive_translation___block_invoke((uint64_t)&v21);
  double v19 = +[CCUIOverlayTransitionState stateWithType:interactive:progress:pagingProgress:](CCUIOverlayTransitionState, "stateWithType:interactive:progress:pagingProgress:", a3, v7, v15, v18, v21, v22, v23, v24);

  return v19;
}

double __91__CCUIOverlayStatusBarPresentationProvider_transitionStateForType_interactive_translation___block_invoke(uint64_t a1)
{
  double v2 = 0.0;
  if ((unint64_t)[*(id *)(a1 + 32) overlayPageCount] >= 2)
  {
    double v3 = [*(id *)(a1 + 40) overlayPageControl];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = [*(id *)(a1 + 40) pagingView];
    objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v23.origin.CGFloat x = v14;
    v23.origin.double y = v16;
    v23.size.CGFloat width = v18;
    v23.size.CGFloat height = v20;
    double v21 = fmin(fmax((*(double *)(a1 + 56) - *(double *)(a1 + 64)) / (CGRectGetMinY(v23) - *(double *)(a1 + 64)), 0.0), 1.0);
    if (*(void *)(a1 + 72) == 1) {
      double v2 = v21;
    }
    else {
      double v2 = 0.0;
    }
  }
  return v2;
}

- (unint64_t)finalTransitionTypeForState:(id)a3 gestureTranslation:(CGPoint)a4 gestureVelocity:(CGPoint)a5
{
  id v5 = a3;
  int v6 = BSFloatGreaterThanOrEqualToFloat();
  uint64_t v7 = [v5 type];
  if (v6)
  {
    if (v7 == 1)
    {
      unint64_t v8 = BSFloatGreaterThanFloat();
    }
    else if (BSFloatLessThanFloat())
    {
      unint64_t v8 = 2;
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    if (v7 == 1) {
      [v5 snappedStatusBarPresentationProgress];
    }
    else {
      [v5 snappedPresentationProgress];
    }
    if (BSFloatIsOne()) {
      unint64_t v8 = 1;
    }
    else {
      unint64_t v8 = 2;
    }
  }

  return v8;
}

- (id)animationBatchForTransitionState:(id)a3 previousTransitionState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = objc_alloc_init(CCUIAnimationBatch);
  [(CCUIOverlayStatusBarPresentationProvider *)self _addLeadingStatusBarAlphaAnimationToBatch:v8 transitionState:v6];
  [(CCUIOverlayStatusBarPresentationProvider *)self _addHeaderContentTransformAnimationToBatch:v8 transitionState:v6];
  [(CCUIOverlayStatusBarPresentationProvider *)self _addHeaderSensorStatusViewAlphaAnimationToBatch:v8 transitionState:v6];
  BOOL v9 = +[CCUIOverlayTransitionState isSignificantStatusBarTransitionFrom:v7 to:v6];

  if (v9)
  {
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      [(CCUIOverlayStatusBarPresentationProvider *)self _addReducedMotionStatusBarStateAnimationToBatch:v8 transitionState:v6];
    }
    else
    {
      [(CCUIOverlayStatusBarPresentationProvider *)self _addStatusBarStateAnimationToBatch:v8 transitionState:v6];
      [(CCUIOverlayStatusBarPresentationProvider *)self _addStatusBarAlphaAnimationToBatch:v8 transitionState:v6];
    }
  }

  return v8;
}

- (id)moduleViewAnimationBatchForTransitionState:(id)a3 moduleView:(id)a4 layoutRect:(CCUILayoutRect *)a5
{
  id v8 = a4;
  id v9 = a3;
  double v10 = objc_alloc_init(CCUIAnimationBatch);
  CCUILayoutSize var1 = a5->var1;
  CCUILayoutPoint var0 = a5->var0;
  CCUILayoutSize v16 = var1;
  [(CCUIOverlayStatusBarPresentationProvider *)self _addModuleTransformAnimationsToBatch:v10 transitionState:v9 moduleView:v8 layoutRect:&var0];
  CCUILayoutSize v12 = a5->var1;
  CCUILayoutPoint var0 = a5->var0;
  CCUILayoutSize v16 = v12;
  [(CCUIOverlayStatusBarPresentationProvider *)self _addModuleScaleAnimationsToBatch:v10 transitionState:v9 moduleView:v8 layoutRect:&var0];
  CCUILayoutSize v13 = a5->var1;
  CCUILayoutPoint var0 = a5->var0;
  CCUILayoutSize v16 = v13;
  [(CCUIOverlayStatusBarPresentationProvider *)self _addModuleAlphaAnimationsToBatch:v10 transitionState:v9 moduleView:v8 layoutRect:&var0];

  return v10;
}

- (unint64_t)headerMode
{
  return 2;
}

- (id)secondaryAnimationBatchForTransitionState:(id)a3 previousTransitionState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(CCUIAnimationBatch);
  [(CCUIOverlayStatusBarPresentationProvider *)self _addBackgroundViewWeightingAnimationToBatch:v8 transitionState:v6];
  [(CCUIOverlayStatusBarPresentationProvider *)self _addPageContentTransformAnimationsToBatch:v8 transitionState:v6];
  [(CCUIOverlayStatusBarPresentationProvider *)self _addModuleTransformAnimationsToBatch:v8 transitionState:v6];
  BOOL v9 = +[CCUIOverlayTransitionState isSignificantTransitionFrom:v7 to:v6];

  if (v9)
  {
    [(CCUIOverlayStatusBarPresentationProvider *)self _addModuleScaleAnimationsToBatch:v8 transitionState:v6];
    [(CCUIOverlayStatusBarPresentationProvider *)self _addModuleAlphaAnimationsToBatch:v8 transitionState:v6];
    [(CCUIOverlayStatusBarPresentationProvider *)self _addAccessoryScaleAnimationsToBatch:v8 transitionState:v6];
    [(CCUIOverlayStatusBarPresentationProvider *)self _addAccessoryAlphaAnimationsToBatch:v8 transitionState:v6];
  }

  return v8;
}

- (id)prepareForPresentation
{
  double v3 = objc_alloc_init(CCUIAnimationBatch);
  double v4 = [(CCUIOverlayStatusBarPresentationProvider *)self metricsProvider];
  id v5 = [v4 overlayStatusBarStyle];
  int v6 = [v5 isHidden];

  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__CCUIOverlayStatusBarPresentationProvider_prepareForPresentation__block_invoke;
    v12[3] = &unk_1E6A898F8;
    v12[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v12];
    id v7 = [(id)objc_opt_class() _hiddenStatusBarFadeAnimationParameters];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__CCUIOverlayStatusBarPresentationProvider_prepareForPresentation__block_invoke_2;
    v11[3] = &unk_1E6A898F8;
    v11[4] = self;
    id v8 = +[CCUIAnimation animationWithParameters:v7 animations:v11];
    [(CCUIAnimationBatch *)v3 addAnimation:v8];
  }
  else
  {
    BOOL v9 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
    [v9 setOverlayStatusBarHidden:0];
  }

  return v3;
}

void __66__CCUIOverlayStatusBarPresentationProvider_prepareForPresentation__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewProvider];
  [v1 setOverlayStatusBarHidden:1];
}

void __66__CCUIOverlayStatusBarPresentationProvider_prepareForPresentation__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewProvider];
  [v1 setOverlayStatusBarHidden:0];
}

- (id)cleanupForDismissal
{
  double v3 = objc_alloc_init(CCUIAnimationBatch);
  double v4 = [(CCUIOverlayStatusBarPresentationProvider *)self metricsProvider];
  id v5 = [v4 overlayStatusBarStyle];
  int v6 = [v5 isHidden];

  if (v6)
  {
    id v7 = [(id)objc_opt_class() _hiddenStatusBarFadeAnimationParameters];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__CCUIOverlayStatusBarPresentationProvider_cleanupForDismissal__block_invoke;
    v11[3] = &unk_1E6A898F8;
    v11[4] = self;
    id v8 = +[CCUIAnimation animationWithParameters:v7 animations:v11];
    [(CCUIAnimationBatch *)v3 addAnimation:v8];
  }
  else
  {
    BOOL v9 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
    [v9 setOverlayStatusBarHidden:1];
  }

  return v3;
}

void __63__CCUIOverlayStatusBarPresentationProvider_cleanupForDismissal__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewProvider];
  [v1 setOverlayStatusBarHidden:1];
}

- (id)transitionBetweenEditing
{
  double v3 = objc_alloc_init(CCUIAnimationBatch);
  BOOL v4 = [(CCUIOverlayStatusBarPresentationProvider *)self _isEditing];
  id v5 = [(id)objc_opt_class() _editingC2AnimationParametersToEditing:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CCUIOverlayStatusBarPresentationProvider_transitionBetweenEditing__block_invoke;
  v8[3] = &unk_1E6A89920;
  v8[4] = self;
  BOOL v9 = v4;
  int v6 = +[CCUIAnimation animationWithParameters:v5 animations:v8];
  [(CCUIAnimationBatch *)v3 addAnimation:v6];

  return v3;
}

void __68__CCUIOverlayStatusBarPresentationProvider_transitionBetweenEditing__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) viewProvider];
  double v2 = [v8 overlayHeaderView];
  double v3 = v2;
  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  [v2 setAlpha:v4];

  id v5 = [v8 editingAccessoryView];
  int v6 = v5;
  if (*(unsigned char *)(a1 + 40)) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  [v5 setAlpha:v7];

  [*(id *)(a1 + 32) layoutViews];
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
  return 1;
}

- (CGRect)_presentedViewFrame
{
  double v3 = [(CCUIOverlayStatusBarPresentationProvider *)self metricsProvider];
  [v3 overlayContainerFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 overlayContentSize];
  BSRectWithSize();
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [v3 overlayInterfaceOrientation];
  -[CCUIOverlayStatusBarPresentationProvider _edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:](self, "_edgeInsetsForContentSize:withinBounds:contentEdgeInsets:orientation:", v16, v13, v15, v5, v7, v9, v11, *MEMORY[0x1E4FB2848], *(void *)(MEMORY[0x1E4FB2848] + 8), *(void *)(MEMORY[0x1E4FB2848] + 16), *(void *)(MEMORY[0x1E4FB2848] + 24));
  double v18 = v5 + v17;
  double v20 = v7 + v19;
  double v22 = v9 - (v17 + v21);
  double v24 = v11 - (v19 + v23);

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.double y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

+ (id)_hiddenStatusBarFadeAnimationParameters
{
  if (_hiddenStatusBarFadeAnimationParameters_onceToken != -1) {
    dispatch_once(&_hiddenStatusBarFadeAnimationParameters_onceToken, &__block_literal_global_0);
  }
  double v2 = (void *)_hiddenStatusBarFadeAnimationParameters_parameters;

  return v2;
}

void __83__CCUIOverlayStatusBarPresentationProvider__hiddenStatusBarFadeAnimationParameters__block_invoke()
{
  double v2 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  [(CCUIMutableCABasicAnimationParameters *)v2 setDuration:0.35];
  uint64_t v0 = [(CCUIMutableCABasicAnimationParameters *)v2 copy];
  id v1 = (void *)_hiddenStatusBarFadeAnimationParameters_parameters;
  _hiddenStatusBarFadeAnimationParameters_parameters = v0;
}

+ (id)_baseC2AnimationParametersForTransitionState:(id)a3
{
  id v3 = a3;
  if (_baseC2AnimationParametersForTransitionState__onceToken != -1) {
    dispatch_once(&_baseC2AnimationParametersForTransitionState__onceToken, &__block_literal_global_12);
  }
  if ([v3 isInteractive])
  {
    double v4 = (void *)_baseC2AnimationParametersForTransitionState__baseInteractiveParameters;
  }
  else
  {
    [v3 clampedPresentationProgress];
    if (BSFloatIsZero())
    {
      double v4 = (void *)_baseC2AnimationParametersForTransitionState__baseDismissParameters;
    }
    else
    {
      BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      double v6 = &_baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters;
      if (!IsReduceMotionEnabled) {
        double v6 = &_baseC2AnimationParametersForTransitionState__basePresentParameters;
      }
      double v4 = (void *)*v6;
    }
  }
  id v7 = v4;

  return v7;
}

void __89__CCUIOverlayStatusBarPresentationProvider__baseC2AnimationParametersForTransitionState___block_invoke()
{
  double v11 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  [(CCUIMutableC2AnimationParameters *)v11 setTension:250.0];
  [(CCUIMutableC2AnimationParameters *)v11 setFriction:22.0];
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v11, "setFrameRateRange:", *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
  [(CCUIMutableC2AnimationParameters *)v11 setHighFrameRateReason:2031617];
  uint64_t v0 = [(CCUIMutableC2AnimationParameters *)v11 copy];
  id v1 = (void *)_baseC2AnimationParametersForTransitionState__basePresentParameters;
  _baseC2AnimationParametersForTransitionState__basePresentParameters = v0;

  double v2 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  [(CCUIMutableC2AnimationParameters *)v2 setTension:250.0];
  [(CCUIMutableC2AnimationParameters *)v2 setFriction:30.0];
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v2, "setFrameRateRange:", *(double *)&v14.minimum, *(double *)&v14.maximum, *(double *)&v14.preferred);
  [(CCUIMutableC2AnimationParameters *)v2 setHighFrameRateReason:2031617];
  uint64_t v3 = [(CCUIMutableC2AnimationParameters *)v2 copy];
  double v4 = (void *)_baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters;
  _baseC2AnimationParametersForTransitionState__baseReduceMotionPresentParameters = v3;

  double v5 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  [(CCUIMutableC2AnimationParameters *)v5 setTension:436.1];
  [(CCUIMutableC2AnimationParameters *)v5 setFriction:41.8];
  CAFrameRateRange v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v5, "setFrameRateRange:", *(double *)&v15.minimum, *(double *)&v15.maximum, *(double *)&v15.preferred);
  [(CCUIMutableC2AnimationParameters *)v5 setHighFrameRateReason:2031617];
  uint64_t v6 = [(CCUIMutableC2AnimationParameters *)v5 copy];
  id v7 = (void *)_baseC2AnimationParametersForTransitionState__baseDismissParameters;
  _baseC2AnimationParametersForTransitionState__baseDismissParameters = v6;

  double v8 = objc_alloc_init(CCUIMutableC2AnimationParameters);
  [(CCUIMutableC2AnimationParameters *)v8 setInteractive:1];
  [(CCUIMutableC2AnimationParameters *)v8 setTension:1754.61];
  [(CCUIMutableC2AnimationParameters *)v8 setFriction:72.05];
  CAFrameRateRange v16 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CCUIMutableC2AnimationParameters setFrameRateRange:](v8, "setFrameRateRange:", *(double *)&v16.minimum, *(double *)&v16.maximum, *(double *)&v16.preferred);
  [(CCUIMutableC2AnimationParameters *)v8 setHighFrameRateReason:2031617];
  uint64_t v9 = [(CCUIMutableC2AnimationParameters *)v8 copy];
  double v10 = (void *)_baseC2AnimationParametersForTransitionState__baseInteractiveParameters;
  _baseC2AnimationParametersForTransitionState__baseInteractiveParameters = v9;
}

+ (id)_leadingStatusBarCAAnimationParametersForTransitionState:(id)a3
{
  uint64_t v3 = _leadingStatusBarCAAnimationParametersForTransitionState__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_leadingStatusBarCAAnimationParametersForTransitionState__onceToken, &__block_literal_global_15);
  }
  [v4 snappedStatusBarPresentationProgress];

  int IsOne = BSFloatIsOne();
  uint64_t v6 = &_leadingStatusBarCAAnimationParametersForTransitionState__presentParameters;
  if (!IsOne) {
    uint64_t v6 = &_leadingStatusBarCAAnimationParametersForTransitionState__dismissParameters;
  }
  id v7 = (void *)*v6;

  return v7;
}

void __101__CCUIOverlayStatusBarPresentationProvider__leadingStatusBarCAAnimationParametersForTransitionState___block_invoke()
{
  double v5 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  [(CCUIMutableCASpringAnimationParameters *)v5 setMass:1.0];
  [(CCUIMutableCASpringAnimationParameters *)v5 setStiffness:500.0];
  [(CCUIMutableCASpringAnimationParameters *)v5 setDamping:50.0];
  uint64_t v0 = [(CCUIMutableCASpringAnimationParameters *)v5 copy];
  id v1 = (void *)_leadingStatusBarCAAnimationParametersForTransitionState__presentParameters;
  _leadingStatusBarCAAnimationParametersForTransitionState__presentParameters = v0;

  double v2 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  [(CCUIMutableCASpringAnimationParameters *)v2 setMass:1.0];
  [(CCUIMutableCASpringAnimationParameters *)v2 setStiffness:525.0];
  [(CCUIMutableCASpringAnimationParameters *)v2 setDamping:50.0];
  uint64_t v3 = [(CCUIMutableCASpringAnimationParameters *)v2 copy];
  id v4 = (void *)_leadingStatusBarCAAnimationParametersForTransitionState__dismissParameters;
  _leadingStatusBarCAAnimationParametersForTransitionState__dismissParameters = v3;
}

+ (id)_trailingStatusBarCAAnimationParametersForTransitionState:(id)a3
{
  uint64_t v3 = _trailingStatusBarCAAnimationParametersForTransitionState__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_trailingStatusBarCAAnimationParametersForTransitionState__onceToken, &__block_literal_global_18);
  }
  [v4 snappedStatusBarPresentationProgress];

  int IsOne = BSFloatIsOne();
  uint64_t v6 = &_trailingStatusBarCAAnimationParametersForTransitionState__presentParameters;
  if (!IsOne) {
    uint64_t v6 = &_trailingStatusBarCAAnimationParametersForTransitionState__dismissParameters;
  }
  id v7 = (void *)*v6;

  return v7;
}

void __102__CCUIOverlayStatusBarPresentationProvider__trailingStatusBarCAAnimationParametersForTransitionState___block_invoke()
{
  double v5 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  [(CCUIMutableCASpringAnimationParameters *)v5 setMass:1.0];
  [(CCUIMutableCASpringAnimationParameters *)v5 setStiffness:150.0];
  [(CCUIMutableCASpringAnimationParameters *)v5 setDamping:50.0];
  uint64_t v0 = [(CCUIMutableCASpringAnimationParameters *)v5 copy];
  id v1 = (void *)_trailingStatusBarCAAnimationParametersForTransitionState__presentParameters;
  _trailingStatusBarCAAnimationParametersForTransitionState__presentParameters = v0;

  double v2 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  [(CCUIMutableCASpringAnimationParameters *)v2 setMass:1.0];
  [(CCUIMutableCASpringAnimationParameters *)v2 setStiffness:525.0];
  [(CCUIMutableCASpringAnimationParameters *)v2 setDamping:50.0];
  uint64_t v3 = [(CCUIMutableCASpringAnimationParameters *)v2 copy];
  id v4 = (void *)_trailingStatusBarCAAnimationParametersForTransitionState__dismissParameters;
  _trailingStatusBarCAAnimationParametersForTransitionState__dismissParameters = v3;
}

+ (id)_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState:(id)a3
{
  uint64_t v3 = _compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken, &__block_literal_global_20);
  }
  [v4 snappedStatusBarPresentationProgress];

  int IsOne = BSFloatIsOne();
  uint64_t v6 = &_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  if (!IsOne) {
    uint64_t v6 = &_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  }
  id v7 = (void *)*v6;

  return v7;
}

void __114__CCUIOverlayStatusBarPresentationProvider__compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState___block_invoke()
{
  uint64_t v6 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  [(CCUIMutableCABasicAnimationParameters *)v6 setDuration:0.1321];
  uint64_t v0 = *MEMORY[0x1E4F3A490];
  [(CCUIMutableCABasicAnimationParameters *)v6 setTimingFunction:*MEMORY[0x1E4F3A490]];
  uint64_t v1 = [(CCUIMutableCABasicAnimationParameters *)v6 copy];
  double v2 = (void *)_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  _compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters = v1;

  uint64_t v3 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  [(CCUIMutableCABasicAnimationParameters *)v3 setDuration:0.1321];
  [(CCUIMutableCABasicAnimationParameters *)v3 setTimingFunction:v0];
  uint64_t v4 = [(CCUIMutableCABasicAnimationParameters *)v3 copy];
  double v5 = (void *)_compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  _compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters = v4;
}

+ (id)_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState:(id)a3
{
  uint64_t v3 = _expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken, &__block_literal_global_22);
  }
  [v4 snappedStatusBarPresentationProgress];

  int IsOne = BSFloatIsOne();
  uint64_t v6 = &_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  if (!IsOne) {
    uint64_t v6 = &_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  }
  id v7 = (void *)*v6;

  return v7;
}

void __114__CCUIOverlayStatusBarPresentationProvider__expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState___block_invoke()
{
  uint64_t v6 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  [(CCUIMutableCABasicAnimationParameters *)v6 setDuration:0.2525];
  uint64_t v0 = *MEMORY[0x1E4F3A490];
  [(CCUIMutableCABasicAnimationParameters *)v6 setTimingFunction:*MEMORY[0x1E4F3A490]];
  uint64_t v1 = [(CCUIMutableCABasicAnimationParameters *)v6 copy];
  double v2 = (void *)_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  _expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters = v1;

  uint64_t v3 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  [(CCUIMutableCABasicAnimationParameters *)v3 setDuration:0.0725];
  [(CCUIMutableCABasicAnimationParameters *)v3 setTimingFunction:v0];
  uint64_t v4 = [(CCUIMutableCABasicAnimationParameters *)v3 copy];
  double v5 = (void *)_expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  _expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters = v4;
}

+ (id)_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState:(id)a3
{
  uint64_t v3 = _expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__onceToken, &__block_literal_global_24);
  }
  [v4 snappedStatusBarPresentationProgress];

  int IsOne = BSFloatIsOne();
  uint64_t v6 = &_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  if (!IsOne) {
    uint64_t v6 = &_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  }
  id v7 = (void *)*v6;

  return v7;
}

void __115__CCUIOverlayStatusBarPresentationProvider__expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState___block_invoke()
{
  uint64_t v6 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  [(CCUIMutableCABasicAnimationParameters *)v6 setDuration:0.0925];
  uint64_t v0 = *MEMORY[0x1E4F3A490];
  [(CCUIMutableCABasicAnimationParameters *)v6 setTimingFunction:*MEMORY[0x1E4F3A490]];
  uint64_t v1 = [(CCUIMutableCABasicAnimationParameters *)v6 copy];
  double v2 = (void *)_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters;
  _expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__presentParameters = v1;

  uint64_t v3 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  [(CCUIMutableCABasicAnimationParameters *)v3 setDuration:0.1321];
  [(CCUIMutableCABasicAnimationParameters *)v3 setTimingFunction:v0];
  uint64_t v4 = [(CCUIMutableCABasicAnimationParameters *)v3 copy];
  double v5 = (void *)_expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters;
  _expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState__dismissParameters = v4;
}

+ (id)_reducedMotionStatusBarStateCAAnimationParameters
{
  if (_reducedMotionStatusBarStateCAAnimationParameters_onceToken != -1) {
    dispatch_once(&_reducedMotionStatusBarStateCAAnimationParameters_onceToken, &__block_literal_global_26);
  }
  double v2 = (void *)_reducedMotionStatusBarStateCAAnimationParameters_parameters;

  return v2;
}

void __93__CCUIOverlayStatusBarPresentationProvider__reducedMotionStatusBarStateCAAnimationParameters__block_invoke()
{
  double v2 = objc_alloc_init(CCUIMutableCABasicAnimationParameters);
  [(CCUIMutableCABasicAnimationParameters *)v2 setDuration:0.35];
  uint64_t v0 = [(CCUIMutableCABasicAnimationParameters *)v2 copy];
  uint64_t v1 = (void *)_reducedMotionStatusBarStateCAAnimationParameters_parameters;
  _reducedMotionStatusBarStateCAAnimationParameters_parameters = v0;
}

+ (id)_moduleC2AnimationParametersForTransitionState:(id)a3 layoutRect:(CCUILayoutRect *)a4
{
  double v5 = [a1 _baseC2AnimationParametersForTransitionState:a3];
  uint64_t v6 = (void *)[v5 mutableCopy];

  [v6 tension];
  double v8 = v7;
  double v9 = 0.0;
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  double v11 = 0.0;
  if (!IsReduceMotionEnabled) {
    double v11 = (double)a4->var0.var1 * -10.0;
  }
  [v6 setTension:v8 + v11];
  [v6 friction];
  double v13 = v12;
  if (!UIAccessibilityIsReduceMotionEnabled()) {
    double v9 = (double)a4->var0.var1 * 3.0;
  }
  [v6 setFriction:v13 + v9];

  return v6;
}

+ (id)_moduleScaleCAAnimationParametersForTransitionState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  uint64_t v5 = [v3 type];

  [(CCUIMutableCASpringAnimationParameters *)v4 setMass:1.0];
  double v6 = dbl_1D7BBF500[v5 == 1];
  [(CCUIMutableCASpringAnimationParameters *)v4 setStiffness:dbl_1D7BBF4F0[v5 == 1]];
  [(CCUIMutableCASpringAnimationParameters *)v4 setDamping:v6];

  return v4;
}

+ (id)_moduleAlphaCAAnimationParametersForTransitionState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(CCUIMutableCASpringAnimationParameters);
  uint64_t v5 = [v3 type];

  [(CCUIMutableCASpringAnimationParameters *)v4 setMass:1.0];
  double v6 = dbl_1D7BBF520[v5 == 1];
  [(CCUIMutableCASpringAnimationParameters *)v4 setStiffness:dbl_1D7BBF510[v5 == 1]];
  [(CCUIMutableCASpringAnimationParameters *)v4 setDamping:v6];

  return v4;
}

+ (id)_editingC2AnimationParametersToEditing:(BOOL)a3
{
  id v3 = objc_alloc_init(CCUIMutableC2AnimationParameters);
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
  double v13 = __104__CCUIOverlayStatusBarPresentationProvider__addBackgroundViewWeightingAnimationToBatch_transitionState___block_invoke;
  CAFrameRateRange v14 = &unk_1E6A89968;
  CAFrameRateRange v15 = self;
  id v16 = v6;
  id v9 = v6;
  double v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __104__CCUIOverlayStatusBarPresentationProvider__addBackgroundViewWeightingAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) viewProvider];
  id v3 = [v2 overlayBackgroundView];

  [*(id *)(a1 + 40) clampedPresentationProgress];
  objc_msgSend(v3, "setWeighting:");
}

- (void)_addLeadingStatusBarAlphaAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(id)objc_opt_class() _baseC2AnimationParametersForTransitionState:v6];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __102__CCUIOverlayStatusBarPresentationProvider__addLeadingStatusBarAlphaAnimationToBatch_transitionState___block_invoke;
  CAFrameRateRange v14 = &unk_1E6A89968;
  CAFrameRateRange v15 = self;
  id v16 = v6;
  id v9 = v6;
  double v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __102__CCUIOverlayStatusBarPresentationProvider__addLeadingStatusBarAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) viewProvider];
  id v3 = [v2 overlayLeadingStatusBar];

  [*(id *)(a1 + 32) _leadingStatusBarAlphaForTransitionState:*(void *)(a1 + 40)];
  objc_msgSend(v3, "setAlpha:");
}

- (double)_leadingStatusBarAlphaForTransitionState:(id)a3
{
  [a3 clampedPresentationProgress];
  return 1.0 - v3;
}

- (void)_addHeaderContentTransformAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(id)objc_opt_class() _baseC2AnimationParametersForTransitionState:v6];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __103__CCUIOverlayStatusBarPresentationProvider__addHeaderContentTransformAnimationToBatch_transitionState___block_invoke;
  CAFrameRateRange v14 = &unk_1E6A89968;
  CAFrameRateRange v15 = self;
  id v16 = v6;
  id v9 = v6;
  double v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __103__CCUIOverlayStatusBarPresentationProvider__addHeaderContentTransformAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) viewProvider];
  double v3 = [v2 overlayHeaderView];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 _headerViewTransformForTransitionState:*(void *)(a1 + 40)];
  }
  long long v10 = v13;
  long long v11 = v14;
  long long v12 = v15;
  [v3 setContentTransform:&v10];
  uint64_t v5 = [*(id *)(a1 + 32) viewProvider];
  id v6 = [v5 overlayHeaderView];
  id v7 = [v6 statusBar];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  double v8 = *(void **)(a1 + 32);
  if (v8) {
    [v8 _compactStatusBar:v7 transformForTransitionState:*(void *)(a1 + 40)];
  }
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  [v3 setCompactScaleTransform:v9];
}

- (CGAffineTransform)_compactStatusBar:(SEL)a3 transformForTransitionState:(id)a4
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  objc_msgSend(a5, "clampedPresentationProgress", a4);
  double v8 = v7;
  [(CCUIOverlayStatusBarPresentationProvider *)self _effectiveTransitionHeight];
  double v10 = fmin(v8 * (v9 / (CCUIStatusBarHeight() * 0.75)), 1.0);
  long long v11 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
  long long v12 = [v11 overlayHeaderView];
  long long v13 = [v12 statusBar];
  [v13 maxCompactScaleFactor];
  double v15 = v14;

  return CGAffineTransformMakeScale(retstr, (v15 + -1.0) * v10 + 1.0, (v15 + -1.0) * v10 + 1.0);
}

- (CGAffineTransform)_headerViewTransformForTransitionState:(SEL)a3
{
  id v6 = a4;
  double v7 = [(CCUIOverlayStatusBarPresentationProvider *)self metricsProvider];
  uint64_t v8 = [v7 overlayInterfaceOrientation];
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  if ((unint64_t)(v8 - 3) > 1)
  {
    if ((unint64_t)(v8 - 1) < 2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [v6 clampedPresentationProgress];
  if (!BSFloatIsZero()
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        double v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 userInterfaceIdiom],
        v9,
        v10))
  {
LABEL_6:
    double v14 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v15 = [v14 userInterfaceIdiom];

    double v16 = 24.0;
    if ((v15 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
LABEL_8:
      [(CCUIOverlayStatusBarPresentationProvider *)self _transformForTransitionState:v6 rubberBandingHeight:v16];
      *(_OWORD *)&retstr->a = v18;
      *(_OWORD *)&retstr->c = v19;
      *(_OWORD *)&retstr->tCGFloat x = v20;
      goto LABEL_9;
    }
LABEL_7:
    UIAccessibilityIsReduceMotionEnabled();
    double v16 = 184.0;
    goto LABEL_8;
  }
  [(CCUIOverlayStatusBarPresentationProvider *)self _effectiveTransitionHeight];
  double v12 = v11;
  double v13 = CCUIStatusBarHeight();
  CGAffineTransformMakeTranslation(retstr, 0.0, -(v12 + v13 * 0.5));
LABEL_9:

  return result;
}

- (void)_addStatusBarStateAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(id)objc_opt_class() _leadingStatusBarCAAnimationParametersForTransitionState:v6];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarStateAnimationToBatch_transitionState___block_invoke;
  v20[3] = &unk_1E6A89968;
  v20[4] = self;
  id v9 = v6;
  id v21 = v9;
  uint64_t v10 = +[CCUIAnimation animationWithParameters:v8 delay:v20 animations:0.0];
  [v7 addAnimation:v10];

  double v11 = [(id)objc_opt_class() _trailingStatusBarCAAnimationParametersForTransitionState:v9];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  double v16 = __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarStateAnimationToBatch_transitionState___block_invoke_2;
  double v17 = &unk_1E6A89968;
  long long v18 = self;
  id v19 = v9;
  id v12 = v9;
  double v13 = +[CCUIAnimation animationWithParameters:v11 delay:&v14 animations:0.0];
  objc_msgSend(v7, "addAnimation:", v13, v14, v15, v16, v17, v18);
}

void __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarStateAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) viewProvider];
  double v3 = [v2 overlayHeaderView];
  id v4 = [v3 statusBar];

  [*(id *)(a1 + 40) snappedStatusBarPresentationProgress];
  [v4 setLeadingState:BSFloatIsOne()];
}

void __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarStateAnimationToBatch_transitionState___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) viewProvider];
  double v3 = [v2 overlayHeaderView];
  id v4 = [v3 statusBar];

  [*(id *)(a1 + 40) snappedStatusBarPresentationProgress];
  [v4 setTrailingState:BSFloatIsOne()];
}

- (void)_addStatusBarAlphaAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(id)objc_opt_class() _compactTrailingStatusBarAlphaCAAnimationParametersForTransitionState:v6];
  [v6 snappedStatusBarPresentationProgress];
  if (BSFloatIsOne()) {
    double v9 = 0.03;
  }
  else {
    double v9 = 0.05283;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke;
  v28[3] = &unk_1E6A89968;
  v28[4] = self;
  id v10 = v6;
  id v29 = v10;
  double v11 = +[CCUIAnimation animationWithParameters:v8 delay:v28 animations:v9];
  [v7 addAnimation:v11];

  id v12 = [(id)objc_opt_class() _expandedLeadingStatusBarAlphaCAAnimationParametersForTransitionState:v10];
  [v10 snappedStatusBarPresentationProgress];
  if (BSFloatIsOne()) {
    double v13 = 0.0025;
  }
  else {
    double v13 = 0.0;
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke_2;
  v26[3] = &unk_1E6A89968;
  v26[4] = self;
  id v14 = v10;
  id v27 = v14;
  uint64_t v15 = +[CCUIAnimation animationWithParameters:v12 delay:v26 animations:v13];
  [v7 addAnimation:v15];

  double v16 = [(id)objc_opt_class() _expandedTrailingStatusBarAlphaCAAnimationParametersForTransitionState:v14];
  [v14 snappedStatusBarPresentationProgress];
  if (BSFloatIsOne()) {
    double v17 = 0.0;
  }
  else {
    double v17 = 0.05283;
  }
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  double v22 = __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke_3;
  double v23 = &unk_1E6A89968;
  double v24 = self;
  id v25 = v14;
  id v18 = v14;
  id v19 = +[CCUIAnimation animationWithParameters:v16 delay:&v20 animations:v17];
  objc_msgSend(v7, "addAnimation:", v19, v20, v21, v22, v23, v24);
}

void __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) viewProvider];
  double v3 = [v2 overlayHeaderView];
  id v5 = [v3 statusBar];

  [*(id *)(a1 + 40) snappedStatusBarPresentationProgress];
  [v5 setCompactTrailingAlpha:1.0 - v4];
}

void __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) viewProvider];
  double v3 = [v2 overlayHeaderView];
  id v4 = [v3 statusBar];

  [*(id *)(a1 + 40) snappedStatusBarPresentationProgress];
  objc_msgSend(v4, "setLeadingAlpha:");
}

void __95__CCUIOverlayStatusBarPresentationProvider__addStatusBarAlphaAnimationToBatch_transitionState___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) viewProvider];
  double v3 = [v2 overlayHeaderView];
  id v4 = [v3 statusBar];

  [*(id *)(a1 + 40) snappedStatusBarPresentationProgress];
  objc_msgSend(v4, "setExpandedTrailingAlpha:");
}

- (void)_addHeaderSensorStatusViewAlphaAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(id)objc_opt_class() _baseC2AnimationParametersForTransitionState:v6];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __108__CCUIOverlayStatusBarPresentationProvider__addHeaderSensorStatusViewAlphaAnimationToBatch_transitionState___block_invoke;
  id v14 = &unk_1E6A89968;
  uint64_t v15 = self;
  id v16 = v6;
  id v9 = v6;
  id v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __108__CCUIOverlayStatusBarPresentationProvider__addHeaderSensorStatusViewAlphaAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) viewProvider];
  id v4 = [v2 overlayHeaderView];

  [*(id *)(a1 + 40) presentationProgress];
  objc_msgSend(v4, "setSensorStatusViewAlpha:", fmin(fmax((v3 + -0.88) / 0.07 + 0.0, 0.0), 1.0));
}

- (void)_addReducedMotionStatusBarStateAnimationToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(id)objc_opt_class() _reducedMotionStatusBarStateCAAnimationParameters];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __108__CCUIOverlayStatusBarPresentationProvider__addReducedMotionStatusBarStateAnimationToBatch_transitionState___block_invoke;
  id v14 = &unk_1E6A89968;
  uint64_t v15 = self;
  id v16 = v6;
  id v9 = v6;
  id v10 = +[CCUIAnimation animationWithParameters:v8 animations:&v11];
  objc_msgSend(v7, "addAnimation:", v10, v11, v12, v13, v14, v15);
}

void __108__CCUIOverlayStatusBarPresentationProvider__addReducedMotionStatusBarStateAnimationToBatch_transitionState___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) viewProvider];
  double v3 = [v2 overlayHeaderView];
  id v6 = [v3 statusBar];

  [*(id *)(a1 + 40) snappedStatusBarPresentationProgress];
  uint64_t IsOne = BSFloatIsOne();
  [v6 setLeadingState:IsOne];
  [v6 setTrailingState:IsOne];
  [*(id *)(a1 + 40) snappedStatusBarPresentationProgress];
  [v6 setCompactTrailingAlpha:1.0 - v5];
  [*(id *)(a1 + 40) snappedStatusBarPresentationProgress];
  objc_msgSend(v6, "setLeadingAlpha:");
  [*(id *)(a1 + 40) snappedStatusBarPresentationProgress];
  objc_msgSend(v6, "setExpandedTrailingAlpha:");
}

- (void)_addPageContentTransformAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
  id v9 = [(CCUIOverlayStatusBarPresentationProvider *)self metricsProvider];
  id v10 = [(id)objc_opt_class() _baseC2AnimationParametersForTransitionState:v6];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__CCUIOverlayStatusBarPresentationProvider__addPageContentTransformAnimationsToBatch_transitionState___block_invoke;
  v15[3] = &unk_1E6A89990;
  id v16 = v6;
  id v17 = v9;
  id v18 = v8;
  id v11 = v8;
  id v12 = v9;
  id v13 = v6;
  id v14 = +[CCUIAnimation animationWithParameters:v10 animations:v15];
  [v7 addAnimation:v14];
}

uint64_t __102__CCUIOverlayStatusBarPresentationProvider__addPageContentTransformAnimationsToBatch_transitionState___block_invoke(id *a1)
{
  [a1[4] pagingProgress];
  double v3 = v2;
  double v4 = fmax(fmin((v2 + -0.4) / 0.6, 1.0), 0.0);
  double v5 = 1.0 - v4 + v4 * 0.7;
  double v6 = fmax(fmin((v3 + -0.33) / 0.67, 1.0), 0.0);
  double v7 = 1.0 - v6 + v6 * 0.8;
  [a1[5] overlayContentSize];
  double v9 = v3 * 0.0 + (1.0 - v3) * (v8 * (1.0 - v7) * -0.5);
  [a1[6] setOverlayPageContentAlpha:v5];
  [a1[6] setOverlayPageContentScale:v7];
  id v10 = a1[6];

  return objc_msgSend(v10, "setOverlayPageContentTranslation:", 0.0, v9);
}

- (void)_addModuleTransformAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__CCUIOverlayStatusBarPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke;
  v11[3] = &unk_1E6A899B8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateOverlayModuleViewsWithBlock:v11];
}

uint64_t __97__CCUIOverlayStatusBarPresentationProvider__addModuleTransformAnimationsToBatch_transitionState___block_invoke(void *a1, uint64_t a2, _OWORD *a3)
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
  v20[2] = __119__CCUIOverlayStatusBarPresentationProvider__addModuleTransformAnimationsToBatch_transitionState_moduleView_layoutRect___block_invoke;
  v20[3] = &unk_1E6A899E0;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v17 = v11;
  id v18 = v10;
  id v19 = +[CCUIAnimation animationWithParameters:v15 animations:v20];
  [v12 addAnimation:v19];
}

void __119__CCUIOverlayStatusBarPresentationProvider__addModuleTransformAnimationsToBatch_transitionState_moduleView_layoutRect___block_invoke(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  double v2 = *(void **)(a1 + 32);
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
  id v12 = a4;
  long long v7 = [(CCUIOverlayStatusBarPresentationProvider *)self metricsProvider];
  if ((unint64_t)([v7 overlayInterfaceOrientation] - 1) < 2
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        long long v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 userInterfaceIdiom],
        v8,
        double v10 = 24.0,
        (v9 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    if (UIAccessibilityIsReduceMotionEnabled()) {
      double v10 = 184.0;
    }
    else {
      double v10 = ((double)a5->var0.var1 * 0.25 + 1.0) * 184.0;
    }
  }
  [(CCUIOverlayStatusBarPresentationProvider *)self _transformForTransitionState:v12 rubberBandingHeight:v10];

  return result;
}

- (void)_addModuleScaleAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__CCUIOverlayStatusBarPresentationProvider__addModuleScaleAnimationsToBatch_transitionState___block_invoke;
  v11[3] = &unk_1E6A899B8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateOverlayModuleViewsWithBlock:v11];
}

uint64_t __93__CCUIOverlayStatusBarPresentationProvider__addModuleScaleAnimationsToBatch_transitionState___block_invoke(void *a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  long long v6 = a3[1];
  v8[0] = *a3;
  v8[1] = v6;
  return [v3 _addModuleScaleAnimationsToBatch:v4 transitionState:v5 moduleView:a2 layoutRect:v8];
}

- (void)_addModuleScaleAnimationsToBatch:(id)a3 transitionState:(id)a4 moduleView:(id)a5 layoutRect:(CCUILayoutRect *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() _moduleScaleCAAnimationParametersForTransitionState:v10];
  CCUILayoutSize var1 = a6->var1;
  v26[0] = a6->var0;
  v26[1] = var1;
  [(CCUIOverlayStatusBarPresentationProvider *)self _delayForTransitionState:v10 layoutRect:v26];
  double v16 = v15;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  CCUILayoutSize v17 = a6->var1;
  CCUILayoutPoint var0 = a6->var0;
  CCUILayoutSize v25 = v17;
  v21[2] = __115__CCUIOverlayStatusBarPresentationProvider__addModuleScaleAnimationsToBatch_transitionState_moduleView_layoutRect___block_invoke;
  v21[3] = &unk_1E6A899E0;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v18 = v11;
  id v19 = v10;
  uint64_t v20 = +[CCUIAnimation animationWithParameters:v13 delay:v21 animations:v16];
  [v12 addAnimation:v20];
}

void __115__CCUIOverlayStatusBarPresentationProvider__addModuleScaleAnimationsToBatch_transitionState_moduleView_layoutRect___block_invoke(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  double v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    long long v4 = *(_OWORD *)(a1 + 72);
    long long v6 = *(_OWORD *)(a1 + 56);
    long long v7 = v4;
    [v2 _moduleViewScaleTransformForTransitionState:v3 layoutRect:&v6];
  }
  uint64_t v5 = [*(id *)(a1 + 48) caAnimationContainerView];
  long long v6 = v9;
  long long v7 = v10;
  long long v8 = v11;
  [v5 setTransform:&v6];
}

- (CGAffineTransform)_moduleViewScaleTransformForTransitionState:(SEL)a3 layoutRect:(id)a4
{
  id v10 = a4;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v6 + 32);
  }
  else
  {
    [v10 snappedPresentationProgress];
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tCGFloat x = 0u;
    CGAffineTransformMakeScale(retstr, v8 + (1.0 - v8) * 0.8, v8 + (1.0 - v8) * 0.8);
  }

  return result;
}

- (void)_addModuleAlphaAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__CCUIOverlayStatusBarPresentationProvider__addModuleAlphaAnimationsToBatch_transitionState___block_invoke;
  v11[3] = &unk_1E6A899B8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateOverlayModuleViewsWithBlock:v11];
}

uint64_t __93__CCUIOverlayStatusBarPresentationProvider__addModuleAlphaAnimationsToBatch_transitionState___block_invoke(void *a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  long long v6 = a3[1];
  v8[0] = *a3;
  v8[1] = v6;
  return [v3 _addModuleAlphaAnimationsToBatch:v4 transitionState:v5 moduleView:a2 layoutRect:v8];
}

- (void)_addModuleAlphaAnimationsToBatch:(id)a3 transitionState:(id)a4 moduleView:(id)a5 layoutRect:(CCUILayoutRect *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() _moduleAlphaCAAnimationParametersForTransitionState:v10];
  CCUILayoutSize var1 = a6->var1;
  v26[0] = a6->var0;
  v26[1] = var1;
  [(CCUIOverlayStatusBarPresentationProvider *)self _delayForTransitionState:v10 layoutRect:v26];
  double v16 = v15;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __115__CCUIOverlayStatusBarPresentationProvider__addModuleAlphaAnimationsToBatch_transitionState_moduleView_layoutRect___block_invoke;
  id v23 = &unk_1E6A89968;
  id v24 = v11;
  id v25 = v10;
  id v17 = v10;
  id v18 = v11;
  id v19 = +[CCUIAnimation animationWithParameters:v13 delay:&v20 animations:v16];
  objc_msgSend(v12, "addAnimation:", v19, v20, v21, v22, v23);
}

void __115__CCUIOverlayStatusBarPresentationProvider__addModuleAlphaAnimationsToBatch_transitionState_moduleView_layoutRect___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) caAnimationContainerView];
  [*(id *)(a1 + 40) snappedPresentationProgress];
  objc_msgSend(v2, "setAlpha:");
}

- (void)_addAccessoryScaleAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(id)objc_opt_class() _moduleScaleCAAnimationParametersForTransitionState:v6];
  id v9 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
  id v10 = [v9 overlayPageControl];

  v19[0] = xmmword_1D7BBF550;
  v19[1] = unk_1D7BBF560;
  [(CCUIOverlayStatusBarPresentationProvider *)self _delayForTransitionState:v6 layoutRect:v19];
  double v12 = v11;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__CCUIOverlayStatusBarPresentationProvider__addAccessoryScaleAnimationsToBatch_transitionState___block_invoke;
  v16[3] = &unk_1E6A89990;
  v16[4] = self;
  id v17 = v6;
  id v18 = v10;
  id v13 = v10;
  id v14 = v6;
  double v15 = +[CCUIAnimation animationWithParameters:v8 delay:v16 animations:v12];
  [v7 addAnimation:v15];
}

uint64_t __96__CCUIOverlayStatusBarPresentationProvider__addAccessoryScaleAnimationsToBatch_transitionState___block_invoke(void *a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  id v2 = (void *)a1[4];
  if (v2)
  {
    uint64_t v3 = a1[5];
    long long v6 = xmmword_1D7BBF530;
    long long v7 = xmmword_1D7BBF540;
    [v2 _moduleViewScaleTransformForTransitionState:v3 layoutRect:&v6];
  }
  uint64_t v4 = (void *)a1[6];
  long long v6 = v9;
  long long v7 = v10;
  long long v8 = v11;
  return [v4 setTransform:&v6];
}

- (void)_addAccessoryAlphaAnimationsToBatch:(id)a3 transitionState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(id)objc_opt_class() _moduleAlphaCAAnimationParametersForTransitionState:v6];
  long long v9 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
  long long v10 = [v9 overlayPageControl];

  v22[0] = xmmword_1D7BBF550;
  v22[1] = unk_1D7BBF560;
  [(CCUIOverlayStatusBarPresentationProvider *)self _delayForTransitionState:v6 layoutRect:v22];
  double v12 = v11;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __96__CCUIOverlayStatusBarPresentationProvider__addAccessoryAlphaAnimationsToBatch_transitionState___block_invoke;
  id v19 = &unk_1E6A89968;
  id v20 = v10;
  id v21 = v6;
  id v13 = v6;
  id v14 = v10;
  double v15 = +[CCUIAnimation animationWithParameters:v8 delay:&v16 animations:v12];
  objc_msgSend(v7, "addAnimation:", v15, v16, v17, v18, v19);
}

uint64_t __96__CCUIOverlayStatusBarPresentationProvider__addAccessoryAlphaAnimationsToBatch_transitionState___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) snappedPresentationProgress];

  return objc_msgSend(v1, "setAlpha:");
}

- (CGAffineTransform)_transformForTransitionState:(SEL)a3 rubberBandingHeight:(id)a4
{
  id v7 = a4;
  id v18 = [(CCUIOverlayStatusBarPresentationProvider *)self metricsProvider];
  if ((unint64_t)([v18 overlayInterfaceOrientation] - 3) > 1
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        long long v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 userInterfaceIdiom],
        v8,
        v9))
  {
    [(CCUIOverlayStatusBarPresentationProvider *)self _effectiveTransitionHeight];
    long long v10 = [(CCUIOverlayStatusBarPresentationProvider *)self viewProvider];
    double v11 = [v10 overlayHeaderView];
    double v12 = [v11 statusBar];
    [v12 verticalSecondaryServiceDelta];
  }
  else
  {
    [(CCUIOverlayStatusBarPresentationProvider *)self _presentedViewFrame];
    CGRectGetMinY(v20);
  }
  [v7 clampedPresentationProgress];
  [v7 nonZeroPresentationProgress];
  [v7 clampedPresentationProgress];
  BSUIConstrainValueWithRubberBand();
  UIRoundToScale();
  double v14 = v13;
  [v7 pagingProgress];
  double v16 = v15;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeTranslation(retstr, 0.0, v16 * 0.0 + (1.0 - v16) * v14);

  return result;
}

- (double)_delayForTransitionState:(id)a3 layoutRect:(CCUILayoutRect *)a4
{
  uint64_t v5 = [a3 type];
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  double result = 0.0;
  if (v5 == 2)
  {
    if (!IsReduceMotionEnabled) {
      return (double)a4->var0.var0 * 0.016 + (double)a4->var0.var1 * 0.016;
    }
  }
  else if (!IsReduceMotionEnabled)
  {
    return (double)a4->var0.var1 * 0.016;
  }
  return result;
}

- (void)setViewProvider:(id)a3
{
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