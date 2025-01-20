@interface CTLogging
+ (id)appHandle;
+ (id)contextKitHandle;
+ (id)domainHandle;
@end

@implementation CTLogging

+ (id)appHandle
{
  if (appHandle_onceToken != -1) {
    dispatch_once(&appHandle_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)appHandle_handle;
  return v2;
}

uint64_t __22__CTLogging_appHandle__block_invoke()
{
  appHandle_handle = (uint64_t)os_log_create("com.apple.CTCategories", "App");
  return MEMORY[0x270F9A758]();
}

+ (id)domainHandle
{
  if (domainHandle_onceToken != -1) {
    dispatch_once(&domainHandle_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)domainHandle_handle;
  return v2;
}

uint64_t __25__CTLogging_domainHandle__block_invoke()
{
  domainHandle_handle = (uint64_t)os_log_create("com.apple.CTCategories", "Domain");
  return MEMORY[0x270F9A758]();
}

+ (id)contextKitHandle
{
  if (contextKitHandle_onceToken != -1) {
    dispatch_once(&contextKitHandle_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)contextKitHandle_handle;
  return v2;
}

uint64_t __29__CTLogging_contextKitHandle__block_invoke()
{
  contextKitHandle_handle = (uint64_t)os_log_create("com.apple.CTCategories", "ContextKit");
  return MEMORY[0x270F9A758]();
}

@end