@interface SAHACommand(HMLogging)
- (id)hm_shortDescription;
@end

@implementation SAHACommand(HMLogging)

- (id)hm_shortDescription
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28E78] string];
  uint64_t v3 = *MEMORY[0x1E4F96EB0];
  v4 = [a1 filter];
  v5 = objc_msgSend(v4, "hm_shortDescription");
  [v2 appendFormat:@"\t%@: %@", v3, v5];

  uint64_t v6 = *MEMORY[0x1E4F96E88];
  v7 = [a1 commandTimeout];
  [v2 appendFormat:@"\n\t%@: %@", v6, v7];

  v8 = (void *)*MEMORY[0x1E4F96F08];
  v9 = [a1 serverValidity];
  appendToShortDescription(v2, v8, v9);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v31 = a1;
  v10 = [a1 actionRequests];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v37;
    uint64_t v15 = *MEMORY[0x1E4F96E78];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v10);
        }
        v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (v13 + i) {
          objc_msgSend(v2, "appendFormat:", @"\n\t\t\t[%tu]", v13 + i, v29);
        }
        else {
          [v2 appendFormat:@"\n\t%@: [%tu]", v15, 0];
        }
        v18 = objc_msgSend(v17, "hm_shortDescription");
        [v2 appendFormat:@"\n\t\t%@", v18];
      }
      v13 += i;
      uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v12);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v19 = [v31 actions];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v33;
    uint64_t v24 = *MEMORY[0x1E4F96E80];
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v26 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * j), "hm_shortDescription");
        v27 = (void *)v26;
        if (v22 + j) {
          [v2 appendFormat:@"\n\t\t[%tu] %@", v22 + j, v26, v30];
        }
        else {
          [v2 appendFormat:@"\n\t%@: [%tu] %@", v24, 0, v26];
        }
      }
      v22 += j;
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v21);
  }

  return v2;
}

@end