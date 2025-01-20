@interface CLKUITimeLabel
+ (CLKUITimeLabel)labelWithOptions:(unint64_t)a3;
+ (CLKUITimeLabel)labelWithOptions:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)blinkingSeparatorEnabled;
- (BOOL)paused;
- (BOOL)showSeconds;
- (BOOL)showsDesignator;
- (CGSize)intrinsicSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)styleTransitionCurrentSize;
- (CGSize)styleTransitionEndSize;
- (CLKDevice)device;
- (CLKTimeFormatter)timeFormatter;
- (CLKUITimeLabel)initWithFrame:(CGRect)a3;
- (CLKUITimeLabel)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (CLKUITimeLabel)initWithTimeLabelOptions:(unint64_t)a3;
- (CLKUITimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4;
- (CLKUITimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4 clockTimer:(id)a5;
- (CLKUITimeLabelStyle)style;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIColor)textColor;
- (UIEdgeInsets)opticalInsets;
- (UIFont)font;
- (double)_capOffsetFromBoundsTop;
- (double)_lastLineBaseline;
- (double)maxWidth;
- (id)_newLabelManager;
- (id)_newUnderlyingLabel:(BOOL)a3;
- (id)didResizeHandler;
- (id)labelManagerContentView;
- (id)viewForLastBaselineLayout;
- (int64_t)textAlignment;
- (unint64_t)forcedNumberSystem;
- (unint64_t)options;
- (void)_enumerateUnderlyingLabelsWithBlock:(id)a3;
- (void)_fadeTransitionLabels;
- (void)_resizeIfNecessary;
- (void)_scaleTransitionLabels;
- (void)cleanupAfterStyleTransition;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prepareToTransitionToStyle:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setBlinkingPaused:(BOOL)a3;
- (void)setDidResizeHandler:(id)a3;
- (void)setFont:(id)a3;
- (void)setForcedNumberSystem:(unint64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setMaxWidth:(double)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPaused:(BOOL)a3;
- (void)setShowSeconds:(BOOL)a3;
- (void)setShowsDesignator:(BOOL)a3;
- (void)setStringAttributes:(id)a3;
- (void)setStyle:(id)a3;
- (void)setStyleTransitionFraction:(double)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setThreeDigitFont:(id)a3 fourDigitFont:(id)a4 designatorFont:(id)a5;
- (void)setTimeFont:(id)a3 designatorFont:(id)a4;
- (void)setTimeOffset:(double)a3;
- (void)setTimer:(id)a3;
- (void)sizeToFit;
- (void)timeFormatterTextDidChange:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionToTritiumOverrideDate:(id)a3;
@end

@implementation CLKUITimeLabel

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  self->_paused = a3;
  -[CLKTimeFormatter setPaused:forReason:](self->_timeFormatter, "setPaused:forReason:");
  [(CLKUITimeLabel *)self setBlinkingPaused:v3];
}

- (void)setBlinkingPaused:(BOOL)a3
{
  BOOL v3 = a3;
  -[_CLKUITimeLabelManager setAnimationsPaused:](self->_labelManager, "setAnimationsPaused:");
  fromLabelManager = self->_fromLabelManager;
  [(_CLKUITimeLabelManager *)fromLabelManager setAnimationsPaused:v3];
}

- (CLKTimeFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (void)timeFormatterTextDidChange:(id)a3
{
  [(_CLKUITimeLabelManager *)self->_labelManager updateTimeText];
  [(_CLKUITimeLabelManager *)self->_fromLabelManager updateTimeText];
  [(CLKUITimeLabel *)self _resizeIfNecessary];
}

- (void)_resizeIfNecessary
{
  [(CLKUITimeLabel *)self bounds];
  -[CLKUITimeLabel sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v4 = v3;
  double v6 = v5;
  if ((CLKSizeEqualsSize() & 1) == 0 && v4 >= 0.0 && v6 >= 0.0)
  {
    -[CLKUITimeLabel setBounds:](self, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v4, v6);
    id didResizeHandler = self->_didResizeHandler;
    if (didResizeHandler)
    {
      v8 = (void (*)(void))*((void *)didResizeHandler + 2);
      v8();
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_styleTransitioning) {
    double v3 = &OBJC_IVAR___CLKUITimeLabel__fromLabelManager;
  }
  else {
    double v3 = &OBJC_IVAR___CLKUITimeLabel__labelManager;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v3), "sizeThatFits", a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CLKUITimeLabel;
  [(CLKUITimeLabel *)&v8 layoutSubviews];
  [(_CLKUITimeLabelManager *)self->_labelManager sizeViewToFit];
  [(_CLKUITimeLabelManager *)self->_fromLabelManager sizeViewToFit];
  double v3 = MEMORY[0x1D94315A0]([(CLKUITimeLabel *)self bounds]);
  double v5 = v4;
  double v6 = [(_CLKUITimeLabelManager *)self->_labelManager view];
  objc_msgSend(v6, "setCenter:", v3, v5);

  v7 = [(_CLKUITimeLabelManager *)self->_fromLabelManager view];
  objc_msgSend(v7, "setCenter:", v3, v5);
}

- (void)setStyle:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_styleTransitioning)
  {
    [(CLKUITimeLabel *)self _cancelAnimation];
    id v4 = v7;
  }
  if (([v4 isEqual:self->_style] & 1) == 0)
  {
    double v5 = (CLKUITimeLabelStyle *)[v7 copy];
    style = self->_style;
    self->_style = v5;

    [(_CLKUITimeLabelManager *)self->_labelManager setStyle:self->_style];
    [(CLKUITimeLabel *)self _resizeIfNecessary];
  }
}

+ (CLKUITimeLabel)labelWithOptions:(unint64_t)a3
{
  return (CLKUITimeLabel *)[a1 labelWithOptions:a3 forDevice:0];
}

+ (CLKUITimeLabel)labelWithOptions:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithTimeLabelOptions:a3 forDevice:v6];

  return (CLKUITimeLabel *)v7;
}

- (CLKUITimeLabel)initWithFrame:(CGRect)a3
{
  return -[CLKUITimeLabel initWithFrame:forDevice:](self, "initWithFrame:forDevice:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CLKUITimeLabel)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  return -[CLKUITimeLabel initWithTimeLabelOptions:forDevice:](self, "initWithTimeLabelOptions:forDevice:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CLKUITimeLabel)initWithTimeLabelOptions:(unint64_t)a3
{
  return [(CLKUITimeLabel *)self initWithTimeLabelOptions:a3 forDevice:0];
}

- (CLKUITimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F196B0];
  id v7 = a4;
  objc_super v8 = [v6 sharedInstance];
  v9 = [(CLKUITimeLabel *)self initWithTimeLabelOptions:a3 forDevice:v7 clockTimer:v8];

  return v9;
}

- (CLKUITimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4 clockTimer:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CLKUITimeLabel;
  v11 = -[CLKUITimeLabel initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v11)
  {
    v12 = v9;
    if (!v9)
    {
      double v5 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      v12 = [v5 device];
    }
    objc_storeStrong((id *)&v11->_device, v12);
    if (!v9)
    {
    }
    v11->_options = a3;
    v11->_showsDesignator = (a3 & 2) != 0;
    [(CLKUITimeLabel *)v11 setTimer:v10];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F19AD0]) initWithForcesLatinNumbers:0 clockTimer:v10];
    timeFormatter = v11->_timeFormatter;
    v11->_timeFormatter = (CLKTimeFormatter *)v13;

    [(CLKTimeFormatter *)v11->_timeFormatter addObserver:v11];
    [(CLKTimeFormatter *)v11->_timeFormatter setDelegate:v11];
    v11->_ignoresWindowPauseReason = (a3 & 0x1000) != 0;
    if ((a3 & 0x1000) == 0) {
      [(CLKTimeFormatter *)v11->_timeFormatter setPaused:1 forReason:@"PausedBecauseNotInWindow"];
    }
    uint64_t v15 = [(CLKUITimeLabel *)v11 _newLabelManager];
    labelManager = v11->_labelManager;
    v11->_labelManager = (_CLKUITimeLabelManager *)v15;

    [(_CLKUITimeLabelManager *)v11->_labelManager setAnimationsPaused:0];
    [(_CLKUITimeLabelManager *)v11->_labelManager updateTimeText];
    v17 = [(_CLKUITimeLabelManager *)v11->_labelManager view];
    [(CLKUITimeLabel *)v11 addSubview:v17];

    v11->_showSeconds = 0;
    [(CLKTimeFormatter *)v11->_timeFormatter setShowSeconds:0];
    v11->_forcedNumberSystem = -1;
  }

  return v11;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CLKUITimeLabel *)self isHidden] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CLKUITimeLabel;
    [(CLKUITimeLabel *)&v5 setHidden:v3];
    [(CLKTimeFormatter *)self->_timeFormatter setPaused:[(CLKUITimeLabel *)self isHidden] forReason:@"PausedBecauseHidden"];
  }
}

- (void)setShowSeconds:(BOOL)a3
{
  if (self->_showSeconds != a3)
  {
    self->_BOOL showSeconds = a3;
    -[CLKTimeFormatter setShowSeconds:](self->_timeFormatter, "setShowSeconds:");
    labelManager = self->_labelManager;
    BOOL showSeconds = self->_showSeconds;
    [(_CLKUITimeLabelManager *)labelManager setShowSeconds:showSeconds];
  }
}

- (void)setMaxWidth:(double)a3
{
  -[_CLKUITimeLabelManager setMaxWidth:](self->_labelManager, "setMaxWidth:");
  [(_CLKUITimeLabelManager *)self->_fromLabelManager setMaxWidth:a3];
  [(CLKUITimeLabel *)self _resizeIfNecessary];
}

- (BOOL)blinkingSeparatorEnabled
{
  return self->_options & 1;
}

- (void)setShowsDesignator:(BOOL)a3
{
  if (self->_showsDesignator != a3)
  {
    BOOL v3 = a3;
    self->_showsDesignator = a3;
    -[_CLKUITimeLabelManager setShowsDesignator:](self->_labelManager, "setShowsDesignator:");
    fromLabelManager = self->_fromLabelManager;
    [(_CLKUITimeLabelManager *)fromLabelManager setShowsDesignator:v3];
  }
}

- (void)setTimer:(id)a3
{
}

- (void)setFont:(id)a3
{
}

- (void)setTimeFont:(id)a3 designatorFont:(id)a4
{
}

- (void)setStringAttributes:(id)a3
{
  id v4 = a3;
  id v9 = objc_alloc_init(CLKUITimeLabelStyle);
  [(CLKUITimeLabelStyle *)v9 setStringAttributes:v4];

  style = self->_style;
  if (style)
  {
    id v6 = [(CLKUITimeLabelStyle *)style threeDigitFont];
    [(CLKUITimeLabelStyle *)v9 setThreeDigitFont:v6];

    id v7 = [(CLKUITimeLabelStyle *)self->_style fourDigitFont];
    [(CLKUITimeLabelStyle *)v9 setFourDigitFont:v7];

    objc_super v8 = [(CLKUITimeLabelStyle *)self->_style designatorFont];
    [(CLKUITimeLabelStyle *)v9 setDesignatorFont:v8];
  }
  [(CLKUITimeLabel *)self setStyle:v9];
}

- (void)setThreeDigitFont:(id)a3 fourDigitFont:(id)a4 designatorFont:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v16 = objc_alloc_init(CLKUITimeLabelStyle);
  v11 = _FontWithCenteredColons(v10, [(CLKTimeFormatter *)self->_timeFormatter forcedNumberSystem]);

  [(CLKUITimeLabelStyle *)v16 setThreeDigitFont:v11];
  v12 = _FontWithCenteredColons(v9, [(CLKTimeFormatter *)self->_timeFormatter forcedNumberSystem]);

  [(CLKUITimeLabelStyle *)v16 setFourDigitFont:v12];
  uint64_t v13 = _FontWithCenteredColons(v8, [(CLKTimeFormatter *)self->_timeFormatter forcedNumberSystem]);

  [(CLKUITimeLabelStyle *)v16 setDesignatorFont:v13];
  style = self->_style;
  if (style)
  {
    uint64_t v15 = [(CLKUITimeLabelStyle *)style stringAttributes];
    [(CLKUITimeLabelStyle *)v16 setStringAttributes:v15];
  }
  [(CLKUITimeLabel *)self setStyle:v16];
}

- (void)setForcedNumberSystem:(unint64_t)a3
{
  self->_forcedNumberSystem = a3;
  id v4 = [(CLKUITimeLabel *)self timeFormatter];
  [v4 setForcedNumberSystem:a3];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKUITimeLabel;
  id v4 = a3;
  [(CLKUITimeLabel *)&v5 traitCollectionDidChange:v4];
  -[_CLKUITimeLabelManager traitCollectionDidChange:](self->_labelManager, "traitCollectionDidChange:", v4, v5.receiver, v5.super_class);
  [(_CLKUITimeLabelManager *)self->_fromLabelManager traitCollectionDidChange:v4];

  [(CLKUITimeLabel *)self _resizeIfNecessary];
}

- (id)labelManagerContentView
{
  return (id)[(_CLKUITimeLabelManager *)self->_labelManager view];
}

- (void)prepareToTransitionToStyle:(id)a3
{
  id v4 = (CLKUITimeLabelStyle *)a3;
  if (self->_styleTransitioning) {
    [(CLKUITimeLabel *)self cleanupAfterStyleTransition];
  }
  id v19 = [(_CLKUITimeLabelManager *)self->_labelManager textColor];
  objc_storeStrong((id *)&self->_fromStyle, self->_style);
  objc_storeStrong((id *)&self->_fromLabelManager, self->_labelManager);
  style = self->_style;
  self->_style = v4;
  id v6 = v4;

  id v7 = [(CLKUITimeLabel *)self _newLabelManager];
  labelManager = self->_labelManager;
  self->_labelManager = v7;

  [(_CLKUITimeLabelManager *)self->_labelManager setStyle:self->_style];
  [(_CLKUITimeLabelManager *)self->_labelManager setTextColor:v19];
  [(_CLKUITimeLabelManager *)self->_labelManager updateTimeText];
  [(_CLKUITimeLabelManager *)self->_labelManager sizeViewToFit];
  id v9 = [(_CLKUITimeLabelManager *)self->_labelManager view];
  [(CLKUITimeLabel *)self addSubview:v9];

  [(_CLKUITimeLabelManager *)self->_labelManager setAnimationsPaused:1];
  [(_CLKUITimeLabelManager *)self->_fromLabelManager setAnimationsPaused:1];
  id v10 = [(_CLKUITimeLabelManager *)self->_fromLabelManager effectiveFont];
  v11 = [(_CLKUITimeLabelManager *)self->_labelManager effectiveFont];

  [v10 pointSize];
  double v13 = v12;
  [v11 pointSize];
  uint64_t v15 = &OBJC_IVAR___CLKUITimeLabel__fadeEnd;
  if (v13 >= v14) {
    v16 = &OBJC_IVAR___CLKUITimeLabel__fadeEnd;
  }
  else {
    v16 = &OBJC_IVAR___CLKUITimeLabel__fadeStart;
  }
  if (v13 >= v14) {
    uint64_t v15 = &OBJC_IVAR___CLKUITimeLabel__fadeStart;
  }
  v17 = (objc_class *)qword_1D31B6920[v13 < v14];
  *(Class *)((char *)&self->super.super.super.isa + *v16) = (Class)qword_1D31B6910[v13 < v14];
  *(Class *)((char *)&self->super.super.super.isa + *v15) = v17;
  CGSize v18 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_styleTransitionEndFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_styleTransitionEndFrame.size = v18;
  self->_styleTransitioning = 1;
  [(CLKUITimeLabel *)self setStyleTransitionFraction:0.0];
}

- (void)setStyleTransitionFraction:(double)a3
{
  self->_styleTransitionFraction = a3;
  [(CLKUITimeLabel *)self _scaleTransitionLabels];
  [(CLKUITimeLabel *)self _fadeTransitionLabels];
}

- (void)cleanupAfterStyleTransition
{
  BOOL v3 = [(_CLKUITimeLabelManager *)self->_fromLabelManager view];
  [v3 removeFromSuperview];

  fromLabelManager = self->_fromLabelManager;
  self->_fromLabelManager = 0;

  self->_styleTransitioning = 0;
  [(CLKUITimeLabel *)self _resizeIfNecessary];
  [(_CLKUITimeLabelManager *)self->_labelManager setAnimationsPaused:0];
  objc_super v5 = [(_CLKUITimeLabelManager *)self->_labelManager view];
  [v5 setAlpha:1.0];

  id v6 = [(_CLKUITimeLabelManager *)self->_labelManager view];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v7;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v6 setTransform:v8];

  if (!CGRectIsNull(self->_styleTransitionEndFrame)) {
    -[CLKUITimeLabel setFrame:](self, "setFrame:", self->_styleTransitionEndFrame.origin.x, self->_styleTransitionEndFrame.origin.y, self->_styleTransitionEndFrame.size.width, self->_styleTransitionEndFrame.size.height);
  }
}

- (CGSize)styleTransitionEndSize
{
  v2 = [(_CLKUITimeLabelManager *)self->_labelManager view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)styleTransitionCurrentSize
{
  v2 = [(_CLKUITimeLabelManager *)self->_labelManager view];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_newUnderlyingLabel:(BOOL)a3
{
  return objc_alloc_init(MEMORY[0x1E4FB1930]);
}

- (void)_enumerateUnderlyingLabelsWithBlock:(id)a3
{
  labelManager = self->_labelManager;
  id v5 = a3;
  [(_CLKUITimeLabelManager *)labelManager enumerateUnderlyingLabelsWithBlock:v5];
  [(_CLKUITimeLabelManager *)self->_fromLabelManager enumerateUnderlyingLabelsWithBlock:v5];
}

- (void)sizeToFit
{
  v3.receiver = self;
  v3.super_class = (Class)CLKUITimeLabel;
  [(CLKUITimeLabel *)&v3 sizeToFit];
  [(CLKUITimeLabel *)self layoutIfNeeded];
}

- (CGSize)intrinsicSize
{
  if (self->_styleTransitioning) {
    v2 = &OBJC_IVAR___CLKUITimeLabel__fromLabelManager;
  }
  else {
    v2 = &OBJC_IVAR___CLKUITimeLabel__labelManager;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v2) intrinsicSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CLKUITimeLabel;
  [(CLKUITimeLabel *)&v4 didMoveToWindow];
  if (!self->_ignoresWindowPauseReason)
  {
    double v3 = [(CLKUITimeLabel *)self window];
    [(CLKTimeFormatter *)self->_timeFormatter setPaused:v3 == 0 forReason:@"PausedBecauseNotInWindow"];
    if (!v3) {
      [(CLKUITimeLabel *)self _cancelAnimation];
    }
  }
}

- (UIFont)font
{
  return (UIFont *)[(CLKUITimeLabelStyle *)self->_style threeDigitFont];
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  v2 = [(_CLKUITimeLabelManager *)self->_labelManager effectiveAttributedText];
  double v3 = [v2 string];

  return (NSString *)v3;
}

- (void)setAttributedText:(id)a3
{
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)[(_CLKUITimeLabelManager *)self->_labelManager effectiveAttributedText];
}

- (void)setTextColor:(id)a3
{
  labelManager = self->_labelManager;
  id v5 = a3;
  [(_CLKUITimeLabelManager *)labelManager setTextColor:v5];
  [(_CLKUITimeLabelManager *)self->_fromLabelManager setTextColor:v5];
}

- (UIColor)textColor
{
  return (UIColor *)[(_CLKUITimeLabelManager *)self->_labelManager textColor];
}

- (void)setTextAlignment:(int64_t)a3
{
}

- (int64_t)textAlignment
{
  return 1;
}

- (double)_capOffsetFromBoundsTop
{
  [(_CLKUITimeLabelManager *)self->_labelManager _capOffsetFromBoundsTop];
  return result;
}

- (double)_lastLineBaseline
{
  [(_CLKUITimeLabelManager *)self->_labelManager _lastLineBaseline];
  return result;
}

- (UIEdgeInsets)opticalInsets
{
  [(_CLKUITimeLabelManager *)self->_labelManager opticalInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForLastBaselineLayout
{
  double v3 = [(_CLKUITimeLabelManager *)self->_labelManager viewForLastBaselineLayout];
  double v4 = v3;
  if (!v3) {
    double v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (void)transitionToTritiumOverrideDate:(id)a3
{
  [(CLKUITimeLabel *)self setOverrideDate:a3 duration:0.0];
  [(CLKUITimeLabel *)self setNeedsLayout];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v5 = a3;
  id v6 = [(CLKUITimeLabel *)self timeFormatter];
  [v6 setOverrideDate:v5];
}

- (void)setTimeOffset:(double)a3
{
  id v4 = [(CLKUITimeLabel *)self timeFormatter];
  [v4 setTimeOffset:a3];
}

- (id)_newLabelManager
{
  [(CLKUITimeLabel *)self blinkingSeparatorEnabled];
  id v3 = objc_alloc((Class)objc_opt_class());
  device = self->_device;
  timeFormatter = self->_timeFormatter;
  unint64_t options = self->_options;
  timer = self->_timer;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__CLKUITimeLabel__newLabelManager__block_invoke;
  v10[3] = &unk_1E697BEA8;
  v10[4] = self;
  double v8 = (void *)[v3 initWithForDevice:device timeFormatter:timeFormatter options:options timer:timer labelFactory:v10];
  [v8 setShowsDesignator:self->_showsDesignator];
  return v8;
}

id __34__CLKUITimeLabel__newLabelManager__block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = (void *)[*(id *)(a1 + 32) _newUnderlyingLabel:a2];
  return v2;
}

- (void)_scaleTransitionLabels
{
  id v3 = [(_CLKUITimeLabelManager *)self->_fromLabelManager view];
  id v4 = [(_CLKUITimeLabelManager *)self->_labelManager view];
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  [v4 bounds];
  double styleTransitionFraction = self->_styleTransitionFraction;
  CGFloat v12 = (v9 / v6 + -1.0) * styleTransitionFraction + 1.0;
  CGFloat v13 = (v10 / v8 + -1.0) * styleTransitionFraction + 1.0;
  CGFloat v14 = v6 / v9 + (1.0 - v6 / v9) * styleTransitionFraction;
  CGFloat v15 = v8 / v10 + (1.0 - v8 / v10) * styleTransitionFraction;
  CGAffineTransformMakeScale(&v20, v12, v13);
  [v3 setTransform:&v20];
  CGAffineTransformMakeScale(&v19, v14, v15);
  [v4 setTransform:&v19];
  double v16 = MEMORY[0x1D94315A0]([(CLKUITimeLabel *)self bounds]);
  double v18 = v17;
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v4, "setCenter:", v16, v18);
}

- (void)_fadeTransitionLabels
{
  double v3 = fmin(fmax((self->_styleTransitionFraction - self->_fadeStart) / (self->_fadeEnd - self->_fadeStart), 0.0), 1.0);
  id v4 = [(_CLKUITimeLabelManager *)self->_fromLabelManager view];
  [v4 setAlpha:1.0 - v3];

  id v5 = [(_CLKUITimeLabelManager *)self->_labelManager view];
  [v5 setAlpha:v3];
}

- (unint64_t)options
{
  return self->_options;
}

- (CLKDevice)device
{
  return self->_device;
}

- (BOOL)showsDesignator
{
  return self->_showsDesignator;
}

- (BOOL)paused
{
  return self->_paused;
}

- (unint64_t)forcedNumberSystem
{
  return self->_forcedNumberSystem;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (id)didResizeHandler
{
  return self->_didResizeHandler;
}

- (void)setDidResizeHandler:(id)a3
{
}

- (BOOL)showSeconds
{
  return self->_showSeconds;
}

- (CLKUITimeLabelStyle)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong(&self->_didResizeHandler, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_timeText, 0);
  objc_storeStrong((id *)&self->_fromLabelManager, 0);
  objc_storeStrong((id *)&self->_fromStyle, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_labelManager, 0);
}

@end