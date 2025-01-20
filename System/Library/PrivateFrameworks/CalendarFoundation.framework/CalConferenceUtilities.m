@interface CalConferenceUtilities
+ (BOOL)conferenceURLHasAllowedScheme:(id)a3;
+ (id)_logHandle;
@end

@implementation CalConferenceUtilities

+ (BOOL)conferenceURLHasAllowedScheme:(id)a3
{
  id v3 = a3;
  if (conferenceURLHasAllowedScheme__onceToken != -1) {
    dispatch_once(&conferenceURLHasAllowedScheme__onceToken, &__block_literal_global_18);
  }
  v4 = [v3 scheme];
  v5 = [v4 lowercaseString];

  if (([(id)conferenceURLHasAllowedScheme__alwaysAllowedSchemes containsObject:v5] & 1) == 0)
  {
    if ([v5 isEqualToString:@"file"])
    {
      BOOL v6 = 0;
      goto LABEL_17;
    }
    id v12 = 0;
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F22408]) initWithURL:v3 error:&v12];
    id v8 = v12;
    v9 = v8;
    if (v7)
    {
      v10 = [v7 bundleRecord];
      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v6 = [v10 developerType] == 3;
LABEL_15:

LABEL_16:
          goto LABEL_17;
        }
      }
    }
    else
    {
      if (!v8)
      {
        BOOL v6 = 0;
        goto LABEL_16;
      }
      v10 = [(id)objc_opt_class() _logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[CalConferenceUtilities conferenceURLHasAllowedScheme:]((uint64_t)v9, v10);
      }
    }
    BOOL v6 = 0;
    goto LABEL_15;
  }
  BOOL v6 = 1;
LABEL_17:

  return v6;
}

uint64_t __56__CalConferenceUtilities_conferenceURLHasAllowedScheme___block_invoke()
{
  conferenceURLHasAllowedScheme__alwaysAllowedSchemes = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EE0D4588];

  return MEMORY[0x1F41817F8]();
}

+ (id)_logHandle
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CalConferenceUtilities__logHandle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_logHandle_onceToken != -1) {
    dispatch_once(&_logHandle_onceToken, block);
  }
  v2 = (void *)_logHandle_logHandle;

  return v2;
}

void __36__CalConferenceUtilities__logHandle__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.CalendarFoundation", (const char *)[v3 UTF8String]);
  v2 = (void *)_logHandle_logHandle;
  _logHandle_logHandle = (uint64_t)v1;
}

+ (void)conferenceURLHasAllowedScheme:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Error getting claim binding for URL, error: %@", (uint8_t *)&v2, 0xCu);
}

@end