@interface GEOPlaceDataServer
+ (id)identifier;
+ (unint64_t)launchMode;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOPlaceDataServer)initWithDaemon:(id)a3;
- (GEOPlaceDataServer)initWithDaemon:(id)a3 proxy:(id)a4;
- (void)_addRequestUUID:(id)a3 forPeer:(id)a4;
- (void)_removeRequestUUID:(id)a3 forPeer:(id)a4;
- (void)calculateFreeableSpaceSyncWithRequest:(id)a3;
- (void)calculateFreeableSpaceWithRequest:(id)a3;
- (void)cancelPlaceDataRequestWithRequest:(id)a3;
- (void)clearCacheWithRequest:(id)a3;
- (void)fetchAllCacheEntriesWithRequest:(id)a3;
- (void)peerDidDisconnect:(id)a3;
- (void)performPlaceDataRequestWithRequest:(id)a3;
- (void)preservePlaceDataWithRequest:(id)a3;
- (void)requestMUIDsWithRequest:(id)a3;
- (void)requestPhoneNumbersWithRequest:(id)a3;
- (void)shrinkBySizeSyncWithRequest:(id)a3;
- (void)shrinkBySizeWithRequest:(id)a3;
@end

@implementation GEOPlaceDataServer

- (void)_addRequestUUID:(id)a3 forPeer:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  geo_isolate_sync_data();
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 <= 2000)
  {
    if (v13 <= 1252)
    {
      if (v13 == 987)
      {
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"placedata", v10, &off_100077930, 1))
        {
          uint64_t v36 = objc_opt_class();
          v37 = sub_100008DBC(@"placedata", v10, v11, v36, v12);
          v17 = v37;
          BOOL v14 = v37 != 0;
          if (v37)
          {
            [v37 setSignpostId:a6];
            [(GEOPlaceDataServer *)self clearCacheWithRequest:v17];
            goto LABEL_43;
          }
          goto LABEL_44;
        }
      }
      else if (v13 == 1195)
      {
        uint64_t v22 = objc_opt_class();
        v23 = sub_100008DBC(@"placedata", v10, v11, v22, v12);
        v17 = v23;
        BOOL v14 = v23 != 0;
        if (v23)
        {
          [v23 setSignpostId:a6];
          [(GEOPlaceDataServer *)self requestMUIDsWithRequest:v17];
          goto LABEL_43;
        }
        goto LABEL_44;
      }
    }
    else
    {
      switch(v13)
      {
        case 1253:
          BOOL v14 = 1;
          if (sub_100019858(v12, v11, @"placedata", v10, &off_100077900, 1))
          {
            uint64_t v28 = objc_opt_class();
            v29 = sub_100008DBC(@"placedata", v10, v11, v28, v12);
            v17 = v29;
            BOOL v14 = v29 != 0;
            if (v29)
            {
              [v29 setSignpostId:a6];
              [(GEOPlaceDataServer *)self shrinkBySizeWithRequest:v17];
              goto LABEL_43;
            }
            goto LABEL_44;
          }
          break;
        case 1666:
          BOOL v14 = 1;
          if (sub_100019858(v12, v11, @"placedata", v10, &off_100077918, 1))
          {
            uint64_t v30 = objc_opt_class();
            v31 = sub_100008DBC(@"placedata", v10, v11, v30, v12);
            v17 = v31;
            BOOL v14 = v31 != 0;
            if (v31)
            {
              [v31 setSignpostId:a6];
              [(GEOPlaceDataServer *)self shrinkBySizeSyncWithRequest:v17];
              goto LABEL_43;
            }
            goto LABEL_44;
          }
          break;
        case 1739:
          uint64_t v18 = objc_opt_class();
          v19 = sub_100008DBC(@"placedata", v10, v11, v18, v12);
          v17 = v19;
          BOOL v14 = v19 != 0;
          if (v19)
          {
            [v19 setSignpostId:a6];
            [(GEOPlaceDataServer *)self preservePlaceDataWithRequest:v17];
            goto LABEL_43;
          }
LABEL_44:

          break;
      }
    }
  }
  else if (v13 > 2223)
  {
    switch(v13)
    {
      case 2224:
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"placedata", v10, &off_1000778D0, 1))
        {
          uint64_t v32 = objc_opt_class();
          v33 = sub_100008DBC(@"placedata", v10, v11, v32, v12);
          v17 = v33;
          BOOL v14 = v33 != 0;
          if (v33)
          {
            [v33 setSignpostId:a6];
            [(GEOPlaceDataServer *)self calculateFreeableSpaceWithRequest:v17];
            goto LABEL_43;
          }
          goto LABEL_44;
        }
        break;
      case 2371:
        uint64_t v34 = objc_opt_class();
        v35 = sub_100008DBC(@"placedata", v10, v11, v34, v12);
        v17 = v35;
        BOOL v14 = v35 != 0;
        if (v35)
        {
          [v35 setSignpostId:a6];
          [(GEOPlaceDataServer *)self performPlaceDataRequestWithRequest:v17];
          goto LABEL_43;
        }
        goto LABEL_44;
      case 2637:
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"placedata", v10, &off_1000778E8, 1))
        {
          uint64_t v20 = objc_opt_class();
          v21 = sub_100008DBC(@"placedata", v10, v11, v20, v12);
          v17 = v21;
          BOOL v14 = v21 != 0;
          if (v21)
          {
            [v21 setSignpostId:a6];
            [(GEOPlaceDataServer *)self calculateFreeableSpaceSyncWithRequest:v17];
            goto LABEL_43;
          }
          goto LABEL_44;
        }
        break;
    }
  }
  else
  {
    switch(v13)
    {
      case 2001:
        BOOL v14 = 1;
        if (sub_100019858(v12, v11, @"placedata", v10, &off_1000778B8, 1))
        {
          uint64_t v24 = objc_opt_class();
          v25 = sub_100008DBC(@"placedata", v10, v11, v24, v12);
          v17 = v25;
          BOOL v14 = v25 != 0;
          if (v25)
          {
            [v25 setSignpostId:a6];
            [(GEOPlaceDataServer *)self fetchAllCacheEntriesWithRequest:v17];
            goto LABEL_43;
          }
          goto LABEL_44;
        }
        break;
      case 2015:
        uint64_t v26 = objc_opt_class();
        v27 = sub_100008DBC(@"placedata", v10, v11, v26, v12);
        v17 = v27;
        BOOL v14 = v27 != 0;
        if (v27)
        {
          [v27 setSignpostId:a6];
          [(GEOPlaceDataServer *)self requestPhoneNumbersWithRequest:v17];
          goto LABEL_43;
        }
        goto LABEL_44;
      case 2222:
        uint64_t v15 = objc_opt_class();
        v16 = sub_100008DBC(@"placedata", v10, v11, v15, v12);
        v17 = v16;
        BOOL v14 = v16 != 0;
        if (v16)
        {
          [v16 setSignpostId:a6];
          [(GEOPlaceDataServer *)self cancelPlaceDataRequestWithRequest:v17];
LABEL_43:
          BOOL v14 = 1;
          goto LABEL_44;
        }
        goto LABEL_44;
    }
  }

  return v14;
}

- (void)_removeRequestUUID:(id)a3 forPeer:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  geo_isolate_sync_data();
}

- (void)performPlaceDataRequestWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOPlaceReplyMessage) initWithRequest:v4];
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [v4 request];
    *(_DWORD *)buf = 134217984;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Received place data request: %p", buf, 0xCu);
  }
  uint64_t v8 = [v4 request];
  if (v8
    && (v9 = (void *)v8,
        [v4 traits],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    id v11 = [v4 requestUUID];
    id v12 = [v4 peer];
    [(GEOPlaceDataServer *)self _addRequestUUID:v11 forPeer:v12];

    placeDataProxy = self->_placeDataProxy;
    int v13 = [v4 request];
    BOOL v14 = [v4 requestUUID];
    uint64_t v15 = [v4 traits];
    id v16 = [v4 cachePolicy];
    [v4 timeout];
    double v18 = v17;
    v19 = [v4 preferredAuditToken];
    uint64_t v20 = [v4 throttleToken];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000712C;
    v23[3] = &unk_100071398;
    v23[4] = self;
    id v24 = v4;
    id v25 = v5;
    [(GEOPlaceDataLocalProxy *)placeDataProxy performPlaceDataRequest:v13 requestUUID:v14 traits:v15 cachePolicy:v16 timeout:v19 auditToken:v20 throttleToken:v18 requesterHandler:v23];
  }
  else
  {
    v21 = +[NSError GEOErrorWithCode:-10 reason:@"Missign request or traits"];
    [v5 setError:v21];

    [v5 send];
  }
}

- (void)peerDidDisconnect:(id)a3
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10000AB58;
  id v24 = sub_10000AB68;
  id v25 = 0;
  int v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_100005E84;
  id v16 = &unk_100071370;
  v19 = &v20;
  double v17 = self;
  id v4 = a3;
  id v18 = v4;
  geo_isolate_sync_data();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = (id)v21[5];
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        -[GEOPlaceDataLocalProxy cancelRequest:](self->_placeDataProxy, "cancelRequest:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v26 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v20, 8);
}

+ (id)identifier
{
  return @"placedata";
}

- (GEOPlaceDataServer)initWithDaemon:(id)a3
{
  id v4 = a3;
  id v5 = +[GEOPlaceDataLocalProxy shared];
  id v6 = [(GEOPlaceDataServer *)self initWithDaemon:v4 proxy:v5];

  return v6;
}

- (GEOPlaceDataServer)initWithDaemon:(id)a3 proxy:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOPlaceDataServer;
  uint64_t v8 = [(GEOPlaceDataServer *)&v16 initWithDaemon:a3];
  long long v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  if (v7)
  {
    objc_storeStrong((id *)&v8->_placeDataProxy, a4);
    long long v10 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:512 capacity:5];
    peerToRequestUUID = v9->_peerToRequestUUID;
    v9->_peerToRequestUUID = v10;

    uint64_t v12 = geo_isolater_create();
    peerToRequestUUIDIsolater = v9->_peerToRequestUUIDIsolater;
    v9->_peerToRequestUUIDIsolater = (geo_isolater *)v12;

LABEL_4:
    uint64_t v14 = v9;
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10004CC20();
  }
  uint64_t v14 = 0;
LABEL_5:

  return v14;
}

- (void)requestMUIDsWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOPlaceByIdentifiersReply) initWithRequest:v4];
  id v6 = [v4 identifiers];
  id v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [v4 requestUUID];
    long long v9 = [v4 peer];
    [(GEOPlaceDataServer *)self _addRequestUUID:v8 forPeer:v9];

    placeDataProxy = self->_placeDataProxy;
    long long v10 = [v4 identifiers];
    unsigned int v17 = [v4 resultProvider];
    long long v11 = [v4 requestUUID];
    uint64_t v12 = [v4 traits];
    id v13 = [v4 options];
    uint64_t v14 = [v4 preferredAuditToken];
    uint64_t v15 = [v4 throttleToken];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000AD8C;
    v19[3] = &unk_100071398;
    v19[4] = self;
    id v20 = v4;
    id v21 = v5;
    [(GEOPlaceDataLocalProxy *)placeDataProxy requestIdentifiers:v10 resultProviderID:v17 requestUUID:v11 traits:v12 options:v13 auditToken:v14 throttleToken:v15 requesterHandler:v19];
  }
  else
  {
    objc_super v16 = +[NSError GEOErrorWithCode:-10 reason:@"Empty list of Identifiers"];
    [v5 setError:v16];

    [v5 send];
  }
}

- (void)requestPhoneNumbersWithRequest:(id)a3
{
  id v4 = a3;
  id v27 = [objc_alloc((Class)GEOPlaceByPhoneNumberReply) initWithRequest:v4];
  id v5 = [v4 phoneNumbers];
  id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = [v4 phoneNumbers];
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        if (![*(id *)(*((void *)&v31 + 1) + 8 * (void)v11) length]
          || (uint64_t v12 = GEOCreatePhoneNumberForStringRepresentation()) == 0)
        {
          uint64_t v12 = +[NSNull null];
        }
        id v13 = (void *)v12;
        [v6 addObject:v12];

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v9);
  }

  uint64_t v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [v4 peer];
    objc_super v16 = [v15 bundleIdentifier];
    *(_DWORD *)buf = 138478083;
    uint64_t v36 = v6;
    __int16 v37 = 2113;
    v38 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Request for phone numbers: %{private}@ by bundle identifier: %{private}@", buf, 0x16u);
  }
  id v17 = [v4 allowCellular];
  id v18 = [v4 requestUUID];
  v19 = [v4 peer];
  [(GEOPlaceDataServer *)self _addRequestUUID:v18 forPeer:v19];

  placeDataProxy = self->_placeDataProxy;
  id v21 = [v4 requestUUID];
  uint64_t v22 = [v4 traits];
  v23 = [v4 preferredAuditToken];
  id v24 = [v4 throttleToken];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000B24C;
  v28[3] = &unk_100071398;
  v28[4] = self;
  id v29 = v4;
  id v30 = v27;
  id v25 = v27;
  id v26 = v4;
  [(GEOPlaceDataLocalProxy *)placeDataProxy requestPhoneNumbers:v6 requestUUID:v21 allowCellularDataForLookup:v17 traits:v22 auditToken:v23 throttleToken:v24 requesterHandler:v28];
}

- (void)fetchAllCacheEntriesWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOPlaceFetchCacheReply) initWithRequest:v4];

  placeDataProxy = self->_placeDataProxy;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B474;
  v8[3] = &unk_1000713C0;
  id v9 = v5;
  id v7 = v5;
  [(GEOPlaceDataLocalProxy *)placeDataProxy fetchAllCacheEntriesWithRequesterHandler:v8];
}

- (void)preservePlaceDataWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOPlaceCachePlaceReply) initWithRequest:v4];
  id v6 = [v4 place];

  if (v6)
  {
    placeDataProxy = self->_placeDataProxy;
    id v8 = [v4 place];
    [(GEOPlaceDataLocalProxy *)placeDataProxy trackPlaceData:v8];

    id v9 = objc_alloc((Class)GEOMapItemIdentifier);
    uint64_t v10 = [v4 place];
    id v11 = [v9 initWithPlace:v10];
    id v14 = v11;
    uint64_t v12 = +[NSArray arrayWithObjects:&v14 count:1];
    [v5 setIdentifiers:v12];
  }
  else
  {
    id v13 = +[NSError GEOErrorWithCode:-10 reason:@"Missing place"];
    [v5 setError:v13];
  }
  [v5 send];
}

- (void)cancelPlaceDataRequestWithRequest:(id)a3
{
  id v9 = a3;
  id v4 = [v9 requestUUID];

  if (v4)
  {
    id v5 = [v9 requestUUID];
    id v6 = [v9 peer];
    [(GEOPlaceDataServer *)self _removeRequestUUID:v5 forPeer:v6];

    placeDataProxy = self->_placeDataProxy;
    id v8 = [v9 requestUUID];
    [(GEOPlaceDataLocalProxy *)placeDataProxy cancelRequest:v8];
  }
}

- (void)calculateFreeableSpaceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOPlaceCalculateFreeableSpaceReply) initWithRequest:v4];

  placeDataProxy = self->_placeDataProxy;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B7E0;
  v8[3] = &unk_1000713E8;
  id v9 = v5;
  id v7 = v5;
  [(GEOPlaceDataLocalProxy *)placeDataProxy calculateFreeableSpaceWithHandler:v8];
}

- (void)calculateFreeableSpaceSyncWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOPlaceCalculateFreeableSpaceReply) initWithRequest:v4];

  objc_msgSend(v5, "setFreeableBytes:", -[GEOPlaceDataLocalProxy calculateFreeableSpaceSync](self->_placeDataProxy, "calculateFreeableSpaceSync"));
  [v5 send];
}

- (void)shrinkBySizeWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)GEOPlaceFreeSpaceReply) initWithRequest:v4];
  placeDataProxy = self->_placeDataProxy;
  id v7 = [v4 freeBytes];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B98C;
  v9[3] = &unk_1000713E8;
  id v10 = v5;
  id v8 = v5;
  [(GEOPlaceDataLocalProxy *)placeDataProxy shrinkBySize:v7 finished:v9];
}

- (void)shrinkBySizeSyncWithRequest:(id)a3
{
  id v4 = a3;
  id v7 = [objc_alloc((Class)GEOPlaceFreeSpaceReply) initWithRequest:v4];
  placeDataProxy = self->_placeDataProxy;
  id v6 = [v4 freeBytes];

  objc_msgSend(v7, "setFreedBytes:", -[GEOPlaceDataLocalProxy shrinkBySizeSync:](placeDataProxy, "shrinkBySizeSync:", v6));
  [v7 send];
}

- (void)clearCacheWithRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeDataProxy, 0);
  objc_storeStrong((id *)&self->_peerToRequestUUID, 0);

  objc_storeStrong((id *)&self->_peerToRequestUUIDIsolater, 0);
}

+ (unint64_t)launchMode
{
  return 1;
}

@end