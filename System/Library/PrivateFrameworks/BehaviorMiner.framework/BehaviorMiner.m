void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

unsigned char *OUTLINED_FUNCTION_0_1(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21FF34E30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FF34FB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FF362AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_sync_exit(v26);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21FF364F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FF36654(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FF379C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
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

id BMItemNormalizedValueFromValue(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [MEMORY[0x263F08708] alphanumericCharacterSet];
    v3 = [v1 stringByAddingPercentEncodingWithAllowedCharacters:v2];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v1 stringValue];
LABEL_7:
    v3 = (void *)v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v1 UUIDString];
    goto LABEL_7;
  }
  v3 = 0;
LABEL_9:

  return v3;
}

id BMItemValueFromNormalizedValue(void *a1, void *a2)
{
  id v3 = a1;
  if ([a2 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v4 = [v3 stringByRemovingPercentEncoding];
LABEL_7:
    uint64_t v5 = (void *)v4;
    goto LABEL_8;
  }
  if ([a2 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v4 = [MEMORY[0x263F087B0] decimalNumberWithString:v3];
    goto LABEL_7;
  }
  if ([a2 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];
    goto LABEL_7;
  }
  uint64_t v5 = 0;
LABEL_8:

  return v5;
}

void sub_21FF39660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

uint64_t BMHourSlotForHourOfDay(uint64_t a1)
{
  return a1 / 4;
}

id BMTemporalItemsForDate(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v9 = [v6 components:544 fromDate:v5];
  uint64_t v10 = +[BMItemType hourOfDay];
  int v11 = [v7 containsObject:v10];

  if (v11)
  {
    v12 = [BMItem alloc];
    v13 = +[BMItemType hourOfDay];
    v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "hour"));
    v15 = [(BMItem *)v12 initWithType:v13 value:v14];

    [v8 addObject:v15];
  }
  v16 = +[BMItemType hourOfDaySlot];
  int v17 = [v7 containsObject:v16];

  if (v17)
  {
    uint64_t v18 = [v9 hour] / 4;
    v19 = [BMItem alloc];
    v20 = +[BMItemType hourOfDaySlot];
    v21 = [NSNumber numberWithInteger:v18];
    v22 = [(BMItem *)v19 initWithType:v20 value:v21];

    [v8 addObject:v22];
  }
  v23 = +[BMItemType dayOfWeek];
  int v24 = [v7 containsObject:v23];

  if (v24)
  {
    v25 = [BMItem alloc];
    v26 = +[BMItemType dayOfWeek];
    uint64_t v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "weekday"));
    v28 = [(BMItem *)v25 initWithType:v26 value:v27];

    [v8 addObject:v28];
  }
  v29 = +[BMItemType isWeekend];
  int v30 = [v7 containsObject:v29];

  if (v30)
  {
    uint64_t v31 = [v6 isDateInWeekend:v5];
    v32 = [BMItem alloc];
    v33 = +[BMItemType isWeekend];
    v34 = [NSNumber numberWithBool:v31];
    v35 = [(BMItem *)v32 initWithType:v33 value:v34];

    [v8 addObject:v35];
  }
  v36 = (void *)[v8 copy];

  return v36;
}

BOOL BMIsNotAppExtension(void *a1)
{
  id v1 = a1;
  v2 = [v1 metadata];
  id v3 = [MEMORY[0x263F35028] extensionHostIdentifier];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v1 metadata];
    id v7 = [MEMORY[0x263F35028] extensionContainingBundleIdentifier];
    id v8 = [v6 objectForKeyedSubscript:v7];
    BOOL v5 = v8 == 0;
  }
  return v5;
}

uint64_t BMIsShareExtension(void *a1)
{
  id v1 = a1;
  if (BMIsShareExtension_onceToken != -1) {
    dispatch_once(&BMIsShareExtension_onceToken, &__block_literal_global_36_0);
  }
  v2 = [v1 stringValue];
  if ([v2 length])
  {
    id v3 = [(id)BMIsShareExtension_cache objectForKey:v2];
    if (!v3)
    {
      if (BMIsNotAppExtension(v1))
      {
        id v3 = (void *)MEMORY[0x263EFFA80];
      }
      else
      {
        BOOL v5 = [MEMORY[0x263F018C0] pluginKitProxyForIdentifier:v2];
        id v6 = v5;
        id v3 = (void *)MEMORY[0x263EFFA80];
        if (v5)
        {
          id v7 = [v5 protocol];
          int v8 = [v7 isEqualToString:@"com.apple.share-services"];

          if (v8) {
            id v3 = (void *)MEMORY[0x263EFFA88];
          }
        }
      }
      [(id)BMIsShareExtension_cache setObject:v3 forKey:v2];
    }
    uint64_t v4 = [v3 BOOLValue];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __BMIsShareExtension_block_invoke()
{
  BMIsShareExtension_cache = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);

  return MEMORY[0x270F9A758]();
}

id BMCreateShortcutFilter()
{
  id v0 = (id)RelevanceEngineLibraryCore();
  if (v0)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x2050000000;
    id v1 = (void *)getREShortcutFilterClass_softClass;
    uint64_t v8 = getREShortcutFilterClass_softClass;
    if (!getREShortcutFilterClass_softClass)
    {
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __getREShortcutFilterClass_block_invoke;
      v4[3] = &unk_264546958;
      v4[4] = &v5;
      __getREShortcutFilterClass_block_invoke((uint64_t)v4);
      id v1 = (void *)v6[3];
    }
    v2 = v1;
    _Block_object_dispose(&v5, 8);
    id v0 = objc_alloc_init(v2);
  }

  return v0;
}

void sub_21FF3DAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RelevanceEngineLibraryCore()
{
  if (!RelevanceEngineLibraryCore_frameworkLibrary) {
    RelevanceEngineLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return RelevanceEngineLibraryCore_frameworkLibrary;
}

uint64_t __RelevanceEngineLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getREShortcutFilterClass_block_invoke(uint64_t a1)
{
  if (!RelevanceEngineLibraryCore())
  {
    id v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("REShortcutFilter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getREShortcutFilterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = (void *)__getREShortcutFilterClass_block_invoke_cold_1();
    return (Class)BMEventInterval(v4);
  }
  return result;
}

id BMEventInterval(void *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = [MEMORY[0x263EFF910] distantFuture];
  id v3 = [MEMORY[0x263EFF910] distantPast];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "startDate", (void)v18);
        if ([v10 compare:v2] == -1)
        {
          id v11 = v10;

          v2 = v11;
        }
        v12 = [v9 endDate];
        if ([v12 compare:v3] == 1)
        {
          id v13 = v12;

          id v3 = v13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  v14 = [v2 earlierDate:v3];
  v15 = [v2 laterDate:v3];
  v16 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v14 endDate:v15];

  return v16;
}

id BMLog()
{
  if (BMLog_onceToken != -1) {
    dispatch_once(&BMLog_onceToken, &__block_literal_global_9);
  }
  id v0 = (void *)BMLog_log;

  return v0;
}

uint64_t __BMLog_block_invoke()
{
  BMLog_log = (uint64_t)os_log_create("com.apple.BehaviorMiner", "general");

  return MEMORY[0x270F9A758]();
}

void sub_21FF3EBB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Block_object_dispose((const void *)(v15 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getTRIClientClass_block_invoke(uint64_t a1)
{
  if (!TrialLibraryCore_frameworkLibrary) {
    TrialLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("TRIClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getTRIClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TrialLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TrialLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21FF402FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FF40390(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FF40424(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FF42770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FF42CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

id BMInteractionPredicate(uint64_t a1, void *a2, void *a3)
{
  v32[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263F08A98];
  uint64_t v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v6 dateWithTimeIntervalSinceNow:-2419200.0];
  uint64_t v10 = [v5 predicateWithFormat:@"(startDate >= %@)", v9];

  id v11 = (void *)MEMORY[0x263F08A98];
  v12 = [NSNumber numberWithInteger:a1];
  v29 = [v11 predicateWithFormat:@"(mechanism == %@)", v12];

  id v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"(bundleId IN %@)", v8];
  v14 = (void *)MEMORY[0x263F08730];
  v32[0] = v10;
  v32[1] = v13;
  v32[2] = v29;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
  v16 = [v14 andPredicateWithSubpredicates:v15];

  int v17 = (void *)MEMORY[0x263F08A98];
  long long v18 = [v7 suggestionModel];

  long long v19 = [v18 shareSheetMechanisms];
  long long v20 = [v17 predicateWithFormat:@"(mechanism IN %@)", v19];

  long long v21 = [MEMORY[0x263F08A98] predicateWithFormat:@"(targetBundleId IN %@)", v8];

  v22 = (void *)MEMORY[0x263F08730];
  v31[0] = v10;
  v31[1] = v20;
  v31[2] = v21;
  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
  int v24 = [v22 andPredicateWithSubpredicates:v23];

  v25 = (void *)MEMORY[0x263F08730];
  v30[0] = v16;
  v30[1] = v24;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  uint64_t v27 = [v25 orPredicateWithSubpredicates:v26];

  return v27;
}

Class __getCKContextClientClass_block_invoke(uint64_t a1)
{
  if (!ContextKitLibraryCore_frameworkLibrary) {
    ContextKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("CKContextClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCKContextClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ContextKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ContextKitLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __BMTopKScenesForPhotosWithIdentifiers_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:@"confidence"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"confidence"];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id BMStorageURLForDomain(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1 && [v1 length])
  {
    id v3 = [NSString stringWithFormat:@"CoreBehavior/%@.sqlite", v2];
    id v4 = [@"/var/mobile/Library" stringByAppendingPathComponent:v3];
    uint64_t v5 = [NSURL fileURLWithPath:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_21FF46560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FF467B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
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

void sub_21FF46D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FF470A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __BMLoadBehaviorStoragePersistentContainer_block_invoke()
{
  id v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v1 = [v0 URLForResource:@"BehaviorMiner" withExtension:@"momd"];
  v2 = BMLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __BMLoadBehaviorStoragePersistentContainer_block_invoke_cold_2();
  }

  if (v0) {
    BOOL v3 = v1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    uint64_t v5 = BMLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __BMLoadBehaviorStoragePersistentContainer_block_invoke_cold_1(v5);
    }
  }
  else
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v1];
    uint64_t v5 = BMLoadBehaviorStoragePersistentContainer_model;
    BMLoadBehaviorStoragePersistentContainer_model = v4;
  }
}

void __BMLoadBehaviorStoragePersistentContainer_block_invoke_206(uint64_t a1, int a2, id obj)
{
}

uint64_t __getREShortcutFilterClass_block_invoke_cold_1()
{
  id v0 = abort_report_np();
  return -[BMMiningTaskConfig updateFactorLevels](v0);
}

void __BMLoadBehaviorStoragePersistentContainer_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_21FF33000, log, OS_LOG_TYPE_FAULT, "Error initializing CoreBehavior storage: missing BehaviorMiner.momd from BehaviorMiner.framework resources", v1, 2u);
}

void __BMLoadBehaviorStoragePersistentContainer_block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_21FF33000, v0, OS_LOG_TYPE_DEBUG, "Loading managed object model from bundle: %@ URL: %@", v1, 0x16u);
}

uint64_t INIntentWithTypedIntent()
{
  return MEMORY[0x270EF5248]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _PSShareSheetExtensionBundleIDToAppBundleIDMapping()
{
  return MEMORY[0x270F53580]();
}

uint64_t _PSShareSheetSuggestionBundleIDs()
{
  return MEMORY[0x270F53588]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}