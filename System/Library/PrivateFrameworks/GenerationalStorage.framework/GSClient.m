@interface GSClient
- (BOOL)_validateToken:(id)a3 error:(id *)a4;
- (GSClient)initWithConnection:(id)a3;
- (id)_getCachedVolPath:(unint64_t)a3 error:(id *)a4;
- (id)_volPathFromPath:(id)a3 error:(id *)a4;
- (id)description;
- (int)importCookieFileDescriptorForVolumeURL:(id)a3 forWriting:(BOOL)a4 error:(id *)a5;
- (void)_removeAdditionsInVolPath:(id)a3 removalSpec:(id)a4 completionHandler:(id)a5;
- (void)_stagingPrefixCleanup:(id)a3;
- (void)checkItemAtURLValidInsidePermanentStorage:(id)a3 reply:(id)a4;
- (void)createAdditionInStorage:(int64_t)a3 stagedFileDescriptor:(id)a4 creationInfo:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)deleteImportCookieDataForVolumeAtURL:(id)a3 reply:(id)a4;
- (void)getAdditionInStorage:(int64_t)a3 andNameSpace:(id)a4 named:(id)a5 completionHandler:(id)a6;
- (void)getAdditionsInStorage:(int64_t)a3 andNameSpace:(id)a4 named:(id)a5 completionHandler:(id)a6;
- (void)getFileIdForDocumentId:(unint64_t)a3 onDevice:(int)a4 reply:(id)a5;
- (void)hintDocIDCreationForFileHandle:(id)a3;
- (void)invalidate;
- (void)isPermanentStorageSupportedForHandle:(id)a3 reply:(id)a4;
- (void)listAdditionsOfStorage:(int64_t)a3 nameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 andEnumerationState:(id)a7 completionHandler:(id)a8;
- (void)listAdditionsUnderPath:(id)a3 withNameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 andEnumerationState:(id)a7 completionHandler:(id)a8;
- (void)mergeAdditionInfoValueInStorage:(int64_t)a3 nameSpace:(id)a4 additionName:(id)a5 value:(id)a6 reply:(id)a7;
- (void)permanentStorageClose:(unint64_t)a3;
- (void)permanentStorageIDForHandle:(id)a3 reply:(id)a4;
- (void)permanentStorageOpenForHandle:(id)a3 withRemoteID:(unint64_t)a4 andDocumentID:(id)a5 reply:(id)a6;
- (void)permanentStoragePrefixForHandle:(id)a3 reply:(id)a4;
- (void)readImportCookieDataForVolumeAtURL:(id)a3 reply:(id)a4;
- (void)removeAdditionsInStorage:(int64_t)a3 removalSpec:(id)a4 completionHandler:(id)a5;
- (void)removeAdditionsUnderPath:(id)a3 additionsList:(id)a4 completionHandler:(id)a5;
- (void)requestFreeSpace:(unint64_t)a3 forVolume:(id)a4 reply:(id)a5;
- (void)setAdditionConflictResolvedInStorage:(int64_t)a3 nameSpace:(id)a4 additionName:(id)a5 value:(BOOL)a6 reply:(id)a7;
- (void)setAdditionDisplayNameInStorage:(int64_t)a3 nameSpace:(id)a4 additionName:(id)a5 value:(id)a6 reply:(id)a7;
- (void)setAdditionNameSpaceInStorage:(int64_t)a3 nameSpace:(id)a4 additionName:(id)a5 value:(id)a6 completionHandler:(id)a7;
- (void)setAdditionOptionsInStorage:(int64_t)a3 nameSpace:(id)a4 additionName:(id)a5 value:(unint64_t)a6 reply:(id)a7;
- (void)stagingPrefixForDevice:(int)a3 volumeUUID:(id)a4 reply:(id)a5;
- (void)stagingPrefixRelinquish:(id)a3;
- (void)storeImportCookieData:(id)a3 forVolumeURL:(id)a4 reply:(id)a5;
@end

@implementation GSClient

- (void)getAdditionInStorage:(int64_t)a3 andNameSpace:(id)a4 named:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = sub_100002D4C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v30 = "-[GSClient getAdditionInStorage:andNameSpace:named:completionHandler:]";
    __int16 v31 = 2048;
    int64_t v32 = a3;
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2112;
    id v36 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%lld, %@, %@)", buf, 0x2Au);
  }

  id v28 = 0;
  v14 = [(GSClient *)self _getCachedVolPath:a3 error:&v28];
  id v15 = v28;
  if (!v14)
  {
    v18 = sub_100002D4C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10002A060();
    }
    goto LABEL_12;
  }
  id v27 = 0;
  unsigned __int8 v16 = [v11 validateGSName:&v27];
  id v17 = v27;

  if ((v16 & 1) == 0)
  {
    v19 = +[NSString stringWithFormat:@"Invalid namespace"];
    v20 = sub_100002D4C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_10002A0D4();
    }

    sub_100003600(3, v19, 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    v18 = sub_100002D4C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10002A060();
    }
LABEL_12:

    (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v15);
    goto LABEL_13;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100003050;
  v21[3] = &unk_100041378;
  id v22 = v14;
  id v23 = v10;
  id v24 = v11;
  v25 = self;
  id v26 = v12;
  [v22 performOnResolvedPath:v21];

  id v15 = v17;
LABEL_13:
}

- (void)permanentStorageOpenForHandle:(id)a3 withRemoteID:(unint64_t)a4 andDocumentID:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = sub_100002D4C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v33 = "-[GSClient permanentStorageOpenForHandle:withRemoteID:andDocumentID:reply:]";
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 2048;
    unint64_t v37 = a4;
    __int16 v38 = 2112;
    id v39 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%@, %lld, %@)", buf, 0x2Au);
  }

  storageVolPaths = self->_storageVolPaths;
  id v15 = +[NSNumber numberWithUnsignedLongLong:a4];
  unsigned __int8 v16 = [(NSMutableDictionary *)storageVolPaths objectForKeyedSubscript:v15];

  if (v16)
  {
    id v17 = +[NSString stringWithFormat:@"Instance %lld already exists", a4];
    v18 = sub_100002D4C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100029F7C();
    }

    sub_100003600(101, v17, 0);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    v20 = sub_100002D4C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_100029F08();
    }

    (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v19);
    id v21 = 0;
  }
  else
  {
    id v31 = 0;
    +[GSVolPath volPathOnVolume:withFD:error:](GSVolPath, "volPathOnVolume:withFD:error:", 0, [v10 fileDescriptor], &v31);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = v31;
    id v30 = v22;
    unsigned __int8 v23 = [v21 isValidForCreds:0 documentIdentifier:v11 error:&v30];
    id v19 = v30;

    if (v23)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100002DA0;
      v25[3] = &unk_100041350;
      id v21 = v21;
      id v26 = v21;
      id v27 = self;
      id v28 = v12;
      unint64_t v29 = a4;
      [v21 performOnResolvedPath:v25];
    }
    else
    {
      id v24 = sub_100002D4C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_100029F08();
      }

      (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v19);
    }
  }
}

- (void)permanentStorageClose:(unint64_t)a3
{
  v5 = sub_100002D4C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100029FE4();
  }

  if ([(NSMutableDictionary *)self->_storageVolPaths count])
  {
    storageVolPaths = self->_storageVolPaths;
    v7 = +[NSNumber numberWithUnsignedLongLong:a3];
    [(NSMutableDictionary *)storageVolPaths removeObjectForKey:v7];

    if (![(NSMutableDictionary *)self->_storageVolPaths count])
    {
      id openHandleTx = self->_openHandleTx;
      self->_id openHandleTx = 0;
    }
  }
}

- (id)_getCachedVolPath:(unint64_t)a3 error:(id *)a4
{
  storageVolPaths = self->_storageVolPaths;
  v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  v9 = [(NSMutableDictionary *)storageVolPaths objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v11 = +[NSString stringWithFormat:@"Instance id %llu does not exist for %@\n", a3, self];
    id v12 = sub_100002D4C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100028658();
    }

    if (a4)
    {
      sub_100003600(101, v11, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v9;
}

- (GSClient)initWithConnection:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GSClient;
  v5 = [(GSClient *)&v13 init];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    id v8 = objc_alloc_init((Class)NSMutableSet);
    v9 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v8;

    *(_DWORD *)id v12 = [v4 processIdentifier];
    *(_DWORD *)&v12[4] = [v4 effectiveUserIdentifier];
    *(_DWORD *)&v12[8] = [v4 effectiveGroupIdentifier];
    if (v4) {
      [v4 auditToken];
    }
    else {
      memset(&v12[12], 0, 32);
    }
    *(_OWORD *)(v5 + 24) = *(_OWORD *)v12;
    *(_OWORD *)(v5 + 40) = *(_OWORD *)&v12[16];
    *(_OWORD *)(v5 + 52) = *(_OWORD *)&v12[28];
    id v10 = [v4 valueForEntitlement:@"com.apple.fileprovider.import-cookie"];
    v5[80] = [v10 BOOLValue];
  }
  return (GSClient *)v5;
}

- (void)invalidate
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_stagingPrefixes;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        v9 = sub_100002D4C();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v16 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] invalidating %@", buf, 0xCu);
        }

        [(GSClient *)self _stagingPrefixCleanup:v8];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_stagingPrefixes removeAllObjects];
  if ([(NSMutableDictionary *)self->_storageVolPaths count])
  {
    [(NSMutableDictionary *)self->_storageVolPaths removeAllObjects];
    id openHandleTx = self->_openHandleTx;
    self->_id openHandleTx = 0;
  }
}

- (void)dealloc
{
  [(GSClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)GSClient;
  [(GSClient *)&v3 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<GSClient %d>", self->_creds.pid];
}

- (void)requestFreeSpace:(unint64_t)a3 forVolume:(id)a4 reply:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  memset(&v25, 0, sizeof(v25));
  id v10 = sub_100002D4C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002943C((uint64_t)v8, a3);
  }

  if (![v8 isFileURL]
    || lstat((const char *)[v8 fileSystemRepresentation], &v25) < 0)
  {
    long long v14 = +[NSString stringWithFormat:@"invalid path [%@]", v8];
    id v15 = sub_100002D4C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100029108();
    }

    long long v13 = sub_100003600(104, v14, 0);

    uint64_t v16 = sub_100002D4C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000293C8();
    }

    v9[2](v9, 0, v13);
  }
  else
  {
    long long v11 = +[GSStorageManager existingLibraryForDevice:v25.st_dev];
    long long v12 = v11;
    if (v11)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000158FC;
      v22[3] = &unk_100041270;
      id v23 = v11;
      unint64_t v24 = a3;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000159F0;
      v20[3] = &unk_100041298;
      id v21 = v9;
      [v23 purgeWithCredential:&self->_creds whilePredicateIsTrue:v22 done:v20];

      long long v13 = 0;
    }
    else
    {
      id v17 = +[NSString stringWithFormat:@"no library on this volume"];
      v18 = sub_100002D4C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000290A0();
      }

      long long v13 = sub_100003600(102, v17, 0);

      id v19 = sub_100002D4C();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_1000293C8();
      }

      v9[2](v9, 0, v13);
    }
  }
}

- (void)getFileIdForDocumentId:(unint64_t)a3 onDevice:(int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = +[GSStorageManager existingLibraryForDevice:v5];
  if (!v8)
  {
    id v13 = 0;
    id v8 = +[GSStorageManager createLibraryForDevice:v5 error:&v13];
    id v9 = v13;
    if (!v8)
    {
      id v10 = sub_100002D4C();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
        sub_100029720((uint64_t)v9, v5, v10);
      }
    }
  }
  long long v11 = sub_100002D4C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100029690();
  }

  if (v8)
  {
    [v8 resolveDocId:a3 reply:v7];
  }
  else
  {
    long long v12 = sub_100002D4C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000295EC(v12);
    }

    (*((void (**)(id, void, void, uint64_t))v7 + 2))(v7, 0, 0, 4);
  }
}

- (void)hintDocIDCreationForFileHandle:(id)a3
{
  id v3 = a3;
  id v11 = 0;
  id v4 = +[GSVolPath volPathOnVolume:withFD:error:](GSVolPath, "volPathOnVolume:withFD:error:", 0, [v3 fileDescriptor], &v11);
  id v5 = v11;
  uint64_t v6 = sub_100002D4C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000297CC();
  }

  id v10 = v5;
  unsigned __int8 v7 = [v4 isValidForCreds:0 documentIdentifier:0 error:&v10];
  id v8 = v10;

  if (v7)
  {
    [v4 performOnResolvedPath:&stru_1000412D8];
  }
  else
  {
    id v9 = sub_100002D4C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100029798();
    }
  }
}

- (void)isPermanentStorageSupportedForHandle:(id)a3 reply:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void, uint64_t))a4;
  unsigned __int8 v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002992C();
  }

  id v17 = 0;
  id v8 = +[GSVolPath volPathOnVolume:withFD:error:](GSVolPath, "volPathOnVolume:withFD:error:", 0, [v5 fileDescriptor], &v17);
  id v9 = v17;
  if (v8)
  {
    if ([v8 isInIgnoredLocation])
    {
      id v10 = [v8 path];
      id v11 = +[NSString stringWithFormat:@"%@ is in an ignored location", v10];

      long long v12 = sub_100002D4C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100029108();
      }

      uint64_t v13 = sub_100003600(104, v11, 0);

      long long v14 = sub_100002D4C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100029840();
      }

      v6[2](v6, 0, v13);
      id v9 = (id)v13;
    }
    else
    {
      uint64_t v16 = sub_100002D4C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_1000298B4();
      }

      v6[2](v6, 1, 0);
    }
  }
  else
  {
    id v15 = sub_100002D4C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100029840();
    }

    v6[2](v6, 0, (uint64_t)v9);
  }
}

- (void)stagingPrefixForDevice:(int)a3 volumeUUID:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[NSFileManager defaultManager];
  id v11 = sub_100002D4C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100029AF0(v8, v6, v11);
  }

  id v39 = 0;
  long long v12 = +[GSStorageManager createLibraryForDevice:v6 error:&v39];
  id v13 = v39;
  if (v12)
  {
    long long v14 = [v12 volumeUUID];
    unsigned __int8 v15 = [v8 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      id v21 = +[NSString stringWithFormat:@"device UUID doesn't match"];
      id v22 = sub_100002D4C();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_100029108();
      }

      uint64_t v18 = sub_100003600(104, v21, 0);

      id v19 = sub_100002D4C();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
LABEL_16:
      sub_1000299A0();
LABEL_17:

      (*((void (**)(id, void, void, uint64_t))v9 + 2))(v9, 0, 0, v18);
      id v13 = (id)v18;
      goto LABEL_29;
    }
    if ([v12 isReadOnly])
    {
      uint64_t v16 = +[NSString stringWithFormat:@"storage is read-only"];
      id v17 = sub_100002D4C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_100029A14();
      }

      uint64_t v18 = sub_100003600(111, v16, 0);

      id v19 = sub_100002D4C();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    id v23 = [v12 stagingPath];
    id v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%d-%d-XXXXXXXX", self->_creds.uid, self->_creds.pid);
    id v38 = v13;
    stat v25 = objc_msgSend(v10, "gs_createTemporarySubdirectoryOfItem:withTemplate:error:", v23, v24, &v38);
    id v26 = v38;

    if (v25)
    {
      id v35 = v24;
      v41[0] = &off_100044250;
      v40[0] = NSFilePosixPermissions;
      v40[1] = NSFileOwnerAccountID;
      id v27 = +[NSNumber numberWithUnsignedInt:self->_creds.uid];
      v40[2] = NSFileGroupOwnerAccountID;
      v41[1] = v27;
      v41[2] = &off_100044268;
      id v28 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
      id v37 = v26;
      unint64_t v29 = v25;
      unsigned __int8 v30 = [v10 setAttributes:v28 ofItemAtPath:v25 error:&v37];
      id v34 = v37;

      if (v30)
      {
        id v36 = 0;
        id v31 = objc_msgSend(v29, "gs_issueExtension:error:", "com.apple.revisiond.staging", &v36);
        id v26 = v36;

        stat v25 = v29;
        if (v31)
        {
          [(NSMutableSet *)self->_stagingPrefixes addObject:v29];
          int64_t v32 = sub_100002D4C();
          id v24 = v35;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            sub_100029A7C();
          }

          (*((void (**)(id, void *, void *, void))v9 + 2))(v9, v29, v31, 0);
          goto LABEL_28;
        }
        [v10 removeItemAtPath:v29 error:0];
        __int16 v33 = sub_100002D4C();
        id v24 = v35;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          sub_1000299A0();
        }
LABEL_27:

        (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v26);
LABEL_28:

        id v13 = v26;
        goto LABEL_29;
      }
      [v10 removeItemAtPath:v29 error:0];
      id v26 = v34;
      id v24 = v35;
      stat v25 = v29;
    }
    __int16 v33 = sub_100002D4C();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_1000299A0();
    }
    goto LABEL_27;
  }
  v20 = sub_100002D4C();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_1000299A0();
  }

  (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v13);
LABEL_29:
}

- (void)_stagingPrefixCleanup:(id)a3
{
  id v3 = a3;
  uint64_t v4 = open((const char *)[v3 fileSystemRepresentation], 260);
  if ((v4 & 0x80000000) != 0)
  {
    unsigned __int8 v7 = sub_100002D4C();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v9 = 138412290;
    id v10 = v3;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't resolve staging path %@, volume is probably gone", (uint8_t *)&v9, 0xCu);
    goto LABEL_9;
  }
  int v5 = v4;
  uint64_t v6 = +[GSVolPath volPathOnVolume:0 withFD:v4 error:0];
  if (!v6)
  {
    unsigned __int8 v7 = sub_100002D4C();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v9 = 138412290;
    id v10 = v3;
    goto LABEL_8;
  }
  unsigned __int8 v7 = v6;
  close(v5);
  id v8 = +[NSFileManager defaultManager];
  [v8 removeItemAtPath:v3 error:0];

LABEL_9:
}

- (void)stagingPrefixRelinquish:(id)a3
{
  id v4 = a3;
  int v5 = sub_100002D4C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100029BA4();
  }

  if ([(NSMutableSet *)self->_stagingPrefixes containsObject:v4])
  {
    [(NSMutableSet *)self->_stagingPrefixes removeObject:v4];
    [(GSClient *)self _stagingPrefixCleanup:v4];
  }
}

- (void)permanentStoragePrefixForHandle:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100002D4C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100029C8C();
  }

  id v19 = 0;
  int v9 = +[GSVolPath volPathOnVolume:withFD:error:](GSVolPath, "volPathOnVolume:withFD:error:", 0, [v6 fileDescriptor], &v19);
  id v10 = v19;
  id v18 = v10;
  unsigned __int8 v11 = [v9 isValidForCreds:0 documentIdentifier:0 error:&v18];
  id v12 = v18;

  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000167D4;
    v14[3] = &unk_100041300;
    id v15 = v9;
    uint64_t v16 = self;
    id v17 = v7;
    [v15 performOnResolvedPath:v14];
  }
  else
  {
    id v13 = sub_100002D4C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100029C18();
    }

    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v12);
  }
}

- (void)permanentStorageIDForHandle:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100029E04();
  }

  id v16 = 0;
  id v8 = +[GSVolPath volPathOnVolume:withFD:error:](GSVolPath, "volPathOnVolume:withFD:error:", 0, [v5 fileDescriptor], &v16);
  id v9 = v16;
  id v15 = v9;
  unsigned __int8 v10 = [v8 isValidForCreds:0 documentIdentifier:0 error:&v15];
  id v11 = v15;

  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100016AA0;
    v13[3] = &unk_100041328;
    id v14 = v6;
    [v8 performOnResolvedPath:v13];
  }
  else
  {
    id v12 = sub_100002D4C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100029D7C();
    }

    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v11);
  }
}

- (void)getAdditionsInStorage:(int64_t)a3 andNameSpace:(id)a4 named:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = sub_100002D4C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    unint64_t v29 = "-[GSClient getAdditionsInStorage:andNameSpace:named:completionHandler:]";
    __int16 v30 = 2048;
    int64_t v31 = a3;
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 2112;
    id v35 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%lld, %@, %@)", buf, 0x2Au);
  }

  id v27 = 0;
  id v14 = [(GSClient *)self _getCachedVolPath:a3 error:&v27];
  id v15 = v27;
  if (v14)
  {
    if (sub_100016E18(v11))
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100016F50;
      v21[3] = &unk_100041378;
      id v22 = v11;
      id v23 = v14;
      id v24 = v10;
      stat v25 = self;
      id v26 = v12;
      [v23 performOnResolvedPath:v21];
    }
    else
    {
      id v17 = +[NSString stringWithFormat:@"Invalid removal spec"];
      id v18 = sub_100002D4C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100026CF8();
      }

      uint64_t v19 = sub_100003600(105, v17, 0);

      v20 = sub_100002D4C();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_10002A144();
      }

      (*((void (**)(id, void, void, void, uint64_t))v12 + 2))(v12, 0, 0, 0, v19);
      id v15 = (id)v19;
    }
  }
  else
  {
    id v16 = sub_100002D4C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10002A144();
    }

    (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v15);
  }
}

- (BOOL)_validateToken:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 count];
    if (!a4 || v6 == (id)3) {
      goto LABEL_9;
    }
  }
  else if (!a4)
  {
    goto LABEL_9;
  }
  id v7 = +[NSString stringWithFormat:@"invalid enumeration state"];
  id v8 = sub_100002D4C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100029F7C();
  }

  id v9 = sub_100003600(101, v7, 0);

  *a4 = v9;
LABEL_9:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [v5 copy];
  id v11 = (char *)[v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v16 = +[NSString stringWithFormat:@"invalid enumeration state", v20];
            id v17 = sub_100002D4C();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              sub_100029F7C();
            }

            id v18 = sub_100003600(101, v16, 0);

            BOOL v15 = 0;
            *a4 = v18;
          }
          else
          {
            BOOL v15 = 0;
          }
          goto LABEL_23;
        }
      }
      id v12 = (char *)[v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_23:

  return v15;
}

- (void)listAdditionsOfStorage:(int64_t)a3 nameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 andEnumerationState:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = sub_100002D4C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v41 = "-[GSClient listAdditionsOfStorage:nameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:]";
    __int16 v42 = 2048;
    int64_t v43 = a3;
    __int16 v44 = 2112;
    id v45 = v14;
    __int16 v46 = 2048;
    unint64_t v47 = a5;
    __int16 v48 = 2048;
    unint64_t v49 = a6;
    __int16 v50 = 2112;
    id v51 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%lld, %@, %llx, %llx, %@)", buf, 0x3Eu);
  }

  if (v15)
  {
    id v39 = 0;
    unsigned __int8 v18 = [(GSClient *)self _validateToken:v15 error:&v39];
    id v19 = v39;
    if ((v18 & 1) == 0)
    {
      stat v25 = sub_100002D4C();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_10002A1B8();
      }

      (*((void (**)(id, void, void, void, void, id))v16 + 2))(v16, 0, 0, 0, 0, v19);
      goto LABEL_16;
    }
    id v20 = [v15 mutableCopy];
  }
  else
  {
    id v20 = 0;
    id v19 = 0;
  }
  long long v21 = v19;
  id v38 = 0;
  id v22 = [(GSClient *)self _getCachedVolPath:a3 error:&v38];
  id v19 = v38;

  if (!v22)
  {
    id v26 = sub_100002D4C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_10002A1B8();
    }

    (*((void (**)(id, void, void, void, void, id))v16 + 2))(v16, 0, 0, 0, 0, v19);
LABEL_16:
    id v22 = 0;
    goto LABEL_20;
  }
  id v37 = 0;
  unsigned __int8 v23 = [v14 validateGSName:&v37];
  id v28 = v37;

  if (v23)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000177C0;
    v29[3] = &unk_1000413A0;
    id v30 = v20;
    id v22 = v22;
    id v31 = v22;
    unint64_t v35 = a5;
    unint64_t v36 = a6;
    id v32 = v14;
    id v33 = self;
    id v34 = v16;
    id v24 = v20;
    [v22 performOnResolvedPath:v29];

    id v19 = v28;
  }
  else
  {
    id v27 = sub_100002D4C();
    id v19 = v28;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_10002A1B8();
    }

    (*((void (**)(id, void, void, void, void, id))v16 + 2))(v16, 0, 0, 0, 0, v28);
  }
LABEL_20:
}

- (void)checkItemAtURLValidInsidePermanentStorage:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void))a4;
  unsigned __int8 v6 = [a3 isFileURL];
  id v7 = sub_100002D4C();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      sub_10002A22C();
    }

    v5[2](v5, 1, 0);
  }
  else
  {
    if (v8) {
      sub_10002A2A4((uint64_t)NSURLErrorDomain, v7);
    }

    uint64_t v9 = +[NSError errorWithDomain:NSURLErrorDomain code:-1002 userInfo:0];
    v5[2](v5, 0, v9);

    id v5 = (void (**)(id, uint64_t, void))v9;
  }
}

- (void)setAdditionOptionsInStorage:(int64_t)a3 nameSpace:(id)a4 additionName:(id)a5 value:(unint64_t)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, id))a7;
  id v15 = sub_100002D4C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v40 = "-[GSClient setAdditionOptionsInStorage:nameSpace:additionName:value:reply:]";
    __int16 v41 = 2048;
    int64_t v42 = a3;
    __int16 v43 = 2112;
    id v44 = v12;
    __int16 v45 = 2112;
    id v46 = v13;
    __int16 v47 = 2048;
    unint64_t v48 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%lld, %@, %@, %llx)", buf, 0x34u);
  }

  if ((a6 & 0xFFFFFFFFFFFFFFE1) != 1)
  {
    id v27 = +[NSString stringWithFormat:@"invalid options"];
    id v28 = sub_100002D4C();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_100026D60();
    }

    sub_100003600(110, v27, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    unint64_t v29 = sub_100002D4C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10002A350();
    }
    goto LABEL_20;
  }
  id v38 = 0;
  unsigned int v16 = [v13 validateGSName:&v38];
  id v17 = v38;
  if (!v16) {
    goto LABEL_18;
  }
  id v37 = 0;
  unsigned __int8 v18 = [v12 validateGSName:&v37];
  id v19 = v37;

  if ((v18 & 1) == 0)
  {
    id v17 = v19;
LABEL_18:
    unint64_t v29 = sub_100002D4C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10002A350();
    }
    goto LABEL_20;
  }
  id v36 = 0;
  id v20 = [(GSClient *)self _getCachedVolPath:a3 error:&v36];
  id v17 = v36;

  if (!v20)
  {
    unint64_t v29 = sub_100002D4C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10002A350();
    }
LABEL_20:

    v14[2](v14, 0, v17);
    goto LABEL_21;
  }
  long long v21 = [v20 library];
  unsigned int v22 = [v21 isReadOnly];

  if (v22)
  {
    unsigned __int8 v23 = +[NSString stringWithFormat:@"storage is read-only"];
    id v24 = sub_100002D4C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_100029A14();
    }

    uint64_t v25 = sub_100003600(111, v23, 0);

    id v26 = sub_100002D4C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_10002A350();
    }

    v14[2](v14, 0, (id)v25);
    id v17 = (id)v25;
  }
  else
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100017EF0;
    v30[3] = &unk_1000413C8;
    id v31 = v13;
    id v32 = v12;
    id v33 = self;
    unint64_t v35 = a6 & 0xFFFFFFFFFFFFFFEDLL;
    id v34 = v14;
    [v20 performOnResolvedPath:v30];
  }
LABEL_21:
}

- (void)mergeAdditionInfoValueInStorage:(int64_t)a3 nameSpace:(id)a4 additionName:(id)a5 value:(id)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void, id))a7;
  unsigned int v16 = sub_100002D4C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    id v46 = "-[GSClient mergeAdditionInfoValueInStorage:nameSpace:additionName:value:reply:]";
    __int16 v47 = 2048;
    int64_t v48 = a3;
    __int16 v49 = 2112;
    id v50 = v12;
    __int16 v51 = 2112;
    id v52 = v13;
    __int16 v53 = 2112;
    id v54 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%lld, %@, %@, %@)", buf, 0x34u);
  }

  id v44 = 0;
  unsigned int v17 = [v13 validateGSName:&v44];
  id v18 = v44;
  if (!v17) {
    goto LABEL_13;
  }
  id v43 = 0;
  unsigned __int8 v19 = [v12 validateGSName:&v43];
  id v20 = v43;

  if ((v19 & 1) == 0)
  {
    id v18 = v20;
LABEL_13:
    unint64_t v29 = sub_100002D4C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10002A44C();
    }
    goto LABEL_15;
  }
  id v42 = 0;
  id v21 = [(GSClient *)self _getCachedVolPath:a3 error:&v42];
  id v18 = v42;

  if (!v21)
  {
    unint64_t v29 = sub_100002D4C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10002A44C();
    }
LABEL_15:

    v15[2](v15, 0, v18);
    id v28 = 0;
    id v21 = 0;
    goto LABEL_16;
  }
  unsigned int v22 = [v21 library];
  unsigned int v23 = [v22 isReadOnly];

  if (v23)
  {
    id v24 = +[NSString stringWithFormat:@"storage is read-only"];
    uint64_t v25 = sub_100002D4C();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_100029A14();
    }

    uint64_t v26 = sub_100003600(111, v24, 0);

    id v27 = sub_100002D4C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_10002A44C();
    }

    v15[2](v15, 0, (id)v26);
    id v28 = 0;
    id v18 = (id)v26;
  }
  else
  {
    id v41 = 0;
    id v28 = +[NSPropertyListSerialization propertyListWithData:v14 options:0 format:0 error:&v41];
    id v30 = v41;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100018508;
      v34[3] = &unk_1000413F0;
      id v35 = v13;
      id v36 = v12;
      id v37 = self;
      id v21 = v21;
      id v38 = v21;
      id v28 = v28;
      id v39 = v28;
      v40 = v15;
      [v21 performOnResolvedPath:v34];

      id v18 = v30;
    }
    else
    {
      id v31 = +[NSString stringWithFormat:@"Invalid plist value received"];
      id v32 = sub_100002D4C();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        sub_100029F7C();
      }

      sub_100003600(101, v31, v30);
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      id v33 = sub_100002D4C();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        sub_10002A44C();
      }

      v15[2](v15, 0, v18);
    }
  }
LABEL_16:
}

- (void)setAdditionDisplayNameInStorage:(int64_t)a3 nameSpace:(id)a4 additionName:(id)a5 value:(id)a6 reply:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void, id))a7;
  unsigned int v16 = sub_100002D4C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    id v43 = "-[GSClient setAdditionDisplayNameInStorage:nameSpace:additionName:value:reply:]";
    __int16 v44 = 2048;
    int64_t v45 = a3;
    __int16 v46 = 2112;
    id v47 = v12;
    __int16 v48 = 2112;
    id v49 = v13;
    __int16 v50 = 2112;
    id v51 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%lld, %@, %@, %@)", buf, 0x34u);
  }

  id v41 = 0;
  unsigned int v17 = [v13 validateGSName:&v41];
  id v18 = v41;
  if (!v17) {
    goto LABEL_15;
  }
  id v40 = 0;
  unsigned int v19 = [v14 validateGSName:&v40];
  id v20 = v40;

  if (!v19)
  {
    id v18 = v20;
    goto LABEL_15;
  }
  id v39 = 0;
  unsigned __int8 v21 = [v12 validateGSName:&v39];
  id v22 = v39;

  if ((v21 & 1) == 0)
  {
    id v18 = v22;
LABEL_15:
    id v30 = sub_100002D4C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10002A548();
    }
    goto LABEL_17;
  }
  id v38 = 0;
  id v23 = [(GSClient *)self _getCachedVolPath:a3 error:&v38];
  id v18 = v38;

  if (!v23)
  {
    id v30 = sub_100002D4C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10002A548();
    }
LABEL_17:

    v15[2](v15, 0, v18);
    id v23 = 0;
    goto LABEL_18;
  }
  id v24 = [v23 library];
  unsigned int v25 = [v24 isReadOnly];

  if (v25)
  {
    uint64_t v26 = +[NSString stringWithFormat:@"storage is read-only"];
    id v27 = sub_100002D4C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_100029A14();
    }

    uint64_t v28 = sub_100003600(111, v26, 0);

    unint64_t v29 = sub_100002D4C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10002A548();
    }

    v15[2](v15, 0, (id)v28);
    id v18 = (id)v28;
  }
  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100018A5C;
    v31[3] = &unk_1000413F0;
    id v32 = v13;
    id v33 = v12;
    id v34 = self;
    id v23 = v23;
    id v35 = v23;
    id v36 = v14;
    id v37 = v15;
    [v23 performOnResolvedPath:v31];
  }
LABEL_18:
}

- (void)setAdditionNameSpaceInStorage:(int64_t)a3 nameSpace:(id)a4 additionName:(id)a5 value:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void, id))a7;
  unsigned int v16 = sub_100002D4C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    id v43 = "-[GSClient setAdditionNameSpaceInStorage:nameSpace:additionName:value:completionHandler:]";
    __int16 v44 = 2048;
    int64_t v45 = a3;
    __int16 v46 = 2112;
    id v47 = v12;
    __int16 v48 = 2112;
    id v49 = v13;
    __int16 v50 = 2112;
    id v51 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%lld, %@, %@, %@)", buf, 0x34u);
  }

  id v41 = 0;
  unsigned int v17 = [v13 validateGSName:&v41];
  id v18 = v41;
  if (!v17) {
    goto LABEL_15;
  }
  id v40 = 0;
  unsigned int v19 = [v12 validateGSName:&v40];
  id v20 = v40;

  if (!v19)
  {
    id v18 = v20;
    goto LABEL_15;
  }
  id v39 = 0;
  unsigned __int8 v21 = [v14 validateGSName:&v39];
  id v22 = v39;

  if ((v21 & 1) == 0)
  {
    id v18 = v22;
LABEL_15:
    id v30 = sub_100002D4C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10002A644();
    }
    goto LABEL_17;
  }
  id v38 = 0;
  id v23 = [(GSClient *)self _getCachedVolPath:a3 error:&v38];
  id v18 = v38;

  if (!v23)
  {
    id v30 = sub_100002D4C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10002A644();
    }
LABEL_17:

    v15[2](v15, 0, v18);
    id v23 = 0;
    goto LABEL_18;
  }
  id v24 = [v23 library];
  unsigned int v25 = [v24 isReadOnly];

  if (v25)
  {
    uint64_t v26 = +[NSString stringWithFormat:@"storage is read-only"];
    id v27 = sub_100002D4C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_100029A14();
    }

    uint64_t v28 = sub_100003600(111, v26, 0);

    unint64_t v29 = sub_100002D4C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10002A644();
    }

    v15[2](v15, 0, (id)v28);
    id v18 = (id)v28;
  }
  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100018FB0;
    v31[3] = &unk_1000413F0;
    id v23 = v23;
    id v32 = v23;
    id v33 = v12;
    id v34 = v13;
    id v35 = v14;
    id v36 = self;
    id v37 = v15;
    [v23 performOnResolvedPath:v31];
  }
LABEL_18:
}

- (id)_volPathFromPath:(id)a3 error:(id *)a4
{
  memset(&v21, 0, sizeof(v21));
  id v5 = a3;
  if (lstat((const char *)[v5 fileSystemRepresentation], &v21))
  {
    if (a4)
    {
      uint64_t v6 = *__error();
      id v7 = __error();
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"lstat(%@) failed; error %d (%s)\n",
        v5,
        v6,
      BOOL v8 = strerror(*v7));
      uint64_t v9 = sub_100002D4C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100029F7C();
      }

      id v10 = sub_100003600(101, v8, 0);

      id v11 = v10;
      id v12 = 0;
      *a4 = v11;
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v13 = +[GSStorageManager existingLibraryForDevice:v21.st_dev];
    if (v13)
    {
      id v20 = 0;
      id v12 = +[GSVolPath volPathOnVolume:v13 withPath:v5 error:&v20];
      id v14 = v20;
      id v15 = v14;
      if (a4 && !v12) {
        *a4 = v14;
      }
    }
    else if (a4)
    {
      unsigned int v16 = +[NSString stringWithFormat:@"Unable to open library"];
      unsigned int v17 = sub_100002D4C();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_1000290A0();
      }

      id v18 = sub_100003600(102, v16, 0);

      id v12 = 0;
      *a4 = v18;
    }
    else
    {
      id v12 = 0;
    }
  }
  return v12;
}

- (void)listAdditionsUnderPath:(id)a3 withNameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 andEnumerationState:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = sub_100002D4C();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    id v40 = "-[GSClient listAdditionsUnderPath:withNameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:]";
    __int16 v41 = 2112;
    id v42 = v14;
    __int16 v43 = 2112;
    id v44 = v15;
    __int16 v45 = 2048;
    unint64_t v46 = a5;
    __int16 v47 = 2048;
    unint64_t v48 = a6;
    __int16 v49 = 2112;
    id v50 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%@, %@, %llx, %llx, %@)", buf, 0x3Eu);
  }

  if (!v16)
  {
    unint64_t v21 = a6;
    id v22 = 0;
    id v20 = 0;
    goto LABEL_7;
  }
  id v38 = 0;
  unsigned __int8 v19 = [(GSClient *)self _validateToken:v16 error:&v38];
  id v20 = v38;
  if (v19)
  {
    unint64_t v21 = a6;
    id v22 = [v16 mutableCopy];
LABEL_7:
    id v23 = v20;
    id v37 = v20;
    id v24 = -[GSClient _volPathFromPath:error:](self, "_volPathFromPath:error:", v14, &v37, v14);
    id v20 = v37;

    if (v24)
    {
      unsigned int v25 = [v24 library];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000195D4;
      v29[3] = &unk_100041418;
      id v30 = v22;
      id v31 = v24;
      unint64_t v35 = a5;
      unint64_t v36 = v21;
      id v32 = v15;
      id v33 = self;
      id v34 = v17;
      [v25 dispatchSync:v29];
    }
    else
    {
      id v27 = sub_100002D4C();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_10002A734();
      }

      (*((void (**)(id, void, void, id))v17 + 2))(v17, 0, 0, v20);
    }

    id v14 = v28;
    goto LABEL_16;
  }
  uint64_t v26 = sub_100002D4C();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_10002A734();
  }

  (*((void (**)(id, void, void, id))v17 + 2))(v17, 0, 0, v20);
LABEL_16:
}

- (void)createAdditionInStorage:(int64_t)a3 stagedFileDescriptor:(id)a4 creationInfo:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = sub_100002D4C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v44 = "-[GSClient createAdditionInStorage:stagedFileDescriptor:creationInfo:completionHandler:]";
    __int16 v45 = 2048;
    int64_t v46 = a3;
    __int16 v47 = 2112;
    id v48 = v10;
    __int16 v49 = 2112;
    id v50 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%lld, %@, %@)", buf, 0x2Au);
  }

  if (fcntl((int)[v10 fileDescriptor], 50, buf) < 0)
  {
    id v23 = +[NSString stringWithFormat:@"Unable to get path for file descriptor"];
    int v24 = *__error();
    unsigned int v25 = sub_100002D4C();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_10002A890((int)v23, v24, v25);
    }

    sub_100011F0C(v24, v23);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v26 = sub_100002D4C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_10002A81C();
    }
    goto LABEL_21;
  }
  memset(&v42, 0, sizeof(v42));
  if (fstat((int)[v10 fileDescriptor], &v42) < 0)
  {
    id v27 = +[NSString stringWithFormat:@"Unable to stat file descriptor"];
    int v28 = *__error();
    unint64_t v29 = sub_100002D4C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_10002A890((int)v27, v28, v29);
    }

    sub_100011F0C(v28, v27);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v26 = sub_100002D4C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_10002A81C();
    }
LABEL_21:

    (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v16);
    id v14 = 0;
    id v17 = 0;
    goto LABEL_31;
  }
  id v14 = +[NSString gs_stringWithFileSystemRepresentation:buf];
  id v41 = 0;
  id v15 = sub_1000140F8(v14, v11, &v41);
  id v16 = v41;

  if (v15)
  {
    id v40 = 0;
    id v17 = [(GSClient *)self _getCachedVolPath:a3 error:&v40];
    id v18 = v40;

    if (v17)
    {
      unsigned __int8 v19 = [v17 library];
      if ([v19 isReadOnly])
      {
        id v20 = +[NSString stringWithFormat:@"storage is read-only"];
        unint64_t v21 = sub_100002D4C();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          sub_100029A14();
        }

        sub_100003600(111, v20, 0);
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        id v22 = sub_100002D4C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_10002A81C();
        }

        (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v16);
      }
      else
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100019C64;
        v32[3] = &unk_100041440;
        id v33 = v19;
        id v34 = v15;
        stat v39 = v42;
        id v35 = v14;
        unint64_t v36 = self;
        id v37 = v17;
        id v38 = v12;
        [v37 performOnResolvedPath:v32];

        id v16 = v18;
      }
    }
    else
    {
      id v31 = sub_100002D4C();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_10002A81C();
      }

      (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v18);
      id v17 = 0;
      id v16 = v18;
    }
    id v11 = v15;
  }
  else
  {
    id v30 = sub_100002D4C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10002A81C();
    }

    (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v16);
    id v17 = 0;
    id v11 = 0;
  }
LABEL_31:
}

- (void)_removeAdditionsInVolPath:(id)a3 removalSpec:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v34;
    id v27 = self;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(v11);
      }
      id v16 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
      id v17 = [v11 objectForKeyedSubscript:v16];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (![v16 validateGSName:0]) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      int v18 = sub_100016E18(v17);

      if (!v18) {
        goto LABEL_18;
      }
      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
        self = v27;
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }

LABEL_18:
    unsigned int v25 = +[NSString stringWithFormat:@"Invalid removal spec"];
    uint64_t v26 = sub_100002D4C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_100026CF8();
    }

    id v23 = sub_100003600(105, v25, 0);

    int v24 = sub_100002D4C();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
LABEL_21:
    sub_10002A924();
    goto LABEL_22;
  }
LABEL_12:

  unsigned __int8 v19 = [v8 library];
  unsigned int v20 = [v19 isReadOnly];

  if (!v20)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001A1B4;
    v28[3] = &unk_100041490;
    id v32 = v10;
    id v29 = v11;
    id v30 = v8;
    id v31 = self;
    [v30 performOnResolvedPath:v28];

    id v23 = v32;
    goto LABEL_23;
  }
  unint64_t v21 = +[NSString stringWithFormat:@"storage is read-only"];
  id v22 = sub_100002D4C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_100029A14();
  }

  id v23 = sub_100003600(111, v21, 0);

  int v24 = sub_100002D4C();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_21;
  }
LABEL_22:

  (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v23);
LABEL_23:
}

- (void)removeAdditionsInStorage:(int64_t)a3 removalSpec:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, id))a5;
  id v10 = sub_100002D4C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10002AB88((uint64_t)v8, a3);
  }

  id v14 = 0;
  id v11 = [(GSClient *)self _getCachedVolPath:a3 error:&v14];
  id v12 = v14;
  if (v11)
  {
    [(GSClient *)self _removeAdditionsInVolPath:v11 removalSpec:v8 completionHandler:v9];
  }
  else
  {
    id v13 = sub_100002D4C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10002AB14();
    }

    v9[2](v9, 0, v12);
  }
}

- (void)removeAdditionsUnderPath:(id)a3 additionsList:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  id v11 = sub_100002D4C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002AC8C();
  }

  id v12 = +[GSRemoveAdditionSpec calculateSpecForAdditionRemovalUnderPath:v9];
  if (v12)
  {
    id v31 = 0;
    id v13 = [(GSClient *)self _volPathFromPath:v8 error:&v31];
    id v14 = v31;
    if (v13)
    {
      uint64_t v15 = [v13 library];
      unsigned int v16 = [v15 isReadOnly];

      if (v16)
      {
        id v17 = +[NSString stringWithFormat:@"storage is read-only"];
        int v18 = sub_100002D4C();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_100029A14();
        }

        uint64_t v19 = sub_100003600(111, v17, 0);

        unsigned int v20 = sub_100002D4C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_10002AC18();
        }

        v10[2](v10, 0, v19);
        id v14 = (id)v19;
      }
      else
      {
        unsigned int v25 = [v13 library];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10001AB2C;
        v26[3] = &unk_1000414B8;
        id v27 = v12;
        id v28 = v13;
        id v29 = self;
        id v30 = v10;
        [v25 dispatchSync:v26];
      }
    }
    else
    {
      int v24 = sub_100002D4C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_10002AC18();
      }

      v10[2](v10, 0, (uint64_t)v14);
    }
  }
  else
  {
    unint64_t v21 = +[NSString stringWithFormat:@"Invalid removal spec"];
    id v22 = sub_100002D4C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100026CF8();
    }

    sub_100003600(105, v21, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    id v23 = sub_100002D4C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_10002AC18();
    }

    v10[2](v10, 0, (uint64_t)v14);
  }
}

- (int)importCookieFileDescriptorForVolumeURL:(id)a3 forWriting:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  if (realpath_DARWIN_EXTSN((const char *)[a3 fileSystemRepresentation], v55))
  {
    id v8 = +[NSString stringWithUTF8String:v55];
    id v9 = +[NSURL fileURLWithPath:v8 isDirectory:1];

    if (v6) {
      int v10 = 536871430;
    }
    else {
      int v10 = 536870916;
    }
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10001B7CC;
    v52[3] = &unk_1000414E0;
    if (v6) {
      id v11 = "file-write-data";
    }
    else {
      id v11 = "file-read-data";
    }
    v52[4] = self;
    v52[5] = v11;
    id v12 = objc_retainBlock(v52);
    memset(&v54, 0, 512);
    if (!statfs(v55, &v54) && (v54.f_flags & 0x40000000) != 0)
    {
      id v32 = [v9 URLByAppendingPathComponent:@".DocumentRevisions-V100" isDirectory:1];
      id v19 = [v32 URLByAppendingPathComponent:@"fpfs_import_cookie" isDirectory:0];

      if (((uint64_t (*)(void *, id))v12[2])(v12, v19))
      {
        id v19 = v19;
        int v20 = open((const char *)[v19 fileSystemRepresentation], v10, 384);
        if (v20 < 0)
        {
          long long v33 = sub_100002D4C();
          if (os_log_type_enabled(v33, (os_log_type_t)0x90u)) {
            sub_10002B150();
          }

          if (a5)
          {
            long long v34 = +[NSString stringWithFormat:@"Invalid volume URL"];
            long long v35 = sub_100002D4C();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
              sub_100029108();
            }

            long long v36 = sub_100003600(104, v34, 0);

            *a5 = v36;
          }
        }
        goto LABEL_89;
      }
      if (!a5) {
        goto LABEL_78;
      }
      id v27 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:0];
    }
    else
    {
      memset(&v51, 0, sizeof(v51));
      if ((lstat(v55, &v51) & 0x80000000) == 0)
      {
        id v13 = +[GSStorageManager existingLibraryForDevice:v51.st_dev];
        if (!v13 && v6)
        {
          id v14 = sub_100002D4C();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            sub_10002B0D4();
          }

          id v50 = 0;
          id v13 = +[GSStorageManager createLibraryForDevice:v51.st_dev error:&v50];
          id v15 = v50;
          if (v15)
          {
            unsigned int v16 = sub_100002D4C();
            if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
              sub_10002B06C();
            }
          }
        }
        if (v13)
        {
          id v17 = [v13 libraryRoot];
          int v18 = +[NSURL fileURLWithPath:v17 isDirectory:1];

          id v19 = [v18 URLByAppendingPathComponent:@"fpfs_import_cookie" isDirectory:0];
          if (v19)
          {
            if (((uint64_t (*)(void *, id))v12[2])(v12, v19))
            {
              int v20 = open((const char *)[v19 fileSystemRepresentation], v10, 384);
              if ((v20 & 0x80000000) == 0) {
                goto LABEL_80;
              }
              unint64_t v21 = sub_100002D4C();
              if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
                sub_10002AFDC();
              }

              if (!a5) {
                goto LABEL_80;
              }
              id v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
              goto LABEL_64;
            }
            if (a5)
            {
              id v22 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:0];
LABEL_63:
              int v20 = -1;
LABEL_64:
              *a5 = v22;
LABEL_80:

LABEL_88:
              goto LABEL_89;
            }
          }
          else
          {
            id v37 = sub_100002D4C();
            if (os_log_type_enabled(v37, (os_log_type_t)0x90u)) {
              sub_10002AFA8();
            }

            if (a5)
            {
              id v38 = +[NSString stringWithFormat:@"Can't create cookie URL"];
              stat v39 = sub_100002D4C();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
                sub_100028658();
              }

              id v22 = sub_100003600(101, v38, 0);

              goto LABEL_63;
            }
          }
          int v20 = -1;
          goto LABEL_80;
        }
        id v28 = sub_100002D4C();
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
          sub_10002AF3C();
        }

        if (v6)
        {
          if (a5)
          {
            id v29 = +[NSString stringWithFormat:@"No storage in volume"];
            id v30 = sub_100002D4C();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
              sub_1000290A0();
            }

            id v31 = sub_100003600(102, v29, 0);

            id v19 = 0;
            *a5 = v31;
          }
          else
          {
            id v19 = 0;
          }
          int v20 = -1;
          goto LABEL_88;
        }
        NSURLResourceKey v53 = NSURLVolumeURLKey;
        id v40 = +[NSArray arrayWithObjects:&v53 count:1];
        id v49 = 0;
        id v41 = [v9 resourceValuesForKeys:v40 error:&v49];
        id v42 = v49;

        if (v42)
        {
          __int16 v43 = sub_100002D4C();
          if (os_log_type_enabled(v43, (os_log_type_t)0x90u)) {
            sub_10002AED4();
          }
        }
        id v44 = [v41 objectForKeyedSubscript:NSURLVolumeURLKey];
        __int16 v45 = [v44 URLByAppendingPathComponent:@".DocumentRevisions-V100" isDirectory:1];
        id v19 = [v45 URLByAppendingPathComponent:@"fpfs_import_cookie" isDirectory:0];

        if (((uint64_t (*)(void *, id))v12[2])(v12, v19))
        {
          int v20 = open((const char *)[v19 fileSystemRepresentation], 536870916, 384);
          if ((v20 & 0x80000000) == 0) {
            goto LABEL_87;
          }
          int64_t v46 = sub_100002D4C();
          if (os_log_type_enabled(v46, (os_log_type_t)0x90u)) {
            sub_10002AE54();
          }

          if (!a5) {
            goto LABEL_87;
          }
          __int16 v47 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
        }
        else
        {
          if (!a5)
          {
            int v20 = -1;
            goto LABEL_87;
          }
          __int16 v47 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:0];
          int v20 = -1;
        }
        *a5 = v47;
LABEL_87:

        goto LABEL_88;
      }
      id v23 = sub_100002D4C();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
        sub_10002ADC4();
      }

      if (!a5)
      {
        id v19 = 0;
LABEL_78:
        int v20 = -1;
LABEL_89:

        goto LABEL_90;
      }
      int v24 = +[NSString stringWithFormat:@"Invalid volume"];
      unsigned int v25 = sub_100002D4C();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_100029108();
      }

      uint64_t v26 = sub_100003600(104, v24, 0);

      id v27 = v26;
      id v19 = 0;
    }
    *a5 = v27;
    goto LABEL_78;
  }
  if (a5)
  {
    *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
  }
  id v9 = sub_100002D4C();
  if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
    sub_10002AD90();
  }
  int v20 = -1;
LABEL_90:

  return v20;
}

- (void)storeImportCookieData:(id)a3 forVolumeURL:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, id))a5;
  id v11 = sub_100002D4C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10002B5B8((uint64_t)v8, v9, v11);
  }

  if (v9)
  {
    id v58 = 0;
    uint64_t v12 = [(GSClient *)self importCookieFileDescriptorForVolumeURL:v9 forWriting:1 error:&v58];
    id v13 = v58;
    if ((v12 & 0x80000000) != 0)
    {
      unint64_t v21 = sub_100002D4C();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
        sub_10002B324();
      }

      if (!v13)
      {
        id v22 = +[NSString stringWithFormat:@"Unknown error. See logs for more details."];
        id v23 = sub_100002D4C();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_100028658();
        }

        sub_100003600(101, v22, 0);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      int v24 = sub_100002D4C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_10002B2B0();
      }

      v10[2](v10, v13);
    }
    else
    {
      id v14 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v12 closeOnDealloc:1];
      if (v8)
      {
        uint64_t v52 = 0;
        NSURLResourceKey v53 = &v52;
        uint64_t v54 = 0x3032000000;
        v55 = sub_10001A3F8;
        v56 = sub_10001A408;
        id v57 = 0;
        uint64_t v48 = 0;
        id v49 = &v48;
        uint64_t v50 = 0x2020000000;
        char v51 = 0;
        id v15 = sub_10001CB30();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001BEC8;
        block[3] = &unk_100041508;
        int64_t v46 = &v48;
        id v44 = v14;
        id v45 = v8;
        __int16 v47 = &v52;
        dispatch_sync(v15, block);

        if (*((unsigned char *)v49 + 24))
        {
          unsigned int v16 = sub_100002D4C();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            sub_10002B584();
          }

          id v17 = sub_100002D4C();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            sub_10002B204();
          }

          int v18 = 0;
        }
        else
        {
          id v30 = sub_100002D4C();
          if (os_log_type_enabled(v30, (os_log_type_t)0x90u)) {
            sub_10002B518();
          }

          id v31 = sub_100002D4C();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            sub_10002B404();
          }

          int v18 = (void *)v53[5];
        }
        v10[2](v10, v18);

        _Block_object_dispose(&v48, 8);
      }
      else
      {
        unsigned int v25 = sub_100002D4C();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_10002B4E4();
        }

        uint64_t v52 = 0;
        NSURLResourceKey v53 = &v52;
        uint64_t v54 = 0x3032000000;
        v55 = sub_10001A3F8;
        v56 = sub_10001A408;
        id v57 = 0;
        uint64_t v26 = sub_10001CB30();
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10001BF7C;
        void v40[3] = &unk_100041530;
        id v41 = v14;
        id v42 = &v52;
        dispatch_sync(v26, v40);

        if (v53[5])
        {
          id v27 = sub_100002D4C();
          if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
            sub_10002B478();
          }

          id v28 = sub_100002D4C();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            sub_10002B404();
          }

          id v29 = (void *)v53[5];
        }
        else
        {
          id v32 = sub_100002D4C();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
            sub_10002B38C(v32, v33, v34, v35, v36, v37, v38, v39);
          }

          id v29 = 0;
        }
        v10[2](v10, v29);
      }
      _Block_object_dispose(&v52, 8);
    }
  }
  else
  {
    id v19 = sub_100002D4C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10002B27C();
    }

    int v20 = sub_100002D4C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_10002B204();
    }

    v10[2](v10, 0);
  }
}

- (void)readImportCookieDataForVolumeAtURL:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100002D4C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10002B8A8(v6, v8);
  }

  if (v6)
  {
    id v43 = 0;
    unsigned int v9 = [(GSClient *)self importCookieFileDescriptorForVolumeURL:v6 forWriting:0 error:&v43];
    id v10 = v43;
    id v11 = v10;
    if ((v9 & 0x80000000) != 0)
    {
      if ([v10 code] == (id)2
        && ([v11 domain],
            int v20 = objc_claimAutoreleasedReturnValue(),
            unsigned int v21 = [v20 isEqualToString:NSPOSIXErrorDomain],
            v20,
            v21))
      {
        id v22 = sub_100002D4C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_10002B678();
        }

        (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
      }
      else
      {
        id v23 = sub_100002D4C();
        if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
          sub_10002B324();
        }

        if (!v11)
        {
          int v24 = +[NSString stringWithFormat:@"Unknown error. See logs for more details."];
          unsigned int v25 = sub_100002D4C();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            sub_100028658();
          }

          id v11 = sub_100003600(101, v24, 0);
        }
        uint64_t v26 = sub_100002D4C();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          sub_10002B6F0();
        }

        (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v11);
      }
    }
    else
    {
      uint64_t v37 = 0;
      uint64_t v38 = &v37;
      uint64_t v39 = 0x3032000000;
      id v40 = sub_10001A3F8;
      id v41 = sub_10001A408;
      id v42 = 0;
      uint64_t v31 = 0;
      id v32 = &v31;
      uint64_t v33 = 0x3032000000;
      uint64_t v34 = sub_10001A3F8;
      uint64_t v35 = sub_10001A408;
      id v36 = 0;
      uint64_t v12 = sub_10001CB30();
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10001C4B4;
      v29[3] = &unk_100041558;
      unsigned int v30 = v9;
      void v29[4] = &v37;
      v29[5] = &v31;
      dispatch_sync(v12, v29);

      if (v38[5])
      {
        id v13 = sub_100002D4C();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = v38[5];
          id v15 = +[NSDate distantPast];
          sub_10002B828(v14, v15, buf, v13);
        }

        uint64_t v16 = v38[5];
        id v17 = +[NSDate distantPast];
        (*((void (**)(id, uint64_t, void *, void))v7 + 2))(v7, v16, v17, 0);
      }
      else
      {
        id v27 = sub_100002D4C();
        if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
          sub_10002B7F4();
        }

        id v28 = sub_100002D4C();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_10002B764();
        }

        (*((void (**)(id, void, void, uint64_t))v7 + 2))(v7, 0, 0, v32[5]);
      }
      _Block_object_dispose(&v31, 8);

      _Block_object_dispose(&v37, 8);
    }
  }
  else
  {
    int v18 = sub_100002D4C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10002B27C();
    }

    id v19 = sub_100002D4C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10002B678();
    }

    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
}

- (void)deleteImportCookieDataForVolumeAtURL:(id)a3 reply:(id)a4
{
  id v4 = (void (**)(id, id))a4;
  id v5 = +[NSFileManager defaultManager];
  id v6 = [v5 removeItemAtPath:@"/var/mobile/.DocumentRevisions-V100/fpfs_import_cookie" error:0];

  id v7 = sub_100002D4C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002B948((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }

  v4[2](v4, v6);
}

- (void)setAdditionConflictResolvedInStorage:(int64_t)a3 nameSpace:(id)a4 additionName:(id)a5 value:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void, id))a7;
  id v15 = sub_100002D4C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v38 = "-[GSClient setAdditionConflictResolvedInStorage:nameSpace:additionName:value:reply:]";
    __int16 v39 = 2048;
    int64_t v40 = a3;
    __int16 v41 = 2112;
    id v42 = v12;
    __int16 v43 = 2112;
    id v44 = v13;
    __int16 v45 = 1024;
    BOOL v46 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %s query(%lld, %@, %@, %hhd)", buf, 0x30u);
  }

  id v36 = 0;
  unsigned int v16 = [v13 validateGSName:&v36];
  id v17 = v36;
  if (!v16) {
    goto LABEL_13;
  }
  id v35 = 0;
  unsigned __int8 v18 = [v12 validateGSName:&v35];
  id v19 = v35;

  if ((v18 & 1) == 0)
  {
    id v17 = v19;
LABEL_13:
    id v27 = sub_100002D4C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_10002B9CC();
    }
    goto LABEL_15;
  }
  id v34 = 0;
  int v20 = [(GSClient *)self _getCachedVolPath:a3 error:&v34];
  id v17 = v34;

  if (!v20)
  {
    id v27 = sub_100002D4C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_10002B9CC();
    }
LABEL_15:

    v14[2](v14, 0, v17);
    goto LABEL_16;
  }
  unsigned int v21 = [v20 library];
  unsigned int v22 = [v21 isReadOnly];

  if (v22)
  {
    id v23 = +[NSString stringWithFormat:@"storage is read-only"];
    int v24 = sub_100002D4C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_100029A14();
    }

    uint64_t v25 = sub_100003600(111, v23, 0);

    uint64_t v26 = sub_100002D4C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_10002B9CC();
    }

    v14[2](v14, 0, (id)v25);
    id v17 = (id)v25;
  }
  else
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001C990;
    v28[3] = &unk_100041580;
    id v29 = v13;
    id v30 = v12;
    uint64_t v31 = self;
    BOOL v33 = v8;
    id v32 = v14;
    [v20 performOnResolvedPath:v28];
  }
LABEL_16:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_openHandleTx, 0);
  objc_storeStrong((id *)&self->_stagingPrefixes, 0);
  objc_storeStrong((id *)&self->_storageVolPaths, 0);
}

@end