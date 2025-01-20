@interface GSManager
- (BOOL)_createLibraryWithDiskInfos:(id *)a3 createIfNone:(BOOL)a4 error:(id *)a5;
- (BOOL)_forsakePath:(id)a3;
- (BOOL)_generationForsakeRow:(id)a3 withCredential:(const GSCredential *)a4 error:(id *)a5;
- (BOOL)_pathIsStaged:(id)a3;
- (BOOL)_removeAddition:(int64_t)a3 inNameSpace:(id)a4 named:(id)a5 credentials:(const GSCredential *)a6 error:(id *)a7;
- (BOOL)_removeAdditionByRow:(id)a3 credentials:(const GSCredential *)a4 error:(id *)a5;
- (BOOL)_thinningPrecompute:(BOOL)a3 error:(id *)a4;
- (BOOL)checkForDBUpgrade;
- (BOOL)dispatchSync:(id)a3;
- (BOOL)isCloningCapable;
- (BOOL)isEnabled;
- (BOOL)isIgnoringOwners;
- (BOOL)isInconsistent;
- (BOOL)isInvalidated;
- (BOOL)isReadOnly;
- (BOOL)isRootFS;
- (BOOL)isThrottlingIo;
- (BOOL)removePendingDeleteDocumentTimerForDocID:(id)a3;
- (GSLibraryState)state;
- (GSManager)init;
- (GSManager)initWithDisk:(id *)a3 createIfNone:(BOOL)a4 error:(id *)a5;
- (NSString)description;
- (NSString)libraryRoot;
- (NSString)stagingPath;
- (NSUUID)volumeUUID;
- (id)_additionDictionary:(id)a3 path:(id)a4;
- (id)_additionDictionary:(id)a3 path:(id)a4 isDir:(BOOL)a5;
- (id)_additionDictionary:(id)a3 url:(id)a4;
- (id)_createAddition:(int64_t)a3 creationInfo:(id)a4 isDir:(BOOL)a5 stagedPath:(id)a6 credentials:(const GSCredential *)a7 error:(id *)a8;
- (id)_getAddition:(int64_t)a3 inNameSpace:(id)a4 named:(id)a5 credentials:(const GSCredential *)a6 error:(id *)a7;
- (id)_listAdditions:(int64_t)a3 nameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 andEnumerationState:(id)a7 credentials:(const GSCredential *)a8;
- (id)_setAdditionNameSpace:(int64_t)a3 inNameSpace:(id)a4 named:(id)a5 newNameSpace:(id)a6 credentials:(const GSCredential *)a7 error:(id *)a8;
- (id)makeStagingPathForCredential:(const GSCredential *)a3 prefix:(id)a4 stagedName:(id)a5;
- (id)makeStoragePathForGenerationNamed:(id)a3 storageID:(int64_t)a4 clientID:(id)a5 forUID:(unsigned int)a6 makePublic:(BOOL)a7;
- (id)pendingDeleteDocumentTimerForDocID:(id)a3;
- (int)device;
- (int)volDirFd;
- (int64_t)_purgeAggressively:(unint64_t *)a3 credentials:(const GSCredential *)a4 whilePredicateIsTrue:(id)a5;
- (int64_t)_purgeGenerationsWithCredentials:(const GSCredential *)a3;
- (int64_t)estimatePurgeableSpace;
- (int64_t)purgeTryingToReclaimSpace:(int64_t)a3 highUrgency:(BOOL)a4;
- (unint64_t)computeNumberOfPruneableStorages;
- (unint64_t)computePruneableNumberOfGenerations;
- (unint64_t)computePurgeableSpace;
- (void)_actOnDocidChange:(unint64_t)a3 src:(unint64_t)a4 dst:(unint64_t)a5;
- (void)_actOnDocidDeletion:(unint64_t)a3 row:(id)a4;
- (void)_fseventAtPaths:(const char *)a3 flags:(const unsigned int *)a4 eventIds:(const unint64_t *)a5 count:(unint64_t)a6;
- (void)_invalidate;
- (void)_nukeStorageID:(int64_t)a3;
- (void)_purgePurgatory;
- (void)_purgeWithCredential:(const GSCredential *)a3 tryingToFreeSpace:(int64_t)a4 highUrgency:(BOOL)a5 whilePredicateIsTrue:(id)a6 done:(id)a7;
- (void)_removeAllAdditions:(int64_t)a3 inNameSpace:(id)a4 credentials:(const GSCredential *)a5;
- (void)_updateThrottlingProperty:(id)a3;
- (void)_validateGenerationsStorage:(id *)a3 forEntry:(_ftsent *)a4 forStorageId:(int64_t)a5 andClientName:(id)a6;
- (void)_validateGenerationsStorageTree:(const char *)a3 atDepth:(int)a4;
- (void)_validateGenerationsTable;
- (void)cleanupStagingPath:(id)a3 withCredential:(const GSCredential *)a4;
- (void)dealloc;
- (void)extensionsForStorageID:(int64_t)a3 credentials:(const GSCredential *)a4 pubExt:(id *)a5 privExt:(id *)a6;
- (void)invalidate:(BOOL)a3;
- (void)lowDiskStatusChangedForDevice:(int)a3 hasEnoughSpace:(BOOL)a4;
- (void)powerLevelChanged:(BOOL)a3;
- (void)purgeWithCredential:(const GSCredential *)a3 whilePredicateIsTrue:(id)a4 done:(id)a5;
- (void)resolveDocId:(unint64_t)a3 reply:(id)a4;
- (void)setIsIgnoringOwners:(BOOL)a3;
- (void)setIsInconsistent:(BOOL)a3;
- (void)setPendingDeleteDocumentTimer:(id)a3 forDocID:(id)a4;
- (void)start;
- (void)validateLibrary;
@end

@implementation GSManager

- (void)extensionsForStorageID:(int64_t)a3 credentials:(const GSCredential *)a4 pubExt:(id *)a5 privExt:(id *)a6
{
  if (!a5)
  {
    v12 = 0;
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v11 = +[NSString stringWithFormat:@"%@/%llx", @"AllUIDs", a3];
  v12 = [(NSString *)self->_libraryRoot stringByAppendingPathComponent:v11];

  long long v13 = *(_OWORD *)&a4->auditToken.val[4];
  long long v16 = *(_OWORD *)a4->auditToken.val;
  long long v17 = v13;
  objc_msgSend(v12, "gs_issueReadExtensionIfNeededForAuditToken:", &v16);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
LABEL_3:
    v14 = +[NSString stringWithFormat:@"%@/%d/%llx", @"PerUID", a4->uid, a3];

    v12 = [(NSString *)self->_libraryRoot stringByAppendingPathComponent:v14];

    long long v15 = *(_OWORD *)&a4->auditToken.val[4];
    long long v16 = *(_OWORD *)a4->auditToken.val;
    long long v17 = v15;
    objc_msgSend(v12, "gs_issueReadExtensionIfNeededForAuditToken:", &v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
}

- (NSString)libraryRoot
{
  return self->_libraryRoot;
}

- (BOOL)dispatchSync:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003508;
  block[3] = &unk_1000417B0;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)_getAddition:(int64_t)a3 inNameSpace:(id)a4 named:(id)a5 credentials:(const GSCredential *)a6 error:(id *)a7
{
  v10 = +[GSGenerationRow generationRow:storageID:name:clientID:error:](GSGenerationRow, "generationRow:storageID:name:clientID:error:", self->_db, a3, a5, a4);
  if ([v10 isAccessibleByUID:a6->uid error:a7])
  {
    uint64_t v11 = [v10 fullPath:self];
    v12 = [(GSManager *)self _additionDictionary:v10 path:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isInconsistent
{
  return self->_state->state == 2;
}

- (void)setIsInconsistent:(BOOL)a3
{
  state = self->_state;
  if (a3)
  {
    int v4 = 2;
  }
  else
  {
    if (state->state == 2) {
      return;
    }
    int v4 = 0;
  }
  state->state = v4;
}

- (BOOL)isCloningCapable
{
  return BYTE2(self->_volumeCapabilitiesInterfaces) & 1;
}

- (BOOL)isThrottlingIo
{
  return !self->_lowDisk && !self->_powerIsOK;
}

- (void)_updateThrottlingProperty:(id)a3
{
  int v4 = (void (**)(void))a3;
  v5 = self;
  objc_sync_enter(v5);
  unsigned int v6 = [(GSManager *)v5 isThrottlingIo];
  v4[2](v4);
  unsigned int v7 = [(GSManager *)v5 isThrottlingIo];
  objc_sync_exit(v5);

  if (v6 != v7)
  {
    v8 = sub_100002D4C();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        int device = v5->_device;
        int v13 = 67109120;
        int v14 = device;
        uint64_t v11 = "[NOTICE] Quitting throttled mode on device %d";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 8u);
      }
    }
    else if (v9)
    {
      int v12 = v5->_device;
      int v13 = 67109120;
      int v14 = v12;
      uint64_t v11 = "[WARNING] Entering throttled mode on device %d";
      goto LABEL_7;
    }
  }
}

- (void)lowDiskStatusChangedForDevice:(int)a3 hasEnoughSpace:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001EF30;
  v5[3] = &unk_1000416C8;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(queue, v5);
}

- (void)powerLevelChanged:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F048;
  v4[3] = &unk_1000416C8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (id)pendingDeleteDocumentTimerForDocID:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = [(NSMutableDictionary *)v5->_pendingDeleteDocuments objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)setPendingDeleteDocumentTimer:(id)a3 forDocID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unsigned int v7 = self;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)v7->_pendingDeleteDocuments setObject:v8 forKey:v6];
  objc_sync_exit(v7);
}

- (BOOL)removePendingDeleteDocumentTimerForDocID:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_pendingDeleteDocuments objectForKeyedSubscript:v4];

  if (v6) {
    [(NSMutableDictionary *)v5->_pendingDeleteDocuments removeObjectForKey:v4];
  }
  objc_sync_exit(v5);

  return v6 != 0;
}

- (void)resolveDocId:(unint64_t)a3 reply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F328;
  v7[3] = &unk_1000416F0;
  id v8 = a4;
  unint64_t v9 = a3;
  v7[4] = self;
  id v6 = v8;
  [(GSManager *)self dispatchSync:v7];
}

- (void)_actOnDocidDeletion:(unint64_t)a3 row:(id)a4
{
  id v6 = a4;
  v6[8] = 1001;
  *((void *)v6 + 2) = 0;
  unsigned int v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002BCBC();
  }

  [v6 saveToDB:self->_db];
  id v8 = +[NSNumber numberWithUnsignedLongLong:a3];
  unint64_t v9 = [(GSManager *)self pendingDeleteDocumentTimerForDocID:v8];

  if (!v9)
  {
    dispatch_time_t v10 = dispatch_time(0, 2000000000);
    uint64_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    dispatch_source_set_timer(v11, v10, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = sub_10001F7BC;
    v24[4] = sub_10001F7CC;
    id v25 = (id)os_transaction_create();
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001F7D4;
    handler[3] = &unk_100041718;
    handler[5] = v24;
    handler[6] = a3;
    handler[4] = self;
    dispatch_source_set_cancel_handler(v11, handler);
    int v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    long long v16 = sub_10001F848;
    long long v17 = &unk_100041740;
    v18 = v6;
    v19 = self;
    unint64_t v21 = a3;
    unint64_t v22 = a3;
    int v12 = v11;
    v20 = v12;
    dispatch_source_set_event_handler(v12, &v14);
    int v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3, v14, v15, v16, v17);
    [(GSManager *)self setPendingDeleteDocumentTimer:v12 forDocID:v13];

    dispatch_resume(v12);
    _Block_object_dispose(v24, 8);
  }
}

- (void)_actOnDocidChange:(unint64_t)a3 src:(unint64_t)a4 dst:(unint64_t)a5
{
  uint64_t v8 = +[GSFileRow fileRow:self->_db byFileID:a5];
  unint64_t v9 = (void *)v8;
  if (v8 && *(void *)(v8 + 40) != a3)
  {
    dispatch_time_t v10 = sub_100002D4C();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      int v17 = 134218498;
      unint64_t v18 = a5;
      __int16 v19 = 2112;
      v20 = v9;
      __int16 v21 = 2048;
      unint64_t v22 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v10, (os_log_type_t)0x90u, "[ERROR] FileID %lld was already tracked as %@, received %lld: simulating deletion", (uint8_t *)&v17, 0x20u);
    }

    [(GSManager *)self _actOnDocidDeletion:v9[5] row:v9];
  }
  uint64_t v11 = +[GSFileRow fileRow:self->_db byDocumentID:a3];

  int v12 = sub_100002D4C();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13) {
      sub_10002BDF8();
    }

    *(_DWORD *)(v11 + 32) = 1;
    *(void *)(v11 + 16) = a5;
    [(id)v11 saveToDB:self->_db];
  }
  else
  {
    if (v13) {
      sub_10002BD90();
    }

    +[GSFileRow createEntry:self->_db withDocumentID:a3 fileID:a5 error:0];
  }
  int v14 = self;
  objc_sync_enter(v14);
  uint64_t v15 = +[NSNumber numberWithUnsignedLongLong:a3];
  long long v16 = [(NSMutableDictionary *)v14->_pendingDeleteDocuments objectForKeyedSubscript:v15];
  if (v16)
  {
    [(NSMutableDictionary *)v14->_pendingDeleteDocuments removeObjectForKey:v15];
    dispatch_source_cancel(v16);
  }

  objc_sync_exit(v14);
}

- (void)_fseventAtPaths:(const char *)a3 flags:(const unsigned int *)a4 eventIds:(const unint64_t *)a5 count:(unint64_t)a6
{
  if (!self->_invalidated)
  {
    db = self->_db;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001FBD4;
    v7[3] = &unk_100041768;
    v7[4] = self;
    void v7[5] = a6;
    v7[6] = a3;
    v7[7] = a4;
    v7[8] = a5;
    [(PQLConnection *)db groupInBatch:v7];
  }
}

- (BOOL)_createLibraryWithDiskInfos:(id *)a3 createIfNone:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  unsigned int v7 = +[NSFileManager defaultManager];
  v83[0] = NSFileOwnerAccountID;
  v83[1] = NSFileGroupOwnerAccountID;
  v84[0] = &off_100044280;
  v84[1] = &off_100044280;
  v83[2] = NSFilePosixPermissions;
  v84[2] = &off_100044298;
  uint64_t v67 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:3];
  v81[0] = NSFileOwnerAccountID;
  v81[1] = NSFileGroupOwnerAccountID;
  v82[0] = &off_100044280;
  v82[1] = &off_100044280;
  v81[2] = NSFilePosixPermissions;
  v82[2] = &off_1000442B0;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:3];
  v79[0] = NSFileOwnerAccountID;
  v79[1] = NSFileGroupOwnerAccountID;
  v80[0] = &off_100044280;
  v80[1] = &off_100044280;
  v79[2] = NSFilePosixPermissions;
  v80[2] = &off_1000442B0;
  unint64_t v9 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:3];
  int volDirFd = self->_volDirFd;
  if ((volDirFd & 0x80000000) == 0)
  {
    close(volDirFd);
    self->_int volDirFd = -1;
  }
  int libDirfd = self->_libDirfd;
  if ((libDirfd & 0x80000000) == 0)
  {
    close(libDirfd);
    self->_int libDirfd = -1;
  }
  int v12 = a3;
  int v13 = sub_10000CA14();
  self->_int volDirFd = v13;
  int v14 = v7;
  uint64_t v15 = (void *)v67;
  long long v16 = (void *)v8;
  if (v13 < 0 || fcntl(v13, 50, v78) < 0)
  {
    v28 = +[NSString stringWithFormat:@"unable to open library for device %x", a3->var0];
    int v29 = *__error();
    v30 = sub_100002D4C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  int v17 = +[NSString gs_stringWithFileSystemRepresentation:v78];
  p_libraryRoot = (void **)&self->_libraryRoot;
  libraryRoot = self->_libraryRoot;
  self->_libraryRoot = v17;

  v20 = [(NSString *)self->_libraryRoot stringByAppendingPathComponent:@".DocumentRevisions-V100"];
  __int16 v21 = self->_libraryRoot;
  self->_libraryRoot = v20;

  int v22 = openat(self->_volDirFd, ".DocumentRevisions-V100", 33028);
  self->_int libDirfd = v22;
  if (v22 == -1)
  {
    if (*__error() != 2)
    {
      v28 = +[NSString stringWithFormat:@"failed to open library dir: %@", *p_libraryRoot];
      int v29 = *__error();
      v30 = sub_100002D4C();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    if (!v5 || a3->var2)
    {
      v23 = +[NSString stringWithFormat:@"no library on volume"];
      v32 = sub_100002D4C();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        sub_1000290A0();
      }

      v26 = a5;
      if (!a5) {
        goto LABEL_46;
      }
      int v33 = 102;
      goto LABEL_44;
    }
    if (mkdirat(self->_volDirFd, ".DocumentRevisions-V100", 0x49u) < 0 && *__error() != 2)
    {
      v28 = +[NSString stringWithFormat:@"unable to craete storage directory"];
      int v29 = *__error();
      v30 = sub_100002D4C();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    int v48 = openat(self->_volDirFd, ".DocumentRevisions-V100", 33028);
    self->_int libDirfd = v48;
    if (v48 == -1)
    {
      v28 = +[NSString stringWithFormat:@"failed to open storage directory"];
      int v29 = *__error();
      v30 = sub_100002D4C();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    if (!fchown(v48, 0, 0))
    {
      v50 = acl_init(0);
      if (v50)
      {
        v51 = v50;
        if (acl_set_fd_np(self->_libDirfd, v50, ACL_TYPE_EXTENDED))
        {
          v52 = sub_100002D4C();
          if (os_log_type_enabled(v52, (os_log_type_t)0x90u)) {
            sub_10002BE8C(v52);
          }

          int v12 = a3;
        }
        acl_free(v51);
      }
      goto LABEL_87;
    }
    v28 = +[NSString stringWithFormat:@"chown(%@) failed", *p_libraryRoot];
    int v29 = *__error();
    v30 = sub_100002D4C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
LABEL_14:
    }
      sub_100026B74();
LABEL_15:

    if (a5)
    {
      sub_100011F0C(v29, v28);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    v31 = 0;
    goto LABEL_18;
  }
  memset(&v77, 0, sizeof(v77));
  if (fstat(v22, &v77))
  {
    v23 = +[NSString stringWithFormat:@"fstat(%@) failed", *p_libraryRoot];
    int v24 = *__error();
    id v25 = sub_100002D4C();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:

      v26 = a5;
      if (!a5)
      {
        int v12 = a3;
LABEL_46:

LABEL_47:
        v31 = 0;
        goto LABEL_48;
      }
      v27 = sub_100011F0C(v24, v23);
      int v12 = a3;
LABEL_45:
      id *v26 = v27;
      goto LABEL_46;
    }
LABEL_10:
    sub_100026B74();
    goto LABEL_11;
  }
  if ((v77.st_mode & 0xF000) != 0x4000)
  {
    v26 = a5;
    if (a3->var2)
    {
      v23 = +[NSString stringWithFormat:@"storage is read-only"];
      v36 = sub_100002D4C();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        sub_100029A14();
      }

      if (!a5) {
        goto LABEL_46;
      }
      int v33 = 111;
    }
    else
    {
      v46 = sub_100002D4C();
      if (os_log_type_enabled(v46, (os_log_type_t)0x90u)) {
        sub_10002BFA0();
      }

      int v12 = a3;
      if (sub_100020C4C(*p_libraryRoot, 1)) {
        goto LABEL_63;
      }
      v23 = +[NSString stringWithFormat:@"unable to rename %@ away", *p_libraryRoot];
      v49 = sub_100002D4C();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        sub_100028658();
      }

      if (!a5) {
        goto LABEL_46;
      }
      int v33 = 101;
    }
LABEL_44:
    v27 = sub_100003600(v33, v23, 0);
    goto LABEL_45;
  }
  int v34 = v77.st_mode & 0x1FF;
  if (v34 == 457 || v34 == 73)
  {
    if (!a3->var1)
    {
      if (!a3->var2 && *(void *)&v77.st_uid && fchown(self->_libDirfd, 0, 0))
      {
        v23 = +[NSString stringWithFormat:@"chown(%@) failed", *p_libraryRoot];
        int v24 = *__error();
        id v25 = sub_100002D4C();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      goto LABEL_87;
    }
    if (!*(void *)&v77.st_uid) {
      goto LABEL_87;
    }
  }
  if (!a3->var2)
  {
    v35 = sub_100002D4C();
    if (os_log_type_enabled(v35, (os_log_type_t)0x90u)) {
      sub_10002BF34();
    }

    v26 = a5;
    int v12 = a3;
    if (!sub_100020C4C(*p_libraryRoot, 2)) {
      goto LABEL_47;
    }
LABEL_63:
    close(self->_libDirfd);
    self->_int libDirfd = -1;
    v47 = self->_libraryRoot;
    self->_libraryRoot = 0;

    BOOL v44 = [(GSManager *)self _createLibraryWithDiskInfos:v12 createIfNone:v5 error:v26];
    v31 = 0;
    goto LABEL_59;
  }
LABEL_87:
  v31 = [*p_libraryRoot stringByAppendingPathComponent:@"db-V1"];
  if (v12->var2)
  {
    v53 = +[NSString stringWithFormat:@"/private/var is readonly!"];
    v54 = sub_100002D4C();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
      sub_100029A14();
    }

    if (a5)
    {
      sub_100003600(111, v53, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_18;
  }
  v55 = [(NSString *)self->_libraryRoot stringByAppendingPathComponent:@"staging"];
  stagingPath = self->_stagingPath;
  self->_stagingPath = v55;

  v57 = [(NSString *)self->_libraryRoot stringByAppendingPathComponent:@"purgatory"];
  purgatoryPath = self->_purgatoryPath;
  self->_purgatoryPath = v57;

  p_dbPath = &self->_dbPath;
  objc_storeStrong((id *)&self->_dbPath, v31);
  v59 = [(NSString *)self->_libraryRoot stringByAppendingPathComponent:@"ChunkTemp"];
  [v7 removeItemAtPath:v59 error:0];

  if (![v7 createDirectoryAtPath:self->_stagingPath withIntermediateDirectories:1 attributes:v67 error:a5])
  {
LABEL_18:
    int v12 = a3;
LABEL_48:
    if (v12->var2)
    {
      v37 = self->_stagingPath;
      if (v37) {
        sub_10000C530((char *)[(NSString *)v37 fileSystemRepresentation], 0, 0);
      }
      dbPath = self->_dbPath;
      if (dbPath) {
        sub_10000C530((char *)[(NSString *)dbPath fileSystemRepresentation], 0, 0);
      }
    }
    v39 = self->_dbPath;
    self->_dbPath = 0;

    v40 = self->_stagingPath;
    self->_stagingPath = 0;

    v41 = self->_libraryRoot;
    self->_libraryRoot = 0;

    v42 = self->_purgatoryPath;
    self->_purgatoryPath = 0;

    int v43 = self->_libDirfd;
    if ((v43 & 0x80000000) == 0)
    {
      close(v43);
      int v43 = -1;
      self->_int libDirfd = -1;
    }
    if ((self->_volDirFd & 0x80000000) == 0)
    {
      close(self->_volDirFd);
      self->_int volDirFd = -1;
      int v43 = self->_libDirfd;
    }
    if (v43 != -1) {
      sub_10002BE60();
    }
    BOOL v44 = 0;
    goto LABEL_59;
  }
  int v12 = a3;
  if (![v7 createDirectoryAtPath:*p_dbPath withIntermediateDirectories:1 attributes:v8 error:a5]|| !objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", self->_purgatoryPath, 1, v9, a5)|| !objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v9, self->_purgatoryPath, a5)|| !objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v67, self->_stagingPath, a5)|| !objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v8, *p_dbPath, a5))
  {
    goto LABEL_48;
  }
  uint64_t v76 = 0;
  long long v75 = xmmword_100032300;
  memset(v73, 0, sizeof(v73));
  int v74 = 0;
  if (fgetattrlist(self->_volDirFd, &v75, v73, 0x24uLL, 0x21u) < 0)
  {
    v60 = +[NSString stringWithFormat:@"fgetattrlist(%d) failed", self->_volDirFd];
    int v61 = *__error();
    v62 = sub_100002D4C();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
      sub_100026B74();
    }

    if (a5)
    {
      sub_100011F0C(v61, v60);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    int v14 = v7;
    uint64_t v15 = (void *)v67;
    long long v16 = (void *)v8;
    goto LABEL_18;
  }
  self->_volumeCapabilitiesInterfaces = DWORD2(v73[0]);
  if (a3->var2)
  {
    BOOL v44 = 1;
  }
  else
  {
    id v63 = *p_libraryRoot;
    if (qword_10004CF18 != -1) {
      dispatch_once(&qword_10004CF18, &stru_100041788);
    }
    v64 = qword_10004CF10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020E24;
    block[3] = &unk_100041638;
    int v14 = v7;
    id v71 = v7;
    id v72 = v63;
    id v65 = v63;
    dispatch_async(v64, block);

    BOOL v44 = 1;
    uint64_t v15 = (void *)v67;
    long long v16 = (void *)v8;
  }
LABEL_59:

  return v44;
}

- (GSManager)initWithDisk:(id *)a3 createIfNone:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v9 = objc_alloc_init((Class)PQLConnection);
  v65.receiver = self;
  v65.super_class = (Class)GSManager;
  dispatch_time_t v10 = [(GSManager *)&v65 init];
  if (v10)
  {
    uint64_t v11 = v10;
    int v61 = a5;
    v10->_int libDirfd = -1;
    v10->_int volDirFd = -1;
    id v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%x", a3->var0);
    [v9 setLabel:v12];

    int v13 = 0;
    id v14 = 0;
    char v15 = 1;
    while (1)
    {
      long long v16 = v14;
      char v17 = v15;
      if (![(GSManager *)v11 _createLibraryWithDiskInfos:a3 createIfNone:v6 error:v61])goto LABEL_35; {
      v66[0] = v11->_libraryRoot;
      }
      v66[1] = @"metadata";
      unint64_t v18 = +[NSArray arrayWithObjects:v66 count:2];
      __int16 v19 = +[NSURL fileURLWithPathComponents:v18];

      if (!v19)
      {

        int v13 = v16;
        goto LABEL_51;
      }
      int v13 = v19;
      v20 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithContentsOfURL:v19];
      metainfo = v11->_metainfo;
      v11->_metainfo = v20;

      int v22 = v11->_metainfo;
      p_super = sub_100002D4C();
      BOOL v24 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v24)
        {
          int var0 = a3->var0;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = var0;
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "[NOTICE] device %x had a metainfo file", buf, 8u);
        }
      }
      else
      {
        if (v24)
        {
          int v26 = a3->var0;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v26;
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "[NOTICE] device %x has no metainfo file", buf, 8u);
        }

        uint64_t v27 = objc_opt_new();
        p_super = &v11->_metainfo->super.super;
        v11->_metainfo = (NSMutableDictionary *)v27;
      }

      dbPath = v11->_dbPath;
      BOOL var2 = a3->var2;
      id v64 = v16;
      unsigned __int8 v30 = [v9 openAtPath:dbPath isReadOnly:var2 error:&v64];
      id v14 = v64;

      if (v30)
      {
        v31 = (NSUUID *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:a3->var4];
        volumeUUID = v11->_volumeUUID;
        v11->_volumeUUID = v31;

        int v33 = [(NSMutableDictionary *)v11->_metainfo objectForKeyedSubscript:@"DISK_UUID"];
        int v34 = [(NSUUID *)v11->_volumeUUID UUIDString];
        v35 = v34;
        if (!v33)
        {
          [(NSMutableDictionary *)v11->_metainfo setObject:v34 forKeyedSubscript:@"DISK_UUID"];
          [(NSMutableDictionary *)v11->_metainfo writeToURL:v13 atomically:1];
LABEL_39:

          BOOL v44 = v11;
          *(void *)buf = _NSConcreteStackBlock;
          uint64_t v68 = 3221225472;
          v69 = sub_10002694C;
          v70 = &unk_100040B00;
          id v71 = v44;
          [v9 setCorruptionHandler:buf];

          objc_storeStrong(v44 + 2, v9);
          *((_DWORD *)v44 + 36) = a3->var0;
          *((unsigned char *)v44 + 136) = 1;
          dispatch_group_t v45 = dispatch_group_create();
          id v46 = v44[7];
          v44[7] = v45;

          id v47 = objc_alloc_init((Class)NSMutableDictionary);
          id v48 = v44[6];
          v44[6] = v47;

          *((unsigned char *)v44 + 137) = a3->var1;
          *((unsigned char *)v44 + 138) = a3->var2;
          *((unsigned char *)v44 + 139) = a3->var3;
          v49 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v50 = [v9 serialQueue];
          dispatch_queue_t v51 = dispatch_queue_create_with_target_V2("com.apple.revisiond.library", v49, v50);
          id v52 = v44[8];
          v44[8] = v51;

          v53 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v54 = dispatch_queue_attr_make_with_qos_class(v53, QOS_CLASS_BACKGROUND, 0);
          dispatch_queue_t v55 = dispatch_queue_create("com.apple.revisiond.background", v54);
          id v56 = v44[9];
          v44[9] = v55;

          v57 = +[GSSystemResourcesManager manager];
          [v57 addPowerObserver:v44];
          [v57 addLowDiskObserver:v44 forDevice:*((unsigned int *)v44 + 36)];
          __int16 v19 = v44;

          int v13 = v19;
          goto LABEL_51;
        }
        if ([v34 isEqualToString:v33])
        {
          v42 = sub_100002D4C();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            int v43 = a3->var0;
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v43;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "[NOTICE] device %x UUID matches metadata", buf, 8u);
          }

          goto LABEL_39;
        }
        sub_100020C4C(v11->_libraryRoot, 2);
      }
      else
      {
        if ([v14 code] != (id)10)
        {
          v41 = sub_100002D4C();
          if (os_log_type_enabled(v41, (os_log_type_t)0x90u)) {
            sub_10002C11C();
          }

          if (v61) {
            *int v61 = v14;
          }
LABEL_35:

          __int16 v19 = 0;
          goto LABEL_51;
        }
        if (a3->var2)
        {
          id v37 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:30 userInfo:0];

          v38 = +[NSString stringWithFormat:@"The generation storage database on a read-only filesystem is corrupt.\n"];
          v39 = sub_100002D4C();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_41;
          }
          goto LABEL_42;
        }
        if (!sub_100020C4C(v11->_libraryRoot, 4))
        {
          v58 = +[NSString stringWithFormat:@"unable to rename corrupt storage away"];
          v59 = sub_100002D4C();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
            sub_100028658();
          }

          if (v61)
          {
            sub_100003600(101, v58, 0);
            *int v61 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_50;
        }
        int v33 = sub_100002D4C();
        if (os_log_type_enabled(v33, (os_log_type_t)0x90u)) {
          sub_10002C0DC(&v62, v63, v33);
        }
      }

      char v15 = 0;
      if ((v17 & 1) == 0)
      {
        id v37 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:35 userInfo:0];

        v38 = +[NSString stringWithFormat:@"Failed to successfully create a generation storage location after 2 tries."];
        v39 = sub_100002D4C();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
LABEL_41:
        }
          sub_100026FCC();
LABEL_42:

        if (v61)
        {
          sub_100003600(107, v38, v37);
          *int v61 = (id)objc_claimAutoreleasedReturnValue();
        }

LABEL_50:
        __int16 v19 = 0;
        goto LABEL_51;
      }
    }
  }
  int v13 = +[NSString stringWithFormat:@"unable to allocate self"];
  v36 = sub_100002D4C();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
    sub_100028658();
  }

  if (!a5) {
    goto LABEL_50;
  }
  sub_100003600(101, v13, 0);
  __int16 v19 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

  return v19;
}

- (GSManager)init
{
  v2 = sub_100002D4C();
  if (os_log_type_enabled(v2, (os_log_type_t)0x90u))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v2, (os_log_type_t)0x90u, "[ERROR] -init is not valid on this object\n", v3, 2u);
  }

  abort();
}

- (void)dealloc
{
  v3 = sub_100002D4C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002C1B4();
  }

  if (self->_db) {
    sub_10002C188();
  }
  if (self->_isReadOnly)
  {
    stagingPath = self->_stagingPath;
    if (stagingPath) {
      sub_10000C530((char *)[(NSString *)stagingPath fileSystemRepresentation], 0, 0);
    }
    dbPath = self->_dbPath;
    if (dbPath) {
      sub_10000C530((char *)[(NSString *)dbPath fileSystemRepresentation], 0, 0);
    }
  }
  int libDirfd = self->_libDirfd;
  if ((libDirfd & 0x80000000) == 0) {
    close(libDirfd);
  }
  int volDirFd = self->_volDirFd;
  if ((volDirFd & 0x80000000) == 0) {
    close(volDirFd);
  }
  v8.receiver = self;
  v8.super_class = (Class)GSManager;
  [(GSManager *)&v8 dealloc];
}

- (BOOL)checkForDBUpgrade
{
  return [(PQLConnection *)self->_db checkForDBUpgrade];
}

- (void)start
{
  if (self->_isEnabled)
  {
    v4.version = 0;
    memset(&v4.retain, 0, 24);
    v4.info = self;
    fseStream = FSEventStreamCreateRelativeToDevice(0, (FSEventStreamCallback)sub_100021B84, &v4, self->_device, (CFArrayRef)&off_100044310, self->_state->fseventID, 0.5, 0x10u);
    self->_fseStream = fseStream;
    if (!fseStream) {
      return;
    }
  }
  else
  {
    fseStream = self->_fseStream;
    if (!fseStream) {
      return;
    }
  }
  FSEventStreamSetDispatchQueue(fseStream, (dispatch_queue_t)self->_queue);
  FSEventStreamStart(self->_fseStream);
}

- (BOOL)isInvalidated
{
  return self->_invalidated != 0;
}

- (void)_invalidate
{
  fseStream = self->_fseStream;
  if (fseStream)
  {
    FSEventStreamStop(fseStream);
    FSEventStreamInvalidate(self->_fseStream);
    FSEventStreamRelease(self->_fseStream);
    self->_fseStream = 0;
  }
  [(PQLConnection *)self->_db close:0];
  db = self->_db;
  self->_db = 0;

  BOOL v5 = self;
  objc_sync_enter(v5);
  BOOL v6 = v5->_pendingDeleteDocuments;
  pendingDeleteDocuments = v5->_pendingDeleteDocuments;
  v5->_pendingDeleteDocuments = 0;

  objc_sync_exit(v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v8 = [(NSMutableDictionary *)v6 allValues];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v13 + 1) + 8 * (void)v12));
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  +[GSStorageManager invalidateLibrary:v5];
}

- (void)invalidate:(BOOL)a3
{
  int v3 = 0;
  atomic_compare_exchange_strong(&self->_invalidated, (unsigned int *)&v3, 1u);
  if (!v3)
  {
    BOOL v4 = a3;
    BOOL v6 = +[GSSystemResourcesManager manager];
    unsigned int v7 = sub_100002D4C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002C21C();
    }

    [v6 removePowerObserver:self];
    [v6 removeLowDiskObserver:self forDevice:self->_device];
    if (v4)
    {
      dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
      dispatch_group_wait((dispatch_group_t)self->_operationsGroup, 0xFFFFFFFFFFFFFFFFLL);
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100021E98;
      block[3] = &unk_100040B00;
      void block[4] = self;
      dispatch_sync(queue, block);
    }
    else
    {
      operationsGroup = self->_operationsGroup;
      id v10 = self->_queue;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100021EA0;
      v11[3] = &unk_100040B00;
      v11[4] = self;
      dispatch_group_notify(operationsGroup, v10, v11);
    }
  }
}

- (NSString)description
{
  if (self->_isRootFS) {
    v2 = "root ";
  }
  else {
    v2 = "";
  }
  int v3 = "RO";
  if (!self->_isReadOnly) {
    int v3 = "RW";
  }
  return +[NSString stringWithFormat:@"<GSLibrary dev:%x [%s%s]>", self->_device, v2, v3];
}

- (BOOL)_thinningPrecompute:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  unsigned int v7 = +[GSSystemResourcesManager manager];
  unsigned int v8 = [v7 deviceLowSpaceFlags:self->_device];

  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  time_t v9 = time(0);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_10001F7BC;
  v23 = sub_10001F7CC;
  id v24 = 0;
  if (self->_isReadOnly)
  {
    id v10 = +[NSString stringWithFormat:@"storage is read-only"];
    uint64_t v11 = sub_100002D4C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100029A14();
    }

    if (a4)
    {
      sub_100003600(111, v10, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    BOOL v12 = 0;
  }
  else
  {
    time_t v13 = v9;
    uint64_t v14 = 3600;
    if (v5) {
      uint64_t v14 = 60;
    }
    if (v9 - self->_lastThinningScan <= v14 && v8 == self->_lastThinningFlags)
    {
      BOOL v12 = 1;
    }
    else
    {
      long long v15 = sub_100002D4C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10002C320();
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000221A0;
      v17[3] = &unk_1000417D8;
      v17[4] = self;
      v17[5] = &v19;
      unsigned int v18 = v8;
      v17[6] = &v25;
      v17[7] = v13;
      [(GSManager *)self dispatchSync:v17];
      if (a4) {
        *a4 = (id) v20[5];
      }
      BOOL v12 = *((unsigned char *)v26 + 24) != 0;
    }
  }
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

- (int64_t)_purgeGenerationsWithCredentials:(const GSCredential *)a3
{
  uint64_t v8 = 0;
  time_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = -1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000226BC;
  v7[3] = &unk_100041828;
  void v7[5] = &v8;
  v7[6] = a3;
  v7[4] = self;
  [(GSManager *)self dispatchSync:v7];
  purgatoryPath = self->_purgatoryPath;
  if (purgatoryPath) {
    sub_10000C9B8((char *)[(NSString *)purgatoryPath fileSystemRepresentation], 0, 0);
  }
  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (int64_t)_purgeAggressively:(unint64_t *)a3 credentials:(const GSCredential *)a4 whilePredicateIsTrue:(id)a5
{
  id v8 = a5;
  uint64_t v12 = 0;
  time_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  do
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100022B78;
    v11[3] = &unk_100041850;
    v11[6] = a4;
    v11[7] = a3;
    v11[4] = self;
    void v11[5] = &v12;
    if (![(GSManager *)self dispatchSync:v11]) {
      break;
    }
    purgatoryPath = self->_purgatoryPath;
    if (purgatoryPath) {
      sub_10000C9B8((char *)[(NSString *)purgatoryPath fileSystemRepresentation], 0, 0);
    }
  }
  while (*((unsigned char *)v13 + 24));
  _Block_object_dispose(&v12, 8);

  return 0;
}

- (void)_purgeWithCredential:(const GSCredential *)a3 tryingToFreeSpace:(int64_t)a4 highUrgency:(BOOL)a5 whilePredicateIsTrue:(id)a6 done:(id)a7
{
  id v11 = a6;
  uint64_t v12 = (void (**)(id, void))a7;
  if ([(GSManager *)self isReadOnly])
  {
    time_t v13 = sub_100002D4C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10002C510();
    }

    v12[2](v12, 0);
  }
  else
  {
    long long v14 = *(_OWORD *)&a3->auditToken.val[1];
    long long v20 = *(_OWORD *)&a3->pid;
    *(_OWORD *)uint64_t v21 = v14;
    *(_OWORD *)&v21[12] = *(_OWORD *)&a3->auditToken.val[4];
    operationsGroup = self->_operationsGroup;
    backgroundQueue = self->_backgroundQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022F08;
    block[3] = &unk_1000418A0;
    void block[4] = self;
    BOOL v22 = a5;
    id v18 = v11;
    uint64_t v19 = v12;
    dispatch_group_async(operationsGroup, backgroundQueue, block);
  }
}

- (int64_t)purgeTryingToReclaimSpace:(int64_t)a3 highUrgency:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  memset(v14, 0, 44);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100023480;
  v12[3] = &unk_1000418C0;
  int64_t v13 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023490;
  v9[3] = &unk_1000418E8;
  id v11 = &v15;
  BOOL v6 = dispatch_semaphore_create(0);
  uint64_t v10 = v6;
  [(GSManager *)self _purgeWithCredential:v14 tryingToFreeSpace:v13 highUrgency:v4 whilePredicateIsTrue:v12 done:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  int64_t v7 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (int64_t)estimatePurgeableSpace
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastEstimatedPurgeableCheckTime < 300.0) {
    return self->_lastEstimatedPurgeableSpace;
  }
  self->_lastEstimatedPurgeableCheckTime = Current;
  [(GSManager *)self _thinningPrecompute:0 error:0];
  uint64_t v8 = 0;
  time_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000235A8;
  v7[3] = &unk_100041910;
  v7[4] = &v8;
  [(GSManager *)self dispatchSync:v7];
  int64_t v5 = v9;
  self->_lastEstimatedPurgeableSpace = v9[3];
  int64_t v4 = v5[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (unint64_t)computePurgeableSpace
{
  [(GSManager *)self _thinningPrecompute:0 error:0];
  uint64_t v6 = 0;
  int64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100023720;
  v5[3] = &unk_100041910;
  v5[4] = &v6;
  [(GSManager *)self dispatchSync:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)computeNumberOfPruneableStorages
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100023818;
  v4[3] = &unk_100041910;
  v4[4] = &v5;
  [(GSManager *)self dispatchSync:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)computePruneableNumberOfGenerations
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100023910;
  v4[3] = &unk_100041910;
  v4[4] = &v5;
  [(GSManager *)self dispatchSync:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)purgeWithCredential:(const GSCredential *)a3 whilePredicateIsTrue:(id)a4 done:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100023A5C;
  v12[3] = &unk_100041938;
  id v13 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100023A6C;
  v10[3] = &unk_100041960;
  id v11 = a5;
  id v8 = v11;
  id v9 = v13;
  [(GSManager *)self _purgeWithCredential:a3 tryingToFreeSpace:20971520 highUrgency:1 whilePredicateIsTrue:v12 done:v10];
}

- (void)_purgePurgatory
{
  operationsGroup = self->_operationsGroup;
  backgroundQueue = self->_backgroundQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023AF4;
  block[3] = &unk_100040B00;
  void block[4] = self;
  dispatch_group_async(operationsGroup, backgroundQueue, block);
}

- (BOOL)_forsakePath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSFileManager defaultManager];
  uint64_t v6 = [v5 attributesOfItemAtPath:v4 error:0];
  id v7 = [v6 fileSystemFileNumber];

  if (v7
    && (id v8 = (const std::__fs::filesystem::path *)[v4 fileSystemRepresentation],
        [(NSString *)self->_purgatoryPath stringByAppendingFormat:@"/ino.%lld", v7],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = (const std::__fs::filesystem::path *)[v9 fileSystemRepresentation],
        rename(v8, v10, v11),
        int v13 = v12,
        v9,
        !v13))
  {
    char v14 = 1;
  }
  else
  {
    char v14 = sub_10000C530((char *)[v4 fileSystemRepresentation], 0, 0);
  }
  while (1)
  {
    uint64_t v15 = [v4 stringByDeletingLastPathComponent];

    if (![v15 length]) {
      break;
    }
    id v4 = v15;
    if (rmdir((const char *)[v4 fileSystemRepresentation]) && *__error() != 2)
    {
      uint64_t v15 = v4;
      break;
    }
  }

  return v14;
}

- (BOOL)_generationForsakeRow:(id)a3 withCredential:(const GSCredential *)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned int v9 = [v8 isAccessibleByUID:a4->uid error:a5];
  if (v9)
  {
    uint64_t v10 = [v8 fullPath:self];
    [(GSManager *)self _forsakePath:v10];
  }
  return v9;
}

- (void)_nukeStorageID:(int64_t)a3
{
  uint64_t v5 = sub_100002D4C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002C67C();
  }

  uint64_t v6 = +[NSFileManager defaultManager];
  id v7 = +[NSString stringWithFormat:@"%@/%s/%llx", self->_libraryRoot, "AllUIDs", a3];
  if ([v6 fileExistsAtPath:v7] && !-[GSManager _forsakePath:](self, "_forsakePath:", v7))
  {
    id v8 = sub_100002D4C();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      sub_10002C614();
    }

    [(GSManager *)self setIsInconsistent:1];
  }
  unsigned int v9 = +[NSString stringWithFormat:@"%@/%s", self->_libraryRoot, "PerUID"];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = [v6 contentsOfDirectoryAtPath:v9 error:0];
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v29;
    CFStringRef v14 = @"/%@/%llx";
    do
    {
      uint64_t v15 = 0;
      id v27 = v12;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v16 = objc_msgSend(v9, "stringByAppendingFormat:", v14, *(void *)(*((void *)&v28 + 1) + 8 * (void)v15), a3);
        if ([v6 fileExistsAtPath:v16]
          && ![(GSManager *)self _forsakePath:v16])
        {
          uint64_t v17 = v13;
          uint64_t v18 = v9;
          CFStringRef v19 = v14;
          long long v20 = v10;
          uint64_t v21 = v6;
          int64_t v22 = a3;
          v23 = self;
          id v24 = sub_100002D4C();
          if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412290;
            int v33 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v24, (os_log_type_t)0x90u, "[ERROR] Failed to forsake %@", buf, 0xCu);
          }

          self = v23;
          [(GSManager *)v23 setIsInconsistent:1];
          a3 = v22;
          uint64_t v6 = v21;
          uint64_t v10 = v20;
          CFStringRef v14 = v19;
          unsigned int v9 = v18;
          uint64_t v13 = v17;
          id v12 = v27;
        }

        uint64_t v15 = (char *)v15 + 1;
      }
      while (v12 != v15);
      id v12 = [v10 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v12);
  }

  if (([(PQLConnection *)self->_db execute:@"DELETE FROM generations WHERE generation_storage_id = %lld", a3] & 1) == 0)
  {
    uint64_t v25 = sub_100002D4C();
    if (os_log_type_enabled(v25, (os_log_type_t)0x90u)) {
      sub_10002C5AC();
    }

    [(GSManager *)self setIsInconsistent:1];
  }
  if (!+[GSFileRow deleteRow:self->_db storageID:a3])
  {
    int v26 = sub_100002D4C();
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u)) {
      sub_10002C544();
    }

    [(GSManager *)self setIsInconsistent:1];
  }
  [(GSManager *)self _purgePurgatory];
}

- (BOOL)_removeAdditionByRow:(id)a3 credentials:(const GSCredential *)a4 error:(id *)a5
{
  id v8 = a3;
  if (v8
    && [(GSManager *)self _generationForsakeRow:v8 withCredential:a4 error:a5])
  {
    if (+[GSGenerationRow deleteRow:self->_db rowID:v8[1]] < 0)
    {
      unsigned int v9 = sub_100002D4C();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
        sub_10002C6E4();
      }

      [(GSManager *)self setIsInconsistent:1];
    }
    [(GSManager *)self _purgePurgatory];
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_removeAddition:(int64_t)a3 inNameSpace:(id)a4 named:(id)a5 credentials:(const GSCredential *)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  CFStringRef v14 = +[GSGenerationRow generationRow:self->_db storageID:a3 name:v13 clientID:v12 error:a7];
  if (v14
    || ([(PQLConnection *)self->_db lastError],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        unsigned int v16 = [v15 isSqliteErrorCode:12],
        v15,
        !v16))
  {
    BOOL v18 = [(GSManager *)self _removeAdditionByRow:v14 credentials:a6 error:a7];
  }
  else
  {
    uint64_t v17 = sub_100002D4C();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
      sub_10002C75C();
    }

    BOOL v18 = 1;
  }

  return v18;
}

- (void)_removeAllAdditions:(int64_t)a3 inNameSpace:(id)a4 credentials:(const GSCredential *)a5
{
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableIndexSet);
  uint64_t v27 = 0;
  long long v26 = 0u;
  uint64_t v24 = 0;
  long long v23 = 0u;
  int64_t v22 = a3;
  id v10 = v8;
  id v25 = [v10 UTF8String];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = +[GSGenerationRow enumerate:self->_db withOptions:&v22];
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([(GSManager *)self _generationForsakeRow:v16 withCredential:a5 error:0])
        {
          [v9 addIndex:*(void *)(v16 + 8)];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v13);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002445C;
  v17[3] = &unk_100041988;
  v17[4] = self;
  [v9 enumerateIndexesUsingBlock:v17];
  [(GSManager *)self _purgePurgatory];
}

- (id)makeStagingPathForCredential:(const GSCredential *)a3 prefix:(id)a4 stagedName:(id)a5
{
  id v8 = (__CFString *)a4;
  id v9 = (__CFString *)a5;
  id v10 = +[NSFileManager defaultManager];
  v20[0] = NSFileOwnerAccountID;
  if (a3)
  {
    id v11 = +[NSNumber numberWithUnsignedInt:a3->uid];
  }
  else
  {
    id v11 = &off_100044280;
  }
  v20[1] = NSFilePosixPermissions;
  v21[0] = v11;
  v21[1] = &off_1000442B0;
  id v12 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  if (a3) {

  }
  CFStringRef v13 = @"tmp";
  if (v8) {
    CFStringRef v13 = v8;
  }
  uint64_t v14 = +[NSString stringWithFormat:@"%@.XXXXXX", v13, v20[0]];
  uint64_t v15 = objc_msgSend(v10, "gs_createTemporarySubdirectoryOfItem:withTemplate:error:", self->_stagingPath, v14, 0);

  if (v15 && [v10 setAttributes:v12 ofItemAtPath:v15 error:0])
  {
    if (v9) {
      CFStringRef v16 = v9;
    }
    else {
      CFStringRef v16 = @"staged";
    }
    uint64_t v17 = [v15 stringByAppendingPathComponent:v16];

    long long v18 = +[NSURL fileURLWithPath:v17];
    uint64_t v15 = (void *)v17;
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (BOOL)_pathIsStaged:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 hasPrefix:self->_stagingPath]
    && (uint64_t v5 = (char *)[v4 length], v5 >= (char *)-[NSString length](self->_stagingPath, "length") + 2)
    && objc_msgSend(v4, "characterAtIndex:", -[NSString length](self->_stagingPath, "length")) == 47
    && objc_msgSend(v4, "characterAtIndex:", (char *)-[NSString length](self->_stagingPath, "length") + 1) != 47;

  return v6;
}

- (void)cleanupStagingPath:(id)a3 withCredential:(const GSCredential *)a4
{
  id v6 = a3;
  if ([(GSManager *)self _pathIsStaged:v6])
  {
    id v7 = objc_msgSend(v6, "substringFromIndex:", (char *)-[NSString length](self->_stagingPath, "length") + 1);
    stagingPath = self->_stagingPath;
    id v9 = [v7 pathComponents];
    id v10 = [v9 objectAtIndexedSubscript:0];
    id v11 = [(NSString *)stagingPath stringByAppendingPathComponent:v10];

    if (!a4 || [(GSManager *)self isIgnoringOwners]) {
      goto LABEL_7;
    }
    id v12 = +[NSFileManager defaultManager];
    CFStringRef v13 = [v12 attributesOfItemAtPath:v11 error:0];
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 fileOwnerAccountID];
      CFStringRef v16 = +[NSNumber numberWithUnsignedInt:a4->uid];
      unsigned __int8 v17 = [v15 isEqualToNumber:v16];

      if (v17)
      {

LABEL_7:
        if (sub_10000C530((char *)[v11 fileSystemRepresentation], 0, 0))
        {
LABEL_17:

          goto LABEL_18;
        }
        id v12 = sub_100002D4C();
        if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
          sub_10002C82C();
        }
LABEL_16:

        goto LABEL_17;
      }
      long long v18 = sub_100002D4C();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        sub_10002C894();
      }
    }
    goto LABEL_16;
  }
  id v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002C8FC();
  }
LABEL_18:
}

- (id)makeStoragePathForGenerationNamed:(id)a3 storageID:(int64_t)a4 clientID:(id)a5 forUID:(unsigned int)a6 makePublic:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  id v38 = a3;
  id v11 = a5;
  id v12 = +[NSFileManager defaultManager];
  if (v7) {
    CFStringRef v13 = @"AllUIDs";
  }
  else {
    CFStringRef v13 = @"PerUID";
  }
  id v14 = [(NSString *)self->_libraryRoot stringByAppendingPathComponent:v13];
  NSFileAttributeKey v46 = NSFilePosixPermissions;
  id v47 = &off_1000442C8;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  id v41 = 0;
  unsigned __int8 v16 = [v12 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:v15 error:&v41];
  id v17 = v41;

  if (v16)
  {
    if (v7) {
      goto LABEL_7;
    }
    long long v18 = +[NSNumber numberWithUnsignedInt:v8];
    uint64_t v19 = [v18 stringValue];
    uint64_t v20 = [v14 stringByAppendingPathComponent:v19];

    v45[0] = &off_1000442E0;
    v44[0] = NSFilePosixPermissions;
    v44[1] = NSFileOwnerAccountID;
    long long v21 = +[NSNumber numberWithUnsignedInt:v8];
    v44[2] = NSFileGroupOwnerAccountID;
    v45[1] = v21;
    v45[2] = &off_100044280;
    int64_t v22 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
    id v40 = v17;
    id v14 = (id)v20;
    LOBYTE(v19) = [v12 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:v22 error:&v40];
    id v23 = v40;

    id v17 = v23;
    if (v19)
    {
LABEL_7:
      uint64_t v24 = v11;
      id v25 = v14;
      long long v26 = v17;
      id v14 = [v14 stringByAppendingFormat:@"/%llx/%@", a4, v11];

      NSFileAttributeKey v42 = NSFilePosixPermissions;
      int v43 = &off_1000442C8;
      uint64_t v27 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      id v39 = v17;
      unsigned __int8 v28 = [v12 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:v27 error:&v39];
      id v17 = v39;

      if (v28)
      {
        long long v29 = v38;
        long long v30 = [v14 stringByAppendingPathComponent:v38];

        if ([v12 fileExistsAtPath:v30])
        {
          [(GSManager *)self setIsInconsistent:1];
          *__error() = 17;
          long long v31 = sub_100002D4C();
          if (os_log_type_enabled(v31, (os_log_type_t)0x90u)) {
            sub_10002C964();
          }

          v32 = 0;
          id v14 = v30;
        }
        else
        {
          id v14 = v30;
          v32 = v14;
        }
      }
      else
      {
        int v34 = sub_100002D4C();
        long long v29 = v38;
        if (os_log_type_enabled(v34, (os_log_type_t)0x90u)) {
          sub_10002C9CC();
        }

        v32 = 0;
      }
    }
    else
    {
      v35 = sub_100002D4C();
      uint64_t v24 = v11;
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u)) {
        sub_10002CA34();
      }

      v32 = 0;
      long long v29 = v38;
    }
  }
  else
  {
    int v33 = sub_100002D4C();
    if (os_log_type_enabled(v33, (os_log_type_t)0x90u)) {
      sub_10002CA34();
    }

    v32 = 0;
    long long v29 = v38;
    uint64_t v24 = v11;
  }

  return v32;
}

- (id)_createAddition:(int64_t)a3 creationInfo:(id)a4 isDir:(BOOL)a5 stagedPath:(id)a6 credentials:(const GSCredential *)a7 error:(id *)a8
{
  BOOL v58 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = [v13 objectForKeyedSubscript:@"kGSAdditionName"];
  uint64_t v15 = [v13 objectForKeyedSubscript:@"kGSAdditionNameSpace"];
  unsigned __int8 v16 = [v13 objectForKeyedSubscript:@"kGSAdditionOptions"];
  int v61 = [v13 objectForKeyedSubscript:@"kGSAdditionConflictResolved"];
  id v63 = [v13 objectForKeyedSubscript:@"kGSAdditionOnDuplicate"];

  int64_t v65 = 0;
  BOOL v17 = [(GSManager *)self isIgnoringOwners];
  if ([v14 characterAtIndex:0] != 58) {
    goto LABEL_3;
  }
  +[NSString stringWithFormat:@":%d:", a7->uid];
  long long v18 = self;
  uint64_t v19 = a7;
  BOOL v20 = v17;
  int64_t v21 = a3;
  int64_t v22 = v16;
  id v23 = v12;
  id v25 = v24 = v15;
  unsigned __int8 v26 = [v14 hasPrefix:v25];

  uint64_t v15 = v24;
  id v12 = v23;
  unsigned __int8 v16 = v22;
  a3 = v21;
  BOOL v17 = v20;
  a7 = v19;
  self = v18;
  if (v26)
  {
LABEL_3:
    if ([(GSManager *)self _pathIsStaged:v12])
    {
      if (+[GSFileRow storageIDExists:self->_db storageID:a3])
      {
        db = self->_db;
        id v64 = 0;
        int64_t v56 = a3;
        unsigned __int8 v28 = +[GSGenerationRow generationRow:db storageID:a3 name:v14 clientID:v15 error:&v64];
        id v29 = v64;
        long long v30 = v29;
        if (v28)
        {
          unsigned int v31 = [v63 intValue];
          if (v31 != 1)
          {
            id v57 = v30;
            if (!v31)
            {
              v32 = v28;
              int v33 = +[NSString stringWithFormat:@"generation already exists"];
              int v34 = sub_100002D4C();
              v35 = v61;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                sub_10002CA9C();
              }

              if (a8)
              {
                sub_100003600(106, v33, 0);
                *a8 = (id)objc_claimAutoreleasedReturnValue();
              }

              id v36 = 0;
              id v37 = 0;
              id v38 = v32;
              goto LABEL_56;
            }
            BOOL v44 = v15;
            id v47 = a8;
            if ([(GSManager *)self _removeAdditionByRow:v28 credentials:a7 error:a8])
            {
LABEL_35:
              id v49 = v12;
              if (sub_10000E4DC((char *)[v49 fileSystemRepresentation], v17, &v65, v47))
              {
                id v60 = v49;
                uint64_t v15 = v44;
                v50 = [(GSManager *)self makeStoragePathForGenerationNamed:v14 storageID:v56 clientID:v44 forUID:a7->uid makePublic:v17];
                if (!v50)
                {
                  id v38 = v28;
                  v53 = +[NSString stringWithFormat:@"Unable to make storage path"];
                  v54 = sub_100002D4C();
                  v35 = v61;
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
                    sub_100028658();
                  }

                  if (v47)
                  {
                    sub_100003600(101, v53, 0);
                    id *v47 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  id v37 = 0;
                  id v36 = 0;
                  goto LABEL_53;
                }
                id v36 = v50;
                v35 = v61;
                if (sub_10000CC40((std::__fs::filesystem::path *)[v60 fileSystemRepresentation], (std::__fs::filesystem::path *)objc_msgSend(v36, "fileSystemRepresentation"), v47))
                {
                  id v38 = objc_alloc_init(GSGenerationRow);

                  v38->generation_storage_id = v56;
                  objc_storeStrong((id *)&v38->generation_name, v14);
                  objc_storeStrong((id *)&v38->generation_client_id, v15);
                  uint64_t v51 = objc_msgSend(v36, "substringFromIndex:", (char *)-[NSString length](self->_libraryRoot, "length") + 1);
                  generation_path = v38->generation_path;
                  v38->generation_path = (NSString *)v51;

                  v38->generation_options = (unint64_t)[v16 unsignedLongLongValue];
                  v38->generation_status = 1;
                  v38->generation_add_time = time(0);
                  v38->generation_size = v65;
                  v38->generation_conflict_resolved = [v61 BOOLValue];
                  if ([(GSGenerationRow *)v38 saveToDB:self->_db])
                  {
                    id v37 = [(GSManager *)self _additionDictionary:v38 path:v36 isDir:v58];
LABEL_53:
                    long long v30 = v57;
                    if (!v37 && v38)
                    {
                      uint8_t v62 = [(GSGenerationRow *)v38 fullPath:self];
                      [(GSManager *)self _forsakePath:v62];

                      [(GSManager *)self _purgePurgatory];
                    }
                    goto LABEL_56;
                  }
                  if (v47)
                  {
                    [(PQLConnection *)self->_db translatedError];
                    id v37 = 0;
                    id *v47 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_53;
                  }
                }
                else
                {
                  id v38 = v28;
                }
                id v37 = 0;
                goto LABEL_53;
              }
              id v38 = v28;
              id v37 = 0;
              id v36 = 0;
              uint64_t v15 = v44;
              v35 = v61;
              goto LABEL_53;
            }
            id v36 = 0;
            id v38 = v28;
            goto LABEL_43;
          }
          id v48 = [(GSGenerationRow *)v28 fullPath:self];
          [(GSManager *)self _additionDictionary:v28 path:v48];
          id v37 = v38 = v28;

          id v36 = 0;
        }
        else
        {
          id v57 = v29;
          BOOL v44 = v15;
          dispatch_group_t v45 = [(PQLConnection *)self->_db lastError];
          unsigned __int8 v46 = [v45 isSqliteErrorCode:12];

          id v47 = a8;
          if (v46) {
            goto LABEL_35;
          }
          if (!a8)
          {
            id v38 = 0;
            id v36 = 0;
LABEL_43:
            id v37 = 0;
            uint64_t v15 = v44;
            v35 = v61;
            long long v30 = v57;
            goto LABEL_56;
          }
          id v38 = 0;
          id v36 = 0;
          id v37 = 0;
          *a8 = v57;
          long long v30 = v57;
          uint64_t v15 = v44;
        }
        v35 = v61;
LABEL_56:

        goto LABEL_57;
      }
      id v36 = +[NSString stringWithFormat:@"Storage id doesn't exist"];
      int v43 = sub_100002D4C();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        sub_1000290A0();
      }

      id v40 = a8;
      v35 = v61;
      if (a8)
      {
        int v41 = 102;
        goto LABEL_25;
      }
    }
    else
    {
      id v36 = +[NSString stringWithFormat:@"not a staged path"];
      id v39 = sub_100002D4C();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        sub_10002CB0C();
      }

      id v40 = a8;
      v35 = v61;
      if (a8)
      {
        int v41 = 104;
LABEL_25:
        sub_100003600(v41, v36, 0);
        id v37 = 0;
        id *v40 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_57;
      }
    }
    id v37 = 0;
    goto LABEL_57;
  }
  id v36 = +[NSString stringWithFormat:@"Mangled name with improper uid"];
  NSFileAttributeKey v42 = sub_100002D4C();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    sub_10002CB7C();
  }

  if (a8)
  {
    sub_100003600(105, v36, 0);
    id v37 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v37 = 0;
  }
  v35 = v61;
LABEL_57:

  return v37;
}

- (id)_additionDictionary:(id)a3 url:(id)a4
{
  v14[0] = @"o";
  uint64_t v5 = *((void *)a3 + 6);
  id v6 = a4;
  BOOL v7 = a3;
  uint64_t v8 = +[NSNumber numberWithUnsignedLongLong:v5];
  v15[0] = v8;
  v14[1] = @"ns";
  v15[1] = v7[4];
  v15[2] = v6;
  v14[2] = @"u";
  _OWORD v14[3] = @"sz";
  id v9 = +[NSNumber numberWithLongLong:v7[9]];
  v15[3] = v9;
  v14[4] = @"sID";
  id v10 = +[NSNumber numberWithLongLong:v7[2]];
  v15[4] = v10;
  v14[5] = @"cr";
  id v11 = +[NSNumber numberWithBool:*((unsigned __int8 *)v7 + 80)];
  v15[5] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:6];

  return v12;
}

- (id)_additionDictionary:(id)a3 path:(id)a4 isDir:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = +[NSURL fileURLWithPath:a4 isDirectory:v5];
  id v10 = [(GSManager *)self _additionDictionary:v8 url:v9];

  return v10;
}

- (id)_additionDictionary:(id)a3 path:(id)a4
{
  id v6 = a3;
  BOOL v7 = +[NSURL fileURLWithPath:a4];
  id v8 = [(GSManager *)self _additionDictionary:v6 url:v7];

  return v8;
}

- (id)_setAdditionNameSpace:(int64_t)a3 inNameSpace:(id)a4 named:(id)a5 newNameSpace:(id)a6 credentials:(const GSCredential *)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  id obj = a6;
  id v16 = a6;
  unsigned int v17 = [v14 isEqualToString:v16];
  if ((v17 & 1) == 0)
  {
    uint64_t v18 = +[GSGenerationRow generationRow:self->_db storageID:a3 name:v15 clientID:v16 error:a8];
    if (v18)
    {
      uint64_t v19 = (id *)v18;
      if (![(GSManager *)self _removeAddition:a3 inNameSpace:v14 named:v15 credentials:a7 error:a8])goto LABEL_8; {
      goto LABEL_7;
      }
    }
  }
  uint64_t v19 = +[GSGenerationRow generationRow:self->_db storageID:a3 name:v15 clientID:v14 error:a8];
  if (![v19 isAccessibleByUID:a7->uid error:a8])
  {
LABEL_8:
    int64_t v21 = 0;
    goto LABEL_9;
  }
  if (v17)
  {
LABEL_7:
    BOOL v20 = [v19 fullPath:self];
    int64_t v21 = [(GSManager *)self _additionDictionary:v19 path:v20];

    goto LABEL_9;
  }
  id v40 = v14;
  uint64_t v23 = [(GSManager *)self makeStoragePathForGenerationNamed:v15 storageID:a3 clientID:v16 forUID:a7->uid makePublic:[(GSManager *)self isIgnoringOwners]];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    id v25 = v19[5];
    objc_storeStrong(v19 + 4, obj);
    uint64_t v26 = objc_msgSend(v24, "substringFromIndex:", (char *)-[NSString length](self->_libraryRoot, "length") + 1);
    id v27 = v19[5];
    v19[5] = (id)v26;

    if ([v19 saveToDB:self->_db])
    {
      int libDirfd = self->_libDirfd;
      id v39 = v25;
      id v28 = v25;
      id v29 = (const char *)[v28 fileSystemRepresentation];
      id v30 = v24;
      if (renameat(libDirfd, v29, -1, (const char *)[v30 fileSystemRepresentation]))
      {
        id v38 = v28;
        unsigned int v31 = +[NSString stringWithFormat:@"rename(%@, %@s) failed", v28, v30];
        int v32 = *__error();
        int v33 = sub_100002D4C();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          sub_100026B74();
        }

        if (a8)
        {
          sub_100011F0C(v32, v31);
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }

        objc_storeStrong(v19 + 4, obj);
        objc_storeStrong(v19 + 5, v38);
        [v19 saveToDB:self->_db];
        int64_t v21 = 0;
      }
      else
      {
        int64_t v21 = [(GSManager *)self _additionDictionary:v19 path:v30];
      }
      id v25 = v39;
      id v14 = v40;
    }
    else if (a8)
    {
      [(PQLConnection *)self->_db translatedError];
      int64_t v21 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64_t v21 = 0;
    }
  }
  else
  {
    int v34 = +[NSString stringWithFormat:@"Unable to create new storage path for generation"];
    int v35 = *__error();
    id v36 = sub_100002D4C();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      sub_100026B74();
    }

    if (a8)
    {
      sub_100011F0C(v35, v34);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }

    int64_t v21 = 0;
  }
LABEL_9:

  return v21;
}

- (id)_listAdditions:(int64_t)a3 nameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 andEnumerationState:(id)a7 credentials:(const GSCredential *)a8
{
  id v14 = a4;
  id v15 = a7;
  id v31 = objc_alloc_init((Class)NSMutableArray);
  v36[0] = a3;
  v36[1] = a5;
  v36[2] = a6;
  v36[3] = 0;
  id v30 = v14;
  v36[4] = [v30 UTF8String];
  uint64_t v37 = 0;
  id v38 = 0;
  id v39 = 0;
  signed int v16 = 0;
  if ((unint64_t)[v15 count] >= 3)
  {
    unsigned int v17 = [v15 objectAtIndexedSubscript:0];
    signed int v16 = [v17 intValue];
    LODWORD(v37) = v16;

    uint64_t v18 = [v15 objectAtIndexedSubscript:1];
    id v38 = [v18 longLongValue];

    uint64_t v19 = [v15 objectAtIndexedSubscript:2];
    id v39 = [v19 longLongValue];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v20 = +[GSGenerationRow enumerate:self->_db withOptions:v36];
  id v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (v16)
        {
          uint64_t v26 = +[NSNumber numberWithLongLong:v25[1] + v16];
          [v15 setObject:v26 atIndexedSubscript:2];
        }
        if ([v25 isAccessibleByUID:a8->uid error:0])
        {
          id v27 = [v25 fullPath:self];
          id v28 = [(GSManager *)self _additionDictionary:v25 path:v27];

          [v31 addObject:v28];
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v22);
  }

  return v31;
}

- (void)_validateGenerationsStorage:(id *)a3 forEntry:(_ftsent *)a4 forStorageId:(int64_t)a5 andClientName:(id)a6
{
  id v10 = a6;
  id v11 = fts_children((FTS *)a3, 256);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_1000260C4;
  v21[3] = &unk_1000419B0;
  uint64_t v23 = v11;
  int64_t v24 = a5;
  id v12 = v10;
  id v22 = v12;
  [(GSManager *)self dispatchSync:v21];
  id v13 = +[NSString gs_stringWithFileSystemRepresentation:a4->fts_path];
  if (v11)
  {
    *(void *)&long long v14 = 67109890;
    long long v20 = v14;
    do
    {
      if (!v11->fts_pointer)
      {
        id v15 = sub_100002D4C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int device = self->_device;
          id v17 = [v12 UTF8String];
          *(_DWORD *)buf = v20;
          int v26 = device;
          __int16 v27 = 2048;
          int64_t v28 = a5;
          __int16 v29 = 2080;
          id v30 = v17;
          __int16 v31 = 2080;
          fts_name = v11->fts_name;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] removing generation [dev:%d,id:%lld,client:%s,name:%s] not represented in the database", buf, 0x26u);
        }

        uint64_t v18 = +[NSString stringWithUTF8String:v11->fts_name];
        uint64_t v19 = [v13 stringByAppendingPathComponent:v18];
        [(GSManager *)self _forsakePath:v19];
      }
      id v11 = v11->fts_link;
    }
    while (v11);
  }
  [(GSManager *)self _purgePurgatory];
}

- (void)_validateGenerationsStorageTree:(const char *)a3 atDepth:(int)a4
{
  v17[0] = (char *)a3;
  v17[1] = 0;
  if (!faccessat(self->_libDirfd, a3, 0, 0))
  {
    pthread_fchdir_np();
    id v6 = fts_open(v17, 92, 0);
    if (v6)
    {
      BOOL v7 = v6;
      id v8 = fts_read(v6);
      if (!self->_invalidated)
      {
        id v9 = v8;
        if (v8)
        {
          uint64_t v10 = 0;
          while (2)
          {
            switch(v9->fts_info)
            {
              case 1u:
                int v11 = v9->fts_level - a4;
                if (v11 == 1)
                {
                  id v12 = +[NSString gs_stringWithFileSystemRepresentation:v9->fts_name];
                  [(GSManager *)self _validateGenerationsStorage:v7 forEntry:v9 forStorageId:v10 andClientName:v12];

                  fts_set(v7, v9, 4);
                }
                else if (!v11)
                {
                  uint64_t v10 = strtoll(v9->fts_name, 0, 16);
                }
                goto LABEL_12;
              case 6u:
                rmdir(v9->fts_accpath);
                goto LABEL_12;
              case 7u:
              case 0xAu:
                signed int v16 = sub_100002D4C();
                if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
                  sub_10002CC54((uint64_t)v9, v16);
                }

                fts_close(v7);
                return;
              default:
LABEL_12:
                id v13 = fts_read(v7);
                id v9 = v13;
                if (self->_invalidated) {
                  BOOL v14 = 1;
                }
                else {
                  BOOL v14 = v13 == 0;
                }
                if (!v14) {
                  continue;
                }
                goto LABEL_17;
            }
          }
        }
      }
LABEL_17:
      fts_close(v7);
    }
    else
    {
      id v15 = sub_100002D4C();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
        sub_10002CBEC();
      }
    }
    pthread_fchdir_np();
  }
}

- (void)_validateGenerationsTable
{
  unint64_t v3 = sub_100002D4C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002CD48();
  }

  int64_t v4 = +[GSGenerationRow deleteRowsWithoutData:self->_db atRoot:self->_libraryRoot];
  if (v4 < 0)
  {
    id v6 = sub_100002D4C();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      sub_10002CD14();
    }
    goto LABEL_9;
  }
  int64_t v5 = v4;
  if (v4)
  {
    id v6 = sub_100002D4C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] deleted %lld generations rows without data", buf, 0xCu);
    }
LABEL_9:
  }
  operationsGroup = self->_operationsGroup;
  backgroundQueue = self->_backgroundQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026528;
  block[3] = &unk_100040B00;
  void block[4] = self;
  dispatch_group_async(operationsGroup, backgroundQueue, block);
}

- (void)validateLibrary
{
  unint64_t v3 = [(NSString *)self->_libraryRoot stringByAppendingPathComponent:@"LibraryStatus"];
  int64_t v4 = +[NSDictionary dictionaryWithContentsOfFile:v3];
  if ([v4 isEqual:&off_100044328])
  {
    int64_t v5 = [(PQLConnection *)self->_db loadLibraryState];
    id v6 = v5;
    if (v5) {
      BOOL v7 = v5;
    }
    else {
      BOOL v7 = objc_alloc_init(GSLibraryState);
    }
    uint64_t v10 = v7;

    int64_t v11 = sub_100002D4C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int device = self->_device;
      *(_DWORD *)buf = 67109378;
      int v17 = device;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] Library on device %x, loaded status %@", buf, 0x12u);
    }
  }
  else
  {
    id v8 = sub_100002D4C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = self->_device;
      *(_DWORD *)buf = 67109120;
      int v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[NOTICE] Library on device %x, non Syrah+ status, do not trust the DB state", buf, 8u);
    }

    uint64_t v10 = objc_alloc_init(GSLibraryState);
  }
  objc_storeStrong((id *)&self->_state, v10);
  sub_10000C9B8((char *)[(NSString *)self->_stagingPath fileSystemRepresentation], 0, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100026834;
  _OWORD v14[3] = &unk_1000419D8;
  id v13 = v10;
  id v15 = v13;
  [(PQLConnection *)self->_db setPreFlushHook:v14];
  if (![(GSLibraryState *)v13 isClean])
  {
    self->_state->state = 1;
    [(GSManager *)self _validateGenerationsTable];
  }
  [&off_100044328 writeToFile:v3 atomically:1];
  self->_state->lastFeatureSet = 4;
  [(GSManager *)self setIsInconsistent:0];
  self->_isEnabled = 1;
}

- (GSLibraryState)state
{
  return self->_state;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isRootFS
{
  return self->_isRootFS;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (BOOL)isIgnoringOwners
{
  return self->_isIgnoringOwners;
}

- (void)setIsIgnoringOwners:(BOOL)a3
{
  self->_isIgnoringOwners = a3;
}

- (int)volDirFd
{
  return self->_volDirFd;
}

- (NSString)stagingPath
{
  return self->_stagingPath;
}

- (NSUUID)volumeUUID
{
  return self->_volumeUUID;
}

- (int)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_libraryRoot, 0);
  objc_storeStrong((id *)&self->_stagingPath, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_operationsGroup, 0);
  objc_storeStrong((id *)&self->_pendingDeleteDocuments, 0);
  objc_storeStrong((id *)&self->_purgatoryPath, 0);
  objc_storeStrong((id *)&self->_dbPath, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_metainfo, 0);
}

@end