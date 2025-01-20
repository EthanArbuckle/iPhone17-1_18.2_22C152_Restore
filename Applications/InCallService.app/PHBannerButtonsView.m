@interface PHBannerButtonsView
- (PHBannerButtonsView)initWithState:(unint64_t)a3;
- (PHBannerButtonsViewDelegate)delegate;
- (PHBottomBarButton)leftButton;
- (PHBottomBarButton)rightButton;
- (UIVisualEffectView)audioRouteVibrancyView;
- (double)intrinsicWidth;
- (id)audioRouteButtonImageColor;
- (id)buttonConfigurationWithActionType:(int64_t)a3;
- (id)buttonWithActionType:(int64_t)a3;
- (unint64_t)state;
- (void)buttonPressed:(id)a3;
- (void)layoutSubviews;
- (void)routesChangedForRouteController:(id)a3;
- (void)setAudioRouteButtonSelected:(BOOL)a3;
- (void)setAudioRouteVibrancyView:(id)a3;
- (void)setBannerButtonsForIncomingAudioCallIfNecessary;
- (void)setBannerButtonsForIncomingVideoCallIfNecessary;
- (void)setDelegate:(id)a3;
- (void)setLeftButton:(id)a3;
- (void)setRightButton:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)transitionFromIncomingCallToOngoingCallState;
- (void)transitionLeftButtonFromIncomingToOngoingCallState;
- (void)transitionRightButtonFromIncomingToOngoingCallState;
- (void)updateAudioRouteButtonBackgroundColor;
- (void)updateAudioRouteButtonImage;
- (void)updateAudioRouteButtonImageColor;
- (void)updateConstraintsForState:(unint64_t)a3;
- (void)updateLayoutForState:(unint64_t)a3;
@end

@implementation PHBannerButtonsView

- (PHBannerButtonsView)initWithState:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PHBannerButtonsView;
  v4 = [(PHBannerButtonsView *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_state = a3;
    v6 = +[TUCallCenter sharedInstance];
    v7 = [v6 routeController];
    [v7 addDelegate:v5];

    [(PHBannerButtonsView *)v5 updateLayoutForState:v5->_state];
  }
  return v5;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PHBannerButtonsView;
  [(PHBannerButtonsView *)&v14 layoutSubviews];
  v3 = [(PHBannerButtonsView *)self audioRouteVibrancyView];

  if (v3)
  {
    v4 = [(PHBannerButtonsView *)self leftButton];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(PHBannerButtonsView *)self audioRouteVibrancyView];
    [v13 setFrame:v6, v8, v10, v12];
  }
}

- (void)setState:(unint64_t)a3
{
  double v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218240;
    unint64_t v7 = a3;
    __int16 v8 = 2048;
    unint64_t v9 = [(PHBannerButtonsView *)self state];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Banner button state updated to %ld (existing state is %ld)", (uint8_t *)&v6, 0x16u);
  }

  if (self->_state != a3)
  {
    self->_state = a3;
    [(PHBannerButtonsView *)self updateLayoutForState:a3];
  }
}

- (void)setAudioRouteButtonSelected:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(PHBannerButtonsView *)self leftButton];
    v11[0] = 67109376;
    v11[1] = v3;
    __int16 v12 = 1024;
    unsigned int v13 = [v6 isSelected];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Left button selected state updated to %d (existing state is %d)", (uint8_t *)v11, 0xEu);
  }
  unint64_t v7 = [(PHBannerButtonsView *)self leftButton];
  if ([v7 action] == (id)22)
  {
    __int16 v8 = [(PHBannerButtonsView *)self leftButton];
    unsigned int v9 = [v8 isSelected];

    if (v9 != v3)
    {
      double v10 = [(PHBannerButtonsView *)self leftButton];
      [v10 setSelected:v3];

      [(PHBannerButtonsView *)self updateAudioRouteButtonBackgroundColor];
      [(PHBannerButtonsView *)self updateAudioRouteButtonImageColor];
    }
  }
  else
  {
  }
}

- (void)updateLayoutForState:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      [(PHBannerButtonsView *)self setBannerButtonsForIncomingVideoCallIfNecessary];
      break;
    case 1uLL:
      [(PHBannerButtonsView *)self setBannerButtonsForIncomingAudioCallIfNecessary];
      double v5 = +[TUCallCenter sharedInstance];
      id v6 = [v5 bottomBarCallState];

      if (v6 == (id)2) {
        [(PHBannerButtonsView *)self transitionFromIncomingCallToOngoingCallState];
      }
      break;
    case 0uLL:
      [(PHBannerButtonsView *)self setBannerButtonsForIncomingAudioCallIfNecessary];
      break;
  }
  unint64_t v7 = [(PHBannerButtonsView *)self leftButton];
  __int16 v8 = [v7 superview];

  if (!v8)
  {
    unsigned int v9 = [(PHBannerButtonsView *)self leftButton];
    [(PHBannerButtonsView *)self addSubview:v9];
  }
  double v10 = [(PHBannerButtonsView *)self rightButton];
  double v11 = [v10 superview];

  if (!v11)
  {
    __int16 v12 = [(PHBannerButtonsView *)self rightButton];
    [(PHBannerButtonsView *)self addSubview:v12];
  }

  [(PHBannerButtonsView *)self updateConstraintsForState:a3];
}

- (void)setBannerButtonsForIncomingAudioCallIfNecessary
{
  BOOL v3 = [(PHBannerButtonsView *)self leftButton];

  if (!v3)
  {
    v4 = [(PHBannerButtonsView *)self buttonWithActionType:7];
    [(PHBannerButtonsView *)self setLeftButton:v4];
  }
  double v5 = [(PHBannerButtonsView *)self rightButton];

  if (!v5)
  {
    id v6 = +[TUCallCenter sharedInstance];
    id v9 = [v6 frontmostCall];

    if ([v9 isRTT])
    {
      uint64_t v7 = 2;
    }
    else if ([v9 isTTY])
    {
      uint64_t v7 = 2;
    }
    else
    {
      uint64_t v7 = 1;
    }
    __int16 v8 = [(PHBannerButtonsView *)self buttonWithActionType:v7];
    [(PHBannerButtonsView *)self setRightButton:v8];
  }
}

- (void)setBannerButtonsForIncomingVideoCallIfNecessary
{
  BOOL v3 = [(PHBannerButtonsView *)self leftButton];

  if (!v3)
  {
    v4 = [(PHBannerButtonsView *)self buttonWithActionType:8];
    [(PHBannerButtonsView *)self setLeftButton:v4];
  }
  double v5 = [(PHBannerButtonsView *)self rightButton];

  if (!v5)
  {
    id v6 = [(PHBannerButtonsView *)self buttonWithActionType:3];
    [(PHBannerButtonsView *)self setRightButton:v6];
  }
}

- (void)updateConstraintsForState:(unint64_t)a3
{
  uint64_t v4 = [(PHBannerButtonsView *)self leftButton];
  if (v4)
  {
    double v5 = (void *)v4;
    id v6 = [(PHBannerButtonsView *)self rightButton];

    if (v6)
    {
      v36 = [(PHBannerButtonsView *)self leftButton];
      v35 = [v36 leadingAnchor];
      v34 = [(PHBannerButtonsView *)self leadingAnchor];
      v33 = [v35 constraintEqualToAnchor:v34];
      v37[0] = v33;
      v32 = [(PHBannerButtonsView *)self rightButton];
      v30 = [v32 leadingAnchor];
      v31 = [(PHBannerButtonsView *)self leftButton];
      v29 = [v31 trailingAnchor];
      [(PHBannerButtonsView *)self directionalLayoutMargins];
      v28 = [v30 constraintEqualToAnchor:v29 constant:v7 + v7];
      v37[1] = v28;
      v27 = [(PHBannerButtonsView *)self rightButton];
      v26 = [v27 trailingAnchor];
      v25 = [(PHBannerButtonsView *)self trailingAnchor];
      v24 = [v26 constraintEqualToAnchor:v25];
      v37[2] = v24;
      v23 = [(PHBannerButtonsView *)self leftButton];
      v21 = [v23 centerYAnchor];
      v22 = [(PHBannerButtonsView *)self rightButton];
      v20 = [v22 centerYAnchor];
      v19 = [v21 constraintEqualToAnchor:v20];
      v37[3] = v19;
      v17 = [(PHBannerButtonsView *)self topAnchor];
      v18 = [(PHBannerButtonsView *)self rightButton];
      __int16 v8 = [v18 topAnchor];
      id v9 = [v17 constraintEqualToAnchor:v8];
      v37[4] = v9;
      double v10 = [(PHBannerButtonsView *)self bottomAnchor];
      double v11 = [(PHBannerButtonsView *)self rightButton];
      __int16 v12 = [v11 bottomAnchor];
      unsigned int v13 = [v10 constraintEqualToAnchor:v12];
      v37[5] = v13;
      objc_super v14 = [(PHBannerButtonsView *)self widthAnchor];
      [(PHBannerButtonsView *)self intrinsicWidth];
      v15 = [v14 constraintEqualToConstant:];
      v37[6] = v15;
      v16 = +[NSArray arrayWithObjects:v37 count:7];
      [(PHBannerButtonsView *)self addConstraints:v16];
    }
  }
}

- (double)intrinsicWidth
{
  [(PHBannerButtonsView *)self directionalLayoutMargins];
  return v2 * 2.0 + 80.0;
}

- (void)transitionFromIncomingCallToOngoingCallState
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Transitioning the banner buttons from an incoming call to ongoing", v4, 2u);
  }

  [(PHBannerButtonsView *)self transitionLeftButtonFromIncomingToOngoingCallState];
  [(PHBannerButtonsView *)self transitionRightButtonFromIncomingToOngoingCallState];
}

- (void)transitionRightButtonFromIncomingToOngoingCallState
{
  id v3 = +[UIColor systemRedColor];
  id v4 = [v3 CGColor];

  double v5 = [(PHBannerButtonsView *)self buttonConfigurationWithActionType:1];
  id v6 = [(PHBannerButtonsView *)self rightButton];
  double v7 = [v5 icon];
  [v6 setImage:v7 forState:0];

  __int16 v8 = [(PHBannerButtonsView *)self rightButton];
  id v9 = [v8 imageView];
  [v9 setClipsToBounds:0];

  double v10 = [(PHBannerButtonsView *)self rightButton];
  double v11 = [v10 imageView];
  [v11 setContentMode:4];

  __int16 v12 = [(PHBannerButtonsView *)self rightButton];
  unsigned int v13 = [v12 imageView];
  objc_super v14 = [v13 layer];
  v15 = +[PHBottomBarAnimations rollAnimation];
  [v14 addAnimation:v15 forKey:@"mainRightButtonAnimation"];

  v16 = [(PHBannerButtonsView *)self rightButton];
  v17 = [v16 roundView];
  v18 = [v17 layer];
  v19 = [(PHBannerButtonsView *)self rightButton];
  id v20 = [v19 backgroundColor];
  v21 = +[PHBottomBarAnimations backgroundColorAnimationFromColor:toColor:](PHBottomBarAnimations, "backgroundColorAnimationFromColor:toColor:", [v20 CGColor], v4);
  [v18 addAnimation:v21 forKey:@"buttonColorAnimation"];

  v22 = [(PHBannerButtonsView *)self rightButton];
  [v22 setAction:15];

  v23 = +[UIColor colorWithCGColor:v4];
  v24 = [(PHBannerButtonsView *)self rightButton];
  [v24 setBackgroundColor:v23];

  CATransform3DMakeRotation(&v32, 2.35619449, 0.0, 0.0, 1.0);
  v25 = [(PHBannerButtonsView *)self rightButton];
  v26 = [v25 imageView];
  v27 = [v26 layer];
  CATransform3D v31 = v32;
  [v27 setTransform:&v31];

  v28 = [(PHBannerButtonsView *)self rightButton];
  v29 = +[NSBundle mainBundle];
  v30 = [v29 localizedStringForKey:@"DECLINE" value:&stru_1002D6110 table:@"BottomBar"];
  [v28 setAccessibilityIdentifier:v30];
}

- (void)transitionLeftButtonFromIncomingToOngoingCallState
{
  id v3 = [(PHBannerButtonsView *)self leftButton];
  id v4 = [v3 imageView];
  [v4 setClipsToBounds:0];

  double v5 = [(PHBannerButtonsView *)self leftButton];
  id v6 = [v5 imageView];
  [v6 setContentMode:4];

  double v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v46 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating the left banner button to handle audio routes", v46, 2u);
  }

  __int16 v8 = [(PHBannerButtonsView *)self leftButton];
  [v8 setAction:22];

  id v9 = +[UIColor clearColor];
  double v10 = [(PHBannerButtonsView *)self leftButton];
  [v10 setBackgroundColor:v9];

  double v11 = [(PHBannerButtonsView *)self leftButton];
  __int16 v12 = +[NSBundle mainBundle];
  unsigned int v13 = [v12 localizedStringForKey:@"AUDIO" value:&stru_1002D6110 table:@"BottomBar"];
  [v11 setAccessibilityIdentifier:v13];

  objc_super v14 = +[TUCallCenter sharedInstance];
  v15 = [v14 routeController];
  v16 = [v15 pickedRoute];

  if ([v16 isAuxiliary]) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = (uint64_t)[v16 isSpeaker];
  }
  [(PHBannerButtonsView *)self setAudioRouteButtonSelected:v17];
  [(PHBannerButtonsView *)self updateAudioRouteButtonImage];
  v18 = +[UIBlurEffect effectWithStyle:8];
  v19 = +[UIVibrancyEffect effectForBlurEffect:v18 style:6];
  id v20 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v19];
  [(PHBannerButtonsView *)self setAudioRouteVibrancyView:v20];

  v21 = [(PHBannerButtonsView *)self leftButton];
  [v21 bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = [(PHBannerButtonsView *)self audioRouteVibrancyView];
  [v30 setFrame:v23, v25, v27, v29];

  CATransform3D v31 = [(PHBannerButtonsView *)self leftButton];
  CATransform3D v32 = [v31 layer];
  [v32 cornerRadius];
  double v34 = v33;
  v35 = [(PHBannerButtonsView *)self audioRouteVibrancyView];
  v36 = [v35 layer];
  [v36 setCornerRadius:v34];

  v37 = [(PHBannerButtonsView *)self audioRouteVibrancyView];
  [v37 setClipsToBounds:1];

  v38 = [(PHBannerButtonsView *)self audioRouteVibrancyView];
  [v38 setUserInteractionEnabled:0];

  v39 = +[UIColor whiteColor];
  v40 = [(PHBannerButtonsView *)self audioRouteVibrancyView];
  v41 = [v40 contentView];
  [v41 setBackgroundColor:v39];

  v42 = [(PHBannerButtonsView *)self leftButton];
  v43 = [(PHBannerButtonsView *)self audioRouteVibrancyView];
  v44 = [(PHBannerButtonsView *)self leftButton];
  v45 = [v44 imageView];
  [v42 insertSubview:v43 belowSubview:v45];
}

- (void)updateAudioRouteButtonBackgroundColor
{
  id v5 = [(PHBannerButtonsView *)self leftButton];
  if ([v5 isSelected]) {
    +[UIColor whiteColor];
  }
  else {
  id v3 = +[UIColor clearColor];
  }
  id v4 = [(PHBannerButtonsView *)self leftButton];
  [v4 setBackgroundColor:v3];
}

- (void)updateAudioRouteButtonImageColor
{
  id v5 = [(PHBannerButtonsView *)self audioRouteButtonImageColor];
  id v3 = [(PHBannerButtonsView *)self leftButton];
  id v4 = [v3 imageView];
  [v4 setTintColor:v5];
}

- (id)audioRouteButtonImageColor
{
  double v2 = [(PHBannerButtonsView *)self leftButton];
  if ([v2 isSelected]) {
    +[UIColor blackColor];
  }
  else {
  id v3 = +[UIColor whiteColor];
  }

  return v3;
}

- (void)updateAudioRouteButtonImage
{
  id v3 = [(PHBannerButtonsView *)self buttonConfigurationWithActionType:22];
  id v4 = [v3 icon];

  id v5 = +[TUCallCenter sharedInstance];
  id v6 = [v5 routeController];
  double v7 = [v6 pickedRoute];
  unsigned int v8 = [v7 isAuxiliary];

  if (v8)
  {
    id v9 = +[TUCallCenter sharedInstance];
    double v10 = [v9 routeController];
    double v11 = [v10 pickedRoute];
    __int16 v12 = [(PHBannerButtonsView *)self audioRouteButtonImageColor];
    uint64_t v13 = [v11 audioRouteGlyphForRoutePickerWithColor:v12];
    objc_super v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = v4;
    }
    id v16 = v15;

    uint64_t v17 = sub_1000D5130();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Setting audio route button image to %@", (uint8_t *)&v20, 0xCu);
    }

    v18 = [(PHBannerButtonsView *)self leftButton];
    [v18 setImage:v16 forState:0];
  }
  else
  {
    v19 = sub_1000D5130();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Setting audio route button image to %@", (uint8_t *)&v20, 0xCu);
    }

    id v16 = [(PHBannerButtonsView *)self leftButton];
    [v16 setImage:v4 forState:0];
  }
}

- (id)buttonWithActionType:(int64_t)a3
{
  id v4 = [(PHBannerButtonsView *)self buttonConfigurationWithActionType:a3];
  id v5 = [[PHBottomBarButton alloc] initWithConfiguration:v4];
  [(PHBottomBarButton *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PHBottomBarButton *)v5 addTarget:self action:"buttonPressed:" forControlEvents:64];

  return v5;
}

- (id)buttonConfigurationWithActionType:(int64_t)a3
{
  id v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 bottomBarCallState];

  id v6 = [[PHBottomBarButtonConfiguration alloc] initWithAction:a3 diameter:v5 callState:1 sizeCategory:40.0];

  return v6;
}

- (void)buttonPressed:(id)a3
{
  id v4 = a3;
  id v6 = [(PHBannerButtonsView *)self delegate];
  id v5 = [v4 action];

  [v6 bannerButtonsView:self didPerformActionType:v5];
}

- (void)routesChangedForRouteController:(id)a3
{
  id v4 = [(PHBannerButtonsView *)self leftButton];
  id v5 = [v4 action];

  if (v5 == (id)22)
  {
    id v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Audio routes changed, updating audio route banner button", v11, 2u);
    }

    double v7 = +[TUCallCenter sharedInstance];
    unsigned int v8 = [v7 routeController];
    id v9 = [v8 pickedRoute];

    if ([v9 isAuxiliary]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = (uint64_t)[v9 isSpeaker];
    }
    [(PHBannerButtonsView *)self setAudioRouteButtonSelected:v10];
    [(PHBannerButtonsView *)self updateAudioRouteButtonImage];
  }
}

- (PHBannerButtonsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHBannerButtonsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (PHBottomBarButton)leftButton
{
  return self->_leftButton;
}

- (void)setLeftButton:(id)a3
{
}

- (PHBottomBarButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
}

- (UIVisualEffectView)audioRouteVibrancyView
{
  return self->_audioRouteVibrancyView;
}

- (void)setAudioRouteVibrancyView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioRouteVibrancyView, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end