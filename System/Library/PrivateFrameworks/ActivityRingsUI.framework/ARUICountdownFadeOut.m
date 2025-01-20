@interface ARUICountdownFadeOut
+ (id)identifier;
- (BOOL)cancelable;
- (double)delay;
- (double)duration;
- (id)identifier;
- (id)timingFunction;
- (void)applyToCountdownView:(id)a3 completion:(id)a4;
@end

@implementation ARUICountdownFadeOut

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.2;
}

- (id)timingFunction
{
  LODWORD(v2) = 1051361018;
  LODWORD(v3) = 1.0;
  return (id)[MEMORY[0x263F15808] functionWithControlPoints:v2 :0.0 :0.0 :v3];
}

- (BOOL)cancelable
{
  return 0;
}

+ (id)identifier
{
  return @"Fade Out";
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
  v8 = [v6 ringGroup];
  [v8 setPercentage:0 ofRingAtIndex:0.0];

  [(ARUICountdownFadeOut *)self duration];
  double v10 = v9 + v9;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__ARUICountdownFadeOut_applyToCountdownView_completion___block_invoke;
  v17[3] = &unk_264498A30;
  id v18 = v6;
  id v11 = v6;
  +[ARUIRingGroup animateWithDuration:v17 animations:v10];
  [(ARUICountdownFadeOut *)self duration];
  dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__ARUICountdownFadeOut_applyToCountdownView_completion___block_invoke_2;
  v15[3] = &unk_264498A58;
  id v16 = v7;
  id v14 = v7;
  dispatch_after(v13, MEMORY[0x263EF83A0], v15);
}

void __56__ARUICountdownFadeOut_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) ringGroup];
  [v1 setTrackOpacity:0.0];
}

uint64_t __56__ARUICountdownFadeOut_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end