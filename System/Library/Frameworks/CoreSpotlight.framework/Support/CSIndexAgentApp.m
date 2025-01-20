@interface CSIndexAgentApp
+ (id)sharedAgent;
+ (void)initialize;
- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5;
- (BOOL)lostClientConnection:(id)a3 error:(id)a4;
- (BOOL)queryQueueActive;
- (FPMonitor)fpMonitor;
- (OS_dispatch_queue)indexQueue;
- (OS_dispatch_queue)queryQueue;
- (id)createVolumeConfigForMountPath:(const char *)a3 volumeUUID:(id)a4;
- (id)indexerForCStringVolume:(const char *)a3;
- (id)indexerForVolume:(id)a3;
- (id)macOSJournalSafeScanDateFromIndexPath:(const char *)a3;
- (id)monitoringContext;
- (int)_indexQueryStart:(id)a3 queryString:(id)a4 queryContext:(id)a5 queryID:(int64_t)a6 remoteConnection:(id)a7;
- (int)_mountVolume:(id)a3;
- (int)_queryCancel:(id)a3;
- (int)_scanQueryStart:(id)a3 scope:(id)a4 queryString:(id)a5 criteria:(id)a6 queryContext:(id)a7 queryID:(int64_t)a8 remoteConnection:(id)a9;
- (void)_closeAllWithCompletionHandler:(id)a3;
- (void)_closeIndexAtPath:(id)a3;
- (void)_handleFSE:(id)a3;
- (void)_handleMount:(id)a3 force:(BOOL)a4;
- (void)_handleScan:(id)a3 completionHandler:(id)a4;
- (void)handleCloseAll:(id)a3 completionBlock:(id)a4;
- (void)handleEjectOrUnmountNotificationFromDADisk:(__DADisk *)a3 label:(id)a4;
- (void)handleFSE:(id)a3 completionBlock:(id)a4;
- (void)handleMount:(id)a3 completionBlock:(id)a4;
- (void)handleQueryCancel:(id)a3 completionBlock:(id)a4;
- (void)handleQueryStart:(id)a3 completionBlock:(id)a4;
- (void)handleReset:(id)a3 completionBlock:(id)a4;
- (void)handleResolveInfo:(const char *)a3 completionBlock:(id)a4;
- (void)handleResolvePath:(const char *)a3 info:(id)a4 completionBlock:(id)a5;
- (void)handleScan:(id)a3 completionBlock:(id)a4;
- (void)handleStatus:(id)a3 completionBlock:(id)a4;
- (void)handleWalkPath:(const char *)a3 flat:(BOOL)a4 completionBlock:(id)a5;
- (void)importItems:(id)a3 indexer:(id)a4;
- (void)openIndex:(id)a3 rootPath:(id)a4 volumeUUID:(id)a5 options:(unint64_t)a6;
- (void)performScan:(id)a3 liveFSHandle:(id)a4 pathFromMountPoint:(id)a5 fromDate:(id)a6 allowImport:(BOOL)a7 completionHandler:(id)a8;
- (void)queryActiviate;
- (void)removeChildRecords:(int64_t)a3 withIndexer:(id)a4 withVolumeName:(const char *)a5;
- (void)setFpMonitor:(id)a3;
- (void)setIndexQueue:(id)a3;
- (void)setMonitoringContext:(id)a3;
- (void)setQueryQueue:(id)a3;
- (void)setQueryQueueActive:(BOOL)a3;
- (void)udatedWithAddedMountPoints:(id)a3 andRemovedMountPoints:(id)a4;
@end

@implementation CSIndexAgentApp

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [CSIndexAgentApp alloc];
    id v3 = [(CSIndexAgentApp *)v2 initMachServiceListenerWithName:CSUserFSAppMachServiceName];
    v4 = (void *)qword_10003CD28;
    qword_10003CD28 = (uint64_t)v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("index queue", v5);
    [(id)qword_10003CD28 setIndexQueue:v6];

    v7 = dispatch_queue_attr_make_initially_inactive(0);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v9 = dispatch_queue_create("query queue", v8);
    [(id)qword_10003CD28 setQueryQueue:v9];

    [(id)qword_10003CD28 setQueryQueueActive:0];
    v10 = [FPMonitor alloc];
    v11 = [(FPMonitor *)v10 initWithDelegate:qword_10003CD28];
    [(id)qword_10003CD28 setFpMonitor:v11];

    v12 = [(id)qword_10003CD28 indexQueue];
    id v13 = +[SPQueryResultsQueue sharedInstanceDispatchQueue:v12];

    [(id)qword_10003CD28 indexQueue];
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_10001A058;
    v24 = &unk_1000352B0;
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = qword_10003CD80;
    id v15 = v25;
    if (v14 != -1) {
      dispatch_once(&qword_10003CD80, &v21);
    }

    qword_10003CD38 = (uint64_t)DASessionCreate(kCFAllocatorDefault);
    if (qword_10003CD38)
    {
      CFStringRef v26 = @"DADeviceInternal";
      CFBooleanRef v27 = kCFBooleanFalse;
      CFDictionaryRef v16 = kDADiskDescriptionMatchVolumeMountable;
      v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1, v21, v22, v23, v24);
      DARegisterDiskUnmountApprovalCallbackBlock();
      v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v19 = dispatch_queue_create("DiskArb queue", v18);
      v20 = (void *)qword_10003CD30;
      qword_10003CD30 = (uint64_t)v19;

      DASessionSetDispatchQueue((DASessionRef)qword_10003CD38, (dispatch_queue_t)qword_10003CD30);
    }
  }
}

+ (id)sharedAgent
{
  return (id)qword_10003CD28;
}

- (void)handleEjectOrUnmountNotificationFromDADisk:(__DADisk *)a3 label:(id)a4
{
  id v5 = a4;
  CFDictionaryRef v6 = DADiskCopyDescription(a3);
  v7 = [(__CFDictionary *)v6 objectForKeyedSubscript:kDADiskDescriptionVolumeNameKey];
  v8 = [(__CFDictionary *)v6 objectForKeyedSubscript:kDADiskDescriptionMediaBSDNameKey];
  dispatch_queue_t v9 = sub_1000109A0(v6);
  v10 = sub_100010A68(v6);
  v11 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    id v18 = v5;
    __int16 v19 = 2048;
    v20 = a3;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    v24 = v7;
    __int16 v25 = 2112;
    CFStringRef v26 = v9;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "DiskApproval %@ enter %p %@ %@ %@ %@", buf, 0x3Eu);
  }

  v12 = objc_opt_new();
  sub_100010AE8(a3, v12);
  if ([v12 count])
  {
    id v13 = [(id)qword_10003CD28 indexQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010DB0;
    block[3] = &unk_1000352B0;
    id v16 = v12;
    dispatch_sync(v13, block);
  }
  uint64_t v14 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v18 = v5;
    __int16 v19 = 2048;
    v20 = a3;
    __int16 v21 = 2112;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "DiskApproval %@ exit %p %@ %@", buf, 0x2Au);
  }
}

- (id)indexerForCStringVolume:(const char *)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = sub_100010FE8;
  v10 = sub_100010FF8;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011060;
  v5[3] = &unk_1000352D8;
  v5[4] = &v6;
  v5[5] = a3;
  sub_100011000(v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)indexerForVolume:(id)a3
{
  id v4 = [a3 UTF8String];

  return [(CSIndexAgentApp *)self indexerForCStringVolume:v4];
}

- (void)_closeIndexAtPath:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000112EC(v3);
  if (v4)
  {
    id v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Closing %@", buf, 0xCu);
    }

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = objc_msgSend(v4, "allQueryTasks", 0);
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) cancel];
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [v4 close];
    sub_100011358(0, v3);
  }
}

- (void)queryActiviate
{
  if (!self->_queryQueueActive)
  {
    dispatch_activate((dispatch_object_t)self->_queryQueue);
    self->_queryQueueActive = 1;
  }
}

- (void)udatedWithAddedMountPoints:(id)a3 andRemovedMountPoints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  indexQueue = self->_indexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000114EC;
  block[3] = &unk_100035328;
  id v12 = v7;
  long long v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(indexQueue, block);
}

- (void)handleStatus:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  indexQueue = self->_indexQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000119F0;
  v8[3] = &unk_100035378;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(indexQueue, v8);
}

- (id)createVolumeConfigForMountPath:(const char *)a3 volumeUUID:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  id v7 = 0;
  int v8 = 22;
  id v9 = 0;
  id v10 = 0;
  if (a3 && v5)
  {
    long long v11 = objc_opt_new();
    id v12 = [v11 UUIDString];

    id v10 = v12;
    long long v13 = (const char *)[v10 UTF8String];
    if (!v13) {
      goto LABEL_5;
    }
    id v14 = v13;
    size_t v15 = strlen(v13);
    size_t v16 = strlen(a3);
    if (v15 + v16 - 743 < 0xFFFFFFFFFFFFFC00) {
      goto LABEL_5;
    }
    size_t v20 = v16;
    bzero(v33, 0x400uLL);
    __memcpy_chk();
    __int16 v21 = &v33[v20];
    strcpy(&v33[v20], "/.Spotlight-V100");
    if (mkdir(v33, 0x1C0u) != -1 || (int v8 = *__error(), v8 == 17))
    {
      v32[0] = v6;
      v31[0] = @"ConfigurationVolumeUUID";
      v31[1] = @"ConfigurationCreationDate";
      uint64_t v22 = +[NSDate date];
      v32[1] = v22;
      v32[2] = &__NSArray0__struct;
      v31[2] = @"Exclusions";
      v31[3] = @"Stores";
      id v29 = v10;
      v30 = &off_100036C10;
      __int16 v23 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v32[3] = v23;
      id v7 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];

      id v9 = +[NSPropertyListSerialization dataWithPropertyList:v7 format:100 options:0 error:0];
      if ([v9 length])
      {
        strcpy(v21 + 16, "/VolumeConfiguration.plist");
        int v24 = open(v33, 536872449, 448);
        if (v24 == -1)
        {
          int v8 = *__error();
        }
        else
        {
          int v25 = v24;
          id v9 = v9;
          if (write(v25, [v9 bytes], (size_t)objc_msgSend(v9, "length")) == -1)
          {
            int v8 = *__error();
            close(v25);
          }
          else
          {
            close(v25);
            strcpy(v21 + 17, "Store-V2");
            if (mkdir(v33, 0x1C0u) != -1 || (int v8 = *__error(), v8 == 17))
            {
              *(_WORD *)(v21 + 25) = 47;
              memcpy(v21 + 26, v14, v15 + 1);
              if (mkdir(v33, 0x1C0u) != -1 || (int v8 = *__error(), v8 == 17))
              {
                CFStringRef v26 = logForCSLogCategoryDefault();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v28 = v33;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "createVolumeConfig %s", buf, 0xCu);
                }

                id v7 = v7;
                id v18 = v7;
                goto LABEL_9;
              }
            }
          }
        }
      }
      else
      {
        int v8 = 22;
      }
    }
    else
    {
LABEL_5:
      id v7 = 0;
      id v9 = 0;
    }
  }
  v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "createVolumeConfigForMountPath error:%d", buf, 8u);
  }

  id v18 = 0;
LABEL_9:

  return v18;
}

- (void)_handleMount:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  bzero(__s, 0x400uLL);
  id v7 = v6;
  int v8 = (const char *)[v7 fileSystemRepresentation];
  if (!v8) {
    goto LABEL_14;
  }
  id v9 = v8;
  if (strlen(v8) - 1 > 0x2FE) {
    goto LABEL_14;
  }
  if (!strncmp(v9, "/System/Library/PrivateFrameworks/UserFS.framework/PlugIns/com.apple.filesystems.userfsd/", 0x59uLL))
  {
    if (strlen(v9 + 89) + 69 <= 0x3FF)
    {
      v62 = self;
      qmemcpy(__s, "/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/", 68);
      goto LABEL_7;
    }
LABEL_14:
    long long v13 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100025EDC();
    }
    goto LABEL_16;
  }
  v62 = self;
LABEL_7:
  __memcpy_chk();
  int32_t v10 = 0;
  size_t v63 = strlen(__s);
  strcpy(&__s[v63], "/.");
  memset(&v70, 0, sizeof(v70));
  while (stat(__s, &v70))
  {
    int v11 = *__error();
    id v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 67109634;
      buf.f_iosize = v10;
      LOWORD(buf.f_blocks) = 1024;
      *(_DWORD *)((char *)&buf.f_blocks + 2) = v11;
      HIWORD(buf.f_blocks) = 2080;
      buf.f_bfree = (uint64_t)__s;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "stat[%d] error:%d on %s", (uint8_t *)&buf, 0x18u);
    }

    if (v11 != 57)
    {
      if (v11) {
        goto LABEL_17;
      }
      break;
    }
    sleep(1u);
    if (++v10 == 5) {
      goto LABEL_17;
    }
  }
  bzero(&buf, 0x878uLL);
  if (statfs(__s, &buf)) {
    goto LABEL_17;
  }
  id v14 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v73 = 67109120;
    LODWORD(st_ino) = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "force: %d", v73, 8u);
  }

  size_t v15 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v73 = 67109120;
    LODWORD(st_ino) = v70.st_dev;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "dev_t: %d", v73, 8u);
  }

  size_t v16 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v73 = 134217984;
    __darwin_ino64_t st_ino = v70.st_ino;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "st_ino: %lld", v73, 0xCu);
  }

  v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v73 = 136315138;
    __darwin_ino64_t st_ino = (__darwin_ino64_t)buf.f_fstypename;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "f_fstypename: %s", v73, 0xCu);
  }

  id v18 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v73 = 136315138;
    __darwin_ino64_t st_ino = (__darwin_ino64_t)buf.f_mntonname;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "f_mntonname: %s", v73, 0xCu);
  }

  __int16 v19 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v73 = 136315138;
    __darwin_ino64_t st_ino = (__darwin_ino64_t)buf.f_mntfromname;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "f_mntfromname: %s", v73, 0xCu);
  }

  size_t v20 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v73 = 134217984;
    __darwin_ino64_t st_ino = buf.f_flags;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "f_flags: 0x%llx", v73, 0xCu);
  }

  __int16 v21 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v73 = 134217984;
    __darwin_ino64_t st_ino = buf.f_bsize;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "f_bsize: 0x%llx", v73, 0xCu);
  }

  uint64_t v22 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v73 = 134217984;
    __darwin_ino64_t st_ino = buf.f_blocks;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "f_blocks: 0x%llx", v73, 0xCu);
  }

  __int16 v23 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v73 = 134217984;
    __darwin_ino64_t st_ino = buf.f_bavail;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "f_bavail: 0x%llx", v73, 0xCu);
  }

  __s[v63] = 0;
  int64_t v24 = buf.f_blocks * buf.f_bsize;
  if (v24 <= 0x3FFFFFF)
  {
    long long v13 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v73 = 136315394;
      __darwin_ino64_t st_ino = (__darwin_ino64_t)buf.f_mntfromname;
      __int16 v75 = 2048;
      int64_t v76 = v24;
      int v25 = "*warn* volume %s too small for index %lld";
      CFStringRef v26 = v73;
      __int16 v27 = v13;
      os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
      uint32_t v29 = 22;
LABEL_59:
      _os_log_impl((void *)&_mh_execute_header, v27, v28, v25, v26, v29);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  bzero(v73, 0x400uLL);
  if ((unint64_t)__strlcpy_chk() > 0x3FF
    || ((memset(&v72, 0, sizeof(v72)), (unint64_t)__strlcat_chk() > 0x3FF)
      ? (BOOL v30 = 0)
      : (BOOL v30 = stat((const char *)v73, &v72) != 0),
        (v73[v63] = 0, (unint64_t)__strlcat_chk() > 0x3FF) || !stat((const char *)v73, &v72) || !v30))
  {
    long long v13 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v72.st_dev = 138412290;
      *(void *)&v72.st_mode = v7;
      int v25 = "/.metadata_never_index variant found on %@";
      CFStringRef v26 = (uint8_t *)&v72;
      __int16 v27 = v13;
      os_log_type_t v28 = OS_LOG_TYPE_INFO;
      uint32_t v29 = 12;
      goto LABEL_59;
    }
LABEL_16:

    goto LABEL_17;
  }
  v31 = strrchr(buf.f_mntonname, 47);
  if (!v31)
  {
    long long v13 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100025F44();
    }
    goto LABEL_16;
  }
  v32 = +[NSString stringWithUTF8String:v31 + 1];
  v33 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v72.st_dev = 138412290;
    *(void *)&v72.st_mode = v32;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "using volume UUID %@", (uint8_t *)&v72, 0xCu);
  }

  int v34 = strcmp(buf.f_fstypename, (const char *)[LiveFSFileSystemTypeName UTF8String]);
  if (!v4 && v34) {
    goto LABEL_105;
  }
  if (v34)
  {
    v35 = 0;
    uint64_t v59 = 33;
  }
  else
  {
    uint64_t v59 = sub_100012CC8((uint64_t)&buf) | 1;
    v35 = +[NSString stringWithUTF8String:__s];
  }
  v36 = +[NSString stringWithFormat:@"%s/%s", __s, ".Spotlight-V100/VolumeConfiguration.plist"];
  id v69 = 0;
  v37 = +[NSData dataWithContentsOfFile:v36 options:0 error:&v69];
  id v38 = v69;

  v61 = v37;
  if ([v37 length]) {
    +[NSPropertyListSerialization propertyListWithData:v37 options:0 format:0 error:0];
  }
  else {
  v39 = [(CSIndexAgentApp *)v62 createVolumeConfigForMountPath:__s volumeUUID:v32];
  }
  v40 = v39;
  if (!v39) {
    goto LABEL_104;
  }
  v60 = v39;
  v64 = [v39 objectForKeyedSubscript:@"ConfigurationVolumeUUID"];
  if (v64)
  {
    id v41 = v38;
    v42 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v72.st_dev = 138412290;
      *(void *)&v72.st_mode = v64;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "ConfigurationVolumeUUID:%@", (uint8_t *)&v72, 0xCu);
    }

    if (!v32)
    {
      id v38 = v41;
      goto LABEL_79;
    }
    id v38 = v41;
    if (([v64 isEqualToString:v32] & 1) == 0)
    {
      v43 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v72.st_dev = 138412546;
        *(void *)&v72.st_mode = v32;
        WORD2(v72.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&v72.st_ino + 6) = (__darwin_ino64_t)v64;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Allowing volumeUUID %@ for configurationVolumeUUID %@", (uint8_t *)&v72, 0x16u);
      }

      [v64 isEqualToString:v32];
      goto LABEL_82;
    }
  }
  else if (!v32)
  {
    if (!v4) {
      goto LABEL_80;
    }
    goto LABEL_82;
  }
  if ([v64 isEqualToString:v32]) {
    goto LABEL_82;
  }
LABEL_79:
  if (!v4)
  {
LABEL_80:
    id v44 = v64;
    goto LABEL_103;
  }
LABEL_82:
  [v60 objectForKeyedSubscript:@"Stores"];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  id v44 = [v45 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (!v44) {
    goto LABEL_101;
  }
  id v56 = v38;
  v57 = v35;
  v58 = v32;
  uint64_t v46 = *(void *)v66;
  while (2)
  {
    for (i = 0; i != v44; i = (char *)i + 1)
    {
      if (*(void *)v66 != v46) {
        objc_enumerationMutation(v45);
      }
      uint64_t v48 = *(void *)(*((void *)&v65 + 1) + 8 * i);
      v49 = [v45 objectForKeyedSubscript:v48];
      v50 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v72.st_dev = 138412290;
        *(void *)&v72.st_mode = v49;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v72, 0xCu);
      }

      v51 = [v49 objectForKeyedSubscript:@"PartialPath"];
      unsigned int v52 = [v51 isEqualToString:@"/"];

      if (v52)
      {
        v53 = [v49 objectForKeyedSubscript:@"PolicyLevel"];
        if ([v53 isEqualToString:@"kMDConfigSearchLevelReadOnly"])
        {
          uint64_t v54 = v59 | 0x21;
        }
        else
        {
          if ([v53 isEqualToString:@"kMDConfigSearchLevelReadWrite"])
          {
LABEL_99:
            id v44 = +[NSString stringWithFormat:@"%s/.Spotlight-V100/Store-V2/%@", __s, v48];

            goto LABEL_100;
          }
          unsigned int v55 = [v53 isEqualToString:@"kMDConfigSearchLevelFSSearchOnly"];
          uint64_t v54 = v59;
          if (v55) {
            uint64_t v54 = v59 | 4;
          }
        }
        uint64_t v59 = v54;
        goto LABEL_99;
      }
    }
    id v44 = [v45 countByEnumeratingWithState:&v65 objects:v71 count:16];
    if (v44) {
      continue;
    }
    break;
  }
LABEL_100:
  v35 = v57;
  v32 = v58;
  id v38 = v56;
LABEL_101:

  v40 = v60;
  if (v44)
  {
    [(CSIndexAgentApp *)v62 openIndex:v44 rootPath:v35 volumeUUID:v32 options:v59];
LABEL_103:

    v40 = v60;
  }
LABEL_104:

LABEL_105:
LABEL_17:
}

- (id)macOSJournalSafeScanDateFromIndexPath:(const char *)a3
{
  if (!a3 || (uint64_t v3 = open(a3, 0), v3 == -1))
  {
    int v8 = 0;
    goto LABEL_12;
  }
  int v4 = v3;
  id v5 = -[QueueImportJournal initWithPartialPath:under:allowModification:]([QueueImportJournal alloc], "initWithPartialPath:under:allowModification:", [@"journals.scan" UTF8String], v3, 0);
  if (![(QueueImportJournal *)v5 scanForFiles])
  {
    close(v4);
LABEL_10:
    int v8 = 0;
    goto LABEL_11;
  }
  int64_t v6 = [(QueueImportJournal *)v5 oldestDateAfterRetirement];
  id v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 134217984;
    int64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "oldestTime from journal:%lu\n", (uint8_t *)&v10, 0xCu);
  }

  close(v4);
  if (!v6) {
    goto LABEL_10;
  }
  int v8 = +[NSDate dateWithTimeIntervalSince1970:(double)v6];
LABEL_11:

LABEL_12:

  return v8;
}

- (void)openIndex:(id)a3 rootPath:(id)a4 volumeUUID:(id)a5 options:(unint64_t)a6
{
  int v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (qword_10003CD40 != -1) {
    dispatch_once(&qword_10003CD40, &stru_100035398);
  }
  if ((a6 & 0xA) != 0)
  {
    long long v13 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100026014((uint64_t)v10, a6, v13);
    }
    goto LABEL_52;
  }
  id v14 = sub_1000112EC(v10);
  long long v13 = v14;
  if (v14)
  {
    if ((a6 & 4) != 0 || [v14 isOpen])
    {
      size_t v15 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)statfs buf = 138412546;
        v58 = v13;
        __int16 v59 = 2112;
        v60 = v10;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found %@ for  %@", buf, 0x16u);
      }

      goto LABEL_52;
    }
    sub_100011358(0, v10);
  }
  size_t v16 = +[SIIndexer indexerWithPath:v10 rootPath:v11];

  v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)statfs buf = 138412546;
    v58 = v16;
    __int16 v59 = 2112;
    v60 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@ for  %@", buf, 0x16u);
  }

  if (v16)
  {
    id v18 = [VolumeScan alloc];
    __int16 v19 = [v16 rootPath];
    size_t v20 = [(VolumeScan *)v18 initWithVolumeUUID:v12 rootPath:v19];

    [v16 setVolumeObject:v20];
    if ((a6 & 0x80) != 0)
    {
      LODWORD(location) = 45;
      [(VolumeScan *)v20 parentFromOID:2 error:&location];
      if (location == 45)
      {
        __int16 v21 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)statfs buf = 138412290;
          v58 = v10;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Persistent fileIDs not supported for %@", buf, 0xCu);
        }

        a6 = a6 & 0xFFFFFFFFFFFFFFDALL | 0x24;
      }
    }
    if ((a6 & 1) != 0
      && (([v16 openWithOptions:a6],
           unsigned __int8 v22 = [v16 isOpen],
           (a6 & 0x64) != 0)
        ? (char v23 = 1)
        : (char v23 = v22),
          (v23 & 1) == 0))
    {
      [v16 openWithOptions:a6 | 0x40];
      unsigned int v24 = [v16 isOpen];
    }
    else
    {
      unsigned int v24 = 0;
    }
    sub_100011358(v16, v10);
    [v16 setBundleID:@"com.apple.filesystems.UserFS.FileProvider"];
    [v16 setDomain:v12];
    if ([v16 isOpen])
    {
      int v25 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)statfs buf = 138412802;
        v58 = v16;
        __int16 v59 = 2112;
        v60 = v12;
        __int16 v61 = 2112;
        v62 = v10;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Open %@ %@ %@", buf, 0x20u);
      }

      id location = 0;
      objc_initWeak(&location, v16);
      id v26 = objc_alloc((Class)SDDirtyIdleTimer);
      indexQueue = self->_indexQueue;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1000138E8;
      v53[3] = &unk_1000353C0;
      objc_copyWeak(&v55, &location);
      v50 = v12;
      uint64_t v54 = v50;
      id v28 = [v26 initWithQueue:indexQueue timeoutBlock:v53];
      [v28 setIdleTimeout:5000000000];
      [v28 setDirtyTimeout:30000000000];
      [v16 setDirtyIdleTimer:v28];
      if (v24)
      {
        [(CSIndexAgentApp *)self performScan:v50 liveFSHandle:0 pathFromMountPoint:0 fromDate:0 allowImport:1 completionHandler:0];
      }
      else
      {
        [v16 index];
        uint32_t v29 = (void *)SICopyProperty();
        BOOL v30 = [(CSIndexAgentApp *)self macOSJournalSafeScanDateFromIndexPath:[v10 fileSystemRepresentation]];
        v31 = v29;
        unsigned int v52 = v31;
        v49 = v30;
        if (v30)
        {
          [v30 timeIntervalSinceNow];
          double v33 = v32;
          [v31 timeIntervalSinceNow];
          unsigned int v52 = v31;
          if (v33 > v34)
          {
            unsigned int v52 = v30;
          }
        }
        [v16 index];
        uint64_t v35 = _SIGetRecoverTimeStamp();
        uint64_t v48 = v31;
        if (v35)
        {
          v51 = +[NSDate dateWithTimeIntervalSince1970:(double)(unint64_t)v35];
          [v51 timeIntervalSinceNow];
          double v37 = v36;
          [v52 timeIntervalSinceNow];
          if (v37 > v38)
          {
            v51 = v51;

            unsigned int v52 = v51;
          }
        }
        else
        {
          v51 = 0;
        }
        v39 = [(VolumeScan *)v20 mountTime];
        if (!v39) {
          goto LABEL_46;
        }
        v40 = [(VolumeScan *)v20 mountTime];
        [v40 timeIntervalSinceNow];
        BOOL v42 = v41 < 60.0;

        if (v42) {
          goto LABEL_46;
        }
        v43 = [(VolumeScan *)v20 lastMTime];
        if (!v43
          || ([(VolumeScan *)v20 lastMTime],
              id v44 = objc_claimAutoreleasedReturnValue(),
              [v44 timeIntervalSinceDate:v52],
              BOOL v46 = v45 < 60.0,
              v44,
              v43,
              v46))
        {
LABEL_46:
          v47 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)statfs buf = 138413058;
            v58 = v52;
            __int16 v59 = 2112;
            v60 = v48;
            __int16 v61 = 2112;
            v62 = v49;
            __int16 v63 = 2112;
            v64 = v51;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Starting catchup scan from %@ (%@, %@, %@)", buf, 0x2Au);
          }

          [(CSIndexAgentApp *)self performScan:v50 liveFSHandle:0 pathFromMountPoint:0 fromDate:v52 allowImport:1 completionHandler:0];
        }
      }
      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);
    }

    long long v13 = v16;
  }
  else
  {
    long long v13 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100025FAC();
    }
  }
LABEL_52:
}

- (void)importItems:(id)a3 indexer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  __chkstk_darwin(v7, 8 * (void)v7, v8, v9, v10);
  id v12 = (char *)v28 - v11;
  bzero((char *)v28 - v11, v13);
  id v30 = v6;
  unsigned int v14 = [v6 persistentFileIDs];
  if (!v7) {
    goto LABEL_18;
  }
  unsigned int v16 = v14;
  v28[1] = v28;
  v17 = 0;
  uint64_t v18 = 0;
  *(void *)&long long v15 = 134218242;
  long long v29 = v15;
  do
  {
    __int16 v19 = [v5 objectAtIndexedSubscript:v17];
    size_t v20 = v19;
    if (!v16
      || ([v19 objectForKeyedSubscript:@":MD:_kMDItemOID"],
          __int16 v21 = objc_claimAutoreleasedReturnValue(),
          id v22 = [v21 unsignedLongLongValue],
          v21,
          !v22))
    {
      char v23 = [v20 objectForKeyedSubscript:@":MD:kMDItemPath"];
      if (!v23)
      {
        id v22 = 0;
        goto LABEL_11;
      }
      id v24 = v23;
      id v25 = [v24 UTF8String];
      id v22 = [v30 oidForPath:v25 allowCreate:1];

      if (!v22) {
        goto LABEL_11;
      }
    }
    id v26 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)statfs buf = v29;
      id v32 = v22;
      __int16 v33 = 2112;
      double v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "addRecords oid: %lld item: %@", buf, 0x16u);
    }
    ++v18;

LABEL_11:
    *(void *)&v12[8 * (void)v17] = v22;

    v17 = (char *)v17 + 1;
  }
  while (v7 != v17);
  if (v18)
  {
    if (qword_10003CD58 != -1) {
      dispatch_once(&qword_10003CD58, &stru_1000353E0);
    }
    __int16 v27 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)statfs buf = 67109120;
      LODWORD(v32) = v18;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "importing %d items", buf, 8u);
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)qword_10003CD50, 0xFFFFFFFFFFFFFFFFLL);
    [v30 addRecords:v5 forIDs:v12 completionHandler:&stru_100035420];
  }
LABEL_18:
}

- (void)handleReset:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  v17 = (void (**)(void))a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [(CSIndexAgentApp *)self fpMonitor];
  uint64_t v8 = [v7 domainsByPath];
  uint64_t v9 = [v8 allKeys];

  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v20 + 1) + 8 * i);
        if ([v14 fileSystemRepresentation])
        {
          memset(&v19, 0, sizeof(v19));
          uint64_t v18 = 0;
          asprintf(&v18, "%s/%s", (const char *)[v14 fileSystemRepresentation], ".Spotlight-V100");
          if (!stat(v18, &v19))
          {
            long long v15 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)statfs buf = 136315138;
              id v25 = v18;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "deleting spotlight directory %s", buf, 0xCu);
            }

            sub_100005FFC((uint64_t)v18, 0, 0, 4, (long long *)&stru_100035460);
          }
          free(v18);
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v11);
  }

  if (v17) {
    v17[2]();
  }
  unsigned int v16 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Quiting for reset", (uint8_t *)&v19, 2u);
  }

  exit(0);
}

- (void)_closeAllWithCompletionHandler:(id)a3
{
  int v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003CD78);
  id v5 = [(id)qword_10003CE20 allKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CSIndexAgentApp *)self _closeIndexAtPath:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  v4[2](v4, 0);
}

- (int)_indexQueryStart:(id)a3 queryString:(id)a4 queryContext:(id)a5 queryID:(int64_t)a6 remoteConnection:(id)a7
{
  id v12 = a3;
  id v37 = a4;
  id v13 = a5;
  id v38 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  if ([v12 index])
  {
    double v36 = [v12 domain];
    id v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)statfs buf = 138412802;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a6;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v37;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Start Query[%@ %d] - %@", buf, 0x1Cu);
    }

    id v15 = [objc_alloc((Class)SPCoreSpotlightTask) initWithQueryString:v37 queryContext:v13];
    [v15 start];
    if ([v15 siQuery])
    {
      unsigned int v16 = [v15 resultsQueue];
      [v16 siResultsQueue];
      uint64_t v35 = SIExecuteQuery();
      v17 = objc_opt_new();
      [v17 setQueryTask:v15];
      [v17 setClientConnection:v38];
      uint64_t v18 = +[NSNumber numberWithInteger:a6];
      [v12 setQueryTask:v17 forID:v18];

      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100014644;
      v51[3] = &unk_100035488;
      id v52 = v12;
      int64_t v53 = a6;
      [v15 setCompletionBlock:v51];
      LOBYTE(v18) = [v13 live];
      *(void *)statfs buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      buf[24] = 0;
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x2020000000;
      char v50 = 0;
      stat v19 = [v13 fetchAttributes];
      id v20 = [v19 count];

      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000146A8;
      v39[3] = &unk_1000354F0;
      char v48 = (char)v18;
      int64_t v46 = a6;
      id v47 = v20;
      id v44 = v49;
      double v45 = buf;
      id v21 = v17;
      id v40 = v21;
      double v41 = v36;
      id v42 = v38;
      v43 = self;
      long long v22 = objc_retainBlock(v39);
      id v23 = [objc_alloc((Class)SPQueryJob) initWithSIJob:v35 dataclass:0 eventHandler:0 resultsHandler:v22];
      [v16 addJob:v23];
      [v15 addJob:v23];

      _Block_object_dispose(v49, 8);
      _Block_object_dispose(buf, 8);

      int v24 = 0;
    }
    else
    {
      [v15 finishWithError:0];
      unsigned int v16 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)statfs buf = 138412290;
        *(void *)&uint8_t buf[4] = v37;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "could not create query for %@", buf, 0xCu);
      }
      int v24 = -1;
    }

    id v26 = v36;
  }
  else
  {
    id v25 = logForCSLogCategoryDefault();
    id v26 = v25;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      sub_1000260F4(v25, v27, v28, v29, v30, v31, v32, v33);
      int v24 = -1;
      id v26 = v25;
    }
    else
    {
      int v24 = -1;
    }
  }

  return v24;
}

- (int)_scanQueryStart:(id)a3 scope:(id)a4 queryString:(id)a5 criteria:(id)a6 queryContext:(id)a7 queryID:(int64_t)a8 remoteConnection:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if ([v19 live])
  {
    id v21 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000263B0(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_9;
  }
  id v21 = [v15 volumeObject];
  if (v21)
  {
    id v29 = v16;
    uint64_t v54 = -[NSObject resolveLiveFSHandleForPathFromMountPoint:](v21, "resolveLiveFSHandleForPathFromMountPoint:", [v29 UTF8String]);
    if (v54)
    {
      id v52 = v16;
      unsigned __int8 v30 = [v29 hasPrefix:@".Trashes"];
      unsigned __int8 v48 = [v15 persistentFileIDs];
      location[1] = _NSConcreteStackBlock;
      location[2] = (id)3221225472;
      location[3] = sub_100015014;
      location[4] = &unk_100035510;
      unsigned __int8 v49 = v30;
      unsigned __int8 v73 = v30;
      uint64_t EvaluatorWithBlock = _MDCreateSimpleQueryEvaluatorWithBlock();
      if (!EvaluatorWithBlock)
      {
        int v34 = -1;
        id v16 = v52;
        uint64_t v35 = (void *)v54;
LABEL_20:

        goto LABEL_21;
      }
      id v47 = (void *)EvaluatorWithBlock;
      v51 = (void *)a8;
      int64_t v46 = [v15 domain];
      uint64_t v32 = objc_opt_new();
      [v32 setVolumeScan:v21];
      [v32 setClientConnection:v20];
      id v44 = v20;
      id v45 = v17;
      if (v29) {
        char v33 = sub_100022A98(v29);
      }
      else {
        char v33 = 1;
      }
      id v16 = v52;
      id v36 = [v29 length];
      location[0] = 0;
      objc_initWeak(location, v21);
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_1000150EC;
      v62[3] = &unk_100035558;
      v68[1] = v51;
      objc_copyWeak(v68, location);
      id v63 = v32;
      id v64 = v29;
      v68[2] = v36;
      char v69 = v33;
      unsigned __int8 v70 = v48;
      v68[3] = v47;
      id v65 = v19;
      id v37 = v46;
      unsigned __int8 v71 = v49;
      id v66 = v37;
      long long v67 = self;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100015830;
      v55[3] = &unk_1000355A0;
      v60 = v51;
      id v38 = v63;
      id v56 = v38;
      int64_t v53 = v37;
      v57 = v53;
      v58 = self;
      id v39 = v15;
      id v59 = v39;
      __int16 v61 = v47;
      uint64_t v35 = (void *)v54;
      id v40 = [v21 scanAtLiveFSHandle:v54 pathFromMountPoint:v64 withCriteria:v18 itemHandler:v62 completionHandler:v55];
      [v38 setSearchToken:v40];

      char v50 = v38;
      [v38 searchToken];
      id v20 = v44;
      double v41 = v17 = v45;

      if (v41)
      {
        id v42 = +[NSNumber numberWithInteger:v51];
        [v39 setQueryTask:v50 forID:v42];

        int v34 = 0;
      }
      else
      {
        int v34 = -1;
      }

      objc_destroyWeak(v68);
      objc_destroyWeak(location);
    }
    else
    {
      int64_t v53 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_1000263E8();
      }
      int v34 = -1;
      uint64_t v35 = 0;
    }

    goto LABEL_20;
  }
LABEL_9:
  int v34 = -1;
LABEL_21:

  return v34;
}

- (int)_queryCancel:(id)a3
{
  indexQueue = self->_indexQueue;
  id v4 = a3;
  dispatch_assert_queue_V2(indexQueue);
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "qid");

  +[NSNumber numberWithUnsignedLongLong:uint64];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015AD8;
  v8[3] = &unk_100035350;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v9;
  sub_100011000(v8);

  return 0;
}

- (void)removeChildRecords:(int64_t)a3 withIndexer:(id)a4 withVolumeName:(const char *)a5
{
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  id v9 = +[NSString stringWithFormat:@"_kMDItemQueryPathOID=%lld", a3];
  long long v10 = objc_opt_new();
  uint64_t v37 = MDItemIndexOID;
  long long v11 = +[NSArray arrayWithObjects:&v37 count:1];
  [v10 setFetchAttributes:v11];

  id v12 = +[NSString stringWithUTF8String:a5];
  id v36 = v12;
  id v13 = +[NSArray arrayWithObjects:&v36 count:1];
  [v10 setMountPoints:v13];

  if ([v8 index])
  {
    id v14 = [objc_alloc((Class)SPCoreSpotlightTask) initWithQueryString:v9 queryContext:v10];
    [v14 start];
    if ([v14 siQuery])
    {
      id v15 = [v14 resultsQueue];
      [v15 siResultsQueue];
      uint64_t v16 = SIExecuteQuery();
      id v17 = objc_opt_new();
      [v17 setQueryTask:v14];
      [v17 setClientConnection:0];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v34 = 0x2020000000;
      char v35 = 0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      void v28[2] = sub_100015EA0;
      v28[3] = &unk_1000355E8;
      id v29 = v8;
      p_long long buf = &buf;
      id v18 = v17;
      id v30 = v18;
      int64_t v32 = a3;
      id v19 = objc_retainBlock(v28);
      id v20 = [objc_alloc((Class)SPQueryJob) initWithSIJob:v16 dataclass:0 eventHandler:0 resultsHandler:v19];
      [v15 addJob:v20];
      [v14 addJob:v20];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      [v14 finishWithError:0];
      id v15 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "could not create query for %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    id v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000260F4(v14, v21, v22, v23, v24, v25, v26, v27);
    }
  }
}

- (void)_handleFSE:(id)a3
{
  id v4 = a3;
  v101 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  id v5 = (char *)[v4 dataSize];
  v104 = v4;
  id v6 = (unsigned int *)[v4 dataPtr];
  if (!v5) {
    goto LABEL_163;
  }
  id v7 = v6;
  if (!v6) {
    goto LABEL_163;
  }
  v102 = (unsigned int *)&v5[(void)[v4 dataPtr]];
  if (v7 + 8 > v102) {
    goto LABEL_163;
  }
  *(void *)&long long v8 = 67109376;
  long long v88 = v8;
  while (2)
  {
    uint64_t v9 = *v7;
    long long v10 = (char *)v7 + v9;
    if (v9) {
      BOOL v11 = v10 > (char *)v102;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11) {
      goto LABEL_163;
    }
    uint64_t v12 = *((unsigned __int16 *)v7 + 10);
    if (!*((_WORD *)v7 + 10)) {
      goto LABEL_163;
    }
    id v13 = v7 + 8;
    id v14 = (char *)v7 + *((unsigned __int16 *)v7 + 10) + 32;
    if (v14 >= v10 || *v14) {
      goto LABEL_163;
    }
    v103 = (unsigned int *)((char *)v7 + v9);
    uint64_t v15 = *((unsigned __int16 *)v7 + 11);
    uint64_t v16 = *((unsigned __int16 *)v7 + 12);
    uint64_t v98 = *((unsigned __int16 *)v7 + 13);
    uint64_t v17 = *((unsigned __int16 *)v7 + 14);
    uint64_t v97 = *((unsigned __int16 *)v7 + 15);
    unsigned int v18 = v7[1];
    int v19 = sub_100022A8C((uint64_t)(v7 + 8));
    unint64_t v20 = (unint64_t)(v14 + 1);
    if (v15)
    {
      v99 = v14 + 1;
      uint64_t v21 = (unsigned __int8 *)(v20 + v15);
      int v22 = *v21;
      unint64_t v20 = (unint64_t)(v21 + 1);
      unint64_t v23 = (unint64_t)v103;
      if (v22) {
        BOOL v24 = 1;
      }
      else {
        BOOL v24 = v20 > (unint64_t)v103;
      }
      if (v24) {
        goto LABEL_163;
      }
      if (!v16)
      {
LABEL_21:
        unint64_t v25 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v99 = 0;
      unint64_t v23 = (unint64_t)v103;
      if (!v16) {
        goto LABEL_21;
      }
    }
    unint64_t v25 = v20;
    v20 += v16;
    if (v20 > v23) {
      goto LABEL_163;
    }
LABEL_22:
    int v26 = 0;
    uint64_t v27 = 0;
    int v28 = v18 & 0xFFF;
    int v29 = ++dword_10003CD70;
    char v30 = 1;
    uint64_t v31 = 0;
    unint64_t v32 = 0;
    int v33 = 0;
    switch(v28)
    {
      case 0:
      case 2:
      case 4:
      case 6:
      case 7:
      case 8:
      case 11:
      case 12:
        goto LABEL_23;
      case 1:
        goto LABEL_24;
      case 3:
      case 5:
      case 14:
        if (v98)
        {
          if (v20 + v98 < v23)
          {
            int v54 = v19;
            int v33 = sub_100022A8C(v20);
            int v19 = v54;
            unint64_t v32 = 0;
            uint64_t v31 = 0;
            char v30 = 0;
            int v26 = 1;
            uint64_t v27 = (const void *)v20;
            goto LABEL_25;
          }
          unint64_t v32 = 0;
          uint64_t v31 = 0;
          int v33 = 0;
          int v26 = 1;
          uint64_t v27 = (const void *)v20;
        }
        else
        {
          uint64_t v27 = 0;
          unint64_t v32 = 0;
          uint64_t v31 = 0;
          int v33 = 0;
          int v26 = 1;
        }
        char v30 = 1;
        goto LABEL_25;
      case 9:
      case 10:
        if (!v17)
        {
          uint64_t v27 = 0;
          unint64_t v32 = 0;
          uint64_t v31 = 0;
          int v26 = 0;
          int v33 = 0;
          goto LABEL_25;
        }
        if (v20 + v17 >= v23)
        {
          uint64_t v27 = 0;
          uint64_t v31 = 0;
          goto LABEL_96;
        }
        if (v97)
        {
          uint64_t v31 = v17 + v20 + 1;
          if (v31 + v97 > v23)
          {
            uint64_t v27 = 0;
LABEL_96:
            int v26 = 0;
            int v33 = 0;
            char v30 = 1;
            unint64_t v32 = v20;
            goto LABEL_25;
          }
        }
        else
        {
          uint64_t v31 = 0;
        }
        uint64_t v27 = (const void *)v20;
LABEL_23:
        int v26 = 1;
LABEL_24:
        int v33 = 0;
        unint64_t v32 = (unint64_t)v27;
        char v30 = v19 ^ 1;
        uint64_t v27 = 0;
LABEL_25:
        if (v25)
        {
          uint64_t v34 = *(void *)(v25 + 8);
          if (v34)
          {
            unsigned int v36 = *(_DWORD *)(v25 + 24);
            BOOL v35 = v36 == 2;
            if (v36 > 2) {
              char v30 = 1;
            }
          }
          else
          {
            BOOL v35 = 0;
          }
        }
        else
        {
          BOOL v35 = 0;
          LOWORD(v34) = 0;
        }
        if (!v19) {
          v30 |= v33 ^ 1;
        }
        if (v30)
        {
          qword_10003CD68 = 0;
          uint64_t v37 = (void *)qword_10003CD60;
          qword_10003CD60 = 0;
LABEL_147:

          id v7 = v103;
          if (v103 + 8 > v102) {
            goto LABEL_163;
          }
          continue;
        }
        int v93 = v29;
        int v94 = v19;
        __int16 v96 = v34;
        BOOL v91 = v35;
        unsigned int v92 = v26;
        uint64_t v89 = v31;
        v90 = (const void *)v32;
        id v38 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          unsigned int v39 = v7[4];
          id v40 = "";
          if (v99) {
            id v40 = v99;
          }
          *(_DWORD *)long long buf = 67110146;
          int v123 = v93;
          __int16 v124 = 1024;
          int v125 = v28;
          __int16 v126 = 1024;
          unsigned int v127 = v39;
          __int16 v128 = 2080;
          v129 = v40;
          __int16 v130 = 2080;
          v131 = v7 + 8;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "event[%d]: %d pid:%d volume:%s path:%s", buf, 0x28u);
        }

        double v41 = [(CSIndexAgentApp *)v101 indexerForCStringVolume:v99];
        id v42 = v41;
        if (!v41
          || ![v41 index]
          || ([v42 isFSOnly] & 1) != 0
          || ([v42 readOnly] & 1) != 0)
        {
          goto LABEL_162;
        }
        uint64_t v95 = v25;
        v100 = v42;
        id v43 = [v42 rootPath];
        id v44 = (const char *)[v43 UTF8String];
        if (v44)
        {
          size_t v45 = strlen(v44);
          if (v45 - 1022 >= 0xFFFFFFFFFFFFFC00)
          {
            size_t v46 = v45;
            bzero(buf, 0x400uLL);
            __memcpy_chk();
            size_t v47 = v46 + 1;
            *(_WORD *)&buf[v46] = 47;
            uint64_t v111 = 0;
            unsigned int v48 = [v100 persistentFileIDs];
            if (v46 + 1 + v12 < 0x400) {
              int v49 = v94;
            }
            else {
              int v49 = 0;
            }
            if (v47 + v98 < 0x400) {
              int v50 = 1;
            }
            else {
              int v50 = v33 ^ 1;
            }
            if ((v96 & 0x100) != 0 && v48) {
              uint64_t v111 = *(void *)(v95 + 64);
            }
            v51 = &buf[v47];
            if (v28 == 3)
            {
              if (v48) {
                uint64_t v52 = *((void *)v7 + 1);
              }
              else {
                uint64_t v52 = 0;
              }
              int v53 = v33 & v50;
              uint64_t v55 = v111;
              uint64_t v111 = v52;
              if (v49)
              {
                if (v53)
                {
                  bzero(v120, 0x400uLL);
                  if (v55
                    || (__memcpy_chk(),
                        memcpy(&v120[v47], v27, v98 + 1),
                        [v100 oidForPath:v120 allowCreate:0]))
                  {
                    memcpy(&buf[v47], v13, v12 + 1);
                    [v100 rename:v120 toPath:buf];
                  }
                  uint64_t v56 = v111;
                  v57 = v100;
                  if (!v111)
                  {
                    uint64_t v56 = (uint64_t)[v100 oidForPath:buf allowCreate:v92];
                    uint64_t v111 = v56;
                  }
                  if (v56 >= 3)
                  {
                    if (v91)
                    {
                      long long v119 = (unint64_t)v56;
                      v58 = logForCSLogCategoryDefault();
                      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)v117 = 134217984;
                        uint64_t v118 = v111;
                        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Moving dirictory %lld", v117, 0xCu);
                      }

                      [v100 index];
                      SIMoveDirectories();
                    }
                    else
                    {
                      id v66 = logForCSLogCategoryDefault();
                      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
                      {
                        LODWORD(v119) = 134217984;
                        *(void *)((char *)&v119 + 4) = v111;
                        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "Moving file %lld", (uint8_t *)&v119, 0xCu);
                      }

                      long long v119 = (unint64_t)v111;
                      [v100 index];
                      SIMoveFiles();
                    }
                  }
                }
                else
                {
                  memcpy(&buf[v47], v13, v12 + 1);
                  v57 = v100;
                  uint64_t v59 = (uint64_t)[v100 oidForPath:buf allowCreate:v92];
                  uint64_t v60 = v59;
                  if (v59 >= 3 && v111 >= 3 && v59 != v111)
                  {
                    __int16 v61 = logForCSLogCategoryDefault();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v120 = 134218240;
                      *(void *)v121 = v111;
                      *(_WORD *)&v121[8] = 2048;
                      *(void *)&v121[10] = v60;
                      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "Transfer %lld to %lld", v120, 0x16u);
                    }

                    [v100 index];
                    SITransferAttributes();
                  }
                  uint64_t v111 = v60;
                  if (v91)
                  {
                    v62 = [v100 volumeObject];
                    id v63 = [v62 resolveLiveFSHandleForPathFromMountPoint:v13];

                    if (v63)
                    {
                      id v64 = +[NSString stringWithUTF8String:v99];
                      id v65 = +[NSString stringWithUTF8String:v13];
                      [(CSIndexAgentApp *)v101 performScan:v64 liveFSHandle:v63 pathFromMountPoint:v65 fromDate:0 allowImport:1 completionHandler:0];
                    }
                  }
                }
                if ((v96 & 0x100) != 0) {
                  *(void *)(v95 + 64) = v111;
                }
                if ((v96 & 0x200) != 0) {
                  *(void *)(v95 + 72) = 0;
                }
                int v53 = 1;
                int v28 = 2;
                uint64_t v27 = v13;
                goto LABEL_108;
              }
              int v28 = 1;
              LODWORD(v12) = v98;
            }
            else
            {
              uint64_t v27 = v7 + 8;
              int v53 = v49;
            }
            v57 = v100;
LABEL_108:
            id v67 = (id)v111;
            if (v53 && !v111)
            {
              memcpy(v51, v27, (v12 + 1));
              id v67 = [v57 oidForPath:buf allowCreate:v92];
              uint64_t v111 = (uint64_t)v67;
            }
            long long v68 = 0;
            int v69 = 1;
            switch(v28)
            {
              case 0:
              case 7:
              case 11:
                int v69 = 0;
                if (!v67) {
                  goto LABEL_143;
                }
                goto LABEL_115;
              case 1:
                if (v67)
                {
                  objc_msgSend(v100, "deleteOID:");
                  unsigned __int8 v73 = logForCSLogCategoryDefault();
                  BOOL v74 = os_log_type_enabled(v73, OS_LOG_TYPE_INFO);
                  if (v91)
                  {
                    if (v74)
                    {
                      *(_DWORD *)v120 = 134217984;
                      *(void *)v121 = v111;
                      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "removing children of oid: %lld", v120, 0xCu);
                    }

                    [(CSIndexAgentApp *)v101 removeChildRecords:v111 withIndexer:v100 withVolumeName:v99];
                  }
                  else
                  {
                    if (v74)
                    {
                      *(_DWORD *)v120 = v88;
                      *(_DWORD *)v121 = v93;
                      *(_WORD *)&v121[4] = 2048;
                      *(void *)&v121[6] = v111;
                      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "[%d] removing oid: %lld", v120, 0x12u);
                    }

                    v109[0] = _NSConcreteStackBlock;
                    v109[1] = 3221225472;
                    v109[2] = sub_10001723C;
                    v109[3] = &unk_100035608;
                    int v110 = v93;
                    v109[4] = v111;
                    [v100 removeRecordsForIDs:&v111 count:1 completionHandler:v109];
                  }
                }
                goto LABEL_143;
              case 2:
              case 4:
              case 6:
              case 8:
              case 12:
                if (!v67) {
                  goto LABEL_143;
                }
LABEL_115:
                unsigned __int8 v70 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v27, v88);
                long long v68 = sub_100022B04(v43, v70, v95, 0);
                goto LABEL_116;
              case 3:
                __int16 v75 = logForCSLogCategoryDefault();
                if (!os_log_type_enabled(v75, OS_LOG_TYPE_INFO)) {
                  goto LABEL_142;
                }
                *(_WORD *)v120 = 0;
                int64_t v76 = v75;
                v77 = "FSE_RENAME not implemented";
                goto LABEL_141;
              case 5:
                __int16 v75 = logForCSLogCategoryDefault();
                if (!os_log_type_enabled(v75, OS_LOG_TYPE_INFO)) {
                  goto LABEL_142;
                }
                *(_WORD *)v120 = 0;
                int64_t v76 = v75;
                v77 = "FSE_EXCHANGE not implemented";
                goto LABEL_141;
              case 9:
                long long v68 = 0;
                if (!v89 || !v67 || !v90) {
                  goto LABEL_144;
                }
                v78 = +[NSString stringWithUTF8String:v90];
                v115 = v78;
                v79 = +[NSData dataWithBytesNoCopy:v89 length:v97 freeWhenDone:0];
                v116 = v79;
                int v69 = 1;
                unsigned __int8 v70 = +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];

                v80 = +[NSString stringWithUTF8String:v27];
                long long v68 = sub_100022B04(v43, v80, v95, v70);

                goto LABEL_116;
              case 10:
                long long v68 = 0;
                if (!v67 || !v90) {
                  goto LABEL_144;
                }
                v81 = +[NSString stringWithUTF8String:v90];
                v113 = v81;
                CFNullRef v114 = kCFNull;
                int v69 = 1;
                unsigned __int8 v70 = +[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];

                v82 = +[NSString stringWithUTF8String:v27];
                long long v68 = sub_100022B04(v43, v82, v95, v70);

LABEL_116:
                uint64_t v71 = v111;
                if (!v111 || !v68) {
                  goto LABEL_144;
                }
                if (v111 != qword_10003CD68) {
                  goto LABEL_150;
                }
                if ([(id)qword_10003CD60 isEqual:v68])
                {
                  stat v72 = logForCSLogCategoryDefault();
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v120 = 134217984;
                    *(void *)v121 = v111;
                    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "skipping duplicate event for oid: %lld", v120, 0xCu);
                  }

LABEL_145:
                  uint64_t v37 = v100;
                }
                else
                {
                  uint64_t v71 = v111;
LABEL_150:
                  *(void *)&long long v119 = v71;
                  v112 = v68;
                  v84 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v112, 1, v88);
                  v85 = [v100 dirtyIdleTimer];
                  [v85 dirty];

                  v86 = logForCSLogCategoryDefault();
                  BOOL v87 = os_log_type_enabled(v86, OS_LOG_TYPE_INFO);
                  if (v69)
                  {
                    if (v87)
                    {
                      *(_DWORD *)v120 = 67109634;
                      *(_DWORD *)v121 = v93;
                      *(_WORD *)&v121[4] = 2048;
                      *(void *)&v121[6] = v111;
                      *(_WORD *)&v121[14] = 2112;
                      *(void *)&v121[16] = v68;
                      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "[%d] update oid: %lld info: %@", v120, 0x1Cu);
                    }

                    v107[0] = _NSConcreteStackBlock;
                    v107[1] = 3221225472;
                    v107[2] = sub_10001732C;
                    v107[3] = &unk_100035608;
                    int v108 = v93;
                    v107[4] = v111;
                    uint64_t v37 = v100;
                    [v100 updateRecords:v84 forIDs:&v119 completionHandler:v107];
                  }
                  else
                  {
                    if (v87)
                    {
                      *(_DWORD *)v120 = 67109634;
                      *(_DWORD *)v121 = v93;
                      *(_WORD *)&v121[4] = 2048;
                      *(void *)&v121[6] = v111;
                      *(_WORD *)&v121[14] = 2112;
                      *(void *)&v121[16] = v68;
                      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "[%d] add oid: %lld info: %@", v120, 0x1Cu);
                    }

                    v105[0] = _NSConcreteStackBlock;
                    v105[1] = 3221225472;
                    v105[2] = sub_10001741C;
                    v105[3] = &unk_100035608;
                    int v106 = v93;
                    v105[4] = v111;
                    uint64_t v37 = v100;
                    [v100 addRecords:v84 forIDs:&v119 completionHandler:v105];
                  }
                  qword_10003CD68 = v111;
                  objc_storeStrong((id *)&qword_10003CD60, v68);
                }
                break;
              case 14:
                __int16 v75 = logForCSLogCategoryDefault();
                if (!os_log_type_enabled(v75, OS_LOG_TYPE_INFO)) {
                  goto LABEL_142;
                }
                *(_WORD *)v120 = 0;
                int64_t v76 = v75;
                v77 = "FSE_CLONE not implemented";
LABEL_141:
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, v77, v120, 2u);
LABEL_142:

LABEL_143:
                long long v68 = 0;
LABEL_144:
                qword_10003CD68 = 0;
                v83 = (void *)qword_10003CD60;
                qword_10003CD60 = 0;

                goto LABEL_145;
              default:
                goto LABEL_144;
            }
            goto LABEL_147;
          }
        }

LABEL_162:
LABEL_163:

        return;
      case 13:
        goto LABEL_25;
      default:
        unint64_t v32 = 0;
        uint64_t v31 = 0;
        int v33 = 0;
        goto LABEL_25;
    }
  }
}

- (void)handleCloseAll:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  indexQueue = self->_indexQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000175AC;
  v8[3] = &unk_100035378;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(indexQueue, v8);
}

- (void)handleScan:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  indexQueue = self->_indexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001771C;
  block[3] = &unk_100035658;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(indexQueue, block);
}

- (void)handleMount:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  indexQueue = self->_indexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017894;
  block[3] = &unk_100035658;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(indexQueue, block);
}

- (void)handleQueryStart:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    indexQueue = self->_indexQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000179C0;
    block[3] = &unk_100035680;
    id v10 = v6;
    BOOL v11 = self;
    id v12 = v7;
    dispatch_async(indexQueue, block);
  }
}

- (void)handleQueryCancel:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  indexQueue = self->_indexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018084;
  block[3] = &unk_100035658;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(indexQueue, block);
}

- (void)handleFSE:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = +[CSXPCConnection dataWrapperForKey:"data" sizeKey:"data-size" fromXPCDictionary:a3];
  if ([v7 dataPtr])
  {
    indexQueue = self->_indexQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000181E4;
    v9[3] = &unk_1000356A8;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(indexQueue, v9);
  }
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)performScan:(id)a3 liveFSHandle:(id)a4 pathFromMountPoint:(id)a5 fromDate:(id)a6 allowImport:(BOOL)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  indexQueue = self->_indexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018368;
  block[3] = &unk_100035720;
  void block[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v17;
  BOOL v31 = a7;
  id v29 = v16;
  id v30 = v18;
  id v20 = v18;
  id v21 = v16;
  id v22 = v17;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(indexQueue, block);
}

- (int)_mountVolume:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_indexQueue);
  string = xpc_dictionary_get_string(v4, "url");
  if (string)
  {
    id v6 = +[NSString stringWithUTF8String:string];
    id v7 = +[NSURL URLWithString:v6];

    if ([v7 isFileURL])
    {
      long long v8 = [v7 path];

      if (v8) {
        goto LABEL_4;
      }
    }
    else
    {
    }
LABEL_13:
    int v10 = -1;
    goto LABEL_14;
  }
  BOOL v11 = xpc_dictionary_get_string(v4, "command");
  if (!v11) {
    goto LABEL_13;
  }
  id v12 = v11;
  if (strncmp(v11, "mount:", 6uLL)) {
    goto LABEL_13;
  }
  int v15 = *((unsigned __int8 *)v12 + 6);
  id v14 = v12 + 6;
  int v13 = v15;
  if (!v15) {
    goto LABEL_13;
  }
  if (v13 == 47) {
    +[NSString stringWithUTF8String:v14];
  }
  else {
  long long v8 = +[NSString stringWithFormat:@"%s%s", "/private/var/mobile/Library/LiveFiles/com.apple.filesystems.userfsd/", v14];
  }
  if (!v8) {
    goto LABEL_13;
  }
LABEL_4:
  id v9 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "mounted at %@", buf, 0xCu);
  }

  [(CSIndexAgentApp *)self _handleMount:v8 force:1];
  int v10 = 0;
LABEL_14:

  return v10;
}

- (void)_handleScan:(id)a3 completionHandler:(id)a4
{
  id v18 = (void (**)(id, uint64_t))a4;
  indexQueue = self->_indexQueue;
  id v7 = a3;
  dispatch_assert_queue_V2(indexQueue);
  string = xpc_dictionary_get_string(v7, "command");

  if (!string || strncmp(string, "scan", 4uLL))
  {
    v18[2](v18, 0xFFFFFFFFLL);
    goto LABEL_20;
  }
  int v9 = strncmp(string + 4, "Import", 6uLL);
  int v10 = string + 10;
  uint64_t v11 = 4;
  if (v9) {
    int v10 = string + 4;
  }
  else {
    uint64_t v11 = 10;
  }
  if (string[v11] != 58
    || (v12 = (char *)(v10 + 1), __endptr = (char *)(v10 + 1), uint64_t v13 = strtol(v10 + 1, &__endptr, 0), __endptr == v12))
  {
    int v15 = 0;
  }
  else
  {
    double v14 = (double)v13;
    if (v13 < 0) {
      +[NSDate dateWithTimeIntervalSinceNow:v14];
    }
    else {
    int v15 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v14];
    }
  }
  id v16 = +[VolumeScan volumeNames];
  id v17 = [v16 firstObject];

  if (v17)
  {
    [(CSIndexAgentApp *)self performScan:v17 liveFSHandle:0 pathFromMountPoint:0 fromDate:v15 allowImport:v9 == 0 completionHandler:v18];
  }
  else if (v18)
  {
    ((void (*)(void))v18[2])();
    goto LABEL_19;
  }
  id v18 = 0;
LABEL_19:

LABEL_20:
}

- (void)handleResolvePath:(const char *)a3 info:(id)a4 completionBlock:(id)a5
{
  id v7 = a5;
  memset(&v16, 0, sizeof(v16));
  if (stat(a3, &v16))
  {
    long long v8 = __error();
    if (!v7) {
      return;
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, *v8, 0);
  }
  else
  {
    int v9 = +[NSString stringWithUTF8String:a3];
    indexQueue = self->_indexQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100018C0C;
    v11[3] = &unk_100035748;
    id v12 = v9;
    uint64_t v13 = self;
    id v14 = v7;
    int v15 = a3;
    id v7 = v9;
    dispatch_async(indexQueue, v11);
  }
}

- (void)handleResolveInfo:(const char *)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = +[NSString stringWithUTF8String:a3];
  long long v8 = [v7 componentsSeparatedByString:@":"];

  id v9 = [v8 count];
  if ((unint64_t)v9 >= 3)
  {
    indexQueue = self->_indexQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018F98;
    block[3] = &unk_100035770;
    id v14 = v9;
    id v12 = v8;
    id v13 = v6;
    dispatch_async(indexQueue, block);

    id v6 = v12;
LABEL_5:

    goto LABEL_6;
  }
  if (v6)
  {
    (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 0xFFFFFFFFLL, 0);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)handleWalkPath:(const char *)a3 flat:(BOOL)a4 completionBlock:(id)a5
{
  id v7 = (void (**)(id, uint64_t, void))a5;
  *(void *)&long long v9 = _NSConcreteStackBlock;
  *((void *)&v9 + 1) = 3221225472;
  int v10 = sub_1000192D0;
  uint64_t v11 = &unk_100035790;
  BOOL v12 = a4;
  uint64_t v8 = sub_100005FFC((uint64_t)a3, 0, 0, 4, &v9);
  if (v7) {
    v7[2](v7, v8, 0);
  }
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  id v8 = a4;
  long long v9 = (_xpc_connection_s *)a5;
  int v10 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000266C8((uint64_t)a3, v9, v10);
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  void v28[2] = sub_1000198B4;
  v28[3] = &unk_1000357B8;
  id v11 = v8;
  id v29 = v11;
  BOOL v12 = objc_retainBlock(v28);
  if (!strcmp(a3, "fse"))
  {
    [(CSIndexAgentApp *)self handleFSE:v11 completionBlock:v12];
    goto LABEL_21;
  }
  if (!strcmp(a3, "startQuery"))
  {
    queryQueue = self->_queryQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001999C;
    block[3] = &unk_100035658;
    void block[4] = self;
    id v26 = v11;
    id v27 = v12;
    dispatch_async(queryQueue, block);

    id v14 = v26;
LABEL_20:

    goto LABEL_21;
  }
  if (!strcmp(a3, "cancelQuery"))
  {
    int v15 = self->_queryQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000199AC;
    v22[3] = &unk_100035658;
    v22[4] = self;
    id v23 = v11;
    id v24 = v12;
    dispatch_async(v15, v22);

    id v14 = v23;
    goto LABEL_20;
  }
  if (!strncmp(a3, "mount", 5uLL))
  {
    [(CSIndexAgentApp *)self handleMount:v11 completionBlock:v12];
    goto LABEL_21;
  }
  if (!strncmp(a3, "scan", 4uLL))
  {
    [(CSIndexAgentApp *)self handleScan:v11 completionBlock:v12];
    goto LABEL_21;
  }
  if (!strcmp(a3, "closeAll"))
  {
    [(CSIndexAgentApp *)self handleCloseAll:v11 completionBlock:v12];
    goto LABEL_21;
  }
  if (!strcmp(a3, "status"))
  {
    [(CSIndexAgentApp *)self handleStatus:v11 completionBlock:v12];
    goto LABEL_21;
  }
  if (!strcmp(a3, "reset"))
  {
    [(CSIndexAgentApp *)self handleReset:v11 completionBlock:v12];
    goto LABEL_21;
  }
  if (!strncmp(a3, "resolve:", 8uLL))
  {
    [(CSIndexAgentApp *)self handleResolvePath:a3 + 8 info:v11 completionBlock:v12];
    goto LABEL_21;
  }
  if (!strncmp(a3, "resolveOIDs:", 0xCuLL))
  {
    [(CSIndexAgentApp *)self handleResolveInfo:a3 completionBlock:v12];
    goto LABEL_21;
  }
  if (!strncmp(a3, "walk:", 5uLL))
  {
    id v17 = a3 + 5;
    id v18 = self;
    uint64_t v19 = 0;
LABEL_31:
    [(CSIndexAgentApp *)v18 handleWalkPath:v17 flat:v19 completionBlock:v12];
    goto LABEL_21;
  }
  if (!strncmp(a3, "walkFlat:", 5uLL))
  {
    id v17 = a3 + 9;
    id v18 = self;
    uint64_t v19 = 1;
    goto LABEL_31;
  }
  if (!strcmp(a3, "quit"))
  {
    if (v12) {
      ((void (*)(void *, void, void))v12[2])(v12, 0, 0);
    }
    id v20 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Quiting", (uint8_t *)&v21, 2u);
    }

    exit(0);
  }
  ((void (*)(void *, uint64_t, void))v12[2])(v12, 0xFFFFFFFFLL, 0);
LABEL_21:

  return 1;
}

- (BOOL)lostClientConnection:(id)a3 error:(id)a4
{
  id v5 = a3;
  indexQueue = self->_indexQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019A60;
  block[3] = &unk_1000352B0;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(indexQueue, block);

  return 0;
}

- (OS_dispatch_queue)indexQueue
{
  return self->_indexQueue;
}

- (void)setIndexQueue:(id)a3
{
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (void)setQueryQueue:(id)a3
{
}

- (id)monitoringContext
{
  return self->_monitoringContext;
}

- (void)setMonitoringContext:(id)a3
{
}

- (FPMonitor)fpMonitor
{
  return self->_fpMonitor;
}

- (void)setFpMonitor:(id)a3
{
}

- (BOOL)queryQueueActive
{
  return self->_queryQueueActive;
}

- (void)setQueryQueueActive:(BOOL)a3
{
  self->_queryQueueActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpMonitor, 0);
  objc_storeStrong(&self->_monitoringContext, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);

  objc_storeStrong((id *)&self->_indexQueue, 0);
}

@end