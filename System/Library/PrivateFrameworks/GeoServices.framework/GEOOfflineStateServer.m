@interface GEOOfflineStateServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOOfflineStateServer)initWithDaemon:(id)a3;
- (void)_suggestedOfflineStateChanged:(id)a3;
- (void)checkConnectivityWithMessage:(id)a3;
- (void)dealloc;
- (void)fetchStateWithRequest:(id)a3;
- (void)peerDidDisconnect:(id)a3;
- (void)setStateWithRequest:(id)a3;
- (void)subscribeWithRequest:(id)a3;
@end

@implementation GEOOfflineStateServer

+ (id)identifier
{
  return @"offlinestate";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 > 1034)
  {
    if (v13 == 1789)
    {
      id v22 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v17 = v22;
      BOOL v14 = v22 != 0;
      if (v22)
      {
        [v22 setSignpostId:a6];
        [(GEOOfflineStateServer *)self checkConnectivityWithMessage:v17];
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    if (v13 == 1035)
    {
      uint64_t v18 = objc_opt_class();
      v19 = sub_100008DBC(@"offlinestate", v10, v11, v18, v12);
      v17 = v19;
      BOOL v14 = v19 != 0;
      if (v19)
      {
        [v19 setSignpostId:a6];
        [(GEOOfflineStateServer *)self fetchStateWithRequest:v17];
        goto LABEL_14;
      }
LABEL_15:
    }
  }
  else
  {
    if (v13 == 845)
    {
      uint64_t v20 = objc_opt_class();
      v21 = sub_100008DBC(@"offlinestate", v10, v11, v20, v12);
      v17 = v21;
      BOOL v14 = v21 != 0;
      if (v21)
      {
        [v21 setSignpostId:a6];
        [(GEOOfflineStateServer *)self setStateWithRequest:v17];
        goto LABEL_14;
      }
      goto LABEL_15;
    }
    if (v13 == 962)
    {
      uint64_t v15 = objc_opt_class();
      v16 = sub_100008DBC(@"offlinestate", v10, v11, v15, v12);
      v17 = v16;
      BOOL v14 = v16 != 0;
      if (v16)
      {
        [v16 setSignpostId:a6];
        [(GEOOfflineStateServer *)self subscribeWithRequest:v17];
LABEL_14:
        BOOL v14 = 1;
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }

  return v14;
}

- (GEOOfflineStateServer)initWithDaemon:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineStateServer;
  v3 = [(GEOOfflineStateServer *)&v10 initWithDaemon:a3];
  if (v3)
  {
    uint64_t v4 = geo_isolater_create();
    peersIsolater = v3->_peersIsolater;
    v3->_peersIsolater = (geo_isolater *)v4;

    uint64_t v6 = +[NSMutableDictionary dictionaryWithCapacity:10];
    peerHelpers = v3->_peerHelpers;
    v3->_peerHelpers = (NSMutableDictionary *)v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v3 selector:"_suggestedOfflineStateChanged:" name:GEOOfflineSuggestedStateChangedNotification object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GEOOfflineStateServer;
  [(GEOOfflineStateServer *)&v4 dealloc];
}

- (void)fetchStateWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 preferredAuditToken];
  uint64_t v6 = [v5 offlineCohortId];

  id v7 = [objc_alloc((Class)GEOOfflineServiceStateFetchStateReply) initWithRequest:v4];
  if ([v6 length])
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    int v13 = self;
    id v8 = v6;
    id v15 = v4;
    geo_isolate_sync_data();
    if (*((unsigned char *)v18 + 24))
    {
      v9 = +[GEOOfflineStateManager shared];
      objc_msgSend(v7, "setCurrentSuggestedState:", objc_msgSend(v9, "currentSuggestedStateForCohortId:", v8));
    }
    else
    {
      objc_msgSend(v7, "setCurrentSuggestedState:", 0, _NSConcreteStackBlock, 3221225472, sub_10001F8B8, &unk_100071CC0, v13, v8, v15, &v17);
    }
    id v11 = +[GEOOfflineStateManager shared];
    objc_msgSend(v7, "setCurrentState:", objc_msgSend(v11, "currentStateForCohortId:", v8));

    id v12 = +[GEOOfflineStateManager shared];
    objc_msgSend(v7, "setSavedState:", objc_msgSend(v12, "savedStateForCohortId:", v8));

    [v7 send];
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    objc_super v10 = +[NSError GEOErrorWithCode:-10 reason:@"Invalid cohort id"];
    [v7 setError:v10];

    [v7 send];
  }
}

- (void)subscribeWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 preferredAuditToken];
  uint64_t v6 = [v5 offlineCohortId];

  id v7 = [objc_alloc((Class)GEOOfflineServiceStateSubscribeReply) initWithRequest:v4];
  if ([v6 length])
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_10002018C;
    v30 = sub_10002019C;
    id v31 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_10002018C;
    v24 = sub_10002019C;
    id v25 = 0;
    if ([v4 subscribe])
    {
      id v8 = [v4 peer];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000201A4;
      v15[3] = &unk_100071CE8;
      id v16 = v7;
      uint64_t v17 = &v32;
      uint64_t v18 = &v26;
      uint64_t v19 = &v20;
      sub_100020248(self, v8, v6, v15);
    }
    else
    {
      [v7 setSubscribed:0];
      id v10 = v6;
      id v14 = v4;
      geo_isolate_sync_data();
      *((unsigned char *)v33 + 24) = v27[5] != 0;
      id v11 = GEOGetOfflineServiceLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = v21[5];
        uint64_t v13 = v27[5];
        *(_DWORD *)buf = 138543874;
        id v37 = v10;
        __int16 v38 = 2114;
        uint64_t v39 = v12;
        __int16 v40 = 2114;
        uint64_t v41 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "via unsubscribe: cohort %{public}@ ownership will switch from %{public}@ -> %{public}@", buf, 0x20u);
      }
    }
    [v7 send];
    sub_100020A14(v27[5], *((unsigned char *)v33 + 24));
    sub_100020A14(v21[5], 0);
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v9 = +[NSError GEOErrorWithCode:-10 reason:@"Invalid cohort id"];
    [v7 setError:v9];

    [v7 send];
  }
}

- (void)setStateWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 preferredAuditToken];
  uint64_t v6 = [v5 offlineCohortId];

  id v7 = [objc_alloc((Class)GEOOfflineServiceSetStateReply) initWithRequest:v4];
  if ([v6 length])
  {
    uint64_t v8 = sub_100020B4C(self, v6);
    if (v8)
    {
      v9 = (void *)v8;
      id WeakRetained = objc_loadWeakRetained((id *)(v8 + 24));

      if (WeakRetained)
      {
        id v11 = [v4 peer];

        if (WeakRetained != v11)
        {
          uint64_t v12 = GEOGetOfflineServiceLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = [v4 peer];
            int v19 = 138543618;
            uint64_t v20 = v6;
            __int16 v21 = 2114;
            uint64_t v22 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Non-active peer attempted to set the offline state for %{public}@ - %{public}@", (uint8_t *)&v19, 0x16u);
          }
          CFStringRef v14 = @"Not currently subscribed peer";
          goto LABEL_13;
        }
      }
    }
    else
    {
      id WeakRetained = 0;
    }
    if ([v6 length])
    {
      id v16 = +[GEOOfflineStateManager shared];
      objc_msgSend(v16, "setState:savedState:forCohortId:", objc_msgSend(v4, "state"), objc_msgSend(v4, "savedState"), v6);

      [v7 send];
      uint64_t v17 = [v4 peer];
      sub_100021AAC((uint64_t)self, v17, v6);

LABEL_14:
      goto LABEL_15;
    }
    CFStringRef v14 = @"Invalid cohort id";
LABEL_13:
    uint64_t v18 = +[NSError GEOErrorWithCode:-10 reason:v14];
    [v7 setError:v18];

    [v7 send];
    goto LABEL_14;
  }
  id v15 = +[NSError GEOErrorWithCode:-10 reason:@"Invalid cohort id"];
  [v7 setError:v15];

  [v7 send];
LABEL_15:
}

- (void)checkConnectivityWithMessage:(id)a3
{
  id v4 = a3;
  v5 = [v4 preferredAuditToken];
  uint64_t v6 = [v5 offlineCohortId];

  if (![v6 length])
  {
    CFStringRef v11 = @"Invalid cohort id";
LABEL_8:
    v9 = +[NSError GEOErrorWithCode:-10 reason:v11];
    id v10 = +[NSDictionary _geo_replyDictionaryForError:v9 key:@"err"];
    [v4 sendReply:v10];
    goto LABEL_9;
  }
  id v7 = [v4 peer];
  BOOL v8 = sub_100020ADC((BOOL)self, v7, v6);

  if (!v8)
  {
    uint64_t v12 = GEOGetOfflineServiceLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v4 peer];
      int v14 = 138543618;
      id v15 = v6;
      __int16 v16 = 2114;
      uint64_t v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Non-active peer attempted to check the connectivity for %{public}@ - %{public}@", (uint8_t *)&v14, 0x16u);
    }
    CFStringRef v11 = @"Not currently subscribed peer";
    goto LABEL_8;
  }
  v9 = +[GEOOfflineStateManager shared];
  id v10 = [v4 peer];
  [v9 checkConnectivityForPeer:v10];
LABEL_9:
}

- (void)_suggestedOfflineStateChanged:(id)a3
{
  id v5 = [a3 object];
  id v4 = sub_100020B4C(self, v5);
  sub_100021EF8((uint64_t)v4);
}

- (void)peerDidDisconnect:(id)a3
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = sub_10002018C;
  BOOL v8 = sub_10002019C;
  id v9 = 0;
  id v3 = a3;
  geo_isolate_sync_data();
  sub_100020A14(v5[5], 1);

  _Block_object_dispose(&v4, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerHelpers, 0);

  objc_storeStrong((id *)&self->_peersIsolater, 0);
}

@end