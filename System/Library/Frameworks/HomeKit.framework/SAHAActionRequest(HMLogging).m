@interface SAHAActionRequest(HMLogging)
- (id)hm_shortDescription;
@end

@implementation SAHAActionRequest(HMLogging)

- (id)hm_shortDescription
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E78] string];
  uint64_t v3 = *MEMORY[0x1E4F96EB0];
  v4 = [a1 filter];
  v5 = objc_msgSend(v4, "hm_shortDescription");
  [v2 appendFormat:@"\t%@: %@", v3, v5];

  uint64_t v6 = *MEMORY[0x1E4F96D70];
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "executionOrder"));
  [v2 appendFormat:@"\n\t\t\t%@: %@", v6, v7];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [a1 actions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v20;
    uint64_t v13 = *MEMORY[0x1E4F96D68];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (v11 + i) {
          objc_msgSend(v2, "appendFormat:", @"\n\t\t\t\t [%tu]", v11 + i, v18);
        }
        else {
          [v2 appendFormat:@"\n\t\t\t%@: [%tu]", v13, 0];
        }
        v16 = objc_msgSend(v15, "hm_shortDescription");
        [v2 appendFormat:@"\n\t\t\t\t %@", v16];
      }
      v11 += i;
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v2;
}

@end