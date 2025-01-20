@interface ARUICountdownDisappear
+ (id)identifier;
- (BOOL)cancelable;
- (double)delay;
- (double)duration;
- (id)identifier;
- (id)timingFunction;
- (void)applyToCountdownView:(id)a3 completion:(id)a4;
@end

@implementation ARUICountdownDisappear

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.2;
}

+ (id)identifier
{
  return @"Disappear";
}

- (id)identifier
{
  v2 = objc_opt_class();

  return (id)[v2 identifier];
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

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 ringGroup];
  [v8 groupDiameter];
  double v10 = v9;

  v11 = [v6 ringGroup];
  [v11 thickness];
  double v13 = v12;

  [(ARUICountdownDisappear *)self duration];
  double v15 = v14;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __58__ARUICountdownDisappear_applyToCountdownView_completion___block_invoke;
  v26[3] = &unk_264498D30;
  id v16 = v6;
  id v27 = v16;
  double v28 = v10 + v13 * -0.5;
  +[ARUIRingGroup animateWithDuration:v26 animations:v15];
  [(ARUICountdownDisappear *)self duration];
  dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__ARUICountdownDisappear_applyToCountdownView_completion___block_invoke_2;
  v21[3] = &unk_264498F00;
  double v24 = v10;
  double v25 = v13;
  id v22 = v16;
  id v23 = v7;
  id v19 = v7;
  id v20 = v16;
  dispatch_after(v18, MEMORY[0x263EF83A0], v21);
}

void __58__ARUICountdownDisappear_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) ringGroup];
  double v3 = *(double *)(a1 + 40);
  *(float *)&double v3 = v3;
  [v2 setGroupDiameter:v3];

  id v4 = [*(id *)(a1 + 32) ringGroup];
  [v4 setThickness:0.0];
}

uint64_t __58__ARUICountdownDisappear_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) ringGroup];
  [v2 setOpacity:0.0];

  double v3 = [*(id *)(a1 + 32) ringGroup];
  double v4 = *(double *)(a1 + 48);
  *(float *)&double v4 = v4;
  [v3 setGroupDiameter:v4];

  v5 = [*(id *)(a1 + 32) ringGroup];
  double v6 = *(double *)(a1 + 56);
  *(float *)&double v6 = v6;
  [v5 setThickness:v6];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

@end