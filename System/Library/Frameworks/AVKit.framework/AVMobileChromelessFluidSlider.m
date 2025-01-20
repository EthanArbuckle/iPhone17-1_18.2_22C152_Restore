@interface AVMobileChromelessFluidSlider
+ (double)variableSpeedScrubbingMultiplierForDistanceToEdge:(double)a3;
- (AVMobileChromelessFluidSlider)init;
- (AVMobileChromelessFluidSliderDelegate)delegate;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)prefersSliderTrackHidden;
- (BOOL)sliderIsOverVideo;
- (BOOL)usesVolumeStyle;
- (CGRect)contentIntersection;
- (CGRect)frameForSliderMark:(id)a3;
- (CGRect)hitRect;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (NSArray)sliderMarks;
- (NSArray)snappingValues;
- (NSDirectionalEdgeInsets)directionalHitRectInsets;
- (UIVisualEffect)filledBarVisualEffect;
- (UIVisualEffect)unfilledBarVisualEffect;
- (double)barHeight;
- (double)barWidth;
- (double)stretchLimit;
- (double)variableSpeedScrubbingOffsetMultiplier;
- (float)_normalizeSliderMarkValue:(uint64_t)a1;
- (float)totalValue;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (uint64_t)_updateSliderStyle;
- (unint64_t)fineScrubbingStyle;
- (unint64_t)tintState;
- (void)_frameForSliderMark:(void *)a1;
- (void)_notifyDelegateAboutSpeedRateChangeToRate:(void *)a1;
- (void)_setUpSliderConfigurationIfNeeded;
- (void)_sliderFluidInteractionDidEnd:(id)a3;
- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4;
- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4;
- (void)_sliderFluidInteractionWillEnd:(id)a3;
- (void)_sliderFluidInteractionWillExtend:(id)a3 insets:(UIEdgeInsets)a4;
- (void)_updateBarTintStateAlpha;
- (void)_updateBarVisualEffectsIfNeeded;
- (void)_updateSliderBarMaterials;
- (void)_updateSliderMarkViewColors;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBarHeight:(double)a3;
- (void)setBarWidth:(double)a3;
- (void)setContentIntersection:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectionalHitRectInsets:(NSDirectionalEdgeInsets)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFilledBarVisualEffect:(id)a3;
- (void)setFineScrubbingStyle:(unint64_t)a3;
- (void)setMaximumValueView:(id)a3;
- (void)setPrefersSliderTrackHidden:(BOOL)a3;
- (void)setSliderIsOverVideo:(BOOL)a3;
- (void)setSliderMarks:(id)a3;
- (void)setSnappingValues:(id)a3;
- (void)setStretchLimit:(double)a3;
- (void)setTintState:(unint64_t)a3;
- (void)setTotalValue:(float)a3;
- (void)setUnfilledBarVisualEffect:(id)a3;
- (void)setUsesVolumeStyle:(BOOL)a3;
- (void)setVariableSpeedScrubbingOffsetMultiplier:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AVMobileChromelessFluidSlider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unfilledBarVisualEffect, 0);
  objc_storeStrong((id *)&self->_sliderMarks, 0);
  objc_storeStrong((id *)&self->_snappingValues, 0);
  objc_storeStrong((id *)&self->_filledBarVisualEffect, 0);
  objc_storeStrong((id *)&self->_fluidSliderConfiguration, 0);
  objc_storeStrong((id *)&self->_speedChangeFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_sliderPointerInteraction, 0);
  objc_storeStrong((id *)&self->_disabledUnfilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_disabledFilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_sliderMarkViews, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)setDirectionalHitRectInsets:(NSDirectionalEdgeInsets)a3
{
  self->_directionalHitRectInsets = a3;
}

- (NSDirectionalEdgeInsets)directionalHitRectInsets
{
  double top = self->_directionalHitRectInsets.top;
  double leading = self->_directionalHitRectInsets.leading;
  double bottom = self->_directionalHitRectInsets.bottom;
  double trailing = self->_directionalHitRectInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (BOOL)usesVolumeStyle
{
  return self->_usesVolumeStyle;
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileChromelessFluidSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileChromelessFluidSliderDelegate *)WeakRetained;
}

- (CGRect)contentIntersection
{
  double x = self->_contentIntersection.origin.x;
  double y = self->_contentIntersection.origin.y;
  double width = self->_contentIntersection.size.width;
  double height = self->_contentIntersection.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)variableSpeedScrubbingOffsetMultiplier
{
  return self->_variableSpeedScrubbingOffsetMultiplier;
}

- (UIVisualEffect)unfilledBarVisualEffect
{
  return self->_unfilledBarVisualEffect;
}

- (float)totalValue
{
  return self->_totalValue;
}

- (unint64_t)tintState
{
  return self->_tintState;
}

- (double)stretchLimit
{
  return self->_stretchLimit;
}

- (NSArray)sliderMarks
{
  return self->_sliderMarks;
}

- (NSArray)snappingValues
{
  return self->_snappingValues;
}

- (BOOL)prefersSliderTrackHidden
{
  return self->_prefersSliderTrackHidden;
}

- (unint64_t)fineScrubbingStyle
{
  return self->_fineScrubbingStyle;
}

- (UIVisualEffect)filledBarVisualEffect
{
  return self->_filledBarVisualEffect;
}

- (double)barWidth
{
  return self->_barWidth;
}

- (double)barHeight
{
  return self->_barHeight;
}

- (BOOL)sliderIsOverVideo
{
  return self->_sliderIsOverVideo;
}

- (void)setContentIntersection:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentIntersection = &self->_contentIntersection;
  if (!CGRectEqualToRect(self->_contentIntersection, a3))
  {
    p_contentIntersection->origin.CGFloat x = x;
    p_contentIntersection->origin.CGFloat y = y;
    p_contentIntersection->size.CGFloat width = width;
    p_contentIntersection->size.CGFloat height = height;
    [(AVMobileChromelessFluidSlider *)self bounds];
    unint64_t v11 = (unint64_t)(COERCE__INT64(fabs(v9 * v10)) - 0x10000000000000) >> 53;
    BOOL v14 = (COERCE__INT64(v9 * v10) >= 0 && v11 <= 0x3FE
        || (unint64_t)(COERCE__INT64(v9 * v10) - 1) <= 0xFFFFFFFFFFFFELL)
       && p_contentIntersection->size.height * p_contentIntersection->size.width / (v9 * v10) > 0.8;
    [(AVMobileChromelessFluidSlider *)self setSliderIsOverVideo:v14];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVMobileChromelessFluidSlider *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVMobileChromelessFluidSlider;
    [(AVMobileChromelessFluidSlider *)&v5 setEnabled:v3];
    -[AVMobileChromelessFluidSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.super.isa);
  }
}

- (void)_updateSliderBarMaterials
{
  if (a1)
  {
    id v5 = a1[67];
    id v2 = a1[68];
    if ([a1 isEnabled])
    {
      id v3 = a1[76];

      id v4 = a1[82];
      id v5 = v3;
      id v2 = v4;
    }
    [a1[71] setMaximumTrackEffect:v2];
    [a1[71] setMinimumTrackEffect:v5];
    [a1 _setSliderConfiguration:a1[71]];
  }
}

- (void)_sliderFluidInteractionWillExtend:(id)a3 insets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v9 = [(AVMobileChromelessFluidSlider *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(AVMobileChromelessFluidSlider *)self delegate];
    objc_msgSend(v11, "slider:didExtendWithInsets:", self, top, left, bottom, right);
  }
}

- (void)_sliderFluidInteractionDidEnd:(id)a3
{
  id v4 = [(AVMobileChromelessFluidSlider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(AVMobileChromelessFluidSlider *)self delegate];
    [v6 sliderDidEndTracking:self];
  }
  [(AVMobileChromelessFluidSlider *)self _sliderSpeedMultiplier];
  if (*(float *)&v7 != 1.0)
  {
    LODWORD(v7) = 1.0;
    [(AVMobileChromelessFluidSlider *)self _setSliderSpeedMultiplier:v7];
    -[AVMobileChromelessFluidSlider _notifyDelegateAboutSpeedRateChangeToRate:](self, 0);
  }
}

- (void)_notifyDelegateAboutSpeedRateChangeToRate:(void *)a1
{
  if (a1)
  {
    id v4 = [a1 delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [a1 delegate];
      [v6 slider:a1 didChangeScrubbingRate:a2];
    }
  }
}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  id v4 = [(AVMobileChromelessFluidSlider *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVMobileChromelessFluidSlider *)self delegate];
    [v6 sliderWillEndTracking:self];
  }
  if (self)
  {
    sliderPointerInteraction = self->_sliderPointerInteraction;
    [(UIPointerInteraction *)sliderPointerInteraction invalidate];
  }
}

- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4
{
  double y = a4.y;
  if ([(AVMobileChromelessFluidSlider *)self fineScrubbingStyle])
  {
    [(AVMobileChromelessFluidSlider *)self center];
    double v7 = y - v6;
    char v8 = [(AVMobileChromelessFluidSlider *)self fineScrubbingStyle];
    char v9 = [(AVMobileChromelessFluidSlider *)self fineScrubbingStyle];
    if (((v8 & 2) != 0 || v7 <= 0.0) && ((v9 & 1) != 0 || v7 >= 0.0))
    {
      float v10 = fabs(v7);
      double variableSpeedScrubbingOffsetMultiplier = self->_variableSpeedScrubbingOffsetMultiplier;
      float v12 = variableSpeedScrubbingOffsetMultiplier * 196.0;
      float v13 = vabds_f32(v10, v12);
      if (v10 <= v12 || v13 < 0.00000011921)
      {
        float v15 = variableSpeedScrubbingOffsetMultiplier * 140.0;
        float v16 = vabds_f32(v10, v15);
        if (v10 <= v15 || v16 < 0.00000011921)
        {
          float v18 = variableSpeedScrubbingOffsetMultiplier * 84.0;
          BOOL v19 = v10 > v18;
          BOOL v20 = vabds_f32(v10, v18) >= 0.00000011921;
          float v21 = v19 && v20 ? 0.5 : 1.0;
          uint64_t v22 = v19 && v20 ? 2 : 0;
        }
        else
        {
          float v21 = 0.25;
          uint64_t v22 = 1;
        }
      }
      else
      {
        float v21 = 0.125;
        uint64_t v22 = 3;
      }
      [(AVMobileChromelessFluidSlider *)self _sliderSpeedMultiplier];
      if (*(float *)&v23 != v21)
      {
        *(float *)&double v23 = v21;
        [(AVMobileChromelessFluidSlider *)self _setSliderSpeedMultiplier:v23];
        [(UISelectionFeedbackGenerator *)self->_speedChangeFeedbackGenerator selectionChanged];
        -[AVMobileChromelessFluidSlider _notifyDelegateAboutSpeedRateChangeToRate:](self, v22);
      }
    }
  }
}

- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4
{
  char v5 = [(AVMobileChromelessFluidSlider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(AVMobileChromelessFluidSlider *)self delegate];
    [v7 sliderDidBeginTracking:self];
  }
  if (self) {
    [(UIPointerInteraction *)self->_sliderPointerInteraction invalidate];
  }
  unint64_t v8 = [(AVMobileChromelessFluidSlider *)self fineScrubbingStyle];
  speedChangeFeedbackGenerator = self->_speedChangeFeedbackGenerator;
  if (speedChangeFeedbackGenerator) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    [(UISelectionFeedbackGenerator *)speedChangeFeedbackGenerator prepare];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  [(UIView *)self->_contentView frame];
  char v5 = (void *)MEMORY[0x1E4FB1AD8];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1D48];
  id v5 = a3;
  id v6 = [v4 alloc];
  double v7 = [v5 view];

  unint64_t v8 = (void *)[v6 initWithView:v7];
  char v9 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v8];
  [v9 setPreferredTintMode:0];
  BOOL v10 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v9 shape:0];

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessFluidSlider;
  id v4 = a3;
  [(AVMobileChromelessFluidSlider *)&v8 traitCollectionDidChange:v4];
  id v5 = [(AVMobileChromelessFluidSlider *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    -[AVMobileChromelessFluidSlider _updateBarVisualEffectsIfNeeded]((uint64_t)self);
    -[AVMobileChromelessFluidSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.super.isa);
  }
}

- (void)_updateBarVisualEffectsIfNeeded
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = [(id)a1 traitCollection];
    uint64_t v3 = [v2 userInterfaceStyle];

    if (v3 == 1)
    {
      if (!*(unsigned char *)(a1 + 577))
      {
        id v4 = (void *)MEMORY[0x1E4FB1EF8];
        id v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        uint64_t v6 = [v4 effectCompositingColor:v5];
        v23[0] = v6;
        uint64_t v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:13];
        v23[1] = v7;
        objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        uint64_t v9 = [v4 effectCombiningEffects:v8];
        BOOL v10 = *(void **)(a1 + 608);
        *(void *)(a1 + 608) = v9;
      }
      if (!*(unsigned char *)(a1 + 578))
      {
        id v11 = (void *)MEMORY[0x1E4FB1EF8];
        float v12 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
        float v13 = [v11 effectCompositingColor:v12];
        v22[0] = v13;
        BOOL v14 = [MEMORY[0x1E4FB14C8] effectWithStyle:13];
        v22[1] = v14;
        float v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
        uint64_t v16 = [v11 effectCombiningEffects:v15];
        v17 = *(void **)(a1 + 656);
        *(void *)(a1 + 656) = v16;
      }
    }
    else
    {
      if (!*(unsigned char *)(a1 + 577))
      {
        uint64_t v18 = [MEMORY[0x1E4FB14C8] effectWithStyle:14];
        BOOL v19 = *(void **)(a1 + 608);
        *(void *)(a1 + 608) = v18;
      }
      if (!*(unsigned char *)(a1 + 578))
      {
        uint64_t v20 = [MEMORY[0x1E4FB14C8] effectWithStyle:11];
        uint64_t v21 = *(void *)(a1 + 656);
        *(void *)(a1 + 656) = v20;
        MEMORY[0x1F41817F8](v20, v21);
      }
    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(AVMobileChromelessFluidSlider *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)AVMobileChromelessFluidSlider;
  [(AVMobileChromelessFluidSlider *)&v24 layoutSubviews];
  uint64_t v3 = [(AVMobileChromelessFluidSlider *)self effectiveUserInterfaceLayoutDirection];
  contentView = self->_contentView;
  [(AVMobileChromelessFluidSlider *)self bounds];
  -[UIView avkit_setFrame:inLayoutDirection:](contentView, "avkit_setFrame:inLayoutDirection:", v3);
  if ([(NSArray *)self->_sliderMarks count])
  {
    NSUInteger v5 = [(NSArray *)self->_sliderMarks count];
    if (v5 != [(NSMutableArray *)self->_sliderMarkViews count])
    {
      uint64_t v6 = _AVLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_ERROR, "Error: Slider mark count does not match slider mark view count", buf, 2u);
      }
    }
    NSUInteger v7 = [(NSArray *)self->_sliderMarks count];
    unint64_t v8 = [(NSMutableArray *)self->_sliderMarkViews count];
    if (v7 >= v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9 >= 1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        CGFloat v11 = [(NSArray *)self->_sliderMarks objectAtIndex:i];
        float v12 = [(NSMutableArray *)self->_sliderMarkViews objectAtIndex:i];
        -[AVMobileChromelessFluidSlider _frameForSliderMark:](self, v11);
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        objc_msgSend(v12, "setFrame:");
        uint64_t v21 = [(AVMobileChromelessFluidSlider *)self delegate];
        char v22 = objc_opt_respondsToSelector();

        if (v22)
        {
          double v23 = [(AVMobileChromelessFluidSlider *)self delegate];
          objc_msgSend(v23, "slider:didUpdateFrame:forSliderMark:", self, v11, v14, v16, v18, v20);
        }
      }
    }
  }
}

- (void)_frameForSliderMark:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    [a1 bounds];
    id v4 = v3;
    [a1 bounds];
    uint64_t v5 = [v4 markType];
    if (v5 == 2 || !v5)
    {
      [v4 endValue];
      [v4 startValue];
      [a1 maximumValue];
      [a1 minimumValue];
    }

    [v4 startValue];
    -[AVMobileChromelessFluidSlider _normalizeSliderMarkValue:]((uint64_t)a1, v6);
    [v4 markType];
  }
}

- (float)_normalizeSliderMarkValue:(uint64_t)a1
{
  if (*(unsigned char *)(a1 + 576))
  {
    float v4 = *(float *)(a1 + 584);
  }
  else
  {
    [(id)a1 maximumValue];
    float v4 = v5;
  }
  [(id)a1 minimumValue];
  float v7 = v6;
  [(id)a1 minimumValue];
  return (float)(a2 - v7) / (float)(v4 - v8);
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  double barHeight = self->_barHeight;
  result.CGFloat height = barHeight;
  result.CGFloat width = v2;
  return result;
}

- (CGRect)hitRect
{
  v23.receiver = self;
  v23.super_class = (Class)AVMobileChromelessFluidSlider;
  [(AVMobileChromelessFluidSlider *)&v23 hitRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double top = self->_directionalHitRectInsets.top;
  double leading = self->_directionalHitRectInsets.leading;
  double bottom = self->_directionalHitRectInsets.bottom;
  double trailing = self->_directionalHitRectInsets.trailing;
  uint64_t v15 = [(AVMobileChromelessFluidSlider *)self effectiveUserInterfaceLayoutDirection];
  if (v15 == 1) {
    double v16 = trailing;
  }
  else {
    double v16 = leading;
  }
  if (v15 == 1) {
    double v17 = leading;
  }
  else {
    double v17 = trailing;
  }
  double v18 = v8 - (v16 + v17);
  double v19 = v4 + v16 + -20.0;
  double v20 = v6 + top + -20.0;
  double v21 = v18 + 40.0;
  double v22 = v10 - (top + bottom) + 40.0;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = [a3 view];
  LOBYTE(self) = [v4 isDescendantOfView:self];

  return (char)self;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessFluidSlider;
  [(AVMobileChromelessFluidSlider *)&v3 didMoveToWindow];
  -[AVMobileChromelessFluidSlider _updateBarTintStateAlpha](self);
  -[AVMobileChromelessFluidSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.super.isa);
  -[AVMobileChromelessFluidSlider _updateSliderMarkViewColors]((id *)&self->super.super.super.super.super.isa);
}

- (void)_updateBarTintStateAlpha
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    unint64_t v2 = [result tintState];
    self;
    if (v2 >= 3)
    {
      double v4 = _AVLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = 134217984;
        unint64_t v6 = v2;
        _os_log_error_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_ERROR, "Error: Unrecognized slider tint state %ld", (uint8_t *)&v5, 0xCu);
      }

      double v3 = 1.0;
    }
    else
    {
      double v3 = dbl_1B07213C0[v2];
    }
    return (void *)[v1 setAlpha:v3];
  }
  return result;
}

- (void)_updateSliderMarkViewColors
{
  if (a1)
  {
    uint64_t v2 = [a1[79] count];
    if (v2 != [a1[66] count])
    {
      double v3 = _AVLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v18 = 0;
        _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Error: Slider mark count does not match slider mark view count", v18, 2u);
      }
    }
    unint64_t v4 = [a1[79] count];
    unint64_t v5 = [a1[66] count];
    if (v4 >= v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = v4;
    }
    if (v6 >= 1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        double v8 = [a1[79] objectAtIndex:i];
        double v9 = [a1[66] objectAtIndex:i];
        double v10 = [v8 unfilledColor];
        [a1 value];
        float v12 = v11;
        [v8 startValue];
        if (v12 >= v13)
        {
          uint64_t v14 = [v8 filledColor];

          double v10 = (void *)v14;
        }
        id v15 = v10;
        self;
        self;
        double v19 = 0.0;
        [v15 getRed:0 green:0 blue:0 alpha:&v19];
        double v16 = [v15 colorWithAlphaComponent:v19];

        double v17 = [v9 backgroundColor];

        if (v17 != v16) {
          [v9 setMarkColor:v16];
        }
      }
    }
  }
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double barWidth = self->_barWidth;
  if (barWidth == -1.0)
  {
    [(AVMobileChromelessFluidSlider *)self bounds];
    double barWidth = v5;
  }
  [(AVMobileChromelessFluidSlider *)self bounds];
  double v7 = v6;
  [(AVMobileChromelessFluidSlider *)self bounds];
  double v9 = v8;
  double barHeight = self->_barHeight;
  if ([(AVMobileChromelessFluidSlider *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    float v11 = self;
    float v12 = [(AVMobileChromelessFluidSlider *)v11 superview];
    [v12 bounds];
    double v14 = v13;

    id v15 = [(AVMobileChromelessFluidSlider *)v11 superview];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;
      [v16 contentInset];
      double v18 = v17;
      double v20 = v19;
      [v16 bounds];
      double v22 = v21 - (v18 + v20);
      [v16 contentSize];
      double v24 = v23;

      double v14 = v22 + fmax(v24 - v22, 0.0);
    }
    double v7 = v14 - v7 - barWidth;
  }
  double v25 = v7;
  double v26 = v9;
  double v27 = barWidth;
  double v28 = barHeight;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (void)setVariableSpeedScrubbingOffsetMultiplier:(double)a3
{
  if (self->_variableSpeedScrubbingOffsetMultiplier != a3) {
    self->_double variableSpeedScrubbingOffsetMultiplier = a3;
  }
}

- (void)setMaximumValueView:(id)a3
{
  [(_UISliderFluidTickConfiguration *)self->_fluidSliderConfiguration setMaximumValueView:a3];
  fluidSliderConfiguration = self->_fluidSliderConfiguration;

  [(AVMobileChromelessFluidSlider *)self _setSliderConfiguration:fluidSliderConfiguration];
}

- (CGRect)frameForSliderMark:(id)a3
{
  -[AVMobileChromelessFluidSlider _frameForSliderMark:](self, a3);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)setUsesVolumeStyle:(BOOL)a3
{
  if (self->_usesVolumeStyle != a3)
  {
    self->_usesVolumeStyle = a3;
    -[AVMobileChromelessFluidSlider _updateSliderStyle]((uint64_t)self);
  }
}

- (uint64_t)_updateSliderStyle
{
  if (result)
  {
    v1 = (unsigned char *)result;
    CGRect result = objc_opt_respondsToSelector();
    if (result)
    {
      if (v1[581]) {
        uint64_t v2 = 111;
      }
      else {
        uint64_t v2 = 110;
      }
      return [v1 _setSliderStyle:v2];
    }
  }
  return result;
}

- (void)setUnfilledBarVisualEffect:(id)a3
{
  double v5 = (UIVisualEffect *)a3;
  self->_hasSetUnFilledBarVisualEffect = 1;
  p_unfilledBarVisualEffect = &self->_unfilledBarVisualEffect;
  if (self->_unfilledBarVisualEffect != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_unfilledBarVisualEffect, a3);
    -[AVMobileChromelessFluidSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.super.isa);
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_unfilledBarVisualEffect, v5);
}

- (void)setTotalValue:(float)a3
{
  uint64_t v18 = v9;
  uint64_t v19 = v8;
  uint64_t v20 = v7;
  uint64_t v21 = v3;
  if (vabds_f32(self->_totalValue, a3) >= 0.00000011921)
  {
    self->_totalValue = a3;
    [(AVMobileChromelessFluidSlider *)self maximumValue];
    float v14 = v13;
    [(AVMobileChromelessFluidSlider *)self maximumValue];
    float v16 = v15;
    if (objc_opt_respondsToSelector())
    {
      *(float *)&double v17 = v16 - (float)(a3 - v14);
      [(AVMobileChromelessFluidSlider *)self _setMaximumEnabledValue:v17];
    }
    [(AVMobileChromelessFluidSlider *)self setNeedsLayout];
    self->_totalValueSet = 1;
  }
}

- (void)setTintState:(unint64_t)a3
{
  if (self->_tintState != a3)
  {
    self->_tintState = a3;
    -[AVMobileChromelessFluidSlider _updateBarTintStateAlpha](self);
  }
}

- (void)setStretchLimit:(double)a3
{
  if (self->_stretchLimit != a3)
  {
    self->_stretchLimit = a3;
    -[_UISliderFluidTickConfiguration setStretchLimit:](self->_fluidSliderConfiguration, "setStretchLimit:");
    fluidSliderConfiguration = self->_fluidSliderConfiguration;
    [(AVMobileChromelessFluidSlider *)self _setSliderConfiguration:fluidSliderConfiguration];
  }
}

- (void)setSliderMarks:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  p_sliderMarks = &self->_sliderMarks;
  if (self->_sliderMarks != v5)
  {
    double v23 = v5;
    objc_storeStrong((id *)&self->_sliderMarks, a3);
    uint64_t v7 = [(NSMutableArray *)self->_sliderMarkViews count];
    if (v7 != [(NSArray *)*p_sliderMarks count])
    {
      uint64_t v8 = *MEMORY[0x1E4F39EA8];
      do
      {
        unint64_t v9 = [(NSMutableArray *)self->_sliderMarkViews count];
        unint64_t v10 = [(NSArray *)*p_sliderMarks count];
        sliderMarkViews = self->_sliderMarkViews;
        if (v9 <= v10)
        {
          unint64_t v13 = [(NSMutableArray *)sliderMarkViews count];
          if (v13 >= [(NSArray *)*p_sliderMarks count]) {
            break;
          }
          float v12 = objc_alloc_init(AVMobileFluidSliderMarkView);
          float v14 = [(NSArray *)*p_sliderMarks objectAtIndex:[(NSMutableArray *)self->_sliderMarkViews count]];
          uint64_t v15 = [v14 markType];

          double v16 = self->_barHeight + -1.0;
          if (v16 >= 1.0) {
            double v17 = v16 * 0.5;
          }
          else {
            double v17 = 0.5;
          }
          if (v15 == 1) {
            double v18 = 1.75;
          }
          else {
            double v18 = v17;
          }
          -[AVMobileFluidSliderMarkView setAutoresizingMask:](v12, "setAutoresizingMask:", 0, v17);
          [(AVMobileFluidSliderMarkView *)v12 setUserInteractionEnabled:0];
          uint64_t v19 = [(AVMobileFluidSliderMarkView *)v12 layer];
          [v19 setMasksToBounds:1];

          uint64_t v20 = [(AVMobileFluidSliderMarkView *)v12 layer];
          [v20 setCornerRadius:v18];

          uint64_t v21 = [(AVMobileFluidSliderMarkView *)v12 layer];
          [v21 setCornerCurve:v8];

          [(AVMobileChromelessFluidSlider *)self addSubview:v12];
          [(NSMutableArray *)self->_sliderMarkViews addObject:v12];
        }
        else
        {
          float v12 = [(NSMutableArray *)sliderMarkViews lastObject];
          [(AVMobileFluidSliderMarkView *)v12 removeFromSuperview];
          [(NSMutableArray *)self->_sliderMarkViews removeLastObject];
        }

        uint64_t v22 = [(NSMutableArray *)self->_sliderMarkViews count];
      }
      while (v22 != [(NSArray *)*p_sliderMarks count]);
    }
    -[AVMobileChromelessFluidSlider _updateSliderMarkViewColors]((id *)&self->super.super.super.super.super.isa);
    [(AVMobileChromelessFluidSlider *)self setNeedsLayout];
    uint64_t v5 = v23;
  }
}

- (void)setSnappingValues:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  p_snappingValues = &self->_snappingValues;
  if (self->_snappingValues != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_snappingValues, a3);
    -[AVMobileChromelessFluidSlider _setUpSliderConfigurationIfNeeded]((uint64_t)self);
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_snappingValues, v5);
}

- (void)_setUpSliderConfigurationIfNeeded
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v3 = objc_msgSend((id)a1, "snappingValues", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v7) floatValue];
          float v9 = -[AVMobileChromelessFluidSlider _normalizeSliderMarkValue:](a1, v8);
          id v10 = objc_alloc(MEMORY[0x1E4FB22C8]);
          *(float *)&double v11 = v9;
          float v12 = (void *)[v10 initWithPosition:0 title:0 image:v11];
          [v2 addObject:v12];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB22C0]) initWithTicks:v2 behavior:2];
    float v14 = *(void **)(a1 + 568);
    *(void *)(a1 + 568) = v13;

    [*(id *)(a1 + 568) setTickStyle:0x7FFFFFFFFFFFFFFFLL];
    LODWORD(v15) = 1008981770;
    [*(id *)(a1 + 568) setSnappingDistance:v15];
    [*(id *)(a1 + 568) setDelegate:a1];
    [*(id *)(a1 + 568) setExpansionFactor:1.0];
    [*(id *)(a1 + 568) setStretchLimit:17.0];
    [*(id *)(a1 + 568) setMaximumTrackEffect:*(void *)(a1 + 656)];
    [*(id *)(a1 + 568) setMinimumTrackEffect:*(void *)(a1 + 608)];
    [(id)a1 _setSliderConfiguration:*(void *)(a1 + 568)];
  }
}

- (void)setPrefersSliderTrackHidden:(BOOL)a3
{
  if (self->_prefersSliderTrackHidden != a3)
  {
    self->_prefersSliderTrackHidden = a3;
    -[AVMobileChromelessFluidSlider _setFluidTrackHidden:](self, "_setFluidTrackHidden:");
    [(AVMobileChromelessFluidSlider *)self setNeedsLayout];
  }
}

- (void)setFineScrubbingStyle:(unint64_t)a3
{
  if (self->_fineScrubbingStyle != a3)
  {
    self->_fineScrubbingStyle = a3;
    if ([(AVMobileChromelessFluidSlider *)self fineScrubbingStyle])
    {
      if (!self->_speedChangeFeedbackGenerator)
      {
        uint64_t v4 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1C18]);
        speedChangeFeedbackGenerator = self->_speedChangeFeedbackGenerator;
        self->_speedChangeFeedbackGenerator = v4;
        MEMORY[0x1F41817F8](v4, speedChangeFeedbackGenerator);
      }
    }
  }
}

- (void)setFilledBarVisualEffect:(id)a3
{
  uint64_t v5 = (UIVisualEffect *)a3;
  self->_hasSetFilledBarVisualEffect = 1;
  p_filledBarVisualEffect = &self->_filledBarVisualEffect;
  if (self->_filledBarVisualEffect != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_filledBarVisualEffect, a3);
    -[AVMobileChromelessFluidSlider _updateSliderBarMaterials]((id *)&self->super.super.super.super.super.isa);
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_filledBarVisualEffect, v5);
}

- (void)setBarWidth:(double)a3
{
  if (self->_barWidth != a3)
  {
    self->_double barWidth = a3;
    [(AVMobileChromelessFluidSlider *)self setNeedsLayout];
    sliderPointerInteraction = self->_sliderPointerInteraction;
    [(UIPointerInteraction *)sliderPointerInteraction invalidate];
  }
}

- (void)setBarHeight:(double)a3
{
  if (self->_barHeight != a3)
  {
    self->_double barHeight = a3;
    [(AVMobileChromelessFluidSlider *)self invalidateIntrinsicContentSize];
    uint64_t v4 = [(AVMobileChromelessFluidSlider *)self superview];
    objc_msgSend(v4, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

    [(AVMobileChromelessFluidSlider *)self setNeedsLayout];
    sliderPointerInteraction = self->_sliderPointerInteraction;
    [(UIPointerInteraction *)sliderPointerInteraction invalidate];
  }
}

- (void)setSliderIsOverVideo:(BOOL)a3
{
  if (self->_sliderIsOverVideo != a3)
  {
    self->_sliderIsOverVideo = a3;
    if (a3) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 0;
    }
    [(AVMobileChromelessFluidSlider *)self setOverrideUserInterfaceStyle:v3];
  }
}

- (AVMobileChromelessFluidSlider)init
{
  v17.receiver = self;
  v17.super_class = (Class)AVMobileChromelessFluidSlider;
  uint64_t v2 = -[AVMobileChromelessFluidSlider initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v3 = (uint64_t)v2;
  if (v2)
  {
    -[AVMobileChromelessFluidSlider _updateBarVisualEffectsIfNeeded]((uint64_t)v2);
    uint64_t v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:11];
    uint64_t v5 = *(void **)(v3 + 536);
    *(void *)(v3 + 536) = v4;

    uint64_t v6 = [MEMORY[0x1E4FB14C8] effectWithStyle:16];
    uint64_t v7 = *(void **)(v3 + 544);
    *(void *)(v3 + 544) = v6;

    id v8 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    float v9 = *(void **)(v3 + 512);
    *(void *)(v3 + 512) = v8;

    [*(id *)(v3 + 512) setAutoresizingMask:0];
    [*(id *)(v3 + 512) setUserInteractionEnabled:0];
    [*(id *)(v3 + 512) setClipsToBounds:1];
    [(id)v3 insertSubview:*(void *)(v3 + 512) atIndex:0];
    -[AVMobileChromelessFluidSlider _setUpSliderConfigurationIfNeeded](v3);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
    double v11 = *(void **)(v3 + 552);
    *(void *)(v3 + 552) = v10;

    [(id)v3 addInteraction:*(void *)(v3 + 552)];
    *(void *)(v3 + 616) = 0;
    long long v12 = *(_OWORD *)(MEMORY[0x1E4FB12A8] + 16);
    *(_OWORD *)(v3 + 712) = *MEMORY[0x1E4FB12A8];
    *(_OWORD *)(v3 + 728) = v12;
    *(void *)(v3 + 592) = 0x402E000000000000;
    *(void *)(v3 + 600) = 0xBFF0000000000000;
    *(_DWORD *)(v3 + 584) = 1065353216;
    *(void *)(v3 + 640) = 0x4031000000000000;
    uint64_t v13 = *(void **)(v3 + 632);
    *(void *)(v3 + 632) = MEMORY[0x1E4F1CBF0];

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v15 = *(void **)(v3 + 528);
    *(void *)(v3 + 528) = v14;

    *(void *)(v3 + 648) = 1;
    *(unsigned char *)(v3 + 576) = 0;
    *(void *)(v3 + 664) = 0x3FF0000000000000;
    -[AVMobileChromelessFluidSlider _updateSliderStyle](v3);
  }
  return (AVMobileChromelessFluidSlider *)v3;
}

+ (double)variableSpeedScrubbingMultiplierForDistanceToEdge:(double)a3
{
  return fmin(a3 / 196.0, 1.0);
}

@end