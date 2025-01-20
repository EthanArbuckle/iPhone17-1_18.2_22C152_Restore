@interface CBRecordingIndicatorViewController
- (BOOL)_canShowWhileLocked;
- (CBRecordingIndicatorView)indicatorView;
- (CBRecordingIndicatorViewControllerDelegate)delegate;
- (UIColor)indicatorColor;
- (UIView)indicatorContainerView;
- (id)initForLocation:(unint64_t)a3;
- (int64_t)activeInterfaceOrientation;
- (unint64_t)indicatorState;
- (unint64_t)location;
- (unint64_t)supportedInterfaceOrientations;
- (void)setActiveInterfaceOrientation:(int64_t)a3 withDuration:(double)a4;
- (void)setDelegate:(id)a3;
- (void)setIndicatorColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateIndicatorType:(unint64_t)a3;
- (void)updateIndicatorVisibility:(BOOL)a3;
- (void)updateIndicatorVisibilityWithFastFadeAnimation:(BOOL)a3;
@end

@implementation CBRecordingIndicatorViewController

- (id)initForLocation:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CBRecordingIndicatorViewController;
  v4 = [(CBRecordingIndicatorViewController *)&v12 init];
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    v4->_location = a3;
    v4->_activeInterfaceOrientation = 1;
    v4->_indicatorState = 0;
    v6 = [(CBRecordingIndicatorViewController *)v4 view];
    v7 = objc_alloc_init(CBRecordingIndicatorView);
    [(CBRecordingIndicatorView *)v7 setAutoresizingMask:0];
    objc_storeStrong((id *)(v5 + 144), v7);
    if ([(id)v5 location] == (id)2 || *(unsigned char *)(v5 + 120) && !objc_msgSend((id)v5, "location"))
    {
      id v8 = objc_alloc_init((Class)UIView);
      v9 = *(void **)(v5 + 136);
      *(void *)(v5 + 136) = v8;
      id v10 = v8;

      [v6 addSubview:v10];
      [v10 addSubview:v7];

      if (!a3)
      {
LABEL_8:
        sub_100009ADC((id *)v5);
        *(unsigned char *)(v5 + 120) = +[CBRecordingIndicatorManager _supportsSecureIndicator];
      }
    }
    else
    {
      [v6 addSubview:v7];
      if (!a3) {
        goto LABEL_8;
      }
    }
    sub_100009DB4(v5);
  }
  return (id)v5;
}

- (void)setIndicatorColor:(id)a3
{
  p_indicatorColor = &self->_indicatorColor;
  objc_storeStrong((id *)&self->_indicatorColor, a3);
  id v7 = a3;
  v6 = [(CBRecordingIndicatorViewController *)self indicatorView];
  [v6 setBackgroundColor:*p_indicatorColor];

  [(CASecureIndicatorLayer *)self->_contentLayer setBackgroundColor:[(UIColor *)*p_indicatorColor cgColor]];
}

- (void)setActiveInterfaceOrientation:(int64_t)a3 withDuration:(double)a4
{
}

- (void)updateIndicatorType:(unint64_t)a3
{
  if (a3) {
    +[UIColor systemOrangeColor];
  }
  else {
  uint64_t v5 = +[UIColor systemGreenColor];
  }
  [(CBRecordingIndicatorViewController *)self setIndicatorColor:v5];
  v6 = [(CBRecordingIndicatorViewController *)self indicatorView];
  [v6 setIndicatorType:a3];

  id v7 = sub_10001C9C0((id)a3);
  id v8 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    objc_super v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] updating secure indicator type for layer-dot to %@", (uint8_t *)&v11, 0xCu);
  }

  [(CASecureIndicatorLayer *)self->_contentLayer setPrivacyIndicatorType:v7];
  BOOL v9 = sub_10001CA04(a3);
  double v10 = 0.0;
  if (v9) {
    double v10 = self->_size * 0.5;
  }
  [(CASecureIndicatorLayer *)self->_contentLayer setCornerRadius:v10];
}

- (void)updateIndicatorVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self)
  {
    uint64_t v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        CFStringRef v6 = @"on";
      }
      else {
        CFStringRef v6 = @"off";
      }
      id v7 = [0 location];
      id v8 = @"Standalone";
      if (v7 == (id)1) {
        id v8 = @"StatusBar";
      }
      if (v7 == (id)2) {
        id v8 = @"SystemAperture";
      }
      BOOL v9 = v8;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v6;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (normal animation)", buf, 0x16u);
    }
    sub_10000B8D8(0);
    *(void *)buf = 0;
    id v10 = objc_alloc((Class)UIViewPropertyAnimator);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000B998;
    v11[3] = &unk_100079608;
    objc_copyWeak(&v12, (id *)buf);
    [v10 initWithDuration:0 curve:v11 animations:0.7];
    __break(1u);
  }
  if ((id)[(CBRecordingIndicatorViewController *)self location] == (id)2
    || self->_isSecure && ![(CBRecordingIndicatorViewController *)self location])
  {
    sub_10000B41C((uint64_t)self, v3);
  }
  else
  {
    [(CBRecordingIndicatorViewController *)self updateIndicatorVisibilityWithFastFadeAnimation:v3];
  }
}

- (void)updateIndicatorVisibilityWithFastFadeAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      CFStringRef v6 = @"on";
    }
    else {
      CFStringRef v6 = @"off";
    }
    unint64_t v7 = [(CBRecordingIndicatorViewController *)self location];
    id v8 = @"Standalone";
    if (v7 == 1) {
      id v8 = @"StatusBar";
    }
    if (v7 == 2) {
      id v8 = @"SystemAperture";
    }
    BOOL v9 = v8;
    *(_DWORD *)buf = 138543618;
    CFStringRef v26 = v6;
    __int16 v27 = 2114;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (fast fade animation)", buf, 0x16u);
  }
  sub_10000B8D8((id *)&self->super.super.super.isa);
  if (v3)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000BDFC;
    v24[3] = &unk_1000794E0;
    v24[4] = self;
    id v10 = (UIViewPropertyAnimator *)[objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:0 curve:v24 animations:0.2];
    animatorFastFade = self->_animatorFastFade;
    self->_animatorFastFade = v10;

    objc_initWeak((id *)buf, self);
    id v12 = self->_animatorFastFade;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000BE48;
    v22[3] = &unk_1000796F8;
    objc_copyWeak(&v23, (id *)buf);
    v22[4] = self;
    [(UIViewPropertyAnimator *)v12 addCompletion:v22];
    sub_10000A4D0(self, 1);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (self)
    {
      unint64_t v13 = [(CBRecordingIndicatorViewController *)self location];
      if (v13 != 2 && (v13 || !self->_isSecure))
      {
        sub_10000AA40((id *)&self->super.super.super.isa, 0.0, 0.0);
        double size = self->_size;
        double v15 = 0.8;
        if (self->_isSecure) {
          double v15 = 1.0;
        }
        else {
          double size = size * 0.8;
        }
        sub_10000AB3C((uint64_t)self, size, v15);
      }
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000BFA4;
    v21[3] = &unk_1000794E0;
    v21[4] = self;
    v16 = (UIViewPropertyAnimator *)[objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:0 curve:v21 animations:0.2];
    v17 = self->_animatorFastFade;
    self->_animatorFastFade = v16;

    objc_initWeak((id *)buf, self);
    v18 = self->_animatorFastFade;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000BFB4;
    v19[3] = &unk_1000796D0;
    objc_copyWeak(&v20, (id *)buf);
    [(UIViewPropertyAnimator *)v18 addCompletion:v19];
    sub_10000A4D0(self, 3);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  [(UIViewPropertyAnimator *)self->_animatorFastFade startAnimation];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  v4 = [(CBRecordingIndicatorViewController *)self traitCollection];
  id v5 = [v4 _backlightLuminance];
  if (v5 != [v6 _backlightLuminance]) {
    sub_10000C464(self, (uint64_t)v5, (uint64_t)[v6 _backlightLuminance]);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (UIView)indicatorContainerView
{
  return self->_indicatorContainerView;
}

- (CBRecordingIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (UIColor)indicatorColor
{
  return self->_indicatorColor;
}

- (unint64_t)indicatorState
{
  return self->_indicatorState;
}

- (int64_t)activeInterfaceOrientation
{
  return self->_activeInterfaceOrientation;
}

- (CBRecordingIndicatorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CBRecordingIndicatorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indicatorColor, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_indicatorContainerView, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_animatorSpringToOff, 0);
  objc_storeStrong((id *)&self->_animatorSpringToOn, 0);
  objc_storeStrong((id *)&self->_animatorFastFade, 0);
  objc_storeStrong((id *)&self->_animatorScaleToZero, 0);
  objc_storeStrong((id *)&self->_animatorScaleToRest, 0);
  objc_storeStrong((id *)&self->_animatorScaleToNormal, 0);

  objc_storeStrong((id *)&self->_animatorScaleToOverscale, 0);
}

@end