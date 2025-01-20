@interface NSMergedPolicyLocalizationPolicy
- (NSMergedPolicyLocalizationPolicy)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_ensureFullLocalizationDictionaryIsLoaded;
- (void)addPolicy:(id)a3;
- (void)dealloc;
@end

@implementation NSMergedPolicyLocalizationPolicy

- (NSMergedPolicyLocalizationPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSMergedPolicyLocalizationPolicy;
  result = [(NSMergedPolicyLocalizationPolicy *)&v3 init];
  if (result) {
    result->_mergedPolicies = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSMergedPolicyLocalizationPolicy;
  [(NSValidationErrorLocalizationPolicy *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSMergedPolicyLocalizationPolicy;
  v4 = [(NSValidationErrorLocalizationPolicy *)&v6 copyWithZone:a3];
  if (v4) {
    v4[6] = [(NSSet *)self->_mergedPolicies copy];
  }
  return v4;
}

- (void)addPolicy:(id)a3
{
  mergedPolicies = self->_mergedPolicies;
  if (!mergedPolicies)
  {
    mergedPolicies = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:4];
    self->_mergedPolicies = mergedPolicies;
  }

  [(NSSet *)mergedPolicies addObject:a3];
}

- (void)_ensureFullLocalizationDictionaryIsLoaded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->super._hasSetLocalizationDictionary)
  {
    self->super._localizationDictionary = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSSet count](self->_mergedPolicies, "count"));
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    mergedPolicies = self->_mergedPolicies;
    uint64_t v4 = [(NSSet *)mergedPolicies countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(mergedPolicies);
          }
          v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          [v8 _ensureFullLocalizationDictionaryIsLoaded];
          -[NSDictionary addEntriesFromDictionary:](self->super._localizationDictionary, "addEntriesFromDictionary:", [v8 localizationDictionary]);
        }
        uint64_t v5 = [(NSSet *)mergedPolicies countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
    self->super._hasSetLocalizationDictionary = 1;
  }
}

@end