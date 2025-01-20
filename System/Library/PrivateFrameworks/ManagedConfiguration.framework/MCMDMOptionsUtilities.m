@interface MCMDMOptionsUtilities
+ (id)defaultMDMOptions;
+ (id)validatedMDMOptionsFromOptionsDictionary:(id)a3;
+ (void)setDefaultMDMOptions:(id)a3;
@end

@implementation MCMDMOptionsUtilities

+ (id)validatedMDMOptionsFromOptionsDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (validatedMDMOptionsFromOptionsDictionary__onceToken != -1) {
    dispatch_once(&validatedMDMOptionsFromOptionsDictionary__onceToken, &__block_literal_global_42);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)validatedMDMOptionsFromOptionsDictionary__validKeysAndClasses;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v3 objectForKeyedSubscript:v9];
        if (v10)
        {
          v11 = [(id)validatedMDMOptionsFromOptionsDictionary__validKeysAndClasses objectForKeyedSubscript:v9];
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            [v14 setObject:v10 forKeyedSubscript:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v14;
}

void __66__MCMDMOptionsUtilities_validatedMDMOptionsFromOptionsDictionary___block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F732E0];
  v3[0] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)validatedMDMOptionsFromOptionsDictionary__validKeysAndClasses;
  validatedMDMOptionsFromOptionsDictionary__validKeysAndClasses = v0;
}

+ (id)defaultMDMOptions
{
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"DefaultMDMOptions", @"com.apple.managedconfiguration.notbackedup");
  return v2;
}

+ (void)setDefaultMDMOptions:(id)a3
{
  CFPreferencesSetAppValue(@"DefaultMDMOptions", a3, @"com.apple.managedconfiguration.notbackedup");
  CFPreferencesAppSynchronize(@"com.apple.managedconfiguration.notbackedup");
}

@end