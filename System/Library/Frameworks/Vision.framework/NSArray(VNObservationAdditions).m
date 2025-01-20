@interface NSArray(VNObservationAdditions)
- (id)VNObservationsWithOriginatingRequestSpecifier:()VNObservationAdditions;
@end

@implementation NSArray(VNObservationAdditions)

- (id)VNObservationsWithOriginatingRequestSpecifier:()VNObservationAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = objc_msgSend(v10, "observationWithOriginatingRequestSpecifier:", v4, (void)v14);
          [v5 addObject:v11];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v5 copy];

  return v12;
}

@end