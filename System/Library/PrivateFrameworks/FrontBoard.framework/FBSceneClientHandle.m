@interface FBSceneClientHandle
+ (id)handleForScene:(id)a3 clientProcess:(id)a4;
- (FBProcess)legacyProcess;
- (FBSSceneClientIdentity)identity;
- (NSString)bundleIdentifier;
- (RBSProcessHandle)processHandle;
- (id)description;
@end

@implementation FBSceneClientHandle

- (RBSProcessHandle)processHandle
{
  return [(FBProcess *)self->_legacyProcess rbsHandle];
}

- (FBSSceneClientIdentity)identity
{
  return self->_identity;
}

+ (id)handleForScene:(id)a3 clientProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      +[FBSceneClientHandle handleForScene:clientProcess:](a2);
    }
    }
LABEL_19:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A632381CLL);
  }
  v8 = v7;
  v9 = [v7 rbsHandle];
  if (!-[FBScene _isLegacy]((BOOL)v6) || v9)
  {
    NSClassFromString(&cfstr_Rbsprocesshand.isa);
    if (!v9)
    {
      v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        +[FBSceneClientHandle handleForScene:clientProcess:](a2);
      }
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6323880);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSProcessHandleClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        +[FBSceneClientHandle handleForScene:clientProcess:](a2);
      }
      }
      goto LABEL_19;
    }
  }

  v10 = objc_alloc_init(FBSceneClientHandle);
  if (v10)
  {
    v11 = [v6 definition];
    uint64_t v12 = [v11 clientIdentity];
    identity = v10->_identity;
    v10->_identity = (FBSSceneClientIdentity *)v12;

    objc_storeStrong((id *)&v10->_legacyProcess, a4);
  }

  return v10;
}

- (NSString)bundleIdentifier
{
  return [(FBProcess *)self->_legacyProcess bundleIdentifier];
}

- (id)description
{
  v2 = [(FBSceneClientHandle *)self processHandle];
  v3 = [v2 description];

  return v3;
}

- (FBProcess)legacyProcess
{
  return self->_legacyProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

+ (void)handleForScene:(const char *)a1 clientProcess:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)handleForScene:(const char *)a1 clientProcess:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end