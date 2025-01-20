@interface FBSSceneTransitionContextCore
+ (id)protocol;
- (BKSAnimationFenceHandle)animationFence;
- (BOOL)allowCPUThrottling;
- (BOOL)isRunningBoardAssertionDisabled;
- (BSAnimationSettings)animationSettings;
- (BSProcessHandle)originatingProcess;
- (FBProcessExecutionContext)executionContext;
- (FBSceneUpdateContext)updateContext;
- (FBWatchdogTransitionContext)watchdogTransitionContext;
- (NSError)error;
- (RBSProcessHandle)clientProcessHandle;
- (void)setAllowCPUThrottling:(BOOL)a3;
- (void)setAnimationFence:(id)a3;
- (void)setAnimationSettings:(id)a3;
- (void)setClientProcessHandle:(id)a3;
- (void)setError:(id)a3;
- (void)setExecutionContext:(id)a3;
- (void)setOriginatingProcess:(id)a3;
- (void)setRunningBoardAssertionDisabled:(BOOL)a3;
- (void)setUpdateContext:(id)a3;
- (void)setWatchdogTransitionContext:(id)a3;
@end

@implementation FBSSceneTransitionContextCore

- (BKSAnimationFenceHandle)animationFence
{
  uint64_t v4 = objc_opt_class();

  return (BKSAnimationFenceHandle *)[(FBSSceneTransitionContextCore *)self valueForProperty:a2 expectedClass:v4];
}

- (void)setUpdateContext:(id)a3
{
}

- (void)setAnimationFence:(id)a3
{
}

- (BSAnimationSettings)animationSettings
{
  uint64_t v4 = objc_opt_class();

  return (BSAnimationSettings *)[(FBSSceneTransitionContextCore *)self valueForProperty:a2 expectedClass:v4];
}

+ (id)protocol
{
  return &unk_1EED423C0;
}

- (void)setAnimationSettings:(id)a3
{
}

- (FBWatchdogTransitionContext)watchdogTransitionContext
{
  Class v4 = NSClassFromString(&cfstr_Fbwatchdogtran.isa);

  return (FBWatchdogTransitionContext *)[(FBSSceneTransitionContextCore *)self valueForProperty:a2 expectedClass:v4];
}

- (FBSceneUpdateContext)updateContext
{
  Class v4 = NSClassFromString(&cfstr_Fbsceneupdatec.isa);

  return (FBSceneUpdateContext *)[(FBSSceneTransitionContextCore *)self valueForProperty:a2 expectedClass:v4];
}

- (BOOL)isRunningBoardAssertionDisabled
{
  v2 = [(FBSSceneTransitionContextCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)allowCPUThrottling
{
  v2 = [(FBSSceneTransitionContextCore *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setOriginatingProcess:(id)a3
{
}

- (FBProcessExecutionContext)executionContext
{
  Class v4 = NSClassFromString(&cfstr_Fbprocessexecu.isa);

  return (FBProcessExecutionContext *)[(FBSSceneTransitionContextCore *)self valueForProperty:a2 expectedClass:v4];
}

- (BSProcessHandle)originatingProcess
{
  uint64_t v4 = objc_opt_class();

  return (BSProcessHandle *)[(FBSSceneTransitionContextCore *)self valueForProperty:a2 expectedClass:v4];
}

- (RBSProcessHandle)clientProcessHandle
{
  uint64_t v4 = objc_opt_class();

  return (RBSProcessHandle *)[(FBSSceneTransitionContextCore *)self valueForProperty:a2 expectedClass:v4];
}

- (void)setClientProcessHandle:(id)a3
{
}

- (void)setExecutionContext:(id)a3
{
}

- (void)setWatchdogTransitionContext:(id)a3
{
}

- (void)setAllowCPUThrottling:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = *MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v3 = 0;
  }
  [(FBSSceneTransitionContextCore *)self setValue:v3 forProperty:a2];
}

- (void)setRunningBoardAssertionDisabled:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = *MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v3 = 0;
  }
  [(FBSSceneTransitionContextCore *)self setValue:v3 forProperty:a2];
}

- (NSError)error
{
  uint64_t v4 = objc_opt_class();

  return (NSError *)[(FBSSceneTransitionContextCore *)self valueForProperty:a2 expectedClass:v4];
}

- (void)setError:(id)a3
{
}

@end