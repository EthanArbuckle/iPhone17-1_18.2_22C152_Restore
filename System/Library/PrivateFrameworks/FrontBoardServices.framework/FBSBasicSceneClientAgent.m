@interface FBSBasicSceneClientAgent
- (void)scene:(id)a3 didInitializeWithEvent:(id)a4 completion:(id)a5;
- (void)scene:(id)a3 handleEvent:(id)a4 withCompletion:(id)a5;
- (void)scene:(id)a3 willInvalidateWithEvent:(id)a4 completion:(id)a5;
@end

@implementation FBSBasicSceneClientAgent

- (void)scene:(id)a3 didInitializeWithEvent:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._scene);

  if (WeakRetained != v12)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_scene == scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSBasicSceneClientAgent scene:didInitializeWithEvent:completion:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  if (v9) {
    v9[2](v9);
  }
}

- (void)scene:(id)a3 willInvalidateWithEvent:(id)a4 completion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._scene);

  if (WeakRetained != v12)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_scene == scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSBasicSceneClientAgent scene:willInvalidateWithEvent:completion:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  if (v9) {
    v9[2](v9);
  }
}

- (void)scene:(id)a3 handleEvent:(id)a4 withCompletion:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._scene);

  if (WeakRetained != v12)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_scene == scene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSBasicSceneClientAgent scene:handleEvent:withCompletion:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  if (v9) {
    v9[2](v9, 0);
  }
}

- (void)scene:didInitializeWithEvent:completion:.cold.1()
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

- (void)scene:willInvalidateWithEvent:completion:.cold.1()
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

- (void)scene:handleEvent:withCompletion:.cold.1()
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