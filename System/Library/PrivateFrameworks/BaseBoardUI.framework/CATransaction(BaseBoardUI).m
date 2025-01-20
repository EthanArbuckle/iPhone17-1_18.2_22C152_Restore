@interface CATransaction(BaseBoardUI)
+ (void)bs_performAfterCommit:()BaseBoardUI;
+ (void)bs_performAfterSynchronizedCommit:()BaseBoardUI;
@end

@implementation CATransaction(BaseBoardUI)

+ (void)bs_performAfterSynchronizedCommit:()BaseBoardUI
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v24 = v9;
      __int16 v25 = 2114;
      v26 = v11;
      __int16 v27 = 2048;
      uint64_t v28 = a1;
      __int16 v29 = 2114;
      v30 = @"CATransaction+BaseBoardUI.m";
      __int16 v31 = 1024;
      int v32 = 19;
      __int16 v33 = 2114;
      v34 = v8;
      _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A2B106E8);
  }
  BSDispatchQueueAssertMain();
  [MEMORY[0x1E4F39CF8] activate];
  v6 = (void *)MEMORY[0x1E4F39CF8];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __64__CATransaction_BaseBoardUI__bs_performAfterSynchronizedCommit___block_invoke;
  v21 = &unk_1E5ABD2E8;
  id v7 = v5;
  id v22 = v7;
  if (([v6 addCommitHandler:&v18 forPhase:5] & 1) == 0)
  {
    v12 = NSString;
    uint64_t v13 = [MEMORY[0x1E4F39CF8] currentPhase];
    v14 = objc_msgSend(v12, "stringWithFormat:", @"failed to register commit handler for phase = kCATransactionPhasePostSynchronize (current is %i)", v13, v18, v19, v20, v21);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v24 = v15;
      __int16 v25 = 2114;
      v26 = v17;
      __int16 v27 = 2048;
      uint64_t v28 = a1;
      __int16 v29 = 2114;
      v30 = @"CATransaction+BaseBoardUI.m";
      __int16 v31 = 1024;
      int v32 = 25;
      __int16 v33 = 2114;
      v34 = v14;
      _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A2B107ECLL);
  }
}

+ (void)bs_performAfterCommit:()BaseBoardUI
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138544642;
      id v24 = v9;
      __int16 v25 = 2114;
      v26 = v11;
      __int16 v27 = 2048;
      uint64_t v28 = a1;
      __int16 v29 = 2114;
      v30 = @"CATransaction+BaseBoardUI.m";
      __int16 v31 = 1024;
      int v32 = 29;
      __int16 v33 = 2114;
      v34 = v8;
      _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A2B21AB4);
  }
  BSDispatchQueueAssertMain();
  [MEMORY[0x1E4F39CF8] activate];
  v6 = (void *)MEMORY[0x1E4F39CF8];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __52__CATransaction_BaseBoardUI__bs_performAfterCommit___block_invoke;
  v21 = &unk_1E5ABD2E8;
  id v7 = v5;
  id v22 = v7;
  if (([v6 addCommitHandler:&v18 forPhase:2] & 1) == 0)
  {
    v12 = NSString;
    uint64_t v13 = [MEMORY[0x1E4F39CF8] currentPhase];
    v14 = objc_msgSend(v12, "stringWithFormat:", @"failed to register commit handler for phase = kCATransactionPhasePostCommit (current is %i)", v13, v18, v19, v20, v21);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v24 = v15;
      __int16 v25 = 2114;
      v26 = v17;
      __int16 v27 = 2048;
      uint64_t v28 = a1;
      __int16 v29 = 2114;
      v30 = @"CATransaction+BaseBoardUI.m";
      __int16 v31 = 1024;
      int v32 = 35;
      __int16 v33 = 2114;
      v34 = v14;
      _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A2B21BB8);
  }
}

@end