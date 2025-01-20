@interface ContactsUtils
+ (id)contactForAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6;
+ (id)contactForAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6 keysToFetch:(id)a7;
+ (id)contactForContact:(id)a3 keysToFetch:(id)a4;
+ (id)defaultContactKeysToFetch;
@end

@implementation ContactsUtils

+ (id)defaultContactKeysToFetch
{
  if (defaultContactKeysToFetch_onceToken != -1) {
    dispatch_once(&defaultContactKeysToFetch_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)defaultContactKeysToFetch_keysToFetch;

  return v2;
}

void __42__ContactsUtils_defaultContactKeysToFetch__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v0 = [(id)EKWeakLinkClass() descriptorForRequiredKeys];
  v1 = objc_msgSend((id)EKWeakLinkClass(), "descriptorForRequiredKeys", v0);
  v5[1] = v1;
  v2 = [(id)EKWeakLinkClass() descriptorForRequiredKeys];
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  v4 = (void *)defaultContactKeysToFetch_keysToFetch;
  defaultContactKeysToFetch_keysToFetch = v3;
}

+ (id)contactForContact:(id)a3 keysToFetch:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  id v7 = v5;
  id v8 = v6;
  CalendarFoundationPerformBlockOnSharedContactStore();
  if ([(id)v13[5] count])
  {
    id v9 = [(id)v13[5] objectAtIndexedSubscript:0];
  }
  else
  {
    id v9 = v7;
  }
  v10 = v9;

  _Block_object_dispose(&v12, 8);

  return v10;
}

void __47__ContactsUtils_contactForContact_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)EKWeakLinkClass();
  id v5 = [*(id *)(a1 + 32) identifier];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v7 = [v4 predicateForContactsWithIdentifiers:v6];

  uint64_t v8 = [v3 unifiedContactsMatchingPredicate:v7 keysToFetch:*(void *)(a1 + 40) error:0];

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (id)contactForAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = +[ContactsUtils defaultContactKeysToFetch];
  v15 = [a1 contactForAddress:v13 fullName:v12 firstName:v11 lastName:v10 keysToFetch:v14];

  return v15;
}

+ (id)contactForAddress:(id)a3 fullName:(id)a4 firstName:(id)a5 lastName:(id)a6 keysToFetch:(id)a7
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__4;
  v38 = __Block_byref_object_dispose__4;
  id v39 = 0;
  uint64_t v33 = MEMORY[0x1E4F143A8];
  id v16 = v11;
  id v17 = v15;
  id v18 = v12;
  id v19 = v13;
  CalendarFoundationPerformBlockOnSharedContactStore();
  if (objc_msgSend((id)v35[5], "count", v33, 3221225472, __75__ContactsUtils_contactForAddress_fullName_firstName_lastName_keysToFetch___block_invoke, &unk_1E6088688))
  {
    v20 = [(id)v35[5] objectAtIndexedSubscript:0];
    goto LABEL_16;
  }
  EKWeakLinkClass();
  v21 = objc_opt_new();
  v20 = v21;
  if (v19 && v14)
  {
    [v21 setGivenName:v19];
    [v20 setFamilyName:v14];
    goto LABEL_11;
  }
  v22 = [MEMORY[0x1E4F57778] personNameComponentsFromString:v18];
  v23 = [v22 givenName];
  if (v23)
  {
  }
  else
  {
    v24 = [v22 familyName];
    BOOL v25 = v24 == 0;

    if (v25)
    {
      [v20 setNickname:v18];
      goto LABEL_10;
    }
  }
  v26 = [v22 givenName];
  [v20 setGivenName:v26];

  v27 = [v22 familyName];
  [v20 setFamilyName:v27];

LABEL_10:
LABEL_11:
  if (v16)
  {
    if (objc_msgSend(v16, "cal_isPhoneNumber"))
    {
      v28 = (void *)EKWeakLinkClass();
      v29 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v16];
      v30 = [v28 labeledValueWithLabel:0 value:v29];
      v41[0] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
      [v20 setPhoneNumbers:v31];
    }
    else
    {
      v29 = [(id)EKWeakLinkClass() labeledValueWithLabel:0 value:v16];
      v40 = v29;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
      [v20 setEmailAddresses:v30];
    }
  }
LABEL_16:

  _Block_object_dispose(&v34, 8);

  return v20;
}

void __75__ContactsUtils_contactForAddress_fullName_firstName_lastName_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  int v3 = objc_msgSend(*(id *)(a1 + 32), "cal_isPhoneNumber");
  v4 = (void *)EKWeakLinkClass();
  id v5 = v4;
  if (v3)
  {
    id v6 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:*(void *)(a1 + 32)];
    id v7 = [v5 predicateForContactsMatchingPhoneNumber:v6];
  }
  else
  {
    id v7 = [v4 predicateForContactsMatchingEmailAddress:*(void *)(a1 + 32)];
  }
  uint64_t v8 = [v17 unifiedContactsMatchingPredicate:v7 keysToFetch:*(void *)(a1 + 40) error:0];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count]
    && !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
    && (*(void *)(a1 + 48) || *(void *)(a1 + 56)))
  {
    id v11 = (void *)EKWeakLinkClass();
    uint64_t v12 = *(void *)(a1 + 48);
    if (!v12) {
      uint64_t v12 = *(void *)(a1 + 56);
    }
    uint64_t v13 = [v11 predicateForContactsMatchingName:v12];

    uint64_t v14 = [v17 unifiedContactsMatchingPredicate:v13 keysToFetch:*(void *)(a1 + 40) error:0];
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    id v7 = (void *)v13;
  }
}

@end