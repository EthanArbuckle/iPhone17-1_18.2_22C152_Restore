void sub_221CAA3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221CAA3FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend_addObject_(*(void **)(a1 + 32), v4, (uint64_t)v3);
  if ((int)objc_msgSend_iOSLegacyIdentifier(v3, v5, v6) <= *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v9 = *MEMORY[0x263F28380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
      sub_221CB0880(v9);
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend_iOSLegacyIdentifier(v3, v7, v8);
}

void sub_221CAA7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_221CAA81C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221CAA82C(uint64_t a1)
{
}

void sub_221CAA834(uint64_t a1, void *a2)
{
}

void sub_221CAAB48(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t sub_221CAAE80(void *a1, const char *a2, uint64_t a3)
{
  v23[1] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_contact(a1, a2, a3);
  uint64_t v6 = v4;
  uint64_t v7 = *MEMORY[0x263EFDFD8];
  if (v4 && (objc_msgSend_isKeyAvailable_(v4, v5, *MEMORY[0x263EFDFD8]) & 1) != 0)
  {
    id v10 = 0;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    v11 = objc_opt_new();
    v14 = objc_msgSend_contactIdentifier(a1, v12, v13);
    v23[0] = v7;
    v16 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v15, (uint64_t)v23, 1);
    id v22 = 0;
    uint64_t v18 = objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(v11, v17, (uint64_t)v14, v16, &v22);
    id v10 = v22;

    uint64_t v6 = (void *)v18;
    if (!v18) {
      goto LABEL_8;
    }
  }
  if (!v10)
  {
    uint64_t v19 = objc_msgSend_iOSLegacyIdentifier(v6, v8, v9);
    goto LABEL_11;
  }
LABEL_8:
  v20 = *MEMORY[0x263F28380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_DEBUG)) {
    sub_221CB0AC8((uint64_t)v10, v20);
  }
  uint64_t v19 = 0xFFFFFFFFLL;
LABEL_11:

  return v19;
}

id sub_221CAB88C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF980];
  uint64_t v8 = objc_msgSend_count(a1, v6, v7);
  id v10 = objc_msgSend_arrayWithCapacity_(v5, v9, v8);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221CAB974;
  v17[3] = &unk_2645E70B8;
  id v19 = v4;
  id v11 = v10;
  id v18 = v11;
  id v12 = v4;
  objc_msgSend_enumerateObjectsUsingBlock_(a1, v13, (uint64_t)v17);
  v14 = v18;
  id v15 = v11;

  return v15;
}

uint64_t sub_221CAB974(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = (const char *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v2, (uint64_t)v2);
  }

  return MEMORY[0x270F9A758]();
}

id sub_221CAB9DC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF980];
  uint64_t v8 = objc_msgSend_count(a1, v6, v7);
  id v10 = objc_msgSend_arrayWithCapacity_(v5, v9, v8);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221CABAC4;
  v17[3] = &unk_2645E70B8;
  id v19 = v4;
  id v11 = v10;
  id v18 = v11;
  id v12 = v4;
  objc_msgSend_enumerateObjectsUsingBlock_(a1, v13, (uint64_t)v17);
  v14 = v18;
  id v15 = v11;

  return v15;
}

void sub_221CABAC4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v3, (uint64_t)v4);
  }
}

BOOL sub_221CAC370(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_contactType(a2, (const char *)a2, a3) == 1;
}

uint64_t sub_221CAC6F4(uint64_t a1, const char *a2)
{
  return objc_msgSend_personFromContact_(MEMORY[0x263F333F0], a2, (uint64_t)a2);
}

uint64_t sub_221CAC928(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_identifier(a2, (const char *)a2, a3);
}

uint64_t sub_221CAC930(uint64_t a1, const char *a2)
{
  return objc_msgSend_personFromContact_(MEMORY[0x263F333F0], a2, (uint64_t)a2);
}

void sub_221CAD28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_221CAD2CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221CAD2DC(uint64_t a1)
{
}

void sub_221CAD2E4(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F64720];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v17 = (id)objc_msgSend_initWithDictionary_(v5, v6, (uint64_t)v4);

  uint64_t v9 = objc_msgSend_refId(*(void **)(a1 + 32), v7, v8);
  objc_msgSend_setRefId_(v17, v10, (uint64_t)v9);

  objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v11, (uint64_t)v17);
  v14 = objc_msgSend_results(v17, v12, v13);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += objc_msgSend_count(v14, v15, v16);
}

void sub_221CAF27C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_221CAF298(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_221CAF2B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t sub_221CAF308()
{
  return v0;
}

void sub_221CAF314(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

uint64_t sub_221CAF754(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F333F0], sel_personFromContact_useABPerson_, a2);
}

void sub_221CB06D0(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v6 = objc_msgSend_changeHistoryClientIdentifier(a2, v4, v5);
  sub_221CAAB18();
  sub_221CAAB48(&dword_221CA8000, v7, v8, "%s Failed to get latest consumed change history anchor for %@, error = %@", v9, v10, v11, v12, 2u);
}

void sub_221CB077C()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  sub_221CAAB34();
  _os_log_debug_impl(&dword_221CA8000, v0, OS_LOG_TYPE_DEBUG, "%s Failed to enumerate all contacts, error = %@", (uint8_t *)v1, 0x16u);
}

void sub_221CB07FC(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[ABAssistantSyncPeople contactsForFullSync]";
  _os_log_debug_impl(&dword_221CA8000, log, OS_LOG_TYPE_DEBUG, "%s failed to enumerate all contacts", (uint8_t *)&v1, 0xCu);
}

void sub_221CB0880(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[ABAssistantSyncPeople contactsForFullSync]_block_invoke";
  _os_log_debug_impl(&dword_221CA8000, log, OS_LOG_TYPE_DEBUG, "%s ERROR: contacts for full sync are not sorted in monotonically increasing order.", (uint8_t *)&v1, 0xCu);
}

void sub_221CB0904(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v6 = objc_msgSend_changeHistoryClientIdentifier(a2, v4, v5);
  sub_221CAAB18();
  sub_221CAAB48(&dword_221CA8000, v7, v8, "%s Failed to fetch change history for %@, error = %@", v9, v10, v11, v12, 2u);
}

void sub_221CB09B0(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  id v4 = "-[ABAssistantSyncPeople newSADomainObjectFromCNContactWithIdentifier:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_221CA8000, log, OS_LOG_TYPE_DEBUG, "%s failed to fetch contact with identifier = %@, error = %@", (uint8_t *)&v3, 0x20u);
}

void sub_221CB0A48()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  sub_221CAAB34();
  _os_log_debug_impl(&dword_221CA8000, v0, OS_LOG_TYPE_DEBUG, "%s failed to fetch contact with identifier = %@", (uint8_t *)v1, 0x16u);
}

void sub_221CB0AC8(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  int v3 = "-[CNChangeHistoryContactChange(CNAssistantAdditions) iOSLegacyIdentifier]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_221CA8000, a2, OS_LOG_TYPE_DEBUG, "%s Error retrieving contact for iOS legacy identifier: %@", (uint8_t *)&v2, 0x16u);
}

void sub_221CB0B54()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  sub_221CAAB34();
  _os_log_error_impl(&dword_221CA8000, v0, OS_LOG_TYPE_ERROR, "%s Error writing sync info dictionary: %@", (uint8_t *)v1, 0x16u);
}

void sub_221CB0BD4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  sub_221CAAB34();
  _os_log_error_impl(&dword_221CA8000, v0, OS_LOG_TYPE_ERROR, "%s Cannot write sync info dictionary to path %@", (uint8_t *)v1, 0x16u);
}

void sub_221CB0C54(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = a1;
  uint64_t v6 = objc_msgSend_absoluteString(a2, v4, v5);
  int v7 = 136315394;
  uint64_t v8 = "-[CNAssistantCommandCancelPerson removeUpdatesFromCache]";
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_221CA8000, v3, OS_LOG_TYPE_DEBUG, "%s Failed to remove updates from cache for identifer %@", (uint8_t *)&v7, 0x16u);
}

void sub_221CB0D10(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[CNAssistantCommandClear clearAceDomainObjects]";
  _os_log_debug_impl(&dword_221CA8000, log, OS_LOG_TYPE_DEBUG, "%s Failed to remove the updates cache file.", (uint8_t *)&v1, 0xCu);
}

void sub_221CB0D94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB0E0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB0E84(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)sub_221CAF308();
  objc_msgSend_syncCount(v3, v4, v5);
  sub_221CAF32C();
  sub_221CAF298(&dword_221CA8000, v6, v7, "%s change sync cached %li contacts", v8, v9, v10, v11, 2u);
}

void sub_221CB0F14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB0F8C()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  sub_221CAAB34();
  sub_221CAF2B8(&dword_221CA8000, v0, v1, "%s full sync has no contacts to sync, synthesizing end anchor = %@", (uint8_t *)v2);
}

void sub_221CB1004(void *a1, void *a2, int a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  objc_msgSend_syncIndex(a2, v6, v7);
  v8[0] = 136315650;
  sub_221CAF32C();
  __int16 v9 = 1024;
  int v10 = a3;
  _os_log_debug_impl(&dword_221CA8000, v5, OS_LOG_TYPE_DEBUG, "%s full sync resuming previous full sync, self.syncIndex = %li, contactLegacyIdentifier = %d", (uint8_t *)v8, 0x1Cu);
}

void sub_221CB10C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB1138(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB11B0(void *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_syncCount(a1, a2, a3);
  uint64_t v11 = objc_msgSend_syncCount(v5, v7, v8);
  if (v11)
  {
    uint64_t v5 = objc_msgSend_allContacts(v5, v9, v10);
    uint64_t v3 = objc_msgSend_lastObject(v5, v13, v14);
    objc_msgSend_identifier(v3, v15, v16);
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = @"n/a";
  }
  int v17 = 136315650;
  id v18 = "-[ABAssistantSyncWorker beginSyncWithAnchor:validity:forKey:beginInfo:]";
  __int16 v19 = 2048;
  uint64_t v20 = v6;
  __int16 v21 = 2112;
  id v22 = v12;
  sub_221CAF314(&dword_221CA8000, a2, v10, "%s full sync cached %li contacts, max contactIdentifier = %@", (uint8_t *)&v17);
  if (v11)
  {
  }
}

void sub_221CB12C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB1338(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[ABAssistantSyncWorker beginSyncWithAnchor:validity:forKey:beginInfo:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl(&dword_221CA8000, a2, OS_LOG_TYPE_DEBUG, "%s full sync database snapshot, sequenceNumber = %i", (uint8_t *)&v2, 0x12u);
}

void sub_221CB13C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB143C(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)sub_221CAF308();
  uint64_t v6 = objc_msgSend_shortDescription(v3, v4, v5);
  sub_221CAAB34();
  sub_221CAF298(&dword_221CA8000, v7, v8, "%s clearing change history up to %@", v9, v10, v11, v12, 2u);
}

void sub_221CB14D8()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  sub_221CAAB34();
  sub_221CAF2B8(&dword_221CA8000, v0, v1, "%s calling [beginInfo resetWithValidity:%@], because syncAnchor.shouldResetSync", (uint8_t *)v2);
}

void sub_221CB1550(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)sub_221CAF308();
  uint64_t v6 = objc_msgSend_shortDescription(v3, v4, v5);
  sub_221CAAB34();
  sub_221CAF298(&dword_221CA8000, v7, v8, "%s calling [syncAnchor resetSync], sync anchor is older than last cleared change sync anchor of %@", v9, v10, v11, v12, 2u);
}

void sub_221CB15EC()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  sub_221CAAB34();
  sub_221CAF2B8(&dword_221CA8000, v0, v1, "%s syncAnchor: %@", (uint8_t *)v2);
}

void sub_221CB1664()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  sub_221CAAB34();
  sub_221CAF2B8(&dword_221CA8000, v0, v1, "%s calling [beginInfo resetWithValidity:%@], because validity not current", (uint8_t *)v2);
}

void sub_221CB16DC(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)sub_221CAF308();
  uint64_t v6 = objc_msgSend_internalGUID(v3, v4, v5);
  sub_221CAAB34();
  sub_221CAF298(&dword_221CA8000, v7, v8, "%s Redacting Me contact, saPerson.internalGUID=%@", v9, v10, v11, v12, 2u);
}

void sub_221CB1778(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB17F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB1868(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  objc_msgSend_syncIndex(a2, v4, v5);
  objc_msgSend_syncCount(a2, v6, v7);
  v9[0] = 136315650;
  sub_221CAF2EC();
  sub_221CAF314(&dword_221CA8000, v3, v8, "%s change sync trying to find next contact to sync, self.syncIndex=%li, self.syncCount=%li", (uint8_t *)v9);
}

void sub_221CB1918(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB1990(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  objc_msgSend_syncIndex(a2, v4, v5);
  objc_msgSend_syncCount(a2, v6, v7);
  v9[0] = 136315650;
  sub_221CAF2EC();
  sub_221CAF314(&dword_221CA8000, v3, v8, "%s full sync trying to find next contact to sync, self.syncIndex=%li, self.syncCount=%li", (uint8_t *)v9);
}

void sub_221CB1A40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB1AB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB1B30()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  sub_221CAAB34();
  sub_221CAF2B8(&dword_221CA8000, v0, v1, "%s > getChangeAfterAnchor:%@", (uint8_t *)v2);
}

void sub_221CB1BA8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_221CB1C20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v8 = objc_msgSend_validity(a3, v6, v7);
  uint64_t v11 = objc_msgSend_count(a3, v9, v10);
  uint64_t v14 = objc_msgSend_anchor(a3, v12, v13);
  int v15 = 136316162;
  uint64_t v16 = "-[ABAssistantSyncWorker syncSnapshotForKey:]";
  __int16 v17 = 2112;
  uint64_t v18 = a1;
  __int16 v19 = 2112;
  uint64_t v20 = v8;
  __int16 v21 = 2048;
  uint64_t v22 = v11;
  __int16 v23 = 2112;
  v24 = v14;
  _os_log_debug_impl(&dword_221CA8000, v5, OS_LOG_TYPE_DEBUG, "%s syncSnapshotForKey:%@, validity=%@, count=%li, anchor=\"%@\"", (uint8_t *)&v15, 0x34u);
}

void sub_221CB1D2C()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  sub_221CAAB34();
  sub_221CAF2B8(&dword_221CA8000, v0, v1, "%s Failed to get the store identifier, error = %@", (uint8_t *)v2);
}

void sub_221CB1DA4(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)sub_221CAF308();
  uint64_t v6 = objc_msgSend_expectedSyncKeyPrefix(v3, v4, v5);
  sub_221CAAB34();
  sub_221CAF298(&dword_221CA8000, v7, v8, "%s raising an exception because key is wrong, was expecting key with prefix \"%@\"", v9, v10, v11, v12, 2u);
}

void sub_221CB1E40()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  sub_221CAF2D0();
  sub_221CAF314(&dword_221CA8000, v0, (uint64_t)v0, "%s Failed to register %@ for contacts change history, error = %@", (uint8_t *)v1);
}

void sub_221CB1EBC()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  sub_221CAF2D0();
  sub_221CAF314(&dword_221CA8000, v0, (uint64_t)v0, "%s Failed to unregister %@ for contacts change history, error = %@", (uint8_t *)v1);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

uint64_t _AFRedactedCopyPerson()
{
  return MEMORY[0x270F0F070]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}