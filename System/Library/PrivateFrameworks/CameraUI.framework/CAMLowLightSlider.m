@interface CAMLowLightSlider
- ($F24F406B2B787EFB06265DBA3D28CBD5)durationMapping;
- (BOOL)_isPerformingCaptureAnimation;
- (BOOL)isLowLightActive;
- (CAMLowLightSlider)initWithFrame:(CGRect)a3;
- (NSTimer)_valueLabelUpdateTimer;
- (double)_inactiveTickMarkHeight;
- (double)_remainingCaptureAnimationTime;
- (id)_valueTextForDuration:(double)a3;
- (id)_valueTextForDuration:(double)a3 format:(id)a4;
- (id)valueText;
- (unint64_t)_selectedIndexBeforeCaptureAnimation;
- (unint64_t)lowLightMode;
- (void)_handleValueLabelUpdateTimerWithStartTime:(double)a3 duration:(double)a4;
- (void)_setPerformingCaptureAnimation:(BOOL)a3;
- (void)_setRemainingCaptureAnimationTime:(double)a3;
- (void)_setSelectedIndexBeforeCaptureAnimation:(unint64_t)a3;
- (void)_setValueLabelUpdateTimer:(id)a3;
- (void)_startValueLabelUpdateTimerWithDuration:(double)a3;
- (void)_stopValueLabelUpdateTimer;
- (void)dealloc;
- (void)endCaptureAnimationAnimated:(BOOL)a3;
- (void)performCaptureAnimationWithDuration:(double)a3 completion:(id)a4;
- (void)setDurationMapping:(id)a3;
- (void)setLowLightActive:(BOOL)a3;
- (void)setLowLightMode:(unint64_t)a3;
@end

@implementation CAMLowLightSlider

- (CAMLowLightSlider)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAMLowLightSlider;
  v3 = -[CEKDiscreteSlider initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CEKDiscreteSlider *)v3 setIndexCount:3];
    v5 = CAMLocalizedFrameworkString(@"LOW_LIGHT_SLIDER_TITLE", 0);
    [(CEKDiscreteSlider *)v4 setTitleText:v5];

    [(CEKDiscreteSlider *)v4 tickMarksHeight];
    v4->__inactiveTickMarkHeight = v6;
    v7 = [(CEKDiscreteSlider *)v4 tickMarksConfiguration];
    [v7 setMainTickMarkInterval:6];

    [(CEKDiscreteSlider *)v4 setTickMarkCountBetweenIndexes:5];
  }
  return v4;
}

- (void)dealloc
{
  [(NSTimer *)self->__valueLabelUpdateTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CAMLowLightSlider;
  [(CAMLowLightSlider *)&v3 dealloc];
}

- (void)setDurationMapping:(id)a3
{
  if (a3.var0 != self->_durationMapping.minimumDuration || a3.var1 != self->_durationMapping.maximumDuration)
  {
    self->_durationMapping = ($9A58E5929C033B40A174D578711F86A7)a3;
    if ([(CAMLowLightSlider *)self lowLightMode])
    {
      [(CEKDiscreteSlider *)self updateValueLabel];
    }
  }
}

- (void)setLowLightActive:(BOOL)a3
{
  if (self->_lowLightActive != a3)
  {
    self->_lowLightActive = a3;
    [(CEKDiscreteSlider *)self updateValueLabel];
  }
}

- (void)setLowLightMode:(unint64_t)a3
{
  if ([(CAMLowLightSlider *)self lowLightMode] != a3 && a3 <= 2)
  {
    [(CEKDiscreteSlider *)self setSelectedIndex:a3];
  }
}

- (unint64_t)lowLightMode
{
  if ([(CAMLowLightSlider *)self _isPerformingCaptureAnimation]) {
    unint64_t result = [(CAMLowLightSlider *)self _selectedIndexBeforeCaptureAnimation];
  }
  else {
    unint64_t result = [(CEKDiscreteSlider *)self selectedIndex];
  }
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (id)valueText
{
  unint64_t v3 = [(CAMLowLightSlider *)self lowLightMode];
  if (![(CAMLowLightSlider *)self _isPerformingCaptureAnimation])
  {
    [(CAMLowLightSlider *)self durationMapping];
    if (v3 == 2)
    {
      double v8 = v6;
      objc_super v9 = CAMLocalizedFrameworkString(@"LOW_LIGHT_MAX_DURATION_TEXT", 0);
      v10 = self;
      double v11 = v8;
    }
    else
    {
      if (v3 != 1)
      {
        if (v3)
        {
          v13 = 0;
          goto LABEL_15;
        }
        v7 = @"LOW_LIGHT_OFF_TEXT";
        goto LABEL_13;
      }
      double v12 = v5;
      if (![(CAMLowLightSlider *)self isLowLightActive])
      {
        v7 = @"LOW_LIGHT_AUTO_TEXT";
LABEL_13:
        uint64_t v4 = CAMLocalizedFrameworkString(v7, 0);
        goto LABEL_14;
      }
      objc_super v9 = CAMLocalizedFrameworkString(@"LOW_LIGHT_AUTO_DURATION_TEXT", 0);
      v10 = self;
      double v11 = v12;
    }
    v13 = [(CAMLowLightSlider *)v10 _valueTextForDuration:v9 format:v11];

    goto LABEL_15;
  }
  [(CAMLowLightSlider *)self _remainingCaptureAnimationTime];
  uint64_t v4 = -[CAMLowLightSlider _valueTextForDuration:](self, "_valueTextForDuration:");
LABEL_14:
  v13 = (void *)v4;
LABEL_15:
  return v13;
}

- (id)_valueTextForDuration:(double)a3
{
  double v5 = CAMLocalizedFrameworkString(@"LOW_LIGHT_DURATION_TEXT", 0);
  double v6 = [(CAMLowLightSlider *)self _valueTextForDuration:v5 format:a3];

  return v6;
}

- (id)_valueTextForDuration:(double)a3 format:(id)a4
{
  double v5 = round(a3);
  unint64_t v6 = llround(a3);
  id v7 = a4;
  BOOL v8 = [(CAMLowLightSlider *)self _isPerformingCaptureAnimation];
  double v9 = fmax((double)(uint64_t)v5, 1.0);
  if (v8) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = (uint64_t)v9;
  }
  id v11 = [NSString alloc];
  double v12 = [MEMORY[0x263EFF960] currentLocale];
  v13 = objc_msgSend(v11, "initWithFormat:locale:", @"%li", v12, v10);

  v14 = [NSString stringWithValidatedFormat:v7, @"%@", 0, v13 validFormatSpecifiers error];

  return v14;
}

- (void)performCaptureAnimationWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  if ([(CAMLowLightSlider *)self _isPerformingCaptureAnimation]) {
    [(CAMLowLightSlider *)self endCaptureAnimationAnimated:0];
  }
  [(CAMLowLightSlider *)self _setSelectedIndexBeforeCaptureAnimation:[(CEKDiscreteSlider *)self selectedIndex]];
  [(CAMLowLightSlider *)self _setRemainingCaptureAnimationTime:a3];
  [(CAMLowLightSlider *)self _setPerformingCaptureAnimation:1];
  id v7 = [MEMORY[0x263F825C8] systemYellowColor];
  BOOL v8 = [(CEKDiscreteSlider *)self tickMarksConfiguration];
  [v8 setMainTickMarkColor:v7];

  double v9 = [MEMORY[0x263F825C8] systemYellowColor];
  uint64_t v10 = [(CEKDiscreteSlider *)self tickMarksConfiguration];
  [v10 setSecondaryTickMarkColor:v9];

  [(CEKDiscreteSlider *)self setColorHighlight:2 animated:1];
  [(CEKDiscreteSlider *)self setTickMarksHeight:1 animated:15.0];
  [(CAMLowLightSlider *)self _startValueLabelUpdateTimerWithDuration:a3];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__CAMLowLightSlider_performCaptureAnimationWithDuration_completion___block_invoke;
  v12[3] = &unk_263FA40A0;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  [(CEKDiscreteSlider *)self setSelectedIndex:0 animatedDuration:0 animatedCurve:v12 completion:a3];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __68__CAMLowLightSlider_performCaptureAnimationWithDuration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _stopValueLabelUpdateTimer];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)endCaptureAnimationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CAMLowLightSlider *)self _isPerformingCaptureAnimation])
  {
    [(CAMLowLightSlider *)self _stopValueLabelUpdateTimer];
    [(CAMLowLightSlider *)self _setPerformingCaptureAnimation:0];
    [(CAMLowLightSlider *)self _inactiveTickMarkHeight];
    -[CEKDiscreteSlider setTickMarksHeight:animated:](self, "setTickMarksHeight:animated:", v3);
    [(CEKDiscreteSlider *)self setColorHighlight:1 animated:1];
    double v5 = [(CEKDiscreteSlider *)self tickMarksConfiguration];
    [v5 setMainTickMarkColor:0];

    id v6 = [(CEKDiscreteSlider *)self tickMarksConfiguration];
    [v6 setSecondaryTickMarkColor:0];

    uint64_t v8 = 0;
    double v9 = 0.5;
    if (v3) {
      double v10 = 0.5;
    }
    else {
      double v10 = 0.0;
    }
    if (v3)
    {
      LODWORD(v9) = 1058642330;
      LODWORD(v7) = 1.0;
      uint64_t v8 = [MEMORY[0x263F15808] functionWithControlPoints:COERCE_DOUBLE(1045220557) :v9 :0.0 :v7];
    }
    id v11 = (id)v8;
    [(CEKDiscreteSlider *)self setSelectedIndex:[(CAMLowLightSlider *)self _selectedIndexBeforeCaptureAnimation] animatedDuration:v8 animatedCurve:0 completion:v10];
  }
}

- (void)_startValueLabelUpdateTimerWithDuration:(double)a3
{
  [(CAMLowLightSlider *)self _stopValueLabelUpdateTimer];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  id v6 = v5;
  objc_initWeak(&location, self);
  double v7 = (void *)MEMORY[0x263EFFA20];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  double v12 = __61__CAMLowLightSlider__startValueLabelUpdateTimerWithDuration___block_invoke;
  id v13 = &unk_263FA6B00;
  objc_copyWeak(v14, &location);
  v14[1] = v6;
  v14[2] = *(id *)&a3;
  uint64_t v8 = [v7 timerWithTimeInterval:1 repeats:&v10 block:0.2];
  objc_msgSend(v8, "setTolerance:", 0.1, v10, v11, v12, v13);
  double v9 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v9 addTimer:v8 forMode:*MEMORY[0x263EFF588]];

  [(CAMLowLightSlider *)self _setValueLabelUpdateTimer:v8];
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __61__CAMLowLightSlider__startValueLabelUpdateTimerWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleValueLabelUpdateTimerWithStartTime:*(double *)(a1 + 40) duration:*(double *)(a1 + 48)];
}

- (void)_stopValueLabelUpdateTimer
{
  BOOL v3 = [(CAMLowLightSlider *)self _valueLabelUpdateTimer];
  [v3 invalidate];

  [(CAMLowLightSlider *)self _setValueLabelUpdateTimer:0];
}

- (void)_handleValueLabelUpdateTimerWithStartTime:(double)a3 duration:(double)a4
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  [(CAMLowLightSlider *)self _setRemainingCaptureAnimationTime:a4 - (v7 - a3)];
  [(CEKDiscreteSlider *)self updateValueLabel];
}

- (BOOL)isLowLightActive
{
  return self->_lowLightActive;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)durationMapping
{
  double minimumDuration = self->_durationMapping.minimumDuration;
  double maximumDuration = self->_durationMapping.maximumDuration;
  result.var1 = maximumDuration;
  result.var0 = minimumDuration;
  return result;
}

- (BOOL)_isPerformingCaptureAnimation
{
  return self->__performingCaptureAnimation;
}

- (void)_setPerformingCaptureAnimation:(BOOL)a3
{
  self->__performingCaptureAnimation = a3;
}

- (unint64_t)_selectedIndexBeforeCaptureAnimation
{
  return self->__selectedIndexBeforeCaptureAnimation;
}

- (void)_setSelectedIndexBeforeCaptureAnimation:(unint64_t)a3
{
  self->__selectedIndexBeforeCaptureAnimation = a3;
}

- (double)_remainingCaptureAnimationTime
{
  return self->__remainingCaptureAnimationTime;
}

- (void)_setRemainingCaptureAnimationTime:(double)a3
{
  self->__remainingCaptureAnimationTime = a3;
}

- (NSTimer)_valueLabelUpdateTimer
{
  return self->__valueLabelUpdateTimer;
}

- (void)_setValueLabelUpdateTimer:(id)a3
{
}

- (double)_inactiveTickMarkHeight
{
  return self->__inactiveTickMarkHeight;
}

- (void).cxx_destruct
{
}

@end