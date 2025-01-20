uint64_t _MSSourceTypeIsValid(unint64_t a1)
{
  if (a1 > 0x19) {
    return 0;
  }
  if (((1 << a1) & 0x28081FF) != 0) {
    return 1;
  }
  if (((1 << a1) & 0x7F0000) != 0) {
    return [MEMORY[0x1E4F602E0] preferenceEnabled:9];
  }
  else {
    return 0;
  }
}

id MSUserNotificationsLog()
{
  if (MSUserNotificationsLog_onceToken != -1) {
    dispatch_once(&MSUserNotificationsLog_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)MSUserNotificationsLog_os_log;
  return v0;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_1BF3705D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void __MSUserNotificationsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "UserNotifications");
  uint64_t v1 = (void *)MSUserNotificationsLog_os_log;
  MSUserNotificationsLog_os_log = (uint64_t)v0;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_1BF37080C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF370A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF370B14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF370BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF370D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF370E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37113C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MSSharedContactStore()
{
  if (MSSharedContactStore_onceToken != -1) {
    dispatch_once(&MSSharedContactStore_onceToken, &__block_literal_global_1);
  }
  os_log_t v0 = (void *)MSSharedContactStore_store;
  return v0;
}

void __MSSharedContactStore_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  uint64_t v1 = (void *)MSSharedContactStore_store;
  MSSharedContactStore_store = (uint64_t)v0;
}

id MSFetchNonUnifiedContactsForPredicate(void *a1, void *a2, void *a3, void *a4)
{
  v4 = fetchContactsForPredicate(a1, a2, a3, 0, a4);
  return v4;
}

id fetchContactsForPredicate(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v11];
  [v12 setPredicate:v10];
  [v12 setUnifyResults:a4];
  v13 = [MEMORY[0x1E4F1CA48] array];
  id v26 = 0;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __fetchContactsForPredicate_block_invoke;
  v24 = &unk_1E63FE8D0;
  id v14 = v13;
  id v25 = v14;
  char v15 = [v9 enumerateContactsWithFetchRequest:v12 error:&v26 usingBlock:&v21];
  id v16 = v26;
  if (v15)
  {

    v17 = objc_msgSend(v14, "copy", v21, v22, v23, v24);
  }
  else
  {
    v18 = contactsUtilsLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v16, "ef_publicDescription", v21, v22, v23, v24);
      *(_DWORD *)buf = 138412546;
      id v28 = v10;
      __int16 v29 = 2114;
      v30 = v19;
      _os_log_impl(&dword_1BF36E000, v18, OS_LOG_TYPE_DEFAULT, "Error fetching contact matching predicate %@, error: %{public}@", buf, 0x16u);
    }
    if (a5) {
      *a5 = v16;
    }

    v17 = 0;
  }

  return v17;
}

void sub_1BF3714A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id MSCopyClosestMatchingExistingContactUsingAddressesAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v5 = copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(a1, a2, a3, a4, a5, 0);
  return v5;
}

id MSCopyClosestMatchingExistingContactUsingAddressesAndDisplayNameUnified(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  v6 = copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(a1, a2, a3, a4, a5, a6);
  return v6;
}

id copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  v48[7] = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v32 = a2;
  id v12 = a3;
  id v33 = a4;
  id v34 = a5;
  v35 = v12;
  v13 = 0;
  v37 = v11;
  if (v11 && v12)
  {
    uint64_t v14 = *MEMORY[0x1E4F1ADF0];
    v48[0] = *MEMORY[0x1E4F1AEB0];
    v48[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4F1ADE0];
    v48[2] = *MEMORY[0x1E4F1AEA0];
    v48[3] = v15;
    uint64_t v16 = *MEMORY[0x1E4F1AED8];
    v48[4] = *MEMORY[0x1E4F1AEB8];
    v48[5] = v16;
    v48[6] = v12;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:7];
    v18 = v17;
    if (v34)
    {
      uint64_t v19 = [v17 arrayByAddingObjectsFromArray:v32];

      v18 = (void *)v19;
    }
    id v36 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    if ([v12 isEqual:*MEMORY[0x1E4F1ADC8]])
    {
      v20 = (void (**)(uint64_t, uint64_t))&__block_literal_global_40;
    }
    else
    {
      if (![v12 isEqualToString:*MEMORY[0x1E4F1AEE0]])
      {
LABEL_19:
        if (objc_msgSend(v36, "count", v32) == 1)
        {
          v13 = [v36 anyObject];
        }
        else
        {
          v27 = objc_msgSend(v33, "ea_personNameComponents");
          id v28 = objc_alloc_init(_MSCountableMatchesContext);
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_4;
          v38[3] = &unk_1E63FE938;
          id v39 = v36;
          id v42 = &__block_literal_global_47;
          id v29 = v27;
          id v40 = v29;
          id v41 = v33;
          [(_MSCountableMatchesContext *)v28 countInstances:v39 usingPredicate:v38];
          v30 = [(_MSCountableMatchesContext *)v28 highestMatches];
          v13 = [v30 anyObject];
        }
        goto LABEL_23;
      }
      v20 = (void (**)(uint64_t, uint64_t))&__block_literal_global_42;
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v21 = v32;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v44 != v23) {
            objc_enumerationMutation(v21);
          }
          id v25 = v20[2]((uint64_t)v20, *(void *)(*((void *)&v43 + 1) + 8 * i));
          id v26 = fetchContactsForPredicate(v37, v25, v18, a6, 0);
          if (v26) {
            [v36 addObjectsFromArray:v26];
          }
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v22);
    }

    goto LABEL_19;
  }
LABEL_23:

  return v13;
}

void sub_1BF371938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

id MSPreferredAbbreviatedNameForAddressAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  v13 = idealDisplayName(v10, v11);

  if (v9 && [v10 length] && objc_msgSend(v10, "ea_isLegalEmailAddress"))
  {
    uint64_t v14 = [MEMORY[0x1E4F28F30] descriptorForUsedKeys];
    v40[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1000];
    v40[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v40[2] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];

    if (v12)
    {
      uint64_t v18 = [v17 arrayByAddingObjectsFromArray:v12];

      v17 = (void *)v18;
    }
    id v39 = v10;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(v9, v19, (void *)*MEMORY[0x1E4F1ADC8], v13, v17, 1);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(v13, "ea_personNameComponents");
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = [v20 givenName];
      if (v21)
      {
      }
      else
      {
        id v29 = [v20 familyName];
        BOOL v30 = v29 == 0;

        if (v30)
        {
          id v22 = v13;
          goto LABEL_24;
        }
      }
      id v31 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
      id v32 = [v20 namePrefix];
      [v31 setNamePrefix:v32];

      id v33 = [v20 givenName];
      [v31 setGivenName:v33];

      id v34 = [v20 middleName];
      [v31 setMiddleName:v34];

      v35 = [v20 familyName];
      [v31 setFamilyName:v35];

      id v36 = [v20 nameSuffix];
      [v31 setNameSuffix:v36];

      uint64_t v37 = [v31 copy];
      id v20 = (id)v37;
      if (!v37)
      {
        id v22 = v13;
        goto LABEL_25;
      }
    }
    v38 = [MEMORY[0x1E4F1B910] stringFromContact:v20 style:1000];
    if (v38
      || ([MEMORY[0x1E4F1B910] stringFromContact:v20 style:0],
          (v38 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v22 = v38;

      if (!a5)
      {
LABEL_24:

LABEL_25:
        goto LABEL_10;
      }
    }
    else
    {
      id v22 = v13;
      if (!a5) {
        goto LABEL_24;
      }
    }
    id v20 = v20;
    *a5 = v20;
    goto LABEL_24;
  }
  id v22 = v13;
LABEL_10:
  uint64_t v23 = v10;
  if (v22
    && (v24 = [v22 containsString:@"@"], uint64_t v23 = v22, v24)
    && (char v25 = [v22 isEqualToString:v10], v23 = v22, (v25 & 1) == 0))
  {
    id v26 = [NSString stringWithFormat:@"%@ <%@>", v22, v10];
  }
  else
  {
    id v26 = v23;
  }
  v27 = v26;

  return v27;
}

void sub_1BF371DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id idealDisplayName(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 length];
    if (v6 >= 3 && [v5 characterAtIndex:0] == 60)
    {
      int v7 = [v5 characterAtIndex:v6 - 1];
      BOOL v8 = v7 == 62;
      if (v7 == 62) {
        v6 -= 2;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
    if (!objc_msgSend(v5, "compare:options:range:", v3, 9, v8, v6))
    {

      v5 = 0;
    }
  }

  return v5;
}

void sub_1BF371F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MSPreferredCompositeNameForAddressAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  v13 = idealDisplayName(v10, v11);

  if (v9 && [v10 length] && objc_msgSend(v10, "ea_isLegalEmailAddress"))
  {
    uint64_t v14 = MSDescriptorForRequiredKeysForCompositeName();
    uint64_t v15 = v14;
    if (v12)
    {
      uint64_t v16 = [v14 arrayByAddingObjectsFromArray:v12];

      uint64_t v15 = (void *)v16;
    }
    v29[0] = v10;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    uint64_t v18 = copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(v9, v17, (void *)*MEMORY[0x1E4F1ADC8], v13, v15, 1);

    if (v18)
    {
      uint64_t v19 = preferredCompositeNameForUnifiedContact(v18);
      id v20 = (void *)v19;
      if (v19) {
        id v21 = (void *)v19;
      }
      else {
        id v21 = v13;
      }
      id v22 = v21;

      if (a5) {
        *a5 = v18;
      }
    }
    else
    {
      id v22 = v13;
    }
  }
  else
  {
    id v22 = v13;
  }
  uint64_t v23 = v10;
  if (v22
    && (v24 = [v22 containsString:@"@"], uint64_t v23 = v22, v24)
    && (char v25 = [v22 isEqualToString:v10], v23 = v22, (v25 & 1) == 0))
  {
    id v26 = [NSString stringWithFormat:@"%@ <%@>", v22, v10];
  }
  else
  {
    id v26 = v23;
  }
  v27 = v26;

  return v27;
}

void sub_1BF3721CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MSDescriptorForRequiredKeysForCompositeName()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F1AEC0];
  id v0 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];

  return v1;
}

void sub_1BF3722D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id preferredCompositeNameForUnifiedContact(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  if ([v2 shortNameFormatPrefersNicknames])
  {
    id v3 = [v1 nickname];
  }
  else
  {
    id v3 = 0;
  }
  if (![v3 length])
  {
    uint64_t v4 = [MEMORY[0x1E4F1B910] stringFromContact:v1 style:0];

    id v3 = (void *)v4;
  }

  return v3;
}

void sub_1BF3723A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MSPreferredCompositeNameForContact(void *a1, void *a2)
{
  v36[11] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    v5 = MSDescriptorForRequiredKeysForCompositeName();
    if (v3)
    {
      unint64_t v6 = (void *)MEMORY[0x1E4F1B8F8];
      int v7 = [v4 identifier];
      v35 = v7;
      BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      id v9 = [v6 predicateForContactsWithIdentifiers:v8];
      id v30 = 0;
      id v10 = fetchContactsForPredicate(v3, v9, v5, 1, &v30);
      id v11 = v30;
      id v12 = [v10 firstObject];

      if (!v12)
      {
        v13 = contactsUtilsLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = objc_msgSend(v11, "ef_publicDescription");
          MSPreferredCompositeNameForContact_cold_1((uint64_t)v4, v14, buf, v13);
        }
      }
    }
    else
    {
      id v12 = 0;
    }
    if (v12) {
      uint64_t v16 = v12;
    }
    else {
      uint64_t v16 = v4;
    }
    id v17 = v16;
    if (([v17 areKeysAvailable:v5] & 1) == 0)
    {
      id v18 = v17;
      uint64_t v19 = *MEMORY[0x1E4F1ADF0];
      v36[0] = *MEMORY[0x1E4F1AEB0];
      v36[1] = v19;
      uint64_t v20 = *MEMORY[0x1E4F1ADE0];
      v36[2] = *MEMORY[0x1E4F1AEA0];
      v36[3] = v20;
      uint64_t v21 = *MEMORY[0x1E4F1AEF8];
      v36[4] = *MEMORY[0x1E4F1AEB8];
      v36[5] = v21;
      uint64_t v22 = *MEMORY[0x1E4F1AEF0];
      v36[6] = *MEMORY[0x1E4F1AF00];
      v36[7] = v22;
      uint64_t v23 = *MEMORY[0x1E4F1AED8];
      v36[8] = *MEMORY[0x1E4F1AEC0];
      v36[9] = v23;
      v36[10] = *MEMORY[0x1E4F1ADC8];
      int v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:11];
      id v25 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __fallbackContactForMissingContactRequiringKeys_block_invoke;
      v31[3] = &unk_1E63FE960;
      id v26 = v18;
      id v32 = v26;
      id v27 = v25;
      id v33 = v27;
      [v24 enumerateObjectsUsingBlock:v31];
      id v28 = v33;
      id v17 = v27;
    }
    uint64_t v15 = preferredCompositeNameForUnifiedContact(v17);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

void sub_1BF3726FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id contactsUtilsLog()
{
  if (contactsUtilsLog_onceToken != -1) {
    dispatch_once(&contactsUtilsLog_onceToken, &__block_literal_global_50);
  }
  id v0 = (void *)contactsUtilsLog_log;
  return v0;
}

void sub_1BF37289C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF372AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

uint64_t __fetchContactsForPredicate_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:a2];
  return v2;
}

id __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:a2];
  id v4 = [v2 predicateForContactsMatchingPhoneNumber:v3];

  return v4;
}

void sub_1BF372C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5) {
    uint64_t v6 = [v4 hasPrefix:v5];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_1BF372C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) countForObject:v3];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = [v3 namePrefix];
  int v7 = [*(id *)(a1 + 40) namePrefix];
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v7);

  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = [v3 givenName];
  id v10 = [*(id *)(a1 + 40) givenName];
  LODWORD(v8) = (*(uint64_t (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v10);

  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = [v3 middleName];
  v13 = [*(id *)(a1 + 40) middleName];
  LODWORD(v11) = (*(uint64_t (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v15 = [v3 familyName];
  uint64_t v16 = [*(id *)(a1 + 40) familyName];
  LODWORD(v14) = (*(uint64_t (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v16);

  uint64_t v17 = *(void *)(a1 + 56);
  id v18 = [v3 nameSuffix];
  uint64_t v19 = [*(id *)(a1 + 40) nameSuffix];
  LODWORD(v17) = (*(uint64_t (**)(uint64_t, void *, void *))(v17 + 16))(v17, v18, v19);

  uint64_t v20 = *(void *)(a1 + 56);
  uint64_t v21 = [v3 organizationName];
  LODWORD(a1) = (*(uint64_t (**)(uint64_t, void *, void))(v20 + 16))(v20, v21, *(void *)(a1 + 48));

  return v4
       + v5
       + v8
       + v11
       + v14
       + v17
       + a1;
}

void sub_1BF372EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __contactsUtilsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MSContactsUtils");
  id v1 = (void *)contactsUtilsLog_log;
  contactsUtilsLog_log = (uint64_t)v0;
}

void __fallbackContactForMissingContactRequiringKeys_block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isKeyAvailable:"))
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) valueForKey:v5];
    [v3 setValue:v4 forKey:v5];
  }
}

void sub_1BF372FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF37315C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF373220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3732A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3733D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF373478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37354C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF373700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF373948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF373AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF373BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF373D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF373F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF373FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF37412C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF374218(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37427C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF374380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF374470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3746AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF374770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3747EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF374BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF374D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF374E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF374F28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF374FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37517C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37534C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3754FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37584C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF375BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF375E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3762D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF376360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3763F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF376478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MSMailComposeWindowTargetContentIdentifierWithIdentifier(uint64_t a1)
{
  id v1 = [NSString stringWithFormat:@"%@.%@", @"com.apple.mail.compose", a1];
  return v1;
}

void sub_1BF376594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3765F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF376668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3767C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3768A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF376980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF376CDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF376EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF377130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1BF37725C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37738C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF377478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF377770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3778D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF377C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF377EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF377FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF3780D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF378210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF3782D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF378360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF378470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37859C(_Unwind_Exception *a1)
{
  int v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1BF378670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF378710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF378814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF378904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF3789EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF378C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __getPARSessionConfigurationClass_block_invoke(uint64_t a1)
{
  CoreParsecLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PARSessionConfiguration");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPARSessionConfigurationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getPARSessionConfigurationClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MSParsecSearchSession.m", 27, @"Unable to find class %s", "PARSessionConfiguration");

    __break(1u);
  }
}

void sub_1BF378E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CoreParsecLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreParsecLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    void v3[3] = __CoreParsecLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E63FEC78;
    uint64_t v5 = 0;
    CoreParsecLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreParsecLibraryCore_frameworkLibrary)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *CoreParsecLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"MSParsecSearchSession.m", 26, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  os_log_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_1BF378FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t __CoreParsecLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreParsecLibraryCore_frameworkLibrary = result;
  return result;
}

void __getPARSessionClass_block_invoke(uint64_t a1)
{
  CoreParsecLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PARSession");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPARSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getPARSessionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MSParsecSearchSession.m", 28, @"Unable to find class %s", "PARSession");

    __break(1u);
  }
}

void sub_1BF379138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF379264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF379370(_Unwind_Exception *a1)
{
  long long v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF3794D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF379690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37A094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF37AA74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1BF37AD38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37AE78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF37AEF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37AF84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37B098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37B144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37B320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v19 = v16;

  _Unwind_Resume(a1);
}

void sub_1BF37B454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37B538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37B810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF37B998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37BA18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37BAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37BC04(_Unwind_Exception *a1)
{
  long long v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF37BCE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37BD94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37BE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37BF0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37BFC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37C0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37C1B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37C294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37C344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37C488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37C51C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37C5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37C6E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37C964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37CA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF37CB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF37CBC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF37CDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1BF37CEDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class initUIAlertController()
{
  if (LoadUIKit_loadPredicate != -1) {
    dispatch_once(&LoadUIKit_loadPredicate, &__block_literal_global_78);
  }
  Class result = objc_getClass("UIAlertController");
  classUIAlertController = (uint64_t)result;
  getUIAlertControllerClass[0] = (uint64_t (*)())UIAlertControllerFunction;
  return result;
}

id UIAlertControllerFunction()
{
  return (id)classUIAlertController;
}

void __LoadUIKit_block_invoke()
{
  LoadUIKit_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  if (!LoadUIKit_frameworkLibrary) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
}

Class initUIAlertAction()
{
  if (LoadUIKit_loadPredicate != -1) {
    dispatch_once(&LoadUIKit_loadPredicate, &__block_literal_global_78);
  }
  Class result = objc_getClass("UIAlertAction");
  classUIAlertAction = (uint64_t)result;
  getUIAlertActionClass[0] = (uint64_t (*)())UIAlertActionFunction;
  return result;
}

id UIAlertActionFunction()
{
  return (id)classUIAlertAction;
}

Class initUIApplication()
{
  if (LoadUIKit_loadPredicate != -1) {
    dispatch_once(&LoadUIKit_loadPredicate, &__block_literal_global_78);
  }
  Class result = objc_getClass("UIApplication");
  classUIApplication = (uint64_t)result;
  getUIApplicationClass[0] = (uint64_t (*)())UIApplicationFunction;
  return result;
}

id UIApplicationFunction()
{
  return (id)classUIApplication;
}

void sub_1BF37D29C(_Unwind_Exception *a1)
{
  long long v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF37D550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37D5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37DB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1BF37DD74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class initUIApplication_0()
{
  if (LoadUIKit_loadPredicate_0 != -1) {
    dispatch_once(&LoadUIKit_loadPredicate_0, &__block_literal_global_9);
  }
  Class result = objc_getClass("UIApplication");
  classUIApplication_0 = (uint64_t)result;
  getUIApplicationClass_0 = (uint64_t (*)())UIApplicationFunction_0;
  return result;
}

id UIApplicationFunction_0()
{
  return (id)classUIApplication_0;
}

void __LoadUIKit_block_invoke_0()
{
  LoadUIKit_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  if (!LoadUIKit_frameworkLibrary_0) {
    NSLog(&cfstr_FailedToSoftLi.isa);
  }
}

void sub_1BF37E004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37E0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37E1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37E268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37E2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF37E39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37E46C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37E5D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37E690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37E954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF37EE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, id a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF37F030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37F09C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37F354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF37F3F4()
{
}

void sub_1BF37F464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37F6C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37F80C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37F978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37FBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1BF37FC7C()
{
}

void sub_1BF37FC84()
{
}

void sub_1BF37FD78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37FE40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF37FFD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF380134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF380280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF3804AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SGAppCanShowSiriSuggestions(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  uint64_t v3 = [v2 containsObject:v1] ^ 1;

  return v3;
}

void sub_1BF380524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringFromMSDeleteOrArchive(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_1F1AA2F90;
  }
  else {
    return off_1E63FF000[a1];
  }
}

void sub_1BF3806C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF3807E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF380910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF380AD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF380BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF380C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF380F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF38100C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF381214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1BF3813C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF3814AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1BF381688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF381754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF38195C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF381A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _ef_log_MSUserNotificationCenterAnalyticsLogger()
{
  if (_ef_log_MSUserNotificationCenterAnalyticsLogger_onceToken != -1) {
    dispatch_once(&_ef_log_MSUserNotificationCenterAnalyticsLogger_onceToken, &__block_literal_global_11);
  }
  os_log_t v0 = (void *)_ef_log_MSUserNotificationCenterAnalyticsLogger_log;
  return v0;
}

void sub_1BF381C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF381D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_1BF382000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF382198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_1BF382230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF38237C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF382598(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF382744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF382960(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF382B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF382D14(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF382ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_1BF383140(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

__CFString *MSUserNotificationCenterTopicDescription(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.VIP"])
  {
    uint64_t v2 = @"VIP";
  }
  else if ([v1 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.RemindMe"])
  {
    uint64_t v2 = @"Remind Me";
  }
  else if ([v1 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.FavoriteMailboxes"])
  {
    uint64_t v2 = @"Favorite Mailboxes";
  }
  else if ([v1 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.ThreadNotify"])
  {
    uint64_t v2 = @"Notified Threads";
  }
  else if ([v1 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.PrimaryInbox"])
  {
    uint64_t v2 = @"Banner - Primary";
  }
  else if ([v1 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.PrimaryMessages"])
  {
    uint64_t v2 = @"Badge Count - Unread Messages in Primary";
  }
  else if ([v1 isEqualToString:@"com.apple.mobilemail.bulletin-subsection.AllMessages"])
  {
    uint64_t v2 = @"Badge Count - All Unread Messages";
  }
  else
  {
    uint64_t v2 = (__CFString *)v1;
  }

  return v2;
}

void sub_1BF38339C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const char *MailFeatureFlag.domain.getter()
{
  return "Mail";
}

const char *MailFeatureFlag.feature.getter()
{
  Class result = "Shoji";
  switch(*v0)
  {
    case 1:
      Class result = "BlackPearl";
      break;
    case 2:
      Class result = "ZeroKeywordSearchMockData";
      break;
    case 3:
      Class result = "MessageSearch";
      break;
    case 4:
      Class result = "FollowUp";
      break;
    case 5:
      Class result = "RemindMe";
      break;
    case 6:
      Class result = "QuickReply";
      break;
    case 7:
      Class result = "CatchUp";
      break;
    case 8:
      Class result = "CatchUpManualSummarization";
      break;
    default:
      return result;
  }
  return result;
}

uint64_t MailFeatureFlag.isEnabled.getter()
{
  char v1 = *v0;
  uint64_t v5 = &type metadata for MailFeatureFlag;
  unint64_t v6 = sub_1BF3834FC();
  v4[0] = v1;
  char v2 = sub_1BF38AFE8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_1BF3834FC()
{
  unint64_t result = qword_1EB83DA00;
  if (!qword_1EB83DA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB83DA00);
  }
  return result;
}

uint64_t MailFeatureFlag.isGenerativeFeatureAvailable.getter()
{
  return sub_1BF383580(MEMORY[0x1E4F5FD28]);
}

uint64_t MailFeatureFlag.isGenerativeFeatureEnabled.getter()
{
  return sub_1BF383580(MEMORY[0x1E4F5FD30]);
}

uint64_t sub_1BF383580(uint64_t (*a1)(uint64_t))
{
  char v3 = *v1;
  uint64_t v8 = &type metadata for MailFeatureFlag;
  unint64_t v9 = sub_1BF3834FC();
  v7[0] = v3;
  char v4 = sub_1BF38AFE8();
  uint64_t v5 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  if (v4) {
    return a1(v5);
  }
  else {
    return 0;
  }
}

BOOL static MailFeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MailFeatureFlag.hash(into:)()
{
  return sub_1BF38B338();
}

uint64_t MailFeatureFlag.hashValue.getter()
{
  return sub_1BF38B348();
}

BOOL sub_1BF383674(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1BF383688()
{
  return sub_1BF38B348();
}

uint64_t sub_1BF3836D0()
{
  return sub_1BF38B338();
}

uint64_t sub_1BF3836FC()
{
  return sub_1BF38B348();
}

unint64_t sub_1BF383744()
{
  unint64_t result = qword_1EA146EA8;
  if (!qword_1EA146EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA146EA8);
  }
  return result;
}

const char *sub_1BF383798()
{
  return "Mail";
}

const char *sub_1BF3837AC()
{
  return MailFeatureFlag.feature.getter();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MailFeatureFlag(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MailFeatureFlag(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1BF383934);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_1BF38395C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1BF383968(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MailFeatureFlag()
{
  return &type metadata for MailFeatureFlag;
}

uint64_t sub_1BF383980(uint64_t a1, uint64_t a2)
{
  return sub_1BF383A78(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1BF383998()
{
  sub_1BF38B0F8();
  sub_1BF38B108();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF3839EC()
{
  sub_1BF38B0F8();
  sub_1BF38B328();
  sub_1BF38B108();
  uint64_t v0 = sub_1BF38B348();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BF383A60(uint64_t a1, uint64_t a2)
{
  return sub_1BF383A78(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1BF383A78(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1BF38B0F8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BF383ABC(uint64_t a1, id *a2)
{
  uint64_t result = sub_1BF38B0D8();
  *a2 = 0;
  return result;
}

uint64_t sub_1BF383B34(uint64_t a1, id *a2)
{
  char v3 = sub_1BF38B0E8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1BF383BB4@<X0>(uint64_t *a1@<X8>)
{
  sub_1BF38B0F8();
  uint64_t v2 = sub_1BF38B0C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BF383BF8()
{
  uint64_t v0 = sub_1BF38B0F8();
  uint64_t v2 = v1;
  if (v0 == sub_1BF38B0F8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1BF38B2F8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1BF383C84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1BF38B0C8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BF383CCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1BF38B0F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BF383CF8(uint64_t a1)
{
  uint64_t v2 = sub_1BF383E84((unint64_t *)&qword_1EA146F30);
  uint64_t v3 = sub_1BF383E84(&qword_1EA146F38);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

void type metadata accessor for NSKeyValueChangeKey()
{
  if (!qword_1EA146F10)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EA146F10);
    }
  }
}

uint64_t sub_1BF383DE8()
{
  return sub_1BF383E84(&qword_1EA146F18);
}

uint64_t sub_1BF383E1C()
{
  return sub_1BF383E84(&qword_1EA146F20);
}

uint64_t sub_1BF383E50()
{
  return sub_1BF383E84(&qword_1EA146F28);
}

uint64_t sub_1BF383E84(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for NSKeyValueChangeKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_1BF383EC8()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28ED0]), sel_initWithInteger_, 1);
  qword_1EB83D9C0 = (uint64_t)result;
  return result;
}

uint64_t sub_1BF383F00()
{
  uint64_t v0 = sub_1BF38B058();
  __swift_allocate_value_buffer(v0, qword_1EB83D988);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB83D988);
  return sub_1BF38B048();
}

id MSBucketBarConfigurationController.init(provider:)(uint64_t a1)
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProvider_, a1);
  swift_unknownObjectRelease();
  return v1;
}

id MSBucketBarConfigurationController.init(provider:)(void *a1)
{
  uint64_t v18 = sub_1BF38B188();
  uint64_t v3 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790]();
  char v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF38B178();
  MEMORY[0x1F4188790]();
  sub_1BF38B098();
  MEMORY[0x1F4188790]();
  id v17 = a1;
  *(void *)&v1[OBJC_IVAR___MSBucketBarConfigurationController_provider] = a1;
  unsigned int v6 = self;
  BOOL v7 = v1;
  swift_unknownObjectRetain();
  id v8 = objc_msgSend(v6, sel_weakObjectsHashTable);
  *(void *)&v7[OBJC_IVAR___MSBucketBarConfigurationController_observers] = v8;
  sub_1BF389484(0, (unint64_t *)&unk_1EB83DAA0);
  sub_1BF38B088();
  uint64_t v20 = MEMORY[0x1E4FBC860];
  sub_1BF384F64(&qword_1EB83DA98, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DA80);
  sub_1BF384FAC((unint64_t *)&unk_1EB83DA88, &qword_1EB83DA80);
  sub_1BF38B208();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCC58], v18);
  *(void *)&v7[OBJC_IVAR___MSBucketBarConfigurationController_observerQueue] = sub_1BF38B1A8();
  id v9 = v17;
  id v10 = objc_msgSend(v17, sel_bucketBarConfiguration);
  sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
  uint64_t v11 = sub_1BF38B0B8();

  uint64_t v20 = v11;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB83DA70);
  swift_allocObject();
  *(void *)&v7[OBJC_IVAR___MSBucketBarConfigurationController_configuration] = sub_1BF38B028();
  id v12 = objc_msgSend(v9, sel_bucketSelectionConfiguration);
  uint64_t v13 = sub_1BF38B0B8();

  uint64_t v20 = v13;
  swift_allocObject();
  *(void *)&v7[OBJC_IVAR___MSBucketBarConfigurationController_selection] = sub_1BF38B028();

  v19.receiver = v7;
  v19.super_class = (Class)MSBucketBarConfigurationController;
  id v14 = objc_msgSendSuper2(&v19, sel_init);
  objc_msgSend(v9, sel_setDelegate_, v14);

  swift_unknownObjectRelease();
  return v14;
}

Swift::Bool __swiftcall MSBucketBarConfigurationController.isBucketBarHidden(forMailboxes:)(Swift::OpaquePointer forMailboxes)
{
  if (!EMBlackPearlIsFeatureEnabled()) {
    return 1;
  }
  if (!((unint64_t)forMailboxes._rawValue >> 62))
  {
    uint64_t v2 = *(void *)(((unint64_t)forMailboxes._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
LABEL_20:
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_1BF38B298();
  if (!v2)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    return 1;
  }
LABEL_4:
  unint64_t v3 = (unint64_t)forMailboxes._rawValue & 0xC000000000000001;
  uint64_t v4 = 4;
  while (1)
  {
    uint64_t v5 = v4 - 4;
    if (v3)
    {
      unsigned int v6 = (void *)MEMORY[0x1C18A7A40](v4 - 4, forMailboxes._rawValue);
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v5, 1)) {
        goto LABEL_19;
      }
    }
    else
    {
      unsigned int v6 = (void *)*((void *)forMailboxes._rawValue + v4);
      swift_unknownObjectRetain();
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v5, 1))
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
    }
    unsigned __int8 v8 = objc_msgSend(v6, sel_isInboxMailbox);
    swift_unknownObjectRelease();
    if (v8) {
      break;
    }
    ++v4;
    if (v7 == v2) {
      goto LABEL_12;
    }
  }
  Swift::Bool result = swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRetain();
    id v10 = (void *)MEMORY[0x1C18A7A40](0, forMailboxes._rawValue);
    swift_bridgeObjectRelease();
LABEL_18:
    id v11 = objc_msgSend(v10, sel_bucketBarConfigurationIdentifier);
    swift_unknownObjectRelease();
    sub_1BF38B0F8();

    MEMORY[0x1F4188790]();
    swift_retain();
    sub_1BF38AFF8();
    swift_release();
    swift_bridgeObjectRelease();
    return v12;
  }
  if (*(void *)(((unint64_t)forMailboxes._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v10 = (void *)*((void *)forMailboxes._rawValue + 4);
    swift_unknownObjectRetain();
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void sub_1BF384610(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  uint64_t v7 = *a1;
  uint64_t v8 = *(void *)(*a1 + 16);
  swift_bridgeObjectRetain();
  if (v8 && (unint64_t v9 = sub_1BF38A738(a2, a3), (v10 & 1) != 0))
  {
    id v11 = *(id *)(*(void *)(v7 + 56) + 8 * v9);
  }
  else
  {
    sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
    id v11 = (id)sub_1BF38B1B8();
  }
  Swift::Bool v12 = v11;
  swift_bridgeObjectRelease();
  unsigned __int8 v13 = objc_msgSend(v12, sel_BOOLValue);

  *a4 = v13;
}

void sub_1BF3846C8(uint64_t *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  sub_1BF384610(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

Swift::Bool __swiftcall MSBucketBarConfigurationController.setBucketBarHidden(_:forMailboxes:)(Swift::Bool _, Swift::OpaquePointer forMailboxes)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1BF38B068();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  unint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1BF38B098();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790]();
  unsigned __int8 v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unint64_t)forMailboxes._rawValue >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1BF38B298();
    uint64_t v14 = v15;
    if (v15) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v14 = *(void *)(((unint64_t)forMailboxes._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
  LOBYTE(v15) = swift_bridgeObjectRetain();
  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v34 = v7;
  uint64_t v35 = v6;
  id v32 = v9;
  uint64_t v33 = v10;
  uint64_t v30 = v14;
  uint64_t v31 = v11;
  if (((unint64_t)forMailboxes._rawValue & 0xC000000000000001) != 0)
  {
    uint64_t v16 = (void *)MEMORY[0x1C18A7A40](0, forMailboxes._rawValue);
  }
  else
  {
    if (!*(void *)(((unint64_t)forMailboxes._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return v15;
    }
    uint64_t v16 = (void *)*((void *)forMailboxes._rawValue + 4);
    swift_unknownObjectRetain();
  }
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v16, sel_bucketBarConfigurationIdentifier);
  swift_unknownObjectRelease();
  uint64_t v18 = sub_1BF38B0F8();
  uint64_t v20 = v19;

  MEMORY[0x1F4188790]();
  *(&v29 - 4) = v18;
  *(&v29 - 3) = v20;
  *((unsigned char *)&v29 - 16) = _;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAD0);
  sub_1BF38AFF8();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void **)(v3 + OBJC_IVAR___MSBucketBarConfigurationController_provider);
  sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
  uint64_t v22 = (void *)sub_1BF38B0A8();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_storeBucketBarConfiguration_, v22);

  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v23;
  *(unsigned char *)(v24 + 24) = _;
  *(Swift::OpaquePointer *)(v24 + 32) = forMailboxes;
  aBlock[4] = sub_1BF384F10;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BF384F20;
  aBlock[3] = &block_descriptor;
  id v25 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1BF38B078();
  uint64_t v36 = MEMORY[0x1E4FBC860];
  sub_1BF384F64(&qword_1EB83D970, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83D978);
  sub_1BF384FAC(&qword_1EB83D980, &qword_1EB83D978);
  uint64_t v26 = v32;
  uint64_t v27 = v35;
  sub_1BF38B208();
  MEMORY[0x1C18A7980](0, v13, v26, v25);
  _Block_release(v25);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v26, v27);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v33);
  swift_release();
  swift_release();
  uint64_t v14 = v30;
LABEL_9:
  LOBYTE(v15) = v14 != 0;
  return v15;
}

uint64_t sub_1BF384C14@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
  uint64_t v8 = sub_1BF38B1B8();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *a1;
  *a1 = 0x8000000000000000;
  sub_1BF387E84(v8, a2, a3, isUniquelyReferenced_nonNull_native);
  *a1 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a4 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BF384CF0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF384C14(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_1BF384CFC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BF384D34(uint64_t a1, char a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1C18A8380](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v4
                                                               + OBJC_IVAR___MSBucketBarConfigurationController_observers), sel_allObjects));
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1470A0);
    unint64_t v7 = sub_1BF38B138();

    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1BF38B298();
      swift_bridgeObjectRelease();
      if (v8) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v8)
      {
LABEL_4:
        if (v8 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v9 = 0;
        uint64_t v10 = a2 & 1;
        do
        {
          if ((v7 & 0xC000000000000001) != 0)
          {
            uint64_t v11 = (void *)MEMORY[0x1C18A7A40](v9, v7);
          }
          else
          {
            uint64_t v11 = *(void **)(v7 + 8 * v9 + 32);
            swift_unknownObjectRetain();
          }
          ++v9;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAB0);
          uint64_t v12 = (void *)sub_1BF38B128();
          objc_msgSend(v11, sel_bucketBarConfigurationController_isHidden_forMailboxes_, v5, v10, v12);
          swift_unknownObjectRelease();
        }
        while (v8 != v9);
      }
    }

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1BF384ED0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1BF384F10()
{
  sub_1BF384D34(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_1BF384F20(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1BF384F64(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BF384FAC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

Swift::Int __swiftcall MSBucketBarConfigurationController.selectedBucket(forMailboxes:)(Swift::OpaquePointer forMailboxes)
{
  swift_getObjectType();
  if ((unint64_t)forMailboxes._rawValue >> 62)
  {
    swift_bridgeObjectRetain();
    Swift::Int result = sub_1BF38B298();
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v2 = *(void *)(((unint64_t)forMailboxes._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
  Swift::Int result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_8;
  }
LABEL_3:
  if (((unint64_t)forMailboxes._rawValue & 0xC000000000000001) != 0)
  {
    uint64_t v4 = (void *)MEMORY[0x1C18A7A40](0, forMailboxes._rawValue);
    goto LABEL_6;
  }
  if (*(void *)(((unint64_t)forMailboxes._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v4 = (void *)*((void *)forMailboxes._rawValue + 4);
    swift_unknownObjectRetain();
LABEL_6:
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v4, sel_bucketBarConfigurationIdentifier);
    swift_unknownObjectRelease();
    sub_1BF38B0F8();

    MEMORY[0x1F4188790]();
    swift_retain();
    sub_1BF38AFF8();
    swift_release();
    swift_bridgeObjectRelease();
    return v6;
  }
  __break(1u);
  return result;
}

void sub_1BF385200(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v7 = *a1;
  uint64_t v8 = *(void *)(*a1 + 16);
  swift_bridgeObjectRetain();
  if (v8 && (unint64_t v9 = sub_1BF38A738(a2, a3), (v10 & 1) != 0))
  {
    uint64_t v11 = (id *)(*(void *)(v7 + 56) + 8 * v9);
  }
  else
  {
    if (qword_1EB83D9B0 != -1) {
      swift_once();
    }
    uint64_t v11 = (id *)&qword_1EB83D9C0;
  }
  id v12 = *v11;
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v12, sel_integerValue);

  *a4 = v13;
}

void sub_1BF3852D0(uint64_t *a1@<X0>, void *a2@<X8>)
{
  sub_1BF385200(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

Swift::Void __swiftcall MSBucketBarConfigurationController.setSelectedBucket(_:mailboxes:)(Swift::Int _, Swift::OpaquePointer mailboxes)
{
  uint64_t v3 = v2;
  if ((unint64_t)mailboxes._rawValue >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_1BF38B298())
    {
LABEL_3:
      if (((unint64_t)mailboxes._rawValue & 0xC000000000000001) != 0)
      {
        Swift::Int v6 = (void *)MEMORY[0x1C18A7A40](0, mailboxes._rawValue);
      }
      else
      {
        if (!*(void *)(((unint64_t)mailboxes._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_17;
        }
        Swift::Int v6 = (void *)*((void *)mailboxes._rawValue + 4);
        swift_unknownObjectRetain();
      }
      swift_bridgeObjectRelease();
      id v7 = objc_msgSend(v6, sel_bucketBarConfigurationIdentifier);
      swift_unknownObjectRelease();
      sub_1BF38B0F8();

      if (qword_1EB83D9A8 == -1)
      {
LABEL_7:
        uint64_t v8 = sub_1BF38B058();
        __swift_project_value_buffer(v8, (uint64_t)qword_1EB83D988);
        swift_bridgeObjectRetain_n();
        unint64_t v9 = sub_1BF38B038();
        os_log_type_t v10 = sub_1BF38B168();
        if (os_log_type_enabled(v9, v10))
        {
          uint64_t v11 = swift_slowAlloc();
          uint64_t v12 = swift_slowAlloc();
          uint64_t v24 = v12;
          *(_DWORD *)uint64_t v11 = 136315394;
          uint64_t v23 = v3;
          sub_1BF38743C();
          uint64_t v13 = sub_1BF38B1E8();
          sub_1BF386DE4(v13, v14, &v24);
          sub_1BF38B1C8();
          swift_bridgeObjectRelease();
          *(_WORD *)(v11 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAB0);
          uint64_t v16 = MEMORY[0x1C18A7930](mailboxes._rawValue, v15);
          unint64_t v18 = v17;
          swift_bridgeObjectRelease();
          uint64_t v19 = v16;
          uint64_t v3 = v23;
          sub_1BF386DE4(v19, v18, &v24);
          sub_1BF38B1C8();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1BF36E000, v9, v10, "Mark %s as selected for mailboxes: %s", (uint8_t *)v11, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1C18A8300](v12, -1, -1);
          MEMORY[0x1C18A8300](v11, -1, -1);
        }
        else
        {

          uint64_t v20 = swift_bridgeObjectRelease_n();
        }
        MEMORY[0x1F4188790](v20);
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAD0);
        sub_1BF38AFF8();
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v21 = *(void **)(v3 + OBJC_IVAR___MSBucketBarConfigurationController_provider);
        sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
        uint64_t v22 = (void *)sub_1BF38B0A8();
        swift_bridgeObjectRelease();
        objc_msgSend(v21, sel_storeBucketSelectionConfiguration_, v22);

        return;
      }
LABEL_17:
      swift_once();
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(((unint64_t)mailboxes._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_1BF385768@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  id v10 = objc_allocWithZone(MEMORY[0x1E4F28ED0]);
  swift_bridgeObjectRetain();
  id v11 = objc_msgSend(v10, sel_initWithInteger_, a4);
  if (v11)
  {
    uint64_t v12 = (uint64_t)v11;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *a1;
    *a1 = 0x8000000000000000;
    sub_1BF387E84(v12, a2, a3, isUniquelyReferenced_nonNull_native);
    *a1 = v16;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v14 = (void *)sub_1BF3875B4(a2, a3);
    swift_bridgeObjectRelease();
  }
  *a5 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BF38586C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BF385768(a1, v2[2], v2[3], v2[4], a2);
}

uint64_t MSBucketBarConfigurationController.addConfigurationObserver(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1BF38B068();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v31 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_1BF38B098();
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v29 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EB83D9A8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_1BF38B058();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EB83D988);
  swift_unknownObjectRetain_n();
  unint64_t v9 = sub_1BF38B038();
  os_log_type_t v10 = sub_1BF38B168();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v27 = v2;
    id v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    aBlock[0] = v12;
    *(_DWORD *)id v11 = 136315138;
    id v13 = objc_msgSend(a1, sel_description, v11 + 4);
    uint64_t v14 = v4;
    uint64_t v15 = sub_1BF38B0F8();
    uint64_t v28 = v5;
    unint64_t v17 = v16;

    uint64_t v2 = v27;
    uint64_t v18 = v15;
    uint64_t v4 = v14;
    uint64_t v33 = sub_1BF386DE4(v18, v17, aBlock);
    sub_1BF38B1C8();
    swift_unknownObjectRelease_n();
    uint64_t v5 = v28;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BF36E000, v9, v10, "Adding observer: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C18A8300](v12, -1, -1);
    MEMORY[0x1C18A8300](v11, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  uint64_t v28 = *(void *)(v2 + OBJC_IVAR___MSBucketBarConfigurationController_observerQueue);
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v19;
  *(void *)(v21 + 24) = v20;
  aBlock[4] = (uint64_t)sub_1BF3874D0;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1BF384F20;
  aBlock[3] = (uint64_t)&block_descriptor_13;
  uint64_t v22 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  uint64_t v23 = v29;
  sub_1BF38B078();
  uint64_t v33 = MEMORY[0x1E4FBC860];
  sub_1BF384F64(&qword_1EB83D970, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83D978);
  sub_1BF384FAC(&qword_1EB83D980, &qword_1EB83D978);
  uint64_t v24 = v31;
  sub_1BF38B208();
  MEMORY[0x1C18A7980](0, v23, v24, v22);
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v24, v4);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v23, v32);
  swift_release();
  swift_release();
  return swift_release();
}

void sub_1BF385DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1C18A8380](v3);
  if (v4)
  {
    uint64_t v5 = (char *)v4;
    swift_beginAccess();
    uint64_t v6 = MEMORY[0x1C18A8380](a2 + 16);
    if (v6)
    {
      objc_msgSend(*(id *)&v5[OBJC_IVAR___MSBucketBarConfigurationController_observers], sel_addObject_, v6);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t MSBucketBarConfigurationController.removeConfigurationObserver(_:)(void *a1)
{
  uint64_t v2 = v1;
  if (qword_1EB83D9A8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1BF38B058();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EB83D988);
  swift_unknownObjectRetain_n();
  uint64_t v5 = sub_1BF38B038();
  os_log_type_t v6 = sub_1BF38B168();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    aBlock[0] = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    id v9 = objc_msgSend(a1, sel_description);
    uint64_t v10 = sub_1BF38B0F8();
    unint64_t v12 = v11;

    sub_1BF386DE4(v10, v12, aBlock);
    sub_1BF38B1C8();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BF36E000, v5, v6, "Removing observer: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C18A8300](v8, -1, -1);
    MEMORY[0x1C18A8300](v7, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  id v13 = *(NSObject **)&v2[OBJC_IVAR___MSBucketBarConfigurationController_observerQueue];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v2;
  *(void *)(v14 + 24) = a1;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_1BF387518;
  *(void *)(v15 + 24) = v14;
  aBlock[4] = (uint64_t)sub_1BF387544;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1BF3861A4;
  aBlock[3] = (uint64_t)&block_descriptor_22;
  unint64_t v16 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  unint64_t v17 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v13, v16);
  _Block_release(v16);
  LOBYTE(v16) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v16) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BF3861A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_1BF3861E4(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v7 = a1;
  a4(a3);
  swift_unknownObjectRelease();
}

uint64_t MSBucketBarConfigurationController.stateCaptureInformation()()
{
  swift_retain();
  sub_1BF38B008();
  swift_release();
  swift_retain();
  sub_1BF38B008();
  swift_release();
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_1BF3863A4(v0);
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_1BF38653C(v2, v1);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v7;
  *(void *)(swift_allocObject() + 16) = v7;
  uint64_t v5 = sub_1BF388F60(MEMORY[0x1E4FBC868], v3, sub_1BF3875A4, v4, sub_1BF3875AC);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v5;
}

uint64_t sub_1BF3863A4(uint64_t a1)
{
  uint64_t result = sub_1BF38B158();
  int64_t v3 = 0;
  uint64_t v18 = result;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    unint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1BF3884D0(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1BF38653C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v18 = a2;
  uint64_t v4 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    unint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1BF3884D0(&v17, v12, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1BF3866BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0x656C6269736956;
  if (*(void *)(a3 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1BF38A738(a1, a2);
    if (v8)
    {
      id v9 = *(id *)(*(void *)(a3 + 56) + 8 * v7);
      swift_bridgeObjectRelease();
      unsigned int v10 = objc_msgSend(v9, sel_BOOLValue);

      if (v10) {
        return 0x6E6564646948;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return v3;
}

uint64_t sub_1BF386780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0x7972616D697250;
  if (*(void *)(a3 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1BF38A738(a1, a2);
    if (v8)
    {
      id v9 = *(id *)(*(void *)(a3 + 56) + 8 * v7);
      swift_bridgeObjectRelease();
      switch((unint64_t)objc_msgSend(v9, sel_integerValue))
      {
        case 0uLL:

          uint64_t v3 = 1701736270;
          break;
        case 2uLL:

          uint64_t v3 = 0x746361736E617254;
          break;
        case 3uLL:

          uint64_t v3 = 0x73657461647055;
          break;
        case 4uLL:

          uint64_t v3 = 0x6F69746F6D6F7250;
          break;
        case 5uLL:

          uint64_t v3 = 0x6C69614D206C6C41;
          break;
        default:

          break;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return v3;
}

uint64_t sub_1BF386900(uint64_t *a1, uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v9 = *a2;
  uint64_t v8 = a2[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1470A8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BF3946A0;
  *(void *)(inited + 32) = 0x422074656B637542;
  *(void *)(inited + 40) = 0xEA00000000007261;
  swift_bridgeObjectRetain();
  *(void *)(inited + 48) = a3(v9, v8);
  *(void *)(inited + 56) = v11;
  *(void *)(inited + 64) = 0x64657463656C6553;
  *(void *)(inited + 72) = 0xEF74656B63754220;
  *(void *)(inited + 80) = a5(v9, v8);
  *(void *)(inited + 88) = v12;
  unint64_t v13 = sub_1BF389540(inited);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *a1;
  *a1 = 0x8000000000000000;
  sub_1BF387FF4(v13, v9, v8, isUniquelyReferenced_nonNull_native);
  *a1 = v16;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void __swiftcall MSBucketBarConfigurationController.init()(MSBucketBarConfigurationController *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void MSBucketBarConfigurationController.init()()
{
}

uint64_t MSBucketBarConfigurationController.bucketBarConfigurationProvider(_:didChangeConfiguration:)(uint64_t a1, uint64_t a2)
{
  return sub_1BF389174(a2);
}

void sub_1BF386BE8(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x1C18A8380](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                               + OBJC_IVAR___MSBucketBarConfigurationController_observers), sel_allObjects));
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1470A0);
    unint64_t v5 = sub_1BF38B138();

    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_1BF38B298();
      swift_bridgeObjectRelease();
      if (v6) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v6)
      {
LABEL_4:
        if (v6 < 1)
        {
          __break(1u);
          return;
        }
        for (uint64_t i = 0; i != v6; ++i)
        {
          if ((v5 & 0xC000000000000001) != 0)
          {
            uint64_t v8 = (void *)MEMORY[0x1C18A7A40](i, v5);
          }
          else
          {
            uint64_t v8 = *(void **)(v5 + 8 * i + 32);
            swift_unknownObjectRetain();
          }
          objc_msgSend(v8, sel_bucketBarConfigurationControllerRequiresReload_, v3);
          swift_unknownObjectRelease();
        }
      }
    }

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1BF386DE4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1BF386EB8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1BF3894C8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1BF3894C8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1BF386EB8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1BF38B1D8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1BF387074(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1BF38B268();
  if (!v8)
  {
    sub_1BF38B278();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1BF38B2D8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1BF387074(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1BF38710C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1BF3872EC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1BF3872EC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BF38710C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1BF387284(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1BF38B248();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1BF38B278();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1BF38B118();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1BF38B2D8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1BF38B278();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1BF387284(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83D9E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BF3872EC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83D9E0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1BF38B2D8();
  __break(1u);
  return result;
}

unint64_t sub_1BF38743C()
{
  unint64_t result = qword_1EB83D9B8;
  if (!qword_1EB83D9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB83D9B8);
  }
  return result;
}

uint64_t sub_1BF387490()
{
  swift_release();
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BF3874D0()
{
  sub_1BF385DD8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1BF3874D8()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_1BF387518()
{
  return objc_msgSend(*(id *)(*(void *)(v0 + 16) + OBJC_IVAR___MSBucketBarConfigurationController_observers), sel_removeObject_, *(void *)(v0 + 24));
}

uint64_t sub_1BF387534()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BF387544()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1BF38756C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BF3875A4(uint64_t a1, uint64_t a2)
{
  return sub_1BF3866BC(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1BF3875AC(uint64_t a1, uint64_t a2)
{
  return sub_1BF386780(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1BF3875B4(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1BF38A738(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1BF388164();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_1BF387CAC(v6, v9);
  *unint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1BF387684(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB83D9D0);
  char v38 = a2;
  uint64_t v6 = sub_1BF38B2B8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_1BF38B328();
    sub_1BF38B108();
    uint64_t result = sub_1BF38B348();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_1BF387994(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1470B0);
  char v36 = a2;
  uint64_t v6 = sub_1BF38B2B8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1BF38B328();
    sub_1BF38B108();
    uint64_t result = sub_1BF38B348();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

unint64_t sub_1BF387CAC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1BF38B218();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1BF38B328();
        swift_bridgeObjectRetain();
        sub_1BF38B108();
        uint64_t v9 = sub_1BF38B348();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_1BF387E84(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1BF38A738(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1BF388164();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1BF387684(v15, a4 & 1);
  unint64_t v20 = sub_1BF38A738(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_1BF38B318();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

uint64_t sub_1BF387FF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1BF38A738(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1BF388318();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_1BF387994(v15, a4 & 1);
  unint64_t v21 = sub_1BF38A738(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_1BF38B318();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

id sub_1BF388164()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB83D9D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BF38B2A8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1BF388318()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1470B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BF38B2A8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1BF3884D0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1BF38B328();
  swift_bridgeObjectRetain();
  sub_1BF38B108();
  uint64_t v8 = sub_1BF38B348();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1BF38B2F8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1BF38B2F8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1BF388960(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1BF388680()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1470B8);
  uint64_t v3 = sub_1BF38B238();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_1BF38B328();
      sub_1BF38B108();
      uint64_t result = sub_1BF38B348();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_1BF388960(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1BF388680();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1BF388AFC();
      goto LABEL_22;
    }
    sub_1BF388CB0();
  }
  uint64_t v11 = *v4;
  sub_1BF38B328();
  sub_1BF38B108();
  uint64_t result = sub_1BF38B348();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1BF38B2F8(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1BF38B308();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1BF38B2F8();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_1BF388AFC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1470B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1BF38B228();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1BF388CB0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1470B8);
  uint64_t v3 = sub_1BF38B238();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1BF38B328();
    swift_bridgeObjectRetain();
    sub_1BF38B108();
    uint64_t result = sub_1BF38B348();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1BF388F60(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v25 = a1;
  uint64_t v22 = a2 + 56;
  uint64_t v10 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(a2 + 56);
  int64_t v23 = (unint64_t)(v10 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v14 = 0;
  if (!v12) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v15 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v14 << 6))
  {
    uint64_t v20 = (uint64_t *)(*(void *)(a2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    v24[0] = *v20;
    v24[1] = v21;
    swift_bridgeObjectRetain();
    sub_1BF386900(&v25, v24, a3, a4, a5);
    if (v5)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v14++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v14 >= v23) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v22 + 8 * v14);
    if (!v18) {
      break;
    }
LABEL_17:
    unint64_t v12 = (v18 - 1) & v18;
  }
  int64_t v19 = v14 + 1;
  if (v14 + 1 >= v23) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v22 + 8 * v19);
  if (v18) {
    goto LABEL_16;
  }
  int64_t v19 = v14 + 2;
  if (v14 + 2 >= v23) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v22 + 8 * v19);
  if (v18) {
    goto LABEL_16;
  }
  int64_t v19 = v14 + 3;
  if (v14 + 3 >= v23) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v22 + 8 * v19);
  if (v18) {
    goto LABEL_16;
  }
  int64_t v19 = v14 + 4;
  if (v14 + 4 >= v23)
  {
LABEL_26:
    swift_release();
    return v25;
  }
  unint64_t v18 = *(void *)(v22 + 8 * v19);
  if (v18)
  {
LABEL_16:
    int64_t v14 = v19;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v14 >= v23) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v22 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_17;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1BF389174(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1BF38B068();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1BF38B098();
  uint64_t v8 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = a1;
  swift_retain();
  sub_1BF38B018();
  swift_release();
  v14[1] = *(void *)(v2 + OBJC_IVAR___MSBucketBarConfigurationController_observerQueue);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_1BF3894C0;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BF384F20;
  aBlock[3] = &block_descriptor_33;
  unint64_t v12 = _Block_copy(aBlock);
  swift_retain();
  sub_1BF38B078();
  uint64_t v16 = MEMORY[0x1E4FBC860];
  sub_1BF384F64(&qword_1EB83D970, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83D978);
  sub_1BF384FAC(&qword_1EB83D980, &qword_1EB83D978);
  sub_1BF38B208();
  MEMORY[0x1C18A7980](0, v10, v7, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v15);
  swift_release();
  return swift_release();
}

uint64_t type metadata accessor for MSBucketBarConfigurationController(uint64_t a1)
{
  return sub_1BF389484(a1, &qword_1EA147030);
}

uint64_t sub_1BF389484(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_1BF3894C0()
{
  sub_1BF386BE8(v0);
}

uint64_t sub_1BF3894C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1BF389540(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA147160);
  uint64_t v2 = (void *)sub_1BF38B2C8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1BF38A738(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    unint64_t v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1BF389664(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB83D9D0);
  uint64_t v2 = (void *)sub_1BF38B2C8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_1BF38A738(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t MSUserDefaultsBucketBarConfigurationProvider.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_delegate;
  swift_beginAccess();
  return MEMORY[0x1C18A8380](v1);
}

uint64_t MSUserDefaultsBucketBarConfigurationProvider.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void __swiftcall MSUserDefaultsBucketBarConfigurationProvider.init()(MSUserDefaultsBucketBarConfigurationProvider *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

uint64_t MSUserDefaultsBucketBarConfigurationProvider.init()()
{
  id v1 = objc_msgSend(self, sel_em_userDefaults);
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = objc_msgSend(v0, sel_initWithUserDefaults_delegate_, v1, 0);

    return (uint64_t)v3;
  }
  else
  {
    uint64_t result = sub_1BF38B288();
    __break(1u);
  }
  return result;
}

id MSUserDefaultsBucketBarConfigurationProvider.init(userDefaults:delegate:)(void *a1, uint64_t a2)
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUserDefaults_delegate_, a1, a2);

  swift_unknownObjectRelease();
  return v3;
}

char *MSUserDefaultsBucketBarConfigurationProvider.init(userDefaults:delegate:)(void *a1)
{
  swift_unknownObjectWeakInit();
  id v3 = &v1[OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_bucketBarConfigurationKey];
  *(void *)id v3 = 0xD000000000000016;
  *((void *)v3 + 1) = 0x80000001BF3941F0;
  uint64_t v4 = &v1[OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_bucketSelectionConfigurationKey];
  *(void *)uint64_t v4 = 0xD00000000000001CLL;
  *((void *)v4 + 1) = 0x80000001BF394210;
  *(void *)&v1[OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_token] = 0;
  *(void *)&v1[OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_userDefaults] = a1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB83DA08);
  swift_allocObject();
  uint64_t v5 = v1;
  id v6 = a1;
  *(void *)&v5[OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_skipNextUpdate] = sub_1BF38B028();

  v14.receiver = v5;
  v14.super_class = (Class)MSUserDefaultsBucketBarConfigurationProvider;
  uint64_t v7 = (char *)objc_msgSendSuper2(&v14, sel_init);
  swift_bridgeObjectRetain();
  id v8 = (void *)sub_1BF38B0C8();
  swift_bridgeObjectRelease();
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_1BF389F78;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BF389F90;
  aBlock[3] = &block_descriptor_0;
  char v10 = _Block_copy(aBlock);
  swift_release();
  id v11 = objc_msgSend(v6, sel_ef_observeKeyPath_options_autoCancelToken_usingBlock_, v8, 1, 1, v10);

  swift_unknownObjectRelease();
  _Block_release(v10);

  *(void *)&v7[OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_token] = v11;
  swift_unknownObjectRelease();
  return v7;
}

uint64_t sub_1BF389D50()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1BF389D88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1C18A8380](v3);
  if (!v4) {
    return;
  }
  uint64_t v5 = (void *)v4;
  if (!a1 || !*(void *)(a1 + 16))
  {
    long long v13 = 0u;
    long long v14 = 0u;
LABEL_7:

    sub_1BF38A0DC((uint64_t)&v13);
    return;
  }
  id v6 = (id)*MEMORY[0x1E4F284C8];
  unint64_t v7 = sub_1BF38A7B0((uint64_t)v6);
  if (v8)
  {
    sub_1BF3894C8(*(void *)(a1 + 56) + 32 * v7, (uint64_t)&v13);
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }

  if (!*((void *)&v14 + 1)) {
    goto LABEL_7;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAD0);
  if (swift_dynamicCast())
  {
    swift_retain();
    sub_1BF38AFF8();
    swift_release();
    if ((v13 & 1) != 0 || (id v9 = objc_msgSend(v5, sel_delegate)) == 0)
    {

      swift_bridgeObjectRelease();
    }
    else
    {
      char v10 = v9;
      sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
      id v11 = v5;
      uint64_t v12 = (void *)sub_1BF38B0A8();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_bucketBarConfigurationProvider_didChangeConfiguration_, v11, v12);

      swift_unknownObjectRelease();
    }
  }
  else
  {
  }
}

void sub_1BF389F78(uint64_t a1)
{
  sub_1BF389D88(a1, v1);
}

char *sub_1BF389F80@<X0>(char *result@<X0>, unsigned char *a2@<X8>)
{
  char v2 = *result;
  *uint64_t result = 0;
  *a2 = v2;
  return result;
}

uint64_t sub_1BF389F90(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    type metadata accessor for NSKeyValueChangeKey();
    sub_1BF38A928();
    uint64_t v2 = sub_1BF38B0B8();
  }
  swift_retain();
  v3(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

unint64_t MSUserDefaultsBucketBarConfigurationProvider.bucketBarConfiguration()()
{
  return sub_1BF38A2C0();
}

uint64_t sub_1BF38A074(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BF38A0DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Void __swiftcall MSUserDefaultsBucketBarConfigurationProvider.storeBucketBarConfiguration(_:)(Swift::OpaquePointer a1)
{
  swift_retain();
  sub_1BF38B018();
  swift_release();
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_userDefaults);
  sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
  uint64_t v3 = (void *)sub_1BF38B0A8();
  uint64_t v4 = (void *)sub_1BF38B0C8();
  objc_msgSend(v2, sel_setObject_forKey_, v3, v4);
}

unint64_t MSUserDefaultsBucketBarConfigurationProvider.bucketSelectionConfiguration()()
{
  return sub_1BF38A2C0();
}

unint64_t sub_1BF38A2C0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_userDefaults);
  uint64_t v2 = (void *)sub_1BF38B0C8();
  id v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_1BF38B1F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_1BF38A074((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB83DAD0);
    if (swift_dynamicCast()) {
      return v5;
    }
  }
  else
  {
    sub_1BF38A0DC((uint64_t)v7);
  }
  return sub_1BF389664(MEMORY[0x1E4FBC860]);
}

id sub_1BF38A3C4(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
  uint64_t v5 = (void *)sub_1BF38B0A8();
  swift_bridgeObjectRelease();
  return v5;
}

Swift::Void __swiftcall MSUserDefaultsBucketBarConfigurationProvider.storeBucketSelectionConfiguration(_:)(Swift::OpaquePointer a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR___MSUserDefaultsBucketBarConfigurationProvider_userDefaults);
  sub_1BF389484(0, (unint64_t *)&unk_1EB83DAB8);
  id v3 = (void *)sub_1BF38B0A8();
  id v4 = (id)sub_1BF38B0C8();
  objc_msgSend(v2, sel_setObject_forKey_, v3, v4);
}

char *keypath_get_selector_delegate()
{
  return sel_delegate;
}

id sub_1BF38A518@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_delegate);
  *a2 = result;
  return result;
}

id sub_1BF38A554(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDelegate_, *a1);
}

uint64_t type metadata accessor for MSUserDefaultsBucketBarConfigurationProvider(uint64_t a1)
{
  return sub_1BF389484(a1, &qword_1EA147158);
}

uint64_t sub_1BF38A710(uint64_t a1)
{
  return a1;
}

unint64_t sub_1BF38A738(uint64_t a1, uint64_t a2)
{
  sub_1BF38B328();
  sub_1BF38B108();
  uint64_t v4 = sub_1BF38B348();
  return sub_1BF38A844(a1, a2, v4);
}

unint64_t sub_1BF38A7B0(uint64_t a1)
{
  sub_1BF38B0F8();
  sub_1BF38B328();
  sub_1BF38B108();
  uint64_t v2 = sub_1BF38B348();
  swift_bridgeObjectRelease();
  return sub_1BF38A980(a1, v2);
}

unint64_t sub_1BF38A844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1BF38B2F8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        long long v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1BF38B2F8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1BF38A928()
{
  unint64_t result = qword_1EA146F30;
  if (!qword_1EA146F30)
  {
    type metadata accessor for NSKeyValueChangeKey();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA146F30);
  }
  return result;
}

unint64_t sub_1BF38A980(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_1BF38B0F8();
    uint64_t v8 = v7;
    if (v6 == sub_1BF38B0F8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1BF38B2F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_1BF38B0F8();
          uint64_t v15 = v14;
          if (v13 == sub_1BF38B0F8() && v15 == v16) {
            break;
          }
          char v18 = sub_1BF38B2F8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

void MSPreferredCompositeNameForContact_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1BF36E000, log, OS_LOG_TYPE_ERROR, "Error re-fetching contact matching contact %@, error: %{public}@", buf, 0x16u);
}

uint64_t sub_1BF38AFE8()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1BF38AFF8()
{
  return MEMORY[0x1F41179C0]();
}

uint64_t sub_1BF38B008()
{
  return MEMORY[0x1F41179C8]();
}

uint64_t sub_1BF38B018()
{
  return MEMORY[0x1F41179D0]();
}

uint64_t sub_1BF38B028()
{
  return MEMORY[0x1F41179E0]();
}

uint64_t sub_1BF38B038()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1BF38B048()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1BF38B058()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1BF38B068()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1BF38B078()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1BF38B088()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1BF38B098()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1BF38B0A8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1BF38B0B8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1BF38B0C8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BF38B0D8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1BF38B0E8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1BF38B0F8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BF38B108()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BF38B118()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1BF38B128()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1BF38B138()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1BF38B148()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1BF38B158()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1BF38B168()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1BF38B178()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1BF38B188()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1BF38B198()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1BF38B1A8()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1BF38B1B8()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1BF38B1C8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1BF38B1D8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1BF38B1E8()
{
  return MEMORY[0x1F40E6D90]();
}

uint64_t sub_1BF38B1F8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BF38B208()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1BF38B218()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1BF38B228()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BF38B238()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BF38B248()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1BF38B258()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1BF38B268()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BF38B278()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1BF38B288()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BF38B298()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1BF38B2A8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1BF38B2B8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1BF38B2C8()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1BF38B2D8()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1BF38B2F8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BF38B308()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BF38B318()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BF38B328()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BF38B338()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BF38B348()
{
  return MEMORY[0x1F4185EF8]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A48](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

uint64_t EFObjectsAreEqual()
{
  return MEMORY[0x1F4117B00]();
}

uint64_t EFStringsAreEqual()
{
  return MEMORY[0x1F4117B68]();
}

uint64_t EMBlackPearlIsFeatureEnabled()
{
  return MEMORY[0x1F41177C0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromEMSmartMailboxType()
{
  return MEMORY[0x1F4117840]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _EFLocalizedString()
{
  return MEMORY[0x1F4117B90]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}