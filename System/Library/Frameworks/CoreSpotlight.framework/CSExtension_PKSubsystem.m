@interface CSExtension_PKSubsystem
+ (id)initForPlugInKit;
+ (id)sharedInstance;
+ (void)initForPlugInKit;
- (id)principleClassFromDictionary:(id)a3;
- (void)beginUsing:(id)a3 withBundle:(id)a4;
- (void)endUsing:(id)a3;
@end

@implementation CSExtension_PKSubsystem

- (id)principleClassFromDictionary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKeyedSubscript:@"NSExtensionPrincipalClass"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  v4 = 0;
LABEL_5:

  return v4;
}

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 bundleInfoDictionary];
  v9 = [v8 objectForKeyedSubscript:@"NSExtension"];
  v10 = [(CSExtension_PKSubsystem *)self principleClassFromDictionary:v9];

  if (!v10)
  {
    v11 = [v7 infoDictionary];
    v10 = [(CSExtension_PKSubsystem *)self principleClassFromDictionary:v11];
  }
  if ([v10 length]) {
    objc_getClass((const char *)[v10 UTF8String]);
  }
  v12 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CSExtension_PKSubsystem beginUsing:withBundle:](v6, v7, v12);
  }

  [MEMORY[0x1E4F292B0] _startListening:0];
}

- (void)endUsing:(id)a3
{
  id v3 = a3;
  v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CSExtension_PKSubsystem endUsing:](v3, v4);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CSExtension_PKSubsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  v2 = (void *)sharedInstance_sSharedInstance;

  return v2;
}

+ (id)initForPlugInKit
{
  v2 = [a1 sharedInstance];
  id v3 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[CSExtension_PKSubsystem initForPlugInKit];
  }

  return v2;
}

- (void)beginUsing:(NSObject *)a3 withBundle:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 identifier];
  uint64_t v6 = [a2 bundleIdentifier];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_18D0E3000, a3, OS_LOG_TYPE_DEBUG, "beginUsing using %@ %@", (uint8_t *)&v7, 0x16u);
}

- (void)endUsing:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 identifier];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "endUsing, %@", v4, 0xCu);
}

+ (void)initForPlugInKit
{
}

@end