void sub_1B87C1DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BiomeLibraryLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!BiomeLibraryLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __BiomeLibraryLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E617A2E8;
    uint64_t v4 = 0;
    BiomeLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = BiomeLibraryLibraryCore_frameworkLibrary;
  if (!BiomeLibraryLibraryCore_frameworkLibrary) {
    BiomeLibraryLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1B87C4950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void *__getBMAppIntentIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BiomeLibraryLibrary();
  result = dlsym(v2, "BMAppIntentIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMAppIntentIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiomeLibraryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiomeLibraryLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getBMSiriRemembersInteractionHistoryIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BiomeLibraryLibrary();
  uint64_t result = dlsym(v2, "BMSiriRemembersInteractionHistoryIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMSiriRemembersInteractionHistoryIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void *__getBMSiriRemembersMessageHistoryIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BiomeLibraryLibrary();
  uint64_t result = dlsym(v2, "BMSiriRemembersMessageHistoryIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMSiriRemembersMessageHistoryIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBMSiriRemembersCallHistoryIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)BiomeLibraryLibrary();
  uint64_t result = dlsym(v2, "BMSiriRemembersCallHistoryIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBMSiriRemembersCallHistoryIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMSourceClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __BiomeStreamsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E617A320;
    uint64_t v5 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeStreamsLibraryCore_frameworkLibrary) {
    __getBMSourceClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("BMSource");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMSourceClass_block_invoke_cold_2();
  }
  getBMSourceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiomeStreamsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiomeStreamsLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t FMDBDatabaseBusyHandler(void *a1, int a2)
{
  long long v3 = a1;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if (a2)
  {
    double v5 = v4 - v3[3];
    [v3 maxBusyRetryTimeInterval];
    if (v5 >= v6)
    {
      uint64_t v10 = 0;
      goto LABEL_8;
    }
    uint32_t v7 = arc4random_uniform(0x32u);
    uint64_t v8 = v7 + 50;
    uint64_t v9 = sqlite3_sleep(v7 + 50);
    if (v9 != v8) {
      NSLog(&cfstr_WarningRequest.isa, v8, v9);
    }
  }
  else
  {
    v3[3] = v4;
  }
  uint64_t v10 = 1;
LABEL_8:

  return v10;
}

uint64_t __41___bmFMDatabase_cachedStatementForQuery___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 inUse] ^ 1;
  *a3 = result;
  return result;
}

uint64_t FMDBExecuteBulkSQLCallback(uint64_t result, int a2, void *a3, void *a4)
{
  if (result)
  {
    uint32_t v7 = (uint64_t (**)(void, void))MEMORY[0x1BA9C18B0]();
    uint64_t v8 = a2;
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:a2];
    if (a2 >= 1)
    {
      do
      {
        uint64_t v10 = [NSString stringWithUTF8String:*a4];
        if (*a3) {
          objc_msgSend(NSString, "stringWithUTF8String:");
        }
        else {
        v11 = [MEMORY[0x1E4F1CA98] null];
        }
        if (!v11)
        {
          v11 = [MEMORY[0x1E4F1CA98] null];
        }
        [v9 setObject:v11 forKey:v10];

        ++a3;
        ++a4;
        --v8;
      }
      while (v8);
    }
    uint64_t v12 = ((uint64_t (**)(void, void *))v7)[2](v7, v9);

    return v12;
  }
  return result;
}

void FMDBBlockSQLiteCallBackFunction(sqlite3_context *a1, uint64_t a2, uint64_t a3)
{
  sqlite3_user_data(a1);
  uint32_t v7 = (void (**)(id, sqlite3_context *, uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    double v6 = (void *)MEMORY[0x1BA9C16F0]();
    v7[2](v7, a1, a2, a3);
  }
}

uint64_t __44___bmFMDatabasePool_pushDatabaseBackInPool___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Database already in pool" reason:@"The _bmFMDatabase being put back into the pool is already present in the pool" userInfo:0];
    [v2 raise];
  }
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v4 removeObject:v3];
}

void sub_1B87CCC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void __23___bmFMDatabasePool_db__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) lastObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  if (v7)
  {
    [*(id *)(v5 + 24) addObject:*(void *)(v6 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 16) removeLastObject];
  }
  else
  {
    if (*(void *)(v5 + 56))
    {
      uint64_t v8 = [*(id *)(v5 + 24) count];
      unint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 16) count] + v8;
      if (v9 >= *(void *)(*(void *)(a1 + 32) + 56))
      {
        NSLog(&cfstr_MaximumNumberO.isa, v9);
        return;
      }
    }
    uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "databaseClass"), "databaseWithPath:", *(void *)(*(void *)(a1 + 32) + 40));
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) openWithFlags:*(unsigned int *)(*(void *)(a1 + 32) + 32) vfs:*(void *)(*(void *)(a1 + 32) + 64)])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([*(id *)(*(void *)(a1 + 32) + 48) databasePool:*(void *)(a1 + 32) shouldAddDatabaseToPool:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] & 1) != 0)
    {
      if (([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] & 1) == 0)
      {
        [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
        if (!v7 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v13 = *(void **)(*(void *)(a1 + 32) + 48);
          objc_msgSend(v13, "databasePool:didAddDatabase:");
        }
      }
      return;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) close];
  }
  else
  {
    NSLog(&cfstr_CouldNotOpenUp.isa, *(void *)(*(void *)(a1 + 32) + 40));
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;
}

void sub_1B87CCF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __46___bmFMDatabasePool_countOfCheckedInDatabases__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1B87CD010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __47___bmFMDatabasePool_countOfCheckedOutDatabases__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1B87CD104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __41___bmFMDatabasePool_countOfOpenDatabases__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) count];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result + v2;
  return result;
}

uint64_t __40___bmFMDatabasePool_releaseAllDatabases__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 removeAllObjects];
}

void __27___bmFMDatabaseQueue_close__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) close];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

void __33___bmFMDatabaseQueue_inDatabase___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if ([v2 hasOpenResultSets]) {
    NSLog(&cfstr_WarningThereIs.isa);
  }
}

void __49___bmFMDatabaseQueue_beginTransaction_withBlock___block_invoke(uint64_t a1)
{
  unsigned __int8 v8 = 0;
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) database];
    [v3 beginImmediateTransaction];
  }
  else if (v2 == 1)
  {
    uint64_t v3 = [*(id *)(a1 + 32) database];
    [v3 beginDeferredTransaction];
  }
  else
  {
    if (v2) {
      goto LABEL_8;
    }
    uint64_t v3 = [*(id *)(a1 + 32) database];
    [v3 beginTransaction];
  }

LABEL_8:
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) database];
  (*(void (**)(uint64_t, void *, unsigned __int8 *))(v4 + 16))(v4, v5, &v8);

  LODWORD(v4) = v8;
  uint64_t v6 = [*(id *)(a1 + 32) database];
  uint64_t v7 = v6;
  if (v4) {
    [v6 rollback];
  }
  else {
    [v6 commit];
  }
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

void __34___bmFMDatabaseQueue_inSavePoint___block_invoke(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v3 = inSavePoint__savePointIdx_1++;
  uint64_t v4 = objc_msgSend(v2, "initWithFormat:", @"savePoint%ld", v3);
  char v17 = 0;
  uint64_t v5 = [*(id *)(a1 + 32) database];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  int v7 = [v5 startSavePointWithName:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    unint64_t v9 = [*(id *)(a1 + 32) database];
    (*(void (**)(uint64_t, void *, char *))(v8 + 16))(v8, v9, &v17);

    if (v17)
    {
      uint64_t v10 = [*(id *)(a1 + 32) database];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      id v15 = *(id *)(v11 + 40);
      [v10 rollbackToSavePointWithName:v4 error:&v15];
      objc_storeStrong((id *)(v11 + 40), v15);
    }
    uint64_t v12 = [*(id *)(a1 + 32) database];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(id *)(v13 + 40);
    [v12 releaseSavePointWithName:v4 error:&v14];
    objc_storeStrong((id *)(v13 + 40), v14);
  }
}

void __74___bmFMDatabaseQueue_checkpoint_name_logFrameCount_checkpointCount_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 checkpoint:*(unsigned int *)(a1 + 80) name:*(void *)(a1 + 40) logFrameCount:*(void *)(a1 + 56) checkpointCount:*(void *)(a1 + 64) error:*(void *)(a1 + 72)];
}

void BiomeLibraryLibrary_cold_1(void *a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *BiomeLibraryLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMRegistrar.m", 27, @"%s", *a1);

  __break(1u);
}

void __getBMSourceClass_block_invoke_cold_1(void *a1)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *BiomeStreamsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMRegistrar.m", 18, @"%s", *a1);

  __break(1u);
}

void __getBMSourceClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class getBMSourceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMRegistrar.m", 19, @"Unable to find class %s", "BMSource");

  __break(1u);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __biome_log_for_category()
{
  return MEMORY[0x1F410C868]();
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
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4181FC8](a1);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x1F4182040](a1, a2, a3);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x1F4182118](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_data_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182140](pStmt);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

void sqlite3_interrupt(sqlite3 *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

const char *sqlite3_libversion(void)
{
  return (const char *)MEMORY[0x1F4182238]();
}

int sqlite3_limit(sqlite3 *a1, int id, int newVal)
{
  return MEMORY[0x1F4182240](a1, *(void *)&id, *(void *)&newVal);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x1F4182270](pDb, pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1F4182278](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_error_code(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_error_nomem(sqlite3_context *a1)
{
}

void sqlite3_result_error_toobig(sqlite3_context *a1)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

int sqlite3_sleep(int a1)
{
  return MEMORY[0x1F4182368](*(void *)&a1);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_threadsafe(void)
{
  return MEMORY[0x1F41823E8]();
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x1F4182408](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1F4182410](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x1F4182418](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  MEMORY[0x1F4182428](a1);
  return result;
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x1F4182440](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1F4182448](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1F4182458](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x1F4182468](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1F4182490](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}