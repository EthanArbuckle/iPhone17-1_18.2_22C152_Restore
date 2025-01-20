id getMDItemFileProviderDomainIdentifier()
{
  void **v0;
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars8;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void **)getMDItemFileProviderDomainIdentifierSymbolLoc_ptr;
  v7 = getMDItemFileProviderDomainIdentifierSymbolLoc_ptr;
  if (!getMDItemFileProviderDomainIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary_1();
    v5[3] = (uint64_t)dlsym(v1, "MDItemFileProviderDomainIdentifier");
    getMDItemFileProviderDomainIdentifierSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getMDItemFileProviderDomainIdentifier_cold_1();
  }
  v2 = *v0;

  return v2;
}

void sub_1A33B03A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMDItemFileProviderID()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getMDItemFileProviderIDSymbolLoc_ptr;
  uint64_t v7 = getMDItemFileProviderIDSymbolLoc_ptr;
  if (!getMDItemFileProviderIDSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary_1();
    v5[3] = (uint64_t)dlsym(v1, "MDItemFileProviderID");
    getMDItemFileProviderIDSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getMDItemFileProviderID_cold_1();
  }
  v2 = *v0;

  return v2;
}

void sub_1A33B04A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMDItemFileSize()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getMDItemFileSizeSymbolLoc_ptr;
  uint64_t v7 = getMDItemFileSizeSymbolLoc_ptr;
  if (!getMDItemFileSizeSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary_1();
    v5[3] = (uint64_t)dlsym(v1, "MDItemFileSize");
    getMDItemFileSizeSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getMDItemFileSize_cold_1();
  }
  v2 = *v0;

  return v2;
}

void sub_1A33B05B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMDItemLastUsedDate()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)getMDItemLastUsedDateSymbolLoc_ptr;
  uint64_t v7 = getMDItemLastUsedDateSymbolLoc_ptr;
  if (!getMDItemLastUsedDateSymbolLoc_ptr)
  {
    v1 = (void *)CoreSpotlightLibrary_1();
    v5[3] = (uint64_t)dlsym(v1, "MDItemLastUsedDate");
    getMDItemLastUsedDateSymbolLoc_ptr = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getMDItemLastUsedDate_cold_1();
  }
  v2 = *v0;

  return v2;
}

void sub_1A33B06B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCSSearchableIndexClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getCSSearchableIndexClass_softClass;
  uint64_t v7 = getCSSearchableIndexClass_softClass;
  if (!getCSSearchableIndexClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCSSearchableIndexClass_block_invoke;
    v3[3] = &unk_1E5AF1950;
    v3[4] = &v4;
    __getCSSearchableIndexClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A33B079C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __FPItemPredicate_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id FPRecencyQualifyingAttributes()
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  v10 = @"lastUsedDate";
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  v0 = (id *)getMDItemLastUsedDateSymbolLoc_ptr_0;
  uint64_t v9 = getMDItemLastUsedDateSymbolLoc_ptr_0;
  if (!getMDItemLastUsedDateSymbolLoc_ptr_0)
  {
    id v1 = (void *)CoreSpotlightLibrary_2();
    v7[3] = (uint64_t)dlsym(v1, "MDItemLastUsedDate");
    getMDItemLastUsedDateSymbolLoc_ptr_0 = v7[3];
    v0 = (id *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v0) {
    FPRecencyQualifyingAttributes_cold_1();
  }
  v11[0] = *v0;
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = v11[0];
  uint64_t v4 = [v2 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v4;
}

void sub_1A33B2F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A33B3C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A33B4874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

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

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
}

uint64_t ____fp_create_section_block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = __fp_create_section_lastSectionID + 1;
  __fp_create_section_lastSectionID = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  return result;
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

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__23(uint64_t a1, uint64_t a2)
{
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A6248B00](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __FPRecentDocumentsQueryStringForTypes_block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%@ > 0 && %@ < 3124137600", a2, a2];
}

uint64_t __FPContentTypeQueryStringForFileTypes_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"(%@)", a2];
}

uint64_t __FPContentTypeQueryStringForFileTypes_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"(kMDItemContentTypeTree != \"%@\"c)", a2];
}

void sub_1A33B55A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1A33B5860(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33B5A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _brc_notify_get_state(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))getbrc_notify_get_stateSymbolLoc_ptr;
  v12 = getbrc_notify_get_stateSymbolLoc_ptr;
  if (!getbrc_notify_get_stateSymbolLoc_ptr)
  {
    uint64_t v7 = (void *)CloudDocsLibrary();
    v10[3] = (uint64_t)dlsym(v7, "brc_notify_get_state");
    getbrc_notify_get_stateSymbolLoc_ptr = (_UNKNOWN *)v10[3];
    uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v6) {
    _brc_notify_get_state_cold_1();
  }
  return v6(a1, a2, a3);
}

void sub_1A33B5BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FPNotifyNameForForegroundChangeWithProviderID(void *a1)
{
  id v1 = [a1 stringByAppendingString:@".foreground"];
  uint64_t v2 = objc_msgSend(v1, "fp_libnotifyPerUserNotificationName");

  return v2;
}

uint64_t FPEncodeUserInfo(void *a1, void *a2, void *a3)
{
  if (a2) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = !v3;
  if (!v3)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
    id v8 = a1;
    uint64_t v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __FPEncodeUserInfo_block_invoke;
    v16[3] = &unk_1E5AF44F0;
    id v17 = v9;
    id v18 = v10;
    id v11 = v10;
    id v12 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v16];

    id v13 = v11;
    *a3 = v13;
    id v14 = v12;
    *a2 = v14;
  }
  return v4;
}

void sub_1A33B7330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1A33B74D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

id FPExcludedOIDParentsQueryStringFragment(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  if ([v1 count])
  {
    BOOL v3 = objc_msgSend(v1, "_fp_map:", &__block_literal_global_96);
    objc_msgSend(v3, "_fp_componentsJoinedByAnd");
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = @"true";
  }
  v5 = [NSString stringWithFormat:@"(%@)", v4];

  return v5;
}

NSObject *FPDecodeUserInfo(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 count];
  if (v5 == [v4 count])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __FPDecodeUserInfo_block_invoke;
    v12[3] = &unk_1E5AF4518;
    id v13 = v3;
    id v7 = v6;
    id v14 = v7;
    [v4 enumerateObjectsUsingBlock:v12];
    id v8 = v14;
    uint64_t v9 = v7;

    v10 = v9;
  }
  else
  {
    uint64_t v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] User info keys and values must have same number of items", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

uint64_t FPIsTrashedQueryStringFragment(int a1)
{
  id v1 = @"!=";
  if (a1) {
    id v1 = @"==";
  }
  return [NSString stringWithFormat:@"(kMDItemIsTrashed %@ \"1\"", v1];
}

__CFString *FPFileProviderOriginatedItemsQueryStringFragment(void *a1)
{
  id v1 = a1;
  if ([v1 count])
  {
    if ([v1 count] == 1
      && ([v1 firstObject],
          uint64_t v2 = objc_claimAutoreleasedReturnValue(),
          char v3 = [v2 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"],
          v2,
          (v3 & 1) != 0))
    {
      id v4 = @"(true)";
    }
    else
    {
      if ([v1 count] == 1)
      {
        uint64_t v5 = NSString;
        uint64_t v6 = [v1 firstObject];
        [v5 stringWithFormat:@"kMDItemFileProviderID == \"%@\"", v6];
      }
      else
      {
        id v7 = objc_msgSend(v1, "_fp_componentsWrappedInQuotes");
        uint64_t v6 = [v7 componentsJoinedByString:@", "];

        [NSString stringWithFormat:@"FieldMatch(kMDItemFileProviderID, %@)", v6];
      }
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"kMDItemFileProviderID == \"*\"";
  }

  return v4;
}

uint64_t fpfs_supports_sokoban()
{
  int v0 = *__error();
  if (fpfs_supports_sokoban_once_token != -1) {
    dispatch_once(&fpfs_supports_sokoban_once_token, &__block_literal_global_6);
  }
  *__error() = v0;
  return fpfs_supports_sokoban_feature_enabled;
}

void sub_1A33B9DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,int a58,char a59)
{
}

uint64_t __fp_create_section()
{
  if (__fp_create_section_once != -1) {
    dispatch_once(&__fp_create_section_once, &__block_literal_global_27_0);
  }
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v6 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ____fp_create_section_block_invoke_2;
  block[3] = &unk_1E5AF1950;
  block[4] = &v3;
  dispatch_sync((dispatch_queue_t)__fp_create_section_queue, block);
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A33BA674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A33BBB7C(_Unwind_Exception *a1)
{
}

void __FPDecodeUserInfo_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  id v7 = +[FPSearchableItemValue objectFromString:v5];
  id v8 = +[FPSearchableItemValue objectFromString:v6];
  if (v8) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to decode key/value pair %@: %@ in userInfo. Allowed types are String, Number, Date, Boolean.", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) setObject:v7 forKey:v8];
  }
}

void **__fp_pop_log(void **result)
{
  if (result) {
    return (void **)fpfs_adopt_log(*result);
  }
  return result;
}

void __fp_leave_section_Debug(uint64_t a1)
{
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __fp_leave_section_Debug_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

id fpfs_adopt_log(void *a1)
{
  id v1 = a1;
  if (init_log_tls_if_needed_once != -1) {
    dispatch_once(&init_log_tls_if_needed_once, &__block_literal_global_47);
  }
  uint64_t v2 = fpfs_current_log();
  pthread_key_t v3 = log_pthread_key;
  id v4 = v1;
  pthread_setspecific(v3, v4);

  return v2;
}

id fp_current_or_default_log()
{
  uint64_t v0 = fpfs_current_log();
  if (!v0)
  {
    uint64_t v0 = fp_default_log();
  }

  return v0;
}

void *fpfs_current_log()
{
  if (init_log_tls_if_needed_once != -1) {
    dispatch_once(&init_log_tls_if_needed_once, &__block_literal_global_47);
  }
  pthread_key_t v0 = log_pthread_key;

  return pthread_getspecific(v0);
}

id fp_default_log()
{
  if (fp_default_log_once != -1) {
    dispatch_once(&fp_default_log_once, &__block_literal_global_23);
  }
  pthread_key_t v0 = (void *)fp_default_log_logger;

  return v0;
}

uint64_t fpfs_is_busy_date(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  uint64_t v2 = (void *)getDSFileOperationClass_softClass;
  uint64_t v9 = getDSFileOperationClass_softClass;
  if (!getDSFileOperationClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getDSFileOperationClass_block_invoke;
    v5[3] = &unk_1E5AF1950;
    v5[4] = &v6;
    __getDSFileOperationClass_block_invoke((uint64_t)v5);
    uint64_t v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  return [v3 dateIsBusyFolderDate:(double)a1 - *MEMORY[0x1E4F1CF78]];
}

void sub_1A33BC3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A33BC734(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33BC900(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33BCB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A33BCD18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33BCE88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getDSFileOperationClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __DesktopServicesPrivLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5AF51B8;
    uint64_t v5 = 0;
    DesktopServicesPrivLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary_0) {
    __getDSFileOperationClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("DSFileOperation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getDSFileOperationClass_block_invoke_cold_2();
  }
  getDSFileOperationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t FPFeatureFlagHelenaIsEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t fpfs_set_vfs_ignore_permissions_iopolicy()
{
  uint64_t result = fpfs_supports_vfs_ignore_permissions_iopolicy();
  if (result)
  {
    return setiopolicy_np(7, 0, 1);
  }
  return result;
}

uint64_t fpfs_supports_vfs_ignore_permissions_iopolicy()
{
  return 1;
}

uint64_t FPSearchableItemValueReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  long long v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v12 = *(void *)(a2 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v15 = v9++ >= 9;
        if (v15)
        {
          unint64_t v10 = 0;
          int v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v18 = PBReaderReadString();
          uint64_t v19 = 48;
          goto LABEL_36;
        case 2u:
          *(unsigned char *)(a1 + 56) |= 1u;
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v35 = 8;
          goto LABEL_48;
        case 3u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v26 = 0;
          *(unsigned char *)(a1 + 56) |= 2u;
          break;
        case 4u:
          *(unsigned char *)(a1 + 56) |= 4u;
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(void *)(a2 + *v4))
          {
            uint64_t v23 = *(void *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(unsigned char *)(a2 + *v5) = 1;
            uint64_t v23 = 0;
          }
          uint64_t v35 = 24;
LABEL_48:
          *(void *)(a1 + v35) = v23;
          continue;
        case 5u:
          uint64_t v18 = PBReaderReadData();
          uint64_t v19 = 40;
LABEL_36:
          v33 = *(void **)(a1 + v19);
          *(void *)(a1 + v19) = v18;

          continue;
        case 6u:
          v34 = PBReaderReadString();
          if (v34) {
            [(id)a1 addArrayOfStringsValue:v34];
          }

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v27 = *v3;
        uint64_t v28 = *(void *)(a2 + v27);
        unint64_t v29 = v28 + 1;
        if (v28 == -1 || v29 > *(void *)(a2 + *v4)) {
          break;
        }
        char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
        *(void *)(a2 + v27) = v29;
        v26 |= (unint64_t)(v30 & 0x7F) << v24;
        if ((v30 & 0x80) == 0) {
          goto LABEL_41;
        }
        v24 += 7;
        BOOL v15 = v25++ >= 9;
        if (v15)
        {
          uint64_t v26 = 0;
          goto LABEL_43;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_41:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v26 = 0;
      }
LABEL_43:
      *(void *)(a1 + 16) = v26;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void __cachedFrameworkOverridingObjects_block_invoke()
{
  v60[1] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1A6248870]();
  id v0 = fp_default_log();
  id v1 = frameworkOverridingModulesDirectoryURL();
  v39 = [MEMORY[0x1E4F1CA48] array];
  id v2 = v1;
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v44 = *MEMORY[0x1E4F1C628];
  v60[0] = *MEMORY[0x1E4F1C628];
  long long v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
  uint64_t v35 = v3;
  v36 = v2;
  uint64_t v5 = [v3 contentsOfDirectoryAtURL:v2 includingPropertiesForKeys:v4 options:7 error:0];
  v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v52;
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v42 = v4;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(NSObject **)(*((void *)&v51 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x1A6248870]();
        uint64_t v12 = [v10 resourceValuesForKeys:v4 error:0];
        unint64_t v13 = [v10 pathExtension];
        if ([v13 isEqualToString:@"bundle"])
        {
          char v14 = [v12 objectForKeyedSubscript:v44];
          int v15 = [v14 BOOLValue];

          if (v15)
          {
            int v16 = CFBundleCreate(allocator, (CFURLRef)v10);
            if (!v16)
            {
              uint64_t v18 = fp_current_or_default_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v56 = v10;
                _os_log_error_impl(&dword_1A33AE000, v18, OS_LOG_TYPE_ERROR, "[ERROR] Could not load module bundle at %@", buf, 0xCu);
              }
              goto LABEL_41;
            }
            id v17 = v16;
            uint64_t v18 = CFBundleGetIdentifier(v16);
            v43 = CFBundleGetInfoDictionary(v17);
            uint64_t v19 = [v43 objectForKey:@"FileProviderModuleClass"];
            if ([v18 isEqualToString:@"com.apple.icloud.drive.fileprovider.override"]&& (FPIsCloudDocsWithFPFSEnabled() & 1) == 0)
            {
              v20 = fp_current_or_default_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
                __cachedFrameworkOverridingObjects_block_invoke_cold_2(&v49, v50, v20);
              }
LABEL_26:

              CFRelease(v17);
              goto LABEL_40;
            }
            if ([v18 isEqualToString:@"com.apple.CloudDocsFileProvider"]&& FPIsCloudDocsWithFPFSEnabled())
            {
              v20 = fp_current_or_default_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
                __cachedFrameworkOverridingObjects_block_invoke_cold_1(&v47, v48, v20);
              }
              goto LABEL_26;
            }
            v40 = v19;
            if (v19)
            {
              CFErrorRef error = 0;
              if (!CFBundleLoadExecutableAndReturnError(v17, &error))
              {
                uint64_t v28 = fp_current_or_default_log();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v56 = v18;
                  __int16 v57 = 2112;
                  CFErrorRef v58 = error;
                  _os_log_error_impl(&dword_1A33AE000, v28, OS_LOG_TYPE_ERROR, "[ERROR] Could not load bundle %@. Error: %@", buf, 0x16u);
                }

                CFRelease(error);
                goto LABEL_34;
              }
              uint64_t v21 = NSClassFromString(v19);
              if (v21)
              {
                id v22 = objc_alloc_init(v21);
                if (v22)
                {
                  [v38 addObject:v22];
                  uint64_t v23 = fp_current_or_default_log();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v56 = v40;
                    __int16 v57 = 2112;
                    CFErrorRef v58 = (CFErrorRef)v18;
                    _os_log_impl(&dword_1A33AE000, v23, OS_LOG_TYPE_INFO, "[INFO] Loaded module %@ from bundle %@", buf, 0x16u);
                  }

                  [v39 addObject:v17];
                }
                else
                {
                  unint64_t v29 = fp_current_or_default_log();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v56 = v40;
                    __int16 v57 = 2112;
                    CFErrorRef v58 = (CFErrorRef)v18;
                    _os_log_error_impl(&dword_1A33AE000, v29, OS_LOG_TYPE_ERROR, "[ERROR] Could not instantiate module class %@ from extension module bundle %@", buf, 0x16u);
                  }
                }
                CFRelease(v17);

LABEL_39:
                uint64_t v19 = v40;
LABEL_40:

LABEL_41:
                long long v4 = v42;
                goto LABEL_42;
              }
              char v24 = fp_current_or_default_log();
              if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
LABEL_33:

LABEL_34:
                CFRelease(v17);
                goto LABEL_39;
              }
              *(_DWORD *)buf = 138412546;
              v56 = v19;
              __int16 v57 = 2112;
              CFErrorRef v58 = (CFErrorRef)v18;
              unsigned int v25 = v24;
              uint64_t v26 = "[ERROR] Could not load class %@ from extension module bundle %@";
              uint32_t v27 = 22;
            }
            else
            {
              char v24 = fp_current_or_default_log();
              if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                goto LABEL_33;
              }
              *(_DWORD *)buf = 138412290;
              v56 = v18;
              unsigned int v25 = v24;
              uint64_t v26 = "[ERROR] Bundle %@ does not have a FileProviderModuleClass entry.";
              uint32_t v27 = 12;
            }
            _os_log_error_impl(&dword_1A33AE000, v25, OS_LOG_TYPE_ERROR, v26, buf, v27);
            goto LABEL_33;
          }
        }
LABEL_42:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v30 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
      uint64_t v7 = v30;
    }
    while (v30);
  }

  [v38 sortUsingComparator:&__block_literal_global_159];
  uint64_t v31 = fp_current_or_default_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    int v32 = [v38 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v56) = v32;
    _os_log_impl(&dword_1A33AE000, v31, OS_LOG_TYPE_INFO, "[INFO] Loaded %d framework overrides modules.", buf, 8u);
  }

  v33 = (void *)frameworkOverridingObjects;
  frameworkOverridingObjects = (uint64_t)v38;

  v34 = (void *)cachedFrameworkOverridingObjects_frameworkOverridingBundles;
  cachedFrameworkOverridingObjects_frameworkOverridingBundles = (uint64_t)v39;
}

id frameworkOverridingModulesDirectoryURL()
{
  if (frameworkOverridingModulesDirectoryURL_onceToken != -1) {
    dispatch_once(&frameworkOverridingModulesDirectoryURL_onceToken, &__block_literal_global_164);
  }
  id v0 = (void *)frameworkOverridingModulesDirectoryURL_URL;

  return v0;
}

const char *fpfs_path_return_assigned_provider_domain_xattr(const char *a1, ssize_t *a2, void *a3, size_t a4)
{
  ssize_t v8 = getxattr(a1, "com.apple.file-provider-domain-id", a3, a4, 0, 1);
  if (v8 >= 1)
  {
    uint64_t v9 = "com.apple.file-provider-domain-id";
    if (!a2) {
      return v9;
    }
LABEL_6:
    *a2 = v8;
    return v9;
  }
  ssize_t v8 = getxattr(a1, "com.apple.file-provider-domain-id#PN", a3, a4, 0, 1);
  if (v8 < 1) {
    return 0;
  }
  uint64_t v9 = "com.apple.file-provider-domain-id#PN";
  if (a2) {
    goto LABEL_6;
  }
  return v9;
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  if (FPIsCloudDocsWithFPFSEnabled_onceToken != -1) {
    dispatch_once(&FPIsCloudDocsWithFPFSEnabled_onceToken, &__block_literal_global_74);
  }
  return FPIsCloudDocsWithFPFSEnabled_icdOnFPFSEnabled;
}

void sub_1A33BF9A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t fpfs_lp_sandbox_extension_issue_file(uint64_t a1, const char *a2, int a3)
{
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2000000000;
  uint64_t v17 = 0;
  uint64_t v17 = sandbox_extension_issue_file();
  if (!v15[3] && *__error() == 63)
  {
    if (fpfs_supports_long_paths())
    {
      uint64_t v13 = 0;
      int v6 = fpfs_openat_longparent(-2, a2, &v13);
      if ((v6 & 0x80000000) == 0)
      {
        int v7 = v6;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 0x40000000;
        id v11[2] = __fpfs_lp_sandbox_extension_issue_file_block_invoke;
        v11[3] = &unk_1E5AF57E8;
        v11[4] = &v14;
        v11[5] = a1;
        v11[6] = v13;
        int v12 = a3;
        fpfs_fchdir(v6, (uint64_t)v11);
        int v8 = *__error();
        close(v7);
        *__error() = v8;
      }
    }
  }
  uint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

void sub_1A33C0BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t FPURLMightBeInFileProvider(void *a1)
{
  return objc_msgSend(a1, "fp_matchesFileProviderHeuristics:", geteuid());
}

void FPRegisterFileProvidersForUserAtURLs(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      int v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      if (objc_msgSend(v12, "fp_matchesFileProviderHeuristics:", a1)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v12;

    if (!v13) {
      goto LABEL_12;
    }
    uint64_t v14 = +[FPDaemonConnection connectionForUser:a1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __FPRegisterFileProvidersForUserAtURLs_block_invoke;
    v15[3] = &unk_1E5AF2998;
    id v16 = v6;
    [v14 wakeUpForURL:v13 completionHandler:v15];
  }
  else
  {
LABEL_9:

LABEL_12:
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, &__block_literal_global_14);
  }
}

id __FPMakeAsyncCompletionBlock(id *a1, void *a2)
{
  id v4 = a1[2];
  id v5 = a1;
  id v6 = (void *)[a2 copy];
  _Block_signature(v6);
  uint64_t v11 = v4;
  int v12 = v6;
  id v7 = v4;
  id v8 = v6;
  uint64_t v9 = (void *)__NSMakeSpecialForwardingCaptureBlock();

  return v9;
}

BOOL FPPinningSupportedForItem(void *a1)
{
  id v1 = a1;
  id v2 = [v1 providerDomainID];
  int IsEnabledForDomainID = FPPinningIsEnabledForDomainID(v2);

  if (!IsEnabledForDomainID) {
    goto LABEL_9;
  }
  if (FPPinningSupportedForItem_onceToken != -1) {
    dispatch_once(&FPPinningSupportedForItem_onceToken, &__block_literal_global_48_0);
  }
  id v4 = (void *)FPPinningSupportedForItem_unsupportedIdentifiers;
  id v5 = [v1 itemIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];
  if ([v6 BOOLValue])
  {

LABEL_8:
    goto LABEL_9;
  }
  id v7 = (void *)FPPinningSupportedForItem_unsupportedIdentifiers;
  id v8 = [v1 providerItemIdentifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  char v10 = [v9 BOOLValue];

  if ((v10 & 1) == 0)
  {
    id v5 = [v1 symlinkTargetPath];
    if ([v5 length]) {
      goto LABEL_8;
    }
    id v13 = [v1 contentType];
    char v14 = [v13 conformsToType:*MEMORY[0x1E4F444B8]];

    if ((v14 & 1) == 0)
    {
      BOOL v11 = ([v1 capabilities] & 0x10000000) != 0;
      goto LABEL_10;
    }
  }
LABEL_9:
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

uint64_t FPPinningIsEnabledForDomainID(void *a1)
{
  id v1 = a1;
  if (_os_feature_enabled_impl())
  {
    id v2 = objc_msgSend(v1, "fp_toProviderID");
    if ((objc_msgSend(v2, "fp_isiCloudDriveOrCloudDocsIdentifier") & 1) != 0
      || [v2 isEqualToString:@"com.apple.FruitBasket.Provider"]
      && (os_variant_has_internal_content() & 1) != 0)
    {
      uint64_t v3 = 1;
    }
    else
    {
      uint64_t v3 = [v2 hasPrefix:@"TestSyncEngine"];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id obfuscatePath(void *a1, unint64_t a2)
{
  id v3 = a1;
  id v4 = [v3 pathComponents];
  id v5 = (void *)[v4 mutableCopy];

  if ([v3 hasSuffix:@"/"]) {
    BOOL v6 = [v3 length] != 1;
  }
  else {
    BOOL v6 = 0;
  }
  for (; a2 < [v5 count]; ++a2)
  {
    id v7 = [v5 objectAtIndexedSubscript:a2];
    id v8 = objc_msgSend(v7, "fp_alwaysObfuscatedFilename");
    [v5 setObject:v8 atIndexedSubscript:a2];
  }
  uint64_t v9 = [NSString pathWithComponents:v5];
  char v10 = v9;
  if (v6)
  {
    id v11 = [v9 stringByAppendingString:@"/"];
  }
  else
  {
    id v11 = v9;
  }
  int v12 = v11;

  return v12;
}

id FPDecodeUserInfoItem(uint64_t a1)
{
  return +[FPSearchableItemValue objectFromString:a1];
}

uint64_t fp_shouldObfuscateFilenames()
{
  if (fp_shouldObfuscateFilenames_onceToken != -1) {
    dispatch_once(&fp_shouldObfuscateFilenames_onceToken, &__block_literal_global_21);
  }
  id v0 = [MEMORY[0x1E4F1C9C8] now];
  [v0 timeIntervalSinceReferenceDate];
  double v2 = v1;

  if (*(double *)&fp_shouldObfuscateFilenames_lastReadTime == 0.0
    || *(double *)&fp_shouldObfuscateFilenames_lastReadTime + 60.0 < v2)
  {
    id v4 = (id)fp_shouldObfuscateFilenames_lockObject;
    objc_sync_enter(v4);
    double v5 = *(double *)&fp_shouldObfuscateFilenames_lastReadTime + 60.0;
    if (*(double *)&fp_shouldObfuscateFilenames_lastReadTime == 0.0 || v5 < v2)
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", *(double *)&fp_shouldObfuscateFilenames_lastReadTime, v5);
      fp_shouldObfuscateFilenames_shouldObfuscate = [v7 BOOLForKey:@"com.apple.fileprovider.log-sensitive-data"] ^ 1;

      fp_shouldObfuscateFilenames_lastReadTime = *(void *)&v2;
    }
    objc_sync_exit(v4);
  }
  return fp_shouldObfuscateFilenames_shouldObfuscate;
}

void sub_1A33C382C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *_extensionInFilename(char *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  id v4 = strrchr(a1, 46);
  double v5 = 0;
  if (v4 && v4 != a1)
  {
    double v5 = v4 + 1;
    if (strlen(v4 + 1) > 0x32) {
      return 0;
    }
    if (!a2 && (!strcmp(v5, "gz") || !strcmp(v5, "bz2") || !strcmp(v5, "Z") || !strcmp(v5, "xz")))
    {
      char v10 = strdup(a1);
      v5[~(unint64_t)a1 + (void)v10] = 0;
      uint64_t v11 = _extensionInFilename();
      if (v11) {
        double v5 = &a1[v11 - (void)v10];
      }
      free(v10);
    }
    else
    {
      char v7 = 0;
      for (i = v5; ; ++i)
      {
        int v9 = *(unsigned __int8 *)i;
        if (!*i) {
          break;
        }
        if (v9 == 32 || v9 == 47) {
          return 0;
        }
        v7 |= (v9 - 58) < 0xFFFFFFF6;
      }
      if ((v7 & 1) == 0) {
        return 0;
      }
    }
  }
  return v5;
}

id obfuscateString(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 length] <= 2
    || (uint64_t v2 = [v1 rangeOfComposedCharacterSequenceAtIndex:0],
        uint64_t v4 = v3,
        uint64_t v5 = objc_msgSend(v1, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v1, "length") - 1),
        v4 == v5))
  {
    id v7 = v1;
  }
  else
  {
    uint64_t v8 = v5;
    uint64_t v9 = v6;
    char v10 = objc_msgSend(v1, "substringWithRange:", v2, v4);
    uint64_t v11 = objc_msgSend(v1, "substringWithRange:", v8, v9);
    id v7 = [NSString stringWithFormat:@"%@{%d}%@", v10, objc_msgSend(v1, "length") - v4 - v9, v11];
  }

  return v7;
}

char *copyHomeDirectoryCompat(uid_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = sysconf(71);
  if (v2 == -1)
  {
    __error();
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      copyHomeDirectoryCompat_cold_1();
    }

    return 0;
  }
  else
  {
    size_t v3 = v2;
    uint64_t v4 = (char *)&v9 - ((MEMORY[0x1F4188790]() + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v4, v3);
    memset(&v11, 0, sizeof(v11));
    char v10 = 0;
    if (getpwuid_r(a1, &v11, v4, v3, &v10))
    {
      __error();
      uint64_t v5 = fp_current_or_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        copyHomeDirectoryCompat_cold_3();
      }

      return 0;
    }
    if (!v10)
    {
      uint64_t v8 = fp_current_or_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        copyHomeDirectoryCompat_cold_2();
      }

      return 0;
    }
    return strdup(v11.pw_dir);
  }
}

uint64_t FPStatVFS(int a1, const char *a2, uint64_t a3)
{
  uint64_t v12 = 0;
  long long v11 = xmmword_1A34E47E0;
  uint64_t v6 = (char *)malloc_type_calloc(1uLL, 0x838uLL, 0x1000040EEC1C51CuLL);
  if (v6)
  {
    id v7 = v6;
    if (a2)
    {
      uint64_t v8 = getattrlist(a2, &v11, v6, 0x838uLL, 0x201u);
    }
    else
    {
      if (a1 < 0)
      {
        *__error() = 22;
        uint64_t v9 = 0xFFFFFFFFLL;
        goto LABEL_10;
      }
      uint64_t v8 = fgetattrlist(a1, &v11, v6, 0x838uLL, 0x200u);
    }
    uint64_t v9 = v8;
    if ((v8 & 0x80000000) == 0)
    {
      bzero((void *)a3, 0x878uLL);
      *(void *)(a3 + 48) = *(void *)(v7 + 4);
      *(_DWORD *)(a3 + 64) = *((_DWORD *)v7 + 5);
      __strlcpy_chk();
      __strlcpy_chk();
      __strlcpy_chk();
      free(v7);
      return 0;
    }
LABEL_10:
    free(v7);
    return v9;
  }
  *__error() = 12;
  return 0xFFFFFFFFLL;
}

__CFString *FPExecutableNameForProcessIdentifier()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (FPExecutableNameForProcessIdentifier_onceToken != -1) {
    dispatch_once(&FPExecutableNameForProcessIdentifier_onceToken, &__block_literal_global_19);
  }
  if (FPExecutableNameForProcessIdentifier_pidResolutionAllowed
    && (bzero(buffer, 0x1000uLL), proc_pidpath(v0, buffer, 0x1000u) >= 1))
  {
    id v1 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:buffer isDirectory:0 relativeToURL:0];
    uint64_t v2 = [v1 lastPathComponent];
  }
  else
  {
    uint64_t v2 = @"<unresolved>";
  }

  return v2;
}

void __FPIsCloudDocsWithFPFSEnabled_block_invoke()
{
  if (!os_variant_has_internal_content()) {
    goto LABEL_7;
  }
  int v0 = [[FPUserDefaultsWithRootUserWorkaround alloc] initWithSuiteName:@"com.apple.iclouddrive.features"];
  if (![(FPUserDefaultsWithRootUserWorkaround *)v0 BOOLForKey:@"do-not-migrate-to-FPFS"])
  {

LABEL_7:
    FPIsCloudDocsWithFPFSEnabled_icdOnFPFSEnabled = 1;
    return;
  }
  id v1 = fp_current_or_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __FPIsCloudDocsWithFPFSEnabled_block_invoke_cold_1(v1);
  }

  FPIsCloudDocsWithFPFSEnabled_icdOnFPFSEnabled = 0;
}

__CFString *FPExcludedCollaborationInvitationsQueryStringFragment()
{
  return @"(com_apple_mobilesms_isHighlightedContent != * || InRange(com_apple_mobilesms_isHighlightedContent, 1, 2)) && com_apple_mobilesms_fromMe != 1";
}

id FPContentTypeQueryStringForFileTypes(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_opt_new();
  if ([v3 count])
  {
    uint64_t v6 = [(id)*MEMORY[0x1E4F44408] identifier];
    char v7 = [v3 containsObject:v6];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = objc_msgSend(v3, "_fp_map:", &__block_literal_global_107);
      uint64_t v9 = objc_msgSend(v8, "_fp_componentsJoinedByOr");

      [v5 addObject:v9];
    }
  }
  if ([v4 count])
  {
    char v10 = objc_msgSend(v4, "_fp_map:", &__block_literal_global_112);
    long long v11 = objc_msgSend(v10, "_fp_componentsJoinedByOr");

    [v5 addObject:v11];
  }
  if (![v5 count]) {
    [v5 addObject:@"true"];
  }
  uint64_t v12 = objc_msgSend(v5, "_fp_map:", &__block_literal_global_117);
  id v13 = objc_msgSend(v12, "_fp_componentsJoinedByAnd");

  return v13;
}

id FPRecentDocumentsQueryStringForTypes(void *a1, void *a2, void *a3)
{
  uint64_t v5 = NSString;
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  uint64_t v9 = [v5 stringWithFormat:@"(kMDItemIsTrashed %@ \"1\", @"!=""];
  char v10 = FPFileProviderOriginatedItemsQueryStringFragment(v8);

  long long v11 = [v5 stringWithFormat:@"(%@) && (%@)", v9, v10];

  uint64_t v12 = FPContentTypeQueryStringForFileTypes(v7, v6);

  if (v12)
  {
    uint64_t v13 = [NSString stringWithFormat:@"(%@) && (%@)", v11, v12];

    long long v11 = (void *)v13;
  }
  char v14 = FPRecencyQualifyingAttributes();
  int v15 = [v14 allValues];
  id v16 = objc_msgSend(v15, "_fp_map:", &__block_literal_global_122);
  long long v17 = objc_msgSend(v16, "_fp_componentsJoinedByOr");

  long long v18 = [NSString stringWithFormat:@"(%@) && (%@)", v11, v17];

  return v18;
}

void sub_1A33C5E38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33C5F3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33C63BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  __fp_leave_section_Debug(v8 - 40);
  _Unwind_Resume(a1);
}

void sub_1A33C6A38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FPDataSourceBaseQueue()
{
  if (FPDataSourceBaseQueue_once != -1) {
    dispatch_once(&FPDataSourceBaseQueue_once, &__block_literal_global_40);
  }
  int v0 = (void *)FPDataSourceBaseQueue_updateQueue;

  return v0;
}

void sub_1A33C6D88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33C6E38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33C7544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A33C7720(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33C7EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A33C7FF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33C8320(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33C8BBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33C97C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void __FPXEnumeratorXPCInterface_block_invoke()
{
  v21[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6D4108];
  id v1 = (void *)FPXEnumeratorXPCInterface_interface;
  FPXEnumeratorXPCInterface_interface = v0;

  uint64_t v2 = (void *)FPXEnumeratorXPCInterface_interface;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  uint64_t v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_enumerateItemsFromPage_suggestedPageSize_reply_ argumentIndex:0 ofReply:1];

  id v6 = (void *)FPXEnumeratorXPCInterface_interface;
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v9 = [v7 setWithArray:v8];
  [v6 setClasses:v9 forSelector:sel_enumerateItemsFromPage_suggestedPageSize_upTo_reply_ argumentIndex:0 ofReply:1];

  char v10 = (void *)FPXEnumeratorXPCInterface_interface;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  uint64_t v13 = [v11 setWithArray:v12];
  [v10 setClasses:v13 forSelector:sel_enumerateChangesFromToken_suggestedBatchSize_reply_ argumentIndex:0 ofReply:1];

  uint64_t v14 = (void *)FPXEnumeratorXPCInterface_interface;
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  long long v17 = [v15 setWithArray:v16];
  [v14 setClasses:v17 forSelector:sel_enumerateChangesFromToken_suggestedBatchSize_reply_ argumentIndex:1 ofReply:1];
}

void FPXSetOperationServiceOnXPCInterface(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6CF1B8];
  FPSetOperationClientOnXPCInterface(v2);
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v1 setClasses:v5 forSelector:sel_startOperation_toFetchThumbnailsForItemIdentifiers_size_completionHandler_ argumentIndex:1 ofReply:0];

  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  [v1 setClasses:v11 forSelector:sel_startOperation_toFetchThumbnailsWithDictionary_size_completionHandler_ argumentIndex:1 ofReply:0];

  uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v1 setClasses:v14 forSelector:sel_deleteItemsWithIDs_baseVersions_options_reply_ argumentIndex:0 ofReply:0];

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  long long v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  [v1 setClasses:v17 forSelector:sel_deleteItemsWithIDs_baseVersions_options_reply_ argumentIndex:1 ofReply:0];

  long long v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  long long v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v1 setClasses:v20 forSelector:sel_preflightReparentItemIDs_underParentID_reply_ argumentIndex:0 ofReply:0];

  uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v1 setClasses:v23 forSelector:sel_preflightReparentItemIDs_underParentID_reply_ argumentIndex:0 ofReply:1];

  char v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  [v1 setClasses:v26 forSelector:sel_bulkItemChanges_changedFields_completionHandler_ argumentIndex:0 ofReply:0];

  uint32_t v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
  [v1 setClasses:v30 forSelector:sel_bulkItemChanges_changedFields_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  v34 = objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
  [v1 setClasses:v34 forSelector:sel_bulkItemChanges_changedFields_completionHandler_ argumentIndex:1 ofReply:1];

  uint64_t v35 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v36 = objc_opt_class();
  v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
  [v1 setClasses:v37 forSelector:sel_preflightTrashItemIDs_completionHandler_ argumentIndex:0 ofReply:0];

  v38 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v39 = objc_opt_class();
  v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
  [v1 setClasses:v40 forSelector:sel_preflightTrashItemIDs_completionHandler_ argumentIndex:0 ofReply:1];

  v41 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v42 = objc_opt_class();
  v43 = objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
  [v1 setClasses:v43 forSelector:sel_fetchHierarchyForItemID_recursively_ignoreAlternateContentURL_reply_ argumentIndex:0 ofReply:1];

  uint64_t v44 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v45 = objc_opt_class();
  v46 = objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
  [v1 setClasses:v46 forSelector:sel_userInteractionErrorsForPerformingAction_sourceItems_destinationItem_fpProviderDomainId_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler_ argumentIndex:1 ofReply:0];

  uint8_t v47 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v48 = objc_opt_class();
  uint8_t v49 = objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
  [v1 setClasses:v49 forSelector:sel_userInteractionErrorsForPerformingAction_sourceItems_destinationItem_fpProviderDomainId_sourceItemKeysAllowList_destinationItemKeysAllowList_completionHandler_ argumentIndex:0 ofReply:1];

  v50 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v51 = objc_opt_class();
  long long v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
  [v1 setClasses:v52 forSelector:sel_fetchTrashIdentifiersWithCompletionHandler_ argumentIndex:0 ofReply:1];

  long long v53 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v54 = objc_opt_class();
  v55 = objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  [v1 setClasses:v55 forSelector:sel_updateIgnoreStateOfItemWithIdentifiers_ignoreState_completionHandler_ argumentIndex:0 ofReply:0];

  v56 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v57 = objc_opt_class();
  uint64_t v58 = objc_opt_class();
  v59 = objc_msgSend(v56, "setWithObjects:", v57, v58, objc_opt_class(), 0);
  [v1 setClasses:v59 forSelector:sel_updateIgnoreStateOfItemWithIdentifiers_ignoreState_completionHandler_ argumentIndex:0 ofReply:1];

  v60 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v61 = objc_opt_class();
  uint64_t v62 = objc_opt_class();
  v63 = objc_msgSend(v60, "setWithObjects:", v61, v62, objc_opt_class(), 0);
  [v1 setClasses:v63 forSelector:sel_updateIgnoreStateOfItemWithIdentifiers_ignoreState_completionHandler_ argumentIndex:1 ofReply:1];

  unsigned int outCount = 0;
  v64 = protocol_copyMethodDescriptionList((Protocol *)&unk_1EF6C5740, 1, 1, &outCount);
  v65 = v64;
  if (outCount)
  {
    unint64_t v66 = 0;
    p_name = &v64->name;
    do
    {
      Name = sel_getName(*p_name);
      if (!strncmp(Name, "startOperation:", 0xFuLL)) {
        [v1 setInterface:v2 forSelector:*p_name argumentIndex:0 ofReply:0];
      }
      ++v66;
      p_name += 2;
    }
    while (v66 < outCount);
  }
  free(v65);
}

id FPDDomainServicingXPCInterface()
{
  v58[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6EDE80];
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  id v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [v0 setClasses:v6 forSelector:sel_enumerateMaterializedSetFromSyncAnchor_suggestedBatchSize_completionHandler_ argumentIndex:1 ofReply:1];

  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v0 setClasses:v9 forSelector:sel_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v0 setClasses:v12 forSelector:sel_enumeratePendingSetFromSyncAnchor_suggestedBatchSize_completionHandler_ argumentIndex:1 ofReply:1];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, objc_opt_class(), 0);
  [v0 setClasses:v19 forSelector:sel_getDiagnosticAttributesForItems_completionHandler_ argumentIndex:0 ofReply:0];

  long long v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, v25, objc_opt_class(), 0);
  [v0 setClasses:v26 forSelector:sel_getDiagnosticAttributesForItems_completionHandler_ argumentIndex:1 ofReply:0];

  uint32_t v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_msgSend(v27, "setWithObjects:", v28, v29, v30, v31, v32, objc_opt_class(), 0);
  [v0 setClasses:v33 forSelector:sel_getDiagnosticAttributesForItems_completionHandler_ argumentIndex:0 ofReply:1];

  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  v40 = objc_msgSend(v34, "setWithObjects:", v35, v36, v37, v38, v39, objc_opt_class(), 0);
  [v0 setClasses:v40 forSelector:sel_getDiagnosticAttributesForItems_completionHandler_ argumentIndex:1 ofReply:1];

  v41 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  uint8_t v49 = objc_msgSend(v41, "setWithObjects:", v42, v43, v44, v45, v46, v47, v48, objc_opt_class(), 0);
  v50 = [v49 setByAddingObject:objc_opt_class()];
  [v0 setClasses:v50 forSelector:sel_listAvailableTestingOperationsWithCompletionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v51 = [v49 setByAddingObject:objc_opt_class()];
  [v0 setClasses:v51 forSelector:sel_runTestingOperations_completionHandler_ argumentIndex:0 ofReply:0];

  v58[0] = objc_opt_class();
  v58[1] = objc_opt_class();
  long long v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  long long v53 = [v49 setByAddingObjectsFromArray:v52];
  [v0 setClasses:v53 forSelector:sel_runTestingOperations_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v54 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6DF200];
  [v0 setInterface:v54 forSelector:sel_subscribeToUploadProgressUpdates_completionHandler_ argumentIndex:0 ofReply:0];

  v55 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6DF200];
  [v0 setInterface:v55 forSelector:sel_subscribeToDownloadProgressUpdates_completionHandler_ argumentIndex:0 ofReply:0];

  v56 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6D1068];
  [v0 setInterface:v56 forSelector:sel_startAccessingServiceWithName_itemID_completionHandler_ argumentIndex:1 ofReply:1];

  return v0;
}

void __FPDDaemonXPCInterface_block_invoke()
{
  v109[10] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6EE180];
  id v1 = (void *)FPDDaemonXPCInterface_interface;
  FPDDaemonXPCInterface_interface = v0;

  uint64_t v2 = FPDDomainServicingXPCInterface();
  v108 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6E04A0];
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6D1068];
  uint64_t v4 = (void *)FPDDaemonXPCInterface_interface;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  [v4 setClasses:v8 forSelector:sel_providerDomainsCompletionHandler_ argumentIndex:1 ofReply:1];

  uint64_t v9 = (void *)FPDDaemonXPCInterface_interface;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v109[0] = objc_opt_class();
  v109[1] = objc_opt_class();
  v109[2] = objc_opt_class();
  v109[3] = objc_opt_class();
  v109[4] = objc_opt_class();
  v109[5] = objc_opt_class();
  v109[6] = objc_opt_class();
  v109[7] = objc_opt_class();
  v109[8] = objc_opt_class();
  v109[9] = objc_opt_class();
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:10];
  uint64_t v12 = [v10 setWithArray:v11];
  [v9 setClasses:v12 forSelector:sel_valuesForAttributes_forItemAtURL_completionHandler_ argumentIndex:0 ofReply:1];

  [(id)FPDDaemonXPCInterface_interface setInterface:v2 forSelector:sel_fetchDomainServicerForProviderDomainID_handler_ argumentIndex:0 ofReply:1];
  [(id)FPDDaemonXPCInterface_interface setInterface:v3 forSelector:sel_startAccessingServiceForItemID_completionHandler_ argumentIndex:1 ofReply:1];
  [(id)FPDDaemonXPCInterface_interface setInterface:v3 forSelector:sel_startAccessingServiceWithName_itemURL_completionHandler_ argumentIndex:1 ofReply:1];
  uint64_t v13 = (void *)FPDDaemonXPCInterface_interface;
  uint64_t v14 = FPXOperationServiceXPCInterface();
  [v13 setInterface:v14 forSelector:sel_startAccessingOperationServiceForProviderDomainID_handler_ argumentIndex:0 ofReply:1];

  [(id)FPDDaemonXPCInterface_interface setInterface:v3 forSelector:sel_startAccessingExtensionForProviderDomainID_handler_ argumentIndex:1 ofReply:1];
  [(id)FPDDaemonXPCInterface_interface setInterface:v3 forSelector:sel_startAccessingOperationServiceForProviderDomainID_handler_ argumentIndex:2 ofReply:1];
  uint64_t v15 = (void *)FPDDaemonXPCInterface_interface;
  uint64_t v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6EE2A0];
  [v15 setInterface:v16 forSelector:sel_wakeUpForURL_completionHandler_ argumentIndex:1 ofReply:1];

  uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  [v108 setClasses:v19 forSelector:sel_observePresentedFilesDidChange_ argumentIndex:0 ofReply:0];

  [v2 setInterface:v108 forSelector:sel__t_setFilePresenterObserver_ argumentIndex:0 ofReply:0];
  long long v20 = (void *)FPDDaemonXPCInterface_interface;
  uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v20 setClasses:v23 forSelector:sel_getDomainsForProviderIdentifier_completionHandler_ argumentIndex:1 ofReply:1];

  uint64_t v24 = (void *)FPDDaemonXPCInterface_interface;
  uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v24 setClasses:v25 forSelector:sel_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v26 = (void *)FPDDaemonXPCInterface_interface;
  uint32_t v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  [v26 setClasses:v29 forSelector:sel_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler_ argumentIndex:1 ofReply:1];

  uint64_t v30 = (void *)FPDDaemonXPCInterface_interface;
  uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  v34 = objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
  [v30 setClasses:v34 forSelector:sel_fetchFSItemsForItemIdentifiers_providerIdentifier_domainIdentifier_materializingIfNeeded_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v35 = (void *)FPDDaemonXPCInterface_interface;
  uint64_t v36 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  [v35 setClasses:v38 forSelector:sel_forceIngestionForItemIDs_completionHandler_ argumentIndex:0 ofReply:0];

  uint64_t v39 = (void *)FPDDaemonXPCInterface_interface;
  v40 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_msgSend(v40, "setWithObjects:", v41, v42, objc_opt_class(), 0);
  [v39 setClasses:v43 forSelector:sel_forceIngestionForItemIDs_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v44 = (void *)FPDDaemonXPCInterface_interface;
  uint64_t v45 = FPDaemonActionOperationXPCInterface();
  [v44 setInterface:v45 forSelector:sel_scheduleActionOperationWithInfo_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v46 = (void *)FPDDaemonXPCInterface_interface;
  uint64_t v47 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v48 = objc_opt_class();
  uint8_t v49 = objc_msgSend(v47, "setWithObjects:", v48, objc_opt_class(), 0);
  [v46 setClasses:v49 forSelector:sel_fetchDaemonOperationIDsWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v50 = (void *)FPDDaemonXPCInterface_interface;
  uint64_t v51 = FPDaemonActionOperationXPCInterface();
  [v50 setInterface:v51 forSelector:sel_fetchDaemonOperationWithID_completionHandler_ argumentIndex:0 ofReply:1];

  long long v52 = (void *)FPDDaemonXPCInterface_interface;
  long long v53 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v54 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  uint64_t v57 = objc_msgSend(v53, "setWithObjects:", v54, v55, v56, objc_opt_class(), 0);
  [v52 setClasses:v57 forSelector:sel_fetchListOfMonitoredApps_ argumentIndex:0 ofReply:1];

  uint64_t v58 = (void *)FPDDaemonXPCInterface_interface;
  v59 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v60 = objc_opt_class();
  uint64_t v61 = objc_msgSend(v59, "setWithObjects:", v60, objc_opt_class(), 0);
  [v58 setClasses:v61 forSelector:sel_makeTopologicallySortedItemsOnDisk_completionHandler_ argumentIndex:0 ofReply:0];

  uint64_t v62 = (void *)FPDDaemonXPCInterface_interface;
  v63 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v64 = objc_opt_class();
  uint64_t v65 = objc_opt_class();
  unint64_t v66 = objc_msgSend(v63, "setWithObjects:", v64, v65, objc_opt_class(), 0);
  [v62 setClasses:v66 forSelector:sel_makeTopologicallySortedItemsOnDisk_completionHandler_ argumentIndex:0 ofReply:1];

  v67 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6CF1B8];
  FPSetOperationClientOnXPCInterface(v67);
  [(id)FPDDaemonXPCInterface_interface setInterface:v67 forSelector:sel_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler_ argumentIndex:0 ofReply:0];
  objc_msgSend((id)FPDDaemonXPCInterface_interface, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1EF6EE240), sel_fetchAccessServicer_, 0, 1);
  v68 = (void *)FPDDaemonXPCInterface_interface;
  v69 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v70 = objc_opt_class();
  v71 = objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
  [v68 setClasses:v71 forSelector:sel_copyDatabaseForFPCKStartingAtPath_completionHandler_ argumentIndex:0 ofReply:1];

  v72 = (void *)FPDDaemonXPCInterface_interface;
  v73 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6EE1E0];
  [v72 setInterface:v73 forSelector:sel_forceIndexingInForeground_completionHandler_ argumentIndex:0 ofReply:1];

  v74 = (void *)FPDDaemonXPCInterface_interface;
  v75 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6DB780];
  [v74 setInterface:v75 forSelector:sel_fetchAndStartEnumeratingWithSettings_observer_completionHandler_ argumentIndex:1 ofReply:0];

  v76 = (void *)FPDDaemonXPCInterface_interface;
  v77 = FPXEnumeratorXPCInterface();
  [v76 setInterface:v77 forSelector:sel_fetchAndStartEnumeratingWithSettings_observer_completionHandler_ argumentIndex:0 ofReply:1];

  [(id)FPDDaemonXPCInterface_interface setInterface:v3 forSelector:sel_fetchAndStartEnumeratingWithSettings_observer_completionHandler_ argumentIndex:1 ofReply:1];
  v78 = (void *)FPDDaemonXPCInterface_interface;
  v79 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v80 = objc_opt_class();
  v81 = objc_msgSend(v79, "setWithObjects:", v80, objc_opt_class(), 0);
  [v78 setClasses:v81 forSelector:sel_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler_ argumentIndex:5 ofReply:0];

  v82 = (void *)FPDDaemonXPCInterface_interface;
  v83 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v84 = objc_opt_class();
  v85 = objc_msgSend(v83, "setWithObjects:", v84, objc_opt_class(), 0);
  [v82 setClasses:v85 forSelector:sel_detachKnownFolders_completionHandler_ argumentIndex:0 ofReply:0];

  v86 = (void *)FPDDaemonXPCInterface_interface;
  v87 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v88 = objc_opt_class();
  v89 = objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
  [v86 setClasses:v89 forSelector:sel_attachKnownFolders_options_completionHandler_ argumentIndex:0 ofReply:0];

  v90 = (void *)FPDDaemonXPCInterface_interface;
  v91 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v92 = objc_opt_class();
  v93 = objc_msgSend(v91, "setWithObjects:", v92, objc_opt_class(), 0);
  [v90 setClasses:v93 forSelector:sel_fetchPathComponentsForURL_completionHandler_ argumentIndex:0 ofReply:1];

  v94 = (void *)FPDDaemonXPCInterface_interface;
  v95 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v96 = objc_opt_class();
  v97 = objc_msgSend(v95, "setWithObjects:", v96, objc_opt_class(), 0);
  [v94 setClasses:v97 forSelector:sel_listPausedURLsWithBundleID_completionHandler_ argumentIndex:0 ofReply:1];

  v98 = (void *)FPDDaemonXPCInterface_interface;
  v99 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v100 = objc_opt_class();
  v101 = objc_msgSend(v99, "setWithObjects:", v100, objc_opt_class(), 0);
  [v98 setClasses:v101 forSelector:sel_fetchLatestVersionForItemAtURL_bundleID_completionHandler_ argumentIndex:1 ofReply:1];

  v102 = (void *)FPDDaemonXPCInterface_interface;
  v103 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v104 = objc_opt_class();
  uint64_t v105 = objc_opt_class();
  uint64_t v106 = objc_opt_class();
  v107 = objc_msgSend(v103, "setWithObjects:", v104, v105, v106, objc_opt_class(), 0);
  [v102 setClasses:v107 forSelector:sel__test_getDBQueryStatistics_queryPlan_completionHandler_ argumentIndex:0 ofReply:1];
}

id FPDaemonActionOperationXPCInterface()
{
  if (FPDaemonActionOperationXPCInterface_once != -1) {
    dispatch_once(&FPDaemonActionOperationXPCInterface_once, &__block_literal_global_392);
  }
  uint64_t v0 = (void *)FPDaemonActionOperationXPCInterface_interface;

  return v0;
}

void FPSetOperationClientOnXPCInterface(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F29280];
  id v2 = a1;
  id v3 = [v1 interfaceWithProtocol:&unk_1EF6CF0F0];
  [v2 setInterface:v3 forSelector:sel_setCancellationHandler_ argumentIndex:0 ofReply:0];

  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setClasses:v10 forSelector:sel_operationDidProgressWithInfo_error_completionHandler_ argumentIndex:0 ofReply:0];
}

id FPXEnumeratorXPCInterface()
{
  if (FPXEnumeratorXPCInterface_once != -1) {
    dispatch_once(&FPXEnumeratorXPCInterface_once, &__block_literal_global_53);
  }
  uint64_t v0 = (void *)FPXEnumeratorXPCInterface_interface;

  return v0;
}

uint64_t fpfs_pkg_is_package_item(char *a1, char *a2, char a3, unsigned char *a4, __darwin_ino64_t *a5, int a6)
{
  return fpfs_pkg_path_lookup(a1, a2, a3, 0, a4, a5, a6);
}

void sub_1A33CE74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29,char a30)
{
  _FPRestorePersona((void *)(v30 - 184));
  _Unwind_Resume(a1);
}

void sub_1A33CECE8(_Unwind_Exception *a1)
{
  __fp_pop_log((void **)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A33CEF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void fp_dispatch_async_with_logs(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = fpfs_current_log();
  uint64_t section = __fp_create_section();
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    fp_dispatch_async_with_logs_cold_1(v3);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __fp_dispatch_async_with_logs_block_invoke;
  v11[3] = &unk_1E5AF32B0;
  id v12 = v5;
  uint64_t v13 = v3;
  id v14 = v4;
  uint64_t v15 = section;
  id v8 = v4;
  uint64_t v9 = v3;
  id v10 = v5;
  dispatch_async(v9, v11);
}

void sub_1A33CF28C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

os_log_t fpfs_create_log_for_provider(char *category)
{
  os_log_t v1 = os_log_create("com.apple.FileProvider", category);

  return v1;
}

__CFString *FPKnownFoldersDescription(void *a1, uint64_t a2)
{
  if (!a2)
  {
    id v4 = &stru_1EF68D1F8;
    goto LABEL_13;
  }
  uint64_t v2 = a2;
  id v3 = (__CFString *)[a1 mutableCopy];
  id v4 = v3;
  if ((v2 & 1) == 0)
  {
    if ((v2 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  [(__CFString *)v3 appendString:@"desktop"];
  unint64_t v5 = v2 & 0xFFFFFFFFFFFFFFFELL;
  if ((v2 & 2) != 0)
  {
    [(__CFString *)v4 appendString:@","];
    v2 &= ~1uLL;
LABEL_10:
    [(__CFString *)v4 appendString:@"documents"];
    v2 &= ~2uLL;
    if (!v2) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  v2 &= ~1uLL;
  if (v5)
  {
LABEL_11:
    [(__CFString *)v4 appendString:@","];
LABEL_12:
    [(__CFString *)v4 appendFormat:@"unknown(%lx)", v2];
  }
LABEL_13:

  return v4;
}

uint64_t replacePrefix(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v6 && [v5 hasPrefix:v6])
  {
    objc_msgSend(v5, "replaceCharactersInRange:withString:", 0, objc_msgSend(v6, "length"), v7);
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_1A33D0B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __fp_pop_log((void **)va);
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

id objectForKeyOfClass(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKey:a2];
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void sub_1A33D1AF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D1BE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D1DBC(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug(v1 - 24);
  _Unwind_Resume(a1);
}

void sub_1A33D23CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
}

void _FPRestorePersona(void *a1)
{
  if (*a1)
  {
    uint64_t v2 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v4 = [v2 currentPersona];

    id v3 = (id)[v4 restorePersonaWithSavedPersonaContext:*a1];
  }
}

id FPProviderNotRegistered(unint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = FPLoc(@"ProviderNotRegistered", v4, v5, v6, v7, v8, v9, v10, v14);
  id v12 = _FPProviderNotFoundErrorHelper(v11, v3, a1);

  return v12;
}

id FPLoc(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = FPLocvImpl(a1, @"FileProvider", 0, (uint64_t)&a9);

  return v9;
}

id FPLocvImpl(void *a1, void *a2, int a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = FPLocalizationBundle();
  uint64_t v10 = [v9 localizedStringForKey:v7 value:@"X" table:v8];

  if ([v10 isEqualToString:@"X"])
  {
    if (a3 {
      && (([v7 hasSuffix:@"-C"] & 1) != 0
    }
       || ([v7 hasSuffix:@"-R"] & 1) != 0
       || ([v7 hasSuffix:@".f"] & 1) != 0
       || ([v7 hasSuffix:@"(*)"] & 1) != 0
       || ([v7 containsString:@"("] != 0))
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v14 = fp_current_or_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        FPLocvImpl_cold_1((uint64_t)v7, (uint64_t)v8, v14);
      }

      uint64_t v11 = [NSString stringWithFormat:@"KEY_MISSING(%@)", v7];
    }
  }
  else
  {
    id v12 = [NSString alloc];
    uint64_t v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v11 = (void *)[v12 initWithFormat:v10 locale:v13 arguments:a4];
  }

  return v11;
}

id FPLocalizationBundle()
{
  if (FPLocalizationBundle_onceToken != -1) {
    dispatch_once(&FPLocalizationBundle_onceToken, &__block_literal_global_31);
  }
  uint64_t v0 = (void *)FPLocalizationBundle_bundle;

  return v0;
}

id _FPProviderNotFoundErrorHelper(void *a1, void *a2, unint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (a3 > 2)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderErrorDomain" code:a3 - 2014 userInfo:0];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setValue:v5 forKey:*MEMORY[0x1E4F28568]];
  if (v7) {
    [v8 setValue:v7 forKey:*MEMORY[0x1E4F28A50]];
  }
  if (v6) {
    [v8 setValue:v6 forKey:*MEMORY[0x1E4F28228]];
  }
  uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderErrorDomain" code:-2001 userInfo:v8];

  return v9;
}

void sub_1A33D2BF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FPDDaemonXPCInterface()
{
  if (FPDDaemonXPCInterface_once != -1) {
    dispatch_once(&FPDDaemonXPCInterface_once, &__block_literal_global_111_0);
  }
  uint64_t v0 = (void *)FPDDaemonXPCInterface_interface;

  return v0;
}

void sub_1A33D2E4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

id FPXVendorXPCInterface()
{
  if (FPXVendorXPCInterface_once != -1) {
    dispatch_once(&FPXVendorXPCInterface_once, &__block_literal_global_457);
  }
  uint64_t v0 = (void *)FPXVendorXPCInterface_interface;

  return v0;
}

void sub_1A33D30CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1A33D3174(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D334C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

id FPXOperationServiceXPCInterface()
{
  if (FPXOperationServiceXPCInterface_once != -1) {
    dispatch_once(&FPXOperationServiceXPCInterface_once, &__block_literal_global_536);
  }
  uint64_t v0 = (void *)FPXOperationServiceXPCInterface_interface;

  return v0;
}

void sub_1A33D38A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D3A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A33D3D70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D449C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v18 - 80));
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_1A33D488C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33D49B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A33D4A58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void fpfs_setup_log_for_invocation(void *a1, void *a2, char a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if ((a3 & 1) == 0)
  {
    uint64_t section = __fp_create_section();
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      [v5 processIdentifier];
      uint64_t v9 = FPExecutableNameForProcessIdentifier();
      int v10 = [v5 processIdentifier];
      uint64_t v11 = [v6 target];
      id v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      uint64_t v14 = NSStringFromSelector((SEL)[v6 selector]);
      int v15 = 134219266;
      uint64_t v16 = section;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 1024;
      int v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = v13;
      __int16 v23 = 2114;
      uint64_t v24 = v14;
      __int16 v25 = 1024;
      qos_class_t v26 = qos_class_self();
      _os_log_debug_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@[%d]: -[%{public}@ %{public}@] @ QoS %u", (uint8_t *)&v15, 0x36u);
    }
    objc_msgSend(v5, "fp_annotateInvocation:withLogSection:", v6, section);
  }
}

void sub_1A33D4E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v10);
  _Unwind_Resume(a1);
}

void sub_1A33D54CC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 192));
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void *FPPopLogSectionForBlock(void *result)
{
  if (result)
  {
    id v1 = result;
    uint64_t v2 = (void *)MEMORY[0x1A6248B00]();
    uint64_t v3 = objc_getAssociatedObject(v2, &kFileProviderLogSectionKey);
    uint64_t v4 = [v3 unsignedLongValue];

    id v5 = (void *)MEMORY[0x1A6248B00](v1);
    objc_setAssociatedObject(v5, &kFileProviderLogSectionKey, 0, (void *)0x301);

    return (void *)v4;
  }
  return result;
}

void sub_1A33D5B88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D5E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(v15);
  objc_destroyWeak((id *)(v17 - 72));
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

BOOL FPSearchableItemVersionReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
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
        if (v9++ >= 9)
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
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 8;
LABEL_22:
        __int16 v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 16;
    goto LABEL_22;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1A33D6088(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D6110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id fpfs_current_or_default_log()
{
  fpfs_current_log();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    if (fpfs_default_log_once != -1) {
      dispatch_once(&fpfs_default_log_once, &__block_literal_global_49);
    }
    id v0 = (id)fpfs_default_log_log;
  }

  return v0;
}

void sub_1A33D68D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D6974(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D6A14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __fp_log_adopt(void *a1, uint64_t a2)
{
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __fp_log_adopt_cold_1(a1, a2, v4);
  }
}

uint64_t __fp_log_fork(__int16 a1)
{
  uint64_t section = __fp_create_section();
  uint64_t v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __fp_log_fork_cold_1(a1, section, v3);
  }

  return section;
}

uint64_t fpfs_fileattrs_fullpath(uint64_t a1)
{
  if (!*(void *)(a1 + 272)) {
    return 0;
  }
  if (*(void *)(a1 + 264)) {
    return *(void *)(a1 + 264);
  }
  return a1 + 280;
}

void sub_1A33D7060(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D7910(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D7A64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D7C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A33D7DD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D7E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id FPItemPredicate(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __FPItemPredicate_block_invoke;
  v6[3] = &unk_1E5AF61D8;
  id v7 = v1;
  id v3 = v1;
  uint64_t v4 = [v2 predicateWithBlock:v6];

  return v4;
}

void sub_1A33D842C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A33D85CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D86DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D8C6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33D9434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MetadataUtilitiesLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __MetadataUtilitiesLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF1970;
    uint64_t v4 = 0;
    MetadataUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MetadataUtilitiesLibraryCore_frameworkLibrary;
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary) {
    MetadataUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t MetadataUtilitiesLibrary_0()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __MetadataUtilitiesLibraryCore_block_invoke_0;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF45E0;
    uint64_t v4 = 0;
    MetadataUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = MetadataUtilitiesLibraryCore_frameworkLibrary_0;
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary_0) {
    MetadataUtilitiesLibrary_cold_1_0(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t MetadataUtilitiesLibrary_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __MetadataUtilitiesLibraryCore_block_invoke_1;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF6360;
    uint64_t v4 = 0;
    MetadataUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = MetadataUtilitiesLibraryCore_frameworkLibrary_1;
  if (!MetadataUtilitiesLibraryCore_frameworkLibrary_1) {
    MetadataUtilitiesLibrary_cold_1_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

void sub_1A33DA99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A33DB034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

xattr_flags_t fpfs_xattr_is_syncable(char *a1)
{
  return (fpfs_xattr_flags_from_name(a1) >> 3) & 1;
}

xattr_flags_t fpfs_xattr_flags_from_name(char *a1)
{
  if (fpfs_xattr_flags_from_name_onceToken != -1) {
    dispatch_once(&fpfs_xattr_flags_from_name_onceToken, &__block_literal_global_46);
  }
  xattr_flags_t v2 = xattr_flags_from_name(a1);
  long long v3 = xattr_name_without_flags(a1);
  uint64_t v4 = (const char *)fpfs_xattr_flags_from_name_xattr_mods;
  if (fpfs_xattr_flags_from_name_xattr_mods)
  {
    uint64_t v5 = &off_1EB3E9480;
    do
    {
      if (*((unsigned char *)v5 - 8))
      {
        size_t v6 = strlen(v4);
        if (!strncmp(v3, v4, v6)) {
          goto LABEL_11;
        }
      }
      else if (!strcmp(v3, v4))
      {
LABEL_11:
        xattr_flags_t v2 = ((unint64_t)*(v5 - 3) | v2) & ~(unint64_t)*(v5 - 2);
        break;
      }
      id v7 = *v5;
      v5 += 4;
      uint64_t v4 = v7;
    }
    while (v7);
  }
  free(v3);
  return v2;
}

void sub_1A33DB5B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

id FPAppIdentifierFromTeamAppTuple(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 hasPrefix:@"com.apple."])
  {
    id v2 = v1;
  }
  else if ((unint64_t)[v1 length] > 0xA)
  {
    MEMORY[0x1F4188790]();
    v12[0] = 0;
    v12[1] = 0;
    int v13 = 0;
    objc_msgSend(v1, "getCharacters:range:", v12, 0, 10);
    for (uint64_t i = 0; i != 20; i += 2)
    {
      int v5 = *(unsigned __int16 *)((char *)v12 + i);
      if ((v5 - 65) >= 0x1A && (v5 - 48) >= 0xA)
      {
        id v7 = fp_current_or_default_log();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 138412290;
        id v15 = v1;
        char v8 = "[WARNING] team prefix must only contain characters in [0-9,A-Z] (%@)";
        unsigned int v9 = v7;
        uint32_t v10 = 12;
        goto LABEL_19;
      }
    }
    if ([v1 characterAtIndex:10] == 46)
    {
      id v2 = [v1 substringFromIndex:11];
      goto LABEL_21;
    }
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      char v8 = "[WARNING] team prefix must be followed by a dot.";
      unsigned int v9 = v7;
      uint32_t v10 = 2;
LABEL_19:
      _os_log_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
LABEL_20:

    id v2 = 0;
  }
  else
  {
    long long v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v1;
      _os_log_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] can't extract application ID from '%@'", buf, 0xCu);
    }

    id v2 = 0;
  }
LABEL_21:

  return v2;
}

void sub_1A33DC750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33DCCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A33DDADC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33DDC7C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33DE1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A33DE6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void fp_reachability_callback(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)MEMORY[0x1A6248870]();
  int v6 = a2 & 4;
  if ((a2 & 2) != 0)
  {
    if ((a2 & 4) == 0) {
      goto LABEL_9;
    }
    BOOL v9 = (a2 & 0x28) != 0;
    if ((a2 & 0x10) != 0) {
      BOOL v9 = 0;
    }
    if ((a2 & 0x40000) != 0 || v9)
    {
LABEL_9:
      id v7 = "";
      uint64_t v8 = 82;
    }
    else
    {
      id v7 = "un";
      uint64_t v8 = 82;
      int v6 = 1;
    }
  }
  else
  {
    id v7 = "un";
    uint64_t v8 = 45;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  *(_OWORD *)__str = 0u;
  long long v33 = 0u;
  id v10 = a3;
  uint64_t v11 = 100;
  if ((a2 & 0x20000) == 0) {
    uint64_t v11 = 45;
  }
  uint64_t v12 = 108;
  if ((a2 & 0x10000) == 0) {
    uint64_t v12 = 45;
  }
  uint64_t v30 = v12;
  uint64_t v31 = v11;
  uint64_t v13 = 68;
  if ((a2 & 0x20) == 0) {
    uint64_t v13 = 45;
  }
  uint64_t v14 = 105;
  if ((a2 & 0x10) == 0) {
    uint64_t v14 = 45;
  }
  uint64_t v28 = v14;
  uint64_t v29 = v13;
  uint64_t v15 = 67;
  if ((a2 & 8) == 0) {
    uint64_t v15 = 45;
  }
  uint64_t v16 = 99;
  if (!v6) {
    uint64_t v16 = 45;
  }
  uint64_t v27 = v15;
  uint64_t v17 = 116;
  if ((a2 & 1) == 0) {
    uint64_t v17 = 45;
  }
  uint64_t v26 = v17;
  uint64_t v18 = 87;
  if ((a2 & 0x40000) == 0) {
    uint64_t v18 = 45;
  }
  snprintf(__str, 0x80uLL, "%sreachable [%c%c %c%c%c%c%c%c%c]", v7, v18, v8, v26, v16, v27, v28, v29, v30, v31);
  __int16 v19 = fp_current_or_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    fp_reachability_callback_cold_1((uint64_t)__str, v19, v20, v21, v22, v23, v24, v25);
  }

  [v10 setReachabilityFlags:a2];
}

void sub_1A33DF960(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void __fp_dispatch_async_with_logs_block_invoke(uint64_t a1)
{
  id v2 = fpfs_adopt_log(*(void **)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 56);
  int v5 = v2;
  long long v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __fp_dispatch_async_with_logs_block_invoke_cold_1((uint64_t)&v4, a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  __fp_leave_section_Debug((uint64_t)&v4);
  __fp_pop_log(&v5);
}

void sub_1A33DFF40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

uint64_t fpfs_open(char *a1, unsigned int a2, uint64_t a3, char a4, uint64_t a5)
{
  return fpfs_openat(4294967294, a1, a2, a3, a4, a5);
}

void sub_1A33E0A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A33E2178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *location)
{
  _Block_object_dispose((const void *)(v12 - 216), 8);
  _Unwind_Resume(a1);
}

id FPDefaultFetchedAttributes()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v0 = (id *)getMDItemExpirationDateSymbolLoc_ptr;
  uint64_t v14 = getMDItemExpirationDateSymbolLoc_ptr;
  if (!getMDItemExpirationDateSymbolLoc_ptr)
  {
    id v1 = (void *)CoreSpotlightLibrary_2();
    v12[3] = (uint64_t)dlsym(v1, "MDItemExpirationDate");
    getMDItemExpirationDateSymbolLoc_ptr = v12[3];
    uint64_t v0 = (id *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v0) {
    FPDefaultFetchedAttributes_cold_1();
  }
  id v2 = *v0;
  id v15 = v2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  long long v3 = (id *)getMDQueryResultRelevanceSymbolLoc_ptr;
  uint64_t v14 = getMDQueryResultRelevanceSymbolLoc_ptr;
  if (!getMDQueryResultRelevanceSymbolLoc_ptr)
  {
    uint64_t v4 = (void *)CoreSpotlightLibrary_2();
    v12[3] = (uint64_t)dlsym(v4, "MDQueryResultRelevance");
    getMDQueryResultRelevanceSymbolLoc_ptr = v12[3];
    long long v3 = (id *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v3) {
    FPDefaultFetchedAttributes_cold_2();
  }
  id v16 = *v3;
  int v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = v16;
  uint64_t v7 = [v5 arrayWithObjects:&v15 count:2];

  uint64_t v8 = +[FPItem fp_queryFetchAttributes];
  BOOL v9 = [v7 arrayByAddingObjectsFromArray:v8];

  return v9;
}

void sub_1A33E249C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A33E390C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t CoreSpotlightLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreSpotlightLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF19A8;
    uint64_t v4 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreSpotlightLibraryCore_frameworkLibrary;
  if (!CoreSpotlightLibraryCore_frameworkLibrary) {
    CoreSpotlightLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t CoreSpotlightLibrary_0()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_1)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreSpotlightLibraryCore_block_invoke_1;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF23E0;
    uint64_t v4 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = CoreSpotlightLibraryCore_frameworkLibrary_1;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_1) {
    CoreSpotlightLibrary_cold_1_0(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t CoreSpotlightLibrary_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_2)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreSpotlightLibraryCore_block_invoke_2;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF45C8;
    uint64_t v4 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = CoreSpotlightLibraryCore_frameworkLibrary_2;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_2) {
    CoreSpotlightLibrary_cold_1_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t CoreSpotlightLibrary_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_5)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreSpotlightLibraryCore_block_invoke_5;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF5398;
    uint64_t v4 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_5 = _sl_dlopen();
  }
  uint64_t v0 = CoreSpotlightLibraryCore_frameworkLibrary_5;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_5) {
    CoreSpotlightLibrary_cold_1_2(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

void CoreSpotlightLibrary_3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_6)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __CoreSpotlightLibraryCore_block_invoke_6;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E5AF64C0;
    uint64_t v2 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_6 = _sl_dlopen();
  }
  if (!CoreSpotlightLibraryCore_frameworkLibrary_6) {
    CoreSpotlightLibrary_cold_1_3(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

id getMDItemFileItemID()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getMDItemFileItemIDSymbolLoc_ptr;
  uint64_t v7 = getMDItemFileItemIDSymbolLoc_ptr;
  if (!getMDItemFileItemIDSymbolLoc_ptr)
  {
    long long v1 = (void *)CoreSpotlightLibrary_1();
    v5[3] = (uint64_t)dlsym(v1, "MDItemFileItemID");
    getMDItemFileItemIDSymbolLoc_ptr = v5[3];
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getMDItemFileItemID_cold_1();
  }
  uint64_t v2 = *v0;

  return v2;
}

void sub_1A33E3F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCSSearchQueryContextClass_block_invoke(uint64_t a1)
{
  CoreSpotlightLibrary_0();
  Class result = objc_getClass("CSSearchQueryContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSSearchQueryContextClass_block_invoke_cold_1();
  }
  getCSSearchQueryContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchQueryContextClass_block_invoke_0(uint64_t a1)
{
  CoreSpotlightLibrary_2();
  Class result = objc_getClass("CSSearchQueryContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSSearchQueryContextClass_block_invoke_cold_1_0();
  }
  getCSSearchQueryContextClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchQueryContextClass_block_invoke_1(uint64_t a1)
{
  CoreSpotlightLibrary_3();
  Class result = objc_getClass("CSSearchQueryContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSSearchQueryContextClass_block_invoke_cold_1_1();
  }
  getCSSearchQueryContextClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchQueryClass_block_invoke(uint64_t a1)
{
  CoreSpotlightLibrary_0();
  Class result = objc_getClass("CSSearchQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSSearchQueryClass_block_invoke_cold_1();
  }
  getCSSearchQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchQueryClass_block_invoke_0(uint64_t a1)
{
  CoreSpotlightLibrary_2();
  Class result = objc_getClass("CSSearchQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSSearchQueryClass_block_invoke_cold_1_0();
  }
  getCSSearchQueryClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSSearchQueryClass_block_invoke_1(uint64_t a1)
{
  CoreSpotlightLibrary_3();
  Class result = objc_getClass("CSSearchQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSSearchQueryClass_block_invoke_cold_1_1();
  }
  getCSSearchQueryClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A33E4444(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  if (a2 == 1)
  {
    id v13 = objc_begin_catch(exception_object);
    uint64_t v14 = objc_msgSend(v12, "errorFromException:whileSendingToSelector:", v13, objc_msgSend(v11, "selector"));
    if (forwardInvocation__onceToken != -1) {
      dispatch_once(&forwardInvocation__onceToken, &__block_literal_global_20_1);
    }
    id v15 = fpfs_adopt_log((void *)forwardInvocation__exceptionLog);
    id v16 = fp_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = [v14 debugDescription];
      [(FPExceptionToErrorProxy *)v17 forwardInvocation:v16];
    }

    id v18 = fpfs_adopt_log(v15);
    __int16 v19 = [v11 methodSignature];
    uint64_t v20 = objc_msgSend(v19, "fp_indexOfLastArgumentWithType:", "@?");
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v21 = v12[2];
      if (!v21) {
        objc_exception_throw(v13);
      }
      (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v14);
    }
    else
    {
      a10 = 0;
      [v11 getArgument:&a10 atIndex:v20];
      uint64_t v22 = (void *)MEMORY[0x1A6248B00](a10);
      uint64_t v23 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:_Block_signature(v22)];
      uint64_t v24 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v23];
      objc_msgSend(v24, "fp_zeroOutReplyBlockArgumentsWithError:", v14);
      uint64_t v25 = (void *)MEMORY[0x1A6248B00](v22);
      [v24 invokeWithTarget:v25];
    }
    objc_end_catch();
    JUMPOUT(0x1A33E4404);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __FP_EXCEPTION_TO_ERROR_PROXY_CALLING_OUT__(void *a1, const char *a2)
{
  return [a1 invokeWithTarget:a2];
}

uint64_t FPFeatureFlagEbihilIsEnabled()
{
  return _os_feature_enabled_impl();
}

BOOL fpfs_filename_contains_ext(char *a1)
{
  return fpfs_extension_in_filename(a1, 0) != 0;
}

uint64_t fpfs_should_be_tracked(uint64_t a1, int a2, BOOL *a3)
{
  memset(&v8, 0, sizeof(v8));
  if (fstat(a1, &v8) < 0) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v8.st_mode & 0xF000;
  if (v6 == 0x4000) {
    return fpfs_pkg_is_package_root(a1, 0, a3, a2);
  }
  uint64_t result = 0;
  *a3 = v6 == 0x8000;
  return result;
}

uint64_t fpfs_pkg_is_package_root(uint64_t a1, char a2, unsigned char *a3, int a4)
{
  return fpfs_pkg_fd_lookup(a1, 0, a2, a3, 0, 0, a4);
}

uint64_t fpfs_openfdbyhandle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)a1)
  {
    uint64_t result = _try_openbyid(a2, *(void *)a1, a3, a4, a1);
    if ((result & 0x80000000) == 0) {
      return result;
    }
    if (*__error() != 1)
    {
LABEL_19:
      if (*(_DWORD *)(a1 + 16))
      {
        int v13 = *__error();
        if (!*(void *)(a1 + 8)) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }
      return 0xFFFFFFFFLL;
    }
    uint64_t v9 = *(void *)a1;
    v18[0] = 0;
    if ((fpfs_fsgetpath(a2, v9, (char **)v18, 0) & 0x80000000) != 0)
    {
      if (*__error() != 2 && *__error() != 1) {
        goto LABEL_17;
      }
    }
    else
    {
      pid_t v10 = getpid();
      int v11 = fpfs_lp_sandbox_check(v10, (uint64_t)"file-read-data", *MEMORY[0x1E4F14100] | 1u, (const char *)v18[0]);
      free(v18[0]);
      if (!v11)
      {
LABEL_17:
        int v14 = 1;
        goto LABEL_18;
      }
    }
    int v14 = 2;
LABEL_18:
    *__error() = v14;
    goto LABEL_19;
  }
  uint64_t v12 = *(void *)(a1 + 8);
  if (v12 && *(void *)(a1 + 24))
  {
    int v13 = 0;
    goto LABEL_21;
  }
  if (!*(_DWORD *)(a1 + 16))
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  int v13 = 0;
  if (!v12) {
    goto LABEL_23;
  }
LABEL_21:
  if (!*(void *)(a1 + 24) || (uint64_t result = _openbyparentidandname_retry(a2, a3, a4, a1), (result & 0x80000000) != 0))
  {
LABEL_23:
    if (*(_DWORD *)(a1 + 16))
    {
      id v15 = (void *)GSLibraryResolveDocumentId2();
      if (v15)
      {
        if (v15 != *(void **)a1)
        {
          long long v16 = *(_OWORD *)(a1 + 16);
          *(_OWORD *)id v18 = *(_OWORD *)a1;
          long long v19 = v16;
          uint64_t v17 = *(void *)(a1 + 32);
          v18[0] = v15;
          v18[1] = 0;
          *((void *)&v19 + 1) = 0;
          uint64_t v20 = v17;
          return fpfs_openfdbyhandle(v18, a2, a3, a4);
        }
        *__error() = v13;
      }
    }
    else if (!*__error())
    {
      fpfs_openfdbyhandle_cold_1();
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _try_openbyid(uint64_t a1, uint64_t a2, unsigned int a3, char a4, uint64_t a5)
{
  if (a3) {
    unsigned int v10 = a3;
  }
  else {
    unsigned int v10 = 0x8000;
  }
  int v11 = v10 | ~(v10 >> 13) & 0x100 | 4;
  v18[0] = a1;
  uint64_t v12 = openbyid_np();
  if ((v12 & 0x80000000) != 0)
  {
    int v14 = __error();
    if ((a3 & 3) != 0 && (a4 & 2) != 0 && *v14 == 21) {
      return _try_openbyid(a1, a2, a3 & 0xFFFFFFFC, 0, a5);
    }
    if (*__error() != 63 || !fpfs_supports_long_paths())
    {
      if (*__error() == 22 && fpfs_supports_long_paths())
      {
        *__error() = 63;
      }
      else if (!*__error())
      {
        _try_openbyid_cold_1();
      }
      return 0xFFFFFFFFLL;
    }
    uint64_t v12 = _openbyid_longpaths(a1, a2, v11);
    if ((v12 & 0x80000000) != 0)
    {
      id v15 = __error();
      if ((a3 & 3) != 0 && (a4 & 2) != 0 && *v15 == 21)
      {
        unsigned int v16 = a3 & 0xFFFFFFFC;
        if ((a3 & 0xFFFFFFFC) == 0) {
          unsigned int v16 = 0x8000;
        }
        uint64_t v12 = _openbyid_longpaths(a1, a2, v16 | ~(v16 >> 13) & 0x100 | 4);
        if ((v12 & 0x80000000) != 0) {
          return 0xFFFFFFFFLL;
        }
      }
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = ___validate_file_openbyid_block_invoke;
  v18[3] = &__block_descriptor_44_e34_i16__0__fpfs_item_handle_QQII_iI_8l;
  v18[4] = a5;
  int v19 = v12;
  if (fpfs_fgethandle(v12, v18))
  {
    int v13 = *__error();
    close(v12);
    *__error() = v13;
    return 0xFFFFFFFFLL;
  }
  return v12;
}

uint64_t fpfs_fgethandle(int a1, void *a2)
{
  v13[96] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  bzero(&v10, 0x328uLL);
  long long v6 = xmmword_1A34E49F0;
  uint64_t v7 = 0;
  if (fgetattrlist(a1, &v6, &v10, 0x328uLL, 0x20u)) {
    goto LABEL_2;
  }
  long long v8 = v10;
  *(_OWORD *)uint64_t v9 = v11;
  *(void *)&v9[16] = v12;
  if (HIDWORD(v10) != 1)
  {
    if (HIDWORD(v10) == 2)
    {
      if ((fpfs_pkg_dirstat(a1, 0, v9) & 0x80000000) != 0 && *__error() != 45)
      {
LABEL_2:
        uint64_t v4 = 0xFFFFFFFFLL;
        goto LABEL_12;
      }
    }
    else
    {
      *(_DWORD *)&v9[4] = 0;
    }
  }
  uint64_t v12 = 0;
  long long v11 = (unint64_t)vrev64_s32(*(int32x2_t *)v9);
  long long v10 = *(_OWORD *)&v9[8];
  if (DWORD2(v8) <= 0x300)
  {
    *((void *)&v11 + 1) = v13;
    __memmove_chk();
  }
  uint64_t v4 = v3[2](v3, &v10);
LABEL_12:

  return v4;
}

uint64_t fpfs_pkg_dirstat(int a1, void *a2, _DWORD *a3)
{
  char v7 = 0;
  if ((fpfs_pkg_is_demoted(a1, &v7) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v7)
  {
    *__error() = 45;
    return 0xFFFFFFFFLL;
  }

  return fpfs_get_dirstat(a1, a2, a3, 0);
}

uint64_t fpfs_pkg_get_bundle_bit(int a1, BOOL *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(v6, 0, sizeof(v6));
  v5[0] = 0;
  v5[1] = 0;
  fpfs_get_finder_info_buffer(a1, v6);
  if (v3 < 0) {
    return 0xFFFFFFFFLL;
  }
  fpfs_finder_info_deserialize((uint64_t)v6, (uint64_t)v5);
  uint64_t result = 0;
  *a2 = (v5[0] & 2) != 0;
  return result;
}

uint64_t __fpfs_fchdir_block_invoke(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x1A6248E30](*(unsigned int *)(a1 + 40)) & 0x80000000) != 0)
  {
    int v5 = *__error();
    MEMORY[0x1A6248E30](a2);
    *__error() = v5;
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    if ((v4 & 0x80000000) != 0)
    {
      int v6 = *__error();
      MEMORY[0x1A6248E30](a2);
      *__error() = v6;
    }
    else if ((int)MEMORY[0x1A6248E30](a2) < 0)
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return v4;
    }
  }
  return v4;
}

uint64_t __fpfs_pkg_fd_lookup_block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  bzero(v6, 0x2FEuLL);
  if (*(void *)(a1 + 32))
  {
    __strlcpy_chk();
    return fpfs_pkg_path_lookup(v6, 0, *(unsigned char *)(a1 + 72), *(unsigned char **)(a1 + 40), *(unsigned char **)(a1 + 48), *(__darwin_ino64_t **)(a1 + 56), *(_DWORD *)(a1 + 68));
  }
  int v3 = *(_DWORD *)(a1 + 64);
  long long v4 = xmmword_1A34E4A50;
  uint64_t v5 = 0;
  bzero(v7, 0x30CuLL);
  if ((fgetattrlist(v3, &v4, v7, 0x30CuLL, 0) & 0x80000000) == 0)
  {
    if (v8 < 0x2FF)
    {
      if ((unint64_t)__strlcpy_chk() < 0x2FE) {
        return fpfs_pkg_path_lookup(v6, 0, *(unsigned char *)(a1 + 72), *(unsigned char **)(a1 + 40), *(unsigned char **)(a1 + 48), *(__darwin_ino64_t **)(a1 + 56), *(_DWORD *)(a1 + 68));
      }
    }
    else
    {
      *__error() = 63;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_pkg_path_lookup(char *a1, char *a2, char a3, unsigned char *a4, unsigned char *a5, __darwin_ino64_t *a6, int a7)
{
  int v13 = fpfs_path_relative_to(a1, a2);
  if (!v13 || !*v13) {
    return 0;
  }

  return fpfs_pkg_relative_path_lookup(v13, a2, a3, a4, a5, a6, a7);
}

const char *fpfs_path_relative_to(char *__s, const char *a2)
{
  uint64_t v2 = __s;
  if (__s && a2)
  {
    size_t v4 = strlen(__s);
    size_t v5 = strlen(a2);
    if (v5 <= v4 && (size_t v6 = v5, !strncmp(a2, v2, v5)))
    {
      if (v2[v6] == 47) {
        v2 += v6 + 1;
      }
      else {
        v2 += v6;
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t fpfs_fgetfileattrs()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  int v5 = v0;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = v6;
  bzero(v22, 0x800uLL);
  bzero(v17, 0x800uLL);
  uint64_t v14 = 0;
  if ((fpfs_fget_parent_syncroot(v5, &v14) & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (v4)
  {
    uint64_t v8 = v14;
    if (v14)
    {
      if (v14 != v4)
      {
        LOBYTE(v13) = 0;
        memset(&v16, 0, sizeof(v16));
        if ((fstat(v5, &v16) & 0x80000000) == 0 && (v16.st_flags & 0x40000000) == 0)
        {
          v15[0] = (char *)MEMORY[0x1E4F143A8];
          v15[1] = (char *)3221225472;
          v15[2] = (char *)__fpfs_fget_ignore_item_block_invoke;
          v15[3] = (char *)&__block_descriptor_40_e8_i12__0i8l;
          void v15[4] = (char *)&v13;
          if (!fpfs_openbyid(v16.st_dev, v8, 0x8000, (uint64_t)v15))
          {
            if ((_BYTE)v13)
            {
              *__error() = 6;
LABEL_22:
              uint64_t additional_attrs = 0xFFFFFFFFLL;
              goto LABEL_23;
            }
          }
        }
      }
    }
  }
  uint64_t v20 = 0;
  *(_OWORD *)&v16.st_dev = xmmword_1A34E4A08;
  *(void *)&v16.st_uid = 0x20000000205;
  int v9 = fgetattrlist(v5, &v16, v22, 0x800uLL, 0x28u);
  if (v9)
  {
    if (*__error() != 28) {
      goto LABEL_22;
    }
    if (!fpfs_supports_long_paths()) {
      goto LABEL_22;
    }
    *(_DWORD *)&v16.st_mode &= ~0x8000000u;
    if (fgetattrlist(v5, &v16, v22, 0x800uLL, 0x28u)) {
      goto LABEL_22;
    }
    if ((_parse_fileattrs((uint64_t)v22, 2048, (uint64_t)v17) & 0x80000000) != 0) {
      goto LABEL_22;
    }
    v15[0] = 0;
    size_t v13 = 0;
    if (fpfs_fsgetpath(v18, v17[0], v15, &v13)) {
      goto LABEL_22;
    }
    uint64_t v20 = v15[0];
    size_t v21 = v13;
  }
  else
  {
    if ((_parse_fileattrs((uint64_t)v22, 2048, (uint64_t)v17) & 0x80000000) != 0) {
      goto LABEL_22;
    }
    uint64_t v20 = 0;
  }
  uint64_t v19 = v14;
  id v12 = v7;
  uint64_t additional_attrs = fpfs_load_additional_attrs(v5, (uint64_t)v17, v2);
  if (v9) {
    free(v20);
  }

LABEL_23:
  return additional_attrs;
}

uint64_t fpfs_load_additional_attrs(int a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a2 + 44);
  long long v7 = *(_OWORD *)(a2 + 216);
  long long v39 = *(_OWORD *)(a2 + 200);
  long long v40 = v7;
  long long v8 = *(_OWORD *)(a2 + 248);
  long long v41 = *(_OWORD *)(a2 + 232);
  long long v42 = v8;
  long long v9 = *(_OWORD *)(a2 + 152);
  v36[1] = *(_OWORD *)(a2 + 136);
  v36[2] = v9;
  long long v10 = *(_OWORD *)(a2 + 184);
  long long v37 = *(_OWORD *)(a2 + 168);
  long long v38 = v10;
  long long v11 = *(_OWORD *)(a2 + 88);
  long long v33 = *(_OWORD *)(a2 + 72);
  long long v34 = v11;
  long long v12 = *(_OWORD *)(a2 + 120);
  long long v35 = *(_OWORD *)(a2 + 104);
  v36[0] = v12;
  long long v13 = *(_OWORD *)(a2 + 56);
  long long v31 = *(_OWORD *)(a2 + 40);
  long long v32 = v13;
  int v14 = v31;
  if ((v31 & 0xFFFFFFFE) == 2)
  {
    LODWORD(v30[0]) = 0;
    if ((fpfs_pkg_is_package_root2(a1, *(char **)(a2 + 24), (int *)v30, *(_DWORD *)(a3 + 8)) & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
    if ((v30[0] & 0xA) != 0) {
      int v15 = 3;
    }
    else {
      int v15 = 2;
    }
    if ((v30[0] & 4) != 0) {
      int v14 = 2;
    }
    else {
      int v14 = v15;
    }
    LODWORD(v31) = v14;
  }
  if ((v14 | 2) == 3) {
    int is_safe_save_temp_filename = fpfs_path_is_safe_save_temp_filename(*(char **)(a2 + 24), v14 == 1);
  }
  else {
    int is_safe_save_temp_filename = 0;
  }
  DWORD2(v42) = is_safe_save_temp_filename;
  v30[0] = 0;
  v30[1] = 0;
  BYTE1(v30[0]) = BYTE4(v42);
  if ((v6 & 0x2000) != 0)
  {
    unsigned int v17 = DWORD1(v31) & 0xFFFFEFFF;
    DWORD1(v31) = v17;
    if ((v17 & 0x20) == 0) {
      goto LABEL_15;
    }
LABEL_21:
    uint64_t v29 = 0;
    if ((fpfs_eviction_urgency(a1, &v29) & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
    DWORD1(v31) = DWORD1(v31) & 0xFFFFFFDF | (32 * (v29 != 0));
    *((void *)&v41 + 1) = v29;
    if ((BYTE4(v31) & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  if ((fpfs_get_tag_data(a1, (uint64_t)v30, (uint64_t)v36) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  DWORD1(v31) &= ~0x1000u;
  if (fpfs_get_last_use_date(a1, (uint64_t *)&v34 + 1, 0) == 1) {
    DWORD1(v31) |= 0x1000u;
  }
  fpfs_get_favorite_rank(a1, (unint64_t *)&v35 + 1);
  LOBYTE(v17) = BYTE4(v31);
  if ((BYTE4(v31) & 0x20) != 0) {
    goto LABEL_21;
  }
LABEL_15:
  if (v17)
  {
LABEL_23:
    LODWORD(v29) = 0;
    if ((fpfs_eviction_reason(a1, &v29) & 0x80000000) == 0)
    {
      LODWORD(v42) = v29;
      goto LABEL_25;
    }
    return 0xFFFFFFFFLL;
  }
LABEL_25:
  int v18 = 0;
  LOBYTE(v29) = 0;
  if ((v6 & 0x2000) == 0)
  {
    fpfs_get_is_ignore_root(a1, (BOOL *)&v29);
    int v18 = v29 << 9;
  }
  unsigned int v19 = DWORD1(v31) & 0xFFFFFDFF | v18;
  DWORD1(v31) = v19;
  unsigned __int8 v28 = 0;
  if (*(unsigned char *)(a3 + 12) && (v6 & 0x2000) == 0)
  {
    fpfs_get_is_pinned(a1, (char *)&v28);
    DWORD1(v31) = DWORD1(v31) & 0xFFFFFF7F | (v28 << 7);
    unsigned __int8 v27 = 0;
LABEL_33:
    *((void *)&v37 + 1) = fpfs_copy_before_bounce_filename(a1);
    if (fpfs_is_resurrected(a1)) {
      int v23 = 1024;
    }
    else {
      int v23 = 0;
    }
    DWORD1(v31) = DWORD1(v31) & 0xFFFFFBFF | v23;
    uint64_t v24 = fpfs_copy_collaboration_identifier(a1);
    int v25 = 0;
    *(void *)&long long v40 = v24;
    if (v31 == 2)
    {
      fpfs_is_detached_root(a1, (char *)&v27);
      int v25 = v27 << 14;
    }
    DWORD1(v31) = DWORD1(v31) & 0xFFFFBFFF | v25;
    HIBYTE(v26) = 0;
    fpfs_get_is_sync_paused(a1, (char *)&v26 + 1);
    DWORD1(v31) = DWORD1(v31) & 0xFFFF7FFF | (HIBYTE(v26) << 15);
    LOBYTE(v26) = 0;
    fpfs_get_is_sync_resuming_with_drop_local_changes(a1, (char *)&v26);
    unsigned int v22 = DWORD1(v31);
    int v21 = v26 << 16;
    goto LABEL_39;
  }
  DWORD1(v31) = v19 & 0xFFFFFF7F;
  unsigned __int8 v27 = 0;
  if ((v6 & 0x2000) == 0) {
    goto LABEL_33;
  }
  int v21 = 0;
  __int16 v26 = 0;
  unsigned int v22 = v19 & 0xFFFF3F7F;
LABEL_39:
  DWORD1(v31) = v22 & 0xFFFEFFFF | v21;
  return fpfs_get_syncable_xattrs();
}

uint64_t fpfs_get_syncable_xattrs()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  char v4 = v3;
  int v5 = v0;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v7 = (unsigned int (**)(id, char *))v6;
  id v8 = v2;
  bzero(namebuff, 0x8000uLL);
  if (v4)
  {
    id v26 = v8;
LABEL_3:
    long long v9 = 0;
LABEL_4:
    id v8 = v26;
    uint64_t v10 = (*((uint64_t (**)(id, void *))v26 + 2))(v26, v9);
    int v11 = *__error();
    long long v12 = v9;
    if (v9)
    {
      do
      {
LABEL_5:
        long long v13 = (void *)*v12;
        free(v12);
        long long v12 = v13;
      }
      while (v13);
    }
    goto LABEL_10;
  }
  unint64_t v14 = flistxattr(v5, namebuff, 0x8000uLL, 0);
  if ((v14 & 0x8000000000000000) != 0)
  {
    uint64_t v10 = 0xFFFFFFFFLL;
    goto LABEL_11;
  }
  if (v14 <= 0x8000)
  {
    id v26 = v8;
    if (v14)
    {
      long long v9 = 0;
      uint64_t v16 = 0;
      unsigned int v17 = &namebuff[v14];
      int v18 = namebuff;
      while (1)
      {
        size_t v19 = strlen(v18);
        if (v7[2](v7, v18))
        {
          ssize_t v20 = fgetxattr(v5, v18, 0, 0, 0, 0);
          if ((v20 & 0x8000000000000000) == 0)
          {
            size_t v21 = v20;
            size_t v22 = v20 + v19;
            if (v20 + v19 <= 0x8000)
            {
              uint64_t v23 = v22 + v16;
              if (v22 + v16 <= 0x8000)
              {
                long long v12 = malloc_type_malloc(v20 + 24, 0x7D01F663uLL);
                void *v12 = v9;
                v12[1] = v18;
                void v12[2] = v21;
                *__error() = 0;
                if (fgetxattr(v5, v18, v12 + 3, v21, 0, 0) != v21)
                {
                  int v24 = *__error();
                  if (v24) {
                    int v25 = v24;
                  }
                  else {
                    int v25 = 22;
                  }
                  *__error() = v25;
                  int v11 = *__error();
                  uint64_t v10 = 0xFFFFFFFFLL;
                  id v8 = v26;
                  goto LABEL_5;
                }
                long long v9 = v12;
                uint64_t v16 = v23;
              }
            }
          }
        }
        v18 += v19 + 1;
        if (v18 >= v17) {
          goto LABEL_4;
        }
      }
    }
    goto LABEL_3;
  }
  uint64_t v10 = 0xFFFFFFFFLL;
  int v11 = 12;
LABEL_10:
  *__error() = v11;
LABEL_11:

  return v10;
}

uint64_t fpfs_fget_parent_syncroot(int a1, void *a2)
{
  uint64_t v4 = 0;
  if (ffsctl(a1, 0x40084A4AuLL, &v4, 0) < 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  if (a2) {
    *a2 = v4;
  }
  return result;
}

uint64_t _parse_fileattrs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  int v6 = *(_DWORD *)(a1 + 4);
  if ((v6 & 0x8000000) == 0) {
    goto LABEL_8;
  }
  long long v7 = (const void *)(a1 + 140 + *(int *)(a1 + 140));
  uint64_t v8 = *(unsigned int *)(a1 + 144);
  if ((unint64_t)v7 + v8 > a1 + a2)
  {
    int v9 = 55;
LABEL_6:
    *__error() = v9;
    if ((*(unsigned char *)(a1 + 4) & 1) == 0) {
      return 0xFFFFFFFFLL;
    }
    *__error() = 0;
    int v6 = *(_DWORD *)(a1 + 4);
LABEL_8:
    if ((v6 & 1) == 0)
    {
      long long v7 = 0;
      goto LABEL_10;
    }
    uint64_t v10 = (const void *)(a1 + 24 + *(int *)(a1 + 24));
    uint64_t v13 = *(unsigned int *)(a1 + 28);
    if ((unint64_t)v10 + v13 <= a1 + a2)
    {
      if (v13 < 0x6E9)
      {
        long long v7 = 0;
        goto LABEL_11;
      }
      int v14 = 40;
    }
    else
    {
      int v14 = 55;
    }
    *__error() = v14;
    return 0xFFFFFFFFLL;
  }
  if (v8 >= 0x6E9)
  {
    int v9 = 40;
    goto LABEL_6;
  }
LABEL_10:
  uint64_t v10 = 0;
LABEL_11:
  if ((v6 & 0x2000000) == 0 || !*(void *)(a1 + 124))
  {
    *__error() = 70;
    long long v12 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 124);
      int v26 = *(_DWORD *)(a1 + 4) & 0x2000000;
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v26;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v7;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v10;
      _os_log_error_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_ERROR, "ESTALE: getdirentries should skip entries [%llu, %u, %s, %s]", buf, 0x26u);
    }

    return 0xFFFFFFFFLL;
  }
  memset(v45, 0, sizeof(v45));
  long long v43 = 0u;
  long long v44 = 0u;
  memset(buf, 0, sizeof(buf));
  __memcpy_chk();
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  *(_OWORD *)(a3 + 144) = 0u;
  *(_OWORD *)(a3 + 160) = 0u;
  *(_OWORD *)(a3 + 176) = 0u;
  *(_OWORD *)(a3 + 192) = 0u;
  *(_OWORD *)(a3 + 208) = 0u;
  *(_OWORD *)(a3 + 224) = 0u;
  *(_OWORD *)(a3 + 240) = 0u;
  *(_OWORD *)(a3 + 256) = 0u;
  *(void *)(a3 + 272) = 0;
  int v11 = *(_DWORD *)&buf[4];
  if ((buf[4] & 2) != 0)
  {
    *(_DWORD *)(a3 + 32) = *(_DWORD *)&buf[32];
    if ((v11 & 0x100000) == 0)
    {
LABEL_15:
      if ((v11 & 0x2000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_DWORD *)&buf[4] & 0x100000) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(a3 + 16) = *(_DWORD *)&v45[8];
  if ((v11 & 0x2000000) == 0)
  {
LABEL_16:
    if ((v11 & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(void *)a3 = *(void *)&v45[12];
  if ((v11 & 0x80000) == 0)
  {
LABEL_17:
    if ((v11 & 0x4000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(a3 + 20) = *(_DWORD *)&v45[4];
  if ((v11 & 0x4000000) == 0)
  {
LABEL_18:
    if ((v11 & 0x8000000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(void *)(a3 + 8) = *(void *)&v45[20];
  if ((v11 & 0x8000000) != 0)
  {
LABEL_19:
    if (!v7) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(_OWORD *)&v45[52] = *(_OWORD *)&v45[44];
  *(_OWORD *)&v45[36] = *(_OWORD *)&v45[28];
  if (!v7) {
    goto LABEL_38;
  }
LABEL_36:
  if ((v11 & 0x8000001) == 0x8000001)
  {
    size_t v16 = *(unsigned int *)&v45[32];
    *(void *)(a3 + 272) = *(unsigned int *)&v45[32];
    memmove((void *)(a3 + 280), v7, v16);
    uint64_t v17 = a3 + 280 + v16 - *(unsigned int *)&buf[28];
    goto LABEL_42;
  }
LABEL_38:
  if (v11)
  {
    *(void *)(a3 + 272) = 0;
    uint64_t v17 = a3 + 280;
    memmove((void *)(a3 + 280), v10, *(unsigned int *)&buf[28]);
  }
  else
  {
    uint64_t v17 = 0;
  }
LABEL_42:
  *(void *)(a3 + 24) = v17;
  v27[0] = 0;
  long long v28 = 0u;
  WORD2(v27[0]) = WORD6(v44);
  v27[1] = 0;
  int v37 = 0;
  int v38 = *(_DWORD *)v45;
  LODWORD(v28) = DWORD2(v44);
  DWORD2(v28) = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  long long v31 = *(_OWORD *)&buf[56];
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  long long v34 = *(_OWORD *)&buf[40];
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  if (*(_DWORD *)&buf[36] == 1)
  {
    __int16 v22 = *(_WORD *)&buf[16];
    int v18 = (*(_DWORD *)&buf[4] >> 14) & 1;
    __int16 v23 = *(_WORD *)&v45[40];
    if ((buf[16] & 1) == 0) {
      __int16 v23 = 1;
    }
    HIWORD(v27[0]) = v23;
    if ((buf[21] & 2) != 0) {
      unsigned int v21 = *(_DWORD *)&v45[60];
    }
    else {
      unsigned int v21 = 0;
    }
    goto LABEL_56;
  }
  if (*(_DWORD *)&buf[36] != 2)
  {
    unsigned int v21 = 0;
    int v18 = 0;
    __int16 v22 = *(_WORD *)&buf[16];
LABEL_56:
    if ((v22 & 4) != 0) {
      uint64_t v20 = *(void *)&v45[44];
    }
    else {
      uint64_t v20 = 0;
    }
    if ((v22 & 0x200) != 0)
    {
      int v19 = 0;
      uint64_t v35 = *(void *)&v45[52];
    }
    else
    {
      if (*(_DWORD *)&buf[36] == 1) {
        _parse_fileattrs_cold_1();
      }
      int v19 = 0;
    }
    goto LABEL_63;
  }
  int v18 = (buf[5] >> 6) & 1;
  if ((buf[12] & 2) != 0) {
    int v19 = *(_DWORD *)&v45[40];
  }
  else {
    int v19 = 2;
  }
  uint64_t v20 = 0;
  if ((buf[21] & 2) != 0) {
    unsigned int v21 = *(_DWORD *)&v45[44];
  }
  else {
    unsigned int v21 = 0;
  }
LABEL_63:
  if (v18) {
    int v24 = &buf[72];
  }
  else {
    int v24 = 0;
  }
  return fpfs_synthesize_metadata(a3 + 40, *(int *)&buf[36], (uint64_t)v27, v21, v20, *(int *)&v45[36], (uint64_t)v24, v19);
}

uint64_t fpfs_synthesize_metadata(uint64_t a1, int a2, uint64_t a3, unsigned int a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if (a7)
  {
    fpfs_finder_info_deserialize(a7, (uint64_t)&v24);
    *(void *)(a1 + 112) = v25;
    char v15 = v24;
    *(_DWORD *)(a1 + 4) = *(_DWORD *)(a1 + 4) & 0xFFFFFFF5 | v24 & 8 | (2 * (v24 & 1));
    int v16 = BYTE1(v24);
  }
  else
  {
    char v15 = 0;
    int v16 = 1;
  }
  *(_DWORD *)(a1 + 212) = v16;
  switch(a2)
  {
    case 5:
      *(_DWORD *)a1 = 4;
      *(void *)(a1 + 16) = *(void *)(a3 + 96);
      unsigned int v17 = *(_DWORD *)(a1 + 4) & 0xFFFFFFDF;
      goto LABEL_13;
    case 2:
      if ((v15 & 2) != 0) {
        int v18 = 3;
      }
      else {
        int v18 = 2;
      }
      *(_DWORD *)a1 = v18;
      *(void *)(a1 + 16) = *(void *)(a3 + 96);
      *(_DWORD *)(a1 + 104) = a8;
      unsigned int v17 = (a4 << 6) & 0x100 | (32 * ((a4 >> 3) & 1)) | *(_DWORD *)(a1 + 4) & 0xFFFFFEDF;
      goto LABEL_13;
    case 1:
      *(_DWORD *)a1 = 1;
      *(void *)(a1 + 16) = *(void *)(a3 + 96);
      *(_DWORD *)(a1 + 104) = *(unsigned __int16 *)(a3 + 6);
      unsigned int v17 = *(_DWORD *)(a1 + 4) & 0xFFFFFFDF | (32 * ((a4 >> 3) & 1));
LABEL_13:
      *(_DWORD *)(a1 + 4) = v17;
      uint64_t result = 0;
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a3 + 80);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a3 + 48);
      *(_WORD *)(a1 + 8) = *(_WORD *)(a3 + 4) & 0xFFF;
      unsigned int v20 = v17 & 0xFFFFFFFB | (4 * ((*(_DWORD *)(a3 + 116) & 0x8000 | v15 & 4) != 0));
      *(_DWORD *)(a1 + 4) = v20;
      unsigned int v21 = v20 & 0xFFFFFFEF | (16 * ((*(_DWORD *)(a3 + 116) >> 1) & 1));
      *(_DWORD *)(a1 + 4) = v21;
      unsigned int v22 = v21 & 0xFFFFFFFE | (*(_DWORD *)(a3 + 116) >> 30) & 1;
      *(_DWORD *)(a1 + 4) = v22;
      unsigned int v23 = v22 & 0xFFFFFFBF | (((*(_DWORD *)(a3 + 116) & 0x40000020) == 32) << 6);
      *(_DWORD *)(a1 + 4) = v23;
      *(void *)(a1 + 128) = a5;
      *(_DWORD *)(a1 + 168) = a6;
      *(_DWORD *)(a1 + 172) = *(_DWORD *)(a3 + 16);
      *(_DWORD *)(a1 + 4) = v23 & 0xFFFFDFFF | (((a4 >> 1) & 1) << 13);
      return result;
  }
  *__error() = 79;
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_finder_info_deserialize(uint64_t result, uint64_t a2)
{
  unsigned int v2 = bswap32(*(unsigned __int16 *)(result + 8));
  *(unsigned char *)a2 = (v2 >> 22) & 0x10 | (v2 >> 17) & 8 | ((v2 & 0x80000000) != 0) | (v2 >> 28) & 6 | *(unsigned char *)a2 & 0xE0;
  *(unsigned char *)(a2 + 1) = (v2 >> 17) & 7;
  *(void *)(a2 + 8) = bswap64(*(void *)result);
  return result;
}

uint64_t __fpfs_load_additional_attrs_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, sizeof(v17));
  uint64_t v4 = *(void *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v4 + 56) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v4 + 40) = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  long long v7 = *(_OWORD *)(a1 + 96);
  long long v8 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v4 + 120) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v4 + 104) = v8;
  *(_OWORD *)(v4 + 88) = v7;
  *(_OWORD *)(v4 + 72) = v6;
  long long v9 = *(_OWORD *)(a1 + 144);
  long long v10 = *(_OWORD *)(a1 + 160);
  long long v11 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(v4 + 184) = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(v4 + 168) = v11;
  *(_OWORD *)(v4 + 152) = v10;
  *(_OWORD *)(v4 + 136) = v9;
  long long v12 = *(_OWORD *)(a1 + 208);
  long long v13 = *(_OWORD *)(a1 + 224);
  long long v14 = *(_OWORD *)(a1 + 240);
  *(_OWORD *)(v4 + 248) = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(v4 + 232) = v14;
  *(_OWORD *)(v4 + 216) = v13;
  *(_OWORD *)(v4 + 200) = v12;
  *(void *)(*(void *)(a1 + 40) + 200) = a2;
  if ((*(unsigned int (**)(void))(**(void **)(a1 + 272) + 16))())
  {
    *((void *)&v17[0] + 1) = "com.apple.fpfs.fileid";
    *(void *)&v17[1] = snprintf((char *)&v17[1] + 8, 0x68uLL, "%llu:%d:%d", **(void **)(a1 + 40), *(_DWORD *)(*(void *)(a1 + 40) + 16), *(_DWORD *)(*(void *)(a1 + 40) + 20))+ 1;
    *(void *)&v17[0] = a2;
    *(void *)(*(void *)(a1 + 40) + 200) = v17;
  }
  uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  fpfs_free_tag_data((void **)(*(void *)(a1 + 40) + 120));
  *(void *)(*(void *)(a1 + 40) + 200) = 0;
  free(*(void **)(a1 + 184));
  free(*(void **)(a1 + 224));
  return v15;
}

void fpfs_free_tag_data(void **a1)
{
  *a1 = 0;
}

uint64_t __fpfs_fgetfileattrs_block_invoke(uint64_t a1, uint64_t a2)
{
  if ((fpfs_pkg_fileattrs_update(*(unsigned int *)(a1 + 48), a2, *(_DWORD *)(*(void *)(a1 + 40) + 8)) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  char v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

uint64_t fpfs_pkg_fileattrs_update(uint64_t a1, uint64_t a2, int a3)
{
  return _pkg_fileattrs_update(a1, 0, a2, a3);
}

uint64_t _pkg_fileattrs_update(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((*(_DWORD *)(a3 + 40) - 4) < 0xFFFFFFFE) {
    return 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = ___pkg_fileattrs_update_block_invoke;
  v12[3] = &__block_descriptor_44_e8_i12__0i8l;
  void v12[4] = a3;
  int v13 = a4;
  long long v8 = (uint64_t (**)(void, void))MEMORY[0x1A6248B00](v12);
  long long v9 = v8;
  if ((a1 & 0x80000000) != 0) {
    uint64_t v10 = fpfs_openbyid_ext(a3, a2, 0x100000, 0, v8);
  }
  else {
    uint64_t v10 = v8[2](v8, a1);
  }
  uint64_t v4 = v10;

  return v4;
}

uint64_t ___pkg_fileattrs_update_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  char v7 = 0;
  uint64_t v6 = 0;
  if ((fpfs_pkg_fd_lookup(a2, *(void *)(*(void *)(a1 + 32) + 24), 0, &v7, 0, &v6, *(_DWORD *)(a1 + 40)) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v7)
  {
    *(_DWORD *)(v4 + 40) = 3;
    uint64_t v8 = 0;
    if ((ffsctl(v2, 0x80084A02uLL, &v8, 0) & 0x80000000) == 0)
    {
      if ((fpfs_pkg_promote(v2) & 0x80000000) == 0)
      {
LABEL_8:
        fpfs_pkg_dirstat(v2, (void *)(*(void *)(a1 + 32) + 56), (_DWORD *)(*(void *)(a1 + 32) + 20));
        uint64_t result = 0;
        *(void *)(*(void *)(a1 + 32) + 168) = *(void *)(*(void *)(a1 + 32) + 56);
        return result;
      }
      if (*__error() == 1 || *__error() == 13)
      {
        *__error() = 0;
        goto LABEL_8;
      }
      return 0xFFFFFFFFLL;
    }
    if (*__error() == 22) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t result = 0;
    *(_DWORD *)(v4 + 40) = 2;
  }
  return result;
}

uint64_t fpfs_pkg_fd_lookup(uint64_t a1, uint64_t a2, char a3, unsigned char *a4, unsigned char *a5, void *a6, int a7)
{
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __fpfs_pkg_fd_lookup_block_invoke;
  v9[3] = &__block_descriptor_73_e8_i12__0i8l;
  char v12 = a3;
  v9[4] = a2;
  v9[5] = a4;
  v9[6] = a5;
  v9[7] = a6;
  int v10 = a1;
  int v11 = a7;
  uint64_t v7 = fpfs_openat(a1, "..", 0, 0, 0, (uint64_t)v9);
  if ((v7 & 0x80000000) != 0 && (*__error() == 20 || *__error() == 1 || *__error() == 13)) {
    return 0;
  }
  return v7;
}

uint64_t fpfs_pkg_is_package_root2(int a1, char *__s1, int *a3, int a4)
{
  *a3 = 0;
  if (fpfs_path_is_safe_save_temp_filename(__s1, 0))
  {
    int v8 = *a3;
    int v9 = 16777218;
LABEL_3:
    *a3 = v8 | v9;
    goto LABEL_4;
  }
  if (a4 == 1)
  {
    int v13 = fpfs_extension_in_filename(__s1, 0);
    if (v13)
    {
      long long v14 = (char *)v13;
      if (pkg_extension_is_forced_folder(v13)) {
        goto LABEL_4;
      }
      if (*v14 && fpfs_icd_package_extension_list_contains(v14))
      {
        int v8 = *a3;
        int v9 = 2097154;
        goto LABEL_3;
      }
      if ((fpfs_pathpkg_check(__s1) & 0x80000000) == 0)
      {
        int v8 = *a3;
        int v9 = 4194306;
        goto LABEL_3;
      }
    }
    BOOL v16 = 0;
    if (!fpfs_pkg_get_bundle_bit(a1, &v16) && v16)
    {
      int v8 = *a3;
      int v9 = 8388610;
      goto LABEL_3;
    }
  }
  else
  {
    if (a4)
    {
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }
    char v12 = (char *)fpfs_extension_in_filename(__s1, 0);
    if (v12 && *v12 && fpfs_user_package_extension_list_contains(v12))
    {
      int v8 = *a3;
      int v9 = 1048578;
      goto LABEL_3;
    }
  }
LABEL_4:
  char v15 = 0;
  if (fpfs_pkg_is_demoted(a1, &v15) || !v15)
  {
    if (fpfs_pkg_is_promoted(a1, &v15) || !v15) {
      return 0;
    }
    int v10 = 8;
  }
  else
  {
    int v10 = 4;
  }
  *a3 |= v10;
  return 0;
}

uint64_t fpfs_pkg_is_demoted(int a1, unsigned char *a2)
{
  *a2 = 1;
  ssize_t v3 = fgetxattr(a1, "com.apple.fileprovider.dir#N", 0, 0, 0, 0);
  uint64_t result = 0;
  if (v3 < 0)
  {
    if (*__error() == 93)
    {
      uint64_t result = 0;
      *a2 = 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t fpfs_pkg_relative_path_lookup(const char *a1, char *a2, char a3, unsigned char *a4, unsigned char *a5, __darwin_ino64_t *a6, int a7)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  int v13 = v56;
  bzero(v56, 0x400uLL);
  unint64_t v14 = __strlcpy_chk();
  if (v14 >= 0x400)
  {
    if (!fpfs_supports_long_paths()) {
      return 0xFFFFFFFFLL;
    }
    int v13 = strdup(a1);
    if (!v13) {
      return 0xFFFFFFFFLL;
    }
  }
  if (v13[v14 - 1] == 47) {
    v13[v14 - 1] = 0;
  }
  if (a2)
  {
    unsigned int v45 = fpfs_lp_openat(-2, a2, 1048836, 0);
    if ((v45 & 0x80000000) != 0)
    {
      LOBYTE(v15) = 0;
      char v16 = 0;
      uint64_t v17 = 0xFFFFFFFFLL;
      goto LABEL_93;
    }
  }
  else
  {
    unsigned int v45 = -2;
  }
  long long v44 = a6;
  *__error() = 0;
  int v18 = *v13;
  uint64_t v48 = 0;
  if (!v18) {
LABEL_78:
  }
    fpfs_pkg_relative_path_lookup_cold_1();
  uint64_t v19 = v45;
  int v46 = a7;
  while (1)
  {
    unsigned int v20 = (char *)v57;
    bzero(v57, 0x400uLL);
    if ((unint64_t)__strlcpy_chk() >= 0x400)
    {
      unsigned int v20 = strdup(v13);
      if (!v20)
      {
LABEL_79:
        char v16 = 0;
        LOBYTE(v15) = 0;
        if (*__error()) {
          uint64_t v17 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v17 = 0;
        }
LABEL_91:
        if ((v19 & 0x80000000) != 0) {
          goto LABEL_93;
        }
        goto LABEL_92;
      }
    }
    if (a7 == 1)
    {
      v50 = 0;
      for (uint64_t i = v20; ; uint64_t i = 0)
      {
        int v26 = strtok_r(i, "/", &v50);
        unsigned int v23 = v26;
        if (!v26) {
          break;
        }
        if (v26 > v20 && !*(v26 - 1)) {
          *(v26 - 1) = 47;
        }
        unsigned __int8 v27 = fpfs_extension_in_filename(v26, 0);
        if (v27)
        {
          long long v28 = (char *)v27;
          if (!pkg_extension_is_forced_folder(v27))
          {
            if (*v28 && (fpfs_icd_package_extension_list_contains(v28) & 1) != 0) {
              break;
            }
            if ((fpfs_pathpkg_check(v23) & 0x80000000) == 0) {
              break;
            }
            char v49 = 0;
            __lasts = (char *)MEMORY[0x1E4F143A8];
            uint64_t v52 = 3221225472;
            long long v53 = __fpfs_pkg_get_bundle_bit_at_block_invoke;
            uint64_t v54 = &__block_descriptor_40_e8_i12__0i8l;
            uint64_t v55 = &v49;
            if (!fpfs_openat(v19, v20, 0x100000u, 0, 0, (uint64_t)&__lasts))
            {
              if (v49) {
                break;
              }
            }
          }
        }
      }
LABEL_39:
      if (v23) {
        goto LABEL_40;
      }
      goto LABEL_44;
    }
    if (!a7)
    {
      __lasts = 0;
      for (j = v20; ; j = 0)
      {
        unsigned int v22 = strtok_r(j, "/", &__lasts);
        unsigned int v23 = v22;
        if (!v22) {
          break;
        }
        if (v22 > v20 && !*(v22 - 1)) {
          *(v22 - 1) = 47;
        }
        uint64_t v24 = (char *)fpfs_extension_in_filename(v22, 0);
        if (v24)
        {
          if (*v24 && (fpfs_user_package_extension_list_contains(v24) & 1) != 0) {
            break;
          }
        }
      }
      goto LABEL_39;
    }
LABEL_44:
    v50 = 0;
    long long v31 = strtok_r(v20, "/", &v50);
    if (v31)
    {
      unsigned int v23 = v31;
      uint64_t v32 = (char *)MEMORY[0x1E4F143A8];
      while (1)
      {
        if (v23 > v20 && !*(v23 - 1)) {
          *(v23 - 1) = 47;
        }
        char v49 = 0;
        __lasts = v32;
        uint64_t v52 = 3221225472;
        long long v53 = __fpfs_pkg_is_promoted_at_block_invoke;
        uint64_t v54 = &__block_descriptor_40_e8_i12__0i8l;
        uint64_t v55 = &v49;
        if (!fpfs_openat(v19, v20, 0x100000u, 0, 0, (uint64_t)&__lasts))
        {
          if (v49) {
            break;
          }
        }
        unsigned int v23 = strtok_r(0, "/", &v50);
        if (!v23) {
          goto LABEL_52;
        }
      }
    }
    else
    {
LABEL_52:
      __lasts = 0;
      uint64_t v33 = strtok_r(v20, "/", &__lasts);
      if (!v33)
      {
LABEL_59:
        *__error() = 0;
        uint64_t v48 = 0;
LABEL_60:
        uint64_t v30 = -1;
        goto LABEL_61;
      }
      unsigned int v23 = v33;
      while (1)
      {
        if (v23 > v20 && !*(v23 - 1)) {
          *(v23 - 1) = 47;
        }
        if (fpfs_path_is_safe_save_temp_filename(v23, 0)) {
          break;
        }
        unsigned int v23 = strtok_r(0, "/", &__lasts);
        if (!v23) {
          goto LABEL_59;
        }
      }
    }
LABEL_40:
    size_t v29 = strlen(v23);
    uint64_t v30 = &v23[v29] - v20;
    if (asprintf(&v48, "%.*s", v23 + v29 - v20, v13) < 0) {
      goto LABEL_60;
    }
    if (v13[v30] == 47) {
      ++v30;
    }
LABEL_61:
    a7 = v46;
    if (v20 != (char *)v57) {
      free(v20);
    }
    if (v30 < 0) {
      goto LABEL_79;
    }
    *__error() = 0;
    long long v34 = v48;
    if (!v48) {
      goto LABEL_79;
    }
    size_t v15 = strlen(v13);
    size_t v35 = strlen(v48);
    if (v13[v15 - 1] == 47) {
      --v15;
    }
    uint64_t v36 = v48[v35 - 1] == 47 ? v35 - 1 : v35;
    LOBYTE(__lasts) = 0;
    if (a3) {
      break;
    }
    *(void *)&v57[0].st_dev = MEMORY[0x1E4F143A8];
    v57[0].st_ino = 3221225472;
    *(void *)&v57[0].st_uid = __fpfs_pkg_is_demoted_at_block_invoke;
    *(void *)&v57[0].st_rdev = &__block_descriptor_40_e8_i12__0i8l;
    v57[0].st_atimespec.tv_sec = (__darwin_time_t)&__lasts;
    if ((fpfs_openat(v19, v48, 0x100000u, 0, 0, (uint64_t)v57) & 0x80000000) != 0 || !(_BYTE)__lasts) {
      goto LABEL_83;
    }
    v15 -= v36;
    if (!v15)
    {
      free(v34);
      char v16 = 0;
      uint64_t v17 = 0;
      goto LABEL_91;
    }
    memmove(v13, &v13[v36 + 1], v15);
    v13[v15] = 0;
    uint64_t v37 = openat(v19, v34, 1048836);
    if ((v37 & 0x80000000) != 0)
    {
      free(v34);
      char v16 = 0;
      LODWORD(v15) = 0;
      uint64_t v17 = 0xFFFFFFFFLL;
      goto LABEL_107;
    }
    uint64_t v38 = v37;
    if (v19 != -2) {
      close(v19);
    }
    free(v34);
    *__error() = 0;
    uint64_t v48 = 0;
    uint64_t v19 = v38;
    if (!*v13) {
      goto LABEL_78;
    }
  }
  LODWORD(v19) = v45;
LABEL_83:
  BOOL v39 = v15 == v36;
  LODWORD(v15) = v15 != v36;
  int v40 = v39;
  if (!v44) {
    goto LABEL_105;
  }
  memset(v57, 0, 144);
  uint64_t v41 = fpfs_lp_fstatat(v19, v34, v57, 32);
  if ((v41 & 0x80000000) != 0)
  {
    if (*__error() == 20)
    {
      int v40 = 0;
      LODWORD(v15) = 0;
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    if ((v57[0].st_mode & 0xF000) == 0x4000)
    {
      uint64_t v17 = v41;
      *long long v44 = v57[0].st_ino;
      goto LABEL_106;
    }
    int v40 = 0;
    LODWORD(v15) = 0;
LABEL_105:
    uint64_t v17 = 0;
  }
LABEL_106:
  free(v34);
  char v16 = v40 != 0;
LABEL_107:
  LOBYTE(v15) = v15 != 0;
  if ((v19 & 0x80000000) == 0)
  {
LABEL_92:
    int v42 = *__error();
    close(v19);
    *__error() = v42;
  }
LABEL_93:
  if (v13 != v56) {
    free(v13);
  }
  if (a4) {
    *a4 = v16;
  }
  if (a5) {
    *a5 = v15 & ~v16;
  }
  return v17;
}

uint64_t fpfs_openat(uint64_t a1, char *a2, unsigned int a3, uint64_t a4, char a5, uint64_t a6)
{
  if (a3) {
    unsigned int v11 = a3;
  }
  else {
    unsigned int v11 = 0x8000;
  }
  int v12 = ~(v11 >> 13) & 0x100 | v11;
  int v13 = v12 | 4;
  if (a5)
  {
    if (mkdirat(a1, a2, a4) < 0
      && (*__error() != 63
       || !fpfs_supports_long_paths()
       || (v36 = 0, int v18 = fpfs_openat_longparent(a1, a2, &v36), v18 < 0)
       || (int v19 = v18, v20 = mkdirat(v18, v36, a4), v21 = *__error(), close(v19), *__error() = v21, v20 < 0)))
    {
      unsigned int v22 = __error();
      uint64_t v23 = 0xFFFFFFFFLL;
      if ((v11 & 0x800) != 0 || *v22 != 17) {
        return v23;
      }
      int v16 = 0;
    }
    else
    {
      int v16 = 1;
    }
    uint64_t v15 = fpfs_lp_openat(a1, a2, v13 & 0xFFFFF7FC, 0);
    if ((v15 & 0x80000000) == 0) {
      goto LABEL_20;
    }
    return 0xFFFFFFFFLL;
  }
  if ((v11 & 0x200) != 0)
  {
    uint64_t v17 = fpfs_lp_openat(a1, a2, v12 | 0x804u, a4);
    if ((v17 & 0x80000000) == 0)
    {
      uint64_t v15 = v17;
      int v16 = 1;
      goto LABEL_20;
    }
    long long v31 = __error();
    uint64_t v23 = 0xFFFFFFFFLL;
    if ((v11 & 0x800) != 0 || *v31 != 17) {
      return v23;
    }
    int v27 = a1;
    long long v28 = a2;
    int v29 = v13;
    uint64_t v30 = a4;
LABEL_36:
    uint64_t v15 = fpfs_lp_openat(v27, v28, v29, v30);
    int v16 = 0;
    if ((v15 & 0x80000000) == 0) {
      goto LABEL_20;
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v14 = fpfs_lp_openat(a1, a2, v12 | 4u, 0);
  if ((v14 & 0x80000000) != 0)
  {
    uint64_t v25 = v13 & 0xFFFFFFFC;
    int v26 = __error();
    if ((v11 & 3) == 0 || (a5 & 2) == 0 || *v26 != 21)
    {
      if ((a5 & 4) == 0 && (*__error() == 13 || *__error() == 1))
      {
        int v32 = fpfs_lp_openat(a1, a2, v25, 0);
        if ((v32 & 0x80000000) == 0)
        {
          int v33 = v32;
          uint64_t v23 = fpfs_openat(a1, a2, v25, a4, 4, a6);
          if ((v23 & 0x80000000) != 0)
          {
            int v35 = *__error();
            close(v33);
            *__error() = v35;
            return v23;
          }
          if ((close(v33) & 0x80000000) == 0 || *__error() != 9 && *__error() != 5) {
            return v23;
          }
        }
      }
      return 0xFFFFFFFFLL;
    }
    int v27 = a1;
    long long v28 = a2;
    int v29 = v25;
    uint64_t v30 = 0;
    goto LABEL_36;
  }
  uint64_t v15 = v14;
  int v16 = 0;
LABEL_20:
  if (a6)
  {
    uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 16))(a6, v15);
    if ((v23 & 0x80000000) == 0)
    {
      if (close(v15) < 0) {
        return 0xFFFFFFFFLL;
      }
      else {
        return v23;
      }
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  int v24 = *__error();
  close(v15);
  if (v16) {
    unlinkat(a1, a2, (a5 & 1) << 7);
  }
  *__error() = v24;
  return v23;
}

uint64_t fpfs_lp_openat(int a1, char *a2, int a3, uint64_t a4)
{
  uint64_t v8 = openat(a1, a2, a3, a4);
  if ((v8 & 0x80000000) == 0 || *__error() != 63 || !fpfs_supports_long_paths()) {
    return v8;
  }

  return fpfs_openat_longpath(a1, a2, a3, a4);
}

uint64_t fpfs_pkg_is_promoted(int a1, unsigned char *a2)
{
  int v4 = 0;
  if ((fpfs_pkg_getflags(a1, &v4) & 0x80000000) != 0 && *__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 = v4 & 1;
  return result;
}

uint64_t fpfs_pkg_getflags(int a1, _DWORD *a2)
{
  int value = 0;
  unint64_t v4 = fgetxattr(a1, "com.apple.fileprovider.fpfs#P", &value, 4uLL, 0, 0);
  if ((v4 & 0x8000000000000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v4 <= 3)
  {
    fremovexattr(a1, "com.apple.fileprovider.fpfs#P", 0);
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 = value;
  return result;
}

uint64_t fpfs_path_is_safe_save_temp_filename(char *__s1, int a2)
{
  if (!a2)
  {
    if (strncmp(__s1, "(A Document Being Saved", 0x17uLL)) {
      goto LABEL_5;
    }
    return 2;
  }
  if (_CFURLCStringIsPromiseName()) {
    return 0;
  }
  if (!strcmp(__s1, ".DS_Store")) {
    return 1;
  }
  if (!strncmp(__s1, "(A Document Being Saved", 0x17uLL)) {
    return 2;
  }
  if (!strncmp(__s1, ".dat.nosync", 0xBuLL)) {
    return 3;
  }
LABEL_5:
  if (!strncmp(__s1, "~$", 2uLL) || !strncmp(__s1, ".~", 2uLL)) {
    return 4;
  }
  uint64_t result = (uint64_t)fpfs_extension_in_filename(__s1, 0);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t result = strlen((const char *)result);
    if (result)
    {
      unint64_t v6 = result;
      uint64_t result = strcmp((const char *)v5, "svn-base");
      if (result)
      {
        if (!a2) {
          goto LABEL_35;
        }
        if (*__s1 == 46)
        {
          uint64_t v7 = strrchr((char *)v5, 45);
          uint64_t v8 = (uint64_t)&v7[-v5];
          if (v7 && v8 < 0) {
            fpfs_path_is_safe_save_temp_filename_cold_1();
          }
          if (v7)
          {
            unsigned int v9 = v7[1];
            if (v7[1])
            {
              unint64_t v10 = 0;
              while (v10 <= 3
                   && ((char)v9 & 0x80000000) == 0
                   && (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v9 + 60) & 0x500) != 0)
              {
                unsigned int v11 = v10 + 1;
                unsigned int v9 = v7[v10++ + 2];
                if (!v9)
                {
                  if (v11 >= 3 && (is_ext_image_type(v5, v8) & 1) != 0) {
                    return 5;
                  }
                  break;
                }
              }
            }
          }
        }
        if (v5 - (uint64_t)__s1 >= 6 && !strncmp((const char *)(v5 - 5), ".kra.", 5uLL))
        {
          return 6;
        }
        else
        {
LABEL_35:
          if (v6 >= 2 && !strcmp((const char *)(v5 + v6 - 1), "~"))
          {
            return 7;
          }
          else
          {
            if (!a2) {
              goto LABEL_41;
            }
            if (is_adobe_after_effect_safe_save((unint64_t)__s1, (char *)v5)) {
              return 8;
            }
            if (is_adobe_illustrator_safe_save(__s1))
            {
              return 9;
            }
            else
            {
LABEL_41:
              int v12 = strncmp((const char *)v5, "sb-", 3uLL);
              if (v6 != 18 || v12)
              {
                if (v6 != 3 || *__s1 != 46 || *(_WORD *)v5 != 30579 || *(char *)(v5 + 2) >= 113) {
                  return 0;
                }
                return 11;
              }
              else
              {
                if (*(unsigned char *)(v5 + 11) != 45) {
                  return 0;
                }
                return 10;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

const char *fpfs_extension_in_filename(char *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  unint64_t v4 = strrchr(a1, 46);
  uint64_t v5 = 0;
  if (v4 && v4 != a1)
  {
    uint64_t v5 = v4 + 1;
    if (strlen(v4 + 1) > 0x32) {
      return 0;
    }
    if (!a2 && (!strcmp(v5, "gz") || !strcmp(v5, "bz2") || !strcmp(v5, "Z") || !strcmp(v5, "xz")))
    {
      unint64_t v10 = strdup(a1);
      v5[~(unint64_t)a1 + (void)v10] = 0;
      uint64_t v11 = fpfs_extension_in_filename();
      if (v11) {
        uint64_t v5 = &a1[v11 - (void)v10];
      }
      free(v10);
    }
    else
    {
      char v7 = 0;
      for (uint64_t i = v5; ; ++i)
      {
        int v9 = *(unsigned __int8 *)i;
        if (!*i) {
          break;
        }
        if (v9 == 32 || v9 == 47) {
          return 0;
        }
        v7 |= (v9 - 58) < 0xFFFFFFF6;
      }
      if ((v7 & 1) == 0) {
        return 0;
      }
    }
  }
  return v5;
}

uint64_t __fpfs_pkg_is_promoted_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_pkg_is_promoted(a2, *(unsigned char **)(a1 + 32));
}

uint64_t __fpfs_pkg_fd_lookup_block_invoke(uint64_t a1, int a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __fpfs_pkg_fd_lookup_block_invoke_2;
  v4[3] = &__block_descriptor_73_e5_i8__0l;
  char v8 = *(unsigned char *)(a1 + 72);
  long long v2 = *(_OWORD *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  long long v6 = v2;
  uint64_t v7 = *(void *)(a1 + 64);
  return fpfs_fchdir(a2, (uint64_t)v4);
}

uint64_t fpfs_fchdir(int a1, uint64_t a2)
{
  if (a1 == -2)
  {
    long long v2 = *(uint64_t (**)(uint64_t))(a2 + 16);
    return v2(a2);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 0x40000000;
    unint64_t v10 = __fpfs_fchdir_block_invoke;
    uint64_t v11 = &unk_1E5AF1FA8;
    int v13 = a1;
    uint64_t v12 = a2;
    uint64_t v4 = fpfs_lp_openat(-2, ".", 0x100000, 0);
    if ((v4 & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v5 = v4;
    if ((MEMORY[0x1A6248E30](0xFFFFFFFFLL) & 0x80000000) != 0)
    {
      int v8 = *__error();
      close(v5);
      *__error() = v8;
      return v10((uint64_t)v9, 0xFFFFFFFFLL);
    }
    else
    {
      uint64_t v6 = v10((uint64_t)v9, v5);
      int v7 = *__error();
      close(v5);
      *__error() = v7;
    }
    return v6;
  }
}

double fpfs_get_finder_info_buffer(int a1, _OWORD *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v5 = xmmword_1A34E4B00;
  uint64_t v6 = 0;
  memset(v7, 0, sizeof(v7));
  if ((fgetattrlist(a1, &v5, v7, 0x28uLL, 0) & 0x80000000) == 0)
  {
    if ((*(_DWORD *)&v7[4] - 3) > 0xFFFFFFFD)
    {
      double result = *(double *)&v7[8];
      long long v4 = *(_OWORD *)&v7[24];
      *a2 = *(_OWORD *)&v7[8];
      a2[1] = v4;
    }
    else
    {
      *__error() = 79;
    }
  }
  return result;
}

BOOL fpfs_is_resurrected(int a1)
{
  return fgetxattr(a1, "com.apple.fileprovider.is_resurrected#PN", 0, 0, 0, 0) >= 0;
}

uint64_t fpfs_is_detached_root(int a1, char *a2)
{
  if ((fgetxattr(a1, "com.apple.fileprovider.detached#B", 0, 0, 0, 0) & 0x8000000000000000) == 0
    || *__error() == 93
    && (fgetxattr(a1, "com.apple.fileprovider.detached", 0, 0, 0, 0) & 0x8000000000000000) == 0
    || *__error() == 93
    && (fgetxattr(a1, "com.apple.fileprovider.detached#PN", 0, 0, 0, 0) & 0x8000000000000000) == 0)
  {
    char v4 = 1;
LABEL_3:
    uint64_t result = 0;
    *a2 = v4;
    return result;
  }
  if (*__error() == 93)
  {
    char v4 = 0;
    goto LABEL_3;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_get_tag_data(int a1, uint64_t a2, uint64_t a3)
{
  ssize_t v6 = fgetxattr(a1, "com.apple.metadata:_kMDItemUserTags", 0, 0, 0, 0);
  if (v6 < 0)
  {
    if (*__error() != 93) {
      return 0xFFFFFFFFLL;
    }
LABEL_8:
    uint64_t result = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(unsigned char *)(a3 + 16) = 0;
    return result;
  }
  int64_t v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v8 = malloc_type_malloc(v6, 0x175080ABuLL);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  int v9 = v8;
  uint64_t v10 = fpfs_fgetxattr_checked(a1, "com.apple.metadata:_kMDItemUserTags", v8, v7);
  if (v10 < 0)
  {
    free(v9);
    return 0xFFFFFFFFLL;
  }
  *(void *)a3 = v9;
  *(void *)(a3 + 8) = v10;
  uint64_t result = 0;
  if (a2) {
    char v12 = *(unsigned char *)(a2 + 1);
  }
  else {
    char v12 = 1;
  }
  *(unsigned char *)(a3 + 16) = v12;
  return result;
}

uint64_t fpfs_get_last_use_date(int a1, uint64_t *a2, int a3)
{
  value[2] = *MEMORY[0x1E4F143B8];
  value[0] = 0;
  value[1] = 0;
  ssize_t v5 = fgetxattr(a1, "com.apple.lastuseddate#PS", value, 0x10uLL, 0, 0);
  if (v5 < 0)
  {
    if (*__error() != 93 && *__error() != 34) {
      return 0xFFFFFFFFLL;
    }
    uint64_t result = 0;
  }
  else
  {
    int use_date = fpfs_deserialize_last_use_date(a2, (const UInt8 *)value, v5, a3);
    uint64_t result = 1;
    if ((use_date & 0x80000000) == 0) {
      return result;
    }
  }
  *a2 = 0;
  a2[1] = 0;
  return result;
}

uint64_t fpfs_get_is_sync_resuming_with_drop_local_changes(int a1, char *a2)
{
  if ((fgetxattr(a1, "com.apple.file-provider-resuming-sync-drop-local-changes#PX", 0, 0, 0, 0) & 0x8000000000000000) == 0)
  {
    char v3 = 1;
LABEL_5:
    uint64_t result = 0;
    *a2 = v3;
    return result;
  }
  if (*__error() == 93)
  {
    char v3 = 0;
    goto LABEL_5;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_get_is_sync_paused(int a1, char *a2)
{
  if ((fgetxattr(a1, "com.apple.file-provider-sync_paused_bundle_id#PX", 0, 0, 0, 0) & 0x8000000000000000) == 0)
  {
    char v3 = 1;
LABEL_5:
    uint64_t result = 0;
    *a2 = v3;
    return result;
  }
  if (*__error() == 93)
  {
    char v3 = 0;
    goto LABEL_5;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_get_is_pinned(int a1, char *a2)
{
  if ((fgetxattr(a1, "com.apple.fileprovider.pinned#PX", 0, 0, 0, 0) & 0x8000000000000000) == 0)
  {
    char v3 = 1;
LABEL_5:
    uint64_t result = 0;
    *a2 = v3;
    return result;
  }
  if (*__error() == 93)
  {
    char v3 = 0;
    goto LABEL_5;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_get_is_ignore_root(int a1, BOOL *a2)
{
  ssize_t v3 = fgetxattr(a1, "com.apple.fileprovider.ignore#P", 0, 0, 0, 0);
  if (v3 < 0 && *__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 = v3 >= 0;
  return result;
}

uint64_t fpfs_get_favorite_rank(int a1, unint64_t *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  *(_OWORD *)__str = 0u;
  long long v8 = 0u;
  CFIndex v4 = fpfs_fgetxattr_checked(a1, "com.apple.metadata:kMDItemFavoriteRank", __str, 127);
  if (v4 < 0) {
    return 0xFFFFFFFFLL;
  }
  if (v4)
  {
    __str[v4] = 0;
    return fpfs_deserialize_favorite_rank(a2, (const UInt8 *)__str, v4);
  }
  uint64_t result = fpfs_fgetxattr_checked(a1, "com.apple.favorite-rank.number#PS", __str, 127);
  if (result < 0) {
    return 0xFFFFFFFFLL;
  }
  __str[result] = 0;
  if (!result)
  {
    *a2 = 0;
    return result;
  }
  __endptr = 0;
  *a2 = strtoull(__str, &__endptr, 10);
  if (!__endptr) {
    return 0xFFFFFFFFLL;
  }
  if (*__endptr) {
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t fpfs_fgetxattr_checked(int a1, const char *a2, void *a3, int64_t a4)
{
  ssize_t v5 = fgetxattr(a1, a2, a3, a4, 0, 0);
  if (v5 <= a4)
  {
    ssize_t v6 = v5;
    if (v5 < 0 && *__error() == 93) {
      return 0;
    }
  }
  else
  {
    *__error() = 34;
    return -1;
  }
  return v6;
}

char *fpfs_copy_collaboration_identifier(int a1)
{
  ssize_t v2 = fgetxattr(a1, "com.apple.metadata:kMDItemCollaborationIdentifier", 0, 0, 0, 0);
  if (v2 < 1) {
    return 0;
  }
  size_t v3 = v2;
  CFIndex v4 = (UInt8 *)malloc_type_malloc(v2, 0xFE52665DuLL);
  if (!v4) {
    return 0;
  }
  ssize_t v5 = v4;
  if (fgetxattr(a1, "com.apple.metadata:kMDItemCollaborationIdentifier", v4, v3, 0, 0) != v3
    || (CFDataRef v6 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, v3, (CFAllocatorRef)*MEMORY[0x1E4F1CF90])) == 0)
  {
    int v18 = (void *)v5;
    goto LABEL_14;
  }
  CFDataRef v7 = v6;
  id MDItemCollaborationIdentifier = getMDItemCollaborationIdentifier();
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  long long v9 = (uint64_t (*)(id, CFDataRef))getMDPropertyCopyDecodedValueSymbolLoc_ptr;
  uint64_t v23 = getMDPropertyCopyDecodedValueSymbolLoc_ptr;
  if (!getMDPropertyCopyDecodedValueSymbolLoc_ptr)
  {
    long long v10 = (void *)MetadataUtilitiesLibrary();
    void v21[3] = (uint64_t)dlsym(v10, "MDPropertyCopyDecodedValue");
    getMDPropertyCopyDecodedValueSymbolLoc_ptr = (_UNKNOWN *)v21[3];
    long long v9 = (uint64_t (*)(id, CFDataRef))v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v9) {
    fpfs_copy_collaboration_identifier_cold_1();
  }
  CFStringRef v11 = (const __CFString *)v9(MDItemCollaborationIdentifier, v7);
  if (!v11 || (CFStringRef v12 = v11, v13 = CFGetTypeID(v11), v13 != CFStringGetTypeID()))
  {
LABEL_16:
    CFRelease(v7);
    return 0;
  }
  CFIndex Length = CFStringGetLength(v12);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (MaximumSizeForEncoding <= 0)
  {
    CFRelease(v12);
    goto LABEL_16;
  }
  CFIndex v16 = MaximumSizeForEncoding;
  uint64_t v17 = (char *)malloc_type_calloc(MaximumSizeForEncoding + 1, 1uLL, 0x7C64E976uLL);
  LODWORD(v16) = CFStringGetCString(v12, v17, v16, 0x8000100u);
  CFRelease(v7);
  CFRelease(v12);
  if (!v16)
  {
    int v18 = v17;
LABEL_14:
    free(v18);
    return 0;
  }
  return v17;
}

void sub_1A33E887C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unsigned char *fpfs_copy_before_bounce_filename(int a1)
{
  ssize_t v2 = fgetxattr(a1, "com.apple.fileprovider.before-bounce#P", 0, 0, 0, 0);
  if (v2 < 1) {
    return 0;
  }
  size_t v3 = v2;
  CFIndex v4 = malloc_type_malloc(v2 + 1, 0x3745183BuLL);
  if (!v4) {
    return v4;
  }
  if (fgetxattr(a1, "com.apple.fileprovider.before-bounce#P", v4, v3, 0, 0) != v3)
  {
    free(v4);
    return 0;
  }
  v4[v3] = 0;
  if (!*v4)
  {
    ssize_t v5 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CFDataRef v7 = 0;
      _os_log_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_INFO, "Found an empty filename in before_bounce_filename xattr", v7, 2u);
    }

    free(v4);
    CFIndex v4 = 0;
    *__error() = 22;
  }
  return v4;
}

uint64_t fpfs_get_dirstat(int a1, void *a2, _DWORD *a3, void *a4)
{
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v8 = 1;
  if (ffsctl(a1, 0xC0284A20uLL, &v8, 0) < 0) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    *a2 = v10;
  }
  if (a3) {
    *a3 = DWORD2(v10);
  }
  uint64_t result = 0;
  if (a4) {
    *a4 = *((void *)&v9 + 1);
  }
  return result;
}

uint64_t ___validate_file_openbyid_block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFIndex v4 = *(uint64_t **)(a1 + 32);
  int v5 = *((_DWORD *)v4 + 4);
  if (!v5)
  {
    uint64_t v14 = *v4;
    if (!v14 || v14 == *a2) {
      return 0;
    }
    *__error() = 70;
    CFDataRef v7 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v17 = *(_DWORD *)(a1 + 40);
      uint64_t v18 = **(void **)(a1 + 32);
      uint64_t v19 = *a2;
      v20.st_dev = 136315906;
      *(void *)&v20.st_mode = "_validate_file_openbyid_block_invoke";
      WORD2(v20.st_ino) = 1024;
      *(_DWORD *)((char *)&v20.st_ino + 6) = v17;
      HIWORD(v20.st_uid) = 2048;
      *(void *)&v20.st_gid = v18;
      *((_WORD *)&v20.st_rdev + 2) = 2048;
      *(void *)((char *)&v20.st_rdev + 6) = v19;
      CFStringRef v11 = "ESTALE: opened wrong directory in %s [%d, %llu, %llu]";
      CFStringRef v12 = v7;
      uint32_t v13 = 38;
      goto LABEL_15;
    }
LABEL_9:

    return 0xFFFFFFFFLL;
  }
  int v6 = *((_DWORD *)a2 + 4);
  if (v5 != v6)
  {
    if (v6
      || (int v16 = *(_DWORD *)(a1 + 40), memset(&v20, 0, sizeof(v20)), fstat(v16, &v20) < 0)
      || (v20.st_mode & 0xF000) != 0xA000)
    {
      *__error() = 70;
      CFDataRef v7 = fpfs_current_or_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = *(_DWORD *)(a1 + 40);
        gid_t v9 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
        dev_t v10 = *((_DWORD *)a2 + 4);
        v20.st_dev = 136315906;
        *(void *)&v20.st_mode = "_validate_file_openbyid_block_invoke";
        WORD2(v20.st_ino) = 1024;
        *(_DWORD *)((char *)&v20.st_ino + 6) = v8;
        HIWORD(v20.st_uid) = 1024;
        v20.st_gid = v9;
        LOWORD(v20.st_rdev) = 1024;
        *(dev_t *)((char *)&v20.st_rdev + 2) = v10;
        CFStringRef v11 = "ESTALE: opened wrong document in %s [%d, %u, %u]";
        CFStringRef v12 = v7;
        uint32_t v13 = 30;
LABEL_15:
        _os_log_error_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v20, v13);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  return 0;
}

uint64_t __init_log_tls_if_needed_block_invoke()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&log_pthread_key, (void (__cdecl *)(void *))log_pthread_key_dtor);
  if (result) {
    abort();
  }
  return result;
}

void sub_1A33E8EC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33E9454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A33E9DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32)
{
}

void sub_1A33EA228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A33EAA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A33EAFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t __fp_default_log_block_invoke()
{
  fp_default_log_logger = (uint64_t)os_log_create("com.apple.FileProvider", "default");

  return MEMORY[0x1F41817F8]();
}

void sub_1A33EBCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A33EBD74(void *a1)
{
  objc_begin_catch(a1);
  ssize_t v2 = *v1;
  void *v1 = 0;

  objc_exception_rethrow();
}

void sub_1A33EBD8C(_Unwind_Exception *a1)
{
}

void sub_1A33ECA30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33ECB54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __createCaches_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  uint64_t v1 = (void *)domainServicerByDomain;
  domainServicerByDomain = v0;

  uint64_t v2 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  size_t v3 = (void *)rootURLByDomain;
  rootURLByDomain = v2;

  uint64_t v4 = objc_opt_new();
  int v5 = (void *)temporaryURLByDomain;
  temporaryURLByDomain = v4;

  uint64_t v6 = objc_opt_new();
  CFDataRef v7 = (void *)stateURLByDomain;
  stateURLByDomain = v6;

  cachedDirectoriesWithSecurityScope = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

uint64_t __frameworkOverridingModulesDirectoryURL_block_invoke()
{
  frameworkOverridingModulesDirectoryURL_URL = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/System/Library/PrivateFrameworks/FileProvider.framework/OverrideBundles" isDirectory:1];

  return MEMORY[0x1F41817F8]();
}

uint64_t __fp_shouldObfuscateFilenames_block_invoke()
{
  fp_shouldObfuscateFilenames_lockObject = [NSNumber numberWithUnsignedInt:arc4random_uniform(0xFFFFFFFF)];

  return MEMORY[0x1F41817F8]();
}

void __FPXOperationServiceXPCInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6C5740];
  uint64_t v1 = (void *)FPXOperationServiceXPCInterface_interface;
  FPXOperationServiceXPCInterface_interface = v0;

  uint64_t v2 = (void *)FPXOperationServiceXPCInterface_interface;

  FPXSetOperationServiceOnXPCInterface(v2);
}

void __FPDaemonActionOperationClientXPCInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6D6140];
  uint64_t v1 = (void *)FPDaemonActionOperationClientXPCInterface_interface;
  FPDaemonActionOperationClientXPCInterface_interface = v0;

  uint64_t v2 = (void *)FPDaemonActionOperationClientXPCInterface_interface;

  FPSetOperationClientOnXPCInterface(v2);
}

void ____fp_create_section_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("create-log-section", v2);
  uint64_t v1 = (void *)__fp_create_section_queue;
  __fp_create_section_queue = (uint64_t)v0;
}

uint64_t __fpfs_supports_sokoban_block_invoke()
{
  uint64_t result = _fpfs_is_feature_flag_enabled((uint64_t)"Sokoban");
  fpfs_supports_sokoban_feature_enabled = result;
  return result;
}

uint64_t _fpfs_is_feature_flag_enabled(uint64_t a1)
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  uint64_t result = os_variant_has_internal_content();
  if (result)
  {
    size_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.fileproviderd.%sDevelopment", a1);
    uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v5 = [v4 BOOLForKey:v3];

    return v5;
  }
  return result;
}

uint64_t FPFSProviderIsForcedForFPFS(void *a1)
{
  uint64_t v1 = FPFSProviderIsForcedForFPFS_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&FPFSProviderIsForcedForFPFS_onceToken, &__block_literal_global_31_0);
  }
  uint64_t v3 = [(id)FPFSProviderIsForcedForFPFS_enabledProviders containsObject:v2];

  return v3;
}

void __fp_leave_section_Notice(uint64_t *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *a1;
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_DEFAULT, "[NOTICE] ┗%llx ", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1A33EDCD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_sync_exit(v18);
  _Unwind_Resume(a1);
}

uint64_t __readFrameworkOverridingModulesFromURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (objc_opt_respondsToSelector()) {
    uint64_t v6 = [v4 overridePriority];
  }
  else {
    uint64_t v6 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = [v5 overridePriority];
  }
  else {
    uint64_t v7 = 0;
  }
  if (v6 <= v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = -1;
  }
  if (v6 < v7) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }

  return v9;
}

uint64_t fpfs_lp_sandbox_check(int a1, uint64_t a2, int a3, const char *a4)
{
  uint64_t v8 = sandbox_check();
  if ((v8 & 0x80000000) != 0
    && (a3 & ~(*MEMORY[0x1E4F140E8] | *MEMORY[0x1E4F14100] | *MEMORY[0x1E4F140F0] | *MEMORY[0x1E4F140F8] | *MEMORY[0x1E4F140E0] | *MEMORY[0x1E4F14108])) == 1
    && *__error() == 63
    && fpfs_supports_long_paths())
  {
    __s = 0;
    size_t v9 = strlen(a4);
    dev_t v10 = strdup(a4);
    int v11 = fpfs_openat_longparent(-2, v10, &__s);
    if (v11 < 0)
    {
      while (*__s)
      {
        unint64_t v12 = v9 - strlen(__s);
        size_t v9 = v12 - (v12 > 1);
        v10[v9] = 0;
        int v13 = fpfs_openat_longparent(-2, v10, &__s);
        if ((v13 & 0x80000000) == 0)
        {
          int v11 = v13;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 0x40000000;
      v16[2] = __fpfs_lp_sandbox_check_block_invoke;
      v16[3] = &__block_descriptor_tmp_1;
      int v17 = a1;
      int v18 = a3;
      void v16[4] = a2;
      v16[5] = __s;
      uint64_t v8 = fpfs_fchdir(v11, (uint64_t)v16);
      int v14 = *__error();
      close(v11);
      *__error() = v14;
    }
    free(v10);
  }
  return v8;
}

void __itemCollectionUpdateQueue_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.FileProvider.ItemCollection.update-queue", v2);
  uint64_t v1 = (void *)itemCollectionUpdateQueue_updateQueue;
  itemCollectionUpdateQueue_updateQueue = (uint64_t)v0;
}

void __FPDataSourceBaseQueue_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.FileProvider.CollectionDataSource.queue", v2);
  uint64_t v1 = (void *)FPDataSourceBaseQueue_updateQueue;
  FPDataSourceBaseQueue_updateQueue = (uint64_t)v0;
}

id FPCreateBookmarkableStringFromDocumentURL(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  +[FPFrameworkOverridesIterator allOverrides];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)v15;
  while (2)
  {
    for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        id v13 = 0;
        size_t v9 = [v8 FPBookmarkableStringFromDocumentURL:v3 error:&v13];
        id v10 = v13;
        int v11 = v10;
        if (v10)
        {
          id v5 = 0;
          if (a2) {
            *a2 = v10;
          }
        }
        else
        {
          if (!v9) {
            continue;
          }
          id v5 = v9;
        }

        goto LABEL_16;
      }
    }
    id v5 = (id)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5) {
      continue;
    }
    break;
  }
LABEL_16:

  return v5;
}

id cachedFrameworkOverridingObjects()
{
  if (cachedFrameworkOverridingObjects_onceToken != -1) {
    dispatch_once(&cachedFrameworkOverridingObjects_onceToken, &__block_literal_global_4);
  }
  dispatch_queue_t v0 = (void *)frameworkOverridingObjects;

  return v0;
}

void __FPDaemonActionOperationXPCInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6EE300];
  uint64_t v1 = (void *)FPDaemonActionOperationXPCInterface_interface;
  FPDaemonActionOperationXPCInterface_interface = v0;

  id v2 = (void *)FPDaemonActionOperationXPCInterface_interface;
  id v3 = FPDaemonActionOperationClientXPCInterface();
  [v2 setInterface:v3 forSelector:sel_registerFrameworkClient_operationCompletion_ argumentIndex:0 ofReply:0];

  id v4 = (void *)FPDaemonActionOperationXPCInterface_interface;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  [v4 setClasses:v8 forSelector:sel_registerFrameworkClient_operationCompletion_ argumentIndex:0 ofReply:1];

  size_t v9 = (void *)FPDaemonActionOperationXPCInterface_interface;
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v9 setClasses:v13 forSelector:sel_registerFrameworkClient_operationCompletion_ argumentIndex:1 ofReply:1];
}

id FPDaemonActionOperationClientXPCInterface()
{
  if (FPDaemonActionOperationClientXPCInterface_once != -1) {
    dispatch_once(&FPDaemonActionOperationClientXPCInterface_once, &__block_literal_global_383);
  }
  uint64_t v0 = (void *)FPDaemonActionOperationClientXPCInterface_interface;

  return v0;
}

uint64_t fpfs_lp_sandbox_check_by_audit_token(_OWORD *a1, uint64_t a2, int a3, const char *a4)
{
  long long v8 = a1[1];
  *(_OWORD *)__s = *a1;
  long long v23 = v8;
  uint64_t v9 = sandbox_check_by_audit_token();
  if ((v9 & 0x80000000) != 0
    && (a3 & ~(*MEMORY[0x1E4F140E8] | *MEMORY[0x1E4F14100] | *MEMORY[0x1E4F140F0] | *MEMORY[0x1E4F140F8] | *MEMORY[0x1E4F140E0] | *MEMORY[0x1E4F14108])) == 1
    && *__error() == 63
    && fpfs_supports_long_paths())
  {
    __s[0] = 0;
    size_t v10 = strlen(a4);
    uint64_t v11 = strdup(a4);
    int v12 = fpfs_openat_longparent(-2, v11, __s);
    if (v12 < 0)
    {
      while (*__s[0])
      {
        unint64_t v13 = v10 - strlen(__s[0]);
        size_t v10 = v13 - (v13 > 1);
        v11[v10] = 0;
        int v14 = fpfs_openat_longparent(-2, v11, __s);
        if ((v14 & 0x80000000) == 0)
        {
          int v12 = v14;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 0x40000000;
      void v18[2] = __fpfs_lp_sandbox_check_by_audit_token_block_invoke;
      v18[3] = &__block_descriptor_tmp_2_0;
      long long v15 = a1[1];
      long long v19 = *a1;
      long long v20 = v15;
      int v21 = a3;
      v18[4] = a2;
      void v18[5] = __s[0];
      uint64_t v9 = fpfs_fchdir(v12, (uint64_t)v18);
      int v16 = *__error();
      close(v12);
      *__error() = v16;
    }
    free(v11);
  }
  return v9;
}

void sub_1A33EFB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A33EFDF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33F0CF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1A33F0EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __FPPinningSupportedForItem_block_invoke()
{
  v3[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"NSFileProviderRootContainerItemIdentifier";
  v2[1] = @"NSFileProviderTrashContainerItemIdentifier";
  v3[0] = MEMORY[0x1E4F1CC38];
  v3[1] = MEMORY[0x1E4F1CC38];
  v2[2] = @"NSFileProviderWorkingSetContainerItemIdentifier";
  v2[3] = @"NSFileProviderTemporaryLocalFolderItemIdentifier";
  v3[2] = MEMORY[0x1E4F1CC38];
  v3[3] = MEMORY[0x1E4F1CC38];
  v2[4] = @"NSFileProviderAllDirectoriesContainerItemIdentifier";
  v2[5] = @"NSFileProviderSearchContainerItemIdentifier";
  v3[4] = MEMORY[0x1E4F1CC38];
  void v3[5] = MEMORY[0x1E4F1CC38];
  v2[6] = @"a1";
  v3[6] = MEMORY[0x1E4F1CC38];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:7];
  uint64_t v1 = (void *)FPPinningSupportedForItem_unsupportedIdentifiers;
  FPPinningSupportedForItem_unsupportedIdentifiers = v0;
}

void sub_1A33F14F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FPPathRelativeToVolumeRoot(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  bzero(v11, 0x414uLL);
  objc_msgSend(v5, "path", 0x200000000000005, 0, 0x400000000);
  id v6 = objc_claimAutoreleasedReturnValue();
  int v7 = getattrlist((const char *)[v6 fileSystemRepresentation], &v10, v11, 0x414uLL, 0x21u);

  if (v7 < 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:itemURL:debugDescription:", *__error(), v5, @"FPImportCookieEntry failed to get attributes");
      long long v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v8 = 0;
    }
  }
  else
  {
    if (a2) {
      *a2 = v12;
    }
    long long v8 = [NSString stringWithUTF8String:(char *)v13 + v13[0]];
  }

  return v8;
}

void sub_1A33F1F58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    FPNotSupportedError();
    *a10 = (id)objc_claimAutoreleasedReturnValue();
    objc_end_catch();
    JUMPOUT(0x1A33F1EF8);
  }
  _Unwind_Resume(exception_object);
}

id rewriteBeforeFirstSync(void *a1)
{
  id v1 = a1;
  id v2 = +[NSFileProviderItemVersion beforeFirstSyncComponent];
  unint64_t v3 = [v1 length];
  if (v3 >= [v2 length])
  {
    id v5 = objc_msgSend(v1, "subdataWithRange:", 0, objc_msgSend(v2, "length"));
    if ([v5 isEqual:v2]) {
      id v6 = v2;
    }
    else {
      id v6 = v1;
    }
    id v4 = v6;
  }
  else
  {
    id v4 = v1;
  }

  return v4;
}

void __FILEPROVIDER_BAD_EXTENSION__(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  int v7 = [NSString stringWithFormat:@"Domain %@ is replicated but the extension class %@ for the provider %@ doesn't implement NSFileProviderReplicatedExtension.  Break on %s to debug this.", v5, a3, v6, "__FILEPROVIDER_BAD_EXTENSION__"];
  long long v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v10 = v7;
    _os_log_fault_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
  }

  __assert_rtn("__FILEPROVIDER_BAD_EXTENSION__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 145, (const char *)[v7 UTF8String]);
}

void __FILEPROVIDER_V2_EXTENSION_WITHOUT_IMPL(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  int v7 = [NSString stringWithFormat:@"Trying to build an NSFileProviderExtension based extension for domain %@, but extension principal class %@ for the provider %@ does not implement NSFileProviderExtension. If you meant to use NSFileProviderReplicatedExtension, use the initializer  -[NSFileProviderDomain initWithIdentifier:displayName:] rather than -[NSFileProviderDomain initWithIdentifier:displayName:pathRelativeToDocumentStorage:]. Break on %s to debug this.", v5, a3, v6, "__FILEPROVIDER_V2_EXTENSION_WITHOUT_IMPL"];
  long long v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v10 = v7;
    _os_log_fault_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
  }

  __assert_rtn("__FILEPROVIDER_V2_EXTENSION_WITHOUT_IMPL", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXExtensionContext.m", 150, (const char *)[v7 UTF8String]);
}

void sub_1A33F3864(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33F3ED8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F3F60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33F3FD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33F42FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

void sub_1A33F4674(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F47B8(_Unwind_Exception *a1)
{
  __fp_pop_log((void **)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A33F4AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F4CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F4F78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F5228(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F53A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F5650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_1A33F5880(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F5A14(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F5F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
}

void sub_1A33F6104(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F6278(_Unwind_Exception *a1)
{
  __fp_pop_log((void **)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1A33F65D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F66CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F6B18(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F6C6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F6DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F7000(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F7234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F745C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F75C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F78F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
}

void sub_1A33F7F78(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A33F83CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void __FILEPROVIDER_BAD_EXTENT__(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 138413058;
    id v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    __int16 v11 = 2048;
    uint64_t v12 = a3;
    __int16 v13 = 2080;
    uint64_t v14 = "__FILEPROVIDER_BAD_EXTENT__";
    _os_log_fault_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_FAULT, "[CRIT] Illegal partial contents returned for %@ (%lu, %lu). Must return a properly aligned extent covering at least the requested range.  Break on %s to debug this.", (uint8_t *)&v7, 0x2Au);
  }
}

void sub_1A33F8F50(_Unwind_Exception *a1)
{
  __fp_pop_log((void **)(v1 - 208));
  _Unwind_Resume(a1);
}

void sub_1A33F92B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F991C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33F9C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FA158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FA374(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FA6C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FA80C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FB08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FB634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
}

void sub_1A33FB760(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33FBA1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FBEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FC02C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FC9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FCFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
}

void sub_1A33FD054(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A33FD1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_1A33FD51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FD6BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FDA8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FDDC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FE2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FE684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FE96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FEDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FF160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FF51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FF6BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A33FFB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340017C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340055C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3400A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va1, a16);
  va_start(va, a16);
  long long v17 = va_arg(va1, void *);
  __fp_pop_log((void **)va);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A3400BF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3400E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340127C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3401654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340182C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3401F98(_Unwind_Exception *a1)
{
  __fp_pop_log((void **)(v1 - 184));
  _Unwind_Resume(a1);
}

void sub_1A3402470(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340324C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *a58)
{
}

void sub_1A3403A24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3404230(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340447C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3404D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
}

void CheckAndWarn(void *a1, const char *a2)
{
  id v3 = a1;
  if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    id v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      CheckAndWarn_cold_1((int)v3, a2);
    }
  }
}

void sub_1A3404F28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A34053C8(_Unwind_Exception *a1)
{
  __fp_pop_log((void **)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1A3405CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3405F6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3406314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void *);
  __fp_pop_log((void **)va);
  __fp_pop_log((void **)va1);
  _Unwind_Resume(a1);
}

id logStringForObjects(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 count];
  id v3 = NSString;
  if (v2 > 0xA)
  {
    uint64_t v5 = objc_msgSend(v1, "subarrayWithRange:", 0, 10);

    id v4 = [v3 stringWithFormat:@"%@...", v5];
    id v1 = (id)v5;
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"%@", v1];
  }

  return v4;
}

void sub_1A340693C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
}

void sub_1A3406BA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A34071D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3407990(_Unwind_Exception *a1)
{
  __fp_pop_log((void **)(v1 - 224));
  _Unwind_Resume(a1);
}

void sub_1A3407D10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3407FCC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3408238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A34086F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3408EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
}

void sub_1A34090C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340A804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340A974(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340B0A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340B7D4(_Unwind_Exception *a1)
{
  __fp_pop_log((void **)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1A340BBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340BD68(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340BF0C(_Unwind_Exception *a1)
{
  __fp_pop_log((void **)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1A340C2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340C4D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340C628(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340C888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340CCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340CE38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340CF80(_Unwind_Exception *a1)
{
  __fp_pop_log((void **)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A340D1A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340D2A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340D424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340D6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340D9C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340DB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340DDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340DEF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340E2B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void *);
  __fp_pop_log((void **)va);
  __fp_pop_log((void **)va1);
  _Unwind_Resume(a1);
}

void sub_1A340E594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340E774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_1A340E924(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340EC50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340ED68(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340EFB4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340F0C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340F30C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340F418(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340F664(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340F770(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A340F99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A34101D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3410444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A341069C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3410940(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3410D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3410E60(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A341107C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A341155C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A34116F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(float *)a3 = a1;
  *(void *)(a3 + 4) = a4;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = v4;
  *(_WORD *)(a3 + 22) = 2080;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  *(_WORD *)(a2 + 22) = 2080;
  return result;
}

void OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = v2;
  *(_WORD *)(a2 + 32) = v3;
  *(void *)(a2 + 34) = 0;
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2080;
  return result;
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 14) = v3;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
}

void OUTLINED_FUNCTION_17(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_19(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = v3;
  *(_WORD *)(a2 + 32) = v2;
  *(void *)(a2 + 34) = 0;
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_23(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_25(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_26(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_29(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_31(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = v3;
  *(_WORD *)(a2 + 32) = 1024;
  *(_DWORD *)(a2 + 34) = 0;
  *(_WORD *)(a2 + 38) = v2;
  *(void *)(a2 + 40) = 0;
}

void OUTLINED_FUNCTION_32(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_35(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_36(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t CalculateFolderType(void *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if ([v11 isEqualToString:@"Downloads"]
    && ([v12 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"] & 1) != 0)
  {
    goto LABEL_3;
  }
  if (!objc_msgSend(v13, "fp_isiCloudDriveOrCloudDocsIdentifier")) {
    goto LABEL_15;
  }
  if (([v12 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"] & 1) == 0)
  {
    long long v17 = [v14 URLByDeletingLastPathComponent];
    int v18 = [v17 lastPathComponent];
    int v19 = [v18 isEqualToString:@"com~apple~CloudDocs"];

    if (!v19) {
      goto LABEL_15;
    }
  }
  if ([v11 isEqualToString:@"Desktop"])
  {
LABEL_8:
    uint64_t v16 = 2;
    goto LABEL_16;
  }
  if ([v11 isEqualToString:@"Documents"])
  {
LABEL_10:
    uint64_t v16 = 3;
    goto LABEL_16;
  }
  if (([v11 isEqualToString:@"Downloads"] & 1) == 0)
  {
    if (a5)
    {
      if ([v15 isEqualToString:@"com.apple.Desktop"]) {
        goto LABEL_8;
      }
      if ([v15 isEqualToString:@"com.apple.Documents"]) {
        goto LABEL_10;
      }
    }
LABEL_15:
    uint64_t v16 = 1;
    goto LABEL_16;
  }
LABEL_3:
  uint64_t v16 = 4;
LABEL_16:

  return v16;
}

void __FILEPROVIDER_BAD_ITEM__(void *a1, void *a2, void *a3, void *a4, uint64_t a5, int a6, int a7)
{
  id v16 = a1;
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  if (![v13 length]) {
    __FILEPROVIDER_BAD_ITEM_MISSING_PROVIDER__(v16, v13, v14, a7);
  }
  if (![v14 length]) {
    __FILEPROVIDER_BAD_ITEM_MISSING_IDENTIFIER__(v16, v13, v14, a7);
  }
  if ([v15 length])
  {
    if (a5) {
      goto LABEL_7;
    }
  }
  else
  {
    __FILEPROVIDER_BAD_ITEM_MISSING_FILENAME__(v16, v13, v14, a7);
    if (a5)
    {
LABEL_7:
      if (!a6) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  __FILEPROVIDER_BAD_ITEM_MISSING_CONTENTTYPE__(v16, v13, v14, a7);
  if (a6) {
LABEL_8:
  }
    __FILEPROVIDER_BAD_ITEM_MISSING_ITEMVERSION__(v16, v13, v14, a7);
LABEL_9:
}

void __FILEPROVIDER_BAD_ITEM_MISSING_PROVIDER__(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (a4)
  {
    id v12 = [NSString stringWithFormat:@"Provider %@ returned invalid item %@ of class %@ with identifier %@, missing provider. Break on %s to debug this.", v8, v7, objc_opt_class(), v9, "__FILEPROVIDER_BAD_ITEM_MISSING_PROVIDER__"];
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v12;
      _os_log_fault_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_BAD_ITEM_MISSING_PROVIDER__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 363, (const char *)[v12 UTF8String]);
  }
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2082;
    long long v23 = "__FILEPROVIDER_BAD_ITEM_MISSING_PROVIDER__";
    id v11 = v19;
    _os_log_fault_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Provider %{public}@ returned invalid item %@ of class %{public}@ with identifier %{public}@, missing provider. Break on %{public}s to debug this.", buf, 0x34u);
  }
}

void __FILEPROVIDER_BAD_ITEM_MISSING_IDENTIFIER__(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (a4)
  {
    id v12 = [NSString stringWithFormat:@"Provider %@ returned invalid item %@ of class %@ with identifier %@, missing identifier. Break on %s to debug this.", v8, v7, objc_opt_class(), v9, "__FILEPROVIDER_BAD_ITEM_MISSING_IDENTIFIER__"];
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v12;
      _os_log_fault_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_BAD_ITEM_MISSING_IDENTIFIER__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 375, (const char *)[v12 UTF8String]);
  }
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2082;
    long long v23 = "__FILEPROVIDER_BAD_ITEM_MISSING_IDENTIFIER__";
    id v11 = v19;
    _os_log_fault_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Provider %{public}@ returned invalid item %@ of class %{public}@ with identifier %{public}@, missing identifier. Break on %{public}s to debug this.", buf, 0x34u);
  }
}

void __FILEPROVIDER_BAD_ITEM_MISSING_FILENAME__(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (a4)
  {
    id v12 = [NSString stringWithFormat:@"Provider %@ returned invalid item %@ of class %@ with identifier %@, missing filename. Break on %s to debug this.", v8, v7, objc_opt_class(), v9, "__FILEPROVIDER_BAD_ITEM_MISSING_FILENAME__"];
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v12;
      _os_log_fault_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_BAD_ITEM_MISSING_FILENAME__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 387, (const char *)[v12 UTF8String]);
  }
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2082;
    long long v23 = "__FILEPROVIDER_BAD_ITEM_MISSING_FILENAME__";
    id v11 = v19;
    _os_log_fault_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Provider %{public}@ returned invalid item %@ of class %{public}@ with identifier %{public}@, missing filename. Break on %{public}s to debug this.", buf, 0x34u);
  }
}

void __FILEPROVIDER_BAD_ITEM_MISSING_CONTENTTYPE__(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (a4)
  {
    id v12 = [NSString stringWithFormat:@"Provider %@ returned invalid item %@ of class %@ with identifier %@, missing contentType. Break on %s to debug this.", v8, v7, objc_opt_class(), v9, "__FILEPROVIDER_BAD_ITEM_MISSING_CONTENTTYPE__"];
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v12;
      _os_log_fault_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_BAD_ITEM_MISSING_CONTENTTYPE__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 399, (const char *)[v12 UTF8String]);
  }
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2082;
    long long v23 = "__FILEPROVIDER_BAD_ITEM_MISSING_CONTENTTYPE__";
    id v11 = v19;
    _os_log_fault_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Provider %{public}@ returned invalid item %@ of class %{public}@ with identifier %{public}@, missing contentType. Break on %{public}s to debug this.", buf, 0x34u);
  }
}

void __FILEPROVIDER_BAD_ITEM_MISSING_ITEMVERSION__(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (a4)
  {
    id v12 = [NSString stringWithFormat:@"Provider %@ returned invalid item %@ of class %@ with identifier %@, missing itemVersion. Break on %s to debug this.", v8, v7, objc_opt_class(), v9, "__FILEPROVIDER_BAD_ITEM_MISSING_ITEMVERSION__"];
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v12;
      _os_log_fault_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_BAD_ITEM_MISSING_ITEMVERSION__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 411, (const char *)[v12 UTF8String]);
  }
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2114;
    id v21 = v9;
    __int16 v22 = 2082;
    long long v23 = "__FILEPROVIDER_BAD_ITEM_MISSING_ITEMVERSION__";
    id v11 = v19;
    _os_log_fault_impl(&dword_1A33AE000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Provider %{public}@ returned invalid item %@ of class %{public}@ with identifier %{public}@, missing itemVersion. Break on %{public}s to debug this.", buf, 0x34u);
  }
}

void __FILEPROVIDER_BAD_CONTENT_POLICY__(unint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1 >= 4 && a1 - 500 >= 3)
  {
    if (a2)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Provider returned invalid content policy %ld", a1);
      uint64_t v5 = fp_current_or_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        unint64_t v7 = (unint64_t)v4;
        _os_log_fault_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
      }

      __assert_rtn("__FILEPROVIDER_BAD_CONTENT_POLICY__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/FPItem.m", 456, (const char *)[v4 UTF8String]);
    }
    uint64_t v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v7 = a1;
      _os_log_fault_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_FAULT, "[CRIT] Provider returned invalid content policy %ld", buf, 0xCu);
    }
  }
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return v0;
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return v0;
}

void OUTLINED_FUNCTION_14_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_17_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t fpfs_acl_is_set(_acl *a1, acl_perm_t a2)
{
  acl_entry_t entry_p = 0;
  int entry = acl_get_entry(a1, 0, &entry_p);
  uint64_t result = 0;
  if (!entry)
  {
    while (1)
    {
      acl_tag_t tag_type_p = ACL_UNDEFINED_TAG;
      if (acl_get_tag_type(entry_p, &tag_type_p)) {
        BOOL v6 = 0;
      }
      else {
        BOOL v6 = tag_type_p == ACL_EXTENDED_DENY;
      }
      if (!v6) {
        goto LABEL_19;
      }
      acl_permset_t permset_p = 0;
      if (acl_get_permset(entry_p, &permset_p)) {
        goto LABEL_19;
      }
      qualifier = acl_get_qualifier(entry_p);
      if (!qualifier) {
        goto LABEL_19;
      }
      uint64_t v8 = qualifier;
      __int16 v16 = 0;
      uint64_t v9 = (char *)malloc_type_malloc(0x105uLL, 0x3D1D51D0uLL);
      if (!v9) {
        goto LABEL_12;
      }
      uint64_t v10 = v9;
      int v17 = 0;
      if (mbr_identifier_translate()) {
        break;
      }
      if (v17 == 1) {
        id v11 = "user";
      }
      else {
        id v11 = "group";
      }
      snprintf(v10, 0x105uLL, "%s:%s", v11, (const char *)v16);
      free(v16);
      acl_free(v8);
      if (!strcmp(v10, "group:everyone") && acl_get_perm_np(permset_p, a2))
      {
        free(v10);
        return 1;
      }
      free(v10);
LABEL_19:
      if (entry_p) {
        int v12 = -1;
      }
      else {
        int v12 = 0;
      }
      if (acl_get_entry(a1, v12, &entry_p)) {
        return 0;
      }
    }
    free(v10);
LABEL_12:
    acl_free(v8);
    goto LABEL_19;
  }
  return result;
}

uint64_t fpfs_fset_acl(uint64_t a1, acl_perm_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  acl_permset_t permset_d = 0;
  acl_entry_t entry_p = 0;
  fd = acl_get_fd(a1);
  if (!fd)
  {
    if (*__error() != 2) {
      return 0xFFFFFFFFLL;
    }
    acl_t acl_p = acl_init(1);
    if (!acl_p) {
      return 0xFFFFFFFFLL;
    }
LABEL_8:
    long long tag_qualifier_p = 0uLL;
    os_unfair_lock_lock(&resolve_everyone_grpuuid_lock);
    if (resolve_everyone_grpuuid__cached != 1)
    {
      os_unfair_lock_unlock(&resolve_everyone_grpuuid_lock);
      uint64_t v24 = 0;
      size_t v14 = sysconf(71);
      if ((v14 & 0x8000000000000000) != 0) {
        goto LABEL_26;
      }
      size_t v15 = v14;
      __int16 v16 = (char *)malloc_type_malloc(v14, 0x940A73FBuLL);
      if (!v16) {
        goto LABEL_26;
      }
      memset(&v26, 0, sizeof(v26));
      while (1)
      {
        int v17 = v16;
        if (!getgrnam_r("everyone", &v26, v16, v15, &v24)) {
          break;
        }
        if (*__error() == 34)
        {
          v15 *= 16;
          __int16 v16 = (char *)malloc_type_realloc(v17, v15, 0x4E423210uLL);
          if (v16) {
            continue;
          }
        }
        free(v17);
        goto LABEL_26;
      }
      gid_t v18 = v24 ? v24->gr_gid : 0;
      free(v17);
      v26.gr_name = 0;
      v26.gr_passwd = 0;
      if (mbr_gid_to_uuid(v18, (unsigned __int8 *)&v26) < 0)
      {
LABEL_26:
        uint64_t v6 = 0;
LABEL_47:
        int v19 = *__error();
        acl_free(acl_p);
        *__error() = v19;
        return v6;
      }
      os_unfair_lock_lock(&resolve_everyone_grpuuid_lock);
      if ((resolve_everyone_grpuuid__cached & 1) == 0)
      {
        resolve_everyone_grpuuid_everyoneUUID = *(_OWORD *)&v26.gr_name;
        resolve_everyone_grpuuid__cached = 1;
      }
    }
    long long tag_qualifier_p = resolve_everyone_grpuuid_everyoneUUID;
    os_unfair_lock_unlock(&resolve_everyone_grpuuid_lock);
    uint64_t v7 = acl_create_entry(&acl_p, &entry_p);
    if ((v7 & 0x80000000) != 0)
    {
      uint64_t v6 = v7;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        fpfs_fset_acl_cold_1();
      }
    }
    else
    {
      uint64_t v8 = acl_set_tag_type(entry_p, ACL_EXTENDED_DENY);
      if ((v8 & 0x80000000) != 0)
      {
        uint64_t v6 = v8;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          fpfs_fset_acl_cold_2();
        }
      }
      else
      {
        uint64_t permset = acl_get_permset(entry_p, &permset_d);
        if ((permset & 0x80000000) != 0)
        {
          uint64_t v6 = permset;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            fpfs_fset_acl_cold_3();
          }
        }
        else
        {
          uint64_t v10 = acl_clear_perms(permset_d);
          if ((v10 & 0x80000000) != 0)
          {
            uint64_t v6 = v10;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              fpfs_fset_acl_cold_4();
            }
          }
          else
          {
            uint64_t v11 = acl_add_perm(permset_d, a2);
            if ((v11 & 0x80000000) != 0)
            {
              uint64_t v6 = v11;
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                fpfs_fset_acl_cold_5();
              }
            }
            else
            {
              uint64_t v12 = acl_set_qualifier(entry_p, &tag_qualifier_p);
              if ((v12 & 0x80000000) != 0)
              {
                uint64_t v6 = v12;
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                  fpfs_fset_acl_cold_6();
                }
              }
              else
              {
                uint64_t v13 = acl_set_permset(entry_p, permset_d);
                if ((v13 & 0x80000000) != 0)
                {
                  uint64_t v6 = v13;
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                    fpfs_fset_acl_cold_7();
                  }
                }
                else
                {
                  uint64_t v6 = MEMORY[0x1A6247EF0](a1, acl_p);
                  if ((v6 & 0x80000000) != 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                    fpfs_fset_acl_cold_8();
                  }
                }
              }
            }
          }
        }
      }
    }
    goto LABEL_47;
  }
  uint64_t v5 = fd;
  if (!fpfs_acl_is_set(fd, a2))
  {
    acl_t acl_p = v5;
    goto LABEL_8;
  }
  acl_free(v5);
  return 0;
}

uint64_t fpfs_clear_file_acl(const char *a1)
{
  __int16 v2 = acl_init(0);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = acl_set_link_np(a1, ACL_TYPE_ACCESS, v2);
  if ((v4 & 0x80000000) != 0 && *__error() == 45)
  {
    uint64_t v4 = 0;
    *__error() = 0;
  }
  int v5 = *__error();
  acl_free(v3);
  *__error() = v5;
  return v4;
}

uint64_t fpfs_clear_acl(uint64_t a1)
{
  acl_t v2 = acl_init(0);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  acl_t v3 = v2;
  uint64_t v4 = MEMORY[0x1A6247EF0](a1, v2);
  int v5 = *__error();
  acl_free(v3);
  *__error() = v5;
  return v4;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A341B924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A341C5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_destroyWeak(v27);
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(&location);
  __fp_leave_section_Debug((uint64_t)&a20);
  _Unwind_Resume(a1);
}

void sub_1A341C85C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

xattr_flags_t fpfs_xattr_is_content_dependent(char *a1)
{
  return (fpfs_xattr_flags_from_name(a1) >> 1) & 1;
}

uint64_t fpfs_fsetxattr(int a1, char *__s1, const void *a3, size_t a4, u_int32_t a5, int a6)
{
  uint64_t result = strcmp(__s1, "com.apple.fpfs.fileid");
  if (result)
  {
    return fsetxattr(a1, __s1, a3, a4, a5, a6);
  }
  return result;
}

uint64_t fpfs_set_tag_data(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 && (size_t v7 = *(void *)(a2 + 8)) != 0)
  {
    if ((fpfs_fsetxattr(a1, "com.apple.metadata:_kMDItemUserTags", *(const void **)a2, v7, 0, 0) & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    if (fremovexattr(a1, "com.apple.metadata:_kMDItemUserTags", 0) < 0 && *__error() != 93) {
      return 0xFFFFFFFFLL;
    }
    if (!a2)
    {
      char v8 = 0;
      goto LABEL_11;
    }
  }
  char v8 = *(unsigned char *)(a2 + 16);
LABEL_11:
  uint64_t result = 0;
  *(unsigned char *)(a3 + 1) = 1;
  *(unsigned char *)(a4 + 1) = v8;
  return result;
}

uint64_t fpfs_serialize_last_use_date(uint64_t *a1, UInt8 *a2, unint64_t a3, int a4)
{
  if (a4 && (_validate_last_used_time(a1) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v13 = 0;
  size_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))getMDPropertyCopyEncodedDataForLastUsedDateWithTimeSpecSymbolLoc_ptr;
  __int16 v16 = getMDPropertyCopyEncodedDataForLastUsedDateWithTimeSpecSymbolLoc_ptr;
  if (!getMDPropertyCopyEncodedDataForLastUsedDateWithTimeSpecSymbolLoc_ptr)
  {
    uint64_t v10 = (void *)MetadataUtilitiesLibrary();
    v14[3] = (uint64_t)dlsym(v10, "MDPropertyCopyEncodedDataForLastUsedDateWithTimeSpec");
    getMDPropertyCopyEncodedDataForLastUsedDateWithTimeSpecSymbolLoc_ptr = (_UNKNOWN *)v14[3];
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v9) {
    fpfs_serialize_last_use_date_cold_1();
  }
  CFDataRef v11 = (const __CFData *)v9(v7, v8);
  if (consume_data_into_buffer(v11, a2, a3) == 16) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void sub_1A341D19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _validate_last_used_time(uint64_t *a1)
{
  if (*a1 < 1000000000)
  {
LABEL_5:
    *__error() = 33;
    return 0xFFFFFFFFLL;
  }
  v3.tv_sec = 0;
  *(void *)&v3.tv_usec = 0;
  if ((gettimeofday(&v3, 0) & 0x80000000) == 0)
  {
    if (*a1 <= v3.tv_sec + 86400 && a1[1] <= 999999999) {
      return 0;
    }
    goto LABEL_5;
  }
  return 0xFFFFFFFFLL;
}

uint64_t consume_data_into_buffer(const __CFData *a1, UInt8 *a2, unint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unint64_t Length = CFDataGetLength(a1);
  if (Length <= a3)
  {
    uint64_t v7 = Length;
    v9.location = 0;
    v9.length = Length;
    CFDataGetBytes(a1, v9, a2);
  }
  else
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  CFRelease(a1);
  return v7;
}

uint64_t fpfs_deserialize_last_use_date(uint64_t *a1, const UInt8 *a2, CFIndex a3, int a4)
{
  CFDataRef v6 = CFDataCreate(0, a2, a3);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v7 = (uint64_t (*)(CFDataRef, uint64_t *))getMDPropertyDecodedLastUsedDateTimeSpecSymbolLoc_ptr;
  size_t v14 = getMDPropertyDecodedLastUsedDateTimeSpecSymbolLoc_ptr;
  if (!getMDPropertyDecodedLastUsedDateTimeSpecSymbolLoc_ptr)
  {
    uint64_t v8 = (void *)MetadataUtilitiesLibrary();
    v12[3] = (uint64_t)dlsym(v8, "MDPropertyDecodedLastUsedDateTimeSpec");
    getMDPropertyDecodedLastUsedDateTimeSpecSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    uint64_t v7 = (uint64_t (*)(CFDataRef, uint64_t *))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v7) {
    fpfs_deserialize_last_use_date_cold_1();
  }
  int v9 = v7(v6, a1);
  CFRelease(v6);
  if (v9)
  {
    if (a4) {
      return _validate_last_used_time(a1);
    }
    else {
      return 0;
    }
  }
  else
  {
    *__error() = 34;
    return 0xFFFFFFFFLL;
  }
}

void sub_1A341D3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_set_last_use_date(int a1, uint64_t *a2, int a3)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = 0;
  if ((fpfs_serialize_last_use_date(a2, (UInt8 *)v5, 0x10uLL, a3) & 0x80000000) == 0) {
    return fpfs_fsetxattr(a1, "com.apple.lastuseddate#PS", v5, 0x10uLL, 0, 0);
  }
  if (fremovexattr(a1, "com.apple.lastuseddate#PS", 0) < 0 && *__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t fpfs_serialize_favorite_rank(uint64_t a1, UInt8 *a2, unint64_t a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  CFDataRef v6 = (uint64_t (*)(uint64_t, void))getMDPropertyCopyEncodedDataForFavoriteRankSymbolLoc_ptr;
  uint64_t v13 = getMDPropertyCopyEncodedDataForFavoriteRankSymbolLoc_ptr;
  if (!getMDPropertyCopyEncodedDataForFavoriteRankSymbolLoc_ptr)
  {
    uint64_t v7 = (void *)MetadataUtilitiesLibrary();
    v11[3] = (uint64_t)dlsym(v7, "MDPropertyCopyEncodedDataForFavoriteRank");
    getMDPropertyCopyEncodedDataForFavoriteRankSymbolLoc_ptr = (_UNKNOWN *)v11[3];
    CFDataRef v6 = (uint64_t (*)(uint64_t, void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v6) {
    fpfs_serialize_favorite_rank_cold_1();
  }
  CFDataRef v8 = (const __CFData *)v6(a1, 0);
  if (v8) {
    return consume_data_into_buffer(v8, a2, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void sub_1A341D5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_deserialize_favorite_rank(void *a1, const UInt8 *a2, CFIndex a3)
{
  if (a3)
  {
    CFDataRef v4 = CFDataCreate(0, a2, a3);
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    int v5 = (uint64_t (*)(CFDataRef, void *))getMDPropertyDecodedFavoritRankSymbolLoc_ptr;
    uint64_t v12 = getMDPropertyDecodedFavoritRankSymbolLoc_ptr;
    if (!getMDPropertyDecodedFavoritRankSymbolLoc_ptr)
    {
      CFDataRef v6 = (void *)MetadataUtilitiesLibrary();
      v10[3] = (uint64_t)dlsym(v6, "MDPropertyDecodedFavoritRank");
      getMDPropertyDecodedFavoritRankSymbolLoc_ptr = (_UNKNOWN *)v10[3];
      int v5 = (uint64_t (*)(CFDataRef, void *))v10[3];
    }
    _Block_object_dispose(&v9, 8);
    if (!v5) {
      fpfs_deserialize_favorite_rank_cold_1();
    }
    int v7 = v5(v4, a1);
    CFRelease(v4);
    if (v7) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t result = 0;
    *a1 = 0;
  }
  return result;
}

void sub_1A341D730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_set_favorite_rank(int a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v5, 0, sizeof(v5));
  int v3 = fpfs_serialize_favorite_rank(a2, (UInt8 *)v5, 0x80uLL);
  fremovexattr(a1, "com.apple.favorite-rank.number#PS", 0);
  if (v3 > 0) {
    return fpfs_fsetxattr(a1, "com.apple.metadata:kMDItemFavoriteRank", v5, v3, 0, 0);
  }
  if (fremovexattr(a1, "com.apple.metadata:kMDItemFavoriteRank", 0) < 0 && *__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t fpfs_set_is_ignore_root(int fd, char *__s)
{
  if (__s)
  {
    size_t v4 = strlen(__s);
    return fpfs_fsetxattr(fd, "com.apple.fileprovider.ignore#P", __s, v4, 0, 0);
  }
  else if (fremovexattr(fd, "com.apple.fileprovider.ignore#P", 0) < 0 && *__error() != 93)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

uint64_t fpfs_set_is_pinned(int a1, int a2)
{
  if (a2)
  {
    return fpfs_fsetxattr(a1, "com.apple.fileprovider.pinned#PX", "1", 1uLL, 0, 0);
  }
  else if (fremovexattr(a1, "com.apple.fileprovider.pinned#PX", 0) < 0 && *__error() != 93)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

uint64_t fpfs_remove_before_bounce_filename(int a1)
{
  if (fremovexattr(a1, "com.apple.fileprovider.before-bounce#P", 0) < 0 && *__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t fpfs_set_before_bounce_filename_on_path(char *a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __fpfs_set_before_bounce_filename_on_path_block_invoke;
  v3[3] = &__block_descriptor_40_e8_i12__0i8l;
  v3[4] = a2;
  return fpfs_open(a1, 0x200000u, 0, 2, (uint64_t)v3);
}

uint64_t __fpfs_set_before_bounce_filename_on_path_block_invoke(uint64_t a1, int a2)
{
  return fpfs_set_before_bounce_filename(a2, *(char **)(a1 + 32));
}

uint64_t fpfs_set_before_bounce_filename(int a1, char *__s)
{
  if (__s)
  {
    if (*__s)
    {
      size_t v4 = strlen(__s) + 1;
      return fpfs_fsetxattr(a1, "com.apple.fileprovider.before-bounce#P", __s, v4, 0, 0);
    }
    else
    {
      uint64_t v6 = fpfs_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        fpfs_set_before_bounce_filename_cold_1(v6);
      }

      return fpfs_remove_before_bounce_filename(a1);
    }
  }
  else
  {
    return fpfs_remove_before_bounce_filename(a1);
  }
}

uint64_t fpfs_set_resurrected(int a1)
{
  return fpfs_fsetxattr(a1, "com.apple.fileprovider.is_resurrected#PN", "", 0, 0, 0);
}

uint64_t fpfs_remove_resurrected(int a1)
{
  return (fremovexattr(a1, "com.apple.fileprovider.is_resurrected#PN", 0) >> 31);
}

uint64_t fpfs_set_syncable_xattrs()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  int v3 = v0;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = (unsigned int (**)(id, char *))v4;
  bzero(namebuff, 0x8000uLL);
  unint64_t v6 = flistxattr(v3, namebuff, 0x8000uLL, 0);
  if ((v6 & 0x8000000000000000) != 0) {
    goto LABEL_4;
  }
  if (v6 > 0x8000)
  {
    *__error() = 12;
LABEL_4:
    uint64_t v2 = 0xFFFFFFFFLL;
    goto LABEL_5;
  }
  if (v6)
  {
    CFDataRef v8 = &namebuff[v6];
    uint64_t v9 = namebuff;
    do
    {
      size_t v10 = strlen(v9);
      if (v5[2](v5, v9))
      {
        if (v2)
        {
          uint64_t v11 = v2;
          while (strcmp(v9, *(const char **)(v11 + 8)))
          {
            uint64_t v11 = *(void *)v11;
            if (!v11) {
              goto LABEL_13;
            }
          }
        }
        else
        {
LABEL_13:
          if (fremovexattr(v3, v9, 0) < 0) {
            goto LABEL_4;
          }
        }
      }
      v9 += v10 + 1;
    }
    while (v9 < v8);
  }
  if (v2)
  {
    while ((fpfs_fsetxattr(v3, *(char **)(v2 + 8), (const void *)(v2 + 24), *(void *)(v2 + 16), 0, 0) & 0x80000000) == 0)
    {
      uint64_t v2 = *(void *)v2;
      if (!v2) {
        goto LABEL_5;
      }
    }
    goto LABEL_4;
  }
LABEL_5:

  return v2;
}

uint64_t fpfs_transfer_xattrs()
{
  int v0 = MEMORY[0x1F4188790]();
  int v2 = v1;
  int v3 = v0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = (uint64_t (**)(id, char *))v4;
  bzero(v14, 0x8000uLL);
  unint64_t v6 = flistxattr(v3, v14, 0x8000uLL, 0);
  if ((v6 & 0x8000000000000000) != 0) {
    goto LABEL_4;
  }
  if (v6 > 0x8000)
  {
    *__error() = 12;
LABEL_4:
    uint64_t v7 = 0xFFFFFFFFLL;
    goto LABEL_16;
  }
  if (v6)
  {
    CFDataRef v8 = &v14[v6];
    uint64_t v9 = v14;
    do
    {
      size_t v10 = strlen(v9);
      bzero(value, 0x8000uLL);
      if ((fpfs_xattr_flags_from_name(v9) & 2) == 0 && (v5[2](v5, v9) & 1) == 0)
      {
        ssize_t v11 = fgetxattr(v3, v9, value, 0x8000uLL, 0, 0);
        if (v11 < 0)
        {
          if (*__error() != 34) {
            goto LABEL_4;
          }
        }
        else if ((fpfs_fsetxattr(v2, v9, value, v11, 0, 2) & 0x80000000) != 0 && *__error() != 17)
        {
          goto LABEL_4;
        }
      }
      v9 += v10 + 1;
    }
    while (v9 < v8);
  }
  uint64_t v7 = 0;
LABEL_16:

  return v7;
}

unint64_t fpfs_copy_xattrs()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  int v2 = v1;
  int v3 = (const char *)v0;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  bzero(v10, 0x8000uLL);
  unint64_t result = listxattr(v3, v10, 0x8000uLL, 0);
  if ((result & 0x8000000000000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (result > 0x8000)
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  if (result)
  {
    int v5 = &v10[result];
    unint64_t v6 = v10;
    while (1)
    {
      size_t v7 = strlen(v6);
      bzero(value, 0x8000uLL);
      if (xattr_preserve_for_intent(v6, 1u) == 1)
      {
        unint64_t v8 = getxattr(v3, v6, value, 0x8000uLL, 0, 0);
        if (v8 <= 0x8000 && setxattr(v2, v6, value, v8, 0, 2) < 0) {
          break;
        }
      }
      v6 += v7 + 1;
      if (v6 >= v5) {
        return 0;
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

unint64_t fpfs_delete_xattrs()
{
  int v0 = MEMORY[0x1F4188790]();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  bzero(namebuff, 0x8000uLL);
  unint64_t result = flistxattr(v0, namebuff, 0x8000uLL, 0);
  if ((result & 0x8000000000000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (result > 0x8000)
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  if (result)
  {
    int v2 = &namebuff[result];
    int v3 = namebuff;
    while (1)
    {
      size_t v4 = strlen(v3);
      if (strcmp(v3, "com.apple.ResourceFork"))
      {
        if (fremovexattr(v0, v3, 0) < 0) {
          break;
        }
      }
      v3 += v4 + 1;
      if (v3 >= v2) {
        return 0;
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t fpfs_set_bplist_xattr(const char *a1, const char *a2, char *cStr, int a4)
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], cStr, 0x600u);
  if (!v8)
  {
    uint64_t v15 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      fpfs_set_bplist_xattr_cold_1(v15);
    }
    goto LABEL_8;
  }
  CFStringRef v9 = v8;
  CFErrorRef error = 0;
  CFDataRef v10 = CFPropertyListCreateData(v7, v8, kCFPropertyListBinaryFormat_v1_0, 0, &error);
  if (!v10)
  {
    CFRelease(v9);
    uint64_t v15 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      fpfs_set_bplist_xattr_cold_2((uint64_t *)&error, v15);
    }
LABEL_8:

    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  CFDataRef v11 = v10;
  BytePtr = CFDataGetBytePtr(v10);
  CFIndex Length = CFDataGetLength(v11);
  uint64_t v14 = setxattr(a1, a2, BytePtr, Length, 0, a4);
  CFRelease(v11);
  CFRelease(v9);
  return v14;
}

BOOL fpfs_path_has_provider_domain_xattr(const char *a1)
{
  return fpfs_path_return_assigned_provider_domain_xattr(a1, 0, 0, 0) != 0;
}

uint64_t fpfs_fset_collaboration_identifier(int fd, const char *a2)
{
  if (a2)
  {
    CFStringRef v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, 0x8000100u);
    if (v3)
    {
      CFStringRef v4 = v3;
      id MDItemCollaborationIdentifier = getMDItemCollaborationIdentifier();
      CFDataRef v6 = (const __CFData *)_MDPropertyCopyEncodedData((uint64_t)MDItemCollaborationIdentifier, (uint64_t)v4);
      if (v6)
      {
        CFDataRef v7 = v6;
        BytePtr = CFDataGetBytePtr(v6);
        CFIndex Length = CFDataGetLength(v7);
        uint64_t v10 = fpfs_fsetxattr(fd, "com.apple.metadata:kMDItemCollaborationIdentifier", BytePtr, Length, 0, 0);
        CFRelease(v7);
        CFRelease(v4);
        return v10;
      }
      CFRelease(v4);
    }
  }
  else if ((fremovexattr(fd, "com.apple.metadata:kMDItemCollaborationIdentifier", 0) & 0x80000000) == 0 {
         || *__error() == 93)
  }
  {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t _MDPropertyCopyEncodedData(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  CFStringRef v8 = &v7;
  uint64_t v9 = 0x2020000000;
  CFStringRef v4 = (uint64_t (*)(uint64_t, uint64_t))getMDPropertyCopyEncodedDataSymbolLoc_ptr;
  uint64_t v10 = getMDPropertyCopyEncodedDataSymbolLoc_ptr;
  if (!getMDPropertyCopyEncodedDataSymbolLoc_ptr)
  {
    int v5 = (void *)MetadataUtilitiesLibrary();
    v8[3] = (uint64_t)dlsym(v5, "MDPropertyCopyEncodedData");
    getMDPropertyCopyEncodedDataSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    CFStringRef v4 = (uint64_t (*)(uint64_t, uint64_t))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4) {
    _MDPropertyCopyEncodedData_cold_1();
  }
  return v4(a1, a2);
}

void sub_1A341E424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMDItemCollaborationIdentifier()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v0 = (void **)getMDItemCollaborationIdentifierSymbolLoc_ptr;
  uint64_t v7 = getMDItemCollaborationIdentifierSymbolLoc_ptr;
  if (!getMDItemCollaborationIdentifierSymbolLoc_ptr)
  {
    int v1 = (void *)CoreSpotlightLibrary();
    void v5[3] = (uint64_t)dlsym(v1, "MDItemCollaborationIdentifier");
    getMDItemCollaborationIdentifierSymbolLoc_ptr = v5[3];
    int v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getMDItemCollaborationIdentifier_cold_1();
  }
  int v2 = *v0;

  return v2;
}

void sub_1A341E52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_fset_is_shared(int fd, char a2)
{
  if (fpfs_fset_is_shared_onceToken == -1)
  {
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&fpfs_fset_is_shared_onceToken, &__block_literal_global_5);
    if (a2)
    {
LABEL_3:
      id MDItemIsShared = getMDItemIsShared();
      CFDataRef v5 = (const __CFData *)_MDPropertyCopyEncodedData((uint64_t)MDItemIsShared, *MEMORY[0x1E4F1CFD0]);
      if (v5)
      {
        CFDataRef v6 = v5;
        BytePtr = CFDataGetBytePtr(v5);
        CFIndex Length = CFDataGetLength(v6);
        uint64_t v9 = fpfs_fsetxattr(fd, (char *)fpfs_fset_is_shared_xattrNameBuffer, BytePtr, Length, 0, 0);
        CFRelease(v6);
        return v9;
      }
      return 0xFFFFFFFFLL;
    }
  }
  if ((fremovexattr(fd, (const char *)fpfs_fset_is_shared_xattrNameBuffer, 0) & 0x80000000) == 0 || *__error() == 93) {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t __fpfs_fset_is_shared_block_invoke()
{
  id MDItemIsShared = getMDItemIsShared();
  uint64_t result = _MDPropertyCopyXAttrName((uint64_t)MDItemIsShared);
  if (result)
  {
    CFStringRef v2 = (const __CFString *)result;
    uint64_t result = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)result);
    if (result >= 1)
    {
      CFIndex v3 = result;
      uint64_t v4 = (char *)malloc_type_calloc(1uLL, result + 1, 0xBF6CC646uLL);
      fpfs_fset_is_shared_xattrNameBuffer = (uint64_t)v4;
      return CFStringGetFileSystemRepresentation(v2, v4, v3);
    }
  }
  return result;
}

uint64_t _MDPropertyCopyXAttrName(uint64_t a1)
{
  uint64_t v5 = 0;
  CFDataRef v6 = &v5;
  uint64_t v7 = 0x2020000000;
  CFStringRef v2 = (uint64_t (*)(uint64_t))getMDPropertyCopyXAttrNameSymbolLoc_ptr;
  CFStringRef v8 = getMDPropertyCopyXAttrNameSymbolLoc_ptr;
  if (!getMDPropertyCopyXAttrNameSymbolLoc_ptr)
  {
    CFIndex v3 = (void *)MetadataUtilitiesLibrary();
    v6[3] = (uint64_t)dlsym(v3, "MDPropertyCopyXAttrName");
    getMDPropertyCopyXAttrNameSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    CFStringRef v2 = (uint64_t (*)(uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    _MDPropertyCopyXAttrName_cold_1();
  }
  return v2(a1);
}

void sub_1A341E7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMDItemIsShared()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v0 = (void **)getMDItemIsSharedSymbolLoc_ptr;
  uint64_t v7 = getMDItemIsSharedSymbolLoc_ptr;
  if (!getMDItemIsSharedSymbolLoc_ptr)
  {
    int v1 = (void *)CoreSpotlightLibrary();
    void v5[3] = (uint64_t)dlsym(v1, "MDItemIsShared");
    getMDItemIsSharedSymbolLoc_ptr = v5[3];
    int v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getMDItemIsShared_cold_1();
  }
  CFStringRef v2 = *v0;

  return v2;
}

void sub_1A341E8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_fset_is_shared_by_current_user(int fd, unsigned char *a2)
{
  if (fpfs_fset_is_shared_by_current_user_onceToken == -1)
  {
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&fpfs_fset_is_shared_by_current_user_onceToken, &__block_literal_global_18);
    if (a2)
    {
LABEL_3:
      if (*a2) {
        uint64_t v4 = @"NSURLUbiquitousSharedItemRoleOwner";
      }
      else {
        uint64_t v4 = @"NSURLUbiquitousSharedItemRoleParticipant";
      }
      id MDItemSharedItemCurrentUserRole = getMDItemSharedItemCurrentUserRole();
      CFDataRef v6 = (const __CFData *)_MDPropertyCopyEncodedData((uint64_t)MDItemSharedItemCurrentUserRole, (uint64_t)v4);
      if (v6)
      {
        CFDataRef v7 = v6;
        BytePtr = CFDataGetBytePtr(v6);
        CFIndex Length = CFDataGetLength(v7);
        uint64_t v10 = fpfs_fsetxattr(fd, (char *)fpfs_fset_is_shared_by_current_user_xattrNameBuffer, BytePtr, Length, 0, 0);
        CFRelease(v7);
        return v10;
      }
      return 0xFFFFFFFFLL;
    }
  }
  if ((fremovexattr(fd, (const char *)fpfs_fset_is_shared_by_current_user_xattrNameBuffer, 0) & 0x80000000) == 0
    || *__error() == 93)
  {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t __fpfs_fset_is_shared_by_current_user_block_invoke()
{
  id MDItemSharedItemCurrentUserRole = getMDItemSharedItemCurrentUserRole();
  uint64_t result = _MDPropertyCopyXAttrName((uint64_t)MDItemSharedItemCurrentUserRole);
  if (result)
  {
    CFStringRef v2 = (const __CFString *)result;
    uint64_t result = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)result);
    if (result >= 1)
    {
      CFIndex v3 = result;
      uint64_t v4 = (char *)malloc_type_calloc(1uLL, result + 1, 0xB131C7F2uLL);
      fpfs_fset_is_shared_by_current_user_xattrNameBuffer = (uint64_t)v4;
      return CFStringGetFileSystemRepresentation(v2, v4, v3);
    }
  }
  return result;
}

id getMDItemSharedItemCurrentUserRole()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v0 = (void **)getMDItemSharedItemCurrentUserRoleSymbolLoc_ptr;
  uint64_t v7 = getMDItemSharedItemCurrentUserRoleSymbolLoc_ptr;
  if (!getMDItemSharedItemCurrentUserRoleSymbolLoc_ptr)
  {
    int v1 = (void *)CoreSpotlightLibrary();
    void v5[3] = (uint64_t)dlsym(v1, "MDItemSharedItemCurrentUserRole");
    getMDItemSharedItemCurrentUserRoleSymbolLoc_ptr = v5[3];
    int v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getMDItemSharedItemCurrentUserRole_cold_1();
  }
  CFStringRef v2 = *v0;

  return v2;
}

void sub_1A341EB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_fset_owner_name(int fd, char *cStr)
{
  if (fpfs_fset_owner_name_onceToken == -1)
  {
    if (cStr) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&fpfs_fset_owner_name_onceToken, &__block_literal_global_24);
    if (cStr)
    {
LABEL_3:
      CFStringRef v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], cStr, 0x8000100u);
      if (v4)
      {
        CFStringRef v5 = v4;
        id MDItemOwnerName = getMDItemOwnerName();
        CFDataRef v7 = (const __CFData *)_MDPropertyCopyEncodedData((uint64_t)MDItemOwnerName, (uint64_t)v5);
        if (v7)
        {
          CFDataRef v8 = v7;
          BytePtr = CFDataGetBytePtr(v7);
          CFIndex Length = CFDataGetLength(v8);
          uint64_t v11 = fpfs_fsetxattr(fd, (char *)fpfs_fset_owner_name_xattrNameBuffer, BytePtr, Length, 0, 0);
          CFRelease(v8);
          CFRelease(v5);
          return v11;
        }
        CFRelease(v5);
      }
      return 0xFFFFFFFFLL;
    }
  }
  if ((fremovexattr(fd, (const char *)fpfs_fset_owner_name_xattrNameBuffer, 0) & 0x80000000) == 0 || *__error() == 93) {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t __fpfs_fset_owner_name_block_invoke()
{
  id MDItemOwnerName = getMDItemOwnerName();
  uint64_t result = _MDPropertyCopyXAttrName((uint64_t)MDItemOwnerName);
  if (result)
  {
    CFStringRef v2 = (const __CFString *)result;
    uint64_t result = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)result);
    if (result >= 1)
    {
      CFIndex v3 = result;
      CFStringRef v4 = (char *)malloc_type_calloc(1uLL, result + 1, 0x8C051985uLL);
      fpfs_fset_owner_name_xattrNameBuffer = (uint64_t)v4;
      return CFStringGetFileSystemRepresentation(v2, v4, v3);
    }
  }
  return result;
}

id getMDItemOwnerName()
{
  uint64_t v4 = 0;
  CFStringRef v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v0 = (void **)getMDItemOwnerNameSymbolLoc_ptr;
  uint64_t v7 = getMDItemOwnerNameSymbolLoc_ptr;
  if (!getMDItemOwnerNameSymbolLoc_ptr)
  {
    int v1 = (void *)CoreSpotlightLibrary();
    void v5[3] = (uint64_t)dlsym(v1, "MDItemOwnerName");
    getMDItemOwnerNameSymbolLoc_ptr = v5[3];
    int v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getMDItemOwnerName_cold_1();
  }
  CFStringRef v2 = *v0;

  return v2;
}

void sub_1A341EDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_fset_pause_sync_bundleID(int a1, char *__s)
{
  size_t v4 = strlen(__s);
  return (fsetxattr(a1, "com.apple.file-provider-sync_paused_bundle_id#PX", __s, v4, 0, 0) >> 31);
}

uint64_t fpfs_funset_pause_sync_bundleID(int a1)
{
  if (fremovexattr(a1, "com.apple.file-provider-sync_paused_bundle_id#PX", 0) < 0 && *__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t fpfs_fset_resuming_sync_with_drop_local_changes(int a1)
{
  return (fsetxattr(a1, "com.apple.file-provider-resuming-sync-drop-local-changes#PX", "", 0, 0, 0) >> 31);
}

uint64_t fpfs_funset_resuming_sync_with_drop_local_changes(int a1)
{
  if (fremovexattr(a1, "com.apple.file-provider-resuming-sync-drop-local-changes#PX", 0) < 0 && *__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t fpfs_set_root_exposure_symlink_xattr(const char *a1, char *__s)
{
  size_t v4 = strlen(__s) + 1;

  return setxattr(a1, "com.apple.fileprovider.domainLink#N", __s, v4, 0, 1);
}

const char *fpfs_root_exposure_symlink_xattr_exists(const char *result)
{
  if (result) {
    return (const char *)(getxattr(result, "com.apple.fileprovider.domainLink#N", 0, 0, 0, 1) >= 0);
  }
  return result;
}

BOOL fpfs_root_exposure_symlink_xattr_is_equal(const char *a1, char *__s)
{
  size_t v4 = strlen(__s) + 1;
  CFStringRef v5 = (char *)malloc_type_malloc(v4, 0xADD8949DuLL);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  BOOL v7 = (getxattr(a1, "com.apple.fileprovider.domainLink#N", v5, v4, 0, 1) & 0x8000000000000000) == 0
    && strncmp(__s, v6, v4) == 0;
  free(v6);
  return v7;
}

const char *__fpfs_xattr_flags_from_name_block_invoke()
{
  uint64_t result = (const char *)fpfs_xattr_flags_from_name_xattr_mods;
  if (fpfs_xattr_flags_from_name_xattr_mods)
  {
    int v1 = &off_1EB3E9480;
    do
    {
      *(v1 - 4) = xattr_name_without_flags(result);
      CFStringRef v2 = *v1;
      v1 += 4;
      uint64_t result = v2;
    }
    while (v2);
  }
  return result;
}

void *__getMDPropertyCopyEncodedDataForLastUsedDateWithTimeSpecSymbolLoc_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)MetadataUtilitiesLibrary();
  uint64_t result = dlsym(v2, "MDPropertyCopyEncodedDataForLastUsedDateWithTimeSpec");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDPropertyCopyEncodedDataForLastUsedDateWithTimeSpecSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                                  + 8)
                                                                                      + 24);
  return result;
}

uint64_t __MetadataUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MetadataUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMDPropertyDecodedLastUsedDateTimeSpecSymbolLoc_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)MetadataUtilitiesLibrary();
  uint64_t result = dlsym(v2, "MDPropertyDecodedLastUsedDateTimeSpec");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDPropertyDecodedLastUsedDateTimeSpecSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDPropertyCopyEncodedDataForFavoriteRankSymbolLoc_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)MetadataUtilitiesLibrary();
  uint64_t result = dlsym(v2, "MDPropertyCopyEncodedDataForFavoriteRank");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDPropertyCopyEncodedDataForFavoriteRankSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void *__getMDPropertyDecodedFavoritRankSymbolLoc_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)MetadataUtilitiesLibrary();
  uint64_t result = dlsym(v2, "MDPropertyDecodedFavoritRank");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDPropertyDecodedFavoritRankSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDPropertyCopyEncodedDataSymbolLoc_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)MetadataUtilitiesLibrary();
  uint64_t result = dlsym(v2, "MDPropertyCopyEncodedData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDPropertyCopyEncodedDataSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemCollaborationIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemCollaborationIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemCollaborationIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSpotlightLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreSpotlightLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMDPropertyCopyXAttrNameSymbolLoc_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)MetadataUtilitiesLibrary();
  uint64_t result = dlsym(v2, "MDPropertyCopyXAttrName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDPropertyCopyXAttrNameSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemIsSharedSymbolLoc_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemIsShared");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemIsSharedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemSharedItemCurrentUserRoleSymbolLoc_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemSharedItemCurrentUserRole");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemSharedItemCurrentUserRoleSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemOwnerNameSymbolLoc_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)CoreSpotlightLibrary();
  uint64_t result = dlsym(v2, "MDItemOwnerName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemOwnerNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDPropertyCopyDecodedValueSymbolLoc_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (void *)MetadataUtilitiesLibrary();
  uint64_t result = dlsym(v2, "MDPropertyCopyDecodedValue");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDPropertyCopyDecodedValueSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A341F9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3421280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,int a51,char a52)
{
  _Block_object_dispose((const void *)(v52 - 176), 8);
  __fp_leave_section_Debug((uint64_t)&a50);
  _Block_object_dispose(&a52, 8);
  _Unwind_Resume(a1);
}

void sub_1A3421EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3422328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3422608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_6_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return v0;
}

void sub_1A3423B58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34245D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1A34247FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *FPHumanReadableDropReason(unint64_t a1)
{
  if (a1 > 0xD) {
    return @"NA";
  }
  else {
    return off_1E5AF1E08[a1];
  }
}

uint64_t FPCSIndexReasonForFPIndexDropReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 4) > 9) {
    return 0;
  }
  else {
    return qword_1A34E4720[a1 - 4];
  }
}

void sub_1A342550C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
}

uint64_t tokensAreEqual(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v5 = [v3 isEqualToData:v4];
  uint64_t v6 = 1;
  if (v3 != v4 && (v5 & 1) == 0)
  {
    uint64_t v6 = 0;
    if (v3)
    {
      if (v4)
      {
        id v13 = 0;
        BOOL v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v13];
        id v8 = v13;
        if (v7)
        {
          id v12 = 0;
          uint64_t v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v12];
          id v10 = v12;

          if (v9) {
            uint64_t v6 = [v7 isEqual:v9];
          }
          else {
            uint64_t v6 = 0;
          }

          id v8 = v10;
        }
        else
        {
          uint64_t v6 = 0;
        }
      }
    }
  }

  return v6;
}

void sub_1A3425FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A34265B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_1A3426AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A3427920(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3427A3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getCSSearchableIndexClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_0)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreSpotlightLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5AF1DF0;
    uint64_t v5 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CoreSpotlightLibraryCore_frameworkLibrary_0) {
    __getCSSearchableIndexClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("CSSearchableIndex");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSSearchableIndexClass_block_invoke_cold_2();
  }
  getCSSearchableIndexClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSpotlightLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreSpotlightLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void OUTLINED_FUNCTION_4_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1A3428244(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3429030(void *a1)
{
}

void sub_1A342932C(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1A34292D0);
  }
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_3(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x34u);
}

uint64_t fpfs_lp_faccessat(int a1, const char *a2, int a3, int a4)
{
  uint64_t v8 = faccessat(a1, a2, a3, a4);
  if (v8)
  {
    if (*__error() == 63)
    {
      id v13 = 0;
      uint64_t v9 = fpfs_openat_longparent(a1, a2, &v13);
      uint64_t v8 = v9;
      if ((v9 & 0x80000000) == 0)
      {
        uint64_t v10 = faccessat(v9, v13, a3, a4);
        int v11 = *__error();
        close(v8);
        *__error() = v11;
        return v10;
      }
    }
  }
  return v8;
}

uint64_t fpfs_openbyid(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = openbyid_np();
  if ((v5 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, v5);
  if ((v7 & 0x80000000) != 0)
  {
    int v8 = *__error();
    close(v6);
    *__error() = v8;
  }
  else if (close(v6) < 0)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return v7;
  }
  return v7;
}

uint64_t fpfs_fopendir(int a1, uint64_t a2)
{
  int v3 = dup(a1);
  if (v3 < 0) {
    return 0xFFFFFFFFLL;
  }
  int v4 = v3;
  uint64_t v5 = fdopendir(v3);
  if (!v5)
  {
    int v11 = *__error();
    close(v4);
    *__error() = v11;
    return 0xFFFFFFFFLL;
  }
  int v6 = v5;
  rewinddir(v5);
  uint64_t v7 = readdir(v6);
  if (v7)
  {
    int v8 = v7;
    while (1)
    {
      if (v8->d_name[0] != 46 || v8->d_name[1] && (v8->d_name[1] != 46 || v8->d_name[2]))
      {
        uint64_t v9 = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
        if (v9) {
          break;
        }
      }
      int v8 = readdir(v6);
      if (!v8) {
        goto LABEL_11;
      }
    }
    uint64_t v12 = v9;
    int v13 = *__error();
    closedir(v6);
    *__error() = v13;
    return v12;
  }
LABEL_11:

  return closedir(v6);
}

uint64_t fpfs_opendir(char *a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = __fpfs_opendir_block_invoke;
  v3[3] = &unk_1E5AF1F80;
  v3[4] = a2;
  return fpfs_openat(4294967294, a1, 0x100000u, 0, 0, (uint64_t)v3);
}

uint64_t __fpfs_opendir_block_invoke(uint64_t a1, int a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = __fpfs_opendir_block_invoke_2;
  v3[3] = &unk_1E5AF1F58;
  v3[4] = *(void *)(a1 + 32);
  int v4 = a2;
  return fpfs_fopendir(a2, (uint64_t)v3);
}

uint64_t __fpfs_opendir_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), a2);
}

uint64_t fpfs_chdir(char *a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = __fpfs_chdir_block_invoke;
  v3[3] = &unk_1E5AF1FD0;
  v3[4] = a2;
  return fpfs_openat(4294967294, a1, 0, 0, 0, (uint64_t)v3);
}

uint64_t __fpfs_chdir_block_invoke(uint64_t a1, int a2)
{
  return fpfs_fchdir(a2, *(void *)(a1 + 32));
}

uint64_t fpfs_opendirat(int a1, uint64_t a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = __fpfs_opendirat_block_invoke;
  v4[3] = &unk_1E5AF1FF8;
  void v4[4] = a3;
  v4[5] = a2;
  return fpfs_fchdir(a1, (uint64_t)v4);
}

uint64_t __fpfs_opendirat_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(char **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = __fpfs_opendir_block_invoke;
  v4[3] = &unk_1E5AF1F80;
  void v4[4] = v2;
  return fpfs_openat(4294967294, v1, 0x100000u, 0, 0, (uint64_t)v4);
}

uint64_t fpfs_removeat(int a1, const char *a2)
{
  memset(&v5, 0, sizeof(v5));
  if (fstatat(a1, a2, &v5, 32) < 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return unlinkat(a1, a2, ((v5.st_mode & 0xF000) == 0x4000) << 7);
  }
}

uint64_t fpfs_fchflags(int a1, unsigned int a2, int a3)
{
  if ((a3 & a2) != 0)
  {
    int v3 = __error();
    int v4 = 22;
  }
  else if (a1 < 0)
  {
    int v3 = __error();
    int v4 = 9;
  }
  else if ((a3 | a2) >= 0x10000)
  {
    int v3 = __error();
    int v4 = 1;
  }
  else
  {
    memset(&v16, 0, sizeof(v16));
    if (fstat(a1, &v16) < 0) {
      return 0xFFFFFFFFLL;
    }
    int v9 = (a2 << 25) & 0x40000000 | a2;
    __uint32_t st_flags = v16.st_flags;
    if ((v16.st_flags & ~v9 | a3) == v16.st_flags) {
      return 0;
    }
    __uint32_t v13 = v16.st_flags;
    __uint32_t v14 = v16.st_flags & ~v9 | a3;
    int v11 = 4;
    __uint32_t v15 = v16.st_flags;
    while (--v11)
    {
      __uint32_t v13 = st_flags;
      __uint32_t v14 = st_flags & ~v9 | a3;
      if (ffsctl(a1, 0xC00C4114uLL, &v13, 0) < 0) {
        return 0xFFFFFFFFLL;
      }
      __uint32_t st_flags = v15;
      if ((a3 & ~v15) == 0 && (v15 & v9) == 0) {
        return 0;
      }
    }
    int v3 = __error();
    int v4 = 35;
  }
  *int v3 = v4;
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_chflags(char *a1, int a2, int a3)
{
  if (!a1) {
    return 22;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = __fpfs_chflags_block_invoke;
  v4[3] = &__block_descriptor_tmp_7;
  int v5 = a2;
  int v6 = a3;
  return fpfs_openat(4294967294, a1, 0x200000u, 0, 0, (uint64_t)v4);
}

uint64_t __fpfs_chflags_block_invoke(uint64_t a1, int a2)
{
  return fpfs_fchflags(a2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

uint64_t fpfs_with_parent_path(const char *a1, uint64_t a2)
{
  int v3 = strdup(a1);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  int v4 = v3;
  int v5 = dirname(v3);
  free(v4);
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  int v6 = strdup(v5);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = v6;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, v6);
  free(v7);
  return v8;
}

uint64_t fpfs_dirsize()
{
  if ((int)dirstat_np() < 0) {
    return -1;
  }
  else {
    return 0;
  }
}

uint64_t _t_fpfs_readbyte(char *a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___t_fpfs_readbyte_block_invoke;
  v3[3] = &__block_descriptor_tmp_8;
  v3[4] = a2;
  return fpfs_openat(4294967294, a1, 0, 0, 0, (uint64_t)v3);
}

uint64_t ___t_fpfs_readbyte_block_invoke(uint64_t a1, int __fd)
{
  unsigned __int8 __buf = 0;
  ssize_t v2 = pread(__fd, &__buf, 1uLL, *(void *)(a1 + 32));
  if (v2 == 1) {
    return __buf;
  }
  if (!v2) {
    *__error() = 22;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_enable_fts_thread_fchdir()
{
  return putenv("FTS_USE_THREAD_FCHDIR=YES");
}

void sub_1A3429D80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3429EDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A342A034(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A342A0A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A342A11C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A342A190(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A342A224(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A342A298(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A342A334(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A342A3D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A342A45C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void FPPerformWithPersona(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = a2;
  int v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  int v6 = [v5 currentPersona];

  id v7 = [v6 userPersonaUniqueString];
  uint64_t v8 = v7;
  if ((v3 == 0) == (v7 != 0))
  {
    gid_t v18 = [NSString stringWithFormat:@"One persona is unexpectedly nil: existing %@, requested %@", v3, v7];
    int v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      FPPerformWithPersona_cold_1();
    }

    __assert_rtn("FPPerformWithPersona", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/NSURL+FPAdditions.m", 88, (const char *)[v18 UTF8String]);
  }
  if (v7 != v3 && ![v7 isEqualToString:v3])
  {
    if ((voucher_process_can_use_arbitrary_personas() & 1) == 0)
    {
      int v17 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", 1);
      v4[2](v4, v17);

      goto LABEL_5;
    }
    id v21 = 0;
    int v9 = (void *)[v6 copyCurrentPersonaContextWithError:&v21];
    id v10 = v21;
    int v11 = v10;
    if (!v9)
    {
      id v20 = v10;
      int v9 = (void *)[v6 copyCurrentPersonaContextWithError:&v20];
      id v12 = v20;

      if (!v9)
      {
        v4[2](v4, v12);
LABEL_20:

        goto LABEL_5;
      }
      int v11 = v12;
    }
    __uint32_t v13 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

    if (v13)
    {
      [MEMORY[0x1E4F29060] sleepForTimeInterval:0.2];
      __uint32_t v13 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

      int v11 = v13;
    }
    v4[2](v4, v13);
    __uint32_t v14 = [v6 restorePersonaWithSavedPersonaContext:v9];

    if (v14)
    {
      [MEMORY[0x1E4F29060] sleepForTimeInterval:0.2];
      id v12 = [v6 restorePersonaWithSavedPersonaContext:v9];

      if (v12)
      {
        __uint32_t v15 = [NSString stringWithFormat:@"Failed restoring persona %@", v12];
        stat v16 = fp_current_or_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          FPPerformWithPersona_cold_1();
        }

        __assert_rtn("FPPerformWithPersona", "/Library/Caches/com.apple.xbs/Sources/FileProvider/framework/NSURL+FPAdditions.m", 126, (const char *)[v15 UTF8String]);
      }
    }
    else
    {
      id v12 = v11;
    }
    goto LABEL_20;
  }
  v4[2](v4, 0);
LABEL_5:
}

void sub_1A342AACC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A342BB20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A342C240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A342C65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getQLThumbnailAdditionClass()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getQLThumbnailAdditionClass_softClass;
  uint64_t v7 = getQLThumbnailAdditionClass_softClass;
  if (!getQLThumbnailAdditionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getQLThumbnailAdditionClass_block_invoke;
    v3[3] = &unk_1E5AF1950;
    v3[4] = &v4;
    __getQLThumbnailAdditionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A342C740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getGSStorageManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!GenerationalStorageLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __GenerationalStorageLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5AF20C0;
    uint64_t v5 = 0;
    GenerationalStorageLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!GenerationalStorageLibraryCore_frameworkLibrary) {
    __getGSStorageManagerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("GSStorageManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getGSStorageManagerClass_block_invoke_cold_2();
  }
  getGSStorageManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __GenerationalStorageLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  GenerationalStorageLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getQLThumbnailAdditionClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!QuickLookThumbnailingLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __QuickLookThumbnailingLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5AF20D8;
    uint64_t v5 = 0;
    QuickLookThumbnailingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!QuickLookThumbnailingLibraryCore_frameworkLibrary) {
    __getQLThumbnailAdditionClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("QLThumbnailAddition");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getQLThumbnailAdditionClass_block_invoke_cold_2();
  }
  getQLThumbnailAdditionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __QuickLookThumbnailingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  QuickLookThumbnailingLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_3_3(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_6_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t fpfs_supports_parent_mtime_iopolicy()
{
  return 1;
}

uint64_t fpfs_supports_pkg_dataless_escape_prevention()
{
  int v0 = *__error();
  if (fpfs_supports_pkg_dataless_escape_prevention_once_token != -1) {
    dispatch_once(&fpfs_supports_pkg_dataless_escape_prevention_once_token, &__block_literal_global_10);
  }
  *__error() = v0;
  return fpfs_supports_pkg_dataless_escape_prevention_feature_enabled;
}

uint64_t __fpfs_supports_pkg_dataless_escape_prevention_block_invoke()
{
  uint64_t result = _fpfs_is_feature_flag_enabled((uint64_t)"PackageDatalessPrevention");
  fpfs_supports_pkg_dataless_escape_prevention_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_partial_materialization()
{
  int v0 = *__error();
  if (fpfs_supports_partial_materialization_once_token != -1) {
    dispatch_once(&fpfs_supports_partial_materialization_once_token, &__block_literal_global_3);
  }
  *__error() = v0;
  return fpfs_supports_partial_materialization_feature_enabled;
}

uint64_t __fpfs_supports_partial_materialization_block_invoke()
{
  uint64_t result = _fpfs_is_feature_flag_enabled((uint64_t)"PartialMaterialization");
  fpfs_supports_partial_materialization_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_brm_sparse_files()
{
  int v0 = *__error();
  if (fpfs_supports_brm_sparse_files_once_token != -1) {
    dispatch_once(&fpfs_supports_brm_sparse_files_once_token, &__block_literal_global_9);
  }
  *__error() = v0;
  return fpfs_supports_brm_sparse_files_feature_enabled;
}

uint64_t __fpfs_supports_brm_sparse_files_block_invoke()
{
  uint64_t result = _fpfs_is_feature_flag_enabled((uint64_t)"BRMSparseFiles");
  fpfs_supports_brm_sparse_files_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_long_paths()
{
  int v0 = *__error();
  if (fpfs_supports_long_paths_once_token != -1) {
    dispatch_once(&fpfs_supports_long_paths_once_token, &__block_literal_global_12);
  }
  *__error() = v0;
  return fpfs_supports_long_paths_feature_enabled;
}

uint64_t __fpfs_supports_long_paths_block_invoke()
{
  uint64_t result = _fpfs_is_feature_flag_enabled((uint64_t)"LongPaths");
  fpfs_supports_long_paths_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_nx_for_testing()
{
  int v0 = *__error();
  if (fpfs_supports_nx_for_testing_once_token != -1) {
    dispatch_once(&fpfs_supports_nx_for_testing_once_token, &__block_literal_global_15);
  }
  *__error() = v0;
  return fpfs_supports_nx_for_testing_feature_enabled;
}

uint64_t __fpfs_supports_nx_for_testing_block_invoke()
{
  uint64_t result = _fpfs_is_feature_flag_enabled((uint64_t)"NonExistentFeatureFlagUsedForTesting");
  fpfs_supports_nx_for_testing_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_speculative_set()
{
  int v0 = *__error();
  if (fpfs_supports_speculative_set_once_token != -1) {
    dispatch_once(&fpfs_supports_speculative_set_once_token, &__block_literal_global_18_0);
  }
  *__error() = v0;
  return fpfs_supports_speculative_set_feature_enabled;
}

uint64_t __fpfs_supports_speculative_set_block_invoke()
{
  uint64_t result = _fpfs_is_feature_flag_enabled((uint64_t)"SpeculativeSet");
  fpfs_supports_speculative_set_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_purge_reasons()
{
  int v0 = *__error();
  if (fpfs_supports_purge_reasons_once_token != -1) {
    dispatch_once(&fpfs_supports_purge_reasons_once_token, &__block_literal_global_21);
  }
  *__error() = v0;
  return fpfs_supports_purge_reasons_feature_enabled;
}

uint64_t __fpfs_supports_purge_reasons_block_invoke()
{
  uint64_t result = _fpfs_is_feature_flag_enabled((uint64_t)"FPPurgeReasonsSupport");
  fpfs_supports_purge_reasons_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_lazy_recursive_deletion()
{
  int v0 = *__error();
  if (fpfs_supports_lazy_recursive_deletion_once_token != -1) {
    dispatch_once(&fpfs_supports_lazy_recursive_deletion_once_token, &__block_literal_global_24_0);
  }
  *__error() = v0;
  return fpfs_supports_lazy_recursive_deletion_feature_enabled;
}

uint64_t __fpfs_supports_lazy_recursive_deletion_block_invoke()
{
  uint64_t result = _fpfs_is_feature_flag_enabled((uint64_t)"LazyRecursiveDeletion");
  fpfs_supports_lazy_recursive_deletion_feature_enabled = result;
  return result;
}

uint64_t fpfs_supports_partial_conflicts_resolution()
{
  return 0;
}

uint64_t fpfs_is_internal_build()
{
  if (fpfs_is_internal_build_once != -1) {
    dispatch_once(&fpfs_is_internal_build_once, &__block_literal_global_27);
  }
  return fpfs_is_internal_build_is_internal_build;
}

uint64_t __fpfs_is_internal_build_block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  fpfs_is_internal_build_is_internal_build = result;
  return result;
}

uint64_t fpfs_is_seed_build()
{
  if (fpfs_is_seed_build_once != -1) {
    dispatch_once(&fpfs_is_seed_build_once, &__block_literal_global_30);
  }
  return 0;
}

uint64_t fpfs_supports_tap_to_feedback()
{
  if (fpfs_supports_tap_to_feedback_once != -1) {
    dispatch_once(&fpfs_supports_tap_to_feedback_once, &__block_literal_global_32);
  }
  return 0;
}

uint64_t fpfs_fset_syncroot(int a1, int a2)
{
  uint64_t result = fpfs_operation_is_allowed(4);
  if (result)
  {
    BOOL v5 = a2 != 0;
    return (ffsctl(a1, 0x80044A48uLL, &v5, 0) >> 31);
  }
  return result;
}

uint64_t fpfs_set_syncroot_at(uint64_t a1, char *a2, int a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __fpfs_set_syncroot_at_block_invoke;
  v4[3] = &__block_descriptor_36_e8_i12__0i8l;
  int v5 = a3;
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)v4);
}

uint64_t __fpfs_set_syncroot_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_fset_syncroot(a2, *(_DWORD *)(a1 + 32));
}

uint64_t fpfs_fget_syncroot(int a1, BOOL *a2)
{
  int v5 = 0;
  if (fpfs_operation_is_allowed(2) && ffsctl(a1, 0x40044A48uLL, &v5, 0) < 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  if (a2) {
    *a2 = v5 != 0;
  }
  return result;
}

uint64_t FPStatFSFromPath(void *a1, statfs *a2)
{
  id v3 = a1;
  uint64_t v4 = statfs((const char *)[v3 fileSystemRepresentation], a2);
  if ((v4 & 0x80000000) != 0)
  {
    int v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      FPStatFSFromPath_cold_1((uint64_t)v3, v5);
    }
  }
  return v4;
}

char *FPFileSystemTypeName(char *a1)
{
  if (a1)
  {
    a1 = [NSString stringWithUTF8String:a1 + 72];
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t FPFileSystemFreeBytes(unsigned int *a1)
{
  if (a1) {
    return *((void *)a1 + 3) * *a1;
  }
  else {
    return -1;
  }
}

__CFString *FPLocalizedFileSystemTypeName(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a1];
  id v10 = 0;
  uint64_t v2 = *MEMORY[0x1E4F1C878];
  id v9 = 0;
  int v3 = [v1 getResourceValue:&v10 forKey:v2 error:&v9];
  id v4 = v10;
  id v5 = v9;

  if (v3)
  {
    uint64_t v6 = (__CFString *)v4;
  }
  else
  {
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      FPLocalizedFileSystemTypeName_cold_1((uint64_t)v5, v7);
    }

    uint64_t v6 = @"Unknown";
  }

  return v6;
}

void fpfs_free_metadata_tag_data(uint64_t a1)
{
}

uint64_t fpfs_set_metadata(char *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 0x40000000;
  _OWORD v6[2] = __fpfs_set_metadata_block_invoke;
  v6[3] = &unk_1E5AF2140;
  int v7 = a3;
  v6[5] = a2;
  v6[6] = a4;
  void v6[4] = a5;
  return fpfs_open(a1, 0x200002u, 0, 2, (uint64_t)v6);
}

uint64_t __fpfs_set_metadata_block_invoke(uint64_t a1, int fd)
{
  return fpfs_fset_metadata(fd, *(void *)(a1 + 40), *(_DWORD *)(a1 + 56), *(void *)(a1 + 48));
}

uint64_t fpfs_fset_metadata(int fd, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  int v8 = *(_DWORD *)a2;
  long long v55 = 0u;
  long long v56 = 0u;
  if ((a4 & 0x400000) != 0 && v8 == 2 && (fpfs_set_favorite_rank(fd, *(void *)(a2 + 72)) & 0x80000000) != 0
    || (a4 & 0x800000) != 0 && (fpfs_set_is_pinned(fd, (*(_DWORD *)(a2 + 4) >> 7) & 1) & 0x80000000) != 0
    || (a4 & 0x1000000) != 0 && (fpfs_set_before_bounce_filename(fd, *(char **)(a2 + 136)) & 0x80000000) != 0
    || (a4 & 0x2000000) != 0 && (fpfs_set_syncable_xattrs() & 0x80000000) != 0)
  {
    return 0xFFFFFFFFLL;
  }
  if ((a4 & 0x200000) != 0)
  {
    if ((*(unsigned char *)(a2 + 5) & 0x10) != 0)
    {
      if ((fpfs_set_last_use_date(fd, (uint64_t *)(a2 + 56), 0) & 0x80000000) != 0) {
        return 0xFFFFFFFFLL;
      }
    }
    else if (fpfs_fremovexattr(fd, "com.apple.lastuseddate#PS", 0) < 0 && *__error() != 93)
    {
      return 0xFFFFFFFFLL;
    }
  }
  if ((a4 & 0x20000000) != 0 && (fpfs_fset_collaboration_identifier(fd, *(const char **)(a2 + 176)) & 0x80000000) != 0
    || (a4 & 0x40000000) != 0
    && ((fpfs_fset_is_shared(fd, *(unsigned char *)(a2 + 184)) & 0x80000000) != 0
     || (a4 & 0x100000000) != 0 && (fpfs_fset_is_shared_by_current_user(fd, (unsigned char *)(a2 + 185)) & 0x80000000) != 0
     || !*(unsigned char *)(a2 + 184) && (fpfs_fset_is_shared_by_current_user(fd, 0) & 0x80000000) != 0)
    || (a4 & 0x80000000) != 0 && (fpfs_fset_owner_name(fd, *(char **)(a2 + 192)) & 0x80000000) != 0)
  {
    return 0xFFFFFFFFLL;
  }
  if ((v8 - 1) > 2) {
    goto LABEL_41;
  }
  *(void *)&long long v31 = 0;
  if ((a4 & 0x200) != 0) {
    int v9 = (*(_DWORD *)(a2 + 4) >> 10) & 2;
  }
  else {
    LOBYTE(v9) = 0;
  }
  char v10 = v9 | BYTE1(a4) & 1;
  unsigned int v11 = *(_DWORD *)(a2 + 4);
  char v12 = ~(_BYTE)v11 & 4;
  if ((a4 & 0x8000) == 0) {
    char v12 = 0;
  }
  LOBYTE(v31) = (a4 >> 7) & 8 | v10 | v12;
  *((void *)&v31 + 1) = a4 & 0x800;
  *((void *)&v52 + 1) = *(void *)(a2 + 112);
  *(void *)&long long v52 = v11 & 0xC | (v11 >> 10) & 2 | ((v11 & 2) != 0);
  if ((a4 & 0x100000) != 0 && (fpfs_set_tag_data(fd, a2 + 80, (uint64_t)&v31, (uint64_t)&v52) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if ((a4 & 0x108F00) != 0)
  {
    fpfs_get_finder_info_buffer(fd, &v55);
    if (v13 < 0) {
      return 0xFFFFFFFFLL;
    }
    long long v50 = 0uLL;
    fpfs_finder_info_deserialize((uint64_t)&v55, (uint64_t)&v50);
    BOOL v14 = fpfs_finder_info_update_with_mask((uint64_t)&v50, (char *)&v31, (uint64_t)&v52);
    if (v14) {
      fpfs_finder_info_serialize((unsigned __int8 *)&v50, (uint64_t)&v55);
    }
    if (*(_DWORD *)a2 == 3 && (fpfs_pkg_promote(fd) & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
LABEL_41:
    BOOL v14 = 0;
  }
  if ((a4 & 0x20000) != 0)
  {
    if (*(unsigned char *)(a2 + 4))
    {
      if ((fpfs_set_dataless_cmpfs_attrs(fd, a2) & 0x80000000) != 0) {
        return 0xFFFFFFFFLL;
      }
    }
    else if ((fpfs_unset_dataless_cmpfs_attrs(fd, (long long *)(a2 + 40)) & 0x80000000) != 0)
    {
      return 0xFFFFFFFFLL;
    }
  }
  if ((a4 & 0x10000000) != 0
    && (*(_DWORD *)a2 & 0xFFFFFFFE) == 2
    && (fpfs_fset_syncroot(fd, (*(_DWORD *)(a2 + 4) >> 8) & 1) & 0x80000000) != 0)
  {
    return 0xFFFFFFFFLL;
  }
  uint64_t v51 = 0;
  long long v50 = xmmword_1A34E47F8;
  int v54 = 0;
  memset(v53, 0, sizeof(v53));
  long long v52 = 0u;
  __uint32_t v15 = &v52;
  if ((a4 & 1) == 0)
  {
    int v16 = 0;
    size_t v17 = 0;
    if ((a4 & 2) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  int v16 = 512;
  DWORD1(v50) = 512;
  long long v52 = *(_OWORD *)(a2 + 24);
  __uint32_t v15 = v53;
  size_t v17 = 16;
  if ((a4 & 2) != 0)
  {
LABEL_54:
    v16 |= 0x400u;
    DWORD1(v50) = v16;
    *v15++ = *(_OWORD *)(a2 + 40);
    v17 += 16;
  }
LABEL_55:
  if ((a4 & 0x200000) != 0 && (*(unsigned char *)(a2 + 5) & 0x10) != 0)
  {
    DWORD1(v50) = v16 | 0x1000;
    *v15++ = *(_OWORD *)(a2 + 56);
    v17 += 16;
  }
  if (v14)
  {
    DWORD1(v50) |= 0x4000u;
    long long v18 = v56;
    *__uint32_t v15 = v55;
    v15[1] = v18;
    v15 += 2;
    v17 += 32;
  }
  if ((a4 & 4) != 0)
  {
    DWORD1(v50) |= 0x20000u;
    int v19 = *(_WORD *)(a2 + 8) & 0xFFF;
    if ((v8 & 0xFFFFFFFE) == 2)
    {
      if (fpfs_supports_vfs_ignore_permissions_iopolicy()) {
        v19 |= 0x40u;
      }
      else {
        v19 |= 0x1C0u;
      }
    }
    *(_DWORD *)__uint32_t v15 = v19;
    __uint32_t v15 = (long long *)((char *)v15 + 4);
    v17 += 4;
  }
  else if (!v17)
  {
    goto LABEL_70;
  }
  if ((char *)v15 - (char *)&v52 != v17) {
    fpfs_fset_metadata_cold_1();
  }
  if (fsetattrlist(fd, &v50, &v52, v17, 0) < 0) {
    return 0xFFFFFFFFLL;
  }
LABEL_70:
  if ((a4 & 0x38000) != 0)
  {
    if ((a4 & 0x8000) != 0)
    {
      int v21 = (*(_DWORD *)(a2 + 4) << 13) & 0x8000;
      unsigned int v20 = v21 ^ 0x8000;
    }
    else
    {
      unsigned int v20 = 0;
      int v21 = 0;
    }
    if ((a4 & 0x10000) != 0)
    {
      if ((*(unsigned char *)(a2 + 4) & 0x10) != 0) {
        v21 |= 2u;
      }
      else {
        v20 |= 2u;
      }
    }
    if (v21 | v20 && (fpfs_fchflags(fd, v20, v21) & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
  }
  if ((a4 & 0x8000000) == 0) {
    return 0;
  }
  if (*(_DWORD *)a2 == 3) {
    goto LABEL_85;
  }
  if (*(_DWORD *)a2 != 1) {
    return 0;
  }
  if (!fpfs_supports_partial_materialization())
  {
LABEL_85:
    int v22 = *(_DWORD *)(a2 + 4);
    if ((v22 & 1) == 0) {
      goto LABEL_86;
    }
    return 0;
  }
  int v22 = *(_DWORD *)(a2 + 4);
LABEL_86:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v23 = *(_OWORD *)(a2 + 176);
  long long v44 = *(_OWORD *)(a2 + 160);
  long long v45 = v23;
  long long v24 = *(_OWORD *)(a2 + 208);
  long long v46 = *(_OWORD *)(a2 + 192);
  long long v47 = v24;
  long long v25 = *(_OWORD *)(a2 + 112);
  long long v40 = *(_OWORD *)(a2 + 96);
  long long v41 = v25;
  long long v26 = *(_OWORD *)(a2 + 144);
  long long v42 = *(_OWORD *)(a2 + 128);
  long long v43 = v26;
  long long v27 = *(_OWORD *)(a2 + 48);
  long long v36 = *(_OWORD *)(a2 + 32);
  long long v37 = v27;
  long long v28 = *(_OWORD *)(a2 + 80);
  long long v38 = *(_OWORD *)(a2 + 64);
  long long v39 = v28;
  long long v29 = *(_OWORD *)(a2 + 16);
  long long v34 = *(_OWORD *)a2;
  uint64_t v33 = 0;
  DWORD1(v32) = a3;
  long long v35 = v29;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  if (a3 && (v22 & 0x20) != 0)
  {
    if ((fpfs_set_evictable(fd, (uint64_t)&v31) & 0x80000000) == 0) {
      return 0;
    }
  }
  else if ((fpfs_unset_evictable(fd, (uint64_t)&v31) & 0x80000000) == 0)
  {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_set_vfs_parent_mtime_iopolicy()
{
  uint64_t result = fpfs_supports_parent_mtime_iopolicy();
  if (result)
  {
    return setiopolicy_np(8, 0, 1);
  }
  return result;
}

uint64_t fpfs_unset_vfs_parent_mtime_iopolicy()
{
  uint64_t result = fpfs_supports_parent_mtime_iopolicy();
  if (result)
  {
    return setiopolicy_np(8, 0, 0);
  }
  return result;
}

uint64_t fpfs_fget_parent_id(int a1, void *a2)
{
  uint64_t v6 = 0;
  long long v5 = xmmword_1A34E4810;
  memset(v4, 0, 12);
  if (fgetattrlist(a1, &v5, v4, 0xCuLL, 0) < 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 = *(void *)((char *)v4 + 4);
  return result;
}

uint64_t fpfs_make_fsevent(int a1)
{
  if (fsetxattr(a1, "com.apple.fileprovider.touch", "", 1uLL, 0, 0) < 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return (fremovexattr(a1, "com.apple.fileprovider.touch", 0) >> 31);
  }
}

uint64_t fpfs_num_entries(const char *a1, int a2, _DWORD *a3)
{
  return fpfs_num_entries_at(-2, a1, a2, a3);
}

uint64_t fpfs_num_entries_at(int a1, const char *a2, int a3, _DWORD *a4)
{
  uint64_t v8 = 0;
  long long v7 = xmmword_1A34E4828;
  uint64_t v6 = 0;
  uint64_t result = getattrlistat(a1, a2, &v7, &v6, 8uLL, a3 ^ 1u);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  *a4 = HIDWORD(v6);
  return result;
}

void sub_1A3431158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCSSearchQueryErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreSpotlightLibrary_0();
  uint64_t result = dlsym(v2, "CSSearchQueryErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCSSearchQueryErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSpotlightLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  CoreSpotlightLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getCSUserQueryContextClass_block_invoke(uint64_t a1)
{
  CoreSpotlightLibrary_0();
  Class result = objc_getClass("CSUserQueryContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSUserQueryContextClass_block_invoke_cold_1();
  }
  getCSUserQueryContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCSUserQueryClass_block_invoke(uint64_t a1)
{
  CoreSpotlightLibrary_0();
  Class result = objc_getClass("CSUserQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSUserQueryClass_block_invoke_cold_1();
  }
  getCSUserQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_8_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return v0;
}

void sub_1A3433060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

id getIFImageClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getIFImageClass_softClass;
  uint64_t v7 = getIFImageClass_softClass;
  if (!getIFImageClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getIFImageClass_block_invoke;
    v3[3] = &unk_1E5AF1950;
    v3[4] = &v4;
    __getIFImageClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A3433764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _CGImageDestinationCreateWithData(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))getCGImageDestinationCreateWithDataSymbolLoc_ptr;
  uint64_t v10 = getCGImageDestinationCreateWithDataSymbolLoc_ptr;
  if (!getCGImageDestinationCreateWithDataSymbolLoc_ptr)
  {
    long long v5 = (void *)ImageIOLibrary();
    v8[3] = (uint64_t)dlsym(v5, "CGImageDestinationCreateWithData");
    getCGImageDestinationCreateWithDataSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4) {
    _CGImageDestinationCreateWithData_cold_1();
  }
  return v4(a1, a2, 1, 0);
}

void sub_1A343387C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _CGImageDestinationAddImage(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, void))getCGImageDestinationAddImageSymbolLoc_ptr;
  uint64_t v10 = getCGImageDestinationAddImageSymbolLoc_ptr;
  if (!getCGImageDestinationAddImageSymbolLoc_ptr)
  {
    long long v5 = (void *)ImageIOLibrary();
    v8[3] = (uint64_t)dlsym(v5, "CGImageDestinationAddImage");
    getCGImageDestinationAddImageSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4) {
    _CGImageDestinationAddImage_cold_1();
  }
  return v4(a1, a2, 0);
}

void sub_1A3433990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _CGImageDestinationFinalize(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))getCGImageDestinationFinalizeSymbolLoc_ptr;
  uint64_t v8 = getCGImageDestinationFinalizeSymbolLoc_ptr;
  if (!getCGImageDestinationFinalizeSymbolLoc_ptr)
  {
    int v3 = (void *)ImageIOLibrary();
    v6[3] = (uint64_t)dlsym(v3, "CGImageDestinationFinalize");
    getCGImageDestinationFinalizeSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    uint64_t v2 = (uint64_t (*)(uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    _CGImageDestinationFinalize_cold_1();
  }
  return v2(a1);
}

void sub_1A3433A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIFImageClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!IconFoundationLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __IconFoundationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5AF24B0;
    uint64_t v5 = 0;
    IconFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IconFoundationLibraryCore_frameworkLibrary) {
    __getIFImageClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("IFImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getIFImageClass_block_invoke_cold_2();
  }
  getIFImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IconFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IconFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getCGImageDestinationCreateWithDataSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ImageIOLibrary();
  uint64_t result = dlsym(v2, "CGImageDestinationCreateWithData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCGImageDestinationCreateWithDataSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ImageIOLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!ImageIOLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __ImageIOLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF24C8;
    uint64_t v4 = 0;
    ImageIOLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = ImageIOLibraryCore_frameworkLibrary;
  if (!ImageIOLibraryCore_frameworkLibrary) {
    ImageIOLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __ImageIOLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ImageIOLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getCGImageDestinationAddImageSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ImageIOLibrary();
  uint64_t result = dlsym(v2, "CGImageDestinationAddImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCGImageDestinationAddImageSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCGImageDestinationFinalizeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)ImageIOLibrary();
  uint64_t result = dlsym(v2, "CGImageDestinationFinalize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCGImageDestinationFinalizeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return objc_opt_class();
}

void sub_1A3434C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1A3434D38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A343564C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3436624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getDSArchiveServiceClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getDSArchiveServiceClass_softClass;
  uint64_t v7 = getDSArchiveServiceClass_softClass;
  if (!getDSArchiveServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getDSArchiveServiceClass_block_invoke;
    v3[3] = &unk_1E5AF1950;
    v3[4] = &v4;
    __getDSArchiveServiceClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1A3436E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3437B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3438180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3438D0C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

Class __getDSArchiveServiceClass_block_invoke(uint64_t a1)
{
  DesktopServicesPrivLibrary();
  Class result = objc_getClass("DSArchiveService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getDSArchiveServiceClass_block_invoke_cold_1();
  }
  getDSArchiveServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t DesktopServicesPrivLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __DesktopServicesPrivLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF2898;
    uint64_t v4 = 0;
    DesktopServicesPrivLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = DesktopServicesPrivLibraryCore_frameworkLibrary;
  if (!DesktopServicesPrivLibraryCore_frameworkLibrary) {
    DesktopServicesPrivLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __DesktopServicesPrivLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DesktopServicesPrivLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getDSArchiveServiceErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DesktopServicesPrivLibrary();
  uint64_t result = dlsym(v2, "DSArchiveServiceErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDSArchiveServiceErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_4_4(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1A343A1A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A343A278(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A343A3E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A343AA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBRFieldContentSignatureClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!iCloudDriveCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __iCloudDriveCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5AF28B0;
    uint64_t v5 = 0;
    iCloudDriveCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!iCloudDriveCoreLibraryCore_frameworkLibrary) {
    __getBRFieldContentSignatureClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("BRFieldContentSignature");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBRFieldContentSignatureClass_block_invoke_cold_2();
  }
  getBRFieldContentSignatureClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __iCloudDriveCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iCloudDriveCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void FPBookmarkableStringFromDocumentURL(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(a1, "fp_matchesFileProviderHeuristics:", geteuid()))
  {
    id v4 = a1;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __FPBookmarkableStringFromDocumentURL_block_invoke;
    v13[3] = &unk_1E5AF14E8;
    id v5 = v3;
    id v14 = v5;
    id v6 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:v13];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __FPBookmarkableStringFromDocumentURL_block_invoke_2;
    v9[3] = &unk_1E5AF2920;
    id v10 = v6;
    id v11 = v4;
    id v12 = v5;
    id v7 = v4;
    id v8 = v6;
    [v8 FPBookmarkableStringFromDocumentURL:v7 completionHandler:v9];
  }
  else if (v3)
  {
    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }
}

uint64_t __FPBookmarkableStringFromDocumentURL_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __FPBookmarkableStringFromDocumentURL_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    id v7 = fp_current_or_default_log();
    id v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
        int v11 = 138412290;
        id v12 = v9;
        _os_log_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_INFO, "[INFO] Created a bookmark for %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __FPBookmarkableStringFromDocumentURL_block_invoke_2_cold_1((void *)v6);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(uint64_t, unint64_t, unint64_t))(v10 + 16))(v10, v5, v6);
    }
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    [*(id *)(a1 + 32) callNextOverrides];
  }
}

void FPDocumentURLFromBookmarkableString(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __FPDocumentURLFromBookmarkableString_block_invoke;
  v11[3] = &unk_1E5AF14E8;
  id v4 = v3;
  id v12 = v4;
  id v5 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:v11];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPDocumentURLFromBookmarkableString_block_invoke_2;
  v8[3] = &unk_1E5AF1848;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [v7 FPDocumentURLFromBookmarkableString:a1 completionHandler:v8];
}

uint64_t __FPDocumentURLFromBookmarkableString_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __FPDocumentURLFromBookmarkableString_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    id v7 = fp_current_or_default_log();
    id v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v9 = objc_msgSend((id)v5, "fp_shortDescription");
        int v11 = 138412290;
        id v12 = v9;
        _os_log_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_INFO, "[INFO] Resolved bookmark to URL %@", (uint8_t *)&v11, 0xCu);
      }
      MEMORY[0x1A6247CF0](v5, @"FPFileIsBookmarkURLProperty", *MEMORY[0x1E4F1CFD0]);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __FPDocumentURLFromBookmarkableString_block_invoke_2_cold_1((void *)v6);
      }
    }
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, unint64_t, unint64_t))(v10 + 16))(v10, v5, v6);
    }
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    [*(id *)(a1 + 32) callNextOverrides];
  }
}

void FPMarkAsFileProviderBookmark()
{
}

id FPCreateDocumentURLFromBookmarkableString(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  +[FPFrameworkOverridesIterator allOverrides];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)v15;
  while (2)
  {
    for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v4);
      }
      id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        id v13 = 0;
        id v9 = [v8 FPDocumentURLFromBookmarkableString:v3 error:&v13];
        id v10 = v13;
        int v11 = v10;
        if (v10)
        {
          id v5 = 0;
          if (a2) {
            *a2 = v10;
          }
        }
        else
        {
          if (!v9) {
            continue;
          }
          id v5 = v9;
        }

        goto LABEL_16;
      }
    }
    id v5 = (id)[v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5) {
      continue;
    }
    break;
  }
LABEL_16:

  return v5;
}

void FPExtendBookmarkForDocumentURL(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __FPExtendBookmarkForDocumentURL_block_invoke;
  v20[3] = &unk_1E5AF2948;
  id v8 = v5;
  id v22 = v8;
  id v9 = v7;
  id v21 = v9;
  id v10 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:v20];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __FPExtendBookmarkForDocumentURL_block_invoke_2;
  v15[3] = &unk_1E5AF2970;
  id v16 = v10;
  id v17 = v9;
  id v18 = v6;
  id v19 = v8;
  id v11 = v8;
  id v12 = v6;
  id v13 = v9;
  id v14 = v10;
  [v14 FPExtendBookmarkForDocumentURL:v13 forBundleID:v12 completionHandler:v15];
}

uint64_t __FPExtendBookmarkForDocumentURL_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 40);
  if (v8)
  {
    id v9 = FPProviderNotFoundErrorForURL(*(void *)(result + 32), a2, a3, a4, a5, a6, a7, a8);
    id v10 = *(uint64_t (**)(uint64_t, void, id))(v8 + 16);
    return v10(v8, 0, v9);
  }
  return result;
}

void __FPExtendBookmarkForDocumentURL_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    id v7 = fp_current_or_default_log();
    uint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        int v11 = 138412546;
        uint64_t v12 = v9;
        __int16 v13 = 2112;
        unint64_t v14 = v5;
        _os_log_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_INFO, "[INFO] Extended sandbox and received bookmark for %@: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __FPExtendBookmarkForDocumentURL_block_invoke_2_cold_1(a1, (void *)v6);
    }

    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(uint64_t, unint64_t, unint64_t))(v10 + 16))(v10, v5, v6);
    }
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    [*(id *)(a1 + 32) callNextOverrides];
  }
}

void FPRegisterFileProvidersForFileCoordination(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    FPRegisterFileProvidersForFileCoordination_cold_1();
  }

  v1[2](v1);
}

void FPRegisterFileProvidersForUser(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    FPRegisterFileProvidersForUser_cold_1();
  }

  unint64_t v5 = +[FPDaemonConnection connectionForUser:a1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __FPRegisterFileProvidersForUser_block_invoke;
  v7[3] = &unk_1E5AF2998;
  id v8 = v3;
  id v6 = v3;
  [v5 wakeUpForURL:0 completionHandler:v7];
}

void __FPRegisterFileProvidersForUser_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __FPRegisterFileProvidersForUser_block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL FPFetchDatalessFileResolverUIDAtURL(void *a1, uid_t *a2, void *a3)
{
  id v5 = a1;
  if ([v5 isFileURL]
    && ([v5 path],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 fileSystemRepresentation],
        v6,
        v7))
  {
    id v8 = [v5 path];
    int dataless_cmpfs_xattr_owner = fpfs_get_dataless_cmpfs_xattr_owner((char *)[v8 fileSystemRepresentation], a2);

    if (dataless_cmpfs_xattr_owner < 0)
    {
      id v10 = [v5 path];
      int dataless_cmpfs_xattr_owner = open((const char *)[v10 fileSystemRepresentation], 2097156);

      if ((dataless_cmpfs_xattr_owner & 0x80000000) == 0
        || *__error() == 63
        && fpfs_supports_long_paths()
        && ([v5 path],
            id v14 = objc_claimAutoreleasedReturnValue(),
            int dataless_cmpfs_xattr_owner = fpfs_open_longpath((char *)[v14 fileSystemRepresentation], 2097156, 0), v14, (dataless_cmpfs_xattr_owner & 0x80000000) == 0))
      {
        int v11 = dataless_cmpfs_xattr_owner;
        memset(&v16, 0, sizeof(v16));
        int dataless_cmpfs_xattr_owner = fstat(dataless_cmpfs_xattr_owner, &v16);
        int v12 = *__error();
        close(v11);
        *__error() = v12;
        if (a2)
        {
          if (!dataless_cmpfs_xattr_owner) {
            *a2 = v16.st_uid;
          }
        }
      }
      if (a3 && dataless_cmpfs_xattr_owner < 0)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        int dataless_cmpfs_xattr_owner = 1;
      }
    }
    BOOL v13 = dataless_cmpfs_xattr_owner == 0;
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1000 userInfo:0];
    BOOL v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

BOOL FPStartDownloadingItemAtURL(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__6;
  int v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  id v4 = +[FPDaemonConnection synchronousSharedConnectionProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __FPStartDownloadingItemAtURL_block_invoke;
  v7[3] = &unk_1E5AF29C0;
  void v7[4] = &v8;
  [v4 startDownloadingItemAtURL:v3 completionHandler:v7];

  id v5 = (void *)v9[5];
  if (a2 && v5) {
    *a2 = v5;
  }
  _Block_object_dispose(&v8, 8);

  return v5 == 0;
}

void sub_1A343CB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __FPStartDownloadingItemAtURL_block_invoke(uint64_t a1, void *a2)
{
}

id FPResolveSymlink(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  int v6 = getiopolicy_np(3, 1);
  if (v6 == 1)
  {
    uint64_t v7 = FPResolveSymlinkRecursive(v5, a2, 0, 0, a3);
  }
  else
  {
    int v8 = v6;
    setiopolicy_np(3, 1, 1);
    uint64_t v7 = FPResolveSymlinkRecursive(v5, a2, 0, 0, a3);
    setiopolicy_np(3, 1, v8);
  }

  return v7;
}

id FPResolveSymlinkRecursive(void *a1, uint64_t a2, unint64_t a3, int a4, void *a5)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = v9;
  if (a3 < 0x65)
  {
    if ([v9 isFileURL])
    {
      memset(&v33, 0, sizeof(v33));
      id v12 = v10;
      if (lstat((const char *)[v12 fileSystemRepresentation], &v33) < 0) {
        goto LABEL_11;
      }
      if ((v33.st_mode & 0xF000) == 0xA000)
      {
        bzero(v38, 0x401uLL);
        id v10 = v12;
        ssize_t v13 = readlink((const char *)[v10 fileSystemRepresentation], v38, 0x401uLL);
        if ((v13 & 0x8000000000000000) == 0)
        {
          v38[v13] = 0;
          if (v38[0] == 47)
          {
            id v14 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v38 isDirectory:0 relativeToURL:0];
          }
          else
          {
            long long v26 = [v10 URLByDeletingLastPathComponent];
            long long v27 = objc_msgSend(NSString, "fp_pathWithFileSystemRepresentation:", v38);
            id v14 = [v26 URLByAppendingPathComponent:v27 isDirectory:0];
          }
          long long v28 = [v14 standardizedURL];
          FPResolveSymlinkRecursive(v28, a2, a3 + 1, 0, a5);
          id v11 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_30;
        }
LABEL_11:
        if (*__error() == 2)
        {
          if (a5)
          {
            uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v36 = *MEMORY[0x1E4F289D0];
            id v37 = v12;
            stat v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
            *a5 = [v15 errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:v16];
          }
        }
        else
        {
          if (*__error() == 11 && !a4)
          {
            id v19 = objc_opt_new();
            *(void *)long long v38 = 0;
            long long v39 = v38;
            uint64_t v40 = 0x3032000000;
            long long v41 = __Block_byref_object_copy__6;
            long long v42 = __Block_byref_object_dispose__6;
            id v43 = 0;
            unsigned int v20 = [v12 URLByDeletingLastPathComponent];
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __FPResolveSymlinkRecursive_block_invoke_2;
            v31[3] = &unk_1E5AF2DB0;
            v31[4] = v38;
            [v19 coordinateReadingItemAtURL:v20 options:1 error:a5 byAccessor:v31];

            if (*((void *)v39 + 5))
            {
              FPResolveSymlinkRecursive(v12, a2, a3, 1, a5);
              id v11 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v11 = 0;
            }
            _Block_object_dispose(v38, 8);

            goto LABEL_29;
          }
          if (a5)
          {
            id v21 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v22 = *MEMORY[0x1E4F289D0];
            v35[0] = v12;
            uint64_t v23 = *MEMORY[0x1E4F28A50];
            v34[0] = v22;
            v34[1] = v23;
            long long v24 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
            v35[1] = v24;
            long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
            *a5 = [v21 errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:v25];
          }
        }
        id v11 = 0;
LABEL_29:
        id v10 = v12;
        goto LABEL_30;
      }
      id v17 = (void *)MEMORY[0x1E4F1CB10];
      id v18 = [v12 path];
      [v17 fileURLWithPath:v18 isDirectory:(v33.st_mode & 0xF000) == 0x4000];
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      if (a2 && (v33.st_mode & 0xF000) == 0x4000 && (v33.st_flags & 0x40000000) != 0)
      {
        uint64_t v30 = objc_opt_new();
        *(void *)long long v38 = 0;
        long long v39 = v38;
        uint64_t v40 = 0x3032000000;
        long long v41 = __Block_byref_object_copy__6;
        long long v42 = __Block_byref_object_dispose__6;
        id v43 = 0;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __FPResolveSymlinkRecursive_block_invoke;
        v32[3] = &unk_1E5AF2DB0;
        v32[4] = v38;
        [v30 coordinateReadingItemAtURL:v10 options:1 error:a5 byAccessor:v32];
        id v11 = *((id *)v39 + 5);
        _Block_object_dispose(v38, 8);

        goto LABEL_30;
      }
    }
    id v10 = v10;
    id v11 = v10;
    goto LABEL_30;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", 62);
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
LABEL_30:

  return v11;
}

void sub_1A343D1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

BOOL FPIsBinCompatSymlinkToDetachedRoot(void *a1)
{
  id v1 = a1;
  int v2 = getiopolicy_np(3, 1);
  if (v2 != 1) {
    setiopolicy_np(3, 1, 1);
  }
  id v3 = v1;
  int v4 = open((const char *)[v3 fileSystemRepresentation], 2129924);
  if (v4 < 0)
  {
    BOOL v6 = 0;
  }
  else
  {
    int v5 = v4;
    memset(&v8, 0, sizeof(v8));
    BOOL v6 = (fstat(v4, &v8) & 0x80000000) == 0
      && (v8.st_mode & 0xF000) == 0xA000
      && fgetxattr(v5, "com.apple.fileprovider.detached-link#P", 0, 0, 0, 0) >= 0;
    close(v5);
  }
  if (v2 != 1) {
    setiopolicy_np(3, 1, v2);
  }

  return v6;
}

uint64_t FPURLMightBeInFileProviderForEUID(void *a1, const char *a2)
{
  return objc_msgSend(a1, "fp_matchesFileProviderHeuristics:", a2);
}

id FPCopyItemForURLWithEUID(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  uint64_t v15 = 0;
  stat v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__6;
  id v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__6;
  ssize_t v13 = __Block_byref_object_dispose__6;
  id v14 = 0;
  int v5 = +[FPDaemonConnection synchronousSharedConnectionProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPCopyItemForURLWithEUID_block_invoke;
  v8[3] = &unk_1E5AF29E8;
  void v8[4] = &v9;
  v8[5] = &v15;
  [v5 itemForURL:v4 completionHandler:v8];
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v6;
}

void sub_1A343D488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __FPCopyItemForURLWithEUID_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[FPItemManager _promoteItemToAppLibraryIfNeeded:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  id v11 = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

void __FPRegisterFileProvidersForUserAtURLs_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __FPRegisterFileProvidersForUser_block_invoke_cold_1();
  }

  uint64_t v8 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __FPRegisterFileProvidersForUserAtURLs_block_invoke_12;
  v11[3] = &unk_1E5AF0FF0;
  id v12 = v5;
  uint64_t v9 = *(void (**)(uint64_t, id, void *))(v8 + 16);
  id v10 = v5;
  v9(v8, v6, v11);
}

uint64_t FPURLIsInFileProvider(void *a1)
{
  return objc_msgSend(a1, "fp_matchesFileProviderHeuristics:", geteuid());
}

BOOL FPURLIsLocatedOnRemovableStorage(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"file:///private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd"];
  id v3 = objc_msgSend(v2, "fp_relativePathOf:", a1);
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 length] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t FPIsFileProviderBookmark(const __CFURL *a1, CFErrorRef *error)
{
  CFBooleanRef propertyValueTypeRefPtr = 0;
  if (CFURLCopyResourcePropertyForKey(a1, @"FPFileIsBookmarkURLProperty", &propertyValueTypeRefPtr, error)) {
    BOOL v3 = propertyValueTypeRefPtr == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __FPIsFileProviderBookmark_block_invoke;
    v9[3] = &unk_1E5AF2A18;
    id v11 = &v13;
    CFURLRef v12 = a1;
    BOOL v5 = v4;
    id v10 = v5;
    FPBookmarkableStringFromDocumentURL(a1, v9);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t Value = *((unsigned __int8 *)v14 + 24);
    id v6 = (void *)MEMORY[0x1E4F1CFC8];
    if (*((unsigned char *)v14 + 24)) {
      id v6 = (void *)MEMORY[0x1E4F1CFD0];
    }
    MEMORY[0x1A6247CF0](a1, @"FPFileIsBookmarkURLProperty", *v6);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    uint64_t Value = CFBooleanGetValue(propertyValueTypeRefPtr);
    CFRelease(propertyValueTypeRefPtr);
  }
  return Value;
}

void sub_1A343D838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t __FPIsFileProviderBookmark_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 != 0;
  if (a3)
  {
    dispatch_semaphore_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __FPIsFileProviderBookmark_block_invoke_cold_1(a1);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t FPCFCopyAttributeValuesForItem(void *a1, uint64_t a2, void *a3)
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __FPCFCopyAttributeValuesForItem_block_invoke;
  v17[3] = &unk_1E5AF2A40;
  uint64_t v17[4] = &v18;
  v17[5] = &v22;
  id v6 = +[FPFrameworkOverridesIterator newIteratorForURL:a1 withNotFoundHandler:v17];
  id v7 = a1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __FPCFCopyAttributeValuesForItem_block_invoke_2;
  v12[3] = &unk_1E5AF2A68;
  uint64_t v15 = &v22;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  char v16 = &v18;
  [v8 FPValuesForAttributes:a2 forItemAtURL:v9 completionHandler:v12];
  if (a3) {
    *a3 = v23[3];
  }
  uint64_t v10 = v19[3];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v10;
}

void sub_1A343DA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __FPCFCopyAttributeValuesForItem_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;
  return result;
}

void __FPCFCopyAttributeValuesForItem_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [*(id *)(a1 + 32) callNextOverrides];
      goto LABEL_7;
    }
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __FPCFCopyAttributeValuesForItem_block_invoke_2_cold_1();
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
  [*(id *)(a1 + 32) finish];
LABEL_7:
}

uint64_t FPCFSetAttributeValueForItem(void *a1, void *a2, void *a3, uint64_t *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = +[FPFrameworkOverridesIterator allOverrides];
  id v8 = a2;
  id v9 = a3;
  id v10 = a1;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        char v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v23 = 0;
          char v17 = [v16 FPSetValue:v9 forAttribute:v8 onItemAtURL:v10 error:&v23];
          id v18 = v23;
          id v19 = v18;
          if ((v17 & 1) == 0 && v18)
          {
            if (a4) {
              *a4 = (uint64_t)v18;
            }

            uint64_t v20 = 0;
            goto LABEL_18;
          }

          if (v17)
          {
            uint64_t v20 = 1;
LABEL_18:

            goto LABEL_19;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  if (a4)
  {
    FPNotSupportedError();
    *a4 = uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = 0;
  }
LABEL_19:

  return v20;
}

void FPCFGetAttributeValuesForItem(void *a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    *(void *)cf = 0;
    id v6 = (const void *)FPCFCopyAttributeValuesForItem(a1, a2, cf);
    v5[2](v5, v6, *(void *)cf);
    if (*(void *)cf) {
      CFRelease(*(CFTypeRef *)cf);
    }
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)cf = 136315138;
      *(void *)&cf[4] = "FPCFGetAttributeValuesForItem";
      _os_log_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_DEFAULT, "[NOTICE] No point in calling %s without a completion block", cf, 0xCu);
    }
  }
}

id FPCopyExtensionMatchingDictionaryForItem(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "fp_matchesFileProviderHeuristics:", geteuid());

  id v6 = @"URLMightBeInFileProvider";
  BOOL v3 = [NSNumber numberWithUnsignedChar:v2];
  v7[0] = v3;
  dispatch_semaphore_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

void FPEvictItem(void *a1, uint64_t a2)
{
  id v3 = a1;
  dispatch_semaphore_t v4 = +[FPDaemonConnection sharedConnection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __FPEvictItem_block_invoke;
  v7[3] = &unk_1E5AF1240;
  id v8 = v3;
  id v5 = v3;
  id v6 = (id)[v4 evictItemAtURL:v5 evenIfEnumeratingFP:0 andClearACLForConsumer:a2 completionHandler:v7];
}

void __FPEvictItem_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __FPEvictItem_block_invoke_cold_1();
    }
  }
}

BOOL FPEvictItemAtURL(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  char v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __FPEvictItemAtURL_block_invoke;
  v11[3] = &unk_1E5AF1950;
  void v11[4] = &v12;
  id v4 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:v11];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPEvictItemAtURL_block_invoke_2;
  v8[3] = &unk_1E5AF2A90;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v12;
  [v5 FPEvictItemAtURL:v3 completionHandler:v8];
  if (a2) {
    *a2 = (id) v13[5];
  }
  BOOL v6 = v13[5] == 0;

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_1A343E1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __FPEvictItemAtURL_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", 45);

  return MEMORY[0x1F41817F8]();
}

void __FPEvictItemAtURL_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6 || (a2 & 1) != 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    [*(id *)(a1 + 32) callNextOverrides];
  }
}

void FPUpdateLastUsedDate(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(a1, "fp_matchesFileProviderHeuristics:", geteuid()))
  {
    id v4 = +[FPDaemonConnection sharedConnection];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __FPUpdateLastUsedDate_block_invoke;
    void v5[3] = &unk_1E5AF0790;
    id v6 = v3;
    [v4 updateLastUsedDateForFileURL:a1 completionHandler:v5];
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

uint64_t __FPUpdateLastUsedDate_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void FPSetAlternateContentsURLOnDocumentURL(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  id v7 = a2;
  id v8 = +[FPDaemonConnection sharedConnectionProxy];
  if (v7)
  {
    id v21 = 0;
    id v9 = +[FPSandboxingURLWrapper wrapperWithURL:v7 readonly:0 error:&v21];
    id v10 = v21;
    if (!v9)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void FPSetAlternateContentsURLOnDocumentURL(CFURLRef, CFURLRef, void (^__strong)(CFErrorRef))");
      uint64_t v13 = objc_msgSend(v7, "fp_scopeDescription");
      [v11 handleFailureInFunction:v12, @"FPUtilities.m", 706, @"nil wrapper returned for url %@: %@", v13, v10 file lineNumber description];
    }
  }
  else
  {
    id v9 = 0;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __FPSetAlternateContentsURLOnDocumentURL_block_invoke;
  v17[3] = &unk_1E5AF15D8;
  id v18 = v7;
  id v19 = v6;
  id v20 = v5;
  id v14 = v5;
  id v15 = v6;
  id v16 = v7;
  [v8 setAlternateContentsURL:v9 onDocumentURL:v15 completionHandler:v17];
}

void __FPSetAlternateContentsURLOnDocumentURL_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __FPSetAlternateContentsURLOnDocumentURL_block_invoke_cold_2((id *)a1);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __FPSetAlternateContentsURLOnDocumentURL_block_invoke_cold_1(a1);
  }

  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void FPFetchAlternateContentsURLForDocumentURL(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[FPDaemonConnection sharedConnectionProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPFetchAlternateContentsURLForDocumentURL_block_invoke;
  v8[3] = &unk_1E5AF1848;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 fetchAlternateContentsURLForDocumentURL:v7 completionHandler:v8];
}

void __FPFetchAlternateContentsURLForDocumentURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = fp_current_or_default_log();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __FPFetchAlternateContentsURLForDocumentURL_block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __FPFetchAlternateContentsURLForDocumentURL_block_invoke_cold_1();
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

void FPAppHasNonUploadedFiles(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = +[FPDaemonConnection sharedConnectionProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPAppHasNonUploadedFiles_block_invoke;
  v8[3] = &unk_1E5AF09B8;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 appHasNonUploadedFiles:v7 completionHandler:v8];
}

void __FPAppHasNonUploadedFiles_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = fp_current_or_default_log();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __FPAppHasNonUploadedFiles_block_invoke_cold_2(a1, v5);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __FPAppHasNonUploadedFiles_block_invoke_cold_1(a1, a2, v7);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

uint64_t FPAuthorizeCallWithAuditToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a4 + 16))(a4, 1, 0);
}

void FPDidUpdateAlternateContentsDocumentForDocumentAtURL(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[FPDaemonConnection sharedConnectionProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke;
  v8[3] = &unk_1E5AF0800;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 didUpdateAlternateContentsDocumentForDocumentAtURL:v7 completionHandler:v8];
}

void __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke_cold_1(a1);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void legacy_FPUniversalBookmarkableStringFromDocumentURL(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke;
  v15[3] = &unk_1E5AF2948;
  id v5 = v3;
  id v17 = v5;
  id v6 = v4;
  id v16 = v6;
  id v7 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:v15];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke_2;
  v11[3] = &unk_1E5AF2920;
  id v12 = v7;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  [v10 FPUniversalBookmarkableStringFromDocumentURL:v9 completionHandler:v11];
}

void legacy_FPDocumentURLFromUniversalBookmarkableString(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke;
  v11[3] = &unk_1E5AF14E8;
  id v4 = v3;
  id v12 = v4;
  id v5 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:v11];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke_2;
  v8[3] = &unk_1E5AF1848;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [v7 FPDocumentURLFromUniversalBookmarkableString:a1 completionHandler:v8];
}

void FPPauseSyncForFileAtURL(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  id v4 = a3;
  FPNotSupportedError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id))a3)[2](v4, v5);
}

void FPResumeSyncForFileAtURL(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  id v4 = a3;
  FPNotSupportedError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id))a3)[2](v4, v5);
}

void FPResumeSyncForFileAtURLWithOptions(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  id v4 = a3;
  FPNotSupportedError();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id))a3)[2](v4, v5);
}

void FPPauseSyncForFileAtURLWithBehavior(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if (objc_msgSend(v5, "fp_matchesFileProviderHeuristics:", geteuid()))
  {
    id v7 = +[FPDaemonConnection sharedConnectionProxy];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __FPPauseSyncForFileAtURLWithBehavior_block_invoke;
    v9[3] = &unk_1E5AF0790;
    id v10 = v6;
    [v7 pauseSyncForItemAtURL:v5 behavior:a2 bundleID:0 completionHandler:v9];
  }
  else
  {
    id v8 = FPNotSupportedError();
    (*((void (**)(id, void *))v6 + 2))(v6, v8);
  }
}

void __FPPauseSyncForFileAtURLWithBehavior_block_invoke(uint64_t a1, void *a2)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v10[0] = @"NSFileProviderInternalErrorDomain";
    v10[1] = @"NSFileProviderErrorDomain";
    uint64_t v4 = *MEMORY[0x1E4F28798];
    v10[2] = *MEMORY[0x1E4F281F8];
    v10[3] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
    id v6 = objc_msgSend(v3, "fp_unwrappedErrorForDomains:", v5);

    id v7 = [v6 domain];
    if ([v7 isEqualToString:@"NSFileProviderInternalErrorDomain"])
    {
      uint64_t v8 = [v6 code];

      if (v8 != 16)
      {
        id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_8:
        v9();

        goto LABEL_9;
      }
    }
    else
    {
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_8;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
}

void FPResumeSyncForFileAtURLWithBehavior(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  if (objc_msgSend(v5, "fp_matchesFileProviderHeuristics:", geteuid()))
  {
    id v7 = +[FPDaemonConnection sharedConnectionProxy];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __FPResumeSyncForFileAtURLWithBehavior_block_invoke;
    v9[3] = &unk_1E5AF0790;
    id v10 = v6;
    [v7 resumeSyncForItemAtURL:v5 behavior:a2 bundleID:0 completionHandler:v9];
  }
  else
  {
    uint64_t v8 = FPNotSupportedError();
    (*((void (**)(id, void *))v6 + 2))(v6, v8);
  }
}

void __FPResumeSyncForFileAtURLWithBehavior_block_invoke(uint64_t a1, void *a2)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v10[0] = @"NSFileProviderInternalErrorDomain";
    v10[1] = @"NSFileProviderErrorDomain";
    uint64_t v4 = *MEMORY[0x1E4F28798];
    v10[2] = *MEMORY[0x1E4F281F8];
    v10[3] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
    id v6 = objc_msgSend(v3, "fp_unwrappedErrorForDomains:", v5);

    id v7 = [v6 domain];
    if ([v7 isEqualToString:@"NSFileProviderInternalErrorDomain"])
    {
      uint64_t v8 = [v6 code];

      if (v8 != 17)
      {
        id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_8:
        v9();

        goto LABEL_9;
      }
    }
    else
    {
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_8;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
}

void FPGetPausedFilesList(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = +[FPDaemonConnection sharedConnectionProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPGetPausedFilesList_block_invoke;
  v8[3] = &unk_1E5AF2AB8;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 listPausedURLsWithBundleID:0 completionHandler:v8];
}

void __FPGetPausedFilesList_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v24[0] = @"NSFileProviderInternalErrorDomain";
    v24[1] = @"NSFileProviderErrorDomain";
    uint64_t v7 = *MEMORY[0x1E4F28798];
    v24[2] = *MEMORY[0x1E4F281F8];
    v24[3] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    id v9 = objc_msgSend(v6, "fp_unwrappedErrorForDomains:", v8);

    id v10 = [v9 domain];
    if ([v10 isEqualToString:@"NSFileProviderInternalErrorDomain"])
    {
      uint64_t v11 = [v9 code];

      if (v11 != 16)
      {
        id v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_15:
        v12();

        goto LABEL_16;
      }
    }
    else
    {
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_15;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v5);
        }
        uint64_t v17 = *(void *)(a1 + 40);
        id v18 = [*(id *)(*((void *)&v19 + 1) + 8 * i) url];
        (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
      }
      uint64_t v14 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_16:
}

void FPFetchLatestVersionForFileAtURL(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (objc_msgSend(v3, "fp_matchesFileProviderHeuristics:", geteuid()))
  {
    id v5 = +[FPDaemonConnection sharedConnectionProxy];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __FPFetchLatestVersionForFileAtURL_block_invoke;
    v7[3] = &unk_1E5AF2AE0;
    id v9 = v4;
    id v8 = v3;
    [v5 fetchLatestVersionForItemAtURL:v8 bundleID:0 completionHandler:v7];
  }
  else
  {
    id v6 = FPNotSupportedError();
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

void __FPFetchLatestVersionForFileAtURL_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v38[4] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v38[0] = @"NSFileProviderInternalErrorDomain";
    v38[1] = @"NSFileProviderErrorDomain";
    uint64_t v10 = *MEMORY[0x1E4F28798];
    v38[2] = *MEMORY[0x1E4F281F8];
    v38[3] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
    id v12 = objc_msgSend(v9, "fp_unwrappedErrorForDomains:", v11);

    uint64_t v13 = [v12 domain];
    if ([v13 isEqualToString:@"NSFileProviderInternalErrorDomain"])
    {
      uint64_t v14 = [v12 code];

      if (v14 != 16)
      {
        uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_12:
        v15();

        goto LABEL_29;
      }
    }
    else
    {
    }
    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_12;
  }
  if (v7)
  {
    id v16 = [MEMORY[0x1E4F63BE8] manager];
    uint64_t v17 = *(void *)(a1 + 32);
    id v37 = 0;
    id v18 = [v16 permanentStorageForItemAtURL:v17 allocateIfNone:0 error:&v37];
    id v19 = v37;

    if (v18)
    {
      uint64_t v20 = *MEMORY[0x1E4F63BB8];
      id v36 = v19;
      long long v21 = [v18 additionWithName:v7 inNameSpace:v20 error:&v36];
      id v22 = v36;

      if (v21)
      {
        id v35 = v22;
        id v23 = (void *)MEMORY[0x1E4F28CE8];
        if (v8)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28CE8]);
          uint64_t v25 = *(void *)(a1 + 32);
          long long v26 = [v21 name];
          long long v27 = [v8 url];
          long long v28 = (void *)[v24 _initWithFileURL:v25 library:0 clientID:0 name:v26 contentsURL:v27 isBackup:0 revision:0];
        }
        else
        {
          uint64_t v31 = *(void *)(a1 + 32);
          long long v26 = [v21 persistentIdentifier];
          long long v28 = [v23 versionOfItemAtURL:v31 forPersistentIdentifier:v26];
        }

        if (v28)
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        else
        {
          long long v32 = fp_current_or_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            __FPFetchLatestVersionForFileAtURL_block_invoke_cold_3();
          }

          uint64_t v33 = *(void *)(a1 + 40);
          long long v34 = FPItemNotFoundErrorAtURL(*(void **)(a1 + 32));
          (*(void (**)(uint64_t, void, void *))(v33 + 16))(v33, 0, v34);
        }
        id v22 = v35;
      }
      else
      {
        uint64_t v30 = fp_current_or_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          __FPFetchLatestVersionForFileAtURL_block_invoke_cold_2();
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }

      id v19 = v22;
    }
    else
    {
      uint64_t v29 = fp_current_or_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        __FPFetchLatestVersionForFileAtURL_block_invoke_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_29:
}

void _fetchProviderForProviderDomainID(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = ___fetchProviderForProviderDomainID_block_invoke;
  void v5[3] = &unk_1E5AF1790;
  id v6 = v3;
  id v4 = v3;
  +[FPProviderDomain fetchProviderDomainWithID:a1 completionHandler:v5];
}

void ___fetchProviderForProviderDomainID_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (!v8 || v5)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  if ([v8 isEnabled])
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_6:
    v6();
    goto LABEL_8;
  }
  id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"provider isn't enabled");
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_8:
}

void _fetchItemForItemID(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[FPItemManager defaultManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = ___fetchItemForItemID_block_invoke;
  v7[3] = &unk_1E5AF2B08;
  id v8 = v3;
  id v6 = v3;
  [v5 fetchItemForItemID:v4 completionHandler:v7];
}

uint64_t ___fetchItemForItemID_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t FPCreateCrossDeviceItemIDForItemAtURL(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPCreateCrossDeviceItemIDForItemAtURL_block_invoke;
  v8[3] = &unk_1E5AF2A18;
  uint64_t v10 = &v12;
  uint64_t v11 = a2;
  id v5 = v4;
  id v9 = v5;
  FPCrossDeviceItemIDForItemAtURL(a1, v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v6 = v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_1A343FE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FPCrossDeviceItemIDForItemAtURL(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    FPCrossDeviceItemIDForItemAtURL_cold_1();
  }

  if (a1)
  {
    id v5 = +[FPItemManager defaultManager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _OWORD v6[2] = __FPCrossDeviceItemIDForItemAtURL_block_invoke;
    v6[3] = &unk_1E5AF2B08;
    id v7 = v3;
    [v5 fetchItemForURL:a1 completionHandler:v6];
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"itemURL required to fetch cross-device itemID");
    (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v5);
  }
}

intptr_t __FPCreateCrossDeviceItemIDForItemAtURL_block_invoke(uint64_t a1, void *a2, const void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (a3)
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __FPCreateCrossDeviceItemIDForItemAtURL_block_invoke_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      CFRetain(a3);
      **(void **)(a1 + 48) = a3;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __FPCrossDeviceItemIDForItemAtURL_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    dispatch_semaphore_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v5 = [a2 itemID];
    FPCrossDeviceItemIDForItemID(v5, *(void **)(a1 + 32));
  }
}

void FPCrossDeviceItemIDForItemID(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    FPCrossDeviceItemIDForItemID_cold_1();
  }

  if (v3)
  {
    uint64_t v6 = +[FPItemManager defaultManager];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    void v35[2] = __FPCrossDeviceItemIDForItemID_block_invoke;
    v35[3] = &unk_1E5AF2B30;
    id v7 = v4;
    id v37 = v7;
    id v8 = v3;
    id v36 = v8;
    id v9 = (void *)MEMORY[0x1A6248B00](v35);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __FPCrossDeviceItemIDForItemID_block_invoke_71;
    v32[3] = &unk_1E5AF2B80;
    id v10 = v7;
    id v33 = v10;
    id v34 = v9;
    id v11 = v9;
    uint64_t v12 = (void *)MEMORY[0x1A6248B00](v32);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __FPCrossDeviceItemIDForItemID_block_invoke_4;
    v28[3] = &unk_1E5AF2BD0;
    id v13 = v10;
    id v30 = v13;
    id v31 = v12;
    id v29 = v6;
    id v14 = v6;
    id v15 = v12;
    id v16 = (void *)MEMORY[0x1A6248B00](v28);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __FPCrossDeviceItemIDForItemID_block_invoke_6;
    id v24 = &unk_1E5AF2C20;
    id v26 = v13;
    id v17 = v8;
    id v25 = v17;
    id v27 = v16;
    id v18 = v16;
    id v19 = (void *)MEMORY[0x1A6248B00](&v21);
    uint64_t v20 = objc_msgSend(v17, "providerDomainID", v21, v22, v23, v24);
    _fetchProviderForProviderDomainID((uint64_t)v20, v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"itemID required to fetch cross-device itemID");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v14);
  }
}

uint64_t FPCreateCrossDeviceItemIDForItemID(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPCreateCrossDeviceItemIDForItemID_block_invoke;
  v8[3] = &unk_1E5AF2A18;
  id v10 = &v12;
  uint64_t v11 = a2;
  id v5 = v4;
  id v9 = v5;
  FPCrossDeviceItemIDForItemID(v3, v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v6 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_1A34404D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t __FPCreateCrossDeviceItemIDForItemID_block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (a3)
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __FPCreateCrossDeviceItemIDForItemID_block_invoke_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      CFRetain(a3);
      **(void **)(a1 + 48) = a3;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __FPCrossDeviceItemIDForItemID_block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4, uint64_t a5)
{
  id v9 = a4;
  id v10 = v9;
  if (!a2 || a5)
  {
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_8:
    v12();
    goto LABEL_15;
  }
  if (a3)
  {
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __FPCrossDeviceItemIDForItemID_block_invoke_cold_1(a1);
    }

    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_8;
  }
  if (v9)
  {
    id v13 = [NSString stringWithFormat:@"%@:%@:%@", @"deviceSpecific", v9, a2];
    uint64_t v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __FPCrossDeviceItemIDForItemID_block_invoke_cold_1(a1);
    }

    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"can't extract path UUID for local only item");
    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v15();

LABEL_15:
}

void __FPCrossDeviceItemIDForItemID_block_invoke_71(uint64_t a1, void *a2, int a3, char a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (!v11 || v13)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    char v15 = [v11 startAccessingSecurityScopedResource];
    if (a3)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __FPCrossDeviceItemIDForItemID_block_invoke_2;
      v23[3] = &unk_1E5AF2B58;
      char v27 = v15;
      id v24 = v11;
      id v26 = *(id *)(a1 + 40);
      char v28 = a4;
      id v25 = v12;
      legacy_FPUniversalBookmarkableStringFromDocumentURL(v24, v23);

      id v16 = v24;
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __FPCrossDeviceItemIDForItemID_block_invoke_3;
      v17[3] = &unk_1E5AF2B58;
      char v21 = v15;
      id v18 = v11;
      id v20 = *(id *)(a1 + 40);
      char v22 = a4;
      id v19 = v12;
      FPBookmarkableStringFromDocumentURL(v18, v17);

      id v16 = v18;
    }
  }
}

uint64_t __FPCrossDeviceItemIDForItemID_block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __FPCrossDeviceItemIDForItemID_block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __FPCrossDeviceItemIDForItemID_block_invoke_4(uint64_t a1, void *a2, char a3, int a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  id v11 = v10;
  if (!v9 || v10)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (a4 && [v9 isUbiquitous] && (objc_msgSend(v9, "isUploaded") & 1) != 0)
    {
      id v12 = 0;
      char v13 = 1;
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F223F0];
      char v15 = [v9 providerID];
      id v16 = [v14 bundleProxyForIdentifier:v15];

      id v17 = [v16 dataContainerURL];
      id v12 = [v17 lastPathComponent];

      char v13 = 0;
    }
    id v18 = [v9 fileURL];
    if (v18)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v19 = *(void **)(a1 + 32);
      id v20 = [v9 itemID];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __FPCrossDeviceItemIDForItemID_block_invoke_5;
      void v21[3] = &unk_1E5AF2BA8;
      id v23 = *(id *)(a1 + 48);
      char v24 = a3;
      char v25 = v13;
      id v22 = v12;
      [v19 fetchURLForItemID:v20 completionHandler:v21];
    }
  }
}

uint64_t __FPCrossDeviceItemIDForItemID_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(void *)(a1 + 32), a3);
}

void __FPCrossDeviceItemIDForItemID_block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    char v7 = [v5 isiCloudDriveProvider];
    if (v7) {
      char v8 = 1;
    }
    else {
      char v8 = [v6 usesUniqueItemIdentifiersAcrossDevices];
    }
    id v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __FPCrossDeviceItemIDForItemID_block_invoke_7;
    v10[3] = &unk_1E5AF2BF8;
    id v11 = *(id *)(a1 + 48);
    char v12 = v7;
    char v13 = v8;
    _fetchItemForItemID(v9, v10);
  }
}

uint64_t __FPCrossDeviceItemIDForItemID_block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), a3);
}

uint64_t FPGetItemURLForCrossDeviceItemID(void *a1, uint64_t a2)
{
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPGetItemURLForCrossDeviceItemID_block_invoke;
  v8[3] = &unk_1E5AF2C48;
  id v10 = &v12;
  uint64_t v11 = a2;
  id v5 = v4;
  id v9 = v5;
  FPItemURLForCrossDeviceItemID(a1, v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v6 = v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void sub_1A3440DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FPItemURLForCrossDeviceItemID(void *a1, void *a2)
{
  id v3 = a2;
  if (a1) {
    CFRetain(a1);
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  void v34[2] = __FPItemURLForCrossDeviceItemID_block_invoke;
  v34[3] = &unk_1E5AF2C70;
  id v36 = a1;
  id v4 = v3;
  id v35 = v4;
  id v5 = (void (**)(void, void, void))MEMORY[0x1A6248B00](v34);
  uint64_t v6 = fp_current_or_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    FPItemURLForCrossDeviceItemID_cold_1();
  }

  if (a1)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __FPItemURLForCrossDeviceItemID_block_invoke_79;
    v31[3] = &unk_1E5AF2C98;
    char v7 = v5;
    id v32 = v7;
    id v33 = a1;
    char v8 = (void *)MEMORY[0x1A6248B00](v31);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    void v27[2] = __FPItemURLForCrossDeviceItemID_block_invoke_84;
    v27[3] = &unk_1E5AF2CE8;
    id v9 = v7;
    id v28 = v9;
    id v30 = a1;
    id v10 = v8;
    id v29 = v10;
    uint64_t v11 = (void *)MEMORY[0x1A6248B00](v27);
    id v12 = a1;
    if ([v12 hasPrefix:@"deviceSpecific"])
    {
      char v13 = [v12 substringFromIndex:objc_msgSend(@"deviceSpecific", "length")];

      if (([v13 hasPrefix:@":"] & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"crossDeviceItemID has an invalid format");
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void, id))v9 + 2))(v9, 0, v16);
        goto LABEL_17;
      }
      uint64_t v14 = [v13 substringFromIndex:1];

      uint64_t v15 = [v14 rangeOfString:@":"];
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"crossDeviceItemID has an invalid format");
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void, id))v9 + 2))(v9, 0, v16);
        char v13 = v14;
LABEL_17:

        id v17 = v32;
        goto LABEL_18;
      }
      uint64_t v20 = v15;
      id v18 = [v14 substringToIndex:v15];
      id v12 = [v14 substringFromIndex:v20 + 1];
    }
    else
    {
      id v18 = 0;
    }
    if ([v12 hasPrefix:@"fp:"])
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __FPItemURLForCrossDeviceItemID_block_invoke_2;
      v24[3] = &unk_1E5AF2D10;
      id v25 = v18;
      id v26 = v11;
      id v16 = v18;
      FPDocumentURLFromBookmarkableString((uint64_t)v12, v24);

      id v19 = v26;
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __FPItemURLForCrossDeviceItemID_block_invoke_3;
      void v21[3] = &unk_1E5AF2D10;
      id v22 = v18;
      id v23 = v11;
      id v16 = v18;
      legacy_FPDocumentURLFromUniversalBookmarkableString((uint64_t)v12, v21);

      id v19 = v23;
    }

    char v13 = v12;
    goto LABEL_17;
  }
  id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"crossDeviceItemID required to resolve itemURL");
  ((void (**)(void, void, void *))v5)[2](v5, 0, v17);
LABEL_18:
}

intptr_t __FPGetItemURLForCrossDeviceItemID_block_invoke(uint64_t a1, void *a2, const void *a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (a3)
  {
    id v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __FPGetItemURLForCrossDeviceItemID_block_invoke_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      CFRetain(a3);
      **(void **)(a1 + 48) = a3;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __FPItemURLForCrossDeviceItemID_block_invoke(uint64_t a1)
{
  id v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void __FPItemURLForCrossDeviceItemID_block_invoke_79(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a3;
  id v10 = a4;
  if (!a2 || a5)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F223F0];
    id v12 = [a2 providerID];
    char v13 = [v11 bundleProxyForIdentifier:v12];

    uint64_t v14 = [v13 dataContainerURL];
    uint64_t v15 = [v14 lastPathComponent];
    char v16 = [v9 isEqualToString:v15];

    if (v16)
    {
      id v17 = fp_current_or_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        __FPItemURLForCrossDeviceItemID_block_invoke_79_cold_1(a1, v10);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v18 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_invalidArgumentError:", @"path UUID doesn't match in resulting item URL");
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __FPItemURLForCrossDeviceItemID_block_invoke_84(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  char v8 = v7;
  if (!a2 || a4)
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_9:
    v12();
    goto LABEL_10;
  }
  if (!v7)
  {
    char v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __FPItemURLForCrossDeviceItemID_block_invoke_84_cold_1(a1, a2);
    }

    id v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  id v9 = CFRetain(a2);
  [v9 startAccessingSecurityScopedResource];
  id v10 = +[FPItemManager defaultManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __FPItemURLForCrossDeviceItemID_block_invoke_85;
  v14[3] = &unk_1E5AF2CC0;
  id v15 = v9;
  id v17 = *(id *)(a1 + 40);
  id v16 = v8;
  id v11 = v9;
  [v10 fetchItemForURL:v11 completionHandler:v14];

LABEL_10:
}

void __FPItemURLForCrossDeviceItemID_block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 stopAccessingSecurityScopedResource];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __FPItemURLForCrossDeviceItemID_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), a3);
}

uint64_t __FPItemURLForCrossDeviceItemID_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), a3);
}

id FPGetItemIDFromCrossDeviceItemID(void *a1, uint64_t a2)
{
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPGetItemIDFromCrossDeviceItemID_block_invoke;
  v8[3] = &unk_1E5AF2D38;
  id v10 = &v12;
  uint64_t v11 = a2;
  id v5 = v4;
  id v9 = v5;
  FPItemIDFromCrossDeviceItemID(a1, v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v6;
}

void sub_1A34417A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void FPItemIDFromCrossDeviceItemID(void *a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    FPItemIDFromCrossDeviceItemID_cold_1();
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __FPItemIDFromCrossDeviceItemID_block_invoke;
  v12[3] = &unk_1E5AF2D60;
  id v5 = v3;
  id v13 = v5;
  uint64_t v14 = a1;
  id v6 = (void *)MEMORY[0x1A6248B00](v12);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __FPItemIDFromCrossDeviceItemID_block_invoke_97;
  v9[3] = &unk_1E5AF2D88;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  FPItemURLForCrossDeviceItemID(a1, v9);
}

void __FPGetItemIDFromCrossDeviceItemID_block_invoke(uint64_t a1, void *a2, const void *a3)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (a3)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __FPGetItemIDFromCrossDeviceItemID_block_invoke_cold_1();
    }

    if (*(void *)(a1 + 48))
    {
      CFRetain(a3);
      **(void **)(a1 + 48) = a3;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __FPItemIDFromCrossDeviceItemID_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __FPItemIDFromCrossDeviceItemID_block_invoke_cold_1(a1, v5);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v5 itemID];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
}

void __FPItemIDFromCrossDeviceItemID_block_invoke_97(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
  else
  {
    id v6 = +[FPItemManager defaultManager];
    [v6 fetchItemForURL:a2 completionHandler:*(void *)(a1 + 40)];
  }
}

void __FPResolveSymlinkRecursive_block_invoke(uint64_t a1, void *a2)
{
}

void __FPResolveSymlinkRecursive_block_invoke_2(uint64_t a1, void *a2)
{
}

uint64_t OUTLINED_FUNCTION_10_3(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_16_1(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_1A344271C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 104));
  objc_destroyWeak((id *)(v11 - 96));
  _Unwind_Resume(a1);
}

void sub_1A3443108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A3443B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FPGetImportCookieForURL(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__9;
  id v19 = __Block_byref_object_dispose__9;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__9;
  uint64_t v13 = __Block_byref_object_dispose__9;
  id v14 = 0;
  dispatch_semaphore_t v4 = [MEMORY[0x1E4F63BE8] manager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FPGetImportCookieForURL_block_invoke;
  v8[3] = &unk_1E5AF2EC0;
  void v8[4] = &v9;
  v8[5] = &v15;
  [v4 readImportCookieDataForVolumeAtURL:v3 handler:v8];

  if (a2)
  {
    id v5 = (void *)v10[5];
    if (v5) {
      *a2 = v5;
    }
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

void sub_1A3443EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void ExpirationInterval()
{
  if (os_variant_has_internal_content())
  {
    uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v0 doubleForKey:@"com.apple.fileproviderd.importCookieExpiration"];
  }
}

void __FPGetImportCookieForURL_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a4);
  }
  else if (v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v12 + 40);
    uint64_t v13 = [v10 unarchivedObjectOfClass:v11 fromData:v7 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v16 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "entries", 0);
    uint64_t v17 = [v16 allValues];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v22 creationTime];
          if (v23 == 0.0)
          {
            [v8 timeIntervalSinceReferenceDate];
            objc_msgSend(v22, "setCreationTime:");
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v19);
    }
  }
}

uint64_t FPWriteImportCookieForDomainURL(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    FPWriteImportCookieForDomainURL_cold_1(v5);
  }

  id v8 = [[FPImportCookie alloc] initWithURL:v5 error:a3];
  if (v8)
  {
    id v9 = [[FPImportCookieEntry alloc] initWithDomainURL:v5 displayName:v6 error:a3];
    if (v9)
    {
      [(FPImportCookie *)v8 addEntry:v9];
      uint64_t v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:a3];
      if (v10)
      {
        uint64_t v11 = [MEMORY[0x1E4F63BE8] manager];
        uint64_t v12 = [v11 storeImportCookieData:v10 forVolumeURL:v5 error:a3];
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t FPClearImportCookieForDomainURL(void *a1, void *a2)
{
  id v3 = a1;
  dispatch_semaphore_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    FPClearImportCookieForDomainURL_cold_1(v3);
  }

  id v5 = FPPathRelativeToVolumeRoot(v3, 0, a2);
  if (v5)
  {
    id v13 = 0;
    id v6 = FPGetImportCookieForURL(v3, &v13);
    id v7 = v13;
    id v8 = v7;
    if (v6)
    {
      [v6 removeEntryForPathRelativeToVolumeRoot:v5];
      if ([v6 isEmpty])
      {
        id v9 = [MEMORY[0x1E4F63BE8] manager];
        uint64_t v10 = [v9 storeImportCookieData:0 forVolumeURL:v3 error:a2];
      }
      else
      {
        id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:a2];
        uint64_t v11 = [MEMORY[0x1E4F63BE8] manager];
        uint64_t v10 = [v11 storeImportCookieData:v9 forVolumeURL:v3 error:a2];
      }
    }
    else if (v7)
    {
      uint64_t v10 = 0;
      if (a2) {
        *a2 = v7;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t FPIsImportingInVolumeAtURL(void *a1, void *a2)
{
  id v3 = FPGetImportCookieForURL(a1, 0);
  dispatch_semaphore_t v4 = v3;
  if (v3 && ([v3 isEmpty] & 1) == 0)
  {
    int v7 = [v4 hasExpired];
    uint64_t v5 = v7 ^ 1u;
    if (a2 && (v7 & 1) == 0)
    {
      *a2 = [v4 providersWithOngoingImport];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t FPIsImportingDomainsForUserURL(void *a1, void **a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = FPGetImportCookieForURL(v2, 0);
  dispatch_semaphore_t v4 = v3;
  if (!v3 || ([v3 isEmpty] & 1) != 0 || (objc_msgSend(v4, "hasExpired") & 1) != 0)
  {
    char v5 = 0;
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v31 = v4;
    int v7 = [v4 entries];
    id v8 = [v7 allValues];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v36 = 0;
      uint64_t v37 = *(void *)v39;
      unint64_t v11 = 0x1E4F1C000uLL;
      id v33 = v2;
      id v34 = v8;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v37) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v14 = *(void **)(v11 + 2832);
          uint64_t v15 = [v13 domainPathRelativeToVolumeRoot];
          uint64_t v16 = [v14 fileURLWithPath:v15 isDirectory:1];

          uint64_t v17 = FPPathRelativeToVolumeRoot(v2, 0, 0);
          if (v17)
          {
            unint64_t v18 = v11;
            uint64_t v19 = [*(id *)(v11 + 2832) fileURLWithPath:v17 isDirectory:1];
            if ((unint64_t)objc_msgSend(v19, "fp_relationshipToItemAtURL:", v16) <= 1)
            {
              uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
              [v20 timeIntervalSinceReferenceDate];
              double v22 = v21;

              ExpirationInterval();
              double v24 = v23;
              [v13 creationTime];
              double v26 = v22 - v25;
              if (v26 >= v24 || a2 == 0)
              {
                v36 |= v26 < v24;
              }
              else
              {
                id v28 = *a2;
                id v29 = *a2;
                if (!*a2)
                {
                  id v29 = objc_opt_new();
                  id v32 = v29;
                }
                uint64_t v30 = [v13 displayName];
                *a2 = [v29 setByAddingObject:v30];

                if (!v28) {
                char v36 = 1;
                }
                id v2 = v33;
                id v8 = v34;
              }
            }

            unint64_t v11 = v18;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v10);
    }
    else
    {
      char v36 = 0;
    }

    dispatch_semaphore_t v4 = v31;
    char v5 = v36;
  }

  return v5 & 1;
}

void sub_1A344525C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A34453D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3445868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A34459C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A3445E38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3446350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  objc_sync_exit(v22);
  objc_destroyWeak(location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_1A3446780(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3446924(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A344699C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A3446BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_1A3446CEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FPPathComponentsForFPItems(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v24 = a2;
  if ([v3 count])
  {
    double v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v20 = v3;
    id obj = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(id *)(*((void *)&v25 + 1) + 8 * i);
          id v8 = v24;
          uint64_t v9 = [v7 itemIdentifier];
          int v10 = [v9 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"];

          if (v10)
          {
            unint64_t v11 = [v8 domainFullDisplayName];
            uint64_t v12 = [v8 topLevelBundleURL];
            id v13 = 0;
            uint64_t v14 = 0;
          }
          else
          {
            if ([v7 isContainer])
            {
              unint64_t v11 = [v7 containerDisplayName];
              id v13 = [v8 domainFullDisplayName];
              uint64_t v14 = objc_msgSend(v7, "fp_appContainerBundleIdentifier");
            }
            else
            {
              unint64_t v11 = [v7 displayName];
              id v13 = 0;
              uint64_t v14 = 0;
            }
            uint64_t v12 = 0;
          }
          uint64_t v15 = [FPPathComponentDisplayMetadata alloc];
          uint64_t v16 = [v7 fileURL];
          uint64_t v17 = [(FPPathComponentDisplayMetadata *)v15 initWithURL:v16 displayName:v11 suffix:v13 bundleID:v14 bundleURL:v12];

          [v23 addObject:v17];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v5);
    }

    unint64_t v18 = (void *)[v23 copy];
    id v3 = v20;
  }
  else
  {
    unint64_t v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

void sub_1A3448924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1A3448B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3448DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3449DA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3449FD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __FPExecutableNameForProcessIdentifier_block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  FPExecutableNameForProcessIdentifier_pidResolutionAllowed = result == 0;
  return result;
}

id FPExecutableNameForAuditToken()
{
  uint64_t v0 = (audit_token_t *)MEMORY[0x1F4188790]();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath_audittoken(v0, buffer, 0x1000u) < 1)
  {
    id v2 = 0;
  }
  else
  {
    id v1 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:buffer isDirectory:0 relativeToURL:0];
    id v2 = [v1 lastPathComponent];
  }

  return v2;
}

id FPEntitlementValueForAuditToken(void *a1, _OWORD *a2)
{
  id v3 = a1;
  long long v4 = a2[1];
  *(_OWORD *)v9.val = *a2;
  *(_OWORD *)&v9.val[4] = v4;
  uint64_t v5 = SecTaskCreateWithAuditToken(0, &v9);
  if (v5)
  {
    id v6 = v5;
    id v7 = (void *)SecTaskCopyValueForEntitlement(v5, v3, 0);
    CFRelease(v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id FPOSVersion()
{
  if (FPOSVersion_pred != -1) {
    dispatch_once(&FPOSVersion_pred, &__block_literal_global_25);
  }
  uint64_t v0 = (void *)FPOSVersion_OSVersion;

  return v0;
}

void __FPOSVersion_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  v4[1] = 0;
  int v5 = 0;
  *(void *)id v3 = 0x4100000001;
  size_t v2 = 20;
  if (sysctl(v3, 2u, v4, &v2, 0, 0) < 0)
  {
    id v1 = fp_current_or_default_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __FPOSVersion_block_invoke_cold_1(v1);
    }
  }
  else
  {
    HIBYTE(v5) = 0;
    uint64_t v0 = [[NSString alloc] initWithUTF8String:v4];
    id v1 = FPOSVersion_OSVersion;
    FPOSVersion_OSVersion = v0;
  }
}

__CFString *FPVersion()
{
  return @"2732.60.128";
}

void __FPFSProviderIsForcedForFPFS_block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
  id v1 = [v0 arrayForKey:@"fpfs-providers"];

  size_t v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [v2 copy];
  uint64_t v10 = (void *)FPFSProviderIsForcedForFPFS_enabledProviders;
  FPFSProviderIsForcedForFPFS_enabledProviders = v9;
}

uint64_t FPFSProviderIsDeniedForFPFS(void *a1)
{
  uint64_t v1 = FPFSProviderIsDeniedForFPFS_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&FPFSProviderIsDeniedForFPFS_onceToken, &__block_literal_global_41);
  }
  uint64_t v3 = [(id)FPFSProviderIsDeniedForFPFS_blacklistedProviders containsObject:v2];

  return v3;
}

void __FPFSProviderIsDeniedForFPFS_block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
  uint64_t v1 = [v0 arrayForKey:@"fpfs-disabled-providers"];

  id v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [v2 copy];
  uint64_t v10 = (void *)FPFSProviderIsDeniedForFPFS_blacklistedProviders;
  FPFSProviderIsDeniedForFPFS_blacklistedProviders = v9;
}

uint64_t FPFeatureFlagFPFSSimIsEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t FPIsSpaceAttributionEnabledAndUsedByStorageUI()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    return FPFeatureFlagSpaceAttributionIsEnabled();
  }
  return result;
}

uint64_t StorageManagementFeatureFlagStorageUIV2IsEnabled()
{
  return _os_feature_enabled_impl();
}

BOOL FPFeatureFlagSpaceAttributionIsEnabled()
{
  return _os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0;
}

__CFString *FPCloudDocsProviderID()
{
  if (FPIsCloudDocsWithFPFSEnabled_onceToken != -1) {
    dispatch_once(&FPIsCloudDocsWithFPFSEnabled_onceToken, &__block_literal_global_74);
  }
  if (FPIsCloudDocsWithFPFSEnabled_icdOnFPFSEnabled) {
    return @"com.apple.CloudDocs.iCloudDriveFileProvider";
  }
  else {
    return @"com.apple.CloudDocs.MobileDocumentsFileProvider";
  }
}

id _getBootUUID()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  size_t v3 = 37;
  int v0 = sysctlbyname("kern.bootsessionuuid", v4, &v3, 0, 0);
  uint64_t v1 = 0;
  if (!v0)
  {
    uint64_t v1 = [NSString stringWithUTF8String:v4];
  }

  return v1;
}

BOOL FPVolumeFPFSSupported(uint64_t a1, int a2, uint64_t *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a2 && (_os_feature_enabled_impl() & 1) == 0)
  {
    if (a3) {
      *a3 = 1;
    }
    if (a4)
    {
      FPNotSupportedError();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a4 = v18;
      return result;
    }
    return 0;
  }
  uint64_t v8 = a1 + 1112;
  int v9 = *(_DWORD *)(a1 + 48);
  int v10 = *(_DWORD *)(a1 + 64);
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = 0;
    if ((v10 & 0x1000) != 0) {
      goto LABEL_5;
    }
LABEL_11:
    long long v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v21 = a1 + 1112;
      __int16 v22 = 1024;
      int v23 = v9;
      _os_log_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_INFO, "[INFO] Non-eligible device %{public}s [%d]: non-local", buf, 0x12u);
    }

    if (!a3) {
      return 0;
    }
    v11 |= 0x10uLL;
    if ((*(_DWORD *)(a1 + 64) & 0x400) == 0) {
      goto LABEL_19;
    }
LABEL_15:
    long long v14 = fp_current_or_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v21 = a1 + 1112;
      __int16 v22 = 1024;
      int v23 = v9;
      _os_log_impl(&dword_1A33AE000, v14, OS_LOG_TYPE_INFO, "[INFO] Non-eligible device %{public}s [%d]: quarantined", buf, 0x12u);
    }

    if (!a3) {
      return 0;
    }
    v11 |= 0x20uLL;
    goto LABEL_19;
  }
  long long v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v21 = a1 + 1112;
    __int16 v22 = 1024;
    int v23 = v9;
    _os_log_impl(&dword_1A33AE000, v12, OS_LOG_TYPE_INFO, "[INFO] Non-eligible device %{public}s [%d]: R/O volume", buf, 0x12u);
  }

  if (!a3) {
    return 0;
  }
  int v10 = *(_DWORD *)(a1 + 64);
  uint64_t v11 = 8;
  if ((v10 & 0x1000) == 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((v10 & 0x400) != 0) {
    goto LABEL_15;
  }
LABEL_19:
  if (!strcasecmp("apfs", (const char *)(a1 + 72))) {
    goto LABEL_24;
  }
  uint64_t v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v21 = v8;
    __int16 v22 = 1024;
    int v23 = v9;
    _os_log_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_INFO, "[INFO] Non-eligible device %{public}s [%d]: non-apfs", buf, 0x12u);
  }

  if (a3)
  {
    v11 |= 6uLL;
LABEL_24:
    if (!a2 || (v11 & 2) != 0)
    {
LABEL_28:
      if (!a3) {
        return v11 == 0;
      }
LABEL_29:
      *a3 = v11;
      return v11 == 0;
    }
    uint64_t VEKState = APFSVolumeGetVEKState();
    if (VEKState == 22)
    {
      uint64_t v19 = fp_current_or_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v21 = v8;
        __int16 v22 = 1024;
        int v23 = v9;
        _os_log_impl(&dword_1A33AE000, v19, OS_LOG_TYPE_INFO, "[INFO] Non-eligible device %{public}s [%d]: unencrypted", buf, 0x12u);
      }

      if (a3)
      {
        v11 |= 4uLL;
        goto LABEL_29;
      }
    }
    else
    {
      if (!VEKState) {
        goto LABEL_28;
      }
      if (a3) {
        *a3 = 1;
      }
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", VEKState);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return 0;
}

uint64_t FPIsFPCKXPCServiceEnabled()
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  uint64_t result = os_variant_has_internal_content();
  if (result)
  {
    if (FPIsFPCKXPCServiceEnabled_onceToken != -1) {
      dispatch_once(&FPIsFPCKXPCServiceEnabled_onceToken, &__block_literal_global_78);
    }
    return FPIsFPCKXPCServiceEnabled_featureEnabledByDefault != 0;
  }
  return result;
}

void __FPIsFPCKXPCServiceEnabled_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  FPIsFPCKXPCServiceEnabled_featureEnabledByDefault = [v0 BOOLForKey:@"com.apple.fileproviderd.FPCKService"];
}

uint64_t FPIgnoresForcedKeyChecks()
{
  if (FPIgnoresForcedKeyChecks_onceToken != -1) {
    dispatch_once(&FPIgnoresForcedKeyChecks_onceToken, &__block_literal_global_83);
  }
  return FPIgnoresForcedKeyChecks_areForcedKeysIgnored;
}

void __FPIgnoresForcedKeyChecks_block_invoke()
{
  if (os_variant_has_internal_content())
  {
    id v0 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
    FPIgnoresForcedKeyChecks_areForcedKeysIgnored = [v0 BOOLForKey:@"IgnoreForcedKeyChecksInInternalOS"];
  }
}

void sub_1A344B100(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS___onceToken != -1) {
    dispatch_once(&__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS___onceToken, &__block_literal_global_249);
  }
  if (__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS___isFatal)
  {
    size_t v3 = [NSString stringWithFormat:@"Enumerator for %@ attempted to return more than %lu items in one page/batch. Use the -suggestedBatchSize/suggestedPageSize methods to determine a reasonable number of items per page. Break on %s to debug this.", v1, 20000, "__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__"];
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v6 = v3;
      _os_log_fault_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 171, (const char *)[v3 UTF8String]);
  }
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v6 = v1;
    __int16 v7 = 2048;
    uint64_t v8 = 20000;
    __int16 v9 = 2080;
    int v10 = "__FILEPROVIDER_OBSERVER_TOO_MANY_ITEMS__";
    _os_log_fault_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_FAULT, "[CRIT] Enumerator for %@ attempted to return more than %lu items in one page/batch. Use the -suggestedBatchSize/suggestedPageSize methods to determine a reasonable number of items per page. Break on %s to debug this.", buf, 0x20u);
  }
}

void __FILEPROVIDER_OBSERVER_FINISHED_MORE_THAN_ONCE__(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (dyld_program_sdk_at_least())
  {
    size_t v3 = [NSString stringWithFormat:@"-finish* was called more than once on the observer for %@, only the first call is taken into account", v1];
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v6 = v3;
      _os_log_fault_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", buf, 0xCu);
    }

    __assert_rtn("__FILEPROVIDER_OBSERVER_FINISHED_MORE_THAN_ONCE__", "/Library/Caches/com.apple.xbs/Sources/FileProvider/extension/FPXEnumerator.m", 158, (const char *)[v3 UTF8String]);
  }
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = v1;
    _os_log_impl(&dword_1A33AE000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] -finish* was called more than once on the observer for %{public}@, only the first call is taken into account", buf, 0xCu);
  }
}

void sub_1A344CA18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1A344D0FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1A344D964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A344DADC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A344E0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28)
{
}

void sub_1A344E5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A344EAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A344F41C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

void sub_1A3450CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1A34535FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  if (a2 == 1)
  {
    id v18 = objc_begin_catch(exception_object);
    uint64_t v19 = fp_current_or_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [a17 predicate];
      -[FPPreflightUserInteraction _evaluateWithObjectsByName:sourceItems:suppressionDelegate:errorIndex:].cold.7(v20, (uint64_t)v18, (uint8_t *)(v17 - 256), v19);
    }

    objc_end_catch();
    JUMPOUT(0x1A3453184);
  }
  _Unwind_Resume(exception_object);
}

id fp_backtrace()
{
  MEMORY[0x1F4188790]();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  bzero(v2, 0x2000uLL);
  fp_backtrace_snprint(v2);
  id v0 = [NSString stringWithUTF8String:v2];

  return v0;
}

void fp_backtrace_exception_snprint(char *a1, size_t a2, void *a3)
{
  id v6 = [a3 callStackSymbols];
  id v5 = [v6 description];
  snprintf(a1, a2, "%s", (const char *)[v5 UTF8String]);
}

void FPCaptureLogsForOperation(void *a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = NSString;
  __int16 v9 = [v7 domain];
  int v10 = [v8 stringWithFormat:@"%@.%ld", v9, objc_msgSend(v7, "code")];

  uint64_t v11 = [v7 underlyingErrors];

  if (v11)
  {
    id v23 = v5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v12 = [v7 underlyingErrors];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        uint64_t v16 = 0;
        uint64_t v17 = v10;
        do
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          id v18 = *(void **)(*((void *)&v24 + 1) + 8 * v16);
          uint64_t v19 = [v18 domain];
          int v10 = [v17 stringByAppendingFormat:@";%@.%ld", v19, objc_msgSend(v18, "code")];

          ++v16;
          uint64_t v17 = v10;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v14);
    }

    id v5 = v23;
  }
  id v20 = fp_current_or_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v29 = v5;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v10;
    _os_log_debug_impl(&dword_1A33AE000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Sending ABC report with signature: type = %@, subtype = %@, subtype context = %@", buf, 0x20u);
  }

  uint64_t v21 = get_sd_reporter();
  __int16 v22 = [v21 signatureWithDomain:@"FileProvider" type:v5 subType:v6 subtypeContext:v10 detectedProcess:@"fileproviderd" triggerThresholdValues:0];
  [v21 snapshotWithSignature:v22 duration:0 events:0 payload:0 actions:&__block_literal_global_22 reply:15.0];
}

id get_sd_reporter()
{
  if (get_sd_reporter_onceToken != -1) {
    dispatch_once(&get_sd_reporter_onceToken, &__block_literal_global_35_0);
  }
  id v0 = (void *)get_sd_reporter__diagnosticReporter;

  return v0;
}

void __FPCaptureLogsForOperation_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C70]];
  int v3 = [v2 BOOLValue];

  uint64_t v4 = fp_current_or_default_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __FPCaptureLogsForOperation_block_invoke_cold_1(v4);
    }
  }
  else if (v5)
  {
    __FPCaptureLogsForOperation_block_invoke_cold_2(v4);
  }
}

void abc_report_assert_with_signature()
{
  id v0 = (void *)MEMORY[0x1F4188790]();
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = v0;
  uint64_t v2 = v1;
  if ((unint64_t)[v1 length] >= 0x65)
  {
    int v3 = objc_msgSend(NSString, "stringWithFormat:", @":0x%lx", objc_msgSend(v1, "hash"));
    uint64_t v4 = objc_msgSend(v1, "substringToIndex:", 100 - objc_msgSend(v3, "length"));
    uint64_t v2 = [v4 stringByAppendingString:v3];
  }
  BOOL v5 = get_sd_reporter();
  id v6 = [v5 signatureWithDomain:@"Application" type:@"Functional" subType:@"AssertionFailed" detectedProcess:@"fileproviderd" triggerThresholdValues:0];

  [v6 setObject:v2 forKeyedSubscript:*MEMORY[0x1E4FA8CB8]];
  bzero(v21, 0x2000uLL);
  fp_backtrace_snprint(v21);
  id v7 = [NSString stringWithUTF8String:v21];
  uint64_t v8 = get_sd_reporter();
  uint64_t v19 = @"backtrace";
  id v20 = v7;
  __int16 v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  char v10 = [v8 snapshotWithSignature:v6 duration:v9 event:0 payload:&__block_literal_global_20 reply:15.0];

  uint64_t v11 = fp_current_or_default_log();
  long long v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      abc_report_assert_with_signature_cold_1((uint64_t)v1, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    abc_report_assert_with_signature_cold_2((uint64_t)v1, v12);
  }
}

void __abc_report_assert_with_signature_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __abc_report_assert_with_signature_block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void fp_simulate_crash(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a1;
  uint64_t v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];
  getpid();
  SimulateCrash();
  abc_report_assert_with_signature();
}

void __fp_leave_section_Error(uint64_t *a1)
{
  id v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __fp_leave_section_Error_cold_1(a1, v2);
  }
}

id fssync_default_log()
{
  if (fssync_default_log_once != -1) {
    dispatch_once(&fssync_default_log_once, &__block_literal_global_30_0);
  }
  id v0 = (void *)fssync_default_log_log;

  return v0;
}

uint64_t __fssync_default_log_block_invoke()
{
  fssync_default_log_log = (uint64_t)os_log_create("com.apple.FileProvider", "fssync");

  return MEMORY[0x1F41817F8]();
}

uint64_t fp_backtrace_snprint(char *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  *(_OWORD *)uint64_t v11 = 0u;
  long long v12 = 0u;
  uint64_t result = backtrace(v11, 24);
  if (result)
  {
    uint64_t v3 = 0;
    uint64_t v4 = result;
    int64_t v5 = 0x2000;
    do
    {
      memset(&v10, 0, sizeof(v10));
      if (v3)
      {
        if (dladdr(v11[v3], &v10))
        {
          dli_sname = v10.dli_sname;
          uint64_t v7 = rindex(v10.dli_fname, 47);
          dli_fname = v10.dli_fname;
          if (v7) {
            dli_fname = v7 + 1;
          }
        }
        else
        {
          dli_sname = "";
          dli_fname = "";
        }
        uint64_t result = snprintf(a1, v5, "frame %d: %lld %s in %s\n", v3, v11[v3], dli_sname, dli_fname);
        BOOL v9 = v5 <= (int)result;
        v5 -= (int)result;
        if (v9) {
          return result;
        }
        a1 += (int)result;
      }
      ++v3;
    }
    while (v4 != v3);
  }
  return result;
}

uint64_t __get_sd_reporter_block_invoke()
{
  get_sd_reporter__diagnosticReporter = (uint64_t)objc_alloc_init(MEMORY[0x1E4FA8AF0]);

  return MEMORY[0x1F41817F8]();
}

uint64_t __fpfs_default_log_block_invoke()
{
  fpfs_default_log_log = (uint64_t)os_log_create("com.apple.FileProvider", "fpfs");

  return MEMORY[0x1F41817F8]();
}

uint64_t dataless_fault_header_encode(uint64_t a1, int a2, unint64_t a3, unint64_t a4, int a5)
{
  switch(a2)
  {
    case 1:
      int v5 = -2147483647;
      goto LABEL_7;
    case 3:
      a3 = a3 & 0xFFFFFFFFFFLL | ((unint64_t)a4 << 40);
      int v5 = -2147483646;
      goto LABEL_7;
    case 2:
      int v5 = -2147483647;
      a3 = a4;
LABEL_7:
      *(_DWORD *)a1 = 1668116582;
      *(_DWORD *)(a1 + 4) = v5;
      *(void *)(a1 + 8) = a3;
      *(_DWORD *)(a1 + 16) = a5;
      return 20;
  }
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_parse_cmpfs_xattr(uint64_t a1, unint64_t a2, uid_t *a3, _DWORD *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a2 <= 0x13) {
    goto LABEL_2;
  }
  if (*(_DWORD *)a1 != 1668116582 || (*(_DWORD *)(a1 + 4) + 0x7FFFFFFF) >= 2)
  {
    uint64_t v4 = __error();
    int v5 = 45;
    goto LABEL_8;
  }
  int v7 = *(_DWORD *)(a1 + 16);
  if ((v7 & 2) == 0)
  {
    uint64_t v4 = __error();
    int v5 = 96;
    goto LABEL_8;
  }
  if (a2 - 20 <= 0xF)
  {
LABEL_2:
    uint64_t v4 = __error();
    int v5 = 100;
LABEL_8:
    *uint64_t v4 = v5;
    return 0xFFFFFFFFLL;
  }
  *(_OWORD *)uu1 = *(_OWORD *)(a1 + 20);
  if (a3)
  {
    *(void *)id_type = 0;
    long long uu2 = 0uLL;
    _get_current_user_uuid(&uu2);
    if (uuid_compare(uu1, (const unsigned __int8 *)&uu2))
    {
      if (mbr_uuid_to_id(uu1, (id_t *)&id_type[1], id_type)) {
        return 0xFFFFFFFFLL;
      }
      if (id_type[0])
      {
        uint64_t v4 = __error();
        int v5 = 80;
        goto LABEL_8;
      }
      uid_t v12 = id_type[1];
    }
    else
    {
      uid_t v12 = getuid();
    }
    *a3 = v12;
  }
  uint64_t result = 0;
  if (a4 && (v7 & 4) != 0)
  {
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) != 0x24)
    {
      uint64_t result = 0;
      *a4 = *(char *)(a1 + 36);
      return result;
    }
    *__error() = 100;
    if (*__error() == 100)
    {
      uint64_t result = 0;
      *a4 = 0;
      return result;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

double _get_current_user_uuid(_OWORD *a1)
{
  if (_get_current_user_uuid_once_token != -1) {
    dispatch_once(&_get_current_user_uuid_once_token, &__block_literal_global_13);
  }
  double result = *(double *)&_get_current_user_uuid_uuid_cached;
  *a1 = _get_current_user_uuid_uuid_cached;
  return result;
}

uint64_t fpfs_get_dataless_cmpfs_xattr_owner(char *a1, uid_t *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  bzero(value, 0xEDAuLL);
  ssize_t v4 = getxattr(a1, "com.apple.decmpfs", value, 0xEDAuLL, 0, 33);
  if (v4 < 0
    && (*__error() != 63
     || !fpfs_supports_long_paths()
     || (int v6 = fpfs_open_longpath(a1, 2097156, 0), v6 < 0)
     || (int v7 = v6,
         ssize_t v4 = fgetxattr(v6, "com.apple.decmpfs", value, 0xEDAuLL, 0, 32),
         int v8 = *__error(),
         close(v7),
         *__error() = v8,
         v4 < 0)))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return fpfs_parse_cmpfs_xattr((uint64_t)value, v4, a2, 0);
  }
}

uint64_t fpfs_fget_decmpf_type(int a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  bzero(value, 0xEDAuLL);
  ssize_t v4 = fgetxattr(a1, "com.apple.decmpfs", value, 0xEDAuLL, 0, 32);
  if (v4 < 16)
  {
    if (v4 < 0) {
      return -1;
    }
    int v6 = __error();
    int v7 = 34;
LABEL_9:
    *int v6 = v7;
    return -1;
  }
  if (value[0] != 1668116582)
  {
    int v6 = __error();
    int v7 = 22;
    goto LABEL_9;
  }
  if (a2) {
    *a2 = v9;
  }
  return value[1];
}

uint64_t _fset_dataless_cmpfs_xattr_only(int a1, int a2, unint64_t a3, unint64_t a4, int a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((_check_afsc_file(a1) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  bzero(v16, 0xEDAuLL);
  if (fpfs_supports_purge_reasons()) {
    int v10 = 6;
  }
  else {
    int v10 = 2;
  }
  switch(a2)
  {
    case 1:
      int v11 = -2147483647;
      break;
    case 3:
      a3 = a3 & 0xFFFFFFFFFFLL | ((unint64_t)a4 << 40);
      int v11 = -2147483646;
      break;
    case 2:
      int v11 = -2147483647;
      a3 = a4;
      break;
    default:
      *__error() = 22;
      uint64_t v13 = -1;
      goto LABEL_14;
  }
  v16[0] = 1668116582;
  v16[1] = v11;
  unint64_t v17 = a3;
  int v18 = v10;
  uint64_t v13 = 20;
LABEL_14:
  _get_current_user_uuid((_DWORD *)((char *)v16 + v13));
  size_t v14 = v13 + 16;
  int v15 = fpfs_supports_purge_reasons();
  if (a5)
  {
    if (v15)
    {
      *(_DWORD *)((char *)v16 + v14) = a5;
      size_t v14 = v13 + 20;
    }
  }
  return fpfs_fsetxattr(a1, "com.apple.decmpfs", v16, v14, 0, 0);
}

uint64_t _check_afsc_file(int a1)
{
  memset(&v3, 0, sizeof(v3));
  if ((fstat(a1, &v3) & 0x80000000) == 0)
  {
    if ((v3.st_flags & 0x40000020) != 0x20 || (unint64_t)(fpfs_fget_decmpf_type(a1, 0) - 2147483649) < 2) {
      return 0;
    }
    *__error() = 45;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sim_fset_dataless_cmpfs_xattr(int a1, int a2, unint64_t a3, unint64_t a4)
{
  return _fset_dataless_cmpfs_xattr(a1, a2, a3, a4, 0);
}

uint64_t _fset_dataless_cmpfs_xattr(int a1, int a2, unint64_t a3, unint64_t a4, int a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((_check_afsc_file(a1) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  bzero(v17, 0xEDAuLL);
  if (fpfs_supports_purge_reasons()) {
    int v10 = 6;
  }
  else {
    int v10 = 2;
  }
  switch(a2)
  {
    case 1:
      int v11 = -2147483647;
      break;
    case 3:
      a3 = a3 & 0xFFFFFFFFFFLL | ((unint64_t)a4 << 40);
      int v11 = -2147483646;
      break;
    case 2:
      int v11 = -2147483647;
      a3 = a4;
      break;
    default:
      *__error() = 22;
      uint64_t v13 = -1;
      goto LABEL_14;
  }
  v17[0] = 1668116582;
  v17[1] = v11;
  unint64_t v18 = a3;
  int v19 = v10;
  uint64_t v13 = 20;
LABEL_14:
  _get_current_user_uuid((_DWORD *)((char *)v17 + v13));
  uint64_t v14 = v13 + 16;
  int v15 = fpfs_supports_purge_reasons();
  if (a5)
  {
    if (v15)
    {
      *(_DWORD *)((char *)v17 + v14) = a5;
      uint64_t v14 = v13 + 20;
    }
  }
  v16[0] = v17;
  v16[1] = v14;
  return ffsctl(a1, 0x80104A39uLL, v16, 0);
}

uint64_t fpfs_set_dataless_cmpfs_xattr(int a1, uint64_t a2)
{
  return _fset_dataless_cmpfs_xattr_only(a1, *(_DWORD *)a2, *(void *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208));
}

uint64_t fpfs_set_dataless_cmpfs_attrs(int a1, uint64_t a2)
{
  return _fset_dataless_cmpfs_xattr(a1, *(_DWORD *)a2, *(void *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208));
}

BOOL fpfs_is_type_purgeable(int a1)
{
  return ((a1 - 1) & 0xFFFFFFFD) == 0;
}

uint64_t fpfs_update_purgency(int a1, uint64_t a2)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  if (ffsctl(a1, 0x40304A6DuLL, &v8, 0) < 0)
  {
    int v5 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      fpfs_update_purgency_cold_1();
    }

    return 0xFFFFFFFFLL;
  }
  if ((BYTE1(v8) & 1) == 0)
  {
    ssize_t v4 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      fpfs_update_purgency_cold_2(v4);
    }

    *__error() = 45;
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = a2 | 0x10104;
  if (DWORD2(v9)) {
    uint64_t v7 = a2 | 0x10104 | (*((void *)&v9 + 1) << 32) | 0x20000;
  }
  v11[0] = v7;
  v11[1] = v10;
  id v11[2] = 0;
  return ffsctl(a1, 0xC0184A4FuLL, v11, 0);
}

uint64_t fpfs_set_evictable(int a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 40);
  if (((v3 - 1) & 0xFFFFFFFD) != 0) {
    return 0;
  }
  if ((_fset_dataless_cmpfs_xattr_only(a1, v3, *(void *)(a2 + 56), *(unsigned int *)(a2 + 144), 0) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if ((*(unsigned char *)(a2 + 44) & 0x20) == 0 || (uint64_t v6 = *(void *)(a2 + 240)) == 0)
  {
    uid_t v12 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      fpfs_set_evictable_cold_1();
    }

    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(unsigned int *)(a2 + 20);
  uint64_t v8 = v6 | 0x10104;
  uint64_t v9 = v8 | (v7 << 32) | 0x20000;
  BOOL v10 = v7 == 0;
  uint64_t v11 = *(void *)(a2 + 160);
  if (!v10) {
    uint64_t v8 = v9;
  }
  v13[0] = v8;
  v13[1] = v11;
  v13[2] = 0;
  return ffsctl(a1, 0xC0184A4FuLL, v13, 0);
}

uint64_t fpfs_unset_evictable(int a1, uint64_t a2)
{
  if (a2)
  {
    if ((*(unsigned char *)(a2 + 44) & 1) != 0 && *(_DWORD *)(a2 + 40) == 1) {
      char v4 = fpfs_supports_partial_materialization();
    }
    else {
      char v4 = 0;
    }
    if (((*(_DWORD *)(a2 + 40) - 1) & 0xFFFFFFFD) != 0) {
      return 0;
    }
    uint64_t v6 = 0;
    if (ffsctl(a1, 0xC0084A44uLL, &v6, 0) < 0) {
      return 0xFFFFFFFFLL;
    }
    if (v4) {
      return 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (ffsctl(a1, 0xC0084A44uLL, &v6, 0) < 0) {
      return 0xFFFFFFFFLL;
    }
  }
  if ((_unset_dataless_cmpfs_xattr(a1) & 0x80000000) == 0) {
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t _unset_dataless_cmpfs_xattr(int a1)
{
  if (fpfs_fremovexattr(a1, "com.apple.decmpfs", 32) && *__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t fpfs_get_purgeable_info(int a1, void *a2, void *a3)
{
  long long v8 = 0u;
  memset(v7, 0, sizeof(v7));
  if (ffsctl(a1, 0x40304A6DuLL, v7, 0) < 0)
  {
    uint64_t v6 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      fpfs_update_purgency_cold_1();
    }

    return 0xFFFFFFFFLL;
  }
  else
  {
    if (a2) {
      *a2 = *(void *)&v7[0];
    }
    uint64_t result = 0;
    if (a3) {
      *a3 = v8;
    }
  }
  return result;
}

uint64_t fpfs_get_purgeable_stats(char *a1, _OWORD *a2)
{
  unint64_t v3 = 0;
  v28[10] = *MEMORY[0x1E4F143B8];
  *a2 = 0u;
  uint64_t v26 = 512;
  long long v27 = a2;
  a2[3] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  v28[0] = a2 + 2;
  v28[1] = 1024;
  char v4 = (void **)v28;
  v28[2] = (char *)a2 + 8;
  v28[3] = (char *)a2 + 40;
  void v28[4] = 2048;
  v28[5] = a2 + 1;
  v28[6] = a2 + 3;
  v28[7] = 0x8000;
  int v5 = 1;
  v28[8] = (char *)a2 + 24;
  v28[9] = (char *)a2 + 56;
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v4 - 2);
    uint64_t v7 = *(v4 - 1);
    long long v8 = *v4;
    uint64_t v25 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    v11[0] = 4;
    v11[1] = v6;
    if (fsctl(a1, 0xC0E84A70uLL, v11, 1u) < 0) {
      break;
    }
    *v7 += v19;
    *v8 += *((void *)&v12 + 1);
LABEL_5:
    v4 += 3;
    int v5 = v3++ < 3;
    if (v3 == 4)
    {
      int v5 = 0;
      return (v5 << 31 >> 31);
    }
  }
  if (*__error() == 1) {
    goto LABEL_5;
  }
  uint64_t v9 = fpfs_current_or_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    fpfs_get_purgeable_stats_cold_1(v6, v9);
  }

  return (v5 << 31 >> 31);
}

uint64_t fpfs_t_unset_evictable_at(uint64_t a1, char *a2)
{
  return fpfs_openat(a1, a2, 0x200000u, 0, 0, (uint64_t)&__block_literal_global_23);
}

uint64_t __fpfs_t_unset_evictable_at_block_invoke(int a1, int a2)
{
  uint64_t v3 = 0;
  return ffsctl(a2, 0xC0084A44uLL, &v3, 0);
}

uint64_t fpfs_set_purgeable_non_evictable(int a1, uint64_t a2)
{
  uint64_t v2 = 66053;
  if (a2) {
    uint64_t v2 = a2;
  }
  uint64_t v4 = v2;
  return ffsctl(a1, 0xC0084A44uLL, &v4, 0);
}

uint64_t fpfs_t_set_purgeable_non_evictable_at(uint64_t a1, char *a2)
{
  return fpfs_openat(a1, a2, 0x208000u, 0, 0, (uint64_t)&__block_literal_global_3_0);
}

uint64_t __fpfs_t_set_purgeable_non_evictable_at_block_invoke(int a1, int a2)
{
  uint64_t v3 = 66059;
  return ffsctl(a2, 0xC0084A44uLL, &v3, 0);
}

uint64_t fpfs_t_is_evictable(int a1, BOOL *a2)
{
  uint64_t v4 = 0;
  if (a2)
  {
    if ((fpfs_eviction_urgency(a1, &v4) & 0x80000000) == 0)
    {
      uint64_t result = 0;
      *a2 = v4 != 0;
      return result;
    }
  }
  else
  {
    *__error() = 22;
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_eviction_urgency(int a1, uint64_t *a2)
{
  if (!a2)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  if (fpfs_operation_is_allowed(1))
  {
    uint64_t v5 = 0;
    if ((ffsctl(a1, 0x40084A47uLL, &v5, 0) & 0x80000000) == 0)
    {
      uint64_t result = 0;
      *a2 = v5 & ((int)(v5 << 23) >> 31) & 0x8E00;
      return result;
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 = 0;
  return result;
}

uint64_t fpfs_eviction_reason(int a1, _DWORD *a2)
{
  if (fpfs_supports_purge_reasons())
  {
    if (!a2) {
      goto LABEL_5;
    }
    memset(&v5, 0, sizeof(v5));
    if (fstat(a1, &v5) < 0) {
      return 0xFFFFFFFFLL;
    }
    if ((v5.st_flags & 0x40000000) == 0)
    {
LABEL_5:
      *__error() = 22;
      return 0xFFFFFFFFLL;
    }
    return fpfs_eviction_reason_from_xattr(a1, a2);
  }
  else
  {
    uint64_t result = 0;
    *a2 = 0;
  }
  return result;
}

uint64_t fpfs_eviction_reason_from_xattr(int a1, _DWORD *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  bzero(value, 0xEDAuLL);
  ssize_t v4 = fgetxattr(a1, "com.apple.decmpfs", value, 0xEDAuLL, 0, 32);
  if ((v4 & 0x8000000000000000) == 0) {
    return fpfs_parse_cmpfs_xattr((uint64_t)value, v4, 0, a2);
  }
  if (*__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a2 = 0;
  return result;
}

uint64_t fpfs_unset_dataless_cmpfs_attrs(int a1, long long *a2)
{
  LODWORD(v7) = 0;
  if (ffsctl(a1, 0x80044A7AuLL, &v7, 0) < 0)
  {
    if (*__error() == 1 || *__error() == 25)
    {
      if ((fpfs_fchflags(a1, 0x20u, 0) & 0x80000000) == 0) {
        goto LABEL_5;
      }
      stat v5 = fpfs_current_or_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        fpfs_unset_dataless_cmpfs_attrs_cold_1();
      }
    }
    else
    {
      stat v5 = fpfs_current_or_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        fpfs_unset_dataless_cmpfs_attrs_cold_2();
      }
    }

    return 0xFFFFFFFFLL;
  }
LABEL_5:
  if (!a2) {
    return _unset_dataless_cmpfs_xattr(a1);
  }
  uint64_t v8 = 0;
  long long v6 = *a2;
  long long v7 = xmmword_1A34E48B0;
  if ((fsetattrlist(a1, &v7, &v6, 0x10uLL, 0) & 0x80000000) == 0) {
    return _unset_dataless_cmpfs_xattr(a1);
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_create_dataless_fault_at(uint64_t a1, char *a2, _DWORD *a3, int a4, void *a5)
{
  id v9 = a5;
  BOOL v10 = v9;
  switch(*a3)
  {
    case 0:
    case 4:
      *__error() = 22;
      uint64_t v11 = 0xFFFFFFFFLL;
      goto LABEL_7;
    case 1:
      char v12 = 0;
      uint64_t v13 = 384;
      unsigned int v14 = 2562;
      goto LABEL_6;
    case 2:
    case 3:
      char v12 = 1;
      uint64_t v13 = 448;
      unsigned int v14 = 2048;
      goto LABEL_6;
    default:
      unsigned int v14 = 0;
      uint64_t v13 = 0;
      char v12 = 0;
LABEL_6:
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __fpfs_create_dataless_fault_at_block_invoke;
      v16[3] = &unk_1E5AF34A0;
      int v19 = a4;
      long long v18 = a3;
      id v17 = v9;
      uint64_t v11 = fpfs_openat(a1, a2, v14, v13, v12, (uint64_t)v16);

LABEL_7:
      return v11;
  }
}

uint64_t __fpfs_create_dataless_fault_at_block_invoke(uint64_t a1, int a2)
{
  int v10 = 0;
  int v4 = fpfs_supports_purge_reasons();
  if ((a2 & 0x80000000) == 0 && v4 && (fpfs_eviction_reason_from_xattr(a2, &v10) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  int v5 = *(_DWORD *)(a1 + 48);
  if ((v5 & 0x80000000) == 0 && fcopyfile(v5, a2, 0, 4u) < 0) {
    return 0xFFFFFFFFLL;
  }
  if ((_fset_dataless_cmpfs_xattr(a2, **(_DWORD **)(a1 + 40), *(void *)(*(void *)(a1 + 40) + 16), *(unsigned int *)(*(void *)(a1 + 40) + 104), v10) & 0x80000000) != 0)return 0xFFFFFFFFLL; {
  uint64_t v6 = *(void *)(a1 + 40);
  }
  int v7 = *(_DWORD *)(v6 + 4);
  if ((v7 & 1) == 0) {
    __fpfs_create_dataless_fault_at_block_invoke_cold_1();
  }
  if ((v7 & 0x100) != 0) {
    uint64_t v8 = 0x1FBF38F07;
  }
  else {
    uint64_t v8 = 0x1EBF38F07;
  }
  return fpfs_fset_metadata(a2, v6, 0, v8);
}

uint64_t fpfs_update_dataless_fault(int a1, uint64_t a2, uint64_t a3)
{
  if ((fpfs_fset_metadata(a1, a2, 0, a3) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return ((int)_fset_dataless_cmpfs_xattr_only(a1, *(_DWORD *)a2, *(void *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208)) >> 31);
  }
}

uint64_t fpfs_update_dataless_fault_at(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __fpfs_update_dataless_fault_at_block_invoke;
  void v13[3] = &unk_1E5AF34C8;
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  id v14 = v9;
  id v10 = v9;
  uint64_t v11 = fpfs_openat(a1, a2, 0, 0, 0, (uint64_t)v13);

  return v11;
}

uint64_t __fpfs_update_dataless_fault_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_update_dataless_fault(a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t fpfs_femptydir(int a1, uint64_t a2, int a3, void *a4)
{
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __fpfs_femptydir_block_invoke;
  void v11[3] = &unk_1E5AF34F0;
  int v14 = a1;
  int v15 = a3;
  id v12 = v7;
  uint64_t v13 = a2;
  id v8 = v7;
  uint64_t v9 = fpfs_fopendir(a1, (uint64_t)v11);

  return v9;
}

uint64_t __fpfs_femptydir_block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*a2 == *(void *)(a1 + 40)) {
    return 0;
  }
  uint64_t v15 = 0;
  long long v14 = xmmword_1A34E48C8;
  memset(v21, 0, sizeof(v21));
  int v5 = (char *)a2 + 21;
  if (getattrlistat(*(_DWORD *)(a1 + 48), (const char *)a2 + 21, &v14, v21, 0x34uLL, 0x21uLL)) {
    return 0xFFFFFFFFLL;
  }
  if (*a2 != *(void *)&v21[44])
  {
    *__error() = 70;
    uint64_t v6 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = *(_DWORD *)(a1 + 48);
      int v12 = *(_DWORD *)(a1 + 52);
      uint64_t v13 = *a2;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&uint8_t buf[4] = v11;
      LOWORD(v17) = 1024;
      *(_DWORD *)((char *)&v17 + 2) = v12;
      HIWORD(v17) = 2048;
      uint64_t v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = *(void *)&v21[44];
      _os_log_error_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_ERROR, "ESTALE: item changed between enumeration and lookup [%d, %u, %llu, %llu]", buf, 0x22u);
    }

    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 52) != 2)
  {
    *(void *)buf = 0;
    uint64_t v17 = 0;
    fpfs_finder_info_deserialize((uint64_t)&v21[4], (uint64_t)buf);
    int v7 = !fpfs_path_is_safe_save_temp_file(v5, *((unsigned __int8 *)a2 + 20) == 8);
    if ((v7 & 1) == 0 && *(_DWORD *)&v21[40])
    {
      int v8 = *((unsigned __int8 *)a2 + 20);
      if (v8 == 8)
      {
        int v7 = 1;
      }
      else
      {
        BOOL v9 = v8 == 4;
        int v7 = (buf[0] >> 1) & 1;
        if (!v9) {
          int v7 = 0;
        }
      }
    }
    int v10 = *(_DWORD *)(a1 + 52);
    if (v10 || !v7)
    {
      if (!v10) {
        LOBYTE(v7) = 0;
      }
      if ((v7 & 1) == 0) {
        goto LABEL_23;
      }
    }
    else if (v21[39] & 0x40) != 0 || *((unsigned char *)a2 + 20) == 10 || (buf[0])
    {
      goto LABEL_23;
    }
    goto LABEL_28;
  }
  if (strcmp(v5, ".localized") && strcmp(v5, ".DS_Store"))
  {
LABEL_28:
    *__error() = 66;
    return 0xFFFFFFFFLL;
  }
LABEL_23:
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t *, char *))(result + 16))(result, *(unsigned int *)(a1 + 48), a2, v5);
  }
  return result;
}

void _fpfs_remove_sharing_xattrs(int a1)
{
  if ((fpfs_fset_collaboration_identifier(a1, 0) & 0x80000000) != 0)
  {
    uint64_t v2 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      _fpfs_remove_sharing_xattrs_cold_4();
    }
  }
  if ((fpfs_fset_is_shared(a1, 0) & 0x80000000) != 0)
  {
    uint64_t v3 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _fpfs_remove_sharing_xattrs_cold_3();
    }
  }
  if ((fpfs_fset_is_shared_by_current_user(a1, 0) & 0x80000000) != 0)
  {
    int v4 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      _fpfs_remove_sharing_xattrs_cold_2();
    }
  }
  if ((fpfs_fset_owner_name(a1, 0) & 0x80000000) != 0)
  {
    int v5 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      _fpfs_remove_sharing_xattrs_cold_1();
    }
  }
}

uint64_t fpfs_recursive_prune_fault(char *a1, int a2)
{
  value[0] = 0;
  memset(&v9, 0, sizeof(v9));
  int v8 = 0;
  if ((lstat(a1, &v9) & 0x80000000) == 0)
  {
    LODWORD(value[0]) = a2;
    value[1] = v9.st_ino;
    int v4 = removefile_state_alloc();
    removefile_state_set(v4, 1u, _fpfs_prune_fault_confirm);
    removefile_state_set(v4, 2u, value);
    removefile_state_set(v4, 3u, _fpfs_prune_fault_error);
    removefile_state_set(v4, 6u, _fpfs_prune_fault_status);
    removefile_state_set(v4, 4u, &v8);
    int v5 = removefile(a1, v4, 0x101u);
    removefile_state_free(v4);
    if ((v5 & 0x80000000) == 0)
    {
      fpfs_set_syncroot_at(4294967294, a1, 0);
      return 0;
    }
    int v7 = v8;
    *__error() = v7;
  }
  return 0xFFFFFFFFLL;
}

uint64_t _fpfs_prune_fault_confirm(uint64_t a1, char *a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = ___fpfs_prune_fault_confirm_block_invoke;
  v4[3] = &__block_descriptor_40_e8_i12__0i8l;
  void v4[4] = a3;
  return fpfs_open(a2, 0x200000u, 0, 0, (uint64_t)v4) >> 31;
}

uint64_t _fpfs_prune_fault_error(_removefile_state *a1, uint64_t a2)
{
  int dst = 0;
  removefile_state_get(a1, 5u, &dst);
  uint64_t v3 = fpfs_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    _fpfs_prune_fault_error_cold_1(a2, &dst, v3);
  }

  return 1;
}

uint64_t _fpfs_prune_fault_status(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = fpfs_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    _fpfs_prune_fault_status_cold_1(a2, v3);
  }

  return 0;
}

uint64_t fpfs_lp_unlinkat(int a1, const char *a2, int a3)
{
  uint64_t v6 = unlinkat(a1, a2, a3);
  if ((v6 & 0x80000000) != 0 && *__error() == 63)
  {
    if (fpfs_supports_long_paths())
    {
      int v11 = 0;
      uint64_t v7 = fpfs_openat_longparent(a1, a2, &v11);
      uint64_t v6 = v7;
      if ((v7 & 0x80000000) == 0)
      {
        uint64_t v8 = unlinkat(v7, v11, a3);
        int v9 = *__error();
        close(v6);
        *__error() = v9;
        return v8;
      }
    }
  }
  return v6;
}

uint64_t fpfs_recursive_unlinkat(int a1, const char *a2, int a3, int a4)
{
  if (a3) {
    int v6 = 128;
  }
  else {
    int v6 = 0;
  }
  if (a4) {
    int v7 = v6 | 0x1000;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = fpfs_unlinkat(a1, a2, v7);
  if (v8 && (*__error() == 66 || *__error() == 1))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __fpfs_recursive_unlinkat_block_invoke;
    v10[3] = &__block_descriptor_44_e5_i8__0l;
    void v10[4] = a2;
    int v11 = v7;
    return fpfs_fchdir(a1, (uint64_t)v10);
  }
  return v8;
}

uint64_t fpfs_unlinkat(int a1, const char *a2, __int16 a3)
{
  if ((a3 & 0x1000) != 0)
  {
    v6[5] = v3;
    v6[6] = v4;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _OWORD v6[2] = __fpfs_delete_at_block_invoke;
    v6[3] = &__block_descriptor_40_e5_i8__0l;
    void v6[4] = a2;
    return fpfs_fchdir(a1, (uint64_t)v6);
  }
  else
  {
    return fpfs_lp_unlinkat(a1, a2, a3);
  }
}

uint64_t __fpfs_recursive_unlinkat_block_invoke(uint64_t a1)
{
  void v12[2] = *(char **)MEMORY[0x1E4F143B8];
  v12[0] = *(char **)(a1 + 32);
  v12[1] = 0;
  uint64_t v2 = fts_open(v12, 2132, 0);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = v2;
  do
  {
    uint64_t v4 = fts_read(v3);
    uint64_t v5 = 0;
    if (!v4) {
      break;
    }
    switch(v4->fts_info)
    {
      case 2u:
        int fts_errno = 62;
        goto LABEL_15;
      case 3u:
      case 0xCu:
      case 0xDu:
        uint64_t v6 = fpfs_lp_unlinkat(-2, v4->fts_path, 0);
        goto LABEL_9;
      case 4u:
      case 7u:
      case 0xAu:
        int fts_errno = v4->fts_errno;
LABEL_15:
        *__error() = fts_errno;
        uint64_t v5 = 0xFFFFFFFFLL;
        goto LABEL_16;
      case 6u:
        fts_path = v4->fts_path;
        unsigned int v8 = *(_DWORD *)(a1 + 40) & 0xFFFFEFFF;
        goto LABEL_8;
      case 8u:
        fts_path = v4->fts_path;
        unsigned int v8 = *(_DWORD *)(a1 + 40) & 0xFFFFFF7F;
LABEL_8:
        uint64_t v6 = fpfs_unlinkat(-2, fts_path, v8);
LABEL_9:
        uint64_t v5 = v6;
        break;
      default:
        break;
    }
  }
  while (!v5);
LABEL_16:
  int v10 = *__error();
  fts_close(v3);
  *__error() = v10;
  return v5;
}

uint64_t _materialize_full(int a1, uint64_t a2, uint64_t a3)
{
  if (ftruncate(a2, 0) < 0) {
    return 0xFFFFFFFFLL;
  }
  if (a3) {
    return fcntl(a1, 69, a2);
  }
  return 0;
}

uint64_t fpfs_materialize(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, void *a9)
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v59 = a9;
  BOOL v18 = a2[2] < 1 || a5 < 0;
  BOOL v84 = v18;
  memset(&v73, 0, sizeof(v73));
  if (fstat(a1, &v73) < 0 || (_validate_file_types(v73.st_mode, *(_DWORD *)a2) & 0x80000000) != 0) {
    goto LABEL_46;
  }
  if ((v73.st_flags & 0x40000000) == 0)
  {
    if ((*((unsigned char *)a2 + 4) & 0x20) == 0
      && (_unset_dataless_cmpfs_xattr(a1) & 0x80000000) != 0
      && *__error() != 93
      && (*(_DWORD *)a2 != 2 || *__error() != 21))
    {
      goto LABEL_46;
    }
    __int16 v19 = __error();
    int v20 = 37;
    goto LABEL_45;
  }
  if ((a4 & 0x80000000) == 0)
  {
    int v21 = *(_DWORD *)a2;
    memset(&v73, 0, sizeof(v73));
    if (fstat(a4, &v73) < 0 || (_validate_file_types(v73.st_mode, v21) & 0x80000000) != 0) {
      goto LABEL_46;
    }
  }
  switch(*(_DWORD *)a2)
  {
    case 0:
    case 4:
      goto LABEL_44;
    case 1:
      int value = (void *)fcntl(a4, 63);
      uint64_t v23 = fcntl(a1, 63);
      if ((int)v23 < (int)value || !value && v23)
      {
        if ((fcntl(a4, 64, v23) & 0x80000000) == 0) {
          goto LABEL_26;
        }
        int v51 = *__error();
        long long v52 = fpfs_current_or_default_log();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          fpfs_materialize_cold_1();
        }
LABEL_81:

        long long v53 = __error();
        goto LABEL_86;
      }
      if (((int)value < (int)v23 || !v23 && value) && fcntl(a1, 64, value) < 0)
      {
        int v51 = *__error();
        long long v52 = fpfs_current_or_default_log();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          fpfs_materialize_cold_2();
        }
        goto LABEL_81;
      }
LABEL_26:
      ssize_t v56 = fgetxattr(a4, "com.apple.ResourceFork", 0, 0, 0, 0);
      if (v56 < 0)
      {
        if (*__error() != 93) {
          goto LABEL_46;
        }
LABEL_83:
        if (v18) {
          int v22 = _materialize_full(a4, a1, a2[2]);
        }
        else {
          int v22 = _materialize_partial(a4, a1, a5, a6, a7, &v84);
        }
LABEL_20:
        if (v22 < 0) {
          goto LABEL_46;
        }
LABEL_48:
        uint64_t v80 = 0;
        v81 = &v80;
        uint64_t v82 = 0x2020000000;
        int v83 = 0;
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __fpfs_materialize_block_invoke;
        v79[3] = &unk_1E5AF3538;
        v79[4] = &v80;
        v79[5] = a8;
        fpfs_fgethandle(a1, v79);
        BOOL v31 = v84;
        if (v84) {
          a3 |= 0x20000uLL;
        }
        long long v32 = *((_OWORD *)a2 + 11);
        long long v75 = *((_OWORD *)a2 + 10);
        long long v76 = v32;
        long long v33 = *((_OWORD *)a2 + 13);
        long long v77 = *((_OWORD *)a2 + 12);
        long long v78 = v33;
        long long v34 = *((_OWORD *)a2 + 7);
        *(_OWORD *)&v73.st_size_t size = *((_OWORD *)a2 + 6);
        *(_OWORD *)&v73.st_blksize_t size = v34;
        long long v35 = *((_OWORD *)a2 + 9);
        *(_OWORD *)v73.st_qspare = *((_OWORD *)a2 + 8);
        long long v74 = v35;
        timespec v36 = (timespec)*((_OWORD *)a2 + 3);
        v73.st_atimespec = (timespec)*((_OWORD *)a2 + 2);
        v73.st_mtimespec = v36;
        timespec v37 = (timespec)*((_OWORD *)a2 + 5);
        v73.st_ctimespec = (timespec)*((_OWORD *)a2 + 4);
        v73.st_birthtimespec = v37;
        long long v38 = *((_OWORD *)a2 + 1);
        *(_OWORD *)&v73.st_dev = *(_OWORD *)a2;
        *(_OWORD *)&v73.st_uid = v38;
        if (!v84)
        {
          *(_DWORD *)&v73.st_mode |= 1u;
          LODWORD(v60) = 0;
          int v39 = fpfs_supports_purge_reasons() ^ 1;
          if ((int)a1 < 0) {
            LOBYTE(v39) = 1;
          }
          if ((v39 & 1) == 0 && (fpfs_eviction_reason_from_xattr(a1, &v60) & 0x80000000) != 0) {
            goto LABEL_71;
          }
          LODWORD(v78) = v60;
        }
        if ((fpfs_fset_metadata(a1, (uint64_t)&v73, *((_DWORD *)v81 + 6), a3) & 0x80000000) == 0
          && (!v31
           || (*((unsigned char *)a2 + 4) & 0x20) != 0
           || (_unset_dataless_cmpfs_xattr(a1) & 0x80000000) == 0
           || *__error() == 93))
        {
          if ((fpfs_supports_parent_mtime_iopolicy() & 1) == 0 && *(_DWORD *)a2 == 3)
          {
            long long v40 = *((_OWORD *)a2 + 11);
            long long v69 = *((_OWORD *)a2 + 10);
            long long v70 = v40;
            long long v41 = *((_OWORD *)a2 + 13);
            long long v71 = *((_OWORD *)a2 + 12);
            long long v72 = v41;
            long long v42 = *((_OWORD *)a2 + 7);
            long long v65 = *((_OWORD *)a2 + 6);
            long long v66 = v42;
            long long v43 = *((_OWORD *)a2 + 9);
            long long v67 = *((_OWORD *)a2 + 8);
            long long v68 = v43;
            long long v44 = *((_OWORD *)a2 + 3);
            *(_OWORD *)uint64_t v62 = *((_OWORD *)a2 + 2);
            *(_OWORD *)&v62[16] = v44;
            long long v45 = *((_OWORD *)a2 + 5);
            long long v63 = *((_OWORD *)a2 + 4);
            long long v64 = v45;
            long long v46 = *((_OWORD *)a2 + 1);
            long long v60 = *(_OWORD *)a2;
            long long v61 = v46;
            clock_gettime(_CLOCK_REALTIME, (timespec *)&v62[8]);
            if ((fpfs_fset_metadata(a1, (uint64_t)&v60, 0, 2) & 0x80000000) != 0)
            {
              long long v47 = fpfs_current_or_default_log();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                int v48 = *(_DWORD *)(a8 + 16);
                uint64_t v49 = __error();
                long long v50 = strerror(*v49);
                *(_DWORD *)buf = 67109378;
                int v86 = v48;
                __int16 v87 = 2080;
                uint64_t v88 = v50;
                _os_log_impl(&dword_1A33AE000, v47, OS_LOG_TYPE_INFO, "Unable to bump mtime at pkg root for docID(%u) after materialization (ignoring): %s", buf, 0x12u);
              }
            }
          }
          uint64_t v29 = 0;
          goto LABEL_72;
        }
LABEL_71:
        uint64_t v29 = 0xFFFFFFFFLL;
LABEL_72:
        _Block_object_dispose(&v80, 8);
        goto LABEL_47;
      }
      if (fremovexattr(a1, "com.apple.ResourceFork", 32) < 0 && *__error() != 93) {
        goto LABEL_46;
      }
      if (v56 >= 0x1000) {
        size_t v24 = 4096;
      }
      else {
        size_t v24 = v56;
      }
      size_t size = v24;
      valuea = malloc_type_malloc(v24, 0x1AB61AF4uLL);
      if (valuea)
      {
        if (v56)
        {
          ssize_t v25 = fgetxattr(a4, "com.apple.ResourceFork", valuea, size, 0, 0);
          if ((v25 & 0x8000000000000000) == 0)
          {
            u_int32_t v26 = 0;
            do
            {
              int v55 = v25;
              if (fsetxattr(a1, "com.apple.ResourceFork", valuea, v25, v26, 0) < 0) {
                goto LABEL_85;
              }
              v26 += v55;
              unsigned int v27 = v56 - v26;
              if (v56 <= v26) {
                break;
              }
              size_t v28 = v27 >= size ? size : v27;
              ssize_t v25 = fgetxattr(a4, "com.apple.ResourceFork", valuea, v28, v26, 0);
            }
            while ((v25 & 0x8000000000000000) == 0);
            free(valuea);
            goto LABEL_83;
          }
        }
LABEL_85:
        free(valuea);
        int v51 = *__error();
        fremovexattr(a1, "com.apple.ResourceFork", 32);
        long long v53 = __error();
LABEL_86:
        *long long v53 = v51;
        goto LABEL_46;
      }
      __int16 v19 = __error();
      int v20 = 12;
LABEL_45:
      *__int16 v19 = v20;
LABEL_46:
      uint64_t v29 = 0xFFFFFFFFLL;
LABEL_47:

      return v29;
    case 2:
      if ((a4 & 0x80000000) != 0) {
        goto LABEL_48;
      }
LABEL_44:
      __int16 v19 = __error();
      int v20 = 22;
      goto LABEL_45;
    case 3:
      *(void *)&long long v60 = MEMORY[0x1E4F143A8];
      *((void *)&v60 + 1) = 3221225472;
      *(void *)&long long v61 = ___femptypkg_block_invoke;
      *((void *)&v61 + 1) = &__block_descriptor_36_e29_i16__0__dirent_QQSSC_1024c__8l;
      *(_DWORD *)uint64_t v62 = a1;
      if ((fpfs_fopendir(a1, (uint64_t)&v60) & 0x80000000) != 0) {
        goto LABEL_46;
      }
      *(void *)&v73.st_dev = MEMORY[0x1E4F143A8];
      v73.st_ino = 3221225472;
      *(void *)&v73.st_uid = ___transfer_dir_contents_block_invoke;
      *(void *)&v73.st_rdev = &__block_descriptor_40_e29_i16__0__dirent_QQSSC_1024c__8l;
      v73.st_atimespec.tv_sec = __PAIR64__(a1, a4);
      int v22 = fpfs_fopendir(a4, (uint64_t)&v73);
      goto LABEL_20;
    default:
      goto LABEL_48;
  }
}

void sub_1A3457A5C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

uint64_t _materialize_partial(unsigned int a1, int a2, uint64_t a3, uint64_t a4, int a5, unsigned char *a6)
{
  if (a3 < 0 || a4 <= 0)
  {
    int v9 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
LABEL_8:
    }
      _materialize_partial_cold_1();
LABEL_9:

LABEL_10:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = a3 + a4;
  if (__OFADD__(a3, a4))
  {
    int v9 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  long long v21 = xmmword_1A34E48E0;
  uint64_t v22 = 512;
  DWORD2(v24) = 0;
  *(void *)&long long v24 = 0;
  if (fgetattrlist(a1, &v21, &v24, 0xCuLL, 0) < 0) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = *(void *)((char *)&v24 + 4);
  }
  if (v15 < 0) {
    return 0xFFFFFFFFLL;
  }
  if (v8 > v15)
  {
    uint64_t v16 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      _materialize_partial_cold_3();
    }
LABEL_31:

    goto LABEL_10;
  }
  if (v15 != v8)
  {
    uint64_t v16 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      _materialize_partial_cold_5();
    }
    goto LABEL_31;
  }
  *(void *)&long long v24 = 0;
  *((void *)&v24 + 1) = a3;
  uint64_t v25 = a4;
  if (fcntl(a2, 99, &v24) < 0) {
    return 0xFFFFFFFFLL;
  }
  *((void *)&v21 + 1) = a3;
  *(void *)&long long v21 = a1;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  if (ffsctl(a2, 0x80204A4CuLL, &v21, 0) < 0)
  {
    int v20 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      _materialize_partial_cold_4(v20);
    }

    return 0xFFFFFFFFLL;
  }
  uint64_t v17 = fgetsize(a2);
  if (v17 < 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v18 = v17;
  off_t v19 = lseek(a2, 0, 3);
  if (v19 < 0) {
    return 0xFFFFFFFFLL;
  }
  if (v19 == v18 || !a3 && a5 && a4 == v18)
  {
    uint64_t result = 0;
    *a6 = 1;
  }
  else
  {
    uint64_t result = 0;
    *a6 = 0;
  }
  return result;
}

uint64_t __fpfs_materialize_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(_DWORD *)(a2 + 20);
  if (v2)
  {
    void *v2 = *(void *)a2;
    v2[2] = *(void *)(a2 + 16);
  }
  return 0;
}

uint64_t fpfs_revoke_children(int a1, uint64_t *a2)
{
  uint64_t v4 = 1;
  if (ffsctl(a1, 0xC0084A5EuLL, &v4, 0) < 0) {
    return 0xFFFFFFFFLL;
  }
  if (v4)
  {
    if (a2) {
      *a2 = v4;
    }
    *__error() = 16;
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t fpfs_evict(int a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  long long v14 = v13;
  uint64_t v36 = -1;
  if (!a4) {
    a4 = &v36;
  }
  if (((*(_DWORD *)a2 - 1) & 0xFFFFFFFD) != 0)
  {
    if (*(_DWORD *)a2 == 2)
    {
      id v15 = v13;
      memset(&v41, 0, sizeof(v41));
      if ((fstat(a1, &v41) & 0x80000000) == 0)
      {
        __uint32_t st_flags = v41.st_flags;
        if ((v41.st_flags & 0x40000000) != 0
          || (_fset_dataless_cmpfs_xattr(a1, *(_DWORD *)a2, *(void *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208)) & 0x80000000) == 0)
        {
          if ((fpfs_revoke_children(a1, a4) & 0x80000000) == 0 || *a4 == a3)
          {
            uint64_t v49 = 0;
            uint64_t v50 = (uint64_t)&v49;
            uint64_t v51 = 0x2020000000;
            LODWORD(v52) = 0;
            uint64_t v42 = MEMORY[0x1E4F143A8];
            uint64_t v43 = 3221225472;
            long long v44 = __evict_dir_block_invoke;
            long long v45 = &unk_1E5AF35E8;
            int v48 = a1;
            long long v46 = &v49;
            unint64_t v47 = a3;
            fpfs_fopendir(a1, (uint64_t)&v42);
            if (*(int *)(v50 + 24) >= 1)
            {
              bzero(&v41, 0x400uLL);
              int v17 = *__error();
              fpfs_fgetpath(a1, (uint64_t)&v41);
              *__error() = v17;
              uint64_t v18 = fpfs_current_or_default_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                off_t v19 = __error();
                int v20 = strerror(*v19);
                fpfs_evict_cold_5((uint64_t)v20, &buf, (uint64_t)&v41, v18);
              }
            }
            _Block_object_dispose(&v49, 8);
            uint64_t v21 = 0;
            goto LABEL_62;
          }
          if ((st_flags & 0x40000000) == 0)
          {
            int v32 = *__error();
            fpfs_unset_dataless_cmpfs_attrs(a1, (long long *)(a2 + 40));
            *__error() = v32;
          }
        }
      }
      uint64_t v21 = 0xFFFFFFFFLL;
LABEL_62:

      goto LABEL_63;
    }
    id v28 = v13;
    memset(&v41, 0, sizeof(v41));
    if (fstat(a1, &v41) < 0
      || (_fset_dataless_cmpfs_xattr(a1, *(_DWORD *)a2, *(void *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208)) & 0x80000000) != 0)
    {
      goto LABEL_47;
    }
    if ((v41.st_mode & 0xF000) == 0x8000 && v41.st_nlink != 1)
    {
      fpfs_unset_dataless_cmpfs_attrs(a1, (long long *)(a2 + 40));
      uint64_t v29 = __error();
      int v30 = 31;
LABEL_46:
      *uint64_t v29 = v30;
LABEL_47:
      uint64_t v21 = 0xFFFFFFFFLL;
LABEL_48:

      goto LABEL_63;
    }
    if (!a6
      || (uint64_t v42 = MEMORY[0x1E4F143A8],
          uint64_t v43 = 3221225472,
          long long v44 = ___fpfs_evict_legacy_block_invoke,
          long long v45 = &__block_descriptor_48_e34_i16__0__fpfs_item_handle_QQII_iI_8l,
          unint64_t v47 = __PAIR64__(a1, a6),
          long long v46 = (uint64_t *)a5,
          (fpfs_fgethandle(a1, &v42) & 0x80000000) == 0))
    {
      int v31 = *(_DWORD *)a2;
      if (*(_DWORD *)a2 != 3)
      {
        if (v31 == 2)
        {
          if ((fpfs_femptydir(a1, a3, 0, 0) & 0x80000000) != 0
            || (fpfs_femptydir(a1, a3, 0, &__block_literal_global_23_0) & 0x80000000) != 0)
          {
            fpfs_unset_dataless_cmpfs_attrs(a1, (long long *)(a2 + 40));
            uint64_t v29 = __error();
            int v30 = 66;
            goto LABEL_46;
          }
        }
        else
        {
          if (v31 != 1)
          {
            uint64_t v29 = __error();
            int v30 = 45;
            goto LABEL_46;
          }
          if (ftruncate(a1, 0) < 0) {
            goto LABEL_47;
          }
        }
LABEL_69:
        uint64_t v21 = ((int)fpfs_fset_metadata(a1, a2, 0, 3) >> 31);
        goto LABEL_48;
      }
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      uint64_t v51 = (uint64_t)___femptypkg_block_invoke;
      long long v52 = &__block_descriptor_36_e29_i16__0__dirent_QQSSC_1024c__8l;
      int v53 = a1;
      if ((fpfs_fopendir(a1, (uint64_t)&v49) & 0x80000000) == 0) {
        goto LABEL_69;
      }
    }
    int v34 = *__error();
    fpfs_unset_dataless_cmpfs_attrs(a1, (long long *)(a2 + 40));
    *__error() = v34;
    goto LABEL_47;
  }
  char v22 = 0;
  id v35 = v13;
  while (1)
  {
    memset(&v41, 0, 32);
    if (fpfs_supports_purge_reasons()
      && (_fset_dataless_cmpfs_xattr_only(a1, *(_DWORD *)a2, *(void *)(a2 + 16), *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208)) & 0x80000000) != 0)
    {
      int v26 = *__error();
      unsigned int v27 = fpfs_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        fpfs_evict_cold_1(&buf, v40, v27);
      }
      goto LABEL_34;
    }
    if (ffsctl(a1, 0xC0204A5FuLL, &v41, 0) < 0)
    {
      int v26 = *__error();
      unsigned int v27 = fpfs_current_or_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        fpfs_evict_cold_2((uint8_t *)&v42, (char **)((char *)&v42 + 4), v27);
      }
      goto LABEL_34;
    }
    if (*(void *)&v41.st_rdev) {
      goto LABEL_50;
    }
    int64_t v23 = *(void *)(a2 + 16);
    if (v23 < 1) {
      break;
    }
    int v24 = *__error();
    uint64_t v25 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      fpfs_evict_cold_3(&v37, v38, v25);
    }

    *__error() = v24;
    int v26 = 16;
LABEL_35:
    *__error() = v26;
    if (v22 & 1 | (*__error() != 16)) {
      goto LABEL_49;
    }
    if (*(_DWORD *)a2 == 1)
    {
      fpfs_funload_file(a1);
    }
    else
    {
      if (*(_DWORD *)a2 != 3)
      {
LABEL_49:
        uint64_t v21 = 0xFFFFFFFFLL;
        goto LABEL_51;
      }
      fpfs_funload_hierarchy(a1);
    }
    char v22 = 1;
  }
  if (*(_DWORD *)a2 == 1
    && (_fset_dataless_cmpfs_xattr(a1, 1, v23, *(unsigned int *)(a2 + 104), *(_DWORD *)(a2 + 208)) & 0x80000000) != 0)
  {
    int v26 = *__error();
    unsigned int v27 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      fpfs_evict_cold_4((uint8_t *)&v49, (int *)&v49 + 1, v27);
    }
LABEL_34:

    goto LABEL_35;
  }
LABEL_50:
  uint64_t v21 = ((int)fpfs_fset_metadata(a1, a2, 0, a5) >> 31);
LABEL_51:

LABEL_63:
  return v21;
}

void sub_1A3458438(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t fpfs_evict_at(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void *a8)
{
  id v15 = a8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __fpfs_evict_at_block_invoke;
  v19[3] = &unk_1E5AF3560;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  uint64_t v24 = a6;
  int v25 = a7;
  id v20 = v15;
  uint64_t v21 = a3;
  id v16 = v15;
  uint64_t v17 = fpfs_openat(a1, a2, 2u, 0, 2, (uint64_t)v19);

  return v17;
}

uint64_t __fpfs_evict_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_evict(a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(uint64_t **)(a1 + 56), *(void *)(a1 + 64), *(_DWORD *)(a1 + 72), *(void **)(a1 + 32));
}

uint64_t fpfs_is_dataless_fault(int a1, BOOL *a2)
{
  memset(&v4, 0, sizeof(v4));
  if (fstat(a1, &v4) < 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  if (a2) {
    *a2 = (v4.st_flags & 0x40000000) != 0;
  }
  return result;
}

uint64_t fpfs_lp_fstatat(int a1, char *a2, stat *a3, int a4)
{
  uint64_t v7 = fstatat(a1, a2, a3, a4);
  if ((v7 & 0x80000000) != 0 && *__error() == 63 && fpfs_supports_long_paths())
  {
    int v8 = fpfs_openat_longpath(a1, a2, 2129920, 0);
    if ((v8 & 0x80000000) == 0)
    {
      int v9 = v8;
      uint64_t v10 = fstat(v8, a3);
      int v11 = *__error();
      close(v9);
      *__error() = v11;
      return v10;
    }
    return 0xFFFFFFFFLL;
  }
  return v7;
}

uint64_t fpfs_is_dataless_fault_at(int a1, char *a2, BOOL *a3)
{
  memset(&v5, 0, sizeof(v5));
  if ((fpfs_lp_fstatat(a1, a2, &v5, 32) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  if (a3) {
    *a3 = (v5.st_flags & 0x40000000) != 0;
  }
  return result;
}

uint64_t ___get_current_user_uuid_block_invoke()
{
  uid_t v0 = getuid();
  uint64_t result = mbr_uid_to_uuid(v0, (unsigned __int8 *)&_get_current_user_uuid_uuid_cached);
  if ((result & 0x80000000) != 0) {
    abort();
  }
  return result;
}

uint64_t ___fpfs_prune_fault_confirm_block_invoke(uint64_t a1, int a2)
{
  memset(&v8, 0, sizeof(v8));
  if (fstat(a2, &v8) < 0) {
    return 0xFFFFFFFFLL;
  }
  _fpfs_remove_sharing_xattrs(a2);
  int v4 = v8.st_mode & 0xF000;
  if (v4 != 40960)
  {
    __uint32_t st_flags = v8.st_flags;
    if (v4 == 0x4000)
    {
      if (v8.st_ino != *(void *)(*(void *)(a1 + 32) + 8)) {
        fpfs_fset_syncroot(a2, 0);
      }
      if ((st_flags & 0x40000000) != 0) {
        fpfs_unset_dataless_cmpfs_attrs(a2, (long long *)&v8.st_mtimespec.tv_sec);
      }
      return 0;
    }
    if ((v8.st_flags & 0x40000000) == 0)
    {
      if ((**(unsigned char **)(a1 + 32) & 1) == 0) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v7 = 0;
      if (fpfs_eviction_urgency(a2, &v7) || !v7) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  return 0;
}

uint64_t __fpfs_delete_at_block_invoke(uint64_t a1)
{
  return MEMORY[0x1F40C9B70](*(void *)(a1 + 32));
}

uint64_t _validate_file_types(uint64_t result, int a2)
{
  int v2 = 22;
  switch(a2)
  {
    case 0:
      goto LABEL_13;
    case 1:
      if ((result & 0xF000) == 0x4000) {
        goto LABEL_12;
      }
      if ((result & 0xF000) == 0x8000) {
        return 0;
      }
      goto LABEL_11;
    case 2:
    case 3:
      if ((result & 0xF000) == 0x4000) {
        return 0;
      }
      if ((result & 0xF000) == 0x8000) {
        int v2 = 20;
      }
      else {
        int v2 = 79;
      }
      goto LABEL_13;
    case 4:
      if ((result & 0xF000) == 0x4000)
      {
LABEL_12:
        int v2 = 21;
      }
      else
      {
        if ((result & 0xF000) == 0xA000) {
          return 0;
        }
LABEL_11:
        int v2 = 79;
      }
LABEL_13:
      *__error() = v2;
      return 0xFFFFFFFFLL;
    default:
      return result;
  }
}

uint64_t fgetsize(int a1)
{
  long long v3 = xmmword_1A34E48E0;
  uint64_t v4 = 512;
  memset(v2, 0, 12);
  if (fgetattrlist(a1, &v3, v2, 0xCuLL, 0) < 0) {
    return -1;
  }
  else {
    return *(void *)((char *)v2 + 4);
  }
}

uint64_t ___transfer_dir_contents_block_invoke(uint64_t a1, uint64_t a2)
{
  return renameatx_np(*(_DWORD *)(a1 + 32), (const char *)(a2 + 21), *(_DWORD *)(a1 + 36), (const char *)(a2 + 21), 0);
}

uint64_t ___femptypkg_block_invoke(uint64_t a1, uint64_t a2)
{
  return fpfs_recursive_unlinkat(*(_DWORD *)(a1 + 32), (const char *)(a2 + 21), *(unsigned __int8 *)(a2 + 20) == 4, 0);
}

uint64_t __evict_dir_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 != *(void *)(a1 + 40)
    && (fpfs_recursive_unlinkat(*(_DWORD *)(a1 + 48), (const char *)(a2 + 21), *(unsigned __int8 *)(a2 + 20) == 4, 0) & 0x80000000) != 0)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return 0;
}

uint64_t ___fpfs_evict_legacy_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a2 + 20) == *(_DWORD *)(a1 + 40)) {
    return 0;
  }
  *__error() = 70;
  stat v5 = fpfs_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(_DWORD *)(a2 + 20);
    int v9 = *(_DWORD *)(a1 + 40);
    int v8 = *(_DWORD *)(a1 + 44);
    v10[0] = 67109888;
    v10[1] = v8;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 1024;
    int v16 = v9;
    _os_log_error_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_ERROR, "ESTALE: item gen_count changed during _fpfs_evict_legacy [%d, %llu, %u, %u]", (uint8_t *)v10, 0x1Eu);
  }

  return 0xFFFFFFFFLL;
}

uint64_t ___fpfs_evict_legacy_block_invoke_20(uint64_t a1, int a2, uint64_t a3)
{
  return fpfs_recursive_unlinkat(a2, (const char *)(a3 + 21), *(unsigned __int8 *)(a3 + 20) == 4, 0);
}

void OUTLINED_FUNCTION_0_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x14u);
}

void sub_1A34594D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A345A86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A345B270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void sub_1A345C2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A345C8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A345D12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A3460428(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34605E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3462508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A34628B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A3462B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A3462F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A3463600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t QOSClassFromNSQualityOfService(uint64_t result)
{
  if (result > 16)
  {
    if (result == 17 || result == 33 || result == 25) {
      return result;
    }
    return 0;
  }
  if (result == -1) {
    return 21;
  }
  if (result != 9) {
    return 0;
  }
  return result;
}

void sub_1A346479C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_1A3465628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A346574C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A346590C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3468868(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A346892C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34689C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3469264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1A346979C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_1A3469BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _FPCreateFormat(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%@", a2];
}

uint64_t __FPLocalizationBundle_block_invoke()
{
  FPLocalizationBundle_bundle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];

  return MEMORY[0x1F41817F8]();
}

id FPLocv(void *a1, uint64_t a2)
{
  return FPLocvImpl(a1, @"FileProvider", 0, a2);
}

id FPLocalizedErrorStringForKeyLiteral(void *a1, uint64_t a2)
{
  return FPLocvImpl(a1, @"Errors", 1, a2);
}

id FPLocalizedErrorStringForKey(void *a1)
{
  id v1 = a1;
  int v2 = FPLocalizationBundle();
  long long v3 = [v2 localizedStringForKey:v1 value:@"X" table:@"Errors"];

  if ([v3 isEqualToString:@"X"])
  {
    if (([v1 hasSuffix:@"-C"] & 1) != 0 {
      || ([v1 hasSuffix:@"-R"] & 1) != 0
    }
      || ([v1 hasSuffix:@".f"] & 1) != 0
      || ([v1 hasSuffix:@"(*)"] & 1) != 0
      || ([v1 containsString:@"("] != 0)
    {
      uint64_t v4 = 0;
      goto LABEL_10;
    }
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      FPLocalizedErrorStringForKey_cold_1((uint64_t)v1, v7);
    }

    id v5 = [NSString stringWithFormat:@"KEY_MISSING(%@)", v1];
  }
  else
  {
    id v5 = v3;
  }
  uint64_t v4 = v5;
LABEL_10:

  return v4;
}

uint64_t copyfile_status_cb(int a1, int a2, _copyfile_state *a3, const char *a4, uint64_t a5, void *a6)
{
  id v10 = a6;
  uint64_t v11 = v10;
  if (a2 == 3)
  {
    if (([v10 shouldCopyAppleDouble] & 1) == 0)
    {
      uint64_t v12 = __error();
      if (a1 == 1 && *v12 == 17)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v14 = [NSString stringWithUTF8String:a4];
        __int16 v15 = [v13 URLWithString:v14];

        int v16 = [v15 lastPathComponent];
        int v17 = [v16 hasPrefix:@"._"];

        if (v17)
        {
          uint64_t v18 = fp_current_or_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            copyfile_status_cb_cold_2();
          }

LABEL_15:
          goto LABEL_16;
        }
      }
    }
    uint64_t v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      copyfile_status_cb_cold_1((uint64_t)a4, v22);
    }

    [v11 setCopyError:*__error()];
LABEL_21:
    uint64_t v21 = 2;
    goto LABEL_22;
  }
  off_t v19 = [v10 progress];
  char v20 = [v19 isCancelled];

  if (v20) {
    goto LABEL_21;
  }
  if (a1 != 5)
  {
    if (a1 == 3)
    {
LABEL_16:
      uint64_t v21 = 0;
      goto LABEL_22;
    }
    if (a1 == 2)
    {
      [v11 setRootWasCopied:1];
      __int16 v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        copyfile_status_cb_cold_5();
      }
      goto LABEL_15;
    }
    int v25 = (void *)[[NSString alloc] initWithBytesNoCopy:a4 length:strlen(a4) encoding:4 freeWhenDone:0];
    if (a1 == 4)
    {
      [v11 updateCopyingFile:v25 state:a3];
    }
    else
    {
      uint64_t v21 = 0;
      if (a1 != 1)
      {
LABEL_43:

        goto LABEL_22;
      }
      if (a2 == 2)
      {
        [v11 finishCopyingFile:v25 state:a3];
        uint64_t v29 = fp_current_or_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          copyfile_status_cb_cold_4();
        }
      }
      else if (a2 == 1)
      {
        if (([v11 shouldCopyAppleDouble] & 1) == 0)
        {
          int v26 = [v25 lastPathComponent];
          int v27 = [v26 hasPrefix:@"._"];

          if (v27)
          {
            id v28 = fp_current_or_default_log();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
              copyfile_status_cb_cold_3();
            }

            uint64_t v21 = 1;
            goto LABEL_43;
          }
        }
        [v11 beginCopyingFile:v25 state:a3];
      }
    }
    uint64_t v21 = 0;
    goto LABEL_43;
  }
  int dst = 0;
  if (copyfile_state_get(a3, 9u, &dst))
  {
    uint64_t v24 = fp_current_or_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v30 = 0;
      _os_log_impl(&dword_1A33AE000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] copyfile: Failed to get xattr name", v30, 2u);
    }

    uint64_t v21 = 1;
  }
  else
  {
    uint64_t v21 = xattr_preserve_for_intent(dst, 1u) != 1;
  }
LABEL_22:

  return v21;
}

void sub_1A346B918(_Unwind_Exception *a1)
{
}

void sub_1A346D7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A346DF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A346E504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A346FBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1A347010C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void OUTLINED_FUNCTION_10_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_1A3470BD8(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug(v1 - 88);
  _Unwind_Resume(a1);
}

void sub_1A3470DA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3470F74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34710F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getbrc_notify_get_stateSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CloudDocsLibrary();
  uint64_t result = dlsym(v2, "brc_notify_get_state");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getbrc_notify_get_stateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CloudDocsLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CloudDocsLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    void v2[2] = (void *)3221225472;
    v2[3] = __CloudDocsLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF43C0;
    uint64_t v4 = 0;
    CloudDocsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CloudDocsLibraryCore_frameworkLibrary;
  if (!CloudDocsLibraryCore_frameworkLibrary) {
    CloudDocsLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __CloudDocsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CloudDocsLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getbrc_notify_register_checkSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CloudDocsLibrary();
  uint64_t result = dlsym(v2, "brc_notify_register_check");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getbrc_notify_register_checkSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A34715C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id knownFolderLocationConcreteClasses()
{
  if (knownFolderLocationConcreteClasses_onceToken != -1) {
    dispatch_once(&knownFolderLocationConcreteClasses_onceToken, &__block_literal_global_35);
  }
  uint64_t v0 = (void *)knownFolderLocationConcreteClasses_classes;

  return v0;
}

uint64_t __knownFolderLocationConcreteClasses_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  knownFolderLocationConcreteClasses_classes = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

void __FPEncodeUserInfo_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[FPSearchableItemValue stringFromObject:v5];
  uint64_t v8 = +[FPSearchableItemValue stringFromObject:v6];
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1A33AE000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to encode key/value pair %@: %@ in userInfo. Allowed types are String, Number, Date, Boolean.", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v7];
    [*(id *)(a1 + 40) addObject:v9];
  }
}

void sub_1A34737F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

Class __getCSSearchableItemAttributeSetClass_block_invoke(uint64_t a1)
{
  CoreSpotlightLibrary_1();
  Class result = objc_getClass("CSSearchableItemAttributeSet");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSSearchableItemAttributeSetClass_block_invoke_cold_1();
  }
  getCSSearchableItemAttributeSetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSpotlightLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  CoreSpotlightLibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getCSLocalizedStringClass_block_invoke(uint64_t a1)
{
  CoreSpotlightLibrary_1();
  Class result = objc_getClass("CSLocalizedString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSLocalizedStringClass_block_invoke_cold_1();
  }
  getCSLocalizedStringClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDPropertyCreateUserTagStringsSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)MetadataUtilitiesLibrary_0();
  Class result = dlsym(v2, "MDPropertyCreateUserTagStrings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDPropertyCreateUserTagStringsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MetadataUtilitiesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MetadataUtilitiesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getCSSearchableItemClass_block_invoke(uint64_t a1)
{
  CoreSpotlightLibrary_1();
  Class result = objc_getClass("CSSearchableItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCSSearchableItemClass_block_invoke_cold_1();
  }
  getCSSearchableItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemFilenameSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemFilename");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemFilenameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemDisplayNameSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemDisplayName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemDisplayNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemContentTypeSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemContentType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemContentTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemContentCreationDateSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemContentCreationDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemContentCreationDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemContentModificationDateSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemContentModificationDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemContentModificationDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemUserTagsSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemUserTags");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemUserTagsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemFileProviderDomainIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemFileProviderDomainIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemFileProviderDomainIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemLastUsedDateSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemLastUsedDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemLastUsedDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemFavoriteRankSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemFavoriteRank");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemFavoriteRankSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemIsUploadedSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemIsUploaded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemIsUploadedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemIsUploadingSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemIsUploading");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemIsUploadingSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemDownloadingStatusSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemDownloadingStatus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemDownloadingStatusSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemVersionIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemVersionIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemVersionIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemIsDownloadingSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemIsDownloading");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemIsDownloadingSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemUserOwnedSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemUserOwned");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemUserOwnedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemFileSizeSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemFileSize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemFileSizeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemSubItemCountSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemSubItemCount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemSubItemCountSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemIsSharedSymbolLoc_block_invoke_0(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemIsShared");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemIsSharedSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemOwnerNameSymbolLoc_block_invoke_0(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemOwnerName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemOwnerNameSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemLastEditorNameSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemLastEditorName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemLastEditorNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemIsTrashedSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemIsTrashed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemIsTrashedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemContentURLSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemContentURL");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemContentURLSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemFileItemIDSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemFileItemID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemFileItemIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemFileProviderIDSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemFileProviderID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemFileProviderIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemParentFileItemIDSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemParentFileItemID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemParentFileItemIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemDocumentIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemDocumentIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemDocumentIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemAttributeChangeDateSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemAttributeChangeDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemAttributeChangeDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDPropertyCopyUserTagNameSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)MetadataUtilitiesLibrary_0();
  Class result = dlsym(v2, "MDPropertyCopyUserTagName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDPropertyCopyUserTagNameSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemUploadErrorSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemUploadError");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemUploadErrorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemDownloadErrorSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = (void *)CoreSpotlightLibrary_1();
  Class result = dlsym(v2, "MDItemDownloadError");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemDownloadErrorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3475380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A3475840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A34759B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

id getCSIndexErrorDomain()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (void **)getCSIndexErrorDomainSymbolLoc_ptr;
  uint64_t v7 = getCSIndexErrorDomainSymbolLoc_ptr;
  if (!getCSIndexErrorDomainSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    int v3[2] = __getCSIndexErrorDomainSymbolLoc_block_invoke;
    v3[3] = &unk_1E5AF1950;
    v3[4] = &v4;
    __getCSIndexErrorDomainSymbolLoc_block_invoke((uint64_t)v3);
    uint64_t v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    getCSIndexErrorDomain_cold_1();
  }
  uint64_t v1 = *v0;

  return v1;
}

void sub_1A3475C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3476134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A3476508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *__getCSIndexErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_3)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    void v4[2] = (void *)3221225472;
    v4[3] = __CoreSpotlightLibraryCore_block_invoke_3;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5AF46E0;
    uint64_t v6 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  int v2 = (void *)CoreSpotlightLibraryCore_frameworkLibrary_3;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_3) {
    __getCSIndexErrorDomainSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  Class result = dlsym(v2, "CSIndexErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCSIndexErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSpotlightLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  CoreSpotlightLibraryCore_frameworkLibrary_3 = result;
  return result;
}

void sub_1A3477990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFBSSystemServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    int v3[2] = (void *)3221225472;
    v3[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5AF4770;
    uint64_t v5 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FrontBoardServicesLibraryCore_frameworkLibrary) {
    __getFBSSystemServiceClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("FBSSystemService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFBSSystemServiceClass_block_invoke_cold_2();
  }
  getFBSSystemServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A347820C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A3478A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A347935C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *__getCSIndexErrorDomainSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_4)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    void v4[2] = (void *)3221225472;
    v4[3] = __CoreSpotlightLibraryCore_block_invoke_4;
    void v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E5AF48C0;
    uint64_t v6 = 0;
    CoreSpotlightLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  int v2 = (void *)CoreSpotlightLibraryCore_frameworkLibrary_4;
  if (!CoreSpotlightLibraryCore_frameworkLibrary_4) {
    __getCSIndexErrorDomainSymbolLoc_block_invoke_cold_1_0(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  uint64_t result = dlsym(v2, "CSIndexErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCSIndexErrorDomainSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSpotlightLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  CoreSpotlightLibraryCore_frameworkLibrary_4 = result;
  return result;
}

void sub_1A3479798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A3479D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A347A120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_5(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_fault_impl(a1, a4, OS_LOG_TYPE_FAULT, a2, a3, 0x16u);
}

id comparablePathFromURL(void *a1)
{
  uint64_t v1 = [a1 standardizedURL];
  int v2 = [v1 pathComponents];
  long long v3 = (void *)[v2 mutableCopy];

  if ((unint64_t)[v3 count] >= 2)
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:1];
    int v5 = [v4 isEqualToString:@"private"];

    if (v5) {
      [v3 removeObjectAtIndex:1];
    }
  }
  uint64_t v6 = [NSString pathWithComponents:v3];

  return v6;
}

void sub_1A347BB88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A347BC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A347C308(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A347C454(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A347C698(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A347C780(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL fpfs_path_is_ignored(const char *a1, int a2)
{
  long long v3 = strdup(a1);
  BOOL v4 = fpfs_path_is_safe_save_temp_file_ext(v3, a2) != 0;
  free(v3);
  return v4;
}

BOOL fpfs_path_is_safe_save_temp_file(char *a1, int a2)
{
  return fpfs_path_is_safe_save_temp_file_ext(a1, a2) != 0;
}

uint64_t is_ext_image_type(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  int v2 = (void *)[[NSString alloc] initWithBytes:a1 length:a2 encoding:4];
  long long v3 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v2];
  uint64_t v4 = [v3 conformsToType:*MEMORY[0x1E4F44400]];

  return v4;
}

BOOL is_adobe_after_effect_safe_save(unint64_t a1, char *__s1)
{
  if (strcmp(__s1, "aep")) {
    return 0;
  }
  int v5 = __s1 - 2;
  if ((unint64_t)(__s1 - 2) <= a1)
  {
    int v7 = 0;
  }
  else
  {
    int v6 = 0;
    int v7 = 0;
    do
    {
      int v8 = *v5;
      if (v8 != 46 || v6 < 1)
      {
        if ((v8 - 48) > 9) {
          return v7 > 1;
        }
        ++v6;
      }
      else
      {
        int v6 = 0;
        ++v7;
      }
      --v5;
    }
    while ((unint64_t)v5 > a1);
  }
  return v7 > 1;
}

char *is_adobe_illustrator_safe_save(char *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (strncmp(a1, "~ai-", 4uLL)) {
    return 0;
  }
  uint64_t result = strrchr(a1, 95);
  if (result)
  {
    long long v3 = result;
    int v4 = strcmp(result, "_.tmp");
    uint64_t result = 0;
    if (!v4 && v3 - a1 == 40)
    {
      int v5 = strndup(a1 + 4, 0x24uLL);
      memset(uu, 0, sizeof(uu));
      return (char *)(uuid_parse(v5, uu) == 0);
    }
  }
  return result;
}

char *fpfs_path_is_safe_save_temp_file_ext(char *result, int a2)
{
  __stringp = result;
  if (result)
  {
    while (1)
    {
      long long v3 = strsep(&__stringp, "/");
      int v4 = __stringp ? 0 : a2;
      uint64_t result = (char *)fpfs_path_is_safe_save_temp_filename(v3, v4);
      if (result) {
        break;
      }
      if (!__stringp) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t fpfs_fgetpath(int a1, uint64_t a2)
{
  return fcntl(a1, 50, a2);
}

uint64_t fpfs_fsgetpath(int32_t a1, uint64_t a2, char **a3, size_t *a4)
{
  v13.val[0] = a1;
  v13.val[1] = 0;
  if (a4)
  {
    if (*a4) {
      size_t v7 = *a4;
    }
    else {
      size_t v7 = 0x2000;
    }
  }
  else
  {
    size_t v7 = 0x2000;
  }
  int v8 = (char *)malloc_type_malloc(v7, 0x5BF12871uLL);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  ssize_t v10 = fsgetpath(v8, v7, &v13, a2);
  if (v10 < 0)
  {
    free(v9);
    return 0xFFFFFFFFLL;
  }
  ssize_t v11 = v10;
  if (a3) {
    *a3 = v9;
  }
  uint64_t result = 0;
  if (a4) {
    *a4 = v11;
  }
  return result;
}

unsigned __int8 *fpfs_trim_path(const char *a1, void *a2)
{
  long long v3 = a1;
  int v4 = (unsigned __int8 *)&a1[strlen(a1)];
  int v5 = v4 - 1;
  int v6 = (unsigned __int8 *)(v3 + 1);
  do
  {
    size_t v7 = v6;
    int v8 = v3;
    uint64_t result = v6 - 1;
    if (v6 - 1 >= v5) {
      break;
    }
    if (*result != 47) {
      break;
    }
    ++v6;
    ++v3;
  }
  while (*v7 == 47);
  if (v4 <= result)
  {
LABEL_9:
    if (!a2) {
      return result;
    }
    goto LABEL_10;
  }
  while (v5 > result)
  {
    int v10 = *v5--;
    if (v10 != 47)
    {
      int v4 = v5 + 2;
      goto LABEL_9;
    }
  }
  int v4 = v7;
  if (a2) {
LABEL_10:
  }
    *a2 = v4 - (unsigned __int8 *)v8;
  return result;
}

void FPProviderForShareURL(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = +[FPDaemonConnection sharedConnectionProxy];
  [v8 fetchProviderForShareURL:v7 fallbackIdentifier:v6 completionHandler:v5];
}

void sub_1A347ED28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void sub_1A347F304(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A348139C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A348143C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3481564(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A348177C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34819A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3481A24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3481C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A3481ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1A3481FF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A348218C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A3482284(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A348251C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A348281C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34829B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3482BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1A3483094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void sub_1A3483300(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34834F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3483614(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A348370C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3483820(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3483A4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CloudDocsLibrary_0()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!CloudDocsLibraryCore_frameworkLibrary_0)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    void v2[2] = (void *)3221225472;
    v2[3] = __CloudDocsLibraryCore_block_invoke_0;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF4BF8;
    uint64_t v4 = 0;
    CloudDocsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = CloudDocsLibraryCore_frameworkLibrary_0;
  if (!CloudDocsLibraryCore_frameworkLibrary_0) {
    CloudDocsLibrary_cold_1_0(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

void sub_1A34847B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3484B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3484D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A34851F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __CloudDocsLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CloudDocsLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id FPCrossDeviceItemIDExtendedForReceivingApplication(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__21;
  uint64_t v18 = __Block_byref_object_dispose__21;
  id v19 = 0;
  id v6 = (void *)FPGetItemURLForCrossDeviceItemID(v3, 0);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "fp_bundleIdentifier");
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __FPCrossDeviceItemIDExtendedForReceivingApplication_block_invoke;
    void v11[3] = &unk_1E5AF4C18;
    fsid_t v13 = &v14;
    id v8 = v5;
    int v12 = v8;
    FPExtendBookmarkForDocumentURL(v6, v7, v11);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void sub_1A348549C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t __FPCrossDeviceItemIDExtendedForReceivingApplication_block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

id FPCreateCrossDeviceItemIDForItemAtURLOnBehalfOfApplication(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (objc_msgSend(v4, "fp_hasSandboxAccessToFile:", v3))
  {
    dispatch_semaphore_t v5 = FPCreateCrossDeviceItemIDForItemAtURL((uint64_t)v3, 0);
  }
  else
  {
    id v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      FPCreateCrossDeviceItemIDForItemAtURLOnBehalfOfApplication_cold_1((uint64_t)v4, v3, v6);
    }

    dispatch_semaphore_t v5 = 0;
  }

  return v5;
}

void sub_1A34857A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t hasConflictingVersion(void *a1, void *a2, unint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (a3)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v5 itemVersion],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [v9 contentVersion],
          int v10 = objc_claimAutoreleasedReturnValue(),
          v9,
          !v10))
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ([v5 versionIdentifier], (int v10 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        int v10 = [MEMORY[0x1E4F1C9B8] data];
      }
    }
    ssize_t v11 = [v6 contentVersion];
    char v12 = [v10 isEqual:v11];

    if (a3 < 2)
    {
      if (v12) {
        goto LABEL_29;
      }
      goto LABEL_23;
    }
    char v7 = v12 ^ 1;
  }
  else
  {
    char v7 = 0;
    uint64_t v8 = 0;
    if (a3 < 2) {
      goto LABEL_31;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v5 itemVersion],
        fsid_t v13 = objc_claimAutoreleasedReturnValue(),
        [v13 metadataVersion],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9B8] data];
  }
  uint64_t v15 = [v6 metadataVersion];
  if ([v14 isEqual:v15])
  {

    if ((v7 & 1) == 0) {
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v16 = [v6 metadataVersion];
    uint64_t v17 = [v16 length];

    if (v17) {
      char v18 = 1;
    }
    else {
      char v18 = v7;
    }

    if ((v18 & 1) == 0) {
      goto LABEL_29;
    }
  }
LABEL_23:
  if (![v6 isEmpty])
  {
    uint64_t v8 = 1;
    goto LABEL_31;
  }
  id v19 = fp_current_or_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    hasConflictingVersion_cold_2(v5, v19);
  }

  fp_simulate_crash(@"Item has version conflict, but empty base version", v20, v21, v22, v23, v24, v25, v26, v29);
  int v27 = fp_current_or_default_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
    hasConflictingVersion_cold_1();
  }

LABEL_29:
  uint64_t v8 = 0;
LABEL_31:

  return v8;
}

id contentTypeOfItem(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    int v2 = [v1 contentType];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F442D8];
    uint64_t v4 = [v1 typeIdentifier];

    int v2 = objc_msgSend(v3, "fp_cachedTypeWithIdentifier:", v4);
    id v1 = (id)v4;
  }

  return v2;
}

uint64_t isFolderContentType(void *a1)
{
  id v1 = a1;
  if ([v1 conformsToType:*MEMORY[0x1E4F44390]]) {
    uint64_t v2 = [v1 conformsToType:*MEMORY[0x1E4F44468]] ^ 1;
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1A3488B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t areCompatibleContentTypes(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  LODWORD(a1) = [a1 conformsToType:v5];
  int v7 = [v6 conformsToType:v5];

  return a1 ^ v7 ^ 1;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return v0;
}

const void *_FPItemAttributeValueFunction(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "CFTypeRef _FPItemAttributeValueFunction(MDSimpleQueryEvaluator *, void *, CFStringRef)");
    [v7 handleFailureInFunction:v8 file:@"NSFileProviderSearchQuery.m" lineNumber:44 description:@"Unexpected kind of object for evaluation"];
  }
  id v5 = (const void *)[v4 _coreSpotlightAttributeForKey:a3];
  CFRetain(v5);
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    int v10 = objc_msgSend(NSString, "stringWithUTF8String:", "CFTypeRef _FPItemAttributeValueFunction(MDSimpleQueryEvaluator *, void *, CFStringRef)");
    [v9 handleFailureInFunction:v10, @"NSFileProviderSearchQuery.m", 47, @"Unable to obtain value for key '%@'", a3 file lineNumber description];
  }
  return v5;
}

void sub_1A348AF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A348B9E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t MobileSpotlightIndexLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!MobileSpotlightIndexLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    void v2[2] = (void *)3221225472;
    v2[3] = __MobileSpotlightIndexLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E5AF4F70;
    uint64_t v4 = 0;
    MobileSpotlightIndexLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = MobileSpotlightIndexLibraryCore_frameworkLibrary;
  if (!MobileSpotlightIndexLibraryCore_frameworkLibrary) {
    MobileSpotlightIndexLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __MobileSpotlightIndexLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileSpotlightIndexLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A348BFF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t fpfs_gethandle_at(uint64_t a1, char *a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __fpfs_gethandle_at_block_invoke;
  v9[3] = &unk_1E5AF5158;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = fpfs_openat(a1, a2, 0x200000u, 0, 0, (uint64_t)v9);

  return v7;
}

uint64_t __fpfs_gethandle_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_fgethandle(a2, *(void **)(a1 + 32));
}

uint64_t fpfs_item_handle_gencmp(uint64_t *a1, uint64_t *a2, char a3)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t v5 = *a1;
    if (*a1)
    {
      uint64_t v6 = *a2;
      if (*a2)
      {
        if (a3) {
          return v5 != v6;
        }
        int v7 = *((_DWORD *)a1 + 5);
        if (v7)
        {
          int v8 = *((_DWORD *)a2 + 5);
          if (v8) {
            return v5 != v6 || v7 != v8;
          }
        }
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t fpfs_fgetdirentries(int a1, uint64_t a2, int a3, void *a4)
{
  v51[221] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (*(void *)(a2 + 8))
  {
    if ((_pagetoken_validate(a1, a2) & 0x80000000) != 0)
    {
LABEL_49:
      uint64_t v11 = 0xFFFFFFFFLL;
      goto LABEL_52;
    }
  }
  else if ((_pagetoken_init(a1, a2) & 0x80000000) != 0)
  {
    goto LABEL_49;
  }
  if (*(unsigned char *)(a2 + 28))
  {
    int v8 = *(_DWORD *)(a2 + 20);
    *(unsigned char *)(a2 + 2_Block_object_dispose(&STACK[0x2D0], 8) = 0;
  }
  else
  {
    int v8 = 0;
  }
  id v9 = (char *)malloc_type_malloc(0x8000uLL, 0x42084773uLL);
  if (!v9)
  {
    *__error() = 12;
    goto LABEL_49;
  }
  id v10 = v9;
  LODWORD(v11) = 0;
  do
  {
    int v12 = v11;
    long long v48 = xmmword_1A34E4A08;
    uint64_t v49 = 0x20000000205;
    DWORD1(v4_Block_object_dispose(&STACK[0x2D0], 8) = -971061749;
    uint64_t v13 = getattrlistbulk(a1, &v48, v10, 0x8000uLL, 8uLL);
    uint64_t v11 = v13;
    if (!v13) {
      goto LABEL_51;
    }
    if ((v13 & 0x80000000) != 0)
    {
      if (*__error() != 4 && *__error() != 35) {
        goto LABEL_51;
      }
      uint64_t v11 = 0;
    }
    v8 -= v12;
    int v14 = v11 - v8;
  }
  while ((int)v11 <= v8);
  unsigned int v39 = *(_DWORD *)a2;
  id v15 = v7;
  if (!v11)
  {

    goto LABEL_43;
  }
  int v38 = a3;
  id v33 = v7;
  int v16 = 0;
  BOOL v17 = 1;
  char v18 = v10;
  id v19 = (uint64_t (**)(void, void))v15;
  uint64_t v36 = (uint64_t (**)(void, void))v15;
  while (1)
  {
    if (v8 >= 1)
    {
      --v8;
      goto LABEL_20;
    }
    bzero(&v48, 0x800uLL);
    if ((_parse_fileattrs((uint64_t)v18, v10 + 0x8000 - v18, (uint64_t)&v48) & 0x80000000) != 0) {
      break;
    }
    if ((fpfs_pkg_fileattrs_update_on(v39, (uint64_t)&v48, v38) & 0x80000000) != 0)
    {
      int v34 = v49;
      if (v50) {
        uint64_t v20 = v50;
      }
      else {
        uint64_t v20 = v51;
      }
      int v21 = *__error();
      uint64_t v22 = [NSString stringWithUTF8String:v20];
      uint8_t v37 = objc_msgSend(v22, "fp_prettyPath");

      *__error() = v21;
      uint64_t v23 = fp_current_or_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        BOOL v24 = v34 == 0;
        uint64_t v25 = "docID";
        if (!v34) {
          uint64_t v25 = "fileID";
        }
        id v35 = v25;
        if (v24) {
          uint64_t v26 = v48;
        }
        else {
          uint64_t v26 = v49;
        }
        int v27 = *__error();
        *(_DWORD *)uint8_t buf = 136315906;
        stat v41 = v35;
        __int16 v42 = 2048;
        uint64_t v43 = v26;
        __int16 v44 = 2114;
        long long v45 = v37;
        __int16 v46 = 1024;
        int v47 = v27;
        _os_log_error_impl(&dword_1A33AE000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Failed to list item %s(%llu) %{public}@, errno %{errno}d", buf, 0x26u);
      }

      id v19 = v36;
    }
    else if ((((uint64_t (**)(void, long long *))v19)[2](v19, &v48) & 0x80000000) != 0)
    {
      goto LABEL_40;
    }
LABEL_20:
    v18 += *(unsigned int *)v18;
    BOOL v17 = ++v16 < (int)v11;
    if (v11 == v16) {
      goto LABEL_40;
    }
  }
  if (*__error() == 79) {
    goto LABEL_20;
  }
LABEL_40:

  id v7 = v33;
  if (v17)
  {
LABEL_48:
    free(v10);
    goto LABEL_49;
  }
LABEL_43:
  int v28 = *(_DWORD *)(a2 + 24);
  if ((_pagetoken_validate(a1, a2) & 0x80000000) != 0) {
    goto LABEL_48;
  }
  if (v28 == -1)
  {
    *(_DWORD *)(a2 + 20) += v14;
  }
  else
  {
    int v29 = *(_DWORD *)(a2 + 24);
    BOOL v30 = __OFSUB__(v29, v14);
    int v31 = v29 - v14;
    if (v31 < 0 != v30)
    {
      *__error() = 33;
      goto LABEL_48;
    }
    *(_DWORD *)(a2 + 20) += v14;
    *(_DWORD *)(a2 + 24) = v31;
  }
LABEL_51:
  free(v10);
LABEL_52:

  return v11;
}

char *fpfs_get_long_parent(char *__s, unint64_t a2, char **a3)
{
  if (!__s || !a2)
  {
    if (a3)
    {
      uint64_t v6 = 0;
      *a3 = 0;
      return v6;
    }
    return 0;
  }
  if (a2 >= 0xFF)
  {
    id v7 = __s;
    if (*__s)
    {
      id v7 = __s;
LABEL_10:
      int v8 = strchr(v7, 47);
      if (v8)
      {
        if ((unint64_t)(v8 - __s) <= 0xFF)
        {
          id v9 = v8 + 1;
          id v10 = &v8[1 - (void)__s];
          while (1)
          {
            id v7 = v9;
            if ((unint64_t)v10 >= a2) {
              break;
            }
            ++v9;
            ++v10;
            if (*v7 != 47)
            {
              if (*v7) {
                goto LABEL_10;
              }
              break;
            }
          }
        }
      }
    }
    if (a3) {
      *a3 = v7;
    }
    uint64_t v11 = &v7[~(unint64_t)__s];
    while (v11 != (char *)-1)
    {
      int v12 = (v11--)[(void)__s];
      if (v12 != 47)
      {
        size_t v13 = (size_t)(v11 + 3);
        int v14 = (char *)malloc_type_malloc((size_t)(v11 + 3), 0x4BF14B8FuLL);
        uint64_t v6 = v14;
        if (v14) {
          strlcpy(v14, __s, v13);
        }
        return v6;
      }
    }
    return 0;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v6 = 0;
  *a3 = __s;
  return v6;
}

uint64_t fpfs_openat_longpath(int a1, char *__s, int a3, uint64_t a4)
{
  BOOL v17 = __s;
  if (!__s) {
    return openat(a1, 0, a3, a4);
  }
  id v7 = __s;
  int v8 = a1;
  while (1)
  {
    size_t v9 = strlen(v7);
    if (v9 < 0x400) {
      break;
    }
    long_parent = fpfs_get_long_parent(v7, v9, &v17);
    if (!long_parent) {
      break;
    }
    uint64_t v11 = long_parent;
    if (!*long_parent) {
      break;
    }
    int v12 = openat(v8, long_parent, 0x100000);
    free(v11);
    if (v8 != a1)
    {
      int v13 = *__error();
      close(v8);
      *__error() = v13;
    }
    if (v12 < 0) {
      return 0xFFFFFFFFLL;
    }
    id v7 = v17;
    int v8 = v12;
    if (!v17) {
      goto LABEL_12;
    }
  }
  int v12 = v8;
LABEL_12:
  uint64_t v14 = openat(v12, v17, a3, a4);
  if (v12 != a1)
  {
    int v15 = *__error();
    close(v12);
    *__error() = v15;
  }
  return v14;
}

uint64_t fpfs_open_longpath(char *__s, int a2, uint64_t a3)
{
  return fpfs_openat_longpath(-2, __s, a2, a3);
}

uint64_t fpfs_openat_longparent(int a1, const char *a2, void *a3)
{
  size_t __n = 0;
  uint64_t v5 = fpfs_trim_path(a2, &__n);
  uint64_t v6 = strndup((const char *)v5, __n);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  id v7 = v6;
  int v8 = strrchr(v6, 47);
  if (!v8)
  {
    free(v7);
    return 0xFFFFFFFFLL;
  }
  int64_t v9 = v8 - v7;
  if (v8 == v7) {
    id v10 = v8 + 1;
  }
  else {
    id v10 = v8;
  }
  char *v10 = 0;
  uint64_t v11 = fpfs_openat_longpath(a1, v7, 0x100000, 0);
  free(v7);
  if (a3) {
    *a3 = &v5[v9 + 1];
  }
  return v11;
}

uint64_t _openbyparentidandname_retry(uint64_t a1, unsigned int a2, char a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a4 + 8);
  int64_t v9 = *(char **)(a4 + 24);
  v17[0] = a1;
  int v10 = openbyid_np();
  if (v10 < 0)
  {
    if (*__error() != 63) {
      goto LABEL_15;
    }
    if (!fpfs_supports_long_paths()) {
      goto LABEL_15;
    }
    int v10 = _openbyid_longpaths(a1, v8, 1048836);
    if (v10 < 0) {
      goto LABEL_15;
    }
  }
  if (a2) {
    unsigned int v11 = a2;
  }
  else {
    unsigned int v11 = 0x8000;
  }
  int v12 = v11 | ~(v11 >> 13) & 0x100 | 4;
  uint64_t v13 = openat(v10, v9, v12);
  if ((v13 & 0x80000000) != 0 && *__error() == 63 && fpfs_supports_long_paths()) {
    uint64_t v13 = fpfs_openat_longpath(v10, v9, v12, 0);
  }
  int v14 = *__error();
  close(v10);
  *__error() = v14;
  if ((v13 & 0x80000000) != 0)
  {
LABEL_15:
    int v15 = __error();
    if ((a2 & 3) != 0 && (a3 & 2) != 0 && *v15 == 21) {
      return _openbyparentidandname_retry(a1, a2 & 0xFFFFFFFC, 0, a4);
    }
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    _DWORD v17[2] = ___validate_file_openbyid_block_invoke;
    v17[3] = &__block_descriptor_44_e34_i16__0__fpfs_item_handle_QQII_iI_8l;
    void v17[4] = a4;
    int v18 = v13;
    if (!fpfs_fgethandle(v13, v17)) {
      return v13;
    }
    *__error() = 2;
    close(v13);
  }
  if (!*__error()) {
    _openbyparentidandname_retry_cold_1();
  }
  return 0xFFFFFFFFLL;
}

uint64_t fpfs_openbyid_ext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  int64_t v9 = a5;
  uint64_t v10 = fpfs_openfdbyhandle(a1, a2, a3, a4);
  if ((v10 & 0x80000000) != 0
    || (int v11 = v10, v12 = v9[2](v9, v10), v13 = *__error(), close(v11) < 0) && (*__error() == 9 || *__error() == 5))
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  else
  {
    *__error() = v13;
  }

  return v12;
}

uint64_t fpfs_track_document(int a1, _DWORD *a2)
{
  if ((fpfs_fchflags(a1, 0, 64) & 0x80000000) != 0)
  {
    int DocumentId = GSLibraryGetOrAllocateDocumentId();
    if (DocumentId)
    {
      int v6 = DocumentId;
      if ((fpfs_pkg_enable_dirstat(a1) & 0x80000000) == 0 || *__error() == 22)
      {
        if (a2)
        {
          uint64_t result = 0;
          *a2 = v6;
          return result;
        }
        return 0;
      }
    }
    return 0xFFFFFFFFLL;
  }
  if ((fpfs_pkg_enable_dirstat(a1) & 0x80000000) != 0 && *__error() != 22) {
    return 0xFFFFFFFFLL;
  }
  if (a2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _OWORD v7[2] = __fpfs_track_document_block_invoke;
    v7[3] = &__block_descriptor_40_e34_i16__0__fpfs_item_handle_QQII_iI_8l;
    void v7[4] = a2;
    return fpfs_fgethandle(a1, v7);
  }
  return 0;
}

uint64_t __fpfs_track_document_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 16);
  if (v2)
  {
    uint64_t result = 0;
    **(_DWORD **)(a1 + 32) = v2;
  }
  else
  {
    *__error() = 35;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t fpfs_untrack_document(int a1)
{
  return fpfs_fchflags(a1, 0x40u, 0);
}

uint64_t fpfs_should_be_tracked_internal(uint64_t a1, uint64_t a2, int a3, BOOL *a4)
{
  int v4 = *(_WORD *)(a2 + 4) & 0xF000;
  if (v4 == 0x4000) {
    return fpfs_pkg_is_package_root(a1, 0, a4, a3);
  }
  *a4 = v4 == 0x8000;
  return 0;
}

uint64_t __fpfs_fget_ignore_item_block_invoke(uint64_t a1, int a2)
{
  return fpfs_get_is_ignore_root(a2, *(BOOL **)(a1 + 32));
}

uint64_t _pagetoken_init(int a1, uint64_t a2)
{
  uint64_t v10 = 0;
  long long v9 = xmmword_1A34E4A20;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  int v8 = 0;
  uint64_t v7 = 0;
  uint64_t result = fgetattrlist(a1, &v9, &v5, 0x1CuLL, 0x20u);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  int v4 = v8;
  if ((v6 & 0x40000000) != 0) {
    int v4 = -1;
  }
  *(_DWORD *)a2 = HIDWORD(v5);
  *(void *)(a2 + _Block_object_dispose(&STACK[0x2D0], 8) = v7;
  *(void *)(a2 + 16) = HIDWORD(v6);
  *(_DWORD *)(a2 + 24) = v4;
  *(unsigned char *)(a2 + 2_Block_object_dispose(&STACK[0x2D0], 8) = 0;
  return result;
}

uint64_t _pagetoken_validate(int a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  if ((_pagetoken_init(a1, (uint64_t)&v10) & 0x80000000) == 0)
  {
    if (!v10) {
      _pagetoken_validate_cold_1();
    }
    uint64_t v4 = *((void *)&v10 + 1);
    if (*((void *)&v10 + 1) == *(void *)(a2 + 8) && v11 == *(_DWORD *)(a2 + 16)) {
      return 0;
    }
    *__error() = 70;
    int v6 = *__error();
    uint64_t v7 = fpfs_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a2 + 8);
      int v9 = *(_DWORD *)(a2 + 16);
      *(_DWORD *)uint8_t buf = 67110144;
      int v13 = a1;
      __int16 v14 = 2048;
      uint64_t v15 = v4;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      __int16 v18 = 1024;
      int v19 = v11;
      __int16 v20 = 1024;
      int v21 = v9;
      _os_log_error_impl(&dword_1A33AE000, v7, OS_LOG_TYPE_ERROR, "ESTALE: directory changed during _pagetoken_validate [%d, %llu, %llu, %u, %u]", buf, 0x28u);
    }

    *__error() = v6;
  }
  return 0xFFFFFFFFLL;
}

uint64_t _openbyid_longpaths(int32_t a1, uint64_t a2, int a3)
{
  __s = 0;
  if ((fpfs_fsgetpath(a1, a2, &__s, 0) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = fpfs_openat_longpath(-2, __s, a3, 0);
  free(__s);
  return v4;
}

uint64_t __DesktopServicesPrivLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  DesktopServicesPrivLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1A348D65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t _t_fpfs_pkg_extension_register(unsigned char *a1)
{
  if (a1 && *a1) {
    fpfs_user_package_extension_list_insert(a1);
  }
  return 0;
}

uint64_t _t_fpfs_pkg_extension_unregister(unsigned char *a1)
{
  if (a1 && *a1) {
    fpfs_user_package_extension_list_remove(a1);
  }
  return 0;
}

uint64_t fpfs_pkg_enable_dirstat(int a1)
{
  uint64_t v2 = 0;
  return ffsctl(a1, 0x80084A02uLL, &v2, 0);
}

uint64_t fpfs_pkg_demote(int a1)
{
  char v4 = 0;
  if ((fpfs_pkg_is_demoted(a1, &v4) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v4) {
    return 0;
  }
  uint64_t v2 = 1;
  if (fsetxattr(a1, "com.apple.fileprovider.dir#N", "1", 1uLL, 0, 0) < 0)
  {
    if (*__error() == 13) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

uint64_t fpfs_pkg_promote(int a1)
{
  if ((fpfs_pkg_remove_demotion_xattr(a1) & 0x80000000) != 0) {
    goto LABEL_6;
  }
  long long v4 = xmmword_1A34E4A40;
  long long value = xmmword_1A34E4A40;
  if ((fpfs_set_finder_info(a1, (uint64_t)&value, (uint64_t)&v4) & 0x80000000) != 0) {
    goto LABEL_6;
  }
  LODWORD(value) = 0;
  if (!fpfs_pkg_getflags(a1, &value) && (value & 1) != 0) {
    return 0;
  }
  uint64_t v2 = 1;
  LODWORD(value) = 1;
  if (fsetxattr(a1, "com.apple.fileprovider.fpfs#P", &value, 4uLL, 0, 0) < 0)
  {
LABEL_6:
    if (*__error() == 13) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

uint64_t fpfs_pkg_remove_demotion_xattr(int a1)
{
  if (fpfs_fremovexattr(a1, "com.apple.fileprovider.dir#N", 0) < 0 && *__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t fpfs_pkg_set_bundle_bit(int a1, int a2)
{
  long long v5 = xmmword_1A34E4A40;
  if (a2) {
    unsigned __int8 v2 = 2;
  }
  else {
    unsigned __int8 v2 = 0;
  }
  v4[1] = 0;
  v4[0] = v2;
  return fpfs_set_finder_info(a1, (uint64_t)&v5, (uint64_t)v4);
}

uint64_t fpfs_pkg_demote_at(uint64_t a1, char *a2)
{
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)&__block_literal_global_44);
}

uint64_t __fpfs_pkg_demote_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_pkg_demote(a2);
}

uint64_t fpfs_pkg_promote_at(uint64_t a1, char *a2)
{
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)&__block_literal_global_5);
}

uint64_t __fpfs_pkg_promote_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_pkg_promote(a2);
}

uint64_t fpfs_pkg_is_demoted_at(uint64_t a1, char *a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __fpfs_pkg_is_demoted_at_block_invoke;
  v4[3] = &__block_descriptor_40_e8_i12__0i8l;
  void v4[4] = a3;
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)v4);
}

uint64_t __fpfs_pkg_is_demoted_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_pkg_is_demoted(a2, *(unsigned char **)(a1 + 32));
}

uint64_t fpfs_pkg_is_promoted_at(uint64_t a1, char *a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __fpfs_pkg_is_promoted_at_block_invoke;
  v4[3] = &__block_descriptor_40_e8_i12__0i8l;
  void v4[4] = a3;
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)v4);
}

uint64_t fpfs_pkg_remove_promotion_xattr(int a1)
{
  if (fpfs_fremovexattr(a1, "com.apple.fileprovider.fpfs#P", 0) < 0 && *__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

BOOL pkg_extension_is_forced_folder(const char *a1)
{
  if (!*a1) {
    return 0;
  }
  if (!strcmp(a1, "folder")) {
    return 1;
  }
  return strcmp(a1, "git") == 0;
}

uint64_t fpfs_pathpkg_check(char *a1)
{
  long long v4 = 0;
  int v1 = *a1;
  if (v1 == 47)
  {
    long long v4 = a1;
  }
  else if (asprintf(&v4, "/%s", a1) < 0)
  {
    return 0xFFFFFFFFLL;
  }
  if (_cwd_fd_onceToken != -1) {
    dispatch_once(&_cwd_fd_onceToken, &__block_literal_global_20_0);
  }
  if (_cwd_fd_fd < 0) {
    fpfs_pathpkg_check_cold_1();
  }
  uint64_t v2 = fcntl(_cwd_fd_fd, 52, v4);
  if (v1 != 47) {
    free(v4);
  }
  return v2;
}

char *fpfs_pkg_system_relative_lookup(char *a1, unsigned char *a2, unsigned char *a3)
{
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (!a1) {
    return 0;
  }
  if (!*a1) {
    return 0;
  }
  int v6 = fpfs_pathpkg_check(a1);
  if (v6 < 0) {
    return 0;
  }
  int v7 = v6;
  uint64_t v8 = a1 - 1;
  do
    int v9 = *++v8;
  while (v9 == 47);
  if (v7 < 1)
  {
LABEL_14:
    if (a2) {
      *a2 = 1;
    }
    uint64_t result = strchr(v8, 47);
    if (!result) {
      return result;
    }
    if (result[1])
    {
      if (a2) {
        *a2 = 0;
      }
      if (a3)
      {
        uint64_t result = 0;
        *a3 = 1;
        return result;
      }
    }
    return 0;
  }
  int v10 = v7 + 1;
  while (1)
  {
    long long v11 = strchr(v8, 47);
    if (!v11) {
      break;
    }
    uint64_t v8 = v11 + 1;
    if (--v10 <= 1) {
      goto LABEL_14;
    }
  }
  *__error() = 22;
  return (char *)0xFFFFFFFFLL;
}

char *fpfs_pkg_system_lookup(char *a1, const char *a2, unsigned char *a3, unsigned char *a4)
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  int v6 = (char *)fpfs_path_relative_to(a1, a2);
  if (!v6 || !*v6) {
    return 0;
  }

  return fpfs_pkg_system_relative_lookup(v6, a3, a4);
}

uint64_t fpfs_pkg_fileattrs_update_on(uint64_t a1, uint64_t a2, int a3)
{
  return _pkg_fileattrs_update(0xFFFFFFFFLL, a1, a2, a3);
}

uint64_t fpfs_pkg_get_bundle_bit_at(uint64_t a1, char *a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __fpfs_pkg_get_bundle_bit_at_block_invoke;
  v4[3] = &__block_descriptor_40_e8_i12__0i8l;
  void v4[4] = a3;
  return fpfs_openat(a1, a2, 0x100000u, 0, 0, (uint64_t)v4);
}

uint64_t __fpfs_pkg_get_bundle_bit_at_block_invoke(uint64_t a1, int a2)
{
  return fpfs_pkg_get_bundle_bit(a2, *(BOOL **)(a1 + 32));
}

uint64_t ___cwd_fd_block_invoke()
{
  uint64_t result = open(".", 1048836);
  _cwd_fd_fd = result;
  return result;
}

id FPProviderNotFoundError(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = FPLoc(@"NoValidProviderFound_identifier_%@", a2, a3, a4, a5, a6, a7, a8, a1);
  int v10 = _FPProviderNotFoundErrorHelper(v9, 0, a2);

  return v10;
}

id FPProviderOlderVersionRunningError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v23[0] = *MEMORY[0x1E4F28328];
    uint64_t v8 = [a1 path];
    v24[0] = v8;
    v23[1] = *MEMORY[0x1E4F28568];
    __int16 v16 = FPLoc(@"ProviderVersionOlderVersionRunning", v9, v10, v11, v12, v13, v14, v15, v20);
    v24[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  }
  else
  {
    uint64_t v21 = *MEMORY[0x1E4F28568];
    uint64_t v8 = FPLoc(@"ProviderVersionOlderVersionRunning", a2, a3, a4, a5, a6, a7, a8, v20);
    uint64_t v22 = v8;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  }

  __int16 v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderErrorDomain" code:-2003 userInfo:v17];

  return v18;
}

id FPProviderNewerVersionFoundError(void *a1)
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  int v1 = (void *)MEMORY[0x1E4F28C58];
  v15[0] = *MEMORY[0x1E4F28328];
  uint64_t v2 = [a1 path];
  v16[0] = v2;
  v15[1] = *MEMORY[0x1E4F28568];
  uint64_t v10 = FPLoc(@"ProviderVersionNewerVersionFound", v3, v4, v5, v6, v7, v8, v9, v14);
  v16[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v12 = [v1 errorWithDomain:@"NSFileProviderErrorDomain" code:-2004 userInfo:v11];

  return v12;
}

id FPProviderXPCInvalidError(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  int v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *MEMORY[0x1E4F281F8];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = a1;
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a1;
  uint64_t v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = [v1 errorWithDomain:v2 code:4099 userInfo:v5];

  return v6;
}

id FPProviderNotFoundErrorForURL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  uint64_t v9 = FPLoc(@"NoValidProviderFound_url_%@", a2, a3, a4, a5, a6, a7, a8, a1);
  v14[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v11 = [v8 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:0 userInfo:v10];

  return v11;
}

id FPItemNotFoundErrorAtURL(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v6 = *MEMORY[0x1E4F289D0];
    v7[0] = v1;
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:v3];

  return v4;
}

uint64_t FPItemNotFoundError(uint64_t a1)
{
  return [MEMORY[0x1E4F28C58] fileProviderErrorForNonExistentItemWithIdentifier:a1];
}

uint64_t FPEvictedByTheUserError()
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderErrorDomain" code:-5010 userInfo:MEMORY[0x1E4F1CC08]];
}

uint64_t FPShouldTrashLocallyError()
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderInternalErrorDomain" code:24 userInfo:MEMORY[0x1E4F1CC08]];
}

uint64_t FPTrashDatalessFileNotSupported()
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderInternalErrorDomain" code:25 userInfo:MEMORY[0x1E4F1CC08]];
}

uint64_t FPNotPermittedError()
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:257 userInfo:MEMORY[0x1E4F1CC08]];
}

uint64_t FPUserCancelledError()
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:MEMORY[0x1E4F1CC08]];
}

uint64_t FPNotPermittedWriteError()
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:513 userInfo:MEMORY[0x1E4F1CC08]];
}

id FPInvalidParameterError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  if (a2)
  {
    uint64_t v18 = *MEMORY[0x1E4F28568];
    uint64_t v9 = FPLoc(@"InvalidParameter_Parameter_Value_%@_%@", a2, a3, a4, a5, a6, a7, a8, a2);
    v19[0] = v9;
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = (void **)v19;
    uint64_t v12 = &v18;
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F28568];
    uint64_t v9 = FPLoc(@"InvalidParameter_Parameter_%@", 0, a3, a4, a5, a6, a7, a8, a1);
    uint64_t v17 = v9;
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v11 = &v17;
    uint64_t v12 = &v16;
  }
  uint64_t v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
  uint64_t v14 = [v8 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:3 userInfo:v13];

  return v14;
}

id FPInvalidParameterErrorWithExpectation(void *a1, void *a2, void *a3)
{
  void v16[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSString;
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  uint64_t v9 = [v5 stringWithFormat:@"Invalid value for %@: expected %@, actual %@", v8, v6, v7];
  uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
  v15[0] = @"parameter";
  v15[1] = @"actual";
  v16[0] = v8;
  v16[1] = v7;
  uint64_t v11 = *MEMORY[0x1E4F28228];
  void v15[2] = @"expected";
  v15[3] = v11;
  void v16[2] = v6;
  void v16[3] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  uint64_t v13 = [v10 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:3 userInfo:v12];

  return v13;
}

id FPPluginOperationFailedError(void *a1)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  if ([v2 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
  }
  else
  {
    id v4 = [v1 domain];
    int v5 = [v4 isEqualToString:*MEMORY[0x1E4F289A0]];

    if (!v5)
    {
      id v6 = [v1 domain];
      int v7 = [v6 isEqualToString:@"NSFileProviderErrorDomain"];

      if (!v7)
      {
        uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
        if (v1)
        {
          v27[0] = *MEMORY[0x1E4F28568];
          uint64_t v18 = FPLoc(@"PluginOperationFailed", v8, v9, v10, v11, v12, v13, v14, v24);
          v27[1] = *MEMORY[0x1E4F28A50];
          v28[0] = v18;
          v28[1] = v1;
          int v19 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v20 = (void **)v28;
          uint64_t v21 = v27;
          uint64_t v22 = 2;
        }
        else
        {
          uint64_t v25 = *MEMORY[0x1E4F28568];
          uint64_t v18 = FPLoc(@"PluginOperationFailed", v8, v9, v10, v11, v12, v13, v14, v24);
          uint64_t v26 = v18;
          int v19 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v20 = &v26;
          uint64_t v21 = &v25;
          uint64_t v22 = 1;
        }
        uint64_t v23 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v22];
        id v15 = [v17 errorWithDomain:v3 code:4101 userInfo:v23];

        goto LABEL_6;
      }
    }
  }
  id v15 = v1;
LABEL_6:

  return v15;
}

id FPInvalidBookmarkableStringError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F28568];
  uint64_t v9 = FPLoc(@"InvalidBookmark", a2, a3, a4, a5, a6, a7, a8, v13);
  v15[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v11 = [v8 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:5 userInfo:v10];

  return v11;
}

id FPInvalidURLError(void *a1)
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4F28C58];
  v17[0] = *MEMORY[0x1E4F28568];
  id v2 = a1;
  uint64_t v10 = FPLoc(@"InvalidURL", v3, v4, v5, v6, v7, v8, v9, v16);
  v18[0] = v10;
  v17[1] = *MEMORY[0x1E4F28328];
  uint64_t v11 = [v2 path];

  uint64_t v12 = @"(null)";
  if (v11) {
    uint64_t v12 = v11;
  }
  v18[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  uint64_t v14 = [v1 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:6 userInfo:v13];

  return v14;
}

id FPProxyNotFoundError(uint64_t a1, void *a2)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
  if (a2)
  {
    v31[0] = *MEMORY[0x1E4F28568];
    id v5 = a2;
    uint64_t v13 = FPLoc(@"ProxyNotFound_%@", v6, v7, v8, v9, v10, v11, v12, a1);
    v31[1] = *MEMORY[0x1E4F28A50];
    v32[0] = v13;
    v32[1] = v5;
    uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
    id v15 = (void **)v32;
    uint64_t v16 = v31;
    uint64_t v17 = 2;
  }
  else
  {
    uint64_t v29 = *MEMORY[0x1E4F28568];
    id v18 = 0;
    uint64_t v13 = FPLoc(@"ProxyNotFound_%@", v19, v20, v21, v22, v23, v24, v25, a1);
    BOOL v30 = v13;
    uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
    id v15 = &v30;
    uint64_t v16 = &v29;
    uint64_t v17 = 1;
  }
  uint64_t v26 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
  int v27 = [v4 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:7 userInfo:v26];

  return v27;
}

id FPNotImplementedError(uint64_t a1, SEL aSelector)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  if (a1)
  {
    uint64_t v28 = *MEMORY[0x1E4F28568];
    uint64_t v4 = NSStringFromSelector(aSelector);
    uint64_t v12 = FPLoc(@"NotImplementedWithClass_%@_%@", v5, v6, v7, v8, v9, v10, v11, a1);
    v29[0] = v12;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = (void **)v29;
    id v15 = &v28;
  }
  else
  {
    uint64_t v26 = *MEMORY[0x1E4F28568];
    uint64_t v4 = NSStringFromSelector(aSelector);
    uint64_t v12 = FPLoc(@"NotImplemented_%@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v4);
    int v27 = v12;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = &v27;
    id v15 = &v26;
  }
  uint64_t v23 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
  uint64_t v24 = [v2 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:9 userInfo:v23];

  return v24;
}

id FPInvalidProtocolError(__CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = &stru_1EF68D1F8;
  if (a1) {
    uint64_t v9 = a1;
  }
  uint64_t v14 = *MEMORY[0x1E4F28568];
  uint64_t v10 = FPLoc(@"InvalidProtocol %@", a2, a3, a4, a5, a6, a7, a8, (uint64_t)v9);
  v15[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v12 = [v8 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:9 userInfo:v11];

  return v12;
}

id FPClientLacksEntitlement(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = FPLoc(@"ClientLacksEntitlement", v3, v4, v5, v6, v7, v8, v9, v13);
  [v2 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28568]];

  if (v1) {
    [v2 setObject:v1 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderInternalErrorDomain" code:8 userInfo:v2];

  return v11;
}

id FPPartialErrorsByItemIdentifiers(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = @"NSFileProviderPartialErrorsByItemIdentifierKey";
  v8[0] = a1;
  id v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a1;
  uint64_t v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v1 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:10 userInfo:v4];

  return v5;
}

id FPPartialErrorsByURL(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = @"NSFileProviderPartialErrorsByURLKey";
  v8[0] = a1;
  id v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a1;
  uint64_t v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v1 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:10 userInfo:v4];

  return v5;
}

uint64_t FPNotSupportedError()
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:MEMORY[0x1E4F1CC08]];
}

id FPDomainUnavailableErrorWithUnderlyingError(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    uint64_t v6 = *MEMORY[0x1E4F28A50];
    v7[0] = v1;
    id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderInternalErrorDomain" code:12 userInfo:v3];

  return v4;
}

id FPDomainUnavailableError()
{
  return FPDomainUnavailableErrorWithUnderlyingError(0);
}

id FPFileSystemNotSupportedError()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v1 = *MEMORY[0x1E4F281F8];
  uint64_t v6 = *MEMORY[0x1E4F28A50];
  id v2 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", 19);
  v7[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v4 = [v0 errorWithDomain:v1 code:3328 userInfo:v3];

  return v4;
}

uint64_t FPSubtreeChangedError()
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"NSFileProviderInternalErrorDomain" code:14 userInfo:0];
}

id FPNonEvictableChildrenError(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28750];
  v8[0] = a1;
  id v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a1;
  uint64_t v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v1 errorWithDomain:@"NSFileProviderErrorDomain" code:-2006 userInfo:v4];

  return v5;
}

id FPEvictionWithUnsyncedEditsError(void *a1)
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [v1 lastPathComponent];
  uint64_t v10 = FPLoc(@"DirtyNotEvictable_%@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);

  uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  v16[0] = *MEMORY[0x1E4F289D0];
  v16[1] = v12;
  v17[0] = v1;
  v17[1] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint64_t v14 = [v11 errorWithDomain:@"NSFileProviderErrorDomain" code:-2007 userInfo:v13];

  return v14;
}

id FPEvictionOnBusyItemError(void *a1)
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v9 = FPLoc(@"BusyNotEvictableTitle", v2, v3, v4, v5, v6, v7, v8, v25);
  uint64_t v10 = [v1 lastPathComponent];
  uint64_t v18 = FPLoc(@"BusyNotEvictableSubtitle_%@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v10);

  uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v20 = *MEMORY[0x1E4F28798];
  uint64_t v21 = *MEMORY[0x1E4F28568];
  v26[0] = *MEMORY[0x1E4F289D0];
  v26[1] = v21;
  v27[0] = v1;
  v27[1] = v9;
  v26[2] = *MEMORY[0x1E4F28578];
  void v27[2] = v18;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  uint64_t v23 = [v19 errorWithDomain:v20 code:16 userInfo:v22];

  return v23;
}

id FPEvictionOnItemWithHardlinkError(void *a1)
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 lastPathComponent];
  uint64_t v10 = FPLoc(@"MLinkNotEvictable_%@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);

  uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28798];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  v17[0] = *MEMORY[0x1E4F289D0];
  v17[1] = v13;
  v18[0] = v1;
  v18[1] = v10;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  uint64_t v15 = [v11 errorWithDomain:v12 code:31 userInfo:v14];

  return v15;
}

id FPMissingAllowsEvictingCapabilitiesError(void *a1)
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v2 = [v1 hasDirectoryPath];
  uint64_t v10 = [v1 lastPathComponent];
  if (v2) {
    uint64_t v11 = @"GenericFolderNotEvictable_%@";
  }
  else {
    uint64_t v11 = @"GenericNotEvictable_%@";
  }
  uint64_t v12 = FPLoc(v11, v3, v4, v5, v6, v7, v8, v9, (uint64_t)v10);

  uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v14 = *MEMORY[0x1E4F28568];
  v18[0] = *MEMORY[0x1E4F289D0];
  v18[1] = v14;
  v19[0] = v1;
  v19[1] = v12;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  uint64_t v16 = [v13 errorWithDomain:@"NSFileProviderErrorDomain" code:-2008 userInfo:v15];

  return v16;
}

id FPFileIsAlreadyPausedError(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F289D0];
  v8[0] = a1;
  int v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a1;
  uint64_t v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v1 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:17 userInfo:v4];

  return v5;
}

id FPFileNotPausedError(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F289D0];
  v8[0] = a1;
  int v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a1;
  uint64_t v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v1 errorWithDomain:@"NSFileProviderInternalErrorDomain" code:16 userInfo:v4];

  return v5;
}

__CFString *FPConnectionStateToPrettyString(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  switch(a1)
  {
    case 2:
      uint64_t v5 = @"(⏹  error)";
      break;
    case 3:
      if (v3)
      {
        uint64_t v5 = [NSString stringWithFormat:@" (⏹  temporarily disconnected: %@)", v3];
      }
      else
      {
        uint64_t v5 = @" (⏹  temporarily disconnected)";
      }
      break;
    case 4:
      uint64_t v5 = @"(⏹  permanently disconnected)";
      break;
    case 5:
      uint64_t v5 = @"(⏹  extension not found)";
      break;
    case 6:
      uint64_t v5 = @"(⏹  low disk space)";
      break;
    case 7:
      uint64_t v5 = @"(⏹  incompatible DB)";
      break;
    case 8:
      uint64_t v5 = @"(⏹  forbidden by MDM)";
      break;
    case 9:
      uint64_t v5 = @"(⏹  external domain rejected by provider)";
      break;
    default:
      uint64_t v5 = &stru_1EF68D1F8;
      break;
  }

  return v5;
}

void OUTLINED_FUNCTION_1_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x12u);
}

id FPFileSizeAttributes()
{
  v11[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v10 = @"size";
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v0 = (id *)getMDItemFileSizeSymbolLoc_ptr_0;
  uint64_t v9 = getMDItemFileSizeSymbolLoc_ptr_0;
  if (!getMDItemFileSizeSymbolLoc_ptr_0)
  {
    id v1 = (void *)CoreSpotlightLibrary_2();
    v7[3] = (uint64_t)dlsym(v1, "MDItemFileSize");
    getMDItemFileSizeSymbolLoc_ptr_0 = v7[3];
    uint64_t v0 = (id *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v0) {
    FPFileSizeAttributes_cold_1();
  }
  v11[0] = *v0;
  int v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = v11[0];
  uint64_t v4 = [v2 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v4;
}

void sub_1A34919B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id FPScopedToIdentifierFragment(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  uint64_t v7 = objc_msgSend(a2, "fp_toDomainIdentifier");
  uint64_t v8 = +[FPItemID csIdentifierFromFPIdentifier:v5 domainIdentifier:v7];

  uint64_t v9 = [NSString stringWithFormat:@"%@:%@", v6, v8];

  return v9;
}

uint64_t __FPExcludedOIDParentsQueryStringFragment_block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"(_kMDItemQueryPathOID != %@)", a2];
}

uint64_t __FPContentTypeQueryStringForFileTypes_block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"(kMDItemContentTypeTree == \"%@\"c)", a2];
}

id FPSpotlightQueryStringForFilename(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)MEMORY[0x1E4F28E78];
  id v5 = a2;
  id v6 = [v4 stringWithString:@"cdtw"];
  LODWORD(v4) = objc_msgSend(v5, "fp_isCJKLanguageIdentifier");

  if (v4) {
    [v6 appendString:@"s"];
  }
  uint64_t v7 = objc_msgSend(v3, "_fp_escapedStringForSearchQuery");
  uint64_t v8 = [NSString stringWithFormat:@"(kMDItemDisplayName == \"%@*\"%@)", v7, v6];

  return v8;
}

__CFString *FPSpotlightQueryStringForSearchQuery(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 spotlightQueryString];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    goto LABEL_26;
  }
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  if ([v3 trashedItemsMembership] == 2)
  {
    uint64_t v8 = @"==";
LABEL_7:
    uint64_t v9 = [NSString stringWithFormat:@"(kMDItemIsTrashed %@ \"1\"", v8];
    [v7 addObject:v9];

    goto LABEL_8;
  }
  if ([v3 trashedItemsMembership] == 1)
  {
    uint64_t v8 = @"!=";
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v10 = [v3 filename];

  if (v10)
  {
    uint64_t v11 = [v3 filename];
    uint64_t v12 = [v3 keyboardLanguage];
    uint64_t v13 = FPSpotlightQueryStringForFilename(v11, v12);

    [v7 addObject:v13];
  }
  uint64_t v14 = [v3 allowedContentTypes];

  if (v14)
  {
    uint64_t v15 = [v3 allowedContentTypes];
    uint64_t v16 = [v15 allObjects];
    uint64_t v17 = objc_msgSend(v16, "_fp_map:", &__block_literal_global_137);
    uint64_t v18 = objc_msgSend(v17, "_fp_componentsJoinedByOr");

    uint64_t v19 = [NSString stringWithFormat:@"(%@)", v18];
    [v7 addObject:v19];
  }
  if (a2)
  {
    uint64_t v20 = [v3 providerDomainID];

    if (v20)
    {
      uint64_t v21 = [v3 providerDomainID];
      uint64_t v22 = objc_msgSend(v21, "fp_toProviderID");

      uint64_t v23 = [NSString stringWithFormat:@"(kMDItemFileProviderID == \"%@\"", v22];
      [v7 addObject:v23];
      if (([v22 isEqualToString:@"com.apple.filesystems.UserFS.FileProvider"] & 1) == 0)
      {
        uint64_t v24 = NSString;
        uint64_t v25 = [v3 providerDomainID];
        uint64_t v26 = objc_msgSend(v25, "fp_toDomainIdentifier");
        int v27 = [v24 stringWithFormat:@"(FPDomainIdentifier == \"%@\"", v26];

        [v7 addObject:v27];
      }
    }
  }
  uint64_t v28 = [v3 scopeFragment];

  if (v28)
  {
    uint64_t v29 = NSString;
    BOOL v30 = [v3 scopeFragment];
    int v31 = [v29 stringWithFormat:@"(%@)", v30];

    [v7 addObject:v31];
  }
  if ([v3 shouldPerformSemanticSearch] && !objc_msgSend(v7, "count")) {
    [v7 addObject:@"(true)"];
  }
  if ([v7 count])
  {
    id v6 = [v7 componentsJoinedByString:@" && "];
  }
  else
  {
    id v6 = &stru_1EF68D1F8;
  }

LABEL_26:

  return v6;
}

id __FPSpotlightQueryStringForSearchQuery_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [&unk_1EF6C3A70 containsObject:v2];
  uint64_t v4 = @"kMDItemContentTypeTree";
  if (v3) {
    uint64_t v4 = @"kMDItemContentType";
  }
  id v5 = [NSString stringWithFormat:@"(%@ == \"%@\"", v4, v2];

  return v5;
}

id FPCacheForAnyDocumentRecentlyUsed()
{
  if (FPCacheForAnyDocumentRecentlyUsed_onceToken != -1) {
    dispatch_once(&FPCacheForAnyDocumentRecentlyUsed_onceToken, &__block_literal_global_161);
  }
  uint64_t v0 = (void *)FPCacheForAnyDocumentRecentlyUsed_cache;

  return v0;
}

uint64_t __FPCacheForAnyDocumentRecentlyUsed_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  uint64_t v1 = FPCacheForAnyDocumentRecentlyUsed_cache;
  FPCacheForAnyDocumentRecentlyUsed_cache = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

BOOL FPIsAnyDocumentRecentlyUsed(void *a1, void *a2, void *a3)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (![v5 count] && !objc_msgSend(v5, "count"))
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL FPIsAnyDocumentRecentlyUsed(NSArray<NSString *> *__strong, NSArray<NSString *> *__strong, NSArray<NSString *> *__strong)");
    [v28 handleFailureInFunction:v29, @"FPSpotlightQueryHelpers.m", 357, @"allowedFileTypes is empty, which is illegal." file lineNumber description];
  }
  uint64_t v8 = +[FPItemManager defaultManager];
  uint64_t v9 = (void *)[v8 newRecentsCollection];

  [v9 setAllowedFileTypes:v5];
  [v9 setExcludedFileTypes:v6];
  [v9 setAllowedProviderIdentifiers:v7];
  uint64_t v10 = [v9 underlyingQueryStringForMountPoint:@"FPQueryCollectionDefaultMountPointIdentifier"];
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x2050000000;
  uint64_t v11 = (void *)getCSSearchQueryContextClass_softClass_0;
  uint64_t v47 = getCSSearchQueryContextClass_softClass_0;
  if (!getCSSearchQueryContextClass_softClass_0)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    uint64_t v41 = (uint64_t)__getCSSearchQueryContextClass_block_invoke_0;
    __int16 v42 = &unk_1E5AF1950;
    uint64_t v43 = &v44;
    __getCSSearchQueryContextClass_block_invoke_0((uint64_t)&v39);
    uint64_t v11 = (void *)v45[3];
  }
  uint64_t v12 = v11;
  _Block_object_dispose(&v44, 8);
  id v13 = objc_alloc_init(v12);
  v54[0] = *MEMORY[0x1E4F28358];
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  [v13 setProtectionClasses:v14];

  [v13 setMaxCount:1];
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x2050000000;
  uint64_t v15 = (void *)getCSSearchQueryClass_softClass_0;
  uint64_t v47 = getCSSearchQueryClass_softClass_0;
  if (!getCSSearchQueryClass_softClass_0)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    uint64_t v41 = (uint64_t)__getCSSearchQueryClass_block_invoke_0;
    __int16 v42 = &unk_1E5AF1950;
    uint64_t v43 = &v44;
    __getCSSearchQueryClass_block_invoke_0((uint64_t)&v39);
    uint64_t v15 = (void *)v45[3];
  }
  uint64_t v16 = v15;
  _Block_object_dispose(&v44, 8);
  uint64_t v17 = (void *)[[v16 alloc] initWithQueryString:v10 context:v13];
  uint64_t v39 = 0;
  uint64_t v40 = (uint64_t)&v39;
  uint64_t v41 = 0x2020000000;
  LOBYTE(v42) = 0;
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __FPIsAnyDocumentRecentlyUsed_block_invoke;
  v38[3] = &unk_1E5AF40D0;
  v38[4] = &v44;
  [v17 setFoundItemsHandler:v38];
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  int v32 = __FPIsAnyDocumentRecentlyUsed_block_invoke_2;
  id v33 = &unk_1E5AF5378;
  uint64_t v36 = &v39;
  uint8_t v37 = &v44;
  id v19 = v10;
  id v34 = v19;
  uint64_t v20 = v18;
  id v35 = v20;
  [v17 setCompletionHandler:&v30];
  objc_msgSend(v17, "start", v30, v31, v32, v33);
  dispatch_time_t v21 = dispatch_time(0, 200000000);
  if (dispatch_semaphore_wait(v20, v21))
  {
    uint64_t v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint8_t buf = 138412802;
      id v49 = v5;
      __int16 v50 = 2112;
      id v51 = v6;
      __int16 v52 = 2112;
      id v53 = v7;
      _os_log_error_impl(&dword_1A33AE000, v22, OS_LOG_TYPE_ERROR, "[ERROR] Time-out occurred while testing if there are any recent documents with allowed file types %@ and excluded file types %@ and allowed FileProvider identifiers %@.", buf, 0x20u);
    }

    uint64_t v23 = FPCacheForAnyDocumentRecentlyUsed();
    uint64_t v24 = [v23 objectForKey:v19];
    char v25 = [v24 BOOLValue];
    *(unsigned char *)(v40 + 24) = v25;
  }
  BOOL v26 = *(unsigned char *)(v40 + 24) != 0;

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v39, 8);

  return v26;
}

void sub_1A3492554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __FPIsAnyDocumentRecentlyUsed_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

intptr_t __FPIsAnyDocumentRecentlyUsed_block_invoke_2(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(void *)(*(void *)(a1[7] + 8) + 24) != 0;
  id v2 = FPCacheForAnyDocumentRecentlyUsed();
  int v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24)];
  [v2 setObject:v3 forKey:a1[4]];

  uint64_t v4 = a1[5];

  return dispatch_semaphore_signal(v4);
}

void *__getMDItemExpirationDateSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CoreSpotlightLibrary_2();
  uint64_t result = dlsym(v2, "MDItemExpirationDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemExpirationDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSpotlightLibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  CoreSpotlightLibraryCore_frameworkLibrary_5 = result;
  return result;
}

void *__getMDQueryResultRelevanceSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)CoreSpotlightLibrary_2();
  uint64_t result = dlsym(v2, "MDQueryResultRelevance");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDQueryResultRelevanceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemLastUsedDateSymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)CoreSpotlightLibrary_2();
  uint64_t result = dlsym(v2, "MDItemLastUsedDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemLastUsedDateSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMDItemFileSizeSymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)CoreSpotlightLibrary_2();
  uint64_t result = dlsym(v2, "MDItemFileSize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDItemFileSizeSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A3493C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A34949F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3495198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1A3495334(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A3495E40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A3496154(_Unwind_Exception *a1)
{
  __fp_leave_section_Debug(v1 - 56);
  _Unwind_Resume(a1);
}

void sub_1A349656C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

id FPAbbreviatedArrayDescription(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 count];
  int v3 = NSString;
  if (v2 > 2)
  {
    uint64_t v4 = [v1 objectAtIndex:0];
    id v6 = [v1 objectAtIndex:1];
    id v5 = [v3 stringWithFormat:@"(%@, %@, %lu others)", v4, v6, objc_msgSend(v1, "count") - 1];
  }
  else
  {
    uint64_t v4 = [v1 componentsJoinedByString:@", "];
    id v5 = [v3 stringWithFormat:@"(%@)", v4];
  }

  return v5;
}

void sub_1A3498BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1A3498C94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34993D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1A34994B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34999C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1A349A568(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A349A82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A349D22C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A349D3E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A349D604(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __fpfs_lp_sandbox_extension_issue_file_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sandbox_extension_issue_file();
  return 0;
}

uint64_t __fpfs_lp_sandbox_check_block_invoke()
{
  return sandbox_check();
}

uint64_t __fpfs_lp_sandbox_check_by_audit_token_block_invoke()
{
  return sandbox_check_by_audit_token();
}

uint64_t fpfs_enable_fault_handling(int a1)
{
  if (a1) {
    int v1 = 1;
  }
  else {
    int v1 = 2;
  }
  int v3 = v1;
  return sysctlbyname("kern.vfsnspace", 0, 0, &v3, 4uLL);
}

uint64_t fpfs_enable_vnode_rapid_aging(int a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(void *)uint64_t v4 = 0x4400000001;
  if (a1) {
    int v1 = 1;
  }
  else {
    int v1 = 3;
  }
  int v3 = v1;
  return sysctl(v4, 2u, 0, 0, &v3, 4uLL);
}

void fpfs_allow_operation(int a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __fpfs_allow_operation_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v2 = a1;
  if (fpfs_allow_operation_onceToken != -1) {
    dispatch_once(&fpfs_allow_operation_onceToken, block);
  }
}

uint64_t __fpfs_allow_operation_block_invoke(uint64_t result)
{
  allowedOperations = *(_DWORD *)(result + 32);
  return result;
}

BOOL fpfs_operation_is_allowed(int a1)
{
  return (a1 & ~allowedOperations) == 0;
}

uint64_t fpfs_test_force_ondisk_docid_resolution()
{
  return 0;
}

uint64_t fpfs_test_trigger_purge(const char *a1)
{
  v2[0] = xmmword_1A34E4A88;
  v2[1] = unk_1A34E4A98;
  return fsctl(a1, 0xC0204A45uLL, v2, 0);
}

uint64_t fpfs_unload_hierarchy(char *a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  _OWORD v2[2] = __fpfs_unload_hierarchy_block_invoke;
  v2[3] = &__block_descriptor_40_e5_i8__0l;
  v2[4] = a1;
  return fpfs_chdir(a1, (uint64_t)v2);
}

uint64_t __fpfs_unload_hierarchy_block_invoke(uint64_t a1)
{
  _OWORD v2[2] = *(char **)MEMORY[0x1E4F143B8];
  v2[0] = *(char **)(a1 + 32);
  v2[1] = 0;
  return _recycle_recursive(v2);
}

uint64_t _recycle_recursive(char *const *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v1 = fts_open(a1, 2132, 0);
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  int v2 = v1;
  char v3 = 0;
  do
  {
    uint64_t v4 = fts_read(v2);
    if (!v4) {
      break;
    }
    if ((v3 & 1) == 0)
    {
      uint64_t v5 = fp_current_or_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        ino_t fts_ino = v4->fts_ino;
        *(_DWORD *)uint8_t buf = 134217984;
        ino_t v13 = fts_ino;
        _os_log_impl(&dword_1A33AE000, v5, OS_LOG_TYPE_INFO, "[INFO] Recursively calling F_RECYCLE below ino #%llu", buf, 0xCu);
      }
    }
    unsigned int fts_info = v4->fts_info;
    BOOL v8 = fts_info > 0xC;
    int v9 = (1 << fts_info) & 0x1140;
    BOOL v10 = v8 || v9 == 0;
    uint64_t v4 = v10 ? 0 : (FTSENT *)fpfs_openat(4294967294, v4->fts_path, 0, 0, 0, (uint64_t)&__block_literal_global_9_0);
    char v3 = 1;
  }
  while (!v4);
  fts_close(v2);
  return (uint64_t)v4;
}

uint64_t fpfs_funload_hierarchy(int a1)
{
  return fpfs_fchdir(a1, (uint64_t)&__block_literal_global_51);
}

uint64_t __fpfs_funload_hierarchy_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  long long v1 = xmmword_1E5AF5888;
  return _recycle_recursive((char *const *)&v1);
}

uint64_t fpfs_funload_file(int a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  bzero(v4, 0x400uLL);
  if ((fpfs_fgetpath(a1, (uint64_t)v4) & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  v3[0] = v4;
  v3[1] = 0;
  return _recycle_recursive(v3);
}

uint64_t fpfs_get_materialization_alignment()
{
  if (fpfs_get_materialization_alignment_once != -1) {
    dispatch_once(&fpfs_get_materialization_alignment_once, &__block_literal_global_6_0);
  }
  return fpfs_get_materialization_alignment_alignment;
}

void __fpfs_get_materialization_alignment_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  bzero(&v3, 0x878uLL);
  if (statfs(".", &v3) < 0)
  {
    fpfs_get_materialization_alignment_alignment = 0x10000;
    uint64_t v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __fpfs_get_materialization_alignment_block_invoke_cold_1();
    }
    goto LABEL_10;
  }
  unint64_t v0 = sysconf(29);
  if ((v0 & 0x8000000000000000) != 0)
  {
    fpfs_get_materialization_alignment_alignment = 0x10000;
    uint64_t v2 = fp_current_or_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __fpfs_get_materialization_alignment_block_invoke_cold_2();
    }
LABEL_10:

    return;
  }
  f_bsize_t size = v3.f_bsize;
  if (v0 > v3.f_bsize) {
    f_bsize_t size = v0;
  }
  fpfs_get_materialization_alignment_alignment = f_bsize;
}

uint64_t fpfs_is_vfs_ignore_permissions_iopolicy_set()
{
  uint64_t result = fpfs_supports_vfs_ignore_permissions_iopolicy();
  if (result)
  {
    setiopolicy_np(7, 0, 0);
    return getiopolicy_np(7, 0) == 1;
  }
  return result;
}

uint64_t fpfs_unset_vfs_ignore_permissions_iopolicy()
{
  uint64_t result = fpfs_supports_vfs_ignore_permissions_iopolicy();
  if (result)
  {
    return setiopolicy_np(7, 0, 0);
  }
  return result;
}

uint64_t fpfs_lp_fsctl(char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  uint64_t v8 = fsctl(a1, a2, a3, a4);
  if ((v8 & 0x80000000) == 0) {
    return v8;
  }
  if (*__error() != 63) {
    return v8;
  }
  if (!fpfs_supports_long_paths()) {
    return v8;
  }
  uint64_t v9 = fpfs_open_longpath(a1, 0x8000, 0);
  uint64_t v8 = v9;
  if ((v9 & 0x80000000) != 0) {
    return v8;
  }
  uint64_t v10 = ffsctl(v9, a2, a3, a4);
  int v11 = *__error();
  close(v8);
  *__error() = v11;
  return v10;
}

uint64_t ___recycle_recursive_block_invoke(int a1, int a2)
{
  return fcntl(a2, 84, 0);
}

void OUTLINED_FUNCTION_1_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

void sub_1A34A01F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_sync_exit(v23);
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1A34A0B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v32 - 176), 8);
  _FPRestorePersona(&a32);
  _Unwind_Resume(a1);
}

void sub_1A34A0E58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34A1254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A34A1900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A34A1F04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _FPRestorePersona((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1A34A2500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_1A34A2884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1A34A4D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A34A55E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A34A5A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

uint64_t FPDLifetimeServicingXPCInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6D1068];
}

uint64_t FPIndexingAssertionXPCInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6EE1E0];
}

uint64_t FPDAccessControlServicingXPCInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6EE240];
}

void __FPXVendorXPCInterface_block_invoke()
{
  v36[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6C62F8];
  long long v1 = (void *)FPXVendorXPCInterface_interface;
  FPXVendorXPCInterface_interface = v0;

  uint64_t v2 = (void *)MEMORY[0x1E4F29280];
  id v3 = (id)FPXVendorXPCInterface_interface;
  uint64_t v4 = [v2 interfaceWithProtocol:&unk_1EF6DB780];
  [v3 setInterface:v4 forSelector:sel_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler_ argumentIndex:1 ofReply:0];

  uint64_t v5 = FPXEnumeratorXPCInterface();
  [v3 setInterface:v5 forSelector:sel_fetchAndStartEnumeratingWithSettings_observer_request_completionHandler_ argumentIndex:0 ofReply:1];

  id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6DB780];
  [v3 setInterface:v6 forSelector:sel_listRemoteVersionsWithSettings_observer_request_completionHandler_ argumentIndex:1 ofReply:0];

  uint64_t v7 = FPXEnumeratorXPCInterface();
  [v3 setInterface:v7 forSelector:sel_listRemoteVersionsWithSettings_observer_request_completionHandler_ argumentIndex:0 ofReply:1];

  FPXSetOperationServiceOnXPCInterface((void *)FPXVendorXPCInterface_interface);
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  dispatch_semaphore_t v18 = (void *)FPXVendorXPCInterface_interface;
  id v19 = [v16 setByAddingObjectsFromArray:v17];
  [v18 setClasses:v19 forSelector:sel_valuesForAttributes_forItemID_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v20 = (void *)FPXVendorXPCInterface_interface;
  dispatch_time_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v20 setClasses:v23 forSelector:sel_bulkEvictItemsWithItemIDs_completionHandler_ argumentIndex:0 ofReply:0];

  uint64_t v24 = (void *)FPXVendorXPCInterface_interface;
  char v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_msgSend(v25, "setWithObjects:", v26, v27, v28, objc_opt_class(), 0);
  [v24 setClasses:v29 forSelector:sel_beginRequestWithDomain_alternateContentsDictionary_domainServicer_providerDomain_domainVersion_completionHandler_ argumentIndex:1 ofReply:0];

  uint64_t v30 = (void *)FPXVendorXPCInterface_interface;
  uint64_t v31 = FPDDomainServicingXPCInterface();
  [v30 setInterface:v31 forSelector:sel_beginRequestWithDomain_alternateContentsDictionary_domainServicer_providerDomain_domainVersion_completionHandler_ argumentIndex:2 ofReply:0];

  uint64_t v32 = (void *)FPXVendorXPCInterface_interface;
  id v33 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = objc_opt_class();
  id v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  [v32 setClasses:v35 forSelector:sel_fetchServicesForItemID_allowRestrictedSources_completionHandler_ argumentIndex:1 ofReply:1];
}

id FPSimulatorSupportInterface()
{
  if (FPSimulatorSupportInterface_once != -1) {
    dispatch_once(&FPSimulatorSupportInterface_once, &__block_literal_global_538);
  }
  uint64_t v0 = (void *)FPSimulatorSupportInterface_interface;

  return v0;
}

void __FPSimulatorSupportInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6EE360];
  long long v1 = (void *)FPSimulatorSupportInterface_interface;
  FPSimulatorSupportInterface_interface = v0;

  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6EE3C0];
  [(id)FPSimulatorSupportInterface_interface setInterface:v2 forSelector:sel_sim_registerMaterializationHandler_forURL_completionHandler_ argumentIndex:0 ofReply:0];
}

uint64_t fpfs_file_is_flocked(int a1)
{
  if (flock(a1, 6) < 0 && *__error() == 35) {
    return 1;
  }
  flock(a1, 8);
  return 0;
}

uint64_t fpfs_get_flock_type(int a1)
{
  if (!fpfs_file_is_flocked(a1)) {
    return 0;
  }
  if (flock(a1, 5) < 0 && *__error() == 35) {
    return 2;
  }
  flock(a1, 8);
  return 1;
}

uint64_t fpfs_serialize_tags(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1A6248870]();
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v5 = objc_opt_new();
  id v6 = objc_opt_new();
  if (v3[2](v3, &v17))
  {
    do
    {
      uint64_t v7 = [NSString stringWithUTF8String:v17];
      if (([v5 containsObject:v7] & 1) == 0)
      {
        [v5 addObject:v7];
        uint64_t v8 = [NSString stringWithFormat:@"%@\n%i", v7, v18];
        [v6 addObject:v8];
        *(unsigned char *)(a1 + 16) = v18;
      }
    }
    while ((v3[2](v3, &v17) & 1) != 0);
  }
  if ([v6 count])
  {
    uint64_t v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:0];
    uint64_t v10 = v9;
    if (v9 && (uint64_t v11 = malloc_type_malloc([v9 length], 0xC70D6277uLL), (*(void *)a1 = v11) != 0))
    {
      *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = [v10 length];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __fpfs_serialize_tags_block_invoke;
      void v16[3] = &__block_descriptor_40_e29_v40__0r_v8__NSRange_QQ_16_B32l;
      void v16[4] = a1;
      [v10 enumerateByteRangesUsingBlock:v16];
      int v12 = 0;
    }
    else
    {
      int v12 = 1;
    }

    unsigned int v13 = -1;
  }
  else
  {
    unsigned int v13 = 0;
    int v12 = 1;
  }

  if (v12) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

void *__fpfs_serialize_tags_block_invoke(uint64_t a1, const void *a2, uint64_t a3, size_t __n)
{
  return memcpy((void *)(**(void **)(a1 + 32) + a3), a2, __n);
}

uint64_t fpfs_deserialize_tags(void *a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1A6248870]();
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*a1 length:a1[1] freeWhenDone:0];
  if (![v5 length])
  {
    *__error() = 22;
    uint64_t v24 = 0xFFFFFFFFLL;
    goto LABEL_50;
  }
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  uint64_t v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v10 fromData:v5 error:0];
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:0];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v24 = 0xFFFFFFFFLL;
      goto LABEL_49;
    }
    id v25 = v11;
    id v26 = v3;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v27 = v25;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      long long v45 = v10;
      id v43 = v3;
      uint64_t v30 = *(void *)v50;
      while (1)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v50 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v47 = 0;
            uint64_t v48 = 0;
            id v33 = (char *)[v32 UTF8String];
            uint64_t v47 = (uint64_t)v33;
            if (!v33)
            {
              *__error() = 22;
              char v36 = 1;
              goto LABEL_44;
            }
            LOBYTE(v4_Block_object_dispose(&STACK[0x2D0], 8) = 1;
            uint64_t v34 = strrchr(v33, 10);
            if (v34)
            {
              char *v34 = 0;
              int v35 = v34[1];
              if ((v35 - 49) <= 6) {
                LOBYTE(v4_Block_object_dispose(&STACK[0x2D0], 8) = v35 - 48;
              }
            }
            if (((*((uint64_t (**)(id, uint64_t *))v26 + 2))(v26, &v47) & 1) == 0)
            {
              char v36 = 2;
LABEL_44:
              id v3 = v43;
              uint64_t v10 = v45;
LABEL_45:

              if (v36) {
                uint64_t v24 = 0xFFFFFFFFLL;
              }
              else {
                uint64_t v24 = 0;
              }

              goto LABEL_49;
            }
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (!v29)
        {
          char v36 = 0;
          goto LABEL_44;
        }
      }
    }
    char v36 = 0;
    goto LABEL_45;
  }
  id v12 = v11;
  unsigned int v13 = (uint64_t (**)(void, uint64_t *))v3;
  uint64_t v14 = [v12 objectForKeyedSubscript:@"v"];
  if (!v14
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v14 intValue] != 1)
  {
    *__error() = 22;
    uint64_t v24 = 0xFFFFFFFFLL;
    goto LABEL_39;
  }
  uint64_t v15 = [v12 objectForKeyedSubscript:@"t"];
  __int16 v42 = (void *)v15;
  if (!v15 || (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *__error() = 22;
    uint64_t v24 = 0xFFFFFFFFLL;
    goto LABEL_61;
  }
  uint64_t v44 = v10;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v16;
  uint64_t v39 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (!v39)
  {
    char v23 = 0;
    goto LABEL_57;
  }
  uint64_t v40 = v13;
  uint64_t v41 = *(void *)v50;
  uint64_t v46 = v4;
  while (2)
  {
    for (uint64_t j = 0; j != v39; ++j)
    {
      if (*(void *)v50 != v41) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * j);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *__error() = 22;
        char v23 = 1;
        unsigned int v13 = v40;
        goto LABEL_57;
      }
      id v19 = [v18 firstObject];
      uint64_t v20 = [v18 lastObject];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        *__error() = 22;
        char v23 = 1;
        unsigned int v13 = v40;
LABEL_56:

        uint64_t v4 = v46;
        goto LABEL_57;
      }
      char v21 = [v20 intValue];
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      id v22 = v19;
      uint64_t v47 = [v22 UTF8String];
      LOBYTE(v4_Block_object_dispose(&STACK[0x2D0], 8) = v21;
      unsigned int v13 = v40;
      if ((v40[2](v40, &v47) & 1) == 0)
      {
        char v23 = 2;
        goto LABEL_56;
      }

      uint64_t v4 = v46;
    }
    char v23 = 0;
    uint64_t v39 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v39) {
      continue;
    }
    break;
  }
LABEL_57:

  if (v23) {
    uint64_t v24 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v24 = 0;
  }
  uint64_t v10 = v44;
LABEL_61:

LABEL_39:
LABEL_49:

LABEL_50:

  return v24;
}

void fpfs_user_package_extension_list_init(void *a1)
{
  id v1 = a1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __fpfs_user_package_extension_list_init_block_invoke;
  block[3] = &unk_1E5AF0FF0;
  id v5 = v1;
  uint64_t v2 = fpfs_user_package_extension_list_init_once;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&fpfs_user_package_extension_list_init_once, block);
  }
}

uint64_t __fpfs_user_package_extension_list_init_block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  if (*(void *)(a1 + 32)) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = fpfs_user_package_default_extension_list;
  }
  uint64_t v4 = [v2 initWithArray:v3];
  id v5 = (void *)allowListedPackageExtensions;
  allowListedPackageExtensions = v4;

  uint64_t v6 = FPServerPackageExtensions();
  uint64_t v7 = (void *)remotePackageExtensions;
  remotePackageExtensions = v6;

  userPackageExtensions = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);

  return MEMORY[0x1F41817F8]();
}

void fpfs_icd_package_extension_list_reload()
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.fileproviderd"];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v1 = [v4 stringArrayForKey:@"iCDPackageExtensions"];
  uint64_t v2 = [v0 initWithArray:v1];

  os_unfair_lock_lock((os_unfair_lock_t)&iCDPackageExtensionsLock);
  uint64_t v3 = (void *)iCDPackageExtensions;
  iCDPackageExtensions = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)&iCDPackageExtensionsLock);
}

void fpfs_icd_package_extension_list_init()
{
  if (fpfs_icd_package_extension_list_init_once != -1) {
    dispatch_once(&fpfs_icd_package_extension_list_init_once, &__block_literal_global_54);
  }
}

uint64_t fpfs_user_package_extension_list_contains(unsigned char *a1)
{
  id v1 = _getExtensionString(a1);
  if (v1)
  {
    fpfs_user_package_extension_list_init(0);
    id v2 = (id)userPackageExtensions;
    objc_sync_enter(v2);
    if (([(id)allowListedPackageExtensions containsObject:v1] & 1) != 0
      || ([(id)remotePackageExtensions containsObject:v1] & 1) != 0)
    {
      uint64_t v3 = 1;
    }
    else
    {
      uint64_t v3 = [(id)userPackageExtensions containsObject:v1];
    }
    objc_sync_exit(v2);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1A34A78A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _getExtensionString(unsigned char *a1)
{
  id v1 = 0;
  if (a1)
  {
    id v2 = *a1 == 46 ? a1 + 1 : a1;
    if (*v2 && *v2 != 46)
    {
      uint64_t v3 = objc_msgSend(NSString, "stringWithUTF8String:");
      id v1 = [v3 lowercaseString];
    }
  }

  return v1;
}

uint64_t fpfs_icd_package_extension_list_contains(unsigned char *a1)
{
  id v1 = _getExtensionString(a1);
  if (v1)
  {
    if (fpfs_icd_package_extension_list_init_once != -1) {
      dispatch_once(&fpfs_icd_package_extension_list_init_once, &__block_literal_global_54);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&iCDPackageExtensionsLock);
    uint64_t v2 = [(id)iCDPackageExtensions containsObject:v1];
    os_unfair_lock_unlock((os_unfair_lock_t)&iCDPackageExtensionsLock);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void fpfs_user_package_extension_list_insert(unsigned char *a1)
{
  if ((fpfs_user_package_extension_list_contains(a1) & 1) == 0)
  {
    uint64_t v2 = _getExtensionString(a1);
    if (v2)
    {
      id v4 = v2;
      id v3 = (id)userPackageExtensions;
      objc_sync_enter(v3);
      [(id)userPackageExtensions addObject:v4];
      objc_sync_exit(v3);

      uint64_t v2 = v4;
    }
  }
}

void sub_1A34A7A60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void fpfs_user_package_extension_list_remove(unsigned char *a1)
{
  id v1 = _getExtensionString(a1);
  if (v1)
  {
    id v3 = v1;
    fpfs_user_package_extension_list_init(0);
    id v2 = (id)userPackageExtensions;
    objc_sync_enter(v2);
    [(id)userPackageExtensions removeObject:v3];
    objc_sync_exit(v2);

    id v1 = v3;
  }
}

void sub_1A34A7AF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _t_fpfs_user_package_clear()
{
  fpfs_user_package_extension_list_init(0);
  id obj = (id)userPackageExtensions;
  objc_sync_enter(obj);
  [(id)userPackageExtensions removeAllObjects];
  objc_sync_exit(obj);
}

void sub_1A34A7B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A34A7E00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34A7E80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34A7F70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id FPFileMetadataCopyLastUsedDate(int a1, void *a2)
{
  v6[0] = 0;
  v6[1] = 0;
  if ((fpfs_get_last_use_date(a1, v6, 1) & 0x80000000) != 0)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      id v3 = 0;
      *a2 = v4;
      goto LABEL_9;
    }
  }
  else
  {
    if (v6[0])
    {
      id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v6[0]];
      goto LABEL_9;
    }
    if (a2)
    {
      id v3 = 0;
      *a2 = 0;
      goto LABEL_9;
    }
  }
  id v3 = 0;
LABEL_9:

  return v3;
}

id FPFileMetadataCopyLastUsedDateAtURL(void *a1, void *a2)
{
  int v3 = open((const char *)[a1 fileSystemRepresentation], 2097156);
  if (v3 < 0)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      id v5 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    int v4 = v3;
    id v5 = FPFileMetadataCopyLastUsedDate(v3, a2);
    close(v4);
  }

  return v5;
}

BOOL FPFileMetadataSetLastUsedDate(int a1, void *a2, void *a3)
{
  [a2 timeIntervalSince1970];
  v9[0] = (uint64_t)v5;
  v9[1] = 0;
  int use_date = fpfs_set_last_use_date(a1, v9, 1);
  int v7 = use_date;
  if (a3 && use_date < 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7 >= 0;
}

void FPSetLastUsedDateAtURL(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  uint64_t v6 = (char *)[v5 fileSystemRepresentation];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __FPSetLastUsedDateAtURL_block_invoke;
  uint64_t v16 = &unk_1E5AF5E48;
  id v17 = v4;
  id v7 = v5;
  id v18 = v7;
  id v8 = v4;
  if ((fpfs_open(v6, 0x200002u, 0, 2, (uint64_t)&v13) & 0x80000000) != 0)
  {
    uint64_t v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_msgSend(v7, "path", v13, v14, v15, v16, v17, v18);
      uint64_t v11 = __error();
      id v12 = strerror(*v11);
      *(_DWORD *)uint8_t buf = 138412546;
      uint64_t v20 = v10;
      __int16 v21 = 2080;
      id v22 = v12;
      _os_log_impl(&dword_1A33AE000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] can't set last used date on %@: %s", buf, 0x16u);
    }
  }
}

uint64_t __FPSetLastUsedDateAtURL_block_invoke(uint64_t a1, int a2)
{
  id v4 = *(void **)(a1 + 32);
  id v10 = 0;
  BOOL v5 = FPFileMetadataSetLastUsedDate(a2, v4, &v10);
  id v6 = v10;
  if (v5)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __FPSetLastUsedDateAtURL_block_invoke_cold_1(a1, (uint64_t)v6, v8);
    }

    uint64_t v7 = 0xFFFFFFFFLL;
  }

  return v7;
}

id FPFileMetadataCopyFavoriteRank(int a1, void *a2)
{
  unint64_t v6 = 0;
  if ((fpfs_get_favorite_rank(a1, &v6) & 0x80000000) != 0)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      id v3 = 0;
      *a2 = v4;
      goto LABEL_9;
    }
  }
  else
  {
    if (v6)
    {
      id v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      goto LABEL_9;
    }
    if (a2)
    {
      id v3 = 0;
      *a2 = 0;
      goto LABEL_9;
    }
  }
  id v3 = 0;
LABEL_9:

  return v3;
}

BOOL FPFileMetadataSetFavoriteRank(int a1, void *a2, void *a3)
{
  int v4 = fpfs_set_favorite_rank(a1, [a2 unsignedLongLongValue]);
  int v5 = v4;
  if (a3 && v4 < 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5 >= 0;
}

id FPFileMetadataCopyTagData(int a1, void *a2)
{
  id v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v11[0] = 0;
  v11[1] = 0;
  if ((int)fpfs_get_finder_info(a1, (uint64_t)v11) < 0) {
    int v4 = 0;
  }
  else {
    int v4 = v11;
  }
  if ((fpfs_get_tag_data(a1, (uint64_t)v4, (uint64_t)&v12) & 0x80000000) != 0)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      uint64_t v7 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    if (v13)
    {
      int v5 = [MEMORY[0x1E4F1CA48] array];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      uint64_t v9[2] = __FPFileMetadataCopyTagData_block_invoke;
      v9[3] = &unk_1E5AF5E70;
      id v10 = v5;
      id v6 = v5;
      fpfs_deserialize_tags(&v12, v9);
      fpfs_free_tag_data(&v12);
      uint64_t v7 = FPGetTagsDataForTags(v6);

      goto LABEL_12;
    }
    if (a2)
    {
      uint64_t v7 = 0;
      *a2 = 0;
      goto LABEL_12;
    }
  }
  uint64_t v7 = 0;
LABEL_12:

  return v7;
}

uint64_t __FPFileMetadataCopyTagData_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = [FPTag alloc];
  int v5 = [NSString stringWithUTF8String:*(void *)a2];
  id v6 = [(FPTag *)v4 initWithLabel:v5 color:*(unsigned __int8 *)(a2 + 8)];

  [*(id *)(a1 + 32) addObject:v6];
  return 1;
}

BOOL FPFileMetadataSetTagData(int a1, void *a2, void *a3)
{
  id v5 = a2;
  memset(v17, 0, sizeof(v17));
  id v6 = FPGetTagsFromTagsData(v5);
  v16[0] = 0;
  v16[1] = 0;
  v15[0] = 0;
  v15[1] = 0;
  if (![v6 count])
  {
    int v8 = fpfs_set_tag_data(a1, 0, (uint64_t)v16, (uint64_t)v15);
    if (v8 < 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v14[0] = 0;
  v14[1] = v14;
  void v14[2] = 0x2020000000;
  v14[3] = 0;
  uint64_t v7 = [v6 count];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __FPFileMetadataSetTagData_block_invoke;
  v10[3] = &unk_1E5AF5E98;
  id v12 = v14;
  uint64_t v13 = v7;
  id v11 = v6;
  int v8 = fpfs_serialize_tags((uint64_t)v17, v10);
  if ((v8 & 0x80000000) == 0) {
    int v8 = fpfs_set_tag_data(a1, (uint64_t)v17, (uint64_t)v16, (uint64_t)v15);
  }
  if (v17[0]) {
    free(v17[0]);
  }

  _Block_object_dispose(v14, 8);
  if ((v8 & 0x80000000) == 0) {
LABEL_7:
  }
    int v8 = fpfs_set_finder_info(a1, (uint64_t)v16, (uint64_t)v15);
LABEL_8:
  if (a3 && v8 < 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8 >= 0;
}

void sub_1A34A8D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL __FPFileMetadataSetTagData_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  if (v4 != v2)
  {
    uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(v3 + 24)];
    id v8 = [v7 label];
    *(void *)a2 = [v8 UTF8String];

    uint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x2D0], 8) = [v9 color];

    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return v4 != v2;
}

id FPFileMetadataCopyCollaborationIdentifier(int a1)
{
  id v1 = fpfs_copy_collaboration_identifier(a1);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = [NSString stringWithUTF8String:v1];
    free(v2);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void FPFileProviderServiceEndpointCreatingForItemAtURL(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke;
  v15[3] = &unk_1E5AF2948;
  id v5 = v4;
  id v17 = v5;
  id v6 = v3;
  id v16 = v6;
  id v7 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:v15];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2;
  void v11[3] = &unk_1E5AF5ED0;
  id v12 = v7;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  [v10 FPFileProviderServiceEndpointCreatingForItemAtURL:v9 completionHandler:v11];
}

void __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 40);
  FPProviderNotFoundErrorForURL(*(void *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, id))(v8 + 16))(v8, 0, 0, 0, v9);
}

void __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  unint64_t v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a5;
  if (v9 | v12)
  {
    id v13 = fp_current_or_default_log();
    id v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2_cold_1(v10, a1, v14);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2_cold_2(a1, v12, v14);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    [*(id *)(a1 + 32) callNextOverrides];
  }
}

void FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke;
  v15[3] = &unk_1E5AF2948;
  id v5 = v4;
  id v17 = v5;
  id v6 = v3;
  id v16 = v6;
  id v7 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:v15];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2;
  void v11[3] = &unk_1E5AF5ED0;
  id v12 = v7;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  id v10 = v7;
  [v10 FPFileProviderServiceEndpointCreatingForItemAtURL:v9 synchronously:1 completionHandler:v11];
}

void __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    FPProviderNotFoundErrorForURL(*(void *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, void, id))(v8 + 16))(v8, 0, 0, 0, v9);
  }
}

void __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  unint64_t v9 = a2;
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = a5;
  if (v9 | v12)
  {
    id v13 = fp_current_or_default_log();
    id v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_1();
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_2(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    [*(id *)(a1 + 32) callNextOverrides];
  }
}

void FPFetchServiceEndpointCreatorForItemAtURL(void *a1, int a2, void *a3)
{
  if (a2) {
    FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously(a1, a3);
  }
  else {
    FPFileProviderServiceEndpointCreatingForItemAtURL(a1, a3);
  }
}

void FPFetchServiceEndpointCreatorByNameForItemAtURL(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  id v32 = 0;
  id v31 = 0;
  [v7 getResourceValue:&v32 forKey:@"FPOriginalDocumentURL" error:&v31];
  id v10 = v32;
  id v11 = v31;
  if (v11)
  {
    unint64_t v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      FPFetchServiceEndpointCreatorByNameForItemAtURL_cold_1((uint64_t)v10);
    }
  }
  if (v10)
  {
    id v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint8_t buf = 138412546;
      id v34 = v10;
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_impl(&dword_1A33AE000, v13, OS_LOG_TYPE_INFO, "[INFO] FPFetchServiceEndpointCreatorByNameForItemAtURL substituting %@ as original URL to %@", buf, 0x16u);
    }

    id v14 = v10;
    id v7 = v14;
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke;
  void v26[3] = &unk_1E5AF5F20;
  id v15 = v7;
  id v27 = v15;
  char v30 = a3;
  id v16 = v9;
  id v28 = v8;
  id v29 = v16;
  id v17 = v8;
  id v18 = +[FPFrameworkOverridesIterator newIteratorWithNotFoundHandler:v26];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke_3;
  v22[3] = &unk_1E5AF5F48;
  id v23 = v18;
  id v24 = v15;
  id v25 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v18;
  [v21 FPFileProviderServiceEndpointCreatingWithName:v17 itemAtURL:v20 synchronously:a3 completionHandler:v22];
}

void __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  int v4[2] = __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke_2;
  v4[3] = &unk_1E5AF5EF8;
  id v6 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  if (v3) {
    FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously(v2, v4);
  }
  else {
    FPFileProviderServiceEndpointCreatingForItemAtURL(v2, v4);
  }
}

void __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      while (2)
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v16), "isEqualToString:", *(void *)(a1 + 32), (void)v18))
          {
            (*(void (**)(void, id, void (**)(void), void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v9, v11, 0);
            goto LABEL_13;
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    v11[2](v11);
    uint64_t v17 = *(void *)(a1 + 40);
    FPNotSupportedError();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, void, id))(v17 + 16))(v17, 0, 0, v12);
LABEL_13:
  }
}

void __FPFetchServiceEndpointCreatorByNameForItemAtURL_block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7 = a2;
  id v8 = a3;
  unint64_t v9 = a4;
  if (v7 | v9)
  {
    id v10 = fp_current_or_default_log();
    id v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_1();
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_2(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    [*(id *)(a1 + 32) callNextOverrides];
  }
}

void __FILEPROVIDER_BAD_DOMAIN_VERSION__(void *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  fp_simulate_crash(@"Domain %@ returned an inconsistent domain version %@, previously known version was %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v5);
  uint64_t v15 = fp_current_or_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)uint8_t buf = 138412802;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_fault_impl(&dword_1A33AE000, v15, OS_LOG_TYPE_FAULT, "[SIMCRASH] Domain %@ returned an inconsistent domain version %@, previously known version was %@", buf, 0x20u);
  }
}

void sub_1A34AAE64(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __AppleAccountLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleAccountLibraryCore_frameworkLibrary = result;
  return result;
}

id fp_extension_log()
{
  if (fp_extension_log_once != -1) {
    dispatch_once(&fp_extension_log_once, &__block_literal_global_56);
  }
  id v0 = (void *)fp_extension_log_logger;

  return v0;
}

uint64_t __fp_extension_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.FileProvider", "extension");
  uint64_t v1 = fp_extension_log_logger;
  fp_extension_log_logger = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1A34AE500(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A34AF0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void OUTLINED_FUNCTION_2_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1A34AF744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void __FILEPROVIDER_UNSUPPORTED_ERROR__(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    id v5 = +[FPXPCSanitizer permittedErrorDomains];
    id v6 = [v5 componentsJoinedByString:@", "];
    int v7 = 134218754;
    uint64_t v8 = a2;
    __int16 v9 = 2114;
    id v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2082;
    uint64_t v14 = "__FILEPROVIDER_UNSUPPORTED_ERROR__";
    _os_log_fault_impl(&dword_1A33AE000, v4, OS_LOG_TYPE_FAULT, "[CRIT] Provider returned error %ld from domain %{public}@ which is unsupported. Supported error domains are %{public}@. Break on %{public}s to find this.", (uint8_t *)&v7, 0x2Au);
  }
}

id FPLocalizedStringWithKeyAndVariant(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __int16 v9 = FPLocalizedStringWithKeyAndVariantShared(a1, a2, a3, a4, a5, &__block_literal_global_306, (uint64_t)&a9);

  return v9;
}

id FPLocalizedStringWithKeyAndVariantLiteral(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __FPLocalizedStringWithKeyAndVariantLiteral_block_invoke;
  void v17[3] = &unk_1E5AF6328;
  __int16 v18 = @"DomainDisabled_%@";
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)MEMORY[0x1A6248B00](v17);
  uint64_t v15 = FPLocalizedStringWithKeyAndVariantShared(0, @"DomainDisabled_%@", v13, v12, v11, v14, (uint64_t)&a9);

  return v15;
}

id __FPLocalizedStringWithKeyAndVariant_block_invoke(uint64_t a1, void *a2)
{
  return FPLocalizedErrorStringForKey(a2);
}

id FPLocalizedStringWithKeyAndVariantShared(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = a6;
  id v17 = a5;
  __int16 v18 = [a1 stringByAppendingString:v13];
  if (!v18)
  {
    __int16 v20 = 0;
    if (!a5) {
      goto LABEL_9;
    }
LABEL_7:
    if (!v20)
    {
      id v21 = [v14 stringByAppendingString:@".f"];
      __int16 v20 = _FPLocalizedStringWithKeyAndVariant(v13, v21, v15);
    }
    goto LABEL_9;
  }
  if (a5)
  {
    id v19 = [v14 stringByAppendingString:@".f"];
    __int16 v20 = _FPLocalizedStringNoFallbackWithKeyAndVariant(v18, v19, v15);

    if (v20) {
      goto LABEL_12;
    }
  }
  __int16 v20 = _FPLocalizedStringNoFallbackWithKeyAndVariant(v18, v14, v15);
  if (a5) {
    goto LABEL_7;
  }
LABEL_9:
  if (!v20)
  {
    __int16 v20 = _FPLocalizedStringWithKeyAndVariant(v13, v14, v15);
    if (!v20)
    {
      __int16 v20 = v16[2](v16, v13, a7);
    }
  }
LABEL_12:
  uint64_t v22 = [NSString stringWithFormat:@"%@", v20];
  uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", v22, v17);

  return v23;
}

id _FPLocalizedStringNoFallbackWithKeyAndVariant(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v7
    || ([NSString stringWithFormat:@"%@%@(%@)", v5, v6, v7],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        FPLocalizedErrorStringForKey(v8),
        __int16 v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    id v10 = [NSString stringWithFormat:@"%@%@(*)", v5, v6];
    __int16 v9 = FPLocalizedErrorStringForKey(v10);
  }

  return v9;
}

id _FPLocalizedStringWithKeyAndVariant(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = _FPLocalizedStringNoFallbackWithKeyAndVariant(v5, v6, v7);
  __int16 v9 = (void *)v8;
  if (v7 && !v8)
  {
    id v10 = [NSString stringWithFormat:@"%@(%@)", v6, v7];
    __int16 v9 = FPLocalizedErrorStringForKey(v10);
  }
  if (v6 && !v9)
  {
    if ([v6 isEqualToString:&stru_1EF68D1F8])
    {
      __int16 v9 = 0;
    }
    else
    {
      id v11 = [NSString stringWithFormat:@"%@%@", v5, v6];
      __int16 v9 = FPLocalizedErrorStringForKey(v11);
    }
  }

  return v9;
}

id __FPLocalizedStringWithKeyAndVariantLiteral_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return FPLocalizedErrorStringForKeyLiteral(*(void **)(a1 + 32), a3);
}

id FPGetTagsDataForTags(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 count])
  {
    uint64_t v2 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v15 = v1;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          __int16 v9 = [v8 label];
          v22[0] = v9;
          id v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "color"));
          v22[1] = v10;
          id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
          [v2 addObject:v11];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v23 count:16];
      }
      while (v5);
    }

    v20[0] = @"v";
    v20[1] = @"t";
    v21[0] = &unk_1EF6C3950;
    v21[1] = v2;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    id v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];

    id v1 = v15;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1C9B8] data];
  }

  return v13;
}

id FPGetTagsFromTagsData(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    uint64_t v2 = objc_opt_new();
    void v16[2] = 0;
    id v3 = v1;
    v16[0] = [v3 bytes];
    v16[1] = [v3 length];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __FPGetTagsFromTagsData_block_invoke;
    v14[3] = &unk_1E5AF5E70;
    id v4 = v2;
    id v15 = v4;
    if ((fpfs_deserialize_tags(v16, v14) & 0x80000000) != 0)
    {
      uint64_t v6 = fp_current_or_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        FPGetTagsFromTagsData_cold_2(v6);
      }

      id v7 = v3;
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v8 = (uint64_t (*)(id))getMDPropertyCopyDecodedUserTagsSymbolLoc_ptr;
      id v21 = getMDPropertyCopyDecodedUserTagsSymbolLoc_ptr;
      if (!getMDPropertyCopyDecodedUserTagsSymbolLoc_ptr)
      {
        void v16[3] = MEMORY[0x1E4F143A8];
        void v16[4] = 3221225472;
        void v16[5] = __getMDPropertyCopyDecodedUserTagsSymbolLoc_block_invoke;
        void v16[6] = &unk_1E5AF1950;
        long long v17 = &v18;
        __int16 v9 = (void *)MetadataUtilitiesLibrary_1();
        id v10 = dlsym(v9, "MDPropertyCopyDecodedUserTags");
        *(void *)(v17[1] + 24) = v10;
        getMDPropertyCopyDecodedUserTagsSymbolLoc_ptr = *(_UNKNOWN **)(v17[1] + 24);
        uint64_t v8 = (uint64_t (*)(id))v19[3];
      }
      _Block_object_dispose(&v18, 8);
      if (!v8) {
        FPGetTagsFromTagsData_cold_1();
      }
      id v11 = (void *)v8(v7);
      id v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "fp_map:", &__block_literal_global_59);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = v4;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_1A34B2960(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __FPGetTagsFromTagsData_block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [FPTag alloc];
  id v5 = [NSString stringWithUTF8String:*(void *)a2];
  uint64_t v6 = [(FPTag *)v4 initWithLabel:v5 color:*(unsigned __int8 *)(a2 + 8)];

  [*(id *)(a1 + 32) addObject:v6];
  return 1;
}

void FPFilterActionsForDroppingItems(void *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = +[FPFrameworkOverridesIterator allOverrides];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([v13 FPFilterActions:v7 forDroppingItems:v5 underItem:v6] & 1) != 0)
      {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t FPAreUTIsImportable(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = +[FPFrameworkOverridesIterator allOverrides];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ![v10 FPAreUTIsImportable:v3 toFolderItem:v4])
        {
          uint64_t v11 = 0;
          goto LABEL_12;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 1;
LABEL_12:

  return v11;
}

id FPServerPackageExtensions()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  os_log_t v0 = +[FPFrameworkOverridesIterator allOverrides];
  uint64_t v1 = (void *)[v0 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v1)
  {
    uint64_t v2 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v1; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v7 != v2) {
          objc_enumerationMutation(v0);
        }
        id v4 = *(void **)(*((void *)&v6 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v1 = [v4 FPServerPackageExtensions];
          goto LABEL_11;
        }
      }
      uint64_t v1 = (void *)[v0 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v1) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v1;
}

void fp_dispatch_group_async_with_logs(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = a1;
  long long v8 = fpfs_current_log();
  uint64_t section = __fp_create_section();
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    fp_dispatch_async_with_logs_cold_1(v5);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __fp_dispatch_group_async_with_logs_block_invoke;
  v14[3] = &unk_1E5AF32B0;
  id v15 = v8;
  long long v16 = v5;
  id v17 = v6;
  uint64_t v18 = section;
  id v11 = v6;
  uint64_t v12 = v5;
  id v13 = v8;
  dispatch_group_async(v7, v12, v14);
}

void __fp_dispatch_group_async_with_logs_block_invoke(uint64_t a1)
{
  uint64_t v2 = fpfs_adopt_log(*(void **)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = v2;
  id v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __fp_dispatch_async_with_logs_block_invoke_cold_1((uint64_t)&v4, a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  __fp_leave_section_Debug((uint64_t)&v4);
  __fp_pop_log(&v5);
}

void sub_1A34B2FAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_pop_log((void **)va);
  _Unwind_Resume(a1);
}

FPTag *__FPGetTagsFromTagsDataInOnDiskEncoding_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned __int8 v9 = 0;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v3 = (uint64_t (*)(id, unsigned __int8 *))getMDPropertyCopyUserTagNameSymbolLoc_ptr_0;
  uint64_t v18 = getMDPropertyCopyUserTagNameSymbolLoc_ptr_0;
  if (!getMDPropertyCopyUserTagNameSymbolLoc_ptr_0)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __getMDPropertyCopyUserTagNameSymbolLoc_block_invoke_0;
    id v13 = &unk_1E5AF1950;
    long long v14 = &v15;
    uint64_t v4 = (void *)MetadataUtilitiesLibrary_1();
    void v16[3] = (uint64_t)dlsym(v4, "MDPropertyCopyUserTagName");
    getMDPropertyCopyUserTagNameSymbolLoc_ptr_0 = *(_UNKNOWN **)(v14[1] + 24);
    id v3 = (uint64_t (*)(id, unsigned __int8 *))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v3) {
    __FPGetTagsFromTagsDataInOnDiskEncoding_block_invoke_cold_1();
  }
  id v5 = (void *)v3(v2, &v9);
  if (v5)
  {
    id v6 = [FPTag alloc];
    long long v7 = [(FPTag *)v6 initWithLabel:v5 color:v9];
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

void sub_1A34B3120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMDPropertyCopyDecodedUserTagsSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)MetadataUtilitiesLibrary_1();
  uint64_t result = dlsym(v2, "MDPropertyCopyDecodedUserTags");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDPropertyCopyDecodedUserTagsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MetadataUtilitiesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  MetadataUtilitiesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getMDPropertyCopyUserTagNameSymbolLoc_block_invoke_0(uint64_t a1)
{
  id v2 = (void *)MetadataUtilitiesLibrary_1();
  uint64_t result = dlsym(v2, "MDPropertyCopyUserTagName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMDPropertyCopyUserTagNameSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A34B33B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34B367C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A34B39C4(_Unwind_Exception *exception_object)
{
}

void sub_1A34B3A50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34B468C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A34B46F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_13(id a1)
{
  return a1;
}

void sub_1A34B5F14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1A34B6458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __CoreSpotlightLibraryCore_block_invoke_6()
{
  uint64_t result = _sl_dlopen();
  CoreSpotlightLibraryCore_frameworkLibrary_6 = result;
  return result;
}

id FPDictFromVendorItem(uint64_t a1, uint64_t a2)
{
  return +[FPItemToURLResourcesConverter dictionaryFromItem:a1 requestedKeys:a2];
}

id FPItemPropertyNamesByURLResourceKey()
{
  if (FPItemPropertyNamesByURLResourceKey_once != -1) {
    dispatch_once(&FPItemPropertyNamesByURLResourceKey_once, &__block_literal_global_62);
  }
  os_log_t v0 = (void *)FPItemPropertyNamesByURLResourceKey_itemPropertyNamesByURLKey;

  return v0;
}

void __FPItemPropertyNamesByURLResourceKey_block_invoke()
{
  v15[26] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1C6C8];
  v14[0] = *MEMORY[0x1E4F1C6E8];
  v14[1] = v0;
  v15[0] = @"filename";
  v15[1] = @"displayName";
  uint64_t v1 = *MEMORY[0x1E4F1C540];
  void v14[2] = *MEMORY[0x1E4F1C5F8];
  v14[3] = v1;
  void v15[2] = @"documentSize";
  v15[3] = @"creationDate";
  uint64_t v2 = *MEMORY[0x1E4F1C528];
  void v14[4] = *MEMORY[0x1E4F1C530];
  v14[5] = v2;
  void v15[4] = @"contentModificationDate";
  v15[5] = @"lastUsedDate";
  uint64_t v3 = *MEMORY[0x1E4F1C6A8];
  v14[6] = *MEMORY[0x1E4F1C668];
  v14[7] = v3;
  v15[6] = @"fp_isReadable";
  v15[7] = @"fp_isWritable";
  uint64_t v4 = *MEMORY[0x1E4F1C798];
  v14[8] = *MEMORY[0x1E4F1C790];
  v14[9] = v4;
  v15[8] = @"isUploaded";
  v15[9] = @"isUploading";
  uint64_t v5 = *MEMORY[0x1E4F1C758];
  v14[10] = *MEMORY[0x1E4F1C7A0];
  v14[11] = v5;
  v15[10] = @"uploadingError";
  v15[11] = @"fp_downloadingStatus";
  uint64_t v6 = *MEMORY[0x1E4F1C740];
  v14[12] = *MEMORY[0x1E4F1C778];
  v14[13] = v6;
  v15[12] = @"isDownloading";
  v15[13] = @"downloadingError";
  uint64_t v7 = *MEMORY[0x1E4F1C7B0];
  v14[14] = *MEMORY[0x1E4F1C788];
  v14[15] = v7;
  v15[14] = @"isShared";
  v15[15] = @"fp_sharingCurrentUserRole";
  uint64_t v8 = *MEMORY[0x1E4F1C7D0];
  v14[16] = *MEMORY[0x1E4F1C7A8];
  v14[17] = v8;
  v15[16] = @"fp_sharingCurrentUserPermissions";
  v15[17] = @"sharingPermissions";
  uint64_t v9 = *MEMORY[0x1E4F1C7B8];
  v14[18] = *MEMORY[0x1E4F1C7C0];
  v14[19] = v9;
  v15[18] = @"ownerNameComponents";
  v15[19] = @"mostRecentEditorNameComponents";
  uint64_t v10 = *MEMORY[0x1E4F1C768];
  v14[20] = *MEMORY[0x1E4F1C690];
  v14[21] = v10;
  v15[20] = @"fp_isUbiquitous";
  v15[21] = @"hasUnresolvedConflicts";
  uint64_t v11 = *MEMORY[0x1E4F1C738];
  v14[22] = *MEMORY[0x1E4F1C730];
  v14[23] = v11;
  v15[22] = @"containerDisplayName";
  v15[23] = @"isDownloadRequested";
  v14[24] = *MEMORY[0x1E4F1C780];
  v14[25] = @"NSFileProviderDomainIdentifierKey";
  v15[24] = @"isExcludedFromSync";
  v15[25] = @"providerDomainID";
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:26];
  id v13 = (void *)FPItemPropertyNamesByURLResourceKey_itemPropertyNamesByURLKey;
  FPItemPropertyNamesByURLResourceKey_itemPropertyNamesByURLKey = v12;
}

id FPURLResourceKeysByItemPropertyNames()
{
  if (FPURLResourceKeysByItemPropertyNames_once != -1) {
    dispatch_once(&FPURLResourceKeysByItemPropertyNames_once, &__block_literal_global_276);
  }
  uint64_t v0 = (void *)FPURLResourceKeysByItemPropertyNames_urlResourceKeysByItemPropertyNames;

  return v0;
}

void __FPURLResourceKeysByItemPropertyNames_block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = FPItemPropertyNamesByURLResourceKey();
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v0, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v2, "objectForKeyedSubscript:", v7, (void)v10);
        [v1 setObject:v7 forKeyedSubscript:v8];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t v9 = (void *)FPURLResourceKeysByItemPropertyNames_urlResourceKeysByItemPropertyNames;
  FPURLResourceKeysByItemPropertyNames_urlResourceKeysByItemPropertyNames = (uint64_t)v1;
}

id FPMatchingDictionaryKeys()
{
  if (FPMatchingDictionaryKeys_once != -1) {
    dispatch_once(&FPMatchingDictionaryKeys_once, &__block_literal_global_279);
  }
  uint64_t v0 = (void *)FPMatchingDictionaryKeys_fpMatchingDictionary;

  return v0;
}

void __FPMatchingDictionaryKeys_block_invoke()
{
  uint64_t v0 = FPURLResourceKeysByItemPropertyNames();
  uint64_t v1 = [v0 keysOfEntriesPassingTest:&__block_literal_global_282];
  id v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"userInfo"];
  [v2 addObject:@"itemIdentifier"];
  [v2 addObject:@"parentItemIdentifier"];
  [v2 addObject:@"contentType"];
  [v2 addObject:@"typeIdentifier"];
  [v2 addObject:@"isTrashed"];
  [v2 addObject:@"filename"];
  [v2 addObject:@"capabilities"];
  [v2 addObject:@"documentSize"];
  [v2 addObject:@"childItemCount"];
  [v2 addObject:@"creationDate"];
  [v2 addObject:@"contentModificationDate"];
  [v2 addObject:@"lastUsedDate"];
  [v2 addObject:@"tagData"];
  [v2 addObject:@"favoriteRank"];
  [v2 addObject:@"isUploaded"];
  [v2 addObject:@"isUploading"];
  [v2 addObject:@"uploadingError"];
  [v2 addObject:@"isDownloaded"];
  [v2 addObject:@"isDownloading"];
  [v2 addObject:@"downloadingError"];
  [v2 addObject:@"isMostRecentVersionDownloaded"];
  [v2 addObject:@"isShared"];
  [v2 addObject:@"isSharedByCurrentUser"];
  [v2 addObject:@"ownerNameComponents"];
  [v2 addObject:@"mostRecentEditorNameComponents"];
  [v2 addObject:@"versionIdentifier"];
  [v2 addObject:@"inheritedUserInfo"];
  [v2 addObject:@"resolvedUserInfo"];
  [v2 addObject:@"collaborationIdentifier"];
  [v2 addObject:@"isRecursivelyDownloaded"];
  [v2 addObject:@"isKeepDownloaded"];
  [v2 addObject:@"isFolder"];
  [v2 removeObject:@"containerDisplayName"];
  [v2 removeObject:@"providerDomainID"];
  uint64_t v3 = (void *)FPMatchingDictionaryKeys_fpMatchingDictionary;
  FPMatchingDictionaryKeys_fpMatchingDictionary = (uint64_t)v2;
}

uint64_t __FPMatchingDictionaryKeys_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"fp_"] ^ 1;
}

void sub_1A34B722C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A34B75C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  __fp_leave_section_Debug((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1A34B80EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getValueForKey(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  NSSelectorFromString(v4);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v3 valueForKey:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id FPExtensionMatchingDictionaryForItem(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  context = (void *)MEMORY[0x1A6248870]();
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    FPMatchingDictionaryKeys();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v4);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v12 isEqualToString:@"itemIdentifier"]) {
          getValueForKey(v3, @"providerItemIdentifier");
        }
        else {
        long long v13 = getValueForKey(v3, v12);
        }
        if (v13) {
          [v7 setObject:v13 forKey:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  long long v14 = (void *)[v7 copy];

  return v14;
}

unsigned __int8 *fpfs_finder_info_serialize(unsigned __int8 *result, uint64_t a2)
{
  *(_WORD *)(a2 + _Block_object_dispose(&STACK[0x2D0], 8) = bswap32(__rev16(*(_WORD *)(a2 + 8) & 0xE11B) & 0xFFFF9BEF | (*result << 15) | ((((*result & 6) >> 1) & 3) << 13) | (16 * ((*result >> 3) & 1)) & 0xFFFFFBFF | ((((*result & 0x10) >> 4) & 1) << 10) | (2 * (result[1] & 7))) >> 16;
  *(void *)a2 = bswap64(*((void *)result + 1));
  return result;
}

uint64_t fpfs_set_finder_info_buffer(int a1, void *a2)
{
  uint64_t v4 = 0;
  long long v3 = xmmword_1A34E4B18;
  return fsetattrlist(a1, &v3, a2, 0x20uLL, 0);
}

uint64_t fpfs_get_finder_info(int a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  int v3[2] = __fpfs_get_finder_info_block_invoke;
  v3[3] = &__block_descriptor_tmp_2;
  v3[4] = a2;
  return _fchfiflags(a1, (uint64_t)v3);
}

uint64_t _fchfiflags(int a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(v15, 0, sizeof(v15));
  double finder_info_buffer = fpfs_get_finder_info_buffer(a1, v15);
  if (v5 < 0) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v6 = bswap32(WORD4(v15[0]));
  unint64_t v12 = bswap64(*(unint64_t *)&v15[0]);
  uint64_t v11 = (v6 >> 22) & 0x10 | ((v6 & 0x80000000) != 0) | (v6 >> 28) & 6 | (v6 >> 17) & 8;
  *(_DWORD *)((char *)&v11 + 1) = (v6 >> 17) & 7;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, double))(a2 + 16))(a2, v11, finder_info_buffer);
  if (v7 == v11 && v8 == v12) {
    return 0;
  }
  WORD4(v15[0]) = bswap32(__rev16(WORD4(v15[0]) & 0xE11B) & 0xFFFF9BEF | (v7 << 15) | ((((v7 & 6) >> 1) & 3) << 13) | (16 * ((v7 >> 3) & 1)) & 0xFFFFFBFF | ((((v7 & 0x10) >> 4) & 1) << 10) | (v7 >> 7) & 0xE) >> 16;
  *(void *)&v15[0] = bswap64(v8);
  long long v13 = xmmword_1A34E4B18;
  uint64_t v14 = 0;
  return fsetattrlist(a1, &v13, v15, 0x20uLL, 0);
}

uint64_t __fpfs_get_finder_info_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v3 = *(void **)(a1 + 32);
  *long long v3 = a2;
  v3[1] = a3;
  return a2;
}

BOOL fpfs_finder_info_update_with_mask(uint64_t a1, char *a2, uint64_t a3)
{
  char v3 = *a2;
  if (*a2)
  {
    *(unsigned char *)a1 = *(unsigned char *)a1 & 0xFE | *(unsigned char *)a3 & 1;
    char v3 = *a2;
    if ((*a2 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*a2 & 2) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)a1 = *(unsigned char *)a1 & 0xFD | *(unsigned char *)a3 & 2;
  char v3 = *a2;
  if ((*a2 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(unsigned char *)a1 = *(unsigned char *)a1 & 0xFB | *(unsigned char *)a3 & 4;
  char v3 = *a2;
  if ((*a2 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_20:
  *(unsigned char *)a1 = *(unsigned char *)a1 & 0xF7 | *(unsigned char *)a3 & 8;
  if ((*a2 & 0x10) != 0) {
LABEL_6:
  }
    *(unsigned char *)a1 = *(unsigned char *)a1 & 0xEF | *(unsigned char *)a3 & 0x10;
LABEL_7:
  if (a2[1]) {
    *(unsigned char *)(a1 + 1) = *(unsigned char *)(a3 + 1);
  }
  if (*((void *)a2 + 1)) {
    *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = *(void *)(a3 + 8);
  }
  return *(void *)a1 != v6 || *(void *)(a1 + 8) != v7;
}

uint64_t fpfs_set_finder_info(int a1, uint64_t a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  int v4[2] = __fpfs_set_finder_info_block_invoke;
  v4[3] = &__block_descriptor_tmp_1_0;
  void v4[4] = a2;
  void v4[5] = a3;
  return _fchfiflags(a1, (uint64_t)v4);
}

uint64_t __fpfs_set_finder_info_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = a2;
  v4[1] = a3;
  fpfs_finder_info_update_with_mask((uint64_t)v4, *(char **)(a1 + 32), *(void *)(a1 + 40));
  return v4[0];
}

uint64_t fpfs_is_finder_alias_at(uint64_t a1, char *a2, uint64_t a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  void v4[2] = __fpfs_is_finder_alias_at_block_invoke;
  v4[3] = &__block_descriptor_tmp_3_0;
  void v4[4] = a3;
  return fpfs_openat(a1, a2, 0, 0, 0, (uint64_t)v4);
}

uint64_t __fpfs_is_finder_alias_at_block_invoke(uint64_t a1, int a2)
{
  v5[0] = 0;
  v5[1] = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 0x40000000;
  uint64_t v6[2] = __fpfs_get_finder_info_block_invoke;
  v6[3] = &__block_descriptor_tmp_2;
  void v6[4] = v5;
  if ((_fchfiflags(a2, (uint64_t)v6) & 0x80000000) != 0 && *__error() != 93) {
    return 0xFFFFFFFFLL;
  }
  char v3 = *(unsigned char **)(a1 + 32);
  uint64_t result = 0;
  if (v3) {
    *char v3 = v5[0] & 1;
  }
  return result;
}

uint64_t FPSearchableItemErrorReadFrom(uint64_t a1, uint64_t a2)
{
  char v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  int v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 1)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_43;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_45;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_43:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v26) = 0;
        }
LABEL_45:
        *(_DWORD *)(a1 + 24) = v26;
      }
      else if (v17 == 3)
      {
        uint64_t v30 = PBReaderReadString();
        id v31 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v30;
      }
      else if (v17 == 2)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_39;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            uint64_t v20 = 0;
            goto LABEL_41;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_39:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v20 = 0;
        }
LABEL_41:
        *(void *)(a1 + _Block_object_dispose(&STACK[0x2D0], 8) = -(v20 & 1) ^ (v20 >> 1);
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void CheckAndWarn_cold_1(int a1, SEL aSelector)
{
  char v8 = NSStringFromSelector(aSelector);
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v2, v3, "[ERROR] The enumerator %{public}@ does not implement the change-based update method %{public}@. System performance will be degraded, and sync may fail.", v4, v5, v6, v7, 2u);
}

#error "1A34BE75C: call analysis failed (funcsize=47)"

#error "1A34BE824: call analysis failed (funcsize=47)"

#error "1A34BE8EC: call analysis failed (funcsize=47)"

#error "1A34BEBDC: call analysis failed (funcsize=47)"

#error "1A34BED6C: call analysis failed (funcsize=47)"

#error "1A34BEE34: call analysis failed (funcsize=47)"

#error "1A34BEEFC: call analysis failed (funcsize=47)"

#error "1A34BEFC4: call analysis failed (funcsize=47)"

#error "1A34BF08C: call analysis failed (funcsize=47)"

#error "1A34BF3AC: call analysis failed (funcsize=47)"

#error "1A34BF794: call analysis failed (funcsize=47)"

#error "1A34BF85C: call analysis failed (funcsize=47)"

#error "1A34BFD0C: call analysis failed (funcsize=47)"

#error "1A34C01BC: call analysis failed (funcsize=47)"

#error "1A34C0284: call analysis failed (funcsize=47)"

#error "1A34C034C: call analysis failed (funcsize=47)"

#error "1A34C0414: call analysis failed (funcsize=47)"

#error "1A34C05A4: call analysis failed (funcsize=47)"

#error "1A34C066C: call analysis failed (funcsize=47)"

#error "1A34C07FC: call analysis failed (funcsize=47)"

#error "1A34C08C4: call analysis failed (funcsize=47)"

#error "1A34C0BE4: call analysis failed (funcsize=47)"

#error "1A34C0E3C: call analysis failed (funcsize=47)"

#error "1A34C0F04: call analysis failed (funcsize=47)"

void fpfs_fset_acl_cold_1()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, MEMORY[0x1E4F14500], v1, "Unable to create ACL on domain root: %s", v2, v3, v4, v5, v6);
}

void fpfs_fset_acl_cold_2()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, MEMORY[0x1E4F14500], v1, "Unable to set tag type for ACL on domain root: %s", v2, v3, v4, v5, v6);
}

void fpfs_fset_acl_cold_3()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, MEMORY[0x1E4F14500], v1, "Unable to get permission set for ACL on domain root: %s", v2, v3, v4, v5, v6);
}

void fpfs_fset_acl_cold_4()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, MEMORY[0x1E4F14500], v1, "Unable to clear permission set for ACL on domain root: %s", v2, v3, v4, v5, v6);
}

void fpfs_fset_acl_cold_5()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, MEMORY[0x1E4F14500], v1, "Unable to add permission for ACL on domain root: %s", v2, v3, v4, v5, v6);
}

void fpfs_fset_acl_cold_6()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, MEMORY[0x1E4F14500], v1, "Unable to set qualifier for ACL on domain root: %s", v2, v3, v4, v5, v6);
}

void fpfs_fset_acl_cold_7()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, MEMORY[0x1E4F14500], v1, "Unable to set permission set for ACL on domain root: %s", v2, v3, v4, v5, v6);
}

void fpfs_fset_acl_cold_8()
{
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A33AE000, MEMORY[0x1E4F14500], v1, "Unable to apply ACL on domain root: %s", v2, v3, v4, v5, v6);
}

void __cachedFrameworkOverridingObjects_block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring old world icloud drive override when fpfs is enabled", buf, 2u);
}

void __cachedFrameworkOverridingObjects_block_invoke_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring new world icloud drive override when fpfs is not enabled", buf, 2u);
}

void fpfs_serialize_last_use_date_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFDataRef _MDPropertyCopyEncodedDataForLastUsedDateWithTimeSpec(struct timespec)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_xattrs.m", 38, @"%s", dlerror());

  __break(1u);
}

void fpfs_deserialize_last_use_date_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean _MDPropertyDecodedLastUsedDateTimeSpec(CFDataRef, struct timespec *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_xattrs.m", 39, @"%s", dlerror());

  __break(1u);
}

void fpfs_serialize_favorite_rank_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CFDataRef _MDPropertyCopyEncodedDataForFavoriteRank(uint64_t, _Bool)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_xattrs.m", 36, @"%s", dlerror());

  __break(1u);
}

void fpfs_deserialize_favorite_rank_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean _MDPropertyDecodedFavoritRank(CFDataRef, uint64_t *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_xattrs.m", 37, @"%s", dlerror());

  __break(1u);
}

void fpfs_set_before_bounce_filename_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A33AE000, log, OS_LOG_TYPE_FAULT, "Trying to save empty filename in before_bounce_filename xattr", v1, 2u);
}

void fpfs_set_bplist_xattr_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "Cannot create CFStringCreateWithCString", v1, 2u);
}

void fpfs_set_bplist_xattr_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "Cannot format data with CFPropertyListCreateData %@", (uint8_t *)&v3, 0xCu);
}

void _MDPropertyCopyEncodedData_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CFDataRef _MDPropertyCopyEncodedData(CFStringRef, CFTypeRef)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_xattrs.m", 40, @"%s", dlerror());

  __break(1u);
}

void getMDItemCollaborationIdentifier_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemCollaborationIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_xattrs.m", 46, @"%s", dlerror());

  __break(1u);
}

void _MDPropertyCopyXAttrName_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFStringRef _MDPropertyCopyXAttrName(CFStringRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_xattrs.m", 42, @"%s", dlerror());

  __break(1u);
}

void getMDItemIsShared_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemIsShared(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_xattrs.m", 43, @"%s", dlerror());

  __break(1u);
}

void getMDItemSharedItemCurrentUserRole_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemSharedItemCurrentUserRole(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_xattrs.m", 45, @"%s", dlerror());

  __break(1u);
}

void getMDItemOwnerName_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemOwnerName(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_xattrs.m", 44, @"%s", dlerror());

  __break(1u);
}

void fpfs_copy_collaboration_identifier_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CFTypeRef _MDPropertyCopyDecodedValue(CFStringRef, CFDataRef)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_xattrs.m", 41, @"%s", dlerror());

  __break(1u);
}

void MetadataUtilitiesLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *MetadataUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"fpfs_xattrs.m", 34, @"%s", *a1);

  __break(1u);
}

void CoreSpotlightLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *CoreSpotlightLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"fpfs_xattrs.m", 35, @"%s", *a1);

  __break(1u);
}

void __getCSSearchableIndexClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *CoreSpotlightLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPSpotlightIndexer.m", 32, @"%s", *a1);

  __break(1u);
}

void __getCSSearchableIndexClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSSearchableIndexClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightIndexer.m", 33, @"Unable to find class %s", "CSSearchableIndex");

  __break(1u);
}

void FPPerformWithPersona_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_FAULT, "[CRIT] %{public}@", v1, 0xCu);
}

void copyHomeDirectoryCompat_cold_1()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_6_2(&dword_1A33AE000, v0, v1, "[CRIT] %{public}@", v2, v3, v4, v5, v6);
}

void copyHomeDirectoryCompat_cold_2()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_6_2(&dword_1A33AE000, v0, v1, "[ERROR] can't get home dir path: no entry for uid %d", v2, v3, v4, v5, v6);
}

void copyHomeDirectoryCompat_cold_3()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_6_2(&dword_1A33AE000, v0, v1, "[ERROR] can't get home dir path %{errno}d", v2, v3, v4, v5, v6);
}

void __getGSStorageManagerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *GenerationalStorageLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"NSURL+FPAdditions.m", 143, @"%s", *a1);

  __break(1u);
}

void __getGSStorageManagerClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getGSStorageManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"NSURL+FPAdditions.m", 144, @"Unable to find class %s", "GSStorageManager");

  __break(1u);
}

void __getQLThumbnailAdditionClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *QuickLookThumbnailingLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"NSURL+FPAdditions.m", 141, @"%s", *a1);

  __break(1u);
}

void __getQLThumbnailAdditionClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getQLThumbnailAdditionClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"NSURL+FPAdditions.m", 142, @"Unable to find class %s", "QLThumbnailAddition");

  __break(1u);
}

void FPStatFSFromPath_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] statfs(%@) failed %{errno}d", (uint8_t *)&v5, 0x12u);
}

void FPLocalizedFileSystemTypeName_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed to get NSURLVolumeLocalizedFormatDescription: %@", (uint8_t *)&v2, 0xCu);
}

void fpfs_fset_metadata_cold_1()
{
  __assert_rtn("fpfs_fset_metadata", "fpfs_metadata.c", 527, "((ptrdiff_t)buf - (ptrdiff_t)original_buf) == (ptrdiff_t)buf_size");
}

void CoreSpotlightLibrary_cold_1_0(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreSpotlightLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPSpotlightCollector.m", 32, @"%s", *a1);

  __break(1u);
}

void __getCSUserQueryContextClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSUserQueryContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightCollector.m", 38, @"Unable to find class %s", "CSUserQueryContext");

  __break(1u);
}

void __getCSSearchQueryContextClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSSearchQueryContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightCollector.m", 36, @"Unable to find class %s", "CSSearchQueryContext");

  __break(1u);
}

void __getCSUserQueryClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSUserQueryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightCollector.m", 37, @"Unable to find class %s", "CSUserQuery");

  __break(1u);
}

void __getCSSearchQueryClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSSearchQueryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightCollector.m", 35, @"Unable to find class %s", "CSSearchQuery");

  __break(1u);
}

void _CGImageDestinationCreateWithData_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageDestinationRef _CGImageDestinationCreateWithData(CFMutableDataRef _Nonnull, CFStringRef _Nonnull, size_t, CFDictionaryRef _Nullable)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPFetchThumbnailsOperation.m", 35, @"%s", dlerror());

  __break(1u);
}

void _CGImageDestinationAddImage_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void _CGImageDestinationAddImage(CGImageDestinationRef _Nonnull, CGImageRef _Nonnull, CFDictionaryRef _Nullable)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPFetchThumbnailsOperation.m", 36, @"%s", dlerror());

  __break(1u);
}

void _CGImageDestinationFinalize_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"_Bool _CGImageDestinationFinalize(CGImageDestinationRef _Nonnull)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPFetchThumbnailsOperation.m", 37, @"%s", dlerror());

  __break(1u);
}

void __getIFImageClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *IconFoundationLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPFetchThumbnailsOperation.m", 31, @"%s", *a1);

  __break(1u);
}

void __getIFImageClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getIFImageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPFetchThumbnailsOperation.m", 32, @"Unable to find class %s", "IFImage");

  __break(1u);
}

void ImageIOLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *ImageIOLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPFetchThumbnailsOperation.m", 33, @"%s", *a1);

  __break(1u);
}

void __getDSArchiveServiceClass_block_invoke_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getDSArchiveServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPArchiveOperation.m", 25, @"Unable to find class %s", "DSArchiveService");

  __break(1u);
}

void DesktopServicesPrivLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *DesktopServicesPrivLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPArchiveOperation.m", 24, @"%s", *a1);

  __break(1u);
}

void __getBRFieldContentSignatureClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *iCloudDriveCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPFileVersion.m", 28, @"%s", *a1);

  __break(1u);
}

void __getBRFieldContentSignatureClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getBRFieldContentSignatureClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPFileVersion.m", 29, @"Unable to find class %s", "BRFieldContentSignature");

  __break(1u);
}

void __FPBookmarkableStringFromDocumentURL_block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Could not create a bookmark: %@", v4, v5, v6, v7, v8);
}

void __FPDocumentURLFromBookmarkableString_block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Could not resolve bookmark. Error: %@", v4, v5, v6, v7, v8);
}

void __FPExtendBookmarkForDocumentURL_block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "fp_scopeDescription");
  uint64_t v4 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v5, v6, "[ERROR] Could not extend bookmark access of %@ for %@. Error: %@", v7, v8, v9, v10, v11);
}

void FPRegisterFileProvidersForFileCoordination_cold_1()
{
  OUTLINED_FUNCTION_30();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] deprecated FPRegisterFileProvidersForFileCoordination called", v1, 2u);
}

void FPRegisterFileProvidersForUser_cold_1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] Requesting fileproviderd to register extensions", v2, v3, v4, v5, v6);
}

void __FPRegisterFileProvidersForUser_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_26(&dword_1A33AE000, v0, v1, "[DEBUG] fileprovider registration completed", v2, v3, v4, v5, v6);
}

void __FPIsFileProviderBookmark_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 48), "fp_scopeDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v2, v3, "[DEBUG] Failed to determine whether URL %@ is managed by a file provider", v4, v5, v6, v7, v8);
}

void __FPCFCopyAttributeValuesForItem_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_16_0();
  objc_msgSend(*(id *)(v1 + 40), "fp_scopeDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] Could not get attribute values for item %@. Error: %@", v5, v6, v7, v8, v9);
}

void __FPEvictItem_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16_1(v1), "fp_shortDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] Cannot evict item at URL %@: %@", v5, v6, v7, v8, v9);
}

void __FPSetAlternateContentsURLOnDocumentURL_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_16_1(a1), "fp_shortDescription");
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v4, v5, "[DEBUG] did set %@ as alternate contents URL on document URL %@", v6, v7, v8, v9, v10);
}

void __FPSetAlternateContentsURLOnDocumentURL_block_invoke_cold_2(id *a1)
{
  uint64_t v2 = objc_msgSend(a1[4], "fp_shortDescription");
  objc_msgSend(a1[5], "fp_scopeDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "fp_prettyDescription");
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v4, v5, "[ERROR] failed to set %@ as alternate contents URL on document URL %@: %@", v6, v7, v8, v9, v10);
}

void __FPFetchAlternateContentsURLForDocumentURL_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16_0();
  uint64_t v2 = objc_msgSend(v1, "fp_shortDescription");
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 32), "fp_shortDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v4, v5, "[DEBUG] did fetch %@ as alternate contents URL for document URL %@", v6, v7, v8, v9, v10);
}

void __FPFetchAlternateContentsURLForDocumentURL_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_16_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16_1(v1), "fp_scopeDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] failed fetching alternate contents URL for document URL %@: %@", v5, v6, v7, v8, v9);
}

void __FPAppHasNonUploadedFiles_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = @"NO";
  if (a2) {
    uint64_t v3 = @"YES";
  }
  *(_DWORD *)uint64_t v4 = 138412546;
  *(void *)&void v4[4] = *(void *)(a1 + 32);
  *(_WORD *)&v4[12] = 2112;
  *(void *)&v4[14] = v3;
  OUTLINED_FUNCTION_11(&dword_1A33AE000, a2, a3, "[DEBUG] did check if app %@ is uploading files, result was %@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], *MEMORY[0x1E4F143B8]);
}

void __FPAppHasNonUploadedFiles_block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] Failed checking if app %@ is uploading files: %@", v5, v6, v7, v8, v9);
}

void __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_16_1(a1), "fp_shortDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v2, v3, "[DEBUG] did update alternate contents document for document at URL %@", v4, v5, v6, v7, v8);
}

void __FPDidUpdateAlternateContentsDocumentForDocumentAtURL_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_16_0();
  objc_msgSend((id)OUTLINED_FUNCTION_16_1(v1), "fp_scopeDescription");
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] failed updating alternate contents document for document at URL %@: %@", v5, v6, v7, v8, v9);
}

void __FPFetchLatestVersionForFileAtURL_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Couldn't get storage after received version - %@", v1, 0xCu);
}

void __FPFetchLatestVersionForFileAtURL_block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Couldn't find addition with name %@ - %@", v1, 0x16u);
}

void __FPFetchLatestVersionForFileAtURL_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_30();
  _os_log_error_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_ERROR, "[ERROR] Couldn't look up file version by persistent identifier", v1, 2u);
}

void FPCrossDeviceItemIDForItemAtURL_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] fetching cross-device item at URL %@", v2, v3, v4, v5, v6);
}

void __FPCreateCrossDeviceItemIDForItemAtURL_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_18_0();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_10_3(v0, v1), "fp_prettyDescription");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v3, v4, "[ERROR] %s: %s error: %@", v5, v6, v7, v8, 2u);
}

void FPCrossDeviceItemIDForItemID_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] fetching cross-device itemID for %@", v2, v3, v4, v5, v6);
}

void __FPCreateCrossDeviceItemIDForItemID_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_18_0();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_10_3(v0, v1), "fp_prettyDescription");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v3, v4, "[ERROR] %s: %s error: %@", v5, v6, v7, v8, 2u);
}

void __FPCrossDeviceItemIDForItemID_block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v1, v2, "[DEBUG]  %@ => %@", (void)v3, DWORD2(v3));
}

void FPItemURLForCrossDeviceItemID_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] fetching itemURL from %@", v2, v3, v4, v5, v6);
}

void __FPGetItemURLForCrossDeviceItemID_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_18_0();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_10_3(v0, v1), "fp_prettyDescription");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v3, v4, "[ERROR] %s: %s error: %@", v5, v6, v7, v8, 2u);
}

void __FPItemURLForCrossDeviceItemID_block_invoke_79_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 path];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG]  %@ => '%@'", v5, v6, v7, v8, v9);
}

void __FPItemURLForCrossDeviceItemID_block_invoke_84_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 path];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG]  %@ => '%@'", v5, v6, v7, v8, v9);
}

void FPItemIDFromCrossDeviceItemID_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] fetching itemID from %@", v2, v3, v4, v5, v6);
}

void __FPGetItemIDFromCrossDeviceItemID_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_18_0();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_10_3(v0, v1), "fp_prettyDescription");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_8_1(&dword_1A33AE000, v3, v4, "[ERROR] %s: %s error: %@", v5, v6, v7, v8, 2u);
}

void __FPItemIDFromCrossDeviceItemID_block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 itemID];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v3, v4, "[DEBUG]  %@ => %@", v5, v6, v7, v8, v9);
}

void FPWriteImportCookieForDomainURL_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v2, v3, "[DEBUG] writing import cookie for domain url %{public}@", v4, v5, v6, v7, 2u);
}

void FPClearImportCookieForDomainURL_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "fp_shortDescription");
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v2, v3, "[DEBUG] clearing import cookie for domain url %{public}@", v4, v5, v6, v7, 2u);
}

void __FPOSVersion_block_invoke_cold_1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A33AE000, a1, OS_LOG_TYPE_ERROR, "[ERROR] sysctl(kern.osversion) failed %{errno}d", (uint8_t *)v3, 8u);
}

void __FPIsCloudDocsWithFPFSEnabled_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Do not migrate to FPFS user default is configured.", v1, 2u);
}

void __FPCaptureLogsForOperation_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Sent ABC report successfully", v1, 2u);
}

void __FPCaptureLogsForOperation_block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ABC report got rejected", v1, 2u);
}

void abc_report_assert_with_signature_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void abc_report_assert_with_signature_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed to send snapshot for signature %@", (uint8_t *)&v2, 0xCu);
}

void __abc_report_assert_with_signature_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __fp_log_fork_cold_1(__int16 a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = a2;
  WORD6(v3) = 2080;
  HIWORD(v3) = a1;
  OUTLINED_FUNCTION_11(&dword_1A33AE000, a2, a3, "[DEBUG] ┣%llx dispatching to %s", (void)v3, *((const char **)&v3 + 1));
}

void __fp_log_adopt_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  WORD6(v3) = 2080;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_11(&dword_1A33AE000, a2, a3, "[DEBUG] ┳%llx continuing on %s", (void)v3, *((const char **)&v3 + 1));
}

void __fp_leave_section_Debug_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __fp_leave_section_Error_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] ┗%llx ", (uint8_t *)&v3, 0xCu);
}

void fpfs_update_purgency_cold_1()
{
  __error();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_7(&dword_1A33AE000, v0, v1, "Couldn't get purgeable info, errno %{errno}d", v2, v3, v4, v5, v6);
}

void fpfs_update_purgency_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "Couldn't update purgeable urgency, file is not purgable", v1, 2u);
}

void fpfs_set_evictable_cold_1()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_6();
  __int16 v5 = 2048;
  uint64_t v6 = v0;
  __int16 v7 = 2080;
  uint64_t v8 = v1;
  __int16 v9 = 2048;
  uint64_t v10 = v2;
  _os_log_error_impl(&dword_1A33AE000, v3, OS_LOG_TYPE_ERROR, "Invalid evictability parameters: %d / 0x%llx on %s ino:%llu", v4, 0x26u);
}

void fpfs_get_purgeable_stats_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 134218240;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "Couldn't get detailed purgeable stats for %llu, errno %{errno}d", (uint8_t *)&v5, 0x12u);
}

void fpfs_unset_dataless_cmpfs_attrs_cold_1()
{
  __error();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_7(&dword_1A33AE000, v0, v1, "removing dataless bit with fpfs_fchflags failed with %{errno}d", v2, v3, v4, v5, v6);
}

void fpfs_unset_dataless_cmpfs_attrs_cold_2()
{
  __error();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_7(&dword_1A33AE000, v0, v1, "removing dataless bit with ffsctl failed with %{errno}d", v2, v3, v4, v5, v6);
}

void __fpfs_create_dataless_fault_at_block_invoke_cold_1()
{
}

void _fpfs_remove_sharing_xattrs_cold_1()
{
  __error();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_7(&dword_1A33AE000, v0, v1, "Error removing ownerName during prune fault: %d", v2, v3, v4, v5, v6);
}

void _fpfs_remove_sharing_xattrs_cold_2()
{
  __error();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_7(&dword_1A33AE000, v0, v1, "Error removing sharedByCurrentUser during prune fault: %d", v2, v3, v4, v5, v6);
}

void _fpfs_remove_sharing_xattrs_cold_3()
{
  __error();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_7(&dword_1A33AE000, v0, v1, "Error removing isShared during prune fault: %d", v2, v3, v4, v5, v6);
}

void _fpfs_remove_sharing_xattrs_cold_4()
{
  __error();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_7(&dword_1A33AE000, v0, v1, "Error removing collabID during prune fault: %d", v2, v3, v4, v5, v6);
}

void _fpfs_prune_fault_error_cold_1(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = 136315394;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "prune dataless: can't remove %s , error: (%{errno}d)", (uint8_t *)&v4, 0x12u);
}

void _fpfs_prune_fault_status_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "prune dataless: removed %s", (uint8_t *)&v2, 0xCu);
}

void fpfs_materialize_cold_1()
{
  __error();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_5_6(&dword_1A33AE000, v0, v1, "Setting data class %d->%d on source failed: %{errno}d", v2, v3, v4, v5, v6);
}

void fpfs_materialize_cold_2()
{
  __error();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_5_6(&dword_1A33AE000, v0, v1, "Setting data class %d->%d on destination failed: %{errno}d", v2, v3, v4, v5, v6);
}

void _materialize_partial_cold_1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_4(&dword_1A33AE000, v0, v1, "Invalid extent [%lu, %lu]", v2, v3);
}

void _materialize_partial_cold_3()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_4(&dword_1A33AE000, v0, v1, "captured content doesn't contain as much data as exepcted! (%llu != %llu)", v2, v3);
}

void _materialize_partial_cold_4(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1A33AE000, a1, OS_LOG_TYPE_ERROR, "_materialize_partial APFSIOC_SHARE_RANGE: %s", (uint8_t *)&v4, 0xCu);
}

void _materialize_partial_cold_5()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2_4(&dword_1A33AE000, v0, v1, "extent length is not as expected (%llu != %llu)", v2, v3);
}

void fpfs_evict_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "Unable to update cmpfs_attrs", buf, 2u);
}

void fpfs_evict_cold_2(uint8_t *a1, char **a2, NSObject *a3)
{
  uint64_t v6 = __error();
  int v7 = strerror(*v6);
  *(_DWORD *)a1 = 136315138;
  *a2 = v7;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "APFSIOC_PURGE_SINGLE_FILE failed with %s", a1, 0xCu);
}

void fpfs_evict_cold_3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "APFSIOC_PURGE_SINGLE_FILE did not evict anything, assuming EBUSY", buf, 2u);
}

void fpfs_evict_cold_4(uint8_t *a1, int *a2, NSObject *a3)
{
  int v6 = *__error();
  *(_DWORD *)a1 = 67109120;
  *a2 = v6;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "Unable to make empty file dataless: %{errno}d", a1, 8u);
}

void fpfs_evict_cold_5(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 136315394;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "Unable to fully empty directory at '%s' during eviction: %s (leaving in state)", buf, 0x16u);
}

void FPLocvImpl_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = FPLocalizationBundle();
  int v7 = [v6 bundlePath];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  __int16 v12 = 2112;
  char v13 = v7;
  _os_log_fault_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_FAULT, "[CRIT] Localized key '%@' missing from table '%@' (bundlePath:%@)", (uint8_t *)&v8, 0x20u);
}

void FPLocalizedErrorStringForKey_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = FPLocalizationBundle();
  uint64_t v5 = [v4 bundlePath];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_fault_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Localized key '%@' missing from table 'Errors' (bundlePath:%@)", (uint8_t *)&v6, 0x16u);
}

void copyfile_status_cb_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] copyfile: failed while copying (%s): %d", (uint8_t *)&v5, 0x12u);
}

void copyfile_status_cb_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] copyfile: failed while copying an appledouble file %s, skipping error", v2, v3, v4, v5, v6);
}

void copyfile_status_cb_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] copyfile: skipping appledouble file %s", v2, v3, v4, v5, v6);
}

void copyfile_status_cb_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] copyfile: done copying %s", v2, v3, v4, v5, v6);
}

void copyfile_status_cb_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] copyfile: recursing in %s", v2, v3, v4, v5, v6);
}

void _brc_notify_get_state_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void _brc_notify_get_state(int, uint64_t *, const char *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPProviderMonitor.m", 31, @"%s", dlerror());

  __break(1u);
}

void CloudDocsLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CloudDocsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPProviderMonitor.m", 30, @"%s", *a1);

  __break(1u);
}

void getMDItemFileProviderDomainIdentifier_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemFileProviderDomainIdentifier(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 60, @"%s", dlerror());

  __break(1u);
}

void getMDItemLastUsedDate_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemLastUsedDate(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 40, @"%s", dlerror());

  __break(1u);
}

void getMDItemFileSize_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemFileSize(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 48, @"%s", dlerror());

  __break(1u);
}

void getMDItemFileItemID_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemFileItemID(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 55, @"%s", dlerror());

  __break(1u);
}

void getMDItemFileProviderID_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemFileProviderID(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 56, @"%s", dlerror());

  __break(1u);
}

void __getCSSearchableItemAttributeSetClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSSearchableItemAttributeSetClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 70, @"Unable to find class %s", "CSSearchableItemAttributeSet");

  __break(1u);
}

void CoreSpotlightLibrary_cold_1_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreSpotlightLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPItem+CSSearchableItem.m", 33, @"%s", *a1);

  __break(1u);
}

void __getCSLocalizedStringClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSLocalizedStringClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 71, @"Unable to find class %s", "CSLocalizedString");

  __break(1u);
}

void MetadataUtilitiesLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *MetadataUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPItem+CSSearchableItem.m", 73, @"%s", *a1);

  __break(1u);
}

void __getCSSearchableItemClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSSearchableItemClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPItem+CSSearchableItem.m", 69, @"Unable to find class %s", "CSSearchableItem");

  __break(1u);
}

void getCSIndexErrorDomain_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getCSIndexErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightFetchClientStateOperation.m", 23, @"%s", dlerror());

  __break(1u);
}

void __getCSIndexErrorDomainSymbolLoc_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreSpotlightLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPSpotlightFetchClientStateOperation.m", 22, @"%s", *a1);

  __break(1u);
}

void __getFBSSystemServiceClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *FrontBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPAccessControlManager.m", 18, @"%s", *a1);

  __break(1u);
}

void __getFBSSystemServiceClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getFBSSystemServiceClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPAccessControlManager.m", 19, @"Unable to find class %s", "FBSSystemService");

  __break(1u);
}

void __getCSIndexErrorDomainSymbolLoc_block_invoke_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreSpotlightLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPSpotlightIndexOneBatchOperation.m", 27, @"%s", *a1);

  __break(1u);
}

void fpfs_path_is_safe_save_temp_filename_cold_1()
{
  __assert_rtn("fpfs_path_is_safe_save_temp_filename", "fpfs_path.m", 234, "ERGO(dash, (dash - extension) >= 0)");
}

void CloudDocsLibrary_cold_1_0(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CloudDocsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"GSAddition+FPVersions.m", 19, @"%s", *a1);

  __break(1u);
}

void FPCreateCrossDeviceItemIDForItemAtURLOnBehalfOfApplication_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a2, "fp_shortDescription");
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Connection %@ doesn't have access to file %@", (uint8_t *)&v6, 0x16u);
}

void hasConflictingVersion_cold_1()
{
  OUTLINED_FUNCTION_30();
  _os_log_fault_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_FAULT, "[SIMCRASH] Item has version conflict, but empty base version", v1, 2u);
}

void hasConflictingVersion_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 itemIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Item %@ has version conflict, but empty base version", (uint8_t *)&v4, 0xCu);
}

void MobileSpotlightIndexLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *MobileSpotlightIndexLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"NSFileProviderSearchQuery.m", 27, @"%s", *a1);

  __break(1u);
}

void _parse_fileattrs_cold_1()
{
  __assert_rtn("_parse_fileattrs", "fpfs_document_tracking.m", 285, "source.objtype != VREG");
}

void fpfs_openfdbyhandle_cold_1()
{
  __assert_rtn("fpfs_openfdbyhandle", "fpfs_document_tracking.m", 1162, "errno != 0");
}

void _try_openbyid_cold_1()
{
  __assert_rtn("_try_openbyid", "fpfs_document_tracking.m", 1048, "errno != 0");
}

void _openbyparentidandname_retry_cold_1()
{
  __assert_rtn("_openbyparentidandname_retry", "fpfs_document_tracking.m", 1082, "errno != 0");
}

void _pagetoken_validate_cold_1()
{
  __assert_rtn("_pagetoken_validate", "fpfs_document_tracking.m", 527, "new_pagetoken.dev_id != 0");
}

void __getDSFileOperationClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *DesktopServicesPrivLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"fpfs_document_tracking.m", 37, @"%s", *a1);

  __break(1u);
}

void __getDSFileOperationClass_block_invoke_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getDSFileOperationClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"fpfs_document_tracking.m", 38, @"Unable to find class %s", "DSFileOperation");

  __break(1u);
}

void fpfs_pkg_relative_path_lookup_cold_1()
{
}

void fpfs_pathpkg_check_cold_1()
{
  __assert_rtn("_cwd_fd", "fpfs_package.m", 91, "fd >= 0");
}

void FPDefaultFetchedAttributes_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemExpirationDate(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightQueryHelpers.m", 26, @"%s", dlerror());

  __break(1u);
}

void FPDefaultFetchedAttributes_cold_2()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDQueryResultRelevance(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightQueryHelpers.m", 28, @"%s", dlerror());

  __break(1u);
}

void FPRecencyQualifyingAttributes_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemLastUsedDate(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightQueryHelpers.m", 27, @"%s", dlerror());

  __break(1u);
}

void FPFileSizeAttributes_cold_1()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getMDItemFileSize(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightQueryHelpers.m", 29, @"%s", dlerror());

  __break(1u);
}

void CoreSpotlightLibrary_cold_1_2(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreSpotlightLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPSpotlightQueryHelpers.m", 25, @"%s", *a1);

  __break(1u);
}

void __getCSSearchQueryContextClass_block_invoke_cold_1_0()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSSearchQueryContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightQueryHelpers.m", 32, @"Unable to find class %s", "CSSearchQueryContext");

  __break(1u);
}

void __getCSSearchQueryClass_block_invoke_cold_1_0()
{
  os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSSearchQueryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSpotlightQueryHelpers.m", 31, @"Unable to find class %s", "CSSearchQuery");

  __break(1u);
}

void __fpfs_get_materialization_alignment_block_invoke_cold_1()
{
  __error();
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_1_7(&dword_1A33AE000, v0, v1, "[CRIT] Unable to resolve FS block size (%{errno}d). Defaulting to %lu", v2, v3, v4, v5, v6);
}

void __fpfs_get_materialization_alignment_block_invoke_cold_2()
{
  __error();
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_1_7(&dword_1A33AE000, v0, v1, "[CRIT] Unable to resolve VM page size (%{errno}d). Defaulting to %lu", v2, v3, v4, v5, v6);
}

void __FPSetLastUsedDateAtURL_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 40) path];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Failed to set last used date on %@: %@", (uint8_t *)&v6, 0x16u);
}

void __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 componentsJoinedByString:@", "];
  int v6 = objc_msgSend(*(id *)(a2 + 40), "fp_shortDescription");
  int v7 = 138412546;
  __int16 v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] got services [%@] for item at URL %@", (uint8_t *)&v7, 0x16u);
}

void __FPFileProviderServiceEndpointCreatingForItemAtURL_block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  int v6 = 138412546;
  int v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] failed to get services for for item at URL %@: %@", (uint8_t *)&v6, 0x16u);
}

void __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_11(&dword_1A33AE000, v0, v1, "[DEBUG] got service endpoint creating %@ for item at URL %@");
}

void __FPFileProviderServiceEndpointCreatingForItemAtURLSynchronously_block_invoke_2_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 40);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_4(&dword_1A33AE000, v1, v2, "[ERROR] failed to get service endpoint creating for for item at URL %@: %@", (void)v3, DWORD2(v3));
}

void FPFetchServiceEndpointCreatorByNameForItemAtURL_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_4(&dword_1A33AE000, v1, v2, "[ERROR] Error fetching FPOriginalDocumentURL from url: %@ error: %@", (void)v3, DWORD2(v3));
}

void fp_reachability_callback_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void FPGetTagsFromTagsData_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFArrayRef _MDPropertyCopyDecodedUserTags(CFDataRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPTools.m", 26, @"%s", dlerror());

  __break(1u);
}

void FPGetTagsFromTagsData_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] fpfs tag parsing failed, falling back to MD parser", v1, 2u);
}

void fp_dispatch_async_with_logs_cold_1(NSObject *a1)
{
  dispatch_queue_get_label(a1);
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v1, v2, "[DEBUG] ┣%llx dispatching to %s", v3, v4, v5, v6, v7);
}

void __fp_dispatch_async_with_logs_block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  dispatch_queue_get_label(*(dispatch_queue_t *)(a2 + 40));
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_17_0(&dword_1A33AE000, v2, v3, "[DEBUG] ┳%llx continuing on %s", v4, v5, v6, v7, v8);
}

void __FPGetTagsFromTagsDataInOnDiskEncoding_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef _MDPropertyCopyUserTagName(CFStringRef, uint8_t *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPTools.m", 25, @"%s", dlerror());

  __break(1u);
}

void MetadataUtilitiesLibrary_cold_1_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *MetadataUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPTools.m", 24, @"%s", *a1);

  __break(1u);
}

void __getCSSearchQueryContextClass_block_invoke_cold_1_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSSearchQueryContextClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSearchQueryEnumerator.m", 25, @"Unable to find class %s", "CSSearchQueryContext");

  __break(1u);
}

void CoreSpotlightLibrary_cold_1_3(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreSpotlightLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"FPSearchQueryEnumerator.m", 22, @"%s", *a1);

  __break(1u);
}

void __getCSSearchQueryClass_block_invoke_cold_1_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getCSSearchQueryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"FPSearchQueryEnumerator.m", 24, @"Unable to find class %s", "CSSearchQuery");

  __break(1u);
}

uint64_t APFSVolumeGetVEKState()
{
  return MEMORY[0x1F4105380]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1F40D73B8](allocator, capacity);
}

CFIndex CFBitVectorGetCountOfBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x1F40D73E0](bv, range.location, range.length, *(void *)&value);
}

CFIndex CFBitVectorGetFirstIndexOfBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x1F40D73E8](bv, range.location, range.length, *(void *)&value);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

Boolean CFBundleLoadExecutableAndReturnError(CFBundleRef bundle, CFErrorRef *error)
{
  return MEMORY[0x1F40D75F8](bundle, error);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

Boolean CFFileSecuritySetAccessControlList(CFFileSecurityRef fileSec, acl_t accessControlList)
{
  return MEMORY[0x1F40D7B40](fileSec, accessControlList);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7C38]();
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

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1F40D85A0](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
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

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1F40D87B0](url, key, propertyValueTypeRefPtr, error);
}

uint64_t GSLibraryGetOrAllocateDocumentId()
{
  return MEMORY[0x1F411BB38]();
}

uint64_t GSLibraryResolveDocumentId2()
{
  return MEMORY[0x1F411BB40]();
}

uint64_t GSSetDocIDResolutionPolicy()
{
  return MEMORY[0x1F411BB50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1F40E7168]();
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

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1F40E72F0]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteSint64Field()
{
  return MEMORY[0x1F4147218]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EF8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101F28](target, queue);
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

uint64_t SimulateCrash()
{
  return MEMORY[0x1F4116EB0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1F40C9AB0](aBlock);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1F40D8C30]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1F40D91E8]();
}

uint64_t _CFURLCStringIsPromiseName()
{
  return MEMORY[0x1F40D91F8]();
}

uint64_t _CFURLCopyLogicalNameOfPromiseAtURL()
{
  return MEMORY[0x1F40D9258]();
}

uint64_t _CFURLCopyPromiseURLOfLogicalURL()
{
  return MEMORY[0x1F40D9278]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1F40D92B0]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x1F40D9350]();
}

uint64_t _CFURLIsPromiseName()
{
  return MEMORY[0x1F40D9358]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x1F40D9368]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x1F40D9380]();
}

uint64_t _CFURLSetPermanentResourcePropertyForKey()
{
  return MEMORY[0x1F40D93A8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1F40D94C0]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1F40D94E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1F40D9630]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1F40C9C30]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1F40CA228](permset_d, *(void *)&perm);
}

int acl_clear_perms(acl_permset_t permset_d)
{
  return MEMORY[0x1F40CA230](permset_d);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1F40CA250](acl_p, entry_p);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1F40CA270](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1F40CA280](acl, *(void *)&entry_id, entry_p);
}

acl_t acl_get_fd(int fd)
{
  return (acl_t)MEMORY[0x1F40CA288](*(void *)&fd);
}

int acl_get_perm_np(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1F40CA2B0](permset_d, *(void *)&perm);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1F40CA2B8](entry_d, permset_p);
}

void *__cdecl acl_get_qualifier(acl_entry_t entry_d)
{
  return (void *)MEMORY[0x1F40CA2C0](entry_d);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x1F40CA2C8](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1F40CA2D0](*(void *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x1F40CA2D8](*(void *)&fd, acl);
}

int acl_set_link_np(const char *path_p, acl_type_t type, acl_t acl)
{
  return MEMORY[0x1F40CA2F8](path_p, *(void *)&type, acl);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x1F40CA300](entry_d, permset_d);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x1F40CA310](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x1F40CA318](entry_d, *(void *)&tag_type);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

int atexit_b(void *a1)
{
  return MEMORY[0x1F40CA490](a1);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1F40CA4B8](a1);
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x1F40CA4C8](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1F4181540](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1F40CB3D0](*(void *)&__clock_id, __tp);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1F40CB3E0](a1, a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1F40CB580]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1F40CB5D0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1F40CB650]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1F40CB720]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1F40CB730]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1F40CB738]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1F40CB740]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1F40CB750]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1F40CB760]();
}

uint64_t container_query_set_group_identifiers()
{
  return MEMORY[0x1F40CB768]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1F40CB780]();
}

uint64_t container_query_set_transient()
{
  return MEMORY[0x1F40CB788]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1F40CB888]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1F40CB890](a1);
}

int copyfile_state_get(copyfile_state_t s, uint32_t flag, void *dst)
{
  return MEMORY[0x1F40CB898](s, *(void *)&flag, dst);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x1F40CB8A0](s, *(void *)&flag, src);
}

char *__cdecl dirname(char *a1)
{
  return (char *)MEMORY[0x1F40CB908](a1);
}

uint64_t dirstat_np()
{
  return MEMORY[0x1F40CB918]();
}

void dispatch_activate(dispatch_object_t object)
{
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
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

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
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

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x1F40CBDE0](*(void *)&a1, a2);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1F40CBE00](*(void *)&a1, *(void *)&a2);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

int execlp(const char *__file, const char *__arg0, ...)
{
  return MEMORY[0x1F40CBFB8](__file, __arg0);
}

void exit(int a1)
{
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1F40CC018](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x1F40CC020](*(void *)&a1, *(void *)&a2);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1F40CC028](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CC038](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CC060](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1F40CC078](*(void *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC0E0](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC108](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1F40CC158](*(void *)&fd, namebuff, size, *(void *)&options);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1F40CC160](*(void *)&a1, *(void *)&a2);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

pid_t fork(void)
{
  return MEMORY[0x1F40CC1C8]();
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1F40CC240](*(void *)&fd, name, *(void *)&options);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC2A0](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC2A8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1F40CC2B0](a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1F40CC2C8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1F40CC2F8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1F40CC300](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1F40CC308](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

int getattrlistat(int a1, const char *a2, void *a3, void *a4, size_t a5, unint64_t a6)
{
  return MEMORY[0x1F40CC368](*(void *)&a1, a2, a3, a4, a5, a6);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1F40CC370](*(void *)&a1, a2, a3, a4, a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x1F40CC3E8](a1, a2, a3, a4, a5);
}

int getiopolicy_np(int a1, int a2)
{
  return MEMORY[0x1F40CC418](*(void *)&a1, *(void *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CC4E0](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CC4F0](*(void *)&a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1F40CC690](*(void *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1F40CC6B0](*(void *)&a1);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1F40CC728](*(void *)&a1, *(void *)&a2);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1F40CC848](path, namebuff, size, *(void *)&options);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1F40CCC70](*(void *)&gid, uu);
}

uint64_t mbr_identifier_translate()
{
  return MEMORY[0x1F40CCC80]();
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1F40CCC88](*(void *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x1F40CCC90](uu, uid_or_gid, id_type);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1F4181618](m);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1F40CCDD8](*(void *)&a1, a2, a3);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

void objc_moveWeak(id *to, id *from)
{
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

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1F40CD100](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t openbyid_np()
{
  return MEMORY[0x1F40CD118]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

void perror(const char *a1)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x1F40CD760](a1);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1F40CD7A0](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1F40CD7B8](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1F40CD7C0](a1);
}

int posix_spawnp(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1F40CD808](a1, a2, a3, a4, __argv, __envp);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8C0](audittoken, buffer, *(void *)&buffersize);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  uint64_t v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

uint64_t pthread_fchdir_np()
{
  return MEMORY[0x1F40CD9F0]();
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1F40CDB80](*(void *)&a1, a2, a3);
}

int putenv(char *a1)
{
  return MEMORY[0x1F40CDBB0](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CDC70](a1, a2, a3);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1F40CDD18](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1F40CDD20]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1F40CDD28](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1F40CDD30](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1F40CDD38](state, *(void *)&key, value);
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return MEMORY[0x1F40CDD68](*(void *)&a1, a2, *(void *)&a3, a4, *(void *)&a5);
}

void rewinddir(DIR *a1)
{
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1F40CDD88](a1, *(void *)&a2);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1F40CDD90](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1F40CDDD8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CDF78](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1F40CE140](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1F40CE238](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1F40CE298](__str, __sep, __lasts);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE360](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1F40CE5E8](*(void *)&a1, a2, *(void *)&a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CE630](uu1, uu2);
}

void uuid_generate(uuid_t out)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

uint64_t voucher_process_can_use_arbitrary_personas()
{
  return MEMORY[0x1F40CE768]();
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1F40CE7C8](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

xattr_flags_t xattr_flags_from_name(const char *a1)
{
  return MEMORY[0x1F40CE940](a1);
}

char *__cdecl xattr_name_without_flags(const char *a1)
{
  return (char *)MEMORY[0x1F40CE958](a1);
}

int xattr_preserve_for_intent(const char *a1, xattr_operation_intent_t a2)
{
  return MEMORY[0x1F40CE960](a1, *(void *)&a2);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}