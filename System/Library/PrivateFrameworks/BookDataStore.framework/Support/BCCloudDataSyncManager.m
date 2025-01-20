@interface BCCloudDataSyncManager
- (BCCloudDataMapper)dataMapper;
- (BCCloudDataSyncManager)initWithCloudKitController:(id)a3;
- (BCCloudDataSyncManager)initWithCloudKitController:(id)a3 dataMapper:(id)a4;
- (BCCloudDataSyncManagerDelegate)delegate;
- (BCCloudKitController)cloudKitController;
- (BOOL)processingCloudData;
- (BOOL)serverPushPostponed;
- (OS_dispatch_queue)syncQueue;
- (double)backOffInterval;
- (id)_batchFromCloudData:(id)a3;
- (id)_modifyRecordsCompletionBlockWithDispatchGroup:(id)a3 cloudDataMap:(id)a4 recordCount:(unint64_t)a5 operation:(id)a6;
- (id)privacyDelegate;
- (unint64_t)_maxCloudDataPerBatch;
- (unint64_t)tooBigBatch;
- (void)_enterDispatchGroup:(id)a3 times:(unint64_t)a4;
- (void)_fromBatch:(id)a3 getRecordsToSave:(id *)a4 recordIDsToDelete:(id *)a5 buildingMap:(id *)a6;
- (void)_leaveDispatchGroup:(id)a3 times:(unint64_t)a4;
- (void)_syncQueueSyncForCloudData:(id)a3 completion:(id)a4;
- (void)_updateRetryParametersFromModifyRecordsOperationError:(id)a3 batchSize:(unint64_t)a4;
- (void)databaseController:(id)a3 attachmentChanged:(BOOL)a4;
- (void)databaseController:(id)a3 fetchedAllRecordsInZone:(id)a4;
- (void)databaseController:(id)a3 reachabilityChanged:(BOOL)a4;
- (void)databaseController:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)databaseController:(id)a3 recordsChanged:(id)a4;
- (void)fetchRecordForRecordID:(id)a3 completion:(id)a4;
- (void)setBackOffInterval:(double)a3;
- (void)setCloudKitController:(id)a3;
- (void)setDataMapper:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProcessingCloudData:(BOOL)a3;
- (void)setServerPushPostponed:(BOOL)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTooBigBatch:(unint64_t)a3;
- (void)signalSyncToCK;
- (void)startSyncToCKWithCompletion:(id)a3;
- (void)syncCloudData:(id)a3 completion:(id)a4;
@end

@implementation BCCloudDataSyncManager

- (BCCloudDataSyncManager)initWithCloudKitController:(id)a3
{
  return [(BCCloudDataSyncManager *)self initWithCloudKitController:a3 dataMapper:0];
}

- (BCCloudDataSyncManager)initWithCloudKitController:(id)a3 dataMapper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BCCloudDataSyncManager;
  v9 = [(BCCloudDataSyncManager *)&v15 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.iBooks.CloudDataSyncManager", v11);
    syncQueue = v9->_syncQueue;
    v9->_syncQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_cloudKitController, a3);
    objc_storeStrong((id *)&v9->_dataMapper, a4);
    v9->_tooBigBatch = 400;
  }
  return v9;
}

- (void)syncCloudData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(BCCloudDataSyncManager *)self cloudKitController];
  v9 = [v8 privateCloudDatabaseController];

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004D9B0;
    v12[3] = &unk_100261388;
    v12[4] = self;
    objc_copyWeak(&v15, &location);
    id v13 = v6;
    id v14 = v7;
    [v9 getAttached:v12];

    objc_destroyWeak(&v15);
  }
  else
  {
    id v10 = objc_retainBlock(v7);
    v11 = v10;
    if (v10) {
      (*((void (**)(id))v10 + 2))(v10);
    }
  }
  objc_destroyWeak(&location);
}

- (void)fetchRecordForRecordID:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(BCCloudDataSyncManager *)self cloudKitController];
  id v8 = [v7 privateCloudDatabaseController];

  if (v8)
  {
    [v8 fetchRecordForRecordID:v10 completion:v6];
  }
  else
  {
    v9 = (void (**)(id, void))objc_retainBlock(v6);

    if (v9) {
      v9[2](v9, 0);
    }
    id v6 = v9;
  }
}

- (void)databaseController:(id)a3 attachmentChanged:(BOOL)a4
{
  if (a4)
  {
    id v8 = [(BCCloudDataSyncManager *)self cloudKitController];
    v5 = [v8 transactionManager];
    id v6 = [(BCCloudDataSyncManager *)self delegate];
    id v7 = [v6 entityName];
    [v5 signalSyncToCKTransactionForEntityName:v7 syncManager:self];
  }
}

- (void)databaseController:(id)a3 reachabilityChanged:(BOOL)a4
{
  if (a4)
  {
    id v8 = [(BCCloudDataSyncManager *)self cloudKitController];
    v5 = [v8 transactionManager];
    id v6 = [(BCCloudDataSyncManager *)self delegate];
    id v7 = [v6 entityName];
    [v5 signalSyncToCKTransactionForEntityName:v7 syncManager:self];
  }
}

- (void)databaseController:(id)a3 recordsChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(BCCloudDataSyncManager *)self delegate];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004DE8C;
  v7[3] = &unk_100261018;
  v7[4] = self;
  [v6 syncManager:self resolveConflictsForRecords:v5 completion:v7];
}

- (void)databaseController:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v6 = a4;
  id v7 = [(BCCloudDataSyncManager *)self delegate];
  id v9 = v6;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];

  [v7 syncManager:self removeCloudDataForIDs:v8 completion:&stru_1002613A8];
}

- (void)databaseController:(id)a3 fetchedAllRecordsInZone:(id)a4
{
  id v8 = a4;
  id v5 = [(BCCloudDataSyncManager *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(BCCloudDataSyncManager *)self delegate];
    [v7 syncManager:self fetchedAllRecordsInZone:v8];
  }
}

- (id)privacyDelegate
{
  v2 = [(BCCloudDataSyncManager *)self cloudKitController];
  v3 = [v2 privateCloudDatabaseController];

  return v3;
}

- (void)startSyncToCKWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCloudDataSyncManager *)self syncQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E1F8;
  v7[3] = &unk_10025FF28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)signalSyncToCK
{
  id v3 = [(BCCloudDataSyncManager *)self delegate];
  [v3 signalSyncToCKForSyncManager:self];
}

- (unint64_t)_maxCloudDataPerBatch
{
  unint64_t v2 = [(BCCloudDataSyncManager *)self tooBigBatch];
  if (v2 >> 1 <= 1) {
    return 1;
  }
  else {
    return v2 >> 1;
  }
}

- (id)_batchFromCloudData:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BCCloudDataSyncManager *)self _maxCloudDataPerBatch];
  id v6 = v4;
  if ((unint64_t)[v4 count] > v5)
  {
    id v6 = objc_msgSend(v4, "subarrayWithRange:", 0, v5);
  }
  return v6;
}

- (void)_fromBatch:(id)a3 getRecordsToSave:(id *)a4 recordIDsToDelete:(id *)a5 buildingMap:(id *)a6
{
  id v7 = a3;
  id v35 = +[NSMutableArray array];
  id v34 = +[NSMutableArray array];
  id v8 = +[NSMutableDictionary dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v13);
        if ([v14 deletedFlag])
        {
          id v15 = [v14 systemFields];
          v16 = v15;
          if (v15)
          {
            v17 = [v15 recordID];
            v18 = [v8 objectForKey:v17];

            if (v18)
            {
              v19 = sub_1000083A0();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v14;
                v20 = v19;
                v21 = "BCCloudDataSyncManager: cloudDataMap already contans an entry for deleting %@";
                goto LABEL_22;
              }
            }
            else
            {
              v28 = [v16 recordID];
              [v8 setObject:v14 forKeyedSubscript:v28];

              v19 = [v16 recordID];
              [v34 addObject:v19];
            }
LABEL_24:

            goto LABEL_25;
          }
          v19 = sub_1000083A0();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_DWORD *)buf = 138412290;
          v41 = v14;
          v20 = v19;
          v21 = "BCCloudDataSyncManager: Unable to retrieve systemFields from %@";
LABEL_22:
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
          goto LABEL_24;
        }
        v22 = [(BCCloudDataSyncManager *)self dataMapper];

        if (v22)
        {
          v23 = [(BCCloudDataSyncManager *)self dataMapper];
          v16 = [v23 recordFromCloudData:v14];

          if (!v16) {
            goto LABEL_19;
          }
        }
        else
        {
          v16 = [v14 configuredRecordFromAttributes];
          if (!v16)
          {
LABEL_19:
            v26 = [v14 privacyDelegate];
            unsigned int v27 = [v26 establishedSalt];

            if (!v27) {
              goto LABEL_25;
            }
            v19 = sub_1000083A0();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              goto LABEL_24;
            }
            *(_DWORD *)buf = 138412290;
            v41 = v14;
            v20 = v19;
            v21 = "BCCloudDataSyncManager: Unable to configure CKRecord to save from %@";
            goto LABEL_22;
          }
        }
        v24 = [v16 recordID];
        v25 = [v8 objectForKey:v24];

        if (v25)
        {
          v19 = sub_1000083A0();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_DWORD *)buf = 138412290;
          v41 = v14;
          v20 = v19;
          v21 = "BCCloudDataSyncManager: cloudDataMap already contans an entry for saving %@";
          goto LABEL_22;
        }
        v29 = [v16 recordID];
        [v8 setObject:v14 forKeyedSubscript:v29];

        [v35 addObject:v16];
LABEL_25:

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v30 = [v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
      id v11 = v30;
    }
    while (v30);
  }

  if (a4) {
    *a4 = v35;
  }
  if (a5) {
    *a5 = v34;
  }
  if (a6) {
    *a6 = v8;
  }
}

- (void)_enterDispatchGroup:(id)a3 times:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    do
    {
      dispatch_group_enter((dispatch_group_t)a3);
      --v4;
    }
    while (v4);
  }
}

- (void)_leaveDispatchGroup:(id)a3 times:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    do
    {
      dispatch_group_leave((dispatch_group_t)a3);
      --v4;
    }
    while (v4);
  }
}

- (void)_updateRetryParametersFromModifyRecordsOperationError:(id)a3 batchSize:(unint64_t)a4
{
  id v21 = a3;
  id v6 = [(BCCloudDataSyncManager *)self syncQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [v21 domain];
  unsigned int v8 = [v7 isEqualToString:CKErrorDomain];

  id v9 = v21;
  if (v8)
  {
    objc_opt_class();
    id v10 = [v21 userInfo];
    id v11 = [v10 objectForKeyedSubscript:CKErrorRetryAfterKey];
    uint64_t v12 = BUDynamicCast();
    [v12 doubleValue];
    double v14 = v13;

    if (v14 <= 0.0)
    {
      id v15 = (char *)[v21 code];
      if ((unint64_t)(v15 - 6) < 2)
      {
LABEL_7:
        [(BCCloudDataSyncManager *)self backOffInterval];
        double v14 = 5.0;
        if (v17 >= 5.0)
        {
          [(BCCloudDataSyncManager *)self backOffInterval];
          double v14 = v18 + v18;
        }
        goto LABEL_13;
      }
      if (v15 != (char *)27)
      {
        BOOL v16 = v15 == (char *)23;
        id v9 = v21;
        if (!v16) {
          goto LABEL_14;
        }
        goto LABEL_7;
      }
      unint64_t v19 = [(BCCloudDataSyncManager *)self tooBigBatch];
      if (v19 >= a4) {
        unint64_t v20 = a4;
      }
      else {
        unint64_t v20 = v19;
      }
      [(BCCloudDataSyncManager *)self setTooBigBatch:v20];
      double v14 = 0.0;
    }
LABEL_13:
    [(BCCloudDataSyncManager *)self setBackOffInterval:v14];
    id v9 = v21;
  }
LABEL_14:
}

- (id)_modifyRecordsCompletionBlockWithDispatchGroup:(id)a3 cloudDataMap:(id)a4 recordCount:(unint64_t)a5 operation:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004ECE8;
  v18[3] = &unk_100261498;
  objc_copyWeak(v23, &location);
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  v22 = self;
  v23[1] = (id)a5;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  BOOL v16 = objc_retainBlock(v18);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  return v16;
}

- (void)_syncQueueSyncForCloudData:(id)a3 completion:(id)a4
{
  id v32 = a3;
  id v31 = a4;
  [(BCCloudDataSyncManager *)self setProcessingCloudData:1];
  id v6 = [(BCCloudDataSyncManager *)self cloudKitController];
  id v7 = [v6 privateCloudDatabaseController];

  if (v7)
  {
    v28 = [v7 database];
    unsigned int v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    id v30 = [(BCCloudDataSyncManager *)self _batchFromCloudData:v32];
    id v9 = [v30 count];
    BOOL v27 = v9 < [v32 count];
    id v10 = +[NSMutableArray array];
    id v11 = +[NSMutableArray array];
    id v12 = +[NSMutableDictionary dictionary];
    id v38 = v10;
    id v39 = v11;
    id v37 = v12;
    [(BCCloudDataSyncManager *)self _fromBatch:v30 getRecordsToSave:&v39 recordIDsToDelete:&v38 buildingMap:&v37];
    id v13 = v39;

    id v14 = v38;
    id v29 = v37;

    id v15 = (char *)[v13 count];
    BOOL v16 = &v15[(void)[v14 count]];
    [(BCCloudDataSyncManager *)self _enterDispatchGroup:v8 times:v16];
    if (v16)
    {
      id v17 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v13 recordIDsToDelete:v14];
      double v18 = +[CKOperationConfiguration bds_defaultConfiguration];
      [v17 setConfiguration:v18];

      [v17 setSavePolicy:0];
      id v19 = [(BCCloudDataSyncManager *)self _modifyRecordsCompletionBlockWithDispatchGroup:v8 cloudDataMap:v29 recordCount:v16 operation:v17];
      [v17 setModifyRecordsCompletionBlock:v19];

      id v20 = sub_1000083A0();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [(BCCloudDataSyncManager *)self delegate];
        v22 = [v21 entityName];
        v23 = [v17 operationID];
        *(_DWORD *)buf = 138543618;
        v41 = v22;
        __int16 v42 = 2114;
        v43 = v23;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Adding CKModifyRecordsOperation to database for: %{public}@.  Operation ID: %{public}@", buf, 0x16u);
      }
      [v28 addOperation:v17];
    }
    objc_initWeak((id *)buf, self);
    v24 = [(BCCloudDataSyncManager *)self syncQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000509C0;
    block[3] = &unk_1002614C0;
    objc_copyWeak(&v35, (id *)buf);
    BOOL v36 = v27;
    block[4] = self;
    id v34 = v31;
    dispatch_group_notify(v8, v24, block);

    dispatch_group_leave(v8);
    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(BCCloudDataSyncManager *)self setProcessingCloudData:0];
    id v25 = objc_retainBlock(v31);
    v26 = v25;
    if (v25) {
      (*((void (**)(id))v25 + 2))(v25);
    }
  }
}

- (BCCloudDataSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BCCloudDataSyncManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BCCloudKitController)cloudKitController
{
  return self->_cloudKitController;
}

- (void)setCloudKitController:(id)a3
{
}

- (BCCloudDataMapper)dataMapper
{
  return self->_dataMapper;
}

- (void)setDataMapper:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (BOOL)processingCloudData
{
  return self->_processingCloudData;
}

- (void)setProcessingCloudData:(BOOL)a3
{
  self->_processingCloudData = a3;
}

- (double)backOffInterval
{
  return self->_backOffInterval;
}

- (void)setBackOffInterval:(double)a3
{
  self->_backOffInterval = a3;
}

- (unint64_t)tooBigBatch
{
  return self->_tooBigBatch;
}

- (void)setTooBigBatch:(unint64_t)a3
{
  self->_tooBigBatch = a3;
}

- (BOOL)serverPushPostponed
{
  return self->_serverPushPostponed;
}

- (void)setServerPushPostponed:(BOOL)a3
{
  self->_serverPushPostponed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_dataMapper, 0);
  objc_storeStrong((id *)&self->_cloudKitController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end