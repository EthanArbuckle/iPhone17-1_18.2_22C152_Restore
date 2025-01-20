void sub_21F5DBD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5DC244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ACHCanonicalUnitForGoalType(uint64_t a1)
{
  if (ACHCanonicalUnitForGoalType_onceToken != -1) {
    dispatch_once(&ACHCanonicalUnitForGoalType_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)ACHCanonicalUnitForGoalType_unitByGoalType;
  v3 = [NSNumber numberWithInteger:a1];
  v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

uint64_t ACHTemplateIsAvailableForCalendarAndDate(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v8 = [v5 availabilityStart];

  if (v8)
  {
    v9 = [v5 availabilityStart];
    v10 = [v6 dateFromComponents:v9];

    BOOL v11 = [v7 compare:v10] != -1;
  }
  else
  {
    BOOL v11 = 1;
  }
  v12 = [v5 availabilityEnd];

  if (v12)
  {
    v13 = [v5 availabilityEnd];
    v14 = [v6 dateFromComponents:v13];
    v15 = objc_msgSend(v6, "hk_startOfDateByAddingDays:toDate:", 1, v14);

    v16 = [v6 dateByAddingUnit:128 value:-1 toDate:v15 options:0];
    BOOL v17 = [v7 compare:v16] != 1;
  }
  else
  {
    BOOL v17 = 1;
  }

  return v11 & v17;
}

uint64_t ACHGoalCompletionTrigger(uint64_t a1)
{
  uint64_t v1 = 4;
  if (a1 == 1) {
    uint64_t v1 = 16;
  }
  if (a1 == 2) {
    return 32;
  }
  else {
    return v1;
  }
}

void sub_21F5DF944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F5DFB70(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_21F5DFD54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21F5E0B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_21F5E0EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5E1C74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21F5E23F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_21F5E3358(_Unwind_Exception *a1)
{
}

void sub_21F5E3904(_Unwind_Exception *a1)
{
}

void sub_21F5E4388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5E472C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5E5144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F5E5318(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F5E5D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id ACHEarnedInstanceAllKeys()
{
  v2[9] = *MEMORY[0x263EF8340];
  v2[0] = @"template_unique_name";
  v2[1] = @"created_date";
  v2[2] = @"earned_date";
  v2[3] = @"value_in_canonical_unit";
  v2[4] = @"value_canonical_unit";
  v2[5] = @"external_identifier";
  v2[6] = @"creator_device";
  v2[7] = @"sync_provenance";
  v2[8] = @"sync_identity";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:9];
  return v0;
}

id ACHEarnedInstancePredicateForKey(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F434A0];
  uint64_t v2 = *MEMORY[0x263F43488];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "key"));
  v4 = _HDSQLiteValueForNumber();
  id v5 = [v1 predicateWithProperty:v2 equalToValue:v4];

  return v5;
}

id ACHEarnedInstancePredicateUsingKey(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "hk_map:", &__block_literal_global_4);
  uint64_t v2 = [MEMORY[0x263F434B0] containsPredicateWithProperty:*MEMORY[0x263F43488] values:v1];

  return v2;
}

uint64_t __ACHEarnedInstancePredicateUsingKey_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 key];
  return [v2 numberWithUnsignedInteger:v3];
}

id ACHEarnedInstancePredicateForSyncAnchor(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F434A0];
  uint64_t v2 = *MEMORY[0x263F43488];
  uint64_t v3 = [NSNumber numberWithLongLong:a1];
  v4 = [v1 predicateWithProperty:v2 greaterThanValue:v3];

  return v4;
}

id ACHEarnedInstancePredicateForSyncProvenance(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F434A0];
  uint64_t v2 = [NSNumber numberWithLongLong:a1];
  uint64_t v3 = [v1 predicateWithProperty:@"sync_provenance" equalToValue:v2];

  return v3;
}

uint64_t ACHEarnedInstancePredicateForAllEarnedInstances()
{
  return [MEMORY[0x263F434D0] truePredicate];
}

uint64_t ACHEarnedInstancePredicateForTemplateUniqueName(uint64_t a1)
{
  return [MEMORY[0x263F434A0] predicateWithProperty:@"template_unique_name" equalToValue:a1];
}

uint64_t ACHEarnedInstancePredicateForEarnedDateComponentsString(uint64_t a1)
{
  return [MEMORY[0x263F434A0] predicateWithProperty:@"earned_date" equalToValue:a1];
}

void sub_21F5E82A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

id ACHEarnedInstanceSyncIdentityFromEarnedInstance(void *a1, int a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a1;
  uint64_t v10 = [v8 syncIdentityManager];
  BOOL v11 = [v10 legacySyncIdentity];

  v12 = [v9 syncIdentity];

  v13 = healthSyncIdentity(v12);

  v14 = [v8 syncIdentityManager];

  if (a2 && v13)
  {
    id v19 = 0;
    v15 = [v14 concreteIdentityForIdentity:v13 shouldCreate:1 transaction:v7 error:&v19];
    id v16 = v19;

    if (!v15)
    {
      BOOL v17 = ACHLogDatabase();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        ACHEarnedInstanceSyncIdentityFromEarnedInstance_cold_1();
      }
    }
  }
  else
  {
    v15 = [v14 currentSyncIdentity];
  }
  return v15;
}

void sub_21F5E9670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_21F5EA210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_21F5EB088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F5EB970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_21F5EBB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5EBF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5EC11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ACHAvailableTemplatesForDateComponentsAndCountryCodeInTemplates(void *a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263EFF8F0];
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  id v9 = objc_msgSend(v5, "hk_gregorianCalendar");
  uint64_t v10 = [v9 dateFromComponents:v8];

  BOOL v11 = ACHAvailableTemplatesForCountryCodeInTemplates(v7, v6);

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __ACHAvailableTemplatesForDateComponentsAndCountryCodeInTemplates_block_invoke;
  v16[3] = &unk_264515F58;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  v14 = objc_msgSend(v11, "hk_filter:", v16);

  return v14;
}

id ACHAvailableTemplatesForCountryCodeInTemplates(void *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        BOOL v11 = [v10 availableCountryCodes];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v13 = [v10 availableCountryCodes];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v22;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v22 != v16) {
                  objc_enumerationMutation(v13);
                }
                if (![*(id *)(*((void *)&v21 + 1) + 8 * j) caseInsensitiveCompare:v3]) {
                  [v5 addObject:v10];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v15);
          }
        }
        else
        {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  id v18 = (void *)[v5 copy];
  return v18;
}

uint64_t __ACHAvailableTemplatesForDateComponentsAndCountryCodeInTemplates_block_invoke(uint64_t a1, void *a2)
{
  return ACHTemplateIsAvailableForCalendarAndDate(a2, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

void sub_21F5EC664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5EC830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5ECB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5ED554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5EE644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F5F09C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_21F5F114C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_21F5F20E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5F3EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5F41F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5F7690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_21F5F7AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F5F8E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

BOOL ACHRequestAwardsProfileExtensionWithError(void *a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [a1 profileExtensionsConformingToProtocol:&unk_26D133BD8];
  uint64_t v7 = [v6 firstObject];
  if (v7)
  {
    v5[2](v5, v7);
  }
  else
  {
    uint64_t v8 = ACHLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ACHRequestAwardsProfileExtensionWithError_cold_1(v8);
    }

    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v15[0] = @"Activity Awards plugin is nil";
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v11 = [v9 errorWithDomain:@"com.apple.ActivityAchievements" code:1 userInfo:v10];

    id v12 = v11;
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v7 != 0;
}

void sub_21F5F9F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21F5FAC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_21F5FB2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FB8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FBAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FBD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FBFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FC258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FC4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FCAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FCCC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FCEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FD14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FD3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FD72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21F5FDB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FDF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F5FE2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id ACHMonthlyChallengeTemplateFromCacheValue(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 componentsSeparatedByString:@"_"];
  id v5 = [v4 firstObject];
  ACHMonthlyChallengeTypeFromMonthlyChallengeName();

  uint64_t v6 = [v4 objectAtIndexedSubscript:1];
  [v6 integerValue];

  uint64_t v7 = [v4 objectAtIndexedSubscript:2];
  [v7 integerValue];

  uint64_t v8 = [v4 objectAtIndexedSubscript:3];
  [v8 integerValue];

  uint64_t v9 = ACHDateComponentsForYearMonthDay();
  uint64_t v10 = [v3 dateFromComponents:v9];
  uint64_t v11 = objc_msgSend(v3, "hk_startOfMonthForDate:", v10);

  uint64_t v12 = objc_msgSend(v3, "hk_startOfMonthForDate:addingMonths:", v11, 1);
  uint64_t v13 = objc_msgSend(v3, "hk_startOfDateBySubtractingDays:fromDate:", 1, v12);
  uint64_t v14 = *MEMORY[0x263F234C0];
  uint64_t v15 = [v3 components:*MEMORY[0x263F234C0] fromDate:v11];
  uint64_t v16 = [v3 components:v14 fromDate:v13];

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F236B0]) initWithStartDateComponents:v15 endDateComponents:v16];
  id v18 = ACHMonthlyChallengeTemplate();
  if ((unint64_t)[v4 count] >= 5)
  {
    id v19 = [v4 objectAtIndexedSubscript:4];
    [v19 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    long long v24 = v12;
    long long v21 = v20 = v9;

    long long v22 = [v21 componentsSeparatedByString:@"|"];
    [v18 setAvailableSuffixes:v22];

    uint64_t v9 = v20;
    uint64_t v12 = v24;
  }

  return v18;
}

id _ACHMonthlyChallengeKeyFromTemplate(void *a1)
{
  uint64_t v1 = [a1 uniqueName];
  uint64_t v2 = [v1 componentsSeparatedByString:@"_"];

  if ([v2 count] == 3)
  {
    id v3 = NSString;
    id v4 = [v2 objectAtIndexedSubscript:1];
    id v5 = [v2 objectAtIndexedSubscript:2];
    uint64_t v6 = [v3 stringWithFormat:@"%@_%@", v4, v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_21F5FF5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_21F5FFA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t _ACHMonthlyChallengeKeyFromDateComponents(void *a1)
{
  uint64_t v1 = NSString;
  id v2 = a1;
  uint64_t v3 = [v2 year];
  uint64_t v4 = [v2 month];

  return objc_msgSend(v1, "stringWithFormat:", @"%04ld_%02ld", v3, v4);
}

void sub_21F5FFEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ACHExperienceTypeForDateWithProfile(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x263F0A598];
  uint64_t v10 = *MEMORY[0x263F09468];
  id v11 = a1;
  uint64_t v12 = [v9 characteristicTypeForIdentifier:v10];
  uint64_t v13 = [v11 userCharacteristicsManager];

  id v18 = 0;
  uint64_t v14 = [v13 userCharacteristicForType:v12 error:&v18];
  id v15 = v18;

  if (!v14)
  {
    if (v15)
    {
      if (a4)
      {
        uint64_t v16 = 0;
        *a4 = v15;
        goto LABEL_8;
      }
      _HKLogDroppedError();
    }
    uint64_t v16 = 0;
    goto LABEL_8;
  }
  uint64_t v16 = FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar();
LABEL_8:

  return v16;
}

uint64_t ACHExperienceTypeForDateWithHealthStore(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v14 = 0;
  uint64_t v9 = [a1 dateOfBirthComponentsWithError:&v14];
  id v10 = v14;
  id v11 = v10;
  if (!v9)
  {
    if (v10)
    {
      if (a4)
      {
        uint64_t v12 = 0;
        *a4 = v10;
        goto LABEL_8;
      }
      _HKLogDroppedError();
    }
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar();
LABEL_8:

  return v12;
}

void sub_21F6013B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_21F601680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F6027E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F60322C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_21F603404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F603694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ACHConfigurationSupportsIncrementalEvaluationWithIsAppleWatch(char a1)
{
  if (a1) {
    return 1;
  }
  id v2 = [MEMORY[0x263F0A980] sharedBehavior];
  uint64_t v3 = [v2 isStandalonePhoneFitnessMode];

  return v3;
}

void sub_21F604824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_21F604A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F604BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1_2(uint64_t a1, uint64_t a2)
{
  return a2;
}

double ACHGizmoHistoricalEvaluationPolicy@<D0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)&double result = 1;
  *(_OWORD *)(a1 + 8) = xmmword_21F65F5B0;
  *(_WORD *)(a1 + 24) = 0;
  return result;
}

void ACHTinkerHistoricalEvaluationPolicy(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 257;
}

double ACHCompanionHistoricalEvaluationPolicy@<D0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 1;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = xmmword_21F65F5C0;
  *(_WORD *)(a1 + 24) = 257;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

id ACHEvaluationDateIntervalFor(void *a1)
{
  id v1 = a1;
  id v2 = [v1 endDate];
  uint64_t v3 = [v1 startDate];
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  [v2 timeIntervalSinceReferenceDate];
  double v6 = v5;
  [v4 timeIntervalSinceReferenceDate];
  if (v6 <= v7)
  {
    id v13 = v1;
    id v8 = v2;
  }
  else
  {
    id v8 = v4;

    [v3 timeIntervalSinceReferenceDate];
    double v10 = v9;
    [v8 timeIntervalSinceReferenceDate];
    if (v10 > v11)
    {
      id v12 = v8;

      uint64_t v3 = v12;
    }
    id v13 = (id)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v3 endDate:v8];
  }

  return v13;
}

void sub_21F608010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_21F60B440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void sub_21F60DA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

BOOL ACHRequestProfileExtension(void *a1, void *a2)
{
  return ACHRequestProfileExtensionWithError(a1, a2, 0);
}

BOOL ACHRequestProfileExtensionWithError(void *a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  double v6 = [a1 profileExtensionsConformingToProtocol:&unk_26D133D28];
  double v7 = [v6 firstObject];
  id v8 = v7;
  if (v7)
  {
    [v7 performBlockAfterInitialization:v5];
  }
  else
  {
    uint64_t v9 = ACHLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ACHRequestProfileExtensionWithError_cold_1(v9);
    }

    double v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08320];
    v16[0] = @"ACHAchievement plugin is nil";
    double v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v12 = [v10 errorWithDomain:@"com.apple.ActivityAchievements" code:1 userInfo:v11];

    id v13 = v12;
    if (v13)
    {
      if (a3) {
        *a3 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v8 != 0;
}

void sub_21F60F1E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F60F494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F60FD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_21F60FF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F610254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F610518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F6107B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F610AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F610D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F611004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F6112B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F611698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F611AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F612B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21F612FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F613170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t HDActivityAWDActivityAchievementCountEventReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    double v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_57;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              uint64_t v19 = 0;
              goto LABEL_59;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_57:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v19 = 0;
          }
LABEL_59:
          *(void *)(a1 + 8) = v19;
          continue;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 32) |= 2u;
          while (2)
          {
            uint64_t v27 = *v3;
            unint64_t v28 = *(void *)(a2 + v27);
            if (v28 == -1 || v28 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
              *(void *)(a2 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_63:
          uint64_t v46 = 16;
          goto LABEL_76;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          *(unsigned char *)(a1 + 32) |= 0x10u;
          while (2)
          {
            uint64_t v33 = *v3;
            unint64_t v34 = *(void *)(a2 + v33);
            if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
              *(void *)(a2 + v33) = v34 + 1;
              v32 |= (unint64_t)(v35 & 0x7F) << v30;
              if (v35 < 0)
              {
                v30 += 7;
                BOOL v14 = v31++ >= 9;
                if (v14)
                {
                  uint64_t v32 = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v32 = 0;
          }
LABEL_67:
          *(unsigned char *)(a1 + 28) = v32 != 0;
          continue;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 32) |= 4u;
          while (2)
          {
            uint64_t v38 = *v3;
            unint64_t v39 = *(void *)(a2 + v38);
            if (v39 == -1 || v39 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v40 = *(unsigned char *)(*(void *)(a2 + *v7) + v39);
              *(void *)(a2 + v38) = v39 + 1;
              v26 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                BOOL v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v26) = 0;
          }
LABEL_71:
          uint64_t v46 = 20;
          goto LABEL_76;
        case 5u:
          char v41 = 0;
          unsigned int v42 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 32) |= 8u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v43 = *v3;
        unint64_t v44 = *(void *)(a2 + v43);
        if (v44 == -1 || v44 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v45 = *(unsigned char *)(*(void *)(a2 + *v7) + v44);
        *(void *)(a2 + v43) = v44 + 1;
        v26 |= (unint64_t)(v45 & 0x7F) << v41;
        if ((v45 & 0x80) == 0) {
          goto LABEL_73;
        }
        v41 += 7;
        BOOL v14 = v42++ >= 9;
        if (v14)
        {
          LODWORD(v26) = 0;
          goto LABEL_75;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_73:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v26) = 0;
      }
LABEL_75:
      uint64_t v46 = 24;
LABEL_76:
      *(_DWORD *)(a1 + v46) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t ACHComparisonForEarnedInstances(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = [a1 duplicateRemovalStrategy];
  if ((v10 - 3) < 2)
  {
LABEL_4:
    uint64_t v11 = [v8 earnedDateComponents];
    unint64_t v12 = [v7 dateFromComponents:v11];

    char v13 = [v9 earnedDateComponents];
    BOOL v14 = [v7 dateFromComponents:v13];

    int v15 = v14;
    uint64_t v16 = v12;
    goto LABEL_5;
  }
  if (v10 != 2)
  {
    if (v10 != 1)
    {
LABEL_6:
      uint64_t v18 = [v8 externalIdentifier];
      if (!v18
        || (uint64_t v19 = (void *)v18,
            [v9 externalIdentifier],
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            v20,
            v19,
            v20))
      {
        unint64_t v21 = [v8 externalIdentifier];
        if (v21)
        {

LABEL_10:
          char v22 = [v9 createdDate];
          long long v23 = [v8 createdDate];
          uint64_t v17 = [v22 compare:v23];

          goto LABEL_21;
        }
        unsigned int v25 = [v9 externalIdentifier];

        if (!v25) {
          goto LABEL_10;
        }
LABEL_20:
        uint64_t v17 = -1;
        goto LABEL_21;
      }
      goto LABEL_19;
    }
    goto LABEL_4;
  }
  char v24 = [v8 value];
  if (v24)
  {
  }
  else
  {
    uint64_t v26 = [v9 value];

    if (!v26) {
      goto LABEL_6;
    }
  }
  uint64_t v27 = [v8 value];

  if (!v27) {
    goto LABEL_20;
  }
  unint64_t v28 = [v9 value];

  if (!v28)
  {
LABEL_19:
    uint64_t v17 = 1;
    goto LABEL_21;
  }
  unint64_t v12 = [v8 value];
  BOOL v14 = [v9 value];
  int v15 = v12;
  uint64_t v16 = v14;
LABEL_5:
  uint64_t v17 = [v15 compare:v16];

  if (!v17) {
    goto LABEL_6;
  }
LABEL_21:

  return v17;
}

id ACHDateComponentsForPackedDateComponents(uint64_t a1)
{
  if ((a1 & 0x100000000) != 0)
  {
    id v2 = ACHDateComponentsForYearMonthDay();
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

void sub_21F616520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void sub_21F61695C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void sub_21F6176E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void sub_21F618670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void sub_21F618F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F61A2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

void sub_21F61BB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F61EEF0(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;
  objc_destroyWeak(v4);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21F61F504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void sub_21F61FA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F620110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21F6203B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_21F620D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21F621248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21F622174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F6229A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F622D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F62702C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F6272DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t ACHIsCompanionActivityAppInstalled()
{
  v0 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v1 = [v0 applicationIsInstalled:*MEMORY[0x263F234C8]];

  return v1;
}

void sub_21F627BE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21F627E54(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_21F627FA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F628144(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21F628334(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F6284E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F62894C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void sub_21F62A948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F62B13C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21F62B3A8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_21F62B4F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F62B6D4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21F62B8C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F62BA74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F62BEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void sub_21F62DF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_21F62E860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void sub_21F62ECA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F62FD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void sub_21F62FFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F6305CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_21F630D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F6310D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F63169C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void sub_21F6319D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F631C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F631F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F632E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F633118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F6332DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ACHAllTemplateDatabaseKeys()
{
  v2[38] = *MEMORY[0x263EF8340];
  v2[0] = @"unique_name";
  v2[1] = @"version";
  v2[2] = @"minimum_engine_version";
  v2[3] = @"created_date";
  v2[4] = @"creator_device";
  v2[5] = @"source_name";
  v2[6] = @"predicate";
  v2[7] = @"grace_predicate";
  v2[8] = @"value_expression";
  v2[9] = @"grace_value_expression";
  void v2[10] = @"progress_expression";
  v2[11] = @"grace_progress_expression";
  v2[12] = @"goal_expression";
  v2[13] = @"grace_goal_expression";
  v2[14] = @"triggers";
  v2[15] = @"earn_limit";
  v2[16] = @"visibility_predicate";
  v2[17] = @"grace_visibility_predicate";
  v2[18] = @"visibility_start_date";
  v2[19] = @"visibility_end_date";
  v2[20] = @"availability_predicate";
  v2[21] = @"availability_start_date";
  v2[22] = @"availability_end_date";
  v2[23] = @"available_country_codes";
  v2[24] = @"alertability_predicate";
  v2[25] = @"alert_dates";
  v2[26] = @"duplicateremoval_strategy";
  v2[27] = @"duplicateremoval_calendar_unit";
  v2[28] = @"earn_date";
  v2[29] = @"display_order";
  v2[30] = @"displays_earned_instance_count";
  v2[31] = @"canonical_unit";
  v2[32] = @"sync_provenance";
  v2[33] = @"sync_identity";
  v2[34] = @"available_suffixes";
  v2[35] = @"daily_target";
  v2[36] = @"daily_target_canonical_unit";
  v2[37] = @"prerequisite_template_name";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:38];
  return v0;
}

id ACHTemplateSyncIdentityFromTemplate(void *a1, int a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a1;
  uint64_t v10 = [v8 syncIdentityManager];
  uint64_t v11 = [v10 legacySyncIdentity];

  uint64_t v12 = [v9 syncIdentity];

  uint64_t v13 = healthSyncIdentity(v12);

  uint64_t v14 = [v8 syncIdentityManager];

  if (a2 && v13)
  {
    id v19 = 0;
    int v15 = [v14 concreteIdentityForIdentity:v13 shouldCreate:1 transaction:v7 error:&v19];
    id v16 = v19;

    if (!v15)
    {
      uint64_t v17 = ACHLogDatabase();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        ACHTemplateSyncIdentityFromTemplate_cold_1();
      }
    }
  }
  else
  {
    int v15 = [v14 currentSyncIdentity];
  }
  return v15;
}

void sub_21F6369B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void sub_21F6373D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_21F637CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F638A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F638DF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21F639674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

void sub_21F63BDA4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(double a1, float a2)
{
  float *v3 = a2;
  double *v2 = a1;
}

void __ACHCanonicalUnitForGoalType_block_invoke()
{
  v7[4] = *MEMORY[0x263EF8340];
  v6[0] = &unk_26D116358;
  v0 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v7[0] = v0;
  v6[1] = &unk_26D116370;
  uint64_t v1 = [MEMORY[0x263F0A830] minuteUnit];
  v7[1] = v1;
  v6[2] = &unk_26D116388;
  uint64_t v2 = [MEMORY[0x263F0A830] minuteUnit];
  v7[2] = v2;
  v6[3] = &unk_26D1163A0;
  uint64_t v3 = [MEMORY[0x263F0A830] countUnit];
  v7[3] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  id v5 = (void *)ACHCanonicalUnitForGoalType_unitByGoalType;
  ACHCanonicalUnitForGoalType_unitByGoalType = v4;
}

__CFString *ACHGoalDisplayName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Move";
  }
  else {
    return off_2645182D0[a1 - 1];
  }
}

void sub_21F640020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_21F640468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
}

void sub_21F640AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21F640E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F641460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F642208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F6432A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F64344C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F643FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
}

void sub_21F644288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F644EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
}

void sub_21F6451C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F64548C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F645744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F6459BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F645C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F645EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F64612C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F6463E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F646678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F6469C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21F646BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21F646E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21F647388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21F647564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F647A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F647C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F647DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F647F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F6480BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F648220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F648354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F648488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F648620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F648784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F648980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F648A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F648BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F64902C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32(uint64_t a1)
{
}

void sub_21F64AA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F64AC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F64B688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_21F64BFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

id ACHHistoricalEvaluationStartDateForPolicy(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 8);
  if (v5 == 1)
  {
    if (v3)
    {
      id v6 = v3;
      goto LABEL_7;
    }
    id v8 = ACHLogAwardEngine();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    __int16 v12 = 0;
    uint64_t v9 = "Policy requested last known end date, but no known end date exists";
    uint64_t v10 = (uint8_t *)&v12;
    goto LABEL_12;
  }
  if (!v5)
  {
    if (*(unsigned char *)a1)
    {
      id v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:410227200.0];
LABEL_7:
      uint64_t v7 = v6;
      goto LABEL_15;
    }
    id v8 = ACHLogAwardEngine();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    __int16 v13 = 0;
    uint64_t v9 = "Policy does not allow historical evaluation from beginning of time";
    uint64_t v10 = (uint8_t *)&v13;
LABEL_12:
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
LABEL_13:
  }
  uint64_t v7 = 0;
LABEL_15:

  return v7;
}

id ACHHistoricalEvaluationEndDateForPolicy(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7 == 2)
  {
    objc_msgSend(a2, "hk_startOfDateBySubtractingDays:fromDate:", 2, v5);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v7)
  {
    id v8 = v5;
LABEL_5:
    uint64_t v9 = v8;
    goto LABEL_7;
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return *(void *)a1;
}

void sub_21F64D148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F64DF74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21F64ED1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{
}

void sub_21F64FB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose((const void *)(v47 - 192), 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_21F650318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F6504F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_21F650E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34(uint64_t a1)
{
}

void sub_21F6511B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F65150C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F651900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id achSyncIdentity(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 hardwareIdentifier];
  id v3 = objc_msgSend(v2, "hk_dataForUUIDBytes");

  uint64_t v4 = [v1 databaseIdentifier];
  id v5 = objc_msgSend(v4, "hk_dataForUUIDBytes");

  if (v3 && v5)
  {
    uint64_t v6 = [v1 instanceDiscriminator];
    uint64_t v7 = (void *)v6;
    id v8 = &stru_26D0FD8F8;
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    uint64_t v9 = v8;

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F236D0]) initWithHardwareIdentifier:v3 databaseIdentifier:v5 instanceDiscriminator:v9];
  }
  else
  {
    uint64_t v11 = ACHLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      achSyncIdentity_cold_1(v11);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

id healthSyncIdentity(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x263F08C38];
  id v3 = [v1 hardwareIdentifier];
  uint64_t v4 = objc_msgSend(v2, "hk_UUIDWithData:", v3);

  id v5 = (void *)MEMORY[0x263F08C38];
  uint64_t v6 = [v1 databaseIdentifier];
  uint64_t v7 = objc_msgSend(v5, "hk_UUIDWithData:", v6);

  if (v4) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = ACHLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      healthSyncIdentity_cold_1(v9);
    }

    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = [v1 instanceDiscriminator];
    __int16 v12 = (void *)v11;
    __int16 v13 = &stru_26D0FD8F8;
    if (v11) {
      __int16 v13 = (__CFString *)v11;
    }
    uint64_t v14 = v13;

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F433D0]) initWithHardwareIdentifier:v4 databaseIdentifier:v7 instanceDiscriminator:v14];
  }

  return v10;
}

id ACHDatabaseContextWithAccessibilityAssertion(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263F43278]);
  id v3 = [v1 assertion];

  if (v3)
  {
    uint64_t v4 = [v1 assertion];
    [v2 addAccessibilityAssertion:v4];
  }
  return v2;
}

void ACHEarnedInstanceSyncIdentityFromEarnedInstance_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_FAULT, "ACHEarnedInstanceEntity ConcreteSyncIdentity is nil %{public}@", v1, 0xCu);
}

void ACHRequestAwardsProfileExtensionWithError_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "Activity Awards plugin is nil", v1, 2u);
}

void ACHRequestProfileExtensionWithError_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "ACHAchievement plugin is nil", v1, 2u);
}

void ACHTemplateSyncIdentityFromTemplate_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_21F5DA000, v0, OS_LOG_TYPE_FAULT, "ACHTemplateEntity ConcreteSyncIdentity is nil %{public}@", v1, 0xCu);
}

void achSyncIdentity_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "Unable to convert from HSSyncIdentity to ACHSyncIdentity", v1, 2u);
}

void healthSyncIdentity_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "Unable to convert from ACHSyncIdentity to HDSyncIdentity", v1, 2u);
}

uint64_t ACHApplyBadgePropertiesToAchievement()
{
  return MEMORY[0x270F0A5B8]();
}

uint64_t ACHCanonicalEarnedInstanceUnitForQuantity()
{
  return MEMORY[0x270F0A5D0]();
}

uint64_t ACHCodableFromEarnedInstance()
{
  return MEMORY[0x270F0A5E8]();
}

uint64_t ACHCodableFromTemplate()
{
  return MEMORY[0x270F0A5F0]();
}

uint64_t ACHCompareYearMonthDayDateComponents()
{
  return MEMORY[0x270F0A5F8]();
}

uint64_t ACHDateComponentsForYearMonthDay()
{
  return MEMORY[0x270F0A600]();
}

uint64_t ACHDeviceCapabilitiesForMonthlyChallenges()
{
  return MEMORY[0x270F0A608]();
}

uint64_t ACHEarnedInstanceFromBackCompatCodableAchievement()
{
  return MEMORY[0x270F0A610]();
}

uint64_t ACHFirstDayOfWeekForWeeklyGoalCalculations()
{
  return MEMORY[0x270F0A618]();
}

uint64_t ACHHKQuantityWithValueAndUnit()
{
  return MEMORY[0x270F0A690]();
}

uint64_t ACHLastDayOfWeekForWeeklyGoalCalculations()
{
  return MEMORY[0x270F0A6A8]();
}

uint64_t ACHLegacyKeyValueRepresentationFromProperties()
{
  return MEMORY[0x270F0A6B8]();
}

uint64_t ACHLogAssets()
{
  return MEMORY[0x270F0A6C0]();
}

uint64_t ACHLogAwardEngine()
{
  return MEMORY[0x270F0A6C8]();
}

uint64_t ACHLogAwardScheduling()
{
  return MEMORY[0x270F0A6D0]();
}

uint64_t ACHLogCleanup()
{
  return MEMORY[0x270F0A6D8]();
}

uint64_t ACHLogDatabase()
{
  return MEMORY[0x270F0A6E0]();
}

uint64_t ACHLogDefault()
{
  return MEMORY[0x270F0A6E8]();
}

uint64_t ACHLogMetrics()
{
  return MEMORY[0x270F0A6F0]();
}

uint64_t ACHLogMonthlyChallenges()
{
  return MEMORY[0x270F0A6F8]();
}

uint64_t ACHLogProgress()
{
  return MEMORY[0x270F0A700]();
}

uint64_t ACHLogSync()
{
  return MEMORY[0x270F0A708]();
}

uint64_t ACHLogTemplates()
{
  return MEMORY[0x270F0A710]();
}

uint64_t ACHLogWorkouts()
{
  return MEMORY[0x270F0A720]();
}

uint64_t ACHLogXPC()
{
  return MEMORY[0x270F0A728]();
}

uint64_t ACHLowRuleThresholdForChallenge()
{
  return MEMORY[0x270F0A730]();
}

uint64_t ACHMobileAssetServerURLWithError()
{
  return MEMORY[0x270F0A738]();
}

uint64_t ACHMonthlyChallengeCacheValue()
{
  return MEMORY[0x270F0A740]();
}

uint64_t ACHMonthlyChallengeHasRequiredDeviceCapability()
{
  return MEMORY[0x270F0A748]();
}

uint64_t ACHMonthlyChallengeNameFromChallengeType()
{
  return MEMORY[0x270F0A750]();
}

uint64_t ACHMonthlyChallengeTemplate()
{
  return MEMORY[0x270F0A758]();
}

uint64_t ACHMonthlyChallengeTemplateFromTemplate()
{
  return MEMORY[0x270F0A760]();
}

uint64_t ACHMonthlyChallengeTypeFromMonthlyChallengeName()
{
  return MEMORY[0x270F0A768]();
}

uint64_t ACHMonthlyChallengeTypeFromTemplateUniqueName()
{
  return MEMORY[0x270F0A770]();
}

uint64_t ACHPairedWatchCountryCode()
{
  return MEMORY[0x270F0A798]();
}

uint64_t ACHSetMobileAssetServerURL()
{
  return MEMORY[0x270F0A7A8]();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return MEMORY[0x270F0A7B0]();
}

uint64_t ACHSortedEarnedInstances()
{
  return MEMORY[0x270F0A7B8]();
}

uint64_t ACHSortedTemplates()
{
  return MEMORY[0x270F0A7C0]();
}

uint64_t ACHStartOfFitnessWeekBeforeDateInCalendar()
{
  return MEMORY[0x270F0A7C8]();
}

uint64_t ACHStartOfFitnessWeekBeforeDateWithFirstWeekdayInCalendar()
{
  return MEMORY[0x270F0A7D0]();
}

uint64_t ACHTemplateAlertDatesFromString()
{
  return MEMORY[0x270F0A7D8]();
}

uint64_t ACHTemplateAlertDatesStringFromDates()
{
  return MEMORY[0x270F0A7E0]();
}

uint64_t ACHTemplateAvailableCountryCodesFromString()
{
  return MEMORY[0x270F0A7E8]();
}

uint64_t ACHTemplateAvailableCountryCodesStringFromStrings()
{
  return MEMORY[0x270F0A7F0]();
}

uint64_t ACHTemplateAvailableSuffixesFromString()
{
  return MEMORY[0x270F0A7F8]();
}

uint64_t ACHTemplateAvailableSuffixesStringFromStrings()
{
  return MEMORY[0x270F0A800]();
}

uint64_t ACHTemplateIsMonthlyChallenge()
{
  return MEMORY[0x270F0A808]();
}

uint64_t ACHTemplateIsRemote()
{
  return MEMORY[0x270F0A810]();
}

uint64_t ACHTemplateUniqueNameIsMonthlyChallenge()
{
  return MEMORY[0x270F0A820]();
}

uint64_t ACHTriggerOptionsToString()
{
  return MEMORY[0x270F0A828]();
}

uint64_t ACHWorkoutActivityTypeForMonthlyChallengeType()
{
  return MEMORY[0x270F0A830]();
}

uint64_t ACHWorkoutLocationTypeForMonthlyChallengeType()
{
  return MEMORY[0x270F0A840]();
}

uint64_t ACHYearMonthDayDateComponentsFromString()
{
  return MEMORY[0x270F0A848]();
}

uint64_t ACHYearMonthDayStringFromDateComponents()
{
  return MEMORY[0x270F0A850]();
}

uint64_t Best10KDuration()
{
  return MEMORY[0x270F0A858]();
}

uint64_t Best5KDuration()
{
  return MEMORY[0x270F0A860]();
}

uint64_t BestWheelchair10KDuration()
{
  return MEMORY[0x270F0A868]();
}

uint64_t BestWheelchair5KDuration()
{
  return MEMORY[0x270F0A870]();
}

uint64_t BestWorkoutDistanceTemplateForWorkoutActivityType()
{
  return MEMORY[0x270F0A878]();
}

uint64_t BestWorkoutElevationGainedTemplateForWorkoutActivityType()
{
  return MEMORY[0x270F0A880]();
}

uint64_t BestWorkoutEnergyBurnedTemplateForWorkoutActivityType()
{
  return MEMORY[0x270F0A888]();
}

uint64_t DailyExerciseRecordTemplate()
{
  return MEMORY[0x270F0A890]();
}

uint64_t DailyMoveRecordTemplate()
{
  return MEMORY[0x270F0A898]();
}

uint64_t DailyMoveTimeRecordTemplate()
{
  return MEMORY[0x270F0A8A0]();
}

uint64_t DuathlonWorkout()
{
  return MEMORY[0x270F0A8A8]();
}

uint64_t FIActivityAnalyticsSubmission()
{
  return MEMORY[0x270F29900]();
}

uint64_t FIExperienceTypeForBirthDateComponentsWithCurrentDateAndCalendar()
{
  return MEMORY[0x270F299B8]();
}

uint64_t FISplitsForMeasuringSystemIdentifier()
{
  return MEMORY[0x270F29B58]();
}

uint64_t FastestHalfMarathonWorkout()
{
  return MEMORY[0x270F0A8B0]();
}

uint64_t FastestMarathonWorkout()
{
  return MEMORY[0x270F0A8B8]();
}

uint64_t FastestWheelchairHalfMarathonWorkout()
{
  return MEMORY[0x270F0A8C0]();
}

uint64_t FastestWheelchairMarathonWorkout()
{
  return MEMORY[0x270F0A8C8]();
}

uint64_t FifteenHundredAllGoals()
{
  return MEMORY[0x270F0A8D0]();
}

uint64_t FifteenHundredMoveGoals()
{
  return MEMORY[0x270F0A8D8]();
}

uint64_t FiftyKilometerTriathlonWorkout()
{
  return MEMORY[0x270F0A8E0]();
}

uint64_t FiftyKilometersCyclingWorkout()
{
  return MEMORY[0x270F0A8E8]();
}

uint64_t FiftyMilesCyclingWorkout()
{
  return MEMORY[0x270F0A8F0]();
}

uint64_t FirstWorkoutTemplateForWorkoutActivityType()
{
  return MEMORY[0x270F0A8F8]();
}

uint64_t FiveHundredAllGoals()
{
  return MEMORY[0x270F0A900]();
}

uint64_t FiveHundredMoveGoals()
{
  return MEMORY[0x270F0A908]();
}

uint64_t FiveKilometerWheelchairWorkout()
{
  return MEMORY[0x270F0A910]();
}

uint64_t FiveKilometerWorkout()
{
  return MEMORY[0x270F0A918]();
}

uint64_t FourThousandAllGoals()
{
  return MEMORY[0x270F0A920]();
}

uint64_t FourThousandMoveGoals()
{
  return MEMORY[0x270F0A928]();
}

uint64_t FullDistanceTriathlonWorkout()
{
  return MEMORY[0x270F0A930]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x270F306A0]();
}

uint64_t HDActivityCacheEntityPredicateForCachesInDateComponentsRange()
{
  return MEMORY[0x270F31960]();
}

uint64_t HDDataEntityPredicateForObjectsFromAppleWatchSources()
{
  return MEMORY[0x270F31998]();
}

uint64_t HDSQLiteBindDateToProperty()
{
  return MEMORY[0x270F31A50]();
}

uint64_t HDSQLiteBindDoubleToProperty()
{
  return MEMORY[0x270F31A58]();
}

uint64_t HDSQLiteBindFoundationValueToStatement()
{
  return MEMORY[0x270F31A60]();
}

uint64_t HDSQLiteBindInt64ToProperty()
{
  return MEMORY[0x270F31A68]();
}

uint64_t HDSQLiteBindNullToProperty()
{
  return MEMORY[0x270F31A70]();
}

uint64_t HDSQLiteBindStringToProperty()
{
  return MEMORY[0x270F31A78]();
}

uint64_t HDSQLiteBindStringToStatement()
{
  return MEMORY[0x270F31A80]();
}

uint64_t HDSQLiteColumnAsInt64()
{
  return MEMORY[0x270F31AA8]();
}

uint64_t HDSQLiteColumnWithNameAsBoolean()
{
  return MEMORY[0x270F31AC8]();
}

uint64_t HDSQLiteColumnWithNameAsDate()
{
  return MEMORY[0x270F31AD8]();
}

uint64_t HDSQLiteColumnWithNameAsDouble()
{
  return MEMORY[0x270F31AE0]();
}

uint64_t HDSQLiteColumnWithNameAsInt64()
{
  return MEMORY[0x270F31AE8]();
}

uint64_t HDSQLiteColumnWithNameAsString()
{
  return MEMORY[0x270F31AF0]();
}

uint64_t HDSQLiteColumnWithNameIsNull()
{
  return MEMORY[0x270F31B00]();
}

uint64_t HDSampleEntityPredicateForDataType()
{
  return MEMORY[0x270F319F8]();
}

uint64_t HDSampleEntityPredicateForEndDate()
{
  return MEMORY[0x270F31A10]();
}

uint64_t HDSampleEntityPredicateForStartDate()
{
  return MEMORY[0x270F31A18]();
}

uint64_t HDWorkoutEntityPredicateForDuration()
{
  return MEMORY[0x270F31A20]();
}

uint64_t HDWorkoutEntityPredicateForWorkoutActivityType()
{
  return MEMORY[0x270F31A28]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return MEMORY[0x270EF3668]();
}

uint64_t HKFirstDayOfWeekForWeeklyGoalCalculations()
{
  return MEMORY[0x270EF36E8]();
}

uint64_t HalfDistanceTriathlonWorkout()
{
  return MEMORY[0x270F0A938]();
}

uint64_t HalfMarathonWorkout()
{
  return MEMORY[0x270F0A940]();
}

uint64_t HundredAllGoals()
{
  return MEMORY[0x270F0A948]();
}

uint64_t HundredMoveGoals()
{
  return MEMORY[0x270F0A950]();
}

uint64_t LongestMoveStreakTemplate()
{
  return MEMORY[0x270F0A958]();
}

uint64_t MarathonWorkout()
{
  return MEMORY[0x270F0A960]();
}

uint64_t MoveGoal200PercentTemplate()
{
  return MEMORY[0x270F0A968]();
}

uint64_t MoveGoal300PercentTemplate()
{
  return MEMORY[0x270F0A970]();
}

uint64_t MoveGoal400PercentTemplate()
{
  return MEMORY[0x270F0A978]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t NewMoveGoalAchievedTemplate()
{
  return MEMORY[0x270F0A980]();
}

uint64_t NewMoveTimeGoalAchievedTemplate()
{
  return MEMORY[0x270F0A988]();
}

uint64_t OneHundredKilometersCyclingWorkout()
{
  return MEMORY[0x270F0A990]();
}

uint64_t OneHundredMilesCyclingWorkout()
{
  return MEMORY[0x270F0A998]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t PerfectMonthTemplateForDateComponents()
{
  return MEMORY[0x270F0A9A0]();
}

uint64_t PerfectWeekAllTemplate()
{
  return MEMORY[0x270F0A9A8]();
}

uint64_t PerfectWeekExerciseTemplate()
{
  return MEMORY[0x270F0A9B0]();
}

uint64_t PerfectWeekMoveTemplate()
{
  return MEMORY[0x270F0A9B8]();
}

uint64_t PerfectWeekStandTemplate()
{
  return MEMORY[0x270F0A9C0]();
}

uint64_t RemoteAchievementTemplateFromTemplateAssetAndBuildVersion()
{
  return MEMORY[0x270F0A9C8]();
}

uint64_t SevenWorkoutWeekTemplate()
{
  return MEMORY[0x270F0A9D0]();
}

uint64_t SeventeenFiftyAllGoals()
{
  return MEMORY[0x270F0A9D8]();
}

uint64_t SeventeenFiftyMoveGoals()
{
  return MEMORY[0x270F0A9E0]();
}

uint64_t SprintTriathlonWorkout()
{
  return MEMORY[0x270F0A9E8]();
}

uint64_t TenKilometerWheelchairWorkout()
{
  return MEMORY[0x270F0A9F0]();
}

uint64_t TenKilometerWorkout()
{
  return MEMORY[0x270F0A9F8]();
}

uint64_t ThousandAllGoals()
{
  return MEMORY[0x270F0AA00]();
}

uint64_t ThousandMoveGoals()
{
  return MEMORY[0x270F0AA08]();
}

uint64_t ThreeHundredSixtyFiveAllGoals()
{
  return MEMORY[0x270F0AA10]();
}

uint64_t ThreeHundredSixtyFiveMoveGoals()
{
  return MEMORY[0x270F0AA18]();
}

uint64_t ThreeThousandAllGoals()
{
  return MEMORY[0x270F0AA20]();
}

uint64_t ThreeThousandFiveHundredAllGoals()
{
  return MEMORY[0x270F0AA28]();
}

uint64_t ThreeThousandFiveHundredMoveGoals()
{
  return MEMORY[0x270F0AA30]();
}

uint64_t ThreeThousandMoveGoals()
{
  return MEMORY[0x270F0AA38]();
}

uint64_t ThreeThousandSevenHundredFiftyAllGoals()
{
  return MEMORY[0x270F0AA40]();
}

uint64_t ThreeThousandSevenHundredFiftyMoveGoals()
{
  return MEMORY[0x270F0AA48]();
}

uint64_t ThreeThousandTwoHundredFiftyAllGoals()
{
  return MEMORY[0x270F0AA50]();
}

uint64_t ThreeThousandTwoHundredFiftyMoveGoals()
{
  return MEMORY[0x270F0AA58]();
}

uint64_t TwelveFiftyAllGoals()
{
  return MEMORY[0x270F0AA60]();
}

uint64_t TwelveFiftyMoveGoals()
{
  return MEMORY[0x270F0AA68]();
}

uint64_t TwentyFiveHundredAllGoals()
{
  return MEMORY[0x270F0AA70]();
}

uint64_t TwentyFiveHundredMoveGoals()
{
  return MEMORY[0x270F0AA78]();
}

uint64_t TwentySevenFiftyAllGoals()
{
  return MEMORY[0x270F0AA80]();
}

uint64_t TwentySevenFiftyMoveGoals()
{
  return MEMORY[0x270F0AA88]();
}

uint64_t TwentyTwoFiftyAllGoals()
{
  return MEMORY[0x270F0AA90]();
}

uint64_t TwentyTwoFiftyMoveGoals()
{
  return MEMORY[0x270F0AA98]();
}

uint64_t TwoThousandAllGoals()
{
  return MEMORY[0x270F0AAA0]();
}

uint64_t TwoThousandMoveGoals()
{
  return MEMORY[0x270F0AAA8]();
}

uint64_t WheelchairHalfMarathonWorkout()
{
  return MEMORY[0x270F0AAB0]();
}

uint64_t WheelchairMarathonWorkout()
{
  return MEMORY[0x270F0AAB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HDSQLiteValueForNumber()
{
  return MEMORY[0x270F31B10]();
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return MEMORY[0x270EF38F8]();
}

uint64_t _HKCacheIndexFromDate()
{
  return MEMORY[0x270EF3920]();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x270EF3928]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x270F9B4A8](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x270EDBCD8]();
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}