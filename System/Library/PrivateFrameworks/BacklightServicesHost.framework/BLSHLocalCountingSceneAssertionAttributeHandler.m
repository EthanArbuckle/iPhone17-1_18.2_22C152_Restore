@interface BLSHLocalCountingSceneAssertionAttributeHandler
+ (Class)attributeBaseClass;
+ (id)attributeClasses;
- (id)countingTargetForEntry:(id)a3;
- (id)sceneIdentityTokenForEntry:(void *)a1;
- (void)activateForSceneEnvironment:(id)a3;
- (void)activateWithFirstEntry:(id)a3;
- (void)deactivateForSceneEnvironment:(id)a3;
- (void)deactivateWithFinalEntry:(id)a3;
- (void)sceneDidInvalidate:(id)a3 environment:(id)a4;
@end

@implementation BLSHLocalCountingSceneAssertionAttributeHandler

+ (id)attributeClasses
{
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ must subclass BLSHLocalCountingSceneAssertionAttributeHandler and override %@", a1, v5];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2048;
    id v16 = a1;
    __int16 v17 = 2114;
    v18 = @"BLSHLocalCountingSceneAssertionAttributeHandler.m";
    __int16 v19 = 1024;
    int v20 = 22;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v6 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (Class)attributeBaseClass
{
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ must subclass BLSHLocalCountingSceneAssertionAttributeHandler and override %@", a1, v5];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544642;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2048;
    id v16 = a1;
    __int16 v17 = 2114;
    v18 = @"BLSHLocalCountingSceneAssertionAttributeHandler.m";
    __int16 v19 = 1024;
    int v20 = 27;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v6 UTF8String];
  Class result = (Class)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)activateWithFirstEntry:(id)a3
{
  id v4 = a3;
  v5 = bls_assertions_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BLSHLocalCountingSceneAssertionAttributeHandler activateWithFirstEntry:]();
  }

  v7 = -[BLSHLocalCountingSceneAssertionAttributeHandler sceneIdentityTokenForEntry:](self, v4);
  id v6 = v7;
  BSDispatchMain();
}

- (id)sceneIdentityTokenForEntry:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (!a1)
  {
LABEL_4:

    return a1;
  }
  v5 = [v3 attribute];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a1 = [v5 sceneIdentityToken];

    goto LABEL_4;
  }
  v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[attribute isKindOfClass:[BLSSceneAttribute class]]"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    [(BLSHLocalCountingSceneAssertionAttributeHandler *)sel_sceneIdentityTokenForEntry_ sceneIdentityTokenForEntry:(uint64_t)v7];
  }
  [v7 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __74__BLSHLocalCountingSceneAssertionAttributeHandler_activateWithFirstEntry___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) service];
  id v3 = [v2 osInterfaceProvider];
  id v4 = [v3 addSceneObserver:*(void *)(a1 + 32) forSceneIdentityToken:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) activateForSceneEnvironment:v4];
}

- (void)activateForSceneEnvironment:(id)a3
{
  id v5 = a3;
  id v6 = NSString;
  v7 = NSStringFromSelector(a2);
  v8 = [v6 stringWithFormat:@"%@ must subclass BLSHLocalCountingSceneAssertionAttributeHandler and override %@", self, v7];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    __int16 v13 = v9;
    __int16 v14 = 2114;
    __int16 v15 = v11;
    __int16 v16 = 2048;
    __int16 v17 = self;
    __int16 v18 = 2114;
    __int16 v19 = @"BLSHLocalCountingSceneAssertionAttributeHandler.m";
    __int16 v20 = 1024;
    int v21 = 43;
    __int16 v22 = 2114;
    v23 = v8;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)deactivateWithFinalEntry:(id)a3
{
  id v4 = a3;
  id v5 = bls_assertions_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BLSHLocalCountingSceneAssertionAttributeHandler deactivateWithFinalEntry:]();
  }

  v7 = -[BLSHLocalCountingSceneAssertionAttributeHandler sceneIdentityTokenForEntry:](self, v4);
  id v6 = v7;
  BSDispatchMain();
}

void __76__BLSHLocalCountingSceneAssertionAttributeHandler_deactivateWithFinalEntry___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) service];
  id v3 = [v2 osInterfaceProvider];
  id v4 = [v3 removeSceneObserver:*(void *)(a1 + 32) forSceneIdentityToken:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) deactivateForSceneEnvironment:v4];
}

- (void)deactivateForSceneEnvironment:(id)a3
{
  id v5 = a3;
  id v6 = NSString;
  v7 = NSStringFromSelector(a2);
  v8 = [v6 stringWithFormat:@"%@ must subclass BLSHLocalCountingSceneAssertionAttributeHandler and override %@", self, v7];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    __int16 v13 = v9;
    __int16 v14 = 2114;
    __int16 v15 = v11;
    __int16 v16 = 2048;
    __int16 v17 = self;
    __int16 v18 = 2114;
    __int16 v19 = @"BLSHLocalCountingSceneAssertionAttributeHandler.m";
    __int16 v20 = 1024;
    int v21 = 58;
    __int16 v22 = 2114;
    v23 = v8;
    _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (id)countingTargetForEntry:(id)a3
{
  return -[BLSHLocalCountingSceneAssertionAttributeHandler sceneIdentityTokenForEntry:](self, a3);
}

- (void)sceneDidInvalidate:(id)a3 environment:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v33 = a4;
  v8 = [(BLSHLocalAssertionAttributeHandler *)self service];
  v9 = [MEMORY[0x263EFF9C0] set];
  v32 = self;
  v34 = v7;
  [(BLSHLocalCountingAssertionAttributeHandler *)self entriesForCountingTarget:v7];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v57 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        __int16 v16 = [v15 service];

        if (v16 != v8)
        {
          v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[entry service] == service"];
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[BLSHLocalCountingSceneAssertionAttributeHandler sceneDidInvalidate:environment:](a2, (uint64_t)v32, (uint64_t)v30);
          }
          [v30 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x21FD71D38);
        }
        __int16 v17 = [v15 assertion];
        if (v17) {
          [v9 addObject:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v57 count:16];
    }
    while (v12);
  }
  v31 = v10;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v9;
  uint64_t v18 = [obj countByEnumeratingWithState:&v36 objects:v56 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    uint64_t v21 = *MEMORY[0x263F29920];
    uint64_t v22 = *MEMORY[0x263F08320];
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        v25 = bls_assertions_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v29 = [v33 identifier];
          *(_DWORD *)buf = 134219010;
          v47 = v32;
          __int16 v48 = 2114;
          v49 = v32;
          __int16 v50 = 2114;
          uint64_t v51 = v24;
          __int16 v52 = 2114;
          v53 = v34;
          __int16 v54 = 2114;
          v55 = v29;
          _os_log_debug_impl(&dword_21FCFC000, v25, OS_LOG_TYPE_DEBUG, "%p handler:%{public}@ will cancel assertion:%{public}@ due to invalidated scene:%{public}@ environment:%{public}@", buf, 0x34u);
        }
        v26 = (void *)MEMORY[0x263F087E8];
        uint64_t v44 = v22;
        v45 = @"scene invalidated";
        v27 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        v28 = [v26 errorWithDomain:v21 code:20 userInfo:v27];
        [v8 cancelAssertion:v24 withError:v28];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v56 count:16];
    }
    while (v19);
  }
}

- (void)activateWithFirstEntry:.cold.1()
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_2_5(&dword_21FCFC000, v0, v1, "%p handler:%{public}@ will activate for:%{public}@");
}

- (void)sceneIdentityTokenForEntry:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  v9 = @"BLSHLocalCountingSceneAssertionAttributeHandler.m";
  __int16 v10 = 1024;
  int v11 = 68;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)deactivateWithFinalEntry:.cold.1()
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_2_5(&dword_21FCFC000, v0, v1, "%p handler:%{public}@ will deactivate for:%{public}@");
}

- (void)sceneDidInvalidate:(uint64_t)a3 environment:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  v9 = @"BLSHLocalCountingSceneAssertionAttributeHandler.m";
  __int16 v10 = 1024;
  int v11 = 79;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end