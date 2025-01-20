@interface HMActionSet(HFHomeKitObjectConformance)
- (uint64_t)hf_isValidObject;
@end

@implementation HMActionSet(HFHomeKitObjectConformance)

- (uint64_t)hf_isValidObject
{
  v2 = [a1 home];
  if (v2)
  {
    v3 = [a1 uniqueIdentifier];
    v4 = [v2 actionSets];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__HMActionSet_HFHomeKitObjectConformance__hf_isValidObject__block_invoke;
    v8[3] = &unk_26408E348;
    id v9 = v3;
    id v5 = v3;
    uint64_t v6 = objc_msgSend(v4, "na_any:", v8);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end