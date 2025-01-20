@interface ARUICountdownCancel
+ (id)identifier;
- (BOOL)cancelable;
- (double)delay;
- (double)duration;
- (id)identifier;
- (id)timingFunction;
- (void)applyToCountdownView:(id)a3 completion:(id)a4;
@end

@implementation ARUICountdownCancel

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.25;
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
  return @"Cancel";
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
  [(ARUICountdownCancel *)self duration];
  double v9 = v8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke;
  v18[3] = &unk_264498A30;
  id v19 = v6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_2;
  v16[3] = &unk_264498A30;
  id v17 = v19;
  id v10 = v19;
  +[ARUIRingGroup animateWithDuration:v18 animations:v16 completion:v9];
  [(ARUICountdownCancel *)self duration];
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_4;
  block[3] = &unk_264498A58;
  id v15 = v7;
  id v13 = v7;
  dispatch_after(v12, MEMORY[0x263EF83A0], block);
}

void __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) ringGroup];
  [v1 setPercentage:0 ofRingAtIndex:0.0];
}

void __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 3221225472;
  v1[2] = __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_3;
  v1[3] = &unk_264498A30;
  id v2 = *(id *)(a1 + 32);
  +[ARUIRingGroup animateWithDuration:v1 animations:0.2];
}

void __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) ringGroup];
  [v1 setTrackOpacity:0.0];
}

uint64_t __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end