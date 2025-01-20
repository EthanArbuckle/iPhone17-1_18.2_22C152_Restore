@interface AFUIUtilities
+ (BOOL)shouldShowSiriXIndicator;
+ (id)parsedUtteranceFromText:(id)a3 context:(id)a4;
+ (void)animateUsingSpringWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 animations:(id)a6 completion:(id)a7;
+ (void)animateUsingSpringWithStiffness:(double)a3 damping:(double)a4 animations:(id)a5;
@end

@implementation AFUIUtilities

+ (void)animateUsingSpringWithStiffness:(double)a3 damping:(double)a4 animations:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x263F82E00];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__AFUIUtilities_animateUsingSpringWithStiffness_damping_animations___block_invoke;
  v10[3] = &unk_264692780;
  double v12 = a3;
  double v13 = a4;
  id v11 = v7;
  id v9 = v7;
  [v8 _performWithoutRetargetingAnimations:v10];
}

uint64_t __68__AFUIUtilities_animateUsingSpringWithStiffness_damping_animations___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82E00];
  double v3 = DurationForMassStiffnessDamping(1.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);

  return [v2 _animateUsingSpringWithDuration:0 delay:v6 options:0 mass:v3 stiffness:0.0 damping:1.0 initialVelocity:v4 animations:v5 completion:0.0];
}

+ (void)animateUsingSpringWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 animations:(id)a6 completion:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  double v13 = (void *)MEMORY[0x263F82E00];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__AFUIUtilities_animateUsingSpringWithMass_stiffness_damping_animations_completion___block_invoke;
  v16[3] = &unk_2646927A8;
  double v19 = a3;
  double v20 = a4;
  double v21 = a5;
  id v17 = v11;
  id v18 = v12;
  id v14 = v12;
  id v15 = v11;
  [v13 _performWithoutRetargetingAnimations:v16];
}

uint64_t __84__AFUIUtilities_animateUsingSpringWithMass_stiffness_damping_animations_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82E00];
  double v3 = DurationForMassStiffnessDamping(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);

  return [v2 _animateUsingSpringWithDuration:0 delay:v6 options:v7 mass:v3 stiffness:0.0 damping:1.0 initialVelocity:v4 animations:v5 completion:0.0];
}

+ (id)parsedUtteranceFromText:(id)a3 context:(id)a4
{
  double v5 = (void *)MEMORY[0x263F75508];
  uint64_t v6 = (void *)MEMORY[0x263F753C8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 sharedInstance];
  v10 = [v5 parsedUtteranceFromText:v8 context:v7 spekableObjectProviding:v9];

  return v10;
}

+ (BOOL)shouldShowSiriXIndicator
{
  int v2 = AFIsInternalInstall();
  if (v2)
  {
    double v3 = [MEMORY[0x263F285A0] sharedPreferences];
    char v4 = [v3 siriXDebugStatusEnabled];

    LOBYTE(v2) = v4;
  }
  return v2;
}

@end