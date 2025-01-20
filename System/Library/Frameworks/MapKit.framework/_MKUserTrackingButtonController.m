@interface _MKUserTrackingButtonController
- (BOOL)_shouldAnimateFromState:(int64_t)a3 toState:(int64_t)a4;
- (MKUserTrackingView)userTrackingView;
- (UIImageView)imageView;
- (_MKUserTrackingButtonController)initWithTarget:(id)a3 userTrackingView:(id)a4 imageView:(id)a5 button:(id)a6;
- (double)_symbolPointSize;
- (id)_activityIndicatorView;
- (id)_contentAnimation;
- (id)_expandAnimation;
- (id)_imageForState:(int64_t)a3 controlState:(unint64_t)a4;
- (id)_shrinkAnimation;
- (int64_t)state;
- (unint64_t)buttonBehavior;
- (unint64_t)controlSize;
- (void)_authorizationStatusChanged:(id)a3;
- (void)_goToNextMode:(id)a3;
- (void)_reloadState;
- (void)_updateLoading;
- (void)_updatePreferredSymbolConfiguration;
- (void)_updateState;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)setButtonBehavior:(unint64_t)a3;
- (void)setControlSize:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setUserTrackingView:(id)a3;
@end

@implementation _MKUserTrackingButtonController

- (void)_updateState
{
  p_userTrackingView = &self->_userTrackingView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userTrackingView);
  uint64_t v5 = [WeakRetained userTrackingMode];

  uint64_t v6 = 2;
  if (v5 != 1) {
    uint64_t v6 = 0;
  }
  BOOL v7 = v5 == 2;
  BOOL v8 = v5 != 2 && v5 != 1;
  if (v7) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = v6;
  }
  id v10 = objc_loadWeakRetained((id *)p_userTrackingView);
  int v11 = [v10 hasUserLocation];

  if (v11) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = 1;
  }
  if (v8) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }

  [(_MKUserTrackingButtonController *)self setState:v13];
}

- (void)_reloadState
{
  [(_MKUserTrackingButtonController *)self _updatePreferredSymbolConfiguration];
  id v11 = [(_MKUserTrackingButtonController *)self _imageForState:self->_state controlState:0];
  [(UIImageView *)self->_imageView setImage:v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  [WeakRetained setImage:v11 forState:0];

  id v4 = objc_loadWeakRetained((id *)&self->_button);
  uint64_t v5 = [(_MKUserTrackingButtonController *)self _imageForState:self->_state controlState:1];
  [v4 setImage:v5 forState:1];

  id v6 = objc_loadWeakRetained((id *)&self->_button);
  BOOL v7 = [(_MKUserTrackingButtonController *)self _imageForState:self->_state controlState:2];
  [v6 setImage:v7 forState:2];

  id v8 = objc_loadWeakRetained((id *)&self->_button);
  uint64_t v9 = [(_MKUserTrackingButtonController *)self _imageForState:self->_state controlState:4];
  [v8 setImage:v9 forState:4];

  id v10 = objc_loadWeakRetained((id *)&self->_target);
  [v10 _repositionViews];
}

- (id)_imageForState:(int64_t)a3 controlState:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  BOOL v7 = [WeakRetained _imageForState:a3 controlState:a4];

  return v7;
}

- (void)_updatePreferredSymbolConfiguration
{
  v3 = (void *)MEMORY[0x1E4F42A98];
  p_button = &self->_button;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  char v6 = [WeakRetained inMiniBar];
  double v7 = 15.0;
  if ((v6 & 1) == 0) {
    [(_MKUserTrackingButtonController *)self _symbolPointSize];
  }
  id v12 = [v3 configurationWithPointSize:v7];

  id v8 = objc_loadWeakRetained((id *)p_button);
  [v8 setPreferredSymbolConfiguration:v12 forImageInState:0];

  id v9 = objc_loadWeakRetained((id *)p_button);
  [v9 setPreferredSymbolConfiguration:v12 forImageInState:1];

  id v10 = objc_loadWeakRetained((id *)p_button);
  [v10 setPreferredSymbolConfiguration:v12 forImageInState:2];

  id v11 = objc_loadWeakRetained((id *)p_button);
  [v11 setPreferredSymbolConfiguration:v12 forImageInState:4];
}

- (double)_symbolPointSize
{
  BOOL v3 = _MKLinkedOnOrAfterReleaseSet(3081);
  double result = 22.0;
  if (v3)
  {
    unint64_t controlSize = self->_controlSize;
    BOOL IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    unint64_t v7 = 12;
    if (controlSize == 2) {
      unint64_t v7 = 16;
    }
    uint64_t v8 = 18;
    if (controlSize == 2) {
      uint64_t v8 = 22;
    }
    if (!IsMacCatalyst) {
      return (double)(unint64_t)v8;
    }
    return (double)v7;
  }
  return result;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setButtonBehavior:(unint64_t)a3
{
  self->_buttonBehavior = a3;
}

- (_MKUserTrackingButtonController)initWithTarget:(id)a3 userTrackingView:(id)a4 imageView:(id)a5 button:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_MKUserTrackingButtonController;
  v14 = [(_MKUserTrackingButtonController *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_state = -1;
    objc_storeWeak((id *)&v14->_target, v10);
    objc_storeStrong((id *)&v15->_imageView, a5);
    uint64_t v16 = *MEMORY[0x1E4F3A3C0];
    v17 = [(UIImageView *)v15->_imageView layer];
    [v17 setContentsGravity:v16];

    objc_storeWeak((id *)&v15->_button, v13);
    v15->_unint64_t controlSize = 1;
    [(_MKUserTrackingButtonController *)v15 _updatePreferredSymbolConfiguration];
    [(_MKUserTrackingButtonController *)v15 setUserTrackingView:v11];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v15 selector:sel__authorizationStatusChanged_ name:MKLocationManagerApprovalDidChangeNotification object:0];

    v19 = v15;
  }

  return v15;
}

- (void)setUserTrackingView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userTrackingView);

  if (WeakRetained != v4)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_userTrackingView);

    if (!v6) {
      goto LABEL_8;
    }
    unint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v8 = objc_loadWeakRetained((id *)&self->_userTrackingView);
    [v7 removeObserver:self name:@"MKUserTrackingViewModeDidChangeNotification" object:v8];

    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v10 = objc_loadWeakRetained((id *)&self->_userTrackingView);
    [v9 removeObserver:self name:@"MKUserTrackingViewDidUpdateUserLocationNotification" object:v10];

    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v12 = objc_loadWeakRetained((id *)&self->_userTrackingView);
    [v11 removeObserver:self name:@"MKUserTrackingViewDidResetUserLocationNotification" object:v12];

    id v13 = objc_loadWeakRetained((id *)&self->_userTrackingView);
    if (objc_opt_respondsToSelector())
    {
      id v14 = objc_loadWeakRetained((id *)&self->_userTrackingView);
      int v15 = [v14 postsMapViewInitialRenderingNotification];

      if (!v15)
      {
LABEL_7:
        objc_storeWeak((id *)&self->_userTrackingView, 0);
LABEL_8:
        if (!v4)
        {
          id v29 = objc_loadWeakRetained((id *)&self->_target);
          [v29 _setInternallyEnabled:0];
          goto LABEL_15;
        }
        objc_storeWeak((id *)&self->_userTrackingView, v4);
        v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v18 = objc_loadWeakRetained((id *)&self->_userTrackingView);
        [v17 addObserver:self selector:sel__updateState name:@"MKUserTrackingViewModeDidChangeNotification" object:v18];

        v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v20 = objc_loadWeakRetained((id *)&self->_userTrackingView);
        [v19 addObserver:self selector:sel__updateState name:@"MKUserTrackingViewDidUpdateUserLocationNotification" object:v20];

        objc_super v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v22 = objc_loadWeakRetained((id *)&self->_userTrackingView);
        [v21 addObserver:self selector:sel__updateState name:@"MKUserTrackingViewDidResetUserLocationNotification" object:v22];

        v23 = objc_loadWeakRetained((id *)&self->_userTrackingView);
        if (objc_opt_respondsToSelector())
        {
          id v24 = objc_loadWeakRetained((id *)&self->_userTrackingView);
          int v25 = [v24 postsMapViewInitialRenderingNotification];

          if (!v25)
          {
LABEL_13:
            v27 = +[MKLocationManager sharedLocationManager];
            v28 = dispatch_get_global_queue(0, 0);
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __55___MKUserTrackingButtonController_setUserTrackingView___block_invoke;
            v30[3] = &unk_1E54B8248;
            id v31 = v27;
            v32 = self;
            id v29 = v27;
            dispatch_async(v28, v30);

LABEL_15:
            [(_MKUserTrackingButtonController *)self _updateState];
            goto LABEL_16;
          }
          v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
          id v26 = objc_loadWeakRetained((id *)&self->_userTrackingView);
          [v23 addObserver:self selector:sel__updateState name:@"MKMapViewDidFinishInitialRenderNotification" object:v26];
        }
        goto LABEL_13;
      }
      id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v16 = objc_loadWeakRetained((id *)&self->_userTrackingView);
      [v13 removeObserver:self name:@"MKMapViewDidFinishInitialRenderNotification" object:v16];
    }
    goto LABEL_7;
  }
LABEL_16:
}

- (void)setState:(int64_t)a3
{
  int64_t state = self->_state;
  if (state != a3)
  {
    BOOL v6 = [(_MKUserTrackingButtonController *)self _shouldAnimateFromState:state toState:a3];
    self->_int64_t state = a3;
    if (v6)
    {
      unint64_t v7 = [(UIImageView *)self->_imageView layer];
      id v8 = [(_MKUserTrackingButtonController *)self _shrinkAnimation];
      objc_msgSend(v8, "set_mapkit_ID:", 7);
      [v8 setDelegate:self];
      id v9 = [(_MKUserTrackingButtonController *)self _contentAnimation];
      [v8 duration];
      objc_msgSend(v9, "setDuration:");
      [v7 addAnimation:v8 forKey:@"shrink"];
      if (v9) {
        [v7 addAnimation:v9 forKey:@"contents"];
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      [WeakRetained _updateForState:a3];

      [(_MKUserTrackingButtonController *)self _reloadState];
      [(_MKUserTrackingButtonController *)self _updateLoading];
    }
    id v13 = objc_loadWeakRetained((id *)&self->_target);
    uint64_t v11 = [v13 _isHighlightedForState:a3];
    id v12 = objc_loadWeakRetained((id *)&self->_button);
    [v12 setSelected:v11];
  }
}

- (void)_updateLoading
{
  if (self->_state == 1)
  {
    id v12 = [(_MKUserTrackingButtonController *)self _activityIndicatorView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    -[UIActivityIndicatorView setActivityIndicatorViewStyle:](v12, "setActivityIndicatorViewStyle:", [WeakRetained _activityIndicatorStyle]);

    p_button = &self->_button;
    id v5 = objc_loadWeakRetained((id *)p_button);
    [v5 addSubview:v12];

    BOOL v6 = [(UIActivityIndicatorView *)v12 superview];
    [v6 setClipsToBounds:0];

    [(UIActivityIndicatorView *)v12 startAnimating];
    id v7 = objc_loadWeakRetained((id *)p_button);
    [v7 bounds];
    double MidX = CGRectGetMidX(v14);
    id v9 = objc_loadWeakRetained((id *)p_button);
    [v9 bounds];
    -[UIActivityIndicatorView setCenter:](v12, "setCenter:", MidX, CGRectGetMidY(v15));

    id v10 = objc_loadWeakRetained((id *)p_button);
    [v10 layoutIfNeeded];

    activityIndicatorView = v12;
  }
  else
  {
    [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
    [(UIActivityIndicatorView *)self->_activityIndicatorView removeFromSuperview];
    activityIndicatorView = self->_activityIndicatorView;
    self->_activityIndicatorView = 0;
  }
}

- (BOOL)_shouldAnimateFromState:(int64_t)a3 toState:(int64_t)a4
{
  if (!a3 && a4 == 2) {
    return 0;
  }
  return (a3 != 2 || a4 != 0) && a3 != -1 && a4 != -1;
}

- (void)_authorizationStatusChanged:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  id v4 = +[MKLocationManager sharedLocationManager];
  if ([v4 isLocationServicesRestricted])
  {
    [WeakRetained _setInternallyEnabled:0];
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)&self->_userTrackingView);
    [WeakRetained _setInternallyEnabled:v5 != 0];
  }
}

- (void)setControlSize:(unint64_t)a3
{
  if (self->_controlSize != a3)
  {
    self->_unint64_t controlSize = a3;
    [(_MKUserTrackingButtonController *)self _updatePreferredSymbolConfiguration];
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_MKUserTrackingButtonController;
  [(_MKUserTrackingButtonController *)&v4 dealloc];
}

- (id)_activityIndicatorView
{
  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    id v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_activityIndicatorClass")), "initWithActivityIndicatorStyle:", 100);
    BOOL v6 = self->_activityIndicatorView;
    self->_activityIndicatorView = v5;

    [(UIActivityIndicatorView *)self->_activityIndicatorView setUserInteractionEnabled:0];
    [(UIActivityIndicatorView *)self->_activityIndicatorView setAutoresizingMask:45];
    activityIndicatorView = self->_activityIndicatorView;
  }

  return activityIndicatorView;
}

- (void)_goToNextMode:(id)a3
{
  p_userTrackingView = &self->_userTrackingView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userTrackingView);
  uint64_t v6 = [WeakRetained userTrackingMode];

  unint64_t v7 = [(_MKUserTrackingButtonController *)self buttonBehavior];
  unint64_t v8 = [(_MKUserTrackingButtonController *)self buttonBehavior];
  if (self->_state == 1 && v7 != 1)
  {
    uint64_t v10 = 0;
    goto LABEL_18;
  }
  if (!v6 && v8 != 1)
  {
    uint64_t v10 = 1;
    goto LABEL_18;
  }
  if (!v6 && v8 == 1)
  {
    id v11 = objc_loadWeakRetained((id *)p_userTrackingView);
    char v12 = [v11 isCurrentlyRotated];

    if (v12)
    {
      uint64_t v10 = 2;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v6 != 1)
  {
LABEL_17:
    uint64_t v10 = v7 == 1;
    goto LABEL_18;
  }
  BOOL v13 = v7 == 1;
  id v14 = objc_loadWeakRetained((id *)p_userTrackingView);
  int v15 = [v14 canRotateForHeading];

  if (v15) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = v13;
  }
LABEL_18:
  id v16 = objc_loadWeakRetained((id *)p_userTrackingView);
  [v16 _setUserTrackingMode:v10 animated:1 fromTrackingButton:1];
}

- (id)_shrinkAnimation
{
  v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:0x1ED919508];
  LODWORD(v3) = 1.0;
  objc_super v4 = [NSNumber numberWithFloat:v3];
  [v2 setFromValue:v4];

  id v5 = [NSNumber numberWithFloat:0.0];
  [v2 setToValue:v5];

  UIAnimationDragCoefficient();
  [v2 setDuration:v6 * 0.2];
  [v2 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v2 setRemovedOnCompletion:0];

  return v2;
}

- (id)_expandAnimation
{
  v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:0x1ED919508];
  double v3 = [NSNumber numberWithFloat:0.0];
  [v2 setFromValue:v3];

  LODWORD(v4) = 1.0;
  id v5 = [NSNumber numberWithFloat:v4];
  [v2 setToValue:v5];

  UIAnimationDragCoefficient();
  [v2 setDuration:v6 * 0.2];

  return v2;
}

- (id)_contentAnimation
{
  v2 = [(UIImageView *)self->_imageView layer];
  double v3 = [v2 animationForKey:@"contents"];

  if (v3)
  {
    double v4 = 0;
  }
  else
  {
    double v4 = [v2 contents];

    if (v4)
    {
      double v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"contents"];
      id v5 = (void *)MEMORY[0x1E4F1C978];
      float v6 = [v2 contents];
      unint64_t v7 = [v5 arrayWithObject:v6];
      [v4 setValues:v7];

      [v4 setCalculationMode:*MEMORY[0x1E4F39D78]];
    }
  }

  return v4;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (objc_msgSend(a3, "_mapkit_ID") == 7)
  {
    id v7 = [(UIImageView *)self->_imageView layer];
    [v7 removeAnimationForKey:@"contents"];
    id v5 = [(_MKUserTrackingButtonController *)self _expandAnimation];
    [v7 removeAnimationForKey:@"shrink"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    [WeakRetained _updateForState:self->_state];

    [(_MKUserTrackingButtonController *)self _reloadState];
    [(_MKUserTrackingButtonController *)self _updateLoading];
    [v7 addAnimation:v5 forKey:@"expand"];
  }
}

- (MKUserTrackingView)userTrackingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userTrackingView);

  return (MKUserTrackingView *)WeakRetained;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (unint64_t)buttonBehavior
{
  return self->_buttonBehavior;
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_destroyWeak((id *)&self->_button);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_userTrackingView);

  objc_destroyWeak((id *)&self->_target);
}

@end