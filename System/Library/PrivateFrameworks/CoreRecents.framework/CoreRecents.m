uint64_t sub_100004B3C(sqlite3 *a1, const char *a2, int (__cdecl *a3)(void *, int, char **, char **), void *a4, char **a5)
{
  char **v5;
  void *v6;
  int (__cdecl *v7)(void *, int, char **, char **);
  const char *v8;
  sqlite3 *v9;
  uint64_t result;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = a1;
  while (1)
  {
    result = sqlite3_exec(a1, a2, a3, a4, a5);
    if (result != 5) {
      break;
    }
    usleep(0x14u);
    a1 = v9;
    a2 = v8;
    a3 = v7;
    a4 = v6;
    a5 = v5;
  }
  return result;
}

void sub_1000050E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100005ABC(uint64_t a1, void *a2)
{
  id v27 = 0;
  id v4 = [*(id *)(a1 + 32) _whereClauseFromPredicate:*(void *)(a1 + 40) inDomains:*(void *)(a1 + 48) bindings:&v27 error:*(void *)(a1 + 72)];
  if (v4)
  {
    v5 = (sqlite3_stmt *)[a2 preparedStatementForPattern:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ %@", @"SELECT recents.ROWID,\n       recents.bundle_identifier,\n       recents.dates,\n       recents.display_name,\n       recents.sending_address,\n       recents.original_source,\n       recents.weight,\n       recents.group_kind,\n       contacts.ROWID,\n       contacts.kind,\n       contacts.display_name,\n       contacts.address\n  FROM recents\n  JOIN contacts ON contacts.recent_id = recents.ROWID\n", v4)];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = v27;
    id v7 = [v27 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v24;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8 * (void)v11) + 16))();
          v11 = (char *)v11 + 1;
        }
        while (v8 != v11);
        id v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
        v9 += (int)v11;
      }
      while (v8);
    }
    v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 80);
    uint64_t v14 = *(void *)(a1 + 88);
    v21[0] = xmmword_1000212E0;
    v21[1] = unk_1000212F0;
    v21[2] = xmmword_100021300;
    int v22 = 11;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [v12 copyContactRecentsFromStatement:v5 selectIndexes:v21 groupThreshold:v13 options:v14];
    sqlite3_reset(v5);
  }
  if ([*(id *)(a1 + 56) pageRange])
  {
    id v15 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "_cn_skip:", objc_msgSend(*(id *)(a1 + 56), "pageRange"));

    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [v15 copy];
  }
  [*(id *)(a1 + 56) pageRange];
  if (v16 != -1)
  {
    v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    [*(id *)(a1 + 56) pageRange];
    id v19 = objc_msgSend(v17, "_cn_take:", v18);

    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [v19 copy];
  }
  return v4 != 0;
}

void sub_100006008(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_100006954(uint64_t a1)
{
  return [*(id *)(a1 + 24) removeAllObjects];
}

id sub_100006960(uint64_t a1)
{
  if (qword_100034540 != -1) {
    dispatch_once(&qword_100034540, &stru_10002D3D8);
  }
  v2 = (void *)qword_100034538;
  return [v2 objectForKey:a1];
}

uint64_t sub_1000069C4(sqlite3_stmt *a1, int a2, void *a3)
{
  if (a3)
  {
    v5 = (const char *)[a3 UTF8String];
    return sqlite3_bind_text(a1, a2, v5, -1, 0);
  }
  else
  {
    return sqlite3_bind_null(a1, a2);
  }
}

uint64_t sub_100006A3C(uint64_t a1, sqlite3_stmt *a2, int a3)
{
  v5 = (const char *)[*(id *)(a1 + 32) UTF8String];
  return sqlite3_bind_text(a2, a3, v5, -1, 0);
}

uint64_t sub_100006A8C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

uint64_t sub_100006AA0(uint64_t a1, sqlite3_stmt *a2, int a3)
{
  return sub_1000069C4(a2, a3, *(void **)(a1 + 32));
}

uint64_t sub_100006AB4(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

void sub_100006E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007030()
{
}

void sub_100007068()
{
}

void sub_100007074()
{
  if (v0) {
    JUMPOUT(0x10000707CLL);
  }
  JUMPOUT(0x100007080);
}

void sub_1000078C0(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  os_unfair_lock_unlock(v2);
}

uint64_t sub_100007910(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  self;
  return self;
}

uint64_t sub_10000796C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  self;
  return self;
}

void sub_100007B44(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = objc_msgSend(v2, "objectEnumerator", 0);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_source_set_timer(*(dispatch_source_t *)(*((void *)&v8 + 1) + 8 * (void)v7), 0, 0xFFFFFFFFFFFFFFFFLL, 0);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void sub_100008050(id a1, NSError *a2)
{
  id v2 = a2;
  if (+[CNFoundationError isTimeoutError:"isTimeoutError:"]) {
    NSLog(@"failed to get account information after 10 seconds");
  }
  else {
    NSLog(@"Error loading Mail account information: %@", v2);
  }
}

uint64_t start()
{
  uint64_t v1 = objc_alloc_init(CRAgent);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000085A4;
  v5[3] = &unk_10002CA48;
  v5[4] = v1;
  id v2 = [v5 copy];
  sub_1000085C0(2u, v2);
  sub_1000085C0(0xFu, v2);
  global_queue = dispatch_get_global_queue(0, 0);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", global_queue, &stru_10002CAC8);
  [(CRAgent *)v1 start];
  [+[NSRunLoop mainRunLoop] run];
  return 1;
}

void sub_1000085A4(uint64_t a1)
{
}

void sub_1000085C0(unsigned int a1, void *a2)
{
  signal(a1, (void (__cdecl *)(int))1);
  id v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a1, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v4, a2);
  dispatch_resume(v4);
}

void sub_1000086E0(uint64_t a1)
{
  id v3 = [[CRProcessTransaction alloc] initWithDescription:@"com.apple.corerecents.launch"];
  *(void *)(*(void *)(a1 + 32) + 16) = [[_CRRecentsLibrary alloc] initWithPath:+[_CRRecentsLibrary defaultPath]];
  *(void *)(*(void *)(a1 + 32) + 40) = objc_alloc_init((Class)NSMutableSet);
  id v2 = +[CRPowerMonitor sharedMonitor];
  objc_msgSend(*(id *)(a1 + 32), "_adjustLibraryStoreSyncBehaviorWithLockedState:", objc_msgSend(v2, "isLocked"));
  [+[NSNotificationCenter defaultCenter] addObserver:*(void *)(a1 + 32) selector:"_lockStateChanged:" name:@"CRPowerMonitorDeviceWillLockNotification" object:v2];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
}

void sub_100008854(uint64_t a1, uint64_t a2)
{
}

void sub_100008864(uint64_t a1)
{
}

uint64_t sub_100008870(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  id v3 = [*(id *)(a1 + 40) object];
  id v4 = +[CRLogging log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    id v8 = v3;
    __int16 v9 = 2114;
    id v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Connection %p for %{public}@ was invalidated.", (uint8_t *)&v7, 0x16u);
  }
  id v5 = *(void **)(a1 + 48);
  objc_sync_enter(v5);
  [*(id *)(*(void *)(a1 + 48) + 40) removeObject:v2];
  return objc_sync_exit(v5);
}

void sub_100008964(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100008978(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  id v3 = [*(id *)(a1 + 40) object];
  id v4 = +[CRLogging log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    id v8 = v3;
    __int16 v9 = 2114;
    id v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Connection %p for %{public}@ was interrupted.", (uint8_t *)&v7, 0x16u);
  }
  id v5 = *(void **)(a1 + 48);
  objc_sync_enter(v5);
  [*(id *)(*(void *)(a1 + 48) + 40) removeObject:v2];
  return objc_sync_exit(v5);
}

void sub_100008A6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100008C88(uint64_t a1, int a2)
{
  id v4 = +[CRLogging log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received first-unlock notification", v6, 2u);
  }
  dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32), *(dispatch_block_t *)(a1 + 40));
  return notify_cancel(a2);
}

uint64_t sub_100008DB8()
{
  if (qword_1000344C0 != -1) {
    dispatch_once(&qword_1000344C0, &stru_10002CB80);
  }
  char v0 = (uint64_t (*)())dlsym((void *)qword_1000344B8, "MKBDeviceUnlockedSinceBoot");
  off_100034148 = v0;
  return v0();
}

void sub_100008E20(id a1)
{
  qword_1000344B8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 1);
  if (!qword_1000344B8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001A7AC();
  }
}

void sub_100008EC8(id a1)
{
  uint64_t v1 = +[NSFileManager defaultManager];
  qword_1000344C8 = (uint64_t)[objc_alloc((Class)NSString) initWithFormat:@"%@/Library/Recents", CPSharedResourcesDirectory()];
  if (![(NSFileManager *)v1 fileExistsAtPath:qword_1000344C8])
  {
    CPFileBuildDirectoriesToPath();
  }
}

id sub_100009258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _initializeStoreForRecentsDomain:a2 storeIdentifier:a3];
  id v5 = *(void **)(*(void *)(a1 + 32) + 96);
  return [v5 coordinateChangesInUbiquitousStoreForDomain:a2];
}

void sub_100009AD8(uint64_t a1, uint64_t a2)
{
}

void sub_100009AE8(uint64_t a1)
{
}

BOOL sub_100009B84(uint64_t a1, void *a2)
{
  id v4 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"SELECT recent_id, key, value FROM metadata WHERE recent_id IN (?");
  if (*(void *)(a1 + 48) >= 2uLL)
  {
    unint64_t v5 = 1;
    do
    {
      [(NSMutableString *)v4 appendString:@",?"];
      ++v5;
    }
    while (v5 < *(void *)(a1 + 48));
  }
  [(NSMutableString *)v4 appendString:@" ORDER BY recent_id"]);
  uint64_t v6 = (sqlite3_stmt *)[a2 preparedStatementForPattern:v4];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v7 = *(void **)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    int v9 = 0;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        sqlite3_bind_int64(v6, v9 + i + 1, (sqlite3_int64)[*(id *)(*((void *)&v26 + 1) + 8 * i) longLongValue]);
      }
      id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      v9 += (int)i;
    }
    while (v8);
  }
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3052000000;
  id v19 = sub_100009AD8;
  v20 = sub_100009AE8;
  uint64_t v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009E60;
  v15[3] = &unk_10002CC40;
  v15[4] = *(void *)(a1 + 32);
  v15[5] = &v22;
  v15[6] = &v16;
  id v12 = +[CRSQLRow enumerateRowsInStatement:v6 usingBlock:v15];
  if (v23[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:"));
    [v13 setMetadata:v17[5]];
  }
  if (v12 != 101) {
    [*(id *)(a1 + 40) _handleSQLiteErrorCode:v12];
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v12 == 101;
}

void sub_100009E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id sub_100009E60(uint64_t a1, void *a2)
{
  id v4 = objc_msgSend(objc_msgSend(a2, "numberWithIntegerAtIndex:", 0), "cr_CRRecentIDValue");
  if (v4 != *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = v4;
    objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:")), "setMetadata:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = +[NSMutableDictionary dictionary];
  }
  id v6 = [a2 stringAtIndex:1];
  id result = [a2 objectAtIndex:2];
  if (v6)
  {
    id v8 = result;
    if (result)
    {
      int v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      return [v9 setObject:v8 forKey:v6];
    }
  }
  return result;
}

void sub_10000A028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A040(uint64_t a1, void *a2)
{
  id v3 = (sqlite3_stmt *)objc_msgSend(a2, "preparedStatementForPattern:", +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"SELECT value FROM metadata WHERE recent_id = ? AND key = ?"));
  sqlite3_bind_int64(v3, 1, *(void *)(a1 + 48));
  sqlite3_bind_text(v3, 2, (const char *)[CRRecentContactMetadataUpcomingEventIdentifier UTF8String], -1, 0);
  while (1)
  {
    id v4 = sub_1000163B0((uint64_t)v3);
    if (v4 != 100) {
      break;
    }
    id v5 = +[CRSQLRow objectAtIndex:0 statement:v3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v5;
LABEL_6:
      uint64_t v6 = 1;
      goto LABEL_8;
    }
  }
  if ((v4 & 0xFFFFFFFE) == 0x64) {
    goto LABEL_6;
  }
  [*(id *)(a1 + 32) _handleSQLiteErrorCode:v4];
  uint64_t v6 = 0;
LABEL_8:
  sqlite3_reset(v3);
  return v6;
}

void sub_10000A150(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 72);
  v8[0] = *(_OWORD *)(a1 + 56);
  v8[1] = v4;
  v8[2] = *(_OWORD *)(a1 + 88);
  int v9 = *(_DWORD *)(a1 + 104);
  id v5 = [v2 copyRecentContactFromStatement:v3 columnIndexes:v8 populateMetadata:0];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v5, "recentID")));
    if (v7) {
      [v7 addObject:v6];
    }
    else {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v6), +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v6, "recentID")));
    }
  }
}

void sub_10000A23C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 count];
  id v6 = [a3 objectAtIndex:0];
  id v7 = [v6 groupKind];
  if (v7 == (id)2)
  {
    if ((unint64_t)v5 <= 1) {
      goto LABEL_28;
    }
LABEL_12:
    id v20 = v5;
    id v21 = v7;
    uint64_t v22 = v6;
    id v9 = +[NSMutableIndexSet indexSet];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v24;
      uint64_t v14 = (void *)CRAddressKindEmail;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(a3);
          }
          uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v14, "isEqualToString:", objc_msgSend(v16, "kind"))
            && objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(v16, "address")))
          {
            [v9 addIndex:(char *)i + v12];
          }
        }
        id v11 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
        v12 += (uint64_t)i;
      }
      while (v11);
    }
    if (v20 != [v9 count])
    {
      id v17 = v22;
      [a3 removeObjectsAtIndexes:v9];
      if ((unint64_t)[a3 count] < 2)
      {
        id v18 = 0;
      }
      else
      {
        id v18 = objc_msgSend(objc_alloc((Class)CRRecentContact), "initWithMembers:displayName:recentDate:recentsDomain:", a3, objc_msgSend(v22, "groupName"), 0, objc_msgSend(v22, "recentsDomain"));
        objc_msgSend(v18, "setRecentID:", objc_msgSend(v22, "recentID"));
        objc_msgSend(v18, "setRecentDates:", objc_msgSend(v22, "recentDates"));
        uint64_t v19 = v21 == (id)2 ? 2 : 1;
        [v18 setGroupKind:v19];
      }

      if (v18) {
        goto LABEL_30;
      }
    }
    return;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    if ((unint64_t)v5 < 2) {
      goto LABEL_28;
    }
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 65) && (unint64_t)v5 > 1)
  {
LABEL_9:
    unint64_t v8 = *(void *)(a1 + 56);
    if (v8 > (unint64_t)objc_msgSend(objc_msgSend(v6, "recentDates"), "count")
      && (!*(unsigned char *)(a1 + 65)
       || !objc_msgSend(*(id *)(a1 + 32), "upcomingEventIdentifierForRecentID:", objc_msgSend(v6, "recentID"))))
    {
      return;
    }
    goto LABEL_12;
  }
LABEL_28:
  if (v5 == (id)1)
  {
    id v18 = [a3 objectAtIndex:0];
    if (v18) {
LABEL_30:
    }
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v18, +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v18, "recentID")));
  }
}

void sub_10000A844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A85C(uint64_t a1, void *a2)
{
  int v16 = 11;
  long long v13 = xmmword_1000212E0;
  long long v14 = unk_1000212F0;
  long long v15 = xmmword_100021300;
  uint64_t v3 = (sqlite3_stmt *)[a2 preparedStatementForPattern:objc_msgSend(@"SELECT recents.ROWID,\n       recents.bundle_identifier,\n       recents.dates,\n       recents.display_name,\n       recents.sending_address,\n       recents.original_source,\n       recents.weight,\n       recents.group_kind,\n       contacts.ROWID,\n       contacts.kind,\n       contacts.display_name,\n       contacts.address\n  FROM recents\n  JOIN contacts ON contacts.recent_id = recents.ROWID\n", "stringByAppendingString:", @" WHERE recents.record_hash = :record_hash AND recents.bundle_identifier = :bundle_identifier"];
  sub_10000AA08(v3, ":record_hash", *(void **)(a1 + 32));
  sub_10000AA08(v3, ":bundle_identifier", *(void **)(a1 + 40));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000AA60;
  v10[3] = &unk_10002CD08;
  uint64_t v12 = v3;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v4 = +[CRSQLRow enumerateRowsInStatement:v3 usingBlock:v10];
  if (v4 == 101)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v5)
    {
      id v6 = *(void **)(a1 + 48);
      id v7 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v5 recentID]);
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v17 = v7;
      uint64_t v18 = v8;
      objc_msgSend(v6, "populateMetadataForRecents:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    }
  }
  else
  {
    [*(id *)(a1 + 48) _handleSQLiteErrorCode:v4];
  }
  return 1;
}

uint64_t sub_10000AA08(sqlite3_stmt *a1, const char *a2, void *a3)
{
  uint64_t result = sqlite3_bind_parameter_index(a1, a2);
  if ((int)result >= 1)
  {
    return sub_1000069C4(a1, result, a3);
  }
  return result;
}

void sub_10000AA60(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 72);
  v6[0] = *(_OWORD *)(a1 + 56);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 88);
  int v7 = *(_DWORD *)(a1 + 104);
  id v5 = [v2 copyRecentContactFromStatement:v3 columnIndexes:v6 populateMetadata:0];
  sub_10000AAD4((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
}

void sub_10000AAD4(id *a1, void *a2)
{
  id v4 = *a1;
  if (v4)
  {
    if ([v4 isGroup])
    {
      objc_msgSend(*a1, "setMembers:", objc_msgSend(objc_msgSend(*a1, "members"), "arrayByAddingObject:", a2));
    }
    else
    {
      id v6 = objc_alloc((Class)CRRecentContact);
      v8[0] = *a1;
      v8[1] = a2;
      id v7 = objc_msgSend(v6, "initWithMembers:displayName:recentDate:recentsDomain:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2), objc_msgSend(*a1, "groupName"), 0, objc_msgSend(*a1, "recentsDomain"));

      objc_msgSend(v7, "setRecentDates:", objc_msgSend(*a1, "recentDates"));
      objc_msgSend(v7, "setRecentID:", objc_msgSend(*a1, "recentID"));
      *a1 = v7;
    }
  }
  else
  {
    *a1 = a2;
  }
}

void sub_10000AD14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000AD2C(uint64_t a1, void *a2)
{
  int v15 = 11;
  long long v12 = xmmword_1000212E0;
  long long v13 = unk_1000212F0;
  long long v14 = xmmword_100021300;
  uint64_t v3 = (sqlite3_stmt *)[a2 preparedStatementForPattern:objc_msgSend(@"SELECT recents.ROWID,\n       recents.bundle_identifier,\n       recents.dates,\n       recents.display_name,\n       recents.sending_address,\n       recents.original_source,\n       recents.weight,\n       recents.group_kind,\n       contacts.ROWID,\n       contacts.kind,\n       contacts.display_name,\n       contacts.address\n  FROM recents\n  JOIN contacts ON contacts.recent_id = recents.ROWID\n", "stringByAppendingString:", @" WHERE recents.ROWID = :rowid"];
  sub_10000AEC4(v3, ":rowid", *(void *)(a1 + 48));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000AF1C;
  v9[3] = &unk_10002CD08;
  long long v11 = v3;
  long long v10 = *(_OWORD *)(a1 + 32);
  id v4 = +[CRSQLRow enumerateRowsInStatement:v3 usingBlock:v9];
  if (v4 == 101)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = +[NSNumber numberWithLongLong:*(void *)(a1 + 48)];
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v16 = v6;
      uint64_t v17 = v7;
      objc_msgSend(v5, "populateMetadataForRecents:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    }
  }
  else
  {
    [*(id *)(a1 + 32) _handleSQLiteErrorCode:v4];
  }
  sqlite3_reset(v3);
  return 1;
}

uint64_t sub_10000AEC4(sqlite3_stmt *a1, const char *a2, sqlite3_int64 a3)
{
  uint64_t result = sqlite3_bind_parameter_index(a1, a2);
  if ((int)result >= 1)
  {
    return sqlite3_bind_int64(a1, result, a3);
  }
  return result;
}

void sub_10000AF1C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 72);
  v6[0] = *(_OWORD *)(a1 + 56);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 88);
  int v7 = *(_DWORD *)(a1 + 104);
  id v5 = [v2 copyRecentContactFromStatement:v3 columnIndexes:v6 populateMetadata:0];
  sub_10000AAD4((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
}

uint64_t sub_10000B008(uint64_t a1, void *a2)
{
  uint64_t v3 = (sqlite3_stmt *)[a2 preparedStatementForPattern:objc_msgSend(@"SELECT recents.ROWID,\n       recents.bundle_identifier,\n       recents.dates,\n       recents.display_name,\n       recents.sending_address,\n       recents.original_source,\n       recents.weight,\n       recents.group_kind,\n       contacts.ROWID,\n       contacts.kind,\n       contacts.display_name,\n       contacts.address\n  FROM recents\n  JOIN contacts ON contacts.recent_id = recents.ROWID\n", "stringByAppendingString:", @" WHERE recents.bundle_identifier = :bundle_identifier"];
  sub_10000AA08(v3, ":bundle_identifier", *(void **)(a1 + 32));
  char v12 = 0;
  while (1)
  {
    id v4 = sub_1000163B0((uint64_t)v3);
    if (v4 != 100) {
      break;
    }
    id v6 = *(void **)(a1 + 40);
    v10[0] = xmmword_1000212E0;
    v10[1] = unk_1000212F0;
    v10[2] = xmmword_100021300;
    int v11 = 11;
    id v7 = [v6 copyRecentContactFromStatement:v3 columnIndexes:v10 populateMetadata:1];
    if (v7)
    {
      uint64_t v8 = v7;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    if (v12) {
      goto LABEL_9;
    }
  }
  if ((v4 - 102) <= 0xFFFFFFFD) {
    [*(id *)(a1 + 40) _handleSQLiteErrorCode:v4];
  }
LABEL_9:
  sqlite3_reset(v3);
  return 1;
}

void sub_10000B7B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL sub_10000B7CC(uint64_t a1, void *a2)
{
  uint64_t v3 = (sqlite3_stmt *)[a2 preparedStatementForPattern:@"SELECT value FROM properties WHERE key = :key"];
  sub_10000AA08(v3, ":key", *(void **)(a1 + 32));
  id v4 = sub_1000163B0((uint64_t)v3);
  int v5 = (int)v4;
  if (v4 == 100)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_column_int64(v3, 0);
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -1;
    if ((v4 - 102) <= 0xFFFFFFFD) {
      [*(id *)(a1 + 40) _handleSQLiteErrorCode:v4];
    }
  }
  sqlite3_reset(v3);
  return v5 == 100;
}

void sub_10000B92C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B944(uint64_t a1, void *a2)
{
  uint64_t v3 = (sqlite3_stmt *)[a2 preparedStatementForPattern:@"INSERT OR REPLACE INTO properties (key, value) VALUES (:key, :value)"];
  sub_10000AA08(v3, ":key", *(void **)(a1 + 32));
  sub_10000AEC4(v3, ":value", *(void *)(a1 + 56));
  id v4 = sub_1000163B0((uint64_t)v3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4 == 101;
  if ((v4 - 102) <= 0xFFFFFFFD) {
    [*(id *)(a1 + 40) _handleSQLiteErrorCode:v4];
  }
  sqlite3_reset(v3);
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

id sub_10000BEDC(uint64_t a1)
{
  id v2 = +[CRLogging log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "performing pending expunge for domain %{public}@", (uint8_t *)&v5, 0xCu);
  }
  id result = [*(id *)(a1 + 40) expungeRecentsOverLimitsForDomain:*(void *)(a1 + 32) forcibly:0 expungedRecentIDs:0];
  if (result) {
    return objc_msgSend(*(id *)(a1 + 40), "_synchronizeStore:", objc_msgSend(*(id *)(a1 + 40), "_storeForRecentsDomain:", *(void *)(a1 + 32)));
  }
  return result;
}

uint64_t sub_10000C17C(sqlite3_stmt *a1, const char *a2, void *a3)
{
  uint64_t result = sqlite3_bind_parameter_index(a1, a2);
  if ((int)result >= 1)
  {
    int v6 = result;
    [a3 timeIntervalSinceReferenceDate];
    return sqlite3_bind_int64(a1, v6, (uint64_t)((v7 + 978307200.0) * 1000.0));
  }
  return result;
}

void sub_10000C204(uint64_t a1, void *a2)
{
  id v4 = [a2 numberWithIntegerAtIndex:0];
  id v5 = [a2 stringAtIndex:1];
  unsigned int v6 = objc_msgSend(objc_msgSend(a2, "numberWithIntegerAtIndex:", 2), "intValue");
  uint64_t v7 = CRAddressKindGroup;
  if (v6 == 1) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = (void *)CRAddressKindGroup;
  }
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v4];
    id v9 = *(void **)(a1 + 40);
    if ([v8 isEqualToString:v7]) {
      long long v10 = @"GP_";
    }
    else {
      long long v10 = @"MR_";
    }
    id v11 = [(__CFString *)v10 stringByAppendingString:v5];
    [v9 addObject:v11];
  }
  else if (os_log_type_enabled((os_log_t)+[CRLogging log], OS_LOG_TYPE_ERROR))
  {
    sub_10001A9C0();
  }
}

void sub_10000C4E0(uint64_t a1, void *a2)
{
  id v4 = [a2 numberWithIntegerAtIndex:0];
  id v5 = [a2 stringAtIndex:1];
  if (v5)
  {
    id v6 = v5;
    [*(id *)(a1 + 32) addObject:v4];
    uint64_t v7 = *(void **)(a1 + 40);
    if ([0 isEqualToString:CRAddressKindGroup]) {
      uint64_t v8 = @"GP_";
    }
    else {
      uint64_t v8 = @"MR_";
    }
    id v9 = [(__CFString *)v8 stringByAppendingString:v6];
    [v7 addObject:v9];
  }
  else if (os_log_type_enabled((os_log_t)+[CRLogging log], OS_LOG_TYPE_ERROR))
  {
    sub_10001AA44();
  }
}

void sub_10000C790(uint64_t a1, void *a2)
{
  id v4 = [a2 numberWithIntegerAtIndex:0];
  id v5 = [a2 stringAtIndex:1];
  if (v5)
  {
    id v6 = v5;
    [*(id *)(a1 + 32) addObject:v4];
    uint64_t v7 = *(void **)(a1 + 40);
    if ([CRAddressKindGroup isEqualToString:CRAddressKindGroup]) {
      uint64_t v8 = @"GP_";
    }
    else {
      uint64_t v8 = @"MR_";
    }
    id v9 = [(__CFString *)v8 stringByAppendingString:v6];
    [v7 addObject:v9];
  }
  else if (os_log_type_enabled((os_log_t)+[CRLogging log], OS_LOG_TYPE_ERROR))
  {
    sub_10001AAAC();
  }
}

void sub_10000CA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CA74(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    *(void *)buf = 0;
    uint64_t result = (uint64_t)objc_msgSend(*(id *)(a1 + 40), "_nts_expungeRecentsOlderThanDate:domain:storeKeys:connection:", v4, *(void *)(a1 + 48), buf, a2);
    if (!result) {
      return result;
    }
    [*(id *)(a1 + 56) addObjectsFromArray:result];
    [*(id *)(a1 + 64) addObjectsFromArray:*(void *)buf];
  }
  *(void *)buf = 0;
  uint64_t result = (uint64_t)objc_msgSend(*(id *)(a1 + 40), "_nts_expungeGroupRecentsOverLimit:domain:storeKeys:connection:", *(void *)(a1 + 80), *(void *)(a1 + 48), buf, a2);
  if (result)
  {
    [*(id *)(a1 + 56) addObjectsFromArray:result];
    [*(id *)(a1 + 64) addObjectsFromArray:*(void *)buf];
    *(void *)buf = 0;
    uint64_t result = (uint64_t)objc_msgSend(*(id *)(a1 + 40), "_nts_expungeIndividualRecentsOverLimit:domain:storeKeys:connection:", *(void *)(a1 + 88), *(void *)(a1 + 48), buf, a2);
    if (result)
    {
      [*(id *)(a1 + 56) addObjectsFromArray:result];
      [*(id *)(a1 + 64) addObjectsFromArray:*(void *)buf];
      if ([*(id *)(a1 + 56) count])
      {
        id v6 = +[CRLogging log];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = [*(id *)(a1 + 56) count];
          uint64_t v8 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = v7;
          __int16 v27 = 2114;
          uint64_t v28 = v8;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Expunging %lu recents over limit for bundle identifier %{public}@", buf, 0x16u);
        }
        objc_msgSend(*(id *)(a1 + 40), "_deleteRecentsWithRecentIDs:storeKeys:recentsDomain:deleteInUbiquitousStore:", objc_msgSend(*(id *)(a1 + 56), "allObjects"), *(void *)(a1 + 64), *(void *)(a1 + 48), 1);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      }
      if (*(unsigned char *)(a1 + 96)
        && (id v9 = [*(id *)(a1 + 40) _storeForRecentsDomain:*(void *)(a1 + 48)]) != 0)
      {
        long long v10 = v9;
        id v11 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", objc_msgSend(objc_msgSend(v9, "dictionaryRepresentation"), "allKeys"));
        char v12 = (sqlite3_stmt *)[a2 preparedStatementForPattern:@"                    SELECT recents.record_hash, recents.count \n                    FROM recents \n                    WHERE recents.bundle_identifier = :bundle_identifier                 "];
        sub_10000AA08(v12, ":bundle_identifier", *(void **)(a1 + 48));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10000CE04;
        v24[3] = &unk_10002CE20;
        v24[4] = v11;
        id v13 = +[CRSQLRow enumerateRowsInStatement:v12 usingBlock:v24];
        BOOL v19 = (v13 & 0xFFFFFFFE) == 100;
        if ((v13 & 0xFFFFFFFE) == 0x64)
        {
          if ([v11 count])
          {
            long long v22 = 0u;
            long long v23 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            id v14 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
            if (v14)
            {
              id v15 = v14;
              uint64_t v16 = *(void *)v21;
              do
              {
                for (i = 0; i != v15; i = (char *)i + 1)
                {
                  if (*(void *)v21 != v16) {
                    objc_enumerationMutation(v11);
                  }
                  uint64_t v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
                  if (([v18 hasPrefix:@"GP_"] & 1) != 0
                    || [v18 hasPrefix:@"MR_"])
                  {
                    [v10 removeObjectForKey:v18];
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
                  }
                }
                id v15 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
              }
              while (v15);
            }
          }
        }
        else
        {
          [*(id *)(a1 + 40) _handleSQLiteErrorCode:v13];
        }

        return v19;
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

void sub_10000CE04(uint64_t a1, void *a2)
{
  id v4 = [a2 stringAtIndex:0];
  unsigned int v5 = objc_msgSend(objc_msgSend(a2, "numberWithIntegerAtIndex:", 0), "intValue");
  if (v4)
  {
    if (v5 == 1) {
      id v6 = 0;
    }
    else {
      id v6 = (void *)CRAddressKindGroup;
    }
    if (objc_msgSend(v6, "isEqualToString:")) {
      id v7 = @"GP_";
    }
    else {
      id v7 = @"MR_";
    }
    id v8 = [(__CFString *)v7 stringByAppendingString:v4];
    id v9 = *(void **)(a1 + 32);
    [v9 removeObject:v8];
  }
  else if (os_log_type_enabled((os_log_t)+[CRLogging log], OS_LOG_TYPE_ERROR))
  {
    sub_10001AB14();
  }
}

uint64_t sub_10000D304(uint64_t a1, void *a2)
{
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  id v4 = (sqlite3_stmt *)[a2 preparedStatementForPattern:@"INSERT INTO recents (display_name, bundle_identifier, original_source, dates, last_date, sending_address, count, weight, record_hash, group_kind)             VALUES (:display_name, :bundle_identifier, :original_source, :dates, :last_date, :sending_address, :count, :weight, :record_hash, :group_kind)"];
  unsigned int v5 = (sqlite3_stmt *)[a2 preparedStatementForPattern:@"INSERT INTO contacts (recent_id, display_name, kind, address)             VALUES (:recent_id, :display_name, :kind, :address)"];
  id v6 = (sqlite3_stmt *)[a2 preparedStatementForPattern:@"INSERT INTO metadata (recent_id, key, value) VALUES (:recent_id, :key, :value)"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v30 = a2;
  id obj = *(id *)(a1 + 32);
  id v7 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v34;
    id v29 = (id)CRAddressKindGroup;
    *(void *)&long long v8 = 136315138;
    long long v28 = v8;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v10);
        id insert_rowid = objc_msgSend(v11, "recentID", v28);
        [*(id *)(a1 + 40) _bindRecent:v11 forStatement:v4];
        if ([v11 members]) {
          sqlite3_int64 v13 = (sqlite3_int64)objc_msgSend(objc_msgSend(v11, "members"), "count");
        }
        else {
          sqlite3_int64 v13 = 1;
        }
        sub_10000AEC4(v4, ":count", v13);
        BOOL v14 = sub_1000163B0((uint64_t)v4) != 101 || *((unsigned char *)v38 + 24) == 0;
        char v15 = !v14;
        *((unsigned char *)v38 + 24) = v15;
        if (v14)
        {
          BOOL v19 = +[CRLogging log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            long long v24 = sqlite3_errmsg((sqlite3 *)[v30 db]);
            *(_DWORD *)buf = v28;
            v42 = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "**** SQLITE ERROR: %s", buf, 0xCu);
          }
        }
        else
        {
          id insert_rowid = (id)sqlite3_last_insert_rowid((sqlite3 *)[v30 db]);
          if (v29 == [v11 kind])
          {
            id v20 = objc_msgSend(objc_msgSend(v11, "members"), "objectEnumerator");
            while (1)
            {
              id v21 = [v20 nextObject];
              if (!v21 || !*((unsigned char *)v38 + 24)) {
                break;
              }
              [*(id *)(a1 + 40) _bindContact:v21 withRecentID:insert_rowid forStatement:v5];
              BOOL v23 = sub_1000163B0((uint64_t)v5) == 101 && *((unsigned char *)v38 + 24) != 0;
              *((unsigned char *)v38 + 24) = v23;
              sqlite3_reset(v5);
            }
          }
          else
          {
            [*(id *)(a1 + 40) _bindContact:v11 withRecentID:insert_rowid forStatement:v5];
            BOOL v17 = sub_1000163B0((uint64_t)v5) == 101 && *((unsigned char *)v38 + 24) != 0;
            *((unsigned char *)v38 + 24) = v17;
          }
          id v18 = [v11 metadata];
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_10000D700;
          v32[3] = &unk_10002CE70;
          v32[5] = v6;
          v32[6] = insert_rowid;
          v32[4] = &v37;
          [v18 enumerateKeysAndObjectsUsingBlock:v32];
        }
        if (insert_rowid != (id)0x7FFFFFFFFFFFFFFFLL) {
          [v11 setRecentID:insert_rowid];
        }
        sqlite3_reset(v5);
        sqlite3_reset(v4);
        sqlite3_reset(v6);
        long long v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      id v25 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      id v7 = v25;
    }
    while (v25);
  }
  uint64_t v26 = *((unsigned __int8 *)v38 + 24);
  _Block_object_dispose(&v37, 8);
  return v26;
}

void sub_10000D6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_10000D700(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  sub_10000D76C(*(sqlite3_stmt **)(a1 + 40), a2, a3, *(void *)(a1 + 48));
  BOOL v8 = sub_1000163B0(*(void *)(a1 + 40)) == 101;
  id v6 = *(sqlite3_stmt **)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = !v8 || *(unsigned char *)(v7 + 24) == 0;
  char v9 = !v8;
  *(unsigned char *)(v7 + 24) = v9;
  uint64_t result = sqlite3_reset(v6);
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

uint64_t sub_10000D76C(sqlite3_stmt *a1, void *a2, uint64_t a3, sqlite3_int64 a4)
{
  sub_10000AEC4(a1, ":recent_id", a4);
  sub_10000AA08(a1, ":key", a2);
  uint64_t v7 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:200 options:0 error:0];
  uint64_t result = sqlite3_bind_parameter_index(a1, ":value");
  if ((int)result >= 1)
  {
    int v9 = result;
    if (v7)
    {
      id v10 = [(NSData *)v7 bytes];
      NSUInteger v11 = [(NSData *)v7 length];
      if (v11 >= 0x7FFFFFFF) {
        [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void _bindData(sqlite3_stmt *, const char *, NSData *)"] file:@"_CRRecentsLibrary.m" lineNumber:706 description:@"data length is more than INT_MAX"];
      }
      return sqlite3_bind_blob(a1, v9, v10, v11, 0);
    }
    else
    {
      return sqlite3_bind_null(a1, result);
    }
  }
  return result;
}

uint64_t sub_10000D944(uint64_t a1, void *a2)
{
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  id v4 = (sqlite3_stmt *)[a2 preparedStatementForPattern:@"            UPDATE contacts             SET display_name = :display_name             WHERE ROWID = :recent_id         "];
  unsigned int v5 = (sqlite3_stmt *)[a2 preparedStatementForPattern:@"            UPDATE recents             SET                 weight = COALESCE(MAX(weight, :weight), weight, :weight), display_name    = :display_name, dates           = :dates, last_date       = :last_date, sending_address = :sending_address, group_kind      = :group_kind             WHERE ROWID = :recent_id         "];
  id v6 = (sqlite3_stmt *)[a2 preparedStatementForPattern:@"INSERT OR REPLACE INTO metadata (recent_id, key, value) VALUES (:recent_id, :key, :value)"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 32);
  id v7 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = [v10 contactID];
        id v12 = [v10 recentID];
        [*(id *)(a1 + 40) _bindContact:v10 withRecentID:v11 forStatement:v4];
        BOOL v13 = sub_1000163B0((uint64_t)v4) != 101 || *((unsigned char *)v27 + 24) == 0;
        char v14 = !v13;
        *((unsigned char *)v27 + 24) = v14;
        if (!v13)
        {
          [*(id *)(a1 + 40) _bindRecent:v10 forStatement:v5];
          sub_10000AEC4(v5, ":recent_id", (sqlite3_int64)v12);
          BOOL v15 = sub_1000163B0((uint64_t)v5) != 101 || *((unsigned char *)v27 + 24) == 0;
          char v16 = !v15;
          *((unsigned char *)v27 + 24) = v16;
          if (!v15)
          {
            id v17 = [v10 metadata];
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_10000DC04;
            _OWORD v21[3] = &unk_10002CE70;
            v21[5] = v6;
            v21[6] = v12;
            v21[4] = &v26;
            [v17 enumerateKeysAndObjectsUsingBlock:v21];
          }
        }
        sqlite3_reset(v5);
        sqlite3_reset(v4);
        sqlite3_reset(v6);
      }
      id v7 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v7);
  }
  uint64_t v18 = *((unsigned __int8 *)v27 + 24);
  _Block_object_dispose(&v26, 8);
  return v18;
}

void sub_10000DBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_10000DC04(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  sub_10000D76C(*(sqlite3_stmt **)(a1 + 40), a2, a3, *(void *)(a1 + 48));
  BOOL v8 = sub_1000163B0(*(void *)(a1 + 40)) == 101;
  id v6 = *(sqlite3_stmt **)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = !v8 || *(unsigned char *)(v7 + 24) == 0;
  char v9 = !v8;
  *(unsigned char *)(v7 + 24) = v9;
  uint64_t result = sqlite3_reset(v6);
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

uint64_t sub_10000DE50(id *a1)
{
  if ([a1[4] count]) {
    [a1[5] _insertRecentContacts:a1[4]];
  }
  if ([a1[6] count]) {
    [a1[5] _updateRecentContacts:a1[6]];
  }
  return 1;
}

BOOL sub_10000E0A4(uint64_t a1, void *a2)
{
  uint64_t v3 = (sqlite3_stmt *)[a2 preparedStatementForPattern:@"DELETE FROM recents WHERE recents.record_hash = :record_hash AND recents.bundle_identifier = :bundle_identifier"];
  sub_10000AA08(v3, ":record_hash", *(void **)(a1 + 32));
  sub_10000AA08(v3, ":bundle_identifier", *(void **)(a1 + 40));
  BOOL v4 = sub_1000163B0((uint64_t)v3) == 101;
  sqlite3_reset(v3);
  return v4;
}

BOOL sub_10000E374(uint64_t a1, void *a2)
{
  uint64_t v3 = (sqlite3_stmt *)[a2 preparedStatementForPattern:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"            DELETE FROM recents \n            WHERE recents.ROWID IN (%@) \n            AND recents.bundle_identifier = :bundle_identifier         ", objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", @","];
  sub_10000AA08(v3, ":bundle_identifier", *(void **)(a1 + 40));
  BOOL v4 = sub_1000163B0((uint64_t)v3) == 101;
  sqlite3_reset(v3);
  return v4;
}

id sub_10000EEC0(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) objectForKey:a2];
  if (!result)
  {
    id v5 = [*(id *)(a1 + 40) _copyRecentContactForRecordHash:a2 recentsDomain:*(void *)(a1 + 48)];
    return v5;
  }
  return result;
}

id sub_10000EF1C(uint64_t a1, void *a2, void *a3)
{
  if ([a3 length]) {
    [*(id *)(a1 + 32) setDisplayName:a3];
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(a2, "setMetadata:");
  }
  [a2 applyWeight:*(void *)(a1 + 48)];
  [a2 recordRecentEventForDate:*(void *)(a1 + 56) userInitiated:*(unsigned __int8 *)(a1 + 80)];
  id v6 = [*(id *)(a1 + 64) hashForContact:a2];
  uint64_t v7 = *(void **)(a1 + 72);
  return [v7 setObject:a2 forKey:v6];
}

CFStringRef sub_10000F390(uint64_t a1, void *a2)
{
  CFStringRef result = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "recentsHashForExternalAddress:kind:", objc_msgSend(a2, "address"), objc_msgSend(a2, "kind"));
  if (!result) {
    return &stru_10002D980;
  }
  return result;
}

void sub_10000F66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F684(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a3)
  {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

NSNull *sub_10000FF34(uint64_t a1, void *a2, NSNull *a3)
{
  if (([a2 hasPrefix:@"MR_"] & 1) != 0
    || [a2 hasPrefix:@"GP_"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (CFStringRef result = +[NSNull null], result == a3))
    {
      if (+[NSNull null] != a3
        || (CFStringRef result = +[NSNull null], result == a3) && !*(unsigned char *)(a1 + 56))
      {
        uint64_t v7 = *(void **)(a1 + 32);
        return (NSNull *)[v7 setObject:a3 forKey:a2];
      }
    }
  }
  else
  {
    CFStringRef result = (NSNull *)[a2 isEqualToString:@"MAX_RECENTS"];
    if (result)
    {
      objc_opt_class();
      CFStringRef result = (NSNull *)objc_opt_isKindOfClass();
      if (result)
      {
        id v8 = [(NSNull *)a3 objectForKey:@"m"];
        CFStringRef result = (NSNull *)objc_opt_respondsToSelector();
        if (result)
        {
          id v9 = [v8 unsignedIntegerValue];
          id v10 = *(void **)(a1 + 40);
          uint64_t v11 = *(void *)(a1 + 48);
          return (NSNull *)[v10 setMaximumRecents:v9 forRecentsDomain:v11];
        }
      }
    }
  }
  return result;
}

id sub_100010094(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) keyForContact:a2];
  if (result)
  {
    id result = [*(id *)(a1 + 40) objectForKey:result];
    if (!result)
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 48);
      return [v5 _syncContact:a2 withStore:v6];
    }
  }
  return result;
}

uint64_t sub_100010238(uint64_t a1, void *a2, NSNull *a3)
{
  NSPushAutoreleasePool();
  id v5 = [a2 substringFromIndex:3];
  if (+[NSNull null] == a3)
  {
    id v8 = +[CRLogging log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = a2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Recent with hash '%{public}@' was removed from the cloud store, removing from local store", buf, 0xCu);
    }
    if ([a2 hasPrefix:@"GP_"]) {
      uint64_t v9 = CRAddressKindGroup;
    }
    else {
      uint64_t v9 = 0;
    }
    [*(id *)(a1 + 32) _deleteRecentWithRecordHash:v5 kind:v9 recentsDomain:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [(NSNull *)a3 objectForKey:@"k"];
    if (v6)
    {
      v64[0] = @"e";
      v64[1] = @"p";
      *(void *)buf = CRAddressKindEmail;
      *(void *)&buf[8] = CRAddressKindPhoneNumber;
      v64[2] = @"i";
      v64[3] = @"m";
      *(void *)&buf[16] = CRAddressKindInstantMessage;
      v66 = (NSNull *)CRAddressKindMapLocation;
      v64[4] = @"u";
      v64[5] = @"gr";
      uint64_t v67 = CRAddressKindURL;
      uint64_t v68 = CRAddressKindGroup;
      id v7 = [+[NSDictionary dictionaryWithObjects:buf forKeys:v64 count:6] objectForKey:v6];
    }
    else
    {
      id v7 = (id)CRAddressKindEmail;
    }
    id v10 = [(NSNull *)a3 objectForKey:@"a"];
    id v11 = [(NSNull *)a3 objectForKey:@"S"];
    id v12 = [(NSNull *)a3 objectForKey:@"mrs"];
    if ((unint64_t)[v12 count] < 2)
    {
      id v20 = [*(id *)(a1 + 32) recentsHashForExternalAddress:v10 kind:v7];
      if (v20) {
        goto LABEL_29;
      }
      if (![CRAddressKindGroup isEqualToString:v7])
      {
        id v20 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      id v48 = v10;
      v50 = a3;
      id obj = v7;
      BOOL v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v14 = [v12 countByEnumeratingWithState:&v57 objects:v63 count:16];
      if (v14)
      {
        id v15 = v14;
        id v45 = v5;
        v46 = a2;
        uint64_t v16 = *(void *)v58;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v58 != v16) {
              objc_enumerationMutation(v12);
            }
            id v18 = objc_msgSend(*(id *)(a1 + 32), "recentsHashForExternalAddress:kind:", objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * i), "objectForKeyedSubscript:", @"a"), objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * i), "objectForKeyedSubscript:", @"k", v45, v46));
            if ([(NSMutableArray *)v13 containsObject:v18])
            {
              char v19 = 0;
              goto LABEL_25;
            }
            -[NSMutableArray insertObject:atIndex:](v13, "insertObject:atIndex:", v18, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](v13, "indexOfObject:inSortedRange:options:usingComparator:", v18, 0, [(NSMutableArray *)v13 count], 1024, &stru_10002CFF0));
          }
          id v15 = [v12 countByEnumeratingWithState:&v57 objects:v63 count:16];
          if (v15) {
            continue;
          }
          break;
        }
        char v19 = 1;
LABEL_25:
        id v5 = v45;
        a2 = v46;
      }
      else
      {
        char v19 = 1;
      }
      id v21 = objc_msgSend(objc_msgSend(-[NSMutableArray componentsJoinedByString:](v13, "componentsJoinedByString:", &stru_10002D980), "dataUsingEncoding:", 4), "cr_md5DigestHexString");
      a3 = v50;
      if (v19)
      {
        id v20 = v21;
        id v7 = obj;
        id v10 = v48;
LABEL_29:
        if ([v5 isEqualToString:v20])
        {
          id v22 = [*(id *)(a1 + 32) _copyRecentContactForRecordHash:v20 recentsDomain:*(void *)(a1 + 40)];
          if (!v22)
          {
            if ((unint64_t)[v12 count] < 2)
            {
              id v22 = [objc_alloc((Class)CRRecentContact) initWithAddress:v10 displayName:0 kind:v7 recentDate:0 recentsDomain:*(void *)(a1 + 40)];
            }
            else
            {
              id v47 = v11;
              id v49 = [(NSNull *)a3 objectForKey:@"gK"];
              long long v23 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
              long long v53 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              id v24 = [v12 countByEnumeratingWithState:&v53 objects:v62 count:16];
              if (v24)
              {
                id v25 = v24;
                uint64_t v26 = *(void *)v54;
                do
                {
                  for (j = 0; j != v25; j = (char *)j + 1)
                  {
                    if (*(void *)v54 != v26) {
                      objc_enumerationMutation(v12);
                    }
                    id v28 = objc_msgSend(objc_alloc((Class)CRRecentContact), "initWithAddress:displayName:kind:recentDate:recentsDomain:", objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)j), "objectForKeyedSubscript:", @"a"), objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)j), "objectForKeyedSubscript:", @"n"), objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)j), "objectForKeyedSubscript:", @"k"), 0, *(void *)(a1 + 40));
                    [(NSMutableArray *)v23 addObject:v28];
                  }
                  id v25 = [v12 countByEnumeratingWithState:&v53 objects:v62 count:16];
                }
                while (v25);
              }
              id v22 = [objc_alloc((Class)CRRecentContact) initWithMembers:v23 displayName:0 recentDate:0 recentsDomain:*(void *)(a1 + 40)];
              objc_msgSend(v22, "setGroupKind:", objc_msgSend(v49, "unsignedIntegerValue"));
              id v11 = v47;
            }
          }
          if (v11) {
            [v22 setOriginalSource:v11];
          }
          id v31 = [v22 recentDates];
          id v32 = objc_msgSend(objc_msgSend(-[NSNull objectForKey:](a3, "objectForKey:", @"t"), "_cn_filter:", &stru_10002D158), "sortedArrayUsingComparator:", &stru_10002D198);
          long long v33 = (NSDate *)[v31 firstObject];
          if (!v33) {
            long long v33 = +[NSDate distantPast];
          }
          long long v34 = (NSDate *)[v32 firstObject];
          if (!v34) {
            long long v34 = +[NSDate distantPast];
          }
          long long v35 = +[CRLogging log];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "-- Most recent date (local): '%{public}@'", buf, 0xCu);
          }
          long long v36 = +[CRLogging log];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v34;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "-- Most recent date (remote): '%{public}@'", buf, 0xCu);
          }
          if ((id)[(NSDate *)v33 compare:v34] == (id)1)
          {
            uint64_t v37 = +[CRLogging log];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Based on timestamp analysis, there may be local changes that have not been synced to the server. Applying conflict resolution policy server wins.", buf, 2u);
            }
          }
          if ([v32 count])
          {
            [v22 setRecentDates:v32];
            objc_msgSend(v22, "setDisplayName:", -[NSNull objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", @"n"));
            objc_msgSend(v22, "setLastSendingAddress:", -[NSNull objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", @"s"));
            objc_msgSend(v22, "setMetadata:", -[NSNull objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", @"m"));
            objc_msgSend(v22, "setGroupKind:", objc_msgSend(-[NSNull objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", @"gK"), "unsignedIntegerValue"));
            objc_msgSend(v22, "applyWeight:", -[NSNull objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", @"w"));
            if (objc_msgSend(objc_msgSend(v22, "address"), "isEqualToString:", objc_msgSend(v22, "displayName")))
            {
              v38 = +[CRLogging log];
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                id v39 = [v22 sanitizedDescription];
                id v40 = [v22 displayName];
                *(_DWORD *)buf = 138543619;
                *(void *)&uint8_t buf[4] = v39;
                *(_WORD *)&unsigned char buf[12] = 2113;
                *(void *)&buf[14] = v40;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "MERGE: Skipping display name for %{public}@ %{private}@", buf, 0x16u);
              }
              [v22 setDisplayName:0];
            }
            v41 = *(void **)(a1 + 32);
            id v61 = v22;
            objc_msgSend(v41, "_saveRecentContacts:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v61, 1));
          }
          else
          {
            v42 = +[CRLogging log];
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              id v43 = [v22 sanitizedDescription];
              *(_DWORD *)buf = 138543875;
              *(void *)&uint8_t buf[4] = v43;
              *(_WORD *)&unsigned char buf[12] = 2113;
              *(void *)&buf[14] = v22;
              *(_WORD *)&buf[22] = 2113;
              v66 = a3;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "MERGE: Skipping merging contact %{public}@ %{private}@ because we saw no dates %{private}@", buf, 0x20u);
            }
          }
        }
        else
        {
          v30 = +[CRLogging log];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543875;
            *(void *)&uint8_t buf[4] = v5;
            *(_WORD *)&unsigned char buf[12] = 2114;
            *(void *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2113;
            v66 = a3;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "calculated hash doesn't match reference key: %{public}@ != %{public}@, %{private}@", buf, 0x20u);
          }
        }
        return NSPopAutoreleasePool();
      }
    }
    char v29 = +[CRLogging log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      *(void *)&uint8_t buf[4] = a2;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = a3;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "removing corrupted recent group %{private}@: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 48) removeObjectForKey:a2];
  }
  return NSPopAutoreleasePool();
}

int64_t sub_100010C90(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 compare:a3];
}

id *sub_1000116E8(id *result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    return (id *)[result[4] setObject:a2 forKey:a3];
  }
  return result;
}

id sub_10001183C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _synchronizeStore:*(void *)(a1 + 40)];
}

void sub_100011A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100011AB8(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_synchronizeStore:");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = (char)result;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  return result;
}

id sub_100011C94(id a1, CRRecentContact *a2)
{
  id v2 = [(CRRecentContact *)a2 recentID];
  return +[NSNumber numberWithLongLong:v2];
}

void sub_100011EE0(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  id v6 = NSUbiquitousKeyValueStoreChangeReasonKey;
  id v7 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  char v4 = *(void **)(*(void *)(a1 + 32) + 88);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011FE4;
  v5[3] = &unk_10002D0D0;
  v5[4] = v3;
  void v5[5] = v2;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

id sub_100011FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = +[NSNotification notificationWithName:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:a3 userInfo:*(void *)(a1 + 32)];
  id v5 = *(void **)(a1 + 40);
  return [v5 postNotification:v4];
}

int64_t sub_10001206C(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 compare:a3];
}

BOOL sub_100012074(id a1, id a2)
{
  return objc_opt_isKindOfClass() & 1;
}

int64_t sub_1000120B0(id a1, NSDate *a2, NSDate *a3)
{
  return [(NSDate *)a3 compare:a2];
}

void sub_1000120C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100012708(sqlite3 *db)
{
  ppStmt = 0;
  do
    int v2 = sqlite3_prepare_v2(db, "SELECT value FROM properties WHERE key = 'version'", -1, &ppStmt, 0);
  while ((v2 - 7) > 0xFFFFFFFD);
  if (v2) {
    return 0;
  }
  if (sub_1000163B0((uint64_t)ppStmt) == 100) {
    uint64_t v3 = sqlite3_column_int(ppStmt, 0);
  }
  else {
    uint64_t v3 = 0;
  }
  sqlite3_finalize(ppStmt);
  return v3;
}

void sub_1000127A0(sqlite3 *a1, uint64_t a2)
{
  uint64_t v4 = sqlite3_errcode(a1);
  if ((v4 - 100) >= 2 && v4 != 0)
  {
    uint64_t v6 = v4;
    id v7 = sqlite3_errmsg(a1);
    NSLog(@"Error %d %@: %s", v6, a2, v7);
  }
}

uint64_t sub_100012808(sqlite3 *a1)
{
  int v2 = [+[NSBundle bundleForClass:objc_opt_class()] URLForResource:@"recents" withExtension:@"sql"];
  uint64_t v5 = 0;
  uint64_t v3 = +[NSString stringWithContentsOfURL:v2 encoding:4 error:&v5];
  if (v3)
  {
    if (sub_100013888(a1, v3)) {
      return 1;
    }
    sub_1000127A0(a1, (uint64_t)+[NSString stringWithFormat:@"executing SQL from file: %@", v2]);
  }
  else
  {
    NSLog(@"Error loading SQL: %@", v5);
  }
  return 0;
}

BOOL sub_1000128E4(sqlite3 *a1)
{
  ppStmt = 0;
  BOOL v3 = sqlite3_prepare_v2(a1, "ALTER TABLE recents ADD COLUMN address_hash TEXT;", -1, &ppStmt, 0) == 0;
  BOOL v2 = v3;
  BOOL v3 = !v3 || ppStmt == 0;
  if (!v3)
  {
    BOOL v2 = sub_1000163B0((uint64_t)ppStmt) == 101;
    sub_1000127A0(a1, @"adding address_hash to recents table");
    sqlite3_finalize(ppStmt);
  }
  return v2;
}

BOOL sub_100012964(sqlite3 *a1)
{
  int v2 = sqlite3_exec(a1, "DROP INDEX IF EXISTS recents_last_name; DROP INDEX IF EXISTS recents_first_name; ALTER TABLE recents ADD COLUMN"
         " display_name TEXT;",
         0,
         0,
         0);
  sub_1000127A0(a1, @"dropping indexes, adding display name columns");
  if (v2) {
    return 0;
  }
  ppStmt = 0;
  int v4 = sqlite3_prepare_v2(a1, "UPDATE recents SET display_name = NULLIF(IFNULL(first_name, '') || ' ' || IFNULL(last_name, ''), ' '), last_name = NULL, middle_name = NULL, first_name = NULL, suffix = NULL;",
         -1,
         &ppStmt,
         0);
  BOOL v3 = v4 == 0;
  if (!v4 && ppStmt)
  {
    BOOL v3 = sub_1000163B0((uint64_t)ppStmt) == 101;
    sub_1000127A0(a1, @"updating recents with display names");
    sqlite3_finalize(ppStmt);
  }
  return v3;
}

BOOL sub_100012A20(sqlite3 *a1)
{
  BOOL v2 = sqlite3_exec(a1, "ALTER TABLE recents ADD COLUMN sending_address TEXT;", 0, 0, 0) == 0;
  sub_1000127A0(a1, @"adding sending address column");
  return v2;
}

BOOL sub_100012A74(sqlite3 *a1)
{
  int v2 = sqlite3_exec(a1, "DROP TABLE IF EXISTS new_recents;\n"
         "CREATE TABLE new_recents (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,\n"
         "\tdisplay_name TEXT,\n"
         "\tbundle_identifier TEXT,\n"
         "\tproperty INTEGER,\n"
         "\taddress TEXT,\n"
         "\taddress_hash TEXT,\n"
         "\tsending_address TEXT,\n"
         "\tdates TEXT NOT NULL,\n"
         "\tlast_date INTEGER,\n"
         "\tUNIQUE (bundle_identifier, address_hash)\n"
         ");INSERT INTO new_recents (bundle_identifier, display_name, property, address, address_hash, sending_address, d"
         "ates, last_date)SELECT 'com.apple.mobilemail', display_name, property, address, address_hash, sending_address, "
         "dates, last_date FROM recents;DROP TABLE recents; ALTER TABLE new_recents RENAME TO recents;",
         0,
         0,
         0);
  sub_1000127A0(a1, @"migrating data to recents table with new contraints");
  if (v2) {
    return 0;
  }
  BOOL v3 = sqlite3_exec(a1, "CREATE INDEX recents_address_hash ON recents(bundle_identifier, address_hash, property);CREATE INDEX recents_ex"
         "punge ON recents(bundle_identifier, last_date DESC);",
         0,
         0,
         0) == 0;
  sub_1000127A0(a1, @"adding new index");
  return v3;
}

BOOL sub_100012B04(sqlite3 *a1, void *pApp)
{
  int v2 = a1;
  function_int v2 = sqlite3_create_function_v2(a1, "_migration_hash", 2, 1, pApp, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_100013C14, 0, 0, 0);
  sub_1000127A0(v2, @"registering hash function");
  if (function_v2) {
    return 0;
  }
  int v4 = sqlite3_exec(v2, "DROP TABLE IF EXISTS new_recents;\n"
         "CREATE TABLE new_recents (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,\n"
         "\tdisplay_name TEXT,\n"
         "\tbundle_identifier TEXT,\n"
         "\tkind TEXT,\n"
         "\taddress TEXT,\n"
         "\taddress_hash TEXT NOT NULL,\n"
         "\tsending_address TEXT,\n"
         "\tdates TEXT NOT NULL,\n"
         "\tlast_date INTEGER,\n"
         "\tUNIQUE (bundle_identifier, address_hash)\n"
         ");",
         0,
         0,
         0);
  sub_1000127A0(v2, @"creating new_recents table with new constraints");
  if (v4) {
    return 0;
  }
  id v30 = objc_alloc_init((Class)NSMutableDictionary);
  ppStmt = 0;
  sqlite3_prepare_v2(v2, "SELECT bundle_identifier, display_name, CASE WHEN property = 4 THEN 'email' WHEN property = 3 THEN 'phone' END, address, _migration_hash(CASE WHEN property = 4 THEN 'email' WHEN property = 3 THEN 'phone' END, address), sending_address, dates, last_date FROM recents;",
    -1,
    &ppStmt,
    0);
  if (!ppStmt) {
    goto LABEL_31;
  }
  unsigned int v5 = sub_1000163B0((uint64_t)ppStmt);
  if (v5 == 100)
  {
    id v28 = v2;
    do
    {
      uint64_t v6 = sqlite3_column_text(ppStmt, 0);
      id v7 = sqlite3_column_text(ppStmt, 1);
      id v8 = sqlite3_column_text(ppStmt, 2);
      uint64_t v9 = sqlite3_column_text(ppStmt, 3);
      id v10 = sqlite3_column_text(ppStmt, 4);
      id v11 = sqlite3_column_text(ppStmt, 5);
      id v12 = sqlite3_column_text(ppStmt, 6);
      sqlite3_int64 v13 = sqlite3_column_int64(ppStmt, 7);
      if (v6)
      {
        if (v8)
        {
          if (v9)
          {
            if (v10)
            {
              if (v12)
              {
                sqlite3_int64 v14 = v13;
                if (v13)
                {
                  id v31 = +[NSString stringWithFormat:@"%s-%s", v6, v10];
                  id v15 = objc_alloc_init((Class)NSMutableDictionary);
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6), @"bundle_identifier");
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8), @"kind");
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9), @"address");
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10), @"address_hash");
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12), @"dates");
                  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v14), @"last_date");
                  if (v7) {
                    objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7), @"display_name");
                  }
                  if (v11) {
                    objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11), @"sending_address");
                  }
                  [v30 setObject:v15 forKeyedSubscript:v31];
                }
              }
            }
          }
        }
      }
      unsigned int v16 = sub_1000163B0((uint64_t)ppStmt);
    }
    while (v16 == 100);
    unsigned int v5 = v16;
    int v2 = v28;
  }
  sqlite3_finalize(ppStmt);
  ppStmt = 0;
  if (v5 != 101
    || (sqlite3_prepare_v2(v2, "INSERT INTO new_recents (bundle_identifier, display_name, kind, address, address_hash, sending_address, dates, last_date)VALUES (?, ?, ?, ?, ?, ?, ?, ?);",
          -1,
          &ppStmt,
          0),
        !ppStmt))
  {
LABEL_31:
    uint64_t v26 = v2;
LABEL_32:
    sub_1000127A0(v26, @"transferring recents to new_recents");

    return 0;
  }
  char v29 = v2;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = [v30 objectEnumerator];
  id v18 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v33;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        sqlite3_bind_text(ppStmt, 1, (const char *)objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"bundle_identifier"), "UTF8String"), -1, 0);
        sqlite3_bind_text(ppStmt, 2, (const char *)objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"display_name"), "UTF8String"), -1, 0);
        sqlite3_bind_text(ppStmt, 3, (const char *)objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"kind"), "UTF8String"), -1, 0);
        sqlite3_bind_text(ppStmt, 4, (const char *)objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"address"), "UTF8String"), -1, 0);
        sqlite3_bind_text(ppStmt, 5, (const char *)objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"address_hash"), "UTF8String"), -1, 0);
        sqlite3_bind_text(ppStmt, 6, (const char *)objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"sending_address"), "UTF8String"), -1, 0);
        sqlite3_bind_text(ppStmt, 7, (const char *)objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"dates"), "UTF8String"), -1, 0);
        sqlite3_bind_int64(ppStmt, 8, (sqlite3_int64)objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", @"last_date"), "longLongValue"));
        unsigned int v23 = sub_1000163B0((uint64_t)ppStmt);
        sqlite3_reset(ppStmt);
        if (v23 != 101)
        {
          sqlite3_finalize(ppStmt);
          uint64_t v26 = v29;
          goto LABEL_32;
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  sqlite3_finalize(ppStmt);
  sub_1000127A0(v29, @"transferring recents to new_recents");

  int v24 = sqlite3_exec(v29, "DROP TABLE IF EXISTS recents; ALTER TABLE new_recents RENAME TO recents;CREATE INDEX recents_address_hash ON r"
          "ecents(bundle_identifier, address_hash, kind);CREATE INDEX recents_expunge ON recents(bundle_identifier, last_date DESC);",
          0,
          0,
          0);
  sub_1000127A0(v29, @"dropping old recents table, rename new_recents to recents, adding new indexes");
  if (v24) {
    return 0;
  }
  BOOL v25 = sqlite3_create_function_v2(v29, "_migration_hash", 2, 1, 0, 0, 0, 0, 0) == 0;
  sub_1000127A0(v29, @"unregistering hash function");
  return v25;
}

BOOL sub_100013178(sqlite3 *a1)
{
  int v2 = sqlite3_exec(a1, "DROP TABLE IF EXISTS new_recents;\n"
         "DROP TABLE IF EXISTS contacts;\n"
         "        CREATE TABLE new_recents(           ROWID INTEGER PRIMARY KEY AUTOINCREMENT,             display_name"
         " TEXT,             bundle_identifier TEXT,             sending_address TEXT,                         dates TEXT"
         " NOT NULL,             last_date INTEGER,                         count INTEGER        );                INSER"
         "T INTO new_recents (ROWID, display_name, bundle_identifier, sending_address, dates, last_date, count)         S"
         "ELECT ROWID, display_name, bundle_identifier, sending_address, dates, last_date, 1 FROM recents;   CREATE TABLE"
         " contacts(            ROWID INTEGER PRIMARY KEY AUTOINCREMENT,                         recent_id INTEGER,    "
         "                     display_name TEXT,             kind TEXT,             address TEXT,             address_ha"
         "sh TEXT NOT NULL,                         FOREIGN KEY (recent_id) REFERENCES new_recents (ROWID) ON DELETE CASC"
         "ADE        );                 INSERT INTO contacts (recent_id, display_name, kind, address, address_hash)     "
         "    SELECT ROWID, display_name, kind, address, address_hash FROM recents;                 DROP TABLE recents; A"
         "LTER TABLE new_recents RENAME TO recents;                 DROP INDEX IF EXISTS recents_address_hash;         DR"
         "OP INDEX IF EXISTS recents_expunge;     ",
         0,
         0,
         0);
  sub_1000127A0(a1, @"creating separate contacts and recents tables");
  if (v2) {
    return 0;
  }
  BOOL v3 = sqlite3_exec(a1, "            CREATE INDEX contacts_recentsidx ON contacts(recent_id);             CREATE INDEX contacts_address_"
         "hash ON contacts(address_hash, kind);             CREATE INDEX contacts_search ON contacts(display_name, addres"
         "s);                    CREATE INDEX recents_expunge ON recents(bundle_identifier, last_date DESC);         ",
         0,
         0,
         0) == 0;
  sub_1000127A0(a1, @"adding new index for contacts table");
  return v3;
}

BOOL sub_100013208(sqlite3 *a1)
{
  BOOL v2 = sqlite3_exec(a1, "DROP TABLE IF EXISTS metadata;\n"
         "CREATE TABLE metadata (\n"
         "    ROWID INTEGER PRIMARY KEY AUTOINCREMENT,\n"
         "\n"
         "    recent_id INTEGER,\n"
         "    key TEXT,\n"
         "    value,\n"
         "\n"
         "    FOREIGN KEY (recent_id) REFERENCES recents (ROWID) ON DELETE CASCADE,\n"
         "    UNIQUE (recent_id, key)\n"
         ");\n"
         "DROP INDEX IF EXISTS contacts_search;\n"
         "DROP INDEX IF EXISTS contacts_address;\n"
         "DROP INDEX IF EXISTS metadata_recents;\n"
         "CREATE INDEX metadata_recents ON metadata(recent_id);\n"
         "CREATE INDEX contacts_address ON contacts(kind, display_name, address);",
         0,
         0,
         0) == 0;
  sub_1000127A0(a1, @"creating metadata tables and indexes");
  return v2;
}

BOOL sub_10001325C(sqlite3 *a1)
{
  BOOL v2 = sqlite3_exec(a1, "ALTER TABLE recents ADD COLUMN original_source TEXT;", 0, 0, 0) == 0;
  sub_1000127A0(a1, @"adding original_source column");
  return v2;
}

BOOL sub_1000132B0(sqlite3 *a1)
{
  BOOL v2 = sqlite3_exec(a1, "ALTER TABLE recents ADD COLUMN weight FLOAT;", 0, 0, 0) == 0;
  sub_1000127A0(a1, @"adding weight column");
  return v2;
}

BOOL sub_100013304(sqlite3 *a1, void *a2)
{
  int v4 = sqlite3_exec(a1, "PRAGMA foreign_keys = OFF;", 0, 0, 0);
  sub_1000127A0(a1, @"0. Disable foreign key constraints.");
  if (v4) {
    return 0;
  }
  int v5 = sqlite3_exec(a1, "DROP TABLE IF EXISTS new_recents; \n"
         "CREATE TABLE new_recents(\n"
         "   ROWID INTEGER PRIMARY KEY AUTOINCREMENT, \n"
         "   display_name TEXT, \n"
         "   bundle_identifier TEXT, \n"
         "   sending_address TEXT, \n"
         "   original_source TEXT, \n"
         "   dates TEXT NOT NULL, \n"
         "   last_date INTEGER, \n"
         "   weight FLOAT, \n"
         "   record_hash TEXT NOT NULL, \n"
         "   count INTEGER \n"
         ");INSERT INTO new_recents (ROWID, display_name, bundle_identifier, sending_address, \n"
         "                         original_source, dates, last_date, weight, count, record_hash) SELECT recents.ROWID, \n"
         "       recents.display_name, \n"
         "       recents.bundle_identifier, \n"
         "        recents.sending_address, \n"
         "        recents.original_source, \n"
         "        recents.dates, \n"
         "        recents.last_date, \n"
         "        recents.weight, \n"
         "        recents.count, \n"
         "        contacts.address_hash \n"
         " FROM recents \n"
         " INNER JOIN contacts \n"
         "         ON contacts.recent_id = recents.ROWID \n"
         "GROUP BY recents.ROWID;",
         0,
         0,
         0);
  sub_1000127A0(a1, @"1. Add record_hash column to recents");
  if (v5) {
    return 0;
  }
  ppStmt = 0;
  sqlite3_prepare_v2(a1, "SELECT recents.ROWID, contacts.address_hash, contacts.kind FROM recents INNER JOIN contacts ON contacts.recent_id = recents.ROWID WHERE recents.count > 1", -1, &ppStmt, 0);
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  while (sub_1000163B0((uint64_t)ppStmt) == 100)
  {
    sqlite3_int64 v9 = sqlite3_column_int64(ppStmt, 0);
    id v10 = sqlite3_column_text(ppStmt, 1);
    id v11 = sqlite3_column_text(ppStmt, 2);
    if (v10) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      id v13 = objc_msgSend(a2, "recentsHashForAddress:kind:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
      if (v13)
      {
        id v14 = v13;
        id v15 = objc_msgSend(v8, "objectForKey:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v9));
        if (!v15)
        {
          id v15 = +[NSMutableArray array];
          objc_msgSend(v8, "setObject:forKey:", v15, +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v9));
        }
        objc_msgSend(v15, "insertObject:atIndex:", v14, objc_msgSend(v15, "indexOfObject:inSortedRange:options:usingComparator:", v14, 0, objc_msgSend(v15, "count"), 1024, &stru_10002D1D8));
      }
    }
  }
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100013E38;
  v17[3] = &unk_10002D200;
  v17[4] = &v18;
  v17[5] = a1;
  [v8 enumerateKeysAndObjectsUsingBlock:v17];
  sub_1000127A0(a1, @"2. Generate new hashes for each group");
  if (*((unsigned char *)v19 + 24)
    && (int v16 = sqlite3_exec(a1, "DROP TABLE IF EXISTS new_contacts; \n"
                "CREATE TABLE new_contacts(\n"
                "    ROWID INTEGER PRIMARY KEY AUTOINCREMENT, \n"
                "    recent_id INTEGER, \n"
                "    display_name TEXT, \n"
                "    kind TEXT, \n"
                "     address TEXT, \n"
                "    FOREIGN KEY (recent_id) REFERENCES new_recents (ROWID) ON DELETE CASCADE \n"
                ");INSERT INTO new_contacts (ROWID, recent_id, display_name, kind, address) SELECT ROWID, recent_id, disp"
                "lay_name, kind, address FROM contacts; \n"
                "DROP TABLE contacts; ALTER TABLE new_contacts RENAME TO contacts; \n"
                "DROP TABLE recents; ALTER TABLE new_recents RENAME TO recents; \n"
                "DROP INDEX IF EXISTS contacts_address_hash; \n"
                "DROP INDEX IF EXISTS recents_record_hash; \n"
                "DROP INDEX IF EXISTS recents_expunge; \n"
                "CREATE INDEX recents_record_hash ON recents(record_hash); \n"
                "CREATE INDEX recents_expunge ON recents(bundle_identifier, last_date DESC); \n",
                0,
                0,
                0),
        sub_1000127A0(a1, @"3. Remove contacts' address_hash column"),
        !v16))
  {
    BOOL v6 = sqlite3_exec(a1, "PRAGMA foreign_keys = ON;", 0, 0, 0) == 0;
    sub_1000127A0(a1, @"4. Re-enable foreign key constraints.");
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v18, 8);
  return v6;
}

void sub_100013618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100013634(sqlite3 *a1)
{
  BOOL v2 = sqlite3_exec(a1, "DROP INDEX IF EXISTS contacts_recentsidx;\n"
         "DROP INDEX IF EXISTS contacts_address;\n"
         "CREATE INDEX contacts_recentsidx ON contacts(recent_id);\n"
         "CREATE INDEX contacts_address ON contacts(kind, display_name, address);\n",
         0,
         0,
         0) == 0;
  sub_1000127A0(a1, @"creating contacts indexes");
  return v2;
}

BOOL sub_100013688(sqlite3 *a1)
{
  BOOL v2 = sqlite3_exec(a1, "ALTER TABLE recents ADD COLUMN group_kind INTEGER;", 0, 0, 0) == 0;
  sub_1000127A0(a1, @"adding group kind column");
  return v2;
}

BOOL sub_1000136DC(sqlite3 *a1)
{
  if (sub_100013888(a1, @"DELETE FROM recents WHERE bundle_identifier='com.apple.eventkit.ios'"))
  {
    BOOL v2 = sub_100013888(a1, @"UPDATE recents SET bundle_identifier='com.apple.eventkit.ios' WHERE bundle_identifier='com.apple.reminders';");
    CFStringRef v3 = @"renaming iOS reminders domain";
  }
  else
  {
    BOOL v2 = 0;
    CFStringRef v3 = @"deleting pre-existing com.apple.eventkit.ios records";
  }
  sub_1000127A0(a1, (uint64_t)v3);
  return v2;
}

uint64_t sub_100013744(sqlite3 *a1)
{
  if (sub_100013888(a1, @"DELETE FROM contacts WHERE rowid IN (SELECT c.rowid FROM contacts c LEFT JOIN recents r ON (c.recent_id = r.rowid) WHERE r.rowid IS NULL)"))
  {
    if (sub_100013888(a1, @"DELETE FROM metadata WHERE rowid IN (SELECT m.rowid FROM metadata m LEFT JOIN recents r ON (m.recent_id = r.rowid) WHERE r.rowid IS NULL)"))
    {
      return 1;
    }
    CFStringRef v3 = @"deleting dangling metadata";
  }
  else
  {
    CFStringRef v3 = @"deleting dangling contacts";
  }
  sub_1000127A0(a1, (uint64_t)v3);
  return 0;
}

BOOL sub_1000137B0(sqlite3 *a1)
{
  BOOL v2 = sub_100013888(a1, @"DELETE FROM recents WHERE bundle_identifier IN ('com.apple.MobileSMS', 'com.apple.messages')");
  if (!v2) {
    sub_1000127A0(a1, @"deleting messages recents");
  }
  return v2;
}

void sub_1000137F8(sqlite3 *a1, int a2)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(a1, "INSERT OR REPLACE INTO properties (key, value) values ('version', ?)", -1, &ppStmt, 0))
  {
    sub_1000127A0(a1, @"preparing library version insert statement");
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, a2);
    sub_1000163B0((uint64_t)ppStmt);
    sub_1000127A0(a1, @"setting library version");
    sqlite3_finalize(ppStmt);
  }
}

BOOL sub_100013888(sqlite3 *a1, void *a2)
{
  if (!a2) {
    sub_10001ADB4();
  }
  int v3 = sqlite3_exec(a1, (const char *)[a2 UTF8String], 0, 0, 0);
  if (v3) {
    sub_1000127A0(a1, (uint64_t)+[NSString stringWithFormat:@"executing SQL statements"]);
  }
  return v3 == 0;
}

void sub_100013C14(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  if (a2 == 2)
  {
    int v5 = sqlite3_value_text(*a3);
    BOOL v6 = sqlite3_value_text(a3[1]);
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7
      || (id v8 = (const char *)v6,
          sqlite3_int64 v9 = sqlite3_user_data(a1),
          id v10 = (__CFString *)CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, (const char *)v5, 0x8000100u, kCFAllocatorNull), v11 = (__CFString *)CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, v8, 0x8000100u, kCFAllocatorNull), v12 = [v9 recentsHashForAddress:v11 kind:v10], v11, v10, !v12))
    {
      sqlite3_result_null(a1);
    }
    else
    {
      id v13 = (const char *)[v12 UTF8String];
      sqlite3_result_text(a1, v13, -1, 0);
    }
  }
  else
  {
    sqlite3_result_null(a1);
    id v15 = +[CRLogging log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 67109378;
      v16[1] = a2;
      __int16 v17 = 2080;
      uint64_t v18 = "__recentsHashFunction";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "wrong number of arguments (%d) to %s", (uint8_t *)v16, 0x12u);
    }
  }
}

int64_t sub_100013E30(id a1, id a2, id a3)
{
  return (int64_t)[a2 compare:a3];
}

uint64_t sub_100013E38(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t result = sqlite3_exec(*(sqlite3 **)(a1 + 40), -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"UPDATE new_recents SET record_hash = '%@' WHERE ROWID = %ld", objc_msgSend(objc_msgSend(objc_msgSend(a3, "componentsJoinedByString:", &stru_10002D980), "dataUsingEncoding:", 4), "cr_md5DigestHexString"), objc_msgSend(a2, "integerValue")), "UTF8String"), 0, 0, 0);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (result) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = *(unsigned char *)(v7 + 24) == 0;
  }
  char v9 = !v8;
  *(unsigned char *)(v7 + 24) = v9;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

void sub_100013F70(id a1)
{
  qword_1000344E0 = (uint64_t)os_log_create("com.apple.corerecents", "daemon");
  _objc_release_x1();
}

void sub_1000142B8(id a1)
{
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v1 = sub_100014958();
  block = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  char v21 = sub_1000149A4;
  id v22 = &unk_10002CAF0;
  CFStringRef v23 = @"CoreRecentsVFS";
  int v24 = &v15;
  dispatch_sync(v1, &block);
  uint64_t v2 = v16[3];
  _Block_object_dispose(&v15, 8);
  if (!v2)
  {
    int v3 = malloc_type_calloc(1uLL, 0xA8uLL, 0x10F0040C767261AuLL);
    int v4 = sqlite3_vfs_find(0);
    long long v6 = *(_OWORD *)&v4->pNext;
    long long v5 = *(_OWORD *)&v4->pAppData;
    *int v3 = *(_OWORD *)&v4->iVersion;
    v3[1] = v6;
    v3[2] = v5;
    long long v7 = *(_OWORD *)&v4->xDlClose;
    long long v9 = *(_OWORD *)&v4->xDelete;
    long long v8 = *(_OWORD *)&v4->xFullPathname;
    v3[5] = *(_OWORD *)&v4->xDlError;
    v3[6] = v7;
    v3[3] = v9;
    v3[4] = v8;
    long long v11 = *(_OWORD *)&v4->xGetLastError;
    long long v10 = *(_OWORD *)&v4->xSetSystemCall;
    long long v12 = *(_OWORD *)&v4->xSleep;
    *((void *)v3 + 20) = v4->xNextSystemCall;
    v3[8] = v11;
    v3[9] = v10;
    v3[7] = v12;
    *((_DWORD *)v3 + 1) = v4->szOsFile;
    *((void *)v3 + 3) = strdup((const char *)[@"CoreRecentsVFS" UTF8String]);
    *(_DWORD *)int v3 = 1;
    id v13 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
    *((void *)v3 + 4) = v13;
    *id v13 = v4;
    *((void *)v3 + 5) = sub_100014494;
    id v14 = sub_100014958();
    block = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    char v21 = sub_100014A14;
    id v22 = &unk_10002D288;
    CFStringRef v23 = @"CoreRecentsVFS";
    int v24 = (uint64_t *)v3;
    dispatch_barrier_sync(v14, &block);
  }
}

void sub_10001447C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_100014494(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 32) + 40))(*(void **)(a1 + 32));
}

uint64_t sub_1000148D8(int a1, sqlite3_stmt *pStmt)
{
  return sqlite3_finalize(pStmt);
}

uint64_t sub_100014958()
{
  if (qword_100034500 != -1) {
    dispatch_once(&qword_100034500, &stru_10002D260);
  }
  uint64_t result = qword_1000344F8;
  if (!qword_1000344F8) {
    sub_10001B39C();
  }
  return result;
}

const void *sub_1000149A4(uint64_t a1)
{
  uint64_t result = (const void *)qword_1000344F0;
  if (qword_1000344F0)
  {
    uint64_t result = CFDictionaryGetValue((CFDictionaryRef)qword_1000344F0, *(const void **)(a1 + 32));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

void sub_1000149E4(id a1)
{
  qword_1000344F8 = (uint64_t)dispatch_queue_create("com.apple.message.library.vfsQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
}

uint64_t sub_100014A14(uint64_t a1)
{
  Mutable = (__CFDictionary *)qword_1000344F0;
  if (!qword_1000344F0)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0);
    qword_1000344F0 = (uint64_t)Mutable;
  }
  CFDictionaryAddValue(Mutable, *(const void **)(a1 + 32), *(const void **)(a1 + 40));
  int v3 = *(sqlite3_vfs **)(a1 + 40);
  return sqlite3_vfs_register(v3, 0);
}

void sub_100014A84(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100014AA0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100014AD4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100014B38(id a1)
{
  qword_100034508 = (uint64_t)[(id)CPSystemRootDirectory() stringByAppendingPathComponent:@"/System/Library/Recents/Plugins"];
}

NSNumber *__cdecl sub_100015258(id a1, NSString *a2)
{
  return (NSNumber *)&__kCFBooleanFalse;
}

id sub_10001535C(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  qword_100034518 = (uint64_t)result;
  return result;
}

void sub_1000154A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000154BC(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _updateLockStateWithToken:a2];
}

uint64_t sub_100015704(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 12) != 0;
  return result;
}

id sub_1000163B0(uint64_t a1)
{
  return +[CRSQLRow step:a1];
}

void CRLogSQLiteError(sqlite3 *a1, uint64_t a2)
{
  int v4 = sqlite3_errcode(a1);
  if (v4 == 10)
  {
    int __errnum = 0;
    sqlite3_file_control(a1, 0, 4, &__errnum);
    long long v5 = +[CRLogging log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      long long v6 = sqlite3_errmsg(a1);
      int v7 = __errnum;
      long long v8 = strerror(__errnum);
      *(_DWORD *)buf = 67110402;
      int v15 = v4;
      __int16 v16 = 2048;
      uint64_t v17 = a1;
      __int16 v18 = 2114;
      uint64_t v19 = a2;
      __int16 v20 = 2080;
      char v21 = v6;
      __int16 v22 = 1024;
      int v23 = v7;
      __int16 v24 = 2080;
      BOOL v25 = v8;
      uint64_t v9 = "Error %d on connection %p %{public}@: %s - I/O error %d (%s)";
      uint64_t v10 = v5;
      uint32_t v11 = 54;
LABEL_7:
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    }
  }
  else
  {
    long long v12 = +[CRLogging log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      int v15 = v4;
      __int16 v16 = 2048;
      uint64_t v17 = a1;
      __int16 v18 = 2114;
      uint64_t v19 = a2;
      __int16 v20 = 2080;
      char v21 = sqlite3_errmsg(a1);
      uint64_t v9 = "Error %d on connection %p %{public}@: %s";
      uint64_t v10 = v12;
      uint32_t v11 = 38;
      goto LABEL_7;
    }
  }
}

void sub_100016574(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  if (a2 == 3)
  {
    long long v5 = sqlite3_value_text(*a3);
    long long v6 = (char *)sqlite3_value_text(a3[1]);
    int v7 = sqlite3_value_int(a3[2]);
    int v8 = v7;
    if (v5) {
      BOOL v9 = v6 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      __int16 v18 = sqlite3_user_data(a1);
      int v19 = sub_10001A284((const char *)v5, v6, -1, v8, (uint64_t)v18);
      __int16 v20 = a1;
LABEL_13:
      sqlite3_result_int(v20, v19);
      return;
    }
    if (v6 && v7 == 1)
    {
      __int16 v20 = a1;
      int v19 = 1;
      goto LABEL_13;
    }
    sqlite3_result_null(a1);
  }
  else
  {
    sqlite3_result_null(a1);
    uint32_t v11 = +[CRLogging log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001B420(a2, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void *sub_100016694()
{
  return malloc_type_calloc(0x20uLL, 1uLL, 0x99DBDC76uLL);
}

void sub_1000166A8(uint64_t a1)
{
  if (a1)
  {

    uint64_t v2 = *(void **)(a1 + 8);
    if (v2) {
      free(v2);
    }

    free((void *)a1);
  }
}

void sub_100016700(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  if (a2 == 3)
  {
    long long v5 = sqlite3_value_text(*a3);
    long long v6 = sqlite3_value_text(a3[1]);
    uint64_t v7 = sqlite3_value_int(a3[2]);
    uint64_t v8 = v7;
    if (v5) {
      BOOL v9 = v6 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      __int16 v20 = (const char **)sqlite3_user_data(a1);
      char v21 = v20;
      if (v20[2] && !strcmp((const char *)v6, v20[1]))
      {
        uint64_t v26 = (CRSearchMatcher *)*v21;
      }
      else
      {
        size_t v22 = strlen((const char *)v6);
        if (v22)
        {
          size_t v23 = v22;
          __int16 v24 = (char *)v21[1];
          if (v24) {
            free(v24);
          }
          v21[1] = strdup((const char *)v6);
          v21[2] = (const char *)v23;
          id v25 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v21[1] length:v23 freeWhenDone:0];
          uint64_t v26 = (CRSearchMatcher *)[(id)v21[3] objectForKey:v25];
          if (!v26)
          {
            uint64_t v26 = [[CRSearchMatcher alloc] initWithSearchString:+[NSString stringWithUTF8String:v6] options:7];
            __int16 v27 = (char *)v21[3];
            if (!v27)
            {
              __int16 v27 = (char *)objc_alloc_init((Class)NSMutableDictionary);
              _OWORD v21[3] = v27;
            }
            objc_msgSend(v27, "setObject:forKey:", v26, +[NSData dataWithData:](NSData, "dataWithData:", v25));
          }
          if (*v21 != (const char *)v26)
          {

            *char v21 = (const char *)v26;
          }
        }
        else
        {
          uint64_t v26 = 0;
        }
      }
      int v11 = [(CRSearchMatcher *)v26 matchesUTF8String:v5 matchType:v8];
      uint64_t v10 = a1;
      goto LABEL_30;
    }
    if (v6 && v7 == 1)
    {
      uint64_t v10 = a1;
      int v11 = 1;
LABEL_30:
      sqlite3_result_int(v10, v11);
      return;
    }
    sqlite3_result_null(a1);
  }
  else
  {
    sqlite3_result_null(a1);
    uint64_t v13 = +[CRLogging log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10001B48C(a2, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

_CRPhoneSearchCache *sub_100016B38()
{
  return objc_alloc_init(_CRPhoneSearchCache);
}

void sub_100016B48(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  if (a2 == 3)
  {
    long long v5 = sqlite3_value_text(*a3);
    long long v6 = sqlite3_value_text(a3[1]);
    int v7 = sqlite3_value_int(a3[2]);
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      sqlite3_result_null(a1);
    }
    else
    {
      uint64_t v17 = v7;
      id v18 = [sqlite3_user_data(a1) copySearcherForPattern:v6];
      int v19 = [v18 matchesUTF8String:v5 matchType:v17];

      sqlite3_result_int(a1, v19);
    }
  }
  else
  {
    sqlite3_result_null(a1);
    uint64_t v10 = +[CRLogging log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10001B4F8(a2, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

id CRRemoveDatabase(void *a1)
{
  uint64_t v2 = +[CRLogging log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Removing database %{public}@", buf, 0xCu);
  }
  if (a1)
  {
    *(void *)buf = 0;
    if (![+[NSFileManager defaultManager] removeItemAtPath:a1 error:buf])
    {
      uint64_t v3 = *(void *)buf;
      if (*(void *)buf)
      {
        int v4 = +[CRLogging log];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_10001B564((uint64_t)a1, v3, v4);
        }
      }
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id result = [&off_10002F550 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v6 = 138543618;
    long long v13 = v6;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(&off_10002F550);
        }
        id v10 = objc_msgSend(a1, "stringByAppendingString:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v9), v13);
        if (v10)
        {
          *(void *)buf = 0;
          if ([+[NSFileManager defaultManager] removeItemAtPath:v10 error:buf])
          {
            uint64_t v11 = 0;
          }
          else
          {
            uint64_t v11 = *(void *)buf;
          }
        }
        else
        {
          uint64_t v11 = 0;
        }
        if ((+[CNFoundationError isFileNotFoundError:v11] & 1) == 0)
        {
          uint64_t v12 = +[CRLogging log];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            *(void *)&uint8_t buf[4] = v10;
            __int16 v19 = 2114;
            uint64_t v20 = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error deleting database support file at path %{public}@: %{public}@", buf, 0x16u);
          }
        }
        BOOL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id result = [&off_10002F550 countByEnumeratingWithState:&v14 objects:v21 count:16];
      id v7 = result;
    }
    while (result);
  }
  return result;
}

void sub_100016EBC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000170DC(id a1, sqlite3_stmt *a2, int a3)
{
}

uint64_t sub_1000170E8(uint64_t a1, sqlite3_stmt *a2, int a3)
{
  long long v5 = (const char *)[*(id *)(a1 + 32) UTF8String];
  return sqlite3_bind_text(a2, a3, v5, -1, 0);
}

uint64_t sub_100017138(uint64_t a1, sqlite3_stmt *a2, int a3)
{
  long long v6 = (const char *)[*(id *)(a1 + 32) objCType];
  if (!strcmp(v6, "Q")
    && !strcmp(v6, "q")
    && !strcmp(v6, "B")
    && !strcmp(v6, "c")
    && !strcmp(v6, "C")
    && !strcmp(v6, "s")
    && !strcmp(v6, "S")
    && !strcmp(v6, "i")
    && !strcmp(v6, "I"))
  {
    if (strcmp(v6, "d") || (uint64_t result = strcmp(v6, "f"), result))
    {
      [*(id *)(a1 + 32) doubleValue];
      return sqlite3_bind_double(a2, a3, v9);
    }
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) longLongValue];
    return sqlite3_bind_int64(a2, a3, (sqlite3_int64)v7);
  }
  return result;
}

void sub_1000179E8(id a1)
{
  qword_100034528 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"tokenSearch:", @"prefixSearch:", @"phoneSearch:", 0);
}

void sub_100017C74(id a1)
{
  v11[0] = @"kind";
  v9[0] = @"sql";
  v9[1] = @"count";
  v10[0] = @"kind";
  v10[1] = &off_10002F4D8;
  v9[2] = @"operator";
  v10[2] = &off_10002F4F0;
  v12[0] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  v11[1] = @"address";
  v7[0] = @"sql";
  v7[1] = @"count";
  v8[0] = @"contacts.address";
  v8[1] = &off_10002F4D8;
  v12[1] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v11[2] = @"displayName";
  v5[0] = @"sql";
  v5[1] = @"count";
  v6[0] = @"contacts.display_name";
  v6[1] = &off_10002F4D8;
  v12[2] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v11[3] = @"groupName";
  v3[0] = @"sql";
  v3[1] = @"count";
  v4[0] = @"recents.display_name";
  v4[1] = &off_10002F4D8;
  v12[3] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  v11[4] = @"sendingAddress";
  v1[0] = @"sql";
  v1[1] = @"count";
  v2[0] = @"recents.sending_address";
  v2[1] = &off_10002F4D8;
  v12[4] = +[NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:2];
  qword_100034538 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
}

CFStringRef sub_1000186F0(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @".SignedOut";
  }
  else {
    return off_10002D470[a1 - 1];
  }
}

void sub_1000189DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

id sub_100018A08(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _resetCachedAccountInfo];
}

id sub_100018A34(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _delegateAccountChanges];
}

id sub_100018A60(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _delegateAccountChanges];
}

void sub_100018BB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_100018BD0(void *a1)
{
  id result = [*(id *)(a1[4] + 8) isAddressRestricted:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100018C98(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 8) allAddresses];
  return [v1 addObjectsFromArray:v2];
}

void sub_100018D4C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_100018D60(_Unwind_Exception *a1)
{
}

id sub_100018E1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addAddress:a2 isRestricted:a3];
}

void sub_100018E98(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + _Block_object_dispose(&a9, 8) = 0;
}

void sub_10001937C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001939C(uint64_t result, uint64_t a2)
{
  char v19 = 0;
  if (result)
  {
    uint64_t v3 = result;
    char v4 = *(unsigned char *)result;
    if (*(unsigned char *)result)
    {
      uint64_t v5 = 0;
      int v6 = 1;
      uint64_t v7 = result;
      char v8 = 1;
      while (1)
      {
        __darwin_ct_rune_t v9 = v4;
        if (v4 < 0)
        {
          BOOL v11 = __maskrune(v4, 0x8000uLL) == 0;
          int v12 = __maskrune(v9, 0x1000uLL) != 0;
          id result = __maskrune(v9, 0x4000uLL);
          if (result)
          {
LABEL_8:
            int v13 = v6 & !v11;
            goto LABEL_11;
          }
          id result = __maskrune(v9, 0x2000uLL);
        }
        else
        {
          __uint32_t v10 = _DefaultRuneLocale.__runetype[v4];
          BOOL v11 = (v10 & 0x8000) == 0;
          int v12 = (v10 >> 12) & 1;
          if ((v10 & 0x4000) != 0) {
            goto LABEL_8;
          }
          id result = v10 & 0x2000;
        }
        int v13 = v6 & !v11;
        if (!result)
        {
          int v14 = 0;
          int v15 = 1;
          int v6 = v12;
          goto LABEL_12;
        }
LABEL_11:
        int v14 = 1;
        int v6 = v12;
        int v15 = v13;
LABEL_12:
        if (v8) {
          int v16 = v15;
        }
        else {
          int v16 = v13;
        }
        if ((v8 & 1) == 0) {
          v13 |= v14;
        }
        if (v13 == 1 && v5 != 0)
        {
          id result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a2 + 16))(a2, v5, v7 - v5, &v19);
          if (v19) {
            return result;
          }
          uint64_t v5 = 0;
        }
        if (v16) {
          uint64_t v5 = v3;
        }
        int v18 = *(unsigned __int8 *)++v3;
        char v4 = v18;
        ++v7;
        char v8 = v14;
        if (!v18) {
          goto LABEL_29;
        }
      }
    }
    uint64_t v5 = 0;
LABEL_29:
    if (v5) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a2 + 16))(a2, v5, v3 - v5, &v19);
    }
  }
  return result;
}

uint64_t sub_100019530(uint64_t result, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(result + 40);
  if (*(_DWORD *)(result + 64) == 6)
  {
    if (v6 != a3) {
      return result;
    }
  }
  else if (v6 > a3)
  {
    return result;
  }
  id result = (*(uint64_t (**)(uint64_t, void))(result + 48))(a2, *(void *)(result + 56));
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

id sub_100019AFC(uint64_t a1, const char *a2, size_t a3, unsigned char *a4)
{
  char v8 = +[NSMutableData dataWithLength:a3 + 1];
  strncpy((char *)[(NSMutableData *)v8 mutableBytes], a2, a3);
  id result = [*(id *)(*(void *)(a1 + 32) + 24) addObject:v8];
  *a4 = 0;
  return result;
}

uint64_t sub_100019C00(void *a1)
{
  return _ucol_close(*a1);
}

uint64_t sub_100019C08@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  char v10 = 0;
  memset(v9, 0, sizeof(v9));
  if (a1)
  {
    __strlcpy_chk();
  }
  else
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFPreferencesCopyAppValue(@"AppleCollationOrder", kCFPreferencesCurrentApplication);
    if (ValueAtIndex
      || (CFArrayRef v6 = (const __CFArray *)CFPreferencesCopyAppValue(@"AppleLanguages", kCFPreferencesCurrentApplication)) != 0
      && (CFArrayRef v7 = v6,
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0),
          CFRetain(ValueAtIndex),
          CFRelease(v7),
          ValueAtIndex))
    {
      CFStringRef CanonicalLanguageIdentifierFromString = CFLocaleCreateCanonicalLanguageIdentifierFromString(kCFAllocatorDefault, ValueAtIndex);
      if (CanonicalLanguageIdentifierFromString)
      {
        CFStringRef v5 = CanonicalLanguageIdentifierFromString;
        CFStringGetCString(CanonicalLanguageIdentifierFromString, (char *)v9, 257, 0x600u);
        CFRelease(v5);
      }
      CFRelease(ValueAtIndex);
    }
    else
    {
      LOBYTE(v9[0]) = 0;
    }
  }
  uloc_setKeywordValue();
  *a2 = ucol_open();
  return ucol_setStrength();
}

uint64_t sub_100019E7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100019F20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

CNCancelable *__cdecl sub_100019F60(id a1, CNObserver *a2)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = CFStringCreateWithCString(0, kMFMailAccountsChangedNotification, 0x8000100u);
  if (v4)
  {
    CFStringRef v5 = v4;
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a2, (CFNotificationCallback)sub_10001A044, v4, 0, CFNotificationSuspensionBehaviorDrop);
    CFRelease(v5);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10001A054;
  v7[3] = &unk_10002D288;
  v7[4] = a2;
  v7[5] = DarwinNotifyCenter;
  return +[CNCancelationToken tokenWithCancelationBlock:v7];
}

id sub_10001A044(uint64_t a1, void *a2)
{
  return [a2 observerDidReceiveResult:&__kCFBooleanTrue];
}

void sub_10001A054(uint64_t a1)
{
}

void sub_10001A060(void *a1)
{
  if (a1)
  {
    usearch_close();
    ubrk_close();
    sub_100019C00(a1);
    id v2 = (UText *)a1[5];
    if (v2) {
      utext_close(v2);
    }
    uint64_t v3 = (void *)a1[25];
    if (v3) {
      free(v3);
    }
    CFStringRef v4 = (void *)a1[27];
    if (v4 && v4 != a1 + 28) {
      free(v4);
    }
    CFStringRef v5 = (void *)a1[22];
    if (v5 && v5 != a1 + 6) {
      free(v5);
    }
    free(a1);
  }
}

void *sub_10001A0FC(uint64_t a1, char a2)
{
  UErrorCode v9 = U_ZERO_ERROR;
  CFStringRef v4 = malloc_type_malloc(0x2E8uLL, 0x10B0040F856FD53uLL);
  v4[3] = 0;
  *((_WORD *)v4 + 24) = 65;
  v4[22] = v4 + 6;
  v4[23] = 128;
  v4[5] = 0;
  v4[25] = 0;
  v4[26] = 0;
  *((unsigned char *)v4 + 192) = 1;
  v4[27] = v4 + 28;
  v4[92] = 256;
  sub_100019C08(a1, (uint64_t *)&v7);
  *(_OWORD *)CFStringRef v4 = v7;
  void v4[2] = v8;
  v4[4] = ubrk_open();
  if (a2)
  {
    ucol_setAttribute();
    if ((a2 & 2) != 0) {
      goto LABEL_6;
    }
  }
  else if ((a2 & 2) == 0)
  {
    goto LABEL_6;
  }
  ucol_setAttribute();
LABEL_6:
  if ((a2 & 4) != 0) {
    ucol_setAttribute();
  }
  v4[3] = usearch_openFromCollator();
  if (v9 >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    sub_10001A060(v4);
    CFStringRef v5 = u_errorName(v9);
    NSLog(@"Failed to open ICUSQLite collator: %s", v5);
    return 0;
  }
  return v4;
}

UChar *sub_10001A284(const char *a1, char *__s, int32_t a3, int a4, uint64_t a5)
{
  int32_t v7 = a3;
  UErrorCode pErrorCode = U_ZERO_ERROR;
  if (a3 == -1) {
    int32_t v7 = strlen(__s);
  }
  char v10 = *(char **)(a5 + 176);
  size_t v11 = strlen(v10);
  if (v11 != v7 || strncmp(v10, __s, v11) || !*(void *)(a5 + 200))
  {
    int32_t pDestLength = 0;
    if (v7 >= 1)
    {
      unint64_t v12 = (v7 + 1);
      if (*(void *)(a5 + 184) < v12)
      {
        int v13 = (char *)malloc_type_malloc((v7 + 1), 0x100004077774924uLL);
        if (!v13) {
          return 0;
        }
        char v10 = v13;
        int v14 = *(void **)(a5 + 176);
        if (v14 != (void *)(a5 + 48)) {
          free(v14);
        }
        *(void *)(a5 + 176) = v10;
        *(void *)(a5 + 184) = v12;
      }
      memcpy(v10, __s, v7);
      *(unsigned char *)(*(void *)(a5 + 176) + v7) = 0;
      u_strFromUTF8(*(UChar **)(a5 + 200), *(_DWORD *)(a5 + 208), &pDestLength, __s, v7, &pErrorCode);
      if (pErrorCode == U_BUFFER_OVERFLOW_ERROR || !*(void *)(a5 + 200))
      {
        int v15 = (UChar *)malloc_type_malloc(2 * pDestLength + 2, 0x1000040BDFB0063uLL);
        if (!v15) {
          return 0;
        }
        int v16 = v15;
        long long v17 = *(void **)(a5 + 200);
        if (v17) {
          free(v17);
        }
        uint64_t v18 = pDestLength + 1;
        *(void *)(a5 + 200) = v16;
        *(void *)(a5 + 20_Block_object_dispose(&a9, 8) = v18;
        UErrorCode pErrorCode = U_ZERO_ERROR;
        u_strFromUTF8(v16, v18, &pDestLength, __s, v7, &pErrorCode);
      }
      usearch_setPattern();
      *(unsigned char *)(a5 + 192) = 1;
      uint64_t v19 = pDestLength;
      if (pDestLength >= 1)
      {
        uint64_t v20 = *(__int16 **)(a5 + 200);
        do
        {
          __int16 v22 = *v20++;
          __int16 v21 = v22;
          if ((unsigned __int16)(v22 + 160) < 0x50u
            || (v21 & 0xFF80) == 0xE00
            || (unsigned __int16)((unsigned __int16)(v21 - 11904) >> 7) <= 0x196u)
          {
            *(unsigned char *)(a5 + 192) = 0;
          }
          --v19;
        }
        while (v19);
      }
      if (pErrorCode <= U_ZERO_ERROR) {
        goto LABEL_27;
      }
      **(unsigned char **)(a5 + 176) = 0;
    }
    return 0;
  }
LABEL_27:
  int32_t v43 = 0;
  int32_t v23 = strlen(a1);
  if (v23 < 1) {
    return 0;
  }
  u_strFromUTF8(*(UChar **)(a5 + 216), *(_DWORD *)(a5 + 736), &v43, a1, v23, &pErrorCode);
  if (pErrorCode == U_BUFFER_OVERFLOW_ERROR)
  {
    id result = (UChar *)malloc_type_malloc(2 * v43 + 2, 0x1000040BDFB0063uLL);
    if (!result) {
      return result;
    }
    id v25 = result;
    uint64_t v26 = *(void **)(a5 + 216);
    if (v26 != (void *)(a5 + 224)) {
      free(v26);
    }
    *(void *)(a5 + 216) = v25;
    uint64_t v27 = v43 + 1;
    *(void *)(a5 + 736) = v27;
    UErrorCode pErrorCode = U_ZERO_ERROR;
    u_strFromUTF8(v25, v27, &v43, a1, v23, &pErrorCode);
  }
  usearch_setText();
  if (a4 != 3)
  {
    int v31 = usearch_first();
    BOOL v30 = 0;
    int v32 = v31;
    switch(a4)
    {
      case 0:
        goto LABEL_64;
      case 1:
        BOOL v29 = v31 == -1;
        goto LABEL_36;
      case 2:
        BOOL v29 = v31 == 0;
        goto LABEL_36;
      case 4:
        if (v31) {
          goto LABEL_68;
        }
        BOOL v29 = usearch_getMatchedLength() == v43;
        goto LABEL_36;
      case 5:
      case 6:
        if (!*(unsigned char *)(a5 + 192))
        {
LABEL_64:
          BOOL v30 = v31 != -1;
          goto LABEL_69;
        }
        if (v31 == -1) {
          goto LABEL_68;
        }
        ubrk_setText();
        if (pErrorCode > U_ZERO_ERROR) {
          goto LABEL_68;
        }
        char v33 = 0;
        break;
      default:
        goto LABEL_69;
    }
    while (1)
    {
      if (ubrk_isBoundary())
      {
        if (a4 == 5 || (usearch_getMatchedLength(), ubrk_isBoundary()))
        {
LABEL_73:
          BOOL v30 = 1;
          goto LABEL_69;
        }
      }
      else
      {
        long long v34 = *(UText **)(a5 + 40);
        if ((v33 & 1) == 0)
        {
          long long v34 = utext_openUChars(v34, *(const UChar **)(a5 + 216), v43, &pErrorCode);
          *(void *)(a5 + 40) = v34;
        }
        utext_setNativeIndex(v34, v32);
        utext_moveIndex32(*(UText **)(a5 + 40), -1);
        UChar32 v35 = utext_next32(*(UText **)(a5 + 40));
        int isUUppercase = u_isUUppercase(v35);
        UChar32 v37 = utext_next32(*(UText **)(a5 + 40));
        int v38 = u_isUUppercase(v37);
        UChar32 v39 = utext_next32(*(UText **)(a5 + 40));
        if (u_isUUppercase(v39)) {
          BOOL v40 = isUUppercase == 0;
        }
        else {
          BOOL v40 = 1;
        }
        int v41 = v40;
        char v33 = 1;
        if (v38 && v41)
        {
          if (a4 == 5) {
            goto LABEL_73;
          }
          usearch_getMatchedLength();
          int isBoundary = ubrk_isBoundary();
          BOOL v30 = 1;
          if (isBoundary) {
            goto LABEL_69;
          }
        }
      }
      int v32 = usearch_next();
      BOOL v30 = 0;
      if (v32 == -1) {
        goto LABEL_69;
      }
    }
  }
  int v28 = usearch_last();
  if (v28 == -1)
  {
LABEL_68:
    BOOL v30 = 0;
  }
  else
  {
    BOOL v29 = usearch_getMatchedLength() + v28 == v43;
LABEL_36:
    BOOL v30 = v29;
  }
LABEL_69:
  if (pErrorCode < U_ILLEGAL_ARGUMENT_ERROR) {
    return (UChar *)v30;
  }
  else {
    return 0;
  }
}

void sub_10001A768(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to wait for first unlock", v1, 2u);
}

void sub_10001A7AC()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to Soft Link: /System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag (%d)", (uint8_t *)v1, 8u);
}

void sub_10001A834()
{
}

void sub_10001A860()
{
  __assert_rtn("-[_CRRecentsLibrary unlockConnection:]", "_CRRecentsLibrary.m", 536, "[wrapper connection] == connection");
}

void sub_10001A88C()
{
  __assert_rtn("-[_CRRecentsLibrary _connectionForWriting:]", "_CRRecentsLibrary.m", 551, "nil != connection");
}

void sub_10001A8B8()
{
}

void sub_10001A8E4()
{
  __assert_rtn("_maxRecentPropertyKeyForRecentsDomain", "_CRRecentsLibrary.m", 1442, "recentsDomain != nil");
}

void sub_10001A910()
{
}

void sub_10001A93C()
{
  __assert_rtn("_maxGroupRecentPropertyKeyForRecentsDomain", "_CRRecentsLibrary.m", 1448, "recentsDomain != nil");
}

void sub_10001A968()
{
}

void sub_10001A994()
{
  __assert_rtn("_maxRecentAgePropertyKeyForRecentsDomain", "_CRRecentsLibrary.m", 1454, "recentsDomain != nil");
}

void sub_10001A9C0()
{
  sub_1000120BC();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "No hash for old recent with rowid %{public}@ and kind %{public}@", v2, 0x16u);
}

void sub_10001AA44()
{
  sub_1000120BC();
  sub_1000120C8((void *)&_mh_execute_header, v0, v1, "No hash for recent with rowid %{public}@", v2, v3, v4, v5, v6);
}

void sub_10001AAAC()
{
  sub_1000120BC();
  sub_1000120C8((void *)&_mh_execute_header, v0, v1, "No hash for group recent with rowid %{public}@", v2, v3, v4, v5, v6);
}

void sub_10001AB14()
{
  sub_1000120BC();
  sub_1000120C8((void *)&_mh_execute_header, v0, v1, "No hash for row %{public}@", v2, v3, v4, v5, v6);
}

void sub_10001AB7C()
{
}

void sub_10001ABA8(void *a1, NSObject *a2)
{
  [a1 sanitizedDescription];
  sub_1000120BC();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No hash for recent %{public}@", v3, 0xCu);
}

void sub_10001AC30()
{
}

void sub_10001AC5C()
{
  sub_1000120BC();
  sub_1000120C8((void *)&_mh_execute_header, v0, v1, "No hash for domain %@", v2, v3, v4, v5, v6);
}

void sub_10001ACC4()
{
  __assert_rtn("-[_CRRecentsLibrary _deleteRecentsWithRecentIDs:storeKeys:recentsDomain:deleteInUbiquitousStore:]", "_CRRecentsLibrary.m", 2021, "recentsDomain != nil");
}

void sub_10001ACF0()
{
  __assert_rtn("-[_CRRecentsLibrary _storeChangedExternally:]", "_CRRecentsLibrary.m", 2471, "recentsDomain != nil");
}

void sub_10001AD1C(void *a1, uint64_t a2, NSObject *a3)
{
  [a1 address];
  sub_1000120BC();
  __int16 v6 = 2113;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Contact with address %{public}@ has kind we don't know how to sync, %{private}@", v5, 0x16u);
}

void sub_10001ADB4()
{
  __assert_rtn("_ExecuteSQL", "CRRecentsMigrator.m", 353, "nil != sql");
}

void sub_10001ADE0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Database connection unavailable", v1, 2u);
}

void sub_10001AE24(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 uuid];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Query %{public}@ failed: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_10001AED4()
{
  __assert_rtn("-[CRSQLiteConnection initWithPath:]", "CRSQLiteConnection.m", 73, "NULL != path");
}

void sub_10001AF00()
{
  __assert_rtn("-[CRSQLiteConnection initWithPath:databaseName:]", "CRSQLiteConnection.m", 86, "NULL != databaseName");
}

void sub_10001AF2C()
{
  __assert_rtn("-[CRSQLiteConnection dealloc]", "CRSQLiteConnection.m", 95, "NULL == _db");
}

void sub_10001AF58()
{
  __assert_rtn("-[CRSQLiteConnection open]", "CRSQLiteConnection.m", 200, "NULL == _db");
}

void sub_10001AF84()
{
  __assert_rtn("-[CRSQLiteConnection preparedStatementForPattern:]", "CRSQLiteConnection.m", 349, "NULL != _db");
}

double sub_10001AFB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014A84((void *)&_mh_execute_header, a1, a3, "Did prepare statement in %.3fms", a5, a6, a7, a8, 0);
  return result;
}

void sub_10001B030(int *a1)
{
  strerror(*a1);
  sub_100014ABC();
  sub_100014AD4((void *)&_mh_execute_header, v1, v2, "SQLite I/O error (%d): %s", v3, v4, v5, v6, v7);
}

void sub_10001B0B0(int a1)
{
  strerror(a1);
  sub_100014ABC();
  sub_100014AD4((void *)&_mh_execute_header, v1, v2, "SQLite error (%d): %s", v3, v4, v5, v6, v7);
}

double sub_10001B12C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100014A84((void *)&_mh_execute_header, a1, a3, "Prep time: %.3fms", a5, a6, a7, a8, 0);
  return result;
}

void sub_10001B1AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B1E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B21C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B254(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B2C0()
{
  __assert_rtn("-[CRSQLiteConnection beginTransactionWithType:]", "CRSQLiteConnection.m", 409, "NULL != _db");
}

void sub_10001B2EC()
{
}

void sub_10001B318()
{
  __assert_rtn("-[CRSQLiteConnection beginTransactionWithType:]", "CRSQLiteConnection.m", 431, "_transactionType == type");
}

void sub_10001B344()
{
  __assert_rtn("-[CRSQLiteConnection commitTransaction]", "CRSQLiteConnection.m", 443, "NULL != _db");
}

void sub_10001B370()
{
  __assert_rtn("-[CRSQLiteConnection rollbackTransaction]", "CRSQLiteConnection.m", 458, "NULL != _db");
}

void sub_10001B39C()
{
  __assert_rtn("vfsQueue", "CRSQLiteConnection.m", 120, "_vfsQueue != NULL");
}

void sub_10001B3C8()
{
}

void sub_10001B3F4()
{
  __assert_rtn("-[CRSQLiteConnectionPool checkInConnection:]", "CRSQLiteConnectionPool.m", 181, "nil != connectionWrapper");
}

void sub_10001B420(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B48C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B4F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B564(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error deleting database at path %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_10001B5EC()
{
}

void sub_10001B618()
{
  __assert_rtn("-[NSCompoundPredicate(PredicateBindings) cr_simplifiedPredicateSingleStep]", "NSPredicateBindings.m", 304, "1 == count");
}

void sub_10001B644()
{
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return _CFLocaleCreateCanonicalLanguageIdentifierFromString(allocator, localeIdentifier);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

uint64_t CFPhoneNumberCreate()
{
  return _CFPhoneNumberCreate();
}

uint64_t CFPhoneNumberCreateString()
{
  return _CFPhoneNumberCreateString();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

uint64_t CPFileBuildDirectoriesToPath()
{
  return _CPFileBuildDirectoriesToPath();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return _CPPhoneNumberCopyActiveCountryCode();
}

uint64_t CPPowerAssertionCreate()
{
  return _CPPowerAssertionCreate();
}

uint64_t CPSharedResourcesDirectory()
{
  return _CPSharedResourcesDirectory();
}

uint64_t CPSystemRootDirectory()
{
  return _CPSystemRootDirectory();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSPopAutoreleasePool()
{
  return _NSPopAutoreleasePool();
}

uint64_t NSPushAutoreleasePool()
{
  return _NSPushAutoreleasePool();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PNCopyBestGuessNormalizedNumberForCountry()
{
  return _PNCopyBestGuessNormalizedNumberForCountry();
}

uint64_t SBGetScreenLockStatus()
{
  return _SBGetScreenLockStatus();
}

uint64_t SBSSpringBoardServerPort()
{
  return _SBSSpringBoardServerPort();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _PNCopyIndexStringsForAddressBookSearch()
{
  return __PNCopyIndexStringsForAddressBookSearch();
}

uint64_t _PNCreateStringByStrippingFormattingAndNotVisiblyAllowable()
{
  return __PNCreateStringByStrippingFormattingAndNotVisiblyAllowable();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
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

void abort(void)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
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
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_copy_description()
{
  return _os_transaction_copy_description();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_main_np(void)
{
  return _pthread_main_np();
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return _sel_isEqual(lhs, rhs);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return _sqlite3_bind_parameter_index(a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return _sqlite3_busy_timeout(a1, ms);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return _sqlite3_create_function(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return _sqlite3_create_function_v2(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal, xDestroy);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return _sqlite3_extended_result_codes(a1, onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return _sqlite3_file_control(a1, zDbName, op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return _sqlite3_user_data(a1);
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return _sqlite3_value_int(a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return _sqlite3_value_text(a1);
}

sqlite3_vfs *__cdecl sqlite3_vfs_find(const char *zVfsName)
{
  return _sqlite3_vfs_find(zVfsName);
}

int sqlite3_vfs_register(sqlite3_vfs *a1, int makeDflt)
{
  return _sqlite3_vfs_register(a1, makeDflt);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return _u_errorName(code);
}

UBool u_isUUppercase(UChar32 c)
{
  return _u_isUUppercase(c);
}

UChar *__cdecl u_strFromUTF8(UChar *dest, int32_t destCapacity, int32_t *pDestLength, const char *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return _u_strFromUTF8(dest, destCapacity, pDestLength, src, srcLength, pErrorCode);
}

uint64_t ubrk_close()
{
  return _ubrk_close();
}

uint64_t ubrk_isBoundary()
{
  return _ubrk_isBoundary();
}

uint64_t ubrk_open()
{
  return _ubrk_open();
}

uint64_t ubrk_setText()
{
  return _ubrk_setText();
}

uint64_t ucol_open()
{
  return _ucol_open();
}

uint64_t ucol_setAttribute()
{
  return _ucol_setAttribute();
}

uint64_t ucol_setStrength()
{
  return _ucol_setStrength();
}

uint64_t uloc_setKeywordValue()
{
  return _uloc_setKeywordValue();
}

uint64_t usearch_close()
{
  return _usearch_close();
}

uint64_t usearch_first()
{
  return _usearch_first();
}

uint64_t usearch_getMatchedLength()
{
  return _usearch_getMatchedLength();
}

uint64_t usearch_last()
{
  return _usearch_last();
}

uint64_t usearch_next()
{
  return _usearch_next();
}

uint64_t usearch_openFromCollator()
{
  return _usearch_openFromCollator();
}

uint64_t usearch_setPattern()
{
  return _usearch_setPattern();
}

uint64_t usearch_setText()
{
  return _usearch_setText();
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

UText *__cdecl utext_close(UText *ut)
{
  return _utext_close(ut);
}

UBool utext_moveIndex32(UText *ut, int32_t delta)
{
  return _utext_moveIndex32(ut, delta);
}

UChar32 utext_next32(UText *ut)
{
  return _utext_next32(ut);
}

UText *__cdecl utext_openUChars(UText *ut, const UChar *s, int64_t length, UErrorCode *status)
{
  return _utext_openUChars(ut, s, length, status);
}

void utext_setNativeIndex(UText *ut, int64_t nativeIndex)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_XPCInterface(void *a1, const char *a2, ...)
{
  return [a1 XPCInterface];
}

id objc_msgSend__activeConnectionWrapper(void *a1, const char *a2, ...)
{
  return [a1 _activeConnectionWrapper];
}

id objc_msgSend__allDomains(void *a1, const char *a2, ...)
{
  return [a1 _allDomains];
}

id objc_msgSend__analyzeMailAccounts(void *a1, const char *a2, ...)
{
  return [a1 _analyzeMailAccounts];
}

id objc_msgSend__handleCorruptDatabase(void *a1, const char *a2, ...)
{
  return [a1 _handleCorruptDatabase];
}

id objc_msgSend__loadPlugins(void *a1, const char *a2, ...)
{
  return [a1 _loadPlugins];
}

id objc_msgSend__makeObservableForMailAccount(void *a1, const char *a2, ...)
{
  return [a1 _makeObservableForMailAccount];
}

id objc_msgSend__primaryiCloudAccountPersonID(void *a1, const char *a2, ...)
{
  return [a1 _primaryiCloudAccountPersonID];
}

id objc_msgSend__removeDatabase(void *a1, const char *a2, ...)
{
  return [a1 _removeDatabase];
}

id objc_msgSend__removeLocalRecordsForAllDomains(void *a1, const char *a2, ...)
{
  return [a1 _removeLocalRecordsForAllDomains];
}

id objc_msgSend__removeLocalRecordsForCloudStoresWithDataFromPreviousAccount(void *a1, const char *a2, ...)
{
  return [a1 _removeLocalRecordsForCloudStoresWithDataFromPreviousAccount];
}

id objc_msgSend__synchronizeAllStores(void *a1, const char *a2, ...)
{
  return [a1 _synchronizeAllStores];
}

id objc_msgSend__vfsModuleName(void *a1, const char *a2, ...)
{
  return [a1 _vfsModuleName];
}

id objc_msgSend_accountProperties(void *a1, const char *a2, ...)
{
  return [a1 accountProperties];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_allAddresses(void *a1, const char *a2, ...)
{
  return [a1 allAddresses];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeDatabaseConnections(void *a1, const char *a2, ...)
{
  return [a1 closeDatabaseConnections];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collection(void *a1, const char *a2, ...)
{
  return [a1 collection];
}

id objc_msgSend_commitTransaction(void *a1, const char *a2, ...)
{
  return [a1 commitTransaction];
}

id objc_msgSend_comparisonPredicateModifier(void *a1, const char *a2, ...)
{
  return [a1 comparisonPredicateModifier];
}

id objc_msgSend_completionHandlerAdapter(void *a1, const char *a2, ...)
{
  return [a1 completionHandlerAdapter];
}

id objc_msgSend_compoundPredicateType(void *a1, const char *a2, ...)
{
  return [a1 compoundPredicateType];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_constantValue(void *a1, const char *a2, ...)
{
  return [a1 constantValue];
}

id objc_msgSend_contactID(void *a1, const char *a2, ...)
{
  return [a1 contactID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyCountryCode(void *a1, const char *a2, ...)
{
  return [a1 copyCountryCode];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countOfRecents(void *a1, const char *a2, ...)
{
  return [a1 countOfRecents];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_customSelector(void *a1, const char *a2, ...)
{
  return [a1 customSelector];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_db(void *a1, const char *a2, ...)
{
  return [a1 db];
}

id objc_msgSend_decrementRefcount(void *a1, const char *a2, ...)
{
  return [a1 decrementRefcount];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultPath(void *a1, const char *a2, ...)
{
  return [a1 defaultPath];
}

id objc_msgSend_defaultPluginPath(void *a1, const char *a2, ...)
{
  return [a1 defaultPluginPath];
}

id objc_msgSend_defaultProvider(void *a1, const char *a2, ...)
{
  return [a1 defaultProvider];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return [a1 domains];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_expressionType(void *a1, const char *a2, ...)
{
  return [a1 expressionType];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_generation(void *a1, const char *a2, ...)
{
  return [a1 generation];
}

id objc_msgSend_groupKind(void *a1, const char *a2, ...)
{
  return [a1 groupKind];
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return [a1 groupName];
}

id objc_msgSend_hadError(void *a1, const char *a2, ...)
{
  return [a1 hadError];
}

id objc_msgSend_implicitGroupThreshold(void *a1, const char *a2, ...)
{
  return [a1 implicitGroupThreshold];
}

id objc_msgSend_incrementRefcount(void *a1, const char *a2, ...)
{
  return [a1 incrementRefcount];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return [a1 isAtEnd];
}

id objc_msgSend_isGroup(void *a1, const char *a2, ...)
{
  return [a1 isGroup];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isOpen(void *a1, const char *a2, ...)
{
  return [a1 isOpen];
}

id objc_msgSend_isUsingiCloud(void *a1, const char *a2, ...)
{
  return [a1 isUsingiCloud];
}

id objc_msgSend_isWriter(void *a1, const char *a2, ...)
{
  return [a1 isWriter];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_kindPredicates(void *a1, const char *a2, ...)
{
  return [a1 kindPredicates];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastSendingAddress(void *a1, const char *a2, ...)
{
  return [a1 lastSendingAddress];
}

id objc_msgSend_leftExpression(void *a1, const char *a2, ...)
{
  return [a1 leftExpression];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return [a1 library];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mailAccounts(void *a1, const char *a2, ...)
{
  return [a1 mailAccounts];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_members(void *a1, const char *a2, ...)
{
  return [a1 members];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_mostRecentDate(void *a1, const char *a2, ...)
{
  return [a1 mostRecentDate];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needsRebuild(void *a1, const char *a2, ...)
{
  return [a1 needsRebuild];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_noteNeedsRebuild(void *a1, const char *a2, ...)
{
  return [a1 noteNeedsRebuild];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return [a1 objCType];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_originalSource(void *a1, const char *a2, ...)
{
  return [a1 originalSource];
}

id objc_msgSend_pageRange(void *a1, const char *a2, ...)
{
  return [a1 pageRange];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return [a1 predicate];
}

id objc_msgSend_predicateOperatorType(void *a1, const char *a2, ...)
{
  return [a1 predicateOperatorType];
}

id objc_msgSend_predicates(void *a1, const char *a2, ...)
{
  return [a1 predicates];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_readerConnection(void *a1, const char *a2, ...)
{
  return [a1 readerConnection];
}

id objc_msgSend_recentDates(void *a1, const char *a2, ...)
{
  return [a1 recentDates];
}

id objc_msgSend_recentID(void *a1, const char *a2, ...)
{
  return [a1 recentID];
}

id objc_msgSend_recentsDomain(void *a1, const char *a2, ...)
{
  return [a1 recentsDomain];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rightExpression(void *a1, const char *a2, ...)
{
  return [a1 rightExpression];
}

id objc_msgSend_rollbackTransaction(void *a1, const char *a2, ...)
{
  return [a1 rollbackTransaction];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sanitizedDescription(void *a1, const char *a2, ...)
{
  return [a1 sanitizedDescription];
}

id objc_msgSend_senderEmailAddresses(void *a1, const char *a2, ...)
{
  return [a1 senderEmailAddresses];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_storeMapping(void *a1, const char *a2, ...)
{
  return [a1 storeMapping];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByAbbreviatingWithTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByAbbreviatingWithTildeInPath];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_subpredicates(void *a1, const char *a2, ...)
{
  return [a1 subpredicates];
}

id objc_msgSend_supportedAddressKinds(void *a1, const char *a2, ...)
{
  return [a1 supportedAddressKinds];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_threadDictionary(void *a1, const char *a2, ...)
{
  return [a1 threadDictionary];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_wantsGroups(void *a1, const char *a2, ...)
{
  return [a1 wantsGroups];
}

id objc_msgSend_weight(void *a1, const char *a2, ...)
{
  return [a1 weight];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_writer(void *a1, const char *a2, ...)
{
  return [a1 writer];
}

id objc_msgSend_writerConnection(void *a1, const char *a2, ...)
{
  return [a1 writerConnection];
}