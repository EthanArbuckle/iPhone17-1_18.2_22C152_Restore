void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1909201DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1909208BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id CNResultWithLock(void *a1, void *a2)
{
  id v3 = a1;
  v4 = a2;
  [v3 lock];
  v5 = v4[2](v4);
  [v3 unlock];

  return v5;
}

void sub_19092096C(_Unwind_Exception *a1)
{
}

void sub_19092098C(void *a1)
{
}

void CNRunWithLock(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  [v4 lock];
  v3[2](v3);
  [v4 unlock];
}

void sub_190920A1C(_Unwind_Exception *a1)
{
}

void sub_190920A3C(void *a1)
{
}

void sub_190920CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_190921044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id cn_objectResultWithObjectLock(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __cn_objectResultWithObjectLock_block_invoke;
  v8[3] = &unk_1E569F2E8;
  v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  cn_runWithObjectLock(v3, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void sub_190921B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void cn_runWithObjectLock(void *a1, void *a2)
{
  id v3 = a2;
  id obj = a1;
  objc_sync_enter(obj);
  v3[2](v3);

  objc_sync_exit(obj);
}

uint64_t __cn_objectResultWithObjectLock_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return MEMORY[0x1F41817F8]();
}

void sub_190921F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL CNIsStringEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || [a2 length] == 0;
}

void sub_1909233B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id PAAccessLoggerFunction()
{
  return (id)classPAAccessLogger;
}

Class initPAAccessLogger()
{
  if (LoadPrivacyAccounting_loadPredicate != -1) {
    dispatch_once(&LoadPrivacyAccounting_loadPredicate, &__block_literal_global_196);
  }
  Class result = objc_getClass("PAAccessLogger");
  classPAAccessLogger = (uint64_t)result;
  getPAAccessLoggerClass = (uint64_t (*)())PAAccessLoggerFunction;
  return result;
}

uint64_t CNEitherIsLeft_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLeft];
}

BOOL CNIsArrayNonEmpty_block_invoke_2(uint64_t a1, void *a2)
{
  return a2 && [a2 count] != 0;
}

void sub_190924E9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sSynchronousSerialDispatchQueueSchedulerProvider_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[CNScheduler synchronousSerialDispatchQueueWithName:a2];
}

void sub_190925698(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_190925F10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_190925FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190927178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id sSerialDispatchQueueSchedulerProvider_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNScheduler serialDispatchQueueSchedulerWithName:a2];
}

id __CNContentsExclusivelyInCharacterSet_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [NSNumber numberWithChar:uset_containsAllCodePoints()];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  return v3;
}

void __CNEmojiCharacterSet_block_invoke()
{
  if (LoadCoreText_loadPredicate != -1) {
    dispatch_once(&LoadCoreText_loadPredicate, &__block_literal_global_55);
  }
  uint64_t v0 = softLinkCTFontCreateWithName(@"AppleColorEmoji", 0, 0.0);
  if (v0)
  {
    v1 = (const void *)v0;
    id v5 = (id)softLinkCTFontCopyCharacterSet(v0);
    CFRelease(v1);
    uint64_t v2 = (void *)[v5 mutableCopy];
    objc_msgSend(v2, "removeCharactersInRange:", 0, 128);
    uint64_t v3 = [v2 copy];
    id v4 = (void *)CNEmojiCharacterSet_sEmoji;
    CNEmojiCharacterSet_sEmoji = v3;
  }
}

uint64_t __GetBundle_block_invoke()
{
  GetBundle_cn_once_object_1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

void sub_19092ADC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CNArrayCompactMapFastPath(void *a1, void *a2)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v25 = v3;
  unint64_t v5 = [v3 count];
  unint64_t v6 = v5;
  if (v5 >= 0x81)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    v26 = @"count";
    v19 = [NSNumber numberWithUnsignedInteger:v5];
    v27[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v21 = [v17 exceptionWithName:v18 reason:@"CNArrayCompactMapFastPath called with too many objects" userInfo:v20];

    objc_exception_throw(v21);
  }
  uint64_t v7 = 8 * v5;
  MEMORY[0x1F4188790]();
  v23 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v23, 8 * v6);
  v22[1] = v22;
  uint64_t v8 = 0;
  if (v6)
  {
    uint64_t v9 = 0;
    v24 = (char *)(v4 + 2);
    do
    {
      v10 = [v25 objectAtIndexedSubscript:v9];
      uint64_t v11 = v4[2](v4, v10);
      v12 = ((void (*)(uint64_t, void *))off_1EE025F60)((uint64_t)&__block_literal_global_4_4, v11);

      if (v12) {
        objc_storeStrong((id *)&v23[8 * v8++], v11);
      }

      ++v9;
    }
    while (v6 != v9);
  }
  uint64_t v13 = v23;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:v8];
  if (v6)
  {
    v15 = v13 - 8;
    do
    {

      v7 -= 8;
    }
    while (v7);
  }

  return v14;
}

BOOL CNPairNeitherElementIsNil_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 first];
  if (v3)
  {
    id v4 = [v2 second];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __CNArrayMapSlowPath_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = *(void **)(a1 + 32);
  id v3 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v4);
  [v2 addObject:v3];
}

uint64_t CNPairFirst_block_invoke(uint64_t a1, void *a2)
{
  return [a2 first];
}

id CNArrayMapFastPath(void *a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = [v3 count];
  unint64_t v6 = v5;
  if (v5 >= 0x81)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    v23 = @"count";
    v19 = [NSNumber numberWithUnsignedInteger:v5];
    v24[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v21 = [v17 exceptionWithName:v18 reason:@"CNArrayMapFastPath called with too many objects" userInfo:v20];

    objc_exception_throw(v21);
  }
  v22[1] = v22;
  uint64_t v7 = 8 * v5;
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v8, 8 * v6);
  if (v6)
  {
    uint64_t v9 = 0;
    void v22[2] = v4 + 2;
    do
    {
      [v3 objectAtIndexedSubscript:v9];
      uint64_t v11 = v10 = v3;
      v12 = v4[2](v4, v11);
      uint64_t v13 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v12);
      v14 = *(void **)&v8[8 * v9];
      *(void *)&v8[8 * v9] = v13;

      id v3 = v10;
      ++v9;
    }
    while (v6 != v9);
  }
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:(char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) count:v6];
  if (v6)
  {
    do
    {

      v7 -= 8;
    }
    while (v7);
  }

  return v15;
}

id CNNilToNull_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  unint64_t v5 = v4;

  return v5;
}

id CNNullToNil_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ((id)*MEMORY[0x1E4F1D260] == v2
    || ([MEMORY[0x1E4F1CA98] null],
        id v3 = (id)objc_claimAutoreleasedReturnValue(),
        v3,
        v3 == v2))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = v2;
  }

  return v4;
}

BOOL CNIsNull_block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CA98];
  id v3 = a2;
  id v4 = [v2 null];

  return v4 == v3;
}

BOOL CNIsNotNull_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CA98];
  id v3 = a2;
  id v4 = [v2 null];

  return v4 != v3;
}

id CNSortKeyStringForString(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (!a2) {
    goto LABEL_7;
  }
  if (![v3 length]) {
    goto LABEL_7;
  }
  size_t v10 = 0;
  unint64_t v5 = CNCreateSortKey(v4, a2, 0, &v10);
  if (!v5) {
    goto LABEL_7;
  }
  unint64_t v6 = (char *)v5;
  if (!v10
    || (id v7 = [NSString alloc],
        (uint64_t v8 = (void *)[v7 initWithBytesNoCopy:v6 length:v10 encoding:5 freeWhenDone:1]) == 0))
  {
    free(v6);
LABEL_7:
    uint64_t v8 = 0;
  }

  return v8;
}

const char *CNCreateSortKey(void *a1, uint64_t a2, uint64_t a3, size_t *a4)
{
  v16[500] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a1;
  uint64_t v7 = [(__CFString *)v6 length];
  CFIndex v8 = v7;
  uint64_t v9 = a2;
  if (a2)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = CNCreateCollatorWithPreferredLocale(0, 0);
    if (v8)
    {
LABEL_3:
      CharactersPtr = CFStringGetCharactersPtr(v6);
      uint64_t v11 = (UniChar *)CharactersPtr;
      if (!CharactersPtr)
      {
        uint64_t v11 = (UniChar *)malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
        v17.location = 0;
        v17.length = v8;
        CFStringGetCharacters(v6, v17, v11);
      }
      ucol_setStrength();
      unsigned int SortKey = ucol_getSortKey();
      uint64_t v13 = (char *)malloc_type_calloc(SortKey, 1uLL, 0xEA638985uLL);
      v14 = v13;
      if (SortKey < 0xFA1)
      {
        memcpy(v13, v16, SortKey);
        if (CharactersPtr) {
          goto LABEL_13;
        }
      }
      else
      {
        unsigned int SortKey = ucol_getSortKey();
        if (CharactersPtr) {
          goto LABEL_13;
        }
      }
      free(v11);
LABEL_13:
      if (a4)
      {
        *a4 = SortKey - 1;
        *a4 = strlen(v14);
      }
      goto LABEL_15;
    }
  }
  v14 = 0;
  if (a4) {
    *a4 = 0;
  }
LABEL_15:
  if (v9 != a2 && v9) {
    ucol_close();
  }

  return v14;
}

void sub_19092D244(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_19092E458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL CNIsArrayEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || [a2 count] == 0;
}

void sub_19092F264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL CNIsStringNonempty_block_invoke_2(uint64_t a1, void *a2)
{
  return a2 && [a2 length] != 0;
}

Class initPAApplication()
{
  if (LoadPrivacyAccounting_loadPredicate != -1) {
    dispatch_once(&LoadPrivacyAccounting_loadPredicate, &__block_literal_global_196);
  }
  Class result = objc_getClass("PAApplication");
  classPAApplication = (uint64_t)result;
  getPAApplicationClass = (uint64_t (*)())PAApplicationFunction;
  return result;
}

void sub_19093012C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CNPromiseCompletionHandler(void *a1)
{
  id v1 = a1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __CNPromiseCompletionHandler_block_invoke;
  aBlock[3] = &unk_1E56A1C18;
  id v7 = v1;
  id v2 = v1;
  id v3 = _Block_copy(aBlock);
  id v4 = (void *)[v3 copy];

  return v4;
}

void sub_190930E18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190931AD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __CNPromiseCompletionHandler_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

void sub_190931E70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

Class initPATCCAccess()
{
  if (LoadPrivacyAccounting_loadPredicate != -1) {
    dispatch_once(&LoadPrivacyAccounting_loadPredicate, &__block_literal_global_196);
  }
  Class result = objc_getClass("PATCCAccess");
  classPATCCAccess = (uint64_t)result;
  getPATCCAccessClass = (uint64_t (*)())PATCCAccessFunction;
  return result;
}

void sub_190933890(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_190933E78(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 104));
  _Unwind_Resume(a1);
}

void sub_19093412C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 112));
  _Unwind_Resume(a1);
}

void sub_19093446C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19093462C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_190934B64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_190934F00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_1909350FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_190935494(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL CNIsIndexSetEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || [a2 count] == 0;
}

BOOL CNStringContainsNonLatinCharacters(void *a1)
{
  id v1 = a1;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v1))
  {
    BOOL v2 = 0;
  }
  else
  {
    if (CNLatinCharacterUSet_onceToken != -1) {
      dispatch_once(&CNLatinCharacterUSet_onceToken, &__block_literal_global_60);
    }
    if (CNContentsExclusivelyInCharacterSet(v1, CNLatinCharacterUSet_set)) {
      BOOL v2 = CNStringContainsEmojiCharacters(v1);
    }
    else {
      BOOL v2 = 1;
    }
  }

  return v2;
}

BOOL CNStringContainsEmojiCharacters(void *a1)
{
  id v1 = a1;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v1))
  {
    BOOL v2 = 0;
  }
  else
  {
    if (CNEmojiCharacterSet_onceToken != -1) {
      dispatch_once(&CNEmojiCharacterSet_onceToken, &__block_literal_global_50);
    }
    BOOL v2 = [v1 rangeOfCharacterFromSet:CNEmojiCharacterSet_sEmoji] != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

__CFString *CNNameDelimiterForString(void *a1)
{
  id v1 = a1;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v1)) {
    goto LABEL_12;
  }
  if (CNKatakanaCharacterUSet_onceToken != -1) {
    dispatch_once(&CNKatakanaCharacterUSet_onceToken, &__block_literal_global_48);
  }
  if ((CNContentsExclusivelyInCharacterSet(v1, CNKatakanaCharacterUSet_set) & 1) == 0)
  {
LABEL_12:
    if (CNIsChineseJapaneseKoreanString(v1)) {
      BOOL v2 = &stru_1EE0267A8;
    }
    else {
      BOOL v2 = @" ";
    }
  }
  else
  {
    BOOL v2 = @"・";
  }

  return v2;
}

uint64_t CNIsChineseJapaneseKoreanString(void *a1)
{
  id v1 = a1;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v1))
  {
    uint64_t v2 = 0;
  }
  else
  {
    if (CNChineseJapaneseKoreanPlusWhitelistedCharacterUSet_onceToken != -1) {
      dispatch_once(&CNChineseJapaneseKoreanPlusWhitelistedCharacterUSet_onceToken, &__block_literal_global_36);
    }
    uint64_t v2 = CNContentsExclusivelyInCharacterSet(v1, CNChineseJapaneseKoreanPlusWhitelistedCharacterUSet_set);
  }

  return v2;
}

uint64_t CNContentsExclusivelyInCharacterSet(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v3))
  {
    uint64_t v4 = 1;
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __CNContentsExclusivelyInCharacterSet_block_invoke;
    v7[3] = &__block_descriptor_40_e13__24__0r_S8Q16l;
    v7[4] = a2;
    unint64_t v5 = objc_msgSend(v3, "_cn_resultWithAllCharacters:", v7);
    uint64_t v4 = [v5 BOOLValue];
  }
  return v4;
}

void sub_190935CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190936EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190937A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL CNIsDictionaryEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || [a2 count] == 0;
}

Class initACAccountStore()
{
  if (LoadAccounts_loadPredicate != -1) {
    dispatch_once(&LoadAccounts_loadPredicate, &__block_literal_global_12);
  }
  Class result = objc_getClass("ACAccountStore");
  classACAccountStore = (uint64_t)result;
  getACAccountStoreClass = (uint64_t (*)())ACAccountStoreFunction;
  return result;
}

void __LoadAccounts_block_invoke()
{
  LoadAccounts_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/Accounts.framework/Accounts", 1);
  if (!LoadAccounts_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadAccounts_block_invoke_cold_1();
  }
}

uint64_t __CNKatakanaCharacterUSet_block_invoke()
{
  uint64_t result = CNCopyCharacterUSetWithPattern(@"[:scx=Kana:]");
  CNKatakanaCharacterUSet_set = result;
  return result;
}

uint64_t __CNChineseJapaneseKoreanPlusWhitelistedCharacterUSet_block_invoke()
{
  uint64_t result = CNCopyCharacterUSetWithPattern(@"[[:Hani:][:Hiragana:][:scx=Kana:][:Bopomofo:][:Hangul:][ˉˊˇˋ˙][()（）]]");
  CNChineseJapaneseKoreanPlusWhitelistedCharacterUSet_set = result;
  return result;
}

uint64_t CNCopyCharacterUSetWithPattern(void *a1)
{
  if (!a1) {
    return 0;
  }
  [a1 cStringUsingEncoding:10];
  uint64_t v1 = uset_openPattern();
  uint64_t v2 = v1;
  MEMORY[0x192FD12C0](v1);
  return v2;
}

void __LoadPrivacyAccounting_block_invoke()
{
  LoadPrivacyAccounting_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/PrivacyAccounting.framework/PrivacyAccounting", 1);
  if (!LoadPrivacyAccounting_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadPrivacyAccounting_block_invoke_cold_1();
  }
}

void __LoadMobileKeyBag_block_invoke()
{
  LoadMobileKeyBag_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 1);
  if (!LoadMobileKeyBag_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadMobileKeyBag_block_invoke_cold_1();
  }
}

uint64_t initMGCopyAnswer(uint64_t a1, uint64_t a2)
{
  if (LoadMobileKeyBag_loadPredicate != -1) {
    dispatch_once(&LoadMobileKeyBag_loadPredicate, &__block_literal_global_60);
  }
  uint64_t v4 = (uint64_t (*)())dlsym((void *)LoadMobileKeyBag_frameworkLibrary, "MGCopyAnswer");
  softLinkMGCopyAnswer = v4;

  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

Class initMCProfileConnection()
{
  if (LoadManagedConfiguration_loadPredicate_0 != -1) {
    dispatch_once(&LoadManagedConfiguration_loadPredicate_0, &__block_literal_global_125);
  }
  Class result = objc_getClass("MCProfileConnection");
  classMCProfileConnection = (uint64_t)result;
  getMCProfileConnectionClass = (uint64_t (*)())MCProfileConnectionFunction;
  return result;
}

void __LoadManagedConfiguration_block_invoke()
{
  LoadManagedConfiguration_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 1);
  if (!LoadManagedConfiguration_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadManagedConfiguration_block_invoke_cold_1();
  }
}

void __LoadManagedConfiguration_block_invoke_0()
{
  LoadManagedConfiguration_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 1);
  if (!LoadManagedConfiguration_frameworkLibrary_0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadManagedConfiguration_block_invoke_cold_1();
  }
}

Class initIntlUtility()
{
  if (LoadIntlUtilities_loadPredicate != -1) {
    dispatch_once(&LoadIntlUtilities_loadPredicate, &__block_literal_global_34);
  }
  Class result = objc_getClass("IntlUtility");
  classIntlUtility = (uint64_t)result;
  getIntlUtilityClass = (uint64_t (*)())IntlUtilityFunction;
  return result;
}

Class initIntlUtility_0()
{
  if (LoadIntlPreferences_loadPredicate != -1) {
    dispatch_once(&LoadIntlPreferences_loadPredicate, &__block_literal_global_25_1);
  }
  Class result = objc_getClass("IntlUtility");
  classIntlUtility_0 = (uint64_t)result;
  getIntlUtilityClass_0 = (uint64_t (*)())IntlUtilityFunction_0;
  return result;
}

BOOL CNIsSetEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || [a2 count] == 0;
}

uint64_t initMKBDeviceUnlockedSinceBoot()
{
  if (LoadMobileKeyBag_loadPredicate != -1) {
    dispatch_once(&LoadMobileKeyBag_loadPredicate, &__block_literal_global_60);
  }
  uint64_t v0 = (uint64_t (*)())dlsym((void *)LoadMobileKeyBag_frameworkLibrary, "MKBDeviceUnlockedSinceBoot");
  softLinkMKBDeviceUnlockedSinceBoot = v0;

  return v0();
}

void __LoadIntlPreferences_block_invoke()
{
  LoadIntlPreferences_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IntlPreferences.framework/IntlPreferences", 1);
  if (!LoadIntlPreferences_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadIntlPreferences_block_invoke_cold_1();
  }
}

uint64_t CNCreateCollatorWithPreferredLocale(uint64_t a1, void *a2)
{
  int v13 = 0;
  uint64_t v2 = a2;
  id v3 = v2;
  if ([(__CFString *)v2 length])
  {
    if (!v2) {
      goto LABEL_10;
    }
  }
  else
  {
    id v3 = (__CFString *)CNCopyUserLanguage();

    if (!v3) {
      goto LABEL_10;
    }
  }
  CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  if (CStringPtr)
  {
    unint64_t v5 = CStringPtr;
    int v6 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = [(__CFString *)v3 maximumLengthOfBytesUsingEncoding:1];
  uint64_t v12 = 0;
  unint64_t v5 = malloc_type_malloc(v7 + 1, 0x102A8723uLL);
  if (-[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v5, v7, &v12, 1, 0, 0, [(__CFString *)v3 length], 0))
  {
    v5[v12] = 0;
    int v6 = 1;
    goto LABEL_11;
  }
  free(v5);
LABEL_10:
  int v6 = 0;
  unint64_t v5 = 0;
LABEL_11:
  if (v5) {
    CFIndex v8 = v5;
  }
  else {
    CFIndex v8 = "en";
  }
  uint64_t v9 = ucol_open();
  if (v13 >= 1) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }
  ucol_setAttribute();
  if (v6) {
    free(v8);
  }

  return v10;
}

CFLocaleIdentifier CNCopyUserLanguage()
{
  CFArrayRef v0 = (const __CFArray *)CFPreferencesCopyAppValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8]);
  if (!v0) {
    goto LABEL_6;
  }
  CFArrayRef v1 = v0;
  if (CFArrayGetCount(v0) <= 0)
  {
    CFRelease(v1);
LABEL_6:
    CFLocaleIdentifier CanonicalLanguageIdentifierFromString = @"en";
    CFRetain(@"en");
    return CanonicalLanguageIdentifierFromString;
  }
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v1, 0);
  CFLocaleIdentifier CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(0, ValueAtIndex);
  CFRelease(v1);
  if (!CanonicalLanguageIdentifierFromString) {
    goto LABEL_6;
  }
  return CanonicalLanguageIdentifierFromString;
}

uint64_t initCTFontCreateWithName(uint64_t a1, uint64_t a2, float a3)
{
  if (LoadCoreText_loadPredicate != -1) {
    dispatch_once(&LoadCoreText_loadPredicate, &__block_literal_global_55);
  }
  int v6 = (uint64_t (*)())dlsym((void *)LoadCoreText_frameworkLibrary, "CTFontCreateWithName");
  softLinkCTFontCreateWithName = v6;
  v7.n128_f32[0] = a3;

  return ((uint64_t (*)(uint64_t, uint64_t, __n128))v6)(a1, a2, v7);
}

uint64_t initCTFontCopyCharacterSet(uint64_t a1)
{
  if (LoadCoreText_loadPredicate != -1) {
    dispatch_once(&LoadCoreText_loadPredicate, &__block_literal_global_55);
  }
  uint64_t v2 = (uint64_t (*)())dlsym((void *)LoadCoreText_frameworkLibrary, "CTFontCopyCharacterSet");
  softLinkCTFontCopyCharacterSet = v2;

  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void __LoadCoreText_block_invoke()
{
  LoadCoreText_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/CoreText.framework/CoreText", 1);
  if (!LoadCoreText_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadCoreText_block_invoke_cold_1();
  }
}

uint64_t __CNLatinCharacterUSet_block_invoke()
{
  uint64_t result = CNCopyCharacterUSetWithPattern(@"[[:Latin:][:Common:][:Inherited:]]");
  CNLatinCharacterUSet_set = result;
  return result;
}

id CopyViaSecureCoding(void *a1)
{
  CFArrayRef v1 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initRequiringSecureCoding:1];
  [v3 encodeObject:v2 forKey:@"key"];
  [v3 finishEncoding];
  id v4 = objc_alloc(MEMORY[0x1E4F28DC0]);
  unint64_t v5 = [v3 encodedData];
  uint64_t v10 = 0;
  int v6 = (void *)[v4 initForReadingFromData:v5 error:&v10];

  uint64_t v7 = objc_opt_class();
  CFIndex v8 = [v6 decodeObjectOfClass:v7 forKey:@"key"];
  [v6 finishDecoding];

  return v8;
}

id CopyViaSecureCodingWithAllowedClasses(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v4 = a2;
  id v5 = a1;
  int v6 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v6 encodeObject:v5 forKey:@"key"];
  [v6 finishEncoding];
  id v7 = objc_alloc(MEMORY[0x1E4F28DC0]);
  CFIndex v8 = [v6 encodedData];
  uint64_t v15 = 0;
  uint64_t v9 = (void *)[v7 initForReadingFromData:v8 error:&v15];

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [v4 arrayByAddingObject:v10];

  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  int v13 = [v9 decodeObjectOfClasses:v12 forKey:@"key"];

  [v9 finishDecoding];

  return v13;
}

id CopyViaXPCCoding(void *a1)
{
  CFArrayRef v1 = (void *)MEMORY[0x1E4F29258];
  id v2 = a1;
  id v3 = [v1 _testEncodeAndDecodeObject:v2 allowedClass:objc_opt_class()];

  return v3;
}

id CopyViaXPCCodingWithAllowedClasses(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [v3 arrayByAddingObject:objc_opt_class()];

  int v6 = (void *)MEMORY[0x1E4F29258];
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  CFIndex v8 = [v6 _testEncodeAndDecodeObject:v4 allowedClasses:v7];

  return v8;
}

uint64_t _block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSuccess];
}

uint64_t sCNResultIsSuccess_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isFailure];
}

uint64_t CNVirtualSchedulerJobTimeComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 time];
  unint64_t v6 = [v4 time];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

void sub_19093C838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CNCoreDelegateInfo *CNCoreDelegateInfoFromFamilyMember_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNCoreDelegateInfo alloc] initWithFamilyMember:v2];

  return v3;
}

CNCoreDelegateInfo *CNCoreDelegateInfoFromACAccount_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F28F30];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  unint64_t v5 = [v3 parentAccount];
  unint64_t v6 = objc_msgSend(v5, "_cn_firstName");
  [v4 setGivenName:v6];

  id v7 = [v3 parentAccount];
  CFIndex v8 = objc_msgSend(v7, "_cn_lastName");
  [v4 setFamilyName:v8];

  uint64_t v9 = [v3 childAccounts];
  BOOL v10 = [v9 count] != 0;

  uint64_t v11 = [CNCoreDelegateInfo alloc];
  uint64_t v12 = objc_msgSend(v3, "_cn_dsid");
  int v13 = objc_msgSend(v3, "_cn_altDSID");
  v14 = objc_msgSend(v3, "_cn_appleID");
  uint64_t v15 = objc_msgSend(v3, "_cn_principalPath");

  id v16 = [(CNCoreDelegateInfo *)v11 initWithDSID:v12 altDSID:v13 appleID:v14 principalPath:v15 nameComponents:v4 isMe:v10];

  return v16;
}

void sub_19093FA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19093FC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19093FF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1909401BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

id CNRangeDividedIntoStridesOfLength(uint64_t a1, unint64_t a2, unint64_t a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    unint64_t v4 = a2;
    unint64_t v5 = a1;
    if (a2 <= a3)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a1, a2);
      v13[0] = v11;
      unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    }
    else
    {
      unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      for (i = v5 + v4; v5 < i; unint64_t v4 = v8)
      {
        unint64_t v8 = v4 - a3;
        if (v4 >= a3) {
          uint64_t v9 = a3;
        }
        else {
          uint64_t v9 = v4;
        }
        BOOL v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v5, v9);
        objc_msgSend(v6, "_cn_addNonNilObject:", v10);

        v5 += a3;
      }
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

id CNRangeDividedIntoBalancedStridesOfLength(uint64_t a1, unint64_t a2, unint64_t a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    unint64_t v5 = a1;
    if (a2 <= a3)
    {
      v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a1, a2);
      v16[0] = v14;
      unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    }
    else
    {
      unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      unint64_t v7 = v5 + a2;
      if (v5 < v5 + a2)
      {
        unint64_t v8 = vcvtpd_u64_f64((double)a2 / (double)a3);
        unint64_t v9 = (unint64_t)(double)(a2 / v8);
        unint64_t v10 = a2 % v8;
        do
        {
          if (v10) {
            unint64_t v11 = v9 + 1;
          }
          else {
            unint64_t v11 = v9;
          }
          if (v10) {
            --v10;
          }
          else {
            unint64_t v10 = 0;
          }
          if (v11 >= v7 - v5) {
            unint64_t v12 = v7 - v5;
          }
          else {
            unint64_t v12 = v11;
          }
          uint64_t v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v5, v12);
          objc_msgSend(v6, "_cn_addNonNilObject:", v13);

          v5 += v12;
        }
        while (v5 < v7);
      }
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

id CNComparatorForSortingByAuxiliaryValues(uint64_t a1, uint64_t a2)
{
  return +[_CNSortsByPositionInAuxiliaryArray comparatorForSortingAccordingToAuxiliaryValues:a1 transform:a2];
}

uint64_t CNArrayFlatten_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_flatten");
}

void __CNArrayConcurrentMapSlowPath_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v8);
  uint64_t v6 = *(void *)(a1 + 40);
  unint64_t v7 = *(void **)(v6 + 8 * a3);
  *(void *)(v6 + 8 * a3) = v5;
}

id PATCCAccessFunction()
{
  return (id)classPATCCAccess;
}

Class initPAOutOfProcessPickerAccess()
{
  if (LoadPrivacyAccounting_loadPredicate != -1) {
    dispatch_once(&LoadPrivacyAccounting_loadPredicate, &__block_literal_global_196);
  }
  Class result = objc_getClass("PAOutOfProcessPickerAccess");
  classPAOutOfProcessPickerAccess = (uint64_t)result;
  getPAOutOfProcessPickerAccessClass[0] = (uint64_t (*)())PAOutOfProcessPickerAccessFunction;
  return result;
}

id PAOutOfProcessPickerAccessFunction()
{
  return (id)classPAOutOfProcessPickerAccess;
}

id PAApplicationFunction()
{
  return (id)classPAApplication;
}

id initPAAuthenticatedClientIdentity(_OWORD *a1, void *a2)
{
  uint64_t v3 = LoadPrivacyAccounting_loadPredicate;
  id v4 = a2;
  if (v3 != -1) {
    dispatch_once(&LoadPrivacyAccounting_loadPredicate, &__block_literal_global_196);
  }
  softLinkPAAuthenticatedClientIdentity[0] = (uint64_t (*)())dlsym((void *)LoadPrivacyAccounting_frameworkLibrary, "PAAuthenticatedClientIdentity");
  long long v5 = a1[1];
  v8[0] = *a1;
  v8[1] = v5;
  uint64_t v6 = ((void (*)(_OWORD *, id))softLinkPAAuthenticatedClientIdentity[0])(v8, v4);

  return v6;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id CNJSONStringFromObject_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a2 options:0 error:0];
  uint64_t v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];

  return v3;
}

id CNObjectFromJSONString_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 dataUsingEncoding:4];
  uint64_t v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v2 options:0 error:0];

  return v3;
}

void sub_190943710(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1909437AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190943954(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190943FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CNCacheMissPolicyNewMutableArray_block_invoke()
{
  return [MEMORY[0x1E4F1CA48] array];
}

void sub_190944DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1909455C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sLock_block_invoke(uint64_t a1, void *a2)
{
  return [a2 lock];
}

uint64_t sUnlock_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 unlock];
}

void CNRunWithLocks(void *a1, void *a2)
{
  id v4 = a1;
  uint64_t v3 = a2;
  objc_msgSend(v4, "_cn_each:", &__block_literal_global_9);
  v3[2](v3);
  objc_msgSend(v4, "_cn_each_reverse:", &__block_literal_global_2);
}

void sub_190945F18(_Unwind_Exception *a1)
{
}

void sub_190945F38(void *a1)
{
}

void CNRunWithLockCatching(void *a1, void *a2, void *a3)
{
  id v7 = a1;
  long long v5 = a2;
  id v6 = a3;
  [v7 lock];
  v5[2](v5);
  [v7 unlock];
}

void sub_190945FDC(_Unwind_Exception *a1)
{
}

id CNResultWithLocks(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_9);
  long long v5 = v4[2](v4);
  objc_msgSend(v3, "_cn_each_reverse:", &__block_literal_global_2);

  return v5;
}

void sub_1909460F0(_Unwind_Exception *a1)
{
}

void sub_190946110(void *a1)
{
}

void __softLinkSimulateCrashAvailable_block_invoke()
{
  if (LoadCrashReporterSupport_loadPredicate != -1) {
    dispatch_once(&LoadCrashReporterSupport_loadPredicate, &__block_literal_global_13);
  }
  if (LoadCrashReporterSupport_frameworkLibrary) {
    BOOL v0 = dlsym((void *)LoadCrashReporterSupport_frameworkLibrary, "SimulateCrash") != 0;
  }
  else {
    BOOL v0 = 0;
  }
  softLinkSimulateCrashAvailable_isAvailable = v0;
}

void __LoadCrashReporterSupport_block_invoke()
{
  LoadCrashReporterSupport_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  if (!LoadCrashReporterSupport_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadCrashReporterSupport_block_invoke_cold_1();
  }
}

uint64_t initSimulateCrash(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = LoadCrashReporterSupport_loadPredicate;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&LoadCrashReporterSupport_loadPredicate, &__block_literal_global_13);
  }
  softLinkSimulateCrash[0] = (uint64_t (*)())dlsym((void *)LoadCrashReporterSupport_frameworkLibrary, "SimulateCrash");
  uint64_t v7 = ((uint64_t (*)(uint64_t, uint64_t, id))softLinkSimulateCrash[0])(a1, a2, v6);

  return v7;
}

void sub_1909466F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190947038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19094723C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ACAccountStoreFunction()
{
  return (id)classACAccountStore;
}

id sIsDirectoryByResourceKey_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = 0;
  uint64_t v2 = *MEMORY[0x1E4F1C628];
  id v8 = 0;
  int v3 = [a2 getResourceValue:&v9 forKey:v2 error:&v8];
  uint64_t v4 = v9;
  id v5 = v8;
  if (v3) {
    +[CNResult successWithValue:v4];
  }
  else {
  id v6 = +[CNResult failureWithError:v5];
  }

  return v6;
}

id sIsDirectoryByStat_block_invoke_2(uint64_t a1, void *a2)
{
  unsigned __int8 v9 = 0;
  id v2 = a2;
  int v3 = +[CNEnvironmentBase currentEnvironment];
  uint64_t v4 = [v3 fileManager];
  int v5 = [v4 fileExistsAtURL:v2 isDirectory:&v9];

  if (v5)
  {
    id v6 = [NSNumber numberWithBool:v9];
    uint64_t v7 = +[CNResult successWithValue:v6];
  }
  else
  {
    uint64_t v7 = +[CNResult failureWithError:0];
  }

  return v7;
}

uint64_t sIsDirectoryByStat_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = sIsDirectoryByResourceKey_block_invoke((uint64_t)v2, v2);
  if ([v3 isFailure])
  {
    uint64_t v4 = [v3 error];
    BOOL v5 = +[CNFoundationError isFileNotFoundError:v4];

    if (v5)
    {
      uint64_t v7 = sIsDirectoryByStat_block_invoke_2(v6, v2);

      int v3 = (void *)v7;
    }
  }
  if ([v3 isSuccess])
  {
    id v8 = [v3 value];
    uint64_t v9 = [v8 BOOLValue];
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.contacts", "filesystem");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sIsDirectoryByStat_block_invoke_3_cold_1((uint64_t)v2, v3);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t sIsDirectory_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = sIsDirectoryByResourceKey_block_invoke((uint64_t)v2, v2);
  if ([v3 isFailure])
  {
    uint64_t v4 = [v3 error];
    BOOL v5 = +[CNFoundationError isFileNotFoundError:v4];

    if (v5)
    {
      uint64_t v7 = sIsDirectoryByStat_block_invoke_2(v6, v2);

      int v3 = (void *)v7;
    }
  }
  if ([v3 isSuccess])
  {
    id v8 = [v3 value];
    uint64_t v9 = [v8 BOOLValue] ^ 1;
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.contacts", "filesystem");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sIsDirectoryByStat_block_invoke_3_cold_1((uint64_t)v2, v3);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id MCProfileConnectionFunction()
{
  return (id)classMCProfileConnection;
}

void sub_1909489F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190948B04(_Unwind_Exception *exception_object)
{
}

void sub_190948C1C(_Unwind_Exception *exception_object)
{
}

id CNSubstringRangesContainingEmojiInString(void *a1)
{
  id v1 = a1;
  if (CNStringContainsEmojiCharacters(v1))
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    uint64_t v10 = __Block_byref_object_copy__3;
    unint64_t v11 = __Block_byref_object_dispose__3;
    id v12 = [MEMORY[0x1E4F1CA48] array];
    id v2 = (void (*)(uint64_t, uint64_t, uint64_t, void *))softLinkCEMEnumerateEmojiTokensInStringWithBlock[0];
    uint64_t v3 = [v1 length];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __CNSubstringRangesContainingEmojiInString_block_invoke;
    v6[3] = &unk_1E569FEA0;
    v6[4] = &v7;
    v2((uint64_t)v1, 0, v3, v6);
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

void sub_190949A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __CNSubstringRangesContainingEmojiInString_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 0x7FFFFFFFFFFFFFFFLL && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v6 addObject:v7];
  }
}

uint64_t CNIsChineseString(void *a1)
{
  id v1 = a1;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v1))
  {
    uint64_t v2 = 0;
  }
  else
  {
    if (CNChineseCharacterUSet_onceToken != -1) {
      dispatch_once(&CNChineseCharacterUSet_onceToken, &__block_literal_global_38);
    }
    uint64_t v2 = CNContentsExclusivelyInCharacterSet(v1, CNChineseCharacterUSet_set);
  }

  return v2;
}

uint64_t CNIsArabicString(void *a1)
{
  id v1 = a1;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v1))
  {
    uint64_t v2 = 0;
  }
  else
  {
    if (CNArabicCharacterUSet_onceToken != -1) {
      dispatch_once(&CNArabicCharacterUSet_onceToken, &__block_literal_global_40);
    }
    uint64_t v2 = CNContentsExclusivelyInCharacterSet(v1, CNArabicCharacterUSet_set);
  }

  return v2;
}

uint64_t CNStringContainsChineseJapaneseKoreanCharacters(void *a1)
{
  id v1 = a1;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v1))
  {
    uint64_t v2 = 0;
  }
  else
  {
    if (CNChineseJapaneseKoreanCharacterUSet_onceToken != -1) {
      dispatch_once(&CNChineseJapaneseKoreanCharacterUSet_onceToken, &__block_literal_global_44);
    }
    uint64_t v3 = CNChineseJapaneseKoreanCharacterUSet_set;
    id v4 = v1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    uint64_t v9 = __CNStringContainsAnyCharactersFromUSet_block_invoke;
    uint64_t v10 = &__block_descriptor_40_e13_C20__0r_S8i16l;
    uint64_t v11 = v3;
    BOOL v5 = v8;
    if ((BOOL)off_1EE025420((uint64_t)&__block_literal_global_119, v4))
    {
      uint64_t v2 = ((unsigned int (*)(void *, void, void))v9)(v5, 0, 0) != 0;
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __CNStringEvaluateWithUCharTest_block_invoke;
      v12[3] = &unk_1E569FF08;
      uint64_t v13 = v5;
      uint64_t v6 = objc_msgSend(v4, "_cn_resultWithAllCharacters:", v12);
      uint64_t v2 = [v6 BOOLValue];
    }
  }

  return v2;
}

uint64_t CNStringContainsKoreanCharacters(void *a1)
{
  uint64_t v1 = CNInvertedHangulCharacterUSet_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&CNInvertedHangulCharacterUSet_onceToken, &__block_literal_global_46);
  }
  int v3 = CNContentsExclusivelyInCharacterSet(v2, CNInvertedHangulCharacterUSet_set);

  return v3 ^ 1u;
}

void initCEMEnumerateEmojiTokensInStringWithBlock(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = LoadCoreEmoji_loadPredicate;
  id v8 = a4;
  if (v7 != -1) {
    dispatch_once(&LoadCoreEmoji_loadPredicate, &__block_literal_global_16);
  }
  softLinkCEMEnumerateEmojiTokensInStringWithBlock[0] = (uint64_t (*)())dlsym((void *)LoadCoreEmoji_frameworkLibrary, "CEMEnumerateEmojiTokensInStringWithBlock");
  ((void (*)(uint64_t, uint64_t, uint64_t, id))softLinkCEMEnumerateEmojiTokensInStringWithBlock[0])(a1, a2, a3, v8);
}

void __LoadCoreEmoji_block_invoke()
{
  LoadCoreEmoji_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CoreEmoji.framework/CoreEmoji", 1);
  if (!LoadCoreEmoji_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadCoreEmoji_block_invoke_cold_1();
  }
}

uint64_t __CNChineseCharacterUSet_block_invoke()
{
  uint64_t result = CNCopyCharacterUSetWithPattern(@"[:Hani:]");
  CNChineseCharacterUSet_set = result;
  return result;
}

uint64_t __CNArabicCharacterUSet_block_invoke()
{
  uint64_t result = CNCopyCharacterUSetWithPattern(@"[[:Arabic:][:block=ARABIC:]]");
  CNArabicCharacterUSet_set = result;
  return result;
}

BOOL __CNStringContainsAnyCharactersFromUSet_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  BOOL result = 0;
  if (a2)
  {
    if (a3) {
      return (int)MEMORY[0x192FD12E0](*(void *)(a1 + 32)) < a3;
    }
  }
  return result;
}

id __CNStringEvaluateWithUCharTest_block_invoke(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedChar:(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))()];

  return v1;
}

uint64_t __CNChineseJapaneseKoreanCharacterUSet_block_invoke()
{
  uint64_t result = CNCopyCharacterUSetWithPattern(@"[[:Hani:][:Hiragana:][:scx=Kana:][:Bopomofo:][:Hangul:]]");
  CNChineseJapaneseKoreanCharacterUSet_set = result;
  return result;
}

uint64_t __CNInvertedHangulCharacterUSet_block_invoke()
{
  uint64_t result = CNCopyCharacterUSetWithPattern(@"[^[:Hangul:]]");
  CNInvertedHangulCharacterUSet_set = result;
  return result;
}

id sRE(uint64_t a1)
{
  uint64_t v3 = 0;
  uint64_t v1 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:a1 options:1 error:&v3];

  return v1;
}

uint64_t __CNGuardOSLog_block_invoke()
{
  CNGuardOSLog_cn_once_object_0 = (uint64_t)os_log_create("com.apple.contacts", "api");

  return MEMORY[0x1F41817F8]();
}

void sub_19094D694()
{
}

uint64_t CNEitherIsRight_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isRight];
}

uint64_t CNEitherLeft_block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 left];
}

uint64_t CNEitherRight_block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 right];
}

uint64_t __CNGuardOSLog_block_invoke_0()
{
  CNGuardOSLog_cn_once_object_0_0 = (uint64_t)os_log_create("com.apple.contacts", "api");

  return MEMORY[0x1F41817F8]();
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_190950338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1909503F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19095057C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190950658(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190950700(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1909507A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190950834(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1909508DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190950984(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __CNGuardOSLog_block_invoke_1()
{
  CNGuardOSLog_cn_once_object_0_1 = (uint64_t)os_log_create("com.apple.contacts", "api");

  return MEMORY[0x1F41817F8]();
}

uint64_t CNIsAddressingGrammarEmpty_block_invoke(uint64_t a1, void *a2)
{
  if (!a2) {
    return 1;
  }
  id v2 = [a2 pronouns];
  BOOL v3 = off_1EE0248A0((uint64_t)&__block_literal_global_5, v2);

  return v3;
}

id CNContactsFoundationBundle()
{
  if (CNContactsFoundationBundle_onceToken != -1) {
    dispatch_once(&CNContactsFoundationBundle_onceToken, &__block_literal_global_20);
  }
  BOOL v0 = (void *)CNContactsFoundationBundle___bundle;

  return v0;
}

uint64_t __CNContactsFoundationBundle_block_invoke()
{
  CNContactsFoundationBundle___bundle = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AddressBook.ContactsFoundation"];

  return MEMORY[0x1F41817F8]();
}

uint64_t __CNGuardOSLog_block_invoke_2()
{
  CNGuardOSLog_cn_once_object_0_2 = (uint64_t)os_log_create("com.apple.contacts", "api");

  return MEMORY[0x1F41817F8]();
}

uint64_t __CNGuardOSLog_block_invoke_3()
{
  CNGuardOSLog_cn_once_object_0_3 = (uint64_t)os_log_create("com.apple.contacts", "api");

  return MEMORY[0x1F41817F8]();
}

void sub_190956EA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CNObservedResultIsResultFilter_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isResultEvent];
}

uint64_t CNObservedResultValueTransform_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

uint64_t CNPairSecond_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 second];
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return v0;
}

void sub_19095C488(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19095ECF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_19095F144(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19095FB88(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 176));
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_19095FF88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 184));
  _Unwind_Resume(a1);
}

void sub_19096026C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_190960E2C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190961A74(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190962064(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1909629B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

_CNBlockObservable *CNObservableWithBlock(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [[_CNBlockObservable alloc] initWithBlock:v1];

  return v2;
}

_CNScheduledObservable *CNObservableSubscribeOn(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  BOOL v5 = [[_CNScheduledObservable alloc] initWithObservable:v4 scheduler:v3];

  return v5;
}

id CNObservableAllObjects(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(CNPromise);
  BOOL v5 = [(CNPromise *)v4 completionHandlerAdapter];
  uint64_t v6 = +[CNObserver observerWithCompletionHandler:v5];

  id v7 = (id)[v3 subscribe:v6];
  id v8 = [(CNPromise *)v4 future];
  uint64_t v9 = [v8 result:a2];

  return v9;
}

void sub_190963E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19096414C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_190964484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose((const void *)(v26 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t CNCancelableCancel_block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

uint64_t __CNGuardOSLog_block_invoke_4()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "api");
  uint64_t v1 = CNGuardOSLog_cn_once_object_0_4;
  CNGuardOSLog_cn_once_object_0_4 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

Class initFAFetchFamilyCircleRequest()
{
  if (LoadFamilyCircle_loadPredicate != -1) {
    dispatch_once(&LoadFamilyCircle_loadPredicate, &__block_literal_global_43);
  }
  Class result = objc_getClass("FAFetchFamilyCircleRequest");
  classFAFetchFamilyCircleRequest = (uint64_t)result;
  getFAFetchFamilyCircleRequestClass[0] = (uint64_t (*)())FAFetchFamilyCircleRequestFunction;
  return result;
}

id FAFetchFamilyCircleRequestFunction()
{
  return (id)classFAFetchFamilyCircleRequest;
}

void __LoadFamilyCircle_block_invoke()
{
  LoadFamilyCircle_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FamilyCircle.framework/FamilyCircle", 1);
  if (!LoadFamilyCircle_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadFamilyCircle_block_invoke_cold_1();
  }
}

void sub_190966574(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1909666FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190966920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190966D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CNIntFromUVersionInfo(unsigned __int8 *a1)
{
  return (*a1 << 24) | (a1[1] << 16);
}

uint64_t CNGetICUVersion()
{
  *(_DWORD *)UVersionInfo versionArray = 0;
  u_getVersion(versionArray);
  return (versionArray[0] << 24) | (versionArray[1] << 16);
}

void CNGetICUCollatorVersions(_DWORD *a1, _DWORD *a2)
{
  if (CNGetICUCollatorVersions_onceToken == -1)
  {
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&CNGetICUCollatorVersions_onceToken, &__block_literal_global_46);
  if (a2) {
LABEL_3:
  }
    *a2 = CNGetICUCollatorVersions_cachedUCAVersion;
LABEL_4:
  if (a1) {
    *a1 = CNGetICUCollatorVersions_cachedCollatorVersion;
  }
}

void __CNGetICUCollatorVersions_block_invoke()
{
  int v0 = 0;
  if (ucol_open())
  {
    ucol_getVersion();
    ucol_getUCAVersion();
    CNGetICUCollatorVersions_cachedCollatorVersion = 0;
    CNGetICUCollatorVersions_cachedUCAVersion = 0;
    ucol_close();
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __CNGetICUCollatorVersions_block_invoke_cold_1(&v0);
  }
}

uint64_t CNReleaseCollator(uint64_t result)
{
  if (result) {
    return ucol_close();
  }
  return result;
}

void sub_190968B50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190968BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19096966C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1909696F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19096984C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sNoopBlock_block_invoke()
{
  return [MEMORY[0x1E4F1CA98] null];
}

uint64_t __CNGuardOSLog_block_invoke_5()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "api");
  uint64_t v1 = CNGuardOSLog_cn_once_object_0_5;
  CNGuardOSLog_cn_once_object_0_5 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

__CFString *CNSuspendableSchedulerConditionToString(uint64_t a1)
{
  uint64_t v1 = @"CNSuspendableSchedulerConditionBuffering";
  if (a1 == 1) {
    uint64_t v1 = @"CNSuspendableSchedulerConditionDraining";
  }
  if (a1 == 2) {
    return @"CNSuspendableSchedulerConditionRelaying";
  }
  else {
    return v1;
  }
}

void sub_19096DDA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19096E268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19096E4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CNTimestampedValue_block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2_2@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_190971C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  if (v15) {
    objc_end_catch();
  }
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_190971C48(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_begin_catch(a1);
  JUMPOUT(0x190971B90);
}

void sub_190972094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_190972208(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1909722A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t initDiagnosticLogSubmissionEnabled()
{
  if (LoadCrashReporterSupport_loadPredicate_0 != -1) {
    dispatch_once(&LoadCrashReporterSupport_loadPredicate_0, &__block_literal_global_57);
  }
  os_log_t v0 = (uint64_t (*)())dlsym((void *)LoadCrashReporterSupport_frameworkLibrary_0, "DiagnosticLogSubmissionEnabled");
  softLinkDiagnosticLogSubmissionEnabled = v0;

  return v0();
}

void __LoadCrashReporterSupport_block_invoke_0()
{
  LoadCrashReporterSupport_frameworkLibrary_0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 1);
  if (!LoadCrashReporterSupport_frameworkLibrary_0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadCrashReporterSupport_block_invoke_cold_1();
  }
}

id CNSocialProfileServiceUsernameURLTemplate(void *a1)
{
  uint64_t v1 = [a1 uppercaseString];
  uint64_t v2 = [&unk_1EE04A7A8 objectForKey:v1];

  return v2;
}

id CNSocialProfileURLForUsername(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = CNSocialProfileServiceUsernameURLTemplate(a2);
  uint64_t v5 = CNSocialProfileURLFromTemplate(v4, v3);

  return v5;
}

id CNSocialProfileURLFromTemplate(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ((off_1EE025420((uint64_t)&__block_literal_global_119, v3) & 1) != 0
    || (BOOL)off_1EE025420((uint64_t)&__block_literal_global_119, v4))
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    id v7 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v6];

    id v12 = 0;
    id v8 = [NSString stringWithValidatedFormat:v3, @"%@", &v12, v7 validFormatSpecifiers error];
    id v9 = v12;
    if (v9)
    {
      uint64_t v10 = +[CNLogging sdkBreakageLog];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v14 = v3;
        __int16 v15 = 2114;
        id v16 = v4;
        __int16 v17 = 2114;
        id v18 = v9;
        _os_log_error_impl(&dword_19091D000, v10, OS_LOG_TYPE_ERROR, "Error creating social profile URL from template = %{public}@, value = %{public}@, error = %{public}@", buf, 0x20u);
      }
    }
    if ((BOOL)off_1EE025420((uint64_t)&__block_literal_global_119, v8))
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    }
  }

  return v5;
}

id CNSocialProfileURLForUserIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 uppercaseString];
  uint64_t v5 = [&unk_1EE04A7D0 objectForKey:v4];

  uint64_t v6 = CNSocialProfileURLFromTemplate(v5, v3);

  return v6;
}

uint64_t CNFoundationSocialProfileService_block_invoke(uint64_t a1, void *a2)
{
  return [a2 service];
}

uint64_t CNFoundationSocialProfileUsername_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 username];
}

uint64_t CNFoundationSocialProfileUserIdentifier_block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 userIdentifier];
}

uint64_t CNFoundationSocialProfileDisplayName_block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 displayName];
}

uint64_t CNSocialProfileEquivalentValues(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (CNSocialProfileEquivalentOptionalValues(v3, v4))
  {
    id v5 = v3;
    id v6 = v4;
    id v7 = [v5 urlString];
    id v8 = [v6 urlString];

    if (v7 != v8)
    {
      uint64_t v9 = 0;
      if (!v7 || !v8) {
        goto LABEL_18;
      }
      if (([v7 isEqual:v8] & 1) == 0)
      {
        uint64_t v10 = +[CNSocialProfileURLParser parseSocialProfileURL:v7];
        uint64_t v11 = +[CNSocialProfileURLParser parseSocialProfileURL:v8];
        if (CNSocialProfileEquivalentOptionalValues(v10, v11))
        {
          id v12 = [v5 service];
          int v13 = [v12 isEqual:@"LinkedIn"];

          if (v13)
          {
            id v14 = v7;
            id v15 = v8;
            if (objc_msgSend(v14, "_cn_containsSubstring:", @"/pub/")
              && objc_msgSend(v15, "_cn_containsSubstring:", @"/pub/"))
            {
              v20 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
              id v18 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
              uint64_t v19 = [v20 pathComponents];
              __int16 v17 = [v18 pathComponents];
              uint64_t v9 = [v19 isEqual:v17];
            }
            else
            {
              uint64_t v9 = 1;
            }
          }
          else
          {
            uint64_t v9 = 1;
          }
        }
        else
        {
          uint64_t v9 = 0;
        }

        goto LABEL_18;
      }
    }
    uint64_t v9 = 1;
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v9 = 0;
LABEL_19:

  return v9;
}

BOOL CNSocialProfileEquivalentOptionalValues(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = CNSocialProfileEquivalentValue(v3, v4, __block_literal_global_58)
    && CNSocialProfileEquivalentValue(v3, v4, __block_literal_global_73)
    && CNSocialProfileEquivalentValue(v3, v4, __block_literal_global_75)
    && CNSocialProfileEquivalentValue(v3, v4, __block_literal_global_77);

  return v5;
}

id CNSocialProfileStandardServices()
{
  if (CNSocialProfileStandardServices_onceToken != -1) {
    dispatch_once(&CNSocialProfileStandardServices_onceToken, &__block_literal_global_80);
  }
  os_log_t v0 = (void *)CNSocialProfileStandardServices_services;

  return v0;
}

uint64_t __CNSocialProfileStandardServices_block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"Twitter", @"Facebook", @"Flickr", @"LinkedIn", @"MySpace", @"SinaWeibo", @"TencentWeibo", @"Yelp", 0);
  uint64_t v1 = CNSocialProfileStandardServices_services;
  CNSocialProfileStandardServices_services = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t CNSocialProfileIsStandardServiceName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = CNSocialProfileStandardServices();
  uint64_t v3 = [v2 containsObject:v1];

  return v3;
}

BOOL CNSocialProfileEquivalentValue(void *a1, void *a2, void (**a3)(id, id))
{
  BOOL v5 = a3 + 2;
  id v6 = a3[2];
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = v6(v7, a1);
  uint64_t v10 = (*v5)(v7, v8);

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = v11 || [v9 localizedCaseInsensitiveCompare:v10] == 0;

  return v12;
}

void sub_190975218(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190975374(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190975424(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1909758FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,id a25)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a25);
  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

BOOL CNIsDataEmpty_block_invoke(uint64_t a1, void *a2)
{
  return !a2 || [a2 length] == 0;
}

void sub_190977944(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, __CFString *a16, uint64_t a17)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v18 = objc_begin_catch(exception_object);
      uint64_t v19 = objc_msgSend(a12, "os_log");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[CNArchiver decodeObjectOfClass:associatedClasses:data:error:]((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
      }

      a16 = @"exception";
      a17 = (uint64_t)v18;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a17 forKeys:&a16 count:1];
      v27 = +[CNFoundationError errorWithCode:6 userInfo:v26];
      v28 = v27;
      if (v17) {
        void *v17 = v27;
      }

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(exception_object);
    }
    JUMPOUT(0x1909778CCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_190978660(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_190978900(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void CNFutureThrowProtocolExceptionWithReason(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  if (+[CNObservableContractEnforcement shouldEnforceRxProtocols])
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v5 userInfo:v3];
    [v4 raise];
  }
}

id CNPromiseCompletionHandlerWithDefaultValue(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  BOOL v12 = __CNPromiseCompletionHandlerWithDefaultValue_block_invoke;
  int v13 = &unk_1E56A1C40;
  id v14 = v3;
  id v15 = v4;
  id v5 = v4;
  id v6 = v3;
  id v7 = _Block_copy(&v10);
  id v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

id CNPromiseBoolErrorCompletionHandler(void *a1)
{
  id v1 = a1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __CNPromiseBoolErrorCompletionHandler_block_invoke;
  aBlock[3] = &unk_1E56A1C68;
  id v7 = v1;
  id v2 = v1;
  id v3 = _Block_copy(aBlock);
  id v4 = (void *)[v3 copy];

  return v4;
}

id CNPromiseErrorOnlyCompletionHandler(void *a1)
{
  id v1 = a1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __CNPromiseErrorOnlyCompletionHandler_block_invoke;
  aBlock[3] = &unk_1E569FBD8;
  id v7 = v1;
  id v2 = v1;
  id v3 = _Block_copy(aBlock);
  id v4 = (void *)[v3 copy];

  return v4;
}

void __CNPromiseCompletionHandlerWithDefaultValue_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5) {
    [*(id *)(a1 + 32) finishWithError:v5];
  }
  else {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:");
  }
}

void __CNPromiseBoolErrorCompletionHandler_block_invoke(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    [v2 finishWithResult:v4];
  }
  else
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "finishWithError:");
  }
}

void __CNPromiseErrorOnlyCompletionHandler_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 finishWithError:a2];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    [v2 finishWithResult:v4];
  }
}

void sub_19097A9B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19097AA50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CNLargestNumberReducer_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  if ([v5 compare:v4] == -1) {
    id v6 = v4;
  }
  else {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

uint64_t CNFloatingPointNumberSummationReducer_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  double v9 = v8;

  return [v4 numberWithDouble:v7 + v9];
}

id DarwinObservers()
{
  if (DarwinObservers_cn_once_token_0 != -1) {
    dispatch_once(&DarwinObservers_cn_once_token_0, &__block_literal_global_66);
  }
  uint64_t v0 = (void *)DarwinObservers_cn_once_object_0;

  return v0;
}

void _handler(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  id v5 = DarwinObservers();
  id v6 = [v5 objectForKey:v4];

  [v6 observerDidReceiveResult:a3];
}

uint64_t __DarwinObservers_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  uint64_t v1 = DarwinObservers_cn_once_object_0;
  DarwinObservers_cn_once_object_0 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t sAscendingLocation_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 rangeValue];
  unint64_t v6 = [v4 rangeValue];

  uint64_t v7 = -1;
  if (v5 >= v6) {
    uint64_t v7 = 1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

void sub_19097BDD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 152));
  _Unwind_Resume(a1);
}

void sub_19097C088(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19097C4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19097CAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19097CC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19097E364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL sIsNameSuffix_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNNameComponentsStringTokenizer isNameSuffix:a2];
}

BOOL sIsNobiliaryParticle_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[CNNameComponentsStringTokenizer isNobiliaryParticle:a2];
}

id sNormalizeElements_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CA20];
  id v3 = a2;
  uint64_t v4 = [v2 currentLocale];
  unint64_t v5 = [v3 stringByFoldingWithOptions:385 locale:v4];

  return v5;
}

uint64_t sStringIsNotEmpty_block_invoke_4(uint64_t a1, void *a2)
{
  return off_1EE025420((uint64_t)&__block_literal_global_119, a2) ^ 1;
}

uint64_t __CNGuardOSLog_block_invoke_6()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "api");
  uint64_t v1 = CNGuardOSLog_cn_once_object_0_6;
  CNGuardOSLog_cn_once_object_0_6 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

id _block_invoke_0(uint64_t a1, void *a2, void *a3)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v14[0] = v5;
  id v6 = a3;
  uint64_t v7 = [v6 first];
  int v13 = v7;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v14[1] = v8;
  uint64_t v9 = [v6 second];

  v14[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  uint64_t v11 = objc_msgSend(v10, "_cn_flatten");

  return v11;
}

uint64_t ACAccountToType_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 accountType];
}

uint64_t ACAccountIsSyncable_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 accountType];
  id v3 = [v2 syncableDataclasses];
  uint64_t v4 = [v3 containsObject:*MEMORY[0x1E4F17A90]];

  return v4;
}

void *__getCGRectIntegralSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CoreGraphicsLibrary();
  Class result = dlsym(v2, "CGRectIntegral");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCGRectIntegralSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreGraphicsLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreGraphicsLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CoreGraphicsLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E56A2010;
    uint64_t v5 = 0;
    CoreGraphicsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreGraphicsLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!CoreGraphicsLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CoreGraphicsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreGraphicsLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getCGRectGetMidXSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CoreGraphicsLibrary();
  uint64_t result = dlsym(v2, "CGRectGetMidX");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCGRectGetMidXSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCGRectGetMidYSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CoreGraphicsLibrary();
  uint64_t result = dlsym(v2, "CGRectGetMidY");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCGRectGetMidYSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCGRectIntersectionSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CoreGraphicsLibrary();
  uint64_t result = dlsym(v2, "CGRectIntersection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCGRectIntersectionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCGRectEqualToRectSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CoreGraphicsLibrary();
  uint64_t result = dlsym(v2, "CGRectEqualToRect");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCGRectEqualToRectSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id CNEmailAddressExpandAliasedDomains_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNEmailAddressUtilities expandAliasedDomainsInAddress:a2];
}

id CNEmailAddressSanitize_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNEmailAddressSanitizationTask alloc] initWithAddress:v2];

  uint64_t v4 = [(CNEmailAddressSanitizationTask *)v3 run:0];

  return v4;
}

uint64_t CNEmailAddressNormalize_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_stringByNormalizingCase");
}

id CNEmailAddressSafeUserVisible_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[CNEmailAddressUtilities safeUserVisibleEmailAddress:a2];
}

void sub_19098543C(void *a1)
{
}

void sub_190985540(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[CNDescriptionBuilder appendKeys:]((uint64_t)v2);
    }
    objc_end_catch();
    JUMPOUT(0x190985504);
  }
  _Unwind_Resume(a1);
}

id CNIdentity_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

void cn_runWithPropertyLock(uint64_t a1, unint64_t a2, void *a3)
{
  id v3 = (os_unfair_lock_s *)((char *)&sPropertyLocks + 4 * ((a2 >> 5) & 0x7F));
  uint64_t v4 = a3;
  os_unfair_lock_lock(v3);
  v4[2](v4);

  os_unfair_lock_unlock(v3);
}

id cn_objectResultWithPropertyLock(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__11;
  __int16 v17 = __Block_byref_object_dispose__11;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __cn_objectResultWithPropertyLock_block_invoke;
  v10[3] = &unk_1E569F2E8;
  BOOL v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  cn_runWithPropertyLock((uint64_t)v7, a2, v10);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

void sub_190986154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __cn_objectResultWithPropertyLock_block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

id CNFullMethodName(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class();

  id v5 = NSString;
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = 45;
  if ((id)v4 == v3) {
    uint64_t v7 = 43;
  }
  id v8 = [v5 stringWithFormat:@"%c[%@ %@]", v7, v4, v6];

  return v8;
}

id CNUnimplementedMethodException(void *a1, const char *a2)
{
  uint64_t v2 = NSString;
  id v3 = CNFullMethodName(a1, a2);
  uint64_t v4 = [v2 stringWithFormat:@"selector not implemented: %@", v3];

  id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v4 userInfo:0];

  return v5;
}

id CNAbstractMethodException(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = CNFullMethodName(v3, a2);
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = [NSString stringWithFormat:@"%@: must override selector sent to %p", v4, v3];

  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  return v8;
}

id CNInitializerUnavailableException(void *a1, const char *a2, const char *a3)
{
  id v5 = a1;
  uint64_t v6 = CNFullMethodName(v5, a2);
  uint64_t v7 = CNFullMethodName(v5, a3);

  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  uint64_t v10 = [NSString stringWithFormat:@"%@: initializer unavailable; use %@ instead", v6, v7];
  id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];

  return v11;
}

id CNResultWithAutoreleasePool(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x192FD0880]();
  id v3 = v1[2](v1);

  return v3;
}

uint64_t CNObjectEquals_block_invoke_6(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 | a3) {
    return objc_msgSend((id)a2, "isEqual:");
  }
  else {
    return 1;
  }
}

uint64_t CNObjectEquator_block_invoke_7(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 | a3) {
    return objc_msgSend((id)a2, "isEqual:");
  }
  else {
    return 1;
  }
}

id CNAggregateComparator(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x1E4F1C978];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithArray:v2 copyItems:1];

  id v4 = v3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___CNAggregateComparatorFromArray_block_invoke;
  aBlock[3] = &unk_1E56A18C8;
  id v9 = v4;
  id v5 = _Block_copy(aBlock);
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

id _CNAggregateObjectTestFromArray(void *a1)
{
  id v1 = a1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___CNAggregateObjectTestFromArray_block_invoke;
  aBlock[3] = &unk_1E56A1488;
  id v7 = v1;
  id v2 = v1;
  id v3 = _Block_copy(aBlock);
  id v4 = (void *)[v3 copy];

  return v4;
}

id CNAggregateObjectTest(void *a1)
{
  id v1 = a1;
  if ([v1 count] == 1)
  {
    id v2 = [v1 firstObject];
  }
  else
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v1 copyItems:1];
    id v2 = _CNAggregateObjectTestFromArray(v3);
  }

  return v2;
}

id CNLogicalNot(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __CNLogicalNot_block_invoke;
  v5[3] = &unk_1E56A2200;
  id v6 = v1;
  id v2 = v1;
  id v3 = (void *)[v5 copy];

  return v3;
}

uint64_t __CNLogicalNot_block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

id CNMakeErrorHelper(uint64_t a1)
{
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __CNMakeErrorHelper_block_invoke_2;
    aBlock[3] = &__block_descriptor_40_e23_v16__0_____NSError____8l;
    void aBlock[4] = a1;
    id v1 = _Block_copy(aBlock);
  }
  else
  {
    id v1 = &__block_literal_global_77;
  }
  id v2 = (void *)[v1 copy];

  return v2;
}

id __CNMakeErrorHelper_block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  id result = (id)objc_claimAutoreleasedReturnValue();
  **(void **)(a1 + 32) = result;
  return result;
}

CNReaderWriterScheduler *sReaderWriterSchedulerProvider_block_invoke_3()
{
  uint64_t v0 = objc_alloc_init(CNReaderWriterScheduler);

  return v0;
}

void sub_190989A40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_190989F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19098A5B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak((id *)(v9 - 176));
  objc_destroyWeak((id *)(v9 - 168));
  objc_destroyWeak((id *)(v9 - 112));
  _Unwind_Resume(a1);
}

void sub_19098A774(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19098A930(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_19098AA38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id CNUserInfoWithMyProcessInfo()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = objc_msgSend(NSNumber, "numberWithLong:", (int)objc_msgSend(v0, "processIdentifier"));
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:geteuid()];
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [v0 processName];
  id v5 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v1, @"ABSenderProcessID", v4, @"ABSenderProcessName", v2, @"ABSenderProcessName", 0);

  return v5;
}

void sub_19098B11C(void *a1)
{
  objc_begin_catch(a1);
  free(v1);
  objc_exception_rethrow();
}

void sub_19098B130(_Unwind_Exception *a1)
{
}

CNApplicationProxy *CNApplicationProxyFromLSApplicationProxy_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNApplicationProxy alloc] initWithLSApplicationProxy:v2];

  return v3;
}

CNApplicationProxy *CNApplicationProxyFromLSApplicationRecord_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNApplicationProxy alloc] initWithLSApplicationRecord:v2];

  return v3;
}

void *__getdefaultAppRelayTelephonySettingSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __TelephonyUtilitiesLibraryCore_block_invoke;
    void v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E56A2468;
    uint64_t v7 = 0;
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)TelephonyUtilitiesLibraryCore_frameworkLibrary;
    if (TelephonyUtilitiesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)TelephonyUtilitiesLibraryCore_frameworkLibrary;
LABEL_5:
  id result = dlsym(v2, "defaultAppRelayTelephonySetting");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getdefaultAppRelayTelephonySettingSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TelephonyUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TelephonyUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

id IntlUtilityFunction()
{
  return (id)classIntlUtility;
}

void __LoadIntlUtilities_block_invoke()
{
  LoadIntlUtilities_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IntlUtilities.framework/IntlUtilities", 1);
  if (!LoadIntlUtilities_frameworkLibrary && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __LoadIntlUtilities_block_invoke_cold_1();
  }
}

__CFString *CNRangeShortDescription_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = @"∄";
    if (!a3) {
      goto LABEL_12;
    }
    id v5 = NSString;
    long long v6 = [NSNumber numberWithUnsignedInteger:a3];
    [v5 stringWithFormat:@"%@(%@)", @"∄", v6];
  }
  else
  {
    if (a3 == 1)
    {
      uint64_t v8 = NSString;
      long long v6 = [NSNumber numberWithUnsignedInteger:a2];
      uint64_t v20 = v6;
      uint64_t v9 = @"%@";
    }
    else
    {
      if (a3)
      {
        uint64_t v10 = NSString;
        id v11 = [NSNumber numberWithUnsignedInteger:a2];
        long long v6 = [v10 stringWithFormat:@"%@", v11];

        BOOL v12 = NSString;
        uint64_t v13 = [NSNumber numberWithUnsignedInteger:a3 + a2 - 1];
        id v14 = [v12 stringWithFormat:@"%@", v13];

        uint64_t v15 = [v6 commonPrefixWithString:v14 options:0];
        uint64_t v16 = [v15 length];

        __int16 v17 = NSString;
        id v18 = objc_msgSend(v14, "_cn_skip:", v16);
        id v4 = [v17 stringWithFormat:@"%@–%@", v6, v18];

        goto LABEL_11;
      }
      uint64_t v8 = NSString;
      long long v6 = [NSNumber numberWithUnsignedInteger:a2];
      uint64_t v20 = v6;
      uint64_t v21 = @"∅";
      uint64_t v9 = @"%@(%@)";
    }
    objc_msgSend(v8, "stringWithFormat:", v9, v20, v21);
  }
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:

  return v4;
}

void sub_19098E5D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19098ED3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19098EF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19098F104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RunningBoardServicesLibraryCore()
{
  if (!RunningBoardServicesLibraryCore_frameworkLibrary) {
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return RunningBoardServicesLibraryCore_frameworkLibrary;
}

uint64_t __RunningBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RunningBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void __getRBSDomainAttributeClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RBSDomainAttribute");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRBSDomainAttributeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRBSDomainAttributeClass_block_invoke_cold_1();
    RunningBoardServicesLibrary();
  }
}

void RunningBoardServicesLibrary()
{
  if (!RunningBoardServicesLibraryCore())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getRBSAcquisitionCompletionAttributeClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSAcquisitionCompletionAttribute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRBSAcquisitionCompletionAttributeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1();
    return __getRBSAssertionClass_block_invoke(v3);
  }
  return result;
}

Class __getRBSAssertionClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSAssertion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRBSAssertionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getRBSAssertionClass_block_invoke_cold_1();
    return (Class)__getRBSTargetClass_block_invoke(v3);
  }
  return result;
}

Class __getRBSTargetClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSTarget");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRBSTargetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getRBSTargetClass_block_invoke_cold_1();
    return (Class)CNDebugLog(v3);
  }
  return result;
}

void CNDebugLog(NSString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_19099030C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id CNObserverCompletionHandler(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(CNCancelationToken);
  uint64_t v3 = CNObserverCancelableCompletionHandler(v1, v2);

  return v3;
}

id CNObserverCancelableCompletionHandler(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  BOOL v12 = __CNObserverCancelableCompletionHandler_block_invoke;
  uint64_t v13 = &unk_1E56A1C40;
  id v14 = v4;
  id v15 = v3;
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = _Block_copy(&v10);
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

void __CNObserverCancelableCompletionHandler_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __CNObserverCancelableCompletionHandler_block_invoke_cold_4(v8);
    }

    uint64_t v9 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __CNObserverCancelableCompletionHandler_block_invoke_cold_3((uint64_t)v5, v9);
    }

    uint64_t v10 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __CNObserverCancelableCompletionHandler_block_invoke_cold_2((uint64_t)v7, v10);
    }

    uint64_t v11 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CNBehaviorSubject observerDidReceiveResult:](v11);
    }

    v20[0] = CNObserverProtocolExceptionResultKey[0];
    v20[1] = CNObserverProtocolExceptionErrorKey[0];
    v21[0] = v5;
    v21[1] = v7;
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    CNObserverThrowProtocolExceptionWithReason(@"Either the result or the error must be nil", v12);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __CNObserverCancelableCompletionHandler_block_invoke_24;
  v16[3] = &unk_1E569F988;
  id v17 = v5;
  id v18 = v7;
  uint64_t v13 = *(void **)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  id v14 = v7;
  id v15 = v5;
  [v13 performBlock:v16];
}

void CNObserverThrowProtocolExceptionWithReason(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  if (+[CNObservableContractEnforcement shouldEnforceRxProtocols])
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v5 userInfo:v3];
    [v4 raise];
  }
}

uint64_t __CNObserverCancelableCompletionHandler_block_invoke_24(void *a1)
{
  return +[CNObserver sendResult:a1[4] error:a1[5] toObserver:a1[6]];
}

BOOL CNFamilyMemberIsDelegateChild_block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNFamilyMember isDelegateChildFamilyMember:a2];
}

BOOL CNFamilyMemberIsAdministrativeGuardian_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[CNFamilyMember isAdministrativeGuardianFamilyMember:a2];
}

void sub_190990E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id IntlUtilityFunction_0()
{
  return (id)classIntlUtility_0;
}

uint64_t __CNGuardOSLog_block_invoke_7()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "api");
  uint64_t v1 = CNGuardOSLog_cn_once_object_0_7;
  CNGuardOSLog_cn_once_object_0_7 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_190992C68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190992D68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190992F5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190993188(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL CNDispatchSemaphoreWait(void *a1, double a2)
{
  id v3 = a1;
  if (a2 <= 1000000000.0) {
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  }
  else {
    dispatch_time_t v4 = -1;
  }
  BOOL v5 = dispatch_semaphore_wait(v3, v4) == 0;

  return v5;
}

void CNRunWithQueueName(void *a1, void *a2)
{
  id v7 = a1;
  id v3 = a2;
  dispatch_time_t v4 = [MEMORY[0x1E4F28F08] currentQueue];
  BOOL v5 = [v4 name];
  id v6 = (void *)[v5 copy];

  [v4 setName:v7];
  v3[2](v3);
  [v4 setName:v6];
}

void sub_190993328(_Unwind_Exception *a1)
{
}

void sub_190993348(void *a1)
{
}

void sub_19099358C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_CNToStringFromTypeAndValue(const char *a1, NSRange *a2)
{
  if (!strcmp(a1, "{_NSRange=QQ}"))
  {
    NSStringFromRange(*a2);
    dispatch_time_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!strcmp(a1, "@"))
  {
    dispatch_time_t v4 = [(id)a2->location description];
    goto LABEL_18;
  }
  if (!strcmp(a1, "Q"))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", a2->location, v9);
LABEL_17:
    dispatch_time_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!strcmp(a1, "q"))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", a2->location, v9);
    goto LABEL_17;
  }
  if (!strcmp(a1, "d"))
  {
    BOOL v5 = NSString;
    double v10 = *(double *)&a2->location;
    uint64_t v6 = 15;
LABEL_16:
    objc_msgSend(v5, "stringWithFormat:", @"%.*g", v6, *(void *)&v10);
    goto LABEL_17;
  }
  if (!strcmp(a1, "f"))
  {
    BOOL v5 = NSString;
    double v10 = *(float *)&a2->location;
    uint64_t v6 = 6;
    goto LABEL_16;
  }
  if (strcmp(a1, ":"))
  {
    if (!strcmp(a1, "B"))
    {
      if (LOBYTE(a2->location)) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      dispatch_time_t v4 = v8;
      goto LABEL_18;
    }
    [NSString stringWithFormat:@"unknown typeCode: %s, %p", a1, a2];
    goto LABEL_17;
  }
  NSStringFromSelector((SEL)a2->location);
  dispatch_time_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v4;
}

id cn_sprintf(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a1;
  uint64_t v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];

  return v11;
}

void cn_printf(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void cn_vprintf(void *a1, uint64_t a2)
{
}

void cn_vfprintf(FILE *a1, void *a2, uint64_t a3)
{
  BOOL v5 = (objc_class *)NSString;
  id v6 = a2;
  id v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:a3];

  id v8 = v7;
  fputs((const char *)[v8 UTF8String], a1);
}

void cn_fprintf(FILE *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

__CFString *CNEmptyStringIfNil_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2) {
    dispatch_time_t v4 = (__CFString *)v2;
  }
  else {
    dispatch_time_t v4 = &stru_1EE0267A8;
  }

  return v4;
}

id CNNilIfEmptyString_block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t sTrim_block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_trimmedString");
}

id sLongestString_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  unint64_t v6 = [v4 length];
  if (v6 <= [v5 length]) {
    id v7 = v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  return v8;
}

BOOL sIsNotEmpty_block_invoke_7(uint64_t a1, void *a2)
{
  return a2 && [a2 length] != 0;
}

void sub_190994C50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190994CD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190994D50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CNKeychainResult.__allocating_init(value:error:)(uint64_t a1, void *a2)
{
  id v3 = v2;
  unint64_t v6 = (char *)objc_allocWithZone(v3);
  id v7 = &v6[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
  *(_OWORD *)id v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  uint64_t v8 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
  *(void *)&v6[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
  swift_beginAccess();
  uint64_t v9 = v6;
  sub_1909954D0(a1, (uint64_t)v7);
  swift_endAccess();
  id v10 = *(void **)&v6[v8];
  *(void *)&v6[v8] = a2;
  id v11 = a2;

  v14.receiver = v9;
  v14.super_class = v3;
  id v12 = objc_msgSendSuper2(&v14, sel_init);

  sub_190999CD4(a1, &qword_1E92A0D70);
  return v12;
}

id CNKeychainResult.init(value:error:)(uint64_t a1, void *a2)
{
  id v5 = &v2[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  uint64_t v6 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
  *(void *)&v2[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
  swift_beginAccess();
  id v7 = v2;
  sub_1909954D0(a1, (uint64_t)v5);
  swift_endAccess();
  uint64_t v8 = *(void **)&v2[v6];
  *(void *)&v2[v6] = a2;
  id v9 = a2;

  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for CNKeychainResult();
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  sub_190999CD4(a1, &qword_1E92A0D70);
  return v10;
}

uint64_t sub_1909954D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
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

uint64_t type metadata accessor for CNKeychainResult()
{
  return self;
}

void CNKeychainResult.init()()
{
}

id CNKeychainResult.__deallocating_deinit()
{
  return sub_190996DDC(type metadata accessor for CNKeychainResult);
}

void sub_19099566C()
{
  qword_1E92A0CE8 = 0x656C707061;
  *(void *)algn_1E92A0CF0 = 0xE500000000000000;
}

uint64_t sub_19099568C()
{
  uint64_t v0 = sub_1909A4100();
  __swift_allocate_value_buffer(v0, qword_1E92A0D80);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E92A0D80);
  return sub_1909A40F0();
}

unint64_t sub_19099570C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E92A0D58);
  uint64_t v2 = sub_1909A4380();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_19099A3F0(v6, (uint64_t)&v13, &qword_1E92A0D50);
    uint64_t v7 = v13;
    unint64_t result = sub_190996EAC(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_19099A330(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

id sub_19099588C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_1909A4210();
  uint64_t v8 = v7;
  id v9 = a1;
  uint64_t v10 = (void *)a4(v6, v8);

  swift_bridgeObjectRelease();

  return v10;
}

id CNKeychainFacade.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id CNKeychainFacade.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNKeychainFacade();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNKeychainFacade.__deallocating_deinit()
{
  return sub_190996DDC(type metadata accessor for CNKeychainFacade);
}

uint64_t sub_1909959C8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_190995A1C(char *a1, void *a2)
{
  char v2 = *a1;
  id v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  uint64_t result = swift_beginAccess();
  *id v3 = v2;
  return result;
}

uint64_t sub_190995A6C()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_190995AB4(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_190995B00())()
{
  return j__swift_endAccess;
}

id sub_190995B60(uint64_t a1, uint64_t a2)
{
  uint64_t v60 = a2;
  sub_1909A4160();
  ((void (*)(void))MEMORY[0x1F4188790])();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D10);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v6 = (char *)v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)v58 - v7;
  uint64_t v9 = sub_1909A4140();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  id v15 = (char *)v58 - v14;
  uint64_t v16 = (unsigned char *)(v2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  swift_beginAccess();
  if (*v16 == 1)
  {
    uint64_t v17 = v10;
    uint64_t v18 = v60;
    v58[0] = v15;
    id v19 = (uint64_t *)(v2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keyDict);
    swift_beginAccess();
    uint64_t v20 = *v19;
    uint64_t v21 = *(void *)(*v19 + 16);
    uint64_t v59 = a1;
    v58[1] = v19;
    if (v21)
    {
      uint64_t v22 = v18;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v23 = sub_190996EF0(a1, v18);
      uint64_t v24 = v13;
      uint64_t v25 = v17;
      uint64_t v26 = v9;
      if (v27)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v25 + 16))(v8, *(void *)(v20 + 56) + *(void *)(v25 + 72) * v23, v9);
        v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
        v28(v8, 0, 1, v26);
      }
      else
      {
        v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
        v28(v8, 1, 1, v26);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v8, 1, v26) != 1)
      {
        uint64_t v49 = v58[0];
        (*(void (**)(void, char *, uint64_t))(v25 + 32))(v58[0], v8, v26);
        *((void *)&v65 + 1) = v26;
        boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v64);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v25 + 16))(boxed_opaque_existential_0, v49, v26);
        v51 = (objc_class *)type metadata accessor for CNKeychainResult();
        v52 = (char *)objc_allocWithZone(v51);
        v53 = &v52[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
        *(_OWORD *)v53 = 0u;
        *((_OWORD *)v53 + 1) = 0u;
        uint64_t v54 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
        *(void *)&v52[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
        swift_beginAccess();
        v55 = v52;
        sub_1909954D0((uint64_t)&v64, (uint64_t)v53);
        swift_endAccess();
        v56 = *(void **)&v52[v54];
        *(void *)&v52[v54] = 0;

        v61.receiver = v55;
        v61.super_class = v51;
        id v38 = objc_msgSendSuper2(&v61, sel_init);
        sub_190999CD4((uint64_t)&v64, &qword_1E92A0D70);
        (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v49, v26);
        return v38;
      }
    }
    else
    {
      uint64_t v39 = v17;
      v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
      uint64_t v26 = v9;
      v28 = v40;
      v40(v8, 1, 1, v26);
      uint64_t v22 = v18;
      uint64_t v24 = v13;
      uint64_t v25 = v39;
    }
    sub_190999CD4((uint64_t)v8, &qword_1E92A0D10);
    sub_1909A4150();
    sub_1909A4130();
    v41 = *(void (**)(char *, char *, uint64_t))(v25 + 16);
    v41(v6, v24, v26);
    v28(v6, 0, 1, v26);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1909961D8((uint64_t)v6, v59, v22);
    swift_endAccess();
    *((void *)&v65 + 1) = v26;
    v42 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v64);
    v41((char *)v42, v24, v26);
    v43 = (objc_class *)type metadata accessor for CNKeychainResult();
    v44 = (char *)objc_allocWithZone(v43);
    v45 = &v44[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)v45 = 0u;
    *((_OWORD *)v45 + 1) = 0u;
    uint64_t v46 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(void *)&v44[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    v47 = v44;
    sub_1909954D0((uint64_t)&v64, (uint64_t)v45);
    swift_endAccess();
    v48 = *(void **)&v44[v46];
    *(void *)&v44[v46] = 0;

    v62.receiver = v47;
    v62.super_class = v43;
    id v38 = objc_msgSendSuper2(&v62, sel_init);
    sub_190999CD4((uint64_t)&v64, &qword_1E92A0D70);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v24, v26);
  }
  else
  {
    sub_190999C80();
    long long v64 = 0u;
    long long v65 = 0u;
    v29 = (void *)swift_allocError();
    *(void *)uint64_t v30 = 0xD000000000000017;
    *(void *)(v30 + 8) = 0x80000001909B5B10;
    *(unsigned char *)(v30 + 16) = 1;
    v31 = (objc_class *)type metadata accessor for CNKeychainResult();
    v32 = (char *)objc_allocWithZone(v31);
    v33 = &v32[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)v33 = 0u;
    *((_OWORD *)v33 + 1) = 0u;
    uint64_t v34 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(void *)&v32[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    v35 = v32;
    sub_1909954D0((uint64_t)&v64, (uint64_t)v33);
    swift_endAccess();
    v36 = *(void **)&v32[v34];
    *(void *)&v32[v34] = v29;
    id v37 = v29;

    v63.receiver = v35;
    v63.super_class = v31;
    id v38 = objc_msgSendSuper2(&v63, sel_init);

    sub_190999CD4((uint64_t)&v64, &qword_1E92A0D70);
  }
  return v38;
}

uint64_t sub_1909961D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D10);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1909A4140();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, 1, v10) == 1)
  {
    sub_190999CD4(a1, &qword_1E92A0D10);
    sub_190997158(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_190999CD4((uint64_t)v9, &qword_1E92A0D10);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v13, a1, v10);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_1909978F8((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v17;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

id sub_1909963CC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D10);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1909A4140();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (unsigned char *)(v2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  swift_beginAccess();
  if (*v12 == 1)
  {
    uint64_t v13 = (uint64_t *)(v2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keyDict);
    swift_beginAccess();
    uint64_t v14 = *v13;
    if (*(void *)(v14 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v15 = sub_190996EF0(a1, a2);
      if (v16)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v7, *(void *)(v14 + 56) + *(void *)(v9 + 72) * v15, v8);
        uint64_t v17 = 0;
      }
      else
      {
        uint64_t v17 = 1;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, v17, 1, v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
        *((void *)&v49 + 1) = v8;
        boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v48);
        (*(void (**)(uint64_t *, char *, uint64_t))(v9 + 16))(boxed_opaque_existential_0, v11, v8);
        uint64_t v39 = (objc_class *)type metadata accessor for CNKeychainResult();
        v40 = (char *)objc_allocWithZone(v39);
        v41 = &v40[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
        *(_OWORD *)v41 = 0u;
        *((_OWORD *)v41 + 1) = 0u;
        uint64_t v42 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
        *(void *)&v40[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
        swift_beginAccess();
        v43 = v40;
        sub_1909954D0((uint64_t)&v48, (uint64_t)v41);
        swift_endAccess();
        v44 = *(void **)&v40[v42];
        *(void *)&v40[v42] = 0;

        v45.receiver = v43;
        v45.super_class = v39;
        id v36 = objc_msgSendSuper2(&v45, sel_init);
        sub_190999CD4((uint64_t)&v48, &qword_1E92A0D70);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        return v36;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    }
    sub_190999CD4((uint64_t)v7, &qword_1E92A0D10);
    sub_190999C80();
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v18 = (void *)swift_allocError();
    *(void *)uint64_t v28 = 0;
    *(void *)(v28 + 8) = 0;
    *(unsigned char *)(v28 + 16) = 3;
    v29 = (objc_class *)type metadata accessor for CNKeychainResult();
    uint64_t v30 = (char *)objc_allocWithZone(v29);
    v31 = &v30[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)v31 = 0u;
    *((_OWORD *)v31 + 1) = 0u;
    uint64_t v32 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(void *)&v30[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    v33 = v30;
    sub_1909954D0((uint64_t)&v48, (uint64_t)v31);
    swift_endAccess();
    uint64_t v34 = *(void **)&v30[v32];
    *(void *)&v30[v32] = v18;
    id v35 = v18;

    v46.receiver = v33;
    v46.super_class = v29;
    id v27 = objc_msgSendSuper2(&v46, sel_init);
  }
  else
  {
    sub_190999C80();
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v18 = (void *)swift_allocError();
    *(void *)uint64_t v19 = 0xD000000000000017;
    *(void *)(v19 + 8) = 0x80000001909B5B10;
    *(unsigned char *)(v19 + 16) = 0;
    uint64_t v20 = (objc_class *)type metadata accessor for CNKeychainResult();
    uint64_t v21 = (char *)objc_allocWithZone(v20);
    uint64_t v22 = &v21[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)uint64_t v22 = 0u;
    *((_OWORD *)v22 + 1) = 0u;
    uint64_t v23 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(void *)&v21[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    uint64_t v24 = v21;
    sub_1909954D0((uint64_t)&v48, (uint64_t)v22);
    swift_endAccess();
    uint64_t v25 = *(void **)&v21[v23];
    *(void *)&v21[v23] = v18;
    id v26 = v18;

    v47.receiver = v24;
    v47.super_class = v20;
    id v27 = objc_msgSendSuper2(&v47, sel_init);
  }
  id v36 = v27;

  sub_190999CD4((uint64_t)&v48, &qword_1E92A0D70);
  return v36;
}

id sub_1909968D8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D10);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (unsigned char *)(v2 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
  swift_beginAccess();
  if (*v8 == 1)
  {
    swift_beginAccess();
    sub_190997158(a1, a2, (uint64_t)v7);
    swift_endAccess();
    uint64_t v9 = sub_1909A4140();
    int v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v7, 1, v9);
    sub_190999CD4((uint64_t)v7, &qword_1E92A0D10);
    if (v10 != 1)
    {
      *((void *)&v42 + 1) = MEMORY[0x1E4FBB390];
      LOBYTE(v41) = 1;
      uint64_t v30 = (objc_class *)type metadata accessor for CNKeychainResult();
      v31 = (char *)objc_allocWithZone(v30);
      uint64_t v32 = &v31[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)uint64_t v32 = 0u;
      *((_OWORD *)v32 + 1) = 0u;
      uint64_t v33 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(void *)&v31[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      uint64_t v34 = v31;
      sub_1909954D0((uint64_t)&v41, (uint64_t)v32);
      swift_endAccess();
      id v35 = *(void **)&v31[v33];
      *(void *)&v31[v33] = 0;

      v38.receiver = v34;
      v38.super_class = v30;
      id v29 = objc_msgSendSuper2(&v38, sel_init);
      goto LABEL_7;
    }
    sub_190999C80();
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v11 = (void *)swift_allocError();
    *(void *)uint64_t v12 = 0;
    *(void *)(v12 + 8) = 0;
    *(unsigned char *)(v12 + 16) = 3;
    uint64_t v13 = (objc_class *)type metadata accessor for CNKeychainResult();
    uint64_t v14 = (char *)objc_allocWithZone(v13);
    unint64_t v15 = &v14[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)unint64_t v15 = 0u;
    *((_OWORD *)v15 + 1) = 0u;
    uint64_t v16 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(void *)&v14[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    uint64_t v17 = v14;
    sub_1909954D0((uint64_t)&v41, (uint64_t)v15);
    swift_endAccess();
    uint64_t v18 = *(void **)&v14[v16];
    *(void *)&v14[v16] = v11;
    id v19 = v11;

    v39.receiver = v17;
    v39.super_class = v13;
    id v20 = objc_msgSendSuper2(&v39, sel_init);
  }
  else
  {
    sub_190999C80();
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v11 = (void *)swift_allocError();
    *(void *)uint64_t v21 = 0xD000000000000017;
    *(void *)(v21 + 8) = 0x80000001909B5B10;
    *(unsigned char *)(v21 + 16) = 2;
    uint64_t v22 = (objc_class *)type metadata accessor for CNKeychainResult();
    uint64_t v23 = (char *)objc_allocWithZone(v22);
    uint64_t v24 = &v23[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)uint64_t v24 = 0u;
    *((_OWORD *)v24 + 1) = 0u;
    uint64_t v25 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(void *)&v23[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    id v26 = v23;
    sub_1909954D0((uint64_t)&v41, (uint64_t)v24);
    swift_endAccess();
    id v27 = *(void **)&v23[v25];
    *(void *)&v23[v25] = v11;
    id v28 = v11;

    v40.receiver = v26;
    v40.super_class = v22;
    id v20 = objc_msgSendSuper2(&v40, sel_init);
  }
  id v29 = v20;

LABEL_7:
  sub_190999CD4((uint64_t)&v41, &qword_1E92A0D70);
  return v29;
}

id sub_190996C90(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_1909A4210();
  uint64_t v8 = v7;
  id v9 = a1;
  int v10 = (void *)a4(v6, v8);

  swift_bridgeObjectRelease();

  return v10;
}

id CNKeychainFacadeTestDouble.init()()
{
  v0[OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled] = 1;
  *(void *)&v0[OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keyDict] = MEMORY[0x1E4FBC868];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNKeychainFacadeTestDouble();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNKeychainFacadeTestDouble.__deallocating_deinit()
{
  return sub_190996DDC(type metadata accessor for CNKeychainFacadeTestDouble);
}

id sub_190996DDC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_190996E24(UInt8 *bytes@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (bytes) {
    CFIndex v4 = a2 - (void)bytes;
  }
  else {
    CFIndex v4 = 0;
  }
  CFDataRef v5 = CFDataCreateWithBytesNoCopy(0, bytes, v4, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (v5)
  {
    CFDataRef v6 = v5;
    uint64_t v7 = sub_1909A4020();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0xC000000000000000;
  }
  *a3 = v7;
  a3[1] = v9;
}

unint64_t sub_190996EAC(uint64_t a1)
{
  uint64_t v2 = sub_1909A42B0();

  return sub_190996F68(a1, v2);
}

unint64_t sub_190996EF0(uint64_t a1, uint64_t a2)
{
  sub_1909A4420();
  sub_1909A4230();
  uint64_t v4 = sub_1909A4430();

  return sub_190997074(a1, a2, v4);
}

unint64_t sub_190996F68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_19099A254();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_1909A42C0();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_1909A42C0();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_190997074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1909A43C0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1909A43C0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_190997158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_190996EF0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_190997B28();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_1909A4140();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_1909976E8(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_1909A4140();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_190997300(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_1909A4140();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x1F4188790]();
  long long v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E92A2480);
  int v47 = a2;
  uint64_t v8 = sub_1909A4370();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  long long v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  objc_super v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  BOOL v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    uint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    id v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_1909A4420();
    sub_1909A4230();
    uint64_t result = sub_1909A4430();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    id v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    void *v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

unint64_t sub_1909976E8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1909A4310();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_1909A4420();
        swift_bridgeObjectRetain();
        sub_1909A4230();
        uint64_t v9 = sub_1909A4430();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          _OWORD *v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_1909A4140() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  uint64_t *v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1909978F8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_190996EF0(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_190997B28();
      goto LABEL_7;
    }
    sub_190997300(v15, a4 & 1);
    unint64_t v26 = sub_190996EF0(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_1909A43D0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_1909A4140();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_190997A78(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_190997A78(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_1909A4140();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_190997B28()
{
  uint64_t v35 = sub_1909A4140();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x1F4188790]();
  int64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E92A2480);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_1909A4360();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    uint64_t *v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    uint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    void *v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

id sub_190997DEC(uint64_t a1, unint64_t a2)
{
  v124[45] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  uint64_t v4 = sub_1909A4140();
  uint64_t v112 = *(void *)(v4 - 8);
  uint64_t v113 = v4;
  MEMORY[0x1F4188790]();
  v111 = (char *)&v110 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D68);
  uint64_t inited = swift_initStackObject();
  uint64_t v7 = (void **)MEMORY[0x1E4F3B978];
  *(_OWORD *)(inited + 16) = xmmword_1909B63A0;
  unint64_t v8 = *v7;
  *(void *)(inited + 32) = *v7;
  unint64_t v9 = (void *)*MEMORY[0x1E4F3B9A0];
  type metadata accessor for CFString();
  *(void *)(inited + 40) = v9;
  int64_t v10 = (void *)*MEMORY[0x1E4F3B5D0];
  uint64_t v116 = v11;
  *(void *)(inited + 64) = v11;
  *(void *)(inited + 72) = v10;
  uint64_t v12 = MEMORY[0x1E4FBB1A0];
  unint64_t v13 = (void **)MEMORY[0x1E4F3B550];
  uint64_t v114 = a1;
  *(void *)(inited + 80) = a1;
  *(void *)(inited + 88) = a2;
  uint64_t v14 = *v13;
  *(void *)(inited + 104) = v12;
  *(void *)(inited + 112) = v14;
  uint64_t v15 = qword_1E92A0D00;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  swift_bridgeObjectRetain();
  id v19 = v14;
  if (v15 != -1) {
    swift_once();
  }
  unint64_t v115 = a2;
  uint64_t v20 = qword_1E92A0CE8;
  uint64_t v21 = *(void *)algn_1E92A0CF0;
  *(void *)(inited + 144) = v12;
  *(void *)(inited + 120) = v20;
  *(void *)(inited + 128) = v21;
  uint64_t v22 = (void *)*MEMORY[0x1E4F3B870];
  if (!*MEMORY[0x1E4F3B870]) {
    __break(1u);
  }
  *(void *)(inited + 152) = v22;
  uint64_t v23 = (void *)*MEMORY[0x1E4F3B8D8];
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D30);
  unint64_t v25 = (void **)MEMORY[0x1E4F3BD08];
  *(void *)(inited + 160) = v23;
  int64_t v26 = *v25;
  *(void *)(inited + 184) = v24;
  *(void *)(inited + 192) = v26;
  uint64_t v27 = MEMORY[0x1E4FBB390];
  *(unsigned char *)(inited + 200) = 1;
  uint64_t v28 = (void *)*MEMORY[0x1E4F3B878];
  *(void *)(inited + 224) = v27;
  *(void *)(inited + 232) = v28;
  *(unsigned char *)(inited + 240) = 1;
  uint64_t v29 = (void *)*MEMORY[0x1E4F3B558];
  *(void *)(inited + 264) = v27;
  *(void *)(inited + 272) = v29;
  uint64_t v30 = (void *)*MEMORY[0x1E4F3B5B0];
  uint64_t v31 = (void **)MEMORY[0x1E4F3BC70];
  *(void *)(inited + 280) = *MEMORY[0x1E4F3B5B0];
  int64_t v32 = *v31;
  *(void *)(inited + 304) = v116;
  *(void *)(inited + 312) = v32;
  *(void *)(inited + 344) = v27;
  *(unsigned char *)(inited + 320) = 1;
  id v33 = v23;
  id v34 = v26;
  id v35 = v28;
  id v36 = v29;
  id v37 = v30;
  id v38 = v32;
  swift_bridgeObjectRetain();
  id v39 = v22;
  sub_19099570C(inited);
  v124[0] = 0;
  sub_19099A254();
  sub_19099A454((unint64_t *)&unk_1E92A0D40, (void (*)(uint64_t))sub_19099A254);
  CFDictionaryRef v40 = (const __CFDictionary *)sub_1909A41E0();
  swift_bridgeObjectRelease();
  OSStatus v41 = SecItemCopyMatching(v40, v124);

  if (v41)
  {
    unint64_t v42 = v115;
    if (v41 == -25300)
    {
      if (qword_1E92A0D98 != -1) {
        swift_once();
      }
      uint64_t v43 = sub_1909A4100();
      __swift_project_value_buffer(v43, (uint64_t)qword_1E92A0D80);
      swift_bridgeObjectRetain_n();
      v44 = sub_1909A40E0();
      os_log_type_t v45 = sub_1909A4260();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = (uint8_t *)swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        *(void *)&long long v122 = v47;
        *(_DWORD *)uint64_t v46 = 136315138;
        swift_bridgeObjectRetain();
        CFTypeRef v121 = (CFTypeRef)sub_19099C35C(v114, v42, (uint64_t *)&v122);
        sub_1909A42E0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_19091D000, v44, v45, "Existing encryption key with label %s not found", v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x192FD1040](v47, -1, -1);
        MEMORY[0x192FD1040](v46, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_190999C80();
      long long v122 = 0u;
      long long v123 = 0u;
      v76 = (void *)swift_allocError();
      *(void *)uint64_t v77 = 0;
      *(void *)(v77 + 8) = 0;
      *(unsigned char *)(v77 + 16) = 3;
      v78 = (objc_class *)type metadata accessor for CNKeychainResult();
      v79 = (char *)objc_allocWithZone(v78);
      v80 = &v79[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)v80 = 0u;
      *((_OWORD *)v80 + 1) = 0u;
      uint64_t v81 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(void *)&v79[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      v82 = v79;
      sub_1909954D0((uint64_t)&v122, (uint64_t)v80);
      swift_endAccess();
      v83 = *(void **)&v79[v81];
      *(void *)&v79[v81] = v76;
      id v84 = v76;

      v117.receiver = v82;
      v117.super_class = v78;
      id v85 = objc_msgSendSuper2(&v117, sel_init);
    }
    else
    {
      if (qword_1E92A0D98 != -1) {
        swift_once();
      }
      uint64_t v61 = sub_1909A4100();
      __swift_project_value_buffer(v61, (uint64_t)qword_1E92A0D80);
      swift_bridgeObjectRetain_n();
      objc_super v62 = sub_1909A40E0();
      os_log_type_t v63 = sub_1909A4270();
      if (os_log_type_enabled(v62, v63))
      {
        uint64_t v64 = swift_slowAlloc();
        uint64_t v65 = swift_slowAlloc();
        *(void *)&long long v122 = v65;
        *(_DWORD *)uint64_t v64 = 136315394;
        swift_bridgeObjectRetain();
        CFTypeRef v121 = (CFTypeRef)sub_19099C35C(v114, v42, (uint64_t *)&v122);
        sub_1909A42E0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v64 + 12) = 2080;
        CFStringRef v66 = SecCopyErrorMessageString(v41, 0);
        if (v66)
        {
          v67 = (__CFString *)v66;
          uint64_t v68 = sub_1909A4210();
          unint64_t v70 = v69;
        }
        else
        {
          LODWORD(v121) = v41;
          uint64_t v68 = sub_1909A43A0();
          unint64_t v70 = v94;
        }
        CFTypeRef v121 = (CFTypeRef)sub_19099C35C(v68, v70, (uint64_t *)&v122);
        sub_1909A42E0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_19091D000, v62, v63, "Error getting encryption key with label %s: %s", (uint8_t *)v64, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x192FD1040](v65, -1, -1);
        MEMORY[0x192FD1040](v64, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      long long v122 = 0u;
      long long v123 = 0u;
      CFStringRef v95 = SecCopyErrorMessageString(v41, 0);
      if (v95)
      {
        v96 = (__CFString *)v95;
        uint64_t v97 = sub_1909A4210();
        uint64_t v99 = v98;
      }
      else
      {
        LODWORD(v121) = v41;
        uint64_t v97 = sub_1909A43A0();
        uint64_t v99 = v100;
      }
      sub_190999C80();
      v76 = (void *)swift_allocError();
      *(void *)uint64_t v101 = v97;
      *(void *)(v101 + 8) = v99;
      *(unsigned char *)(v101 + 16) = 0;
      v102 = (objc_class *)type metadata accessor for CNKeychainResult();
      v103 = (char *)objc_allocWithZone(v102);
      v104 = &v103[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)v104 = 0u;
      *((_OWORD *)v104 + 1) = 0u;
      uint64_t v105 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(void *)&v103[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      v106 = v103;
      sub_1909954D0((uint64_t)&v122, (uint64_t)v104);
      swift_endAccess();
      v107 = *(void **)&v103[v105];
      *(void *)&v103[v105] = v76;
      id v108 = v76;

      v120.receiver = v106;
      v120.super_class = v102;
      id v85 = objc_msgSendSuper2(&v120, sel_init);
    }
LABEL_33:
    id v60 = v85;

    sub_190999CD4((uint64_t)&v122, &qword_1E92A0D70);
    goto LABEL_34;
  }
  unint64_t v48 = v115;
  if (!v124[0] || (CFTypeRef v121 = v124[0], swift_unknownObjectRetain(), (swift_dynamicCast() & 1) == 0))
  {
    if (qword_1E92A0D98 != -1) {
      swift_once();
    }
    uint64_t v71 = sub_1909A4100();
    __swift_project_value_buffer(v71, (uint64_t)qword_1E92A0D80);
    swift_bridgeObjectRetain_n();
    v72 = sub_1909A40E0();
    os_log_type_t v73 = sub_1909A4270();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      uint64_t v75 = swift_slowAlloc();
      *(void *)&long long v122 = v75;
      *(_DWORD *)v74 = 136315138;
      swift_bridgeObjectRetain();
      CFTypeRef v121 = (CFTypeRef)sub_19099C35C(v114, v48, (uint64_t *)&v122);
      sub_1909A42E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_19091D000, v72, v73, "Search result for existing encryption key with label %s was not data", v74, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x192FD1040](v75, -1, -1);
      MEMORY[0x192FD1040](v74, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_190999C80();
    long long v122 = 0u;
    long long v123 = 0u;
    v76 = (void *)swift_allocError();
    *(_OWORD *)uint64_t v86 = xmmword_1909B63B0;
    *(unsigned char *)(v86 + 16) = 3;
    v87 = (objc_class *)type metadata accessor for CNKeychainResult();
    v88 = (char *)objc_allocWithZone(v87);
    v89 = &v88[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
    *(_OWORD *)v89 = 0u;
    *((_OWORD *)v89 + 1) = 0u;
    uint64_t v90 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
    *(void *)&v88[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
    swift_beginAccess();
    v91 = v88;
    sub_1909954D0((uint64_t)&v122, (uint64_t)v89);
    swift_endAccess();
    v92 = *(void **)&v88[v90];
    *(void *)&v88[v90] = v76;
    id v93 = v76;

    v119.receiver = v91;
    v119.super_class = v87;
    id v85 = objc_msgSendSuper2(&v119, sel_init);
    goto LABEL_33;
  }
  unint64_t v49 = *((void *)&v122 + 1);
  uint64_t v116 = v122;
  sub_19099A340(v122, *((unint64_t *)&v122 + 1));
  v50 = v111;
  sub_1909A4120();
  uint64_t v51 = v113;
  *((void *)&v123 + 1) = v113;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v122);
  uint64_t v53 = v112;
  (*(void (**)(uint64_t *, char *, uint64_t))(v112 + 16))(boxed_opaque_existential_0, v50, v51);
  uint64_t v54 = (objc_class *)type metadata accessor for CNKeychainResult();
  v55 = (char *)objc_allocWithZone(v54);
  v56 = &v55[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
  *(_OWORD *)v56 = 0u;
  *((_OWORD *)v56 + 1) = 0u;
  uint64_t v57 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
  *(void *)&v55[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
  swift_beginAccess();
  v58 = v55;
  sub_1909954D0((uint64_t)&v122, (uint64_t)v56);
  swift_endAccess();
  uint64_t v59 = *(void **)&v55[v57];
  *(void *)&v55[v57] = 0;

  v118.receiver = v58;
  v118.super_class = v54;
  id v60 = objc_msgSendSuper2(&v118, sel_init);
  sub_190999CD4((uint64_t)&v122, &qword_1E92A0D70);
  sub_19099A398(v116, v49);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v50, v51);
LABEL_34:
  swift_unknownObjectRelease();
  return v60;
}

char *sub_1909989E0(uint64_t a1, unint64_t a2)
{
  sub_1909A4160();
  MEMORY[0x1F4188790]();
  uint64_t v4 = sub_1909A4140();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = ((char *)v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v8 = (char *)sub_190997DEC(a1, a2);
  uint64_t v9 = (uint64_t)&v8[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
  swift_beginAccess();
  sub_19099A3F0(v9, (uint64_t)&v120, &qword_1E92A0D70);
  uint64_t v10 = *((void *)&v121 + 1);
  sub_190999CD4((uint64_t)&v120, &qword_1E92A0D70);
  if (v10) {
    return v8;
  }
  uint64_t v12 = *(void **)&v8[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error];
  if (!v12) {
    return v8;
  }
  uint64_t v119 = *(void *)&v8[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error];
  id v13 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0DB8);
  if (!swift_dynamicCast()) {
    return v8;
  }
  uint64_t v116 = v7;
  uint64_t v14 = v120;
  unsigned __int8 v15 = v121;
  if (v121 != 3 || v120 != 0)
  {
    uint64_t v23 = *((void *)&v120 + 1);
    if (qword_1E92A0D98 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_1909A4100();
    __swift_project_value_buffer(v24, (uint64_t)qword_1E92A0D80);
    swift_bridgeObjectRetain();
    sub_190999DBC(v14, v23, v15);
    swift_bridgeObjectRetain();
    sub_190999DBC(v14, v23, v15);
    unint64_t v25 = sub_1909A40E0();
    os_log_type_t v26 = sub_1909A4270();
    uint64_t v116 = v25;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v114 = (void *)swift_slowAlloc();
      uint64_t v115 = swift_slowAlloc();
      *(void *)&long long v120 = v115;
      *(_DWORD *)uint64_t v27 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v119 = sub_19099C35C(a1, a2, (uint64_t *)&v120);
      sub_1909A42E0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v27 + 12) = 2112;
      sub_190999C80();
      swift_allocError();
      *(void *)uint64_t v28 = v14;
      *(void *)(v28 + 8) = v23;
      *(unsigned char *)(v28 + 16) = v15;
      sub_190999DBC(v14, v23, v15);
      uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v119 = v29;
      sub_1909A42E0();
      uint64_t v30 = v114;
      *uint64_t v114 = v29;
      sub_190999DE4(v14, v23, v15);
      sub_190999DE4(v14, v23, v15);
      uint64_t v31 = v116;
      _os_log_impl(&dword_19091D000, v116, v26, "Error checking if encryption key with label %s exists: %@", (uint8_t *)v27, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E92A2490);
      swift_arrayDestroy();
      MEMORY[0x192FD1040](v30, -1, -1);
      uint64_t v32 = v115;
      swift_arrayDestroy();
      MEMORY[0x192FD1040](v32, -1, -1);
      MEMORY[0x192FD1040](v27, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_190999DE4(v14, v23, v15);
      sub_190999DE4(v14, v23, v15);
    }
    sub_190999DE4(v14, v23, v15);
    return v8;
  }
  if (qword_1E92A0D98 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_1909A4100();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1E92A0D80);
  swift_bridgeObjectRetain_n();
  id v18 = sub_1909A40E0();
  os_log_type_t v19 = sub_1909A4260();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v115 = v4;
  uint64_t v112 = v5;
  v109[1] = v17;
  if (v20)
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(void *)&long long v120 = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v114 = v21 + 4;
    swift_bridgeObjectRetain();
    uint64_t v119 = sub_19099C35C(a1, a2, (uint64_t *)&v120);
    sub_1909A42E0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19091D000, v18, v19, "No existing encryption key with label %s found, will create a new one", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x192FD1040](v22, -1, -1);
    MEMORY[0x192FD1040](v21, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1909A4150();
  sub_1909A4130();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D68);
  uint64_t inited = swift_initStackObject();
  id v34 = (void **)MEMORY[0x1E4F3B978];
  *(_OWORD *)(inited + 16) = xmmword_1909B63A0;
  id v35 = *v34;
  *(void *)(inited + 32) = *v34;
  id v36 = (void *)*MEMORY[0x1E4F3B9A0];
  type metadata accessor for CFString();
  *(void *)(inited + 40) = v36;
  id v37 = (void *)*MEMORY[0x1E4F3B5D0];
  uint64_t v114 = v38;
  *(void *)(inited + 64) = v38;
  *(void *)(inited + 72) = v37;
  uint64_t v39 = MEMORY[0x1E4FBB1A0];
  CFDictionaryRef v40 = (void **)MEMORY[0x1E4F3B550];
  *(void *)(inited + 80) = a1;
  *(void *)(inited + 88) = a2;
  OSStatus v41 = *v40;
  *(void *)(inited + 104) = v39;
  *(void *)(inited + 112) = v41;
  uint64_t v42 = qword_1E92A0D00;
  swift_bridgeObjectRetain();
  id v43 = v35;
  id v44 = v36;
  id v45 = v37;
  uint64_t result = v41;
  if (v42 != -1) {
    uint64_t result = (char *)swift_once();
  }
  uint64_t v47 = qword_1E92A0CE8;
  uint64_t v46 = *(void *)algn_1E92A0CF0;
  *(void *)(inited + 144) = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 120) = v47;
  *(void *)(inited + 128) = v46;
  uint64_t v113 = v46;
  unint64_t v48 = (void *)*MEMORY[0x1E4F3B870];
  if (*MEMORY[0x1E4F3B870])
  {
    *(void *)(inited + 152) = v48;
    id v110 = (id)*MEMORY[0x1E4F3B8D8];
    id v49 = v110;
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D30);
    *(void *)(inited + 160) = v49;
    id v111 = (id)*MEMORY[0x1E4F3BD08];
    id v51 = v111;
    *(void *)(inited + 184) = v50;
    *(void *)(inited + 192) = v51;
    uint64_t v52 = MEMORY[0x1E4FBB390];
    *(unsigned char *)(inited + 200) = 1;
    uint64_t v53 = (void *)*MEMORY[0x1E4F3B878];
    *(void *)(inited + 224) = v52;
    *(void *)(inited + 232) = v53;
    *(unsigned char *)(inited + 240) = 1;
    uint64_t v54 = (void *)*MEMORY[0x1E4F3B558];
    *(void *)(inited + 264) = v52;
    *(void *)(inited + 272) = v54;
    v55 = (void *)*MEMORY[0x1E4F3B5B0];
    *(void *)(inited + 280) = *MEMORY[0x1E4F3B5B0];
    v56 = (void *)*MEMORY[0x1E4F3BD38];
    *(void *)(inited + 304) = v114;
    *(void *)(inited + 312) = v56;
    uint64_t v114 = (void *)sub_19099A454((unint64_t *)&unk_1E92A0DA8, MEMORY[0x1E4F25000]);
    swift_bridgeObjectRetain();
    id v57 = v48;
    id v58 = v110;
    id v59 = v111;
    id v60 = v53;
    id v61 = v54;
    id v62 = v55;
    id v63 = v56;
    uint64_t v64 = MEMORY[0x1E4F277C0];
    uint64_t v65 = v115;
    CFStringRef v66 = v116;
    sub_1909A3FE0();
    long long v67 = v120;
    *(void *)(inited + 344) = v64;
    *(_OWORD *)(inited + 320) = v67;
    sub_19099570C(inited);
    sub_19099A254();
    sub_19099A454((unint64_t *)&unk_1E92A0D40, (void (*)(uint64_t))sub_19099A254);
    CFDictionaryRef v68 = (const __CFDictionary *)sub_1909A41E0();
    swift_bridgeObjectRelease();
    OSStatus v69 = SecItemAdd(v68, 0);

    if (v69)
    {
      swift_bridgeObjectRetain_n();
      unint64_t v70 = sub_1909A40E0();
      os_log_type_t v71 = sub_1909A4270();
      p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSXPCListenerDelegate + 24);
      if (os_log_type_enabled(v70, v71))
      {
        os_log_type_t v73 = v71;
        uint64_t v74 = swift_slowAlloc();
        uint64_t v75 = swift_slowAlloc();
        *(void *)&long long v120 = v75;
        *(_DWORD *)uint64_t v74 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v119 = sub_19099C35C(a1, a2, (uint64_t *)&v120);
        sub_1909A42E0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v74 + 12) = 2080;
        CFStringRef v76 = SecCopyErrorMessageString(v69, 0);
        if (v76)
        {
          uint64_t v77 = (__CFString *)v76;
          uint64_t v78 = sub_1909A4210();
          unint64_t v80 = v79;
        }
        else
        {
          LODWORD(v119) = v69;
          uint64_t v78 = sub_1909A43A0();
          unint64_t v80 = v92;
        }
        uint64_t v119 = sub_19099C35C(v78, v80, (uint64_t *)&v120);
        sub_1909A42E0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_19091D000, v70, v73, "Failed to add encryption key with label %s to keychain: %s", (uint8_t *)v74, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x192FD1040](v75, -1, -1);
        MEMORY[0x192FD1040](v74, -1, -1);

        v91 = v116;
        p_inst_meths = &OBJC_PROTOCOL___NSXPCListenerDelegate.inst_meths;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v91 = v116;
      }
      long long v120 = 0u;
      long long v121 = 0u;
      CFStringRef v93 = SecCopyErrorMessageString(v69, 0);
      if (v93)
      {
        unint64_t v94 = (__CFString *)v93;
        uint64_t v95 = sub_1909A4210();
        uint64_t v97 = v96;
      }
      else
      {
        LODWORD(v119) = v69;
        uint64_t v95 = sub_1909A43A0();
        uint64_t v97 = v98;
      }
      sub_190999C80();
      uint64_t v99 = (void *)swift_allocError();
      *(void *)uint64_t v100 = v95;
      *(void *)(v100 + 8) = v97;
      *(unsigned char *)(v100 + 16) = 1;
      uint64_t v101 = (objc_class *)type metadata accessor for CNKeychainResult();
      v102 = (char *)objc_allocWithZone(v101);
      v103 = (_OWORD *)((char *)p_inst_meths[126] + (void)v102);
      _OWORD *v103 = 0u;
      v103[1] = 0u;
      uint64_t v104 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(void *)&v102[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      uint64_t v105 = v102;
      sub_1909954D0((uint64_t)&v120, (uint64_t)v103);
      swift_endAccess();
      v106 = *(void **)&v102[v104];
      *(void *)&v102[v104] = v99;
      id v107 = v99;

      v118.receiver = v105;
      v118.super_class = v101;
      id v108 = objc_msgSendSuper2(&v118, sel_init);

      sub_190999CD4((uint64_t)&v120, &qword_1E92A0D70);
      (*(void (**)(NSObject *, uint64_t))(v112 + 8))(v91, v115);
      return (char *)v108;
    }
    else
    {
      *((void *)&v121 + 1) = v65;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v120);
      uint64_t v82 = v112;
      (*(void (**)(uint64_t *, NSObject *, uint64_t))(v112 + 16))(boxed_opaque_existential_0, v66, v65);
      v83 = (objc_class *)type metadata accessor for CNKeychainResult();
      id v84 = (char *)objc_allocWithZone(v83);
      id v85 = &v84[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)id v85 = 0u;
      *((_OWORD *)v85 + 1) = 0u;
      uint64_t v86 = v65;
      uint64_t v87 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(void *)&v84[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      v88 = v84;
      sub_1909954D0((uint64_t)&v120, (uint64_t)v85);
      swift_endAccess();
      v89 = *(void **)&v84[v87];
      *(void *)&v84[v87] = 0;

      v117.receiver = v88;
      v117.super_class = v83;
      id v90 = objc_msgSendSuper2(&v117, sel_init);
      sub_190999CD4((uint64_t)&v120, &qword_1E92A0D70);

      (*(void (**)(NSObject *, uint64_t))(v82 + 8))(v66, v86);
      return (char *)v90;
    }
  }
  __break(1u);
  return result;
}

id sub_19099968C(uint64_t a1, unint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D68);
  uint64_t inited = swift_initStackObject();
  uint64_t v5 = (void **)MEMORY[0x1E4F3B978];
  *(_OWORD *)(inited + 16) = xmmword_1909B63C0;
  uint64_t v6 = *v5;
  *(void *)(inited + 32) = *v5;
  uint64_t v7 = (void *)*MEMORY[0x1E4F3B9A0];
  type metadata accessor for CFString();
  *(void *)(inited + 40) = v7;
  unint64_t v8 = (void *)*MEMORY[0x1E4F3B5D0];
  *(void *)(inited + 64) = v9;
  *(void *)(inited + 72) = v8;
  uint64_t v10 = MEMORY[0x1E4FBB1A0];
  uint64_t v11 = (void **)MEMORY[0x1E4F3B550];
  *(void *)(inited + 80) = a1;
  *(void *)(inited + 88) = a2;
  uint64_t v12 = *v11;
  *(void *)(inited + 104) = v10;
  *(void *)(inited + 112) = v12;
  uint64_t v13 = qword_1E92A0D00;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  swift_bridgeObjectRetain();
  id result = v12;
  if (v13 != -1) {
    id result = (id)swift_once();
  }
  uint64_t v18 = qword_1E92A0CE8;
  uint64_t v19 = *(void *)algn_1E92A0CF0;
  *(void *)(inited + 144) = v10;
  *(void *)(inited + 120) = v18;
  *(void *)(inited + 128) = v19;
  BOOL v20 = (void *)*MEMORY[0x1E4F3B870];
  if (*MEMORY[0x1E4F3B870])
  {
    *(void *)(inited + 152) = v20;
    uint64_t v21 = (void *)*MEMORY[0x1E4F3B8D8];
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D30);
    *(void *)(inited + 160) = v21;
    uint64_t v23 = (void *)*MEMORY[0x1E4F3BD08];
    *(void *)(inited + 184) = v22;
    *(void *)(inited + 192) = v23;
    uint64_t v24 = MEMORY[0x1E4FBB390];
    unint64_t v25 = (void **)MEMORY[0x1E4F3B878];
    *(unsigned char *)(inited + 200) = 1;
    os_log_type_t v26 = *v25;
    *(void *)(inited + 224) = v24;
    *(void *)(inited + 232) = v26;
    *(void *)(inited + 264) = v24;
    *(unsigned char *)(inited + 240) = 1;
    id v27 = v21;
    id v28 = v23;
    id v29 = v26;
    swift_bridgeObjectRetain();
    id v30 = v20;
    sub_19099570C(inited);
    sub_19099A254();
    sub_19099A454((unint64_t *)&unk_1E92A0D40, (void (*)(uint64_t))sub_19099A254);
    CFDictionaryRef v31 = (const __CFDictionary *)sub_1909A41E0();
    swift_bridgeObjectRelease();
    OSStatus v32 = SecItemDelete(v31);

    if (v32)
    {
      if (qword_1E92A0D98 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_1909A4100();
      __swift_project_value_buffer(v33, (uint64_t)qword_1E92A0D80);
      swift_bridgeObjectRetain_n();
      id v34 = sub_1909A40E0();
      os_log_type_t v35 = sub_1909A4270();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        *(void *)&long long v69 = v37;
        *(_DWORD *)uint64_t v36 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v68 = sub_19099C35C(a1, a2, (uint64_t *)&v69);
        sub_1909A42E0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v36 + 12) = 2080;
        CFStringRef v38 = SecCopyErrorMessageString(v32, 0);
        if (v38)
        {
          uint64_t v39 = (__CFString *)v38;
          uint64_t v40 = sub_1909A4210();
          unint64_t v42 = v41;
        }
        else
        {
          LODWORD(v68) = v32;
          uint64_t v40 = sub_1909A43A0();
          unint64_t v42 = v50;
        }
        uint64_t v68 = sub_19099C35C(v40, v42, (uint64_t *)&v69);
        sub_1909A42E0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_19091D000, v34, v35, "Could not delete encryption key with label %s: %s", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x192FD1040](v37, -1, -1);
        MEMORY[0x192FD1040](v36, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      long long v69 = 0u;
      long long v70 = 0u;
      CFStringRef v51 = SecCopyErrorMessageString(v32, 0);
      if (v51)
      {
        uint64_t v52 = (__CFString *)v51;
        uint64_t v53 = sub_1909A4210();
        uint64_t v55 = v54;
      }
      else
      {
        LODWORD(v68) = v32;
        uint64_t v53 = sub_1909A43A0();
        uint64_t v55 = v56;
      }
      sub_190999C80();
      id v57 = (void *)swift_allocError();
      *(void *)uint64_t v58 = v53;
      *(void *)(v58 + 8) = v55;
      *(unsigned char *)(v58 + 16) = 2;
      id v59 = (objc_class *)type metadata accessor for CNKeychainResult();
      id v60 = (char *)objc_allocWithZone(v59);
      id v61 = &v60[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)id v61 = 0u;
      *((_OWORD *)v61 + 1) = 0u;
      uint64_t v62 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(void *)&v60[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      id v63 = v60;
      sub_1909954D0((uint64_t)&v69, (uint64_t)v61);
      swift_endAccess();
      uint64_t v64 = *(void **)&v60[v62];
      *(void *)&v60[v62] = v57;
      id v65 = v57;

      v67.receiver = v63;
      v67.super_class = v59;
      id v49 = objc_msgSendSuper2(&v67, sel_init);
    }
    else
    {
      *((void *)&v70 + 1) = v24;
      LOBYTE(v69) = 1;
      id v43 = (objc_class *)type metadata accessor for CNKeychainResult();
      id v44 = (char *)objc_allocWithZone(v43);
      id v45 = &v44[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value];
      *(_OWORD *)id v45 = 0u;
      *((_OWORD *)v45 + 1) = 0u;
      uint64_t v46 = OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error;
      *(void *)&v44[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error] = 0;
      swift_beginAccess();
      uint64_t v47 = v44;
      sub_1909954D0((uint64_t)&v69, (uint64_t)v45);
      swift_endAccess();
      unint64_t v48 = *(void **)&v44[v46];
      *(void *)&v44[v46] = 0;

      v66.receiver = v47;
      v66.super_class = v43;
      id v49 = objc_msgSendSuper2(&v66, sel_init);
    }
    sub_190999CD4((uint64_t)&v69, &qword_1E92A0D70);
    return v49;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for CNKeychainFacade()
{
  return self;
}

unint64_t sub_190999C80()
{
  unint64_t result = qword_1E92A0D78;
  if (!qword_1E92A0D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92A0D78);
  }
  return result;
}

uint64_t sub_190999CD4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t type metadata accessor for CNKeychainFacadeTestDouble()
{
  return self;
}

uint64_t sub_190999DBC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for SecKeyError(uint64_t a1)
{
  return sub_190999DE4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_190999DE4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s18ContactsFoundation11SecKeyErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_190999DBC(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SecKeyError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_190999DBC(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_190999DE4(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SecKeyError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_190999DE4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SecKeyError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SecKeyError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_190999F88(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_190999FA4(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SecKeyError()
{
  return &type metadata for SecKeyError;
}

uint64_t method lookup function for CNKeychainResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CNKeychainResult);
}

uint64_t dispatch thunk of CNKeychainResult.__allocating_init(value:error:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t method lookup function for CNKeychainFacade(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CNKeychainFacade);
}

uint64_t dispatch thunk of CNKeychainFacade.createSymmetricKeyIfNeeded(label:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of CNKeychainFacade.existingSymmetricKey(label:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CNKeychainFacade.removeEncryptionKey(label:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t method lookup function for CNKeychainFacadeTestDouble(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CNKeychainFacadeTestDouble);
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.keychainEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.keychainEnabled.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.keychainEnabled.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.createSymmetricKeyIfNeeded(label:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.existingSymmetricKey(label:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CNKeychainFacadeTestDouble.removeEncryptionKey(label:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

void type metadata accessor for CFString()
{
  if (!qword_1E92A0D20)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E92A0D20);
    }
  }
}

unint64_t sub_19099A254()
{
  unint64_t result = qword_1E92A0D38;
  if (!qword_1E92A0D38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E92A0D38);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

_OWORD *sub_19099A330(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_19099A340(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_19099A398(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_19099A3F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_19099A454(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t TriageEvent.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_19099A4E4(&OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_logger, MEMORY[0x1E4FBD360], a1);
}

uint64_t TriageEvent.signposter.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_19099A4E4(&OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signposter, MEMORY[0x1E4FBD330], a1);
}

uint64_t sub_19099A4E4@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3 + *a1;
  uint64_t v6 = a2(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);

  return v7(a3, v5, v6);
}

uint64_t TriageEvent.timeProvider.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t TriageEvent.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TriageEvent.eventName.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_eventName);
}

uint64_t static Logger.generalTriage.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E92A23C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1909A4100();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1E92A2500);
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t TriageEvent.__allocating_init(name:logger:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  TriageEvent.init(name:logger:)(a1, a2, a3, a4);
  return v8;
}

id TriageEvent.init(name:logger:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v40 = a4;
  int v37 = a3;
  uint64_t v35 = a1;
  uint64_t v36 = a2;
  uint64_t v6 = sub_1909A4050();
  uint64_t v41 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v39 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1909A4100();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1909A4080();
  uint64_t v12 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  id v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_timeProvider;
  id v16 = objc_msgSend(self, sel_currentEnvironment);
  id v17 = objc_msgSend(v16, sel_timeProvider);

  *(void *)(v5 + v15) = v17;
  if (qword_1E92A23D0 != -1) {
    swift_once();
  }
  id result = objc_msgSend((id)qword_1E92A2520, sel_lock);
  uint64_t v19 = qword_1E92A2518 + 1;
  if (__OFADD__(qword_1E92A2518, 1))
  {
    __break(1u);
  }
  else
  {
    ++qword_1E92A2518;
    uint64_t v34 = v6;
    BOOL v20 = (uint64_t *)(v5 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_identifier);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A2528);
    uint64_t v21 = swift_allocObject();
    uint64_t v22 = MEMORY[0x1E4FBB550];
    *(_OWORD *)(v21 + 16) = xmmword_1909B6520;
    uint64_t v23 = MEMORY[0x1E4FBB5C8];
    *(void *)(v21 + 56) = v22;
    *(void *)(v21 + 64) = v23;
    *(void *)(v21 + 32) = v19;
    uint64_t v24 = sub_1909A4220();
    uint64_t v26 = v25;
    objc_msgSend((id)qword_1E92A2520, sel_unlock);
    uint64_t *v20 = v24;
    v20[1] = v26;
    *(void *)(v5 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_metadata) = MEMORY[0x1E4FBC860];
    uint64_t v27 = v5 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_start;
    *(void *)uint64_t v27 = 0;
    *(unsigned char *)(v27 + 8) = 1;
    *(void *)(v5 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signpostState) = 0;
    uint64_t v28 = v5 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_eventName;
    uint64_t v29 = v36;
    *(void *)uint64_t v28 = v35;
    *(void *)(v28 + 8) = v29;
    *(unsigned char *)(v28 + 16) = v37;
    id v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    uint64_t v31 = v40;
    v30(v5 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_logger, v40, v8);
    v30((uint64_t)v11, v31, v8);
    sub_1909A4060();
    uint64_t v32 = v38;
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v5 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signposter, v14, v38);
    sub_1909A4070();
    uint64_t v33 = v39;
    sub_1909A4030();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v31, v8);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v32);
    (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v5 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signpostID, v33, v34);
    return (id)v5;
  }
  return result;
}

uint64_t sub_19099AAF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v11 = (void **)(v5 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_metadata);
  swift_beginAccess();
  uint64_t v12 = *v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v11 = v12;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v12 = sub_19099C23C(0, v12[2] + 1, 1, v12);
    *uint64_t v11 = v12;
  }
  unint64_t v15 = v12[2];
  unint64_t v14 = v12[3];
  if (v15 >= v14 >> 1)
  {
    uint64_t v12 = sub_19099C23C((void *)(v14 > 1), v15 + 1, 1, v12);
    *uint64_t v11 = v12;
  }
  v12[2] = v15 + 1;
  id v16 = &v12[5 * v15];
  void v16[4] = a1;
  v16[5] = a2;
  v16[6] = a3;
  v16[7] = a4;
  *((unsigned char *)v16 + 64) = a5 & 1;
  swift_endAccess();
  return swift_retain();
}

void __swiftcall TriageEvent.Metadata.init(label:value:isSensitive:)(ContactsFoundation::TriageEvent::Metadata *__return_ptr retstr, Swift::String label, Swift::String value, Swift::Bool isSensitive)
{
  retstr->label = label;
  retstr->value = value;
  retstr->isSensitive = isSensitive;
}

uint64_t sub_19099AC28(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_19099CC38(a1, a2, a3, a4);

  return swift_retain();
}

void __swiftcall TriageEvent.Metadata.init(label:values:isSensitive:)(ContactsFoundation::TriageEvent::Metadata *__return_ptr retstr, Swift::String label, Swift::OpaquePointer values, Swift::Bool isSensitive)
{
  object = label._object;
  uint64_t countAndFlagsBits = label._countAndFlagsBits;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A2550);
  sub_19099CDE4();
  sub_1909A41F0();
  swift_bridgeObjectRelease();
  sub_1909A4240();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1909A4240();
  swift_bridgeObjectRelease();
  retstr->label._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->label._object = object;
  retstr->value._uint64_t countAndFlagsBits = 8283;
  retstr->value._object = (void *)0xE200000000000000;
  retstr->isSensitive = isSensitive;
}

uint64_t sub_19099AD44(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  int64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = MEMORY[0x1E4FBC860];
  if (v6)
  {
    uint64_t v18 = a2;
    uint64_t v20 = MEMORY[0x1E4FBC860];
    sub_19099C9B4(0, v6, 0);
    uint64_t v9 = a3 + 32;
    uint64_t v7 = v20;
    do
    {
      sub_19099CE88(v9, (uint64_t)v19);
      __swift_project_boxed_opaque_existential_1(v19, v19[3]);
      uint64_t v10 = sub_1909A43A0();
      uint64_t v12 = v11;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_19099C9B4(0, *(void *)(v7 + 16) + 1, 1);
        uint64_t v7 = v20;
      }
      unint64_t v14 = *(void *)(v7 + 16);
      unint64_t v13 = *(void *)(v7 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_19099C9B4(v13 > 1, v14 + 1, 1);
        uint64_t v7 = v20;
      }
      *(void *)(v7 + 16) = v14 + 1;
      uint64_t v15 = v7 + 16 * v14;
      *(void *)(v15 + 32) = v10;
      *(void *)(v15 + 40) = v12;
      v9 += 40;
      --v6;
    }
    while (v6);
    a2 = v18;
  }
  uint64_t v16 = sub_19099CC38(a1, a2, v7, a4 & 1);
  swift_retain();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_19099AEA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1909A4050();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  id v45 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v44 - v6;
  swift_retain_n();
  uint64_t v8 = sub_1909A40E0();
  os_log_type_t v9 = sub_1909A4280();
  BOOL v10 = os_log_type_enabled(v8, v9);
  p_inst_meths = &OBJC_PROTOCOL___NSXPCListenerDelegate.inst_meths;
  uint64_t v47 = v7;
  if (v10)
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v48[0] = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v14 = v3;
    uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_identifier);
    unint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_identifier + 8);
    swift_bridgeObjectRetain();
    uint64_t v50 = sub_19099C35C(v16, v15, v48);
    sub_1909A42E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v17 = sub_1909A4330();
    uint64_t v50 = sub_19099C35C(v17, v18, v48);
    uint64_t v3 = v14;
    p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSXPCListenerDelegate + 24);
    sub_1909A42E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_19091D000, v8, v9, "%s BEGIN %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x192FD1040](v13, -1, -1);
    MEMORY[0x192FD1040](v12, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v19 = (uint64_t *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_metadata);
  swift_beginAccess();
  uint64_t v20 = *v19;
  uint64_t v21 = *(void *)(v20 + 16);
  if (v21)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = (unsigned char *)(v20 + 64);
    do
    {
      uint64_t v23 = *((void *)v22 - 4);
      uint64_t v24 = *((void *)v22 - 3);
      uint64_t v25 = *((void *)v22 - 2);
      uint64_t v26 = *((void *)v22 - 1);
      char v27 = *v22;
      v22 += 40;
      v48[0] = v23;
      v48[1] = v24;
      v48[2] = v25;
      v48[3] = v26;
      char v49 = v27;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_19099B3A0((uint64_t)v48, v1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease();
  }
  uint64_t v28 = (char *)p_inst_meths[363] + v1;
  uint64_t v29 = *(const char **)v28;
  char v30 = v28[16];
  uint64_t v46 = v3;
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v31(v47, v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signpostID, v2);
  uint64_t v32 = sub_1909A4070();
  os_signpost_type_t v33 = sub_1909A42A0();
  uint64_t result = sub_1909A42D0();
  if ((result & 1) == 0) {
    goto LABEL_12;
  }
  if ((v30 & 1) == 0)
  {
    if (!v29)
    {
      __break(1u);
LABEL_12:

      uint64_t v35 = v46;
      uint64_t v36 = v47;
      int v37 = v45;
LABEL_18:
      v31(v37, (uint64_t)v36, v2);
      sub_1909A40C0();
      swift_allocObject();
      uint64_t v41 = sub_1909A40B0();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v2);
      *(void *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signpostState) = v41;
      swift_release();
      uint64_t result = (uint64_t)objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_timeProvider), sel_timestamp);
      uint64_t v42 = v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_start;
      *(void *)uint64_t v42 = v43;
      *(unsigned char *)(v42 + 8) = 0;
      return result;
    }
LABEL_17:
    uint64_t v38 = v45;
    uint64_t v36 = v47;
    v31(v45, (uint64_t)v47, v2);
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v39 = 0;
    os_signpost_id_t v40 = sub_1909A4040();
    _os_signpost_emit_with_name_impl(&dword_19091D000, v32, v33, v40, v29, "", v39, 2u);
    MEMORY[0x192FD1040](v39, -1, -1);

    int v37 = v38;
    uint64_t v35 = v46;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v38, v2);
    goto LABEL_18;
  }
  if ((unint64_t)v29 >> 32)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v29 >> 11 != 27)
  {
    if (v29 >> 16 <= 0x10)
    {
      uint64_t v29 = &v51;
      goto LABEL_17;
    }
    goto LABEL_20;
  }
LABEL_21:
  __break(1u);
  return result;
}

void sub_19099B3A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v3 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  unint64_t v5 = *(void *)(a1 + 24);
  int v7 = *(unsigned __int8 *)(a1 + 32);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  uint64_t v8 = sub_1909A40E0();
  os_log_type_t v9 = sub_1909A4280();
  BOOL v10 = os_log_type_enabled(v8, v9);
  if (v7 == 1)
  {
    if (v10)
    {
      uint64_t v19 = v4;
      uint64_t v11 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v22 = v18;
      *(_DWORD *)uint64_t v11 = 136315651;
      uint64_t v21 = v6;
      uint64_t v12 = *(void *)(a2 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_identifier);
      unint64_t v13 = *(void *)(a2 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_identifier + 8);
      swift_bridgeObjectRetain();
      sub_19099C35C(v12, v13, &v22);
      sub_1909A42E0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_19099C35C(v19, v3, &v22);
      sub_1909A42E0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 22) = 2081;
      swift_bridgeObjectRetain();
      sub_19099C35C(v21, v5, &v22);
      sub_1909A42E0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      os_log_type_t v14 = v9;
      unint64_t v15 = "%s - %s: %{private}s";
LABEL_6:
      _os_log_impl(&dword_19091D000, v8, v14, v15, (uint8_t *)v11, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x192FD1040](v18, -1, -1);
      MEMORY[0x192FD1040](v11, -1, -1);

      return;
    }
  }
  else if (v10)
  {
    uint64_t v20 = v4;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v22 = v18;
    *(_DWORD *)uint64_t v11 = 136315650;
    uint64_t v17 = *(void *)(a2 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_identifier);
    unint64_t v16 = *(void *)(a2 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_identifier + 8);
    swift_bridgeObjectRetain();
    sub_19099C35C(v17, v16, &v22);
    sub_1909A42E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_19099C35C(v20, v3, &v22);
    sub_1909A42E0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_19099C35C(v6, v5, &v22);
    sub_1909A42E0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    os_log_type_t v14 = v9;
    unint64_t v15 = "%s - %s: %s";
    goto LABEL_6;
  }
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_release_n();
}

void sub_19099B788()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1909A4090();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v53 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1909A4050();
  uint64_t v60 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  BOOL v10 = (char *)&v47 - v9;
  uint64_t v11 = sub_1909A4080();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  os_log_type_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_timeProvider), sel_timestamp);
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_start + 8)) {
    goto LABEL_23;
  }
  uint64_t v50 = v3;
  uint64_t v51 = v2;
  uint64_t v61 = v5;
  uint64_t v62 = v10;
  uint64_t v52 = v8;
  unint64_t v16 = (double *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_start);
  id v17 = objc_msgSend(self, sel_stringForTimeInterval_, v15 - *v16);
  uint64_t v18 = sub_1909A4210();
  unint64_t v20 = v19;

  uint64_t v58 = v12;
  uint64_t v59 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signposter, v11);
  if (!*(void *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signpostState))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v21 = *(const char **)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_eventName);
  uint64_t v55 = *(void *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_eventName + 8);
  int v22 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_eventName + 16);
  swift_bridgeObjectRetain_n();
  swift_retain();
  uint64_t v23 = sub_1909A4070();
  uint64_t v24 = v14;
  uint64_t v25 = v62;
  sub_1909A40A0();
  int v49 = sub_1909A4290();
  char v26 = sub_1909A42D0();
  uint64_t v56 = v21;
  uint64_t v57 = v18;
  int v54 = v22;
  if (v26)
  {
    unint64_t v48 = v24;
    if ((v22 & 1) == 0)
    {
      if (v21)
      {
        uint64_t v47 = v21;
LABEL_12:
        swift_retain();
        char v27 = v53;
        sub_1909A40D0();
        swift_release();
        uint64_t v29 = v50;
        uint64_t v28 = v51;
        if ((*(unsigned int (**)(const char *, uint64_t))(v50 + 88))(v27, v51) == *MEMORY[0x1E4FBD340])
        {
          char v30 = 0;
          char v31 = 0;
          uint64_t v53 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(const char *, uint64_t))(v29 + 8))(v27, v28);
          uint64_t v53 = "Time: %s";
          char v31 = 2;
          char v30 = 1;
        }
        uint64_t v32 = v60;
        os_signpost_type_t v33 = v52;
        (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v52, v62, v61);
        uint64_t v34 = swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        uint64_t v64 = v35;
        *(unsigned char *)uint64_t v34 = v31;
        *(unsigned char *)(v34 + 1) = v30;
        *(_WORD *)(v34 + 2) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v63 = sub_19099C35C(v57, v20, &v64);
        sub_1909A42E0();
        swift_bridgeObjectRelease_n();
        os_signpost_id_t v36 = sub_1909A4040();
        _os_signpost_emit_with_name_impl(&dword_19091D000, v23, (os_signpost_type_t)v49, v36, v47, v53, (uint8_t *)v34, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x192FD1040](v35, -1, -1);
        MEMORY[0x192FD1040](v34, -1, -1);
        swift_release();

        int v37 = *(void (**)(char *, uint64_t))(v32 + 8);
        uint64_t v38 = v61;
        v37(v62, v61);
        (*(void (**)(char *, uint64_t))(v58 + 8))(v48, v59);
        v37(v33, v38);
        goto LABEL_16;
      }
LABEL_25:
      swift_bridgeObjectRelease_n();
      __break(1u);
      return;
    }
    if ((unint64_t)v21 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v21 >> 11 == 27)
      {
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      if (v21 >> 16 <= 0x10)
      {
        uint64_t v47 = &v65;
        goto LABEL_12;
      }
    }
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRelease_n();
  swift_release();

  (*(void (**)(char *, uint64_t))(v60 + 8))(v25, v61);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v24, v59);
LABEL_16:
  swift_retain_n();
  swift_bridgeObjectRetain();
  uint64_t v39 = sub_1909A40E0();
  os_log_type_t v40 = sub_1909A4280();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v64 = v42;
    *(_DWORD *)uint64_t v41 = 136315650;
    uint64_t v43 = *(void *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_identifier);
    unint64_t v44 = *(void *)(v1 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_identifier + 8);
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_19099C35C(v43, v44, &v64);
    sub_1909A42E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 12) = 2080;
    uint64_t v45 = sub_1909A4330();
    uint64_t v63 = sub_19099C35C(v45, v46, &v64);
    sub_1909A42E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_19099C35C(v57, v20, &v64);
    sub_1909A42E0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19091D000, v39, v40, "%s END %s (%s)", (uint8_t *)v41, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x192FD1040](v42, -1, -1);
    MEMORY[0x192FD1040](v41, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
}

uint64_t TriageEvent.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_logger;
  uint64_t v2 = sub_1909A4100();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signposter;
  uint64_t v4 = sub_1909A4080();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signpostID;
  uint64_t v6 = sub_1909A4050();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  return v0;
}

uint64_t TriageEvent.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_logger;
  uint64_t v2 = sub_1909A4100();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signposter;
  uint64_t v4 = sub_1909A4080();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_signpostID;
  uint64_t v6 = sub_1909A4050();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  uint64_t v7 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v8 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v7, v8);
}

uint64_t sub_19099C194()
{
  uint64_t v0 = sub_1909A4100();
  __swift_allocate_value_buffer(v0, qword_1E92A2500);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E92A2500);
  return sub_1909A40F0();
}

id sub_19099C208()
{
  id result = objc_msgSend(objc_allocWithZone((Class)CNUnfairLock), sel_init);
  qword_1E92A2520 = (uint64_t)result;
  return result;
}

void *sub_19099C23C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A2588);
      BOOL v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      BOOL v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_19099CB40(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_19099C35C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_19099C430(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_19099D44C((uint64_t)v12, *a3);
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
      sub_19099D44C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_19099C430(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1909A42F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_19099C5EC(a5, a6);
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
  uint64_t v8 = sub_1909A4340();
  if (!v8)
  {
    sub_1909A4350();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1909A4390();
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

uint64_t sub_19099C5EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_19099C684(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_19099C864(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_19099C864(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_19099C684(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_19099C7FC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1909A4320();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1909A4350();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1909A4250();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1909A4390();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1909A4350();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_19099C7FC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A2578);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_19099C864(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A2578);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_1909A4390();
  __break(1u);
  return result;
}

uint64_t sub_19099C9B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_19099C9D4(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_19099C9D4(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A2580);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  os_log_type_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1909A4390();
  __break(1u);
  return result;
}

uint64_t sub_19099CB40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1909A4390();
  __break(1u);
  return result;
}

uint64_t sub_19099CC38(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A2550);
  sub_19099CDE4();
  sub_1909A41F0();
  swift_bridgeObjectRelease();
  sub_1909A4240();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1909A4240();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void **)(v4 + OBJC_IVAR____TtC18ContactsFoundation11TriageEvent_metadata);
  swift_beginAccess();
  uint64_t v10 = *v9;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v9 = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v10 = sub_19099C23C(0, v10[2] + 1, 1, v10);
    *uint64_t v9 = v10;
  }
  unint64_t v13 = v10[2];
  unint64_t v12 = v10[3];
  if (v13 >= v12 >> 1)
  {
    uint64_t v10 = sub_19099C23C((void *)(v12 > 1), v13 + 1, 1, v10);
    *uint64_t v9 = v10;
  }
  v10[2] = v13 + 1;
  os_log_type_t v14 = &v10[5 * v13];
  void v14[4] = a1;
  v14[5] = a2;
  v14[6] = 8283;
  v14[7] = 0xE200000000000000;
  *((unsigned char *)v14 + 64) = a4 & 1;
  swift_endAccess();
  return v5;
}

unint64_t sub_19099CDE4()
{
  unint64_t result = qword_1E92A2558;
  if (!qword_1E92A2558)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92A2550);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92A2558);
  }
  return result;
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

uint64_t sub_19099CE88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_19099CF30()
{
  return type metadata accessor for TriageEvent();
}

uint64_t type metadata accessor for TriageEvent()
{
  uint64_t result = qword_1E92A2568;
  if (!qword_1E92A2568) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_19099CF84()
{
  uint64_t result = sub_1909A4100();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1909A4080();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_1909A4050();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t method lookup function for TriageEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for TriageEvent);
}

uint64_t dispatch thunk of TriageEvent.__allocating_init(name:logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of TriageEvent.metadata(label:value:isSensitive:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of TriageEvent.metadata(label:values:isSensitive:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of TriageEvent.begin()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of TriageEvent.end()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t initializeBufferWithCopyOfBuffer for TriageEvent.Metadata(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TriageEvent.Metadata()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TriageEvent.Metadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TriageEvent.Metadata(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TriageEvent.Metadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for TriageEvent.Metadata(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TriageEvent.Metadata(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TriageEvent.Metadata()
{
  return &type metadata for TriageEvent.Metadata;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_19099D44C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_19099D4AC()
{
  uint64_t v0 = sub_1909A4100();
  __swift_allocate_value_buffer(v0, qword_1E92A2590);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E92A2590);
  return sub_1909A40F0();
}

uint64_t static CNDataEncoder.decode(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1909A3F80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1909A3F20();
  swift_allocObject();
  sub_1909A3F10();
  sub_19099DE5C(&qword_1E92A0CC8);
  sub_1909A3F00();
  swift_release();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(a1, 0, 1, v2);
}

id CNDataEncoder.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id CNDataEncoder.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNDataEncoder();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNDataEncoder.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNDataEncoder();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s18ContactsFoundation13CNDataEncoderC6encodey0B04DataVSgAE13TermOfAddressVFZ_0()
{
  sub_1909A3F50();
  swift_allocObject();
  sub_1909A3F40();
  sub_1909A3F80();
  sub_19099DE5C(&qword_1E92A0CC0);
  uint64_t v0 = sub_1909A3F30();
  swift_release();
  return v0;
}

uint64_t type metadata accessor for CNDataEncoder()
{
  return self;
}

uint64_t method lookup function for CNDataEncoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CNDataEncoder);
}

uint64_t sub_19099DE48(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_19099A398(a1, a2);
  }
  return a1;
}

uint64_t sub_19099DE5C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1909A3F80();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_19099DEA0()
{
  qword_1E92A2B28 = 0x6E6961686379656BLL;
  unk_1E92A2B30 = 0xEF6564616361662DLL;
}

uint64_t sub_19099DF14()
{
  if (qword_1E92A0CE0 != -1) {
    swift_once();
  }
  id v1 = (void *)sub_1909A4200();
  void aBlock[4] = sub_19099E08C;
  void aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19099E108;
  aBlock[3] = &block_descriptor_3;
  objc_super v2 = _Block_copy(aBlock);
  swift_release();
  id v3 = objc_msgSend(v0, sel_valueForKey_onCacheMiss_, v1, v2);

  _Block_release(v2);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
  }
  else
  {
    sub_1909A4300();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D08);
    swift_dynamicCast();
    return v5;
  }
  return result;
}

id sub_19099E08C@<X0>(void *a1@<X8>)
{
  return sub_19099E0BC((uint64_t (*)(void))type metadata accessor for CNKeychainFacade, a1);
}

id sub_19099E0A4@<X0>(void *a1@<X8>)
{
  return sub_19099E0BC((uint64_t (*)(void))type metadata accessor for CNKeychainFacadeTestDouble, a1);
}

id sub_19099E0BC@<X0>(uint64_t (*a1)(void)@<X0>, void *a2@<X8>)
{
  id v3 = (objc_class *)a1(0);
  id result = objc_msgSend(objc_allocWithZone(v3), sel_init);
  a2[3] = v3;
  *a2 = result;
  return result;
}

id sub_19099E108(uint64_t a1)
{
  (*(void (**)(void *__return_ptr))(a1 + 32))(v3);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  id v1 = (void *)sub_1909A43B0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);

  return v1;
}

uint64_t sub_19099E1B8()
{
  if (qword_1E92A0CE0 != -1) {
    swift_once();
  }
  id v1 = (void *)sub_1909A4200();
  void aBlock[4] = sub_19099E0A4;
  void aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19099E108;
  aBlock[3] = &block_descriptor;
  objc_super v2 = _Block_copy(aBlock);
  swift_release();
  id v3 = objc_msgSend(v0, sel_valueForKey_onCacheMiss_, v1, v2);

  _Block_release(v2);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
  }
  else
  {
    sub_1909A4300();
    swift_unknownObjectRelease();
    type metadata accessor for CNKeychainFacadeTestDouble();
    swift_dynamicCast();
    unsigned __int8 v5 = objc_msgSend(v0, sel_isKeychainEnabled);
    unint64_t v6 = (unsigned __int8 *)(v7 + OBJC_IVAR____TtC18ContactsFoundation26CNKeychainFacadeTestDouble_keychainEnabled);
    swift_beginAccess();
    *unint64_t v6 = v5;
    return v7;
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void CNData.synchronousData(withContentsOf:timeout:)(double a1)
{
  id v3 = (void *)sub_1909A3FF0();
  id v4 = objc_msgSend(v1, sel_synchronousDataWithContentsOfURL_timeout_, v3, a1);

  if (objc_msgSend(v4, sel_isSuccess))
  {
    id v5 = objc_msgSend(v4, sel_value);
    if (v5)
    {
      unint64_t v6 = v5;
      sub_1909A4020();

      return;
    }
    __break(1u);
  }
  else if (objc_msgSend(v4, sel_error))
  {
    swift_willThrow();

    return;
  }
  __break(1u);
}

uint64_t sub_19099E54C()
{
  uint64_t v0 = sub_1909A4100();
  __swift_allocate_value_buffer(v0, qword_1E92A25A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E92A25A8);
  return sub_1909A40F0();
}

uint64_t sub_19099E5E8(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x19099E728);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 > 27)
      {
        sub_19099A340(a1, a2);
        sub_19099E918(a1, a2);
        sub_1909A41C0();
        return sub_19099A398(a1, a2);
      }
      else
      {
LABEL_7:
        uint64_t v8 = sub_1909A4110();
        sub_1909A0164();
        swift_allocError();
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, *MEMORY[0x1E4F24F08], v8);
        swift_willThrow();
        return sub_19099A398(a1, a2);
      }
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

id sub_19099E750(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t (*a5)(uint64_t, unint64_t, uint64_t, uint64_t))
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = sub_1909A4020();
  unint64_t v11 = v10;

  uint64_t v12 = sub_1909A4210();
  uint64_t v14 = v13;

  uint64_t v15 = a5(v9, v11, v12, v14);
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  sub_19099A398(v9, v11);
  if (v17 >> 60 == 15)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = (void *)sub_1909A4010();
    sub_19099DE48(v15, v17);
  }

  return v18;
}

id CNDataEncryptor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id CNDataEncryptor.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNDataEncryptor();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CNDataEncryptor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNDataEncryptor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_19099E918(uint64_t a1, unint64_t a2)
{
  v28[5] = *MEMORY[0x1E4F143B8];
  v28[3] = MEMORY[0x1E4F277C0];
  v28[4] = MEMORY[0x1E4F277B0];
  v28[0] = a1;
  v28[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v28, MEMORY[0x1E4F277C0]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      sub_19099A340(a1, a2);
      sub_19099A340(v5, v6);
      id v8 = (unsigned char *)sub_1909A3FA0();
      if (v8)
      {
        uint64_t v9 = sub_1909A3FC0();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = sub_1909A3FB0();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = &v8[v11];
      if (v8) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      sub_19099EBCC(v8, v13, &v27);
      sub_19099A398(v5, v6);
LABEL_27:
      sub_19099A398(a1, a2);
      uint64_t v24 = v27;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      sub_19099A340(a1, a2);
      swift_retain();
      swift_retain();
      unint64_t v16 = (unsigned char *)sub_1909A3FA0();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_1909A3FC0();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_30;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_29;
      }
      uint64_t v20 = sub_1909A3FB0();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      int v22 = &v16[v21];
      if (v16) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 0;
      }
      sub_19099EBCC(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      sub_19099A340(a1, a2);
      id v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      sub_19099A340(a1, a2);
      id v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      sub_19099EBCC(v26, v7, &v27);
      goto LABEL_27;
  }
}

unsigned char *sub_19099EBCC@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_19099F550(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_19099F614((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_19099F690((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t _s18ContactsFoundation15CNDataEncryptorC7encrypt_8keyLabel0B04DataVSgAH_SStFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v42 = a1;
  uint64_t v43 = a2;
  v50[4] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D18);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1909A41D0();
  uint64_t v41 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1909A41A0();
  uint64_t v46 = *(void *)(v12 - 8);
  uint64_t v47 = v12;
  MEMORY[0x1F4188790](v12);
  uint64_t v45 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D10);
  MEMORY[0x1F4188790](v14 - 8);
  unint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1909A4140();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  unint64_t v48 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = objc_msgSend(self, sel_currentEnvironment);
  id v21 = objc_msgSend(v20, sel_keychainFacade);

  uint64_t v44 = a3;
  int v22 = (void *)sub_1909A4200();
  id v23 = objc_msgSend(v21, sel_createSymmetricKeyIfNeededWithLabel_, v22);

  swift_unknownObjectRelease();
  uint64_t v24 = (uint64_t)v23 + OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value;
  swift_beginAccess();
  sub_1909A00FC(v24, (uint64_t)v50);
  if (v50[3])
  {
    int v25 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v16, v25 ^ 1u, 1, v17);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) != 1)
    {
      uint64_t v44 = v9;
      char v26 = v48;
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v48, v16, v17);
      uint64_t v27 = v45;
      sub_1909A4190();
      v50[0] = v42;
      v50[1] = v43;
      uint64_t v28 = v46;
      uint64_t v29 = v47;
      (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v8, v27, v47);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v8, 0, 1, v29);
      sub_1909A01BC();
      sub_1909A4180();
      sub_190999CD4((uint64_t)v8, &qword_1E92A0D18);
      uint64_t v39 = sub_1909A41B0();

      (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v44);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v27, v29);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v26, v17);
      return v39;
    }
  }
  else
  {
    sub_190999CD4((uint64_t)v50, &qword_1E92A0D70);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
  }
  sub_190999CD4((uint64_t)v16, &qword_1E92A0D10);
  if (qword_1E92A23E8 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_1909A4100();
  __swift_project_value_buffer(v30, (uint64_t)qword_1E92A25A8);
  swift_bridgeObjectRetain_n();
  char v31 = (char *)v23;
  uint64_t v32 = sub_1909A40E0();
  os_log_type_t v33 = sub_1909A4270();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v35 = (void *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v50[0] = v36;
    *(_DWORD *)uint64_t v34 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_19099C35C(v44, a4, v50);
    sub_1909A42E0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 12) = 2112;
    int v37 = *(void **)&v31[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error];
    if (v37)
    {
      id v38 = v37;
      int v37 = (void *)_swift_stdlib_bridgeErrorToNSError();
      uint64_t v49 = (uint64_t)v37;
    }
    else
    {
      uint64_t v49 = 0;
    }
    sub_1909A42E0();
    void *v35 = v37;

    _os_log_impl(&dword_19091D000, v32, v33, "Failed to create symmetric key with label %s: %@", (uint8_t *)v34, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E92A2490);
    swift_arrayDestroy();
    MEMORY[0x192FD1040](v35, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x192FD1040](v36, -1, -1);
    MEMORY[0x192FD1040](v34, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_19099F550(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_19099F614(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1909A3FD0();
  swift_allocObject();
  uint64_t result = sub_1909A3F90();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1909A4000();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_19099F690(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1909A3FD0();
  swift_allocObject();
  uint64_t result = sub_1909A3F90();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t _s18ContactsFoundation15CNDataEncryptorC7decrypt_8keyLabel0B04DataVSgAH_SStFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v52 = a3;
  id v53 = a4;
  v55[4] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D10);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1909A4140();
  uint64_t v10 = *(char **)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1909A41D0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v46 - v18;
  sub_19099A340(a1, a2);
  sub_19099E5E8(a1, a2);
  uint64_t v47 = v12;
  uint64_t v48 = v9;
  uint64_t v49 = v10;
  uint64_t v50 = v14;
  id v20 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  uint64_t v51 = v13;
  v20(v19, v17, v13);
  id v21 = objc_msgSend(self, sel_currentEnvironment);
  id v22 = objc_msgSend(v21, sel_keychainFacade);

  uint64_t v24 = v52;
  unint64_t v23 = (unint64_t)v53;
  int v25 = (void *)sub_1909A4200();
  id v26 = objc_msgSend(v22, sel_existingSymmetricKeyWithLabel_, v25);

  swift_unknownObjectRelease();
  uint64_t v27 = (uint64_t)v26 + OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_value;
  swift_beginAccess();
  sub_1909A00FC(v27, (uint64_t)v55);
  uint64_t v28 = v19;
  if (v55[3])
  {
    uint64_t v29 = v48;
    int v30 = swift_dynamicCast();
    char v31 = v49;
    (*((void (**)(char *, void, uint64_t, uint64_t))v49 + 7))(v8, v30 ^ 1u, 1, v29);
    if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v31 + 6))(v8, 1, v29) != 1)
    {
      id v53 = v26;
      uint64_t v32 = v47;
      (*((void (**)(char *, char *, uint64_t))v31 + 4))(v47, v8, v29);
      uint64_t v44 = sub_1909A4170();

      (*((void (**)(char *, uint64_t))v31 + 1))(v32, v29);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v28, v51);
      return v44;
    }
  }
  else
  {
    sub_190999CD4((uint64_t)v55, &qword_1E92A0D70);
    (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v49 + 7))(v8, 1, 1, v48);
  }
  sub_190999CD4((uint64_t)v8, &qword_1E92A0D10);
  if (qword_1E92A23E8 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_1909A4100();
  __swift_project_value_buffer(v33, (uint64_t)qword_1E92A25A8);
  swift_bridgeObjectRetain_n();
  uint64_t v34 = (char *)v26;
  uint64_t v35 = sub_1909A40E0();
  os_log_type_t v36 = sub_1909A4270();
  BOOL v37 = os_log_type_enabled(v35, v36);
  uint64_t v38 = v51;
  if (v37)
  {
    uint64_t v49 = v28;
    uint64_t v39 = swift_slowAlloc();
    os_log_type_t v40 = (void *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    v55[0] = v41;
    *(_DWORD *)uint64_t v39 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_19099C35C(v24, v23, v55);
    sub_1909A42E0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v39 + 12) = 2112;
    uint64_t v42 = *(void **)&v34[OBJC_IVAR____TtC18ContactsFoundation16CNKeychainResult_error];
    if (v42)
    {
      id v43 = v42;
      uint64_t v42 = (void *)_swift_stdlib_bridgeErrorToNSError();
      uint64_t v54 = (uint64_t)v42;
    }
    else
    {
      uint64_t v54 = 0;
    }
    sub_1909A42E0();
    void *v40 = v42;

    _os_log_impl(&dword_19091D000, v35, v36, "Error retrieving encryption key with label %s from keychain: %@", (uint8_t *)v39, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E92A2490);
    swift_arrayDestroy();
    MEMORY[0x192FD1040](v40, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x192FD1040](v41, -1, -1);
    MEMORY[0x192FD1040](v39, -1, -1);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v49, v38);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t))(v50 + 8))(v28, v38);
  }
  return 0;
}

uint64_t type metadata accessor for CNDataEncryptor()
{
  return self;
}

uint64_t method lookup function for CNDataEncryptor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CNDataEncryptor);
}

uint64_t sub_1909A00FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A0D70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1909A0164()
{
  unint64_t result = qword_1E92A25C0;
  if (!qword_1E92A25C0)
  {
    sub_1909A4110();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92A25C0);
  }
  return result;
}

unint64_t sub_1909A01BC()
{
  unint64_t result = qword_1E92A0CD8;
  if (!qword_1E92A0CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92A0CD8);
  }
  return result;
}

void __LoadManagedConfiguration_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration (%d)", (uint8_t *)v1, 8u);
}

void __LoadPrivacyAccounting_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/PrivacyAccounting.framework/PrivacyAccounting (%d)", (uint8_t *)v1, 8u);
}

void __LoadCrashReporterSupport_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport (%d)", (uint8_t *)v1, 8u);
}

void __LoadAccounts_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/Accounts.framework/Accounts (%d)", (uint8_t *)v1, 8u);
}

void sIsDirectoryByStat_block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 error];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_19091D000, v3, v4, "Error checking whether %{public}@ is a directory; unexpected behavior may follow: %{public}@",
    v5,
    v6,
    v7,
    v8,
    v9);
}

void __LoadCoreEmoji_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/CoreEmoji.framework/CoreEmoji (%d)", (uint8_t *)v1, 8u);
}

void __LoadCoreText_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/Frameworks/CoreText.framework/CoreText (%d)", (uint8_t *)v1, 8u);
}

void __LoadFamilyCircle_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/FamilyCircle.framework/FamilyCircle (%d)", (uint8_t *)v1, 8u);
}

void __CNGetICUCollatorVersions_block_invoke_cold_1(int *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error opening root collator to retrieve version number, code=%d", (uint8_t *)v2, 8u);
}

void __LoadMobileKeyBag_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag (%d)", (uint8_t *)v1, 8u);
}

void __LoadIntlUtilities_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/IntlUtilities.framework/IntlUtilities (%d)", (uint8_t *)v1, 8u);
}

uint64_t __getRBSDomainAttributeClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1(v0);
}

uint64_t __getRBSAcquisitionCompletionAttributeClass_block_invoke_cold_1()
{
  return __getRBSAssertionClass_block_invoke_cold_1();
}

uint64_t __getRBSAssertionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getRBSTargetClass_block_invoke_cold_1(v0);
}

uint64_t __getRBSTargetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __62__CNLaunchServices_applicationsAvailableForHandlingURLScheme___block_invoke_cold_1(v0);
}

void __CNObserverCancelableCompletionHandler_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19091D000, a2, OS_LOG_TYPE_ERROR, "Error : %{error}@", (uint8_t *)&v2, 0xCu);
}

void __CNObserverCancelableCompletionHandler_block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19091D000, a2, OS_LOG_TYPE_ERROR, "Result: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __CNObserverCancelableCompletionHandler_block_invoke_cold_4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "An observer completion handler is being called incorrectly.", v1, 2u);
}

void __LoadIntlPreferences_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/IntlPreferences.framework/IntlPreferences (%d)", (uint8_t *)v1, 8u);
}

uint64_t sub_1909A3F00()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1909A3F10()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1909A3F20()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1909A3F30()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1909A3F40()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1909A3F50()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1909A3F60()
{
  return MEMORY[0x1F40E3648]();
}

uint64_t sub_1909A3F70()
{
  return MEMORY[0x1F40E3650]();
}

uint64_t sub_1909A3F80()
{
  return MEMORY[0x1F40E3658]();
}

uint64_t sub_1909A3F90()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1909A3FA0()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1909A3FB0()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1909A3FC0()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1909A3FD0()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1909A3FE0()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1909A3FF0()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1909A4000()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1909A4010()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1909A4020()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1909A4030()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1909A4040()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1909A4050()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1909A4060()
{
  return MEMORY[0x1F4188590]();
}

uint64_t sub_1909A4070()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1909A4080()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1909A4090()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1909A40A0()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1909A40B0()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1909A40C0()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1909A40D0()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1909A40E0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1909A40F0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1909A4100()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1909A4110()
{
  return MEMORY[0x1F40DFEA0]();
}

uint64_t sub_1909A4120()
{
  return MEMORY[0x1F40DFFC0]();
}

uint64_t sub_1909A4130()
{
  return MEMORY[0x1F40DFFC8]();
}

uint64_t sub_1909A4140()
{
  return MEMORY[0x1F40DFFD8]();
}

uint64_t sub_1909A4150()
{
  return MEMORY[0x1F40E0008]();
}

uint64_t sub_1909A4160()
{
  return MEMORY[0x1F40E0010]();
}

uint64_t sub_1909A4170()
{
  return MEMORY[0x1F40E0038]();
}

uint64_t sub_1909A4180()
{
  return MEMORY[0x1F40E0050]();
}

uint64_t sub_1909A4190()
{
  return MEMORY[0x1F40E0068]();
}

uint64_t sub_1909A41A0()
{
  return MEMORY[0x1F40E0070]();
}

uint64_t sub_1909A41B0()
{
  return MEMORY[0x1F40E0098]();
}

uint64_t sub_1909A41C0()
{
  return MEMORY[0x1F40E00A0]();
}

uint64_t sub_1909A41D0()
{
  return MEMORY[0x1F40E00A8]();
}

uint64_t sub_1909A41E0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1909A41F0()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1909A4200()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1909A4210()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1909A4220()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1909A4230()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1909A4240()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1909A4250()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1909A4260()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1909A4270()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1909A4280()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1909A4290()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1909A42A0()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1909A42B0()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1909A42C0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1909A42D0()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1909A42E0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1909A42F0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1909A4300()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1909A4310()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1909A4320()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1909A4330()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1909A4340()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1909A4350()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1909A4360()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1909A4370()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1909A4380()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1909A4390()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1909A43A0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1909A43B0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1909A43C0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1909A43D0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1909A43E0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1909A43F0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1909A4400()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1909A4410()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1909A4420()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1909A4430()
{
  return MEMORY[0x1F4185EF8]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7BE8](allocator, localeIdentifier);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1F4109240]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1F4109248]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreateWithHandler(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, void *block)
{
  return (CFRunLoopTimerRef)MEMORY[0x1F40D8188](allocator, flags, order, block, fireDate, interval);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x1F4109368]();
}

uint64_t CPPhoneNumberCopyNetworkCountryCode()
{
  return MEMORY[0x1F4109378]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLogv(NSString *format, va_list args)
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

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return MEMORY[0x1F4109920]();
}

uint64_t PNCopyBestGuessNormalizedNumberForCountry()
{
  return MEMORY[0x1F4109928]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1F40F6D68](*(void *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1F40F7150](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x1F415CB60]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x1F415CB78]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1F415CB90]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1F415CBB8]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x1F415CBD8]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1F415CC18]();
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

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1F40D8EA0]();
}

uint64_t _CFStringTokenizerCreateNamePartsArrayWithString()
{
  return MEMORY[0x1F40D9178]();
}

uint64_t _PNCopyLastFourDigitsOfLocalNumber()
{
  return MEMORY[0x1F4109978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1F41814F8](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1F417A378]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1F417A388]();
}

uint64_t ct_green_tea_logging_enabled()
{
  return MEMORY[0x1F417A390]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBA58]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1F40CBBE8](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1F40CC160](*(void *)&a1, *(void *)&a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1F40CC2D0](*(void *)&a1, a2);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1F417A398]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1F4181600](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1F4181618](m);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
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

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1F40CD5F0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1F40CDB90](a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1F40CDD48](path, name, *(void *)&options);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1F415CC68]();
}

uint64_t tcc_authorization_record_get_subject_attributed_entity()
{
  return MEMORY[0x1F415CC88]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x1F415CC90]();
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return MEMORY[0x1F415CCA8]();
}

uint64_t tcc_credential_create_for_process_with_audit_token_and_assumed_identity()
{
  return MEMORY[0x1F415CCB0]();
}

uint64_t tcc_credential_create_for_self_with_assumed_identity()
{
  return MEMORY[0x1F415CCB8]();
}

uint64_t tcc_credential_singleton_for_self()
{
  return MEMORY[0x1F415CCC8]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1F415CCF0]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1F415CD00]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x1F415CD08]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1F415CD20]();
}

uint64_t tcc_message_options_set_nokill_policy()
{
  return MEMORY[0x1F415CD40]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1F415CD50]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x1F415CD60]();
}

uint64_t tcc_message_options_set_request_prompt_rights_mask()
{
  return MEMORY[0x1F415CD68]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1F415CD80]();
}

uint64_t tcc_server_message_get_authorization_records_by_service()
{
  return MEMORY[0x1F415CD98]();
}

uint64_t tcc_server_message_get_identity_for_credential()
{
  return MEMORY[0x1F415CDA0]();
}

uint64_t tcc_server_message_request_authorization()
{
  return MEMORY[0x1F415CDB8]();
}

uint64_t tcc_server_message_set_authorization_value()
{
  return MEMORY[0x1F415CDC8]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1F415CDF8]();
}

void u_getVersion(UVersionInfo versionArray)
{
}

char *__cdecl u_strToUTF8(char *dest, int32_t destCapacity, int32_t *pDestLength, const UChar *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (char *)MEMORY[0x1F417F858](dest, *(void *)&destCapacity, pDestLength, src, *(void *)&srcLength, pErrorCode);
}

uint64_t ucol_close()
{
  return MEMORY[0x1F417FD08]();
}

uint64_t ucol_getSortKey()
{
  return MEMORY[0x1F417FD68]();
}

uint64_t ucol_getUCAVersion()
{
  return MEMORY[0x1F417FD78]();
}

uint64_t ucol_getVersion()
{
  return MEMORY[0x1F417FD80]();
}

uint64_t ucol_open()
{
  return MEMORY[0x1F417FDA0]();
}

uint64_t ucol_setAttribute()
{
  return MEMORY[0x1F417FDC8]();
}

uint64_t ucol_setStrength()
{
  return MEMORY[0x1F417FDD0]();
}

uint64_t udatpg_close()
{
  return MEMORY[0x1F417FF48]();
}

uint64_t udatpg_getAppendItemName()
{
  return MEMORY[0x1F417FF50]();
}

uint64_t udatpg_open()
{
  return MEMORY[0x1F417FF80]();
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x1F41806E8]();
}

uint64_t uset_freeze()
{
  return MEMORY[0x1F41806F0]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1F4180720]();
}

uint64_t uset_span()
{
  return MEMORY[0x1F4180748]();
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1F40CEB98]();
}