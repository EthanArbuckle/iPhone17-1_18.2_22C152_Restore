@interface BKUIPearlCoachingDeviceView
- (BKUIPearlCoachingDeviceView)initWithSheetLayout:(BOOL)a3;
- (BKUIRotationArrowAnimationLayer)animationLayer;
- (BOOL)animationRunning;
- (BOOL)inSheet;
- (BOOL)isDisplayZoomEnabled;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)widthConstraint;
- (UIImage)deviceImage;
- (UIImageView)deviceView;
- (UITraitChangeRegistration)traitChangeRegistration;
- (id)_colorForStroke;
- (int64_t)orientation;
- (void)layoutSubviews;
- (void)resetDevice;
- (void)rotateDeviceToAngle:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setAnimationLayer:(id)a3;
- (void)setAnimationRunning:(BOOL)a3;
- (void)setDeviceHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDeviceImage:(id)a3;
- (void)setDeviceView:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setInSheet:(BOOL)a3;
- (void)setIsDisplayZoomEnabled:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setWidthConstraint:(id)a3;
- (void)startAnimation;
- (void)stopAnimation;
@end

@implementation BKUIPearlCoachingDeviceView

- (BKUIPearlCoachingDeviceView)initWithSheetLayout:(BOOL)a3
{
  BOOL v3 = a3;
  v64[5] = *MEMORY[0x1E4F143B8];
  v62.receiver = self;
  v62.super_class = (Class)BKUIPearlCoachingDeviceView;
  v4 = [(BKUIPearlCoachingDeviceView *)&v62 init];
  v5 = v4;
  if (v4)
  {
    v4->_inSheet = v3;
    if (v3) {
      double v6 = 180.0;
    }
    else {
      double v6 = 300.0;
    }
    uint64_t v7 = MGGetProductType();
    if (v7 > 2619317133)
    {
      if (v7 == 3241053352) {
        goto LABEL_11;
      }
      uint64_t v8 = 2619317134;
    }
    else
    {
      if (v7 == 555503454) {
        goto LABEL_11;
      }
      uint64_t v8 = 2487868872;
    }
    if (v7 != v8)
    {
      v11 = NSString;
      v10 = [NSNumber numberWithDouble:v6];
      v57 = objc_msgSend(v11, "stringWithFormat:", @"ipad-%i-j3xx", objc_msgSend(v10, "intValue"));
      char v50 = 0;
      goto LABEL_13;
    }
LABEL_11:
    v9 = NSString;
    v10 = [NSNumber numberWithDouble:v6];
    v57 = objc_msgSend(v9, "stringWithFormat:", @"ipad-%i-landscape", objc_msgSend(v10, "intValue"));
    char v50 = 1;
LABEL_13:

    v12 = (void *)MEMORY[0x1E4F42A80];
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v14 = [(BKUIPearlCoachingDeviceView *)v5 traitCollection];
    v15 = [v12 imageNamed:v57 inBundle:v13 compatibleWithTraitCollection:v14];
    [(BKUIPearlCoachingDeviceView *)v5 setDeviceImage:v15];

    id v16 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v17 = [(BKUIPearlCoachingDeviceView *)v5 deviceImage];
    v18 = (void *)[v16 initWithImage:v17];
    [(BKUIPearlCoachingDeviceView *)v5 setDeviceView:v18];

    v19 = [MEMORY[0x1E4F428B8] colorWithRed:0.125490196 green:0.580392157 blue:0.980392157 alpha:1.0];
    v20 = [(BKUIPearlCoachingDeviceView *)v5 deviceView];
    [v20 setTintColor:v19];

    v21 = [(BKUIPearlCoachingDeviceView *)v5 deviceView];
    [v21 setContentMode:1];

    v22 = [(BKUIPearlCoachingDeviceView *)v5 deviceView];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

    v23 = [(BKUIPearlCoachingDeviceView *)v5 deviceView];
    [(BKUIPearlCoachingDeviceView *)v5 addSubview:v23];

    v24 = [(BKUIPearlCoachingDeviceView *)v5 deviceImage];
    [v24 size];
    double v26 = v25;
    v27 = [(BKUIPearlCoachingDeviceView *)v5 deviceImage];
    [v27 size];
    double v29 = v28;

    v30 = [(BKUIPearlCoachingDeviceView *)v5 deviceView];
    v31 = [v30 heightAnchor];
    double v32 = fmax(v6, v26 * (v6 / v29));
    v33 = [v31 constraintEqualToConstant:v32];
    [(BKUIPearlCoachingDeviceView *)v5 setHeightConstraint:v33];

    v34 = [(BKUIPearlCoachingDeviceView *)v5 deviceView];
    v35 = [v34 widthAnchor];
    v36 = [v35 constraintEqualToConstant:v32];
    [(BKUIPearlCoachingDeviceView *)v5 setWidthConstraint:v36];

    v49 = (void *)MEMORY[0x1E4F28DC8];
    v56 = [(BKUIPearlCoachingDeviceView *)v5 deviceView];
    v55 = [v56 centerXAnchor];
    v54 = [(BKUIPearlCoachingDeviceView *)v5 centerXAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v64[0] = v53;
    v52 = [(BKUIPearlCoachingDeviceView *)v5 deviceView];
    v51 = [v52 centerYAnchor];
    v37 = [(BKUIPearlCoachingDeviceView *)v5 centerYAnchor];
    v38 = [v51 constraintEqualToAnchor:v37];
    v64[1] = v38;
    v39 = [(BKUIPearlCoachingDeviceView *)v5 deviceView];
    v40 = [v39 bottomAnchor];
    v41 = [(BKUIPearlCoachingDeviceView *)v5 bottomAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v64[2] = v42;
    v43 = [(BKUIPearlCoachingDeviceView *)v5 heightConstraint];
    v64[3] = v43;
    v44 = [(BKUIPearlCoachingDeviceView *)v5 widthConstraint];
    v64[4] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:5];
    [v49 activateConstraints:v45];

    objc_initWeak(&location, v5);
    v63[0] = objc_opt_class();
    v63[1] = objc_opt_class();
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __51__BKUIPearlCoachingDeviceView_initWithSheetLayout___block_invoke;
    v58[3] = &unk_1E6EA2908;
    objc_copyWeak(&v59, &location);
    char v60 = v50;
    v47 = [(BKUIPearlCoachingDeviceView *)v5 registerForTraitChanges:v46 withHandler:v58];
    [(BKUIPearlCoachingDeviceView *)v5 setTraitChangeRegistration:v47];

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __51__BKUIPearlCoachingDeviceView_initWithSheetLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  double v6 = [WeakRetained traitCollection];
  uint64_t v7 = [v6 horizontalSizeClass];
  uint64_t v8 = [v5 horizontalSizeClass];

  if (v7 != v8)
  {
    if ([WeakRetained inSheet]) {
      double v9 = 180.0;
    }
    else {
      double v9 = 300.0;
    }
    int v10 = *(unsigned __int8 *)(a1 + 40);
    v11 = NSString;
    v12 = [NSNumber numberWithDouble:v9];
    uint64_t v13 = [v12 intValue];
    if (v10) {
      v14 = @"ipad-%i-landscape";
    }
    else {
      v14 = @"ipad-%i-j3xx";
    }
    v15 = objc_msgSend(v11, "stringWithFormat:", v14, v13);

    id v16 = [WeakRetained deviceImage];
    [v16 size];
    double v18 = v17;
    v19 = [WeakRetained deviceImage];
    [v19 size];
    double v21 = v18 * (v9 / v20);

    double v22 = fmax(v9, v21);
    v23 = (void *)MEMORY[0x1E4F42A80];
    v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v25 = [WeakRetained traitCollection];
    double v26 = [v23 imageNamed:v15 inBundle:v24 compatibleWithTraitCollection:v25];
    [WeakRetained setDeviceImage:v26];

    v27 = [WeakRetained heightConstraint];
    [v27 setConstant:v22];

    double v28 = [WeakRetained widthConstraint];
    [v28 setConstant:v22];

    double v29 = [WeakRetained deviceView];
    [v29 layoutIfNeeded];
  }
}

- (void)startAnimation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "Coaching: startAnimation", buf, 2u);
  }

  if (![(BKUIPearlCoachingDeviceView *)self animationRunning])
  {
    [(BKUIPearlCoachingDeviceView *)self setAnimationRunning:1];
    uint64_t v4 = MGGetProductType();
    if (v4 > 2619317133)
    {
      if (v4 == 2619317134) {
        goto LABEL_10;
      }
      uint64_t v5 = 3241053352;
    }
    else
    {
      if (v4 == 555503454) {
        goto LABEL_10;
      }
      uint64_t v5 = 2487868872;
    }
    if (v4 != v5)
    {
      int64_t v8 = [(BKUIPearlCoachingDeviceView *)self orientation];
      double v9 = 0.0;
      if (v8 != 1)
      {
        if ([(BKUIPearlCoachingDeviceView *)self orientation] == 4)
        {
          double v9 = -1.57079633;
        }
        else if ([(BKUIPearlCoachingDeviceView *)self orientation] == 3)
        {
          double v9 = 1.57079633;
        }
        else
        {
          int64_t v10 = [(BKUIPearlCoachingDeviceView *)self orientation];
          double v9 = 3.14159265;
          if (v10 != 2) {
            double v9 = 0.0;
          }
        }
      }
      double v7 = -v9;
      goto LABEL_20;
    }
LABEL_10:
    unint64_t v6 = [(BKUIPearlCoachingDeviceView *)self orientation] - 1;
    double v7 = 0.0;
    if (v6 < 3) {
      double v7 = dbl_1E4BD1640[v6];
    }
LABEL_20:
    v11 = _BKUILoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v12 = [(BKUIPearlCoachingDeviceView *)self orientation];
      *(_DWORD *)buf = 134218240;
      int64_t v16 = v12;
      __int16 v17 = 2048;
      double v18 = v7;
      _os_log_impl(&dword_1E4B6C000, v11, OS_LOG_TYPE_DEFAULT, "Coaching: self.orientation = %lu, rotation = %f", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke;
    v13[3] = &unk_1E6EA2098;
    objc_copyWeak(&v14, (id *)buf);
    [(BKUIPearlCoachingDeviceView *)self rotateDeviceToAngle:v7 != 0.0 animated:v13 completion:v7];
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke_2;
  v3[3] = &unk_1E6EA2098;
  objc_copyWeak(&v4, v1);
  [WeakRetained setDeviceHidden:1 animated:1 completion:v3];
  objc_destroyWeak(&v4);
}

void __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetDevice];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke_3;
  v3[3] = &unk_1E6EA2098;
  objc_copyWeak(&v4, v1);
  [WeakRetained setDeviceHidden:0 animated:1 completion:v3];
  objc_destroyWeak(&v4);
}

void __45__BKUIPearlCoachingDeviceView_startAnimation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAnimationRunning:0];
  [WeakRetained startAnimation];
}

- (void)stopAnimation
{
  [MEMORY[0x1E4F39CF8] begin];
  BOOL v3 = [(BKUIPearlCoachingDeviceView *)self deviceView];
  id v4 = [v3 layer];
  [v4 removeAllAnimations];

  [MEMORY[0x1E4F39CF8] commit];
  uint64_t v5 = [(BKUIPearlCoachingDeviceView *)self animationLayer];
  [v5 stopAnimationRemoveStroke];

  [(BKUIPearlCoachingDeviceView *)self setAnimationRunning:0];
}

- (void)resetDevice
{
  [(BKUIPearlCoachingDeviceView *)self stopAnimation];
  BOOL v3 = [(BKUIPearlCoachingDeviceView *)self animationLayer];
  [v3 resetLayout];

  id v4 = [(BKUIPearlCoachingDeviceView *)self deviceView];
  uint64_t v5 = [v4 layer];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v19[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v19[5] = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v19[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v19[7] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v19[0] = *MEMORY[0x1E4F39B10];
  v19[1] = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v19[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v19[3] = v9;
  [v5 setTransform:v19];

  int64_t v10 = [(BKUIPearlCoachingDeviceView *)self orientation];
  if ((unint64_t)(v10 - 2) > 2) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = qword_1E4BD1658[v10 - 2];
  }
  id v12 = objc_alloc(MEMORY[0x1E4F42A80]);
  id v13 = [(BKUIPearlCoachingDeviceView *)self deviceImage];
  uint64_t v14 = [v13 CGImage];
  v15 = [(BKUIPearlCoachingDeviceView *)self deviceImage];
  [v15 scale];
  int64_t v16 = objc_msgSend(v12, "initWithCGImage:scale:orientation:", v14, v11);
  __int16 v17 = [v16 imageWithRenderingMode:2];

  double v18 = [(BKUIPearlCoachingDeviceView *)self deviceView];
  [v18 setImage:v17];
}

- (void)rotateDeviceToAngle:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  double v9 = dbl_1E4BD15F0[fabs(a3) > 1.57079633];
  [(BKUIPearlCoachingDeviceView *)self center];
  double v11 = v10;
  double v13 = v12;
  uint64_t v14 = [(BKUIPearlCoachingDeviceView *)self animationLayer];
  objc_msgSend(v14, "setPosition:", v11, v13);

  v15 = [(BKUIPearlCoachingDeviceView *)self animationLayer];
  [v15 setNeedsLayout];

  int64_t v16 = [(BKUIPearlCoachingDeviceView *)self animationLayer];
  [v16 layoutIfNeeded];

  __int16 v17 = [(BKUIPearlCoachingDeviceView *)self animationLayer];
  double v18 = 0.8;
  objc_msgSend(v17, "animateDirectionPath:orientation:duration:animationDelay:", -[BKUIPearlCoachingDeviceView orientation](self, "orientation"), a3, v9, 0.8);

  uint64_t v19 = (void *)MEMORY[0x1E4F42FF0];
  if (!v5)
  {
    double v9 = 0.0;
    double v18 = 0.0;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__BKUIPearlCoachingDeviceView_rotateDeviceToAngle_animated_completion___block_invoke;
  v23[3] = &unk_1E6EA26D0;
  v23[4] = self;
  *(double *)&v23[5] = a3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__BKUIPearlCoachingDeviceView_rotateDeviceToAngle_animated_completion___block_invoke_2;
  v21[3] = &unk_1E6EA2478;
  id v22 = v8;
  id v20 = v8;
  [v19 animateWithDuration:0 delay:v23 options:v21 animations:v9 completion:v18];
}

void __71__BKUIPearlCoachingDeviceView_rotateDeviceToAngle_animated_completion___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeRotation(&v4, *(CGFloat *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) deviceView];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

uint64_t __71__BKUIPearlCoachingDeviceView_rotateDeviceToAngle_animated_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    BOOL v3 = a2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BKUIRotationArrowAnimationLayer)animationLayer
{
  if (!self->_animationLayer)
  {
    BOOL v3 = [(BKUIPearlCoachingDeviceView *)self superview];
    CGAffineTransform v4 = [(BKUIPearlCoachingDeviceView *)self _colorForStroke];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__BKUIPearlCoachingDeviceView_animationLayer__block_invoke;
    v9[3] = &unk_1E6EA2930;
    v9[4] = self;
    BOOL v5 = +[BKUIRotationArrowAnimationLayer animatorByEmbedding:v3 color:v4 radiusForOrientation:v9];
    animationLayer = self->_animationLayer;
    self->_animationLayer = v5;
  }
  [(BKUIPearlCoachingDeviceView *)self center];
  -[BKUIRotationArrowAnimationLayer setPosition:](self->_animationLayer, "setPosition:");
  long long v7 = self->_animationLayer;

  return v7;
}

double __45__BKUIPearlCoachingDeviceView_animationLayer__block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = [*(id *)(a1 + 32) inSheet];
  uint64_t v5 = MGGetProductType();
  if (v5 <= 2619317133)
  {
    if (v5 != 555503454)
    {
      uint64_t v6 = 2487868872;
      goto LABEL_6;
    }
LABEL_7:
    char v7 = [*(id *)(a1 + 32) isDisplayZoomEnabled];
    if (a2 == 4 && (v7 & 1) != 0) {
      double v8 = 400.0;
    }
    else {
      double v8 = dbl_1E4BD1600[a2 == 3];
    }
    goto LABEL_15;
  }
  if (v5 == 3241053352) {
    goto LABEL_7;
  }
  uint64_t v6 = 2619317134;
LABEL_6:
  if (v5 == v6) {
    goto LABEL_7;
  }
  int v9 = [*(id *)(a1 + 32) isDisplayZoomEnabled];
  double v8 = 670.0;
  if (v9) {
    double v8 = 400.0;
  }
  if (a2 != 2) {
    double v8 = 583.0;
  }
LABEL_15:
  double v10 = 2.0;
  if (v4) {
    double v10 = 3.5;
  }
  return v8 / v10;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)BKUIPearlCoachingDeviceView;
  [(BKUIPearlCoachingDeviceView *)&v4 layoutSubviews];
  id v3 = [(BKUIPearlCoachingDeviceView *)self animationLayer];
  [(BKUIPearlCoachingDeviceView *)self center];
  -[BKUIRotationArrowAnimationLayer setPosition:](self->_animationLayer, "setPosition:");
}

- (void)setDeviceHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  double v9 = 0.6;
  if (v6) {
    double v9 = 1.1;
  }
  BOOL v10 = !v5;
  if (v5) {
    double v11 = v9;
  }
  else {
    double v11 = 0.0;
  }
  double v12 = (void *)MEMORY[0x1E4F42FF0];
  if (v10) {
    double v13 = 0.0;
  }
  else {
    double v13 = 0.2;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__BKUIPearlCoachingDeviceView_setDeviceHidden_animated_completion___block_invoke;
  v17[3] = &unk_1E6EA2858;
  v17[4] = self;
  BOOL v18 = v6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__BKUIPearlCoachingDeviceView_setDeviceHidden_animated_completion___block_invoke_2;
  v15[3] = &unk_1E6EA2478;
  id v16 = v8;
  id v14 = v8;
  [v12 animateWithDuration:0 delay:v17 options:v15 animations:v13 completion:v11];
}

void __67__BKUIPearlCoachingDeviceView_setDeviceHidden_animated_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) deviceView];
  [v2 setAlpha:v1];
}

uint64_t __67__BKUIPearlCoachingDeviceView_setDeviceHidden_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
  [(BKUIPearlCoachingDeviceView *)self resetDevice];
  id v4 = [(BKUIPearlCoachingDeviceView *)self deviceView];
  [v4 setAlpha:1.0];
}

- (id)_colorForStroke
{
  return (id)[MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.490196079 blue:1.0 alpha:1.0];
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)isDisplayZoomEnabled
{
  return self->_isDisplayZoomEnabled;
}

- (void)setIsDisplayZoomEnabled:(BOOL)a3
{
  self->_isDisplayZoomEnabled = a3;
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (void)setDeviceImage:(id)a3
{
}

- (UIImageView)deviceView
{
  return self->_deviceView;
}

- (void)setDeviceView:(id)a3
{
}

- (void)setAnimationLayer:(id)a3
{
}

- (BOOL)animationRunning
{
  return self->_animationRunning;
}

- (void)setAnimationRunning:(BOOL)a3
{
  self->_animationRunning = a3;
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (void)setInSheet:(BOOL)a3
{
  self->_inSheet = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_animationLayer, 0);
  objc_storeStrong((id *)&self->_deviceView, 0);

  objc_storeStrong((id *)&self->_deviceImage, 0);
}

@end