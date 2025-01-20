@interface SnapshotService
- (BOOL)hasEnoughPixelsForRequest:(int64_t)a3;
- (SnapshotService)init;
- (id)_nextSnapshotRequest;
- (int64_t)pixelsForRequest:(id)a3;
- (void)_cleanupForRequest:(id)a3;
- (void)_startNextSnapshotterIfPossible:(id)a3;
- (void)cancelSnapshotForConnection:(id)a3;
- (void)requestIconWithStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 completionHandler:(id)a6;
- (void)requestSnapshotWithOptions:(id)a3 completionHandler:(id)a4;
@end

@implementation SnapshotService

- (SnapshotService)init
{
  v19.receiver = self;
  v19.super_class = (Class)SnapshotService;
  v2 = [(SnapshotService *)&v19 init];
  if (v2)
  {
    sub_100003F94();
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:5];
    connectionToSnapshotRequest = v2->_connectionToSnapshotRequest;
    v2->_connectionToSnapshotRequest = v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingSnapshotRequests = v2->_pendingSnapshotRequests;
    v2->_pendingSnapshotRequests = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    requestIdToSnapshotter = v2->_requestIdToSnapshotter;
    v2->_requestIdToSnapshotter = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    proccessIdToPendingSerialSnapshot = v2->_proccessIdToPendingSerialSnapshot;
    v2->_proccessIdToPendingSerialSnapshot = v11;

    v2->_requestCounter = 0;
    v2->_lastRequestPID = 0;
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(v13, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.MapKit.SnapshotService.homeQueue", v14);
    homeQueue = v2->_homeQueue;
    v2->_homeQueue = (OS_dispatch_queue *)v15;

    +[GEOMapService setShouldResolveAttribution:0];
    v17 = v2;
  }
  return v2;
}

- (int64_t)pixelsForRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 options];
  [v4 scale];
  double v6 = v5;
  v7 = [v3 options];
  [v7 size];
  double v9 = v6 * v8;
  v10 = [v3 options];

  [v10 size];
  int64_t v12 = llround(v9 * v11);

  return v12;
}

- (BOOL)hasEnoughPixelsForRequest:(int64_t)a3
{
  int64_t usedPixels = self->_usedPixels;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v5 = qword_10000CC80;
  uint64_t v12 = qword_10000CC80;
  if (!qword_10000CC80)
  {
    double v6 = (void *)sub_100003F94();
    v10[3] = (uint64_t)dlsym(v6, "MapKitConfig_SnapshotServiceMaxPixels");
    qword_10000CC80 = v10[3];
    uint64_t v5 = v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v5)
  {
    dlerror();
    double v8 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  return usedPixels + a3 <= GEOConfigGetInteger();
}

- (void)cancelSnapshotForConnection:(id)a3
{
  id v4 = a3;
  homeQueue = self->_homeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004628;
  v7[3] = &unk_1000083B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(homeQueue, v7);
}

- (id)_nextSnapshotRequest
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v3 = qword_10000CC78;
  uint64_t v27 = qword_10000CC78;
  if (!qword_10000CC78)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100004144;
    v29 = &unk_100008368;
    v30 = &v24;
    id v4 = (void *)sub_100003F94();
    uint64_t v5 = dlsym(v4, "MapKitConfig_SnapshotServicePerProcessSerializationEnabled");
    *(void *)(v30[1] + 24) = v5;
    qword_10000CC78 = *(void *)(v30[1] + 24);
    uint64_t v3 = v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v3)
  {
    dlerror();
    abort_report_np();
  }
  int BOOL = GEOConfigGetBOOL();
  pendingSnapshotRequests = self->_pendingSnapshotRequests;
  if (BOOL)
  {
    if ([(NSMutableArray *)pendingSnapshotRequests count])
    {
      uint64_t v8 = 0;
      while (1)
      {
        uint64_t v9 = [(NSMutableArray *)self->_pendingSnapshotRequests objectAtIndex:v8];
        v10 = [v9 options];
        unsigned int v11 = [v10 _snapshotServiceSerialPerProcess];

        if (!v11) {
          break;
        }
        proccessIdToPendingSerialSnapshot = self->_proccessIdToPendingSerialSnapshot;
        v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 processIdentifier]);
        v14 = [(NSMutableDictionary *)proccessIdToPendingSerialSnapshot objectForKey:v13];
        LOBYTE(proccessIdToPendingSerialSnapshot) = v14 == 0;

        if (proccessIdToPendingSerialSnapshot) {
          break;
        }
        dispatch_queue_t v15 = self->_proccessIdToPendingSerialSnapshot;
        v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 processIdentifier]);
        v17 = [(NSMutableDictionary *)v15 objectForKey:v16];
        id v18 = [v17 unsignedIntegerValue];

        objc_super v19 = sub_100003B2C();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = [v9 requestId];
          signed int v21 = [v9 processIdentifier];
          *(_DWORD *)buf = 134218496;
          *(void *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v21;
          *(_WORD *)&buf[22] = 2048;
          v29 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Skipping request %llu from process %llu due to per process serialization waiting on request %llu.", buf, 0x20u);
        }

        if (++v8 >= (unint64_t)[(NSMutableArray *)self->_pendingSnapshotRequests count]) {
          goto LABEL_12;
        }
      }
      id v22 = v9;
    }
    else
    {
LABEL_12:
      id v22 = 0;
    }
  }
  else
  {
    id v22 = [(NSMutableArray *)pendingSnapshotRequests firstObject];
  }

  return v22;
}

- (void)_cleanupForRequest:(id)a3
{
  id v4 = a3;
  self->_usedPixels -= [(SnapshotService *)self pixelsForRequest:v4];
  proccessIdToPendingSerialSnapshot = self->_proccessIdToPendingSerialSnapshot;
  id v6 = [v4 processIdentifier];

  id v7 = +[NSNumber numberWithInt:v6];
  [(NSMutableDictionary *)proccessIdToPendingSerialSnapshot removeObjectForKey:v7];
}

- (void)_startNextSnapshotterIfPossible:(id)a3
{
  id v49 = a3;
  [(NSLock *)self->_lock lock];
  if ([(NSMutableArray *)self->_pendingSnapshotRequests count])
  {
    while (1)
    {
      id v4 = [(NSMutableDictionary *)self->_requestIdToSnapshotter count];
      uint64_t v56 = 0;
      v57 = &v56;
      uint64_t v58 = 0x2020000000;
      uint64_t v5 = qword_10000CC70;
      uint64_t v59 = qword_10000CC70;
      if (!qword_10000CC70)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_1000040F4;
        *(void *)&unsigned char buf[24] = &unk_100008368;
        v61 = (void (*)(uint64_t))&v56;
        id v6 = (void *)sub_100003F94();
        id v7 = dlsym(v6, "MapKitConfig_SnapshotServiceQueueWidth");
        *(void *)(*((void *)v61 + 1) + 24) = v7;
        qword_10000CC70 = *(void *)(*((void *)v61 + 1) + 24);
        uint64_t v5 = v57[3];
      }
      _Block_object_dispose(&v56, 8);
      if (!v5)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }
      if ((unint64_t)v4 >= GEOConfigGetUInteger()) {
        goto LABEL_41;
      }
      uint64_t v8 = [(SnapshotService *)self _nextSnapshotRequest];
      if (!v8)
      {
        v43 = sub_100003B2C();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v44 = "All pending snapshots are waiting on other snapshots to complete trying again as soon as the current sna"
                "pshot(s) are finished.";
          v45 = v43;
          os_log_type_t v46 = OS_LOG_TYPE_INFO;
          uint32_t v47 = 2;
          goto LABEL_39;
        }
LABEL_40:

        goto LABEL_41;
      }
      int64_t v9 = [(SnapshotService *)self pixelsForRequest:v8];
      if ([(NSMutableDictionary *)self->_requestIdToSnapshotter count]
        && ![(SnapshotService *)self hasEnoughPixelsForRequest:v9])
      {
        v43 = sub_100003B2C();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v48 = [v8 requestId];
          *(_DWORD *)buf = 134349056;
          *(void *)&buf[4] = v48;
          v44 = "Not enough memory to take snapshot for request %{public}llu. Trying again as soon as the current snapsho"
                "t(s) are finished.";
          v45 = v43;
          os_log_type_t v46 = OS_LOG_TYPE_ERROR;
          uint32_t v47 = 12;
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, v45, v46, v44, buf, v47);
        }
        goto LABEL_40;
      }
      v10 = sub_100003B2C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [v8 requestId];
        unsigned int v12 = [v8 processIdentifier];
        *(_DWORD *)buf = 134349312;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Starting snapshot request %{public}llu for process %d", buf, 0x12u);
      }

      [(NSMutableArray *)self->_pendingSnapshotRequests removeObject:v8];
      self->_lastRequestPID = [v8 processIdentifier];
      self->_usedPixels += v9;
      proccessIdToPendingSerialSnapshot = self->_proccessIdToPendingSerialSnapshot;
      v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 requestId]);
      dispatch_queue_t v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 processIdentifier]);
      [(NSMutableDictionary *)proccessIdToPendingSerialSnapshot setObject:v14 forKey:v15];

      v16 = [v8 completionHandler];
      v17 = [v8 connection];
      id v18 = [v8 options];
      objc_super v19 = [v18 _auditToken];

      if (!v19) {
        goto LABEL_17;
      }
      id v20 = [v17 valueForEntitlement:@"com.apple.private.network.socket-delegate"];
      signed int v21 = v20;
      if (!v20 || ([v20 BOOLValue] & 1) == 0) {
        break;
      }
      id v22 = [v8 options];
      id v23 = [v22 _auditToken];

      if (!v23) {
        goto LABEL_17;
      }
LABEL_20:
      id v25 = objc_alloc((Class)VKMapSnapshotCreator);
      uint64_t v26 = [v8 options];
      id v27 = [v25 initWithSnapshotOptions:v26 homeQueue:self->_homeQueue auditToken:v23];

      if (v27)
      {
        v28 = [v8 options];
        v29 = [v28 _customFeatureAnnotations];
        BOOL v30 = [v29 count] == 0;

        if (!v30)
        {
          id v31 = objc_alloc_init(NSClassFromString(@"_MKCustomFeatureStore"));
          v32 = [v8 options];
          v33 = [v32 _customFeatureAnnotations];
          [v31 addAnnotations:v33];

          [v27 addCustomFeatureDataSource:v31];
        }
        v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 requestId]);
        [(NSMutableDictionary *)self->_requestIdToSnapshotter setObject:v27 forKey:v34];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        *(void *)&unsigned char buf[24] = sub_1000054B4;
        v61 = sub_1000054C4;
        id v62 = v27;
        [v62 setClearFontCache:1];
        v35 = *(void **)(*(void *)&buf[8] + 40);
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_1000054CC;
        v50[3] = &unk_1000083E0;
        v50[4] = self;
        id v51 = v17;
        id v36 = v34;
        id v52 = v36;
        id v53 = v8;
        v55 = buf;
        v54 = v16;
        [v35 renderSnapshot:v50];

        _Block_object_dispose(buf, 8);
      }
      else
      {
        v37 = sub_100003B2C();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "Invalid MKMapSnapshotOptions", buf, 2u);
        }

        if (v16)
        {
          v38 = [v8 options];
          v39 = +[NSString stringWithFormat:@"Invalid MKMapSnapshotOptions: %@.", v38];

          v40 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v39;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }

          NSErrorUserInfoKey v63 = NSLocalizedFailureReasonErrorKey;
          v64 = v39;
          v41 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
          v42 = +[NSError errorWithDomain:@"MKErrorDomain" code:1 userInfo:v41];
          ((void (**)(void, void, void *))v16)[2](v16, 0, v42);
          if (v17) {
            [(NSMapTable *)self->_connectionToSnapshotRequest removeObjectForKey:v17];
          }
        }
        [(SnapshotService *)self _cleanupForRequest:v8];
      }

      if (![(NSMutableArray *)self->_pendingSnapshotRequests count]) {
        goto LABEL_41;
      }
    }

LABEL_17:
    memset(buf, 0, sizeof(buf));
    if (v17) {
      [v17 auditToken];
    }
    uint64_t v24 = +[NSData dataWithBytes:buf length:32];
    id v23 = [objc_alloc((Class)GEOApplicationAuditToken) initWithAuditTokenData:v24];

    goto LABEL_20;
  }
LABEL_41:
  [(NSLock *)self->_lock unlock];
}

- (void)requestSnapshotWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100003B2C();
  int64_t v9 = (char *)[v6 signpostId];
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = (os_signpost_id_t)v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "RequestSnapshotWithOptions", (const char *)&unk_100007C07, buf, 2u);
    }
  }

  id v11 = +[NSXPCConnection currentConnection];
  homeQueue = self->_homeQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000058F8;
  v16[3] = &unk_100008408;
  v16[4] = self;
  id v17 = v11;
  id v18 = v6;
  id v19 = v7;
  id v13 = v7;
  id v14 = v6;
  id v15 = v11;
  dispatch_async(homeQueue, v16);
}

- (void)requestIconWithStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 completionHandler:(id)a6
{
  id v9 = a3;
  os_signpost_id_t v10 = (void (**)(id, id))a6;
  if (v10)
  {
    id v11 = objc_alloc_init((Class)VKIconManager);
    id v13 = v11;
    if (a4 > 5) {
      uint64_t v14 = 5;
    }
    else {
      uint64_t v14 = qword_100006CA8[a4];
    }
    *(float *)&double v12 = a5;
    id v15 = [v11 imageForStyleAttributes:v9 withStylesheetName:@"default-search" contentScale:v14 sizeGroup:0 modifiers:v12];
    v16 = v15;
    if (v15)
    {
      id v17 = CGImageRetain((CGImageRef)[v15 image]);
      if (v17)
      {
        uint64_t v24 = 0;
        id v25 = &v24;
        uint64_t v26 = 0x2050000000;
        id v18 = (void *)qword_10000CC88;
        uint64_t v27 = qword_10000CC88;
        if (!qword_10000CC88)
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_100005CF8;
          v23[3] = &unk_100008368;
          v23[4] = &v24;
          sub_100005CF8((uint64_t)v23);
          id v18 = (void *)v25[3];
        }
        id v19 = v18;
        _Block_object_dispose(&v24, 8);
        id v20 = [v19 alloc];
        [v16 contentScale];
        id v22 = [v20 initWithCGImage:v17 scale:0 orientation:v21];
      }
      else
      {
        id v22 = 0;
      }
      CGImageRelease(v17);
      v10[2](v10, v22);
    }
    else
    {
      v10[2](v10, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proccessIdToPendingSerialSnapshot, 0);
  objc_storeStrong((id *)&self->_homeQueue, 0);
  objc_storeStrong((id *)&self->_requestIdToSnapshotter, 0);
  objc_storeStrong((id *)&self->_pendingSnapshotRequests, 0);
  objc_storeStrong((id *)&self->_connectionToSnapshotRequest, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end