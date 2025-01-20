@interface AVTRecordingButton
- (AVTRecordingButton)initWithCoder:(id)a3;
- (AVTRecordingButton)initWithFrame:(CGRect)a3;
- (AVTRecordingButtonLongPressDelegate)longPressDelegate;
- (BOOL)forceUsePhoneStyle;
- (BOOL)ignoresLongPress;
- (BOOL)isTrackingLongPress;
- (CAShapeLayerAnimated)innerCircle;
- (CAShapeLayerAnimated)outerCircle;
- (NSDate)lastFeedbackSent;
- (UIActivityIndicatorView)spinner;
- (UIColor)centerCircleColor;
- (UIImageView)iconView;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (unint64_t)uiState;
- (void)configure;
- (void)endLongPress:(BOOL)a3;
- (void)layoutSubviews;
- (void)sendHapticFeedbackIfNeeded;
- (void)setCenterCircleColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setForceUsePhoneStyle:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setIgnoresLongPress:(BOOL)a3;
- (void)setInnerCircle:(id)a3;
- (void)setIsTrackingLongPress:(BOOL)a3;
- (void)setLastFeedbackSent:(id)a3;
- (void)setLongPressDelegate:(id)a3;
- (void)setOuterCircle:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setUIState:(unint64_t)a3;
- (void)startLongPress;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation AVTRecordingButton

- (AVTRecordingButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVTRecordingButton;
  v3 = -[AVTRecordingButton initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F1C550] redColor];
    centerCircleColor = v3->_centerCircleColor;
    v3->_centerCircleColor = (UIColor *)v4;
  }
  [(AVTRecordingButton *)v3 configure];
  return v3;
}

- (AVTRecordingButton)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTRecordingButton;
  v3 = [(AVTRecordingButton *)&v6 initWithCoder:a3];
  uint64_t v4 = v3;
  if (v3) {
    [(AVTRecordingButton *)v3 configure];
  }
  return v4;
}

- (void)configure
{
  [(AVTRecordingButton *)self setForceUsePhoneStyle:0];
  uint64_t v4 = [MEMORY[0x263F1C550] clearColor];
  [(AVTRecordingButton *)self setBackgroundColor:v4];

  v5 = objc_alloc_init(CAShapeLayerAnimated);
  outerCircle = self->_outerCircle;
  self->_outerCircle = v5;

  id v7 = [MEMORY[0x263F1C550] clearColor];
  -[CAShapeLayerAnimated setFillColor:](self->_outerCircle, "setFillColor:", [v7 CGColor]);

  v8 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];
  if (v9 != 1)
  {
    v2 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v2 userInterfaceIdiom] != 5)
    {
      [(CAShapeLayerAnimated *)self->_outerCircle setLineWidth:4.0];
LABEL_8:

      goto LABEL_9;
    }
  }
  BOOL v10 = [(AVTRecordingButton *)self forceUsePhoneStyle];
  double v11 = 7.0;
  if (v10) {
    double v11 = 4.0;
  }
  [(CAShapeLayerAnimated *)self->_outerCircle setLineWidth:v11];
  if (v9 != 1) {
    goto LABEL_8;
  }
LABEL_9:

  id v12 = [MEMORY[0x263F1C550] quaternaryLabelColor];
  -[CAShapeLayerAnimated setStrokeColor:](self->_outerCircle, "setStrokeColor:", [v12 CGColor]);

  v13 = [(AVTRecordingButton *)self layer];
  [v13 addSublayer:self->_outerCircle];

  v14 = objc_alloc_init(CAShapeLayerAnimated);
  innerCircle = self->_innerCircle;
  self->_innerCircle = v14;

  [(CAShapeLayerAnimated *)self->_innerCircle setFillColor:[(UIColor *)self->_centerCircleColor CGColor]];
  v16 = [(AVTRecordingButton *)self layer];
  [v16 addSublayer:self->_innerCircle];

  id v25 = [MEMORY[0x263F1C6C8] configurationWithWeight:6];
  v17 = [MEMORY[0x263F1C6B0] systemImageNamed:@"arrow.up" withConfiguration:v25];
  v18 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v17];
  iconView = self->_iconView;
  self->_iconView = v18;

  [(UIImageView *)self->_iconView setHidden:0];
  v20 = [MEMORY[0x263F1C550] whiteColor];
  [(UIImageView *)self->_iconView setTintColor:v20];

  [(AVTRecordingButton *)self addSubview:self->_iconView];
  v21 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:101];
  spinner = self->_spinner;
  self->_spinner = v21;

  [(UIActivityIndicatorView *)self->_spinner setUserInteractionEnabled:0];
  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:0];
  [(AVTRecordingButton *)self addSubview:self->_spinner];
  v23 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x263F1C6D8]) initWithStyle:0];
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v23;
}

- (void)setCenterCircleColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_centerCircleColor != v5)
  {
    objc_storeStrong((id *)&self->_centerCircleColor, a3);
    [(CAShapeLayerAnimated *)self->_innerCircle setFillColor:[(UIColor *)v5 CGColor]];
  }
}

- (void)setForceUsePhoneStyle:(BOOL)a3
{
  if (self->_forceUsePhoneStyle != a3)
  {
    self->_forceUsePhoneStyle = a3;
    [(AVTRecordingButton *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v63.receiver = self;
  v63.super_class = (Class)AVTRecordingButton;
  [(AVTRecordingButton *)&v63 layoutSubviews];
  uint64_t v5 = [MEMORY[0x263F158F8] disableActions];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(AVTRecordingButton *)self setAlpha:(double)[(AVTRecordingButton *)self isEnabled]];
  [MEMORY[0x263F158F8] setDisableActions:v5];
  [(AVTRecordingButton *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  v14 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v15 = [v14 userInterfaceIdiom];
  if (v15 == 1
    || ([MEMORY[0x263F1C5C0] currentDevice],
        v2 = objc_claimAutoreleasedReturnValue(),
        double v16 = 2.0,
        [v2 userInterfaceIdiom] == 5))
  {
    if ([(AVTRecordingButton *)self forceUsePhoneStyle]) {
      double v16 = 2.0;
    }
    else {
      double v16 = 3.5;
    }
  }
  v17 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v18 = [v17 userInterfaceIdiom];
  if (v18 == 1
    || ([MEMORY[0x263F1C5C0] currentDevice],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = [v3 userInterfaceIdiom],
        double v20 = 2.0,
        v19 == 5))
  {
    if ([(AVTRecordingButton *)self forceUsePhoneStyle]) {
      double v20 = 2.0;
    }
    else {
      double v20 = 3.5;
    }
  }
  v64.origin.double x = v7;
  v64.origin.double y = v9;
  v64.size.double width = v11;
  v64.size.double height = v13;
  CGRect v65 = CGRectInset(v64, v16, v20);
  CGPathRef v21 = CGPathCreateWithEllipseInRect(v65, 0);
  if (v18 != 1) {

  }
  if (v15 != 1) {
  v22 = [(AVTRecordingButton *)self outerCircle];
  }
  [v22 setPath:v21];

  CFRelease(v21);
  v23 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v24 = [v23 userInterfaceIdiom];
  if (v24 == 1
    || ([MEMORY[0x263F1C5C0] currentDevice],
        v2 = objc_claimAutoreleasedReturnValue(),
        double v25 = 4.0,
        [v2 userInterfaceIdiom] == 5))
  {
    if ([(AVTRecordingButton *)self forceUsePhoneStyle]) {
      double v25 = 4.0;
    }
    else {
      double v25 = 7.0;
    }
  }
  v26 = [(AVTRecordingButton *)self outerCircle];
  [v26 setLineWidth:v25];

  if (v24 != 1) {
  v27 = [(AVTRecordingButton *)self uiState];
  }
  v28 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v29 = [v28 userInterfaceIdiom];
  if (v27 == (void *)1)
  {
    if (v29 == 1)
    {
      if ([(AVTRecordingButton *)self forceUsePhoneStyle]) {
        double v30 = 16.0;
      }
      else {
        double v30 = 20.0;
      }
    }
    else
    {
      v31 = [MEMORY[0x263F1C5C0] currentDevice];
      double v30 = 16.0;
      if ([v31 userInterfaceIdiom] == 5)
      {
        if ([(AVTRecordingButton *)self forceUsePhoneStyle]) {
          double v30 = 16.0;
        }
        else {
          double v30 = 20.0;
        }
      }
    }
    v32 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v32 userInterfaceIdiom] == 1)
    {
      if ([(AVTRecordingButton *)self forceUsePhoneStyle]) {
        double v33 = 4.0;
      }
      else {
        double v33 = 8.0;
      }
      goto LABEL_57;
    }
    v27 = [MEMORY[0x263F1C5C0] currentDevice];
    double v33 = 4.0;
    if ([v27 userInterfaceIdiom] == 5)
    {
      if ([(AVTRecordingButton *)self forceUsePhoneStyle]) {
        double v33 = 4.0;
      }
      else {
        double v33 = 8.0;
      }
    }
LABEL_56:

    goto LABEL_57;
  }
  if (v29 == 1)
  {
    if ([(AVTRecordingButton *)self forceUsePhoneStyle]) {
      double v30 = 7.0;
    }
    else {
      double v30 = 11.0;
    }
  }
  else
  {
    v27 = [MEMORY[0x263F1C5C0] currentDevice];
    double v30 = 7.0;
    if ([v27 userInterfaceIdiom] == 5)
    {
      if ([(AVTRecordingButton *)self forceUsePhoneStyle]) {
        double v30 = 7.0;
      }
      else {
        double v30 = 11.0;
      }
    }
  }
  [(AVTRecordingButton *)self bounds];
  double v35 = v34;
  v32 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v36 = [v32 userInterfaceIdiom];
  if (v36 != 1)
  {
    v27 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v27 userInterfaceIdiom] != 5)
    {
      double v33 = v35 * 0.5 + -7.0;
      goto LABEL_56;
    }
  }
  BOOL v37 = [(AVTRecordingButton *)self forceUsePhoneStyle];
  double v38 = 11.0;
  if (v37) {
    double v38 = 7.0;
  }
  double v33 = -(v38 - v35 * 0.5);
  if (v36 != 1) {
    goto LABEL_56;
  }
LABEL_57:

  [(AVTRecordingButton *)self bounds];
  CGRect v67 = CGRectInset(v66, v30, v30);
  double x = v67.origin.x;
  double y = v67.origin.y;
  double width = v67.size.width;
  double height = v67.size.height;
  v43 = CGPathCreateWithRoundedRect(v67, v33, v33, 0);
  v44 = [(AVTRecordingButton *)self innerCircle];
  objc_msgSend(v44, "setFrame:", x, y, width, height);

  BoundingBodouble x = CGPathGetBoundingBox(v43);
  double v45 = BoundingBox.origin.x;
  double v46 = BoundingBox.origin.y;
  double v47 = BoundingBox.size.width;
  double v48 = BoundingBox.size.height;
  v49 = [(AVTRecordingButton *)self innerCircle];
  objc_msgSend(v49, "setBounds:", v45, v46, v47, v48);

  v50 = [(AVTRecordingButton *)self innerCircle];
  [v50 setPath:v43];

  CFRelease(v43);
  if ([(AVTRecordingButton *)self isHighlighted]
    && [(AVTRecordingButton *)self uiState] != 1)
  {
    double v51 = 0.9;
  }
  else if ([(AVTRecordingButton *)self uiState] == 3)
  {
    double v51 = 0.9;
  }
  else
  {
    double v51 = 1.0;
  }
  CATransform3DMakeScale(&v62, v51, v51, 1.0);
  v52 = [(AVTRecordingButton *)self innerCircle];
  CATransform3D v61 = v62;
  [v52 setTransform:&v61];

  unint64_t v53 = [(AVTRecordingButton *)self uiState];
  if (v53 == 2) {
    [(AVTRecordingButton *)self tintColor];
  }
  else {
    [(AVTRecordingButton *)self centerCircleColor];
  }
  BOOL v54 = v53 == 2;
  id v55 = objc_claimAutoreleasedReturnValue();
  uint64_t v56 = [v55 CGColor];
  v57 = [(AVTRecordingButton *)self innerCircle];
  [v57 setFillColor:v56];

  v58 = (void *)MEMORY[0x263F1CB60];
  [MEMORY[0x263F158F8] animationDuration];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __36__AVTRecordingButton_layoutSubviews__block_invoke;
  v59[3] = &unk_263FF1B68;
  *(double *)&v59[5] = x;
  *(double *)&v59[6] = y;
  *(double *)&v59[7] = width;
  *(double *)&v59[8] = height;
  *(double *)&v59[9] = v51;
  v59[4] = self;
  BOOL v60 = v54;
  objc_msgSend(v58, "animateWithDuration:animations:", v59);
}

void __36__AVTRecordingButton_layoutSubviews__block_invoke(uint64_t a1)
{
  CGRect v25 = *(CGRect *)(a1 + 40);
  double v2 = 1.0;
  CGRect v26 = CGRectInset(v25, v25.size.width * ((1.0 - *(double *)(a1 + 72)) * 0.5 + 0.2), v25.size.width * ((1.0 - *(double *)(a1 + 72)) * 0.5 + 0.2));
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  CGFloat v7 = [*(id *)(a1 + 32) iconView];
  objc_msgSend(v7, "setFrame:", x, y, width, height);

  if (*(unsigned char *)(a1 + 80)) {
    double v8 = 1.0;
  }
  else {
    double v8 = 0.0;
  }
  CGFloat v9 = [*(id *)(a1 + 32) iconView];
  [v9 setAlpha:v8];

  uint64_t v10 = [*(id *)(a1 + 32) uiState];
  CGFloat v11 = [*(id *)(a1 + 32) iconView];
  [v11 center];
  double v13 = v12 + 1.0;
  v14 = [*(id *)(a1 + 32) iconView];
  [v14 center];
  double v16 = v15 + 1.0;
  v17 = [*(id *)(a1 + 32) spinner];
  objc_msgSend(v17, "setCenter:", v13, v16);

  uint64_t v18 = [*(id *)(a1 + 32) spinner];
  uint64_t v19 = v18;
  if (v10 == 3)
  {
    [v18 startAnimating];
    float v20 = 0.0;
  }
  else
  {
    [v18 stopAnimating];
    float v20 = 1.0;
    double v2 = 0.0;
  }

  CGPathRef v21 = [*(id *)(a1 + 32) spinner];
  [v21 setAlpha:v2];

  id v23 = [*(id *)(a1 + 32) innerCircle];
  *(float *)&double v22 = v20;
  [v23 setOpacity:v22];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AVTRecordingButton *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVTRecordingButton;
    [(AVTRecordingButton *)&v5 setEnabled:v3];
    [(AVTRecordingButton *)self setNeedsLayout];
  }
}

- (void)setUIState:(unint64_t)a3
{
  if (self->_uiState != a3)
  {
    self->_uiState = a3;
    if (a3 - 1 <= 1) {
      [(AVTRecordingButton *)self sendHapticFeedbackIfNeeded];
    }
    [(AVTRecordingButton *)self setNeedsLayout];
  }
}

- (void)sendHapticFeedbackIfNeeded
{
  uint64_t v3 = [(AVTRecordingButton *)self lastFeedbackSent];
  if (!v3
    || (uint64_t v4 = (void *)v3,
        [(AVTRecordingButton *)self lastFeedbackSent],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        [v5 timeIntervalSinceNow],
        double v7 = v6,
        v5,
        v4,
        v7 < -0.2))
  {
    double v8 = objc_opt_new();
    [(AVTRecordingButton *)self setLastFeedbackSent:v8];

    id v9 = [(AVTRecordingButton *)self feedbackGenerator];
    [v9 impactOccurred];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AVTRecordingButton;
  [(AVTRecordingButton *)&v5 touchesBegan:a3 withEvent:a4];
  if ([(AVTRecordingButton *)self uiState] != 3) {
    [(AVTRecordingButton *)self sendHapticFeedbackIfNeeded];
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  [(AVTRecordingButton *)self performSelector:sel_startLongPress withObject:0 afterDelay:0.25];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVTRecordingButton;
  [(AVTRecordingButton *)&v12 touchesEnded:v6 withEvent:a4];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  if ([(AVTRecordingButton *)self isTrackingLongPress])
  {
    double v7 = [v6 anyObject];
    [v7 locationInView:self];
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    [(AVTRecordingButton *)self bounds];
    v13.double x = v9;
    v13.double y = v11;
    [(AVTRecordingButton *)self endLongPress:!CGRectContainsPoint(v14, v13)];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AVTRecordingButton;
  [(AVTRecordingButton *)&v5 touchesCancelled:a3 withEvent:a4];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  if ([(AVTRecordingButton *)self isTrackingLongPress]) {
    [(AVTRecordingButton *)self endLongPress:1];
  }
}

- (void)startLongPress
{
  [(AVTRecordingButton *)self setIsTrackingLongPress:1];
  uint64_t v3 = [(AVTRecordingButton *)self longPressDelegate];

  if (v3)
  {
    id v4 = [(AVTRecordingButton *)self longPressDelegate];
    [v4 recordingButtonDidStartLongPress:self];
  }
}

- (void)endLongPress:(BOOL)a3
{
  BOOL v3 = a3;
  [(AVTRecordingButton *)self setIsTrackingLongPress:0];
  objc_super v5 = [(AVTRecordingButton *)self longPressDelegate];

  if (v5)
  {
    id v6 = [(AVTRecordingButton *)self longPressDelegate];
    [v6 recordingButton:self didEndLongPress:v3];
  }
}

- (AVTRecordingButtonLongPressDelegate)longPressDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_longPressDelegate);
  return (AVTRecordingButtonLongPressDelegate *)WeakRetained;
}

- (void)setLongPressDelegate:(id)a3
{
}

- (BOOL)forceUsePhoneStyle
{
  return self->_forceUsePhoneStyle;
}

- (unint64_t)uiState
{
  return self->_uiState;
}

- (UIColor)centerCircleColor
{
  return self->_centerCircleColor;
}

- (BOOL)ignoresLongPress
{
  return self->_ignoresLongPress;
}

- (void)setIgnoresLongPress:(BOOL)a3
{
  self->_ignoresLongPress = a3;
}

- (CAShapeLayerAnimated)outerCircle
{
  return self->_outerCircle;
}

- (void)setOuterCircle:(id)a3
{
}

- (CAShapeLayerAnimated)innerCircle
{
  return self->_innerCircle;
}

- (void)setInnerCircle:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (BOOL)isTrackingLongPress
{
  return self->_isTrackingLongPress;
}

- (void)setIsTrackingLongPress:(BOOL)a3
{
  self->_isTrackingLongPress = a3;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (NSDate)lastFeedbackSent
{
  return self->_lastFeedbackSent;
}

- (void)setLastFeedbackSent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFeedbackSent, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_innerCircle, 0);
  objc_storeStrong((id *)&self->_outerCircle, 0);
  objc_storeStrong((id *)&self->_centerCircleColor, 0);
  objc_destroyWeak((id *)&self->_longPressDelegate);
}

@end