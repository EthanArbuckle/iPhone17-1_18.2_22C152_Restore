@interface HUQuickControlStepperView
- (BOOL)_shouldRequireMinimumDragDistanceForGestureRecognizer:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isUserInteractionActive;
- (CGPoint)lastTouchLocation;
- (CGSize)intrinsicContentSize;
- (HUQuickControlStepperView)initWithProfile:(id)a3;
- (HUQuickControlStepperViewProfile)profile;
- (HUQuickControlViewInteractionDelegate)interactionDelegate;
- (NSArray)constraints;
- (NSArray)segmentViews;
- (NSArray)separatorEffectViews;
- (NSArray)separatorViews;
- (NSNumber)selectedSegmentIndex;
- (NSNumber)trackingSegmentIndex;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UILongPressGestureRecognizer)gestureRecognizer;
- (UIView)backgroundView;
- (double)accumulatedTouchDistance;
- (id)_stepperViewMetricsForControlSize:(unint64_t)a3;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (unint64_t)reachabilityState;
- (void)_actuateTapticFeedback;
- (void)_createSegmentAndSeparatorViews;
- (void)_handleGesture:(id)a3;
- (void)_layoutSegmentViews;
- (void)_prepareForTapticFeedback;
- (void)_updateSegmentHighlightedState;
- (void)_updateUIForReachabilityState:(unint64_t)a3;
- (void)_updateUserInteractionActive:(BOOL)a3 forFirstTouch:(BOOL)a4;
- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)setAccumulatedTouchDistance:(double)a3;
- (void)setBackgroundView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setLastTouchLocation:(CGPoint)a3;
- (void)setProfile:(id)a3;
- (void)setReachabilityState:(unint64_t)a3;
- (void)setSegmentViews:(id)a3;
- (void)setSelectedSegmentIndex:(id)a3;
- (void)setSeparatorEffectViews:(id)a3;
- (void)setSeparatorViews:(id)a3;
- (void)setTrackingSegmentIndex:(id)a3;
- (void)setUserInteractionActive:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)tintColorDidChange;
- (void)updateConstraints;
@end

@implementation HUQuickControlStepperView

- (HUQuickControlStepperView)initWithProfile:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HUQuickControlStepperView.m", 88, @"Invalid parameter not satisfying: %@", @"[profile isKindOfClass:[HUQuickControlStepperViewProfile class]]" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)HUQuickControlStepperView;
  v6 = [(HUQuickControlStepperView *)&v23 init];
  v7 = v6;
  if (v6)
  {
    [(HUQuickControlStepperView *)v6 setProfile:v5];
    [(HUQuickControlStepperView *)v7 setReachabilityState:0];
    id v8 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(HUQuickControlStepperView *)v7 setBackgroundView:v8];

    if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
    {
      v9 = [MEMORY[0x1E4F5AE10] controlCenterTertiaryMaterial];
      [v9 setAutoresizingMask:18];
      v10 = [(HUQuickControlStepperView *)v7 backgroundView];
      [v10 addSubview:v9];
    }
    else
    {
      v9 = [MEMORY[0x1E4F428B8] quaternarySystemFillColor];
      v10 = [(HUQuickControlStepperView *)v7 backgroundView];
      [v10 setBackgroundColor:v9];
    }

    v11 = [(HUQuickControlStepperView *)v7 backgroundView];
    v12 = [v11 layer];
    [v12 setMasksToBounds:1];

    v13 = [(HUQuickControlStepperView *)v7 backgroundView];
    [v13 setAutoresizingMask:18];

    v14 = [(HUQuickControlStepperView *)v7 backgroundView];
    [(HUQuickControlStepperView *)v7 addSubview:v14];

    [(HUQuickControlStepperView *)v7 _createSegmentAndSeparatorViews];
    v15 = [(HUQuickControlStepperView *)v7 layer];
    [v15 setAllowsGroupOpacity:0];

    v16 = [(HUQuickControlStepperView *)v7 layer];
    [v16 setAllowsGroupBlending:0];

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v7 action:sel__handleGesture_];
    [(HUQuickControlStepperView *)v7 setGestureRecognizer:v17];

    v18 = [(HUQuickControlStepperView *)v7 gestureRecognizer];
    [v18 setDelegate:v7];

    v19 = [(HUQuickControlStepperView *)v7 gestureRecognizer];
    [v19 setMinimumPressDuration:0.0];

    v20 = [(HUQuickControlStepperView *)v7 gestureRecognizer];
    [(HUQuickControlStepperView *)v7 addGestureRecognizer:v20];

    [(HUQuickControlStepperView *)v7 _prepareForTapticFeedback];
  }

  return v7;
}

- (void)setProfile:(id)a3
{
  v4 = (HUQuickControlStepperViewProfile *)a3;
  unint64_t v5 = [(HUQuickControlViewProfile *)self->_profile controlSize];
  uint64_t v6 = [(HUQuickControlViewProfile *)v4 controlSize];
  profile = self->_profile;
  self->_profile = v4;

  [(HUQuickControlStepperView *)self setNeedsLayout];
  if (v5 != v6)
  {
    [(HUQuickControlStepperView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_createSegmentAndSeparatorViews
{
  v29 = objc_opt_new();
  v27 = objc_opt_new();
  v26 = objc_opt_new();
  v3 = [(HUQuickControlStepperView *)self profile];
  uint64_t v4 = [v3 numberOfSegments];

  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v28 = MEMORY[0x1E4F143A8];
    do
    {
      v30[0] = v28;
      v30[1] = 3221225472;
      v30[2] = __60__HUQuickControlStepperView__createSegmentAndSeparatorViews__block_invoke;
      v30[3] = &unk_1E63894C8;
      v30[4] = self;
      v30[5] = v5;
      uint64_t v6 = __60__HUQuickControlStepperView__createSegmentAndSeparatorViews__block_invoke((uint64_t)v30);
      if (v6)
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F43028]);
        if ([MEMORY[0x1E4F69758] shouldUseControlCenterMaterials])
        {
          id v8 = [MEMORY[0x1E4F42FE8] controlCenterKeyLineOnDarkVibrancyEffect];
          [v7 setEffect:v8];
        }
        v9 = objc_alloc_init(HUQuickControlStepperSeparatorView);
        v10 = [v7 contentView];
        [v10 addSubview:v9];

        v11 = [(HUQuickControlStepperView *)self backgroundView];
        [v11 addSubview:v7];

        [v27 addObject:v9];
        [v26 addObject:v7];
        [v7 setTag:v5];
      }
      v12 = [HUQuickControlStepperSegmentView alloc];
      v13 = [(HUQuickControlStepperView *)self profile];
      uint64_t v14 = [v13 stepperStyle];
      v15 = [(HUQuickControlStepperView *)self profile];
      uint64_t v16 = [v15 orientation];
      v17 = [(HUQuickControlStepperView *)self profile];
      v18 = -[HUQuickControlStepperSegmentView initWithStyle:orientation:controlSize:](v12, "initWithStyle:orientation:controlSize:", v14, v16, [v17 controlSize]);

      [(HUQuickControlStepperSegmentView *)v18 setTag:v5];
      [(HUQuickControlStepperSegmentView *)v18 setSegmentLocation:v6];
      v19 = [(HUQuickControlStepperView *)self profile];
      LODWORD(v12) = [v19 showSegmentTitles];

      if (v12)
      {
        v20 = [(HUQuickControlStepperView *)self profile];
        v21 = [v20 segmentTitles];
        v22 = [v21 objectAtIndexedSubscript:v5];
        [(HUQuickControlStepperSegmentView *)v18 setTitle:v22];
      }
      objc_super v23 = [(HUQuickControlStepperView *)self backgroundView];
      [v23 addSubview:v18];

      [v29 addObject:v18];
      ++v5;
      v24 = [(HUQuickControlStepperView *)self profile];
      unint64_t v25 = [v24 numberOfSegments];
    }
    while (v5 < v25);
  }
  [(HUQuickControlStepperView *)self setSegmentViews:v29];
  [(HUQuickControlStepperView *)self setSeparatorViews:v27];
  [(HUQuickControlStepperView *)self setSeparatorEffectViews:v26];
}

uint64_t __60__HUQuickControlStepperView__createSegmentAndSeparatorViews__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1) {
    return 0;
  }
  v2 = [*(id *)(a1 + 32) profile];
  uint64_t v3 = [v2 numberOfSegments] - 1;

  if (v1 == v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)layoutSubviews
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)HUQuickControlStepperView;
  [(HUQuickControlStepperView *)&v29 layoutSubviews];
  [(HUQuickControlStepperView *)self _layoutSegmentViews];
  uint64_t v3 = [(HUQuickControlStepperView *)self profile];
  uint64_t v4 = -[HUQuickControlStepperView _stepperViewMetricsForControlSize:](self, "_stepperViewMetricsForControlSize:", [v3 controlSize]);
  [v4 cornerRadius];
  double v6 = v5;

  id v7 = [(HUQuickControlStepperView *)self backgroundView];
  [v7 _setContinuousCornerRadius:v6];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = [(HUQuickControlStepperView *)self segmentViews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    double v12 = fmax(v6 + -8.0, 0.0);
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) setCornerRadius:v12];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(HUQuickControlStepperView *)self profile];
  uint64_t v15 = [v14 stepperStyle];

  if (v15 == 1)
  {
    id v22 = [MEMORY[0x1E4F428B8] systemLightGrayColor];
    uint64_t v23 = [v22 CGColor];
    v24 = [(HUQuickControlStepperView *)self layer];
    [v24 setBorderColor:v23];

    v19 = [(HUQuickControlStepperView *)self layer];
    v20 = v19;
    double v21 = 1.0;
    goto LABEL_12;
  }
  if (!v15)
  {
    id v16 = [MEMORY[0x1E4F428B8] clearColor];
    uint64_t v17 = [v16 CGColor];
    v18 = [(HUQuickControlStepperView *)self layer];
    [v18 setBorderColor:v17];

    v19 = [(HUQuickControlStepperView *)self layer];
    v20 = v19;
    double v21 = 0.0;
LABEL_12:
    [v19 setBorderWidth:v21];
  }
  [(HUQuickControlStepperView *)self _updateUIForReachabilityState:[(HUQuickControlStepperView *)self reachabilityState]];
}

- (void)_layoutSegmentViews
{
  uint64_t v3 = [(HUQuickControlStepperView *)self profile];
  uint64_t v4 = [v3 numberOfSegments];

  if (v4)
  {
    double v5 = [(HUQuickControlStepperView *)self profile];
    double v6 = -[HUQuickControlStepperView intrinsicSizeDescriptorForControlSize:](self, "intrinsicSizeDescriptorForControlSize:", [v5 controlSize]);
    [v6 intrinsicSize];
    uint64_t v8 = v7;
    uint64_t v10 = v9;

    uint64_t v11 = [(HUQuickControlStepperView *)self profile];
    if ([v11 orientation]) {
      uint64_t v12 = v8;
    }
    else {
      uint64_t v12 = v10;
    }

    UIRoundToViewScale();
    uint64_t v14 = v13;
    UIFloorToViewScale();
    uint64_t v16 = v15;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    uint64_t v17 = [(HUQuickControlStepperView *)self segmentViews];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __48__HUQuickControlStepperView__layoutSegmentViews__block_invoke;
    v18[3] = &unk_1E6390248;
    v18[6] = v14;
    v18[7] = v4;
    v18[8] = v16;
    v18[9] = v4 - 1;
    v18[4] = self;
    v18[5] = v19;
    v18[10] = v8;
    v18[11] = v10;
    v18[12] = v12;
    [v17 enumerateObjectsUsingBlock:v18];

    _Block_object_dispose(v19, 8);
  }
}

void __48__HUQuickControlStepperView__layoutSegmentViews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v36 = a2;
  double v5 = 0.0;
  if (*(void *)(a1 + 56) - 1 == a3) {
    double v5 = *(double *)(a1 + 64);
  }
  double v6 = *(double *)(a1 + 48);
  unint64_t v7 = *(void *)(a1 + 72);
  if (v7 <= a3)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) separatorViews];
    uint64_t v9 = [v8 objectAtIndexedSubscript:a3];

    unint64_t v7 = *(void *)(a1 + 72);
  }
  uint64_t v10 = (double *)MEMORY[0x1E4F1DB28];
  if (v7 <= a3)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) separatorEffectViews];
    uint64_t v12 = [v11 objectAtIndexedSubscript:a3];
  }
  double v13 = v10[1];
  double v14 = v6 + v5;
  uint64_t v15 = [*(id *)(a1 + 32) profile];
  uint64_t v16 = [v15 orientation];

  if (v16 == 2)
  {
    uint64_t v28 = *(void *)(a1 + 40);
    double v21 = (double *)(a1 + 40);
    uint64_t v29 = *(void *)(v28 + 8);
    double v30 = *(double *)(v29 + 24);
    double v31 = v21[6];
    double v32 = v21[7] - v30 - v14;
    *(double *)(v29 + 24) = v14 + v30;
    objc_msgSend(v36, "setFrame:", v32, v13, v14, v31);
    double v20 = v32 + -1.0;
LABEL_15:
    double v35 = v21[6];
    double v17 = v35 * 0.5;
    double MaxY = (v35 - v35 * 0.5) * 0.5;
    double v18 = 1.0;
    goto LABEL_16;
  }
  if (v16 == 1)
  {
    uint64_t v33 = *(void *)(a1 + 40);
    double v21 = (double *)(a1 + 40);
    uint64_t v34 = *(void *)(v33 + 8);
    double v20 = v14 + *(double *)(v34 + 24);
    *(double *)(v34 + 24) = v20;
    objc_msgSend(v36, "setFrame:");
    goto LABEL_15;
  }
  double v17 = 0.0;
  double v18 = 0.0;
  double MaxY = 0.0;
  double v20 = 0.0;
  if (v16) {
    goto LABEL_17;
  }
  uint64_t v22 = *(void *)(a1 + 40);
  double v21 = (double *)(a1 + 40);
  double v23 = *v10;
  uint64_t v24 = *(void *)(v22 + 8);
  double v25 = *(double *)(v24 + 24);
  double v26 = v21[5];
  *(double *)(v24 + 24) = v14 + v25;
  objc_msgSend(v36, "setFrame:", v23, v25, v26, v14);
  v38.origin.x = v23;
  v38.origin.y = v25;
  v38.size.width = v26;
  v38.size.height = v14;
  double MaxY = CGRectGetMaxY(v38);
  double v27 = v21[5];
  double v18 = v27 * 0.5;
  double v20 = (v27 - v27 * 0.5) * 0.5;
  double v17 = 1.0;
LABEL_16:
  *(double *)(*(void *)(*(void *)v21 + 8) + 24) = *(double *)(*(void *)(*(void *)v21 + 8) + 24) + 1.0;
LABEL_17:
  objc_msgSend(v12, "setFrame:", v20, MaxY, v18, v17);
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v18, v17);
}

- (void)_handleGesture:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HUQuickControlStepperView *)self conformsToProtocol:&unk_1F1A161E8]
    && (objc_opt_respondsToSelector() & 1) != 0
    && (![(HUQuickControlStepperView *)self reachabilityState]
     || [(HUQuickControlStepperView *)self reachabilityState] == 1))
  {
    double v5 = HUQuickControlReachabilityString([(HUQuickControlStepperView *)self reachabilityState]);
    double v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412802;
      double v32 = self;
      __int16 v33 = 2112;
      uint64_t v34 = v5;
      __int16 v35 = 2080;
      id v36 = "-[HUQuickControlStepperView _handleGesture:]";
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Control view %@ is in state %@. Ignoring long press gesture in %s.", (uint8_t *)&v31, 0x20u);
    }
  }
  else
  {
    uint64_t v7 = [v4 state];
    id v8 = [(HUQuickControlStepperView *)self gestureRecognizer];

    if ((unint64_t)(v7 - 1) > 1)
    {
      if (v7 == 3)
      {
        uint64_t v24 = [(HUQuickControlStepperView *)self trackingSegmentIndex];

        if (v24)
        {
          double v25 = [(HUQuickControlStepperView *)self selectedSegmentIndex];
          double v26 = [(HUQuickControlStepperView *)self trackingSegmentIndex];
          char v27 = [v25 isEqual:v26];

          uint64_t v28 = [(HUQuickControlStepperView *)self trackingSegmentIndex];
          [(HUQuickControlStepperView *)self setSelectedSegmentIndex:v28];

          if ((v27 & 1) == 0)
          {
            uint64_t v29 = [(HUQuickControlStepperView *)self interactionDelegate];
            double v30 = [(HUQuickControlStepperView *)self value];
            [v29 controlView:self valueDidChange:v30];
          }
        }
      }
      [(HUQuickControlStepperView *)self _updateUserInteractionActive:0 forFirstTouch:v8 != v4];
      [(HUQuickControlStepperView *)self setTrackingSegmentIndex:0];
      [(HUQuickControlStepperView *)self setAccumulatedTouchDistance:0.0];
      -[HUQuickControlStepperView setLastTouchLocation:](self, "setLastTouchLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      [(HUQuickControlStepperView *)self _updateSegmentHighlightedState];
      [(HUQuickControlStepperView *)self _actuateTapticFeedback];
    }
    else
    {
      [(HUQuickControlStepperView *)self _updateUserInteractionActive:1 forFirstTouch:v8 != v4];
      [v4 locationInView:self];
      double v10 = v9;
      double v12 = v11;
      if (![(HUQuickControlStepperView *)self _shouldRequireMinimumDragDistanceForGestureRecognizer:v4])goto LABEL_16; {
      [(HUQuickControlStepperView *)self lastTouchLocation];
      }
      if (v14 != *MEMORY[0x1E4F1DAD8] || v13 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
      {
        [(HUQuickControlStepperView *)self lastTouchLocation];
        UIDistanceBetweenPoints();
        double v17 = v16;
        [(HUQuickControlStepperView *)self accumulatedTouchDistance];
        [(HUQuickControlStepperView *)self setAccumulatedTouchDistance:v17 + v18];
      }
      -[HUQuickControlStepperView setLastTouchLocation:](self, "setLastTouchLocation:", v10, v12);
      [(HUQuickControlStepperView *)self accumulatedTouchDistance];
      if (v19 >= 25.0)
      {
LABEL_16:
        double v20 = -[HUQuickControlStepperView hitTest:withEvent:](self, "hitTest:withEvent:", 0, v10, v12);
        objc_opt_class();
        double v21 = 0;
        if (objc_opt_isKindOfClass())
        {
          double v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "tag"));
        }
        uint64_t v22 = [(HUQuickControlStepperView *)self trackingSegmentIndex];
        char v23 = [v22 isEqual:v21];

        if ((v23 & 1) == 0)
        {
          [(HUQuickControlStepperView *)self setTrackingSegmentIndex:v21];
          [(HUQuickControlStepperView *)self _updateSegmentHighlightedState];
        }
      }
    }
  }
}

- (void)_updateSegmentHighlightedState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__HUQuickControlStepperView__updateSegmentHighlightedState__block_invoke;
  v2[3] = &unk_1E6386018;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v2 animations:0.15];
}

void __59__HUQuickControlStepperView__updateSegmentHighlightedState__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) trackingSegmentIndex];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) selectedSegmentIndex];
  }
  double v5 = v4;

  if ([*(id *)(a1 + 32) reachabilityState] == 1 || !objc_msgSend(*(id *)(a1 + 32), "reachabilityState"))
  {
    char v8 = 1;
    double v6 = v5;
    double v5 = 0;
    goto LABEL_9;
  }
  if (v5)
  {
    double v6 = [*(id *)(a1 + 32) segmentViews];
    uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "integerValue"));
    [v7 setIsSegmentViewHighlighted:1];

    char v8 = 0;
LABEL_9:

    goto LABEL_10;
  }
  char v8 = 1;
LABEL_10:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v9 = [*(id *)(a1 + 32) segmentViews];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ((v8 & 1) == 0)
        {
          uint64_t v15 = [*(id *)(*((void *)&v29 + 1) + 8 * i) tag];
          if (v15 == [v5 integerValue]) {
            continue;
          }
        }
        [v14 setIsSegmentViewHighlighted:0];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v11);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v16 = objc_msgSend(*(id *)(a1 + 32), "separatorEffectViews", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        if (v8)
        {
          BOOL v22 = 0;
        }
        else
        {
          uint64_t v23 = [*(id *)(*((void *)&v25 + 1) + 8 * j) tag];
          if (v23 == [v5 integerValue])
          {
            BOOL v22 = 1;
          }
          else
          {
            uint64_t v24 = [v21 tag];
            BOOL v22 = v24 == [v5 integerValue] + 1;
          }
        }
        [v21 setHidden:v22];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v18);
  }
}

- (BOOL)_shouldRequireMinimumDragDistanceForGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlStepperView *)self gestureRecognizer];

  return v5 != v4;
}

- (void)_updateUserInteractionActive:(BOOL)a3 forFirstTouch:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(HUQuickControlStepperView *)self isUserInteractionActive] != a3)
  {
    [(HUQuickControlStepperView *)self setUserInteractionActive:v5];
    id v7 = [(HUQuickControlStepperView *)self interactionDelegate];
    [v7 controlView:self interactionStateDidChange:v5 forFirstTouch:v4];
  }
}

- (void)updateConstraints
{
  v23.receiver = self;
  v23.super_class = (Class)HUQuickControlStepperView;
  [(HUQuickControlStepperView *)&v23 updateConstraints];
  uint64_t v3 = (void *)MEMORY[0x1E4F28DC8];
  BOOL v4 = [(HUQuickControlStepperView *)self constraints];
  [v3 deactivateConstraints:v4];

  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HUQuickControlStepperView_updateConstraints__block_invoke;
  aBlock[3] = &unk_1E6386F20;
  id v21 = v5;
  BOOL v22 = self;
  id v6 = v5;
  id v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  char v8 = [(HUQuickControlStepperView *)self backgroundView];
  v7[2](v7, v8);

  double v9 = [(HUQuickControlStepperView *)self profile];
  uint64_t v10 = -[HUQuickControlStepperView intrinsicSizeDescriptorForControlSize:](self, "intrinsicSizeDescriptorForControlSize:", [v9 controlSize]);
  [v10 intrinsicSize];
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [(HUQuickControlStepperView *)self widthAnchor];
  double v16 = [v15 constraintEqualToConstant:v12];
  [v16 setActive:1];

  uint64_t v17 = [(HUQuickControlStepperView *)self heightAnchor];
  uint64_t v18 = [v17 constraintEqualToConstant:v14];
  [v18 setActive:1];

  [MEMORY[0x1E4F28DC8] activateConstraints:v6];
  [(HUQuickControlStepperView *)self setConstraints:v6];
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlStepperView;
  [(HUQuickControlStepperView *)&v19 updateConstraints];
}

void __46__HUQuickControlStepperView_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v4 topAnchor];
  id v6 = [*(id *)(a1 + 40) topAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  [v3 addObject:v7];

  char v8 = *(void **)(a1 + 32);
  double v9 = [v4 bottomAnchor];
  uint64_t v10 = [*(id *)(a1 + 40) bottomAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10];
  [v8 addObject:v11];

  double v12 = *(void **)(a1 + 32);
  double v13 = [v4 leadingAnchor];
  double v14 = [*(id *)(a1 + 40) leadingAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14];
  [v12 addObject:v15];

  double v16 = *(void **)(a1 + 32);
  id v19 = [v4 trailingAnchor];

  uint64_t v17 = [*(id *)(a1 + 40) trailingAnchor];
  uint64_t v18 = [v19 constraintEqualToAnchor:v17];
  [v16 addObject:v18];
}

- (id)_stepperViewMetricsForControlSize:(unint64_t)a3
{
  BOOL v5 = [(HUQuickControlStepperView *)self profile];
  uint64_t v6 = [v5 orientation];
  id v7 = [(HUQuickControlStepperView *)self profile];
  char v8 = HUQuickControlStepperViewMetricsForOrientation(a3, v6, [v7 numberOfSegments]);

  return v8;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = [(HUQuickControlStepperView *)self profile];
  uint64_t v4 = [v3 controlSize];
  BOOL v5 = [(HUQuickControlStepperView *)self profile];
  uint64_t v6 = [v5 orientation];
  id v7 = [(HUQuickControlStepperView *)self profile];
  char v8 = HUQuickControlStepperViewMetricsForOrientation(v4, v6, [v7 numberOfSegments]);
  double v9 = [v8 sizeDescriptor];
  [v9 intrinsicSize];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)_prepareForTapticFeedback
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F42AA8]) initWithStyle:3];
  [(HUQuickControlStepperView *)self setFeedbackGenerator:v3];

  id v4 = [(HUQuickControlStepperView *)self feedbackGenerator];
  [v4 prepare];
}

- (void)_actuateTapticFeedback
{
  uint64_t v3 = [(HUQuickControlStepperView *)self feedbackGenerator];
  [v3 impactOccurred];

  id v4 = [(HUQuickControlStepperView *)self feedbackGenerator];
  [v4 prepare];
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  uint64_t v3 = [(HUQuickControlStepperView *)self _stepperViewMetricsForControlSize:a3];
  id v4 = [v3 sizeDescriptor];

  return v4;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v10 = v4;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v10;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v10;
    if (v6) {
      goto LABEL_8;
    }
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    double v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v5, objc_opt_class() file lineNumber description];
  }
  id v7 = 0;
LABEL_8:

  [(HUQuickControlStepperView *)self setSelectedSegmentIndex:v7];
  [(HUQuickControlStepperView *)self _updateSegmentHighlightedState];
}

- (void)setReachabilityState:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_reachabilityState = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(HUQuickControlStepperView *)self segmentViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setReachabilityState:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(HUQuickControlStepperView *)self _updateUIForReachabilityState:a3];
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlStepperView;
  [(HUQuickControlStepperView *)&v5 tintColorDidChange];
  uint64_t v3 = [(HUQuickControlStepperView *)self segmentViews];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__HUQuickControlStepperView_tintColorDidChange__block_invoke;
  v4[3] = &unk_1E6390270;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __47__HUQuickControlStepperView_tintColorDidChange__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 profile];
  id v4 = [v5 tintColor];
  [v3 setTintColor:v4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 >= 2)
  {
    if (a3 != 2) {
      goto LABEL_6;
    }
    uint64_t v4 = 1;
    double v5 = 1.0;
  }
  else
  {
    uint64_t v4 = 0;
    double v5 = 0.5;
  }
  [(HUQuickControlStepperView *)self setAlpha:v5];
  [(HUQuickControlStepperView *)self setUserInteractionEnabled:v4];
LABEL_6:

  [(HUQuickControlStepperView *)self _updateSegmentHighlightedState];
}

- (HUQuickControlViewInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (HUQuickControlViewInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (HUQuickControlStepperViewProfile)profile
{
  return self->_profile;
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (NSArray)segmentViews
{
  return self->_segmentViews;
}

- (void)setSegmentViews:(id)a3
{
}

- (NSArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
}

- (NSArray)separatorEffectViews
{
  return self->_separatorEffectViews;
}

- (void)setSeparatorEffectViews:(id)a3
{
}

- (NSNumber)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (void)setSelectedSegmentIndex:(id)a3
{
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (CGPoint)lastTouchLocation
{
  double x = self->_lastTouchLocation.x;
  double y = self->_lastTouchLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastTouchLocation:(CGPoint)a3
{
  self->_lastTouchLocation = a3;
}

- (double)accumulatedTouchDistance
{
  return self->_accumulatedTouchDistance;
}

- (void)setAccumulatedTouchDistance:(double)a3
{
  self->_accumulatedTouchDistance = a3;
}

- (BOOL)isUserInteractionActive
{
  return self->_userInteractionActive;
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (NSNumber)trackingSegmentIndex
{
  return self->_trackingSegmentIndex;
}

- (void)setTrackingSegmentIndex:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_trackingSegmentIndex, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectedSegmentIndex, 0);
  objc_storeStrong((id *)&self->_separatorEffectViews, 0);
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_segmentViews, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_profile, 0);

  objc_destroyWeak((id *)&self->_interactionDelegate);
}

@end