@interface PHSlidingButton
- (BOOL)isButtonLayoutEnabled;
- (CGSize)intrinsicContentSize;
- (NSString)endDialImageName;
- (PHActionSlider)acceptButton;
- (PHSlidingButton)initWithSlidingButtonType:(int)a3 appearanceType:(int)a4;
- (PHSlidingButton)initWithSlidingButtonType:(int)a3 appearanceType:(int)a4 callState:(int64_t)a5;
- (PHSlidingButtonDelegateProtocol)delegate;
- (UIButton)sideButtonRight;
- (UIImageView)dialImageView;
- (double)knobWidth;
- (int)type;
- (int64_t)callState;
- (void)actionSlider:(id)a3 didUpdateSlideWithValue:(double)a4;
- (void)actionSliderDidCompleteSlide:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAcceptButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialImageView:(id)a3;
- (void)setKnobWidth:(double)a3;
- (void)setSideButtonRight:(id)a3;
- (void)setType:(int)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation PHSlidingButton

- (PHSlidingButton)initWithSlidingButtonType:(int)a3 appearanceType:(int)a4
{
  return [(PHSlidingButton *)self initWithSlidingButtonType:*(void *)&a3 appearanceType:*(void *)&a4 callState:2];
}

- (PHSlidingButton)initWithSlidingButtonType:(int)a3 appearanceType:(int)a4 callState:(int64_t)a5
{
  v59.receiver = self;
  v59.super_class = (Class)PHSlidingButton;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[PHSlidingButton initWithFrame:](&v59, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (!v11) {
    return v12;
  }
  v11->_type = a3;
  v11->_callState = a5;
  if (a5 == 1) {
    v13 = @"end_call_voip";
  }
  else {
    v13 = @"phone_dial";
  }
  objc_storeStrong((id *)&v11->_endDialImageName, v13);
  if ((a3 - 7) >= 3) {
    uint64_t v14 = (id)+[PHUIConfiguration inCallSlideToAnswerSize] == (id)3
  }
       || [(PHSlidingButton *)v12 isButtonLayoutEnabled];
  else {
    uint64_t v14 = 0;
  }
  v15 = sub_1000D5130();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    int v61 = a3;
    __int16 v62 = 1024;
    int v63 = a4;
    __int16 v64 = 1024;
    int v65 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Making slider with type: %d, appearance: %d, large: %d", buf, 0x14u);
  }

  if (a4)
  {
    if (a4 == 1)
    {
      v16 = +[UIColor blueColor];
      uint64_t v17 = 1;
      v18 = +[_UILegibilitySettings sharedInstanceForStyle:1];
      v19 = +[_UIVibrantSettings vibrantSettingsWithReferenceColor:v16 referenceContrast:v18 legibilitySettings:0.3];

      v20 = -[PHActionSlider initWithFrame:vibrantSettings:large:]([PHActionSlider alloc], "initWithFrame:vibrantSettings:large:", v19, v14, CGRectZero.origin.x, y, width, height);
      acceptButton = v12->_acceptButton;
      v12->_acceptButton = v20;

      if ((a3 - 1) <= 5) {
        uint64_t v17 = qword_100284C78[a3 - 1];
      }
      [(PHActionSlider *)v12->_acceptButton setStyle:v17];
    }
  }
  else
  {
    v22 = -[PHActionSlider initWithFrame:vibrantSettings:large:]([PHActionSlider alloc], "initWithFrame:vibrantSettings:large:", 0, v14, CGRectZero.origin.x, y, width, height);
    v23 = v12->_acceptButton;
    v12->_acceptButton = v22;

    [(PHActionSlider *)v12->_acceptButton setStyle:3];
    v24 = +[UIColor colorWithWhite:1.0 alpha:0.200000003];
    [(PHActionSlider *)v12->_acceptButton setBackgroundColor:v24];
  }
  [(PHActionSlider *)v12->_acceptButton setDragStyle:1];
  [(PHActionSlider *)v12->_acceptButton setTextStyle:1];
  if (v12->_callState == 1) {
    +[PHBottomBarButtonConfiguration voipTintColor];
  }
  else {
  v25 = +[PHBottomBarButtonConfiguration systemTintColor];
  }
  if (v12->_callState == 1)
  {
    v26 = +[UIImage imageNamed:@"phone_slide_voip"];
    v27 = [v26 imageWithRenderingMode:2];
  }
  else
  {
    v27 = +[UIImage tpImageForSymbolType:1 textStyle:UIFontTextStyleLargeTitle scale:2 isStaticSize:1];
  }
  if (a3 == 7)
  {
    v28 = +[UIImage imageNamed:@"sos-slider-button"];
    v29 = [v28 imageWithRenderingMode:2];
    [(PHActionSlider *)v12->_acceptButton setKnobImage:v29];

    v30 = +[UIColor whiteColor];
    [(PHActionSlider *)v12->_acceptButton setTintColor:v30];

    v31 = +[UIColor systemRedColor];
    [(PHActionSlider *)v12->_acceptButton setKnobColor:v31];

    [(PHActionSlider *)v12->_acceptButton setTextStyle:2];
    [(PHActionSlider *)v12->_acceptButton setDragStyle:2];
  }
  else
  {
    if (a3 == 9)
    {
      v35 = +[UIImage imageNamed:@"medicalid-slider-button"];
      v36 = [v35 imageWithRenderingMode:2];
      [(PHActionSlider *)v12->_acceptButton setKnobImage:v36];

      v37 = +[UIColor systemRedColor];
      [(PHActionSlider *)v12->_acceptButton setTintColor:v37];

      [(PHActionSlider *)v12->_acceptButton setTextStyle:2];
    }
    else
    {
      if (a3 != 8)
      {
        [(PHActionSlider *)v12->_acceptButton setKnobImage:v27];
        if (v12->_callState != 1)
        {
          [(PHActionSlider *)v12->_acceptButton knobImageOffset];
          double v40 = v39;
          [(PHActionSlider *)v12->_acceptButton knobImageOffset];
          -[PHActionSlider setKnobImageOffset:](v12->_acceptButton, "setKnobImageOffset:", v40, v41 + 2.0);
        }
        [(PHActionSlider *)v12->_acceptButton setTintColor:v25];
        goto LABEL_34;
      }
      v32 = +[UIImage imageNamed:@"powerdown-slider-button"];
      v33 = [v32 imageWithRenderingMode:2];
      [(PHActionSlider *)v12->_acceptButton setKnobImage:v33];

      v34 = +[UIColor redColor];
      [(PHActionSlider *)v12->_acceptButton setTintColor:v34];
    }
    v38 = +[UIColor whiteColor];
    [(PHActionSlider *)v12->_acceptButton setKnobColor:v38];
  }
LABEL_34:
  [(PHActionSlider *)v12->_acceptButton setDelegate:v12];
  v42 = +[UIScreen mainScreen];
  v43 = [v42 currentMode];
  [v43 size];
  if (v44 >= 2208.0)
  {
    unsigned __int8 v45 = [(PHSlidingButton *)v12 isButtonLayoutEnabled];

    if ((v45 & 1) == 0)
    {
      [(PHActionSlider *)v12->_acceptButton trackSize];
      [(PHActionSlider *)v12->_acceptButton setTrackSize:300.0];
    }
  }
  else
  {
  }
  if ((a3 - 5) > 1)
  {
    if (a3 == 7)
    {
      v46 = +[NSBundle mainBundle];
      v47 = v46;
      CFStringRef v48 = @"SLIDE_TO_SOS";
    }
    else if (a3 == 9)
    {
      v46 = +[NSBundle mainBundle];
      v47 = v46;
      CFStringRef v48 = @"MEDICAL_ID";
    }
    else
    {
      v46 = +[NSBundle mainBundle];
      v47 = v46;
      if (a3 == 8) {
        CFStringRef v48 = @"POWER_OFF";
      }
      else {
        CFStringRef v48 = @"SLIDE_TO_ANSWER";
      }
    }
  }
  else
  {
    v46 = +[NSBundle mainBundle];
    v47 = v46;
    CFStringRef v48 = @"SLIDE_TO_UNLOCK";
  }
  v49 = [v46 localizedStringForKey:v48 value:&stru_1002D6110 table:@"BottomBar"];

  [(PHActionSlider *)v12->_acceptButton setTrackText:v49];
  v50 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v27];
  dialImageView = v12->_dialImageView;
  v12->_dialImageView = v50;

  v52 = +[UIColor whiteColor];
  [(UIImageView *)v12->_dialImageView setTintColor:v52];

  uint64_t v53 = +[UIButton buttonWithType:0];
  sideButtonRight = v12->_sideButtonRight;
  v12->_sideButtonRight = (UIButton *)v53;

  v55 = v12->_sideButtonRight;
  v56 = +[UIColor whiteColor];
  [(UIButton *)v55 setBackgroundColor:v56];

  v57 = [(UIButton *)v12->_sideButtonRight layer];
  [v57 setCornerRadius:33.0];

  [(UIButton *)v12->_sideButtonRight setUserInteractionEnabled:0];
  [(UIImageView *)v12->_dialImageView setClipsToBounds:0];
  [(UIImageView *)v12->_dialImageView setContentMode:4];
  [(PHActionSlider *)v12->_acceptButton setAlpha:1.0];
  [(PHSlidingButton *)v12 addSubview:v12->_acceptButton];

  return v12;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)PHSlidingButton;
  [(PHSlidingButton *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PHSlidingButton;
  [(PHSlidingButton *)&v3 layoutSubviews];
  [(PHSlidingButton *)self bounds];
  -[PHActionSlider setFrame:](self->_acceptButton, "setFrame:");
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHSlidingButton *)self isUserInteractionEnabled] != a3)
  {
    double v5 = 0.0500000007;
    if (v3) {
      double v5 = 1.0;
    }
    [(PHSlidingButton *)self setAlpha:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)PHSlidingButton;
  [(PHSlidingButton *)&v6 setUserInteractionEnabled:v3];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(PHSlidingButton *)self acceptButton];
  [v2 trackSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (double)knobWidth
{
  v2 = [(PHSlidingButton *)self acceptButton];
  [v2 knobWidth];
  double v4 = v3;

  return v4;
}

- (BOOL)isButtonLayoutEnabled
{
  v2 = +[TUCallCenter sharedInstance];
  double v3 = [v2 frontmostAudioOrVideoCall];

  double v4 = +[CNKFeatures sharedInstance];
  if ([v4 isButtonLayoutEnabled]) {
    unsigned int v5 = [v3 isVideo] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)actionSlider:(id)a3 didUpdateSlideWithValue:(double)a4
{
  uint64_t v6 = [(PHSlidingButton *)self delegate];
  if (v6)
  {
    double v7 = (void *)v6;
    double v8 = [(PHSlidingButton *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(PHSlidingButton *)self delegate];
      [v10 slidingButton:self didSlideToProportion:a4];
    }
  }
}

- (void)actionSliderDidCompleteSlide:(id)a3
{
  uint64_t v4 = [(PHSlidingButton *)self delegate];
  if (v4)
  {
    unsigned int v5 = (void *)v4;
    uint64_t v6 = [(PHSlidingButton *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = [(PHSlidingButton *)self delegate];
      [v8 willFinishSlideForSlidingButton:self];
    }
  }
  unsigned int type = self->_type;
  BOOL v10 = type > 9;
  int v11 = (1 << type) & 0x390;
  if (v10 || v11 == 0)
  {
    BOOL v13 = (id)[(PHSlidingButton *)self callState] == (id)2
       || (id)[(PHSlidingButton *)self callState] == (id)4;
    acceptButton = self->_acceptButton;
    [(PHActionSlider *)acceptButton knobRect];
    -[PHActionSlider convertRect:toView:](acceptButton, "convertRect:toView:", self);
    -[UIButton setFrame:](self->_sideButtonRight, "setFrame:");
    [(UIButton *)self->_sideButtonRight center];
    double v16 = v15;
    [(UIButton *)self->_sideButtonRight center];
    double v18 = v17;
    [(PHActionSlider *)self->_acceptButton knobImageOffset];
    -[UIImageView setCenter:](self->_dialImageView, "setCenter:", v16, v18 + v19);
    [(PHSlidingButton *)self insertSubview:self->_dialImageView above:self->_sideButtonRight];
    [(PHSlidingButton *)self insertSubview:self->_sideButtonRight above:self->_acceptButton];
    v20 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    [v20 setFromValue:&off_1002DF948];
    [v20 setToValue:&off_1002DF958];
    [v20 setDuration:0.115000002];
    [v20 setFillMode:kCAFillModeForwards];
    v80 = v20;
    [v20 setRemovedOnCompletion:0];
    v21 = [(PHSlidingButton *)self acceptButton];
    v22 = [v21 layer];
    [v22 position];
    v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    v83 = +[CASpringAnimation animationWithKeyPath:@"position.x"];
    v24 = self->_acceptButton;
    if (self->_type == 3)
    {
      [(PHActionSlider *)v24 layer];
      v26 = v25 = v23;
      [v26 position];
      double v28 = v27 + -3.0;

      v23 = v25;
    }
    else
    {
      [(PHActionSlider *)v24 knobRect];
      double v30 = v29;
      [(PHActionSlider *)self->_acceptButton center];
      double v28 = v30 - v31;
    }
    if ([(PHSlidingButton *)self _shouldReverseLayoutDirection])
    {
      [v23 doubleValue];
      double v28 = v32 - v28;
    }
    [v83 setMass:2.0];
    [v83 setStiffness:300.0];
    [v83 setDamping:50.0];
    v79 = v23;
    [v83 setFromValue:v23];
    v33 = +[NSNumber numberWithDouble:v28];
    [v83 setToValue:v33];

    [v83 setDuration:0.50999999];
    [v83 setFillMode:kCAFillModeForwards];
    [v83 setRemovedOnCompletion:0];
    if (v13)
    {
      v34 = +[CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
      [v34 setMass:2.0];
      [v34 setStiffness:300.0];
      [v34 setDamping:50.0];
      [v34 setToValue:&off_1002DFA08];
      [v34 setDuration:0.50999999];
      [v34 setFillMode:kCAFillModeForwards];
      v81 = v34;
      [v34 setRemovedOnCompletion:0];
    }
    else
    {
      v35 = +[CABasicAnimation animationWithKeyPath:@"contents"];
      [v35 setDuration:0.300000012];
      v36 = [(UIImageView *)self->_dialImageView image];
      v37 = +[UIColor whiteColor];
      id v38 = [v36 _flatImageWithColor:v37];
      [v35 setFromValue:[v38 CGImage]];

      id v39 = +[PHBottomBarButtonConfiguration imageForAction:15 callState:1];
      [v35 setToValue:[v39 CGImage]];

      [v35 setRemovedOnCompletion:0];
      v81 = v35;
      [v35 setFillMode:kCAFillModeForwards];
    }
    if (self->_type == 3)
    {
      +[PHBottomBar defaultSideMarginForDoubleButton];
      double v41 = v40;
      +[PHBottomBarButtonConfiguration defaultWidth];
      double v43 = v41 + v42 * 0.5;
      [(PHSlidingButton *)self frame];
      double v45 = floor(v43 - v44);
    }
    else
    {
      [(PHSlidingButton *)self bounds];
      double v45 = v46 * 0.5;
    }
    unsigned int v47 = [(PHSlidingButton *)self _shouldReverseLayoutDirection];
    double v48 = -1.0;
    if (v47) {
      double v48 = 1.0;
    }
    double v49 = v45 + v48;
    v50 = [(PHSlidingButton *)self sideButtonRight];
    v51 = [v50 layer];
    [v51 position];
    v78 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    v82 = +[CASpringAnimation animationWithKeyPath:@"position.x"];
    [v82 setMass:2.0];
    [v82 setStiffness:300.0];
    [v82 setDamping:50.0];
    [v82 setFromValue:v78];
    v52 = +[NSNumber numberWithDouble:v49];
    [v82 setToValue:v52];

    [v82 setDuration:0.50999999];
    [v82 setFillMode:kCAFillModeForwards];
    [v82 setRemovedOnCompletion:0];
    uint64_t v53 = [(PHSlidingButton *)self dialImageView];
    v54 = [v53 layer];
    [v54 position];
    v77 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    v55 = +[CASpringAnimation animationWithKeyPath:@"position.x"];
    [v55 setMass:2.0];
    [v55 setStiffness:300.0];
    [v55 setDamping:50.0];
    [v55 setFromValue:v77];
    v56 = +[NSNumber numberWithDouble:v49];
    [v55 setToValue:v56];

    [v55 setDuration:0.50999999];
    [v55 setFillMode:kCAFillModeForwards];
    [v55 setRemovedOnCompletion:0];
    v57 = +[CABasicAnimation animationWithKeyPath:@"bounds"];
    +[PHBottomBarButtonConfiguration defaultHeight];
    double v59 = v58;
    +[PHBottomBarButtonConfiguration defaultHeight];
    int v61 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", 0.0, 0.0, v59, v60);
    [v57 setToValue:v61];

    [v57 setDuration:0.150000006];
    [v57 setFillMode:kCAFillModeForwards];
    [v57 setRemovedOnCompletion:0];
    +[PHBottomBarButtonConfiguration defaultHeight];
    double v63 = v62 * 0.5;
    __int16 v64 = [(UIButton *)self->_sideButtonRight layer];
    [v64 setCornerRadius:v63];

    int v65 = +[CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    [v65 setDuration:0.144999996];
    id v66 = +[UIColor whiteColor];
    [v65 setFromValue:[v66 CGColor]];

    id v67 = +[UIColor systemRedColor];
    [v65 setToValue:[v67 CGColor]];

    [v65 setFillMode:kCAFillModeForwards];
    [v65 setRemovedOnCompletion:0];
    v68 = +[CATransition animation];
    [v68 setType:kCATransitionFade];
    [v68 setDuration:0.115000002];
    +[CATransaction begin];
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_10006E9C0;
    v84[3] = &unk_1002CD518;
    v84[4] = self;
    +[CATransaction setCompletionBlock:v84];
    v69 = [(UIImageView *)self->_dialImageView layer];
    [v69 addAnimation:v68 forKey:kCATransition];

    v70 = [(UIButton *)self->_sideButtonRight layer];
    [v70 addAnimation:v65 forKey:@"backgroundColor"];

    v71 = [(UIButton *)self->_sideButtonRight layer];
    [v71 addAnimation:v57 forKey:@"bounds"];

    v72 = [(UIButton *)self->_sideButtonRight layer];
    [v72 addAnimation:v82 forKey:@"position"];

    v73 = [(UIImageView *)self->_dialImageView layer];
    [v73 addAnimation:v81 forKey:@"transform"];

    v74 = [(PHActionSlider *)self->_acceptButton layer];
    [v74 addAnimation:v80 forKey:@"opacity"];

    v75 = [(PHActionSlider *)self->_acceptButton layer];
    [v75 addAnimation:v83 forKey:@"position"];

    v76 = [(UIImageView *)self->_dialImageView layer];
    [v76 addAnimation:v55 forKey:@"position"];

    +[CATransaction commit];
  }
  else
  {
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_10006E904;
    v86[3] = &unk_1002CD518;
    v86[4] = self;
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_10006E910;
    v85[3] = &unk_1002CD540;
    v85[4] = self;
    +[UIView animateWithDuration:v86 animations:v85 completion:0.300000012];
  }
}

- (PHActionSlider)acceptButton
{
  return (PHActionSlider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAcceptButton:(id)a3
{
}

- (UIButton)sideButtonRight
{
  return (UIButton *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSideButtonRight:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_unsigned int type = a3;
}

- (PHSlidingButtonDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHSlidingButtonDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setKnobWidth:(double)a3
{
  self->_knobWidth = a3;
}

- (UIImageView)dialImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDialImageView:(id)a3
{
}

- (int64_t)callState
{
  return self->_callState;
}

- (NSString)endDialImageName
{
  return self->_endDialImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDialImageName, 0);
  objc_storeStrong((id *)&self->_dialImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sideButtonRight, 0);

  objc_storeStrong((id *)&self->_acceptButton, 0);
}

@end