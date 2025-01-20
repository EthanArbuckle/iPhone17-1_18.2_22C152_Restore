@interface NSDictionary(AvailabilityKit)
- (id)availabilityKit_stringArrayForKey:()AvailabilityKit allowEmptyString:;
- (id)availabilityKit_stringForKey:()AvailabilityKit;
- (uint64_t)availabilityKit_BOOLForKey:()AvailabilityKit defaultValue:;
@end

@implementation NSDictionary(AvailabilityKit)

- (uint64_t)availabilityKit_BOOLForKey:()AvailabilityKit defaultValue:
{
  v5 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (id)availabilityKit_stringForKey:()AvailabilityKit
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)availabilityKit_stringArrayForKey:()AvailabilityKit allowEmptyString:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(a1, "objectForKeyedSubscript:");
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;
            v14 = v13;
            if (v13 && ((a4 & 1) != 0 || [v13 length])) {
              [v6 addObject:v14];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
  v15 = (void *)[v6 copy];

  return v15;
}

@end