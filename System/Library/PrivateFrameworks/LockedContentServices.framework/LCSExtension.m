@interface LCSExtension
+ (LCSExtension)extensionWithHostConfiguration:(id)a3;
+ (LCSExtension)extensionWithIdentity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LSApplicationExtensionRecord)applicationExtensionRecord;
- (NSString)bundleIdentifier;
- (NSString)containerBundleIdentifier;
- (NSString)localizedDisplayName;
- (RBSProcessIdentity)processIdentity;
- (_EXExtensionIdentity)identity;
- (_EXHostConfiguration)hostConfiguration;
- (id)_initWithHostConfiguration:(id)a3;
- (unint64_t)visibilityOverride;
@end

@implementation LCSExtension

- (NSString)bundleIdentifier
{
  return (NSString *)[(_EXExtensionIdentity *)self->_identity bundleIdentifier];
}

- (id)_initWithHostConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"hostConfiguration"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[LCSExtension _initWithHostConfiguration:]();
    }
LABEL_19:
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x255091108);
  }
  v6 = v5;
  v7 = [v5 extensionIdentity];
  uint64_t v8 = [v6 rbsProcessIdentity];
  if (!v7)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[LCSExtension _initWithHostConfiguration:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25509116CLL);
  }
  v9 = (void *)v8;
  v10 = [v7 uniqueIdentifier];

  if (!v10)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[identity uniqueIdentifier]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[LCSExtension _initWithHostConfiguration:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2550911D0);
  }
  if (!v9)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"processIdentity"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[LCSExtension _initWithHostConfiguration:].cold.4();
    }
    goto LABEL_19;
  }
  v20.receiver = self;
  v20.super_class = (Class)LCSExtension;
  v11 = [(LCSExtension *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identity, v7);
    uint64_t v13 = [v7 uniqueIdentifier];
    identityUUID = v12->_identityUUID;
    v12->_identityUUID = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_processIdentity, v9);
    objc_storeStrong((id *)&v12->_hostConfiguration, a3);
    id v15 = [(LCSExtension *)v12 applicationExtensionRecord];
  }

  return v12;
}

+ (LCSExtension)extensionWithHostConfiguration:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 rbsProcessIdentity];
    if (v5)
    {
      id v6 = [[LCSExtension alloc] _initWithHostConfiguration:v4];
    }
    else
    {
      v7 = LCSLogExtension();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[LCSExtension extensionWithHostConfiguration:]((uint64_t)v4, v7);
      }

      id v6 = 0;
    }

    return (LCSExtension *)v6;
  }
  else
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"hostConfiguration"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[LCSExtension extensionWithHostConfiguration:]();
    }
    [v9 UTF8String];
    result = (LCSExtension *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (LCSExtension)extensionWithIdentity:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Exextensionide.isa);
  if (!v4)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[LCSExtension extensionWithIdentity:]();
    }
LABEL_11:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x255091460);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:_EXExtensionIdentityClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[LCSExtension extensionWithIdentity:]();
    }
    goto LABEL_11;
  }

  id v5 = (void *)[objc_alloc(MEMORY[0x263F04DD8]) initWithExtensionIdentity:v4];
  id v6 = [a1 extensionWithHostConfiguration:v5];

  return (LCSExtension *)v6;
}

- (LSApplicationExtensionRecord)applicationExtensionRecord
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(_EXExtensionIdentity *)self->_identity applicationExtensionRecord];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = 0;
  }
  else if (self->_identityUUID)
  {
    id v7 = objc_alloc(MEMORY[0x263F01858]);
    identityUUID = self->_identityUUID;
    id v18 = 0;
    id v5 = (void *)[v7 initWithUUID:identityUUID error:&v18];
    id v6 = v18;
  }
  else
  {
    id v6 = 0;
    id v5 = 0;
  }
  uint64_t v9 = [(_EXExtensionIdentity *)self->_identity bundleIdentifier];
  v10 = (void *)v9;
  if (v5) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (!v11)
  {
    id v17 = v6;
    id v5 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v9 error:&v17];
    id v12 = v17;

    id v6 = v12;
  }
  if (!v5)
  {
    uint64_t v13 = LCSLogExtension();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      identity = self->_identity;
      *(_DWORD *)buf = 134218498;
      objc_super v20 = self;
      __int16 v21 = 2114;
      v22 = identity;
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_error_impl(&dword_255087000, v13, OS_LOG_TYPE_ERROR, "%p Failure in application extensionRecord for identity %{public}@: %{public}@", buf, 0x20u);
    }
  }
  os_unfair_lock_unlock(p_lock);
  id v14 = v5;

  return (LSApplicationExtensionRecord *)v14;
}

- (NSString)containerBundleIdentifier
{
  v2 = [(LCSExtension *)self applicationExtensionRecord];
  id v3 = [v2 containingBundleRecord];
  uint64_t v4 = [v3 bundleIdentifier];

  return (NSString *)v4;
}

- (NSString)localizedDisplayName
{
  localizedDisplayName = self->_localizedDisplayName;
  if (!localizedDisplayName)
  {
    uint64_t v4 = [(LCSExtension *)self applicationExtensionRecord];
    id v5 = [v4 containingBundleRecord];
    uint64_t v6 = objc_opt_class();
    id v7 = v5;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    id v9 = v8;

    if (v9)
    {
      v10 = [v9 localizedName];
    }
    else
    {
      v10 = 0;
    }
    BOOL v11 = (NSString *)[v10 copy];
    id v12 = self->_localizedDisplayName;
    self->_localizedDisplayName = v11;

    localizedDisplayName = self->_localizedDisplayName;
  }
  return localizedDisplayName;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LCSExtension *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(NSUUID *)self->_identityUUID isEqual:v4->_identityUUID]
      && [(RBSProcessIdentity *)self->_processIdentity isEqual:v4->_processIdentity]
      && [(_EXHostConfiguration *)self->_hostConfiguration isEqual:v4->_hostConfiguration])
    {
      char v5 = [(_EXExtensionIdentity *)self->_identity isEqual:v4->_identity];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)visibilityOverride
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  int v3 = MGGetBoolAnswer();
  int v4 = MGGetBoolAnswer();
  char v5 = [(LCSExtension *)self bundleIdentifier];
  uint64_t v6 = [(LCSExtension *)self containerBundleIdentifier];
  if (v6)
  {
    id v40 = 0;
    id v7 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v6 allowPlaceholder:0 error:&v40];
    uint64_t v8 = v40;
    if (v8)
    {
      id v9 = LCSLogExtension();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v42 = self;
        __int16 v43 = 2114;
        v44 = v6;
        __int16 v45 = 2114;
        v46 = v8;
        _os_log_error_impl(&dword_255087000, v9, OS_LOG_TYPE_ERROR, "%p Failure in retrieving the bundle record for %{public}@: %{public}@", buf, 0x20u);
      }
      unint64_t v10 = 0;
    }
    else
    {
      v39 = v5;
      id v9 = [v7 infoDictionary];
      v38 = v7;
      BOOL v11 = [v7 entitlements];
      id v12 = self;
      v37 = v11;
      uint64_t v13 = [v11 objectForKey:@"com.apple.springboard.allowIconVisibilityChanges" ofClass:v12];
      int v14 = [v13 BOOLValue];

      id v15 = self;
      v16 = [v9 objectForKey:@"SBIconVisibilitySetByAppPreference" ofClass:v15];
      LODWORD(v11) = [v16 BOOLValue];

      if (v11)
      {
        id v17 = self;
        id v18 = [v9 objectForKey:@"SBIconVisibilityDefaultVisible" ofClass:v17];

        if ((v3 | v4 | v14) == 1)
        {
          if (v18)
          {
            unint64_t v10 = 1;
          }
          else
          {
            uint64_t v19 = objc_opt_class();
            objc_super v20 = [v9 objectForKey:@"SBIconVisibilityDefaultVisibleInstallTypes" ofClass:v19 valuesOfClass:objc_opt_class()];
            v36 = v20;
            if (v20)
            {
              __int16 v21 = @"user";
              if (v4) {
                __int16 v21 = @"carrier";
              }
              if (v3) {
                v22 = @"internal";
              }
              else {
                v22 = v21;
              }
              int v23 = [v20 containsObject:v22];
            }
            else
            {
              int v23 = 0;
            }
            uint64_t v24 = objc_opt_class();
            uint64_t v25 = [v9 objectForKey:@"SBIconVisibilityDefaultVisiblePlatforms" ofClass:v24 valuesOfClass:objc_opt_class()];
            if (v25)
            {
              v26 = (void *)MGCopyAnswer();
              v23 |= [v25 containsObject:v26];
            }
            v27 = [v9 objectForKey:@"SBIconVisibilityDefaultVisibleFeatureFlag" ofClass:objc_opt_class()];
            v28 = v27;
            if (v27)
            {
              int v29 = v23;
              v30 = [v27 componentsSeparatedByString:@"/"];
              if ([v30 count] == 2)
              {
                v31 = [v30 objectAtIndex:0];
                v32 = [v30 objectAtIndex:1];
                id v33 = v31;
                [v33 UTF8String];
                id v34 = v32;
                [v34 UTF8String];
                v29 |= _os_feature_enabled_impl();
              }
              int v23 = v29;
            }
            if (v23) {
              unint64_t v10 = 1;
            }
            else {
              unint64_t v10 = 2;
            }
          }
        }
        else
        {
          unint64_t v10 = 0;
        }
      }
      else
      {
        unint64_t v10 = 0;
      }

      id v7 = v38;
      char v5 = v39;
    }
  }
  else
  {
    uint64_t v8 = LCSLogExtension();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v42 = self;
      __int16 v43 = 2114;
      v44 = v5;
      _os_log_impl(&dword_255087000, v8, OS_LOG_TYPE_DEFAULT, "%p Failure in retrieving the bundle record for extension: %{public}@ because container app can't be determined", buf, 0x16u);
    }
    unint64_t v10 = 0;
  }

  return v10;
}

- (_EXExtensionIdentity)identity
{
  return self->_identity;
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (_EXHostConfiguration)hostConfiguration
{
  return self->_hostConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identityUUID, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)_initWithHostConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_255087000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithHostConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_255087000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithHostConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_255087000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithHostConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_255087000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)extensionWithHostConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_255087000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)extensionWithHostConfiguration:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_255087000, a2, OS_LOG_TYPE_ERROR, "Failed to lookup processIdentity for %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)extensionWithIdentity:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  int v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_255087000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end