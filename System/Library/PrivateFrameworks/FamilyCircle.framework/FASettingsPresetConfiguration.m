@interface FASettingsPresetConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)BOOLKeys;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidBoolValue:(id)a3;
- (BOOL)isValidTriState:(id)a3;
- (FASettingsPresetConfiguration)initWithCoder:(id)a3;
- (FASettingsPresetConfiguration)initWithDictionary:(id)a3;
- (FASettingsPresetConfiguration)initWithValues:(id)a3;
- (FASettingsPresetConfiguration)initWithValues:(id)a3 computedProperties:(id)a4;
- (NSDictionary)computedProperties;
- (NSDictionary)values;
- (id)allValues;
- (id)allValuesWithUserValueProvider:(id)a3;
- (id)description;
- (id)presetValueForKey:(id)a3;
- (id)presetValueForKey:(id)a3 userValueProvider:(id)a4;
- (id)validatedValuesFromValues:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FASettingsPresetConfiguration

+ (id)BOOLKeys
{
  if (BOOLKeys_onceToken != -1) {
    dispatch_once(&BOOLKeys_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)BOOLKeys_keys;
  return v2;
}

uint64_t __41__FASettingsPresetConfiguration_BOOLKeys__block_invoke()
{
  BOOLKeys_keys = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"media.settings.allowBookstoreErotica", @"system.ratings.allowExplicitContent", @"system.music.allowMusicVideos", @"system.music.allowMusicArtistActivity", @"system.siri.allowAssistantUserGeneratedContent", @"system.siri.forceAssistantProfanityFilter", @"application.store.allowAppRemoval", 0);
  return MEMORY[0x1F41817F8]();
}

- (FASettingsPresetConfiguration)initWithValues:(id)a3
{
  return [(FASettingsPresetConfiguration *)self initWithValues:a3 computedProperties:MEMORY[0x1E4F1CC08]];
}

- (FASettingsPresetConfiguration)initWithValues:(id)a3 computedProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FASettingsPresetConfiguration;
  v8 = [(FASettingsPresetConfiguration *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E4F1CC08];
    if (v9) {
      v12 = (void *)v9;
    }
    else {
      v12 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v8->_values, v12);

    uint64_t v13 = [v7 copy];
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = v11;
    }
    objc_storeStrong((id *)&v8->_computedProperties, v15);
  }
  return v8;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_values hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    values = self->_values;
    id v6 = [v4 values];
    [(NSDictionary *)values isEqualToDictionary:v6];
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  values = self->_values;
  id v5 = a3;
  [v5 encodeObject:values forKey:@"values"];
  [v5 encodeObject:self->_computedProperties forKey:@"computedProperties"];
}

- (FASettingsPresetConfiguration)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 setWithObject:objc_opt_class()];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v5 decodeDictionaryWithKeysOfClasses:v6 objectsOfClasses:v9 forKey:@"values"];

  v11 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v13 = [v5 decodeDictionaryWithKeysOfClasses:v11 objectsOfClasses:v12 forKey:@"computedProperties"];

  v14 = [(FASettingsPresetConfiguration *)self initWithValues:v10 computedProperties:v13];
  return v14;
}

- (FASettingsPresetConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FASettingsPresetConfiguration initWithDictionary:]();
    }
  }
  id v6 = [v4 objectForKeyedSubscript:@"values"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"computedProperties"];
    uint64_t v8 = (void *)v7;
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
    if (v7) {
      uint64_t v9 = (void *)v7;
    }
    v10 = v9;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [v10 aaf_map:&__block_literal_global_50];
      v12 = [(FASettingsPresetConfiguration *)self validatedValuesFromValues:v6];
      self = [(FASettingsPresetConfiguration *)self initWithValues:v12 computedProperties:v11];

      uint64_t v13 = self;
    }
    else
    {
      v11 = _FALogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[FASettingsPresetConfiguration initWithDictionary:]();
      }
      uint64_t v13 = 0;
    }
  }
  else
  {
    v10 = _FALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[FASettingsPresetConfiguration initWithDictionary:]();
    }
    uint64_t v13 = 0;
  }

  return v13;
}

FASettingsPresetComputedProperty *__52__FASettingsPresetConfiguration_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [[FASettingsPresetComputedProperty alloc] initWithDictionary:v3];

  return v4;
}

- (id)validatedValuesFromValues:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", @"STCustomRestrictionConfiguration.STCustomRestrictionWebFilterState", (void)v16))
        {
          v12 = [v6 objectForKeyedSubscript:v11];
          if ([(FASettingsPresetConfiguration *)self isValidTriState:v12]) {
            goto LABEL_11;
          }
        }
        else
        {
          uint64_t v13 = +[FASettingsPresetConfiguration BOOLKeys];
          int v14 = [v13 containsObject:v11];

          v12 = [v6 objectForKeyedSubscript:v11];
          if (!v14 || [(FASettingsPresetConfiguration *)self isValidBoolValue:v12]) {
LABEL_11:
          }
            [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isValidTriState:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0
    && (![v3 integerValue]
     || [v3 integerValue] == 1
     || [v3 integerValue] == 2);

  return v4;
}

- (BOOL)isValidBoolValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v3 integerValue]) {
      BOOL v4 = [v3 integerValue] == 1;
    }
    else {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FASettingsPresetConfiguration *)self values];
  id v6 = [v3 stringWithFormat:@"<%@: %p> ({\n values: %@\n)}", v4, self, v5];

  return v6;
}

- (id)presetValueForKey:(id)a3
{
  return [(FASettingsPresetConfiguration *)self presetValueForKey:a3 userValueProvider:&__block_literal_global_61];
}

uint64_t __51__FASettingsPresetConfiguration_presetValueForKey___block_invoke()
{
  return 0;
}

- (id)presetValueForKey:(id)a3 userValueProvider:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  uint64_t v8 = v7[2](v7, v6);
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v11 = [(FASettingsPresetConfiguration *)self computedProperties];
    v12 = [v11 objectForKeyedSubscript:v6];

    if (v12)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __69__FASettingsPresetConfiguration_presetValueForKey_userValueProvider___block_invoke;
      v15[3] = &unk_1E6924D20;
      v15[4] = self;
      long long v16 = v7;
      id v10 = [v12 computedValueWithValueProvider:v15];
    }
    else
    {
      uint64_t v13 = [(FASettingsPresetConfiguration *)self values];
      id v10 = [v13 objectForKeyedSubscript:v6];
    }
  }

  return v10;
}

uint64_t __69__FASettingsPresetConfiguration_presetValueForKey_userValueProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presetValueForKey:a2 userValueProvider:*(void *)(a1 + 40)];
}

- (id)allValues
{
  return [(FASettingsPresetConfiguration *)self allValuesWithUserValueProvider:&__block_literal_global_63];
}

uint64_t __42__FASettingsPresetConfiguration_allValues__block_invoke()
{
  return 0;
}

- (id)allValuesWithUserValueProvider:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = [(FASettingsPresetConfiguration *)self values];
  uint64_t v9 = [v8 allKeys];
  id v10 = [v7 setWithArray:v9];
  v11 = [(FASettingsPresetConfiguration *)self computedProperties];
  v12 = [v11 allKeys];
  uint64_t v13 = [v10 setByAddingObjectsFromArray:v12];

  int v14 = [(FASettingsPresetConfiguration *)self values];
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = __64__FASettingsPresetConfiguration_allValuesWithUserValueProvider___block_invoke;
  v34 = &unk_1E6924D48;
  id v15 = v5;
  id v35 = v15;
  v36 = self;
  id v16 = v4;
  id v38 = v16;
  id v17 = v6;
  id v37 = v17;
  [v14 enumerateKeysAndObjectsUsingBlock:&v31];

  long long v18 = [(FASettingsPresetConfiguration *)self computedProperties];
  long long v19 = [v18 allKeys];
  v20 = (void *)[v19 mutableCopy];

  if (objc_msgSend(v20, "aaf_hasObjects"))
  {
    do
    {
      uint64_t v21 = objc_msgSend(v20, "aaf_removeFirstObject");
      v22 = [(FASettingsPresetConfiguration *)self computedProperties];
      v23 = [v22 objectForKeyedSubscript:v21];

      v24 = [v23 dependencies];
      v25 = (void *)[v24 mutableCopy];

      [v25 intersectSet:v13];
      int v26 = [v25 isSubsetOfSet:v17];
      v27 = v20;
      if (v26)
      {
        v28 = [(FASettingsPresetConfiguration *)self presetValueForKey:v21 userValueProvider:v16];
        [v15 setObject:v28 forKeyedSubscript:v21];

        v27 = v17;
      }
      [v27 addObject:v21];
    }
    while ((objc_msgSend(v20, "aaf_hasObjects") & 1) != 0);
  }
  id v29 = v15;

  return v29;
}

void __64__FASettingsPresetConfiguration_allValuesWithUserValueProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = a2;
  id v5 = [v3 presetValueForKey:v6 userValueProvider:v4];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];

  [*(id *)(a1 + 48) addObject:v6];
}

- (NSDictionary)values
{
  return self->_values;
}

- (NSDictionary)computedProperties
{
  return self->_computedProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedProperties, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (void)initWithDictionary:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_0(&dword_1D252C000, v0, v1, "Error decoding %@", v2, v3, v4, v5, 2u);
}

@end