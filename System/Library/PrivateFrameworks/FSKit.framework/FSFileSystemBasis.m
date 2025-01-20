@interface FSFileSystemBasis
+ (void)wipeResource:(id)a3 extension:(id)a4 completionHandler:(id)a5;
- (FSModuleExtension)extension;
- (void)setExtension:(id)a3;
@end

@implementation FSFileSystemBasis

+ (void)wipeResource:(id)a3 extension:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = fskit_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[FSFileSystemBasis wipeResource:extension:completionHandler:](v10);
  }

  if (v8)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __62__FSFileSystemBasis_wipeResource_extension_completionHandler___block_invoke;
    v14[3] = &unk_26530B198;
    id v15 = v9;
    [v8 sendWipeResource:v7 replyHandler:v14];
    v11 = v15;
  }
  else
  {
    v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      +[FSFileSystemBasis wipeResource:extension:completionHandler:](v12);
    }

    v11 = fs_errorForPOSIXError(45);
    (*((void (**)(id, void *))v9 + 2))(v9, v11);
  }

  v13 = fskit_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[FSFileSystemBasis wipeResource:extension:completionHandler:](v13);
  }
}

uint64_t __62__FSFileSystemBasis_wipeResource_extension_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FSModuleExtension)extension
{
  return (FSModuleExtension *)objc_getProperty(self, a2, 8, 1);
}

- (void)setExtension:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)wipeResource:(os_log_t)log extension:completionHandler:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "+[FSFileSystemBasis wipeResource:extension:completionHandler:]";
  _os_log_debug_impl(&dword_24DDB2000, log, OS_LOG_TYPE_DEBUG, "%s:end", (uint8_t *)&v1, 0xCu);
}

+ (void)wipeResource:(os_log_t)log extension:completionHandler:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "+[FSFileSystemBasis wipeResource:extension:completionHandler:]";
  _os_log_fault_impl(&dword_24DDB2000, log, OS_LOG_TYPE_FAULT, "%s: no extension is available", (uint8_t *)&v1, 0xCu);
}

+ (void)wipeResource:(os_log_t)log extension:completionHandler:.cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "+[FSFileSystemBasis wipeResource:extension:completionHandler:]";
  _os_log_debug_impl(&dword_24DDB2000, log, OS_LOG_TYPE_DEBUG, "%s:start", (uint8_t *)&v1, 0xCu);
}

@end