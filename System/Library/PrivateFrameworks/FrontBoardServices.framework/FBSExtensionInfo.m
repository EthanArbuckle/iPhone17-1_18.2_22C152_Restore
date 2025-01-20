@interface FBSExtensionInfo
- (NSString)extensionIdentifier;
- (NSString)typeIdentifier;
- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4;
- (id)_initWithBundleProxy:(id)a3 url:(id)a4;
- (id)_initWithPlugInKitProxy:(id)a3;
@end

@implementation FBSExtensionInfo

- (id)_initWithBundleIdentifier:(id)a3 url:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [NSString stringWithFormat:@"this is initializer is unavailable"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = NSStringFromSelector(a2);
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    v14 = v10;
    __int16 v15 = 2114;
    v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    v20 = @"FBSExtensionInfo.m";
    __int16 v21 = 1024;
    int v22 = 17;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
}

- (id)_initWithBundleProxy:(id)a3 url:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"proxy must be of type LSPlugInKitProxy : proxy=%@", v7];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSExtensionInfo _initWithBundleProxy:url:](a2, (uint64_t)self, (uint64_t)v11);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
  }
  id v9 = [(FBSExtensionInfo *)self _initWithPlugInKitProxy:v7];

  return v9;
}

- (id)_initWithPlugInKitProxy:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    __int16 v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"proxy"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(FBSExtensionInfo *)a2 _initWithPlugInKitProxy:(uint64_t)v15];
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
  }
  v6 = v5;
  v16.receiver = self;
  v16.super_class = (Class)FBSExtensionInfo;
  id v7 = [(FBSBundleInfo *)&v16 _initWithBundleProxy:v5 overrideURL:0];
  if (v7)
  {
    id v8 = [v6 protocol];
    uint64_t v9 = [v8 copy];
    v10 = (void *)v7[8];
    v7[8] = v9;

    v11 = [v6 pluginIdentifier];
    uint64_t v12 = [v11 copy];
    int v13 = (void *)v7[9];
    v7[9] = v12;
  }
  return v7;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);

  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

- (void)_initWithBundleProxy:(uint64_t)a3 url:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"FBSExtensionInfo.m";
  __int16 v10 = 1024;
  int v11 = 22;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_initWithPlugInKitProxy:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"FBSExtensionInfo.m";
  __int16 v10 = 1024;
  int v11 = 27;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end