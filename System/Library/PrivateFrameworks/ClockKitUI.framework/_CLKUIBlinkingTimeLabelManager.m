@interface _CLKUIBlinkingTimeLabelManager
- (BOOL)animationsPaused;
- (BOOL)showSeconds;
- (CGSize)intrinsicSize;
- (CGSize)sizeThatFits;
- (UIColor)textColor;
- (UIEdgeInsets)opticalInsets;
- (_CLKUIBlinkingTimeLabelManager)initWithForDevice:(id)a3 timeFormatter:(id)a4 options:(unint64_t)a5 timer:(id)a6 labelFactory:(id)a7;
- (double)_capOffsetFromBoundsTop;
- (double)_lastLineBaseline;
- (id)effectiveAttributedText;
- (id)effectiveFont;
- (id)viewForLastBaselineLayout;
- (void)_startBlinking;
- (void)_startOrStopBlinking;
- (void)_stopBlinking;
- (void)_updateBlinkerAlphaForSecondFraction:(double)a3;
- (void)dealloc;
- (void)enumerateUnderlyingLabelsWithBlock:(id)a3;
- (void)layoutSubviews;
- (void)setAnimationsPaused:(BOOL)a3;
- (void)setMaxWidth:(double)a3;
- (void)setShowSeconds:(BOOL)a3;
- (void)setShowsDesignator:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setTextColor:(id)a3;
- (void)sizeViewToFit;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTimeText;
@end

@implementation _CLKUIBlinkingTimeLabelManager

- (void)setAnimationsPaused:(BOOL)a3
{
  self->_animationsPaused = a3;
  [(_CLKUIBlinkingTimeLabelManager *)self _startOrStopBlinking];
}

- (void)_startOrStopBlinking
{
  if (self->_animationsPaused
    || ![(CLKTimeFormatter *)self->_timeFormatter reportingLiveTime])
  {
    [(_CLKUIBlinkingTimeLabelManager *)self _stopBlinking];
  }
  else
  {
    [(_CLKUIBlinkingTimeLabelManager *)self _startBlinking];
  }
}

- (void)_stopBlinking
{
  if (self->_blinkTimerToken)
  {
    -[CLKClockTimer stopUpdatesForToken:](self->_blinkTimer, "stopUpdatesForToken:");
    blinkTimerToken = self->_blinkTimerToken;
    self->_blinkTimerToken = 0;

    if (self->_usesIsolatedBlinkerLabel)
    {
      [(UILabel *)self->_minutesBlinkerLabel setAlpha:1.0];
      secondsBlinkerLabel = self->_secondsBlinkerLabel;
      [(UILabel *)secondsBlinkerLabel setAlpha:1.0];
    }
    else
    {
      id v5 = [(_CLKUIBasicTimeLabelManager *)self->_blinkerLabelManager view];
      [v5 setAlpha:1.0];
    }
  }
}

- (void)_startBlinking
{
  if (!self->_blinkTimerToken)
  {
    objc_initWeak(&location, self);
    blinkTimer = self->_blinkTimer;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48___CLKUIBlinkingTimeLabelManager__startBlinking__block_invoke;
    v8[3] = &unk_1E697BB18;
    objc_copyWeak(&v9, &location);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48___CLKUIBlinkingTimeLabelManager__startBlinking__block_invoke_139;
    v6[3] = &unk_1E697BE80;
    objc_copyWeak(&v7, &location);
    v4 = [(CLKClockTimer *)blinkTimer startUpdatesWithUpdateFrequency:2 withHandler:v8 identificationLog:v6];
    blinkTimerToken = self->_blinkTimerToken;
    self->_blinkTimerToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)updateTimeText
{
  [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager updateTimeText];
  if (self->_usesIsolatedBlinkerLabel)
  {
    id v5 = [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager minutesDesignatorAttributedText];
    v3 = [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager secondsDesignatorAttributedText];
    [(UILabel *)self->_minutesBlinkerLabel setAttributedText:v5];
    [(UILabel *)self->_secondsBlinkerLabel setAttributedText:v3];
    [(UILabel *)self->_minutesBlinkerLabel sizeToFit];
    [(UILabel *)self->_secondsBlinkerLabel sizeToFit];
  }
  else
  {
    blinkerLabelManager = self->_blinkerLabelManager;
    [(_CLKUIBasicTimeLabelManager *)blinkerLabelManager updateTimeText];
  }
}

- (CGSize)sizeThatFits
{
  [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager sizeThatFits];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)sizeViewToFit
{
  [(_CLKUIBlinkingTimeLabelManager *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(_CLKUIBlinkingTimeLabelManager *)self sizeThatFits];
  -[_CLKUIBlinkingTimeLabelManager setBounds:](self, "setBounds:", v4, v6, v7, v8);
  [(_CLKUIBlinkingTimeLabelManager *)self layoutIfNeeded];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)_CLKUIBlinkingTimeLabelManager;
  [(_CLKUIBlinkingTimeLabelManager *)&v19 layoutSubviews];
  [(_CLKUIBlinkingTimeLabelManager *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager view];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (self->_usesIsolatedBlinkerLabel)
  {
    [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager _boundingRectOfMinutesBlinker];
    -[UILabel setFrame:](self->_minutesBlinkerLabel, "setFrame:");
    [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager _boundingRectOfSecondsBlinker];
    CGFloat x = v20.origin.x;
    CGFloat y = v20.origin.y;
    CGFloat width = v20.size.width;
    CGFloat height = v20.size.height;
    secondsBlinkerLabel = self->_secondsBlinkerLabel;
    double MidX = CGRectGetMidX(v20);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    -[UILabel setCenter:](secondsBlinkerLabel, "setCenter:", MidX, CGRectGetMidY(v21));
  }
  else
  {
    v18 = [(_CLKUIBasicTimeLabelManager *)self->_blinkerLabelManager view];
    objc_msgSend(v18, "setFrame:", v4, v6, v8, v10);
  }
}

- (void)_updateBlinkerAlphaForSecondFraction:(double)a3
{
  CLKCompressFraction();
  CLKInterpolateBetweenFloatsClipped();
  double v5 = v4;
  if (self->_usesIsolatedBlinkerLabel)
  {
    [(UILabel *)self->_minutesBlinkerLabel setAlpha:v4];
    secondsBlinkerLabel = self->_secondsBlinkerLabel;
    [(UILabel *)secondsBlinkerLabel setAlpha:v5];
  }
  else
  {
    id v7 = [(_CLKUIBasicTimeLabelManager *)self->_blinkerLabelManager view];
    [v7 setAlpha:v5];
  }
}

- (_CLKUIBlinkingTimeLabelManager)initWithForDevice:(id)a3 timeFormatter:(id)a4 options:(unint64_t)a5 timer:(id)a6 labelFactory:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, void))a7;
  v29.receiver = self;
  v29.super_class = (Class)_CLKUIBlinkingTimeLabelManager;
  v16 = -[_CLKUIBlinkingTimeLabelManager initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_timeFormatter, a4);
    [(CLKTimeFormatter *)v17->_timeFormatter addObserver:v17];
    objc_storeStrong((id *)&v17->_blinkTimer, a6);
    v18 = [[_CLKUIBasicTimeLabelManager alloc] _initForDevice:v12 primary:1 withTimeFormatter:v13 options:a5 labelFactory:v15];
    numbersLabelManager = v17->_numbersLabelManager;
    v17->_numbersLabelManager = v18;

    [(_CLKUIBasicTimeLabelManager *)v17->_numbersLabelManager setShowsBlinker:0];
    CGRect v20 = [(_CLKUIBasicTimeLabelManager *)v17->_numbersLabelManager view];
    [(_CLKUIBlinkingTimeLabelManager *)v17 addSubview:v20];

    v17->_usesIsolatedBlinkerLabel = (a5 & 8) != 0;
    if ((a5 & 8) != 0)
    {
      uint64_t v24 = v15[2](v15, 0);
      minutesBlinkerLabel = v17->_minutesBlinkerLabel;
      v17->_minutesBlinkerLabel = (UILabel *)v24;

      uint64_t v26 = v15[2](v15, 0);
      secondsBlinkerLabel = v17->_secondsBlinkerLabel;
      v17->_secondsBlinkerLabel = (UILabel *)v26;

      [(_CLKUIBlinkingTimeLabelManager *)v17 addSubview:v17->_minutesBlinkerLabel];
      [(_CLKUIBlinkingTimeLabelManager *)v17 addSubview:v17->_secondsBlinkerLabel];
    }
    else
    {
      CGRect v21 = [[_CLKUIBasicTimeLabelManager alloc] _initForDevice:v12 primary:0 withTimeFormatter:v13 options:a5 labelFactory:v15];
      blinkerLabelManager = v17->_blinkerLabelManager;
      v17->_blinkerLabelManager = v21;

      [(_CLKUIBasicTimeLabelManager *)v17->_blinkerLabelManager setShowsNumbers:0];
      v23 = [(_CLKUIBasicTimeLabelManager *)v17->_blinkerLabelManager view];
      [(_CLKUIBlinkingTimeLabelManager *)v17 addSubview:v23];
    }
    [(_CLKUIBlinkingTimeLabelManager *)v17 _startOrStopBlinking];
  }

  return v17;
}

- (void)dealloc
{
  [(CLKTimeFormatter *)self->_timeFormatter removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)_CLKUIBlinkingTimeLabelManager;
  [(_CLKUIBlinkingTimeLabelManager *)&v3 dealloc];
}

- (CGSize)intrinsicSize
{
  [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager intrinsicSize];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  numbersLabelManager = self->_numbersLabelManager;
  id v5 = a3;
  [(_CLKUIBasicTimeLabelManager *)numbersLabelManager traitCollectionDidChange:v5];
  [(_CLKUIBasicTimeLabelManager *)self->_blinkerLabelManager traitCollectionDidChange:v5];
}

- (UIEdgeInsets)opticalInsets
{
  [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager opticalInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setMaxWidth:(double)a3
{
  -[_CLKUIBasicTimeLabelManager setMaxWidth:](self->_numbersLabelManager, "setMaxWidth:");
  if (!self->_usesIsolatedBlinkerLabel)
  {
    blinkerLabelManager = self->_blinkerLabelManager;
    [(_CLKUIBasicTimeLabelManager *)blinkerLabelManager setMaxWidth:a3];
  }
}

- (void)setStyle:(id)a3
{
  id v4 = a3;
  -[_CLKUIBasicTimeLabelManager setStyle:](self->_numbersLabelManager, "setStyle:");
  if (!self->_usesIsolatedBlinkerLabel) {
    [(_CLKUIBasicTimeLabelManager *)self->_blinkerLabelManager setStyle:v4];
  }
  [(_CLKUIBlinkingTimeLabelManager *)self updateTimeText];
}

- (void)setShowsDesignator:(BOOL)a3
{
  BOOL v3 = a3;
  -[_CLKUIBasicTimeLabelManager setShowsDesignator:](self->_numbersLabelManager, "setShowsDesignator:");
  if (!self->_usesIsolatedBlinkerLabel)
  {
    blinkerLabelManager = self->_blinkerLabelManager;
    [(_CLKUIBasicTimeLabelManager *)blinkerLabelManager setShowsDesignator:v3];
  }
}

- (void)setShowSeconds:(BOOL)a3
{
  BOOL v3 = a3;
  -[_CLKUIBasicTimeLabelManager setShowSeconds:](self->_numbersLabelManager, "setShowSeconds:");
  if (!self->_usesIsolatedBlinkerLabel)
  {
    blinkerLabelManager = self->_blinkerLabelManager;
    [(_CLKUIBasicTimeLabelManager *)blinkerLabelManager setShowSeconds:v3];
  }
}

- (double)_capOffsetFromBoundsTop
{
  [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager _capOffsetFromBoundsTop];
  return result;
}

- (double)_lastLineBaseline
{
  [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager _lastLineBaseline];
  return result;
}

- (id)viewForLastBaselineLayout
{
  return [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager viewForLastBaselineLayout];
}

- (id)effectiveFont
{
  return [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager effectiveFont];
}

- (id)effectiveAttributedText
{
  return [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager effectiveAttributedText];
}

- (UIColor)textColor
{
  return [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager textColor];
}

- (void)setTextColor:(id)a3
{
  id v8 = a3;
  -[_CLKUIBasicTimeLabelManager setTextColor:](self->_numbersLabelManager, "setTextColor:");
  if (self->_usesIsolatedBlinkerLabel)
  {
    [(UILabel *)self->_minutesBlinkerLabel setTextColor:v8];
    minutesBlinkerLabel = self->_minutesBlinkerLabel;
    double v5 = [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager minutesDesignatorAttributedText];
    [(UILabel *)minutesBlinkerLabel setAttributedText:v5];

    [(UILabel *)self->_secondsBlinkerLabel setTextColor:v8];
    secondsBlinkerLabel = self->_secondsBlinkerLabel;
    id v7 = [(_CLKUIBasicTimeLabelManager *)self->_numbersLabelManager secondsDesignatorAttributedText];
    [(UILabel *)secondsBlinkerLabel setAttributedText:v7];
  }
  else
  {
    [(_CLKUIBasicTimeLabelManager *)self->_blinkerLabelManager setTextColor:v8];
  }
}

- (void)enumerateUnderlyingLabelsWithBlock:(id)a3
{
  id v4 = (void (**)(id, UILabel *, void))a3;
  -[_CLKUIBasicTimeLabelManager enumerateUnderlyingLabelsWithBlock:](self->_numbersLabelManager, "enumerateUnderlyingLabelsWithBlock:");
  if (self->_usesIsolatedBlinkerLabel)
  {
    v4[2](v4, self->_minutesBlinkerLabel, 0);
    v4[2](v4, self->_secondsBlinkerLabel, 0);
  }
  else
  {
    [(_CLKUIBasicTimeLabelManager *)self->_blinkerLabelManager enumerateUnderlyingLabelsWithBlock:v4];
  }
}

- (BOOL)animationsPaused
{
  return self->_animationsPaused;
}

- (BOOL)showSeconds
{
  return self->_showSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsBlinkerLabel, 0);
  objc_storeStrong((id *)&self->_minutesBlinkerLabel, 0);
  objc_storeStrong((id *)&self->_blinkTimerToken, 0);
  objc_storeStrong((id *)&self->_blinkTimer, 0);
  objc_storeStrong((id *)&self->_blinkerLabelManager, 0);
  objc_storeStrong((id *)&self->_numbersLabelManager, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
}

@end