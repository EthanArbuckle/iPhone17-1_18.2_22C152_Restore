@interface HMAction(HFAdditions)
- (id)hf_affectedAccessoryProfiles;
- (id)hf_affectedAccessoryRepresentables;
- (uint64_t)hf_affectedCharacteristic;
- (uint64_t)hf_isServiceLikeItemInvolved:()HFAdditions;
@end

@implementation HMAction(HFAdditions)

- (uint64_t)hf_affectedCharacteristic
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  NSLog(&cfstr_HasNotImplemen.isa, v1);

  return 0;
}

- (id)hf_affectedAccessoryProfiles
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  NSLog(&cfstr_HasNotImplemen_0.isa, v1);

  if (_MergedGlobals_299 != -1) {
    dispatch_once(&_MergedGlobals_299, &__block_literal_global_7_9);
  }
  v2 = (void *)qword_26AB2FAF8;
  return v2;
}

- (uint64_t)hf_isServiceLikeItemInvolved:()HFAdditions
{
  id v4 = a3;
  v5 = [v4 services];
  v6 = objc_msgSend(v5, "na_flatMap:", &__block_literal_global_10_10);

  objc_opt_class();
  id v7 = v4;
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  v10 = [v9 mediaProfileContainer];
  v11 = [v10 mediaProfiles];
  objc_opt_class();
  id v12 = v7;
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  v15 = (void *)MEMORY[0x263EFFA08];
  v16 = [v14 accessory];
  uint64_t v17 = [v16 profiles];
  v18 = (void *)v17;
  if (v17) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = MEMORY[0x263EFFA68];
  }
  v20 = [v15 setWithArray:v19];

  v21 = objc_msgSend(a1, "hf_affectedAccessoryProfiles");
  v22 = objc_msgSend(a1, "hf_affectedCharacteristic");
  if ([v6 containsObject:v22] & 1) != 0 || (objc_msgSend(v21, "intersectsSet:", v11)) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = [v21 intersectsSet:v20];
  }

  return v23;
}

- (id)hf_affectedAccessoryRepresentables
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = NSStringFromSelector(a2);
  NSLog(&cfstr_HasNotImplemen_1.isa, v4, v5);

  if (qword_26AB2FB00 != -1) {
    dispatch_once(&qword_26AB2FB00, &__block_literal_global_19_10);
  }
  v6 = (void *)qword_26AB2FB08;
  return v6;
}

@end