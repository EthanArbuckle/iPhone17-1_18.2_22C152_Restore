@interface BKUIPearlPillView
- (BKUIPearlPillView)init;
- (BOOL)isCompleted;
- (CADisplayLink)displayLink;
- (CAShapeLayer)shapeLayer;
- (CGPath)pillPath;
- (NSDate)radiusAnimationStart;
- (NSDate)stateAnimationStart;
- (NSTimer)stateDelayTimer;
- (double)arc;
- (double)cornerRadius;
- (double)height;
- (double)numberOfPills;
- (double)pillCompletedHeight;
- (double)pillCornerRadius;
- (double)pillInitialHeight;
- (double)pillMaxLength;
- (double)radius;
- (double)radiusAnimationDuration;
- (double)ringArcLength;
- (double)ringHeight;
- (double)startArc;
- (double)startCornerRadius;
- (double)startHeight;
- (double)startRadius;
- (double)stateAnimationDuration;
- (double)targetArc;
- (double)targetCornerRadius;
- (double)targetHeight;
- (double)targetRadius;
- (id)radiusAnimationCompletion;
- (id)stateAnimationCompletion;
- (unint64_t)state;
- (void)dealloc;
- (void)displayTick;
- (void)layoutSubviews;
- (void)setArc:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDisplayLink:(id)a3;
- (void)setHeight:(double)a3;
- (void)setNumberOfPills:(double)a3;
- (void)setPillCompletedHeight:(double)a3;
- (void)setPillCornerRadius:(double)a3;
- (void)setPillInitialHeight:(double)a3;
- (void)setRadius:(double)a3;
- (void)setRadius:(double)a3 animationDuration:(double)a4 completion:(id)a5;
- (void)setRadiusAnimationCompletion:(id)a3;
- (void)setRadiusAnimationDuration:(double)a3;
- (void)setRadiusAnimationStart:(id)a3;
- (void)setRingHeight:(double)a3;
- (void)setShapeLayer:(id)a3;
- (void)setStartArc:(double)a3;
- (void)setStartCornerRadius:(double)a3;
- (void)setStartHeight:(double)a3;
- (void)setStartRadius:(double)a3;
- (void)setState:(unint64_t)a3;
- (void)setState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setState:(unint64_t)a3 animated:(BOOL)a4 animationDelay:(double)a5 completion:(id)a6 failure:(id)a7;
- (void)setState:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5 failure:(id)a6;
- (void)setStateAnimationCompletion:(id)a3;
- (void)setStateAnimationDuration:(double)a3;
- (void)setStateAnimationStart:(id)a3;
- (void)setStateDelayTimer:(id)a3;
- (void)setTargetArc:(double)a3;
- (void)setTargetCornerRadius:(double)a3;
- (void)setTargetHeight:(double)a3;
- (void)setTargetRadius:(double)a3;
- (void)startAnimationWithDuration:(double)a3 completion:(id)a4;
- (void)tearDownPillView;
@end

@implementation BKUIPearlPillView

- (BKUIPearlPillView)init
{
  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlPillView;
  id v2 = [(BKUIPearlPillView *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F39C88]);
    v4 = (void *)*((void *)v2 + 59);
    *((void *)v2 + 59) = v3;

    v5 = [v2 layer];
    [v5 addSublayer:*((void *)v2 + 59)];

    uint64_t v6 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v2 selector:sel_displayTick];
    v7 = (void *)*((void *)v2 + 58);
    *((void *)v2 + 58) = v6;

    v8 = (void *)*((void *)v2 + 58);
    v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v8 addToRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];

    -[CADisplayLink bkui_enableHighFrameRate](*((void *)v2 + 58));
    *((void *)v2 + 51) = 0;
    *((void *)v2 + 76) = 0;
  }
  return (BKUIPearlPillView *)v2;
}

- (void)displayTick
{
  id v3 = [(BKUIPearlPillView *)self stateAnimationStart];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(BKUIPearlPillView *)self radiusAnimationStart];
    BOOL v4 = v5 != 0;
  }
  uint64_t v6 = [(BKUIPearlPillView *)self stateAnimationStart];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F1C9C8] date];
    v8 = [(BKUIPearlPillView *)self stateAnimationStart];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;

    [(BKUIPearlPillView *)self stateAnimationDuration];
    if (v11 <= 0.0
      || ([(BKUIPearlPillView *)self stateAnimationDuration], double v13 = v10 / v12, v10 / v12 >= 1.0))
    {
      [(BKUIPearlPillView *)self setStateAnimationStart:0];
      double v13 = 1.0;
    }
    [(BKUIPearlPillView *)self startArc];
    double v15 = v14;
    [(BKUIPearlPillView *)self targetArc];
    double v17 = v16;
    [(BKUIPearlPillView *)self startArc];
    [(BKUIPearlPillView *)self setArc:v15 + (v17 - v18) * v13];
    [(BKUIPearlPillView *)self startHeight];
    double v20 = v19;
    [(BKUIPearlPillView *)self targetHeight];
    double v22 = v21;
    [(BKUIPearlPillView *)self startHeight];
    [(BKUIPearlPillView *)self setHeight:v20 + (v22 - v23) * v13];
    [(BKUIPearlPillView *)self startCornerRadius];
    double v25 = v24;
    [(BKUIPearlPillView *)self targetCornerRadius];
    double v27 = v26;
    [(BKUIPearlPillView *)self startCornerRadius];
    [(BKUIPearlPillView *)self setCornerRadius:v25 + (v27 - v28) * v13];
    if (v13 == 1.0)
    {
      v29 = [(BKUIPearlPillView *)self stateAnimationCompletion];

      if (v29)
      {
        v30 = [(BKUIPearlPillView *)self stateAnimationCompletion];
        [(BKUIPearlPillView *)self setStateAnimationCompletion:0];
        v30[2](v30, 1);
      }
    }
  }
  v31 = [(BKUIPearlPillView *)self radiusAnimationStart];

  if (v31)
  {
    v32 = [MEMORY[0x1E4F1C9C8] date];
    v33 = [(BKUIPearlPillView *)self radiusAnimationStart];
    [v32 timeIntervalSinceDate:v33];
    double v35 = v34;

    [(BKUIPearlPillView *)self radiusAnimationDuration];
    if (v36 <= 0.0
      || ([(BKUIPearlPillView *)self radiusAnimationDuration],
          double v38 = v35 / v37,
          v35 / v37 >= 1.0))
    {
      [(BKUIPearlPillView *)self setRadiusAnimationStart:0];
      double v38 = 1.0;
    }
    [(BKUIPearlPillView *)self startRadius];
    double v40 = v39;
    [(BKUIPearlPillView *)self targetRadius];
    double v42 = v41;
    [(BKUIPearlPillView *)self startRadius];
    [(BKUIPearlPillView *)self setRadius:v40 + (v42 - v43) * v38];
    if (v38 == 1.0)
    {
      v44 = [(BKUIPearlPillView *)self radiusAnimationCompletion];

      if (v44)
      {
        v45 = [(BKUIPearlPillView *)self radiusAnimationCompletion];
        [(BKUIPearlPillView *)self setRadiusAnimationCompletion:0];
        v45[2](v45);
      }
    }
  }
  if (v4)
  {
    v46 = [(BKUIPearlPillView *)self pillPath];
    id v47 = [(BKUIPearlPillView *)self shapeLayer];
    [v47 setPath:v46];
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)BKUIPearlPillView;
  [(BKUIPearlPillView *)&v14 layoutSubviews];
  [(BKUIPearlPillView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(BKUIPearlPillView *)self shapeLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  double v12 = [(BKUIPearlPillView *)self pillPath];
  double v13 = [(BKUIPearlPillView *)self shapeLayer];
  [v13 setPath:v12];
}

- (CGPath)pillPath
{
  [(BKUIPearlPillView *)self arc];
  double v4 = v3 * 0.5 + 1.57079633;
  [(BKUIPearlPillView *)self arc];
  double v6 = 1.57079633 - v5 * 0.5;
  [(BKUIPearlPillView *)self center];
  double v8 = v7;
  double v10 = v9;
  [(BKUIPearlPillView *)self height];
  double v12 = v11;
  [(BKUIPearlPillView *)self cornerRadius];
  *(float *)&double v13 = v12 + v13 * -2.0;
  double v14 = fmaxf(*(float *)&v13, 0.0);
  double v15 = objc_opt_new();
  [(BKUIPearlPillView *)self arc];
  double v17 = v16;
  [(BKUIPearlPillView *)self radius];
  if (v17 <= 0.0) {
    objc_msgSend(v15, "moveToPoint:", v8, v10 + v18);
  }
  else {
    objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v8, v10, v18, v4, v6);
  }
  [(BKUIPearlPillView *)self cornerRadius];
  objc_msgSend(v15, "bkui_bezierPathAddRoundedCorner:withRadius:followingAngle:", 2);
  [v15 currentPoint];
  double v20 = v19;
  __double2 v21 = __sincos_stret(v6);
  double sinval = v21.__sinval;
  double cosval = v21.__cosval;
  [v15 currentPoint];
  objc_msgSend(v15, "addLineToPoint:", v20 + v14 * v21.__cosval, v24 + v14 * v21.__sinval);
  [(BKUIPearlPillView *)self cornerRadius];
  objc_msgSend(v15, "bkui_bezierPathAddRoundedCorner:withRadius:followingAngle:", 8);
  [(BKUIPearlPillView *)self arc];
  if (v25 > 0.0)
  {
    [(BKUIPearlPillView *)self radius];
    double v27 = v26;
    [(BKUIPearlPillView *)self height];
    objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v8, v10, v27 + v28, v6, v4);
    __double2 v29 = __sincos_stret(v4);
    double sinval = v29.__sinval;
    double cosval = v29.__cosval;
  }
  [(BKUIPearlPillView *)self cornerRadius];
  objc_msgSend(v15, "bkui_bezierPathAddRoundedCorner:withRadius:followingAngle:", 4);
  [v15 currentPoint];
  double v31 = v30 - v14 * cosval;
  [v15 currentPoint];
  objc_msgSend(v15, "addLineToPoint:", v31, v32 - v14 * sinval);
  [(BKUIPearlPillView *)self cornerRadius];
  objc_msgSend(v15, "bkui_bezierPathAddRoundedCorner:withRadius:followingAngle:", 1);
  [v15 closePath];
  id v33 = v15;
  double v34 = (CGPath *)[v33 CGPath];

  return v34;
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5 failure:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  self->_state = a3;
  [(BKUIPearlPillView *)self height];
  double v13 = v12;
  [(BKUIPearlPillView *)self arc];
  double v15 = v14;
  [(BKUIPearlPillView *)self cornerRadius];
  double v17 = v16;
  if (a3 == 5 || a3 == 3)
  {
    double v18 = [MEMORY[0x1E4F428B8] systemGreenColor];
  }
  else
  {
    double v18 = [MEMORY[0x1E4F428B8] lightGrayColor];
  }
  double v19 = v18;
  uint64_t v20 = [v18 CGColor];
  __double2 v21 = [(BKUIPearlPillView *)self shapeLayer];
  [v21 setFillColor:v20];

  if (v7) {
    double v22 = 0.3;
  }
  else {
    double v22 = 0.0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke;
  aBlock[3] = &unk_1E6EA2450;
  id v23 = v10;
  id v48 = v23;
  id v24 = v11;
  id v49 = v24;
  double v25 = _Block_copy(aBlock);
  switch(a3)
  {
    case 1uLL:
    case 3uLL:
      [(BKUIPearlPillView *)self pillCompletedHeight];
      goto LABEL_12;
    case 2uLL:
      [(BKUIPearlPillView *)self pillInitialHeight];
LABEL_12:
      double v13 = v26;
      [(BKUIPearlPillView *)self pillCornerRadius];
      double v17 = v29;
      double v15 = 0;
      break;
    case 4uLL:
    case 5uLL:
      [(BKUIPearlPillView *)self ringHeight];
      double v13 = v27;
      [(BKUIPearlPillView *)self ringArcLength];
      double v15 = v28;
      double v17 = 0;
      break;
    default:
      break;
  }
  [(BKUIPearlPillView *)self setTargetHeight:*(double *)&v13];
  [(BKUIPearlPillView *)self setTargetArc:*(double *)&v15];
  [(BKUIPearlPillView *)self setTargetCornerRadius:*(double *)&v17];
  [(BKUIPearlPillView *)self targetHeight];
  double v31 = v30;
  [(BKUIPearlPillView *)self height];
  if (v31 == v32
    || ([(BKUIPearlPillView *)self targetArc], double v34 = v33, [(BKUIPearlPillView *)self arc], v34 == v35)
    || !v7)
  {
    double v40 = _Block_copy(v25);
  }
  else
  {
    [(BKUIPearlPillView *)self targetHeight];
    double v37 = v36;
    [(BKUIPearlPillView *)self height];
    BOOL v39 = v37 > v38;
    double v22 = v22 * 0.5;
    if (v37 <= v38)
    {
      [(BKUIPearlPillView *)self arc];
      -[BKUIPearlPillView setTargetArc:](self, "setTargetArc:");
      [(BKUIPearlPillView *)self cornerRadius];
      -[BKUIPearlPillView setTargetCornerRadius:](self, "setTargetCornerRadius:");
    }
    else
    {
      [(BKUIPearlPillView *)self height];
      -[BKUIPearlPillView setTargetHeight:](self, "setTargetHeight:");
    }
    objc_initWeak(&location, self);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke_2;
    v41[3] = &unk_1E6EA24A0;
    objc_copyWeak(v44, &location);
    id v42 = v24;
    BOOL v45 = v39;
    v44[1] = v13;
    v44[2] = v15;
    v44[3] = v17;
    v44[4] = *(id *)&v22;
    id v43 = v25;
    double v40 = _Block_copy(v41);

    objc_destroyWeak(v44);
    objc_destroyWeak(&location);
  }
  [(BKUIPearlPillView *)self startAnimationWithDuration:v40 completion:v22];
}

uint64_t __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v5 = WeakRetained;
  if (WeakRetained
    && a2
    && ([WeakRetained stateAnimationStart],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    if (*(unsigned char *)(a1 + 88))
    {
      [v5 setTargetHeight:*(double *)(a1 + 56)];
    }
    else
    {
      [v5 setTargetArc:*(double *)(a1 + 64)];
      [v5 setTargetCornerRadius:*(double *)(a1 + 72)];
    }
    double v8 = *(double *)(a1 + 80);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke_3;
    v9[3] = &unk_1E6EA2478;
    id v10 = *(id *)(a1 + 40);
    [v5 startAnimationWithDuration:v9 completion:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

uint64_t __58__BKUIPearlPillView_setState_animated_completion_failure___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4 animationDelay:(double)a5 completion:(id)a6 failure:(id)a7
{
  BOOL v9 = a4;
  double v12 = (void (**)(void))a6;
  double v13 = (void (**)(void))a7;
  if ([(BKUIPearlPillView *)self state] == a3)
  {
    if (v12) {
      v12[2](v12);
    }
  }
  else
  {
    unint64_t v14 = [(BKUIPearlPillView *)self state];
    if (a5 <= 0.0)
    {
      [(BKUIPearlPillView *)self setState:a3 animated:v9 completion:v12 failure:v13];
    }
    else
    {
      unint64_t v15 = v14;
      double v16 = [(BKUIPearlPillView *)self stateDelayTimer];

      if (v16)
      {
        if (v13) {
          v13[2](v13);
        }
      }
      else
      {
        double v17 = (void *)MEMORY[0x1E4F1CB00];
        uint64_t v21 = MEMORY[0x1E4F143A8];
        uint64_t v22 = 3221225472;
        id v23 = __73__BKUIPearlPillView_setState_animated_animationDelay_completion_failure___block_invoke;
        id v24 = &unk_1E6EA24C8;
        double v25 = self;
        unint64_t v28 = v15;
        unint64_t v29 = a3;
        BOOL v30 = v9;
        double v26 = v12;
        double v27 = v13;
        double v18 = [v17 timerWithTimeInterval:0 repeats:&v21 block:a5];
        -[BKUIPearlPillView setStateDelayTimer:](self, "setStateDelayTimer:", v18, v21, v22, v23, v24, v25);

        double v19 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        uint64_t v20 = [(BKUIPearlPillView *)self stateDelayTimer];
        [v19 addTimer:v20 forMode:*MEMORY[0x1E4F1C4B0]];
      }
    }
  }
}

uint64_t __73__BKUIPearlPillView_setState_animated_animationDelay_completion_failure___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setStateDelayTimer:0];
  if ([*(id *)(a1 + 32) state] == *(void *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 64);
    uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
    double v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v4 setState:v2 animated:v3 completion:v5 failure:v6];
  }
  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      double v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

- (void)setRadius:(double)a3 animationDuration:(double)a4 completion:(id)a5
{
  id v10 = (void (**)(void))a5;
  [(BKUIPearlPillView *)self radius];
  -[BKUIPearlPillView setStartRadius:](self, "setStartRadius:");
  [(BKUIPearlPillView *)self setTargetRadius:a3];
  if (a4 == 0.0)
  {
    [(BKUIPearlPillView *)self setRadiusAnimationDuration:0.0];
    double v8 = [MEMORY[0x1E4F1C9C8] date];
    [(BKUIPearlPillView *)self setRadiusAnimationStart:v8];

    [(BKUIPearlPillView *)self displayTick];
    if (v10) {
      v10[2]();
    }
  }
  else
  {
    [(BKUIPearlPillView *)self setRadiusAnimationCompletion:v10];
    [(BKUIPearlPillView *)self setRadiusAnimationDuration:a4];
    BOOL v9 = [MEMORY[0x1E4F1C9C8] date];
    [(BKUIPearlPillView *)self setRadiusAnimationStart:v9];
  }
}

- (void)startAnimationWithDuration:(double)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(BKUIPearlPillView *)self stateAnimationCompletion];

  if (v7)
  {
    double v8 = [(BKUIPearlPillView *)self stateAnimationCompletion];
    v8[2](v8, 0);

    [(BKUIPearlPillView *)self setStateAnimationCompletion:0];
  }
  [(BKUIPearlPillView *)self height];
  -[BKUIPearlPillView setStartHeight:](self, "setStartHeight:");
  [(BKUIPearlPillView *)self arc];
  -[BKUIPearlPillView setStartArc:](self, "setStartArc:");
  [(BKUIPearlPillView *)self cornerRadius];
  -[BKUIPearlPillView setStartCornerRadius:](self, "setStartCornerRadius:");
  [(BKUIPearlPillView *)self setStateAnimationDuration:a3];
  [(BKUIPearlPillView *)self setStateAnimationCompletion:v6];

  id v9 = [MEMORY[0x1E4F1C9C8] date];
  [(BKUIPearlPillView *)self setStateAnimationStart:v9];
}

- (double)ringArcLength
{
  [(BKUIPearlPillView *)self numberOfPills];
  double v3 = 6.28318531 / v2;
  double v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 scale];
  double v6 = v3 + 0.5 / v5;

  return v6;
}

- (void)setState:(unint64_t)a3
{
}

- (BOOL)isCompleted
{
  return [(BKUIPearlPillView *)self state] == 3;
}

- (double)pillInitialHeight
{
  return 13.0;
}

- (double)pillMaxLength
{
  double v2 = objc_opt_class();

  [v2 pillMaxLength];
  return result;
}

- (void)tearDownPillView
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BKUIPearlPillView;
  [(BKUIPearlPillView *)&v2 dealloc];
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (double)ringHeight
{
  return self->_ringHeight;
}

- (void)setRingHeight:(double)a3
{
  self->_ringHeight = a3;
}

- (double)numberOfPills
{
  return self->_numberOfPills;
}

- (void)setNumberOfPills:(double)a3
{
  self->_numberOfPills = a3;
}

- (void)setPillInitialHeight:(double)a3
{
  self->_pillInitialHeight = a3;
}

- (double)pillCompletedHeight
{
  return self->_pillCompletedHeight;
}

- (void)setPillCompletedHeight:(double)a3
{
  self->_pillCompletedHeight = a3;
}

- (double)pillCornerRadius
{
  return self->_pillCornerRadius;
}

- (void)setPillCornerRadius:(double)a3
{
  self->_pillCornerRadius = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setShapeLayer:(id)a3
{
}

- (NSTimer)stateDelayTimer
{
  return self->_stateDelayTimer;
}

- (void)setStateDelayTimer:(id)a3
{
}

- (NSDate)stateAnimationStart
{
  return self->_stateAnimationStart;
}

- (void)setStateAnimationStart:(id)a3
{
}

- (double)stateAnimationDuration
{
  return self->_stateAnimationDuration;
}

- (void)setStateAnimationDuration:(double)a3
{
  self->_stateAnimationDuration = a3;
}

- (id)stateAnimationCompletion
{
  return self->_stateAnimationCompletion;
}

- (void)setStateAnimationCompletion:(id)a3
{
}

- (double)arc
{
  return self->_arc;
}

- (void)setArc:(double)a3
{
  self->_arc = a3;
}

- (double)startArc
{
  return self->_startArc;
}

- (void)setStartArc:(double)a3
{
  self->_startArc = a3;
}

- (double)targetArc
{
  return self->_targetArc;
}

- (void)setTargetArc:(double)a3
{
  self->_targetArc = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (double)startHeight
{
  return self->_startHeight;
}

- (void)setStartHeight:(double)a3
{
  self->_startHeight = a3;
}

- (double)targetHeight
{
  return self->_targetHeight;
}

- (void)setTargetHeight:(double)a3
{
  self->_targetHeight = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)startCornerRadius
{
  return self->_startCornerRadius;
}

- (void)setStartCornerRadius:(double)a3
{
  self->_startCornerRadius = a3;
}

- (double)targetCornerRadius
{
  return self->_targetCornerRadius;
}

- (void)setTargetCornerRadius:(double)a3
{
  self->_targetCornerRadius = a3;
}

- (NSDate)radiusAnimationStart
{
  return self->_radiusAnimationStart;
}

- (void)setRadiusAnimationStart:(id)a3
{
}

- (double)radiusAnimationDuration
{
  return self->_radiusAnimationDuration;
}

- (void)setRadiusAnimationDuration:(double)a3
{
  self->_radiusAnimationDuration = a3;
}

- (id)radiusAnimationCompletion
{
  return self->_radiusAnimationCompletion;
}

- (void)setRadiusAnimationCompletion:(id)a3
{
}

- (double)startRadius
{
  return self->_startRadius;
}

- (void)setStartRadius:(double)a3
{
  self->_startRadius = a3;
}

- (double)targetRadius
{
  return self->_targetRadius;
}

- (void)setTargetRadius:(double)a3
{
  self->_targetRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_radiusAnimationCompletion, 0);
  objc_storeStrong((id *)&self->_radiusAnimationStart, 0);
  objc_storeStrong(&self->_stateAnimationCompletion, 0);
  objc_storeStrong((id *)&self->_stateAnimationStart, 0);
  objc_storeStrong((id *)&self->_stateDelayTimer, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end