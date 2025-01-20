@interface GEOImageServiceServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOImageServiceServer)initWithDaemon:(id)a3;
- (void)calculateFreeableWithRequest:(id)a3;
- (void)cancelImageServiceRequestWithRequest:(id)a3;
- (void)purgeDiskCacheWithRequest:(id)a3;
- (void)startImageServiceRequestWithRequest:(id)a3;
@end

@implementation GEOImageServiceServer

+ (id)identifier
{
  return @"ImageService";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 > 2506)
  {
    if (v13 == 2563)
    {
      uint64_t v22 = objc_opt_class();
      v23 = sub_100008DBC(@"ImageService", v10, v11, v22, v12);
      v17 = v23;
      BOOL v14 = v23 != 0;
      if (v23)
      {
        [v23 setSignpostId:a6];
        [(GEOImageServiceServer *)self cancelImageServiceRequestWithRequest:v17];
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    if (v13 == 2507)
    {
      uint64_t v18 = objc_opt_class();
      v19 = sub_100008DBC(@"ImageService", v10, v11, v18, v12);
      v17 = v19;
      BOOL v14 = v19 != 0;
      if (v19)
      {
        [v19 setSignpostId:a6];
        [(GEOImageServiceServer *)self startImageServiceRequestWithRequest:v17];
        goto LABEL_16;
      }
LABEL_17:
    }
  }
  else if (v13 == 1410)
  {
    BOOL v14 = 1;
    if (sub_100019858(v12, v11, @"ImageService", v10, &off_100077840, 1))
    {
      uint64_t v20 = objc_opt_class();
      v21 = sub_100008DBC(@"ImageService", v10, v11, v20, v12);
      v17 = v21;
      BOOL v14 = v21 != 0;
      if (v21)
      {
        [v21 setSignpostId:a6];
        [(GEOImageServiceServer *)self purgeDiskCacheWithRequest:v17];
        goto LABEL_16;
      }
      goto LABEL_17;
    }
  }
  else if (v13 == 1732)
  {
    BOOL v14 = 1;
    if (sub_100019858(v12, v11, @"ImageService", v10, &off_100077828, 1))
    {
      uint64_t v15 = objc_opt_class();
      v16 = sub_100008DBC(@"ImageService", v10, v11, v15, v12);
      v17 = v16;
      BOOL v14 = v16 != 0;
      if (v16)
      {
        [v16 setSignpostId:a6];
        [(GEOImageServiceServer *)self calculateFreeableWithRequest:v17];
LABEL_16:
        BOOL v14 = 1;
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }

  return v14;
}

- (GEOImageServiceServer)initWithDaemon:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)GEOImageServiceServer;
  v3 = [(GEOImageServiceServer *)&v18 initWithDaemon:a3];
  if (v3)
  {
    uint64_t v4 = geo_isolater_create();
    isolater = v3->_isolater;
    v3->_isolater = (geo_isolater *)v4;

    uint64_t v6 = +[NSMutableArray array];
    requestsConsultingPersistence = v3->_requestsConsultingPersistence;
    v3->_requestsConsultingPersistence = (NSMutableArray *)v6;

    uint64_t v8 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:512];
    originalRequestToPendingRequest = v3->_originalRequestToPendingRequest;
    v3->_originalRequestToPendingRequest = (NSMapTable *)v8;

    id v10 = [GEOImageServicePersistence alloc];
    id v11 = +[GEOFilePaths urlFor:28];
    id v12 = [(GEOImageServicePersistence *)v10 initWithDBFileURL:v11];
    persistence = v3->_persistence;
    v3->_persistence = v12;

    BOOL v14 = +[GEODiskSpaceManager sharedManager];
    uint64_t v15 = [v14 diskSpaceProviderForIdentifier:@"com.apple.geod.ImageService"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v15 setPersistence:v3->_persistence];
    }
    v16 = v3;
  }
  return v3;
}

- (void)startImageServiceRequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOImageServiceReplySimple) initWithRequest:v4];
  uint64_t v6 = [v4 request];

  if (v6)
  {
    v27 = v5;
    v7 = [v4 request];
    uint64_t v8 = [v7 imageIds];
    id v32 = [v8 mutableCopy];

    v9 = [v4 request];
    unsigned int v30 = [v9 width];

    id v10 = [v4 request];
    id v11 = [v10 height];

    v31 = +[NSMutableArray array];
    v46 = _NSConcreteStackBlock;
    uint64_t v47 = 3221225472;
    v48 = sub_100030BD4;
    v49 = &unk_100071888;
    v50 = self;
    id v28 = v4;
    id v51 = v4;
    geo_isolate_sync_data();
    id v12 = dispatch_group_create();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v26 = v51;
    int v13 = [v51 request];
    BOOL v14 = [v13 imageIds];

    id obj = v14;
    id v15 = [v14 countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v43;
      do
      {
        objc_super v18 = 0;
        do
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v42 + 1) + 8 * (void)v18);
          dispatch_group_enter(v12);
          persistence = self->_persistence;
          global_queue = (void *)geo_get_global_queue();
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_100030C34;
          v38[3] = &unk_100072708;
          v38[4] = v19;
          v38[5] = self;
          id v39 = v32;
          id v40 = v31;
          v41 = v12;
          [(GEOImageServicePersistence *)persistence getDataForIdentifier:v19 width:v30 height:v11 callbackQueue:global_queue callback:v38];

          objc_super v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [obj countByEnumeratingWithState:&v42 objects:v52 count:16];
      }
      while (v16);
    }

    uint64_t v22 = geo_get_global_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030D84;
    block[3] = &unk_1000727A8;
    block[4] = self;
    id v34 = v26;
    id v35 = v32;
    id v36 = v31;
    id v5 = v27;
    id v37 = v27;
    id v23 = v31;
    id v24 = v32;
    dispatch_group_notify(v12, v22, block);

    id v4 = v28;
  }
  else
  {
    v25 = +[NSError GEOErrorWithCode:-10];
    [v5 setError:v25];

    [v5 send];
  }
}

- (void)cancelImageServiceRequestWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEOImageServiceReplySimple) initWithRequest:v3];
  id v5 = [v3 request];

  if (v5)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = sub_100030F60;
    int v13 = sub_100030F70;
    id v14 = 0;
    id v8 = v3;
    geo_isolate_sync_data();
    if (v10[5])
    {
      uint64_t v6 = +[GEOImageServiceServerRequester sharedRequester];
      [v6 cancelSimpleImageServiceRequest:v10[5]];
    }
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v7 = +[NSError GEOErrorWithCode:-10];
    [v4 setError:v7];

    [v4 send];
  }
}

- (void)calculateFreeableWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOImageServiceCalculateFreeableSizeReply) initWithRequest:v4];

  objc_msgSend(v5, "setSize:", -[GEOImageServicePersistence calculateFreeableSize](self->_persistence, "calculateFreeableSize"));
  [v5 send];
}

- (void)purgeDiskCacheWithRequest:(id)a3
{
  id v4 = a3;
  id v7 = [objc_alloc((Class)GEOImageServicePurgeCacheToSizeReply) initWithRequest:v4];
  persistence = self->_persistence;
  id v6 = [v4 targetSize];

  objc_msgSend(v7, "setAmountDeleted:", -[GEOImageServicePersistence shrinkToSize:](persistence, "shrinkToSize:", v6));
  [v7 send];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequestToPendingRequest, 0);
  objc_storeStrong((id *)&self->_requestsConsultingPersistence, 0);
  objc_storeStrong((id *)&self->_isolater, 0);

  objc_storeStrong((id *)&self->_persistence, 0);
}

@end