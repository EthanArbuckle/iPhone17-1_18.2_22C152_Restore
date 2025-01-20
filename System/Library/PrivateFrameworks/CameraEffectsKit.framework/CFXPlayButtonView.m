@interface CFXPlayButtonView
- (CAShapeLayer)playControlMaskLayer;
- (CFXPlayButtonView)initWithCoder:(id)a3;
- (CFXPlayButtonView)initWithFrame:(CGRect)a3;
- (CFXPlayButtonViewDelegate)delegate;
- (UIButton)playButton;
- (UIImage)pauseImage;
- (UIImage)playImage;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)notifyPlaybackDidStart;
- (void)notifyPlaybackDidStop;
- (void)notifyWasTapped;
- (void)playButtonTapped:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPauseImage:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setPlayControlMaskLayer:(id)a3;
- (void)setPlayImage:(id)a3;
- (void)sharedInit;
@end

@implementation CFXPlayButtonView

- (CFXPlayButtonView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CFXPlayButtonView;
  v3 = [(CFXPlayButtonView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CFXPlayButtonView *)v3 sharedInit];
  }
  return v4;
}

- (CFXPlayButtonView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CFXPlayButtonView;
  v3 = -[CFXPlayButtonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CFXPlayButtonView *)v3 sharedInit];
  }
  return v4;
}

- (void)sharedInit
{
  v43[4] = *MEMORY[0x263EF8340];
  [(CFXPlayButtonView *)self setClipsToBounds:1];
  v3 = [MEMORY[0x263F086E0] jfxBundle];
  id v4 = (id)[v3 loadNibNamed:@"CFXPlayButtonView" owner:self options:0];

  v5 = [(CFXPlayButtonView *)self contentView];
  [(CFXPlayButtonView *)self addSubview:v5];

  objc_super v6 = [(CFXPlayButtonView *)self contentView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v35 = (void *)MEMORY[0x263F08938];
  v42 = [(CFXPlayButtonView *)self contentView];
  v41 = [v42 leadingAnchor];
  v40 = [(CFXPlayButtonView *)self leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v43[0] = v39;
  v38 = [(CFXPlayButtonView *)self contentView];
  v37 = [v38 trailingAnchor];
  v36 = [(CFXPlayButtonView *)self trailingAnchor];
  v34 = [v37 constraintEqualToAnchor:v36];
  v43[1] = v34;
  v7 = [(CFXPlayButtonView *)self contentView];
  v8 = [v7 topAnchor];
  v9 = [(CFXPlayButtonView *)self topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v43[2] = v10;
  v11 = [(CFXPlayButtonView *)self contentView];
  v12 = [v11 bottomAnchor];
  v13 = [(CFXPlayButtonView *)self bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v43[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:4];
  [v35 activateConstraints:v15];

  v16 = (void *)MEMORY[0x263F1C478];
  [(CFXPlayButtonView *)self bounds];
  v17 = objc_msgSend(v16, "bezierPathWithOvalInRect:");
  v18 = [MEMORY[0x263F1C550] clearColor];
  [(CFXPlayButtonView *)self setBackgroundColor:v18];

  v19 = [MEMORY[0x263F15880] layer];
  [(CFXPlayButtonView *)self setPlayControlMaskLayer:v19];

  id v20 = v17;
  uint64_t v21 = [v20 CGPath];
  v22 = [(CFXPlayButtonView *)self playControlMaskLayer];
  [v22 setPath:v21];

  uint64_t v23 = *MEMORY[0x263F15AC0];
  v24 = [(CFXPlayButtonView *)self playControlMaskLayer];
  [v24 setFillRule:v23];

  id v25 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
  uint64_t v26 = [v25 CGColor];
  v27 = [(CFXPlayButtonView *)self playControlMaskLayer];
  [v27 setFillColor:v26];

  v28 = [(CFXPlayButtonView *)self playControlMaskLayer];
  v29 = [(CFXPlayButtonView *)self contentView];
  v30 = [v29 layer];
  [v30 setMask:v28];

  v31 = [MEMORY[0x263F1C6C8] configurationWithPointSize:80.0];
  v32 = [MEMORY[0x263F1C6B0] systemImageNamed:@"play.circle.fill" withConfiguration:v31];
  [(CFXPlayButtonView *)self setPlayImage:v32];

  v33 = [MEMORY[0x263F1C6B0] systemImageNamed:@"pause.circle.fill" withConfiguration:v31];
  [(CFXPlayButtonView *)self setPauseImage:v33];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CFXPlayButtonView;
  [(CFXPlayButtonView *)&v7 layoutSubviews];
  v3 = (void *)MEMORY[0x263F1C478];
  [(CFXPlayButtonView *)self bounds];
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 CGPath];
  objc_super v6 = [(CFXPlayButtonView *)self playControlMaskLayer];
  [v6 setPath:v5];
}

- (void)playButtonTapped:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setSelected:", objc_msgSend(v4, "isSelected") ^ 1);
  int v5 = [v4 isSelected];

  objc_super v6 = [(CFXPlayButtonView *)self delegate];
  id v7 = v6;
  if (v5) {
    [v6 playButtonViewDidTapPlay:self];
  }
  else {
    [v6 playButtonViewDidTapPause:self];
  }
}

- (void)notifyWasTapped
{
  id v3 = [(CFXPlayButtonView *)self playButton];
  [(CFXPlayButtonView *)self playButtonTapped:v3];
}

- (void)notifyPlaybackDidStart
{
  id v3 = [(CFXPlayButtonView *)self playButton];
  id v4 = [(CFXPlayButtonView *)self pauseImage];
  [v3 setImage:v4 forState:0];

  id v5 = [(CFXPlayButtonView *)self playButton];
  [v5 setSelected:1];
}

- (void)notifyPlaybackDidStop
{
  id v3 = [(CFXPlayButtonView *)self playButton];
  id v4 = [(CFXPlayButtonView *)self playImage];
  [v3 setImage:v4 forState:0];

  id v5 = [(CFXPlayButtonView *)self playButton];
  [v5 setSelected:0];
}

- (CFXPlayButtonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXPlayButtonViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CAShapeLayer)playControlMaskLayer
{
  return self->_playControlMaskLayer;
}

- (void)setPlayControlMaskLayer:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIButton)playButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playButton);
  return (UIButton *)WeakRetained;
}

- (void)setPlayButton:(id)a3
{
}

- (UIImage)playImage
{
  return self->_playImage;
}

- (void)setPlayImage:(id)a3
{
}

- (UIImage)pauseImage
{
  return self->_pauseImage;
}

- (void)setPauseImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseImage, 0);
  objc_storeStrong((id *)&self->_playImage, 0);
  objc_destroyWeak((id *)&self->_playButton);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_playControlMaskLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end