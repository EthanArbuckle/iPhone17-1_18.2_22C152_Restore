@interface LSApplicationRecord(VSAdditions)
+ (id)vs_applicationRecordWithBundleIdentifier:()VSAdditions;
+ (id)vs_applicationRecordWithBundleURL:()VSAdditions;
+ (id)vs_applicationRecordWithStoreItemIdentifier:()VSAdditions;
@end

@implementation LSApplicationRecord(VSAdditions)

+ (id)vs_applicationRecordWithBundleURL:()VSAdditions
{
  id v3 = a3;
  id v10 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithURL:v3 allowPlaceholder:1 error:&v10];
  id v5 = v10;
  v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    v8 = VSErrorLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[LSApplicationRecord(VSAdditions) vs_applicationRecordWithBundleURL:]();
    }
  }

  return v4;
}

+ (id)vs_applicationRecordWithStoreItemIdentifier:()VSAdditions
{
  id v10 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithStoreItemIdentifier:a3 error:&v10];
  id v5 = v10;
  v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    v8 = VSErrorLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[LSApplicationRecord(VSAdditions) vs_applicationRecordWithStoreItemIdentifier:v8];
    }
  }

  return v4;
}

+ (id)vs_applicationRecordWithBundleIdentifier:()VSAdditions
{
  id v3 = a3;
  id v10 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v10];
  id v5 = v10;
  v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    v8 = VSErrorLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[LSApplicationRecord(VSAdditions) vs_applicationRecordWithBundleIdentifier:]();
    }
  }

  return v4;
}

+ (void)vs_applicationRecordWithBundleURL:()VSAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DA674000, v0, v1, "Unable to fetch valid app record from bundle URL: %@, %@");
}

+ (void)vs_applicationRecordWithStoreItemIdentifier:()VSAdditions .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_1DA674000, a2, a3, "Unable to fetch valid app record from store item identifier: %llu, %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

+ (void)vs_applicationRecordWithBundleIdentifier:()VSAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DA674000, v0, v1, "Unable to fetch valid app record from bundle ID: %@, %@");
}

@end