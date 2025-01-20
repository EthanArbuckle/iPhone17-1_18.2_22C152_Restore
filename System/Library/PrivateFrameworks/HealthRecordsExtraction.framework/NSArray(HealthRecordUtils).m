@interface NSArray(HealthRecordUtils)
- (id)hd_stringArrayValue;
@end

@implementation NSArray(HealthRecordUtils)

- (id)hd_stringArrayValue
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hd_stringValue", (void)v11);
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = (void *)[v2 copy];
  return v9;
}

@end