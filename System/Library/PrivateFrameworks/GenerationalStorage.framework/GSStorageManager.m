@interface GSStorageManager
+ (BOOL)generationStorageIsDisabledForStatFSInfo:(statfs *)a3 fd:(int)a4;
+ (id)_libraryForDisk:(id *)a3 createIfNone:(BOOL)a4 error:(id *)a5;
+ (id)createLibraryForDevice:(int)a3 error:(id *)a4;
+ (id)existingLibraryForDevice:(int)a3;
+ (void)invalidateLibrary:(id)a3;
+ (void)shutdownLibraries;
+ (void)startLibraries;
@end

@implementation GSStorageManager

+ (id)_libraryForDisk:(id *)a3 createIfNone:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10000677C;
  v40 = sub_10000678C;
  id v41 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10004CE68);
  if (byte_10004CE70 != 1)
  {
    uint64_t var0 = a3->var0;
    pthread_rwlock_rdlock(&stru_10004CAC8);
    v11 = (void *)qword_10004CE78;
    v12 = +[NSNumber numberWithInt:var0];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];

    pthread_rwlock_unlock(&stru_10004CAC8);
    v14 = (void *)v37[5];
    v37[5] = v13;

    v15 = (void *)v37[5];
    if (v15)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000068D0;
      v28[3] = &unk_100040BF8;
      v28[4] = &v36;
      v28[5] = a3;
      [v15 dispatchSync:v28];
    }
    else
    {
      v16 = [[GSManager alloc] initWithDisk:a3 createIfNone:v6 error:a5];
      v17 = (void *)v37[5];
      v37[5] = (uint64_t)v16;

      if (v37[5])
      {
        pthread_rwlock_wrlock(&stru_10004CAC8);
        uint64_t v18 = v37[5];
        v19 = (void *)qword_10004CE78;
        v20 = +[NSNumber numberWithInt:a3->var0];
        [v19 setObject:v18 forKeyedSubscript:v20];

        pthread_rwlock_unlock(&stru_10004CAC8);
        uint64_t v30 = 0;
        v31 = &v30;
        uint64_t v32 = 0x3032000000;
        v33 = sub_10000677C;
        v34 = sub_10000678C;
        id v35 = 0;
        v21 = (void *)v37[5];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_100006794;
        v29[3] = &unk_100040BD0;
        v29[4] = &v30;
        v29[5] = &v36;
        [v21 dispatchSync:v29];
        if (a5) {
          *a5 = (id) v31[5];
        }
        _Block_object_dispose(&v30, 8);
      }
    }
    v22 = (void *)v37[5];
    if (v22)
    {
      if (![v22 isEnabled])
      {
        id v8 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:30 userInfo:0];
        v25 = +[NSString stringWithFormat:@"The generation storage database on a read-only filesystem is corrupt"];
        v26 = sub_100002D4C();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          sub_100026FCC();
        }

        if (a5)
        {
          sub_100003600(107, v25, v8);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_22;
      }
      v23 = (void *)v37[5];
    }
    else
    {
      v23 = 0;
    }
    id v24 = v23;
    goto LABEL_23;
  }
  id v8 = +[NSString stringWithFormat:@"revisiond is shutting down"];
  v9 = sub_100002D4C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100026BF0();
  }

  if (a5)
  {
    sub_100003600(102, v8, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:

  id v24 = 0;
LABEL_23:
  _Block_object_dispose(&v36, 8);

  return v24;
}

+ (id)existingLibraryForDevice:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  pthread_rwlock_rdlock(&stru_10004CAC8);
  v4 = (void *)qword_10004CE78;
  v5 = +[NSNumber numberWithInt:v3];
  BOOL v6 = [v4 objectForKeyedSubscript:v5];

  pthread_rwlock_unlock(&stru_10004CAC8);
  if ([v6 isEnabled]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

+ (void)invalidateLibrary:(id)a3
{
  id v3 = a3;
  v4 = qword_10004CE68;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006ABC;
  block[3] = &unk_100040B00;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

+ (id)createLibraryForDevice:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10000677C;
  uint64_t v36 = sub_10000678C;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_10000677C;
  uint64_t v30 = sub_10000678C;
  id v31 = 0;
  pthread_rwlock_rdlock(&stru_10004CAC8);
  id v7 = (void *)qword_10004CE78;
  id v8 = +[NSNumber numberWithInt:v5];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  pthread_rwlock_unlock(&stru_10004CAC8);
  v10 = (void *)v33[5];
  v33[5] = v9;

  v11 = (void *)v33[5];
  if (!v11)
  {
LABEL_4:
    uint64_t v12 = sub_10000CA14();
    uint64_t v13 = v12;
    memset(&v42, 0, 512);
    if ((v12 & 0x80000000) != 0 || fstatfs(v12, &v42) < 0)
    {
      v21 = +[NSString stringWithFormat:@"fstatfs(%d) failed", v5];
      int v22 = *__error();
      v23 = sub_100002D4C();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v25 = strerror(v22);
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v22;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v25;
        _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] %@; error %d (%s)", buf, 0x1Cu);
      }

      if (a4)
      {
        sub_100011F0C(v22, v21);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      if ((v13 & 0x80000000) != 0) {
        goto LABEL_26;
      }
    }
    else if ([a1 _isPermanentStorageSupportedForStatFSInfo:&v42 error:a4])
    {
      if ([a1 generationStorageIsDisabledForStatFSInfo:&v42 fd:v13])
      {
        id v14 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:89 userInfo:0];
        v15 = +[NSString stringWithFormat:@"storage supported, but explicitely disabled on %s", v42.f_mntonname];
        v16 = sub_100002D4C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          sub_100026FCC();
        }

        if (a4)
        {
          sub_100003600(107, v15, v14);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        *(_DWORD *)buf = v5;
        buf[4] = (v42.f_flags & 0x4000) != 0;
        buf[5] = v42.f_flags & 1;
        buf[6] = (v42.f_flags & 0x200000) != 0;
        memset(&buf[7], 0, 17);
        sub_10000BE54(v42.f_mntonname, &buf[7]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000070F4;
        block[3] = &unk_100040C20;
        long long v39 = *(_OWORD *)buf;
        uint64_t v40 = *(void *)&buf[16];
        void block[4] = &v32;
        block[5] = &v26;
        block[6] = a1;
        dispatch_sync((dispatch_queue_t)qword_10004CE68, block);
      }
    }
    close(v13);
LABEL_26:
    if (a4) {
      *a4 = (id) v27[5];
    }
    id v20 = (id)v33[5];
    goto LABEL_29;
  }
  if ([v11 isEnabled])
  {
    if (v33[5]) {
      goto LABEL_26;
    }
    goto LABEL_4;
  }
  id v17 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:30 userInfo:0];
  uint64_t v18 = +[NSString stringWithFormat:@"The generation storage database on a read-only filesystem is corrupt"];
  v19 = sub_100002D4C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_100026FCC();
  }

  if (a4)
  {
    sub_100003600(107, v18, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v20 = 0;
LABEL_29:
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v20;
}

+ (void)startLibraries
{
  rlimit v20 = (rlimit)xmmword_1000321E0;
  if (getrlimit(8, &v20) == -1)
  {
    v2 = sub_100002D4C();
    if (os_log_type_enabled(v2, (os_log_type_t)0x90u)) {
      sub_1000272F8();
    }
  }
  v20.rlim_cur = 1000;
  if (setrlimit(8, &v20) == -1)
  {
    id v3 = sub_100002D4C();
    if (os_log_type_enabled(v3, (os_log_type_t)0x90u)) {
      sub_100027278();
    }
  }
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.revisiond.volumeManager", v5);
  id v7 = (void *)qword_10004CE68;
  qword_10004CE68 = (uint64_t)v6;

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v9 = (void *)qword_10004CE78;
  qword_10004CE78 = (uint64_t)v8;

  memset(&v21, 0, 512);
  if (statfs("/private/var/mobile", &v21))
  {
    v19 = sub_100002D4C();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
      sub_100027238();
    }

    exit(1);
  }
  dword_10004CB90 = v21.f_fsid.val[0];
  id v10 = +[GSStorageManager createLibraryForDevice:error:](GSStorageManager, "createLibraryForDevice:error:");
  v11 = +[UMUserManager sharedManager];
  unsigned __int8 v12 = [v11 isMultiUser];

  if (v12)
  {
    v22[0] = 0;
    v22[1] = 0x10000000000;
    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("unmount-queue", v13);
    v15 = (void *)qword_10004CE98;
    qword_10004CE98 = (uint64_t)v14;

    if ((sub_1000077B8(1, (uint64_t)v22, 16, 32) & 0x80000000) != 0)
    {
      id v17 = sub_100002D4C();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
        sub_100027128();
      }
    }
    else
    {
      if (ioctl(dword_10004CB94, 0x20007365uLL, 0) < 0)
      {
        v16 = sub_100002D4C();
        if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
          sub_1000271B0();
        }
      }
      pthread_create((pthread_t *)&qword_10004CE90, 0, (void *(__cdecl *)(void *))sub_100007A44, 0);
    }
    pthread_create((pthread_t *)&qword_10004CE88, 0, (void *(__cdecl *)(void *))sub_100007FA4, 0);
  }
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v18, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_uint64(v18, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_string(v18, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v18, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  xpc_dictionary_set_BOOL(v18, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(v18, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  xpc_activity_unregister("com.apple.revisiond.CacheDelete.purgeable-xpc");
  xpc_activity_register("com.apple.revisiond.CacheDelete.purgeable-xpc", v18, &stru_100040D38);
}

+ (void)shutdownLibraries
{
  v2 = dispatch_group_create();
  pthread_rwlock_wrlock(&stru_10004CAC8);
  byte_10004CE70 = 1;
  id v3 = [(id)qword_10004CE78 allValues];
  [(id)qword_10004CE78 removeAllObjects];
  pthread_rwlock_unlock(&stru_10004CAC8);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000077AC;
        block[3] = &unk_100040B00;
        void block[4] = v9;
        dispatch_group_async(v2, v10, block);
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  int v11 = dword_10004CB94;
  if ((dword_10004CB94 & 0x80000000) == 0)
  {
    dword_10004CB94 = -1;
    close(v11);
  }
  if (qword_10004CE80) {
    CFFileDescriptorInvalidate((CFFileDescriptorRef)qword_10004CE80);
  }
  if (qword_10004CF30) {
    CFRunLoopStop((CFRunLoopRef)qword_10004CF30);
  }
  if (qword_10004CE88) {
    pthread_join((pthread_t)qword_10004CE88, 0);
  }
  if (qword_10004CE90) {
    pthread_join((pthread_t)qword_10004CE90, 0);
  }
}

+ (BOOL)generationStorageIsDisabledForStatFSInfo:(statfs *)a3 fd:(int)a4
{
  if (a3->f_fsid.val[0] != dword_10004CB90)
  {
    uint64_t v6 = 0;
    while (1)
    {
      size_t v7 = strlen(off_100040C40[v6]);
      if (!strncmp(a3->f_mntonname, off_100040C40[v6], v7)) {
        break;
      }
      if (++v6 == 2) {
        return 1;
      }
    }
  }
  memset(&v10, 0, sizeof(v10));
  APFSVolumeRole();
  if (fstatat(a4, ".DocumentRevisionsDisabled", &v10, 32))
  {
    if (*__error() == 2) {
      return 0;
    }
    uint64_t v9 = sub_100002D4C();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      sub_100027484();
    }
  }
  else if ((a3->f_flags & 0x4000) != 0)
  {
    return *(void *)&v10.st_uid == 0;
  }
  return 1;
}

@end