@interface CAMPreferencesUtilities
+ (BOOL)BOOLInCameraDomainForKey:(id)a3;
+ (double)doubleForKey:(id)a3 applicationID:(id)a4 keyIsValidAndExists:(BOOL *)a5;
+ (id)colorForKey:(id)a3 applicationID:(id)a4;
+ (id)numericDictionaryForKey:(id)a3 defaults:(id)a4;
+ (void)setDictionary:(id)a3 forKey:(id)a4 defaults:(id)a5;
@end

@implementation CAMPreferencesUtilities

+ (double)doubleForKey:(id)a3 applicationID:(id)a4 keyIsValidAndExists:(BOOL *)a5
{
  v6 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  double v7 = 0.0;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v6 doubleValue];
    double v7 = v8;
    BOOL v9 = 1;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v9 = 0;
  if (a5) {
LABEL_6:
  }
    *a5 = v9;
LABEL_7:

  return v7;
}

+ (id)colorForKey:(id)a3 applicationID:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = [v5 count];
    if ((unint64_t)(v6 - 3) > 1)
    {
LABEL_13:
      v13 = 0;
    }
    else
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      char v9 = 0;
      double v16 = 1.0;
      do
      {
        v10 = [v5 objectAtIndexedSubscript:v8];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_13;
        }
        [v10 doubleValue];
        v15[v8] = v11;
        v9 |= v11 > 1.0;

        ++v8;
      }
      while (v7 != v8);
      if (v9)
      {
        v12 = v15;
        do
        {
          double *v12 = *v12 / 255.0;
          ++v12;
          --v7;
        }
        while (v7);
      }
      v13 = [MEMORY[0x263F825C8] colorWithRed:v15[0] green:v15[1] blue:v15[2] alpha:v16];
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)BOOLInCameraDomainForKey:(id)a3
{
  return CFPreferencesGetAppBooleanValue((CFStringRef)a3, @"com.apple.camera", 0) != 0;
}

+ (id)numericDictionaryForKey:(id)a3 defaults:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 objectForKey:v5];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    char v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    id v14 = 0;
    v10 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v9 fromData:v6 error:&v14];
    id v11 = v14;
    if (v11)
    {
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[CAMPreferencesUtilities numericDictionaryForKey:defaults:]();
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)setDictionary:(id)a3 forKey:(id)a4 defaults:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v12 = 0;
  char v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
  id v10 = v12;
  if (v10)
  {
    id v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CAMPreferencesUtilities setDictionary:forKey:defaults:]();
    }
  }
  else if (v9)
  {
    [v8 setObject:v9 forKey:v7];
  }
}

+ (void)numericDictionaryForKey:defaults:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to read dictionary for key %{public}@: %{public}@");
}

+ (void)setDictionary:forKey:defaults:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to persist dictionary for key %{public}@: %{public}@");
}

@end