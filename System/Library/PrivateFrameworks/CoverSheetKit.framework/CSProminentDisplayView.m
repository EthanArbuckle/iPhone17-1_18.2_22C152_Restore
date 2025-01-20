@interface CSProminentDisplayView
+ (NSHashTable)overrideObservingDisplayViews;
+ (id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride;
- (BOOL)animatingTransientSubtitleTransition;
- (BOOL)animatingTransientSubtitleTransitionToTransient;
- (BOOL)hasClearedSinceLastAddedTransient;
- (BOOL)shouldApplyVibrancyToComplications;
- (BOOL)usesEditingLayout;
- (BSUIOrientationTransformWrapperView)backgroundTransformView;
- (BSUIVibrancyEffectView)timeVibrancyEffectView;
- (BSUIVibrancyEffectView)vibrancyEffectView;
- (BSUIVibrancyShadowView)vibrancyShadowView;
- (CSProminentDisplayView)initWithFrame:(CGRect)a3;
- (CSProminentEmptyElementView)complicationRowView;
- (CSProminentEmptyElementView)complicationSidebarView;
- (CSProminentEmptyElementView)subtitleComplicationView;
- (CSProminentLayoutController)layoutController;
- (CSProminentTextElementView)customSubtitleView;
- (CSProminentTextElementView)subtitleView;
- (CSProminentTextElementView)transientSubtitleView;
- (CSProminentTimeView)timeView;
- (NSDate)displayDate;
- (NSDate)overrideDate;
- (NSMutableArray)pendedTransientSubtitleViews;
- (UIView)backgroundView;
- (_CSProminentDisplayBackgroundWrapperView)backgroundWrapperView;
- (double)subtitleAlpha;
- (id)_complicationsSuperview;
- (id)_contentView;
- (id)_effectiveDisplayDate;
- (void)_addComplicationSubview:(id)a3;
- (void)_applyAlphaToNonTransientSubtitleViews:(double)a3;
- (void)_applyContainerOrientationToVibrancyShadowView:(int64_t)a3;
- (void)_setOverrideDate:(id)a3;
- (void)_setUpTimeStringOverriding;
- (void)_showTransientSubtitleView:(id)a3;
- (void)_showTransientSubtitleView:(id)a3 withDelay:(double)a4;
- (void)_transitionToNextPendedSubtitleIfNecessary;
- (void)_transitionToNextPendedSubtitleIfNecessaryWithDelay:(double)a3;
- (void)_updateAlphaForNonTransientSubtitleViews;
- (void)_updateEffectiveDisplayDate;
- (void)_updateVisibilityForNonTransientSubtitleViews;
- (void)layoutSubviews;
- (void)setAnimatingTransientSubtitleTransition:(BOOL)a3;
- (void)setAnimatingTransientSubtitleTransitionToTransient:(BOOL)a3;
- (void)setBackgroundTransformView:(id)a3;
- (void)setBackgroundWrapperView:(id)a3;
- (void)setComplicationRowView:(id)a3;
- (void)setComplicationSidebarView:(id)a3;
- (void)setCustomSubtitleView:(id)a3;
- (void)setDisplayDate:(id)a3;
- (void)setHasClearedSinceLastAddedTransient:(BOOL)a3;
- (void)setNumberingSystem:(int64_t)a3;
- (void)setOverrideDate:(id)a3;
- (void)setPendedTransientSubtitleViews:(id)a3;
- (void)setShouldApplyVibrancyToComplications:(BOOL)a3;
- (void)setSubtitleAlpha:(double)a3;
- (void)setSubtitleComplicationView:(id)a3;
- (void)setSubtitleView:(id)a3;
- (void)setTimeView:(id)a3;
- (void)setTransientSubtitleView:(id)a3;
- (void)setUsesEditingLayout:(BOOL)a3;
- (void)setVibrancyShadowView:(id)a3;
- (void)updateContainerOrientationForBackgroundViews:(int64_t)a3;
@end

@implementation CSProminentDisplayView

- (void)setDisplayDate:(id)a3
{
  id v6 = a3;
  if (!-[NSDate isEqualToDate:](self->_displayDate, "isEqualToDate:"))
  {
    v4 = (NSDate *)[v6 copy];
    displayDate = self->_displayDate;
    self->_displayDate = v4;

    [(CSProminentDisplayView *)self _updateEffectiveDisplayDate];
  }
}

- (void)_updateEffectiveDisplayDate
{
  id v3 = [(CSProminentDisplayView *)self _effectiveDisplayDate];
  [(CSProminentTimeView *)self->_timeView setDate:v3];
  [(CSProminentTextElementView *)self->_subtitleView setDate:v3];
  [(CSProminentLayoutController *)self->_layoutController setFourDigitTime:[(CSProminentTimeView *)self->_timeView fourDigitTime]];
}

- (id)_effectiveDisplayDate
{
  overrideDate = self->_overrideDate;
  if (!overrideDate) {
    overrideDate = self->_displayDate;
  }
  return overrideDate;
}

- (CSProminentDisplayView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CSProminentDisplayView;
  id v3 = -[CSProminentDisplayView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[CSProminentLayoutController alloc] initWithTraitEnvironment:v3];
    layoutController = v3->_layoutController;
    v3->_layoutController = v4;

    v3->_subtitleAlpha = 1.0;
    [(CSProminentDisplayView *)v3 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = -[_CSProminentDisplayBackgroundWrapperView initWithFrame:]([_CSProminentDisplayBackgroundWrapperView alloc], "initWithFrame:", v6, v8, v10, v12);
    backgroundWrapperView = v3->_backgroundWrapperView;
    v3->_backgroundWrapperView = v14;

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F8D0]), "initWithFrame:", v7, v9, v11, v13);
    backgroundTransformView = v3->_backgroundTransformView;
    v3->_backgroundTransformView = (BSUIOrientationTransformWrapperView *)v16;

    [(BSUIOrientationTransformWrapperView *)v3->_backgroundTransformView setContainerOrientation:1];
    [(BSUIOrientationTransformWrapperView *)v3->_backgroundTransformView setContentOrientation:1];
    [(BSUIOrientationTransformWrapperView *)v3->_backgroundTransformView addContentView:v3->_backgroundWrapperView];
    [(BSUIOrientationTransformWrapperView *)v3->_backgroundTransformView setCounterTransformView:1];
    [(CSProminentDisplayView *)v3 addSubview:v3->_backgroundTransformView];
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F8F0]), "initWithFrame:", v7, v9, v11, v13);
    vibrancyEffectView = v3->_vibrancyEffectView;
    v3->_vibrancyEffectView = (BSUIVibrancyEffectView *)v18;

    [(CSProminentDisplayView *)v3 addSubview:v3->_vibrancyEffectView];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4F8F0]), "initWithFrame:", v7, v9, v11, v13);
    timeVibrancyEffectView = v3->_timeVibrancyEffectView;
    v3->_timeVibrancyEffectView = (BSUIVibrancyEffectView *)v20;

    [(CSProminentDisplayView *)v3 addSubview:v3->_timeVibrancyEffectView];
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    pendedTransientSubtitleViews = v3->_pendedTransientSubtitleViews;
    v3->_pendedTransientSubtitleViews = (NSMutableArray *)v22;

    [(CSProminentDisplayView *)v3 _setUpTimeStringOverriding];
  }
  return v3;
}

- (id)_contentView
{
  id v3 = [(BSUIVibrancyEffectView *)self->_vibrancyEffectView contentView];
  v4 = v3;
  if (!v3) {
    id v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (void)layoutSubviews
{
  v100.receiver = self;
  v100.super_class = (Class)CSProminentDisplayView;
  [(CSProminentDisplayView *)&v100 layoutSubviews];
  [(CSProminentDisplayView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[BSUIOrientationTransformWrapperView setFrame:](self->_backgroundTransformView, "setFrame:");
  double v11 = [(CSProminentDisplayView *)self layoutController];
  double v12 = [(CSProminentDisplayView *)self _contentView];
  if ([(CSProminentDisplayView *)self shouldApplyVibrancyToComplications]) {
    uint64_t v13 = 31;
  }
  else {
    uint64_t v13 = 3;
  }
  if (self->_usesEditingLayout)
  {
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", v13, 2, v4, v6, v8, v10);
    double v94 = v15;
    double v95 = v14;
    double v92 = v17;
    double v93 = v16;
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", 2, 2, v4, v6, v8, v10);
    double v99 = v18;
    double v97 = v20;
    double v98 = v19;
    double v96 = v21;
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", 4, 2, v4, v6, v8, v10);
    double v82 = v23;
    double v83 = v22;
    double v80 = v25;
    double v81 = v24;
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", 1, 2, v4, v6, v8, v10);
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", 8, 2, v4, v6, v8, v10);
    double v90 = v35;
    double v91 = v34;
    double v88 = v37;
    double v89 = v36;
    objc_msgSend(v11, "frameForElements:variant:withBoundingRect:", 16, 2, v4, v6, v8, v10);
  }
  else
  {
    objc_msgSend(v11, "frameForElements:withBoundingRect:", v13, v4, v6, v8, v10);
    double v94 = v43;
    double v95 = v42;
    double v92 = v45;
    double v93 = v44;
    objc_msgSend(v11, "frameForElements:withBoundingRect:", 2, v4, v6, v8, v10);
    double v99 = v46;
    double v97 = v48;
    double v98 = v47;
    double v96 = v49;
    objc_msgSend(v11, "frameForElements:withBoundingRect:", 4, v4, v6, v8, v10);
    double v82 = v51;
    double v83 = v50;
    double v80 = v53;
    double v81 = v52;
    objc_msgSend(v11, "frameForElements:withBoundingRect:", 1, v4, v6, v8, v10);
    double v27 = v54;
    double v29 = v55;
    double v31 = v56;
    double v33 = v57;
    objc_msgSend(v11, "frameForElements:withBoundingRect:", 8, v4, v6, v8, v10);
    double v90 = v59;
    double v91 = v58;
    double v88 = v61;
    double v89 = v60;
    objc_msgSend(v11, "frameForElements:withBoundingRect:", 16, v4, v6, v8, v10);
  }
  double v86 = v39;
  double v87 = v38;
  double v84 = v41;
  double v85 = v40;
  -[BSUIVibrancyEffectView setFrame:](self->_vibrancyEffectView, "setFrame:", v95, v94, v93, v92);
  -[BSUIVibrancyEffectView setFrame:](self->_timeVibrancyEffectView, "setFrame:", v27, v29, v31, v33);
  v62 = [(CSProminentDisplayView *)self _complicationsSuperview];
  objc_msgSend(v62, "convertRect:fromView:", self, v83, v82, v81, v80);
  -[CSProminentEmptyElementView setFrame:](self->_subtitleComplicationView, "setFrame:");
  objc_msgSend(v12, "convertRect:fromView:", self, v99, v98, v97, v96);
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  -[CSProminentTextElementView setFrame:](self->_subtitleView, "setFrame:");
  -[CSProminentTextElementView setFrame:](self->_customSubtitleView, "setFrame:", v64, v66, v68, v70);
  -[CSProminentTextElementView setFrame:](self->_transientSubtitleView, "setFrame:", v64, v66, v68, v70);
  v71 = [(BSUIVibrancyEffectView *)self->_timeVibrancyEffectView contentView];
  objc_msgSend(v71, "convertRect:fromView:", self, v27, v29, v31, v33);
  double v73 = v72;
  double v75 = v74;
  double v77 = v76;
  double v79 = v78;

  -[CSProminentTimeView setFrame:](self->_timeView, "setFrame:", v73, v75, v77, v79);
  objc_msgSend(v62, "convertRect:fromView:", self, v91, v90, v89, v88);
  -[CSProminentEmptyElementView setFrame:](self->_complicationRowView, "setFrame:");
  objc_msgSend(v62, "convertRect:fromView:", self, v87, v86, v85, v84);
  -[CSProminentEmptyElementView setFrame:](self->_complicationSidebarView, "setFrame:");
}

- (void)setVibrancyShadowView:(id)a3
{
  double v5 = (BSUIVibrancyShadowView *)a3;
  vibrancyShadowView = self->_vibrancyShadowView;
  double v7 = v5;
  if (vibrancyShadowView != v5)
  {
    [(BSUIVibrancyShadowView *)vibrancyShadowView removeFromSuperview];
    objc_storeStrong((id *)&self->_vibrancyShadowView, a3);
    [(_CSProminentDisplayBackgroundWrapperView *)self->_backgroundWrapperView setWrappedView:v7];
  }
}

- (void)setTimeView:(id)a3
{
  double v5 = (CSProminentTimeView *)a3;
  p_timeView = &self->_timeView;
  timeView = self->_timeView;
  if (timeView != v5)
  {
    double v10 = v5;
    [(CSProminentTimeView *)timeView removeFromSuperview];
    objc_storeStrong((id *)&self->_timeView, a3);
    double v8 = [(CSProminentDisplayView *)self timeVibrancyEffectView];
    double v9 = [v8 contentView];
    [v9 addSubview:*p_timeView];

    double v5 = v10;
  }

  MEMORY[0x1F41817F8](timeView, v5);
}

- (void)setSubtitleView:(id)a3
{
  double v5 = (CSProminentTextElementView *)a3;
  p_subtitleView = &self->_subtitleView;
  subtitleView = self->_subtitleView;
  if (subtitleView != v5)
  {
    double v9 = v5;
    [(CSProminentTextElementView *)subtitleView removeFromSuperview];
    objc_storeStrong((id *)&self->_subtitleView, a3);
    [(CSProminentDisplayView *)self _updateAlphaForNonTransientSubtitleViews];
    [(CSProminentDisplayView *)self _updateVisibilityForNonTransientSubtitleViews];
    double v8 = [(CSProminentDisplayView *)self _contentView];
    [v8 addSubview:*p_subtitleView];

    double v5 = v9;
  }

  MEMORY[0x1F41817F8](subtitleView, v5);
}

- (void)setTransientSubtitleView:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    [v4 setAlpha:self->_subtitleAlpha];
    double v5 = [(CSProminentTextElementView *)self->_transientSubtitleView textLabel];
    double v6 = [v5 text];

    double v7 = [v9 textLabel];
    double v8 = [v7 text];

    if (![v6 isEqualToString:v8]
      || [(NSMutableArray *)self->_pendedTransientSubtitleViews count])
    {
      self->_hasClearedSinceLastAddedTransient = 0;
      [(NSMutableArray *)self->_pendedTransientSubtitleViews addObject:v9];
      [(CSProminentDisplayView *)self _transitionToNextPendedSubtitleIfNecessary];
    }
  }
  else
  {
    if ([(NSMutableArray *)self->_pendedTransientSubtitleViews count]) {
      [(NSMutableArray *)self->_pendedTransientSubtitleViews removeAllObjects];
    }
    self->_hasClearedSinceLastAddedTransient = 1;
    if (!self->_animatingTransientSubtitleTransition) {
      [(CSProminentDisplayView *)self _showTransientSubtitleView:0 withDelay:0.25];
    }
  }
}

- (void)setCustomSubtitleView:(id)a3
{
  double v5 = (CSProminentTextElementView *)a3;
  p_customSubtitleView = &self->_customSubtitleView;
  customSubtitleView = self->_customSubtitleView;
  if (customSubtitleView != v5)
  {
    id v9 = v5;
    [(CSProminentTextElementView *)customSubtitleView removeFromSuperview];
    objc_storeStrong((id *)&self->_customSubtitleView, a3);
    [(CSProminentDisplayView *)self _updateAlphaForNonTransientSubtitleViews];
    [(CSProminentDisplayView *)self _updateVisibilityForNonTransientSubtitleViews];
    double v8 = [(CSProminentDisplayView *)self _contentView];
    [v8 addSubview:*p_customSubtitleView];

    double v5 = v9;
  }

  MEMORY[0x1F41817F8](customSubtitleView, v5);
}

- (void)setSubtitleAlpha:(double)a3
{
  double subtitleAlpha = self->_subtitleAlpha;
  self->_double subtitleAlpha = a3;
  -[CSProminentTextElementView setAlpha:](self->_transientSubtitleView, "setAlpha:");
  [(CSProminentDisplayView *)self _applyAlphaToNonTransientSubtitleViews:a3];
  if (BSFloatIsZero()
    && subtitleAlpha != a3
    && ([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled] & 1) == 0)
  {
    double v6 = [(CSProminentTextElementView *)self->_subtitleView layer];
    [v6 removeAnimationForKey:@"opacity"];

    double v7 = [(CSProminentEmptyElementView *)self->_subtitleComplicationView layer];
    [v7 removeAnimationForKey:@"opacity"];

    double v8 = [(CSProminentTextElementView *)self->_transientSubtitleView layer];
    [v8 removeAnimationForKey:@"opacity"];

    id v9 = [(CSProminentTextElementView *)self->_customSubtitleView layer];
    [v9 removeAnimationForKey:@"opacity"];
  }
}

- (void)updateContainerOrientationForBackgroundViews:(int64_t)a3
{
  -[BSUIOrientationTransformWrapperView setContainerOrientation:](self->_backgroundTransformView, "setContainerOrientation:");
  [(_CSProminentDisplayBackgroundWrapperView *)self->_backgroundWrapperView layoutIfNeeded];

  [(CSProminentDisplayView *)self _applyContainerOrientationToVibrancyShadowView:a3];
}

- (UIView)backgroundView
{
  return (UIView *)self->_backgroundTransformView;
}

- (void)_transitionToNextPendedSubtitleIfNecessary
{
}

- (void)_transitionToNextPendedSubtitleIfNecessaryWithDelay:(double)a3
{
  if (self->_animatingTransientSubtitleTransition) {
    return;
  }
  uint64_t v5 = [(NSMutableArray *)self->_pendedTransientSubtitleViews firstObject];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v9 = v5;
    [(NSMutableArray *)self->_pendedTransientSubtitleViews removeObject:v5];
    double v7 = self;
    uint64_t v8 = v9;
LABEL_7:
    uint64_t v5 = [(CSProminentDisplayView *)v7 _showTransientSubtitleView:v8 withDelay:a3];
    uint64_t v6 = v9;
    goto LABEL_8;
  }
  if (self->_hasClearedSinceLastAddedTransient && self->_transientSubtitleView)
  {
    double v7 = self;
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    goto LABEL_7;
  }
LABEL_8:

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)_showTransientSubtitleView:(id)a3
{
}

- (void)_showTransientSubtitleView:(id)a3 withDelay:(double)a4
{
  double v7 = (CSProminentTextElementView *)a3;
  p_transientSubtitleView = &self->_transientSubtitleView;
  transientSubtitleView = self->_transientSubtitleView;
  if (transientSubtitleView != v7)
  {
    if (v7)
    {
      [(CSProminentTextElementView *)transientSubtitleView removeFromSuperview];
      objc_storeStrong((id *)&self->_transientSubtitleView, a3);
      [(CSProminentTextElementView *)*p_transientSubtitleView setAlpha:0.0];
      double v10 = [(CSProminentDisplayView *)self _contentView];
      [v10 addSubview:*p_transientSubtitleView];

      [(CSProminentDisplayView *)self setNeedsLayout];
    }
    else
    {
      [(CSProminentDisplayView *)self _applyAlphaToNonTransientSubtitleViews:0.0];
    }
    self->_animatingTransientSubtitleTransition = 1;
    self->_animatingTransientSubtitleTransitionToTransient = v7 != 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke;
    v12[3] = &unk_1E5E8A4B8;
    v12[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_2;
    v11[3] = &unk_1E5E8A740;
    v11[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v12 options:v11 animations:0.25 completion:a4];
  }
}

uint64_t __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 411)) {
    return [(id)v1 _applyAlphaToNonTransientSubtitleViews:0.0];
  }
  else {
    return [*(id *)(v1 + 480) setAlpha:0.0];
  }
}

uint64_t __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_3;
  v3[3] = &unk_1E5E8A4B8;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_4;
  v2[3] = &unk_1E5E8A740;
  v2[4] = v4;
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:v2 completion:0.25];
}

uint64_t __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) subtitleAlpha];
  double v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 480);
  if (*(unsigned char *)(v4 + 411))
  {
    return objc_msgSend(v5, "setAlpha:");
  }
  else
  {
    [v5 removeFromSuperview];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 480);
    *(void *)(v7 + 480) = 0;

    uint64_t v9 = *(void **)(a1 + 32);
    return [v9 _applyAlphaToNonTransientSubtitleViews:v3];
  }
}

uint64_t __63__CSProminentDisplayView__showTransientSubtitleView_withDelay___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) subtitleAlpha];
  double v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 411))
  {
    [(id)v4 _applyAlphaToNonTransientSubtitleViews:0.0];
    [*(id *)(*(void *)(a1 + 32) + 480) setAlpha:v3];
  }
  else
  {
    [*(id *)(v4 + 480) removeFromSuperview];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 480);
    *(void *)(v5 + 480) = 0;

    [*(id *)(a1 + 32) _applyAlphaToNonTransientSubtitleViews:v3];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 410) = 0;
  uint64_t v7 = *(void **)(a1 + 32);

  return [v7 _transitionToNextPendedSubtitleIfNecessaryWithDelay:1.25];
}

- (void)_applyAlphaToNonTransientSubtitleViews:(double)a3
{
  if (self->_transientSubtitleView) {
    a3 = 0.0;
  }
  [(CSProminentTextElementView *)self->_customSubtitleView setAlpha:a3];
  [(CSProminentEmptyElementView *)self->_subtitleComplicationView setAlpha:a3];
  subtitleView = self->_subtitleView;

  [(CSProminentTextElementView *)subtitleView setAlpha:a3];
}

- (void)_updateAlphaForNonTransientSubtitleViews
{
  [(CSProminentDisplayView *)self subtitleAlpha];

  -[CSProminentDisplayView _applyAlphaToNonTransientSubtitleViews:](self, "_applyAlphaToNonTransientSubtitleViews:");
}

- (void)_updateVisibilityForNonTransientSubtitleViews
{
  customSubtitleView = self->_customSubtitleView;
  uint64_t v4 = (unint64_t)customSubtitleView | (unint64_t)self->_subtitleComplicationView;
  BOOL v5 = customSubtitleView != 0;
  [(CSProminentTextElementView *)customSubtitleView setHidden:0];
  [(CSProminentEmptyElementView *)self->_subtitleComplicationView setHidden:v5];
  subtitleView = self->_subtitleView;

  [(CSProminentTextElementView *)subtitleView setHidden:v4 != 0];
}

- (void)setUsesEditingLayout:(BOOL)a3
{
  if (self->_usesEditingLayout != a3)
  {
    self->_usesEditingLayout = a3;
    [(CSProminentDisplayView *)self setNeedsLayout];
    [(CSProminentDisplayView *)self layoutIfNeeded];
  }
}

- (void)setSubtitleComplicationView:(id)a3
{
  BOOL v5 = (CSProminentEmptyElementView *)a3;
  subtitleComplicationView = self->_subtitleComplicationView;
  if (subtitleComplicationView != v5)
  {
    uint64_t v7 = v5;
    [(CSProminentEmptyElementView *)subtitleComplicationView removeFromSuperview];
    objc_storeStrong((id *)&self->_subtitleComplicationView, a3);
    [(CSProminentDisplayView *)self _updateAlphaForNonTransientSubtitleViews];
    [(CSProminentDisplayView *)self _updateVisibilityForNonTransientSubtitleViews];
    subtitleComplicationView = (CSProminentEmptyElementView *)[(CSProminentDisplayView *)self _addComplicationSubview:self->_subtitleComplicationView];
    BOOL v5 = v7;
  }

  MEMORY[0x1F41817F8](subtitleComplicationView, v5);
}

- (void)setComplicationRowView:(id)a3
{
  BOOL v5 = (CSProminentEmptyElementView *)a3;
  complicationRowView = self->_complicationRowView;
  uint64_t v7 = v5;
  if (complicationRowView != v5)
  {
    [(CSProminentEmptyElementView *)complicationRowView removeFromSuperview];
    objc_storeStrong((id *)&self->_complicationRowView, a3);
    [(CSProminentDisplayView *)self _addComplicationSubview:v7];
  }
}

- (void)setComplicationSidebarView:(id)a3
{
  BOOL v5 = (CSProminentEmptyElementView *)a3;
  complicationSidebarView = self->_complicationSidebarView;
  uint64_t v7 = v5;
  if (complicationSidebarView != v5)
  {
    [(CSProminentEmptyElementView *)complicationSidebarView removeFromSuperview];
    objc_storeStrong((id *)&self->_complicationSidebarView, a3);
    [(CSProminentDisplayView *)self _addComplicationSubview:v7];
  }
}

- (void)setShouldApplyVibrancyToComplications:(BOOL)a3
{
  if (self->_shouldApplyVibrancyToComplications != a3)
  {
    self->_shouldApplyVibrancyToComplications = a3;
    [(CSProminentDisplayView *)self _addComplicationSubview:self->_subtitleComplicationView];
    [(CSProminentDisplayView *)self _addComplicationSubview:self->_complicationRowView];
    complicationSidebarView = self->_complicationSidebarView;
    [(CSProminentDisplayView *)self _addComplicationSubview:complicationSidebarView];
  }
}

- (id)_complicationsSuperview
{
  if ([(CSProminentDisplayView *)self shouldApplyVibrancyToComplications])
  {
    double v3 = [(CSProminentDisplayView *)self _contentView];
  }
  else
  {
    double v3 = self;
  }

  return v3;
}

- (void)_addComplicationSubview:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(CSProminentDisplayView *)self _complicationsSuperview];
  if (v6)
  {
    BOOL v5 = [v6 superview];

    if (v5 != v4)
    {
      [v6 removeFromSuperview];
      [v4 addSubview:v6];
      [(CSProminentDisplayView *)self setNeedsLayout];
    }
  }
}

- (void)_applyContainerOrientationToVibrancyShadowView:(int64_t)a3
{
  if (self->_vibrancyShadowView)
  {
    [MEMORY[0x1E4F4F900] defaultShadowStartPoint];
    [MEMORY[0x1E4F4F900] defaultShadowEndPoint];
    _UIConvertPointFromOrientationToOrientation();
    double v5 = v4;
    double v7 = v6;
    _UIConvertPointFromOrientationToOrientation();
    double v9 = v8;
    double v11 = v10;
    -[BSUIVibrancyShadowView setShadowStartPoint:](self->_vibrancyShadowView, "setShadowStartPoint:", v5, v7);
    vibrancyShadowView = self->_vibrancyShadowView;
    -[BSUIVibrancyShadowView setShadowEndPoint:](vibrancyShadowView, "setShadowEndPoint:", v9, v11);
  }
}

- (void)setNumberingSystem:(int64_t)a3
{
  -[CSProminentTimeView setNumberingSystem:](self->_timeView, "setNumberingSystem:");
  [(CSProminentLayoutController *)self->_layoutController setNumberingSystem:a3];

  [(CSProminentDisplayView *)self setNeedsLayout];
}

+ (id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_onceToken != -1) {
    dispatch_once(&_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_onceToken, block);
  }
  double v2 = [(id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain data];
  double v3 = [v2 customOverrides];

  return v3;
}

void __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  if (objc_opt_respondsToSelector())
  {
    double v3 = [v2 performSelector:sel_systemStatusServer];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FA94F0]) initWithServerHandle:v3];
    double v5 = (void *)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain;
    _startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain = v4;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FA94F0]);
    double v3 = (void *)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain;
    _startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain = (uint64_t)v6;
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke_2;
  v7[3] = &__block_descriptor_40_e46_v16__0__STStatusBarOverridesStatusDomainData_8l;
  v7[4] = *(void *)(a1 + 32);
  [(id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride_sOverrideDomain observeDataWithBlock:v7];
}

void __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = [a2 customOverrides];
  if (([v3 dateFromEntriesIncludesTime] & 1) != 0
    || [v3 dateFromEntriesIncludesDate])
  {
    uint64_t v4 = [v3 dateFromEntries];
  }
  else
  {
    uint64_t v4 = 0;
  }
  double v5 = [*(id *)(a1 + 32) overrideObservingDisplayViews];
  id v6 = [v5 allObjects];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke_3;
  v9[3] = &unk_1E5E8A768;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __93__CSProminentDisplayView__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride__block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_setOverrideDate:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (NSHashTable)overrideObservingDisplayViews
{
  if (overrideObservingDisplayViews_onceToken != -1) {
    dispatch_once(&overrideObservingDisplayViews_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)overrideObservingDisplayViews_sOverrideObservingDisplayViews;

  return (NSHashTable *)v2;
}

uint64_t __55__CSProminentDisplayView_overrideObservingDisplayViews__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  uint64_t v1 = overrideObservingDisplayViews_sOverrideObservingDisplayViews;
  overrideObservingDisplayViews_sOverrideObservingDisplayViews = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)_setUpTimeStringOverriding
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [v3 overrideObservingDisplayViews];
  [v4 addObject:self];

  id v6 = [v3 _startObservingSystemStatusOverridesIfNeededAndFetchInitialOverride];
  if ([v6 dateFromEntriesIncludesTime])
  {
    uint64_t v5 = [v6 dateFromEntries];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(CSProminentDisplayView *)self _setOverrideDate:v5];
}

- (void)_setOverrideDate:(id)a3
{
  id v6 = a3;
  if (!-[NSDate isEqualToDate:](self->_overrideDate, "isEqualToDate:"))
  {
    uint64_t v4 = (NSDate *)[v6 copy];
    overrideDate = self->_overrideDate;
    self->_overrideDate = v4;

    [(CSProminentDisplayView *)self _updateEffectiveDisplayDate];
  }
}

- (BSUIVibrancyEffectView)timeVibrancyEffectView
{
  return self->_timeVibrancyEffectView;
}

- (BSUIVibrancyEffectView)vibrancyEffectView
{
  return self->_vibrancyEffectView;
}

- (BSUIVibrancyShadowView)vibrancyShadowView
{
  return self->_vibrancyShadowView;
}

- (CSProminentTimeView)timeView
{
  return self->_timeView;
}

- (CSProminentTextElementView)subtitleView
{
  return self->_subtitleView;
}

- (CSProminentEmptyElementView)subtitleComplicationView
{
  return self->_subtitleComplicationView;
}

- (CSProminentEmptyElementView)complicationRowView
{
  return self->_complicationRowView;
}

- (CSProminentEmptyElementView)complicationSidebarView
{
  return self->_complicationSidebarView;
}

- (CSProminentTextElementView)transientSubtitleView
{
  return self->_transientSubtitleView;
}

- (CSProminentTextElementView)customSubtitleView
{
  return self->_customSubtitleView;
}

- (double)subtitleAlpha
{
  return self->_subtitleAlpha;
}

- (BOOL)usesEditingLayout
{
  return self->_usesEditingLayout;
}

- (BOOL)shouldApplyVibrancyToComplications
{
  return self->_shouldApplyVibrancyToComplications;
}

- (CSProminentLayoutController)layoutController
{
  return self->_layoutController;
}

- (BOOL)animatingTransientSubtitleTransition
{
  return self->_animatingTransientSubtitleTransition;
}

- (void)setAnimatingTransientSubtitleTransition:(BOOL)a3
{
  self->_animatingTransientSubtitleTransition = a3;
}

- (BOOL)animatingTransientSubtitleTransitionToTransient
{
  return self->_animatingTransientSubtitleTransitionToTransient;
}

- (void)setAnimatingTransientSubtitleTransitionToTransient:(BOOL)a3
{
  self->_animatingTransientSubtitleTransitionToTransient = a3;
}

- (NSMutableArray)pendedTransientSubtitleViews
{
  return self->_pendedTransientSubtitleViews;
}

- (void)setPendedTransientSubtitleViews:(id)a3
{
}

- (BOOL)hasClearedSinceLastAddedTransient
{
  return self->_hasClearedSinceLastAddedTransient;
}

- (void)setHasClearedSinceLastAddedTransient:(BOOL)a3
{
  self->_hasClearedSinceLastAddedTransient = a3;
}

- (BSUIOrientationTransformWrapperView)backgroundTransformView
{
  return self->_backgroundTransformView;
}

- (void)setBackgroundTransformView:(id)a3
{
}

- (_CSProminentDisplayBackgroundWrapperView)backgroundWrapperView
{
  return self->_backgroundWrapperView;
}

- (void)setBackgroundWrapperView:(id)a3
{
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_backgroundWrapperView, 0);
  objc_storeStrong((id *)&self->_backgroundTransformView, 0);
  objc_storeStrong((id *)&self->_pendedTransientSubtitleViews, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_customSubtitleView, 0);
  objc_storeStrong((id *)&self->_transientSubtitleView, 0);
  objc_storeStrong((id *)&self->_complicationSidebarView, 0);
  objc_storeStrong((id *)&self->_complicationRowView, 0);
  objc_storeStrong((id *)&self->_subtitleComplicationView, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_vibrancyShadowView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);

  objc_storeStrong((id *)&self->_timeVibrancyEffectView, 0);
}

@end