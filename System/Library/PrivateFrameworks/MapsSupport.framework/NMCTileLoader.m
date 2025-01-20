@interface NMCTileLoader
- (NMCTileLoader)initWithRequestIdentifier:(id)a3 manifestConfiguration:(id)a4 tileRequests:(id)a5 auditToken:(id)a6;
- (id)tileRequester:(uint64_t)a3 receivedData:(uint64_t)a4 tileEdition:(uint64_t)a5 tileSetDB:(uint64_t)a6 tileSet:(uint64_t)a7 etag:(uint64_t)a8 forKey:(uint64_t)a9 userInfo:(uint64_t)a10;
- (id)tileRequester:(uint64_t)a3 receivedError:(uint64_t)a4 forKey:(uint64_t)a5;
- (void)_finish;
- (void)_handleTile:(long long *)a3 tile:(void *)a4 ETag:(void *)a5 error:(void *)a6 userInfo:(void *)a7 populateCombinedBaseLocalizationData:(int)a8;
- (void)_requestTiles;
- (void)cancel;
- (void)startWithCallbackQueue:(id)a3 tileHandler:(id)a4 completionHandler:(id)a5;
- (void)tileRequesterFinished:(id)a3;
@end

@implementation NMCTileLoader

- (NMCTileLoader)initWithRequestIdentifier:(id)a3 manifestConfiguration:(id)a4 tileRequests:(id)a5 auditToken:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)NMCTileLoader;
  v14 = [(NMCTileLoader *)&v22 init];
  if (v14)
  {
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("NMCTileLoader", v15);
    workQueue = v14->_workQueue;
    v14->_workQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v14->_manifestConfiguration, a4);
    objc_storeStrong((id *)&v14->_requests, a5);
    objc_storeStrong((id *)&v14->_auditToken, a6);
    v18 = (NSString *)[v10 copy];
    requestIdentifier = v14->_requestIdentifier;
    v14->_requestIdentifier = v18;

    v20 = v14;
  }

  return v14;
}

- (void)startWithCallbackQueue:(id)a3 tileHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000A150;
  v15[3] = &unk_100081058;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)cancel
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A470;
  block[3] = &unk_100080F10;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_requestTiles
{
  v3 = sub_10000A3A8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(GEOTileKeyList *)self->_tileKeys count];
    *(_DWORD *)buf = 134349056;
    id v63 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Loading %{public}llu tiles from the network", buf, 0xCu);
  }

  id v46 = [objc_alloc((Class)GEOTileKeyMap) initWithMapType:0];
  id v5 = [objc_alloc((Class)GEOTileKeyMap) initWithMapType:0];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v6 = self->_tileKeys;
  id v7 = [(GEOTileKeyList *)v6 countByEnumeratingWithState:&v56 objects:v61 count:16];
  v48 = v5;
  if (!v7)
  {

LABEL_34:
    LOWORD(v41) = 1;
    v36 = v46;
    v37 = objc_msgSend(objc_alloc((Class)GEOTileRequest), "initWithKeyList:manifestConfiguration:locale:cachedEtags:cachedData:priorities:signpostIDs:createTimes:additionalInfos:auditToken:constraints:backgroundSessionIdentifier:shouldParticipateInBalancer:reason:", self->_tileKeys, self->_manifestConfiguration, 0, v46, 0, v5, 0, 0, 0, self->_auditToken, 0, 0, v41);
    v38 = [[_NMCSimpleTileRequester alloc] initWithTileRequest:v37 forOriginalRequests:self->_keyToRequest delegateQueue:self->_workQueue delegate:self];
    tileRequester = self->_tileRequester;
    self->_tileRequester = v38;

    v40 = self->_tileRequester;
    v35 = v37;
    id v5 = v48;
    [(_NMCSimpleTileRequester *)v40 start];
    goto LABEL_35;
  }
  id v8 = v7;
  int v9 = 0;
  int IsOffline = 0;
  uint64_t v11 = *(void *)v57;
  do
  {
    id v12 = 0;
    int v13 = IsOffline;
    do
    {
      if (*(void *)v57 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v14 = *(void *)(*((void *)&v56 + 1) + 8 * (void)v12);
      int IsOffline = GEOTileKeyIsOffline();
      if ((v9 & (v13 ^ IsOffline) & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: keyIsOffline == requestingOfflineKeys || first", buf, 2u);
      }
      v15 = [(GEOTileKeyMap *)self->_keyToRequest objectForKey:v14];
      if ([v15 hasCachedETag])
      {
        id v16 = [v15 cachedETag];
        [v46 setObject:v16 forKey:v14];
      }
      if ([v15 hasPriority])
      {
        id v17 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v15 priority]);
        [v5 setObject:v17 forKey:v14];
      }
      else
      {
        [v5 setObject:&off_100088210 forKey:v14];
      }

      id v12 = (char *)v12 + 1;
      int v9 = 1;
      int v13 = IsOffline;
    }
    while (v8 != v12);
    id v18 = [(GEOTileKeyList *)v6 countByEnumeratingWithState:&v56 objects:v61 count:16];
    id v8 = v18;
  }
  while (v18);

  if (!IsOffline) {
    goto LABEL_34;
  }
  group = dispatch_group_create();
  GEOTileLoaderClientIdentifier();
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  tileLoaderClientIdentifier = self->_tileLoaderClientIdentifier;
  self->_tileLoaderClientIdentifier = v19;

  v21 = +[GEOTileLoader modernLoader];
  tileLoaderForOfflineTiles = self->_tileLoaderForOfflineTiles;
  self->_tileLoaderForOfflineTiles = v21;

  [(GEOTileLoader *)self->_tileLoaderForOfflineTiles openForClient:self->_tileLoaderClientIdentifier];
  long long v55 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  obj = self->_tileKeys;
  id v45 = [(GEOTileKeyList *)obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v45)
  {
    uint64_t v43 = *(void *)v53;
    do
    {
      v23 = 0;
      do
      {
        if (*(void *)v53 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v52 + 1) + 8 * (void)v23);
        if (GEOTileKeyIsOffline())
        {
          dispatch_group_enter(group);
          v25 = [v48 objectForKey:v24];
          unsigned int v47 = [v25 unsignedIntValue];

          v27 = self->_tileLoaderForOfflineTiles;
          v26 = self->_tileLoaderClientIdentifier;
          uint64_t v28 = qos_class_self();
          auditToken = self->_auditToken;
          GEOMachAbsoluteTimeGetCurrent();
          double v31 = v30;
          workQueue = self->_workQueue;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_10000AA68;
          v50[3] = &unk_100081080;
          v50[4] = self;
          v51 = group;
          [(GEOTileLoader *)v27 loadKey:v24 priority:v47 forClient:v26 options:1027 reason:0 qos:v28 signpostID:v31 auditToken:0 createTime:auditToken callbackQ:workQueue beginNetwork:0 callback:v50];
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: GEOTileKeyIsOffline(key)", buf, 2u);
        }
        v23 = (char *)v23 + 1;
        id v5 = v48;
      }
      while (v45 != v23);
      id v33 = [(GEOTileKeyList *)obj countByEnumeratingWithState:&v52 objects:v60 count:16];
      id v45 = v33;
    }
    while (v33);
  }

  v34 = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AABC;
  block[3] = &unk_100080F10;
  block[4] = self;
  v35 = group;
  dispatch_group_notify(group, v34, block);
  v36 = v46;
LABEL_35:
}

- (void)_handleTile:(long long *)a3 tile:(void *)a4 ETag:(void *)a5 error:(void *)a6 userInfo:(void *)a7 populateCombinedBaseLocalizationData:(int)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  long long v81 = *a3;
  if (v14)
  {
    id v18 = sub_10000A3A8();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68157955;
      *(_DWORD *)v78 = 16;
      *(_WORD *)&v78[4] = 2097;
      *(void *)&v78[6] = &v81;
      v19 = "Successfully loaded tile key %{private,geo:TileKey}.*P";
      v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
      uint32_t v22 = 18;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v22);
    }
  }
  else
  {
    if (!v16) {
      goto LABEL_9;
    }
    id v18 = sub_10000A3A8();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68158211;
      *(_DWORD *)v78 = 16;
      *(_WORD *)&v78[4] = 2097;
      *(void *)&v78[6] = &v81;
      __int16 v79 = 2114;
      id v80 = v16;
      v19 = "Error loading tile key %{private,geo:TileKey}.*P: %{public}@";
      v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      uint32_t v22 = 28;
      goto LABEL_7;
    }
  }

LABEL_9:
  [*(id *)(a1 + 56) removeKey:a3];
  v23 = [*(id *)(a1 + 64) objectForKey:a3];
  if (v23)
  {
    id v24 = objc_retainBlock(*(id *)(a1 + 88));
    v25 = v24;
    if (!v24)
    {
LABEL_16:

      goto LABEL_17;
    }
    id v66 = v24;
    id v26 = v14;
    id v27 = v17;
    v69 = v15;
    uint64_t v28 = objc_alloc_init(NMMessage);
    [(NMMessage *)v28 setType:4];
    v29 = objc_alloc_init(NMArgument);
    [(NMArgument *)v29 setTag:103];
    [(NMArgument *)v29 setStringValue:*(void *)(a1 + 24)];
    [(NMMessage *)v28 addArgument:v29];
    double v30 = objc_alloc_init(NMArgument);

    [(NMArgument *)v30 setTag:100];
    v68 = v23;
    double v31 = [v23 tileKey];
    [(NMArgument *)v30 setDataValue:v31];

    [(NMMessage *)v28 addArgument:v30];
    if (v16)
    {
      v32 = [[NMArgument alloc] _nm_initWithErrorValue:v16 tag:3];
      id v14 = v26;
      v25 = v66;
      goto LABEL_13;
    }
    if (a8)
    {
      if ([v69 length])
      {
        v35 = objc_alloc_init(NMArgument);

        [(NMArgument *)v35 setTag:101];
        [(NMArgument *)v35 setStringValue:v69];
        [(NMMessage *)v28 addArgument:v35];
        double v30 = v35;
      }
      id v14 = v26;
      v36 = [v17 objectForKeyedSubscript:GEOTileLoadStaleCachedDataWasCurrentKey];
      objc_opt_class();
      v25 = v66;
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v36 BOOLValue])
      {
        p_vtable = (void **)(NanoRoutePlanningResponseSnapshot + 24);
LABEL_54:

        if (!v17) {
          goto LABEL_15;
        }
        v32 = (NMArgument *)objc_alloc_init((Class)(p_vtable + 427));

        [(NMArgument *)v32 setTag:2];
        uint64_t v54 = GEOTileLoadResultSourceKey;
        long long v55 = [v17 objectForKeyedSubscript:GEOTileLoadResultSourceKey];

        if (!v55)
        {
LABEL_14:
          [(NMMessage *)v28 addArgument:v32];
          double v30 = v32;
LABEL_15:
          id v33 = *(NSObject **)(a1 + 80);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000B330;
          block[3] = &unk_1000810A8;
          v71 = v28;
          id v72 = v25;
          v34 = v28;
          dispatch_async(v33, block);

          id v15 = v69;
          goto LABEL_16;
        }
        double v30 = objc_alloc_init(NMStringToObjectTuple);
        [(NMArgument *)v30 setKey:v54];
        long long v56 = [v17 objectForKeyedSubscript:v54];
        -[NMArgument setIntValue:](v30, "setIntValue:", [v56 unsignedLongLongValue]);

        [(NMArgument *)v32 addStringToObjectMap:v30];
LABEL_13:

        goto LABEL_14;
      }
      id v62 = v17;
      v64 = v36;
      id v76 = 0;
      uint64_t v42 = [v14 readDataWithError:&v76];
      id v43 = v76;
      p_vtable = NanoRoutePlanningResponseSnapshot.vtable;
      id v65 = (id)v42;
      id v63 = v43;
      if (v42)
      {
        v44 = objc_alloc_init(NMArgument);

        [(NMArgument *)v44 setTag:1];
        double v30 = [v14 data];
        [(NMArgument *)v44 setDataValue:v30];
      }
      else
      {
        v44 = [[NMArgument alloc] _nm_initWithErrorValue:v43 tag:3];
      }

      [(NMMessage *)v28 addArgument:v44];
      double v30 = v44;
      id v17 = v62;
LABEL_53:

      v36 = v64;
      goto LABEL_54;
    }
    v75[2] = 0;
    v75[1] = 0;
    GEOSimpleTileRequesterUnpackETag();
    id v38 = 0;
    id v65 = 0;
    v39 = [v23 cachedBaseETag];
    v40 = v38;
    v61 = [v68 cachedLocalizationETag];
    id v41 = [v38 length];
    id v17 = v27;
    id v63 = v39;
    if (v41)
    {
      id v14 = v26;
      if ([v39 length]) {
        unsigned int v59 = [v40 isEqualToString:v39];
      }
      else {
        unsigned int v59 = 0;
      }
    }
    else
    {
      unsigned int v59 = 0;
      id v14 = v26;
    }
    v25 = v66;
    v23 = v68;
    if ([v65 length] && objc_msgSend(v61, "length")) {
      unsigned int v67 = [v65 isEqualToString:v61];
    }
    else {
      unsigned int v67 = 0;
    }
    v64 = v40;
    if ([v40 length])
    {
      id v45 = v40;
      id v46 = objc_alloc_init(NMArgument);

      [(NMArgument *)v46 setTag:105];
      [(NMArgument *)v46 setStringValue:v45];
      [(NMMessage *)v28 addArgument:v46];
      double v30 = v46;
    }
    if ([v65 length])
    {
      unsigned int v47 = objc_alloc_init(NMArgument);

      [(NMArgument *)v47 setTag:107];
      [(NMArgument *)v47 setStringValue:v65];
      [(NMMessage *)v28 addArgument:v47];
      double v30 = v47;
    }
    unsigned int v48 = v59;
    v75[0] = 0;
    uint64_t v49 = [v14 readDataWithError:v75];
    id v57 = v75[0];
    v60 = (void *)v49;
    if (!v49)
    {
      v50 = sub_10000A3A8();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v78 = v57;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Error reading tile data: %{public}@", buf, 0xCu);
      }
    }
    if (v48 & v67)
    {
      id v58 = 0;
      id v51 = 0;
      if (v48) {
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v73 = 0;
      uint64_t v74 = 0;
      GEOTileUnpackageBaseAndLocalization();
      id v58 = 0;
      id v51 = 0;
      if (v48)
      {
LABEL_50:
        if ((v67 & 1) == 0)
        {
          long long v53 = objc_alloc_init(NMArgument);

          [(NMArgument *)v53 setTag:106];
          [(NMArgument *)v53 setDataValue:v51];
          [(NMMessage *)v28 addArgument:v53];
          double v30 = v53;
        }

        p_vtable = NanoRoutePlanningResponseSnapshot.vtable;
        id v16 = 0;
        goto LABEL_53;
      }
    }
    long long v52 = objc_alloc_init(NMArgument);

    [(NMArgument *)v52 setTag:104];
    [(NMArgument *)v52 setDataValue:v58];
    [(NMMessage *)v28 addArgument:v52];
    double v30 = v52;
    goto LABEL_50;
  }
LABEL_17:
}

- (void)_finish
{
  if ([(GEOTileKeyList *)self->_remainingKeys count])
  {
    v3 = sub_10000A3A8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [(GEOTileKeyList *)self->_remainingKeys count];
      *(_DWORD *)buf = 134217984;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Requester claimed to be finished, but still have %llu keys remaining.", buf, 0xCu);
    }

    id v5 = +[NSError GEOErrorWithCode:-13 reason:@"Requester claimed to be finished without handling key"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = self->_remainingKeys;
    id v7 = [(GEOTileKeyList *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          -[NMCTileLoader _handleTile:tile:ETag:error:userInfo:populateCombinedBaseLocalizationData:](self, "_handleTile:tile:ETag:error:userInfo:populateCombinedBaseLocalizationData:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v10), 0, 0, v5, 0, 0, (void)v14);
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(GEOTileKeyList *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  id v11 = objc_retainBlock(self->_completionHandler);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id tileHandler = self->_tileHandler;
  self->_id tileHandler = 0;

  dispatch_async((dispatch_queue_t)self->_callbackQueue, v11);
}

- (id)tileRequester:(uint64_t)a3 receivedData:(uint64_t)a4 tileEdition:(uint64_t)a5 tileSetDB:(uint64_t)a6 tileSet:(uint64_t)a7 etag:(uint64_t)a8 forKey:(uint64_t)a9 userInfo:(uint64_t)a10
{
  v12[0] = a9;
  v12[1] = a10;
  return [a1 _handleTile:v12 tile:a4 ETag:a8 error:0 userInfo:a11 populateCombinedBaseLocalizationData:0];
}

- (id)tileRequester:(uint64_t)a3 receivedError:(uint64_t)a4 forKey:(uint64_t)a5
{
  v7[0] = a5;
  v7[1] = a6;
  return [a1 _handleTile:v7 tile:0 ETag:0 error:a4 userInfo:0 populateCombinedBaseLocalizationData:0];
}

- (void)tileRequesterFinished:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileLoaderClientIdentifier, 0);
  objc_storeStrong((id *)&self->_tileLoaderForOfflineTiles, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_tileHandler, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_tileRequester, 0);
  objc_storeStrong((id *)&self->_keyToRequest, 0);
  objc_storeStrong((id *)&self->_remainingKeys, 0);
  objc_storeStrong((id *)&self->_tileKeys, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end