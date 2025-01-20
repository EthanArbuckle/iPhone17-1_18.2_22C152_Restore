@interface FBSSceneClientIdentity
+ (BOOL)supportsSecureCoding;
+ (id)defaultIdentityForProcessIdentity:(id)a3;
+ (id)identityForBundleID:(id)a3;
+ (id)identityForInjectedEndpointToProcessIdentity:(id)a3;
+ (id)identityForManagedEndpointOfProcessIdentity:(id)a3;
+ (id)identityForProcessIdentity:(id)a3;
+ (id)localIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (BOOL)isValid;
- (BOOL)targetsClientEndpoint;
- (FBSSceneClientIdentity)initWithCoder:(id)a3;
- (NSString)description;
- (RBSProcessIdentity)processIdentity;
- (id)_initWithLocal:(BOOL)a3 direct:(BOOL)a4 identity:(id)a5 description:(id)a6;
- (id)bundleIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FBSSceneClientIdentity

- (BOOL)isLocal
{
  return self->_local;
}

- (BOOL)targetsClientEndpoint
{
  return self->_direct;
}

- (id)bundleIdentifier
{
  v2 = [(FBSSceneClientIdentity *)self processIdentity];
  v3 = [v2 embeddedApplicationIdentifier];

  return v3;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

+ (id)localIdentity
{
  v2 = [FBSSceneClientIdentity alloc];
  v3 = [MEMORY[0x1E4F96408] identityOfCurrentProcess];
  id v4 = [(FBSSceneClientIdentity *)v2 _initWithLocal:1 direct:0 identity:v3 description:0];

  return v4;
}

+ (id)identityForProcessIdentity:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"processIdentity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneClientIdentity identityForProcessIdentity:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  id v4 = v3;
  v5 = [MEMORY[0x1E4F96408] identityOfCurrentProcess];
  int v6 = [v4 isEqual:v5];

  if (v6) {
    +[FBSSceneClientIdentity localIdentity];
  }
  else {
  v7 = +[FBSSceneClientIdentity defaultIdentityForProcessIdentity:v4];
  }

  return v7;
}

+ (id)identityForInjectedEndpointToProcessIdentity:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"processIdentity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneClientIdentity identityForInjectedEndpointToProcessIdentity:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  id v4 = v3;
  id v5 = [[FBSSceneClientIdentity alloc] _initWithLocal:0 direct:0 identity:v3 description:0];

  return v5;
}

- (id)_initWithLocal:(BOOL)a3 direct:(BOOL)a4 identity:(id)a5 description:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)FBSSceneClientIdentity;
  v13 = [(FBSSceneClientIdentity *)&v23 init];
  v14 = v13;
  if (v13)
  {
    v13->_local = a3;
    v13->_direct = a4;
    p_processIdentity = (id *)&v13->_processIdentity;
    objc_storeStrong((id *)&v13->_processIdentity, a5);
    p_description = (uint64_t *)&v14->_description;
    objc_storeStrong((id *)&v14->_description, a6);
    description = v14->_description;
    if (!description)
    {
      if (v14->_local)
      {
        uint64_t *p_description = @"local-sync";
      }
      else if (v14->_direct)
      {
        v18 = NSString;
        description = [*p_processIdentity description];
        uint64_t v19 = [v18 stringWithFormat:@"%@:%@", description, @"com.apple.frontboard.workspace-service"];
        v20 = (void *)*p_description;
        uint64_t *p_description = v19;
      }
      else
      {
        uint64_t v21 = [*p_processIdentity description];
        description = (void *)*p_description;
        uint64_t *p_description = v21;
      }
    }
  }

  return v14;
}

+ (id)defaultIdentityForProcessIdentity:(id)a3
{
  return +[FBSSceneClientIdentity identityForInjectedEndpointToProcessIdentity:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processIdentity, 0);

  objc_storeStrong((id *)&self->_description, 0);
}

- (BOOL)isValid
{
  return self->_local || self->_processIdentity != 0;
}

+ (id)identityForBundleID:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"bundleID"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneClientIdentity identityForBundleID:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  id v4 = v3;
  uint64_t v5 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:v3];
  if (!v5)
  {
    v10 = [NSString stringWithFormat:@"failed to get an RBSProcessIdentity for bundleID=%@", v4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneClientIdentity identityForBundleID:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
  }
  int v6 = (void *)v5;
  v7 = +[FBSSceneClientIdentity identityForProcessIdentity:v5];

  return v7;
}

+ (id)identityForManagedEndpointOfProcessIdentity:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"processIdentity"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSSceneClientIdentity identityForManagedEndpointOfProcessIdentity:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  id v4 = v3;
  id v5 = [[FBSSceneClientIdentity alloc] _initWithLocal:0 direct:1 identity:v3 description:0];

  return v5;
}

- (NSString)description
{
  return self->_description;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FBSSceneClientIdentity *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      BSEqualBools();
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = [(FBSSceneClientIdentity *)self description];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_local)
  {
    [v4 encodeBool:1 forKey:@"local"];
    id v4 = v5;
  }
  if (self->_direct)
  {
    [v5 encodeBool:1 forKey:@"direct"];
    id v4 = v5;
  }
  [v4 encodeObject:self->_processIdentity forKey:@"identity"];
  [v5 encodeObject:self->_description forKey:@"desc"];
}

- (FBSSceneClientIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"local"];
  uint64_t v6 = [v4 decodeBoolForKey:@"direct"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identity"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desc"];

  v9 = [(FBSSceneClientIdentity *)self _initWithLocal:v5 direct:v6 identity:v7 description:v8];
  return v9;
}

+ (void)identityForBundleID:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)identityForBundleID:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)identityForProcessIdentity:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)identityForInjectedEndpointToProcessIdentity:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)identityForManagedEndpointOfProcessIdentity:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end