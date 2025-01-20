@interface HDHealthOntologyConfiguration
+ (id)bundledHealthOntologyConfiguration;
- (HDHealthOntologyConfiguration)init;
- (HDHealthOntologyConfiguration)initWithCountryConfigurations:(id)a3;
- (NSArray)allCountryConfigurations;
- (id)configurationForCountryCode:(id)a3;
@end

@implementation HDHealthOntologyConfiguration

- (HDHealthOntologyConfiguration)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDHealthOntologyConfiguration)initWithCountryConfigurations:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HDHealthOntologyConfiguration;
  v6 = [(HDHealthOntologyConfiguration *)&v24 init];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "countryCode", (void)v20);

          if (!v14)
          {
            v16 = [MEMORY[0x1E4F28B00] currentHandler];
          }
          v15 = [v13 countryCode];
          [v7 setObject:v13 forKeyedSubscript:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v10);
    }

    uint64_t v17 = [v7 copy];
    countryConfigurations = v6->_countryConfigurations;
    v6->_countryConfigurations = (NSDictionary *)v17;
  }
  return v6;
}

+ (id)bundledHealthOntologyConfiguration
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HDHealthOntologyConfiguration_bundledHealthOntologyConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EBA18D50 != -1) {
    dispatch_once(&qword_1EBA18D50, block);
  }
  v2 = (void *)_MergedGlobals_212;

  return v2;
}

void __67__HDHealthOntologyConfiguration_bundledHealthOntologyConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v2 = [&unk_1F17EA3C8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v32;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v32 != v4) {
          objc_enumerationMutation(&unk_1F17EA3C8);
        }
        uint64_t v6 = *(void *)(*((void *)&v31 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x1C187C0E0]();
        id v8 = [MEMORY[0x1E4F2B180] codeSystemWithIdentifier:v6];
        [v1 addObject:v8];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_1F17EA3C8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v3);
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v10 = [MEMORY[0x1E4F2B180] CVXSystem];
  uint64_t v11 = [MEMORY[0x1E4F2B180] LOINCCodeSystem];
  v12 = [MEMORY[0x1E4F2B180] RxNormCodeSystem];
  v13 = [MEMORY[0x1E4F2B180] SNOMEDCodeSystem];
  v14 = [MEMORY[0x1E4F2B180] ICD9System];
  v15 = [MEMORY[0x1E4F2B180] ICD10System];
  v16 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, v15, 0);

  [v16 addObjectsFromArray:v1];
  uint64_t v17 = [[HDHealthOntologyCountryConfiguration alloc] initWithCountryCode:@"US" supportedCodingSystems:v16 analyticsOptions:3];
  v18 = (void *)MEMORY[0x1E4F1CA80];
  v19 = [MEMORY[0x1E4F2B180] LOINCCodeSystem];
  long long v20 = objc_msgSend(v18, "setWithObjects:", v19, 0);

  [v20 addObjectsFromArray:v1];
  long long v21 = [[HDHealthOntologyCountryConfiguration alloc] initWithCountryCode:@"CA" supportedCodingSystems:v20 analyticsOptions:1];
  long long v22 = (void *)MEMORY[0x1E4F1CA80];
  long long v23 = [MEMORY[0x1E4F2B180] LOINCCodeSystem];
  objc_super v24 = objc_msgSend(v22, "setWithObjects:", v23, 0);

  [v24 addObjectsFromArray:v1];
  v25 = [[HDHealthOntologyCountryConfiguration alloc] initWithCountryCode:@"GB" supportedCodingSystems:v24 analyticsOptions:0];
  id v26 = objc_alloc(*(Class *)(a1 + 32));
  v35[0] = v17;
  v35[1] = v21;
  v35[2] = v25;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  uint64_t v28 = [v26 initWithCountryConfigurations:v27];
  v29 = (void *)_MergedGlobals_212;
  _MergedGlobals_212 = v28;
}

- (id)configurationForCountryCode:(id)a3
{
  countryConfigurations = self->_countryConfigurations;
  if (!a3) {
    a3 = (id)*MEMORY[0x1E4F29958];
  }
  return [(NSDictionary *)countryConfigurations objectForKeyedSubscript:a3];
}

- (NSArray)allCountryConfigurations
{
  return [(NSDictionary *)self->_countryConfigurations allValues];
}

- (void).cxx_destruct
{
}

@end