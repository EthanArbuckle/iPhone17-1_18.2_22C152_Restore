@interface FaceIdToastViewController
+ (unsigned)newInstanceId;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isCollapsingFromFullExpansion;
- (BOOL)_isEarlyExpansion;
- (BOOL)_isSuccessfulState:(int64_t)a3;
- (BOOL)lightweightUI;
- (BOOL)toastBackdropEnabled;
- (CGSize)_lightweightJindoContainerSize;
- (CGSize)_lightweightJindoContentSizeForExpansion:(int64_t)a3;
- (CGVector)_lightweightJindoContentShiftOnLeading:(BOOL)a3;
- (FaceIdToastViewController)initWithGlyph:(id)a3 presentingController:(id)a4 title:(id)a5 lightweightUIMode:(int64_t)a6;
- (NSString)titleText;
- (TransitionViewController)presentingTransitionViewController;
- (double)_remainingMinDisplayTime;
- (id)_backdropRenderingHintColor;
- (id)_centeringAnchorWithObstructedLayoutGuide:(id)a3;
- (id)_descriptionOfGlyphState:(int64_t)a3;
- (id)_glyphAnchorWithObstructedLayoutGuide:(id)a3;
- (id)_toastViewContraints;
- (id)_updateConstraint:(id)a3 ofView:(id)a4 anchor1:(id)a5 anchor2:(id)a6 constant:(double)a7;
- (id)description;
- (id)keyColor;
- (id)leadingView;
- (id)minimalView;
- (id)trailingView;
- (int)_preferredStatusBarVisibility;
- (int64_t)_interfaceOrientationFromObstructedArea:(CGRect)a3;
- (int64_t)_leadingViewStateFromGlyphState:(int64_t)a3;
- (int64_t)_lightweightJindoExpansion;
- (int64_t)_lightweightJindoExpansionForState:(int64_t)a3;
- (int64_t)_trailingViewStateForGlyphState:(int64_t)a3;
- (int64_t)activeLayoutMode;
- (int64_t)glyphState;
- (int64_t)lightweightUIMode;
- (int64_t)preferredCustomLayout;
- (unsigned)instanceId;
- (void)_adjustToastSizeForAccessibilityIfNeeded;
- (void)_anchorToastViewToView:(id)a3;
- (void)_dispatchTapBlock:(id)a3;
- (void)_setBackdropEnabled:(BOOL)a3;
- (void)_setBackdropEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_setTransformScale:(BOOL)a3;
- (void)_setupGlyphLabel;
- (void)_setupGlyphWrapper:(BOOL)a3;
- (void)_setupLightweightViews;
- (void)_setupSubviews;
- (void)_setupToastBackdropAndVibrancyView;
- (void)_setupToastView;
- (void)_shrinkAndRevokeWithCompletion:(id)a3;
- (void)_toastAnimationFadeIn:(BOOL)a3 finished:(BOOL)a4;
- (void)_updateGlyphConstraints;
- (void)_updateLightweightConstraints;
- (void)_updateLightweightConstraintsWithCoordinatedAnimations;
- (void)_updateLightweightContentSize;
- (void)dismissWithDelay:(double)a3 completion:(id)a4;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setGlyphState:(int64_t)a3 animated:(BOOL)a4;
- (void)setTitleText:(id)a3;
- (void)setToastBackdropEnabled:(BOOL)a3;
- (void)shake;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateGlyphConstraintsIfOrientationChanged;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation FaceIdToastViewController

- (FaceIdToastViewController)initWithGlyph:(id)a3 presentingController:(id)a4 title:(id)a5 lightweightUIMode:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = +[UIDevice currentDevice];
  self->_iPad = [v13 userInterfaceIdiom] == (id)1;

  v19.receiver = self;
  v19.super_class = (Class)FaceIdToastViewController;
  v14 = [(FaceIdToastViewController *)&v19 initWithNibName:0 bundle:0];
  if (v14)
  {
    v14->_instanceId = +[FaceIdToastViewController newInstanceId];
    v14->_lightweightUIMode = a6;
    [(PresentationViewController *)v14 setGlyphView:v10];
    objc_storeStrong((id *)&v14->_titleText, a5);
    objc_storeWeak((id *)&v14->_presentingTransitionViewController, v11);
    [(FaceIdToastViewController *)v14 setModalPresentationStyle:6];
    v15 = [(FaceIdToastViewController *)v14 presentationController];
    [v15 _setContainerIgnoresDirectTouchEvents:1];

    v18 = v14;
    if ([(FaceIdToastViewController *)v18 lightweightUI]) {
      double v16 = 56.0;
    }
    else {
      double v16 = dbl_10006BA50[!v18->_iPad];
    }
    v14->_toastViewSize.width = v16;
    v14->_toastViewSize.height = v16;
  }
  return v14;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"%@[%u]", v4, [(FaceIdToastViewController *)self instanceId]];

  return v5;
}

+ (unsigned)newInstanceId
{
  return ++dword_10009E2B8;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)FaceIdToastViewController;
  [(PresentationViewController *)&v6 viewDidLoad];
  v3 = [(FaceIdToastViewController *)self view];
  [v3 setUserInteractionEnabled:1];

  v4 = +[UIColor clearColor];
  v5 = [(FaceIdToastViewController *)self view];
  [v5 setBackgroundColor:v4];

  [(FaceIdToastViewController *)self _setupSubviews];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)FaceIdToastViewController;
  [(FaceIdToastViewController *)&v11 viewDidAppear:a3];
  if (![(PresentationViewController *)self isDynamicIslandAvailable])
  {
    v4 = LACLogFaceIDUI();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Face ID glyph will appear", (uint8_t *)buf, 2u);
    }

    if (self->_iPad && ![(FaceIdToastViewController *)self lightweightUI])
    {
      v5 = [(PresentationViewController *)self glyphView];
      [v5 setState:1 animated:1];
    }
    else
    {
      objc_initWeak(buf, self);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10001ECF4;
      v8[3] = &unk_1000860D8;
      objc_copyWeak(&v9, buf);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10001ED3C;
      v6[3] = &unk_100086958;
      objc_copyWeak(&v7, buf);
      +[UIView animateWithDuration:0x10000 delay:v8 options:v6 animations:0.2 completion:0.0];
      objc_destroyWeak(&v7);
      objc_destroyWeak(&v9);
      objc_destroyWeak(buf);
    }
  }
}

- (void)_toastAnimationFadeIn:(BOOL)a3 finished:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    objc_super v6 = LACLogFaceIDUI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = @"fade-out";
      if (v4) {
        CFStringRef v7 = @"fade-in";
      }
      int v13 = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      CFStringRef v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ has finished %{public}@ animation", (uint8_t *)&v13, 0x16u);
    }

    if (v4)
    {
      v8 = [(PresentationViewController *)self glyphView];
      id v9 = [v8 state];

      if (!v9)
      {
        id v10 = [(PresentationViewController *)self glyphView];
        [v10 setState:1 animated:1];
      }
    }
  }
  else
  {
    if (a3)
    {
      [(FaceIdToastViewController *)self _setTransformScale:0];
      [(UIView *)self->_toastView setAlpha:1.0];
      glyphWrapper = self->_glyphWrapper;
      double v12 = 1.0;
    }
    else
    {
      [(FaceIdToastViewController *)self _setTransformScale:1];
      glyphWrapper = self->_toastView;
      double v12 = 0.0;
    }
    [glyphWrapper setAlpha:v12];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)FaceIdToastViewController;
  [(FaceIdToastViewController *)&v10 viewWillDisappear:a3];
  if (![(PresentationViewController *)self isDynamicIslandAvailable])
  {
    BOOL v4 = LACLogFaceIDUI();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Face ID glyph will disappear", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001F0F8;
    v7[3] = &unk_1000860D8;
    objc_copyWeak(&v8, buf);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001F140;
    v5[3] = &unk_100086958;
    objc_copyWeak(&v6, buf);
    +[UIView animateWithDuration:0x20000 delay:v7 options:v5 animations:0.2 completion:0.0];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FaceIdToastViewController;
  [(FaceIdToastViewController *)&v4 traitCollectionDidChange:a3];
  [(FaceIdToastViewController *)self _adjustToastSizeForAccessibilityIfNeeded];
}

- (void)setTitleText:(id)a3
{
}

- (void)dismissWithDelay:(double)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  [(FaceIdToastViewController *)self _remainingMinDisplayTime];
  if (v7 > a3)
  {
    double v8 = v7;
    id v9 = LACLogFaceIDUI();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      __int16 v25 = 2048;
      double v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remaining secure UI delay for %{public}@ is %.3f", buf, 0x16u);
    }

    a3 = v8;
  }
  objc_initWeak((id *)buf, self);
  if ([(PresentationViewController *)self isDynamicIslandAvailable])
  {
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F4F4;
    block[3] = &unk_1000862F8;
    objc_super v11 = &v22;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v6;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

LABEL_10:
    objc_destroyWeak(v11);
    goto LABEL_13;
  }
  if ([(FaceIdToastViewController *)self isViewLoaded])
  {
    double v12 = [(FaceIdToastViewController *)self view];
    int v13 = [v12 window];
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10001F544;
      v18[3] = &unk_1000860D8;
      objc_super v11 = &v19;
      objc_copyWeak(&v19, (id *)buf);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10001F5F4;
      v15[3] = &unk_100086980;
      objc_copyWeak(&v17, (id *)buf);
      CFStringRef v16 = v6;
      +[UIView animateWithDuration:2 delay:v18 options:v15 animations:0.2 completion:a3];

      objc_destroyWeak(&v17);
      goto LABEL_10;
    }
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_13:
  objc_destroyWeak((id *)buf);
}

- (double)_remainingMinDisplayTime
{
  v3 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper glyphView];

  if (v3)
  {
    objc_super v4 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper glyphView];
    v5 = [v4 remainingMinDisplayTimeInterval];
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    lightweightTrailingView = self->_lightweightTrailingView;
    if (!lightweightTrailingView) {
      return 0.0;
    }
    objc_super v4 = [(FaceIdLightweightTrailingView *)lightweightTrailingView remainingSecurityDelay];
    [v4 doubleValue];
    double v7 = v9;
  }

  return v7;
}

- (void)setGlyphState:(int64_t)a3 animated:(BOOL)a4
{
  int64_t glyphState = self->_glyphState;
  if (glyphState != a3)
  {
    BOOL v5 = a4;
    self->_int64_t glyphState = a3;
    if ([(PresentationViewController *)self isDynamicIslandAvailable])
    {
      unsigned int v8 = [(FaceIdToastViewController *)self _isSuccessfulState:glyphState];
      if (v8 != [(FaceIdToastViewController *)self _isSuccessfulState:a3])
      {
        double v9 = [(FaceIdToastViewController *)self systemApertureElementContext];
        [v9 setElementNeedsUpdate];
      }
    }
    if ([(FaceIdToastViewController *)self lightweightUI])
    {
      [(FaceIdLightweightLeadingView *)self->_lightweightLeadingView setState:[(FaceIdToastViewController *)self _leadingViewStateFromGlyphState:a3]];
      [(FaceIdLightweightTrailingView *)self->_lightweightTrailingView setState:[(FaceIdToastViewController *)self _trailingViewStateForGlyphState:a3]];
      if (a3 == 3 && ![(PresentationViewController *)self isDynamicIslandAvailable])
      {
        dispatch_time_t v10 = [(PresentationViewController *)self glyphView];
        [v10 setStyle:2 animated:1];

        int64_t v11 = [(FaceIdToastViewController *)self lightweightUIMode];
        if (v11 == LACLightweightUIModeOverShield) {
          [(FaceIdToastViewController *)self _setBackdropEnabled:1 animated:1];
        }
      }
      double v12 = [(FaceIdToastViewController *)self _lightweightJindoExpansionForState:glyphState];
      if (v12 != (void *)[(FaceIdToastViewController *)self _lightweightJindoExpansionForState:a3])[(FaceIdToastViewController *)self _updateLightweightConstraintsWithCoordinatedAnimations]; {
    }
      }
    id v13 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper glyphView];
    [v13 setState:a3 animated:v5];
  }
}

- (void)_setTransformScale:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(FaceIdToastViewController *)self lightweightUI])
  {
    double v5 = 0.88;
    if (!v3) {
      double v5 = 1.0;
    }
    CGAffineTransformMakeScale(&v8, v5, v5);
    double v6 = [(FaceIdToastViewController *)self view];
    CGAffineTransform v7 = v8;
    [v6 setTransform:&v7];
  }
}

- (void)_shrinkAndRevokeWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(FaceIdToastViewController *)self lightweightUI])
  {
    self->_collapsingFromExpansion = [(FaceIdToastViewController *)self _lightweightJindoExpansion];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001FAC8;
    v10[3] = &unk_100085F40;
    v10[4] = self;
    +[UIView animateWithDuration:v10 animations:0.1];
    [(FaceIdToastViewController *)self _updateLightweightConstraintsWithCoordinatedAnimations];
    objc_initWeak(&location, self);
    dispatch_time_t v5 = dispatch_time(0, 200000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001FB24;
    v6[3] = &unk_1000862F8;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PresentationViewController *)self revokePresentableWithCompletionHandler:v4];
  }
}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_setupSubviews
{
  if ([(PresentationViewController *)self isDynamicIslandAvailable])
  {
    if ([(FaceIdToastViewController *)self lightweightUI])
    {
      [(FaceIdToastViewController *)self _setupLightweightViews];
    }
    else
    {
      [(FaceIdToastViewController *)self _setupGlyphWrapper:1];
    }
  }
  else
  {
    [(FaceIdToastViewController *)self _setupToastView];
    [(FaceIdToastViewController *)self _setupGlyphWrapper:0];
    [(FaceIdToastViewController *)self _setupGlyphLabel];
  }
}

- (void)_setupToastView
{
  BOOL v3 = (UIView *)objc_alloc_init((Class)UIView);
  toastView = self->_toastView;
  self->_toastView = v3;

  [(UIView *)self->_toastView setOpaque:0];
  [(UIView *)self->_toastView setClipsToBounds:1];
  dispatch_time_t v5 = [(UIView *)self->_toastView layer];
  [v5 setCornerRadius:9.0];

  double v6 = [(UIView *)self->_toastView layer];
  [v6 setCornerCurve:kCACornerCurveContinuous];

  id v7 = [(FaceIdToastViewController *)self view];
  [v7 addSubview:self->_toastView];

  [(UIView *)self->_toastView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [(FaceIdToastViewController *)self _toastViewContraints];
  +[NSLayoutConstraint activateConstraints:v8];

  double v9 = 1.0;
  if (!self->_iPad)
  {
    -[FaceIdToastViewController _setTransformScale:](self, "_setTransformScale:", 1, 1.0);
    double v9 = 0.0;
  }
  [(UIView *)self->_toastView setAlpha:v9];

  [(FaceIdToastViewController *)self _setupToastBackdropAndVibrancyView];
}

- (id)_toastViewContraints
{
  id v4 = [(UIView *)self->_toastView widthAnchor];
  dispatch_time_t v5 = [v4 constraintEqualToConstant:self->_toastViewSize.width];
  toastViewWidthAnchor = self->_toastViewWidthAnchor;
  self->_toastViewWidthAnchor = v5;

  id v7 = [(UIView *)self->_toastView heightAnchor];
  id v8 = [v7 constraintEqualToConstant:self->_toastViewSize.height];
  toastViewHeightAnchor = self->_toastViewHeightAnchor;
  self->_toastViewHeightAnchor = v8;

  LODWORD(v10) = 1132068864;
  [(NSLayoutConstraint *)self->_toastViewHeightAnchor setPriority:v10];
  int64_t v11 = self->_toastViewHeightAnchor;
  v26[0] = self->_toastViewWidthAnchor;
  v26[1] = v11;
  double v12 = [(UIView *)self->_toastView centerXAnchor];
  id v13 = [(FaceIdToastViewController *)self view];
  BOOL v14 = [v13 centerXAnchor];
  __int16 v25 = v12;
  __int16 v15 = [v12 constraintEqualToAnchor:v14];
  v26[2] = v15;
  unsigned int v16 = [(FaceIdToastViewController *)self lightweightUI];
  toastView = self->_toastView;
  if (v16)
  {
    v18 = [(UIView *)toastView topAnchor];
    id v19 = [(FaceIdToastViewController *)self view];
    v20 = [v19 safeAreaLayoutGuide];
    uint64_t v2 = [v20 topAnchor];
    double v21 = 5.0;
    if (!self->_iPad) {
      double v21 = -5.0;
    }
    id v22 = [v18 constraintEqualToAnchor:v2 constant:v21];
  }
  else
  {
    v18 = [(UIView *)toastView centerYAnchor];
    id v19 = [(FaceIdToastViewController *)self view];
    v20 = [v19 centerYAnchor];
    id v22 = [v18 constraintEqualToAnchor:v20];
  }
  v26[3] = v22;
  v23 = +[NSArray arrayWithObjects:v26 count:4];
  if (v16)
  {

    id v22 = (void *)v2;
  }

  return v23;
}

- (void)_setupToastBackdropAndVibrancyView
{
  BOOL v3 = +[UIBlurEffect effectWithStyle:1200];
  blurEffect = self->_blurEffect;
  self->_blurEffect = v3;

  dispatch_time_t v5 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:self->_blurEffect];
  backdropView = self->_backdropView;
  self->_backdropView = v5;

  [(UIView *)self->_toastView addSubview:self->_backdropView];
  [(FaceIdToastViewController *)self _anchorToastViewToView:self->_backdropView];
  id v7 = +[UIVibrancyEffect _effectForBlurEffect:self->_blurEffect vibrancyStyle:101];
  vibrancyEffect = self->_vibrancyEffect;
  self->_vibrancyEffect = v7;

  double v9 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:self->_vibrancyEffect];
  overlayEffectView = self->_overlayEffectView;
  self->_overlayEffectView = v9;

  int64_t v11 = [(UIVisualEffectView *)self->_backdropView contentView];
  [v11 addSubview:self->_overlayEffectView];

  [(FaceIdToastViewController *)self _anchorToastViewToView:self->_overlayEffectView];
  int64_t v12 = [(FaceIdToastViewController *)self lightweightUIMode];
  if (v12 == LACLightweightUIModeNone)
  {
    BOOL v13 = 1;
  }
  else
  {
    int64_t v14 = [(FaceIdToastViewController *)self lightweightUIMode];
    BOOL v13 = v14 == LACLightweightUIModeOverContent;
  }
  [(FaceIdToastViewController *)self _setBackdropEnabled:v13 animated:0];
  self->_glyphWrapperParent = [(UIVisualEffectView *)self->_overlayEffectView contentView];

  _objc_release_x1();
}

- (id)_backdropRenderingHintColor
{
  if ([(FaceIdToastViewController *)self lightweightUI])
  {
    double v2 = 1.0;
    double v3 = 1.0;
    double v4 = 1.0;
  }
  else
  {
    double v2 = 0.168627451;
    double v3 = 0.231372549;
    double v4 = 0.321568627;
  }
  dispatch_time_t v5 = +[UIColor colorWithRed:v2 green:v3 blue:v4 alpha:0.12];

  return v5;
}

- (void)_anchorToastViewToView:(id)a3
{
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v17 = [v4 topAnchor];
  unsigned int v16 = [(UIView *)self->_toastView topAnchor];
  __int16 v15 = [v17 constraintEqualToAnchor:v16];
  v18[0] = v15;
  dispatch_time_t v5 = [v4 bottomAnchor];
  double v6 = [(UIView *)self->_toastView bottomAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  v18[1] = v7;
  id v8 = [v4 leadingAnchor];
  double v9 = [(UIView *)self->_toastView leadingAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9];
  v18[2] = v10;
  int64_t v11 = [v4 trailingAnchor];

  int64_t v12 = [(UIView *)self->_toastView trailingAnchor];
  BOOL v13 = [v11 constraintEqualToAnchor:v12];
  v18[3] = v13;
  int64_t v14 = +[NSArray arrayWithObjects:v18 count:4];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)_setupGlyphWrapper:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)LAUIPearlGlyphViewAutoLayoutWrapper);
  double v6 = [(PresentationViewController *)self glyphView];
  id v7 = (LAUIPearlGlyphViewAutoLayoutWrapper *)[v5 initWithGlyphView:v6];
  glyphWrapper = self->_glyphWrapper;
  self->_glyphWrapper = v7;

  glyphWrapperParent = self->_glyphWrapperParent;
  if (glyphWrapperParent)
  {
    double v10 = glyphWrapperParent;
  }
  else
  {
    double v10 = [(FaceIdToastViewController *)self view];
  }
  int64_t v11 = v10;
  [(UIView *)v10 addSubview:self->_glyphWrapper];
  id v12 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_dispatchTapBlock:"];
  [(UIView *)v11 addGestureRecognizer:v12];

  [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper setTranslatesAutoresizingMaskIntoConstraints:0];
  if (v3)
  {
    BOOL v13 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper widthAnchor];
    if ([(FaceIdToastViewController *)self lightweightUI]) {
      double v14 = 20.0;
    }
    else {
      double v14 = 69.0;
    }
    __int16 v15 = [v13 constraintEqualToConstant:v14];
    v39[0] = v15;
    unsigned int v16 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper heightAnchor];
    if ([(FaceIdToastViewController *)self lightweightUI]) {
      double v17 = 20.0;
    }
    else {
      double v17 = 69.0;
    }
    v18 = [v16 constraintEqualToConstant:v17];
    v39[1] = v18;
    id v19 = +[NSArray arrayWithObjects:v39 count:2];
    +[NSLayoutConstraint activateConstraints:v19];

    glyphConstraints = self->_glyphConstraints;
    self->_glyphConstraints = (NSArray *)&__NSArray0__struct;
  }
  else
  {
    unsigned int v21 = [(FaceIdToastViewController *)self lightweightUI];
    id v22 = self->_glyphWrapper;
    char v37 = v21;
    if (v21)
    {
      glyphConstraints = [(LAUIPearlGlyphViewAutoLayoutWrapper *)v22 centerYAnchor];
      uint64_t v35 = [(UIView *)v11 centerYAnchor];
      [glyphConstraints constraintEqualToAnchor:];
    }
    else
    {
      glyphConstraints = [(LAUIPearlGlyphViewAutoLayoutWrapper *)v22 topAnchor];
      uint64_t v34 = [(UIView *)v11 topAnchor];
      [glyphConstraints constraintEqualToAnchor:28.0];
    v36 = };
    v38[0] = v36;
    v23 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper centerXAnchor];
    v24 = [(UIView *)v11 centerXAnchor];
    __int16 v25 = [v23 constraintEqualToAnchor:v24];
    v38[1] = v25;
    double v26 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper widthAnchor];
    if ([(FaceIdToastViewController *)self lightweightUI]) {
      double v27 = 36.0;
    }
    else {
      double v27 = 70.0;
    }
    v28 = [v26 constraintEqualToConstant:v27];
    v38[2] = v28;
    v29 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper heightAnchor];
    if ([(FaceIdToastViewController *)self lightweightUI]) {
      double v30 = 36.0;
    }
    else {
      double v30 = 70.0;
    }
    v31 = [v29 constraintEqualToConstant:v30];
    v38[3] = v31;
    v32 = +[NSArray arrayWithObjects:v38 count:4];
    +[NSLayoutConstraint activateConstraints:v32];

    if (v37) {
      v33 = (void *)v35;
    }
    else {
      v33 = (void *)v34;
    }
  }
}

- (void)_setupGlyphLabel
{
  if (self->_titleText && ![(FaceIdToastViewController *)self lightweightUI])
  {
    BOOL v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    glyphLabel = self->_glyphLabel;
    self->_glyphLabel = v3;

    [(UILabel *)self->_glyphLabel setText:self->_titleText];
    [(UILabel *)self->_glyphLabel setNumberOfLines:0];
    id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [(UILabel *)self->_glyphLabel setFont:v5];

    [(UILabel *)self->_glyphLabel setTextAlignment:1];
    double v6 = +[UIColor labelColor];
    [(UILabel *)self->_glyphLabel setTextColor:v6];

    id v7 = [(UIVisualEffectView *)self->_overlayEffectView contentView];
    [v7 addSubview:self->_glyphLabel];

    [(UILabel *)self->_glyphLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [(UILabel *)self->_glyphLabel topAnchor];
    double v9 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper bottomAnchor];
    double v10 = [v8 constraintEqualToAnchor:v9 constant:20.0];
    [v10 setActive:1];

    int64_t v11 = [(UILabel *)self->_glyphLabel leadingAnchor];
    id v12 = [(UIVisualEffectView *)self->_overlayEffectView contentView];
    BOOL v13 = [v12 leadingAnchor];
    double v14 = [v11 constraintEqualToAnchor:v13 constant:20.0];
    [v14 setActive:1];

    __int16 v15 = [(UILabel *)self->_glyphLabel trailingAnchor];
    unsigned int v16 = [(UIVisualEffectView *)self->_overlayEffectView contentView];
    double v17 = [v16 trailingAnchor];
    v18 = [v15 constraintEqualToAnchor:v17 constant:-20.0];
    [v18 setActive:1];

    id v22 = [(UILabel *)self->_glyphLabel bottomAnchor];
    id v19 = [(UIVisualEffectView *)self->_overlayEffectView contentView];
    v20 = [v19 bottomAnchor];
    unsigned int v21 = [v22 constraintLessThanOrEqualToAnchor:v20 constant:-20.0];
    [v21 setActive:1];
  }
}

- (void)_setupLightweightViews
{
  BOOL v3 = [(FaceIdToastViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = (FaceIdLightweightLeadingView *)objc_opt_new();
  lightweightLeadingView = self->_lightweightLeadingView;
  self->_lightweightLeadingView = v4;

  double v6 = [(FaceIdToastViewController *)self view];
  [v6 addSubview:self->_lightweightLeadingView];

  [(FaceIdLightweightLeadingView *)self->_lightweightLeadingView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = (FaceIdLightweightTrailingView *)objc_opt_new();
  lightweightTrailingView = self->_lightweightTrailingView;
  self->_lightweightTrailingView = v7;

  double v9 = [(FaceIdToastViewController *)self view];
  [v9 addSubview:self->_lightweightTrailingView];

  double v10 = self->_lightweightTrailingView;

  [(FaceIdLightweightTrailingView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (CGSize)_lightweightJindoContainerSize
{
  unint64_t v2 = (unint64_t)[(FaceIdToastViewController *)self _lightweightJindoExpansion] - 1;
  if (v2 > 2)
  {
    double v4 = 36.0;
    double v3 = 160.0;
  }
  else
  {
    double v3 = dbl_10006BA60[v2];
    double v4 = dbl_10006BA78[v2];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_lightweightJindoContentSizeForExpansion:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v3 = ![(FaceIdToastViewController *)self _isEarlyExpansion];
    uint64_t v4 = 0x4044000000000000;
  }
  else
  {
    BOOL v3 = a3 == 2;
    uint64_t v4 = 0x4040000000000000;
  }
  double v5 = *(double *)&v4;
  if (!v3) {
    double v5 = 16.0;
  }
  double v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)_isEarlyExpansion
{
  [(NSDate *)self->_timeAppeared timeIntervalSinceNow];
  return v2 > -0.2;
}

- (BOOL)_isCollapsingFromFullExpansion
{
  return self->_collapsingFromExpansion == 1;
}

- (CGVector)_lightweightJindoContentShiftOnLeading:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(FaceIdToastViewController *)self _lightweightJindoExpansion];
  if (v5 == 1)
  {
    unsigned int v8 = [(FaceIdToastViewController *)self _isEarlyExpansion];
    double v7 = 7.0;
    double v9 = 8.0;
    if (v3) {
      double v7 = 8.0;
    }
    else {
      double v9 = 20.0;
    }
    if (v8)
    {
      double v7 = v9;
      double v6 = -5.0;
    }
    else
    {
      double v6 = 0.0;
    }
  }
  else if (v5 == 3)
  {
    unsigned int v10 = [(FaceIdToastViewController *)self _isCollapsingFromFullExpansion];
    double v6 = 18.0;
    if (!v10) {
      double v6 = 10.0;
    }
    double v7 = 0.0;
  }
  else
  {
    double v6 = 0.0;
    double v7 = 2.0;
    if (v3) {
      double v7 = 5.0;
    }
    if (v5 != 2) {
      double v7 = 0.0;
    }
  }
  result.dy = v6;
  result.dx = v7;
  return result;
}

- (void)_updateLightweightConstraintsWithCoordinatedAnimations
{
  if ([(FaceIdToastViewController *)self lightweightUI]
    && self->_lightweightViewWidthAnchor
    && self->_lightweightViewHeightAnchor)
  {
    BOOL v3 = [(FaceIdToastViewController *)self systemApertureElementContext];

    if (v3)
    {
      objc_initWeak(&location, self);
      uint64_t v4 = [(FaceIdToastViewController *)self systemApertureElementContext];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100020DC4;
      v5[3] = &unk_1000860D8;
      objc_copyWeak(&v6, &location);
      [v4 setElementNeedsUpdateWithCoordinatedAnimations:v5];

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      [(FaceIdToastViewController *)self _updateLightweightConstraints];
    }
  }
}

- (void)_updateLightweightConstraints
{
  [(FaceIdToastViewController *)self _lightweightJindoContainerSize];
  double v4 = v3;
  double v6 = v5;
  lightweightViewWidthAnchor = self->_lightweightViewWidthAnchor;
  unsigned int v8 = [(FaceIdToastViewController *)self view];
  double v9 = [(FaceIdToastViewController *)self view];
  unsigned int v10 = [v9 widthAnchor];
  int64_t v11 = [(FaceIdToastViewController *)self _updateConstraint:lightweightViewWidthAnchor ofView:v8 anchor1:v10 anchor2:0 constant:v4];
  id v12 = self->_lightweightViewWidthAnchor;
  self->_lightweightViewWidthAnchor = v11;

  lightweightViewHeightAnchor = self->_lightweightViewHeightAnchor;
  double v14 = [(FaceIdToastViewController *)self view];
  __int16 v15 = [(FaceIdToastViewController *)self view];
  unsigned int v16 = [v15 heightAnchor];
  double v17 = [(FaceIdToastViewController *)self _updateConstraint:lightweightViewHeightAnchor ofView:v14 anchor1:v16 anchor2:0 constant:v6];
  v18 = self->_lightweightViewHeightAnchor;
  self->_lightweightViewHeightAnchor = v17;

  [(FaceIdToastViewController *)self _updateLightweightContentSize];
  [(FaceIdToastViewController *)self _lightweightJindoContentShiftOnLeading:1];
  double v20 = v19;
  double v22 = v21;
  lightweightLeadingLeadingAnchor = self->_lightweightLeadingLeadingAnchor;
  v24 = [(FaceIdToastViewController *)self view];
  __int16 v25 = [(FaceIdLightweightLeadingView *)self->_lightweightLeadingView leadingAnchor];
  double v26 = [(FaceIdToastViewController *)self view];
  double v27 = [v26 leadingAnchor];
  v28 = [(FaceIdToastViewController *)self _updateConstraint:lightweightLeadingLeadingAnchor ofView:v24 anchor1:v25 anchor2:v27 constant:v20];
  v29 = self->_lightweightLeadingLeadingAnchor;
  self->_lightweightLeadingLeadingAnchor = v28;

  lightweightLeadingCenterYAnchor = self->_lightweightLeadingCenterYAnchor;
  v31 = [(FaceIdToastViewController *)self view];
  v32 = [(FaceIdLightweightLeadingView *)self->_lightweightLeadingView centerYAnchor];
  v33 = [(FaceIdToastViewController *)self view];
  uint64_t v34 = [v33 centerYAnchor];
  uint64_t v35 = [(FaceIdToastViewController *)self _updateConstraint:lightweightLeadingCenterYAnchor ofView:v31 anchor1:v32 anchor2:v34 constant:v22];
  v36 = self->_lightweightLeadingCenterYAnchor;
  self->_lightweightLeadingCenterYAnchor = v35;

  [(FaceIdToastViewController *)self _lightweightJindoContentShiftOnLeading:0];
  double v38 = v37;
  double v40 = v39;
  lightweightTrailingTrailingAnchor = self->_lightweightTrailingTrailingAnchor;
  v42 = [(FaceIdToastViewController *)self view];
  v43 = [(FaceIdLightweightTrailingView *)self->_lightweightTrailingView trailingAnchor];
  v44 = [(FaceIdToastViewController *)self view];
  v45 = [v44 trailingAnchor];
  v46 = [(FaceIdToastViewController *)self _updateConstraint:lightweightTrailingTrailingAnchor ofView:v42 anchor1:v43 anchor2:v45 constant:-v38];
  v47 = self->_lightweightTrailingTrailingAnchor;
  self->_lightweightTrailingTrailingAnchor = v46;

  lightweightTrailingCenterYAnchor = self->_lightweightTrailingCenterYAnchor;
  id v54 = [(FaceIdToastViewController *)self view];
  v49 = [(FaceIdLightweightTrailingView *)self->_lightweightTrailingView centerYAnchor];
  v50 = [(FaceIdToastViewController *)self view];
  v51 = [v50 centerYAnchor];
  v52 = [(FaceIdToastViewController *)self _updateConstraint:lightweightTrailingCenterYAnchor ofView:v54 anchor1:v49 anchor2:v51 constant:v40];
  v53 = self->_lightweightTrailingCenterYAnchor;
  self->_lightweightTrailingCenterYAnchor = v52;
}

- (void)_updateLightweightContentSize
{
  [(FaceIdToastViewController *)self _lightweightJindoContentSizeForExpansion:[(FaceIdToastViewController *)self _lightweightJindoExpansion]];
  double v4 = v3;
  double v6 = v5;
  lightweightLeadingWidthAnchor = self->_lightweightLeadingWidthAnchor;
  lightweightLeadingView = self->_lightweightLeadingView;
  double v9 = [(FaceIdLightweightLeadingView *)lightweightLeadingView widthAnchor];
  unsigned int v10 = [(FaceIdToastViewController *)self _updateConstraint:lightweightLeadingWidthAnchor ofView:lightweightLeadingView anchor1:v9 anchor2:0 constant:v4];
  int64_t v11 = self->_lightweightLeadingWidthAnchor;
  self->_lightweightLeadingWidthAnchor = v10;

  lightweightLeadingHeightAnchor = self->_lightweightLeadingHeightAnchor;
  BOOL v13 = self->_lightweightLeadingView;
  double v14 = [(FaceIdLightweightLeadingView *)v13 heightAnchor];
  __int16 v15 = [(FaceIdToastViewController *)self _updateConstraint:lightweightLeadingHeightAnchor ofView:v13 anchor1:v14 anchor2:0 constant:v6];
  unsigned int v16 = self->_lightweightLeadingHeightAnchor;
  self->_lightweightLeadingHeightAnchor = v15;

  lightweightTrailingWidthAnchor = self->_lightweightTrailingWidthAnchor;
  lightweightTrailingView = self->_lightweightTrailingView;
  double v19 = [(FaceIdLightweightTrailingView *)lightweightTrailingView widthAnchor];
  double v20 = [(FaceIdToastViewController *)self _updateConstraint:lightweightTrailingWidthAnchor ofView:lightweightTrailingView anchor1:v19 anchor2:0 constant:v4];
  double v21 = self->_lightweightTrailingWidthAnchor;
  self->_lightweightTrailingWidthAnchor = v20;

  lightweightTrailingHeightAnchor = self->_lightweightTrailingHeightAnchor;
  v23 = self->_lightweightTrailingView;
  id v26 = [(FaceIdLightweightTrailingView *)v23 heightAnchor];
  v24 = [(FaceIdToastViewController *)self _updateConstraint:lightweightTrailingHeightAnchor ofView:v23 anchor1:v26 anchor2:0 constant:v6];
  __int16 v25 = self->_lightweightTrailingHeightAnchor;
  self->_lightweightTrailingHeightAnchor = v24;
}

- (id)_updateConstraint:(id)a3 ofView:(id)a4 anchor1:(id)a5 anchor2:(id)a6 constant:(double)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  __int16 v15 = v14;
  if (v11)
  {
    [v11 setConstant:a7];
    id v16 = v11;
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100021488;
    v18[3] = &unk_1000869A8;
    id v19 = v14;
    id v20 = v13;
    double v21 = a7;
    sub_100021488((uint64_t)v18);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16) {
      [v12 addConstraint:v16];
    }
  }

  return v16;
}

- (int64_t)_lightweightJindoExpansion
{
  if (!self->_timeAppeared) {
    return 0;
  }
  if (self->_collapsingFromExpansion) {
    return 3;
  }
  return [(FaceIdToastViewController *)self _lightweightJindoExpansionForState:self->_glyphState];
}

- (void)_updateGlyphConstraints
{
  if (![(FaceIdToastViewController *)self lightweightUI])
  {
    +[NSLayoutConstraint deactivateConstraints:self->_glyphConstraints];
    double v3 = [(FaceIdToastViewController *)self view];
    double v4 = [v3 SBUISA_systemApertureObstructedAreaLayoutGuide];

    double v5 = [(FaceIdToastViewController *)self _glyphAnchorWithObstructedLayoutGuide:v4];
    v9[0] = v5;
    double v6 = [(FaceIdToastViewController *)self _centeringAnchorWithObstructedLayoutGuide:v4];
    v9[1] = v6;
    double v7 = +[NSArray arrayWithObjects:v9 count:2];
    glyphConstraints = self->_glyphConstraints;
    self->_glyphConstraints = v7;

    +[NSLayoutConstraint activateConstraints:self->_glyphConstraints];
  }
}

- (void)updateGlyphConstraintsIfOrientationChanged
{
  int64_t interfaceOrientation = self->_interfaceOrientation;
  double v4 = [(FaceIdToastViewController *)self view];
  double v5 = [v4 SBUISA_systemApertureObstructedAreaLayoutGuide];
  [v5 layoutFrame];
  self->_int64_t interfaceOrientation = -[FaceIdToastViewController _interfaceOrientationFromObstructedArea:](self, "_interfaceOrientationFromObstructedArea:");

  if (interfaceOrientation != self->_interfaceOrientation)
  {
    [(FaceIdToastViewController *)self _updateGlyphConstraints];
    if (interfaceOrientation)
    {
      double v6 = [(PresentationViewController *)self glyphView];
      double v7 = [v6 remainingMinDisplayTimeInterval];
      [v7 doubleValue];
      double v9 = v8;

      if (v9 > 0.0)
      {
        id v10 = [(FaceIdToastViewController *)self presentingTransitionViewController];
        [v10 uiEvent:13 options:0];
      }
    }
  }
}

- (int64_t)_interfaceOrientationFromObstructedArea:(CGRect)a3
{
  if (a3.size.width <= a3.size.height)
  {
    double MaxX = CGRectGetMaxX(a3);
    double v5 = [(FaceIdToastViewController *)self view];
    [v5 bounds];
    if (MaxX >= CGRectGetMidX(v10)) {
      int64_t v6 = 3;
    }
    else {
      int64_t v6 = 4;
    }
  }
  else
  {
    double MaxY = CGRectGetMaxY(a3);
    double v5 = [(FaceIdToastViewController *)self view];
    [v5 bounds];
    if (MaxY < CGRectGetMidY(v9)) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = 2;
    }
  }

  return v6;
}

- (id)_glyphAnchorWithObstructedLayoutGuide:(id)a3
{
  id v4 = a3;
  switch(self->_interfaceOrientation)
  {
    case 0:
      double v5 = LACLogFaceIDUI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100061850(v5);
      }

      goto LABEL_5;
    case 1:
LABEL_5:
      int64_t v6 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper topAnchor];
      uint64_t v7 = [v4 bottomAnchor];
      goto LABEL_9;
    case 2:
      int64_t v6 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper bottomAnchor];
      uint64_t v7 = [v4 topAnchor];
      goto LABEL_9;
    case 3:
      int64_t v6 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper trailingAnchor];
      uint64_t v7 = [v4 leadingAnchor];
      goto LABEL_9;
    case 4:
      int64_t v6 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)self->_glyphWrapper leadingAnchor];
      uint64_t v7 = [v4 trailingAnchor];
LABEL_9:
      double v8 = (void *)v7;
      self = [v6 constraintEqualToAnchor:v7];

      break;
    default:
      break;
  }

  return self;
}

- (id)_centeringAnchorWithObstructedLayoutGuide:(id)a3
{
  unint64_t v3 = self->_interfaceOrientation - 3;
  glyphWrapper = self->_glyphWrapper;
  id v5 = a3;
  if (v3 >= 2)
  {
    int64_t v6 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)glyphWrapper centerXAnchor];
    [v5 centerXAnchor];
  }
  else
  {
    int64_t v6 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)glyphWrapper centerYAnchor];
    [v5 centerYAnchor];
  uint64_t v7 = };

  double v8 = [v6 constraintEqualToAnchor:v7];

  return v8;
}

- (void)_dispatchTapBlock:(id)a3
{
  id v3 = [(FaceIdToastViewController *)self presentingViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 uiCancelByGestureIfPossible];
  }
}

- (void)_adjustToastSizeForAccessibilityIfNeeded
{
  double v3 = sub_100021B14();
  [(NSLayoutConstraint *)self->_toastViewWidthAnchor setConstant:v3 * self->_toastViewSize.width];
  double v4 = v3 * self->_toastViewSize.height;
  toastViewHeightAnchor = self->_toastViewHeightAnchor;

  [(NSLayoutConstraint *)toastViewHeightAnchor setConstant:v4];
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  if (self->_activeLayoutMode != a3)
  {
    self->_activeLayoutMode = a3;
    double v4 = [(FaceIdToastViewController *)self systemApertureElementContext];
    id v5 = [v4 requestAlertingAssertion];
    [v5 setAutomaticallyInvalidatable:0];

    if ([(FaceIdToastViewController *)self lightweightUI])
    {
      [(FaceIdToastViewController *)self _updateLightweightConstraints];
    }
  }
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100021CD4;
  v3[3] = &unk_1000862D0;
  v3[4] = self;
  [a3 animateAlongsideTransition:v3 completion:&stru_1000869E8];
}

- (int64_t)preferredCustomLayout
{
  return [(FaceIdToastViewController *)self lightweightUI] ^ 1;
}

- (id)keyColor
{
  if ([(FaceIdToastViewController *)self _isSuccessfulState:self->_glyphState])
  {
    double v2 = +[UIColor colorWithRed:0.192 green:0.82 blue:0.345 alpha:1.0];
  }
  else
  {
    double v2 = 0;
  }

  return v2;
}

- (int64_t)glyphState
{
  return self->_glyphState;
}

- (BOOL)_isSuccessfulState:(int64_t)a3
{
  return ((unint64_t)a3 < 9) & (0x1EEu >> a3);
}

- (int64_t)_lightweightJindoExpansionForState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 2;
  }
  else {
    return qword_10006BA90[a3 - 1];
  }
}

- (id)_descriptionOfGlyphState:(int64_t)a3
{
  if ((unint64_t)a3 > 8) {
    return @"UNKNOWN";
  }
  else {
    return off_100086A08[a3];
  }
}

- (int64_t)_leadingViewStateFromGlyphState:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return qword_10006BAB8[a3];
  }
}

- (int64_t)_trailingViewStateForGlyphState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_10006BAE0[a3 - 1];
  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4 = a3;
  id v5 = LACLogFaceIDUI();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Face ID glyph appeared in %{public}@", buf, 0xCu);
  }

  v15.receiver = self;
  v15.super_class = (Class)FaceIdToastViewController;
  [(PresentationViewController *)&v15 presentableDidAppearAsBanner:v4];
  if (self->_shakeOnAppeared)
  {
    self->_shakeOnAppeared = 0;
    v14.receiver = self;
    v14.super_class = (Class)FaceIdToastViewController;
    [(PresentationViewController *)&v14 shake];
  }
  int64_t v6 = [(PresentationViewController *)self glyphView];
  id v7 = [v6 state];

  if (!v7)
  {
    double v8 = [(PresentationViewController *)self glyphView];
    [v8 setState:1 animated:1];
  }
  CGRect v9 = [(FaceIdToastViewController *)self presentingTransitionViewController];
  [v9 uiEvent:0 options:0];

  if ([(FaceIdToastViewController *)self lightweightUI])
  {
    CGRect v10 = +[NSDate now];
    timeAppeared = self->_timeAppeared;
    self->_timeAppeared = v10;

    [(FaceIdToastViewController *)self _updateLightweightConstraintsWithCoordinatedAnimations];
    dispatch_time_t v12 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022068;
    block[3] = &unk_100085F40;
    void block[4] = self;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FaceIdToastViewController;
  id v6 = a4;
  [(PresentationViewController *)&v7 presentableWillDisappearAsBanner:a3 withReason:v6];
  LODWORD(a3) = [v6 isEqualToString:@"removed via pan gesture"];

  if (a3) {
    [(FaceIdToastViewController *)self _dispatchTapBlock:0];
  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FaceIdToastViewController;
  [(PresentationViewController *)&v9 presentableDidDisappearAsBanner:v6 withReason:a4];
  objc_super v7 = LACLogFaceIDUI();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Face ID glyph disappeared in %{public}@", buf, 0xCu);
  }

  timeAppeared = self->_timeAppeared;
  self->_timeAppeared = 0;
}

- (id)leadingView
{
  return 0;
}

- (id)trailingView
{
  return 0;
}

- (id)minimalView
{
  return 0;
}

- (void)shake
{
  if ([(PresentationViewController *)self isActive])
  {
    v3.receiver = self;
    v3.super_class = (Class)FaceIdToastViewController;
    [(PresentationViewController *)&v3 shake];
  }
  else
  {
    self->_shakeOnAppeared = 1;
  }
}

- (void)_setBackdropEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100022374;
    v5[3] = &unk_100086100;
    objc_copyWeak(&v6, &location);
    BOOL v7 = a3;
    +[UIView animateWithDuration:v5 animations:0.3];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    -[FaceIdToastViewController _setBackdropEnabled:](self, "_setBackdropEnabled:");
  }
}

- (void)_setBackdropEnabled:(BOOL)a3
{
  p_backdropView = &self->_backdropView;
  if (a3)
  {
    [(UIVisualEffectView *)self->_backdropView setEffect:self->_blurEffect];
    [(UIVisualEffectView *)self->_overlayEffectView setEffect:self->_vibrancyEffect];
    [(FaceIdToastViewController *)self _backdropRenderingHintColor];
  }
  else
  {
    [(UIVisualEffectView *)self->_backdropView setEffect:0];
    [(UIVisualEffectView *)self->_overlayEffectView setEffect:0];
    +[UIColor clearColor];
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(UIVisualEffectView *)*p_backdropView contentView];
  [v5 setBackgroundColor:v6];
}

- (BOOL)lightweightUI
{
  int64_t v2 = [(FaceIdToastViewController *)self lightweightUIMode];
  return v2 != LACLightweightUIModeNone;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (int64_t)lightweightUIMode
{
  return self->_lightweightUIMode;
}

- (BOOL)toastBackdropEnabled
{
  return self->_toastBackdropEnabled;
}

- (void)setToastBackdropEnabled:(BOOL)a3
{
  self->_toastBackdropEnabled = a3;
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (TransitionViewController)presentingTransitionViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingTransitionViewController);

  return (TransitionViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingTransitionViewController);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_timeAppeared, 0);
  objc_storeStrong((id *)&self->_lightweightTrailingView, 0);
  objc_storeStrong((id *)&self->_lightweightLeadingView, 0);
  objc_storeStrong((id *)&self->_glyphConstraints, 0);
  objc_storeStrong((id *)&self->_glyphWrapperParent, 0);
  objc_storeStrong((id *)&self->_glyphWrapper, 0);
  objc_storeStrong((id *)&self->_glyphLabel, 0);
  objc_storeStrong((id *)&self->_lightweightTrailingCenterYAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightTrailingTrailingAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightTrailingHeightAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightTrailingWidthAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightLeadingCenterYAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightLeadingLeadingAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightLeadingHeightAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightLeadingWidthAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightViewHeightAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightViewWidthAnchor, 0);
  objc_storeStrong((id *)&self->_toastViewHeightAnchor, 0);
  objc_storeStrong((id *)&self->_toastViewWidthAnchor, 0);
  objc_storeStrong((id *)&self->_lightweightBackdropView, 0);
  objc_storeStrong((id *)&self->_overlayEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);
  objc_storeStrong((id *)&self->_blurEffect, 0);

  objc_storeStrong((id *)&self->_toastView, 0);
}

@end