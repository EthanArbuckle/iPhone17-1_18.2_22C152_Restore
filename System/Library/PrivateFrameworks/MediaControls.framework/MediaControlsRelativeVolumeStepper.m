@interface MediaControlsRelativeVolumeStepper
- (MPButton)decreaseButton;
- (MPButton)increaseButton;
- (MPVolumeController)volumeController;
- (MTMaterialView)decreaseBackground;
- (MTMaterialView)increaseBackground;
- (MTVisualStylingProvider)visualStylingProvider;
- (MediaControlsRelativeVolumeStepper)initWithFrame:(CGRect)a3;
- (NSBundle)mediaControlsBundle;
- (void)decreaseButtonHoldBegan:(id)a3;
- (void)decreaseButtonHoldReleased:(id)a3;
- (void)decreaseTouchUpInside:(id)a3;
- (void)increaseButtonHoldBegan:(id)a3;
- (void)increaseButtonHoldReleased:(id)a3;
- (void)increaseTouchUpInside:(id)a3;
- (void)layoutSubviews;
- (void)setDecreaseBackground:(id)a3;
- (void)setDecreaseButton:(id)a3;
- (void)setIncreaseBackground:(id)a3;
- (void)setIncreaseButton:(id)a3;
- (void)setMediaControlsBundle:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
- (void)setVolumeController:(id)a3;
@end

@implementation MediaControlsRelativeVolumeStepper

- (MediaControlsRelativeVolumeStepper)initWithFrame:(CGRect)a3
{
  v45[8] = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)MediaControlsRelativeVolumeStepper;
  v3 = -[MediaControlsRelativeVolumeStepper initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    mediaControlsBundle = v3->_mediaControlsBundle;
    v3->_mediaControlsBundle = (NSBundle *)v4;

    uint64_t v6 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:4 configuration:4];
    decreaseBackground = v3->_decreaseBackground;
    v3->_decreaseBackground = (MTMaterialView *)v6;

    [(MTMaterialView *)v3->_decreaseBackground setClipsToBounds:1];
    [(MediaControlsRelativeVolumeStepper *)v3 addSubview:v3->_decreaseBackground];
    uint64_t v8 = [MEMORY[0x1E4F31878] easyTouchButtonWithType:0];
    decreaseButton = v3->_decreaseButton;
    v3->_decreaseButton = (MPButton *)v8;

    [(MPButton *)v3->_decreaseButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = v3->_decreaseButton;
    v11 = +[MediaControlsTheme volumeMinImage];
    [(MPButton *)v10 setImage:v11 forState:0];

    [(MediaControlsRelativeVolumeStepper *)v3 addSubview:v3->_decreaseButton];
    uint64_t v12 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:4 configuration:4];
    increaseBackground = v3->_increaseBackground;
    v3->_increaseBackground = (MTMaterialView *)v12;

    [(MTMaterialView *)v3->_increaseBackground setClipsToBounds:1];
    [(MediaControlsRelativeVolumeStepper *)v3 addSubview:v3->_increaseBackground];
    uint64_t v14 = [MEMORY[0x1E4F31878] easyTouchButtonWithType:0];
    increaseButton = v3->_increaseButton;
    v3->_increaseButton = (MPButton *)v14;

    [(MPButton *)v3->_increaseButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = v3->_increaseButton;
    v17 = +[MediaControlsTheme volumeMaxImage];
    [(MPButton *)v16 setImage:v17 forState:0];

    [(MediaControlsRelativeVolumeStepper *)v3 addSubview:v3->_increaseButton];
    [(MPButton *)v3->_decreaseButton addTarget:v3 action:sel_decreaseTouchUpInside_ forControlEvents:64];
    [(MPButton *)v3->_decreaseButton addTarget:v3 action:sel_decreaseButtonHoldBegan_ forControlEvents:0x1000000];
    [(MPButton *)v3->_decreaseButton addTarget:v3 action:sel_decreaseButtonHoldReleased_ forControlEvents:0x2000000];
    [(MPButton *)v3->_increaseButton addTarget:v3 action:sel_increaseTouchUpInside_ forControlEvents:64];
    [(MPButton *)v3->_increaseButton addTarget:v3 action:sel_increaseButtonHoldBegan_ forControlEvents:0x1000000];
    [(MPButton *)v3->_increaseButton addTarget:v3 action:sel_increaseButtonHoldReleased_ forControlEvents:0x2000000];
    v18 = [(MPButton *)v3->_increaseButton trailingAnchor];
    v19 = [(MediaControlsRelativeVolumeStepper *)v3 trailingAnchor];
    v43 = [v18 constraintEqualToAnchor:v19];

    LODWORD(v20) = 1148829696;
    [v43 setPriority:v20];
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v42 = [(MPButton *)v3->_decreaseButton leadingAnchor];
    v41 = [(MediaControlsRelativeVolumeStepper *)v3 leadingAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v45[0] = v40;
    v39 = [(MPButton *)v3->_decreaseButton heightAnchor];
    v38 = [v39 constraintEqualToConstant:28.0];
    v45[1] = v38;
    v37 = [(MPButton *)v3->_decreaseButton centerYAnchor];
    v36 = [(MediaControlsRelativeVolumeStepper *)v3 centerYAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v45[2] = v35;
    v33 = [(MPButton *)v3->_decreaseButton widthAnchor];
    v32 = [(MPButton *)v3->_increaseButton widthAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v45[3] = v31;
    v21 = [(MPButton *)v3->_increaseButton leadingAnchor];
    v22 = [(MPButton *)v3->_decreaseButton trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:7.0];
    v45[4] = v23;
    v24 = [(MPButton *)v3->_increaseButton heightAnchor];
    v25 = [v24 constraintEqualToConstant:28.0];
    v45[5] = v25;
    v26 = [(MPButton *)v3->_increaseButton centerYAnchor];
    v27 = [(MediaControlsRelativeVolumeStepper *)v3 centerYAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v45[6] = v28;
    v45[7] = v43;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:8];
    [v34 activateConstraints:v29];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsRelativeVolumeStepper;
  [(MediaControlsRelativeVolumeStepper *)&v3 layoutSubviews];
  [(MPButton *)self->_decreaseButton frame];
  -[MTMaterialView setFrame:](self->_decreaseBackground, "setFrame:");
  [(MPButton *)self->_decreaseButton frame];
  [(MTMaterialView *)self->_decreaseBackground _setContinuousCornerRadius:CGRectGetHeight(v4) * 0.5];
  [(MPButton *)self->_increaseButton frame];
  -[MTMaterialView setFrame:](self->_increaseBackground, "setFrame:");
  [(MPButton *)self->_increaseButton frame];
  [(MTMaterialView *)self->_increaseBackground _setContinuousCornerRadius:CGRectGetHeight(v5) * 0.5];
}

- (void)decreaseTouchUpInside:(id)a3
{
}

- (void)decreaseButtonHoldBegan:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    volumeController = self->_volumeController;
    [(MPVolumeController *)volumeController beginDecreasingRelativeVolume];
  }
}

- (void)decreaseButtonHoldReleased:(id)a3
{
  if ([(MPButton *)self->_decreaseButton isHolding] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    volumeController = self->_volumeController;
    [(MPVolumeController *)volumeController endDecreasingRelativeVolume];
  }
}

- (void)increaseTouchUpInside:(id)a3
{
}

- (void)increaseButtonHoldBegan:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    volumeController = self->_volumeController;
    [(MPVolumeController *)volumeController beginIncreasingRelativeVolume];
  }
}

- (void)increaseButtonHoldReleased:(id)a3
{
  if ([(MPButton *)self->_increaseButton isHolding] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    volumeController = self->_volumeController;
    [(MPVolumeController *)volumeController endIncreasingRelativeVolume];
  }
}

- (void)setVisualStylingProvider:(id)a3
{
  CGRect v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = &self->_visualStylingProvider;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    v15 = v5;
    uint64_t v8 = [(MPButton *)self->_decreaseButton imageView];
    [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:v8];

    v9 = *p_visualStylingProvider;
    v10 = [(MPButton *)self->_increaseButton imageView];
    [(MTVisualStylingProvider *)v9 stopAutomaticallyUpdatingView:v10];

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    v11 = *p_visualStylingProvider;
    uint64_t v12 = [(MPButton *)self->_decreaseButton imageView];
    [(MTVisualStylingProvider *)v11 automaticallyUpdateView:v12 withStyle:0];

    v13 = *p_visualStylingProvider;
    uint64_t v14 = [(MPButton *)self->_increaseButton imageView];
    [(MTVisualStylingProvider *)v13 automaticallyUpdateView:v14 withStyle:0];

    CGRect v5 = v15;
  }
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (MTMaterialView)increaseBackground
{
  return self->_increaseBackground;
}

- (void)setIncreaseBackground:(id)a3
{
}

- (MTMaterialView)decreaseBackground
{
  return self->_decreaseBackground;
}

- (void)setDecreaseBackground:(id)a3
{
}

- (MPButton)increaseButton
{
  return self->_increaseButton;
}

- (void)setIncreaseButton:(id)a3
{
}

- (MPButton)decreaseButton
{
  return self->_decreaseButton;
}

- (void)setDecreaseButton:(id)a3
{
}

- (NSBundle)mediaControlsBundle
{
  return self->_mediaControlsBundle;
}

- (void)setMediaControlsBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaControlsBundle, 0);
  objc_storeStrong((id *)&self->_decreaseButton, 0);
  objc_storeStrong((id *)&self->_increaseButton, 0);
  objc_storeStrong((id *)&self->_decreaseBackground, 0);
  objc_storeStrong((id *)&self->_increaseBackground, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);

  objc_storeStrong((id *)&self->_volumeController, 0);
}

@end