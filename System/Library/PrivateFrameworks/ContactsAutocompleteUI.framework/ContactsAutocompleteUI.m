void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t sRecipientHandle_block_invoke(uint64_t a1, void *a2)
{
  return [a2 normalizedAddress];
}

void sub_1B5AF8FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5AFA804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1B5AFADA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t isTraitCollectionAccessible(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *MEMORY[0x1E4F43778];
  uint64_t v9 = *MEMORY[0x1E4F43780];
  uint64_t v10 = v1;
  uint64_t v2 = *MEMORY[0x1E4F43768];
  uint64_t v11 = *MEMORY[0x1E4F43770];
  uint64_t v12 = v2;
  uint64_t v13 = *MEMORY[0x1E4F43760];
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a1;
  v5 = [v3 arrayWithObjects:&v9 count:5];
  v6 = objc_msgSend(v4, "preferredContentSizeCategory", v9, v10, v11, v12, v13, v14);

  uint64_t v7 = [v5 containsObject:v6];
  return v7;
}

NSObject *CreateSuggestionsFetchDebounceDispatchTimer(NSObject *a1, void *a2, double a3)
{
  id v5 = a2;
  v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, a1);
  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    dispatch_source_set_event_handler(v6, v5);
    dispatch_resume(v6);
  }

  return v6;
}

void sub_1B5B0043C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5B011F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5B057C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5B08410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5B08AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1B5B090BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5B0A02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t CNComposeFirstIndexInRangePassingTest(unint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = (unsigned int (**)(void, void))v5;
  if (a1 > a2) {
    goto LABEL_9;
  }
  if ((*((uint64_t (**)(id, unint64_t))v5 + 2))(v5, a1))
  {
    a2 = a1;
    goto LABEL_10;
  }
  if (!v6[2](v6, a2))
  {
LABEL_9:
    a2 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_10;
  }
  while (a1 + 1 < a2)
  {
    if (v6[2](v6, (a2 + a1) >> 1)) {
      a2 = (a2 + a1) >> 1;
    }
    else {
      a1 = (a2 + a1) >> 1;
    }
  }
LABEL_10:

  return a2;
}

uint64_t CNComposeLastIndexInRangePassingTest(unint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (a1 <= a2)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __CNComposeLastIndexInRangePassingTest_block_invoke;
    v11[3] = &unk_1E61288C8;
    id v12 = v5;
    unint64_t IndexInRangePassingTest = CNComposeFirstIndexInRangePassingTest(a1, a2, v11);
    unint64_t v9 = IndexInRangePassingTest - 1;
    if (IndexInRangePassingTest == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v9 = a2;
    }
    if (IndexInRangePassingTest != a1) {
      uint64_t v7 = v9;
    }
  }
  return v7;
}

uint64_t __CNComposeLastIndexInRangePassingTest_block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

uint64_t CNComposeLastIndexPassingTest(uint64_t a1, void *a2)
{
  if (a1) {
    return CNComposeLastIndexInRangePassingTest(0, a1 - 1, a2);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

void sub_1B5B0D148(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id CNAutocompleteSharedContactStore()
{
  if (CNAutocompleteSharedContactStore_onceToken != -1) {
    dispatch_once(&CNAutocompleteSharedContactStore_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)CNAutocompleteSharedContactStore_store;

  return v0;
}

void __CNAutocompleteSharedContactStore_block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  [v2 setIncludeLocalContacts:1];
  [v2 setIncludeSuggestedContacts:1];
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v2];
  uint64_t v1 = (void *)CNAutocompleteSharedContactStore_store;
  CNAutocompleteSharedContactStore_store = v0;
}

id CNAutocompleteSharedLocalOnlyContactStore()
{
  if (CNAutocompleteSharedLocalOnlyContactStore_onceToken != -1) {
    dispatch_once(&CNAutocompleteSharedLocalOnlyContactStore_onceToken, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)CNAutocompleteSharedLocalOnlyContactStore_store;

  return v0;
}

void __CNAutocompleteSharedLocalOnlyContactStore_block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  [v2 setIncludeLocalContacts:1];
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v2];
  uint64_t v1 = (void *)CNAutocompleteSharedLocalOnlyContactStore_store;
  CNAutocompleteSharedLocalOnlyContactStore_store = v0;
}

id CNAutocompleteFetchNonUnifiedContactsForPredicate(void *a1, void *a2, void *a3, void *a4)
{
  return fetchContactsForPredicate(a1, a2, a3, 0, a4);
}

id fetchContactsForPredicate(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  uint64_t v10 = (objc_class *)MEMORY[0x1E4F1B908];
  id v11 = a3;
  id v12 = a1;
  uint64_t v13 = (void *)[[v10 alloc] initWithKeysToFetch:v11];

  [v13 setPredicate:v9];
  [v13 setUnifyResults:a4];
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  id v25 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __fetchContactsForPredicate_block_invoke;
  v23 = &unk_1E61289D8;
  id v15 = v14;
  id v24 = v15;
  LOBYTE(v10) = [v12 enumerateContactsWithFetchRequest:v13 error:&v25 usingBlock:&v20];

  id v16 = v25;
  if (v10)
  {

    v17 = objc_msgSend(v15, "copy", v20, v21, v22, v23);
  }
  else
  {
    v18 = contactsUtilsLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_1B5AF5000, v18, OS_LOG_TYPE_DEFAULT, "Error fetching contact matching predicate %@, error: %@", buf, 0x16u);
    }

    if (a5) {
      *a5 = v16;
    }

    v17 = 0;
  }

  return v17;
}

id CNAutocompleteCopyClosestMatchingExistingContactUsingAddressesAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  return copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(a1, a2, a3, a4, a5, 0);
}

id copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6)
{
  v54[7] = *MEMORY[0x1E4F143B8];
  id v10 = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = 0;
  v43 = v10;
  if (v10 && v12)
  {
    uint64_t v16 = *MEMORY[0x1E4F1ADF0];
    v54[0] = *MEMORY[0x1E4F1AEB0];
    v54[1] = v16;
    uint64_t v17 = *MEMORY[0x1E4F1ADE0];
    v54[2] = *MEMORY[0x1E4F1AEA0];
    v54[3] = v17;
    uint64_t v18 = *MEMORY[0x1E4F1AED8];
    v54[4] = *MEMORY[0x1E4F1AEB8];
    v54[5] = v18;
    v54[6] = v12;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:7];
    uint64_t v20 = v19;
    id v41 = v14;
    if (v14)
    {
      uint64_t v21 = [v19 arrayByAddingObjectsFromArray:v14];

      uint64_t v20 = (void *)v21;
    }
    id v22 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    if ([v12 isEqual:*MEMORY[0x1E4F1ADC8]])
    {
      v23 = v22;
      id v39 = v13;
      id v40 = v12;
      id v24 = (void (**)(uint64_t, uint64_t))&__block_literal_global_43;
    }
    else
    {
      if (![v12 isEqualToString:*MEMORY[0x1E4F1AEE0]])
      {
LABEL_19:
        if (objc_msgSend(v22, "count", v39, v40) == 1)
        {
          id v15 = [v22 anyObject];
        }
        else
        {
          v33 = objc_msgSend(v13, "ea_personNameComponents");
          v34 = objc_alloc_init(_CNCountableMatchesContext);
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_4;
          v44[3] = &unk_1E6128A40;
          v35 = v20;
          id v48 = &__block_literal_global_50;
          id v45 = v22;
          id v46 = v33;
          id v47 = v13;
          id v36 = v33;
          [(_CNCountableMatchesContext *)v34 countInstances:v45 usingPredicate:v44];
          v37 = [(_CNCountableMatchesContext *)v34 highestMatches];
          id v15 = [v37 anyObject];

          uint64_t v20 = v35;
        }
        id v14 = v41;

        goto LABEL_23;
      }
      v23 = v22;
      id v39 = v13;
      id v40 = v12;
      id v24 = (void (**)(uint64_t, uint64_t))&__block_literal_global_45;
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v25 = v11;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v50 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = v24[2]((uint64_t)v24, *(void *)(*((void *)&v49 + 1) + 8 * i));
          v31 = v20;
          v32 = fetchContactsForPredicate(v43, v30, v20, a6, 0);
          if (v32) {
            [v23 addObjectsFromArray:v32];
          }

          uint64_t v20 = v31;
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v27);
    }

    id v12 = v40;
    id v13 = v39;
    id v22 = v23;
    goto LABEL_19;
  }
LABEL_23:

  return v15;
}

id CNAutocompletePreferredAbbreviatedNameForAddressAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  id v12 = idealDisplayName(v10, a3);
  if (v9 && [v10 length] && objc_msgSend(v10, "ea_isLegalEmailAddress"))
  {
    id v13 = [MEMORY[0x1E4F28F30] descriptorForUsedKeys];
    v35[0] = v13;
    id v14 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1000];
    v35[1] = v14;
    id v15 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v35[2] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];

    if (v11)
    {
      uint64_t v17 = [v16 arrayByAddingObjectsFromArray:v11];

      uint64_t v16 = (void *)v17;
    }
    id v34 = v10;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(v9, v18, (void *)*MEMORY[0x1E4F1ADC8], v12, v16, 1u);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v12, "ea_personNameComponents");
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v19 givenName];
      if (v20)
      {
      }
      else
      {
        uint64_t v21 = [v19 familyName];

        if (!v21)
        {
LABEL_16:

          goto LABEL_17;
        }
      }
      id v22 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
      v23 = [v19 namePrefix];
      [v22 setNamePrefix:v23];

      id v24 = [v19 givenName];
      [v22 setGivenName:v24];

      id v25 = [v19 middleName];
      [v22 setMiddleName:v25];

      uint64_t v26 = [v19 familyName];
      [v22 setFamilyName:v26];

      uint64_t v27 = [v19 nameSuffix];
      [v22 setNameSuffix:v27];

      uint64_t v28 = [v22 copy];
      id v19 = (id)v28;
      if (!v28)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    id v29 = [MEMORY[0x1E4F1B910] stringFromContact:v19 style:1000];
    if (v29
      || ([MEMORY[0x1E4F1B910] stringFromContact:v19 style:0],
          (id v29 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v30 = v29;

      id v12 = v30;
    }
    if (a5)
    {
      id v19 = v19;
      *a5 = v19;
    }
    goto LABEL_16;
  }
LABEL_18:
  if (v12)
  {
    if ([v12 containsString:@"@"]
      && ![v12 isEqualToString:v10])
    {
      id v31 = [NSString stringWithFormat:@"%@ <%@>", v12, v10];
    }
    else
    {
      id v31 = v12;
    }
  }
  else
  {
    id v31 = v10;
  }
  v32 = v31;

  return v32;
}

id idealDisplayName(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 length];
    if (v6 < 3)
    {
      BOOL v8 = 0;
    }
    else
    {
      int v7 = [v5 characterAtIndex:0];
      BOOL v8 = 0;
      if (v7 == 60)
      {
        int v9 = [v5 characterAtIndex:v6 - 1];
        BOOL v8 = v9 == 62;
        if (v9 == 62) {
          v6 -= 2;
        }
      }
    }
    if (!objc_msgSend(v5, "compare:options:range:", v3, 9, v8, v6))
    {

      id v5 = 0;
    }
  }

  return v5;
}

id CNAutocompletePreferredCompositeNameForAddressAndDisplayName(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  id v12 = idealDisplayName(v10, a3);
  if (v9 && [v10 length] && objc_msgSend(v10, "ea_isLegalEmailAddress"))
  {
    id v13 = CNAutocompleteDescriptorForRequiredKeysForCompositeName();
    id v14 = v13;
    if (v11)
    {
      uint64_t v15 = [v13 arrayByAddingObjectsFromArray:v11];

      id v14 = (void *)v15;
    }
    v25[0] = v10;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    uint64_t v17 = copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName(v9, v16, (void *)*MEMORY[0x1E4F1ADC8], v12, v14, 1u);

    if (v17)
    {
      uint64_t v18 = preferredCompositeNameForUnifiedContact(v17);
      id v19 = (void *)v18;
      if (v18) {
        uint64_t v20 = (void *)v18;
      }
      else {
        uint64_t v20 = v12;
      }
      id v21 = v20;

      if (a5) {
        *a5 = v17;
      }
    }
    else
    {
      id v21 = v12;
    }

    id v12 = v21;
  }
  if (v12)
  {
    if ([v12 containsString:@"@"]
      && ![v12 isEqualToString:v10])
    {
      id v22 = [NSString stringWithFormat:@"%@ <%@>", v12, v10];
    }
    else
    {
      id v22 = v12;
    }
  }
  else
  {
    id v22 = v10;
  }
  v23 = v22;

  return v23;
}

id CNAutocompleteDescriptorForRequiredKeysForCompositeName()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F1AEC0];
  uint64_t v0 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];

  return v1;
}

id preferredCompositeNameForUnifiedContact(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
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

id CNAutocompletePreferredCompositeNameForContact(void *a1, void *a2)
{
  v34[11] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    id v5 = CNAutocompleteDescriptorForRequiredKeysForCompositeName();
    if (v3)
    {
      unint64_t v6 = (void *)MEMORY[0x1E4F1B8F8];
      int v7 = [v4 identifier];
      v33 = v7;
      BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
      id v9 = [v6 predicateForContactsWithIdentifiers:v8];
      id v29 = 0;
      id v10 = fetchContactsForPredicate(v3, v9, v5, 1, &v29);
      id v11 = v29;
      id v12 = [v10 firstObject];

      if (!v12)
      {
        id v13 = contactsUtilsLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          CNAutocompletePreferredCompositeNameForContact_cold_1((uint64_t)v4, (uint64_t)v11, v13);
        }
      }
    }
    else
    {
      id v12 = 0;
    }
    if (v12) {
      uint64_t v15 = v12;
    }
    else {
      uint64_t v15 = v4;
    }
    id v16 = v15;
    if (([v16 areKeysAvailable:v5] & 1) == 0)
    {
      id v17 = v16;
      uint64_t v18 = *MEMORY[0x1E4F1ADF0];
      v34[0] = *MEMORY[0x1E4F1AEB0];
      v34[1] = v18;
      uint64_t v19 = *MEMORY[0x1E4F1ADE0];
      v34[2] = *MEMORY[0x1E4F1AEA0];
      v34[3] = v19;
      uint64_t v20 = *MEMORY[0x1E4F1AEF8];
      v34[4] = *MEMORY[0x1E4F1AEB8];
      v34[5] = v20;
      uint64_t v21 = *MEMORY[0x1E4F1AEF0];
      v34[6] = *MEMORY[0x1E4F1AF00];
      v34[7] = v21;
      uint64_t v22 = *MEMORY[0x1E4F1AED8];
      v34[8] = *MEMORY[0x1E4F1AEC0];
      v34[9] = v22;
      v34[10] = *MEMORY[0x1E4F1ADC8];
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:11];
      id v24 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __fallbackContactForMissingContactRequiringKeys_block_invoke;
      v30[3] = &unk_1E6128A68;
      id v31 = v17;
      id v25 = v24;
      id v32 = v25;
      id v26 = v17;
      [v23 enumerateObjectsUsingBlock:v30];
      uint64_t v27 = v32;
      id v16 = v25;
    }
    id v14 = preferredCompositeNameForUnifiedContact(v16);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

id contactsUtilsLog()
{
  if (contactsUtilsLog_cn_once_token_1 != -1) {
    dispatch_once(&contactsUtilsLog_cn_once_token_1, &__block_literal_global_53);
  }
  uint64_t v0 = (void *)contactsUtilsLog_cn_once_object_1;

  return v0;
}

uint64_t __fetchContactsForPredicate_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:a2];
}

id __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:a2];
  id v4 = [v2 predicateForContactsMatchingPhoneNumber:v3];

  return v4;
}

uint64_t __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    return objc_msgSend(a2, "hasPrefix:");
  }
  else {
    return 0;
  }
}

uint64_t __copyClosestMatchingExistingUnifiedContactUsingAddressesAndDisplayName_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 countForObject:v4];
  uint64_t v6 = *(void *)(v2 + 56);
  int v7 = [v4 namePrefix];
  BOOL v8 = [*(id *)(v2 + 40) namePrefix];
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  uint64_t v9 = v5 + v6;
  uint64_t v10 = *(void *)(v2 + 56);
  id v11 = [v4 givenName];
  id v12 = [*(id *)(v2 + 40) givenName];
  LODWORD(v10) = (*(uint64_t (**)(uint64_t, void *, void *))(v10 + 16))(v10, v11, v12);

  uint64_t v13 = v9 + v10;
  uint64_t v14 = *(void *)(v2 + 56);
  uint64_t v15 = [v4 middleName];
  id v16 = [*(id *)(v2 + 40) middleName];
  LODWORD(v14) = (*(uint64_t (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v16);

  uint64_t v17 = v13 + v14;
  uint64_t v18 = *(void *)(v2 + 56);
  uint64_t v19 = [v4 familyName];
  uint64_t v20 = [*(id *)(v2 + 40) familyName];
  LODWORD(v18) = (*(uint64_t (**)(uint64_t, void *, void *))(v18 + 16))(v18, v19, v20);

  uint64_t v21 = v17 + v18;
  uint64_t v22 = *(void *)(v2 + 56);
  v23 = [v4 nameSuffix];
  id v24 = [*(id *)(v2 + 40) nameSuffix];
  LODWORD(v22) = (*(uint64_t (**)(uint64_t, void *, void *))(v22 + 16))(v22, v23, v24);

  uint64_t v25 = v21 + v22;
  uint64_t v26 = *(void *)(v2 + 56);
  uint64_t v27 = [v4 organizationName];

  LODWORD(v2) = (*(uint64_t (**)(uint64_t, void *, void))(v26 + 16))(v26, v27, *(void *)(v2 + 48));
  return v25 + v2;
}

uint64_t __contactsUtilsLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "CNAutocompleteUIContactsUtilities");
  uint64_t v1 = contactsUtilsLog_cn_once_object_1;
  contactsUtilsLog_cn_once_object_1 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void __fallbackContactForMissingContactRequiringKeys_block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isKeyAvailable:"))
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) valueForKey:v5];
    [v3 setValue:v4 forKey:v5];
  }
}

id _displayableAddressOfKind(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3 && a2 == 1)
  {
    id v4 = (void *)CPPhoneNumberCopyFormattedStringForTextMessage();
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;

      id v3 = [@"\u200E" stringByAppendingString:v6];
    }
  }

  return v3;
}

id _normalizeAddressOfKind(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3)
  {
    if (a2 == 1)
    {
      id v4 = v3;
      [v4 UTF8String];
      id v5 = (const char *)CPPhoneNumberCopyNormalized();
      if (v5)
      {
        id v6 = (char *)v5;
        CFStringRef v7 = CFStringCreateWithCString(0, v5, 0x8000100u);
        BOOL v8 = (void *)CPPhoneNumberCopyHomeCountryCode();
        uint64_t v9 = (const void *)CFPhoneNumberCreate();
        uint64_t String = CFPhoneNumberCreateString();

        id v4 = (id)String;
        if (!String) {
          id v4 = (id)CFPhoneNumberCreateString();
        }
        if (v9) {
          CFRelease(v9);
        }
        if (v7) {
          CFRelease(v7);
        }
        free(v6);
      }
    }
  }

  return v4;
}

uint64_t _fastCountOfCompleteMatches(void *a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  CFStringRef v7 = v6;
  if (v5)
  {
    id v29 = a3;
    BOOL v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v30 = v5;
    uint64_t v9 = [v5 componentsSeparatedByCharactersInSet:v8];

    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v9;
    uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v43;
      v33 = v7;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v43 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = v10;
          uint64_t v11 = *(void *)(*((void *)&v42 + 1) + 8 * v10);
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v36 = v7;
          uint64_t v12 = [v36 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v39;
LABEL_9:
            uint64_t v15 = 0;
            while (1)
            {
              if (*(void *)v39 != v14) {
                objc_enumerationMutation(v36);
              }
              id v16 = *(void **)(*((void *)&v38 + 1) + 8 * v15);
              if ([v37 count] == 1) {
                break;
              }
              uint64_t v17 = [v16 address];
              uint64_t v18 = [v16 displayString];
              uint64_t v19 = objc_msgSend(v18, "ea_personNameComponents");
              uint64_t v20 = [v19 givenName];

              if (v20)
              {
                uint64_t v21 = [v19 givenName];
                uint64_t v22 = [v21 rangeOfString:v11 options:1];

                if (!v22) {
                  goto LABEL_19;
                }
              }
              if (([v19 familyName],
                    v23 = objc_claimAutoreleasedReturnValue(),
                    v23,
                    v23)
                && ([v19 familyName],
                    id v24 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v25 = [v24 rangeOfString:v11 options:1],
                    v24,
                    !v25)
                || v17 && ![v17 rangeOfString:v11 options:1])
              {
LABEL_19:
                [v37 addObject:v16];
              }

              if (v13 == ++v15)
              {
                uint64_t v13 = [v36 countByEnumeratingWithState:&v38 objects:v46 count:16];
                if (v13) {
                  goto LABEL_9;
                }
                break;
              }
            }
          }

          uint64_t v10 = v35 + 1;
          CFStringRef v7 = v33;
        }
        while (v35 + 1 != v34);
        uint64_t v34 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v34);
    }

    id v26 = v37;
    *id v29 = v26;
    uint64_t v27 = [v26 count];

    id v5 = v30;
  }
  else
  {
    uint64_t v27 = [v6 count];
  }

  return v27;
}

id _sortedArrayByRelevancy(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  if ([v7 length])
  {
    long long v52 = a3;
    v53 = a4;
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = (void *)MEMORY[0x1E4F237B8];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = ___sortedArrayByRelevancy_block_invoke;
    v73[3] = &unk_1E6128B30;
    id v54 = v7;
    id v55 = v9;
    id v74 = v55;
    [v10 enumerateTokensForString:v7 locale:0 options:0 withHandler:v73];
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    __base = (char *)malloc_type_calloc(0x18uLL, [v8 count], 0xEAFB10CEuLL);
    v59 = v8;
    id v60 = v11;
    if ([v8 count])
    {
      uint64_t v12 = 0;
      do
      {
        uint64_t v58 = v12;
        uint64_t v13 = [v8 objectAtIndex:v12];
        v64 = [v13 compositeName];
        uint64_t v14 = [v13 address];
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id obj = v55;
        uint64_t v65 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
        v57 = v13;
        if (v65)
        {
          BOOL v66 = 0;
          uint64_t v62 = *(void *)v70;
          v63 = v14;
          uint64_t v15 = -1;
          do
          {
            for (uint64_t i = 0; i != v65; ++i)
            {
              if (*(void *)v70 != v62) {
                objc_enumerationMutation(obj);
              }
              uint64_t v17 = *(void **)(*((void *)&v69 + 1) + 8 * i);
              BOOL v68 = 0;
              uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
              if (!v14
                || ((uint64_t v19 = [v14 rangeOfString:v17 options:385],
                     uint64_t v21 = v19 - v20,
                     BOOL v68 = v19 == 0,
                     v19 != 0x7FFFFFFFFFFFFFFFLL)
                  ? (BOOL v22 = v21 == 0x7FFFFFFFFFFFFFFFLL)
                  : (BOOL v22 = 1),
                    v22))
              {
                char v23 = v66;
              }
              else
              {
                uint64_t v24 = v19;
                uint64_t v18 = v21 + 15;
                if (v19)
                {
                  char v23 = v19 == 0 || v66;
                }
                else
                {
                  uint64_t v25 = v20;
                  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14];
                  objc_msgSend(v26, "addAttribute:value:range:", @"CNComposeRecipientStringMatchType", @"CNComposeRecipientStringMatchAddress", v24, v25);
                  [v11 addObject:v26];

                  char v23 = 1;
                }
              }
              id v67 = 0;
              uint64_t v27 = _getDisplayNameMatches(v64, v17, &v67, &v68);
              id v28 = v67;
              [v11 addObjectsFromArray:v27];
              BOOL v66 = (v68 | v23 & 1) != 0;
              unint64_t v29 = [v28 count];
              if (v29
                && ([v28 objectAtIndex:0],
                    id v30 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v31 = [v30 integerValue],
                    v30,
                    v31 != 0x7FFFFFFFFFFFFFFFLL))
              {
                uint64_t v32 = v31 + 5;
              }
              else
              {
                uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
              }
              if (v29 < 2)
              {
                uint64_t v33 = 0;
              }
              else if (v29 - 2 < 2)
              {
                uint64_t v33 = 10;
              }
              else
              {
                uint64_t v33 = 0;
                uint64_t v34 = 3;
                do
                {
                  uint64_t v35 = [v28 objectAtIndex:v34 - 2];
                  v33 += [v35 integerValue];

                  ++v34;
                }
                while (v29 != v34);
                if (v33 != 0x7FFFFFFFFFFFFFFFLL) {
                  v33 += 10;
                }
                uint64_t v11 = v60;
              }
              id v36 = [v28 lastObject];
              uint64_t v37 = [v36 integerValue];

              if (v32 >= v33) {
                uint64_t v38 = v33;
              }
              else {
                uint64_t v38 = v32;
              }
              if (v38 >= v37) {
                uint64_t v38 = v37;
              }
              if (v38 >= v18) {
                uint64_t v38 = v18;
              }
              v15 += v38;

              uint64_t v14 = v63;
            }
            uint64_t v65 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
          }
          while (v65);
        }
        else
        {
          BOOL v66 = 0;
          uint64_t v15 = -1;
        }

        long long v39 = &__base[24 * v58];
        *(void *)long long v39 = v15;
        *((void *)v39 + 1) = v58;
        v39[16] = v66;

        uint64_t v12 = v58 + 1;
        id v8 = v59;
      }
      while (v58 + 1 < (unint64_t)[v59 count]);
    }
    qsort(__base, [v8 count], 0x18uLL, (int (__cdecl *)(const void *, const void *))_relevancyComparator);
    long long v40 = [MEMORY[0x1E4F1CA48] array];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    if ([v8 count])
    {
      unint64_t v42 = 0;
      long long v43 = __base + 16;
      do
      {
        uint64_t v44 = *((void *)v43 - 1);
        char v45 = *v43;
        id v46 = [v8 objectAtIndex:v44];
        [v41 setObject:v46 atIndexedSubscript:v42];

        id v8 = v59;
        if (v45)
        {
          id v47 = [v59 objectAtIndex:v44];
          [v40 addObject:v47];
        }
        v43 += 24;
        ++v42;
      }
      while (v42 < [v59 count]);
    }
    free(__base);
    id v48 = v40;
    *long long v52 = v48;
    id v49 = v60;
    void *v53 = v49;

    id v7 = v54;
  }
  else
  {
    id v50 = v8;
    *a3 = v50;
    *a4 = MEMORY[0x1E4F1CBF0];
    id v41 = v50;
  }

  return v41;
}

void sub_1B5B11B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id _getDisplayNameMatches(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a1;
  id v8 = a2;
  if ([v8 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    v25[0] = 0;
    v25[1] = v25;
    void v25[2] = 0x2020000000;
    v25[3] = 0;
    uint64_t v11 = (void *)MEMORY[0x1E4F237B8];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = ___getDisplayNameMatches_block_invoke;
    v18[3] = &unk_1E6128B70;
    id v19 = v8;
    id v12 = v9;
    id v20 = v12;
    char v23 = &v26;
    uint64_t v24 = v25;
    id v21 = v7;
    id v13 = v10;
    id v22 = v13;
    [v11 enumerateTokensForString:v21 locale:0 options:0 withHandler:v18];
    *a4 = *((unsigned char *)v27 + 24);
    id v14 = v12;
    *a3 = v14;
    uint64_t v15 = v22;
    id v16 = v13;

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    id v16 = (id)MEMORY[0x1E4F1CBF0];
    *a3 = MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

void sub_1B5B12C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void ___sortedArrayByRelevancy_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [NSString stringWithString:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

uint64_t _relevancyComparator(void *a1, void *a2)
{
  if (*a1 >= *a2) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = -1;
  }
  if (*a1 > *a2) {
    return 1;
  }
  else {
    return v2;
  }
}

void ___getDisplayNameMatches_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = v7;
  long long v19 = xmmword_1E6128B50;
  id v20 = @"CNComposeRecipientStringMatchLastName";
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7)
  {
    uint64_t v10 = objc_msgSend(v7, "rangeOfString:options:", *(void *)(a1 + 32), 385, v19, v20, v21);
    uint64_t v12 = v10;
    uint64_t v13 = v11;
    BOOL v14 = v10 == 0;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v9 = v10 - v11;
    }
  }
  else
  {
    BOOL v14 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v15 = *(void **)(a1 + 40);
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", v9, v19, v20);
  [v15 addObject:v16];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= v14;
  if (v14)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
      && a3 + a4 >= (unint64_t)[*(id *)(a1 + 48) length])
    {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 2;
    }
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8];
    objc_msgSend(v17, "addAttribute:value:range:", @"CNComposeRecipientStringMatchType", *((void *)&v19 + *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)), v12, v13);
    [*(id *)(a1 + 56) addObject:v17];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  for (uint64_t i = 16; i != -8; i -= 8)
}

void sub_1B5B152E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t IMCoreLibraryCore()
{
  if (!IMCoreLibraryCore_frameworkLibrary) {
    IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return IMCoreLibraryCore_frameworkLibrary;
}

uint64_t getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr;
  uint64_t v6 = getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr;
  if (!getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke;
    v2[3] = &unk_1E6128C28;
    v2[4] = &v3;
    __getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B5B193DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __IMCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IMCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_block_invoke(uint64_t a1)
{
  unsigned int v2 = (void *)IMCoreLibraryCore();
  if (!v2)
  {
    id v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "IMSPIGetGroupPhotosForChatsWithGroupIDs");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMSPIGetGroupPhotosForChatsWithGroupIDsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id CNAutocompleteContactKeyForRecentsKind(void *a1)
{
  id v1 = a1;
  if ([(id)*MEMORY[0x1E4F5CC60] isEqualToString:v1])
  {
    unsigned int v2 = (id *)MEMORY[0x1E4F1ADC8];
LABEL_5:
    id v3 = *v2;
    goto LABEL_7;
  }
  if ([(id)*MEMORY[0x1E4F5CC80] isEqualToString:v1])
  {
    unsigned int v2 = (id *)MEMORY[0x1E4F1AEE0];
    goto LABEL_5;
  }
  id v3 = 0;
LABEL_7:

  return v3;
}

id CNAutocompleteRecentsKindForContactKey(void *a1)
{
  id v1 = a1;
  if ([(id)*MEMORY[0x1E4F1ADC8] isEqualToString:v1])
  {
    unsigned int v2 = (id *)MEMORY[0x1E4F5CC60];
LABEL_5:
    id v3 = *v2;
    goto LABEL_7;
  }
  if ([(id)*MEMORY[0x1E4F1AEE0] isEqualToString:v1])
  {
    unsigned int v2 = (id *)MEMORY[0x1E4F5CC80];
    goto LABEL_5;
  }
  id v3 = 0;
LABEL_7:

  return v3;
}

BOOL CNComposeApplicationPreferredContentSizeIsLargerThanLarge()
{
  uint64_t v0 = [MEMORY[0x1E4F42738] sharedApplication];
  id v1 = [v0 preferredContentSizeCategory];

  BOOL v2 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E4F437B0]) == NSOrderedDescending;
  return v2;
}

void sub_1B5B1CC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

id CNIconImageForDownwardChevron()
{
  uint64_t v0 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438A0] scale:1];
  id v1 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.down" withConfiguration:v0];

  return v1;
}

id CNIconImageForPresentationOption(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5)
{
  id v7 = a2;
  if (a5) {
    _specialGlyphColorForSelectedPresentationOption(a1);
  }
  else {
    _specialGlyphColorForPresentationOption(a1);
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8) {
    id v8 = v7;
  }
  uint64_t v9 = 0;
  if (a1 <= 1023)
  {
    if (a1 <= 63)
    {
      if (a1 == 16)
      {
        uint64_t v9 = @"star.fill";
      }
      else if (a1 == 32)
      {
        uint64_t v9 = @"checkmark.seal.fill";
      }
    }
    else
    {
      switch(a1)
      {
        case 64:
          uint64_t v9 = @"lock.open.fill";
          break;
        case 128:
          uint64_t v9 = @"lock.fill";
          break;
        case 256:
          uint64_t v9 = @"questionmark.circle.fill";
          break;
      }
    }
  }
  else if (a1 >= 0x2000)
  {
    switch(a1)
    {
      case 0x2000:
        uint64_t v9 = @"hourglass.tophalf.filled";
        break;
      case 0x20000:
        uint64_t v9 = @"exclamationmark.circle";
        break;
      case 0x100000:
        uint64_t v9 = @"checkmark.circle.fill";
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 1024:
        uint64_t v9 = @"checkmark.circle";
        break;
      case 2048:
        uint64_t v9 = @"xmark.circle";
        break;
      case 4096:
        uint64_t v9 = @"questionmark.circle";
        break;
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438C0] scale:1];
  uint64_t v11 = [MEMORY[0x1E4F42A80] systemImageNamed:v9 withConfiguration:v10];
  id v12 = v11;
  if (v11)
  {
    if (v8)
    {
      uint64_t v13 = [v11 imageWithTintColor:v8 renderingMode:1];

      id v12 = (id)v13;
    }
    id v12 = v12;
  }

  return v12;
}

id _specialGlyphColorForSelectedPresentationOption(uint64_t a1)
{
  if (a1 == 0x20000) {
    [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  else {
  id v1 = _specialGlyphColorForPresentationOption(a1);
  }

  return v1;
}

id _specialGlyphColorForPresentationOption(uint64_t a1)
{
  BOOL v2 = 0;
  if (a1 > 4095)
  {
    if (a1 != 4096)
    {
      if (a1 == 0x2000)
      {
        BOOL v2 = [MEMORY[0x1E4F428B8] systemRedColor];
      }
      else if (a1 == 0x20000)
      {
        BOOL v2 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
      }
      goto LABEL_13;
    }
LABEL_10:
    BOOL v2 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
    goto LABEL_13;
  }
  if (a1 == 16)
  {
    BOOL v2 = [MEMORY[0x1E4F428B8] systemYellowColor];
    goto LABEL_13;
  }
  if (a1 == 1024 || a1 == 2048) {
    goto LABEL_10;
  }
LABEL_13:

  return v2;
}

void sub_1B5B2328C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5B24210(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CNComposeIsAppDesignedForVisionOS()
{
  return 0;
}

id CNAUILocalizedAddressSeparator()
{
  if (CNAUILocalizedAddressSeparator_cn_once_token_1 != -1) {
    dispatch_once(&CNAUILocalizedAddressSeparator_cn_once_token_1, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)CNAUILocalizedAddressSeparator_cn_once_object_1;

  return v0;
}

void __CNAUILocalizedAddressSeparator_block_invoke()
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v0 = [v3 localizedStringForKey:@"ADDRESS_SEPARATOR" value:&stru_1F0EC0C28 table:@"Localized"];
  uint64_t v1 = [v0 copy];
  BOOL v2 = (void *)CNAUILocalizedAddressSeparator_cn_once_object_1;
  CNAUILocalizedAddressSeparator_cn_once_object_1 = v1;
}

uint64_t getSimulateAutocompleteResultsInternalSetting()
{
  id v0 = +[CNAutocompleteUIPreferences copyCompositionServicesPreferenceValueForKey:@"SimulateAutocompleteResults"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v1 = [v0 BOOLValue];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

void sub_1B5B28ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5B29324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id contactsSearchManagerLog()
{
  if (contactsSearchManagerLog_cn_once_token_1 != -1) {
    dispatch_once(&contactsSearchManagerLog_cn_once_token_1, &__block_literal_global_14);
  }
  id v0 = (void *)contactsSearchManagerLog_cn_once_object_1;

  return v0;
}

uint64_t __contactsSearchManagerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "contactssearchmanager");
  uint64_t v1 = contactsSearchManagerLog_cn_once_object_1;
  contactsSearchManagerLog_cn_once_object_1 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1B5B2C934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5B2DF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5B2E7F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B5B2EB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5B2FE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5B31950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5B31F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5B332CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5B38EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CNAutocompletePreferredCompositeNameForContact_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B5AF5000, log, OS_LOG_TYPE_ERROR, "Error re-fetching contact matching contact %@, error: %@", (uint8_t *)&v3, 0x16u);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1F4114220]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1F4114228]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1F40DA778](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CNSubstringRangesContainingEmojiInString()
{
  return MEMORY[0x1F4112CF0]();
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1F41092D8]();
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  return MEMORY[0x1F4109358]();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1F4109368]();
}

uint64_t CPPhoneNumberCopyNormalized()
{
  return MEMORY[0x1F4109380]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1F4102B78]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1F4102BB0]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4102BB8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1F4102BE0]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1F4102C10]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1F4102C18]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1F4102C80](image);
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4102D90]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4102DD0]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4102DF0]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1F4102DF8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1F4102E00]();
}

uint64_t UIUnformattedPhoneNumberFromString()
{
  return MEMORY[0x1F4102E40]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1F40DEE20](inUTI, inConformsToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}