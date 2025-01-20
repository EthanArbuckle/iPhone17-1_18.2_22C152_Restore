@interface HDMCWatchFeatureSettings
+ (id)algorithmicProjectionsSettings;
+ (id)hiddenLoggingRowsSettings;
- (NSString)featureIdentifier;
- (id)userDefaultsChangesFromFeatureSettings:(id)a3 currentUserDefaults:(id)a4;
- (void)initWithFeatureIdentifier:(void *)a3 changeComputer:;
@end

@implementation HDMCWatchFeatureSettings

- (void)initWithFeatureIdentifier:(void *)a3 changeComputer:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)HDMCWatchFeatureSettings;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      v8 = (void *)a1[2];
      a1[2] = v7;

      v9 = _Block_copy(v6);
      v10 = (void *)a1[1];
      a1[1] = v9;
    }
  }

  return a1;
}

- (id)userDefaultsChangesFromFeatureSettings:(id)a3 currentUserDefaults:(id)a4
{
  return (id)(*((uint64_t (**)(void))self->_changeComputer + 2))();
}

+ (id)algorithmicProjectionsSettings
{
  v2 = objc_alloc((Class)a1);
  v3 = -[HDMCWatchFeatureSettings initWithFeatureIdentifier:changeComputer:](v2, (void *)*MEMORY[0x263F09798], &__block_literal_global_7);
  return v3;
}

id __58__HDMCWatchFeatureSettings_algorithmicProjectionsSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = [v4 numberForKey:*MEMORY[0x263F44F10]];
  if (v7)
  {
    v8 = objc_msgSend(v5, "hk_safeNumberIfExistsForKeyPath:error:", @"MenstruationProjectionsEnabled", 0);
    if (!v8 || ([v7 isEqualToNumber:v8] & 1) == 0) {
      [v6 setObject:v7 forKeyedSubscript:@"MenstruationProjectionsEnabled"];
    }
  }
  v9 = [v4 numberForKey:*MEMORY[0x263F44F08]];
  if (v9)
  {
    v10 = objc_msgSend(v5, "hk_safeNumberIfExistsForKeyPath:error:", @"FertileWindowProjectionsEnabled", 0);
    if (!v10 || ([v9 isEqualToNumber:v10] & 1) == 0) {
      [v6 setObject:v9 forKeyedSubscript:@"FertileWindowProjectionsEnabled"];
    }
  }
  v11 = (void *)[v6 copy];

  return v11;
}

+ (id)hiddenLoggingRowsSettings
{
  v2 = objc_alloc((Class)a1);
  v3 = -[HDMCWatchFeatureSettings initWithFeatureIdentifier:changeComputer:](v2, (void *)*MEMORY[0x263F09798], &__block_literal_global_382);
  return v3;
}

id __53__HDMCWatchFeatureSettings_hiddenLoggingRowsSettings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = HKMCAllDisplayTypeIdentifiers();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v13 = HKFeatureSettingsKeyForIsLoggingHiddenForDisplayTypeIdentifier();
        v14 = objc_msgSend(v4, "numberForKey:", v13, (void)v20);

        [v6 setObject:v14 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v9);
  }

  uint64_t v15 = objc_msgSend(v5, "hk_safeDictionaryIfExistsForKeyPath:error:", @"ShouldHideByDisplayTypeIdentifier", 0);
  v16 = (void *)v15;
  v17 = (void *)MEMORY[0x263EFFA78];
  if (v15) {
    uint64_t v18 = v15;
  }
  else {
    uint64_t v18 = MEMORY[0x263EFFA78];
  }
  if ((objc_msgSend(v6, "isEqualToDictionary:", v18, (void)v20) & 1) == 0)
  {
    v24 = @"ShouldHideByDisplayTypeIdentifier";
    id v25 = v6;
    v17 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  }

  return v17;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong(&self->_changeComputer, 0);
}

@end