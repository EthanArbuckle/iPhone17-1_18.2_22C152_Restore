@interface MPVolumeView
- (BOOL)areWirelessRoutesAvailable;
- (BOOL)hidesRouteLabelWhenNoRouteChoice;
- (BOOL)isShowingRouteButton;
- (BOOL)isVisible;
- (BOOL)isWirelessRouteActive;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showsRouteButton;
- (BOOL)showsVolumeSlider;
- (BOOL)volumeSliderShrinksFromBothEnds;
- (CGRect)routeButtonRectForBounds:(CGRect)bounds;
- (CGRect)volumeSliderRectForBounds:(CGRect)bounds;
- (CGRect)volumeThumbRectForBounds:(CGRect)bounds volumeSliderRect:(CGRect)rect value:(float)value;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPVolumeSlider)volumeSlider;
- (MPVolumeView)initWithCoder:(id)a3;
- (MPVolumeView)initWithFrame:(CGRect)a3;
- (MPVolumeView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (UIImage)maximumVolumeSliderImageForState:(UIControlState)state;
- (UIImage)minimumVolumeSliderImageForState:(UIControlState)state;
- (UIImage)routeButtonImageForState:(UIControlState)state;
- (UIImage)volumeThumbImageForState:(UIControlState)state;
- (UIImage)volumeWarningSliderImage;
- (id)_defaultRouteButtonImageAsSelected:(BOOL)a3;
- (id)_routeButton;
- (int64_t)style;
- (void)_applicationDidEnterBackgroundNotification:(id)a3;
- (void)_applicationWillEnterForegroundNotification:(id)a3;
- (void)_createSubviews;
- (void)_displayAudioRoutePicker;
- (void)_getDefaultVolumeSliderFrame:(CGRect *)a3 routeButtonFrame:(CGRect *)a4 forBounds:(CGRect)a5;
- (void)_initWithStyle:(int64_t)a3;
- (void)_loadAudioRoutePickerIfNeeded;
- (void)_setRouteDiscoveryEnabled:(BOOL)a3;
- (void)_setShowsRouteButton:(BOOL)a3 animated:(BOOL)a4;
- (void)_setShowsVolumeSlider:(BOOL)a3;
- (void)_startPrewarmingAudioRoutePicker;
- (void)_stopPrewarmingAudioRoutePicker;
- (void)_updateWirelessRouteStatus;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)lightweightRoutingController:(id)a3 didChangeDevicePresenceDetected:(BOOL)a4;
- (void)lightweightRoutingController:(id)a3 didChangePickedRoutes:(id)a4;
- (void)setAlpha:(double)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidesRouteLabelWhenNoRouteChoice:(BOOL)a3;
- (void)setMaximumVolumeSliderImage:(UIImage *)image forState:(UIControlState)state;
- (void)setMinimumVolumeSliderImage:(UIImage *)image forState:(UIControlState)state;
- (void)setRouteButtonImage:(UIImage *)image forState:(UIControlState)state;
- (void)setShowsRouteButton:(BOOL)showsRouteButton;
- (void)setShowsVolumeSlider:(BOOL)showsVolumeSlider;
- (void)setVolumeSliderShrinksFromBothEnds:(BOOL)a3;
- (void)setVolumeThumbImage:(UIImage *)image forState:(UIControlState)state;
- (void)setVolumeWarningSliderImage:(UIImage *)volumeWarningSliderImage;
@end

@implementation MPVolumeView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeWarningSliderImage, 0);
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_routeLabel, 0);
  objc_storeStrong((id *)&self->_routeButton, 0);

  objc_storeStrong((id *)&self->_lightweightRoutingController, 0);
}

- (void)setVolumeWarningSliderImage:(UIImage *)volumeWarningSliderImage
{
}

- (UIImage)volumeWarningSliderImage
{
  return self->_volumeWarningSliderImage;
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  v4 = [(MPVolumeView *)self window];

  if (v4)
  {
    [(MPVolumeView *)self _setRouteDiscoveryEnabled:1];
  }
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
}

- (void)_updateWirelessRouteStatus
{
  BOOL v3 = [(MPAVLightweightRoutingController *)self->_lightweightRoutingController isDevicePresenceDetected];
  v4 = [(MPAVLightweightRoutingController *)self->_lightweightRoutingController pickedRoutes];
  v5 = [v4 firstObject];

  if (v5) {
    BOOL v6 = [v5 pickableRouteType] == 1;
  }
  else {
    BOOL v6 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MPVolumeView__updateWirelessRouteStatus__block_invoke;
  v7[3] = &unk_1E57EEE80;
  v7[4] = self;
  BOOL v8 = v3;
  BOOL v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __42__MPVolumeView__updateWirelessRouteStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v2 + 482) != v3)
  {
    *(unsigned char *)(v2 + 482) = v3;
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"MPVolumeViewWirelessRoutesAvailableDidChangeNotification" object:*(void *)(a1 + 32)];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  int v5 = *(unsigned __int8 *)(a1 + 41);
  if (*(unsigned __int8 *)(v2 + 481) != v5)
  {
    *(unsigned char *)(v2 + 481) = v5;
    [*(id *)(*(void *)(a1 + 32) + 424) setSelected:*(unsigned __int8 *)(a1 + 41)];
    [*(id *)(a1 + 32) setNeedsLayout];
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"MPVolumeViewWirelessRouteActiveDidChangeNotification" object:*(void *)(a1 + 32)];
  }
}

- (void)_setRouteDiscoveryEnabled:(BOOL)a3
{
  if (self->_routeDiscoveryEnabled != a3)
  {
    self->_routeDiscoveryEnabled = a3;
    BOOL pushedRouteDiscoveryModeState = self->_pushedRouteDiscoveryModeState;
    if (a3)
    {
      BOOL v5 = 1;
      [(MPAVLightweightRoutingController *)self->_lightweightRoutingController setDiscoveryMode:1];
      if (pushedRouteDiscoveryModeState) {
        return;
      }
    }
    else
    {
      if (!self->_pushedRouteDiscoveryModeState) {
        return;
      }
      [(MPAVLightweightRoutingController *)self->_lightweightRoutingController setDiscoveryMode:0];
      BOOL v5 = 0;
    }
    self->_BOOL pushedRouteDiscoveryModeState = v5;
  }
}

- (void)_setShowsVolumeSlider:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MPVolumeView *)self isVisible];
  if ([(MPAVLightweightRoutingController *)self->_lightweightRoutingController isDevicePresenceDetected])
  {
    id v6 = [(MPAVLightweightRoutingController *)self->_lightweightRoutingController pickedRoutes];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  char v8 = !self->_showsVolumeSlider || v3;
  if (self->_style || (v8 & 1) != 0 || v7)
  {
    if (v8) {
      goto LABEL_11;
    }
  }
  else if (self->_hidesRouteLabelWhenNoRouteChoice)
  {
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_17;
  }
  if (v7)
  {
    v10 = [(MPAVLightweightRoutingController *)self->_lightweightRoutingController pickedRoutes];
    v11 = [v10 firstObject];
    v12 = [v11 routeName];

    [(UILabel *)self->_routeLabel setText:v12];
  }
  else
  {
    routeLabel = self->_routeLabel;
    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
    v14 = [v12 localizedStringForKey:@"NO_VOLUME_AVAILABLE" value:&stru_1EE680640 table:@"MediaPlayer"];
    [(UILabel *)routeLabel setText:v14];
  }
  BOOL v9 = 1;
LABEL_17:
  v15 = [(MPVolumeSlider *)self->_volumeSlider superview];

  if (v3)
  {
    if (!v15) {
      [(MPVolumeView *)self addSubview:self->_volumeSlider];
    }
  }
  else if (v15)
  {
    [(MPVolumeSlider *)self->_volumeSlider removeFromSuperview];
  }
  v16 = self->_routeLabel;
  if (v9)
  {
    if (!v16) {
      [(MPVolumeView *)self addSubview:0];
    }
  }
  else
  {
    v17 = [(UILabel *)v16 superview];

    if (v17) {
      [(UILabel *)self->_routeLabel removeFromSuperview];
    }
  }
  self->_showingSlider = v3;
  self->_showingLabel = v9;
  if (v5 != [(MPVolumeView *)self isVisible])
  {
    id v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 postNotificationName:@"MPVolumeViewVisibilityChangedNotification" object:self];
  }
}

- (void)_setShowsRouteButton:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(MPVolumeView *)self isVisible];
  BOOL showingButton = self->_showingButton;
  self->_BOOL showingButton = a3;
  [(MPVolumeView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  -[MPVolumeView volumeSliderRectForBounds:](self, "volumeSliderRectForBounds:");
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  routeLabel = self->_routeLabel;
  -[MPVolumeView volumeSliderRectForBounds:](self, "volumeSliderRectForBounds:", v10, v12, v14, v16);
  -[UILabel setFrame:](routeLabel, "setFrame:");
  routeButton = self->_routeButton;
  -[MPVolumeView routeButtonRectForBounds:](self, "routeButtonRectForBounds:", v10, v12, v14, v16);
  -[UIButton setFrame:](routeButton, "setFrame:");
  double v27 = 0.3;
  uint64_t v31 = 3221225472;
  uint64_t v30 = MEMORY[0x1E4F143A8];
  v32 = __46__MPVolumeView__setShowsRouteButton_animated___block_invoke;
  v33 = &unk_1E57EEE58;
  if (!v4) {
    double v27 = 0.0;
  }
  BOOL v39 = v4;
  v34 = self;
  BOOL v40 = a3;
  uint64_t v35 = v18;
  uint64_t v36 = v20;
  uint64_t v37 = v22;
  uint64_t v38 = v24;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:delay:options:animations:completion:", 4, &v30, 0, v27);
  if (v7 != [(MPVolumeView *)self isVisible])
  {
    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 postNotificationName:@"MPVolumeViewVisibilityChangedNotification" object:self];
  }
  if (showingButton != [(MPVolumeView *)self isShowingRouteButton])
  {
    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 postNotificationName:@"MPVolumeViewRouteButtonChangedNotification" object:self];
  }
}

uint64_t __46__MPVolumeView__setShowsRouteButton_animated___block_invoke(uint64_t a1)
{
  double v2 = 0.2;
  if (!*(unsigned char *)(a1 + 72)) {
    double v2 = 0.0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MPVolumeView__setShowsRouteButton_animated___block_invoke_2;
  v4[3] = &unk_1E57F9E08;
  v4[4] = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 73);
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:v2];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 472), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return [*(id *)(*(void *)(a1 + 32) + 472) layoutBelowIfNeeded];
}

uint64_t __46__MPVolumeView__setShowsRouteButton_animated___block_invoke_2(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:v1];
}

- (void)_getDefaultVolumeSliderFrame:(CGRect *)a3 routeButtonFrame:(CGRect *)a4 forBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  [(UIButton *)self->_routeButton frame];
  CGFloat v11 = v9;
  CGFloat v12 = v10;
  BOOL showingSlider = self->_showingSlider;
  if (self->_showingSlider)
  {
    double v14 = 2.0;
    if (!self->_volumeSliderShrinksFromBothEnds) {
      double v14 = 1.0;
    }
    double v15 = width - (v9 + 7.0) * v14;
    if (self->_showingButton) {
      double v16 = v15;
    }
    else {
      double v16 = width;
    }
    if (!self->_showingButton || !self->_volumeSliderShrinksFromBothEnds) {
      double v18 = 0.0;
    }
    else {
      double v18 = v9 + 7.0;
    }
    float v19 = (v10 + -28.0) * 0.5;
    double v20 = rintf(v19);
    CGFloat v21 = 28.0;
  }
  else
  {
    double v18 = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  if (self->_style) {
    double v22 = 0.0;
  }
  else {
    double v22 = 2.0;
  }
  if (self->_hasNonDefaultRouteButtonImages)
  {
    [(UIButton *)self->_routeButton frame];
    float v23 = (height - CGRectGetHeight(v28)) * 0.5;
    double v22 = floorf(v23);
    BOOL showingSlider = self->_showingSlider;
  }
  if (showingSlider)
  {
    v29.origin.x = v18;
    v29.origin.y = v20;
    v29.size.double width = v16;
    v29.size.double height = v21;
    double v24 = CGRectGetMaxX(v29) + 7.0;
    if (!a3) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  UIRoundToViewScale();
  double v24 = v25;
  UIRoundToViewScale();
  double v22 = v26;
  if (a3)
  {
LABEL_22:
    a3->origin.x = v18;
    a3->origin.y = v20;
    a3->size.double width = v16;
    a3->size.double height = v21;
  }
LABEL_23:
  if (a4)
  {
    a4->origin.x = v24;
    a4->origin.y = v22;
    a4->size.double width = v11;
    a4->size.double height = v12;
  }
}

- (void)_stopPrewarmingAudioRoutePicker
{
}

- (void)_startPrewarmingAudioRoutePicker
{
  [(MPVolumeView *)self _loadAudioRoutePickerIfNeeded];
  mediaControls = self->_mediaControls;

  [(MPMediaControls *)mediaControls startPrewarming];
}

- (void)_displayAudioRoutePicker
{
  [(MPVolumeView *)self _loadAudioRoutePickerIfNeeded];
  [(MPMediaControls *)self->_mediaControls present];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MPVolumeViewRoutePickerPresentedNotification" object:self];
}

- (void)_loadAudioRoutePickerIfNeeded
{
  if (self->_mediaControls
    || ([(MPVolumeView *)self window], BOOL v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    id v3 = [(MPVolumeView *)self window];

    if (v3) {
      return;
    }
    char v5 = 0;
  }
  else
  {
    char v5 = objc_alloc_init(MPMediaControls);
  }
  mediaControls = self->_mediaControls;
  self->_mediaControls = v5;
}

- (id)_defaultRouteButtonImageAsSelected:(BOOL)a3
{
  id v3 = @"airplay";
  if (a3) {
    id v3 = @"airplay_on";
  }
  BOOL v4 = (void *)MEMORY[0x1E4FB1818];
  char v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = v3;
  BOOL v7 = [v5 mediaPlayerBundle];
  char v8 = [v4 imageNamed:v6 inBundle:v7];

  return v8;
}

- (void)_createSubviews
{
  [(MPVolumeView *)self setOpaque:0];
  [(MPVolumeView *)self setClipsToBounds:0];
  id v3 = [MPVolumeSlider alloc];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v20 = -[MPVolumeSlider initWithFrame:style:](v3, "initWithFrame:style:", self->_style, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  objc_storeStrong((id *)&self->_volumeSlider, v20);
  [(MPVolumeSlider *)v20 setAutoresizingMask:34];
  [(MPVolumeView *)self addSubview:v20];
  char v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v4, v5, v6, v7);
  objc_storeStrong((id *)&self->_routeLabel, v8);
  [v8 setAutoresizingMask:34];
  double v9 = [MEMORY[0x1E4FB1798] boldSystemFontOfSize:13.0];
  [v8 setFont:v9];

  [v8 setTextAlignment:1];
  [v8 setBackgroundColor:0];
  double v10 = [MEMORY[0x1E4FB1618] whiteColor];
  [v8 setTextColor:v10];

  [v8 setOpaque:0];
  [(MPVolumeView *)self addSubview:v8];
  CGFloat v11 = +[MPButton easyTouchButtonWithType:0];
  routeButton = self->_routeButton;
  self->_routeButton = v11;

  [(UIButton *)self->_routeButton setSelected:0];
  [(UIButton *)self->_routeButton setAlpha:0.0];
  double v13 = [(MPVolumeView *)self _defaultRouteButtonImageAsSelected:0];
  if (self->_style == 1)
  {
    double v14 = [MEMORY[0x1E4FB1618] systemBlueColor];
    uint64_t v15 = [v13 _flatImageWithColor:v14];

    double v13 = (void *)v15;
  }
  [(UIButton *)self->_routeButton setImage:v13 forState:0];
  double v16 = self->_routeButton;
  uint64_t v17 = [(MPVolumeView *)self _defaultRouteButtonImageAsSelected:1];
  [(UIButton *)v16 setImage:v17 forState:4];

  [(UIButton *)self->_routeButton setShowsTouchWhenHighlighted:1];
  [(UIButton *)self->_routeButton setAutoresizingMask:33];
  [v13 size];
  -[UIButton setFrame:](self->_routeButton, "setFrame:", v4, v5, v18, v19);
  [(UIButton *)self->_routeButton addTarget:self action:sel__displayAudioRoutePicker forControlEvents:64];
  [(UIButton *)self->_routeButton addTarget:self action:sel__startPrewarmingAudioRoutePicker forControlEvents:1];
  [(UIButton *)self->_routeButton addTarget:self action:sel__stopPrewarmingAudioRoutePicker forControlEvents:128];
  [(MPVolumeView *)self addSubview:self->_routeButton];
}

- (id)_routeButton
{
  return self->_routeButton;
}

- (BOOL)isShowingRouteButton
{
  return self->_showingButton;
}

- (BOOL)isVisible
{
  return self->_showingButton || self->_showingSlider || self->_showingLabel;
}

- (void)setVolumeSliderShrinksFromBothEnds:(BOOL)a3
{
  if (self->_volumeSliderShrinksFromBothEnds != a3)
  {
    self->_volumeSliderShrinksFromBothEnds = a3;
    [(MPVolumeView *)self setNeedsLayout];
  }
}

- (void)setHidesRouteLabelWhenNoRouteChoice:(BOOL)a3
{
  if (self->_hidesRouteLabelWhenNoRouteChoice != a3)
  {
    self->_hidesRouteLabelWhenNoRouteChoice = a3;
    [(MPVolumeView *)self setNeedsLayout];
  }
}

- (BOOL)volumeSliderShrinksFromBothEnds
{
  return self->_volumeSliderShrinksFromBothEnds;
}

- (BOOL)hidesRouteLabelWhenNoRouteChoice
{
  return self->_hidesRouteLabelWhenNoRouteChoice;
}

- (MPVolumeSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (int64_t)style
{
  return self->_style;
}

- (CGRect)volumeThumbRectForBounds:(CGRect)bounds volumeSliderRect:(CGRect)rect value:(float)value
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  double y = bounds.origin.y;
  double x = bounds.origin.x;
  volumeSlider = self->_volumeSlider;
  -[MPVolumeView convertRect:toView:](self, "convertRect:toView:", volumeSlider, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  *(float *)&uint64_t v20 = value;
  -[MPVolumeSlider thumbRectForBounds:trackRect:value:](volumeSlider, "thumbRectForBounds:trackRect:value:", x, y, width, height, v11, v12, v13, v14, v20);
  uint64_t v15 = self->_volumeSlider;

  -[MPVolumeView convertRect:fromView:](self, "convertRect:fromView:", v15);
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (UIImage)volumeThumbImageForState:(UIControlState)state
{
  return (UIImage *)[(MPVolumeSlider *)self->_volumeSlider thumbImageForState:state];
}

- (CGRect)volumeSliderRectForBounds:(CGRect)bounds
{
  long long v7 = 0u;
  long long v8 = 0u;
  -[MPVolumeView _getDefaultVolumeSliderFrame:routeButtonFrame:forBounds:](self, "_getDefaultVolumeSliderFrame:routeButtonFrame:forBounds:", &v7, 0, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  double v4 = *((double *)&v7 + 1);
  double v3 = *(double *)&v7;
  double v6 = *((double *)&v8 + 1);
  double v5 = *(double *)&v8;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)showsVolumeSlider
{
  return self->_showsVolumeSlider;
}

- (BOOL)showsRouteButton
{
  return self->_showsRouteButton;
}

- (void)setVolumeThumbImage:(UIImage *)image forState:(UIControlState)state
{
}

- (void)setShowsVolumeSlider:(BOOL)showsVolumeSlider
{
  if (self->_showsVolumeSlider != showsVolumeSlider)
  {
    self->_showsVolumeSlider = showsVolumeSlider;
    [(MPVolumeView *)self setNeedsLayout];
  }
}

- (void)setShowsRouteButton:(BOOL)showsRouteButton
{
  if (self->_showsRouteButton != showsRouteButton)
  {
    self->_showsRouteButton = showsRouteButton;
    [(MPVolumeView *)self setNeedsLayout];
  }
}

- (void)setRouteButtonImage:(UIImage *)image forState:(UIControlState)state
{
  double v6 = image;
  long long v8 = v6;
  if (!self->_hasNonDefaultRouteButtonImages)
  {
    [(UIButton *)self->_routeButton setImage:0 forState:0];
    [(UIButton *)self->_routeButton setImage:0 forState:4];
    double v6 = v8;
    self->_hasNonDefaultRouteButtonImages = 1;
  }
  [(UIButton *)self->_routeButton setImage:v6 forState:state];
  [(UIButton *)self->_routeButton sizeToFit];
  [(UIButton *)self->_routeButton _setChargeEnabled:1];
  LODWORD(v7) = -1102263091;
  [(UIButton *)self->_routeButton setCharge:v7];
  [(MPVolumeView *)self setNeedsLayout];
}

- (void)setMaximumVolumeSliderImage:(UIImage *)image forState:(UIControlState)state
{
  if (!self->_hasNonDefaultMaxVolumeSliderImage) {
    self->_hasNonDefaultMaxVolumeSliderImage = 1;
  }
  [(MPVolumeSlider *)self->_volumeSlider setMaximumTrackImage:image forState:state];
}

- (void)setMinimumVolumeSliderImage:(UIImage *)image forState:(UIControlState)state
{
  if (!self->_hasNonDefaultMinVolumeSliderImage) {
    self->_hasNonDefaultMinVolumeSliderImage = 1;
  }
  [(MPVolumeSlider *)self->_volumeSlider setMinimumTrackImage:image forState:state];
}

- (CGRect)routeButtonRectForBounds:(CGRect)bounds
{
  long long v7 = 0u;
  long long v8 = 0u;
  -[MPVolumeView _getDefaultVolumeSliderFrame:routeButtonFrame:forBounds:](self, "_getDefaultVolumeSliderFrame:routeButtonFrame:forBounds:", 0, &v7, bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  double v4 = *((double *)&v7 + 1);
  double v3 = *(double *)&v7;
  double v6 = *((double *)&v8 + 1);
  double v5 = *(double *)&v8;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (UIImage)routeButtonImageForState:(UIControlState)state
{
  if (self->_hasNonDefaultRouteButtonImages)
  {
    double v3 = [(UIButton *)self->_routeButton imageForState:state];
  }
  else
  {
    double v3 = 0;
  }

  return (UIImage *)v3;
}

- (UIImage)maximumVolumeSliderImageForState:(UIControlState)state
{
  if (self->_hasNonDefaultMaxVolumeSliderImage)
  {
    double v3 = [(MPVolumeSlider *)self->_volumeSlider maximumTrackImageForState:state];
  }
  else
  {
    double v3 = 0;
  }

  return (UIImage *)v3;
}

- (UIImage)minimumVolumeSliderImageForState:(UIControlState)state
{
  if (self->_hasNonDefaultMinVolumeSliderImage)
  {
    double v3 = [(MPVolumeSlider *)self->_volumeSlider minimumTrackImageForState:state];
  }
  else
  {
    double v3 = 0;
  }

  return (UIImage *)v3;
}

- (BOOL)areWirelessRoutesAvailable
{
  return self->_wirelessRoutesAvailable;
}

- (BOOL)isWirelessRouteActive
{
  double v2 = [(MPAVLightweightRoutingController *)self->_lightweightRoutingController pickedRoutes];
  double v3 = [v2 firstObject];

  if (v3) {
    BOOL v4 = [v3 pickableRouteType] == 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)lightweightRoutingController:(id)a3 didChangePickedRoutes:(id)a4
{
  double v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MPVolumeView_lightweightRoutingController_didChangePickedRoutes___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __67__MPVolumeView_lightweightRoutingController_didChangePickedRoutes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWirelessRouteStatus];
}

- (void)lightweightRoutingController:(id)a3 didChangeDevicePresenceDetected:(BOOL)a4
{
  BOOL v5 = self->_showsRouteButton && a4;
  [(MPVolumeView *)self _setShowsRouteButton:v5 animated:1];
  double v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MPVolumeView_lightweightRoutingController_didChangeDevicePresenceDetected___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(v6, block);
}

uint64_t __77__MPVolumeView_lightweightRoutingController_didChangeDevicePresenceDetected___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWirelessRouteStatus];
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPVolumeView;
  [(MPVolumeView *)&v4 setHidden:a3];
  double v3 = +[MPVolumeHUDController sharedInstance];
  [v3 setNeedsUpdate];
}

- (void)setAlpha:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPVolumeView;
  [(MPVolumeView *)&v4 setAlpha:a3];
  double v3 = +[MPVolumeHUDController sharedInstance];
  [v3 setNeedsUpdate];
}

- (void)didMoveToWindow
{
  v10.receiver = self;
  v10.super_class = (Class)MPVolumeView;
  [(MPVolumeView *)&v10 didMoveToWindow];
  double v3 = +[MPVolumeHUDController sharedInstance];
  [v3 setNeedsUpdate];

  if (!self->_routeDiscoveryEnabled)
  {
    uint64_t v6 = [(MPVolumeView *)self window];
    if (v6)
    {
      long long v7 = (void *)v6;
      long long v8 = MPUIApplication();
      uint64_t v9 = [v8 applicationState];

      if (v9 != 2)
      {
        uint64_t v5 = 1;
        goto LABEL_9;
      }
    }
    if (!self->_routeDiscoveryEnabled) {
      goto LABEL_10;
    }
  }
  objc_super v4 = [(MPVolumeView *)self window];

  if (!v4)
  {
    uint64_t v5 = 0;
LABEL_9:
    [(MPVolumeView *)self _setRouteDiscoveryEnabled:v5];
  }
LABEL_10:
  [(MPVolumeView *)self _loadAudioRoutePickerIfNeeded];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)MPVolumeView;
  [(MPVolumeView *)&v3 didMoveToSuperview];
  double v2 = +[MPVolumeHUDController sharedInstance];
  [v2 setNeedsUpdate];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[MPVolumeSlider sizeThatFits:](self->_volumeSlider, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v7 = v6;
  -[MPVolumeSlider sizeThatFits:](self->_volumeSlider, "sizeThatFits:", width, height);
  double v9 = v8;
  double v11 = v10;
  [(UIButton *)self->_routeButton frame];
  double v14 = v7 + 14.0 + v13;
  if (v9 >= v14) {
    double v14 = v9;
  }
  double v15 = v12 + 4.0;
  if (v11 >= v12 + 4.0) {
    double v15 = v11;
  }
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  routeButton = self->_routeButton;
  if (routeButton
    && (-[UIButton convertPoint:fromView:](self->_routeButton, "convertPoint:fromView:", self, x, y),
        (-[UIButton pointInside:withEvent:](routeButton, "pointInside:withEvent:", v7) & 1) != 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MPVolumeView;
    BOOL v9 = -[MPVolumeView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  }

  return v9;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MPVolumeView;
  [(MPVolumeView *)&v6 layoutSubviews];
  BOOL v3 = self->_showsRouteButton
    && [(MPAVLightweightRoutingController *)self->_lightweightRoutingController isDevicePresenceDetected];
  if (self->_showsVolumeSlider)
  {
    objc_super v4 = [(MPVolumeSlider *)self->_volumeSlider volumeController];
    uint64_t v5 = [v4 isVolumeControlAvailable];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(MPVolumeView *)self _setShowsVolumeSlider:v5];
  [(MPVolumeView *)self _setShowsRouteButton:v3 animated:0];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v5.receiver = self;
    v5.super_class = (Class)MPVolumeView;
    [(MPVolumeView *)&v5 encodeWithCoder:v4];
    [v4 encodeBool:self->_showsVolumeSlider forKey:@"MPVolumeViewShowsVolumeSlider"];
    [v4 encodeBool:self->_showsRouteButton forKey:@"MPVolumeViewShowsRouteButton"];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498] format:@"only keyed archiving is supported"];
  }
}

- (MPVolumeView)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v9.receiver = self;
    v9.super_class = (Class)MPVolumeView;
    objc_super v5 = [(MPVolumeView *)&v9 initWithCoder:v4];
    objc_super v6 = v5;
    if (v5)
    {
      [(MPVolumeView *)v5 _initWithStyle:0];
      if ([v4 containsValueForKey:@"MPVolumeViewShowsVolumeSlider"]) {
        v6->_showsVolumeSlider = [v4 decodeBoolForKey:@"MPVolumeViewShowsVolumeSlider"];
      }
      if ([v4 containsValueForKey:@"MPVolumeViewShowsRouteButton"]) {
        v6->_showsRouteButton = [v4 decodeBoolForKey:@"MPVolumeViewShowsRouteButton"];
      }
      [(MPVolumeView *)v6 setNeedsLayout];
    }
    self = v6;
    id v7 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498] format:@"only keyed archiving is supported"];
    id v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(MPAVLightweightRoutingController *)self->_lightweightRoutingController setDelegate:0];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];
  [v3 removeObserver:self name:@"MPVolumeSliderVolumeControlAvailabilityDidChangeNotification" object:self->_volumeSlider];

  v4.receiver = self;
  v4.super_class = (Class)MPVolumeView;
  [(MPVolumeView *)&v4 dealloc];
}

- (MPVolumeView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MPVolumeView;
  objc_super v5 = -[MPVolumeView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v6 = v5;
  if (v5) {
    [(MPVolumeView *)v5 _initWithStyle:a4];
  }
  return v6;
}

- (MPVolumeView)initWithFrame:(CGRect)a3
{
  return -[MPVolumeView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_initWithStyle:(int64_t)a3
{
  self->_style = a3;
  self->_showsVolumeSlider = 1;
  self->_showsRouteButton = dyld_program_sdk_at_least() ^ 1;
  objc_super v4 = [MPAVLightweightRoutingController alloc];
  objc_super v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  id v7 = [(MPAVLightweightRoutingController *)v4 initWithName:v6];
  lightweightRoutingController = self->_lightweightRoutingController;
  self->_lightweightRoutingController = v7;

  [(MPAVLightweightRoutingController *)self->_lightweightRoutingController setDelegate:self];
  [(MPVolumeView *)self _createSubviews];
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__applicationDidEnterBackgroundNotification_ name:*MEMORY[0x1E4FB2640] object:0];
  [v9 addObserver:self selector:sel__applicationWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB2730] object:0];
  [v9 addObserver:self selector:sel__volumeSliderVolumeControlAvailabilityDidChangeNotification_ name:@"MPVolumeSliderVolumeControlAvailabilityDidChangeNotification" object:self->_volumeSlider];
}

@end