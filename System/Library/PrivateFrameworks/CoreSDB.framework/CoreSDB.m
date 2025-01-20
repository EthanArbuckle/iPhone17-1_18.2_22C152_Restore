uint64_t CSDBRecordGetID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

void sub_21527DD40(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    CSDBRecordStoreInvalidateCachesWithStore(v2);
  }
}

void sub_21527DD98(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8)) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    v13 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    __b[0] = 138412290;
    *(void *)&__b[1] = v14;
    v15 = "No DB path block passed into CSDBThreadedRecordStore %@";
LABEL_23:
    _os_log_impl(&dword_21527C000, v13, OS_LOG_TYPE_INFO, v15, (uint8_t *)__b, 0xCu);
    return;
  }
  uint64_t v3 = (*(uint64_t (**)(void))(v2 + 16))();
  if (!v3)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    v13 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      return;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    __b[0] = 138412290;
    *(void *)&__b[1] = v16;
    v15 = "No DB path passed into CSDBThreadedRecordStore %@";
    goto LABEL_23;
  }
  CFStringRef v4 = (const __CFString *)v3;
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  if (_IMWillLog())
  {
    objc_msgSend_currentThread(MEMORY[0x263F08B88], v5, v6);
    _IMAlwaysLog();
  }
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  *(void *)(*(void *)(a1 + 32) + 8) = CSDBRecordStoreCreateWithPath(v4);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v7)
  {
    CSDBRecordStoreSetSetupHandler(v7, *(void *)(a1 + 56));
    uint64_t Database = CSDBRecordStoreGetDatabase(*(void *)(*(void *)(a1 + 32) + 8));
    if (Database)
    {
      v9 = (void *)Database;
      CSDBSqliteDatabaseSetVersion(Database, *(_DWORD *)(a1 + 88));
      CSDBSqliteDatabaseSetDataProtectionClass((uint64_t)v9, *(_DWORD *)(a1 + 92));
      CSDBSqliteDatabaseSetLookAsideConfig((uint64_t)v9, *(void *)(*(void *)(a1 + 32) + 40), *(_DWORD *)(*(void *)(a1 + 32) + 48));
      CSDBSqliteDatabaseSetConnectionInitializer((uint64_t)v9, *(void *)(a1 + 64));
      CSDBSqliteDatabaseSetMigrationHandlers(v9, *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(*(void *)(a1 + 32) + 8));
      CSDBSqliteDatabaseSetShouldMigrateInExternalProcess((uint64_t)v9, *(unsigned char *)(a1 + 96) == 0);
      *(unsigned char *)(*(void *)(a1 + 32) + 52) = 1;
      uint64_t v10 = *(void *)(a1 + 48);
      if (v10) {
        (*(void (**)(uint64_t, void))(v10 + 16))(v10, *(void *)(a1 + 32));
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 52) = 0;
      memset(__b, 170, 0x400uLL);
      if (CFStringGetCString(v4, (char *)__b, 1024, 0x8000100u))
      {
        uid_t v11 = CSDBGetMobileUserUID();
        gid_t v12 = CSDBGetMobileUserGID();
        chown((const char *)__b, v11, v12);
      }
      else if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21527C000, v19, OS_LOG_TYPE_INFO, "Unable to change permissions on messages database.", buf, 2u);
        }
      }
      CSDBSqliteDatabaseSetVersion((uint64_t)v9, *(_DWORD *)(a1 + 88));
      CSDBSqliteDatabaseConnectionForWritingWithOwnership((uint64_t)v9, *(unsigned char *)(a1 + 97));
    }
    else if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(__b[0]) = 0;
        _os_log_impl(&dword_21527C000, v18, OS_LOG_TYPE_INFO, "Unable to get a db reference.", (uint8_t *)__b, 2u);
      }
    }
    CFRelease(v4);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        __b[0] = 138412290;
        *(void *)&__b[1] = v4;
        _os_log_impl(&dword_21527C000, v17, OS_LOG_TYPE_INFO, "Unable to create a CSDBRecordStore for path %@", (uint8_t *)__b, 0xCu);
      }
    }
    CFRelease(v4);
  }
}

uint64_t CSDBRecordGetProperty(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    sub_21528C610();
  }
  uint64_t v3 = (const void *)(int)a2;
  uint64_t v4 = (int)a2 + 9;
  uint64_t v5 = *(void *)(a1 + 8 * v4);
  if (!v5)
  {
    uint64_t v6 = sub_215281434(a1);
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v7 = v6;
    uint64_t v5 = *(void *)(v6 + 8 * v4);
    if (v5) {
      goto LABEL_9;
    }
    uint64_t v5 = *(void *)(*(void *)(*(void *)(*(void *)(v6 + 24) + 80) + 40 * (int)v3 + 16) + 24);
    if (!v5) {
      goto LABEL_9;
    }
    CFDictionaryRef v8 = *(const __CFDictionary **)(v6 + 40);
    if (v8 && CFDictionaryContainsKey(v8, v3))
    {
LABEL_8:
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v10 = *(void *)(v7 + 16);
      if (v10) {
        uid_t v11 = (uint64_t *)sub_21528159C(v10);
      }
      else {
        uid_t v11 = 0;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)(*(void *)(*(void *)(v7 + 24) + 80)
                                                                      + 40 * (int)v3
                                                                      + 16)
                                                          + 24))(v7, a2, v11);
      if (v11) {
        CSDBSqliteDatabaseReleaseSqliteConnection(v11);
      }
      uint64_t v5 = *(void *)(v7 + 8 * v4);
    }
  }
LABEL_9:
  if (*MEMORY[0x263EFFD08] == v5) {
    return 0;
  }
  else {
    return v5;
  }
}

uint64_t CSDBThreadedRecordStoreEnsureDatabaseSetupWithProtection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](a1, sel_setupDatabaseWithAllowLocalMigration_pathBlock_setupStoreHandler_connectionInitializer_versionChecker_migrationHandler_schemaVersion_dataProtectionClass_registerBlock_, a2);
}

uint64_t CSDBPerformLockedSectionForRecordStoreWithoutInitialize(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 8);
    if (v2) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v2);
    }
  }
  return result;
}

void CSDBRecordStoreInvalidateCachesWithStore(uint64_t a1)
{
  if (a1)
  {
    CSDBRecordStoreRevert(a1);
    uint64_t v2 = *(const void **)(a1 + 16);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 16) = 0;
    }
  }
}

void CSDBRecordStoreRevert(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(const void **)(a1 + 24);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 24) = 0;
    }
    uint64_t v3 = *(const void **)(a1 + 32);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 32) = 0;
    }
    uint64_t v4 = *(const void **)(a1 + 40);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 40) = 0;
    }
    uint64_t v5 = *(const void **)(a1 + 48);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 48) = 0;
    }
    CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 16);
    if (v6) {
      CFDictionaryApplyFunction(v6, (CFDictionaryApplierFunction)sub_2152805C4, 0);
    }
    *(_DWORD *)(a1 + 96) = -1;
  }
}

uint64_t CSDBSqliteDatabaseConnectionForWriting(uint64_t a1)
{
  return CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
}

void sub_21527E514(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (const void *)a1[2];
    if (v2)
    {
      CFRelease(v2);
      a1[2] = 0;
    }
    uint64_t v3 = (sqlite3 *)a1[1];
    if (v3) {
      sqlite3_close(v3);
    }
    uint64_t v4 = (void (*)(void))a1[4];
    if (v4) {
      v4(a1[3]);
    }
    free(a1);
  }
}

void CSDBSqliteBindInt64(uint64_t a1, sqlite3_int64 a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v3 = *(sqlite3_stmt **)(a1 + 8);
    if (v3)
    {
      int v5 = *(_DWORD *)(a1 + 16);
      if (v5 >= 1)
      {
        sqlite3_bind_int64(v3, v5, a2);
LABEL_12:
        ++*(_DWORD *)(a1 + 16);
        return;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    CFDictionaryRef v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = @"YES";
      if (a1)
      {
        int v8 = *(_DWORD *)(a1 + 16);
      }
      else
      {
        uint64_t v7 = @"NO";
        int v8 = 0;
      }
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 1024;
      int v12 = v8;
      _os_log_impl(&dword_21527C000, v6, OS_LOG_TYPE_INFO, "Invalid parameters passed into CSDBSqliteBindInt64 s==NULL ? %@  bindIndex = %d", (uint8_t *)&v9, 0x12u);
    }
  }
  if (a1) {
    goto LABEL_12;
  }
}

const void *sub_21527E74C(uint64_t a1, void *key)
{
  if (!a1) {
    sub_21528CAB4();
  }
  CFDictionaryRef Mutable = *(const __CFDictionary **)(a1 + 16);
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]);
    *(void *)(a1 + 16) = Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, key);
  if (!Value)
  {
    Value = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), key, Value);
    CFRelease(Value);
  }
  return Value;
}

void sub_21527E7FC(int a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = (sqlite3_stmt *)a2[1];
    if (v3) {
      sqlite3_finalize(v3);
    }
  }
  free(a2);
}

CFStringRef CSDBSqliteStatementCopyStringResult(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(sqlite3_stmt **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  if (CSDBSqliteStepWithConnection(*(void *)a1, v2) != 100) {
    return 0;
  }
  uint64_t v3 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), 0);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (const char *)v3;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  return CFStringCreateWithCString(v5, v4, 0x8000100u);
}

void CSDBSqliteDatabaseClose(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 8)) {
    goto LABEL_45;
  }
  uint64_t v2 = CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
  uint64_t v3 = (sqlite3_stmt **)sub_21527F0A8(v2, @"PRAGMA page_count", 0);
  uint64_t v4 = (sqlite3_stmt **)sub_21527F0A8(v2, @"PRAGMA freelist_count", 0);
  int v24 = 0;
  sqlite3_int64 v5 = CSDBSqliteStatementInteger64Result(v3, &v24);
  if (v24 && v24 != 100)
  {
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v26 = v24;
        uint64_t v10 = "SQLite error %d while attempting to get page_count.  Bailing on the incremental vacuum.";
LABEL_26:
        _os_log_impl(&dword_21527C000, v9, OS_LOG_TYPE_INFO, v10, buf, 8u);
      }
    }
  }
  else
  {
    int v24 = 0;
    sqlite3_int64 v6 = CSDBSqliteStatementInteger64Result(v4, &v24);
    if (!v24 || v24 == 100)
    {
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      uint64_t v7 = v5 - v6;
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      double v8 = (double)v7 / (double)v5;
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      if (v8 > 0.85 && v6 <= 511)
      {
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
        goto LABEL_43;
      }
      uint64_t v11 = (uint64_t)((double)v6 * 0.2);
      if (v8 < 0.4) {
        uint64_t v11 = v6 - v7;
      }
      if (v11 < 1) {
        goto LABEL_43;
      }
      errmsg = 0;
      CFStringRef v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"PRAGMA incremental_vacuum(%lld)", v11);
      CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
      int v14 = sqlite3_exec(*(sqlite3 **)(*(void *)(a1 + 8) + 8), CStringPtr, 0, 0, &errmsg);
      int v15 = v14;
      if (v14 && v14 != 101)
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_39;
        }
        v20 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
          goto LABEL_39;
        }
        *(_DWORD *)buf = 67109378;
        int v26 = v15;
        __int16 v27 = 2080;
        v28 = errmsg;
        v17 = "Unable to incrementally vacuum database. SQLiteResult: %d Error Message: %s";
        v18 = v20;
        uint32_t v19 = 18;
      }
      else
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_39;
        }
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
          goto LABEL_39;
        }
        *(_WORD *)buf = 0;
        v17 = "Incremental vacuum was successful.";
        v18 = v16;
        uint32_t v19 = 2;
      }
      _os_log_impl(&dword_21527C000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
LABEL_39:
      if (errmsg) {
        free(errmsg);
      }
      if (v12) {
        CFRelease(v12);
      }
      goto LABEL_43;
    }
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v26 = v24;
        uint64_t v10 = "SQLite error %d while attempting to get freelist_count.  Bailing on the incremental vacuum.";
        goto LABEL_26;
      }
    }
  }
LABEL_43:
  v21 = *(void **)(a1 + 8);
  if (v21)
  {
    sub_21527E514(v21);
    *(void *)(a1 + 8) = 0;
  }
LABEL_45:
  CFRelease(*(CFTypeRef *)a1);
  uint64_t v22 = *(const void **)(a1 + 176);
  if (v22) {
    CFRelease(v22);
  }
  free((void *)a1);
}

sqlite3_int64 CSDBSqliteStatementInteger64Result(sqlite3_stmt **a1, int *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = a1[1];
  if (!v4) {
    return 0;
  }
  if (CSDBSqliteStepWithConnection((int)*a1, v4) == 100) {
    sqlite3_int64 v5 = sqlite3_column_int64(a1[1], 0);
  }
  else {
    sqlite3_int64 v5 = 0;
  }
  if (*a1)
  {
    if (a2)
    {
      sqlite3_int64 v6 = (sqlite3 *)*((void *)*a1 + 1);
      if (v6) {
        *a2 = sqlite3_errcode(v6);
      }
    }
  }
  return v5;
}

_DWORD *sub_21527F0A8(uint64_t a1, const __CFString *key, int a3)
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 16);
  if (!v6)
  {
    valueCallBacks.version = 0;
    valueCallBacks.retain = 0;
    valueCallBacks.copyDescription = 0;
    valueCallBacks.equal = 0;
    valueCallBacks.release = (CFDictionaryReleaseCallBack)sub_21527E7FC;
    CFDictionaryRef v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], &valueCallBacks);
    *(void *)(a1 + 16) = v6;
  }
  Value = CFDictionaryGetValue(v6, key);
  if (!Value)
  {
    double v8 = (char *)CSDBCreateUTF8StringFromCFString(key);
    int v9 = CSDBSqlitePreparedStatement(*(sqlite3 **)(a1 + 8), v8, a3);
    if (v9)
    {
      uint64_t v10 = v9;
      Value = malloc_type_malloc(0x18uLL, 0x1020040EDCEB4C7uLL);
      *(void *)Value = a1;
      *((void *)Value + 1) = v10;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), key, Value);
      Value[4] = 1;
    }
    else
    {
      Value = 0;
    }
    free(v8);
  }
  return Value;
}

uint64_t CSDBRecordStoreProcessRecordStatementWithPropertyIndices(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, unint64_t a6, CFDictionaryRef theDict)
{
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v21 = v13;
  long long v22 = v13;
  long long v18 = v13;
  uint32_t v19 = (const void *)0xAAAAAAAAAAAAAAAALL;
  Columns = CSDBRecordStoreCreateReadColumns((uint64_t)a2, (_DWORD *)&v21 + 2, theDict, 0, 0);
  v20 = Columns;
  if (!Columns) {
    return 0;
  }
  int v15 = Columns;
  *(void *)&long long v21 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if ((void)v21)
  {
    *(void *)&long long v18 = a1;
    *((void *)&v18 + 1) = a2;
    uint32_t v19 = sub_21527E74C(a1, a2);
    *(void *)&long long v22 = a4;
    *((void *)&v22 + 1) = a5;
    unint64_t v23 = a6;
    HIDWORD(v21) = -1;
    CSDBSqliteStatementSendResults(a3, (unsigned int (*)(void *, uint64_t))sub_215282E6C, (uint64_t)&v18);
    int v15 = v20;
    uint64_t v16 = v21;
  }
  else
  {
    uint64_t v16 = 0;
  }
  free(v15);
  return v16;
}

uint64_t CSDBSqliteStatementSendResults(void *a1, unsigned int (*a2)(void *, uint64_t), uint64_t a3)
{
  if (!a1 || !a1[1] || !*a1 || !*(void *)(*a1 + 8)) {
    return 1;
  }
  while (1)
  {
    CFDictionaryRef v6 = (sqlite3_stmt *)a1[1];
    if (!v6)
    {
      uint64_t v8 = 1;
LABEL_11:
      sub_2152891A8(*(sqlite3 **)(*a1 + 8), (uint64_t)"CSDBSqliteStatementSendResults");
      goto LABEL_13;
    }
    uint64_t v7 = CSDBSqliteStepWithConnection(*a1, v6);
    if (v7 != 100) {
      break;
    }
    if (a2(a1, a3))
    {
      uint64_t v8 = 100;
      goto LABEL_13;
    }
  }
  uint64_t v8 = v7;
  if ((v7 - 102) <= 0xFFFFFFFD) {
    goto LABEL_11;
  }
  uint64_t v8 = 101;
LABEL_13:
  CSDBSqliteStatementReset(a1);
  return v8;
}

#error "21527F3D8: call analysis failed (funcsize=23)"

void CSDBCheckResultWithStatement(void **a1, char *exc_buf, uint64_t a3, uint64_t a4, sqlite3_stmt *a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  if ((int)a3 > 25)
  {
    if ((a3 - 100) < 2) {
      return;
    }
    if (a3 != 26) {
      goto LABEL_15;
    }
LABEL_8:
    if (*a1)
    {
      unsigned int v29 = a3;
      uint64_t v30 = a4;
      v32 = (sqlite3 *)exc_buf;
      v34 = a5;
      objc_msgSend_UTF8String(*a1, exc_buf, a3);
      int v24 = _sqlite3_integrity_check();
      int v25 = IMOSLoggingEnabled();
      if (!v24)
      {
        if (v25)
        {
          int v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v36 = 0;
            _os_log_impl(&dword_21527C000, v26, OS_LOG_TYPE_INFO, "Exiting as we were handed a false negative corruption by sqlite and we want to clean up bad state in memory", v36, 2u);
          }
        }
        exit(2);
      }
      if (v25)
      {
        __int16 v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v37 = 0;
          _os_log_impl(&dword_21527C000, v27, OS_LOG_TYPE_INFO, "SQLite confirms DB is corrupted. About to move it aside", v37, 2u);
        }
      }
      sub_215288A60((uint64_t)a1, v32, v29, v30, v34);
    }
    if (IMOSLoggingEnabled())
    {
      long long v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21527C000, v22, OS_LOG_TYPE_INFO, "We had a corruption but had a nil DB path", buf, 2u);
      }
    }
    return;
  }
  if (!a3) {
    return;
  }
  if (a3 != 10)
  {
    if (a3 != 11)
    {
LABEL_15:
      sub_215288524((sqlite3 *)exc_buf, a4, a5, a4, (int)a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
        a20,
        a21,
        a22);
      return;
    }
    goto LABEL_8;
  }
  if (qword_267866AF8 != -1)
  {
    v31 = exc_buf;
    v33 = a5;
    uint64_t v23 = a4;
    dispatch_once(&qword_267866AF8, &unk_26C5DE000);
    exc_buf = v31;
    a5 = v33;
    a4 = v23;
  }
  if (byte_267866B00) {
    goto LABEL_15;
  }
}

#error "21527F694: call analysis failed (funcsize=32)"

char *CSDBRecordStoreCreateReadColumns(uint64_t a1, _DWORD *a2, CFDictionaryRef theDict, uint64_t (*a4)(uint64_t a1), uint64_t (*(*a5)())(uint64_t a1, int a2, uint64_t a3))
{
  if (a4) {
    uint64_t v7 = a4;
  }
  else {
    uint64_t v7 = sub_21527FBAC;
  }
  v43 = v7;
  if (a5) {
    uint64_t v8 = a5;
  }
  else {
    uint64_t v8 = sub_21527FB98;
  }
  v41 = v8;
  if (theDict)
  {
    int Count = CFDictionaryGetCount(theDict);
    LODWORD(v11) = Count;
    if (Count >= 1)
    {
      v40 = a2;
      v42 = (char *)malloc_type_calloc(Count, 0x20uLL, 0x1080040A9F9A45FuLL);
      int v39 = v11;
      if ((int)v11 >= 32) {
        unsigned int v12 = 32;
      }
      else {
        unsigned int v12 = v11;
      }
      size_t v13 = 8 * v12;
      int v14 = (const void **)malloc_type_malloc(v13, 0x80040B8603338uLL);
      int v15 = (const void **)malloc_type_malloc(v13, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(theDict, v14, v15);
      unint64_t v16 = 0;
      int v17 = 0;
      uint64_t v18 = 8 * v11;
      do
      {
        uint64_t v19 = *(void *)(a1 + 80);
        unsigned int v20 = v14[v16 / 8];
        uint64_t v21 = v19 + 40 * v20;
        char v23 = *(unsigned char *)(v21 + 24);
        long long v22 = (unsigned char *)(v21 + 24);
        if ((v23 & 4) == 0)
        {
          int v24 = &v42[32 * v17];
          *(_DWORD *)int v24 = v15[v16 / 8];
          uint64_t v25 = v19 + 40 * v20;
          uint64_t v27 = *(void *)(v25 + 8);
          int v26 = (void *)(v25 + 8);
          *((void *)v24 + 1) = v43(v27);
          if (*v22)
          {
            *((void *)v24 + 2) = 0;
          }
          else
          {
            *((void *)v24 + 2) = ((uint64_t (*)(void))v41)(*v26);
            *((void *)v24 + 3) = v14[v16 / 8];
          }
          ++v17;
        }
        v16 += 8;
      }
      while (v18 != v16);
      free(v14);
      free(v15);
      LODWORD(v11) = v39;
      a2 = v40;
      v28 = v42;
      goto LABEL_35;
    }
LABEL_34:
    v28 = 0;
    goto LABEL_35;
  }
  uint64_t v29 = *(unsigned int *)(a1 + 72);
  if ((int)v29 < 1)
  {
    LODWORD(v11) = 0;
    goto LABEL_34;
  }
  LODWORD(v11) = 0;
  uint64_t v30 = (unsigned int *)(*(void *)(a1 + 80) + 24);
  do
  {
    unsigned int v31 = *v30;
    v30 += 10;
    size_t v11 = (((v31 >> 2) & 1) == 0) + v11;
    --v29;
  }
  while (v29);
  if (!v11) {
    goto LABEL_34;
  }
  v28 = (char *)malloc_type_calloc(v11, 0x20uLL, 0x1080040A9F9A45FuLL);
  if (*(int *)(a1 + 72) >= 1)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    do
    {
      uint64_t v35 = *(void *)(a1 + 80) + v32;
      if ((*(unsigned char *)(v35 + 24) & 4) != 0)
      {
        uint64_t v36 = v34;
      }
      else
      {
        uint64_t v36 = (v34 + 1);
        v37 = &v28[32 * (int)v34];
        *(_DWORD *)v37 = v36;
        *((void *)v37 + 1) = v43(*(void *)(v35 + 8));
        if (*(unsigned char *)(v35 + 24))
        {
          *((void *)v37 + 2) = 0;
        }
        else
        {
          *((void *)v37 + 2) = ((uint64_t (*)(void))v41)(*(void *)(v35 + 8));
          *((void *)v37 + 3) = v33;
        }
      }
      ++v33;
      v32 += 40;
      uint64_t v34 = v36;
    }
    while (v33 < *(int *)(a1 + 72));
  }
LABEL_35:
  *a2 = v11;
  return v28;
}

uint64_t CSDBRecordStoreGetRecordIDForRowid(uint64_t a1, uint64_t a2)
{
  uint64_t value = a2;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = a2;
  if ((unint64_t)(a2 - 0x80000000) <= 0xFFFFFFFF7FFFFFFELL)
  {
    CFSetRef Mutable = *(const __CFSet **)(a1 + 120);
    if (!Mutable)
    {
      sqlite3_int64 v5 = malloc_type_malloc(0x400uLL, 0x100004000313F17uLL);
      *(void *)(a1 + 112) = v5;
      if (!v5) {
        return 0xFFFFFFFFLL;
      }
      CFAllocatorRef v6 = CFGetAllocator((CFTypeRef)a1);
      CFSetRef Mutable = CFSetCreateMutable(v6, 128, &stru_26C5DDFB0);
      *(void *)(a1 + 120) = Mutable;
      *(_DWORD *)(a1 + 108) = 128;
    }
    uint64_t v7 = *(unsigned char **)(a1 + 112);
    uint64_t v8 = CFSetGetValue(Mutable, &value);
    if (v8) {
      return ((unint64_t)(v8 - v7) >> 3) | 0x80000000;
    }
    uint64_t v9 = *(unsigned int *)(a1 + 104);
    if (*(_DWORD *)(a1 + 108) != v9)
    {
LABEL_16:
      int v14 = &v7[8 * (int)v9];
      *int v14 = value;
      *(_DWORD *)(a1 + 104) = v9 + 1;
      uint64_t v2 = v9 | 0x80000000;
      CFSetSetValue(*(CFMutableSetRef *)(a1 + 120), v14);
      return v2;
    }
    int v10 = (3 * (int)v9) >> 1;
    size_t v11 = malloc_type_realloc(v7, 8 * v10, 0x474D10FDuLL);
    if (v11)
    {
      uint64_t v7 = v11;
      if (v11 != *(unsigned char **)(a1 + 112))
      {
        CFSetRemoveAllValues(*(CFMutableSetRef *)(a1 + 120));
        if ((int)v9 >= 1)
        {
          uint64_t v12 = v9;
          size_t v13 = v7;
          do
          {
            CFSetSetValue(*(CFMutableSetRef *)(a1 + 120), v13);
            v13 += 8;
            --v12;
          }
          while (v12);
        }
        *(void *)(a1 + 112) = v7;
      }
      *(_DWORD *)(a1 + 108) = v10;
      goto LABEL_16;
    }
    return 0xFFFFFFFFLL;
  }
  return v2;
}

UInt8 *CSDBCreateUTF8StringFromCFString(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Length = (int)CFStringGetLength(a1);
  int MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x4A307CFDuLL);
  v7.location = 0;
  v7.length = Length;
  CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, v4, MaximumSizeForEncoding, &usedBufLen);
  v4[usedBufLen] = 0;
  return v4;
}

uint64_t (*sub_21527FB98())(uint64_t a1, int a2, uint64_t a3)
{
  return sub_215281018;
}

uint64_t sub_21527FBAC(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = qword_21528D9A0;
  do
  {
    uint64_t v3 = *v2;
    v2 += 2;
    if (v3 == a1) {
      break;
    }
    ++v1;
  }
  while (v1 != 4);
  return qword_21528D9A0[2 * v1 + 1];
}

sqlite3_stmt *CSDBSqlitePreparedStatement(sqlite3 *db, char *zSql, int a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  ppStmt = 0;
  if (!db) {
    return 0;
  }
  do
    int v6 = sqlite3_prepare_v2(db, zSql, -1, &ppStmt, 0);
  while ((v6 - 5) < 2);
  CFRange v7 = ppStmt;
  if (v6 || !ppStmt)
  {
    if (a3)
    {
      if (!ppStmt) {
        return v7;
      }
    }
    else
    {
      int v17 = sqlite3_errmsg(db);
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v19 = sqlite3_extended_errcode(db);
          int v23 = 136315906;
          *(void *)int v24 = "warning: ";
          *(_WORD *)&v24[8] = 2080;
          *(void *)&v24[10] = zSql;
          *(_WORD *)&v24[18] = 2080;
          uint64_t v25 = v17;
          __int16 v26 = 1024;
          int v27 = v19;
          _os_log_impl(&dword_21527C000, v18, OS_LOG_TYPE_INFO, "%s Could not compile statement %s: %s (%d)\n", (uint8_t *)&v23, 0x26u);
        }
      }
      CFRange v7 = ppStmt;
      if (!ppStmt) {
        return v7;
      }
    }
    sqlite3_finalize(v7);
    return 0;
  }
  if (byte_26AB04408)
  {
    if (!(_BYTE)dword_26AB043CC) {
      return v7;
    }
  }
  else
  {
    byte_26AB04408 = 1;
    uint64_t v8 = getenv("CSDBSQLEXPLAIN");
    BYTE1(dword_26AB043CC) = v8 != 0;
    uint64_t v9 = getenv("CSDBSQLEXPLAIN_TABLES");
    HIBYTE(dword_26AB043CC) = v9 != 0;
    int v10 = getenv("CSDBSQLEXPLAIN_ONLY_NON_INDEXED");
    BYTE2(dword_26AB043CC) = v10 != 0;
    HIBYTE(dword_26AB043CC) = ((unint64_t)v9 | (unint64_t)v10) != 0;
    LOBYTE(dword_26AB043CC) = ((unint64_t)v8 | (unint64_t)v9 | (unint64_t)v10) != 0;
    if (!((unint64_t)v8 | (unint64_t)v9 | (unint64_t)v10)) {
      return v7;
    }
  }
  *(void *)&v24[4] = zSql;
  *(void *)&v24[12] = 2863311360;
  *(_DWORD *)int v24 = -1431655766;
  int v23 = dword_26AB043CC;
  CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"EXPLAIN QUERY PLAN %s", zSql);
  uint64_t v12 = CSDBCreateUTF8StringFromCFString(v11);
  sqlite3_exec(db, (const char *)v12, (int (__cdecl *)(void *, int, char **, char **))sub_215286494, &v23, 0);
  free(v12);
  if (v11) {
    CFRelease(v11);
  }
  if (*(_DWORD *)&v24[16])
  {
    if (IMOSLoggingEnabled())
    {
      size_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21527C000, v13, OS_LOG_TYPE_INFO, "----------------------------\n", buf, 2u);
      }
    }
    int v14 = (*(_DWORD *)&v24[16])--;
    if (v14 >= 2)
    {
      do
      {
        if (IMOSLoggingEnabled())
        {
          int v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21527C000, v15, OS_LOG_TYPE_INFO, "\n", buf, 2u);
          }
        }
      }
      while ((*(_DWORD *)&v24[16])-- > 1);
    }
  }
  return ppStmt;
}

UInt8 *CSDBSqliteBindTextFromCFString(UInt8 *result, const __CFString *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (a2 && *((void *)result + 1) && *((int *)result + 4) >= 1)
    {
      result = CSDBCreateUTF8StringFromCFString(a2);
      if (result) {
        result = (UInt8 *)sqlite3_bind_text(*((sqlite3_stmt **)v2 + 1), *((_DWORD *)v2 + 4), (const char *)result, -1, MEMORY[0x263EF88C0]);
      }
    }
    ++*((_DWORD *)v2 + 4);
  }
  return result;
}

uint64_t CSDBSqliteDatabaseConnectionForReading(uint64_t a1)
{
  return CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
}

uint64_t CSDBSqliteStatementIntegerResult(sqlite3_stmt **a1, int *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = a1[1];
  if (!v4) {
    return 0;
  }
  if (CSDBSqliteStepWithConnection((int)*a1, v4) == 100)
  {
    uint64_t v5 = sqlite3_column_int(a1[1], 0);
    if (!a2) {
      return v5;
    }
    goto LABEL_8;
  }
  uint64_t v5 = 0;
  if (a2) {
LABEL_8:
  }
    *a2 = sqlite3_errcode(*((sqlite3 **)*a1 + 1));
  return v5;
}

uint64_t CSDBRecordStoreGetSequenceNumber(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = sub_21528159C(a1);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (uint64_t *)v1;
  uint64_t v3 = (int)CSDBSqliteConnectionIntegerForProperty(v1, @"__CSDBRecordSequenceNumber");
  CSDBSqliteDatabaseReleaseSqliteConnection(v2);
  return v3;
}

uint64_t *CSDBSqliteDatabaseReleaseSqliteConnection(uint64_t *result)
{
  uint64_t v1 = *result;
  if (*result)
  {
    if ((*(unsigned char *)(v1 + 84) & 4) != 0) {
      return (uint64_t *)pthread_mutex_unlock((pthread_mutex_t *)(v1 + 88));
    }
  }
  return result;
}

uint64_t CSDBSqliteConnectionIntegerForProperty(uint64_t a1, const __CFString *a2)
{
  BOOL v3 = 0;
  LODWORD(result) = sub_215287504(a1, a2, 0, &v3);
  if (v3) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t CSDBPerformLockedSectionForQueryForReading(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v5 = result;
        uint64_t result = *(void *)(result + 8);
        if (result)
        {
          uint64_t result = CSDBRecordStoreGetDatabase(result);
          if (result)
          {
            uint64_t v6 = result;
            uint64_t result = CSDBSqliteDatabaseStatementForReading(result, a2);
            if (result)
            {
              uint64_t v7 = result;
              if (*(void *)(result + 8))
              {
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(a3 + 16))(a3, *(void *)(v5 + 8), v6, result);
                return CSDBSqliteStatementReset(v7);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CSDBPerformLockedSectionForQueryForWriting(uint64_t result, const __CFString *a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v5 = result;
        uint64_t result = *(void *)(result + 8);
        if (result)
        {
          uint64_t result = CSDBRecordStoreGetDatabase(result);
          if (result)
          {
            uint64_t v6 = result;
            uint64_t result = (uint64_t)CSDBSqliteDatabaseStatementForWriting(result, a2);
            if (result)
            {
              uint64_t v7 = result;
              if (*(void *)(result + 8))
              {
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(a3 + 16))(a3, *(void *)(v5 + 8), v6, result);
                return CSDBSqliteStatementReset(v7);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

_DWORD *CSDBSqliteDatabaseStatementForWriting(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (uint64_t *)v3;
  uint64_t v5 = sub_21527F0A8(v3, a2, 0);
  uint64_t v6 = *v4;
  if (*v4 && (*(unsigned char *)(v6 + 84) & 4) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)(v6 + 88));
  }
  return v5;
}

uint64_t CSDBSqliteDatabaseConnectionForWritingWithOwnership(uint64_t result, char a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if ((*(unsigned char *)(result + 84) & 4) != 0) {
      pthread_mutex_lock((pthread_mutex_t *)(result + 88));
    }
    uint64_t result = *(void *)(v3 + 8);
    if (!result)
    {
      CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(*(CFStringRef *)v3);
      uint64_t v5 = (char *)malloc_type_calloc(MaximumSizeOfFileSystemRepresentation + 1, 1uLL, 0x100004077774924uLL);
      CFStringGetFileSystemRepresentation(*(CFStringRef *)v3, v5, MaximumSizeOfFileSystemRepresentation);
      char v12 = 0;
      uint64_t v6 = sub_215285890(v3, v5, &v12, a2);
      if (v6 || v12 && (uint64_t v6 = sub_215285890(v3, v5, &v12, 1)) != 0)
      {
        id v7 = [NSString alloc];
        size_t v8 = strlen(v5);
        int v10 = objc_msgSend_initWithBytes_length_encoding_(v7, v9, (uint64_t)v5, v8, 1);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = sub_215285D08;
        v11[3] = &unk_264238C88;
        v11[4] = v10;
        dispatch_async(MEMORY[0x263EF83A0], v11);

        *(void *)(v3 + 8) = v6;
        *uint64_t v6 = (sqlite3 *)v3;
      }
      free(v5);
      return *(void *)(v3 + 8);
    }
  }
  return result;
}

uint64_t CSDBPerformLockedSectionForDatabase(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = result;
      uint64_t result = *(void *)(result + 8);
      if (result)
      {
        uint64_t result = CSDBRecordStoreGetDatabase(result);
        if (result)
        {
          uint64_t v4 = *(void *)(v3 + 8);
          uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16);
          return v5(a2, v4, result);
        }
      }
    }
  }
  return result;
}

uint64_t CSDBRecordStoreGetDatabase(uint64_t a1)
{
  if (!a1) {
    sub_21528C744();
  }
  uint64_t result = *(void *)(a1 + 8);
  if (!result)
  {
    uint64_t v3 = CSDBSqliteDatabaseCreateWithPath(*(const __CFString **)a1);
    *(void *)(a1 + 8) = v3;
    if (!v3) {
      sub_21528C770();
    }
    CSDBSqliteDatabaseSetSetupHandler((uint64_t)v3, (uint64_t)sub_215281BD8, a1);
    return *(void *)(a1 + 8);
  }
  return result;
}

uint64_t CSDBSqliteStatementPerform(void *a1)
{
  if (a1 && (uint64_t v1 = (sqlite3_stmt *)a1[1]) != 0) {
    return CSDBSqliteStepWithConnection(*a1, v1);
  }
  else {
    return 1;
  }
}

uint64_t CSDBPerformBlock(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_performBlock_waitUntilDone_(a1, a2, (uint64_t)a2, a3);
}

uint64_t CSDBSqliteDatabaseFromThreadedRecordStoreRef(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 8)) != 0) {
    return CSDBRecordStoreGetDatabase(v1);
  }
  else {
    return 0;
  }
}

_DWORD *CSDBSqliteConnectionStatementForSQL(uint64_t a1, const __CFString *a2)
{
  return sub_21527F0A8(a1, a2, 0);
}

uint64_t CSDBPerformBlockAfterDelay(void *a1, const char *a2)
{
  return objc_msgSend_performBlock_afterDelay_(a1, a2, (uint64_t)a2);
}

uint64_t CSDBThreadedRecordStoreOwnsCurrentThread(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](a1, sel_ownsCurrentThreadOtherwiseAssert_, a2);
}

void CSDBSqliteConnectionFlushStatementCache(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(const void **)(a1 + 16);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 16) = 0;
    }
  }
}

uint64_t CSDBRecordStoreProcessStatement(uint64_t a1, void *a2, void *a3, uint64_t a4, unint64_t a5)
{
  return CSDBRecordStoreProcessRecordStatementWithPropertyIndices(a1, a2, a3, a4, 0, a5, 0);
}

void sub_2152805C4(int a1, CFDictionaryRef theDict)
{
}

uint64_t sub_2152805E0(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__teardownDatabaseOnQueue(*(void **)(a1 + 32), a2, a3);
}

uint64_t CSDBThreadedRecordStoreTeardownDatabase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](a1, sel_teardownDatabase, a3);
}

uint64_t CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(uint64_t a1, void (*a2)(uint64_t, uint64_t *), void (*a3)(uint64_t, uint64_t *), int a4, unsigned int a5, CFErrorRef *a6)
{
  if (a1
    && !a2
    && !a3
    && !*(void *)(a1 + 24)
    && !*(void *)(a1 + 32)
    && !*(void *)(a1 + 40)
    && !*(void *)(a1 + 80)
    && !*(void *)(a1 + 16))
  {
    return 1;
  }
  uint64_t Database = CSDBRecordStoreGetDatabase(a1);
  uint64_t v13 = CSDBSqliteDatabaseConnectionForWriting(Database);
  if (!v13)
  {
    if (!a6) {
      return 0;
    }
    CFErrorRef v24 = CFErrorCreate(0, @"CSDBRecord", 1, 0);
    BOOL v25 = 0;
LABEL_45:
    *a6 = v24;
    return v25;
  }
  int v14 = (uint64_t *)v13;
  CSDBSqliteConnectionBeginTransactionType(v13, a5);
  int v15 = CSDBSqliteConnectionIntegerForProperty((uint64_t)v14, @"__CSDBRecordSequenceNumber");
  if (!a1) {
    sub_21528C8A4();
  }
  int v16 = v15;
  if (a4)
  {
    int v17 = *(_DWORD *)(a1 + 96);
    if (v17 != -1 && v15 != v17)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s: database changed externally\n", "_Bool CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(CSDBRecordStoreRef, CSDBRecordStoreSaveCallback, CSDBRecordStoreSaveCallback, CSDBRecordConflictPolicy, CSDBSqliteTransactionType, CFErrorRef *)");
      if (a6) {
        *a6 = CFErrorCreate(0, @"CSDBRecord", 2, 0);
      }
      CSDBSqliteDatabaseReleaseSqliteConnection(v14);
      return 0;
    }
  }
  uint64_t context = a1;
  uint64_t v29 = v14;
  uint64_t v30 = 0;
  if (a2) {
    a2(a1, v14);
  }
  sub_215282000(&context);
  sub_215282090(&context);
  if (context)
  {
    if (v29)
    {
      CFDictionaryRef v18 = *(const __CFDictionary **)(context + 32);
      if (v18)
      {
        *(void *)(context + 32) = 0;
        CFDictionaryApplyFunction(v18, (CFDictionaryApplierFunction)sub_215284624, &context);
        CFRelease(v18);
        int v19 = *(const void **)(context + 32);
        if (v19)
        {
          CFRelease(v19);
          *(void *)(context + 32) = 0;
        }
      }
    }
  }
  CFDictionaryRef v20 = *(const __CFDictionary **)(a1 + 80);
  if (v20)
  {
    CFDictionaryApplyFunction(v20, (CFDictionaryApplierFunction)sub_215282134, &context);
    CFRelease(*(CFTypeRef *)(a1 + 80));
    *(void *)(a1 + 8CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284910, 0) = 0;
  }
  int v21 = v16 + 1;
  *(_DWORD *)(a1 + 96) = v16 + 1;
  CFDictionaryRef v22 = *(const __CFDictionary **)(a1 + 16);
  if (v22)
  {
    CFDictionaryApplyFunction(v22, (CFDictionaryApplierFunction)sub_215282188, (void *)v21);
    int v21 = *(_DWORD *)(a1 + 96);
  }
  CSDBSqliteConnectionSetIntegerForProperty(v14, @"__CSDBRecordSequenceNumber", v21);
  if (a3) {
    a3(a1, v14);
  }
  if (a5 == 0xFFFF)
  {
    int v23 = 101;
  }
  else
  {
    int v23 = CSDBSqliteConnectionCommit((uint64_t)v14);
    CSDBSqliteConnectionCheckNoConnectionError((uint64_t)v14, v23, (uint64_t)"_Bool CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(CSDBRecordStoreRef, CSDBRecordStoreSaveCallback, CSDBRecordStoreSaveCallback, CSDBRecordConflictPolicy, CSDBSqliteTransactionType, CFErrorRef *)");
  }
  CSDBSqliteDatabaseReleaseSqliteConnection(v14);
  BOOL v25 = v23 == 101 || v23 == 0;
  if (a6 && !v25)
  {
    CFErrorRef v24 = CFErrorCreate(0, @"CSDBRecordSQLite", v23, 0);
    goto LABEL_45;
  }
  return v25;
}

void CSDBRecordStoreDestroy(void *a1)
{
  CFDictionaryRef v2 = (const __CFDictionary *)*((void *)a1 + 2);
  if (v2)
  {
    CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)sub_2152821B4, 0);
    CFRelease(*((CFTypeRef *)a1 + 2));
  }
  CFDictionaryRef v3 = (const __CFDictionary *)*((void *)a1 + 3);
  if (v3)
  {
    CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_2152821D0, 0);
    CFRelease(*((CFTypeRef *)a1 + 3));
  }
  uint64_t v4 = (const void *)*((void *)a1 + 6);
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *((void *)a1 + 1);
  if (v5) {
    CSDBSqliteDatabaseClose(v5);
  }
  uint64_t v6 = (const void *)*((void *)a1 + 4);
  if (v6) {
    CFRelease(v6);
  }
  id v7 = (const void *)*((void *)a1 + 5);
  if (v7) {
    CFRelease(v7);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  size_t v8 = (const void *)*((void *)a1 + 9);
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = (const void *)*((void *)a1 + 15);
  if (v9) {
    CFRelease(v9);
  }
  int v10 = (void *)*((void *)a1 + 14);
  if (v10) {
    free(v10);
  }
  free(a1);
}

uint64_t CSDBRecordSaveStore(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  CFErrorRef err = 0;
  uint64_t v1 = CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, 0, 0, 0, 1u, &err);
  if ((v1 & 1) == 0 && err)
  {
    CFStringRef Domain = CFErrorGetDomain(err);
    if (Domain) {
      CFDictionaryRef v3 = CSDBCreateUTF8StringFromCFString(Domain);
    }
    else {
      CFDictionaryRef v3 = 0;
    }
    if (v3) {
      uint64_t v4 = (const char *)v3;
    }
    else {
      uint64_t v4 = "(no domain)";
    }
    int Code = CFErrorGetCode(err);
    syslog(3, "Error saving record store: %s/%i", v4, Code);
    if (v3) {
      free(v3);
    }
    CFRelease(err);
  }
  return v1;
}

uint64_t CSDBPerformLockedSectionForRecordStore(uint64_t result, uint64_t a2)
{
  if (result && a2)
  {
    uint64_t v2 = *(void *)(result + 8);
    if (v2) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v2);
    }
  }
  return result;
}

uint64_t CSDBPerformLocked(uint64_t result, uint64_t a2)
{
  if (result && a2)
  {
    if (*(void *)(result + 8)) {
      return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
    }
  }
  return result;
}

uint64_t sub_215280BA0(int a1)
{
  return fprintf((FILE *)*MEMORY[0x263EF8348], "%d", a1);
}

CFStringRef sub_215280BDC(const __CFString *theString)
{
  if (theString) {
    return CFStringCreateCopy(0, theString);
  }
  return theString;
}

uint64_t CSDBRecordGetTypeID()
{
  return qword_26AB043F8;
}

CFDataRef sub_215280C28()
{
  qword_26AB043F8 = _CFRuntimeRegisterClass();
  CFDataRef result = CFDataCreate(0, 0, 0);
  qword_26AB043F0 = (uint64_t)result;
  return result;
}

uint64_t CSDBRecordCreate(uint64_t a1)
{
  return sub_215280C70(a1, -1);
}

uint64_t sub_215280C70(uint64_t a1, int a2)
{
  int v4 = 8 * *(_DWORD *)(a1 + 72) + 72;
  pthread_once(&stru_26AB04368, (void (*)(void))sub_215280C28);
  size_t v5 = v4 - 16;
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v7 = Instance;
  if (Instance)
  {
    bzero((void *)(Instance + 16), v5);
    *(void *)(v7 + 24) = a1;
    *(_DWORD *)(v7 + 32) = a2;
    *(_DWORD *)(v7 + 36) = -1;
    size_t v8 = *(void (**)(uint64_t))(a1 + 8);
    if (v8) {
      v8(v7);
    }
  }
  return v7;
}

uint64_t CSDBRecordGetSequenceNumber(uint64_t a1)
{
  return *(int *)(a1 + 36);
}

uint64_t CSDBRecordCreateCopy(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = sub_215280C70(v2, *(_DWORD *)(a1 + 32));
  uint64_t v4 = v3;
  if (v3) {
    *(unsigned char *)(v3 + 56) = *(unsigned char *)(a1 + 56);
  }
  uint64_t v5 = *(unsigned int *)(v2 + 72);
  if ((int)v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a1 + 72;
    do
    {
      sub_215280DA8(v4, v6, *(void *)(v7 + 8 * v6), 1);
      ++v6;
    }
    while (v5 != v6);
  }
  return v4;
}

uint64_t CSDBRecordGetClass(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t sub_215280DA8(uint64_t result, int a2, uint64_t a3, int a4)
{
  if (result && (!a3 || *(void *)(result + 8 * a2 + 72) != a3))
  {
    uint64_t v4 = *MEMORY[0x263EFFD08];
    if (a4) {
      uint64_t v4 = 0;
    }
    if (!a3) {
      a3 = v4;
    }
    return sub_215281018(result, a2, a3);
  }
  return result;
}

void CSDBRecordDestroy(void *context)
{
  uint64_t v2 = *(void (**)(void *))(*((void *)context + 3) + 24);
  if (v2) {
    v2(context);
  }
  uint64_t v3 = (const void *)*((void *)context + 5);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *((void *)context + 3);
  if (*(int *)(v4 + 72) >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *MEMORY[0x263EFFD08];
    uint64_t v7 = 16;
    do
    {
      size_t v8 = *(void (**)(void))(*(void *)(*(void *)(v4 + 80) + v7) + 8);
      if (v8)
      {
        uint64_t v9 = *((void *)context + v5 + 9);
        if (v9 && v9 != v6)
        {
          v8();
          uint64_t v4 = *((void *)context + 3);
        }
      }
      ++v5;
      v7 += 40;
    }
    while (v5 < *(int *)(v4 + 72));
  }
  CFDictionaryRef v11 = (const __CFDictionary *)*((void *)context + 6);
  if (v11)
  {
    CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)sub_215280EEC, context);
    CFRelease(*((CFTypeRef *)context + 6));
  }
  char v12 = (const void *)*((void *)context + 8);
  if (v12)
  {
    CFRelease(v12);
  }
}

uint64_t sub_215280EEC(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*MEMORY[0x263EFFD08] != a2 && a2)
  {
    uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(*(void *)(a3 + 24) + 80)
                                                       + 40 * (int)result
                                                       + 16)
                                           + 8);
    if (v3) {
      return v3(a2);
    }
  }
  return result;
}

uint64_t CSDBRecordInitializeProperty(uint64_t a1, int a2, uint64_t a3)
{
  return sub_215280DA8(a1, a2, a3, 0);
}

uint64_t CSDBRecordUnloadProperty(uint64_t a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v4 = *(__CFDictionary **)(a1 + 40);
  if (v4) {
    CFDictionaryRemoveValue(v4, (const void *)a2);
  }
  CFDictionaryRef v5 = *(const __CFDictionary **)(a1 + 48);
  if (v5)
  {
    uint64_t v2 = (int)v2;
    Value = CFDictionaryGetValue(v5, (const void *)(int)v2);
    uint64_t v7 = (const void *)*MEMORY[0x263EFFD08];
    if (Value) {
      BOOL v8 = Value == v7;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      uint64_t v9 = *(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 24) + 80) + 40 * (int)v2 + 16) + 8);
      if (v9) {
        v9();
      }
    }
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 48), (const void *)(int)v2);
  }
  else
  {
    uint64_t v7 = (const void *)*MEMORY[0x263EFFD08];
    uint64_t v2 = (int)v2;
  }
  uint64_t result = *(void *)(a1 + 8 * (v2 + 9));
  if (result) {
    BOOL v11 = result == (void)v7;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    char v12 = *(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 24) + 80) + 40 * (int)v2 + 16) + 8);
    if (v12) {
      uint64_t result = v12();
    }
  }
  *(void *)(a1 + 8 * (v2 + 9)) = 0;
  return result;
}

uint64_t sub_215281018(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = a2 + 9;
  uint64_t v7 = *(void *)(a1 + 8 * v6);
  uint64_t v8 = *MEMORY[0x263EFFD08];
  if (v7) {
    BOOL v9 = v7 == v8;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    int v10 = *(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 24) + 80) + 40 * a2 + 16) + 8);
    if (v10) {
      v10();
    }
  }
  if (a3)
  {
    if (v8 != a3)
    {
      BOOL v11 = **(uint64_t (***)(uint64_t))(*(void *)(*(void *)(a1 + 24) + 80) + 40 * a2 + 16);
      if (v11) {
        a3 = v11(a3);
      }
    }
  }
  *(void *)(a1 + 8 * v6) = a3;
  return 1;
}

CFArrayRef CSDBRecordCopyChangedProperties(uint64_t a1)
{
  if (!a1) {
    sub_21528C560();
  }
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 40);
  if (!v2) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(v2);
  if (Count < 1) {
    return 0;
  }
  CFIndex v4 = Count;
  CFDictionaryRef v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 40), v5, 0);
  CFArrayRef v6 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, v4, 0);
  free(v5);
  return v6;
}

void CSDBRecordMarkPropertyChanged(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    sub_21528C58C();
  }
  CFSetRef Mutable = *(__CFDictionary **)(a1 + 40);
  if (!Mutable)
  {
    CFSetRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0);
    *(void *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284910, 0) = Mutable;
  }
  CFDictionarySetValue(Mutable, (const void *)(int)a2, (const void *)1);
  CFDictionaryRef v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 24) + 112);
  if (v5)
  {
    v5(a1, a2);
  }
}

void CSDBRecordSetProperty(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_215281434(a1);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 + 24);
    if ((*(unsigned char *)(v8 + 56) & 4) != 0 && *(int *)(v8 + 136) >= 3)
    {
      BOOL v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 144);
      if (v9) {
        v9(v6, a2, a3);
      }
    }
    if (*(unsigned char *)(v7 + 58))
    {
      CFSetRef v10 = *(const __CFSet **)(v7 + 64);
      if (!v10 || !CFSetContainsValue(v10, (const void *)(int)a2))
      {
        CFDictionaryRef v11 = *(const __CFDictionary **)(v7 + 48);
        if (!v11 || !CFDictionaryGetValue(v11, (const void *)(int)a2))
        {
          CFSetRef Mutable = *(__CFSet **)(v7 + 64);
          if (!Mutable)
          {
            CFSetRef Mutable = CFSetCreateMutable(0, *(int *)(*(void *)(v7 + 24) + 72), 0);
            *(void *)(v7 + 64) = Mutable;
          }
          CFSetAddValue(Mutable, (const void *)(int)a2);
          uint64_t Property = CSDBRecordGetProperty(a1, a2);
          if (Property)
          {
            int v14 = (const void *)Property;
            int v15 = **(uint64_t (***)(uint64_t))(*(void *)(*(void *)(v7 + 24) + 80) + 40 * (int)a2 + 16);
            if (v15) {
              int v14 = (const void *)v15(Property);
            }
          }
          else
          {
            int v14 = (const void *)*MEMORY[0x263EFFD08];
          }
          int v16 = *(__CFDictionary **)(v7 + 48);
          if (!v16)
          {
            int v16 = CFDictionaryCreateMutable(0, 0, 0, 0);
            *(void *)(v7 + 48) = v16;
          }
          CFDictionaryAddValue(v16, (const void *)(int)a2, v14);
          CFSetRemoveValue(*(CFMutableSetRef *)(v7 + 64), (const void *)(int)a2);
        }
      }
    }
    sub_215280DA8(v7, a2, a3, 0);
    CSDBRecordMarkPropertyChanged(v7, a2);
    uint64_t v17 = *(void *)(v7 + 16);
    if (v17)
    {
      CFDictionaryRef v18 = *(const __CFDictionary **)(v17 + 24);
      if (v18)
      {
        if (CFDictionaryContainsKey(v18, (const void *)v7)) {
          return;
        }
        uint64_t v17 = *(void *)(v7 + 16);
      }
      CFDictionaryRef v19 = *(const __CFDictionary **)(v17 + 40);
      if (!v19
        || (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v19, *(const void **)(v7 + 24))) == 0
        || !CFDictionaryContainsKey(Value, (const void *)*(int *)(v7 + 32)))
      {
        int v21 = 2;
        if (*(unsigned char *)(*(void *)(v7 + 16) + 57))
        {
          if (*(unsigned char *)(*(void *)(*(void *)(v7 + 24) + 80) + 40 * (int)a2 + 25)) {
            int v21 = 2;
          }
          else {
            int v21 = 3;
          }
        }
        if ((*(unsigned char *)(*(void *)(v7 + 16) + 57) & 2) != 0) {
          int v21 = ((*(_DWORD *)(*(void *)(*(void *)(v7 + 24) + 80) + 40 * (int)a2 + 24) >> 6) & 4 | v21) ^ 4;
        }
        sub_215281510((void *)v7, v21);
      }
    }
  }
}

uint64_t sub_215281434(uint64_t a1)
{
  if (!a1) {
    sub_21528C5B8();
  }
  CFRetain((CFTypeRef)a1);
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = a1;
  if (v2)
  {
    uint64_t v3 = a1;
    if (*(unsigned char *)(a1 + 56))
    {
      CFIndex v4 = (__CFDictionary *)sub_21527E74C(v2, *(void **)(a1 + 24));
      CFDictionaryRef v5 = v4;
      int v6 = *(_DWORD *)(a1 + 32);
      if (v6 != -1 && v4)
      {
        CFDictionarySetValue(v4, (const void *)v6, (const void *)a1);
        int v6 = *(_DWORD *)(a1 + 32);
      }
      uint64_t v7 = sub_215283844(*(void *)(a1 + 16), *(void **)(a1 + 24), v6);
      if (v7)
      {
        if (v7 != (const void *)a1) {
          sub_21528C5E4();
        }
        *(unsigned char *)(a1 + 56) = 0;
        uint64_t v3 = a1;
      }
      else
      {
        if (v5) {
          CFDictionaryRemoveValue(v5, (const void *)*(int *)(a1 + 32));
        }
        uint64_t v3 = 0;
        *(unsigned char *)(a1 + 57) = 1;
      }
    }
  }
  if (*(_DWORD *)(a1 + 36) == -1)
  {
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      *(_DWORD *)(a1 + 36) = CSDBRecordStoreGetSequenceNumber(v8);
    }
  }
  CFRelease((CFTypeRef)a1);
  return v3;
}

void sub_215281510(void *key, int a2)
{
  uint64_t v2 = key[2];
  if (!v2) {
    sub_21528C63C();
  }
  CFDictionaryRef Mutable = *(const __CFDictionary **)(v2 + 32);
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], 0);
    *(void *)(key[2] + 32) = Mutable;
  }
  int v6 = (const void *)(CFDictionaryGetValue(Mutable, key) | a2);
  uint64_t v7 = *(__CFDictionary **)(key[2] + 32);
  CFDictionarySetValue(v7, key, v6);
}

uint64_t sub_21528159C(uint64_t a1)
{
  if (!a1) {
    sub_21528C668();
  }
  uint64_t Database = CSDBRecordStoreGetDatabase(a1);
  if (!Database) {
    return 0;
  }
  uint64_t v3 = CSDBSqliteDatabaseConnectionForReading(Database);
  uint64_t v4 = v3;
  if (v3 && *(_DWORD *)(a1 + 96) == -1) {
    *(_DWORD *)(a1 + 96) = CSDBSqliteConnectionIntegerForProperty(v3, @"__CSDBRecordSequenceNumber");
  }
  return v4;
}

uint64_t CSDBRecordCopyProperty(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  if (!CSDBRecordGetProperty(a1, a2)) {
    return 0;
  }
  uint64_t v4 = **(uint64_t (***)(void))(*(void *)(*(void *)(a1 + 24) + 80) + 40 * v2 + 16);
  if (!v4) {
    return 0;
  }
  return v4();
}

uint64_t CSDBRecordShow(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[3];
  uint64_t v3 = *(uint64_t (**)(void))(v2 + 40);
  if (v3)
  {
    return v3();
  }
  else
  {
    uint64_t v5 = *(unsigned int *)(v2 + 72);
    int v6 = (FILE **)MEMORY[0x263EF8348];
    uint64_t result = fprintf((FILE *)*MEMORY[0x263EF8348], "CSDBRecord/%s instance %p:\n", *(const char **)v2, a1);
    if ((int)v5 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      do
      {
        uint64_t Property = CSDBRecordGetProperty((uint64_t)a1, v8);
        fprintf(*v6, " %s (%d) = ", *(const char **)(*(void *)(a1[3] + 80) + v7), v8);
        uint64_t v10 = *(void *)(a1[3] + 80);
        if (Property && (CFDictionaryRef v11 = *(void (**)(uint64_t))(*(void *)(v10 + v7 + 16) + 16)) != 0)
        {
          v11(Property);
        }
        else
        {
          uint64_t v12 = *(void *)(v10 + v7 + 8);
          if (v12 == 1)
          {
            CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"%@", Property);
            if (v13)
            {
              CFStringRef v14 = v13;
              memset(__b, 170, sizeof(__b));
              CFStringGetCString(v14, __b, 2048, 0x8000100u);
              fputs(__b, *v6);
              CFRelease(v14);
            }
            else
            {
              fwrite("(nil)", 5uLL, 1uLL, *v6);
            }
          }
          else if (v12)
          {
            fprintf(*v6, "%p");
          }
          else
          {
            fprintf(*v6, "%d");
          }
        }
        uint64_t result = fputc(10, *v6);
        uint64_t v8 = (v8 + 1);
        v7 += 40;
      }
      while (40 * v5 != v7);
    }
  }
  return result;
}

uint64_t CSDBRecordGetPropertyDescriptor(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 24);
  if (*(_DWORD *)(v2 + 72) <= (signed int)a2) {
    return 0;
  }
  else {
    return *(void *)(v2 + 80) + 40 * a2;
  }
}

uint64_t CSDBRecordGetStore(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void CSDBRecordMarkChanged(void *key)
{
  if (!key) {
    sub_21528C694();
  }
  uint64_t v2 = key[2];
  if (v2)
  {
    if ((*(unsigned char *)(v2 + 57) & 1) == 0
      || (*(unsigned char *)(key[3] + 56) & 2) == 0
      || (sub_215281510(key, 1), (uint64_t v2 = key[2]) != 0))
    {
      if ((*(unsigned char *)(v2 + 57) & 2) != 0 && (*(unsigned char *)(key[3] + 56) & 8) != 0)
      {
        sub_215281510(key, 4);
      }
    }
  }
}

uint64_t CSDBRecordStoreSetContext(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 88) = a2;
  }
  return result;
}

uint64_t CSDBRecordStoreGetContext(uint64_t result)
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

void CSDBRecordStoreSetValueForProperty(uint64_t a1, void *key, const void *a3)
{
  if (!a1) {
    sub_21528C6C0();
  }
  CFDictionaryRef Mutable = *(__CFDictionary **)(a1 + 80);
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(a1 + 8CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284910, 0) = Mutable;
    if (!Mutable) {
      sub_21528C6EC();
    }
  }
  if (a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = (const void *)*MEMORY[0x263EFFD08];
  }
  CFDictionarySetValue(Mutable, key, v7);
}

CFStringRef CSDBRecordStoreCopyValueForProperty(uint64_t a1, const __CFString *key)
{
  if (!a1) {
    sub_21528C718();
  }
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 80);
  if (v4)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v4, key);
    if (Value)
    {
      CFStringRef v6 = Value;
      CFRetain(Value);
LABEL_7:
      if ((CFStringRef)*MEMORY[0x263EFFD08] == v6)
      {
        CFRelease(v6);
        return 0;
      }
      return v6;
    }
  }
  uint64_t Database = CSDBRecordStoreGetDatabase(a1);
  if (!Database) {
    return 0;
  }
  CFStringRef v6 = CSDBSqliteDatabaseCopyValueForProperty(Database, key);
  if (v6) {
    goto LABEL_7;
  }
  return v6;
}

uint64_t CSDBRecordIndexOfPropertyNamed(const char **a1, int a2, char *__s1)
{
  if (a2 < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  uint64_t v6 = a2;
  while (strcmp(__s1, *a1))
  {
    ++v5;
    a1 += 5;
    if (v6 == v5) {
      return v6;
    }
  }
  return v5;
}

_DWORD *CSDBRecordStoreCreateWithPath(const __CFString *a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x80uLL, 0x10F0040F8EA1033uLL);
  if (v2)
  {
    *(void *)uint64_t v2 = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a1);
    v2[24] = -1;
  }
  return v2;
}

uint64_t CSDBRecordStoreSetSetupHandler(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    sub_21528C79C();
  }
  *(void *)(a1 + 64) = a2;
  uint64_t result = *(void *)(a1 + 8);
  if (result)
  {
    return CSDBSqliteDatabaseSetSetupHandler(result, (uint64_t)sub_215281BD8, a1);
  }
  return result;
}

void sub_215281BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1 || !a2 || !a3) {
    sub_21528C7C8();
  }
  uint64_t v5 = *(void (**)(uint64_t))(a3 + 64);
  if (v5)
  {
    v5(a3);
  }
  else
  {
    CSDBSqliteDatabaseDefaultSetupHandler();
    CFSetRef v6 = *(const __CFSet **)(a3 + 72);
    if (v6)
    {
      v7[0] = a3;
      v7[1] = a2;
      CFSetApplyFunction(v6, (CFSetApplierFunction)sub_215283998, v7);
    }
  }
}

uint64_t CSDBRecordStoreLogChanges(uint64_t result, char a2)
{
  if (!result) {
    sub_21528C7F4();
  }
  *(unsigned char *)(result + 57) = *(unsigned char *)(result + 57) & 0xFE | a2;
  return result;
}

uint64_t CSDBRecordStoreLogBasicChanges(uint64_t result, int a2)
{
  if (!result) {
    sub_21528C820();
  }
  if (a2) {
    char v2 = 2;
  }
  else {
    char v2 = 0;
  }
  *(unsigned char *)(result + 57) = *(unsigned char *)(result + 57) & 0xFD | v2;
  return result;
}

uint64_t CSDBRecordStoreIsLoggingChanges(uint64_t a1)
{
  if (!a1) {
    sub_21528C84C();
  }
  return *(unsigned char *)(a1 + 57) & 1;
}

uint64_t CSDBRecordStoreProcessAddedRecordsWithPolicyAndTransactionType(uint64_t a1, int a2, unsigned int a3, CFErrorRef *a4)
{
  return sub_215281D0C(a1, 1, a2, a3, a4);
}

uint64_t sub_215281D0C(uint64_t result, int a2, int a3, unsigned int a4, CFErrorRef *a5)
{
  if (result)
  {
    uint64_t v9 = result;
    uint64_t Database = CSDBRecordStoreGetDatabase(result);
    uint64_t result = CSDBSqliteDatabaseConnectionForWriting(Database);
    if (result)
    {
      uint64_t v11 = result;
      CSDBSqliteConnectionBeginTransactionType(result, a4);
      int v12 = CSDBSqliteConnectionIntegerForProperty(v11, @"__CSDBRecordSequenceNumber");
      if (!a3 || (int v13 = *(_DWORD *)(v9 + 96), v13 == -1) || v12 == v13)
      {
        v15[1] = v11;
        v15[2] = 0;
        v15[0] = v9;
        if (a2) {
          sub_215282090(v15);
        }
        else {
          sub_215282000(v15);
        }
        return 1;
      }
      else if (a5)
      {
        CFErrorRef v14 = CFErrorCreate(0, @"CSDBRecord", 2, 0);
        uint64_t result = 0;
        *a5 = v14;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CSDBRecordStoreProcessDeletedRecordsWithPolicyAndTransactionType(uint64_t a1, int a2, unsigned int a3, CFErrorRef *a4)
{
  return sub_215281D0C(a1, 0, a2, a3, a4);
}

uint64_t CSDBRecordStoreProcessAddedRecordsWithPolicy(uint64_t a1, int a2, CFErrorRef *a3)
{
  return sub_215281D0C(a1, 1, a2, 0, a3);
}

uint64_t CSDBRecordStoreProcessAddedRecords(uint64_t a1, CFErrorRef *a2)
{
  return sub_215281D0C(a1, 1, 0, 0, a2);
}

uint64_t CSDBRecordStoreGetLastSequenceNumber(uint64_t a1)
{
  if (a1) {
    return *(int *)(a1 + 96);
  }
  else {
    return -1;
  }
}

uint64_t CSDBRecordStoreGetRowidForRecordID(uint64_t a1, int a2)
{
  if (!a1) {
    return -1;
  }
  if (a2 >= -1) {
    return a2;
  }
  if ((a2 & 0x7FFFFFFF) < *(_DWORD *)(a1 + 104)) {
    return *(void *)(*(void *)(a1 + 112) + 8 * (a2 & 0x7FFFFFFF));
  }
  else {
    return -1;
  }
}

CFArrayRef CSDBRecordStoreCopyAddedRecords(uint64_t a1)
{
  return sub_215281E88(*(const __CFDictionary **)(a1 + 24), MEMORY[0x263EFFF70]);
}

CFArrayRef sub_215281E88(const __CFDictionary *a1, const CFArrayCallBacks *a2)
{
  if (!a1) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(a1);
  if (Count < 1) {
    return 0;
  }
  CFIndex v5 = Count;
  CFSetRef v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(a1, v6, 0);
  CFArrayRef v7 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v6, v5, a2);
  free(v6);
  return v7;
}

CFArrayRef CSDBRecordStoreCopyChangedRecords(uint64_t a1)
{
  return sub_215281E88(*(const __CFDictionary **)(a1 + 32), MEMORY[0x263EFFF70]);
}

CFArrayRef CSDBRecordStoreCopyDeletedRecordIDsOfClass(uint64_t a1, const void *a2)
{
  CFDictionaryRef Value = *(const __CFDictionary **)(a1 + 40);
  if (Value) {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, a2);
  }
  return sub_215281E88(Value, 0);
}

void CSDBRecordInvalidateRecord(uint64_t a1)
{
  if (!a1) {
    sub_21528C878();
  }
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 72);
  if (v2 >= 1)
  {
    for (int i = 0; i != v2; ++i)
      CSDBRecordUnloadProperty(a1, i);
  }
  *(unsigned char *)(a1 + 56) = 1;
  *(unsigned char *)(a1 + 58) = 0;
  CFDictionaryRef v4 = *(const void **)(a1 + 64);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 64) = 0;
  }
  *(_DWORD *)(a1 + 36) = -1;
}

uint64_t CSDBRecordStoreSaveWithCallbackAndTransactionType(uint64_t a1, void (*a2)(uint64_t, uint64_t *), int a3, unsigned int a4, CFErrorRef *a5)
{
  return CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, a2, 0, a3, a4, a5);
}

void sub_215282000(void *a1)
{
  if (a1)
  {
    if (*a1)
    {
      if (a1[1])
      {
        CFDictionaryRef v2 = *(const __CFDictionary **)(*a1 + 40);
        if (v2)
        {
          CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v2);
          CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)sub_215283A04, a1);
          CFRelease(Copy);
          if (*a1)
          {
            CFDictionaryRef v4 = *(const void **)(*a1 + 40);
            if (v4)
            {
              CFRelease(v4);
              *(void *)(*a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284910, 0) = 0;
            }
          }
        }
      }
    }
  }
}

void sub_215282090(void *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      if (a1[1])
      {
        CFDictionaryRef v3 = *(const __CFDictionary **)(v2 + 24);
        if (v3)
        {
          *(unsigned char *)(v2 + 56) = 1;
          CFDictionaryRef Copy = CFDictionaryCreateCopy(0, v3);
          if (Copy)
          {
            CFDictionaryRef v5 = Copy;
            CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)sub_21528408C, a1);
            CFRelease(v5);
          }
          uint64_t v6 = *a1;
          *(unsigned char *)(v6 + 56) = 0;
          CFRelease(*(CFTypeRef *)(v6 + 24));
          uint64_t v2 = *a1;
          *(void *)(*a1 + 24) = 0;
        }
        CFArrayRef v7 = *(const void **)(v2 + 48);
        if (v7)
        {
          CFRelease(v7);
          *(void *)(*a1 + 48) = 0;
        }
      }
    }
  }
}

uint64_t sub_215282134(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  if (!a3 || !a1 || (CFDictionaryRef v4 = *(void **)(a3 + 8)) == 0) {
    sub_21528C8D0();
  }
  if ((const __CFString *)*MEMORY[0x263EFFD08] == a2) {
    CFStringRef v5 = 0;
  }
  else {
    CFStringRef v5 = a2;
  }
  return CSDBSqliteConnectionSetValueForProperty(v4, a1, v5);
}

void sub_215282188(int a1, CFDictionaryRef theDict, void *a3)
{
}

uint64_t CSDBRecordStoreSaveWithCallback(uint64_t a1, void (*a2)(uint64_t, uint64_t *), int a3, CFErrorRef *a4)
{
  return CSDBRecordStoreSaveWithPreAndPostCallbacksAndTransactionType(a1, a2, 0, a3, 0, a4);
}

void sub_2152821B4(int a1, CFDictionaryRef theDict)
{
}

uint64_t sub_2152821D0(uint64_t result)
{
  *(void *)(result + 16) = 0;
  return result;
}

void CSDBRecordStoreCreateTablesForClass(uint64_t a1, uint64_t a2, int a3)
{
  if (!a1) {
    sub_21528C8FC();
  }
  if (!a2) {
    sub_21528C928();
  }
  char v6 = *(unsigned char *)(a1 + 56);
  CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  MutableCFDictionaryRef Copy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"CREATE TABLE IF NOT EXISTS ");
  CFStringAppendCString(MutableCopy, *(const char **)a1, 0x8000100u);
  uint64_t v8 = *(unsigned int *)(a1 + 120);
  uint64_t v52 = a2;
  char v50 = v6;
  int v51 = a3;
  if ((int)v8 < 1) {
    goto LABEL_10;
  }
  unsigned __int8 v9 = 0;
  uint64_t v10 = (int *)(*(void *)(a1 + 128) + 8);
  do
  {
    if (*v10 <= 0) {
      sub_21528C954();
    }
    uint64_t v11 = *((void *)v10 - 1);
    if (((v11 == 1) & v9) == 1) {
      sub_21528C980();
    }
    v9 |= v11 == 1;
    v10 += 6;
    --v8;
  }
  while (v8);
  if (v9)
  {
    CFStringAppend(MutableCopy, @" (");
  }
  else
  {
LABEL_10:
    int v12 = (void *)CFRetain(@"ROWID");
    int v13 = *(const char **)(a1 + 96);
    if (v13) {
      int v12 = (void *)CFStringCreateWithCString(0, v13, 0x600u);
    }
    CFErrorRef v14 = v12;
    CFStringAppendFormat(MutableCopy, 0, @" (%@ INTEGER PRIMARY KEY"), v12, alloc;
    if (v6) {
      CFStringRef v15 = @" AUTOINCREMENT, ";
    }
    else {
      CFStringRef v15 = @", ";
    }
    CFStringAppend(MutableCopy, v15);
    CFRelease(v14);
  }
  int v16 = *(_DWORD *)(a1 + 72);
  if (v16 >= 1)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    char v19 = 1;
    while (1)
    {
      uint64_t v20 = *(void *)(a1 + 80);
      uint64_t v21 = v20 + v17;
      if ((*(unsigned char *)(v20 + v17 + 24) & 4) == 0) {
        break;
      }
LABEL_30:
      ++v18;
      v17 += 40;
      if (v18 >= v16) {
        goto LABEL_36;
      }
    }
    if ((v19 & 1) == 0) {
      CFStringAppend(MutableCopy, @", ");
    }
    uint64_t v22 = v20 + v17;
    CFStringAppendCString(MutableCopy, *(const char **)v22, 0x8000100u);
    unint64_t v23 = *(void *)(v22 + 8);
    CFStringRef v24 = @" TEXT";
    if (v23 <= 3) {
      CFStringRef v24 = off_264238C60[v23];
    }
    CFStringAppend(MutableCopy, v24);
    int v25 = *(_DWORD *)(v21 + 24);
    if ((v25 & 0xE0) == 0) {
      goto LABEL_28;
    }
    CFDictionaryRef Mutable = CFStringCreateMutable(0, 0);
    int v27 = Mutable;
    if ((v25 & 0x20) != 0)
    {
      CFStringAppend(Mutable, @" UNIQUE");
      if ((v25 & 0x40) == 0)
      {
LABEL_26:
        if ((v25 & 0x80) == 0) {
          goto LABEL_27;
        }
        goto LABEL_34;
      }
    }
    else if ((v25 & 0x40) == 0)
    {
      goto LABEL_26;
    }
    CFStringAppend(v27, @" NOT NULL");
    if ((v25 & 0x80) == 0)
    {
LABEL_27:
      if (v27)
      {
LABEL_29:
        CFStringAppend(MutableCopy, v27);
        CFRelease(v27);
        char v19 = 0;
        int v16 = *(_DWORD *)(a1 + 72);
        goto LABEL_30;
      }
LABEL_28:
      int v27 = (__CFString *)CFRetain(&stru_26C5DE380);
      goto LABEL_29;
    }
LABEL_34:
    CFStringAppend(v27, @" DEFAULT 0");
    if (v27) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_36:
  if (*(int *)(a1 + 120) >= 1)
  {
    for (uint64_t i = 0; i < *(int *)(a1 + 120); ++i)
    {
      uint64_t v29 = *(void *)(a1 + 128);
      uint64_t v30 = v29 + 24 * i;
      int v32 = *(_DWORD *)(v30 + 8);
      unsigned int v31 = (int *)(v30 + 8);
      if (v32 <= 0) {
        sub_21528C9AC();
      }
      uint64_t v33 = *(void *)(v29 + 24 * i);
      if (v33 == 1)
      {
        CFStringRef v34 = CFSTR(", PRIMARY KEY (");
      }
      else
      {
        if (v33 != 2) {
          goto LABEL_44;
        }
        CFStringRef v34 = CFSTR(", UNIQUE (");
      }
      CFStringAppend(MutableCopy, v34);
      if (*v31 >= 1)
      {
LABEL_44:
        uint64_t v35 = 0;
        uint64_t v36 = (void *)(v29 + 24 * i + 16);
        do
        {
          if (v35) {
            CFStringAppend(MutableCopy, @", ");
          }
          CFStringAppendCString(MutableCopy, *(const char **)(*(void *)(a1 + 80) + 40 * *(int *)(*v36 + 4 * v35++)), 0x8000100u);
        }
        while (v35 < *v31);
      }
      CFStringAppend(MutableCopy, @""));
    }
  }
  CFStringAppend(MutableCopy, @";"));
  uint64_t v37 = v52;
  CSDBSqliteConnectionPerformSQL(v52, MutableCopy);
  CFRelease(MutableCopy);
  char v39 = v50;
  int v38 = v51;
  if (v51 && (v50 & 2) != 0)
  {
    CFMutableStringRef v40 = CFStringCreateMutableCopy(alloc, 0, @"CREATE TABLE IF NOT EXISTS ");
    CFStringAppendCString(v40, *(const char **)a1, 0x8000100u);
    CFStringAppend(v40, @"Changes (record INTEGER, type INTEGER");
    if (*(int *)(a1 + 72) >= 1)
    {
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      while (1)
      {
        uint64_t v43 = *(void *)(a1 + 80) + v41;
        v44 = *(const char **)v43;
        int v45 = *(_DWORD *)(v43 + 24);
        if ((v45 & 2) != 0) {
          break;
        }
        if ((v45 & 8) != 0)
        {
          CFStringAppend(v40, @", ");
          CFStringAppendCString(v40, v44, 0x8000100u);
          CFStringRef v46 = @" INTEGER";
LABEL_58:
          CFStringAppend(v40, v46);
        }
        ++v42;
        v41 += 40;
        if (v42 >= *(int *)(a1 + 72)) {
          goto LABEL_60;
        }
      }
      unint64_t v47 = *(void *)(v43 + 8);
      CFStringAppend(v40, @", ");
      CFStringAppendCString(v40, v44, 0x8000100u);
      CFStringRef v46 = @" TEXT";
      if (v47 < 4) {
        CFStringRef v46 = off_264238C60[v47];
      }
      goto LABEL_58;
    }
LABEL_60:
    CFStringAppend(v40, @";"));
    uint64_t v37 = v52;
    CSDBSqliteConnectionPerformSQL(v52, v40);
    CFRelease(v40);
    char v39 = v50;
    int v38 = v51;
  }
  if (v38 && (v39 & 8) != 0)
  {
    CFMutableStringRef v48 = CFStringCreateMutableCopy(alloc, 0, @"CREATE TABLE IF NOT EXISTS ");
    CFStringAppendCString(v48, *(const char **)a1, 0x8000100u);
    CFStringAppend(v48, @"BasicChanges (record INTEGER PRIMARY KEY, type INTEGER, sequenceNumber INTEGER);");
    CSDBSqliteConnectionPerformSQL(v37, v48);
    CFRelease(v48);
  }
}

void CSDBRecordStoreRegisterClass(uint64_t a1, void *value)
{
  if (!a1 || !value) {
    sub_21528C9D8();
  }
  CFDictionaryRef Mutable = *(__CFSet **)(a1 + 72);
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFSetCreateMutable(0, 0, 0);
    *(void *)(a1 + 72) = Mutable;
    if (!Mutable) {
      sub_21528CA04();
    }
  }
  CFSetAddValue(Mutable, value);
}

CFMutableStringRef CSDBRecordStoreCreateSelectPrefixFromRecordDescriptor(uint64_t a1)
{
  return sub_215282B04(a1, 0, 0, 0, 0);
}

CFMutableStringRef CSDBRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumns(uint64_t a1, CFArrayRef theArray)
{
  return sub_215282B04(a1, 0, 0, theArray, 0);
}

CFMutableStringRef CSDBRecordStoreCreateSelectPrefixFromRecordDescriptorWithAdditionalColumn(uint64_t a1, void *a2)
{
  values = a2;
  if (a2)
  {
    CFArrayRef v3 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)&values, 1, 0);
    CFMutableStringRef v4 = sub_215282B04(a1, 0, 0, v3, 0);
    if (v3) {
      CFRelease(v3);
    }
    return v4;
  }
  else
  {
    return sub_215282B04(a1, 0, 0, 0, 0);
  }
}

__CFString *CSDBRecordStoreCreateColumnListFromRecordDescriptor(uint64_t a1)
{
  return sub_215282898(a1, 0, 0, 0, 0);
}

__CFString *sub_215282898(uint64_t a1, int a2, CFStringRef theString, CFMutableDictionaryRef *a4, const __CFArray *a5)
{
  CFStringRef v7 = theString;
  if (theString)
  {
    if (CFStringGetLength(theString) && CFStringGetLength(v7)) {
      CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@.", v7);
    }
    else {
      CFStringRef v7 = 0;
    }
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  MutableCFDictionaryRef Copy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"SELECT ");
  int v12 = MutableCopy;
  if (a2) {
    CFStringAppend(MutableCopy, @"DISTINCT ");
  }
  if (v7) {
    CFStringAppend(v12, v7);
  }
  CFStringAppend(v12, @"ROWID");
  if (a4) {
    *a4 = CFDictionaryCreateMutable(v10, 0, 0, 0);
  }
  if (*(int *)(a1 + 72) >= 1)
  {
    uint64_t v13 = 0;
    CFErrorRef v14 = 0;
    int v15 = 1;
    do
    {
      int v16 = *(_DWORD *)(*(void *)(a1 + 80) + v13 + 24);
      if ((v16 & 4) == 0)
      {
        if (v16)
        {
          if (!a4) {
            CFStringAppend(v12, @", NULL");
          }
        }
        else
        {
          CFStringAppend(v12, @", ");
          if (v7) {
            CFStringAppend(v12, v7);
          }
          CFStringAppendCString(v12, *(const char **)(*(void *)(a1 + 80) + v13), 0x8000100u);
          if (a4) {
            CFDictionarySetValue(*a4, v14, (const void *)v15++);
          }
        }
      }
      ++v14;
      v13 += 40;
    }
    while ((uint64_t)v14 < *(int *)(a1 + 72));
  }
  if (a5)
  {
    if (CFArrayGetCount(a5))
    {
      int Count = CFArrayGetCount(a5);
      if (Count >= 1)
      {
        CFIndex v18 = 0;
        if (Count <= 1uLL) {
          uint64_t v19 = 1;
        }
        else {
          uint64_t v19 = Count;
        }
        do
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a5, v18);
          CFStringAppend(v12, @", ");
          CFStringAppend(v12, ValueAtIndex);
          ++v18;
        }
        while (v19 != v18);
      }
    }
  }
  if (v7) {
    CFRelease(v7);
  }
  return v12;
}

__CFString *CSDBRecordStoreCreateDistinctColumnList(uint64_t a1, int a2, CFMutableDictionaryRef *a3)
{
  return sub_215282898(a1, a2, 0, a3, 0);
}

__CFString *CSDBRecordStoreCreateColumnList(uint64_t a1, CFMutableDictionaryRef *a2)
{
  return sub_215282898(a1, 0, 0, a2, 0);
}

__CFString *CSDBRecordStoreCreateColumnListWithAliasAndExtraColumns(uint64_t a1, CFStringRef theString, const __CFArray *a3, CFMutableDictionaryRef *a4)
{
  return sub_215282898(a1, 0, theString, a4, a3);
}

CFMutableStringRef sub_215282B04(uint64_t a1, const __CFString *a2, CFStringRef theString, CFArrayRef theArray, CFMutableDictionaryRef *a5)
{
  CFStringRef v7 = theString;
  if (theString && !CFStringGetLength(theString)) {
    CFStringRef v7 = 0;
  }
  if ((unint64_t)a5 | (unint64_t)v7)
  {
    BOOL v10 = 1;
  }
  else if (theArray)
  {
    BOOL v10 = CFArrayGetCount(theArray) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  if (*(_DWORD *)(a1 + 152) == 1)
  {
    if (qword_26AB043D0)
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)qword_26AB043D0, *(const void **)a1);
      if (Value) {
        int v12 = v10;
      }
      else {
        int v12 = 1;
      }
      if (v12 != 1)
      {
        CFStringRef v13 = Value;
        CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        return CFStringCreateMutableCopy(v14, 0, v13);
      }
    }
    else
    {
      qword_26AB043D0 = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0);
    }
  }
  int v16 = sub_215282898(a1, 0, v7, a5, theArray);
  CFStringAppend(v16, @" FROM ");
  if (!a2 || !CFStringGetLength(a2))
  {
    CFStringAppendCString(v16, *(const char **)a1, 0x8000100u);
    if (!v7) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  CFStringRef v17 = CFStringCreateWithFormat(0, 0, @"(%@)", a2);
  CFStringAppend(v16, v17);
  CFRelease(v17);
  if (v7) {
LABEL_24:
  }
    CFStringAppendFormat(v16, 0, @" AS %@", v7);
LABEL_25:
  if (!v10 && *(_DWORD *)(a1 + 152) == 1)
  {
    CFStringRef Copy = CFStringCreateCopy(0, v16);
    CFDictionaryAddValue((CFMutableDictionaryRef)qword_26AB043D0, *(const void **)a1, Copy);
  }
  return v16;
}

CFMutableStringRef CSDBRecordStoreCreateJoinableSelectPrefixFromRecordDescriptor(uint64_t a1, CFStringRef theString)
{
  if (!theString || !CFStringGetLength(theString)) {
    sub_21528CA30();
  }
  return sub_215282B04(a1, 0, theString, 0, 0);
}

CFMutableStringRef CSDBRecordStoreCreateSelectPrefixWithTableExpressionAndAlias(uint64_t a1, const __CFString *a2, CFStringRef theString)
{
  if (!theString || !CFStringGetLength(theString)) {
    sub_21528CA5C();
  }
  if (!a2 || !CFStringGetLength(a2)) {
    sub_21528CA88();
  }
  return sub_215282B04(a1, a2, theString, 0, 0);
}

__CFString *CSDBRecordStoreCreateSelectStatement(uint64_t a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  CFStringRef v5 = sub_215282B04(a1, a2, a3, 0, 0);
  if (v5)
  {
    if (a4 && CFStringGetLength(a4) >= 1)
    {
      CFStringAppend(v5, @" ");
      CFStringAppend(v5, a4);
    }
    CFStringAppend(v5, @";");
  }
  return v5;
}

CFMutableStringRef CSDBRecordStoreCreateSelectPrefix(uint64_t a1, CFStringRef theString, CFArrayRef theArray, CFMutableDictionaryRef *a4)
{
  return sub_215282B04(a1, 0, theString, theArray, a4);
}

uint64_t CSDBRecordStoreProcessStatementWithPropertyIndices(uint64_t a1, void *a2, void *a3, uint64_t a4, unint64_t a5, CFDictionaryRef theDict)
{
  return CSDBRecordStoreProcessRecordStatementWithPropertyIndices(a1, a2, a3, a4, 0, a5, theDict);
}

uint64_t sub_215282E6C(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  int v4 = sqlite3_column_type(*(sqlite3_stmt **)(a1 + 8), 0);
  if (v4 == 5)
  {
    int RecordIDForRowid = -1;
    goto LABEL_8;
  }
  sqlite3_int64 v6 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 8), 0);
  int RecordIDForRowid = CSDBRecordStoreGetRecordIDForRowid(*(void *)a2, v6);
  CFDictionaryRef v7 = *(const __CFDictionary **)(*(void *)a2 + 40);
  if (v7)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v7, *(const void **)(a2 + 8));
    if (Value)
    {
      if (CFDictionaryContainsKey(Value, (const void *)RecordIDForRowid)) {
        return 0;
      }
    }
  }
LABEL_8:
  BOOL v10 = *(uint64_t (**)(uint64_t, void))(a2 + 48);
  if (v10)
  {
    char v11 = v10(a1, *(void *)(a2 + 64));
    uint64_t v9 = v11 & 1;
    if ((v11 & 2) == 0) {
      return v9;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (v4 != 5)
  {
    CFStringRef v13 = CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), (const void *)RecordIDForRowid);
    if (v13)
    {
      uint64_t v12 = (uint64_t)v13;
      if (v13[56])
      {
        CSDBSqliteStatementApplyValuesFromRecordWithNullValue(a1, *(void *)(a2 + 24), *(_DWORD *)(a2 + 40), (uint64_t)v13, *MEMORY[0x263EFFD08]);
        *(unsigned char *)(v12 + 56) = 0;
        *(_DWORD *)(v12 + 36) = CSDBRecordStoreGetSequenceNumber(*(void *)(v12 + 16));
      }
    }
    else
    {
      uint64_t v12 = sub_215280C70(*(void *)(a2 + 8), RecordIDForRowid);
      CSDBSqliteStatementApplyValuesFromRecordWithNullValue(a1, *(void *)(a2 + 24), *(_DWORD *)(a2 + 40), v12, *MEMORY[0x263EFFD08]);
      if (!v12)
      {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), (const void *)RecordIDForRowid, 0);
        goto LABEL_24;
      }
      *(void *)(v12 + 16) = *(void *)a2;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), (const void *)RecordIDForRowid, (const void *)v12);
      CFRelease((CFTypeRef)v12);
    }
    if (*(unsigned char *)(v12 + 56))
    {
      int SequenceNumber = CSDBRecordStoreGetSequenceNumber(*(void *)(v12 + 16));
    }
    else
    {
      int SequenceNumber = *(_DWORD *)(a2 + 44);
      if (SequenceNumber < 0)
      {
        int SequenceNumber = CSDBRecordStoreGetSequenceNumber(*(void *)a2);
        *(_DWORD *)(a2 + 44) = SequenceNumber;
      }
    }
    *(_DWORD *)(v12 + 36) = SequenceNumber;
    *(unsigned char *)(v12 + 58) = 1;
    goto LABEL_24;
  }
  uint64_t v12 = *MEMORY[0x263EFFD08];
LABEL_24:
  int v15 = *(uint64_t (**)(uint64_t, uint64_t, void))(a2 + 56);
  if (v15)
  {
    if (v15(a1, v12, *(void *)(a2 + 64))) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v9;
    }
  }
  int v16 = *(__CFArray **)(a2 + 32);
  if (v16) {
    CFArrayAppendValue(v16, (const void *)v12);
  }
  return v9;
}

uint64_t CSDBRecordStoreProcessQuery(uint64_t a1, void *a2, const __CFString *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10 = sub_21528159C(a1);
  if (!v10) {
    return 0;
  }
  char v11 = (uint64_t *)v10;
  uint64_t v12 = CSDBSqliteConnectionStatementForSQL(v10, a3);
  if (v12) {
    uint64_t v13 = CSDBRecordStoreProcessRecordStatementWithPropertyIndices(a1, a2, v12, a4, 0, a5, 0);
  }
  else {
    uint64_t v13 = 0;
  }
  CSDBSqliteDatabaseReleaseSqliteConnection(v11);
  return v13;
}

const void *CSDBRecordStoreCopyInstanceOfClassWithUID(uint64_t a1, void *a2, int a3)
{
  sqlite3_int64 v6 = (const void *)sub_215284818(a1, a2, a3);
  if (v6 || (sqlite3_int64 v6 = sub_215283844(a1, a2, a3)) != 0) {
    CFRetain(v6);
  }
  return v6;
}

void CSDBRecordStoreAddRecord(uint64_t a1, void **a2)
{
}

void sub_215283174(uint64_t a1, void **key, int a3)
{
  if (!a1 || (CFArrayRef v3 = key) == 0) {
    sub_21528CAE0();
  }
  key[2] = (void *)a1;
  int v5 = *(unsigned __int8 *)(a1 + 57);
  if (v5) {
    int v6 = 3;
  }
  else {
    int v6 = 2;
  }
  CFDictionaryRef v7 = (const void *)(v6 | (2 * v5) & 4u);
  uint64_t v8 = (const void *)*((int *)key + 8);
  if (a3)
  {
    if (v8 == -1 || (uint64_t v9 = sub_215284818(a1, key[3], *((_DWORD *)key + 8))) == 0)
    {
      uint64_t v10 = v3;
    }
    else
    {
      uint64_t v10 = (void **)v9;
      CFArrayRef v11 = CSDBRecordCopyChangedProperties((uint64_t)v3);
      CFArrayRef v12 = CSDBRecordCopyChangedProperties((uint64_t)v10);
      if (v11)
      {
        int Count = CFArrayGetCount(v11);
        if (Count >= 1)
        {
          CFIndex v14 = 0;
          uint64_t v15 = Count;
          do
          {
            CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v11, v14);
            if (!v12
              || (v26.length = (int)CFArrayGetCount(v12),
                  v26.location = 0,
                  !CFArrayContainsValue(v12, v26, (const void *)(int)ValueAtIndex)))
            {
              uint64_t Property = CSDBRecordGetProperty((uint64_t)v3, (uint64_t)ValueAtIndex);
              CSDBRecordSetProperty((uint64_t)v10, (uint64_t)ValueAtIndex, Property);
            }
            ++v14;
          }
          while (v15 != v14);
        }
        CFRelease(v11);
      }
      if (v12) {
        CFRelease(v12);
      }
    }
    CFDictionaryRef v23 = (const __CFDictionary *)v10[5];
    if (v23 && CFDictionaryGetCount(v23) >= 1) {
      sub_215281510(v10, (int)v7);
    }
    CFArrayRef v3 = v10;
  }
  else
  {
    CFDictionaryRef v18 = *(const __CFDictionary **)(a1 + 40);
    if (!v18
      || (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v18, key[3])) == 0
      || (uint64_t v20 = Value, !CFDictionaryContainsKey(Value, (const void *)*((int *)v3 + 8))))
    {
      CFDictionaryRef v21 = *(const __CFDictionary **)(a1 + 24);
      if (v21)
      {
        if (CFDictionaryContainsKey(v21, v3)) {
          goto LABEL_33;
        }
        CFDictionaryRef Mutable = *(__CFDictionary **)(a1 + 24);
      }
      else
      {
        CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], 0);
        *(void *)(a1 + 24) = Mutable;
      }
      CFDictionarySetValue(Mutable, v3, v7);
      goto LABEL_33;
    }
    CFDictionaryRemoveValue(v20, (const void *)*((int *)v3 + 8));
  }
LABEL_33:
  if (v8 != -1)
  {
    CFStringRef v24 = (__CFDictionary *)sub_21527E74C(a1, v3[3]);
    if (v24)
    {
      CFDictionaryAddValue(v24, v8, v3);
    }
  }
}

void CSDBRecordStoreAddExistingRecord(uint64_t a1, void **a2)
{
}

void CSDBRecordStoreRemoveRecord(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    sub_21528CB0C();
  }
  uint64_t v2 = *(void **)(a2 + 24);
  int v3 = *(_DWORD *)(a2 + 32);
  sub_2152833E8(a1, a2, v2, v3);
}

void sub_2152833E8(uint64_t a1, uint64_t a2, void *key, int a4)
{
  if (!a1) {
    sub_21528CB38();
  }
  int v4 = a4;
  if (a2 && a4 == -1) {
    int v4 = *(_DWORD *)(a2 + 32);
  }
  if (v4 == -1)
  {
    if (!a2) {
      return;
    }
    CFIndex v14 = *(__CFDictionary **)(a1 + 24);
    if (!v14) {
      return;
    }
    goto LABEL_20;
  }
  if (a2 && !key) {
    key = *(void **)(a2 + 24);
  }
  if (!key) {
    sub_21528CB64();
  }
  CFDictionaryRef v7 = (__CFDictionary *)sub_215283628(a1, key);
  if (v7)
  {
    uint64_t v8 = v7;
    unsigned int v9 = *(unsigned __int8 *)(a1 + 57);
    pthread_once(&stru_26AB04338, (void (*)(void))sub_215284898);
    uint64_t Instance = _CFRuntimeCreateInstance();
    if (!Instance)
    {
      CFDictionarySetValue(v8, (const void *)v4, 0);
      if (!a2) {
        return;
      }
      goto LABEL_16;
    }
    CFArrayRef v11 = (unsigned char *)Instance;
    char v12 = v9 & 1;
    int v13 = (v9 >> 1) & 1;
    *(void *)(Instance + 16) = 0;
    *(void *)(Instance + 24) = 0;
    if (a2) {
      *(void *)(Instance + 16) = CFRetain((CFTypeRef)a2);
    }
    v11[24] = v12;
    v11[25] = v13;
    CFDictionarySetValue(v8, (const void *)v4, v11);
    CFRelease(v11);
  }
  if (!a2) {
    return;
  }
LABEL_16:
  CFIndex v14 = *(__CFDictionary **)(a1 + 32);
  if (!v14) {
    return;
  }
LABEL_20:
  CFDictionaryRemoveValue(v14, (const void *)a2);
}

void CSDBRecordStoreRemoveRecordOfClassWithUID(uint64_t a1, void *key, int a3)
{
}

CFDictionaryRef CSDBRecordIsPendingAdd(void *key)
{
  uint64_t v1 = key[2];
  if (!v1) {
    return 0;
  }
  CFDictionaryRef result = *(const __CFDictionary **)(v1 + 24);
  if (result) {
    return (const __CFDictionary *)(CFDictionaryContainsKey(result, key) != 0);
  }
  return result;
}

CFDictionaryRef CSDBRecordIsPendingChange(void *key)
{
  uint64_t v1 = key[2];
  if (!v1) {
    return 0;
  }
  CFDictionaryRef result = *(const __CFDictionary **)(v1 + 32);
  if (result) {
    return (const __CFDictionary *)(CFDictionaryContainsKey(result, key) != 0);
  }
  return result;
}

CFDictionaryRef CSDBRecordIsPendingDelete(uint64_t a1)
{
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 16);
  if (result)
  {
    if (*((void *)result + 5))
    {
      CFDictionaryRef result = (const __CFDictionary *)sub_215283628((uint64_t)result, *(void **)(a1 + 24));
      if (result) {
        return (const __CFDictionary *)(CFDictionaryContainsKey(result, (const void *)*(int *)(a1 + 32)) != 0);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const void *sub_215283628(uint64_t a1, void *key)
{
  if (!a1) {
    sub_21528CB90();
  }
  CFDictionaryRef Mutable = *(const __CFDictionary **)(a1 + 40);
  if (!Mutable)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]);
    *(void *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = Mutable;
  }
  CFDictionaryRef Value = CFDictionaryGetValue(Mutable, key);
  if (!Value)
  {
    CFDictionaryRef Value = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), key, Value);
    CFRelease(Value);
  }
  return Value;
}

uint64_t CSDBRecordStoreHasUnsavedChanges(void *a1)
{
  CFDictionaryRef v2 = (const __CFDictionary *)a1[3];
  if (v2 && CFDictionaryGetCount(v2) > 0) {
    return 1;
  }
  CFDictionaryRef v3 = (const __CFDictionary *)a1[4];
  if (v3)
  {
    if (CFDictionaryGetCount(v3) > 0) {
      return 1;
    }
  }
  uint64_t result = a1[5];
  if (result)
  {
    uint64_t context = 0;
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)sub_215283760, &context);
    return context > 0;
  }
  return result;
}

CFIndex sub_215283760(int a1, CFDictionaryRef theDict, _DWORD *a3)
{
  CFIndex result = CFDictionaryGetCount(theDict);
  *a3 += result;
  return result;
}

void *CSDBRecordIsFull(void *result, const char *a2, uint64_t a3)
{
  if (result)
  {
    int v3 = (int)a2;
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v7.st_blksize = v4;
    *(_OWORD *)v7.st_qspare = v4;
    *(_OWORD *)&v7.st_size = v4;
    int v5 = (const char *)objc_msgSend_fileSystemRepresentation(result, a2, a3, v4, v4, v4, v4, v4, v4);
    if (stat(v5, &v7)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v7.st_size <= v3;
    }
    return (void *)!v6;
  }
  return result;
}

CFStringRef sub_2152837FC(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"<CSDBRecord: %p %s>", a1, **(void **)(a1 + 24));
}

const void *sub_215283844(uint64_t a1, void *a2, int a3)
{
  if (CSDBRecordStoreGetDatabase(a1))
  {
    BOOL v6 = sub_215282B04((uint64_t)a2, 0, 0, 0, 0);
    if (v6)
    {
      CFStringRef v7 = v6;
      CFStringAppend(v6, @" WHERE ROWID = ?;");
      uint64_t v8 = sub_21528159C(a1);
      if (!v8)
      {
        CFStringRef ValueAtIndex = 0;
LABEL_18:
        CFRelease(v7);
        return ValueAtIndex;
      }
      unsigned int v9 = (uint64_t *)v8;
      uint64_t v10 = CSDBSqliteConnectionStatementForSQL(v8, v7);
      if (!v10 || (CFArrayRef v11 = v10, !*((void *)v10 + 1)))
      {
        CFStringRef ValueAtIndex = 0;
        goto LABEL_17;
      }
      if (a1)
      {
        if (a3 >= -1)
        {
          sqlite3_int64 v12 = a3;
LABEL_14:
          CSDBSqliteBindInt64((uint64_t)v10, v12);
          CFArrayRef v14 = (const __CFArray *)CSDBRecordStoreProcessRecordStatementWithPropertyIndices(a1, a2, v11, 0, 0, 0, 0);
          if (CFArrayGetCount(v14) < 1)
          {
            CFStringRef ValueAtIndex = 0;
            if (!v14) {
              goto LABEL_17;
            }
            goto LABEL_16;
          }
          CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v14, 0);
          if (v14) {
LABEL_16:
          }
            CFRelease(v14);
LABEL_17:
          CSDBSqliteDatabaseReleaseSqliteConnection(v9);
          goto LABEL_18;
        }
        if ((a3 & 0x7FFFFFFF) < *(_DWORD *)(a1 + 104))
        {
          sqlite3_int64 v12 = *(void *)(*(void *)(a1 + 112) + 8 * (a3 & 0x7FFFFFFF));
          goto LABEL_14;
        }
      }
      sqlite3_int64 v12 = -1;
      goto LABEL_14;
    }
  }
  return 0;
}

void sub_215283998(uint64_t a1, uint64_t a2)
{
}

CFStringRef sub_2152839A4(void *a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%llu", *a1);
}

BOOL sub_2152839E8(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2152839FC(uint64_t a1)
{
  return *(void *)a1;
}

void sub_215283A04(uint64_t a1, CFDictionaryRef theDict, void *a3)
{
  a3[2] = a1;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215283A20, a3);
}

void sub_215283A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)a3;
  if (*(void *)a3)
  {
    if ((*(unsigned char *)(v6 + 57) & 1) == 0
      || (*(unsigned char *)(*(void *)(v5 + 24) + 56) & 2) == 0
      || !*(unsigned char *)(a2 + 24)
      || (sub_215283BD0(*(void *)(a3 + 8), *(void *)(a2 + 16), 2, 0), (uint64_t v6 = *(void *)a3) != 0))
    {
      if ((*(unsigned char *)(v6 + 57) & 2) != 0 && (*(unsigned char *)(*(void *)(v5 + 24) + 56) & 8) != 0 && *(unsigned char *)(a2 + 25)) {
        sub_215283F74(*(void *)(a3 + 8), v5, 2);
      }
    }
  }
  CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"DELETE FROM %s WHERE ROWID = ?;",
         **(void **)(a3 + 16));
  unsigned int v9 = CSDBSqliteConnectionStatementForSQL(*(void *)(a3 + 8), v8);
  if (v9)
  {
    uint64_t v10 = v9;
    if (*((void *)v9 + 1))
    {
      uint64_t v11 = *(void *)a3;
      if (*(void *)a3)
      {
        if ((int)a1 >= -1)
        {
          sqlite3_int64 v12 = (int)a1;
LABEL_17:
          CSDBSqliteBindInt64((uint64_t)v9, v12);
          CSDBSqliteStatementPerform(v10);
          CSDBSqliteStatementReset(v10);
          goto LABEL_18;
        }
        if ((a1 & 0x7FFFFFFF) < *(_DWORD *)(v11 + 104))
        {
          sqlite3_int64 v12 = *(void *)(*(void *)(v11 + 112) + 8 * (a1 & 0x7FFFFFFF));
          goto LABEL_17;
        }
      }
      sqlite3_int64 v12 = -1;
      goto LABEL_17;
    }
  }
LABEL_18:
  CFRelease(v8);
  int v13 = *(void (**)(uint64_t, uint64_t, void))(*(void *)(a3 + 16) + 32);
  if (v13) {
    v13(a1, v5, *(void *)(a3 + 8));
  }
  if (v5) {
    *(unsigned char *)(v5 + 58) = 0;
  }
  CFArrayRef v14 = (__CFDictionary *)sub_21527E74C(*(void *)a3, *(void **)(a3 + 16));
  if (v14)
  {
    CFDictionaryRemoveValue(v14, (const void *)(int)a1);
  }
}

void sub_215283BD0(uint64_t a1, uint64_t a2, int a3, const __CFDictionary *a4)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, @"INSERT INTO %sChanges (ROWID, record, type"), **(void **)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(unsigned int *)(v7 + 72);
  if ((int)v8 < 1) {
    goto LABEL_38;
  }
  LODWORD(v9) = 0;
  uint64_t v10 = (int *)(*(void *)(v7 + 80) + 24);
  do
  {
    int v11 = v9;
    int v12 = *v10;
    v10 += 10;
    int v13 = v12 & 0xA;
    if ((v12 & 0xA) != 0) {
      uint64_t v9 = (v9 + 1);
    }
    else {
      uint64_t v9 = v9;
    }
    --v8;
  }
  while (v8);
  if (v9)
  {
    uint64_t v38 = a1;
    CFArrayRef v14 = (const char **)malloc_type_calloc(1uLL, 24 * v9, 0x10720403E5D127AuLL);
    uint64_t v15 = *(void *)(a2 + 24);
    if (*(int *)(v15 + 72) >= 1)
    {
      uint64_t v16 = 0;
      int v17 = 0;
      char v39 = (const void *)*MEMORY[0x263EFFD08];
      do
      {
        uint64_t v18 = *(void *)(v15 + 80);
        uint64_t v19 = v18 + 40 * v16;
        int v20 = *(_DWORD *)(v19 + 24);
        if ((v20 & 2) != 0)
        {
          uint64_t v24 = 0;
          v14[3 * v17] = *(const char **)v19;
          uint64_t v25 = *(void *)(v18 + 40 * v16 + 8);
          CFRange v26 = qword_21528D9A0;
          do
          {
            uint64_t v27 = *v26;
            v26 += 2;
            if (v27 == v25) {
              break;
            }
            ++v24;
          }
          while (v24 != 4);
          v14[3 * v17 + 1] = (const char *)qword_21528D9A0[2 * v24 + 1];
          if (a3 == 2
            && (CFDictionaryRef v28 = *(const __CFDictionary **)(a2 + 48)) != 0
            && (CFDictionaryRef Value = CFDictionaryGetValue(v28, (const void *)v16)) != 0)
          {
            if (Value == v39) {
              LODWORD(Value) = 0;
            }
          }
          else
          {
            LODWORD(Value) = CSDBRecordGetProperty(a2, v16);
          }
          LODWORD(v14[3 * v17++ + 2]) = Value;
        }
        else if ((v20 & 8) != 0)
        {
          CFDictionaryRef v21 = &v14[3 * v17];
          void *v21 = *(const char **)v19;
          uint64_t v22 = v21 + 1;
          if (a3 == 1)
          {
            *uint64_t v22 = 0;
            if (a4) {
              BOOL v23 = CFDictionaryGetValue(a4, (const void *)v16) != 0;
            }
            else {
              BOOL v23 = 0;
            }
            LODWORD(v14[3 * v17 + 2]) = v23;
          }
          else
          {
            *uint64_t v22 = 2;
            v14[3 * v17 + 2] = 0;
          }
          ++v17;
        }
        ++v16;
        uint64_t v15 = *(void *)(a2 + 24);
      }
      while (v16 < *(int *)(v15 + 72));
    }
    uint64_t v30 = v9;
    unsigned int v31 = v14;
    do
    {
      CFStringAppend(Mutable, @", ");
      int v32 = *v31;
      v31 += 3;
      CFStringAppendCString(Mutable, v32, 0x8000100u);
      --v30;
    }
    while (v30);
    CFStringAppendFormat(Mutable, 0, @" VALUES(IFNULL(1 + (SELECT MAX(ROWID) FROM %sChanges), 0), ?, ?"), **(void **)(a2 + 24));
    if (v13) {
      int v33 = v11 + 1;
    }
    else {
      int v33 = v11;
    }
    do
    {
      CFStringAppend(Mutable, @", ?");
      --v33;
    }
    while (v33);
    a1 = v38;
  }
  else
  {
LABEL_38:
    CFStringAppendFormat(Mutable, 0, @" VALUES(IFNULL(1 + (SELECT MAX(ROWID) FROM %sChanges), 0), ?, ?"), *(void *)v7);
    LODWORD(v9) = 0;
    CFArrayRef v14 = 0;
  }
  CFStringAppend(Mutable, @";"));
  CFStringRef v34 = CSDBSqliteConnectionStatementForSQL(a1, Mutable);
  if (v34)
  {
    uint64_t v35 = v34;
    if (*((void *)v34 + 1))
    {
      uint64_t v36 = *(void *)(a2 + 16);
      if (v36)
      {
        sqlite3_int64 v37 = *(int *)(a2 + 32);
        if ((int)v37 >= -1)
        {
LABEL_45:
          CSDBSqliteBindInt64((uint64_t)v34, v37);
          CSDBSqliteBindInt((uint64_t)v35, a3);
          CSDBSqliteStatementBindValuesForColumns((uint64_t)v35, (uint64_t)v14, v9);
          CSDBSqliteStatementPerform(v35);
          CSDBSqliteStatementReset(v35);
          goto LABEL_46;
        }
        if ((v37 & 0x7FFFFFFF) < *(_DWORD *)(v36 + 104))
        {
          sqlite3_int64 v37 = *(void *)(*(void *)(v36 + 112) + 8 * (v37 & 0x7FFFFFFF));
          goto LABEL_45;
        }
      }
      sqlite3_int64 v37 = -1;
      goto LABEL_45;
    }
  }
LABEL_46:
  free(v14);
  CFRelease(Mutable);
}

void sub_215283F74(uint64_t a1, uint64_t a2, int a3)
{
  if (a2)
  {
    CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
    CFStringAppendFormat(Mutable, 0, @"INSERT OR REPLACE INTO %sBasicChanges (record, type, sequenceNumber)", **(void **)(a2 + 24));
    CFStringAppend(Mutable, @" VALUES(?, ?, ?);");
    uint64_t v7 = CSDBSqliteConnectionStatementForSQL(a1, Mutable);
    if (v7)
    {
      uint64_t v8 = v7;
      if (*((void *)v7 + 1))
      {
        uint64_t v9 = *(void *)(a2 + 16);
        if (v9)
        {
          sqlite3_int64 v10 = *(int *)(a2 + 32);
          if ((int)v10 < -1)
          {
            if ((v10 & 0x7FFFFFFF) >= *(_DWORD *)(v9 + 104)) {
              sqlite3_int64 v10 = -1;
            }
            else {
              sqlite3_int64 v10 = *(void *)(*(void *)(v9 + 112) + 8 * (v10 & 0x7FFFFFFF));
            }
          }
          CSDBSqliteBindInt64((uint64_t)v7, v10);
          CSDBSqliteBindInt((uint64_t)v8, a3);
          CSDBSqliteBindInt((uint64_t)v8, *(_DWORD *)(*(void *)(a2 + 16) + 96) + 1);
          CSDBSqliteStatementPerform(v8);
          CSDBSqliteStatementReset(v8);
        }
      }
    }
    CFRelease(Mutable);
  }
}

void sub_21528408C(unsigned int *value, char a2, uint64_t *a3)
{
  CFSetRef v6 = *(const __CFSet **)(*((void *)value + 2) + 48);
  if (v6 && CFSetContainsValue(v6, value)) {
    return;
  }
  uint64_t v7 = *((void *)value + 3);
  uint64_t v8 = *(void (**)(unsigned int *, uint64_t))(v7 + 48);
  if (v8) {
    v8(value, a3[1]);
  }
  unsigned int v33 = -1431655766;
  unsigned int v9 = value[8];
  sqlite3_int64 v10 = (const char **)sub_215284368((uint64_t)value, (int *)&v33, 1);
  CFStringRef v11 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], *(const char **)v7, 0x8000100u);
  int v12 = (__CFDictionary *)sub_21527E74C(*a3, (void *)v7);
  sqlite3_int64 v13 = value[8];
  if (v13 == -1) {
    goto LABEL_10;
  }
  uint64_t v14 = *a3;
  if (!*a3) {
    goto LABEL_10;
  }
  if ((int)v13 >= -1) {
    goto LABEL_11;
  }
  if ((v13 & 0x7FFFFFFF) >= *(_DWORD *)(v14 + 104)) {
LABEL_10:
  }
    sqlite3_int64 v13 = -1;
  else {
    sqlite3_int64 v13 = *(void *)(*(void *)(v14 + 112) + 8 * (v13 & 0x7FFFFFFF));
  }
LABEL_11:
  CSDBSqliteConnectionAddRecordWithRowid(a3[1], v11, v13, v10, v33);
  signed int RecordIDForRowid = value[8];
  if (RecordIDForRowid == -1)
  {
    uint64_t v16 = *a3;
    sqlite3_int64 Insert = CSDBSqliteConnectionRowidOfLastInsert(a3[1]);
    signed int RecordIDForRowid = CSDBRecordStoreGetRecordIDForRowid(v16, Insert);
    value[8] = RecordIDForRowid;
  }
  if (v12) {
    CFDictionarySetValue(v12, (const void *)RecordIDForRowid, value);
  }
  CFRelease(v11);
  free(v10);
  CFDictionaryRef v18 = (const __CFDictionary *)*((void *)value + 5);
  if (v18)
  {
    *((void *)value + 5) = 0;
    uint64_t v19 = a3[1];
    uint64_t context = value;
    uint64_t v32 = v19;
    if (v9 != -1)
    {
      CFDictionaryApplyFunction(v18, (CFDictionaryApplierFunction)sub_2152845BC, &context);
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v20 = a3[1];
    uint64_t context = value;
    uint64_t v32 = v20;
    if (v9 != -1) {
      goto LABEL_25;
    }
  }
  uint64_t v21 = *(unsigned int *)(*((void *)value + 3) + 72);
  if ((int)v21 >= 1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 40 * v21;
    do
    {
      uint64_t v25 = *(void *)(*((void *)value + 3) + 80) + v22;
      if ((*(unsigned char *)(v25 + 25) & 2) == 0)
      {
        CFRange v26 = *(void (**)(unsigned int *, uint64_t, uint64_t))(*(void *)(v25 + 16) + 32);
        if (v26) {
          v26(value, v23, v32);
        }
      }
      uint64_t v23 = (v23 + 1);
      v22 += 40;
    }
    while (v24 != v22);
  }
LABEL_25:
  if (*a3)
  {
    char v27 = *(unsigned char *)(*a3 + 57);
    if ((v27 & 1) == 0 || (a2 & 1) == 0 || (*(unsigned char *)(*((void *)value + 3) + 56) & 2) == 0)
    {
LABEL_31:
      if ((v27 & 2) != 0 && (a2 & 4) != 0 && (*(unsigned char *)(*((void *)value + 3) + 56) & 8) != 0) {
        sub_215283F74(a3[1], (uint64_t)value, 0);
      }
      goto LABEL_35;
    }
    sub_215283BD0(a3[1], (uint64_t)value, 0, 0);
    if (*a3)
    {
      char v27 = *(unsigned char *)(*a3 + 57);
      goto LABEL_31;
    }
  }
LABEL_35:
  CFDictionaryRef v28 = *(void (**)(unsigned int *, uint64_t))(v7 + 104);
  if (v28) {
    v28(value, a3[1]);
  }
  if (v18) {
    CFRelease(v18);
  }
  uint64_t v29 = (const void *)*((void *)value + 5);
  if (v29)
  {
    CFRelease(v29);
    *((void *)value + 5) = 0;
  }
  CFDictionaryRef v30 = (const __CFDictionary *)*((void *)value + 6);
  if (v30)
  {
    CFDictionaryApplyFunction(v30, (CFDictionaryApplierFunction)sub_215280EEC, value);
    CFRelease(*((CFTypeRef *)value + 6));
    *((void *)value + 6) = 0;
  }
  *((unsigned char *)value + 58) = 1;
}

void *sub_215284368(uint64_t a1, int *a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 24);
  if (*(int *)(v4 + 72) < 1)
  {
    int v8 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = 0;
  int v8 = 0;
  uint64_t v9 = 24;
  do
  {
    int v10 = *(_DWORD *)(*(void *)(v4 + 80) + v9);
    if ((v10 & 4) != 0) {
      goto LABEL_11;
    }
    if (v10)
    {
      if (a3 && (v10 & 0x240) != 0) {
LABEL_10:
      }
        ++v8;
    }
    else if (a3 || sub_2152845EC(a1, v7))
    {
      goto LABEL_10;
    }
LABEL_11:
    ++v7;
    uint64_t v4 = *(void *)(a1 + 24);
    v9 += 40;
  }
  while (v7 < *(int *)(v4 + 72));
  if (v8 < 1)
  {
LABEL_37:
    CFStringRef v11 = 0;
    goto LABEL_38;
  }
  CFStringRef v11 = malloc_type_calloc(1uLL, 24 * v8, 0x10720403E5D127AuLL);
  uint64_t v12 = *(void *)(a1 + 24);
  if (*(int *)(v12 + 72) >= 1)
  {
    uint64_t v29 = a2;
    uint64_t v13 = 0;
    int v14 = 0;
    while (1)
    {
      uint64_t v15 = *(void *)(v12 + 80);
      uint64_t v16 = v15 + 40 * v13;
      int v19 = *(_DWORD *)(v16 + 24);
      CFDictionaryRef v18 = (unsigned char *)(v16 + 24);
      __int16 v17 = v19;
      if ((v19 & 4) == 0)
      {
        if (v17)
        {
          if (a3 && (v17 & 0x240) != 0)
          {
LABEL_22:
            uint64_t v20 = 0;
            v11[3 * v14] = *(void *)(v15 + 40 * v13);
            uint64_t v21 = v15 + 40 * v13;
            uint64_t v24 = *(void *)(v21 + 8);
            uint64_t v23 = (void *)(v21 + 8);
            uint64_t v22 = v24;
            uint64_t v25 = qword_21528D9A0;
            do
            {
              uint64_t v26 = *v25;
              v25 += 2;
              if (v26 == v22) {
                break;
              }
              ++v20;
            }
            while (v20 != 4);
            v11[3 * v14 + 1] = qword_21528D9A0[2 * v20 + 1];
            uint64_t Property = (__CFString *)CSDBRecordGetProperty(a1, v13);
            if (!Property)
            {
              if ((*v18 & 0x40) != 0)
              {
                if (*v23 == 2)
                {
                  pthread_once(&stru_26AB04368, (void (*)(void))sub_215280C28);
                  uint64_t Property = (__CFString *)qword_26AB043F0;
                }
                else if (*v23 == 1)
                {
                  uint64_t Property = &stru_26C5DE380;
                }
                else
                {
                  uint64_t Property = 0;
                }
              }
              else
              {
                uint64_t Property = 0;
              }
            }
            v11[3 * v14++ + 2] = Property;
          }
        }
        else if (a3 || sub_2152845EC(a1, v13))
        {
          goto LABEL_22;
        }
      }
      ++v13;
      uint64_t v12 = *(void *)(a1 + 24);
      if (v13 >= *(int *)(v12 + 72))
      {
        a2 = v29;
        break;
      }
    }
  }
LABEL_38:
  *a2 = v8;
  return v11;
}

uint64_t sub_2152845BC(int a1, uint64_t a2, uint64_t *a3)
{
  uint64_t result = *a3;
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(*a3 + 24) + 80) + 40 * a1 + 16) + 32);
  if (v5) {
    return v5();
  }
  return result;
}

CFDictionaryRef sub_2152845EC(uint64_t a1, int a2)
{
  if (!a1) {
    sub_21528CBBC();
  }
  CFDictionaryRef result = *(const __CFDictionary **)(a1 + 40);
  if (result) {
    return (const __CFDictionary *)(CFDictionaryGetValueIfPresent(result, (const void *)a2, 0) != 0);
  }
  return result;
}

void sub_215284624(uint64_t a1, char a2, uint64_t *a3)
{
  if (!a1 || !a3 || !a3[1]) {
    sub_21528CBE8();
  }
  unsigned int v17 = -1431655766;
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void (**)(uint64_t))(v6 + 48);
  if (v7) {
    v7(a1);
  }
  int v8 = (long long *)sub_215284368(a1, (int *)&v17, 0);
  CFStringRef v9 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], *(const char **)v6, 0x8000100u);
  uint64_t v10 = *a3;
  if (!*a3) {
    goto LABEL_31;
  }
  sqlite3_int64 v11 = *(int *)(a1 + 32);
  if ((int)v11 >= -1) {
    goto LABEL_10;
  }
  if ((v11 & 0x7FFFFFFF) < *(_DWORD *)(v10 + 104)) {
    sqlite3_int64 v11 = *(void *)(*(void *)(v10 + 112) + 8 * (v11 & 0x7FFFFFFF));
  }
  else {
LABEL_31:
  }
    sqlite3_int64 v11 = -1;
LABEL_10:
  CSDBSqliteConnectionUpdateRecord(a3[1], v9, v11, v8, v17);
  CFRelease(v9);
  free(v8);
  CFDictionaryRef v12 = *(const __CFDictionary **)(a1 + 40);
  if (v12)
  {
    *(void *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = 0;
    uint64_t v13 = a3[1];
    context[0] = a1;
    context[1] = v13;
    CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)sub_2152845BC, context);
  }
  int v14 = *(void (**)(uint64_t, uint64_t))(v6 + 104);
  if (v14) {
    v14(a1, a3[1]);
  }
  if ((a2 & 1) != 0 && *a3 && (*(unsigned char *)(*a3 + 57) & 1) != 0 && (*(unsigned char *)(*(void *)(a1 + 24) + 56) & 2) != 0) {
    sub_215283BD0(a3[1], a1, 1, v12);
  }
  if ((a2 & 4) != 0 && *a3 && (*(unsigned char *)(*a3 + 57) & 2) != 0 && (*(unsigned char *)(*(void *)(a1 + 24) + 56) & 8) != 0) {
    sub_215283F74(a3[1], a1, 1);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (*(void *)(a1 + 40)) {
    sub_21528CC14();
  }
  CFDictionaryRef v15 = *(const __CFDictionary **)(a1 + 48);
  if (v15)
  {
    CFDictionaryApplyFunction(v15, (CFDictionaryApplierFunction)sub_215280EEC, (void *)a1);
    CFRelease(*(CFTypeRef *)(a1 + 48));
    *(void *)(a1 + 48) = 0;
  }
}

void sub_215284808(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(a2 + 36) = a3;
}

void sub_215284810(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 16) = 0;
}

uint64_t sub_215284818(uint64_t a1, void *a2, int a3)
{
  CFDictionaryRef v6 = (const __CFDictionary *)sub_21527E74C(a1, a2);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = (const void *)a3;
  CFDictionaryRef Value = CFDictionaryGetValue(v6, (const void *)a3);
  if (!Value) {
    return 0;
  }
  uint64_t v9 = sub_215281434((uint64_t)Value);
  if (v9)
  {
    CFDictionaryRef v10 = (const __CFDictionary *)sub_215283628(a1, a2);
    if (v10)
    {
      if (CFDictionaryContainsKey(v10, v7)) {
        return 0;
      }
    }
  }
  return v9;
}

uint64_t sub_215284898()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_26AB043C0 = result;
  return result;
}

void sub_2152848C0(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 16);
  if (v1) {
    CFRelease(v1);
  }
}

CFStringRef sub_2152848D0(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"<CSDBRecordDeleteInfo: %p>", a1);
}

void sub_215284910(uint64_t a1, uint64_t a2)
{
}

void *CSDBSqliteDatabaseCreateWithPath(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef v2 = malloc_type_calloc(1uLL, 0xC8uLL, 0x10E00403D130332uLL);
  *CFDictionaryRef v2 = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a1);
  return v2;
}

uint64_t CSDBSqliteDatabaseSetLookAsideConfig(uint64_t result, uint64_t a2, int a3)
{
  if (result)
  {
    *(void *)(result + 188) = a2;
    *(_DWORD *)(result + 196) = a3;
  }
  return result;
}

uint64_t CSDBSqliteDatabaseSetVersion(uint64_t result, int a2)
{
  if (result)
  {
    *(unsigned char *)(result + 84) |= 1u;
    *(_DWORD *)(result + 8CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = a2;
  }
  return result;
}

uint64_t CSDBSqliteDatabaseSetDataProtectionClass(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 184) = a2;
  }
  return result;
}

uint64_t CSDBSqliteConnectionDatabaseVersion(uint64_t a1)
{
  BOOL v2 = 0;
  LODWORD(result) = sub_215287504(a1, @"_ClientVersion", 0, &v2);
  if (v2) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t CSDBSqliteDatabaseSetSetupHandler(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(void *)(result + 16) = a2;
    *(void *)(result + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = a3;
  }
  return result;
}

uint64_t CSDBSqliteDatabaseSetShouldMigrateInExternalProcess(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 64) = a2;
  }
  return result;
}

uint64_t CSDBSqliteDatabaseSetConnectionInitializer(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 32) = a2;
  }
  return result;
}

uint64_t CSDBSqliteDatabaseVacuum(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a1)
  {
    errmsg = 0;
    uint64_t v1 = sqlite3_exec(*(sqlite3 **)(a1 + 8), "vacuum;", 0, 0, &errmsg);
    uint64_t v2 = v1;
    if (v1 && v1 != 101)
    {
      if (IMOSLoggingEnabled())
      {
        int v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v12 = v2;
          __int16 v13 = 2080;
          int v14 = errmsg;
          uint64_t v4 = "Unable to vacuum database. SQLiteResult: %d error message: %s";
          uint64_t v5 = v8;
          uint32_t v6 = 18;
          goto LABEL_13;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      int v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v4 = "SQLite vacumm was successful.";
        uint64_t v5 = v3;
        uint32_t v6 = 2;
LABEL_13:
        _os_log_impl(&dword_21527C000, v5, OS_LOG_TYPE_INFO, v4, buf, v6);
      }
    }
    if (errmsg) {
      free(errmsg);
    }
    return v2;
  }
  if (!IMOSLoggingEnabled()) {
    return 1;
  }
  uint64_t v7 = OSLogHandleForIMFoundationCategory();
  uint64_t v2 = 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21527C000, v7, OS_LOG_TYPE_INFO, "Unable to vaccum db, NULL connection.", buf, 2u);
  }
  return v2;
}

uint64_t CSDBSqliteDatabaseCheckpointAndVacuum(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a1)
  {
    errmsg = 0;
    int v2 = sqlite3_exec(*(sqlite3 **)(a1 + 8), "vacuum;", 0, 0, &errmsg);
    int v3 = v2;
    if (v2 && v2 != 101)
    {
      if (IMOSLoggingEnabled())
      {
        CFDictionaryRef v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v20 = v3;
          __int16 v21 = 2080;
          uint64_t v22 = errmsg;
          uint64_t v5 = "Unable to vacuum database. SQLiteResult: %d error message: %s";
          uint32_t v6 = v10;
          uint32_t v7 = 18;
          goto LABEL_13;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v5 = "SQLite vacumm was successful.";
        uint32_t v6 = v4;
        uint32_t v7 = 2;
LABEL_13:
        _os_log_impl(&dword_21527C000, v6, OS_LOG_TYPE_INFO, v5, buf, v7);
      }
    }
    uint64_t v11 = sqlite3_exec(*(sqlite3 **)(a1 + 8), "PRAGMA wal_checkpoint(RESTART);", 0, 0, &errmsg);
    uint64_t v9 = v11;
    if (v11 && v11 != 101)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v20 = v9;
          __int16 v21 = 2080;
          uint64_t v22 = errmsg;
          __int16 v13 = "Unable to wal_checkpoint database. SQLiteResult: %d error message: %s";
          int v14 = v16;
          uint32_t v15 = 18;
          goto LABEL_22;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        __int16 v13 = "SQLite wal_checkpoint was successful.";
        int v14 = v12;
        uint32_t v15 = 2;
LABEL_22:
        _os_log_impl(&dword_21527C000, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
      }
    }
    if (errmsg) {
      free(errmsg);
    }
    return v9;
  }
  if (!IMOSLoggingEnabled()) {
    return 1;
  }
  int v8 = OSLogHandleForIMFoundationCategory();
  uint64_t v9 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21527C000, v8, OS_LOG_TYPE_INFO, "Unable to vaccum db, NULL connection.", buf, 2u);
  }
  return v9;
}

void *CSDBSqliteDatabaseSetMigrationHandlers(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    result[6] = a2;
    result[7] = a3;
    result[9] = a4;
  }
  return result;
}

void CSDBSqliteDatabaseCloseAllConnections(uint64_t a1)
{
  int v2 = *(void **)(a1 + 8);
  if (v2)
  {
    sub_21527E514(v2);
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t CSDBSqliteDatabasePath(uint64_t a1)
{
  return *(void *)a1;
}

void CSDBSqliteDeleteDatabase(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = [NSString alloc];
    uint64_t v4 = objc_msgSend_initWithFormat_(v2, v3, @"%@-shm", a1);
    id v5 = [NSString alloc];
    uint32_t v7 = objc_msgSend_initWithFormat_(v5, v6, @"%@-wal", a1);
    id v8 = [NSString alloc];
    CFDictionaryRef v10 = objc_msgSend_initWithFormat_(v8, v9, @"%@-journal", a1);
    if (IMOSLoggingEnabled())
    {
      __int16 v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v21 = a1;
        _os_log_impl(&dword_21527C000, v13, OS_LOG_TYPE_INFO, "Unlinking the source database %@.", buf, 0xCu);
      }
    }
    int v14 = (const char *)objc_msgSend_UTF8String(a1, v11, v12);
    unlink(v14);
    if (v4)
    {
      unsigned int v17 = (const char *)objc_msgSend_UTF8String(v4, v15, v16);
      unlink(v17);
    }
    if (v7)
    {
      CFDictionaryRef v18 = (const char *)objc_msgSend_UTF8String(v7, v15, v16);
      unlink(v18);
    }
    if (v10)
    {
      int v19 = (const char *)objc_msgSend_UTF8String(v10, v15, v16);
      unlink(v19);
    }
  }
}

void CSDBSqliteBackupDatabase(uint64_t a1, const __CFString *a2)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = a2;
      _os_log_impl(&dword_21527C000, v4, OS_LOG_TYPE_INFO, "Backing up database to path %@", buf, 0xCu);
    }
  }
  memset(&buf[1], 170, 0x3FFuLL);
  memset(&buffer[1], 170, 0x3FFuLL);
  buf[0] = 0;
  buffer[0] = 0;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int v51 = 138412290;
      *(void *)uint64_t v52 = a2;
      _os_log_impl(&dword_21527C000, v5, OS_LOG_TYPE_INFO, "Destination path: %@", v51, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint32_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      CFStringRef v7 = *(CFStringRef *)a1;
      *(_DWORD *)int v51 = 138412290;
      *(void *)uint64_t v52 = v7;
      _os_log_impl(&dword_21527C000, v6, OS_LOG_TYPE_INFO, "Source path: %@", v51, 0xCu);
    }
  }
  CFStringGetCString(a2, (char *)buf, 1024, 0x8000100u);
  CFStringGetCString(*(CFStringRef *)a1, buffer, 1024, 0x8000100u);
  int v8 = *(_DWORD *)(a1 + 184);
  if (v8) {
    int v9 = 4194306;
  }
  else {
    int v9 = 3145730;
  }
  if (v8 == 1) {
    int v10 = 1048578;
  }
  else {
    int v10 = v9;
  }
  ppDb = 0;
  int v11 = sqlite3_open_v2(buffer, &ppDb, v10, 0);
  if (!v11)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v51 = 0;
        _os_log_impl(&dword_21527C000, v12, OS_LOG_TYPE_INFO, "Opened the source database to force WAL journal mode.", v51, 2u);
      }
    }
    sqlite3_exec(ppDb, "pragma JOURNAL_MODE=wal", 0, 0, 0);
    if (IMOSLoggingEnabled())
    {
      __int16 v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v51 = 0;
        _os_log_impl(&dword_21527C000, v13, OS_LOG_TYPE_INFO, "Closing the source database to clean up any support files.", v51, 2u);
      }
    }
    sqlite3_close(ppDb);
    ppDb = 0;
    int v11 = sqlite3_open_v2(buffer, &ppDb, v10, 0);
    if (!v11)
    {
      if (IMOSLoggingEnabled())
      {
        int v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v51 = 0;
          _os_log_impl(&dword_21527C000, v19, OS_LOG_TYPE_INFO, "Opened the source database.", v51, 2u);
        }
      }
      int v20 = *(_DWORD *)(a1 + 184);
      int v21 = 4194310;
      if (!v20) {
        int v21 = 3145734;
      }
      if (v20 == 1) {
        int v22 = 1048582;
      }
      else {
        int v22 = v21;
      }
      v49 = 0;
      int v23 = sqlite3_open_v2((const char *)buf, &v49, v22, 0);
      int v24 = IMOSLoggingEnabled();
      if (v23)
      {
        if (!v24) {
          return;
        }
        uint64_t v25 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
          return;
        }
        uint64_t v26 = sqlite3_errmsg(v49);
        *(_DWORD *)int v51 = 67109378;
        *(_DWORD *)uint64_t v52 = v23;
        *(_WORD *)&v52[4] = 2080;
        *(void *)&v52[6] = v26;
        uint64_t v16 = "Unable to open the destination database. SQLite error: [%d] %s";
        goto LABEL_65;
      }
      if (v24)
      {
        char v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v51 = 0;
          _os_log_impl(&dword_21527C000, v27, OS_LOG_TYPE_INFO, "Opened the destination database.", v51, 2u);
        }
      }
      int v28 = sqlite3_file_control(v49, 0, 102, ppDb);
      int v29 = IMOSLoggingEnabled();
      if (v28)
      {
        if (v29)
        {
          CFDictionaryRef v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            unsigned int v31 = sqlite3_errmsg(v49);
            uint64_t v32 = sqlite3_errmsg(ppDb);
            *(_DWORD *)int v51 = 67109634;
            *(_DWORD *)uint64_t v52 = v28;
            *(_WORD *)&v52[4] = 2080;
            *(void *)&v52[6] = v31;
            __int16 v53 = 2080;
            v54 = v32;
            unsigned int v33 = "Replacing messages database from restore failed. SQLite error: [%d] Destination: %s Source: %s";
            CFStringRef v34 = v30;
            uint32_t v35 = 28;
LABEL_52:
            _os_log_impl(&dword_21527C000, v34, OS_LOG_TYPE_INFO, v33, v51, v35);
          }
        }
      }
      else if (v29)
      {
        uint64_t v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v51 = 0;
          unsigned int v33 = "Database replacement was successful.";
          CFStringRef v34 = v36;
          uint32_t v35 = 2;
          goto LABEL_52;
        }
      }
      int v37 = sqlite3_close(v49);
      int v38 = IMOSLoggingEnabled();
      if (v37)
      {
        if (!v38) {
          goto LABEL_61;
        }
        char v39 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
          goto LABEL_61;
        }
        CFMutableStringRef v40 = sqlite3_errmsg(v49);
        *(_DWORD *)int v51 = 67109378;
        *(_DWORD *)uint64_t v52 = v37;
        *(_WORD *)&v52[4] = 2080;
        *(void *)&v52[6] = v40;
        uint64_t v41 = "Unable to close the destination database. SQLite error: [%d] %s";
        uint64_t v42 = v39;
        uint32_t v43 = 18;
      }
      else
      {
        if (!v38) {
          goto LABEL_61;
        }
        v44 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO)) {
          goto LABEL_61;
        }
        *(_WORD *)int v51 = 0;
        uint64_t v41 = "Closed the destination database.";
        uint64_t v42 = v44;
        uint32_t v43 = 2;
      }
      _os_log_impl(&dword_21527C000, v42, OS_LOG_TYPE_INFO, v41, v51, v43);
LABEL_61:
      int v45 = sqlite3_close(ppDb);
      int v46 = IMOSLoggingEnabled();
      if (!v45)
      {
        if (v46)
        {
          CFMutableStringRef v48 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)int v51 = 0;
            uint64_t v16 = "Closed the source database.";
            unsigned int v17 = v48;
            uint32_t v18 = 2;
            goto LABEL_28;
          }
        }
        return;
      }
      if (!v46) {
        return;
      }
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
        return;
      }
      unint64_t v47 = sqlite3_errmsg(ppDb);
      *(_DWORD *)int v51 = 67109378;
      *(_DWORD *)uint64_t v52 = v45;
      *(_WORD *)&v52[4] = 2080;
      *(void *)&v52[6] = v47;
      uint64_t v16 = "Unable to close the source database. SQLite error: [%d] %s";
LABEL_65:
      unsigned int v17 = v25;
      goto LABEL_27;
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint32_t v15 = sqlite3_errmsg(ppDb);
      *(_DWORD *)int v51 = 67109378;
      *(_DWORD *)uint64_t v52 = v11;
      *(_WORD *)&v52[4] = 2080;
      *(void *)&v52[6] = v15;
      uint64_t v16 = "Unable to open the source database. SQLite error: [%d] %s";
      unsigned int v17 = v14;
LABEL_27:
      uint32_t v18 = 18;
LABEL_28:
      _os_log_impl(&dword_21527C000, v17, OS_LOG_TYPE_INFO, v16, v51, v18);
    }
  }
}

void sub_21528579C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2152853B8);
  }
  _Unwind_Resume(a1);
}

sqlite3 **sub_215285890(uint64_t a1, const char *a2, unsigned char *a3, char a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t result = sub_215289A28((uint64_t *)a1, a2, a4);
  uint64_t v25 = result;
  if (result)
  {
    uint64_t v8 = (uint64_t)result;
    char v24 = 0;
    int v9 = *(_DWORD *)(a1 + 80);
    if (sub_21527F0A8((uint64_t)result, @"SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;", 1))
    {
      if (*(unsigned char *)(a1 + 84))
      {
        buf[0] = 0;
        unsigned int v13 = sub_215287504(v8, @"_ClientVersion", 0, (BOOL *)buf);
        if (buf[0]) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 0;
        }
        sub_215289E50((void ****)&v25, &v24);
        uint32_t v15 = v25;
        if (v25 && v14 != *(_DWORD *)(a1 + 80))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              int v17 = *(_DWORD *)(a1 + 80);
              *(_DWORD *)buf = 67109376;
              int v27 = v17;
              __int16 v28 = 1024;
              int v29 = v14;
              _os_log_impl(&dword_21527C000, v16, OS_LOG_TYPE_INFO, "version conflict: expected %d, got %d", buf, 0xEu);
            }
          }
          CSDBSqliteConnectionBeginTransactionType((uint64_t)v15, 0);
          sub_215289E50((void ****)&v25, &v24);
          if (v25)
          {
            int v23 = 0;
            uint64_t v14 = sub_215287504((uint64_t)v25, @"_ClientVersion", &v23, 0);
            if (IMOSLoggingEnabled())
            {
              uint32_t v18 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109376;
                int v27 = v14;
                __int16 v28 = 1024;
                int v29 = v23;
                _os_log_impl(&dword_21527C000, v18, OS_LOG_TYPE_INFO, "read schema version: %d error: %d", buf, 0xEu);
              }
            }
            sub_215289E50((void ****)&v25, &v24);
            if (v25)
            {
              if (v23 == 17)
              {
                sub_21527E514(v25);
                uint64_t v25 = 0;
                if (a3) {
                  *a3 = 1;
                }
              }
              else
              {
                if (*(_DWORD *)(a1 + 80) == v14)
                {
                  if (IMOSLoggingEnabled())
                  {
                    int v19 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_21527C000, v19, OS_LOG_TYPE_INFO, "version conflict resolved externally", buf, 2u);
                    }
                  }
                  sub_21528A004((uint64_t *)a1, a2, (sqlite3 ***)&v25);
                }
                else
                {
                  if (*(unsigned char *)(a1 + 64)) {
                    char v20 = sub_21528A080(a1, a2, (uint64_t *)&v25);
                  }
                  else {
                    char v20 = sub_21528A260(a1, a2, v14, (sqlite3 ***)&v25);
                  }
                  char v24 = v20;
                }
                if (v25) {
                  CSDBSqliteConnectionCommit((uint64_t)v25);
                }
              }
            }
          }
        }
        char v10 = 0;
LABEL_39:
        if (*(unsigned char *)(a1 + 64))
        {
          if (!v24) {
            return (sqlite3 **)v25;
          }
          if (!IMOSLoggingEnabled()) {
            goto LABEL_49;
          }
          int v21 = OSLogHandleForIMFoundationCategory();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
            goto LABEL_49;
          }
          *(_WORD *)buf = 0;
          int v22 = "DataMigrator did not work -- we are being forced to delete the database and create it ourselves.";
        }
        else
        {
          if (!v24)
          {
            if ((v10 & 1) == 0) {
              return (sqlite3 **)v25;
            }
            goto LABEL_50;
          }
          if (!IMOSLoggingEnabled()
            || (int v21 = OSLogHandleForIMFoundationCategory(), !os_log_type_enabled(v21, OS_LOG_TYPE_INFO)))
          {
LABEL_49:
            sub_21528A600(a1, a2, v9, v14, (sqlite3 ***)&v25);
LABEL_50:
            sub_21528AEE4(a1, a2, (uint64_t)v25);
            return (sqlite3 **)v25;
          }
          *(_WORD *)buf = 0;
          int v22 = "Migrating the database failed. We must delete this database and start fresh";
        }
        _os_log_impl(&dword_21527C000, v21, OS_LOG_TYPE_INFO, v22, buf, 2u);
        goto LABEL_49;
      }
      char v10 = 0;
    }
    else
    {
      BOOL v11 = *(unsigned char *)(a1 + 64) == 0;
      sub_215289E50((void ****)&v25, &v24);
      if (v11)
      {
        char v10 = v25 != 0;
      }
      else if (v24 || (char v10 = (char)v25, v25))
      {
        char v12 = sub_21528A080(a1, a2, (uint64_t *)&v25);
        char v10 = 0;
        char v24 = v12;
      }
    }
    uint64_t v14 = 0xFFFFFFFFLL;
    goto LABEL_39;
  }
  return result;
}

void sub_215285D08(uint64_t a1)
{
  uint64_t v4 = (void *)MEMORY[0x2166B6390]();
  if (!qword_26AB04400) {
    qword_26AB04400 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  id v5 = sub_215285DE8(*(void **)(a1 + 32), v2, v3);
  uint64_t v7 = objc_msgSend_stringByAppendingString_(@"com.apple.coresdb.mandatory_db_reconnect_required.", v6, (uint64_t)v5);
  if (v5) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    CFStringRef v10 = (const __CFString *)v7;
    char v11 = objc_msgSend_containsObject_((void *)qword_26AB04400, v8, (uint64_t)v5);
    if ((v11 & 1) == 0)
    {
      objc_msgSend_addObject_((void *)qword_26AB04400, v12, (uint64_t)v5);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_215285EB0, v10, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    goto LABEL_12;
  }
  if (v5) {
LABEL_12:
  }
    CFRelease(v5);
}

void *sub_215285DE8(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = (const char *)objc_msgSend_UTF8String(a1, a2, a3);
  memset(md, 170, sizeof(md));
  CC_LONG v4 = strlen(v3);
  CC_MD5(v3, v4, md);
  id v5 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v8 = objc_msgSend_initWithCapacity_(v5, v6, 32);
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend_appendFormat_(v8, v7, @"%02x", md[i], *(void *)md, *(void *)&md[8]);
  return v8;
}

void sub_215285EB0(uint64_t a1, uint64_t a2, void *a3)
{
  pthread_mutex_lock(&stru_267866AA0);
  uint32_t v6 = objc_msgSend_copy((void *)qword_267866B08, v4, v5);
  pthread_mutex_unlock(&stru_267866AA0);
  uint64_t v9 = objc_msgSend_length(@"com.apple.coresdb.mandatory_db_reconnect_required.", v7, v8);
  uint64_t v11 = objc_msgSend_substringFromIndex_(a3, v10, v9);
  if (v11 && v6)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_21528B248;
    v13[3] = &unk_264238D20;
    v13[4] = v11;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v12, (uint64_t)v13);
  }
}

uint64_t **CSDBSqliteDatabaseReleaseSqliteStatement(uint64_t **result)
{
  uint64_t v1 = **result;
  if (v1)
  {
    if ((*(unsigned char *)(v1 + 84) & 4) != 0) {
      return (uint64_t **)pthread_mutex_unlock((pthread_mutex_t *)(v1 + 88));
    }
  }
  return result;
}

CFStringRef CSDBSqliteDatabaseCopyValueForProperty(uint64_t a1, const __CFString *a2)
{
  uint64_t v3 = (uint64_t *)CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
  if (!v3) {
    return 0;
  }
  CC_LONG v4 = v3;
  CFStringRef v5 = CSDBSqliteConnectionCopyValueForProperty(v3, a2);
  uint64_t v6 = *v4;
  if (*v4 && (*(unsigned char *)(v6 + 84) & 4) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)(v6 + 88));
  }
  return v5;
}

CFStringRef CSDBSqliteConnectionCopyValueForProperty(void *a1, const __CFString *a2)
{
  if (!a1) {
    return 0;
  }
  if (!*a1) {
    return 0;
  }
  uint64_t v3 = (UInt8 *)sub_21527F0A8((uint64_t)a1, @"SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;", 0);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (uint64_t)v3;
  CSDBSqliteBindTextFromCFString(v3, a2);
  CFStringRef v5 = CSDBSqliteStatementCopyStringResult(v4);
  CSDBSqliteStatementReset(v4);
  return v5;
}

uint64_t CSDBSqliteDatabaseSetValueForProperty(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  uint64_t v5 = 1;
  uint64_t v6 = (uint64_t *)CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v5 = CSDBSqliteConnectionSetValueForProperty(v6, a2, a3);
    uint64_t v8 = *v7;
    if (*v7)
    {
      if ((*(unsigned char *)(v8 + 84) & 4) != 0) {
        pthread_mutex_unlock((pthread_mutex_t *)(v8 + 88));
      }
    }
  }
  return v5;
}

uint64_t CSDBSqliteConnectionSetValueForProperty(void *a1, const __CFString *a2, const __CFString *a3)
{
  uint64_t result = 1;
  if (a1 && a2 && *a1)
  {
    uint64_t v7 = (UInt8 *)sub_21527F0A8((uint64_t)a1, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);",
                    0);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      CSDBSqliteBindTextFromCFString(v7, a2);
      if (a3) {
        CSDBSqliteBindTextFromCFString((UInt8 *)v8, a3);
      }
      else {
        CSDBSqliteBindNull(v8);
      }
      uint64_t v9 = *(sqlite3_stmt **)(v8 + 8);
      if (v9) {
        CSDBSqliteStepWithConnection(*(void *)v8, v9);
      }
      uint64_t result = CSDBSqliteStatementReset(v8);
      if (result == 17)
      {
        CFStringRef v10 = (__CFDictionary *)a1[2];
        if (v10
          && (CFDictionaryRemoveValue(v10, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
              (uint64_t v11 = (UInt8 *)sub_21527F0A8((uint64_t)a1, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);",
                                0)) != 0))
        {
          uint64_t v12 = (uint64_t)v11;
          CSDBSqliteBindTextFromCFString(v11, a2);
          if (a3) {
            CSDBSqliteBindTextFromCFString((UInt8 *)v12, a3);
          }
          else {
            CSDBSqliteBindNull(v12);
          }
          unsigned int v13 = *(sqlite3_stmt **)(v12 + 8);
          if (v13) {
            CSDBSqliteStepWithConnection(*(void *)v12, v13);
          }
          return CSDBSqliteStatementReset(v12);
        }
        else
        {
          return 17;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t CSDBSqliteDatabaseRegisterFunctionForDB(sqlite3 *a1, const char *a2, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), int nArg, void *a5)
{
  if (a1) {
    return sqlite3_create_function(a1, a2, nArg, 1, a5, xFunc, 0, 0);
  }
  else {
    return 1;
  }
}

uint64_t CSDBSqliteDatabaseSetLoggingEnabled(uint64_t a1, int a2)
{
  int v4 = sub_2152862F4();
  if (!sub_21528B1E8())
  {
    pthread_mutex_lock(&stru_26AB04378);
    dword_267866B10 = a2 != 0;
    pthread_mutex_unlock(&stru_26AB04378);
  }
  int v5 = sub_2152862F4();
  if (v5 != v4)
  {
    int v6 = v5;
    uint64_t v7 = CSDBSqliteDatabaseConnectionForWritingWithOwnership(a1, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t *)v7;
      if (v6) {
        uint64_t v9 = (int (__cdecl *)(unsigned int, void *, void *, void *))sub_215286340;
      }
      else {
        uint64_t v9 = 0;
      }
      sqlite3_trace_v2(*(sqlite3 **)(v7 + 8), 2u, v9, 0);
      uint64_t v10 = *v8;
      if (*v8 && (*(unsigned char *)(v10 + 84) & 4) != 0) {
        pthread_mutex_unlock((pthread_mutex_t *)(v10 + 88));
      }
    }
  }
  return 0;
}

BOOL sub_2152862F4()
{
  pthread_mutex_lock(&stru_26AB04378);
  int v0 = dword_267866B10;
  pthread_mutex_unlock(&stru_26AB04378);
  return (sub_21528B1E8() | v0) != 0;
}

uint64_t sub_215286340(int a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a1 == 2)
  {
    if (a4)
    {
      uint64_t v5 = *a4;
      if (IMOSLoggingEnabled())
      {
        int v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          int v8 = 136315394;
          uint64_t v9 = a3;
          __int16 v10 = 2048;
          uint64_t v11 = v5 >> 20;
          _os_log_impl(&dword_21527C000, v6, OS_LOG_TYPE_INFO, "==\nCSDBSqlite: %s\nTime: %llu ms\n", (uint8_t *)&v8, 0x16u);
        }
      }
    }
  }
  return 0;
}

uint64_t CSDBSqliteSetupLoggingForDatabaseHandle(sqlite3 *a1)
{
  uint64_t result = sub_2152862F4();
  if (a1 && result)
  {
    return sqlite3_trace_v2(a1, 2u, (int (__cdecl *)(unsigned int, void *, void *, void *))sub_215286340, 0);
  }
  return result;
}

uint64_t sub_215286494(uint64_t a1, int a2, char **a3, const char **a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v8 = *(unsigned __int8 *)(a1 + 16);
  if (!*(unsigned char *)(a1 + 16))
  {
    if (*(unsigned char *)(a1 + 1))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          __int16 v10 = *(const char **)(a1 + 8);
          int v20 = 136315138;
          int v21 = v10;
          _os_log_impl(&dword_21527C000, v9, OS_LOG_TYPE_INFO, "----- Explaining Query -----\n%s\n", (uint8_t *)&v20, 0xCu);
        }
      }
      int v8 = 1;
      *(unsigned char *)(a1 + 16) = 1;
      *(_DWORD *)(a1 + 2CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = 1;
    }
    else
    {
      int v8 = 0;
    }
  }
  if (a2 >= 1)
  {
    uint64_t v11 = a2;
    while (strcmp(*a4, "detail"))
    {
      ++a3;
      ++a4;
      if (!--v11) {
        return 0;
      }
    }
    uint64_t v12 = *a3;
    if (strstr(*a3, "WITH INDEX") || strstr(v12, "USING PRIMARY KEY"))
    {
      BOOL v13 = 0;
      if (*(unsigned char *)(a1 + 2) && !v8) {
        return 0;
      }
    }
    else
    {
      BOOL v13 = *(unsigned char *)(a1 + 2) != 0;
      if (!v8 && *(unsigned char *)(a1 + 2))
      {
        if (*(unsigned char *)(a1 + 1))
        {
          BOOL v13 = 1;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            uint32_t v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              int v19 = *(const char **)(a1 + 8);
              int v20 = 136315138;
              int v21 = v19;
              _os_log_impl(&dword_21527C000, v18, OS_LOG_TYPE_INFO, "--------------------------\n !!!!! NOT INDEXED !!!!!\n--------------------------\n%s\n--------------------------\n", (uint8_t *)&v20, 0xCu);
            }
          }
          BOOL v13 = 1;
          *(unsigned char *)(a1 + 16) = 1;
          *(_DWORD *)(a1 + 2CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = 2;
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint32_t v15 = "";
        uint64_t v16 = *a3;
        if (v13) {
          uint32_t v15 = " ***** NO INDEX *****";
        }
        int v20 = 136315394;
        int v21 = v15;
        __int16 v22 = 2080;
        int v23 = v16;
        _os_log_impl(&dword_21527C000, v14, OS_LOG_TYPE_INFO, " ==>>%s %s\n", (uint8_t *)&v20, 0x16u);
      }
    }
  }
  return 0;
}

uint64_t CSDBSqliteConnectionPerformSQL(uint64_t a1, const __CFString *a2)
{
  id v2 = sub_21527F0A8(a1, a2, 0);
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2;
  int v4 = (sqlite3_stmt *)v2[1];
  if (v4)
  {
    int v5 = CSDBSqliteStepWithConnection(*v2, v4);
    CSDBSqliteStatementReset(v3);
    if (v5 == 101) {
      return 101;
    }
  }
  else
  {
    CSDBSqliteStatementReset(v2);
  }
  uint64_t v7 = *(sqlite3 **)(*v3 + 8);
  return sqlite3_errcode(v7);
}

void CSDBSqliteConnectionSetBusyTimeout(double a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  qword_267866AE0 = *(void *)&a1;
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = 134217984;
      double v4 = a1;
      _os_log_impl(&dword_21527C000, v2, OS_LOG_TYPE_INFO, "Set Busy timeout to %f", (uint8_t *)&v3, 0xCu);
    }
  }
}

double CSDBSqliteConnectionGetBusyTimeout()
{
  return *(double *)&qword_267866AE0;
}

uint64_t CSDBSqliteConnectionBeginTransactionType(uint64_t a1, unsigned int a2)
{
  if (a2 > 2)
  {
    uint64_t result = 0;
  }
  else
  {
    CFStringRef v4 = off_264238D40[a2];
    uint64_t result = sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8));
    if (result) {
      uint64_t result = CSDBSqliteConnectionPerformSQL(a1, v4);
    }
  }
  if (result) {
    BOOL v6 = result == 101;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = v6;
  if (a2 != 0xFFFF)
  {
    if (v7) {
      *(_DWORD *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = a2;
    }
  }
  return result;
}

uint64_t CSDBSqliteConnectionBegin(uint64_t a1)
{
  return CSDBSqliteConnectionBeginTransactionType(a1, 0);
}

uint64_t CSDBSqliteConnectionCommit(uint64_t a1)
{
  if (sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8))) {
    return 0;
  }
  uint64_t result = CSDBSqliteConnectionPerformSQL(a1, @"COMMIT;");
  *(_DWORD *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = 0xFFFF;
  return result;
}

uint64_t CSDBSqliteConnectionRollback(uint64_t a1)
{
  if (sqlite3_get_autocommit(*(sqlite3 **)(a1 + 8))) {
    return 0;
  }
  uint64_t result = CSDBSqliteConnectionPerformSQL(a1, @"ROLLBACK;");
  *(_DWORD *)(a1 + 4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = 0xFFFF;
  return result;
}

uint64_t CSDBSqliteConnectionAddRecord(uint64_t a1, const __CFString *a2, const char **a3, unsigned int a4)
{
  return CSDBSqliteConnectionAddRecordWithRowid(a1, a2, -1, a3, a4);
}

uint64_t CSDBSqliteConnectionAddRecordWithRowid(uint64_t a1, const __CFString *a2, sqlite3_int64 a3, const char **a4, unsigned int a5)
{
  if (!a5)
  {
    MutableCFStringRef Copy = CFStringCreateMutableCopy(0, 0, @"INSERT INTO ");
    CFStringAppend(MutableCopy, a2);
    if (a3 == -1)
    {
      CFStringAppend(MutableCopy, @" (ROWID) VALUES(NULL);");
      uint64_t v16 = sub_21527F0A8(a1, MutableCopy, 0);
      if (v16) {
        goto LABEL_15;
      }
    }
    else
    {
      CFStringAppend(MutableCopy, @" (ROWID) VALUES(?);");
      uint64_t v16 = sub_21527F0A8(a1, MutableCopy, 0);
      CSDBSqliteBindInt64((uint64_t)v16, a3);
      if (v16)
      {
LABEL_15:
        int v17 = (sqlite3_stmt *)v16[1];
        if (v17) {
          uint64_t v18 = CSDBSqliteStepWithConnection(*v16, v17);
        }
        else {
          uint64_t v18 = 1;
        }
        CSDBSqliteStatementReset(v16);
LABEL_51:
        CFRelease(MutableCopy);
        return v18;
      }
    }
    if (!MutableCopy) {
      return 1;
    }
    CFMutableStringRef v27 = MutableCopy;
LABEL_47:
    CFRelease(v27);
    return 1;
  }
  uint64_t v9 = a4;
  BOOL v11 = a3 == -1 && a5 < 3;
  if (v11)
  {
    if (a5 == 1) {
      MutableCFStringRef Copy = @"?";
    }
    else {
      MutableCFStringRef Copy = @"?, ?";
    }
    BOOL v13 = *a4;
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  }
  else
  {
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    MutableCFStringRef Copy = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    CFStringAppend(MutableCopy, @"?");
    BOOL v13 = *v9;
    CFMutableStringRef Mutable = CFStringCreateMutable(v14, 0);
    if (a3 != -1)
    {
      CFStringAppend(MutableCopy, @", ?");
      CFStringAppend(Mutable, @"ROWID, ");
    }
  }
  CFStringRef v19 = CFStringCreateWithCString(v14, v13, 0x8000100u);
  CFStringAppend(Mutable, v19);
  CFRelease(v19);
  unsigned int v34 = a5;
  if (a5 >= 2)
  {
    int v20 = v9 + 3;
    uint64_t v21 = a5 - 1;
    do
    {
      CFStringRef v22 = CFStringCreateWithCString(v14, *v20, 0x8000100u);
      CFStringAppend(Mutable, @", ");
      CFStringAppend(Mutable, v22);
      CFRelease(v22);
      if (!v11) {
        CFStringAppend(MutableCopy, @", ?");
      }
      v20 += 3;
      --v21;
    }
    while (v21);
  }
  CFMutableStringRef v23 = CFStringCreateMutableCopy(0, 0, @"INSERT INTO ");
  CFStringAppend(v23, a2);
  CFStringAppend(v23, @" (");
  CFStringAppend(v23, Mutable);
  CFStringAppend(v23, @" VALUES ("));
  CFStringAppend(v23, MutableCopy);
  CFStringAppend(v23, @";"));
  uint64_t v24 = sub_21527F0A8(a1, v23, 0);
  if (!v24)
  {
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (!v23) {
      return 1;
    }
    CFMutableStringRef v27 = v23;
    goto LABEL_47;
  }
  uint64_t v25 = v24;
  if (a3 == -1)
  {
    if (*((void *)v24 + 1))
    {
      uint64_t v28 = v34;
      do
      {
        CSDBSqliteBindColumnValue((uint64_t)v25, (uint64_t)v9);
        v9 += 3;
        --v28;
      }
      while (v28);
    }
  }
  else
  {
    CSDBSqliteBindInt64((uint64_t)v24, a3);
    if (v25[1])
    {
      uint64_t v26 = v34;
      do
      {
        CSDBSqliteBindColumnValue((uint64_t)v25, (uint64_t)v9);
        v9 += 3;
        --v26;
      }
      while (v26);
    }
  }
  int v29 = (sqlite3_stmt *)v25[1];
  if (v29) {
    uint64_t v18 = CSDBSqliteStepWithConnection(*v25, v29);
  }
  else {
    uint64_t v18 = 1;
  }
  CSDBSqliteStatementReset(v25);
  CFRelease(v23);
  CFRelease(Mutable);
  if (!v11) {
    goto LABEL_51;
  }
  return v18;
}

void CSDBSqliteStatementBindValuesForColumns(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a1)
  {
    if (*(void *)(a1 + 8)) {
      BOOL v4 = a3 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4)
    {
      uint64_t v6 = a3;
      do
      {
        CSDBSqliteBindColumnValue(a1, a2);
        a2 += 24;
        --v6;
      }
      while (v6);
    }
  }
}

uint64_t CSDBSqliteConnectionUpdateRecord(uint64_t a1, const __CFString *a2, sqlite3_int64 a3, long long *a4, unsigned int a5)
{
  if (!a5) {
    return 1;
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppend(Mutable, @"UPDATE ");
  CFStringAppend(Mutable, a2);
  CFStringAppend(Mutable, @" SET ");
  uint64_t v11 = 0;
  uint64_t v12 = a5;
  do
  {
    CFStringRef v13 = CFStringCreateWithCString(v9, *(const char **)((char *)a4 + v11), 0x8000100u);
    if (v11) {
      CFStringAppend(Mutable, @", ");
    }
    CFStringAppend(Mutable, v13);
    CFStringAppend(Mutable, @" = ?");
    CFRelease(v13);
    v11 += 24;
  }
  while (24 * a5 != v11);
  CFStringAppend(Mutable, @" WHERE ROWID = ?;");
  CFAllocatorRef v14 = sub_21527F0A8(a1, Mutable, 0);
  CFRelease(Mutable);
  if (!v14) {
    return 1;
  }
  do
  {
    long long v19 = *a4;
    uint64_t v20 = *((void *)a4 + 2);
    CSDBSqliteBindColumnValue((uint64_t)v14, (uint64_t)&v19);
    a4 = (long long *)((char *)a4 + 24);
    --v12;
  }
  while (v12);
  CSDBSqliteBindInt64((uint64_t)v14, a3);
  uint32_t v15 = (sqlite3_stmt *)v14[1];
  if (v15) {
    uint64_t v16 = CSDBSqliteStepWithConnection(*v14, v15);
  }
  else {
    uint64_t v16 = 1;
  }
  CSDBSqliteStatementReset(v14);
  return v16;
}

void CSDBSqliteBindColumnValue(uint64_t a1, uint64_t a2)
{
  if (a1 && *(void *)(a1 + 8))
  {
    switch(*(void *)(a2 + 8))
    {
      case 0:
        int v4 = *(_DWORD *)(a2 + 16);
        CSDBSqliteBindInt(a1, v4);
        return;
      case 1:
        sqlite3_int64 v5 = *(void *)(a2 + 16);
        CSDBSqliteBindInt64(a1, v5);
        return;
      case 2:
        CFStringRef v6 = *(const __CFString **)(a2 + 16);
        if (!v6) {
          goto LABEL_29;
        }
        CSDBSqliteBindTextFromCFString((UInt8 *)a1, v6);
        return;
      case 3:
      case 5:
        syslog(4, "%s does not handle raw data types yet.", "void CSDBSqliteBindColumnValue(CSDBSqliteStatement *, CSDBWriteColumnDescriptor *)");
        return;
      case 4:
        CFDataRef v7 = *(const __CFData **)(a2 + 16);
        if (!v7) {
          goto LABEL_29;
        }
        CSDBSqliteBindBlobFromCFData(a1, v7);
        return;
      case 6:
        double v8 = *(float *)(a2 + 16);
        goto LABEL_26;
      case 7:
        CFNumberRef v9 = *(const __CFNumber **)(a2 + 16);
        if (!v9) {
          goto LABEL_29;
        }
        if (CFNumberIsFloatType(v9))
        {
          double valuePtr = NAN;
          CFNumberGetValue(*(CFNumberRef *)(a2 + 16), kCFNumberDoubleType, &valuePtr);
          CSDBSqliteBindDouble(a1, valuePtr);
        }
        else
        {
          double valuePtr = -3.72066208e-103;
          CFNumberGetValue(*(CFNumberRef *)(a2 + 16), kCFNumberSInt64Type, &valuePtr);
          CSDBSqliteBindInt64(a1, *(sqlite3_int64 *)&valuePtr);
        }
        break;
      case 8:
        if (*(void *)(a2 + 16))
        {
          MEMORY[0x2166B5C70]();
LABEL_26:
          CSDBSqliteBindDouble(a1, v8);
        }
        else
        {
LABEL_29:
          CSDBSqliteBindNull(a1);
        }
        break;
      default:
        return;
    }
  }
}

UInt8 *CSDBSqliteConnectionCopyValuesForPropertiesLike(UInt8 *result, const __CFString *a2, __CFArray **a3, __CFArray **a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (result)
  {
    if (*(void *)result)
    {
      uint64_t result = (UInt8 *)sub_21527F0A8((uint64_t)result, @"SELECT key, value FROM _SqliteDatabaseProperties WHERE key LIKE ?;",
                          0);
      if (result)
      {
        CFDataRef v7 = (sqlite3_stmt **)result;
        CSDBSqliteBindTextFromCFString(result, a2);
        double v8 = v7[1];
        if (v8)
        {
          CFMutableStringRef Mutable = 0;
          __int16 v10 = 0;
          CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          uint64_t v12 = (const void *)*MEMORY[0x263EFFD08];
          CFStringRef v13 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
          while (1)
          {
            int v14 = CSDBSqliteStepWithConnection((int)*v7, v8);
            if (v14 != 100)
            {
              if (v14 == 101) {
                goto LABEL_39;
              }
              goto LABEL_36;
            }
            if (!a3) {
              goto LABEL_19;
            }
            uint32_t v15 = sqlite3_column_text(v7[1], 0);
            CFStringRef v16 = v15 ? CFStringCreateWithCString(v11, (const char *)v15, 0x8000100u) : 0;
            if ((unint64_t)a4 | (unint64_t)v16) {
              break;
            }
LABEL_31:
            double v8 = v7[1];
            if (!v8) {
              goto LABEL_36;
            }
          }
          if (!Mutable) {
            CFMutableStringRef Mutable = CFArrayCreateMutable(v11, 0, v13);
          }
          if (v16) {
            int v17 = v16;
          }
          else {
            int v17 = v12;
          }
          CFArrayAppendValue(Mutable, v17);
          if (v16) {
            CFRelease(v16);
          }
LABEL_19:
          if (a4)
          {
            uint64_t v18 = sqlite3_column_text(v7[1], 1);
            CFStringRef v19 = v18 ? CFStringCreateWithCString(v11, (const char *)v18, 0x8000100u) : 0;
            if ((unint64_t)a3 | (unint64_t)v19)
            {
              if (!v10) {
                __int16 v10 = CFArrayCreateMutable(v11, 0, v13);
              }
              if (v19) {
                uint64_t v20 = v19;
              }
              else {
                uint64_t v20 = v12;
              }
              CFArrayAppendValue(v10, v20);
              if (v19) {
                CFRelease(v19);
              }
            }
          }
          goto LABEL_31;
        }
        __int16 v10 = 0;
        CFMutableStringRef Mutable = 0;
LABEL_36:
        if (IMOSLoggingEnabled())
        {
          uint64_t v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            CFStringRef v22 = sqlite3_errmsg(*((sqlite3 **)*v7 + 1));
            int v23 = sqlite3_extended_errcode(*((sqlite3 **)*v7 + 1));
            int v24 = 136315650;
            uint64_t v25 = "CSDBSqliteConnectionCopyValuesForPropertiesLike";
            __int16 v26 = 2080;
            CFMutableStringRef v27 = v22;
            __int16 v28 = 1024;
            int v29 = v23;
            _os_log_impl(&dword_21527C000, v21, OS_LOG_TYPE_INFO, "%s: %s (%d)\n", (uint8_t *)&v24, 0x1Cu);
          }
        }
LABEL_39:
        uint64_t result = (UInt8 *)CSDBSqliteStatementReset(v7);
        if (a3 && Mutable) {
          *a3 = Mutable;
        }
        if (a4)
        {
          if (v10) {
            *a4 = v10;
          }
        }
      }
    }
  }
  return result;
}

uint64_t CSDBSqliteConnectionIntegerForPropertyWithDefaultValue(uint64_t a1, const __CFString *a2, unsigned int a3)
{
  BOOL v5 = 0;
  LODWORD(result) = sub_215287504(a1, a2, 0, &v5);
  if (v5) {
    return result;
  }
  else {
    return a3;
  }
}

uint64_t sub_215287504(uint64_t a1, const __CFString *a2, int *a3, BOOL *a4)
{
  if (a4) {
    *a4 = 0;
  }
  if (!a1) {
    return 0;
  }
  double v8 = (UInt8 *)sub_21527F0A8(a1, @"SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;", 0);
  if (!v8) {
    return 0;
  }
  CFNumberRef v9 = (sqlite3_stmt **)v8;
  int v12 = 101;
  CSDBSqliteBindTextFromCFString(v8, a2);
  uint64_t v10 = CSDBSqliteStatementIntegerResult(v9, &v12);
  if (a4) {
    *a4 = v12 == 100;
  }
  CSDBSqliteStatementReset(v9);
  if (a3) {
    *a3 = sqlite3_errcode(*(sqlite3 **)(a1 + 8));
  }
  return v10;
}

void CSDBSqliteBindNull(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v2 = *(sqlite3_stmt **)(a1 + 8);
    if (v2)
    {
      int v3 = *(_DWORD *)(a1 + 16);
      if (v3 >= 1)
      {
        sqlite3_bind_null(v2, v3);
LABEL_12:
        ++*(_DWORD *)(a1 + 16);
        return;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL v5 = @"YES";
      if (a1)
      {
        int v6 = *(_DWORD *)(a1 + 16);
      }
      else
      {
        BOOL v5 = @"NO";
        int v6 = 0;
      }
      int v7 = 138412546;
      double v8 = v5;
      __int16 v9 = 1024;
      int v10 = v6;
      _os_log_impl(&dword_21527C000, v4, OS_LOG_TYPE_INFO, "Invalid parameters passed into CSDBSqliteBindNull s==NULL ? %@  bindIndex = %d", (uint8_t *)&v7, 0x12u);
    }
  }
  if (a1) {
    goto LABEL_12;
  }
}

uint64_t CSDBSqliteConnectionSetIntegerForProperty(void *a1, const __CFString *a2, int a3)
{
  uint64_t result = 1;
  if (a1 && a2 && *a1)
  {
    int v7 = (UInt8 *)sub_21527F0A8((uint64_t)a1, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);",
                    0);
    if (v7)
    {
      double v8 = v7;
      CSDBSqliteBindTextFromCFString(v7, a2);
      CSDBSqliteBindInt((uint64_t)v8, a3);
      __int16 v9 = (sqlite3_stmt *)*((void *)v8 + 1);
      if (v9) {
        CSDBSqliteStepWithConnection(*(void *)v8, v9);
      }
      uint64_t result = CSDBSqliteStatementReset(v8);
      if (result == 17)
      {
        int v10 = (__CFDictionary *)a1[2];
        if (v10
          && (CFDictionaryRemoveValue(v10, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);"),
              (uint64_t v11 = (UInt8 *)sub_21527F0A8((uint64_t)a1, @"INSERT OR REPLACE INTO _SqliteDatabaseProperties VALUES (?, ?);",
                                0)) != 0))
        {
          int v12 = v11;
          CSDBSqliteBindTextFromCFString(v11, a2);
          CSDBSqliteBindInt((uint64_t)v12, a3);
          CFStringRef v13 = (sqlite3_stmt *)*((void *)v12 + 1);
          if (v13) {
            CSDBSqliteStepWithConnection(*(void *)v12, v13);
          }
          return CSDBSqliteStatementReset(v12);
        }
        else
        {
          return 17;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void CSDBSqliteBindInt(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v3 = *(sqlite3_stmt **)(a1 + 8);
    if (v3)
    {
      int v5 = *(_DWORD *)(a1 + 16);
      if (v5 >= 1)
      {
        sqlite3_bind_int(v3, v5, a2);
LABEL_12:
        ++*(_DWORD *)(a1 + 16);
        return;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = @"YES";
      if (a1)
      {
        int v8 = *(_DWORD *)(a1 + 16);
      }
      else
      {
        int v7 = @"NO";
        int v8 = 0;
      }
      int v9 = 138412546;
      int v10 = v7;
      __int16 v11 = 1024;
      int v12 = v8;
      _os_log_impl(&dword_21527C000, v6, OS_LOG_TYPE_INFO, "Invalid parameters passed into CSDBSqliteBindInt s==NULL ? %@  bindIndex = %d", (uint8_t *)&v9, 0x12u);
    }
  }
  if (a1) {
    goto LABEL_12;
  }
}

sqlite3_int64 CSDBSqliteConnectionRowidOfLastInsert(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(sqlite3 **)(a1 + 8)) != 0) {
    return sqlite3_last_insert_rowid(v1);
  }
  else {
    return -1;
  }
}

uint64_t CSDBSqliteConnectionCheckNoConnectionError(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((a2 - 100) < 2 || a2 == 0) {
    return 0;
  }
  int v7 = *(sqlite3 **)(a1 + 8);
  if (!IMOSLoggingEnabled()) {
    return 1;
  }
  int v9 = OSLogHandleForIMFoundationCategory();
  uint64_t v4 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    uint64_t v11 = a3;
    __int16 v12 = 2080;
    uint64_t v13 = sqlite3_errmsg(v7);
    __int16 v14 = 1024;
    int v15 = sqlite3_extended_errcode(v7);
    uint64_t v4 = 1;
    _os_log_impl(&dword_21527C000, v9, OS_LOG_TYPE_INFO, "sqlite3 error in %s: %s (%d)\n", (uint8_t *)&v10, 0x1Cu);
  }
  return v4;
}

const char *CSDBSqliteErrMsg(const char *result)
{
  if (result) {
    return sqlite3_errmsg(*((sqlite3 **)result + 1));
  }
  return result;
}

void CSDBSetCorruptedDatabaseHandler(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a1)
  {
    qword_26AB04348 = a1;
    if (IMOSLoggingEnabled())
    {
      uint64_t v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl(&dword_21527C000, v1, OS_LOG_TYPE_INFO, "setting corruption handler", (uint8_t *)v11, 2u);
      }
    }
  }
  else
  {
    v11[0] = xmmword_264238CA8;
    v11[1] = *(_OWORD *)off_264238CB8;
    uint64_t v12 = 1982;
    id v2 = NSString;
    uint64_t v3 = IMFileLocationTrimFileName();
    uint64_t v5 = objc_msgSend_stringWithFormat_(NSString, v4, (uint64_t)&stru_26C5DE380);
    uint64_t v7 = objc_msgSend_stringWithFormat_(v2, v6, @"Unexpected nil '%@' in %s at %s:%d. %@", @"function", "void CSDBSetCorruptedDatabaseHandler(CSDBCorruptedDatabaseHandler)", v3, 1982, v5);
    int v8 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
    if (v8)
    {
      v8(v7);
    }
    else if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        uint64_t v14 = v7;
        _os_log_impl(&dword_21527C000, v9, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl(&dword_21527C000, v10, OS_LOG_TYPE_INFO, "setting NULL corruption handler (set to default)", (uint8_t *)v11, 2u);
      }
    }
    qword_26AB04348 = (uint64_t)CSDBSetAsideInPlaceCorruptedDatabaseHandler;
  }
}

void CSDBSetAsideInPlaceCorruptedDatabaseHandler(void **a1, char *a2, uint64_t a3, uint64_t a4, sqlite3_stmt *a5)
{
  int v7 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v10 = *a1;
    uint64_t v11 = objc_msgSend_stringByDeletingPathExtension(*a1, a2, a3);
  }
  else
  {
    int v10 = 0;
    uint64_t v11 = objc_msgSend_stringByDeletingPathExtension(0, a2, a3);
  }
  id v14 = (id)objc_msgSend_mutableCopy(v11, v12, v13);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x263EFF910], v15, v16);
  uint64_t v18 = v17;
  uint64_t v34 = objc_msgSend_pathExtension(v10, v19, v20);
  objc_msgSend_appendFormat_(v14, v21, @"-corrupted-(%f).%@");
  if (IMOSLoggingEnabled())
  {
    int v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v7;
      *(_WORD *)&uint8_t buf[8] = 2112;
      *(void *)&buf[10] = v10;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v14;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = a4;
      _os_log_impl(&dword_21527C000, v29, OS_LOG_TYPE_INFO, "encountered corruption error %d while accessing %@, attempting to set aside database here: %@. Called from: %s", buf, 0x26u);
    }
  }
  if (a5) {
    sub_215288524((sqlite3 *)a2, a4, a5, v24, v25, v26, v27, v28, v18, v34, v35, (uint64_t)ppDb, *(uint64_t *)buf, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16], *(uint64_t *)&buf[24], *(uint64_t *)&buf[32], v38, v39,
  }
      v40,
      v41,
      v42);
  uint64_t v30 = (const char *)objc_msgSend_UTF8String(v14, v22, v23);
  unsigned int v31 = v30;
  if (v30)
  {
    ppDb = 0;
    if (!sqlite3_open(v30, &ppDb))
    {
      if (!sqlite3_file_control(ppDb, 0, 102, a2) && IMOSLoggingEnabled())
      {
        uint64_t v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2080;
          *(void *)&buf[24] = a4;
          _os_log_impl(&dword_21527C000, v32, OS_LOG_TYPE_INFO, "Database at path %@ is corrupt. Copying it to %s for further investigation. Called from: %s.", buf, 0x20u);
        }
      }
      sqlite3_close(ppDb);
    }
    sub_2152886C8((sqlite3 *)a2, v10);
  }
  else if (IMOSLoggingEnabled())
  {
    unsigned int v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = a4;
      _os_log_impl(&dword_21527C000, v33, OS_LOG_TYPE_INFO, "SQLITE_CORRUPT handling code is unable to set aside the corrupt database because the path is unknown.  db=%p, path=%@. Called from: %s.", buf, 0x20u);
    }
  }
}

void *CSDBGetCorruptDatabaseHandler()
{
  if (qword_267866AF0 != -1) {
    dispatch_once(&qword_267866AF0, &unk_26C5DDFE0);
  }
  int v0 = CSDBDefaultCorruptedDatabaseHandler;
  if (byte_267866AE8)
  {
    int v0 = (void *)qword_26AB04348;
    if (!qword_26AB04348)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v1 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v3 = 0;
          _os_log_impl(&dword_21527C000, v1, OS_LOG_TYPE_INFO, "No database corruption handler found - resetting to default handler", v3, 2u);
        }
      }
      int v0 = CSDBSetAsideInPlaceCorruptedDatabaseHandler;
      qword_26AB04348 = (uint64_t)CSDBSetAsideInPlaceCorruptedDatabaseHandler;
    }
  }
  return v0;
}

uint64_t sub_2152880B4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_sharedInstance(MEMORY[0x263F4A840], a2, a3);
  uint64_t result = objc_msgSend_isInternalInstall(v3, v4, v5);
  byte_267866AE8 = result;
  return result;
}

void CSDBDefaultCorruptedDatabaseHandler(const __CFString **a1, sqlite3 *a2, int a3, uint64_t a4, sqlite3_stmt *a5)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    int v10 = 0;
    goto LABEL_5;
  }
  int v10 = (__CFString *)*a1;
  if (!*a1)
  {
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  uint64_t v11 = CSDBCreateUTF8StringFromCFString(*a1);
LABEL_6:
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = a3;
      *(_WORD *)&uint8_t buf[8] = 2080;
      *(void *)&buf[10] = v11;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = a4;
      _os_log_impl(&dword_21527C000, v17, OS_LOG_TYPE_INFO, "SQLITE_CORRUPT encountered error %d while accessing %s, exiting with default corruption handler! Called from: %s", buf, 0x1Cu);
    }
  }
  if (a5) {
    sub_215288524(a2, a4, a5, v12, v13, v14, v15, v16, v33, v34, v35, (uint64_t)ppDb, *(uint64_t *)buf, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16], *(uint64_t *)&buf[24], *(uint64_t *)&buf[32], v38, v39,
  }
      v40,
      v41,
      v42);
  if (v11)
  {
    uint64_t v18 = (char *)malloc_type_calloc(1uLL, 0x400uLL, 0x72BE54EDuLL);
    CFStringRef v19 = (char *)malloc_type_calloc(1uLL, 0x400uLL, 0xBA0F5EEAuLL);
    ppDb = 0;
    if (v18)
    {
      size_t v20 = strlen((const char *)v11);
      CFURLRef v21 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], v11, v20, 0);
      CFURLRef v22 = v21;
      if (v21)
      {
        CFStringRef PathComponent = CFURLCopyLastPathComponent(v21);
        CFStringRef v24 = PathComponent;
        if (PathComponent)
        {
          CFStringGetCString(PathComponent, v18, 1024, 0x8000100u);
          CFRelease(v24);
        }
        CFRelease(v22);
      }
    }
    *(void *)buf = 0;
    int v25 = NSTemporaryDirectory();
    int v28 = (const char *)objc_msgSend_fileSystemRepresentation(v25, v26, v27);
    if (v28[strlen(v28) - 1] == 47) {
      int v29 = "";
    }
    else {
      int v29 = "/";
    }
    asprintf((char **)buf, "%s%s%s.XXXXXX", v28, v29, v18);
    if (*(void *)buf)
    {
      mkstemp(*(char **)buf);
      if (v19) {
        __strlcpy_chk();
      }
      free(*(void **)buf);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&uint8_t buf[4] = a3;
        *(_WORD *)&uint8_t buf[8] = 2112;
        *(void *)&buf[10] = v10;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v19;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = a4;
        _os_log_impl(&dword_21527C000, v30, OS_LOG_TYPE_INFO, "encountered corruption error %d while accessing %@, attempting to set aside database here: %s. Called from: %s", buf, 0x26u);
      }
    }
    if (!sqlite3_open(v19, &ppDb))
    {
      if (!sqlite3_file_control(ppDb, 0, 102, a2) && IMOSLoggingEnabled())
      {
        unsigned int v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v19;
          *(_WORD *)&buf[22] = 2080;
          *(void *)&buf[24] = a4;
          _os_log_impl(&dword_21527C000, v31, OS_LOG_TYPE_INFO, "Database at path %s is corrupt. Copied it to %s for further investigation. Called from: %s.", buf, 0x20u);
        }
      }
      sqlite3_close(ppDb);
    }
    free(v18);
    free(v19);
    sub_2152886C8(a2, v10);
    free(v11);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = a4;
      _os_log_impl(&dword_21527C000, v32, OS_LOG_TYPE_INFO, "SQLITE_CORRUPT handling code is unable to delete the corrupt database because the path is unknown.  db=%p, path=%s. Called from: %s", buf, 0x20u);
    }
  }
}

void sub_215288524(sqlite3 *exc_buf, uint64_t a2, sqlite3_stmt *a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (IMOSLoggingEnabled())
    {
      int v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        int v26 = 136315906;
        uint64_t v27 = a2;
        __int16 v28 = 2080;
        int v29 = sqlite3_errmsg(exc_buf);
        __int16 v30 = 2080;
        unsigned int v31 = sqlite3_sql(a3);
        __int16 v32 = 1024;
        int v33 = sqlite3_extended_errcode(exc_buf);
        _os_log_impl(&dword_21527C000, v25, OS_LOG_TYPE_INFO, "SQLite error in function: %s message: %s sql: %s (%d)", (uint8_t *)&v26, 0x26u);
      }
    }
  }
  else
  {
    sub_2152891A8(exc_buf, a2);
  }
}

BOOL sub_2152886C8(sqlite3 *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v18 = a2;
      _os_log_impl(&dword_21527C000, v4, OS_LOG_TYPE_INFO, "Cleaning up corrupt database: %@", buf, 0xCu);
    }
  }
  int v16 = 189;
  int v5 = sqlite3_file_control(a1, 0, 101, &v16);
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = sqlite3_extended_errcode(a1);
        int v8 = sqlite3_errmsg(a1);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)uint64_t v18 = v5;
        *(_WORD *)&v18[4] = 1024;
        *(_DWORD *)&v18[6] = v7;
        __int16 v19 = 2080;
        size_t v20 = v8;
        _os_log_impl(&dword_21527C000, v6, OS_LOG_TYPE_INFO, "_CSDBSqliteDatabaseCloseAndDelete unable to truncate database: %d (%d); %s",
          buf,
          0x18u);
      }
    }
  }
  int v9 = sqlite3_close(a1);
  int v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = sqlite3_extended_errcode(a1);
        int v13 = sqlite3_errmsg(a1);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)uint64_t v18 = v9;
        *(_WORD *)&v18[4] = 1024;
        *(_DWORD *)&v18[6] = v12;
        __int16 v19 = 2080;
        size_t v20 = v13;
        _os_log_impl(&dword_21527C000, v11, OS_LOG_TYPE_INFO, "_CSDBSqliteDatabaseCloseAndDelete unable to close the source database. SQLite error: [%d] (%d) %s", buf, 0x18u);
        if (!v5) {
          return v5 == 0;
        }
        goto LABEL_17;
      }
    }
  }
  else if (v10)
  {
    int v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21527C000, v14, OS_LOG_TYPE_INFO, "_CSDBSqliteDatabaseCloseAndDelete Closed the source database after truncation.", buf, 2u);
    }
  }
  if (v5) {
LABEL_17:
  }
    CSDBSqliteDeleteDatabase(a2);
  return v5 == 0;
}

void sub_215288930(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    if (!v2) {
      JUMPOUT(0x2152888F4);
    }
    JUMPOUT(0x2152888ECLL);
  }
  _Unwind_Resume(a1);
}

BOOL CSDBDatabasePassesIntegrityCheckAtPath(void *a1, const char *a2, uint64_t a3)
{
  ppDb = 0;
  uint64_t v3 = (const char *)objc_msgSend_UTF8String(a1, a2, a3);
  int v4 = sqlite3_open_v2(v3, &ppDb, 1, 0);
  if ((v4 - 100) >= 2 && v4 != 0) {
    return 0;
  }
  pStmt = 0;
  int v8 = ppDb;
  int v9 = (const char *)objc_msgSend_UTF8String(@"PRAGMA integrity_check;", v5, v6);
  int v10 = sqlite3_prepare_v2(v8, v9, -1, &pStmt, 0);
  if ((v10 - 100) >= 2 && v10 != 0) {
    goto LABEL_13;
  }
  int v12 = sqlite3_step(pStmt);
  if (v12 == 100)
  {
    do
      int v10 = sqlite3_step(pStmt);
    while (v10 == 100);
LABEL_13:
    int v12 = v10;
  }
  if (pStmt)
  {
    sqlite3_finalize(pStmt);
    pStmt = 0;
  }
  if (ppDb) {
    sqlite3_close_v2(ppDb);
  }
  return v12 == 101 || v12 == 0;
}

void sub_215288A60(uint64_t a1, sqlite3 *a2, uint64_t a3, uint64_t a4, sqlite3_stmt *a5)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v10 = (void (*)(uint64_t, sqlite3 *, uint64_t, uint64_t, sqlite3_stmt *))CSDBGetCorruptDatabaseHandler();
  if (v10)
  {
    v10(a1, a2, a3, a4, a5);
  }
  else
  {
    long long v29 = xmmword_264238CF0;
    long long v30 = *(_OWORD *)off_264238D00;
    uint64_t v31 = 2116;
    uint64_t v11 = NSString;
    uint64_t v12 = IMFileLocationTrimFileName();
    uint64_t v26 = 2116;
    uint64_t v27 = objc_msgSend_stringWithFormat_(NSString, v13, (uint64_t)&stru_26C5DE380);
    CFStringRef v24 = "void _CSDBHandleCorruptError(CSDBSqliteDatabase *, sqlite3 *, int, const char *, sqlite3_stmt *)";
    uint64_t v25 = v12;
    uint64_t v23 = @"handler";
    uint64_t v15 = objc_msgSend_stringWithFormat_(v11, v14, @"Unexpected nil '%@' in %s at %s:%d. %@");
    int v16 = (void (*)(uint64_t))IMGetAssertionFailureHandler();
    if (v16)
    {
      v16(v15);
    }
    else if (IMOSLoggingEnabled())
    {
      CFURLRef v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl(&dword_21527C000, v22, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
  sub_215288524(a2, a4, a5, v17, v18, v19, v20, v21, (uint64_t)v23, (uint64_t)v24, v25, v26, v27, v28, v29, *((uint64_t *)&v29 + 1), v30, *((uint64_t *)&v30 + 1), v31,
    v32,
    *(uint64_t *)buf,
    *(uint64_t *)&buf[8]);
  exit(2);
}

uint64_t sub_215288BE0()
{
  uint64_t result = IMGetAppBoolForKey();
  byte_267866B00 = result;
  return result;
}

__CFArray *CSDBSqliteStatementCopyAllRowsStringsForColumnsAtIndices(uint64_t a1, CFArrayRef theArray)
{
  if (!a1 || !*(void *)(a1 + 8)) {
    return 0;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex Count = CFArrayGetCount(theArray);
  CFMutableStringRef Mutable = CFArrayCreateMutable(v4, Count, MEMORY[0x263EFFF70]);
  int v7 = *(sqlite3_stmt **)(a1 + 8);
  if (v7)
  {
    int v8 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    do
    {
      if (CSDBSqliteStepWithConnection(*(void *)a1, v7) != 100) {
        break;
      }
      CFIndex v9 = CFArrayGetCount(theArray);
      int v10 = CFArrayCreateMutable(v4, v9, v8);
      if (Mutable && CFArrayGetCount(theArray) >= 1)
      {
        CFIndex v11 = 0;
        do
        {
          int valuePtr = 0;
          CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v11);
          CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
          int v13 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), valuePtr);
          if (v13)
          {
            CFStringRef v14 = CFStringCreateWithCString(v4, (const char *)v13, 0x8000100u);
            if (v14)
            {
              CFStringRef v15 = v14;
              CFArrayAppendValue(v10, v14);
              CFRelease(v15);
            }
          }
          ++v11;
        }
        while (CFArrayGetCount(theArray) > v11);
      }
      CFArrayAppendValue(Mutable, v10);
      CFRelease(v10);
      int v7 = *(sqlite3_stmt **)(a1 + 8);
    }
    while (v7);
  }
  return Mutable;
}

CFArrayRef CSDBSqliteStatementCopyStringsForColumnsAtIndices(uint64_t a1, const __CFArray *a2)
{
  int v2 = CSDBSqliteStatementCopyAllRowsStringsForColumnsAtIndices(a1, a2);
  if (!v2) {
    return 0;
  }
  CFArrayRef v3 = v2;
  if (CFArrayGetCount(v2) < 1)
  {
    CFArrayRef Copy = 0;
  }
  else
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v3, 0);
    CFArrayRef Copy = CFArrayCreateCopy(v4, ValueAtIndex);
  }
  CFRelease(v3);
  return Copy;
}

CFDataRef CSDBSqliteStatementCopyDataResult(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  int v2 = *(sqlite3_stmt **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  if (CSDBSqliteStepWithConnection(*(void *)a1, v2) != 100) {
    return 0;
  }
  CFArrayRef v3 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 8), 0);
  int v4 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 8), 0);
  if (!v3 || v4 < 1) {
    return 0;
  }
  CFIndex v5 = v4;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  return CFDataCreate(v6, v3, v5);
}

sqlite3_int64 CSDBSqliteStatementInteger64ResultColumn(uint64_t a1, int a2)
{
  return sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 8), a2);
}

void CSDBSqliteBindDouble(uint64_t a1, double a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a1)
  {
    CFArrayRef v3 = *(sqlite3_stmt **)(a1 + 8);
    if (v3)
    {
      int v4 = *(_DWORD *)(a1 + 16);
      if (v4 >= 1)
      {
        sqlite3_bind_double(v3, v4, a2);
LABEL_12:
        ++*(_DWORD *)(a1 + 16);
        return;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    CFIndex v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFAllocatorRef v6 = @"YES";
      if (a1)
      {
        int v7 = *(_DWORD *)(a1 + 16);
      }
      else
      {
        CFAllocatorRef v6 = @"NO";
        int v7 = 0;
      }
      int v8 = 138412546;
      CFIndex v9 = v6;
      __int16 v10 = 1024;
      int v11 = v7;
      _os_log_impl(&dword_21527C000, v5, OS_LOG_TYPE_INFO, "Invalid parameters passed into CSDBSqliteBindDouble s==NULL ? %@  bindIndex = %d", (uint8_t *)&v8, 0x12u);
    }
  }
  if (a1) {
    goto LABEL_12;
  }
}

void CSDBSqliteBindBlobFromCFData(uint64_t a1, CFDataRef theData)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a1 && theData && *(void *)(a1 + 8) && *(int *)(a1 + 16) >= 1)
  {
    BytePtr = CFDataGetBytePtr(theData);
    int Length = CFDataGetLength(theData);
    sqlite3_bind_blob(*(sqlite3_stmt **)(a1 + 8), *(_DWORD *)(a1 + 16), BytePtr, Length, 0);
LABEL_18:
    ++*(_DWORD *)(a1 + 16);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    CFAllocatorRef v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = @"NO";
      if (a1) {
        int v8 = @"NO";
      }
      else {
        int v8 = @"YES";
      }
      if (a1) {
        int v9 = *(_DWORD *)(a1 + 16);
      }
      else {
        int v9 = 0;
      }
      if (!theData) {
        int v7 = @"YES";
      }
      int v10 = 138412802;
      int v11 = v8;
      __int16 v12 = 1024;
      int v13 = v9;
      __int16 v14 = 2112;
      CFStringRef v15 = v7;
      _os_log_impl(&dword_21527C000, v6, OS_LOG_TYPE_INFO, "Invalid parameters passed into CSDBSqliteBindBlobFromCFData s==NULL ? %@  bindIndex = %d  data == NULL ? %@", (uint8_t *)&v10, 0x1Cu);
    }
  }
  if (a1) {
    goto LABEL_18;
  }
}

UInt8 *CSDBSqliteBindTextFromCFArrayOfCFStrings(UInt8 *result, CFArrayRef theArray)
{
  if (theArray)
  {
    CFArrayRef v3 = result;
    uint64_t result = (UInt8 *)CFArrayGetCount(theArray);
    if ((int)result >= 1)
    {
      CFIndex v4 = 0;
      if (result <= 1uLL) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = result;
      }
      do
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v4);
        uint64_t result = CSDBSqliteBindTextFromCFString(v3, ValueAtIndex);
        ++v4;
      }
      while (v5 != v4);
    }
  }
  return result;
}

void sub_2152891A8(sqlite3 *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    CFIndex v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315650;
      uint64_t v6 = a2;
      __int16 v7 = 2080;
      int v8 = sqlite3_errmsg(a1);
      __int16 v9 = 1024;
      int v10 = sqlite3_extended_errcode(a1);
      _os_log_impl(&dword_21527C000, v4, OS_LOG_TYPE_INFO, "SQLite error in function: %s for handle: %s (%d)", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

void CSDBSqliteStatementApplyValuesFromRecord(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
}

void sub_2152892E8(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, sqlite3_int64 a5, int a6)
{
  if (a1)
  {
    uint64_t v6 = *(sqlite3_stmt **)(a1 + 8);
    if (v6 && a3 != 0)
    {
      unint64_t v10 = a3;
      CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      uint64_t v11 = a2 + 16;
      unint64_t v12 = 1;
      do
      {
        int v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))v11;
        if (*(void *)v11)
        {
          int v14 = *(_DWORD *)(v11 - 16);
          uint64_t v15 = *(void *)(v11 + 8);
          switch(*(void *)(v11 - 8))
          {
            case 0:
              uint64_t v16 = sqlite3_column_int(v6, *(_DWORD *)(v11 - 16));
              char v17 = v13(a4, v15, v16);
              goto LABEL_51;
            case 1:
              sqlite3_int64 v18 = sqlite3_column_int64(v6, *(_DWORD *)(v11 - 16));
              goto LABEL_25;
            case 2:
              int v19 = sqlite3_column_text(v6, *(_DWORD *)(v11 - 16));
              if (v19) {
                BOOL v20 = 0;
              }
              else {
                BOOL v20 = a6 == 0;
              }
              if (v20) {
                goto LABEL_58;
              }
              if (!v19) {
                goto LABEL_49;
              }
              CFNumberRef v21 = (const __CFNumber *)CFStringCreateWithCString(alloc, (const char *)v19, 0x8000100u);
              goto LABEL_32;
            case 3:
              CFURLRef v22 = sqlite3_column_text(v6, *(_DWORD *)(v11 - 16));
              if (v22) {
                BOOL v23 = 0;
              }
              else {
                BOOL v23 = a6 == 0;
              }
              if (v23) {
                goto LABEL_58;
              }
              if (v22) {
                sqlite3_int64 v18 = (sqlite3_int64)v22;
              }
              else {
                sqlite3_int64 v18 = a5;
              }
LABEL_25:
              uint64_t v24 = a4;
              uint64_t v25 = v15;
              goto LABEL_50;
            case 4:
              unsigned int v26 = sqlite3_column_bytes(v6, *(_DWORD *)(v11 - 16));
              uint64_t v27 = (const UInt8 *)sqlite3_column_blob(v6, v14);
              if (v27) {
                BOOL v28 = 0;
              }
              else {
                BOOL v28 = a6 == 0;
              }
              if (v28) {
                goto LABEL_58;
              }
              if (v27)
              {
                CFNumberRef v21 = CFDataCreate(alloc, v27, v26);
LABEL_32:
                CFNumberRef v29 = v21;
                uint64_t v30 = a4;
                uint64_t v31 = v15;
                CFNumberRef v32 = v29;
                goto LABEL_66;
              }
LABEL_49:
              uint64_t v24 = a4;
              uint64_t v25 = v15;
              sqlite3_int64 v18 = a5;
LABEL_50:
              char v17 = v13(v24, v25, v18);
LABEL_51:
              char v43 = v17;
              break;
            case 5:
              unsigned int v33 = sqlite3_column_bytes(v6, *(_DWORD *)(v11 - 16));
              uint64_t v34 = sqlite3_column_blob(v6, v14);
              if (v34) {
                BOOL v35 = 0;
              }
              else {
                BOOL v35 = a6 == 0;
              }
              if (v35) {
                goto LABEL_58;
              }
              if (v34) {
                sqlite3_int64 v36 = (sqlite3_int64)v34;
              }
              else {
                sqlite3_int64 v36 = a5;
              }
              char v17 = ((uint64_t (*)(uint64_t, uint64_t, sqlite3_int64, void))v13)(a4, v15, v36, v33);
              goto LABEL_51;
            case 6:
              float v37 = sqlite3_column_double(v6, *(_DWORD *)(v11 - 16));
              char v17 = ((uint64_t (*)(uint64_t, uint64_t, float))v13)(a4, v15, v37);
              goto LABEL_51;
            case 7:
              int v38 = sqlite3_column_type(v6, *(_DWORD *)(v11 - 16));
              if (v38 == 5) {
                goto LABEL_48;
              }
              if (v38 == 2)
              {
                double valuePtr = NAN;
                double valuePtr = sqlite3_column_double(v6, v14);
                CFAllocatorRef v39 = alloc;
                CFNumberType v40 = kCFNumberDoubleType;
              }
              else
              {
                double valuePtr = -3.72066208e-103;
                double valuePtr = COERCE_DOUBLE(sqlite3_column_int64(v6, v14));
                CFAllocatorRef v39 = alloc;
                CFNumberType v40 = kCFNumberSInt64Type;
              }
              CFNumberRef v44 = CFNumberCreate(v39, v40, &valuePtr);
              goto LABEL_56;
            case 8:
              int v41 = sqlite3_column_type(v6, *(_DWORD *)(v11 - 16));
              if (v41 == 5)
              {
LABEL_48:
                CFNumberRef v29 = 0;
              }
              else
              {
                if (v41 == 2) {
                  double v42 = sqlite3_column_double(v6, v14);
                }
                else {
                  double v42 = (double)sqlite3_column_int64(v6, v14);
                }
                CFNumberRef v44 = CFDateCreate(0, v42);
LABEL_56:
                CFNumberRef v29 = v44;
                if (v44) {
                  goto LABEL_62;
                }
              }
              if (!a6) {
                goto LABEL_58;
              }
LABEL_62:
              if (v29) {
                CFNumberRef v32 = v29;
              }
              else {
                CFNumberRef v32 = (CFNumberRef)a5;
              }
              uint64_t v30 = a4;
              uint64_t v31 = v15;
LABEL_66:
              char v43 = v13(v30, v31, (uint64_t)v32);
              if (v29) {
                CFRelease(v29);
              }
              break;
            default:
              goto LABEL_58;
          }
        }
        else
        {
LABEL_58:
          char v43 = 1;
        }
        if (v12 >= v10) {
          break;
        }
        v11 += 32;
        ++v12;
      }
      while ((v43 & 1) != 0);
    }
  }
}

void CSDBSqliteStatementApplyValuesFromRecordWithNullValue(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, sqlite3_int64 a5)
{
}

uint64_t CSDBSqliteUtilitiesGetSchemaVersionAtPathWithProtection(const __CFString *a1)
{
  uint64_t v1 = CSDBCreateUTF8StringFromCFString(a1);
  ppDb = 0;
  int v2 = sqlite3_open_v2((const char *)v1, &ppDb, 1, 0);
  CFArrayRef v3 = ppDb;
  if (ppDb)
  {
    if (v2)
    {
      uint64_t v4 = 0xFFFFFFFFLL;
    }
    else
    {
      pStmt = 0;
      int v5 = sqlite3_prepare_v2(ppDb, "SELECT value FROM _SqliteDatabaseProperties WHERE key = ?;", 58, &pStmt, 0);
      uint64_t v6 = pStmt;
      if (pStmt)
      {
        if (v5)
        {
          uint64_t v4 = 0xFFFFFFFFLL;
        }
        else
        {
          sqlite3_bind_text(pStmt, 1, "_ClientVersion", 14, 0);
          if (sqlite3_step(pStmt) == 100) {
            uint64_t v4 = sqlite3_column_int(pStmt, 0);
          }
          else {
            uint64_t v4 = 0xFFFFFFFFLL;
          }
          sqlite3_reset(pStmt);
          uint64_t v6 = pStmt;
        }
        sqlite3_finalize(v6);
      }
      else
      {
        uint64_t v4 = 0xFFFFFFFFLL;
      }
      CFArrayRef v3 = ppDb;
    }
    sqlite3_close(v3);
  }
  else
  {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  free(v1);
  return v4;
}

uint64_t CSDBSqliteSetDefaultPageCacheSize(uint64_t result)
{
  if ((int)result >= 1) {
    dword_26AB04350 = result;
  }
  return result;
}

uint64_t CSDBSqliteDatabaseCheckIntegrity(uint64_t a1)
{
  uint64_t v1 = (sqlite3_stmt **)sub_21527F0A8(a1, @"PRAGMA integrity_check", 0);
  if (!v1) {
    return 0;
  }
  int v2 = v1;
  CFArrayRef v3 = v1[1];
  if (!v3) {
    return 0;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    if (CSDBSqliteStepWithConnection((int)*v2, v3) != 100)
    {
LABEL_10:
      uint64_t v13 = 0;
      goto LABEL_16;
    }
    if (sqlite3_column_text(v2[1], 0))
    {
      __int16 v7 = sqlite3_column_text(v2[1], 0);
      int v8 = (__CFString *)CFStringCreateWithCString(v4, (const char *)v7, 0x8000100u);
      uint64_t v11 = objc_msgSend_lowercaseString(v8, v9, v10);
    }
    else
    {
      int v8 = 0;
      uint64_t v11 = objc_msgSend_lowercaseString(0, v5, v6);
    }
    if (objc_msgSend_isEqualToString_(v11, v12, @"ok")) {
      break;
    }

    CFArrayRef v3 = v2[1];
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16[0] = 0;
      _os_log_impl(&dword_21527C000, v14, OS_LOG_TYPE_INFO, "This DB passed its integrity check.", (uint8_t *)v16, 2u);
    }
  }

  uint64_t v13 = 1;
LABEL_16:
  CSDBSqliteStatementReset(v2);
  return v13;
}

void *CSDBSqliteStep(void *result)
{
  if (result)
  {
    uint64_t v1 = (sqlite3_stmt *)result[1];
    if (v1) {
      return (void *)(CSDBSqliteStepWithConnection(*result, v1) == 100);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t CSDBRegisterReconnectBlockWithIdentifier(void *a1, uint64_t a2, void *a3)
{
  pthread_mutex_lock(&stru_267866AA0);
  if (!qword_267866B08) {
    qword_267866B08 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  if (a1 && a2 && a3)
  {
    int v8 = objc_msgSend_copy(a1, v6, v7);
    uint64_t v11 = sub_215285DE8(a3, v9, v10);
    uint64_t second = objc_msgSend_pairWithFirst_second_(MEMORY[0x263F4A850], v12, (uint64_t)v8, v11);
    objc_msgSend_setObject_forKey_((void *)qword_267866B08, v14, second, a2);
    if (v11) {
      CFRelease(v11);
    }
  }
  return pthread_mutex_unlock(&stru_267866AA0);
}

uint64_t CSDBDeregisterReconnectBlockWithIdentifier(uint64_t a1)
{
  pthread_mutex_lock(&stru_267866AA0);
  if (a1 && qword_267866B08) {
    objc_msgSend_removeObjectForKey_((void *)qword_267866B08, v2, a1);
  }
  return pthread_mutex_unlock(&stru_267866AA0);
}

uint64_t CSDBGetLastSQLCommands()
{
  return 0;
}

sqlite3 **sub_215289A28(uint64_t *a1, const char *a2, char a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v5 = (sqlite3 **)malloc_type_calloc(1uLL, 0x38uLL, 0x10A004033174AE8uLL);
  if (strcmp(a2, ":memory:"))
  {
    if (access(a2, 6) == -1 && *__error() != 2)
    {
      v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)v31.st_qspare = v6;
      *(timespec *)&v31.st_size = v6;
      *(timespec *)&v31.st_blksize = v6;
      v31.st_ctimespec = v6;
      v31.st_birthtimespec = v6;
      v31.st_atimespec = v6;
      v31.st_mtimespec = v6;
      *(timespec *)&v31.st_dev = v6;
      *(timespec *)&v31.uid_t st_uid = v6;
      if (!stat(a2, &v31))
      {
        uid_t st_uid = v31.st_uid;
        if (st_uid == geteuid())
        {
          if (IMOSLoggingEnabled())
          {
            int v8 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              v31.st_dev = 136315138;
              *(void *)&v31.st_mode = a2;
              _os_log_impl(&dword_21527C000, v8, OS_LOG_TYPE_INFO, "Fixing permissions on %s", (uint8_t *)&v31, 0xCu);
            }
          }
          if (chmod(a2, 0x180u) < 0)
          {
            if (IMOSLoggingEnabled())
            {
              __int16 v9 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
              {
                uint64_t v10 = __error();
                uint64_t v11 = strerror(*v10);
                v31.st_dev = 136315394;
                *(void *)&v31.st_mode = v11;
                WORD2(v31.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v31.st_ino + 6) = (__darwin_ino64_t)a2;
                _os_log_impl(&dword_21527C000, v9, OS_LOG_TYPE_INFO, "Error %s setting permissions on %s", (uint8_t *)&v31, 0x16u);
              }
            }
          }
        }
      }
    }
  }
  CFStringRef v12 = (const __CFString *)a1[22];
  if (v12) {
    uint64_t v13 = CSDBCreateUTF8StringFromCFString(v12);
  }
  else {
    uint64_t v13 = 0;
  }
  int v14 = *((_DWORD *)a1 + 46);
  if (v14) {
    int v15 = 4194310;
  }
  else {
    int v15 = 3145734;
  }
  if (v14 == 1) {
    int v16 = 1048582;
  }
  else {
    int v16 = v15;
  }
  char v17 = v5 + 1;
  int v18 = sqlite3_open_v2(a2, v5 + 1, v16, (const char *)v13);
  if (*((unsigned char *)a1 + 196))
  {
    uint64_t v19 = *((unsigned int *)a1 + 48);
    if ((v19 & 0x80000000) == 0)
    {
      int v20 = *((_DWORD *)a1 + 47);
      if ((v20 & 0x80000000) == 0)
      {
        int v21 = sqlite3_db_config(*v17, 1001, 0, *((unsigned int *)a1 + 47), v19);
        CFURLRef v22 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = *a1;
          v31.st_dev = 67109890;
          *(_DWORD *)&v31.st_mode = v21;
          LOWORD(v31.st_ino) = 1024;
          *(_DWORD *)((char *)&v31.st_ino + 2) = v20;
          HIWORD(v31.st_ino) = 1024;
          v31.uid_t st_uid = v19;
          LOWORD(v31.st_gid) = 2112;
          *(void *)((char *)&v31.st_gid + 2) = v23;
          _os_log_impl(&dword_21527C000, v22, OS_LOG_TYPE_DEFAULT, "sqlite3_db_config lookaside set {result: %d, size: %d, count: %d, path: %@}", (uint8_t *)&v31, 0x1Eu);
        }
      }
    }
  }
  if ((a3 & 1) == 0) {
    chmod(a2, 0x1FFu);
  }
  if (v13) {
    free(v13);
  }
  uint64_t v24 = *v17;
  if (!*v17 || v18)
  {
    if (v24)
    {
      sqlite3_close(v24);
      NSObject *v17 = 0;
    }
    free(v5);
    return 0;
  }
  else
  {
    const char *v5 = (sqlite3 *)a1;
    *((_DWORD *)v5 + 1CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = 0xFFFF;
    int v30 = 1;
    sqlite3_file_control(v24, 0, 10, &v30);
    if (dword_26AB04350 >= 10)
    {
      v25.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v25.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v31.st_size = v25;
      *(timespec *)&v31.st_blksize = v25;
      v31.st_ctimespec = v25;
      v31.st_birthtimespec = v25;
      v31.st_atimespec = v25;
      v31.st_mtimespec = v25;
      *(timespec *)&v31.st_dev = v25;
      *(timespec *)&v31.uid_t st_uid = v25;
      snprintf((char *)&v31, 0x80uLL, "PRAGMA cache_size=%d;", dword_26AB04350);
      sqlite3_exec(*v17, (const char *)&v31, 0, 0, 0);
    }
    unsigned int v26 = (int (__cdecl *)(void *, int))a1[20];
    if (v26) {
      sqlite3_busy_handler(*v17, v26, (void *)a1[21]);
    }
    else {
      sqlite3_busy_timeout(*v17, 30000);
    }
    CSDBSqliteSetupLoggingForDatabaseHandle(*v17);
    uint64_t v27 = (void (*)(uint64_t *, sqlite3 **))a1[4];
    if (v27) {
      v27(a1, v5);
    }
  }
  return v5;
}

void sub_215289E50(void ****a1, unsigned char *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = sqlite3_errcode((sqlite3 *)(*a1)[1]);
  if (v4)
  {
    int v8 = v4;
    CSDBCheckResultWithStatement(**a1, (char *)(*a1)[1], v4, (uint64_t)"checkConnectionStatus", 0, v5, v6, v7, v12, v13, (uint64_t)v14, v15, v16, v17, v18, v19, v20, v21, v22,
      v23,
      v24,
      v25);
    if ((v8 - 5) > 1)
    {
      if (v8 != 1)
      {
        if (v8 == 11)
        {
          sub_21527E514(*a1);
          *a1 = 0;
          if (a2) {
            *a2 = 1;
          }
        }
        else if (IMOSLoggingEnabled())
        {
          __int16 v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v10 = sqlite3_extended_errcode((sqlite3 *)(*a1)[1]);
            uint64_t v11 = sqlite3_errmsg((sqlite3 *)(*a1)[1]);
            LODWORD(v12) = 67109634;
            HIDWORD(v12) = v8;
            LOWORD(v13) = 1024;
            *(_DWORD *)((char *)&v13 + 2) = v10;
            HIWORD(v13) = 2080;
            int v14 = v11;
            _os_log_impl(&dword_21527C000, v9, OS_LOG_TYPE_INFO, "Encountered SQLite error %d (%d): %s", (uint8_t *)&v12, 0x18u);
          }
        }
      }
    }
    else
    {
      sub_21527E514(*a1);
      *a1 = 0;
    }
  }
}

sqlite3 **sub_21528A004(uint64_t *a1, const char *a2, sqlite3 ***a3)
{
  if (*a3)
  {
    sub_21527E514(*a3);
    *a3 = 0;
  }
  uint64_t result = sub_215289A28(a1, a2, 1);
  *a3 = result;
  if (result)
  {
    return (sqlite3 **)CSDBSqliteConnectionBeginTransactionType((uint64_t)result, 0);
  }
  return result;
}

uint64_t sub_21528A080(uint64_t a1, const char *a2, uint64_t *a3)
{
  if (!*(unsigned char *)(a1 + 64)) {
    sub_21528CC40();
  }
  if (*a3)
  {
    sub_21527E514((void *)*a3);
    *a3 = 0;
  }
  int v6 = dlopen("/System/Library/PrivateFrameworks/DataMigration.framework/DataMigration", 1);
  if (v6)
  {
    int v7 = v6;
    int v8 = (uint64_t (*)(void))dlsym(v6, "DMPerformMigration");
    if (v8)
    {
      __int16 v9 = v8;
      CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"Database version conflict detected: %s", a2);
      LODWORD(v9) = v9();
      CFRelease(v10);
      dlclose(v7);
      if (v9)
      {
        uint64_t v11 = sub_215289A28((uint64_t *)a1, a2, 1);
        *a3 = (uint64_t)v11;
        if (!v11) {
          return 0;
        }
        CSDBSqliteConnectionBeginTransactionType((uint64_t)v11, 0);
        uint64_t v12 = *a3;
        BOOL v22 = 0;
        int v13 = sub_215287504(v12, @"_ClientVersion", 0, &v22);
        uint64_t v14 = 0;
        if (v22) {
          int v15 = v13;
        }
        else {
          int v15 = 0;
        }
        if (v15 == *(_DWORD *)(a1 + 80)) {
          return v14;
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          uint64_t v14 = 1;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            __int16 v20 = 0;
            uint64_t v17 = "migration was performed, but the version is still wrong. deleting database file.";
            uint64_t v18 = (uint8_t *)&v20;
LABEL_19:
            _os_log_impl(&dword_21527C000, v16, OS_LOG_TYPE_INFO, v17, v18, 2u);
            return v14;
          }
          return v14;
        }
        return 1;
      }
    }
    else
    {
      dlclose(v7);
    }
  }
  if (!IMOSLoggingEnabled()) {
    return 1;
  }
  uint64_t v16 = OSLogHandleForIMFoundationCategory();
  uint64_t v14 = 1;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    uint64_t v17 = "migration daemon failed to upgrade";
    uint64_t v18 = buf;
    goto LABEL_19;
  }
  return v14;
}

uint64_t sub_21528A260(uint64_t a1, const char *a2, uint64_t a3, sqlite3 ***a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 64)) {
    sub_21528CC6C();
  }
  int v5 = *(uint64_t (**)(uint64_t, sqlite3 **, uint64_t, void))(a1 + 48);
  if (v5 && *(void *)(a1 + 56))
  {
    int v9 = v5(a1, *a4, a3, *(void *)(a1 + 72));
    int v10 = IMOSLoggingEnabled();
    if (v9)
    {
      if (v10)
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21527C000, v11, OS_LOG_TYPE_INFO, "doing the migration", buf, 2u);
        }
      }
      switch((*(uint64_t (**)(uint64_t, sqlite3 **, uint64_t, void))(a1 + 56))(a1, *a4, a3, *(void *)(a1 + 72)))
      {
        case 0:
          CSDBSqliteConnectionSetIntegerForProperty(*a4, @"_ClientVersion", *(_DWORD *)(a1 + 80));
          if (IMOSLoggingEnabled())
          {
            uint64_t v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              int v13 = *(_DWORD *)(a1 + 80);
              uint64_t v14 = (uint64_t)*a4;
              BOOL v22 = 0;
              int v15 = sub_215287504(v14, @"_ClientVersion", 0, &v22);
              if (v22) {
                int v16 = v15;
              }
              else {
                int v16 = 0;
              }
              *(_DWORD *)buf = 67109376;
              int v24 = v13;
              __int16 v25 = 1024;
              int v26 = v16;
              _os_log_impl(&dword_21527C000, v12, OS_LOG_TYPE_INFO, "set schema version %d (Read: %d)", buf, 0xEu);
            }
          }
          return 0;
        case 1:
          sub_21528A004((uint64_t *)a1, a2, a4);
          return 0;
        case 2:
          if (!IMOSLoggingEnabled()) {
            return 1;
          }
          uint64_t v17 = OSLogHandleForIMFoundationCategory();
          uint64_t v18 = 1;
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
            return v18;
          }
          *(_WORD *)buf = 0;
          uint64_t v19 = "Migration handler failed to upgrade: moving-aside database file";
          goto LABEL_21;
        case 3:
          if (IMOSLoggingEnabled())
          {
            __int16 v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21527C000, v20, OS_LOG_TYPE_INFO, "Migration handler: client is upgrading database in background", buf, 2u);
            }
          }
          if (!*a4) {
            return 0;
          }
          sub_21527E514(*a4);
          uint64_t v18 = 0;
          *a4 = 0;
          return v18;
        default:
          return 0;
      }
    }
    if (v10)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      uint64_t v18 = 1;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v19 = "Incompatible versions detected, but migration handler is incapable of upgrading: moving-aside database file";
        goto LABEL_21;
      }
      return v18;
    }
    return 1;
  }
  if (!IMOSLoggingEnabled()) {
    return 1;
  }
  uint64_t v17 = OSLogHandleForIMFoundationCategory();
  uint64_t v18 = 1;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    uint64_t v19 = "Incompatible versions detected, but no migration handlers provided: moving-aside database file";
LABEL_21:
    _os_log_impl(&dword_21527C000, v17, OS_LOG_TYPE_INFO, v19, buf, 2u);
  }
  return v18;
}

sqlite3 **sub_21528A600(uint64_t a1, const char *a2, int a3, uint64_t a4, sqlite3 ***a5)
{
  *(void *)&buf[1024] = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21527C000, v10, OS_LOG_TYPE_INFO, "Moving aside DB due to failed migration / incompatibility.", buf, 2u);
    }
  }
  memset(&buf[1], 170, 0x3FFuLL);
  memset(&buffer[1], 170, 0x3FFuLL);
  buf[0] = 0;
  buffer[0] = 0;
  MutableCFArrayRef Copy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, *(CFStringRef *)a1);
  CFStringRef v12 = MutableCopy;
  if (a4 == -1) {
    CFStringAppendFormat(MutableCopy, 0, @".incompatible.unknownversion.sqlitedb");
  }
  else {
    CFStringAppendFormat(MutableCopy, 0, @".incompatible.v%i.sqlitedb", a4);
  }
  if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v64 = 138412290;
      *(void *)v65 = v12;
      _os_log_impl(&dword_21527C000, v13, OS_LOG_TYPE_INFO, "Destination path: %@", v64, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      CFStringRef v15 = *(CFStringRef *)a1;
      *(_DWORD *)v64 = 138412290;
      *(void *)v65 = v15;
      _os_log_impl(&dword_21527C000, v14, OS_LOG_TYPE_INFO, "Source path: %@", v64, 0xCu);
    }
  }
  CFStringGetCString(v12, buf, 1024, 0x8000100u);
  CFStringGetCString(*(CFStringRef *)a1, buffer, 1024, 0x8000100u);
  int v16 = *(_DWORD *)(a1 + 184);
  if (v16) {
    int v17 = 4194306;
  }
  else {
    int v17 = 3145730;
  }
  if (v16 == 1) {
    int v18 = 1048578;
  }
  else {
    int v18 = v17;
  }
  ppDb = 0;
  int v19 = sqlite3_open_v2(buffer, &ppDb, v18, 0);
  if (v19) {
    goto LABEL_76;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_21527C000, v20, OS_LOG_TYPE_INFO, "Opened the source database to force WAL journal mode.", v64, 2u);
    }
  }
  sqlite3_exec(ppDb, "pragma JOURNAL_MODE=wal", 0, 0, 0);
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_21527C000, v21, OS_LOG_TYPE_INFO, "Closing the source database to clean up any support files.", v64, 2u);
    }
  }
  sqlite3_close(ppDb);
  ppDb = 0;
  int v19 = sqlite3_open_v2(buffer, &ppDb, v18, 0);
  if (v19)
  {
LABEL_76:
    if (IMOSLoggingEnabled())
    {
      BOOL v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v23 = sqlite3_extended_errcode(ppDb);
        int v24 = sqlite3_errmsg(ppDb);
        *(_DWORD *)v64 = 67109634;
        *(_DWORD *)v65 = v19;
        *(_WORD *)&v65[4] = 1024;
        *(_DWORD *)&v65[6] = v23;
        __int16 v66 = 2080;
        *(void *)v67 = v24;
        __int16 v25 = "Unable to open the source database. SQLite error: [%d] (%d) %s";
        int v26 = v22;
LABEL_30:
        uint32_t v27 = 24;
LABEL_31:
        _os_log_impl(&dword_21527C000, v26, OS_LOG_TYPE_INFO, v25, v64, v27);
        goto LABEL_32;
      }
    }
    goto LABEL_32;
  }
  if (IMOSLoggingEnabled())
  {
    CFNumberRef v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_21527C000, v29, OS_LOG_TYPE_INFO, "Opened the source database.", v64, 2u);
    }
  }
  int v30 = *(_DWORD *)(a1 + 184);
  int v31 = 4194310;
  if (!v30) {
    int v31 = 3145734;
  }
  if (v30 == 1) {
    int v32 = 1048582;
  }
  else {
    int v32 = v31;
  }
  db = 0;
  int v33 = sqlite3_open_v2(buf, &db, v32, 0);
  int v34 = IMOSLoggingEnabled();
  if (!v33)
  {
    if (v34)
    {
      int v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v64 = 0;
        _os_log_impl(&dword_21527C000, v38, OS_LOG_TYPE_INFO, "Opened the destination database.", v64, 2u);
      }
    }
    int v39 = sqlite3_file_control(db, 0, 102, ppDb);
    int v40 = IMOSLoggingEnabled();
    if (v39)
    {
      if (v40)
      {
        int v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          int v42 = sqlite3_extended_errcode(ppDb);
          int v43 = sqlite3_extended_errcode(db);
          CFNumberRef v44 = sqlite3_errmsg(db);
          int v45 = sqlite3_errmsg(ppDb);
          *(_DWORD *)v64 = 67110146;
          *(_DWORD *)v65 = v39;
          *(_WORD *)&v65[4] = 1024;
          *(_DWORD *)&v65[6] = v42;
          __int16 v66 = 1024;
          *(_DWORD *)v67 = v43;
          *(_WORD *)&v67[4] = 2080;
          *(void *)&v67[6] = v44;
          __int16 v68 = 2080;
          v69 = v45;
          int v46 = "Replacing messages database from restore failed. SQLite error: [%d] (source: %d, dest: %d) Destination: %s Source: %s";
          unint64_t v47 = v41;
          uint32_t v48 = 40;
LABEL_57:
          _os_log_impl(&dword_21527C000, v47, OS_LOG_TYPE_INFO, v46, v64, v48);
        }
      }
    }
    else if (v40)
    {
      v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v64 = 0;
        int v46 = "Database replacement was successful.";
        unint64_t v47 = v49;
        uint32_t v48 = 2;
        goto LABEL_57;
      }
    }
    int v50 = sqlite3_close(db);
    int v51 = IMOSLoggingEnabled();
    if (v50)
    {
      if (v51)
      {
        uint64_t v52 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          int v53 = sqlite3_extended_errcode(db);
          v54 = sqlite3_errmsg(db);
          *(_DWORD *)v64 = 67109634;
          *(_DWORD *)v65 = v50;
          *(_WORD *)&v65[4] = 1024;
          *(_DWORD *)&v65[6] = v53;
          __int16 v66 = 2080;
          *(void *)v67 = v54;
          v55 = "Unable to close the destination database. SQLite error: [%d] (%d) %s";
          v56 = v52;
          uint32_t v57 = 24;
LABEL_65:
          _os_log_impl(&dword_21527C000, v56, OS_LOG_TYPE_INFO, v55, v64, v57);
        }
      }
    }
    else if (v51)
    {
      v58 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v64 = 0;
        v55 = "Closed the destination database.";
        v56 = v58;
        uint32_t v57 = 2;
        goto LABEL_65;
      }
    }
    BOOL v59 = sub_2152886C8(ppDb, *(void **)a1);
    int v60 = IMOSLoggingEnabled();
    if (v59)
    {
      if (!v60) {
        goto LABEL_32;
      }
      v61 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_INFO)) {
        goto LABEL_32;
      }
      *(_WORD *)v64 = 0;
      __int16 v25 = "Cleaned up the source database.";
    }
    else
    {
      if (!v60) {
        goto LABEL_32;
      }
      v61 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_INFO)) {
        goto LABEL_32;
      }
      *(_WORD *)v64 = 0;
      __int16 v25 = "Unable to cleanup corrupt source database.";
    }
    int v26 = v61;
    uint32_t v27 = 2;
    goto LABEL_31;
  }
  if (v34)
  {
    BOOL v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      int v36 = sqlite3_extended_errcode(db);
      float v37 = sqlite3_errmsg(db);
      *(_DWORD *)v64 = 67109634;
      *(_DWORD *)v65 = v33;
      *(_WORD *)&v65[4] = 1024;
      *(_DWORD *)&v65[6] = v36;
      __int16 v66 = 2080;
      *(void *)v67 = v37;
      __int16 v25 = "Unable to open the destination database. SQLite error: [%d] (%d) %s";
      int v26 = v35;
      goto LABEL_30;
    }
  }
LABEL_32:
  if (v12) {
    CFRelease(v12);
  }
  *(unsigned char *)(a1 + 84) |= 1u;
  *(_DWORD *)(a1 + 8CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = a3;
  return sub_21528A004((uint64_t *)a1, a2, a5);
}

void sub_21528ADF4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x21528AD58);
  }
  _Unwind_Resume(a1);
}

void sub_21528AEE4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  int v6 = IMOSLoggingEnabled();
  if (a3)
  {
    if (v6)
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LODWORD(v4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = 136315138;
        *(void *)((char *)&v40 + 4) = a2;
        _os_log_impl(&dword_21527C000, v7, OS_LOG_TYPE_INFO, "Setting up a new database at path %s.", (uint8_t *)&v40, 0xCu);
      }
    }
    CSDBSqliteConnectionBeginTransactionType(a3, 0);
    uint64_t v8 = sqlite3_exec(*(sqlite3 **)(a3 + 8), "pragma legacy_file_format = 0;", 0, 0, 0);
    CSDBCheckResultWithStatement((void **)a1, *(char **)(a3 + 8), v8, (uint64_t)"CSDBSqliteDatabaseSetNewFileFormatPragma", 0, v9, v10, v11, v32, v34, v36, v38, v40, *((uint64_t *)&v40 + 1), v41, v42, v43, v44, v45,
      v46,
      v47,
      v48);
    CFStringRef v12 = *(void (**)(uint64_t, uint64_t))(a1 + 24);
    if (v12) {
      v12(a1, a3);
    }
    uint64_t v13 = sqlite3_exec(*(sqlite3 **)(a3 + 8), "CREATE TABLE IF NOT EXISTS _SqliteDatabaseProperties (key TEXT, value TEXT, UNIQUE(key));",
            0,
            0,
            0);
    CSDBCheckResultWithStatement((void **)a1, *(char **)(a3 + 8), v13, (uint64_t)"createAndSetupNewDatabase", 0, v14, v15, v16, v33, v35, v37, v39, v40, *((uint64_t *)&v40 + 1), v41, v42, v43, v44, v45,
      v46,
      v47,
      v48);
    if (v13)
    {
      int v17 = sqlite3_extended_errcode(*(sqlite3 **)(a3 + 8));
      int v18 = sqlite3_errmsg(*(sqlite3 **)(a3 + 8));
      printf("error %d (%d) creating properties table: %s\n", v13, v17, v18);
      *(void *)(a1 + 8) = 0;
    }
    else
    {
      __int16 v20 = *(void (**)(uint64_t, uint64_t, void))(a1 + 16);
      if (v20) {
        v20(a1, a3, *(void *)(a1 + 40));
      }
      if (*(unsigned char *)(a1 + 84)) {
        CSDBSqliteConnectionSetIntegerForProperty((void *)a3, @"_ClientVersion", *(_DWORD *)(a1 + 80));
      }
      int v21 = CSDBSqliteConnectionCommit(a3);
      if (v21 == 101 || !v21)
      {
        id v22 = [NSString alloc];
        size_t v23 = strlen(a2);
        __int16 v25 = objc_msgSend_initWithBytes_length_encoding_(v22, v24, (uint64_t)a2, v23, 1);
        BOOL v28 = sub_215285DE8(v25, v26, v27);
        CFStringRef v30 = (const __CFString *)objc_msgSend_stringByAppendingString_(@"com.apple.coresdb.mandatory_db_reconnect_required.", v29, (uint64_t)v28);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, v30, 0, 0, 1uLL);
        if (v28) {
          CFRelease(v28);
        }
      }
    }
  }
  else if (v6)
  {
    int v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v4CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_215284810, 0) = 0;
      _os_log_impl(&dword_21527C000, v19, OS_LOG_TYPE_INFO, "Could not set up new messages database -- unable to create database connection", (uint8_t *)&v40, 2u);
    }
  }
}

uint64_t sub_21528B1E8()
{
  pthread_mutex_lock(&stru_26AB04378);
  uint64_t v0 = dword_26AB043B8;
  if (dword_26AB043B8 == -1)
  {
    uint64_t v0 = getenv("CSDBSQLDEBUG") != 0;
    dword_26AB043B8 = v0;
  }
  pthread_mutex_unlock(&stru_26AB04378);
  return v0;
}

void *sub_21528B248(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_first(a3, a2, (uint64_t)a3);
  uint64_t result = objc_msgSend_second(a3, v7, v8);
  if (result)
  {
    uint64_t v11 = (uint64_t)result;
    uint64_t result = *(void **)(a1 + 32);
    if (result)
    {
      uint64_t result = objc_msgSend_isEqualToString_(result, v10, v11);
      if (result)
      {
        if (IMOSLoggingEnabled())
        {
          CFStringRef v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            int v13 = 138412290;
            int v14 = a2;
            _os_log_impl(&dword_21527C000, v12, OS_LOG_TYPE_INFO, "Calling reconnect block for identifier: %@", (uint8_t *)&v13, 0xCu);
          }
        }
        return (void *)(*(uint64_t (**)(uint64_t))(v6 + 16))(v6);
      }
    }
  }
  return result;
}

uint64_t CSDBCreateDirectoriesToPathWithOwnership(const char *a1, uid_t a2, gid_t a3, int a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v14.st_blksize = v8;
  *(timespec *)v14.st_qspare = v8;
  v14.st_birthtimespec = v8;
  *(timespec *)&v14.st_size = v8;
  v14.st_mtimespec = v8;
  v14.st_ctimespec = v8;
  *(timespec *)&v14.uid_t st_uid = v8;
  v14.st_atimespec = v8;
  *(timespec *)&v14.st_dev = v8;
  uint64_t result = stat(a1, &v14);
  if (result)
  {
    bzero(v15, 0x400uLL);
    int v10 = *(unsigned __int8 *)a1;
    if (!*a1) {
      return 0;
    }
    unint64_t v11 = 0;
    CFStringRef v12 = a1 + 1;
    while (1)
    {
      v15[v11] = v10;
      if (v10 == 47 && stat(v15, &v14))
      {
        if (mkdir(v15, 0x1FFu)) {
          return *__error();
        }
        if (a4)
        {
          chown(v15, a2, a3);
          mode_t v13 = 448;
        }
        else
        {
          mode_t v13 = 511;
        }
        chmod(v15, v13);
      }
      uint64_t result = 0;
      if (v11 <= 0x3FD)
      {
        int v10 = v12[v11++];
        if (v10) {
          continue;
        }
      }
      return result;
    }
  }
  return result;
}

uint64_t CSDBCreateDirectoriesToPath(const char *a1, uid_t a2, gid_t a3)
{
  return CSDBCreateDirectoriesToPathWithOwnership(a1, a2, a3, 1);
}

uint64_t CSDBGetMobileUserDirectory()
{
  return qword_26AB043D8;
}

void sub_21528B4D4()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v0 = (const void *)MEMORY[0x2166B5D70]();
  qword_26AB043E8 = (uint64_t)v0;
  if (v0)
  {
    *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buffer = v1;
    long long v14 = v1;
    CFIndex v12 = 32;
    CFRetain(v0);
    CFURLRef v2 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
    CFArrayRef v3 = (const __CFAllocator **)MEMORY[0x263EFFB08];
    if (v2)
    {
      CFURLRef v4 = v2;
      CFStringRef v5 = CFURLCopyFileSystemPath(v2, kCFURLPOSIXPathStyle);
      if (v5)
      {
        CFStringRef v6 = v5;
        qword_26AB043D8 = (uint64_t)sub_21528B6EC(*v3, v5, 0, 0);
        CFRelease(v6);
      }
      CFRelease(v4);
    }
    CFAllocatorRef v7 = *v3;
    timespec v8 = sub_21528B6EC(*v3, (CFStringRef)qword_26AB043E8, buffer, &v12);
    if (v8)
    {
      int v9 = (char *)v8;
      int v10 = getpwnam(v8);
      if (v10)
      {
        int pw_gid = v10->pw_gid;
        dword_26AB043E0 = v10->pw_uid;
        dword_26AB043E4 = pw_gid;
      }
      if (v9 != buffer) {
        CFAllocatorDeallocate(v7, v9);
      }
    }
  }
}

uint64_t CSDBGetMobileUserUID()
{
  return dword_26AB043E0;
}

uint64_t CSDBGetMobileUserGID()
{
  return dword_26AB043E4;
}

void *CSDBGenerateInClauseForCount(int a1, const char *a2)
{
  CFURLRef v4 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], a2, @"IN (");
  if (a1 >= 1)
  {
    int v5 = 0;
    do
    {
      if (v5 >= a1 - 1) {
        objc_msgSend_appendFormat_(v4, v3, @"? "));
      }
      else {
        objc_msgSend_appendFormat_(v4, v3, @"?, ");
      }
      ++v5;
    }
    while (a1 != v5);
  }
  return v4;
}

const char *sub_21528B6EC(const __CFAllocator *a1, CFStringRef theString, char *buffer, CFIndex *a4)
{
  CFURLRef v4 = buffer;
  uint64_t v12 = 0;
  if (a4) {
    CFIndex usedBufLen = a4;
  }
  else {
    CFIndex usedBufLen = &v12;
  }
  if (buffer && *usedBufLen && CFStringGetCString(theString, buffer, *usedBufLen, 0x8000100u))
  {
    *CFIndex usedBufLen = strlen(v4);
  }
  else
  {
    CFIndex Length = CFStringGetLength(theString);
    v13.location = 0;
    v13.length = Length;
    CFStringGetBytes(theString, v13, 0x8000100u, 0, 0, 0, 0, usedBufLen);
    int v9 = (UInt8 *)CFAllocatorAllocate(a1, *usedBufLen + 1, 0);
    if (v9)
    {
      int v10 = v9;
      v14.location = 0;
      v14.length = Length;
      CFStringGetBytes(theString, v14, 0x8000100u, 0, 0, v9, *usedBufLen, usedBufLen);
      v10[*usedBufLen] = 0;
      return (const char *)v10;
    }
    else
    {
      *CFIndex usedBufLen = 0;
      if (v4) {
        *CFURLRef v4 = 0;
      }
    }
  }
  return v4;
}

uint64_t CSDBCreateThreadedRecordStore(uint64_t a1)
{
  CFURLRef v2 = [CSDBThreadedRecordStore alloc];
  return MEMORY[0x270F9A6D0](v2, sel_initWithIdentifier_qosClass_lookAsideConfig_, a1);
}

uint64_t CSDBCreateThreadedRecordStoreWithQOSClass(uint64_t a1)
{
  CFURLRef v2 = [CSDBThreadedRecordStore alloc];
  return MEMORY[0x270F9A6D0](v2, sel_initWithIdentifier_qosClass_lookAsideConfig_, a1);
}

uint64_t CSDBCreateThreadedRecordStoreWithQOSClassAndLookAsideBufferConfig(uint64_t a1)
{
  CFURLRef v2 = [CSDBThreadedRecordStore alloc];
  return MEMORY[0x270F9A6D0](v2, sel_initWithIdentifier_qosClass_lookAsideConfig_, a1);
}

uint64_t CSDBThreadedRecordStoreEnsureDatabaseSetup(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, char a10)
{
  return objc_msgSend_setupDatabaseWithAllowLocalMigration_pathBlock_setupStoreHandler_connectionInitializer_versionChecker_migrationHandler_schemaVersion_dataProtectionClass_registerBlock_exclusiveOwnership_(a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7, a8 | 0x200000000, a9, a10);
}

uint64_t CSDBThreadedRecordStoreRegisterClass(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](a1, sel_registerClass_, a2);
}

void CSDBPerformLockedSectionUsingUnfairLock(uint64_t a1, os_unfair_lock_t lock, uint64_t a3)
{
  if (lock)
  {
    os_unfair_lock_lock(lock);
    if (a1 && a3 && *(void *)(a1 + 8)) {
      (*(void (**)(uint64_t))(a3 + 16))(a3);
    }
    os_unfair_lock_unlock(lock);
  }
  else if (a1 && a3 && *(void *)(a1 + 8))
  {
    CFStringRef v6 = *(void (**)(uint64_t))(a3 + 16);
    v6(a3);
  }
}

uint64_t CSDBPerformLockedSectionUsingSpinLock(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  if (a2)
  {
    _os_nospin_lock_lock();
    if (v4 && a3 && *(void *)(v4 + 8)) {
      (*(void (**)(uint64_t))(a3 + 16))(a3);
    }
    return MEMORY[0x270ED80D8](a2);
  }
  else if (result && a3 && *(void *)(result + 8))
  {
    CFStringRef v6 = *(uint64_t (**)(uint64_t))(a3 + 16);
    return v6(a3);
  }
  return result;
}

uint64_t *CSDBPerformLockedSectionForConnectionForReading(uint64_t *result, uint64_t a2)
{
  if (result)
  {
    if (a2)
    {
      CFArrayRef v3 = result;
      uint64_t result = (uint64_t *)result[1];
      if (result)
      {
        uint64_t result = (uint64_t *)CSDBRecordStoreGetDatabase((uint64_t)result);
        if (result)
        {
          uint64_t v4 = result;
          uint64_t result = (uint64_t *)CSDBSqliteDatabaseConnectionForReading((uint64_t)result);
          if (result)
          {
            int v5 = result;
            (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t *))(a2 + 16))(a2, v3[1], v4, result);
            return CSDBSqliteDatabaseReleaseSqliteConnection(v5);
          }
        }
      }
    }
  }
  return result;
}

uint64_t *CSDBPerformLockedSectionForConnectionForWriting(uint64_t *result, uint64_t a2)
{
  if (result)
  {
    if (a2)
    {
      CFArrayRef v3 = result;
      uint64_t result = (uint64_t *)result[1];
      if (result)
      {
        uint64_t result = (uint64_t *)CSDBRecordStoreGetDatabase((uint64_t)result);
        if (result)
        {
          uint64_t v4 = result;
          uint64_t result = (uint64_t *)CSDBSqliteDatabaseConnectionForWriting((uint64_t)result);
          if (result)
          {
            int v5 = result;
            (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t *))(a2 + 16))(a2, v3[1], v4, result);
            return CSDBSqliteDatabaseReleaseSqliteConnection(v5);
          }
        }
      }
    }
  }
  return result;
}

uint64_t CSDBPerformUnlocked(uint64_t result, uint64_t a2)
{
  if (result && a2)
  {
    if (*(void *)(result + 8)) {
      return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
    }
  }
  return result;
}

uint64_t CSDBPerformUnlockedSectionForRecordStore(uint64_t result, uint64_t a2)
{
  if (result && a2)
  {
    uint64_t v2 = *(void *)(result + 8);
    if (v2) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v2);
    }
  }
  return result;
}

uint64_t CSDBPerformUnlockedSectionForDatabase(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = result;
      uint64_t result = *(void *)(result + 8);
      if (result)
      {
        uint64_t result = CSDBRecordStoreGetDatabase(result);
        if (result)
        {
          uint64_t v4 = *(void *)(v3 + 8);
          int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16);
          return v5(a2, v4, result);
        }
      }
    }
  }
  return result;
}

uint64_t *CSDBPerformUnlockedSectionForConnectionForReading(uint64_t *result, uint64_t a2)
{
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = result;
      uint64_t result = (uint64_t *)result[1];
      if (result)
      {
        uint64_t result = (uint64_t *)CSDBRecordStoreGetDatabase((uint64_t)result);
        if (result)
        {
          uint64_t v4 = result;
          uint64_t result = (uint64_t *)CSDBSqliteDatabaseConnectionForReading((uint64_t)result);
          if (result)
          {
            int v5 = result;
            (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t *))(a2 + 16))(a2, v3[1], v4, result);
            return CSDBSqliteDatabaseReleaseSqliteConnection(v5);
          }
        }
      }
    }
  }
  return result;
}

uint64_t *CSDBPerformUnlockedSectionForConnectionForWriting(uint64_t *result, uint64_t a2)
{
  if (result)
  {
    if (a2)
    {
      uint64_t v3 = result;
      uint64_t result = (uint64_t *)result[1];
      if (result)
      {
        uint64_t result = (uint64_t *)CSDBRecordStoreGetDatabase((uint64_t)result);
        if (result)
        {
          uint64_t v4 = result;
          uint64_t result = (uint64_t *)CSDBSqliteDatabaseConnectionForWriting((uint64_t)result);
          if (result)
          {
            int v5 = result;
            (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t *))(a2 + 16))(a2, v3[1], v4, result);
            return CSDBSqliteDatabaseReleaseSqliteConnection(v5);
          }
        }
      }
    }
  }
  return result;
}

uint64_t CSDBPerformUnlockedSectionForQueryForReading(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v5 = result;
        uint64_t result = *(void *)(result + 8);
        if (result)
        {
          uint64_t result = CSDBRecordStoreGetDatabase(result);
          if (result)
          {
            uint64_t v6 = result;
            uint64_t result = CSDBSqliteDatabaseStatementForReading(result, a2);
            if (result)
            {
              uint64_t v7 = result;
              if (*(void *)(result + 8))
              {
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(a3 + 16))(a3, *(void *)(v5 + 8), v6, result);
                return CSDBSqliteStatementReset(v7);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CSDBPerformUnlockedSectionForQueryForWriting(uint64_t result, const __CFString *a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v5 = result;
        uint64_t result = *(void *)(result + 8);
        if (result)
        {
          uint64_t result = CSDBRecordStoreGetDatabase(result);
          if (result)
          {
            uint64_t v6 = result;
            uint64_t result = (uint64_t)CSDBSqliteDatabaseStatementForWriting(result, a2);
            if (result)
            {
              uint64_t v7 = result;
              if (*(void *)(result + 8))
              {
                (*(void (**)(uint64_t, void, uint64_t, uint64_t))(a3 + 16))(a3, *(void *)(v5 + 8), v6, result);
                return CSDBSqliteStatementReset(v7);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void CSDBRecordStoreInvalidateCaches(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1) {
    CSDBRecordStoreInvalidateCachesWithStore(v1);
  }
}

void CSDBRecordStoreSaveAndInvalidateCaches(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 8);
    if (v1)
    {
      CSDBRecordSaveStore(*(void *)(a1 + 8));
      CSDBRecordStoreInvalidateCachesWithStore(v1);
    }
  }
}

void CSDBRecordStoreRecordCommitChangesAndReleaseUnlocked(uint64_t a1, CFTypeRef cf)
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 8);
    if (v3) {
      CSDBRecordSaveStore(v3);
    }
  }
  CFRelease(cf);
}

void CSDBRecordStoreRecordCommitChangesAndRelease(uint64_t a1, CFTypeRef cf)
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 8);
    if (v3) {
      CSDBRecordSaveStore(v3);
    }
  }
  CFRelease(cf);
}

uint64_t CSDBRecordStoreSave(uint64_t result)
{
  if (result)
  {
    uint64_t result = *(void *)(result + 8);
    if (result) {
      return CSDBRecordSaveStore(result);
    }
  }
  return result;
}

uint64_t CSDBThreadedRecordStoreGetSequenceNumber(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  int v7 = 0;
  if (a1 && (uint64_t v1 = *(void *)(a1 + 8)) != 0)
  {
    *((_DWORD *)v5 + 6) = CSDBRecordStoreGetSequenceNumber(v1);
    uint64_t v2 = *((unsigned int *)v5 + 6);
  }
  else
  {
    uint64_t v2 = 0;
  }
  _Block_object_dispose(&v4, 8);
  return v2;
}

void sub_21528C374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21528C38C(uint64_t a1, uint64_t a2)
{
  uint64_t result = CSDBRecordStoreGetSequenceNumber(a2);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_21528C4FC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    CSDBRecordStoreInvalidateCachesWithStore(v2);
  }
}

uint64_t CSDBRecordStoreRefFromThreadedRecordStoreRef(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void sub_21528C560()
{
}

void sub_21528C58C()
{
}

void sub_21528C5B8()
{
}

void sub_21528C5E4()
{
  __assert_rtn("_updateDetachedRecord", "CSDBRecord.m", 339, "result == record");
}

void sub_21528C610()
{
}

void sub_21528C63C()
{
}

void sub_21528C668()
{
}

void sub_21528C694()
{
}

void sub_21528C6C0()
{
}

void sub_21528C6EC()
{
}

void sub_21528C718()
{
}

void sub_21528C744()
{
}

void sub_21528C770()
{
}

void sub_21528C79C()
{
}

void sub_21528C7C8()
{
}

void sub_21528C7F4()
{
}

void sub_21528C820()
{
}

void sub_21528C84C()
{
}

void sub_21528C878()
{
}

void sub_21528C8A4()
{
}

void sub_21528C8D0()
{
}

void sub_21528C8FC()
{
}

void sub_21528C928()
{
}

void sub_21528C954()
{
}

void sub_21528C980()
{
  __assert_rtn("CSDBRecordStoreCreateTablesForClass", "CSDBRecord.m", 1713, "hasPrimaryKeyConstraint == false");
}

void sub_21528C9AC()
{
}

void sub_21528C9D8()
{
}

void sub_21528CA04()
{
}

void sub_21528CA30()
{
  __assert_rtn("CSDBRecordStoreCreateJoinableSelectPrefixFromRecordDescriptor", "CSDBRecord.m", 2154, "tableAlias!=NULL && CFStringGetLength(tableAlias)");
}

void sub_21528CA5C()
{
  __assert_rtn("CSDBRecordStoreCreateSelectPrefixWithTableExpressionAndAlias", "CSDBRecord.m", 2159, "tableAlias!=NULL && CFStringGetLength(tableAlias)");
}

void sub_21528CA88()
{
  __assert_rtn("CSDBRecordStoreCreateSelectPrefixWithTableExpressionAndAlias", "CSDBRecord.m", 2160, "tableExpression!=NULL && CFStringGetLength(tableExpression)");
}

void sub_21528CAB4()
{
}

void sub_21528CAE0()
{
}

void sub_21528CB0C()
{
}

void sub_21528CB38()
{
}

void sub_21528CB64()
{
}

void sub_21528CB90()
{
}

void sub_21528CBBC()
{
}

void sub_21528CBE8()
{
}

void sub_21528CC14()
{
  __assert_rtn("CSDBRecordStoreUpdateRecord", "CSDBRecord.m", 1135, "record->changes==NULL");
}

void sub_21528CC40()
{
}

void sub_21528CC6C()
{
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x270EE4798]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

uint64_t CFGetUserName()
{
  return MEMORY[0x270EE4A38]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x270EE4C78](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x270EE4F80](theSet, value);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE51B8](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x270EE51E8](string);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5338](url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53C0](allocator, buffer, bufLen, isDirectory);
}

uint64_t IMFileLocationTrimFileName()
{
  return MEMORY[0x270F3CCF8]();
}

uint64_t IMGetAppBoolForKey()
{
  return MEMORY[0x270F3CD08]();
}

uint64_t IMGetAssertionFailureHandler()
{
  return MEMORY[0x270F3CD10]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x270F3CE08]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t OSLogHandleForIDSCategory()
{
  return MEMORY[0x270F3CEF0]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x270F3CF00]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x270F3CF18]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x270F3CFB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x270ED80C8]();
}

uint64_t _sqlite3_integrity_check()
{
  return MEMORY[0x270F9B448]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x270ED9D28](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x270EDA560](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_end_catch(void)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B490](a1, *(void *)&a2, a3, *(void *)&n, a5);
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

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x270F9B530](a1, a2, a3);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x270F9B538](a1, *(void *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B550](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B598](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x270F9B600](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x270F9B618](a1, *(void *)&op);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B650](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B678](db);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x270F9B688](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_get_autocommit(sqlite3 *a1)
{
  return MEMORY[0x270F9B6A0](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x270F9B6D0](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x270F9B708](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x270F9B7F8](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return MEMORY[0x270F9B840](a1, *(void *)&uMask, xCallback, pCtx);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}