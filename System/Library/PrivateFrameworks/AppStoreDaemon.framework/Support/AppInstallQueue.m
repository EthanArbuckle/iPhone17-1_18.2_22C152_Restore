@interface AppInstallQueue
- (AppInstallQueue)init;
- (void)coordinatorPromiseDataConsumer:(id)a3 willBeginUsingPromise:(id)a4 forReference:(id)a5;
- (void)finishInstallID:(int64_t)a3 transaction:(id)a4;
- (void)finishPostProcessingForID:(int64_t)a3 transaction:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startInstallIDs:(id)a3 transaction:(id)a4;
- (void)startPostProcessingForID:(int64_t)a3 transaction:(id)a4;
- (void)stopInstallID:(int64_t)a3 withReason:(int64_t)a4 transaction:(id)a5;
@end

@implementation AppInstallQueue

- (AppInstallQueue)init
{
  v16.receiver = self;
  v16.super_class = (Class)AppInstallQueue;
  v2 = [(AppInstallQueue *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.AppInstallQueue", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v6;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    requestLookup = v2->_requestLookup;
    v2->_requestLookup = v8;

    uint64_t v10 = sub_1003E0BA4();
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = (AppInstallsDatabaseStore *)v10;

    uint64_t v12 = sub_1003930B8();
    assetSession = v2->_assetSession;
    v2->_assetSession = (AssetSession *)v12;

    id v14 = +[InstallCoordinationObserver sharedInstance];
  }
  return v2;
}

- (void)finishInstallID:(int64_t)a3 transaction:(id)a4
{
  id v15 = a4;
  v6 = +[NSNumber numberWithLongLong:a3];
  v7 = sub_10041E684((uint64_t)AppInstallInfo, v6);

  if (!v7)
  {
    v8 = [AppInstallEntity alloc];
    v9 = [v15 connection];
    uint64_t v10 = [(SQLiteEntity *)v8 initWithPersistentID:a3 onConnection:v9];

    v11 = sub_10041E29C();
    uint64_t v12 = [(SQLiteEntity *)v10 getValuesForProperties:v11];

    v13 = [AppInstallInfo alloc];
    id v14 = +[NSNumber numberWithLongLong:a3];
    v7 = sub_10041E360(v13, v14, v12);

    sub_10041E510((uint64_t)AppInstallInfo, v7);
  }
  sub_100417CD0((uint64_t)self, v7, v15);
}

- (void)finishPostProcessingForID:(int64_t)a3 transaction:(id)a4
{
  id v15 = a4;
  v6 = +[NSNumber numberWithLongLong:a3];
  v7 = sub_10041E684((uint64_t)AppInstallInfo, v6);

  if (!v7)
  {
    v8 = [AppInstallEntity alloc];
    v9 = [v15 connection];
    uint64_t v10 = [(SQLiteEntity *)v8 initWithPersistentID:a3 onConnection:v9];

    v11 = sub_10041E29C();
    uint64_t v12 = [(SQLiteEntity *)v10 getValuesForProperties:v11];

    v13 = [AppInstallInfo alloc];
    id v14 = +[NSNumber numberWithLongLong:a3];
    v7 = sub_10041E360(v13, v14, v12);

    sub_10041E510((uint64_t)AppInstallInfo, v7);
  }
  sub_100417CD0((uint64_t)self, v7, v15);
}

- (void)startInstallIDs:(id)a3 transaction:(id)a4
{
  id v6 = a3;
  id v25 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v14 = sub_10041E684((uint64_t)AppInstallInfo, v13);
        if (v14)
        {
          id v15 = ASDLogHandleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v17 = self;
            id v18 = objc_getProperty(v14, v16, 80, 1);
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%@]: Skipping start, appears to already be running", (uint8_t *)&buf, 0xCu);

            self = v17;
          }
        }
        else
        {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  v19 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"ROWID" values:v7];
  id v20 = v25;
  if (self)
  {
    id v21 = v19;
    v22 = [v20 connection];
    v23 = sub_1002FF548((uint64_t)AppInstallEntity, v22, v21);

    v24 = sub_10041E29C();
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v32 = sub_100419B9C;
    v33 = &unk_100528D18;
    id v34 = v20;
    v35 = self;
    [v23 enumeratePersistentIDsAndProperties:v24 usingBlock:&buf];
  }
}

- (void)startPostProcessingForID:(int64_t)a3 transaction:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithLongLong:a3];
  id v8 = sub_10041E684((uint64_t)AppInstallInfo, v7);

  if (!v8)
  {
    id v9 = [AppInstallEntity alloc];
    id v10 = [v6 connection];
    uint64_t v11 = [(SQLiteEntity *)v9 initWithPersistentID:a3 onConnection:v10];

    uint64_t v12 = sub_10041E29C();
    v13 = [(SQLiteEntity *)v11 getValuesForProperties:v12];

    id v14 = [AppInstallInfo alloc];
    id v15 = +[NSNumber numberWithLongLong:a3];
    id v8 = sub_10041E360(v14, v15, v13);

    sub_10041E510((uint64_t)AppInstallInfo, v8);
  }
  objc_super v16 = v8;
  long long v28 = v6;
  if (self)
  {
    v17 = ASDLogHandleForCategory();
    id v18 = v17;
    if (v16)
    {
      os_signpost_id_t v19 = v16[13];
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        id v21 = objc_getProperty(v16, v20, 80, 1);
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v21;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v19, "Install/PostProcess", " uuid=%{public, signpost.description:attribute}@ ", (uint8_t *)&buf, 0xCu);
      }
    }

    v22 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      if (v16) {
        id Property = objc_getProperty(v16, v23, 80, 1);
      }
      else {
        id Property = 0;
      }
      id v25 = Property;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%@] Beginning post-processing of install", (uint8_t *)&buf, 0xCu);
    }
    if (v16)
    {
      sub_100238B14(v28, 45, v16[8]);
      uint64_t v26 = v16[8];
    }
    else
    {
      sub_100238B14(v28, 45, 0);
      uint64_t v26 = 0;
    }
    long long v27 = sub_10038E558((uint64_t)AppInstallPostProcessTask, v26, v28);
    objc_initWeak(&location, v27);
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v31 = sub_100419A0C;
    v32 = &unk_100527140;
    objc_copyWeak(v34, &location);
    v33 = self;
    [v27 setCompletionBlock:&buf];
    [(NSOperationQueue *)self->_operationQueue addOperation:v27];
    objc_destroyWeak(v34);
    objc_destroyWeak(&location);
  }
}

- (void)stopInstallID:(int64_t)a3 withReason:(int64_t)a4 transaction:(id)a5
{
  v5 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3, a4, a5);
  sub_10041E684((uint64_t)AppInstallInfo, v5);
  selfa = (id *)objc_claimAutoreleasedReturnValue();

  id v6 = selfa;
  if (selfa)
  {
    id WeakRetained = objc_loadWeakRetained(selfa + 11);

    if (WeakRetained)
    {
      id v9 = objc_loadWeakRetained(selfa + 11);
      [v9 cancel];
    }
    id v10 = objc_getProperty(selfa, v8, 16, 1);

    if (v10)
    {
      id v12 = objc_getProperty(selfa, v11, 16, 1);
      [v12 cancel];
    }
    sub_10041E5DC((uint64_t)AppInstallInfo, selfa);
    id v6 = selfa;
  }
}

- (void)coordinatorPromiseDataConsumer:(id)a3 willBeginUsingPromise:(id)a4 forReference:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v7 && v8)
  {
    databaseStore = self->_databaseStore;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100418AD8;
    v12[3] = &unk_100522AB8;
    v13 = v8;
    id v14 = v7;
    [(AppInstallsDatabaseStore *)databaseStore modifyUsingTransaction:v12];

    uint64_t v11 = v13;
  }
  else
  {
    uint64_t v11 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      id v16 = v7;
      __int16 v17 = 2114;
      id v18 = v9;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"AppInstallExternalID"];
    if (v8)
    {
      [v6 fractionCompleted];
      double v10 = v9;
      v17[0] = @"kind";
      v17[1] = @"identifier";
      *(void *)long long buf = @"progress";
      os_signpost_id_t v19 = v8;
      v17[2] = @"fraction";
      id v11 = v8;
      id v12 = +[NSNumber numberWithDouble:v10];
      id v20 = v12;
      v13 = +[NSDictionary dictionaryWithObjects:buf forKeys:v17 count:3];

      id v14 = v13;
      id v15 = +[NSNotificationCenter defaultCenter];
      id v16 = +[NSSet setWithObject:v14];

      [v15 postNotificationName:@"LegacyNotifications" object:v16];
    }
    else
    {
      id v14 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Skipping legacy progress notification because we don't have an identifier for it.", buf, 2u);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestLookup, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_databaseStore, 0);
  objc_storeStrong((id *)&self->_assetSession, 0);
}

@end