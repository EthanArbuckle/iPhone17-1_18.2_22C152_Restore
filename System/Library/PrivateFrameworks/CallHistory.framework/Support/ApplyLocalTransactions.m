@interface ApplyLocalTransactions
+ (id)sortTransactionsByType:(id)a3;
- (ApplyLocalTransactions)initWithDatabase:(id)a3 andInteractionManager:(id)a4;
- (BOOL)deleteCallsWithIdentifiers:(id)a3;
- (BOOL)handleDelete:(id)a3;
- (BOOL)handleFingerprintDelete:(id)a3;
- (BOOL)handleInsert:(id)a3;
- (BOOL)handleInsert:(id)a3 withFingerprint:(id)a4;
- (id)executeBatchDeleteTransaction:(id)a3;
- (id)executeDeleteTransaction:(id)a3;
- (id)executeInsertTransaction:(id)a3;
- (void)apply:(id)a3;
- (void)executeUpdateTransaction:(id)a3;
- (void)handleUpdate:(id)a3;
@end

@implementation ApplyLocalTransactions

- (ApplyLocalTransactions)initWithDatabase:(id)a3 andInteractionManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ApplyLocalTransactions;
  v9 = [(ApplyLocalTransactions *)&v16 initWithDomain:"ApplyLocalTransactions"];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    v10->_sendReadUpdateNotification = 0;
    objc_storeStrong((id *)&v10->_interactionManager, a4);
    v11 = (CHFeatureFlags *)objc_alloc_init((Class)CHFeatureFlags);
    featureFlags = v10->_featureFlags;
    v10->_featureFlags = v11;

    uint64_t v13 = +[CHSpotlightIndexManager sharedInstance];
    spotlightIndexManager = v10->_spotlightIndexManager;
    v10->_spotlightIndexManager = (CHSpotlightIndexManager *)v13;
  }
  return v10;
}

+ (id)sortTransactionsByType:(id)a3
{
  return _[a3 sortedArrayUsingComparator:&stru_100048FC8];
}

- (void)apply:(id)a3
{
  id v4 = a3;
  v5 = [(ApplyLocalTransactions *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFStringRef v43 = (const __CFString *)[v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Applying %lu changes to our database", buf, 0xCu);
  }

  v6 = +[NSMutableArray array];
  id v7 = +[NSMutableArray array];
  v32 = v4;
  id v8 = +[ApplyLocalTransactions sortTransactionsByType:v4];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v14 = [v13 transactionType];
        if (v14)
        {
          if (v14 == (id)1)
          {
            [(ApplyLocalTransactions *)self executeUpdateTransaction:v13];
            continue;
          }
          if (v14 != (id)2) {
            continue;
          }
          v15 = [(ApplyLocalTransactions *)self executeDeleteTransaction:v13];
          objc_super v16 = v15;
          if (v15)
          {
            v17 = [v15 uniqueId];
            [v7 addObject:v17];
          }
        }
        else
        {
          objc_super v16 = [(ApplyLocalTransactions *)self executeInsertTransaction:v13];
          if (v16) {
            [v6 addObject:v16];
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v10);
  }
  database = self->_database;
  id v37 = 0;
  unsigned int v19 = [(CallHistoryDBClientHandleProtocol *)database saveDatabase:&v37];
  id v20 = v37;
  if (v19)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v21 = v6;
    id v22 = [v21 countByEnumeratingWithState:&v33 objects:v46 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v21);
          }
          [(InteractionProtocol *)self->_interactionManager donateCallHistoryInteractionWithCall:*(void *)(*((void *)&v33 + 1) + 8 * (void)j)];
        }
        id v23 = [v21 countByEnumeratingWithState:&v33 objects:v46 count:16];
      }
      while (v23);
    }

    [(InteractionProtocol *)self->_interactionManager deleteInteractionWithCalls:v7];
    if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
    {
      v26 = [(ApplyLocalTransactions *)self logHandle];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v27 = (const __CFString *)[v21 count];
        id v28 = [v7 count];
        *(_DWORD *)buf = 134218240;
        CFStringRef v43 = v27;
        __int16 v44 = 2048;
        id v45 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Applied transactions. Indexing %lu inserted calls and removing %lu deleted calls from index", buf, 0x16u);
      }

      [(CHSpotlightIndexManager *)self->_spotlightIndexManager indexInsertedCalls:v21];
      [(CHSpotlightIndexManager *)self->_spotlightIndexManager removeDeletedCalls:v7];
    }
  }
  else
  {
    v29 = [(ApplyLocalTransactions *)self logHandle];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10002E540();
    }
  }
  if (self->_sendReadUpdateNotification)
  {
    v30 = [(ApplyLocalTransactions *)self logHandle];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v43 = @"kCallHistoryDatabaseRemoteUpdateReadNotification";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Posting %{public}@ for unread -> read changes", buf, 0xCu);
    }

    v31 = +[NSDistributedNotificationCenter defaultCenter];
    [v31 postNotificationName:@"kCallHistoryDatabaseRemoteUpdateReadNotification" object:0 userInfo:0];

    self->_sendReadUpdateNotification = 0;
  }
}

- (BOOL)deleteCallsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = +[CHRecentCall predicateForCallsWithAnyUniqueIDs:v4];
  }
  else
  {
    v5 = 0;
  }
  v6 = [(ApplyLocalTransactions *)self logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to delete calls matching predicate %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [(CallHistoryDBClientHandleProtocol *)self->_database deleteCallsWithPredicate:v5];
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(ApplyLocalTransactions *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleted %ld calls", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7 != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)executeBatchDeleteTransaction:(id)a3
{
  id v4 = a3;
  if ([v4 transactionType] == (id)3)
  {
    v5 = [v4 record];
    id v12 = 0;
    v6 = +[CHRecentCall unarchivedObjectFromData:v5 error:&v12];
    id v7 = v12;

    id v8 = self;
    if (v6)
    {
      id v9 = 0;
      if ([(ApplyLocalTransactions *)v8 deleteCallsWithIdentifiers:0]) {
        id v9 = v6;
      }
    }
    else
    {
      int v10 = [(ApplyLocalTransactions *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002E5A8();
      }

      id v9 = 0;
    }
  }
  else
  {
    id v7 = [(ApplyLocalTransactions *)self logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002E610();
    }
    id v9 = 0;
  }

  return v9;
}

- (id)executeDeleteTransaction:(id)a3
{
  id v4 = a3;
  if ([v4 transactionType] == (id)2)
  {
    v5 = [v4 record];
    id v11 = 0;
    v6 = +[CHRecentCall unarchivedObjectFromData:v5 error:&v11];
    id v7 = v11;

    if (v6)
    {
      if ([(ApplyLocalTransactions *)self handleDelete:v6])
      {
        id v8 = v6;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      id v9 = [(ApplyLocalTransactions *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002E5A8();
      }
    }
    id v8 = 0;
    goto LABEL_12;
  }
  id v7 = [(ApplyLocalTransactions *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10002E678();
  }
  id v8 = 0;
LABEL_13:

  return v8;
}

- (id)executeInsertTransaction:(id)a3
{
  id v4 = a3;
  if (![v4 transactionType])
  {
    id v7 = [v4 record];
    id v11 = 0;
    id v8 = +[CHRecentCall unarchivedObjectFromData:v7 error:&v11];
    v5 = v11;

    if (v8)
    {
      if ([(ApplyLocalTransactions *)self handleInsert:v8])
      {
        id v6 = v8;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      id v9 = [(ApplyLocalTransactions *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002E5A8();
      }
    }
    id v6 = 0;
    goto LABEL_12;
  }
  v5 = [(ApplyLocalTransactions *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10002E6E0();
  }
  id v6 = 0;
LABEL_13:

  return v6;
}

- (void)executeUpdateTransaction:(id)a3
{
  id v4 = a3;
  if ([v4 transactionType] == (id)1)
  {
    v5 = [v4 record];
    id v9 = 0;
    id v6 = +[CHRecentCall unarchivedObjectFromData:v5 error:&v9];
    id v7 = v9;

    if (v6)
    {
      [(ApplyLocalTransactions *)self handleUpdate:v6];
    }
    else
    {
      id v8 = [(ApplyLocalTransactions *)self logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10002E5A8();
      }
    }
  }
  else
  {
    id v7 = [(ApplyLocalTransactions *)self logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002E748();
    }
  }
}

- (BOOL)handleInsert:(id)a3
{
  id v4 = a3;
  v5 = [(ApplyLocalTransactions *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueId];
    *(_DWORD *)buf = 138543362;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to fingerprint match call %{public}@", buf, 0xCu);
  }
  id v7 = +[CHCallFingerprint matchCallWithFingerprint:v4 usingDatabase:self->_database];
  if (v7)
  {
    id v8 = [(ApplyLocalTransactions *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 uniqueId];
      int v10 = [v4 uniqueId];
      *(_DWORD *)buf = 138543618;
      id v23 = v9;
      __int16 v24 = 2114;
      v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Matched already existing fingerprinted call %{public}@ with %{public}@", buf, 0x16u);
    }
    [(ApplyLocalTransactions *)self handleInsert:v4 withFingerprint:v7];
    unsigned __int8 v11 = 0;
  }
  else
  {
    if ([v4 callStatus] == 8 && (objc_msgSend(v4, "read") & 1) == 0)
    {
      id v12 = [(ApplyLocalTransactions *)self logHandle];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v4 uniqueId];
        *(_DWORD *)buf = 138543362;
        id v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Squashing unread --> read for missed call: %{public}@", buf, 0xCu);
      }
      [v4 setRead:1];
    }
    id v14 = [(ApplyLocalTransactions *)self logHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v4 uniqueId];
      *(_DWORD *)buf = 138543362;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Insert %{public}@", buf, 0xCu);
    }
    database = self->_database;
    id v21 = 0;
    unsigned __int8 v11 = [(CallHistoryDBClientHandleProtocol *)database createCallRecord:v4 error:&v21 save:0];
    id v17 = v21;
    v18 = v17;
    if ((v11 & 1) == 0 && v17)
    {
      unsigned int v19 = [(ApplyLocalTransactions *)self logHandle];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10002E7B0();
      }
    }
  }

  return v11;
}

- (BOOL)handleInsert:(id)a3 withFingerprint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[CHCallFingerprint shouldCall:v6 updateMatchingCall:v7])
  {
    uint64_t v8 = +[CHCallFingerprint updateCall:v6 withFingerprintedCall:v7];

    database = self->_database;
    int v10 = [v7 uniqueId];
    v15 = v10;
    uint64_t v16 = v8;
    unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v12 = [(CallHistoryDBClientHandleProtocol *)database updateCallRecordsWithCalls:v11 error:0 save:1];
    BOOL v13 = v12 != 0;

    id v6 = (id)v8;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)handleDelete:(id)a3
{
  id v4 = a3;
  v5 = [(ApplyLocalTransactions *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueId];
    *(_DWORD *)buf = 138543362;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Delete %{public}@", buf, 0xCu);
  }
  database = self->_database;
  uint64_t v8 = [v4 uniqueId];
  id v9 = [(CallHistoryDBClientHandleProtocol *)database fetchAllObjectsWithUniqueId:v8];

  id v10 = [v9 count];
  unsigned __int8 v11 = [(ApplyLocalTransactions *)self logHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v4 uniqueId];
    *(_DWORD *)buf = 134218242;
    id v29 = v10;
    __int16 v30 = 2114;
    v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found %lu calls for this %{public}@", buf, 0x16u);
  }
  if (v10)
  {
    id v22 = v4;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v9;
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      LODWORD(v17) = 1;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          unsigned int v19 = self->_database;
          id v20 = [*(id *)(*((void *)&v23 + 1) + 8 * i) uniqueId];
          LODWORD(v17) = [(CallHistoryDBClientHandleProtocol *)v19 deleteObjectWithUniqueId:v20 error:0 save:0] & v17;
        }
        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }
    else
    {
      LOBYTE(v17) = 1;
    }

    id v4 = v22;
  }
  else
  {
    uint64_t v17 = [(ApplyLocalTransactions *)self handleFingerprintDelete:v4];
  }

  return v17;
}

- (BOOL)handleFingerprintDelete:(id)a3
{
  id v4 = a3;
  v5 = [(ApplyLocalTransactions *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueId];
    int v15 = 138543362;
    uint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Matching call %{public}@ with a fingerprint", (uint8_t *)&v15, 0xCu);
  }
  id v7 = +[CHCallFingerprint matchCallWithFingerprint:v4 usingDatabase:self->_database];
  uint64_t v8 = [(ApplyLocalTransactions *)self logHandle];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = [v7 uniqueId];
      int v15 = 138543362;
      uint64_t v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing fingerprinted call %{public}@", (uint8_t *)&v15, 0xCu);
    }
    database = self->_database;
    uint64_t v8 = [v7 uniqueId];
    unsigned __int8 v12 = [(CallHistoryDBClientHandleProtocol *)database deleteObjectWithUniqueId:v8 error:0 save:0];
  }
  else
  {
    if (v9)
    {
      id v13 = [v4 uniqueId];
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Did not find fingerprinted call %{public}@ to delete", (uint8_t *)&v15, 0xCu);
    }
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (void)handleUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(ApplyLocalTransactions *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueId];
    *(_DWORD *)buf = 138543362;
    v71 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting update of local recent call with UUID %{public}@.", buf, 0xCu);
  }
  database = self->_database;
  uint64_t v8 = [v4 uniqueId];
  BOOL v9 = [(CallHistoryDBClientHandleProtocol *)database fetchObjectWithUniqueId:v8];

  if (v9)
  {
    id v10 = [(ApplyLocalTransactions *)self logHandle];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    unsigned __int8 v11 = [v9 uniqueId];
    *(_DWORD *)buf = 138543362;
    v71 = v11;
    unsigned __int8 v12 = "UUID matching found local recent call with UUID %{public}@.";
    goto LABEL_9;
  }
  BOOL v9 = +[CHCallFingerprint matchCallWithFingerprint:v4 usingDatabase:self->_database];
  id v10 = [(ApplyLocalTransactions *)self logHandle];
  BOOL v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v13) {
      goto LABEL_10;
    }
    unsigned __int8 v11 = [v9 uniqueId];
    *(_DWORD *)buf = 138543362;
    v71 = v11;
    unsigned __int8 v12 = "Fingerprint matching found local recent call with UUID %{public}@.";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);

LABEL_10:
    id v14 = +[NSMutableDictionary dictionary];
    id v15 = [v9 copy];
    uint64_t v16 = [v9 bytesOfDataUsed];
    uint64_t v17 = [v4 bytesOfDataUsed];
    unsigned __int8 v18 = (v16 | v17) == 0;
    if (v17) {
      unsigned __int8 v18 = [(id)v16 isEqual:v17];
    }

    if (v18) {
      goto LABEL_25;
    }
    unsigned int v19 = [v9 uniqueId];
    id v20 = [v4 uniqueId];
    unint64_t v21 = v19;
    unint64_t v22 = v20;
    long long v23 = (void *)v22;
    if (!(v21 | v22)) {
      goto LABEL_16;
    }
    if (v22)
    {
      unsigned __int8 v24 = [(id)v21 isEqual:v22];

      if (v24)
      {
LABEL_16:
        long long v25 = [v4 bytesOfDataUsed];
LABEL_22:

        __int16 v30 = [(ApplyLocalTransactions *)self logHandle];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = [v9 bytesOfDataUsed];
          *(_DWORD *)buf = 138543618;
          v71 = v31;
          __int16 v72 = 2114;
          double v73 = *(double *)&v25;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Updating bytes of data used from %{public}@ to %{public}@.", buf, 0x16u);
        }
        [v15 setBytesOfDataUsed:v25];

LABEL_25:
        [v9 duration];
        double v33 = v32;
        [v4 duration];
        if (v33 != v34)
        {
          [v9 duration];
          double v36 = v35;
          [v4 duration];
          double v38 = v36 + v37;
          long long v39 = [(ApplyLocalTransactions *)self logHandle];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            [v9 duration];
            *(_DWORD *)buf = 134218240;
            v71 = v40;
            __int16 v72 = 2048;
            double v73 = v38;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Updating duration used from %f to %f.", buf, 0x16u);
          }

          [v15 setDuration:v38];
        }
        unsigned int v41 = [v9 callStatus];
        if (v41 != [v4 callStatus])
        {
          v42 = v14;
          id v43 = [v4 callStatus];
          uint64_t v44 = [v9 uniqueId];
          uint64_t v45 = [v4 uniqueId];
          unsigned int v46 = (v44 | v45) == 0;
          if (v45) {
            unsigned int v46 = [(id)v44 isEqual:v45];
          }

          if (v46 && [v9 callStatus] != 4) {
            id v43 = [v4 callStatus];
          }
          v47 = [(ApplyLocalTransactions *)self logHandle];
          id v14 = v42;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v48 = +[CHRecentCall callStatusAsString:](CHRecentCall, "callStatusAsString:", [v9 callStatus]);
            v49 = +[CHRecentCall callStatusAsString:v43];
            *(_DWORD *)buf = 138543618;
            v71 = v48;
            __int16 v72 = 2114;
            double v73 = *(double *)&v49;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Updating call status from %{public}@ to %{public}@", buf, 0x16u);
          }
          [v15 setCallStatus:v43];
        }
        uint64_t v50 = [v9 outgoingLocalParticipantUUID];
        uint64_t v51 = [v4 outgoingLocalParticipantUUID];
        unsigned __int8 v52 = (v50 | v51) == 0;
        if (v51) {
          unsigned __int8 v52 = [(id)v50 isEqual:v51];
        }

        if ((v52 & 1) == 0)
        {
          v53 = [(ApplyLocalTransactions *)self logHandle];
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = [v9 outgoingLocalParticipantUUID];
            v55 = [v4 outgoingLocalParticipantUUID];
            *(_DWORD *)buf = 138543618;
            v71 = v54;
            __int16 v72 = 2114;
            double v73 = *(double *)&v55;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Updating outgoing local participant UUID from %{public}@ to %{public}@", buf, 0x16u);
          }
          v56 = [v4 outgoingLocalParticipantUUID];
          [v15 setOutgoingLocalParticipantUUID:v56];
        }
        unsigned int v57 = [v9 read];
        if (v57 != [v4 read])
        {
          v58 = [(ApplyLocalTransactions *)self logHandle];
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v59 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 read]);
            v60 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 read]);
            *(_DWORD *)buf = 138543618;
            v71 = v59;
            __int16 v72 = 2114;
            double v73 = *(double *)&v60;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Updating read state from %{public}@ to %{public}@.", buf, 0x16u);
          }
          objc_msgSend(v15, "setRead:", objc_msgSend(v4, "read"));
        }
        v61 = self->_database;
        v62 = [v9 uniqueId];
        v68 = v62;
        id v69 = v15;
        v63 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
        id v64 = [(CallHistoryDBClientHandleProtocol *)v61 updateCallRecordsWithCalls:v63 error:0 save:0];

        v65 = [v14 objectForKeyedSubscript:kCallUpdatePropertyRead];

        if (v65) {
          self->_sendReadUpdateNotification = 1;
        }

        goto LABEL_51;
      }
    }
    else
    {
    }
    objc_msgSend(v9, "bytesOfDataUsed", NSNumber);
    CFStringRef v27 = v67 = v14;
    unsigned int v28 = [v27 intValue];
    id v29 = [v4 bytesOfDataUsed];
    long long v25 = objc_msgSend(v66, "numberWithInt:", objc_msgSend(v29, "intValue") + v28);

    id v14 = v67;
    goto LABEL_22;
  }
  if (v13)
  {
    long long v26 = [v4 uniqueId];
    *(_DWORD *)buf = 138543362;
    v71 = v26;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Update aborted; did not find a local recent call that matches %{public}@.",
      buf,
      0xCu);
  }
  BOOL v9 = v10;
LABEL_51:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_spotlightIndexManager, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_interactionManager, 0);
}

@end