@interface FBWaitForSceneDestructionTransaction
- (BOOL)_canBeInterrupted;
- (FBScene)scene;
- (FBWaitForSceneDestructionTransaction)initWithScene:(id)a3;
- (id)_customizedDescriptionProperties;
- (void)_begin;
- (void)_didComplete;
- (void)dealloc;
- (void)sceneDidInvalidate:(id)a3;
@end

@implementation FBWaitForSceneDestructionTransaction

- (FBWaitForSceneDestructionTransaction)initWithScene:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v12.receiver = self;
    v12.super_class = (Class)FBWaitForSceneDestructionTransaction;
    v8 = [(FBTransaction *)&v12 init];
    v9 = v8;
    if (v8) { {
      objc_storeStrong((id *)&v8->_sceneToWaitForDeath, a3);
    }
    }

    return v9;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      [(FBWaitForSceneDestructionTransaction *)a2 initWithScene:(uint64_t)v11];
    }
    }
    [v11 UTF8String];
    result = (FBWaitForSceneDestructionTransaction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FBWaitForSceneDestructionTransaction;
  [(FBWaitForSceneDestructionTransaction *)&v3 dealloc];
}

- (void)_begin
{
  if ([(FBScene *)self->_sceneToWaitForDeath isValid])
  {
    [(FBWaitForSceneDestructionTransaction *)self addMilestone:@"SBWTMilestoneSceneDestruction"];
    [(FBScene *)self->_sceneToWaitForDeath addObserver:self];
  }
  v3.receiver = self;
  v3.super_class = (Class)FBWaitForSceneDestructionTransaction;
  [(FBWaitForSceneDestructionTransaction *)&v3 _begin];
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_didComplete
{
  v3.receiver = self;
  v3.super_class = (Class)FBWaitForSceneDestructionTransaction;
  [(FBWaitForSceneDestructionTransaction *)&v3 _didComplete];
}

- (id)_customizedDescriptionProperties
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(FBScene *)self->_sceneToWaitForDeath succinctDescription];
  [v3 setObject:v4 forKey:@"Scene"];

  return v3;
}

- (void)sceneDidInvalidate:(id)a3
{
  if (self->_sceneToWaitForDeath == a3)
  {
    [a3 removeObserver:self];
    v4 = [(FBWaitForSceneDestructionTransaction *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__FBWaitForSceneDestructionTransaction_sceneDidInvalidate___block_invoke;
    block[3] = &unk_1E5C49AE0;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __59__FBWaitForSceneDestructionTransaction_sceneDidInvalidate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) satisfyMilestone:@"SBWTMilestoneSceneDestruction"];
}

- (FBScene)scene
{
  return self->_sceneToWaitForDeath;
}

- (void).cxx_destruct
{
}

- (void)initWithScene:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"FBWaitForSceneDestructionTransaction.m";
  __int16 v16 = 1024;
  int v17 = 31;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end