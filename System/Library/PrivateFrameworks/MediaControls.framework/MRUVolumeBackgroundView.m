@interface MRUVolumeBackgroundView
- (BOOL)hasExpandedButtons;
- (BOOL)showConversationAwarenessButton;
- (BOOL)showEnvironmentSlider;
- (BOOL)showNowPlayingView;
- (BOOL)showPrimaryListeningModeButton;
- (BOOL)showSecondaryAssetView;
- (BOOL)showSecondaryListeningModeButton;
- (BOOL)showSpatialAudioModeButton;
- (MRUOutputDeviceAssetView)primaryAssetView;
- (MRUOutputDeviceAssetView)secondaryAssetView;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUVolumeBackgroundView)initWithFrame:(CGRect)a3;
- (MRUVolumeNowPlayingView)nowPlayingView;
- (MediaControlsExpandableButton)conversationAwarenessButton;
- (MediaControlsExpandableButton)primaryListeningModeButton;
- (MediaControlsExpandableButton)secondaryListeningModeButton;
- (MediaControlsExpandableButton)spatialAudioModeButton;
- (double)totalHorizontalSliderWidth;
- (void)collapseExpandableButtons;
- (void)expandButton:(id)a3;
- (void)layoutSubviews;
- (void)layoutSubviewsHorizontal;
- (void)layoutSubviewsVertical;
- (void)setConversationAwarenessButton:(id)a3;
- (void)setNowPlayingView:(id)a3;
- (void)setPrimaryAssetView:(id)a3;
- (void)setPrimaryListeningModeButton:(id)a3;
- (void)setSecondaryAssetView:(id)a3;
- (void)setSecondaryListeningModeButton:(id)a3;
- (void)setShowConversationAwarenessButton:(BOOL)a3;
- (void)setShowEnvironmentSlider:(BOOL)a3;
- (void)setShowNowPlayingView:(BOOL)a3;
- (void)setShowPrimaryListeningModeButton:(BOOL)a3;
- (void)setShowSecondaryAssetView:(BOOL)a3;
- (void)setShowSecondaryListeningModeButton:(BOOL)a3;
- (void)setShowSpatialAudioModeButton:(BOOL)a3;
- (void)setSpatialAudioModeButton:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateVisibility;
@end

@implementation MRUVolumeBackgroundView

- (MediaControlsExpandableButton)spatialAudioModeButton
{
  return self->_spatialAudioModeButton;
}

- (void)updateVisibility
{
  double v3 = 1.0;
  double v4 = 1.0;
  if (self->_showSecondaryListeningModeButton)
  {
    if ([(MediaControlsExpandableButton *)self->_secondaryListeningModeButton isExpanded]) {
      double v4 = 0.5;
    }
    else {
      double v4 = 1.0;
    }
  }
  if (self->_showPrimaryListeningModeButton)
  {
    if ([(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded]) {
      double v3 = 0.5;
    }
    else {
      double v3 = 1.0;
    }
  }
  BOOL v5 = [(MRUVolumeBackgroundView *)self hasExpandedButtons];
  double v6 = 1.0;
  double v7 = 0.0;
  if (!self->_showNowPlayingView) {
    double v6 = 0.0;
  }
  [(MRUVolumeNowPlayingView *)self->_nowPlayingView setAlpha:v6];
  if (MRULayoutShouldBeVertical())
  {
    [(MRUOutputDeviceAssetView *)self->_primaryAssetView setAlpha:v4];
    if (self->_showSecondaryAssetView) {
      double v8 = v3;
    }
    else {
      double v8 = 0.0;
    }
    [(MRUOutputDeviceAssetView *)self->_secondaryAssetView setAlpha:v8];
    if (self->_showPrimaryListeningModeButton && v5) {
      BOOL v10 = ![(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded];
    }
    else {
      BOOL v10 = !self->_showPrimaryListeningModeButton;
    }
    double v18 = 0.0;
    if (!v10) {
      double v18 = 1.0;
    }
    [(MediaControlsExpandableButton *)self->_primaryListeningModeButton setAlpha:v18];
    if (self->_showSecondaryListeningModeButton && v5) {
      BOOL v20 = ![(MediaControlsExpandableButton *)self->_secondaryListeningModeButton isExpanded];
    }
    else {
      BOOL v20 = !self->_showSecondaryListeningModeButton;
    }
    double v21 = 0.0;
    if (!v20) {
      double v21 = 1.0;
    }
    [(MediaControlsExpandableButton *)self->_secondaryListeningModeButton setAlpha:v21];
    if (self->_showSpatialAudioModeButton && v5) {
      BOOL v23 = ![(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded];
    }
    else {
      BOOL v23 = !self->_showSpatialAudioModeButton;
    }
    double v24 = 0.0;
    if (!v23) {
      double v24 = 1.0;
    }
LABEL_80:
    [(MediaControlsExpandableButton *)self->_spatialAudioModeButton setAlpha:v24];
    if (self->_showConversationAwarenessButton && v5) {
      BOOL v31 = ![(MediaControlsExpandableButton *)self->_conversationAwarenessButton isExpanded];
    }
    else {
      BOOL v31 = !self->_showConversationAwarenessButton;
    }
    double v32 = 0.0;
    if (!v31) {
      double v32 = 1.0;
    }
    [(MediaControlsExpandableButton *)self->_conversationAwarenessButton setAlpha:v32];
    if (self->_showNowPlayingView) {
      double v15 = 1.0;
    }
    else {
      double v15 = 0.0;
    }
    goto LABEL_91;
  }
  if (!self->_showSecondaryAssetView)
  {
    [(MRUOutputDeviceAssetView *)self->_primaryAssetView setAlpha:1.0];
    [(MRUOutputDeviceAssetView *)self->_secondaryAssetView setAlpha:0.0];
    if (self->_showPrimaryListeningModeButton && v5) {
      BOOL v26 = ![(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded];
    }
    else {
      BOOL v26 = !self->_showPrimaryListeningModeButton;
    }
    if (v26) {
      double v27 = 0.0;
    }
    else {
      double v27 = 1.0;
    }
    [(MediaControlsExpandableButton *)self->_primaryListeningModeButton setAlpha:v27];
    [(MediaControlsExpandableButton *)self->_secondaryListeningModeButton setAlpha:0.0];
    if (self->_showSpatialAudioModeButton && v5) {
      BOOL v29 = ![(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded];
    }
    else {
      BOOL v29 = !self->_showSpatialAudioModeButton;
    }
    double v24 = 1.0;
    if (v29) {
      double v24 = 0.0;
    }
    goto LABEL_80;
  }
  if (!self->_showPrimaryListeningModeButton
    || (BOOL v11 = [(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded],
        double v12 = 0.0,
        !v11))
  {
    double v12 = v4;
  }
  [(MRUOutputDeviceAssetView *)self->_primaryAssetView setAlpha:v12];
  double v13 = 0.0;
  if (self->_showSecondaryAssetView)
  {
    if (!self->_showSecondaryListeningModeButton
      || (BOOL v14 = [(MediaControlsExpandableButton *)self->_secondaryListeningModeButton isExpanded],
          double v13 = 0.0,
          !v14))
    {
      double v13 = v3;
    }
  }
  [(MRUOutputDeviceAssetView *)self->_secondaryAssetView setAlpha:v13];
  if (self->_showPrimaryListeningModeButton
    && (!self->_showSpatialAudioModeButton
     || ![(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded]))
  {
    double v7 = v4;
  }
  [(MediaControlsExpandableButton *)self->_primaryListeningModeButton setAlpha:v7];
  double v15 = 0.0;
  if (self->_showSecondaryListeningModeButton) {
    double v16 = v3;
  }
  else {
    double v16 = 0.0;
  }
  [(MediaControlsExpandableButton *)self->_secondaryListeningModeButton setAlpha:v16];
  double v17 = 1.0;
  if (!self->_showSpatialAudioModeButton) {
    double v17 = 0.0;
  }
  [(MediaControlsExpandableButton *)self->_spatialAudioModeButton setAlpha:v17];
  [(MediaControlsExpandableButton *)self->_conversationAwarenessButton setAlpha:0.0];
  if (self->_showNowPlayingView)
  {
    double v15 = 1.0;
    if (self->_showSpatialAudioModeButton)
    {
      if ([(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded]) {
        double v15 = 0.0;
      }
      else {
        double v15 = 1.0;
      }
    }
  }
LABEL_91:
  nowPlayingView = self->_nowPlayingView;

  [(MRUVolumeNowPlayingView *)nowPlayingView setAlpha:v15];
}

- (BOOL)hasExpandedButtons
{
  if ([(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded]
    || [(MediaControlsExpandableButton *)self->_secondaryListeningModeButton isExpanded]
    || [(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded])
  {
    return 1;
  }
  conversationAwarenessButton = self->_conversationAwarenessButton;

  return [(MediaControlsExpandableButton *)conversationAwarenessButton isExpanded];
}

- (void)setShowSpatialAudioModeButton:(BOOL)a3
{
  self->_showSpatialAudioModeButton = a3;
  [(MRUVolumeBackgroundView *)self updateVisibility];

  [(MRUVolumeBackgroundView *)self setNeedsLayout];
}

- (void)setShowSecondaryListeningModeButton:(BOOL)a3
{
  self->_showSecondaryListeningModeButton = a3;
  [(MRUVolumeBackgroundView *)self updateVisibility];

  [(MRUVolumeBackgroundView *)self setNeedsLayout];
}

- (void)setShowSecondaryAssetView:(BOOL)a3
{
  self->_showSecondaryAssetView = a3;
  [(MRUVolumeBackgroundView *)self updateVisibility];

  [(MRUVolumeBackgroundView *)self setNeedsLayout];
}

- (void)setShowPrimaryListeningModeButton:(BOOL)a3
{
  self->_showPrimaryListeningModeButton = a3;
  [(MRUVolumeBackgroundView *)self updateVisibility];

  [(MRUVolumeBackgroundView *)self setNeedsLayout];
}

- (void)setShowNowPlayingView:(BOOL)a3
{
  self->_showNowPlayingView = a3;
  [(MRUVolumeBackgroundView *)self updateVisibility];

  [(MRUVolumeBackgroundView *)self setNeedsLayout];
}

- (void)setShowEnvironmentSlider:(BOOL)a3
{
  if (self->_showEnvironmentSlider != a3)
  {
    self->_showEnvironmentSlider = a3;
    [(MRUVolumeBackgroundView *)self setNeedsLayout];
  }
}

- (void)setShowConversationAwarenessButton:(BOOL)a3
{
  self->_showConversationAwarenessButton = a3;
  [(MRUVolumeBackgroundView *)self updateVisibility];

  [(MRUVolumeBackgroundView *)self setNeedsLayout];
}

- (void)layoutSubviewsVertical
{
  [(MediaControlsExpandableButton *)self->_primaryListeningModeButton setAxis:0];
  [(MediaControlsExpandableButton *)self->_secondaryListeningModeButton setAxis:0];
  [(MediaControlsExpandableButton *)self->_spatialAudioModeButton setAxis:0];
  [(MediaControlsExpandableButton *)self->_conversationAwarenessButton setAxis:0];
  [(MRUVolumeNowPlayingView *)self->_nowPlayingView setAxis:MRUIsSmallScreen() ^ 1];
  double v3 = [(MRUVolumeBackgroundView *)self traitCollection];
  [v3 displayScale];
  uint64_t v5 = v4;
  uint64_t v57 = v4;

  MRUExpandedContentInsets();
  MRUVerticalScreenInset(self);
  uint64_t v6 = CCUISliderExpandedContentModuleWidth();
  double v49 = v7;
  MRUDefaultExpandedWidth(v6);
  CCUISliderExpandedContentModuleHeight();
  [(MRUVolumeBackgroundView *)self bounds];
  UIRectCenteredIntegralRectScale();
  CGFloat v53 = v9;
  CGFloat v55 = v8;
  CGFloat v11 = v10;
  CGFloat rect = v12;
  [(MRUVolumeBackgroundView *)self bounds];
  UIRectInset();
  CGFloat x = v59.origin.x;
  CGFloat y = v59.origin.y;
  CGFloat width = v59.size.width;
  CGFloat height = v59.size.height;
  CGFloat MinX = CGRectGetMinX(v59);
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v60);
  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  double v19 = CGRectGetWidth(v61);
  v62.size.CGFloat width = v53;
  v62.origin.CGFloat x = v55;
  double v48 = v11;
  v62.origin.CGFloat y = v11;
  v62.size.CGFloat height = rect;
  double v20 = CGRectGetMinY(v62);
  CGFloat v47 = x;
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  CGFloat v51 = height;
  CGFloat v52 = width;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  double v21 = v20 - CGRectGetMinY(v63);
  if (self->_showSecondaryAssetView) {
    double v22 = v49;
  }
  else {
    double v22 = v19;
  }
  -[MRUOutputDeviceAssetView sizeThatFits:](self->_primaryAssetView, "sizeThatFits:", v22, v21);
  UIRectCenteredIntegralRectScale();
  [(MRUOutputDeviceAssetView *)self->_primaryAssetView setFrame:v57];
  v64.origin.CGFloat x = MinX;
  v64.origin.CGFloat y = MinY;
  v64.size.CGFloat width = v19;
  v64.size.CGFloat height = v21;
  CGRectGetMaxX(v64);
  v65.origin.CGFloat x = MinX;
  v65.origin.CGFloat y = MinY;
  v65.size.CGFloat width = v19;
  v65.size.CGFloat height = v21;
  CGRectGetMinY(v65);
  v66.origin.CGFloat x = MinX;
  v66.origin.CGFloat y = MinY;
  v66.size.CGFloat width = v19;
  v66.size.CGFloat height = v21;
  -[MRUOutputDeviceAssetView sizeThatFits:](self->_secondaryAssetView, "sizeThatFits:", v49, CGRectGetHeight(v66));
  UIRectCenteredIntegralRectScale();
  [(MRUOutputDeviceAssetView *)self->_secondaryAssetView setFrame:v57];
  if (self->_showSecondaryAssetView)
  {
    CGFloat v24 = v47;
    CGFloat v23 = v48;
    CGFloat v25 = v53;
    CGFloat v26 = y;
    if (![(MRUVolumeBackgroundView *)self hasExpandedButtons])
    {
      v67.origin.CGFloat x = v47;
      v67.origin.CGFloat y = y;
      v67.size.CGFloat height = height;
      v67.size.CGFloat width = width;
      CGRectGetWidth(v67);
    }
  }
  else
  {
    CGFloat v24 = v47;
    CGFloat v23 = v48;
    CGFloat v25 = v53;
    CGFloat v26 = y;
  }
  v68.origin.CGFloat x = v24;
  v68.origin.CGFloat y = v26;
  v68.size.CGFloat width = width;
  v68.size.CGFloat height = height;
  CGRectGetMaxY(v68);
  v69.origin.CGFloat x = v55;
  v69.size.CGFloat height = rect;
  v69.origin.CGFloat y = v23;
  v69.size.CGFloat width = v25;
  CGRectGetMaxY(v69);
  v70.origin.CGFloat x = v24;
  v70.origin.CGFloat y = v26;
  v70.size.CGFloat width = width;
  v70.size.CGFloat height = height;
  CGRectGetHeight(v70);
  UIRectInset();
  CGFloat v27 = v71.origin.x;
  double v28 = v71.origin.y;
  double v29 = v71.size.width;
  CGFloat v30 = v71.size.height;
  CGFloat v31 = CGRectGetWidth(v71);
  BOOL showSpatialAudioModeButton = self->_showSpatialAudioModeButton;
  double v33 = v31 / 3.0;
  if (self->_showSpatialAudioModeButton)
  {
    if (!self->_showSecondaryAssetView) {
      goto LABEL_14;
    }
    if (![(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded]) {
      goto LABEL_21;
    }
  }
  if (self->_showSecondaryAssetView
    && ![(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded])
  {
    goto LABEL_21;
  }
  BOOL showSpatialAudioModeButton = self->_showSpatialAudioModeButton;
LABEL_14:
  if (self->_showConversationAwarenessButton)
  {
    if (!showSpatialAudioModeButton) {
      goto LABEL_20;
    }
    if ([(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded])
    {
      BOOL showSpatialAudioModeButton = self->_showSpatialAudioModeButton;
      goto LABEL_18;
    }
LABEL_21:
    UIRectInset();
    goto LABEL_22;
  }
LABEL_18:
  if (showSpatialAudioModeButton || (double v33 = v27, self->_showConversationAwarenessButton))
  {
LABEL_20:
    if ([(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded]) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_22:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_primaryListeningModeButton, "setFrame:");
  if (![(MediaControlsExpandableButton *)self->_secondaryListeningModeButton isExpanded]) {
    UIRectInset();
  }
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_secondaryListeningModeButton, "setFrame:");
  if (self->_showSecondaryAssetView
    && ![(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded])
  {
    goto LABEL_32;
  }
  if (self->_showPrimaryListeningModeButton)
  {
    if (!self->_showConversationAwarenessButton) {
      goto LABEL_31;
    }
    if (![(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded])
    {
LABEL_32:
      UIRectInset();
      goto LABEL_33;
    }
    if (self->_showPrimaryListeningModeButton) {
      goto LABEL_31;
    }
  }
  double v34 = v27;
  double v35 = v28;
  double v36 = v29;
  double v37 = v30;
  if (self->_showConversationAwarenessButton)
  {
LABEL_31:
    if (![(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded]) {
      goto LABEL_32;
    }
  }
LABEL_33:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_spatialAudioModeButton, "setFrame:");
  CGFloat v50 = v27;
  if (self->_showPrimaryListeningModeButton)
  {
    if (!self->_showSpatialAudioModeButton) {
      goto LABEL_37;
    }
    if (![(MediaControlsExpandableButton *)self->_conversationAwarenessButton isExpanded])
    {
      CGFloat v39 = v25;
      CGFloat v40 = v26;
      CGFloat v41 = v24;
      double v42 = v30;
      CGFloat v43 = v55;
      goto LABEL_43;
    }
    if (self->_showPrimaryListeningModeButton)
    {
LABEL_37:
      if ([(MediaControlsExpandableButton *)self->_conversationAwarenessButton isExpanded]) {
        goto LABEL_38;
      }
      CGFloat v39 = v25;
      CGFloat v40 = v26;
      CGFloat v41 = v24;
      double v42 = v30;
      CGFloat v43 = v55;
LABEL_43:
      UIRectInset();
      goto LABEL_44;
    }
  }
LABEL_38:
  double v38 = v27;
  CGFloat v39 = v25;
  CGFloat v40 = v26;
  CGFloat v41 = v24;
  double v42 = v30;
  CGFloat v43 = v55;
  if (self->_showSpatialAudioModeButton
    && ![(MediaControlsExpandableButton *)self->_conversationAwarenessButton isExpanded])
  {
    goto LABEL_43;
  }
LABEL_44:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_conversationAwarenessButton, "setFrame:");
  v72.origin.CGFloat x = v41;
  v72.origin.CGFloat y = v40;
  CGFloat v54 = v29;
  v72.size.CGFloat width = v52;
  v72.size.CGFloat height = v51;
  CGRectGetMinX(v72);
  v73.origin.CGFloat x = v43;
  v73.origin.CGFloat y = v23;
  v73.size.CGFloat width = v39;
  v73.size.CGFloat height = rect;
  CGRectGetMaxY(v73);
  v74.origin.CGFloat y = v40;
  v74.origin.CGFloat x = v41;
  v74.size.CGFloat width = v52;
  v74.size.CGFloat height = v51;
  double v44 = CGRectGetWidth(v74);
  v75.size.CGFloat height = v42;
  v75.origin.CGFloat x = v50;
  v75.origin.CGFloat y = v28;
  v75.size.CGFloat width = v54;
  double v45 = CGRectGetMinY(v75);
  v76.origin.CGFloat x = v43;
  v76.origin.CGFloat y = v23;
  v76.size.CGFloat width = v39;
  v76.size.CGFloat height = rect;
  -[MRUVolumeNowPlayingView sizeThatFits:](self->_nowPlayingView, "sizeThatFits:", v44, v45 - CGRectGetMaxY(v76));
  UIRectCenteredIntegralRectScale();
  nowPlayingView = self->_nowPlayingView;

  -[MRUVolumeNowPlayingView setFrame:](nowPlayingView, "setFrame:");
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRUVolumeBackgroundView;
  [(MRUVolumeBackgroundView *)&v3 layoutSubviews];
  if (MRULayoutShouldBeVertical()) {
    [(MRUVolumeBackgroundView *)self layoutSubviewsVertical];
  }
  else {
    [(MRUVolumeBackgroundView *)self layoutSubviewsHorizontal];
  }
}

- (MRUVolumeNowPlayingView)nowPlayingView
{
  return self->_nowPlayingView;
}

- (MRUVolumeBackgroundView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MRUVolumeBackgroundView;
  objc_super v3 = -[MRUVolumeBackgroundView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(MRUOutputDeviceAssetView);
    primaryAssetView = v3->_primaryAssetView;
    v3->_primaryAssetView = v4;

    [(MRUVolumeBackgroundView *)v3 addSubview:v3->_primaryAssetView];
    uint64_t v6 = objc_alloc_init(MRUOutputDeviceAssetView);
    secondaryAssetView = v3->_secondaryAssetView;
    v3->_secondaryAssetView = v6;

    [(MRUVolumeBackgroundView *)v3 addSubview:v3->_secondaryAssetView];
    double v8 = objc_alloc_init(MRUVolumeNowPlayingView);
    nowPlayingView = v3->_nowPlayingView;
    v3->_nowPlayingView = v8;

    [(MRUVolumeBackgroundView *)v3 addSubview:v3->_nowPlayingView];
    double v10 = [[MediaControlsExpandableButton alloc] initForControlCenter];
    primaryListeningModeButton = v3->_primaryListeningModeButton;
    v3->_primaryListeningModeButton = v10;

    -[MediaControlsExpandableButton setMaximumExpandedSize:](v3->_primaryListeningModeButton, "setMaximumExpandedSize:", 0.0, 226.0);
    -[MediaControlsExpandableButton setButtonImageSize:](v3->_primaryListeningModeButton, "setButtonImageSize:", 54.0, 54.0);
    [(MediaControlsExpandableButton *)v3->_primaryListeningModeButton setContentVerticalAlignment:1];
    [(MRUVolumeBackgroundView *)v3 addSubview:v3->_primaryListeningModeButton];
    double v12 = [[MediaControlsExpandableButton alloc] initForControlCenter];
    secondaryListeningModeButton = v3->_secondaryListeningModeButton;
    v3->_secondaryListeningModeButton = v12;

    -[MediaControlsExpandableButton setMaximumExpandedSize:](v3->_secondaryListeningModeButton, "setMaximumExpandedSize:", 0.0, 226.0);
    -[MediaControlsExpandableButton setButtonImageSize:](v3->_secondaryListeningModeButton, "setButtonImageSize:", 54.0, 54.0);
    [(MediaControlsExpandableButton *)v3->_secondaryListeningModeButton setContentVerticalAlignment:1];
    [(MRUVolumeBackgroundView *)v3 addSubview:v3->_secondaryListeningModeButton];
    BOOL v14 = [[MediaControlsExpandableButton alloc] initForControlCenter];
    spatialAudioModeButton = v3->_spatialAudioModeButton;
    v3->_spatialAudioModeButton = v14;

    -[MediaControlsExpandableButton setMaximumExpandedSize:](v3->_spatialAudioModeButton, "setMaximumExpandedSize:", 0.0, 226.0);
    -[MediaControlsExpandableButton setButtonImageSize:](v3->_spatialAudioModeButton, "setButtonImageSize:", 54.0, 54.0);
    [(MediaControlsExpandableButton *)v3->_spatialAudioModeButton setContentVerticalAlignment:1];
    [(MRUVolumeBackgroundView *)v3 addSubview:v3->_spatialAudioModeButton];
    double v16 = [[MediaControlsExpandableButton alloc] initForControlCenter];
    conversationAwarenessButton = v3->_conversationAwarenessButton;
    v3->_conversationAwarenessButton = v16;

    -[MediaControlsExpandableButton setMaximumExpandedSize:](v3->_conversationAwarenessButton, "setMaximumExpandedSize:", 0.0, 226.0);
    -[MediaControlsExpandableButton setButtonImageSize:](v3->_conversationAwarenessButton, "setButtonImageSize:", 54.0, 54.0);
    [(MediaControlsExpandableButton *)v3->_conversationAwarenessButton setContentVerticalAlignment:1];
    [(MRUVolumeBackgroundView *)v3 addSubview:v3->_conversationAwarenessButton];
    [(MRUVolumeBackgroundView *)v3 updateVisibility];
  }
  return v3;
}

- (void)layoutSubviewsHorizontal
{
  [(MediaControlsExpandableButton *)self->_primaryListeningModeButton setAxis:1];
  [(MediaControlsExpandableButton *)self->_secondaryListeningModeButton setAxis:1];
  [(MediaControlsExpandableButton *)self->_spatialAudioModeButton setAxis:1];
  [(MediaControlsExpandableButton *)self->_conversationAwarenessButton setAxis:1];
  BOOL v3 = self->_showSecondaryAssetView && self->_showSpatialAudioModeButton;
  [(MRUVolumeNowPlayingView *)self->_nowPlayingView setAxis:v3];
  uint64_t v4 = [(MRUVolumeBackgroundView *)self traitCollection];
  [v4 displayScale];
  uint64_t v44 = v5;

  MRUExpandedContentInsets();
  MRUHortizonalScreenInset(self);
  [(MRUVolumeBackgroundView *)self bounds];
  UIRectInset();
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CCUISliderExpandedContentModuleWidth();
  CCUISliderExpandedContentModuleHeight();
  v46.origin.CGFloat x = v7;
  v46.origin.CGFloat y = v9;
  v46.size.CGFloat width = v11;
  v46.size.CGFloat height = v13;
  double Width = CGRectGetWidth(v46);
  [(MRUVolumeBackgroundView *)self totalHorizontalSliderWidth];
  double v16 = Width - v15;
  if (self->_showSecondaryAssetView)
  {
    double v17 = 3.0;
    if (!self->_showSpatialAudioModeButton) {
      double v17 = 2.0;
    }
  }
  else
  {
    double v17 = 2.0;
  }
  double v18 = v16 / v17;
  v47.origin.CGFloat x = v7;
  v47.origin.CGFloat y = v9;
  v47.size.CGFloat width = v11;
  v47.size.CGFloat height = v13;
  CGRectGetMinX(v47);
  double v36 = v18;
  [(MRUVolumeBackgroundView *)self bounds];
  UIRectCenteredYInRectScale();
  CGFloat v42 = v20;
  CGFloat v43 = v19;
  CGFloat v38 = v22;
  CGFloat v40 = v21;
  v48.origin.CGFloat x = v7;
  v48.origin.CGFloat y = v9;
  v48.size.CGFloat width = v11;
  v48.size.CGFloat height = v13;
  CGRectGetMaxX(v48);
  [(MRUVolumeBackgroundView *)self bounds];
  UIRectCenteredYInRectScale();
  CGFloat v34 = v24;
  CGFloat v35 = v23;
  CGFloat v26 = v25;
  CGFloat rect = v27;
  v49.origin.CGFloat x = v7;
  v49.origin.CGFloat y = v9;
  v49.size.CGFloat width = v11;
  v49.size.CGFloat height = v13;
  +[MediaControlsExpandableButton collapsedHeightWithImageHeight:maximumHeight:](MediaControlsExpandableButton, "collapsedHeightWithImageHeight:maximumHeight:", 54.0, CGRectGetHeight(v49) / 3.0, v44);
  v50.origin.CGFloat x = v7;
  v50.origin.CGFloat y = v9;
  v50.size.CGFloat width = v11;
  v50.size.CGFloat height = v13;
  CGFloat MinX = CGRectGetMinX(v50);
  v51.origin.CGFloat x = v7;
  v51.origin.CGFloat y = v9;
  v51.size.CGFloat width = v11;
  v51.size.CGFloat height = v13;
  CGFloat MinY = CGRectGetMinY(v51);
  v52.origin.CGFloat x = v7;
  v52.origin.CGFloat y = v9;
  v52.size.CGFloat width = v11;
  v52.size.CGFloat height = v13;
  double Height = CGRectGetHeight(v52);
  v53.origin.CGFloat y = v42;
  v53.origin.CGFloat x = v43;
  v53.size.CGFloat height = v38;
  v53.size.CGFloat width = v40;
  CGFloat MaxX = CGRectGetMaxX(v53);
  v54.origin.CGFloat x = v7;
  v54.origin.CGFloat y = v9;
  v54.size.CGFloat width = v11;
  v54.size.CGFloat height = v13;
  CGFloat v41 = CGRectGetMinY(v54);
  v55.origin.CGFloat x = v7;
  v55.origin.CGFloat y = v9;
  v55.size.CGFloat width = v11;
  v55.size.CGFloat height = v13;
  CGFloat v39 = CGRectGetHeight(v55);
  v56.size.CGFloat width = v34;
  v56.origin.CGFloat x = v35;
  v56.origin.CGFloat y = v26;
  v56.size.CGFloat height = rect;
  CGRectGetMaxX(v56);
  v57.origin.CGFloat x = v7;
  v57.origin.CGFloat y = v9;
  v57.size.CGFloat width = v11;
  v57.size.CGFloat height = v13;
  CGRectGetMinY(v57);
  v58.origin.CGFloat x = v7;
  v58.origin.CGFloat y = v9;
  v58.size.CGFloat width = v11;
  v58.size.CGFloat height = v13;
  CGRectGetHeight(v58);
  UIRectInset();
  if (self->_showSecondaryAssetView || self->_showNowPlayingView) {
    UIRectInset();
  }
  UIRectIntegralWithScale();
  -[MRUOutputDeviceAssetView setFrame:](self->_primaryAssetView, "setFrame:");
  UIRectInset();
  UIRectIntegralWithScale();
  -[MRUOutputDeviceAssetView setFrame:](self->_secondaryAssetView, "setFrame:");
  if (self->_showSecondaryAssetView)
  {
    if ([(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded]) {
      goto LABEL_26;
    }
    if (self->_showSecondaryAssetView) {
      goto LABEL_25;
    }
  }
  if (!self->_showSpatialAudioModeButton) {
    goto LABEL_19;
  }
  if (self->_showConversationAwarenessButton)
  {
    if ([(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded])
    {
      if (!self->_showSpatialAudioModeButton)
      {
LABEL_19:
        if (!self->_showConversationAwarenessButton) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      goto LABEL_20;
    }
LABEL_25:
    UIRectInset();
    goto LABEL_26;
  }
LABEL_20:
  if (![(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded]) {
    goto LABEL_25;
  }
LABEL_21:
  if (![(MediaControlsExpandableButton *)self->_primaryListeningModeButton isExpanded]) {
    goto LABEL_25;
  }
LABEL_26:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_primaryListeningModeButton, "setFrame:");
  if (![(MediaControlsExpandableButton *)self->_secondaryListeningModeButton isExpanded]) {
    UIRectInset();
  }
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_secondaryListeningModeButton, "setFrame:");
  if (self->_showSecondaryAssetView)
  {
    if ([(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded]) {
      goto LABEL_39;
    }
    if (self->_showSecondaryAssetView) {
      goto LABEL_38;
    }
  }
  if (self->_showPrimaryListeningModeButton)
  {
    if (!self->_showConversationAwarenessButton) {
      goto LABEL_36;
    }
    if ([(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded])
    {
      if (self->_showPrimaryListeningModeButton) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
LABEL_38:
    UIRectInset();
    goto LABEL_39;
  }
LABEL_35:
  if (!self->_showConversationAwarenessButton) {
    goto LABEL_37;
  }
LABEL_36:
  if (![(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded]) {
    goto LABEL_38;
  }
LABEL_37:
  if (![(MediaControlsExpandableButton *)self->_spatialAudioModeButton isExpanded]) {
    goto LABEL_38;
  }
LABEL_39:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_spatialAudioModeButton, "setFrame:");
  if (self->_showPrimaryListeningModeButton)
  {
    if (!self->_showSpatialAudioModeButton) {
      goto LABEL_43;
    }
    if (![(MediaControlsExpandableButton *)self->_conversationAwarenessButton isExpanded])
    {
      CGFloat v31 = MaxX;
      goto LABEL_51;
    }
    if (self->_showPrimaryListeningModeButton)
    {
LABEL_43:
      if (![(MediaControlsExpandableButton *)self->_conversationAwarenessButton isExpanded])
      {
        CGFloat v31 = MaxX;
        goto LABEL_51;
      }
    }
  }
  if (self->_showSpatialAudioModeButton
    && ![(MediaControlsExpandableButton *)self->_conversationAwarenessButton isExpanded])
  {
    CGFloat v31 = MaxX;
  }
  else
  {
    CGFloat v31 = MaxX;
    if ([(MediaControlsExpandableButton *)self->_conversationAwarenessButton isExpanded]) {
      goto LABEL_52;
    }
  }
LABEL_51:
  UIRectInset();
LABEL_52:
  UIRectIntegralWithScale();
  -[MediaControlsExpandableButton setFrame:](self->_conversationAwarenessButton, "setFrame:");
  -[MRUVolumeNowPlayingView sizeThatFits:](self->_nowPlayingView, "sizeThatFits:", v36, Height);
  v59.origin.CGFloat x = MinX;
  v59.origin.CGFloat y = MinY;
  v59.size.CGFloat width = v36;
  v59.size.CGFloat height = Height;
  CGRectGetMidY(v59);
  UIRectCenteredXInRectScale();
  if (self->_showSecondaryAssetView)
  {
    v60.origin.CGFloat x = v31;
    v60.origin.CGFloat y = v41;
    v60.size.CGFloat width = v36;
    v60.size.CGFloat height = v39;
    CGRectGetMidY(v60);
    UIRectCenteredXInRectScale();
  }
  nowPlayingView = self->_nowPlayingView;

  -[MRUVolumeNowPlayingView setFrame:](nowPlayingView, "setFrame:");
}

- (void)setStylingProvider:(id)a3
{
  uint64_t v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUOutputDeviceAssetView *)self->_primaryAssetView setStylingProvider:v5];
    [(MRUOutputDeviceAssetView *)self->_secondaryAssetView setStylingProvider:v5];
    [(MRUVolumeNowPlayingView *)self->_nowPlayingView setStylingProvider:v5];
    [(MediaControlsExpandableButton *)self->_primaryListeningModeButton setStylingProvider:v5];
    [(MediaControlsExpandableButton *)self->_secondaryListeningModeButton setStylingProvider:v5];
    [(MediaControlsExpandableButton *)self->_spatialAudioModeButton setStylingProvider:v5];
    [(MediaControlsExpandableButton *)self->_conversationAwarenessButton setStylingProvider:v5];
  }
}

- (void)expandButton:(id)a3
{
  double v6 = (MediaControlsExpandableButton *)a3;
  [(MediaControlsExpandableButton *)v6 setExpanded:1];
  p_primaryListeningModeButton = &self->_primaryListeningModeButton;
  primaryListeningModeButton = self->_primaryListeningModeButton;
  if (primaryListeningModeButton == v6)
  {
    primaryListeningModeButton = self->_secondaryListeningModeButton;
    p_primaryListeningModeButton = &self->_secondaryListeningModeButton;
LABEL_6:
    [(MediaControlsExpandableButton *)primaryListeningModeButton setExpanded:0];
    [(MediaControlsExpandableButton *)*p_primaryListeningModeButton setUserInteractionEnabled:0];
    goto LABEL_7;
  }
  if (self->_secondaryListeningModeButton == v6 || self->_spatialAudioModeButton == v6) {
    goto LABEL_6;
  }
LABEL_7:
  [(MRUVolumeBackgroundView *)self updateVisibility];
}

- (void)collapseExpandableButtons
{
  [(MediaControlsExpandableButton *)self->_primaryListeningModeButton setExpanded:0];
  [(MediaControlsExpandableButton *)self->_secondaryListeningModeButton setExpanded:0];
  [(MediaControlsExpandableButton *)self->_spatialAudioModeButton setExpanded:0];
  [(MediaControlsExpandableButton *)self->_conversationAwarenessButton setExpanded:0];
  [(MediaControlsExpandableButton *)self->_primaryListeningModeButton setUserInteractionEnabled:1];
  [(MediaControlsExpandableButton *)self->_secondaryListeningModeButton setUserInteractionEnabled:1];
  [(MediaControlsExpandableButton *)self->_spatialAudioModeButton setUserInteractionEnabled:1];
  [(MediaControlsExpandableButton *)self->_conversationAwarenessButton setUserInteractionEnabled:1];
  [(MRUVolumeBackgroundView *)self updateVisibility];

  [(MRUVolumeBackgroundView *)self setNeedsLayout];
}

- (double)totalHorizontalSliderWidth
{
  if (self->_showSecondaryAssetView)
  {
    if (self->_showSpatialAudioModeButton)
    {
      CCUISliderExpandedContentModuleWidth();
      return v2 + v2;
    }
    goto LABEL_5;
  }
  if (self->_showEnvironmentSlider)
  {
LABEL_5:
    return MRUDefaultExpandedWidth(self);
  }

  CCUISliderExpandedContentModuleWidth();
  return result;
}

- (MRUOutputDeviceAssetView)primaryAssetView
{
  return self->_primaryAssetView;
}

- (void)setPrimaryAssetView:(id)a3
{
}

- (MRUOutputDeviceAssetView)secondaryAssetView
{
  return self->_secondaryAssetView;
}

- (void)setSecondaryAssetView:(id)a3
{
}

- (void)setNowPlayingView:(id)a3
{
}

- (MediaControlsExpandableButton)primaryListeningModeButton
{
  return self->_primaryListeningModeButton;
}

- (void)setPrimaryListeningModeButton:(id)a3
{
}

- (MediaControlsExpandableButton)secondaryListeningModeButton
{
  return self->_secondaryListeningModeButton;
}

- (void)setSecondaryListeningModeButton:(id)a3
{
}

- (void)setSpatialAudioModeButton:(id)a3
{
}

- (MediaControlsExpandableButton)conversationAwarenessButton
{
  return self->_conversationAwarenessButton;
}

- (void)setConversationAwarenessButton:(id)a3
{
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)showSecondaryAssetView
{
  return self->_showSecondaryAssetView;
}

- (BOOL)showPrimaryListeningModeButton
{
  return self->_showPrimaryListeningModeButton;
}

- (BOOL)showNowPlayingView
{
  return self->_showNowPlayingView;
}

- (BOOL)showSecondaryListeningModeButton
{
  return self->_showSecondaryListeningModeButton;
}

- (BOOL)showSpatialAudioModeButton
{
  return self->_showSpatialAudioModeButton;
}

- (BOOL)showConversationAwarenessButton
{
  return self->_showConversationAwarenessButton;
}

- (BOOL)showEnvironmentSlider
{
  return self->_showEnvironmentSlider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_conversationAwarenessButton, 0);
  objc_storeStrong((id *)&self->_spatialAudioModeButton, 0);
  objc_storeStrong((id *)&self->_secondaryListeningModeButton, 0);
  objc_storeStrong((id *)&self->_primaryListeningModeButton, 0);
  objc_storeStrong((id *)&self->_nowPlayingView, 0);
  objc_storeStrong((id *)&self->_secondaryAssetView, 0);

  objc_storeStrong((id *)&self->_primaryAssetView, 0);
}

@end