@interface DBFromStackedAppAnimation
+ (id)animationWithSettings:(id)a3;
- (void)startAnimationWithCompletion:(id)a3;
@end

@implementation DBFromStackedAppAnimation

+ (id)animationWithSettings:(id)a3
{
  v3 = (void (**)(id, DBFromStackedAppAnimationSettings *))a3;
  v4 = objc_alloc_init(DBFromStackedAppAnimationSettings);
  v3[2](v3, v4);

  v5 = [(DBDashboardAnimation *)[DBFromStackedAppAnimation alloc] initWithSettings:v4];
  return v5;
}

- (void)startAnimationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(DBDashboardAnimation *)self appDockViewController];
  v6 = [(DBDashboardAnimation *)self toIdentifier];
  v7 = [(DBDashboardAnimation *)self fromTransitionContainerView];
  v8 = [(DBDashboardAnimation *)self fromView];
  v9 = [(DBDashboardAnimation *)self rootContainerView];
  v10 = [(DBDashboardAnimation *)self rootContainerBackgroundColor];
  [v7 addSubview:v8];
  [v5 setActiveBundleIdentifier:v6 animated:1];
  v11 = (void *)MEMORY[0x263F82E00];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__DBFromStackedAppAnimation_startAnimationWithCompletion___block_invoke;
  v18[3] = &unk_2649B3ED8;
  id v19 = v9;
  id v20 = v10;
  id v21 = v7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__DBFromStackedAppAnimation_startAnimationWithCompletion___block_invoke_2;
  v16[3] = &unk_2649B3F00;
  id v17 = v4;
  id v12 = v4;
  id v13 = v7;
  id v14 = v10;
  id v15 = v9;
  [v11 animateWithDuration:v18 animations:v16 completion:0.5];
}

uint64_t __58__DBFromStackedAppAnimation_startAnimationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);
  return [v2 setAlpha:0.0];
}

uint64_t __58__DBFromStackedAppAnimation_startAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end