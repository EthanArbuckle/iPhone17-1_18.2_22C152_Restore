@interface FBSWorkspaceService
- (FBSWorkspaceService)init;
- (id)_initWithTarget:(id)a3 identifier:(id)a4;
- (id)createScene:(id)a3;
- (id)createScene:(id)a3 completion:(id)a4;
- (id)description;
- (void)requestSceneWithOptions:(id)a3 completion:(id)a4;
- (void)sendActions:(id)a3;
- (void)sendActions:(id)a3 completion:(id)a4;
@end

@implementation FBSWorkspaceService

- (FBSWorkspaceService)init
{
  v4 = [NSString stringWithFormat:@"init not supported"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSWorkspace.m";
    __int16 v16 = 1024;
    int v17 = 569;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (id)_initWithTarget:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"target != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspaceService _initWithTarget:identifier:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
  }
  v9 = v8;
  v16.receiver = self;
  v16.super_class = (Class)FBSWorkspaceService;
  __int16 v10 = [(FBSWorkspaceService *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_target, a3);
    uint64_t v12 = [v9 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->_identifier) {
    identifier = (__CFString *)self->_identifier;
  }
  else {
    identifier = @"(default)";
  }
  id v7 = [(FBSWorkspaceServiceTarget *)self->_target identifier];
  id v8 = [v3 stringWithFormat:@"<%@: %p; %@; %@>", v5, self, identifier, v7];

  return v8;
}

- (void)sendActions:(id)a3
{
}

- (void)sendActions:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (v9)
  {
    NSClassFromString(&cfstr_Nsset.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSSetClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSWorkspaceService sendActions:completion:]();
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
    }
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__FBSWorkspaceService_sendActions_completion___block_invoke;
  v17[3] = &unk_1E58F5A48;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  SEL v19 = a2;
  v11 = (void (**)(void, void, void))MEMORY[0x19F3991F0](v17);
  if ([v9 count])
  {
    uint64_t v12 = FBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(FBSWorkspaceServiceTarget *)self->_target identifier];
      if (self->_identifier) {
        identifier = (__CFString *)self->_identifier;
      }
      else {
        identifier = @"(default)";
      }
      v15 = [v9 fbs_singleLineDescriptionOfBSActions];
      *(_DWORD *)buf = 138543874;
      v21 = v13;
      __int16 v22 = 2114;
      v23 = identifier;
      __int16 v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_19C680000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending action(s) to workspace %{public}@: %{public}@", buf, 0x20u);
    }
    [(FBSWorkspaceServiceTarget *)self->_target sendActions:v9 toWorkspaceID:self->_identifier completion:v11];
  }
  else
  {
    v11[2](v11, 1, 0);
  }
}

void __46__FBSWorkspaceService_sendActions_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = FBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__FBSWorkspaceService_sendActions_completion___block_invoke_cold_2(a1, v5, v6);
    }
  }
  if (*(void *)(a1 + 40))
  {
    id v7 = +[FBSWorkspace _sharedWorkspaceIfExists];
    if (!v7)
    {
      id v10 = NSString;
      v11 = [*(id *)(*(void *)(a1 + 32) + 8) identifier];
      uint64_t v12 = [v10 stringWithFormat:@"cannot call completion of sendActions to %@ without a reference to the workspace", v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __46__FBSWorkspaceService_sendActions_completion___block_invoke_cold_1();
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
    }
    id v8 = v7;
    id v9 = [v7 _callOutQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__FBSWorkspaceService_sendActions_completion___block_invoke_270;
    v13[3] = &unk_1E58F5A20;
    id v15 = *(id *)(a1 + 40);
    char v16 = a2;
    id v14 = v5;
    [v9 performAsync:v13];
  }
}

uint64_t __46__FBSWorkspaceService_sendActions_completion___block_invoke_270(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)createScene:(id)a3
{
  v4 = (void (**)(id, FBSClientSceneFutureDefinition *))a3;
  id v5 = [[FBSClientSceneFutureDefinition alloc] initWithWorkspaceID:self->_identifier];
  if (v4) {
    v4[2](v4, v5);
  }
  v6 = [(FBSWorkspaceServiceTarget *)self->_target createSceneFutureWithDefinition:v5];

  return v6;
}

- (id)createScene:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(FBSWorkspaceService *)self createScene:a3];
  [v7 activateWithCompletion:v6];

  return v7;
}

- (void)requestSceneWithOptions:(id)a3 completion:(id)a4
{
  identifier = self->_identifier;
  id v7 = a4;
  id v8 = a3;
  [v8 setWorkspaceIdentifier:identifier];
  [(FBSWorkspaceServiceTarget *)self->_target requestSceneWithOptions:v8 completion:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

- (void)_initWithTarget:identifier:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)sendActions:completion:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __46__FBSWorkspaceService_sendActions_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_19();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 48));
  v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

void __46__FBSWorkspaceService_sendActions_completion___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 descriptionWithMultilinePrefix:0];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl(&dword_19C680000, a3, OS_LOG_TYPE_ERROR, "%{public}@ Action(s) failed: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end