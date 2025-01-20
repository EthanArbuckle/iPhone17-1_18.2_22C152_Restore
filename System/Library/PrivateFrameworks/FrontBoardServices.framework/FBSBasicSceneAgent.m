@interface FBSBasicSceneAgent
- (FBSSceneHandle)scene;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_configureWithScene:(id)a3;
- (void)didReceiveMessage:(id)a3 fromCounterpartAgent:(id)a4 withResponseSender:(id)a5;
- (void)scene:(id)a3 reviewEvent:(id)a4 withCompletion:(id)a5;
@end

@implementation FBSBasicSceneAgent

- (void)scene:(id)a3 reviewEvent:(id)a4 withCompletion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  if (WeakRetained != v12)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_scene == scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSBasicSceneAgent scene:reviewEvent:withCompletion:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  if (v9) {
    v9[2](v9, 0);
  }
}

- (void)_configureWithScene:(id)a3
{
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSBasicSceneAgent *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v6 = [(FBSBasicSceneAgent *)self succinctDescriptionBuilder];
  v7 = v6;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__FBSBasicSceneAgent_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E58F4AB0;
    id v10 = v6;
    id v11 = WeakRetained;
    [v10 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  }

  return v7;
}

- (id)succinctDescriptionBuilder
{
  v3 = [off_1E58F44F0 builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v5 = [WeakRetained identifier];
  id v6 = (id)[v3 appendObject:v5 withName:@"sceneID" skipIfNil:1];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(FBSBasicSceneAgent *)self descriptionWithMultilinePrefix:0];
}

- (void)didReceiveMessage:(id)a3 fromCounterpartAgent:(id)a4 withResponseSender:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (id)succinctDescription
{
  v2 = [(FBSBasicSceneAgent *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

void __60__FBSBasicSceneAgent_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) callOutQueue];
  id v4 = (id)[v2 appendObject:v3 withName:@"queue"];

  v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) parameters];
  id v7 = (id)[v5 appendObject:v6 withName:@"paremeters"];

  id v8 = *(void **)(a1 + 32);
  v9 = [*(id *)(a1 + 40) clientProcess];
  id v10 = (id)[v8 appendObject:v9 withName:@"clientProcess"];

  id v11 = *(void **)(a1 + 32);
  id v13 = [*(id *)(a1 + 40) hostProcess];
  id v12 = (id)[v11 appendObject:v13 withName:@"hostProcess"];
}

- (FBSSceneHandle)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (FBSSceneHandle *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)scene:reviewEvent:withCompletion:.cold.1()
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

@end