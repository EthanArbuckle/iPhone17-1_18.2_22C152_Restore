@interface FBSWorkspaceScenesClientIdentifier
+ (FBSWorkspaceScenesClientIdentifier)identifierWithHostEndpoint:(uint64_t)a1;
+ (FBSWorkspaceScenesClientIdentifier)identifierWithPeer:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)tokenWithIdentity:(uint64_t)a1;
- (unint64_t)hash;
@end

@implementation FBSWorkspaceScenesClientIdentifier

- (id)tokenWithIdentity:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*(void *)(a1 + 16))
    {
      uint64_t v5 = *(unsigned int *)(a1 + 32);
      v6 = [MEMORY[0x1E4F96408] identityOfCurrentProcess];
      v7 = [v4 internalWorkspaceIdentifier];
      v8 = [v4 identifier];
      v9 = +[FBSSceneIdentityToken tokenWithHostPID:v5 directEndpointTarget:v6 workspace:v7 identifier:v8];
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 8);
      v6 = [v3 internalWorkspaceIdentifier];
      v7 = [v4 identifier];
      v9 = +[FBSSceneIdentityToken tokenWithHostEndpoint:v10 workspace:v6 identifier:v7];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  hostEndpoint = self->_hostEndpoint;
  if (!hostEndpoint) {
    hostEndpoint = self->_peer;
  }
  return [(BSServiceConnectionEndpoint *)hostEndpoint hash];
}

+ (FBSWorkspaceScenesClientIdentifier)identifierWithHostEndpoint:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (!v2)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"hostEndpoint"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSWorkspaceScenesClientIdentifier identifierWithHostEndpoint:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  id v3 = objc_alloc_init(FBSWorkspaceScenesClientIdentifier);
  uint64_t v4 = [v2 copy];
  hostEndpoint = v3->_hostEndpoint;
  v3->_hostEndpoint = (BSServiceConnectionEndpoint *)v4;

  peer = v3->_peer;
  v3->_peer = 0;

  v7 = [v2 instance];
  if (v7)
  {
    v8 = NSString;
    v9 = [v2 targetDescription];
    uint64_t v10 = [v8 stringWithFormat:@"%@:%@", v9, v7];
    description = v3->_description;
    v3->_description = (NSString *)v10;
  }
  else
  {
    uint64_t v12 = [v2 targetDescription];
    v9 = v3->_description;
    v3->_description = (NSString *)v12;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_peer, 0);

  objc_storeStrong((id *)&self->_hostEndpoint, 0);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FBSWorkspaceScenesClientIdentifier *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      BSEqualObjects();
    }
    BOOL v6 = 0;
  }

  return v6;
}

+ (FBSWorkspaceScenesClientIdentifier)identifierWithPeer:(uint64_t)a1
{
  id v3 = a2;
  self;
  if (!v3)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"peer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSWorkspaceScenesClientIdentifier identifierWithPeer:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  uint64_t v4 = [v3 remoteToken];
  uint64_t v5 = [v4 pid];

  if ((int)v5 < 1)
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = objc_alloc_init(FBSWorkspaceScenesClientIdentifier);
    hostEndpoint = v6->_hostEndpoint;
    v6->_hostEndpoint = 0;

    objc_storeStrong((id *)&v6->_peer, a2);
    v6->_host = v5;
    uint64_t v8 = [NSString stringWithFormat:@"%i(%p)", v5, v3];
    description = v6->_description;
    v6->_description = (NSString *)v8;
  }

  return v6;
}

- (id)description
{
  return self->_description;
}

+ (void)identifierWithHostEndpoint:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)identifierWithPeer:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end