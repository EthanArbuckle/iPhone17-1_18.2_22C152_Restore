@interface FBWorkspaceSceneRequest
- (BOOL)requiresModernDispatcher;
- (BOOL)requiresTargetPreregistration;
- (FBSWorkspaceSceneRequestOptions)options;
- (FBWorkspaceSceneRequest)init;
- (FBWorkspaceSceneRequest)initWithTargetIdentifier:(id)a3;
- (FBWorkspaceSceneRequest)initWithTargetIdentifier:(id)a3 actions:(id)a4 completion:(id)a5;
- (FBWorkspaceSceneRequest)initWithTargetIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
- (NSSet)actions;
- (NSString)targetIdentifier;
- (void)_respondWithScene:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)invalidateWithError:(id)a3;
- (void)observeScene:(id)a3;
- (void)respondWithScene:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidInvalidate:(id)a3;
@end

@implementation FBWorkspaceSceneRequest

- (FBWorkspaceSceneRequest)init
{
  return [(FBWorkspaceSceneRequest *)self initWithTargetIdentifier:0];
}

- (FBWorkspaceSceneRequest)initWithTargetIdentifier:(id)a3
{
  id v4 = a3;
  if (v4 && (NSClassFromString(&cfstr_Nsstring.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceSceneRequest initWithTargetIdentifier:]();
    }
    }
    [v9 UTF8String];
    result = (FBWorkspaceSceneRequest *)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    v10.receiver = self;
    v10.super_class = (Class)FBWorkspaceSceneRequest;
    v5 = [(FBWorkspaceSceneRequest *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      targetIdentifier = v5->_targetIdentifier;
      v5->_targetIdentifier = (NSString *)v6;

      v5->_lock._os_unfair_lock_opaque = 0;
    }

    return v5;
  }
  return result;
}

- (FBWorkspaceSceneRequest)initWithTargetIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  if (v11)
  {
    NSClassFromString(&cfstr_Fbsworkspacesc.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSWorkspaceSceneRequestOptionsClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceSceneRequest initWithTargetIdentifier:options:completion:]();
      }
      }
LABEL_12:
      [v17 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A634FF68);
    }
  }

  if (!v10)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"completion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceSceneRequest initWithTargetIdentifier:options:completion:]();
    }
    }
    goto LABEL_12;
  }
  v12 = [(FBWorkspaceSceneRequest *)self initWithTargetIdentifier:v8];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_options, a4);
    uint64_t v14 = [v10 copy];
    id lock_completion = v13->_lock_completion;
    v13->_id lock_completion = (id)v14;
  }
  return v13;
}

- (FBWorkspaceSceneRequest)initWithTargetIdentifier:(id)a3 actions:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(FBWorkspaceSceneRequest *)self initWithTargetIdentifier:a3];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    actions = v10->_actions;
    v10->_actions = (NSSet *)v11;

    uint64_t v13 = [v9 copy];
    id lock_completion = v10->_lock_completion;
    v10->_id lock_completion = (id)v13;
  }
  return v10;
}

- (void)dealloc
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (BOOL)requiresModernDispatcher
{
  return ([(FBSWorkspaceSceneRequestOptions *)self->_options isClientFuture] & 1) != 0
      || self->_actions != 0;
}

- (BOOL)requiresTargetPreregistration
{
  return ![(FBWorkspaceSceneRequest *)self requiresModernDispatcher];
}

- (void)observeScene:(id)a3
{
  id object = a3;
  if ([object isValid] && (objc_msgSend(object, "isActive") & 1) == 0)
  {
    [object addObserver:self];
    uint64_t v5 = (const void *)objc_opt_class();
    objc_setAssociatedObject(object, v5, self, (void *)1);
  }
  else if ([object isActive])
  {
    [(FBWorkspaceSceneRequest *)self respondWithScene:object];
  }
  else
  {
    uint64_t v4 = FBSceneErrorCreate(2uLL, @"scene already invalidated", 0);
    [(FBWorkspaceSceneRequest *)self invalidateWithError:v4];
  }
}

- (void)respondWithScene:(id)a3
{
  id v4 = a3;
  actions = self->_actions;
  id v7 = v4;
  if (v7 || !actions)
  {
    NSClassFromString(&cfstr_Fbscene.isa);
    if (v7)
    {
      if (objc_opt_isKindOfClass()) { {
        goto LABEL_5;
      }
      }
      uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSceneClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceSceneRequest respondWithScene:]();
      }
      }
    }
    else
    {
      uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceSceneRequest respondWithScene:]();
      }
      }
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6350348);
  }
LABEL_5:

  [(FBWorkspaceSceneRequest *)self _respondWithScene:v7 error:0];
}

- (void)invalidateWithError:(id)a3
{
  id v5 = a3;
  NSClassFromString(&cfstr_Nserror.isa);
  if (!v5)
  {
    id v4 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceSceneRequest invalidateWithError:]();
    }
    }
LABEL_11:
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63504A0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSErrorClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceSceneRequest invalidateWithError:]();
    }
    }
    goto LABEL_11;
  }

  [(FBWorkspaceSceneRequest *)self _respondWithScene:0 error:v5];
}

- (void)_respondWithScene:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_responded = self->_lock_responded;
  uint8_t v9 = (void (**)(void, void, void))MEMORY[0x1AD0B8C50](self->_lock_completion);
  id lock_completion = self->_lock_completion;
  self->_id lock_completion = 0;

  self->_BOOL lock_responded = 1;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_responded)
  {
    v12 = [NSString stringWithFormat:@"attempt to respond to previously invalidated request with scene=%@ error=%@", v6, v7];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceSceneRequest _respondWithScene:error:]();
    }
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    if (v7)
    {
      uint64_t v11 = FBLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceSceneRequest _respondWithScene:error:]((uint64_t)self, v7, v11);
      }
      }
    }
    if (v9) { {
      ((void (**)(void, id, id))v9)[2](v9, v6, v7);
    }
    }
  }
}

- (void)sceneDidActivate:(id)a3
{
  id object = a3;
  [(FBWorkspaceSceneRequest *)self respondWithScene:object];
  [object removeObserver:self];
  id v4 = (const void *)objc_opt_class();
  objc_setAssociatedObject(object, v4, 0, (void *)1);
}

- (void)sceneDidInvalidate:(id)a3
{
  id object = a3;
  id v4 = FBSceneErrorCreate(2uLL, @"scene explicitly invalidated", 0);
  [(FBWorkspaceSceneRequest *)self invalidateWithError:v4];

  [object removeObserver:self];
  id v5 = (const void *)objc_opt_class();
  objc_setAssociatedObject(object, v5, 0, (void *)1);
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (FBSWorkspaceSceneRequestOptions)options
{
  return self->_options;
}

- (NSSet)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_completion, 0);
}

- (void)initWithTargetIdentifier:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithTargetIdentifier:options:completion:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithTargetIdentifier:options:completion:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)respondWithScene:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)invalidateWithError:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_respondWithScene:(NSObject *)a3 error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = [a2 descriptionWithMultilinePrefix:0];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl(&dword_1A62FC000, a3, OS_LOG_TYPE_ERROR, "Request for workspace \"%{public}@\" failed: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_respondWithScene:error:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end