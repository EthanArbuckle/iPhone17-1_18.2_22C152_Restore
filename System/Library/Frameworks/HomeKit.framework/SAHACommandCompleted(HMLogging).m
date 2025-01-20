@interface SAHACommandCompleted(HMLogging)
- (id)hm_contentDescription;
- (id)hm_headerDescription;
- (id)hm_shortDescription;
@end

@implementation SAHACommandCompleted(HMLogging)

- (id)hm_contentDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  v3 = [a1 actionResults];
  v4 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [a1 actionResults];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = NSString;
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "hm_shortDescription");
        v12 = [v10 stringWithFormat:@"\n\t%@", v11];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)hm_headerDescription
{
  v2 = [MEMORY[0x1E4F28E78] string];
  v3 = (void *)*MEMORY[0x1E4F96E98];
  v4 = [a1 commandOutcome];
  appendToShortDescription(v2, v3, v4);

  v5 = (void *)*MEMORY[0x1E4F96E90];
  uint64_t v6 = [a1 clientValidity];
  appendToShortDescription(v2, v5, v6);

  uint64_t v7 = (void *)*MEMORY[0x1E4F96EA8];
  uint64_t v8 = [a1 serverValidity];
  appendToShortDescription(v2, v7, v8);

  v9 = (void *)*MEMORY[0x1E4F96EA0];
  v10 = [a1 homeIdentifier];
  appendToShortDescription(v2, v9, v10);

  return v2;
}

- (id)hm_shortDescription
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28E78];
  v3 = objc_msgSend(a1, "hm_headerDescription");
  v4 = [v2 stringWithString:v3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [a1 actionResults];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hm_shortDescription");
        [v4 appendFormat:@"\n\t%@", v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end