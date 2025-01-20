@interface HUTimerCancelButtonView
- (CGSize)intrinsicContentSize;
- (HUTimerCancelButtonView)initWithDelegate:(id)a3;
- (HUTimerCancelDelegate)delegate;
- (UIButton)cancelButton;
- (UIView)circleBackgroundView;
- (void)_cancelTimer:(id)a3;
- (void)layoutSubviews;
- (void)setCancelButton:(id)a3;
- (void)setCircleBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HUTimerCancelButtonView

- (HUTimerCancelButtonView)initWithDelegate:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HUTimerCancelButtonView;
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = -[HUTimerCancelButtonView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_delegate, a3);
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v6, v7, v8, v9);
    circleBackgroundView = v11->_circleBackgroundView;
    v11->_circleBackgroundView = (UIView *)v12;

    v14 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIView *)v11->_circleBackgroundView setBackgroundColor:v14];

    uint64_t v15 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    cancelButton = v11->_cancelButton;
    v11->_cancelButton = (UIButton *)v15;

    [(UIButton *)v11->_cancelButton addTarget:v11 action:sel__cancelTimer_ forControlEvents:64];
    v17 = [MEMORY[0x1E4F42A98] configurationWithPointSize:7 weight:20.0];
    v18 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark" withConfiguration:v17];
    [(UIButton *)v11->_cancelButton setImage:v18 forState:0];
    if (([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials] & 1) == 0)
    {
      v19 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
      [(UIButton *)v11->_cancelButton setTintColor:v19];
    }
    [(HUTimerCancelButtonView *)v11 addSubview:v11->_circleBackgroundView];
    [(HUTimerCancelButtonView *)v11 addSubview:v11->_cancelButton];
  }
  return v11;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)HUTimerCancelButtonView;
  [(HUTimerCancelButtonView *)&v21 layoutSubviews];
  [(HUTimerCancelButtonView *)self bounds];
  double MidX = CGRectGetMidX(v22);
  [(HUTimerCancelButtonView *)self bounds];
  double MidY = CGRectGetMidY(v23);
  [(HUTimerCancelButtonView *)self bounds];
  double v6 = v5;
  [(HUTimerCancelButtonView *)self bounds];
  double v8 = v7;
  double v9 = [(HUTimerCancelButtonView *)self circleBackgroundView];
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v6, v8);

  v10 = [(HUTimerCancelButtonView *)self circleBackgroundView];
  [v10 bounds];
  double v12 = v11 * 0.5;
  v13 = [(HUTimerCancelButtonView *)self circleBackgroundView];
  [v13 _setContinuousCornerRadius:v12];

  v14 = [(HUTimerCancelButtonView *)self circleBackgroundView];
  objc_msgSend(v14, "setCenter:", MidX, MidY);

  [(HUTimerCancelButtonView *)self bounds];
  double v16 = v15 * 0.7;
  [(HUTimerCancelButtonView *)self bounds];
  double v18 = v17 * 0.7;
  v19 = [(HUTimerCancelButtonView *)self cancelButton];
  objc_msgSend(v19, "setBounds:", 0.0, 0.0, v16, v18);

  v20 = [(HUTimerCancelButtonView *)self cancelButton];
  objc_msgSend(v20, "setCenter:", MidX, MidY);
}

- (CGSize)intrinsicContentSize
{
  double v2 = 48.0;
  double v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_cancelTimer:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    double v7 = self;
    __int16 v8 = 2080;
    double v9 = "-[HUTimerCancelButtonView _cancelTimer:]";
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped cancel timer", (uint8_t *)&v6, 0x16u);
  }

  double v5 = [(HUTimerCancelButtonView *)self delegate];
  [v5 cancelTimer];
}

- (UIView)circleBackgroundView
{
  return self->_circleBackgroundView;
}

- (void)setCircleBackgroundView:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (HUTimerCancelDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);

  objc_storeStrong((id *)&self->_circleBackgroundView, 0);
}

@end