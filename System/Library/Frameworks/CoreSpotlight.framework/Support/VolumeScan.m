@interface VolumeScan
+ (id)mountServiceClient;
+ (id)volumeNames;
- (BOOL)buildCheckOIDs:(unint64_t *)a3 oidCount:(unint64_t)a4 accessDenied:(char *)a5 canceled:(BOOL *)a6;
- (LiveFSVolumeClient)serviceClient;
- (LiveFSVolumeCore)volumeSyncConnection;
- (NSDate)lastMTime;
- (NSDate)mountTime;
- (NSString)rootFileHandle;
- (NSString)rootPath;
- (NSString)uuidString;
- (NSString)volumeUUID;
- (NSXPCConnection)volumeAsyncConnection;
- (NSXPCListenerEndpoint)volumeListenerEndpoint;
- (OS_dispatch_queue)liveItemQueue;
- (VolumeScan)initWithVolumeUUID:(id)a3 rootPath:(id)a4;
- (char)pathFromOID:(unint64_t)a3 pathBuffer:(char *)a4 pathBufferSize:(unint64_t)a5 fullPath:(BOOL)a6 error:(int *)a7;
- (const)rootPathUTF8String;
- (id)bulkResolveOIDData:(id)a3 error:(int *)a4;
- (id)bulkResolveOIDs:(unint64_t *)a3 oidCount:(unint64_t)a4 error:(int *)a5;
- (id)identifierForItem:(unint64_t)a3 name:(id)a4 parentID:(unint64_t)a5;
- (id)processQueryScopes:(id)a3 usePersistentFileIDs:(BOOL)a4;
- (id)resolveLiveFSHandleForPathFromMountPoint:(const char *)a3;
- (id)scanAtLiveFSHandle:(id)a3 pathFromMountPoint:(id)a4 date:(id)a5 itemHandler:(id)a6 completionHandler:(id)a7;
- (id)scanAtLiveFSHandle:(id)a3 pathFromMountPoint:(id)a4 withCriteria:(id)a5 itemHandler:(id)a6 completionHandler:(id)a7;
- (unint64_t)parentFromOID:(unint64_t)a3 error:(int *)a4;
- (unint64_t)rootPathUTF8StringLength;
- (unsigned)oidPath:(unint64_t *)a3 fromOID:(unint64_t)a4 includeLeaf:(BOOL)a5 error:(int *)a6;
- (void)cancelWithToken:(id)a3;
- (void)dealloc;
- (void)setLiveItemQueue:(id)a3;
- (void)setRootFileHandle:(id)a3;
- (void)setRootPath:(id)a3;
- (void)setServiceClient:(id)a3;
- (void)setUuidString:(id)a3;
- (void)setVolumeAsyncConnection:(id)a3;
- (void)setVolumeListenerEndpoint:(id)a3;
- (void)setVolumeSyncConnection:(id)a3;
@end

@implementation VolumeScan

+ (id)mountServiceClient
{
  return +[VolumeUSBLocalStorageClient sharedLocalStorageClient];
}

+ (id)volumeNames
{
  v2 = +[VolumeScan mountServiceClient];
  v3 = [v2 volumes:0];
  v4 = [v3 allKeys];

  return v4;
}

- (void)dealloc
{
  free((void *)self->_rootPathUTF8String);
  v3.receiver = self;
  v3.super_class = (Class)VolumeScan;
  [(VolumeScan *)&v3 dealloc];
}

- (VolumeScan)initWithVolumeUUID:(id)a3 rootPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v74.receiver = self;
  v74.super_class = (Class)VolumeScan;
  v9 = [(VolumeScan *)&v74 init];
  v10 = v9;
  if (!v9)
  {
    v20 = 0;
    goto LABEL_29;
  }
  if (v7)
  {
    objc_storeStrong((id *)&v9->_volumeUUID, a3);
    v11 = +[VolumeScan mountServiceClient];
    if (!v11) {
      goto LABEL_25;
    }
    uint64_t v12 = objc_opt_new();
    serviceClient = v10->_serviceClient;
    v10->_serviceClient = (LiveFSVolumeClient *)v12;

    if (!v10->_serviceClient) {
      goto LABEL_25;
    }
    int v15 = 0;
    *(void *)&long long v14 = 67109890;
    long long v43 = v14;
    while (1)
    {
      id v73 = 0;
      uint64_t v16 = -[VolumeScan listenerForVolume:error:](v11, "listenerForVolume:error:", v7, &v73, v43);
      id v17 = v73;
      volumeListenerEndpoint = v10->_volumeListenerEndpoint;
      v10->_volumeListenerEndpoint = (NSXPCListenerEndpoint *)v16;

      if (v10->_volumeListenerEndpoint) {
        break;
      }
      v19 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v43;
        *(_DWORD *)&buf[4] = v15;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v7;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v17;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "listenerForVolume(%d) %@ error %@ from %@", buf, 0x26u);
      }

      if ([v17 code] != (id)35) {
        break;
      }
      sleep(1u);

      if (++v15 == 10) {
        goto LABEL_15;
      }
    }

LABEL_15:
    if (v10->_volumeListenerEndpoint)
    {
      v21 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v10->_volumeListenerEndpoint];
      volumeAsyncConnection = v10->_volumeAsyncConnection;
      v10->_volumeAsyncConnection = v21;

      v20 = (VolumeScan *)v10->_volumeAsyncConnection;
      if (v20)
      {
        v23 = +[LiveFSClient interfaceForListeners];
        [(VolumeScan *)v20 setRemoteObjectInterface:v23];

        v24 = v10->_volumeAsyncConnection;
        v25 = +[LiveFSVolumeClient exportedClientInterface];
        [(NSXPCConnection *)v24 setExportedInterface:v25];

        [(NSXPCConnection *)v10->_volumeAsyncConnection setExportedObject:v10->_serviceClient];
        [(NSXPCConnection *)v10->_volumeAsyncConnection resume];
        v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v27 = dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_UNSPECIFIED, 0);
        dispatch_queue_t v28 = dispatch_queue_create("com.apple.spotlight.liveitem.queue", v27);
        liveItemQueue = v10->_liveItemQueue;
        v10->_liveItemQueue = (OS_dispatch_queue *)v28;

        v20 = [(NSXPCConnection *)v10->_volumeAsyncConnection synchronousRemoteObjectProxyWithErrorHandler:&stru_100035A68];
        if (v20)
        {
          objc_storeStrong((id *)&v10->_volumeSyncConnection, v20);
          if (v8)
          {
            objc_storeStrong((id *)&v10->_rootPath, a4);
            v30 = strdup((const char *)[v8 UTF8String]);
            v10->_rootPathUTF8String = v30;
            v10->_rootPathUTF8StringLength = strlen(v30);
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          *(void *)&buf[24] = sub_10001EE18;
          *(void *)&buf[32] = sub_10001EE28;
          id v76 = 0;
          v31 = v10->_liveItemQueue;
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_10001EFE8;
          v70[3] = &unk_100035AB8;
          v32 = v20;
          v71 = v32;
          v72 = buf;
          sub_10001EE30((uint64_t)"rootHandle", v31, v70);
          objc_storeStrong((id *)&v10->_rootFileHandle, *(id *)(*(void *)&buf[8] + 40));
          uint64_t v64 = 0;
          v65 = &v64;
          uint64_t v66 = 0x3032000000;
          v67 = sub_10001EE18;
          v68 = sub_10001EE28;
          id v69 = 0;
          v33 = v10->_liveItemQueue;
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = sub_10001F114;
          v60[3] = &unk_100035B08;
          v34 = v32;
          v61 = v34;
          v62 = buf;
          v63 = &v64;
          sub_10001EE30((uint64_t)"uuid", v33, v60);
          objc_storeStrong((id *)&v10->_uuidString, (id)v65[5]);
          uint64_t v56 = 0;
          v57 = &v56;
          uint64_t v58 = 0x2020000000;
          uint64_t v59 = 0;
          v35 = v10->_liveItemQueue;
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_10001F2CC;
          v52[3] = &unk_100035B08;
          v36 = v34;
          v53 = v36;
          v54 = buf;
          v55 = &v56;
          sub_10001EE30((uint64_t)"mount time", v35, v52);
          uint64_t v37 = v57[3];
          if (v37) {
            v10->_mountTime = (NSDate *)+[NSDate dateWithTimeIntervalSince1970:(double)v37];
          }
          uint64_t v48 = 0;
          v49 = &v48;
          uint64_t v50 = 0x2020000000;
          uint64_t v51 = 0;
          v38 = v10->_liveItemQueue;
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_10001F44C;
          v44[3] = &unk_100035B08;
          v39 = v36;
          v45 = v39;
          v46 = buf;
          v47 = &v48;
          sub_10001EE30((uint64_t)"last mount time", v38, v44);
          uint64_t v40 = v49[3];
          if (v40) {
            v10->_lastMTime = (NSDate *)+[NSDate dateWithTimeIntervalSince1970:(double)v40];
          }

          _Block_object_dispose(&v48, 8);
          _Block_object_dispose(&v56, 8);

          _Block_object_dispose(&v64, 8);
          _Block_object_dispose(buf, 8);

          v20 = v10;
          goto LABEL_27;
        }
      }
    }
    else
    {
LABEL_25:
      v20 = 0;
    }
    v39 = v11;
    v11 = v10;
LABEL_27:

    v10 = v11;
    goto LABEL_28;
  }
  v20 = 0;
LABEL_28:

LABEL_29:
  v41 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v20;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "VolumeScan %@", buf, 0xCu);
  }

  return v20;
}

- (id)resolveLiveFSHandleForPathFromMountPoint:(const char *)a3
{
  rootFileHandle = self->_rootFileHandle;
  if (!rootFileHandle) {
    goto LABEL_5;
  }
  if (a3 && (size_t v6 = strlen(a3)) != 0)
  {
    size_t v7 = v6;
    if (v6 > 0x3FF)
    {
LABEL_5:
      id v8 = 0;
      goto LABEL_20;
    }
    v9 = self->_volumeSyncConnection;
    v29[1] = v29;
    size_t v10 = v7 + 1;
    v11 = (char *)v29 - ((v7 + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v11, v10);
    memcpy(v11, a3, v10);
    uint64_t v12 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100026AA8((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
    }

    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    int v44 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = sub_10001EE18;
    v39 = sub_10001EE28;
    uint64_t v40 = 0;
    v19 = 0;
    uint64_t v40 = self->_rootFileHandle;
    while (1)
    {
      v20 = strchr(v11, 47);
      v21 = v20;
      if (v20)
      {
        char *v20 = 0;
        v21 = v20 + 1;
      }
      v22 = +[NSString stringWithUTF8String:v11];
      liveItemQueue = self->_liveItemQueue;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10001F894;
      v30[3] = &unk_100035B58;
      v24 = v9;
      v31 = v24;
      v33 = &v35;
      id v25 = v22;
      id v32 = v25;
      v34 = &v41;
      sub_10001EE30((uint64_t)"lookup", liveItemQueue, v30);
      if (!v21)
      {
        id v26 = (id)v36[5];

        v19 = v26;
      }

      if (*((_DWORD *)v42 + 6)) {
        break;
      }
      if (v21)
      {
        v11 = v21;
        if (v36[5]) {
          continue;
        }
      }
      v27 = v19;
      goto LABEL_19;
    }
    v27 = 0;
LABEL_19:
    id v8 = v27;
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    id v8 = rootFileHandle;
  }
LABEL_20:

  return v8;
}

- (id)scanAtLiveFSHandle:(id)a3 pathFromMountPoint:(id)a4 withCriteria:(id)a5 itemHandler:(id)a6 completionHandler:(id)a7
{
  uint64_t v12 = (NSString *)a3;
  id v13 = a4;
  id v33 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12) {
    goto LABEL_4;
  }
  uint64_t v12 = self->_rootFileHandle;

  if (v12)
  {
    id v13 = 0;
LABEL_4:
    uint64_t v16 = [(VolumeScan *)self rootPath];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10001FDD4;
    v42[3] = &unk_100035B80;
    id v17 = v13;
    id v43 = v17;
    id v18 = v16;
    id v44 = v18;
    id v32 = v14;
    id v45 = v14;
    v19 = objc_retainBlock(v42);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000200CC;
    v40[3] = &unk_100035630;
    id v41 = v15;
    v20 = objc_retainBlock(v40);
    uint64_t add = atomic_fetch_add(&dword_10003CC80, 1u);
    uint64_t v22 = getpid();
    v23 = objc_msgSend(@"scan", "stringByAppendingFormat:", @"%d-%d-%u", v22, add, CFAbsoluteTimeGetCurrent());
    [(LiveFSVolumeClient *)self->_serviceClient LISCAddSearchHandlers:v23 resultHandler:v19 completionHandler:v20];
    v24 = self->_volumeSyncConnection;
    liveItemQueue = self->_liveItemQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100020194;
    v34[3] = &unk_100035BD0;
    id v26 = v24;
    uint64_t v35 = v26;
    v27 = v12;
    v36 = v27;
    id v28 = v23;
    id v37 = v28;
    id v38 = v33;
    v39 = self;
    sub_10001EE30((uint64_t)"search", liveItemQueue, v34);
    v29 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "LISearch starting: %@", buf, 0xCu);
    }

    id v30 = v28;
    id v14 = v32;
    goto LABEL_7;
  }
  if (v15) {
    (*((void (**)(id, uint64_t))v15 + 2))(v15, 2);
  }
  v27 = 0;
  id v30 = 0;
LABEL_7:

  return v30;
}

- (id)scanAtLiveFSHandle:(id)a3 pathFromMountPoint:(id)a4 date:(id)a5 itemHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  v29[0] = LISearchObjTypeReturnAll;
  v24[0] = &__kCFBooleanTrue;
  v29[1] = LISearchObjXattrsToReturn;
  v23[0] = off_10003CCA0;
  v23[1] = off_10003CC90;
  uint64_t v17 = 2;
  v24[1] = +[NSArray arrayWithObjects:v23 count:2];
  if (v14)
  {
    *(void *)&long long v30 = LISearchObjModifiedAfter;
    *(void *)&long long v25 = v14;
    uint64_t v17 = 3;
  }
  id v18 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v29 count:v17];
  v19 = [(VolumeScan *)self scanAtLiveFSHandle:v12 pathFromMountPoint:v13 withCriteria:v18 itemHandler:v15 completionHandler:v16];

  for (uint64_t i = 9; i != -1; --i)
  for (uint64_t j = 9; j != -1; --j)

  return v19;
}

- (void)cancelWithToken:(id)a3
{
  id v4 = a3;
  v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "start cancelWithToken: %@", buf, 0xCu);
  }

  liveItemQueue = self->_liveItemQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002066C;
  v8[3] = &unk_1000356A8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(liveItemQueue, v8);
}

- (id)bulkResolveOIDData:(id)a3 error:(int *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = sub_10001EE18;
  long long v26 = sub_10001EE28;
  id v27 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  id v7 = self->_volumeSyncConnection;
  liveItemQueue = self->_liveItemQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002097C;
  v13[3] = &unk_100035C48;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  id v16 = &v18;
  uint64_t v17 = &v22;
  sub_10001EE30((uint64_t)"resolve", liveItemQueue, v13);
  if (a4) {
    *a4 = *((_DWORD *)v19 + 6);
  }
  id v11 = (id)v23[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v11;
}

- (id)bulkResolveOIDs:(unint64_t *)a3 oidCount:(unint64_t)a4 error:(int *)a5
{
  id v7 = +[NSData dataWithBytes:a3 length:8 * a4];
  id v8 = [(VolumeScan *)self bulkResolveOIDData:v7 error:a5];

  return v8;
}

- (BOOL)buildCheckOIDs:(unint64_t *)a3 oidCount:(unint64_t)a4 accessDenied:(char *)a5 canceled:(BOOL *)a6
{
  size_t v8 = a4;
  id v9 = a3;
  int v18 = 0;
  id v11 = +[NSData dataWithBytes:a3 length:8 * a4];
  id v12 = [(VolumeScan *)self bulkResolveOIDData:v11 error:&v18];
  BOOL v13 = 0;
  if (!v18)
  {
    if (a6 && *a6)
    {
      memset(a5, 1, v8);
      BOOL v13 = 0;
    }
    else
    {
      for (; v8; --v8)
      {
        bzero(v19, 0x400uLL);
        uint64_t v14 = *v9++;
        id v15 = sub_100023540(v12, v14, (unint64_t)v19, 0, 0);
        if (sub_100022A8C((uint64_t)v15)) {
          char v16 = 0;
        }
        else {
          char v16 = 2;
        }
        *a5++ = v16;
      }
      BOOL v13 = 1;
    }
  }

  return v13;
}

- (unint64_t)parentFromOID:(unint64_t)a3 error:(int *)a4
{
  unint64_t v13 = a3;
  int v12 = 0;
  v5 = [(VolumeScan *)self bulkResolveOIDs:&v13 oidCount:1 error:&v12];
  if (v12)
  {
    unint64_t v6 = 0;
    if (a4) {
LABEL_3:
    }
      *a4 = v12;
  }
  else
  {
    size_t v8 = +[NSNumber numberWithUnsignedLongLong:v13];
    id v9 = [v5 objectForKeyedSubscript:v8];

    if (v9)
    {
      int v12 = 22;
      id v10 = [v9 objectForKeyedSubscript:@"attributes"];
      if ([v10 length]
        && (id v11 = [v10 bytes]) != 0
        && (~*((_DWORD *)v11 + 2) & 0x300) == 0
        && v11[8] == v13)
      {
        unint64_t v6 = v11[9];
        int v12 = 0;
      }
      else
      {
        unint64_t v6 = 0;
      }
    }
    else
    {
      unint64_t v6 = 0;
      int v12 = 2;
    }

    if (a4) {
      goto LABEL_3;
    }
  }

  return v6;
}

- (unsigned)oidPath:(unint64_t *)a3 fromOID:(unint64_t)a4 includeLeaf:(BOOL)a5 error:(int *)a6
{
  unint64_t v7 = a5;
  unint64_t v14 = a4;
  int v13 = 0;
  id v9 = [(VolumeScan *)self bulkResolveOIDs:&v14 oidCount:1 error:&v13];
  id v10 = v9;
  unsigned int v11 = 0;
  if (!v13)
  {
    unsigned int v11 = sub_10002371C(v9, v14, a3, v7, &v13);
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a6) {
LABEL_3:
  }
    *a6 = v13;
LABEL_4:

  return v11;
}

- (char)pathFromOID:(unint64_t)a3 pathBuffer:(char *)a4 pathBufferSize:(unint64_t)a5 fullPath:(BOOL)a6 error:(int *)a7
{
  unint64_t v19 = a3;
  int v18 = 0;
  if (a4 && a5 > 0x3FF)
  {
    BOOL v8 = a6;
    unsigned int v11 = [(VolumeScan *)self bulkResolveOIDs:&v19 oidCount:1 error:&v18];
    int v12 = v11;
    if (v18)
    {
      int v13 = 0;
    }
    else
    {
      if (v8)
      {
        rootPathUTF8String = (char *)self->_rootPathUTF8String;
        size_t rootPathUTF8StringLength = self->_rootPathUTF8StringLength;
        char v16 = a4;
      }
      else
      {
        char v16 = a4;
        rootPathUTF8String = 0;
        size_t rootPathUTF8StringLength = 0;
      }
      int v13 = sub_100023540(v11, v19, (unint64_t)v16, rootPathUTF8String, rootPathUTF8StringLength);
      if (!v13) {
        int v18 = 2;
      }
    }
    if (a7) {
      *a7 = v18;
    }
  }
  else
  {
    int v13 = 0;
    if (a7) {
      *a7 = 22;
    }
  }
  return v13;
}

- (id)identifierForItem:(unint64_t)a3 name:(id)a4 parentID:(unint64_t)a5
{
  id v8 = a4;
  if (a3 != 2 && !a5)
  {
    int v12 = 0;
    unint64_t v9 = [(VolumeScan *)self parentFromOID:a3 error:&v12];
    if (v12)
    {
      id v10 = 0;
      goto LABEL_7;
    }
    a5 = v9;
  }
  id v10 = +[LiveFSIDHelper identifierForItem:a3 name:v8 parentID:a5];
LABEL_7:

  return v10;
}

- (id)processQueryScopes:(id)a3 usePersistentFileIDs:(BOOL)a4
{
  BOOL v38 = a4;
  id v5 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (!v6)
  {
    v39 = 0;
    id v8 = 0;
    goto LABEL_53;
  }
  id v7 = v6;
  v39 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v42;
  id v40 = v5;
  do
  {
    for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v42 != v9) {
        objc_enumerationMutation(v5);
      }
      unsigned int v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      id v12 = [v11 length];
      if (v12)
      {
        unint64_t v13 = (unint64_t)v12;
        if ([v11 characterAtIndex:0] == 47)
        {
          if (v13 > [(NSString *)self->_rootPath length])
          {
            if ([v11 hasPrefix:self->_rootPath])
            {
              unint64_t v14 = v11;
              if (v14)
              {
LABEL_11:
                id v15 = self;
                char v16 = v8;
                uint64_t v17 = v14;
                int v18 = (const char *)[v17 UTF8String];
                memset(&v47, 0, sizeof(v47));
                int v19 = stat(v18, &v47);
                uint64_t v20 = logForCSLogCategoryDefault();
                int v21 = v20;
                if (v19)
                {
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  {
                    int v32 = *__error();
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v46 = v32;
                    *(_WORD *)&v46[4] = 2080;
                    *(void *)&v46[6] = v18;
                    *(_WORD *)&v46[14] = 2112;
                    *(void *)&v46[16] = v11;
                    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "error %d resolving query scope %s from %@", buf, 0x1Cu);
                  }

                  id v8 = v16;
                }
                else
                {
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)v46 = v18;
                    *(_WORD *)&v46[8] = 2112;
                    *(void *)&v46[10] = v11;
                    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Adding Query Path: %s from: %@", buf, 0x16u);
                  }

                  id v8 = v16;
                  if (v39)
                  {
                    [v39 addObject:v17];
                  }
                  else
                  {
                    v39 = +[NSMutableSet setWithObject:v17];
                  }
                }
                self = v15;
                id v5 = v40;
LABEL_48:

                continue;
              }
            }
          }
LABEL_46:
          uint64_t v17 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v47.st_dev = 138412290;
            *(void *)&v47.st_mode = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not resolve query scope %@", (uint8_t *)&v47, 0xCu);
          }
          goto LABEL_48;
        }
        if (![v11 hasPrefix:@"com.apple.filesystems.UserFS.FileProvider:"]) {
          goto LABEL_46;
        }
        id v22 = [v11 rangeOfString:@":"];
        if (v22 == (id)0x7FFFFFFFFFFFFFFFLL || (unint64_t)v22 + v23 >= v13) {
          goto LABEL_46;
        }
        uint64_t v17 = objc_msgSend(v11, "substringFromIndex:");
        if ([v17 hasPrefix:@"__fp"])
        {
          if (!v8)
          {
            long long v25 = [(NSString *)self->_volumeUUID dataUsingEncoding:4];
            long long v26 = [v25 base64EncodedStringWithOptions:0];
            id v8 = [@"__fp" stringByAppendingPathComponent:v26];
          }
          id v27 = (char *)[v17 length];
          if (v27 < (char *)[v8 length] + 1
            || ![v17 hasPrefix:v8])
          {
            goto LABEL_48;
          }
          uint64_t v28 = -[NSObject substringFromIndex:](v17, "substringFromIndex:", (char *)[v8 length] + 1);

          uint64_t v17 = v28;
        }
        if (v38)
        {
          if ([v17 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"])
          {
            unint64_t v14 = self->_rootPath;
            if (!v14) {
              goto LABEL_44;
            }
LABEL_45:

            if (v14) {
              goto LABEL_11;
            }
            goto LABEL_46;
          }
          if ((unint64_t)[v17 length] >= 0xD)
          {
            id v37 = [v17 substringToIndex:12];
            id v29 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v37 options:0];
            long long v30 = v29;
            if (v29)
            {
              unint64_t v14 = *(NSString **)[v29 bytes];
              if (v14)
              {
                bzero(&v47, 0x400uLL);
                *(_DWORD *)buf = 0;
                long long v31 = [(VolumeScan *)self pathFromOID:v14 pathBuffer:&v47 pathBufferSize:1024 fullPath:1 error:buf];
                unint64_t v14 = 0;
                if (!*(_DWORD *)buf)
                {
                  if (v31)
                  {
                    v36 = +[NSString stringWithUTF8String:v31];
                    uint64_t v35 = [v17 substringFromIndex:12];
                    unint64_t v14 = [v36 stringByAppendingPathComponent:v35];
                  }
                }
              }
            }
            else
            {
              unint64_t v14 = 0;
            }

            if (v14) {
              goto LABEL_45;
            }
          }
        }
LABEL_44:
        unint64_t v14 = [(NSString *)self->_rootPath stringByAppendingFormat:@"/%@", v17];
        goto LABEL_45;
      }
    }
    id v7 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
  }
  while (v7);
LABEL_53:
  long long v33 = [v39 allObjects];

  return v33;
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSString)volumeUUID
{
  return self->_volumeUUID;
}

- (const)rootPathUTF8String
{
  return self->_rootPathUTF8String;
}

- (NSDate)mountTime
{
  return self->_mountTime;
}

- (NSDate)lastMTime
{
  return self->_lastMTime;
}

- (unint64_t)rootPathUTF8StringLength
{
  return self->_rootPathUTF8StringLength;
}

- (NSXPCListenerEndpoint)volumeListenerEndpoint
{
  return self->_volumeListenerEndpoint;
}

- (void)setVolumeListenerEndpoint:(id)a3
{
}

- (NSXPCConnection)volumeAsyncConnection
{
  return self->_volumeAsyncConnection;
}

- (void)setVolumeAsyncConnection:(id)a3
{
}

- (LiveFSVolumeClient)serviceClient
{
  return self->_serviceClient;
}

- (void)setServiceClient:(id)a3
{
}

- (LiveFSVolumeCore)volumeSyncConnection
{
  return self->_volumeSyncConnection;
}

- (void)setVolumeSyncConnection:(id)a3
{
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
}

- (NSString)rootFileHandle
{
  return self->_rootFileHandle;
}

- (void)setRootFileHandle:(id)a3
{
}

- (OS_dispatch_queue)liveItemQueue
{
  return self->_liveItemQueue;
}

- (void)setLiveItemQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveItemQueue, 0);
  objc_storeStrong((id *)&self->_rootFileHandle, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_volumeSyncConnection, 0);
  objc_storeStrong((id *)&self->_serviceClient, 0);
  objc_storeStrong((id *)&self->_volumeAsyncConnection, 0);
  objc_storeStrong((id *)&self->_volumeListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_volumeUUID, 0);

  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end