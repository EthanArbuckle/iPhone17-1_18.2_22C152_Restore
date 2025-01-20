@interface CAMZoomSlider
+ (BOOL)shouldFadeOutZoomSliderForLayoutStyle:(int64_t)a3;
- (BOOL)_isAutozooming;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isAutozooming;
- (BOOL)isMaximumAutozooming;
- (BOOL)isMinimumAutozooming;
- (BOOL)isVisibilityTimerSuspended;
- (BOOL)shouldHideForExpiredVisibilityTimer;
- (CAMZoomSlider)initWithCoder:(id)a3;
- (CAMZoomSlider)initWithFrame:(CGRect)a3;
- (CAMZoomSlider)initWithLayoutStyle:(int64_t)a3;
- (CAMZoomSliderDelegate)delegate;
- (CGRect)maximumValueImageRectForBounds:(CGRect)a3;
- (CGRect)minimumValueImageRectForBounds:(CGRect)a3;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (NSTimer)_visibilityTimer;
- (UIEdgeInsets)alignmentRectInsets;
- (UIView)_maxTrackMaskView;
- (UIView)_minTrackMaskView;
- (double)_thumbCenterMaximumXForTrackRect:(CGRect)a3;
- (double)_thumbCenterMinimumXForTrackRect:(CGRect)a3;
- (double)_thumbCenterXForValue:(float)a3 trackRect:(CGRect)a4;
- (float)_valueForThumbCenterX:(double)a3 trackRect:(CGRect)a4;
- (int64_t)layoutStyle;
- (int64_t)locationOfTouch:(id)a3;
- (int64_t)orientation;
- (void)_beginAutozooming;
- (void)_commonCAMZoomSliderInitializationWithLayoutStyle:(int64_t)a3;
- (void)_endAutozooming;
- (void)_handleTouchUpInside:(id)a3;
- (void)_hideZoomSlider:(id)a3;
- (void)_makeInvisibleAnimationDuration:(double)a3;
- (void)_setAutozooming:(BOOL)a3;
- (void)_setMaximumAutozooming:(BOOL)a3;
- (void)_setMinimumAutozooming:(BOOL)a3;
- (void)_startVisibilityTimer;
- (void)_stopVisibilityTimer;
- (void)_updateAutozooming;
- (void)_updateForLayoutStyle;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)dealloc;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)makeInvisibleAnimated:(BOOL)a3;
- (void)makeVisibleAnimated:(BOOL)a3;
- (void)setAlignmentRectInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setVisibilityTimerSuspended:(BOOL)a3;
@end

@implementation CAMZoomSlider

+ (BOOL)shouldFadeOutZoomSliderForLayoutStyle:(int64_t)a3
{
  return a3 != 1;
}

- (void)_commonCAMZoomSliderInitializationWithLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
  v4 = [MEMORY[0x263F825C8] clearColor];
  [(CAMZoomSlider *)self setBackgroundColor:v4];

  self->__autozooming = 0;
  self->_minimumAutozooming = 0;
  self->_maximumAutozooming = 0;
  [(CAMZoomSlider *)self _updateForLayoutStyle];
  [(CAMZoomSlider *)self addTarget:self action:sel__handleTouchUpInside_ forControlEvents:64];
  id v9 = +[CAMCaptureCapabilities capabilities];
  if ([v9 allowHaptics])
  {
    v5 = [MEMORY[0x263F82F50] sliderConfiguration];
    v6 = [v5 tweakedConfigurationForCaller:self usage:@"zoomSlider"];

    v7 = [MEMORY[0x263F82F00] feedbackWithDictionaryRepresentation:&unk_26BDDF808];
    [v6 setUserInteractingThresholdFeedback:v7];

    [v6 setUserInteractingThresholdFeedbackUpdateBlock:&__block_literal_global];
    v8 = (void *)[objc_alloc(MEMORY[0x263F82F48]) initWithConfiguration:v6];
    [v8 _setOutputMode:5];
    [(CAMZoomSlider *)self _setEdgeFeedbackGenerator:v8];
  }
}

void __67__CAMZoomSlider__commonCAMZoomSliderInitializationWithLayoutStyle___block_invoke(double a1, uint64_t a2, void *a3)
{
  if (a1 < 0.0) {
    a1 = -a1;
  }
  double v3 = fmin(a1 * 0.0005, 0.475);
  if (v3 < 0.35) {
    double v3 = 0.35;
  }
  float v4 = v3;
  id v6 = [a3 hapticParameters];
  *(float *)&double v5 = v4;
  [v6 setVolume:v5];
}

- (CAMZoomSlider)initWithLayoutStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMZoomSlider;
  float v4 = -[CAMZoomSlider initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v5 = v4;
  if (v4)
  {
    [(CAMZoomSlider *)v4 _commonCAMZoomSliderInitializationWithLayoutStyle:a3];
    id v6 = v5;
  }

  return v5;
}

- (CAMZoomSlider)initWithFrame:(CGRect)a3
{
  float v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMZoomSlider *)self initWithLayoutStyle:v5];
}

- (CAMZoomSlider)initWithCoder:(id)a3
{
  float v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMZoomSlider *)self initWithLayoutStyle:v5];
}

- (void)dealloc
{
  [(NSTimer *)self->__visibilityTimer invalidate];
  visibilityTimer = self->__visibilityTimer;
  self->__visibilityTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)CAMZoomSlider;
  [(CAMZoomSlider *)&v4 dealloc];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CAMZoomSlider *)self thumbImageForState:0];
  double v3 = *MEMORY[0x263F83C20];
  [v2 size];
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v95.receiver = self;
  v95.super_class = (Class)CAMZoomSlider;
  [(CAMZoomSlider *)&v95 layoutSubviews];
  [(CAMZoomSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CAMZoomSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v93 = v11;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  int v18 = [(CAMZoomSlider *)self _shouldReverseLayoutDirection];
  [(CAMZoomSlider *)self value];
  int v20 = v19;
  v21 = [(CAMZoomSlider *)self _minTrackView];
  v22 = [(CAMZoomSlider *)self _maxTrackView];
  if (v21)
  {
    minTrackMaskView = self->__minTrackMaskView;
    if (!minTrackMaskView)
    {
      id v24 = objc_alloc(MEMORY[0x263F82E00]);
      v25 = (UIView *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      v26 = self->__minTrackMaskView;
      self->__minTrackMaskView = v25;

      v27 = [MEMORY[0x263F825C8] whiteColor];
      [(UIView *)self->__minTrackMaskView setBackgroundColor:v27];

      minTrackMaskView = self->__minTrackMaskView;
    }
    v28 = [(UIView *)minTrackMaskView layer];
    v29 = [v21 layer];
    [v29 setMask:v28];
  }
  if (v22)
  {
    maxTrackMaskView = self->__maxTrackMaskView;
    if (!maxTrackMaskView)
    {
      id v31 = objc_alloc(MEMORY[0x263F82E00]);
      v32 = (UIView *)objc_msgSend(v31, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      v33 = self->__maxTrackMaskView;
      self->__maxTrackMaskView = v32;

      v34 = [MEMORY[0x263F825C8] whiteColor];
      [(UIView *)self->__maxTrackMaskView setBackgroundColor:v34];

      maxTrackMaskView = self->__maxTrackMaskView;
    }
    v35 = [(UIView *)maxTrackMaskView layer];
    v36 = [v22 layer];
    [v36 setMask:v35];
  }
  LODWORD(v88) = v20;
  -[CAMZoomSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v4, v6, v8, v10, v93, v13, v15, v17, v88);
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  [v21 bounds];
  objc_msgSend(v21, "convertRect:toView:", self);
  double v46 = v45;
  double v92 = v48;
  double v94 = v47;
  double v89 = v49;
  [v22 bounds];
  objc_msgSend(v22, "convertRect:toView:", self);
  double v51 = v50;
  double v90 = v53;
  double v91 = v52;
  double v55 = v54;
  v96.origin.x = v38;
  v96.origin.y = v40;
  v96.size.width = v42;
  v96.size.height = v44;
  double v56 = CGRectGetMinX(v96) + 1.0;
  v97.origin.x = v38;
  v97.origin.y = v40;
  v97.size.width = v42;
  v97.size.height = v44;
  double v57 = CGRectGetMaxX(v97) + -1.0;
  double v58 = v46;
  if (v18)
  {
    double v60 = v92;
    double v59 = v94;
    double v61 = v89;
    double v62 = v89;
    double v63 = v57 - CGRectGetMinX(*(CGRect *)&v58);
    double v64 = fmax(v63, 0.0);
    if (v63 <= 0.0) {
      double v63 = -0.0;
    }
    double v46 = v46 + v63;
    v98.origin.x = v51;
    v98.size.height = v90;
    v98.origin.y = v91;
    v98.size.width = v55;
    double v65 = fmax(CGRectGetMaxX(v98) - v56, 0.0);
  }
  else
  {
    double v67 = v92;
    double v66 = v94;
    double v61 = v89;
    double v68 = v89;
    double v64 = fmax(CGRectGetMaxX(*(CGRect *)&v58) - v56, 0.0);
    v99.origin.x = v51;
    v99.size.height = v90;
    v99.origin.y = v91;
    v99.size.width = v55;
    double v69 = v57 - CGRectGetMinX(v99);
    double v70 = -0.0;
    if (v69 > 0.0) {
      double v70 = v69;
    }
    double v51 = v51 + v70;
    double v65 = fmax(v69, 0.0);
  }
  double v71 = v55 - v65;
  -[CAMZoomSlider convertRect:toView:](self, "convertRect:toView:", v21, v46, v94, v92 - v64, v61);
  double v73 = v72;
  double v75 = v74;
  double v77 = v76;
  double v79 = v78;
  -[CAMZoomSlider convertRect:toView:](self, "convertRect:toView:", v22, v51, v91, v71, v90);
  double v81 = v80;
  double v83 = v82;
  double v85 = v84;
  double v87 = v86;
  -[UIView setFrame:](self->__minTrackMaskView, "setFrame:", v73, v75, v77, v79);
  -[UIView setFrame:](self->__maxTrackMaskView, "setFrame:", v81, v83, v85, v87);
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(CAMZoomSlider *)self minimumValueImage];
  [v8 size];
  double v29 = v9;
  double v11 = v10;
  -[CAMZoomSlider trackRectForBounds:](self, "trackRectForBounds:", x, y, width, height);
  CGRectGetMidY(v30);
  UIRoundToViewScale();
  double v13 = v12;
  [(CAMZoomSlider *)self alignmentRectInsets];
  double v15 = v14;
  double v17 = v16;
  char v18 = [(CAMZoomSlider *)self _shouldReverseLayoutDirection];
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  if (v18)
  {
    double v23 = v29;
    double v24 = CGRectGetMaxX(*(CGRect *)&v19) - v29 - v17;
  }
  else
  {
    double v24 = v15 + CGRectGetMinX(*(CGRect *)&v19);
    double v23 = v29;
  }

  double v25 = v24;
  double v26 = v13;
  double v27 = v23;
  double v28 = v11;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(CAMZoomSlider *)self maximumValueImage];
  [v8 size];
  double v29 = v9;
  double v11 = v10;
  -[CAMZoomSlider trackRectForBounds:](self, "trackRectForBounds:", x, y, width, height);
  CGRectGetMidY(v30);
  UIRoundToViewScale();
  double v13 = v12;
  [(CAMZoomSlider *)self alignmentRectInsets];
  double v15 = v14;
  double v17 = v16;
  char v18 = [(CAMZoomSlider *)self _shouldReverseLayoutDirection];
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  if (v18)
  {
    double v23 = v15 + CGRectGetMinX(*(CGRect *)&v19);
    double v24 = v29;
  }
  else
  {
    double v24 = v29;
    double v23 = CGRectGetMaxX(*(CGRect *)&v19) - v29 - v17;
  }

  double v25 = v23;
  double v26 = v13;
  double v27 = v24;
  double v28 = v11;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double width = a3.size.width;
  double height = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CAMZoomSlider *)self alignmentRectInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(CAMZoomSlider *)self minimumValueImage];
  double v15 = [(CAMZoomSlider *)self maximumValueImage];
  [v14 size];
  double v17 = v16;
  [v15 size];
  double v19 = v18;
  int v20 = [(CAMZoomSlider *)self _shouldReverseLayoutDirection];
  if (v20) {
    double v21 = v19;
  }
  else {
    double v21 = v17;
  }
  if (v20) {
    double v22 = v17;
  }
  else {
    double v22 = v19;
  }
  double v23 = v9 + v21 + 20.0;
  CGFloat v24 = x + v23;
  CGFloat v25 = y + v7;
  CGFloat v26 = width - (v23 + v13 + v22 + 20.0);
  CGFloat v27 = height - (v7 + v11);
  double v28 = [(CAMZoomSlider *)self minimumTrackImageForState:0];
  [v28 size];
  double v30 = v29;
  v39.origin.double x = v24;
  v39.origin.double y = v25;
  v39.size.double width = v26;
  v39.size.double height = v27;
  CGRectGetMidY(v39);
  UIRoundToViewScale();
  double v32 = v31;

  double v33 = v24;
  double v34 = v32;
  double v35 = v26;
  double v36 = v30;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = -[CAMZoomSlider thumbImageForState:](self, "thumbImageForState:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v10 size];
  double v12 = v11;
  double v14 = v13;
  *(float *)&double v11 = a5;
  -[CAMZoomSlider _thumbCenterXForValue:trackRect:](self, "_thumbCenterXForValue:trackRect:", v11, x, y, width, height);
  double v16 = v15;
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  double v28 = v16;
  double MidY = CGRectGetMidY(v30);
  long long v25 = *MEMORY[0x263F00148];
  double v26 = v12;
  double v27 = v14;
  +[CAMView ceilBounds:&v25 andRoundCenter:&v28 toViewScale:self];
  double v17 = v26;
  double v18 = v27;
  double v19 = v28 - v26 * 0.5;
  double v20 = MidY - v27 * 0.5;

  double v21 = v19;
  double v22 = v20;
  double v23 = v17;
  double v24 = v18;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (double)_thumbCenterXForValue:(float)a3 trackRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(CAMZoomSlider *)self minimumValue];
  float v11 = v10;
  [(CAMZoomSlider *)self maximumValue];
  float v13 = (float)(a3 - v11) / (float)(v12 - v11);
  if (v13 < 0.0) {
    float v13 = 0.0;
  }
  if (v13 <= 1.0) {
    float v14 = v13;
  }
  else {
    float v14 = 1.0;
  }
  if ([(CAMZoomSlider *)self _shouldReverseLayoutDirection]) {
    float v14 = 1.0 - v14;
  }
  -[CAMZoomSlider _thumbCenterMinimumXForTrackRect:](self, "_thumbCenterMinimumXForTrackRect:", x, y, width, height);
  double v16 = v15;
  -[CAMZoomSlider _thumbCenterMaximumXForTrackRect:](self, "_thumbCenterMaximumXForTrackRect:", x, y, width, height);
  return v16 + v14 * (v17 - v16);
}

- (float)_valueForThumbCenterX:(double)a3 trackRect:(CGRect)a4
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  -[CAMZoomSlider _thumbCenterMinimumXForTrackRect:](self, "_thumbCenterMinimumXForTrackRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v11 = v10;
  -[CAMZoomSlider _thumbCenterMaximumXForTrackRect:](self, "_thumbCenterMaximumXForTrackRect:", x, y, width, height);
  *(float *)&CGFloat width = (a3 - v11) / (v12 - v11);
  [(CAMZoomSlider *)self minimumValue];
  float v14 = v13;
  [(CAMZoomSlider *)self maximumValue];
  float v16 = v14 + (float)(*(float *)&width * (float)(result - v14));
  if (v16 < v14) {
    float v16 = v14;
  }
  if (v16 <= result) {
    return v16;
  }
  return result;
}

- (double)_thumbCenterMinimumXForTrackRect:(CGRect)a3
{
  return CGRectGetMinX(a3) + 3.0;
}

- (double)_thumbCenterMaximumXForTrackRect:(CGRect)a3
{
  return CGRectGetMaxX(a3) + -3.0;
}

- (int64_t)locationOfTouch:(id)a3
{
  [a3 locationInView:self];
  CGFloat v50 = v5;
  double v51 = v4;
  [(CAMZoomSlider *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  -[CAMZoomSlider minimumValueImageRectForBounds:](self, "minimumValueImageRectForBounds:");
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  double v48 = v9;
  double v49 = v7;
  double v46 = v13;
  double v47 = v11;
  -[CAMZoomSlider maximumValueImageRectForBounds:](self, "maximumValueImageRectForBounds:", v7, v9, v11, v13);
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  v55.origin.CGFloat x = v15;
  v55.origin.CGFloat y = v17;
  v55.size.CGFloat width = v19;
  v55.size.CGFloat height = v21;
  CGRect v56 = CGRectInset(v55, -15.0, -15.0);
  CGFloat x = v56.origin.x;
  CGFloat y = v56.origin.y;
  CGFloat width = v56.size.width;
  CGFloat height = v56.size.height;
  v56.origin.CGFloat x = v23;
  v56.origin.CGFloat y = v25;
  v56.size.CGFloat width = v27;
  v56.size.CGFloat height = v29;
  CGRect v57 = CGRectInset(v56, -15.0, -15.0);
  CGFloat v34 = v57.origin.x;
  CGFloat v35 = v57.origin.y;
  CGFloat v36 = v57.size.width;
  CGFloat v37 = v57.size.height;
  v57.origin.CGFloat x = x;
  v57.origin.CGFloat y = y;
  v57.size.CGFloat width = width;
  v57.size.CGFloat height = height;
  v52.CGFloat x = v51;
  v52.CGFloat y = v50;
  if (CGRectContainsPoint(v57, v52)) {
    return 3;
  }
  v58.origin.CGFloat x = v34;
  v58.origin.CGFloat y = v35;
  v58.size.CGFloat width = v36;
  v58.size.CGFloat height = v37;
  v53.CGFloat x = v51;
  v53.CGFloat y = v50;
  if (CGRectContainsPoint(v58, v53)) {
    return 4;
  }
  v59.origin.CGFloat x = v49;
  v59.origin.CGFloat y = v48;
  v59.size.CGFloat width = v47;
  v59.size.CGFloat height = v46;
  v54.CGFloat x = v51;
  v54.CGFloat y = v50;
  if (!CGRectContainsPoint(v59, v54)) {
    return 0;
  }
  [(CAMZoomSlider *)self value];
  int v40 = v39;
  -[CAMZoomSlider trackRectForBounds:](self, "trackRectForBounds:", v49, v48, v47, v46);
  LODWORD(v45) = v40;
  -[CAMZoomSlider thumbRectForBounds:trackRect:value:](self, "thumbRectForBounds:trackRect:value:", v49, v48, v47, v46, v41, v42, v43, v44, v45);
  if (vabdd_f64(CGRectGetMidX(v60), v51) > 40.0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMZoomSlider;
  if ([(CAMZoomSlider *)&v10 beginTrackingWithTouch:v6 withEvent:a4]) {
    goto LABEL_7;
  }
  int64_t v7 = [(CAMZoomSlider *)self locationOfTouch:v6];
  switch(v7)
  {
    case 2:
      goto LABEL_7;
    case 4:
      [(CAMZoomSlider *)self _setMaximumAutozooming:1];
      goto LABEL_7;
    case 3:
      [(CAMZoomSlider *)self _setMinimumAutozooming:1];
LABEL_7:
      BOOL v8 = 1;
      [(CAMZoomSlider *)self setVisibilityTimerSuspended:1];
      goto LABEL_8;
  }
  if ([(NSTimer *)self->__visibilityTimer isValid]) {
    [(CAMZoomSlider *)self _startVisibilityTimer];
  }
  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CAMZoomSlider *)self isAutozooming])
  {
    [v6 previousLocationInView:self];
    double v9 = v8;
    double v11 = v10;
    [v6 locationInView:self];
    double v13 = v12;
    double v14 = vabdd_f64(v12, v9);
    if (v14 > vabdd_f64(v15, v11) && v14 > 20.0)
    {
      if ([(CAMZoomSlider *)self isMinimumAutozooming] && v13 > v9)
      {
        [(CAMZoomSlider *)self _setMinimumAutozooming:0];
      }
      else if ([(CAMZoomSlider *)self isMaximumAutozooming] && v13 < v9)
      {
        [(CAMZoomSlider *)self _setMaximumAutozooming:0];
      }
    }
  }
  if ([(CAMZoomSlider *)self isAutozooming])
  {
    BOOL v17 = 1;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)CAMZoomSlider;
    BOOL v17 = [(CAMZoomSlider *)&v19 continueTrackingWithTouch:v6 withEvent:v7];
  }

  return v17;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CAMZoomSlider *)self isAutozooming])
  {
    [(CAMZoomSlider *)self _setMinimumAutozooming:0];
    [(CAMZoomSlider *)self _setMaximumAutozooming:0];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CAMZoomSlider;
    [(CAMZoomSlider *)&v8 endTrackingWithTouch:v6 withEvent:v7];
  }
  [(CAMZoomSlider *)self setVisibilityTimerSuspended:0];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4 = a3;
  [(CAMZoomSlider *)self setVisibilityTimerSuspended:0];
  v5.receiver = self;
  v5.super_class = (Class)CAMZoomSlider;
  [(CAMZoomSlider *)&v5 cancelTrackingWithEvent:v4];
}

- (void)_setMinimumAutozooming:(BOOL)a3
{
  if (self->_minimumAutozooming != a3)
  {
    self->_minimumAutozooming = a3;
    [(CAMZoomSlider *)self _updateAutozooming];
  }
}

- (void)_setMaximumAutozooming:(BOOL)a3
{
  if (self->_maximumAutozooming != a3)
  {
    self->_maximumAutozooming = a3;
    [(CAMZoomSlider *)self _updateAutozooming];
  }
}

- (BOOL)isAutozooming
{
  if ([(CAMZoomSlider *)self isMinimumAutozooming]) {
    return 1;
  }
  return [(CAMZoomSlider *)self isMaximumAutozooming];
}

- (void)_beginAutozooming
{
  if (!self->__autozooming)
  {
    self->__autozooming = 1;
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      objc_super v5 = WeakRetained;
      id v6 = objc_loadWeakRetained((id *)p_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)p_delegate);
        [v8 zoomSliderDidBeginAutozooming:self];
      }
    }
  }
}

- (void)_updateAutozooming
{
  if ([(CAMZoomSlider *)self isAutozooming])
  {
    [(CAMZoomSlider *)self _beginAutozooming];
  }
  else
  {
    [(CAMZoomSlider *)self _endAutozooming];
  }
}

- (void)_endAutozooming
{
  if (self->__autozooming)
  {
    self->__autozooming = 0;
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      objc_super v5 = WeakRetained;
      id v6 = objc_loadWeakRetained((id *)p_delegate);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)p_delegate);
        [v8 zoomSliderDidEndAutozooming:self];
      }
    }
  }
}

- (BOOL)shouldHideForExpiredVisibilityTimer
{
  char v3 = objc_msgSend((id)objc_opt_class(), "shouldFadeOutZoomSliderForLayoutStyle:", -[CAMZoomSlider layoutStyle](self, "layoutStyle"));
  BOOL v4 = [(CAMZoomSlider *)self isVisibilityTimerSuspended];
  return v3 & ((v4 | [(NSTimer *)self->__visibilityTimer isValid]) ^ 1);
}

- (void)setVisibilityTimerSuspended:(BOOL)a3
{
  if (self->_visibilityTimerSuspended != a3)
  {
    self->_visibilityTimerSuspended = a3;
    if (a3) {
      [(CAMZoomSlider *)self _stopVisibilityTimer];
    }
    else {
      [(CAMZoomSlider *)self _startVisibilityTimer];
    }
  }
}

- (void)_startVisibilityTimer
{
  [(CAMZoomSlider *)self _stopVisibilityTimer];
  if (objc_msgSend((id)objc_opt_class(), "shouldFadeOutZoomSliderForLayoutStyle:", -[CAMZoomSlider layoutStyle](self, "layoutStyle"))&& !-[CAMZoomSlider isVisibilityTimerSuspended](self, "isVisibilityTimerSuspended"))
  {
    id v3 = objc_alloc(MEMORY[0x263EFFA20]);
    BOOL v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:5.0];
    objc_super v5 = (NSTimer *)[v3 initWithFireDate:v4 interval:self target:sel__hideZoomSlider_ selector:0 userInfo:0 repeats:0.0];
    visibilityTimer = self->__visibilityTimer;
    self->__visibilityTimer = v5;

    id v7 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v7 addTimer:self->__visibilityTimer forMode:*MEMORY[0x263EFFE88]];
  }
}

- (void)_stopVisibilityTimer
{
  visibilityTimer = self->__visibilityTimer;
  if (visibilityTimer && [(NSTimer *)visibilityTimer isValid])
  {
    [(NSTimer *)self->__visibilityTimer invalidate];
    BOOL v4 = self->__visibilityTimer;
    self->__visibilityTimer = 0;
  }
}

- (void)makeVisibleAnimated:(BOOL)a3
{
  if (a3) {
    double v4 = 0.05;
  }
  else {
    double v4 = 0.0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__CAMZoomSlider_makeVisibleAnimated___block_invoke;
  v8[3] = &unk_263FA0208;
  v8[4] = self;
  +[CAMView animateIfNeededWithDuration:v8 animations:v4];
  [(CAMZoomSlider *)self _startVisibilityTimer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 willShowZoomSlider:self withAnimationDuration:v4];
  }
}

uint64_t __37__CAMZoomSlider_makeVisibleAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)makeInvisibleAnimated:(BOOL)a3
{
  double v3 = 0.1;
  if (!a3) {
    double v3 = 0.0;
  }
  [(CAMZoomSlider *)self _makeInvisibleAnimationDuration:v3];
}

- (void)_makeInvisibleAnimationDuration:(double)a3
{
  [(CAMZoomSlider *)self _stopVisibilityTimer];
  if ([(CAMZoomSlider *)self isHidden])
  {
    BOOL v5 = 1;
  }
  else
  {
    [(CAMZoomSlider *)self alpha];
    BOOL v5 = v6 == 0.0;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__CAMZoomSlider__makeInvisibleAnimationDuration___block_invoke;
  v10[3] = &unk_263FA0208;
  v10[4] = self;
  +[CAMView animateIfNeededWithDuration:v10 animations:a3];
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 willHideZoomSlider:self withAnimationDuration:a3];
    }
  }
}

uint64_t __49__CAMZoomSlider__makeInvisibleAnimationDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)_hideZoomSlider:(id)a3
{
  if (([(CAMZoomSlider *)self isTracking] & 1) == 0)
  {
    [(CAMZoomSlider *)self _stopVisibilityTimer];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__CAMZoomSlider__hideZoomSlider___block_invoke;
    v7[3] = &unk_263FA0208;
    v7[4] = self;
    +[CAMView animateIfNeededWithDuration:v7 animations:0.5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 willHideZoomSlider:self withAnimationDuration:0.5];
    }
  }
}

uint64_t __33__CAMZoomSlider__hideZoomSlider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)_handleTouchUpInside:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained zoomSliderDidEndZooming:self];
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMZoomSlider *)self _updateForLayoutStyle];
  }
}

- (void)_updateForLayoutStyle
{
  int64_t v3 = [(CAMZoomSlider *)self layoutStyle];
  if (v3 == 1) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 0;
  }
  [(CAMZoomSlider *)self setSemanticContentAttribute:v4];
  char v5 = (void *)MEMORY[0x263F827E8];
  id v6 = CAMCameraUIFrameworkBundle();
  id v7 = [v5 imageNamed:@"CAMZoomSliderThumb" inBundle:v6];
  char v8 = [MEMORY[0x263F825C8] systemYellowColor];
  id v28 = [v7 imageWithTintColor:v8];

  id v9 = (void *)MEMORY[0x263F827E8];
  double v10 = CAMCameraUIFrameworkBundle();
  double v11 = [v9 imageNamed:@"CAMZoomSliderTrack" inBundle:v10];

  double v12 = (void *)MEMORY[0x263F827E8];
  double v13 = CAMCameraUIFrameworkBundle();
  double v14 = [v12 imageNamed:@"CAMZoomSliderPlus" inBundle:v13];
  double v15 = [MEMORY[0x263F825C8] whiteColor];
  double v16 = [v14 imageWithTintColor:v15];

  BOOL v17 = (void *)MEMORY[0x263F827E8];
  double v18 = CAMCameraUIFrameworkBundle();
  objc_super v19 = [v17 imageNamed:@"CAMZoomSliderMinus" inBundle:v18];

  [v11 size];
  double v22 = objc_msgSend(v11, "resizableImageWithCapInsets:resizingMode:", 1, v20 * 0.5, v21 * 0.5, v20 * 0.5, v21 * 0.5);
  if (v3 == 1)
  {
    CGFloat v23 = (void *)MEMORY[0x263F827E8];
    id v24 = v19;
    uint64_t v25 = [v24 CGImage];
    [v24 scale];
    objc_super v19 = objc_msgSend(v23, "imageWithCGImage:scale:orientation:", v25, 2);
  }
  double v26 = [MEMORY[0x263F825C8] whiteColor];
  CGFloat v27 = [v19 imageWithTintColor:v26];

  [(CAMZoomSlider *)self setThumbImage:v28 forState:0];
  [(CAMZoomSlider *)self setMinimumTrackImage:v22 forState:0];
  [(CAMZoomSlider *)self setMaximumTrackImage:v22 forState:0];
  [(CAMZoomSlider *)self setMaximumValueImage:v16];
  [(CAMZoomSlider *)self setMinimumValueImage:v27];
  [(CAMZoomSlider *)self setNeedsLayout];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    [(CAMZoomSlider *)self setNeedsLayout];
    if (v4)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __41__CAMZoomSlider_setOrientation_animated___block_invoke;
      v6[3] = &unk_263FA0208;
      v6[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v6 options:0 animations:0.3 completion:0.0];
    }
  }
}

uint64_t __41__CAMZoomSlider_setOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (CAMZoomSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMZoomSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
}

- (BOOL)isMinimumAutozooming
{
  return self->_minimumAutozooming;
}

- (BOOL)isMaximumAutozooming
{
  return self->_maximumAutozooming;
}

- (BOOL)isVisibilityTimerSuspended
{
  return self->_visibilityTimerSuspended;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (NSTimer)_visibilityTimer
{
  return self->__visibilityTimer;
}

- (BOOL)_isAutozooming
{
  return self->__autozooming;
}

- (void)_setAutozooming:(BOOL)a3
{
  self->__autozooming = a3;
}

- (UIView)_minTrackMaskView
{
  return self->__minTrackMaskView;
}

- (UIView)_maxTrackMaskView
{
  return self->__maxTrackMaskView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__maxTrackMaskView, 0);
  objc_storeStrong((id *)&self->__minTrackMaskView, 0);
  objc_storeStrong((id *)&self->__visibilityTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end