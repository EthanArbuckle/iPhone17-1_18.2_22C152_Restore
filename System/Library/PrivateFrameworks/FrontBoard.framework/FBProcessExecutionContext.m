@interface FBProcessExecutionContext
- (BOOL)checkForLeaks;
- (BOOL)disableASLR;
- (BOOL)forSceneActivation;
- (BOOL)waitForDebugger;
- (FBProcessExecutableSlice)overrideExecutableSlice;
- (FBProcessExecutionContext)initWithIdentity:(id)a3;
- (FBProcessWatchdogProviding)watchdogProvider;
- (NSArray)arguments;
- (NSDictionary)environment;
- (NSString)overrideExecutablePath;
- (NSURL)standardErrorURL;
- (NSURL)standardOutputURL;
- (RBSProcessIdentity)identity;
- (double)watchdogExtension;
- (id)_initWithExecutionContext:(id)a3;
- (id)completion;
- (id)copyOrUpdateForSceneActivationWithSettings:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)launchIntent;
- (void)setArguments:(id)a3;
- (void)setCheckForLeaks:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setDisableASLR:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setForSceneActivation:(BOOL)a3;
- (void)setIdentity:(id)a3;
- (void)setLaunchIntent:(int64_t)a3;
- (void)setOverrideExecutablePath:(id)a3;
- (void)setOverrideExecutableSlice:(id)a3;
- (void)setStandardErrorURL:(id)a3;
- (void)setStandardOutputURL:(id)a3;
- (void)setWaitForDebugger:(BOOL)a3;
- (void)setWatchdogExtension:(double)a3;
- (void)setWatchdogProvider:(id)a3;
@end

@implementation FBProcessExecutionContext

- (void)setEnvironment:(id)a3
{
}

- (void)setWaitForDebugger:(BOOL)a3
{
  self->_waitForDebugger = a3;
}

- (void)setLaunchIntent:(int64_t)a3
{
  self->_launchIntent = a3;
}

- (void)setIdentity:(id)a3
{
}

- (void)setDisableASLR:(BOOL)a3
{
  self->_disableASLR = a3;
}

- (void)setCheckForLeaks:(BOOL)a3
{
  self->_checkForLeaks = a3;
}

- (void)setArguments:(id)a3
{
}

- (void)setWatchdogProvider:(id)a3
{
}

- (void)setStandardOutputURL:(id)a3
{
}

- (void)setStandardErrorURL:(id)a3
{
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_opt_new();
    v6 = (void *)MEMORY[0x1E4F627F8];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__FBProcessExecutionContext_setCompletion___block_invoke;
    v19[3] = &unk_1E5C49BE8;
    id v7 = v5;
    id v20 = v7;
    id v8 = v4;
    id v21 = v8;
    v9 = [v6 sentinelWithCompletion:v19];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __43__FBProcessExecutionContext_setCompletion___block_invoke_3;
    v15[3] = &unk_1E5C49C10;
    id v16 = v7;
    id v17 = v9;
    id v18 = v8;
    id v10 = v9;
    id v11 = v7;
    v12 = (void *)[v15 copy];
    id completion = self->_completion;
    self->_id completion = v12;
  }
  else
  {
    id v14 = self->_completion;
    self->_id completion = 0;
  }
}

- (id)_initWithExecutionContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 identity];
  v6 = [(FBProcessExecutionContext *)self initWithIdentity:v5];

  if (v6)
  {
    id v7 = [v4 arguments];
    uint64_t v8 = [v7 copy];
    arguments = v6->_arguments;
    v6->_arguments = (NSArray *)v8;

    id v10 = [v4 environment];
    uint64_t v11 = [v10 copy];
    environment = v6->_environment;
    v6->_environment = (NSDictionary *)v11;

    uint64_t v13 = [v4 standardOutputURL];
    standardOutputURL = v6->_standardOutputURL;
    v6->_standardOutputURL = (NSURL *)v13;

    uint64_t v15 = [v4 standardErrorURL];
    standardErrorURL = v6->_standardErrorURL;
    v6->_standardErrorURL = (NSURL *)v15;

    v6->_waitForDebugger = [v4 waitForDebugger];
    v6->_disableASLR = [v4 disableASLR];
    v6->_checkForLeaks = [v4 checkForLeaks];
    v6->_launchIntent = [v4 launchIntent];
    uint64_t v17 = [v4 watchdogProvider];
    watchdogProvider = v6->_watchdogProvider;
    v6->_watchdogProvider = (FBProcessWatchdogProviding *)v17;

    [v4 watchdogExtension];
    v6->_watchdogExtension = v19;
    uint64_t v20 = [v4 overrideExecutablePath];
    overrideExecutablePath = v6->_overrideExecutablePath;
    v6->_overrideExecutablePath = (NSString *)v20;

    v6->_forSceneActivation = [v4 forSceneActivation];
    uint64_t v22 = [v4 overrideExecutableSlice];
    overrideExecutableSlice = v6->_overrideExecutableSlice;
    v6->_overrideExecutableSlice = (FBProcessExecutableSlice *)v22;

    v24 = [v4 completion];
    uint64_t v25 = [v24 copy];
    id completion = v6->_completion;
    v6->_id completion = (id)v25;
  }
  return v6;
}

- (NSDictionary)environment
{
  return self->_environment;
}

- (int64_t)launchIntent
{
  return self->_launchIntent;
}

- (FBProcessWatchdogProviding)watchdogProvider
{
  return self->_watchdogProvider;
}

- (BOOL)waitForDebugger
{
  return self->_waitForDebugger;
}

- (NSURL)standardOutputURL
{
  return self->_standardOutputURL;
}

- (NSURL)standardErrorURL
{
  return self->_standardErrorURL;
}

- (FBProcessExecutableSlice)overrideExecutableSlice
{
  return self->_overrideExecutableSlice;
}

- (NSString)overrideExecutablePath
{
  return self->_overrideExecutablePath;
}

- (BOOL)disableASLR
{
  return self->_disableASLR;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (double)watchdogExtension
{
  return self->_watchdogExtension;
}

- (FBProcessExecutionContext)initWithIdentity:(id)a3
{
  id v4 = a3;
  v5 = [(FBProcessExecutionContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identity = v5->_identity;
    v5->_identity = (RBSProcessIdentity *)v6;
  }
  return v5;
}

- (BOOL)forSceneActivation
{
  return self->_forSceneActivation;
}

- (BOOL)checkForLeaks
{
  return self->_checkForLeaks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

void __43__FBProcessExecutionContext_setCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) signal]) { {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  }
  [*(id *)(a1 + 40) signal];
}

void __43__FBProcessExecutionContext_setCompletion___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isFailed] && objc_msgSend(*(id *)(a1 + 32), "signal"))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E4F28C58], "bs_errorWithDomain:code:configuration:", @"FBProcessExecutionContext", 1, &__block_literal_global_4);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v4);
  }
}

- (void)setForSceneActivation:(BOOL)a3
{
  self->_forSceneActivation = a3;
}

- (id)copyOrUpdateForSceneActivationWithSettings:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(FBProcessExecutionContext *)self launchIntent];
  if (!v5)
  {
    if ([v4 isForeground])
    {
      if ([v4 jetsamMode] == 1) { {
        int64_t v5 = 3;
      }
      }
      else {
        int64_t v5 = 4;
      }
    }
    else
    {
      int64_t v5 = 2;
    }
  }
  id v6 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [[FBProcessExecutionContext alloc] _initWithExecutionContext:v6];

    id v6 = v7;
  }
  [(FBProcessExecutionContext *)v6 setForSceneActivation:1];
  [(FBProcessExecutionContext *)v6 setLaunchIntent:v5];

  return v6;
}

uint64_t __43__FBProcessExecutionContext_setCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setFailureReason:@"No process execution was performed"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[FBMutableProcessExecutionContext allocWithZone:a3];

  return [(FBProcessExecutionContext *)v4 _initWithExecutionContext:self];
}

- (void)setWatchdogExtension:(double)a3
{
  self->_watchdogExtension = a3;
}

- (void)setOverrideExecutablePath:(id)a3
{
}

- (void)setOverrideExecutableSlice:(id)a3
{
}

@end