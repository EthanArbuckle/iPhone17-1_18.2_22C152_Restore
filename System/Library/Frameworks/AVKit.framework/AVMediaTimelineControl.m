@interface AVMediaTimelineControl
- (AVMediaTimelineControl)initWithSource:(id)a3;
- (AVMediaTimelineControlConfiguration)configuration;
- (AVMediaTimelineControlDelegate)delegate;
- (AVMediaTimelineControlSource)source;
- (AVMobileChromelessTimelineView)timelineView;
- (BOOL)isEnabled;
- (BOOL)usesCurrentValueLabelWhileScrubbing;
- (CGRect)_frameForTimeRangeMark:(id)a3;
- (CGSize)intrinsicContentSize;
- (NSArray)maskedTimeRangeMarks;
- (NSArray)nonMaskedTimeRangeMarks;
- (NSArray)timeRangeMarkLayers;
- (NSArray)timeRangeMarks;
- (double)_maskingLayerFrame;
- (double)_updateContainerLayersFrames;
- (float)totalValue;
- (id)_timelineViewSlider;
- (id)_uiProxyForTimeRangeMark:(id)a3;
- (unint64_t)fineScrubbingStyle;
- (void)_handleDisplayLink;
- (void)_invalidateDisplayLink;
- (void)_setupObservationsIfNeeded;
- (void)_timelineSliderDidChangeValue:(id)a3;
- (void)_updateConfiguration;
- (void)_updateDisplayLinkPausedStateIfNeeded;
- (void)_updateDisplayLinkRefreshRateIfNeeded;
- (void)_updateFineScrubbingStyleIfNeeded;
- (void)_updateLabelsIfNeeded;
- (void)_updateMaskedTimeRangeLayerPathIfNeeded;
- (void)_updateSliderPulsingStateIfNeeded;
- (void)_updateSliderTintStateToState:(void *)a3 duration:(double)a4 completionHandler:;
- (void)_updateTimeRangeMarksIfNeeded;
- (void)_updateTimeRangeMarksLayerFramesIfNeeded;
- (void)_updateTimelineSliderEmphasisStateIfNeeded;
- (void)_updateTimelineSliderEnabledStateIfNeeded;
- (void)_updateTimelineViewValuesWithForceUpdate:(uint64_t)a1;
- (void)_updateVariableScrubbingOffSetScalarIfNeeded;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFineScrubbingStyle:(unint64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setMaskedTimeRangeMarks:(id)a3;
- (void)setNonMaskedTimeRangeMarks:(id)a3;
- (void)setSource:(id)a3;
- (void)setTimeRangeMarkLayers:(id)a3;
- (void)setTimeRangeMarks:(id)a3;
- (void)setTimelineView:(id)a3;
- (void)setTotalValue:(float)a3;
- (void)setUsesCurrentValueLabelWhileScrubbing:(BOOL)a3;
- (void)slider:(id)a3 didChangeScrubbingRate:(unint64_t)a4;
- (void)slider:(id)a3 didExtendWithInsets:(UIEdgeInsets)a4;
- (void)sliderDidBeginTracking:(id)a3;
- (void)sliderDidEndTracking:(id)a3;
- (void)sliderWillEndTracking:(id)a3;
@end

@implementation AVMediaTimelineControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRangeMarkLayers, 0);
  objc_storeStrong((id *)&self->_maskedTimeRangeMarks, 0);
  objc_storeStrong((id *)&self->_nonMaskedTimeRangeMarks, 0);
  objc_storeStrong((id *)&self->_timeRangeMarks, 0);
  objc_storeStrong((id *)&self->_timelineView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_timeRangeMarksMaskingContainerLayer, 0);
  objc_storeStrong((id *)&self->_timeRangeMarksContainerLayer, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_trackingTimeFormatter, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_sliderPulsingAnimator, 0);
  objc_storeStrong((id *)&self->_timelineSliderEmphasisAnimator, 0);
  objc_storeStrong((id *)&self->_inSyncWithSourceValuesTimer, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)setTimeRangeMarkLayers:(id)a3
{
}

- (NSArray)timeRangeMarkLayers
{
  return self->_timeRangeMarkLayers;
}

- (void)setMaskedTimeRangeMarks:(id)a3
{
}

- (NSArray)maskedTimeRangeMarks
{
  return self->_maskedTimeRangeMarks;
}

- (void)setNonMaskedTimeRangeMarks:(id)a3
{
}

- (NSArray)nonMaskedTimeRangeMarks
{
  return self->_nonMaskedTimeRangeMarks;
}

- (void)setTimeRangeMarks:(id)a3
{
}

- (NSArray)timeRangeMarks
{
  return self->_timeRangeMarks;
}

- (void)setTimelineView:(id)a3
{
}

- (AVMobileChromelessTimelineView)timelineView
{
  return self->_timelineView;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setDelegate:(id)a3
{
}

- (AVMediaTimelineControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMediaTimelineControlDelegate *)WeakRetained;
}

- (AVMediaTimelineControlSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (AVMediaTimelineControlSource *)WeakRetained;
}

- (unint64_t)fineScrubbingStyle
{
  return self->_fineScrubbingStyle;
}

- (void)slider:(id)a3 didChangeScrubbingRate:(unint64_t)a4
{
  id v7 = [(AVMediaTimelineControl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (a4 - 1 >= 3) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = a4;
    }
    [v7 mediaTimelineControl:self didChangeScrubbingRate:v6];
  }
}

- (void)slider:(id)a3 didExtendWithInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  self->_sliderEdgeInsets = a4;
  -[AVMediaTimelineControl _updateContainerLayersFrames]((double *)self);
  [(AVMediaTimelineControl *)self _updateTimeRangeMarksLayerFramesIfNeeded];
  [(AVMediaTimelineControl *)self _updateMaskedTimeRangeLayerPathIfNeeded];
  id v9 = [(AVMediaTimelineControl *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v9, "mediaTimelineControl:didExtendWithInsets:", self, top, left, bottom, right);
  }
}

- (double)_updateContainerLayersFrames
{
  if (result)
  {
    v1 = result;
    if (*((void *)result + 61))
    {
      v2 = -[AVMediaTimelineControl _timelineViewSlider](result);
      [v2 frame];
      double v4 = v3;
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v11 = v1[63];
      double v12 = v1[64];
      double v13 = v1[65];
      double v14 = v1[66];

      double v15 = v10 - (v11 + v13);
      double v16 = v8 - (v12 + v14);
      double v17 = v6 + v11;
      double v18 = v4 + v12;
      [MEMORY[0x1E4F39CF8] begin];
      if (([*((id *)v1 + 53) isRunning] & 1) != 0 || *((unsigned char *)v1 + 549)) {
        [MEMORY[0x1E4F39CF8] setAnimationDuration:0.2];
      }
      else {
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
      }
      objc_msgSend(*((id *)v1 + 61), "setFrame:", v18, v17, v16, v15);
      [v1 _updateTimeRangeMarksLayerFramesIfNeeded];
      v19 = (void *)MEMORY[0x1E4F39CF8];
      return (double *)[v19 commit];
    }
  }
  return result;
}

- (id)_timelineViewSlider
{
  if (a1)
  {
    v1 = [a1 timelineView];
    v2 = [v1 fluidSlider];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)sliderDidEndTracking:(id)a3
{
  self->_isDecelerating = 0;
  id v4 = [(AVMediaTimelineControl *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 mediaTimelineControlDidEndDecelerating:self];
  }
}

- (void)sliderWillEndTracking:(id)a3
{
  self->_isDecelerating = 1;
  id v11 = [(AVMediaTimelineControl *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v11 mediaTimelineControlDidEndChanging:self];
  }
  -[AVMediaTimelineControl _updateTimelineSliderEmphasisStateIfNeeded]((uint64_t)self);
  [(AVMediaTimelineControl *)self _updateDisplayLinkPausedStateIfNeeded];
  inSyncWithSourceValuesTimer = self->_inSyncWithSourceValuesTimer;
  if (inSyncWithSourceValuesTimer) {
    [(NSTimer *)inSyncWithSourceValuesTimer invalidate];
  }
  double v5 = [(AVMediaTimelineControl *)self source];
  if ([v5 isPlaying])
  {
    double v6 = [(AVMediaTimelineControl *)self source];
    char v7 = [v6 isLoading];

    if ((v7 & 1) == 0)
    {
      self->_shouldUpdateTimelineValuesAccordingToSource = 0;
      goto LABEL_10;
    }
  }
  else
  {
  }
  objc_initWeak(&location, self);
  double v8 = (void *)MEMORY[0x1E4F1CB00];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__AVMediaTimelineControl__updateShouldUpdateTimelineValuesAccordingToSource__block_invoke;
  v12[3] = &unk_1E5FC4480;
  objc_copyWeak(&v13, &location);
  double v9 = [v8 scheduledTimerWithTimeInterval:0 repeats:v12 block:2.0];
  double v10 = self->_inSyncWithSourceValuesTimer;
  self->_inSyncWithSourceValuesTimer = v9;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_10:
}

- (void)_updateTimelineSliderEmphasisStateIfNeeded
{
  if (a1)
  {
    v2 = [(id)a1 timelineView];
    double v3 = -[AVMediaTimelineControl _timelineViewSlider]((void *)a1);
    uint64_t v4 = [v3 isTracking];
    if (v4 != [v2 isEmphasized])
    {
      double v5 = [(id)a1 configuration];
      double v6 = [v5 labelsConfiguration];
      uint64_t v7 = [v6 labelsStyle];

      objc_initWeak(&location, (id)a1);
      if (v7 != 2
        || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 504), *MEMORY[0x1E4FB2848]), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 520), *(float64x2_t *)(MEMORY[0x1E4FB2848] + 16)))), 0xFuLL))) & 1) != 0)
      {
        [v2 prepareForDeemphasisIfNeeded];
        [v2 setEmphasized:v4];
        double v10 = *(void **)(a1 + 424);
        double v11 = 1.0;
        if (v10
          && [v10 isRunning]
          && [*(id *)(a1 + 424) isInterruptible])
        {
          [*(id *)(a1 + 424) fractionComplete];
          double v11 = v12;
          [*(id *)(a1 + 424) stopAnimation:1];
          [*(id *)(a1 + 424) finishAnimationAtPosition:2];
          id v13 = *(void **)(a1 + 424);
          *(void *)(a1 + 424) = 0;
        }
        id v14 = objc_alloc(MEMORY[0x1E4FB1ED8]);
        if (v11 <= 1.0) {
          double v15 = v11 * 0.2;
        }
        else {
          double v15 = 0.2;
        }
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_3;
        v24[3] = &unk_1E5FC46C0;
        double v9 = &v25;
        objc_copyWeak(&v25, &location);
        char v26 = v4;
        uint64_t v16 = [v14 initWithDuration:3 curve:v24 animations:v15];
        double v17 = *(void **)(a1 + 424);
        *(void *)(a1 + 424) = v16;

        double v18 = *(void **)(a1 + 424);
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        v21 = __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_4;
        v22 = &unk_1E5FC3998;
        objc_copyWeak(&v23, &location);
        [v18 addCompletion:&v19];
        objc_msgSend(*(id *)(a1 + 424), "startAnimation", v19, v20, v21, v22);
        objc_destroyWeak(&v23);
      }
      else
      {
        double v8 = (void *)MEMORY[0x1E4FB1EB0];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke;
        v29[3] = &unk_1E5FC35E8;
        double v9 = &v31;
        objc_copyWeak(&v31, &location);
        id v30 = v2;
        char v32 = v4;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_2;
        v27[3] = &unk_1E5FC3328;
        objc_copyWeak(&v28, &location);
        [v8 _animateByRetargetingAnimations:v29 completion:v27];
        objc_destroyWeak(&v28);
      }
      objc_destroyWeak(v9);
      objc_destroyWeak(&location);
    }
  }
}

void __76__AVMediaTimelineControl__updateShouldUpdateTimelineValuesAccordingToSource__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[448] = 0;
  }
}

void __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[549] = 1;
    double v3 = WeakRetained;
    [*(id *)(a1 + 32) setEmphasized:*(unsigned __int8 *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

void __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    WeakRetained[549] = 0;
    double v5 = WeakRetained;
    -[AVMediaTimelineControl _updateConfiguration](WeakRetained);
    uint64_t v4 = (void *)v5[53];
    v5[53] = 0;

    id WeakRetained = v5;
  }
}

void __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AVMediaTimelineControl _updateConfiguration](WeakRetained);

  id v4 = objc_loadWeakRetained(v2);
  double v5 = [v4 timelineView];
  [v5 setEmphasized:*(unsigned __int8 *)(a1 + 40)];

  id v7 = objc_loadWeakRetained(v2);
  double v6 = [v7 timelineView];
  [v6 layoutIfNeeded];
}

void __68__AVMediaTimelineControl__updateTimelineSliderEmphasisStateIfNeeded__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    -[AVMediaTimelineControl _updateConfiguration](WeakRetained);
    v2 = (void *)v3[53];
    v3[53] = 0;

    id WeakRetained = v3;
  }
}

- (void)_updateConfiguration
{
  if (result)
  {
    v1 = result;
    v2 = [result configuration];
    double v3 = [v2 labelsConfiguration];
    id v4 = [v1 timelineView];
    if ([v3 labelsStyle] == 2)
    {
      [v4 setLeadingTimeText:0];
      [v4 setTrailingTimeText:0];
    }
    else
    {
      objc_msgSend(v4, "setLabelPosition:", objc_msgSend(v3, "labelsStyle") != 0);
      double v5 = [v3 textFont];
      [v4 setLabelsFont:v5];

      double v6 = [v3 textColor];
      [v4 setLabelsTextColor:v6];

      id v7 = [v3 textCompositingFilter];
      [v4 setLabelsCompositingFilter:v7];

      double v8 = [v3 textFont];
      if (!v8)
      {
        double v8 = +[AVMediaTimelineControlLabelsConfiguration _defaultFont];
      }
      [v4 setLabelsFont:v8];
      double v9 = [v3 textColor];
      if (!v9)
      {
        double v9 = +[AVMediaTimelineControlLabelsConfiguration _defaultTextColor];
      }
      [v4 setLabelsTextColor:v9];
      [v3 extendedDynamicRangeGain];
      objc_msgSend(v4, "setLabelsExtendedDynamicRangeGain:");
    }
    double v10 = [v1 configuration];
    double v11 = -[AVMediaTimelineControl _timelineViewSlider](v1);
    double v12 = [v10 currentValueVisualEffect];
    id v13 = [v10 maxValueVisualEffect];
    [v11 setFilledBarVisualEffect:v12];
    [v11 setUnfilledBarVisualEffect:v13];

    id v14 = [v1 configuration];
    double v15 = [v1 timelineView];
    [v14 extendedDynamicRangeGain];
    objc_msgSend(v15, "setSliderExtendedDynamicRangeGain:");

    return (void *)[v1 _updateDisplayLinkRefreshRateIfNeeded];
  }
  return result;
}

- (void)sliderDidBeginTracking:(id)a3
{
  self->_isDecelerating = 0;
  -[AVMediaTimelineControl _updateVariableScrubbingOffSetScalarIfNeeded](self);
  id v5 = [(AVMediaTimelineControl *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 mediaTimelineControlWillBeginChanging:self];
  }
  inSyncWithSourceValuesTimer = self->_inSyncWithSourceValuesTimer;
  if (inSyncWithSourceValuesTimer) {
    [(NSTimer *)inSyncWithSourceValuesTimer invalidate];
  }
  self->_shouldUpdateTimelineValuesAccordingToSource = 1;
  -[AVMediaTimelineControl _updateTimelineSliderEmphasisStateIfNeeded]((uint64_t)self);
  [(AVMediaTimelineControl *)self _updateDisplayLinkPausedStateIfNeeded];
}

- (void)_updateVariableScrubbingOffSetScalarIfNeeded
{
  if (a1)
  {
    v2 = [a1 window];
    if (v2)
    {
      id v14 = v2;
      double v3 = -[AVMediaTimelineControl _timelineViewSlider](a1);
      [v3 frame];
      double v5 = v4 * 0.5;
      [v3 frame];
      objc_msgSend(a1, "convertPoint:toView:", v14, v5, v6 * 0.5);
      double v8 = v7;
      if ([a1 fineScrubbingStyle] == 2)
      {
        [v14 bounds];
        double v8 = v9 - v8;
      }
      +[AVMobileChromelessFluidSlider variableSpeedScrubbingMultiplierForDistanceToEdge:v8];
      float v11 = v10;
      float v12 = fabsf(v11 + -0.9);
      if (v11 > 0.9 || v12 < 0.00000011921) {
        [v3 setVariableSpeedScrubbingOffsetMultiplier:v10 * 0.6];
      }

      v2 = v14;
    }
  }
}

- (id)_uiProxyForTimeRangeMark:(id)a3
{
  id v4 = a3;
  double v5 = [v4 markUIProvider];
  double v6 = [(AVMediaTimelineControl *)self source];
  double v7 = [v5 uiProxyForTimeRangeMark:v4 withSource:v6];

  return v7;
}

- (CGRect)_frameForTimeRangeMark:(id)a3
{
  id v4 = a3;
  double v5 = [v4 markUIProvider];
  double v6 = [(AVMediaTimelineControl *)self source];
  double v7 = [v5 uiProxyForTimeRangeMark:v4 withSource:v6];

  if ([v7 isMasked]) {
    double v8 = -[AVMediaTimelineControl _maskingLayerFrame]((uint64_t)self);
  }
  else {
    [(CAShapeLayer *)self->_timeRangeMarksContainerLayer frame];
  }
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  uint64_t v16 = -[AVMediaTimelineControl _timelineViewSlider](self);
  [v16 frame];
  double v18 = v17;

  if (self->_totalValueSet)
  {
    [(AVMediaTimelineControl *)self totalValue];
    float v20 = v19;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_source);
    [WeakRetained maxValue];
    float v20 = v22;
  }
  double v23 = v20;
  [v4 startValue];
  float v25 = v24;
  id v26 = objc_loadWeakRetained((id *)&self->_source);
  [v26 minValue];
  double v28 = (float)(v25 - v27);
  id v29 = objc_loadWeakRetained((id *)&self->_source);
  [v29 minValue];
  double v31 = v28 / (v23 - v30);

  char v32 = [v4 markUIProvider];
  objc_msgSend(v32, "timeRangeMark:sizeInFrame:", v4, v12, v13, v14, v15);
  double v34 = v33;
  double v36 = v35;

  double v37 = v14 * v31;
  double left = self->_sliderEdgeInsets.left;
  if (left < 0.0) {
    double v37 = v37 + left - fabs(self->_sliderEdgeInsets.right) + (v14 - v18) * -0.5;
  }
  [v4 startValue];
  float v40 = v39;
  [v4 endValue];
  BOOL v42 = vabds_f32(v40, v41) < 0.00000011921;
  double v43 = 0.0;
  if (v42) {
    double v43 = v34 * 0.5;
  }
  double v44 = v37 - v43;

  double v45 = v44;
  double v46 = (v15 - v36) * 0.5;
  double v47 = v34;
  double v48 = v36;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

- (double)_maskingLayerFrame
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 424) isRunning];
  v2 = -[AVMediaTimelineControl _timelineViewSlider]((void *)a1);
  [v2 frame];

  return *(double *)(a1 + 512);
}

- (void)_timelineSliderDidChangeValue:(id)a3
{
  id v4 = -[AVMediaTimelineControl _timelineViewSlider](self);
  [v4 value];
  float v6 = v5;

  if (self)
  {
    if (self->_lastFeedbackValue != -3.4028e38)
    {
      double v7 = [(AVMediaTimelineControl *)self source];
      [v7 minValue];
      float v9 = v8;
      [v7 maxValue];
      float v11 = v10;
      double v12 = -[AVMediaTimelineControl _timelineViewSlider](self);
      [v12 value];
      float v14 = v13;

      float lastFeedbackValue = self->_lastFeedbackValue;
      float v16 = (float)(v11 - v9) * 0.01;
      float v17 = vabds_f32(v14, v16 + lastFeedbackValue);
      BOOL v18 = v14 <= (float)(v16 + lastFeedbackValue) || v17 < 0.00000011921;
      if (!v18
        || ((float v19 = lastFeedbackValue - v16, v20 = vabds_f32(v14, v19), v14 < v19)
          ? (BOOL v21 = v20 < 0.00000011921)
          : (BOOL v21 = 1),
            !v21))
      {
        self->_float lastFeedbackValue = -3.4028e38;
      }
    }
    float v22 = -[AVMediaTimelineControl _timelineViewSlider](self);
    double v23 = [(AVMediaTimelineControl *)self timelineView];
    float v24 = [v23 fluidSlider];

    NSUInteger v25 = [(NSArray *)self->_timeRangeMarks count];
    if (v22)
    {
      if (v25 && v24 == 0)
      {
        [v22 value];
        float v28 = v27;
        if ([(NSArray *)self->_timeRangeMarks count])
        {
          uint64_t v29 = 0;
          while (1)
          {
            float v30 = [(NSArray *)self->_timeRangeMarks objectAtIndex:v29];
            [v30 startValue];
            if (vabds_f32(v31, v28) < 0.00000011921 && vabds_f32(v31, self->_lastFeedbackValue) >= 0.00000011921) {
              break;
            }

            if ([(NSArray *)self->_timeRangeMarks count] <= ++v29) {
              goto LABEL_27;
            }
          }
          self->_float lastFeedbackValue = v31;
          [(UISelectionFeedbackGenerator *)self->_selectionFeedbackGenerator prepare];

          [(UISelectionFeedbackGenerator *)self->_selectionFeedbackGenerator selectionChanged];
        }
      }
    }
LABEL_27:
  }
  self->_lastUpdatedTime = v6;
  id v33 = [(AVMediaTimelineControl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v32 = v6;
    [v33 mediaTimelineControl:self didChangeValue:v32];
  }
  -[AVMediaTimelineControl _updateLabelsIfNeeded]((uint64_t)self);
}

- (void)_updateLabelsIfNeeded
{
  if (a1)
  {
    v2 = [(id)a1 timelineView];
    if (v2)
    {
      id v18 = v2;
      double v3 = [(id)a1 configuration];
      id v4 = [v3 labelsConfiguration];
      if ([v4 labelsStyle] != 2)
      {
        float v5 = [(id)a1 source];
        float v6 = [v5 currentValueText];
        double v7 = -[AVMediaTimelineControl _timelineViewSlider]((void *)a1);
        int v8 = [v7 isTracking];

        float v9 = [(id)a1 source];
        int v10 = [v9 isLoading];

        if (!*(unsigned char *)(a1 + 551) && v8 | v10)
        {
          float v11 = *(void **)(a1 + 456);
          if (!v11)
          {
            id v12 = objc_alloc_init(MEMORY[0x1E4F166B8]);
            float v13 = *(void **)(a1 + 456);
            *(void *)(a1 + 456) = v12;

            float v11 = *(void **)(a1 + 456);
          }
          float v14 = -[AVMediaTimelineControl _timelineViewSlider]((void *)a1);
          [v14 value];
          uint64_t v16 = [v11 stringFromSeconds:v15];

          float v6 = (void *)v16;
        }
        [v18 setLeadingTimeText:v6];
        float v17 = [v5 maxValueText];
        [v18 setTrailingTimeText:v17];
      }
      v2 = v18;
    }
  }
}

- (void)_handleDisplayLink
{
  if (!self->_shouldSkipNextDisplayLinkUpdate) {
    -[AVMediaTimelineControl _updateTimelineViewValuesWithForceUpdate:]((uint64_t)self, 0);
  }
  self->_shouldSkipNextDisplayLinkUpdate = 0;
}

- (void)_updateTimelineViewValuesWithForceUpdate:(uint64_t)a1
{
  if (a1
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 504), *MEMORY[0x1E4FB2848]), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 520), *(float64x2_t *)(MEMORY[0x1E4FB2848] + 16)))), 0xFuLL))) & 1) != 0)
  {
    char v3 = a2;
    if (a2) {
      *(unsigned char *)(a1 + 548) = 1;
    }
    -[AVMediaTimelineControl _timelineViewSlider]((void *)a1);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    char v4 = [v29 isTracking];
    int v5 = *(unsigned __int8 *)(a1 + 448);
    float v6 = [(id)a1 source];
    char v7 = [v6 isLoading];
    char v8 = [v6 isPlaying];
    [v6 minValue];
    float v10 = v9;
    [v29 minimumValue];
    float v12 = vabds_f32(v10, v11);
    [v6 maxValue];
    float v14 = v13;
    [v29 maximumValue];
    float v16 = vabds_f32(v14, v15);
    [v6 currentValue];
    float v18 = v17;
    float v19 = *(float *)(a1 + 464);
    float v20 = *(float *)(a1 + 544);
    float v21 = vabds_f32(v18, v19 + v20);
    if (v18 > (float)(v19 + v20) || v21 < 0.00000011921)
    {
      char v23 = 0;
    }
    else
    {
      char v23 = 0;
      float v24 = v19 - v20;
      float v25 = vabds_f32(v18, v24);
      BOOL v26 = v18 < v24 || v25 < 0.00000011921;
      if (!v26 && (v3 & 1) == 0 && v12 < 0.00000011921 && v16 < 0.00000011921) {
        char v23 = v7 | v8 ^ 1;
      }
    }
    if (v29) {
      char v27 = v4;
    }
    else {
      char v27 = 1;
    }
    if ((v27 & 1) == 0 && !v5 && (v23 & 1) == 0)
    {
      [v6 minValue];
      if (v12 >= 0.00000011921)
      {
        [v6 minValue];
        objc_msgSend(v29, "setMinimumValue:");
      }
      [v6 maxValue];
      HIDWORD(v28) = 872415232;
      if (v16 >= 0.00000011921)
      {
        [v6 maxValue];
        objc_msgSend(v29, "setMaximumValue:");
      }
      *(float *)&double v28 = v18;
      [v29 setValue:v28];
      *(float *)(a1 + 464) = v18;
    }
    -[AVMediaTimelineControl _updateLabelsIfNeeded](a1);
  }
}

- (BOOL)usesCurrentValueLabelWhileScrubbing
{
  return self->_usesCurrentValueLabelWhileScrubbing;
}

- (void)setUsesCurrentValueLabelWhileScrubbing:(BOOL)a3
{
  if (self->_usesCurrentValueLabelWhileScrubbing != a3)
  {
    self->_usesCurrentValueLabelWhileScrubbing = a3;
    -[AVMediaTimelineControl _updateLabelsIfNeeded]((uint64_t)self);
  }
}

- (float)totalValue
{
  v2 = [(AVMediaTimelineControl *)self timelineView];
  char v3 = [v2 slider];
  [v3 totalValue];
  float v5 = v4;

  return v5;
}

- (void)setTotalValue:(float)a3
{
  [(AVMediaTimelineControl *)self totalValue];
  if (v5 != a3)
  {
    float v6 = [(AVMediaTimelineControl *)self timelineView];
    char v7 = [v6 slider];
    *(float *)&double v8 = a3;
    [v7 setTotalValue:v8];

    self->_totalValueSet = 1;
  }
}

- (void)setSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  if (WeakRetained != obj)
  {
    if (self)
    {
      self->_isObservationControllerActivelyObserving = 0;
      [(AVObservationController *)self->_observationController stopAllObservation];
      objc_storeWeak((id *)&self->_source, obj);
      -[AVMediaTimelineControl _setupObservationsIfNeeded]((uint64_t)self);
    }
    else
    {
      objc_storeWeak((id *)0x240, obj);
    }
    [(AVMediaTimelineControl *)self _updateDisplayLinkRefreshRateIfNeeded];
  }
}

- (void)_setupObservationsIfNeeded
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!*(void *)(a1 + 440))
    {
      v2 = [[AVObservationController alloc] initWithOwner:a1];
      char v3 = *(void **)(a1 + 440);
      *(void *)(a1 + 440) = v2;
    }
    if (!*(unsigned char *)(a1 + 536))
    {
      *(unsigned char *)(a1 + 536) = 1;
      float v4 = *(void **)(a1 + 440);
      v9[0] = @"source.loading";
      v9[1] = @"source.playing";
      float v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
      id v6 = (id)[v4 startObserving:a1 keyPaths:v5 observationHandler:&__block_literal_global_15262];

      id v7 = (id)[*(id *)(a1 + 440) startObserving:a1 keyPath:@"source.timeRangeMarks" observationHandler:&__block_literal_global_102];
      id v8 = (id)[*(id *)(a1 + 440) startObserving:a1 keyPath:@"source.currentValue" observationHandler:&__block_literal_global_108];
    }
  }
}

void __52__AVMediaTimelineControl__setupObservationsIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
}

uint64_t __52__AVMediaTimelineControl__setupObservationsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _updateTimeRangeMarksIfNeeded];
}

void __52__AVMediaTimelineControl__setupObservationsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _updateDisplayLinkPausedStateIfNeeded];
  [v2 _updateSliderPulsingStateIfNeeded];
}

- (void)setFineScrubbingStyle:(unint64_t)a3
{
  if (self->_fineScrubbingStyle != a3)
  {
    self->_fineScrubbingStyle = a3;
    -[AVMediaTimelineControl _updateFineScrubbingStyleIfNeeded](self);
  }
}

- (void)_updateFineScrubbingStyleIfNeeded
{
  if (a1)
  {
    -[AVMediaTimelineControl _timelineViewSlider](a1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFineScrubbingStyle:", objc_msgSend(a1, "fineScrubbingStyle") & 3);
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVMediaTimelineControl _updateTimelineSliderEnabledStateIfNeeded]((unsigned __int8 *)self);
  }
}

- (void)_updateTimelineSliderEnabledStateIfNeeded
{
  if (a1)
  {
    id v2 = [a1 timelineView];
    [v2 setEnabled:a1[553]];
  }
}

- (AVMediaTimelineControlConfiguration)configuration
{
  id v2 = (void *)[(AVMediaTimelineControlConfiguration *)self->_configuration copy];

  return (AVMediaTimelineControlConfiguration *)v2;
}

- (void)setConfiguration:(id)a3
{
  if (self->_configuration != a3)
  {
    float v4 = (AVMediaTimelineControlConfiguration *)[a3 copy];
    configuration = self->_configuration;
    self->_configuration = v4;

    -[AVMediaTimelineControl _updateConfiguration](self);
  }
}

- (void)_updateTimeRangeMarksLayerFramesIfNeeded
{
  if (self->_timeRangeMarksContainerLayer)
  {
    [MEMORY[0x1E4F39CF8] begin];
    if (([(UIViewPropertyAnimator *)self->_timelineSliderEmphasisAnimator isRunning] & 1) != 0
      || self->_isRetargetableAnimationInProgress)
    {
      [MEMORY[0x1E4F39CF8] setAnimationDuration:0.2];
    }
    else
    {
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
    }
    if ([(NSArray *)self->_nonMaskedTimeRangeMarks count])
    {
      unint64_t v3 = 0;
      CGFloat v4 = *MEMORY[0x1E4F1DB28];
      CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        id v8 = [(NSArray *)self->_nonMaskedTimeRangeMarks objectAtIndex:v3];
        float v9 = [(AVMediaTimelineControl *)self _uiProxyForTimeRangeMark:v8];
        id v10 = [v9 backgroundColor];
        uint64_t v11 = [v10 CGColor];

        [v9 cornerRadius];
        float v13 = v12;
        float v14 = [(NSArray *)self->_timeRangeMarkLayers objectAtIndex:v3];
        [v14 setBackgroundColor:v11];
        [v14 setCornerRadius:v13];
        [v14 setMasksToBounds:1];
        [(AVMediaTimelineControl *)self _frameForTimeRangeMark:v8];
        v18.origin.x = v4;
        v18.origin.y = v5;
        v18.size.width = v6;
        v18.size.height = v7;
        if (!CGRectEqualToRect(v17, v18))
        {
          [(AVMediaTimelineControl *)self _frameForTimeRangeMark:v8];
          objc_msgSend(v14, "setFrame:");
        }

        ++v3;
      }
      while ([(NSArray *)self->_nonMaskedTimeRangeMarks count] > v3);
    }
    float v15 = (void *)MEMORY[0x1E4F39CF8];
    [v15 commit];
  }
}

- (void)_updateTimeRangeMarksIfNeeded
{
  timeRangeMarks = self->_timeRangeMarks;
  p_source = &self->_source;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);
  CGFloat v6 = [WeakRetained timeRangeMarks];

  if (timeRangeMarks == v6) {
    return;
  }
  id v7 = objc_loadWeakRetained((id *)p_source);
  id v8 = [v7 timeRangeMarks];
  float v9 = self->_timeRangeMarks;
  self->_timeRangeMarks = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = (NSArray *)MEMORY[0x1E4F1CBF0];
  float v12 = (NSArray *)[v10 initWithArray:MEMORY[0x1E4F1CBF0]];
  maskedTimeRangeMarks = self->_maskedTimeRangeMarks;
  self->_maskedTimeRangeMarks = v12;

  float v14 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v11];
  p_nonMaskedTimeRangeMarks = &self->_nonMaskedTimeRangeMarks;
  nonMaskedTimeRangeMarks = self->_nonMaskedTimeRangeMarks;
  self->_nonMaskedTimeRangeMarks = v14;

  id v50 = [MEMORY[0x1E4F1CA48] array];
  CGRect v17 = self->_timeRangeMarks;
  if (v17) {
    goto LABEL_5;
  }
  if ([0 count])
  {
    CGRect v17 = self->_timeRangeMarks;
LABEL_5:
    if ([(NSArray *)v17 count])
    {
      unint64_t v18 = 0;
      do
      {
        float v19 = [(NSArray *)self->_timeRangeMarks objectAtIndex:v18];
        float v20 = [(AVMediaTimelineControl *)self _uiProxyForTimeRangeMark:v19];
        float v21 = NSNumber;
        [v19 startValue];
        float v22 = objc_msgSend(v21, "numberWithFloat:");
        [v50 addObject:v22];

        if ([v20 isMasked]) {
          p_maskedTimeRangeMarks = &self->_maskedTimeRangeMarks;
        }
        else {
          p_maskedTimeRangeMarks = &self->_nonMaskedTimeRangeMarks;
        }
        uint64_t v24 = [(NSArray *)*p_maskedTimeRangeMarks arrayByAddingObject:v19];
        float v25 = *p_maskedTimeRangeMarks;
        *p_maskedTimeRangeMarks = (NSArray *)v24;

        ++v18;
      }
      while ([(NSArray *)self->_timeRangeMarks count] > v18);
    }
  }
  v49 = -[AVMediaTimelineControl _timelineViewSlider](self);
  [v49 setSnappingValues:v50];
  uint64_t v26 = [(NSArray *)*p_nonMaskedTimeRangeMarks count];
  if (!self->_timeRangeMarksContainerLayer && v26)
  {
    char v27 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    timeRangeMarksContainerLayer = self->_timeRangeMarksContainerLayer;
    self->_timeRangeMarksContainerLayer = v27;

    id v29 = [(AVMediaTimelineControl *)self layer];
    [v29 addSublayer:self->_timeRangeMarksContainerLayer];
  }
  NSUInteger v30 = [(NSArray *)self->_maskedTimeRangeMarks count];
  if (!self->_timeRangeMarksMaskingContainerLayer && v30)
  {
    float v31 = -[AVMediaTimelineControl _timelineViewSlider](self);
    if (v31)
    {
      double v32 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      timeRangeMarksMaskingContainerLayer = self->_timeRangeMarksMaskingContainerLayer;
      self->_timeRangeMarksMaskingContainerLayer = v32;

      [(CAShapeLayer *)self->_timeRangeMarksMaskingContainerLayer setFillRule:*MEMORY[0x1E4F39FB8]];
      double v34 = self->_timeRangeMarksMaskingContainerLayer;
      id v35 = [MEMORY[0x1E4FB1618] whiteColor];
      -[CAShapeLayer setFillColor:](v34, "setFillColor:", [v35 CGColor]);

      double v36 = [(AVMediaTimelineControl *)self layer];
      [v36 addSublayer:self->_timeRangeMarksMaskingContainerLayer];

      double v37 = [v31 layer];
      [v37 setMask:self->_timeRangeMarksMaskingContainerLayer];
    }
  }
  if (self->_timeRangeMarksContainerLayer)
  {
    if ([(NSArray *)self->_timeRangeMarkLayers count])
    {
      unint64_t v38 = 0;
      do
      {
        float v39 = [(NSArray *)self->_timeRangeMarkLayers objectAtIndex:v38];
        [v39 removeFromSuperlayer];

        ++v38;
      }
      while ([(NSArray *)self->_timeRangeMarkLayers count] > v38);
    }
    timeRangeMarkLayers = self->_timeRangeMarkLayers;
    self->_timeRangeMarkLayers = v11;

    if ([(NSArray *)*p_nonMaskedTimeRangeMarks count])
    {
      unint64_t v41 = 0;
      do
      {
        BOOL v42 = [(NSArray *)*p_nonMaskedTimeRangeMarks objectAtIndex:v41];
        double v43 = [(AVMediaTimelineControl *)self _uiProxyForTimeRangeMark:v42];
        id v44 = objc_alloc_init(MEMORY[0x1E4F39C88]);
        id v45 = [v43 backgroundColor];
        objc_msgSend(v44, "setBackgroundColor:", objc_msgSend(v45, "CGColor"));

        [v43 cornerRadius];
        [v44 setCornerRadius:v46];
        [v44 setMasksToBounds:1];
        [(CAShapeLayer *)self->_timeRangeMarksContainerLayer addSublayer:v44];
        double v47 = [(NSArray *)self->_timeRangeMarkLayers arrayByAddingObject:v44];
        double v48 = self->_timeRangeMarkLayers;
        self->_timeRangeMarkLayers = v47;

        ++v41;
      }
      while ([(NSArray *)*p_nonMaskedTimeRangeMarks count] > v41);
    }
  }
  [(AVMediaTimelineControl *)self _updateTimeRangeMarksLayerFramesIfNeeded];
  [(AVMediaTimelineControl *)self _updateMaskedTimeRangeLayerPathIfNeeded];
}

- (void)_updateSliderPulsingStateIfNeeded
{
  unint64_t v3 = -[AVMediaTimelineControl _timelineViewSlider](self);
  if (v3)
  {
    CGFloat v4 = [(AVMediaTimelineControl *)self source];
    int v5 = [v4 isLoading];

    if (v5)
    {
      uint64_t v6 = 2 * ((unint64_t)([v3 tintState] - 1) > 1);
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __59__AVMediaTimelineControl__updateSliderPulsingStateIfNeeded__block_invoke;
      v7[3] = &unk_1E5FC44F8;
      objc_copyWeak(&v8, &location);
      -[AVMediaTimelineControl _updateSliderTintStateToState:duration:completionHandler:]((id *)&self->super.super.super.isa, v6, v7, 1.0);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      -[AVMediaTimelineControl _updateSliderTintStateToState:duration:completionHandler:]((id *)&self->super.super.super.isa, 1, 0, 0.25);
    }
  }
}

void __59__AVMediaTimelineControl__updateSliderPulsingStateIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSliderPulsingStateIfNeeded];
}

- (void)_updateSliderTintStateToState:(void *)a3 duration:(double)a4 completionHandler:
{
  id v7 = a3;
  if (a1)
  {
    id v8 = -[AVMediaTimelineControl _timelineViewSlider](a1);
    if (v8)
    {
      id v9 = a1[54];
      if (v9 && [v9 isRunning] && objc_msgSend(a1[54], "isInterruptible"))
      {
        [a1[54] stopAnimation:1];
        [a1[54] finishAnimationAtPosition:2];
        id v10 = a1[54];
        a1[54] = 0;
      }
      id v11 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke;
      v19[3] = &unk_1E5FC41F8;
      id v20 = v8;
      uint64_t v21 = a2;
      uint64_t v12 = [v11 initWithDuration:3 curve:v19 animations:a4];
      id v13 = a1[54];
      a1[54] = (id)v12;

      if (v7)
      {
        objc_initWeak(&location, a1);
        id v14 = a1[54];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke_2;
        v15[3] = &unk_1E5FC3300;
        objc_copyWeak(&v17, &location);
        id v16 = v7;
        [v14 addCompletion:v15];

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      [a1[54] startAnimation];
    }
  }
}

uint64_t __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTintState:*(void *)(a1 + 40)];
}

void __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke_3;
  v2[3] = &unk_1E5FC4138;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __83__AVMediaTimelineControl__updateSliderTintStateToState_duration_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v2 = (void *)WeakRetained[54];
    WeakRetained[54] = 0;
  }
}

- (void)_updateMaskedTimeRangeLayerPathIfNeeded
{
  NSUInteger v3 = [(NSArray *)self->_maskedTimeRangeMarks count];
  if (self->_timeRangeMarksMaskingContainerLayer)
  {
    NSUInteger v4 = v3;
    Mutable = CGPathCreateMutable();
    id v19 = [MEMORY[0x1E4FB14C0] bezierPathWithRect:-[AVMediaTimelineControl _maskingLayerFrame]((uint64_t)self)];
    CGPathAddPath(Mutable, 0, (CGPathRef)[v19 CGPath]);
    if (v4 && [(NSArray *)self->_maskedTimeRangeMarks count])
    {
      unint64_t v6 = 0;
      do
      {
        id v7 = [(NSArray *)self->_maskedTimeRangeMarks objectAtIndex:v6];
        id v8 = [(AVMediaTimelineControl *)self _uiProxyForTimeRangeMark:v7];
        [(AVMediaTimelineControl *)self _frameForTimeRangeMark:v7];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        [v8 cornerRadius];
        objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v17);
        id v18 = objc_claimAutoreleasedReturnValue();
        CGPathAddPath(Mutable, 0, (CGPathRef)[v18 CGPath]);

        ++v6;
      }
      while ([(NSArray *)self->_maskedTimeRangeMarks count] > v6);
    }
    [(CAShapeLayer *)self->_timeRangeMarksMaskingContainerLayer setPath:Mutable];
  }
}

- (void)_updateDisplayLinkRefreshRateIfNeeded
{
  if (self->_displayLink)
  {
    NSUInteger v3 = [(AVMediaTimelineControl *)self window];
    NSUInteger v4 = [v3 windowScene];
    int v5 = [v4 screen];
    [v5 scale];
    double v7 = v6;

    id v8 = [(AVMediaTimelineControl *)self source];
    [v8 maxValue];
    float v10 = v9;

    double v11 = -[AVMediaTimelineControl _timelineViewSlider](self);
    [v11 frame];
    double v13 = v7 * v12;

    float v14 = v13;
    float v15 = fabsf(v14);
    if (v14 <= 0.0 || v15 < 0.00000011921)
    {
      float timelineValuesUpdateInterval = self->_timelineValuesUpdateInterval;
    }
    else
    {
      float timelineValuesUpdateInterval = v10 / v13 * 0.5;
      self->_float timelineValuesUpdateInterval = timelineValuesUpdateInterval;
    }
    if (fabsf(timelineValuesUpdateInterval) >= 0.00000011921)
    {
      float v18 = 1.0 / (float)(timelineValuesUpdateInterval + timelineValuesUpdateInterval);
      if (vabds_f32(v18, self->_lastPreferredFramesPerSecond) >= 0.00000011921)
      {
        self->_lastPreferredFramesPerSecond = v18;
        CAFrameRateRange v24 = CAFrameRateRangeMake(48.0, 120.0, 0.0);
        float v19 = fabsf(v18 + -24.0);
        if (fabsf(v18) >= 0.00000011921 && v18 < 24.0 && v19 >= 0.00000011921) {
          CAFrameRateRange v24 = CAFrameRateRangeMake(v18, v18, v18);
        }
        displayLink = self->_displayLink;
        -[CADisplayLink setPreferredFrameRateRange:](displayLink, "setPreferredFrameRateRange:", *(double *)&v24.minimum, *(double *)&v24.maximum, *(double *)&v24.preferred);
      }
    }
  }
}

- (void)_updateDisplayLinkPausedStateIfNeeded
{
  if (self->_displayLink)
  {
    if ([(AVMediaTimelineControl *)self isHidden])
    {
      BOOL v3 = 1;
    }
    else
    {
      [(AVMediaTimelineControl *)self alpha];
      BOOL v3 = v4 == 0.0;
    }
    int v5 = [(AVMediaTimelineControl *)self source];
    char v6 = [v5 isLoading];

    double v7 = [(AVMediaTimelineControl *)self source];
    int v8 = [v7 isPlaying];

    -[AVMediaTimelineControl _timelineViewSlider](self);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = 1;
    if (!v3 && (v6 & 1) == 0) {
      uint64_t v9 = objc_msgSend(v10, "isTracking", 1) | v8 ^ 1;
    }
    [(CADisplayLink *)self->_displayLink setPaused:v9];
  }
}

- (void)setAlpha:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVMediaTimelineControl;
  [(AVMediaTimelineControl *)&v4 setAlpha:a3];
  [(AVMediaTimelineControl *)self _updateDisplayLinkPausedStateIfNeeded];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVMediaTimelineControl;
  [(AVMediaTimelineControl *)&v4 setHidden:a3];
  [(AVMediaTimelineControl *)self _updateDisplayLinkPausedStateIfNeeded];
}

- (CGSize)intrinsicContentSize
{
  [(AVMobileChromelessTimelineView *)self->_timelineView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AVMediaTimelineControl;
  [(AVMediaTimelineControl *)&v4 layoutSubviews];
  double v3 = [(AVMediaTimelineControl *)self timelineView];
  [(AVMediaTimelineControl *)self bounds];
  objc_msgSend(v3, "setFrame:");

  -[AVMediaTimelineControl _updateContainerLayersFrames]((double *)self);
  [(AVMediaTimelineControl *)self _updateTimeRangeMarksLayerFramesIfNeeded];
  [(AVMediaTimelineControl *)self _updateMaskedTimeRangeLayerPathIfNeeded];
  -[AVMediaTimelineControl _updateVariableScrubbingOffSetScalarIfNeeded](self);
}

- (void)didMoveToWindow
{
  v16.receiver = self;
  v16.super_class = (Class)AVMediaTimelineControl;
  [(AVMediaTimelineControl *)&v16 didMoveToWindow];
  double v3 = [(AVMediaTimelineControl *)self window];

  if (v3)
  {
    -[AVMediaTimelineControl _setupObservationsIfNeeded]((uint64_t)self);
    if (self)
    {
      if (!self->_displayLink)
      {
        objc_super v4 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__handleDisplayLink];
        displayLink = self->_displayLink;
        self->_displayLink = v4;

        char v6 = self->_displayLink;
        double v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];

        [(AVMediaTimelineControl *)self _updateDisplayLinkPausedStateIfNeeded];
      }
      -[AVMediaTimelineControl _updateContainerLayersFrames]((double *)self);
      if (!self->_timelineView)
      {
        int v8 = [[AVMobileChromelessTimelineView alloc] initWithUsingFluidSlider:1];
        [(AVMobileChromelessTimelineView *)v8 setAutoresizingMask:0];
        [(AVMobileChromelessTimelineView *)v8 setDelegate:self];
        uint64_t v9 = [(AVMobileChromelessTimelineView *)v8 slider];
        LODWORD(v10) = 1120403456;
        [v9 setTotalValue:v10];

        [(AVMediaTimelineControl *)self setTimelineView:v8];
        -[AVMediaTimelineControl _updateTimelineSliderEnabledStateIfNeeded]((unsigned __int8 *)self);
        [(AVMediaTimelineControl *)self addSubview:self->_timelineView];
        -[AVMediaTimelineControl _updateTimelineViewValuesWithForceUpdate:]((uint64_t)self, 1);
      }
      double v11 = [(AVMediaTimelineControl *)self timelineView];
      double v12 = [v11 slider];
      double v13 = v12;
      if (v12)
      {
        [v12 addTarget:self action:sel__timelineSliderDidChangeValue_ forControlEvents:4096];
        [v13 addTarget:self action:sel__timelineSliderDidChangeValue_ forControlEvents:448];
        [v13 setDelegate:self];
        float v14 = [v11 fluidSlider];
        objc_msgSend(v14, "setDirectionalHitRectInsets:", -8.0, 0.0, -8.0, 0.0);
      }
    }
    else
    {
      -[AVMediaTimelineControl _updateContainerLayersFrames](0);
    }
    -[AVMediaTimelineControl _updateConfiguration](self);
    [(AVMediaTimelineControl *)self _updateTimeRangeMarksIfNeeded];
    -[AVMediaTimelineControl _updateFineScrubbingStyleIfNeeded](self);
    -[AVMediaTimelineControl _updateVariableScrubbingOffSetScalarIfNeeded](self);
    -[AVMediaTimelineControl _updateTimelineViewValuesWithForceUpdate:]((uint64_t)self, 1);
  }
  else
  {
    if (self)
    {
      self->_isObservationControllerActivelyObserving = 0;
      [(AVObservationController *)self->_observationController stopAllObservation];
      inSyncWithSourceValuesTimer = self->_inSyncWithSourceValuesTimer;
      if (inSyncWithSourceValuesTimer) {
        [(NSTimer *)inSyncWithSourceValuesTimer invalidate];
      }
    }
    -[AVMediaTimelineControl _invalidateDisplayLink]((uint64_t)self);
  }
}

- (void)_invalidateDisplayLink
{
  if (a1)
  {
    [*(id *)(a1 + 408) invalidate];
    double v2 = *(void **)(a1 + 408);
    *(void *)(a1 + 408) = 0;
  }
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_source, 0);
  self->_isObservationControllerActivelyObserving = 0;
  [(AVObservationController *)self->_observationController stopAllObservation];
  selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
  self->_selectionFeedbackGenerator = 0;

  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  inSyncWithSourceValuesTimer = self->_inSyncWithSourceValuesTimer;
  if (inSyncWithSourceValuesTimer) {
    [(NSTimer *)inSyncWithSourceValuesTimer invalidate];
  }
  v6.receiver = self;
  v6.super_class = (Class)AVMediaTimelineControl;
  [(AVMediaTimelineControl *)&v6 dealloc];
}

- (AVMediaTimelineControl)initWithSource:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AVMediaTimelineControl;
  int v5 = -[AVMediaTimelineControl initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    uint64_t v6 = +[AVMediaTimelineControlConfiguration defaultConfiguration];
    double v7 = (void *)*((void *)v5 + 70);
    *((void *)v5 + 70) = v6;

    objc_storeWeak((id *)v5 + 72, v4);
    v5[553] = 1;
    v5[448] = 0;
    [v4 currentValue];
    *((_DWORD *)v5 + 116) = v8;
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1C18]);
    double v10 = (void *)*((void *)v5 + 59);
    *((void *)v5 + 59) = v9;

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v12 = (void *)*((void *)v5 + 75);
    *((void *)v5 + 75) = v11;

    long long v13 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)(v5 + 504) = *MEMORY[0x1E4FB2848];
    *(_OWORD *)(v5 + 520) = v13;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    float v15 = (void *)*((void *)v5 + 76);
    *((void *)v5 + 76) = v14;

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    float v17 = (void *)*((void *)v5 + 77);
    *((void *)v5 + 77) = v16;

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    float v19 = (void *)*((void *)v5 + 78);
    *((void *)v5 + 78) = v18;

    v5[536] = 0;
    v5[548] = 0;
    v5[549] = 0;
    v5[550] = 0;
    v5[551] = 0;
    v5[552] = 0;
  }

  return (AVMediaTimelineControl *)v5;
}

@end