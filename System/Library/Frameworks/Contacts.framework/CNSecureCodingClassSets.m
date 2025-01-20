@interface CNSecureCodingClassSets
+ (id)contactStoreClasses;
+ (id)keyDescriptorClasses;
@end

@implementation CNSecureCodingClassSets

void __47__CNSecureCodingClassSets_keyDescriptorClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v9 copy];
  v8 = (void *)keyDescriptorClasses_cn_once_object_0;
  keyDescriptorClasses_cn_once_object_0 = v7;
}

+ (id)keyDescriptorClasses
{
  if (keyDescriptorClasses_cn_once_token_0 != -1) {
    dispatch_once(&keyDescriptorClasses_cn_once_token_0, &__block_literal_global_43);
  }
  uint64_t v2 = (void *)keyDescriptorClasses_cn_once_object_0;

  return v2;
}

+ (id)contactStoreClasses
{
  if (contactStoreClasses_onceToken != -1) {
    dispatch_once(&contactStoreClasses_onceToken, &__block_literal_global_9);
  }
  uint64_t v2 = (void *)contactStoreClasses_contactStoreClasses;

  return v2;
}

void __46__CNSecureCodingClassSets_contactStoreClasses__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  Class v2 = NSClassFromString(&cfstr_Cnsuggestedcon.isa);
  if (v2) {
    [v8 addObject:v2];
  }
  Class v3 = NSClassFromString(&cfstr_Cnaggregatecon.isa);
  if (v3) {
    [v8 addObject:v3];
  }
  Class v4 = NSClassFromString(&cfstr_Cnmockcontacts.isa);
  uint64_t v5 = v8;
  if (v4)
  {
    objc_msgSend(v8, "addObject:");
    uint64_t v5 = v8;
  }
  uint64_t v6 = [v5 copy];
  uint64_t v7 = (void *)contactStoreClasses_contactStoreClasses;
  contactStoreClasses_contactStoreClasses = v6;
}

@end