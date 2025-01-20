@interface BSUIAnimationFactory
+ (double)globalSlowDownFactor;
+ (id)factoryWithAnimationAttributes:(id)a3;
+ (id)factoryWithDuration:(double)a3;
+ (id)factoryWithDuration:(double)a3 delay:(double)a4;
+ (id)factoryWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5;
+ (id)factoryWithDuration:(double)a3 timingFunction:(id)a4;
+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5;
+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6;
+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 initialVelocity:(double)a7;
+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 timingFunction:(id)a7;
+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 timingFunction:(id)a6;
+ (id)factoryWithSettings:(id)a3;
+ (id)factoryWithSettings:(id)a3 timingFunction:(id)a4;
+ (void)addAlongsideAnimations:(id)a3 completion:(id)a4;
+ (void)animateWithFactory:(id)a3 actions:(id)a4;
+ (void)animateWithFactory:(id)a3 actions:(id)a4 completion:(id)a5;
+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 actions:(id)a5;
+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 actions:(id)a5 completion:(id)a6;
+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 options:(unint64_t)a5 actions:(id)a6;
+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 options:(unint64_t)a5 actions:(id)a6 completion:(id)a7;
+ (void)animateWithFactory:(id)a3 options:(unint64_t)a4 actions:(id)a5;
+ (void)animateWithFactory:(id)a3 options:(unint64_t)a4 actions:(id)a5 completion:(id)a6;
+ (void)animateWithSettings:(id)a3 actions:(id)a4;
+ (void)animateWithSettings:(id)a3 actions:(id)a4 completion:(id)a5;
+ (void)animateWithSettings:(id)a3 options:(unint64_t)a4 actions:(id)a5;
+ (void)animateWithSettings:(id)a3 options:(unint64_t)a4 actions:(id)a5 completion:(id)a6;
- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4;
- (BOOL)allowsAdditiveAnimations;
- (BOOL)isEqual:(id)a3;
- (BSAnimationSettings)effectiveSettings;
- (BSAnimationSettings)settings;
- (BSUIAnimationFactory)factoryWithTimingFunction:(id)a3;
- (BSUIAnimationFactory)init;
- (NSString)description;
- (double)delay;
- (double)duration;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimation;
- (unint64_t)hash;
- (void)_initWithSettings:(void *)a1;
- (void)applySettingsToCAAnimation:(id)a3;
- (void)setAllowsAdditiveAnimations:(BOOL)a3;
@end

@implementation BSUIAnimationFactory

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return self->_allowsAdditiveAnimations;
}

- (id)_timingFunctionForAnimation
{
  return (id)[(BSAnimationSettings *)self->_settings timingFunction];
}

- (void).cxx_destruct
{
}

+ (void)animateWithFactory:(id)a3 options:(unint64_t)a4 actions:(id)a5 completion:(id)a6
{
}

- (void)setAllowsAdditiveAnimations:(BOOL)a3
{
  self->_allowsAdditiveAnimations = a3;
}

+ (void)animateWithFactory:(id)a3 options:(unint64_t)a4 actions:(id)a5
{
}

- (BSAnimationSettings)settings
{
  return self->_settings;
}

+ (void)animateWithSettings:(id)a3 actions:(id)a4
{
  id v7 = a4;
  v6 = [a1 factoryWithSettings:a3];
  [a1 animateWithFactory:v6 additionalDelay:0 options:v7 actions:0 completion:0.0];
}

+ (id)factoryWithSettings:(id)a3 timingFunction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = (void *)[v6 mutableCopy];
    [v8 setTimingFunction:v7];
    v9 = -[BSUIAnimationFactory _initWithSettings:](objc_alloc((Class)a1), v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)factoryWithDuration:(double)a3
{
  v4 = [MEMORY[0x1E4F4F680] settingsWithDuration:a3];
  v5 = [a1 factoryWithSettings:v4];

  return v5;
}

+ (id)factoryWithSettings:(id)a3
{
  id v4 = a3;
  if (v4) {
    v5 = -[BSUIAnimationFactory _initWithSettings:](objc_alloc((Class)a1), v4);
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)_initWithSettings:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BSUIAnimationFactory;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[2];
      a1[2] = v4;
    }
  }

  return a1;
}

+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 options:(unint64_t)a5 actions:(id)a6 completion:(id)a7
{
  v11 = (id *)a3;
  id v12 = a6;
  id v13 = a7;
  if (v11)
  {
    id v14 = v12;
    id v15 = v13;
    [v11[2] preferredFrameRateRange];
    float minimum = v38.minimum;
    float maximum = v38.maximum;
    float preferred = v38.preferred;
    if (CAFrameRateRangeIsEqualToRange(v38, *MEMORY[0x1E4F39AF0])
      || (v40.float minimum = 0.0,
          v40.float maximum = 0.0,
          v40.float preferred = 0.0,
          v39.float minimum = minimum,
          v39.float maximum = maximum,
          v39.float preferred = preferred,
          CAFrameRateRangeIsEqualToRange(v39, v40)))
    {
      v19 = 0;
    }
    else
    {
      int v21 = [v11[2] highFrameRateReason];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __79__BSUIAnimationFactory__animateWithAdditionalDelay_options_actions_completion___block_invoke;
      v32[3] = &unk_1E5ABD658;
      id v33 = v14;
      float v34 = minimum;
      float v35 = maximum;
      float v36 = preferred;
      int v37 = v21;
      v19 = (void *)MEMORY[0x1A623AF30](v32);
    }
    v22 = (void *)MEMORY[0x1E4F42FF0];
    [v11[2] duration];
    double v24 = v23;
    [v11[2] delay];
    double v26 = v25;
    [(id)objc_opt_class() globalSlowDownFactor];
    if (v19) {
      id v28 = v19;
    }
    else {
      id v28 = v14;
    }
    [v22 _animateWithDuration:a5 | 0x60000 delay:v11 options:v28 factory:v15 animations:v24 completion:(v26 + a4) * v27];
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F42FF0];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __86__BSUIAnimationFactory_animateWithFactory_additionalDelay_options_actions_completion___block_invoke;
    v29[3] = &unk_1E5ABD680;
    id v30 = v12;
    id v31 = v13;
    [v20 performWithoutAnimation:v29];
  }
}

- (void)applySettingsToCAAnimation:(id)a3
{
  id v17 = a3;
  if ([(BSAnimationSettings *)self->_settings isSpringAnimation])
  {
    [(BSAnimationSettings *)self->_settings mass];
    objc_msgSend(v17, "setMass:");
    [(BSAnimationSettings *)self->_settings stiffness];
    objc_msgSend(v17, "setStiffness:");
    [(BSAnimationSettings *)self->_settings damping];
    objc_msgSend(v17, "setDamping:");
    [(BSAnimationSettings *)self->_settings initialVelocity];
    objc_msgSend(v17, "setInitialVelocity:");
  }
  [(id)objc_opt_class() globalSlowDownFactor];
  double v5 = v4;
  [(BSAnimationSettings *)self->_settings speed];
  float v7 = v6;
  if (v6 != 1.0 || (BSFloatIsOne() & 1) == 0)
  {
    double v8 = v7 / v5;
    *(float *)&double v8 = v8;
    [v17 setSpeed:v8];
  }
  [(BSAnimationSettings *)self->_settings frameInterval];
  if (v9 != 0.0) {
    objc_msgSend(v17, "setFrameInterval:");
  }
  [(BSAnimationSettings *)self->_settings preferredFrameRateRange];
  float minimum = v19.minimum;
  float maximum = v19.maximum;
  float preferred = v19.preferred;
  if (!CAFrameRateRangeIsEqualToRange(v19, *MEMORY[0x1E4F39AF0]))
  {
    v21.float minimum = 0.0;
    v21.float maximum = 0.0;
    v21.float preferred = 0.0;
    v20.float minimum = minimum;
    v20.float maximum = maximum;
    v20.float preferred = preferred;
    if (!CAFrameRateRangeIsEqualToRange(v20, v21))
    {
      *(float *)&double v13 = minimum;
      *(float *)&double v14 = maximum;
      *(float *)&double v15 = preferred;
      objc_msgSend(v17, "setPreferredFrameRateRange:", v13, v14, v15);
    }
  }
  uint64_t v16 = [(BSAnimationSettings *)self->_settings highFrameRateReason];
  if (v16 | [v17 highFrameRateReason]) {
    [v17 setHighFrameRateReason:v16];
  }
}

+ (double)globalSlowDownFactor
{
  v2 = +[BSUIAnimationFactoryDomain rootSettings];
  [v2 effectiveSlowDownFactor];
  double v4 = v3;

  return v4;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5 = a4;
  int v6 = [(BSAnimationSettings *)self->_settings isSpringAnimation];
  float v7 = (id *)0x1E4F39C90;
  if (!v6) {
    float v7 = (id *)0x1E4F39B48;
  }
  double v8 = [*v7 animation];
  [(BSUIAnimationFactory *)self applySettingsToCAAnimation:v8];
  [v8 setKeyPath:v5];

  return v8;
}

+ (void)animateWithFactory:(id)a3 actions:(id)a4
{
}

uint64_t __86__BSUIAnimationFactory_animateWithFactory_additionalDelay_options_actions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __79__BSUIAnimationFactory__animateWithAdditionalDelay_options_actions_completion___block_invoke(uint64_t result, double a2, double a3, double a4)
{
  if (*(void *)(result + 32))
  {
    LODWORD(a2) = *(_DWORD *)(result + 40);
    LODWORD(a3) = *(_DWORD *)(result + 44);
    LODWORD(a4) = *(_DWORD *)(result + 48);
    return objc_msgSend(MEMORY[0x1E4F42FF0], "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", *(unsigned int *)(result + 52), a2, a3, a4);
  }
  return result;
}

- (BSUIAnimationFactory)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSUIAnimationFactory.m" lineNumber:56 description:@"attempt to create a nil factory"];

  return (BSUIAnimationFactory *)-[BSUIAnimationFactory _initWithSettings:](self, 0);
}

+ (id)factoryWithDuration:(double)a3 delay:(double)a4
{
  id v5 = [MEMORY[0x1E4F4F680] settingsWithDuration:a3 delay:a4];
  int v6 = [a1 factoryWithSettings:v5];

  return v6;
}

+ (id)factoryWithDuration:(double)a3 timingFunction:(id)a4
{
  id v5 = [MEMORY[0x1E4F4F680] settingsWithDuration:a4 timingFunction:a3];
  int v6 = [a1 factoryWithSettings:v5];

  return v6;
}

+ (id)factoryWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5
{
  int v6 = [MEMORY[0x1E4F4F680] settingsWithDuration:a5 delay:a3 timingFunction:a4];
  float v7 = [a1 factoryWithSettings:v6];

  return v7;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5
{
  int v6 = [MEMORY[0x1E4F4F840] settingsWithMass:a3 stiffness:a4 damping:a5];
  float v7 = [a1 factoryWithSettings:v6];

  return v7;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6
{
  float v7 = [MEMORY[0x1E4F4F840] settingsWithMass:a3 stiffness:a4 damping:a5 epsilon:a6];
  double v8 = [a1 factoryWithSettings:v7];

  return v8;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 initialVelocity:(double)a7
{
  double v8 = [MEMORY[0x1E4F4F840] settingsWithMass:a3 stiffness:a4 damping:a5 epsilon:a6 initialVelocity:a7];
  double v9 = [a1 factoryWithSettings:v8];

  return v9;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 timingFunction:(id)a6
{
  float v7 = [MEMORY[0x1E4F4F840] settingsWithMass:a6 stiffness:a3 damping:a4 timingFunction:a5];
  double v8 = [a1 factoryWithSettings:v7];

  return v8;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 timingFunction:(id)a7
{
  double v8 = [MEMORY[0x1E4F4F840] settingsWithMass:a7 stiffness:a3 damping:a4 epsilon:a5 timingFunction:a6];
  double v9 = [a1 factoryWithSettings:v8];

  return v9;
}

- (BSUIAnimationFactory)factoryWithTimingFunction:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(BSAnimationSettings *)self->_settings mutableCopy];
  [v5 setTimingFunction:v4];
  int v6 = [(id)objc_opt_class() factoryWithSettings:v5];

  return (BSUIAnimationFactory *)v6;
}

- (double)duration
{
  [(BSAnimationSettings *)self->_settings duration];
  return result;
}

- (double)delay
{
  [(BSAnimationSettings *)self->_settings delay];
  return result;
}

- (BSAnimationSettings)effectiveSettings
{
  if (([(BSAnimationSettings *)self->_settings isSpringAnimation] & 1) != 0
    || ([(id)objc_opt_class() globalSlowDownFactor], (BSFloatIsOne() & 1) != 0))
  {
    double v3 = (void *)[(BSAnimationSettings *)self->_settings copy];
  }
  else
  {
    double v3 = (void *)[(BSAnimationSettings *)self->_settings mutableCopy];
    [v3 duration];
    double v5 = v4;
    [(id)objc_opt_class() globalSlowDownFactor];
    [v3 setDuration:v5 * v6];
  }

  return (BSAnimationSettings *)v3;
}

+ (void)animateWithFactory:(id)a3 actions:(id)a4 completion:(id)a5
{
}

+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 actions:(id)a5
{
}

+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 actions:(id)a5 completion:(id)a6
{
}

+ (void)animateWithFactory:(id)a3 additionalDelay:(double)a4 options:(unint64_t)a5 actions:(id)a6
{
}

+ (void)animateWithSettings:(id)a3 actions:(id)a4 completion:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  double v9 = [a1 factoryWithSettings:a3];
  [a1 animateWithFactory:v9 additionalDelay:0 options:v10 actions:v8 completion:0.0];
}

+ (void)animateWithSettings:(id)a3 options:(unint64_t)a4 actions:(id)a5
{
  id v9 = a5;
  id v8 = [a1 factoryWithSettings:a3];
  [a1 animateWithFactory:v8 additionalDelay:a4 options:v9 actions:0 completion:0.0];
}

+ (void)animateWithSettings:(id)a3 options:(unint64_t)a4 actions:(id)a5 completion:(id)a6
{
  id v12 = a5;
  id v10 = a6;
  v11 = [a1 factoryWithSettings:a3];
  [a1 animateWithFactory:v11 additionalDelay:a4 options:v12 actions:v10 completion:0.0];
}

+ (void)addAlongsideAnimations:(id)a3 completion:(id)a4
{
  double v6 = (void (**)(void))a3;
  double v5 = (void (**)(id, uint64_t))a4;
  if (v6) {
    v6[2]();
  }
  if (v5 && ([MEMORY[0x1E4F42FF0] _addCompletion:v5] & 1) == 0) {
    v5[2](v5, 1);
  }
}

+ (id)factoryWithAnimationAttributes:(id)a3
{
  id v4 = a3;
  double v5 = [_BSUIAnimationAttributesFactory alloc];
  id v6 = v4;
  float v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel__initWithAttributes_ object:v5 file:@"BSUIAnimationFactory.m" lineNumber:355 description:@"must pass in valid attributes"];
    }
    id v8 = (id *)-[BSUIAnimationFactory _initWithSettings:](v5, 0);
    id v9 = v8;
    if (v8) {
      objc_storeStrong(v8 + 3, a3);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return [(BSAnimationSettings *)self->_settings hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    char v6 = [(BSAnimationSettings *)self->_settings isEqual:v4[2]];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p settings=%@>", objc_opt_class(), self, self->_settings];
}

- (BOOL)allowsAdditiveAnimations
{
  return self->_allowsAdditiveAnimations;
}

@end