@interface AVMobileVolumeChromelessButtonControl
- (AVMicaPackage)micaPackage;
- (AVMobileVolumeChromelessButtonControl)init;
- (AVMobileVolumeChromlesButtonControlDelegate)delegate;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)hitRect;
- (CGSize)intrinsicContentSize;
- (NSString)volumeIconState;
- (UIImageView)imageView;
- (UIView)micaPackageContainerView;
- (id)_imageNameForMicaPackageState;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_updateMicaPackage:(id)a3;
- (void)_volumeControlButtonDidBeginPanning;
- (void)_volumeControlButtonDidEndPanning;
- (void)_volumeControlButtonPanningDidContinueWithXDelta:(double)a3;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)didMoveToWindow;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setImageView:(id)a3;
- (void)setMicaPackage:(id)a3;
- (void)setMicaPackageContainerView:(id)a3;
- (void)setVolumeIconState:(id)a3;
@end

@implementation AVMobileVolumeChromelessButtonControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_micaPackageContainerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_micaPackage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_volumeIconState, 0);

  objc_storeStrong((id *)&self->_micaPackageContainerPointerInteraction, 0);
}

- (void)setMicaPackageContainerView:(id)a3
{
}

- (UIView)micaPackageContainerView
{
  return self->_micaPackageContainerView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (AVMicaPackage)micaPackage
{
  return self->_micaPackage;
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileVolumeChromlesButtonControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileVolumeChromlesButtonControlDelegate *)WeakRetained;
}

- (NSString)volumeIconState
{
  return self->_volumeIconState;
}

- (void)_updateMicaPackage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(UIView *)self avkit_isBeingScrolled];
    v6 = [(AVMobileVolumeChromelessButtonControl *)self volumeIconState];
    [v4 setState:v6 color:0];

    v7 = [v4 rootLayer];
    LODWORD(v8) = 1.0;
    [v7 setOpacity:v8];

    if (v5)
    {
      objc_initWeak(&location, self);
      v9 = (void *)MEMORY[0x1E4FB1818];
      v10 = [(AVMobileVolumeChromelessButtonControl *)self _imageNameForMicaPackageState];
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __60__AVMobileVolumeChromelessButtonControl__updateMicaPackage___block_invoke;
      v39 = &unk_1E5FC2DA8;
      objc_copyWeak(&v40, &location);
      objc_msgSend(v9, "avkit_imageNamed:completion:", v10, &v36);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
      goto LABEL_11;
    }
  }
  else
  {
    v11 = [(AVMobileVolumeChromelessButtonControl *)self volumeIconState];
    [0 setState:v11 color:0];

    v12 = [0 rootLayer];
    LODWORD(v13) = 1.0;
    [v12 setOpacity:v13];
  }
  v14 = [v4 rootLayer];
  v15 = [v14 superlayer];
  v16 = [(AVMobileVolumeChromelessButtonControl *)self micaPackageContainerView];
  v17 = [v16 layer];

  if (v15 != v17)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v18 = [(AVMobileVolumeChromelessButtonControl *)self micaPackageContainerView];
    [(AVMobileVolumeChromelessButtonControl *)self addSubview:v18];

    v19 = [(AVMobileVolumeChromelessButtonControl *)self layer];
    [v19 setCompositingFilter:0];

    v20 = [(AVMobileVolumeChromelessButtonControl *)self micaPackageContainerView];
    v21 = [v20 layer];
    [v21 setCompositingFilter:0];

    v22 = [(AVMobileVolumeChromelessButtonControl *)self micaPackageContainerView];
    v23 = [v22 layer];
    v24 = [v4 rootLayer];
    [v23 addSublayer:v24];

    [MEMORY[0x1E4F39CF8] commit];
  }
  objc_msgSend(v4, "setTargetSize:", 26.0, 26.0);
  [(AVMobileVolumeChromelessButtonControl *)self bounds];
  UIRectGetCenter();
  double v26 = v25;
  double v28 = v27;
  v29 = [v4 rootLayer];
  [v29 position];
  double v31 = v30;
  double v33 = v32;

  if (v26 != v31 || v28 != v33)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v34 = [v4 rootLayer];
    [(AVMobileVolumeChromelessButtonControl *)self bounds];
    UIRectGetCenter();
    objc_msgSend(v34, "setPosition:");

    [MEMORY[0x1E4F39CF8] commit];
  }
  v35 = [(AVMobileVolumeChromelessButtonControl *)self imageView];
  [v35 removeFromSuperview];

LABEL_11:
  [(UIPointerInteraction *)self->_micaPackageContainerPointerInteraction invalidate];
}

uint64_t __60__AVMobileVolumeChromelessButtonControl__updateMicaPackage___block_invoke(id *a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F39CF8];
  id v4 = a2;
  [v3 begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  v6 = [WeakRetained micaPackage];
  v7 = [v6 rootLayer];
  [v7 removeFromSuperlayer];

  id v8 = objc_loadWeakRetained(a1);
  objc_msgSend(v8, "avkit_makeSubtreeDisallowGroupBlending");

  id v9 = objc_loadWeakRetained(a1);
  v10 = [v9 imageView];
  v11 = [v10 layer];
  [v11 setCompositingFilter:*MEMORY[0x1E4F3A2E8]];

  id v12 = objc_loadWeakRetained(a1);
  double v13 = [v12 imageView];
  v14 = [MEMORY[0x1E4FB1618] whiteColor];
  [v13 setTintColor:v14];

  id v15 = objc_loadWeakRetained(a1);
  v16 = [v15 imageView];
  [v16 setImage:v4];

  id v17 = objc_loadWeakRetained(a1);
  v18 = [v17 imageView];
  id v19 = objc_loadWeakRetained(a1);
  [v19 bounds];
  objc_msgSend(v18, "setFrame:");

  id v20 = objc_loadWeakRetained(a1);
  v21 = [v20 imageView];
  [v21 setContentMode:4];

  id v22 = objc_loadWeakRetained(a1);
  v23 = [v22 imageView];
  [v22 addSubview:v23];

  v24 = (void *)MEMORY[0x1E4F39CF8];

  return [v24 commit];
}

- (id)_imageNameForMicaPackageState
{
  if (_imageNameForMicaPackageState_onceToken != -1) {
    dispatch_once(&_imageNameForMicaPackageState_onceToken, &__block_literal_global_3094);
  }
  v3 = (void *)_imageNameForMicaPackageState_imageNamesForStates;
  uint64_t v4 = [(AVMobileVolumeChromelessButtonControl *)self volumeIconState];
  BOOL v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"half";
  }
  v7 = [v3 objectForKeyedSubscript:v6];

  return v7;
}

void __70__AVMobileVolumeChromelessButtonControl__imageNameForMicaPackageState__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"mute";
  v2[1] = @"off";
  v3[0] = @"VolumeMuted";
  v3[1] = @"VolumeZero";
  v2[2] = @"min";
  v2[3] = @"half";
  v3[2] = @"VolumeLow";
  v3[3] = @"VolumeMedium";
  v2[4] = @"full";
  v3[4] = @"VolumeHigh";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)_imageNameForMicaPackageState_imageNamesForStates;
  _imageNameForMicaPackageState_imageNamesForStates = v0;
}

- (void)_volumeControlButtonDidEndPanning
{
  v3 = [(AVMobileVolumeChromelessButtonControl *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVMobileVolumeChromelessButtonControl *)self delegate];
    [v5 volumeControlButtonDidEndPanning:self];
  }
}

- (void)_volumeControlButtonPanningDidContinueWithXDelta:(double)a3
{
  id v5 = [(AVMobileVolumeChromelessButtonControl *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AVMobileVolumeChromelessButtonControl *)self delegate];
    [v7 volumeControlButton:self didContinuePanningWithXDelta:a3];
  }
}

- (void)_volumeControlButtonDidBeginPanning
{
  v3 = [(AVMobileVolumeChromelessButtonControl *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVMobileVolumeChromelessButtonControl *)self delegate];
    [v5 volumeControlButtonDidBeginPanning:self];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = a3;
  id v5 = [v4 view];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = objc_msgSend(MEMORY[0x1E4FB1AE0], "shapeWithRoundedRect:cornerRadius:", v7 + -5.0, v9 + -5.0, v11 + 10.0, v13 + 10.0, 6.0);
  id v15 = objc_alloc(MEMORY[0x1E4FB1D48]);
  v16 = [v4 view];

  id v17 = (void *)[v15 initWithView:v16];
  v18 = [MEMORY[0x1E4FB1AB8] effectWithPreview:v17];
  id v19 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v18 shape:v14];

  return v19;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(AVMobileVolumeChromelessButtonControl *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  [(AVMobileVolumeChromelessButtonControl *)&v6 layoutSubviews];
  v3 = [(AVMobileVolumeChromelessButtonControl *)self micaPackageContainerView];
  [(AVMobileVolumeChromelessButtonControl *)self bounds];
  objc_msgSend(v3, "setFrame:");

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v4 = [(AVMobileVolumeChromelessButtonControl *)self micaPackage];
  id v5 = [v4 rootLayer];
  [(AVMobileVolumeChromelessButtonControl *)self bounds];
  UIRectGetCenter();
  objc_msgSend(v5, "setPosition:");

  [MEMORY[0x1E4F39CF8] commit];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 26.0;
  double v3 = 26.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)hitRect
{
  v10.receiver = self;
  v10.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  [(AVMobileVolumeChromelessButtonControl *)&v10 hitRect];
  double v3 = v2 + -25.0;
  double v5 = v4 + -25.0;
  double v7 = v6 + 50.0;
  double v9 = v8 + 50.0;
  result.size.height = v9;
  result.size.width = v7;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v3;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = [a3 view];
  LOBYTE(self) = [v4 isDescendantOfView:self];

  return (char)self;
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  [(AVMobileVolumeChromelessButtonControl *)&v5 didMoveToWindow];
  if (self)
  {
    double v3 = (UIPointerInteraction *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
    micaPackageContainerPointerInteraction = self->_micaPackageContainerPointerInteraction;
    self->_micaPackageContainerPointerInteraction = v3;

    [(AVMobileVolumeChromelessButtonControl *)self addInteraction:self->_micaPackageContainerPointerInteraction];
  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  [(AVMobileVolumeChromelessButtonControl *)&v5 cancelTrackingWithEvent:a3];
  BOOL hasStartedPanning = self->_hasStartedPanning;
  self->_BOOL hasStartedPanning = 0;
  [(AVMobileVolumeChromelessButtonControl *)self setTracking:0];
  if (hasStartedPanning) {
    [(AVMobileVolumeChromelessButtonControl *)self _volumeControlButtonDidEndPanning];
  }
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  [(AVMobileVolumeChromelessButtonControl *)&v5 endTrackingWithTouch:a3 withEvent:a4];
  if (self->_hasStartedPanning)
  {
    [(AVMobileVolumeChromelessButtonControl *)self setTracking:0];
    [(AVMobileVolumeChromelessButtonControl *)self _volumeControlButtonDidEndPanning];
  }
  else
  {
    [(AVMobileVolumeChromelessButtonControl *)self sendActionsForControlEvents:0x400000];
  }
  self->_BOOL hasStartedPanning = 0;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 preciseLocationInView:self];
  *(float *)&double v8 = self->_startPoint.x - v8;
  *(float *)&double v9 = self->_startPoint.y - v9;
  double v10 = sqrt((float)(*(float *)&v8 * *(float *)&v8) + (float)(*(float *)&v9 * *(float *)&v9));
  CGFloat v11 = [(AVMobileVolumeChromelessButtonControl *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    double v13 = [(AVMobileVolumeChromelessButtonControl *)self delegate];
    char v14 = [v13 volumeControlButtonCanBeginPanning:self];

    char v15 = v14 ^ 1;
  }
  else
  {
    char v15 = 0;
  }
  if (v10 > 15.0)
  {
    if (self->_hasStartedPanning) {
      char v15 = 1;
    }
    if ((v15 & 1) == 0)
    {
      self->_BOOL hasStartedPanning = 1;
      [(AVMobileVolumeChromelessButtonControl *)self _volumeControlButtonDidBeginPanning];
    }
  }
  if (self->_hasStartedPanning)
  {
    [v6 preciseLocationInView:self];
    double v17 = v16;
    [v6 precisePreviousLocationInView:self];
    [(AVMobileVolumeChromelessButtonControl *)self _volumeControlButtonPanningDidContinueWithXDelta:v17 - v18];
  }
  v21.receiver = self;
  v21.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  BOOL v19 = [(AVMobileVolumeChromelessButtonControl *)&v21 continueTrackingWithTouch:v6 withEvent:v7];

  return v19;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  objc_super v5 = self;
  p_startPoint = &self->_startPoint;
  id v7 = a4;
  id v8 = a3;
  [v8 preciseLocationInView:v5];
  p_startPoint->CGFloat x = v9;
  p_startPoint->CGFloat y = v10;
  v12.receiver = v5;
  v12.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  LOBYTE(v5) = [(AVMobileVolumeChromelessButtonControl *)&v12 beginTrackingWithTouch:v8 withEvent:v7];

  return (char)v5;
}

- (void)setVolumeIconState:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_volumeIconState, "isEqualToString:"))
  {
    double v4 = (NSString *)[v7 copy];
    volumeIconState = self->_volumeIconState;
    self->_volumeIconState = v4;

    id v6 = [(AVMobileVolumeChromelessButtonControl *)self micaPackage];
    [(AVMobileVolumeChromelessButtonControl *)self _updateMicaPackage:v6];
  }
}

- (void)setMicaPackage:(id)a3
{
  objc_super v5 = (AVMicaPackage *)a3;
  p_micaPackage = &self->_micaPackage;
  if (self->_micaPackage != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_micaPackage, a3);
    if (v7) {
      p_micaPackage = (AVMicaPackage **)[(AVMobileVolumeChromelessButtonControl *)self _updateMicaPackage:v7];
    }
  }

  MEMORY[0x1F4181820](p_micaPackage);
}

- (AVMobileVolumeChromelessButtonControl)init
{
  v15.receiver = self;
  v15.super_class = (Class)AVMobileVolumeChromelessButtonControl;
  double v2 = -[AVMobileVolumeChromelessButtonControl initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(AVMobileVolumeChromelessButtonControl *)v2 bounds];
    uint64_t v4 = objc_msgSend(v3, "initWithFrame:");
    imageView = v2->_imageView;
    v2->_imageView = (UIImageView *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(AVMobileVolumeChromelessButtonControl *)v2 bounds];
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:");
    micaPackageContainerView = v2->_micaPackageContainerView;
    v2->_micaPackageContainerView = (UIView *)v7;

    [(UIView *)v2->_micaPackageContainerView setUserInteractionEnabled:0];
    CGFloat v9 = [(UIView *)v2->_micaPackageContainerView layer];
    [v9 setAllowsGroupBlending:0];

    uint64_t v10 = [(AVMobileVolumeChromelessButtonControl *)v2 effectiveUserInterfaceLayoutDirection];
    objc_initWeak(&location, v2);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__AVMobileVolumeChromelessButtonControl_init__block_invoke;
    v12[3] = &unk_1E5FC3DE8;
    objc_copyWeak(&v13, &location);
    +[AVMicaPackage asynchronouslyPrepareMicaPackageWithName:@"VolumeGlyph" layoutDirection:v10 completion:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __45__AVMobileVolumeChromelessButtonControl_init__block_invoke(uint64_t a1, void *a2)
{
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateMicaPackage:v3];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setMicaPackage:v3];
}

@end