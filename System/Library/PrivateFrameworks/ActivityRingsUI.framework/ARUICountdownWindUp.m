@interface ARUICountdownWindUp
+ (id)identifier;
- (BOOL)cancelable;
- (double)delay;
- (double)duration;
- (id)identifier;
- (void)applyToCountdownView:(id)a3 completion:(id)a4;
@end

@implementation ARUICountdownWindUp

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.67;
}

- (BOOL)cancelable
{
  return 1;
}

+ (id)identifier
{
  return @"Wind Up";
}

- (id)identifier
{
  v2 = objc_opt_class();

  return (id)[v2 identifier];
}

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ARUICountdownWindUp *)self duration];
  double v9 = v8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __55__ARUICountdownWindUp_applyToCountdownView_completion___block_invoke;
  v18[3] = &unk_264498A30;
  id v10 = v6;
  id v19 = v10;
  +[ARUIRingGroup animateWithDuration:v18 animations:3 curve:0 completion:v9];
  [(ARUICountdownWindUp *)self duration];
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ARUICountdownWindUp_applyToCountdownView_completion___block_invoke_2;
  block[3] = &unk_264498F98;
  id v16 = v10;
  id v17 = v7;
  id v13 = v10;
  id v14 = v7;
  dispatch_after(v12, MEMORY[0x263EF83A0], block);
}

void __55__ARUICountdownWindUp_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) ringGroup];
  LODWORD(v3) = 1.0;
  [v2 setPercentage:0 ofRingAtIndex:v3];

  id v5 = [*(id *)(a1 + 32) backingTrackRingGroup];
  v4 = [*(id *)(a1 + 32) ringGroup];
  [v4 thickness];
  objc_msgSend(v5, "setThickness:");
}

void __55__ARUICountdownWindUp_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 32) backingTrackRingGroup];
  [v3 setOpacity:0.0];
}

@end