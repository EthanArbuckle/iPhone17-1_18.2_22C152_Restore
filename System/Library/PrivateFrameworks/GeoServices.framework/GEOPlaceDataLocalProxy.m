@interface GEOPlaceDataLocalProxy
+ (GEOPlaceDataLocalProxy)shared;
- (GEOPlaceDataLocalProxy)init;
- (id)pdPlaceCache;
- (id)serviceRequester;
- (unint64_t)calculateFreeableSpaceSync;
- (unint64_t)shrinkBySizeSync:(unint64_t)a3;
- (void)_callHistoryRecentsClearedObserver:(id)a3;
- (void)_cleanupPendingRequestMananger;
- (void)_privacyAndLocationSettingsResetObserver:(id)a3;
- (void)_requestIdentifiersFromNetwork:(id)a3 resultProviderID:(int)a4 requestUUID:(id)a5 traits:(id)a6 auditToken:(id)a7 throttleToken:(id)a8 finished:(id)a9 error:(id)a10;
- (void)_resetRequestTimeout;
- (void)calculateFreeableSpaceWithHandler:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)clearCache;
- (void)dealloc;
- (void)fetchAllCacheEntriesWithRequesterHandler:(id)a3;
- (void)performPlaceDataRequest:(id)a3 requestUUID:(id)a4 traits:(id)a5 cachePolicy:(unint64_t)a6 timeout:(double)a7 auditToken:(id)a8 throttleToken:(id)a9 requesterHandler:(id)a10;
- (void)registerCacheResult:(unsigned __int8)a3 forMapItem:(id)a4 cachedByteCount:(unint64_t)a5 forRequestType:(int)a6 auditToken:(id)a7;
- (void)requestIdentifiers:(id)a3 resultProviderID:(int)a4 requestUUID:(id)a5 traits:(id)a6 options:(unint64_t)a7 auditToken:(id)a8 throttleToken:(id)a9 requesterHandler:(id)a10;
- (void)requestPhoneNumbers:(id)a3 requestUUID:(id)a4 allowCellularDataForLookup:(BOOL)a5 traits:(id)a6 auditToken:(id)a7 throttleToken:(id)a8 requesterHandler:(id)a9;
- (void)shrinkBySize:(unint64_t)a3 finished:(id)a4;
- (void)startRequest:(id)a3 requestUUID:(id)a4 traits:(id)a5 timeout:(double)a6 auditToken:(id)a7 throttleToken:(id)a8 finished:(id)a9 error:(id)a10;
- (void)trackPlaceData:(id)a3;
@end

@implementation GEOPlaceDataLocalProxy

- (void)registerCacheResult:(unsigned __int8)a3 forMapItem:(id)a4 cachedByteCount:(unint64_t)a5 forRequestType:(int)a6 auditToken:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = a3;
  uint64_t v9 = objc_msgSend(a7, "bundleId", a3, a4, a5);
  v10 = (void *)v9;
  v11 = @"<unknown>";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = v11;

  id v14 = +[GEORequestCounter sharedCounter];
  v13 = +[NSDate now];
  [v14 placeCacheRegisterCacheResult:v8 forApp:v12 requestType:v7 timestamp:v13];
}

- (void)startRequest:(id)a3 requestUUID:(id)a4 traits:(id)a5 timeout:(double)a6 auditToken:(id)a7 throttleToken:(id)a8 finished:(id)a9 error:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a9;
  id v20 = a10;
  id v21 = a8;
  id v22 = a7;
  id v23 = a5;
  v24 = [(GEOPlaceDataLocalProxy *)self serviceRequester];
  v34 = _NSConcreteStackBlock;
  uint64_t v35 = 3221225472;
  v36 = sub_10000A8A4;
  v37 = &unk_1000726E0;
  v38 = self;
  id v39 = v18;
  id v40 = v24;
  id v41 = v17;
  id v25 = v17;
  id v26 = v24;
  geo_reentrant_isolate_sync_data();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100003EFC;
  v30[3] = &unk_1000733B8;
  v30[4] = self;
  id v31 = v39;
  id v32 = v20;
  id v33 = v19;
  id v27 = v19;
  id v28 = v20;
  id v29 = v39;
  [v26 startWithRequest:v25 traits:v23 timeout:v22 auditToken:v21 throttleToken:v30 completionHandler:a6];
}

- (void)performPlaceDataRequest:(id)a3 requestUUID:(id)a4 traits:(id)a5 cachePolicy:(unint64_t)a6 timeout:(double)a7 auditToken:(id)a8 throttleToken:(id)a9 requesterHandler:(id)a10
{
  id v16 = a3;
  id v53 = a4;
  id v54 = a5;
  id v17 = a8;
  id v55 = a9;
  id v18 = (void (**)(id, void, id))a10;
  id v19 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    id v20 = _GEOLogPBCodableData();
    id v21 = v19;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68157955;
      *(_DWORD *)&buf[4] = [v20 length];
      LOWORD(v77) = 2097;
      *(void *)((char *)&v77 + 2) = [v20 bytes];
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Received request: %{private,geo:PBCodable}.*P", buf, 0x12u);
    }
  }
  id v22 = +[GEOOfflineStateManager shared];
  id v23 = [v17 offlineCohortId];
  unsigned __int8 v24 = [v22 currentStateForCohortId:v23];

  uint64_t v25 = v24;
  if (v24 >= 2u)
  {
    if (v24 == 2) {
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10004D1C4(v24);
    }
  }
  if (a6 != 4 && a6 != 1)
  {
    int v26 = 1;
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v25 = +[GEOPlatform sharedPlatform];
  if (![(id)v25 isInternalInstall])
  {
    id v29 = 0;
    goto LABEL_24;
  }
  int v26 = 0;
LABEL_13:
  id v27 = [v16 requestedComponents];
  id v28 = +[NSSet setWithArray:v27];
  id v29 = +[GEOPDPlace componentTypesFromComponentInfos:v28];

  if (v26)
  {
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    char v73 = 0;
    *(void *)buf = 0;
    *(void *)&long long v77 = buf;
    *((void *)&v77 + 1) = 0x3032000000;
    v78 = sub_1000475D0;
    v79 = sub_1000475E0;
    id v80 = 0;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    v30 = [v16 handleData];

    if (v30)
    {
      id v31 = [(GEOPlaceDataLocalProxy *)self pdPlaceCache];
      id v32 = [v16 handleData];
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_10004A2A4;
      v65[3] = &unk_1000718B0;
      v65[4] = buf;
      v65[5] = &v70;
      v65[6] = &v66;
      [v31 lookupPlaceByHandle:v32 allowExpired:0 resultBlock:v65];

      [v16 setHandleData:0];
    }
    id v33 = *(void **)(v77 + 40);
    if (!v33)
    {
      v34 = [(GEOPlaceDataLocalProxy *)self pdPlaceCache];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_100003B74;
      v64[3] = &unk_1000718B0;
      v64[4] = buf;
      v64[5] = &v70;
      v64[6] = &v66;
      [v34 lookupPlaceByRequest:v16 allowExpired:0 resultBlock:v64];

      id v33 = *(void **)(v77 + 40);
    }
    if ([v33 nilPlace])
    {
      uint64_t v35 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v74 = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Negative cached place", v74, 2u);
      }

      id v36 = +[NSError GEOErrorWithCode:-8];
      v18[2](v18, 0, v36);
    }
    else
    {
      id v40 = *(void **)(v77 + 40);
      if (v40 && ([v40 hasExpectedComponentTypes:v29] & 1) == 0)
      {
        id v41 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v74 = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Cached place does not have all expected components, ignoring cache", v74, 2u);
        }

        v42 = *(void **)(v77 + 40);
        *(void *)(v77 + 40) = 0;
      }
      if (*(void *)(v77 + 40))
      {
        id v43 = objc_alloc((Class)GEOPDPlaceResponse);
        id v36 = objc_msgSend(v43, "initWithPlace:forRequestType:", *(void *)(v77 + 40), objc_msgSend(v16, "requestType"));
        ((void (**)(id, id, id))v18)[2](v18, v36, 0);

        v44 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v74 = 134217984;
          *(void *)v75 = v36;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Response from the cache: %p", v74, 0xCu);
        }

        uint64_t v45 = v67[3];
        if (*((unsigned char *)v71 + 24))
        {
          -[GEOPlaceDataLocalProxy registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:](self, "registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:", 3, 0, v45, [v16 requestType], v17);
          id v18 = 0;
          char v37 = 1;
        }
        else
        {
          -[GEOPlaceDataLocalProxy registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:](self, "registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:", 1, 0, v45, [v16 requestType], v17);
          char v37 = 0;
          id v18 = 0;
        }
        goto LABEL_48;
      }
      -[GEOPlaceDataLocalProxy registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:](self, "registerCacheResult:forMapItem:cachedByteCount:forRequestType:auditToken:", 2, 0, v67[3], [v16 requestType], v17);
      v46 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v47 = [v16 placeRequestParameters];
        v48 = _GEOLogPBCodableData();

        v49 = v46;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v50 = [v48 length];
          id v51 = [v48 bytes];
          *(_DWORD *)v74 = 68157955;
          *(_DWORD *)v75 = v50;
          *(_WORD *)&v75[4] = 2097;
          *(void *)&v75[6] = v51;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Did not find in cache for request: %{private,geo:PBCodable}.*P", v74, 0x12u);
        }
      }
      if (a6 != 3)
      {
        char v37 = 1;
LABEL_49:
        _Block_object_dispose(&v66, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v70, 8);
        if ((v37 & 1) == 0) {
          goto LABEL_28;
        }
        goto LABEL_25;
      }
      id v36 = +[NSError GEOErrorWithCode:-21];
      v18[2](v18, 0, v36);
    }
    char v37 = 0;
LABEL_48:

    goto LABEL_49;
  }
LABEL_24:

LABEL_25:
  v38 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Performing request.", buf, 2u);
  }

  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_100005EE8;
  v58[3] = &unk_100073598;
  unint64_t v63 = a6;
  id v59 = v16;
  v60 = self;
  id v29 = v29;
  id v61 = v29;
  v62 = v18;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10004A314;
  v56[3] = &unk_100072630;
  id v18 = v62;
  id v57 = v18;
  [(GEOPlaceDataLocalProxy *)self startRequest:v59 requestUUID:v53 traits:v54 timeout:v17 auditToken:v55 throttleToken:v58 finished:a7 error:v56];

LABEL_28:
}

- (id)serviceRequester
{
  serviceRequester = self->_serviceRequester;
  if (serviceRequester)
  {
    v3 = serviceRequester;
  }
  else
  {
    v3 = +[GEOPlaceDataRequester sharedInstance];
  }

  return v3;
}

- (id)pdPlaceCache
{
  pdPlaceCache = self->_pdPlaceCache;
  if (!pdPlaceCache)
  {
    v4 = +[GEOFilePaths pathFor:32792];
    v5 = +[GEOFilePaths pathFor:24];
    +[GEOSQLiteDB migrateAllDBFilesFrom:v4 to:v5];
    v6 = [[GEOPDPlaceCache alloc] initWithCacheFilePath:v5 schedulingDelegate:0 manifestInfoProvider:0];
    uint64_t v7 = self->_pdPlaceCache;
    self->_pdPlaceCache = v6;

    pdPlaceCache = self->_pdPlaceCache;
  }

  return pdPlaceCache;
}

+ (GEOPlaceDataLocalProxy)shared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046E6C;
  block[3] = &unk_100073370;
  block[4] = a1;
  if (qword_100084948 != -1) {
    dispatch_once(&qword_100084948, block);
  }
  v2 = (void *)qword_100084940;

  return (GEOPlaceDataLocalProxy *)v2;
}

- (GEOPlaceDataLocalProxy)init
{
  v19.receiver = self;
  v19.super_class = (Class)GEOPlaceDataLocalProxy;
  v2 = [(GEOPlaceDataLocalProxy *)&v19 init];
  if (v2)
  {
    uint64_t v3 = geo_reentrant_isolater_create();
    accessIsolater = v2->_accessIsolater;
    v2->_accessIsolater = (geo_reentrant_isolater *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:5];
    requestUUIDToRequesters = v2->_requestUUIDToRequesters;
    v2->_requestUUIDToRequesters = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:5];
    requestUUIDToRequests = v2->_requestUUIDToRequests;
    v2->_requestUUIDToRequests = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_alloc_init(_GEOPlaceDataPendingRequestManager);
    pendingRequestManager = v2->_pendingRequestManager;
    v2->_pendingRequestManager = v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_callHistoryRecentsClearedObserver:" name:kGEOCallHistoryRecentsClearedNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"_privacyAndLocationSettingsResetObserver:" name:kGEOResetPrivacyWarningsNotification object:0];

    v13 = +[GEOPrivacyManager sharedManager];
    unsigned int v14 = [v13 hasFiredCallHistoryRecentsClearedNotification];

    if (v14) {
      [(GEOPlaceDataLocalProxy *)v2 _callHistoryRecentsClearedObserver:0];
    }
    v15 = +[GEOPrivacyManager sharedManager];
    unsigned int v16 = [v15 hasFiredResetPrivacyWarningsNotification];

    if (v16) {
      [(GEOPlaceDataLocalProxy *)v2 _privacyAndLocationSettingsResetObserver:0];
    }
    id v17 = v2;
  }

  return v2;
}

- (void)dealloc
{
  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer)
  {
    dispatch_source_set_timer(requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler((dispatch_source_t)self->_requestTimeoutTimer, &stru_100073390);
    v4 = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_requestUUIDToRequests allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPlaceDataLocalProxy *)self cancelRequest:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(GEOPlaceDataLocalProxy *)self _cleanupPendingRequestMananger];
  v10 = +[NSNotificationCenter defaultCenter];
  [v10 removeObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)GEOPlaceDataLocalProxy;
  [(GEOPlaceDataLocalProxy *)&v11 dealloc];
}

- (void)_cleanupPendingRequestMananger
{
}

- (void)_resetRequestTimeout
{
}

- (void)cancelRequest:(id)a3
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = sub_1000475D0;
  long long v15 = sub_1000475E0;
  id v16 = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1000475D0;
  uint64_t v9 = sub_1000475E0;
  id v10 = 0;
  id v4 = a3;
  geo_reentrant_isolate_sync_data();
  objc_msgSend((id)v12[5], "cancelRequest:", v6[5], _NSConcreteStackBlock, 3221225472, sub_1000475E8, &unk_100073200, self);

  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v11, 8);
}

- (void)requestIdentifiers:(id)a3 resultProviderID:(int)a4 requestUUID:(id)a5 traits:(id)a6 options:(unint64_t)a7 auditToken:(id)a8 throttleToken:(id)a9 requesterHandler:(id)a10
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  objc_super v19 = +[GEOOfflineStateManager shared];
  id v20 = [v16 offlineCohortId];
  unsigned __int8 v21 = [v19 currentStateForCohortId:v20];

  if (v21 >= 3u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10004D1C4(v21);
  }
  id v28 = v13;
  id v29 = v15;
  v30 = v14;
  id v22 = v17;
  id v23 = v14;
  id v24 = v16;
  id v25 = v15;
  id v26 = v18;
  id v27 = v13;
  geo_reentrant_isolate_sync();
}

- (void)_requestIdentifiersFromNetwork:(id)a3 resultProviderID:(int)a4 requestUUID:(id)a5 traits:(id)a6 auditToken:(id)a7 throttleToken:(id)a8 finished:(id)a9 error:(id)a10
{
  uint64_t v14 = *(void *)&a4;
  id v16 = a3;
  id v17 = a6;
  id v18 = a9;
  id v19 = a10;
  id v20 = a8;
  id v21 = a7;
  id v22 = a5;
  id v23 = [objc_alloc((Class)GEOPDPlaceRequest) initWithIdentifiers:v16 resultProviderID:v14 traits:v17];
  [v23 clearSensitiveFields:0];
  id v24 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v33 = v16;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Making request for identifiers: %{private}@", buf, 0xCu);
  }

  GEODataRequestTimeout();
  double v26 = v25;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000492F4;
  v29[3] = &unk_1000734D0;
  id v30 = v18;
  id v31 = v19;
  id v27 = v19;
  id v28 = v18;
  [(GEOPlaceDataLocalProxy *)self startRequest:v23 requestUUID:v22 traits:v17 timeout:v21 auditToken:v20 throttleToken:v29 finished:v26 error:v27];

  [(GEOPlaceDataLocalProxy *)self _resetRequestTimeout];
}

- (void)requestPhoneNumbers:(id)a3 requestUUID:(id)a4 allowCellularDataForLookup:(BOOL)a5 traits:(id)a6 auditToken:(id)a7 throttleToken:(id)a8 requesterHandler:(id)a9
{
  BOOL v12 = a5;
  id v16 = a3;
  id v36 = a4;
  id v17 = a6;
  id v37 = a7;
  id v38 = a8;
  id v18 = a9;
  id v19 = (void (**)(void, void, void))v18;
  if (!v16)
  {
    id v30 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == phoneNumbers";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
    goto LABEL_21;
  }
  if (!v18)
  {
    id v30 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v32 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v32;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == requesterHandler";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
    goto LABEL_21;
  }
  if (!v17)
  {
    id v30 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v33 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "nil == traits";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@ forbids: %{public}s", buf, 0x16u);
    }
LABEL_21:

    goto LABEL_27;
  }
  if ([v16 count])
  {
    id v20 = (char *)[v16 count];
    id v21 = +[NSMutableDictionary dictionaryWithCapacity:v20];
    for (i = +[NSMutableArray arrayWithCapacity:v20];
    {
      id v23 = +[GEOPDPlace failedPlaceData];
      [i addObject:v23];
    }
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100049A00;
    v48[3] = &unk_1000734F8;
    v48[4] = self;
    id v24 = v21;
    id v49 = v24;
    [v16 enumerateObjectsUsingBlock:v48];
    if ([v24 count])
    {
      double v25 = [v24 allKeys];
      double v26 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        CFStringRef v27 = @"NO";
        if (v12) {
          CFStringRef v27 = @"YES";
        }
        *(_DWORD *)buf = 138477827;
        *(void *)&uint8_t buf[4] = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Allowed to use cellular data for lookup: %{private}@", buf, 0xCu);
      }

      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v51 = sub_100049B44;
      v52 = sub_100049B70;
      id v53 = 0;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100049B78;
      v39[3] = &unk_100073548;
      v39[4] = self;
      id v40 = v36;
      id v41 = v17;
      id v42 = v37;
      id v43 = v38;
      v46 = buf;
      id v44 = v24;
      id v45 = i;
      BOOL v47 = v12;
      id v28 = objc_retainBlock(v39);
      id v29 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v28;

      (*(void (**)(void))(*(void *)(*(void *)&buf[8] + 40) + 16))();
      _Block_object_dispose(buf, 8);
    }
    else
    {
      double v25 = sub_100045C38(i);
      ((void (**)(void, void *, void))v19)[2](v19, v25, 0);
    }
  }
  else
  {
    v34 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "No use running %{public}@ without any phone numbers.", buf, 0xCu);
    }
    v19[2](v19, 0, 0);
  }
LABEL_27:
}

- (void)fetchAllCacheEntriesWithRequesterHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GEOPlaceDataLocalProxy *)self pdPlaceCache];
  if (v5)
  {
    +[NSMutableDictionary dictionary];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004A0EC;
    v10[3] = &unk_100073570;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004A14C;
    v7[3] = &unk_100071AB8;
    id v8 = v11;
    id v9 = v4;
    id v6 = v11;
    [v5 iterateAllPlacesWithBlock:v10 finishedBlock:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)trackPlaceData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 compactDebugDescription];
    int v8 = 138477827;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Tracking place data: %{private}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(GEOPlaceDataLocalProxy *)self pdPlaceCache];
  [v7 trackPlace:v4];
}

- (void)calculateFreeableSpaceWithHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(GEOPlaceDataLocalProxy *)self pdPlaceCache];
  id v6 = v5;
  if (v5) {
    [v5 calculateFreeableSpaceWithHandler:v4];
  }
  else {
    v4[2](v4, 0);
  }
}

- (void)shrinkBySize:(unint64_t)a3 finished:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  uint64_t v7 = [(GEOPlaceDataLocalProxy *)self pdPlaceCache];
  id v8 = v7;
  if (v7) {
    [v7 shrinkBySize:a3 finished:v6];
  }
  else {
    v6[2](v6, 0);
  }
}

- (unint64_t)calculateFreeableSpaceSync
{
  v2 = [(GEOPlaceDataLocalProxy *)self pdPlaceCache];
  id v3 = [v2 calculateFreeableSpaceSync];

  return (unint64_t)v3;
}

- (unint64_t)shrinkBySizeSync:(unint64_t)a3
{
  id v4 = [(GEOPlaceDataLocalProxy *)self pdPlaceCache];
  id v5 = [v4 shrinkBySizeSync:a3];

  return (unint64_t)v5;
}

- (void)clearCache
{
  id v2 = [(GEOPlaceDataLocalProxy *)self pdPlaceCache];
  [v2 evictAllEntries];
}

- (void)_callHistoryRecentsClearedObserver:(id)a3
{
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Received notification indicating phone recents were cleared.", v6, 2u);
  }

  id v5 = [(GEOPlaceDataLocalProxy *)self pdPlaceCache];
  [v5 deletePhoneNumberMapping];
}

- (void)_privacyAndLocationSettingsResetObserver:(id)a3
{
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "User did reset privacy and location settings", v6, 2u);
  }

  id v5 = [(GEOPlaceDataLocalProxy *)self pdPlaceCache];
  [v5 deletePhoneNumberMapping];

  [(GEOPlaceDataLocalProxy *)self clearCache];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_pdPlaceCache, 0);
  objc_storeStrong((id *)&self->_pendingRequestManager, 0);
  objc_storeStrong((id *)&self->_serviceRequester, 0);
  objc_storeStrong((id *)&self->_requestUUIDToRequests, 0);
  objc_storeStrong((id *)&self->_requestUUIDToRequesters, 0);

  objc_storeStrong((id *)&self->_accessIsolater, 0);
}

@end