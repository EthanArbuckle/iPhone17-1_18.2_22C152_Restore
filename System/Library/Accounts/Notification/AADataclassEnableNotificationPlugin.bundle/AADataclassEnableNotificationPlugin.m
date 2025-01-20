id sub_240536624(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t vars8;

  v4 = a3;
  v7 = objc_msgSend_mutableCopy(a1, v5, v6);
  objc_msgSend_removeObject_(v7, v8, (uint64_t)v4);

  v11 = objc_msgSend_copy(v7, v9, v10);
  return v11;
}

id sub_240536688(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7 = objc_msgSend_mutableCopy(a1, v5, v6);
  objc_msgSend_minusSet_(v7, v8, (uint64_t)v4);

  v11 = objc_msgSend_copy(v7, v9, v10);
  return v11;
}

uint64_t sub_2405368FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend_isEnabledForDataclass_(*(void **)(a1 + 32), v4, (uint64_t)v3))
  {
    uint64_t canAutoEnableDataclass_forAccount = 0;
  }
  else
  {
    v8 = objc_msgSend_sharedManager(AADataclassManager, v5, v6);
    uint64_t canAutoEnableDataclass_forAccount = objc_msgSend_canAutoEnableDataclass_forAccount_(v8, v9, (uint64_t)v3, *(void *)(a1 + 32));
  }
  return canAutoEnableDataclass_forAccount;
}

void sub_240536974(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v8;
      v9 = "Successfully enabled datclasses for account %@";
      uint64_t v10 = v7;
      uint32_t v11 = 12;
LABEL_7:
      _os_log_impl(&dword_240535000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v5)
  {
    v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v12;
      __int16 v15 = 2112;
      v16 = v6;
      v9 = "Failed to enable dataclasses for account %@ with error %@";
      uint64_t v10 = v7;
      uint32_t v11 = 22;
      goto LABEL_7;
    }
LABEL_8:
  }
}

id sub_240536A98(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7 = objc_msgSend_mutableCopy(a1, v5, v6);
  objc_msgSend_removeObject_(v7, v8, (uint64_t)v4);

  uint32_t v11 = objc_msgSend_copy(v7, v9, v10);
  return v11;
}

id sub_240536AFC(void *a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (!v7)
  {
    v21 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, a2, a1, @"NSArray+AppleAccount.m", 26, @"Invalid parameter not satisfying: %@", @"block");
  }
  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v11 = objc_msgSend_count(a1, v9, v10);
  int v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_240536C44;
  v23[3] = &unk_2650BF770;
  id v24 = v13;
  id v25 = v7;
  id v14 = v13;
  id v15 = v7;
  objc_msgSend_enumerateObjectsUsingBlock_(a1, v16, (uint64_t)v23);
  v19 = objc_msgSend_copy(v14, v17, v18);

  return v19;
}

void sub_240536C44(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v3, (uint64_t)v4);
  }
}

id sub_240536CC4(void *a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, a2, a1, @"NSArray+AppleAccount.m", 41, @"Invalid parameter not satisfying: %@", @"predicate");
  }
  uint64_t v8 = objc_msgSend_indexOfObjectPassingTest_(a1, v5, (uint64_t)v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = objc_msgSend_objectAtIndex_(a1, v9, v8);
  }

  return v10;
}

id sub_240536D98(void *a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (!v7)
  {
    v21 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, a2, a1, @"NSArray+AppleAccount.m", 53, @"Invalid parameter not satisfying: %@", @"block");
  }
  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v11 = objc_msgSend_count(a1, v9, v10);
  int v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_240536EE4;
  v23[3] = &unk_2650BF798;
  id v24 = v13;
  id v25 = v7;
  id v14 = v7;
  id v15 = v13;
  objc_msgSend_enumerateObjectsUsingBlock_(a1, v16, (uint64_t)v23);
  v19 = objc_msgSend_copy(v15, v17, v18);

  return v19;
}

void sub_240536EE4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v1, v2, (uint64_t)v3);
}

id sub_240536F40(void *a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (!v7)
  {
    v21 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, a2, a1, @"NSArray+AppleAccount.m", 65, @"Invalid parameter not satisfying: %@", @"block");
  }
  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v11 = objc_msgSend_count(a1, v9, v10);
  int v13 = objc_msgSend_initWithCapacity_(v8, v12, v11);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_240537088;
  v23[3] = &unk_2650BF770;
  id v24 = v13;
  id v25 = v7;
  id v14 = v13;
  id v15 = v7;
  objc_msgSend_enumerateObjectsUsingBlock_(a1, v16, (uint64_t)v23);
  v19 = objc_msgSend_copy(v14, v17, v18);

  return v19;
}

uint64_t sub_240537088(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = (const char *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v2, (uint64_t)v2);
  }
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2405370F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x263EFFA08];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v8 = objc_msgSend_initWithArray_(v6, v7, a1);
  id v9 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v11 = objc_msgSend_initWithArray_(v9, v10, (uint64_t)v5);

  uint64_t isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v8, v12, (uint64_t)v11);
  return isSubsetOfSet;
}

id sub_240537170(void *a1, const char *a2, uint64_t a3)
{
  if (objc_msgSend_count(a1, a2, a3))
  {
    id v5 = objc_msgSend_objectAtIndex_(a1, v4, 0);
    objc_msgSend_removeObjectAtIndex_(a1, v6, 0);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

id sub_2405371D4(void *a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_lastObject(a1, a2, a3);
  objc_msgSend_removeLastObject(a1, v5, v6);
  return v4;
}

uint64_t sub_2405372C4()
{
  qword_268C87D48 = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

void sub_240537358()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v1, @"DisableBookmarksiCloudSetting", *MEMORY[0x263EFAC28]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v2, @"DisableFMMiCloudSetting", *MEMORY[0x263EFAC78]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v3, @"DisableAddressBookiCloudSetting", *MEMORY[0x263EFAC60]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v4, @"DisableCalendariCloudSetting", *MEMORY[0x263EFAC50]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v5, @"DisableMailiCloudSetting", *MEMORY[0x263EFACB8]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v6, @"DisableNotesiCloudSetting", *MEMORY[0x263EFACE8]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v7, @"DisableRemindersiCloudSetting", *MEMORY[0x263EFAD08]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v8, @"DisableKeychainCloudSync", *MEMORY[0x263EFACB0]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v9, @"DisableCloudSync", *MEMORY[0x263EFAD48]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v10, @"DisablePhotosiCloudSetting", *MEMORY[0x263EFACF8]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v11, @"DisableFreeformiCloudSetting", *MEMORY[0x263EFAC88]);
  objc_msgSend_setObject_forKeyedSubscript_(v0, v12, @"DisableImagePlaygroundiCloudSetting", *MEMORY[0x263EFACA0]);
  int v13 = (void *)qword_268C87D58;
  qword_268C87D58 = (uint64_t)v0;
}

uint64_t sub_24053802C()
{
  qword_268C87D68 = objc_alloc_init(AADataclassManager);
  return MEMORY[0x270F9A758]();
}

void sub_240538194()
{
  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v0, @"com.apple.mobilesafari", *MEMORY[0x263EFAC28]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v1, @"com.apple.mobilecal", *MEMORY[0x263EFAC50]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v2, @"com.apple.MobileAddressBook", *MEMORY[0x263EFAC60]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v3, @"com.apple.freeform", *MEMORY[0x263EFAC88]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v4, @"com.apple.Home", *MEMORY[0x263EFAC98]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v5, @"com.apple.mobilemail", *MEMORY[0x263EFACB8]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v6, @"com.apple.news", *MEMORY[0x263EFACE0]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v7, @"com.apple.mobilenotes", *MEMORY[0x263EFACE8]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v8, @"com.apple.reminders", *MEMORY[0x263EFAD08]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v9, @"com.apple.stocks", *MEMORY[0x263EFAD40]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v10, @"com.apple.MobileSMS", *MEMORY[0x263EFACC8]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v11, @"com.apple.Health", *MEMORY[0x263EFAC90]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v12, @"com.apple.DocumentsApp", *MEMORY[0x263EFAD48]);
  objc_msgSend_setObject_forKeyedSubscript_(v18, v13, @"com.apple.GenerativePlaygroundApp", *MEMORY[0x263EFACA0]);
  uint64_t v16 = objc_msgSend_copy(v18, v14, v15);
  uint64_t v17 = (void *)qword_268C87D78;
  qword_268C87D78 = v16;
}

void sub_2405384E0(uint64_t a1, const char *a2)
{
  v18[11] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F53860];
  uint64_t v3 = *MEMORY[0x263EFACC0];
  v17[0] = *MEMORY[0x263EFACA8];
  v17[1] = v3;
  uint64_t v4 = *MEMORY[0x263F53A08];
  v18[0] = v2;
  v18[1] = v4;
  uint64_t v5 = *MEMORY[0x263F53A50];
  uint64_t v6 = *MEMORY[0x263EFAD30];
  v17[2] = *MEMORY[0x263EFAD28];
  v17[3] = v6;
  uint64_t v7 = *MEMORY[0x263F537E0];
  v18[2] = v5;
  v18[3] = v7;
  uint64_t v8 = *MEMORY[0x263F53858];
  uint64_t v9 = *MEMORY[0x263EFAC78];
  v17[4] = *MEMORY[0x263EFAC20];
  v17[5] = v9;
  uint64_t v10 = *MEMORY[0x263F538C0];
  v18[4] = v8;
  v18[5] = v10;
  uint64_t v11 = *MEMORY[0x263F538F8];
  uint64_t v12 = *MEMORY[0x263EFAC98];
  v17[6] = *MEMORY[0x263EFAC90];
  v17[7] = v12;
  uint64_t v13 = *MEMORY[0x263F53908];
  v18[6] = v11;
  v18[7] = v13;
  uint64_t v14 = *MEMORY[0x263EFAD48];
  v17[8] = *MEMORY[0x263EFACE0];
  v17[9] = v14;
  v18[8] = *MEMORY[0x263F539C0];
  v18[9] = v2;
  v17[10] = *MEMORY[0x263EFACA0];
  v18[10] = *MEMORY[0x263F53928];
  uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v18, v17, 11);
  uint64_t v16 = (void *)qword_268C87D88;
  qword_268C87D88 = v15;
}

void sub_24053898C(uint64_t a1, const char *a2)
{
  v7[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFAC60];
  v7[0] = *MEMORY[0x263EFAC50];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFAC98];
  v7[2] = *MEMORY[0x263EFAC90];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x263EFAD48];
  v7[4] = *MEMORY[0x263EFAD08];
  v7[5] = v4;
  uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v7, 6);
  uint64_t v6 = (void *)qword_268C87D98;
  qword_268C87D98 = v5;
}

void sub_2405394BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2405394DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2405394EC(uint64_t a1)
{
}

void sub_2405394F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _AALogSystem();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_24053A990();
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_240535000, v6, OS_LOG_TYPE_DEFAULT, "Save without auto-enableable dataclasses successful completed.", v10, 2u);
    }

    uint64_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

void sub_240539860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_240539884(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  if (v5)
  {
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"dataclasses");
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v9, @"dataclassActions");
    uint64_t v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_240535000, v11, OS_LOG_TYPE_DEFAULT, "Filtered dataclasses: %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_240535000, v12, OS_LOG_TYPE_DEFAULT, "Filtered dataclass actions: %@", (uint8_t *)&buf, 0xCu);
    }

    WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      uint64_t shouldVerifyAccountSave = objc_msgSend__shouldVerifyAccountSave(*(void **)(a1 + 32), v13, v14);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v36 = 0x3032000000;
      v37 = sub_2405394DC;
      v38 = sub_2405394EC;
      id v39 = (id)os_transaction_create();
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = sub_240539BF0;
      v30 = &unk_2650BF818;
      id v18 = *(void **)(a1 + 40);
      uint64_t v17 = a1 + 40;
      id v31 = v18;
      id v19 = v10;
      id v32 = v19;
      id v33 = *(id *)(v17 + 8);
      p_long long buf = &buf;
      v20 = (void *)MEMORY[0x2455EAC00](&v27);
      objc_msgSend_saveAccount_onAccountStore_withDataclassActions_doVerify_completion_(WeakRetained[2], v21, *(void *)v17, WeakRetained[1], v19, shouldVerifyAccountSave, v20, v27, v28, v29, v30);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v23 = _AALogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_24053AA60(v23);
      }

      uint64_t v24 = *(void *)(a1 + 48);
      v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v25, *MEMORY[0x263F25710], -8015, 0);
      (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v26);
    }
  }
  else
  {
    v22 = _AALogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_24053A9F8();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_240539BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_240539BF0(void *a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    if (a2) {
      id v7 = @"YES";
    }
    int v13 = 138412802;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_impl(&dword_240535000, v6, OS_LOG_TYPE_DEFAULT, "Account save with dataclass actions had success (%@) for account (%@) with dataclass actions: %@", (uint8_t *)&v13, 0x20u);
  }

  if (v5)
  {
    uint64_t v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_24053AAA4();
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v11 = *(void *)(a1[7] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

void sub_24053A07C(void **a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (objc_msgSend_count(v6, v7, v8))
  {
    uint64_t v11 = objc_msgSend_count(v6, v9, v10);
    uint64_t v12 = _AALogSystem();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 == 1)
    {
      if (v13)
      {
        __int16 v15 = objc_msgSend_objectAtIndexedSubscript_(v6, v14, 0);
        int v31 = 134218242;
        uint64_t v32 = objc_msgSend_type(v15, v16, v17);
        __int16 v33 = 2112;
        uint64_t v34 = (uint64_t)v5;
        _os_log_impl(&dword_240535000, v12, OS_LOG_TYPE_DEFAULT, "Action %lu available for %@", (uint8_t *)&v31, 0x16u);
      }
      v20 = objc_msgSend_firstObject(v6, v18, v19);
      if (objc_msgSend_isDataclassActionSafeForAutoEnablement_(a1[4], v21, (uint64_t)v20))
      {
        objc_msgSend_setObject_forKey_(a1[5], v22, (uint64_t)v20, v5);
      }
      else
      {
        id v25 = _ACLogSystem();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = objc_msgSend_type(v20, v26, v27);
          int v31 = 138412546;
          uint64_t v32 = (uint64_t)v5;
          __int16 v33 = 2048;
          uint64_t v34 = v28;
          _os_log_impl(&dword_240535000, v25, OS_LOG_TYPE_DEFAULT, "\"Not enabling dataclass %@ as only action %lu is not safe for auto enablement.\"", (uint8_t *)&v31, 0x16u);
        }

        objc_msgSend_removeObject_(a1[6], v29, (uint64_t)v5);
        objc_msgSend_setEnabled_forDataclass_(a1[7], v30, 0, v5);
      }
    }
    else
    {
      if (v13)
      {
        int v31 = 138412290;
        uint64_t v32 = (uint64_t)v5;
        _os_log_impl(&dword_240535000, v12, OS_LOG_TYPE_DEFAULT, "Unable to auto-enable dataclass %@ as enablement requires a user decision.", (uint8_t *)&v31, 0xCu);
      }

      objc_msgSend_removeObject_(a1[6], v23, (uint64_t)v5);
      objc_msgSend_setEnabled_forDataclass_(a1[7], v24, 0, v5);
    }
  }
}

uint64_t sub_24053A384(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend_isProvisionedForDataclass_(*(void **)(a1 + 32), v4, (uint64_t)v3)
    && (objc_msgSend_isEnabledForDataclass_(*(void **)(a1 + 32), v5, (uint64_t)v3) & 1) == 0)
  {
    uint64_t v9 = objc_msgSend_sharedManager(AADataclassManager, v6, v7);
    uint64_t canAutoEnableDataclass_forAccount = objc_msgSend_canAutoEnableDataclass_forAccount_(v9, v10, (uint64_t)v3, *(void *)(a1 + 32));
  }
  else
  {
    uint64_t canAutoEnableDataclass_forAccount = 0;
  }

  return canAutoEnableDataclass_forAccount;
}

void sub_24053A528(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_24053A544(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_24053A690(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = qword_268C87D48;
  _os_log_debug_impl(&dword_240535000, log, OS_LOG_TYPE_DEBUG, "Current device model: %@", (uint8_t *)&v1, 0xCu);
}

void sub_24053A714(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_240535000, a2, OS_LOG_TYPE_DEBUG, "Policy identifier does not exist for %@", (uint8_t *)&v2, 0xCu);
}

void sub_24053A78C(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = @"YES";
  if ((a2 & 1) == 0) {
    uint64_t v3 = @"NO";
  }
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_240535000, log, OS_LOG_TYPE_DEBUG, "Policy restriction for %@ is %@", (uint8_t *)&v4, 0x16u);
}

void sub_24053A82C()
{
}

void sub_24053A858()
{
  sub_24053A51C();
  sub_24053A544(&dword_240535000, v0, v1, "Nil bundle ID passed. No reason to consider restricted or removed for dataclass %@", v2, v3, v4, v5, v6);
}

void sub_24053A8C0()
{
  sub_24053A51C();
  sub_24053A544(&dword_240535000, v0, v1, "Notes is migrated, so we won't provision it for this basic account %@", v2, v3, v4, v5, v6);
}

void sub_24053A928()
{
  sub_24053A51C();
  sub_24053A544(&dword_240535000, v0, v1, "Reminders is migrated, so we won't provision it for this basic account %@", v2, v3, v4, v5, v6);
}

void sub_24053A990()
{
  sub_24053A51C();
  sub_24053A528(&dword_240535000, v0, v1, "Failed to save account without auto-enableable dataclasses with error: %@", v2, v3, v4, v5, v6);
}

void sub_24053A9F8()
{
  sub_24053A51C();
  sub_24053A528(&dword_240535000, v0, v1, "Unable to build list of dataclasses and actions for enablement %@", v2, v3, v4, v5, v6);
}

void sub_24053AA60(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_240535000, log, OS_LOG_TYPE_ERROR, "AADataclassManager failed to maintain ref to self.", v1, 2u);
}

void sub_24053AAA4()
{
  sub_24053A51C();
  sub_24053A528(&dword_240535000, v0, v1, "Encountered error when saving with dataclass actions: %@", v2, v3, v4, v5, v6);
}

void sub_24053AB0C()
{
  sub_24053A51C();
  sub_24053A528(&dword_240535000, v0, v1, "Failed to get dataclass actions for account, error: %@", v2, v3, v4, v5, v6);
}

void sub_24053AB74(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_240535000, log, OS_LOG_TYPE_DEBUG, "HomePod setup sign in detected. Do not verify our account save.", v1, 2u);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t _AALogSystem()
{
  return MEMORY[0x270F0CE28]();
}

uint64_t _ACLogSystem()
{
  return MEMORY[0x270EE0670]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}