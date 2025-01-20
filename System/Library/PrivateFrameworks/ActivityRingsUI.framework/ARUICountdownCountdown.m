@interface ARUICountdownCountdown
+ (id)identifier;
- (ARUICountdownCountdown)initWithPercent:(double)a3 andStep:(unint64_t)a4 cancelable:(BOOL)a5;
- (BOOL)cancelable;
- (double)delay;
- (double)duration;
- (double)percent;
- (id)description;
- (id)identifier;
- (id)timingFunction;
- (unint64_t)countdownStep;
- (void)applyToCountdownView:(id)a3 completion:(id)a4;
- (void)setPercent:(double)a3;
@end

@implementation ARUICountdownCountdown

- (ARUICountdownCountdown)initWithPercent:(double)a3 andStep:(unint64_t)a4 cancelable:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ARUICountdownCountdown;
  result = [(ARUICountdownCountdown *)&v9 init];
  if (result)
  {
    result->_percent = a3;
    result->_step = a4;
    result->_cancelable = a5;
  }
  return result;
}

- (double)delay
{
  return 0.3;
}

- (double)duration
{
  return 0.7;
}

- (id)timingFunction
{
  LODWORD(v2) = 1051361018;
  LODWORD(v3) = 1.0;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :0.0 :0.0 :v3];
}

- (BOOL)cancelable
{
  return self->_cancelable;
}

+ (id)identifier
{
  return @"Countdown";
}

- (id)identifier
{
  double v2 = objc_opt_class();

  return (id)[v2 identifier];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ARUICountdownCountdown;
  double v3 = [(ARUICountdownDefaultAnimation *)&v7 description];
  v4 = objc_msgSend(v3, "substringWithRange:", 0, objc_msgSend(v3, "length") - 1);
  v5 = [NSString stringWithFormat:@"%@, %lu>", v4, self->_step];

  return v5;
}

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 ringGroup];
  [v8 setZRotation:0.0];

  objc_super v9 = [v6 ringGroup];
  LODWORD(v10) = 1051931443;
  [v9 setEmptyOpacity:v10];

  [(ARUICountdownCountdown *)self duration];
  double v12 = v11;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__ARUICountdownCountdown_applyToCountdownView_completion___block_invoke;
  v19[3] = &unk_264498F28;
  id v20 = v6;
  v21 = self;
  id v13 = v6;
  +[ARUIRingGroup animateWithDuration:v19 animations:3 curve:0 completion:v12];
  [(ARUICountdownCountdown *)self duration];
  dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ARUICountdownCountdown_applyToCountdownView_completion___block_invoke_2;
  block[3] = &unk_264498A58;
  id v18 = v7;
  id v16 = v7;
  dispatch_after(v15, MEMORY[0x263EF83A0], block);
}

void __58__ARUICountdownCountdown_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ringGroup];
  [*(id *)(a1 + 40) percent];
  *(float *)&double v2 = v2;
  [v3 setPercentage:0 ofRingAtIndex:v2];
}

uint64_t __58__ARUICountdownCountdown_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)countdownStep
{
  return self->_step;
}

- (double)percent
{
  return self->_percent;
}

- (void)setPercent:(double)a3
{
  self->_percent = a3;
}

@end