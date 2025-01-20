@interface HMLightProfileNaturalLightingAction(HFAdditions)
- (id)hf_affectedAccessoryProfiles;
- (id)hf_affectedAccessoryRepresentables;
- (uint64_t)hf_affectedCharacteristic;
@end

@implementation HMLightProfileNaturalLightingAction(HFAdditions)

- (uint64_t)hf_affectedCharacteristic
{
  return 0;
}

- (id)hf_affectedAccessoryProfiles
{
  v4 = [a1 lightProfile];

  if (v4)
  {
    objc_getAssociatedObject(a1, a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5
      || ([a1 lightProfile],
          v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v5 containsObject:v6],
          v6,
          (v7 & 1) == 0))
    {
      v8 = (void *)MEMORY[0x263EFFA08];
      v9 = [a1 lightProfile];
      v10 = [v8 setWithObject:v9];

      objc_setAssociatedObject(a1, a2, v10, (void *)0x301);
      id v5 = v10;
    }
  }
  else
  {
    if (qword_26AB2FB20 != -1) {
      dispatch_once(&qword_26AB2FB20, &__block_literal_global_31_4);
    }
    id v5 = (id)qword_26AB2FB28;
  }
  return v5;
}

- (id)hf_affectedAccessoryRepresentables
{
  v1 = (void *)MEMORY[0x263EFFA08];
  v2 = [a1 lightProfile];
  v3 = objc_msgSend(v1, "na_setWithSafeObject:", v2);

  return v3;
}

@end