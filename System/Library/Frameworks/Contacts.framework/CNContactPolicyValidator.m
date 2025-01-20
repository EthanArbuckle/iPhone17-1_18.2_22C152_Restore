@interface CNContactPolicyValidator
+ (BOOL)shouldIgnoreValidationCheckForProperty:(id)a3;
+ (id)contactFromContact:(id)a3 conformingToPolicy:(id)a4 options:(unint64_t)a5;
+ (id)contactFromContact:(id)a3 conformingToPolicy:(id)a4 options:(unint64_t)a5 valueToStringTransform:(id)a6;
@end

@implementation CNContactPolicyValidator

+ (BOOL)shouldIgnoreValidationCheckForProperty:(id)a3
{
  uint64_t v3 = shouldIgnoreValidationCheckForProperty__cn_once_token_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&shouldIgnoreValidationCheckForProperty__cn_once_token_0, &__block_literal_global_130);
  }
  id v5 = (id)shouldIgnoreValidationCheckForProperty__cn_once_object_0;
  v6 = [v4 key];

  char v7 = [v5 containsObject:v6];
  return v7;
}

void __67__CNContactPolicyValidator_shouldIgnoreValidationCheckForProperty___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = +[CN allImageDataProperties];
  v1 = objc_msgSend(v5, "_cn_map:", &__block_literal_global_4_12);
  v2 = [v0 setWithArray:v1];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)shouldIgnoreValidationCheckForProperty__cn_once_object_0;
  shouldIgnoreValidationCheckForProperty__cn_once_object_0 = v3;
}

uint64_t __67__CNContactPolicyValidator_shouldIgnoreValidationCheckForProperty___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 key];
}

+ (id)contactFromContact:(id)a3 conformingToPolicy:(id)a4 options:(unint64_t)a5
{
  return (id)[a1 contactFromContact:a3 conformingToPolicy:a4 options:a5 valueToStringTransform:0];
}

+ (id)contactFromContact:(id)a3 conformingToPolicy:(id)a4 options:(unint64_t)a5 valueToStringTransform:(id)a6
{
  char v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ((v7 & 8) != 0) {
    [v10 identifier];
  }
  else {
  v13 = +[CNContact makeIdentifierString];
  }
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__32;
  v50 = __Block_byref_object_dispose__32;
  id v51 = 0;
  if ((v7 & 4) != 0)
  {
    v16 = +[CNContactKeyVector keyVector];
    v17 = [v10 keyVector];
    v15 = [v16 keyVectorByAddingKeysFromKeyVector:v17];

    v18 = [(CNContact *)[CNMutableContact alloc] initWithIdentifier:v13 availableKeyDescriptor:v15];
    v19 = (void *)v47[5];
    v47[5] = (uint64_t)v18;
  }
  else
  {
    v14 = [(CNContact *)[CNMutableContact alloc] initWithIdentifier:v13];
    v15 = (void *)v47[5];
    v47[5] = (uint64_t)v14;
  }

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__32;
  v44 = __Block_byref_object_dispose__32;
  id v45 = [MEMORY[0x1E4F28E78] string];
  v20 = [(id)v47[5] keyVector];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __97__CNContactPolicyValidator_contactFromContact_conformingToPolicy_options_valueToStringTransform___block_invoke;
  v31[3] = &unk_1E56B8E28;
  id v21 = v10;
  id v32 = v21;
  id v37 = a1;
  id v22 = v11;
  id v33 = v22;
  v35 = &v46;
  char v38 = v7 & 1;
  BOOL v39 = (v7 & 2) != 0;
  id v23 = v12;
  id v34 = v23;
  v36 = &v40;
  [v20 enumeratePropertiesUsingBlock:v31];

  int v24 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))();
  v25 = v47;
  if (v24 && v47[5])
  {
    v26 = [v21 valueForKey:@"note"];
    id v27 = [NSString alloc];
    v28 = (void *)[v27 initWithFormat:@"%@\n%@", v26, v41[5]];
    [(id)v47[5] setValue:v28 forKey:@"note"];

    v25 = v47;
  }
  id v29 = (id)v25[5];

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v29;
}

void __97__CNContactPolicyValidator_contactFromContact_conformingToPolicy_options_valueToStringTransform___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  v6 = [v5 CNValueForContact:*(void *)(a1 + 32)];
  if (v6)
  {
    char v7 = [*(id *)(a1 + 72) shouldIgnoreValidationCheckForProperty:v5];
    v8 = *(void **)(a1 + 40);
    v9 = [v5 key];
    uint64_t v10 = *(void *)(a1 + 32);
    id v24 = 0;
    int v11 = [v8 shouldSetValue:v6 property:v9 contact:v10 replacementValue:&v24];
    id v12 = v24;

    if ((v7 & 1) != 0 || v11)
    {
      v13 = v5;
      id v14 = v6;
      goto LABEL_9;
    }
    if (v12 && *(unsigned char *)(a1 + 80))
    {
      v13 = v5;
      id v14 = v12;
LABEL_9:
      v15 = [v13 valueWithResetIdentifiers:v14];
      [v5 setCNValue:v15 onContact:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
LABEL_10:

      goto LABEL_11;
    }
    v16 = [v5 nilValue];
    if ([v6 isEqual:v16])
    {
    }
    else
    {
      int v17 = *(unsigned __int8 *)(a1 + 81);

      if (v17)
      {
        uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
        v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = 0;

        *a3 = 1;
        goto LABEL_11;
      }
    }
    v15 = +[CN squashableContactCardPropertyKeys];
    v20 = [v5 key];
    if (![v15 containsKey:v20])
    {

      goto LABEL_10;
    }
    uint64_t v21 = *(void *)(a1 + 48);

    if (v21)
    {
      id v22 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v23 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      [v22 appendString:v23];
    }
  }
  else
  {
    id v12 = 0;
  }
LABEL_11:
}

@end