@interface CPUITransportControlView
- (BOOL)progressActive;
- (CPUIModernButton)fastForwardButton;
- (CPUIModernButton)leftButton;
- (CPUIModernButton)playPauseButton;
- (CPUITransportControlView)initWithFrame:(CGRect)a3;
- (NSArray)constraints;
- (NSLayoutConstraint)containerHeightConstraint;
- (NSString)pauseButtonImageName;
- (NSString)playButtonImageName;
- (UIImage)defaultFastForwardButtonImage;
- (UIImage)defaultLeftButtonImage;
- (UIImage)pauseImage;
- (UIImage)playImage;
- (double)buttonHeight;
- (double)buttonSpacing;
- (void)_updatePlayPauseButton;
- (void)layoutSubviews;
- (void)setButtonHeight:(double)a3;
- (void)setButtonSpacing:(double)a3;
- (void)setConstraints:(id)a3;
- (void)setContainerHeightConstraint:(id)a3;
- (void)setDefaultFastForwardButtonImage:(id)a3;
- (void)setDefaultLeftButtonImage:(id)a3;
- (void)setPauseButtonImageName:(id)a3;
- (void)setPauseImage:(id)a3;
- (void)setPlayButtonImageName:(id)a3;
- (void)setPlayImage:(id)a3;
- (void)setProgressActive:(BOOL)a3;
- (void)setupConstraints;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation CPUITransportControlView

- (CPUITransportControlView)initWithFrame:(CGRect)a3
{
  v48[4] = *MEMORY[0x263EF8340];
  v46.receiver = self;
  v46.super_class = (Class)CPUITransportControlView;
  v3 = -[CPUITransportControlView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    playPauseButton = v3->_playPauseButton;
    v3->_playPauseButton = (CPUIModernButton *)v4;

    [(CPUIModernButton *)v3->_playPauseButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUIModernButton *)v3->_playPauseButton setContentMode:1];
    v6 = [(CPUIModernButton *)v3->_playPauseButton imageView];
    [v6 setContentMode:1];

    [(CPUIModernButton *)v3->_playPauseButton _setContinuousCornerRadius:10.0];
    [(CPUIModernButton *)v3->_playPauseButton setPrefersWhiteInDefaultState:1];
    [(CPUIModernButton *)v3->_playPauseButton setAccessibilityIdentifier:@"CPNowPlayingPlayPauseStopButton"];
    [(CPUITransportControlView *)v3 addSubview:v3->_playPauseButton];
    uint64_t v7 = objc_opt_new();
    leftButton = v3->_leftButton;
    v3->_leftButton = (CPUIModernButton *)v7;

    [(CPUIModernButton *)v3->_leftButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUIModernButton *)v3->_leftButton setContentMode:1];
    v9 = [(CPUIModernButton *)v3->_leftButton imageView];
    [v9 setContentMode:1];

    [(CPUIModernButton *)v3->_leftButton _setContinuousCornerRadius:10.0];
    [(CPUIModernButton *)v3->_leftButton setPrefersWhiteInDefaultState:1];
    [(CPUIModernButton *)v3->_leftButton setAccessibilityIdentifier:@"CPNowPlayingTransportLeftButton"];
    v10 = CPUILocalizedStringForKey(@"REWIND");
    v48[0] = v10;
    v11 = CPUILocalizedStringForKey(@"JUMP_BACK");
    v48[1] = v11;
    v12 = CPUILocalizedStringForKey(@"PREVIOUS_SONG");
    v48[2] = v12;
    v13 = CPUILocalizedStringForKey(@"PREVIOUS_TRACK");
    v48[3] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];
    [(CPUIModernButton *)v3->_leftButton setAccessibilityUserInputLabels:v14];

    [(CPUITransportControlView *)v3 addSubview:v3->_leftButton];
    uint64_t v15 = objc_opt_new();
    fastForwardButton = v3->_fastForwardButton;
    v3->_fastForwardButton = (CPUIModernButton *)v15;

    [(CPUIModernButton *)v3->_fastForwardButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPUIModernButton *)v3->_fastForwardButton setContentMode:1];
    v17 = [(CPUIModernButton *)v3->_fastForwardButton imageView];
    [v17 setContentMode:1];

    [(CPUIModernButton *)v3->_fastForwardButton _setContinuousCornerRadius:10.0];
    [(CPUIModernButton *)v3->_fastForwardButton setPrefersWhiteInDefaultState:1];
    [(CPUIModernButton *)v3->_fastForwardButton setAccessibilityIdentifier:@"CPNowPlayingTransportRightButton"];
    v18 = CPUILocalizedStringForKey(@"FAST_FORWARD");
    v47[0] = v18;
    v19 = CPUILocalizedStringForKey(@"SKIP_AHEAD");
    v47[1] = v19;
    v20 = CPUILocalizedStringForKey(@"JUMP_FORWARD");
    v47[2] = v20;
    v21 = CPUILocalizedStringForKey(@"NEXT_SONG");
    v47[3] = v21;
    v22 = CPUILocalizedStringForKey(@"NEXT_TRACK");
    v47[4] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:5];
    [(CPUIModernButton *)v3->_fastForwardButton setAccessibilityUserInputLabels:v23];

    [(CPUITransportControlView *)v3 addSubview:v3->_fastForwardButton];
    v24 = [(CPUITransportControlView *)v3 traitCollection];
    uint64_t v25 = CPUIPauseGlyph(v24);
    pauseImage = v3->_pauseImage;
    v3->_pauseImage = (UIImage *)v25;

    v27 = [(CPUITransportControlView *)v3 traitCollection];
    uint64_t v28 = CPUIBackGlyph(v27);
    defaultLeftButtonImage = v3->_defaultLeftButtonImage;
    v3->_defaultLeftButtonImage = (UIImage *)v28;

    v30 = [(CPUITransportControlView *)v3 traitCollection];
    uint64_t v31 = CPUIForwardGlyph(v30);
    defaultFastForwardButtonImage = v3->_defaultFastForwardButtonImage;
    v3->_defaultFastForwardButtonImage = (UIImage *)v31;

    v33 = [(CPUITransportControlView *)v3 defaultLeftButtonImage];
    v34 = [v33 imageWithRenderingMode:2];

    v35 = [MEMORY[0x263F825C8] labelColor];
    v36 = [v35 colorWithAlphaComponent:0.2];
    v37 = [v34 imageWithTintColor:v36];

    [(CPUIModernButton *)v3->_leftButton setImage:v34 forState:0];
    [(CPUIModernButton *)v3->_leftButton setImage:v37 forState:1];
    v38 = [(CPUITransportControlView *)v3 defaultFastForwardButtonImage];
    v39 = [v38 imageWithRenderingMode:2];

    [(CPUIModernButton *)v3->_fastForwardButton setImage:v39 forState:0];
    v40 = v3->_fastForwardButton;
    v41 = [MEMORY[0x263F825C8] labelColor];
    v42 = [v41 colorWithAlphaComponent:0.2];
    v43 = [v39 imageWithTintColor:v42];
    [(CPUIModernButton *)v40 setImage:v43 forState:1];

    [(CPUITransportControlView *)v3 setupConstraints];
    v44 = [(CPUITransportControlView *)v3 layer];
    [v44 setAllowsGroupBlending:0];
  }
  return v3;
}

- (void)setupConstraints
{
  v53[13] = *MEMORY[0x263EF8340];
  v3 = [(CPUITransportControlView *)self constraints];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08938];
    v5 = [(CPUITransportControlView *)self constraints];
    [v4 deactivateConstraints:v5];
  }
  v6 = [(CPUITransportControlView *)self heightAnchor];
  [(CPUITransportControlView *)self buttonHeight];
  objc_msgSend(v6, "constraintEqualToConstant:");
  uint64_t v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  containerHeightConstraint = self->_containerHeightConstraint;
  self->_containerHeightConstraint = v7;

  [(CPUITransportControlView *)self bounds];
  double Width = CGRectGetWidth(v54);
  [(CPUITransportControlView *)self buttonSpacing];
  double v11 = (Width + v10 * -2.0) / 3.0;
  v52 = [(CPUIModernButton *)self->_playPauseButton heightAnchor];
  v51 = [(CPUITransportControlView *)self heightAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v53[0] = v50;
  v49 = [(CPUIModernButton *)self->_leftButton heightAnchor];
  v48 = [(CPUITransportControlView *)self heightAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v53[1] = v47;
  objc_super v46 = [(CPUIModernButton *)self->_fastForwardButton heightAnchor];
  v45 = [(CPUITransportControlView *)self heightAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v53[2] = v44;
  v43 = [(CPUIModernButton *)self->_playPauseButton centerYAnchor];
  v42 = [(CPUITransportControlView *)self centerYAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v53[3] = v41;
  v40 = [(CPUIModernButton *)self->_leftButton centerYAnchor];
  v39 = [(CPUITransportControlView *)self centerYAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v53[4] = v38;
  v37 = [(CPUIModernButton *)self->_fastForwardButton centerYAnchor];
  v36 = [(CPUITransportControlView *)self centerYAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v53[5] = v35;
  v34 = [(CPUIModernButton *)self->_playPauseButton centerXAnchor];
  v33 = [(CPUITransportControlView *)self centerXAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v53[6] = v32;
  uint64_t v31 = [(CPUIModernButton *)self->_leftButton rightAnchor];
  v30 = [(CPUIModernButton *)self->_playPauseButton leftAnchor];
  [(CPUITransportControlView *)self buttonSpacing];
  v29 = [v31 constraintEqualToAnchor:v30 constant:-v12];
  v53[7] = v29;
  uint64_t v28 = [(CPUIModernButton *)self->_fastForwardButton leftAnchor];
  v27 = [(CPUIModernButton *)self->_playPauseButton rightAnchor];
  [(CPUITransportControlView *)self buttonSpacing];
  v13 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27);
  v53[8] = v13;
  v14 = [(CPUIModernButton *)self->_playPauseButton widthAnchor];
  uint64_t v15 = [v14 constraintEqualToConstant:v11];
  v53[9] = v15;
  v16 = [(CPUIModernButton *)self->_leftButton widthAnchor];
  v17 = [(CPUIModernButton *)self->_playPauseButton widthAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v53[10] = v18;
  v19 = [(CPUIModernButton *)self->_fastForwardButton widthAnchor];
  v20 = [(CPUIModernButton *)self->_playPauseButton widthAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v22 = self->_containerHeightConstraint;
  v53[11] = v21;
  v53[12] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:13];
  constraints = self->_constraints;
  self->_constraints = v23;

  uint64_t v25 = (void *)MEMORY[0x263F08938];
  v26 = [(CPUITransportControlView *)self constraints];
  [v25 activateConstraints:v26];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CPUITransportControlView;
  [(CPUITransportControlView *)&v3 layoutSubviews];
  [(CPUITransportControlView *)self setupConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPUITransportControlView;
  [(CPUITransportControlView *)&v4 traitCollectionDidChange:a3];
  [(CPUITransportControlView *)self _updatePlayPauseButton];
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)CPUITransportControlView;
  [(CPUITransportControlView *)&v3 updateConstraints];
  [(CPUITransportControlView *)self setupConstraints];
}

- (void)setButtonHeight:(double)a3
{
  self->_buttonHeight = a3;
  [(CPUITransportControlView *)self setNeedsUpdateConstraints];
}

- (void)setButtonSpacing:(double)a3
{
  self->_buttonSpacing = a3;
  [(CPUITransportControlView *)self setNeedsUpdateConstraints];
}

- (void)_updatePlayPauseButton
{
  BOOL progressActive = self->_progressActive;
  playPauseButton = self->_playPauseButton;
  if (progressActive) {
    uint64_t v5 = 496;
  }
  else {
    uint64_t v5 = 488;
  }
  [(CPUIModernButton *)playPauseButton setImage:*(Class *)((char *)&self->super.super.super.isa + v5) forState:0];
  v6 = self->_playPauseButton;
  uint64_t v7 = *(Class *)((char *)&self->super.super.super.isa + v5);
  v8 = [MEMORY[0x263F825C8] labelColor];
  v9 = [v8 colorWithAlphaComponent:0.2];
  double v10 = [v7 imageWithTintColor:v9];
  [(CPUIModernButton *)v6 setImage:v10 forState:1];

  [(CPUITransportControlView *)self setNeedsLayout];
}

- (void)setProgressActive:(BOOL)a3
{
  if (self->_progressActive != a3)
  {
    self->_BOOL progressActive = a3;
    [(CPUITransportControlView *)self _updatePlayPauseButton];
  }
}

- (void)setPlayButtonImageName:(id)a3
{
  objc_storeStrong((id *)&self->_playButtonImageName, a3);
  id v5 = a3;
  v6 = [(CPUITransportControlView *)self traitCollection];
  _CPUIGlyphFactoryWithTraitCollection(v5, 7, v6, 26.0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [(CPUITransportControlView *)self setPlayImage:v7];
  [(CPUITransportControlView *)self _updatePlayPauseButton];
}

- (void)setPauseButtonImageName:(id)a3
{
  objc_storeStrong((id *)&self->_pauseButtonImageName, a3);
  id v5 = a3;
  v6 = [(CPUITransportControlView *)self traitCollection];
  _CPUIGlyphFactoryWithTraitCollection(v5, 7, v6, 26.0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [(CPUITransportControlView *)self setPauseImage:v7];
  [(CPUITransportControlView *)self _updatePlayPauseButton];
}

- (double)buttonHeight
{
  return self->_buttonHeight;
}

- (double)buttonSpacing
{
  return self->_buttonSpacing;
}

- (CPUIModernButton)leftButton
{
  return self->_leftButton;
}

- (CPUIModernButton)playPauseButton
{
  return self->_playPauseButton;
}

- (CPUIModernButton)fastForwardButton
{
  return self->_fastForwardButton;
}

- (BOOL)progressActive
{
  return self->_progressActive;
}

- (NSString)playButtonImageName
{
  return self->_playButtonImageName;
}

- (NSString)pauseButtonImageName
{
  return self->_pauseButtonImageName;
}

- (UIImage)defaultLeftButtonImage
{
  return self->_defaultLeftButtonImage;
}

- (void)setDefaultLeftButtonImage:(id)a3
{
}

- (UIImage)defaultFastForwardButtonImage
{
  return self->_defaultFastForwardButtonImage;
}

- (void)setDefaultFastForwardButtonImage:(id)a3
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

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (NSLayoutConstraint)containerHeightConstraint
{
  return self->_containerHeightConstraint;
}

- (void)setContainerHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_pauseImage, 0);
  objc_storeStrong((id *)&self->_playImage, 0);
  objc_storeStrong((id *)&self->_defaultFastForwardButtonImage, 0);
  objc_storeStrong((id *)&self->_defaultLeftButtonImage, 0);
  objc_storeStrong((id *)&self->_pauseButtonImageName, 0);
  objc_storeStrong((id *)&self->_playButtonImageName, 0);
  objc_storeStrong((id *)&self->_fastForwardButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
}

@end