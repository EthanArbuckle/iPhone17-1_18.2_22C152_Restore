@interface FBSBundleInfo
- (FBSBundleInfo)init;
- (NSString)bundleIdentifier;
- (NSString)bundleType;
- (NSString)bundleVersion;
- (NSString)debugDescription;
- (NSString)displayName;
- (NSURL)bundleURL;
- (NSUUID)cacheGUID;
- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4;
- (id)_initWithBundleProxy:(id)a3 bundleIdentifier:(id)a4 url:(id)a5;
- (id)_initWithBundleProxy:(id)a3 overrideURL:(id)a4;
- (id)applicationIdentity;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)sequenceNumber;
@end

@implementation FBSBundleInfo

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSUUID)cacheGUID
{
  return self->_cacheGUID;
}

- (FBSBundleInfo)init
{
  return (FBSBundleInfo *)[(FBSBundleInfo *)self _initWithBundleProxy:0 bundleIdentifier:0 url:0];
}

- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4
{
  return [(FBSBundleInfo *)self _initWithBundleProxy:0 bundleIdentifier:a3 url:a4];
}

- (id)_initWithBundleProxy:(id)a3 overrideURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"proxy"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSBundleInfo _initWithBundleProxy:overrideURL:](a2);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }
  v9 = v8;
  v10 = [v7 bundleIdentifier];
  if (v9)
  {
    id v11 = [(FBSBundleInfo *)self _initWithBundleProxy:v7 bundleIdentifier:v10 url:v9];
  }
  else
  {
    v12 = [v7 bundleURL];
    id v11 = [(FBSBundleInfo *)self _initWithBundleProxy:v7 bundleIdentifier:v10 url:v12];
  }
  return v11;
}

- (id)_initWithBundleProxy:(id)a3 bundleIdentifier:(id)a4 url:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"bundleIdentifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSBundleInfo _initWithBundleProxy:bundleIdentifier:url:](a2);
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
  }
  v12 = v11;
  if (!v11)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"bundleURL"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSBundleInfo _initWithBundleProxy:bundleIdentifier:url:](a2);
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
  }
  v33.receiver = self;
  v33.super_class = (Class)FBSBundleInfo;
  v13 = [(FBSBundleInfo *)&v33 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    bundleIdentifier = v13->_bundleIdentifier;
    v13->_bundleIdentifier = (NSString *)v14;

    uint64_t v16 = [v12 copy];
    bundleURL = v13->_bundleURL;
    v13->_bundleURL = (NSURL *)v16;

    v18 = [v9 localizedName];
    uint64_t v19 = [v18 copy];
    displayName = v13->_displayName;
    v13->_displayName = (NSString *)v19;

    v21 = [v9 bundleVersion];
    uint64_t v22 = [v21 copy];
    bundleVersion = v13->_bundleVersion;
    v13->_bundleVersion = (NSString *)v22;

    v24 = [v9 bundleType];
    uint64_t v25 = [v24 copy];
    bundleType = v13->_bundleType;
    v13->_bundleType = (NSString *)v25;

    v13->_sequenceNumber = [v9 sequenceNumber];
    v27 = [v9 cacheGUID];
    uint64_t v28 = [v27 copy];
    cacheGUID = v13->_cacheGUID;
    v13->_cacheGUID = (NSUUID *)v28;
  }
  return v13;
}

- (id)applicationIdentity
{
  v4 = [NSString stringWithFormat:@"Must be implemented by subclass"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSBundleInfo.m";
    __int16 v16 = 1024;
    int v17 = 76;
    __int16 v18 = 2114;
    uint64_t v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (NSString)debugDescription
{
  return (NSString *)[(FBSBundleInfo *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSBundleInfo *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [off_1E58F44F0 builderWithObject:self];
  v4 = NSString;
  v5 = [(FBSBundleInfo *)self bundleIdentifier];
  v6 = [(FBSBundleInfo *)self displayName];
  id v7 = [v4 stringWithFormat:@"%@ (%@)", v5, v6];
  id v8 = (id)[v3 appendObject:v7 withName:0];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSBundleInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (NSString)bundleType
{
  return self->_bundleType;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheGUID, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleType, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)_initWithBundleProxy:(const char *)a1 overrideURL:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithBundleProxy:(const char *)a1 bundleIdentifier:url:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithBundleProxy:(const char *)a1 bundleIdentifier:url:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end