@interface HUTimerCountdownView
- (HUTimerCountdownDelegate)delegate;
- (HUTimerCountdownView)initWithCoder:(id)a3;
- (HUTimerCountdownView)initWithFrame:(CGRect)a3;
- (HUTimerCountdownView)initWithRemainingTime:(double)a3 state:(unint64_t)a4 duration:(double)a5 delegate:(id)a6;
- (MTUITimerCountdownView)countdownView;
- (UIButton)pauseResumeButton;
- (UIView)circleBackgroundView;
- (double)duration;
- (double)remainingTime;
- (unint64_t)currentState;
- (unint64_t)state;
- (void)layoutSubviews;
- (void)setCircleBackgroundView:(id)a3;
- (void)setCountdownView:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setPauseResumeButton:(id)a3;
- (void)setRemainingTime:(double)a3;
- (void)setState:(unint64_t)a3;
- (void)toggle:(id)a3;
- (void)updateToNewState:(unint64_t)a3;
- (void)updateToNewTime:(double)a3;
@end

@implementation HUTimerCountdownView

- (HUTimerCountdownView)initWithRemainingTime:(double)a3 state:(unint64_t)a4 duration:(double)a5 delegate:(id)a6
{
  id v11 = a6;
  v31.receiver = self;
  v31.super_class = (Class)HUTimerCountdownView;
  double v12 = *MEMORY[0x1E4F1DB28];
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v16 = -[HUTimerCountdownView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v13, v14, v15);
  v17 = v16;
  if (v16)
  {
    v16->_remainingTime = a3;
    v16->_state = a4;
    v16->_duration = a5;
    objc_storeStrong((id *)&v16->_delegate, a6);
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v12, v13, v14, v15);
    circleBackgroundView = v17->_circleBackgroundView;
    v17->_circleBackgroundView = (UIView *)v18;

    v20 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIView *)v17->_circleBackgroundView setBackgroundColor:v20];

    if (([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials] & 1) == 0)
    {
      v21 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
      [(HUTimerCountdownView *)v17 setTintColor:v21];
    }
    id v22 = objc_alloc(MEMORY[0x1E4F78BC8]);
    v23 = [(HUTimerCountdownView *)v17 tintColor];
    v24 = [MEMORY[0x1E4F428B8] clearColor];
    uint64_t v25 = [v22 initWithBarColor:v23 backgroundBarColor:v24 barWidth:2.0 remainingTime:a3 duration:a5];
    countdownView = v17->_countdownView;
    v17->_countdownView = (MTUITimerCountdownView *)v25;

    uint64_t v27 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    pauseResumeButton = v17->_pauseResumeButton;
    v17->_pauseResumeButton = (UIButton *)v27;

    [(UIButton *)v17->_pauseResumeButton addTarget:v17 action:sel_toggle_ forControlEvents:64];
    [(HUTimerCountdownView *)v17 addSubview:v17->_circleBackgroundView];
    [(HUTimerCountdownView *)v17 addSubview:v17->_countdownView];
    [(HUTimerCountdownView *)v17 addSubview:v17->_pauseResumeButton];
    v29 = [(HUTimerCountdownView *)v17 countdownView];
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17->_currentState = 0;
    [(HUTimerCountdownView *)v17 updateToNewState:a4];
  }

  return v17;
}

- (HUTimerCountdownView)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithCoder_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTimerCountdownView.m", 67, @"%s is unavailable; use %@ instead",
    "-[HUTimerCountdownView initWithCoder:]",
    v6);

  return 0;
}

- (HUTimerCountdownView)initWithFrame:(CGRect)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = NSStringFromSelector(sel_initWithFrame_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTimerCountdownView.m", 72, @"%s is unavailable; use %@ instead",
    "-[HUTimerCountdownView initWithFrame:]",
    v6);

  return 0;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)HUTimerCountdownView;
  [(HUTimerCountdownView *)&v29 layoutSubviews];
  [(HUTimerCountdownView *)self bounds];
  double MidX = CGRectGetMidX(v30);
  [(HUTimerCountdownView *)self bounds];
  double MidY = CGRectGetMidY(v31);
  [(HUTimerCountdownView *)self bounds];
  double v6 = v5 + -2.0;
  [(HUTimerCountdownView *)self bounds];
  double v8 = v7 + -2.0;
  v9 = [(HUTimerCountdownView *)self circleBackgroundView];
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v6, v8);

  v10 = [(HUTimerCountdownView *)self circleBackgroundView];
  [v10 bounds];
  double v12 = v11 * 0.5;
  double v13 = [(HUTimerCountdownView *)self circleBackgroundView];
  [v13 _setContinuousCornerRadius:v12];

  double v14 = [(HUTimerCountdownView *)self circleBackgroundView];
  objc_msgSend(v14, "setCenter:", MidX, MidY);

  [(HUTimerCountdownView *)self bounds];
  double v16 = v15;
  [(HUTimerCountdownView *)self bounds];
  double v18 = v17;
  v19 = [(HUTimerCountdownView *)self countdownView];
  objc_msgSend(v19, "setBounds:", 0.0, 0.0, v16, v18);

  v20 = [(HUTimerCountdownView *)self countdownView];
  objc_msgSend(v20, "setCenter:", MidX, MidY);

  [(HUTimerCountdownView *)self bounds];
  double v22 = v21 * 0.7;
  [(HUTimerCountdownView *)self bounds];
  double v24 = v23 * 0.7;
  uint64_t v25 = [(HUTimerCountdownView *)self pauseResumeButton];
  objc_msgSend(v25, "setBounds:", 0.0, 0.0, v22, v24);

  v26 = [(HUTimerCountdownView *)self pauseResumeButton];
  objc_msgSend(v26, "setCenter:", MidX, MidY);

  uint64_t v27 = [(HUTimerCountdownView *)self tintColor];
  v28 = [(HUTimerCountdownView *)self pauseResumeButton];
  [v28 setTintColor:v27];
}

- (void)updateToNewTime:(double)a3
{
  id v4 = [(HUTimerCountdownView *)self countdownView];
  [v4 setRemainingTime:a3];
}

- (void)updateToNewState:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(HUTimerCountdownView *)self currentState] != a3)
  {
    double v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      double v17 = self;
      __int16 v18 = 2080;
      v19 = "-[HUTimerCountdownView updateToNewState:]";
      __int16 v20 = 2048;
      unint64_t v21 = [(HUTimerCountdownView *)self currentState];
      __int16 v22 = 2048;
      unint64_t v23 = a3;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s updating timer: old state (%lu) to newState (%lu)", buf, 0x2Au);
    }

    double v6 = [MEMORY[0x1E4F42A98] configurationWithPointSize:7 weight:20.0];
    if (a3 == 1)
    {
      v10 = [(HUTimerCountdownView *)self pauseResumeButton];
      [v10 setHidden:1];

      double v11 = [(HUTimerCountdownView *)self circleBackgroundView];
      [v11 setHidden:1];

      double v7 = [(HUTimerCountdownView *)self countdownView];
      [v7 setHidden:1];
    }
    else
    {
      if (a3 == 3)
      {
        double v7 = [MEMORY[0x1E4F42A80] systemImageNamed:@"pause.fill" withConfiguration:v6];
        double v12 = [(HUTimerCountdownView *)self pauseResumeButton];
        [v12 setImage:v7 forState:0];

        double v13 = [(HUTimerCountdownView *)self countdownView];
        int v14 = [v13 isStarted];

        double v15 = [(HUTimerCountdownView *)self countdownView];
        v9 = v15;
        if (v14) {
          [v15 resume];
        }
        else {
          [v15 start];
        }
      }
      else
      {
        if (a3 != 2)
        {
          NSLog(&cfstr_UnexpectedSTim.isa, "-[HUTimerCountdownView updateToNewState:]", a3);
LABEL_15:
          [(HUTimerCountdownView *)self setCurrentState:a3];

          return;
        }
        double v7 = [MEMORY[0x1E4F42A80] systemImageNamed:@"play.fill" withConfiguration:v6];
        double v8 = [(HUTimerCountdownView *)self pauseResumeButton];
        [v8 setImage:v7 forState:0];

        v9 = [(HUTimerCountdownView *)self countdownView];
        [v9 pause];
      }
    }
    goto LABEL_15;
  }
}

- (void)toggle:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    double v7 = self;
    __int16 v8 = 2080;
    v9 = "-[HUTimerCountdownView toggle:]";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User toggled pause/resume timer", (uint8_t *)&v6, 0x16u);
  }

  double v5 = [(HUTimerCountdownView *)self delegate];
  [v5 toggleTimer];
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  self->_remainingTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (UIView)circleBackgroundView
{
  return self->_circleBackgroundView;
}

- (void)setCircleBackgroundView:(id)a3
{
}

- (MTUITimerCountdownView)countdownView
{
  return self->_countdownView;
}

- (void)setCountdownView:(id)a3
{
}

- (HUTimerCountdownDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)pauseResumeButton
{
  return self->_pauseResumeButton;
}

- (void)setPauseResumeButton:(id)a3
{
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseResumeButton, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);

  objc_storeStrong((id *)&self->_circleBackgroundView, 0);
}

@end