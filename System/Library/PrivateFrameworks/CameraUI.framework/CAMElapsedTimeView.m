@interface CAMElapsedTimeView
+ (id)elapsedTimeFormatter;
- (BOOL)isShowingBackground;
- (BOOL)isTimerPaused;
- (CAMElapsedTimeView)initWithFrame:(CGRect)a3;
- (CAMElapsedTimeView)initWithLayoutStyle:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (NSDate)pausedTime;
- (NSDate)startTime;
- (NSString)contentSizeCategory;
- (NSTimer)_updateTimer;
- (UIImageView)_backgroundView;
- (UILabel)_timeLabel;
- (int64_t)backgroundStyle;
- (int64_t)layoutStyle;
- (void)_commonCAMElapsedTimeViewInitializationWithLayoutStyle:(int64_t)a3;
- (void)_setStartTime:(id)a3;
- (void)_startPausedAnimation;
- (void)_stopPausedAnimation;
- (void)_updateBackgroundViewAnimated:(BOOL)a3;
- (void)_updateFont;
- (void)_updateText;
- (void)dealloc;
- (void)endTimer;
- (void)layoutSubviews;
- (void)resetTimer;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)setContentSizeCategory:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setShowingBackground:(BOOL)a3;
- (void)setShowingBackground:(BOOL)a3 animated:(BOOL)a4;
- (void)setTimerPaused:(BOOL)a3;
- (void)startTimer;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMElapsedTimeView

+ (id)elapsedTimeFormatter
{
  if (elapsedTimeFormatter_onceToken != -1) {
    dispatch_once(&elapsedTimeFormatter_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)elapsedTimeFormatter_formatter;
  return v2;
}

uint64_t __42__CAMElapsedTimeView_elapsedTimeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08780]);
  v1 = (void *)elapsedTimeFormatter_formatter;
  elapsedTimeFormatter_formatter = (uint64_t)v0;

  [(id)elapsedTimeFormatter_formatter setUnitsStyle:0];
  [(id)elapsedTimeFormatter_formatter setZeroFormattingBehavior:0x10000];
  v2 = (void *)elapsedTimeFormatter_formatter;
  return [v2 setAllowedUnits:224];
}

- (void)_commonCAMElapsedTimeViewInitializationWithLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
  id v4 = objc_alloc(MEMORY[0x263F828E0]);
  v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  timeLabel = self->__timeLabel;
  self->__timeLabel = v5;

  v7 = self->__timeLabel;
  v8 = [MEMORY[0x263F825C8] whiteColor];
  [(UILabel *)v7 setTextColor:v8];

  [(UILabel *)self->__timeLabel setTextAlignment:1];
  v9 = self->__timeLabel;
  v10 = [MEMORY[0x263F825C8] clearColor];
  [(UILabel *)v9 setBackgroundColor:v10];

  [(CAMElapsedTimeView *)self _updateFont];
  v11 = [(CAMElapsedTimeView *)self traitCollection];
  [v11 displayScale];
  CGFloat v13 = v12;
  v22.width = 5.0;
  v22.height = 5.0;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v13);

  v14 = CAMRedColor();
  [v14 setFill];

  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 5.0, 5.0, 2.0);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v20 fill];
  v15 = UIGraphicsGetImageFromCurrentImageContext();
  v16 = objc_msgSend(v15, "resizableImageWithCapInsets:", 2.0, 2.0, 2.0, 2.0);

  v17 = [v16 imageWithRenderingMode:2];

  UIGraphicsEndImageContext();
  v18 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v17];
  backgroundView = self->__backgroundView;
  self->__backgroundView = v18;

  [(CAMElapsedTimeView *)self _updateBackgroundViewAnimated:0];
  [(CAMElapsedTimeView *)self addSubview:self->__backgroundView];
  [(CAMElapsedTimeView *)self addSubview:self->__timeLabel];
  [(CAMElapsedTimeView *)self _updateText];
}

- (CAMElapsedTimeView)initWithFrame:(CGRect)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMElapsedTimeView *)self initWithLayoutStyle:v5];
}

- (CAMElapsedTimeView)initWithLayoutStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMElapsedTimeView;
  id v4 = -[CAMElapsedTimeView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  uint64_t v5 = v4;
  if (v4)
  {
    [(CAMElapsedTimeView *)v4 _commonCAMElapsedTimeViewInitializationWithLayoutStyle:a3];
    v6 = v5;
  }

  return v5;
}

- (void)dealloc
{
  [(NSTimer *)self->__updateTimer invalidate];
  updateTimer = self->__updateTimer;
  self->__updateTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMElapsedTimeView;
  [(CAMElapsedTimeView *)&v4 dealloc];
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMElapsedTimeView *)self _updateFont];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->__timeLabel intrinsicContentSize];
  double v3 = v2;
  double v5 = v4;
  [MEMORY[0x263F30690] _defaultTextInsets];
  UICeilToViewScale();
  double v7 = v3 + v6;
  UICeilToViewScale();
  double v9 = v5 + v8;
  double v10 = v7;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CAMElapsedTimeView;
  [(CAMElapsedTimeView *)&v13 layoutSubviews];
  [(CAMElapsedTimeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CAMElapsedTimeView *)self _timeLabel];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  double v12 = [(CAMElapsedTimeView *)self _backgroundView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

- (void)_updateFont
{
  double v3 = [(CAMElapsedTimeView *)self traitCollection];
  id v5 = [v3 preferredContentSizeCategory];

  double v4 = +[CAMFont cameraTimerFontForContentSize:v5 layoutStyle:[(CAMElapsedTimeView *)self layoutStyle]];
  [(UILabel *)self->__timeLabel setFont:v4];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  double v4 = [(CAMElapsedTimeView *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0)
  {
    [(CAMElapsedTimeView *)self _updateFont];
    [(CAMElapsedTimeView *)self invalidateIntrinsicContentSize];
    [(CAMElapsedTimeView *)self setNeedsLayout];
  }
}

- (void)_updateText
{
  [(NSDate *)self->_startTime timeIntervalSinceNow];
  double v4 = 0.0 - v3;
  id v5 = [(id)objc_opt_class() elapsedTimeFormatter];
  id v6 = [v5 stringFromTimeInterval:v4];

  [(UILabel *)self->__timeLabel setText:v6];
}

- (void)startTimer
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF910]);
  id v16 = v3;
  if (self->_startTime)
  {
    if (self->_pausedTime)
    {
      double v4 = [MEMORY[0x263EFF910] now];
      id v5 = [(CAMElapsedTimeView *)self pausedTime];
      [v4 timeIntervalSinceDate:v5];
      double v7 = v6;

      double v8 = [(CAMElapsedTimeView *)self startTime];
      double v9 = [v8 dateByAddingTimeInterval:v7];
      [(CAMElapsedTimeView *)self _setStartTime:v9];

      pausedTime = self->_pausedTime;
      self->_pausedTime = 0;

      [(CAMElapsedTimeView *)self _stopPausedAnimation];
    }
  }
  else
  {
    [(CAMElapsedTimeView *)self _setStartTime:v3];
  }
  [(NSTimer *)self->__updateTimer invalidate];
  updateTimer = self->__updateTimer;
  self->__updateTimer = 0;

  double v12 = (NSTimer *)[objc_alloc(MEMORY[0x263EFFA20]) initWithFireDate:v16 interval:self target:sel__updateForTimer_ selector:0 userInfo:1 repeats:0.2];
  objc_super v13 = self->__updateTimer;
  self->__updateTimer = v12;

  v14 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v14 addTimer:self->__updateTimer forMode:*MEMORY[0x263EFF478]];

  v15 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [v15 addTimer:self->__updateTimer forMode:*MEMORY[0x263F83BF8]];
}

- (void)_setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
  [(CAMElapsedTimeView *)self _updateText];
}

- (void)endTimer
{
  [(NSTimer *)self->__updateTimer invalidate];
  updateTimer = self->__updateTimer;
  self->__updateTimer = 0;

  [(CAMElapsedTimeView *)self _setStartTime:0];
  pausedTime = self->_pausedTime;
  self->_pausedTime = 0;

  [(CAMElapsedTimeView *)self _stopPausedAnimation];
}

- (void)resetTimer
{
  [(CAMElapsedTimeView *)self endTimer];
  [(CAMElapsedTimeView *)self _updateText];
  [(CAMElapsedTimeView *)self startTimer];
}

- (BOOL)isTimerPaused
{
  return self->_pausedTime != 0;
}

- (void)setTimerPaused:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CAMElapsedTimeView *)self isTimerPaused] != a3)
  {
    if (v3)
    {
      id v5 = [MEMORY[0x263EFF910] now];
      pausedTime = self->_pausedTime;
      self->_pausedTime = v5;

      [(CAMElapsedTimeView *)self _updateText];
      [(NSTimer *)self->__updateTimer invalidate];
      updateTimer = self->__updateTimer;
      self->__updateTimer = 0;

      [(CAMElapsedTimeView *)self _startPausedAnimation];
    }
    else
    {
      [(CAMElapsedTimeView *)self startTimer];
    }
  }
}

- (void)_startPausedAnimation
{
  double v2 = [(CAMElapsedTimeView *)self _backgroundView];
  id v6 = [v2 layer];

  BOOL v3 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v3 setFromValue:&unk_26BDDF308];
  [v3 setToValue:&unk_26BDDF318];
  [v3 setDuration:1.0];
  double v4 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v3 setTimingFunction:v4];

  [v3 setAutoreverses:1];
  LODWORD(v5) = 2139095040;
  [v3 setRepeatCount:v5];
  [v6 addAnimation:v3 forKey:@"opacity"];
}

- (void)_stopPausedAnimation
{
  double v2 = [(CAMElapsedTimeView *)self _backgroundView];
  id v11 = [v2 layer];

  BOOL v3 = [v11 animationForKey:@"opacity"];

  if (v3)
  {
    double v4 = [v11 presentationLayer];
    if (v4) {
      double v5 = v4;
    }
    else {
      double v5 = v11;
    }
    id v6 = v5;

    double v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    double v8 = NSNumber;
    [v6 opacity];
    double v9 = objc_msgSend(v8, "numberWithFloat:");
    [v7 setFromValue:v9];

    [v7 setToValue:&unk_26BDDF308];
    [v7 setDuration:0.4];
    double v10 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EA0]];
    [v7 setTimingFunction:v10];

    [v11 removeAnimationForKey:@"opacity"];
    [v11 addAnimation:v7 forKey:@"opacity"];
  }
}

- (BOOL)isShowingBackground
{
  return [(CAMElapsedTimeView *)self backgroundStyle] != 0;
}

- (void)setShowingBackground:(BOOL)a3
{
}

- (void)setShowingBackground:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setBackgroundStyle:(int64_t)a3
{
}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    [(CAMElapsedTimeView *)self _updateBackgroundViewAnimated:a4];
  }
}

- (void)_updateBackgroundViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  switch([(CAMElapsedTimeView *)self backgroundStyle])
  {
    case 0:
      double v5 = [MEMORY[0x263F825C8] clearColor];
      break;
    case 1:
      double v5 = CAMRedColor();
      break;
    case 2:
      double v5 = [MEMORY[0x263F825C8] systemDarkGrayColor];
      break;
    case 3:
      double v5 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
      break;
    default:
      double v5 = 0;
      break;
  }
  v8[1] = 3221225472;
  v8[0] = MEMORY[0x263EF8330];
  v8[2] = __52__CAMElapsedTimeView__updateBackgroundViewAnimated___block_invoke;
  v8[3] = &unk_263FA0408;
  if (v3) {
    double v6 = 0.5;
  }
  else {
    double v6 = 0.0;
  }
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  +[CAMView animateIfNeededWithDuration:0 usingSpringWithDamping:v8 initialSpringVelocity:0 options:v6 animations:1.0 completion:0.0];
}

void __52__CAMElapsedTimeView__updateBackgroundViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _backgroundView];
  [v2 setTintColor:v1];
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)pausedTime
{
  return self->_pausedTime;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
}

- (UILabel)_timeLabel
{
  return self->__timeLabel;
}

- (UIImageView)_backgroundView
{
  return self->__backgroundView;
}

- (NSTimer)_updateTimer
{
  return self->__updateTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__updateTimer, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__timeLabel, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_pausedTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end