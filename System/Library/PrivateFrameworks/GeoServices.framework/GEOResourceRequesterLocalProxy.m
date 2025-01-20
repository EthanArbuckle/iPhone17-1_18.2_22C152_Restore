@interface GEOResourceRequesterLocalProxy
- (GEOResourceRequesterLocalProxy)init;
- (id)_finished:(id)a3 withResult:(id)a4 error:(id)a5;
- (id)resourcesRequested:(id)a3 forHandler:(id)a4 queue:(id)a5 wantsUnpacked:(BOOL)a6 signpost:(unint64_t)a7;
- (void)_cleanUpFinishedHandlers:(id)a3;
- (void)_failAllPendingRequests;
- (void)_fetchResources:(id)a3 force:(BOOL)a4 manifestConfiguration:(id)a5 destination:(id)a6 additionalDestination:(id)a7 auditToken:(id)a8 signpostID:(unint64_t)a9;
- (void)_fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10;
- (void)_resetRequestTimeout;
- (void)dealloc;
- (void)didResolvePaths:(id)a3 forResources:(id)a4;
- (void)failedToResolveResources:(id)a3 withError:(id)a4;
- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10;
@end

@implementation GEOResourceRequesterLocalProxy

- (GEOResourceRequesterLocalProxy)init
{
  v11.receiver = self;
  v11.super_class = (Class)GEOResourceRequesterLocalProxy;
  v2 = [(GEOResourceRequesterLocalProxy *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    requestHandlersPending = v2->_requestHandlersPending;
    v2->_requestHandlersPending = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableArray array];
    inProgressLoaders = v2->_inProgressLoaders;
    v2->_inProgressLoaders = (NSMutableArray *)v5;

    requestTimeoutTimer = v2->_requestTimeoutTimer;
    v2->_requestTimeoutTimer = 0;

    uint64_t v8 = geo_dispatch_queue_create_with_workloop_qos();
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  workQueue = self->_workQueue;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10003F854;
  v28[3] = &unk_100072FD8;
  v28[4] = self;
  id v29 = v16;
  BOOL v35 = a4;
  BOOL v36 = a5;
  id v30 = v17;
  id v31 = v18;
  id v33 = v20;
  unint64_t v34 = a8;
  id v32 = v19;
  id v22 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  dispatch_block_t v27 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v28);
  dispatch_async(workQueue, v27);
}

- (void)_fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10
{
  BOOL v13 = a5;
  BOOL v14 = a4;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  if (![v15 count])
  {
    id v25 = sub_10003F2C0();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "0 resources requested. Done.", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003FEC4;
    block[3] = &unk_1000714E0;
    id v65 = v19;
    dispatch_async(v18, block);
    id v26 = v65;
    goto LABEL_53;
  }
  id v56 = v17;
  BOOL v54 = v14;
  if (a8)
  {
    id v20 = sub_10003F2C0();
    os_signpost_id_t v21 = os_signpost_id_generate(v20);

    id v22 = sub_10003F2C0();
    id v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v68 = a8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "FetchResources", "parent_signpost=%llu", buf, 0xCu);
    }

    os_signpost_id_t v24 = v21;
    id v17 = v56;
  }
  else
  {
    os_signpost_id_t v24 = 0;
  }
  id v55 = v19;
  os_signpost_id_t v53 = v24;
  -[GEOResourceRequesterLocalProxy resourcesRequested:forHandler:queue:wantsUnpacked:signpost:](self, "resourcesRequested:forHandler:queue:wantsUnpacked:signpost:", v15, v19, v18, v13);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_block_t v27 = sub_10003F2C0();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v28 = [v15 count];
    unsigned int v29 = [v15 count];
    unsigned int v30 = v29 - [v26 count];
    unsigned int v31 = [v26 count];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v68 = v28;
    *(_WORD *)&v68[4] = 1024;
    *(_DWORD *)&v68[6] = v30;
    __int16 v69 = 1024;
    unsigned int v70 = v31;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%d resources requested, %d already pending, will load %d", buf, 0x14u);
  }

  if (![v26 count]) {
    goto LABEL_52;
  }
  v50 = v18;
  if (!v16)
  {
    id v16 = +[GEOResourceManifestConfiguration defaultConfiguration];
  }
  v51 = v16;
  id v52 = v15;
  id v32 = +[GEOResourceManifestManager modernManagerForConfiguration:v16];
  id v33 = [v32 activeTileGroup];

  unint64_t v34 = +[NSMutableArray array];
  v59 = +[NSMutableArray array];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v26 = v26;
  id v35 = [v26 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (!v35)
  {
    v58 = 0;
    goto LABEL_36;
  }
  id v36 = v35;
  v58 = 0;
  uint64_t v37 = *(void *)v61;
  do
  {
    v38 = 0;
    do
    {
      if (*(void *)v61 != v37) {
        objc_enumerationMutation(v26);
      }
      uint64_t v39 = *(void *)(*((void *)&v60 + 1) + 8 * (void)v38);
      if ([v33 isRegionalResource:v39])
      {
        v40 = v34;
        goto LABEL_27;
      }
      v41 = [v33 activeResources];
      if ([v41 containsObject:v39])
      {

LABEL_26:
        v40 = v59;
        goto LABEL_27;
      }
      v42 = [v33 explicitResources];
      unsigned __int8 v43 = [v42 containsObject:v39];

      if (v43) {
        goto LABEL_26;
      }
      v44 = sub_10003F2C0();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v68 = v39;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Asked to load unknown resource: %@", buf, 0xCu);
      }

      v40 = v58;
      if (!v58)
      {
        v40 = +[NSMutableArray array];
        v58 = v40;
      }
LABEL_27:
      [v40 addObject:v39];
      v38 = (char *)v38 + 1;
    }
    while (v36 != v38);
    id v45 = [v26 countByEnumeratingWithState:&v60 objects:v66 count:16];
    id v36 = v45;
  }
  while (v45);
LABEL_36:

  id v16 = v51;
  id v15 = v52;
  if (![v58 count]) {
    goto LABEL_40;
  }
  v46 = +[NSError GEOErrorWithCode:-10 reason:@"Unknown resource"];
  [(GEOResourceRequesterLocalProxy *)self failedToResolveResources:v58 withError:v46];
  if ([v34 count] || objc_msgSend(v59, "count"))
  {

LABEL_40:
    if ([v34 count])
    {
      v47 = GEORegionalResourcesDirectory();
      if ([v51 isDefaultConfiguration])
      {
        v48 = 0;
      }
      else
      {
        v48 = GEORegionalResourcesDirectory();
      }
      [(GEOResourceRequesterLocalProxy *)self _fetchResources:v34 force:v54 manifestConfiguration:v51 destination:v47 additionalDestination:v48 auditToken:v56 signpostID:v53];
    }
    if ([v59 count])
    {
      v46 = GEOResourcesPath();
      if ([v51 isDefaultConfiguration])
      {
        v49 = 0;
      }
      else
      {
        v49 = GEOResourcesPath();
      }
      [(GEOResourceRequesterLocalProxy *)self _fetchResources:v59 force:v54 manifestConfiguration:v51 destination:v46 additionalDestination:v49 auditToken:v56 signpostID:v53];

      goto LABEL_50;
    }
  }
  else
  {
LABEL_50:
  }
  id v17 = v56;
  id v18 = v50;
LABEL_52:
  id v19 = v55;
LABEL_53:
}

- (void)_fetchResources:(id)a3 force:(BOOL)a4 manifestConfiguration:(id)a5 destination:(id)a6 additionalDestination:(id)a7 auditToken:(id)a8 signpostID:(unint64_t)a9
{
  id v35 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v33 = v14;
  id v18 = +[GEOResourceManifestManager modernManagerForConfiguration:v14];
  id v19 = [v18 activeTileGroup];

  id v20 = [v19 urlInfoSet];
  os_signpost_id_t v21 = [v20 resourcesURL];
  id v22 = [v21 nsURL];

  id v23 = [v19 urlInfoSet];
  os_signpost_id_t v24 = [v23 alternateResourcesNSURLs];

  id v25 = [v19 urlInfoSet];
  id v26 = [v25 resourcesProxyURL];

  id v27 = objc_alloc((Class)GEOResourceLoader);
  unsigned int v28 = sub_10003F2C0();
  unint64_t v34 = v16;
  LOBYTE(v32) = a4;
  uint64_t v37 = v17;
  id v29 = [v27 initWithTargetDirectory:v15 auditToken:v17 baseURL:v22 alternateURLs:v24 proxyURL:v26 resources:v35 forceUpdateCheck:v32 maximumConcurrentLoads:6 additionalDirectoryToConsider:v16 log:v28 signpostID:a9];

  [(NSMutableArray *)self->_inProgressLoaders addObject:v29];
  objc_initWeak(&location, v29);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100040188;
  v38[3] = &unk_100073028;
  v38[4] = self;
  objc_copyWeak(&v41, &location);
  id v30 = v35;
  id v39 = v30;
  id v31 = v15;
  id v40 = v31;
  [v29 startWithCompletionHandler:v38 callbackQueue:self->_workQueue];
  [(GEOResourceRequesterLocalProxy *)self _resetRequestTimeout];

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040578;
  block[3] = &unk_100071490;
  void block[4] = self;
  dispatch_sync(workQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)GEOResourceRequesterLocalProxy;
  [(GEOResourceRequesterLocalProxy *)&v4 dealloc];
}

- (id)resourcesRequested:(id)a3 forHandler:(id)a4 queue:(id)a5 wantsUnpacked:(BOOL)a6 signpost:(unint64_t)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = +[NSOrderedSet orderedSetWithArray:v12];
  id v16 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v12 count]);
  id v27 = v13;
  unsigned int v28 = v12;
  id v17 = +[_GEOResourceRequestHelper helperForHandler:v13 queue:v14 resources:v12 wantsUnpacked:v8 signpost:a7];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v15;
  id v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        os_signpost_id_t v24 = [(NSMutableDictionary *)self->_requestHandlersPending objectForKeyedSubscript:v23];
        if (!v24)
        {
          os_signpost_id_t v24 = +[NSMutableArray arrayWithCapacity:1];
          [(NSMutableDictionary *)self->_requestHandlersPending setObject:v24 forKeyedSubscript:v23];
          [v16 addObject:v23];
        }
        [v24 addObject:v17];
      }
      id v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v20);
  }

  id v25 = [v16 allObjects];

  return v25;
}

- (id)_finished:(id)a3 withResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    objc_super v11 = [(NSMutableDictionary *)self->_requestHandlersPending objectForKeyedSubscript:v8];
    if (v11)
    {
      uint64_t v40 = 0;
      id v41 = &v40;
      uint64_t v42 = 0x2020000000;
      char v43 = 0;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100040B6C;
      v37[3] = &unk_100073070;
      id v12 = v8;
      id v38 = v12;
      id v39 = &v40;
      [v11 enumerateObjectsUsingBlock:v37];
      if (*((unsigned char *)v41 + 24))
      {
        id v13 = sub_10003F2C0();
        id v36 = 0;
        id v14 = +[GEOResourceLoader unpackResource:v12 at:v9 log:v13 error:&v36];
        id v15 = v36;

        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v17 = sub_10003F2C0();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v45 = v12;
            __int16 v46 = 2112;
            id v47 = v9;
            __int16 v48 = 2112;
            id v49 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unable to unpack resource %@ at \"%@\" - %@", buf, 0x20u);
          }
        }
      }
      else
      {
        id v14 = v9;
      }
      id v18 = +[NSMutableArray array];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100040BB4;
      v31[3] = &unk_100073098;
      id v32 = v12;
      id v9 = v14;
      id v33 = v9;
      id v34 = v10;
      id v19 = v18;
      id v35 = v19;
      [v11 enumerateObjectsUsingBlock:v31];
      id v20 = v35;
      id v21 = v19;

      _Block_object_dispose(&v40, 8);
    }
    else
    {
      BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v23) {
        sub_10004D14C(v23, v24, v25, v26, v27, v28, v29, v30);
      }
      id v21 = &__NSArray0__struct;
    }
  }
  else
  {
    id v21 = &__NSArray0__struct;
  }

  return v21;
}

- (void)_cleanUpFinishedHandlers:(id)a3
{
  id v4 = a3;
  if ([v4 count] && -[NSMutableDictionary count](self->_requestHandlersPending, "count"))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(NSMutableDictionary *)self->_requestHandlersPending allKeys];
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          objc_super v11 = [(NSMutableDictionary *)self->_requestHandlersPending objectForKeyedSubscript:v10];
          [v11 removeObjectsInArray:v4];
          if (![v11 count]) {
            [(NSMutableDictionary *)self->_requestHandlersPending removeObjectForKey:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)didResolvePaths:(id)a3 forResources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = +[NSMutableArray array];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100040EF4;
    v12[3] = &unk_1000730C0;
    id v13 = v7;
    id v9 = v8;
    id v14 = v9;
    long long v15 = self;
    [v6 enumerateObjectsUsingBlock:v12];
    [(GEOResourceRequesterLocalProxy *)self _cleanUpFinishedHandlers:v9];
    uint64_t v10 = sub_10003F2C0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_super v11 = [(NSMutableDictionary *)self->_requestHandlersPending allKeys];
      *(_DWORD *)buf = 138477827;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Remaining requests in progress: %{private}@", buf, 0xCu);
    }
  }
}

- (void)failedToResolveResources:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = +[NSMutableArray array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = -[GEOResourceRequesterLocalProxy _finished:withResult:error:](self, "_finished:withResult:error:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v13), 0, v7, (void)v17);
          [v8 addObjectsFromArray:v14];

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v11);
    }

    [(GEOResourceRequesterLocalProxy *)self _cleanUpFinishedHandlers:v8];
    long long v15 = sub_10003F2C0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = [(NSMutableDictionary *)self->_requestHandlersPending allKeys];
      *(_DWORD *)buf = 138477827;
      id v22 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Remaining requests in progress: %{private}@", buf, 0xCu);
    }
  }
}

- (void)_failAllPendingRequests
{
  uint64_t v3 = +[NSMutableSet set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = [(NSMutableDictionary *)self->_requestHandlersPending allValues];
  id v5 = [v4 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v33;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v32 + 1) + 8 * (void)v8)];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v6);
  }

  [(NSMutableDictionary *)self->_requestHandlersPending removeAllObjects];
  if ([v3 count])
  {
    id v9 = sub_10003F2C0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unsigned int v10 = [v3 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v39 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Found %d request helpers that should have finished by now", buf, 8u);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v3;
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        long long v15 = 0;
        do
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * (void)v15) failAllRemainingRequests];
          long long v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v13);
    }
  }
  id v16 = [(NSMutableArray *)self->_inProgressLoaders copy];
  [(NSMutableArray *)self->_inProgressLoaders removeAllObjects];
  long long v17 = sub_10003F2C0();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    unsigned int v18 = [v16 count];
    *(_DWORD *)buf = 67109120;
    unsigned int v39 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Canceling %d in-flight resource loaders", buf, 8u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v19 = self->_inProgressLoaders;
  id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      BOOL v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)v23), "cancel", (void)v24);
        BOOL v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v21);
  }
}

- (void)_resetRequestTimeout
{
  char BOOL = GEOConfigGetBOOL();
  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (BOOL)
  {
    if (requestTimeoutTimer) {
      goto LABEL_4;
    }
    id v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_workQueue);
    id v6 = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = v5;

    dispatch_source_set_timer((dispatch_source_t)self->_requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    uint64_t v7 = self->_requestTimeoutTimer;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100041634;
    v14[3] = &unk_1000730E8;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v7, v14);
    dispatch_activate((dispatch_object_t)self->_requestTimeoutTimer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    if (self->_requestTimeoutTimer)
    {
LABEL_4:
      GEODataRequestTimeout();
      if (v8 * 3.0 * 0.5 <= 300.0)
      {
        int64_t v10 = 300000000000;
      }
      else
      {
        GEODataRequestTimeout();
        int64_t v10 = (uint64_t)(v9 * 3.0 * 0.5 * 1000000000.0);
      }
      id v12 = self->_requestTimeoutTimer;
      dispatch_time_t v13 = dispatch_time(0, v10);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
    }
  }
  else if (requestTimeoutTimer)
  {
    dispatch_source_cancel(requestTimeoutTimer);
    id v11 = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_requestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_inProgressLoaders, 0);

  objc_storeStrong((id *)&self->_requestHandlersPending, 0);
}

@end