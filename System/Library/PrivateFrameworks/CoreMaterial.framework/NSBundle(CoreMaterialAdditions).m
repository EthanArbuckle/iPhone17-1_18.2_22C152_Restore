@interface NSBundle(CoreMaterialAdditions)
+ (id)coreMaterialOverrideRecipeBundle;
+ (id)coreMaterialOverrideRecipeBundleURL;
+ (void)_setCoreMaterialOverrideRecipeBundleURL:()CoreMaterialAdditions;
@end

@implementation NSBundle(CoreMaterialAdditions)

+ (id)coreMaterialOverrideRecipeBundle
{
  uint64_t v1 = __coreMaterialOverrideRecipeBundle;
  if (!__coreMaterialOverrideRecipeBundle)
  {
    v2 = [a1 coreMaterialOverrideRecipeBundleURL];
    if (v2)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithURL:v2];
      v4 = (void *)__coreMaterialOverrideRecipeBundle;
      __coreMaterialOverrideRecipeBundle = v3;
    }
    if (!__coreMaterialOverrideRecipeBundle)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
      v6 = (void *)__coreMaterialOverrideRecipeBundle;
      __coreMaterialOverrideRecipeBundle = v5;
    }
    uint64_t v1 = __coreMaterialOverrideRecipeBundle;
  }
  v7 = [MEMORY[0x1E4F1CA98] null];
  if ((void *)v1 == v7) {
    v8 = 0;
  }
  else {
    v8 = (void *)__coreMaterialOverrideRecipeBundle;
  }
  id v9 = v8;

  return v9;
}

+ (id)coreMaterialOverrideRecipeBundleURL
{
  v0 = _MTGetCoreMaterialPlatformConfiguration();
  uint64_t v1 = [v0 overrideRecipeBundleURL];

  return v1;
}

+ (void)_setCoreMaterialOverrideRecipeBundleURL:()CoreMaterialAdditions
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a3;
  MTRegisterCoreMaterialLogging();
  v4 = _MTGetCoreMaterialPlatformConfiguration();
  uint64_t v5 = [v4 overrideRecipeBundleURL];
  if (v3 | v5 && ([(id)v3 isEqual:v5] & 1) == 0)
  {
    char v6 = objc_opt_respondsToSelector();
    v7 = MTLogConfiguration;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        uint64_t v10 = v3;
        _os_log_impl(&dword_1AE9D6000, v7, OS_LOG_TYPE_DEFAULT, "Updating CoreMaterial override recipe bundle URL: %{public}@", (uint8_t *)&v9, 0xCu);
      }
      [v4 setOverrideRecipeBundleURL:v3];
      v8 = (void *)__coreMaterialOverrideRecipeBundle;
      __coreMaterialOverrideRecipeBundle = 0;
    }
    else if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_ERROR))
    {
      +[NSBundle(CoreMaterialAdditions) _setCoreMaterialOverrideRecipeBundleURL:v7];
    }
  }
}

+ (void)_setCoreMaterialOverrideRecipeBundleURL:()CoreMaterialAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1AE9D6000, log, OS_LOG_TYPE_ERROR, "Attempt to override recipe bundle URL (%{public}@) not supported by platform configuration: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end