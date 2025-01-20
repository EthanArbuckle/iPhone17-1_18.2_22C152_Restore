@interface AXSpeakOverlayControlBar
+ (CGSize)controlBarSize;
+ (CGSize)nubbitSize;
- (AXSpeakOverlayControlBar)initWithFrame:(CGRect)a3;
- (AXSpeakOverlayControlBarDelegate)delegate;
- (NSArray)maximizedConstraints;
- (NSArray)minimizedConstraints;
- (SpeakThisUIStateManager)stateManager;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (UITapGestureRecognizer)doubleTapRecognizer;
- (UITapGestureRecognizer)singleTapRecognizer;
- (id)_addButtonWithImageName:(id)a3 accessibilityLabel:(id)a4 round:(BOOL)a5 action:(SEL)a6;
- (id)_buttons;
- (id)_roundButtons;
- (id)_squareButtons;
- (void)_addButtonConstraints:(id)a3;
- (void)_fastForwardButtonPressed;
- (void)_handlePan:(id)a3;
- (void)_headerTapped:(id)a3;
- (void)_loadButtonsAndConstraints:(id)a3;
- (void)_playPauseButtonPressed;
- (void)_rewindButtonPressed;
- (void)_speakUnderFingerButtonPressed;
- (void)_speedButtonPressed;
- (void)_startNewReadAllFromGesture:(id)a3;
- (void)_stopButtonPressed;
- (void)_stopSpeakFingerButtonPressed;
- (void)_tabModeButtonPressed;
- (void)_updateAccessibilityElements;
- (void)_updateButton:(id)a3 withImageName:(id)a4 accessibilityLabel:(id)a5;
- (void)_updateSpeedButtonTitle;
- (void)_voiceOverStatusChanged;
- (void)changeToPauseButton;
- (void)changeToResumeButton;
- (void)changeToStopButton;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)hideStopButton;
- (void)setDelegate:(id)a3;
- (void)setDoubleTapRecognizer:(id)a3;
- (void)setHidesMainViews:(BOOL)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setMaximizedConstraints:(id)a3;
- (void)setMinimizedConstraints:(id)a3;
- (void)setSingleTapRecognizer:(id)a3;
- (void)setStateManager:(id)a3;
- (void)showErrorMessage:(id)a3;
- (void)showLoading;
- (void)showMainUI;
- (void)showSpeakFingerUI;
- (void)showStopButton;
- (void)updateButtonConstraints;
- (void)updateForTabModeChangeUsingSpeakFingerButton:(BOOL)a3;
- (void)updateHeaderLabel;
- (void)updateNubbitGestureRecognizers;
@end

@implementation AXSpeakOverlayControlBar

+ (CGSize)nubbitSize
{
  double v2 = 60.0;
  double v3 = 60.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)controlBarSize
{
  double v2 = +[AXSettings sharedInstance];
  if ([v2 showSpeechController])
  {
    double v3 = 317.0;
  }
  else if (AXDeviceIsPad())
  {
    double v3 = 374.0;
  }
  else
  {
    double v3 = 317.0;
  }
  int IsPad = AXDeviceIsPad();
  double v5 = 60.0;
  if (!IsPad) {
    double v5 = 3.0;
  }
  double v6 = v3 + v5;

  int v7 = AXDeviceIsPad();
  double v8 = 90.0;
  if (!v7) {
    double v8 = 129.0;
  }
  double v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (AXSpeakOverlayControlBar)initWithFrame:(CGRect)a3
{
  v63.receiver = self;
  v63.super_class = (Class)AXSpeakOverlayControlBar;
  double v3 = -[AXSpeakOverlayControlBar initWithFrame:](&v63, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[SpeakThisUIStateManager sharedInstance];
    stateManager = v3->_stateManager;
    v3->_stateManager = (SpeakThisUIStateManager *)v4;

    double v6 = +[NSMutableArray array];
    int v7 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
    activityIndicatorView = v3->_activityIndicatorView;
    v3->_activityIndicatorView = v7;

    [(UIActivityIndicatorView *)v3->_activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v3->_activityIndicatorView setHidden:1];
    [(AXSpeakOverlayControlBar *)v3 addSubview:v3->_activityIndicatorView];
    double v9 = +[NSLayoutConstraint constraintWithItem:v3->_activityIndicatorView attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
    [v6 addObject:v9];

    v10 = v3->_activityIndicatorView;
    if (AXDeviceIsPad()) {
      double v11 = 39.0;
    }
    else {
      double v11 = 69.0;
    }
    v12 = +[NSLayoutConstraint constraintWithItem:v10 attribute:3 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:v11];
    [v6 addObject:v12];

    v13 = (UILabel *)objc_alloc_init((Class)UILabel);
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = v13;

    [(UILabel *)v3->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_headerLabel setTextAlignment:1];
    if (AXDeviceIsPad()) {
      double v15 = 17.0;
    }
    else {
      double v15 = 21.0;
    }
    v16 = +[UIFont systemFontOfSize:v15];
    [(UILabel *)v3->_headerLabel setFont:v16];

    v17 = +[UIColor whiteColor];
    [(UILabel *)v3->_headerLabel setTextColor:v17];

    [(UILabel *)v3->_headerLabel setHidden:1];
    [(UILabel *)v3->_headerLabel setAccessibilityRespondsToUserInteraction:1];
    [(AXSpeakOverlayControlBar *)v3 addSubview:v3->_headerLabel];
    v18 = (UILabel *)objc_alloc_init((Class)UILabel);
    errorLabel = v3->_errorLabel;
    v3->_errorLabel = v18;

    [(UILabel *)v3->_errorLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_errorLabel setTextAlignment:1];
    if (AXDeviceIsPad()) {
      double v20 = 17.0;
    }
    else {
      double v20 = 21.0;
    }
    v21 = +[UIFont systemFontOfSize:v20];
    [(UILabel *)v3->_errorLabel setFont:v21];

    v22 = +[UIColor whiteColor];
    [(UILabel *)v3->_errorLabel setTextColor:v22];

    [(UILabel *)v3->_errorLabel setHidden:1];
    [(UILabel *)v3->_errorLabel setNumberOfLines:0];
    [(UILabel *)v3->_errorLabel setAccessibilityRespondsToUserInteraction:1];
    [(AXSpeakOverlayControlBar *)v3 addSubview:v3->_errorLabel];
    v23 = v3->_headerLabel;
    if (AXDeviceIsPad()) {
      double v24 = 19.0;
    }
    else {
      double v24 = 39.0;
    }
    v25 = +[NSLayoutConstraint constraintWithItem:v23 attribute:11 relatedBy:0 toItem:v3 attribute:3 multiplier:1.0 constant:v24];
    [v6 addObject:v25];

    v26 = +[NSLayoutConstraint constraintWithItem:v3->_headerLabel attribute:9 relatedBy:0 toItem:v3 attribute:9 multiplier:1.0 constant:0.0];
    [v6 addObject:v26];

    v27 = +[NSLayoutConstraint constraintWithItem:v3->_errorLabel attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
    [v6 addObject:v27];

    [(AXSpeakOverlayControlBar *)v3 _loadButtonsAndConstraints:v6];
    v28 = [(UILabel *)v3->_errorLabel leadingAnchor];
    v29 = [(AXSpeakScreenButton *)v3->_speakFingerButton trailingAnchor];
    v30 = [v28 constraintEqualToSystemSpacingAfterAnchor:v29 multiplier:1.0];
    [v6 addObject:v30];

    v31 = [(AXSpeakScreenButton *)v3->_speedButton leadingAnchor];
    v32 = [(UILabel *)v3->_errorLabel trailingAnchor];
    v33 = [v31 constraintEqualToSystemSpacingAfterAnchor:v32 multiplier:1.0];
    [v6 addObject:v33];

    v34 = [(AXSpeakScreenButton *)v3->_speedButton titleLabel];
    v35 = [v34 leadingAnchor];
    v36 = [(AXSpeakScreenButton *)v3->_speedButton leadingAnchor];
    v37 = [v35 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v36 multiplier:1.0];
    [v6 addObject:v37];

    v38 = [(AXSpeakScreenButton *)v3->_speedButton trailingAnchor];
    v39 = [(AXSpeakScreenButton *)v3->_speedButton titleLabel];
    v40 = [v39 trailingAnchor];
    v41 = [v38 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v40 multiplier:1.0];
    [v6 addObject:v41];

    v42 = (UIView *)objc_alloc_init((Class)UIView);
    dragView = v3->_dragView;
    v3->_dragView = v42;

    [(UIView *)v3->_dragView setUserInteractionEnabled:1];
    v44 = v3->_dragView;
    if (AXDeviceIsPad()) {
      double v45 = 6.0;
    }
    else {
      double v45 = 9.0;
    }
    double v46 = v45 * 2.0 + 48.0;
    [(id)objc_opt_class() controlBarSize];
    double v48 = v47;
    if (AXDeviceIsPad()) {
      double v49 = 6.0;
    }
    else {
      double v49 = 9.0;
    }
    double v50 = v48 + (v49 * 2.0 + 48.0) * -2.0;
    if (AXDeviceIsPad()) {
      double v51 = 24.0;
    }
    else {
      double v51 = 63.0;
    }
    -[UIView setFrame:](v44, "setFrame:", v46, 0.0, v50, v51);
    id v52 = [objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:v3 action:"_handlePan:"];
    [(UIView *)v3->_dragView addGestureRecognizer:v52];
    id v53 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"_headerTapped:"];
    [(UIView *)v3->_dragView addGestureRecognizer:v53];
    [(AXSpeakOverlayControlBar *)v3 addSubview:v3->_dragView];
    [(AXSpeakOverlayControlBar *)v3 sendSubviewToBack:v3->_dragView];
    +[NSLayoutConstraint activateConstraints:v6];
    v54 = +[NSNotificationCenter defaultCenter];
    [v54 addObserver:v3 selector:"_voiceOverStatusChanged" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

    [(AXSpeakOverlayControlBar *)v3 _updateAccessibilityElements];
    objc_initWeak(&location, v3);
    v55 = +[AXSettings sharedInstance];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_10550;
    v60[3] = &unk_28710;
    v56 = v3;
    v61 = v56;
    id v57 = objc_loadWeakRetained(&location);
    [v55 registerUpdateBlock:v60 forRetrieveSelector:"quickSpeakSpeakingRate" withListener:v57];

    v58 = v56;
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  double v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXSpeakOverlayControlBar;
  [(AXSpeakOverlayControlBar *)&v4 dealloc];
}

- (void)updateHeaderLabel
{
  id v4 = [(AXSpeakOverlayControlBar *)self stateManager];
  double v3 = [v4 currentControllerTitle];
  [(UILabel *)self->_headerLabel setText:v3];
}

- (void)_voiceOverStatusChanged
{
  BOOL v3 = _AXSVoiceOverTouchEnabled() == 0;
  speakFingerButton = self->_speakFingerButton;

  [(AXSpeakScreenButton *)speakFingerButton setEnabled:v3];
}

- (void)setHidesMainViews:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIActivityIndicatorView *)self->_activityIndicatorView setHidden:1];
  [(UILabel *)self->_errorLabel setHidden:1];
  [(UILabel *)self->_headerLabel setHidden:v3];
  [(AXSpeakScreenButton *)self->_playPauseButton setHidden:v3];
  [(AXSpeakScreenButton *)self->_rewindButton setHidden:v3];
  forwardButton = self->_forwardButton;

  [(AXSpeakScreenButton *)forwardButton setHidden:v3];
}

- (void)showLoading
{
  [(AXSpeakOverlayControlBar *)self setHidesMainViews:1];
  [(UIActivityIndicatorView *)self->_activityIndicatorView setHidden:0];
  [(UILabel *)self->_headerLabel setHidden:0];
  BOOL v3 = +[AXSettings sharedInstance];
  unsigned __int8 v4 = [v3 showSpeechController];

  if ((v4 & 1) == 0) {
    [(AXSpeakOverlayControlBar *)self showStopButton];
  }
  activityIndicatorView = self->_activityIndicatorView;

  [(UIActivityIndicatorView *)activityIndicatorView startAnimating];
}

- (void)showMainUI
{
  [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
  [(AXSpeakOverlayControlBar *)self setHidesMainViews:0];
  [(AXSpeakScreenButton *)self->_forwardButton setEnabled:1];
  rewindButton = self->_rewindButton;

  [(AXSpeakScreenButton *)rewindButton setEnabled:1];
}

- (void)showSpeakFingerUI
{
  [(AXSpeakOverlayControlBar *)self changeToResumeButton];
  [(AXSpeakOverlayControlBar *)self setHidesMainViews:0];
  [(UILabel *)self->_headerLabel setHidden:1];
  [(AXSpeakScreenButton *)self->_stopButton setHidden:1];
  [(AXSpeakScreenButton *)self->_forwardButton setEnabled:0];
  rewindButton = self->_rewindButton;

  [(AXSpeakScreenButton *)rewindButton setEnabled:0];
}

- (void)hideStopButton
{
}

- (void)showStopButton
{
}

- (void)_headerTapped:(id)a3
{
  id v3 = [(AXSpeakOverlayControlBar *)self delegate];
  [v3 headerTapped];
}

- (void)_handlePan:(id)a3
{
  id v13 = a3;
  unsigned __int8 v4 = (char *)[v13 state];
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    [v13 translationInView:self];
    double v8 = v7;
    double v10 = v9;
    double v11 = [(AXSpeakOverlayControlBar *)self delegate];
    p_panGestureAnchor = &self->_panGestureAnchor;
    objc_msgSend(v11, "controlBarDragged:gestureRecognizer:", v13, v8 - p_panGestureAnchor->x, v10 - p_panGestureAnchor->y);

    p_panGestureAnchor->x = v8;
    p_panGestureAnchor->y = v10;
  }
  else if (v4 == (unsigned char *)&dword_0 + 1)
  {
    [v13 translationInView:self];
    self->_panGestureAnchor.x = v5;
    self->_panGestureAnchor.y = v6;
  }
}

- (void)changeToPauseButton
{
  playPauseButton = self->_playPauseButton;
  AXSpeakThisLocString(@"PAUSE");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AXSpeakOverlayControlBar *)self _updateButton:playPauseButton withImageName:@"SCATIcon_mediacontrols_pause" accessibilityLabel:v4];
}

- (void)changeToResumeButton
{
  playPauseButton = self->_playPauseButton;
  AXSpeakThisLocString(@"PLAY");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AXSpeakOverlayControlBar *)self _updateButton:playPauseButton withImageName:@"SCATIcon_mediacontrols_play" accessibilityLabel:v4];
}

- (void)changeToStopButton
{
  playPauseButton = self->_playPauseButton;
  AXSpeakThisLocString(@"STOP_SPEAK_FINGER");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AXSpeakOverlayControlBar *)self _updateButton:playPauseButton withImageName:@"square.fill" accessibilityLabel:v4];
}

- (void)showErrorMessage:(id)a3
{
  id v4 = a3;
  [(AXSpeakOverlayControlBar *)self setHidesMainViews:1];
  [(UIActivityIndicatorView *)self->_activityIndicatorView setHidden:1];
  [(UILabel *)self->_errorLabel setText:v4];

  [(UILabel *)self->_errorLabel setHidden:0];
  UIAccessibilityNotifications v5 = UIAccessibilityLayoutChangedNotification;
  errorLabel = self->_errorLabel;

  UIAccessibilityPostNotification(v5, errorLabel);
}

- (void)_updateButton:(id)a3 withImageName:(id)a4 accessibilityLabel:(id)a5
{
  id v23 = a4;
  id v7 = a5;
  id v8 = a3;
  if ([v23 hasPrefix:@"SCAT"])
  {
    double v9 = +[NSBundle bundleWithPath:@"/System/Library/CoreServices/AssistiveTouch.app"];
    double v10 = +[UIImage imageNamed:v23 inBundle:v9];
  }
  else
  {
    double v11 = +[UIImage systemImageNamed:v23];
    v12 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:UIFontTextStyleTitle2];
    double v9 = [v12 fontDescriptorWithSymbolicTraits:2];

    id v13 = [v9 fontAttributes];
    v14 = [v13 objectForKey:UIFontDescriptorTraitsAttribute];

    [v9 pointSize];
    double v16 = v15;
    v17 = [v14 objectForKey:UIFontWeightTrait];
    [v17 floatValue];
    v19 = +[UIImageSymbolConfiguration configurationWithPointSize:UIImageSymbolWeightForFontWeight(v18) weight:3 scale:v16];

    double v20 = [v19 configurationWithoutTextStyle];

    double v10 = [v11 imageWithConfiguration:v20];
  }
  v21 = +[UIColor whiteColor];
  v22 = [v10 imageWithTintColor:v21];

  [v8 setImage:v22 forState:0];
  [v8 setAccessibilityLabel:v7];
}

- (id)_addButtonWithImageName:(id)a3 accessibilityLabel:(id)a4 round:(BOOL)a5 action:(SEL)a6
{
  BOOL v6 = a5;
  id v64 = a3;
  id v63 = a4;
  id v8 = +[AXSpeakScreenButton buttonWithType:1];
  double v9 = +[UIColor whiteColor];
  [v8 setTintColor:v9];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = objc_alloc((Class)UIVisualEffectView);
  double v11 = +[UIBlurEffect effectWithStyle:19];
  v12 = +[UIVibrancyEffect effectForBlurEffect:v11 style:2];
  id v13 = [v10 initWithEffect:v12];

  [v13 setUserInteractionEnabled:0];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v14 = objc_alloc((Class)UIImageView);
  double v15 = +[UIScreen mainScreen];
  [v15 scale];
  CGFloat v17 = v16;
  v67.width = 60.0;
  v67.height = 60.0;
  UIGraphicsBeginImageContextWithOptions(v67, 0, v17);

  if (v6) {
    +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 6.75, 6.75, 46.5, 46.5);
  }
  else {
  float v18 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.75, 0.75, 58.5, 58.5, 13.0);
  }
  [v18 setLineWidth:1.5];
  v19 = +[UIColor colorWithWhite:0.5 alpha:1.0];
  [v19 set];

  [v18 stroke];
  double v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  id v21 = [v14 initWithImage:v20];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = [v13 contentView];
  [v22 addSubview:v21];

  [v8 setBorderEffectView:v13];
  id v23 = objc_alloc((Class)UIVisualEffectView);
  double v24 = +[UIBlurEffect effectWithStyle:17];
  v25 = +[UIVibrancyEffect effectForBlurEffect:v24 style:0];
  id v26 = [v23 initWithEffect:v25];

  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setButtonEffectView:v26];
  v27 = [v26 contentView];
  [v27 addSubview:v8];

  id v57 = [v21 leadingAnchor];
  v58 = [v13 contentView];
  v56 = [v58 leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v65[0] = v55;
  id v53 = [v21 trailingAnchor];
  v54 = [v13 contentView];
  id v52 = [v54 trailingAnchor];
  double v51 = [v53 constraintEqualToAnchor:v52];
  v65[1] = v51;
  double v49 = [v21 topAnchor];
  double v50 = [v13 contentView];
  double v48 = [v50 topAnchor];
  double v47 = [v49 constraintEqualToAnchor:v48];
  v65[2] = v47;
  v59 = v21;
  double v45 = [v21 bottomAnchor];
  v60 = v13;
  double v46 = [v13 contentView];
  v44 = [v46 bottomAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v65[3] = v43;
  v42 = [v26 topAnchor];
  v41 = [v8 topAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v65[4] = v40;
  v39 = [v26 bottomAnchor];
  v38 = [v8 bottomAnchor];
  v28 = [v39 constraintEqualToAnchor:v38];
  v65[5] = v28;
  v29 = [v26 leadingAnchor];
  v30 = [v8 leadingAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  v65[6] = v31;
  v32 = [v26 trailingAnchor];
  v33 = [v8 trailingAnchor];
  [v32 constraintEqualToAnchor:v33];
  v35 = v34 = v8;
  v65[7] = v35;
  v36 = +[NSArray arrayWithObjects:v65 count:8];
  +[NSLayoutConstraint activateConstraints:v36];

  if (a6) {
    [v34 addTarget:self action:a6 forControlEvents:64];
  }
  [(AXSpeakOverlayControlBar *)self _updateButton:v34 withImageName:v64 accessibilityLabel:v63];
  [(AXSpeakOverlayControlBar *)self addSubview:v60];
  [(AXSpeakOverlayControlBar *)self addSubview:v26];

  return v34;
}

- (void)updateButtonConstraints
{
  id v3 = [(AXSpeakOverlayControlBar *)self maximizedConstraints];
  +[NSLayoutConstraint deactivateConstraints:v3];

  id v4 = [(AXSpeakOverlayControlBar *)self minimizedConstraints];
  +[NSLayoutConstraint deactivateConstraints:v4];

  UIAccessibilityNotifications v5 = objc_opt_new();
  [(AXSpeakOverlayControlBar *)self _addButtonConstraints:v5];

  id v7 = [(AXSpeakOverlayControlBar *)self stateManager];
  if ([v7 inTabMode]) {
    [(AXSpeakOverlayControlBar *)self minimizedConstraints];
  }
  else {
  BOOL v6 = [(AXSpeakOverlayControlBar *)self maximizedConstraints];
  }
  +[NSLayoutConstraint activateConstraints:v6];
}

- (void)_addButtonConstraints:(id)a3
{
  id v158 = a3;
  v151 = +[NSMutableArray array];
  v157 = +[NSMutableArray array];
  v152 = [(AXSpeakOverlayControlBar *)self _squareButtons];
  id v4 = &AXDeviceHasJindo_ptr;
  v150 = (char *)[v152 count];
  if (v150)
  {
    v149 = v150 - 1;
    if (v150 == (unsigned char *)&dword_0 + 1)
    {
      UIAccessibilityNotifications v5 = objc_msgSend(v152, "objectAtIndexedSubscript:", 0, v149);
      BOOL v6 = +[NSLayoutConstraint constraintWithItem:v5 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:60.0];
      [v158 addObject:v6];

      id v7 = +[NSLayoutConstraint constraintWithItem:v5 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:60.0];
      [v158 addObject:v7];

      if (AXDeviceIsPad()) {
        double v8 = 27.0;
      }
      else {
        double v8 = 66.0;
      }
      double v9 = +[NSLayoutConstraint constraintWithItem:v5 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v8];
      [v157 addObject:v9];

      id v10 = +[NSLayoutConstraint constraintWithItem:v5 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
      [v157 addObject:v10];

      double v11 = +[NSLayoutConstraint constraintWithItem:v5 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
      [v151 addObject:v11];

      v12 = +[NSLayoutConstraint constraintWithItem:v5 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
      [v151 addObject:v12];

      id v13 = [v5 borderEffectView];
      id v14 = +[NSLayoutConstraint constraintWithItem:v13 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:60.0];
      [v158 addObject:v14];

      double v15 = [v5 borderEffectView];
      double v16 = +[NSLayoutConstraint constraintWithItem:v15 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:60.0];
      [v158 addObject:v16];

      CGFloat v17 = [v5 borderEffectView];
      if (AXDeviceIsPad()) {
        double v18 = 27.0;
      }
      else {
        double v18 = 66.0;
      }
      v19 = +[NSLayoutConstraint constraintWithItem:v17 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v18];
      [v157 addObject:v19];

      double v20 = [v5 borderEffectView];
      id v21 = +[NSLayoutConstraint constraintWithItem:v20 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
      [v157 addObject:v21];

      v22 = [v5 borderEffectView];
      id v23 = +[NSLayoutConstraint constraintWithItem:v22 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
      [v151 addObject:v23];

      double v24 = [v5 borderEffectView];
      v25 = +[NSLayoutConstraint constraintWithItem:v24 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
      [v151 addObject:v25];

      id v4 = &AXDeviceHasJindo_ptr;
    }
    else
    {
      id v26 = 0;
      v27 = &AXDeviceHasJindo_ptr;
      do
      {
        v28 = objc_msgSend(v152, "objectAtIndexedSubscript:", v26, v149);
        v29 = [v4[135] constraintWithItem:v28 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:60.0];
        [v158 addObject:v29];

        v30 = [v4[135] constraintWithItem:v28 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:60.0];
        [v158 addObject:v30];

        v31 = v4[135];
        v32 = [v28 borderEffectView];
        v33 = [v31 constraintWithItem:v32 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:60.0];
        [v158 addObject:v33];

        v34 = v4[135];
        v35 = [v28 borderEffectView];
        v36 = [v34 constraintWithItem:v35 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:60.0];
        [v158 addObject:v36];

        v37 = v4[135];
        if (AXDeviceIsPad()) {
          double v38 = 60.0;
        }
        else {
          double v38 = 3.0;
        }
        uint64_t v39 = [v37 constraintWithItem:v28 attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:v38];
        v40 = v4[135];
        v41 = [v28 borderEffectView];
        if (AXDeviceIsPad()) {
          double v42 = 60.0;
        }
        else {
          double v42 = 3.0;
        }
        uint64_t v43 = [v40 constraintWithItem:v41 attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:v42];

        if (!v26)
        {
          [v157 addObject:v39];
          [v157 addObject:v43];
        }
        v156 = (void *)v43;
        v153 = (void *)v39;
        v44 = v4[135];
        double v45 = [v27[123] sharedInstance];
        unsigned __int8 v46 = [v45 showSpeechController];
        double v47 = 3.5;
        double v48 = 3.5;
        if ((v46 & 1) == 0)
        {
          int IsPad = AXDeviceIsPad();
          double v48 = 60.0;
          if (!IsPad) {
            double v48 = 3.0;
          }
        }
        double v50 = [v44 constraintWithItem:v28 attribute:2 relatedBy:0 toItem:self attribute:2 multiplier:1.0 constant:-v48];

        double v51 = v4[135];
        id v52 = [v28 borderEffectView];
        id v53 = [v27[123] sharedInstance];
        if (([v53 showSpeechController] & 1) == 0)
        {
          if (AXDeviceIsPad()) {
            double v47 = 60.0;
          }
          else {
            double v47 = 3.0;
          }
        }
        v54 = [v51 constraintWithItem:v52 attribute:2 relatedBy:0 toItem:self attribute:2 multiplier:1.0 constant:-v47];

        LODWORD(v55) = 1144750080;
        [v50 setPriority:v55];
        LODWORD(v56) = 1144750080;
        [v54 setPriority:v56];
        if (v149 == v26)
        {
          [v157 addObject:v50];
          [v157 addObject:v54];
        }
        v154 = v54;
        v155 = v50;
        if (v26)
        {
          id v57 = [v152 objectAtIndexedSubscript:v26 - 1];
          v58 = [v4[135] constraintWithItem:v28 attribute:1 relatedBy:0 toItem:v57 attribute:2 multiplier:1.0 constant:3.5];
          [v157 addObject:v58];

          v59 = v4[135];
          v60 = [v28 borderEffectView];
          v61 = [v57 borderEffectView];
          v62 = [v59 constraintWithItem:v60 attribute:1 relatedBy:0 toItem:v61 attribute:2 multiplier:1.0 constant:3.5];
          [v157 addObject:v62];

          id v63 = v4[135];
          id v64 = [v152 objectAtIndexedSubscript:0];
          v65 = [v63 constraintWithItem:v28 attribute:3 relatedBy:0 toItem:v64 attribute:3 multiplier:1.0 constant:0.0];
          [v158 addObject:v65];

          v66 = v4[135];
          CGSize v67 = [v28 borderEffectView];
          v68 = [v152 objectAtIndexedSubscript:0];
          v69 = [v68 borderEffectView];
          v70 = [v66 constraintWithItem:v67 attribute:3 relatedBy:0 toItem:v69 attribute:3 multiplier:1.0 constant:0.0];
          [v158 addObject:v70];

          id v4 = &AXDeviceHasJindo_ptr;
        }
        else
        {
          v71 = v4[135];
          if (AXDeviceIsPad()) {
            double v72 = 27.0;
          }
          else {
            double v72 = 66.0;
          }
          v73 = [v71 constraintWithItem:v28 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v72];
          [v157 addObject:v73];

          v74 = v4[135];
          id v57 = [v28 borderEffectView];
          if (AXDeviceIsPad()) {
            double v75 = 27.0;
          }
          else {
            double v75 = 66.0;
          }
          CGSize v67 = [v74 constraintWithItem:v57 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v75];
          [v157 addObject:v67];
        }

        v76 = [v4[135] constraintWithItem:v28 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
        [v151 addObject:v76];

        v77 = [v4[135] constraintWithItem:v28 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
        [v151 addObject:v77];

        v78 = v4[135];
        v79 = [v28 borderEffectView];
        v80 = [v78 constraintWithItem:v79 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
        [v151 addObject:v80];

        v81 = v4[135];
        v82 = [v28 borderEffectView];
        v83 = [v81 constraintWithItem:v82 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
        [v151 addObject:v83];

        ++v26;
        v27 = &AXDeviceHasJindo_ptr;
      }
      while (v150 != v26);
    }
  }
  v84 = [(AXSpeakOverlayControlBar *)self _roundButtons];
  [v84 firstObject];
  v86 = v85 = v4;

  v87 = v85[135];
  if (AXDeviceIsPad()) {
    double v88 = 33.0;
  }
  else {
    double v88 = 9.0;
  }
  v89 = [v87 constraintWithItem:v86 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v88];
  [v157 addObject:v89];

  v90 = [v85[135] constraintWithItem:v86 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:6.0];
  [v151 addObject:v90];

  v91 = [v85[135] constraintWithItem:v86 attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:6.0];
  [v151 addObject:v91];

  v92 = v85[135];
  if (AXDeviceIsPad()) {
    double v93 = 6.0;
  }
  else {
    double v93 = 9.0;
  }
  v94 = [v92 constraintWithItem:v86 attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:v93];
  [v157 addObject:v94];

  v95 = [v85[135] constraintWithItem:v86 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:48.0];
  [v158 addObject:v95];

  v96 = [v85[135] constraintWithItem:v86 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:48.0];
  [v158 addObject:v96];

  v97 = v85[135];
  v98 = [v86 borderEffectView];
  if (AXDeviceIsPad()) {
    double v99 = 33.0;
  }
  else {
    double v99 = 9.0;
  }
  v100 = [v97 constraintWithItem:v98 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v99];
  [v157 addObject:v100];

  v101 = v85[135];
  v102 = [v86 borderEffectView];
  v103 = [v101 constraintWithItem:v102 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:6.0];
  [v151 addObject:v103];

  v104 = v85[135];
  v105 = [v86 borderEffectView];
  v106 = [v104 constraintWithItem:v105 attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:6.0];
  [v151 addObject:v106];

  v107 = v85[135];
  v108 = [v86 borderEffectView];
  if (AXDeviceIsPad()) {
    double v109 = 6.0;
  }
  else {
    double v109 = 9.0;
  }
  v110 = [v107 constraintWithItem:v108 attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:v109];
  [v157 addObject:v110];

  v111 = v85[135];
  v112 = [v86 borderEffectView];
  v113 = [v111 constraintWithItem:v112 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:48.0];
  [v158 addObject:v113];

  v114 = v85[135];
  v115 = [v86 borderEffectView];
  v116 = [v114 constraintWithItem:v115 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:48.0];
  [v158 addObject:v116];

  v117 = [(AXSpeakOverlayControlBar *)self _roundButtons];
  v118 = [v117 lastObject];

  v119 = v85[135];
  if (AXDeviceIsPad()) {
    double v120 = 33.0;
  }
  else {
    double v120 = 9.0;
  }
  v121 = [v119 constraintWithItem:v118 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v120];
  [v157 addObject:v121];

  v122 = v85[135];
  if (AXDeviceIsPad()) {
    double v123 = 6.0;
  }
  else {
    double v123 = 9.0;
  }
  v124 = [v122 constraintWithItem:v118 attribute:2 relatedBy:0 toItem:self attribute:2 multiplier:1.0 constant:-v123];
  [v157 addObject:v124];

  v125 = [v85[135] constraintWithItem:v118 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:48.0];
  [v158 addObject:v125];

  v126 = [v85[135] constraintWithItem:v118 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:48.0];
  [v158 addObject:v126];

  v127 = [v85[135] constraintWithItem:v118 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:6.0];
  [v151 addObject:v127];

  v128 = [v85[135] constraintWithItem:v118 attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:6.0];
  [v151 addObject:v128];

  v129 = v85[135];
  v130 = [v118 borderEffectView];
  if (AXDeviceIsPad()) {
    double v131 = 33.0;
  }
  else {
    double v131 = 9.0;
  }
  v132 = [v129 constraintWithItem:v130 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v131];
  [v157 addObject:v132];

  v133 = v85[135];
  v134 = [v118 borderEffectView];
  if (AXDeviceIsPad()) {
    double v135 = 6.0;
  }
  else {
    double v135 = 9.0;
  }
  v136 = [v133 constraintWithItem:v134 attribute:2 relatedBy:0 toItem:self attribute:2 multiplier:1.0 constant:-v135];
  [v157 addObject:v136];

  v137 = v85[135];
  v138 = [v118 borderEffectView];
  v139 = [v137 constraintWithItem:v138 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:48.0];
  [v158 addObject:v139];

  v140 = v85[135];
  v141 = [v118 borderEffectView];
  v142 = [v140 constraintWithItem:v141 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:48.0];
  [v158 addObject:v142];

  v143 = v85[135];
  v144 = [v118 borderEffectView];
  v145 = [v143 constraintWithItem:v144 attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:6.0];
  [v151 addObject:v145];

  v146 = v85[135];
  v147 = [v118 borderEffectView];
  v148 = [v146 constraintWithItem:v147 attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:6.0];
  [v151 addObject:v148];

  [(AXSpeakOverlayControlBar *)self setMaximizedConstraints:v157];
  [(AXSpeakOverlayControlBar *)self setMinimizedConstraints:v151];
  [v158 addObjectsFromArray:v157];
}

- (void)_loadButtonsAndConstraints:(id)a3
{
  id v36 = a3;
  id v4 = AXSpeakThisLocString(@"MINIMIZE");
  UIAccessibilityNotifications v5 = [(AXSpeakOverlayControlBar *)self _addButtonWithImageName:@"chevron.backward" accessibilityLabel:v4 round:1 action:0];
  tabModeButton = self->_tabModeButton;
  self->_tabModeButton = v5;

  id v7 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_speakUnderFingerButtonPressed"];
  [v7 setNumberOfTapsRequired:2];
  [(AXSpeakOverlayControlBar *)self setDoubleTapRecognizer:v7];
  double v8 = self->_tabModeButton;
  double v9 = [(AXSpeakOverlayControlBar *)self doubleTapRecognizer];
  [(AXSpeakScreenButton *)v8 addGestureRecognizer:v9];

  id v10 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_tabModeButtonPressed"];
  [v10 setNumberOfTapsRequired:1];
  double v11 = [(AXSpeakOverlayControlBar *)self doubleTapRecognizer];
  [v10 requireGestureRecognizerToFail:v11];

  [(AXSpeakOverlayControlBar *)self setSingleTapRecognizer:v10];
  v12 = self->_tabModeButton;
  id v13 = [(AXSpeakOverlayControlBar *)self singleTapRecognizer];
  [(AXSpeakScreenButton *)v12 addGestureRecognizer:v13];

  id v14 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_startNewReadAllFromGesture:"];
  [(AXSpeakOverlayControlBar *)self setLongPressRecognizer:v14];
  double v15 = self->_tabModeButton;
  double v16 = [(AXSpeakOverlayControlBar *)self longPressRecognizer];
  [(AXSpeakScreenButton *)v15 addGestureRecognizer:v16];

  CGFloat v17 = AXSpeakThisLocString(@"SPEAK_FINGER");
  double v18 = [(AXSpeakOverlayControlBar *)self _addButtonWithImageName:@"SCATIcon_gestures_fingers1" accessibilityLabel:v17 round:0 action:"_speakUnderFingerButtonPressed"];
  speakFingerButton = self->_speakFingerButton;
  self->_speakFingerButton = v18;

  [(AXSpeakScreenButton *)self->_speakFingerButton setEnabled:_AXSVoiceOverTouchEnabled() == 0];
  double v20 = AXSpeakThisLocString(@"REWIND");
  id v21 = [(AXSpeakOverlayControlBar *)self _addButtonWithImageName:@"backward.end.fill" accessibilityLabel:v20 round:0 action:"_rewindButtonPressed"];
  rewindButton = self->_rewindButton;
  self->_rewindButton = v21;

  id v23 = AXSpeakThisLocString(@"PAUSE");
  double v24 = [(AXSpeakOverlayControlBar *)self _addButtonWithImageName:@"SCATIcon_mediacontrols_pause" accessibilityLabel:v23 round:0 action:"_playPauseButtonPressed"];
  playPauseButton = self->_playPauseButton;
  self->_playPauseButton = v24;

  id v26 = AXSpeakThisLocString(@"FAST_FORWARD");
  v27 = [(AXSpeakOverlayControlBar *)self _addButtonWithImageName:@"forward.end.fill" accessibilityLabel:v26 round:0 action:"_fastForwardButtonPressed"];
  forwardButton = self->_forwardButton;
  self->_forwardButton = v27;

  v29 = [(AXSpeakOverlayControlBar *)self _addButtonWithImageName:0 accessibilityLabel:0 round:0 action:"_speedButtonPressed"];
  speedButton = self->_speedButton;
  self->_speedButton = v29;

  v31 = [(AXSpeakScreenButton *)self->_speedButton titleLabel];
  [v31 setAdjustsFontSizeToFitWidth:1];

  [(AXSpeakOverlayControlBar *)self _updateSpeedButtonTitle];
  v32 = AXSpeakThisLocString(@"STOP");
  v33 = [(AXSpeakOverlayControlBar *)self _addButtonWithImageName:@"xmark" accessibilityLabel:v32 round:1 action:"_stopButtonPressed"];
  stopButton = self->_stopButton;
  self->_stopButton = v33;

  [(AXSpeakScreenButton *)self->_rewindButton setHidden:1];
  [(AXSpeakScreenButton *)self->_playPauseButton setHidden:1];
  [(AXSpeakScreenButton *)self->_forwardButton setHidden:1];
  v35 = +[AXSettings sharedInstance];
  LODWORD(v17) = [v35 showSpeechController];

  if (v17) {
    [(AXSpeakScreenButton *)self->_stopButton setHidden:1];
  }
  [(AXSpeakOverlayControlBar *)self _addButtonConstraints:v36];
}

- (void)_updateSpeedButtonTitle
{
  id v3 = [(AXSpeakOverlayControlBar *)self delegate];
  [v3 speakingRateAsMultiplier];
  double v5 = v4;

  AXSpeakThisSpeakingRateStringForSpeed(v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(AXSpeakScreenButton *)self->_speedButton setTitle:v9 forState:0];
  speedButton = self->_speedButton;
  id v7 = +[UIFont systemFontOfSize:28.0];
  [(AXSpeakScreenButton *)speedButton _setFont:v7];

  double v8 = AXFormatLocalizedPlaybackSpeedFactor();
  [(AXSpeakScreenButton *)self->_speedButton setAccessibilityLabel:v8];
}

- (void)_stopButtonPressed
{
  id v3 = [(AXSpeakOverlayControlBar *)self delegate];
  [v3 stopButtonPressed];

  [(AXSpeakOverlayControlBar *)self hideStopButton];

  [(AXSpeakOverlayControlBar *)self showSpeakFingerUI];
}

- (void)_stopSpeakFingerButtonPressed
{
  id v2 = [(AXSpeakOverlayControlBar *)self delegate];
  [v2 stopSpeakFingerButtonPressed];
}

- (void)_rewindButtonPressed
{
  id v2 = [(AXSpeakOverlayControlBar *)self delegate];
  [v2 rewindButtonPressed];
}

- (void)_startNewReadAllFromGesture:(id)a3
{
  id v7 = a3;
  id v4 = [(AXSpeakOverlayControlBar *)self longPressRecognizer];
  if (v4 == v7 && [v7 state] == (char *)&dword_0 + 1)
  {

LABEL_7:
    id v4 = [(AXSpeakOverlayControlBar *)self delegate];
    [v4 startNewReadAllFromGesture];
    goto LABEL_8;
  }
  id v5 = [(AXSpeakOverlayControlBar *)self doubleTapRecognizer];
  if (v5 == v7)
  {
    BOOL v6 = (char *)[v7 state];

    if (v6 != (unsigned char *)&dword_0 + 3) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

LABEL_8:
LABEL_9:
}

- (void)_playPauseButtonPressed
{
  id v3 = +[AXSpeakFingerManager sharedInstance];
  id v4 = (char *)[v3 speakFingerState];

  id v5 = [(AXSpeakOverlayControlBar *)self delegate];
  id v8 = v5;
  if (v4 == (unsigned char *)&dword_0 + 3)
  {
    [v5 stopSpeakFingerButtonPressed];
  }
  else
  {
    unsigned int v6 = [v5 isSpeaking];

    id v7 = [(AXSpeakOverlayControlBar *)self delegate];
    id v8 = v7;
    if (v6) {
      [v7 pauseButtonPressed];
    }
    else {
      [v7 playButtonPressed];
    }
  }
}

- (void)_fastForwardButtonPressed
{
  id v2 = [(AXSpeakOverlayControlBar *)self delegate];
  [v2 fastForwardButtonPressed];
}

- (void)_speedButtonPressed
{
  id v3 = [(AXSpeakOverlayControlBar *)self delegate];
  [v3 speedButtonPressed];

  [(AXSpeakOverlayControlBar *)self _updateSpeedButtonTitle];
}

- (void)_tabModeButtonPressed
{
  id v2 = [(AXSpeakOverlayControlBar *)self delegate];
  [v2 tabModeButtonPressed];
}

- (void)_speakUnderFingerButtonPressed
{
  id v2 = [(AXSpeakOverlayControlBar *)self delegate];
  [v2 speakUnderFingerButtonPressed];
}

- (void)updateNubbitGestureRecognizers
{
  id v3 = [(AXSpeakOverlayControlBar *)self stateManager];
  unsigned __int8 v4 = [v3 inTabMode];

  if ((v4 & 1) == 0)
  {
    tabModeButton = self->_tabModeButton;
    id v13 = [(AXSpeakOverlayControlBar *)self longPressRecognizer];
    [(AXSpeakScreenButton *)tabModeButton removeGestureRecognizer:v13];

    id v14 = self->_tabModeButton;
    id v23 = [(AXSpeakOverlayControlBar *)self doubleTapRecognizer];
    -[AXSpeakScreenButton removeGestureRecognizer:](v14, "removeGestureRecognizer:");
    goto LABEL_13;
  }
  id v5 = [(AXSpeakOverlayControlBar *)self longPressRecognizer];
  [v5 removeTarget:0 action:0];

  unsigned int v6 = [(AXSpeakOverlayControlBar *)self doubleTapRecognizer];
  [v6 removeTarget:0 action:0];

  id v7 = +[AXSettings sharedInstance];
  id v8 = (char *)[v7 speechControllerLongPressAction];

  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    id v9 = [(AXSpeakOverlayControlBar *)self longPressRecognizer];
    id v10 = v9;
    double v11 = "_startNewReadAllFromGesture:";
    goto LABEL_7;
  }
  if (v8 == (unsigned char *)&dword_0 + 2)
  {
    id v9 = [(AXSpeakOverlayControlBar *)self longPressRecognizer];
    id v10 = v9;
    double v11 = "_speakUnderFingerButtonPressed";
LABEL_7:
    [v9 addTarget:self action:v11];

    double v15 = self->_tabModeButton;
    double v16 = [(AXSpeakOverlayControlBar *)self longPressRecognizer];
    [(AXSpeakScreenButton *)v15 addGestureRecognizer:v16];
  }
  CGFloat v17 = +[AXSettings sharedInstance];
  double v18 = (char *)[v17 speechControllerDoubleTapAction];

  if (v18 == (unsigned char *)&dword_0 + 1)
  {
    v19 = [(AXSpeakOverlayControlBar *)self doubleTapRecognizer];
    double v20 = v19;
    id v21 = "_startNewReadAllFromGesture:";
  }
  else
  {
    if (v18 != (unsigned char *)&dword_0 + 2) {
      return;
    }
    v19 = [(AXSpeakOverlayControlBar *)self doubleTapRecognizer];
    double v20 = v19;
    id v21 = "_speakUnderFingerButtonPressed";
  }
  [v19 addTarget:self action:v21];

  v22 = self->_tabModeButton;
  id v23 = [(AXSpeakOverlayControlBar *)self doubleTapRecognizer];
  -[AXSpeakScreenButton addGestureRecognizer:](v22, "addGestureRecognizer:");
LABEL_13:
}

- (void)updateForTabModeChangeUsingSpeakFingerButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AXSpeakOverlayControlBar *)self stateManager];
  unsigned int v6 = [v5 inTabMode];

  if (v6)
  {
    id v7 = [(AXSpeakOverlayControlBar *)self maximizedConstraints];
    +[NSLayoutConstraint deactivateConstraints:v7];

    tabModeButton = self->_tabModeButton;
    id v9 = AXSpeakThisLocString(@"MAXIMIZE");
    [(AXSpeakOverlayControlBar *)self _updateButton:tabModeButton withImageName:@"chevron.forward" accessibilityLabel:v9];

    [(UILabel *)self->_headerLabel setAlpha:0.0];
    [(UIActivityIndicatorView *)self->_activityIndicatorView setAlpha:0.0];
    id v10 = self->_tabModeButton;
    if (v3)
    {
      double v11 = self->_speakFingerButton;

      id v10 = v11;
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v12 = [(AXSpeakOverlayControlBar *)self _buttons];
    id v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          CGFloat v17 = *(AXSpeakScreenButton **)(*((void *)&v31 + 1) + 8 * i);
          if (v17 != v10) {
            [(AXSpeakScreenButton *)v17 setAlpha:0.0];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v14);
    }

    [(AXSpeakScreenButton *)v10 setAlpha:1.0];
    [(AXSpeakOverlayControlBar *)self bringSubviewToFront:v10];
    double v18 = [(AXSpeakOverlayControlBar *)self minimizedConstraints];
    +[NSLayoutConstraint activateConstraints:v18];
  }
  else
  {
    v19 = [(AXSpeakOverlayControlBar *)self minimizedConstraints];
    +[NSLayoutConstraint deactivateConstraints:v19];

    double v20 = self->_tabModeButton;
    id v21 = AXSpeakThisLocString(@"MINIMIZE");
    [(AXSpeakOverlayControlBar *)self _updateButton:v20 withImageName:@"chevron.backward" accessibilityLabel:v21];

    [(UILabel *)self->_headerLabel setAlpha:1.0];
    [(UIActivityIndicatorView *)self->_activityIndicatorView setAlpha:1.0];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v22 = [(AXSpeakOverlayControlBar *)self _buttons];
    id v23 = [v22 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) setAlpha:1.0];
        }
        id v24 = [v22 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v24);
    }

    id v10 = [(AXSpeakOverlayControlBar *)self maximizedConstraints];
    +[NSLayoutConstraint activateConstraints:v10];
  }

  [(AXSpeakOverlayControlBar *)self _updateAccessibilityElements];
  [(AXSpeakOverlayControlBar *)self _updateSpeedButtonTitle];
  [(AXSpeakOverlayControlBar *)self setNeedsLayout];
}

- (id)_buttons
{
  BOOL v3 = [(AXSpeakOverlayControlBar *)self _squareButtons];
  unsigned __int8 v4 = [(AXSpeakOverlayControlBar *)self _roundButtons];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)_squareButtons
{
  rewindButton = self->_rewindButton;
  v6[0] = self->_speakFingerButton;
  v6[1] = rewindButton;
  forwardButton = self->_forwardButton;
  v6[2] = self->_playPauseButton;
  v6[3] = forwardButton;
  v6[4] = self->_speedButton;
  unsigned __int8 v4 = +[NSArray arrayWithObjects:v6 count:5];

  return v4;
}

- (id)_roundButtons
{
  stopButton = self->_stopButton;
  v5[0] = self->_tabModeButton;
  v5[1] = stopButton;
  BOOL v3 = +[NSArray arrayWithObjects:v5 count:2];

  return v3;
}

- (void)_updateAccessibilityElements
{
  BOOL v3 = [(AXSpeakOverlayControlBar *)self stateManager];
  unsigned int v4 = [v3 inTabMode];

  if (v4)
  {
    tabModeButton = self->_tabModeButton;
    p_tabModeButton = &tabModeButton;
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = +[AXSettings sharedInstance];
    unsigned int v8 = [v7 showSpeechController];

    headerLabel = self->_headerLabel;
    if (v8)
    {
      speakFingerButton = self->_speakFingerButton;
      v18[0] = self->_tabModeButton;
      v18[1] = headerLabel;
      rewindButton = self->_rewindButton;
      v18[2] = speakFingerButton;
      v18[3] = rewindButton;
      forwardButton = self->_forwardButton;
      v18[4] = self->_playPauseButton;
      v18[5] = forwardButton;
      v18[6] = self->_speedButton;
      p_tabModeButton = (AXSpeakScreenButton **)v18;
      uint64_t v6 = 7;
    }
    else
    {
      v17[0] = self->_tabModeButton;
      v17[1] = headerLabel;
      id v13 = self->_speakFingerButton;
      v17[2] = self->_stopButton;
      v17[3] = v13;
      playPauseButton = self->_playPauseButton;
      v17[4] = self->_rewindButton;
      v17[5] = playPauseButton;
      speedButton = self->_speedButton;
      v17[6] = self->_forwardButton;
      v17[7] = speedButton;
      p_tabModeButton = (AXSpeakScreenButton **)v17;
      uint64_t v6 = 8;
    }
  }
  double v16 = +[NSArray arrayWithObjects:p_tabModeButton count:v6];
  [(AXSpeakOverlayControlBar *)self setAccessibilityElements:v16];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = [a3 nextFocusedView];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_13B00;
  v8[3] = &unk_28A98;
  v8[4] = self;
  uint64_t v6 = [v5 _accessibilityFindAncestor:v8 startWithSelf:1];

  if (v6 == self)
  {
    id v7 = [(AXSpeakOverlayControlBar *)self delegate];
    [v7 barDidReceiveFocus];
  }
}

- (AXSpeakOverlayControlBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXSpeakOverlayControlBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)minimizedConstraints
{
  return self->_minimizedConstraints;
}

- (void)setMinimizedConstraints:(id)a3
{
}

- (NSArray)maximizedConstraints
{
  return self->_maximizedConstraints;
}

- (void)setMaximizedConstraints:(id)a3
{
}

- (UITapGestureRecognizer)singleTapRecognizer
{
  return self->_singleTapRecognizer;
}

- (void)setSingleTapRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapRecognizer
{
  return self->_doubleTapRecognizer;
}

- (void)setDoubleTapRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
}

- (SpeakThisUIStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_maximizedConstraints, 0);
  objc_storeStrong((id *)&self->_minimizedConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_dragView, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_speedButton, 0);
  objc_storeStrong((id *)&self->_forwardButton, 0);
  objc_storeStrong((id *)&self->_rewindButton, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_speakFingerButton, 0);
  objc_storeStrong((id *)&self->_tabModeButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);

  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
}

@end