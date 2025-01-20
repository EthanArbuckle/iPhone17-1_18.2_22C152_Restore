@interface SKGUpdaterStore
+ (id)instanceForIndexType:(int)a3;
+ (id)lock;
+ (id)stores;
+ (void)flushAndCommitAll;
+ (void)purgeAllWithUUID:(id)a3 listenerType:(int)a4 indexType:(int)a5;
- (BOOL)checkPriorityForBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6 defaultIfNotExists:(BOOL)a7;
- (BOOL)enumerateItems:(id)a3;
- (BOOL)flushAndCommit;
- (BOOL)markForDeleteDBO:(db_obj *)a3 purgeContext:(id *)a4;
- (BOOL)markPriorityForBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6 flag:(BOOL)a7;
- (BOOL)removePriorityForBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6;
- (BOOL)writeLanguageForBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6 language:(const char *)a7;
- (BOOL)writeSerialNumberToBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6 listenerType:(int)a7;
- (BOOL)writeUpdaterStatus:(int)a3 UUID:(const char *)a4 serialNumber:(unint64_t)a5;
- (SKGUpdaterStore)initWithParentFd:(int)a3 indexType:(int)a4;
- (db_obj)getDBOWithOID:(int64_t)a3;
- (id)readLanguageFromBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6;
- (unint64_t)readSerialNumberFromBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 listenerType:(int)a6;
- (unint64_t)readUpdaterStatus:(int)a3 UUID:(const char *)a4;
- (void)closeAndDeleteStore;
- (void)dealloc;
- (void)purgeAllWithUUID:(id)a3 listenerType:(int)a4;
- (void)purgeAllWithUUIDImpl:(id)a3 listenerType:(int)a4;
- (void)setProtectionClassForFolder:(int)a3 protectionClass:(int)a4;
@end

@implementation SKGUpdaterStore

- (BOOL)flushAndCommit
{
  db_lock_datastore();
  if (db_flush_datastore())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000A2B0C();
    }
    BOOL v2 = 0;
  }
  else
  {
    db_downgrade_datastore();
    BOOL v2 = 1;
  }
  db_unlock_datastore();
  return v2;
}

- (unint64_t)readUpdaterStatus:(int)a3 UUID:(const char *)a4
{
  uint64_t v5 = *(void *)&a3;
  [(NSLock *)self->systemOidLock lock];
  if ([(SKGUpdaterStore *)self getDBOWithOID:0])
  {
    id v7 = +[NSString stringWithFormat:@"%s:%u", a4, v5];
    [v7 UTF8String];
    if (db_get_field())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000A286C();
      }
      db_release_obj();
      [(NSLock *)self->systemOidLock unlock];
      unint64_t v8 = 0;
    }
    else
    {
      [(NSLock *)self->systemOidLock unlock];
      unint64_t v8 = MEMORY[0];
      db_release_obj();
    }
  }
  else
  {
    [(NSLock *)self->systemOidLock unlock];
    return 0;
  }
  return v8;
}

- (void)purgeAllWithUUIDImpl:(id)a3 listenerType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKGUpdaterStore[%@]#purgeAllWithUUID starting purge", buf, 0xCu);
  }
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v47 = v6;
  unint64_t v8 = -[SKGUpdaterStore readUpdaterStatus:UUID:](self, "readUpdaterStatus:UUID:", v4, [v47 UTF8String]);
  v9 = v7;
  if (v8)
  {
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3254779904;
    v63[2] = sub_100068364;
    v63[3] = &unk_1000DBAA0;
    v63[4] = self;
    unint64_t v65 = v8;
    int v66 = v4;
    id v67 = v47;
    id v48 = v67;
    id v10 = v7;
    id v64 = v10;
    [(SKGUpdaterStore *)self enumerateItems:v63];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v59 objects:v71 count:16];
    if (!v12)
    {
      uint64_t v40 = 0;
      goto LABEL_37;
    }
    uint64_t v13 = 0;
    uint64_t v46 = *(void *)v60;
    while (1)
    {
      v14 = 0;
      id v45 = v12;
      do
      {
        if (*(void *)v60 != v46) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v14);
        uint64_t v58 = 0;
        makeThreadId();
        atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
        int v57 = 0;
        unint64_t v56 = 0;
        unsigned int v55 = 0;
        long long v43 = sFdExceptionCallbacks[1];
        long long v44 = sFdExceptionCallbacks[0];
        *(_OWORD *)buf = sFdExceptionCallbacks[0];
        *(_OWORD *)&buf[16] = v43;
        long long v41 = sFdExceptionCallbacks[3];
        long long v42 = sFdExceptionCallbacks[2];
        long long v69 = v42;
        long long v70 = v41;
        uint64_t v16 = setThreadIdAndInfo();
        int v57 = v16;
        unint64_t v56 = __PAIR64__(HIDWORD(v16), v17);
        unsigned int v55 = v18;
        uint64_t v19 = threadData[9 * v16 + 1];
        uint64_t v20 = v19 + 320 * HIDWORD(v16);
        *(unsigned char *)(v20 + 216) = 0;
        int v21 = *(_DWORD *)(v20 + 312);
        v22 = *(void (**)(void))(v20 + 224);
        if (v22) {
          v22(*(void *)(v19 + 320 * HIDWORD(v16) + 288));
        }
        *(_DWORD *)buf = v57;
        unsigned int v54 = HIDWORD(v56);
        unint64_t v53 = __PAIR64__(v56, v55);
        if (_setjmp((int *)v20))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000A1A30(&v51, v52);
          }
          *(_DWORD *)(v20 + 312) = v21;
          CIOnThreadCleanUpReset();
          dropThreadId();
          CICleanUpReset();
LABEL_15:
          atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
          int v57 = 0;
          unint64_t v56 = 0;
          unsigned int v55 = 0;
          *(_OWORD *)buf = v44;
          *(_OWORD *)&buf[16] = v43;
          long long v69 = v42;
          long long v70 = v41;
          uint64_t v23 = setThreadIdAndInfo();
          int v57 = v23;
          unint64_t v56 = __PAIR64__(HIDWORD(v23), v24);
          unsigned int v55 = v25;
          uint64_t v26 = threadData[9 * v23 + 1];
          uint64_t v27 = v26 + 320 * HIDWORD(v23);
          *(unsigned char *)(v27 + 216) = 0;
          int v28 = *(_DWORD *)(v27 + 312);
          v29 = *(void (**)(void))(v27 + 224);
          if (v29) {
            v29(*(void *)(v26 + 320 * HIDWORD(v23) + 288));
          }
          *(_DWORD *)buf = v57;
          unsigned int v54 = HIDWORD(v56);
          unint64_t v53 = __PAIR64__(v56, v55);
          if (_setjmp((int *)v27))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1000A1A30(&v49, v50);
            }
            *(_DWORD *)(v27 + 312) = v28;
            CIOnThreadCleanUpReset();
            dropThreadId();
            CICleanUpReset();
            goto LABEL_21;
          }
          int v35 = db_delete_obj();
          uint64_t v36 = threadData[9 * *(unsigned int *)buf + 1];
          unsigned int v37 = v54;
          uint64_t v38 = v36 + 320 * v54;
          *(_DWORD *)(v38 + 312) = v28;
          v39 = *(void (**)(void))(v38 + 232);
          if (v39) {
            v39(*(void *)(v36 + 320 * v37 + 288));
          }
          dropThreadId();
          if (v35)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v35;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SKGUpdaterStore[%@]#purgeAllWithUUID failed to delete dbo with rc: %d", buf, 0x12u);
            }
          }
          else
          {
LABEL_21:
            ++v13;
          }
          db_release_obj();
          goto LABEL_33;
        }
        [v15 longLongValue];
        int obj = db_get_obj();
        uint64_t v31 = threadData[9 * *(unsigned int *)buf + 1];
        unsigned int v32 = v54;
        uint64_t v33 = v31 + 320 * v54;
        *(_DWORD *)(v33 + 312) = v21;
        v34 = *(void (**)(void))(v33 + 232);
        if (v34) {
          v34(*(void *)(v31 + 320 * v32 + 288));
        }
        dropThreadId();
        if (!obj) {
          goto LABEL_15;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = obj;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SKGUpdaterStore[%@]#purgeAllWithUUID failed to get dbo with rc: %d", buf, 0x12u);
        }
LABEL_33:
        v14 = (char *)v14 + 1;
      }
      while (v45 != v14);
      uint64_t v40 = v13;
      id v12 = [v11 countByEnumeratingWithState:&v59 objects:v71 count:16];
      if (!v12)
      {
LABEL_37:

        [(SKGUpdaterStore *)self flushAndCommit];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v40;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SKGUpdaterStore[%@]#purgeAllWithUUID deleted %lld dbos", buf, 0x16u);
        }

        break;
      }
    }
  }
}

+ (void)purgeAllWithUUID:(id)a3 listenerType:(int)a4 indexType:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [a1 lock];
  [v9 lock];

  id v10 = [a1 stores];
  id v11 = [a1 lock];
  [v11 unlock];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = objc_msgSend(v10, "allValues", 0);
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        unsigned int v17 = *(_DWORD **)(*((void *)&v18 + 1) + 8 * (void)v16);
        if (v17 && v17[6] == a5) {
          [v17 purgeAllWithUUID:v8 listenerType:v6];
        }
        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

+ (id)instanceForIndexType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [a1 lock];
  [v5 lock];

  uint64_t v6 = [a1 stores];
  id v7 = +[NSNumber numberWithUnsignedInt:v3];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    v8[6] = v3;
    v9 = [a1 lock];
    [v9 unlock];

    id v10 = v8;
    goto LABEL_16;
  }
  id v11 = sub_100035504(v3);
  id v12 = +[NSFileManager defaultManager];
  unsigned __int8 v13 = [v12 fileExistsAtPath:v11];

  if ((v13 & 1) == 0)
  {
    id v14 = +[NSFileManager defaultManager];
    id v25 = 0;
    unsigned __int8 v15 = [v14 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v16 = v25;

    if ((v15 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000A2150();
      }
      uint64_t v23 = [a1 lock];
      [v23 unlock];

      goto LABEL_14;
    }
  }
  id v17 = v11;
  uint64_t v18 = open((const char *)[v17 fileSystemRepresentation], 0x100000);
  if (v18 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000A20B0(v17);
    }
    v22 = [a1 lock];
    [v22 unlock];

LABEL_14:
    id v10 = 0;
    goto LABEL_15;
  }
  id v19 = [objc_alloc((Class)a1) initWithParentFd:v18 indexType:v3];
  long long v20 = +[NSNumber numberWithUnsignedInt:v3];
  [v6 setObject:v19 forKeyedSubscript:v20];

  long long v21 = [a1 lock];
  [v21 unlock];

  id v10 = v19;
LABEL_15:

LABEL_16:

  return v10;
}

+ (id)lock
{
  if (qword_1000F9158 != -1) {
    dispatch_once(&qword_1000F9158, &stru_1000DBA78);
  }
  BOOL v2 = (void *)qword_1000F9150;

  return v2;
}

- (BOOL)writeUpdaterStatus:(int)a3 UUID:(const char *)a4 serialNumber:(unint64_t)a5
{
  uint64_t v6 = +[NSString stringWithFormat:@"%s:%u", a4, *(void *)&a3];
  [(NSLock *)self->systemOidLock lock];
  if (![(SKGUpdaterStore *)self getDBOWithOID:0])
  {
    [v6 length];
    int obj = (void *)db_create_obj();
    if (!obj)
    {
      BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v24) {
        sub_1000A272C(v24, v25, v26, v27, v28, v29, v30, v31);
      }
      goto LABEL_8;
    }
    *int obj = 0;
  }
  id v8 = v6;
  [v8 UTF8String];
  LODWORD(v36) = 8;
  if (!db_add_field())
  {
    makeThreadId();
    atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
    uint64_t v10 = setThreadIdAndInfo();
    unsigned int v37 = HIDWORD(v10);
    unsigned int v38 = v10;
    uint64_t v11 = threadData[9 * v10 + 1];
    uint64_t v12 = v11 + 320 * HIDWORD(v10);
    *(unsigned char *)(v12 + 216) = 0;
    int v13 = *(_DWORD *)(v12 + 312);
    id v14 = *(void (**)(void))(v12 + 224);
    if (v14) {
      v14(*(void *)(v11 + 320 * HIDWORD(v10) + 288));
    }
    if (_setjmp((int *)v12))
    {
      BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v15) {
        sub_1000A2328(v15, v16, v17, v18, v19, v20, v21, v22);
      }
      *(_DWORD *)(v12 + 312) = v13;
      CIOnThreadCleanUpReset();
      dropThreadId();
      CICleanUpReset();
    }
    else
    {
      int v32 = db_store_obj();
      uint64_t v33 = threadData[9 * v38 + 1];
      uint64_t v34 = v33 + 320 * v37;
      *(_DWORD *)(v34 + 312) = v13;
      int v35 = *(void (**)(void))(v34 + 232);
      if (v35) {
        v35(*(void *)(v33 + 320 * v37 + 288));
      }
      dropThreadId();
      if (v32)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000A2768();
        }
        goto LABEL_7;
      }
    }
    [(NSLock *)self->systemOidLock unlock];
    db_release_obj();
    BOOL v9 = 1;
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000A27D8(v8);
  }
LABEL_7:
  db_release_obj();
LABEL_8:
  [(NSLock *)self->systemOidLock unlock];
  BOOL v9 = 0;
LABEL_16:

  return v9;
}

- (db_obj)getDBOWithOID:(int64_t)a3
{
  makeThreadId();
  atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
  uint64_t v3 = setThreadIdAndInfo();
  unsigned int v21 = HIDWORD(v3);
  unsigned int v22 = v3;
  uint64_t v4 = threadData[9 * v3 + 1];
  uint64_t v5 = v4 + 320 * HIDWORD(v3);
  *(unsigned char *)(v5 + 216) = 0;
  int v6 = *(_DWORD *)(v5 + 312);
  id v7 = *(void (**)(void))(v5 + 224);
  if (v7) {
    v7(*(void *)(v4 + 320 * HIDWORD(v3) + 288));
  }
  if (_setjmp((int *)v5))
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_1000A2328(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    *(_DWORD *)(v5 + 312) = v6;
    CIOnThreadCleanUpReset();
    dropThreadId();
    CICleanUpReset();
    return 0;
  }
  int obj = db_get_obj();
  uint64_t v17 = threadData[9 * v22 + 1];
  uint64_t v18 = v17 + 320 * v21;
  *(_DWORD *)(v18 + 312) = v6;
  uint64_t v19 = *(void (**)(void))(v18 + 232);
  if (v19) {
    v19(*(void *)(v17 + 320 * v21 + 288));
  }
  dropThreadId();
  if (obj)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000A2B7C();
    }
    return 0;
  }
  return 0;
}

+ (id)stores
{
  if (qword_1000F9148 != -1) {
    dispatch_once(&qword_1000F9148, &stru_1000DBA58);
  }
  BOOL v2 = (void *)qword_1000F9140;

  return v2;
}

- (void)purgeAllWithUUID:(id)a3 listenerType:(int)a4
{
  p_purgeInProgress = &self->purgeInProgress;
  if ((atomic_exchange(&self->purgeInProgress._Value, 1u) & 1) == 0)
  {
    [(SKGUpdaterStore *)self purgeAllWithUUIDImpl:a3 listenerType:*(void *)&a4];
    atomic_store(0, (unsigned __int8 *)p_purgeInProgress);
  }
}

- (BOOL)enumerateItems:(id)a3
{
  id v3 = a3;
  makeThreadId();
  atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
  uint64_t v4 = setThreadIdAndInfo();
  unsigned int v21 = HIDWORD(v4);
  unsigned int v22 = v4;
  uint64_t v5 = threadData[9 * v4 + 1];
  uint64_t v6 = v5 + 320 * HIDWORD(v4);
  *(unsigned char *)(v6 + 216) = 0;
  int v7 = *(_DWORD *)(v6 + 312);
  BOOL v8 = *(void (**)(void))(v6 + 224);
  if (v8) {
    v8(*(void *)(v5 + 320 * HIDWORD(v4) + 288));
  }
  if (_setjmp((int *)v6))
  {
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9) {
      sub_1000A2328(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    *(_DWORD *)(v6 + 312) = v7;
    CIOnThreadCleanUpReset();
    dropThreadId();
    CICleanUpReset();
  }
  else
  {
    db_iterate_objects_in_range();
    uint64_t v17 = threadData[9 * v22 + 1];
    uint64_t v18 = v17 + 320 * v21;
    *(_DWORD *)(v18 + 312) = v7;
    uint64_t v19 = *(void (**)(void))(v18 + 232);
    if (v19) {
      v19(*(void *)(v17 + 320 * v21 + 288));
    }
    dropThreadId();
  }

  return 1;
}

+ (void)flushAndCommitAll
{
  id v3 = [a1 lock];
  [v3 lock];

  uint64_t v4 = [a1 stores];
  uint64_t v5 = [a1 lock];
  [v5 unlock];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = objc_msgSend(v4, "allValues", 0);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) flushAndCommit];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (SKGUpdaterStore)initWithParentFd:(int)a3 indexType:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  v30.receiver = self;
  v30.super_class = (Class)SKGUpdaterStore;
  uint64_t v6 = [(SKGUpdaterStore *)&v30 init];
  if (!v6) {
    goto LABEL_14;
  }
  id v7 = (NSLock *)objc_alloc_init((Class)NSLock);
  systemOidLock = v6->systemOidLock;
  v6->systemOidLock = v7;

  atomic_store(0, (unsigned __int8 *)&v6->purgeInProgress);
  int v9 = check_crash_state();
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000A2230();
    }
    bzero(v42, 0x400uLL);
    bzero(v41, 0x414uLL);
    sub_10004F448(v5, v42);
    close(v5);
    __sprintf_chk(v41, 0, 0x414uLL, "%s_corrupt", v42);
    long long v11 = +[NSFileManager defaultManager];
    long long v12 = +[NSString stringWithUTF8String:v41];
    [v11 removeItemAtPath:v12 error:0];

    long long v13 = +[NSFileManager defaultManager];
    long long v14 = +[NSString stringWithUTF8String:v42];
    uint64_t v15 = +[NSString stringWithUTF8String:v41];
    id v29 = 0;
    [v13 moveItemAtPath:v14 toPath:v15 error:&v29];
    id v16 = v29;

    if (v16)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        int v32 = v42;
        __int16 v33 = 2080;
        uint64_t v34 = v41;
        __int16 v35 = 1024;
        int v36 = a4;
        __int16 v37 = 1024;
        int v38 = v10;
        __int16 v39 = 2112;
        id v40 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SKGUpdaterStore#initWithParentFd unable to move %s to %s, indexType:%d, crash_state:%d err:%@", buf, 0x2Cu);
      }
      uint64_t v17 = +[NSFileManager defaultManager];
      uint64_t v18 = +[NSString stringWithUTF8String:v42];
      [v17 removeItemAtPath:v18 error:0];
    }
    uint64_t v19 = sub_100035504(a4);

    uint64_t v20 = +[NSFileManager defaultManager];
    id v28 = 0;
    unsigned __int8 v21 = [v20 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:0 error:&v28];
    id v22 = v28;

    if ((v21 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000A2150();
      }

      goto LABEL_20;
    }
    id v23 = v19;
    uint64_t v5 = open((const char *)[v23 fileSystemRepresentation], 0x100000);
  }
  v6->_parentFd = v5;
  name = v6->_name;
  v6->_name = (NSString *)@"skg_store.db";

  si_init_indexing_zone();
  [(SKGUpdaterStore *)v6 setProtectionClassForFolder:v5 protectionClass:3];
  uint64_t datastore = db_get_datastore();
  if (!datastore)
  {
    uint64_t datastore = db_create_datastore();
    if (!datastore)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000A21C0();
      }
LABEL_20:
      uint64_t v26 = 0;
      goto LABEL_21;
    }
  }
  v6->_dsi = (datastore_info *)datastore;
  v6->_indexType = a4;
LABEL_14:
  uint64_t v26 = v6;
LABEL_21:

  return v26;
}

- (void)dealloc
{
  if (self->_dsi)
  {
    [(SKGUpdaterStore *)self flushAndCommit];
    db_release_datastore();
  }
  int parentFd = self->_parentFd;
  if (parentFd) {
    close(parentFd);
  }
  v4.receiver = self;
  v4.super_class = (Class)SKGUpdaterStore;
  [(SKGUpdaterStore *)&v4 dealloc];
}

- (BOOL)writeSerialNumberToBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6 listenerType:(int)a7
{
  int v9 = +[NSString stringWithFormat:@"%s:%s:%u", "SerialNumber", a5, *(void *)&a7];
  uint64_t obj = db_create_obj();
  if (obj)
  {
    long long v11 = (void *)obj;
    strlen(a4);
    strlen(a3);
    *long long v11 = si_compute_oid_for_identifier_bundle_id();
    [v9 UTF8String];
    if (db_add_field())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000A2364();
      }
    }
    else
    {
      makeThreadId();
      atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
      uint64_t v13 = setThreadIdAndInfo();
      unsigned int v31 = HIDWORD(v13);
      unsigned int v32 = v13;
      uint64_t v14 = threadData[9 * v13 + 1];
      uint64_t v15 = v14 + 320 * HIDWORD(v13);
      *(unsigned char *)(v15 + 216) = 0;
      int v16 = *(_DWORD *)(v15 + 312);
      uint64_t v17 = *(void (**)(void))(v15 + 224);
      if (v17) {
        v17(*(void *)(v14 + 320 * HIDWORD(v13) + 288));
      }
      if (_setjmp((int *)v15))
      {
        BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v18) {
          sub_1000A2328(v18, v19, v20, v21, v22, v23, v24, v25);
        }
        *(_DWORD *)(v15 + 312) = v16;
        CIOnThreadCleanUpReset();
        BOOL v12 = 1;
        dropThreadId();
        CICleanUpReset();
        goto LABEL_13;
      }
      int v27 = db_store_obj();
      uint64_t v28 = threadData[9 * v32 + 1];
      uint64_t v29 = v28 + 320 * v31;
      *(_DWORD *)(v29 + 312) = v16;
      objc_super v30 = *(void (**)(void))(v29 + 232);
      if (v30) {
        v30(*(void *)(v28 + 320 * v31 + 288));
      }
      dropThreadId();
      if (!v27)
      {
        BOOL v12 = 1;
        goto LABEL_13;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000A22B8();
      }
    }
    BOOL v12 = 0;
LABEL_13:
    db_release_obj();
    goto LABEL_14;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (unint64_t)readSerialNumberFromBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 listenerType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  strlen(a4);
  strlen(a3);
  si_compute_oid_for_identifier_bundle_id();
  makeThreadId();
  atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
  uint64_t v9 = setThreadIdAndInfo();
  uint64_t v10 = v9;
  uint64_t v11 = threadData[9 * v9 + 1];
  uint64_t v12 = v11 + 320 * HIDWORD(v9);
  *(unsigned char *)(v12 + 216) = 0;
  int v13 = *(_DWORD *)(v12 + 312);
  uint64_t v14 = *(void (**)(void))(v12 + 224);
  if (v14) {
    v14(*(void *)(v11 + 320 * HIDWORD(v9) + 288));
  }
  if (_setjmp((int *)v12))
  {
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v15) {
      sub_1000A2328(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    *(_DWORD *)(v12 + 312) = v13;
    CIOnThreadCleanUpReset();
    dropThreadId();
    CICleanUpReset();
  }
  else
  {
    int obj = db_get_obj();
    uint64_t v29 = threadData[9 * v10 + 1];
    uint64_t v30 = v29 + 320 * HIDWORD(v10);
    *(_DWORD *)(v30 + 312) = v13;
    unsigned int v31 = *(void (**)(void))(v30 + 232);
    if (v31) {
      v31(*(void *)(v29 + 320 * HIDWORD(v10) + 288));
    }
    dropThreadId();
    if (obj) {
      return 0;
    }
  }
  id v23 = +[NSString stringWithFormat:@"%s:%s:%u", "SerialNumber", a5, v6];
  [v23 UTF8String];
  int field = db_get_field();
  unint64_t v25 = 0;
  if (!field) {
    unint64_t v25 = MEMORY[0];
  }
  unint64_t v26 = v25;
  db_release_obj();

  return v26;
}

- (BOOL)markPriorityForBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6 flag:(BOOL)a7
{
  uint64_t v10 = +[NSString stringWithFormat:@"%s:%s:", "Priority", a5];
  [v10 length];
  uint64_t obj = db_create_obj();
  if (obj)
  {
    id v52 = v10;
    uint64_t v12 = (void *)obj;
    int v13 = +[NSString stringWithFormat:@"%s:%llu:%s", "Priority", a6, a3];
    strlen(a4);
    id v14 = v13;
    [v14 UTF8String];
    id v15 = v14;
    strlen((const char *)[v15 UTF8String]);
    *uint64_t v12 = si_compute_oid_for_identifier_bundle_id();
    makeThreadId();
    atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
    uint64_t v16 = setThreadIdAndInfo();
    unsigned int v53 = HIDWORD(v16);
    unsigned int v55 = v16;
    uint64_t v17 = threadData[9 * v16 + 1];
    uint64_t v18 = v17 + 320 * HIDWORD(v16);
    *(unsigned char *)(v18 + 216) = 0;
    int v19 = *(_DWORD *)(v18 + 312);
    uint64_t v20 = *(void (**)(void))(v18 + 224);
    if (v20) {
      v20(*(void *)(v17 + 320 * HIDWORD(v16) + 288));
    }
    uint64_t v10 = v52;
    if (_setjmp((int *)v18))
    {
      BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v21) {
        sub_1000A2328(v21, v22, v23, v24, v25, v26, v27, v28);
      }
      *(_DWORD *)(v18 + 312) = v19;
      CIOnThreadCleanUpReset();
      dropThreadId();
      CICleanUpReset();
    }
    else
    {
      [v52 UTF8String];
      int v43 = db_add_field();
      uint64_t v44 = threadData[9 * v55 + 1];
      uint64_t v45 = v44 + 320 * v53;
      *(_DWORD *)(v45 + 312) = v19;
      uint64_t v46 = *(void (**)(void))(v45 + 232);
      if (v46) {
        v46(*(void *)(v44 + 320 * v53 + 288));
      }
      dropThreadId();
      if (v43)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000A2444();
        }
        goto LABEL_25;
      }
    }
    atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
    uint64_t v29 = setThreadIdAndInfo();
    unsigned int v54 = HIDWORD(v29);
    unsigned int v56 = v29;
    uint64_t v30 = threadData[9 * v29 + 1];
    uint64_t v31 = v30 + 320 * HIDWORD(v29);
    *(unsigned char *)(v31 + 216) = 0;
    int v32 = *(_DWORD *)(v31 + 312);
    __int16 v33 = *(void (**)(void))(v31 + 224);
    if (v33) {
      v33(*(void *)(v30 + 320 * HIDWORD(v29) + 288));
    }
    if (_setjmp((int *)v31))
    {
      BOOL v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v34) {
        sub_1000A2328(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      *(_DWORD *)(v31 + 312) = v32;
      CIOnThreadCleanUpReset();
      BOOL v42 = 1;
      dropThreadId();
      CICleanUpReset();
      goto LABEL_27;
    }
    int v47 = db_store_obj();
    uint64_t v48 = threadData[9 * v56 + 1];
    uint64_t v49 = v48 + 320 * v54;
    *(_DWORD *)(v49 + 312) = v32;
    v50 = *(void (**)(void))(v49 + 232);
    if (v50) {
      v50(*(void *)(v48 + 320 * v54 + 288));
    }
    dropThreadId();
    if (!v47)
    {
      BOOL v42 = 1;
      goto LABEL_27;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000A23D4();
    }
LABEL_25:
    BOOL v42 = 0;
LABEL_27:
    db_release_obj();

    goto LABEL_28;
  }
  BOOL v42 = 0;
LABEL_28:

  return v42;
}

- (BOOL)checkPriorityForBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6 defaultIfNotExists:(BOOL)a7
{
  uint64_t v12 = +[NSString stringWithFormat:@"%s:%s:", "Priority", a5];
  int v13 = +[NSString stringWithFormat:@"%s:%llu:%s", "Priority", a6, a3];
  strlen(a4);
  id v14 = v13;
  [v14 UTF8String];
  id v15 = v14;
  strlen((const char *)[v15 UTF8String]);
  if ([(SKGUpdaterStore *)self getDBOWithOID:si_compute_oid_for_identifier_bundle_id()])
  {
    [v12 UTF8String];
    if (db_get_field()) {
      db_release_obj();
    }
    else {
      a7 = MEMORY[0] == 1;
    }
  }

  return a7;
}

- (BOOL)removePriorityForBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6
{
  id v8 = +[NSString stringWithFormat:@"%s:%llu:%s", a4, a5, "Priority", a6, a3];
  strlen(a4);
  id v9 = v8;
  [v9 UTF8String];
  id v10 = v9;
  strlen((const char *)[v10 UTF8String]);
  uint64_t v11 = si_compute_oid_for_identifier_bundle_id();
  if ([(SKGUpdaterStore *)self getDBOWithOID:v11])
  {
    makeThreadId();
    atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
    uint64_t v12 = setThreadIdAndInfo();
    unsigned int v31 = HIDWORD(v12);
    unsigned int v32 = v12;
    uint64_t v13 = threadData[9 * v12 + 1];
    uint64_t v14 = v13 + 320 * HIDWORD(v12);
    *(unsigned char *)(v14 + 216) = 0;
    int v15 = *(_DWORD *)(v14 + 312);
    uint64_t v16 = *(void (**)(void))(v14 + 224);
    if (v16) {
      v16(*(void *)(v13 + 320 * HIDWORD(v12) + 288));
    }
    if (_setjmp((int *)v14))
    {
      BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v17) {
        sub_1000A2328(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      *(_DWORD *)(v14 + 312) = v15;
      CIOnThreadCleanUpReset();
      BOOL v25 = 1;
      dropThreadId();
      CICleanUpReset();
    }
    else
    {
      int v26 = db_delete_obj();
      uint64_t v27 = threadData[9 * v32 + 1];
      uint64_t v28 = v27 + 320 * v31;
      *(_DWORD *)(v28 + 312) = v15;
      uint64_t v29 = *(void (**)(void))(v28 + 232);
      if (v29) {
        v29(*(void *)(v27 + 320 * v31 + 288));
      }
      dropThreadId();
      if (v26)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000A24B4((uint64_t)self, v11, v26);
        }
        BOOL v25 = 0;
      }
      else
      {
        BOOL v25 = 1;
      }
    }
  }
  else
  {
    BOOL v25 = 1;
  }

  return v25;
}

- (BOOL)writeLanguageForBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6 language:(const char *)a7
{
  if ((unint64_t)__strlcpy_chk() < 0x10)
  {
    uint64_t v13 = +[NSString stringWithFormat:@"%s:%s", "Language", a5];
    strlen(a4);
    strlen(a3);
    uint64_t v14 = si_compute_oid_for_identifier_bundle_id();
    uint64_t obj = [(SKGUpdaterStore *)self getDBOWithOID:v14];
    if (!obj)
    {
      char v16 = 0;
      uint64_t obj = (db_obj *)db_create_obj();
      if (!obj) {
        goto LABEL_17;
      }
    }
    obj->var0 = v14;
    [v13 UTF8String];
    if (db_add_field())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000A263C();
      }
    }
    else
    {
      makeThreadId();
      atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
      uint64_t v17 = setThreadIdAndInfo();
      unsigned int v35 = HIDWORD(v17);
      unsigned int v36 = v17;
      uint64_t v18 = threadData[9 * v17 + 1];
      uint64_t v19 = v18 + 320 * HIDWORD(v17);
      *(unsigned char *)(v19 + 216) = 0;
      int v20 = *(_DWORD *)(v19 + 312);
      uint64_t v21 = *(void (**)(void))(v19 + 224);
      if (v21) {
        v21(*(void *)(v18 + 320 * HIDWORD(v17) + 288));
      }
      if (_setjmp((int *)v19))
      {
        BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v22) {
          sub_1000A2328(v22, v23, v24, v25, v26, v27, v28, v29);
        }
        *(_DWORD *)(v19 + 312) = v20;
        CIOnThreadCleanUpReset();
        char v16 = 1;
        dropThreadId();
        CICleanUpReset();
        goto LABEL_16;
      }
      int v30 = db_store_obj();
      uint64_t v31 = threadData[9 * v36 + 1];
      uint64_t v32 = v31 + 320 * v35;
      *(_DWORD *)(v32 + 312) = v20;
      __int16 v33 = *(void (**)(void))(v32 + 232);
      if (v33) {
        v33(*(void *)(v31 + 320 * v35 + 288));
      }
      dropThreadId();
      if (!v30)
      {
        char v16 = 1;
        goto LABEL_16;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000A25CC();
      }
    }
    char v16 = 0;
LABEL_16:
    db_release_obj();
LABEL_17:

    LOBYTE(v12) = v16;
    return v12;
  }
  BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v12)
  {
    sub_1000A254C((uint64_t)a7);
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (id)readLanguageFromBundleID:(const char *)a3 identifier:(const char *)a4 UUID:(const char *)a5 serialNumber:(unint64_t)a6
{
  strlen(a4);
  strlen(a3);
  si_compute_oid_for_identifier_bundle_id();
  makeThreadId();
  atomic_fetch_add_explicit(&exceptionSequenceNum, 1u, memory_order_relaxed);
  long long v9 = sFdExceptionCallbacks[1];
  long long v41 = sFdExceptionCallbacks[0];
  long long v42 = v9;
  long long v10 = sFdExceptionCallbacks[3];
  long long v43 = sFdExceptionCallbacks[2];
  long long v44 = v10;
  uint64_t v11 = setThreadIdAndInfo();
  uint64_t v12 = v11;
  uint64_t v13 = threadData[9 * v11 + 1];
  uint64_t v14 = v13 + 320 * HIDWORD(v11);
  *(unsigned char *)(v14 + 216) = 0;
  int v15 = *(_DWORD *)(v14 + 312);
  char v16 = *(void (**)(void))(v14 + 224);
  if (v16) {
    v16(*(void *)(v13 + 320 * HIDWORD(v11) + 288));
  }
  if (_setjmp((int *)v14))
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_1000A2328(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    *(_DWORD *)(v14 + 312) = v15;
    CIOnThreadCleanUpReset();
    dropThreadId();
    CICleanUpReset();
  }
  else
  {
    int obj = db_get_obj();
    uint64_t v27 = threadData[9 * v12 + 1];
    uint64_t v28 = v27 + 320 * HIDWORD(v12);
    *(_DWORD *)(v28 + 312) = v15;
    uint64_t v29 = *(void (**)(void))(v28 + 232);
    if (v29) {
      v29(*(void *)(v27 + 320 * HIDWORD(v12) + 288));
    }
    dropThreadId();
    if (obj)
    {
      int v30 = 0;
      goto LABEL_21;
    }
  }
  id v25 = +[NSString stringWithFormat:@"%s:%s", "Language", a5];
  [v25 UTF8String];
  if (db_get_field())
  {
    db_release_obj();
    goto LABEL_19;
  }
  if (MEMORY[8] != 24) {
    goto LABEL_19;
  }
  long long v41 = MEMORY[0];
  *(void *)&long long v42 = MEMORY[0x10];
  db_release_obj();
  if (BYTE7(v42))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000A26AC((uint64_t)a3, (uint64_t)a4, v31, v32, v33, v34, v35, v36);
    }
    goto LABEL_19;
  }
  if ((void)v41 != a6)
  {
LABEL_19:
    uint64_t v37 = 0;
    goto LABEL_20;
  }
  uint64_t v37 = +[NSString stringWithUTF8String:(char *)&v41 + 8];
LABEL_20:
  uint64_t v38 = (void *)v37;

  int v30 = v38;
LABEL_21:

  return v30;
}

- (BOOL)markForDeleteDBO:(db_obj *)a3 purgeContext:(id *)a4
{
  if (!a3->var0)
  {
    char v14 = 0;
    goto LABEL_22;
  }
  char v17 = 1;
  uint64_t v18 = a4;
  while (db_next_field() == 35)
  {
    objc_super v4 = +[NSString stringWithUTF8String:0];
    if ([v4 rangeOfString:@":"] != (id)0x7FFFFFFFFFFFFFFFLL
      && ([v4 isEqual:@"kMDItemAttributeChangeDate"] & 1) == 0)
    {
      uint64_t v5 = [v4 componentsSeparatedByString:@":"];
      if ([v5 count] == (id)2)
      {
        uint64_t v6 = [v5 objectAtIndexedSubscript:0];
        if ([v6 isEqual:@"Priority"])
        {
          id v7 = [v5 objectAtIndexedSubscript:1];
          id var2 = v18->var2;

          if (v7 == var2)
          {
            char v17 = 0;
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      if ([v5 count] == (id)3)
      {
        long long v9 = [v5 objectAtIndexedSubscript:0];
        if ([v9 isEqual:@"SerialNumber"])
        {
          id v10 = [v5 objectAtIndexedSubscript:1];
          uint64_t v11 = v10;
          if (v10 == v18->var2)
          {
            uint64_t v12 = [v5 objectAtIndexedSubscript:2];
            unsigned int v13 = [v12 intValue];
            int var1 = v18->var1;

            if (v13 == var1) {
              v17 &= v18->var0 >= MEMORY[0xD];
            }
            goto LABEL_16;
          }
        }
      }
LABEL_16:
    }
  }
  char v14 = v17;
  a4 = v18;
LABEL_22:

  return v14 & 1;
}

- (void)setProtectionClassForFolder:(int)a3 protectionClass:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  bzero(__s, 0x400uLL);
  if (!sub_10004F448(v5, __s) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000A2CF0(v5);
  }
  size_t v6 = strlen(__s);
  id v7 = opendir(__s);
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000A2C70((uint64_t)__s, v5, v8, v9, v10, v11, v12, v13);
  }
  if (fcntl(v5, 63) != v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000A2BEC();
    }
    fcntl(v5, 64, v4);
  }
  char v14 = readdir(v7);
  if (v14)
  {
    int v15 = v14;
    do
    {
      int d_type = v15->d_type;
      if (d_type == 8 || d_type == 4)
      {
        d_name = v15->d_name;
        if (strcmp(v15->d_name, "."))
        {
          if (strcmp(v15->d_name, ".."))
          {
            if (v6 - 1023 + v15->d_namlen >= 0xFFFFFFFFFFFFFC00)
            {
              int v19 = openat(v7->__dd_fd, v15->d_name, 0x8000);
              if (v19 != -1)
              {
                int v20 = v19;
                int v21 = fcntl(v19, 63);
                if (v21 != v4)
                {
                  int v22 = v21;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v24 = d_name;
                    __int16 v25 = 1024;
                    int v26 = v22;
                    __int16 v27 = 1024;
                    int v28 = v4;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SKGUpdaterStore#setProtectionClassForFolder File with name %s has pc %d. Setting pc to %d", buf, 0x18u);
                  }
                  fcntl(v20, 64, v4);
                }
                close(v20);
              }
            }
          }
        }
      }
      int v15 = readdir(v7);
    }
    while (v15);
  }
  closedir(v7);
}

- (void)closeAndDeleteStore
{
  db_release_datastore();
  uint64_t parentFd = self->_parentFd;

  _db_delete_datastore(parentFd, "skg_store.db", 270336);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->systemOidLock, 0);
}

@end