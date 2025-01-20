void sub_21546BE8C(uint64_t a1)
{
  CFAbsoluteTime Current;
  uint64_t v3;
  double v4;
  int64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t vars8;

  Current = CFAbsoluteTimeGetCurrent();
  v3 = *(void *)(a1 + 32);
  v4 = *(double *)(v3 + 24) - Current + 30.0;
  if (v4 <= 0.0)
  {
    MEMORY[0x270F9A6D0](v3, sel___closeDatabaseOnIvarQueue);
  }
  else
  {
    v5 = (uint64_t)(v4 * 1000000000.0);
    v6 = *(NSObject **)(v3 + 16);
    v7 = dispatch_time(0, v5);
    dispatch_source_set_timer(v6, v7, 0x7FFFFFFFFFFFFFFFuLL, v5 / 10);
  }
}

void sub_21546BF38(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21546B000, v2, OS_LOG_TYPE_DEFAULT, "Saving database.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  CSDBPerformLockedSectionForRecordStore();
  if (*(void *)(a1 + 32))
  {
    v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [*(id *)(a1 + 40) storeName];
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_21546B000, v3, OS_LOG_TYPE_DEFAULT, "%@ Destroying database.", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v8 = [*(id *)(a1 + 40) storeName];
      _IDSLogV();
    }
    v5 = objc_msgSend(*(id *)(a1 + 40), "messageStore", v8);
    MEMORY[0x2166BB560]();

    v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [*(id *)(a1 + 40) storeName];
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_21546B000, v6, OS_LOG_TYPE_DEFAULT, "%@ Closed database.", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog())
      {
        v9 = [*(id *)(a1 + 40) storeName];
        _IDSLogV();
      }
    }
  }
}

void sub_21546C1D0(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21546C14CLL);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21546C218()
{
  CSDBSqliteConnectionPerformSQL();
  CSDBSqliteConnectionPerformSQL();
  return CSDBSqliteConnectionPerformSQL();
}

uint64_t sub_21546C274(uint64_t a1)
{
  return CSDBPerformLockedSectionForQueryForWriting();
}

uint64_t sub_21546C310(uint64_t a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t sub_21546C7E4(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__performInitialHousekeepingOnIvarQueue);
}

void sub_21546C944(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF910] date];
  [v2 timeIntervalSince1970];

  id v3 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  CSDBPerformLockedSectionForQueryForWriting();
}

uint64_t sub_21546CA1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CSDBSqliteBindTextFromCFString();
  CSDBSqliteBindBlobFromCFData();
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  return MEMORY[0x270F23340](a4);
}

void sub_21546CBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21546CBFC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_21546CC0C(uint64_t a1)
{
}

void sub_21546CC14(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  CSDBPerformLockedSectionForQueryForReading();
}

uint64_t sub_21546CCB4(uint64_t a1)
{
  CSDBSqliteBindTextFromCFString();
  CSDBSqliteBindInt64();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = CSDBSqliteStatementCopyDataResult();
  return MEMORY[0x270F9A758]();
}

void sub_21546CE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21546CEA8()
{
  return CSDBPerformLockedSectionForQueryForReading();
}

uint64_t sub_21546CF38(uint64_t a1)
{
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  v2 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  while (1)
  {
    uint64_t result = CSDBSqliteStatementCopyDataResult();
    if (!result) {
      break;
    }
    id v4 = (const void *)result;
    v5 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (!v5)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v2);
      v5 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
    CFArrayAppendValue(v5, v4);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CSDBSqliteStatementInteger64ResultColumn();
    CFRelease(v4);
  }
  return result;
}

uint64_t sub_21546D0BC()
{
  return CSDBPerformLockedSectionForQueryForWriting();
}

uint64_t sub_21546D140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  return MEMORY[0x270F23340](a4);
}

uint64_t sub_21546D280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  return MEMORY[0x270F23340](a4);
}

void sub_21546D3AC(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  CSDBPerformLockedSectionForQueryForWriting();
}

uint64_t sub_21546D448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CSDBSqliteBindTextFromCFString();
  CSDBSqliteBindInt64();
  return MEMORY[0x270F23340](a4);
}

void sub_21546D5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21546D5C8(uint64_t a1)
{
  return CSDBPerformLockedSectionForQueryForReading();
}

uint64_t sub_21546D658(uint64_t a1)
{
  CSDBSqliteBindInt64();
  v2 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  while (1)
  {
    uint64_t result = CSDBSqliteStatementCopyStringResult();
    if (!result) {
      break;
    }
    id v4 = (const void *)result;
    v5 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (!v5)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFArrayCreateMutable(0, 0, v2);
      v5 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
    CFArrayAppendValue(v5, v4);
    CFRelease(v4);
  }
  return result;
}

uint64_t sub_21546D7C4(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__onIvarQueue_persistSerializedValue_forKey_valueType_);
}

uint64_t sub_21546D8E8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_serializedValueForKey:valueType:", *(void *)(a1 + 40), 0);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_21546DA30(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_serializedValuesUpToLimit:valueType:deleteContext:", *(void *)(a1 + 48), 0, *(void *)(a1 + 56));
  return MEMORY[0x270F9A758]();
}

uint64_t sub_21546DB94(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_onIvarQueue_storedKeysAfter:", *(void *)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

uint64_t sub_21546DBE4(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__onIvarQueue_deleteDatesBefore_after_);
}

uint64_t sub_21546DCA0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) rowIDCutoff];
  [*(id *)(a1 + 40) valueType];
  return MEMORY[0x270F9A6D0](v2, sel__onIvarQueue_deleteUpToRowID_valueType_);
}

uint64_t sub_21546DD64(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F232C0](a2);
}

uint64_t sub_21546DE14(uint64_t a1)
{
  uint64_t v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21546B000, v2, OS_LOG_TYPE_DEBUG, "Performing initial database housekeeping", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21546B000, v3, OS_LOG_TYPE_DEBUG, "  => Setting cache size", v7, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  CSDBSqliteSetDefaultPageCacheSize();
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21546B000, v4, OS_LOG_TYPE_DEBUG, "  => Invalidating caches", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  return [(id)objc_opt_class() _invalidateCachesForMessageStore:*(void *)(a1 + 40)];
}

uint64_t sub_21546E02C()
{
  CSDBRecordStoreCreateTablesForClass();
  return CSDBSqliteConnectionPerformSQL();
}

BOOL sub_21546E078(uint64_t a1, uint64_t a2, unsigned int a3)
{
  _IMWarn();
  unsigned int v4 = a3 >> 3;
  if (v4 <= 0x658) {
    _IMWarn();
  }
  return v4 < 0x659;
}

uint64_t sub_21546E0D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = [MEMORY[0x263EFF910] date];
  uint64_t v26 = a3;
  uint64_t v27 = 13000;
  _IMWarn();
  CSDBSqliteConnectionCommit();
  if (CSDBSqliteDatabaseCheckIntegrity())
  {
    v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21546B000, v5, OS_LOG_TYPE_DEFAULT, "Initial integrity check success", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_34:
    }
      _IDSLogV();
  }
  else
  {
    uint64_t v6 = CSDBSqliteConnectionPerformSQL();
    if (v6 != 101 && v6)
    {
      uint64_t v26 = v6;
      _IMWarn();
    }
    else
    {
      v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_21546B000, v7, OS_LOG_TYPE_DEFAULT, "Reindexing the KV Store worked.", v33, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
    if (CSDBSqliteDatabaseCheckIntegrity())
    {
      v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_21546B000, v8, OS_LOG_TYPE_DEFAULT, "Post-reindex integrity check success", v30, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        goto LABEL_34;
      }
    }
    else
    {
      int v9 = CSDBSqliteDatabaseVacuum();
      if (v9 != 101 && v9)
      {
        _IMWarn();
      }
      else
      {
        v10 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_21546B000, v10, OS_LOG_TYPE_DEFAULT, "Database vacuum success", v32, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
      }
      if (CSDBSqliteDatabaseCheckIntegrity())
      {
        uint64_t v11 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_21546B000, v11, OS_LOG_TYPE_DEFAULT, "Final integrity check success", v31, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          goto LABEL_34;
        }
      }
      else
      {
        _IMWarn();
      }
    }
  }
  CSDBSqliteConnectionBegin();
  if (a3 > 0x32C8)
  {
    _IMWarn();
    uint64_t v23 = 2;
  }
  else
  {
    CSDBSqliteConnectionBeginTransactionType();
    if (a3 >> 4 >= 0x271)
    {
      CSDBSqliteDatabaseSetVersion();
      uint64_t v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_21546B000, v12, OS_LOG_TYPE_DEFAULT, "Add date column to kvtable", v28, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"ALTER TABLE %@ ADD COLUMN %@ %@;",
                      @"kvtable",
                      @"date",
                      @"INTEGER DEFAULT 0");
      int v14 = CSDBSqliteConnectionPerformSQL();
      v15 = [MEMORY[0x263EFF910] date];
      [v15 timeIntervalSince1970];
      uint64_t v17 = (uint64_t)v16;

      v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"UPDATE %@ SET %@ = %ld;",
                      @"kvtable",
                      @"date",
                      v17);
      int v19 = CSDBSqliteConnectionPerformSQL();
      if (v19) {
        BOOL v20 = v19 == 101;
      }
      else {
        BOOL v20 = 1;
      }
      int v21 = v20;
      BOOL v22 = v14 == 101 || v14 == 0;
      if (!v22 || !v21)
      {

        CSDBSqliteConnectionCommit();
        uint64_t v23 = 2;
        goto LABEL_59;
      }
      CSDBSqliteDatabaseSetVersion();
    }
    CSDBSqliteConnectionCommit();
    CSDBSqliteConnectionPerformSQL();
    uint64_t v23 = 0;
  }
  v24 = objc_msgSend(MEMORY[0x263EFF910], "date", v26, v27);
  [v24 timeIntervalSinceDate:v4];
  _IMWarn();

LABEL_59:
  return v23;
}

uint64_t sub_21546E700(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F23358](a2, &off_264242770);
}

uint64_t sub_21546E7B0(uint64_t a1, uint64_t a2)
{
  CSDBRecordSaveStore();
  return MEMORY[0x270F232C0](a2);
}

uint64_t sub_21546E8E0(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearDatabaseCloseTimerOnIvarQueue];
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_21546E96C;
  v4[3] = &unk_264242450;
  v4[4] = v2;
  return objc_msgSend(v2, "_onIvarQueue_performBlock:initializeStore:waitUntilDone:", v4, 0, 1);
}

uint64_t sub_21546E96C(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel___closeDatabaseOnIvarQueue);
}

uint64_t sub_21546E9F8(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) path];
  return MEMORY[0x270F23318](v1);
}

void sub_21546EB44(uint64_t a1)
{
  block[8] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 68)) {
    [(id)objc_opt_class() _initializeMessageStoreIfNeeded:*(void *)(a1 + 40) path:*(void *)(a1 + 48) dataProtectionClass:*(unsigned int *)(a1 + 64)];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [(id)objc_opt_class() _invalidateCachesForMessageStore:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21546ED54;
  block[3] = &unk_264242450;
  block[4] = v2;
  dispatch_async(v3, block);
}

void sub_21546EC34(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(a1);
    double v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_21546B000, v16, OS_LOG_TYPE_ERROR, "Exception performing database block %@", (uint8_t *)&buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }

    objc_end_catch();
    JUMPOUT(0x21546EC04);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_21546ED54(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__setDatabaseCloseTimerOnIvarQueue);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CSDBCreateDirectoriesToPath()
{
  return MEMORY[0x270F23240]();
}

uint64_t CSDBCreateThreadedRecordStore()
{
  return MEMORY[0x270F23248]();
}

uint64_t CSDBGetMobileUserGID()
{
  return MEMORY[0x270F23260]();
}

uint64_t CSDBGetMobileUserUID()
{
  return MEMORY[0x270F23268]();
}

uint64_t CSDBPerformBlock()
{
  return MEMORY[0x270F23270]();
}

uint64_t CSDBPerformLockedSectionForQueryForReading()
{
  return MEMORY[0x270F23280]();
}

uint64_t CSDBPerformLockedSectionForQueryForWriting()
{
  return MEMORY[0x270F23288]();
}

uint64_t CSDBPerformLockedSectionForRecordStore()
{
  return MEMORY[0x270F23290]();
}

uint64_t CSDBRecordSaveStore()
{
  return MEMORY[0x270F232B0]();
}

uint64_t CSDBRecordStoreCreateTablesForClass()
{
  return MEMORY[0x270F232B8]();
}

uint64_t CSDBSqliteBindBlobFromCFData()
{
  return MEMORY[0x270F232C8]();
}

uint64_t CSDBSqliteBindInt64()
{
  return MEMORY[0x270F232D0]();
}

uint64_t CSDBSqliteBindTextFromCFString()
{
  return MEMORY[0x270F232D8]();
}

uint64_t CSDBSqliteConnectionBegin()
{
  return MEMORY[0x270F232E0]();
}

uint64_t CSDBSqliteConnectionBeginTransactionType()
{
  return MEMORY[0x270F232E8]();
}

uint64_t CSDBSqliteConnectionCommit()
{
  return MEMORY[0x270F232F0]();
}

uint64_t CSDBSqliteConnectionPerformSQL()
{
  return MEMORY[0x270F232F8]();
}

uint64_t CSDBSqliteDatabaseCheckIntegrity()
{
  return MEMORY[0x270F23300]();
}

uint64_t CSDBSqliteDatabaseSetVersion()
{
  return MEMORY[0x270F23308]();
}

uint64_t CSDBSqliteDatabaseVacuum()
{
  return MEMORY[0x270F23310]();
}

uint64_t CSDBSqliteSetDefaultPageCacheSize()
{
  return MEMORY[0x270F23320]();
}

uint64_t CSDBSqliteStatementCopyDataResult()
{
  return MEMORY[0x270F23328]();
}

uint64_t CSDBSqliteStatementCopyStringResult()
{
  return MEMORY[0x270F23330]();
}

uint64_t CSDBSqliteStatementInteger64ResultColumn()
{
  return MEMORY[0x270F23338]();
}

uint64_t CSDBThreadedRecordStoreEnsureDatabaseSetupWithProtection()
{
  return MEMORY[0x270F23350]();
}

uint64_t CSDBThreadedRecordStoreTeardownDatabase()
{
  return MEMORY[0x270F23360]();
}

uint64_t OSLogHandleForIDSCategory()
{
  return MEMORY[0x270F3CEF0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IDSLogTransport()
{
  return MEMORY[0x270F3CA78]();
}

uint64_t _IDSLogV()
{
  return MEMORY[0x270F3CA80]();
}

uint64_t _IDSShouldLog()
{
  return MEMORY[0x270F3CA88]();
}

uint64_t _IDSWarnV()
{
  return MEMORY[0x270F3CA90]();
}

uint64_t _IMWarn()
{
  return MEMORY[0x270F3CFA8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

void objc_end_catch(void)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x270EDA9C0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}