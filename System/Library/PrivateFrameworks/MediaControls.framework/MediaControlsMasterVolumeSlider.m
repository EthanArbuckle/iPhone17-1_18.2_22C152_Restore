@interface MediaControlsMasterVolumeSlider
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isSyncingEnabled;
- (MediaControlsMasterVolumeSlider)initWithFrame:(CGRect)a3;
- (MediaControlsMasterVolumeSliderDelegate)delegate;
- (UIImpactFeedbackGenerator)positiveFeedbackGenerator;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (UINotificationFeedbackGenerator)negativeFeedbackGenerator;
- (id)createThumbView;
- (int64_t)syncState;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)handleLongPress:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setNegativeFeedbackGenerator:(id)a3;
- (void)setPositiveFeedbackGenerator:(id)a3;
- (void)setSyncState:(int64_t)a3;
- (void)setSyncingEnabled:(BOOL)a3;
- (void)shrinkThumbAfterDelay:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MediaControlsMasterVolumeSlider

- (MediaControlsMasterVolumeSlider)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MediaControlsMasterVolumeSlider;
  v3 = -[MPVolumeSlider initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MediaControlsMasterVolumeSlider *)v3 setSyncState:0];
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v6 = [(MPVolumeSlider *)v4 thumbView];
    [v6 frame];
    uint64_t v7 = objc_msgSend(v5, "initWithFrame:");
    growingThumbView = v4->_growingThumbView;
    v4->_growingThumbView = (UIView *)v7;

    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v4->_growingThumbView setBackgroundColor:v9];

    [(UIView *)v4->_growingThumbView setAlpha:1.0];
    [(UIView *)v4->_growingThumbView setUserInteractionEnabled:0];
    v10 = [(UIView *)v4->_growingThumbView layer];
    [v10 setShadowRadius:5.0];

    v11 = [(UIView *)v4->_growingThumbView layer];
    LODWORD(v12) = 1045220557;
    [v11 setShadowOpacity:v12];

    [(MediaControlsMasterVolumeSlider *)v4 addSubview:v4->_growingThumbView];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v4 action:sel_handleLongPress_];
    longPressRecognizer = v4->_longPressRecognizer;
    v4->_longPressRecognizer = (UILongPressGestureRecognizer *)v13;

    [(UILongPressGestureRecognizer *)v4->_longPressRecognizer setCancelsTouchesInView:0];
    [(UILongPressGestureRecognizer *)v4->_longPressRecognizer setDelegate:v4];
    [(UILongPressGestureRecognizer *)v4->_longPressRecognizer setAllowableMovement:30.0];
    [(MediaControlsMasterVolumeSlider *)v4 addGestureRecognizer:v4->_longPressRecognizer];
  }
  return v4;
}

- (id)createThumbView
{
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsMasterVolumeSlider;
  id v3 = [(MediaControlsVolumeSlider *)&v6 createThumbView];
  v4 = [(MPVolumeSlider *)self thumbView];
  [v4 setHidden:1];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsMasterVolumeSlider;
  [(MediaControlsMasterVolumeSlider *)&v5 traitCollectionDidChange:a3];
  v4 = [(MediaControlsMasterVolumeSlider *)self traitCollection];
  -[UILongPressGestureRecognizer setEnabled:](self->_longPressRecognizer, "setEnabled:", [v4 forceTouchCapability] == 1);
}

- (void)setSyncState:(int64_t)a3
{
  if (self->_syncState == a3 || !self->_syncingEnabled) {
    return;
  }
  id v9 = [(MediaControlsMasterVolumeSlider *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int v5 = [v9 slider:self syncStateWillChangeFromState:self->_syncState toState:a3];
  }
  else {
    int v5 = 1;
  }
  self->_syncState = a3;
  int64_t v6 = [(MediaControlsMasterVolumeSlider *)self syncState];
  if (v6 == 4)
  {
    uint64_t v7 = self;
    uint64_t v8 = 0;
LABEL_12:
    [(MediaControlsMasterVolumeSlider *)v7 setSyncState:v8];
    goto LABEL_14;
  }
  if (v6 == 1)
  {
    if (!v5)
    {
      [(UINotificationFeedbackGenerator *)self->_negativeFeedbackGenerator notificationOccurred:2];
      [(UINotificationFeedbackGenerator *)self->_negativeFeedbackGenerator prepare];
      [(MediaControlsMasterVolumeSlider *)self setSyncState:3];
      [(MediaControlsMasterVolumeSlider *)self shrinkThumbAfterDelay:0.15];
      goto LABEL_14;
    }
    [(UIImpactFeedbackGenerator *)self->_positiveFeedbackGenerator impactOccurred];
    [(UIImpactFeedbackGenerator *)self->_positiveFeedbackGenerator prepare];
    uint64_t v7 = self;
    uint64_t v8 = 2;
    goto LABEL_12;
  }
LABEL_14:
}

- (void)handleLongPress:(id)a3
{
  if ([(UILongPressGestureRecognizer *)self->_longPressRecognizer state] == 1)
  {
    [(MediaControlsMasterVolumeSlider *)self setSyncState:1];
    [(MediaControlsMasterVolumeSlider *)self setNeedsLayout];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__MediaControlsMasterVolumeSlider_handleLongPress___block_invoke;
    v4[3] = &unk_1E5F0D7F8;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:1 delay:v4 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:0.7 completion:0.0];
  }
}

uint64_t __51__MediaControlsMasterVolumeSlider_handleLongPress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)shrinkThumbAfterDelay:(double)a3
{
  int v5 = [(MPVolumeSlider *)self thumbView];
  [v5 frame];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F318A8]), "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 28.0, 0.0, 0.0);
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1698]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
  [v14 setSpringCubicTimingParameters:v15];

  objc_super v16 = (void *)[objc_alloc(MEMORY[0x1E4F318A0]) initWithDuration:v14 timingParameters:1.0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__MediaControlsMasterVolumeSlider_shrinkThumbAfterDelay___block_invoke;
  v17[3] = &unk_1E5F0E798;
  v17[4] = self;
  v17[5] = v7;
  v17[6] = v9;
  v17[7] = v11;
  v17[8] = v13;
  [v16 addAnimations:v17];
  [v16 startAnimationAfterDelay:a3];
  self->_forcePercent = 0.0;
  [(MediaControlsMasterVolumeSlider *)self setNeedsLayout];
}

void __57__MediaControlsMasterVolumeSlider_shrinkThumbAfterDelay___block_invoke(uint64_t a1)
{
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 632), "setFrame:");
  [*(id *)(*(void *)(a1 + 32) + 632) frame];
  double v3 = v2 * 0.5;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 632) layer];
  [v4 setCornerRadius:v3];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(MediaControlsMasterVolumeSlider *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v9 = [v8 shouldEnableSyncingForSlider:self];
    self->_syncingEnabled = v9;
    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (self->_syncingEnabled)
  {
LABEL_5:
    [(UIImpactFeedbackGenerator *)self->_positiveFeedbackGenerator prepare];
    [(UINotificationFeedbackGenerator *)self->_negativeFeedbackGenerator prepare];
    uint64_t v10 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:2];
    positiveFeedbackGenerator = self->_positiveFeedbackGenerator;
    self->_positiveFeedbackGenerator = v10;

    uint64_t v12 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1A00]);
    negativeFeedbackGenerator = self->_negativeFeedbackGenerator;
    self->_negativeFeedbackGenerator = v12;
  }
LABEL_6:
  [v7 locationInView:0];
  *(float *)&double v14 = v14;
  self->_initialX = *(float *)&v14;
  v17.receiver = self;
  v17.super_class = (Class)MediaControlsMasterVolumeSlider;
  BOOL v15 = [(MPVolumeSlider *)&v17 beginTrackingWithTouch:v7 withEvent:v6];

  return v15;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_syncingEnabled || self->_syncState == 3) {
    goto LABEL_14;
  }
  [(MediaControlsMasterVolumeSlider *)self setNeedsLayout];
  [v6 locationInView:0];
  *(float *)&double v8 = v8;
  if (vabds_f32(*(float *)&v8, self->_initialX) <= 15.0)
  {
    int v9 = [(MediaControlsMasterVolumeSlider *)self traitCollection];
    uint64_t v10 = [v9 forceTouchCapability];

    if (v10 == 2)
    {
      [v6 force];
      double v12 = v11;
      [v6 maximumPossibleForce];
      self->_double forcePercent = v12 / v13;
      [(MediaControlsMasterVolumeSlider *)self setNeedsLayout];
      double forcePercent = self->_forcePercent;
      if (forcePercent >= 0.949999881 && self->_syncState != 2)
      {
        BOOL v15 = 1;
        [(MediaControlsMasterVolumeSlider *)self setSyncState:1];
        goto LABEL_10;
      }
      if (forcePercent >= 0.179999881)
      {
        BOOL v15 = self->_syncState == 2;
        goto LABEL_10;
      }
    }
  }
  else
  {
    [(MediaControlsMasterVolumeSlider *)self setSyncState:3];
    [(MediaControlsMasterVolumeSlider *)self shrinkThumbAfterDelay:0.0];
  }
  BOOL v15 = 1;
LABEL_10:
  objc_super v16 = [(MediaControlsMasterVolumeSlider *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v16 slider:self shouldCancelSnapWithTouch:v6])
  {
    [(MediaControlsMasterVolumeSlider *)self setSyncState:3];
    [(MediaControlsMasterVolumeSlider *)self shrinkThumbAfterDelay:0.0];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__MediaControlsMasterVolumeSlider_continueTrackingWithTouch_withEvent___block_invoke;
  v20[3] = &unk_1E5F0D7F8;
  v20[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:5 delay:v20 options:0 animations:0.05 completion:0.0];

  if (!v15)
  {
    BOOL v17 = 1;
    goto LABEL_15;
  }
LABEL_14:
  v19.receiver = self;
  v19.super_class = (Class)MediaControlsMasterVolumeSlider;
  BOOL v17 = [(MPVolumeSlider *)&v19 continueTrackingWithTouch:v6 withEvent:v7];
LABEL_15:

  return v17;
}

uint64_t __71__MediaControlsMasterVolumeSlider_continueTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MediaControlsMasterVolumeSlider;
  [(MPVolumeSlider *)&v7 endTrackingWithTouch:a3 withEvent:a4];
  if (self->_syncingEnabled)
  {
    [(MediaControlsMasterVolumeSlider *)self shrinkThumbAfterDelay:0.0];
    [(MediaControlsMasterVolumeSlider *)self setSyncState:4];
    positiveFeedbackGenerator = self->_positiveFeedbackGenerator;
    self->_positiveFeedbackGenerator = 0;

    negativeFeedbackGenerator = self->_negativeFeedbackGenerator;
    self->_negativeFeedbackGenerator = 0;
  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MediaControlsMasterVolumeSlider;
  [(MPVolumeSlider *)&v4 cancelTrackingWithEvent:a3];
  [(MediaControlsMasterVolumeSlider *)self setSyncState:3];
  [(MediaControlsMasterVolumeSlider *)self shrinkThumbAfterDelay:0.0];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)MediaControlsMasterVolumeSlider;
  [(MediaControlsMasterVolumeSlider *)&v10 layoutSubviews];
  [(MediaControlsMasterVolumeSlider *)self bringSubviewToFront:self->_growingThumbView];
  double v3 = [(MPVolumeSlider *)self thumbView];
  [v3 frame];
  objc_super v4 = [(MPVolumeSlider *)self volumeController];
  int v5 = [v4 isVolumeControlAvailable];
  double v6 = 0.0;
  if (v5) {
    double v6 = 1.0;
  }
  [(UIView *)self->_growingThumbView setAlpha:v6];

  [v3 frame];
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  -[UIView setFrame:](self->_growingThumbView, "setFrame:");
  [(UIView *)self->_growingThumbView frame];
  double v8 = v7 * 0.5;
  int v9 = [(UIView *)self->_growingThumbView layer];
  [v9 setCornerRadius:v8];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  objc_super v4 = (UILongPressGestureRecognizer *)a3;
  if (self->_longPressRecognizer == v4
    || (v8.receiver = self,
        v8.super_class = (Class)MediaControlsMasterVolumeSlider,
        ![(MediaControlsMasterVolumeSlider *)&v8 respondsToSelector:sel_gestureRecognizerShouldBegin_]))
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MediaControlsMasterVolumeSlider;
    BOOL v5 = [(MediaControlsVolumeSlider *)&v7 gestureRecognizerShouldBegin:v4];
  }

  return v5;
}

- (BOOL)isSyncingEnabled
{
  return self->_syncingEnabled;
}

- (void)setSyncingEnabled:(BOOL)a3
{
  self->_syncingEnabled = a3;
}

- (MediaControlsMasterVolumeSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaControlsMasterVolumeSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)syncState
{
  return self->_syncState;
}

- (UIImpactFeedbackGenerator)positiveFeedbackGenerator
{
  return self->_positiveFeedbackGenerator;
}

- (void)setPositiveFeedbackGenerator:(id)a3
{
}

- (UINotificationFeedbackGenerator)negativeFeedbackGenerator
{
  return self->_negativeFeedbackGenerator;
}

- (void)setNegativeFeedbackGenerator:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_negativeFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_positiveFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_growingThumbView, 0);
}

@end