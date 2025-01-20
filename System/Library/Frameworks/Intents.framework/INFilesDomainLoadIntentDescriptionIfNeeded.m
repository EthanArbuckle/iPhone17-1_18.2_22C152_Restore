@interface INFilesDomainLoadIntentDescriptionIfNeeded
@end

@implementation INFilesDomainLoadIntentDescriptionIfNeeded

void ___INFilesDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v1 = [MEMORY[0x1E4F1CBF0] count];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v1];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v0 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v0);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 = [v8 name];
        [v2 setObject:v8 forKey:v9];

        v10 = [v8 type];
        [v3 setObject:v8 forKey:v10];
      }
      uint64_t v5 = [v0 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  uint64_t v11 = [v2 copy];
  v12 = (void *)sFilesDomain_intentDescsByName;
  sFilesDomain_intentDescsByName = v11;

  uint64_t v13 = [v3 copy];
  v14 = (void *)sFilesDomain_intentDescsByType;
  sFilesDomain_intentDescsByType = v13;
}

@end