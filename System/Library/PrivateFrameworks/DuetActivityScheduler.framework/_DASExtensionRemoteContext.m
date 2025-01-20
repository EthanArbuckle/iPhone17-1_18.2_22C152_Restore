@interface _DASExtensionRemoteContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
+ (id)extensionRunnerClassAllowList;
- (OS_os_log)log;
- (_DASExtension)extension;
- (_DASExtensionRemoteContext)init;
- (id)createExtensionRunnerWithClassName:(id)a3;
- (id)hostContextWithError:(id *)a3;
- (void)performActivity:(id)a3;
- (void)setLog:(id)a3;
- (void)suspend;
@end

@implementation _DASExtensionRemoteContext

- (_DASExtensionRemoteContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DASExtensionRemoteContext;
  v2 = [(_DASExtensionRemoteContext *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "extensionContext");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;
  }
  return v2;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;

  return v2;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_48);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;

  return v2;
}

- (id)hostContextWithError:(id *)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  v5 = [(_DASExtensionRemoteContext *)self _auxiliaryConnection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___DASExtensionRemoteContext_hostContextWithError___block_invoke;
  v8[3] = &unk_1E61134F8;
  v8[4] = self;
  v8[5] = &v9;
  objc_super v6 = [v5 remoteObjectProxyWithErrorHandler:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (_DASExtension)extension
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39___DASExtensionRemoteContext_extension__block_invoke;
  block[3] = &unk_1E6112A70;
  block[4] = self;
  if (extension_onceToken != -1) {
    dispatch_once(&extension_onceToken, block);
  }
  return (_DASExtension *)(id)extension_extension;
}

- (id)createExtensionRunnerWithClassName:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = (NSString *)a3;
  if (!v4)
  {
    id v9 = 0;
    goto LABEL_16;
  }
  v5 = [(id)objc_opt_class() extensionRunnerClassAllowList];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    Class v7 = NSClassFromString(v4);
    if (v7)
    {
      v8 = v7;
      if ([(objc_class *)v7 conformsToProtocol:&unk_1F0E796C8])
      {
        id v9 = objc_alloc_init(v8);
        v10 = [(_DASExtensionRemoteContext *)self log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v12 = 138543362;
          v13 = v8;
          _os_log_impl(&dword_1B578B000, v10, OS_LOG_TYPE_INFO, "Created _DASExtensionRunner of class %{public}@", (uint8_t *)&v12, 0xCu);
        }
        goto LABEL_15;
      }
      v10 = [(_DASExtensionRemoteContext *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_DASExtensionRemoteContext createExtensionRunnerWithClassName:]();
      }
    }
    else
    {
      v10 = [(_DASExtensionRemoteContext *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_DASExtensionRemoteContext createExtensionRunnerWithClassName:]();
      }
    }
  }
  else
  {
    v10 = [(_DASExtensionRemoteContext *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_DASExtensionRemoteContext createExtensionRunnerWithClassName:]();
    }
  }
  id v9 = 0;
LABEL_15:

LABEL_16:

  return v9;
}

+ (id)extensionRunnerClassAllowList
{
  return &unk_1F0E6EBC0;
}

- (void)performActivity:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  char v6 = [v5 infoDictionary];
  Class v7 = [v6 objectForKeyedSubscript:@"ExtensionRunnerClass"];

  v8 = [(_DASExtensionRemoteContext *)self createExtensionRunnerWithClassName:v7];
  id v9 = [(_DASExtensionRemoteContext *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v4 name];
    *(_DWORD *)buf = 138412546;
    v19 = v10;
    __int16 v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1B578B000, v9, OS_LOG_TYPE_DEFAULT, "Remote extension performing activity %@ with runner %@.", buf, 0x16u);
  }
  uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int v12 = dispatch_queue_create("Extension Execution Queue", v11);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___DASExtensionRemoteContext_performActivity___block_invoke;
  block[3] = &unk_1E6113200;
  block[4] = self;
  id v16 = v8;
  id v17 = v4;
  id v13 = v4;
  id v14 = v8;
  dispatch_async(v12, block);
}

- (void)suspend
{
  os_log_t v3 = [(_DASExtensionRemoteContext *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B578B000, v3, OS_LOG_TYPE_DEFAULT, "Request for extension to stop activity", v5, 2u);
  }

  id v4 = [(_DASExtensionRemoteContext *)self extension];
  [v4 suspend];
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)createExtensionRunnerWithClassName:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1B578B000, v0, v1, "Info.plist key %{public}@ has value \"%{public}@\", but no class with that name was found.", v2, v3, v4, v5, 2u);
}

- (void)createExtensionRunnerWithClassName:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1B578B000, v0, v1, "Info.plist key %{public}@ has value \"%{public}@\", but that class doesn't conform to the MLBackgroundDataSource protocol", v2, v3, v4, v5, 2u);
}

- (void)createExtensionRunnerWithClassName:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_2(&dword_1B578B000, v0, v1, "Info.plist key %{public}@ has value \"%{public}@\", which is not an allowed extension runner class.", v2, v3, v4, v5, 2u);
}

@end