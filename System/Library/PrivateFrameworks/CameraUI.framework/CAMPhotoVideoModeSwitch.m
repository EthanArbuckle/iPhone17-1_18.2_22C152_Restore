@interface CAMPhotoVideoModeSwitch
- (BOOL)_isTouching;
- (CAMPhotoVideoModeSwitch)initWithFrame:(CGRect)a3;
- (CEKAdditiveAnimator)_animator;
- (CGRect)knobFrame;
- (UIImageView)_knobSelectionPhotoImageView;
- (UIImageView)_knobSelectionVideoImageView;
- (UIImageView)_photoImageView;
- (UIImageView)_videoImageView;
- (UIView)_knob;
- (UIView)_track;
- (double)_knobXPosition;
- (double)_trackBorderWidth;
- (double)_trackColorAlpha;
- (double)_trackColorWhite;
- (int64_t)orientation;
- (unint64_t)mode;
- (void)_setIsTouching:(BOOL)a3;
- (void)_swipe:(id)a3;
- (void)_touchCancel:(id)a3;
- (void)_touchCommit:(id)a3;
- (void)_touchStart:(id)a3;
- (void)_updateAnimatedValuesWithAnimator:(id)a3;
- (void)_updateKnobAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setMode:(unint64_t)a3;
- (void)setMode:(unint64_t)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)toggleModeAnimated:(BOOL)a3;
@end

@implementation CAMPhotoVideoModeSwitch

- (CAMPhotoVideoModeSwitch)initWithFrame:(CGRect)a3
{
  v57.receiver = self;
  v57.super_class = (Class)CAMPhotoVideoModeSwitch;
  v3 = -[CAMPhotoVideoModeSwitch initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_mode = 0;
    v56 = [MEMORY[0x263F82818] configurationWithScale:1];
    v5 = [MEMORY[0x263F827E8] systemImageNamed:@"camera.fill" withConfiguration:v56];
    uint64_t v6 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];
    photoImageView = v4->__photoImageView;
    v4->__photoImageView = (UIImageView *)v6;

    id v8 = [MEMORY[0x263F825C8] blackColor];
    uint64_t v9 = [v8 CGColor];
    v10 = [(UIImageView *)v4->__photoImageView layer];
    [v10 setShadowColor:v9];

    v11 = [MEMORY[0x263F825C8] whiteColor];
    [(UIImageView *)v4->__photoImageView setTintColor:v11];

    double v12 = *MEMORY[0x263F001B0];
    double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
    v14 = [(UIImageView *)v4->__photoImageView layer];
    objc_msgSend(v14, "setShadowOffset:", v12, v13);

    v15 = [(UIImageView *)v4->__photoImageView layer];
    [v15 setShadowRadius:2.0];

    v16 = [(UIImageView *)v4->__photoImageView layer];
    LODWORD(v17) = 1051931443;
    [v16 setShadowOpacity:v17];

    v18 = [MEMORY[0x263F827E8] systemImageNamed:@"video.fill" withConfiguration:v56];
    uint64_t v19 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v18];
    videoImageView = v4->__videoImageView;
    v4->__videoImageView = (UIImageView *)v19;

    id v21 = [MEMORY[0x263F825C8] blackColor];
    uint64_t v22 = [v21 CGColor];
    v23 = [(UIImageView *)v4->__videoImageView layer];
    [v23 setShadowColor:v22];

    v24 = [MEMORY[0x263F825C8] whiteColor];
    [(UIImageView *)v4->__videoImageView setTintColor:v24];

    v25 = [(UIImageView *)v4->__videoImageView layer];
    objc_msgSend(v25, "setShadowOffset:", v12, v13);

    v26 = [(UIImageView *)v4->__videoImageView layer];
    [v26 setShadowRadius:2.0];

    v27 = [(UIImageView *)v4->__videoImageView layer];
    LODWORD(v28) = 1051931443;
    [v27 setShadowOpacity:v28];

    uint64_t v29 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];
    knobSelectionPhotoImageView = v4->__knobSelectionPhotoImageView;
    v4->__knobSelectionPhotoImageView = (UIImageView *)v29;

    v31 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.7];
    [(UIImageView *)v4->__knobSelectionPhotoImageView setTintColor:v31];

    uint64_t v32 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v18];
    knobSelectionVideoImageView = v4->__knobSelectionVideoImageView;
    v4->__knobSelectionVideoImageView = (UIImageView *)v32;

    v34 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.7];
    [(UIImageView *)v4->__knobSelectionVideoImageView setTintColor:v34];

    [(UIImageView *)v4->__knobSelectionVideoImageView setAlpha:0.0];
    v35 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    track = v4->__track;
    v4->__track = v35;

    [(UIView *)v4->__track setUserInteractionEnabled:0];
    id v37 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.11];
    uint64_t v38 = [v37 CGColor];
    v39 = [(UIView *)v4->__track layer];
    [v39 setBorderColor:v38];

    [(CAMPhotoVideoModeSwitch *)v4 _trackBorderWidth];
    double v41 = v40;
    v42 = [(UIView *)v4->__track layer];
    [v42 setBorderWidth:v41];

    v43 = (void *)MEMORY[0x263F825C8];
    [(CAMPhotoVideoModeSwitch *)v4 _trackColorWhite];
    double v45 = v44;
    [(CAMPhotoVideoModeSwitch *)v4 _trackColorAlpha];
    v47 = [v43 colorWithWhite:v45 alpha:v46];
    [(UIView *)v4->__track setBackgroundColor:v47];

    v48 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    knob = v4->__knob;
    v4->__knob = v48;

    [(UIView *)v4->__knob setUserInteractionEnabled:0];
    v50 = [MEMORY[0x263F825C8] whiteColor];
    [(UIView *)v4->__knob setBackgroundColor:v50];

    [(UIView *)v4->__knob addSubview:v4->__knobSelectionPhotoImageView];
    [(UIView *)v4->__knob addSubview:v4->__knobSelectionVideoImageView];
    [(CAMPhotoVideoModeSwitch *)v4 addSubview:v4->__track];
    [(CAMPhotoVideoModeSwitch *)v4 addSubview:v4->__photoImageView];
    [(CAMPhotoVideoModeSwitch *)v4 addSubview:v4->__videoImageView];
    [(CAMPhotoVideoModeSwitch *)v4 addSubview:v4->__knob];
    v51 = (CEKAdditiveAnimator *)objc_alloc_init(MEMORY[0x263F30668]);
    animator = v4->__animator;
    v4->__animator = v51;

    [(CEKAdditiveAnimator *)v4->__animator setDelegate:v4];
    [(CAMPhotoVideoModeSwitch *)v4 addTarget:v4 action:sel__touchStart_ forControlEvents:17];
    [(CAMPhotoVideoModeSwitch *)v4 addTarget:v4 action:sel__touchCommit_ forControlEvents:64];
    [(CAMPhotoVideoModeSwitch *)v4 addTarget:v4 action:sel__touchCancel_ forControlEvents:416];
    v53 = (void *)[objc_alloc(MEMORY[0x263F82C38]) initWithTarget:v4 action:sel__swipe_];
    [v53 setDirection:2];
    [(CAMPhotoVideoModeSwitch *)v4 addGestureRecognizer:v53];
    v54 = (void *)[objc_alloc(MEMORY[0x263F82C38]) initWithTarget:v4 action:sel__swipe_];
    [v54 setDirection:1];
    [(CAMPhotoVideoModeSwitch *)v4 addGestureRecognizer:v54];
  }
  return v4;
}

- (void)layoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)CAMPhotoVideoModeSwitch;
  [(CAMPhotoVideoModeSwitch *)&v45 layoutSubviews];
  v3 = [(CAMPhotoVideoModeSwitch *)self _photoImageView];
  double v44 = CAMViewAlignmentSize(v3);
  double v5 = v4;

  uint64_t v6 = [(CAMPhotoVideoModeSwitch *)self _videoImageView];
  double v43 = CAMViewAlignmentSize(v6);
  double v8 = v7;

  [(CAMPhotoVideoModeSwitch *)self bounds];
  double v10 = v9;
  double v12 = v11 * 0.5;
  double v13 = v11 * 0.5 + -14.0;
  v14 = [(CAMPhotoVideoModeSwitch *)self _track];
  objc_msgSend(v14, "setFrame:", 0.0, v13, v10, 28.0);

  [(CAMPhotoVideoModeSwitch *)self knobFrame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(CAMPhotoVideoModeSwitch *)self _knob];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  v24 = [(CAMPhotoVideoModeSwitch *)self _photoImageView];
  objc_msgSend(v24, "setFrame:", 12.0, v12 - v5 * 0.5, v44, v5);

  v25 = [(CAMPhotoVideoModeSwitch *)self _videoImageView];
  objc_msgSend(v25, "setFrame:", v10 - v43 + -12.0, v12 - v8 * 0.5, v43, v8);

  v26 = [(CAMPhotoVideoModeSwitch *)self _knob];
  [v26 bounds];
  UIRectGetCenter();
  double v28 = v27;
  double v30 = v29;

  v31 = [(CAMPhotoVideoModeSwitch *)self _knobSelectionPhotoImageView];
  objc_msgSend(v31, "setCenter:", v28, v30);

  uint64_t v32 = [(CAMPhotoVideoModeSwitch *)self _knobSelectionVideoImageView];
  objc_msgSend(v32, "setCenter:", v28, v30);

  v33 = [(CAMPhotoVideoModeSwitch *)self _track];
  [v33 bounds];
  double v35 = v34 * 0.5;
  v36 = [(CAMPhotoVideoModeSwitch *)self _track];
  id v37 = [v36 layer];
  [v37 setCornerRadius:v35];

  uint64_t v38 = [(CAMPhotoVideoModeSwitch *)self _knob];
  [v38 bounds];
  double v40 = v39 * 0.5;
  double v41 = [(CAMPhotoVideoModeSwitch *)self _knob];
  v42 = [v41 layer];
  [v42 setCornerRadius:v40];

  [(CAMPhotoVideoModeSwitch *)self _updateKnobAnimated:0];
}

- (CGRect)knobFrame
{
  [(CAMPhotoVideoModeSwitch *)self bounds];
  double v4 = v3;
  double v6 = v5 * 0.5;
  [(CAMPhotoVideoModeSwitch *)self _knobXPosition];
  double v8 = v4 * 0.5 + -14.0;
  double v9 = 28.0;
  double v10 = v6;
  result.size.height = v9;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (double)_knobXPosition
{
  unint64_t v3 = [(CAMPhotoVideoModeSwitch *)self mode];
  double result = 0.0;
  if (v3 == 1)
  {
    [(CAMPhotoVideoModeSwitch *)self bounds];
    return v5 + v5 * -0.5;
  }
  return result;
}

- (double)_trackColorAlpha
{
  unint64_t v2 = [(CAMPhotoVideoModeSwitch *)self mode];
  double result = 0.11;
  if (v2) {
    return 0.5;
  }
  return result;
}

- (double)_trackColorWhite
{
  unint64_t v2 = [(CAMPhotoVideoModeSwitch *)self mode];
  double result = 0.0;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (double)_trackBorderWidth
{
  double v2 = 0.0;
  if (![(CAMPhotoVideoModeSwitch *)self mode])
  {
    unint64_t v3 = [MEMORY[0x263F82B60] mainScreen];
    [v3 scale];
    double v2 = 1.0 / v4;
  }
  return v2;
}

- (void)_touchStart:(id)a3
{
  [(CAMPhotoVideoModeSwitch *)self _setIsTouching:1];
  [(CAMPhotoVideoModeSwitch *)self _updateKnobAnimated:1];
}

- (void)_touchCancel:(id)a3
{
  [(CAMPhotoVideoModeSwitch *)self _setIsTouching:0];
  [(CAMPhotoVideoModeSwitch *)self _updateKnobAnimated:1];
}

- (void)_touchCommit:(id)a3
{
  [(CAMPhotoVideoModeSwitch *)self _setIsTouching:0];
  [(CAMPhotoVideoModeSwitch *)self toggleModeAnimated:1];
}

- (void)_swipe:(id)a3
{
  id v4 = a3;
  if ([v4 direction] == 2 || objc_msgSend(v4, "direction") == 1) {
    [(CAMPhotoVideoModeSwitch *)self toggleModeAnimated:1];
  }
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", self);
  }
}

- (void)setMode:(unint64_t)a3
{
}

- (void)setMode:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(CAMPhotoVideoModeSwitch *)self _updateKnobAnimated:a4];
  }
}

- (void)toggleModeAnimated:(BOOL)a3
{
  [(CAMPhotoVideoModeSwitch *)self setMode:[(CAMPhotoVideoModeSwitch *)self mode] == 0 animated:a3];
  [(CAMPhotoVideoModeSwitch *)self sendActionsForControlEvents:4096];
}

- (void)_updateAnimatedValuesWithAnimator:(id)a3
{
  id v4 = a3;
  double v5 = [(CAMPhotoVideoModeSwitch *)self _knob];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [v4 valueForKey:@"CAMAnimatorKnobPositionKey"];
  UIRoundToViewScale();
  double v13 = v12;
  v14 = [(CAMPhotoVideoModeSwitch *)self _knob];
  objc_msgSend(v14, "setFrame:", v13, v7, v9, v11);

  [v4 valueForKey:@"CAMAnimatorKnobSelectionProgressKey"];
  CEKProgressClamped();
  double v16 = 1.0 - v15;
  double v17 = [(CAMPhotoVideoModeSwitch *)self _knobSelectionPhotoImageView];
  [v17 setAlpha:v16];

  CEKProgressClamped();
  double v19 = v18;
  double v20 = [(CAMPhotoVideoModeSwitch *)self _knobSelectionVideoImageView];
  [v20 setAlpha:v19];

  [v4 valueForKey:@"CAMTrackColorAlphaKey"];
  double v22 = v21;
  [v4 valueForKey:@"CAMTrackColorWhiteKey"];
  double v24 = v23;

  id v26 = [MEMORY[0x263F825C8] colorWithWhite:v24 alpha:v22];
  v25 = [(CAMPhotoVideoModeSwitch *)self _track];
  [v25 setBackgroundColor:v26];
}

- (void)_updateKnobAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CAMPhotoVideoModeSwitch *)self mode] == 1) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  [(CAMPhotoVideoModeSwitch *)self _trackBorderWidth];
  double v7 = v6;
  double v8 = [(CAMPhotoVideoModeSwitch *)self _track];
  double v9 = [v8 layer];
  [v9 setBorderWidth:v7];

  double v10 = [(CAMPhotoVideoModeSwitch *)self _animator];
  [(CAMPhotoVideoModeSwitch *)self _knobXPosition];
  if (v3)
  {
    objc_msgSend(v10, "setValue:forKey:duration:timingCurve:", @"CAMAnimatorKnobPositionKey", 0);

    double v11 = [(CAMPhotoVideoModeSwitch *)self _animator];
    [v11 setValue:@"CAMAnimatorKnobSelectionProgressKey" forKey:0 duration:v5 timingCurve:0.15];

    double v12 = [(CAMPhotoVideoModeSwitch *)self _animator];
    [(CAMPhotoVideoModeSwitch *)self _trackColorAlpha];
    objc_msgSend(v12, "setValue:forKey:duration:timingCurve:", @"CAMTrackColorAlphaKey", 0);

    id v16 = [(CAMPhotoVideoModeSwitch *)self _animator];
    [(CAMPhotoVideoModeSwitch *)self _trackColorWhite];
    objc_msgSend(v16, "setValue:forKey:duration:timingCurve:", @"CAMTrackColorWhiteKey", 0);
  }
  else
  {
    objc_msgSend(v10, "setValue:forKey:", @"CAMAnimatorKnobPositionKey");

    double v13 = [(CAMPhotoVideoModeSwitch *)self _animator];
    [v13 setValue:@"CAMAnimatorKnobSelectionProgressKey" forKey:v5];

    v14 = [(CAMPhotoVideoModeSwitch *)self _animator];
    [(CAMPhotoVideoModeSwitch *)self _trackColorAlpha];
    objc_msgSend(v14, "setValue:forKey:", @"CAMTrackColorAlphaKey");

    double v15 = [(CAMPhotoVideoModeSwitch *)self _animator];
    [(CAMPhotoVideoModeSwitch *)self _trackColorWhite];
    objc_msgSend(v15, "setValue:forKey:", @"CAMTrackColorWhiteKey");

    id v16 = [(CAMPhotoVideoModeSwitch *)self _animator];
    -[CAMPhotoVideoModeSwitch _updateAnimatedValuesWithAnimator:](self, "_updateAnimatedValuesWithAnimator:");
  }
}

- (unint64_t)mode
{
  return self->_mode;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_photoImageView
{
  return self->__photoImageView;
}

- (UIImageView)_videoImageView
{
  return self->__videoImageView;
}

- (UIImageView)_knobSelectionPhotoImageView
{
  return self->__knobSelectionPhotoImageView;
}

- (UIImageView)_knobSelectionVideoImageView
{
  return self->__knobSelectionVideoImageView;
}

- (UIView)_track
{
  return self->__track;
}

- (UIView)_knob
{
  return self->__knob;
}

- (BOOL)_isTouching
{
  return self->__isTouching;
}

- (void)_setIsTouching:(BOOL)a3
{
  self->__isTouching = a3;
}

- (CEKAdditiveAnimator)_animator
{
  return self->__animator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animator, 0);
  objc_storeStrong((id *)&self->__knob, 0);
  objc_storeStrong((id *)&self->__track, 0);
  objc_storeStrong((id *)&self->__knobSelectionVideoImageView, 0);
  objc_storeStrong((id *)&self->__knobSelectionPhotoImageView, 0);
  objc_storeStrong((id *)&self->__videoImageView, 0);
  objc_storeStrong((id *)&self->__photoImageView, 0);
}

@end