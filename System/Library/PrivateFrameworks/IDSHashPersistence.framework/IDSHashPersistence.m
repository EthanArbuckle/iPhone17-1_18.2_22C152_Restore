uint64_t sub_2273213A8()
{
  uint64_t vars8;

  qword_26AD572C8 = objc_alloc_init(IDSHashPersistenceAWDLogging);
  return MEMORY[0x270F9A758]();
}

void sub_2273216C0(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _metricContainerForMetricType:1376268];
  if (v3)
  {
    id v2 = objc_alloc_init((Class)MEMORY[0x22A676930](@"AWDIDSDuplicatedMessage", @"WirelessDiagnostics"));
    [*(id *)(a1 + 32) _submitAWDMetric:v2 withContainer:v3];
  }
}

void sub_22732178C(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x22A676AE0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_2273217D8()
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_227321880;
  block[3] = &unk_2647FEE70;
  block[4] = @"IDSHashMessageStore";
  if (qword_26AD572A0 != -1) {
    dispatch_once(&qword_26AD572A0, block);
  }
  v0 = (void *)qword_26AD572A8;
  return v0;
}

uint64_t sub_227321880()
{
  qword_26AD572A8 = CSDBCreateThreadedRecordStoreWithQOSClassAndLookAsideBufferConfig();
  return MEMORY[0x270F9A758]();
}

void sub_2273218C8()
{
  os_unfair_lock_assert_owner(&stru_26AD572D8);
  v0 = sub_2273217D8();

  if (v0)
  {
    v1 = (void *)MEMORY[0x22A676AE0]();
    id v2 = sub_2273217D8();
    CSDBThreadedRecordStoreEnsureDatabaseSetupWithProtection();
  }
}

void sub_2273219B0()
{
}

void sub_2273219BC(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock(&stru_26AD572D8);
  sub_2273218C8();
  id v2 = sub_2273217D8();
  CSDBPerformLocked();

  os_unfair_lock_unlock(&stru_26AD572D8);
}

void sub_227321A2C(uint64_t a1, void *a2)
{
  id v2 = a2;
  os_unfair_lock_assert_owner(&stru_26AD572D8);
  sub_2273218C8();
  sub_2273217D8();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  CSDBPerformUnlockedSectionForQueryForWriting();
}

void sub_227321A9C(uint64_t a1, void *a2)
{
  id v2 = a2;
  os_unfair_lock_assert_owner(&stru_26AD572D8);
  sub_2273218C8();
  sub_2273217D8();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  CSDBPerformUnlockedSectionForQueryForReading();
}

void sub_227321B0C()
{
  os_unfair_lock_assert_owner(&stru_26AD572D8);
  v0 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227320000, v0, OS_LOG_TYPE_DEFAULT, "Saving database.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v1 = sub_2273217D8();
  CSDBPerformLockedSectionForRecordStore();

  id v2 = sub_2273217D8();

  if (v2)
  {
    id v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_227320000, v3, OS_LOG_TYPE_DEFAULT, "Destroying database.", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v4 = sub_2273217D8();
    MEMORY[0x22A676920]();

    v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_227320000, v5, OS_LOG_TYPE_DEFAULT, "Closed database.", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
}

uint64_t sub_227321D58(uint64_t a1, uint64_t a2)
{
  CSDBRecordSaveStore();
  return MEMORY[0x270F232C0](a2);
}

void sub_227321D94()
{
  os_unfair_lock_assert_owner(&stru_26AD572D8);
  sub_2273217D8();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  CSDBPerformLockedSectionForRecordStoreWithoutInitialize();
}

uint64_t sub_227321DE8(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F232C0](a2);
}

uint64_t sub_227321DF0(uint64_t a1)
{
  os_unfair_lock_assert_owner(&stru_26AD572D8);
  return MEMORY[0x270F23320](a1);
}

uint64_t sub_227321E30()
{
  id v0 = (void *)MEMORY[0x22A676AE0]();
  uint64_t v1 = CSDBGetMobileUserDirectory();
  if (v1)
  {
    id v2 = [MEMORY[0x263F08AB0] processInfo];
    id v3 = [v2 processName];

    v4 = [NSString stringWithFormat:@"ids-hashes-%@.db", v3];

    v5 = NSString;
    v6 = (void *)MEMORY[0x263EFF8C0];
    v7 = [NSString stringWithUTF8String:v1];
    v8 = objc_msgSend(v6, "arrayWithObjects:", v7, @"/Library/IdentityServices/", v4, 0);
    v9 = [v5 pathWithComponents:v8];

    id v10 = v9;
    [v10 fileSystemRepresentation];
    CSDBGetMobileUserUID();
    CSDBGetMobileUserGID();
    CSDBCreateDirectoriesToPath();
    uint64_t v1 = [v10 stringByResolvingAndStandardizingPath];
  }
  return v1;
}

uint64_t sub_227321F74()
{
  CSDBRecordStoreCreateTablesForClass();
  id v0 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_227320000, v0, OS_LOG_TYPE_DEBUG, "Creating indexes on message_hash_data and expiration_date", v2, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  CSDBSqliteConnectionPerformSQL();
  return CSDBSqliteConnectionPerformSQL();
}

uint64_t sub_22732206C()
{
  id v0 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227320000, v0, OS_LOG_TYPE_DEBUG, "Enabling auto vacuum.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  CSDBSqliteConnectionPerformSQL();
  uint64_t v1 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_227320000, v1, OS_LOG_TYPE_DEBUG, "Enabling WAL journal mode.", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  CSDBSqliteConnectionPerformSQL();
  id v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_227320000, v2, OS_LOG_TYPE_DEBUG, "Enabling Foreign Key support.", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  return CSDBSqliteConnectionPerformSQL();
}

BOOL sub_22732229C(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 <= 0x2329) {
    _IMWarn();
  }
  return a3 < 0x232A;
}

uint64_t sub_2273222F8(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 != 9001) {
    return 0;
  }
  int v3 = CSDBSqliteConnectionPerformSQL();
  if (v3 != 101 && v3 != 0) {
    return 2;
  }
  int v5 = v3;
  CSDBSqliteDatabaseSetVersion();
  if (v5) {
    BOOL v6 = v5 == 101;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 0;
  }
  else {
    return 2;
  }
}

uint64_t sub_22732237C(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F23358](a2, &off_2647FEEF0);
}

uint64_t sub_22732238C(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_227322404;
  v3[3] = &unk_2647FEFE0;
  v3[4] = a2;
  v3[5] = a1;
  sub_227321A2C(@"INSERT INTO message_hash (message_hash_data, creation_date) VALUES (?, ?);", v3);
  return 1;
}

uint64_t sub_227322404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CSDBSqliteBindBlobFromCFData();
  CSDBSqliteBindInt64();
  return MEMORY[0x270F23340](a4);
}

BOOL sub_227322454(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = sub_22732252C;
  v3[3] = &unk_2647FF008;
  v3[4] = &v4;
  v3[5] = a1;
  sub_227321A9C(@"SELECT COUNT(1) FROM message_hash WHERE message_hash_data = ? LIMIT 1;", v3);
  BOOL v1 = *((unsigned char *)v5 + 24) != 0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_227322514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22732252C(uint64_t a1)
{
  CSDBSqliteBindBlobFromCFData();
  uint64_t result = CSDBSqliteStep();
  if (result)
  {
    uint64_t result = CSDBSqliteStatementInteger64ResultColumn();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result > 0;
  }
  return result;
}

void sub_227322588(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = sub_227322604;
    v2[3] = &unk_2647FEFE0;
    v2[4] = a1;
    v2[5] = a2;
    sub_227321A2C(@"UPDATE message_hash SET creation_date = ? WHERE message_hash_data = ?; ", v2);
  }
}

uint64_t sub_227322604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CSDBSqliteBindInt64();
  CSDBSqliteBindBlobFromCFData();
  return MEMORY[0x270F23340](a4);
}

void sub_227322654(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 3221225472;
  v1[2] = sub_2273226C8;
  v1[3] = &unk_2647FF028;
  v1[4] = a1;
  sub_227321A2C(@"UPDATE message_hash SET creation_date = ? WHERE creation_date > ?; ", v1);
}

uint64_t sub_2273226C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CSDBSqliteBindInt64();
  CSDBSqliteBindInt64();
  return MEMORY[0x270F23340](a4);
}

void sub_227322718(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 3221225472;
  v1[2] = sub_22732278C;
  v1[3] = &unk_2647FF028;
  v1[4] = a1;
  sub_227321A2C(@"DELETE from message_hash WHERE creation_date < ?; ", v1);
}

uint64_t sub_22732278C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CSDBSqliteBindInt64();
  return MEMORY[0x270F23340](a4);
}

uint64_t sub_227322820()
{
  qword_26AD572D0 = objc_alloc_init(IDSMessageHashStore);
  return MEMORY[0x270F9A758]();
}

uint64_t sub_227322CCC(void *a1)
{
  BOOL v2 = ([*(id *)(a1[4] + 48) containsObject:a1[5]] & 1) != 0 || sub_227322454(a1[5]);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2;
  sub_227321D94();
  int v3 = (void *)a1[4];
  return [v3 _setDatabaseCloseTimerOnIvarQueue];
}

uint64_t sub_227322E2C(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    BOOL v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  if ((unint64_t)[v2 count] >= 0xA) {
    [*(id *)(*(void *)(a1 + 32) + 48) removeFirstObject];
  }
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  uint64_t v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 48);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v7;
    _os_log_impl(&dword_227320000, v6, OS_LOG_TYPE_DEBUG, "Storing temporarily %@", buf, 0xCu);
  }

  uint64_t result = os_log_shim_legacy_logging_enabled();
  if (result)
  {
    uint64_t result = _IDSShouldLog();
    if (result) {
      return _IDSLogV();
    }
  }
  return result;
}

void sub_227322F94(int8x16_t *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[2].i64[0];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_227320000, v2, OS_LOG_TYPE_DEFAULT, "Adding message hash %@ to the database", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_227323114;
  v6[3] = &unk_2647FF078;
  int8x16_t v5 = a1[2];
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  sub_2273219BC(v6);
}

uint64_t sub_227323114(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  sub_22732238C([*(id *)(a1 + 32) _currentLocalTime], *(void *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 48) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 48);
    *(void *)(v2 + 48) = 0;
  }
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v5;
    _os_log_impl(&dword_227320000, v4, OS_LOG_TYPE_DEBUG, "Updating local cache %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  sub_227321D94();
  return [*(id *)(a1 + 32) _setDatabaseCloseTimerOnIvarQueue];
}

void sub_227323308(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_227323388;
  v2[3] = &unk_2647FF078;
  BOOL v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  sub_2273219BC(v2);
}

uint64_t sub_227323388(uint64_t a1)
{
  sub_227322588([*(id *)(a1 + 32) _currentLocalTime], *(void *)(a1 + 40));
  sub_227321D94();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _setDatabaseCloseTimerOnIvarQueue];
}

void sub_227323484()
{
  id v0 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_227320000, v0, OS_LOG_TYPE_DEBUG, "Performing initial database housekeeping", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  BOOL v1 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_227320000, v1, OS_LOG_TYPE_DEBUG, "  => Setting cache size", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  sub_227321DF0(10);
  uint64_t v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_227320000, v2, OS_LOG_TYPE_DEBUG, "  => Invalidating caches", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  sub_227321D94();
}

void sub_227323778(uint64_t a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(double *)(v3 + 40) - Current + 600.0;
  if (v4 <= 0.0)
  {
    MEMORY[0x270F9A6D0](v3, sel_closeDatabase);
  }
  else
  {
    int64_t v5 = (uint64_t)(v4 * 1000000000.0);
    uint64_t v6 = *(NSObject **)(v3 + 32);
    dispatch_time_t v7 = dispatch_time(0, v5);
    dispatch_source_set_timer(v6, v7, 0x7FFFFFFFFFFFFFFFuLL, v5 / 10);
  }
}

void sub_227323940(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
  sub_227321B0C();
}

uint64_t sub_227323B20(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__runCleanup);
}

void sub_227323C40(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  sub_227322654([*(id *)(a1 + 32) _currentLocalTime]);
  uint64_t v2 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "_currentLocalTime"));
  uint64_t v3 = [v2 dateByAddingTimeInterval:-2592000.0];
  double v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_227320000, v4, OS_LOG_TYPE_DEBUG, "Removing messages older than %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v6 = v3;
    _IDSLogV();
  }
  objc_msgSend(v3, "timeIntervalSince1970", v6);
  sub_227322718((uint64_t)v5);
  sub_227321D94();
  [*(id *)(a1 + 32) _setDatabaseCloseTimerOnIvarQueue];
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

uint64_t CSDBCreateDirectoriesToPath()
{
  return MEMORY[0x270F23240]();
}

uint64_t CSDBCreateThreadedRecordStoreWithQOSClassAndLookAsideBufferConfig()
{
  return MEMORY[0x270F23250]();
}

uint64_t CSDBGetMobileUserDirectory()
{
  return MEMORY[0x270F23258]();
}

uint64_t CSDBGetMobileUserGID()
{
  return MEMORY[0x270F23260]();
}

uint64_t CSDBGetMobileUserUID()
{
  return MEMORY[0x270F23268]();
}

uint64_t CSDBPerformLocked()
{
  return MEMORY[0x270F23278]();
}

uint64_t CSDBPerformLockedSectionForRecordStore()
{
  return MEMORY[0x270F23290]();
}

uint64_t CSDBPerformLockedSectionForRecordStoreWithoutInitialize()
{
  return MEMORY[0x270F23298]();
}

uint64_t CSDBPerformUnlockedSectionForQueryForReading()
{
  return MEMORY[0x270F232A0]();
}

uint64_t CSDBPerformUnlockedSectionForQueryForWriting()
{
  return MEMORY[0x270F232A8]();
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

uint64_t CSDBSqliteConnectionPerformSQL()
{
  return MEMORY[0x270F232F8]();
}

uint64_t CSDBSqliteDatabaseSetVersion()
{
  return MEMORY[0x270F23308]();
}

uint64_t CSDBSqliteStatementInteger64ResultColumn()
{
  return MEMORY[0x270F23338]();
}

uint64_t CSDBSqliteStep()
{
  return MEMORY[0x270F23348]();
}

uint64_t CSDBThreadedRecordStoreEnsureDatabaseSetupWithProtection()
{
  return MEMORY[0x270F23350]();
}

uint64_t CSDBThreadedRecordStoreTeardownDatabase()
{
  return MEMORY[0x270F23360]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x270F3CEA8]();
}

uint64_t OSLogHandleForIDSCategory()
{
  return MEMORY[0x270F3CEF0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IDSLogV()
{
  return MEMORY[0x270F3CA80]();
}

uint64_t _IDSShouldLog()
{
  return MEMORY[0x270F3CA88]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}