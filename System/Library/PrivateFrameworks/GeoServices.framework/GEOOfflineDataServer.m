@interface GEOOfflineDataServer
+ (BOOL)wantsPerMessageSignposts;
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOOfflineDataServer)initWithDaemon:(id)a3;
- (void)checkExistenceWithRequest:(id)a3;
- (void)fetchAvailableKeysWithRequest:(id)a3;
- (void)fetchTileConfigurationWithRequest:(id)a3;
- (void)fetchVersionMetadataWithRequest:(id)a3;
- (void)fetchWithRequest:(id)a3;
@end

@implementation GEOOfflineDataServer

+ (id)identifier
{
  return @"offlinedata";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 <= 1830)
  {
    if (v13 == 522)
    {
      BOOL v14 = 1;
      if (sub_100019858(v12, v11, @"offlinedata", v10, &off_100077C00, 1))
      {
        uint64_t v24 = objc_opt_class();
        v25 = sub_100008DBC(@"offlinedata", v10, v11, v24, v12);
        v17 = v25;
        BOOL v14 = v25 != 0;
        if (v25)
        {
          [v25 setSignpostId:a6];
          [(GEOOfflineDataServer *)self fetchWithRequest:v17];
          goto LABEL_21;
        }
        goto LABEL_22;
      }
    }
    else if (v13 == 1446)
    {
      BOOL v14 = 1;
      if (sub_100019858(v12, v11, @"offlinedata", v10, &off_100077C18, 1))
      {
        uint64_t v18 = objc_opt_class();
        v19 = sub_100008DBC(@"offlinedata", v10, v11, v18, v12);
        v17 = v19;
        BOOL v14 = v19 != 0;
        if (v19)
        {
          [v19 setSignpostId:a6];
          [(GEOOfflineDataServer *)self checkExistenceWithRequest:v17];
          goto LABEL_21;
        }
LABEL_22:
      }
    }
  }
  else
  {
    switch(v13)
    {
      case 1831:
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"offlinedata", v10, &off_100077C30, 1))
        {
          uint64_t v20 = objc_opt_class();
          v21 = sub_100008DBC(@"offlinedata", v10, v11, v20, v12);
          v17 = v21;
          BOOL v14 = v21 != 0;
          if (v21)
          {
            [v21 setSignpostId:a6];
            [(GEOOfflineDataServer *)self fetchAvailableKeysWithRequest:v17];
            goto LABEL_21;
          }
          goto LABEL_22;
        }
        break;
      case 2065:
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"offlinedata", v10, &off_100077C48, 1))
        {
          uint64_t v22 = objc_opt_class();
          v23 = sub_100008DBC(@"offlinedata", v10, v11, v22, v12);
          v17 = v23;
          BOOL v14 = v23 != 0;
          if (v23)
          {
            [v23 setSignpostId:a6];
            [(GEOOfflineDataServer *)self fetchVersionMetadataWithRequest:v17];
            goto LABEL_21;
          }
          goto LABEL_22;
        }
        break;
      case 2288:
        uint64_t v15 = objc_opt_class();
        v16 = sub_100008DBC(@"offlinedata", v10, v11, v15, v12);
        v17 = v16;
        BOOL v14 = v16 != 0;
        if (v16)
        {
          [v16 setSignpostId:a6];
          [(GEOOfflineDataServer *)self fetchTileConfigurationWithRequest:v17];
LABEL_21:
          BOOL v14 = 1;
          goto LABEL_22;
        }
        goto LABEL_22;
    }
  }

  return v14;
}

+ (BOOL)wantsPerMessageSignposts
{
  return 0;
}

- (GEOOfflineDataServer)initWithDaemon:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineDataServer;
  v3 = [(GEOOfflineDataServer *)&v10 initWithDaemon:a3];
  if (v3)
  {
    uint64_t v4 = geo_dispatch_queue_create_with_workloop_qos();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = geo_isolater_create();
    isolater = v3->_isolater;
    v3->_isolater = (geo_isolater *)v6;

    v3->_isFeatureFlagEnabled = 1;
    v8 = v3;
  }

  return v3;
}

- (void)fetchWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOOfflineDataFetchReply) initWithRequest:v4];
  if ((sub_100025244((uint64_t)self) & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 key];

  if (!v6)
  {
    objc_super v10 = +[NSError GEOErrorWithCode:-10 reason:@"Missing key"];
    [v5 setError:v10];

LABEL_5:
    [v5 send];
    goto LABEL_6;
  }
  v7 = +[GEOOfflineDataAccess sharedInstance];
  v8 = [v4 key];
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100025428;
  v11[3] = &unk_100072060;
  id v12 = v5;
  [v7 getDataForKey:v8 callbackQueue:queue callback:v11];

LABEL_6:
}

- (void)checkExistenceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOOfflineDataCheckExistenceReply) initWithRequest:v4];
  if (sub_100025244((uint64_t)self))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000255FC;
    v13[3] = &unk_100072088;
    id v14 = v5;
    uint64_t v6 = objc_retainBlock(v13);
    unsigned int v7 = [v4 sync];
    v8 = +[GEOOfflineDataAccess sharedInstance];
    v9 = [v4 key];
    if (v7)
    {
      id v12 = 0;
      id v10 = [v8 hasDataForKey:v9 error:&v12];
      id v11 = v12;

      ((void (*)(void *, id, id))v6[2])(v6, v10, v11);
      v8 = v11;
    }
    else
    {
      [v8 hasDataForKey:v9 callbackQueue:self->_queue callback:v6];
    }
  }
  else
  {
    [v5 send];
  }
}

- (void)fetchAvailableKeysWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOOfflineDataFetchAvailableKeysReply) initWithRequest:v4];
  if (sub_100025244((uint64_t)self))
  {
    uint64_t v6 = +[GEOOfflineDataAccess sharedInstance];
    id v7 = [v4 layer];
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100025774;
    v9[3] = &unk_100071410;
    id v10 = v5;
    [v6 getAvailableKeysForLayer:v7 callbackQueue:queue callback:v9];
  }
  else
  {
    [v5 send];
  }
}

- (void)fetchVersionMetadataWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOOfflineVersionMetadataFetchReply) initWithRequest:v4];

  if (sub_100025244((uint64_t)self))
  {
    uint64_t v6 = +[GEOOfflineDataAccess sharedInstance];
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000258BC;
    v8[3] = &unk_1000720B0;
    id v9 = v5;
    [v6 getOfflineVersionMetadataWithCallbackQueue:queue callback:v8];
  }
  else
  {
    [v5 send];
  }
}

- (void)fetchTileConfigurationWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GEOOfflineTileConfigurationFetchReply) initWithRequest:v3];
  id v5 = +[GEOOfflineDataAccess sharedInstance];
  unsigned int v6 = [v3 state];

  id v9 = 0;
  id v7 = [v5 offlineTileMetadataWithState:v6 error:&v9];
  id v8 = v9;

  if (v7) {
    [v4 setConfiguration:v7];
  }
  else {
    [v4 setError:v8];
  }
  [v4 send];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_featureFlagListener, 0);
  objc_storeStrong((id *)&self->_isolater, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end