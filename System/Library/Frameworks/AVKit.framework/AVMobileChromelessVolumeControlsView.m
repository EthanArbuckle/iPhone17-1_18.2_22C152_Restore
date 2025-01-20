@interface AVMobileChromelessVolumeControlsView
- (AVMobileChromelessSlider)volumeSlider;
- (AVMobileChromelessVolumeControlsView)init;
- (AVMobileChromelessVolumeControlsViewDelegate)delegate;
- (AVMobileVolumeChromelessButtonControl)volumeButton;
- (BOOL)drawsShadow;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEmphasized;
- (BOOL)isMuted;
- (BOOL)isTracking;
- (BOOL)isTrackingEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)prefersVolumeSliderIncluded;
- (BOOL)volumeControlButtonCanBeginPanning:(id)a3;
- (BOOL)volumeSliderHidesWithAlphaChange;
- (CGSize)intrinsicContentSize;
- (double)volume;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (uint64_t)_isFluidSlider;
- (void)_handleVolumeControlButtonTap;
- (void)_layoutVolumeControlView;
- (void)_notifyDelegateVolumeSliderValueDidChangeTo:(id *)a1;
- (void)_setSliderValue:(double)a3 forUpdateReason:(unint64_t)a4;
- (void)_setVolume:(double)a3 forUpdateReason:(unint64_t)a4;
- (void)_updateShadowAppearanceState;
- (void)_updateShadowPathIfNeeded;
- (void)_updateVolumeButtonIconState;
- (void)_volumeSliderValueDidChange;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAllowsVolumeAdjustment:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawsShadow:(BOOL)a3;
- (void)setEmphasized:(BOOL)a3;
- (void)setMute:(BOOL)a3;
- (void)setPrefersVolumeSliderIncluded:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setVolumeButton:(id)a3;
- (void)setVolumeSlider:(id)a3;
- (void)setVolumeSliderHidesWithAlphaChange:(BOOL)a3;
- (void)sliderDidBeginTracking:(id)a3;
- (void)sliderWillEndTracking:(id)a3;
- (void)volumeControlButton:(id)a3 didContinuePanningWithXDelta:(double)a4;
- (void)volumeControlButtonDidBeginPanning:(id)a3;
- (void)volumeControlButtonDidEndPanning:(id)a3;
@end

@implementation AVMobileChromelessVolumeControlsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_storeStrong((id *)&self->_volumeButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enabledUnfilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_enabledFilledBarViewEffect, 0);
  objc_storeStrong((id *)&self->_emphasizedAnimator, 0);

  objc_storeStrong((id *)&self->_volumeControls, 0);
}

- (void)setVolumeSlider:(id)a3
{
}

- (AVMobileChromelessSlider)volumeSlider
{
  return self->_volumeSlider;
}

- (void)setVolumeButton:(id)a3
{
}

- (AVMobileVolumeChromelessButtonControl)volumeButton
{
  return self->_volumeButton;
}

- (void)setVolumeSliderHidesWithAlphaChange:(BOOL)a3
{
  self->_volumeSliderHidesWithAlphaChange = a3;
}

- (BOOL)volumeSliderHidesWithAlphaChange
{
  return self->_volumeSliderHidesWithAlphaChange;
}

- (double)volume
{
  return self->_volume;
}

- (BOOL)isMuted
{
  return self->_mute;
}

- (BOOL)isEmphasized
{
  return self->_emphasized;
}

- (BOOL)prefersVolumeSliderIncluded
{
  return self->_prefersVolumeSliderIncluded;
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileChromelessVolumeControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileChromelessVolumeControlsViewDelegate *)WeakRetained;
}

- (BOOL)drawsShadow
{
  return self->_drawsShadow;
}

- (BOOL)isTrackingEnabled
{
  return self->_allowsVolumeAdjustment;
}

- (void)_volumeSliderValueDidChange
{
  [(AVMobileChromelessSlider *)self->_volumeSlider value];
  double v4 = v3;
  [(AVMobileChromelessVolumeControlsView *)self _setVolume:0 forUpdateReason:v3];

  -[AVMobileChromelessVolumeControlsView _notifyDelegateVolumeSliderValueDidChangeTo:]((id *)&self->super.super.super.super.isa, v4);
}

- (void)_notifyDelegateVolumeSliderValueDidChangeTo:(id *)a1
{
  if (a1)
  {
    id v7 = [a1 delegate];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = a1[73];
      uint64_t v5 = [v4 _fluidUpdateSource];
      char v6 = objc_opt_respondsToSelector();

      if (v6) {
        [v7 volumeControlsView:a1 volumeDidChangeTo:v5 withUpdateSource:a2];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v7 volumeControlsView:a1 volumeDidChangeTo:a2];
    }
  }
}

- (void)_updateVolumeButtonIconState
{
  if ([(AVMobileChromelessVolumeControlsView *)self isMuted])
  {
    v9 = @"mute";
    float v3 = @"mute";
    volumeButton = self->_volumeButton;
    uint64_t v5 = @"Unmute";
  }
  else
  {
    [(AVMobileChromelessVolumeControlsView *)self volume];
    if (v6 <= 0.0)
    {
      id v7 = AVVolumeGlyphStateNameMuted;
    }
    else if (v6 >= 0.33)
    {
      if (v6 >= 0.66)
      {
        id v7 = &AVVolumeGlyphStateNameMax;
        if (v6 < 0.95) {
          id v7 = AVVolumeGlyphStateNameHigh;
        }
      }
      else
      {
        id v7 = AVVolumeGlyphStateNameMedium;
      }
    }
    else
    {
      id v7 = AVVolumeGlyphStateNameLow;
    }
    v9 = *v7;
    volumeButton = self->_volumeButton;
    uint64_t v5 = @"Mute";
  }
  v8 = AVLocalizedString(v5);
  [(AVMobileVolumeChromelessButtonControl *)volumeButton setAccessibilityLabel:v8];

  [(AVMobileVolumeChromelessButtonControl *)self->_volumeButton setVolumeIconState:v9];
}

- (void)_setVolume:(double)a3 forUpdateReason:(unint64_t)a4
{
  if (self->_volume != a3)
  {
    self->_volume = fmin(fmax(a3, 0.0), 1.0);
    -[AVMobileChromelessVolumeControlsView _setSliderValue:forUpdateReason:](self, "_setSliderValue:forUpdateReason:", a4);
  }
}

- (void)_setSliderValue:(double)a3 forUpdateReason:(unint64_t)a4
{
  int isFluid = -[AVMobileChromelessVolumeControlsView _isFluidSlider]((uint64_t)self);
  volumeSlider = self->_volumeSlider;
  if (isFluid)
  {
    v8 = volumeSlider;
    uint64_t v9 = [(AVMobileChromelessSlider *)v8 _fluidUpdateSource];
    if (a4 == 1 || v9 != 10)
    {
      double volume = self->_volume;
      *(float *)&double volume = volume;
      [(AVMobileChromelessSlider *)v8 setValue:1 animated:volume];
    }
  }
  else
  {
    double v11 = self->_volume;
    *(float *)&double v11 = v11;
    [(AVMobileChromelessSlider *)volumeSlider setValue:v11];
  }

  [(AVMobileChromelessVolumeControlsView *)self _updateVolumeButtonIconState];
}

- (uint64_t)_isFluidSlider
{
  if (a1)
  {
    objc_opt_class();
    LOBYTE(a1) = objc_opt_isKindOfClass();
  }
  return a1 & 1;
}

- (void)_layoutVolumeControlView
{
  [(AVMobileChromelessVolumeControlsView *)self bounds];
  double v4 = v3;
  uint64_t v5 = [(AVMobileChromelessVolumeControlsView *)self effectiveUserInterfaceLayoutDirection];
  if (v4 >= v4 / 1.28) {
    double v6 = v4;
  }
  else {
    double v6 = v4 / 1.28;
  }
  volumeControls = self->_volumeControls;

  -[UIView avkit_setFrame:inLayoutDirection:](volumeControls, "avkit_setFrame:inLayoutDirection:", v5, v4 - v6, 0.0);
}

- (void)_handleVolumeControlButtonTap
{
  double v3 = [(AVMobileChromelessVolumeControlsView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVMobileChromelessVolumeControlsView *)self delegate];
    [v5 volumeControlsViewButtonWasTapped:self];
  }
}

- (void)sliderWillEndTracking:(id)a3
{
  char v4 = [(AVMobileChromelessVolumeControlsView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVMobileChromelessVolumeControlsView *)self delegate];
    [v6 volumeControlsViewInteractionDidEnd:self];
  }
}

- (void)sliderDidBeginTracking:(id)a3
{
  char v4 = [(AVMobileChromelessVolumeControlsView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVMobileChromelessVolumeControlsView *)self delegate];
    [v6 volumeControlsViewInteractionDidBegin:self];
  }
}

- (void)volumeControlButton:(id)a3 didContinuePanningWithXDelta:(double)a4
{
  [(AVMobileChromelessSlider *)self->_volumeSlider frame];
  double Width = CGRectGetWidth(v14);
  uint64_t v7 = [(AVMobileChromelessVolumeControlsView *)self effectiveUserInterfaceLayoutDirection];
  if (Width > 0.0)
  {
    uint64_t v8 = v7;
    [(AVMobileChromelessSlider *)self->_volumeSlider value];
    float v10 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v11 = a4 / Width;
      if (v8 == 1) {
        double v11 = -(a4 / Width);
      }
      double v12 = fmin(fmax(v11 + v10, 0.0), 1.0);
      [(AVMobileChromelessVolumeControlsView *)self setVolume:0 forUpdateReason:v12];
      [(AVMobileChromelessVolumeControlsView *)self _updateVolumeButtonIconState];
      -[AVMobileChromelessVolumeControlsView _notifyDelegateVolumeSliderValueDidChangeTo:]((id *)&self->super.super.super.super.isa, v12);
    }
  }
}

- (void)volumeControlButtonDidEndPanning:(id)a3
{
  char v4 = [(AVMobileChromelessVolumeControlsView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVMobileChromelessVolumeControlsView *)self delegate];
    [v6 volumeControlsViewInteractionDidEnd:self];
  }
}

- (void)volumeControlButtonDidBeginPanning:(id)a3
{
  char v4 = [(AVMobileChromelessVolumeControlsView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(AVMobileChromelessVolumeControlsView *)self delegate];
    [v6 volumeControlsViewInteractionDidBegin:self];
  }
}

- (BOOL)volumeControlButtonCanBeginPanning:(id)a3
{
  return self->_allowsVolumeAdjustment;
}

- (void)setDrawsShadow:(BOOL)a3
{
  if (self->_drawsShadow != a3)
  {
    self->_drawsShadow = a3;
    -[AVMobileChromelessVolumeControlsView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);
  }
}

- (void)_updateShadowAppearanceState
{
  if (a1)
  {
    id v11 = [a1[73] layer];
    v2 = [a1[72] layer];
    if ([a1 drawsShadow])
    {
      double v3 = [MEMORY[0x1E4FB1618] blackColor];
      char v4 = [MEMORY[0x1E4FB1618] blackColor];
      float v5 = 1.0;
      int v6 = 1053609165;
    }
    else
    {
      double v3 = 0;
      char v4 = 0;
      float v5 = 0.0;
      int v6 = 0;
    }
    id v7 = v3;
    objc_msgSend(v11, "setShadowColor:", objc_msgSend(v7, "CGColor"));
    *(float *)&double v8 = v5;
    [v11 setShadowOpacity:v8];
    id v9 = v4;
    objc_msgSend(v2, "setShadowColor:", objc_msgSend(v9, "CGColor"));
    LODWORD(v10) = v6;
    [v2 setShadowOpacity:v10];
    -[AVMobileChromelessVolumeControlsView _updateShadowPathIfNeeded]((uint64_t)a1);
  }
}

- (void)_updateShadowPathIfNeeded
{
  if (a1 && [(id)a1 drawsShadow])
  {
    id v21 = [*(id *)(a1 + 584) layer];
    [v21 bounds];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    if (CGRectIsNull(*(CGRect *)(a1 + 488))
      || (v23.origin.x = v3,
          v23.origin.y = v5,
          v23.size.width = v7,
          v23.size.height = v9,
          !CGRectEqualToRect(*(CGRect *)(a1 + 488), v23)))
    {
      *(double *)(a1 + 488) = v3;
      *(double *)(a1 + 496) = v5;
      *(double *)(a1 + 504) = v7;
      *(double *)(a1 + 512) = v9;
      objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v3, v5, v7, v9);
      id v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setShadowPath:", objc_msgSend(v10, "CGPath"));
    }
    id v11 = [*(id *)(a1 + 576) layer];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16 + 5.0;
    double v19 = v18 + -5.0;
    if (CGRectIsNull(*(CGRect *)(a1 + 520))
      || (v24.origin.x = v19,
          v24.origin.y = v13,
          v24.size.width = v17,
          v24.size.height = v15,
          !CGRectEqualToRect(*(CGRect *)(a1 + 520), v24)))
    {
      *(double *)(a1 + 520) = v19;
      *(double *)(a1 + 528) = v13;
      *(double *)(a1 + 536) = v17;
      *(double *)(a1 + 544) = v15;
      objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v19, v13, v17, v15);
      id v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setShadowPath:", objc_msgSend(v20, "CGPath"));
    }
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVMobileChromelessVolumeControlsView;
  [(AVMobileChromelessVolumeControlsView *)&v5 setUserInteractionEnabled:a3];
  if (self)
  {
    if ([(AVMobileChromelessVolumeControlsView *)self isUserInteractionEnabled])BOOL allowsVolumeAdjustment = self->_allowsVolumeAdjustment; {
    else
    }
      BOOL allowsVolumeAdjustment = 0;
    [(AVMobileChromelessSlider *)self->_volumeSlider setEnabled:allowsVolumeAdjustment];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v6 = self;
  v11.receiver = self;
  v11.super_class = (Class)AVMobileChromelessVolumeControlsView;
  id v7 = a4;
  unsigned __int8 v8 = -[AVMobileChromelessVolumeControlsView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  volumeButton = v6->_volumeButton;
  -[AVMobileVolumeChromelessButtonControl convertPoint:fromView:](volumeButton, "convertPoint:fromView:", v6, x, y, v11.receiver, v11.super_class);
  LOBYTE(v6) = -[AVMobileVolumeChromelessButtonControl pointInside:withEvent:](volumeButton, "pointInside:withEvent:", v7);

  return v8 | v6;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)AVMobileChromelessVolumeControlsView;
  [(AVView *)&v35 layoutSubviews];
  [(AVMobileChromelessVolumeControlsView *)self _layoutVolumeControlView];
  if (-[AVMobileChromelessVolumeControlsView _isFluidSlider]((uint64_t)self))
  {
    if (self)
    {
      [(UIView *)self->_volumeControls bounds];
      double v4 = v3;
      double v6 = v5;
      uint64_t v7 = [(AVMobileChromelessVolumeControlsView *)self effectiveUserInterfaceLayoutDirection];
      [(AVMobileVolumeChromelessButtonControl *)self->_volumeButton intrinsicContentSize];
      double v9 = v8;
      [(AVMobileChromelessSlider *)self->_volumeSlider intrinsicContentSize];
      double v11 = v10;
      double v12 = v9 + 140.0;
      double v13 = v4 - v9;
      if (v9 >= v4 - v9) {
        double v13 = v9;
      }
      BOOL v14 = v4 <= v12;
      if (v4 <= v12) {
        double v12 = v13;
      }
      if (v4 * 0.5 < v9 + 179.2 || !self->_emphasized) {
        double v16 = v12;
      }
      else {
        double v16 = v9 + 179.2;
      }
      [(AVMobileVolumeChromelessButtonControl *)self->_volumeButton frame];
      -[AVMobileVolumeChromelessButtonControl setFrame:](self->_volumeButton, "setFrame:");
      double v17 = self->_volumeSlider;
      [(AVMobileChromelessSlider *)v17 setBarWidth:v16 - v9 + -12.0];
      -[UIView avkit_setFrame:inLayoutDirection:](self->_volumeSlider, "avkit_setFrame:inLayoutDirection:", v7, v4 - v16, (v6 - v11 * 0.5) * 0.5, v16, v11);
      [(AVMobileChromelessSlider *)v17 setPrefersSliderTrackHidden:v14];
    }
  }
  else if (self)
  {
    [(UIView *)self->_volumeControls bounds];
    double v19 = v18;
    double v21 = v20;
    uint64_t v22 = [(AVMobileChromelessVolumeControlsView *)self effectiveUserInterfaceLayoutDirection];
    [(AVMobileVolumeChromelessButtonControl *)self->_volumeButton intrinsicContentSize];
    double v24 = v23;
    double v26 = v25;
    [(AVMobileChromelessSlider *)self->_volumeSlider intrinsicContentSize];
    double v28 = v27;
    double v29 = v24 + 12.0;
    if (v19 < v24) {
      double v29 = 0.0;
    }
    double v30 = v19 - v29;
    if (v19 >= v24) {
      -[UIView avkit_setFrame:inLayoutDirection:](self->_volumeButton, "avkit_setFrame:inLayoutDirection:", v22, v19 - v24, (v21 - v26) * 0.5, v24, v26);
    }
    double v31 = 179.2;
    if (v30 * 0.5 < 179.2 || !self->_emphasized) {
      double v31 = 140.0;
    }
    double v33 = v19 - v24 - v31 + -12.0;
    if (!self->_volumeSliderHidesWithAlphaChange)
    {
      double v34 = -0.0;
      if (!self->_prefersVolumeSliderIncluded) {
        double v34 = v31;
      }
      double v33 = v33 + v34;
      if (!self->_prefersVolumeSliderIncluded) {
        double v31 = 0.0;
      }
    }
    -[UIView avkit_setFrame:inLayoutDirection:](self->_volumeSlider, "avkit_setFrame:inLayoutDirection:", v22, v33, (v21 - v28) * 0.5, v31, v28);
    [(AVMobileVolumeChromelessButtonControl *)self->_volumeButton setHidden:v19 < v24];
    [(AVMobileChromelessSlider *)self->_volumeSlider setHidden:v30 < 140.0];
  }
  -[AVMobileChromelessVolumeControlsView _updateShadowPathIfNeeded]((uint64_t)self);
}

- (CGSize)intrinsicContentSize
{
  [(AVMobileVolumeChromelessButtonControl *)self->_volumeButton intrinsicContentSize];
  double v5 = 26.0;
  if (v4 >= 26.0) {
    double v5 = v4;
  }
  if (self->_prefersVolumeSliderIncluded)
  {
    double v4 = v5;
    double v3 = v3 + 152.0;
  }
  double v6 = v4 + -10.0;
  result.height = v6;
  result.width = v3;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVMobileChromelessVolumeControlsView;
  double v8 = -[AVView hitTest:withEvent:](&v14, sel_hitTest_withEvent_, v7, x, y);
  if ([(AVMobileChromelessVolumeControlsView *)self isUserInteractionEnabled])
  {
    p_volumeButton = (id *)&self->_volumeButton;
    volumeButton = self->_volumeButton;
    -[AVMobileVolumeChromelessButtonControl convertPoint:fromView:](volumeButton, "convertPoint:fromView:", self, x, y);
    if (-[AVMobileVolumeChromelessButtonControl pointInside:withEvent:](volumeButton, "pointInside:withEvent:", v7)
      || (p_volumeButton = (id *)&self->_volumeSlider,
          volumeSlider = self->_volumeSlider,
          -[AVMobileChromelessSlider convertPoint:fromView:](volumeSlider, "convertPoint:fromView:", self, x, y),
          -[AVMobileChromelessSlider pointInside:withEvent:](volumeSlider, "pointInside:withEvent:", v7)))
    {
      id v12 = *p_volumeButton;

      double v8 = v12;
    }
  }

  return v8;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = [a3 view];
  LOBYTE(self) = [v4 isDescendantOfView:self];

  return (char)self;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessVolumeControlsView;
  [(AVMobileChromelessVolumeControlsView *)&v6 didMoveToWindow];
  double volume = self->_volume;
  *(float *)&double volume = volume;
  [(AVMobileChromelessSlider *)self->_volumeSlider setValue:volume];
  double v4 = [(AVMobileChromelessSlider *)self->_volumeSlider layer];
  double v5 = [(AVMobileVolumeChromelessButtonControl *)self->_volumeButton layer];
  objc_msgSend(v4, "setShadowOffset:", 0.0, 6.0);
  [v4 setShadowRadius:10.0];
  objc_msgSend(v5, "setShadowOffset:", 0.0, 6.0);
  [v5 setShadowRadius:10.0];
  -[AVMobileChromelessVolumeControlsView _updateShadowAppearanceState]((id *)&self->super.super.super.super.isa);

  [(AVMobileChromelessVolumeControlsView *)self _updateVolumeButtonIconState];
}

- (void)setAllowsVolumeAdjustment:(BOOL)a3
{
  if (self->_allowsVolumeAdjustment != a3)
  {
    self->_BOOL allowsVolumeAdjustment = a3;
    if ([(AVMobileChromelessVolumeControlsView *)self isUserInteractionEnabled])BOOL allowsVolumeAdjustment = self->_allowsVolumeAdjustment; {
    else
    }
      BOOL allowsVolumeAdjustment = 0;
    volumeSlider = self->_volumeSlider;
    [(AVMobileChromelessSlider *)volumeSlider setEnabled:allowsVolumeAdjustment];
  }
}

- (void)setPrefersVolumeSliderIncluded:(BOOL)a3
{
  if (self->_prefersVolumeSliderIncluded != a3)
  {
    self->_prefersVolumeSliderIncluded = a3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(AVMobileChromelessSlider *)self->_volumeSlider setPrefersSliderTrackHidden:!self->_prefersVolumeSliderIncluded];
      [(AVMobileChromelessVolumeControlsView *)self invalidateIntrinsicContentSize];
      double v4 = [(AVMobileChromelessVolumeControlsView *)self superview];
      objc_msgSend(v4, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

      [(AVMobileChromelessVolumeControlsView *)self setNeedsLayout];
    }
    else if (self->_volumeSliderHidesWithAlphaChange)
    {
      double v5 = 1.0;
      if (!self->_prefersVolumeSliderIncluded) {
        double v5 = 0.0;
      }
      volumeSlider = self->_volumeSlider;
      [(AVMobileChromelessSlider *)volumeSlider setAlpha:v5];
    }
    else
    {
      [(AVMobileChromelessVolumeControlsView *)self setNeedsLayout];
      [(AVMobileChromelessVolumeControlsView *)self layoutIfNeeded];
    }
  }
}

- (void)setMute:(BOOL)a3
{
  if (self->_mute != a3)
  {
    self->_mute = a3;
    [(AVMobileChromelessVolumeControlsView *)self _updateVolumeButtonIconState];
  }
}

- (BOOL)isTracking
{
  if ([(AVMobileChromelessSlider *)self->_volumeSlider isTracking]) {
    return 1;
  }
  volumeButton = self->_volumeButton;

  return [(AVMobileVolumeChromelessButtonControl *)volumeButton isTracking];
}

- (void)setEmphasized:(BOOL)a3
{
  if (self->_emphasized != a3)
  {
    self->_emphasized = a3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      emphasizedAnimator = self->_emphasizedAnimator;
      double v5 = 1.0;
      if (emphasizedAnimator
        && [(UIViewPropertyAnimator *)emphasizedAnimator isRunning]
        && [(UIViewPropertyAnimator *)self->_emphasizedAnimator isInterruptible])
      {
        [(UIViewPropertyAnimator *)self->_emphasizedAnimator fractionComplete];
        double v5 = v6;
        [(UIViewPropertyAnimator *)self->_emphasizedAnimator stopAnimation:1];
        [(UIViewPropertyAnimator *)self->_emphasizedAnimator finishAnimationAtPosition:2];
        id v7 = self->_emphasizedAnimator;
        self->_emphasizedAnimator = 0;
      }
      objc_initWeak(&location, self);
      id v8 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      if (v5 <= 1.0) {
        double v9 = v5 * 0.2;
      }
      else {
        double v9 = 0.2;
      }
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __79__AVMobileChromelessVolumeControlsView__updateVolumeFluidSliderEmphasizedScale__block_invoke;
      double v23 = &unk_1E5FC44F8;
      objc_copyWeak(&v24, &location);
      double v10 = (UIViewPropertyAnimator *)[v8 initWithDuration:3 curve:&v20 animations:v9];
      double v11 = self->_emphasizedAnimator;
      self->_emphasizedAnimator = v10;

      [(UIViewPropertyAnimator *)self->_emphasizedAnimator startAnimation];
    }
    else
    {
      id v12 = self->_emphasizedAnimator;
      double v13 = 1.0;
      if (v12
        && [(UIViewPropertyAnimator *)v12 isRunning]
        && [(UIViewPropertyAnimator *)self->_emphasizedAnimator isInterruptible])
      {
        [(UIViewPropertyAnimator *)self->_emphasizedAnimator fractionComplete];
        double v13 = v14;
        [(UIViewPropertyAnimator *)self->_emphasizedAnimator stopAnimation:1];
        [(UIViewPropertyAnimator *)self->_emphasizedAnimator finishAnimationAtPosition:2];
        double v15 = self->_emphasizedAnimator;
        self->_emphasizedAnimator = 0;
      }
      objc_initWeak(&location, self);
      id v16 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      if (v13 <= 1.0) {
        double v17 = v13 * 0.2;
      }
      else {
        double v17 = 0.2;
      }
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __74__AVMobileChromelessVolumeControlsView__updateVolumeSliderEmphasizedScale__block_invoke;
      double v23 = &unk_1E5FC44F8;
      objc_copyWeak(&v24, &location);
      double v18 = (UIViewPropertyAnimator *)[v16 initWithDuration:3 curve:&v20 animations:v17];
      double v19 = self->_emphasizedAnimator;
      self->_emphasizedAnimator = v18;

      [(UIViewPropertyAnimator *)self->_emphasizedAnimator startAnimation];
    }
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __74__AVMobileChromelessVolumeControlsView__updateVolumeSliderEmphasizedScale__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[73];
    if (*((unsigned char *)v2 + 555))
    {
      [v3 setBarHeight:9.5];
      [v2[57] bounds];
      double v5 = v4;
      [v2[72] intrinsicContentSize];
      if (v5 - v6 + -12.0 >= 179.2)
      {
        id v7 = v2[73];
        CGAffineTransformMakeScale(&v11, 1.28, 1.0);
        [v7 setTransform:&v11];
      }
      [v2 layoutIfNeeded];
      [v2 setNeedsLayout];
    }
    else
    {
      [v3 setBarHeight:7.5];
      [v2 setNeedsLayout];
      id v8 = v2[73];
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v10[0] = *MEMORY[0x1E4F1DAB8];
      v10[1] = v9;
      v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v8 setTransform:v10];
      [v2 layoutIfNeeded];
    }
  }
}

void __79__AVMobileChromelessVolumeControlsView__updateVolumeFluidSliderEmphasizedScale__block_invoke(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = WeakRetained[555];
    double v5 = WeakRetained;
    id v3 = (void *)*((void *)WeakRetained + 73);
    double v4 = 9.5;
    if (!v2) {
      double v4 = 7.5;
    }
    [v3 setBarHeight:v4];
    [v5 setNeedsLayout];
    [v5 layoutIfNeeded];
    id WeakRetained = v5;
  }
}

- (AVMobileChromelessVolumeControlsView)init
{
  v25.receiver = self;
  v25.super_class = (Class)AVMobileChromelessVolumeControlsView;
  int v2 = [(AVView *)&v25 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:14];
    double v4 = (void *)*((void *)v2 + 59);
    *((void *)v2 + 59) = v3;

    uint64_t v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:11];
    double v6 = (void *)*((void *)v2 + 60);
    *((void *)v2 + 60) = v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v8 = (void *)*((void *)v2 + 57);
    *((void *)v2 + 57) = v7;

    [*((id *)v2 + 57) setAutoresizingMask:0];
    long long v9 = objc_alloc_init(AVMobileVolumeChromelessButtonControl);
    double v10 = (void *)*((void *)v2 + 72);
    *((void *)v2 + 72) = v9;

    [*((id *)v2 + 72) setAccessibilityIdentifier:@"Mute/Unmute"];
    CGAffineTransform v11 = (void *)*((void *)v2 + 72);
    id v12 = AVLocalizedString(@"Mute");
    [v11 setAccessibilityLabel:v12];

    [*((id *)v2 + 72) setIsAccessibilityElement:1];
    [*((id *)v2 + 72) setAutoresizingMask:0];
    [*((id *)v2 + 72) setHidden:1];
    [*((id *)v2 + 72) setDelegate:v2];
    [*((id *)v2 + 72) addTarget:v2 action:sel__handleVolumeControlButtonTap forControlEvents:0x400000];
    double v13 = +[AVKitGlobalSettings shared];
    LODWORD(v12) = [v13 fluidSliderEnabled];

    if (v12)
    {
      double v14 = objc_alloc_init(AVMobileChromelessFluidSlider);
      [(AVMobileChromelessFluidSlider *)v14 setUsesVolumeStyle:1];
      [(AVMobileChromelessFluidSlider *)v14 setMaximumValueView:*((void *)v2 + 72)];
      [(AVMobileChromelessFluidSlider *)v14 setStretchLimit:10.0];
      double v15 = (void *)*((void *)v2 + 73);
      *((void *)v2 + 73) = v14;
      id v16 = v14;

      [*((id *)v2 + 72) setHidden:0];
      [*((id *)v2 + 73) setHidden:0];
    }
    else
    {
      double v17 = objc_alloc_init(AVMobileChromelessSlider);
      double v18 = (void *)*((void *)v2 + 73);
      *((void *)v2 + 73) = v17;

      [*((id *)v2 + 57) addSubview:*((void *)v2 + 72)];
    }
    [*((id *)v2 + 73) setAccessibilityIdentifier:@"Volume Slider"];
    double v19 = (void *)*((void *)v2 + 73);
    uint64_t v20 = AVLocalizedString(@"Volume Slider");
    [v19 setAccessibilityLabel:v20];

    [*((id *)v2 + 73) setIsAccessibilityElement:1];
    [*((id *)v2 + 73) setAutoresizingMask:0];
    [*((id *)v2 + 73) setHidden:0];
    [*((id *)v2 + 73) setDelegate:v2];
    [*((id *)v2 + 73) setMinimumValue:0.0];
    LODWORD(v21) = 1.0;
    [*((id *)v2 + 73) setMaximumValue:v21];
    [*((id *)v2 + 73) setBarHeight:7.5];
    [*((id *)v2 + 73) addTarget:v2 action:sel__volumeSliderValueDidChange forControlEvents:4096];
    [*((id *)v2 + 57) addSubview:*((void *)v2 + 73)];
    [v2 addSubview:*((void *)v2 + 57)];
    *((_WORD *)v2 + 277) = 1;
    v2[557] = 1;
    v2[556] = 0;
    long long v23 = *MEMORY[0x1E4F1DB20];
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v2 + 488) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v2 + 504) = v22;
    *(_OWORD *)(v2 + 520) = v23;
    *(_OWORD *)(v2 + 536) = v22;
    [v2 setIgnoresTouches:1];
  }
  return (AVMobileChromelessVolumeControlsView *)v2;
}

@end