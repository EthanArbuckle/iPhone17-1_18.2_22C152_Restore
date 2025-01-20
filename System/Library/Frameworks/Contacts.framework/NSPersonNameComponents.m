@interface NSPersonNameComponents
+ (id)keyPathMapping;
+ (id)keyVectorForUsedKeys;
@end

@implementation NSPersonNameComponents

void __64__NSPersonNameComponents_ContactsPrivate__descriptorForUsedKeys__block_invoke()
{
  +[NSPersonNameComponents keyPathMapping]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v4 allKeys];
  v1 = +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:v0 description:@"Person name components"];
  uint64_t v2 = [v1 copy];
  v3 = (void *)descriptorForUsedKeys_cn_once_object_0;
  descriptorForUsedKeys_cn_once_object_0 = v2;
}

void __64__NSPersonNameComponents_ContactsPrivate__componentsForContact___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [v11 key];
  id v4 = +[NSPersonNameComponents keyPathMapping]();
  v5 = [v4 objectForKeyedSubscript:v3];

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v7 = [v11 key];
    LODWORD(v6) = [v6 isKeyAvailable:v7];

    if (v6)
    {
      v8 = [v11 CNValueForContact:*(void *)(a1 + 32)];
      if (!v8)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v9 = +[CN allPhoneticNameComponentProperties];
      if ([v9 containsObject:v11])
      {
        v10 = [*(id *)(a1 + 40) phoneticRepresentation];

        if (v10)
        {
LABEL_8:
          [*(id *)(a1 + 40) setValue:v8 forKeyPath:v5];
          goto LABEL_9;
        }
        id v9 = objc_alloc_init(MEMORY[0x1E4F28F30]);
        [*(id *)(a1 + 40) setPhoneticRepresentation:v9];
      }

      goto LABEL_8;
    }
  }
LABEL_10:
}

+ (id)keyPathMapping
{
  self;
  if (keyPathMapping_cn_once_token_1 != -1) {
    dispatch_once(&keyPathMapping_cn_once_token_1, &__block_literal_global_148);
  }
  v0 = (void *)keyPathMapping_cn_once_object_1;

  return v0;
}

void __57__NSPersonNameComponents_ContactsPrivate__keyPathMapping__block_invoke()
{
  v12[9] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F287D0];
  v11[0] = @"namePrefix";
  v11[1] = @"givenName";
  uint64_t v1 = *MEMORY[0x1E4F287B8];
  v12[0] = v0;
  v12[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F287C0];
  v11[2] = @"middleName";
  v11[3] = @"familyName";
  uint64_t v3 = *MEMORY[0x1E4F287B0];
  v12[2] = v2;
  v12[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F287D8];
  v11[4] = @"nameSuffix";
  v11[5] = @"nickname";
  uint64_t v5 = *MEMORY[0x1E4F287C8];
  v12[4] = v4;
  v12[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F292E0];
  v11[6] = @"phoneticGivenName";
  v11[7] = @"phoneticMiddleName";
  uint64_t v7 = *MEMORY[0x1E4F292E8];
  v12[6] = v6;
  v12[7] = v7;
  v11[8] = @"phoneticFamilyName";
  v12[8] = *MEMORY[0x1E4F292D8];
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:9];
  uint64_t v9 = [v8 copy];
  v10 = (void *)keyPathMapping_cn_once_object_1;
  keyPathMapping_cn_once_object_1 = v9;
}

void __71__NSPersonNameComponents_ContactsPrivate__overrideComponentsInContact___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 key];
  uint64_t v4 = +[NSPersonNameComponents keyPathMapping]();
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v9 key];
    LODWORD(v6) = [v6 isKeyAvailable:v7];

    if (v6)
    {
      v8 = [*(id *)(a1 + 40) valueForKeyPath:v5];
      [v9 setCNValue:v8 onContact:*(void *)(a1 + 32)];
    }
  }
}

+ (id)keyVectorForUsedKeys
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__NSPersonNameComponents_ContactsInternal__keyVectorForUsedKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (keyVectorForUsedKeys_cn_once_token_2 != -1) {
    dispatch_once(&keyVectorForUsedKeys_cn_once_token_2, block);
  }
  uint64_t v1 = (void *)keyVectorForUsedKeys_cn_once_object_2;

  return v1;
}

void __64__NSPersonNameComponents_ContactsInternal__keyVectorForUsedKeys__block_invoke()
{
  +[NSPersonNameComponents keyPathMapping]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v4 allKeys];
  uint64_t v1 = +[CNContactKeyVector keyVectorWithKeys:v0];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)keyVectorForUsedKeys_cn_once_object_2;
  keyVectorForUsedKeys_cn_once_object_2 = v2;
}

@end