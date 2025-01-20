@interface AVMobileChromelessPlaybackControlsView
- (AVMobileChromelessControlsStyleSheet)styleSheet;
- (AVMobileChromelessPlaybackControlButton)backwardSecondaryButton;
- (AVMobileChromelessPlaybackControlButton)forwardSecondaryButton;
- (AVMobileChromelessPlaybackControlsView)initWithStyleSheet:(id)a3;
- (AVMobileChromelessPlaybackControlsViewDelegate)delegate;
- (BOOL)backwardSecondaryControlEnabled;
- (BOOL)forwardSecondaryControlEnabled;
- (BOOL)playPauseButtonShowsPlayIcon;
- (BOOL)showsBackwardSecondaryPlaybackButton;
- (BOOL)showsForwardSecondaryPlaybackButton;
- (BOOL)showsPlayPauseButton;
- (CGSize)intrinsicContentSize;
- (double)avkit_extendedDynamicRangeGain;
- (uint64_t)_updateExtendedDynamicRangeGain;
- (unint64_t)backwardSecondaryControlIcon;
- (unint64_t)forwardSecondaryControlIcon;
- (void)_addPlaybackControlViews:(id)a3;
- (void)_setUpShadowAppearance;
- (void)_setupPointerInteractionForButton:(void *)a1;
- (void)_updateBackwardSecondaryControlIcon;
- (void)_updateForwardSecondaryControlIcon;
- (void)_updateShadowAppearanceState;
- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3;
- (void)backwardsSecondaryControlWasPressed;
- (void)didMoveToWindow;
- (void)forwardSecondaryControlWasPressed;
- (void)layoutSubviews;
- (void)playPauseButtonWasPressed;
- (void)setAvkit_extendedDynamicRangeGain:(double)a3;
- (void)setBackwardSecondaryControlEnabled:(BOOL)a3;
- (void)setBackwardSecondaryControlIcon:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setForwardSecondaryControlEnabled:(BOOL)a3;
- (void)setForwardSecondaryControlIcon:(unint64_t)a3;
- (void)setPlayPauseButtonShowsPlayIcon:(BOOL)a3;
- (void)setShowsBackwardSecondaryPlaybackButton:(BOOL)a3;
- (void)setShowsForwardSecondaryPlaybackButton:(BOOL)a3;
- (void)setShowsPlayPauseButton:(BOOL)a3;
- (void)setStyleSheet:(id)a3;
@end

@implementation AVMobileChromelessPlaybackControlsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardSecondaryButton, 0);
  objc_storeStrong((id *)&self->_backwardSecondaryButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_styleSheet, 0);

  objc_storeStrong((id *)&self->_playPauseButton, 0);
}

- (AVMobileChromelessPlaybackControlButton)forwardSecondaryButton
{
  return self->_forwardSecondaryButton;
}

- (AVMobileChromelessPlaybackControlButton)backwardSecondaryButton
{
  return self->_backwardSecondaryButton;
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileChromelessPlaybackControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileChromelessPlaybackControlsViewDelegate *)WeakRetained;
}

- (unint64_t)forwardSecondaryControlIcon
{
  return self->_forwardSecondaryControlIcon;
}

- (unint64_t)backwardSecondaryControlIcon
{
  return self->_backwardSecondaryControlIcon;
}

- (BOOL)forwardSecondaryControlEnabled
{
  return self->_forwardSecondaryControlEnabled;
}

- (BOOL)backwardSecondaryControlEnabled
{
  return self->_backwardSecondaryControlEnabled;
}

- (BOOL)showsForwardSecondaryPlaybackButton
{
  return self->_showsForwardSecondaryPlaybackButton;
}

- (BOOL)showsBackwardSecondaryPlaybackButton
{
  return self->_showsBackwardSecondaryPlaybackButton;
}

- (BOOL)showsPlayPauseButton
{
  return self->_showsPlayPauseButton;
}

- (BOOL)playPauseButtonShowsPlayIcon
{
  return self->_playPauseButtonShowsPlayIcon;
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (void)_updateForwardSecondaryControlIcon
{
  unint64_t forwardSecondaryControlIcon = self->_forwardSecondaryControlIcon;
  if (forwardSecondaryControlIcon <= 2)
  {
    v4 = off_1E5FC27B0[forwardSecondaryControlIcon];
    [(AVButton *)self->_forwardSecondaryButton setImageName:*off_1E5FC2798[forwardSecondaryControlIcon]];
    [(AVMobileChromelessPlaybackControlButton *)self->_forwardSecondaryButton setAccessibilityIdentifier:v4];
  }

  [(AVMobileChromelessPlaybackControlsView *)self setNeedsLayout];
}

- (void)_updateBackwardSecondaryControlIcon
{
  unint64_t backwardSecondaryControlIcon = self->_backwardSecondaryControlIcon;
  if (backwardSecondaryControlIcon)
  {
    if (backwardSecondaryControlIcon != 1) {
      goto LABEL_6;
    }
    v4 = @"Skip To Previous";
    v5 = AVMobileImageNameStartPreviousContentTransition;
  }
  else
  {
    v4 = @"Skip Backward";
    v5 = AVMobileImageNameSkipBack10;
  }
  [(AVButton *)self->_backwardSecondaryButton setImageName:*v5];
  [(AVMobileChromelessPlaybackControlButton *)self->_backwardSecondaryButton setAccessibilityIdentifier:v4];
LABEL_6:

  [(AVMobileChromelessPlaybackControlsView *)self setNeedsLayout];
}

- (void)_setUpShadowAppearance
{
  id v5 = [(AVMobileChromelessPlaybackControlButton *)self->_playPauseButton layer];
  v3 = [(AVMobileChromelessPlaybackControlButton *)self->_backwardSecondaryButton layer];
  v4 = [(AVMobileChromelessPlaybackControlButton *)self->_forwardSecondaryButton layer];
  objc_msgSend(v5, "setShadowOffset:", 0.0, 2.0);
  [v5 setShadowRadius:8.0];
  objc_msgSend(v3, "setShadowOffset:", 0.0, 2.0);
  [v3 setShadowRadius:8.0];
  objc_msgSend(v4, "setShadowOffset:", 0.0, 2.0);
  [v4 setShadowRadius:8.0];
  -[AVMobileChromelessPlaybackControlsView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);
}

- (void)_updateShadowAppearanceState
{
  if (a1)
  {
    id v13 = [a1[57] layer];
    v2 = [a1[64] layer];
    v3 = [a1[65] layer];
    v4 = [a1 traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    if (v5 == 1)
    {
      id v6 = [MEMORY[0x1E4FB1618] blackColor];
      uint64_t v7 = [v6 CGColor];

      int v8 = 1050253722;
      int v9 = 1041865114;
    }
    else
    {
      uint64_t v7 = 0;
      int v9 = 0;
      int v8 = 0;
    }
    [v13 setShadowColor:v7];
    LODWORD(v10) = v9;
    [v13 setShadowOpacity:v10];
    [v2 setShadowColor:v7];
    LODWORD(v11) = v8;
    [v2 setShadowOpacity:v11];
    [v3 setShadowColor:v7];
    LODWORD(v12) = v8;
    [v3 setShadowOpacity:v12];
  }
}

- (void)_addPlaybackControlViews:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AVMobileChromelessPlaybackControlsView *)self addSubview:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)forwardSecondaryControlWasPressed
{
  v3 = [(AVMobileChromelessPlaybackControlsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVMobileChromelessPlaybackControlsView *)self delegate];
    [v5 playbackControlsViewForwardSecondaryControlWasPressed:self];
  }
}

- (void)backwardsSecondaryControlWasPressed
{
  v3 = [(AVMobileChromelessPlaybackControlsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVMobileChromelessPlaybackControlsView *)self delegate];
    [v5 playbackControlsViewBackwardSecondaryControlWasPressed:self];
  }
}

- (void)playPauseButtonWasPressed
{
  v3 = [(AVMobileChromelessPlaybackControlsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVMobileChromelessPlaybackControlsView *)self delegate];
    [v5 playbackControlsViewPlayPauseButtonWasPressed:self];
  }
}

- (void)layoutSubviews
{
  v42.receiver = self;
  v42.super_class = (Class)AVMobileChromelessPlaybackControlsView;
  [(AVView *)&v42 layoutSubviews];
  [(AVMobileChromelessPlaybackControlsView *)self bounds];
  double v40 = v4;
  CGFloat v41 = v3;
  CGFloat v39 = v5;
  double v7 = v6;
  [(AVMobileChromelessPlaybackControlButton *)self->_forwardSecondaryButton intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;
  [(AVMobileChromelessPlaybackControlButton *)self->_backwardSecondaryButton intrinsicContentSize];
  double v13 = v12;
  double v15 = v14;
  [(AVMobileChromelessPlaybackControlButton *)self->_playPauseButton intrinsicContentSize];
  double v17 = v16;
  double v19 = v18;
  [(AVMobileChromelessPlaybackControlsView *)self frame];
  double v21 = v20 - (v9 + v13 + v17);
  BOOL v22 = v21 <= 112.0;
  double v23 = fmax(v21 * 0.5, 42.0);
  double v24 = fmax(v21 + -200.0, 56.0);
  if (v22) {
    double v24 = v23;
  }
  if (v24 <= 100.0) {
    double v25 = v24;
  }
  else {
    double v25 = 100.0;
  }
  double v26 = v7 + v25 * -2.0;
  if (v26 < v17)
  {
    [(AVMobileChromelessPlaybackControlButton *)self->_playPauseButton setHidden:1];
LABEL_11:
    uint64_t v31 = 1;
    -[AVMobileChromelessPlaybackControlButton setHidden:](self->_backwardSecondaryButton, "setHidden:", 1, *(void *)&v35, *(void *)&v36);
    goto LABEL_12;
  }
  double v37 = v11;
  double v38 = v25;
  double v35 = v15;
  double v36 = v13;
  double v27 = v26 - v17;
  BOOL showsPlayPauseButton = self->_showsPlayPauseButton;
  if (self->_showsPlayPauseButton)
  {
    -[AVMobileChromelessPlaybackControlButton setFrame:](self->_playPauseButton, "setFrame:", 0.0, 0.0, v17, v19);
    playPauseButton = self->_playPauseButton;
    v43.origin.x = v41;
    v43.origin.y = v39;
    v43.size.width = v7;
    v43.size.height = v40;
    double MidX = CGRectGetMidX(v43);
    v44.origin.x = v41;
    v44.origin.y = v39;
    v44.size.width = v7;
    v44.size.height = v40;
    -[AVMobileChromelessPlaybackControlButton setCenter:](playPauseButton, "setCenter:", MidX, CGRectGetMidY(v44));
  }
  [(AVMobileChromelessPlaybackControlButton *)self->_playPauseButton setHidden:!showsPlayPauseButton];
  if (v27 < v9 + v13) {
    goto LABEL_11;
  }
  BOOL showsBackwardSecondaryPlaybackButton = self->_showsBackwardSecondaryPlaybackButton;
  if (self->_showsBackwardSecondaryPlaybackButton)
  {
    [(AVMobileChromelessPlaybackControlButton *)self->_playPauseButton frame];
    -[AVMobileChromelessPlaybackControlButton setFrame:](self->_backwardSecondaryButton, "setFrame:", v33 - v38 - v13, (v40 - v35) * 0.5);
  }
  [(AVMobileChromelessPlaybackControlButton *)self->_backwardSecondaryButton setHidden:!showsBackwardSecondaryPlaybackButton];
  if (self->_showsForwardSecondaryPlaybackButton)
  {
    [(AVMobileChromelessPlaybackControlButton *)self->_playPauseButton frame];
    -[AVMobileChromelessPlaybackControlButton setFrame:](self->_forwardSecondaryButton, "setFrame:", v38 + v9 + v34, (v40 - v37) * 0.5, v9, v37);
    uint64_t v31 = 0;
  }
  else
  {
    uint64_t v31 = 1;
  }
LABEL_12:
  -[AVMobileChromelessPlaybackControlButton setHidden:](self->_forwardSecondaryButton, "setHidden:", v31, *(void *)&v35, *(void *)&v36);
}

- (CGSize)intrinsicContentSize
{
  [(AVMobileChromelessPlaybackControlButton *)self->_playPauseButton intrinsicContentSize];
  double v3 = *MEMORY[0x1E4FB30D8];
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessPlaybackControlsView;
  [(AVMobileChromelessPlaybackControlsView *)&v3 didMoveToWindow];
  -[AVMobileChromelessPlaybackControlsView _setupPointerInteractionForButton:](self, self->_playPauseButton);
  -[AVMobileChromelessPlaybackControlsView _setupPointerInteractionForButton:](self, self->_backwardSecondaryButton);
  -[AVMobileChromelessPlaybackControlsView _setupPointerInteractionForButton:](self, self->_forwardSecondaryButton);
  [(AVMobileChromelessPlaybackControlsView *)self _setUpShadowAppearance];
}

- (void)_setupPointerInteractionForButton:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    double v7 = __76__AVMobileChromelessPlaybackControlsView__setupPointerInteractionForButton___block_invoke;
    double v8 = &unk_1E5FC2778;
    objc_copyWeak(&v9, &location);
    double v4 = (void *)MEMORY[0x1B3E963E0](&v5);
    objc_msgSend(v3, "setPointerStyleProvider:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

id __76__AVMobileChromelessPlaybackControlsView__setupPointerInteractionForButton___block_invoke(uint64_t a1, void *a2)
{
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if (WeakRetained)
  {
    uint64_t v5 = [v3 pointerTargetView];
    [v5 frame];
    CGFloat x = v25.origin.x;
    CGFloat y = v25.origin.y;
    double width = v25.size.width;
    double height = v25.size.height;
    double v10 = CGRectGetWidth(v25);
    float v11 = width;
    double v12 = v10 + 10.0 - fmodf(v11, 10.0) + 20.0;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    double v13 = CGRectGetHeight(v26);
    float v14 = height;
    double v15 = v13 + 10.0 - fmodf(v14, 10.0) + 20.0;
    if (v12 >= v15) {
      double v16 = v12;
    }
    else {
      double v16 = v15;
    }
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    CGFloat v17 = CGRectGetMidX(v27) - v16 * 0.5;
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    CGFloat v18 = CGRectGetMidY(v28) - v16 * 0.5;
    double v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v5];
    v29.origin.CGFloat x = v17;
    v29.origin.CGFloat y = v18;
    v29.size.double width = v16;
    v29.size.double height = v16;
    double v20 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:", v17, v18, v16, v16, CGRectGetHeight(v29) * 0.5);
    double v21 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v19];
    BOOL v22 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v21 shape:v20];
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (void)avkit_intrinsicContentSizeOfSubviewWasInvalidated:(id)a3
{
  id v4 = a3;
  [(AVMobileChromelessPlaybackControlsView *)self invalidateIntrinsicContentSize];
  uint64_t v5 = [(AVMobileChromelessPlaybackControlsView *)self superview];
  objc_msgSend(v5, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v4);

  [(AVMobileChromelessPlaybackControlsView *)self setNeedsLayout];
}

- (void)setAvkit_extendedDynamicRangeGain:(double)a3
{
  if (self->_extendedDynamicRangeGain != a3)
  {
    self->_extendedDynamicRangeGain = a3;
    -[AVMobileChromelessPlaybackControlsView _updateExtendedDynamicRangeGain]((uint64_t)self);
  }
}

- (uint64_t)_updateExtendedDynamicRangeGain
{
  if (result)
  {
    uint64_t v1 = result;
    objc_msgSend(*(id *)(result + 512), "setAvkit_extendedDynamicRangeGain:", *(double *)(result + 464));
    objc_msgSend(*(id *)(v1 + 520), "setAvkit_extendedDynamicRangeGain:", *(double *)(v1 + 464));
    double v2 = *(void **)(v1 + 456);
    double v3 = *(double *)(v1 + 464);
    return objc_msgSend(v2, "setAvkit_extendedDynamicRangeGain:", v3);
  }
  return result;
}

- (double)avkit_extendedDynamicRangeGain
{
  return self->_extendedDynamicRangeGain;
}

- (void)setStyleSheet:(id)a3
{
  uint64_t v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  p_styleSheet = &self->_styleSheet;
  if (self->_styleSheet != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_styleSheet, a3);
    [(AVMobileChromelessPlaybackControlButton *)self->_playPauseButton setStyleSheet:*p_styleSheet];
    [(AVMobileChromelessPlaybackControlButton *)self->_forwardSecondaryButton setStyleSheet:*p_styleSheet];
    [(AVMobileChromelessPlaybackControlButton *)self->_backwardSecondaryButton setStyleSheet:*p_styleSheet];
    [(AVMobileChromelessPlaybackControlsView *)self setNeedsLayout];
    uint64_t v5 = v7;
  }
}

- (void)setBackwardSecondaryControlEnabled:(BOOL)a3
{
  if (self->_backwardSecondaryControlEnabled != a3)
  {
    self->_backwardSecondaryControlEnabled = a3;
    -[AVButton setEnabled:](self->_backwardSecondaryButton, "setEnabled:");
  }
}

- (void)setForwardSecondaryControlEnabled:(BOOL)a3
{
  if (self->_forwardSecondaryControlEnabled != a3)
  {
    self->_forwardSecondaryControlEnabled = a3;
    -[AVButton setEnabled:](self->_forwardSecondaryButton, "setEnabled:");
  }
}

- (void)setBackwardSecondaryControlIcon:(unint64_t)a3
{
  if (self->_backwardSecondaryControlIcon != a3)
  {
    self->_unint64_t backwardSecondaryControlIcon = a3;
    [(AVMobileChromelessPlaybackControlsView *)self _updateBackwardSecondaryControlIcon];
  }
}

- (void)setForwardSecondaryControlIcon:(unint64_t)a3
{
  if (self->_forwardSecondaryControlIcon != a3)
  {
    self->_unint64_t forwardSecondaryControlIcon = a3;
    [(AVMobileChromelessPlaybackControlsView *)self _updateForwardSecondaryControlIcon];
  }
}

- (void)setShowsForwardSecondaryPlaybackButton:(BOOL)a3
{
  if (self->_showsForwardSecondaryPlaybackButton != a3)
  {
    self->_showsForwardSecondaryPlaybackButton = a3;
    [(AVMobileChromelessPlaybackControlsView *)self setNeedsLayout];
  }
}

- (void)setShowsBackwardSecondaryPlaybackButton:(BOOL)a3
{
  if (self->_showsBackwardSecondaryPlaybackButton != a3)
  {
    self->_BOOL showsBackwardSecondaryPlaybackButton = a3;
    [(AVMobileChromelessPlaybackControlsView *)self setNeedsLayout];
  }
}

- (void)setShowsPlayPauseButton:(BOOL)a3
{
  if (self->_showsPlayPauseButton != a3)
  {
    self->_BOOL showsPlayPauseButton = a3;
    [(AVMobileChromelessPlaybackControlsView *)self setNeedsLayout];
  }
}

- (void)setPlayPauseButtonShowsPlayIcon:(BOOL)a3
{
  if (self->_playPauseButtonShowsPlayIcon != a3)
  {
    self->_playPauseButtonShowsPlayIcon = a3;
    if (a3) {
      id v4 = @"play";
    }
    else {
      id v4 = @"pause";
    }
    [(AVMobileChromelessPlaybackControlButton *)self->_playPauseButton setPlaybackControlButtonIconState:v4];
    playPauseButton = self->_playPauseButton;
    if (self->_playPauseButtonShowsPlayIcon) {
      uint64_t v6 = @"Play";
    }
    else {
      uint64_t v6 = @"Pause";
    }
    double v7 = AVLocalizedString(v6);
    [(AVMobileChromelessPlaybackControlButton *)playPauseButton setAccessibilityLabel:v7];

    [(AVMobileChromelessPlaybackControlsView *)self setNeedsLayout];
  }
}

- (AVMobileChromelessPlaybackControlsView)initWithStyleSheet:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AVMobileChromelessPlaybackControlsView;
  uint64_t v6 = -[AVView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    uint64_t v8 = +[AVMobileChromelessPlaybackControlButton playPauseButtonWithStyleSheet:v5];
    playPauseButton = v7->_playPauseButton;
    v7->_playPauseButton = (AVMobileChromelessPlaybackControlButton *)v8;

    [(AVMobileChromelessPlaybackControlButton *)v7->_playPauseButton addTarget:v7 action:sel_playPauseButtonWasPressed forControlEvents:64];
    uint64_t v10 = +[AVMobileChromelessPlaybackControlButton forwardSecondaryButtonWithStyleSheet:v5];
    forwardSecondaryButton = v7->_forwardSecondaryButton;
    v7->_forwardSecondaryButton = (AVMobileChromelessPlaybackControlButton *)v10;

    [(AVMobileChromelessPlaybackControlButton *)v7->_forwardSecondaryButton addTarget:v7 action:sel_forwardSecondaryControlWasPressed forControlEvents:64];
    uint64_t v12 = +[AVMobileChromelessPlaybackControlButton backwardSecondaryButtonWithStyleSheet:v5];
    backwardSecondaryButton = v7->_backwardSecondaryButton;
    v7->_backwardSecondaryButton = (AVMobileChromelessPlaybackControlButton *)v12;

    [(AVMobileChromelessPlaybackControlButton *)v7->_backwardSecondaryButton addTarget:v7 action:sel_backwardsSecondaryControlWasPressed forControlEvents:64];
    [(AVView *)v7 setIgnoresTouches:1];
    v20[0] = v7->_playPauseButton;
    v20[1] = v7->_forwardSecondaryButton;
    v20[2] = v7->_backwardSecondaryButton;
    float v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    [(AVMobileChromelessPlaybackControlsView *)v7 _addPlaybackControlViews:v14];

    [(AVMobileChromelessPlaybackControlsView *)v7 _updateBackwardSecondaryControlIcon];
    [(AVMobileChromelessPlaybackControlsView *)v7 _updateForwardSecondaryControlIcon];
    -[AVMobileChromelessPlaybackControlsView _updateExtendedDynamicRangeGain]((uint64_t)v7);
    v7->_backwardSecondaryControlEnabled = 1;
    v7->_forwardSecondaryControlEnabled = 1;
    v7->_BOOL showsPlayPauseButton = 1;
    v7->_BOOL showsBackwardSecondaryPlaybackButton = 1;
    v7->_showsForwardSecondaryPlaybackButton = 1;
    uint64_t v19 = objc_opt_class();
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    id v16 = (id)[(AVMobileChromelessPlaybackControlsView *)v7 registerForTraitChanges:v15 withHandler:&__block_literal_global_6177];
  }
  return v7;
}

void __61__AVMobileChromelessPlaybackControlsView_initWithStyleSheet___block_invoke(uint64_t a1, id *a2)
{
}

@end