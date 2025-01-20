@interface CNDonatedContactSanitizer
+ (id)mutableCopyOfDonatedContact:(id)a3 withCustomIdentifier:(id)a4;
+ (id)sanitizeDonatedContact:(id)a3 matchingPredicate:(id)a4;
+ (id)storeInfoByMergingStoreInfos:(id)a3;
+ (id)storeInfoFromPredicate:(id)a3;
+ (void)markContactAndMultiValuesAsDonated:(id)a3 usingStoreInfo:(id)a4 andStoreIdentifier:(id)a5;
@end

@implementation CNDonatedContactSanitizer

+ (id)sanitizeDonatedContact:(id)a3 matchingPredicate:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_5 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_5, &__block_literal_global_16_1);
  }
  v8 = CNGuardOSLog_cn_once_object_0_5;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_5, OS_LOG_TYPE_FAULT))
  {
    +[CNDonatedContactSanitizer sanitizeDonatedContact:matchingPredicate:](v8);
    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v7) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_5 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_5, &__block_literal_global_16_1);
  }
  v9 = CNGuardOSLog_cn_once_object_0_5;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_5, OS_LOG_TYPE_FAULT)) {
    +[CNDonatedContactSanitizer sanitizeDonatedContact:matchingPredicate:](v9);
  }
LABEL_10:
  v10 = (void *)[a1 mutableCopyOfDonatedContact:v6 withCustomIdentifier:@"2D0447ED-BB88-45F9-909B-EB36C6920675"];
  uint64_t v11 = [v6 storeInfo];
  v12 = (void *)v11;
  uint64_t v13 = MEMORY[0x1E4F1CC08];
  if (v11) {
    uint64_t v13 = v11;
  }
  v23[0] = v13;
  objc_opt_class();
  id v14 = v7;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  v17 = [a1 storeInfoFromPredicate:v16];
  v23[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v19 = [a1 storeInfoByMergingStoreInfos:v18];

  v20 = +[CNDonationMapper mapperIdentifier];
  [a1 markContactAndMultiValuesAsDonated:v10 usingStoreInfo:v19 andStoreIdentifier:v20];
  [v10 setPreferredForName:0];
  [v10 setFrozenSelfAsSnapshot];
  v21 = (void *)[v10 copy];

  return v21;
}

+ (id)mutableCopyOfDonatedContact:(id)a3 withCustomIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [(CNContact *)[CNMutableContact alloc] initWithIdentifier:v6];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = +[CN writableContactProperties];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = [v13 key];
        int v15 = [v5 isKeyAvailable:v14];

        if (v15)
        {
          id v16 = [v13 CNValueForContact:v5];
          [v13 setCNValue:v16 onContact:v7];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (void)markContactAndMultiValuesAsDonated:(id)a3 usingStoreInfo:(id)a4 andStoreIdentifier:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 setStoreIdentifier:v9];
  [v7 setStoreInfo:v8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = +[CN writableMultiValueContactProperties];
  uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      uint64_t v13 = 0;
      uint64_t v24 = v11;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
        int v15 = objc_msgSend(v14, "key", v24);
        int v16 = [v7 isKeyAvailable:v15];

        if (v16)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v17 = v7;
          long long v18 = [v14 CNValueForContact:v7];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v27 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                [v23 setStoreIdentifier:v9];
                [v23 addStoreInfo:v8];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v20);
          }

          id v7 = v17;
          uint64_t v11 = v24;
        }
        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }
}

+ (id)storeInfoByMergingStoreInfos:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  id v6 = objc_msgSend(v4, "_cn_reduce:initialValue:", &__block_literal_global_85, v5);

  return v6;
}

id __58__CNDonatedContactSanitizer_storeInfoByMergingStoreInfos___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  [v4 addEntriesFromDictionary:a3];

  return v4;
}

+ (id)storeInfoFromPredicate:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F5A258];
  id v5 = [v3 mainStoreContactIdentifiers];
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v10 = @"CNContactMainStoreLinkedIdentifier";
    id v7 = [v3 mainStoreContactIdentifiers];
    id v8 = [v7 firstObject];
    v11[0] = v8;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }

  return v6;
}

+ (void)sanitizeDonatedContact:(os_log_t)log matchingPredicate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "parameter ‘predicate’ must be nonnull", v1, 2u);
}

+ (void)sanitizeDonatedContact:(os_log_t)log matchingPredicate:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "parameter ‘donatedContact’ must be nonnull", v1, 2u);
}

@end