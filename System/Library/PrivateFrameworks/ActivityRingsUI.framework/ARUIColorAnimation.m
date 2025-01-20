@interface ARUIColorAnimation
+ (id)animationWithDuration:(double)a3 startTopColor:(id)a4 endTopColor:(id)a5 startBottomColor:(id)a6 endBottomColor:(id)a7 timingFunction:(id)a8 applier:(id)a9;
- (ARUIColorAnimation)initWithDuration:(double)a3 startTopColor:(id)a4 endTopColor:(id)a5 startBottomColor:(id)a6 endBottomColor:(id)a7 timingFunction:(id)a8 applier:(id)a9;
- (ARUIRingGroupAnimationDelegate)delegate;
- (BOOL)isAnimating;
- (CAMediaTimingFunction)timingFunction;
- (UIColor)currentBottomColor;
- (UIColor)currentTopColor;
- (UIColor)endBottomColor;
- (UIColor)endTopColor;
- (UIColor)startBottomColor;
- (UIColor)startTopColor;
- (double)duration;
- (void)completeAnimation;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)update:(double)a3;
@end

@implementation ARUIColorAnimation

+ (id)animationWithDuration:(double)a3 startTopColor:(id)a4 endTopColor:(id)a5 startBottomColor:(id)a6 endBottomColor:(id)a7 timingFunction:(id)a8 applier:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  v21 = [[ARUIColorAnimation alloc] initWithDuration:v20 startTopColor:v19 endTopColor:v18 startBottomColor:v17 endBottomColor:v16 timingFunction:v15 applier:a3];

  return v21;
}

- (ARUIColorAnimation)initWithDuration:(double)a3 startTopColor:(id)a4 endTopColor:(id)a5 startBottomColor:(id)a6 endBottomColor:(id)a7 timingFunction:(id)a8 applier:(id)a9
{
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)ARUIColorAnimation;
  id v20 = [(ARUIColorAnimation *)&v28 init];
  v21 = v20;
  if (v20)
  {
    v20->_completed = 0;
    v20->_duration = a3;
    v20->_percent = 0.0;
    objc_storeStrong((id *)&v20->_startTopColor, a4);
    objc_storeStrong((id *)&v21->_currentTopColor, a4);
    objc_storeStrong((id *)&v21->_endTopColor, a5);
    objc_storeStrong((id *)&v21->_startBottomColor, a6);
    objc_storeStrong((id *)&v21->_currentBottomColor, a6);
    objc_storeStrong((id *)&v21->_endBottomColor, a7);
    objc_storeStrong((id *)&v21->_timingFunction, a8);
    uint64_t v22 = MEMORY[0x223C21650](v19);
    id applier = v21->_applier;
    v21->_id applier = (id)v22;
  }
  return v21;
}

- (void)dealloc
{
  if (!self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should call -[ARUIColorAnimation completeAnimation] before deallocating"];
  }
  v3.receiver = self;
  v3.super_class = (Class)ARUIColorAnimation;
  [(ARUIColorAnimation *)&v3 dealloc];
}

- (void)update:(double)a3
{
  if (self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should not call update on a ARUIColorAnimation that has already completed"];
  }
  float v5 = self->_percent + a3 / self->_duration;
  self->_percent = ARUISaturate(v5);
  -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:");
  float v7 = v6;
  Components = CGColorGetComponents([(UIColor *)self->_startTopColor CGColor]);
  v9 = CGColorGetComponents([(UIColor *)self->_endTopColor CGColor]);
  id v10 = objc_alloc(MEMORY[0x263F825C8]);
  float v11 = *Components;
  float v12 = *v9;
  double v13 = ARUIMix(v11, v12, v7);
  float v14 = Components[1];
  float v15 = v9[1];
  double v16 = ARUIMix(v14, v15, v7);
  float v17 = Components[2];
  float v18 = v9[2];
  double v19 = ARUIMix(v17, v18, v7);
  float v20 = Components[3];
  float v21 = v9[3];
  uint64_t v22 = (UIColor *)objc_msgSend(v10, "initWithRed:green:blue:alpha:", v13, v16, v19, ARUIMix(v20, v21, v7));
  currentTopColor = self->_currentTopColor;
  self->_currentTopColor = v22;

  v24 = CGColorGetComponents([(UIColor *)self->_startBottomColor CGColor]);
  id v25 = CGColorGetComponents([(UIColor *)self->_endBottomColor CGColor]);
  id v26 = objc_alloc(MEMORY[0x263F825C8]);
  float v27 = *v24;
  float v28 = *v25;
  double v29 = ARUIMix(v27, v28, v7);
  float v30 = v24[1];
  float v31 = v25[1];
  double v32 = ARUIMix(v30, v31, v7);
  float v33 = v24[2];
  float v34 = v25[2];
  double v35 = ARUIMix(v33, v34, v7);
  float v36 = v24[3];
  float v37 = v25[3];
  v38 = (UIColor *)objc_msgSend(v26, "initWithRed:green:blue:alpha:", v29, v32, v35, ARUIMix(v36, v37, v7));
  currentBottomColor = self->_currentBottomColor;
  self->_currentBottomColor = v38;

  v40 = (void (*)(__n128))*((void *)self->_applier + 2);
  v41.n128_f64[0] = a3;

  v40(v41);
}

- (BOOL)isAnimating
{
  if ([(UIColor *)self->_currentTopColor isEqual:self->_endTopColor]) {
    return [(UIColor *)self->_currentBottomColor isEqual:self->_endBottomColor] ^ 1;
  }
  else {
    return 1;
  }
}

- (void)completeAnimation
{
  if (self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should not call completeAnimation on a ARUIColorAnimation that has already completed"];
  }
  (*((void (**)(double))self->_applier + 2))(0.0);
  self->_completed = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained animationDidComplete:self];
}

- (ARUIRingGroupAnimationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ARUIRingGroupAnimationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (UIColor)startTopColor
{
  return self->_startTopColor;
}

- (UIColor)currentTopColor
{
  return self->_currentTopColor;
}

- (UIColor)endTopColor
{
  return self->_endTopColor;
}

- (UIColor)startBottomColor
{
  return self->_startBottomColor;
}

- (UIColor)currentBottomColor
{
  return self->_currentBottomColor;
}

- (UIColor)endBottomColor
{
  return self->_endBottomColor;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong((id *)&self->_endBottomColor, 0);
  objc_storeStrong((id *)&self->_currentBottomColor, 0);
  objc_storeStrong((id *)&self->_startBottomColor, 0);
  objc_storeStrong((id *)&self->_endTopColor, 0);
  objc_storeStrong((id *)&self->_currentTopColor, 0);
  objc_storeStrong((id *)&self->_startTopColor, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_applier, 0);
}

@end