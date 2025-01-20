@interface TKTokenService_Subsystem
+ (id)initForPlugInKit;
+ (void)initForPlugInKit;
@end

@implementation TKTokenService_Subsystem

+ (id)initForPlugInKit
{
  v3 = TK_LOG_token();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[TKTokenService_Subsystem initForPlugInKit]();
  }

  [MEMORY[0x1E4F292B0] _startListening];
  id v4 = objc_alloc_init((Class)a1);

  return v4;
}

+ (void)initForPlugInKit
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "TKTokenService_Subsystem initializing", v2, v3, v4, v5, v6);
}

@end