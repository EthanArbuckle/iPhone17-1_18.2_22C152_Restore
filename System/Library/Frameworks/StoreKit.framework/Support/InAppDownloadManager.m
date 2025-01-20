@interface InAppDownloadManager
+ (id)manager;
- (BOOL)startDownloadWithID:(id)a3 client:(id)a4 auditToken:(id *)a5;
- (InAppDownloadManager)init;
- (id)addDownloadObserver:(id)a3;
- (id)processDownloadsForTransactions:(id)a3;
- (void)_notifyObserversDownloadStatusChanged:(id)a3;
- (void)cancelDownloadWithID:(id)a3;
- (void)pauseDownloadWithID:(id)a3;
- (void)removeDownloadObserver:(id)a3;
- (void)removeDownloadsForTransactionID:(id)a3;
@end

@implementation InAppDownloadManager

- (id)processDownloadsForTransactions:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v40 = self;
  [(NSLock *)self->_downloadLock lock];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v42;
    p_prots = &OBJC_PROTOCOL___NSURLSessionDelegate.prots;
    *(void *)&long long v7 = 138543619;
    long long v35 = v7;
    id v36 = v5;
    uint64_t v37 = *(void *)v42;
    do
    {
      v11 = 0;
      id v38 = v8;
      do
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v11);
        id v13 = objc_msgSend(v12, "mutableCopy", v35);
        v14 = objc_msgSend(v12, "tcr_numberForKey:", p_prots[113]);
        v15 = objc_msgSend(v12, "tcr_stringForKey:", @"tid");
        v16 = objc_msgSend(v12, "tcr_arrayForKey:", @"assets");
        v17 = v16;
        if (v14 && [v16 count])
        {
          v18 = [v17 firstObject];
          id v19 = [v18 mutableCopy];

          v20 = objc_msgSend(v12, "tcr_stringForKey:", off_100399560[0]);
          [v19 setObject:v20 forKeyedSubscript:off_100399560[0]];

          id v21 = objc_alloc_init((Class)NSMutableDictionary);
          v22 = [v19 objectForKeyedSubscript:@"file-size"];
          [v21 setObject:v22 forKeyedSubscript:@"hosted-content-length"];

          v23 = [v19 objectForKeyedSubscript:@"version"];
          [v21 setObject:v23 forKeyedSubscript:@"hosted-version"];

          id v49 = v21;
          v24 = +[NSArray arrayWithObjects:&v49 count:1];
          [v13 setObject:v24 forKeyedSubscript:@"assets"];

          v25 = [(NSMutableDictionary *)v40->_pendingDownloads objectForKeyedSubscript:v14];
          if (v25)
          {
            if (qword_10039F668 != -1) {
              dispatch_once(&qword_10039F668, &stru_100357598);
            }
            v26 = off_100398E60;
            if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_INFO))
            {
              v27 = v26;
              v28 = objc_opt_class();
              *(_DWORD *)buf = v35;
              v46 = v28;
              __int16 v47 = 2113;
              v48 = v14;
              id v29 = v28;
              _os_log_impl((void *)&_mh_execute_header, &v27->super, OS_LOG_TYPE_INFO, "%{public}@: Download %{private}@ already added to pending downloads", buf, 0x16u);

              goto LABEL_18;
            }
          }
          else
          {
            if (qword_10039F668 != -1) {
              dispatch_once(&qword_10039F668, &stru_100357598);
            }
            v30 = off_100398E60;
            if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_DEFAULT))
            {
              v31 = v30;
              v32 = objc_opt_class();
              *(_DWORD *)buf = v35;
              v46 = v32;
              __int16 v47 = 2113;
              v48 = v14;
              id v33 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding download %{private}@ to pending downloads", buf, 0x16u);
            }
            v27 = [[InAppDownload alloc] initWithIdentifier:v14 transactionIdentifier:v15 info:v19];
            [(NSMutableDictionary *)v40->_pendingDownloads setObject:v27 forKeyedSubscript:v14];
LABEL_18:

            id v5 = v36;
          }

          uint64_t v9 = v37;
          id v8 = v38;
          p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 16);
        }
        [v5 addObject:v13];

        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v8);
  }

  [(NSLock *)v40->_downloadLock unlock];

  return v5;
}

- (id)addDownloadObserver:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUUID UUID];
  id v6 = [v5 UUIDString];

  long long v7 = self->_observers;
  objc_sync_enter(v7);
  [(NSMapTable *)self->_observers setObject:v4 forKey:v6];
  objc_sync_exit(v7);

  return v6;
}

+ (id)manager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A724;
  block[3] = &unk_1003572F0;
  block[4] = a1;
  if (qword_10039F618 != -1) {
    dispatch_once(&qword_10039F618, block);
  }
  v2 = (void *)qword_10039F610;

  return v2;
}

- (InAppDownloadManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)InAppDownloadManager;
  v2 = [(InAppDownloadManager *)&v12 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    downloadLock = v2->_downloadLock;
    v2->_downloadLock = v3;

    id v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    downloadQueue = v2->_downloadQueue;
    v2->_downloadQueue = v5;

    [(NSOperationQueue *)v2->_downloadQueue setMaxConcurrentOperationCount:3];
    uint64_t v7 = +[NSMapTable mapTableWithKeyOptions:0x10000 valueOptions:5];
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingDownloads = v2->_pendingDownloads;
    v2->_pendingDownloads = v9;
  }
  return v2;
}

- (void)removeDownloadObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSMapTable *)self->_observers removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (BOOL)startDownloadWithID:(id)a3 client:(id)a4 auditToken:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  [(NSLock *)self->_downloadLock lock];
  uint64_t v9 = [(NSMutableDictionary *)self->_pendingDownloads objectForKeyedSubscript:v7];
  v10 = [v9 task];
  v11 = v10;
  if (!v9)
  {
    if (qword_10039F668 != -1) {
      dispatch_once(&qword_10039F668, &stru_100357598);
    }
    id v21 = off_100398E60;
    if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_ERROR)) {
      sub_1002C0E68(v21, (uint64_t)self, (uint64_t)v7);
    }
    goto LABEL_25;
  }
  if (!v10) {
    goto LABEL_15;
  }
  objc_super v12 = [(InAppDownloadTask *)v10 status];
  if (![v12 state])
  {

    goto LABEL_21;
  }
  id v13 = [(InAppDownloadTask *)v11 status];
  id v14 = [v13 state];

  if (v14 == (id)1)
  {
LABEL_21:
    if (qword_10039F668 != -1) {
      dispatch_once(&qword_10039F668, &stru_100357598);
    }
    id v29 = off_100398E60;
    if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_INFO))
    {
      v30 = v29;
      v31 = [(InAppDownloadTask *)v11 logKey];
      *(_DWORD *)buf = 138543618;
      v40 = v31;
      __int16 v41 = 2114;
      id v42 = v7;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}@] Download already started for ID %{public}@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  v15 = [(InAppDownloadTask *)v11 status];
  id v16 = [v15 state];

  if (v16 == (id)3)
  {
    if (qword_10039F668 != -1) {
      dispatch_once(&qword_10039F668, &stru_100357598);
    }
    v17 = off_100398E60;
    if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      id v19 = [(InAppDownloadTask *)v11 logKey];
      *(_DWORD *)buf = 138543618;
      v40 = v19;
      __int16 v41 = 2114;
      id v42 = v7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] Download already finished for ID %{public}@", buf, 0x16u);
    }
    v20 = [(InAppDownloadTask *)v11 status];
    [(InAppDownloadManager *)self _notifyObserversDownloadStatusChanged:v20];

LABEL_25:
    BOOL v28 = 0;
    goto LABEL_26;
  }
LABEL_15:
  v22 = [InAppDownloadTask alloc];
  v23 = [v9 info];
  v24 = [v8 callerBundleID];
  v25 = [(InAppDownloadTask *)v22 initWithDownloadID:v7 info:v23 bundleID:v24 containerID:0];

  [v9 setTask:v25];
  objc_initWeak(&location, self);
  id v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472;
  long long v35 = sub_10002AD50;
  id v36 = &unk_100357578;
  objc_copyWeak(&v37, &location);
  [(InAppDownloadTask *)v25 setStatusBlock:&v33];
  if (qword_10039F668 != -1) {
    dispatch_once(&qword_10039F668, &stru_100357598);
  }
  v26 = off_100398E60;
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [(InAppDownloadTask *)v25 logKey];
    *(_DWORD *)buf = 138543618;
    v40 = v27;
    __int16 v41 = 2114;
    id v42 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting downloads for ID %{public}@", buf, 0x16u);
  }
  [(NSOperationQueue *)self->_downloadQueue addOperation:v25];
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
  BOOL v28 = 1;
  v11 = v25;
LABEL_26:
  [(NSLock *)self->_downloadLock unlock];

  return v28;
}

- (void)cancelDownloadWithID:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_downloadLock lock];
  id v5 = [(NSMutableDictionary *)self->_pendingDownloads objectForKeyedSubscript:v4];
  id v6 = v5;
  if (!v5)
  {
    if (qword_10039F668 != -1) {
      dispatch_once(&qword_10039F668, &stru_100357598);
    }
    v15 = off_100398E60;
    if (!os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    id v14 = v15;
    *(_DWORD *)id v19 = 138543618;
    *(void *)&v19[4] = objc_opt_class();
    *(_WORD *)&v19[12] = 2114;
    *(void *)&v19[14] = v4;
    id v16 = *(id *)&v19[4];
    v17 = "%{public}@: No downloads to cancel for ID %{public}@";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, v19, 0x16u);

LABEL_18:
    goto LABEL_19;
  }
  id v7 = [v5 task];

  if (!v7)
  {
    if (qword_10039F668 != -1) {
      dispatch_once(&qword_10039F668, &stru_100357598);
    }
    v18 = off_100398E60;
    if (!os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    id v14 = v18;
    *(_DWORD *)id v19 = 138543618;
    *(void *)&v19[4] = objc_opt_class();
    *(_WORD *)&v19[12] = 2114;
    *(void *)&v19[14] = v4;
    id v16 = *(id *)&v19[4];
    v17 = "%{public}@: Download is not started for ID %{public}@";
    goto LABEL_17;
  }
  id v8 = [v6 task];
  unsigned int v9 = [v8 isExecuting];

  if (v9)
  {
    if (qword_10039F668 != -1) {
      dispatch_once(&qword_10039F668, &stru_100357598);
    }
    v10 = off_100398E60;
    if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_super v12 = [v6 task];
      id v13 = [v12 logKey];
      *(_DWORD *)id v19 = 138543618;
      *(void *)&v19[4] = v13;
      *(_WORD *)&v19[12] = 2114;
      *(void *)&v19[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancelling download for ID %{public}@", v19, 0x16u);
    }
    id v14 = [v6 task];
    [v14 cancel];
    goto LABEL_18;
  }
LABEL_19:
  [(NSLock *)self->_downloadLock unlock];
}

- (void)pauseDownloadWithID:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_downloadLock lock];
  id v5 = [(NSMutableDictionary *)self->_pendingDownloads objectForKeyedSubscript:v4];
  id v6 = v5;
  if (!v5)
  {
    if (qword_10039F668 != -1) {
      dispatch_once(&qword_10039F668, &stru_100357598);
    }
    v15 = off_100398E60;
    if (!os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    id v14 = v15;
    *(_DWORD *)id v19 = 138543618;
    *(void *)&v19[4] = objc_opt_class();
    *(_WORD *)&v19[12] = 2114;
    *(void *)&v19[14] = v4;
    id v16 = *(id *)&v19[4];
    v17 = "%{public}@: No downloads to pause for ID %{public}@";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v17, v19, 0x16u);

LABEL_18:
    goto LABEL_19;
  }
  id v7 = [v5 task];

  if (!v7)
  {
    if (qword_10039F668 != -1) {
      dispatch_once(&qword_10039F668, &stru_100357598);
    }
    v18 = off_100398E60;
    if (!os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    id v14 = v18;
    *(_DWORD *)id v19 = 138543618;
    *(void *)&v19[4] = objc_opt_class();
    *(_WORD *)&v19[12] = 2114;
    *(void *)&v19[14] = v4;
    id v16 = *(id *)&v19[4];
    v17 = "%{public}@: Download is not started for ID %{public}@";
    goto LABEL_17;
  }
  id v8 = [v6 task];
  unsigned int v9 = [v8 isExecuting];

  if (v9)
  {
    if (qword_10039F668 != -1) {
      dispatch_once(&qword_10039F668, &stru_100357598);
    }
    v10 = off_100398E60;
    if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_super v12 = [v6 task];
      id v13 = [v12 logKey];
      *(_DWORD *)id v19 = 138543618;
      *(void *)&v19[4] = v13;
      *(_WORD *)&v19[12] = 2114;
      *(void *)&v19[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pausing download for ID %{public}@", v19, 0x16u);
    }
    id v14 = [v6 task];
    [v14 pause];
    goto LABEL_18;
  }
LABEL_19:
  [(NSLock *)self->_downloadLock unlock];
}

- (void)removeDownloadsForTransactionID:(id)a3
{
  id v4 = a3;
  id v48 = objc_alloc_init((Class)NSMutableArray);
  [(NSLock *)self->_downloadLock lock];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v5 = [(NSMutableDictionary *)self->_pendingDownloads allValues];
  id v6 = [v5 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v11 = [v10 transactionIdentifier];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v13 = [v10 identifier];
          [v48 addObject:v13];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v7);
  }

  [(NSLock *)self->_downloadLock unlock];
  if ([v48 count])
  {
    if (qword_10039F668 != -1) {
      dispatch_once(&qword_10039F668, &stru_100357598);
    }
    id v14 = off_100398E60;
    if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      id v16 = objc_opt_class();
      id v17 = v16;
      id v18 = [v48 count];
      *(_DWORD *)buf = 138543875;
      v61 = v16;
      __int16 v62 = 2048;
      id v63 = v18;
      __int16 v64 = 2113;
      id v65 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing %lu downloads for transaction %{private}@", buf, 0x20u);
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v48;
    id v19 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v19)
    {
      id v21 = v19;
      uint64_t v49 = *(void *)v52;
      *(void *)&long long v20 = 138543618;
      long long v46 = v20;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v52 != v49) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v22);
          -[InAppDownloadManager cancelDownloadWithID:](self, "cancelDownloadWithID:", v23, v46);
          [(NSLock *)self->_downloadLock lock];
          v24 = [(NSMutableDictionary *)self->_pendingDownloads objectForKeyedSubscript:v23];
          [(NSMutableDictionary *)self->_pendingDownloads setObject:0 forKeyedSubscript:v23];
          [(NSLock *)self->_downloadLock unlock];
          v25 = [v24 task];
          v26 = [v25 status];
          v27 = [v26 installPath];

          if (v27)
          {
            if (qword_10039F668 != -1) {
              dispatch_once(&qword_10039F668, &stru_100357598);
            }
            BOOL v28 = off_100398E60;
            if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_DEFAULT))
            {
              id v29 = v28;
              v30 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v61 = v30;
              __int16 v62 = 2114;
              id v63 = v23;
              __int16 v64 = 2114;
              id v65 = v27;
              id v31 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing downloaded content for %{public}@ at %{public}@", buf, 0x20u);
            }
            v32 = +[NSFileManager defaultManager];
            if ([v32 fileExistsAtPath:v27])
            {
              id v50 = 0;
              [v32 removeItemAtPath:v27 error:&v50];
              id v33 = v50;
              if (v33)
              {
                if (qword_10039F668 != -1) {
                  dispatch_once(&qword_10039F668, &stru_100357598);
                }
                uint64_t v34 = off_100398E60;
                if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_ERROR))
                {
                  long long v43 = v34;
                  long long v44 = objc_opt_class();
                  *(_DWORD *)buf = 138543874;
                  v61 = v44;
                  __int16 v62 = 2114;
                  id v63 = v23;
                  __int16 v64 = 2114;
                  id v65 = v33;
                  id v45 = v44;
                  _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%{public}@: Error removing downloaded content for ID %{public}@ - %{public}@", buf, 0x20u);
                }
              }
            }
            else
            {
              if (qword_10039F668 != -1) {
                dispatch_once(&qword_10039F668, &stru_100357598);
              }
              v39 = off_100398E60;
              if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_DEFAULT))
              {
                v40 = v39;
                __int16 v41 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                v61 = v41;
                __int16 v62 = 2114;
                id v63 = v23;
                __int16 v64 = 2114;
                id v65 = v27;
                id v42 = v41;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: Downloaded content was already moved or removed for %{public}@ at %{public}@", buf, 0x20u);
              }
            }
          }
          else
          {
            if (qword_10039F668 != -1) {
              dispatch_once(&qword_10039F668, &stru_100357598);
            }
            long long v35 = off_100398E60;
            if (os_log_type_enabled((os_log_t)off_100398E60, OS_LOG_TYPE_INFO))
            {
              id v36 = v35;
              id v37 = objc_opt_class();
              *(_DWORD *)buf = v46;
              v61 = v37;
              __int16 v62 = 2114;
              id v63 = v23;
              id v38 = v37;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%{public}@: No download path to remove for ID %{public}@", buf, 0x16u);
            }
          }

          v22 = (char *)v22 + 1;
        }
        while (v21 != v22);
        id v21 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v21);
    }
  }
  [(NSLock *)self->_downloadLock unlock];
}

- (void)_notifyObserversDownloadStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = self->_observers;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSMapTable *)self->_observers objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      unsigned int v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) downloadManager:self updatedStatus:v4];
        unsigned int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDownloads, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);

  objc_storeStrong((id *)&self->_downloadLock, 0);
}

@end