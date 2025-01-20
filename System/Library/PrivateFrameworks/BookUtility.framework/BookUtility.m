void sub_21E1C84A4(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  void v4[3];
  void v5[4];

  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26CF18A60;
  v4[1] = &unk_26CF18A78;
  v5[0] = @"BUAccountsTypeNone";
  v5[1] = @"BUAccountsTypeITunesStore";
  v4[2] = &unk_26CF18A90;
  v5[2] = @"BUAccountsTypeICloudAccount";
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v5, v4, 3);
  v3 = (void *)qword_26AB40518;
  qword_26AB40518 = v2;
}

void sub_21E1C8558(void *a1, const char *a2)
{
  v3 = *(void **)(a1[4] + 104);
  v4 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a1[6]);
  objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  *(void *)(*(void *)(a1[5] + 8) + 24) = objc_msgSend_count(v8, v6, v7);
}

uint64_t sub_21E1C85E8(uint64_t a1, const char *a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend_l_activeStoreAccount(*(void **)(a1 + 32), a2, a3);

  return MEMORY[0x270F9A758]();
}

id sub_21E1C8634()
{
  if (qword_26AB40528 != -1) {
    dispatch_once(&qword_26AB40528, &unk_26CF10830);
  }
  v0 = (void *)qword_26AB40530;

  return v0;
}

uint64_t sub_21E1C8688()
{
  kdebug_trace();
  uint64_t v1 = objc_msgSend_ams_sharedAccountStoreForMediaType_(MEMORY[0x263EFB210], v0, *MEMORY[0x263F277F0]);
  v2 = (void *)qword_26AB40530;
  qword_26AB40530 = v1;

  return kdebug_trace();
}

void sub_21E1C8860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1C8878(uint64_t a1)
{
  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend_activeStoreAccount(v8, v1, v2);
  v6 = objc_msgSend_ams_DSID(v3, v4, v5);
  objc_msgSend_nq_setupNotifyBlockForAccountType_currentAccountIdentifier_(v8, v7, 1, v6);
}

void sub_21E1C8A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1C8B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BUIsRunningTests()
{
  if (qword_26AB40578 != -1) {
    dispatch_once(&qword_26AB40578, &unk_26CF10B18);
  }
  return byte_26AB404B0;
}

void sub_21E1C8F24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_21E1C925C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21E1C9480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

id BUProtocolCast(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v6 = v4;
  if (v4 && objc_msgSend_conformsToProtocol_(v4, v5, (uint64_t)v3)) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

id BUStoreIdStringFromObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  id v3 = BUDynamicCast(v2, v1);
  if (!v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = objc_msgSend_stringValue(v1, v4, v5);
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

id BUDynamicCast(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id BookUtilityLog()
{
  if (qword_26AB405A8 != -1) {
    dispatch_once(&qword_26AB405A8, &unk_26CF10B38);
  }
  v0 = (void *)qword_26AB405A0;

  return v0;
}

id BUAssertionLog()
{
  if (qword_26AB404C0 != -1) {
    dispatch_once(&qword_26AB404C0, &unk_26CF10B98);
  }
  v0 = (void *)qword_26AB404B8;

  return v0;
}

id NSStringFromBUAccountsType(uint64_t a1, const char *a2)
{
  if (qword_26AB40520 != -1) {
    dispatch_once(&qword_26AB40520, &unk_26CF10BB8);
  }
  id v3 = (void *)qword_26AB40518;
  id v4 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a1);
  v6 = objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)v4);

  return v6;
}

void sub_21E1C9750(void *a1, const char *a2)
{
  id v3 = *(void **)(a1[4] + 104);
  id v4 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a1[7]);
  objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)v4);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend_weakObjectsHashTable(MEMORY[0x263F088B0], v6, v7);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = *(void **)(a1[4] + 104);
    v10 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v9, a1[7]);
    objc_msgSend_setObject_forKeyedSubscript_(v8, v11, (uint64_t)v14, v10);
  }
  objc_msgSend_addObject_(v14, v6, a1[5]);
  *(void *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend_count(v14, v12, v13);
}

__CFString *BUOnboardingBooksBundleID()
{
  return @"com.apple.onboarding.ibooks";
}

uint64_t BUIsGDPRAcknowledgementNeededForBooks()
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F27AE0], sel_acknowledgementNeededForPrivacyIdentifier_, @"com.apple.onboarding.ibooks");
}

uint64_t sub_21E1C9858(uint64_t a1, const char *a2)
{
  return objc_msgSend__registerNotificationForAccountTypeIfNeeded_(*(void **)(a1 + 32), a2, 1);
}

uint64_t sub_21E1C9864()
{
  qword_26AB40540 = objc_alloc_init(BUAccountsProvider);

  return MEMORY[0x270F9A758]();
}

void sub_21E1C9A38(uint64_t a1)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  kdebug_trace();
  id v4 = objc_msgSend_offlineCacheProvider(*(void **)(a1 + 32), v2, v3);
  objc_msgSend_setOfflineCacheProvider_(*(void **)(a1 + 32), v5, 0);
  if (objc_msgSend_runFromCache(v4, v6, v7))
  {
    if (objc_msgSend_isMainThread(MEMORY[0x263F08B88], v8, v9))
    {
      v10 = BookUtilityLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_21E1F07BC(v10);
      }
    }
    v11 = BookUtilityLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E1C7000, v11, OS_LOG_TYPE_INFO, "Using bag values provided by offline cache", buf, 2u);
    }

    v12 = objc_opt_new();
    v15 = objc_msgSend_distantFuture(MEMORY[0x263EFF910], v13, v14);
    objc_msgSend_setExpirationDate_(v12, v16, (uint64_t)v15);

    objc_msgSend_setProfile_(v12, v17, @"iBooks");
    objc_msgSend_setProfileVersion_(v12, v18, @"1");
    v21 = objc_msgSend_loadCache(v4, v19, v20);
    objc_msgSend_setData_(v12, v22, (uint64_t)v21);

    id v90 = 0;
    objc_msgSend_buildWithError_(v12, v23, (uint64_t)&v90);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v25 = v90;
    if (v25)
    {
      v26 = BookUtilityLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_21E1F0750((uint64_t)v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
    goto LABEL_26;
  }
  v33 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v8, v9);
  v36 = objc_msgSend_executableURL(v33, v34, v35);
  v39 = objc_msgSend_lastPathComponent(v36, v37, v38);
  int isEqualToString = objc_msgSend_isEqualToString_(v39, v40, @"bookdatastored");

  if (isEqualToString)
  {
    v44 = BookUtilityLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E1C7000, v44, OS_LOG_TYPE_DEFAULT, "Fixing the request process info so we actually get results...", buf, 2u);
    }

    v47 = objc_msgSend_currentProcess(MEMORY[0x263F27E08], v45, v46);
    v50 = objc_msgSend_copy(v47, v48, v49);

    objc_msgSend_setBundleIdentifier_(v50, v51, @"com.apple.bookdatastored");
    v54 = objc_msgSend_bundleIdentifier(v50, v52, v53);
    objc_msgSend_setExecutableName_(v50, v55, (uint64_t)v54);
  }
  else
  {
    v57 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v42, v43);
    v60 = objc_msgSend_executableURL(v57, v58, v59);
    v63 = objc_msgSend_lastPathComponent(v60, v61, v62);
    int v65 = objc_msgSend_isEqualToString_(v63, v64, @"booklibraryctl");

    if (!v65)
    {
      v75 = objc_msgSend_bagForProfile_profileVersion_(MEMORY[0x263F27B28], v66, @"iBooks", @"1");
      goto LABEL_23;
    }
    v67 = BookUtilityLog();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E1C7000, v67, OS_LOG_TYPE_DEFAULT, "Fixing the request process info so we actually get results...", buf, 2u);
    }

    v70 = objc_msgSend_currentProcess(MEMORY[0x263F27E08], v68, v69);
    v50 = objc_msgSend_copy(v70, v71, v72);

    objc_msgSend_setBundleIdentifier_(v50, v73, @"com.apple.iBooks");
    objc_msgSend_setExecutableName_(v50, v74, @"com.apple.iBooks");
  }
  v75 = objc_msgSend_bagForProfile_profileVersion_processInfo_(MEMORY[0x263F27B28], v56, @"iBooks", @"1", v50);

LABEL_23:
  v76 = BookUtilityLog();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    v79 = objc_msgSend__defaultValueDictionary(*(void **)(a1 + 32), v77, v78);
    v81 = objc_msgSend_ams_componentsJoinedByString_(v79, v80, @", ");
    *(_DWORD *)buf = 138412290;
    v94 = v81;
    _os_log_impl(&dword_21E1C7000, v76, OS_LOG_TYPE_DEFAULT, "Setting up default values: %@", buf, 0xCu);
  }
  v84 = objc_msgSend__defaultValueDictionary(*(void **)(a1 + 32), v82, v83);
  v91[0] = MEMORY[0x263EF8330];
  v91[1] = 3221225472;
  v91[2] = sub_21E1C9F74;
  v91[3] = &unk_26449D510;
  id v24 = v75;
  id v92 = v24;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v84, v85, (uint64_t)v91);

  v12 = v92;
LABEL_26:

  v86 = [BUBag alloc];
  uint64_t v88 = objc_msgSend_initWithBackingBag_(v86, v87, (uint64_t)v24);
  v89 = (void *)qword_26AB40570;
  qword_26AB40570 = v88;

  kdebug_trace();
}

uint64_t sub_21E1C9F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_setDefaultValue_forKey_, a3);
}

void sub_21E1CAE58(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v9 = a4;
  if (v9)
  {
    v10 = BookUtilityLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21E1F0844((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
LABEL_4:
    uint64_t v17 = 1;
    goto LABEL_5;
  }
  if (!v6)
  {
    v10 = BookUtilityLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_21E1C7000, v10, OS_LOG_TYPE_DEFAULT, "Defaulting isAudiobooksStoreEnabled to 1", (uint8_t *)v20, 2u);
    }
    goto LABEL_4;
  }
  uint64_t v17 = objc_msgSend_BOOLValue(v6, v7, v8);
  v10 = BookUtilityLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v20[0] = 67109120;
    v20[1] = v17;
    _os_log_impl(&dword_21E1C7000, v10, OS_LOG_TYPE_DEFAULT, "isAudiobooksStoreEnabled %d", (uint8_t *)v20, 8u);
  }
LABEL_5:

  uint64_t v18 = MEMORY[0x223C22A70](*(void *)(a1 + 32));
  v19 = (void *)v18;
  if (v18) {
    (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, v17);
  }
}

void sub_21E1CB08C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v9 = a4;
  if (v9)
  {
    v10 = BookUtilityLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21E1F08B0((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }

    goto LABEL_5;
  }
  if (!v6)
  {
LABEL_5:
    BOOL v17 = 0;
    goto LABEL_8;
  }
  BOOL v17 = objc_msgSend_length(v6, v7, v8) != 0;
LABEL_8:
  uint64_t v18 = MEMORY[0x223C22A70](*(void *)(a1 + 32));
  v19 = (void *)v18;
  if (v18) {
    (*(void (**)(uint64_t, BOOL))(v18 + 16))(v18, v17);
  }
}

void sub_21E1CB1C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21E1CB6D4()
{
  v0 = BUBundle();
  objc_msgSend_bundleIdentifier(v0, v1, v2);
  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v3 = [NSString alloc];
  if (v9) {
    id v4 = v9;
  }
  else {
    id v4 = @"com.apple.Unknown";
  }
  uint64_t v5 = getpid();
  uint64_t v7 = objc_msgSend_initWithFormat_(v3, v6, @"%@_%d", v4, v5);
  uint64_t v8 = (void *)qword_267D29860;
  qword_267D29860 = v7;
}

void sub_21E1CB780(void *a1, const char *a2, unint64_t a3)
{
  id v20 = (id)objc_msgSend_mutableCopy(@"          ", a2, a3);
  for (unint64_t i = objc_msgSend_length(v20, v5, v6); i < a3; unint64_t i = objc_msgSend_length(v20, v10, v11))
    objc_msgSend_appendString_(v20, v8, (uint64_t)v20);
  uint64_t v12 = objc_msgSend_length(v20, v8, v9);
  objc_msgSend_deleteCharactersInRange_(v20, v13, a3, v12 - a3);
  objc_msgSend_insertString_atIndex_(a1, v14, (uint64_t)v20, 0);
  uint64_t v15 = objc_msgSend_stringWithFormat_(NSString, (const char *)v20, @"\n%@", v20);
  uint64_t v18 = objc_msgSend_length(a1, v16, v17);
  objc_msgSend_replaceOccurrencesOfString_withString_options_range_(a1, v19, @"\n", v15, 0, 0, v18);
}

id BUArrayDescription(void *a1)
{
  id v1 = a1;
  uint64_t v4 = objc_msgSend_count(v1, v2, v3);
  uint64_t v6 = objc_msgSend_descriptionWithObject_format_(BUDescription, v5, (uint64_t)v1, @" count=%lu", v4);;
  if (objc_msgSend_count(v1, v7, v8))
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = objc_msgSend_stringWithFormat_(NSString, v9, @"[%lu]", v11);
      uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(v1, v13, v11);
      objc_msgSend_addField_format_(v6, v15, (uint64_t)v12, @"%@", v14);

      ++v11;
    }
    while (v11 < objc_msgSend_count(v1, v16, v17));
  }
  objc_msgSend_setFieldOptionCommaSeparated(v6, v9, v10);
  id v20 = objc_msgSend_descriptionString(v6, v18, v19);

  return v20;
}

__CFString *BUObjectReferenceDescription(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v3 = NSString;
    ClassName = object_getClassName(v1);
    uint64_t v7 = ClassName;
    if (isKindOfClass)
    {
      uint64_t v11 = objc_msgSend_count(v1, v5, v6);
      objc_msgSend_stringWithFormat_(v3, v8, @"(%s*)%p; count=%lu", v7, v1, v11);
    }
    else
    {
      objc_msgSend_stringWithFormat_(v3, v5, @"(%s*)%p", ClassName, v1);
    }
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = @"<nil>";
  }

  return v9;
}

id sub_21E1CC75C(void *a1, const char *a2, unint64_t a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a3 > 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = off_26449D5E0[a3];
  }
  uint64_t v10 = *MEMORY[0x263F08320];
  v11[0] = v5;
  uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v11, &v10, 1);
  uint64_t v8 = objc_msgSend_errorWithDomain_code_userInfo_(a1, v7, @"com.apple.iBooks.BUIO", a3, v6);

  return v8;
}

id sub_21E1CC840(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v9 = objc_msgSend_count(v5, v7, v8);
  uint64_t v11 = objc_msgSend_initWithCapacity_(v6, v10, v9 + 1);
  uint64_t v13 = v11;
  if (v5) {
    objc_msgSend_addEntriesFromDictionary_(v11, v12, (uint64_t)v5);
  }
  uint64_t v14 = objc_msgSend_numberWithInteger_(NSNumber, v12, a3);
  objc_msgSend_setObject_forKeyedSubscript_(v13, v15, (uint64_t)v14, @"BUIOErrorType");

  return v13;
}

id sub_21E1CC8F0(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F07F70];
  id v5 = objc_msgSend_bu_userInfoWithErrorType_userInfo_(a1, a2, 0, a3);
  uint64_t v7 = objc_msgSend_errorWithDomain_code_userInfo_(v3, v6, v4, 256, v5);

  return v7;
}

id sub_21E1CC970(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F07F70];
  id v5 = objc_msgSend_bu_userInfoWithErrorType_userInfo_(a1, a2, 0, a3);
  uint64_t v7 = objc_msgSend_errorWithDomain_code_userInfo_(v3, v6, v4, 259, v5);

  return v7;
}

id sub_21E1CC9F0(void *a1, const char *a2, int a3)
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F08438];
  uint64_t v5 = a3;
  id v6 = objc_msgSend_bu_userInfoWithErrorType_userInfo_(a1, a2, 0);
  uint64_t v8 = objc_msgSend_errorWithDomain_code_userInfo_(v3, v7, v4, v5, v6);

  return v8;
}

id sub_21E1CCA70(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F07F70];
  uint64_t v5 = objc_msgSend_bu_userInfoWithErrorType_userInfo_(a1, a2, 1, a3);
  uint64_t v7 = objc_msgSend_errorWithDomain_code_userInfo_(v3, v6, v4, 512, v5);

  return v7;
}

id sub_21E1CCAF0(void *a1, uint64_t a2, int a3, void *a4)
{
  id v6 = (objc_class *)MEMORY[0x263F087E8];
  id v7 = a4;
  id v8 = [v6 alloc];
  uint64_t v9 = *MEMORY[0x263F08438];
  uint64_t v11 = objc_msgSend_bu_userInfoWithErrorType_userInfo_(a1, v10, 1, v7);

  uint64_t v13 = objc_msgSend_initWithDomain_code_userInfo_(v8, v12, v9, a3, v11);

  return v13;
}

uint64_t sub_21E1CCB9C(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](a1, sel_bu_isErrorPassingTest_, &unk_26CF10850);
}

uint64_t sub_21E1CCBA8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v8 = a4;
  if (a3 == 256 && (objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x263F07F70]) & 1) != 0)
  {
    uint64_t isEqual = 1;
  }
  else
  {
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v8, v7, @"BUIOErrorType");
    uint64_t isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)&unk_26CF18A30);
  }
  return isEqual;
}

uint64_t sub_21E1CCC44(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](a1, sel_bu_isErrorPassingTest_, &unk_26CF10870);
}

uint64_t sub_21E1CCC50(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3 == 259) {
    return objc_msgSend_isEqualToString_(a2, (const char *)a2, *MEMORY[0x263F07F70]);
  }
  else {
    return 0;
  }
}

uint64_t sub_21E1CCC74(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](a1, sel_bu_isErrorPassingTest_, &unk_26CF10890);
}

uint64_t sub_21E1CCC80(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v8 = a4;
  if (a3 == 512 && (objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x263F07F70]) & 1) != 0)
  {
    uint64_t isEqual = 1;
  }
  else
  {
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v8, v7, @"BUIOErrorType");
    uint64_t isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)&unk_26CF18A48);
  }
  return isEqual;
}

id sub_21E1CCD1C(void *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4 = 0;
  memset(&v13.tm_wday, 0, 32);
  v13.tm_isdst = -1;
  v13.tm_sec = (a3 >> 15) & 0x3E;
  v13.tm_min = (a3 >> 21) & 0x3F;
  v13.tm_hour = a3 >> 27;
  v13.tm_mday = a3 & 0x1F;
  int32x2_t v5 = (int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a3), (uint32x2_t)0xFFFFFFF7FFFFFFFBLL), (int8x8_t)0x7F0000000FLL);
  *(int32x2_t *)&v13.tm_mon = vadd_s32(v5, (int32x2_t)0x50FFFFFFFFLL);
  BOOL v7 = (v5.i32[0] - 13) < 0xFFFFFFF4 || (a3 & 0x1F) == 0 || a3 >> 30 == 3;
  if (!v7 && ((a3 >> 21) & 0x3F) <= 0x3B && ((a3 >> 15) & 0x3E) <= 0x3B)
  {
    id v8 = a1;
    time_t v9 = mktime(&v13);
    uint64_t v4 = objc_msgSend_initWithTimeIntervalSince1970_(v8, v10, v11, (double)v9);
  }

  return v4;
}

uint64_t sub_21E1CCDF8(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_timeIntervalSince1970(a1, a2, a3);
  time_t v7 = (uint64_t)v3;
  uint64_t v4 = localtime(&v7);
  int tm_year = v4->tm_year;
  if (tm_year <= 81) {
    LOWORD(tm_year) = 81;
  }
  return (unsigned __int16)((32 * v4->tm_mon + 32) | v4->tm_mday | (((_WORD)tm_year << 9) + 24576)) | ((unsigned __int16)((32 * LOWORD(v4->tm_min)) | ((unsigned __int16)v4->tm_hour << 11) | ((unsigned __int16)v4->tm_sec >> 1)) << 16);
}

id sub_21E1CCE70(uint64_t a1, uint64_t a2, void *a3)
{
  double v3 = (void *)MEMORY[0x263EFB210];
  id v4 = a3;
  time_t v7 = objc_msgSend_bu_sharedAccountStore(v3, v5, v6);
  time_t v9 = objc_msgSend_ams_iTunesAccountWithDSID_(v7, v8, (uint64_t)v4);

  return v9;
}

void sub_21E1CCEE0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x263EFB210];
  id v5 = a3;
  objc_msgSend_bu_sharedAccountStore(v4, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAccount_withCompletionHandler_(v9, v8, a1, v5);
}

id sub_21E1CCF54(void *a1, const char *a2)
{
  objc_msgSend_ams_setActive_forMediaType_(a1, a2, 0, 0);
  id v5 = objc_msgSend_bu_sharedAccountStore(MEMORY[0x263EFB210], v3, v4);
  uint64_t v7 = objc_msgSend_ams_saveAccount_verifyCredentials_(v5, v6, (uint64_t)a1, 0);

  return v7;
}

id sub_21E1CCFC0(void *a1, const char *a2, uint64_t a3)
{
  if (!objc_msgSend_length(a1, a2, a3))
  {
    id v20 = a1;
    goto LABEL_14;
  }
  uint64_t v6 = objc_msgSend_length(a1, v4, v5);
  unint64_t v9 = objc_msgSend_length(a1, v7, v8);
  uint64_t v11 = objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v10, v6 + (v9 >> 1));
  id v12 = a1;
  uint64_t v15 = objc_msgSend_bytes(v12, v13, v14);
  v35.avail_in = objc_msgSend_length(v12, v16, v17, v15, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  v35.zalloc = 0;
  v35.zfree = 0;
  v35.uLong total_out = 0;
  id v20 = 0;
  if (!inflateInit2_(&v35, -15, "1.2.12", 112))
  {
    uint64_t v21 = v9 >> 1;
    do
    {
      uLong total_out = v35.total_out;
      if (total_out >= objc_msgSend_length(v11, v18, v19)) {
        objc_msgSend_increaseLengthBy_(v11, v23, v21);
      }
      id v24 = v11;
      uint64_t v27 = objc_msgSend_mutableBytes(v24, v25, v26);
      v35.next_out = (Bytef *)(v27 + v35.total_out);
      int v30 = objc_msgSend_length(v24, v28, v29);
      v35.avail_out = v30 - LODWORD(v35.total_out);
      int v31 = inflate(&v35, 2);
    }
    while (!v31);
    if (v31 == 1)
    {
      if (!inflateEnd(&v35))
      {
        objc_msgSend_setLength_(v24, v32, v35.total_out);
        objc_msgSend_dataWithData_(MEMORY[0x263EFF8F8], v33, (uint64_t)v24);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {
      inflateEnd(&v35);
    }
    id v20 = 0;
  }
LABEL_13:

LABEL_14:

  return v20;
}

id sub_21E1CD160(void *a1, const char *a2, uint64_t a3)
{
  if (objc_msgSend_length(a1, a2, a3))
  {
    memset(&v27.total_out, 0, 72);
    id v4 = a1;
    uint64_t v7 = objc_msgSend_bytes(v4, v5, v6);
    v27.avail_in = objc_msgSend_length(v4, v8, v9, v7, (unsigned __int128)0, (unsigned __int128)0);
    id v11 = 0;
    if (!deflateInit2_(&v27, 9, 8, -15, 9, 0, "1.2.12", 112))
    {
      uint64_t v14 = objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v10, 0x4000);
      do
      {
        uLong total_out = v27.total_out;
        if (total_out >= objc_msgSend_length(v14, v12, v13)) {
          objc_msgSend_increaseLengthBy_(v14, v16, 0x4000);
        }
        id v17 = v14;
        uint64_t v20 = objc_msgSend_mutableBytes(v17, v18, v19);
        v27.next_out = (Bytef *)(v20 + v27.total_out);
        int v23 = objc_msgSend_length(v17, v21, v22);
        v27.avail_out = v23 - LODWORD(v27.total_out);
        deflate(&v27, 4);
      }
      while (!v27.avail_out);
      deflateEnd(&v27);
      objc_msgSend_setLength_(v17, v24, v27.total_out);
      objc_msgSend_dataWithData_(MEMORY[0x263EFF8F8], v25, (uint64_t)v17);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v11 = a1;
  }

  return v11;
}

id BUOnboardingAllBundleIDs(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  double v3 = objc_msgSend_defaultBag(BUBag, a2, a3);
  uint64_t v6 = objc_msgSend_onboardingPersonalizationID(v3, v4, v5);
  uint64_t v9 = objc_msgSend_valuePromise(v6, v7, v8);

  id v12 = objc_msgSend_date(MEMORY[0x263EFF910], v10, v11);
  id v32 = 0;
  uint64_t v14 = objc_msgSend_resultWithTimeout_error_(v9, v13, (uint64_t)&v32, 1.0);
  id v15 = v32;
  uint64_t v18 = v15;
  if (v15 && objc_msgSend_code(v15, v16, v17) != 204)
  {
    uint64_t v19 = BookUtilityLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_21E1F09A8((uint64_t)v18, v19);
    }
  }
  uint64_t v20 = objc_msgSend_date(MEMORY[0x263EFF910], v16, v17);
  objc_msgSend_timeIntervalSinceDate_(v20, v21, (uint64_t)v12);
  uint64_t v23 = v22;

  id v24 = BookUtilityLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v23;
    _os_log_impl(&dword_21E1C7000, v24, OS_LOG_TYPE_DEFAULT, "BUOnboardingAllBundleIDs: resultWithTimeout elapsedTime: %f", buf, 0xCu);
  }

  uint64_t v26 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF980], v25, @"com.apple.onboarding.ibooks");
  uint64_t v29 = v26;
  if (v14) {
    objc_msgSend_addObject_(v26, v27, (uint64_t)v14);
  }
  int v30 = objc_msgSend_copy(v29, v27, v28);

  return v30;
}

void sub_21E1CD654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1CD66C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend_entriesCountImpl(*(void **)(a1 + 32), a2, a3);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_21E1CD83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1CD854(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E1CD864(uint64_t a1)
{
}

void sub_21E1CD86C(uint64_t a1)
{
}

uint64_t sub_21E1CD980(uint64_t a1, const char *a2)
{
  return objc_msgSend_beginEntryWithNameImpl_force32BitSize_lastModificationDate_size_CRC_forceCalculatingSizeAndCRCForPreservingLastModificationDate_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 68), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned int *)(a1 + 64), *(unsigned __int8 *)(a1 + 69));
}

uint64_t sub_21E1CDD00(uint64_t a1, const char *a2)
{
  return objc_msgSend_addDataImpl_queue_completion_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

uint64_t sub_21E1CE014(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_21E1CE028(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_21E1CE03C(uint64_t a1, const char *a2, uint64_t a3, const Bytef *a4, unint64_t a5)
{
  uint64_t v8 = objc_msgSend_currentEntry(*(void **)(a1 + 32), a2, a3);
  unsigned int v11 = objc_msgSend_CRC(v8, v9, v10);
  if (a5 >= 0xFFFFFFFF) {
    uInt v12 = -1;
  }
  else {
    uInt v12 = a5;
  }
  uLong v13 = crc32(v11, a4, v12);
  uint64_t v16 = objc_msgSend_currentEntry(*(void **)(a1 + 32), v14, v15);
  objc_msgSend_setCRC_(v16, v17, v13);

  return 1;
}

void sub_21E1CE29C(void **a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[4];
  if (v9[16])
  {
    BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 269, (uint64_t)"-[BUZipWriter flushCurrentEntryWithQueue:completion:]_block_invoke", (uint64_t)"!self->_closed", @"Trying to flush while closed.", a6, a7, a8, v28);
    BUCrashBreakpoint();
    if (BUIsRunningTests()) {
      BUCrashFinalThrow(@"Trying to flush while closed.", v10, v11, v12, v13, v14, v15, v16, v29);
    }
    __break(1u);
  }
  else
  {
    uint64_t v17 = objc_msgSend_error(v9, a2, a3);

    uint64_t v20 = a1[4];
    if (v17)
    {
      uint64_t v21 = objc_msgSend_error(v20, v18, v19);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_21E1CE458;
      block[3] = &unk_26449D6A0;
      uint64_t v22 = a1[5];
      id v23 = a1[6];
      id v34 = v21;
      id v35 = v23;
      id v24 = v21;
      dispatch_async(v22, block);
    }
    else
    {
      objc_msgSend_finishEntry(v20, v18, v19);
      z_stream v27 = objc_msgSend_channelQueue(a1[4], v25, v26);
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = sub_21E1CE46C;
      v30[3] = &unk_26449D740;
      v30[4] = a1[4];
      id v32 = a1[6];
      id v31 = a1[5];
      dispatch_async(v27, v30);
    }
  }
}

uint64_t sub_21E1CE458(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_21E1CE46C(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_channelQueue(*(void **)(a1 + 32), a2, a3);
  dispatch_suspend(v4);

  uint64_t v7 = objc_msgSend_p_writeChannel(*(void **)(a1 + 32), v5, v6);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E1CE53C;
  v12[3] = &unk_26449D718;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  id v14 = v8;
  v12[4] = v9;
  id v13 = v10;
  objc_msgSend_flushWithCompletion_(v7, v11, (uint64_t)v12);
}

void sub_21E1CE53C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = v3;
  if (*(void *)(a1 + 48))
  {
    if (v3)
    {
      id v7 = v3;
    }
    else
    {
      objc_msgSend_error(*(void **)(a1 + 32), v4, v5);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v8 = v7;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = sub_21E1CE62C;
    uint64_t v16 = &unk_26449D6A0;
    uint64_t v9 = *(NSObject **)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v17 = v8;
    id v18 = v10;
    id v11 = v8;
    dispatch_async(v9, &v13);
  }
  uint64_t v12 = objc_msgSend_channelQueue(*(void **)(a1 + 32), v4, v5, v13, v14, v15, v16);
  dispatch_resume(v12);
}

uint64_t sub_21E1CE62C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_21E1CE8DC(uint64_t a1, int a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  if (a2)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v7 == 0);
    }
  }
}

void sub_21E1CEAA4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = *(unsigned char **)(a1 + 32);
  if (v9[16])
  {
    BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 350, (uint64_t)"-[BUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:]_block_invoke", (uint64_t)"!self->_closed", @"Already closed.", a6, a7, a8, v21[0]);
    BUCrashBreakpoint();
    if (BUIsRunningTests()) {
      BUCrashFinalThrow(@"Already closed.", v10, v11, v12, v13, v14, v15, v16, v21[0]);
    }
    __break(1u);
  }
  else
  {
    id v17 = objc_msgSend_writeQueue(v9, a2, a3);
    dispatch_suspend(v17);

    objc_msgSend_beginEntryWithNameImpl_force32BitSize_lastModificationDate_size_CRC_forceCalculatingSizeAndCRCForPreservingLastModificationDate_(*(void **)(a1 + 32), v18, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 84), *(void *)(a1 + 48), *(void *)(a1 + 72), *(unsigned int *)(a1 + 80), 0);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = (uint64_t)sub_21E1CEBBC;
    v21[3] = (uint64_t)&unk_26449D7B8;
    v21[4] = *(void *)(a1 + 32);
    uint64_t v19 = *(void **)(a1 + 56);
    id v22 = *(id *)(a1 + 64);
    objc_msgSend_readWithHandler_(v19, v20, (uint64_t)v21);
  }
}

void sub_21E1CEBBC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  objc_msgSend_handleWriteError_(*(void **)(a1 + 32), v8, a4);
  if (v7)
  {
    uint64_t v11 = objc_msgSend_error(*(void **)(a1 + 32), v9, v10);

    if (!v11) {
      objc_msgSend_addDataImpl_queue_completion_(*(void **)(a1 + 32), v9, (uint64_t)v7, 0, 0);
    }
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12)
  {
    char v18 = 0;
    uint64_t v13 = objc_msgSend_error(*(void **)(a1 + 32), v9, v10);
    (*(void (**)(uint64_t, uint64_t, id, void *, char *))(v12 + 16))(v12, a2, v7, v13, &v18);

    if (v18)
    {
      uint64_t v14 = *(void **)(a1 + 32);
      uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v9, *MEMORY[0x263F07F70], 3072, 0);
      objc_msgSend_handleWriteError_(v14, v16, (uint64_t)v15);
    }
  }
  if (a2)
  {
    id v17 = objc_msgSend_writeQueue(*(void **)(a1 + 32), v9, v10);
    dispatch_resume(v17);
  }
}

uint64_t sub_21E1CEDCC(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_addExistingEntryImpl_, *(void *)(a1 + 40));
}

uint64_t sub_21E1CEFA0(uint64_t a1, const char *a2)
{
  return objc_msgSend_setEntryInsertionOffsetImpl_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40));
}

void sub_21E1CF070(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_writeQueue(*(void **)(a1 + 32), a2, a3);
  dispatch_suspend(v4);

  id v7 = objc_msgSend_channelQueue(*(void **)(a1 + 32), v5, v6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E1CF12C;
  v9[3] = &unk_26449D858;
  uint64_t v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  dispatch_async(v7, v9);
}

void sub_21E1CF12C(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_channelQueue(*(void **)(a1 + 32), a2, a3);
  dispatch_suspend(v4);

  id v7 = objc_msgSend_p_writeChannel(*(void **)(a1 + 32), v5, v6);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_21E1CF1E8;
  v10[3] = &unk_26449D6A0;
  id v8 = *(id *)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v8;
  objc_msgSend_addBarrier_(v7, v9, (uint64_t)v10);
}

void sub_21E1CF1E8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = objc_msgSend_channelQueue(*(void **)(a1 + 32), v2, v3);
  dispatch_resume(v4);

  id v7 = objc_msgSend_writeQueue(*(void **)(a1 + 32), v5, v6);
  dispatch_resume(v7);
}

void sub_21E1CF338(void **a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = a1[4];
  if (v9[16])
  {
    BUReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderServices/frameworks/BookUtility/zip/BUZipWriter.m", 450, (uint64_t)"-[BUZipWriter closeWithQueue:completion:]_block_invoke", (uint64_t)"!self->_closed", @"Shouldn't have closed twice.", a6, a7, a8, v33);
    BUCrashBreakpoint();
    if (BUIsRunningTests()) {
      BUCrashFinalThrow(@"Shouldn't have closed twice.", v10, v11, v12, v13, v14, v15, v16, v34);
    }
    __break(1u);
  }
  else
  {
    id v17 = objc_msgSend_error(v9, a2, a3);

    uint64_t v20 = a1[4];
    if (v17)
    {
      objc_msgSend_setClosed_(v20, v18, 1);
      id v23 = objc_msgSend_error(a1[4], v21, v22);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_21E1CF514;
      block[3] = &unk_26449D6A0;
      id v24 = a1[5];
      id v25 = a1[6];
      id v39 = v23;
      id v40 = v25;
      id v26 = v23;
      dispatch_async(v24, block);
    }
    else
    {
      objc_msgSend_finishEntry(v20, v18, v19);
      objc_msgSend_writeCentralDirectory(a1[4], v27, v28);
      objc_msgSend_setClosed_(a1[4], v29, 1);
      id v32 = objc_msgSend_channelQueue(a1[4], v30, v31);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = sub_21E1CF528;
      v35[3] = &unk_26449D740;
      v35[4] = a1[4];
      id v37 = a1[6];
      id v36 = a1[5];
      dispatch_async(v32, v35);
    }
  }
}

uint64_t sub_21E1CF514(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_21E1CF528(void **a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_channelQueue(a1[4], a2, a3);
  dispatch_suspend(v4);

  id v7 = objc_msgSend_p_writeChannel(a1[4], v5, v6);
  objc_initWeak(&location, v7);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21E1CF64C;
  v9[3] = &unk_26449D880;
  objc_copyWeak(&v12, &location);
  v9[4] = a1[4];
  id v11 = a1[6];
  id v10 = a1[5];
  objc_msgSend_addBarrier_(v7, v8, (uint64_t)v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void sub_21E1CF630(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21E1CF64C(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend_close(WeakRetained, v3, v4);
  id v7 = objc_msgSend_writeQueue(a1[4], v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1CF724;
  block[3] = &unk_26449D740;
  void block[4] = a1[4];
  id v10 = a1[6];
  id v9 = a1[5];
  dispatch_async(v7, block);
}

void sub_21E1CF724(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_writeChannelCompletionGroup(*(void **)(a1 + 32), a2, a3);
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  if (*(void *)(a1 + 48))
  {
    id v7 = objc_msgSend_error(*(void **)(a1 + 32), v5, v6);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = sub_21E1CF818;
    uint64_t v15 = &unk_26449D6A0;
    id v8 = *(NSObject **)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v16 = v7;
    id v17 = v9;
    id v10 = v7;
    dispatch_async(v8, &v12);
  }
  id v11 = objc_msgSend_channelQueue(*(void **)(a1 + 32), v5, v6, v12, v13, v14, v15);
  dispatch_resume(v11);
}

uint64_t sub_21E1CF818(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_21E1D01C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x223C22A70](*(void *)(a1 + 40));
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    if (v6)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = sub_21E1D02B0;
      v9[3] = &unk_26449D6A0;
      id v11 = v4;
      id v10 = v3;
      dispatch_async((dispatch_queue_t)v6, v9);
    }
    else
    {
      id v7 = (void (*)(void *, id))v4[2];
      id v8 = 0;
      v7(v5, v3);
    }
  }
}

uint64_t sub_21E1D02B0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_21E1D03B0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_channelQueue(*(void **)(a1 + 32), a2, a3);
  dispatch_suspend(v4);

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_21E1CD854;
  v15[4] = sub_21E1CD864;
  id v16 = 0;
  id v7 = objc_msgSend_p_writeChannel(*(void **)(a1 + 32), v5, v6);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21E1D04F4;
  v12[3] = &unk_26449D8F8;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v14 = v15;
  v12[4] = v8;
  uint64_t v10 = *(void *)(a1 + 56);
  id v13 = *(id *)(a1 + 48);
  objc_msgSend_writeData_offset_handler_(v7, v11, v9, v10, v12);

  _Block_object_dispose(v15, 8);
}

void sub_21E1D04DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1D04F4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v10 = a4;
  if (v10 && (v11 = *(void *)(*(void *)(a1 + 48) + 8), uint64_t v13 = *(void *)(v11 + 40), v12 = (id *)(v11 + 40), !v13))
  {
    objc_storeStrong(v12, a4);
    if (!a2) {
      goto LABEL_11;
    }
  }
  else if (!a2)
  {
    goto LABEL_11;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v14 = objc_msgSend_writeQueue(*(void **)(a1 + 32), v8, v9);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_21E1D0638;
    v21[3] = &unk_26449D8D0;
    uint64_t v15 = *(void *)(a1 + 48);
    v21[4] = *(void *)(a1 + 32);
    uint64_t v21[5] = v15;
    dispatch_async(v14, v21);
  }
  uint64_t v16 = MEMORY[0x223C22A70](*(void *)(a1 + 40));
  id v17 = (void *)v16;
  if (v16) {
    (*(void (**)(uint64_t, void))(v16 + 16))(v16, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }

  uint64_t v20 = objc_msgSend_channelQueue(*(void **)(a1 + 32), v18, v19);
  dispatch_resume(v20);

LABEL_11:
}

uint64_t sub_21E1D0638(uint64_t a1, const char *a2)
{
  return objc_msgSend_handleWriteError_(*(void **)(a1 + 32), a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_21E1D0798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1D07B0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend_currentOffset(*(void **)(a1 + 32), a2, a3);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_21E1D0914(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_p_writeChannel(*(void **)(a1 + 32), a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_close(v5, v3, v4);
}

void sub_21E1D0A0C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  unsigned __int8 v49 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v4 = objc_msgSend_entries(*(void **)(a1 + 32), a2, a3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v45, v50, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v46;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v46 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v45 + 1) + 8 * v9);
      uint64_t v11 = objc_alloc_init(BUZipEntry);
      uint64_t v14 = objc_msgSend_name(v10, v12, v13);
      objc_msgSend_setName_(v11, v15, (uint64_t)v14);

      objc_msgSend_name(v11, v16, v17);
      id v18 = objc_claimAutoreleasedReturnValue();
      uint64_t v21 = (const char *)objc_msgSend_UTF8String(v18, v19, v20);
      unsigned __int16 v22 = strlen(v21);
      objc_msgSend_setNameLength_(v11, v23, v22);

      id v26 = objc_msgSend_lastModificationDate(v10, v24, v25);
      objc_msgSend_setLastModificationDate_(v11, v27, (uint64_t)v26);

      uint64_t v30 = objc_msgSend_size(v10, v28, v29);
      objc_msgSend_setSize_(v11, v31, v30);
      uint64_t v34 = objc_msgSend_size(v10, v32, v33);
      objc_msgSend_setCompressedSize_(v11, v35, v34);
      uint64_t v38 = objc_msgSend_offset(v10, v36, v37);
      objc_msgSend_setOffset_(v11, v39, v38);
      uint64_t v42 = objc_msgSend_CRC(v10, v40, v41);
      objc_msgSend_setCRC_(v11, v43, v42);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      LODWORD(v10) = v49;

      if (v10) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v44, (uint64_t)&v45, v50, 16);
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t sub_21E1D0C5C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v7 = objc_msgSend_offset(a2, v5, v6);
  unint64_t v10 = objc_msgSend_offset(v4, v8, v9);

  if (v7 < v10) {
    return -1;
  }
  else {
    return v7 > v10;
  }
}

void sub_21E1D0DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1D0DD0(uint64_t a1, const char *a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend_sortedEntriesImpl(*(void **)(a1 + 32), a2, a3);

  return MEMORY[0x270F9A758]();
}

void sub_21E1D0EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1D0EF4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

void sub_21E1D1034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1D104C(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_entriesMap(*(void **)(a1 + 32), a2, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(v8, v4, *(void *)(a1 + 40));
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t sub_21E1D1174(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_truncateToNumberOfEntriesImpl_completion_, *(void *)(a1 + 48));
}

uint64_t sub_21E1D1398(uint64_t a1, const char *a2)
{
  return objc_msgSend_truncateToOffsetImpl_completion_(*(void **)(a1 + 32), a2, *(void *)(a1 + 48), *(void *)(a1 + 40));
}

void sub_21E1D1684(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL BCPointsAlmostEqual(double a1, double a2, double a3, double a4)
{
  BOOL v4 = vabdd_f64(a1, a3) < 0.00999999978;
  return vabdd_f64(a2, a4) < 0.00999999978 && v4;
}

double CGPointMultiply(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CGPointMultiplyByPoint(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CGPointAdd(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CGPointSubtract(double a1, double a2, double a3)
{
  return a1 - a3;
}

double CGPointAddSize(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CGPointSubtractSize(double a1, double a2, double a3)
{
  return a1 - a3;
}

double CGPointDistanceFromPoint(double a1, double a2, double a3, double a4)
{
  return sqrt((a4 - a2) * (a4 - a2) + (a3 - a1) * (a3 - a1));
}

double CGPointSquaredDistanceFromPoint(double a1, double a2, double a3, double a4)
{
  return (a4 - a2) * (a4 - a2) + (a3 - a1) * (a3 - a1);
}

double CGPointClipToRect(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  v15.origin.x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  double MinX = CGRectGetMinX(v15);
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  double MaxX = CGRectGetMaxX(v16);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGRectGetMinY(v17);
  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.width = a5;
  v18.size.height = a6;
  CGRectGetMaxY(v18);
  if (a1 > MaxX) {
    double v13 = MaxX;
  }
  else {
    double v13 = a1;
  }
  if (a1 < MinX) {
    return MinX;
  }
  return v13;
}

double CGPointRoundForScale(double a1, double a2, double a3)
{
  if (a3 == 0.0) {
    a3 = 1.0;
  }
  return 1.0 / a3 * round(a1 * a3);
}

double CGRectFitRectInRectNoRounding(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double result = *MEMORY[0x263F001A8];
  double v9 = 0.0;
  if (a3 != *MEMORY[0x263F001B0] || a4 != *(double *)(MEMORY[0x263F001B0] + 8)) {
    double v9 = fmin(a7 / a3, a8 / a4);
  }
  double v11 = a3 * v9;
  if (a7 > v11) {
    return (a7 - v11) * 0.5;
  }
  return result;
}

double CGSizeScaleThatFitsInCGSize(double a1, double a2, double a3, double a4)
{
  if (a1 == *MEMORY[0x263F001B0] && a2 == *(double *)(MEMORY[0x263F001B0] + 8)) {
    return 0.0;
  }
  else {
    return fmin(a3 / a1, a4 / a2);
  }
}

double CGRectFitRectInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = 0.0;
  if (a3 != *MEMORY[0x263F001B0] || a4 != *(double *)(MEMORY[0x263F001B0] + 8)) {
    double v10 = fmin(a7 / a3, a8 / a4);
  }
  double v12 = a3 * v10;
  double v13 = a4 * v10;
  if (a7 > v12) {
    double v8 = (a7 - v12) * 0.5;
  }
  if (a8 > v13) {
    double v9 = (a8 - v13) * 0.5;
  }
  *(void *)&double result = (unint64_t)CGRectIntegral(*(CGRect *)&v8);
  return result;
}

CGFloat CGRectFitRectInRectClip(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8 = *MEMORY[0x263F001A8];
  double v9 = 0.0;
  if (a3 != *MEMORY[0x263F001B0] || a4 != *(double *)(MEMORY[0x263F001B0] + 8)) {
    double v9 = fmin(a7 / a3, a8 / a4);
  }
  double v11 = a3 * v9;
  double v12 = a4 * v9;
  double v13 = (a7 - a3 * v9) * 0.5;
  if (a7 > v11) {
    double v8 = v13;
  }
  if (a8 <= v12) {
    double v14 = *(double *)(MEMORY[0x263F001A8] + 8);
  }
  else {
    double v14 = (a8 - v12) * 0.5;
  }
  double v15 = v14;
  double v16 = v11;
  double v17 = a4 * v9;
  CGFloat v18 = floor(CGRectGetMinX(*(CGRect *)&v8));
  v22.origin.x = v18;
  v22.origin.y = v14;
  v22.size.width = v11;
  v22.size.height = v12;
  CGFloat v19 = floor(CGRectGetMinY(v22));
  v23.origin.x = v18;
  v23.origin.y = v19;
  v23.size.width = v11;
  v23.size.height = v12;
  CGFloat v20 = floor(CGRectGetWidth(v23));
  v24.origin.x = v18;
  v24.origin.y = v19;
  v24.size.width = v20;
  v24.size.height = v12;
  CGRectGetHeight(v24);
  return v18;
}

double CGRectFitRectInRectAbsoluteNoRounding(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v12 = 0.0;
  if (a3 != *MEMORY[0x263F001B0] || a4 != *(double *)(MEMORY[0x263F001B0] + 8)) {
    double v12 = fmin(a7 / a3, a8 / a4);
  }
  CGFloat v14 = a3 * v12;
  CGFloat v15 = a4 * v12;
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  double MidX = CGRectGetMidX(v19);
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.width = v14;
  v20.size.height = v15;
  double v17 = MidX - CGRectGetWidth(v20) * 0.5;
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMidY(v21);
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v14;
  v22.size.height = v15;
  CGRectGetHeight(v22);
  return v17;
}

double CGSizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CGRectCenterRectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  double MidX = CGRectGetMidX(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  double v16 = MidX - CGRectGetWidth(v20) * 0.5;
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMidY(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  CGRectGetHeight(v22);
  return v16;
}

double CGRectMakeWithSize()
{
  return 0.0;
}

double CGRectGetCenter(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v8 = ceil(CGRectGetMidX(*(CGRect *)&a1));
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return v8;
}

double CGRectGetCenterNoRounding(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double CGRectMultiply(double result, double a2, double a3, double a4, double a5)
{
  if (a5 != 1.0) {
    return result * a5;
  }
  return result;
}

double CGRectRoundedForScale(double a1, double a2, double a3, CGFloat a4, double a5)
{
  double v8 = a1;
  if (a5 == 0.0) {
    double v9 = 1.0;
  }
  else {
    double v9 = a5;
  }
  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    if (v9 == 1.0) {
      double v10 = v8;
    }
    else {
      double v10 = v8 * v9;
    }
    if (v9 == 1.0) {
      double v11 = a2;
    }
    else {
      double v11 = a2 * v9;
    }
    if (v9 == 1.0) {
      double v12 = a3;
    }
    else {
      double v12 = a3 * v9;
    }
    if (v9 != 1.0) {
      a4 = a4 * v9;
    }
    v14.origin.x = v10;
    v14.origin.y = v11;
    v14.size.width = v12;
    v14.size.height = a4;
    double v8 = round(CGRectGetMinX(v14));
    v15.origin.x = v10;
    v15.origin.y = v11;
    v15.size.width = v12;
    v15.size.height = a4;
    round(CGRectGetMinY(v15));
    v16.origin.x = v10;
    v16.origin.y = v11;
    v16.size.width = v12;
    v16.size.height = a4;
    CGRectGetMaxX(v16);
    v17.origin.x = v10;
    v17.origin.y = v11;
    v17.size.width = v12;
    v17.size.height = a4;
    CGRectGetMaxY(v17);
    if (1.0 / v9 != 1.0) {
      return 1.0 / v9 * v8;
    }
  }
  return v8;
}

double CGRectMakeWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

BOOL CGRectAlmostEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a1, a5) < 0.00000011920929
      && vabdd_f64(a2, a6) < 0.00000011920929
      && vabdd_f64(a3, a7) < 0.00000011920929
      && vabdd_f64(a4, a8) < 0.00000011920929;
}

double CGSizeScaleThatFillsInCGSize(double a1, double a2, double a3, double a4)
{
  if (a1 == *MEMORY[0x263F001B0] && a2 == *(double *)(MEMORY[0x263F001B0] + 8)) {
    return 0.0;
  }
  else {
    return fmax(a3 / a1, a4 / a2);
  }
}

double CGSizeLength(double a1, double a2)
{
  return sqrt(a2 * a2 + a1 * a1);
}

double CGSizeScaledToFitInSize(double a1, double a2, double a3, double a4)
{
  double v4 = 0.0;
  if (a1 != *MEMORY[0x263F001B0] || a2 != *(double *)(MEMORY[0x263F001B0] + 8)) {
    double v4 = fmin(a3 / a1, a4 / a2);
  }
  return a1 * v4;
}

double CGSizeScaledToFillInSize(double a1, double a2, double a3, double a4)
{
  double v4 = 0.0;
  if (a1 != *MEMORY[0x263F001B0] || a2 != *(double *)(MEMORY[0x263F001B0] + 8)) {
    double v4 = fmax(a3 / a1, a4 / a2);
  }
  return a1 * v4;
}

double CGSizeRound(double a1)
{
  return round(a1);
}

double CGSizeRoundForScale(double a1, double a2, double a3)
{
  if (a3 == 0.0) {
    a3 = 1.0;
  }
  return 1.0 / a3 * round(a1 * a3);
}

double CGSizeCeilForScale(double a1, double a2, double a3)
{
  if (a3 == 0.0) {
    a3 = 1.0;
  }
  return 1.0 / a3 * ceil(a1 * a3);
}

double CGFloatScale(double a1, double a2)
{
  return a1 * a2;
}

double CGFloatRoundForScale(double a1, double a2)
{
  if (a2 == 0.0) {
    a2 = 1.0;
  }
  return 1.0 / a2 * round(a2 * a1);
}

double CGFloatCeilForScale(double a1, double a2)
{
  if (a2 == 0.0) {
    a2 = 1.0;
  }
  return 1.0 / a2 * ceil(a2 * a1);
}

double CGSizeMakeEvenSize(double result)
{
  if ((int)result) {
    return result + -1.0;
  }
  return result;
}

double CGSizeRotate(double a1, double a2)
{
  return a2;
}

double CGSizeMin(double result, double a2, double a3, double a4)
{
  BOOL v4 = a3 > result;
  if (a4 > a2) {
    BOOL v4 = 1;
  }
  if (!v4) {
    return a3;
  }
  return result;
}

double CGSizeMultiplyByPoint(double a1, double a2, double a3)
{
  return a1 * a3;
}

void CGRectEdgePointAtAngle(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  CGRectGetMidX(*(CGRect *)&a1);
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectGetMidY(v11);
  __double2 v10 = __sincos_stret(a5);
  if (v10.__sinval <= 0.0001)
  {
    if (v10.__sinval < -0.0001)
    {
      v14.origin.x = a1;
      v14.origin.y = a2;
      v14.size.width = a3;
      v14.size.height = a4;
      CGRectGetMinY(v14);
      v15.origin.x = a1;
      v15.origin.y = a2;
      v15.size.width = a3;
      v15.size.height = a4;
      CGRectGetMinY(v15);
    }
  }
  else
  {
    v12.origin.x = a1;
    v12.origin.y = a2;
    v12.size.width = a3;
    v12.size.height = a4;
    CGRectGetMaxY(v12);
    v13.origin.x = a1;
    v13.origin.y = a2;
    v13.size.width = a3;
    v13.size.height = a4;
    CGRectGetMaxY(v13);
  }
  if (v10.__cosval <= 0.0001)
  {
    if (v10.__cosval < -0.0001)
    {
      v18.origin.x = a1;
      v18.origin.y = a2;
      v18.size.width = a3;
      v18.size.height = a4;
      CGRectGetMinX(v18);
      v19.origin.x = a1;
      v19.origin.y = a2;
      v19.size.width = a3;
      v19.size.height = a4;
      CGRectGetMinX(v19);
    }
  }
  else
  {
    v16.origin.x = a1;
    v16.origin.y = a2;
    v16.size.width = a3;
    v16.size.height = a4;
    CGRectGetMaxX(v16);
    v17.origin.x = a1;
    v17.origin.y = a2;
    v17.size.width = a3;
    v17.size.height = a4;
    CGRectGetMaxX(v17);
  }
}

BOOL CGLinesIntersect(double *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v9 = a5 - a3;
  double v10 = a2 - a4;
  double v11 = a9 - a7;
  double v12 = a6 - a8;
  double v13 = v9 * (a6 - a8) - v11 * (a2 - a4);
  double v14 = fabs(v13);
  if (a1 && v14 >= 0.00000011920929)
  {
    double v15 = a7 * v12 + v11 * a6;
    double v16 = a3 * v10 + v9 * a2;
    *a1 = (v12 * v16 - v10 * v15) / v13;
    a1[1] = (v16 * -v11 + v9 * v15) / v13;
  }
  return v14 >= 0.00000011920929;
}

BOOL SegmentCanContainPoint(double a1, double a2, double a3, double a4, double a5, double a6)
{
  if (a1 >= a3) {
    double v6 = a3;
  }
  else {
    double v6 = a1;
  }
  if (a1 >= a3) {
    double v7 = a1;
  }
  else {
    double v7 = a3;
  }
  if (a2 >= a4) {
    double v8 = a4;
  }
  else {
    double v8 = a2;
  }
  if (a2 >= a4) {
    double v9 = a2;
  }
  else {
    double v9 = a4;
  }
  double v10 = vabdd_f64(a5, v6);
  if (a5 <= v6 && v10 >= 0.00000011920929) {
    return 0;
  }
  double v12 = vabdd_f64(a5, v7);
  if (a5 >= v7 && v12 >= 0.00000011920929) {
    return 0;
  }
  double v14 = vabdd_f64(a6, v8);
  if (a6 <= v8 && v14 >= 0.00000011920929) {
    return 0;
  }
  if (a6 >= v9) {
    return vabdd_f64(a6, v9) < 0.00000011920929;
  }
  return 1;
}

BOOL CGLineSegmentsIntersect(_OWORD *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  long long v23 = 0uLL;
  BOOL result = CGLinesIntersect((double *)&v23, a2, a3, a4, a5, a6, a7, a8, a9);
  if (result)
  {
    double v19 = a4;
    double v20 = *((double *)&v23 + 1);
    double v21 = a5;
    double v22 = *(double *)&v23;
    BOOL result = SegmentCanContainPoint(a2, a3, v19, v21, *(double *)&v23, *((double *)&v23 + 1));
    if (result)
    {
      BOOL result = SegmentCanContainPoint(a6, a7, a8, a9, v22, v20);
      if (a1)
      {
        if (result)
        {
          *a1 = v23;
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t CGRectIntersectsLineSegment(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8, double a9)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  float64x2_t v44 = 0uLL;
  CGFloat MinX = CGRectGetMinX(*(CGRect *)&a2);
  v47.origin.x = a2;
  v47.origin.y = a3;
  v47.size.width = a4;
  v47.size.height = a5;
  double MinY = CGRectGetMinY(v47);
  v48.origin.x = a2;
  v48.origin.y = a3;
  v48.size.width = a4;
  v48.size.height = a5;
  double MaxX = CGRectGetMaxX(v48);
  v49.origin.x = a2;
  v49.origin.y = a3;
  v49.size.width = a4;
  v49.size.height = a5;
  double v18 = CGRectGetMinY(v49);
  double v19 = MinX;
  double v42 = a7;
  BOOL v20 = CGLineSegmentsIntersect(&v44, v19, MinY, MaxX, v18, a6, a7, a8, a9);
  uint64_t v21 = 0;
  if (v20)
  {
    v45[0] = v44;
    uint64_t v21 = 1;
  }
  v50.origin.x = a2;
  v50.origin.y = a3;
  v50.size.width = a4;
  v50.size.height = a5;
  double v22 = CGRectGetMaxX(v50);
  v51.origin.x = a2;
  v51.origin.y = a3;
  v51.size.width = a4;
  v51.size.height = a5;
  double v23 = CGRectGetMinY(v51);
  v52.origin.x = a2;
  v52.origin.y = a3;
  v52.size.width = a4;
  v52.size.height = a5;
  double v24 = CGRectGetMaxX(v52);
  v53.origin.x = a2;
  v53.origin.y = a3;
  v53.size.width = a4;
  v53.size.height = a5;
  double MaxY = CGRectGetMaxY(v53);
  if (CGLineSegmentsIntersect(&v44, v22, v23, v24, MaxY, a6, v42, a8, a9))
  {
    if (v20)
    {
      int32x2_t v26 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3F847AE140000000uLL), vabdq_f64(v44, *(float64x2_t *)a1)));
      if ((v26.i32[0] & v26.i32[1] & 1) == 0) {
        goto LABEL_12;
      }
    }
    else
    {
      v45[v21] = v44;
    }
    uint64_t v21 = 1;
  }
  v54.origin.x = a2;
  v54.origin.y = a3;
  v54.size.width = a4;
  v54.size.height = a5;
  double v27 = CGRectGetMinX(v54);
  v55.origin.x = a2;
  v55.origin.y = a3;
  v55.size.width = a4;
  v55.size.height = a5;
  double v28 = CGRectGetMaxY(v55);
  v56.origin.x = a2;
  v56.origin.y = a3;
  v56.size.width = a4;
  v56.size.height = a5;
  double v29 = CGRectGetMaxX(v56);
  v57.origin.x = a2;
  v57.origin.y = a3;
  v57.size.width = a4;
  v57.size.height = a5;
  double v30 = CGRectGetMaxY(v57);
  if (CGLineSegmentsIntersect(&v44, v27, v28, v29, v30, a6, v42, a8, a9))
  {
    if (v21)
    {
      int32x2_t v31 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3F847AE140000000uLL), vabdq_f64(v44, *(float64x2_t *)a1)));
      if ((v31.i32[0] & v31.i32[1] & 1) == 0)
      {
LABEL_12:
        uint64_t v32 = 2;
LABEL_20:
        v45[v21] = v44;
        uint64_t v21 = v32;
        goto LABEL_21;
      }
    }
    else
    {
      v45[0] = v44;
    }
    uint64_t v21 = 1;
  }
  v58.origin.x = a2;
  v58.origin.y = a3;
  v58.size.width = a4;
  v58.size.height = a5;
  double v33 = CGRectGetMinX(v58);
  v59.origin.x = a2;
  v59.origin.y = a3;
  v59.size.width = a4;
  v59.size.height = a5;
  double v34 = CGRectGetMinY(v59);
  v60.origin.x = a2;
  v60.origin.y = a3;
  v60.size.width = a4;
  v60.size.height = a5;
  double v35 = CGRectGetMinX(v60);
  v61.origin.x = a2;
  v61.origin.y = a3;
  v61.size.width = a4;
  v61.size.height = a5;
  double v36 = CGRectGetMaxY(v61);
  if (CGLineSegmentsIntersect(&v44, v33, v34, v35, v36, a6, v42, a8, a9))
  {
    if (!v21
      || (int32x2_t v37 = vmovn_s64(vcgtq_f64((float64x2_t)vdupq_n_s64(0x3F847AE140000000uLL), vabdq_f64(v44, *(float64x2_t *)a1))),
          (v37.i32[0] & v37.i32[1] & 1) == 0))
    {
      uint64_t v32 = v21 + 1;
      goto LABEL_20;
    }
    uint64_t v21 = 1;
  }
LABEL_21:
  if (a1 && v21)
  {
    long long v38 = v45[1];
    *(_OWORD *)a1 = v45[0];
    *(_OWORD *)(a1 + 16) = v38;
  }
  return v21;
}

void sub_21E1D28CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1D28E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E1D28F4(uint64_t a1)
{
}

void sub_21E1D28FC(uint64_t a1, int a2, void *a3, void *a4)
{
  data2 = a3;
  id v7 = a4;
  double v8 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v8)
  {
    if (v7)
    {
      double v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_8:
      v9();
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      double v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = 0;

      goto LABEL_9;
    }
    if (data2)
    {
      dispatch_data_t concat = dispatch_data_create_concat(v8, data2);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      double v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = concat;
    }
    if (a2)
    {
      double v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_8;
    }
  }
LABEL_9:
}

uint64_t sub_21E1D2AB4(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v7 = objc_msgSend_readToBuffer_size_(v5, v6, a2, a3);

  return v7;
}

uint64_t sub_21E1D2C34(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v6 = objc_msgSend_offset(v3, v4, v5);
  objc_msgSend_seekToOffset_(v3, v7, v6 + a2);
  uint64_t v10 = objc_msgSend_offset(v3, v8, v9) - v6;

  return v10;
}

void sub_21E1D2DC0(void *a1)
{
  id v2 = a1;
  objc_msgSend_seekToOffset_(v2, v1, 0);
}

void sub_21E1D2F44(_Unwind_Exception *a1)
{
}

void sub_21E1D2F64(void *a1)
{
  id v3 = a1;
  objc_msgSend_close(v3, v1, v2);
  CFRelease(v3);
}

void sub_21E1D30EC(_Unwind_Exception *a1)
{
}

double BURound(double a1)
{
  return round(a1);
}

double BUFractionalPart(double a1)
{
  BOOL v1 = a1 <= 0.0;
  double v2 = -(-a1 - floor(-a1));
  double result = a1 - floor(a1);
  if (v1) {
    return v2;
  }
  return result;
}

double BUClamp(double a1, double a2, double a3)
{
  if (a1 >= a2)
  {
    a2 = a1;
    if (a1 > a3) {
      return a3;
    }
  }
  return a2;
}

double BUMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double BURandom()
{
  return (double)random() / 2147483650.0;
}

double BURandomBetween(double a1, double a2)
{
  return a1 + (a2 - a1) * ((double)random() / 2147483650.0);
}

double BUReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double BUSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
}

id sub_21E1D3810(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_mutableCopy(a1, a2, a3);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = a1;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v21, v25, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v5, v8, v12, (void)v21);
        double v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15);

        if (v13 == v16) {
          objc_msgSend_removeObjectForKey_(v4, v8, v12);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v21, v25, 16);
    }
    while (v9);
  }

  double v19 = objc_msgSend_copy(v4, v17, v18);

  return v19;
}

id sub_21E1D3978(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_mutableCopy(a1, a2, a3);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = a1;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v32, v36, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v5, v8, v12, (void)v32);
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = BUDynamicCast(v14, v13);
        uint64_t v16 = objc_opt_class();
        CGRect v17 = BUDynamicCast(v16, v13);
        BOOL v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v19);

        if (v13 == v20)
        {
          objc_msgSend_removeObjectForKey_(v4, v21, v12);
          goto LABEL_13;
        }
        if (v15)
        {
          uint64_t v23 = objc_msgSend_bu_dictionaryByRecursivelyRemovingNSNulls(v15, v21, v22);
        }
        else
        {
          if (!v17) {
            goto LABEL_13;
          }
          uint64_t v25 = objc_opt_class();
          uint64_t v23 = objc_msgSend__bu_arrayByRecursivelyRemovingNSNulls_(v25, v26, (uint64_t)v17);
        }
        double v27 = (void *)v23;
        objc_msgSend_setObject_forKeyedSubscript_(v4, v24, v23, v12);

LABEL_13:
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v32, v36, 16);
    }
    while (v9);
  }

  double v30 = objc_msgSend_copy(v4, v28, v29);

  return v30;
}

id sub_21E1D3B68(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v4 = objc_msgSend_bu_arrayByRemovingNSNulls(a3, a2, (uint64_t)a3);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_21E1D3C10;
  v8[3] = &unk_26449DA18;
  v8[4] = a1;
  uint64_t v6 = objc_msgSend_bu_arrayByInvokingBlock_(v4, v5, (uint64_t)v8);

  return v6;
}

id sub_21E1D3C10(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = BUDynamicCast(v4, v3);
  double v8 = v5;
  uint64_t v9 = v3;
  if (v5)
  {
    uint64_t v9 = objc_msgSend_bu_dictionaryByRecursivelyRemovingNSNulls(v5, v6, v7);
  }
  uint64_t v10 = objc_opt_class();
  uint64_t v12 = BUDynamicCast(v10, v3);
  if (v12)
  {
    uint64_t v13 = objc_msgSend__bu_arrayByRecursivelyRemovingNSNulls_(*(void **)(a1 + 32), v11, (uint64_t)v12);

    uint64_t v9 = (void *)v13;
  }

  return v9;
}

id sub_21E1D3CE0(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_copy(a3, a2, (uint64_t)a3);
  if (v4)
  {
    id v5 = objc_msgSend_URLWithString_(NSURL, v3, (uint64_t)v4);
    id v7 = v4;
    if (v5)
    {
      double v8 = objc_msgSend_scheme(v5, v3, v6);
      uint64_t v11 = objc_msgSend_length(v8, v9, v10);

      if (v11)
      {
        uint64_t v13 = objc_msgSend_lastPathComponent(v5, v3, v12);
        uint64_t v16 = objc_msgSend_host(v5, v14, v15);
        uint64_t v19 = objc_msgSend_resourceSpecifier(v5, v17, v18);
        if (objc_msgSend_length(v13, v20, v21)
          && (objc_msgSend_isEqualToString_(v13, v22, @"/") & 1) == 0)
        {
          objc_msgSend_stringByDeletingPathExtension(v13, v22, v23);
        }
        else if (objc_msgSend_length(v16, v22, v23))
        {
          objc_msgSend_stringByDeletingPathExtension(v16, v24, v25);
        }
        else
        {
          if (!objc_msgSend_length(v19, v24, v25))
          {
            v66 = BookUtilityLog();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              int v67 = 138412290;
              v68 = v5;
              _os_log_impl(&dword_21E1C7000, v66, OS_LOG_TYPE_DEFAULT, "Failed to generate fileNameCandidate from URL: %@ ", (uint8_t *)&v67, 0xCu);
            }

            goto LABEL_13;
          }
          objc_msgSend_stringByDeletingPathExtension(v19, v26, v27);
        uint64_t v28 = };

        id v7 = (id)v28;
LABEL_13:
      }
    }
  }
  else
  {
    id v5 = 0;
    id v7 = 0;
  }
  uint64_t v29 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F089C0], v3, @"/");
  long long v32 = objc_msgSend_newlineCharacterSet(MEMORY[0x263F08708], v30, v31);
  objc_msgSend_formUnionWithCharacterSet_(v29, v33, (uint64_t)v32);

  double v36 = objc_msgSend_illegalCharacterSet(MEMORY[0x263F08708], v34, v35);
  objc_msgSend_formUnionWithCharacterSet_(v29, v37, (uint64_t)v36);

  id v40 = objc_msgSend_controlCharacterSet(MEMORY[0x263F08708], v38, v39);
  objc_msgSend_formUnionWithCharacterSet_(v29, v41, (uint64_t)v40);

  uint64_t v43 = objc_msgSend_componentsSeparatedByCharactersInSet_(v7, v42, (uint64_t)v29);
  long long v45 = objc_msgSend_componentsJoinedByString_(v43, v44, (uint64_t)&stru_26CF11AD8);

  if (objc_msgSend_hasPrefix_(v45, v46, @".")
    && (unint64_t)objc_msgSend_length(v45, v47, v48) >= 2)
  {
    uint64_t v49 = objc_msgSend_substringFromIndex_(v45, v47, 1);

    long long v45 = (void *)v49;
  }
  if (!v45) {
    goto LABEL_21;
  }
  if (!objc_msgSend_length(v45, v47, v48)) {
    goto LABEL_21;
  }
  CGRect v50 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], v47, @".");
  CGRect v52 = objc_msgSend_componentsSeparatedByCharactersInSet_(v45, v51, (uint64_t)v50);
  CGRect v54 = objc_msgSend_componentsJoinedByString_(v52, v53, (uint64_t)&stru_26CF11AD8);
  uint64_t v57 = objc_msgSend_length(v54, v55, v56);

  if (v57)
  {
    id v58 = v45;
  }
  else
  {
LABEL_21:
    CGRect v59 = objc_msgSend_UUID(MEMORY[0x263F08C38], v47, v48);
    uint64_t v62 = objc_msgSend_UUIDString(v59, v60, v61);
    objc_msgSend_stringByAppendingString_(@"Book-", v63, (uint64_t)v62);
    id v58 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v64 = v58;

  return v64;
}

id sub_21E1D4060()
{
  if (qword_26AB404D0 != -1) {
    dispatch_once(&qword_26AB404D0, &unk_26CF108F8);
  }
  v0 = (void *)qword_26AB404C8;

  return v0;
}

void sub_21E1D40B4()
{
  v0 = (void *)_CFCopyServerVersionDictionary();
  if (!v0) {
    v0 = (void *)_CFCopySystemVersionDictionary();
  }
  id v4 = v0;
  uint64_t v2 = objc_msgSend_objectForKeyedSubscript_(v0, v1, *MEMORY[0x263EFFAB0]);
  id v3 = (void *)qword_26AB404C8;
  qword_26AB404C8 = v2;
}

id sub_21E1D4118()
{
  if (qword_267D29888 != -1) {
    dispatch_once(&qword_267D29888, &unk_26CF10918);
  }
  v0 = (void *)qword_267D29880;

  return v0;
}

void sub_21E1D416C()
{
  v0 = (void *)_CFCopyServerVersionDictionary();
  if (!v0) {
    v0 = (void *)_CFCopySystemVersionDictionary();
  }
  id v4 = v0;
  uint64_t v2 = objc_msgSend_objectForKeyedSubscript_(v0, v1, *MEMORY[0x263EFFAC0]);
  id v3 = (void *)qword_267D29880;
  qword_267D29880 = v2;
}

id sub_21E1D41D0()
{
  if (qword_267D29898 != -1) {
    dispatch_once(&qword_267D29898, &unk_26CF10938);
  }
  v0 = (void *)qword_267D29890;

  return v0;
}

void sub_21E1D4224()
{
  v0 = (void *)_CFCopyServerVersionDictionary();
  if (!v0) {
    v0 = (void *)_CFCopySystemVersionDictionary();
  }
  id v4 = v0;
  uint64_t v2 = objc_msgSend_objectForKeyedSubscript_(v0, v1, *MEMORY[0x263EFFAB8]);
  id v3 = (void *)qword_267D29890;
  qword_267D29890 = v2;
}

uint64_t sub_21E1D4288(uint64_t a1, const char *a2)
{
  unsigned int v9 = 0;
  uint64_t v2 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], a2, a1);
  id v4 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], v3, @"#");
  objc_msgSend_setCharactersToBeSkipped_(v2, v5, (uint64_t)v4);

  objc_msgSend_scanHexInt_(v2, v6, (uint64_t)&v9);
  uint64_t v7 = v9;

  return v7;
}

uint64_t sub_21E1D44F0()
{
  qword_26AB405B8 = objc_alloc_init(BUManagedRestrictionsProvider);

  return MEMORY[0x270F9A758]();
}

id sub_21E1D452C(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v15 = objc_msgSend_initWithCapacity_(v13, v14, 2);
  CGRect v17 = v15;
  if (v11) {
    objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v11, *MEMORY[0x263F08320]);
  }
  if (v12) {
    objc_msgSend_setObject_forKeyedSubscript_(v17, v16, (uint64_t)v12, *MEMORY[0x263F08348]);
  }
  uint64_t v18 = objc_msgSend_errorWithDomain_code_userInfo_(a1, v16, (uint64_t)v10, a4, v17);

  return v18;
}

uint64_t sub_21E1D4610(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_errorWithDomain_code_userInfo_(a1, a2, @"com.apple.iBooks.BookUtility", a3, a4);
}

uint64_t sub_21E1D4624(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend_bu_errorWithDomain_code_alertTitle_alertMessage_userInfo_(a1, a2, a3, a4, a5, a6, 0);
}

id sub_21E1D462C(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7)
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v19 = objc_msgSend_count(v15, v17, v18);
  uint64_t v21 = objc_msgSend_initWithCapacity_(v16, v20, v19 + 4);
  uint64_t v23 = v21;
  if (v15) {
    objc_msgSend_addEntriesFromDictionary_(v21, v22, (uint64_t)v15);
  }
  if (v13)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v23, v22, (uint64_t)v13, *MEMORY[0x263F08320]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)v13, @"BULocalizedErrorAlertTitle");
  }
  if (v14)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v23, v22, (uint64_t)v14, *MEMORY[0x263F08348]);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v25, (uint64_t)v14, @"BULocalizedErrorAlertMessage");
    objc_msgSend_setObject_forKeyedSubscript_(v23, v26, (uint64_t)v14, *MEMORY[0x263F08338]);
  }
  uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(a1, v22, (uint64_t)v12, a4, v23);

  return v27;
}

id sub_21E1D4788(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (objc_class *)MEMORY[0x263EFF9A0];
  id v13 = a5;
  id v14 = [v12 alloc];
  id v16 = objc_msgSend_initWithCapacity_(v14, v15, 2);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v13, *MEMORY[0x263F08320]);

  if (v11) {
    objc_msgSend_setObject_forKeyedSubscript_(v16, v18, (uint64_t)v11, *MEMORY[0x263F08608]);
  }
  uint64_t v19 = objc_msgSend_errorWithDomain_code_userInfo_(a1, v18, (uint64_t)v10, a4, v16);

  return v19;
}

id sub_21E1D4870(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a6;
  if (a3)
  {
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v16 = objc_msgSend_userInfo(v13, v14, v15);
    id v17 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v20 = objc_msgSend_count(v16, v18, v19);
    uint64_t v23 = objc_msgSend_count(v10, v21, v22);
    uint64_t v25 = objc_msgSend_initWithCapacity_(v17, v24, v20 + v23 + 1);
    uint64_t v27 = v25;
    if (v16) {
      objc_msgSend_addEntriesFromDictionary_(v25, v26, (uint64_t)v16);
    }
    if (v10) {
      objc_msgSend_addEntriesFromDictionary_(v27, v26, (uint64_t)v10);
    }
    objc_msgSend_setObject_forKeyedSubscript_(v27, v26, (uint64_t)v13, *MEMORY[0x263F08608]);
    double v30 = objc_msgSend_domain(v13, v28, v29);
    uint64_t v33 = objc_msgSend_code(v13, v31, v32);

    uint64_t v35 = objc_msgSend_bu_errorWithDomain_code_alertTitle_alertMessage_userInfo_(a1, v34, (uint64_t)v30, v33, v12, v11, v27);
  }
  else
  {
    uint64_t v35 = 0;
  }

  return v35;
}

id sub_21E1D49D4(void *a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_userInfo(a1, a2, a3);
  uint64_t v5 = *MEMORY[0x263F08320];
  double v8 = objc_msgSend_objectForKeyedSubscript_(v4, v6, *MEMORY[0x263F08320]);
  if (!v8) {
    goto LABEL_5;
  }
  unsigned int v9 = objc_msgSend_objectForKeyedSubscript_(v4, v7, @"BULocalizedErrorAlertTitle");
  id v11 = v9;
  if (!v9 || objc_msgSend_isEqualToString_(v9, v10, (uint64_t)v8))
  {

LABEL_5:
    id v14 = a1;
    goto LABEL_7;
  }
  uint64_t v15 = objc_msgSend_mutableCopy(v4, v12, v13);
  objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v11, v5);
  id v17 = objc_opt_class();
  uint64_t v20 = objc_msgSend_domain(a1, v18, v19);
  uint64_t v23 = objc_msgSend_code(a1, v21, v22);
  objc_msgSend_errorWithDomain_code_userInfo_(v17, v24, (uint64_t)v20, v23, v15);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:

  return v14;
}

id sub_21E1D4AF4(void *a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (objc_msgSend_bu_isCancelError(v1, v2, v3))
  {
    if (objc_msgSend_code(v1, v4, v5) == 3072)
    {
      double v8 = objc_msgSend_domain(v1, v6, v7);
      uint64_t v9 = *MEMORY[0x263F07F70];
      char isEqualToString = objc_msgSend_isEqualToString_(v8, v10, *MEMORY[0x263F07F70]);

      if (isEqualToString) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v9 = *MEMORY[0x263F07F70];
    }
    id v12 = objc_opt_class();
    uint64_t v18 = *MEMORY[0x263F08608];
    v19[0] = v1;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v19, &v18, 1);
    uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_(v12, v15, v9, 3072, v14);

    id v1 = (id)v16;
  }
LABEL_7:

  return v1;
}

id sub_21E1D4C24(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_userInfo(a1, a2, a3);
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"BULocalizedErrorAlertTitle");
  uint64_t v7 = v5;
  if (v5)
  {
    id v8 = v5;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v3, v6, *MEMORY[0x263F08320]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v8;

  return v9;
}

id sub_21E1D4CAC(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_userInfo(a1, a2, a3);
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"BULocalizedErrorAlertMessage");
  uint64_t v7 = v5;
  if (v5)
  {
    id v8 = v5;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(v3, v6, *MEMORY[0x263F08348]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v8;

  return v9;
}

uint64_t sub_21E1D4D34(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](a1, sel_bu_isErrorPassingTest_, &unk_26CF10978);
}

uint64_t sub_21E1D4D40(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v8 = a4;
  if (a3 == 2)
  {
    uint64_t isEqualToString = objc_msgSend_isEqualToString_(v6, v7, @"com.apple.iBooks.BookUtility");
  }
  else
  {
    if (a3 == 28)
    {
      uint64_t v9 = (uint64_t *)MEMORY[0x263F08438];
    }
    else
    {
      if (a3 != 640)
      {
        uint64_t v11 = 0;
        goto LABEL_10;
      }
      uint64_t v9 = (uint64_t *)MEMORY[0x263F07F70];
    }
    uint64_t isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *v9);
  }
  uint64_t v11 = isEqualToString;
LABEL_10:

  return v11;
}

uint64_t sub_21E1D4DD8(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](a1, sel_bu_isErrorPassingTest_, &unk_26CF10998);
}

uint64_t sub_21E1D4DE4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v8 = a4;
  if (a3 == -999)
  {
    uint64_t v9 = (uint64_t *)MEMORY[0x263F08570];
  }
  else
  {
    if (a3 != 3072)
    {
      uint64_t isEqualToString = 0;
      goto LABEL_7;
    }
    uint64_t v9 = (uint64_t *)MEMORY[0x263F07F70];
  }
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *v9);
LABEL_7:

  return isEqualToString;
}

uint64_t sub_21E1D4E68(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](a1, sel_bu_isErrorPassingTest_, &unk_26CF109B8);
}

uint64_t sub_21E1D4E74(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v8 = a4;
  if (a3 == 2)
  {
    uint64_t v9 = (uint64_t *)MEMORY[0x263F08438];
  }
  else
  {
    if (a3 != 260 && a3 != 4)
    {
      uint64_t isEqualToString = 0;
      goto LABEL_8;
    }
    uint64_t v9 = (uint64_t *)MEMORY[0x263F07F70];
  }
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *v9);
LABEL_8:

  return isEqualToString;
}

uint64_t sub_21E1D4F00(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](a1, sel_bu_isErrorPassingTest_, &unk_26CF109D8);
}

uint64_t sub_21E1D4F0C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v8 = a4;
  if (a3 == 516)
  {
    uint64_t v9 = (uint64_t *)MEMORY[0x263F07F70];
  }
  else
  {
    if (a3 != 17)
    {
      uint64_t isEqualToString = 0;
      goto LABEL_7;
    }
    uint64_t v9 = (uint64_t *)MEMORY[0x263F08438];
  }
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *v9);
LABEL_7:

  return isEqualToString;
}

uint64_t sub_21E1D4F90(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](a1, sel_bu_isErrorPassingTest_, &unk_26CF109F8);
}

uint64_t sub_21E1D4F9C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v8 = a4;
  uint64_t v9 = 0;
  if (a3 <= 512)
  {
    if (a3 != 1)
    {
      if (a3 != 257) {
        goto LABEL_14;
      }
      goto LABEL_7;
    }
    if (objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x263F08438]))
    {
LABEL_12:
      uint64_t v9 = 1;
      goto LABEL_14;
    }
    char isEqualToString = objc_msgSend_isEqualToString_(v6, v10, @"NSFileProviderInternalErrorDomain");
LABEL_11:
    if ((isEqualToString & 1) == 0)
    {
      uint64_t v9 = 0;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (a3 == 513)
  {
    char isEqualToString = objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x263F07F70]);
    goto LABEL_11;
  }
  if (a3 == 5124) {
LABEL_7:
  }
    uint64_t v9 = objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x263F07F70]);
LABEL_14:

  return v9;
}

void sub_21E1D507C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v7 = objc_msgSend_initWithObjects_(v5, v6, a1, 0);
    id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    char v34 = 0;
    if (objc_msgSend_count(v7, v9, v10))
    {
      do
      {
        uint64_t v13 = objc_msgSend_firstObject(v7, v11, v12);
        objc_msgSend_removeObjectAtIndex_(v7, v14, 0);
        id v17 = objc_msgSend_userInfo(v13, v15, v16);
        if ((objc_msgSend_containsObject_(v8, v18, (uint64_t)v13) & 1) == 0)
        {
          objc_msgSend_addObject_(v8, v19, (uint64_t)v13);
          uint64_t v22 = objc_msgSend_domain(v13, v20, v21);
          uint64_t v25 = objc_msgSend_code(v13, v23, v24);
          v4[2](v4, v22, v25, v17, &v34);

          if (!v34)
          {
            uint64_t v28 = objc_msgSend_underlyingErrors(v13, v26, v27);
            if (objc_msgSend_count(v28, v29, v30)) {
              objc_msgSend_addObjectsFromArray_(v7, v31, (uint64_t)v28);
            }
          }
        }
      }
      while (objc_msgSend_count(v7, v32, v33) && !v34);
    }
  }
}

BOOL sub_21E1D51E0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_21E1D52D8;
    v9[3] = &unk_26449DA58;
    id v10 = v4;
    uint64_t v11 = &v12;
    objc_msgSend_bu_enumerateErrorUsingBlock_(a1, v6, (uint64_t)v9);

    BOOL v7 = *((unsigned char *)v13 + 24) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_21E1D52C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1D52D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t sub_21E1D53C4(uint64_t a1)
{
  qword_26AB404E8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

uint64_t sub_21E1D58A8(uint64_t a1, const char *a2)
{
  return objc_msgSend_setBuVerboseLoggingEnabled_(*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_21E1D5960(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend_buVerboseLoggingEnabled(*(void **)(a1 + 32), a2, a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_21E1D5B24(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = (uint64_t *)(a1 + 32);
  id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v9 = 0;
  uint64_t v6 = objc_msgSend_dataWithTitle_propertyList_error_(BUOSStateDataSerialization, v5, v3, v4, &v9);
  id v7 = v9;

  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    sub_21E1F0C94(v2, (uint64_t)v7);
  }

  return v6;
}

void sub_21E1D5F0C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_pathMonitor(*(void **)(a1 + 32), a2, a3);

  if (!v4)
  {
    nw_path_monitor_t v5 = nw_path_monitor_create();
    objc_msgSend_setPathMonitor_(*(void **)(a1 + 32), v6, (uint64_t)v5);

    id v9 = objc_msgSend_pathMonitor(*(void **)(a1 + 32), v7, v8);
    uint64_t v12 = objc_msgSend_monitorQueue(*(void **)(a1 + 32), v10, v11);
    nw_path_monitor_set_queue(v9, v12);

    objc_initWeak(&location, *(id *)(a1 + 32));
    char v15 = objc_msgSend_pathMonitor(*(void **)(a1 + 32), v13, v14);
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_21E1D6124;
    uint64_t v27 = &unk_26449DAD8;
    objc_copyWeak(&v28, &location);
    nw_path_monitor_set_update_handler(v15, &v24);

    uint64_t v18 = objc_msgSend_pathMonitor(*(void **)(a1 + 32), v16, v17, v24, v25, v26, v27);
    nw_path_monitor_start(v18);

    uint64_t v19 = BookUtilityLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_msgSend_monitorQueue(*(void **)(a1 + 32), v20, v21);
      label = dispatch_queue_get_label(v22);
      *(_DWORD *)buf = 136315138;
      uint64_t v31 = label;
      _os_log_impl(&dword_21E1C7000, v19, OS_LOG_TYPE_DEFAULT, "Started monitoring network in queue: %s", buf, 0xCu);
    }
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

void sub_21E1D60E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E1D6124(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend_setCurrentPath_(WeakRetained, v4, (uint64_t)v3);
}

void sub_21E1D61F4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_pathMonitor(*(void **)(a1 + 32), a2, a3);

  if (v4)
  {
    id v7 = objc_msgSend_pathMonitor(*(void **)(a1 + 32), v5, v6);
    nw_path_monitor_cancel(v7);

    objc_msgSend_setPathMonitor_(*(void **)(a1 + 32), v8, 0);
    id v9 = BookUtilityLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_msgSend_monitorQueue(*(void **)(a1 + 32), v10, v11);
      int v13 = 136315138;
      label = dispatch_queue_get_label(v12);
      _os_log_impl(&dword_21E1C7000, v9, OS_LOG_TYPE_DEFAULT, "Stopped monitoring network in queue: %s", (uint8_t *)&v13, 0xCu);
    }
  }
}

uint64_t sub_21E1D6330()
{
  uint64_t result = MGGetBoolAnswer();
  byte_267D298A0 = result;
  return result;
}

uint64_t sub_21E1D639C()
{
  uint64_t result = MGGetBoolAnswer();
  byte_267D298B0 = result;
  return result;
}

void sub_21E1D6618(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = BUCoalescingCallBlockLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_21E1F0DAC((uint64_t)v2, v3);
  }
}

void sub_21E1D68E8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_group(*(void **)(a1 + 32), a2, a3);
  dispatch_group_enter(v4);

  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  char v44 = 0;
  id v7 = objc_msgSend_UUID(MEMORY[0x263F08C38], v5, v6);
  id v10 = objc_msgSend_UUIDString(v7, v8, v9);

  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = sub_21E1D6BE0;
  v38[3] = &unk_26449DB48;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v39 = v11;
  uint64_t v40 = v12;
  double v42 = v43;
  id v13 = v10;
  id v41 = v13;
  uint64_t v14 = (void *)MEMORY[0x223C22A70](v38);
  uint64_t v19 = objc_msgSend_notifyTimeoutBlock(*(void **)(a1 + 32), v15, v16);
  if (v19)
  {
    BOOL v20 = objc_msgSend_notifyTimeoutDurationSeconds(*(void **)(a1 + 32), v17, v18) == 0;

    if (!v20)
    {
      unsigned int v23 = objc_msgSend_notifyTimeoutDurationSeconds(*(void **)(a1 + 32), v21, v22);
      dispatch_time_t v24 = dispatch_time(0, 1000000000 * v23);
      uint64_t v27 = objc_msgSend_sync(*(void **)(a1 + 32), v25, v26);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_21E1D6E8C;
      block[3] = &unk_26449DB20;
      void block[4] = *(void *)(a1 + 32);
      uint64_t v37 = v43;
      id v36 = v13;
      dispatch_after(v24, v27, block);
    }
  }
  id v28 = BUCoalescingCallBlockLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = objc_msgSend_notifyBlockDescription(*(void **)(a1 + 32), v29, v30);
    *(_DWORD *)buf = 138543618;
    uint64_t v46 = v31;
    __int16 v47 = 2114;
    id v48 = v13;
    _os_log_impl(&dword_21E1C7000, v28, OS_LOG_TYPE_INFO, "Invoking notify block '%{public}@' (%{public}@)", buf, 0x16u);
  }
  objc_msgSend_notifyBlock(*(void **)(a1 + 32), v32, v33);
  char v34 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  ((void (**)(void, void *))v34)[2](v34, v14);

  _Block_object_dispose(v43, 8);
}

void sub_21E1D6BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1D6BE0(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v19, v23, 16);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v8, (uint64_t)&v19, v23, 16);
    }
    while (v5);
  }

  id v11 = objc_msgSend_sync(*(void **)(a1 + 40), v9, v10);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1D6D7C;
  block[3] = &unk_26449DB20;
  void block[4] = *(void *)(a1 + 40);
  long long v16 = *(_OWORD *)(a1 + 48);
  id v12 = (id)v16;
  long long v18 = v16;
  dispatch_async(v11, block);

  uint64_t v15 = objc_msgSend_group(*(void **)(a1 + 40), v13, v14);
  dispatch_group_leave(v15);
}

uint64_t sub_21E1D6D7C(uint64_t a1, const char *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_msgSend_setInvoking_(*(void **)(a1 + 32), a2, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  id v3 = BUCoalescingCallBlockLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_msgSend_notifyBlockDescription(*(void **)(a1 + 32), v4, v5);
    uint64_t v7 = *(void *)(a1 + 40);
    int v15 = 138543618;
    long long v16 = v6;
    __int16 v17 = 2114;
    uint64_t v18 = v7;
    _os_log_impl(&dword_21E1C7000, v3, OS_LOG_TYPE_INFO, "Notify block '%{public}@' called completion (%{public}@)", (uint8_t *)&v15, 0x16u);
  }
  uint64_t result = objc_msgSend_pending(*(void **)(a1 + 32), v8, v9);
  if (result)
  {
    uint64_t result = objc_msgSend_nextCoalescingTime(*(void **)(a1 + 32), v11, v12);
    if (result == -1) {
      return objc_msgSend__invoke(*(void **)(a1 + 32), v13, v14);
    }
  }
  return result;
}

void sub_21E1D6E8C(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = BUCoalescingCallBlockLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_msgSend_notifyBlockDescription(*(void **)(a1 + 32), v3, v4);
    uint64_t v6 = (void *)v5;
    uint64_t v7 = *(void *)(a1 + 40);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      uint64_t v8 = @"was";
    }
    else {
      uint64_t v8 = @"wasn't";
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    long long v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v7;
    _os_log_impl(&dword_21E1C7000, v2, OS_LOG_TYPE_INFO, "Notify block '%{public}@' completion timeout fired. Completion %@ called. (%{public}@)", buf, 0x20u);
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend_notifyTimeoutBlock(*(void **)(a1 + 32), v9, v10);
    id v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      uint64_t v14 = NSString;
      int v15 = objc_msgSend_notifyBlockDescription(*(void **)(a1 + 32), v11, v12);
      __int16 v17 = objc_msgSend_stringWithFormat_(v14, v16, @"'%@' (%@)", v15, *(void *)(a1 + 40));
      ((void (**)(void, void *))v13)[2](v13, v17);
    }
  }
}

uint64_t sub_21E1D7150(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__coalescingTimeExpired_, *(void *)(a1 + 40));
}

void sub_21E1D7218(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_coalescingDelay(*(void **)(a1 + 32), a2, a3);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v7 <= 0.0)
  {
    if (v6)
    {
      uint64_t v35 = objc_msgSend_callbacks(*(void **)(a1 + 32), v4, v5);

      if (!v35)
      {
        long long v38 = objc_opt_new();
        objc_msgSend_setCallbacks_(*(void **)(a1 + 32), v39, (uint64_t)v38);
      }
      uint64_t v40 = objc_msgSend_callbacks(*(void **)(a1 + 32), v36, v37);
      id v41 = (void *)MEMORY[0x223C22A70](*(void *)(a1 + 40));
      objc_msgSend_addObject_(v40, v42, (uint64_t)v41);
    }
    objc_msgSend_setPending_(*(void **)(a1 + 32), v4, 1);
    long long v45 = *(void **)(a1 + 32);
    objc_msgSend__invokeIfNotInProgress(v45, v43, v44);
  }
  else
  {
    if (v6)
    {
      uint64_t v8 = objc_msgSend_callbacks(*(void **)(a1 + 32), v4, v5);

      if (!v8)
      {
        id v11 = objc_opt_new();
        objc_msgSend_setCallbacks_(*(void **)(a1 + 32), v12, (uint64_t)v11);
      }
      id v13 = objc_msgSend_callbacks(*(void **)(a1 + 32), v9, v10);
      uint64_t v14 = (void *)MEMORY[0x223C22A70](*(void *)(a1 + 40));
      objc_msgSend_addObject_(v13, v15, (uint64_t)v14);
    }
    objc_msgSend_setPending_(*(void **)(a1 + 32), v4, 1);
    objc_msgSend_coalescingDelay(*(void **)(a1 + 32), v16, v17);
    if (v20 > 0.0)
    {
      objc_msgSend_maximumDelay(*(void **)(a1 + 32), v18, v19);
      if (v21 > 0.0 && objc_msgSend_nextMaxTime(*(void **)(a1 + 32), v18, v19) == -1)
      {
        objc_msgSend_maximumDelay(*(void **)(a1 + 32), v18, v19);
        dispatch_time_t v23 = dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
        objc_msgSend_setNextMaxTime_(*(void **)(a1 + 32), v24, v23);
        dispatch_time_t MaxTime = objc_msgSend_nextMaxTime(*(void **)(a1 + 32), v25, v26);
        uint64_t v30 = objc_msgSend_sync(*(void **)(a1 + 32), v28, v29);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_21E1D7528;
        block[3] = &unk_26449D830;
        void block[4] = *(void *)(a1 + 32);
        void block[5] = v23;
        dispatch_after(MaxTime, v30, block);
      }
    }
    objc_msgSend_coalescingDelay(*(void **)(a1 + 32), v18, v19);
    uint64_t v33 = *(void **)(a1 + 32);
    if (v34 == 0.0)
    {
      objc_msgSend__invokeIfNotInProgress(v33, v31, v32);
    }
    else
    {
      objc_msgSend_coalescingDelay(v33, v31, v32);
      dispatch_time_t v47 = dispatch_time(0, (uint64_t)(v46 * 1000000000.0));
      uint64_t CoalescingTime = objc_msgSend_nextCoalescingTime(*(void **)(a1 + 32), v48, v49);
      objc_msgSend_setNextCoalescingTime_(*(void **)(a1 + 32), v51, v47);
      if (CoalescingTime == -1)
      {
        dispatch_time_t v54 = objc_msgSend_nextCoalescingTime(*(void **)(a1 + 32), v52, v53);
        uint64_t v57 = objc_msgSend_sync(*(void **)(a1 + 32), v55, v56);
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = sub_21E1D7534;
        v58[3] = &unk_26449D830;
        v58[4] = *(void *)(a1 + 32);
        v58[5] = v47;
        dispatch_after(v54, v57, v58);
      }
    }
  }
}

uint64_t sub_21E1D7528(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__maxTimeExpired_, *(void *)(a1 + 40));
}

uint64_t sub_21E1D7534(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__coalescingTimeExpired_, *(void *)(a1 + 40));
}

uint64_t sub_21E1D7680()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_26AB40580;
  uint64_t v5 = qword_26AB40580;
  if (!qword_26AB40580)
  {
    long long v6 = xmmword_26449DB68;
    long long v7 = *(_OWORD *)&off_26449DB78;
    v3[3] = _sl_dlopen();
    qword_26AB40580 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_21E1D7790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1D77A8(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_26AB40580 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_21E1D7838()
{
  uint64_t v0 = sub_21E1D7680();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_21E1D7894()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_26AB404D8;
  uint64_t v7 = qword_26AB404D8;
  if (!qword_26AB404D8)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_21E1D7978;
    v3[3] = &unk_26449D628;
    v3[4] = &v4;
    sub_21E1D7978((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_21E1D7960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_21E1D7978(uint64_t a1)
{
  sub_21E1D7838();
  Class result = objc_getClass("CKContainer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_26AB404D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_21E1F0E34();
    return (Class)sub_21E1D79D0(v3);
  }
  return result;
}

uint64_t sub_21E1D79D0()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_26AB40588;
  uint64_t v6 = qword_26AB40588;
  if (!qword_26AB40588)
  {
    id v1 = (void *)sub_21E1D7838();
    v4[3] = (uint64_t)dlsym(v1, "CKAccountChangedNotification");
    qword_26AB40588 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_21E1D7AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_21E1D7AC0(uint64_t a1)
{
  uint64_t v2 = (void *)sub_21E1D7838();
  Class result = dlsym(v2, "CKAccountChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_26AB40588 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

BUAppDataContainer *sub_21E1D7B10()
{
  uint64_t v0 = (void **)sub_21E1D79D0();
  if (v0)
  {
    id v1 = *v0;
    return (BUAppDataContainer *)v1;
  }
  else
  {
    uint64_t v3 = (BUAppDataContainer *)sub_21E1F0E5C();
    return [(BUAppDataContainer *)v3 initWithBundleID:v5];
  }
}

void sub_21E1D7EF4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], a2, a3);
  objc_msgSend_environment(v3, v4, v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v8, v6, @"XCTestConfigurationFilePath");
  byte_267D298C0 = v7 != 0;
}

void sub_21E1D80C8()
{
  uint64_t v0 = NSTemporaryDirectory();
  objc_msgSend_stringByAppendingPathComponent_(v0, v1, @"BUUnitTest");
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  SEL v4 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v2, v3);
  objc_msgSend_removeItemAtPath_error_(v4, v5, (uint64_t)v9, 0);

  uint64_t v7 = objc_msgSend_fileURLWithPath_(NSURL, v6, (uint64_t)v9);
  id v8 = (void *)qword_267D298D0;
  qword_267D298D0 = v7;
}

uint64_t sub_21E1D825C()
{
  uint64_t v0 = [BUAppGroup alloc];
  qword_26AB40510 = objc_msgSend_initWithIdentifier_(v0, v1, @"group.com.apple.iBooks");

  return MEMORY[0x270F9A758]();
}

id sub_21E1D82F8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_books(BUAppGroup, a2, a3);
  uint64_t v6 = objc_msgSend_userDefaults(v3, v4, v5);

  return v6;
}

void sub_21E1D88B8(uint64_t a1, const char *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 0);
  }
  else
  {
    objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], a2, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
}

void sub_21E1D8B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1D8BA8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E1D8BB8(uint64_t a1)
{
}

void sub_21E1D8BC0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_21E1D91B0(uint64_t a1, const char *a2)
{
  return objc_msgSend_addEntry_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_21E1D9610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21E1D9634(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_temporaryDirectoryURL(*(void **)(a1 + 32), a2, a3);

  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v7 = objc_msgSend_fdWrapper(*(void **)(a1 + 32), v5, v6);
    id v8 = (void *)MEMORY[0x223C22810]();
    objc_msgSend_createTemporaryDirectoryRelativeToURL_(*(void **)(a1 + 32), v9, *(void *)(a1 + 40));
    id v12 = objc_msgSend_temporaryDirectoryURL(*(void **)(a1 + 32), v10, v11);
    uint64_t v14 = objc_msgSend_URLByAppendingPathComponent_(v12, v13, @"Temp.zip");

    if (v14)
    {
      int v15 = [BUFileIOChannel alloc];
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v16 + 40);
      uint64_t v18 = objc_msgSend_initForStreamWritingURL_error_(v15, v17, (uint64_t)v14, &obj);
      objc_storeStrong((id *)(v16 + 40), obj);
    }
    else
    {
      uint64_t v18 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v18 != 0;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v58 = 0;
      CGRect v59 = &v58;
      uint64_t v60 = 0x3032000000;
      uint64_t v61 = sub_21E1D8BA8;
      uint64_t v62 = sub_21E1D8BB8;
      id v63 = 0;
      uint64_t v19 = dispatch_group_create();
      dispatch_group_enter(v19);
      double v22 = objc_msgSend_readChannel(v7, v20, v21);
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = sub_21E1D9A98;
      v54[3] = &unk_26449DC30;
      uint64_t v57 = &v58;
      dispatch_time_t v23 = v19;
      CGRect v55 = v23;
      id v24 = v18;
      id v56 = v24;
      objc_msgSend_readFromOffset_length_handler_(v22, v25, 0, -1, v54);

      dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend_close(v24, v26, v27);

      id v28 = v59;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v59[5] == 0;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), (id)v28[5]);
        uint64_t v29 = BUZipLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          double v42 = objc_msgSend_path(*(void **)(a1 + 40), v30, v31);
          long long v45 = objc_msgSend_path(v14, v43, v44);
          uint64_t v48 = objc_msgSend_code((void *)v59[5], v46, v47);
          CGRect v51 = objc_msgSend_domain((void *)v59[5], v49, v50);
          uint64_t v52 = v59[5];
          *(_DWORD *)buf = 138413314;
          v66 = v42;
          __int16 v67 = 2112;
          v68 = v45;
          __int16 v69 = 2048;
          uint64_t v70 = v48;
          __int16 v71 = 2114;
          uint64_t v72 = v51;
          __int16 v73 = 2112;
          uint64_t v74 = v52;
          _os_log_error_impl(&dword_21E1C7000, v29, OS_LOG_TYPE_ERROR, "Failed to copy zip file from %@ to %@ with error: %zd %{public}@ %@", buf, 0x34u);
        }
      }

      _Block_object_dispose(&v58, 8);
      uint64_t v18 = 0;
    }
    else
    {
      BUZipLog();
      double v34 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR)) {
        sub_21E1F12A8(v14, v34, v35);
      }
    }
    uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v36 + 24))
    {
      uint64_t v37 = *(void **)(a1 + 32);
      uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 8);
      id v53 = *(id *)(v38 + 40);
      char v39 = objc_msgSend_reopenWithTemporaryURL_error_(v37, v32, (uint64_t)v14, &v53);
      objc_storeStrong((id *)(v38 + 40), v53);
      uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      char v39 = 0;
    }
    *(unsigned char *)(v36 + 24) = v39;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      objc_msgSend_removeTemporaryDirectory(*(void **)(a1 + 32), v32, v33);
    }

    objc_msgSend_waitForAccessToEnd(v7, v40, v41);
  }
}

void sub_21E1D9A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1D9A98(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  unint64_t v8 = a4;
  uint64_t v9 = (void *)v8;
  if (v7 && !(v8 | *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_21E1D9BA8;
    v15[3] = &unk_26449DC08;
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    id v16 = *(id *)(a1 + 32);
    objc_msgSend_writeData_handler_(v10, v11, (uint64_t)v7, v15);
  }
  if (a2)
  {
    if (v9)
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v14 = *(void *)(v12 + 40);
      id v13 = (id *)(v12 + 40);
      if (!v14) {
        objc_storeStrong(v13, a4);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_21E1D9BA8(uint64_t a1, int a2, void *a3, void *a4)
{
  id v12 = a3;
  id v7 = a4;
  unint64_t v8 = v7;
  if (a2)
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v11 = *(void *)(v9 + 40);
      uint64_t v10 = (id *)(v9 + 40);
      if (!v11) {
        objc_storeStrong(v10, a4);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_21E1D9CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1D9D08(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

void sub_21E1D9E0C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_fdWrapper(*(void **)(a1 + 32), a2, a3);
  id v7 = v4;
  if (v4)
  {
    int v8 = objc_msgSend_fileDescriptor(v4, v5, v6);
    uint64_t v9 = dup(v8);
    if ((v9 & 0x80000000) != 0)
    {
      uint64_t v21 = BUZipLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_21E1F1378();
      }
    }
    else
    {
      uint64_t v12 = v9;
      objc_msgSend_beginAccess(v7, v10, v11);
      id v13 = [BUFileIOChannel alloc];
      id v16 = objc_msgSend_accessQueue(*(void **)(a1 + 32), v14, v15);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = sub_21E1D9F68;
      v22[3] = &unk_26449DC80;
      int v24 = v12;
      dispatch_time_t v23 = v7;
      uint64_t v18 = objc_msgSend_initForReadingDescriptor_queue_cleanupHandler_(v13, v17, v12, v16, v22);
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      double v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      uint64_t v21 = v23;
    }
  }
  else
  {
    uint64_t v21 = BUZipLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21E1F1334(v21);
    }
  }
}

uint64_t sub_21E1D9F68(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);

  return MEMORY[0x270F9A6D0](v3, sel_endAccess, v2);
}

void sub_21E1DA058(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = objc_msgSend_fdWrapper(*(void **)(a1 + 32), a2, a3);
  if (v6)
  {
    id v7 = objc_msgSend_fdWrapper(*(void **)(a1 + 32), v4, v5);
    int v10 = objc_msgSend_fileDescriptor(v7, v8, v9);
  }
  else
  {
    int v10 = -1;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10 >= 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v11 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = read(v10, &v11, 0) == 0;
  }
}

void sub_21E1DA3EC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_21E1DA40C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void BUCastStatsDump()
{
  NSLog(&cfstr_CastPerFile.isa);
  sub_21E1DA4A8(v0, (void *)qword_267D298D8);
  NSLog(&cfstr_CastPerCallsit.isa);
  sub_21E1DA4A8(v1, (void *)qword_267D298E8);
  NSLog(&cfstr_CastPerType.isa);
  sub_21E1DA4A8(v2, (void *)qword_267D298E0);
  NSLog(&cfstr_TotalCastsLu.isa, qword_267D298F0);
}

void sub_21E1DA4A8(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v5 = objc_msgSend_allKeys(v2, v3, v4);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21E1DA5C4;
  v13[3] = &unk_26449DCA8;
  id v6 = v2;
  id v14 = v6;
  int v8 = objc_msgSend_sortedArrayUsingComparator_(v5, v7, (uint64_t)v13);

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = sub_21E1DA650;
  v11[3] = &unk_26449DCD0;
  id v12 = v6;
  id v9 = v6;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v10, (uint64_t)v11);
}

uint64_t sub_21E1DA5C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  int v8 = objc_msgSend_objectForKeyedSubscript_(v5, v7, a2);
  unint64_t v11 = objc_msgSend_unsignedIntegerValue(v8, v9, v10);

  id v13 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v12, (uint64_t)v6);

  unint64_t v16 = objc_msgSend_unsignedIntegerValue(v13, v14, v15);
  if (v11 < v16) {
    return -1;
  }
  else {
    return v11 > v16;
  }
}

void sub_21E1DA650(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend_objectForKeyedSubscript_(v2, v4, (uint64_t)v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_unsignedIntegerValue(v8, v5, v6);
  NSLog(&cfstr_8lu.isa, v7, v3);
}

void BUCastRecord(uint64_t a1, int a2, uint64_t a3)
{
  if (qword_267D29900 != -1) {
    dispatch_once(&qword_267D29900, &unk_26CF10AD8);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1DA7BC;
  block[3] = &unk_26449DCF0;
  void block[4] = a1;
  void block[5] = a3;
  int v7 = a2;
  dispatch_sync((dispatch_queue_t)qword_267D298F8, block);
}

uint64_t sub_21E1DA77C()
{
  qword_267D298F8 = (uint64_t)dispatch_queue_create("BookUtility.castStats", 0);

  return MEMORY[0x270F9A758]();
}

void sub_21E1DA7BC(uint64_t a1, const char *a2)
{
  ++qword_267D298F0;
  if (!qword_267D298D8)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = (void *)qword_267D298D8;
    qword_267D298D8 = v3;
  }
  if (!qword_267D298E0)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = (void *)qword_267D298E0;
    qword_267D298E0 = v5;
  }
  if (!qword_267D298E8)
  {
    uint64_t v7 = objc_opt_new();
    id v8 = (void *)qword_267D298E8;
    qword_267D298E8 = v7;
  }
  objc_msgSend_stringWithUTF8String_(NSString, a2, *(void *)(a1 + 32));
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_stringWithUTF8String_(NSString, v9, *(void *)(a1 + 40));
  id v12 = objc_msgSend_stringWithFormat_(NSString, v11, @"%s:%lu", *(void *)(a1 + 32), *(int *)(a1 + 48));
  id v13 = NSNumber;
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_((void *)qword_267D298D8, v14, (uint64_t)v40);
  uint64_t v18 = objc_msgSend_unsignedIntegerValue(v15, v16, v17);
  double v20 = objc_msgSend_numberWithUnsignedInteger_(v13, v19, v18 + 1);
  objc_msgSend_setObject_forKeyedSubscript_((void *)qword_267D298D8, v21, (uint64_t)v20, v40);

  double v22 = NSNumber;
  int v24 = objc_msgSend_objectForKeyedSubscript_((void *)qword_267D298E0, v23, (uint64_t)v10);
  uint64_t v27 = objc_msgSend_unsignedIntegerValue(v24, v25, v26);
  uint64_t v29 = objc_msgSend_numberWithUnsignedInteger_(v22, v28, v27 + 1);
  objc_msgSend_setObject_forKeyedSubscript_((void *)qword_267D298E0, v30, (uint64_t)v29, v10);

  uint64_t v31 = NSNumber;
  uint64_t v33 = objc_msgSend_objectForKeyedSubscript_((void *)qword_267D298E8, v32, (uint64_t)v12);
  uint64_t v36 = objc_msgSend_unsignedIntegerValue(v33, v34, v35);
  uint64_t v38 = objc_msgSend_numberWithUnsignedInteger_(v31, v37, v36 + 1);
  objc_msgSend_setObject_forKeyedSubscript_((void *)qword_267D298E8, v39, (uint64_t)v38, v12);
}

id BUStaticCast(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id BUStaticProtocolCast(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v6 = v4;
  if (v4 && objc_msgSend_conformsToProtocol_(v4, v5, (uint64_t)v3)) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

id BUClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v15 = &a9;
    if (!a3)
    {
LABEL_6:
      id v13 = v10;
      goto LABEL_8;
    }
    while (1)
    {
      id v12 = v15++;
      if ((objc_msgSend_conformsToProtocol_(v10, v11, *v12) & 1) == 0) {
        break;
      }
      if (!--a3) {
        goto LABEL_6;
      }
    }
  }
  id v13 = 0;
LABEL_8:

  return v13;
}

id BUStaticClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    unint64_t v16 = (id *)&a9;
    if (!a3)
    {
LABEL_6:
      id v14 = v10;
      goto LABEL_9;
    }
    while (1)
    {
      unint64_t v11 = v16++;
      id v12 = *v11;
      if ((objc_msgSend_conformsToProtocol_(v10, v13, (uint64_t)v12) & 1) == 0) {
        break;
      }

      if (!--a3) {
        goto LABEL_6;
      }
    }
  }
  id v14 = 0;
LABEL_9:

  return v14;
}

CFTypeRef BUCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf) {
    return 0;
  }
  if (CFGetTypeID(cf) == a1) {
    return cf;
  }
  return 0;
}

uint64_t sub_21E1DADE8(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_21E1DB70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E1DB734(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    uint64_t v2 = MEMORY[0x223C22A70](WeakRetained[21]);
    id v3 = (void *)v2;
    if (v2) {
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    }

    id v4 = (void *)v5[21];
    v5[21] = 0;

    id WeakRetained = v5;
  }
}

void sub_21E1DBAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v22 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1DBB08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E1DBB18(uint64_t a1)
{
}

uint64_t sub_21E1DBB20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_addExistingEntry_, a3);
}

void sub_21E1DBB28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    uint64_t v2 = MEMORY[0x223C22A70](WeakRetained[21]);
    id v3 = (void *)v2;
    if (v2) {
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    }

    id v4 = (void *)v5[21];
    v5[21] = 0;

    id WeakRetained = v5;
  }
}

void sub_21E1DBBAC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_21E1DBE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1DBE90(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend_addObject_(v4, v6, (uint64_t)v5);
  uint64_t v9 = objc_msgSend_size(v5, v7, v8);

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v9;
}

uint64_t sub_21E1DBEF4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v7 = objc_msgSend_offset(a2, v5, v6);
  unint64_t v10 = objc_msgSend_offset(v4, v8, v9);

  if (v7 < v10) {
    return -1;
  }
  else {
    return v7 > v10;
  }
}

void sub_21E1DC178(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a2)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = objc_msgSend_size(*(void **)(a1 + 40), a2, a3);
    uint64_t v8 = objc_msgSend_completedUnitCount(v4, v6, v7);
    objc_msgSend_setCompletedUnitCount_(v4, v9, v8 + v5);
    unint64_t v11 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v15 = *(void *)(a1 + 72);
    objc_msgSend_copyRemainingEntries_fromArchive_progress_completionHandler_(v11, v10, v12, v14, v13, v15);
  }
  else
  {
    uint64_t v18 = (void (**)(id, void *))MEMORY[0x223C22A70](*(void *)(a1 + 72));
    if (v18)
    {
      uint64_t v17 = objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v16, 0);
      v18[2](v18, v17);
    }
  }
}

uint64_t sub_21E1DC378(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  if (a2)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v7 == 0);
    }
  }

  return MEMORY[0x270F9A790]();
}

void sub_21E1DCAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a68, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1DCB58(uint64_t a1)
{
  char v2 = 0;
  return (*(uint64_t (**)(void, uint64_t, void, void, void, char *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, 0, *(void *)(a1 + 32), &v2);
}

uint64_t sub_21E1DCB9C(void *a1, uint64_t a2, NSObject *a3, void *a4, unsigned char *a5)
{
  uint64_t v13 = a4;
  if (a3) {
    *(void *)(*(void *)(a1[5] + 8) + 24) += dispatch_data_get_size(a3);
  }
  uint64_t v8 = (id *)(*(uint64_t (**)(void))(a1[4] + 16))();
  uint64_t v9 = v13;
  if (!v13 && *a5)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], 0, *MEMORY[0x263F07F70], 3072, 0);
    uint64_t v8 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v8;
  }
  if (v9)
  {
    uint64_t v10 = *(void *)(a1[6] + 8);
    uint64_t v11 = *(void *)(v10 + 40);
    uint64_t v8 = (id *)(v10 + 40);
    if (!v11)
    {
      uint64_t v14 = v9;
      objc_storeStrong(v8, v9);
      uint64_t v9 = v14;
    }
  }

  return MEMORY[0x270F9A758](v8, v9);
}

void sub_21E1DCC8C(void *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  char v7 = 0;
  uint64_t v4 = a1[4];
  if (!a2) {
    uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 40);
  }
  (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, char *))(v4 + 16))(v4, 1, a1[6], a1[6], v2, &v7);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void sub_21E1DCED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1DCEEC(uint64_t a1, const char *a2, void *a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend_size(a3, a2, (uint64_t)a3);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_21E1DD1F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v9 = v6;
  if (v6)
  {
    uint64_t v10 = objc_msgSend_userInfo(v6, v7, v8);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, @"BUZipArchiveErrorDescription");
    uint64_t v13 = (void *)v12;
    uint64_t v14 = &stru_26CF11AD8;
    if (v12) {
      uint64_t v14 = (__CFString *)v12;
    }
    uint64_t v15 = v14;

    unint64_t v16 = BUZipLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_21E1F1634();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21E1DD2D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend_close(*(void **)(a1 + 32), v4, v5);
  if (v3)
  {
    id v8 = 0;
  }
  else
  {
    if (objc_msgSend_options(*(void **)(a1 + 40), v6, v7)) {
      objc_msgSend_collapseCommonRootDirectory(*(void **)(a1 + 40), v9, v10);
    }
    id v8 = *(id *)(a1 + 40);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21E1DD3D4;
  block[3] = &unk_26449DEE8;
  uint64_t v11 = *(NSObject **)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v17 = v3;
  id v18 = v12;
  id v16 = v8;
  id v13 = v3;
  id v14 = v8;
  dispatch_async(v11, block);
}

uint64_t sub_21E1DD3D4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_21E1DD3EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 56);
    id v8 = *(void **)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_21E1DD4F8;
    v12[3] = &unk_26449DF38;
    v12[4] = v8;
    id v13 = v7;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v14 = v9;
    uint64_t v15 = v10;
    objc_msgSend_readEndOfCentralDirectoryData_eocdOffset_channel_completion_(v8, v11, a2, v6, v13, v12);
  }
}

void sub_21E1DD4F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend_options(*(void **)(a1 + 32), v4, v5) & 4) != 0
    && objc_msgSend_code(v3, v6, v7) == 259
    && (objc_msgSend_domain(v3, v6, v8),
        id v9 = objc_claimAutoreleasedReturnValue(),
        int isEqualToString = objc_msgSend_isEqualToString_(v9, v10, *MEMORY[0x263F07F70]),
        v9,
        isEqualToString))
  {
    id v13 = objc_msgSend_userInfo(v3, v6, v12);
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"BUZipArchiveErrorDescription");

    if (v15)
    {
      id v16 = BUZipLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_21E1F16B8();
      }

      objc_msgSend_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion_(*(void **)(a1 + 32), v17, *(void *)(a1 + 40), 0, 0, 0, 0, *(void *)(a1 + 48));
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    if (!v3) {
      objc_msgSend_setEndOfLastEntry_(*(void **)(a1 + 32), v6, *(void *)(a1 + 56));
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_21E1DD62C(uint64_t a1, const char *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], a2, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
}

uint64_t sub_21E1DDA44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_readZip64EndOfCentralDirectoryLocatorData_channel_completion_, a2);
  }
}

uint64_t sub_21E1DDD3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_readZip64EndOfCentralDirectoryData_channel_completion_, a2);
  }
}

uint64_t sub_21E1DE0D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_readCentralDirectoryData_entryCount_completion_, a2);
  }
}

void sub_21E1DED9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = sub_21E1DEEC8;
    v10[3] = &unk_26449DFD8;
    v10[4] = v7;
    id v11 = *(id *)(a1 + 48);
    char v15 = *(unsigned char *)(a1 + 76);
    int v14 = *(_DWORD *)(a1 + 72);
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 56);
    objc_msgSend_readLocalFileHeaderData_atOffset_channel_completion_(v7, v9, a2, v6, v8, v10);
  }
}

void sub_21E1DEEC8(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v10 = a3;
  if (v10)
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_3:
    v11();
    goto LABEL_10;
  }
  if (!v7)
  {
    if (a4)
    {
LABEL_37:
      id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      goto LABEL_3;
    }
    uint64_t v25 = *(unsigned int *)(a1 + 64);
    if (*(unsigned char *)(a1 + 68))
    {
      if (v25)
      {
LABEL_22:
        int v30 = 1;
        unint64_t v27 = 100;
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v26 = objc_msgSend_compressedSize(*(void **)(a1 + 40), v8, v9);
      if (v26 >= 0x64) {
        unint64_t v27 = 100;
      }
      else {
        unint64_t v27 = v26;
      }
      if (v27 != v25)
      {
        if (!v25)
        {
          BUZipLog();
          uint64_t v41 = (char *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR)) {
            sub_21E1F181C(a1, v41, v42);
          }

          if (v27)
          {
            uint64_t v31 = 1;
            goto LABEL_32;
          }
          goto LABEL_34;
        }
        int v30 = 0;
LABEL_23:
        if (v27 > v25)
        {
          uint64_t v31 = (v25 + 1);
          if (v30)
          {
            uint64_t v32 = objc_msgSend_offset(*(void **)(a1 + 40), v8, v9);
            uint64_t v35 = objc_msgSend_fileHeaderLength(*(void **)(a1 + 40), v33, v34);
            uint64_t v39 = v32 + v31 + v35 + objc_msgSend_compressedSize(*(void **)(a1 + 40), v36, v37);
            uint64_t v40 = 1;
LABEL_33:
            objc_msgSend_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion_(*(void **)(a1 + 32), v38, *(void *)(a1 + 48), v39, *(void *)(a1 + 40), v31, v40, *(void *)(a1 + 56));
            goto LABEL_10;
          }
LABEL_32:
          uint64_t v43 = objc_msgSend_offset(*(void **)(a1 + 40), v8, v9);
          uint64_t v46 = objc_msgSend_fileHeaderLength(*(void **)(a1 + 40), v44, v45);
          uint64_t v49 = objc_msgSend_compressedSize(*(void **)(a1 + 40), v47, v48);
          uint64_t v40 = 0;
          uint64_t v39 = v43 - v31 + v46 + v49;
          goto LABEL_33;
        }
LABEL_34:
        uint64_t v50 = BUZipLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          sub_21E1F1720();
        }

        goto LABEL_37;
      }
    }
    BUZipLog();
    id v28 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
      sub_21E1F1788(a1, v28, v29);
    }

    LODWORD(v25) = 0;
    goto LABEL_22;
  }
  objc_msgSend_addEntry_(*(void **)(a1 + 32), v8, (uint64_t)v7);
  int v14 = *(void **)(a1 + 40);
  if (v14 && !*(unsigned char *)(a1 + 68) && *(_DWORD *)(a1 + 64))
  {
    uint64_t v15 = objc_msgSend_compressedSize(*(void **)(a1 + 40), v12, v13);
    objc_msgSend_setCompressedSize_(v14, v16, v15 - *(unsigned int *)(a1 + 64));
  }
  uint64_t v17 = objc_msgSend_offset(v7, v12, v13);
  uint64_t v20 = objc_msgSend_fileHeaderLength(v7, v18, v19) + v17;
  uint64_t v23 = v20 + objc_msgSend_compressedSize(v7, v21, v22);
  objc_msgSend_readLocalFileHeaderEntriesFromChannel_offset_previousEntry_seekAttempts_seekForward_completion_(*(void **)(a1 + 32), v24, *(void *)(a1 + 48), v23, v7, 0, 0, *(void *)(a1 + 56));
LABEL_10:
}

void sub_21E1DF52C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  if (v7
    || (uint64_t v8 = *(void **)(a1 + 32),
        uint64_t v9 = *(void *)(a1 + 40),
        id v24 = 0,
        int v10 = objc_msgSend_readLocalFileHeaderFilenameAndExtraFieldsData_forEntry_error_(v8, v6, (uint64_t)v5, v9, &v24),
        id v7 = v24,
        !v10))
  {
    uint64_t v23 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v13 = objc_msgSend_offset(*(void **)(a1 + 40), v11, v12);
    uint64_t v16 = objc_msgSend_fileHeaderLength(*(void **)(a1 + 40), v14, v15) + v13;
    uint64_t v19 = v16 + objc_msgSend_compressedSize(*(void **)(a1 + 40), v17, v18);
    if (v19 > objc_msgSend_endOfLastEntry(*(void **)(a1 + 32), v20, v21)) {
      objc_msgSend_setEndOfLastEntry_(*(void **)(a1 + 32), v22, v19);
    }
    uint64_t v23 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v23();
}

id sub_21E1DF9E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [BUZipInflateReadChannel alloc];
  objc_msgSend_size(*(void **)(a1 + 32), v5, v6);
  uint64_t v9 = objc_msgSend_size(*(void **)(a1 + 32), v7, v8);
  uint64_t v12 = objc_msgSend_CRC(*(void **)(a1 + 32), v10, v11);
  Channel_uncompressedSize_CRC_validateCRC = objc_msgSend_initWithReadChannel_uncompressedSize_CRC_validateCRC_(v4, v13, (uint64_t)v3, v9, v12, *(unsigned __int8 *)(a1 + 40));

  return Channel_uncompressedSize_CRC_validateCRC;
}

void sub_21E1DFFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1DFFD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E1DFFE0(uint64_t a1)
{
}

void sub_21E1DFFE8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  objc_msgSend_pathComponents(a2, (const char *)a2, a3);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(v38, v6, v7) < 2
    || (objc_msgSend_objectAtIndexedSubscript_(v38, v8, 0),
        int v10 = objc_claimAutoreleasedReturnValue(),
        char isEqualToString = objc_msgSend_isEqualToString_(v10, v11, @"__MACOSX"),
        v10,
        uint64_t v13 = v38,
        (isEqualToString & 1) == 0))
  {
    int v14 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v14)
    {
      unint64_t v17 = 0;
      if (!objc_msgSend_count(v14, v8, v9)) {
        goto LABEL_10;
      }
      do
      {
        if (v17 >= objc_msgSend_count(v38, v15, v16)) {
          break;
        }
        uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v15, v17);
        uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v38, v19, v17);
        uint64_t v22 = objc_msgSend_compare_options_(v18, v21, (uint64_t)v20, *(void *)(a1 + 40));

        if (v22) {
          break;
        }
        ++v17;
      }
      while (v17 < objc_msgSend_count(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v15, v16));
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
        id v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = 0;

        *a4 = 1;
      }
      else
      {
LABEL_10:
        BOOL v25 = v17 >= objc_msgSend_count(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v15, v16);
        uint64_t v13 = v38;
        if (v25) {
          goto LABEL_14;
        }
        id v28 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        uint64_t v29 = objc_msgSend_count(v28, v26, v27);
        objc_msgSend_removeObjectsInRange_(v28, v30, v17, v29 - v17);
      }
    }
    else
    {
      id v31 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v33 = objc_msgSend_initWithArray_(v31, v32, (uint64_t)v38);
      uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v35 = *(void **)(v34 + 40);
      *(void *)(v34 + 40) = v33;

      objc_msgSend_removeLastObject(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v36, v37);
    }
    uint64_t v13 = v38;
  }
LABEL_14:
}

void sub_21E1E01C4(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (objc_msgSend_length(v15, v6, v7) <= (unint64_t)(*(void *)(a1 + 48) + 1))
  {
    uint64_t v11 = objc_msgSend_entries(*(void **)(a1 + 40), v8, v9);
    objc_msgSend_removeObject_(v11, v14, (uint64_t)v5);
  }
  else
  {
    if (objc_msgSend_hasPrefix_(v15, v8, @"__MACOSX")) {
      goto LABEL_6;
    }
    uint64_t v11 = objc_msgSend_substringFromIndex_(v15, v10, *(void *)(a1 + 48) + 1);
    objc_msgSend_setCollapsedName_(v5, v12, (uint64_t)v11);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v13, (uint64_t)v5, v11);
  }

LABEL_6:
}

void sub_21E1E0588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1E05A0(uint64_t a1, const char *a2, void *a3)
{
  uint64_t result = objc_msgSend_size(a3, a2, (uint64_t)a3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void sub_21E1E0AB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (a2 == 1)
  {
    id v19 = objc_begin_catch(exception_object);
    uint64_t v20 = BUZipLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21E1F1990();
    }

    uint64_t v22 = objc_msgSend_stringWithFormat_(NSString, v21, @"Exception thrown during extractToURL - toURL: %@, exception: %@");
    *(void *)(v18 - 240) = *MEMORY[0x263F07F80];
    *(void *)(v18 - 232) = v22;
    id v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, v18 - 232, v18 - 240, 1);
    objc_msgSend_bu_fileWriteUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v25, (uint64_t)v24);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x21E1E09F0);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21E1E0BEC(uint64_t a1, const char *a2)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

id sub_21E1E0CCC(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  int v10 = objc_msgSend_stringByAppendingPathComponent_(v7, v9, (uint64_t)v8);
  if (objc_msgSend_fileExistsAtPath_(a1, v11, (uint64_t)v10))
  {
    int v14 = objc_msgSend_pathExtension(v8, v12, v13);
    uint64_t v18 = objc_msgSend_stringByDeletingPathExtension(v8, v15, v16);
    uint64_t v19 = 1;
    id v26 = v8;
    uint64_t v20 = v8;
    do
    {
      uint64_t v21 = v20;
      uint64_t v22 = v10;
      uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v17, @"%@ %d.%@", v18, v19, v14);

      int v10 = objc_msgSend_stringByAppendingPathComponent_(v7, v23, (uint64_t)v20);

      uint64_t v19 = (v19 + 1);
    }
    while ((objc_msgSend_fileExistsAtPath_(a1, v24, (uint64_t)v10) & 1) != 0);

    id v8 = v26;
  }
  else
  {
    uint64_t v20 = v8;
  }

  return v20;
}

id sub_21E1E0E14(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v4 = (const void *)objc_msgSend_bytes(v1, v2, v3);
  CC_LONG v7 = objc_msgSend_length(v1, v5, v6);
  CC_MD5(v4, v7, md);
  int v10 = objc_msgSend_stringWithCapacity_(MEMORY[0x263F089D8], v8, 32);
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend_appendFormat_(v10, v9, @"%02x", md[i]);
  uint64_t v13 = objc_msgSend_copy(v10, v9, v12);

  return v13;
}

id sub_21E1E0F00(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_bu_md5(a1, a2, a3);
  uint64_t v6 = objc_msgSend_uppercaseString(v3, v4, v5);

  return v6;
}

id sub_21E1E0F4C(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v4 = (const void *)objc_msgSend_bytes(v1, v2, v3);
  CC_LONG v7 = objc_msgSend_length(v1, v5, v6);
  CC_SHA1(v4, v7, md);
  uint64_t v11 = objc_msgSend_string(MEMORY[0x263F089D8], v8, v9);
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend_appendFormat_(v11, v10, @"%02x", md[i]);

  return v11;
}

id sub_21E1E1024(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v4 = (const void *)objc_msgSend_bytes(v1, v2, v3);
  CC_LONG v7 = objc_msgSend_length(v1, v5, v6);
  CC_SHA256(v4, v7, md);
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (uint64_t i = 0; i != 32; ++i)
  {
    uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v8, @"%02x", md[i]);
    objc_msgSend_addObject_(v9, v12, (uint64_t)v11);
  }
  uint64_t v13 = objc_msgSend_componentsJoinedByString_(v9, v8, (uint64_t)&stru_26CF11AD8);

  return v13;
}

id sub_21E1E1138(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_length(a1, a2, a3);
  if (v4)
  {
    unint64_t v5 = (unint64_t)v4;
    memset(&v16, 0, sizeof(v16));
    CC_SHA384_Init(&v16);
    id v6 = a1;
    id v9 = (char *)objc_msgSend_bytes(v6, v7, v8);
    if (v5 < 0x10000) {
      goto LABEL_5;
    }
    do
    {
      CC_SHA384_Update(&v16, v9, 0x10000u);
      v9 += 0x10000;
      v5 -= 0x10000;
    }
    while (v5 >> 16);
    if (v5) {
LABEL_5:
    }
      CC_SHA384_Update(&v16, v9, v5);
    CC_SHA384_Final(md, &v16);
    uint64_t v10 = 0;
    char v18 = 0;
    uint64_t v11 = (char *)v17 + 1;
    memset(v17, 0, sizeof(v17));
    do
    {
      unint64_t v12 = md[v10];
      *(v11 - 1) = a0123456789abcd[v12 >> 4];
      unsigned char *v11 = a0123456789abcd[v12 & 0xF];
      v11 += 2;
      ++v10;
    }
    while (v10 != 48);
    id v13 = [NSString alloc];
    uint64_t v4 = objc_msgSend_initWithBytes_length_encoding_(v13, v14, (uint64_t)v17, 96, 4);
  }

  return v4;
}

__CFString *sub_21E1E12A0(void *a1, const char *a2)
{
  uint64_t v2 = objc_msgSend_base64EncodedStringWithOptions_(a1, a2, 0);
  if (objc_msgSend_length(v2, v3, v4))
  {
    id v5 = objc_alloc(MEMORY[0x263F089D8]);
    uint64_t v8 = objc_msgSend_length(@"data:image/png;base64,", v6, v7);
    uint64_t v11 = objc_msgSend_length(v2, v9, v10);
    id v13 = (__CFString *)objc_msgSend_initWithCapacity_(v5, v12, v11 + v8);
    objc_msgSend_appendString_(v13, v14, @"data:image/png;base64,");
    objc_msgSend_appendString_(v13, v15, (uint64_t)v2);
  }
  else
  {
    id v13 = &stru_26CF11AD8;
  }

  return v13;
}

id sub_21E1E1350(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_length(a1, a2, a3);
  id v6 = objc_msgSend_stringWithCapacity_(MEMORY[0x263F089D8], v5, 2 * v4);
  id v7 = a1;
  uint64_t v10 = objc_msgSend_bytes(v7, v8, v9);
  if (v4)
  {
    unint64_t v12 = (unsigned __int8 *)v10;
    do
    {
      unsigned int v13 = *v12++;
      objc_msgSend_appendFormat_(v6, v11, @"%02x", v13);
      --v4;
    }
    while (v4);
  }

  return v6;
}

id sub_21E1E13EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5))
  {
    unint64_t v8 = objc_msgSend_length(v3, v6, v7);
    unint64_t v9 = v8 >> 1;
    uint64_t v10 = malloc_type_malloc(v8 >> 1, 0xE37DA0DDuLL);
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = v3;
      uint64_t v15 = objc_msgSend_UTF8String(v12, v13, v14);
      if (v8 < 2)
      {
LABEL_9:
        id v19 = objc_alloc(MEMORY[0x263EFF8F8]);
        uint64_t v21 = objc_msgSend_initWithBytesNoCopy_length_(v19, v20, (uint64_t)v11, v9);
        goto LABEL_12;
      }
      CC_SHA512_CTX v16 = (const char *)v15;
      uint64_t v17 = 0;
      if (v9 <= 1) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = v8 >> 1;
      }
      while (1)
      {
        __int16 v23 = 0;
        if (sscanf(v16, "%1hhx%1hhx", (char *)&v23 + 1, &v23) < 2) {
          break;
        }
        v11[v17++] = v23 + 16 * HIBYTE(v23);
        v16 += 2;
        if (v18 == v17) {
          goto LABEL_9;
        }
      }
      free(v11);
    }
  }
  uint64_t v21 = 0;
LABEL_12:

  return v21;
}

void sub_21E1E1670(uint64_t a1)
{
  uint64_t v4 = (void (**)(void))MEMORY[0x223C22A70](*(void *)(*(void *)(a1 + 32) + 16));
  if (v4) {
    v4[2]();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

void sub_21E1E196C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21E1E1994(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) || *(void *)(*(void *)(a1 + 32) + 16))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v1 = (void *)(a1 + 32);
    *(unsigned char *)(*(void *)(v1[2] + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 16) == 0;
    ++*(void *)(*v1 + 16);
    uint64_t v2 = BUAssertionLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_21E1F1A90((uint64_t)v1, v2);
    }
  }
}

void sub_21E1E1A30(uint64_t a1, const char *a2, uint64_t a3)
{
  if (objc_msgSend__endAssertion(*(void **)(a1 + 32), a2, a3))
  {
    uint64_t v4 = BUAssertionLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_21E1F1B10(v4);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    objc_msgSend_countingAssertProviderTransitionToZero_(WeakRetained, v6, *(void *)(a1 + 32));
  }
}

uint64_t BUShouldStopInDebugger()
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (!BUGrantDebuggerPermissionToStopExecution) {
    return 0;
  }
  if (qword_26AB40578 != -1) {
    dispatch_once(&qword_26AB40578, &unk_26CF10B18);
  }
  if (byte_26AB404B0 && BUForceUnitTestsToHaltDebugger == 0) {
    return 0;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
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
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *(void *)id v3 = 0xE00000001;
  int v4 = 1;
  pid_t v5 = getpid();
  size_t v2 = 648;
  sysctl(v3, 4u, v6, &v2, 0, 0);
  return (v7 >> 11) & 1;
}

uint64_t BUHaltDebugger()
{
  uint64_t result = BUShouldStopInDebugger();
  if (result) {
    __break(0);
  }
  return result;
}

void sub_21E1E1CBC(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], a2, a3);
  objc_msgSend_environment(v3, v4, v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  long long v7 = objc_msgSend_objectForKeyedSubscript_(v8, v6, @"XCTestConfigurationFilePath");
  byte_26AB404B0 = v7 != 0;
}

void BUReportAssertionFailureWithMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v13 = a5;
  if (objc_msgSend_length(v13, v14, v15))
  {
    id v17 = [NSString alloc];
    long long v19 = (__CFString *)objc_msgSend_initWithFormat_arguments_(v17, v18, (uint64_t)v13, &a9);
    if (!a1) {
      goto LABEL_6;
    }
LABEL_5:
    long long v20 = objc_msgSend_stringWithCString_encoding_(NSString, v16, a1, 1);
    objc_msgSend_lastPathComponent(v20, v21, v22);
    long long v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v23) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  long long v19 = &stru_26CF11AD8;
  if (a1) {
    goto LABEL_5;
  }
LABEL_6:
  long long v23 = &stru_26CF11AD8;
LABEL_7:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    long long v25 = objc_msgSend_numberWithInt_(NSNumber, v24, a2);
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = a4;
    __int16 v28 = 2080;
    uint64_t v29 = a3;
    __int16 v30 = 2112;
    long long v31 = v23;
    __int16 v32 = 2112;
    long long v33 = v25;
    __int16 v34 = 2112;
    long long v35 = v19;
    _os_log_error_impl(&dword_21E1C7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure: %s in %s - %@:%@ %@", buf, 0x34u);
  }
}

void BUCrashFinalThrow(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  if (objc_msgSend_length(v9, v10, v11))
  {
    id v13 = [NSString alloc];
    uint64_t v15 = objc_msgSend_initWithFormat_arguments_(v13, v14, (uint64_t)v9, &a9);
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v16, @"BUCrash", v15, 0);
  }
  else
  {
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v12, @"BUCrash", &stru_26CF11AD8, 0);
  }
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v17);
}

BOOL BUEncodedBlockInfoAreEqual(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v7 = objc_msgSend_encodedLength(v3, v5, v6);
  if (v7 == objc_msgSend_encodedLength(v4, v8, v9))
  {
    uint64_t v12 = objc_msgSend_decodedLength(v3, v10, v11);
    BOOL v15 = v12 == objc_msgSend_decodedLength(v4, v13, v14);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

id BUEncodedBlockInfoCreate(uint64_t a1, uint64_t a2)
{
  if (a1 == a2)
  {
    id v3 = [BUEncodedBlockInfoInternal alloc];
    uint64_t v5 = objc_msgSend_initWithEncodedLength_(v3, v4, a1);
  }
  else
  {
    uint64_t v7 = [BUEncodedBlockInfoWithDecodedLengthInternal alloc];
    uint64_t v5 = objc_msgSend_initWithEncodedLength_decodedLength_(v7, v8, a1, a2);
  }

  return v5;
}

void sub_21E1E2690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1E26C8(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v4 = MEMORY[0x223C22A70](*(void *)(a1 + 32));
    uint64_t v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_21E1E273C(uint64_t a1, uint64_t a2)
{
  close(*(_DWORD *)(a1 + 40));
  if (a2)
  {
    uint64_t v4 = BUZipLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_21E1F1C3C(a2);
    }
  }
  uint64_t v5 = MEMORY[0x223C22A70](*(void *)(a1 + 32));
  uint64_t v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
}

uint64_t sub_21E1E2A74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21E1E2A88(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = BUZipLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_21E1F1C3C(a2);
    }
  }
  uint64_t v5 = (void *)MEMORY[0x223C22A70](*(void *)(a1 + 40));
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_21E1E2B94;
      v10[3] = &unk_26449E118;
      uint64_t v11 = v5;
      int v12 = a2;
      dispatch_async((dispatch_queue_t)v7, v10);
    }
    else
    {
      id v8 = (void (*)(void *, uint64_t))v5[2];
      id v9 = 0;
      v8(v6, a2);
    }
  }
}

uint64_t sub_21E1E2B94(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void sub_21E1E2D00(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = a3;
  if (a4)
  {
    uint64_t v7 = objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(MEMORY[0x263F087E8], v6, a4, 0);
  }
  else
  {
    uint64_t v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21E1E2E80(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v8 = a3;
  if (a4)
  {
    uint64_t v7 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v6, *MEMORY[0x263F08438], a4, 0);
  }
  else
  {
    uint64_t v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21E1E3008(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v8 = a3;
  if (a4)
  {
    uint64_t v7 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v6, *MEMORY[0x263F08438], a4, 0);
  }
  else
  {
    uint64_t v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_21E1E3270(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_channel(*(void **)(a1 + 32), a2, a3);
  dispatch_fd_t descriptor = dispatch_io_get_descriptor(v4);

  if (descriptor != -1 && fsync(descriptor) == -1)
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = __error();
    objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(v6, v8, *v7, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v9 = MEMORY[0x223C22A70](*(void *)(a1 + 40));
  long long v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v11);
  }
}

void sub_21E1E33F8(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_channel(*(void **)(a1 + 32), a2, a3);
  dispatch_fd_t descriptor = dispatch_io_get_descriptor(v4);

  if (descriptor != -1 && ftruncate(descriptor, *(void *)(a1 + 48)) == -1)
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = __error();
    objc_msgSend_bu_fileReadPOSIXErrorWithNumber_userInfo_(v6, v8, *v7, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v9 = MEMORY[0x223C22A70](*(void *)(a1 + 40));
  long long v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v11);
  }
}

unint64_t BUStoreIdFromObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  uint64_t v5 = BUDynamicCast(v2, v1);
  if (v5)
  {
    unint64_t v6 = objc_msgSend_unsignedLongLongValue(v1, v3, v4);
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    id v8 = BUDynamicCast(v7, v1);
    uint64_t v9 = v8;
    if (v8 && (v10 = v8, (id v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12)) != 0)) {
      unint64_t v6 = strtoull(v13, 0, 10);
    }
    else {
      unint64_t v6 = 0;
    }
  }
  return v6;
}

BOOL BUIsStoreBookAssetID(void *a1)
{
  return BUStoreIdFromObject(a1) != 0;
}

void sub_21E1E39A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1E39E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E1E39F8(uint64_t a1)
{
}

void sub_21E1E3A00(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  int v11 = *(unsigned __int8 *)(v10 + 24);
  if (v9 && *(unsigned char *)(v10 + 24))
  {
    *(unsigned char *)(v10 + 24) = 0;
    objc_msgSend_handleFailureWithHandler_error_(*(void **)(a1 + 32), v8, *(void *)(a1 + 40), v9);
    int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (v11 && (uint64_t v12 = *(NSObject **)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) != 0)
  {
    if (v7)
    {
      dispatch_data_t concat = dispatch_data_create_concat(v12, v7);
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      BOOL v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = concat;

      uint64_t v12 = *(NSObject **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    long long v16 = v12;

    size_t size = dispatch_data_get_size(v16);
    if ((a2 & 1) != 0 || size >= 0x1E)
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      long long v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = 0;

      size_t v26 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend_readFileHeaderFromData_headerLength_(*(void **)(a1 + 32), v20, (uint64_t)v16, &v26);
      size_t v21 = v26;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v26 != *(void *)(a1 + 80);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          objc_msgSend_readWithFileHeaderLength_handler_(*(void **)(a1 + 32), v8, v21, *(void *)(a1 + 40));
        }
        else
        {
          size_t v22 = dispatch_data_get_size(v16);
          if (v22 >= v21)
          {
            dispatch_data_t subrange = dispatch_data_create_subrange(v16, v21, v22 - v21);

            long long v16 = subrange;
          }
          else
          {
            BUZipLog();
            long long v23 = (char *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
              sub_21E1F1CB8((void **)(a1 + 32), v23, v24);
            }

            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          }
        }
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        objc_msgSend_handleFailureWithHandler_error_(*(void **)(a1 + 32), v8, *(void *)(a1 + 40), 0);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else
  {
    long long v16 = v7;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend_processData_CRC_isDone_handler_(*(void **)(a1 + 32), v8, (uint64_t)v16, *(void *)(*(void *)(a1 + 72) + 8) + 24, a2, *(void *)(a1 + 40));
  }
}

void sub_21E1E3E70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  uint64_t v17 = 0;
  if (v7
    || !objc_msgSend_readFileHeaderFromData_headerLength_(*(void **)(a1 + 32), v6, (uint64_t)v5, &v17))
  {
    objc_msgSend_handleFailureWithHandler_error_(*(void **)(a1 + 32), v6, *(void *)(a1 + 40), v7);
  }
  else
  {
    id v9 = objc_msgSend_archiveReadChannel(*(void **)(a1 + 32), v6, v8);
    uint64_t v12 = objc_msgSend_entry(*(void **)(a1 + 32), v10, v11);
    uint64_t v15 = objc_msgSend_offset(v12, v13, v14);
    objc_msgSend_readFromOffset_length_handler_(v9, v16, v17 + *(void *)(a1 + 48) + v15, *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
}

void sub_21E1E4214(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21E1E4240(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v11 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(unsigned __int8 *)(v9 + 24);
  if (v8 && *(unsigned char *)(v9 + 24))
  {
    *(unsigned char *)(v9 + 24) = 0;
    objc_msgSend_handleFailureWithHandler_error_(*(void **)(a1 + 32), v7, *(void *)(a1 + 40), v8);
    int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (v10) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend_processData_CRC_isDone_handler_(*(void **)(a1 + 32), v7, (uint64_t)v11, *(void *)(*(void *)(a1 + 56) + 8) + 24, a2, *(void *)(a1 + 40));
  }
}

uint64_t sub_21E1E443C(uint64_t a1, int a2, int a3, Bytef *buf, unint64_t a5)
{
  uLong v6 = **(unsigned int **)(a1 + 32);
  if (a5 >= 0xFFFFFFFF) {
    uInt v7 = -1;
  }
  else {
    uInt v7 = a5;
  }
  **(_DWORD **)(a1 + 32) = crc32(v6, buf, v7);
  return 1;
}

uint64_t sub_21E1E4640()
{
  os_log_t v0 = os_log_create("com.apple.iBooks", "BookUtility");
  uint64_t v1 = qword_26AB405A0;
  qword_26AB405A0 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id BUCoalescingCallBlockLog()
{
  if (qword_26AB40598 != -1) {
    dispatch_once(&qword_26AB40598, &unk_26CF10B58);
  }
  os_log_t v0 = (void *)qword_26AB40590;

  return v0;
}

uint64_t sub_21E1E46D8()
{
  os_log_t v0 = os_log_create("com.apple.iBooks", "BookUtility.CoalescingCallBlock");
  uint64_t v1 = qword_26AB40590;
  qword_26AB40590 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

id BUZipLog()
{
  if (qword_267D29918 != -1) {
    dispatch_once(&qword_267D29918, &unk_26CF10B78);
  }
  os_log_t v0 = (void *)qword_267D29910;

  return v0;
}

uint64_t sub_21E1E4770()
{
  os_log_t v0 = os_log_create("com.apple.iBooks", "BookUtility.Zip");
  uint64_t v1 = qword_267D29910;
  qword_267D29910 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t sub_21E1E47B4()
{
  os_log_t v0 = os_log_create("com.apple.iBooks", "BookUtility.Assertion");
  uint64_t v1 = qword_26AB404B8;
  qword_26AB404B8 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_21E1E49C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1E49E0(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__unregisterNotificationForAccountType_, 1);
}

uint64_t sub_21E1E49EC(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__unregisterNotificationForAccountType_, 2);
}

uint64_t sub_21E1E49F8(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 24);
  return result;
}

void sub_21E1E4C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1E4C84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E1E4C94(uint64_t a1)
{
}

uint64_t sub_21E1E4C9C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_l_primaryAppleAccount(*(void **)(a1 + 32), a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return MEMORY[0x270F9A758](v4, v6);
}

void sub_21E1E4E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1E4E18(uint64_t a1, const char *a2)
{
  objc_msgSend__registerNotificationForAccountTypeIfNeeded_(*(void **)(a1 + 32), a2, 1);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v4)
  {
    uint64_t v5 = objc_msgSend_bu_sharedAccountStore(MEMORY[0x263EFB210], 0, v3);
    uint64_t v8 = objc_msgSend_ams_localiTunesAccount(v5, v6, v7);
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = v8;

    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  id v11 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v11, v4);
}

void sub_21E1E4FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1E4FD4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4[9])
  {
    if (objc_msgSend_hasCloudKitEntitlement(v4, a2, a3)) {
      goto LABEL_5;
    }
    uint64_t v4 = *(void **)(a1 + 32);
  }
  uint64_t v5 = objc_msgSend_l_primaryAppleAccount(v4, a2, a3);
  uint64_t v6 = NSNumber;
  uint64_t isManagedAppleID = objc_msgSend_aa_isManagedAppleID(v5, v7, v8);
  uint64_t v11 = objc_msgSend_numberWithBool_(v6, v10, isManagedAppleID);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 72);
  *(void *)(v12 + 72) = v11;

LABEL_5:
  uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t v15 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v15, v14);
}

void sub_21E1E51F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1E5208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)v4[10];
  if (!v5)
  {
    uint64_t v6 = objc_msgSend_l_activeStoreAccount(v4, 0, a3);
    uint64_t v7 = NSNumber;
    uint64_t isManagedAppleID = objc_msgSend_ams_isManagedAppleID(v6, v8, v9);
    uint64_t v12 = objc_msgSend_numberWithBool_(v7, v11, isManagedAppleID);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 80);
    *(void *)(v13 + 80) = v12;

    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 80);
  }
  uint64_t v15 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v15, v5);
}

uint64_t sub_21E1E5820(uint64_t a1, const char *a2)
{
  return objc_msgSend__registerNotificationForAccountTypeIfNeeded_(*(void **)(a1 + 32), a2, 2);
}

void sub_21E1E582C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = BookUtilityLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_21E1F2020();
    }
  }
  else
  {
    uint64_t v8 = *(NSObject **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_21E1E5930;
    v9[3] = &unk_26449E258;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    id v10 = v5;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v11);
  }
}

void sub_21E1E5930(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = objc_msgSend_recordName(*(void **)(a1 + 32), v2, v3);
  uint64_t v7 = objc_msgSend_copy(v4, v5, v6);
  objc_msgSend_nq_setupNotifyBlockForAccountType_currentAccountIdentifier_(WeakRetained, v8, 2, v7);
}

void sub_21E1E5B14(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_21E1E5B2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_nq_teardownNotifyBlockForAccountType_(WeakRetained, v1, 1);
}

void sub_21E1E5B70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_nq_teardownNotifyBlockForAccountType_(WeakRetained, v1, 2);
}

void sub_21E1E5C80(uint64_t a1)
{
  if (!notify_is_valid_token(*(_DWORD *)(*(void *)(a1 + 32) + 24)))
  {
    int out_token = -1;
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v4 = (const char *)objc_msgSend_UTF8String(@"com.apple.tcc.access.changed", v2, v3);
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_21E1E5D9C;
    handler[3] = &unk_26449DD38;
    objc_copyWeak(&v9, &location);
    uint32_t v6 = notify_register_dispatch(v4, &out_token, v5, handler);
    int v7 = out_token;
    if (v6) {
      int v7 = -1;
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 24) = v7;
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void sub_21E1E5D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E1E5D9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = BookUtilityLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_21E1C7000, v2, OS_LOG_TYPE_DEFAULT, "Received TCC access change notification, reset iCloud and Store Account caches", v7, 2u);
    }

    objc_msgSend_nq_resetAppleAccountCachedValues(WeakRetained, v3, v4);
    objc_msgSend_nq_resetStoreAccountCachedValues(WeakRetained, v5, v6);
  }
}

uint64_t sub_21E1E5E9C(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_nq_resetAppleAccountCachedValues(*(void **)(a1 + 32), a2, a3);
}

void sub_21E1E5EE8()
{
  os_log_t v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (v0)
  {
    uint64_t v1 = v0;
    CFErrorRef error = 0;
    uint64_t v3 = (void *)SecTaskCopyValueForEntitlement(v0, @"com.apple.developer.icloud-services", &error);
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v5 = BookUtilityLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_21E1F2108();
      }
    }
    else
    {
      byte_26AB404F8 = objc_msgSend_containsObject_(v3, v2, @"CloudKit");
    }
    CFRelease(v1);
  }
  else
  {
    uint64_t v4 = BookUtilityLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_21E1F20D4();
    }
  }
}

uint64_t sub_21E1E6078(uint64_t a1, const char *a2)
{
  objc_msgSend_setActiveStoreAccount_(*(void **)(a1 + 32), a2, 0);
  objc_msgSend_setLocalStoreAccount_(*(void **)(a1 + 32), v3, 0);
  uint64_t v4 = *(void *)(a1 + 32);

  return MEMORY[0x270F9A6D0](v4, sel_setCachedIsStoreAccountManagedAppleID_, 0);
}

uint64_t sub_21E1E6158(uint64_t a1)
{
  uint64_t v2 = BookUtilityLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21E1C7000, v2, OS_LOG_TYPE_DEFAULT, "[PrimaryAppleAccount] setting primaryAppleAccount to nil", v6, 2u);
  }

  objc_msgSend_setPrimaryAppleAccount_(*(void **)(a1 + 32), v3, 0);
  return objc_msgSend_setCachedIsPrimaryAccountManagedAppleID_(*(void **)(a1 + 32), v4, 0);
}

void sub_21E1E62E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1E62F8(void *a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1[4] + 104);
  uint64_t v4 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a1[7]);
  objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeObject_(v9, v6, a1[5]);
  *(void *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend_count(v9, v7, v8);
}

void sub_21E1E64B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1E64C8(void *a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1[4] + 104);
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, a1[6]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = objc_msgSend_objectForKeyedSubscript_(v3, v4, (uint64_t)v11);
  uint64_t v8 = objc_msgSend_allObjects(v5, v6, v7);
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void sub_21E1E6558(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend__didReceiveNotification_(WeakRetained, v4, (uint64_t)v3);
}

void sub_21E1E65B4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend__didReceiveNotification_(WeakRetained, v4, (uint64_t)v3);
}

void sub_21E1E6830(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    kdebug_trace();
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = (void **)(a1 + 32);
    uint64_t v6 = objc_msgSend__singleAccountTypeForNotification_(WeakRetained, v5, v4);
    uint64_t v7 = BookUtilityLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v8) {
        sub_21E1F2228(v3, (const char *)v7, v9);
      }

      uint64_t v12 = objc_msgSend_notifyBlocks(WeakRetained, v10, v11);
      uint64_t v14 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v13, v6);
      uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v12, v15, (uint64_t)v14);

      kdebug_trace();
      objc_msgSend_signalWithCompletion_(v7, v16, (uint64_t)&unk_26CF10C18);
      kdebug_trace();
    }
    else if (v8)
    {
      sub_21E1F21A0(v3, (const char *)v7, v9);
    }

    kdebug_trace();
  }
}

void sub_21E1E6994(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_21E1E6A68;
  v5[3] = &unk_26449E348;
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = *(id *)(a1 + 48);
  dispatch_async(v4, v5);
  v3[2](v3);
  objc_destroyWeak(v6);
}

void sub_21E1E6A54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1E6A68(uint64_t a1)
{
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_nq_updateAccountIdentifierAndNotifyObserversForAccountType_(WeakRetained, v3, *(void *)(a1 + 40));

  return kdebug_trace();
}

void sub_21E1E6F90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21E1E6FB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_21E1E70A4;
  v10[3] = &unk_26449E398;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  void v10[4] = *(void *)(a1 + 40);
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v13);
}

void sub_21E1E70A4(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = objc_msgSend__observersForAccountType_(*(void **)(a1 + 32), v3, 2);
  if (*(void *)(a1 + 40))
  {
    id v6 = BookUtilityLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_21E1F22B0((uint64_t *)(a1 + 40), v6);
    }
LABEL_27:

    goto LABEL_28;
  }
  if (WeakRetained)
  {
    id v6 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v4, 2);
    id v9 = objc_msgSend_accountIdentifiers(WeakRetained, v7, v8);
    id v11 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v6);

    uint64_t v14 = objc_msgSend_recordName(*(void **)(a1 + 48), v12, v13);
    uint64_t v17 = objc_msgSend_copy(v14, v15, v16);

    if (objc_msgSend_isEqualToString_(v11, v18, (uint64_t)v17))
    {
      uint64_t v21 = 0;
    }
    else
    {
      if (objc_msgSend_length(v11, v19, v20) && objc_msgSend_length(v17, v22, v23))
      {
        uint64_t v21 = 102;
      }
      else if (objc_msgSend_length(v11, v22, v23) || !objc_msgSend_length(v17, v22, v23))
      {
        if (objc_msgSend_length(v11, v22, v23))
        {
          if (objc_msgSend_length(v17, v22, v23)) {
            uint64_t v21 = 0;
          }
          else {
            uint64_t v21 = 101;
          }
        }
        else
        {
          uint64_t v21 = 0;
        }
      }
      else
      {
        uint64_t v21 = 100;
      }
      uint64_t v24 = objc_msgSend_accountIdentifiers(WeakRetained, v22, v23);
      objc_msgSend_setObject_forKeyedSubscript_(v24, v25, (uint64_t)v17, v6);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v26 = v5;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v33, v37, 16);
    if (v28)
    {
      uint64_t v30 = v28;
      uint64_t v31 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(v26);
          }
          objc_msgSend_account_didChangeWithReason_(*(void **)(*((void *)&v33 + 1) + 8 * i), v29, 2, v21, (void)v33);
        }
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v33, v37, 16);
      }
      while (v30);
    }

    goto LABEL_27;
  }
LABEL_28:
}

void sub_21E1E75D4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_21E1E7718(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], a2, a3);
  objc_msgSend_registerObserver_(v4, v5, *(void *)(a1 + 32));

  uint64_t v8 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], v6, v7);
  BOOL v10 = objc_msgSend_effectiveBoolValueForSetting_(v8, v9, *MEMORY[0x263F537C8]) != 2;
  objc_msgSend_setIsBookStoreAllowed_(*(void **)(a1 + 32), v11, v10);

  uint64_t v14 = objc_msgSend_sharedConnection(MEMORY[0x263F53C50], v12, v13);
  BOOL v16 = objc_msgSend_effectiveBoolValueForSetting_(v14, v15, *MEMORY[0x263F537D0]) != 2;
  objc_msgSend_setIsExplicitContentAllowed_(*(void **)(a1 + 32), v17, v16);

  objc_msgSend_sharedConnection(MEMORY[0x263F53C50], v18, v19);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v21 = objc_msgSend_effectiveBoolValueForSetting_(v23, v20, *MEMORY[0x263F53710]) != 2;
  objc_msgSend_setIsAccountModificationAllowed_(*(void **)(a1 + 32), v22, v21);
}

uint64_t sub_21E1E7928(uint64_t a1, const char *a2)
{
  return objc_msgSend_addObject_(*(void **)(*(void *)(a1 + 32) + 32), a2, *(void *)(a1 + 40));
}

uint64_t sub_21E1E79E4(uint64_t a1, const char *a2)
{
  return objc_msgSend_removeObject_(*(void **)(*(void *)(a1 + 32) + 32), a2, *(void *)(a1 + 40));
}

void sub_21E1E7B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1E7B1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E1E7B2C(uint64_t a1)
{
}

void sub_21E1E7B34(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_observers(*(void **)(a1 + 32), a2, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_allObjects(v9, v4, v5);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t sub_21E1E7D2C(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_restrictionsForBookStoreAllowedChanged_, *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_21E1E7ECC(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_restrictionsForExplicitContentAllowedChanged_, *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_21E1E806C(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_restrictionsForAccountModificationAllowedChanged_, *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_21E1E8128(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 26);
  return result;
}

uint64_t sub_21E1E81E8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

uint64_t sub_21E1E82A8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 25);
  return result;
}

uint64_t sub_21E1E8458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__uq_updateRestrictionsIfNeeded, a3);
}

uint64_t sub_21E1E869C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_date(MEMORY[0x263EFF910], a2, a3);
  objc_msgSend_setLastBlockCallDate_(*(void **)(a1 + 32), v5, (uint64_t)v4);

  uint64_t v7 = *(void **)(a1 + 32);

  return objc_msgSend_setRunning_(v7, v6, 0);
}

uint64_t sub_21E1E8968(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__close(*(void **)(a1 + 32), a2, a3);
}

void sub_21E1E8D44(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = a3;
  id v8 = a4;
  if ((objc_msgSend_isStreamOutputDone(*(void **)(a1 + 32), v9, v10) & 1) == 0)
  {
    if (v8)
    {
      BUZipLog();
      id v12 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
        sub_21E1F232C(v8, v12, v13);
      }

      objc_msgSend_setStreamOutputDone_(*(void **)(a1 + 32), v14, 1);
    }
    else
    {
      if (v7)
      {
        uint64_t v15 = *(void **)(a1 + 32);
        size_t size = dispatch_data_get_size(v7);
        uint64_t v19 = objc_msgSend_streamOutputLength(v15, v17, v18);
        objc_msgSend_setStreamOutputLength_(v15, v20, v19 + size);
        long long v25 = objc_msgSend_currentStreamOutputData(*(void **)(a1 + 32), v21, v22);
        id v26 = *(void **)(a1 + 32);
        if (v25)
        {
          uint64_t v27 = objc_msgSend_currentStreamOutputData(v26, v23, v24);
          dispatch_data_t concat = dispatch_data_create_concat(v27, v7);
          objc_msgSend_setCurrentStreamOutputData_(*(void **)(a1 + 32), v29, (uint64_t)concat);
        }
        else
        {
          objc_msgSend_setCurrentStreamOutputData_(v26, v23, (uint64_t)v7);
        }
      }
      objc_msgSend_setStreamOutputDone_(*(void **)(a1 + 32), v11, a2);
    }
  }
}

void sub_21E1E8F58(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_sourceReadChannelError(*(void **)(a1 + 32), a2, a3);

  if (v4)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    objc_msgSend_sourceReadChannelError(*(void **)(a1 + 32), v5, v6);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void, id))(v7 + 16))(v7, 1, 0, v14);
  }
  else
  {
    id v8 = objc_msgSend_readQueue(*(void **)(a1 + 32), v5, v6);
    dispatch_suspend(v8);

    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    objc_msgSend__readFromOffset_length_handler_(v12, v9, v10, v11, v13);
  }
}

void sub_21E1E9208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E1E9220(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v7 = a3;
  uint64_t v8 = a4;
  uint64_t v11 = objc_msgSend_sourceReadChannelError(*(void **)(a1 + 32), v9, v10);

  if (v11) {
    goto LABEL_22;
  }
  uint64_t v14 = objc_msgSend_streamReadChannelSourceHandler(*(void **)(a1 + 32), v12, v13);

  if (!(v8 | v14))
  {
    uint64_t v8 = objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(MEMORY[0x263F087E8], v15, 0);
  }
  if (v8)
  {
    BUZipLog();
    uint64_t v17 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      sub_21E1F23C8((void *)v8, v17, v18);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    objc_msgSend_setSourceReadChannelError_(*(void **)(a1 + 32), v19, v8);
    uint64_t v22 = objc_msgSend_readQueue(*(void **)(a1 + 32), v20, v21);
    dispatch_resume(v22);

    goto LABEL_22;
  }
  if (v7) {
    size_t size = dispatch_data_get_size(v7);
  }
  else {
    size_t size = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += size;
  if (a2)
  {
    BOOL v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) < *(void *)(a1 + 56);
    if (v7) {
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v24 = 0;
    if (v7)
    {
LABEL_16:
      objc_msgSend_streamReadChannelSourceHandler(*(void **)(a1 + 32), v15, v16);
      long long v25 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, BOOL, NSObject *, void))v25)[2](v25, v24, v7, 0);

      goto LABEL_17;
    }
  }
  if (v24) {
    goto LABEL_16;
  }
LABEL_17:
  if (a2)
  {
    id v26 = *(void **)(a1 + 32);
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v28 = objc_msgSend_sourceOffset(v26, v15, v16);
    objc_msgSend_setSourceOffset_(v26, v29, *(void *)(v27 + 24) + v28);
    if (objc_msgSend_sourceLength(*(void **)(a1 + 32), v30, v31) != -1)
    {
      long long v34 = *(void **)(a1 + 32);
      uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v36 = objc_msgSend_sourceLength(v34, v32, v33);
      objc_msgSend_setSourceLength_(v34, v37, v36 - *(void *)(v35 + 24));
    }
    objc_msgSend__readFromOffset_length_handler_(*(void **)(a1 + 32), v32, *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 40));
  }
  uint64_t v8 = 0;
LABEL_22:
}

void sub_21E1E968C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_21E1E9990(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    uint64_t shouldCopyItemToURL = objc_msgSend_shouldCopyItemToURL_(*(void **)(a1 + 32), v5, (uint64_t)v4);
  }
  else {
    uint64_t shouldCopyItemToURL = 1;
  }

  return shouldCopyItemToURL;
}

void sub_21E1E99EC(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = objc_msgSend_size(v11, v6, v7);
    objc_msgSend_didCopyItemToURL_fileSize_(v8, v10, (uint64_t)v5, v9);
  }
}

void sub_21E1E9D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1E9D38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E1E9D48(uint64_t a1)
{
}

void sub_21E1E9D50(uint64_t a1, int a2, void *a3, void *a4)
{
  data2 = a3;
  id v7 = a4;
  if (data2)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(NSObject **)(v8 + 40);
    if (v9)
    {
      dispatch_data_t concat = dispatch_data_create_concat(v9, data2);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = concat;
    }
    else
    {
      uint64_t v13 = data2;
      id v12 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v13;
    }
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v16 = *(void *)(v14 + 40);
  uint64_t v15 = (id *)(v14 + 40);
  if (v16)
  {
    if (!a2) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  objc_storeStrong(v15, a4);
  if (a2) {
LABEL_8:
  }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_9:
}

void sub_21E1EA34C()
{
}

void sub_21E1EA3F4()
{
}

void sub_21E1EAD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_21E1EADA4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v8 = a3;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    goto LABEL_3;
  }
  if (!v5) {
    goto LABEL_3;
  }
  uint64_t v9 = (void **)(a1 + 32);
  if (objc_msgSend_isSymLink(*(void **)(a1 + 32), v6, v7))
  {
    id v50 = 0;
    uint64_t v11 = objc_msgSend_stringWithContentsOfURL_encoding_error_(NSString, v10, (uint64_t)v5, 4, &v50);
    id v12 = v50;
    if (!objc_msgSend_length(v11, v13, v14))
    {
      uint64_t v39 = BUZipLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_21E1F2928();
      }

      uint64_t v40 = *(void *)(*(void *)(a1 + 56) + 8);
      id v29 = v12;
      uint64_t v17 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v29;
      goto LABEL_24;
    }
    uint64_t v17 = objc_msgSend_URLByDeletingLastPathComponent(*(void **)(a1 + 40), v15, v16);
    uint64_t v19 = objc_msgSend_fileURLWithPath_relativeToURL_(NSURL, v18, (uint64_t)v11, v17);
    uint64_t v22 = v19;
    if (*(unsigned char *)(a1 + 72) || objc_msgSend_bu_isContainedWithinFileURL_(v19, v20, *(void *)(a1 + 48)))
    {
      id v23 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v20, v21, v22);
      id v26 = objc_msgSend_path(*(void **)(a1 + 40), v24, v25);
      id v49 = v12;
      char v28 = objc_msgSend_createSymbolicLinkAtPath_withDestinationPath_error_(v23, v27, (uint64_t)v26, v11, &v49);
      id v29 = v49;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v28;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        uint64_t v22 = v47;
LABEL_23:

LABEL_24:
        goto LABEL_3;
      }
      uint64_t v41 = BUZipLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = objc_msgSend_path(*(void **)(a1 + 40), v42, v43);
        *(_DWORD *)buf = 138412802;
        id v52 = v46;
        __int16 v53 = 2112;
        dispatch_time_t v54 = v11;
        __int16 v55 = 2112;
        id v56 = v29;
        _os_log_error_impl(&dword_21E1C7000, v41, OS_LOG_TYPE_ERROR, "Error creating symlink at %@ with destination %@: %@", buf, 0x20u);
      }
      uint64_t v44 = *(void *)(*(void *)(a1 + 56) + 8);
      id v12 = v29;
      uint64_t v45 = *(NSObject **)(v44 + 40);
      *(void *)(v44 + 40) = v12;
      uint64_t v22 = v47;
    }
    else
    {
      uint64_t v45 = BUZipLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_21E1F2990(v9, (const char *)v11, (uint64_t)v45);
      }
    }

    id v29 = v12;
    goto LABEL_23;
  }
  uint64_t v30 = BUZipLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    id v52 = v5;
    __int16 v53 = 2112;
    dispatch_time_t v54 = v31;
    _os_log_impl(&dword_21E1C7000, v30, OS_LOG_TYPE_DEFAULT, "Moving temporary %@ to requested URL: %@", buf, 0x16u);
  }

  long long v34 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v32, v33);
  uint64_t v35 = *(void *)(a1 + 40);
  uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v36 + 40);
  char v38 = objc_msgSend_moveItemAtURL_toURL_error_(v34, v37, (uint64_t)v5, v35, &obj);
  objc_storeStrong((id *)(v36 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v38;

LABEL_3:
}

void sub_21E1EB5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21E1EB5F4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  else if (v7)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_21E1EB700;
    v13[3] = &unk_26449DC08;
    long long v12 = *(_OWORD *)(a1 + 32);
    id v10 = (id)v12;
    long long v14 = v12;
    objc_msgSend_writeData_handler_(v9, v11, (uint64_t)v7, v13);
  }
  if (a2) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_21E1EB700(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8 = a3;
  id v7 = a4;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  if (a2) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_21E1EB79C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_21E1EB7D4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t BUBundle()
{
  uint64_t v0 = MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();

  return MEMORY[0x270F9A6D0](v0, sel_bundleForClass_, v1);
}

void sub_21E1EBEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1EBEDC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E1EBEEC(uint64_t a1)
{
}

void sub_21E1EBEF4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_21E1EC1B4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = objc_msgSend_count(a1, v8, v9);
  uint64_t v12 = v10;
  if (v10 < 1)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = v10;
    do
    {
      uint64_t v15 = v14 - v13;
      if (v14 < v13) {
        ++v15;
      }
      uint64_t v16 = v13 + (v15 >> 1);
      uint64_t v17 = objc_msgSend_objectAtIndex_(a1, v11, v16);
      uint64_t v19 = objc_msgSend_valueForKeyPath_(v17, v18, (uint64_t)v7);

      if (objc_msgSend_compare_(v19, v20, (uint64_t)v6) == -1) {
        uint64_t v13 = v16 + 1;
      }
      else {
        uint64_t v14 = v16;
      }
    }
    while (v13 < v14);
  }
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13 < v12)
  {
    uint64_t v22 = objc_msgSend_objectAtIndex_(a1, v11, v13);
    BOOL v24 = objc_msgSend_valueForKeyPath_(v22, v23, (uint64_t)v7);
    uint64_t v26 = objc_msgSend_compare_(v24, v25, (uint64_t)v6);

    if (!v26) {
      uint64_t v21 = v13;
    }
  }

  return v21;
}

id sub_21E1EC2DC(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263EFF980];
  uint64_t v5 = objc_msgSend_count(a1, a2, a3);
  id v7 = objc_msgSend_arrayWithCapacity_(v4, v6, v5);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = objc_msgSend_reverseObjectEnumerator(a1, v8, v9, 0);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v18, v22, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend_addObject_(v7, v13, *(void *)(*((void *)&v18 + 1) + 8 * i));
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v18, v22, 16);
    }
    while (v14);
  }

  return v7;
}

uint64_t sub_21E1EC408(void *a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend_caseInsensitiveCompare_(*(void **)(*((void *)&v12 + 1) + 8 * i), v7, (uint64_t)v4, (void)v12))
        {
          uint64_t v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v12, v16, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

uint64_t sub_21E1EC514(void *a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend_localizedCaseInsensitiveCompare_(*(void **)(*((void *)&v12 + 1) + 8 * i), v7, (uint64_t)v4, (void)v12))
        {
          uint64_t v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v12, v16, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

id sub_21E1EC620(void *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v7 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = (id)objc_msgSend_copy(a1, v8, v9);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v20, v24, 16);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v21 != v14) {
        objc_enumerationMutation(v10);
      }
      uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
      char v19 = 0;
      if (v4[2](v4, v16, &v19)) {
        objc_msgSend_addObject_(v7, v17, v16);
      }
      if (v19) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v17, (uint64_t)&v20, v24, 16);
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v7;
}

id sub_21E1EC78C(void *a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_indexesOfObjectsWithOptions_passingTest_(a1, a2, a3);
  uint64_t v6 = objc_msgSend_objectsAtIndexes_(a1, v5, (uint64_t)v4);

  return v6;
}

id sub_21E1EC7E4(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_21E1EC87C;
  v4[3] = &unk_26449E550;
  v4[4] = a1;
  uint64_t v1 = (void *)MEMORY[0x223C22A70](v4);
  uint64_t v2 = (void *)MEMORY[0x223C22A70]();

  return v2;
}

uint64_t sub_21E1EC87C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = objc_msgSend_compareObject_toObject_(*(void **)(*((void *)&v17 + 1) + 8 * v13), v10, (uint64_t)v5, v6, (void)v17);
        if (v14)
        {
          uint64_t v15 = v14;
          goto LABEL_11;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_11:

  return v15;
}

id sub_21E1EC9AC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v8 = objc_msgSend_count(a1, v6, v7);
  if (v8)
  {
    uint64_t v11 = v8;
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v13 = objc_msgSend_objectAtIndex_(a1, v9, i);
      uint64_t v16 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15);

      if (v13 == v16)
      {
        uint64_t v18 = MEMORY[0x223C22A70](v4);
        long long v19 = (void *)v18;
        if (v18) {
          (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, i);
        }
      }
      else
      {
        objc_msgSend_addObject_(v5, v17, (uint64_t)v13);
      }
    }
  }
  long long v20 = objc_msgSend_copy(v5, v9, v10);

  return v20;
}

uint64_t sub_21E1ECAB4(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](a1, sel_bu_arrayByRemovingNSNullsInvokingBlockForNulls_, 0);
}

id sub_21E1ECABC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_opt_new();
    uint64_t v8 = objc_msgSend_count(a1, v6, v7);
    if (v8)
    {
      uint64_t v11 = v8;
      uint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = objc_msgSend_objectAtIndex_(a1, v9, v12);
        uint64_t v14 = v4[2](v4, v13);
        if (!v14) {
          break;
        }
        uint64_t v16 = (void *)v14;
        objc_msgSend_addObject_(v5, v15, v14);

        if (v11 == ++v12) {
          goto LABEL_9;
        }
      }
    }
LABEL_9:
    uint64_t v18 = objc_msgSend_count(v5, v9, v10);
    if (v18 == objc_msgSend_count(a1, v19, v20)) {
      long long v17 = objc_msgSend_copy(v5, v21, v22);
    }
    else {
      long long v17 = 0;
    }
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

id sub_21E1ECBD4(uint64_t a1, const char *a2)
{
  uint64_t v2 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], a2, a1);
  id v5 = objc_msgSend_allObjects(v2, v3, v4);

  return v5;
}

id sub_21E1ECC2C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = a1;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v20, v24, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_valueForKey_(v14, v10, (uint64_t)v4, (void)v20);
        if ((objc_msgSend_containsObject_(v6, v16, (uint64_t)v15) & 1) == 0)
        {
          objc_msgSend_addObject_(v6, v17, (uint64_t)v15);
          objc_msgSend_addObject_(v5, v18, (uint64_t)v14);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v20, v24, 16);
    }
    while (v11);
  }

  return v5;
}

id sub_21E1ECDA8(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  if (objc_msgSend_count(v4, v6, v7))
  {
    uint64_t v10 = objc_msgSend_mutableCopy(v5, v8, v9);
    objc_msgSend_removeObjectsInArray_(v10, v11, (uint64_t)v4);
    uint64_t v14 = objc_msgSend_copy(v10, v12, v13);

    id v5 = (id)v14;
  }

  return v5;
}

id sub_21E1ECE30(void *a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = a1;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v27, v31, 16);
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_valueForKey_(v12, v8, (uint64_t)v4);
        uint64_t v14 = objc_opt_class();
        long long v21 = BUClassAndProtocolCast(v13, v14, 1, v15, v16, v17, v18, v19, (uint64_t)&unk_26CF204F8);
        if (v21) {
          objc_msgSend_setObject_forKeyedSubscript_(v5, v20, (uint64_t)v12, v21);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v27, v31, 16);
    }
    while (v9);
  }

  BOOL v24 = objc_msgSend_copy(v5, v22, v23);

  return v24;
}

id sub_21E1ECFCC(void *a1)
{
  id v2 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = objc_msgSend_initWithString_(v2, v3, @"[");
  id v6 = objc_msgSend_componentsJoinedByString_(a1, v5, @",");
  objc_msgSend_appendString_(v4, v7, (uint64_t)v6);

  objc_msgSend_appendString_(v4, v8, @"]");
  uint64_t v11 = objc_msgSend_copy(v4, v9, v10);

  return v11;
}

void sub_21E1ED064(id a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = a4;
  __int16 v67 = a5;
  if (v8 != a1 && v8)
  {
    unint64_t v69 = objc_msgSend_count(v8, v10, v11);
    v66 = objc_msgSend_orderedSetWithArray_(MEMORY[0x263EFF9D8], v12, (uint64_t)v8);
    id v13 = a1;
    uint64_t v15 = objc_msgSend_orderedSetWithArray_(MEMORY[0x263EFF9B0], v14, (uint64_t)v13);
    uint64_t v70 = v13;
    uint64_t v17 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v16, (uint64_t)v13);
    int v65 = v8;
    uint64_t v19 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v18, (uint64_t)v8);
    v68 = objc_msgSend_setWithSet_(MEMORY[0x263EFF9C0], v20, v19);
    objc_msgSend_minusSet_(v68, v21, v17);
    id v64 = (void *)v17;
    uint64_t v23 = objc_msgSend_setWithSet_(MEMORY[0x263EFF9C0], v22, v17);
    id v63 = (void *)v19;
    objc_msgSend_minusSet_(v23, v24, v19);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v25 = v23;
    uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v71, v75, 16);
    if (v27)
    {
      uint64_t v29 = v27;
      uint64_t v30 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v72 != v30) {
            objc_enumerationMutation(v25);
          }
          uint64_t v32 = *(void *)(*((void *)&v71 + 1) + 8 * i);
          uint64_t v33 = objc_msgSend_indexOfObject_(v15, v28, v32);
          if (v33 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v34 = v33;
            objc_msgSend_removeObjectAtIndex_(v70, v28, v33);
            objc_msgSend_removeObjectAtIndex_(v15, v35, v34);
            if (v9) {
              v9[2](v9, v32, v34);
            }
          }
        }
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v71, v75, 16);
      }
      while (v29);
    }

    uint64_t v36 = v70;
    if (objc_msgSend_count(v70, v37, v38))
    {
      unint64_t v40 = 0;
      unint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        uint64_t v42 = objc_msgSend_objectAtIndex_(v70, v39, v40);
        unint64_t v44 = objc_msgSend_indexOfObject_(v66, v43, (uint64_t)v42);
        if (v41 == 0x7FFFFFFFFFFFFFFFLL || v44 > v41)
        {
          ++v40;
          unint64_t v41 = v44;
        }
        else
        {
          objc_msgSend_removeObjectAtIndex_(v70, v45, v40);
          objc_msgSend_removeObjectAtIndex_(v15, v46, v40);
          if (v9) {
            v9[2](v9, (uint64_t)v42, v40);
          }
          objc_msgSend_addObject_(v68, v47, (uint64_t)v42);
        }
      }
      while (v40 < objc_msgSend_count(v70, v48, v49));
    }
    id v8 = v65;
    if (v69)
    {
      uint64_t v50 = 0;
      uint64_t v51 = 1;
      do
      {
        id v52 = objc_msgSend_objectAtIndex_(v65, v39, v50);
        if (objc_msgSend_containsObject_(v68, v53, (uint64_t)v52))
        {
          unint64_t v56 = v51;
          while (v56 < v69)
          {
            uint64_t v57 = objc_msgSend_objectAtIndex_(v65, v54, v56);
            uint64_t v59 = objc_msgSend_indexOfObject_(v15, v58, (uint64_t)v57);

            ++v56;
            if (v59 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v36 = v70;
              objc_msgSend_insertObject_atIndex_(v70, v54, (uint64_t)v52, v59);
              objc_msgSend_insertObject_atIndex_(v15, v60, (uint64_t)v52, v59);
              goto LABEL_30;
            }
          }
          uint64_t v36 = v70;
          uint64_t v59 = objc_msgSend_count(v70, v54, v55);
          objc_msgSend_addObject_(v70, v61, (uint64_t)v52);
          objc_msgSend_addObject_(v15, v62, (uint64_t)v52);
LABEL_30:
          if (v67) {
            v67[2](v67, v52, v59);
          }
        }

        ++v50;
        ++v51;
      }
      while (v50 != v69);
    }
  }
}

void sub_21E1ED854(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

BOOL sub_21E1ED898(void *a1, int a2, int a3, void *__src, size_t a5)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 24) >= a5) {
    size_t v6 = a5;
  }
  else {
    size_t v6 = *(void *)(*(void *)(a1[5] + 8) + 24);
  }
  memcpy(*(void **)(*(void *)(a1[6] + 8) + 24), __src, v6);
  *(void *)(*(void *)(a1[5] + 8) + 24) -= v6;
  *(void *)(*(void *)(a1[6] + 8) + 24) += v6;
  uint64_t v7 = (void *)a1[4];
  uint64_t v10 = objc_msgSend_offset(v7, v8, v9);
  objc_msgSend_setOffset_(v7, v11, v10 + v6);
  return *(void *)(*(void *)(a1[5] + 8) + 24) != 0;
}

uint64_t sub_21E1ED93C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21E1ED94C(uint64_t a1)
{
}

void sub_21E1ED954(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7 || v8)
  {
    if (v8) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
    }
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    void v19[2] = sub_21E1EDB2C;
    v19[3] = &unk_26449E5A0;
    long long v20 = *(_OWORD *)(a1 + 48);
    v19[4] = *(void *)(a1 + 32);
    long long v21 = &v22;
    dispatch_data_apply(v7, v19);
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      size_t size = dispatch_data_get_size(v7);
      if (size > v23[3])
      {
        size_t v13 = size;
        uint64_t v14 = objc_msgSend_leftoverData(*(void **)(a1 + 32), v11, v12);
        dispatch_data_t subrange = dispatch_data_create_subrange(v7, v23[3], v13 - v23[3]);
        dispatch_data_t concat = dispatch_data_create_concat(v14, subrange);
        objc_msgSend_setLeftoverData_(*(void **)(a1 + 32), v17, (uint64_t)concat);
      }
    }
    _Block_object_dispose(&v22, 8);
  }
  char v18 = a2 ^ 1;
  if (v9) {
    char v18 = 0;
  }
  if ((v18 & 1) == 0 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
}

void sub_21E1EDB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_21E1EDB2C(void *a1, int a2, uint64_t a3, void *__src, size_t a5)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 24) >= a5) {
    size_t v7 = a5;
  }
  else {
    size_t v7 = *(void *)(*(void *)(a1[5] + 8) + 24);
  }
  memcpy(*(void **)(*(void *)(a1[6] + 8) + 24), __src, v7);
  *(void *)(*(void *)(a1[5] + 8) + 24) -= v7;
  *(void *)(*(void *)(a1[6] + 8) + 24) += v7;
  id v8 = (void *)a1[4];
  uint64_t v11 = objc_msgSend_offset(v8, v9, v10);
  objc_msgSend_setOffset_(v8, v12, v11 + v7);
  *(void *)(*(void *)(a1[7] + 8) + 24) = v7 + a3;
  return *(void *)(*(void *)(a1[5] + 8) + 24) != 0;
}

void sub_21E1EE08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21E1EE0D0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v13 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  int v11 = *(unsigned __int8 *)(v10 + 24);
  if (v9 && *(unsigned char *)(v10 + 24))
  {
    *(unsigned char *)(v10 + 24) = 0;
    objc_msgSend_handleFailureWithHandler_error_(*(void **)(a1 + 32), v7, *(void *)(a1 + 40), v9);
    int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (v11)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    if (!*(_DWORD *)(v12 + 24))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        objc_msgSend_prepareBuffer(*(void **)(a1 + 32), v7, v8);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend_processData_inflateResult_CRC_isDone_handler_(*(void **)(a1 + 32), v7, (uint64_t)v13, v12 + 24, *(void *)(*(void *)(a1 + 72) + 8) + 24, a2, *(void *)(a1 + 40));
    }
  }
}

void sub_21E1EE3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21E1EE3CC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  id v8 = a2;
  if (HIDWORD(a5))
  {
    id v9 = BUZipLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21E1F2C14(a5, v9);
    }
LABEL_4:

LABEL_31:
    uint64_t v12 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_32;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v10 + 40)) {
    goto LABEL_31;
  }
  *(_DWORD *)(v10 + 16) = a5;
  *(void *)(*(void *)(a1 + 32) + 8) = a4;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = 1;
  if (*(_DWORD *)(v11 + 16))
  {
    id v13 = (int **)(a1 + 56);
    uint64_t v14 = (void *)*MEMORY[0x263EF8378];
    while (1)
    {
      if (**v13)
      {
LABEL_30:
        uint64_t v12 = 1;
        goto LABEL_32;
      }
      int v15 = inflate((z_streamp)(v11 + 8), 0);
      **id v13 = v15;
      if ((v15 + 5) > 6 || ((1 << (v15 + 5)) & 0x61) == 0) {
        break;
      }
      int v19 = v15;
      uint64_t v11 = *(void *)(a1 + 32);
      if (v19 == 1 || !*(_DWORD *)(v11 + 40))
      {
        size_t v20 = objc_msgSend_outBufferSize((void *)v11, v16, v17) - *(unsigned int *)(*(void *)(a1 + 32) + 40);
        if (objc_msgSend_validateCRC(*(void **)(a1 + 32), v21, v22))
        {
          uint64_t v25 = *(unsigned int **)(a1 + 64);
          if (v25)
          {
            if (v20 >= 0xFFFFFFFF) {
              uInt v26 = -1;
            }
            else {
              uInt v26 = v20;
            }
            **(_DWORD **)(a1 + 64) = crc32(*v25, *(const Bytef **)(*(void *)(a1 + 32) + 120), v26);
          }
        }
        uint64_t v27 = *(void **)(a1 + 32);
        long long v28 = (const void *)v27[15];
        size_t v29 = objc_msgSend_outBufferSize(v27, v23, v24);
        dispatch_data_t v30 = dispatch_data_create(v28, v29, 0, v14);
        if (objc_msgSend_outBufferSize(*(void **)(a1 + 32), v31, v32) == v20) {
          dispatch_data_t subrange = v30;
        }
        else {
          dispatch_data_t subrange = dispatch_data_create_subrange(v30, 0, v20);
        }
        dispatch_data_t v34 = subrange;
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        objc_msgSend_setOutBufferSize_(*(void **)(a1 + 32), v35, 0);
        *(void *)(*(void *)(a1 + 32) + 120) = 0;
        unint64_t v38 = objc_msgSend_remainingUncompressedSize(*(void **)(a1 + 32), v36, v37);
        uint64_t v40 = 0;
        unint64_t v41 = *(void **)(a1 + 32);
        if (v38 > v20) {
          uint64_t v40 = objc_msgSend_remainingUncompressedSize(*(void **)(a1 + 32), v39, 0) - v20;
        }
        objc_msgSend_setRemainingUncompressedSize_(v41, v39, v40);
        if (v19 != 1) {
          objc_msgSend_prepareBuffer(*(void **)(a1 + 32), v42, v43);
        }

        uint64_t v11 = *(void *)(a1 + 32);
      }
      if (!*(_DWORD *)(v11 + 16)) {
        goto LABEL_30;
      }
    }
    id v9 = BUZipLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21E1F2C8C((int **)(a1 + 56), v9);
    }
    goto LABEL_4;
  }
LABEL_32:

  return v12;
}

void sub_21E1EE7B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (objc_class *)NSDictionary;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v11 = (id)objc_msgSend_initWithObjectsAndKeys_(v5, v6, (uint64_t)v4, @"BUErrorExceptionUserInfoKey", 0);

  id v8 = objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v7, @"BUErrorException", @"NSError exception", v11);
  objc_msgSend_raise(v8, v9, v10);
}

id sub_21E1EE854(void *a1, const char *a2, uint64_t a3)
{
  id v3 = objc_msgSend_userInfo(a1, a2, a3);
  id v5 = objc_msgSend_objectForKey_(v3, v4, @"BUErrorExceptionUserInfoKey");

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

id sub_21E1EE8D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5))
  {
    size_t v7 = NSURL;
    id v8 = objc_msgSend_stringWithFormat_(NSString, v6, @"%@://%@", @"ibooks", @"assetid");
    uint64_t v10 = objc_msgSend_URLWithString_(v7, v9, (uint64_t)v8);

    uint64_t v12 = objc_msgSend_URLByAppendingPathComponent_(v10, v11, (uint64_t)v3);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id sub_21E1EE99C(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3 = objc_msgSend_books(BUAppGroup, a2, a3);
  id v6 = objc_msgSend_containerURL(v3, v4, v5);

  return v6;
}

id sub_21E1EE9F0()
{
  uint64_t v0 = objc_opt_class();
  id v3 = objc_msgSend_bu_booksGroupContainerURL(v0, v1, v2);
  uint64_t v5 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v3, v4, @"Documents", 1);

  return v5;
}

id sub_21E1EEA4C()
{
  if (qword_26AB40560 != -1) {
    dispatch_once(&qword_26AB40560, &unk_26CF10C38);
  }
  uint64_t v0 = (void *)qword_26AB40558;

  return v0;
}

void sub_21E1EEAA0()
{
  if (!qword_26AB40558)
  {
    uint64_t v0 = (void *)CPSharedResourcesDirectory();
    objc_msgSend_stringByAppendingPathComponent_(v0, v1, @"Media");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v2, (uint64_t)v5, 1);
    id v4 = (void *)qword_26AB40558;
    qword_26AB40558 = v3;
  }
}

id sub_21E1EEB30()
{
  if (qword_26AB40550 != -1) {
    dispatch_once(&qword_26AB40550, &unk_26CF10C58);
  }
  uint64_t v0 = (void *)qword_26AB40548;

  return v0;
}

void sub_21E1EEB84(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_bu_mediaURL(NSURL, a2, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v6, v3, @"Books", 1);
  id v5 = (void *)qword_26AB40548;
  qword_26AB40548 = v4;
}

uint64_t sub_21E1EEBEC(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_scheme(a1, a2, a3);
  size_t v7 = objc_msgSend_host(a1, v5, v6);
  if (objc_msgSend_length(v4, v8, v9) && !objc_msgSend_caseInsensitiveCompare_(v4, v10, @"ibooks"))
  {
    uint64_t v14 = objc_msgSend_pathComponents(a1, v11, v12);
    if (objc_msgSend_length(v7, v15, v16))
    {
      uint64_t v13 = objc_msgSend_bu_storeURLTypeFromHost_(a1, v17, (uint64_t)v7);
    }
    else if ((unint64_t)objc_msgSend_count(v14, v17, v18) < 3)
    {
      uint64_t v13 = 3;
    }
    else
    {
      size_t v20 = objc_msgSend_objectAtIndexedSubscript_(v14, v19, 1);
      uint64_t v13 = objc_msgSend_bu_storeURLTypeFromHost_(a1, v21, (uint64_t)v20);
    }
  }
  else
  {
    uint64_t v13 = 3;
  }

  return v13;
}

id sub_21E1EECE0(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_pathComponents(a1, a2, a3);
  if (objc_msgSend_bu_storeURLType(a1, v5, v6) == 3) {
    goto LABEL_2;
  }
  uint64_t v10 = objc_msgSend_host(a1, v7, v8);
  uint64_t v13 = objc_msgSend_length(v10, v11, v12);

  if (v13)
  {
    objc_msgSend_objectAtIndexedSubscript_(v4, v14, 1);
  }
  else
  {
    if ((unint64_t)objc_msgSend_count(v4, v14, v15) < 3)
    {
LABEL_2:
      uint64_t v9 = 0;
      goto LABEL_8;
    }
    objc_msgSend_objectAtIndexedSubscript_(v4, v16, 2);
  uint64_t v9 = };
LABEL_8:

  return v9;
}

id sub_21E1EED90(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_host(a1, a2, a3);
  uint64_t v6 = objc_msgSend_caseInsensitiveCompare_(v4, v5, @"play");

  if (v6)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = objc_msgSend_bu_dictionaryForQueryItems(a1, v7, v8);
    uint64_t v9 = objc_msgSend_objectForKey_(v10, v11, @"pid");
  }

  return v9;
}

id sub_21E1EEE20(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_bu_isbnForURI(a1, a2, a3);
  if (objc_msgSend_length(v3, v4, v5))
  {
    size_t v7 = NSURL;
    uint64_t v8 = objc_msgSend_stringWithFormat_(NSString, v6, @"itms-books://itunes.apple.com/book/isbn%@", v3);
    uint64_t v10 = objc_msgSend_URLWithString_(v7, v9, (uint64_t)v8);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_21E1EEEC0(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  size_t v7 = objc_msgSend_bu_isbnForURI(a1, v5, v6);
  if (objc_msgSend_length(v7, v8, v9))
  {
    uint64_t v12 = objc_msgSend_defaultBag(BUBag, v10, v11);
    uint64_t v15 = objc_msgSend_booksISBNURL(v12, v13, v14);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_21E1EF02C;
    v23[3] = &unk_26449E650;
    uint64_t v16 = &v24;
    id v24 = v7;
    uint64_t v25 = v4;
    uint64_t v17 = v4;
    objc_msgSend_valueWithCompletion_(v15, v18, (uint64_t)v23);

    int v19 = v25;
  }
  else
  {
    int v19 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_21E1EF124;
    block[3] = &unk_26449D6C8;
    uint64_t v16 = (id *)&v22;
    uint64_t v22 = v4;
    size_t v20 = v4;
    dispatch_async(v19, block);
  }
}

void sub_21E1EF02C(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (!objc_msgSend_length(v14, v3, v4)
    || (uint64_t v6 = objc_msgSend_rangeOfString_(v14, v5, @"{isbn}"), v6 == 0x7FFFFFFFFFFFFFFFLL)
    && (uint64_t v6 = objc_msgSend_rangeOfString_(v14, v7, @"%@"), v6 == 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = NSURL;
    uint64_t v10 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v14, v7, v6, v7, *(void *)(a1 + 32));
    uint64_t v8 = objc_msgSend_URLWithString_(v9, v11, (uint64_t)v10);
  }
  uint64_t v12 = MEMORY[0x223C22A70](*(void *)(a1 + 40));
  uint64_t v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v8);
  }
}

void sub_21E1EF124(uint64_t a1)
{
  uint64_t v1 = (void (**)(void, void))MEMORY[0x223C22A70](*(void *)(a1 + 32));
  if (v1)
  {
    id v2 = v1;
    v1[2](v1, 0);
    uint64_t v1 = (void (**)(void, void))v2;
  }
}

uint64_t sub_21E1EF174(void *a1, const char *a2, uint64_t a3)
{
  v58[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, a3);
  char v56 = 0;
  uint64_t v8 = objc_msgSend_path(a1, v6, v7);
  int isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v5, v9, (uint64_t)v8, &v56);

  if (v56)
  {
    uint64_t v47 = v5;
    uint64_t v13 = *MEMORY[0x263EFF6A8];
    uint64_t v14 = *MEMORY[0x263EFF770];
    v58[0] = *MEMORY[0x263EFF6A8];
    v58[1] = v14;
    uint64_t v48 = v14;
    uint64_t v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v11, (uint64_t)v58, 2);
    uint64_t v18 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v16, v17);
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = sub_21E1EF458;
    v55[3] = &unk_26449E670;
    v55[4] = a3;
    uint64_t v46 = (void *)v15;
    size_t v20 = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v18, v19, (uint64_t)a1, v15, 0, v55);

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v21 = v20;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v51, v57, 16);
    if (v23)
    {
      uint64_t v25 = v23;
      uint64_t v26 = 0;
      uint64_t v27 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v52 != v27) {
            objc_enumerationMutation(v21);
          }
          size_t v29 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v50 = 0;
          ResourceValue_forKey_CFErrorRef error = objc_msgSend_getResourceValue_forKey_error_(v29, v24, (uint64_t)&v50, v13, a3);
          id v31 = v50;
          dispatch_data_t v34 = v31;
          if (!ResourceValue_forKey_error) {
            goto LABEL_19;
          }
          if ((objc_msgSend_BOOLValue(v31, v32, v33) & 1) == 0)
          {
            id v49 = 0;
            int v36 = objc_msgSend_getResourceValue_forKey_error_(v29, v35, (uint64_t)&v49, v48, a3);
            id v37 = v49;
            uint64_t v40 = v37;
            if (!v36)
            {

LABEL_19:
              goto LABEL_20;
            }
            v26 += objc_msgSend_unsignedLongLongValue(v37, v38, v39);
          }
        }
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v51, v57, 16);
        if (v25) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v26 = 0;
    }
LABEL_20:

    unint64_t v41 = v46;
    uint64_t v5 = v47;
    goto LABEL_21;
  }
  if (isDirectory)
  {
    unint64_t v41 = objc_msgSend_path(a1, v11, v12);
    objc_msgSend_attributesOfItemAtPath_error_(v5, v42, (uint64_t)v41, a3);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = objc_msgSend_fileSize(v21, v43, v44);
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v26 = 0;
LABEL_22:

  return v26;
}

uint64_t sub_21E1EF458(uint64_t a1, int a2, id a3)
{
  if (*(void *)(a1 + 32)) {
    **(void **)(a1 + 32) = a3;
  }
  return 0;
}

id sub_21E1EF494(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_absoluteString(a1, a2, a3);
  uint64_t v5 = objc_msgSend_dataUsingEncoding_(v3, v4, 2483028224);

  uint64_t v8 = objc_msgSend_bu_sha1(v5, v6, v7);

  return v8;
}

uint64_t sub_21E1EF4FC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_msgSend_isFileURL(a1, v5, v6) && objc_msgSend_isFileURL(v4, v7, v8))
  {
    uint64_t v11 = objc_msgSend_baseURL(a1, v9, v10);

    if (v11)
    {
      uint64_t v14 = NSURL;
      uint64_t v15 = objc_msgSend_relativeString(a1, v12, v13);
      uint64_t v18 = objc_msgSend_baseURL(a1, v16, v17);
      id v21 = objc_msgSend_URLByStandardizingPath(v18, v19, v20);
      objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v14, v22, (uint64_t)v15, 0, v21);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v23 = a1;
    }
    uint64_t v27 = objc_msgSend_path(v23, v24, v25);
    dispatch_data_t v30 = objc_msgSend_stringByStandardizingPath(v27, v28, v29);
    uint64_t v33 = objc_msgSend_stringByResolvingSymlinksInPath(v30, v31, v32);

    int v36 = objc_msgSend_path(v4, v34, v35);
    uint64_t v39 = objc_msgSend_stringByStandardizingPath(v36, v37, v38);
    uint64_t v42 = objc_msgSend_stringByResolvingSymlinksInPath(v39, v40, v41);

    if ((objc_msgSend_hasSuffix_(v42, v43, @"/") & 1) == 0)
    {
      uint64_t v45 = objc_msgSend_stringByAppendingString_(v42, v44, @"/");

      uint64_t v42 = (void *)v45;
    }
    uint64_t hasPrefix = objc_msgSend_hasPrefix_(v33, v44, (uint64_t)v42);
  }
  else
  {
    uint64_t hasPrefix = 0;
  }

  return hasPrefix;
}

id sub_21E1EF68C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_scheme(a1, a2, a3);
  uint64_t v6 = objc_msgSend_caseInsensitiveCompare_(v4, v5, @"urn");

  if (v6)
  {
    uint64_t v8 = 0;
    goto LABEL_27;
  }
  uint64_t v9 = objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x263F08BA0], v7, (uint64_t)a1, 0);
  uint64_t v12 = objc_msgSend_path(v9, v10, v11);
  uint64_t v14 = objc_msgSend_componentsSeparatedByString_(v12, v13, @":");

  if (objc_msgSend_count(v14, v15, v16) == 2)
  {
    uint64_t v18 = objc_msgSend_objectAtIndex_(v14, v17, 0);
    uint64_t v20 = objc_msgSend_caseInsensitiveCompare_(v18, v19, @"isbn");

    uint64_t v8 = 0;
    if (!v20)
    {
      uint64_t v22 = objc_msgSend_objectAtIndex_(v14, v21, 1);
      id v24 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v22, v23, @"-", &stru_26CF11AD8);

      if (objc_msgSend_length(v24, v25, v26) == 10)
      {
        v41[1] = unk_21E1F6CE8;
        long long v42 = unk_21E1F6CEA;
        objc_msgSend_getCharacters_range_(v24, v27, (uint64_t)v41, 0, 9, *(void *)L"978");
        uint64_t v30 = 0;
        unint64_t v31 = 0;
        char v32 = 1;
        do
        {
          int v33 = *(unsigned __int16 *)&v40[2 * v30];
          if ((v33 - 48) >= 0xA)
          {
            while (v30 != 11)
            {
              int v33 = *(unsigned __int16 *)&v40[2 * v30++ + 2];
              if ((v33 - 48) <= 9)
              {
                char v32 = 0;
                goto LABEL_11;
              }
            }
            goto LABEL_24;
          }
LABEL_11:
          int v34 = v33 - 48;
          if (v30) {
            int v35 = 3;
          }
          else {
            int v35 = 1;
          }
          v31 += (v34 * v35);
          ++v30;
        }
        while (v30 != 12);
        if ((v32 & 1) == 0) {
          goto LABEL_24;
        }
        unint64_t v36 = v31 % 0xA;
        if (v36) {
          __int16 v37 = 58 - v36;
        }
        else {
          __int16 v37 = 48;
        }
        HIWORD(v42) = v37;
        objc_msgSend_stringWithCharacters_length_(NSString, v29, (uint64_t)v40, 13);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend_length(v24, v27, v28) != 13)
        {
LABEL_24:
          uint64_t v8 = 0;
          goto LABEL_25;
        }
        id v38 = v24;
      }
      uint64_t v8 = v38;
LABEL_25:
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

LABEL_27:

  return v8;
}

uint64_t sub_21E1EF90C(void *a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_bu_utType(a1, a2, a3);
  if (!v4)
  {
    uint64_t v5 = BookUtilityLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_21E1F2D0C();
    }
  }
  uint64_t v6 = objc_msgSend_conformsToType_(v4, v3, *MEMORY[0x263F1DA68]);

  return v6;
}

uint64_t sub_21E1EF990(void *a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_bu_utType(a1, a2, a3);
  if (!v4)
  {
    uint64_t v5 = BookUtilityLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_21E1F2D80();
    }
  }
  uint64_t v6 = objc_msgSend_conformsToType_(v4, v3, *MEMORY[0x263F1DAB0]);

  return v6;
}

id sub_21E1EFA14(void *a1, const char *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263EFF608];
  v13[0] = *MEMORY[0x263EFF608];
  id v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v13, 1);
  id v12 = 0;
  uint64_t v6 = objc_msgSend_resourceValuesForKeys_error_(a1, v5, (uint64_t)v4, &v12);
  id v7 = v12;

  if (v7)
  {
    uint64_t v9 = BookUtilityLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21E1F2E38();
    }
LABEL_4:

    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v8, v3);
  if (!v10)
  {
    uint64_t v9 = BookUtilityLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21E1F2DF4(v9);
    }
    goto LABEL_4;
  }
LABEL_6:

  return v10;
}

uint64_t sub_21E1EFB64(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5))
  {
    if (objc_msgSend_caseInsensitiveCompare_(v3, v6, @"assetid"))
    {
      if (objc_msgSend_caseInsensitiveCompare_(v3, v7, @"storeid"))
      {
        if (objc_msgSend_caseInsensitiveCompare_(v3, v8, @"audiobookstoreid")) {
          uint64_t v9 = 3;
        }
        else {
          uint64_t v9 = 2;
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
  }
  else
  {
    uint64_t v9 = 3;
  }

  return v9;
}

id sub_21E1EFBF4(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  id v4 = objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(MEMORY[0x263F08BA0], v3, a1, 0);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = objc_msgSend_queryItems(v4, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v25, v29, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_value(v15, v10, v11);
        int v19 = objc_msgSend_name(v15, v17, v18);
        objc_msgSend_setObject_forKeyedSubscript_(v2, v20, (uint64_t)v16, v19);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v25, v29, 16);
    }
    while (v12);
  }

  id v23 = objc_msgSend_copy(v2, v21, v22);

  return v23;
}

id sub_21E1EFD7C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  __int16 v37 = v5;
  uint64_t v8 = objc_msgSend_componentsSeparatedByString_(v5, v7, @"&");
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v39, v43, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v40;
    uint64_t v15 = @"=";
    do
    {
      uint64_t v16 = 0;
      uint64_t v38 = v13;
      do
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = objc_msgSend_componentsSeparatedByString_(*(void **)(*((void *)&v39 + 1) + 8 * v16), v11, (uint64_t)v15);
        if (objc_msgSend_count(v17, v18, v19) == 2)
        {
          uint64_t v22 = objc_msgSend_firstObject(v17, v20, v21);
          long long v25 = objc_msgSend_lastObject(v17, v23, v24);
          long long v28 = v25;
          if (a4)
          {
            objc_msgSend_stringByRemovingPercentEncoding(v25, v26, v27);
            uint64_t v29 = v14;
            uint64_t v30 = v15;
            unint64_t v31 = v8;
            char v32 = v6;
            uint64_t v34 = v33 = a4;

            long long v28 = (void *)v34;
            a4 = v33;
            uint64_t v6 = v32;
            uint64_t v8 = v31;
            uint64_t v15 = v30;
            uint64_t v14 = v29;
            uint64_t v13 = v38;
          }
          objc_msgSend_setObject_forKeyedSubscript_(v6, v26, (uint64_t)v28, v22);
        }
        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v39, v43, 16);
    }
    while (v13);
  }
  int v35 = objc_msgSend_copy(v6, v11, v12);

  return v35;
}

id sub_21E1EFF78()
{
  if (qword_267D29928 != -1) {
    dispatch_once(&qword_267D29928, &unk_26CF10C78);
  }
  uint64_t v0 = (void *)qword_267D29920;

  return v0;
}

uint64_t sub_21E1EFFCC(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x263F089C0], a2, a3);
  uint64_t v6 = objc_msgSend_mutableCopy(v3, v4, v5);
  id v7 = (void *)qword_267D29920;
  qword_267D29920 = v6;

  uint64_t v8 = qword_267D29920;

  return MEMORY[0x270F9A6D0](v8, sel_removeCharactersInString_, @"?=&+");
}

id sub_21E1F0030(void *a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v6 = v4;
  objc_msgSend_allKeys(v4, v7, v8);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v32, v36, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v33;
    long long v28 = v5;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v6, v11, v15);
        if (a4)
        {
          objc_msgSend_bu_URLQueryParameterValueAllowedCharacterSet(a1, v16, v17);
          uint64_t v20 = v19 = v13;
          uint64_t v22 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v18, v21, (uint64_t)v20);

          uint64_t v13 = v19;
          uint64_t v5 = v28;
          uint64_t v18 = (void *)v22;
        }
        if (objc_msgSend_length(v5, v16, v17)) {
          objc_msgSend_appendFormat_(v5, v23, @"&%@=%@", v15, v18);
        }
        else {
          objc_msgSend_appendFormat_(v5, v23, @"%@=%@", v15, v18);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v32, v36, 16);
    }
    while (v12);
  }

  long long v26 = objc_msgSend_copy(v5, v24, v25);

  return v26;
}

id sub_21E1F0208(void *a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_msgSend_path(a1, v7, v8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  id v9 = objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (const char *)objc_msgSend_UTF8String(v9, v10, v11);

  id v13 = v6;
  uint64_t v16 = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
  if (a4) {
    xattr_flags_t v17 = 8;
  }
  else {
    xattr_flags_t v17 = 0;
  }
  uint64_t v18 = xattr_name_with_flags(v16, v17);
  if (v18)
  {
    uint64_t v19 = v18;
    unint64_t v20 = getxattr(v12, v18, 0, 0x100uLL, 0, 0);
    if (v20 != -1)
    {
      size_t v21 = v20;
      if (v20 <= 0xFF)
      {
        uint64_t v22 = &v29;
        getxattr(v12, v19, &v29, 0x100uLL, 0, 0);
      }
      else
      {
        uint64_t v22 = (long long *)malloc_type_calloc(v20 + 1, 1uLL, 0x100004077774924uLL);
        getxattr(v12, v19, v22, v21, 0, 0);
        if (!v22)
        {
LABEL_16:
          uint64_t v24 = 0;
LABEL_23:
          free(v19);
          goto LABEL_24;
        }
      }
      if (*(unsigned char *)v22)
      {
        id v26 = [NSString alloc];
        uint64_t v24 = objc_msgSend_initWithCString_encoding_(v26, v27, (uint64_t)v22, 4);
      }
      else
      {
        uint64_t v24 = 0;
      }
      if (v22 != &v29) {
        free(v22);
      }
      goto LABEL_23;
    }
    if (*__error() != 93)
    {
      uint64_t v25 = BookUtilityLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_21E1F2F44();
      }
    }
    goto LABEL_16;
  }
  id v23 = BookUtilityLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_21E1F2EB8();
  }

  uint64_t v24 = 0;
LABEL_24:

  return v24;
}

uint64_t sub_21E1F0458(void *a1, uint64_t a2, void *a3, void *a4, int a5)
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v12 = (const char *)objc_msgSend_UTF8String(v9, v10, v11);
  size_t v13 = strlen(v12);
  id v14 = v8;
  xattr_flags_t v17 = (const char *)objc_msgSend_UTF8String(v14, v15, v16);
  if (a5) {
    xattr_flags_t v18 = 8;
  }
  else {
    xattr_flags_t v18 = 0;
  }
  uint64_t v19 = xattr_name_with_flags(v17, v18);
  if (v19)
  {
    uint64_t v22 = v19;
    objc_msgSend_path(a1, v20, v21);
    id v23 = objc_claimAutoreleasedReturnValue();
    id v26 = (const char *)objc_msgSend_UTF8String(v23, v24, v25);
    int v27 = setxattr(v26, v22, v12, v13, 0, 0);

    free(v22);
    if (!v27)
    {
      uint64_t v29 = 1;
      goto LABEL_12;
    }
    long long v28 = BookUtilityLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21E1F304C();
    }
  }
  else
  {
    long long v28 = BookUtilityLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21E1F2FD0();
    }
  }

  uint64_t v29 = 0;
LABEL_12:

  return v29;
}

BOOL sub_21E1F0584(void *a1, uint64_t a2, void *a3, int a4)
{
  id v6 = a3;
  id v9 = (const char *)objc_msgSend_UTF8String(v6, v7, v8);
  if (a4) {
    xattr_flags_t v10 = 8;
  }
  else {
    xattr_flags_t v10 = 0;
  }
  uint64_t v11 = xattr_name_with_flags(v9, v10);
  BOOL v14 = v11 == 0;
  if (!v11)
  {
    uint64_t v21 = BookUtilityLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21E1F30C8();
    }
    goto LABEL_12;
  }
  uint64_t v15 = v11;
  objc_msgSend_path(a1, v12, v13);
  id v16 = objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (const char *)objc_msgSend_UTF8String(v16, v17, v18);
  int v20 = removexattr(v19, v15, 0);

  free(v15);
  if (v20 && *__error() != 93)
  {
    uint64_t v21 = BookUtilityLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21E1F3144();
    }
LABEL_12:

    goto LABEL_13;
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

void sub_21E1F0704(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_21E1F0724(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_21E1F0750(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21E1F07BC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_21E1C7000, log, OS_LOG_TYPE_FAULT, "Loading default bag from offline cache involves sync disk I/O and shouldn't be executed on main thread.", v1, 2u);
}

void sub_21E1F0800(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E1C7000, log, OS_LOG_TYPE_ERROR, "No bag value available for isAudiobooksStoreEnabled. Defaulting to enabled.", v1, 2u);
}

void sub_21E1F0844(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21E1F08B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21E1F091C(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_21E1C7000, log, OS_LOG_TYPE_ERROR, "Failed to remove BUTemporaryDirectory. Error: %@, path: %@", (uint8_t *)&v4, 0x16u);
}

void sub_21E1F09A8(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E1C7000, a2, OS_LOG_TYPE_ERROR, "BUOnboardingAllBundleIDs: Failed to get personalization ID. error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21E1F0A20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21E1F0A58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21E1F0A90(void *a1, char *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_code(a1, a2, a3);
  uint64_t v8 = objc_msgSend_domain(a1, v6, v7);
  int v9 = 134218498;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  __int16 v13 = 2112;
  BOOL v14 = a1;
  _os_log_error_impl(&dword_21E1C7000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Couldn't write Zip: %zd %{public}@ %@", (uint8_t *)&v9, 0x20u);
}

void sub_21E1F0B58(void *a1, char *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_domain(a1, a2, a3);
  int v8 = 138543874;
  int v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = objc_msgSend_code(a1, v6, v7);
  __int16 v12 = 2112;
  __int16 v13 = a1;
  _os_log_error_impl(&dword_21E1C7000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Error reading carrier bundle value: {d=%{public}@ c=%ld, (%@)}", (uint8_t *)&v8, 0x20u);
}

void sub_21E1F0C1C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E1C7000, a2, OS_LOG_TYPE_ERROR, "No subscription context available: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_21E1F0C94(uint64_t *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21E1C7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[BUOSStateHandler] State handler '%@' failed to serialize data, error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_21E1F0D24()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_21E1C7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error consuming extension for container: %{darwin.errno}d", (uint8_t *)v1, 8u);
}

void sub_21E1F0DAC(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109378;
  v2[1] = 5;
  __int16 v3 = 2114;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_21E1C7000, a2, OS_LOG_TYPE_ERROR, "BUCoalescingCallBlock notification block did not call its completion handler after %hus.  Block description=%{public}@", (uint8_t *)v2, 0x12u);
}

uint64_t sub_21E1F0E34()
{
  uint64_t v0 = abort_report_np();
  return sub_21E1F0E5C(v0);
}

uint64_t sub_21E1F0E5C()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_21E1F0E80(v0);
}

void sub_21E1F0E80(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E1C7000, a2, OS_LOG_TYPE_ERROR, "BUAppDataContainer: Error executing query: %s", (uint8_t *)&v2, 0xCu);
}

void sub_21E1F0EF8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E1C7000, log, OS_LOG_TYPE_ERROR, "BUAppDataContainer: Failed to obtain sandbox token", v1, 2u);
}

void sub_21E1F0F3C(void *a1, char *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_identifier(a1, a2, a3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_21E1C7000, (os_log_t)a2, OS_LOG_TYPE_FAULT, "Unable to locate container URL for %@. Falling back to temporary url", (uint8_t *)&v5, 0xCu);
}

void sub_21E1F0FD4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_path(a2, (const char *)a2, a3);
  sub_21E1DA3D4();
  sub_21E1DA3EC(&dword_21E1C7000, v4, v5, "%@: initWithURL: %@", v6, v7, v8, v9, v10);
}

void sub_21E1F1068(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_code(a2, (const char *)a2, (uint64_t)a3);
  uint64_t v9 = objc_msgSend_domain(a2, v7, v8);
  int v10 = 138413058;
  uint64_t v11 = a1;
  __int16 v12 = 2048;
  uint64_t v13 = v6;
  __int16 v14 = 2114;
  uint64_t v15 = v9;
  __int16 v16 = 2112;
  xattr_flags_t v17 = a2;
  _os_log_error_impl(&dword_21E1C7000, a3, OS_LOG_TYPE_ERROR, "Couldn't get size for %@: %zd %{public}@ %@", (uint8_t *)&v10, 0x2Au);
}

void sub_21E1F114C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_path(a2, (const char *)a2, a3);
  sub_21E1DA3D4();
  sub_21E1DA3EC(&dword_21E1C7000, v4, v5, "%@: openWithURL: %@", v6, v7, v8, v9, v10);
}

void sub_21E1F11E0(void *a1, char *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_code(a1, a2, a3);
  uint64_t v8 = objc_msgSend_domain(a1, v6, v7);
  int v9 = 134218498;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  __int16 v12 = v8;
  __int16 v13 = 2112;
  __int16 v14 = a1;
  _os_log_error_impl(&dword_21E1C7000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Failed to remove temporary directory with error: %zd %{public}@ %@", (uint8_t *)&v9, 0x20u);
}

void sub_21E1F12A8(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_path(a1, a2, a3);
  sub_21E1DA40C(&dword_21E1C7000, v4, v5, "Failed to write to temporary zip file: %@", v6, v7, v8, v9, 2u);
}

void sub_21E1F1334(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E1C7000, log, OS_LOG_TYPE_ERROR, "File isn't open", v1, 2u);
}

void sub_21E1F1378()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_21E1DA40C(&dword_21E1C7000, v1, v2, "Failed to create read channel with error: %{public}s", v3, v4, v5, v6, 2u);
}

void sub_21E1F13FC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E1C7000, a2, OS_LOG_TYPE_ERROR, "Could not perform copyToURL: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21E1F1474(void *a1, const char *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_fromURL(a1, a2, (uint64_t)a3);
  int v6 = 141558530;
  uint64_t v7 = 1752392040;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  __int16 v11 = a2;
  _os_log_error_impl(&dword_21E1C7000, a3, OS_LOG_TYPE_ERROR, "Failed to stat URL information. url: %{mask.hash}@ error: %@", (uint8_t *)&v6, 0x20u);
}

void sub_21E1F1534()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  sub_21E1E0CB8();
  int v2 = "-[BUZipArchive initWithOptions:]";
  _os_log_debug_impl(&dword_21E1C7000, v0, OS_LOG_TYPE_DEBUG, "%@: %{public}s", v1, 0x16u);
}

void sub_21E1F15B4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  sub_21E1E0CB8();
  int v2 = "-[BUZipArchive readArchiveWithQueue:completion:]";
  _os_log_debug_impl(&dword_21E1C7000, v0, OS_LOG_TYPE_DEBUG, "%@: %{public}s", v1, 0x16u);
}

void sub_21E1F1634()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  sub_21E1E0CAC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_21E1C7000, v1, OS_LOG_TYPE_FAULT, "Failed to read ZIP archive. %{public}@, error: %@", v2, 0x16u);
}

void sub_21E1F16B8()
{
  sub_21E1E0CAC();
  sub_21E1CB1C0(&dword_21E1C7000, v0, v1, "Failed first attempt to read ZIP archive, but we will attempt to recover. %{public}@", v2, v3, v4, v5, v6);
}

void sub_21E1F1720()
{
  sub_21E1E0CAC();
  sub_21E1CB1C0(&dword_21E1C7000, v0, v1, "Attempted to adjust the offset for %llu times. Will assume the ZIP is complete.", v2, v3, v4, v5, v6);
}

void sub_21E1F1788(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_entries(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_count(v3, v4, v5);
  sub_21E1DA40C(&dword_21E1C7000, v6, v7, "Failed to parse ZIP entry %tu. Will attempt to adjust offset forward.", v8, v9, v10, v11, 0);
}

void sub_21E1F181C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_entries(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_count(v3, v4, v5);
  sub_21E1DA40C(&dword_21E1C7000, v6, v7, "Failed to parse ZIP entry %tu. Will attempt to adjust offset backward.", v8, v9, v10, v11, 0);
}

void sub_21E1F18B0()
{
  sub_21E1E0CAC();
  sub_21E1CB1C0(&dword_21E1C7000, v0, v1, "Duplicate entry for name: %@", v2, v3, v4, v5, v6);
}

void sub_21E1F1918()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21E1E0C84();
  _os_log_fault_impl(&dword_21E1C7000, v0, OS_LOG_TYPE_FAULT, "extractToURL failed - toURL: %{mask.hash}@, error: %@", v1, 0x20u);
}

void sub_21E1F1990()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21E1E0C84();
  _os_log_error_impl(&dword_21E1C7000, v0, OS_LOG_TYPE_ERROR, "Exception thrown during extractToURL - toURL: %{mask.hash}@, exception: %@", v1, 0x20u);
}

void sub_21E1F1A08(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E1C7000, log, OS_LOG_TYPE_ERROR, "Can't create output directory", v1, 2u);
}

void sub_21E1F1A4C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21E1C7000, log, OS_LOG_TYPE_DEBUG, "-newAssertion: triggering transition to non zero delegation", v1, 2u);
}

void sub_21E1F1A90(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21E1C7000, a2, OS_LOG_TYPE_DEBUG, "-newAssertion: increased _count to %ld", (uint8_t *)&v3, 0xCu);
}

void sub_21E1F1B10(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21E1C7000, log, OS_LOG_TYPE_DEBUG, "-newAssertion: triggering transition to zero delegation", v1, 2u);
}

void sub_21E1F1B54(uint64_t *a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2 & 1;
  _os_log_debug_impl(&dword_21E1C7000, log, OS_LOG_TYPE_DEBUG, "-newAssertion: _endAssertion decreased _count to %ld and returning result as %d", (uint8_t *)&v4, 0x12u);
}

void sub_21E1F1BE4(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2082;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_21E1C7000, log, OS_LOG_TYPE_ERROR, "Error opening file at path %s: %{public}s", buf, 0x16u);
}

void sub_21E1F1C3C(int a1)
{
  strerror(a1);
  sub_21E1DA40C(&dword_21E1C7000, v1, v2, "Error cleaning up dispatch channel: %{public}s", v3, v4, v5, v6, 2u);
}

void sub_21E1F1CB8(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_entry(*a1, a2, a3);
  uint64_t v6 = objc_msgSend_name(v3, v4, v5);
  sub_21E1E0CAC();
  sub_21E1DA40C(&dword_21E1C7000, v7, v8, "Read was less than file header size for entry %@", v9, v10, v11, v12, v13);
}

void sub_21E1F1D58(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_name(*(void **)(a1 + 16), a2, a3);
  sub_21E1E0CAC();
  sub_21E1DA40C(&dword_21E1C7000, v4, v5, "Local file header doesn't match compression method from central directory file header for entry %@", v6, v7, v8, v9, v10);
}

void sub_21E1F1DE0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_name(*(void **)(a1 + 16), a2, a3);
  sub_21E1E0CAC();
  sub_21E1DA40C(&dword_21E1C7000, v4, v5, "Local file header has bad signature for entry %@", v6, v7, v8, v9, v10);
}

void sub_21E1F1E68(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_name(*(void **)(a1 + 16), a2, a3);
  sub_21E1E0CAC();
  sub_21E1DA40C(&dword_21E1C7000, v4, v5, "Read was less than record size for entry %@", v6, v7, v8, v9, v10);
}

void sub_21E1F1EF0(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_name(*a1, a2, a3);
  sub_21E1E0CAC();
  sub_21E1DA40C(&dword_21E1C7000, v4, v5, "CRC does not match for entry %@", v6, v7, v8, v9, v10);
}

void sub_21E1F1F78()
{
  sub_21E1E75C8();
  sub_21E1D1684(&dword_21E1C7000, v0, v1, "We are out of luck, unable to get any storefront identifier from active and local store accounts. Returning nil storefront.", v2, v3, v4, v5, v6);
}

void sub_21E1F1FAC()
{
  sub_21E1E75C8();
  sub_21E1D1684(&dword_21E1C7000, v0, v1, "We have an active store account without storefront, will try to fallback to that of local store account", v2, v3, v4, v5, v6);
}

void sub_21E1F1FE0()
{
  sub_21E1E75C8();
  _os_log_fault_impl(&dword_21E1C7000, v0, OS_LOG_TYPE_FAULT, "Can't addObserver for iCloud Account without CloudKit entitlement.", v1, 2u);
}

void sub_21E1F2020()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21E1E0CAC();
  _os_log_error_impl(&dword_21E1C7000, v0, OS_LOG_TYPE_ERROR, "Failed to fetch iCloud UserRecordID: %@", v1, 0xCu);
}

void sub_21E1F2094()
{
  sub_21E1E75C8();
  _os_log_fault_impl(&dword_21E1C7000, v0, OS_LOG_TYPE_FAULT, "BUAccountsProvider needs CloudKit entitlement to provide iCloud account caching/notifying, and the calling process doesn't have that, we will always pass calls to AppleAccount and don't do any caching/notifying.", v1, 2u);
}

void sub_21E1F20D4()
{
  sub_21E1E75C8();
  sub_21E1D1684(&dword_21E1C7000, v0, v1, "Unexpected NULL value returned from SecTaskCreateFromSelf()", v2, v3, v4, v5, v6);
}

void sub_21E1F2108()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  sub_21E1E0CAC();
  __int16 v3 = 2112;
  uint64_t v4 = @"com.apple.developer.icloud-services";
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_21E1C7000, v1, OS_LOG_TYPE_ERROR, "Unexpected value %@ for %@ entitlement: %@", v2, 0x20u);
}

void sub_21E1F21A0(void **a1, const char *a2, uint64_t a3)
{
  __int16 v3 = objc_msgSend_name(*a1, a2, a3);
  sub_21E1E0CAC();
  sub_21E1E75D4(&dword_21E1C7000, v4, v5, "Received %@ but skipping notify observers", v6, v7, v8, v9, v10);
}

void sub_21E1F2228(void **a1, const char *a2, uint64_t a3)
{
  __int16 v3 = objc_msgSend_name(*a1, a2, a3);
  sub_21E1E0CAC();
  sub_21E1E75D4(&dword_21E1C7000, v4, v5, "Received %@", v6, v7, v8, v9, v10);
}

void sub_21E1F22B0(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21E1C7000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch iCloud CKRecordID: %@", (uint8_t *)&v3, 0xCu);
}

void sub_21E1F232C(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  uint64_t v6 = objc_msgSend_domain(a1, v4, v5);
  sub_21E1E9668();
  sub_21E1E968C(&dword_21E1C7000, v7, v8, "Error reading from filter BUStreamReadChannel: %zd %{public}@ %@", v9, v10, v11, v12, v13);
}

void sub_21E1F23C8(void *a1, const char *a2, uint64_t a3)
{
  objc_msgSend_code(a1, a2, a3);
  uint64_t v6 = objc_msgSend_domain(a1, v4, v5);
  sub_21E1E9668();
  sub_21E1E968C(&dword_21E1C7000, v7, v8, "Error reading from source BUReadChannel: %zd %{public}@ %@", v9, v10, v11, v12, v13);
}

void sub_21E1F2464(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21E1C7000, log, OS_LOG_TYPE_ERROR, "Failed to initialize zip archive at %@. error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_21E1F24EC()
{
  sub_21E1E0CAC();
  sub_21E1CB1C0(&dword_21E1C7000, v0, v1, "Nil data for entry. %@", v2, v3, v4, v5, v6);
}

void sub_21E1F2554()
{
  sub_21E1E0CAC();
  sub_21E1CB1C0(&dword_21E1C7000, v0, v1, "Failed to produce plist from data. %@", v2, v3, v4, v5, v6);
}

void sub_21E1F25BC()
{
  sub_21E1E0CAC();
  sub_21E1CB1C0(&dword_21E1C7000, v0, v1, "Exception creating xml document. %@", v2, v3, v4, v5, v6);
}

void sub_21E1F2624()
{
  sub_21E1E0CAC();
  sub_21E1CB1C0(&dword_21E1C7000, v0, v1, "Error creating temporary directory: %@", v2, v3, v4, v5, v6);
}

void sub_21E1F268C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_URLByDeletingLastPathComponent(a1, a2, a3);
  uint8_t v6 = objc_msgSend_path(v3, v4, v5);
  sub_21E1EB784();
  sub_21E1EB79C(&dword_21E1C7000, v7, v8, "Failed to create temp directory for extraction at %@. %@", v9, v10, v11, v12, v13);
}

void sub_21E1F272C(void *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_name(a1, a2, a3);
  sub_21E1E0CAC();
  _os_log_error_impl(&dword_21E1C7000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Skipping entry because it is outside the root of the zip: %@", v5, 0xCu);
}

void sub_21E1F27C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21E1F2830(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_name(a1, a2, a3);
  sub_21E1EB784();
  sub_21E1EB79C(&dword_21E1C7000, v4, v5, "Skipping extraction of symlink (%@) because destination of symlink (%@) is outside root.", v6, v7, v8, v9, v10);
}

void sub_21E1F28C0()
{
  sub_21E1E0CAC();
  sub_21E1CB1C0(&dword_21E1C7000, v0, v1, "Failed to write entry to directory. %@", v2, v3, v4, v5, v6);
}

void sub_21E1F2928()
{
  sub_21E1EB7BC();
  sub_21E1EB7D4(&dword_21E1C7000, v0, v1, "Unable to read symlink destination path from %@: %@");
}

void sub_21E1F2990(void **a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_name(*a1, a2, a3);
  sub_21E1EB784();
  sub_21E1EB79C(&dword_21E1C7000, v4, v5, "Skipping extraction of symlink (%@) because destination of symlink (%@) is outside root.", v6, v7, v8, v9, v10);
}

void sub_21E1F2A24()
{
  sub_21E1E0CAC();
  sub_21E1CB1C0(&dword_21E1C7000, v0, v1, "Failed to create temp directory for extraction. Error: %@", v2, v3, v4, v5, v6);
}

void sub_21E1F2A8C()
{
  sub_21E1EB7BC();
  sub_21E1EB7D4(&dword_21E1C7000, v0, v1, "Failed to create write stream handler with URL %@. Error: %@");
}

void sub_21E1F2AF4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E1C7000, a2, OS_LOG_TYPE_ERROR, "[Cellular] Returning 'null' identity after error occurred: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_21E1F2B6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21E1F2BA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21E1F2BDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_21E1F2C14(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E1C7000, a2, OS_LOG_TYPE_ERROR, "Data is too big to decompress. Size: %llu", (uint8_t *)&v2, 0xCu);
}

void sub_21E1F2C8C(int **a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = **a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_21E1C7000, a2, OS_LOG_TYPE_ERROR, "inflate() failed: %d", (uint8_t *)v3, 8u);
}

void sub_21E1F2D0C()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21E1F06E4();
  _os_log_error_impl(&dword_21E1C7000, v0, OS_LOG_TYPE_ERROR, "bu_isDirectory: bu_utType failed. url: %{mask.hash}@", v1, 0x16u);
}

void sub_21E1F2D80()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_21E1F06E4();
  _os_log_error_impl(&dword_21E1C7000, v0, OS_LOG_TYPE_ERROR, "bu_isFolder: bu_utType failed. url: %{mask.hash}@", v1, 0x16u);
}

void sub_21E1F2DF4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21E1C7000, log, OS_LOG_TYPE_ERROR, "bu_utType: NSURLContentTypeKey not found.", v1, 2u);
}

void sub_21E1F2E38()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  sub_21E1F06E4();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_21E1C7000, v2, OS_LOG_TYPE_ERROR, "bu_utType: resourceValuesForKeys failed. url: %{mask.hash}@ error: %@", v3, 0x20u);
}

void sub_21E1F2EB8()
{
  __error();
  sub_21E1F0694();
  sub_21E1F0724(&dword_21E1C7000, v0, v1, "extendedAttributeNamed: xattr_name_with_flags failed. xattr: %@ errno: %d url: %{mask.hash}@", v2, v3, v4, v5, v6);
}

void sub_21E1F2F44()
{
  __error();
  sub_21E1F0694();
  sub_21E1F0724(&dword_21E1C7000, v0, v1, "extendedAttributeNamed: getxattr failed. xattr: %@ errno: %d url: %{mask.hash}@", v2, v3, v4, v5, v6);
}

void sub_21E1F2FD0()
{
  sub_21E1F0744();
  __error();
  sub_21E1F06CC();
  sub_21E1F0704(&dword_21E1C7000, v0, v1, "setExtendedAttributeNamed: xattr_name_with_flags failed. xattr: %@ errno: %d", v2, v3, v4, v5, v6);
}

void sub_21E1F304C()
{
  sub_21E1F0744();
  __error();
  sub_21E1F06CC();
  sub_21E1F0704(&dword_21E1C7000, v0, v1, "setExtendedAttributeNamed: setxattr failed. xattr: %@ errno: %d", v2, v3, v4, v5, v6);
}

void sub_21E1F30C8()
{
  sub_21E1F0744();
  __error();
  sub_21E1F06CC();
  sub_21E1F0704(&dword_21E1C7000, v0, v1, "removeExtendedAttributeNamed: xattr_name_with_flags failed. xattr: %@ errno: %d", v2, v3, v4, v5, v6);
}

void sub_21E1F3144()
{
  sub_21E1F0744();
  __error();
  sub_21E1F06CC();
  sub_21E1F0704(&dword_21E1C7000, v0, v1, "removeExtendedAttributeNamed: removexattr failed. xattr: %@ errno: %d", v2, v3, v4, v5, v6);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B50](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B58](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B60](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGDataProviderRef CGDataProviderCreateSequential(void *info, const CGDataProviderSequentialCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x270EE62C8](info, callbacks);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x270EE55E0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
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

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x270ED8F88]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x270ED8FD0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x270ED9008]();
}

uint64_t container_query_create()
{
  return MEMORY[0x270ED9060]();
}

uint64_t container_query_free()
{
  return MEMORY[0x270ED9068]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x270ED9070]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x270ED9078]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x270ED9090]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x270ED90A0]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x270ED90B0]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x270ED90C0]();
}

uint64_t container_query_set_uid()
{
  return MEMORY[0x270ED90C8]();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x270ED92B8](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x270ED92E0](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x270ED92E8](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x270ED92F0](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x270ED9300](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
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

void dispatch_io_barrier(dispatch_io_t channel, dispatch_block_t barrier)
{
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x270ED9390](type, *(void *)&fd, queue, cleanup_handler);
}

dispatch_fd_t dispatch_io_get_descriptor(dispatch_io_t channel)
{
  return MEMORY[0x270ED93A8](channel);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
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
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

void free(void *a1)
{
}

int fsync(int a1)
{
  return MEMORY[0x270ED9B10](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270ED9DC0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDA588](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x270EF8A08]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x270EF8A58](path, *(void *)&interface_type);
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D8](a1, a2);
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

void objc_terminate(void)
{
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x270F9AA48](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
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

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x270EDB218](path, name, *(void *)&options);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

char *__cdecl xattr_name_with_flags(const char *a1, xattr_flags_t a2)
{
  return (char *)MEMORY[0x270EDBC50](a1, a2);
}

xmlParserCtxtPtr xmlCreatePushParserCtxt(xmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename)
{
  return (xmlParserCtxtPtr)MEMORY[0x270F9BBC8](sax, user_data, chunk, *(void *)&size, filename);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
}

int xmlParseChunk(xmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x270F9BF90](ctxt, chunk, *(void *)&size, *(void *)&terminate);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}