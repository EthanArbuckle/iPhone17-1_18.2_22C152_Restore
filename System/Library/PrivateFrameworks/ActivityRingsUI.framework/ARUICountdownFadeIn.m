@interface ARUICountdownFadeIn
+ (id)identifier;
- (BOOL)cancelable;
- (double)delay;
- (double)duration;
- (id)identifier;
- (id)timingFunction;
- (void)applyToCountdownView:(id)a3 completion:(id)a4;
@end

@implementation ARUICountdownFadeIn

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.1;
}

- (id)timingFunction
{
  LODWORD(v2) = 1051361018;
  LODWORD(v3) = 1.0;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :0.0 :0.0 :v3];
}

- (BOOL)cancelable
{
  return 1;
}

+ (id)identifier
{
  return @"Fade In";
}

- (id)identifier
{
  double v2 = objc_opt_class();

  return (id)[v2 identifier];
}

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ARUICountdownFadeIn *)self duration];
  double v9 = v8;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__ARUICountdownFadeIn_applyToCountdownView_completion___block_invoke;
  v16[3] = &unk_264498A30;
  id v17 = v6;
  id v10 = v6;
  +[ARUIRingGroup animateWithDuration:v16 animations:0 curve:0 completion:v9];
  [(ARUICountdownFadeIn *)self duration];
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__ARUICountdownFadeIn_applyToCountdownView_completion___block_invoke_2;
  v14[3] = &unk_264498A58;
  id v15 = v7;
  id v13 = v7;
  dispatch_after(v12, MEMORY[0x263EF83A0], v14);
}

void __55__ARUICountdownFadeIn_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ringGroup];
  LODWORD(v1) = 1.0;
  [v2 setTrackOpacity:v1];
}

uint64_t __55__ARUICountdownFadeIn_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end