@interface SAHAActionResult(HMLogging)
- (id)hm_shortDescription;
@end

@implementation SAHAActionResult(HMLogging)

- (id)hm_shortDescription
{
  v2 = [MEMORY[0x1E4F28E78] string];
  v3 = (void *)*MEMORY[0x1E4F96D80];
  v4 = [a1 outcome];
  appendToShortDescription(v2, v3, v4);

  uint64_t v5 = *MEMORY[0x1E4F96D78];
  v6 = [a1 entity];
  uint64_t v7 = objc_msgSend(v6, "hm_shortDescription");
  v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    [v2 appendFormat:@"  %@:%@;", v5, v7];
  }

  [v2 appendString:@"  "];
  v10 = (void *)*MEMORY[0x1E4F96D90];
  v11 = [a1 resultAttribute];
  appendToShortDescription(v2, v10, v11);

  [v2 appendString:@"  "];
  v12 = (void *)*MEMORY[0x1E4F96D98];
  v13 = [a1 resultValue];
  v14 = objc_msgSend(v13, "hm_shortDescription");
  appendToShortDescription(v2, v12, v14);

  [v2 appendString:@"  "];
  v15 = (void *)*MEMORY[0x1E4F96D88];
  v16 = [a1 requestActionId];
  appendToShortDescription(v2, v15, v16);

  return v2;
}

@end