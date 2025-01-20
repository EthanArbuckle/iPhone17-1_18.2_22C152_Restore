@interface SAHAAction(HMLogging)
- (id)hm_shortDescription;
@end

@implementation SAHAAction(HMLogging)

- (id)hm_shortDescription
{
  v2 = [MEMORY[0x1E4F28E78] string];
  v3 = (void *)*MEMORY[0x1E4F964E8];
  v4 = [a1 aceId];
  appendToShortDescription(v2, v3, v4);

  v5 = (void *)*MEMORY[0x1E4F96CB8];
  v6 = [a1 actionType];
  appendToShortDescription(v2, v5, v6);

  v7 = (void *)*MEMORY[0x1E4F96CC0];
  v8 = [a1 attribute];
  appendToShortDescription(v2, v7, v8);

  [v2 appendString:@"  "];
  v9 = (void *)*MEMORY[0x1E4F96DF8];
  v10 = [a1 value];
  v11 = objc_msgSend(v10, "hm_shortDescription");
  appendToShortDescription(v2, v9, v11);

  return v2;
}

@end