@interface BDSSyncEngineSaltManager
- (BDSSyncEngineSaltManager)initWithDatabase:(id)a3 observer:(id)a4;
- (BDSSyncEngineSaltManagerObserver)observer;
- (BOOL)establishedSalt;
- (BOOL)isSaltRefreshInProgress;
- (CKDatabase)database;
- (NSData)currentSalt;
- (NSString)currentSaltVersionIdentifier;
- (NSString)establishedSaltVersionIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_wq_saltedAndHashedIDFromLocalID:(id)a3;
- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4;
- (void)_updatedReachability;
- (void)invalidateSalt;
- (void)refreshSalt:(id)a3;
- (void)refreshSaltIfNeeded:(id)a3;
- (void)setCurrentSalt:(id)a3;
- (void)setCurrentSaltVersionIdentifier:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setIsSaltRefreshInProgress:(BOOL)a3;
- (void)setObserver:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)wq_invalidateSalt;
- (void)wq_refreshSalt:(id)a3;
@end

@implementation BDSSyncEngineSaltManager

- (BDSSyncEngineSaltManager)initWithDatabase:(id)a3 observer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BDSSyncEngineSaltManager;
  v9 = [(BDSSyncEngineSaltManager *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeWeak((id *)&v10->_observer, v8);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.BDSSyncEngineSaltManager.workQueue", v11);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v12;

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v10 selector:"_updatedReachability" name:@"kNetworkReachabilityChangedNotification" object:0];
  }
  return v10;
}

- (NSString)establishedSaltVersionIdentifier
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100056B04;
  v11 = sub_100056B14;
  id v12 = 0;
  v3 = [(BDSSyncEngineSaltManager *)self workQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100056B1C;
  v6[3] = &unk_10025F960;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)refreshSalt:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(BDSSyncEngineSaltManager *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056C5C;
  block[3] = &unk_10025FE98;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)refreshSaltIfNeeded:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(BDSSyncEngineSaltManager *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056DA0;
  block[3] = &unk_10025FE98;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)wq_refreshSalt:(id)a3
{
  id v4 = a3;
  if ([(BDSSyncEngineSaltManager *)self isSaltRefreshInProgress])
  {
    v5 = sub_1000083A0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager: Salt refresh already in progress. Ignoring -refreshSalt: call", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    [(BDSSyncEngineSaltManager *)self setIsSaltRefreshInProgress:1];
    [(BDSSyncEngineSaltManager *)self wq_invalidateSalt];
    id v6 = sub_1000083A0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager: Establishing record salt", (uint8_t *)buf, 2u);
    }

    v5 = [objc_alloc((Class)CKRecordID) initWithRecordName:@"recordIDSalt"];
    objc_initWeak(buf, self);
    uint64_t v7 = [(BDSSyncEngineSaltManager *)self database];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100057080;
    v8[3] = &unk_100261750;
    objc_copyWeak(&v10, buf);
    id v9 = v4;
    [v7 fetchRecordWithID:v5 completionHandler:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (void)invalidateSalt
{
  objc_initWeak(&location, self);
  v3 = [(BDSSyncEngineSaltManager *)self workQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100057E24;
  v4[3] = &unk_1002600A8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)wq_invalidateSalt
{
  v3 = sub_1000083A0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager: Invalidate record salt", v4, 2u);
  }

  [(BDSSyncEngineSaltManager *)self setCurrentSalt:0];
  [(BDSSyncEngineSaltManager *)self setCurrentSaltVersionIdentifier:0];
}

- (BOOL)establishedSalt
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(BDSSyncEngineSaltManager *)self workQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100057FC0;
  v5[3] = &unk_10025F960;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100056B04;
  v22 = sub_100056B14;
  id v23 = 0;
  uint64_t v8 = [(BDSSyncEngineSaltManager *)self workQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005817C;
  v13[3] = &unk_100261778;
  id v14 = v7;
  v15 = self;
  id v16 = v6;
  v17 = &v18;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (id)_wq_saltedAndHashedIDFromLocalID:(id)a3
{
  id v4 = a3;
  id v5 = [(BDSSyncEngineSaltManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(BDSSyncEngineSaltManager *)self currentSalt];
  id v7 = v6;
  if (v6)
  {
    memset(&v15, 0, sizeof(v15));
    id v8 = v6;
    CCHmacInit(&v15, 0, objc_msgSend(v8, "bytes", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0),
      (size_t)[v8 length]);
    id v9 = (const char *)[v4 UTF8String];
    size_t v10 = strlen(v9);
    CCHmacUpdate(&v15, v9, v10);
    macOut[0] = 0;
    macOut[1] = 0;
    int v17 = 0;
    CCHmacFinal(&v15, macOut);
    id v11 = +[NSData dataWithBytes:macOut length:20];
    id v12 = [v11 base64EncodedStringWithOptions:0];
  }
  else
  {
    v13 = sub_1000083A0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1001E843C();
    }

    id v12 = 0;
  }

  return v12;
}

- (void)_updatedReachability
{
  unsigned int v3 = +[BDSReachability isOffline];
  id v4 = sub_1000083A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager network reachability changed. Reachable: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  if ((v3 & 1) == 0) {
    [(BDSSyncEngineSaltManager *)self refreshSaltIfNeeded:&stru_100261798];
  }
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (BDSSyncEngineSaltManagerObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (BDSSyncEngineSaltManagerObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (NSData)currentSalt
{
  return self->_currentSalt;
}

- (void)setCurrentSalt:(id)a3
{
}

- (NSString)currentSaltVersionIdentifier
{
  return self->_currentSaltVersionIdentifier;
}

- (void)setCurrentSaltVersionIdentifier:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (BOOL)isSaltRefreshInProgress
{
  return self->_isSaltRefreshInProgress;
}

- (void)setIsSaltRefreshInProgress:(BOOL)a3
{
  self->_isSaltRefreshInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentSaltVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSalt, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_database, 0);
}

@end