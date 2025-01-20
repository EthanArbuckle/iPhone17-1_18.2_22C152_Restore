@interface HUCameraLiveButtonView
- (AVBackgroundView)avBackground;
- (UIButton)liveButton;
- (void)didMoveToSuperview;
- (void)setAvBackground:(id)a3;
- (void)setLiveButton:(id)a3;
- (void)updateConstraints;
- (void)updateDisplayForStreaming:(BOOL)a3;
@end

@implementation HUCameraLiveButtonView

- (void)didMoveToSuperview
{
  v9.receiver = self;
  v9.super_class = (Class)HUCameraLiveButtonView;
  [(HUCameraLiveButtonView *)&v9 didMoveToSuperview];
  v3 = [(HUCameraLiveButtonView *)self avBackground];
  v4 = [v3 superview];

  if (v4 != self)
  {
    v5 = [(HUCameraLiveButtonView *)self avBackground];
    [(HUCameraLiveButtonView *)self addSubview:v5];
  }
  v6 = [(HUCameraLiveButtonView *)self liveButton];
  v7 = [v6 superview];

  if (v7 != self)
  {
    v8 = [(HUCameraLiveButtonView *)self liveButton];
    [(HUCameraLiveButtonView *)self addSubview:v8];
  }
}

- (UIButton)liveButton
{
  liveButton = self->_liveButton;
  if (!liveButton)
  {
    objc_msgSend(MEMORY[0x1E4F427E0], "hu_clipScrubberLiveButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIButton *)v4 setBackgroundColor:v5];

    [(UIButton *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v4 _setContinuousCornerRadius:16.0];
    -[UIButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 0.0, 18.0, 0.0, 18.0);
    v6 = self->_liveButton;
    self->_liveButton = v4;

    liveButton = self->_liveButton;
  }

  return liveButton;
}

- (AVBackgroundView)avBackground
{
  avBackground = self->_avBackground;
  if (!avBackground)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F16708]);
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 _setContinuousCornerRadius:16.0];
    v5 = self->_avBackground;
    self->_avBackground = (AVBackgroundView *)v4;

    avBackground = self->_avBackground;
  }

  return avBackground;
}

- (void)updateDisplayForStreaming:(BOOL)a3
{
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    v5 = [(HUCameraLiveButtonView *)self liveButton];
    [v5 setBackgroundColor:v4];

    [MEMORY[0x1E4F428B8] systemBlackColor];
  }
  else
  {
    v6 = [MEMORY[0x1E4F428B8] clearColor];
    v7 = [(HUCameraLiveButtonView *)self liveButton];
    [v7 setBackgroundColor:v6];

    [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [(HUCameraLiveButtonView *)self liveButton];
  [v8 setTintColor:v9];
}

- (void)updateConstraints
{
  v33[7] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)HUCameraLiveButtonView;
  [(HUCameraLiveButtonView *)&v32 updateConstraints];
  v19 = (void *)MEMORY[0x1E4F28DC8];
  v31 = [(HUCameraLiveButtonView *)self avBackground];
  v30 = [v31 rightAnchor];
  v29 = [(HUCameraLiveButtonView *)self rightAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v33[0] = v28;
  v27 = [(HUCameraLiveButtonView *)self avBackground];
  v26 = [v27 heightAnchor];
  v25 = [v26 constraintEqualToConstant:44.0];
  v33[1] = v25;
  v24 = [(HUCameraLiveButtonView *)self avBackground];
  v22 = [v24 widthAnchor];
  v23 = [(HUCameraLiveButtonView *)self liveButton];
  v21 = [v23 widthAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v33[2] = v20;
  v18 = [(HUCameraLiveButtonView *)self avBackground];
  v17 = [v18 centerYAnchor];
  v16 = [(HUCameraLiveButtonView *)self centerYAnchor];
  v15 = [v17 constraintEqualToAnchor:v16];
  v33[3] = v15;
  v14 = [(HUCameraLiveButtonView *)self liveButton];
  v13 = [v14 rightAnchor];
  v3 = [(HUCameraLiveButtonView *)self rightAnchor];
  id v4 = [v13 constraintEqualToAnchor:v3];
  v33[4] = v4;
  v5 = [(HUCameraLiveButtonView *)self liveButton];
  v6 = [v5 centerYAnchor];
  v7 = [(HUCameraLiveButtonView *)self centerYAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v33[5] = v8;
  id v9 = [(HUCameraLiveButtonView *)self liveButton];
  v10 = [v9 heightAnchor];
  v11 = [v10 constraintEqualToConstant:44.0];
  v33[6] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:7];
  [v19 activateConstraints:v12];
}

- (void)setLiveButton:(id)a3
{
}

- (void)setAvBackground:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avBackground, 0);

  objc_storeStrong((id *)&self->_liveButton, 0);
}

@end