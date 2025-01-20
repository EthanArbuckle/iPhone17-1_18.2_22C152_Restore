@interface PHAssetPropertySet
+ (BOOL)createsPropertySetObjectWithCustomImplementation;
+ (BOOL)inverseIsToMany;
+ (BOOL)isToMany;
+ (NSString)propertySetName;
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertiesToPrefetch;
- (PHAsset)asset;
- (PHAssetPropertySet)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetPropertySet

+ (BOOL)inverseIsToMany
{
  return 0;
}

+ (BOOL)isToMany
{
  return 0;
}

- (void).cxx_destruct
{
}

- (PHAsset)asset
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_asset);

  return (PHAsset *)WeakRetained;
}

- (PHAssetPropertySet)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  return 0;
}

+ (id)propertiesToPrefetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToPrefetch_propertiesToPrefetch_21023;

  return v2;
}

void __42__PHAssetPropertySet_propertiesToPrefetch__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = [*(id *)(a1 + 32) propertiesToFetch];
  v4 = [*(id *)(a1 + 32) keyPathFromPrimaryObject];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) keyPathFromPrimaryObject];
    v6 = [v5 stringByAppendingString:@"."];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v17 = v3;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [NSString stringWithFormat:@"Trying to create a property path '%@' on '%@' with an unexpected property type: %@", v12, *(void *)(a1 + 32), objc_opt_class()];
            id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
            objc_exception_throw(v16);
          }
          v13 = [v6 stringByAppendingString:v12];

          [v2 addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithArray:v2];
    v15 = (void *)propertiesToPrefetch_propertiesToPrefetch_21023;
    propertiesToPrefetch_propertiesToPrefetch_21023 = v14;

    v3 = v17;
  }
  else
  {
    objc_storeStrong((id *)&propertiesToPrefetch_propertiesToPrefetch_21023, v3);
  }
}

+ (BOOL)createsPropertySetObjectWithCustomImplementation
{
  return 0;
}

+ (id)keyPathToPrimaryObject
{
  return @"asset";
}

+ (id)keyPathFromPrimaryObject
{
  return @"additionalAttributes";
}

+ (id)entityName
{
  return @"AdditionalAssetAttributes";
}

+ (id)propertiesToFetch
{
  return 0;
}

+ (NSString)propertySetName
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Abstract base class method called" userInfo:0];
  objc_exception_throw(v2);
}

@end